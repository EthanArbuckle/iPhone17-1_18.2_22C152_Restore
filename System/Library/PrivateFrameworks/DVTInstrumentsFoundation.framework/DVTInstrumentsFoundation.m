uint64_t _OARecordReferenceEvent()
{
  return sub_15A0();
}

uint64_t sub_15A0()
{
  uint64_t result = __chkstk_darwin();
  if (!__CFOASafe) {
    return result;
  }
  int v7 = v6;
  v8 = v5;
  unint64_t v9 = v4;
  size_t v10 = v3;
  unint64_t v11 = (unint64_t)v2;
  uint64_t v12 = v1;
  int v13 = result;
  uint64_t result = _OAIsReEntrantCall();
  if (result) {
    return result;
  }
  uint64_t result = (uint64_t)pthread_getspecific(qword_C0B8);
  if (result) {
    return result;
  }
  int v14 = 1 << v13;
  if ((dword_C004 & (1 << v13)) == 0) {
    return result;
  }
  if ((v14 & 0x10405008) != 0)
  {
    uint64_t result = (uint64_t)pthread_getspecific(qword_C0C0);
    if (result)
    {
      v15 = **(void ***)result;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ((v14 & 0x2000A000) != 0)
  {
    uint64_t result = (uint64_t)pthread_getspecific(qword_C0C0);
    if (result)
    {
      v15 = *(void **)(*(void *)result + 8);
      goto LABEL_13;
    }
LABEL_12:
    v15 = 0;
LABEL_13:
    if (v15 == (void *)v11) {
      return result;
    }
    goto LABEL_14;
  }
  if ((v14 & 0x10000) != 0)
  {
    uint64_t result = (uint64_t)pthread_getspecific(qword_C0C8);
    if (result == v11) {
      return result;
    }
  }
LABEL_14:
  int v16 = dword_C0D0;
  uint64_t result = getpid();
  if (v16 != result)
  {
    __CFOASafe = 0;
    return result;
  }
  int v17 = v13 & 0xFFFFFF;
  unsigned int v48 = 0;
  __chkstk_darwin();
  bzero(v41, 0x1030uLL);
  if (byte_C0D4 == 1 && (v17 - 23) >= 5 && v17 != 30)
  {
    if (v17 == 18) {
      v23 = (void *)v9;
    }
    else {
      v23 = 0;
    }
    sub_3014((void *)v11, v23, v13 & 0xFFFFFF);
  }
  uint64_t result = (uint64_t)pthread_self();
  uint64_t v45 = result;
  uint64_t v46 = 0;
  uint64_t v43 = v11 ^ 0x5555;
  uint64_t v44 = 0;
  v41[2] = v13;
  unsigned int v42 = 0;
  if ((v13 & 0xFFFFEF) == 0xB || v17 == 10)
  {
    if (!v8 || !*v8) {
      return result;
    }
    unsigned int v18 = strlen(v8);
    if (v18 >= 0xFF) {
      uint64_t v19 = 255;
    }
    else {
      uint64_t v19 = v18;
    }
    uint64_t v46 = v19;
    unsigned int v20 = v19 + 1;
    unsigned int v21 = v20 >> 3;
    unsigned int v42 = v20 >> 3;
    if ((v20 & 7) != 0)
    {
      v47[v21] = 0;
      unsigned int v42 = v21 + 1;
    }
    uint64_t result = __strlcpy_chk();
    goto LABEL_63;
  }
  if (v17 != 20)
  {
    thread_stack_pcs();
    uint64_t result = (uint64_t)pthread_getspecific(qword_C0D8);
    if (result) {
      v22 = *(void **)result;
    }
    else {
      v22 = 0;
    }
    if (v7 + 1 >= v48)
    {
      unsigned int v24 = 0;
    }
    else
    {
      unsigned int v24 = 0;
      int v25 = byte_C000;
      unint64_t v26 = qword_C008;
      int v27 = byte_C0E0;
      v28 = &v49[v7 + 1];
      unsigned int v29 = ~v7 + v48;
      do
      {
        unint64_t v31 = *v28++;
        unint64_t v30 = v31;
        if (v25) {
          BOOL v32 = v22 == 0;
        }
        else {
          BOOL v32 = 1;
        }
        if (!v32 && v30 >= v26) {
          int v34 = v27;
        }
        else {
          int v34 = 0;
        }
        if (v34 == 1 && v30 < (unint64_t)&qword_C008)
        {
          unint64_t v30 = *v22 + 1;
          v22 = (void *)v22[2];
        }
        if (v30 >= 0x1000)
        {
          v36 = &v41[2 * v24++];
          *((void *)v36 + 6) = v30;
        }
        --v29;
      }
      while (v29);
    }
    unsigned int v48 = v24;
    v47[v24] = v24;
    unsigned int v42 = v24;
LABEL_63:
    switch(v17)
    {
      case 3:
      case 19:
      case 22:
      case 25:
        goto LABEL_78;
      case 12:
      case 13:
        uint64_t v44 = v9;
        uint64_t v46 = v12;
        goto LABEL_78;
      case 14:
      case 15:
      case 28:
      case 29:
        if (v9 <= 0x100000 || v11 == v9) {
          goto LABEL_66;
        }
        return result;
      case 16:
        if (v12) {
          size_t v37 = (*(uint64_t (**)(uint64_t, unint64_t))(v12 + 16))(v12, v11);
        }
        else {
          size_t v37 = malloc_size((const void *)v11);
        }
        if (v37) {
          size_t v39 = v37;
        }
        else {
          size_t v39 = v10;
        }
        uint64_t v46 = v39;
        goto LABEL_78;
      case 18:
        if (v12) {
          size_t v38 = (*(uint64_t (**)(uint64_t, unint64_t))(v12 + 16))(v12, v11);
        }
        else {
          size_t v38 = malloc_size((const void *)v11);
        }
        if (v38) {
          size_t v40 = v38;
        }
        else {
          size_t v40 = v10;
        }
        uint64_t v46 = v40;
        goto LABEL_20;
      case 20:
        goto LABEL_20;
      case 23:
      case 26:
        uint64_t v46 = v10;
        goto LABEL_78;
      default:
LABEL_66:
        uint64_t v44 = v9;
        break;
    }
    goto LABEL_78;
  }
LABEL_20:
  uint64_t v44 = v9 ^ 0x5555;
LABEL_78:
  _OAGenerateDeltaEvent(v41);
  uint64_t result = sub_1D2C((char *)v41);
  if (v17 == 21 && result) {
    exit(1);
  }
  if (result && v17 == 16)
  {
    if (byte_C0D4) {
      return pthread_setspecific(qword_C0C8, (const void *)v11);
    }
  }
  return result;
}

uint64_t _OARecordAllocationEvent()
{
  return sub_15A0();
}

uint64_t _OASetLastAllocationEventName(uint64_t a1, unsigned char *a2)
{
  if (a2)
  {
    if (*a2) {
      return sub_15A0();
    }
  }
  return result;
}

uint64_t sub_1AE8()
{
  uint64_t result = sub_1D2C(0);
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)getprogname();
    if (result)
    {
      uint64_t result = strncmp((const char *)result, "sandbox-exec", 0xDuLL);
      if (result)
      {
        uint64_t v1 = getenv("OAFixupStacktraces");
        if (v1)
        {
          int v2 = *v1;
          BOOL v3 = 1;
          if (v2 != 49 && v2 != 89) {
            BOOL v3 = v2 == 121;
          }
          byte_C000 = v3;
        }
        unint64_t v4 = getenv("OAAllocationStatisticsOutputMask");
        if (v4)
        {
          int v5 = strtoul(v4, 0, 0);
          if ((v5 & 0xF17FFFFF) == 0)
          {
            BOOL v6 = 1;
            goto LABEL_18;
          }
        }
        else
        {
          int v5 = 1334644480;
        }
        int v7 = getenv("OAKeepAllocationStatistics");
        if (!v7)
        {
          unint64_t v9 = getenv("OAWaitForSetupByPid");
          if (!v9) {
            goto LABEL_39;
          }
          LOBYTE(v6) = 0;
          goto LABEL_23;
        }
        int v8 = *v7;
        BOOL v6 = 1;
        if (v8 != 49 && v8 != 89) {
          BOOL v6 = v8 == 121;
        }
        unsetenv("OAKeepAllocationStatistics");
LABEL_18:
        unint64_t v9 = getenv("OAWaitForSetupByPid");
        if (!v9)
        {
          if (!v6)
          {
LABEL_39:
            uint64_t result = _dyld_get_shared_cache_range();
            qword_C0A8 = result;
            qword_C0B0 = result;
            return result;
          }
LABEL_37:
          if (!sub_201C(__OASharedMemoryAddress, v5, 0))
          {
            v15 = __stderrp;
            int v16 = getprogname();
            pid_t v17 = getpid();
            fprintf(v15, "Allocations initialization failed for process \"%s\" (%d)\n", v16, v17);
          }
          goto LABEL_39;
        }
LABEL_23:
        pid_t v10 = strtoul(v9, 0, 10);
        unsigned int v11 = __OASharedMemoryAddress;
        if (!__OASharedMemoryAddress)
        {
          pid_t v12 = v10;
          do
          {
            if (v11 <= 0x40) {
              useconds_t v13 = 64;
            }
            else {
              useconds_t v13 = v11;
            }
            usleep(v13);
            unsigned int v11 = 2 * v13;
            if (2 * v13 <= 0x20000)
            {
              BOOL v14 = 1;
            }
            else
            {
              unsigned int v11 = 0x20000;
              BOOL v14 = v12 == 0;
            }
            if (!v14)
            {
              if (kill(v12, 0) == -1 && *__error() == 3)
              {
                unsetenv("OAWaitForSetupByPid");
                goto LABEL_39;
              }
              unsigned int v11 = 0x20000;
            }
          }
          while (!__OASharedMemoryAddress);
        }
        unsetenv("OAWaitForSetupByPid");
        if (!v6) {
          goto LABEL_39;
        }
        goto LABEL_37;
      }
    }
  }
  return result;
}

vm_address_t sub_1D2C(char *a1)
{
  os_unfair_lock_lock(&stru_C0E4);
  int v2 = &byte_C000;
  if (!a1 || !__CFOASafe) {
    goto LABEL_45;
  }
  *(double *)a1 = (double)mach_absolute_time();
  int v3 = (unsigned __int16)*((_DWORD *)a1 + 3);
  if (a1[10] < 0) {
    int v3 = HIWORD(*((_DWORD *)a1 + 3));
  }
  uint64_t v4 = qword_C0E8;
  if (!qword_C0E8) {
    goto LABEL_45;
  }
  uint64_t v5 = 0;
  unint64_t v6 = (8 * v3 + 56);
  int v7 = *(_DWORD *)(qword_C0E8 + 36);
  int v8 = (char *)(qword_C0E8 + *(unsigned int *)(qword_C0E8 + 32) + 80);
  unint64_t v24 = v6;
  unsigned int v9 = 64;
  while (!atomic_load_explicit((atomic_uint *volatile)(v4 + 48), memory_order_acquire))
  {
    signed int v10 = atomic_load((unsigned int *)(v4 + 64));
    signed int v11 = atomic_load((unsigned int *)(v4 + 60));
    if (v10 <= v11) {
      int v12 = v7;
    }
    else {
      int v12 = 0;
    }
    unsigned int v13 = v10 + ~v11 + v12;
    if (v13)
    {
      signed int v14 = v11;
      LODWORD(v15) = v7 - v11;
      if (v7 - v11 >= v13) {
        size_t v15 = v13;
      }
      else {
        size_t v15 = v15;
      }
      if (v6 >= v15) {
        size_t v16 = v15;
      }
      else {
        size_t v16 = v6;
      }
      memcpy(&v8[v11], a1, v16);
      a1 += v16;
      v6 -= v16;
      v5 += v16;
      if (v6) {
        BOOL v17 = v13 == v16;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        LODWORD(v16) = v14 + v16;
      }
      else
      {
        if (v6 >= v13 - v16) {
          size_t v16 = v13 - v16;
        }
        else {
          size_t v16 = v6;
        }
        memmove(v8, a1, v16);
        a1 += v16;
        v6 -= v16;
        v5 += v16;
      }
      signed int v20 = v14;
      atomic_compare_exchange_strong((atomic_uint *volatile)(v4 + 60), (unsigned int *)&v20, v16);
      if (v20 != v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Inconsistent writer offset in shared memory! MT transmission suspected...\n", buf, 2u);
        }
        break;
      }
      unsigned int v9 = 64;
    }
    else
    {
      pid_t v18 = atomic_load((unsigned int *)(v4 + 40));
      if (v9 <= 0x40) {
        useconds_t v19 = 64;
      }
      else {
        useconds_t v19 = v9;
      }
      usleep(v19);
      if (v19 <= 0x10000)
      {
        unsigned int v9 = 2 * v19;
      }
      else
      {
        if (v18 && kill(v18, 0) == -1 && *__error() == 3) {
          break;
        }
        unsigned int v9 = 0x20000;
      }
    }
    if (!v6) {
      break;
    }
  }
  int v2 = &byte_C000;
  if (v5 == v24)
  {
    vm_address_t v21 = 1;
  }
  else
  {
LABEL_45:
    __CFOASafe = 0;
    if ((uint64_t (*)(uint64_t, uint64_t, vm_size_t, vm_size_t, uint64_t, int))malloc_logger == sub_332C) {
      malloc_logger = off_C0F0;
    }
    if ((uint64_t (*)(uint64_t, uint64_t, vm_size_t, vm_size_t, uint64_t, int))__syscall_logger == sub_332C) {
      __syscall_logger = qword_C0F8;
    }
    vm_address_t v21 = *((void *)v2 + 29);
    if (v21)
    {
      atomic_store(1u, (unsigned int *)(v21 + 48));
      if (*(void *)(v21 + 16))
      {
        if (!atomic_load((unsigned int *)(v21 + 44))) {
          shm_unlink((const char *)(v21 + *(void *)(v21 + 16)));
        }
      }
      vm_deallocate(mach_task_self_, v21, *(void *)v21);
      vm_address_t v21 = 0;
      *((void *)v2 + 29) = 0;
    }
  }
  os_unfair_lock_unlock(&stru_C0E4);
  return v21;
}

BOOL sub_201C(uint64_t a1, int a2, char a3)
{
  if (a1)
  {
    *(double *)&__keyFrameEventHorizon = (double)mach_absolute_time();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    BOOL v17 = sub_35A4;
    pid_t v18 = &unk_8350;
    int v19 = a2;
    char v20 = a3;
    os_unfair_lock_lock(&stru_C0E4);
    vm_address_t v6 = qword_C0E8;
    if (qword_C0E8 != a1)
    {
      if (qword_C0E8)
      {
        atomic_store(1u, (unsigned int *)(qword_C0E8 + 48));
        if (*(void *)(v6 + 16))
        {
          if (!atomic_load((unsigned int *)(v6 + 44))) {
            shm_unlink((const char *)(v6 + *(void *)(v6 + 16)));
          }
        }
        vm_deallocate(mach_task_self_, v6, *(void *)v6);
      }
      unsigned int v8 = atomic_load((unsigned int *)(a1 + 44));
      if (v8 && v8 != getpid())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v8;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to attach to shared memory - process %d already attached.\n", buf, 8u);
        }
        uint64_t v10 = 0;
      }
      else
      {
        atomic_store(getpid(), (unsigned int *)(a1 + 44));
        uint64_t v9 = *(void *)(a1 + 16);
        uint64_t v10 = a1;
        if (v9)
        {
          shm_unlink((const char *)(a1 + v9));
          uint64_t v10 = a1;
        }
      }
      qword_C0E8 = v10;
      v17((uint64_t)v16);
    }
    os_unfair_lock_unlock(&stru_C0E4);
    sub_3C5C((uint64_t)&stru_8390);
    if (qword_C0C8) {
      byte_C0D4 = 1;
    }
    if (!getenv("MallocStackLogging"))
    {
      *(void *)buf = 0;
      unsigned int v21 = 0;
      if (sub_5AB0((uint64_t)&thread_suspend))
      {
        malloc_get_all_zones();
        unint64_t v11 = v21;
        if (v21)
        {
          unint64_t v12 = 0;
          do
          {
            uint64_t v13 = *(void *)(*(void *)buf + 8 * v12);
            signed int v14 = *(void (***)(void, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, void *), uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int)))(v13 + 96);
            if (v14 && *v14)
            {
              (*v14)(mach_task_self_, v13, 1, v13, sub_5970, sub_5988);
              unint64_t v11 = v21;
            }
            ++v12;
          }
          while (v12 < v11);
        }
        sub_5AB0((uint64_t)&_thread_resume);
      }
    }
  }
  else
  {
    fwrite("Error: unable to setup Allocations - no shared memory found\n", 0x3CuLL, 1uLL, __stderrp);
  }
  return a1 != 0;
}

uint64_t _OAAttachAndInitialize(int a1, const char **a2)
{
  if (a1 > 1)
  {
    unint64_t v4 = strtoull(*a2, 0, 16);
    os_unfair_lock_lock(&stru_C0E4);
    uint64_t v5 = qword_C0E8;
    os_unfair_lock_unlock(&stru_C0E4);
    if (v5 == v4)
    {
      return 0;
    }
    else if (sub_1D2C(0))
    {
      vm_address_t v6 = __stderrp;
      int v7 = getprogname();
      pid_t v8 = getpid();
      fprintf(v6, "Allocations attaching failed for process \"%s\" (%d) - already tracking allocations.\n", v7, v8);
      return 3;
    }
    else
    {
      int v9 = strtoul(a2[1], 0, 0);
      return !sub_201C(v4, v9, 1);
    }
  }
  else
  {
    fwrite("too few arguments to _OAAttachAndInitialize! abandoning...\n", 0x3BuLL, 1uLL, __stderrp);
    return 2;
  }
}

void sub_2478(id *location, id obj)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  uint64_t v10 = sub_5D74;
  unint64_t v11 = &unk_8538;
  unint64_t v12 = location;
  id v13 = obj;
  if (*location == obj)
  {
    objc_storeStrong(location, obj);
  }
  else
  {
    unsigned int v21 = 0;
    unint64_t v4 = (id **)pthread_getspecific(qword_C0C0);
    id v18 = 0;
    id v19 = 0;
    char v20 = 0;
    BOOL v17 = 0;
    uint64_t v5 = (uint64_t **)pthread_getspecific(qword_C0D8);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    size_t v16 = 0;
    if (v5)
    {
      vm_address_t v6 = v5;
      int v7 = *v5;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      size_t v16 = v7;
      const char *v5 = &v14;
    }
    else
    {
      vm_address_t v6 = &v17;
      pthread_setspecific(qword_C0D8, &v17);
      size_t v16 = 0;
      BOOL v17 = &v14;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    id v8 = *location;
    if (*location) {
      sub_432C((CFIndex)*location, 13);
    }
    if (v4)
    {
      char v20 = *v4;
      *unint64_t v4 = &v18;
    }
    else
    {
      unint64_t v4 = &v21;
      pthread_setspecific(qword_C0C0, &v21);
      unsigned int v21 = &v18;
      char v20 = 0;
    }
    id v18 = obj;
    id v19 = v8;
    v10((uint64_t)v9);
    if (v20) {
      *unint64_t v4 = v20;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if (*location == obj) {
      sub_432C((CFIndex)obj, 12);
    }
    if (v16) {
      *vm_address_t v6 = v16;
    }
    else {
      pthread_setspecific(qword_C0D8, 0);
    }
  }
}

void sub_2640(char *a1, const char *a2, ptrdiff_t a3, id newValue, BOOL a5, int a6)
{
  if (a6)
  {
    objc_setProperty(a1, a2, a3, newValue, a5, a6);
  }
  else
  {
    int v7 = (CFIndex *)&a1[a3];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 0x40000000;
    uint64_t v14 = sub_5D80;
    uint64_t v15 = &unk_8558;
    size_t v16 = a1;
    BOOL v17 = a2;
    ptrdiff_t v18 = a3;
    id v19 = newValue;
    BOOL v20 = a5;
    char v21 = 0;
    if (*(id *)&a1[a3] == newValue)
    {
      objc_setProperty(a1, a2, a3, newValue, a5, 0);
    }
    else
    {
      unsigned int v29 = 0;
      id v8 = (id **)pthread_getspecific(qword_C0C0);
      id v26 = 0;
      CFIndex v27 = 0;
      v28 = 0;
      int v25 = 0;
      int v9 = (uint64_t **)pthread_getspecific(qword_C0D8);
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      if (v9)
      {
        uint64_t v10 = v9;
        unint64_t v11 = *v9;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        unint64_t v24 = v11;
        *int v9 = &v22;
      }
      else
      {
        uint64_t v10 = &v25;
        pthread_setspecific(qword_C0D8, &v25);
        unint64_t v24 = 0;
        int v25 = &v22;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
      CFIndex v12 = *v7;
      if (*v7) {
        sub_432C(*v7, 13);
      }
      if (v8)
      {
        v28 = *v8;
        char *v8 = &v26;
      }
      else
      {
        id v8 = &v29;
        pthread_setspecific(qword_C0C0, &v29);
        v28 = 0;
        unsigned int v29 = &v26;
      }
      id v26 = newValue;
      CFIndex v27 = v12;
      v14((uint64_t)v13);
      if (v28) {
        char *v8 = v28;
      }
      else {
        pthread_setspecific(qword_C0C0, 0);
      }
      if ((id)*v7 == newValue) {
        sub_432C((CFIndex)newValue, 12);
      }
      if (v24) {
        *uint64_t v10 = v24;
      }
      else {
        pthread_setspecific(qword_C0D8, 0);
      }
    }
  }
}

void sub_2844(char *a1, const char *a2, id newValue, ptrdiff_t a4)
{
  uint64_t v5 = (CFIndex *)&a1[a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  CFIndex v12 = sub_5D98;
  id v13 = &unk_8578;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  id v16 = newValue;
  ptrdiff_t v17 = a4;
  if (*(id *)&a1[a4] == newValue)
  {
    objc_setProperty_atomic(a1, a2, newValue, a4);
  }
  else
  {
    int v25 = 0;
    vm_address_t v6 = (id **)pthread_getspecific(qword_C0C0);
    id v22 = 0;
    CFIndex v23 = 0;
    unint64_t v24 = 0;
    char v21 = 0;
    int v7 = (uint64_t **)pthread_getspecific(qword_C0D8);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    BOOL v20 = 0;
    if (v7)
    {
      id v8 = v7;
      int v9 = *v7;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      BOOL v20 = v9;
      *int v7 = &v18;
    }
    else
    {
      id v8 = &v21;
      pthread_setspecific(qword_C0D8, &v21);
      BOOL v20 = 0;
      char v21 = &v18;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    CFIndex v10 = *v5;
    if (*v5) {
      sub_432C(*v5, 13);
    }
    if (v6)
    {
      unint64_t v24 = *v6;
      *vm_address_t v6 = &v22;
    }
    else
    {
      vm_address_t v6 = &v25;
      pthread_setspecific(qword_C0C0, &v25);
      int v25 = &v22;
      unint64_t v24 = 0;
    }
    id v22 = newValue;
    CFIndex v23 = v10;
    v12((uint64_t)v11);
    if (v24) {
      *vm_address_t v6 = v24;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if ((id)*v5 == newValue) {
      sub_432C((CFIndex)newValue, 12);
    }
    if (v20) {
      char *v8 = v20;
    }
    else {
      pthread_setspecific(qword_C0D8, 0);
    }
  }
}

void sub_2A0C(char *a1, const char *a2, id newValue, ptrdiff_t a4)
{
  uint64_t v5 = (CFIndex *)&a1[a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  CFIndex v12 = sub_5DA8;
  id v13 = &unk_8598;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  id v16 = newValue;
  ptrdiff_t v17 = a4;
  if (*(id *)&a1[a4] == newValue)
  {
    objc_setProperty_nonatomic(a1, a2, newValue, a4);
  }
  else
  {
    int v25 = 0;
    vm_address_t v6 = (id **)pthread_getspecific(qword_C0C0);
    id v22 = 0;
    CFIndex v23 = 0;
    unint64_t v24 = 0;
    char v21 = 0;
    int v7 = (uint64_t **)pthread_getspecific(qword_C0D8);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    BOOL v20 = 0;
    if (v7)
    {
      id v8 = v7;
      int v9 = *v7;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      BOOL v20 = v9;
      *int v7 = &v18;
    }
    else
    {
      id v8 = &v21;
      pthread_setspecific(qword_C0D8, &v21);
      BOOL v20 = 0;
      char v21 = &v18;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    CFIndex v10 = *v5;
    if (*v5) {
      sub_432C(*v5, 13);
    }
    if (v6)
    {
      unint64_t v24 = *v6;
      *vm_address_t v6 = &v22;
    }
    else
    {
      vm_address_t v6 = &v25;
      pthread_setspecific(qword_C0C0, &v25);
      int v25 = &v22;
      unint64_t v24 = 0;
    }
    id v22 = newValue;
    CFIndex v23 = v10;
    v12((uint64_t)v11);
    if (v24) {
      *vm_address_t v6 = v24;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if ((id)*v5 == newValue) {
      sub_432C((CFIndex)newValue, 12);
    }
    if (v20) {
      char *v8 = v20;
    }
    else {
      pthread_setspecific(qword_C0D8, 0);
    }
  }
}

void sub_2BD4(char *a1, const char *a2, id newValue, ptrdiff_t a4)
{
  uint64_t v5 = (CFIndex *)&a1[a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  CFIndex v12 = sub_5DB8;
  id v13 = &unk_85B8;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  id v16 = newValue;
  ptrdiff_t v17 = a4;
  if (*(id *)&a1[a4] == newValue)
  {
    objc_setProperty_atomic_copy(a1, a2, newValue, a4);
  }
  else
  {
    int v25 = 0;
    vm_address_t v6 = (id **)pthread_getspecific(qword_C0C0);
    id v22 = 0;
    CFIndex v23 = 0;
    unint64_t v24 = 0;
    char v21 = 0;
    int v7 = (uint64_t **)pthread_getspecific(qword_C0D8);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    BOOL v20 = 0;
    if (v7)
    {
      id v8 = v7;
      int v9 = *v7;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      BOOL v20 = v9;
      *int v7 = &v18;
    }
    else
    {
      id v8 = &v21;
      pthread_setspecific(qword_C0D8, &v21);
      BOOL v20 = 0;
      char v21 = &v18;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    CFIndex v10 = *v5;
    if (*v5) {
      sub_432C(*v5, 13);
    }
    if (v6)
    {
      unint64_t v24 = *v6;
      *vm_address_t v6 = &v22;
    }
    else
    {
      vm_address_t v6 = &v25;
      pthread_setspecific(qword_C0C0, &v25);
      int v25 = &v22;
      unint64_t v24 = 0;
    }
    id v22 = newValue;
    CFIndex v23 = v10;
    v12((uint64_t)v11);
    if (v24) {
      *vm_address_t v6 = v24;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if ((id)*v5 == newValue) {
      sub_432C((CFIndex)newValue, 12);
    }
    if (v20) {
      char *v8 = v20;
    }
    else {
      pthread_setspecific(qword_C0D8, 0);
    }
  }
}

void sub_2D9C(char *a1, const char *a2, id newValue, ptrdiff_t a4)
{
  uint64_t v5 = (CFIndex *)&a1[a4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  CFIndex v12 = sub_5DC8;
  id v13 = &unk_85D8;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  id v16 = newValue;
  ptrdiff_t v17 = a4;
  if (*(id *)&a1[a4] == newValue)
  {
    objc_setProperty_nonatomic_copy(a1, a2, newValue, a4);
  }
  else
  {
    int v25 = 0;
    vm_address_t v6 = (id **)pthread_getspecific(qword_C0C0);
    id v22 = 0;
    CFIndex v23 = 0;
    unint64_t v24 = 0;
    char v21 = 0;
    int v7 = (uint64_t **)pthread_getspecific(qword_C0D8);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    BOOL v20 = 0;
    if (v7)
    {
      id v8 = v7;
      int v9 = *v7;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      BOOL v20 = v9;
      *int v7 = &v18;
    }
    else
    {
      id v8 = &v21;
      pthread_setspecific(qword_C0D8, &v21);
      BOOL v20 = 0;
      char v21 = &v18;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
    }
    CFIndex v10 = *v5;
    if (*v5) {
      sub_432C(*v5, 13);
    }
    if (v6)
    {
      unint64_t v24 = *v6;
      *vm_address_t v6 = &v22;
    }
    else
    {
      vm_address_t v6 = &v25;
      pthread_setspecific(qword_C0C0, &v25);
      int v25 = &v22;
      unint64_t v24 = 0;
    }
    id v22 = newValue;
    CFIndex v23 = v10;
    v12((uint64_t)v11);
    if (v24) {
      *vm_address_t v6 = v24;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if ((id)*v5 == newValue) {
      sub_432C((CFIndex)newValue, 12);
    }
    if (v20) {
      char *v8 = v20;
    }
    else {
      pthread_setspecific(qword_C0D8, 0);
    }
  }
}

void sub_2F64(void *a1)
{
  int v7 = 0;
  int v2 = (void (__cdecl ****)(void *))pthread_getspecific(qword_C0D8);
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  vm_address_t v6 = 0;
  if (v2)
  {
    int v3 = v2;
    vm_address_t v6 = *v2;
    char *v2 = &v4;
  }
  else
  {
    int v3 = &v7;
    pthread_setspecific(qword_C0D8, &v7);
    vm_address_t v6 = 0;
    int v7 = &v4;
  }
  if (v6) {
    *int v3 = v6;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
}

unint64_t sub_3014(void *a1, void *a2, int a3)
{
  unint64_t result = (unint64_t)pthread_getspecific(qword_C0C8);
  if (result)
  {
    int v7 = (void *)result;
    unint64_t result = pthread_setspecific(qword_C0C8, 0);
    if (v7 != a2 || a2 == 0) {
      a1 = v7;
    }
    if (a3 != 11)
    {
      if (a1)
      {
        unint64_t result = malloc_size(a1);
        if (result)
        {
          unint64_t result = (unint64_t)sub_3148((uint64_t)a1, result);
          if (result)
          {
            unint64_t v9 = result;
            uint64_t v10 = 11;
            unint64_t v11 = a1;
            CFIndex v12 = 0;
LABEL_13:
            return sub_15A0(v10, 0, v11, 0, v12, v9, 0);
          }
          id v13 = (const void *)*a1;
          if ((unint64_t)(*a1 - 0x100000000) >> 30 <= 0x3A && (*a1 & 7) == 0)
          {
            BOOL v15 = qword_C0A8 > (unint64_t)v13 || (unint64_t)v13 >= qword_C0B0;
            if (!v15 || (unint64_t result = malloc_size((const void *)*a1)) == 0)
            {
              uint64_t v10 = 20;
              unint64_t v11 = a1;
              CFIndex v12 = v13;
              unint64_t v9 = 0;
              goto LABEL_13;
            }
          }
        }
      }
    }
  }
  return result;
}

const char *sub_3148(uint64_t a1, unint64_t a2)
{
  int v2 = *(_DWORD *)a1;
  if (a2 >= 0x100 && v2 == -1583242847)
  {
    int v3 = strncmp((const char *)(a1 + 4), "AUTORELEASE!", 0xCuLL);
    unint64_t v4 = "@autoreleasepool content";
    BOOL v5 = v3 == 0;
LABEL_4:
    if (v5) {
      return v4;
    }
    else {
      return 0;
    }
  }
  if (v2 <= 1330529092)
  {
    if (v2 > 1297373248)
    {
      if (v2 == 1297373249)
      {
        unint64_t v4 = "pthread_mutexattr_t";
        BOOL v5 = a2 == 16;
      }
      else
      {
        if (v2 != 1297437784 && v2 != 1297437786) {
          return 0;
        }
        unint64_t v4 = "pthread_mutex_t";
        BOOL v5 = a2 == 64;
      }
      goto LABEL_4;
    }
    uint64_t v18 = "pthread_condattr_t";
    if (a2 != 16) {
      uint64_t v18 = 0;
    }
    uint64_t v19 = "pthread_cond_t";
    if (a2 != 48) {
      uint64_t v19 = 0;
    }
    if (v2 == 1129270852) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = 0;
    }
    if (v2 == 1129202753) {
      return v18;
    }
    else {
      return v20;
    }
  }
  else
  {
    int v7 = "pthread_attr_t";
    if (a2 != 64) {
      int v7 = 0;
    }
    id v8 = "pthread_thread_t";
    if (a2 != 16) {
      id v8 = 0;
    }
    unint64_t v9 = "pthread_override_s";
    if (a2 != 48) {
      unint64_t v9 = 0;
    }
    if (v2 == 1870030194) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v2 == 1414025796) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v2 != 1414022209) {
      int v7 = v11;
    }
    CFIndex v12 = "pthread_once_t";
    if (a2 != 16) {
      CFIndex v12 = 0;
    }
    id v13 = "pthread_rwlockattr_t";
    if (a2 != 32) {
      id v13 = 0;
    }
    uint64_t v14 = "pthread_rwlock_t";
    if (a2 != 208) {
      uint64_t v14 = 0;
    }
    if (v2 == 1381452875) {
      BOOL v15 = v14;
    }
    else {
      BOOL v15 = 0;
    }
    if (v2 == 1381452865) {
      id v16 = v13;
    }
    else {
      id v16 = v15;
    }
    if (v2 == 1330529093) {
      ptrdiff_t v17 = v12;
    }
    else {
      ptrdiff_t v17 = v16;
    }
    if (v2 <= 1414022208) {
      return v17;
    }
    else {
      return v7;
    }
  }
}

uint64_t sub_332C(uint64_t result, uint64_t a2, vm_size_t a3, vm_size_t a4, uint64_t a5, int a6)
{
  int v10 = result;
  if (off_C0F0) {
    unint64_t result = off_C0F0(result, a2, a3, a4, a5, (a6 + 1));
  }
  if ((~v10 & 6) == 0)
  {
    if (!a5) {
      return result;
    }
    uint64_t v11 = 18;
    uint64_t v12 = a2;
    uint64_t v13 = a5;
    vm_size_t v14 = a4;
    vm_size_t v15 = a3;
    goto LABEL_18;
  }
  if ((v10 & 2) != 0)
  {
    if (!a5) {
      return result;
    }
    uint64_t v11 = 16;
    uint64_t v12 = a2;
    uint64_t v13 = a5;
    vm_size_t v14 = a3;
LABEL_17:
    vm_size_t v15 = 0;
LABEL_18:
    return sub_15A0(v11, v12, v13, v14, v15, 0, 2);
  }
  if ((v10 & 4) != 0)
  {
    if (!a3) {
      return result;
    }
    uint64_t v11 = 19;
    uint64_t v12 = a2;
    uint64_t v13 = a3;
    vm_size_t v14 = 0;
    goto LABEL_17;
  }
  if ((v10 & 0x10) == 0)
  {
    if ((v10 & 0x20) == 0 || !a3 || mach_task_self_ != a2) {
      return result;
    }
    vm_size_t v14 = ~vm_page_mask & (vm_page_mask + a4);
    uint64_t v11 = 26;
    uint64_t v12 = 0;
    uint64_t v13 = a3;
    goto LABEL_17;
  }
  if (a5)
  {
    if (mach_task_self_ == a2)
    {
      unint64_t result = sub_15A0(v10 & 0xFF000000 | 0x17, 0, a5, ~vm_page_mask & (vm_page_mask + a3), 0, 0, 2);
      if ((v10 & 0x80) != 0)
      {
        pid_t v16 = getpid();
        unint64_t result = proc_regionfilename(v16, a5, buffer, 0x400u);
        if ((int)result >= 1)
        {
          buffer[result] = 0;
          return sub_15A0(27, 0, a5, 0, 0, buffer, 0);
        }
      }
    }
  }
  return result;
}

void sub_35A4(uint64_t a1)
{
  __OASharedMemoryAddress = 0;
  dword_C004 = *(_DWORD *)(a1 + 32);
  dword_C0D0 = getpid();
  setvbuf(__stdoutp, 0, 1, 0);
  setvbuf(__stderrp, 0, 1, 0);
  if (qword_C100 != -1) {
    dispatch_once(&qword_C100, &stru_82F0);
  }
  int v2 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v3 = __syscall_logger;
  if (!*(unsigned char *)(a1 + 36)) {
    uint64_t v3 = 0;
  }
  qword_C0F8 = v3;
  __syscall_logger = sub_332C;
  if ((*(_DWORD *)(a1 + 32) & 0xF17FFFFF) != 0)
  {
    if (v2) {
      unint64_t v4 = (uint64_t (*)(void, void, void, void, void, void))malloc_logger;
    }
    else {
      unint64_t v4 = 0;
    }
    off_C0F0 = v4;
    malloc_logger = sub_332C;
    if (&__CFObjectAllocRecordAllocationFunction) {
      __CFObjectAllocRecordAllocationFunction = _OARecordAllocationEvent;
    }
    if (&__CFObjectAllocSetLastAllocEventNameFunction) {
      __CFObjectAllocSetLastAllocEventNameFunction = _OASetLastAllocationEventName;
    }
  }
  __CFOASafe = 1;
}

void sub_36F8(id a1)
{
  pthread_key_create((pthread_key_t *)&qword_C0C8, 0);
  pthread_key_create((pthread_key_t *)&qword_C0C0, 0);
  pthread_key_create((pthread_key_t *)&qword_C0D8, 0);
  pthread_key_create((pthread_key_t *)&qword_C0B8, 0);
  pthread_key_create((pthread_key_t *)&__keyframe_key, (void (__cdecl *)(void *))_OAFreeKeyFrame);
  memset(&v15, 0, sizeof(v15));
  if (dladdr(sub_201C, &v15))
  {
    qword_C008 = (uint64_t)v15.dli_fbase;
    byte_C0E0 = 1;
  }
  imp_implementationWithBlock(&stru_8330);
  sub_3C5C((uint64_t)&stru_83D0);
  qword_C130 = (uint64_t)sub_49B0;
  uint64_t v1 = dlopen("libswiftCore.dylib", 1);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = (void (*)(void))dlsym(v1, "_swift_zone_init");
    if (v3) {
      v3();
    }
    off_C1E8 = (uint64_t (*)(void))dlsym(v2, "_swift_indexToSize");
    off_C1F0 = (uint64_t (*)(void))dlsym(v2, "swift_retainCount");
    unint64_t v4 = (void **)dlsym(v2, "_swift_allocObject");
    if (v4)
    {
      off_C1F8 = *v4;
      *unint64_t v4 = sub_49B8;
    }
    BOOL v5 = (void **)dlsym(v2, "_swift_alloc");
    if (v5)
    {
      off_C200 = *v5;
      CFIndex *v5 = sub_4B00;
    }
    vm_address_t v6 = (void **)dlsym(v2, "_swift_tryAlloc");
    if (v6)
    {
      off_C208 = *v6;
      *vm_address_t v6 = sub_4BEC;
    }
    int v7 = (void **)dlsym(v2, "_swift_slowAlloc");
    if (v7)
    {
      off_C210 = *v7;
      *int v7 = sub_4CD8;
    }
    id v8 = dlsym(v2, "_swift_dealloc");
    if (v8)
    {
      off_C218 = *(uint64_t (**)(void, void))v8;
      *(void *)id v8 = sub_4DC0;
    }
    unint64_t v9 = dlsym(v2, "_swift_slowDealloc");
    if (v9)
    {
      off_C220 = *(uint64_t (**)(void, void, void))v9;
      *(void *)unint64_t v9 = sub_4EAC;
    }
    if ((dword_C004 & 0x3040F008) != 0)
    {
      int v10 = (uint64_t (**)(void))dlsym(v2, "_swift_retain");
      if (v10)
      {
        off_C228 = *v10;
        *int v10 = sub_4FA0;
      }
      uint64_t v11 = (uint64_t (**)(void))dlsym(v2, "_swift_tryRetain");
      if (v11)
      {
        off_C230 = *v11;
        *uint64_t v11 = sub_513C;
      }
      uint64_t v12 = (uint64_t (**)(void))dlsym(v2, "_swift_release");
      if (v12)
      {
        off_C238 = *v12;
        *uint64_t v12 = sub_52D8;
      }
      uint64_t v13 = dlsym(v2, "_swift_retain_n");
      if (v13)
      {
        off_C240 = *(uint64_t (**)(void, void))v13;
        *(void *)uint64_t v13 = sub_5470;
      }
      vm_size_t v14 = dlsym(v2, "_swift_release_n");
      if (v14)
      {
        off_C248 = *(uint64_t (**)(void, void))v14;
        *(void *)vm_size_t v14 = sub_5644;
      }
    }
    dlclose(v2);
  }
}

id sub_3C54(id a1, id a2, void *a3)
{
  return 0;
}

void sub_3C5C(uint64_t a1)
{
  if (qword_C250 != -1) {
    dispatch_once(&qword_C250, &stru_84F0);
  }
  if ((byte_C258 & 1) == 0)
  {
    unsigned int outCount = 0;
    int v2 = objc_copyClassList(&outCount);
    uint64_t v3 = v2;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; (*(void (**)(uint64_t, Class))(a1 + 16))(a1, v3[i++]))
        ;
    }
    else if (!v2)
    {
      return;
    }
    free(v3);
  }
}

void sub_3D10(id a1, Class a2)
{
  Name = (char *)class_getName(a2);
  if (!strncmp(Name, "OS_", 3uLL)
    || !strncmp(Name, "__NS", 4uLL) && strstr(Name, "Block")
    || sub_3DC0(Name))
  {
    sub_15A0();
  }
}

char *sub_3DC0(char *a1)
{
  if (!strncmp(a1, "__T", 3uLL)) {
    return (unsigned char *)(&dword_0 + 1);
  }
  if (!strncmp(a1, "_T", 2uLL)) {
    return (unsigned char *)(&dword_0 + 1);
  }
  if (!strncmp(a1, "_$S", 3uLL)) {
    return (unsigned char *)(&dword_0 + 1);
  }
  unint64_t result = strchr(a1, 46);
  if (result) {
    return (unsigned char *)(&dword_0 + 1);
  }
  return result;
}

void sub_3E38(id a1, Class a2)
{
  sub_3E78(a2);
  Class = object_getClass(a2);
  sub_3E78(Class);
}

void sub_3E78(Class cls)
{
  if (qword_C108 != -1) {
    dispatch_once(&qword_C108, &stru_8410);
  }
  outCount[0] = 0;
  int v2 = class_copyMethodList(cls, outCount);
  BOOL isMetaClass = class_isMetaClass(cls);
  if (outCount[0])
  {
    BOOL v4 = isMetaClass;
    uint64_t v5 = 0;
    while (1)
    {
      Name = method_getName(v2[v5]);
      int v7 = sel_getName(Name);
      id v8 = v7;
      if (v4)
      {
        if (!strcmp(v7, "allocWithZone:"))
        {
          IMP Implementation = method_getImplementation(v2[v5]);
          int v10 = v25;
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 0x40000000;
          v25[2] = sub_4214;
          v25[3] = &unk_8430;
          v25[4] = Implementation;
          uint64_t v11 = (const char **)&v26;
LABEL_17:
          *uint64_t v11 = Name;
          pid_t v16 = imp_implementationWithBlock(v10);
          method_setImplementation(v2[v5], v16);
        }
      }
      else if ((dword_C004 & 0x3040F008) != 0)
      {
        if (!strcmp(v7, "retain"))
        {
          IMP v13 = method_getImplementation(v2[v5]);
          int v10 = v23;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 0x40000000;
          v23[2] = sub_43C8;
          v23[3] = &unk_8450;
          v23[4] = v13;
          v23[5] = v13;
          uint64_t v11 = (const char **)&v24;
          goto LABEL_17;
        }
        if (!strcmp(v8, "release"))
        {
          IMP v14 = method_getImplementation(v2[v5]);
          int v10 = v21;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 0x40000000;
          v21[2] = sub_4530;
          v21[3] = &unk_8470;
          v21[4] = v14;
          v21[5] = v14;
          uint64_t v11 = (const char **)&v22;
          goto LABEL_17;
        }
        if (!strcmp(v8, "autorelease"))
        {
          IMP v15 = method_getImplementation(v2[v5]);
          int v10 = block;
          block[0] = _NSConcreteStackBlock;
          block[1] = 0x40000000;
          block[2] = sub_46A0;
          block[3] = &unk_8490;
          block[4] = v15;
          block[5] = v15;
          uint64_t v11 = (const char **)&v20;
          goto LABEL_17;
        }
        if (!strcmp(v8, "_tryRetain"))
        {
          IMP v12 = method_getImplementation(v2[v5]);
          int v10 = v17;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 0x40000000;
          v17[2] = sub_4824;
          v17[3] = &unk_84B0;
          v17[4] = v12;
          v17[5] = v12;
          uint64_t v11 = (const char **)&v18;
          goto LABEL_17;
        }
      }
      if (++v5 >= (unint64_t)outCount[0]) {
        goto LABEL_21;
      }
    }
  }
  if (v2) {
LABEL_21:
  }
    free(v2);
}

void sub_41D8(id a1)
{
  qword_C110 = (uint64_t)objc_getClass("__NSPlaceholderArray");
  qword_C118 = (uint64_t)objc_getClass("__NSPlaceholderDictionary");
}

void *sub_4214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ptrdiff_t v17 = 0;
  vm_address_t v6 = (uint64_t **)pthread_getspecific(qword_C0D8);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  pid_t v16 = 0;
  if (v6)
  {
    int v7 = v6;
    id v8 = *v6;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    pid_t v16 = v8;
    *vm_address_t v6 = &v14;
  }
  else
  {
    int v7 = &v17;
    pthread_setspecific(qword_C0D8, &v17);
    pid_t v16 = 0;
    ptrdiff_t v17 = &v14;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  unint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 32))(a2, *(void *)(a1 + 40), a3);
  int v10 = v9;
  if (v9)
  {
    Class Class = object_getClass(v9);
    if (Class != (Class)qword_C110 && Class != (Class)qword_C118)
    {
      object_getClassName(v10);
      sub_15A0();
    }
  }
  if (v16) {
    *int v7 = v16;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v10;
}

CFIndex sub_432C(CFIndex result, int a2)
{
  if (result)
  {
    if (a2 == 11)
    {
      object_getClassName((id)result);
      return sub_15A0();
    }
    if ((a2 & 0xFFFFFFFE) != 0xC) {
      return sub_15A0();
    }
    unint64_t result = CFGetRetainCount((CFTypeRef)result);
    if ((~result & 0x7FFFFFFFFFFFFFFFLL) != 0) {
      return sub_15A0();
    }
  }
  return result;
}

uint64_t sub_43C8(uint64_t a1, CFIndex a2)
{
  uint64_t v19 = 0;
  BOOL v4 = (uint64_t **)pthread_getspecific(qword_C0D8);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v18 = *v4;
    *BOOL v4 = &v16;
  }
  else
  {
    uint64_t v5 = &v19;
    pthread_setspecific(qword_C0D8, &v19);
    uint64_t v18 = 0;
    uint64_t v19 = &v16;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v16 = v6;
  uint64_t v17 = v6;
  uint64_t v15 = 0;
  int v7 = (CFIndex **)pthread_getspecific(qword_C0C0);
  CFIndex v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (!v7)
  {
    if (a2)
    {
      id v8 = &v15;
      pthread_setspecific(qword_C0C0, &v15);
      uint64_t v14 = 0;
      uint64_t v15 = &v12;
      CFIndex v12 = a2;
      uint64_t v13 = 0;
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v10 = (*(uint64_t (**)(CFIndex, void))(a1 + 40))(a2, *(void *)(a1 + 48));
    goto LABEL_14;
  }
  id v8 = v7;
  unint64_t v9 = *v7;
  if (**v7 == a2) {
    goto LABEL_11;
  }
  CFIndex v12 = a2;
  uint64_t v13 = 0;
  uint64_t v14 = v9;
  *int v7 = &v12;
LABEL_9:
  uint64_t v10 = (*(uint64_t (**)(CFIndex, void))(a1 + 40))(a2, *(void *)(a1 + 48));
  if (v14) {
    uint64_t *v8 = v14;
  }
  else {
    pthread_setspecific(qword_C0C0, 0);
  }
  sub_432C(a2, 12);
LABEL_14:
  if (v18) {
    CFIndex *v5 = v18;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v10;
}

uint64_t sub_4530(uint64_t a1, CFIndex a2)
{
  uint64_t v18 = 0;
  BOOL v4 = (uint64_t **)pthread_getspecific(qword_C0D8);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v17 = *v4;
    *BOOL v4 = &v15;
  }
  else
  {
    uint64_t v5 = &v18;
    pthread_setspecific(qword_C0D8, &v18);
    uint64_t v17 = 0;
    uint64_t v18 = &v15;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v15 = v6;
  uint64_t v16 = v6;
  uint64_t v14 = 0;
  int v7 = (uint64_t *)pthread_getspecific(qword_C0C0);
  uint64_t v11 = 0;
  CFIndex v12 = 0;
  uint64_t v13 = 0;
  if (v7)
  {
    id v8 = v7;
    if (*(void *)(*v7 + 8) != a2)
    {
      sub_432C(a2, 13);
      uint64_t v9 = *v8;
      uint64_t v11 = 0;
      CFIndex v12 = a2;
      uint64_t v13 = v9;
      uint64_t *v8 = (uint64_t)&v11;
      goto LABEL_9;
    }
  }
  else if (a2)
  {
    sub_432C(a2, 13);
    id v8 = (uint64_t *)&v14;
    pthread_setspecific(qword_C0C0, &v14);
    uint64_t v13 = 0;
    uint64_t v14 = &v11;
    uint64_t v11 = 0;
    CFIndex v12 = a2;
LABEL_9:
    uint64_t result = (*(uint64_t (**)(CFIndex, void))(a1 + 40))(a2, *(void *)(a1 + 48));
    if (v13) {
      uint64_t *v8 = v13;
    }
    else {
      uint64_t result = pthread_setspecific(qword_C0C0, 0);
    }
    goto LABEL_13;
  }
  uint64_t result = (*(uint64_t (**)(CFIndex, void))(a1 + 40))(a2, *(void *)(a1 + 48));
LABEL_13:
  if (!v17) {
    return pthread_setspecific(qword_C0D8, 0);
  }
  CFIndex *v5 = v17;
  return result;
}

uint64_t sub_46A0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = 0;
  BOOL v4 = (uint64_t **)pthread_getspecific(qword_C0D8);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v18 = *v4;
    *BOOL v4 = &v16;
  }
  else
  {
    uint64_t v5 = &v19;
    pthread_setspecific(qword_C0D8, &v19);
    uint64_t v18 = 0;
    uint64_t v19 = &v16;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v16 = v6;
  uint64_t v17 = v6;
  uint64_t v15 = 0;
  int v7 = (uint64_t **)pthread_getspecific(qword_C0C0);
  id v8 = (uint64_t *)v7;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (v7) {
    uint64_t v9 = **v7;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9 == a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(a1 + 40))(a2, *(void *)(a1 + 48));
  }
  else
  {
    if (a2) {
      sub_15A0();
    }
    if (v8)
    {
      uint64_t v14 = *v8;
      uint64_t *v8 = (uint64_t)&v12;
    }
    else
    {
      id v8 = (uint64_t *)&v15;
      pthread_setspecific(qword_C0C0, &v15);
      uint64_t v14 = 0;
      uint64_t v15 = &v12;
    }
    uint64_t v12 = a2;
    uint64_t v13 = 0;
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(a1 + 40))(a2, *(void *)(a1 + 48));
    if (v14) {
      uint64_t *v8 = v14;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
  }
  if (v18) {
    CFIndex *v5 = v18;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v10;
}

uint64_t sub_4824(uint64_t a1, uint64_t a2)
{
  char v21 = 0;
  BOOL v4 = (uint64_t **)pthread_getspecific(qword_C0D8);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v20 = *v4;
    *BOOL v4 = &v18;
  }
  else
  {
    uint64_t v5 = &v21;
    pthread_setspecific(qword_C0D8, &v21);
    uint64_t v20 = 0;
    char v21 = &v18;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v18 = v6;
  uint64_t v19 = v6;
  uint64_t v17 = 0;
  int v7 = (uint64_t **)pthread_getspecific(qword_C0C0);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *v7;
    if (**v7 != a2)
    {
      uint64_t v14 = a2;
      uint64_t v15 = 0;
      uint64_t v16 = v9;
      *int v7 = &v14;
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v12 = (*(uint64_t (**)(uint64_t, void))(a1 + 40))(a2, *(void *)(a1 + 48));
    goto LABEL_17;
  }
  if (!a2) {
    goto LABEL_14;
  }
  id v8 = &v17;
  pthread_setspecific(qword_C0C0, &v17);
  uint64_t v16 = 0;
  uint64_t v17 = &v14;
  uint64_t v14 = a2;
  uint64_t v15 = 0;
LABEL_9:
  int v10 = (*(uint64_t (**)(uint64_t, void))(a1 + 40))(a2, *(void *)(a1 + 48));
  int v11 = v10;
  if (!v16)
  {
    pthread_setspecific(qword_C0C0, 0);
    if (v11) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  uint64_t *v8 = v16;
  if (!v10) {
    goto LABEL_16;
  }
LABEL_11:
  if (a2) {
    sub_15A0();
  }
  uint64_t v12 = 1;
LABEL_17:
  if (v20) {
    CFIndex *v5 = v20;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v12;
}

uint64_t sub_49B0()
{
  return 0;
}

uint64_t sub_49B8(objc_class *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = 0;
  uint64_t v6 = (void ***)pthread_getspecific(qword_C0D8);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (v6)
  {
    int v7 = v6;
    id v8 = off_C1F8;
    uint64_t v14 = *v6;
    *uint64_t v6 = &v12;
  }
  else
  {
    int v7 = &v15;
    pthread_setspecific(qword_C0D8, &v15);
    uint64_t v14 = 0;
    uint64_t v15 = &v12;
    id v8 = off_C1F8;
  }
  uint64_t v12 = v8;
  uint64_t v13 = v8;
  uint64_t v9 = ((uint64_t (*)(objc_class *, uint64_t, uint64_t))v8)(a1, a2, a3);
  uint64_t v10 = v9;
  if (a1 && v9 && (*(void *)a1 <= 0x1000uLL || class_getName(a1))) {
    sub_15A0();
  }
  if (v14) {
    *int v7 = v14;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v10;
}

uint64_t sub_4B00(uint64_t a1)
{
  int v2 = (uint64_t (*)(void))off_C200;
  uint64_t v10 = 0;
  uint64_t v3 = pthread_getspecific(qword_C0D8);
  int v7 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = &v7;
  }
  else
  {
    BOOL v4 = &v10;
    pthread_setspecific(qword_C0D8, &v10);
    uint64_t v9 = 0;
    uint64_t v10 = &v7;
  }
  int v7 = v2;
  id v8 = v2;
  uint64_t v5 = v2(a1);
  if (v5)
  {
    off_C1E8(a1);
    sub_15A0();
  }
  if (v9) {
    *BOOL v4 = v9;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v5;
}

uint64_t sub_4BEC(uint64_t a1)
{
  int v2 = (uint64_t (*)(void))off_C208;
  uint64_t v10 = 0;
  uint64_t v3 = pthread_getspecific(qword_C0D8);
  int v7 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = &v7;
  }
  else
  {
    BOOL v4 = &v10;
    pthread_setspecific(qword_C0D8, &v10);
    uint64_t v9 = 0;
    uint64_t v10 = &v7;
  }
  int v7 = v2;
  id v8 = v2;
  uint64_t v5 = v2(a1);
  if (v5)
  {
    off_C1E8(a1);
    sub_15A0();
  }
  if (v9) {
    *BOOL v4 = v9;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v5;
}

uint64_t sub_4CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = 0;
  BOOL v4 = (void ***)pthread_getspecific(qword_C0D8);
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v11 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = off_C210;
    int v11 = *v4;
    *BOOL v4 = &v9;
  }
  else
  {
    uint64_t v5 = &v12;
    pthread_setspecific(qword_C0D8, &v12);
    int v11 = 0;
    uint64_t v12 = &v9;
    uint64_t v6 = off_C210;
  }
  uint64_t v9 = v6;
  uint64_t v10 = v6;
  uint64_t v7 = ((uint64_t (*)(uint64_t, uint64_t))v6)(a1, a2);
  if (v7) {
    sub_15A0();
  }
  if (v11) {
    CFIndex *v5 = v11;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v7;
}

uint64_t sub_4DC0(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v10 = 0;
    BOOL v4 = pthread_getspecific(qword_C0D8);
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = 0;
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = off_C218;
      uint64_t v9 = *v4;
      *BOOL v4 = &v7;
    }
    else
    {
      uint64_t v5 = &v10;
      pthread_setspecific(qword_C0D8, &v10);
      uint64_t v9 = 0;
      uint64_t v10 = &v7;
      uint64_t v6 = off_C218;
    }
    uint64_t v7 = v6;
    id v8 = v6;
    sub_15A0();
    uint64_t result = off_C218(v3, a2);
    if (v9) {
      void *v5 = v9;
    }
    else {
      return pthread_setspecific(qword_C0D8, 0);
    }
  }
  return result;
}

uint64_t sub_4EAC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v12 = 0;
    uint64_t v6 = pthread_getspecific(qword_C0D8);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = off_C220;
      uint64_t v11 = *v6;
      *uint64_t v6 = &v9;
    }
    else
    {
      uint64_t v7 = &v12;
      pthread_setspecific(qword_C0D8, &v12);
      uint64_t v11 = 0;
      uint64_t v12 = &v9;
      id v8 = off_C220;
    }
    uint64_t v9 = v8;
    uint64_t v10 = v8;
    sub_15A0();
    uint64_t result = off_C220(v5, a2, a3);
    if (v11) {
      *uint64_t v7 = v11;
    }
    else {
      return pthread_setspecific(qword_C0D8, 0);
    }
  }
  return result;
}

uint64_t sub_4FA0(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  int v2 = pthread_getspecific(qword_C0D8);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (v2)
  {
    uint64_t v3 = v2;
    BOOL v4 = off_C228;
    uint64_t v16 = *v2;
    void *v2 = &v14;
  }
  else
  {
    uint64_t v3 = &v17;
    pthread_setspecific(qword_C0D8, &v17);
    uint64_t v16 = 0;
    uint64_t v17 = &v14;
    BOOL v4 = off_C228;
  }
  uint64_t v14 = v4;
  uint64_t v15 = v4;
  uint64_t v13 = 0;
  uint64_t v6 = (uint64_t **)pthread_getspecific(qword_C0C0);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (!v6)
  {
    uint64_t v7 = &v13;
    pthread_setspecific(qword_C0C0, &v13);
    uint64_t v12 = 0;
    uint64_t v13 = &v10;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
LABEL_11:
    uint64_t v5 = off_C228(a1);
    if (v12) {
      *uint64_t v7 = v12;
    }
    else {
      pthread_setspecific(qword_C0C0, 0);
    }
    if (off_C1F0) {
      off_C1F0(a1);
    }
    sub_15A0();
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  id v8 = *v6;
  if (**v6 != a1)
  {
    uint64_t v10 = a1;
    uint64_t v11 = 0;
    uint64_t v12 = v8;
    *uint64_t v6 = &v10;
    goto LABEL_11;
  }
  uint64_t v5 = off_C228(a1);
LABEL_17:
  if (v16) {
    *uint64_t v3 = v16;
  }
  else {
    pthread_setspecific(qword_C0D8, 0);
  }
  return v5;
}

uint64_t sub_513C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v17 = 0;
    int v2 = pthread_getspecific(qword_C0D8);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if (v2)
    {
      uint64_t v3 = v2;
      BOOL v4 = off_C230;
      uint64_t v16 = *v2;
      void *v2 = &v14;
    }
    else
    {
      uint64_t v3 = &v17;
      pthread_setspecific(qword_C0D8, &v17);
      uint64_t v16 = 0;
      uint64_t v17 = &v14;
      BOOL v4 = off_C230;
    }
    uint64_t v14 = v4;
    uint64_t v15 = v4;
    uint64_t v13 = 0;
    uint64_t v5 = (uint64_t **)pthread_getspecific(qword_C0C0);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *v5;
      if (**v5 == v1)
      {
        uint64_t v1 = off_C230(v1);
        goto LABEL_17;
      }
      uint64_t v10 = v1;
      uint64_t v11 = 0;
      uint64_t v12 = v7;
      void *v5 = &v10;
    }
    else
    {
      uint64_t v6 = &v13;
      pthread_setspecific(qword_C0C0, &v13);
      uint64_t v12 = 0;
      uint64_t v13 = &v10;
      uint64_t v10 = v1;
      uint64_t v11 = 0;
    }
    uint64_t v8 = off_C230(v1);
    uint64_t v1 = v8;
    if (v12)
    {
      *uint64_t v6 = v12;
      if (!v8)
      {
LABEL_17:
        if (v16) {
          *uint64_t v3 = v16;
        }
        else {
          pthread_setspecific(qword_C0D8, 0);
        }
        return v1;
      }
    }
    else
    {
      pthread_setspecific(qword_C0C0, 0);
      if (!v1) {
        goto LABEL_17;
      }
    }
    if (off_C1F0) {
      off_C1F0(v1);
    }
    sub_15A0();
    goto LABEL_17;
  }
  return v1;
}

uint64_t sub_52D8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v15 = 0;
    int v2 = pthread_getspecific(qword_C0D8);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (v2)
    {
      uint64_t v3 = v2;
      BOOL v4 = off_C238;
      uint64_t v14 = *v2;
      void *v2 = &v12;
    }
    else
    {
      uint64_t v3 = &v15;
      pthread_setspecific(qword_C0D8, &v15);
      uint64_t v14 = 0;
      uint64_t v15 = &v12;
      BOOL v4 = off_C238;
    }
    uint64_t v12 = v4;
    uint64_t v13 = v4;
    uint64_t v11 = 0;
    uint64_t v5 = (uint64_t *)pthread_getspecific(qword_C0C0);
    uint64_t v6 = v5;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if (v5) {
      uint64_t v7 = *(void *)(*v5 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7 == v1)
    {
      uint64_t result = off_C238(v1);
    }
    else
    {
      if (off_C1F0) {
        off_C1F0(v1);
      }
      sub_15A0();
      if (v6)
      {
        uint64_t v10 = *v6;
        *uint64_t v6 = (uint64_t)&v8;
      }
      else
      {
        uint64_t v6 = (uint64_t *)&v11;
        pthread_setspecific(qword_C0C0, &v11);
        uint64_t v10 = 0;
        uint64_t v11 = &v8;
      }
      uint64_t v8 = 0;
      uint64_t v9 = v1;
      uint64_t result = off_C238(v1);
      if (v10) {
        *uint64_t v6 = v10;
      }
      else {
        uint64_t result = pthread_setspecific(qword_C0C0, 0);
      }
    }
    if (v14) {
      *uint64_t v3 = v14;
    }
    else {
      return pthread_setspecific(qword_C0D8, 0);
    }
  }
  return result;
}

uint64_t sub_5470(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      char v21 = 0;
      uint64_t v5 = pthread_getspecific(qword_C0D8);
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = off_C240;
        uint64_t v20 = *v5;
        void *v5 = &v18;
      }
      else
      {
        uint64_t v6 = &v21;
        pthread_setspecific(qword_C0D8, &v21);
        uint64_t v20 = 0;
        char v21 = &v18;
        uint64_t v7 = off_C240;
      }
      uint64_t v18 = v7;
      uint64_t v19 = v7;
      uint64_t v17 = 0;
      uint64_t v8 = (uint64_t **)pthread_getspecific(qword_C0C0);
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *v8;
        if (**v8 == a1)
        {
          uint64_t v2 = off_C240(a1, v3);
LABEL_21:
          if (v20) {
            *uint64_t v6 = v20;
          }
          else {
            pthread_setspecific(qword_C0D8, 0);
          }
          return v2;
        }
        uint64_t v14 = a1;
        uint64_t v15 = 0;
        uint64_t v16 = v10;
        uint64_t *v8 = &v14;
      }
      else
      {
        uint64_t v9 = &v17;
        pthread_setspecific(qword_C0C0, &v17);
        uint64_t v16 = 0;
        uint64_t v17 = &v14;
        uint64_t v14 = a1;
        uint64_t v15 = 0;
      }
      if (off_C1F0) {
        uint64_t v11 = off_C1F0(a1);
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v2 = off_C240(a1, v3);
      if (v16) {
        *uint64_t v9 = v16;
      }
      else {
        pthread_setspecific(qword_C0C0, 0);
      }
      do
      {
        if (off_C1F0) {
          uint64_t v12 = v11 + 1;
        }
        else {
          uint64_t v12 = v11;
        }
        sub_15A0();
        uint64_t v11 = v12;
        LODWORD(v3) = v3 - 1;
      }
      while (v3);
      goto LABEL_21;
    }
  }
  return v2;
}

uint64_t sub_5644(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v19 = 0;
    BOOL v4 = pthread_getspecific(qword_C0D8);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = off_C248;
      uint64_t v18 = *v4;
      *BOOL v4 = &v16;
    }
    else
    {
      uint64_t v5 = &v19;
      pthread_setspecific(qword_C0D8, &v19);
      uint64_t v18 = 0;
      uint64_t v19 = &v16;
      uint64_t v6 = off_C248;
    }
    uint64_t v16 = v6;
    uint64_t v17 = v6;
    uint64_t v15 = 0;
    uint64_t v7 = (uint64_t *)pthread_getspecific(qword_C0C0);
    uint64_t v8 = v7;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (v7) {
      uint64_t v9 = *(void *)(*v7 + 8);
    }
    else {
      uint64_t v9 = 0;
    }
    if (v9 == v3)
    {
      uint64_t result = off_C248(v3, a2);
LABEL_22:
      if (!v18) {
        return pthread_setspecific(qword_C0D8, 0);
      }
      void *v5 = v18;
      return result;
    }
    if (off_C1F0)
    {
      uint64_t v10 = off_C1F0(v3);
      if (!a2) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v10 = 0;
      if (!a2) {
        goto LABEL_16;
      }
    }
    int v11 = a2;
    do
    {
      v10 -= off_C1F0 != 0;
      sub_15A0();
      --v11;
    }
    while (v11);
LABEL_16:
    if (v8)
    {
      uint64_t v14 = *v8;
      uint64_t *v8 = (uint64_t)&v12;
    }
    else
    {
      uint64_t v8 = (uint64_t *)&v15;
      pthread_setspecific(qword_C0C0, &v15);
      uint64_t v14 = 0;
      uint64_t v15 = &v12;
    }
    uint64_t v12 = 0;
    uint64_t v13 = v3;
    uint64_t result = off_C248(v3, a2);
    if (v14) {
      uint64_t *v8 = v14;
    }
    else {
      uint64_t result = pthread_setspecific(qword_C0C0, 0);
    }
    goto LABEL_22;
  }
  return result;
}

void sub_5820(id a1)
{
  uint64_t v1 = dlopen("/usr/lib/libobjc.A.dylib", 16);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void (*)(char *(*)(int, Class), void))dlsym(v1, "_objc_addWillInitializeClassFunc");
    if (v3)
    {
      v3(sub_58AC, 0);
      byte_C258 = 1;
    }
    dlclose(v2);
  }
}

char *sub_58AC(int a1, Class cls)
{
  sub_3E78(cls);
  Class Class = object_getClass(cls);
  sub_3E78(Class);
  Name = (char *)class_getName(cls);
  if (!strncmp(Name, "OS_", 3uLL)
    || !strncmp(Name, "__NS", 4uLL) && strstr(Name, "Block")
    || (uint64_t result = sub_3DC0(Name), result))
  {
    return (char *)sub_15A0();
  }
  return result;
}

uint64_t sub_5970(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 5;
  }
  uint64_t result = 0;
  *a4 = a2;
  return result;
}

uint64_t sub_5988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  dword_C261 = 16;
  uint64_t result = (uint64_t)pthread_self();
  qword_C279 = result;
  dword_C265 = 1;
  qword_C289 = 2;
  if (a5)
  {
    uint64_t v8 = a5;
    uint64_t v9 = (unint64_t *)(a4 + 8);
    do
    {
      qword_C269 = *(v9 - 1) ^ 0x5555;
      qword_C281 = *v9;
      sub_1D2C(byte_C259);
      uint64_t v10 = (unint64_t *)*(v9 - 1);
      unint64_t v11 = *v9;
      uint64_t result = (uint64_t)sub_3148((uint64_t)v10, *v9);
      if (result
        || (v11 < 8 ? (unint64_t v12 = 0) : (unint64_t v12 = *v10),
            qword_C0A8 <= v12 ? (BOOL v13 = v12 >= qword_C0B0) : (BOOL v13 = 1),
            v13 ? (int v14 = 0) : (int v14 = 1),
            v12 || v14))
      {
        uint64_t result = sub_15A0();
      }
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_5AB0(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_5B84;
  v5[3] = &unk_8518;
  v5[4] = &v6;
  v5[5] = a1;
  pthread_key_t v1 = qword_C0B8;
  pthread_t v2 = pthread_self();
  pthread_setspecific(v1, v2);
  sub_5B84((uint64_t)v5);
  pthread_setspecific(qword_C0B8, 0);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_5B84(uint64_t a1)
{
  unsigned int v2 = 0;
  do
  {
    thread_act_array_t act_list = 0;
    mach_msg_type_number_t act_listCnt = 0;
    uint64_t result = task_threads(mach_task_self_, &act_list, &act_listCnt);
    if (result)
    {
      BOOL v4 = 0;
      mach_msg_type_number_t v5 = 0;
      LODWORD(v6) = 0;
      mach_msg_type_number_t act_listCnt = 0;
      goto LABEL_17;
    }
    uint64_t result = act_listCnt;
    if (!act_listCnt)
    {
      BOOL v4 = 0;
      mach_msg_type_number_t v5 = 0;
LABEL_13:
      LODWORD(v6) = 0;
LABEL_17:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_18;
    }
    uint64_t result = (uint64_t)malloc_type_malloc(act_listCnt, 0x100004077774924uLL);
    BOOL v4 = (unsigned char *)result;
    mach_msg_type_number_t v5 = act_listCnt;
    if (!act_listCnt) {
      goto LABEL_13;
    }
    unint64_t v6 = 0;
    while (1)
    {
      thread_act_t v7 = act_list[v6];
      uint64_t result = mach_thread_self();
      v4[v6] = v7 != result;
      if (v7 != result)
      {
        uint64_t result = (*(uint64_t (**)(void))(a1 + 40))(act_list[v6]);
        if (result)
        {
          if (*(kern_return_t (__cdecl ***)(thread_read_t))(a1 + 40) == &thread_suspend) {
            break;
          }
        }
      }
      ++v6;
      mach_msg_type_number_t v5 = act_listCnt;
      if (v6 >= act_listCnt) {
        goto LABEL_15;
      }
    }
    mach_msg_type_number_t v5 = act_listCnt;
LABEL_15:
    if (v5 < v6) {
      sub_6074();
    }
    if (v5 == v6) {
      goto LABEL_17;
    }
    if (*(kern_return_t (__cdecl ***)(thread_read_t))(a1 + 40) != &thread_suspend) {
      sub_60A0();
    }
    if (v6)
    {
      uint64_t v12 = 0;
      do
      {
        if (v4[v12]) {
          uint64_t result = thread_resume(act_list[v12]);
        }
        ++v12;
      }
      while (v6 != v12);
      LODWORD(v6) = 1;
      mach_msg_type_number_t v5 = act_listCnt;
    }
LABEL_18:
    if (v5)
    {
      free(v4);
      if (act_listCnt)
      {
        unint64_t v8 = 0;
        do
        {
          mach_port_t v9 = mach_thread_self();
          mach_port_deallocate(v9, act_list[v8++]);
          uint64_t v10 = act_listCnt;
        }
        while (v8 < act_listCnt);
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t result = vm_deallocate(mach_task_self_, (vm_address_t)act_list, 4 * v10);
    }
    if (v6) {
      break;
    }
  }
  while (v2++ < 9);
  return result;
}

void sub_5D74(uint64_t a1)
{
}

void sub_5D80(uint64_t a1)
{
}

void sub_5D98(uint64_t a1)
{
}

void sub_5DA8(uint64_t a1)
{
}

void sub_5DB8(uint64_t a1)
{
}

void sub_5DC8(uint64_t a1)
{
}

mach_vm_address_t _OAFreeKeyFrame(mach_vm_address_t address)
{
  if (address != 1) {
    return mach_vm_deallocate(mach_task_self_, address, 0x17170uLL);
  }
  return address;
}

BOOL _OAIsReEntrantCall()
{
  return pthread_getspecific(__keyframe_key) == (char *)&dword_0 + 1;
}

_DWORD *_OAGenerateDeltaEvent(_DWORD *result)
{
  if (!result[3]) {
    return result;
  }
  pthread_key_t v1 = result;
  uint64_t result = pthread_getspecific(__keyframe_key);
  mach_vm_address_t v2 = (mach_vm_address_t)result;
  int v3 = v1[2];
  if ((v3 - 3) <= 0x1Bu)
  {
    uint64_t v4 = qword_65D8[(char)(v3 - 3)];
    if (result) {
      goto LABEL_4;
    }
LABEL_14:
    pthread_setspecific(__keyframe_key, (char *)&dword_0 + 1);
    mach_vm_address_t address = 0;
    mach_vm_allocate(mach_task_self_, &address, 0x17170uLL, 167772161);
    mach_vm_address_t v2 = address;
    pthread_setspecific(__keyframe_key, (const void *)address);
    goto LABEL_15;
  }
  uint64_t v4 = 0;
  if (!result) {
    goto LABEL_14;
  }
LABEL_4:
  if (*(double *)&result[1028 * v4] <= *(double *)&__keyFrameEventHorizon)
  {
LABEL_15:
    uint64_t v17 = mach_absolute_time();
    mach_vm_address_t v18 = v2 + 4112 * v4;
    *(double *)mach_vm_address_t v18 = (double)v17;
    int v19 = 512 - v1[3];
    *(_DWORD *)(v18 + 8) = v19;
    uint64_t result = memcpy((void *)(v18 + 8 * v19 + 16), v1 + 12, 8 * v1[3]);
    v1[2] |= 0x400000u;
    return result;
  }
  int v5 = v1[3];
  unint64_t v6 = (char *)&result[1028 * v4];
  uint64_t v9 = *((int *)v6 + 2);
  unint64_t v8 = (unsigned int *)(v6 + 8);
  uint64_t v7 = v9;
  unsigned int v10 = v5 - 1;
  if ((int)v9 > 511 || (v10 & 0x80000000) != 0)
  {
    v1[2] = v3 | 0x800000;
    if ((v10 & 0x80000000) == 0)
    {
      int v11 = 511;
LABEL_22:
      unsigned int v20 = v11 - v10;
LABEL_23:
      unsigned int *v8 = v20;
      v1[3] = (unsigned __int16)v20 | ((unsigned __int16)v5 << 16);
      return result;
    }
  }
  else
  {
    if (*(void *)&result[1028 * v4 + 1026] != *(void *)&v1[2 * v10 + 12])
    {
      int v15 = 511;
LABEL_19:
      unsigned int v20 = v15 - v10;
      uint64_t result = memcpy(&result[1028 * v4 + 4 + 2 * (int)(v15 - v10)], v1 + 12, 8 * v5);
      v1[2] |= 0x800000u;
      goto LABEL_23;
    }
    int v11 = 510;
    uint64_t v12 = 512;
    while (1)
    {
      int v13 = v5 + v11 - 511;
      unsigned int v10 = v5 + v11 - 512;
      if (v12 - 1 <= v7 || v13 <= 0) {
        break;
      }
      uint64_t v14 = *(void *)&result[1028 * v4 + 2 * v12];
      --v11;
      --v12;
      if (v14 != *(void *)&v1[2 * v10 + 12])
      {
        int v15 = v11 + 1;
        int v16 = v5 + v11;
        unsigned int v10 = v16 - 511;
        int v5 = v16 - 510;
        goto LABEL_19;
      }
    }
    v1[2] = v3 | 0x800000;
    if (v13 > 0)
    {
      LOWORD(v5) = v5 + v11 - 511;
      goto LABEL_22;
    }
  }
  unsigned int *v8 = 512 - v5;
  v1[3] = (unsigned __int16)(512 - v5);
  return result;
}

void sub_6074()
{
  __assert_rtn("_manipulateOtherThreadStates_block_invoke", "oainject.c", 1528, "successfullyManipulated <= threadCount");
}

void sub_60A0()
{
  __assert_rtn("_manipulateOtherThreadStates_block_invoke", "oainject.c", 1535, "threadManipulationFunction == thread_suspend");
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _dyld_get_shared_cache_range()
{
  return __dyld_get_shared_cache_range();
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return _class_copyMethodList(cls, outCount);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

BOOL class_isMetaClass(Class cls)
{
  return _class_isMetaClass(cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
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

uint64_t malloc_get_all_zones()
{
  return _malloc_get_all_zones();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return _method_getImplementation(m);
}

SEL method_getName(Method m)
{
  return _method_getName(m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return _method_setImplementation(m, imp);
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return _objc_copyClassList(outCount);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

void objc_setProperty(id self, SEL _cmd, ptrdiff_t offset, id newValue, BOOL atomic, char shouldCopy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return _proc_regionfilename(pid, address, buffer, buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return _setvbuf(a1, a2, a3, a4);
}

int shm_unlink(const char *a1)
{
  return _shm_unlink(a1);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return _task_threads(target_task, act_list, act_listCnt);
}

kern_return_t thread_resume(thread_read_t target_act)
{
  return _thread_resume(target_act);
}

uint64_t thread_stack_pcs()
{
  return _thread_stack_pcs();
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}