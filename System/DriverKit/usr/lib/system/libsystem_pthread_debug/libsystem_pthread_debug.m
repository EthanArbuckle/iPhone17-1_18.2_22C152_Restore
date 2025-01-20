uint64_t _pthread_globals_init(uint64_t result)
{
  unsigned __int8 i;

  for (i = 0; i < 7u; ++i)
  {
    *(_WORD *)(result + 272 + 2 * i) = -1;
    *(_WORD *)(result + 286 + 2 * i) = -1;
    *(_WORD *)(result + 300 + 2 * i) = -1;
  }
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  kern_return_t v2;

  v2 = 22;
  if (a1->__sig == 1414022209)
  {
    if (!*(_DWORD *)&a1->__opaque[40] || *(_DWORD *)&a1->__opaque[40] == -1)
    {
      a1->__sig = 0;
      return 0;
    }
    else
    {
      v2 = mach_port_mod_refs(mach_task_self_, *(_DWORD *)&a1->__opaque[40], 0, -1);
      if (!v2) {
        a1->__sig = 0;
      }
    }
  }
  return v2;
}

int pthread_attr_getdetachstate(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = a1->__opaque[32];
    return 0;
  }
  return v3;
}

int pthread_attr_getinheritsched(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE1(*(void *)&a1->__opaque[32]);
    return 0;
  }
  return v3;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if ((*(void *)&a1->__opaque[32] >> 24))
    {
      *a2 = *(sched_param *)&a1->__opaque[24];
    }
    else
    {
      a2->sched_priority = default_priority;
      *(_DWORD *)a2->__opaque = 10;
    }
    return 0;
  }
  return v3;
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE2(*(void *)&a1->__opaque[32]);
    return 0;
  }
  return v3;
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return 0;
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFFFFFF00 | a2;
    return 0;
  }
  return v3;
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)a2 << 8);
    return 0;
  }
  return v3;
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *(sched_param *)&a1->__opaque[24] = *a2;
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFEFFFFFFLL | 0x1000000;
    return 0;
  }
  return v3;
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2 || a2 == 4))
  {
    if (a2 != 2 && a2 != 4) {
      *(void *)&a1->__opaque[32] &= ~0x8000000uLL;
    }
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)a2 << 16);
    *(void *)&a1->__opaque[32] = *(void *)&a1->__opaque[32] & 0xFFFFFFFFFBFFFFFFLL | 0x4000000;
    return 0;
  }
  return v3;
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if (a2 == 1)
    {
      return 0;
    }
    else if (a2 == 2)
    {
      return 45;
    }
  }
  return v3;
}

int pthread_attr_getscope(const pthread_attr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = 1;
    return 0;
  }
  return v3;
}

int pthread_attr_getstackaddr(const pthread_attr_t *a1, void **a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = *(void **)&a1->__opaque[8];
    return 0;
  }
  return v3;
}

int pthread_attr_setstackaddr(pthread_attr_t *a1, void *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0)
  {
    *(void *)&a1->__opaque[8] = a2;
    *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(void *)a1->__opaque = 0;
    return 0;
  }
  return v3;
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }
  return v3;
}

uint64_t _pthread_attr_stacksize(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return *(void *)(a1 + 24);
  }
  else {
    return 0x80000;
  }
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0 && a2 >= 0x4000)
  {
    *(void *)&a1->__opaque[16] = a2;
    return 0;
  }
  return v3;
}

int pthread_attr_getstack(const pthread_attr_t *a1, void **a2, size_t *a3)
{
  int v4 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = (void *)(*(void *)&a1->__opaque[8] - *(void *)&a1->__opaque[16]);
    *a3 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }
  return v4;
}

int pthread_attr_setstack(pthread_attr_t *a1, void *a2, size_t a3)
{
  int v4 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0 && (a3 & vm_page_mask) == 0 && a3 >= 0x4000)
  {
    *(void *)&a1->__opaque[8] = (char *)a2 + a3;
    *(void *)&a1->__opaque[16] = a3;
    return 0;
  }
  return v4;
}

int pthread_attr_setguardsize(pthread_attr_t *a1, size_t a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0)
  {
    *(void *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(void *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_attr_getguardsize(const pthread_attr_t *a1, size_t *a2)
{
  int v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_guardsize((uint64_t)a1);
    return 0;
  }
  return v3;
}

vm_size_t _pthread_attr_guardsize(uint64_t a1)
{
  if ((*(void *)(a1 + 40) >> 28)) {
    return vm_page_size;
  }
  else {
    return *(void *)(a1 + 8);
  }
}

uint64_t pthread_attr_setcpupercent_np(void *a1, int a2, unint64_t a3)
{
  unsigned int v4 = 22;
  if (*a1 == 1414022209
    && a2 < 255
    && a3 < 0x1FFFFFF
    && ((a1[5] >> 26) & 1) != 0
    && (BYTE2(a1[5]) == 2 || BYTE2(a1[5]) == 4))
  {
    a1[5] = a1[5] & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)a2 << 32);
    a1[5] = a1[5] & 0xFFFFFFFFFFLL | ((a3 & 0xFFFFFF) << 40);
    a1[5] = a1[5] & 0xFFFFFFFFF7FFFFFFLL | 0x8000000;
    return 0;
  }
  return v4;
}

uint64_t pthread_attr_setworkinterval_np(uint64_t a1, mach_port_name_t a2)
{
  unsigned int v3 = 22;
  if (*(void *)a1 == 1414022209)
  {
    if (a2)
    {
      if (a2 != -1)
      {
        unsigned int v3 = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
        if (!v3) {
          *(_DWORD *)(a1 + 48) = a2;
        }
      }
    }
  }
  return v3;
}

uint64_t _pthread_deallocate(uint64_t result, char a2)
{
  uint64_t v2 = result;
  if (result != _main_thread_ptr)
  {
    if ((a2 & 1) == 0) {
      _pthread_introspection_thread_destroy(result);
    }
    result = mach_vm_deallocate(mach_task_self_, *(void *)(v2 + 192), *(void *)(v2 + 200));
    if (result)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Unable to deallocate stack";
      qword_2C058 = (int)result;
      __break(1u);
      JUMPOUT(0x243CLL);
    }
  }
  return result;
}

uint64_t _pthread_introspection_thread_destroy(uint64_t result)
{
  if (_pthread_introspection_hook) {
    return _pthread_introspection_hook_callout_thread_destroy(result);
  }
  return result;
}

void _pthread_start(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if ((HIBYTE(a6) >> 5))
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: kernel without PTHREAD_START_SUSPENDED support";
    qword_2C058 = a6;
    __break(1u);
    JUMPOUT(0x2518);
  }
  if ((a6 & 0x10000000) == 0)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_2C058 = a6;
    __break(1u);
    JUMPOUT(0x2560);
  }
  BOOL v8 = 0;
  if (a2) {
    BOOL v8 = a2 != -1;
  }
  if (!v8)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: MACH_PORT_VALID(kport)";
    __break(1u);
    JUMPOUT(0x25BCLL);
  }
  if (*(_DWORD *)(a1 + 248) != a2)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: _pthread_tsd_slot(self, MACH_THREAD_SELF) == kport";
    __break(1u);
    JUMPOUT(0x2600);
  }
  if ((*(void *)a1 ^ _pthread_ptr_munge_token) != a1) {
    abort_with_reason();
  }
  _pthread_markcancel_if_canceled(a1);
  *(void *)(a1 + 216) = __thread_selfid();
  if (*(void *)(a1 + 216) == -1)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x26F8);
  }
  unsigned int v10 = *(_DWORD *)(a1 + 248);
  BOOL v7 = 0;
  if (v10) {
    BOOL v7 = v10 != -1;
  }
  if (!v7)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_2C058 = v10;
    __break(1u);
    JUMPOUT(0x2780);
  }
  _pthread_introspection_thread_start((void *)a1);
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 144))(*(void *)(a1 + 152));
  _pthread_exit(a1, v6);
}

void _pthread_exit(unint64_t a1, uint64_t a2)
{
  __disable_threadsignal();
  _pthread_setcancelstate_exit(a1);
  while (1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (!v2) {
      break;
    }
    (*(void (**)(void))v2)(*(void *)(v2 + 8));
    *(void *)(a1 + 8) = *(void *)(v2 + 16);
  }
  _pthread_tsd_cleanup(a1);
  uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72);
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72) = 0;
  if (v5) {
    _os_semaphore_dispose();
  }
  _pthread_terminate_invoke(a1, a2);
  pthread_is_threaded_np();
}

int pthread_is_threaded_np(void)
{
  return __is_threaded;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  pthread_t v3 = a1;
  mach_port_t v2 = 0;
  pthread_t v7 = a1;
  uint64_t v6 = &v2;
  mach_port_t v5 = 0;
  char v4 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v11 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224))
  {
    pthread_t v9 = v7;
    uint64_t v8 = 0;
    uint64_t v8 = v7->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v8 != v7) {
      abort_with_reason();
    }
    char v4 = 1;
    mach_port_t v5 = *(_DWORD *)&v7->__opaque[232];
  }
  else
  {
    v13 = (int *)v7;
    i = 0;
    if (v7)
    {
      v17 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options();
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          v18 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v14 = 0;
          goto LABEL_15;
        }
        if (i == v13) {
          break;
        }
      }
      v16 = i;
      uint64_t v15 = 0;
      uint64_t v15 = *(void *)i ^ _pthread_ptr_munge_token;
      if ((int *)v15 != i) {
        abort_with_reason();
      }
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
    }
LABEL_15:
    if (v14)
    {
      mach_port_t v5 = *(_DWORD *)&v7->__opaque[232];
      char v4 = 1;
      os_unfair_lock_t lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      char v4 = 0;
    }
  }
  if (v6) {
    *uint64_t v6 = v5;
  }
  return v2;
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  os_unfair_lock_lock_with_options();
  for (i = __pthread_head; i && i[62] != a1; i = (int *)*((void *)i + 2))
    ;
  os_unfair_lock_unlock(&_pthread_list_lock);
  return (pthread_t)i;
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  size_t v3 = 0;
  if (!a1) {
    return 3;
  }
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr)
  {
    size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
  }
  else
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v7 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1) {
        break;
      }
    }
    if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
      abort_with_reason();
    }
    char v7 = 1;
LABEL_14:
    if (v7)
    {
      size_t v3 = *(void *)&a1->__opaque[160] - *(void *)&a1->__opaque[168];
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
  }
  if (v3) {
    return v3;
  }
  else {
    return 0x80000;
  }
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr) {
    return *(void **)&a1->__opaque[160];
  }
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v6 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1) {
        break;
      }
    }
    if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
      abort_with_reason();
    }
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
  }
LABEL_14:
  if ((v6 & 1) == 0) {
    return &def_10BC8 + 3;
  }
  mach_port_t v2 = *(void **)&a1->__opaque[160];
  os_unfair_lock_unlock(&_pthread_list_lock);
  return v2;
}

uint64_t pthread_main_thread_np()
{
  return _main_thread_ptr;
}

int pthread_main_np(void)
{
  unint64_t v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return v0 == _main_thread_ptr;
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  int v4 = 0;
  unint64_t v3 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if (!a2) {
    return 22;
  }
  if (a1 && a1 != (pthread_t)v3)
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v9 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1) {
        break;
      }
    }
    if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
      abort_with_reason();
    }
    char v9 = 1;
LABEL_14:
    if (v9)
    {
      *a2 = *(void *)&a1->__opaque[200];
      if (!*a2) {
        int v4 = _pthread_threadid_slow((uint64_t)a1, a2);
      }
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      return 3;
    }
  }
  else
  {
    *a2 = *(void *)(v3 + 216);
  }
  return v4;
}

uint64_t _pthread_threadid_slow(uint64_t a1, void *a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  mach_msg_type_number_t thread_info_outCnt = 6;
  thread_inspect_t v6 = 0;
  thread_inspect_t v6 = *(_DWORD *)(a1 + 248);
  *(void *)thread_info_out = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if (thread_info(v6, 4u, thread_info_out, &thread_info_outCnt) || !*(void *)thread_info_out)
  {
    return 22;
  }
  else
  {
    *uint64_t v8 = *(void *)thread_info_out;
    *(void *)(v9 + 216) = *(void *)thread_info_out;
    return 0;
  }
}

uint64_t pthread_cpu_number_np(unint64_t *a1)
{
  if (a1)
  {
    *a1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    return 0;
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    _platform_strlcpy();
    return 0;
  }
  else
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options();
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v7 = 0;
          goto LABEL_13;
        }
        if (i == (int *)a1) {
          break;
        }
      }
      if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
        abort_with_reason();
      }
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
    }
LABEL_13:
    if (v7)
    {
      _platform_strlcpy();
      os_unfair_lock_unlock(&_pthread_list_lock);
      return 0;
    }
    else
    {
      return 3;
    }
  }
}

int pthread_setname_np(const char *a1)
{
  unint64_t v3 = (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  uint64_t v2 = 0;
  if (a1) {
    uint64_t v2 = _platform_strlen();
  }
  if ((void *)(*v3 ^ _pthread_ptr_munge_token) != v3) {
    abort_with_reason();
  }
  getpid();
  int v4 = __proc_info();
  if (!v4)
  {
    if (v2) {
      _platform_strlcpy();
    }
    else {
      _platform_bzero();
    }
  }
  return v4;
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 0);
}

uint64_t _pthread_create(mach_vm_address_t *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  v17 = a1;
  v16 = a2;
  uint64_t v15 = a3;
  uint64_t v14 = a4;
  int v13 = a5;
  mach_vm_address_t v12 = 0;
  char v11 = 0;
  uint64_t v10 = a5 & 1;
  mach_port_name_t name = 0;
  unsigned int v8 = 0;
  if (a2)
  {
    if (*(void *)v16 != 1414022209) {
      return 22;
    }
  }
  else
  {
    v16 = "ADHT";
  }
  int v7 = 0x1000000;
  if ((*((_DWORD *)v16 + 10) & 0x1000000) != 0)
  {
    uint64_t v6 = 0;
    v20 = v16;
    v19 = &v6;
    if ((*((_DWORD *)v16 + 10) & 0x1000000) != 0)
    {
      uint64_t *v19 = *((void *)v20 + 4);
    }
    else
    {
      *(_DWORD *)v19 = default_priority;
      *((_DWORD *)v19 + 1) = 10;
    }
    v7 |= 0x2000000u;
    v7 |= *((unsigned __int8 *)v16 + 42) << 16;
    v7 |= (unsigned __int16)v6;
  }
  else if (*((void *)v16 + 4))
  {
    v7 |= 0x8000000 | *((_DWORD *)v16 + 8) & 0xFFFFFF;
  }
  if ((v13 & 2) != 0) {
    v7 |= 0x20000000u;
  }
  __is_threaded = 1;
  mach_vm_address_t v12 = _pthread_allocate((uint64_t)v16, (mach_vm_address_t *)((char *)&v10 + 1), v10 & 1);
  if (v12)
  {
    if (v10)
    {
      mach_port_name_t name = mach_thread_self();
    }
    else
    {
      uint64_t v21 = 3;
      uint64_t v25 = 3;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      mach_port_name_t name = *(void *)(StatusReg + 24);
    }
    *(void *)(v12 + 152) = v14;
    *(void *)(v12 + 144) = v15;
    mach_vm_address_t v29 = v12;
    mach_port_name_t v28 = name;
    char v27 = v10 & 1;
    v35 = &_pthread_list_lock;
    mach_port_name_t v34 = name;
    os_unfair_lock_lock_no_tsd();
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = off_30008;
    *off_30008 = (int *)v29;
    off_30008 = (int **)(v29 + 16);
    ++_pthread_count;
    v39 = &_pthread_list_lock;
    mach_port_name_t v38 = v28;
    os_unfair_lock_unlock_no_tsd();
    if ((v27 & 1) == 0) {
      _pthread_introspection_thread_create(v29);
    }
    if (__bsdthread_create() == -1)
    {
      uint64_t v22 = 1;
      uint64_t v23 = 1;
      unint64_t v24 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      if (**(_DWORD **)(v24 + 8) == 24)
      {
        qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
        __break(1u);
        JUMPOUT(0x3CA8);
      }
      mach_vm_address_t v31 = v12;
      mach_port_name_t v30 = name;
      v33 = &_pthread_list_lock;
      mach_port_name_t v32 = name;
      os_unfair_lock_lock_no_tsd();
      if (*(void *)(v31 + 16)) {
        *(void *)(*(void *)(v31 + 16) + 24) = *(void *)(v31 + 24);
      }
      else {
        off_30008 = *(int ***)(v31 + 24);
      }
      **(void **)(v31 + 24) = *(void *)(v31 + 16);
      --_pthread_count;
      v37 = &_pthread_list_lock;
      mach_port_name_t v36 = v30;
      os_unfair_lock_unlock_no_tsd();
      _pthread_deallocate(v12, v10 & 1);
      mach_vm_address_t v12 = 0;
      unsigned int v8 = 35;
    }
    if (v10) {
      mach_port_deallocate(mach_task_self_, name);
    }
    mach_vm_address_t *v17 = v12;
    return v8;
  }
  else
  {
    return 35;
  }
}

int pthread_create_from_mach_thread(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 1);
}

int pthread_create_suspended_np(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 2);
}

uint64_t pthread_install_workgroup_functions_np(uint64_t result)
{
  if (_pthread_workgroup_functions)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions already installed";
    qword_2C058 = _pthread_workgroup_functions;
    __break(1u);
    JUMPOUT(0x3EC0);
  }
  _pthread_workgroup_functions = result;
  return result;
}

uint64_t pthread_create_with_workgroup_np(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!_pthread_workgroup_functions)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions not yet installed";
    __break(1u);
    JUMPOUT(0x3F2CLL);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(_pthread_workgroup_functions + 8))(a1, a2, a3, a4, a5);
}

int pthread_detach(pthread_t a1)
{
  int v4 = 0;
  char v3 = 0;
  char v2 = 0;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v9 = 0;
        goto LABEL_11;
      }
      if (i == (int *)a1) {
        break;
      }
    }
    if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
      abort_with_reason();
    }
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
  }
LABEL_11:
  if ((v9 & 1) == 0) {
    return 3;
  }
  if (a1->__opaque[33])
  {
    if (*(_DWORD *)&a1->__opaque[36] == -1)
    {
      char v3 = 1;
    }
    else
    {
      a1->__opaque[33] &= ~1u;
      if (*(void *)&a1->__opaque[16])
      {
        _pthread_joiner_prepost_wake((uint64_t)a1);
        char v2 = 1;
      }
    }
  }
  else
  {
    int v4 = 22;
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  if (v3)
  {
    pthread_join_NOCANCEL((uint64_t)a1, 0);
  }
  else if (v2)
  {
    _pthread_joiner_wake();
  }
  return v4;
}

uint64_t _pthread_joiner_wake()
{
  while (1)
  {
    uint64_t result = __ulock_wake();
    if (!result || result == -2) {
      break;
    }
    if (result != -4)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: pthread_join() wake failure";
      qword_2C058 = -(int)result;
      __break(1u);
      JUMPOUT(0x42C0);
    }
  }
  return result;
}

int pthread_kill(pthread_t a1, int a2)
{
  pthread_t v6 = a1;
  int v5 = a2;
  if (a2 < 0 || v5 > 32) {
    return 22;
  }
  int v4 = 0;
  pthread_t v11 = v6;
  uint64_t v10 = &v4;
  int v9 = 0;
  char v8 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v15 = StatusReg;
  if (v6 == (pthread_t)(StatusReg - 224))
  {
    pthread_t v13 = v11;
    uint64_t v12 = 0;
    uint64_t v12 = v11->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v12 != v11) {
      abort_with_reason();
    }
    char v8 = 1;
    int v9 = *(_DWORD *)&v11->__opaque[232];
  }
  else
  {
    v17 = (int *)v11;
    i = 0;
    if (v11)
    {
      uint64_t v21 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options();
      for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
      {
        if (!i)
        {
          uint64_t v22 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          char v18 = 0;
          goto LABEL_18;
        }
        if (i == v17) {
          break;
        }
      }
      v20 = i;
      uint64_t v19 = 0;
      uint64_t v19 = *(void *)i ^ _pthread_ptr_munge_token;
      if ((int *)v19 != i) {
        abort_with_reason();
      }
      char v18 = 1;
    }
    else
    {
      char v18 = 0;
    }
LABEL_18:
    if (v18)
    {
      int v9 = *(_DWORD *)&v11->__opaque[232];
      char v8 = 1;
      os_unfair_lock_t lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      char v8 = 0;
    }
  }
  if (v10) {
    *uint64_t v10 = v9;
  }
  if ((v8 & 1) == 0) {
    return 3;
  }
  int v3 = __pthread_kill();
  if (v3 == -1)
  {
    uint64_t v24 = 1;
    uint64_t v25 = 1;
    unint64_t v26 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    return **(_DWORD **)(v26 + 8);
  }
  return v3;
}

uint64_t __pthread_workqueue_setkill()
{
  return __bsdthread_ctl();
}

void pthread_exit(void *a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v1 = (void *)(StatusReg - 224);
  if ((*(_WORD *)(StatusReg - 146) & 0x400) != 0)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_exit() called from a thread not created by pthread_create()";
    __break(1u);
    JUMPOUT(0x46F8);
  }
  if ((void *)(*v1 ^ _pthread_ptr_munge_token) != v1) {
    abort_with_reason();
  }
  _pthread_exit((unint64_t)v1, (uint64_t)a1);
}

BOOL pthread_self_is_exiting_np()
{
  return (*(_WORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 58) & 0x20) != 0;
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        char v10 = 0;
        goto LABEL_11;
      }
      if (i == (int *)a1) {
        break;
      }
    }
    if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
      abort_with_reason();
    }
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
LABEL_11:
  if ((v10 & 1) == 0) {
    return 3;
  }
  if (a2) {
    *a2 = a1->__opaque[32];
  }
  if (a3) {
    *a3 = *(sched_param *)&a1->__opaque[40];
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  return 0;
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  kern_return_t v38;
  mach_msg_type_number_t v39;
  policy_base_t v40;
  uint64_t v41;
  uint64_t v42;
  const sched_param *v43;
  policy_t v44;
  thread_act_t v45;
  pthread_t v46;
  int v47;
  unint64_t StatusReg;
  unint64_t v49;

  pthread_t v9 = a1;
  int v8 = a2;
  int v7 = a3;
  thread_act_t v6 = 0;
  int v5 = 1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v23 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224) || v9 == (pthread_t)_main_thread_ptr)
  {
    pthread_t v12 = v9;
    uint64_t v11 = 0;
    uint64_t v11 = v9->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v11 != v9) {
      abort_with_reason();
    }
    thread_act_t v6 = *(_DWORD *)&v9->__opaque[232];
  }
  else
  {
    int v5 = 0;
    pthread_t v16 = v9;
    unint64_t v15 = &v6;
    thread_act_t v14 = 0;
    char v13 = 0;
    v49 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v22 = v49;
    if (v9 == (pthread_t)(v49 - 224))
    {
      pthread_t v18 = v16;
      uint64_t v17 = 0;
      uint64_t v17 = v16->__sig ^ _pthread_ptr_munge_token;
      if ((pthread_t)v17 != v16) {
        abort_with_reason();
      }
      char v13 = 1;
      thread_act_t v14 = *(_DWORD *)&v16->__opaque[232];
    }
    else
    {
      uint64_t v25 = (int *)v16;
      i = 0;
      if (v16)
      {
        mach_vm_address_t v29 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options();
        for (i = __pthread_head; ; i = (int *)*((void *)i + 2))
        {
          if (!i)
          {
            mach_port_name_t v30 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            char v26 = 0;
            goto LABEL_20;
          }
          if (i == v25) {
            break;
          }
        }
        mach_port_name_t v28 = i;
        uint64_t v27 = 0;
        uint64_t v27 = *(void *)i ^ _pthread_ptr_munge_token;
        if ((int *)v27 != i) {
          abort_with_reason();
        }
        char v26 = 1;
      }
      else
      {
        char v26 = 0;
      }
LABEL_20:
      if (v26)
      {
        thread_act_t v14 = *(_DWORD *)&v16->__opaque[232];
        char v13 = 1;
        os_unfair_lock_t lock = &_pthread_list_lock;
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
      else
      {
        char v13 = 0;
      }
    }
    if (v15) {
      *unint64_t v15 = v14;
    }
    if ((v13 & 1) == 0) {
      return 3;
    }
  }
  v46 = v9;
  v45 = v6;
  v44 = v8;
  v43 = v7;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v39 = 0;
  mach_port_name_t v38 = 0;
  if (((*(_WORD *)&v9->__opaque[62] >> 10) & 1) == 0)
  {
    switch(v44)
    {
      case 1:
        LODWORD(v41) = v43->sched_priority;
        v40 = (policy_base_t)&v41;
        v39 = 1;
        break;
      case 2:
        HIDWORD(v41) = v43->sched_priority;
        LODWORD(v42) = *(_DWORD *)v43->__opaque;
        v40 = (policy_base_t)&v41 + 1;
        v39 = 2;
        break;
      case 4:
        HIDWORD(v42) = v43->sched_priority;
        v40 = (policy_base_t)&v42 + 1;
        v39 = 1;
        break;
      default:
        v47 = 22;
        goto LABEL_40;
    }
    mach_port_name_t v38 = thread_policy(v45, v44, v40, v39, 1);
    if (v38) {
      int v3 = 22;
    }
    else {
      int v3 = 0;
    }
    v47 = v3;
    goto LABEL_40;
  }
  v47 = 45;
LABEL_40:
  if (!v47)
  {
    if (v5)
    {
      uint64_t v19 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options();
    }
    else
    {
      mach_port_name_t v32 = (int *)v9;
      j = 0;
      if (v9)
      {
        mach_port_name_t v36 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options();
        for (j = __pthread_head; ; j = (int *)*((void *)j + 2))
        {
          if (!j)
          {
            v37 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            char v33 = 0;
            goto LABEL_54;
          }
          if (j == v32) {
            break;
          }
        }
        v35 = j;
        uint64_t v34 = 0;
        uint64_t v34 = *(void *)j ^ _pthread_ptr_munge_token;
        if ((int *)v34 != j) {
          abort_with_reason();
        }
        char v33 = 1;
      }
      else
      {
        char v33 = 0;
      }
LABEL_54:
      if ((v33 & 1) == 0) {
        return 3;
      }
    }
    v9->__opaque[32] = v8;
    *(sched_param *)&v9->__opaque[40] = *v7;
    os_unfair_lock_t v21 = &_pthread_list_lock;
    os_unfair_lock_unlock(&_pthread_list_lock);
    return 0;
  }
  return v47;
}

int sched_get_priority_min(int a1)
{
  return default_priority - 16;
}

int sched_get_priority_max(int a1)
{
  return default_priority + 16;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return a1 == a2;
}

uint64_t _pthread_set_self(uint64_t a1)
{
  *(void *)(a1 + 216) = __thread_selfid();
  if (*(void *)(a1 + 216) == -1)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x524CLL);
  }
  return _thread_set_tsd_base();
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  int v4 = a1;
  v3[2] = a2;
  v3[0] = a1;
  v3[1] = a2;
  do
  {
    opaque = v4->__opaque;
    pthread_t v9 = v3;
    int v8 = __pthread_once_handler;
    unint64_t v7 = 0;
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)v4->__opaque, memory_order_acquire);
    unint64_t v7 = explicit;
    unint64_t v5 = explicit;
    if (explicit != -1) {
      _os_once();
    }
  }
  while (v4->__sig == 816954554);
  return 0;
}

uint64_t __pthread_once_handler(uint64_t a1)
{
  uint64_t v8 = a1;
  uint64_t v7 = a1;
  int v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v9 = StatusReg;
  unint64_t v3 = StatusReg - 224;
  char v2 = 0;
  if (&__os_once_reset) {
    char v2 = &__os_once_reset;
  }
  int v4 = v2;
  uint64_t v5 = *(void *)v7 + 8;
  uint64_t v6 = *(void *)(StatusReg - 216);
  *(void *)(StatusReg - 216) = &v4;
  uint64_t result = (*(uint64_t (**)(void))(v7 + 8))();
  *(void *)(v3 + 8) = v6;
  **(void **)uint64_t v7 = 1330529093;
  return result;
}

int pthread_getconcurrency(void)
{
  return pthread_concurrency;
}

int pthread_setconcurrency(int a1)
{
  if (a1 < 0) {
    return 22;
  }
  pthread_concurrency = a1;
  return 0;
}

uint64_t __pthread_init(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  kern_return_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  int v48;
  int v49;
  char v50;
  unint64_t StatusReg;

  char v26 = a1;
  uint64_t v25 = a2;
  uint64_t v24 = a3;
  unint64_t v23 = a4;
  if (a1)
  {
    exitf = (uint64_t (*)(void))v26[1];
    if (*v26 >= 2uLL)
    {
      _pthread_malloc = (uint64_t (*)(void))v26[2];
      _pthread_free = (uint64_t (*)(void))v26[3];
    }
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v27 = StatusReg;
  unint64_t v22 = StatusReg - 224;
  if (StatusReg == 224)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: PTHREAD_SELF TSD not initialized";
    __break(1u);
    JUMPOUT(0x55B0);
  }
  _main_thread_ptr = v22;
  mach_vm_address_t v29 = v22;
  mach_port_name_t v28 = v22;
  *(void *)unint64_t v22 = v22 ^ _pthread_ptr_munge_token;
  os_unfair_lock_t v21 = 0;
  host_flavor_t flavor = 5;
  mach_msg_type_number_t host_info_outCnt = 8;
  long long v18 = 0u;
  long long host_info_out = 0u;
  host_t host = mach_host_self();
  os_unfair_lock_t v21 = host_info(host, flavor, (host_info_t)&host_info_out, &host_info_outCnt);
  if (v21)
  {
    v15[1] = v21;
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: host_info() failed";
    qword_2C058 = v21;
    __break(1u);
    JUMPOUT(0x569CLL);
  }
  default_priority = BYTE12(host_info_out);
  min_priority = BYTE8(v18);
  max_priority = BYTE12(v18);
  mach_port_deallocate(mach_task_self_, host);
  v15[0] = 0;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  if (!parse_main_stack_params(v24, v15, &v14, &v13, &v12) || !v15[0] || !v14)
  {
    uint64_t v11 = 8;
    uint64_t v10 = 0x3B00000001;
    if (__sysctl()) {
      v15[0] = 0x16FE00000;
    }
    uint64_t v14 = 1032192;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  parse_ptr_munge_params(v25, v24);
  mach_port_name_t v30 = 0;
  v50 = 4;
  v49 = 0;
  v48 = 0;
  v47 = 2303;
  mach_port_name_t v36 = v22;
  v35 = "ADHT";
  uint64_t v34 = v15[0];
  char v33 = v14;
  mach_port_name_t v32 = v13;
  mach_vm_address_t v31 = v12;
  v40 = v22;
  v39 = v22;
  *(void *)unint64_t v22 = v22 ^ _pthread_ptr_munge_token;
  *(void *)(v36 + 224) = v36;
  *(void *)(v36 + 232) = v36 + 172;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    v46 = 0;
    v45 = 0;
    v44 = 0;
    v43 = 0;
    *(void *)(v36 + 256) = 0;
  }
  else
  {
    *(void *)(v36 + 256) = *((void *)v35 + 4);
  }
  *(void *)(v36 + 280) = _pthread_ptr_munge_token;
  *(unsigned char *)(v36 + 49) = *(unsigned char *)(v36 + 49) & 0xFB | (4 * (*((void *)v35 + 2) != 0));
  v42 = v36 + 72;
  v41 = 0;
  *(_DWORD *)(v36 + 72) = 0;
  *(void *)(v36 + 176) = v34;
  *(void *)(v36 + 184) = v34 - v33;
  *(void *)(v36 + 192) = v32;
  *(void *)(v36 + 200) = v31;
  vm_size_t v4 = _pthread_attr_guardsize((uint64_t)v35);
  *(void *)(v36 + 208) = v4;
  *(unsigned char *)(v36 + 49) = *(unsigned char *)(v36 + 49) & 0xFE | (v35[40] == 1);
  *(unsigned char *)(v36 + 78) = v35[41];
  *(unsigned char *)(v36 + 48) = BYTE2(*((void *)v35 + 5));
  *(_WORD *)(v36 + 78) = *(_WORD *)(v36 + 78) & 0xFDFF | ((v35[43] & 1) << 9);
  mach_port_name_t v38 = v35;
  v37 = v36 + 56;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    *(void *)v37 = *((void *)v38 + 4);
  }
  else
  {
    *(_DWORD *)v37 = default_priority;
    *(_DWORD *)(v37 + 4) = 10;
  }
  *(_WORD *)(v36 + 166) = 3;
  *(unsigned char *)(v22 + 49) |= 1u;
  int v9 = 0;
  parse_main_thread_port(v24, &v9);
  _pthread_main_thread_init(v22, v9);
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  _pthread_bsdthread_init((uint64_t)v7);
  _pthread_key_global_init();
  _pthread_mutex_global_init(v25, (uint64_t)v7);
  uint64_t v6 = (unsigned char *)_simple_getenv();
  if (v6) {
    pthread_yield_to_zero = *v6 == 49;
  }
  return 0;
}

uint64_t parse_main_stack_params(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v17 = a1;
  pthread_t v16 = a2;
  unint64_t v15 = a3;
  uint64_t v14 = a4;
  uint64_t v13 = a5;
  uint64_t v12 = (char *)_simple_getenv();
  if (v12)
  {
    unsigned int v11 = 0;
    uint64_t v10 = v12;
    uint64_t v5 = _pthread_strtoul(v12, &v10, 16);
    uint64_t *v16 = v5;
    if (*v10 == 44)
    {
      uint64_t v6 = _pthread_strtoul(v10 + 1, &v10, 16);
      *unint64_t v15 = v6;
      if (*v10 == 44)
      {
        uint64_t v7 = _pthread_strtoul(v10 + 1, &v10, 16);
        *uint64_t v14 = v7;
        if (*v10 == 44)
        {
          uint64_t v8 = _pthread_strtoul(v10 + 1, &v10, 16);
          uint64_t *v13 = v8;
          if (*v10 == 44 || !*v10) {
            unsigned int v11 = 1;
          }
        }
      }
    }
    _platform_strlen();
    _platform_bzero();
    return v11;
  }
  else
  {
    return 0;
  }
}

char *parse_ptr_munge_params(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  uint64_t v4 = 0;
  uint64_t v3 = 0;
  uint64_t v5 = (char *)_simple_getenv();
  if (v5)
  {
    uint64_t v3 = _pthread_strtoul(v5, &v4, 16);
    _platform_strlen();
    _platform_bzero();
  }
  uint64_t result = (char *)_simple_getenv();
  uint64_t v5 = result;
  if (result)
  {
    uint64_t result = (char *)_pthread_strtoul(v5, &v4, 16);
    if (result) {
      uint64_t v3 = (uint64_t)result;
    }
  }
  _pthread_ptr_munge_token = v3;
  *(void *)_main_thread_ptr = _main_thread_ptr ^ v3;
  return result;
}

char *parse_main_thread_port(uint64_t a1, _DWORD *a2)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  uint64_t v4 = 0;
  uint64_t result = (char *)_simple_getenv();
  uint64_t v5 = result;
  if (result)
  {
    int v3 = _pthread_strtoul(v5, &v4, 16);
    *uint64_t v6 = v3;
    _platform_strlen();
    return (char *)_platform_bzero();
  }
  return result;
}

void *_pthread_main_thread_init(uint64_t a1, int a2)
{
  uint64_t v7 = (void *)a1;
  int v6 = a2;
  __pthread_head = 0;
  off_30008 = &__pthread_head;
  unsigned int v11 = &_pthread_list_lock;
  int v10 = 0;
  _pthread_list_lock._os_unfair_lock_opaque = 0;
  uint64_t v9 = a1 + 72;
  int v8 = 0;
  *(_DWORD *)(a1 + 72) = 0;
  v7[1] = 0;
  v7[4] = 0;
  *((_DWORD *)v7 + 13) = 0;
  if (v6) {
    *((_DWORD *)v7 + 62) = v6;
  }
  else {
    *((_DWORD *)v7 + 62) = mach_thread_self();
  }
  mach_port_name_t name = 0;
  *(_OWORD *)&v4.flags = xmmword_200F8;
  v4.reserved[1] = 0;
  mach_port_construct(mach_task_self_, &v4, 0, &name);
  *((_DWORD *)v7 + 60) = name;
  *((_DWORD *)v7 + 72) = 0;
  *((_DWORD *)v7 + 74) = 0;
  char v2 = __pthread_head;
  v7[2] = __pthread_head;
  if (v2) {
    *(void *)((char *)&dword_18 + (void)__pthread_head) = v7 + 2;
  }
  else {
    off_30008 = (int **)(v7 + 2);
  }
  __pthread_head = (int *)v7;
  _OWORD v7[3] = &__pthread_head;
  _pthread_count = 1;
  return _pthread_introspection_thread_start(v7);
}

uint64_t _pthread_bsdthread_init(uint64_t a1)
{
  _platform_bzero();
  *(void *)a1 = 56;
  *(void *)(a1 + 8) = 160;
  *(_DWORD *)(a1 + 28) = 40;
  *(_DWORD *)(a1 + 24) = 224;
  *(_DWORD *)(a1 + 32) = 24;
  *(_DWORD *)(a1 + 48) = 392;
  *(_DWORD *)(a1 + 52) = 960;
  uint64_t result = __bsdthread_register();
  if ((int)result >= 1)
  {
    if ((~result & 0x4000001E) != 0)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Missing required kernel support";
      qword_2C058 = (int)result;
      __break(1u);
      JUMPOUT(0x6274);
    }
    __pthread_supported_features = result;
  }
  uint64_t v6 = *(void *)(a1 + 16);
  BOOL v5 = 0;
  if ((v6 & 0x22000000) == 0) {
    BOOL v5 = (v6 & 0x3F00) != 0;
  }
  if (v5)
  {
    unsigned int v2 = (unint64_t)(v6 & 0x3F00) >> 8;
    char v3 = __clz(__rbit32(v2));
    if (v2) {
      char v4 = v3 + 1;
    }
    else {
      char v4 = 0;
    }
    char v8 = v4;
  }
  else
  {
    char v8 = 0;
  }
  if (v8)
  {
    uint64_t result = _pthread_set_main_qos(v6);
    *(void *)(_main_thread_ptr + 256) = v6;
  }
  if (*(void *)(a1 + 36)) {
    __pthread_stack_hint = *(void *)(a1 + 36);
  }
  if (__libdispatch_workerfunction) {
    return __workq_open();
  }
  return result;
}

void *_pthread_introspection_thread_start(void *result)
{
  if (_pthread_introspection_hook) {
    return (void *)_pthread_introspection_hook_callout_thread_start(result);
  }
  return result;
}

uint64_t _pthread_main_thread_postfork_init(uint64_t a1)
{
  _pthread_main_thread_init(a1, 0);
  uint64_t result = __thread_selfid();
  *(void *)(a1 + 216) = result;
  if (*(void *)(a1 + 216) == -1)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x6498);
  }
  return result;
}

void sched_yield(void)
{
  if (pthread_yield_to_zero) {
    swtch_pri(0);
  }
  else {
    thread_switch(0, 0, 0);
  }
}

uint64_t _pthread_yield_to_enqueuer_4dispatch(uint64_t a1, uint64_t a2, mach_msg_timeout_t a3)
{
  thread_mach_port_name_t name = 0;
  os_unfair_lock_lock_with_options();
  for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
  {
    if (a2)
    {
      if (*(void *)&i[2 * a1 + 56] == a2)
      {
        thread_mach_port_name_t name = i[62];
        break;
      }
    }
    else if (*(void *)&i[2 * a1 + 56])
    {
      thread_mach_port_name_t name = i[62];
      break;
    }
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  thread_switch(thread_name, 4, a3);
  return 0;
}

uint64_t pthread_current_stack_contains_np(unint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 40);
  unint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 48);
  if (v6 == v5)
  {
    return -45;
  }
  else if (__CFADD__(a1, a2))
  {
    return -22;
  }
  else
  {
    BOOL v4 = 0;
    if (v6 <= a1) {
      return a1 + a2 <= v5;
    }
    return v4;
  }
}

void _pthread_clear_qos_tsd(int a1)
{
  if (a1 && *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    os_unfair_lock_lock_with_options();
    for (i = __pthread_head; i; i = (int *)*((void *)i + 2))
    {
      if (a1 == i[62])
      {
        *((void *)i + 32) = 0;
        break;
      }
    }
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  else
  {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 0;
  }
}

uint64_t pthread_stack_frame_decode_np(void *a1, void *a2)
{
  if (a2) {
    *a2 = a1[1];
  }
  return *a1 & 0xFFFFFFFFFFFFFFLL;
}

uint64_t _pthread_wqthread(unint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  if ((a5 & 0x20000) == 0) {
    _pthread_wqthread_setup(a1, a2, a3, a5);
  }
  if ((a5 & 0x800000) != 0)
  {
    *(unsigned char *)(a1 + 164) = 1;
    uint64_t v12 = 67111167;
  }
  else
  {
    *(unsigned char *)(a1 + 164) = 0;
    uint64_t v17 = 0;
    if ((a5 & 0x80000) != 0) {
      uint64_t v17 = 0x1000000;
    }
    if ((a5 & 0x100000) != 0)
    {
      uint64_t v19 = v17 | 0x2000000;
    }
    else
    {
      if ((a5 & 0x10000) != 0) {
        v17 |= 0x80000000uLL;
      }
      if ((a5 & 0x4000) != 0)
      {
        unsigned int v20 = BYTE3(v17) << 24;
        if ((_BYTE)a5 && a5 <= 6u) {
          v20 |= (1 << (a5 + 7)) | 0xFF;
        }
        uint64_t v18 = v20;
      }
      else
      {
        if ((a5 & 0x8000) == 0)
        {
          qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Missing priority";
          qword_2C058 = a5;
          __break(1u);
          JUMPOUT(0x6C28);
        }
        uint64_t v18 = v17 | 0xFFFF | a5 & 0xFFF;
      }
      uint64_t v19 = v18;
    }
    uint64_t v12 = v19;
  }
  *(void *)(a1 + 256) = v12;
  uint64_t v11 = v12;
  if ((a5 & 0x1000000) != 0) {
    uint64_t v11 = v12 | 0x8000000;
  }
  if (a6 == -1) {
    _pthread_wqthread_exit(a1);
  }
  if ((a5 & 0x400000) != 0)
  {
    int v10 = 0;
    if (__libdispatch_workloopfunction) {
      int v10 = __libdispatch_workloopfunction;
    }
    *(void *)(a1 + 144) = v10;
    *(void *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_workloopfunction();
  }
  if ((a5 & 0x80000) != 0)
  {
    uint64_t v9 = 0;
    if (__libdispatch_keventfunction) {
      uint64_t v9 = __libdispatch_keventfunction;
    }
    *(void *)(a1 + 144) = v9;
    *(void *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_keventfunction();
  }
  char v8 = 0;
  if (__libdispatch_workerfunction) {
    char v8 = __libdispatch_workerfunction;
  }
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v11;
  *(_DWORD *)(a1 + 160) = 0;
  if (__workq_newapi) {
    __libdispatch_workerfunction(v11);
  }
  else {
    _pthread_wqthread_legacy_worker_wrap(v11);
  }
  uint64_t result = __workq_kernreturn();
  uint64_t v7 = *(int *)(a1 + 172);
  qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: __workq_kernreturn returned";
  qword_2C058 = v7;
  return result;
}

void *_pthread_wqthread_setup(uint64_t a1, int a2, uint64_t a3, int a4)
{
  vm_size_t v11 = a3 - vm_page_size;
  vm_size_t v10 = ((vm_page_size + a1 - 1) & -(uint64_t)vm_page_size)
      + ((vm_page_mask + 6368) & ~vm_page_mask)
      - (a3
       - vm_page_size);
  *(void *)a1 = a1 ^ _pthread_ptr_munge_token;
  *(void *)(a1 + 224) = a1;
  *(void *)(a1 + 232) = a1 + 172;
  *(void *)(a1 + 256) = 2303;
  *(void *)(a1 + 280) = _pthread_ptr_munge_token;
  *(unsigned char *)(a1 + 49) &= ~4u;
  *(_DWORD *)(a1 + 72) = 0;
  *(void *)(a1 + 176) = a1;
  *(void *)(a1 + 184) = a3;
  *(void *)(a1 + 192) = v11;
  *(void *)(a1 + 200) = v10;
  *(void *)(a1 + 208) = _pthread_attr_guardsize((uint64_t)"ADHT");
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a1 + 49) & 0xFE | (unk_20138 == 1);
  *(unsigned char *)(a1 + 78) = unk_20139;
  *(unsigned char *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 78) = *(_WORD *)(a1 + 78) & 0xFDFF | ((unk_2013B & 1) << 9);
  *(_DWORD *)(a1 + 56) = default_priority;
  *(_DWORD *)(a1 + 60) = 10;
  *(_WORD *)(a1 + 166) = 3;
  *(_DWORD *)(a1 + 248) = a2;
  *(_WORD *)(a1 + 78) |= 0x400u;
  *(_WORD *)(a1 + 78) &= ~0x800u;
  *(unsigned char *)(a1 + 49) &= ~1u;
  if ((a4 & 0x200000) == 0)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_2C058 = a4;
    __break(1u);
    JUMPOUT(0x72D4);
  }
  *(void *)(a1 + 216) = __thread_selfid();
  if (*(void *)(a1 + 216) == -1)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x7340);
  }
  os_unfair_lock_lock_no_tsd();
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = off_30008;
  *off_30008 = (int *)a1;
  off_30008 = (int **)(a1 + 16);
  ++_pthread_count;
  os_unfair_lock_unlock_no_tsd();
  _pthread_introspection_thread_create(a1);
  unsigned int v9 = *(_DWORD *)(a1 + 248);
  BOOL v5 = 0;
  if (v9) {
    BOOL v5 = v9 != -1;
  }
  if (!v5)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_2C058 = v9;
    __break(1u);
    JUMPOUT(0x7480);
  }
  return _pthread_introspection_thread_start((void *)a1);
}

void _pthread_wqthread_exit(unint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 256);
  BOOL v4 = 0;
  if ((v5 & 0x22000000) == 0) {
    BOOL v4 = (v5 & 0x3F00) != 0;
  }
  if (v4)
  {
    unsigned int v1 = (unint64_t)(v5 & 0x3F00) >> 8;
    char v2 = __clz(__rbit32(v1));
    if (v1) {
      unsigned __int8 v3 = v2 + 1;
    }
    else {
      unsigned __int8 v3 = 0;
    }
    unsigned __int8 v6 = v3;
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  if (!v6 || v6 > 4u) {
    *(void *)(a1 + 256) = 2303;
  }
  _pthread_exit(a1, 0);
}

uint64_t _pthread_wqthread_legacy_worker_wrap(uint64_t a1)
{
  unsigned __int8 v6 = 0;
  if (__libdispatch_workerfunction) {
    unsigned __int8 v6 = (uint64_t (*)(uint64_t, BOOL))__libdispatch_workerfunction;
  }
  BOOL v5 = 0;
  if ((a1 & 0x22000000) == 0) {
    BOOL v5 = (a1 & 0x3F00) != 0;
  }
  if (v5)
  {
    unsigned int v1 = (unint64_t)(a1 & 0x3F00) >> 8;
    char v2 = __clz(__rbit32(v1));
    if (v1) {
      char v3 = v2 + 1;
    }
    else {
      char v3 = 0;
    }
    char v7 = v3;
  }
  else
  {
    char v7 = 0;
  }
  switch(v7)
  {
    case 2:
      uint64_t result = ((uint64_t (*)(uint64_t, BOOL, void))v6)(3, (int)a1 < 0, 0);
      break;
    case 3:
      uint64_t result = ((uint64_t (*)(uint64_t, BOOL, void))v6)(2, (int)a1 < 0, 0);
      break;
    case 4:
      *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 4351;
      uint64_t result = v6(1, (int)a1 < 0);
      break;
    case 5:
      uint64_t result = ((uint64_t (*)(void, BOOL, void))v6)(0, (int)a1 < 0, 0);
      break;
    default:
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Invalid pthread priority for the legacy interface";
      qword_2C058 = a1;
      __break(1u);
      JUMPOUT(0x791CLL);
  }
  return result;
}

uint64_t pthread_workqueue_setdispatchoffset_np()
{
  return __workq_kernreturn();
}

uint64_t pthread_workqueue_setup(uint64_t a1, unint64_t a2)
{
  if (a2 >= 4)
  {
    int v3 = *(_DWORD *)(a1 + 4);
    if (v3 == 1)
    {
      unint64_t v4 = 40;
    }
    else
    {
      if (v3 != 2) {
        return 22;
      }
      unint64_t v4 = 48;
    }
    if (a1 && a2 >= v4)
    {
      if (!*(_DWORD *)a1 && *(_DWORD *)(a1 + 4))
      {
        if (__libdispatch_workerfunction)
        {
          return 16;
        }
        else
        {
          __workq_newapi = 1;
          if (__workq_kernreturn() == -1)
          {
            return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
          }
          else
          {
            __libdispatch_keventfunction = *(void (**)())(a1 + 8);
            __libdispatch_workloopfunction = *(void (**)())(a1 + 16);
            __libdispatch_workerfunction = *(uint64_t (**)(void))(a1 + 24);
            __workq_open();
            if (!__is_threaded) {
              __is_threaded = 1;
            }
            return 0;
          }
        }
      }
      else
      {
        return 45;
      }
    }
    else
    {
      return 22;
    }
  }
  else
  {
    return 22;
  }
}

uint64_t _pthread_workqueue_init_with_workloop(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  uint64_t v14 = a3;
  int v13 = a4;
  int v12 = a5;
  __b[0] = 0;
  __b[1] = 2;
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  uint64_t v9 = a1;
  uint64_t v10 = a4;
  uint64_t v11 = 0;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_init_with_kevent(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return _pthread_workqueue_init_with_workloop(a1, a2, 0, a3, a4);
}

uint64_t _pthread_workqueue_init(uint64_t a1, int a2, int a3)
{
  return _pthread_workqueue_init_with_kevent(a1, 0, a2, a3);
}

uint64_t pthread_workqueue_setdispatch_np(uint64_t a1)
{
  uint64_t v6 = a1;
  memset(__b, 0, sizeof(__b));
  HIDWORD(__b[0]) = 2;
  uint64_t v4 = 0;
  if (v6) {
    uint64_t v4 = v6;
  }
  uint64_t v3 = 0;
  if (v4) {
    uint64_t v3 = v4;
  }
  uint64_t v2 = 0;
  if (v3) {
    uint64_t v2 = v3;
  }
  __b[3] = v2;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_supported()
{
  if (!__pthread_supported_features)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: libpthread has not been initialized";
    __break(1u);
    JUMPOUT(0x7E9CLL);
  }
  return __pthread_supported_features;
}

uint64_t pthread_workqueue_addthreads_np(__int16 a1, char a2)
{
  if (__libdispatch_workerfunction)
  {
    int v3 = 0;
    if (a2) {
      int v3 = 0x80000000;
    }
    _pthread_qos_class_encode_workqueue(a1 & 0xFFF, v3);
    unsigned int v4 = __workq_kernreturn();
    if (v4 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v4;
  }
  else
  {
    return 1;
  }
}

BOOL _pthread_workqueue_should_narrow()
{
  int v1 = __workq_kernreturn();
  return v1 != -1 && v1 != 0;
}

uint64_t _pthread_workqueue_addthreads()
{
  if (__libdispatch_workerfunction)
  {
    unsigned int v1 = __workq_kernreturn();
    if (v1 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v1;
  }
  else
  {
    return 1;
  }
}

uint64_t _pthread_workqueue_add_cooperativethreads()
{
  if (__libdispatch_workerfunction)
  {
    unsigned int v1 = __workq_kernreturn();
    if (v1 == -1) {
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    return v1;
  }
  else
  {
    return 1;
  }
}

uint64_t _pthread_workqueue_set_event_manager_priority()
{
  unsigned int v1 = __workq_kernreturn();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_allow_send_signals()
{
  return __bsdthread_ctl();
}

uint64_t _pthread_workloop_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  int __b = 36;
  int v6 = 0;
  uint64_t v7 = a1;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  if (a3 && (v14 & 0xFFFFFFFFFFFFFFFELL) == 0)
  {
    if ((*(void *)(v13 + 40) >> 24))
    {
      v6 |= 1u;
      int v8 = *(_DWORD *)(v13 + 32);
    }
    if ((*(void *)(v13 + 40) >> 26))
    {
      v6 |= 2u;
      int v9 = BYTE2(*(void *)(v13 + 40));
    }
    if ((*(void *)(v13 + 40) >> 27))
    {
      v6 |= 4u;
      int v10 = BYTE4(*(void *)(v13 + 40));
      int v11 = *(void *)(v13 + 40) >> 40;
    }
    if (*(_DWORD *)(v13 + 48) && *(_DWORD *)(v13 + 48) != -1)
    {
      v6 |= 8u;
      int v12 = *(_DWORD *)(v13 + 48);
    }
    if (v14) {
      v6 |= 0x10u;
    }
    unsigned int v4 = __kqueue_workloop_ctl();
    if (v4 == -1)
    {
      uint64_t v17 = 1;
      uint64_t v18 = 1;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      return **(_DWORD **)(StatusReg + 8);
    }
    return v4;
  }
  else
  {
    return 22;
  }
}

uint64_t _pthread_workloop_destroy()
{
  unsigned int v1 = __kqueue_workloop_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  pthread_introspection_hook_t v4 = 0;
  if (hook) {
    pthread_introspection_hook_t v4 = hook;
  }
  uint64_t v2 = (void (__cdecl *)(unsigned int, pthread_t, void *, size_t))_pthread_atomic_xchg_ptr((atomic_ullong *)&_pthread_introspection_hook, (unint64_t)v4);
  int v3 = 0;
  if (v2) {
    return v2;
  }
  return v3;
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)_platform_memset();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)_platform_memmove();
}

mach_vm_address_t _pthread_allocate(uint64_t a1, mach_vm_address_t *a2, char a3)
{
  kern_return_t v5;
  mach_vm_address_t v6;
  vm_size_t v7;
  BOOL v9;
  mach_vm_address_t v10;
  kern_return_t v11;
  vm_size_t v12;
  uint64_t v13;
  vm_size_t v14;
  vm_size_t size;
  mach_vm_address_t address;
  char v17;
  mach_vm_address_t *v18;
  uint64_t v19;
  vm_size_t v21;
  mach_vm_address_t v22;
  uint64_t v23;
  mach_vm_address_t v24;
  uint64_t v25;
  mach_vm_address_t v26;
  mach_vm_address_t v27;
  uint64_t v28;
  mach_vm_address_t v29;
  mach_vm_address_t v30;
  int v31;
  mach_vm_address_t v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;

  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  address = __pthread_stack_hint;
  int v9 = 0;
  if (*(void *)(a1 + 24)) {
    int v9 = *(void *)(v19 + 24) < 0x4000uLL;
  }
  if (v9)
  {
    uint64_t v3 = *(void *)(v19 + 24);
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Stack size in attrs is too small";
    qword_2C058 = v3;
    __break(1u);
    JUMPOUT(0x8800);
  }
  if ((*(void *)(v19 + 16) & vm_page_mask) != 0)
  {
    uint64_t v4 = *(void *)(v19 + 16);
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unaligned stack addr in attrs";
    qword_2C058 = v4;
    __break(1u);
    JUMPOUT(0x8860);
  }
  if (*(void *)(v19 + 16))
  {
    size = (vm_page_mask + 6368) & ~vm_page_mask;
    uint64_t v14 = 0;
    int v12 = 0;
    uint64_t v13 = *(void *)(v19 + 24);
    BOOL v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0, 0, 3, 7, 1u);
  }
  else
  {
    uint64_t v14 = _pthread_attr_guardsize(v19);
    uint64_t v13 = _pthread_attr_stacksize(v19) + 12288;
    int v12 = v13 + v14;
    size = (v13 + v14 + ((vm_page_mask + 6368) & ~vm_page_mask) + vm_page_mask) & ~vm_page_mask;
    BOOL v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0, 0, 3, 7, 1u);
  }
  int v11 = v5;
  if (v5)
  {
    int v11 = mach_vm_allocate(mach_task_self_, &address, size, 503316481);
  }
  else if (__syscall_logger && (v17 & 1) == 0)
  {
    __syscall_logger(503316624, mach_task_self_, size, 0, address);
  }
  if (v11)
  {
    os_unfair_lock_s *v18 = 0;
    return 0;
  }
  else
  {
    if (__syscall_logger && (v17 & 1) == 0) {
      __syscall_logger(503316496, mach_task_self_, size, 0, address);
    }
    if (v14) {
      mach_vm_protect(mach_task_self_, address, v14, 0, 0);
    }
    int v10 = address + v12;
    if (*(void *)(v19 + 16)) {
      os_unfair_lock_s *v18 = *(void *)(v19 + 16);
    }
    else {
      os_unfair_lock_s *v18 = v10;
    }
    int v6 = *v18;
    char v26 = v10;
    uint64_t v25 = v19;
    uint64_t v24 = v6;
    unint64_t v23 = v13;
    unint64_t v22 = address;
    os_unfair_lock_t v21 = size;
    mach_port_name_t v30 = v10;
    mach_vm_address_t v29 = v10;
    *(void *)int v10 = v10 ^ _pthread_ptr_munge_token;
    *(void *)(v26 + 224) = v26;
    *(void *)(v26 + 232) = v26 + 172;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      mach_port_name_t v36 = 0;
      v35 = 0;
      uint64_t v34 = 0;
      char v33 = 0;
      *(void *)(v26 + 256) = 0;
    }
    else
    {
      *(void *)(v26 + 256) = *(void *)(v25 + 32);
    }
    *(void *)(v26 + 280) = _pthread_ptr_munge_token;
    *(unsigned char *)(v26 + 49) = *(unsigned char *)(v26 + 49) & 0xFB | (4 * (*(void *)(v25 + 16) != 0));
    mach_port_name_t v32 = v26 + 72;
    mach_vm_address_t v31 = 0;
    *(_DWORD *)(v26 + 72) = 0;
    *(void *)(v26 + 176) = v24;
    *(void *)(v26 + 184) = v24 - v23;
    *(void *)(v26 + 192) = v22;
    *(void *)(v26 + 200) = v21;
    uint64_t v7 = _pthread_attr_guardsize(v25);
    *(void *)(v26 + 208) = v7;
    *(unsigned char *)(v26 + 49) = *(unsigned char *)(v26 + 49) & 0xFE | (*(unsigned char *)(v25 + 40) == 1);
    *(unsigned char *)(v26 + 78) = *(unsigned char *)(v25 + 41);
    *(unsigned char *)(v26 + 48) = BYTE2(*(void *)(v25 + 40));
    *(_WORD *)(v26 + 78) = *(_WORD *)(v26 + 78) & 0xFDFF | ((*(unsigned char *)(v25 + 43) & 1) << 9);
    mach_port_name_t v28 = v25;
    uint64_t v27 = v26 + 56;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      *(void *)uint64_t v27 = *(void *)(v28 + 32);
    }
    else
    {
      *(_DWORD *)uint64_t v27 = default_priority;
      *(_DWORD *)(v27 + 4) = 10;
    }
    *(_WORD *)(v26 + 166) = 3;
    return v10;
  }
}

uint64_t _pthread_introspection_thread_create(uint64_t result)
{
  if (_pthread_introspection_hook) {
    return _pthread_introspection_hook_callout_thread_create(result);
  }
  return result;
}

uint64_t _pthread_introspection_hook_callout_thread_create(uint64_t a1)
{
  return _pthread_introspection_call_hook(1u, a1, a1, (vm_page_mask + 6368) & ~vm_page_mask);
}

uint64_t _pthread_introspection_call_hook(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v6 = StatusReg - 224;
  __int16 v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(v6 + 50) = a1;
  uint64_t result = _pthread_introspection_hook(a1, a2, a3, a4);
  *(_WORD *)(v6 + 50) = v5;
  return result;
}

uint64_t _pthread_terminate_invoke(unint64_t a1, uint64_t a2)
{
  unint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = 0;
  if (((unint64_t)&vars0 & ~(vm_page_size - 1)) == (a1 & ~(vm_page_size - 1)))
  {
    unint64_t v6 = v5;
    bzero(v5, 0x3000uLL);
    uint64_t v7 = v6;
  }
  unint64_t v2 = _pthread_terminate(v9, v8);
  return _pthread_terminate(v2, v3);
}

uint64_t _pthread_terminate(unint64_t a1, uint64_t a2)
{
  _pthread_introspection_thread_terminate((void *)a1);
  unint64_t v7 = *(void *)(a1 + 192);
  if (a1 <= v7 || a1 >= *(void *)(a1 + 192) + *(void *)(a1 + 200))
  {
    if (a1 == _main_thread_ptr)
    {
      pthread_get_stacksize_np((pthread_t)a1);
      _pthread_current_stack_address();
    }
  }
  else
  {
    uint64_t v5 = (a1 - v7) & -(uint64_t)vm_page_size;
    *(void *)(a1 + 192) += v5;
    *(void *)(a1 + 200) -= v5;
  }
  char v4 = 0;
  char v3 = 0;
  _pthread_dealloc_special_reply_port(a1);
  _pthread_dealloc_reply_port(a1);
  os_unfair_lock_lock_with_options();
  *(_DWORD *)(a1 + 52) = -1;
  *(void *)(a1 + 40) = a2;
  BOOL v6 = --_pthread_count < 1;
  if (*(void *)(a1 + 32))
  {
    _pthread_joiner_prepost_wake(a1);
    char v3 = 1;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    char v4 = 1;
    *(unsigned char *)(a1 + 49) |= 2u;
  }
  else
  {
    if (*(void *)(a1 + 16)) {
      *(void *)(*(void *)(a1 + 16) + 24) = *(void *)(a1 + 24);
    }
    else {
      off_30008 = *(int ***)(a1 + 24);
    }
    **(void **)(a1 + 24) = *(void *)(a1 + 16);
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  if (v3)
  {
    _pthread_joiner_wake();
    os_unfair_lock_lock_with_options();
    if (*(void *)(a1 + 32))
    {
      *(unsigned char *)(a1 + 49) |= 2u;
      char v4 = 1;
    }
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  if ((v4 & 1) == 0 && a1 != _main_thread_ptr) {
    _pthread_introspection_thread_destroy(a1);
  }
  if (v6) {
    exitf(0);
  }
  uint64_t result = __bsdthread_terminate();
  qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: thread didn't terminate";
  qword_2C058 = a1;
  __break(1u);
  return result;
}

void *_pthread_introspection_thread_terminate(void *result)
{
  if (_pthread_introspection_hook) {
    return (void *)_pthread_introspection_hook_callout_thread_terminate(result);
  }
  return result;
}

int *_pthread_current_stack_address()
{
  uint64_t result = &v1;
  int v1 = 0;
  return result;
}

uint64_t _pthread_dealloc_special_reply_port(uint64_t result)
{
  if (*(_DWORD *)(result + 288))
  {
    *(_DWORD *)(result + 288) = 0;
    return thread_destruct_special_reply_port();
  }
  return result;
}

void _pthread_dealloc_reply_port(uint64_t a1)
{
  mach_port_t reply_port = *(_DWORD *)(a1 + 240);
  if (reply_port) {
    mig_dealloc_reply_port(reply_port);
  }
}

uint64_t _pthread_introspection_hook_callout_thread_terminate(void *a1)
{
  if (a1 == (void *)_main_thread_ptr) {
    return _pthread_introspection_call_hook(3u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  }
  else {
    return _pthread_introspection_call_hook(3u, (uint64_t)a1, a1[24], a1[25] - ((vm_page_mask + 6368) & ~vm_page_mask));
  }
}

uint64_t _pthread_strtoul(char *a1, void *a2, int a3)
{
  i = a1;
  uint64_t v5 = 0;
  if ((a3 == 16 || !a3) && a1 && *a1 == 48 && a1[1] == 120)
  {
    for (i = a1 + 2; ; ++i)
    {
      char v4 = *i;
      if (*i < 48 || v4 > 57)
      {
        if (v4 < 97 || v4 > 102)
        {
          if (v4 < 65 || v4 > 70) {
            break;
          }
          uint64_t v5 = 16 * v5 + v4 - 55;
        }
        else
        {
          uint64_t v5 = 16 * v5 + v4 - 87;
        }
      }
      else
      {
        uint64_t v5 = 16 * v5 + v4 - 48;
      }
    }
  }
  *a2 = i;
  return v5;
}

uint64_t _pthread_introspection_hook_callout_thread_start(void *a1)
{
  if (a1 == (void *)_main_thread_ptr) {
    return _pthread_introspection_call_hook(2u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  }
  else {
    return _pthread_introspection_call_hook(2u, (uint64_t)a1, a1[24], a1[25] - ((vm_page_mask + 6368) & ~vm_page_mask));
  }
}

uint64_t _pthread_introspection_hook_callout_thread_destroy(uint64_t a1)
{
  return _pthread_introspection_call_hook(4u, a1, a1, (vm_page_mask + 6368) & ~vm_page_mask);
}

uint64_t _pthread_setcancelstate_exit(uint64_t result)
{
  for (unsigned __int16 i = *(_WORD *)(result + 166); ; unsigned __int16 i = v2)
  {
    int v1 = i;
    unsigned __int16 v2 = i;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(result + 166), &v2, i & 0xFFDC | 0x22, memory_order_relaxed, memory_order_relaxed);
    if (v1 == v2) {
      break;
    }
  }
  return result;
}

int pthread_cancel(pthread_t a1)
{
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((pthread_t)(a1->__sig ^ _pthread_ptr_munge_token) != a1) {
      abort_with_reason();
    }
    char v9 = 1;
  }
  else
  {
    if (a1)
    {
      int v1 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v1, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
      if (v1) {
        os_unfair_lock_lock_with_options();
      }
      for (unsigned __int16 i = __pthread_head; i; unsigned __int16 i = (int *)*((void *)i + 2))
      {
        if (i == (int *)a1)
        {
          if ((int *)(*(void *)i ^ _pthread_ptr_munge_token) != i) {
            abort_with_reason();
          }
          char v12 = 1;
          goto LABEL_19;
        }
      }
      int v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      int v3 = v2;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v3, 0, memory_order_release, memory_order_relaxed);
      if (v3 != v2) {
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
      char v12 = 0;
    }
    else
    {
      char v12 = 0;
    }
LABEL_19:
    if (v12)
    {
      char v9 = 1;
      int v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      int v5 = v4;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
      if (v5 != v4) {
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  if ((v9 & 1) == 0) {
    return 3;
  }
  if ((*(_WORD *)&a1->__opaque[62] >> 10)) {
    return 45;
  }
  if ((atomic_fetch_or_explicit((atomic_ushort *volatile)&a1->__opaque[150], 0x10u, memory_order_relaxed) & 1) != 0
    && *(_DWORD *)&a1->__opaque[232])
  {
    __pthread_markcancel();
  }
  return 0;
}

int pthread_setcancelstate(int a1, int *a2)
{
  unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if ((*(void *)v5 ^ _pthread_ptr_munge_token) != v5) {
    abort_with_reason();
  }
  if (a1 > 1) {
    return 22;
  }
  __pthread_canceled();
  for (unsigned __int16 i = *(_WORD *)(v5 + 166); ; unsigned __int16 i = v3)
  {
    int v2 = i;
    unsigned __int16 v3 = i;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v5 + 166), &v3, i & 0xFFFE | a1, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v3) {
      break;
    }
  }
  if (a2) {
    *a2 = i & 1;
  }
  return 0;
}

int pthread_setcanceltype(int a1, int *a2)
{
  unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if ((*(void *)v5 ^ _pthread_ptr_munge_token) != v5) {
    abort_with_reason();
  }
  if (a1 != 2 && a1) {
    return 22;
  }
  for (unsigned __int16 i = *(_WORD *)(v5 + 166); ; unsigned __int16 i = v3)
  {
    int v2 = i;
    unsigned __int16 v3 = i;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v5 + 166), &v3, i & 0xFFFD | a1, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v3) {
      break;
    }
  }
  if (a2) {
    *a2 = i & 2;
  }
  return 0;
}

void pthread_testcancel(void)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  char v0 = atomic_load((unsigned __int16 *)(StatusReg - 58));
  if ((v0 & 0x11) == 0x11)
  {
    if ((*(void *)(StatusReg - 224) ^ _pthread_ptr_munge_token) != StatusReg - 224) {
      abort_with_reason();
    }
    *(unsigned char *)(StatusReg - 59) = 1;
    pthread_exit((char *)&def_10BC8 + 1);
  }
}

uint64_t _pthread_markcancel_if_canceled(uint64_t result)
{
  char v1 = atomic_load((unsigned __int16 *)(result + 166));
  if ((v1 & 0x11) == 0x11) {
    return __pthread_markcancel();
  }
  return result;
}

uint64_t _pthread_exit_if_canceled(uint64_t result)
{
  int v2 = result;
  if (result == 4)
  {
    uint64_t result = __pthread_canceled();
    if (!result)
    {
      unint64_t v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
      if ((*(void *)v1 ^ _pthread_ptr_munge_token) != v1) {
        abort_with_reason();
      }
      *(_DWORD *)(v1 + 168) = v2;
      *(unsigned char *)(v1 + 165) = 1;
      pthread_exit((char *)&def_10BC8 + 1);
    }
  }
  return result;
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  int v4 = 0;
  if (__pthread_sigmask() == -1) {
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v4;
}

uint64_t _pthread_joiner_prepost_wake(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v3 = 0;
  if (*(unsigned char *)(a1 + 49))
  {
    unsigned int v3 = *(_DWORD *)(v4 + 20);
    *(unsigned char *)(a1 + 49) &= ~1u;
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
    *(void *)(a1 + 32) = 0;
  }
  if (*(void *)(v4 + 8))
  {
    __int16 v6 = 17;
    unsigned __int16 v1 = atomic_load((unsigned __int16 *)(a1 + 166));
    if ((unsigned __int16)(v1 & v6) == 0x11) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    **(void **)(v4 + 8) = v5;
  }
  return v3;
}

uint64_t _pthread_join(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  int v14 = a3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v18 = StatusReg;
  uint64_t v13 = (void *)(StatusReg - 224);
  v11[0] = StatusReg - 224;
  v11[1] = a2;
  long long v12 = 0uLL;
  unsigned int v10 = 0;
  mach_port_name_t v30 = (int *)a1;
  unsigned __int16 i = 0;
  if (a1)
  {
    v45 = &_pthread_list_lock;
    v52 = &_pthread_list_lock;
    int v51 = 327680;
    unsigned int v50 = 0;
    uint64_t v53 = 3;
    uint64_t v54 = 3;
    unint64_t v55 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v50 = *(void *)(v55 + 24);
    int v49 = 0;
    unsigned int v48 = v50;
    unsigned int v47 = v50;
    int v3 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v3, v50, memory_order_acquire, memory_order_acquire);
    if (v3) {
      int v49 = v3;
    }
    BOOL v46 = v3 == 0;
    if (v3) {
      os_unfair_lock_lock_with_options();
    }
    for (unsigned __int16 i = __pthread_head; i; unsigned __int16 i = (int *)*((void *)i + 2))
    {
      if (i == v30)
      {
        char v33 = i;
        uint64_t v32 = 0;
        uint64_t v32 = *(void *)i ^ _pthread_ptr_munge_token;
        if ((int *)v32 != i) {
          abort_with_reason();
        }
        char v31 = 1;
        goto LABEL_19;
      }
    }
    mach_port_name_t v36 = &_pthread_list_lock;
    os_unfair_lock_t v76 = &_pthread_list_lock;
    int v75 = 0;
    uint64_t v77 = 3;
    uint64_t v78 = 3;
    unint64_t v79 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v75 = *(void *)(v79 + 24);
    int v74 = 0;
    int v73 = v75;
    int v72 = 0;
    int v4 = v75;
    int v5 = v75;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
    if (v5 != v4) {
      int v73 = v5;
    }
    BOOL v71 = v5 == v75;
    if (v5 != v75) {
      os_unfair_lock_unlock(v76);
    }
    char v31 = 0;
  }
  else
  {
    char v31 = 0;
  }
LABEL_19:
  if (v31)
  {
    unsigned int v20 = v13;
    uint64_t v19 = 0;
    uint64_t v19 = *v13 ^ _pthread_ptr_munge_token;
    if ((void *)v19 != v13) {
      abort_with_reason();
    }
    if ((*(unsigned char *)(v16 + 49) & 1) != 0 && !*(void *)(v16 + 32))
    {
      if ((void *)v16 == v13 || v13[4] && *(void *)v13[4] == v16)
      {
        unsigned int v10 = 11;
      }
      else if (*(_DWORD *)(v16 + 52) == -1)
      {
        if (*(void *)(v16 + 16)) {
          *(void *)(*(void *)(v16 + 16) + 24) = *(void *)(v16 + 24);
        }
        else {
          off_30008 = *(int ***)(v16 + 24);
        }
        **(void **)(v16 + 24) = *(void *)(v16 + 16);
        if ((*(unsigned char *)(v16 + 49) & 2) == 0)
        {
          qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_joiner_cleans_up";
          __break(1u);
          JUMPOUT(0xAD60);
        }
        *(unsigned char *)(v16 + 49) &= ~1u;
        if (v15)
        {
          uint64_t v21 = v16;
          uint64_t v28 = v16;
          int v27 = 17;
          unsigned __int16 v6 = atomic_load((unsigned __int16 *)(v16 + 166));
          unsigned __int16 v24 = v6;
          unsigned __int16 v25 = v6;
          unsigned __int16 v23 = v6;
          int v26 = v6;
          if ((v27 & ~v6) != 0) {
            uint64_t v22 = *(void *)(v21 + 40);
          }
          else {
            uint64_t v22 = 1;
          }
          *uint64_t v15 = v22;
        }
      }
      else
      {
        LODWORD(v12) = *(_DWORD *)(v16 + 248);
        *(_DWORD *)(v16 + 52) = v12;
        *(void *)(v16 + 32) = v11;
        if ((*(unsigned char *)(v16 + 49) & 4) != 0)
        {
          uint64_t v34 = 0;
          uint64_t v43 = 9;
          unint64_t v44 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v34 = *(void *)(v44 + 72);
          if (v34)
          {
            uint64_t v60 = 9;
            uint64_t v59 = 0;
            unint64_t v61 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            *(void *)(v61 + 72) = 0;
            uint64_t v35 = v34;
          }
          else
          {
            uint64_t v35 = _os_semaphore_create();
          }
          DWORD1(v12) = v35;
        }
      }
    }
    else
    {
      unsigned int v10 = 22;
    }
    v37 = &_pthread_list_lock;
    os_unfair_lock_t v67 = &_pthread_list_lock;
    int v66 = 0;
    uint64_t v68 = 3;
    uint64_t v69 = 3;
    unint64_t v70 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v66 = *(void *)(v70 + 24);
    int v65 = 0;
    int v64 = v66;
    int v63 = 0;
    int v7 = v66;
    int v8 = v66;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v8, 0, memory_order_release, memory_order_relaxed);
    if (v8 != v7) {
      int v64 = v8;
    }
    BOOL v62 = v8 == v7;
    if (v8 != v7) {
      os_unfair_lock_unlock(v67);
    }
    if (!v10)
    {
      if (v12) {
        unsigned int v10 = _pthread_joiner_wait(v16, v11, v14);
      }
      else {
        _pthread_deallocate(v16, 0);
      }
    }
    if (!v10 && DWORD1(v12) && (BYTE8(v12) & 1) == 0)
    {
      while (__semwait_signal_nocancel())
        ;
    }
    if (DWORD1(v12))
    {
      uint64_t v39 = DWORD1(v12);
      uint64_t v38 = 0;
      uint64_t v41 = 9;
      unint64_t v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v38 = *(void *)(v42 + 72);
      uint64_t v57 = 9;
      uint64_t v56 = DWORD1(v12);
      unint64_t v58 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(void *)(v58 + 72) = DWORD1(v12);
      if (v38) {
        _os_semaphore_dispose();
      }
    }
    return v10;
  }
  else
  {
    return 3;
  }
}

uint64_t _pthread_joiner_wait(uint64_t a1, unsigned char *a2, int a3)
{
  int v11 = (atomic_uint *)(a1 + 52);
  while (1)
  {
    unsigned int explicit = atomic_load_explicit(v11, memory_order_acquire);
    if (explicit == -1) {
      break;
    }
    if (explicit != *((_DWORD *)a2 + 4))
    {
      qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_join() state corruption";
      qword_2C058 = explicit;
      __break(1u);
      JUMPOUT(0xB1F0);
    }
    if (-(int)__ulock_wait() == 4)
    {
      BOOL v8 = 0;
      if (a3 == 2)
      {
        int v15 = 17;
        unsigned __int16 v3 = atomic_load((unsigned __int16 *)(*(void *)a2 + 166));
        BOOL v8 = (v15 & ~v3) == 0;
      }
      if (v8 && _pthread_joiner_abort_wait(a1, (uint64_t)a2))
      {
        *(unsigned char *)(*(void *)a2 + 165) = &def_10BC8 + 1;
        pthread_exit((char *)&def_10BC8 + 1);
      }
    }
  }
  BOOL v9 = 0;
  int v4 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v4, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  if ((a2[24] & 1) == 0)
  {
    if (*(void *)(a1 + 32) != (void)a2)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xB46CLL);
    }
    *(void *)(a1 + 32) = 0;
    BOOL v9 = (*(unsigned char *)(a1 + 49) & 2) != 0;
  }
  int v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v6 = v5;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 != v5) {
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  if (v9) {
    _pthread_deallocate(a1, 0);
  }
  return 0;
}

uint64_t pthread_join_NOCANCEL(uint64_t a1, uint64_t *a2)
{
  _pthread_testcancel_if_cancelable_variant();
  int v2 = _pthread_conformance();
  return _pthread_join(a1, a2, v2);
}

uint64_t _pthread_conformance()
{
  return 1;
}

uint64_t pthread_cond_wait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2)
{
  int v2 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, 0, 0, v2);
}

uint64_t pthread_cond_timedwait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3)
{
  int v3 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, a3, 0, v3);
}

uint64_t sigwait_NOCANCEL()
{
  unsigned int v1 = 0;
  _pthread_testcancel_if_cancelable_variant();
  if (__sigwait() == -1)
  {
    unsigned int v1 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant();
    if (v1 == 4) {
      return 0;
    }
  }
  return v1;
}

uint64_t _pthread_joiner_abort_wait(uint64_t a1, uint64_t a2)
{
  char v6 = 0;
  int v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v2, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  if ((*(unsigned char *)(a2 + 24) & 1) == 0 && *(_DWORD *)(a1 + 52) != -1)
  {
    if (*(void *)(a1 + 32) != a2)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xB8B4);
    }
    *(void *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    char v6 = 1;
  }
  int v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = v3;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&_pthread_list_lock, (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
  if (v4 != v3) {
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  return v6 & 1;
}

int pthread_condattr_init(pthread_condattr_t *a1)
{
  a1->__sig = 1129202753;
  *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | 2;
  return 0;
}

int pthread_condattr_destroy(pthread_condattr_t *a1)
{
  a1->__sig = 0;
  return 0;
}

int pthread_condattr_getpshared(const pthread_condattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1129202753)
  {
    *a2 = *(_DWORD *)a1->__opaque & 3;
    return 0;
  }
  return v3;
}

int pthread_condattr_setpshared(pthread_condattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1129202753 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | a2 & 3;
    return 0;
  }
  return v3;
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 1, 1);
}

uint64_t _pthread_cond_wait(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3, int a4, int a5)
{
  uint64_t v17 = (unsigned int *)a1;
  uint64_t v16 = a2;
  int v15 = a3;
  int v14 = a4;
  int v13 = a5;
  unsigned int v12 = 0;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  char v9 = 0;
  uint64_t v19 = a2;
  if ((a2->__sig & 0xFFFFFFFDLL) != 0x4D555458)
  {
    unsigned int v20 = v16;
    if ((v16->__sig & 0xFFFFFFF0) != 0x32AAABA0) {
      return 22;
    }
  }
  BOOL v8 = 0;
  uint64_t v21 = v16;
  BOOL v8 = (*(_DWORD *)&v16->__opaque[4] & 0x4000) != 0;
  int v7 = 0;
  if (v8) {
    int v5 = 1129270854;
  }
  else {
    int v5 = 1129270853;
  }
  int v7 = v5;
  int v27 = v17;
  int v26 = (unsigned int *)&v7;
  unsigned int v25 = 0;
  unsigned int v24 = 0;
  unsigned int v23 = *v17;
  unsigned int v24 = v23;
  unsigned int v22 = v23;
  unsigned int v25 = v23;
  if (v23 == 1018212795)
  {
    unsigned int v28 = _pthread_cond_check_init_slow((uint64_t)v27, v26);
  }
  else
  {
    uint64_t v35 = v27;
    unsigned int v34 = v25;
    char v33 = v26;
    int v32 = 0;
    if (v25 == 1129270852)
    {
      if (*v33 != 1129270852)
      {
        unsigned int v31 = 0;
        unsigned int v31 = *v33;
        unsigned int v30 = v31;
        unsigned int *v35 = v31;
        unsigned int v29 = v31;
      }
    }
    else if (v25 - 1129270853 < 2)
    {
      if (*v33 == 1129270852)
      {
        unsigned int *v33 = v34;
      }
      else if (*v33 != v34)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xBDBCLL);
      }
    }
    else
    {
      int v32 = 22;
    }
    unsigned int v28 = v32;
  }
  unsigned int v12 = v28;
  if (v28) {
    return v12;
  }
  if (v13 == 2) {
    pthread_testcancel();
  }
  if (v15)
  {
    if (v15[1] < 0 || (unint64_t)v15[1] >= 0x3B9ACA00) {
      return 22;
    }
    if (v14)
    {
      uint64_t v10 = *v15;
      uint64_t v11 = v15[1];
      if (!v10 && !v11) {
        char v9 = 1;
      }
      goto LABEL_40;
    }
    __gettimeofday();
    if (*v15)
    {
      if (*v15 >= 0) {
        goto LABEL_34;
      }
    }
    else if (v15[1] > 0)
    {
LABEL_34:
      uint64_t v11 = v15[1];
      uint64_t v10 = *v15;
      if (v11 < 0)
      {
        v11 += 1000000000;
        --v10;
      }
      goto LABEL_40;
    }
    char v9 = 1;
  }
LABEL_40:
  if (v8 || !*((void *)v17 + 2) || *((void *)v17 + 2) == (void)v16)
  {
    if (v9)
    {
      unsigned int v12 = pthread_mutex_unlock(v16);
      if (v12)
      {
        return v12;
      }
      else
      {
        unsigned int v12 = pthread_mutex_lock(v16);
        if (v12) {
          return v12;
        }
        else {
          return 60;
        }
      }
    }
    else if (v8)
    {
      return _pthread_ulock_cond_wait((uint64_t)v17, (uint64_t)v16, &v10, v13);
    }
    else
    {
      return _pthread_psynch_cond_wait((uint64_t)v17, v16, (uint64_t)&v10, v13);
    }
  }
  else
  {
    return 22;
  }
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  uint64_t v21 = (os_unfair_lock_s *)a1;
  int v20 = 22;
  int v19 = 0;
  int v18 = 0;
  int sig = a1->__sig;
  int v18 = sig;
  int v16 = sig;
  int v19 = sig;
  if (sig == 1018212795 || sig == 1129270852)
  {
LABEL_19:
    v21->_os_unfair_lock_opaque = 0;
    return 0;
  }
  if (sig != 1129270853)
  {
    if (sig != 1129270854) {
      return v20;
    }
    goto LABEL_19;
  }
  unsigned int v22 = v21 + 2;
  unsigned int v30 = v21 + 2;
  int v29 = 327680;
  os_unfair_lock_lock_with_options();
  unint64_t v15 = 0;
  unint64_t v14 = 0;
  unsigned int v13 = 0;
  int v12 = 0;
  unsigned int v11 = 0;
  uint64_t v10 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  int v7 = 0;
  int v27 = v21;
  int v26 = &v10;
  unsigned int v25 = (atomic_ullong **)&v9;
  unsigned int v24 = &v8;
  unsigned int v23 = &v7;
  if ((v21[3]._os_unfair_lock_opaque >> 29))
  {
    *unsigned int v25 = (atomic_ullong *)&v27[7];
    *unsigned int v23 = &v27[8]._os_unfair_lock_opaque;
    *unsigned int v24 = (int *)&v27[6];
  }
  else
  {
    *unsigned int v25 = (atomic_ullong *)&v27[6];
    *unsigned int v23 = &v27[7]._os_unfair_lock_opaque;
    *unsigned int v24 = (int *)&v27[8];
  }
  *int v26 = *v25;
  do
  {
    unsigned int v13 = *v9;
    int v12 = *v8;
    unsigned int v11 = *v7;
    if ((v13 & 0xFFFFFF00) != (v11 & 0xFFFFFF00)) {
      break;
    }
    unint64_t v15 = ((unint64_t)v11 << 32) | v13;
    unint64_t v14 = v15;
    unint64_t v1 = v15;
    unint64_t v2 = v15;
    atomic_compare_exchange_strong(v10, &v2, v15);
  }
  while (v2 != v1);
  BOOL v6 = (v11 & 2) != 0;
  v21->_os_unfair_lock_opaque = 0;
  int v20 = 0;
  unsigned int v28 = v21 + 2;
  os_unfair_lock_t v36 = v21 + 2;
  int v35 = 0;
  uint64_t v37 = 3;
  uint64_t v38 = 3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v35 = *(void *)(StatusReg + 24);
  int v34 = 0;
  int v33 = v35;
  int v32 = 0;
  int v3 = v35;
  int v4 = v35;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v21[2], (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
  if (v4 != v3) {
    int v33 = v4;
  }
  BOOL v31 = v4 == v3;
  if (v4 != v3) {
    os_unfair_lock_unlock(v36);
  }
  if (v6) {
    __psynch_cvclrprepost();
  }
  return v20;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  uint64_t v17 = a1;
  char v16 = 1;
  int v15 = 0;
  unsigned int v14 = 1129270852;
  unsigned int v24 = a1;
  unsigned int v23 = &v14;
  unsigned int v22 = 0;
  unsigned int v21 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v21 = sig;
  unsigned int v19 = sig;
  unsigned int v22 = sig;
  if (sig == 1018212795)
  {
    int v25 = _pthread_cond_check_init_slow((uint64_t)v24, v23);
  }
  else
  {
    v98 = v24;
    unsigned int v97 = v22;
    v96 = v23;
    int v95 = 0;
    if (v22 == 1129270852)
    {
      if (*v96 != 1129270852)
      {
        unsigned int v94 = 0;
        unsigned int v94 = *v96;
        unsigned int v93 = v94;
        LODWORD(v98->__sig) = v94;
        unsigned int v92 = v94;
      }
    }
    else if (v22 - 1129270853 < 2)
    {
      if (*v96 == 1129270852)
      {
        unsigned int *v96 = v97;
      }
      else if (*v96 != v97)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xC7CCLL);
      }
    }
    else
    {
      int v95 = 22;
    }
    int v25 = v95;
  }
  if (v25 || v14 == 1129270852) {
    return v25;
  }
  if (v14 != 1129270853)
  {
    if (v14 != 1129270854)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_2C058 = v14;
      __break(1u);
      JUMPOUT(0xD200);
    }
    v89 = v17;
    char v88 = v16 & 1;
    int v87 = v15;
    v86 = 0;
    v91 = v17;
    v86 = (atomic_ullong *)&v91->__opaque[4 * ((*(_DWORD *)&v91->__opaque[4] >> 29) & 1) + 16];
    uint64_t v85 = 0;
    unint64_t v84 = 0;
    BOOL v83 = 0;
    v82 = v86;
    uint64_t v85 = *(void *)v86;
    do
    {
      if (!WORD2(v85) || WORD2(v85) == HIWORD(v85)) {
        return 0;
      }
      LODWORD(v81) = v85 + 1;
      WORD2(v81) = WORD2(v85);
      if (v88)
      {
        __int16 v12 = WORD2(v85);
      }
      else
      {
        if (HIWORD(v85) + 1 < WORD2(v85)) {
          __int16 v11 = HIWORD(v85) + 1;
        }
        else {
          __int16 v11 = WORD2(v85);
        }
        __int16 v12 = v11;
      }
      HIWORD(v81) = v12;
      unint64_t v84 = v81;
      unint64_t v80 = v81;
      uint64_t v7 = v85;
      uint64_t v8 = v85;
      atomic_compare_exchange_strong_explicit(v82, (unint64_t *)&v8, v81, memory_order_release, memory_order_relaxed);
      if (v8 != v7) {
        uint64_t v85 = v8;
      }
      BOOL v79 = v8 == v7;
      BOOL v83 = v8 == v7;
    }
    while (v8 != v7);
    BOOL v78 = v83;
    if (HIWORD(v85) < (int)WORD2(v85))
    {
      int v77 = 16777217;
      if (v88)
      {
        v77 |= 0x100u;
      }
      else if (v87)
      {
        v77 |= 0x200u;
      }
      while (1)
      {
        int v76 = 0;
        int v76 = __ulock_wake();
        if ((v76 & 0x80000000) == 0) {
          break;
        }
        int v10 = -v76;
        if (v76 == -2) {
          break;
        }
        if (v10 != 4)
        {
          if (v10 != 37)
          {
            uint64_t v75 = -v76;
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_2C058 = v75;
            __break(1u);
            JUMPOUT(0xD1A4);
          }
          if (!v87)
          {
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xD148);
          }
          return pthread_cond_broadcast(v89);
        }
      }
    }
    return 0;
  }
  uint64_t v68 = v17;
  char v67 = v16 & 1;
  int v66 = v15;
  int v65 = 0;
  unsigned int v64 = 0;
  unsigned int v63 = 0;
  unint64_t v62 = 0;
  unint64_t v61 = 0;
  unsigned int v60 = 0;
  unsigned int v59 = 0;
  unsigned int v58 = 0;
  uint64_t v57 = 0;
  uint64_t v56 = 0;
  unint64_t v55 = 0;
  uint64_t v54 = 0;
  int v53 = 0;
  int v52 = 0;
  int v51 = 0;
  int v74 = v17;
  int v73 = &v57;
  int v72 = &v56;
  BOOL v71 = &v55;
  unint64_t v70 = &v54;
  if ((*(_DWORD *)&v17->__opaque[4] & 0x20000000) != 0)
  {
    *int v72 = (unsigned int *)&v74->__opaque[20];
    *unint64_t v70 = (unsigned int *)&v74->__opaque[24];
    *BOOL v71 = (atomic_uint *)&v74->__opaque[16];
  }
  else
  {
    *int v72 = (unsigned int *)&v74->__opaque[16];
    *unint64_t v70 = (unsigned int *)&v74->__opaque[20];
    *BOOL v71 = (atomic_uint *)&v74->__opaque[24];
  }
  *int v73 = (atomic_ullong *)*v72;
  char v50 = 0;
  do
  {
    char v50 = 0;
    unsigned int v60 = *v56;
    unsigned int v59 = *(_DWORD *)v55;
    unsigned int v58 = *v54;
    unsigned int v64 = 0;
    unsigned int v63 = 0;
    if ((v60 & 0xFFFFFF00) == (v58 & 0xFFFFFF00) || !v66 && (v60 & 0xFFFFFF00) == (v59 & 0xFFFFFF00))
    {
      unint64_t v62 = (unint64_t)v58 << 32;
      v62 |= v60;
      unint64_t v61 = v62;
      unint64_t v49 = v62;
      BOOL v48 = 0;
      unint64_t v46 = v62;
      unint64_t v45 = v62;
      unint64_t v47 = v62;
      unint64_t v1 = v62;
      unint64_t v2 = v62;
      atomic_compare_exchange_strong(v57, &v2, v62);
      if (v2 != v1) {
        unint64_t v49 = v2;
      }
      BOOL v44 = v2 == v1;
      BOOL v48 = v2 == v1;
      BOOL v43 = v48;
      if (v2 == v1) {
        return 0;
      }
      char v50 = 1;
    }
    else
    {
      if (v66) {
        break;
      }
      if (is_seqhigher(v58 & 0xFFFFFF00, v60 & 0xFFFFFF00))
      {
        if (++v53 > 0x2000) {
          return 35;
        }
LABEL_45:
        sched_yield();
        char v50 = 1;
        goto LABEL_52;
      }
      if (is_seqhigher(v59 & 0xFFFFFF00, v60 & 0xFFFFFF00))
      {
        if (++v52 > 0x2000)
        {
          if (v51) {
            return 35;
          }
          unsigned int v42 = v59;
          BOOL v41 = 0;
          unsigned int v39 = v58 & 0xFFFFFF00;
          unsigned int v38 = v58 & 0xFFFFFF00;
          unsigned int v40 = v58 & 0xFFFFFF00;
          unsigned int v3 = v59;
          unsigned int v4 = v59;
          atomic_compare_exchange_strong(v55, &v4, v58 & 0xFFFFFF00);
          if (v4 != v3) {
            unsigned int v42 = v4;
          }
          BOOL v37 = v4 == v3;
          BOOL v41 = v4 == v3;
          BOOL v36 = v41;
          if (v4 == v3)
          {
            int v51 = 1;
            int v52 = 0;
          }
        }
        goto LABEL_45;
      }
      if (is_seqlower(v59 & 0xFFFFFF00, v58 & 0xFFFFFF00)) {
        unsigned int v63 = v58 & 0xFFFFFF00;
      }
      else {
        unsigned int v63 = v59 & 0xFFFFFF00;
      }
      if (v67)
      {
        unsigned int v64 = diff_genseq(v60, v63);
        unsigned int v63 = v60 & 0xFFFFFF00;
      }
      else
      {
        v63 += 256;
      }
    }
LABEL_52:
    BOOL v13 = 1;
    if ((v50 & 1) == 0)
    {
      unsigned int v35 = v59;
      BOOL v34 = 0;
      unsigned int v32 = v63;
      unsigned int v31 = v63;
      unsigned int v33 = v63;
      unsigned int v5 = v59;
      unsigned int v6 = v59;
      atomic_compare_exchange_strong(v55, &v6, v63);
      if (v6 != v5) {
        unsigned int v35 = v6;
      }
      BOOL v30 = v6 == v5;
      BOOL v34 = v6 == v5;
      BOOL v29 = v34;
      BOOL v13 = v6 != v5;
    }
  }
  while (v13);
  int v28 = 0;
  if (*(_DWORD *)&v68->__opaque[4] >> 30 == 1) {
    v28 |= 0x10u;
  }
  unint64_t v27 = v60 | ((unint64_t)v58 << 32);
  if (v67)
  {
    unint64_t v26 = v64 | ((unint64_t)v59 << 32);
    int v65 = __psynch_cvbroad();
  }
  else
  {
    int v65 = __psynch_cvsignal();
  }
  if (v65 != -1 && v65) {
    _pthread_cond_updateval((uint64_t)v68, 0, 0, v65);
  }
  return 0;
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  mach_port_t v15 = 0;
  if (a2) {
    mach_port_t v15 = pthread_mach_thread_np(a2);
  }
  int v20 = a1;
  char v19 = 0;
  mach_port_t v18 = v15;
  unsigned int v17 = 1129270852;
  unint64_t v27 = a1;
  unint64_t v26 = &v17;
  unsigned int v25 = 0;
  unsigned int v24 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v24 = sig;
  unsigned int v22 = sig;
  unsigned int v25 = sig;
  if (sig == 1018212795)
  {
    int v28 = _pthread_cond_check_init_slow((uint64_t)v27, v26);
  }
  else
  {
    v101 = v27;
    unsigned int v100 = v25;
    v99 = v26;
    int v98 = 0;
    if (v25 == 1129270852)
    {
      if (*v99 != 1129270852)
      {
        unsigned int v97 = 0;
        unsigned int v97 = *v99;
        unsigned int v96 = v97;
        LODWORD(v101->__sig) = v97;
        unsigned int v95 = v97;
      }
    }
    else if (v100 - 1129270853 < 2)
    {
      if (*v99 == 1129270852)
      {
        unsigned int *v99 = v100;
      }
      else if (*v99 != v100)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xD444);
      }
    }
    else
    {
      int v98 = 22;
    }
    int v28 = v98;
  }
  if (v28 || v17 == 1129270852) {
    return v28;
  }
  if (v17 != 1129270853)
  {
    if (v17 != 1129270854)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_2C058 = v17;
      __break(1u);
      JUMPOUT(0xDEC4);
    }
    unsigned int v92 = v20;
    char v91 = v19 & 1;
    mach_port_t v90 = v18;
    v89 = 0;
    unsigned int v94 = v20;
    v89 = (atomic_ullong *)&v94->__opaque[4 * ((*(_DWORD *)&v94->__opaque[4] >> 29) & 1) + 16];
    uint64_t v88 = 0;
    unint64_t v87 = 0;
    BOOL v86 = 0;
    uint64_t v85 = v89;
    uint64_t v88 = *(void *)v89;
    do
    {
      if (!WORD2(v88) || WORD2(v88) == HIWORD(v88)) {
        return 0;
      }
      LODWORD(v84) = v88 + 1;
      WORD2(v84) = WORD2(v88);
      if (v91)
      {
        __int16 v13 = WORD2(v88);
      }
      else
      {
        if (HIWORD(v88) + 1 < WORD2(v88)) {
          __int16 v12 = HIWORD(v88) + 1;
        }
        else {
          __int16 v12 = WORD2(v88);
        }
        __int16 v13 = v12;
      }
      HIWORD(v84) = v13;
      unint64_t v87 = v84;
      unint64_t v83 = v84;
      uint64_t v8 = v88;
      uint64_t v9 = v88;
      atomic_compare_exchange_strong_explicit(v85, (unint64_t *)&v9, v84, memory_order_release, memory_order_relaxed);
      if (v9 != v8) {
        uint64_t v88 = v9;
      }
      BOOL v82 = v9 == v8;
      BOOL v86 = v9 == v8;
    }
    while (v9 != v8);
    BOOL v81 = v86;
    if (HIWORD(v88) < (int)WORD2(v88))
    {
      int v80 = 16777217;
      if (v91)
      {
        v80 |= 0x100u;
      }
      else if (v90)
      {
        v80 |= 0x200u;
      }
      while (1)
      {
        int v79 = 0;
        int v79 = __ulock_wake();
        if ((v79 & 0x80000000) == 0) {
          break;
        }
        int v11 = -v79;
        if (v79 == -2) {
          break;
        }
        if (v11 != 4)
        {
          if (v11 != 37)
          {
            uint64_t v78 = -v79;
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_2C058 = v78;
            __break(1u);
            JUMPOUT(0xDE68);
          }
          if (!v90)
          {
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xDE04);
          }
          return pthread_cond_broadcast(v92);
        }
      }
    }
    return 0;
  }
  BOOL v71 = v20;
  char v70 = v19 & 1;
  mach_port_t v69 = v18;
  int v68 = 0;
  unsigned int v67 = 0;
  unsigned int v66 = 0;
  unint64_t v65 = 0;
  unint64_t v64 = 0;
  unsigned int v63 = 0;
  unsigned int v62 = 0;
  unsigned int v61 = 0;
  unsigned int v60 = 0;
  unsigned int v59 = 0;
  unsigned int v58 = 0;
  uint64_t v57 = 0;
  int v56 = 0;
  int v55 = 0;
  int v54 = 0;
  int v77 = v20;
  int v76 = &v60;
  uint64_t v75 = &v59;
  int v74 = &v58;
  int v73 = &v57;
  if ((*(_DWORD *)&v20->__opaque[4] & 0x20000000) != 0)
  {
    *uint64_t v75 = (unsigned int *)&v77->__opaque[20];
    *int v73 = (unsigned int *)&v77->__opaque[24];
    *int v74 = (atomic_uint *)&v77->__opaque[16];
  }
  else
  {
    *uint64_t v75 = (unsigned int *)&v77->__opaque[16];
    *int v73 = (unsigned int *)&v77->__opaque[20];
    *int v74 = (atomic_uint *)&v77->__opaque[24];
  }
  *int v76 = (atomic_ullong *)*v75;
  char v53 = 0;
  do
  {
    char v53 = 0;
    unsigned int v63 = *v59;
    unsigned int v62 = *(_DWORD *)v58;
    unsigned int v61 = *v57;
    unsigned int v67 = 0;
    unsigned int v66 = 0;
    if ((v63 & 0xFFFFFF00) == (v61 & 0xFFFFFF00) || !v69 && (v63 & 0xFFFFFF00) == (v62 & 0xFFFFFF00))
    {
      unint64_t v65 = (unint64_t)v61 << 32;
      v65 |= v63;
      unint64_t v64 = v65;
      unint64_t v52 = v65;
      BOOL v51 = 0;
      unint64_t v49 = v65;
      unint64_t v48 = v65;
      unint64_t v50 = v65;
      unint64_t v2 = v65;
      unint64_t v3 = v65;
      atomic_compare_exchange_strong(v60, &v3, v65);
      if (v3 != v2) {
        unint64_t v52 = v3;
      }
      BOOL v47 = v3 == v2;
      BOOL v51 = v3 == v2;
      BOOL v46 = v51;
      if (v3 == v2) {
        return 0;
      }
      char v53 = 1;
    }
    else
    {
      if (v69) {
        break;
      }
      if (is_seqhigher(v61 & 0xFFFFFF00, v63 & 0xFFFFFF00))
      {
        if (++v56 > 0x2000) {
          return 35;
        }
LABEL_47:
        sched_yield();
        char v53 = 1;
        goto LABEL_54;
      }
      if (is_seqhigher(v62 & 0xFFFFFF00, v63 & 0xFFFFFF00))
      {
        if (++v55 > 0x2000)
        {
          if (v54) {
            return 35;
          }
          unsigned int v45 = v62;
          BOOL v44 = 0;
          unsigned int v42 = v61 & 0xFFFFFF00;
          unsigned int v41 = v61 & 0xFFFFFF00;
          unsigned int v43 = v61 & 0xFFFFFF00;
          unsigned int v4 = v62;
          unsigned int v5 = v62;
          atomic_compare_exchange_strong(v58, &v5, v61 & 0xFFFFFF00);
          if (v5 != v4) {
            unsigned int v45 = v5;
          }
          BOOL v40 = v5 == v4;
          BOOL v44 = v5 == v4;
          BOOL v39 = v44;
          if (v5 == v4)
          {
            int v54 = 1;
            int v55 = 0;
          }
        }
        goto LABEL_47;
      }
      if (is_seqlower(v62 & 0xFFFFFF00, v61 & 0xFFFFFF00)) {
        unsigned int v66 = v61 & 0xFFFFFF00;
      }
      else {
        unsigned int v66 = v62 & 0xFFFFFF00;
      }
      if (v70)
      {
        unsigned int v67 = diff_genseq(v63, v66);
        unsigned int v66 = v63 & 0xFFFFFF00;
      }
      else
      {
        v66 += 256;
      }
    }
LABEL_54:
    BOOL v14 = 1;
    if ((v53 & 1) == 0)
    {
      unsigned int v38 = v62;
      BOOL v37 = 0;
      unsigned int v35 = v66;
      unsigned int v34 = v66;
      unsigned int v36 = v66;
      unsigned int v6 = v62;
      unsigned int v7 = v62;
      atomic_compare_exchange_strong(v58, &v7, v66);
      if (v7 != v6) {
        unsigned int v38 = v7;
      }
      BOOL v33 = v7 == v6;
      BOOL v37 = v7 == v6;
      BOOL v32 = v37;
      BOOL v14 = v7 != v6;
    }
  }
  while (v14);
  int v31 = 0;
  if (*(_DWORD *)&v71->__opaque[4] >> 30 == 1) {
    v31 |= 0x10u;
  }
  unint64_t v30 = v63 | ((unint64_t)v61 << 32);
  if (v70)
  {
    unint64_t v29 = v67 | ((unint64_t)v62 << 32);
    int v68 = __psynch_cvbroad();
  }
  else
  {
    int v68 = __psynch_cvsignal();
  }
  if (v68 != -1 && v68) {
    _pthread_cond_updateval((uint64_t)v71, 0, 0, v68);
  }
  return 0;
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  unsigned int v17 = a1;
  char v16 = 0;
  int v15 = 0;
  unsigned int v14 = 1129270852;
  unsigned int v24 = a1;
  unsigned int v23 = &v14;
  unsigned int v22 = 0;
  unsigned int v21 = 0;
  unsigned int sig = a1->__sig;
  unsigned int v21 = sig;
  unsigned int v19 = sig;
  unsigned int v22 = sig;
  if (sig == 1018212795)
  {
    int v25 = _pthread_cond_check_init_slow((uint64_t)v24, v23);
  }
  else
  {
    int v98 = v24;
    unsigned int v97 = v22;
    unsigned int v96 = v23;
    int v95 = 0;
    if (v22 == 1129270852)
    {
      if (*v96 != 1129270852)
      {
        unsigned int v94 = 0;
        unsigned int v94 = *v96;
        unsigned int v93 = v94;
        LODWORD(v98->__sig) = v94;
        unsigned int v92 = v94;
      }
    }
    else if (v22 - 1129270853 < 2)
    {
      if (*v96 == 1129270852)
      {
        unsigned int *v96 = v97;
      }
      else if (*v96 != v97)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xE0B8);
      }
    }
    else
    {
      int v95 = 22;
    }
    int v25 = v95;
  }
  if (v25 || v14 == 1129270852) {
    return v25;
  }
  if (v14 != 1129270853)
  {
    if (v14 != 1129270854)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_2C058 = v14;
      __break(1u);
      JUMPOUT(0xEAECLL);
    }
    v89 = v17;
    char v88 = v16 & 1;
    int v87 = v15;
    BOOL v86 = 0;
    char v91 = v17;
    BOOL v86 = (atomic_ullong *)&v91->__opaque[4 * ((*(_DWORD *)&v91->__opaque[4] >> 29) & 1) + 16];
    uint64_t v85 = 0;
    unint64_t v84 = 0;
    BOOL v83 = 0;
    BOOL v82 = v86;
    uint64_t v85 = *(void *)v86;
    do
    {
      if (!WORD2(v85) || WORD2(v85) == HIWORD(v85)) {
        return 0;
      }
      LODWORD(v81) = v85 + 1;
      WORD2(v81) = WORD2(v85);
      if (v88)
      {
        __int16 v12 = WORD2(v85);
      }
      else
      {
        if (HIWORD(v85) + 1 < WORD2(v85)) {
          __int16 v11 = HIWORD(v85) + 1;
        }
        else {
          __int16 v11 = WORD2(v85);
        }
        __int16 v12 = v11;
      }
      HIWORD(v81) = v12;
      unint64_t v84 = v81;
      unint64_t v80 = v81;
      uint64_t v7 = v85;
      uint64_t v8 = v85;
      atomic_compare_exchange_strong_explicit(v82, (unint64_t *)&v8, v81, memory_order_release, memory_order_relaxed);
      if (v8 != v7) {
        uint64_t v85 = v8;
      }
      BOOL v79 = v8 == v7;
      BOOL v83 = v8 == v7;
    }
    while (v8 != v7);
    BOOL v78 = v83;
    if (HIWORD(v85) < (int)WORD2(v85))
    {
      int v77 = 16777217;
      if (v88)
      {
        v77 |= 0x100u;
      }
      else if (v87)
      {
        v77 |= 0x200u;
      }
      while (1)
      {
        int v76 = 0;
        int v76 = __ulock_wake();
        if ((v76 & 0x80000000) == 0) {
          break;
        }
        int v10 = -v76;
        if (v76 == -2) {
          break;
        }
        if (v10 != 4)
        {
          if (v10 != 37)
          {
            uint64_t v75 = -v76;
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_2C058 = v75;
            __break(1u);
            JUMPOUT(0xEA90);
          }
          if (!v87)
          {
            qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xEA34);
          }
          return pthread_cond_broadcast(v89);
        }
      }
    }
    return 0;
  }
  int v68 = v17;
  char v67 = v16 & 1;
  int v66 = v15;
  int v65 = 0;
  unsigned int v64 = 0;
  unsigned int v63 = 0;
  unint64_t v62 = 0;
  unint64_t v61 = 0;
  unsigned int v60 = 0;
  unsigned int v59 = 0;
  unsigned int v58 = 0;
  uint64_t v57 = 0;
  int v56 = 0;
  int v55 = 0;
  int v54 = 0;
  int v53 = 0;
  int v52 = 0;
  int v51 = 0;
  int v74 = v17;
  int v73 = &v57;
  int v72 = &v56;
  BOOL v71 = &v55;
  char v70 = &v54;
  if ((*(_DWORD *)&v17->__opaque[4] & 0x20000000) != 0)
  {
    *int v72 = (unsigned int *)&v74->__opaque[20];
    *char v70 = (unsigned int *)&v74->__opaque[24];
    *BOOL v71 = (atomic_uint *)&v74->__opaque[16];
  }
  else
  {
    *int v72 = (unsigned int *)&v74->__opaque[16];
    *char v70 = (unsigned int *)&v74->__opaque[20];
    *BOOL v71 = (atomic_uint *)&v74->__opaque[24];
  }
  *int v73 = (atomic_ullong *)*v72;
  char v50 = 0;
  do
  {
    char v50 = 0;
    unsigned int v60 = *v56;
    unsigned int v59 = *(_DWORD *)v55;
    unsigned int v58 = *v54;
    unsigned int v64 = 0;
    unsigned int v63 = 0;
    if ((v60 & 0xFFFFFF00) == (v58 & 0xFFFFFF00) || !v66 && (v60 & 0xFFFFFF00) == (v59 & 0xFFFFFF00))
    {
      unint64_t v62 = (unint64_t)v58 << 32;
      v62 |= v60;
      unint64_t v61 = v62;
      unint64_t v49 = v62;
      BOOL v48 = 0;
      unint64_t v46 = v62;
      unint64_t v45 = v62;
      unint64_t v47 = v62;
      unint64_t v1 = v62;
      unint64_t v2 = v62;
      atomic_compare_exchange_strong(v57, &v2, v62);
      if (v2 != v1) {
        unint64_t v49 = v2;
      }
      BOOL v44 = v2 == v1;
      BOOL v48 = v2 == v1;
      BOOL v43 = v48;
      if (v2 == v1) {
        return 0;
      }
      char v50 = 1;
    }
    else
    {
      if (v66) {
        break;
      }
      if (is_seqhigher(v58 & 0xFFFFFF00, v60 & 0xFFFFFF00))
      {
        if (++v53 > 0x2000) {
          return 35;
        }
LABEL_45:
        sched_yield();
        char v50 = 1;
        goto LABEL_52;
      }
      if (is_seqhigher(v59 & 0xFFFFFF00, v60 & 0xFFFFFF00))
      {
        if (++v52 > 0x2000)
        {
          if (v51) {
            return 35;
          }
          unsigned int v42 = v59;
          BOOL v41 = 0;
          unsigned int v39 = v58 & 0xFFFFFF00;
          unsigned int v38 = v58 & 0xFFFFFF00;
          unsigned int v40 = v58 & 0xFFFFFF00;
          unsigned int v3 = v59;
          unsigned int v4 = v59;
          atomic_compare_exchange_strong(v55, &v4, v58 & 0xFFFFFF00);
          if (v4 != v3) {
            unsigned int v42 = v4;
          }
          BOOL v37 = v4 == v3;
          BOOL v41 = v4 == v3;
          BOOL v36 = v41;
          if (v4 == v3)
          {
            int v51 = 1;
            int v52 = 0;
          }
        }
        goto LABEL_45;
      }
      if (is_seqlower(v59 & 0xFFFFFF00, v58 & 0xFFFFFF00)) {
        unsigned int v63 = v58 & 0xFFFFFF00;
      }
      else {
        unsigned int v63 = v59 & 0xFFFFFF00;
      }
      if (v67)
      {
        unsigned int v64 = diff_genseq(v60, v63);
        unsigned int v63 = v60 & 0xFFFFFF00;
      }
      else
      {
        v63 += 256;
      }
    }
LABEL_52:
    BOOL v13 = 1;
    if ((v50 & 1) == 0)
    {
      unsigned int v35 = v59;
      BOOL v34 = 0;
      unsigned int v32 = v63;
      unsigned int v31 = v63;
      unsigned int v33 = v63;
      unsigned int v5 = v59;
      unsigned int v6 = v59;
      atomic_compare_exchange_strong(v55, &v6, v63);
      if (v6 != v5) {
        unsigned int v35 = v6;
      }
      BOOL v30 = v6 == v5;
      BOOL v34 = v6 == v5;
      BOOL v29 = v34;
      BOOL v13 = v6 != v5;
    }
  }
  while (v13);
  int v28 = 0;
  if (*(_DWORD *)&v68->__opaque[4] >> 30 == 1) {
    v28 |= 0x10u;
  }
  unint64_t v27 = v60 | ((unint64_t)v58 << 32);
  if (v67)
  {
    unint64_t v26 = v64 | ((unint64_t)v59 << 32);
    int v65 = __psynch_cvbroad();
  }
  else
  {
    int v65 = __psynch_cvsignal();
  }
  if (v65 != -1 && v65) {
    _pthread_cond_updateval((uint64_t)v68, 0, 0, v65);
  }
  return 0;
}

uint64_t _pthread_ulock_cond_wait(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v42 = a1;
  uint64_t v41 = a2;
  unsigned int v40 = a3;
  int v39 = a4;
  BOOL v38 = a4 == 2;
  uint64_t v37 = 0;
  if (*a3 || v40[1])
  {
    uint64_t v36 = 0;
    uint64_t v36 = v40[1] & 0x3FFFFFFF;
    uint64_t v35 = 0;
    BOOL v34 = 0;
    char v33 = 0;
    uint64_t v4 = *v40;
    BOOL v5 = *v40 < 0;
    if (*v40 < 0) {
      uint64_t v4 = -v4;
    }
    uint64_t v6 = ((unint64_t)v4 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
    uint64_t v7 = 1000000000 * v4;
    if (*v40 >= 0) {
      uint64_t v8 = 1000000000 * v4;
    }
    else {
      uint64_t v8 = -1000000000 * v4;
    }
    if (!v7) {
      BOOL v5 = 0;
    }
    if (v6) {
      BOOL v5 = 1;
    }
    uint64_t v35 = v8;
    BOOL v47 = v5;
    BOOL v34 = v5;
    BOOL v9 = __CFADD__(v36, v8);
    uint64_t v10 = v36 + v8;
    char v11 = v9;
    uint64_t v37 = v10;
    char v46 = v11;
    char v33 = v11 & 1;
    int v32 = v34 | v11 & 1;
    BOOL v45 = v32 != 0;
    if (v34 | v11 & 1) {
      uint64_t v37 = -1;
    }
  }
  unsigned int v31 = 0;
  uint64_t v44 = v42;
  unsigned int v31 = (atomic_ullong *)(v44 + 4 * ((*(_DWORD *)(v44 + 12) >> 29) & 1) + 24);
  uint64_t v28 = 0x100000000;
  uint64_t v27 = 0x100000000;
  uint64_t v29 = 0x100000000;
  uint64_t v23 = 0x100000000;
  uint64_t v22 = 0x100000000;
  uint64_t v24 = 0x100000000;
  add_unsigned int explicit = atomic_fetch_add_explicit(v31, 0x100000000uLL, memory_order_relaxed);
  unint64_t v25 = add_explicit;
  unint64_t v20 = add_explicit;
  unint64_t v26 = add_explicit + 0x100000000;
  unint64_t v30 = add_explicit + 0x100000000;
  unsigned int v19 = _pthread_mutex_ulock_unlock(v41);
  if (v19) {
    return _pthread_ulock_cond_wait_complete(v31, 0, v19);
  }
  while (1)
  {
    int v18 = 16777217;
    if (v38)
    {
      v17[0] = v42;
      v17[1] = v41;
      uint64_t v16 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v48 = StatusReg;
      unint64_t v14 = StatusReg - 224;
      v15[0] = _pthread_ulock_cond_cleanup;
      v15[1] = v17;
      uint64_t v16 = *(void *)(StatusReg - 216);
      *(void *)(v14 + 8) = v15;
      unsigned int v19 = __ulock_wait2();
      pthread_testcancel();
      *(void *)(v14 + 8) = v16;
    }
    else
    {
      unsigned int v19 = __ulock_wait2();
    }
    if ((v19 & 0x80000000) == 0)
    {
      unsigned int v19 = 0;
      goto LABEL_31;
    }
    unsigned int v13 = -v19;
    if (v19 == -4)
    {
      unsigned int v19 = 0;
      return _pthread_ulock_cond_wait_complete(v31, v41, v19);
    }
    if (v13 != 14) {
      break;
    }
LABEL_31:
    if (*(_DWORD *)v31 != v30) {
      return _pthread_ulock_cond_wait_complete(v31, v41, v19);
    }
  }
  if (v13 != 60)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
    qword_2C058 = -v19;
    __break(1u);
    JUMPOUT(0xEF04);
  }
  unsigned int v19 = 60;
  return _pthread_ulock_cond_wait_complete(v31, v41, v19);
}

uint64_t _pthread_psynch_cond_wait(uint64_t a1, pthread_mutex_t *a2, uint64_t a3, int a4)
{
  uint64_t v41 = a1;
  unsigned int v40 = a2;
  uint64_t v39 = a3;
  int v38 = a4;
  unsigned int v37 = 0;
  unsigned int v36 = 0;
  int v35 = 0;
  int v34 = 0;
  unsigned int v33 = 0;
  int v32 = 0;
  unsigned int v31 = 0;
  unsigned int v30 = 0;
  unsigned int v29 = 0;
  int v28 = 0;
  uint64_t v27 = 0;
  unint64_t v26 = 0;
  unint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v23 = 0;
  unint64_t v22 = 0;
  unint64_t v21 = 0;
  unint64_t v20 = 0;
  uint64_t v19 = 0;
  uint64_t v47 = a1;
  char v46 = &v27;
  BOOL v45 = (atomic_ullong **)&v26;
  uint64_t v44 = &v25;
  BOOL v43 = &v24;
  if ((*(_DWORD *)(a1 + 12) >> 29))
  {
    os_unfair_lock_s *v45 = (atomic_ullong *)(v47 + 28);
    *BOOL v43 = (unsigned int *)(v47 + 32);
    *uint64_t v44 = (int *)(v47 + 24);
  }
  else
  {
    os_unfair_lock_s *v45 = (atomic_ullong *)(v47 + 24);
    *BOOL v43 = (unsigned int *)(v47 + 28);
    *uint64_t v44 = (int *)(v47 + 32);
  }
  *char v46 = *v45;
  do
  {
    unsigned int v33 = *v26;
    int v32 = *v25;
    unsigned int v31 = *v24;
    unint64_t v23 = ((unint64_t)v31 << 32) | v33;
    int v28 = v31 & 3;
    unsigned int v29 = v31 & 0xFFFFFF00;
    unsigned int v30 = v33 + 256;
    unint64_t v22 = ((unint64_t)(v31 & 0xFFFFFF00) << 32) | (v33 + 256);
    unint64_t v18 = v23;
    BOOL v17 = 0;
    unint64_t v15 = v22;
    unint64_t v14 = v22;
    unint64_t v16 = v22;
    unint64_t v4 = v23;
    unint64_t v5 = v23;
    atomic_compare_exchange_strong(v27, &v5, v22);
    if (v5 != v4) {
      unint64_t v18 = v5;
    }
    BOOL v13 = v5 == v23;
    BOOL v17 = v5 == v23;
    BOOL v12 = v17;
  }
  while (v5 != v23);
  *(void *)(v41 + 16) = v40;
  unsigned int v11 = _pthread_mutex_droplock((uint64_t)v40, &v35, &v19, &v37, &v36);
  if (v11)
  {
    return 22;
  }
  else
  {
    if ((v35 & 0x1000) != 0)
    {
      unint64_t v21 = v37 | ((unint64_t)v36 << 32);
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v21 = 0;
    }
    v35 &= ~0x2000u;
    unint64_t v20 = v30 | ((unint64_t)(v29 | v28) << 32);
    if (v38 == 2)
    {
      uint64_t v10 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      unint64_t v48 = StatusReg;
      unint64_t v8 = StatusReg - 224;
      v9[0] = _pthread_psynch_cond_cleanup;
      v9[1] = v41;
      uint64_t v10 = *(void *)(StatusReg - 216);
      *(void *)(v8 + 8) = v9;
      int v34 = __psynch_cvwait();
      pthread_testcancel();
      *(void *)(v8 + 8) = v10;
    }
    else
    {
      int v34 = __psynch_cvwait();
    }
    if (v34 == -1)
    {
      uint64_t v50 = 1;
      uint64_t v51 = 1;
      unint64_t v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v7 = **(_DWORD **)(v52 + 8);
      if (v7 == 4)
      {
        unsigned int v11 = 0;
      }
      else if (v7 == 60)
      {
        unsigned int v11 = 60;
      }
      else
      {
        unsigned int v11 = 22;
      }
      _pthread_cond_updateval(v41, (uint64_t)v40, v7, 0);
    }
    else if (v34)
    {
      _pthread_cond_updateval(v41, (uint64_t)v40, 0, v34);
    }
    pthread_mutex_lock(v40);
    return v11;
  }
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  *(_DWORD *)a1->__opaque = 0;
  BOOL v9 = (unsigned int *)a1;
  unint64_t v8 = a2;
  unsigned int v7 = 1129270852;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  uint64_t v4 = 0;
  unsigned int v3 = 0;
  *(void *)&a1->__opaque[8] = 0;
  v9[6] = 0;
  v9[7] = 0;
  v9[8] = 0;
  v9[3] &= 0xE0000000;
  v9[3] = v9[3] & 0xDFFFFFFF | (((((_BYTE)v9 + 24) & 7) != 0) << 29);
  unint64_t v14 = v9;
  BOOL v13 = &v6;
  BOOL v12 = &v5;
  unsigned int v11 = &v4;
  uint64_t v10 = &v3;
  if ((v9[3] >> 29))
  {
    *BOOL v12 = (uint64_t)(v14 + 7);
    *uint64_t v10 = v14 + 8;
    *unsigned int v11 = (uint64_t)(v14 + 6);
  }
  else
  {
    *BOOL v12 = (uint64_t)(v14 + 6);
    *uint64_t v10 = v14 + 7;
    *unsigned int v11 = (uint64_t)(v14 + 8);
  }
  uint64_t *v13 = *v12;
  *unsigned int v3 = 1;
  if (v8) {
    v9[3] = v9[3] & 0x3FFFFFFF | (*(_DWORD *)v8->__opaque << 30);
  }
  else {
    v9[3] = v9[3] & 0x3FFFFFFF | 0x80000000;
  }
  int result = 0;
  v9[1] = 0;
  atomic_store(v7, v9);
  return result;
}

BOOL is_seqhigher(int a1, int a2)
{
  unsigned int v4 = a1 & 0xFFFFFF00;
  unsigned int v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) <= (a2 & 0xFFFFFF00)) {
    return v3 - v4 > 0x7FFFFF80;
  }
  else {
    return v4 - v3 < 0x7FFFFF80;
  }
}

BOOL is_seqlower(int a1, int a2)
{
  unsigned int v4 = a1 & 0xFFFFFF00;
  unsigned int v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) >= (a2 & 0xFFFFFF00)) {
    return v4 - v3 > 0x7FFFFF80;
  }
  else {
    return v3 - v4 < 0x7FFFFF80;
  }
}

uint64_t diff_genseq(int a1, int a2)
{
  if ((a1 & 0xFFFFFF00) == (a2 & 0xFFFFFF00)) {
    return 0;
  }
  else {
    return (a1 & 0xFFFFFF00) - (a2 & 0xFFFFFF00);
  }
}

uint64_t _pthread_cond_updateval(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v22 = a1;
  uint64_t v21 = a2;
  int v20 = a3;
  int v19 = a4;
  int v18 = 0;
  int v17 = 0;
  unsigned int v16 = 0;
  unint64_t v15 = 0;
  unint64_t v14 = 0;
  unsigned int v13 = 0;
  int v12 = 0;
  unsigned int v11 = 0;
  uint64_t v10 = 0;
  BOOL v9 = 0;
  unint64_t v8 = 0;
  unsigned int v7 = 0;
  if (a3)
  {
    int v19 = 256;
    if ((v20 & 0x100) != 0) {
      v19 |= 1u;
    }
    if ((v20 & 0x200) != 0) {
      v19 |= 2u;
    }
  }
  uint64_t v27 = (unsigned int *)v22;
  unint64_t v26 = &v10;
  unint64_t v25 = &v9;
  uint64_t v24 = &v8;
  unint64_t v23 = &v7;
  if ((*(_DWORD *)(v22 + 12) >> 29))
  {
    *unint64_t v25 = v27 + 7;
    *unint64_t v23 = v27 + 8;
    *uint64_t v24 = (int *)(v27 + 6);
  }
  else
  {
    *unint64_t v25 = v27 + 6;
    *unint64_t v23 = v27 + 7;
    *uint64_t v24 = (int *)(v27 + 8);
  }
  *unint64_t v26 = (atomic_ullong *)*v25;
  do
  {
    unsigned int v13 = *v9;
    int v12 = *v8;
    unsigned int v11 = *v7;
    unsigned int v16 = 0;
    int v18 = 0;
    uint64_t result = diff_genseq(v13, v11);
    int v17 = result;
    unint64_t v15 = (unint64_t)v11 << 32;
    v15 |= v13;
    if (result || (v19 & 2) != 0)
    {
      unsigned int v16 = (v11 & 0xFFFFFF00) + (v19 & 0xFFFFFF00);
      v16 |= v11 & 3 | v19 & 3;
      if ((v16 & 0xFFFFFF00) == (v13 & 0xFFFFFF00) && (v16 & 3) == 3)
      {
        v16 &= ~2u;
        int v18 = 1;
      }
      unint64_t v14 = (unint64_t)v16 << 32;
      v14 |= v13;
    }
    else
    {
      unint64_t v14 = v15;
    }
    unint64_t v5 = v15;
    unint64_t v6 = v15;
    atomic_compare_exchange_strong(v10, &v6, v14);
  }
  while (v6 != v5);
  if (v17 && (v16 & 0xFFFFFF00) == (v13 & 0xFFFFFF00)) {
    *(void *)(v22 + 16) = 0;
  }
  if (v18) {
    return __psynch_cvclrprepost();
  }
  return result;
}

uint64_t _pthread_cond_check_init_slow(uint64_t a1, unsigned int *a2)
{
  uint64_t v29 = a1 + 8;
  int v28 = 327680;
  unsigned int v27 = 0;
  uint64_t v30 = 3;
  uint64_t v31 = 3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v27 = *(void *)(StatusReg + 24);
  int v26 = 0;
  unsigned int v25 = v27;
  unsigned int v24 = v27;
  int v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v2, v27, memory_order_acquire, memory_order_acquire);
  if (v2) {
    int v26 = v2;
  }
  BOOL v23 = v2 == 0;
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  unsigned int v7 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 1018212795)
  {
    unsigned int v3 = *a2;
    int v17 = (unsigned int *)a1;
    uint64_t v16 = 0;
    unsigned int v15 = v3;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    unsigned int v11 = 0;
    *(void *)(a1 + 16) = 0;
    v17[6] = 0;
    v17[7] = 0;
    v17[8] = 0;
    v17[3] &= 0xE0000000;
    v17[3] = v17[3] & 0xDFFFFFFF | (((((_BYTE)v17 + 24) & 7) != 0) << 29);
    uint64_t v22 = v17;
    uint64_t v21 = &v14;
    int v20 = &v13;
    int v19 = &v12;
    int v18 = &v11;
    if ((v17[3] & 0x20000000) != 0)
    {
      uint64_t *v20 = (uint64_t)(v22 + 7);
      void *v18 = v22 + 8;
      uint64_t *v19 = (uint64_t)(v22 + 6);
    }
    else
    {
      uint64_t *v20 = (uint64_t)(v22 + 6);
      void *v18 = v22 + 7;
      uint64_t *v19 = (uint64_t)(v22 + 8);
    }
    *uint64_t v21 = *v20;
    *unsigned int v11 = 1;
    if (v16) {
      v17[3] = v17[3] & 0x3FFFFFFF | (*(_DWORD *)(v16 + 8) << 30);
    }
    else {
      v17[3] = v17[3] & 0x3FFFFFFF | 0x80000000;
    }
    v17[1] = 0;
    atomic_store(v15, v17);
    unsigned int v8 = 0;
  }
  else
  {
    unint64_t v48 = (unsigned int *)a1;
    unsigned int v47 = v7;
    char v46 = a2;
    int v45 = 0;
    if (v7 == 1129270852)
    {
      if (*v46 != 1129270852)
      {
        unsigned int v44 = 0;
        unsigned int v44 = *v46;
        unsigned int v43 = v44;
        *unint64_t v48 = v44;
        unsigned int v42 = v44;
      }
    }
    else if (v47 - 1129270853 < 2)
    {
      if (*v46 == 1129270852)
      {
        *char v46 = v47;
      }
      else if (*v46 != v47)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0x10160);
      }
    }
    else
    {
      int v45 = 22;
    }
    unsigned int v8 = v45;
  }
  os_unfair_lock_t v38 = (os_unfair_lock_t)(a1 + 8);
  int v37 = 0;
  uint64_t v39 = 3;
  uint64_t v40 = 3;
  unint64_t v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v37 = *(void *)(v41 + 24);
  int v36 = 0;
  int v35 = v37;
  int v34 = 0;
  int v4 = v37;
  int v5 = v37;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4) {
    int v35 = v5;
  }
  BOOL v33 = v5 == v4;
  if (v5 != v4) {
    os_unfair_lock_unlock(v38);
  }
  return v8;
}

uint64_t _pthread_ulock_cond_wait_complete(atomic_ullong *a1, uint64_t a2, unsigned int a3)
{
  if (a2) {
    _pthread_mutex_ulock_lock(a2, 0);
  }
  for (uint64_t i = *(void *)a1; ; uint64_t i = v4)
  {
    LODWORD(v7) = i;
    __int16 v6 = HIWORD(i) ? HIWORD(i) - 1 : 0;
    HIWORD(v7) = v6;
    uint64_t v3 = i;
    uint64_t v4 = i;
    WORD2(v7) = WORD2(i) - 1;
    atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, v7, memory_order_acquire, memory_order_acquire);
    if (v4 == v3) {
      break;
    }
  }
  return a3;
}

uint64_t _pthread_ulock_cond_cleanup(uint64_t *a1)
{
  return pthread_cond_signal((pthread_cond_t *)*a1);
}

uint64_t _pthread_psynch_cond_cleanup(uint64_t result)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (*(unsigned char *)(StatusReg - 59))
  {
    unint64_t v1 = *(pthread_mutex_t **)(result + 16);
    uint64_t result = _pthread_cond_updateval(result, (uint64_t)v1, *(_DWORD *)(StatusReg - 56), 0);
    if (v1) {
      return pthread_mutex_lock(v1);
    }
  }
  return result;
}

unsigned char *_pthread_mutex_global_init(uint64_t a1, uint64_t a2)
{
  int v9 = 2;
  if (*(_DWORD *)(a2 + 44))
  {
    int v8 = *(unsigned __int8 *)(a2 + 44);
    if (_pthread_mutex_policy_validate(v8)) {
      int v9 = _pthread_mutex_policy_to_opt(v8);
    }
  }
  __int16 v6 = (char *)_simple_getenv();
  if (v6)
  {
    int v5 = *v6 - 48;
    if (_pthread_mutex_policy_validate(v5)) {
      int v9 = _pthread_mutex_policy_to_opt(v5);
    }
  }
  if (v9 != __pthread_mutex_default_opt_policy) {
    __pthread_mutex_default_opt_policy = v9;
  }
  BOOL v4 = 0;
  unint64_t v7 = (unsigned char *)_simple_getenv();
  if (v7)
  {
    BOOL v4 = *v7 == 49;
  }
  else if (*(_DWORD *)(a2 + 44))
  {
    BOOL v4 = (*(_DWORD *)(a2 + 44) & 0x100) != 0;
  }
  if (v4 != (__pthread_mutex_use_ulock & 1)) {
    __pthread_mutex_use_uos_unfair_lock_t lock = v4;
  }
  BOOL v3 = 0;
  uint64_t result = (unsigned char *)_simple_getenv();
  if (result)
  {
    BOOL v3 = *result == 49;
  }
  else if (*(_DWORD *)(a2 + 44))
  {
    BOOL v3 = (*(_DWORD *)(a2 + 44) & 0x200) != 0;
  }
  if (v3 != (__pthread_mutex_ulock_adaptive_spin & 1)) {
    __pthread_mutex_ulock_adaptive_spin = v3;
  }
  return result;
}

BOOL _pthread_mutex_policy_validate(int a1)
{
  BOOL v2 = 0;
  if (a1 >= 0) {
    return a1 < 4;
  }
  return v2;
}

uint64_t _pthread_mutex_policy_to_opt(int a1)
{
  if (a1 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

BOOL mutex_seq_atomic_cmpxchgv_relaxed(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v3 = *a2;
  uint64_t v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_relaxed, memory_order_relaxed);
  if (v4 != v3) {
    uint64_t v6 = v4;
  }
  *a2 = v6;
  return v4 == v3;
}

BOOL mutex_seq_atomic_cmpxchgv_acquire(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v3 = *a2;
  uint64_t v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_acquire, memory_order_acquire);
  if (v4 != v3) {
    uint64_t v6 = v4;
  }
  *a2 = v6;
  return v4 == v3;
}

BOOL mutex_seq_atomic_cmpxchgv_release(atomic_ullong *a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v3 = *a2;
  uint64_t v4 = *a2;
  atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v4, *a3, memory_order_release, memory_order_relaxed);
  if (v4 != v3) {
    uint64_t v6 = v4;
  }
  *a2 = v6;
  return v4 == v3;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  *(_DWORD *)a1->__opaque = 0;
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  unsigned int v12 = 7;
  *(_DWORD *)&a1->__opaque[4] = 0;
  *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFDFFF | 0x2000;
  if (v13)
  {
    if (v13->__sig == 1297373249)
    {
      *(_WORD *)&v14->__opaque[8] = *(_DWORD *)v13->__opaque;
      *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFFC | *(_DWORD *)&v13->__opaque[4] & 3;
      *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFE3F | (((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) << 6);
      *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFF3 | (4
                                                                                * ((*(_DWORD *)&v13->__opaque[4] >> 2) & 3));
      *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFCF | (16
                                                                                * ((*(_DWORD *)&v13->__opaque[4] >> 4) & 3));
LABEL_18:
      *(_WORD *)&v14->__opaque[10] = 0;
      uint64_t v11 = 1297437784;
      if (((*(_DWORD *)&v14->__opaque[4] >> 2) & 3) == 0)
      {
        int v20 = v14;
        if (((*(_DWORD *)&v14->__opaque[4] >> 6) & 7) == 1
          || (uint64_t v21 = v14, ((*(_DWORD *)&v14->__opaque[4] >> 6) & 7) == 2))
        {
          uint64_t v11 = _pthread_mutex_sig_fast;
        }
      }
      if (((*(_DWORD *)&v14->__opaque[4] >> 2) & 3) == 0
        && ((*(_DWORD *)&v14->__opaque[4] >> 6) & 7) == 2
        && ((*(_DWORD *)&v14->__opaque[4] >> 4) & 3) == 2
        && v11 == _pthread_mutex_sig_fast)
      {
        *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
      }
      else
      {
        *(_DWORD *)&v14->__opaque[4] &= ~0x4000u;
      }
      if ((*(_DWORD *)&v14->__opaque[4] >> 14))
      {
        uint64_t v4 = v14;
        *(void *)&v14->__opaque[16] = -1;
        *(void *)&v4->__opaque[24] = -1;
        *(void *)&v4->__opaque[32] = -1;
        int v10 = 0;
        *(_DWORD *)&v14->__opaque[16] = 0;
      }
      else
      {
        int v17 = v14;
        uint64_t v16 = &v9;
        int v9 = (void *)((unint64_t)&v14->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
        int v19 = v14;
        int v18 = &v8;
        int v8 = (char *)((unint64_t)&v14->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
        if (v8 != &v14->__opaque[16])
        {
          *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFF7FF | 0x800;
          *(void *)&v14->__opaque[16] = -1;
        }
        *(void *)&v14->__opaque[32] = -1;
        *(void *)int v8 = 0;
        *int v9 = 0;
      }
      int v7 = v11;
      *(void *)&v14->__opaque[40] = ~(unint64_t)v14;
      *(_DWORD *)&v14->__opaque[48] = v7;
      *(_DWORD *)&v14->__opaque[52] = v7;
      *(_DWORD *)&v14->__opaque[12] = v7;
      uint64_t v6 = (unsigned int *)v14;
      HIDWORD(v14->__sig) = HIDWORD(v11);
      atomic_store(v11, v6);
      return 0;
    }
    else
    {
      return 22;
    }
  }
  else
  {
    if (v12 <= 1)
    {
      uint64_t v3 = v12 - 1;
      char v2 = 0;
    }
    else
    {
      uint64_t v3 = v12 - 1;
      char v2 = 1;
    }
    if ((v2 & 1) == 0)
    {
      switch(v3)
      {
        case 0:
          *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFF3 | 4;
          goto LABEL_14;
        case 1:
          *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFF3 | 8;
          goto LABEL_14;
        case 2:
        case 6:
          *(_DWORD *)&v14->__opaque[4] &= 0xFFFFFFF3;
LABEL_14:
          *(_WORD *)&v14->__opaque[8] = 0;
          *(_DWORD *)&v14->__opaque[4] &= 0xFFFFFFFC;
          if (v12 == 3) {
            *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFE3F | 0x80;
          }
          else {
            *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFE3F | ((__pthread_mutex_default_opt_policy & 7) << 6);
          }
          *(_DWORD *)&v14->__opaque[4] = *(_DWORD *)&v14->__opaque[4] & 0xFFFFFFCF | 0x20;
          goto LABEL_18;
        case 3:
        case 4:
        case 5:
          return 22;
        default:
          JUMPOUT(0);
      }
    }
    return 22;
  }
}

int pthread_mutex_getprioceiling(const pthread_mutex_t *a1, int *a2)
{
  int v6 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options();
    *a2 = *(__int16 *)&a1->__opaque[8];
    int v6 = 0;
    int v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    int v3 = v2;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1->__opaque, (unsigned int *)&v3, 0, memory_order_release, memory_order_relaxed);
    if (v3 != v2) {
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
    }
  }
  return v6;
}

int pthread_mutex_setprioceiling(pthread_mutex_t *a1, int a2, int *a3)
{
  int v6 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options();
    if (a2 >= -999 && a2 <= 999)
    {
      *a3 = *(__int16 *)&a1->__opaque[8];
      *(_WORD *)&a1->__opaque[8] = a2;
      int v6 = 0;
    }
    int v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    int v4 = v3;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1->__opaque, (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
    if (v4 != v3) {
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
    }
  }
  return v6;
}

int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)&a1->__opaque[4] & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getpolicy_np(const pthread_mutexattr_t *a1, int *a2)
{
  int v4 = 22;
  if (a1->__sig == 1297373249)
  {
    int v3 = (*(_DWORD *)&a1->__opaque[4] >> 6) & 7;
    if (v3 == 1)
    {
      *a2 = 1;
      return 0;
    }
    else if (v3 == 2)
    {
      *a2 = 3;
      return 0;
    }
  }
  return v4;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 2) & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getpshared(const pthread_mutexattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 4) & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  int result = 0;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFFC;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | ((__pthread_mutex_default_opt_policy & 7) << 6);
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFF3;
  a1->__unsigned int sig = 1297373249;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | 0x20;
  return result;
}

int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 >= -999 && a2 <= 999)
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setprotocol(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFFC | a2 & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249)
  {
    if (a2 == 1)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x40;
      return 0;
    }
    else if (a2 == 3)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x80;
      return 0;
    }
  }
  return v3;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFF3 | (4 * (a2 & 3));
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1297373249 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | (16 * (a2 & 3));
    return 0;
  }
  return v3;
}

uint64_t _pthread_mutex_fairshare_lock_slow(uint64_t a1, char a2)
{
  uint64_t v15 = a1;
  char v14 = a2 & 1;
  int v13 = 0;
  int v12 = 0;
  uint64_t v27 = a1;
  int v26 = &v11;
  uint64_t v11 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v10 = 0;
  unint64_t v9 = 0;
  uint64_t v29 = v11;
  int v28 = &v10;
  unint64_t v10 = *(void *)v11;
  uint64_t v31 = a1;
  uint64_t v30 = &v8;
  int v8 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v6 = *(void *)(StatusReg - 8);
  uint64_t v38 = a1;
  char v37 = a2 & 1;
  int v36 = v8;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v35 = 0;
    unint64_t v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v35 = *(void *)(v42 - 8);
    uint64_t v34 = 0;
    uint64_t v33 = *v36;
    uint64_t v34 = v33;
    uint64_t v32 = v33;
    if (v33 == v35)
    {
      uint64_t v40 = v38;
      if (((*(_DWORD *)(v38 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v38 + 12)) == 0xFFFF)
        {
          int v39 = -35;
        }
        else
        {
          *(_DWORD *)(v38 + 12) = *(unsigned __int16 *)(v38 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v38 + 12)) + 1) << 16);
          int v39 = HIWORD(*(_DWORD *)(v38 + 12));
        }
      }
      else if (v37)
      {
        int v39 = -16;
      }
      else
      {
        int v39 = -11;
      }
    }
    else
    {
      int v39 = 0;
    }
  }
  else
  {
    int v39 = 0;
  }
  int v13 = v39;
  if (v39 <= 0)
  {
    if (v13 >= 0)
    {
      do
      {
        unint64_t v9 = v10;
        uint64_t v7 = *v8;
        BOOL v5 = (v10 & 2) == 0;
        if ((v14 & 1) == 0 || (v10 & 2) == 0)
        {
          LODWORD(v9) = v9 + 256;
          LODWORD(v9) = v9 | 3;
        }
        unsigned int v25 = v11;
        unsigned int v24 = &v10;
        BOOL v23 = &v9;
        unint64_t v22 = v10;
        BOOL v21 = 0;
        unint64_t v19 = v9;
        unint64_t v18 = v9;
        unint64_t v20 = v9;
        unint64_t v2 = v10;
        unint64_t v3 = v10;
        atomic_compare_exchange_strong_explicit(v11, &v3, v9, memory_order_acquire, memory_order_acquire);
        if (v3 != v2) {
          unint64_t v22 = v3;
        }
        BOOL v17 = v3 == v2;
        BOOL v21 = v3 == v2;
        *unsigned int v24 = v22;
        BOOL v16 = v21;
      }
      while (!v21);
      if (v5)
      {
        *int v8 = v6;
        int v13 = 0;
      }
      else if (v14)
      {
        int v13 = 16;
      }
      else
      {
        int v13 = _pthread_mutex_fairshare_lock_wait(v15, v9, v7);
      }
      if (!v13)
      {
        uint64_t v41 = v15;
        if (((*(_DWORD *)(v15 + 12) >> 2) & 3) == 2) {
          *(_DWORD *)(v15 + 12) = *(unsigned __int16 *)(v15 + 12) | 0x10000;
        }
      }
    }
    else
    {
      return -v13;
    }
  }
  else
  {
    int v12 = 1;
    return 0;
  }
  return v13;
}

uint64_t _pthread_mutex_fairshare_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = a2;
  uint64_t v10 = a1;
  uint64_t v9 = a3;
  uint64_t v13 = a1;
  int v12 = &v8;
  int v8 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v7 = *(void *)(StatusReg - 8);
  do
  {
    do
    {
      int v6 = __psynch_mutexwait();
      uint64_t v9 = *v8;
    }
    while (v6 == -1);
    uint64_t v25 = v10;
    uint64_t v24 = v7;
    BOOL v23 = 0;
    uint64_t v42 = v10;
    BOOL v23 = ((*(_DWORD *)(v10 + 12) >> 6) & 7) == 2;
    BOOL v22 = 1;
    uint64_t v37 = v10;
    int v36 = &v21;
    BOOL v21 = (atomic_ullong *)((v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v20 = 0;
    unint64_t v19 = 0;
    int v39 = v21;
    uint64_t v38 = &v20;
    unint64_t v20 = *(void *)v21;
    uint64_t v41 = v10;
    uint64_t v40 = &v18;
    unint64_t v18 = (void *)((v10 + 31) & 0xFFFFFFFFFFFFFFF8);
    do
    {
      unint64_t v19 = v20;
      if (v23)
      {
        BOOL v22 = (v20 & 2) == 0;
      }
      else if ((v20 & 3) == 3)
      {
        break;
      }
      LODWORD(v19) = v19 | 3;
      uint64_t v35 = v21;
      uint64_t v34 = &v20;
      uint64_t v33 = &v19;
      unint64_t v32 = v20;
      BOOL v31 = 0;
      unint64_t v29 = v19;
      unint64_t v28 = v19;
      unint64_t v30 = v19;
      unint64_t v3 = v20;
      unint64_t v4 = v20;
      atomic_compare_exchange_strong_explicit(v21, &v4, v19, memory_order_acquire, memory_order_acquire);
      if (v4 != v3) {
        unint64_t v32 = v4;
      }
      BOOL v27 = v4 == v3;
      BOOL v31 = v4 == v3;
      *uint64_t v34 = v32;
      BOOL v26 = v31;
    }
    while (!v31);
    if (v22)
    {
      uint64_t v17 = v24;
      uint64_t v16 = v24;
      void *v18 = v24;
      uint64_t v15 = v17;
    }
  }
  while (!v22);
  return 0;
}

uint64_t _pthread_mutex_fairshare_unlock_slow(uint64_t a1)
{
  uint64_t v11 = a1;
  unsigned int v10 = 0;
  uint64_t v9 = 0;
  int v8 = 0;
  uint64_t v40 = a1;
  int v39 = &v8;
  uint64_t v38 = 0;
  uint64_t v37 = &v9;
  int v36 = (_DWORD *)&v9 + 1;
  int v35 = 0;
  int v35 = *(_DWORD *)(a1 + 12);
  v35 &= ~0x1000u;
  uint64_t v53 = a1;
  unint64_t v52 = &v34;
  uint64_t v34 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v33 = 0;
  unint64_t v32 = 0;
  int v55 = v34;
  int v54 = &v33;
  unint64_t v33 = *(void *)v34;
  uint64_t v57 = a1;
  int v56 = &v31;
  BOOL v31 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v30 = 0;
  unint64_t v29 = 0;
  int v28 = 0;
  uint64_t v63 = a1;
  unint64_t v62 = v31;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v61 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v61 = *(void *)(StatusReg - 8);
    uint64_t v60 = 0;
    uint64_t v59 = *(void *)v62;
    uint64_t v60 = v59;
    uint64_t v58 = v59;
    if (v59 == v61)
    {
      uint64_t v65 = v63;
      int v64 = ((*(_DWORD *)(v63 + 12) >> 2) & 3) == 2
         && (int v1 = HIWORD(*(_DWORD *)(v63 + 12)),
             *(_DWORD *)(v63 + 12) = *(unsigned __int16 *)(v63 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }
    else
    {
      int v64 = -1;
    }
  }
  else
  {
    int v64 = 0;
  }
  int v28 = v64;
  if (v64 <= 0)
  {
    if (v28 >= 0)
    {
      char v27 = 0;
      char v26 = 0;
      do
      {
        unint64_t v32 = v33;
        uint64_t v25 = 0;
        uint64_t v24 = *(void *)v31;
        uint64_t v25 = v24;
        uint64_t v23 = v24;
        uint64_t v30 = v24;
        char v27 = 0;
        char v26 = 0;
        int v22 = 0;
        int v22 = diff_genseq(v33, SHIDWORD(v33));
        if (v22)
        {
          HIDWORD(v32) += 256;
          if ((v33 & 0xFFFFFF00) == (HIDWORD(v32) & 0xFFFFFF00))
          {
            LODWORD(v32) = v32 & 0xFFFFFFFC;
            char v27 = 1;
            unint64_t v29 = 0;
          }
          else
          {
            unint64_t v29 = -1;
            v35 |= 0x1000u;
          }
          if (v29 != v30)
          {
            uint64_t v21 = v30;
            BOOL v20 = 0;
            unint64_t v18 = v29;
            unint64_t v17 = v29;
            unint64_t v19 = v29;
            uint64_t v2 = v30;
            uint64_t v3 = v30;
            atomic_compare_exchange_strong_explicit(v31, (unint64_t *)&v3, v29, memory_order_relaxed, memory_order_relaxed);
            if (v3 != v2) {
              uint64_t v21 = v3;
            }
            BOOL v16 = v3 == v2;
            BOOL v20 = v3 == v2;
            BOOL v15 = v20;
            if (v3 != v2) {
              _pthread_mutex_corruption_abort();
            }
          }
        }
        else
        {
          char v26 = 1;
        }
        if (v27 & 1) != 0 || (v26) {
          v35 &= ~0x1000u;
        }
        uint64_t v51 = v34;
        uint64_t v50 = &v33;
        unint64_t v49 = &v32;
        unint64_t v48 = v33;
        BOOL v47 = 0;
        unint64_t v45 = v32;
        unint64_t v44 = v32;
        unint64_t v46 = v32;
        unint64_t v4 = v33;
        unint64_t v5 = v33;
        atomic_compare_exchange_strong_explicit(v34, &v5, v32, memory_order_release, memory_order_relaxed);
        if (v5 != v4) {
          unint64_t v48 = v5;
        }
        BOOL v43 = v5 == v4;
        BOOL v47 = v5 == v4;
        *uint64_t v50 = v48;
        BOOL v42 = v47;
      }
      while (!v47);
      if (v37) {
        *(_DWORD *)uint64_t v37 = v32;
      }
      if (v36) {
        *int v36 = HIDWORD(v32);
      }
      if (v38) {
        *uint64_t v38 = v40;
      }
      if (v39) {
        int *v39 = v35;
      }
      int v41 = 0;
    }
    else
    {
      int v41 = -v28;
    }
  }
  else
  {
    if (v39) {
      int *v39 = v35;
    }
    int v41 = 0;
  }
  unsigned int v10 = v41;
  if (v41)
  {
    return v10;
  }
  else if ((v8 & 0x1000) != 0)
  {
    return _pthread_mutex_fairshare_unlock_drop(v11, v9, v8);
  }
  else
  {
    uint64_t v14 = v11;
    uint64_t v13 = &v7;
    unint64_t v7 = (v11 + 31) & 0xFFFFFFFFFFFFFFF8;
    return 0;
  }
}

uint64_t _pthread_mutex_fairshare_unlock_drop(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v9 = a2;
  uint64_t v8 = a1;
  int v7 = a3;
  int v6 = 0;
  int v5 = 0;
  uint64_t v12 = a1;
  uint64_t v11 = &v4;
  unint64_t v4 = (a1 + 31) & 0xFFFFFFFFFFFFFFF8;
  int v5 = __psynch_mutexdrop();
  if (v5 == -1)
  {
    uint64_t v13 = 1;
    uint64_t v14 = 1;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 == 4) {
      int v6 = 0;
    }
    if (v6)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_2C058 = v6;
      __break(1u);
      JUMPOUT(0x12920);
    }
    return 0;
  }
  else
  {
    return 0;
  }
}

uint64_t _pthread_mutex_ulock_lock(uint64_t a1, char a2)
{
  unsigned int v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  int v5 = 0;
  int v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v2, v6, memory_order_acquire, memory_order_acquire);
  if (v2) {
    int v5 = v2;
  }
  unsigned int v4 = 0;
  if (v2)
  {
    if (a2) {
      return 16;
    }
    else {
      return _pthread_mutex_ulock_lock_slow(a1, v6, v5);
    }
  }
  return v4;
}

uint64_t _pthread_mutex_ulock_lock_slow(uint64_t a1, unsigned int a2, int a3)
{
  char v14 = 0;
  do
  {
    char v13 = 0;
    do
    {
      unsigned int v12 = a3 & 0xFFFFFFFC;
      if (v13)
      {
        unsigned int v12 = -4;
        char v13 = 0;
      }
      int v11 = a3;
      int v3 = a3;
      int v4 = a3;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v4, v12 | 1, memory_order_relaxed, memory_order_relaxed);
      if (v4 != v3) {
        int v11 = v4;
      }
      a3 = v11;
      if (v4 == v3)
      {
        int v10 = __ulock_wait();
        if ((v10 & 0x80000000) == 0)
        {
          if (v10 >= 1) {
            char v14 = 1;
          }
LABEL_17:
          a3 = *(_DWORD *)(a1 + 24);
          continue;
        }
        int v7 = -v10;
        if (v10 == -4 || v7 == 14) {
          goto LABEL_17;
        }
        if (v7 != 105)
        {
          qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
          qword_2C058 = v10;
          __break(1u);
          JUMPOUT(0x12D28);
        }
        char v13 = 1;
      }
    }
    while (a3);
    unsigned int v9 = a2;
    if (v14) {
      unsigned int v9 = a2 | 1;
    }
    int v8 = 0;
    int v5 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 24), (unsigned int *)&v5, v9, memory_order_acquire, memory_order_acquire);
    if (v5) {
      int v8 = v5;
    }
    a3 = v8;
  }
  while (v5);
  return 0;
}

uint64_t _pthread_mutex_ulock_unlock(uint64_t a1)
{
  int v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  int v3 = atomic_exchange_explicit((atomic_uint *volatile)(a1 + 24), 0, memory_order_release);
  unsigned int v2 = 0;
  if (v3 != v4) {
    return _pthread_mutex_ulock_unlock_slow(a1, v4, v3);
  }
  return v2;
}

uint64_t _pthread_mutex_ulock_unlock_slow(uint64_t a1, int a2, int a3)
{
  if (a3)
  {
    if ((a3 & 0xFFFFFFFC) == a2)
    {
      if ((a3 & 1) == 0)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: unlock_slow without orig_waiters";
        __break(1u);
        JUMPOUT(0x13060);
      }
    }
    else if ((a3 & 1) == 0)
    {
      return 0;
    }
    while (1)
    {
      int v4 = __ulock_wake();
      if ((v4 & 0x80000000) == 0 || v4 == -2) {
        break;
      }
      if (-v4 != 4)
      {
        qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
        qword_2C058 = -v4;
        __break(1u);
        JUMPOUT(0x13128);
      }
    }
  }
  return 0;
}

uint64_t _pthread_mutex_firstfit_unlock_slow(uint64_t a1)
{
  v8[1] = a1;
  v8[0] = 0;
  int v7 = 0;
  uint64_t v32 = a1;
  BOOL v31 = (unsigned int *)&v7;
  uint64_t v30 = 0;
  unint64_t v29 = v8;
  int v28 = (_DWORD *)v8 + 1;
  unsigned int v27 = 0;
  unsigned int v27 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
  BOOL v26 = 0;
  uint64_t v45 = a1;
  unint64_t v44 = &v25;
  uint64_t v25 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v24 = 0;
  unint64_t v23 = 0;
  BOOL v47 = v25;
  unint64_t v46 = &v24;
  unint64_t v24 = *(void *)v25;
  uint64_t v49 = a1;
  unint64_t v48 = &v22;
  int v22 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = 0;
  int v20 = 0;
  uint64_t v55 = a1;
  int v54 = v22;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v53 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v53 = *(void *)(StatusReg - 8);
    uint64_t v52 = 0;
    uint64_t v51 = *(void *)v54;
    uint64_t v52 = v51;
    uint64_t v50 = v51;
    if (v51 == v53)
    {
      uint64_t v57 = v55;
      int v56 = ((*(_DWORD *)(v55 + 12) >> 2) & 3) == 2
         && (int v1 = HIWORD(*(_DWORD *)(v55 + 12)),
             *(_DWORD *)(v55 + 12) = *(unsigned __int16 *)(v55 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }
    else
    {
      int v56 = -1;
    }
  }
  else
  {
    int v56 = 0;
  }
  int v20 = v56;
  if (v56 <= 0)
  {
    if (v20 >= 0)
    {
      do
      {
        unint64_t v23 = v24;
        uint64_t v19 = 0;
        uint64_t v18 = *(void *)v22;
        uint64_t v19 = v18;
        uint64_t v17 = v18;
        uint64_t v21 = v18;
        BOOL v26 = (int)diff_genseq(v24, SHIDWORD(v24)) > 0;
        LODWORD(v23) = v23 & 0xFFFFFFFD;
        if (v26) {
          HIDWORD(v23) += 256;
        }
        if (v21)
        {
          uint64_t v16 = v21;
          BOOL v15 = 0;
          uint64_t v13 = 0;
          uint64_t v12 = 0;
          uint64_t v14 = 0;
          uint64_t v2 = v21;
          uint64_t v3 = v21;
          atomic_compare_exchange_strong_explicit(v22, (unint64_t *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
          if (v3 != v2) {
            uint64_t v16 = v3;
          }
          BOOL v11 = v3 == v2;
          BOOL v15 = v3 == v2;
          BOOL v10 = v15;
          if (v3 != v2) {
            _pthread_mutex_corruption_abort();
          }
        }
        BOOL v43 = v25;
        BOOL v42 = &v24;
        int v41 = &v23;
        unint64_t v40 = v24;
        BOOL v39 = 0;
        unint64_t v37 = v23;
        unint64_t v36 = v23;
        unint64_t v38 = v23;
        unint64_t v4 = v24;
        unint64_t v5 = v24;
        atomic_compare_exchange_strong_explicit(v25, &v5, v23, memory_order_release, memory_order_relaxed);
        if (v5 != v4) {
          unint64_t v40 = v5;
        }
        BOOL v35 = v5 == v4;
        BOOL v39 = v5 == v4;
        *BOOL v42 = v40;
        BOOL v34 = v39;
      }
      while (!v39);
      if (v26) {
        v27 |= 0x1000u;
      }
      if (v29) {
        *unint64_t v29 = v23;
      }
      if (v28) {
        *int v28 = HIDWORD(v23);
      }
      if (v30) {
        *uint64_t v30 = v32;
      }
      if (v31) {
        *BOOL v31 = v27;
      }
      unsigned int v33 = 0;
    }
    else
    {
      unsigned int v33 = -v20;
    }
  }
  else
  {
    if (v31) {
      *BOOL v31 = v27;
    }
    unsigned int v33 = 0;
  }
  if (v33)
  {
    return v33;
  }
  else if ((v7 & 0x1000) != 0)
  {
    return _pthread_mutex_firstfit_wake();
  }
  else
  {
    return 0;
  }
}

uint64_t _pthread_mutex_firstfit_wake()
{
  if (__psynch_mutexdrop() == -1)
  {
    int v1 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v1 == 4) {
      int v1 = 0;
    }
    if (v1)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_2C058 = v1;
      __break(1u);
      JUMPOUT(0x137B0);
    }
  }
  return 0;
}

uint64_t _pthread_mutex_firstfit_lock_slow(uint64_t a1, char a2)
{
  uint64_t v15 = a1;
  char v14 = a2 & 1;
  int v13 = 0;
  int v12 = 0;
  uint64_t v27 = a1;
  BOOL v26 = &v11;
  BOOL v11 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v10 = 0;
  unint64_t v9 = 0;
  unint64_t v29 = v11;
  int v28 = &v10;
  unint64_t v10 = *(void *)v11;
  uint64_t v31 = a1;
  uint64_t v30 = &v8;
  int v8 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v6 = *(void *)(StatusReg - 8);
  uint64_t v38 = a1;
  char v37 = a2 & 1;
  unint64_t v36 = v8;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    uint64_t v35 = 0;
    unint64_t v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v35 = *(void *)(v42 - 8);
    uint64_t v34 = 0;
    uint64_t v33 = *v36;
    uint64_t v34 = v33;
    uint64_t v32 = v33;
    if (v33 == v35)
    {
      uint64_t v40 = v38;
      if (((*(_DWORD *)(v38 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v38 + 12)) == 0xFFFF)
        {
          int v39 = -35;
        }
        else
        {
          *(_DWORD *)(v38 + 12) = *(unsigned __int16 *)(v38 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v38 + 12)) + 1) << 16);
          int v39 = HIWORD(*(_DWORD *)(v38 + 12));
        }
      }
      else if (v37)
      {
        int v39 = -16;
      }
      else
      {
        int v39 = -11;
      }
    }
    else
    {
      int v39 = 0;
    }
  }
  else
  {
    int v39 = 0;
  }
  int v13 = v39;
  if (v39 <= 0)
  {
    if (v13 >= 0)
    {
      do
      {
        unint64_t v9 = v10;
        uint64_t v7 = *v8;
        BOOL v5 = (v10 & 2) == 0;
        if ((v14 & 1) == 0 || (v10 & 2) == 0)
        {
          if ((v10 & 2) != 0) {
            LODWORD(v9) = v9 + 256;
          }
          else {
            LODWORD(v9) = v9 | 2;
          }
        }
        uint64_t v25 = v11;
        unint64_t v24 = &v10;
        unint64_t v23 = &v9;
        unint64_t v22 = v10;
        BOOL v21 = 0;
        unint64_t v19 = v9;
        unint64_t v18 = v9;
        unint64_t v20 = v9;
        unint64_t v2 = v10;
        unint64_t v3 = v10;
        atomic_compare_exchange_strong_explicit(v11, &v3, v9, memory_order_acquire, memory_order_acquire);
        if (v3 != v2) {
          unint64_t v22 = v3;
        }
        BOOL v17 = v3 == v2;
        BOOL v21 = v3 == v2;
        *unint64_t v24 = v22;
        BOOL v16 = v21;
      }
      while (!v21);
      if (v5)
      {
        *int v8 = v6;
        int v13 = 0;
      }
      else if (v14)
      {
        int v13 = 16;
      }
      else
      {
        int v13 = _pthread_mutex_firstfit_lock_wait(v15, v9, v7);
      }
      if (!v13)
      {
        uint64_t v41 = v15;
        if (((*(_DWORD *)(v15 + 12) >> 2) & 3) == 2) {
          *(_DWORD *)(v15 + 12) = *(unsigned __int16 *)(v15 + 12) | 0x10000;
        }
      }
    }
    else
    {
      return -v13;
    }
  }
  else
  {
    int v12 = 1;
    return 0;
  }
  return v13;
}

uint64_t _pthread_mutex_firstfit_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[0] = a2;
  uint64_t v10 = a1;
  uint64_t v9 = a3;
  void v11[2] = a1;
  v11[1] = &v8;
  int v8 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v7 = *(void *)(StatusReg - 8);
  do
  {
    do
    {
      int v6 = __psynch_mutexwait();
      uint64_t v9 = *v8;
    }
    while (v6 == -1);
    uint64_t v23 = v10;
    uint64_t v22 = v7;
    BOOL v21 = v11;
    BOOL v20 = 0;
    uint64_t v35 = v10;
    uint64_t v34 = &v19;
    unint64_t v19 = (atomic_ullong *)((v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v18 = 0;
    unint64_t v17 = 0;
    char v37 = v19;
    unint64_t v36 = &v18;
    unint64_t v18 = *(void *)v19;
    uint64_t v39 = v10;
    uint64_t v38 = &v16;
    BOOL v16 = (void *)((v10 + 31) & 0xFFFFFFFFFFFFFFF8);
    do
    {
      unint64_t v17 = v18;
      BOOL v20 = (v18 & 2) == 0;
      if ((v18 & 2) != 0) {
        LODWORD(v17) = v17 + 256;
      }
      else {
        LODWORD(v17) = v17 | 2;
      }
      uint64_t v33 = v19;
      uint64_t v32 = &v18;
      uint64_t v31 = &v17;
      unint64_t v30 = v18;
      BOOL v29 = 0;
      unint64_t v27 = v17;
      unint64_t v26 = v17;
      unint64_t v28 = v17;
      unint64_t v3 = v18;
      unint64_t v4 = v18;
      atomic_compare_exchange_strong_explicit(v19, &v4, v17, memory_order_acquire, memory_order_acquire);
      if (v4 != v3) {
        unint64_t v30 = v4;
      }
      BOOL v25 = v4 == v3;
      BOOL v29 = v4 == v3;
      *uint64_t v32 = v30;
      BOOL v24 = v29;
    }
    while (!v29);
    if (v20)
    {
      uint64_t v15 = v22;
      uint64_t v14 = v22;
      void *v16 = v22;
      uint64_t v13 = v15;
    }
    if (v21) {
      *BOOL v21 = v17;
    }
  }
  while (!v20);
  return 0;
}

uint64_t _pthread_mutex_droplock(uint64_t a1, _DWORD *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v87 = a1;
  if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    uint64_t v29 = a1;
    unint64_t v28 = a2;
    unint64_t v27 = a3;
    unint64_t v26 = a4;
    BOOL v25 = a5;
    int v24 = 0;
    int v24 = *(_DWORD *)(a1 + 12);
    v24 &= ~0x1000u;
    uint64_t v42 = a1;
    uint64_t v41 = &v23;
    uint64_t v23 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v22 = 0;
    unint64_t v21 = 0;
    unint64_t v44 = v23;
    BOOL v43 = &v22;
    unint64_t v22 = *(void *)v23;
    uint64_t v46 = a1;
    uint64_t v45 = &v20;
    BOOL v20 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v102 = a1;
    v101 = v20;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      uint64_t v100 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v100 = *(void *)(StatusReg - 8);
      uint64_t v99 = 0;
      uint64_t v98 = *(void *)v101;
      uint64_t v99 = v98;
      uint64_t v97 = v98;
      if (v98 == v100)
      {
        uint64_t v104 = v102;
        int v103 = ((*(_DWORD *)(v102 + 12) >> 2) & 3) == 2
            && (int v5 = HIWORD(*(_DWORD *)(v102 + 12)),
                *(_DWORD *)(v102 + 12) = *(unsigned __int16 *)(v102 + 12) | ((unsigned __int16)(v5 - 1) << 16),
                (_WORD)v5 != 1);
      }
      else
      {
        int v103 = -1;
      }
    }
    else
    {
      int v103 = 0;
    }
    if (v103 <= 0)
    {
      if (v103 >= 0)
      {
        do
        {
          unint64_t v21 = v22;
          uint64_t v19 = *(void *)v20;
          char v17 = 0;
          char v16 = 0;
          if (diff_genseq(v22, SHIDWORD(v22)))
          {
            HIDWORD(v21) += 256;
            if ((v22 & 0xFFFFFF00) == (HIDWORD(v21) & 0xFFFFFF00))
            {
              LODWORD(v21) = v21 & 0xFFFFFFFC;
              char v17 = 1;
              unint64_t v18 = 0;
            }
            else
            {
              unint64_t v18 = -1;
              v24 |= 0x1000u;
            }
            if (v18 != v19)
            {
              uint64_t v6 = v19;
              atomic_compare_exchange_strong_explicit(v20, (unint64_t *)&v6, v18, memory_order_relaxed, memory_order_relaxed);
              if (v6 != v19) {
                _pthread_mutex_corruption_abort();
              }
            }
          }
          else
          {
            char v16 = 1;
          }
          if (v17 & 1) != 0 || (v16) {
            v24 &= ~0x1000u;
          }
          uint64_t v40 = v23;
          uint64_t v39 = &v22;
          uint64_t v38 = &v21;
          unint64_t v37 = v22;
          BOOL v36 = 0;
          unint64_t v34 = v21;
          unint64_t v33 = v21;
          unint64_t v35 = v21;
          unint64_t v7 = v22;
          unint64_t v8 = v22;
          atomic_compare_exchange_strong_explicit(v23, &v8, v21, memory_order_release, memory_order_relaxed);
          if (v8 != v7) {
            unint64_t v37 = v8;
          }
          BOOL v32 = v8 == v7;
          BOOL v36 = v8 == v7;
          unint64_t *v39 = v37;
          BOOL v31 = v36;
        }
        while (!v36);
        if (v26) {
          *unint64_t v26 = v21;
        }
        if (v25) {
          *BOOL v25 = HIDWORD(v21);
        }
        if (v27) {
          *unint64_t v27 = v29;
        }
        if (v28) {
          *unint64_t v28 = v24;
        }
        return 0;
      }
      else
      {
        return -v103;
      }
    }
    else
    {
      if (v28) {
        *unint64_t v28 = v24;
      }
      return 0;
    }
  }
  else
  {
    uint64_t v69 = a1;
    int v68 = a2;
    char v67 = a3;
    int v66 = a4;
    uint64_t v65 = a5;
    unsigned int v64 = 0;
    unsigned int v64 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
    BOOL v63 = 0;
    uint64_t v82 = a1;
    unint64_t v81 = &v62;
    unint64_t v62 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v61 = 0;
    unint64_t v60 = 0;
    unint64_t v84 = v62;
    BOOL v83 = &v61;
    unint64_t v61 = *(void *)v62;
    uint64_t v86 = a1;
    uint64_t v85 = &v59;
    uint64_t v59 = (atomic_ullong *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v58 = 0;
    int v57 = 0;
    uint64_t v93 = a1;
    unsigned int v92 = v59;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      uint64_t v91 = 0;
      unint64_t v96 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v91 = *(void *)(v96 - 8);
      uint64_t v90 = 0;
      uint64_t v89 = *(void *)v92;
      uint64_t v90 = v89;
      uint64_t v88 = v89;
      if (v89 == v91)
      {
        uint64_t v95 = v93;
        int v94 = ((*(_DWORD *)(v93 + 12) >> 2) & 3) == 2
           && (int v9 = HIWORD(*(_DWORD *)(v93 + 12)),
               *(_DWORD *)(v93 + 12) = *(unsigned __int16 *)(v93 + 12) | ((unsigned __int16)(v9 - 1) << 16),
               (_WORD)v9 != 1);
      }
      else
      {
        int v94 = -1;
      }
    }
    else
    {
      int v94 = 0;
    }
    int v57 = v94;
    if (v94 <= 0)
    {
      if (v57 >= 0)
      {
        do
        {
          unint64_t v60 = v61;
          uint64_t v56 = 0;
          uint64_t v55 = *(void *)v59;
          uint64_t v56 = v55;
          uint64_t v54 = v55;
          uint64_t v58 = v55;
          BOOL v63 = (int)diff_genseq(v61, SHIDWORD(v61)) > 0;
          LODWORD(v60) = v60 & 0xFFFFFFFD;
          if (v63) {
            HIDWORD(v60) += 256;
          }
          if (v58)
          {
            uint64_t v53 = v58;
            BOOL v52 = 0;
            uint64_t v50 = 0;
            uint64_t v49 = 0;
            uint64_t v51 = 0;
            uint64_t v10 = v58;
            uint64_t v11 = v58;
            atomic_compare_exchange_strong_explicit(v59, (unint64_t *)&v11, 0, memory_order_relaxed, memory_order_relaxed);
            if (v11 != v10) {
              uint64_t v53 = v11;
            }
            BOOL v48 = v11 == v58;
            BOOL v52 = v11 == v58;
            BOOL v47 = v52;
            if (v11 != v58) {
              _pthread_mutex_corruption_abort();
            }
          }
          unint64_t v80 = v62;
          BOOL v79 = &v61;
          BOOL v78 = &v60;
          unint64_t v77 = v61;
          BOOL v76 = 0;
          unint64_t v74 = v60;
          unint64_t v73 = v60;
          unint64_t v75 = v60;
          unint64_t v12 = v61;
          unint64_t v13 = v61;
          atomic_compare_exchange_strong_explicit(v62, &v13, v60, memory_order_release, memory_order_relaxed);
          if (v13 != v12) {
            unint64_t v77 = v13;
          }
          BOOL v72 = v13 == v12;
          BOOL v76 = v13 == v12;
          *BOOL v79 = v77;
          BOOL v71 = v76;
        }
        while (!v76);
        if (v63) {
          v64 |= 0x1000u;
        }
        if (v66) {
          *int v66 = v60;
        }
        if (v65) {
          *uint64_t v65 = HIDWORD(v60);
        }
        if (v67) {
          *char v67 = v69;
        }
        if (v68) {
          *int v68 = v64;
        }
        return 0;
      }
      else
      {
        return -v57;
      }
    }
    else
    {
      if (v68) {
        *int v68 = v64;
      }
      return 0;
    }
  }
}

uint64_t _pthread_mutex_lock_init_slow(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = _pthread_mutex_check_init_slow(a1);
  }
  if (v6)
  {
    return v6;
  }
  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_lock_slow(a1, v3 & 1);
  }
  else if ((*(_DWORD *)(a1 + 12) >> 14))
  {
    return _pthread_mutex_ulock_lock(a1, v3 & 1);
  }
  else
  {
    return _pthread_mutex_firstfit_lock_slow(a1, v3 & 1);
  }
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  uint64_t v10 = a1;
  unint64_t v30 = a1;
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_unlock_init_slow((uint64_t)v10);
  }
  unint64_t v28 = v10;
  if (((*(_DWORD *)&v10->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_unlock((uint64_t)v10);
  }
  uint64_t v29 = v10;
  if ((*(_DWORD *)&v10->__opaque[4] >> 14)) {
    return _pthread_mutex_ulock_unlock((uint64_t)v10);
  }
  unint64_t v27 = v10;
  unint64_t v26 = &v9;
  int v9 = (void *)((unint64_t)&v10->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = v10;
  unint64_t v22 = &v8;
  unint64_t v8 = (atomic_ullong *)((unint64_t)&v10->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = 0;
  unint64_t v6 = 0;
  BOOL v25 = v8;
  int v24 = &v7;
  unint64_t v7 = *(void *)v8;
  *int v9 = 0;
  do
  {
    unint64_t v6 = v7;
    if (diff_genseq(v7, SHIDWORD(v7))) {
      return _pthread_mutex_firstfit_unlock_slow((uint64_t)v10);
    }
    LODWORD(v6) = v6 & 0xFFFFFFFD;
    unint64_t v21 = v8;
    BOOL v20 = &v7;
    uint64_t v19 = &v6;
    unint64_t v18 = v7;
    int v17 = 0;
    unint64_t v15 = v6;
    unint64_t v14 = v6;
    unint64_t v16 = v6;
    unint64_t v1 = v7;
    unint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, &v2, v6, memory_order_release, memory_order_relaxed);
    unint64_t v5 = v2;
    BOOL v3 = v2 == v1;
    if (!v3) {
      unint64_t v18 = v5;
    }
    BOOL v13 = v3;
    int v17 = v3;
    unint64_t *v20 = v18;
    int v12 = v17;
  }
  while (!v17);
  return 0;
}

uint64_t _pthread_mutex_unlock_init_slow(uint64_t a1)
{
  if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = _pthread_mutex_check_init_slow(a1);
  }
  if (v4)
  {
    return v4;
  }
  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_unlock_slow(a1);
  }
  else if ((*(_DWORD *)(a1 + 12) >> 14))
  {
    return _pthread_mutex_ulock_unlock(a1);
  }
  else
  {
    return _pthread_mutex_firstfit_unlock_slow(a1);
  }
}

uint64_t _pthread_mutex_fairshare_unlock(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v27 = a1;
  unint64_t v26 = &v9;
  int v9 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = a1;
  unint64_t v22 = &v8;
  unint64_t v8 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = 0;
  *(void *)&v6[4] = 0;
  BOOL v25 = v8;
  int v24 = &v7;
  uint64_t v7 = *(void *)v8;
  *(void *)unint64_t v6 = diff_genseq(v7, SHIDWORD(v7));
  if (*(_DWORD *)v6)
  {
    *int v9 = 0;
    do
    {
      *(_DWORD *)&v6[4] = v7;
      *(_DWORD *)&v6[8] = HIDWORD(v7) + 256;
      if ((v7 & 0xFFFFFF00) != ((HIDWORD(v7) + 256) & 0xFFFFFF00)) {
        return _pthread_mutex_fairshare_unlock_slow(v10);
      }
      *(_DWORD *)&v6[4] &= 0xFFFFFFFC;
      unint64_t v21 = v8;
      BOOL v20 = &v7;
      uint64_t v19 = &v6[4];
      uint64_t v18 = v7;
      int v17 = 0;
      uint64_t v15 = *(void *)&v6[4];
      uint64_t v14 = *(void *)&v6[4];
      uint64_t v16 = *(void *)&v6[4];
      uint64_t v1 = v7;
      uint64_t v2 = v7;
      atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v2, *(unint64_t *)&v6[4], memory_order_release, memory_order_relaxed);
      uint64_t v5 = v2;
      BOOL v3 = v2 == v1;
      if (!v3) {
        uint64_t v18 = v5;
      }
      BOOL v13 = v3;
      int v17 = v3;
      uint64_t *v20 = v18;
      int v12 = v17;
    }
    while (!v17);
    return 0;
  }
  else
  {
    return 0;
  }
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 0);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 0);
  }
  if ((*(_DWORD *)&a1->__opaque[4] >> 14)) {
    return _pthread_mutex_ulock_lock((uint64_t)a1, 0);
  }
  int v12 = a1;
  char v11 = 0;
  uint64_t v29 = a1;
  unint64_t v28 = &v10;
  uint64_t v10 = (void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = *(void *)(StatusReg - 8);
  BOOL v25 = a1;
  int v24 = &v8;
  unint64_t v8 = (atomic_ullong *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = 0;
  unint64_t v6 = 0;
  uint64_t v27 = v8;
  unint64_t v26 = &v7;
  unint64_t v7 = *(void *)v8;
  if ((v7 & 2) != 0) {
    return _pthread_mutex_firstfit_lock_slow((uint64_t)v12, v11 & 1);
  }
  do
  {
    unint64_t v6 = v7;
    BOOL v5 = (v7 & 2) == 0;
    if ((v11 & 1) != 0 && (v7 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }
    if ((v7 & 2) != 0) {
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v12, v11 & 1);
    }
    LODWORD(v6) = v6 | 2;
    uint64_t v23 = v8;
    unint64_t v22 = &v7;
    unint64_t v21 = &v6;
    unint64_t v20 = v7;
    BOOL v19 = 0;
    unint64_t v17 = v6;
    unint64_t v16 = v6;
    unint64_t v18 = v6;
    unint64_t v1 = v7;
    unint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, &v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      unint64_t v20 = v2;
    }
    BOOL v15 = v2 == v1;
    BOOL v19 = v2 == v1;
    *unint64_t v22 = v20;
    BOOL v14 = v19;
  }
  while (!v19);
  if (v5)
  {
    *uint64_t v10 = v9;
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x155BCLL);
    }
    return 16;
  }
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  if (a1->__sig != 1297437786) {
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 1);
  }
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1) {
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 1);
  }
  if ((*(_DWORD *)&a1->__opaque[4] >> 14)) {
    return _pthread_mutex_ulock_lock((uint64_t)a1, 1);
  }
  int v12 = a1;
  char v11 = 1;
  uint64_t v29 = a1;
  unint64_t v28 = &v10;
  uint64_t v10 = (void *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = *(void *)(StatusReg - 8);
  BOOL v25 = a1;
  int v24 = &v8;
  unint64_t v8 = (atomic_ullong *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = 0;
  unint64_t v6 = 0;
  uint64_t v27 = v8;
  unint64_t v26 = &v7;
  unint64_t v7 = *(void *)v8;
  do
  {
    unint64_t v6 = v7;
    BOOL v5 = (v7 & 2) == 0;
    if ((v11 & 1) != 0 && (v7 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }
    if ((v7 & 2) != 0) {
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v12, v11 & 1);
    }
    LODWORD(v6) = v6 | 2;
    uint64_t v23 = v8;
    unint64_t v22 = &v7;
    unint64_t v21 = &v6;
    unint64_t v20 = v7;
    BOOL v19 = 0;
    unint64_t v17 = v6;
    unint64_t v16 = v6;
    unint64_t v18 = v6;
    unint64_t v1 = v7;
    unint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, &v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      unint64_t v20 = v2;
    }
    BOOL v15 = v2 == v1;
    BOOL v19 = v2 == v1;
    *unint64_t v22 = v20;
    BOOL v14 = v19;
  }
  while (!v19);
  if (v5)
  {
    *uint64_t v10 = v9;
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1595CLL);
    }
    return 16;
  }
}

void _pthread_mutex_enable_legacy_mode(void)
{
  _pthread_mutex_sig_fast = 1297437784;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  char v11 = a1;
  int v10 = 22;
  opaque = a1->__opaque;
  uint64_t v29 = (atomic_uint *)a1->__opaque;
  int v28 = 327680;
  if (v1) {
    char v2 = 0;
  }
  else {
    char v2 = 1;
  }
  if ((v2 & 1) == 0) {
    goto LABEL_8;
  }
  unsigned int v27 = 0;
  uint64_t v30 = 3;
  uint64_t v31 = 3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v27 = *(void *)(StatusReg + 24);
  int v26 = 0;
  unsigned int v25 = v27;
  unsigned int v24 = v27;
  int v3 = 0;
  atomic_compare_exchange_strong_explicit(v29, (unsigned int *)&v3, v27, memory_order_acquire, memory_order_acquire);
  if (v3) {
    int v26 = v3;
  }
  BOOL v23 = v3 == 0;
  if (v3) {
LABEL_8:
  }
    os_unfair_lock_lock_with_options();
  int v12 = v11;
  if ((v11->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    int v10 = 16;
    unint64_t v21 = v11;
    if (((*(_DWORD *)&v11->__opaque[4] >> 14) & 1) == 0 || *(_DWORD *)&v11->__opaque[16])
    {
      unint64_t v16 = v11;
      BOOL v15 = &v9;
      uint64_t v9 = (void *)((unint64_t)&v11->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
      uint64_t v8 = 0;
      unint64_t v18 = v9;
      unint64_t v17 = &v8;
      uint64_t v8 = *v9;
      unint64_t v20 = v11;
      BOOL v19 = &v7;
      unint64_t v7 = (void *)((unint64_t)&v11->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      if (!*v7 && (v8 & 0xFFFFFF00) == (HIDWORD(v8) & 0xFFFFFF00)) {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    unint64_t v22 = v11;
    if ((v11->__sig & 0xFFFFFFF0) == 0x32AAABA0) {
      int v10 = 0;
    }
  }
  if (!v10) {
    v11->__unsigned int sig = 0;
  }
  BOOL v14 = v11->__opaque;
  uint64_t v38 = v11->__opaque;
  int v37 = 0;
  uint64_t v39 = 3;
  uint64_t v40 = 3;
  unint64_t v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v37 = *(void *)(v41 + 24);
  int v36 = 0;
  int v35 = v37;
  int v34 = 0;
  int v4 = v37;
  int v5 = v37;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11->__opaque, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4) {
    int v35 = v5;
  }
  BOOL v33 = v5 == v4;
  if (v5 != v4) {
    os_unfair_lock_unlock((os_unfair_lock_t)v38);
  }
  return v10;
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  if (a1->__sig != 1297373249) {
    return 22;
  }
  a1->__unsigned int sig = 0;
  return 0;
}

uint64_t _pthread_mutex_check_init_slow(uint64_t a1)
{
  unsigned int v11 = 22;
  uint64_t v33 = a1;
  BOOL v1 = (*(void *)a1 & 0xFFFFFFF0) == 850045856;
  if ((*(void *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
  {
    uint64_t v25 = a1 + 8;
    uint64_t v40 = (atomic_uint *)(a1 + 8);
    int v39 = 327680;
    char v2 = !v1;
    if ((v2 & 1) == 0) {
      goto LABEL_9;
    }
    unsigned int v38 = 0;
    uint64_t v41 = 3;
    uint64_t v42 = 3;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v38 = *(void *)(StatusReg + 24);
    int v37 = 0;
    unsigned int v36 = v38;
    unsigned int v35 = v38;
    int v3 = 0;
    atomic_compare_exchange_strong_explicit(v40, (unsigned int *)&v3, v38, memory_order_acquire, memory_order_acquire);
    if (v3) {
      int v37 = v3;
    }
    BOOL v34 = v3 == 0;
    if (v3) {
LABEL_9:
    }
      os_unfair_lock_lock_with_options();
    uint64_t v32 = a1;
    if ((*(void *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
    {
      unsigned int v4 = *(void *)a1 & 0xF;
      uint64_t v21 = a1;
      uint64_t v20 = 0;
      unsigned int v19 = v4;
      *(_DWORD *)(a1 + 12) = 0;
      *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFDFFF | 0x2000;
      if (v20)
      {
        if (*(void *)v20 == 1297373249)
        {
          *(_WORD *)(v21 + 16) = *(_DWORD *)(v20 + 8);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFFC | *(_DWORD *)(v20 + 12) & 3;
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFE3F | (((*(_DWORD *)(v20 + 12) >> 6) & 7) << 6);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFF3 | (4 * ((*(_DWORD *)(v20 + 12) >> 2) & 3));
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFCF | (16 * ((*(_DWORD *)(v20 + 12) >> 4) & 3));
LABEL_28:
          *(_WORD *)(v21 + 18) = 0;
          uint64_t v18 = 1297437784;
          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0)
          {
            uint64_t v31 = v21;
            if (((*(_DWORD *)(v21 + 12) >> 6) & 7) == 1 || (uint64_t v53 = v21, ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2)) {
              uint64_t v18 = _pthread_mutex_sig_fast;
            }
          }
          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0
            && ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2
            && ((*(_DWORD *)(v21 + 12) >> 4) & 3) == 2
            && v18 == _pthread_mutex_sig_fast)
          {
            *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
          }
          else
          {
            *(_DWORD *)(v21 + 12) &= ~0x4000u;
          }
          if ((*(_DWORD *)(v21 + 12) >> 14))
          {
            uint64_t v7 = v21;
            *(void *)(v21 + 24) = -1;
            *(void *)(v7 + 32) = -1;
            *(void *)(v7 + 40) = -1;
            int v17 = 0;
            *(_DWORD *)(v21 + 24) = 0;
          }
          else
          {
            uint64_t v28 = v21;
            unsigned int v27 = &v16;
            unint64_t v16 = (void *)((v21 + 39) & 0xFFFFFFFFFFFFFFF8);
            uint64_t v30 = v21;
            uint64_t v29 = &v15;
            BOOL v15 = (void *)((v21 + 31) & 0xFFFFFFFFFFFFFFF8);
            if (v15 != (void *)(v21 + 24))
            {
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFF7FF | 0x800;
              *(void *)(v21 + 24) = -1;
            }
            *(void *)(v21 + 40) = -1;
            *BOOL v15 = 0;
            void *v16 = 0;
          }
          int v14 = v18;
          *(void *)(v21 + 48) = ~v21;
          *(_DWORD *)(v21 + 56) = v14;
          *(_DWORD *)(v21 + 60) = v14;
          *(_DWORD *)(v21 + 20) = v14;
          BOOL v13 = (unsigned int *)v21;
          *(_DWORD *)(v21 + 4) = HIDWORD(v18);
          atomic_store(v18, v13);
          int v22 = 0;
        }
        else
        {
          int v22 = 22;
        }
      }
      else
      {
        if (v19 <= 1)
        {
          uint64_t v6 = v19 - 1;
          char v5 = 0;
        }
        else
        {
          uint64_t v6 = v19 - 1;
          char v5 = 1;
        }
        if ((v5 & 1) == 0)
        {
          switch(v6)
          {
            case 0:
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFF3 | 4;
              goto LABEL_24;
            case 1:
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFF3 | 8;
              goto LABEL_24;
            case 2:
            case 6:
              *(_DWORD *)(v21 + 12) &= 0xFFFFFFF3;
LABEL_24:
              *(_WORD *)(v21 + 16) = 0;
              *(_DWORD *)(v21 + 12) &= 0xFFFFFFFC;
              if (v19 == 3) {
                *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFE3F | 0x80;
              }
              else {
                *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFE3F | ((__pthread_mutex_default_opt_policy & 7) << 6);
              }
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFCF | 0x20;
              goto LABEL_28;
            case 3:
            case 4:
            case 5:
              break;
            default:
              JUMPOUT(0);
          }
        }
        int v22 = 22;
      }
      unsigned int v11 = v22;
    }
    else
    {
      uint64_t v24 = a1;
      if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
        unsigned int v11 = 0;
      }
    }
    uint64_t v26 = a1 + 8;
    os_unfair_lock_t v49 = (os_unfair_lock_t)(a1 + 8);
    int v48 = 0;
    uint64_t v50 = 3;
    uint64_t v51 = 3;
    unint64_t v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v48 = *(void *)(v52 + 24);
    int v47 = 0;
    int v46 = v48;
    int v45 = 0;
    int v8 = v48;
    int v9 = v48;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
    if (v9 != v8) {
      int v46 = v9;
    }
    BOOL v44 = v9 == v8;
    if (v9 != v8) {
      os_unfair_lock_unlock(v49);
    }
  }
  else
  {
    uint64_t v23 = a1;
    if ((*(void *)a1 & 0xFFFFFFFDLL) == 0x4D555458) {
      return 0;
    }
  }
  return v11;
}

uint64_t _pthread_mutex_fairshare_lock(uint64_t a1, char a2)
{
  uint64_t v12 = a1;
  char v11 = a2 & 1;
  uint64_t v29 = a1;
  uint64_t v28 = &v10;
  int v10 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v9 = *(void *)(StatusReg - 8);
  uint64_t v25 = a1;
  uint64_t v24 = &v8;
  int v8 = (atomic_ullong *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = 0;
  unint64_t v6 = 0;
  unsigned int v27 = v8;
  uint64_t v26 = &v7;
  unint64_t v7 = *(void *)v8;
  if ((v7 & 2) != 0)
  {
    return _pthread_mutex_fairshare_lock_slow(v12, v11 & 1);
  }
  else
  {
    do
    {
      unint64_t v6 = v7;
      BOOL v5 = (v7 & 2) == 0;
      if ((v11 & 1) == 0 || (v7 & 2) == 0)
      {
        if ((v7 & 2) != 0) {
          return _pthread_mutex_fairshare_lock_slow(v12, v11 & 1);
        }
        LODWORD(v6) = v6 + 256;
        LODWORD(v6) = v6 | 3;
      }
      uint64_t v23 = v8;
      int v22 = &v7;
      uint64_t v21 = &v6;
      unint64_t v20 = v7;
      BOOL v19 = 0;
      unint64_t v17 = v6;
      unint64_t v16 = v6;
      unint64_t v18 = v6;
      unint64_t v2 = v7;
      unint64_t v3 = v7;
      atomic_compare_exchange_strong_explicit(v8, &v3, v6, memory_order_acquire, memory_order_acquire);
      if (v3 != v2) {
        unint64_t v20 = v3;
      }
      BOOL v15 = v3 == v2;
      BOOL v19 = v3 == v2;
      *int v22 = v20;
      BOOL v14 = v19;
    }
    while (!v19);
    if (v5)
    {
      *int v10 = v9;
      return 0;
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        __break(1u);
        JUMPOUT(0x16894);
      }
      return 16;
    }
  }
}

void *__cdecl malloc(size_t __size)
{
  if (_pthread_malloc) {
    return (void *)_pthread_malloc(__size);
  }
  else {
    return 0;
  }
}

void free(void *a1)
{
  if (_pthread_free) {
    _pthread_free(a1);
  }
}

uint64_t _pthread_qos_class_to_thread_qos(unsigned int a1)
{
  if (a1 <= 5)
  {
    uint64_t v2 = a1 - 5;
    char v1 = 0;
  }
  else
  {
    uint64_t v2 = a1 - 5;
    char v1 = 1;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        return 1;
      case 1:
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 13:
      case 14:
      case 15:
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
        break;
      case 4:
        return 2;
      case 12:
        return 3;
      case 16:
        return 4;
      case 20:
        return 5;
      case 28:
        return 6;
      default:
        JUMPOUT(0);
    }
  }
  return 0;
}

uint64_t _pthread_set_main_qos(uint64_t result)
{
  _main_qos = result;
  return result;
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  char v5 = __relative_priority;
  unsigned __int8 v4 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (__attr->__sig != 1414022209 || ((*(void *)&__attr->__opaque[32] >> 24) & 1) != 0) {
    return 22;
  }
  unsigned int v8 = 0;
  if (v4 && v4 < 7u) {
    unsigned int v8 = (1 << (v4 + 7)) | (v5 - 1);
  }
  *(void *)&__attr->__opaque[24] = v8;
  *(void *)&__attr->__opaque[32] = *(void *)&__attr->__opaque[32] & 0xFFFFFFFFFDFFFFFFLL | 0x2000000;
  *(void *)&__attr->__opaque[32] &= ~0x1000000uLL;
  return 0;
}

uint64_t _pthread_validate_qos_class_and_relpri(unsigned int a1, int a2)
{
  if (a2 <= 0 && a2 >= -15) {
    return _pthread_qos_class_to_thread_qos(a1);
  }
  else {
    return 0;
  }
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  if (__attr->__sig != 1414022209) {
    return 22;
  }
  if ((*(void *)&__attr->__opaque[32] >> 25)) {
    _pthread_priority_split(*(void *)&__attr->__opaque[24], __qos_class, __relative_priority);
  }
  else {
    _pthread_priority_split(0, __qos_class, __relative_priority);
  }
  return 0;
}

uint64_t _pthread_priority_split(uint64_t result, _DWORD *a2, int *a3)
{
  int v10 = result;
  BOOL v7 = 0;
  if ((result & 0x22000000) == 0) {
    BOOL v7 = (result & 0x3F00) != 0;
  }
  if (v7)
  {
    unsigned int v3 = (unint64_t)(result & 0x3F00) >> 8;
    char v4 = __clz(__rbit32(v3));
    if (v3) {
      unsigned __int8 v5 = v4 + 1;
    }
    else {
      unsigned __int8 v5 = 0;
    }
    unsigned __int8 v11 = v5;
  }
  else
  {
    unsigned __int8 v11 = 0;
  }
  if (a2)
  {
    int result = _pthread_qos_class_from_thread_qos(v11);
    *a2 = result;
  }
  if (a3)
  {
    BOOL v6 = 0;
    if ((v10 & 0x22000000) == 0) {
      BOOL v6 = (v10 & 0x3F00) != 0;
    }
    if (v6) {
      int v12 = (char)v10 + 1;
    }
    else {
      int v12 = 0;
    }
    *a3 = v12;
  }
  return result;
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  char v4 = __relative_priority;
  unsigned __int8 v3 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v3) {
    return 22;
  }
  uint64_t v6 = 0;
  if (v3 < 7u) {
    LODWORD(v6) = (1 << (v3 + 7)) | (v4 - 1);
  }
  return _pthread_set_properties_self(1, v6);
}

uint64_t _pthread_set_properties_self(int a1, int a2)
{
  char v7 = a1;
  unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  unsigned int v3 = 0;
  if ((*(void *)v5 ^ _pthread_ptr_munge_token) != v5) {
    abort_with_reason();
  }
  if ((*(unsigned char *)(v5 + 164) & 1) == 0 || (v7 & 0x2D) == 0 || (a1 & 0xFFFFFFD2) != 0) {
    unsigned int v3 = __bsdthread_ctl();
  }
  if ((v7 & 1) != 0 && (!v3 || **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) == 2)) {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = a2 & 0xFF403FFF;
  }
  if (v3) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v3;
}

uint64_t pthread_set_qos_class_np(void *a1, qos_class_t a2, int a3)
{
  if (a1 == (void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((void *)(*a1 ^ _pthread_ptr_munge_token) != a1) {
      abort_with_reason();
    }
    return pthread_set_qos_class_self_np(a2, a3);
  }
  else
  {
    return 1;
  }
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return 0;
}

qos_class_t qos_class_self(void)
{
  uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32);
  BOOL v4 = 0;
  if ((v5 & 0x22000000) == 0) {
    BOOL v4 = (v5 & 0x3F00) != 0;
  }
  if (!v4) {
    return _pthread_qos_class_from_thread_qos(0);
  }
  unsigned int v0 = (unint64_t)(v5 & 0x3F00) >> 8;
  char v1 = __clz(__rbit32(v0));
  if (v0) {
    unsigned __int8 v2 = v1 + 1;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_from_thread_qos(unsigned __int8 a1)
{
  if (a1 < 7u) {
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[a1];
  }
  else {
    return 0;
  }
}

qos_class_t qos_class_main(void)
{
  BOOL v4 = 0;
  if ((_main_qos & 0x22000000) == 0) {
    BOOL v4 = (_main_qos & 0x3F00) != 0;
  }
  if (!v4) {
    return _pthread_qos_class_from_thread_qos(0);
  }
  unsigned int v0 = (unint64_t)(_main_qos & 0x3F00) >> 8;
  char v1 = __clz(__rbit32(v0));
  if (v0) {
    unsigned __int8 v2 = v1 + 1;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_encode(unsigned int a1, char a2, int a3)
{
  unsigned __int8 v7 = _pthread_qos_class_to_thread_qos(a1);
  unsigned int v6 = a3 & 0xFF000000;
  if (v7 && v7 < 7u) {
    v6 |= (1 << (v7 + 7)) | (a2 - 1);
  }
  return v6;
}

uint64_t _pthread_qos_class_decode(uint64_t a1, int *a2, void *a3)
{
  uint64_t v7 = a1;
  unsigned int v6 = a2;
  uint64_t v5 = a3;
  unsigned int v4 = 0;
  _pthread_priority_split(a1, &v4, a2);
  if (v5) {
    *uint64_t v5 = v7 & 0xFF000000;
  }
  return v4;
}

uint64_t _pthread_qos_class_and_override_encode(unsigned int a1, char a2, int a3, unsigned int a4)
{
  unsigned __int8 v5 = _pthread_qos_class_to_thread_qos(a1);
  unsigned __int8 v10 = _pthread_qos_class_to_thread_qos(a4);
  unsigned int v11 = a3 & 0xFF000000;
  if (v5 && v5 < 7u) {
    v11 |= (1 << (v5 + 7)) | (a2 - 1);
  }
  unsigned int v9 = v11;
  if (v10 && v10 < 7u) {
    return v11 | (1 << (v10 + 13)) | 0x800000;
  }
  return v9;
}

uint64_t _pthread_qos_class_and_override_decode(int a1, int *a2, void *a3, _DWORD *a4)
{
  BOOL v13 = 0;
  if ((a1 & 0x22000000) == 0) {
    BOOL v13 = (a1 & 0x3F00) != 0;
  }
  if (v13)
  {
    unsigned int v4 = (unint64_t)(a1 & 0x3F00) >> 8;
    char v5 = __clz(__rbit32(v4));
    if (v4) {
      unsigned __int8 v6 = v5 + 1;
    }
    else {
      unsigned __int8 v6 = 0;
    }
    unsigned __int8 v17 = v6;
  }
  else
  {
    unsigned __int8 v17 = 0;
  }
  BOOL v12 = 0;
  if ((a1 & 0x22000000) == 0)
  {
    BOOL v12 = 0;
    if ((a1 & 0x800000) != 0) {
      BOOL v12 = (a1 & 0x3FC000) != 0;
    }
  }
  if (v12)
  {
    unsigned int v7 = (a1 & 0x3FC000u) >> 14;
    char v8 = __clz(__rbit32(v7));
    if (v7) {
      unsigned __int8 v9 = v8 + 1;
    }
    else {
      unsigned __int8 v9 = 0;
    }
    unsigned __int8 v18 = v9;
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
  if (a4) {
    *a4 = _pthread_qos_class_from_thread_qos(v18);
  }
  if (a3) {
    *a3 = a1 & 0xFF000000;
  }
  if (a2)
  {
    BOOL v11 = 0;
    if ((a1 & 0x22000000) == 0) {
      BOOL v11 = (a1 & 0x3F00) != 0;
    }
    if (v11) {
      int v19 = (char)a1 + 1;
    }
    else {
      int v19 = 0;
    }
    *a2 = v19;
  }
  return _pthread_qos_class_from_thread_qos(v17);
}

uint64_t _pthread_sched_pri_encode(int a1, int a2)
{
  return a2 & 0xDF000000 | 0x20000000 | a1;
}

uint64_t _pthread_sched_pri_decode(int a1, void *a2)
{
  if (a2) {
    *a2 = a1 & 0xDF000000;
  }
  if ((a1 & 0x20000000) != 0) {
    return (unsigned __int16)a1;
  }
  else {
    return 0;
  }
}

uint64_t _pthread_qos_class_encode_workqueue(int a1, int a2)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned __int8 v3 = 4;
    }
    else
    {
      if (a1 != 2)
      {
        if (a1 == 3)
        {
          unsigned __int8 v3 = 2;
          goto LABEL_11;
        }
        if (a1 != 128)
        {
          qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid priority";
          qword_2C058 = a1;
          __break(1u);
          JUMPOUT(0x17CA4);
        }
      }
      unsigned __int8 v3 = 3;
    }
  }
  else
  {
    unsigned __int8 v3 = 6;
  }
LABEL_11:
  unsigned int v4 = HIBYTE(a2) << 24;
  if (v3 <= 6u) {
    v4 |= (1 << (v3 + 7)) | 0xFF;
  }
  return v4;
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_properties_self(4, 0);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_properties_self(8, 0);
}

uint64_t pthread_prefer_alternate_cluster_self()
{
  return _pthread_set_properties_self(32, 0);
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  pthread_t v12 = __pthread;
  qos_class_t v11 = __qos_class;
  int v10 = __relative_priority;
  unsigned __int8 v9 = 0;
  v8[4] = 0;
  int v7 = 0;
  char v6 = 1;
  *(_DWORD *)char v8 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v8[0]) {
    return 0;
  }
  mach_vm_address_t address = (mach_vm_address_t)malloc(0x20uLL);
  if (address
    || (mach_vm_address_t address = vm_page_size,
        char v6 = 0,
        (*(_DWORD *)&v8[1] = mach_vm_allocate(mach_task_self_, &address, (vm_page_size + 31) & ~(vm_page_size - 1), 1241513985)) == 0))
  {
    unsigned __int8 v9 = (void *)address;
    *(_DWORD *)mach_vm_address_t address = 1870030194;
    *((void *)v9 + 1) = v12;
    mach_port_t v3 = pthread_mach_thread_np(v12);
    *((_DWORD *)v9 + 1) = v3;
    unsigned __int8 v17 = v8[0];
    int v16 = v10;
    int v15 = 0;
    uint64_t v14 = 0;
    if (v8[0] && v17 < 7u)
    {
      LODWORD(v14) = v14 | (1 << (v17 + 7));
      LODWORD(v14) = v14 | (v16 - 1);
    }
    *((void *)v9 + 2) = v14;
    *((unsigned char *)v9 + 24) = v6 & 1;
    *(_DWORD *)&v8[1] = mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, 1);
    if (*(_DWORD *)&v8[1]) {
      int v7 = 22;
    }
    if (!v7)
    {
      int v7 = __bsdthread_ctl();
      if (v7) {
        mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, -1);
      }
    }
    if (v7)
    {
      if (v6) {
        free(v9);
      }
      else {
        mach_vm_deallocate(mach_task_self_, address, (vm_page_size + 31) & ~(vm_page_size - 1));
      }
      return 0;
    }
    return (pthread_override_t)v9;
  }
  else
  {
    uint64_t v18 = 1;
    uint64_t v19 = 1;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    **(_DWORD **)(StatusReg + 8) = 12;
    return 0;
  }
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  if (_pthread_atomic_xchg_uint32_relaxed((unsigned int *)__override, 0x7265766Fu) != 1870030194)
  {
    __break(1u);
    JUMPOUT(0x18134);
  }
  int v2 = __bsdthread_ctl();
  if (v2 == -1) {
    int v2 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  if (v2 == 14) {
    int v2 = 0;
  }
  if (mach_port_mod_refs(mach_task_self_, *((_DWORD *)__override + 1), 0, -1)) {
    int v2 = 22;
  }
  if (*((unsigned char *)__override + 24))
  {
    free(__override);
  }
  else if (mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)__override, (vm_page_size + 31) & ~(vm_page_size - 1)))
  {
    return 22;
  }
  return v2;
}

uint64_t _pthread_qos_override_start_direct()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_qos_override_end_direct()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_override_qos_class_start_direct()
{
  return _pthread_qos_override_start_direct();
}

uint64_t _pthread_override_qos_class_end_direct()
{
  return _pthread_qos_override_end_direct();
}

uint64_t _pthread_workqueue_override_start_direct()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_override_start_direct_check_owner(int a1, uint64_t a2, int *a3)
{
  if (!_pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check) {
    a3 = 0;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v4 = __bsdthread_ctl();
      if (v4 == -1) {
        unsigned int v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      }
      if (!a3 || v4 != 22) {
        break;
      }
      if ((unint64_t)a3 % 4) {
        return 22;
      }
      _pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check = 0;
      a3 = 0;
    }
    if (!a3 || v4 != 14) {
      break;
    }
    if (ulock_owner_value_to_port_name(*a3) != a1) {
      return 70;
    }
  }
  return v4;
}

uint64_t ulock_owner_value_to_port_name(int a1)
{
  return a1 | 3u;
}

uint64_t _pthread_workqueue_override_reset()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_asynchronous_override_add()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_self()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_all_self()
{
  unsigned int v1 = __bsdthread_ctl();
  if (v1 == -1) {
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
  return v1;
}

uint64_t pthread_qos_max_parallelism(unsigned int a1, uint64_t a2)
{
  unsigned int v7 = a1;
  if (!a1) {
    unsigned int v7 = 21;
  }
  unsigned __int8 v5 = _pthread_qos_class_to_thread_qos(v7);
  if (!v5 || (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }
  else
  {
    char v4 = 1;
    if (_os_alloc_once_table[32] == -1) {
      uint64_t v9 = _os_alloc_once_table[33];
    }
    else {
      uint64_t v9 = _os_alloc_once();
    }
    mach_port_t v3 = (unsigned __int16 *)(v9 + 272 + 2 * v5);
    if (a2)
    {
      char v4 = 0;
      if (_os_alloc_once_table[32] == -1) {
        uint64_t v10 = _os_alloc_once_table[33];
      }
      else {
        uint64_t v10 = _os_alloc_once();
      }
      mach_port_t v3 = (unsigned __int16 *)(v10 + 286 + 2 * v5);
    }
    else if ((a2 & 2) != 0)
    {
      char v4 = 4;
      if (_os_alloc_once_table[32] == -1) {
        uint64_t v11 = _os_alloc_once_table[33];
      }
      else {
        uint64_t v11 = _os_alloc_once();
      }
      mach_port_t v3 = (unsigned __int16 *)(v11 + 300 + 2 * v5);
    }
    if (*v3 == 0xFFFF) {
      *mach_port_t v3 = _pthread_workqueue_parallelism_for_priority(v5, v4);
    }
    return *v3;
  }
}

uint64_t _pthread_workqueue_parallelism_for_priority(uint64_t a1, char a2)
{
  int v3 = __bsdthread_ctl();
  if (v3 == -1)
  {
    int v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v4 != 22 && v4 != 45)
    {
      qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: qos_max_parallelism failed";
      qword_2C058 = v4;
      __break(1u);
      JUMPOUT(0x18CD0);
    }
    if (a2)
    {
      return MEMORY[0xFFFFFC036];
    }
    else if ((a2 & 4) != 0)
    {
      if (v4 != 45)
      {
        __break(1u);
        JUMPOUT(0x18D20);
      }
      return 0;
    }
    else
    {
      return MEMORY[0xFFFFFC035];
    }
  }
  else
  {
    return (unsigned __int16)v3;
  }
}

uint64_t pthread_time_constraint_max_parallelism(char a1)
{
  char v3 = 1;
  if (_os_alloc_once_table[32] == -1) {
    uint64_t v6 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v6 = _os_alloc_once();
  }
  int v2 = (unsigned __int16 *)(v6 + 272);
  if (a1)
  {
    char v3 = 0;
    if (_os_alloc_once_table[32] == -1) {
      uint64_t v7 = _os_alloc_once_table[33];
    }
    else {
      uint64_t v7 = _os_alloc_once();
    }
    int v2 = (unsigned __int16 *)(v7 + 286);
  }
  else if ((a1 & 2) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }
  if (*v2 == 0xFFFF) {
    *int v2 = _pthread_workqueue_parallelism_for_priority(0, v3 | 2u);
  }
  return *v2;
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  if (__qos_class == 5 || __qos_class == QOS_CLASS_BACKGROUND || __qos_class == QOS_CLASS_UTILITY) {
    return posix_spawnattr_set_qos_clamp_np();
  }
  else {
    return 22;
  }
}

int posix_spawnattr_get_qos_class_np(const posix_spawnattr_t *__attr, qos_class_t *__qos_class)
{
  if (!__qos_class) {
    return 22;
  }
  int qos_clamp_np = posix_spawnattr_get_qos_clamp_np();
  if (qos_clamp_np) {
    return qos_clamp_np;
  }
  *__qos_class = QOS_CLASS_UNSPECIFIED;
  return 0;
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  a1->__unsigned int sig = 1381452865;
  *(_DWORD *)a1->__opaque = 2;
  return 0;
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  a1->__unsigned int sig = 0;
  int result = 0;
  *(_DWORD *)a1->__opaque = 0;
  return result;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *a1, int *a2)
{
  int v3 = 22;
  if (a1->__sig == 1381452865)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }
  return v3;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *a1, int a2)
{
  int v3 = 22;
  if (a1->__sig == 1381452865 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  int v15 = 0;
  opaque = (atomic_uint *)a1->__opaque;
  int v40 = 327680;
  if (_ZF) {
    char v2 = 0;
  }
  else {
    char v2 = 1;
  }
  if ((v2 & 1) == 0) {
    goto LABEL_8;
  }
  unsigned int v39 = 0;
  uint64_t v42 = 3;
  uint64_t v43 = 3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unsigned int v39 = *(void *)(StatusReg + 24);
  int v38 = 0;
  unsigned int v37 = v39;
  unsigned int v36 = v39;
  int v3 = 0;
  atomic_compare_exchange_strong_explicit(opaque, (unsigned int *)&v3, v39, memory_order_acquire, memory_order_acquire);
  if (v3) {
    int v38 = v3;
  }
  BOOL v35 = v3 == 0;
  if (v3) {
LABEL_8:
  }
    os_unfair_lock_lock_with_options();
  if (a1->__sig == 1381452875)
  {
    unint64_t v20 = a1;
    int v19 = 0;
    uint64_t v24 = a1;
    uint64_t v23 = &v18;
    uint64_t v18 = (_OWORD *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
    long long v17 = 0uLL;
    BOOL v34 = v18;
    uint64_t v33 = &v17;
    int v32 = 3;
    long long v17 = *v18;
    do
    {
      long long v31 = 0u;
      long long v31 = *v33;
      int v30 = 0;
      long long v28 = 0u;
      long long v28 = *v33;
      long long v27 = v28;
      long long v29 = v28;
      _X1 = *((void *)&v31 + 1);
      _X2 = v28;
      __asm { CASP            X0, X1, X2, X3, [X8] }
      *(void *)&long long v10 = _X0;
      *((void *)&v10 + 1) = *((void *)&v31 + 1);
      BOOL v14 = (_X0 ^ (unint64_t)v31) == (unsigned __int128)0;
      if ((_X0 ^ (unint64_t)v31) != (unsigned __int128)0) {
        long long v31 = v10;
      }
      BOOL v26 = v14;
      int v30 = v14;
      long long *v33 = v31;
      int v25 = v30;
    }
    while (!v30);
    if ((v17 & 0xFFFFFF00) != DWORD2(v17)) {
      int v19 = 16;
    }
    int v15 = v19;
  }
  else
  {
    uint64_t v21 = a1;
    if (a1->__sig != 766030772) {
      int v15 = 22;
    }
  }
  if (!v15) {
    a1->__unsigned int sig = 0;
  }
  int v22 = a1->__opaque;
  uint64_t v50 = a1->__opaque;
  int v49 = 0;
  uint64_t v51 = 3;
  uint64_t v52 = 3;
  unint64_t v53 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v49 = *(void *)(v53 + 24);
  int v48 = 0;
  int v47 = v49;
  int v46 = 0;
  int v11 = v49;
  int v12 = v49;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1->__opaque, (unsigned int *)&v12, 0, memory_order_release, memory_order_relaxed);
  if (v12 != v11) {
    int v47 = v12;
  }
  BOOL v45 = v12 == v11;
  if (v12 != v11) {
    os_unfair_lock_unlock((os_unfair_lock_t)v50);
  }
  return v15;
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  int v14 = 0;
  if (a2 && a2->__sig != 1381452865) {
    int v14 = 22;
  }
  if (!v14 && a1->__sig == 1381452875)
  {
    unint64_t v20 = a1;
    int v19 = 0;
    unsigned int v39 = a1;
    int v38 = &v18;
    uint64_t v18 = (_OWORD *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
    long long v17 = 0uLL;
    int v49 = v18;
    int v48 = &v17;
    int v47 = 3;
    long long v17 = *v18;
    do
    {
      long long v46 = 0u;
      long long v46 = *v48;
      int v45 = 0;
      long long v43 = 0u;
      long long v43 = *v48;
      long long v42 = v43;
      long long v44 = v43;
      _X1 = *((void *)&v46 + 1);
      _X2 = v43;
      __asm { CASP            X0, X1, X2, X3, [X8] }
      *(void *)&long long v9 = _X0;
      *((void *)&v9 + 1) = *((void *)&v46 + 1);
      BOOL v13 = (_X0 ^ (unint64_t)v46) == (unsigned __int128)0;
      if ((_X0 ^ (unint64_t)v46) != (unsigned __int128)0) {
        long long v46 = v9;
      }
      BOOL v41 = v13;
      int v45 = v13;
      *int v48 = v46;
      int v40 = v45;
    }
    while (!v45);
    if ((v17 & 0xFFFFFF00) != DWORD2(v17)) {
      int v19 = 16;
    }
    int v14 = v19;
  }
  if (!v14)
  {
    opaque = a1->__opaque;
    int v21 = 0;
    *(_DWORD *)a1->__opaque = 0;
    BOOL v35 = a1;
    BOOL v34 = a2;
    uint64_t v51 = a1;
    uint64_t v50 = &v33;
    uint64_t v33 = (pthread_rwlock_t *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
    unsigned int v37 = a1;
    unsigned int v36 = &v32;
    int v32 = (char *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
    if (v33 != (pthread_rwlock_t *)&a1->__opaque[16])
    {
      *(_DWORD *)&v35->__opaque[4] = *(_DWORD *)&v35->__opaque[4] & 0xDFFFFFFF | 0x20000000;
      *(void *)&v35->__opaque[16] = -1;
    }
    if (v32 != &v35->__opaque[24])
    {
      long long v10 = v35;
      *(void *)&v35->__opaque[24] = -1;
      *(void *)&v10->__opaque[32] = -1;
    }
    int v11 = v35;
    *(void *)&v35->__opaque[40] = -1;
    *(void *)&v11->__opaque[48] = -1;
    v33->__unsigned int sig = 0;
    *(void *)&long long v31 = 0x1000000C0;
    DWORD2(v31) = 0;
    *(_OWORD *)int v32 = v31;
    if (v34 && *(_DWORD *)v34->__opaque == 1)
    {
      *(_DWORD *)&v35->__opaque[4] = *(_DWORD *)&v35->__opaque[4] & 0x3FFFFFFF | 0x40000000;
      *(_DWORD *)&v35->__opaque[8] = 16;
    }
    else
    {
      *(_DWORD *)&v35->__opaque[4] = *(_DWORD *)&v35->__opaque[4] & 0x3FFFFFFF | 0x80000000;
      *(_DWORD *)&v35->__opaque[8] = 32;
    }
    uint64_t v30 = 1381452875;
    _platform_bzero();
    int v29 = v30;
    unint64_t v28 = ~(unint64_t)v35;
    *(void *)&v35->__opaque[56] = ~(unint64_t)v35;
    *(_DWORD *)&v35->__opaque[188] = v29;
    *(_DWORD *)&v35->__opaque[12] = v29;
    long long v27 = (unsigned int *)v35;
    BOOL v26 = (unsigned int *)&v30;
    HIDWORD(v35->__sig) = HIDWORD(v30);
    unsigned int v25 = 0;
    unsigned int v25 = *v26;
    unsigned int v24 = v25;
    atomic_store(v25, v27);
    unsigned int v23 = v25;
    return 0;
  }
  return v14;
}

uint64_t _pthread_rwlock_lock_slow(void *a1, char a2, char a3)
{
  uint64_t v30 = a1;
  char v29 = a2 & 1;
  char v28 = a3 & 1;
  unsigned int v27 = 0;
  uint64_t v33 = a1;
  unsigned int v32 = 0;
  BOOL v35 = a1;
  if (*a1 == 1381452875) {
    unsigned int v34 = v32;
  }
  else {
    unsigned int v34 = _pthread_rwlock_check_init_slow((uint64_t)v33);
  }
  unsigned int v27 = v34;
  if (v34)
  {
    return v27;
  }
  else
  {
    uint64_t v37 = (uint64_t)v30;
    unsigned int v36 = &v26;
    BOOL v26 = (atomic_ullong *)(((unint64_t)v30 + 47) & 0xFFFFFFFFFFFFFFF0);
    long long v25 = 0uLL;
    long long v24 = 0uLL;
    int v57 = v26;
    uint64_t v56 = &v25;
    int v55 = 3;
    long long v25 = *(_OWORD *)v26;
    do
    {
      long long v54 = 0u;
      long long v54 = *v56;
      int v53 = 0;
      long long v51 = 0u;
      long long v51 = *v56;
      long long v50 = v51;
      long long v52 = v51;
      _X1 = *((void *)&v54 + 1);
      _X2 = v51;
      __asm { CASP            X0, X1, X2, X3, [X8] }
      *(void *)&long long v10 = _X0;
      *((void *)&v10 + 1) = *((void *)&v54 + 1);
      BOOL v19 = (_X0 ^ (unint64_t)v54) == (unsigned __int128)0;
      if ((_X0 ^ (unint64_t)v54) != (unsigned __int128)0) {
        long long v54 = v10;
      }
      BOOL v49 = v19;
      int v53 = v19;
      *uint64_t v56 = v54;
      int v48 = v53;
    }
    while (!v53);
    uint64_t v59 = (uint64_t)v30;
    uint64_t v58 = &v23;
    unsigned int v23 = (void *)(((unint64_t)v30 + 31) & 0xFFFFFFFFFFFFFFF8);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v22 = *(void *)(StatusReg - 8);
    if ((v25 & 2) != 0 && *v23 == v22)
    {
      return 11;
    }
    else
    {
      do
      {
        int v21 = 0;
        while (1)
        {
          long long v24 = v25;
          if (v29) {
            BOOL v20 = (v25 & 5) == 0;
          }
          else {
            BOOL v20 = (v25 & 0x40) != 0;
          }
          if ((v28 & 1) != 0 && !v20) {
            goto LABEL_37;
          }
          if (!v20) {
            break;
          }
          if ((v29 & 1) == 0)
          {
            LODWORD(v24) = v24 & 0xFFFFFF00;
            LODWORD(v24) = v24 | 0x83;
            goto LABEL_31;
          }
          if (diff_genseq(v25, SDWORD2(v25)) < 0xFFFFFF00)
          {
            LODWORD(v24) = v24 & 0xFFFFFFBF;
LABEL_31:
            LODWORD(v24) = v24 + 256;
            DWORD1(v24) += 256;
            goto LABEL_37;
          }
          if (++v21 > 1024) {
            return 35;
          }
          sched_yield();
          int v47 = v26;
          long long v46 = &v25;
          int v45 = 3;
          long long v25 = *(_OWORD *)v26;
          do
          {
            long long v44 = 0u;
            long long v44 = *v46;
            int v43 = 0;
            long long v41 = 0u;
            long long v41 = *v46;
            long long v40 = v41;
            long long v42 = v41;
            _X1 = *((void *)&v44 + 1);
            _X2 = v41;
            __asm { CASP            X0, X1, X2, X3, [X8] }
            *(void *)&long long v14 = _X0;
            *((void *)&v14 + 1) = *((void *)&v44 + 1);
            BOOL v18 = (_X0 ^ (unint64_t)v44) == (unsigned __int128)0;
            if ((_X0 ^ (unint64_t)v44) != (unsigned __int128)0) {
              long long v44 = v14;
            }
            BOOL v39 = v18;
            int v43 = v18;
            *long long v46 = v44;
            int v38 = v43;
          }
          while (!v43);
        }
        if (v29) {
          LODWORD(v24) = v24 & 0xFFFFFFBF;
        }
        else {
          LODWORD(v24) = v24 | 5;
        }
        LODWORD(v24) = v24 + 256;
        if (BYTE4(v25))
        {
          DWORD1(v24) = BYTE4(v24) & 0xFE;
          DWORD1(v24) |= v25 & 0xFFFFFF00;
        }
LABEL_37:
        BOOL v72 = v26;
        BOOL v71 = &v25;
        char v70 = &v24;
        int v69 = 1;
        BOOL v68 = 0;
        int v67 = 0;
        uint64_t v66 = v25;
        BOOL v65 = 0;
        uint64_t v63 = v24;
        uint64_t v62 = v24;
        uint64_t v64 = v24;
        uint64_t v15 = v25;
        uint64_t v16 = v25;
        atomic_compare_exchange_strong_explicit(v26, (unint64_t *)&v16, v24, memory_order_acquire, memory_order_acquire);
        if (v16 != v15) {
          uint64_t v66 = v16;
        }
        BOOL v61 = v16 == v15;
        BOOL v65 = v16 == v15;
        *(void *)BOOL v71 = v66;
        BOOL v60 = v65;
        BOOL v68 = v65;
        if (v65) {
          int v67 = 1;
        }
      }
      while (!v67);
      if (v20)
      {
        if ((v29 & 1) == 0) {
          *unsigned int v23 = v22;
        }
        return 0;
      }
      else if (v28)
      {
        return 16;
      }
      else
      {
        return _pthread_rwlock_lock_wait((uint64_t)v30, v29 & 1);
      }
    }
  }
}

uint64_t _pthread_rwlock_lock_wait(uint64_t a1, char a2)
{
  do
  {
    if (a2) {
      int v5 = __psynch_rw_rdlock();
    }
    else {
      int v5 = __psynch_rw_wrlock();
    }
    if (v5 == -1) {
      int v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    else {
      int v6 = 0;
    }
  }
  while (v6 == 4);
  if (v6)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
    qword_2C058 = v6;
    __break(1u);
    JUMPOUT(0x1AE30);
  }
  uint64_t v14 = a1;
  int v13 = v5;
  BOOL v12 = (v5 & 0x40) != 0;
  uint64_t v16 = a1;
  uint64_t v15 = &v11;
  int v11 = (atomic_ullong *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = 0uLL;
  long long v9 = 0uLL;
  BOOL v19 = v11;
  BOOL v18 = &v10;
  int v17 = 1;
  *(void *)&long long v10 = *(void *)v11;
  do
  {
    long long v9 = v10;
    if (v12 || (BYTE4(v10) & 2) != 0)
    {
      LODWORD(v9) = _pthread_rwlock_modbits(v10, v13, BYTE4(v10) & 4);
      DWORD1(v9) += v13 & 0xFFFFFF00;
      if (!v12) {
        DWORD1(v9) &= 0xFFFFFF00;
      }
      DWORD1(v9) &= ~4u;
    }
    unsigned int v32 = v11;
    long long v31 = &v10;
    uint64_t v30 = &v9;
    int v29 = 1;
    BOOL v28 = 0;
    int v27 = 0;
    uint64_t v26 = v10;
    BOOL v25 = 0;
    uint64_t v23 = v9;
    uint64_t v22 = v9;
    uint64_t v24 = v9;
    uint64_t v2 = v10;
    uint64_t v3 = v10;
    atomic_compare_exchange_strong_explicit(v11, (unint64_t *)&v3, v9, memory_order_relaxed, memory_order_relaxed);
    if (v3 != v2) {
      uint64_t v26 = v3;
    }
    BOOL v21 = v3 == v2;
    BOOL v25 = v3 == v2;
    *(void *)long long v31 = v26;
    BOOL v20 = v25;
    BOOL v28 = v25;
    if (v25) {
      int v27 = 1;
    }
  }
  while (!v27);
  return 0;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  int v11 = a1;
  char v10 = 1;
  char v9 = 0;
  int v13 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  uint64_t v15 = v11;
  uint64_t v14 = &v8;
  char v8 = (atomic_ullong *)((unint64_t)&v11->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  long long v7 = 0uLL;
  long long v6 = 0uLL;
  uint64_t v33 = v8;
  unsigned int v32 = &v7;
  int v31 = 3;
  long long v7 = *(_OWORD *)v8;
  if ((v7 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  BOOL v5 = 0;
  do
  {
    long long v6 = v7;
    if (v10) {
      BOOL v5 = (v7 & 5) == 0;
    }
    else {
      BOOL v5 = (v7 & 0x40) != 0;
    }
    if ((v9 & 1) == 0 || v5)
    {
      if (!v5) {
        return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
      }
      if (v10)
      {
        if (diff_genseq(v7, SDWORD2(v7)) >= 0xFFFFFF00) {
          return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
        }
        LODWORD(v6) = v6 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v6) = v6 & 0xFFFFFF00;
        LODWORD(v6) = v6 | 0x83;
      }
      LODWORD(v6) = v6 + 256;
      DWORD1(v6) += 256;
    }
    uint64_t v30 = v8;
    int v29 = &v7;
    BOOL v28 = &v6;
    int v27 = 1;
    BOOL v26 = 0;
    int v25 = 0;
    uint64_t v24 = v7;
    BOOL v23 = 0;
    uint64_t v21 = v6;
    uint64_t v20 = v6;
    uint64_t v22 = v6;
    uint64_t v1 = v7;
    uint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      uint64_t v24 = v2;
    }
    BOOL v19 = v2 == v1;
    BOOL v23 = v2 == v1;
    *(void *)int v29 = v24;
    BOOL v18 = v23;
    BOOL v26 = v23;
    if (v23) {
      int v25 = 1;
    }
  }
  while (!v25);
  if (v5)
  {
    if ((v10 & 1) == 0)
    {
      int v17 = v11;
      uint64_t v16 = &v4;
      int v4 = (void *)((unint64_t)&v11->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *int v4 = *(void *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v9 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1B4F4);
    }
    return 16;
  }
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  int v11 = a1;
  char v10 = 1;
  char v9 = 1;
  int v13 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  uint64_t v15 = v11;
  uint64_t v14 = &v8;
  char v8 = (atomic_ullong *)((unint64_t)&v11->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  long long v7 = 0uLL;
  long long v6 = 0uLL;
  uint64_t v33 = v8;
  unsigned int v32 = &v7;
  int v31 = 3;
  long long v7 = *(_OWORD *)v8;
  if ((v7 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  BOOL v5 = 0;
  do
  {
    long long v6 = v7;
    if (v10) {
      BOOL v5 = (v7 & 5) == 0;
    }
    else {
      BOOL v5 = (v7 & 0x40) != 0;
    }
    if ((v9 & 1) == 0 || v5)
    {
      if (!v5) {
        return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
      }
      if (v10)
      {
        if (diff_genseq(v7, SDWORD2(v7)) >= 0xFFFFFF00) {
          return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
        }
        LODWORD(v6) = v6 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v6) = v6 & 0xFFFFFF00;
        LODWORD(v6) = v6 | 0x83;
      }
      LODWORD(v6) = v6 + 256;
      DWORD1(v6) += 256;
    }
    uint64_t v30 = v8;
    int v29 = &v7;
    BOOL v28 = &v6;
    int v27 = 1;
    BOOL v26 = 0;
    int v25 = 0;
    uint64_t v24 = v7;
    BOOL v23 = 0;
    uint64_t v21 = v6;
    uint64_t v20 = v6;
    uint64_t v22 = v6;
    uint64_t v1 = v7;
    uint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      uint64_t v24 = v2;
    }
    BOOL v19 = v2 == v1;
    BOOL v23 = v2 == v1;
    *(void *)int v29 = v24;
    BOOL v18 = v23;
    BOOL v26 = v23;
    if (v23) {
      int v25 = 1;
    }
  }
  while (!v25);
  if (v5)
  {
    if ((v10 & 1) == 0)
    {
      int v17 = v11;
      uint64_t v16 = &v4;
      int v4 = (void *)((unint64_t)&v11->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *int v4 = *(void *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v9 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1BBB8);
    }
    return 16;
  }
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  int v11 = a1;
  char v10 = 0;
  char v9 = 0;
  int v13 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  uint64_t v15 = v11;
  uint64_t v14 = &v8;
  char v8 = (atomic_ullong *)((unint64_t)&v11->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  long long v7 = 0uLL;
  long long v6 = 0uLL;
  uint64_t v33 = v8;
  unsigned int v32 = &v7;
  int v31 = 3;
  long long v7 = *(_OWORD *)v8;
  if ((v7 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  BOOL v5 = 0;
  do
  {
    long long v6 = v7;
    if (v10) {
      BOOL v5 = (v7 & 5) == 0;
    }
    else {
      BOOL v5 = (v7 & 0x40) != 0;
    }
    if ((v9 & 1) == 0 || v5)
    {
      if (!v5) {
        return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
      }
      if (v10)
      {
        if (diff_genseq(v7, SDWORD2(v7)) >= 0xFFFFFF00) {
          return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
        }
        LODWORD(v6) = v6 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v6) = v6 & 0xFFFFFF00;
        LODWORD(v6) = v6 | 0x83;
      }
      LODWORD(v6) = v6 + 256;
      DWORD1(v6) += 256;
    }
    uint64_t v30 = v8;
    int v29 = &v7;
    BOOL v28 = &v6;
    int v27 = 1;
    BOOL v26 = 0;
    int v25 = 0;
    uint64_t v24 = v7;
    BOOL v23 = 0;
    uint64_t v21 = v6;
    uint64_t v20 = v6;
    uint64_t v22 = v6;
    uint64_t v1 = v7;
    uint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      uint64_t v24 = v2;
    }
    BOOL v19 = v2 == v1;
    BOOL v23 = v2 == v1;
    *(void *)int v29 = v24;
    BOOL v18 = v23;
    BOOL v26 = v23;
    if (v23) {
      int v25 = 1;
    }
  }
  while (!v25);
  if (v5)
  {
    if ((v10 & 1) == 0)
    {
      int v17 = v11;
      uint64_t v16 = &v4;
      int v4 = (void *)((unint64_t)&v11->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *int v4 = *(void *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v9 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1C278);
    }
    return 16;
  }
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  int v11 = a1;
  char v10 = 0;
  char v9 = 1;
  int v13 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  uint64_t v15 = v11;
  uint64_t v14 = &v8;
  char v8 = (atomic_ullong *)((unint64_t)&v11->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  long long v7 = 0uLL;
  long long v6 = 0uLL;
  uint64_t v33 = v8;
  unsigned int v32 = &v7;
  int v31 = 3;
  long long v7 = *(_OWORD *)v8;
  if ((v7 & 2) != 0) {
    return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
  }
  BOOL v5 = 0;
  do
  {
    long long v6 = v7;
    if (v10) {
      BOOL v5 = (v7 & 5) == 0;
    }
    else {
      BOOL v5 = (v7 & 0x40) != 0;
    }
    if ((v9 & 1) == 0 || v5)
    {
      if (!v5) {
        return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
      }
      if (v10)
      {
        if (diff_genseq(v7, SDWORD2(v7)) >= 0xFFFFFF00) {
          return _pthread_rwlock_lock_slow(v11, v10 & 1, v9 & 1);
        }
        LODWORD(v6) = v6 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v6) = v6 & 0xFFFFFF00;
        LODWORD(v6) = v6 | 0x83;
      }
      LODWORD(v6) = v6 + 256;
      DWORD1(v6) += 256;
    }
    uint64_t v30 = v8;
    int v29 = &v7;
    BOOL v28 = &v6;
    int v27 = 1;
    BOOL v26 = 0;
    int v25 = 0;
    uint64_t v24 = v7;
    BOOL v23 = 0;
    uint64_t v21 = v6;
    uint64_t v20 = v6;
    uint64_t v22 = v6;
    uint64_t v1 = v7;
    uint64_t v2 = v7;
    atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v2, v6, memory_order_acquire, memory_order_acquire);
    if (v2 != v1) {
      uint64_t v24 = v2;
    }
    BOOL v19 = v2 == v1;
    BOOL v23 = v2 == v1;
    *(void *)int v29 = v24;
    BOOL v18 = v23;
    BOOL v26 = v23;
    if (v23) {
      int v25 = 1;
    }
  }
  while (!v25);
  if (v5)
  {
    if ((v10 & 1) == 0)
    {
      int v17 = v11;
      uint64_t v16 = &v4;
      int v4 = (void *)((unint64_t)&v11->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *int v4 = *(void *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v9 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1C93CLL);
    }
    return 16;
  }
}

uint64_t _pthread_rwlock_unlock_slow(void *a1, int a2)
{
  BOOL v26 = a1;
  int v25 = a2;
  unsigned int v24 = 0;
  int v23 = 3;
  int v29 = a1;
  unsigned int v28 = 0;
  int v31 = a1;
  if (*a1 == 1381452875) {
    unsigned int v30 = v28;
  }
  else {
    unsigned int v30 = _pthread_rwlock_check_init_slow((uint64_t)v29);
  }
  unsigned int v24 = v30;
  if (v30)
  {
    return v24;
  }
  else
  {
    uint64_t v33 = v26;
    unsigned int v32 = &v22;
    uint64_t v22 = (atomic_ullong *)(((unint64_t)v26 + 47) & 0xFFFFFFFFFFFFFFF0);
    long long v21 = 0uLL;
    long long v20 = 0uLL;
    int v38 = v22;
    uint64_t v37 = &v21;
    int v36 = v23;
    long long v21 = *(_OWORD *)v22;
    if ((v21 & 0x40) != 0)
    {
      return 0;
    }
    else
    {
      if ((v21 & 2) != 0)
      {
        BOOL v35 = v26;
        unsigned int v34 = &v19;
        BOOL v19 = (void *)(((unint64_t)v26 + 31) & 0xFFFFFFFFFFFFFFF8);
        void *v19 = 0;
      }
      do
      {
        v23 &= ~v25;
        long long v20 = v21;
        if ((v23 & 2) != 0) {
          DWORD2(v20) += 256;
        }
        char v18 = 0;
        int v17 = v21 & 0xFFFFFF00;
        if (DWORD2(v20) == (v21 & 0xFFFFFF00))
        {
          LODWORD(v20) = v17 | 0xC0;
          DWORD1(v20) = v17 | 1;
        }
        else if ((v21 & 7) != 0 && DWORD2(v20) == (DWORD1(v21) & 0xFFFFFF00))
        {
          char v18 = 1;
          LODWORD(v20) = v17 | 1;
          DWORD1(v20) |= 2u;
          if ((v21 & 4) != 0) {
            DWORD1(v20) |= 4u;
          }
        }
        int v16 = v23;
        BOOL v65 = v22;
        uint64_t v64 = &v21;
        uint64_t v63 = &v20;
        int v62 = v23;
        BOOL v61 = 0;
        int v60 = 0;
        switch(v23)
        {
          case 1:
            uint64_t v52 = 0;
            uint64_t v52 = *(void *)v64;
            BOOL v51 = 0;
            unint64_t v49 = 0;
            unint64_t v49 = *(void *)v63;
            unint64_t v48 = v49;
            unint64_t v50 = v49;
            uint64_t v10 = v52;
            uint64_t v11 = v52;
            atomic_compare_exchange_strong_explicit(v65, (unint64_t *)&v11, v49, memory_order_release, memory_order_relaxed);
            if (v11 != v10) {
              uint64_t v52 = v11;
            }
            BOOL v47 = v11 == v10;
            BOOL v51 = v11 == v10;
            *(void *)uint64_t v64 = v52;
            BOOL v46 = v51;
            BOOL v61 = v51;
            if (v51) {
              int v60 = 1;
            }
            break;
          case 2:
            int v45 = 0;
            int v45 = *((_DWORD *)v64 + 2);
            BOOL v44 = 0;
            unsigned int v42 = 0;
            unsigned int v42 = *((_DWORD *)v63 + 2);
            unsigned int v41 = v42;
            unsigned int v43 = v42;
            int v12 = v45;
            int v13 = v45;
            atomic_compare_exchange_strong_explicit((atomic_ullong *)((char *)v65 + 8), (unsigned int *)&v13, v42, memory_order_release, memory_order_relaxed);
            if (v13 != v12) {
              int v45 = v13;
            }
            BOOL v40 = v13 == v12;
            BOOL v44 = v13 == v12;
            *((_DWORD *)v64 + 2) = v45;
            BOOL v39 = v44;
            BOOL v61 = v44;
            if (v44) {
              int v60 = 2;
            }
            break;
          case 3:
            long long v59 = 0u;
            long long v59 = *v64;
            int v58 = 0;
            long long v56 = 0u;
            long long v56 = *v63;
            long long v55 = v56;
            long long v57 = v56;
            _X1 = *((void *)&v59 + 1);
            _X2 = v56;
            __asm { CASPL           X0, X1, X2, X3, [X8] }
            *(void *)&long long v9 = _X0;
            *((void *)&v9 + 1) = *((void *)&v59 + 1);
            BOOL v15 = (_X0 ^ (unint64_t)v59) == (unsigned __int128)0;
            if ((_X0 ^ (unint64_t)v59) != (unsigned __int128)0) {
              long long v59 = v9;
            }
            BOOL v54 = v15;
            int v58 = v15;
            *uint64_t v64 = v59;
            int v53 = v58;
            BOOL v61 = v58 != 0;
            if (v58) {
              int v60 = 3;
            }
            break;
          default:
            __break(1u);
            JUMPOUT(0x1CFD4);
        }
        int v25 = v60;
      }
      while (v16 != v60);
      if (v18) {
        return _pthread_rwlock_unlock_drop();
      }
      return v24;
    }
  }
}

uint64_t _pthread_rwlock_unlock_drop()
{
  do
  {
    if (__psynch_rw_unlock() == -1) {
      int v1 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    }
    else {
      int v1 = 0;
    }
  }
  while (v1 == 4);
  if (v1)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwunlock returned unknown error";
    qword_2C058 = v1;
    __break(1u);
    JUMPOUT(0x1D154);
  }
  return 0;
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  unsigned int v24 = a1;
  int v23 = 3;
  int v22 = 0;
  BOOL v26 = a1;
  if (a1->__sig != 1381452875) {
    return _pthread_rwlock_unlock_slow(v24, v22);
  }
  unsigned int v28 = v24;
  int v27 = &v21;
  long long v21 = (atomic_ullong *)((unint64_t)&v24->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  long long v20 = 0uLL;
  long long v19 = 0uLL;
  uint64_t v33 = v21;
  unsigned int v32 = &v20;
  int v31 = v23;
  long long v20 = *(_OWORD *)v21;
  if ((v20 & 0x40) != 0) {
    return 0;
  }
  if ((v20 & 2) != 0)
  {
    unsigned int v30 = v24;
    int v29 = &v18;
    char v18 = (void *)((unint64_t)&v24->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
    void *v18 = 0;
  }
  do
  {
    if (v22) {
      return _pthread_rwlock_unlock_slow(v24, v22);
    }
    long long v19 = v20;
    if ((v23 & 2) != 0) {
      DWORD2(v19) += 256;
    }
    int v17 = v20 & 0xFFFFFF00;
    if (DWORD2(v19) == (v20 & 0xFFFFFF00))
    {
      LODWORD(v19) = v17 | 0xC0;
      DWORD1(v19) = v17 | 1;
    }
    else
    {
      BOOL v16 = 1;
      if ((v20 & 7) != 0) {
        BOOL v16 = DWORD2(v19) != (DWORD1(v20) & 0xFFFFFF00);
      }
      if (!v16) {
        return _pthread_rwlock_unlock_slow(v24, v22);
      }
    }
    int v15 = v23;
    int v60 = v21;
    long long v59 = &v20;
    int v58 = &v19;
    int v57 = v23;
    BOOL v56 = 0;
    int v55 = 0;
    switch(v23)
    {
      case 1:
        uint64_t v47 = 0;
        uint64_t v47 = *(void *)v59;
        BOOL v46 = 0;
        unint64_t v44 = 0;
        unint64_t v44 = *(void *)v58;
        unint64_t v43 = v44;
        unint64_t v45 = v44;
        uint64_t v9 = v47;
        uint64_t v10 = v47;
        atomic_compare_exchange_strong_explicit(v60, (unint64_t *)&v10, v44, memory_order_release, memory_order_relaxed);
        if (v10 != v9) {
          uint64_t v47 = v10;
        }
        BOOL v42 = v10 == v9;
        BOOL v46 = v10 == v9;
        *(void *)long long v59 = v47;
        BOOL v41 = v46;
        BOOL v56 = v46;
        if (v46) {
          int v55 = 1;
        }
        break;
      case 2:
        int v40 = 0;
        int v40 = *((_DWORD *)v59 + 2);
        BOOL v39 = 0;
        unsigned int v37 = 0;
        unsigned int v37 = *((_DWORD *)v58 + 2);
        unsigned int v36 = v37;
        unsigned int v38 = v37;
        int v11 = v40;
        int v12 = v40;
        atomic_compare_exchange_strong_explicit((atomic_ullong *)((char *)v60 + 8), (unsigned int *)&v12, v37, memory_order_release, memory_order_relaxed);
        if (v12 != v11) {
          int v40 = v12;
        }
        BOOL v35 = v12 == v11;
        BOOL v39 = v12 == v11;
        *((_DWORD *)v59 + 2) = v40;
        BOOL v34 = v39;
        BOOL v56 = v39;
        if (v39) {
          int v55 = 2;
        }
        break;
      case 3:
        long long v54 = 0u;
        long long v54 = *v59;
        int v53 = 0;
        long long v51 = 0u;
        long long v51 = *v58;
        long long v50 = v51;
        long long v52 = v51;
        _X1 = *((void *)&v54 + 1);
        _KR00_16 = v51;
        __asm { CASPL           X0, X1, X2, X3, [X8] }
        *(void *)&long long v8 = _X0;
        *((void *)&v8 + 1) = *((void *)&v54 + 1);
        BOOL v14 = _X0 == (unint64_t)v54;
        if (_X0 != (unint64_t)v54) {
          long long v54 = v8;
        }
        BOOL v49 = v14;
        int v53 = v14;
        *long long v59 = v54;
        int v48 = v53;
        BOOL v56 = v53 != 0;
        if (v53) {
          int v55 = 3;
        }
        break;
      default:
        __break(1u);
        JUMPOUT(0x1D794);
    }
    int v22 = v55;
  }
  while (v15 != v55);
  return 0;
}

uint64_t _pthread_rwlock_check_init_slow(uint64_t a1)
{
  unsigned int v9 = 22;
  BOOL v1 = *(void *)a1 == 766030772;
  if (*(void *)a1 == 766030772)
  {
    unsigned int v28 = (atomic_uint *)(a1 + 8);
    int v27 = 327680;
    char v2 = !v1;
    if ((v2 & 1) == 0) {
      goto LABEL_9;
    }
    unsigned int v26 = 0;
    uint64_t v29 = 3;
    uint64_t v30 = 3;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v26 = *(void *)(StatusReg + 24);
    int v25 = 0;
    unsigned int v24 = v26;
    unsigned int v23 = v26;
    int v3 = 0;
    atomic_compare_exchange_strong_explicit(v28, (unsigned int *)&v3, v26, memory_order_acquire, memory_order_acquire);
    if (v3) {
      int v25 = v3;
    }
    BOOL v22 = v3 == 0;
    if (v3) {
LABEL_9:
    }
      os_unfair_lock_lock_with_options();
    if (*(void *)a1 == 766030772)
    {
      uint64_t v17 = a1;
      uint64_t v16 = 0;
      uint64_t v21 = a1;
      long long v20 = &v15;
      int v15 = (void *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v19 = a1;
      char v18 = &v14;
      BOOL v14 = (_OWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
      if (v15 != (void *)(a1 + 24))
      {
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v17 + 12) & 0xDFFFFFFF | 0x20000000;
        *(void *)(v17 + 24) = -1;
      }
      if (v14 != (_OWORD *)(v17 + 32))
      {
        uint64_t v4 = v17;
        *(void *)(v17 + 32) = -1;
        *(void *)(v4 + 40) = -1;
      }
      uint64_t v5 = v17;
      *(void *)(v17 + 48) = -1;
      *(void *)(v5 + 56) = -1;
      *int v15 = 0;
      *(void *)&long long v13 = 0x1000000C0;
      DWORD2(v13) = 0;
      *BOOL v14 = v13;
      if (v16 && *(_DWORD *)(v16 + 8) == 1)
      {
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v17 + 12) & 0x3FFFFFFF | 0x40000000;
        *(_DWORD *)(v17 + 16) = 16;
      }
      else
      {
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v17 + 12) & 0x3FFFFFFF | 0x80000000;
        *(_DWORD *)(v17 + 16) = 32;
      }
      BYTE1(v12[2]) = 0;
      HIWORD(v12[2]) = 0;
      _platform_bzero();
      strcpy((char *)v12, "KLWRKLWR");
      *(void *)(v17 + 64) = ~v17;
      *(_DWORD *)(v17 + 196) = v12[0];
      *(_DWORD *)(v17 + 20) = v12[0];
      int v11 = (unsigned int *)v17;
      *(_DWORD *)(v17 + 4) = v12[2];
      atomic_store(v12[1], v11);
      unsigned int v9 = 0;
    }
    else if (*(void *)a1 == 1381452875)
    {
      unsigned int v9 = 0;
    }
    os_unfair_lock_t v37 = (os_unfair_lock_t)(a1 + 8);
    int v36 = 0;
    uint64_t v38 = 3;
    uint64_t v39 = 3;
    unint64_t v40 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v36 = *(void *)(v40 + 24);
    int v35 = 0;
    int v34 = v36;
    int v33 = 0;
    int v6 = v36;
    int v7 = v36;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v7, 0, memory_order_release, memory_order_relaxed);
    if (v7 != v6) {
      int v34 = v7;
    }
    BOOL v32 = v7 == v6;
    if (v7 != v6) {
      os_unfair_lock_unlock(v37);
    }
  }
  else if (*(void *)a1 == 1381452875)
  {
    return 0;
  }
  return v9;
}

uint64_t _pthread_rwlock_modbits(int a1, unsigned __int8 a2, int a3)
{
  int v4 = (a1 | a2) & 0xBF;
  if ((a2 & 1) == 0 && (a1 & 4) == 0) {
    int v4 = (a1 | a2) & 0xBE;
  }
  if (a3 && (a3 & 4) != 0 && (v4 & 4) == 0 && (v4 & 2) == 0) {
    v4 |= 5u;
  }
  return a1 & 0xFFFFFF00 | v4;
}

uint64_t pthread_chdir_np()
{
  return __pthread_chdir();
}

uint64_t pthread_fchdir_np()
{
  return __pthread_fchdir();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  int v4 = 35;
  os_unfair_lock_lock_with_options();
  for (pthread_key_t i = 256; i < 0x300; ++i)
  {
    if (_pthread_key_set_destructor(i, (uint64_t)a2))
    {
      *a1 = i;
      int v4 = 0;
      break;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v4;
}

uint64_t _pthread_key_set_destructor(uint64_t a1, uint64_t a2)
{
  int v4 = (uint64_t *)((char *)&_pthread_keys + 8 * a1);
  uint64_t v3 = 0;
  if (a2) {
    uint64_t v3 = a2;
  }
  if (*v4)
  {
    char v5 = 0;
  }
  else
  {
    *int v4 = ~v3;
    char v5 = 1;
  }
  return v5 & 1;
}

int pthread_key_delete(pthread_key_t a1)
{
  int v3 = 22;
  os_unfair_lock_lock_with_options();
  if (a1 >= 0x100 && a1 < 0x300 && (_pthread_key_unset_destructor(a1) & 1) != 0)
  {
    os_unfair_lock_lock_with_options();
    for (pthread_key_t i = __pthread_head; i; pthread_key_t i = (int *)*((void *)i + 2))
      *(void *)&i[2 * a1 + 56] = 0;
    os_unfair_lock_unlock(&_pthread_list_lock);
    int v3 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v3;
}

uint64_t _pthread_key_unset_destructor(uint64_t a1)
{
  if (_pthread_keys[a1])
  {
    _pthread_keys[a1] = 0;
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224, a1, (uint64_t)a2);
}

uint64_t _pthread_setspecific(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unsigned int v5 = 22;
  if (a2 >= 0xA && a2 < 0x300)
  {
    char v4 = _pthread_key_get_destructor(a2, 0) & 1;
    if (a2 < 0x100 || (v4 & 1) != 0)
    {
      *(void *)(a1 + 224 + 8 * a2) = a3;
      unsigned int v5 = 0;
      if (a2 < 0x100) {
        _pthread_key_set_destructor(a2, 0);
      }
      if (a2 > *(unsigned __int16 *)(a1 + 76)) {
        *(_WORD *)(a1 + 76) = a2;
      }
    }
  }
  return v5;
}

uint64_t _pthread_setspecific_static(unint64_t a1, uint64_t a2)
{
  unsigned int v3 = 22;
  if (a1 < 0x100)
  {
    *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1) = a2;
    return 0;
  }
  return v3;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1);
}

int pthread_introspection_setspecific_np(pthread_t thread, pthread_key_t key, const void *value)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 1)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_setspecific_np outside of a CREATE"
                           " introspection hook";
    __break(1u);
    JUMPOUT(0x1E418);
  }
  return _pthread_setspecific((uint64_t)thread, key, (uint64_t)value);
}

pthread_t _pthread_self()
{
  return pthread_self();
}

void *__cdecl pthread_introspection_getspecific_np(pthread_t thread, pthread_key_t key)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 4)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_getspecific_np outside of a DESTRO"
                           "Y introspection hook";
    __break(1u);
    JUMPOUT(0x1E4ACLL);
  }
  return *(void **)&thread->__opaque[8 * key + 208];
}

uint64_t _pthread_tsd_cleanup(uint64_t a1)
{
  return _pthread_tsd_cleanup_new(a1);
}

uint64_t _pthread_tsd_cleanup_new(uint64_t result)
{
  uint64_t v5 = result;
  for (int i = 0; i < 4; ++i)
  {
    for (unint64_t j = 256; j <= *(unsigned __int16 *)(v5 + 76); ++j)
      int result = _pthread_tsd_cleanup_key(v5, j);
    for (unint64_t k = 125; k <= 0xD1; ++k)
      int result = _pthread_tsd_cleanup_key(v5, k);
    for (unint64_t m = 10; m <= __pthread_tsd_max; ++m)
      int result = _pthread_tsd_cleanup_key(v5, m);
  }
  *(_WORD *)(v5 + 76) = 0;
  return result;
}

uint64_t pthread_key_init_np(int a1, uint64_t a2)
{
  unsigned int v3 = 22;
  if (a1 >= 10 && a1 < 256)
  {
    os_unfair_lock_lock_with_options();
    _pthread_key_set_destructor(a1, a2);
    if (a1 > __pthread_tsd_max) {
      __pthread_tsd_max = a1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
    return 0;
  }
  return v3;
}

pthread_t pthread_self(void)
{
  BOOL v1 = (_opaque_pthread_t *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((_opaque_pthread_t *)(v1->__sig ^ _pthread_ptr_munge_token) != v1) {
    abort_with_reason();
  }
  return v1;
}

uint64_t _pthread_key_get_destructor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = _pthread_keys[a1];
  if (v4)
  {
    if (a2)
    {
      uint64_t v3 = 0;
      if (v4 != -1) {
        uint64_t v3 = ~v4;
      }
      *a2 = v3;
    }
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t _pthread_tsd_cleanup_key(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  char v5 = 0;
  uint64_t result = _pthread_key_get_destructor(a2, (uint64_t *)&v5);
  if (result)
  {
    uint64_t v4 = (uint64_t *)(v7 + 224 + 8 * v6);
    uint64_t v3 = *v4;
    if (*v4)
    {
      *uint64_t v4 = 0;
      if (v5) {
        return v5(v3);
      }
    }
  }
  return result;
}

int pthread_join(pthread_t a1, void **a2)
{
  _pthread_testcancel_if_cancelable_variant_0();
  int v2 = _pthread_conformance_0();
  return _pthread_join((uint64_t)a1, (uint64_t *)a2, v2);
}

void _pthread_testcancel_if_cancelable_variant_0()
{
}

uint64_t _pthread_conformance_0()
{
  return 2;
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  int v2 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, 0, 0, v2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  int v3 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 0, v3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  int v3 = 0;
  _pthread_testcancel_if_cancelable_variant_0();
  if (__sigwait() == -1)
  {
    int v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant_0();
    if (v3 == 4) {
      return 0;
    }
  }
  return v3;
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  kern_return_t v8;
  uint64_t v9;
  vm_size_t v10;
  int v11;
  void (*v12)(void);
  void (*v13)(void);
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  BOOL v14 = a1;
  long long v13 = a2;
  int v12 = a3;
  int v11 = 0;
  uint64_t v10 = 0;
  unsigned int v9 = 0;
  int v25 = 16;
  unsigned int v24 = 320;
  unsigned int v23 = _pthread_globals_init;
  BOOL v22 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1)
  {
    unsigned int v26 = v22[1];
  }
  else
  {
    uint64_t v21 = _os_alloc_once();
    unsigned int v26 = v21;
  }
  unsigned int v9 = v26;
  uint64_t v17 = v26 + 12;
  os_unfair_lock_lock_with_options();
  vm_size_t v3 = *(void *)(v26 + 16);
  *(void *)(v26 + 16) = v3 + 1;
  uint64_t v10 = v3;
  if (v3)
  {
    if (v10 == 10)
    {
      long long v8 = 0;
      mach_vm_address_t v7 = 0;
      vm_size_t size = 24 * (vm_page_size / 0x18);
      long long v20 = v9 + 12;
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
      long long v8 = mach_vm_map(mach_task_self_, &v7, size, vm_page_size - 1, 1224736769, 0, 0, 0, 3, 7, 1u);
      uint64_t v16 = v9 + 12;
      os_unfair_lock_lock_with_options();
      if (v8)
      {
        int v11 = 12;
      }
      else if (*(void *)(v9 + 264) == v9 + 24)
      {
        *(void *)(v9 + 264) = v7;
        _platform_memmove();
        _platform_bzero();
      }
      else
      {
        uint64_t v19 = v9 + 12;
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
        mach_vm_deallocate(mach_task_self_, v7, size);
        int v15 = v9 + 12;
        os_unfair_lock_lock_with_options();
      }
    }
    else if (v10 >= vm_page_size / 0x18)
    {
      int v11 = 12;
    }
  }
  else
  {
    *(void *)(v9 + 264) = v9 + 24;
  }
  if (!v11)
  {
    char v5 = (void (**)(void))(*(void *)(v9 + 264) + 24 * v10);
    *char v5 = v14;
    v5[1] = v13;
    v5[2] = v12;
  }
  char v18 = v9 + 12;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
  return v11;
}

uint64_t _pthread_atfork_prepare_handlers()
{
  if (_os_alloc_once_table[32] == -1) {
    uint64_t v3 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v3 = _os_alloc_once();
  }
  uint64_t result = os_unfair_lock_lock_with_options();
  for (uint64_t i = *(void *)(v3 + 16); i; --i)
  {
    BOOL v1 = (uint64_t (**)(uint64_t))(*(void *)(v3 + 264) + 24 * (i - 1));
    if (*v1) {
      uint64_t result = (*v1)(result);
    }
  }
  return result;
}

uint64_t _pthread_atfork_prepare()
{
  if (_os_alloc_once_table[32] == -1) {
    BOOL v1 = (void *)_os_alloc_once_table[33];
  }
  else {
    BOOL v1 = (void *)_os_alloc_once();
  }
  os_unfair_lock_lock_with_options();
  void *v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return os_unfair_lock_lock_with_options();
}

void _pthread_atfork_parent()
{
  if (_os_alloc_once_table[32] == -1) {
    uint64_t v0 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v0 = _os_alloc_once();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)v0 + 72));
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 8));
}

void _pthread_atfork_parent_handlers()
{
  if (_os_alloc_once_table[32] == -1) {
    uint64_t v2 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  for (unint64_t i = 0; i < *(void *)(v2 + 16); ++i)
  {
    uint64_t v0 = *(void *)(v2 + 264) + 24 * i;
    if (*(void *)(v0 + 8)) {
      (*(void (**)(void))(v0 + 8))();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 12));
}

uint64_t _pthread_atfork_child()
{
  uint64_t v2 = 0;
  uint64_t v9 = 16;
  uint64_t v8 = 320;
  mach_vm_address_t v7 = _pthread_globals_init;
  uint64_t v6 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1)
  {
    uint64_t v10 = v6[1];
  }
  else
  {
    uint64_t v5 = _os_alloc_once();
    uint64_t v10 = v5;
  }
  uint64_t v2 = (uint64_t *)v10;
  uint64_t v4 = v10 + 8;
  int v3 = 0;
  *(_DWORD *)(v10 + 8) = 0;
  __is_threaded = 0;
  _pthread_main_thread_postfork_init(*v2);
  memset(__b, 0, sizeof(__b));
  return _pthread_bsdthread_init((uint64_t)__b);
}

void _pthread_atfork_child_handlers()
{
  if (_os_alloc_once_table[32] == -1) {
    uint64_t v2 = _os_alloc_once_table[33];
  }
  else {
    uint64_t v2 = _os_alloc_once();
  }
  for (unint64_t i = 0; i < *(void *)(v2 + 16); ++i)
  {
    uint64_t v0 = *(void *)(v2 + 264) + 24 * i;
    if (*(void *)(v0 + 16)) {
      (*(void (**)(void))(v0 + 16))();
    }
  }
  *(_DWORD *)(v2 + 12) = 0;
}

uint64_t _pthread_fork_prepare()
{
  return _pthread_atfork_prepare();
}

void _pthread_fork_parent()
{
}

uint64_t _pthread_fork_child()
{
  return _pthread_atfork_child();
}

void _pthread_fork_child_postinit()
{
}

float pthread_dependency_init_np(_OWORD *a1, _opaque_pthread_t *a2)
{
  float result = COERCE_FLOAT(pthread_mach_thread_np(a2));
  *a1 = LODWORD(result);
  return result;
}

uint64_t _pthread_dependency_fulfill_slow(uint64_t a1, unsigned int a2)
{
  if (a2 == -1)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fufilling pthread_dependency_t twice";
    __break(1u);
    JUMPOUT(0x1F684);
  }
  if (a2 != *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fulfilled a dependency not owned by current thread";
    qword_2C058 = a2;
    __break(1u);
    JUMPOUT(0x1F6FCLL);
  }
  uint64_t result = __ulock_wake();
  if ((-(int)result | 2) != 2)
  {
    qword_2C028 = (uint64_t)"BUG IN LIBPTHREAD: __ulock_wake() failed";
    qword_2C058 = -(int)result;
    __break(1u);
    JUMPOUT(0x1F790);
  }
  return result;
}

uint64_t pthread_dependency_fulfill_np(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  unsigned int v2 = atomic_exchange_explicit((atomic_uint *volatile)(result + 4), 0xFFFFFFFF, memory_order_release);
  if (v2) {
    return _pthread_dependency_fulfill_slow(result, v2);
  }
  return result;
}

uint64_t pthread_dependency_wait_np(unsigned int *a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 1), (unsigned int *)&v1, *a1, memory_order_relaxed, memory_order_relaxed);
  if (!v1)
  {
    do
    {
      int v6 = __ulock_wait();
      int v4 = -v6;
      if (v6 && v4 != 4 && v4 != 14)
      {
        if (v4 != 105)
        {
          qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: __ulock_wait() failed";
          qword_2C058 = -v6;
          __break(1u);
          JUMPOUT(0x1FA18);
        }
        uint64_t v2 = *a1;
        qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Waiting on orphaned dependency";
        qword_2C058 = v2;
        __break(1u);
        JUMPOUT(0x1F9CCLL);
      }
    }
    while (a1[1] == *a1);
  }
  unsigned int explicit = atomic_load_explicit((atomic_uint *volatile)(a1 + 1), memory_order_acquire);
  if (explicit != -1)
  {
    qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Corrupted pthread_dependency_t";
    qword_2C058 = explicit;
    __break(1u);
    JUMPOUT(0x1FAACLL);
  }
  return *((void *)a1 + 1);
}

unint64_t _pthread_atomic_xchg_ptr(atomic_ullong *a1, unint64_t a2)
{
  return atomic_exchange(a1, a2);
}

uint64_t _pthread_atomic_xchg_uint32_relaxed(unsigned int *a1, unsigned int a2)
{
  return __swp(a2, a1);
}

void start_wqthread(unint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
}

void thread_start(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _pthread_start(a1, a2, a3, a4, a5, a6);
  thread_chkstk_darwin(v9, v10, v11, v12, v13, v14, v15, v16, a9);
}

void thread_chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((unint64_t)&a9 >= *(void *)(StatusReg - 48)
    || (unint64_t v11 = *(void *)(StatusReg - 40), (unint64_t)&a9 <= v11)
    || (unint64_t)&a9 < v9
    || (unint64_t)&a9 - v9 < v11)
  {
    uint64_t v12 = &a9;
    if (v9 >= 0x1000)
    {
      do
      {
        v12 -= 512;
        v9 -= 4096;
      }
      while (v9 > 0x1000);
    }
  }
}

void __pthread_invalid_workloopfunction()
{
  qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqwl setup";
  __break(1u);
}

void __pthread_invalid_keventfunction()
{
  qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqworkq setup";
  __break(1u);
}

void _pthread_mutex_corruption_abort()
{
  qword_2C028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_mutex corruption: mutex owner changed in the middle of lock/unlock";
  __break(1u);
  __bsdthread_create();
}

uint64_t __bsdthread_create()
{
  return ___bsdthread_create();
}

uint64_t __bsdthread_ctl()
{
  return ___bsdthread_ctl();
}

uint64_t __bsdthread_register()
{
  return ___bsdthread_register();
}

uint64_t __bsdthread_terminate()
{
  return ___bsdthread_terminate();
}

uint64_t __disable_threadsignal()
{
  return ___disable_threadsignal();
}

uint64_t __gettimeofday()
{
  return ___gettimeofday();
}

uint64_t __kqueue_workloop_ctl()
{
  return ___kqueue_workloop_ctl();
}

uint64_t __proc_info()
{
  return ___proc_info();
}

uint64_t __psynch_cvbroad()
{
  return ___psynch_cvbroad();
}

uint64_t __psynch_cvclrprepost()
{
  return ___psynch_cvclrprepost();
}

uint64_t __psynch_cvsignal()
{
  return ___psynch_cvsignal();
}

uint64_t __psynch_cvwait()
{
  return ___psynch_cvwait();
}

uint64_t __psynch_mutexdrop()
{
  return ___psynch_mutexdrop();
}

uint64_t __psynch_mutexwait()
{
  return ___psynch_mutexwait();
}

uint64_t __psynch_rw_rdlock()
{
  return ___psynch_rw_rdlock();
}

uint64_t __psynch_rw_unlock()
{
  return ___psynch_rw_unlock();
}

uint64_t __psynch_rw_wrlock()
{
  return ___psynch_rw_wrlock();
}

uint64_t __pthread_canceled()
{
  return ___pthread_canceled();
}

uint64_t __pthread_chdir()
{
  return ___pthread_chdir();
}

uint64_t __pthread_fchdir()
{
  return ___pthread_fchdir();
}

uint64_t __pthread_kill()
{
  return ___pthread_kill();
}

uint64_t __pthread_markcancel()
{
  return ___pthread_markcancel();
}

uint64_t __pthread_sigmask()
{
  return ___pthread_sigmask();
}

uint64_t __semwait_signal_nocancel()
{
  return ___semwait_signal_nocancel();
}

uint64_t __sigwait()
{
  return ___sigwait();
}

uint64_t __sysctl()
{
  return ___sysctl();
}

uint64_t __thread_selfid()
{
  return ___thread_selfid();
}

uint64_t __ulock_wait()
{
  return ___ulock_wait();
}

uint64_t __ulock_wait2()
{
  return ___ulock_wait2();
}

uint64_t __ulock_wake()
{
  return ___ulock_wake();
}

uint64_t __workq_kernreturn()
{
  return ___workq_kernreturn();
}

uint64_t __workq_open()
{
  return ___workq_open();
}

uint64_t _os_alloc_once()
{
  return __os_alloc_once();
}

uint64_t _os_once()
{
  return __os_once();
}

uint64_t _os_semaphore_create()
{
  return __os_semaphore_create();
}

uint64_t _os_semaphore_dispose()
{
  return __os_semaphore_dispose();
}

uint64_t _platform_bzero()
{
  return __platform_bzero();
}

uint64_t _platform_memmove()
{
  return __platform_memmove();
}

uint64_t _platform_memset()
{
  return __platform_memset();
}

uint64_t _platform_strlcpy()
{
  return __platform_strlcpy();
}

uint64_t _platform_strlen()
{
  return __platform_strlen();
}

uint64_t _simple_getenv()
{
  return __simple_getenv();
}

uint64_t _thread_set_tsd_base()
{
  return __thread_set_tsd_base();
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

pid_t getpid(void)
{
  return _getpid();
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_info(host, flavor, host_info_out, host_info_outCnt);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return _mach_port_construct(task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return _mach_vm_allocate(target, address, size, flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _mach_vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return _mach_vm_protect(target_task, address, size, set_maximum, new_protection);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t os_unfair_lock_lock_no_tsd()
{
  return _os_unfair_lock_lock_no_tsd();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_unlock_no_tsd()
{
  return _os_unfair_lock_unlock_no_tsd();
}

uint64_t posix_spawnattr_get_qos_clamp_np()
{
  return _posix_spawnattr_get_qos_clamp_np();
}

uint64_t posix_spawnattr_set_qos_clamp_np()
{
  return _posix_spawnattr_set_qos_clamp_np();
}

BOOLean_t swtch_pri(int pri)
{
  return _swtch_pri(pri);
}

uint64_t thread_destruct_special_reply_port()
{
  return _thread_destruct_special_reply_port();
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy(thread_act_t thr_act, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, BOOLean_t set_limit)
{
  return _thread_policy(thr_act, policy, base, baseCnt, set_limit);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return _thread_switch(thread_name, option, option_time);
}