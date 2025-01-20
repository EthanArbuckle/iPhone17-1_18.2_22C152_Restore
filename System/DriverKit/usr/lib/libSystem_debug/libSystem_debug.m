void libSystem_initializer()
{
  if (!MEMORY[0xFFFFFC100]) {
    __libkernel_init();
  }
  kdebug_trace();
}

void libSystem_atfork_prepare()
{
}

void libSystem_atfork_parent()
{
}

void libSystem_atfork_child()
{
}

void *fill_msl_symbols(void *result)
{
  if (!&msl_initialize) {
    return 0;
  }
  *result = 1;
  result[1] = &msl_handle_memory_event;
  result[2] = &msl_stack_logging_locked;
  result[3] = &msl_fork_prepare;
  result[4] = &msl_fork_parent;
  result[5] = &msl_fork_child;
  v1 = off_8138;
  result[6] = &msl_set_flags_from_environment;
  result[7] = v1;
  result[8] = &msl_turn_on_stack_logging;
  result[9] = &msl_turn_off_stack_logging;
  result[11] = 0;
  result[12] = 0;
  result[10] = &msl_copy_msl_lite_hooks;
  return result;
}

int *__error(void)
{
  while (1)
    ;
}

void __libkernel_init()
{
  while (1)
    ;
}

void __libplatform_init()
{
  while (1)
    ;
}

void __malloc_init()
{
  while (1)
    ;
}

void __malloc_late_init()
{
  while (1)
    ;
}

void __pthread_init()
{
  while (1)
    ;
}

void _dyld_atfork_parent()
{
  while (1)
    ;
}

void _dyld_atfork_prepare()
{
  while (1)
    ;
}

void _dyld_dlopen_atfork_child()
{
  while (1)
    ;
}

void _dyld_dlopen_atfork_parent()
{
  while (1)
    ;
}

void _dyld_dlopen_atfork_prepare()
{
  while (1)
    ;
}

void _dyld_fork_child()
{
  while (1)
    ;
}

void _dyld_initializer()
{
  while (1)
    ;
}

void _libc_fork_child()
{
  while (1)
    ;
}

void _libc_fork_parent()
{
  while (1)
    ;
}

void _libc_fork_prepare()
{
  while (1)
    ;
}

void _libc_initializer()
{
  while (1)
    ;
}

void _libtrace_fork_child()
{
  while (1)
    ;
}

void _libtrace_init()
{
  while (1)
    ;
}

void _mach_fork_child()
{
  while (1)
    ;
}

void _malloc_fork_child()
{
  while (1)
    ;
}

void _malloc_fork_parent()
{
  while (1)
    ;
}

void _malloc_fork_prepare()
{
  while (1)
    ;
}

void _pthread_atfork_child()
{
  while (1)
    ;
}

void _pthread_atfork_child_handlers()
{
  while (1)
    ;
}

void _pthread_atfork_parent()
{
  while (1)
    ;
}

void _pthread_atfork_parent_handlers()
{
  while (1)
    ;
}

void _pthread_atfork_prepare()
{
  while (1)
    ;
}

void _pthread_atfork_prepare_handlers()
{
  while (1)
    ;
}

void cc_atfork_child()
{
  while (1)
    ;
}

void cc_atfork_parent()
{
  while (1)
    ;
}

void cc_atfork_prepare()
{
  while (1)
    ;
}

void dispatch_atfork_child()
{
  while (1)
    ;
}

void dispatch_atfork_parent()
{
  while (1)
    ;
}

void dispatch_atfork_prepare()
{
  while (1)
    ;
}

void dyld_get_program_sdk_version()
{
  while (1)
    ;
}

void kdebug_trace()
{
  while (1)
    ;
}

void libdispatch_init()
{
  while (1)
    ;
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  while (1)
    ;
}