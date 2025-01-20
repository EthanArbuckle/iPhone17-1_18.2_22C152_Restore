uint64_t sub_22AF372CC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_messageReceived_, a2);
}

void *sub_22AF3756C(void *a1, compression_algorithm a2)
{
  v3 = a1;
  v4 = v3;
  if (a2 == COMPRESSION_LZ4)
  {
    uint64_t v5 = 16;
  }
  else
  {
    if (a2 != COMPRESSION_LZFSE) {
      sub_22AF52E94();
    }
    uint64_t v5 = 8;
  }
  v6 = (unint64_t *)&v3[v5];
  size_t v7 = compression_encode_scratch_buffer_size(a2);
  unint64_t v8 = atomic_load(v6);
  v9 = (void *)v8;
  atomic_compare_exchange_strong((atomic_ullong *volatile)v6, (unint64_t *)&v9, 0);
  if (v9 != (void *)v8 || v9 == 0) {
    v9 = malloc_type_malloc(v7, 0x2E4A8856uLL);
  }

  return v9;
}

void sub_22AF37600(void *a1, int a2, void *a3)
{
  uint64_t v5 = a1;
  if (a3)
  {
    if (a2 == 256)
    {
      uint64_t v6 = 16;
    }
    else
    {
      if (a2 != 2049) {
        sub_22AF52EC0();
      }
      uint64_t v6 = 8;
    }
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&v5[v6], (unint64_t *)&v7, (unint64_t)a3);
    if (v7)
    {
      unint64_t v8 = v5;
      free(a3);
      uint64_t v5 = v8;
    }
  }
}

void sub_22AF37B70(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_22AF37B84(_Unwind_Exception *a1)
{
}

void sub_22AF37C2C(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 36) & 0xC) == 0)
  {
    uint64_t v2 = MEMORY[0x230F36B10](*(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
}

void sub_22AF37D50(void *a1)
{
  uint64_t v1 = a1[4];
  if ((*(unsigned char *)(v1 + 36) & 0xC) == 0)
  {
    uint64_t v3 = (void *)a1[5];
    if (v3)
    {
      char v4 = 2;
    }
    else
    {
      uint64_t v3 = (void *)a1[6];
      char v4 = 1;
    }
    id v5 = v3;
    uint64_t v6 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = v5;

    *(unsigned char *)(a1[4] + 36) = *(unsigned char *)(a1[4] + 36) & 0xFC | v4;
  }
}

void sub_22AF37E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF37EB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22AF37EC4(uint64_t a1)
{
}

void sub_22AF37ECC(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 36) & 8) == 0)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    char v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_22AF38044;
    v12[3] = &unk_264883990;
    v12[4] = *(void *)(a1 + 40);
    id v5 = (void *)MEMORY[0x230F36B10](v12);
    id v6 = *(id *)(*(void *)(a1 + 32) + 24);
    id v7 = v5;
    unint64_t v8 = v7;
    if (v7 && v6)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = sub_22AF380A4;
      v13[3] = &unk_2648839E0;
      id v14 = v6;
      id v15 = v8;
      uint64_t v9 = MEMORY[0x230F36B10](v13);
    }
    else
    {
      if (v6) {
        id v7 = v6;
      }
      uint64_t v9 = MEMORY[0x230F36B10](v7);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;
  }
}

intptr_t sub_22AF38044(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

uint64_t sub_22AF380A4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_semaphore_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_22AF38248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_22AF38264(uint64_t a1, void *a2)
{
  dispatch_semaphore_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v6 = [v5 _validateDispatch:v3];

  return v6;
}

uint64_t sub_22AF38390(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(*(void *)(a1 + 32) + 24) a2:a3];
}

void sub_22AF38A90(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v7 = [v13 v3:v4];
  if ((id)kDTXInterruptionMessage == v13)
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"DTXProxyChannel" code:1 userInfo:&unk_26DE40CF8];

    id v7 = (void *)v8;
  }
  uint64_t v9 = [*(void **)(a1 + 32) _allowedClassesForReturnValues:v5 withTransitionContext:v6];
  v11 = [v13 objectWithAllowedClasses:v10];

  [objc_msgSend_invokeCompletionWithReturnValue_error_(*(void **)(a1 + 40), v12, (uint64_t)v11, v7);
}

void sub_22AF39000(uint64_t a1)
{
  dispatch_semaphore_t v2 = (mach_msg_header_t *)malloc_type_malloc(0x8000uLL, 0x1000040B0612BB1uLL);
  p_msgh_bits = &v2->msgh_bits;
  mach_port_name_t v4 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
  if (v4 + 1 < 2 || mach_msg(v2, 258, 0, 0x8000u, v4, 1u, 0))
  {
    free(p_msgh_bits);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 64);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF39148;
    block[3] = &unk_264883A58;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = p_msgh_bits[6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_22AF39150;
    v10[3] = &unk_264883A78;
    v10[4] = p_msgh_bits;
    [v8 received:v5 ofLength:(p_msgh_bits + 7) destructor:v9];
  }
}

uint64_t sub_22AF39148(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) a2:a3];
}

void sub_22AF39150(uint64_t a1)
{
}

void sub_22AF39158(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_semaphore_t v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF391D4;
  block[3] = &unk_264883A58;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t sub_22AF391D4(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) a2:a3];
}

void sub_22AF392B0(void *a1)
{
  id v5 = a1;
  dispatch_queue_t v1 = dispatch_queue_create("DTXMachTransport input queue", 0);
  dispatch_semaphore_t v2 = (void *)v5[7];
  v5[7] = v1;

  dispatch_queue_t v3 = dispatch_queue_create("DTXMachTransport output queue", 0);
  mach_port_name_t v4 = (void *)v5[8];
  v5[8] = v3;

  v5[13] = malloc_type_malloc(0x8000uLL, 0x1000040B0612BB1uLL);
}

uint64_t sub_22AF39A1C(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  mach_port_name_t v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x263EF8960], v3, 1u, -1);
    *(_DWORD *)(*(void *)(v1 + 32) + 48) = 0;
    uint64_t v2 = *(void *)(v1 + 32);
  }
  mach_port_name_t v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x263EF8960], v4);
    *(_DWORD *)(*(void *)(v1 + 32) + 52) = 0;
  }
  return result;
}

uint64_t sub_22AF39BF8(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  mach_port_name_t v3 = *(_DWORD *)(v2 + 48);
  if (v3 + 1 >= 2)
  {
    result = mach_port_mod_refs(*MEMORY[0x263EF8960], v3, 1u, -1);
    *(_DWORD *)(*(void *)(v1 + 32) + 48) = 0;
    uint64_t v2 = *(void *)(v1 + 32);
  }
  mach_port_name_t v4 = *(_DWORD *)(v2 + 52);
  if (v4 + 1 >= 2)
  {
    result = mach_port_deallocate(*MEMORY[0x263EF8960], v4);
    *(_DWORD *)(*(void *)(v1 + 32) + 52) = 0;
  }
  return result;
}

uint64_t sub_22AF39D80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22AF39D90(uint64_t a1)
{
}

void sub_22AF39D98(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_22AF39E1C;
  v3[3] = &unk_2648839B8;
  long long v4 = v1;
  dispatch_sync(v2, v3);
}

uint64_t sub_22AF39E1C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(_DWORD *)(v1 + 52) + 1) >= 2 && (*(_DWORD *)(v1 + 48) + 1) >= 2)
  {
    uint64_t v2 = result;
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    uint64_t v4 = *(void *)(*(void *)(v2 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    xpc_dictionary_set_mach_send();
    result = xpc_dictionary_set_mach_recv();
    *(_DWORD *)(*(void *)(v2 + 32) + 48) = 0;
  }
  return result;
}

void sub_22AF3A178(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;
  }
}

void sub_22AF3A1E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 80);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3A280;
  block[3] = &unk_264883A58;
  block[4] = v2;
  dispatch_sync(v4, block);
}

void sub_22AF3A280(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = 0;
  }
}

void sub_22AF3A7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF3A7D4(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  int v2 = *(_DWORD *)(a1 + 36);

  return close(v2);
}

uint64_t sub_22AF3AC08(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  int v2 = *(_DWORD *)(a1 + 36);

  return close(v2);
}

void sub_22AF3ADA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF3ADB8(mach_port_name_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = -1;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v14 = sub_22AF3B91C;
  id v15 = &unk_264883B40;
  v17 = &v18;
  id v4 = v3;
  id v16 = v4;
  id v5 = v13;
  long long v23 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, a1, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    ((void (*)(void *, void, uint64_t, void))v14)(v5, 0, 4, 0);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 4;
    if (HIDWORD(v23) + *(_DWORD *)&msg[4] == 48)
    {
      uint64_t v8 = 0;
      if (*(_DWORD *)&msg[24] == 1)
      {
        if (!HIBYTE(DWORD1(v23))
          && ((int v9 = HIWORD(DWORD1(v23)), (HIWORD(DWORD1(v23)) - 22) < 0xFFFFFFFA)
           || (*(_DWORD *)msg & 0x80000000) != 0))
        {
          if (v9 == 16) {
            unsigned int v10 = 1;
          }
          else {
            unsigned int v10 = 4 * ((v9 - 17) > 4);
          }
          if (*(int *)msg >= 0) {
            uint64_t v7 = 6;
          }
          else {
            uint64_t v7 = v10;
          }
          uint64_t v6 = *(unsigned int *)&msg[28];
          uint64_t v8 = *(unsigned int *)&msg[8];
        }
        else
        {
          uint64_t v6 = 0;
          uint64_t v8 = 0;
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))v14)(v5, v6, v7, v8);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  uint64_t v11 = *((unsigned int *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v11;
}

void sub_22AF3AF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF3AFA0(uint64_t a1, int a2)
{
  uint64_t result = sub_22AF3AFD8(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_22AF3AFD8(int a1, int a2)
{
  mach_msg_return_t v11;
  mach_error_t v12;
  const char *v13;
  pid_t v14;
  char *v15;
  int v16;
  int v17;
  int v18[2];
  uint8_t v19[4];
  const char *v20;
  __int16 v21;
  pid_t v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  mach_error_t v26;
  unsigned char buf[12];
  long long v28;
  _DWORD v29[3];
  uint64_t v30;

  v30 = *MEMORY[0x263EF8340];
  int v4 = pipe(v18);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v4 && (v18[0] & 0x80000000) == 0)
  {
    if (v18[1] < 0) {
      return 0xFFFFFFFFLL;
    }
    if (fileport_makeport())
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = getprogname();
        pid_t v7 = getpid();
        uint64_t v8 = __error();
        int v9 = strerror(*v8);
        int v10 = *__error();
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v6;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v7;
        WORD3(v28) = 2080;
        *((void *)&v28 + 1) = v9;
        LOWORD(v29[0]) = 1024;
        *(_DWORD *)((char *)v29 + 2) = v10;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s(%d) [error]: '_send_fd' failed: %s (%d)\n", buf, 0x22u);
      }
      goto LABEL_12;
    }
    *(void *)((char *)&v28 + 4) = 0;
    HIDWORD(v28) = 1;
    *(void *)&v29[1] = 0x13000000000000;
    *(_DWORD *)&buf[8] = a1;
    LODWORD(v28) = a2;
    *(void *)buf = 0x2880001413;
    v29[0] = 0;
    uint64_t v11 = mach_msg_send((mach_msg_header_t *)buf);
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v13 = getprogname();
        id v14 = getpid();
        id v15 = mach_error_string(v12);
        *(_DWORD *)v19 = 136315906;
        uint64_t v20 = v13;
        int v21 = 1024;
        v22 = v14;
        long long v23 = 2080;
        v24 = v15;
        v25 = 1024;
        v26 = v12;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", v19, 0x22u);
      }
      mach_port_deallocate(*MEMORY[0x263EF8960], 0);
      goto LABEL_12;
    }
    mach_port_deallocate(*MEMORY[0x263EF8960], 0);
    id v16 = v18[0];
    if ((v18[0] & 0x80000000) == 0)
    {
      v17 = fcntl(v18[0], 3);
      if ((v17 & 4) == 0)
      {
        fcntl(v16, 4, v17 | 4u);
LABEL_19:
        if ((v18[0] & 0x80000000) == 0 && fcntl(v18[0], 2, 1) != -1) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      if (v17 != -1) {
        goto LABEL_19;
      }
    }
LABEL_12:
    close(v18[0]);
    v18[0] = -1;
LABEL_13:
    close(v18[1]);
    return v18[0];
  }
  return result;
}

uint64_t sub_22AF3B268(uint64_t a1)
{
  close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  int v2 = *(_DWORD *)(a1 + 40);

  return close(v2);
}

void sub_22AF3B664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_22AF3B698(uint64_t a1, mach_port_name_t a2)
{
  uint64_t v4 = sub_22AF3AFD8(*(_DWORD *)(a1 + 40), a2);
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_22AF3ADB8(a2, 0);
    if ((v6 & 0x80000000) != 0)
    {
      close(v5);
    }
    else
    {
      uint64_t v7 = v6;
      uint64_t v8 = [DTXFileDescriptorTransport alloc];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      void v13[2] = sub_22AF3B790;
      v13[3] = &unk_264883A78;
      int v14 = v5;
      int v15 = v7;
      uint64_t v10 = [v8 initWithIncomingFileDescriptor:v9 outgoingFileDescriptor:v5 disconnectBlock:v7];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

uint64_t sub_22AF3B790(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 32));
  int v2 = *(_DWORD *)(a1 + 36);

  return close(v2);
}

uint64_t sub_22AF3B870(uint64_t result, int a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v4 = result;
  if (a2 != 2) {
    goto LABEL_13;
  }
  uint64_t result = *a3;
  if ((result + 1) < 2 || *a4 || a3[1] + 1 < 2 || a4[1]) {
    goto LABEL_13;
  }
  int v5 = fileport_makefd();
  uint64_t result = fileport_makefd();
  if (v5 < 0)
  {
    if ((result & 0x80000000) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    if ((result & 0x80000000) == 0)
    {
      uint64_t v6 = *(_DWORD **)(v4 + 48);
      **(_DWORD **)(v4 + 40) = v5;
      _DWORD *v6 = result;
      return result;
    }
    LODWORD(result) = v5;
  }
  uint64_t result = close(result);
LABEL_13:
  *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) = 5;
  return result;
}

uint64_t sub_22AF3B91C(uint64_t result, int a2, int a3)
{
  if ((a2 + 1) >= 2 && a3 == 0)
  {
    uint64_t v4 = result;
    uint64_t result = fileport_makefd();
    *(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = result;
    uint64_t v5 = *(void *)(*(void *)(v4 + 40) + 8);
    int v6 = *(_DWORD *)(v5 + 24);
    if ((v6 & 0x80000000) == 0)
    {
      uint64_t result = fcntl(*(_DWORD *)(v5 + 24), 3);
      if ((result & 4) != 0)
      {
        if (result == -1)
        {
          uint64_t result = close(*(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24));
          *(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = -1;
        }
      }
      else
      {
        uint64_t result = fcntl(v6, 4, result | 4);
      }
    }
    if ((*(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) & 0x80000000) == 0)
    {
      uint64_t result = *(void *)(v4 + 32);
      if (result)
      {
        uint64_t v7 = *(uint64_t (**)(void))(result + 16);
        return v7();
      }
    }
  }
  return result;
}

void sub_22AF3BA1C(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5 = *(unsigned int *)(a1 + 40);
  int v6 = dispatch_get_global_queue(0, 0);
  id v7 = a3;
  source = dispatch_source_create(MEMORY[0x263EF83D0], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_source_cancel(source);
}

void sub_22AF3BAE4(uint64_t a1)
{
  kern_return_t v5;
  mach_error_t v6;
  kern_return_t v7;
  mach_error_t v8;
  const char *v9;
  pid_t v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  pid_t v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  mach_error_t v19;
  uint64_t v20;

  char v1 = 0;
  uint64_t v20 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    mach_port_name_t v3 = *(_DWORD *)(a1 + 40);
    if (v3 + 1 >= 2)
    {
      uint64_t v4 = (ipc_space_t *)MEMORY[0x263EF8960];
      uintptr_t v5 = mach_port_mod_refs(*MEMORY[0x263EF8960], v3, 1u, -1);
      if (v5)
      {
        int v6 = v5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315906;
          id v13 = getprogname();
          int v14 = 1024;
          int v15 = getpid();
          id v16 = 2080;
          v17 = mach_error_string(v6);
          uint64_t v18 = 1024;
          v19 = v6;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n", (uint8_t *)&v12, 0x22u);
        }
      }
      id v7 = mach_port_deallocate(*v4, *(_DWORD *)(a1 + 40));
      if (v7)
      {
        uint64_t v8 = v7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          int v9 = getprogname();
          uint64_t v10 = getpid();
          uint64_t v11 = mach_error_string(v8);
          v12 = 136315906;
          id v13 = v9;
          int v14 = 1024;
          int v15 = v10;
          id v16 = 2080;
          v17 = v11;
          uint64_t v18 = 1024;
          v19 = v8;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n", (uint8_t *)&v12, 0x22u);
        }
      }
    }
  }
}

void sub_22AF3BD84(_DWORD *a1)
{
  a1[10] = 2;
  char v1 = a1;
  dispatch_queue_t v2 = dispatch_queue_create("transport handler guard", 0);
  mach_port_name_t v3 = (void *)v1[2];
  v1[2] = v2;

  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  [v4 stringWithFormat:@"transport incoming serializer queue (%@)", v5];
  id v17 = objc_claimAutoreleasedReturnValue();
  int v9 = (const char *)[v17 UTF8String];
  uint64_t v10 = dispatch_queue_create(v9, 0);
  dispatch_suspend(v10);
  uint64_t v11 = (void *)v1[1];
  v1[1] = v10;
  v12 = v10;

  id v13 = objc_opt_new();
  [v13 _suspendLimits:v14 withTransitionContext:v15];
  id v16 = (void *)v1[3];
  v1[3] = v13;
}

void sub_22AF3BFA4(uint64_t a1, const char *a2, uint64_t a3)
{
  [*(void **)(a1 + 32) dataReceivedHandler:a2 withData:a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  free(*(void **)(a1 + 40));
}

void sub_22AF3C208(uint64_t a1, const char *a2, uint64_t a3)
{
  [*(void **)(a1 + 32) dataReceivedHandler:a2 withData:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
    if (!*(void *)(a1 + 56)) {
      [*(void **)(a1 + 32) setDataReceivedHandler:v4];
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    [*(void **)(*(void *)(a1 + 32) + 24) releaseSize:v4 withTransitionContext:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_22AF3C344(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 44))
  {
    *(unsigned char *)(v1 + 44) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
}

uint64_t sub_22AF3C498(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_22AF3C544(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  if (v5)
  {
    *(void *)(v4 + 32) = 0;
  }
  else if (*(void *)(a1 + 40) && !*(unsigned char *)(v4 + 44))
  {
    *(unsigned char *)(v4 + 44) = 1;
    [*(void **)(*(void *)(a1 + 32) + 24) resumeLimits:a2 withCompletion:a3];
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  }
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (v6[44] && [v6 a2:a3] == 3)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x230F36B10](*(void *)(a1 + 40));
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;
  }
}

uint64_t sub_22AF3C718(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F36B10](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_22AF3C744(uint64_t a1)
{
}

void sub_22AF3C74C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x230F36B10](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

double DTXPrimitiveArrayCreate()
{
  v0 = malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(void *)&double result = 496;
  _OWORD *v0 = xmmword_22AF55150;
  return result;
}

void DTXPrimitiveArrayDestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

unint64_t *DTXPrimitiveArrayCreateWithTypesAndValues(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  uint64_t v10 = (unint64_t *)malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(_OWORD *)uint64_t v10 = xmmword_22AF55150;
  return sub_22AF3C934(v10, 0, a1, &a9);
}

unint64_t *sub_22AF3C934(unint64_t *ptr, unsigned int a2, int a3, const char **a4)
{
  v19 = a4;
  if (a2) {
    unsigned int v5 = a2;
  }
  else {
    unsigned int v5 = -1;
  }
  if (a3)
  {
    unsigned int v6 = 0;
    do
    {
      switch(a3)
      {
        case 1:
          uint64_t v7 = v19++;
          uint64_t v8 = *v7;
          size_t v9 = strlen(*v7) + 1;
          uint64_t v10 = ptr;
          int v11 = 1;
          v12 = (char *)v8;
          goto LABEL_13;
        case 3:
          id v13 = v19++;
          LODWORD(v18) = *(_DWORD *)v13;
          v12 = (char *)&v18;
          uint64_t v10 = ptr;
          int v11 = 3;
          size_t v9 = 4;
          goto LABEL_13;
        case 6:
          int v14 = v19++;
          uint64_t v18 = *v14;
          v12 = (char *)&v18;
          uint64_t v10 = ptr;
          int v11 = 6;
          goto LABEL_11;
        case 9:
          uint64_t v15 = v19++;
          uint64_t v18 = *v15;
          v12 = (char *)&v18;
          uint64_t v10 = ptr;
          int v11 = 9;
LABEL_11:
          size_t v9 = 8;
          goto LABEL_13;
        case 10:
          uint64_t v10 = ptr;
          int v11 = 10;
          v12 = 0;
          size_t v9 = 0;
LABEL_13:
          ptr = sub_22AF3CB48(v10, v11, v12, v9);
          ++v6;
          break;
        default:
          break;
      }
      id v16 = v19++;
      if (v6 >= v5) {
        break;
      }
      a3 = *(_DWORD *)v16;
    }
    while (*(_DWORD *)v16);
  }
  return ptr;
}

unint64_t *DTXPrimitiveArrayAppendValues(unint64_t *result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const char *a9)
{
  if (result)
  {
    size_t v9 = result;
    if (!*result)
    {
      double result = sub_22AF3C934((unint64_t *)*result, 0, a2, &a9);
      void *v9 = result;
    }
  }
  return result;
}

void *DTXPrimitiveArrayAppendBuffer(void *result, void *__src, size_t __n)
{
  if (result)
  {
    uint64_t v3 = result;
    if (!*result)
    {
      double result = sub_22AF3CB48(0, 2, __src, __n);
      void *v3 = result;
    }
  }
  return result;
}

void *sub_22AF3CB48(unint64_t *ptr, int a2, void *__src, size_t __n)
{
  int v4 = __n;
  uint64_t v7 = ptr;
  unsigned int v8 = a2 - 1;
  if (ptr)
  {
    size_t v9 = __n;
    unint64_t v10 = ptr[1];
    unint64_t v11 = __n + 4 * (v8 < 2) + v10 + 4;
    if (*ptr >= v11) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v10 = 0;
    size_t v9 = __n;
    unint64_t v11 = __n + 4 * (v8 < 2) + 4;
  }
  unint64_t v12 = (v11 + 527) & 0xFFFFFFFFFFFFFE00;
  if (v12) {
    size_t v13 = v12;
  }
  else {
    size_t v13 = 256;
  }
  uint64_t v7 = malloc_type_realloc(ptr, v13, 0x555093E9uLL);
  *uint64_t v7 = v13 - 16;
  v7[1] = v10;
LABEL_9:
  int v14 = (_DWORD *)((char *)v7 + v10 + 16);
  *int v14 = a2;
  uint64_t v15 = (char *)(v14 + 1);
  if (v8 <= 1)
  {
    v14[1] = v4;
    uint64_t v15 = (char *)(v14 + 2);
  }
  if (v4)
  {
    memcpy(v15, __src, v9);
    v15 += v9;
  }
  v7[1] = v15 - (char *)(v7 + 2);
  return v7;
}

CFDataRef _createObjectFromPrimitiveType(int a1, char *cStr, CFIndex length)
{
  switch(a1)
  {
    case 1:
      return (CFDataRef)CFStringCreateWithCString(0, cStr, 0x8000100u);
    case 2:
      return CFDataCreate(0, (const UInt8 *)cStr, length);
    case 3:
      CFNumberType v6 = kCFNumberSInt32Type;
      goto LABEL_13;
    case 4:
      valuePtr[1] = v3;
      valuePtr[2] = v4;
      valuePtr[0] = *(unsigned int *)cStr;
      return CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
    case 5:
    case 6:
    case 7:
    case 8:
      CFNumberType v6 = kCFNumberSInt64Type;
      goto LABEL_13;
    case 9:
      CFNumberType v6 = kCFNumberDoubleType;
LABEL_13:
      CFDataRef result = CFNumberCreate(0, v6, cStr);
      break;
    default:
      CFDataRef result = 0;
      break;
  }
  return result;
}

CFArrayRef CFArrayCreateWithDTXPrimitiveArray(uint64_t a1)
{
  unsigned int v2 = sub_22AF3CEB8(a1);
  if (v2)
  {
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000;
    int v13 = 0;
    uint64_t v3 = (const void **)malloc_type_malloc(8 * v2, 0x80040B8603338uLL);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = sub_22AF3D13C;
    v9[3] = &unk_264883C30;
    v9[4] = &v10;
    v9[5] = v3;
    sub_22AF3CF68(a1, (uint64_t)v9);
    unsigned int v4 = *((_DWORD *)v11 + 6);
    CFArrayRef v5 = CFArrayCreate(0, v3, v4, MEMORY[0x263EFFF70]);
    *((_DWORD *)v11 + 6) = 0;
    if (v4)
    {
      for (unsigned int i = 0; i < v4; *((_DWORD *)v11 + 6) = i)
      {
        CFRelease(v3[i]);
        unsigned int i = *((_DWORD *)v11 + 6) + 1;
      }
    }
    free(v3);
    _Block_object_dispose(&v10, 8);
    return v5;
  }
  else
  {
    unsigned int v8 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    return CFArrayCreate(0, 0, 0, v8);
  }
}

uint64_t sub_22AF3CEB8(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  CFArrayRef v5 = &v4;
  uint64_t v6 = 0x2000000000;
  int v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = sub_22AF3D790;
  v3[3] = &unk_264883CA8;
  void v3[4] = &v4;
  sub_22AF3CF68(a1, (uint64_t)v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22AF3CF68(uint64_t a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a1 && *(void *)(a1 + 8))
  {
    unint64_t v4 = 0;
    uint64_t v5 = a1 + 16;
    do
    {
      uint64_t v6 = *(unsigned int *)(v4 + v5);
      unint64_t v7 = v4 + 4;
      if ((v6 - 1) > 1)
      {
        if (v6 > 9 || ((1 << v6) & 0x340) == 0)
        {
          uint64_t v8 = 4 * (v6 != 10);
          if (a2)
          {
LABEL_16:
            if (v8)
            {
              if (v6 != 1)
              {
                uint64_t v10 = (const void *)(v7 + v5);
                if (((v7 + v5) & 7) != 0)
                {
                  if (v8 >= 0x101)
                  {
                    size_t v11 = v8;
                    uint64_t v12 = (char *)malloc_type_malloc(v8, 0x44B52BDuLL);
                    goto LABEL_23;
                  }
LABEL_22:
                  size_t v11 = v8;
                  MEMORY[0x270FA5388]();
                  uint64_t v12 = (char *)v14 - ((v8 + 15) & 0x1FFFFFFF0);
                  bzero(v12, v8);
LABEL_23:
                  memcpy(v12, v10, v11);
LABEL_24:
                  if (v12) {
                    int v13 = v12;
                  }
                  else {
                    int v13 = (char *)(v7 + v5);
                  }
                  (*(void (**)(uint64_t, uint64_t, char *, uint64_t))(a2 + 16))(a2, v6, v13, v8);
                  if (v8 >= 0x101)
                  {
                    if (v12) {
                      free(v12);
                    }
                  }
                  goto LABEL_30;
                }
              }
            }
LABEL_21:
            uint64_t v12 = 0;
            goto LABEL_24;
          }
        }
        else
        {
          if (a2)
          {
            uint64_t v10 = (const void *)(v7 + v5);
            uint64_t v8 = 8;
            if (((v7 + v5) & 7) != 0) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
          LODWORD(v8) = 8;
        }
      }
      else
      {
        uint64_t v8 = *(unsigned int *)(v7 + v5);
        unint64_t v7 = v4 + 8;
        if (a2) {
          goto LABEL_16;
        }
      }
LABEL_30:
      unint64_t v4 = v7 + v8;
    }
    while (v4 < *(void *)(a1 + 8));
  }
}

CFDataRef sub_22AF3D13C(uint64_t a1, int a2, char *cStr, CFIndex length)
{
  CFDataRef result = _createObjectFromPrimitiveType(a2, cStr, length);
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(unsigned int *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8 + 1;
    *(void *)(v6 + 8 * v8) = result;
  }
  return result;
}

CFDictionaryRef CFDictionaryCreateWithDTXPrimitiveDictionary(uint64_t a1)
{
  CFDictionaryRef v1 = (CFDictionaryRef)a1;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unsigned int v2 = sub_22AF3CEB8(a1);
    if (v2 >= 2)
    {
      uint64_t v10 = 0;
      size_t v11 = &v10;
      uint64_t v12 = 0x2000000000;
      int v13 = 0;
      unint64_t v3 = 8 * (v2 >> 1);
      MEMORY[0x270FA5388]();
      uint64_t v4 = (v3 + 15) & 0x7FFFFFFF0;
      if (v3 >= 0x200) {
        size_t v5 = 512;
      }
      else {
        size_t v5 = v3;
      }
      bzero((char *)v9 - v4, v5);
      MEMORY[0x270FA5388]();
      bzero((char *)v9 - v4, v5);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = sub_22AF3D454;
      v9[3] = &unk_264883C58;
      v9[4] = &v10;
      v9[5] = (char *)v9 - v4;
      void v9[6] = (char *)v9 - v4;
      _DTXPrimitiveDictionaryEnumerate((uint64_t)v1, (uint64_t)v9);
      unsigned int v6 = *((_DWORD *)v11 + 6);
      CFDictionaryRef v1 = CFDictionaryCreate(0, (const void **)((char *)v9 - v4), (const void **)((char *)v9 - v4), v6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      *((_DWORD *)v11 + 6) = 0;
      if (v6)
      {
        for (unsigned int i = 0; i < v6; *((_DWORD *)v11 + 6) = i)
        {
          CFRelease(*(CFTypeRef *)((char *)&v9[i] - v4));
          CFRelease(*(CFTypeRef *)((char *)&v9[*((unsigned int *)v11 + 6)] - v4));
          unsigned int i = *((_DWORD *)v11 + 6) + 1;
        }
      }
      _Block_object_dispose(&v10, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t _DTXPrimitiveDictionaryGetCount(uint64_t a1)
{
  return sub_22AF3CEB8(a1) >> 1;
}

void _DTXPrimitiveDictionaryEnumerate(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x2000000000;
      v5[3] = 0;
      v3[0] = 0;
      v3[1] = v3;
      v3[2] = 0x2000000000;
      int v4 = 0;
      v2[0] = MEMORY[0x263EF8330];
      v2[1] = 0x40000000;
      v2[2] = sub_22AF3D66C;
      v2[3] = &unk_264883C80;
      v2[4] = a2;
      v2[5] = v3;
      v2[6] = v5;
      sub_22AF3CF68(a1, (uint64_t)v2);
      _Block_object_dispose(v3, 8);
      _Block_object_dispose(v5, 8);
    }
  }
}

CFDataRef sub_22AF3D454(CFDataRef result, const char *a2, int a3, char *a4, CFIndex a5)
{
  if (a2)
  {
    if (*a2)
    {
      CFDataRef v8 = result;
      *(void *)(*((void *)result + 5) + 8 * *(unsigned int *)(*(void *)(*((void *)result + 4) + 8) + 24)) = CFStringCreateWithCString(0, a2, 0x8000100u);
      CFDataRef result = _createObjectFromPrimitiveType(a3, a4, a5);
      *(void *)(*((void *)v8 + 6)
                + 8 * (*(_DWORD *)(*(void *)(*((void *)v8 + 4) + 8) + 24))++) = result;
    }
  }
  return result;
}

double DTXPrimitiveDictionaryCreate()
{
  v0 = malloc_type_realloc(0, 0x200uLL, 0x555093E9uLL);
  *(void *)&double result = 496;
  _OWORD *v0 = xmmword_22AF55150;
  return result;
}

void DTXPrimitiveDictionaryDestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

unint64_t *DTXPrimitiveDictionaryAddPrimitivePair(unint64_t *result, char *__s, int a3, ...)
{
  va_start(va, a3);
  if (result)
  {
    if (a3)
    {
      int v4 = result;
      if (*result)
      {
        unsigned int v6 = (unint64_t *)*result;
        if (__s)
        {
          size_t v7 = strlen(__s) + 1;
          CFDataRef v8 = v6;
          int v9 = 1;
          uint64_t v10 = __s;
        }
        else
        {
          CFDataRef v8 = (unint64_t *)*result;
          int v9 = 10;
          uint64_t v10 = 0;
          size_t v7 = 0;
        }
        size_t v11 = sub_22AF3CB48(v8, v9, v10, v7);
        void *v4 = v11;
        double result = sub_22AF3C934(v11, 1u, a3, (const char **)va);
        void *v4 = result;
      }
    }
  }
  return result;
}

unint64_t **DTXPrimitiveDictionaryAddBufferPair(unint64_t **result, char *__s, void *a3, size_t a4)
{
  if (result)
  {
    int v4 = result;
    size_t v5 = *result;
    if (*result)
    {
      if (__s)
      {
        size_t v9 = strlen(__s) + 1;
        uint64_t v10 = v5;
        int v11 = 1;
        uint64_t v12 = __s;
      }
      else
      {
        uint64_t v10 = *result;
        int v11 = 10;
        uint64_t v12 = 0;
        size_t v9 = 0;
      }
      int v13 = sub_22AF3CB48(v10, v11, v12, v9);
      void *v4 = v13;
      double result = (unint64_t **)sub_22AF3CB48(v13, 2, a3, a4);
      void *v4 = (unint64_t *)result;
    }
  }
  return result;
}

void *sub_22AF3D66C(void *result, int a2, uint64_t a3)
{
  unint64_t v3 = result;
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    double result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  else
  {
    if (a2 != 1) {
      a3 = 0;
    }
    *(void *)(*(void *)(result[6] + 8) + 24) = a3;
  }
  ++*(_DWORD *)(*(void *)(v3[5] + 8) + 24);
  return result;
}

uint64_t DTXPrimitiveArrayGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = *(_DWORD *)(result + 8) + 16;
    }
  }
  return result;
}

void *DTXPrimitiveArrayReferencingSerialized(void *result, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (!result || a2 < 0x10 || result[1] + 16 != a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "DTXPrimitiveArrayReferencingSerialized: unexpected bytes at %p of length %u, returning NULL\n", result, a2);
    return 0;
  }
  return result;
}

uint64_t DTXPrimitiveDictionaryGetSerialized(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (a2) {
      *a2 = *(_DWORD *)(result + 8) + 16;
    }
  }
  return result;
}

uint64_t sub_22AF3D790(uint64_t result)
{
  return result;
}

uint64_t sub_22AF3D8D8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

intptr_t sub_22AF3D960(intptr_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    intptr_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

uint64_t sub_22AF3DA64(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

intptr_t sub_22AF3DAEC(intptr_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    intptr_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

void *sub_22AF3DC64(void *result)
{
  uint64_t v1 = result[4];
  if (*(_DWORD *)(v1 + 40))
  {
    unint64_t v2 = result[7];
    uint64_t v3 = *(void *)(v1 + 24);
LABEL_9:
    *(void *)(v1 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3 + v2;
    ++*(_DWORD *)(result[4] + 36);
    uint64_t v6 = result[4];
    int v7 = *(_DWORD *)(v6 + 36);
    if (!v7)
    {
      *(_DWORD *)(v6 + 36) = 1;
      int v7 = *(_DWORD *)(result[4] + 36);
    }
    *(_DWORD *)(*(void *)(result[5] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7;
    goto LABEL_12;
  }
  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v2 = result[7];
  unint64_t v4 = *(void *)(v1 + 8);
  if (v2 >= v4) {
    uint64_t v5 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v5 = result[7];
  }
  if (v5 + v3 <= v4) {
    goto LABEL_9;
  }
  if (v2 <= *(void *)(v1 + 16))
  {
    ++*(_DWORD *)(v1 + 32);
    return result;
  }
LABEL_12:
  *(unsigned char *)(*(void *)(result[6] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t sub_22AF3DD7C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24) += *(void *)(result + 40);
  return result;
}

intptr_t sub_22AF3DE04(intptr_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  unint64_t v2 = *(void *)(result + 40);
  unint64_t v3 = *(void *)(v1 + 24);
  BOOL v4 = v3 >= v2;
  unint64_t v5 = v3 - v2;
  if (!v4) {
    unint64_t v5 = 0;
  }
  *(void *)(v1 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  uint64_t v6 = *(void *)(result + 32);
  if (*(_DWORD *)(v6 + 32))
  {
    intptr_t v7 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 56));
      --*(_DWORD *)(*(void *)(v7 + 32) + 32);
      uint64_t v6 = *(void *)(v7 + 32);
    }
    while (*(_DWORD *)(v6 + 32));
  }
  return result;
}

intptr_t sub_22AF3DEDC(intptr_t result)
{
  ++*(_DWORD *)(*(void *)(result + 32) + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(v1 + 32))
  {
    intptr_t v2 = result;
    do
    {
      double result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
      --*(_DWORD *)(*(void *)(v2 + 32) + 32);
      uint64_t v1 = *(void *)(v2 + 32);
    }
    while (*(_DWORD *)(v1 + 32));
  }
  return result;
}

uint64_t sub_22AF3DFB0(uint64_t result)
{
  return result;
}

uint64_t sub_22AF3E7DC(uint64_t a1)
{
  sub_22AF3E81C();
  unint64_t v3 = (void *)qword_26AD828D8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 setObject:v2 forKey:v4];
}

void sub_22AF3E81C()
{
  if ((byte_2683E3584 & 1) == 0)
  {
    v0 = (objc_class *)objc_opt_class();
    ImageName = (char *)class_getImageName(v0);
    intptr_t v2 = (objc_class *)objc_opt_class();
    sub_22AF3EBEC(ImageName, sel_schemes, v2, &unk_26DE3CFF0);
    byte_2683E3584 = 1;
  }
}

void sub_22AF3EBEC(char *a1, const char *a2, objc_class *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v30 = a4;
  intptr_t v7 = sub_22AF46754(a1);
  unsigned int outCount = 0;
  CFDataRef v8 = objc_copyClassNamesForImage(v7, &outCount);
  size_t v9 = qword_26AD828A8;
  if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = "<nil image?>";
    if (v7) {
      uint64_t v10 = v7;
    }
    *(_DWORD *)buf = 136315394;
    v35 = v10;
    __int16 v36 = 1024;
    unsigned int v37 = outCount;
    _os_log_impl(&_dtx_internal_logger, v9, OS_LOG_TYPE_DEBUG, "scanning image %s (%u classes)", buf, 0x12u);
  }
  if (outCount)
  {
    unint64_t v11 = 0;
    uint64_t v12 = "<nil className>";
    int v13 = "checking class %s";
    v31 = a2;
    do
    {
      uint64_t v14 = qword_26AD828A8;
      if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = v8[v11];
        if (!v15) {
          uint64_t v15 = v12;
        }
        *(_DWORD *)buf = 136315138;
        v35 = v15;
        _os_log_impl(&_dtx_internal_logger, v14, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
      }
      id v16 = v8[v11];
      if (!v16) {
        goto LABEL_30;
      }
      Class = objc_getClass(v16);
      Method ClassMethod = class_getClassMethod(Class, a2);
      if (!ClassMethod) {
        goto LABEL_30;
      }
      Method v19 = ClassMethod;
      BOOL v20 = Class != 0;
      if (Class && Class != a3)
      {
        Superclass = Class;
        do
        {
          Superclass = class_getSuperclass(Superclass);
          BOOL v20 = Superclass != 0;
        }
        while (Superclass && Superclass != a3);
      }
      if (!v20) {
        goto LABEL_30;
      }
      v22 = v13;
      long long v23 = v12;
      *(_DWORD *)buf = 0;
      v24 = object_getClass(Class);
      v25 = class_copyMethodList(v24, (unsigned int *)buf);
      v26 = v25;
      uint64_t v27 = *(unsigned int *)buf;
      v28 = v25;
      if (*(_DWORD *)buf)
      {
        while (*v28 != v19)
        {
          ++v28;
          if (!--v27) {
            goto LABEL_28;
          }
        }
        v29 = qword_26AD828A8;
        if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&_dtx_internal_logger, v29, OS_LOG_TYPE_DEBUG, "selector matched for class, calling block", v32, 2u);
        }
        v30[2](v30, Class);
      }
      else if (!v25)
      {
        goto LABEL_29;
      }
LABEL_28:
      free(v26);
LABEL_29:
      uint64_t v12 = v23;
      int v13 = v22;
      a2 = v31;
LABEL_30:
      ++v11;
    }
    while (v11 < outCount);
  }
  if (v8) {
    free(v8);
  }
}

uint64_t sub_22AF3EEA4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t result = [a2 _objc_msgSend_automaticallyRegistersCapabilities:(const char *)a2, a3];
  if (result)
  {
    uint64_t v6 = (void *)qword_26AD828A8;
    if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_INFO))
    {
      CFDataRef v8 = v6;
      NSStringFromClass((Class)a2);
      id v9 = objc_claimAutoreleasedReturnValue();
      int v12 = 136315138;
      uint64_t v13 = [v9 UTF8String];
      _os_log_impl(&_dtx_internal_logger, v8, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v12, 0xCu);
    }
    return [a2 registerCapabilities:v7 withCompletion:*(void *)(a1 + 32)];
  }
  return result;
}

uint64_t sub_22AF3EF90(uint64_t a1, objc_class *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)qword_26AD828A8;
  if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v4;
    NSStringFromClass(a2);
    id v7 = objc_claimAutoreleasedReturnValue();
    int v11 = 136315138;
    uint64_t v12 = [v7 UTF8String];
    _os_log_impl(&_dtx_internal_logger, v6, OS_LOG_TYPE_INFO, "registering capabilities: %s", (uint8_t *)&v11, 0xCu);
  }
  return [a2 registerCapabilities:v5 withCompletion:*(void *)(a1 + 32)];
}

uint64_t sub_22AF3F18C(uint64_t a1, const char *a2)
{
  return [*(void **)(a1 + 32) receiveQueueSetCompressionHint:a2 onChannel:*(unsigned int *)(a1 + 48)];
}

void sub_22AF3F2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF3FB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF3FBAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + --*(_DWORD *)(*(void *)(result + 32) + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

void sub_22AF3FBBC(uint64_t a1)
{
}

void sub_22AF3FBC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = [v3 v5:v6];
  [v4 performSelector:v8 withObject:v7];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(NSObject **)(v9 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_22AF3FC9C;
  v12[3] = &unk_264883D98;
  uint64_t v15 = *(void *)(a1 + 48);
  v12[4] = v9;
  id v13 = v3;
  id v14 = *(id *)(a1 + 32);
  id v11 = v3;
  dispatch_async(v10, v12);
}

uint64_t sub_22AF3FC9C(uint64_t a1, const char *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) == *(void *)(*(void *)(a1 + 32) + 160))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    return MEMORY[0x270F9A6D0](v8, sel__routeMessage_, v7);
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    uint64_t v5 = [*(void **)(a1 + 40) performSelector:a2 withObject:a3];
    return [v3 autoreleaseWithZone:v4 size:v5];
  }
}

uint64_t sub_22AF3FD18(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__handleMessageParseException_forChannelCode_messageID_fragmentCount_withPayloadBytes_ofLength_, a2);
}

void sub_22AF40428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF40448(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(void **)(*(void *)(a1 + 32) + 32) dataReceivedHandler:a2 withData:a3];

  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + --*(_DWORD *)(*(void *)(result + 32) + 40) = @"Unable to publish capabilities after connection has been resumed.";
    goto LABEL_3;
  }
  uint64_t v24 = *(int *)(a1 + 64);
  if ((int)v24 <= 0)
  {
    uint64_t v39 = [NSString stringWithFormat:@"Invalid version number for capability \"%@\": %ld not in one-sided range [0, INT_MAX."], *(void *)(a1 + 40), v24);
    uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v40 + 40);
    *(void *)(v40 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v39;
    goto LABEL_3;
  }
  [*(void **)(*(void *)(a1 + 32) + 104) objectForKey:v5];
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [*(void **)(*(void *)(a1 + 32) + 112) objectForKey:v25];
  uint64_t v7 = v48;
  if (!v48) {
    goto LABEL_3;
  }
  uint64_t v28 = v26;
  int v29 = [v48 intValue];
  uint64_t v32 = *(int *)(a1 + 64);
  if (v29 != v32 && v28 == *(void *)(a1 + 56))
  {
    v41 = NSString;
    uint64_t v42 = *(void *)(a1 + 40);
    uint64_t v47 = [v48 integerValue];
    [v41 stringWithFormat:@"Version mismatch for capability \"%@\" with service class \"%@\": %ld vs. %ld.", v42, v28, v32, v47];
    goto LABEL_20;
  }
  if ([v48 _intValueWithSelector:v30 withArgument:v31] == *(_DWORD *)(a1 + 64) && v28 != *(void *)(a1 + 56))
  {
    v35 = NSString;
    uint64_t v36 = *(void *)(a1 + 40);
    uint64_t v37 = [v48 integerValue];
    [v35 stringWithFormat:@"Class mismatch for capability \"%@\" with version %ld: \"%@\" vs. \"%@\".", v36, v37, v28, *(void *)(a1 + 56)];
    uint64_t v44 = LABEL_20:;
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v44;
  }
  if ([v48 performSelector:v33 withObject:v34] <= *(_DWORD *)(a1 + 64))
  {
    uint64_t v7 = v48;
LABEL_3:

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v8 = (void *)qword_26AD828A8;
      if (os_log_type_enabled((os_log_t)qword_26AD828A8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void **)(a1 + 32);
        id v11 = v8;
        LODWORD(v10) = [v10 _atomicConnectionNumber:v12 withTransitionContext:v13];
        uint64_t v14 = *(void *)(a1 + 40);
        int v15 = *(_DWORD *)(a1 + 64);
        uint64_t v16 = NSStringFromClass(*(Class *)(a1 + 56));
        id v17 = (void *)v16;
        uint64_t v18 = @"none";
        *(_DWORD *)buf = 67109890;
        int v50 = (int)v10;
        if (v16) {
          uint64_t v18 = (__CFString *)v16;
        }
        __int16 v51 = 2114;
        uint64_t v52 = v14;
        __int16 v53 = 1024;
        int v54 = v15;
        __int16 v55 = 2114;
        v56 = v18;
        _os_log_impl(&_dtx_internal_logger, v11, OS_LOG_TYPE_INFO, "x%d \"%{public}@\" v%u (%{public}@)", buf, 0x22u);
      }
      Method v19 = *(void **)(*(void *)(a1 + 32) + 104);
      BOOL v20 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
      [v19 setObject:v21 forKey:(uint64_t)v20];

      uint64_t v23 = *(void *)(a1 + 56);
      if (v23) {
        [*(void **)(*(void *)(a1 + 32) + 112) setObject:v22 forKey:v23];
      }
    }
    return;
  }
}

void sub_22AF4085C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = [*(void **)(*(void *)(a1 + 32) + 104) a2:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v4;
}

void sub_22AF409C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF409DC(uint64_t a1, const char *a2, uint64_t a3)
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate:a2:a3];
  double v7 = 0.0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (unint64_t *)&v7, *(unint64_t *)&v6);
  if (v7 == 0.0)
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF40B34;
    block[3] = &unk_264883CD0;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 56);
    dispatch_after(v8, v9, block);
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 40);
    double v11 = v6 - v7;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    [NSNumber numberWithDouble:v4];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v10 invokeCompletionWithReturnValue:v12 error:v13];
  }
}

void sub_22AF40B34(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 invokeCompletionWithReturnValue:v4 error:v5];
}

void sub_22AF40CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_22AF40CBC(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  id v5 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v5);
}

void sub_22AF40DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF40E00(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 32);
  if (!*(void *)(v4 + 120))
  {
    uint64_t result = [*(void **)(v4 + 32) a2:a3];
    if (result == 2)
    {
      uint64_t v7 = [MEMORY[0x263EFF9D0] v5:v6];
      uint64_t v8 = *(void *)(v3 + 32);
      uint64_t v9 = *(void **)(v8 + 120);
      *(void *)(v8 + 120) = v7;

      uint64_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(v3 + 32) + 152));
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(v3 + 32) + 120) == 0;
  return result;
}

void sub_22AF40FC0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = [*(void **)(*(void *)(a1 + 32) + 32) dataReceivedHandler:a2 withData:a3];

  if (v4) {
    [MEMORY[0x263EFF940] DTXConnectionException:@"Unable to register capability override blocks after connection has been resumed."];
  }
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 128);
    *(void *)(v8 + 128) = v7;

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  id v11 = (id)MEMORY[0x230F36B10](*(void *)(a1 + 40));
  [v6 addObject:(id)v11];
}

void sub_22AF41190(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if ([a3 intValue] == 0x80000000) {
    [*(void **)(a1 + 32) addObject:v7];
  }
}

void sub_22AF412A8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 184))
  {
    id v5 = [*(void **)(a1 + 32) descriptionWithLocale:a2 indent:a3];
    sub_22AF41470("resuming", (void *)v4, 0, v5);

    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v6 = [*(void **)(v4 + 32) dataReceivedHandler:a2 withData:a3];
  if (v6)
  {
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 72))
    {
      if (([v9 _supportedDirections:v7 withTransitionContext:v8] & 0xFFFFFFFE) == 2)
      {
        id v11 = *(void **)(*(void *)(a1 + 32) + 104);
        uint64_t v12 = [NSNumber numberWithInt:1];
        [v11 setObject:v13 forKey:(uint64_t)v12];

        [*(void **)(*(void *)(a1 + 32) + 104) setObject:v14 forKey:@"com.apple.private.DTXBlockCompression"];
        uint64_t v16 = [DTXMessage _notifyOfPublishedCapabilities:*(void *)(*(void *)(a1 + 32) + 104)];
        [*(void **)(a1 + 32) sendControlAsync:v17 replyHandler:v16];
      }
      id v18 = *(id *)(*(void *)(a1 + 32) + 160);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_22AF416C8;
      v22[3] = &unk_264883EB0;
      id v23 = v18;
      Method v19 = *(void **)(*(void *)(a1 + 32) + 32);
      id v20 = v18;
      [v19 setDataReceivedHandler:v21];
    }
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
}

void sub_22AF41470(const char *a1, void *a2, void *a3, void *a4)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = (void *)MEMORY[0x230F368A0]();
  if (!v9)
  {
    [kDTXInterruptionMessage descriptionWithLocale:v10 indent:v11];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v13 = [v8 v10:v11];
  int v16 = v13;
  if (v13 >= 0) {
    int v17 = v13;
  }
  else {
    int v17 = -v13;
  }
  int v18 = [v7 _atomicConnectionNumber:v14 withTransitionContext:v15];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate:v19, v20];
  double v22 = v21;
  id v23 = (void *)qword_26AD828D0;
  if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_INFO))
  {
    double v24 = v22 - *(double *)&qword_26AD828A0;
    if (v16 >= 0) {
      v25 = "";
    }
    else {
      v25 = "f";
    }
    uint64_t v44 = v25;
    int v26 = v18;
    id v27 = v8;
    int v28 = v17;
    id v29 = v7;
    v30 = v12;
    uint64_t v31 = a1;
    id v32 = v9;
    v33 = v23;
    uint64_t v34 = v32;
    a1 = v31;
    uint64_t v12 = v30;
    id v7 = v29;
    int v17 = v28;
    id v8 = v27;
    int v18 = v26;
    *(_DWORD *)buf = 134219266;
    double v46 = v24;
    __int16 v47 = 1024;
    int v48 = v26;
    __int16 v49 = 2080;
    int v50 = a1;
    __int16 v51 = 1024;
    int v52 = v17;
    __int16 v53 = 2080;
    int v54 = v44;
    __int16 v55 = 2080;
    uint64_t v56 = [v34 v35:v36];
    _os_log_impl(&_dtx_internal_logger, v33, OS_LOG_TYPE_INFO, "%3.6f x%d %8s [c%d%s]: %s\n", buf, 0x36u);
  }
  uint64_t v37 = (FILE *)qword_2683E3570;
  if (qword_2683E3570)
  {
    double v38 = v22 - *(double *)&qword_26AD828A0;
    if (v16) {
      uint64_t v39 = "f";
    }
    else {
      uint64_t v39 = "";
    }
    id v40 = v9;
    v43 = (const char *)[v40 UTF8String];
    fprintf(v37, "%3.6f x%d %8s [c%d%s]: %s\n", v38, v18, a1, v17, v39, v43);
  }
}

uint64_t sub_22AF416C8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_parseIncomingBytes_length_, a2);
}

void sub_22AF41780(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x230F36B10](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = v2;
}

void sub_22AF4191C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[9];
  if (!v5)
  {
    v25 = *(void **)(a1 + 40);
    if (!v25) {
      return;
    }
    int v26 = (void *)v4[22];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_22AF41B4C;
    v32[3] = &unk_264883ED8;
    id v33 = v25;
    [v26 _scheduleBlock_:v27 withBlock:v32];
    double v24 = v33;
    goto LABEL_8;
  }
  if (!v4[15])
  {
    uint64_t v6 = [NSDictionary dictionaryWithObjects:a2 forKeys:a3];
    [v4 _notifyOfPublishedCapabilities:v7 withTransitionContext:(uint64_t)v6];

    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = (void *)v4[9];
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_22AF41B60;
  v31[3] = &unk_264883F00;
  v31[4] = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:a2];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 80);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_22AF41B70;
  v30[3] = &unk_264883F00;
  v30[4] = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 72);
  *(void *)(v11 + 72) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 80);
  *(void *)(v13 + 80) = 0;

  uint64_t v15 = *(void *)(a1 + 32);
  int v16 = *(void **)(v15 + 192);
  *(void *)(v15 + 192) = 0;

  uint64_t v17 = *(void *)(a1 + 32);
  int v18 = *(void **)(v17 + 96);
  *(void *)(v17 + 96) = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  double v21 = *(void **)(a1 + 40);
  if (v21)
  {
    id v23 = *(NSObject **)(v22 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF41BC8;
    block[3] = &unk_264883940;
    void block[4] = v22;
    id v29 = v21;
    dispatch_async(v23, block);
    double v24 = v29;
LABEL_8:

    return;
  }
  [*(void **)(v22 + 32) disconnectWithTransitionContext:v19 completion:v20];
}

uint64_t sub_22AF41B4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22AF41B60(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) scheduleMessage:a2 toChannel:0];
}

void sub_22AF41B70(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [v7 resumeWithError:v4];
  [*(void **)(a1 + 32) scheduleMessage:v6 toChannel:0];
}

void sub_22AF41BC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22AF41C5C;
  v4[3] = &unk_264883F50;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 40);
  [v2 _serializedDisconnect:v3];
}

void sub_22AF41C5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF41D18;
  block[3] = &unk_264883F28;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void sub_22AF41D18(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = [*(void **)(*(void *)(a1 + 32) + 160) parsingComplete:a2 withTransitionContext:a3];
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (object_getClass(v5) != (Class)MEMORY[0x263EF8708]) {
      sub_22AF52EEC();
    }
    id v8 = v6;
    uint64_t v11 = (const void *)[v8 v9:v10];
    size_t v14 = [v8 length];
    xpc_dictionary_set_data(v5, "__DTXTransport_preflightdata", v11, v14);
  }

  uint64_t v15 = *(void *)(a1 + 32);
  int v16 = *(void **)(v15 + 160);
  *(void *)(v15 + 160) = 0;

  uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 176);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_22AF41E70;
  v19[3] = &unk_264883BE0;
  id v21 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  [v17 scheduleBlock:v18 withPriority:v19];
}

uint64_t sub_22AF41E70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_22AF423D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v5 = [*(void **)(*(void *)(a1 + 32) + 168) fragmentsForLength:v4];
  BOOL v7 = *(id *)(*(void *)(a1 + 32) + 16);
  if (*(unsigned char *)(a1 + 96))
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    id v8 = *(id *)(*(void *)(a1 + 32) + 24);

    BOOL v7 = v8;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    id v9 = (void *)MEMORY[0x230F36B10](v3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22AF426B8;
    block[3] = &unk_264883940;
    void block[4] = *(void *)(a1 + 32);
    id v37 = v9;
    id v10 = v9;
    dispatch_async(v7, block);
  }
  if (*(void *)(a1 + 40) == kDTXBarrierMessage
    || ![v6 addHandler:v3 channel:*(unsigned int *)(a1 + 80) message:*(void *)(a1 + 48)]|| (uint64_t v11 = *(void **)(a1 + 40), v11 == (void *)qword_26AD82898))
  {
    if (*(unsigned char *)(a1 + 96)) {
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    }
    uint64_t v17 = *(void *)(a1 + 72);
    if (v17) {
      [*(void **)(*(void *)(a1 + 32) + 136) releaseSize:v6];
    }
  }
  else
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    int v35 = 0;
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = sub_22AF42724;
    id v32 = sub_22AF42750;
    id v33 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_22AF42758;
    v18[3] = &unk_264883FA0;
    v18[4] = *(void *)(a1 + 32);
    id v12 = v11;
    long long v25 = *(_OWORD *)(a1 + 80);
    id v19 = v12;
    uint64_t v22 = v34;
    id v23 = &v28;
    int v26 = v5;
    char v27 = *(unsigned char *)(a1 + 96);
    uint64_t v24 = *(void *)(a1 + 72);
    id v20 = *(id *)(a1 + 56);
    uint64_t v13 = v7;
    id v21 = v13;
    uint64_t v14 = MEMORY[0x230F36B10](v18);
    uint64_t v15 = (void *)v29[5];
    v29[5] = v14;

    if (*(void *)(a1 + 56)) {
      int v16 = 1;
    }
    else {
      int v16 = v5;
    }
    for (; v16; --v16)
      dispatch_async(v13, (dispatch_block_t)v29[5]);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);
  }
}

uint64_t sub_22AF426B8(uint64_t a1, const char *a2)
{
  [*(void **)(*(void *)(a1 + 32) + 32) transmitOfLength:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t sub_22AF42724(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F36B10](*(void *)(a2 + 40));
  *(void *)(a1 + --*(_DWORD *)(*(void *)(result + 32) + 40) = result;
  return result;
}

void sub_22AF42750(uint64_t a1)
{
}

void sub_22AF42758(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = *(void **)(v4 + 168);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_22AF428AC;
  v14[3] = &unk_264883F78;
  v14[4] = v4;
  [v5 transmitMessage:a2 routingInfo:v3 fragment:*(void *)(a1 + 88) transmitter:*(void *)(a1 + 96)];
  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == *(_DWORD *)(a1 + 104))
  {
    if ((*(unsigned char *)(a1 + 100) & 1) != 0
      || *(_DWORD *)(a1 + 92)
      || [*(void **)(a1 + 40) performSelector:v7 withObject:v8 withObject:nil];
    {
      [*(void **)(*(void *)(a1 + 32) + 32) transmitOfLength:0];
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;

    if (*(unsigned char *)(a1 + 108)) {
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    }
    uint64_t v12 = *(void *)(a1 + 80);
    if (v12) {
      [*(void **)(*(void *)(a1 + 32) + 136) releaseSize:v11 withTransitionContext:v12];
    }
    uint64_t v13 = *(NSObject **)(a1 + 48);
    if (v13) {
      dispatch_semaphore_signal(v13);
    }
  }
  else if (*(void *)(a1 + 48))
  {
    dispatch_async(*(dispatch_queue_t *)(a1 + 56), *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
}

uint64_t sub_22AF428AC(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result = [*(void **)(*(void *)(a1 + 32) + 32) transmit:a2 ofLength:a3];
  if (result != a3)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v8 disconnectWithError:v6];
  }
  return result;
}

void sub_22AF42910(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  if (!v4) {
    sub_22AF52F18();
  }
  int v5 = (void (**)(void, void))v4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_22AF3FBAC;
  int v16 = sub_22AF3FBBC;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22AF468EC;
  v9[3] = &unk_264884240;
  uint64_t v11 = &v12;
  uint64_t v7 = v6;
  id v10 = v7;
  uint64_t v8 = (void *)MEMORY[0x230F36B10](v9);
  ((void (**)(void, void *))v5)[2](v5, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v3) {
    v3[2](v3, v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void sub_22AF42A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF42BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF42C18(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v4)
  {
    a3 = *(unsigned int *)(a1 + 72);
    if (a3)
    {
      int v5 = [NSNumber numberWithInt:a2];
      uint64_t v7 = [v4 objectForKey:v6];

      if (v7 != *(void **)(a1 + 40)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v9 = *(void **)(v8 + 88);
    id v15 = (id)MEMORY[0x230F36B10](*(void *)(a1 + 56));
    [v9 setObject:v10 forKey:(uint64_t)v15];
  }
  else
  {
    if (*(unsigned char *)(v8 + 184))
    {
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v12 = sub_22AF42D68(*(unsigned int *)(a1 + 76), a2, a3);
      sub_22AF41470(" handler", (void *)v8, v11, v12);
    }
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    [v13 scheduleMessage:a2 withHandler:v14];
  }
}

id sub_22AF42D68(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = [DTXMessage a2:a3];
  [v4 setErrorStatus:2];
  [v4 setIdentifier:a1];
  [kDTXInterruptionMessage makeImmutable];
  uint64_t v11 = [v4 descriptionWithLocale:v9 indent:v10];

  return v11;
}

void sub_22AF43458(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 newReplyWithTransitionContext:a3];
  [*(void **)(a1 + 32) sendMessage:v4 fromChannel:(uint64_t)v5 sendMode:2 syncWithReply:0 replyHandler:0];
}

void sub_22AF434B8(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  id v5 = (void *)MEMORY[0x230F36B10](a3);
  uint64_t v8 = [v17 unsignedLongLongValueForSelector:v6];
  if ([*(void **)(a1 + 32) respondsToSelector:v9 withArguments:v10] == HIDWORD(v8))
  {
    [*(void **)(a1 + 40) removeObjectForKey:v11];
    uint64_t v14 = *(unsigned char **)(a1 + 48);
    if (v14[184])
    {
      id v15 = *(void **)(a1 + 32);
      int v16 = sub_22AF42D68(v8, v12, v13);
      sub_22AF41470(" handler", v14, v15, v16);
    }
    [*(void **)(a1 + 32) scheduleMessage:v12 tracker:*(void *)(a1 + 56) handler:0];
  }
}

void sub_22AF437C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22AF437F0(uint64_t *a1, const char *a2)
{
  uint64_t v3 = a1[4];
  int v4 = *(_DWORD *)(v3 + 64);
  *(_DWORD *)(v3 + 64) = v4 + 1;
  *(_DWORD *)(*(void *)(a1[6] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [DTXChannel alloc];
  uint64_t v7 = [v5 initWithConnection:v6 channelIdentifier:a1[4] label:*(unsigned int *)(*(void *)(a1[6] + 8) + 24)];
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v7;

  [*(void **)(a1[4] + 72) setObject:v10 forKey:*(void *)(*(void *)(a1[7] + 8) + 40) withCompletion:v11];
}

uint64_t sub_22AF438B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t result = [a2 performSelector:(const char *)a2 withObject:a3];
  if (result)
  {
    id v5 = qword_26AD828D0;
    if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = @"nil";
      uint64_t v9 = *(void *)(a1 + 40);
      if (*(void *)(a1 + 32)) {
        uint64_t v8 = *(__CFString **)(a1 + 32);
      }
      int v10 = 138543618;
      id v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&_dtx_internal_logger, v5, OS_LOG_TYPE_ERROR, "Connection peer refused channel request for \"%{public}@\"; channel canceled %@",
        (uint8_t *)&v10,
        0x16u);
    }
    return [*(void **)(a1 + 40) performSelector:v6 withObject:v7];
  }
  return result;
}

void sub_22AF43B30(uint64_t a1, const char *a2, uint64_t a3)
{
  int v4 = NSNumber;
  uint64_t v5 = [*(void **)(a1 + 32) a2:a3];
  [v4 numberWithInt:v5];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [*(void **)(*(void *)(a1 + 40) + 80) objectForKey:v7];
  id v11 = v8;
  if (v8)
  {
    if (*(void **)(a1 + 32) != v8) {
      sub_22AF52F44();
    }
    [v8 resumeWithCompletion:v9];
    uint64_t v12 = 80;
  }
  else
  {
    uint64_t v12 = 72;
  }
  [*(void **)(*(void *)(a1 + 40) + v12) removeObjectForKey:v9];
  [*(void **)(a1 + 40) scheduleMessage:v13 toChannel:0 withCompletion:*(void *)(a1 + 32)];
}

void sub_22AF440A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_22AF440D0(uint64_t a1)
{
  uint64_t v2 = [DTXProxyChannel alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_semaphore_t v6 = [*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40) v4:v5];
  uint64_t v9 = [*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performSelector:v7 withObject:v8];
  id v14 = [v2 initWithChannel:v10 remoteProtocol:v3 localProtocol:v6];

  [*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performSelector:v11 withObject:v12];
  uint64_t v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))v13)[2](v13, v14);
}

uint64_t sub_22AF441A8(void *a1, const char *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  uint64_t v5 = [*(void **)(a1[6] + 112) objectForKey:a2];
  dispatch_semaphore_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v6(v4, v2, v3, v5);
}

uint64_t sub_22AF44318(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void sub_22AF44518(void *a1, uint64_t a2)
{
  id v6 = a1;
  if ([v6 _compressionTypeHint:v3 withOptions:v4] == YES) {
    [v6 setCompressionTypeHint:a2];
  }
}

void sub_22AF44BC8(uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [DTXProxyRequestHandler alloc];
  uint64_t v4 = [v2 initWithPublishedProtocol:a1[4] publishedProtocolName:a1[5] peerProtocol:a1[6] peerProtocolName:a1[7] handlerBlock:a1[9]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1[8] + 96);
  uint64_t v7 = [v5 countByEnumeratingWithState:v6 objects:&v13 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v5);
        }
        if ([v13 _matchesPublishedProtocolName_peerProtocolName_:v8 peerProtocolName:a1[5] publishedProtocolName:a1[7]] && ![v13 _raise_format_:MEMORY[0x263EFF940] format:@"DTXConnectionException" format:@"Proxy handler already exists for protocol pair specified."]) {
        ++v11;
        }
      }
      while (v9 != v11);
      uint64_t v9 = [v5 countByEnumeratingWithState:v8 objects:&v13 count:16];
    }
    while (v9);
  }

  [*(void **)(a1[8] + 96) addObject:v12];
}

uint64_t sub_22AF45480(uint64_t a1, const char *a2)
{
  [*(void **)(a1 + 32) setIsCanceled:a2];
  [*(void **)(a1 + 32) setMessageHandler:v3];
  id v5 = *(void **)(a1 + 32);

  return [v5 setDispatchTarget:v4];
}

void sub_22AF454D0(uint64_t a1)
{
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x230F368A0]();
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = *(void **)(a1 + 32);
  if (v5 && (*((void *)&v34 + 1) = objc_msgSend__callbackSnapshot(v5, v2, v3), 1))
  {
    id v6 = pthread_getspecific(qword_26AD828B0);
    pthread_setspecific(qword_26AD828B0, *(const void **)(a1 + 32));
    uint64_t v8 = v34;
    if ((void)v34)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3254779904;
      id v29 = sub_22AF4576C;
      uint64_t v30 = &unk_26DE3CFC0;
      id v31 = *(id *)(a1 + 40);
      sub_22AF4578C(v33, (uint64_t)&v34);
      uint64_t v32 = *(void *)(a1 + 32);
      dispatch_sync(v8, &v27);
      sub_22AF457E8((uint64_t)v33);
    }
    else
    {
      [*(void **)(a1 + 40) invokeWithTarget:v7 replyChannel:*(uint64_t *)&v34 + 1 validator:*(void *)(a1 + 32) replyChannel:*(void *)&v35 + 1];
    }
    pthread_setspecific(qword_26AD828B0, v6);
  }
  else if ([v2 respondsToSelector:v3]) {
         && ([*(void **)(a1 + 32) _isCanceled:v9 withTransitionContext:v10] == NO)
  }
  {
    uint64_t v11 = [MEMORY[0x263EFF940] _DTXMissingDispatchTargetException:@"Unable to invoke message - channel has no dispatch target"];
    uint64_t v12 = *(void **)(a1 + 40);
    long long v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    long long v16 = [v11 descriptionWithLocale:v14 indent:v15];
    v37[0] = v16;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v17 forKeys:v37 count:1];
    id v20 = [v13 _errorWithDomain:v19 code:1 userInfo:v18];
    uint64_t v22 = [v12 newReplyWithError:v21];

    [*(void **)(a1 + 48) sendMessage:v23 fromChannel:(uint64_t)v22 sendMode:2 syncWithReply:0 replyHandler:0];
  }
  uint64_t v24 = *(void **)(a1 + 56);
  uint64_t v25 = [*(void **)(a1 + 40) v9:v10:v27:v28:v29:v30];
  [v24 releaseSize:v26];
  sub_22AF457E8((uint64_t)&v34);
}

void sub_22AF45744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_22AF457E8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF4576C(uint64_t a1, const char *a2)
{
  return [*(void **)(a1 + 32) invokeWithTarget:*(void *)(a1 + 56) replyChannel:*(void *)(a1 + 40) validator:*(void *)(a1 + 72)];
}

uint64_t sub_22AF45780(uint64_t a1, uint64_t a2)
{
  return sub_22AF4578C((void *)(a1 + 48), a2 + 48);
}

uint64_t sub_22AF4578C(void *a1, uint64_t a2)
{
  *a1 = *(id *)a2;
  a1[1] = *(id *)(a2 + 8);
  a1[2] = MEMORY[0x230F36B10](*(void *)(a2 + 16));
  uint64_t result = MEMORY[0x230F36B10](*(void *)(a2 + 24));
  a1[3] = result;
  return result;
}

void sub_22AF457E0(uint64_t a1)
{
}

void sub_22AF457E8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

void sub_22AF45834(uint64_t a1, const char *a2, uint64_t a3)
{
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 callbackSnapshot:a2, a3, v21];
  }
  id v5 = pthread_getspecific(qword_26AD828B0);
  pthread_setspecific(qword_26AD828B0, *(const void **)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    int isCanceled = [*(void **)(a1 + 32) isCanceled:v6 withTransitionContext:v7];
    uint64_t v10 = (uint64_t *)(a1 + 40);
    if (isCanceled) {
      uint64_t v10 = &kDTXInterruptionMessage;
    }
    goto LABEL_9;
  }
  uint64_t v8 = v22;
  if ((void)v22)
  {
    uint64_t v10 = (uint64_t *)(a1 + 40);
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, *v10);
    goto LABEL_10;
  }
  if ([*(void **)(*(void *)(a1 + 32) + 24) v6:v7])
  {
    uint64_t v18 = *(void **)(a1 + 32);
    id v19 = (void *)v18[3];
    id v20 = [*(void **)(a1 + 40) descriptionWithLocale:v16 indent:v17];
    sub_22AF41470("dropped message (no message handler)", v19, v18, v20);
  }
LABEL_10:
  pthread_setspecific(qword_26AD828B0, v5);
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v14 = [*(void **)(a1 + 40) v12:v13];
  [v11 releaseSize:v15 with:v14];
  sub_22AF457E8((uint64_t)&v21);
}

void sub_22AF45954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_22AF45A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  sub_22AF457E8(v7);
  _Unwind_Resume(a1);
}

void *sub_22AF45A70(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0;
  result[6] = v2;
  uint64_t v3 = a2[7];
  a2[7] = 0;
  result[7] = v3;
  uint64_t v4 = a2[8];
  a2[8] = 0;
  result[8] = v4;
  uint64_t v5 = a2[9];
  a2[9] = 0;
  result[9] = v5;
  return result;
}

void sub_22AF45AA4(uint64_t a1)
{
}

void sub_22AF45AAC(os_unfair_lock_s *a1, void *a2)
{
  uint64_t v3 = a1 + 10;
  uint64_t v4 = a2;
  uint64_t v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4, (uint64_t)&v5[14]);

  os_unfair_lock_unlock(v3);
}

void sub_22AF45B30(uint64_t a1, uint64_t a2)
{
}

void sub_22AF45B40(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  uint64_t v4 = MEMORY[0x230F36B10](*(void *)(a2 + 16));
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;

  uint64_t v6 = MEMORY[0x230F36B10](*(void *)(a2 + 24));
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
}

void sub_22AF45CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF45CC4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) != *(void *)(a2 + 16))
  {
    id v14 = (id)MEMORY[0x230F36B10]();
    if ([*(void **)(a1 + 32) isCanceled:v4 withTransitionContext:v5])
    {
      uint64_t v7 = v14;
      if (v14)
      {
        [*(void **)(a1 + 32) scheduleMessage:v6 withTracker:0 handler:0];
        uint64_t v7 = v14;
      }

      id v14 = 0;
    }
    if (*(void *)(a2 + 16))
    {
      [*(void **)(a1 + 32) scheduleMessage:v6];
      uint64_t v8 = *(void *)(a2 + 16);
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = MEMORY[0x230F36B10](v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v9;

    uint64_t v12 = MEMORY[0x230F36B10](v14);
    uint64_t v13 = *(void **)(a2 + 16);
    *(void *)(a2 + 16) = v12;
  }
}

void sub_22AF45EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF45EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int isCanceled = [*(void **)(a1 + 32) isCanceled:a2 with:a3];
  char v6 = isCanceled;
  if (isCanceled)
  {
    uint64_t v7 = *(void **)(a2 + 8);
LABEL_4:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
    if (v6) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = *(void **)(a1 + 40);
    }
    objc_storeStrong((id *)(a2 + 8), v8);
    goto LABEL_8;
  }
  uint64_t v7 = *(void **)(a2 + 8);
  if (*(void **)(a1 + 40) != v7) {
    goto LABEL_4;
  }
LABEL_8:
  uint64_t v9 = *(void **)(a1 + 48);

  objc_storeStrong((id *)a2, v9);
}

void sub_22AF46030(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x230F36B10](*(void *)(a1 + 32));
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
}

uint64_t sub_22AF4612C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22AF46234(uint64_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)qword_26AD828D0;
  if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    char v6 = NSStringFromClass(v5);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2082;
    Name = sel_getName(a2);
    _os_log_impl(&_dtx_internal_logger, v4, OS_LOG_TYPE_ERROR, "Warning: called -[%{public}@ %{public}s] with NULL replyHandler!\nThe caller will not block synchronously on this call as there is no handler to wait for.", (uint8_t *)&v7, 0x16u);
  }
}

void sub_22AF4634C(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v14 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if ([v9 sendMessage:v12 fromChannel:v14 sendMode:0 syncWithReply:a4 replyHandler:v11])[v9 sendMessage:v13 fromChannel:v14 sendMode:1 syncWithReply:a4 replyHandler:v11];
}
  }

void sub_22AF46598(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a2 _schemes:a3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:v5 objects:&v21 count:16];
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138543874;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = (objc_class *)(id)[(id)qword_26AD828D8 objectForKey:v7 withKey:v12 withKey:v20];
        if (v13)
        {
          uint64_t v15 = v13;
          long long v16 = (void *)qword_26AD828D0;
          if (os_log_type_enabled((os_log_t)qword_26AD828D0, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v16;
            Name = class_getName(v15);
            id v19 = class_getName((Class)a2);
            *(_DWORD *)buf = v20;
            uint64_t v26 = v12;
            __int16 v27 = 2082;
            uint64_t v28 = Name;
            __int16 v29 = 2082;
            uint64_t v30 = v19;
            _os_log_impl(&_dtx_internal_logger, v17, OS_LOG_TYPE_ERROR, "Warning: duplicate registration of scheme \"%{public}@\" - claims made by both %{public}s and %{public}s transports.", buf, 0x20u);
          }
        }
        else
        {
          [qword_26AD828D8 setObject:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v4 countByEnumeratingWithState:v7 objects:&v21 count:16];
    }
    while (v9);
  }
}

char *sub_22AF46754(char *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = strrchr(a1, 47);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  uint32_t v4 = _dyld_image_count();
  if (!v4) {
    goto LABEL_7;
  }
  uint32_t v5 = v4;
  uint32_t v6 = 0;
  while (1)
  {
    image_name = (char *)_dyld_get_image_name(v6);
    long long v8 = strrchr(image_name, 47);
    if (v8)
    {
      if (!strcmp(v3, v8)) {
        break;
      }
    }
    if (v5 == ++v6) {
      goto LABEL_7;
    }
  }
  if (!image_name)
  {
LABEL_7:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = a1;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "couldn't find dyld's real path for loaded image %s", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  return image_name;
}

void sub_22AF46868(uint64_t a1)
{
  sub_22AF3E81C();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint32_t v4 = [qword_26AD828D8 objectForKey:v2];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    *(void *)(*(void *)(v6 + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 40;
    *(void *)(*(void *)(v7 + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  if (!*(void *)(*(void *)(*(void *)v5 + 8) + 24)) {
    *(void *)(*(void *)(*(void *)v5 + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = objc_opt_class();
  }
}

void sub_22AF468EC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_22AF4694C(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:v2] || ![v1 length:v3:v4]) {
    id v5 = 0;
  }
  else {
    id v5 = v1;
  }

  return v5;
}

void sub_22AF469B4(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_22AF46C30(uint64_t a1)
{
  *(void *)&v11.sa_len = 0;
  *(void *)&v11.sa_data[6] = 0;
  int v13 = 0;
  uint64_t v12 = 0;
  socklen_t v10 = 28;
  if (getsockname(a1, &v11, &v10))
  {
    id v5 = [MEMORY[0x263F08690] objc_msgSend_currentHandler:v2 with:v3];
    uint64_t v7 = [NSString _getPortOfSocketFileDescriptor:v6];
    long long v8 = __error();
    [v5 _DTXSocketTransport_DTXSocketTransport_m_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_for_23_23_socket_port_could_not_be_determined_
  }
  return bswap32(*(unsigned __int16 *)v11.sa_data) >> 16;
}

uint64_t sub_22AF46CF8(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 40);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  sockaddr v10 = (sockaddr)0;
  long long v11 = 0u;
  socklen_t v9 = 128;
  uint64_t v4 = accept(v2, &v10, &v9);
  id v5 = *(void **)(a1 + 32);
  if (v4 == -1) {
    [v5 disconnectWithContext:v3];
  }
  else {
    [v5 setupChannelWithConnectedSocket:v3 assumingOwnership:v4 orDisconnectBlock:^{}];
  }
  return [*(void **)(a1 + 32) signalSocketAccepted:v6 withTransitionContext:v7];
}

void sub_22AF46EF8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2))
    {
      uint64_t v3 = *(unsigned int *)(a1 + 32);
      uint64_t v4 = __error();
      id v5 = strerror(*v4);
      NSLog(&cfstr_ErrorClosingSo.isa, v3, v5);
    }
  }
}

id sub_22AF478A8(uint64_t a1, const char *a2)
{
  if (!atomic_load_explicit((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 32) + 48) + 48), memory_order_acquire))
  {
    unsigned int v3 = 64;
    do
    {
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 48) + 44)) {
        break;
      }
      if (v3 <= 0x40) {
        useconds_t v4 = 64;
      }
      else {
        useconds_t v4 = v3;
      }
      usleep(v4);
      unsigned int v3 = 2 * v4;
      if (2 * v4 >= 0x20000) {
        unsigned int v3 = 0x20000;
      }
    }
    while (!atomic_load_explicit((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 32) + 48) + 48), memory_order_acquire));
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v44 = a1;
  if (!*(_DWORD *)(v6 + 48))
  {
    [v5 setStatus:a2];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 48);
  }
  int v7 = *(unsigned __int8 *)(v5 + 64);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  long long v8 = v52;
  v52[0] = sub_22AF47C40;
  v52[1] = &unk_2648842D0;
  v52[2] = v5;
  socklen_t v9 = v51;
  sockaddr v10 = v9;
  if (v6)
  {
    int v11 = 0;
    uint64_t v12 = 60;
    if (!v7) {
      uint64_t v12 = 52;
    }
    uint64_t v13 = 56;
    uint64_t v14 = 32;
    if (!v7) {
      uint64_t v14 = 24;
    }
    uint64_t v15 = *(unsigned int *)(v6 + v14);
    if (v7) {
      uint64_t v13 = 64;
    }
    uint64_t v47 = v6 + v15 + 80;
    int v48 = v9;
    uint64_t v16 = 36;
    if (!v7) {
      uint64_t v16 = 28;
    }
    unsigned int v17 = *(_DWORD *)(v6 + v16);
    uint64_t v18 = 44;
    if (!v7) {
      uint64_t v18 = 40;
    }
    unint64_t v19 = -1;
    long long v20 = (unsigned int *)(v6 + v12);
    __int16 v49 = (unsigned int *)(v6 + v13);
    uint64_t v45 = (unsigned int *)(v6 + v18);
    double v46 = (unsigned int *)(v6 + v12);
    unsigned int v21 = 64;
    while (1)
    {
      while (1)
      {
        signed int v22 = atomic_load(v20);
        signed int v23 = atomic_load(v49);
        int v24 = v22 >= v23 ? 0 : v17;
        int v25 = v24 + v22;
        unsigned int v26 = atomic_load_explicit((atomic_uint *volatile)(v6 + 48), memory_order_acquire) | v11;
        if (v25 != v23) {
          break;
        }
        if (v26) {
          BOOL v27 = 1;
        }
        else {
          BOOL v27 = v19 == 0;
        }
        if (v27) {
          goto LABEL_61;
        }
        unint64_t v28 = 1000 * v21;
        BOOL v29 = v19 >= v28;
        unint64_t v30 = v19 - v28;
        if (v29) {
          unint64_t v19 = v30;
        }
        else {
          unint64_t v19 = 0;
        }
        pid_t v31 = atomic_load(v45);
        uint64_t v32 = v8;
        if (v21 <= 0x40) {
          useconds_t v33 = 64;
        }
        else {
          useconds_t v33 = v21;
        }
        usleep(v33);
        int v11 = 0;
        unsigned int v21 = 2 * v33;
        long long v8 = v32;
        if (v21 > 0x20000)
        {
          int v11 = 0;
          unsigned int v21 = 0x20000;
          if (v31)
          {
            if (kill(v31, 0) != -1 || (v34 = __error(), int v11 = 1, *v34 != 3)) {
              int v11 = 0;
            }
          }
        }
      }
      signed int v35 = v23;
      unsigned int v36 = v25 - v23;
      if ((v21 & 0xFFFE0000) != 0 || v36 > v17 >> 2) {
        unsigned int v21 = 64;
      }
      double v38 = v10;
      uint64_t v39 = v8;
      if (v17 - v23 >= v36) {
        uint64_t v40 = v36;
      }
      else {
        uint64_t v40 = v17 - v23;
      }
      unsigned __int8 v54 = 0;
      ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v52[0])(v38, v47 + v23, v40, &v54);
      uint64_t v41 = v36 - v40;
      if (v41) {
        ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v52[0])(v38, v47, v41, &v54);
      }
      else {
        LODWORD(v41) = v40 + v35;
      }
      long long v8 = v39;
      signed int v42 = v35;
      atomic_compare_exchange_strong((atomic_uint *volatile)v49, (unsigned int *)&v42, v41);
      if (v42 != v35 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Inconsistent reader offset in shared memory! MT reception suspected...\n", buf, 2u);
      }
      int v11 = v54;
      sockaddr v10 = v48;
      if (v54) {
        break;
      }
      unint64_t v19 = -1;
      long long v20 = v46;
      if (v26) {
        goto LABEL_61;
      }
    }
    atomic_store(1u, (unsigned int *)(v6 + 48));
  }
LABEL_61:

  v50.receiver = *(id *)(v44 + 32);
  v50.super_class = (Class)DTXSharedMemoryTransport;
  return [super disconnect];
}

uint64_t sub_22AF47C40(uint64_t a1, const void *a2, size_t size)
{
  size_t v5 = size;
  uint64_t v6 = malloc_type_malloc(size, 0xFFD3155uLL);
  memcpy(v6, a2, v5);
  int v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_22AF47CF4;
  v10[3] = &unk_264883A78;
  v10[4] = v6;
  return [v7 received:v8 ofLength:(uint64_t)v6 destructor:v5 withCompletion:v10];
}

void sub_22AF47CF4(uint64_t a1)
{
}

void sub_22AF48884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF48CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_22AF492F4(uint64_t result, void *a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *a2;
  }
  return result;
}

void sub_22AF49640(void *a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v53 = 0;
  unsigned __int8 v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = sub_22AF49B8C;
  void v52[3] = &unk_264884340;
  unsigned int v3 = a1 + 5;
  uint64_t v2 = a1[5];
  v52[4] = a1[4];
  v52[5] = &v53;
  uint64_t v4 = a1[6];
  v52[6] = v2;
  v52[7] = v4;
  uint64_t v45 = MEMORY[0x230F36B10](v52);
  BOOL v5 = (unint64_t)v54[3] >= *v3;
  uint64_t v6 = (uint64_t (**)(void, void, void))v45;
  if (!v5)
  {
    do
    {
      uint64_t v51 = 0;
      uint64_t v7 = ((uint64_t (**)(void, uint64_t, uint64_t *))v6)[2](v6, 32, &v51);
      if (!v7 || *(unsigned char *)(a1[4] + 48)) {
        break;
      }
      int v9 = *(_DWORD *)v7;
      int v10 = *(_DWORD *)(v7 + 4);
      int v11 = *(unsigned __int16 *)(v7 + 8);
      int v12 = *(unsigned __int16 *)(v7 + 10);
      uint64_t v13 = *(unsigned int *)(v7 + 12);
      uint64_t v14 = *(unsigned int *)(v7 + 16);
      uint64_t v49 = *(void *)(v7 + 20);
      int v50 = *(_DWORD *)(v7 + 28);
      if (v9 != 524114809)
      {
        unsigned int v36 = &_os_log_internal;
        id v37 = &_os_log_internal;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          double v38 = getprogname();
          pid_t v39 = getpid();
          uint64_t v40 = a1[5] - v54[3] + 32;
          *(_DWORD *)buf = 136315650;
          v58 = v38;
          LOWORD(v59) = 1024;
          *(_DWORD *)((char *)&v59 + 2) = v39;
          HIWORD(v59) = 2048;
          uint64_t v60 = v40;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%u]: [connection error] handling %llu bytes with unexpected protocol header; disconnecting.",
            buf,
            0x1Cu);
        }

        *(unsigned char *)(a1[4] + 48) = 1;
        free(*(void **)(a1[4] + 8));
        *(void *)(a1[4] + 8) = 0;
        (*(void (**)(void))(*(void *)(a1[4] + 40) + 16))();
        uint64_t v42 = a1[4];
        uint64_t v41 = a1 + 4;
        v43 = *(void **)(v42 + 40);
        *(void *)(v42 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;

        uint64_t v18 = *(void **)(*v41 + 32);
        *(void *)(*v41 + 32) = 0;
LABEL_21:

        uint64_t v6 = (uint64_t (**)(void, void, void))v45;
        break;
      }
      if (v12 == 1)
      {
        uint64_t v16 = ((uint64_t (**)(void, uint64_t, uint64_t *))v6)[2](v6, v13, &v51);
        if (!v16) {
          break;
        }
        unsigned int v17 = (unsigned char *)a1[4];
        if (v17[48]) {
          break;
        }
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = sub_22AF49C90;
        v48[3] = &unk_264883A78;
        v48[4] = v16;
        *(_DWORD *)buf = 524114809;
        LODWORD(v58) = v10;
        WORD2(v58) = v11;
        HIWORD(v58) = 1;
        unint64_t v59 = __PAIR64__(v14, v13);
        uint64_t v60 = v49;
        int v61 = v50;
        [v17 messageParsedWithHeader:v15 bytes:(uint64_t)buf length:v16 + 32 destructor:v13];
        *(void *)(a1[4] + 8) = 0;
        *(void *)(a1[4] + 16) = 0;
        *(void *)(a1[4] + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      }
      else
      {
        uint64_t v18 = [NSNumber numberWithUnsignedInt:v8];
        if (v11)
        {
          uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v45 + 16))(v45, v13, &v51);
          if (!v20) {
            goto LABEL_21;
          }
          uint64_t v21 = a1[4];
          if (*(unsigned char *)(v21 + 48)) {
            goto LABEL_21;
          }
          [*(void **)(v21 + 64) objectForKeyedSubscript:v19];
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          [v22 appendBytes:v23 length:v20 + 32];
          if (v12 - 1 == v11)
          {
            uint64_t v44 = (void *)a1[4];
            id v24 = v22;
            uint64_t v27 = [v24 v25:v26];
            uint64_t v30 = [v24 length];
            v46[0] = MEMORY[0x263EF8330];
            v46[1] = 3221225472;
            v46[2] = sub_22AF49C98;
            v46[3] = &unk_264883A58;
            id v22 = v24;
            id v47 = v22;
            *(_DWORD *)buf = 524114809;
            LODWORD(v58) = v10;
            WORD2(v58) = v11;
            HIWORD(v58) = v12;
            unint64_t v59 = __PAIR64__(v14, v13);
            uint64_t v60 = v49;
            int v61 = v50;
            [v44 messageParsedWithHeader:v31 bytes:(uint64_t)buf length:v27 destructor:v30];
            [*(void **)(a1[4] + 64) removeObjectForKey:v32];
          }
        }
        else
        {
          id v33 = objc_alloc(MEMORY[0x263EFF990]);
          id v22 = [v33 initWithCapacity:v34];
          [*(void **)(a1[4] + 64) setObject:v35 forKeyedSubscript:v22];
        }
        *(void *)(a1[4] + 16) = 0;

        uint64_t v6 = (uint64_t (**)(void, void, void))v45;
      }
    }
    while ((unint64_t)v54[3] < a1[5]);
  }

  _Block_object_dispose(&v53, 8);
}

void sub_22AF49B54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF49B8C(void *a1, unsigned int a2, unint64_t *a3)
{
  unint64_t v5 = *a3 + a2;
  *a3 = v5;
  uint64_t v6 = (void *)a1[4];
  if (v6[3] < v5)
  {
    v6[3] = (v5 + 127) & 0xFFFFFFFFFFFFFF80;
    *(void *)(a1[4] + 8) = malloc_type_realloc(*(void **)(a1[4] + 8), *(void *)(a1[4] + 24), 0x8FB168ACuLL);
    uint64_t v6 = (void *)a1[4];
    unint64_t v5 = *a3;
  }
  unint64_t v7 = v6[2];
  unint64_t v8 = v5 - v7;
  if (v5 > v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 24);
    if (v8 >= a1[6] - v9) {
      unint64_t v8 = a1[6] - v9;
    }
    uint64_t v10 = v8;
    if (v8)
    {
      memcpy((void *)(v6[1] + v7), (const void *)(a1[7] + v9), v8);
      *(void *)(a1[4] + 16) += v10;
      *(void *)(*(void *)(a1[5] + 8) + 24) += v10;
      uint64_t v6 = (void *)a1[4];
      unint64_t v7 = v6[2];
      unint64_t v5 = *a3;
    }
  }
  if (v7 >= v5) {
    return v6[1];
  }
  else {
    return 0;
  }
}

void sub_22AF49C90(uint64_t a1)
{
}

uint64_t sub_22AF49C98(uint64_t a1, const char *a2)
{
  return [*(void **)(a1 + 32) setLength:a2];
}

uint64_t sub_22AF49D94(uint64_t result, uint64_t a2)
{
  *(void *)(result + --*(_DWORD *)(*(void *)(result + 32) + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

void sub_22AF49DA4(uint64_t a1)
{
}

void sub_22AF49DAC(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 48))
  {
    *(unsigned char *)(v3 + 48) = 1;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v8 = *(void *)(v3 + 8);
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:a2 length:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v9;
  }
}

void sub_22AF4A1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF4A1E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_22AF4A1F4(void *result, uint64_t a2, unsigned int a3)
{
  if (*(_DWORD *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v3 = *(void *)(result[6] + 8);
    unint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = a3;
    if (v4 < a3) {
      uint64_t v5 = *(void *)(v3 + 24);
    }
    *(void *)(v3 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 - v5;
    unsigned int v6 = a3 - v5;
    if (a3 != v5)
    {
      uint64_t v7 = *(void *)(result[5] + 8);
      unsigned int v8 = *(_DWORD *)(v7 + 24);
      if (v6 >= v8) {
        unsigned int v9 = *(_DWORD *)(v7 + 24);
      }
      else {
        unsigned int v9 = v6;
      }
      *(_DWORD *)(v7 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v8 - v9;
      return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
    }
  }
  return result;
}

__CFString *sub_22AF4A504(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  unsigned int v8 = v5;
  if ((uint64_t *)kDTXInterruptionMessage == v5)
  {
    uint64_t v10 = @"< DTXMessage : kDTXInterruptionMessage >";
  }
  else
  {
    if ([v5 _callOutQueue_willDestroyWithTransitionContext:v6 completion:v7] == NO)
    {
      [NSString stringWithFormat:@"< DTXMessage : i%u kDTXInterruptionMessage >", a2];
LABEL_4:
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    if ((uint64_t *)kDTXBarrierMessage == v8)
    {
      uint64_t v10 = @"< DTXMessage : kDTXBarrierMessage >";
    }
    else if ((uint64_t *)kDTXAckBarrierMessage == v8)
    {
      uint64_t v10 = @"< DTXMessage : kDTXAckBarrierMessage >";
    }
    else
    {
      uint64_t v11 = "";
      if ((a3 & 0x100000000) != 0) {
        int v12 = "e";
      }
      else {
        int v12 = "";
      }
      if ((uint64_t *)kDTXHeartbeatMessage == v8)
      {
        [NSString stringWithFormat:@"< DTXMessage : i%d.%d%s kDTXHeartbeatMessage >", a2, HIDWORD(a2), v12];
        goto LABEL_4;
      }
      if ((int)a3 >= 0) {
        uint64_t v13 = a3;
      }
      else {
        uint64_t v13 = -(int)a3;
      }
      if ((int)a3 < 0) {
        uint64_t v11 = "f";
      }
      [MEMORY[0x263F089D8] stringWithFormat:@"< DTXMessage %p : i%d.%d%s c%d%s", v8, a2, HIDWORD(a2), v12, v13, v11];
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      switch([v8 _messageType:v14 withArguments:v15])
      {
        case 1u:
          unint64_t v52 = 0;
          uint64_t v18 = v8;
          [v18 getBufferWithReturnedLength:v19 returnedLength:&v52];
          if (v52 >> 30)
          {
            [v10 appendFormat:@" buffer: %.3f GB", (double)v52 * 9.31322575e-10];
          }
          else if (v52 < 0x100000)
          {
            if (v52 < 0x400) {
              [v10 appendFormat:v20, @" buffer: %lld bytes", v52];
            }
            else {
              [v10 appendFormat:@" buffer: %.3f KB", (double)v52 * 0.0009765625];
            }
          }
          else
          {
            [v10 appendFormat:@" buffer: %.3f MB", (double)v52 * 0.000000953674316];
          }
          break;
        case 2u:
          [v10 appendString:@" dispatch:["];
          signed int v23 = [v8 performSelector:v21 withObject:v22];
          int v25 = [v23 componentsSeparatedByString:@":"];
          size_t v28 = [v25 countWithOptions:v26];
          uint64_t v29 = malloc_type_calloc(v28, 8uLL, 0x80040B8603338uLL);
          unint64_t v52 = 0;
          uint64_t v53 = &v52;
          uint64_t v54 = 0x2020000000;
          int v55 = 0;
          uint64_t v30 = v8[7];
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          void v51[2] = sub_22AF4E880;
          v51[3] = &unk_264884558;
          v51[4] = &v52;
          v51[5] = v28;
          v51[6] = v29;
          sub_22AF4E7D8(v30, v51);
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = sub_22AF4E900;
          v46[3] = &unk_264884580;
          pid_t v31 = v10;
          id v47 = v31;
          int v48 = &v52;
          size_t v49 = v28;
          int v50 = v29;
          [v25 enumerateObjectsUsingBlock:v32];
          if (*((_DWORD *)v53 + 6))
          {
            unint64_t v33 = 0;
            do
            {
              long long v34 = (void *)v29[v33];
              v29[v33] = 0;

              ++v33;
            }
            while (v33 < *((unsigned int *)v53 + 6));
          }
          free(v29);
          [v31 appendString:@"]"];

          _Block_object_dispose(&v52, 8);
          goto LABEL_34;
        case 3u:
          unsigned int v36 = [v8 performSelector:v16 withObject:v17];
          id v37 = (objc_class *)objc_opt_class();
          double v38 = NSStringFromClass(v37);
          [v10 appendFormat:@" object:(%@*)", v38];

          signed int v23 = [v8 performSelector:v40 withObject:v41];
          sub_22AF4E9A8(v10, v23, 0, 1);
          goto LABEL_34;
        case 4u:
          signed int v23 = [v8 performSelector:v16 withObject:v17];
          [v10 appendFormat:@" error: \"%@\"", v23];
          goto LABEL_34;
        case 5u:
          [v10 appendString:@" ack barrier"];
          break;
        case 6u:
          [v10 appendString:@" primitive message"];
          break;
        case 7u:
          [v10 appendString:@" compressed buffer"];
          break;
        case 8u:
          signed int v23 = [v8 performSelector:v16 withObject:v17];
          [v10 appendFormat:v43, @" rerouted message: %@", v23];
LABEL_34:

          break;
        default:
          break;
      }
      [v10 appendString:@" >"];
      CFDictionaryRef v44 = CFDictionaryCreateWithDTXPrimitiveDictionary(v8[7]);
      if (v44) {
        sub_22AF4E9A8(v10, v44, 1, 1);
      }
    }
  }
LABEL_43:

  return v10;
}

void sub_22AF4A9F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22AF4AAC4(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    uint64_t v2 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2683E3588);
    v2[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2683E3588);
    uint64_t v1 = v2;
  }
}

void sub_22AF4AB30(void *a1)
{
}

void sub_22AF4AB48(_Unwind_Exception *a1)
{
}

void sub_22AF4AB5C(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x230F36B10](*(void *)(a1 + 32));
  uint64_t v2 = (void *)qword_2683E3590;
  qword_2683E3590 = v1;
}

uint64_t sub_22AF4AE88(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3 = qword_2683E3590;
  if (qword_2683E3590)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 40);
    uint64_t v6 = [*(void **)(*(void *)(result + 32) + 24) a2:a3];
    unint64_t v7 = *(void *)(v4 + 48) * (unint64_t)dword_26AD828C8 / *(unsigned int *)algn_26AD828CC;
    unsigned int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v3 + 16);
    uint64_t v9 = *(unsigned int *)(v4 + 56);
    return v8(v3, v5, v6, v7, v9);
  }
  return result;
}

id sub_22AF4B6EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = [v10 alloc];
  uint64_t v14 = (__CFString *)[v12 initWithFormat:v13 arguments:v11];

  uint64_t v15 = &stru_26DE3E3F0;
  if (v14) {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v15;

  uint64_t v17 = (void *)MEMORY[0x263F087E8];
  uint64_t v23 = *MEMORY[0x263F08320];
  v24[0] = v16;
  unint64_t v19 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v23 count:1];
  uint64_t v21 = [v17 _errorWithDomain:v20 code:@"DTXConnection" userInfo:a1];

  return v21;
}

void sub_22AF4B9C0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  uint64_t v6 = (void *)MEMORY[0x230F368A0]();
  if (v3)
  {
    id v21 = 0;
    unint64_t v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:v3 error:&v21];
    unsigned int v8 = (__CFString *)v21;
    if (!v7)
    {
      uint64_t v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      uint64_t v11 = objc_opt_class();
      uint64_t v13 = &stru_26DE3E3F0;
      if (v8) {
        uint64_t v13 = v8;
      }
      [v9 raiseFormat:@"Unable to archive object <%@ %p> via NSSecureCoding. %@", v3, v11, v13];
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
    unsigned int v8 = 0;
  }
  id v14 = v7;
  uint64_t v17 = [v14 v15:v16];
  uint64_t v20 = [v14 length];
  v4[2](v4, v17, v20);
}

unint64_t **sub_22AF4BAEC(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56), 0, a2, a3);
}

unint64_t **sub_22AF4BCD8(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56), 0, a2, a3);
}

unint64_t **sub_22AF4BF10(uint64_t a1, void *a2, size_t a3)
{
  return DTXPrimitiveDictionaryAddBufferPair((unint64_t **)(*(void *)(a1 + 32) + 56), 0, a2, a3);
}

uint64_t sub_22AF4C0A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_22AF4C1C4(uint64_t a1, const char *a2, unsigned int a3)
{
  uint64_t result = [*(void **)(a1 + 32) setPayloadBuffer:a2 length:a2 shouldCopy:a3 destructor:1];
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 3;
  return result;
}

void sub_22AF4C260(void *a1, void *a2)
{
  id v3 = a1;
  id v6 = a2;
  if (!*((void *)v3 + 6))
  {
    unint64_t v7 = (void *)*((void *)v3 + 3);
    if (v7)
    {
      int v8 = *((_DWORD *)v3 + 2);
      if ((v8 - 2) < 3)
      {
        uint64_t v9 = [v7 v4:v5];
        uint64_t v12 = [*((void **)v3 + 3) lengthWithOptions:v10 range:v11];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = sub_22AF4F1BC;
        v23[3] = &unk_2648845D0;
        id v24 = v3;
        sub_22AF4ED8C(v9, v12, v6, v23);
        uint64_t v13 = v24;
LABEL_12:

        goto LABEL_13;
      }
      if (v8 == 1)
      {
        uint64_t v20 = objc_opt_class();
        if ([v6 containsObject:v21] == NO)
        {
          uint64_t v13 = (void *)*((void *)v3 + 6);
          *((void *)v3 + 6) = 0;
          goto LABEL_12;
        }
        uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithData:v22];
        goto LABEL_10;
      }
      if (v8 == 6)
      {
        uint64_t v14 = [v7 performSelector:v4 withObject:v5];
        uint64_t v17 = [*((void **)v3 + 3) lengthWithOptions:v15];
        uint64_t v18 = DTXPrimitiveDictionaryReferencingSerialized(v14, v17);
        uint64_t v19 = (uint64_t)CFDictionaryCreateWithDTXPrimitiveDictionary(v18);
LABEL_10:
        uint64_t v13 = (void *)*((void *)v3 + 6);
        *((void *)v3 + 6) = v19;
        goto LABEL_12;
      }
    }
  }
LABEL_13:
}

void sub_22AF4C684()
{
  v4[3] = *MEMORY[0x263EF8340];
  v3[0] = objc_opt_class();
  v4[0] = &unk_26DE3D070;
  v3[1] = objc_opt_class();
  v4[1] = &unk_26DE3D090;
  v3[2] = objc_opt_class();
  v4[2] = &unk_26DE3D0B0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:v4 count:3];
  uint64_t v2 = (void *)qword_26AD82890;
  qword_26AD82890 = v1;
}

unint64_t *sub_22AF4C74C(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)[v6 UTF8String];
  uint64_t v13 = [v7 performSelector:v11 withObject:v12];

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 6, v13);
}

unint64_t *sub_22AF4C7C4(int a1, unint64_t *a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)[v6 UTF8String];
  id v11 = v7;
  uint64_t v14 = [v11 UTF8String];

  return DTXPrimitiveDictionaryAddPrimitivePair(a2, v10, 1, v14);
}

unint64_t **sub_22AF4C844(int a1, unint64_t **a2, id a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = (char *)[v6 UTF8String];
  id v11 = v7;
  uint64_t v14 = [v11 v12:v13];
  size_t v17 = [v11 length];

  return DTXPrimitiveDictionaryAddBufferPair(a2, v10, v14, v17);
}

void sub_22AF4C8DC(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  Class Class = object_getClass(v5);
  if (Class)
  {
    Superclass = Class;
    do
    {
      uint64_t v9 = [qword_26AD82890 objectForKeyedSubscript:v7];
      uint64_t v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, *(void *)(a1 + 32) + 56, v11, v5);
      }

      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }
}

unint64_t **sub_22AF4CD30(uint64_t a1, void *a2, size_t a3)
{
  id v5 = (unint64_t **)(*(void *)(a1 + 32) + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v9 = (char *)[v6 UTF8String];

  return DTXPrimitiveDictionaryAddBufferPair(v5, v9, a2, a3);
}

uint64_t sub_22AF4D4AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_26AD82888 != -1) {
    dispatch_once(&qword_26AD82888, &unk_26DE3D050);
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v4 = qword_26AD82870;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF4F340;
  block[3] = &unk_264884670;
  uint64_t v10 = &v12;
  uint64_t v11 = a1;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
  uint64_t v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_22AF4DAB8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  if (a2 == 1)
  {
    id v36 = objc_begin_catch(a1);
    id v37 = (void *)MEMORY[0x263F087E8];
    *(void *)(v33 - 128) = *MEMORY[0x263F08320];
    uint64_t v40 = [v36 descriptionWithLocale:v38 indent:v39];
    *(void *)(v33 - 120) = v40;
    uint64_t v42 = [NSDictionary dictionaryWithObjects:v41 forKeys:(v33 - 120, v33 - 128, 1)];
    CFDictionaryRef v44 = [v37 errorWithDomain:v43 code:1 userInfo:v42];
    double v46 = [v32 _newReplyWithError:v45];

    [v31 sendControlAsync:v47 replyHandler:^(NSDictionary * _Nonnull) {
    objc_end_catch();
    JUMPOUT(0x22AF4DA6CLL);
  }
  _Unwind_Resume(a1);
}

void sub_22AF4DBF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22AF4F5D0;
  v9[3] = &unk_2648846C0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  _DTXPrimitiveDictionaryEnumerate(a1, (uint64_t)v9);
}

void sub_22AF4DCB4(uint64_t a1, uint64_t a2, void *a3, const void *a4, unsigned int a5, void *a6)
{
  id v10 = a3;
  id v24 = v10;
  id v11 = a6;
  uint64_t v14 = v11;
  if (v11)
  {
    char v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = *MEMORY[0x263F08428];
    size_t v17 = [v11 userInfo:v12 withUserInfo:v13];
    uint64_t v19 = [v17 objectForKeyedSubscript:v18];
    [v15 raiseFormat:@"Arguments must conform to expected NSSecureCoding classes: %@", v19, v24];
  }
  unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v21 < *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (a4)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, 0);
      }
      uint64_t v22 = malloc_type_malloc(a5, 0x811CD51AuLL);
      memcpy(v22, a4, a5);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v22);
      [*(void **)(a1 + 32) setArgument:v23 atIndex:v22];
    }
    else
    {
      if (v10)
      {
        [*(void **)(a1 + 40) addObject:v12];
        unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      [*(void **)(a1 + 32) setArgument:v12 atIndex:v24 + 2];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void sub_22AF4DE6C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (a3) {
    uint64_t v5 = [v3 newReplyWithError:a2 error:a3];
  }
  else {
    uint64_t v5 = [v3 newReplyWithObject:a2];
  }
  id v6 = (char *)v5;
  [v4 sendControlAsync:v6 replyHandler:^(NSDictionary * _Nullable) {
}

uint64_t sub_22AF4E3EC(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) setPayloadBuffer:a2 length:a2 shouldCopy:a3 destructor:0];
}

uint64_t sub_22AF4E570(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_22AF4E588(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) setPayloadBuffer:a2 length:a2 shouldCopy:a3 destructor:0];
}

void sub_22AF4E7D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)qword_26AD828B8;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_22AF4ECF4;
  v6[3] = &unk_2648845A8;
  id v7 = v3;
  id v5 = v3;
  sub_22AF4DBF8(a1, v4, v6);
}

void sub_22AF4E880(void *a1, void *a2)
{
  id v4 = a2;
  unint64_t v5 = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
  if (a1[5] > v5)
  {
    id v6 = v4;
    objc_storeStrong((id *)(a1[6] + 8 * v5), a2);
    id v4 = v6;
    ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  }
}

void sub_22AF4E900(uint64_t a1, const char *a2, unint64_t a3)
{
  [*(void **)(a1 + 32) appendString:a2];
  if (a3 + 1 < *(void *)(a1 + 48))
  {
    if (a3) {
      [*(void **)(a1 + 32) appendString:v5];
    }
    [*(void **)(a1 + 32) appendString:v5];
    if (*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > a3)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = *(void **)(*(void *)(a1 + 56) + 8 * a3);
      sub_22AF4E9A8(v6, v7, 0, 0);
    }
  }
}

void sub_22AF4E9A8(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v9 = a2;
  if (!v9)
  {
    [v7 appendString:@"nil"];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v13 = [v10 length];
    [v7 appendFormat:@"<NSData %p | %u bytes> ", v10, v13];
    if (!a3)
    {
LABEL_6:

      goto LABEL_8;
    }
    id v15 = v10;
    uint64_t v18 = [v15 v16:v17];
    uint64_t v21 = [v15 length];
    id v24 = [DTXMessage _defaultAllowedSecureCodingClasses:v22 withAllowedClasses:v23];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_22AF4EF98;
    v55[3] = &unk_2648845D0;
    id v56 = v7;
    sub_22AF4ED8C(v18, v21, v24, v55);

    int v25 = v56;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = [v9 count:v26 with:v27];
    [v7 appendFormat:@"<NSArray %p | %ld objects>", v9, v28];
    if (a4)
    {
      [v7 appendString:@" { "];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = sub_22AF4F090;
      v53[3] = &unk_2648845F8;
      id v31 = v7;
      id v54 = v31;
      [v9 enumerateObjectsUsingBlock:v32];
      [v31 appendString:@" }"];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!a4)
      {
        uint64_t v48 = [v9 count:v34 with:v35];
        [v7 appendFormat:@"<NSDictionary %p | %ld key/value pairs>", v9, v48];
        goto LABEL_8;
      }
      id v10 = v9;
      if (![v10 _isValidForTransitionContext:v36 completion:v37]) {
        goto LABEL_6;
      }
      [v7 appendString:@" {\n"];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = sub_22AF4F134;
      v50[3] = &unk_264884620;
      id v39 = v7;
      id v51 = v39;
      char v52 = a3;
      [v10 enumerateKeysAndObjectsUsingBlock:v40];
      [v39 appendString:@"}"];
      int v25 = v51;
      goto LABEL_5;
    }
    objc_opt_class();
    isKindOfClass Class = objc_opt_isKindOfClass();
    uint64_t v45 = sub_22AF4EFF4(v9, v43, v44);
    id v47 = (void *)v45;
    if (isKindOfClass) {
      [v7 appendFormat:@"\"%@\"", v45];
    }
    else {
      [v7 appendFormat:@"[%@]", v45];
    }
  }
LABEL_8:
}

void sub_22AF4ECF4(uint64_t a1, int a2, int a3, char *cStr, CFIndex length)
{
  if (cStr)
  {
    CFDataRef ObjectFromPrimitiveType = _createObjectFromPrimitiveType(a2, cStr, length);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

void sub_22AF4ED8C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v17[3] = *(id *)MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v10 = (void *)MEMORY[0x230F368A0]();
  if (a2)
  {
    [NSData dataWithBytesNoCopy:MEMORY[0x263EFF8F8] length:v9 freeWhenDone:a1];
    v17[0] = 0;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v7;
    uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v13 fromData:v12 error:v11];

    id v15 = v17[0];
  }
  else
  {
    uint64_t v14 = 0;
    id v15 = 0;
  }
  if (v15) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v14;
  }
  ((void (**)(id, void *, id))v8)[2](v8, v16, v15);
}

void sub_22AF4EF98(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  sub_22AF4EFF4(a2, (const char *)a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"[%@]", v5];
}

id sub_22AF4EFF4(void *a1, const char *a2, uint64_t a3)
{
  id v3 = [a1 descriptionWithLocale:a2 indent:a3];
  if (v3.length >= 0x101)
  {
    id v7 = NSString;
    id v8 = [v3 substringToIndex:253];
    uint64_t v10 = [v7 stringWithFormat:@"%@...", v8];

    id v3 = (void *)v10;
  }

  return v3;
}

void sub_22AF4F090(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = (char *)v7;
  if (a3 && (objc_msgSend_appendString_(*(void **)(a1 + 32), v7, @", "), id v7 = v8, a3 > 4))
  {
    [*(void **)(a1 + 32) appendString:v8 withString:@"... "];
    *a4 = 1;
  }
  else
  {
    sub_22AF4E9A8(*(void *)(a1 + 32), v7, 0, 0);
  }
}

uint64_t sub_22AF4F134(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendFormat:@"    \"%@\" : ", a2];
  sub_22AF4E9A8(*(void *)(a1 + 32), v6, *(unsigned __int8 *)(a1 + 40), 0);

  id v9 = *(void **)(a1 + 32);

  return [v9 appendString:v8];
}

void sub_22AF4F1BC(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v7 && *(_DWORD *)(v10 + 8) == 4)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08608];
    v18[0] = *MEMORY[0x263F08320];
    v18[1] = v12;
    v19[0] = @"Failed to deserialize message";
    v19[1] = v7;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v8 forKeys:(uint64_t)v19 count:v18];
    uint64_t v15 = [v11 _errorWithDomain:v14 code:2 userInfo:v13];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v15;
  }
  else
  {
    objc_storeStrong((id *)(v10 + 48), a2);
  }
}

void sub_22AF4F2E4()
{
  dispatch_queue_t v0 = dispatch_queue_create("selector checking queue", 0);
  uint64_t v1 = (void *)qword_26AD82870;
  qword_26AD82870 = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_26AD82878;
  qword_26AD82878 = v2;
}

void sub_22AF4F340(uint64_t a1)
{
  Superclass = (objc_class *)objc_opt_class();
  id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v4 = NSStringFromClass(Superclass);
  id v7 = [qword_26AD82878 objectForKey:v5];
  if (!v7)
  {
    uint64_t v19 = v3;
    uint64_t v8 = objc_opt_new();
    id v7 = (void *)v8;
    if (Superclass)
    {
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = (void *)v8;
      while (1)
      {
        v22[0] = v20;
        v22[1] = 3221225472;
        uint64_t v23 = sub_22AF4F578;
        id v24 = &unk_264884648;
        id v25 = v7;
        uint64_t v10 = v22;
        unsigned int outCount = 0;
        id v11 = class_copyProtocolList(Superclass, &outCount);
        if (outCount) {
          break;
        }
LABEL_14:
        if (v11) {
          free(v11);
        }

        Superclass = class_getSuperclass(Superclass);
        id v7 = v21;
        if (!Superclass) {
          goto LABEL_17;
        }
      }
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = v11[v12];
        if (protocol_conformsToProtocol(v13, (Protocol *)&unk_26DE41C50))
        {
          unsigned int v26 = 0;
          uint64_t v14 = protocol_copyMethodDescriptionList(v13, 1, 1, &v26);
          uint64_t v15 = v14;
          if (v26)
          {
            unint64_t v16 = 0;
            uint64_t v17 = v14;
            do
            {
              name = v17->name;
              ++v17;
              v23((uint64_t)v10, name);
              ++v16;
            }
            while (v16 < v26);
LABEL_12:
            free(v15);
            goto LABEL_13;
          }
          if (v14) {
            goto LABEL_12;
          }
        }
LABEL_13:

        if (++v12 >= (unint64_t)outCount) {
          goto LABEL_14;
        }
      }
    }
LABEL_17:
    [qword_26AD82878 setObject:v9 forKey:v7];
    id v3 = v19;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v7 containsObject:v6];
}

void sub_22AF4F578(uint64_t a1, SEL aSelector)
{
  uint64_t v2 = *(void **)(a1 + 32);
  NSStringFromSelector(aSelector);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_22AF4F5D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (!a2)
  {
    if (a3 == 2)
    {
      uint64_t v6 = a5;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = sub_22AF4F6C4;
      v9[3] = &unk_264884698;
      id v7 = *(void **)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      int v11 = 2;
      sub_22AF4ED8C(a4, v6, v7, v9);
    }
    else
    {
      uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v8();
    }
  }
}

void sub_22AF4F6C4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v8 = v5;
  if (v5 && [v5 v6:v7] == 4865)
  {

    uint64_t v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t DTXSpawnSubtask(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v15 = a5;
  if (v9 && [v9 length])
  {
    uint64_t v98 = 0;
    v99 = (const posix_spawnattr_t *)&v98;
    uint64_t v100 = 0x2020000000;
    posix_spawnattr_t v101 = 0;
    uint64_t v94 = 0;
    v95 = (posix_spawn_file_actions_t *)&v94;
    uint64_t v96 = 0x2020000000;
    uint64_t v97 = 0;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2020000000;
    int v93 = 0;
    int v93 = posix_spawnattr_init(&v101);
    if (*((_DWORD *)v91 + 6))
    {
      uint64_t v16 = 0xFFFFFFFFLL;
LABEL_28:
      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(&v98, 8);
      goto LABEL_29;
    }
    __int16 v89 = 0;
    int v17 = posix_spawnattr_getflags(v99 + 3, &v89);
    *((_DWORD *)v91 + 6) |= v17;
    int v18 = posix_spawnattr_setpgroup((posix_spawnattr_t *)v99 + 3, 0);
    *((_DWORD *)v91 + 6) |= v18;
    v89 |= 0x4002u;
    uint64_t v20 = [v12 objectForKeyedSubscript:v19 key:@"__DTX_SpawnSuspended"];
    int v23 = [v20 v21:v22];

    __int16 v24 = v89;
    if (v23)
    {
      __int16 v24 = v89 | 0x80;
      v89 |= 0x80u;
    }
    int v25 = posix_spawnattr_setflags((posix_spawnattr_t *)v99 + 3, v24);
    *((_DWORD *)v91 + 6) |= v25;
    uint64_t v27 = [v12 objectForKeyedSubscript:v26];
    uint64_t v30 = v27;
    if (v27 && [v27 v28:v29] != -1)
    {
      *(_DWORD *)buf = 0;
      *(_DWORD *)buf = [v30 performSelector:v31 withObject:v32];
      int v33 = posix_spawnattr_setbinpref_np((posix_spawnattr_t *)v99 + 3, 1uLL, (cpu_type_t *)buf, 0);
      *((_DWORD *)v91 + 6) |= v33;
    }
    int v34 = posix_spawn_file_actions_init(v95 + 3);
    int v36 = *((_DWORD *)v91 + 6) | v34;
    *((_DWORD *)v91 + 6) = v36;
    v72 = v30;
    if (v36)
    {
      posix_spawnattr_destroy((posix_spawnattr_t *)v99 + 3);
    }
    else
    {
      [v12 objectForKeyedSubscript:v35];
      id v37 = objc_claimAutoreleasedReturnValue();
      uint64_t v39 = [v37 cStringUsingEncoding:4];
      if (v39) {
        uint64_t v40 = (const char *)v39;
      }
      else {
        uint64_t v40 = "/dev/null";
      }

      [v12 objectForKeyedSubscript:v41];
      id v42 = objc_claimAutoreleasedReturnValue();
      uint64_t v44 = [v42 cStringUsingEncoding:4];
      if (v44) {
        uint64_t v45 = (const char *)v44;
      }
      else {
        uint64_t v45 = "/dev/null";
      }

      [v12 objectForKeyedSubscript:v46];
      id v47 = objc_claimAutoreleasedReturnValue();
      uint64_t v49 = [v47 cStringUsingEncoding:4];
      if (v49) {
        int v50 = (const char *)v49;
      }
      else {
        int v50 = "/dev/null";
      }

      int v51 = posix_spawn_file_actions_addopen(v95 + 3, 0, v40, 0, 0);
      *((_DWORD *)v91 + 6) |= v51;
      int v52 = posix_spawn_file_actions_addopen(v95 + 3, 1, v45, 2, 0);
      *((_DWORD *)v91 + 6) |= v52;
      int v53 = posix_spawn_file_actions_addopen(v95 + 3, 2, v50, 2, 0);
      int v54 = *((_DWORD *)v91 + 6) | v53;
      *((_DWORD *)v91 + 6) = v54;
      if (!v54)
      {
        uint64_t v85 = 0;
        v86 = &v85;
        uint64_t v87 = 0x2020000000;
        int v88 = -1;
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v74 = sub_22AF4FEF4;
        v75 = &unk_2648847E8;
        id v76 = v10;
        id v77 = v9;
        id v78 = v11;
        id v79 = v12;
        v81 = &v90;
        v82 = &v85;
        v83 = &v94;
        v84 = &v98;
        id v80 = v15;
        id v56 = v73;
        name[0] = 0;
        uint64_t v57 = (ipc_space_t *)MEMORY[0x263EF8960];
        mach_error_t v58 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, name);
        if (v58)
        {
          unint64_t v59 = &_os_log_internal;
          id v60 = &_os_log_internal;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            int v61 = getprogname();
            pid_t v62 = getpid();
            v63 = mach_error_string(v58);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v61;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v62;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v63;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v58;
            _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
          }
        }
        mach_error_t inserted = mach_port_insert_right(*v57, name[0], name[0], 0x14u);
        if (inserted)
        {
          v65 = &_os_log_internal;
          id v66 = &_os_log_internal;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v67 = getprogname();
            pid_t v68 = getpid();
            v69 = mach_error_string(inserted);
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v67;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v68;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v69;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = inserted;
            _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
          }
        }
        uint64_t v70 = name[0];
        *(void *)name = 0;
        v103 = name;
        uint64_t v104 = 0x2020000000;
        char v105 = 0;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_22AF51870;
        *(void *)&buf[24] = &unk_264883AC8;
        *(void *)&buf[32] = name;
        int v107 = v70;
        v71 = (void (**)(void))MEMORY[0x230F36B10](buf);
        v74((uint64_t)v56, v70, v71);
        v71[2](v71);

        _Block_object_dispose(name, 8);
        uint64_t v16 = *((unsigned int *)v86 + 6);

        _Block_object_dispose(&v85, 8);
        goto LABEL_27;
      }
      posix_spawn_file_actions_destroy(v95 + 3);
      posix_spawnattr_destroy((posix_spawnattr_t *)v99 + 3);
    }
    uint64_t v16 = 0xFFFFFFFFLL;
LABEL_27:

    goto LABEL_28;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "empty executable path specified", buf, 2u);
  }
  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_29:

  return v16;
}

void sub_22AF4FE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_22AF4FEF4(uint64_t a1, mach_port_t a2, void *a3)
{
  mach_port_t v113 = a2;
  uint64_t v161 = *MEMORY[0x263EF8340];
  id v114 = a3;
  uint64_t v6 = [*(void **)(a1 + 32) performSelector:v4 withObject:v5];
  uint64_t v112 = (uint64_t)&v112;
  MEMORY[0x270FA5388](v6);
  id v9 = (char **)((char *)&v112 - v8);
  if (v7 >= 0x200) {
    size_t v10 = 512;
  }
  else {
    size_t v10 = v7;
  }
  bzero((char *)&v112 - v8, v10);
  id v11 = *(id *)(a1 + 40);
  uint64_t v14 = [v11 UTF8String];
  v119 = v9;
  const char *v9 = (char *)v14;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  uint64_t v116 = a1;
  id v15 = *(id *)(a1 + 32);
  uint64_t v19 = [v15 countByEnumeratingWithState:v16 objects:v151 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v152;
    int v21 = 1;
    do
    {
      uint64_t v22 = 0;
      int v23 = v21;
      int v24 = v21;
      int v25 = &v119[v21];
      do
      {
        if (*(void *)v152 != v20) {
          objc_enumerationMutation(v15);
        }
        [*(void **)(*((void *)&v151 + 1) + 8 * v22) descriptionWithLocale:v17 indent:v18];
        id v26 = objc_claimAutoreleasedReturnValue();
        v25[v22] = (char *const)[v26 UTF8String];

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v15 countByEnumeratingWithState:v17 objects:&v151 count:v160];
      int v21 = v24 + v22;
    }
    while (v19);
    int v29 = v22 + v23;
  }
  else
  {
    int v29 = 1;
  }

  v119[v29] = 0;
  uint64_t v32 = *(void **)(v116 + 48);
  if (v32)
  {
    v122 = [v32 mutableCopyWithZone:v30];
  }
  else
  {
    int v33 = [MEMORY[0x263F08AB0] processInfo:v30 with:v31];
    int v36 = [v33 v34:v35];
    v122 = [v36 mutableCopyWithZone:v37];
  }
  uint64_t v39 = getpid();
  uint64_t v41 = [NSNumber numberWithInt:v40];
  [v122 setObject:v42 forKeyedSubscript:(uint64_t)v41];

  [*(void **)(v116 + 56) objectForKeyedSubscript:v43];
  id v115 = (id)objc_claimAutoreleasedReturnValue();
  if (v115) {
    [v122 setObject:v44 forKeyedSubscript:(uint64_t)v115];
  }
  uint64_t v46 = [v122 count:v44 with:v45];
  MEMORY[0x270FA5388](v46);
  if (v47 >= 0x200) {
    size_t v49 = 512;
  }
  else {
    size_t v49 = v47;
  }
  char *const *__attribute__((__org_arrdim(0,0))) v118 = (char *const *)((char *)&v112 - v48);
  bzero((char *)&v112 - v48, v49);
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v121 = [v122 allKeys];
  uint64_t v54 = [v121 countByEnumeratingWithState:v52 objects:&v147 count:v159];
  if (v54)
  {
    uint64_t v55 = 0;
    uint64_t v56 = *(void *)v148;
    do
    {
      uint64_t v57 = 0;
      uint64_t v120 = (int)v55;
      uint64_t v117 = v55;
      mach_error_t v58 = &v118[(int)v55];
      do
      {
        if (*(void *)v148 != v56) {
          objc_enumerationMutation(v121);
        }
        uint64_t v59 = *(void *)(*((void *)&v147 + 1) + 8 * v57);
        id v60 = NSString;
        int v61 = [v122 objectForKey:v53];
        [v60 stringWithFormat:@"%@=%@", v59, v61];
        id v63 = objc_claimAutoreleasedReturnValue();
        v58[v57] = (char *const)[v63 UTF8String];

        ++v57;
      }
      while (v54 != v57);
      uint64_t v54 = [v121 countByEnumeratingWithState:v53 objects:(id *)&v147 count:16];
      uint64_t v55 = v120 + v57;
    }
    while (v54);
    int v66 = v57 + v117;
  }
  else
  {
    int v66 = 0;
  }

  v118[v66] = 0;
  os_unfair_lock_lock(&stru_2683E3598);
  v67 = (task_t *)MEMORY[0x263EF8960];
  task_t v68 = *MEMORY[0x263EF8960];
  mach_port_t v146 = v113;
  mach_error_t v69 = mach_ports_register(v68, &v146, 1u);
  if (v69 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v70 = getprogname();
    pid_t v71 = getpid();
    v72 = mach_error_string(v69);
    LODWORD(v157[0]) = 136315906;
    *(void *)((char *)v157 + 4) = v70;
    WORD2(v157[1]) = 1024;
    *(_DWORD *)((char *)&v157[1] + 6) = v71;
    WORD1(v157[2]) = 2080;
    *(void *)((char *)&v157[2] + 4) = v72;
    WORD2(v157[3]) = 1024;
    *(_DWORD *)((char *)&v157[3] + 6) = v69;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", (uint8_t *)v157, 0x22u);
  }
  uint64_t v73 = *(void *)(*(void *)(v116 + 80) + 8);
  id v74 = *(id *)(v116 + 40);
  id v77 = [v74 UTF8String];
  int v78 = posix_spawn((pid_t *)(v73 + 24), v77, (const posix_spawn_file_actions_t *)(*(void *)(*(void *)(v116 + 88) + 8) + 24), (const posix_spawnattr_t *)(*(void *)(*(void *)(v116 + 96) + 8) + 24), v119, v118);
  *(_DWORD *)(*(void *)(*(void *)(v116 + 72) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v78;
  mach_error_t v79 = mach_ports_register(*v67, &v155, 0);
  if (v79 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v80 = getprogname();
    pid_t v81 = getpid();
    v82 = mach_error_string(v79);
    LODWORD(v157[0]) = 136315906;
    *(void *)((char *)v157 + 4) = v80;
    WORD2(v157[1]) = 1024;
    *(_DWORD *)((char *)&v157[1] + 6) = v81;
    WORD1(v157[2]) = 2080;
    *(void *)((char *)&v157[2] + 4) = v82;
    WORD2(v157[3]) = 1024;
    *(_DWORD *)((char *)&v157[3] + 6) = v79;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", (uint8_t *)v157, 0x22u);
  }
  os_unfair_lock_unlock(&stru_2683E3598);
  posix_spawn_file_actions_destroy((posix_spawn_file_actions_t *)(*(void *)(*(void *)(v116 + 88) + 8) + 24));
  posix_spawnattr_destroy((posix_spawnattr_t *)(*(void *)(*(void *)(v116 + 96) + 8) + 24));
  uint64_t v83 = v116;
  if (*(_DWORD *)(*(void *)(*(void *)(v116 + 72) + 8) + 24))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v84 = *(id *)(v83 + 40);
      uint64_t v87 = [v84 UTF8String];
      int v88 = strerror(*(_DWORD *)(*(void *)(*(void *)(v116 + 72) + 8) + 24));
      LODWORD(v157[0]) = 136315394;
      *(void *)((char *)v157 + 4) = v87;
      WORD2(v157[1]) = 2080;
      *(void *)((char *)&v157[1] + 6) = v88;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to posix spawn %s: %s", (uint8_t *)v157, 0x16u);
      uint64_t v83 = v116;
    }
    *(_DWORD *)(*(void *)(*(void *)(v83 + 80) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -1;
  }
  else
  {
    v121 = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t v89 = dispatch_semaphore_create(0);
    dispatch_queue_t v90 = dispatch_queue_create("helper process handshake queue", 0);
    v157[0] = 0;
    v157[1] = v157;
    v157[2] = 0x3032000000;
    v157[3] = sub_22AF50A50;
    v157[4] = sub_22AF50A60;
    id v158 = 0;
    v144[0] = 0;
    v144[1] = v144;
    v144[2] = 0x2020000000;
    char v145 = 0;
    v137[0] = MEMORY[0x263EF8330];
    v137[1] = 3221225472;
    v137[2] = sub_22AF50A68;
    v137[3] = &unk_264884720;
    v142 = v144;
    id v141 = *(id *)(v83 + 64);
    id v138 = *(id *)(v83 + 40);
    v91 = v89;
    v139 = v91;
    v143 = v157;
    uint64_t v92 = v90;
    v140 = v92;
    int v93 = (void *)MEMORY[0x230F36B10](v137);
    uint64_t v94 = v116;
    dispatch_source_t v95 = dispatch_source_create(MEMORY[0x263EF83E0], *(int *)(*(void *)(*(void *)(v116 + 80) + 8) + 24), 0x80000000uLL, v121);
    if (v95)
    {
      v129[0] = MEMORY[0x263EF8330];
      v129[1] = 3221225472;
      v129[2] = sub_22AF50E2C;
      v129[3] = &unk_264884748;
      uint64_t v134 = *(void *)(v94 + 80);
      uint64_t v96 = v92;
      v130 = v96;
      id v97 = v93;
      id v132 = v97;
      id v133 = v114;
      uint64_t v98 = v95;
      v131 = v98;
      dispatch_source_set_event_handler(v98, v129);
      dispatch_resume(v98);
      if (*(void *)(v94 + 64))
      {
        uint64_t v100 = [*(void **)(v94 + 56) objectForKeyedSubscript:v99 forKey:@"SpawnTimeout"];
        uint64_t v103 = [v100 v101:v102];

        v125[0] = MEMORY[0x263EF8330];
        v125[1] = 3221225472;
        v125[2] = sub_22AF50F08;
        v125[3] = &unk_2648847C0;
        mach_port_t v128 = v113;
        uint64_t v104 = v96;
        v126 = v104;
        id v105 = v97;
        id v127 = v105;
        dispatch_async(v121, v125);
        if (v103) {
          dispatch_time_t v106 = dispatch_time(0, 1000000 * v103);
        }
        else {
          dispatch_time_t v106 = -1;
        }
        uint64_t v110 = v116;
        if (dispatch_semaphore_wait(v91, v106))
        {
          v123[0] = MEMORY[0x263EF8330];
          v123[1] = 3221225472;
          v123[2] = sub_22AF51168;
          v123[3] = &unk_264883ED8;
          id v124 = v105;
          dispatch_sync(v104, v123);
          pid_t v111 = *(_DWORD *)(*(void *)(*(void *)(v110 + 80) + 8) + 24);
          if (v111 >= 1) {
            kill(v111, 9);
          }
        }
      }

      v109 = (id *)&v130;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v107 = *(_DWORD *)(*(void *)(*(void *)(v94 + 80) + 8) + 24);
        v156[0] = 67109120;
        v156[1] = v107;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to start observing process with pid %i", (uint8_t *)v156, 8u);
      }
      pid_t v108 = *(_DWORD *)(*(void *)(*(void *)(v94 + 80) + 8) + 24);
      v156[0] = 0;
      waitpid(v108, v156, 1);
      v135[0] = MEMORY[0x263EF8330];
      v135[1] = 3221225472;
      v135[2] = sub_22AF50E14;
      v135[3] = &unk_264883ED8;
      id v136 = v93;
      dispatch_async(v92, v135);
      (*((void (**)(void))v114 + 2))();
      v109 = &v136;
      *(_DWORD *)(*(void *)(*(void *)(v94 + 80) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -1;
    }

    _Block_object_dispose(v144, 8);
    _Block_object_dispose(v157, 8);
  }
}

void sub_22AF50A1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 376), 8);
  _Block_object_dispose((const void *)(v1 + 576), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF50A50(uint64_t result, uint64_t a2)
{
  *(void *)(result + --*(_DWORD *)(*(void *)(result + 32) + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

void sub_22AF50A60(uint64_t a1)
{
}

void sub_22AF50A68(uint64_t a1, mach_port_t a2, int a3)
{
  mach_msg_return_t v13;
  const char *v14;
  pid_t v15;
  char *v16;
  void v17[4];
  id v18;
  mach_port_t v19;
  mach_msg_header_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  pid_t v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  mach_msg_return_t v29;
  uint64_t v30;

  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    if (*(void *)(a1 + 56))
    {
      unint64_t v7 = (void *)MEMORY[0x230F368A0]();
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      if (a2 - 1 > 0xFFFFFFFD
        || (a3 - 1) >= 0xFFFFFFFE
        || mach_port_mod_refs(*MEMORY[0x263EF8960], a2, 0, 1))
      {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      }
      else
      {
        dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF83D0], a2, 1uLL, *(dispatch_queue_t *)(a1 + 48));
        uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
        size_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v8;

        id v11 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = sub_22AF50DCC;
        v17[3] = &unk_264884288;
        uint64_t v18 = *(id *)(a1 + 40);
        uint64_t v19 = a2;
        dispatch_source_set_event_handler(v11, v17);
        dispatch_activate(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
        pid_t v12 = getpid();
        v20.msgh_remote_port = a2;
        v20.msgh_local_port = 0;
        *(void *)&v20.msgh_bits = 0x2000000013;
        *(void *)&v20.msgh_voucher_port = 0;
        int v21 = v12;
        uint64_t v13 = mach_msg_send(&v20);
        if (v13)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = getprogname();
            id v15 = getpid();
            uint64_t v16 = mach_error_string(v13);
            *(_DWORD *)buf = 136315906;
            int v23 = v14;
            int v24 = 1024;
            int v25 = v15;
            id v26 = 2080;
            uint64_t v27 = v16;
            uint64_t v28 = 1024;
            int v29 = v13;
            _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", buf, 0x22u);
          }
        }
      }
    }
  }
}

void sub_22AF50CC0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(a1);
      int v21 = &_os_log_internal;
      id v22 = &_os_log_internal;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v23 = *(id *)(v19 + 32);
        uint64_t v26 = [v23 UTF8String];
        [v20 descriptionWithLocale:v27 indent:v28];
        id v29 = objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [v29 UTF8String];
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = v26;
        WORD6(buf) = 2080;
        *(void *)((char *)&buf + 14) = v32;
        _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "DTXSpawnSubtask handshake block failed for %s: %s", (uint8_t *)&buf, 0x16u);
      }
      objc_end_catch();
      JUMPOUT(0x22AF50B18);
    }
    objc_begin_catch(a1);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v19 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_22AF50DCC(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  ipc_space_t v2 = *MEMORY[0x263EF8960];
  mach_port_name_t v3 = *(_DWORD *)(a1 + 40);

  return mach_port_deallocate(v2, v3);
}

uint64_t sub_22AF50E14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22AF50E2C(uint64_t a1)
{
  pid_t v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  int v9 = 0;
  waitpid(v2, &v9, 1);
  mach_port_name_t v3 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22AF50EF0;
  v7[3] = &unk_264883ED8;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v3, v7);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v4, v5, v6);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

uint64_t sub_22AF50EF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22AF50F08(uint64_t a1)
{
  mach_port_name_t v2 = *(_DWORD *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v8 = sub_22AF510B0;
  int v9 = &unk_264884798;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  int v12 = *(_DWORD *)(a1 + 48);
  mach_port_name_t v3 = v7;
  long long v14 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, v2, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    v8((uint64_t)v3, 0, 4, 0);
  }
  else
  {
    if (HIDWORD(v14) + *(_DWORD *)&msg[4] == 48
      && *(_DWORD *)&msg[24] == 1
      && !HIBYTE(DWORD1(v14))
      && ((int v4 = HIWORD(DWORD1(v14)), (HIWORD(DWORD1(v14)) - 22) < 0xFFFFFFFA)
       || (*(_DWORD *)msg & 0x80000000) != 0))
    {
      if (v4 == 16) {
        unsigned int v5 = 1;
      }
      else {
        unsigned int v5 = 4 * ((v4 - 17) > 4);
      }
      if (*(int *)msg >= 0) {
        uint64_t v6 = 6;
      }
      else {
        uint64_t v6 = v5;
      }
      v8((uint64_t)v3, *(unsigned int *)&msg[28], v6, *(unsigned int *)&msg[8]);
    }
    else
    {
      v8((uint64_t)v3, 0, 4, 0);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
}

void sub_22AF510B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_22AF51150;
  v8[3] = &unk_264884770;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  int v7 = *(_DWORD *)(a1 + 48);
  int v10 = a4;
  int v11 = v7;
  dispatch_sync(v6, v8);
}

uint64_t sub_22AF51150(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t sub_22AF51168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DTXSubtaskCheckin(void *a1)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v1 = a1;
  mach_port_name_t v2 = (void *)MEMORY[0x230F368A0]();
  unsigned int v5 = (const char *)[@"__DTX_SpawnParentPidKey" UTF8String];
  uint64_t v6 = getenv(v5);
  if (v6)
  {
    int v7 = atoi(v6);
    if (v7 != getppid())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v49 = 0u;
      memset(buf, 0, sizeof(buf));
      v39[0] = 648;
      *(void *)id v42 = 0xE00000001;
      LODWORD(v43) = 1;
      HIDWORD(v43) = getpid();
      if (sysctl(v42, 4u, buf, v39, 0, 0) || !v39[0] || (*(_WORD *)&buf[32] & 0x800) == 0) {
        goto LABEL_21;
      }
    }
  }
  else if (getppid())
  {
    goto LABEL_21;
  }
  mach_port_array_t init_port_set = 0;
  mach_msg_type_number_t init_port_setCnt = 0;
  int v10 = (task_t *)MEMORY[0x263EF8960];
  if (mach_ports_lookup(*MEMORY[0x263EF8960], &init_port_set, &init_port_setCnt)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = init_port_setCnt == 0;
  }
  if (v11 || (mach_port_t v12 = *init_port_set, *init_port_set + 1 < 2))
  {
    mach_port_t v12 = 0;
  }
  else
  {
    mig_deallocate((vm_address_t)init_port_set, 4 * init_port_setCnt);
    mach_error_t v27 = mach_ports_register(*v10, &v41, 0);
    if (v27 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = getprogname();
      pid_t v29 = getpid();
      uint64_t v30 = mach_error_string(v27);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v29;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v30;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v27;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_ports_register' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  int v33 = sub_22AF516B8;
  int v34 = &unk_264884810;
  mach_port_t v36 = v12;
  id v35 = v1;
  uint64_t v13 = &v31;
  *(void *)id v42 = MEMORY[0x263EF8330];
  uint64_t v43 = 3221225472;
  uint64_t v44 = sub_22AF51A44;
  uint64_t v45 = &unk_264883B68;
  mach_port_t v47 = v12;
  long long v14 = v13;
  uint64_t v46 = v14;
  id v15 = v42;
  LODWORD(v39[0]) = 0;
  mach_error_t v16 = mach_port_allocate(*v10, 1u, (mach_port_name_t *)v39);
  if (v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v17 = getprogname();
    pid_t v18 = getpid();
    uint64_t v19 = mach_error_string(v16);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v19;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v16;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
  }
  mach_error_t inserted = mach_port_insert_right(*v10, v39[0], v39[0], 0x14u);
  if (inserted && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v21 = getprogname();
    pid_t v22 = getpid();
    id v23 = mach_error_string(inserted);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v22;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v23;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = inserted;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
  }
  uint64_t v24 = LODWORD(v39[0]);
  v39[0] = 0;
  v39[1] = (size_t)v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_22AF51870;
  *(void *)&buf[24] = &unk_264883AC8;
  *(void *)&buf[32] = v39;
  *(_DWORD *)&unsigned char buf[40] = v24;
  uint64_t v25 = (void (**)(void))MEMORY[0x230F36B10](buf);
  v44((uint64_t)v15, v24, v25);
  v25[2](v25);

  _Block_object_dispose(v39, 8);
  mach_port_deallocate(*v10, v12);

LABEL_21:
  uint64_t v26 = (const char *)[@"__DTX_SpawnParentPidKey" UTF8String];
  unsetenv(v26);
}

void sub_22AF51698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AF516B8(uint64_t a1, uint64_t a2)
{
  mach_msg_return_t v5;
  mach_error_t v6;
  const char *v7;
  pid_t v8;
  char *v9;
  uint64_t v10;
  mach_port_name_t name[4];
  long long v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  pid_t v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  mach_error_t v21;
  uint64_t v22;

  pid_t v22 = *MEMORY[0x263EF8340];
  mach_port_name_t v4 = *(_DWORD *)(a1 + 40);
  *(void *)&mach_port_t v12 = 0;
  *((void *)&v12 + 1) = 1;
  uint64_t v13 = 0x13000000000000;
  mach_port_name_t name[2] = v4;
  name[3] = a2;
  *(void *)name = 0x2880001413;
  unsigned int v5 = mach_msg_send((mach_msg_header_t *)name);
  if (v5)
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v7 = getprogname();
      id v8 = getpid();
      uint64_t v9 = mach_error_string(v6);
      *(_DWORD *)buf = 136315906;
      id v15 = v7;
      mach_error_t v16 = 1024;
      int v17 = v8;
      pid_t v18 = 2080;
      uint64_t v19 = v9;
      id v20 = 1024;
      int v21 = v6;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_msg_send' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  int v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v10, *(unsigned int *)(a1 + 40), a2);
  }
  uint64_t v13 = 0;
  *(_OWORD *)name = 0u;
  mach_port_t v12 = 0u;
  if (!mach_msg((mach_msg_header_t *)name, 2, 0, 0x28u, a2, 0, 0) && DWORD1(v12) != 70)
  {
    if ((name[0] & 0x80000000) != 0)
    {
      mach_msg_destroy((mach_msg_header_t *)name);
    }
    else if (HIDWORD(v13) + name[1] == 40)
    {
      mach_port_deallocate(*MEMORY[0x263EF8960], name[2]);
    }
  }
}

void sub_22AF51870(uint64_t a1)
{
  kern_return_t v5;
  mach_error_t v6;
  kern_return_t v7;
  mach_error_t v8;
  const char *v9;
  pid_t v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  pid_t v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  mach_error_t v19;
  uint64_t v20;

  char v1 = 0;
  id v20 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (unsigned __int8 *)&v1, 1u);
  if (!v1)
  {
    mach_port_name_t v3 = *(_DWORD *)(a1 + 40);
    if (v3 + 1 >= 2)
    {
      mach_port_name_t v4 = (ipc_space_t *)MEMORY[0x263EF8960];
      unsigned int v5 = mach_port_mod_refs(*MEMORY[0x263EF8960], v3, 1u, -1);
      if (v5)
      {
        uint64_t v6 = v5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          mach_port_t v12 = 136315906;
          uint64_t v13 = getprogname();
          long long v14 = 1024;
          id v15 = getpid();
          mach_error_t v16 = 2080;
          int v17 = mach_error_string(v6);
          pid_t v18 = 1024;
          uint64_t v19 = v6;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_mod_refs' failed: %s (%d)\n", (uint8_t *)&v12, 0x22u);
        }
      }
      int v7 = mach_port_deallocate(*v4, *(_DWORD *)(a1 + 40));
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = getprogname();
          int v10 = getpid();
          BOOL v11 = mach_error_string(v8);
          mach_port_t v12 = 136315906;
          uint64_t v13 = v9;
          long long v14 = 1024;
          id v15 = v10;
          mach_error_t v16 = 2080;
          int v17 = v11;
          pid_t v18 = 1024;
          uint64_t v19 = v8;
          _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_deallocate' failed: %s (%d)\n", (uint8_t *)&v12, 0x22u);
        }
      }
    }
  }
}

void sub_22AF51A44(uint64_t a1, uint64_t a2, void *a3)
{
  uintptr_t v5 = *(unsigned int *)(a1 + 40);
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  id v7 = a3;
  source = dispatch_source_create(MEMORY[0x263EF83D0], v5, 1uLL, v6);

  dispatch_source_set_event_handler(source, v7);
  dispatch_activate(source);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_source_cancel(source);
}

void sub_22AF51B60(_DWORD *a1)
{
  a1[12] = -1;
  a1[13] = -1;
  uintptr_t v5 = a1;
  dispatch_queue_t v1 = dispatch_queue_create("transport input queue", 0);
  mach_port_name_t v2 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v1;

  dispatch_queue_t v3 = dispatch_queue_create("transport output queue", 0);
  mach_port_name_t v4 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v3;

  v5[18] = -1;
}

uint64_t sub_22AF51DA8(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v8 = [v5 UTF8String];
  uint64_t v9 = 420;
  if ((a2 & 0x200) == 0) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = open(v8, a2, v9);
  if ((v10 & 0x80000000) != 0)
  {
    if (a3)
    {
      __error();
      _NSErrorWithFilePathErrnoAndVariant();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = __error();
      NSLog(&cfstr_ErrorOpeningPa.isa, v5, *v11);
    }
  }

  return v10;
}

void sub_22AF51E60(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0 && close(v2))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 32);
    mach_port_name_t v4 = __error();
    id v5 = strerror(*v4);
    NSLog(&cfstr_ErrorClosingIn.isa, v3, v5);
  }
  int v6 = *(_DWORD *)(a1 + 36);
  if ((v6 & 0x80000000) == 0 && v6 != *(_DWORD *)(a1 + 32))
  {
    if (close(v6))
    {
      uint64_t v7 = *(unsigned int *)(a1 + 36);
      id v8 = __error();
      uint64_t v9 = strerror(*v8);
      NSLog(&cfstr_ErrorClosingOu.isa, v7, v9);
    }
  }
}

void sub_22AF520B8(uint64_t a1)
{
  int v2 = malloc_type_malloc(0x4000uLL, 0x9FB2C939uLL);
  do
  {
    while (1)
    {
      ssize_t v3 = read(*(_DWORD *)(a1 + 40), v2, 0x4000uLL);
      if (v3 < 0) {
        break;
      }
      ssize_t v5 = v3;
      if (!v3) {
        goto LABEL_9;
      }
      int v6 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_22AF52228;
      v10[3] = &unk_264883A78;
      v10[4] = v2;
      [v6 received:v4 ofLength:(uint64_t)v2 destructor:v5];
      int v2 = malloc_type_malloc(0x4000uLL, 0xF7738F1FuLL);
    }
  }
  while (*__error() == 4);
  if (*__error() == 35)
  {
    free(v2);
    return;
  }
LABEL_9:
  free(v2);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22AF52230;
  v9[3] = &unk_264883A58;
  void v9[4] = v7;
  dispatch_async(v8, v9);
}

void sub_22AF52228(uint64_t a1)
{
}

uint64_t sub_22AF52230(uint64_t a1, const char *a2, uint64_t a3)
{
  return [*(void **)(a1 + 32) a2:a3];
}

uint64_t sub_22AF52514(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  uint64_t result = *(unsigned int *)(a1 + 36);
  if ((result & 0x80000000) == 0)
  {
    return close(result);
  }
  return result;
}

uint64_t sub_22AF526BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + --*(_DWORD *)(*(void *)(result + 32) + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + --*(_DWORD *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

void sub_22AF526CC(uint64_t a1)
{
}

void sub_22AF526D4(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  int v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_22AF52758;
  void v3[3] = &unk_2648839B8;
  long long v4 = v1;
  dispatch_sync(v2, v3);
}

void sub_22AF52758(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_DWORD *)(v1 + 48) & 0x80000000) == 0 && (*(_DWORD *)(v1 + 52) & 0x80000000) == 0)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    ssize_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + --*(_DWORD *)(*(void *)(result + 32) + 40) = v3;

    xpc_dictionary_set_fd(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "_inFD", *(_DWORD *)(*(void *)(a1 + 32) + 48));
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 52);
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    xpc_dictionary_set_fd(v7, "_outFD", v6);
  }
}

void sub_22AF5298C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AF529AC(uint64_t a1)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF52A78;
  block[3] = &unk_264884838;
  void block[4] = v1;
  void block[5] = &v8;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

ssize_t sub_22AF52A78(uint64_t a1)
{
  ssize_t result = *(unsigned int *)(*(void *)(a1 + 32) + 52);
  if ((result & 0x80000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3)
  {
    if (*(void *)(a1 + 64)) {
      abort();
    }
    ssize_t result = 0;
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  ssize_t result = write(result, (const void *)(v3 + v4), *(void *)(a1 + 64) - v4);
  if (result != -1)
  {
LABEL_10:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += result;
    return result;
  }
  ssize_t result = (ssize_t)__error();
  if (*(_DWORD *)result != 4)
  {
    ssize_t result = (ssize_t)__error();
    if (*(_DWORD *)result != 35)
    {
      ssize_t result = [*(void **)(a1 + 32) performSelector:v5 withObject:v6];
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
  }
  return result;
}

void sub_22AF52C3C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0;
  }
}

void sub_22AF52CA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF52D20;
  block[3] = &unk_264883A58;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_22AF52D20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 96);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    ssize_t v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 52) = -1;
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = -1;
}

void sub_22AF52E94()
{
}

void sub_22AF52EC0()
{
  __assert_rtn("_returnScratchBufferForAlgorithm", "DTXBlockCompressor.m", 183, "false && \"unexpected: compression type with libcompression is not known\"");
}

void sub_22AF52EEC()
{
  __assert_rtn("DTXTransportPreserveDataInSerializedTransport", "DTXTransport_Internal.h", 22, "xpc_get_type(serializedTransport) == XPC_TYPE_DICTIONARY");
}

void sub_22AF52F18()
{
}

void sub_22AF52F44()
{
  __assert_rtn("-[DTXConnection _unregisterChannel:]_block_invoke", "DTXConnection.m", 1404, "channel == unconfiguredChannel");
}

void sub_22AF52F70()
{
}

void sub_22AF52F9C()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 38, "ret == 0");
}

void sub_22AF52FC8()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 36, "ret == 0");
}

void sub_22AF52FF4()
{
  __assert_rtn("_openSocketFileDescriptorForPort", "DTXSocketTransport.m", 33, "ret == 0");
}

void sub_22AF53020()
{
  __assert_rtn("-[DTXSocketTransport _setupChannelWithConnectedSocket:assumingOwnership:orDisconnectBlock:]", "DTXSocketTransport.m", 91, "self.status == DTXTransportStatus_Unavailable");
}

void sub_22AF5304C()
{
}

void sub_22AF53078()
{
}

void sub_22AF530A4(int *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v4 = *a1;
    v5[0] = 67109376;
    v5[1] = v4;
    __int16 v6 = 2048;
    uint64_t v7 = a2;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "invalid compression type %d specified for compatibility version %ld", (uint8_t *)v5, 0x12u);
  }
  __assert_rtn("-[DTXMessage compressWithCompressor:usingType:forCompatibilityWithVersion:]", "DTXMessage.m", 471, "false && \"unexpected _compressionType, unsupported by compatibility version 1 --- logic error in compression selection\"");
}

void sub_22AF5314C()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSErrorWithFilePathErrnoAndVariant()
{
  return MEMORY[0x270EF2CA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x270ED7F60](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x270ED7F98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x270F9A3F0]();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A420](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9A440](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x270F9A458](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x270F98F60](*(void *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B8](strm, *(void *)&level, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x270ED9980]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x270ED9988]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x270ED9B90](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

pid_t getppid(void)
{
  return MEMORY[0x270ED9CF0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x270F9C748](strm, version, *(void *)&stream_size);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return MEMORY[0x270EDA1A8](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_extract_right(ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x270EDA1E0](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x270EDA250](*(void *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register(task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x270EDA258](*(void *)&target_task, init_port_set, *(void *)&init_port_setCnt);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x270EDA270](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDA2D8](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

const char **__cdecl objc_copyClassNamesForImage(const char *image, unsigned int *outCount)
{
  return (const char **)MEMORY[0x270F9A5C0](image, outCount);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x270F9A680](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

[super a2];
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x270EDAC90](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_getflags(const posix_spawnattr_t *a1, __int16 *a2)
{
  return MEMORY[0x270EDACB0](a1, a2);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x270EDACC0](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

int posix_spawnattr_setpgroup(posix_spawnattr_t *a1, pid_t a2)
{
  return MEMORY[0x270EDACD8](a1, *(void *)&a2);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x270F9AAA8](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  int v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x270EDB400](a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDB470](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x270EDB478](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x270EDB660](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x270EDB840](*(void *)&target_tport, *(void *)&pid, t);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x270EDB9C8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x270EDC000]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC028](xdict, key);
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x270EDC038]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

uint64_t xpc_dictionary_set_mach_recv()
{
  return MEMORY[0x270EDC120]();
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}