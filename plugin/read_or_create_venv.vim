function ReadOrCreateVenv() abort
    echom('READ OR CREATE VENV')
    let s:virtual_env = getcwd() . '/.venv'
    if isdirectory(s:virtual_env)
        let $VIRTUAL_ENV = s:virtual_env
    else
        " virtual_envがない場合
        let s:python3 = system('which python3')
        let s:virtual_env = $HOME . '/.vim/vimvenv'
        if !isdirectory(s:virtual_env)
            echom('install vim virtualenv')
            call system('python3 -m venv ' . s:virtual_env)
        endif
        let $VIRTUAL_ENV = s:virtual_env
    endif

    let g:python3_host_prog = s:virtual_env . '/bin/python'
    let $PATH = s:virtual_env . '/bin:' . $PATH
    " call timer_start(0, s:istall_pip_package('pynvim'))
    " call timer_start(0, s:install_pip_package('mypy', v:true))
    " call timer_start(0, s:install_pip_package('flake8', v:true))

    let g:pythonpath = $PYTHONPATH
    if strlen(g:pythonpath) == 0
        let $PYTHONPATH = getcwd()
    endif
endfunction
