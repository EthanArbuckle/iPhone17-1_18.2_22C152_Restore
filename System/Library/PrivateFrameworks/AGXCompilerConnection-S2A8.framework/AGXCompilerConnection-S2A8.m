uint64_t sub_235F532DC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_235F53310()
{
  unint64_t v0 = 0x26884D000uLL;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26884DBF8, memory_order_acquire) & 1) == 0)
  {
    int v2 = __cxa_guard_acquire(&qword_26884DBF8);
    unint64_t v0 = 0x26884D000;
    if (v2)
    {
      qword_26884DBF0 = (uint64_t)os_log_create("com.apple.agx", "AGCEnv");
      __cxa_guard_release(&qword_26884DBF8);
      unint64_t v0 = 0x26884D000;
    }
  }
  return *(void *)(v0 + 3056);
}

uint64_t sub_235F53380()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_26884DC00);
}

void *sub_235F5338C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_235F53444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v4 = *(NSObject **)(a1 + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_235F534BC;
  v5[3] = &unk_264C96548;
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a1;
  v5[7] = a4;
  dispatch_sync(v4, v5);
}

void sub_235F534BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  xpc_object_t v3 = sub_235F53558(v2, *(NSObject **)(a1 + 32), *(NSObject **)(a1 + 40));
  xpc_dictionary_set_string(v3, "log_file_name", *(const char **)(a1 + 56));
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v3);
  if (MEMORY[0x237DF91D0]() == MEMORY[0x263EF8720]) {
    syslog(3, "AGX compiler connection: Failed to log build request");
  }
  xpc_release(v3);
  xpc_release(v4);
}

xpc_object_t sub_235F53558(uint64_t a1, NSObject *a2, NSObject *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "architecture", *(unsigned int *)(a1 + 20));
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t v7 = *(const void **)(a1 + 24);
    size_t v8 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = (const void *)(a1 + 24);
    size_t v8 = *(unsigned __int8 *)(a1 + 47);
  }
  xpc_object_t v9 = xpc_data_create(v7, v8);
  xpc_dictionary_set_value(v6, "compiler_options", v9);
  xpc_release(v9);
  xpc_object_t v10 = xpc_data_create_with_dispatch_data(a2);
  xpc_dictionary_set_value(v6, "state", v10);
  xpc_release(v10);
  if (a3)
  {
    xpc_object_t v11 = xpc_data_create_with_dispatch_data(a3);
    xpc_dictionary_set_value(v6, "bitcode", v11);
    xpc_release(v11);
  }
  return v6;
}

uint64_t sub_235F53640(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v7 = a1[1];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_235F53A78;
  v29[3] = &unk_264C96520;
  v29[4] = a2;
  v29[5] = a3;
  v29[6] = a4;
  v29[7] = &v30;
  v29[8] = &v34;
  v29[9] = a1;
  dispatch_sync(v7, v29);
  if (*((unsigned char *)v31 + 24) && MGGetBoolAnswer())
  {
    sub_235F5338C(&v42, (char *)&unk_235F5591D);
    pid_t v8 = getpid();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long buffer = 0u;
    long long v45 = 0u;
    int v9 = proc_name(v8, &buffer, 0x80u);
    if (v9)
    {
      uint64_t v10 = v9;
      p_long long buffer = &buffer;
      uint64_t v12 = MEMORY[0x263EF8318];
      do
      {
        unsigned int v13 = *(char *)p_buffer;
        if ((v13 & 0x80000000) != 0) {
          int v14 = __maskrune(v13, 0x500uLL);
        }
        else {
          int v14 = *(_DWORD *)(v12 + 4 * v13 + 60) & 0x500;
        }
        if (!v14) {
          *(unsigned char *)p_long long buffer = 95;
        }
        p_long long buffer = (long long *)((char *)p_buffer + 1);
        --v10;
      }
      while (v10);
    }
    std::string::append(&v42, (const std::string::value_type *)&buffer);
    std::string v43 = v42;
    memset(&v42, 0, sizeof(v42));
    pid_t v15 = getpid();
    std::to_string(&v39, v15);
    v16 = std::string::insert(&v39, 0, "_");
    long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    v18 = std::string::append(&v40, "_");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v41.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    LODWORD(v18) = dword_26884DC10++;
    std::to_string(&v38, v18);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v20 = &v38;
    }
    else {
      v20 = (std::string *)v38.__r_.__value_.__r.__words[0];
    }
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v38.__r_.__value_.__l.__size_;
    }
    v22 = std::string::append(&v41, (const std::string::value_type *)v20, size);
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    *(void *)&long long v45 = *((void *)&v22->__r_.__value_.__l + 2);
    long long buffer = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    if ((SBYTE7(v45) & 0x80u) == 0) {
      v24 = (const std::string::value_type *)&buffer;
    }
    else {
      v24 = (const std::string::value_type *)buffer;
    }
    if ((SBYTE7(v45) & 0x80u) == 0) {
      std::string::size_type v25 = BYTE7(v45);
    }
    else {
      std::string::size_type v25 = *((void *)&buffer + 1);
    }
    std::string::append(&v43, v24, v25);
    if (SBYTE7(v45) < 0) {
      operator delete((void *)buffer);
    }
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v41.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
    if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v26 = &v43;
    }
    else {
      v26 = (std::string *)v43.__r_.__value_.__r.__words[0];
    }
    (*(void (**)(void *, uint64_t, uint64_t, std::string *))(*a1 + 24))(a1, a2, a3, v26);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v43.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v27 = *((unsigned int *)v35 + 6);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v27;
}

void sub_235F539A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,char a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  if (*(char *)(v57 - 233) < 0) {
    operator delete(*(void **)(v57 - 256));
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_235F53A78(void *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[9];
  xpc_object_t v3 = _os_activity_create(&dword_235F52000, "compiling shader", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  size_t v5 = a1[4];
  xpc_object_t v4 = a1[5];
  uint64_t v27 = a1;
  uint64_t block = 0;
  *(void *)&long long v36 = &block;
  *((void *)&v36 + 1) = 0x9812000000;
  int v37 = sub_235F54C50;
  std::string v38 = nullsub_4;
  std::string v39 = "";
  CC_SHA256_Init(&v40);
  size_t applier = MEMORY[0x263EF8330];
  p_size_t applier = 3221225472;
  uint64_t v32 = (uint64_t)sub_235F54C80;
  char v33 = &unk_264C96590;
  p_uint64_t block = &block;
  dispatch_data_apply(v5, &applier);
  if (v4)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_235F54CB0;
    v29[3] = &unk_264C96590;
    v29[4] = &block;
    dispatch_data_apply(v4, v29);
  }
  CC_SHA256_Final((unsigned __int8 *)(v2 + 48), (CC_SHA256_CTX *)(v36 + 48));
  _Block_object_dispose(&block, 8);
  uint64_t v6 = *(void *)(v2 + 80);
  uint64_t v7 = (uint64_t (*)())a1[6];
  size_t applier = 0;
  p_size_t applier = (uint64_t)&applier;
  uint64_t v32 = 0x2020000000;
  LODWORD(v33) = 0;
  if (*(_DWORD *)v6)
  {
    pid_t v8 = *(NSObject **)(v6 + 24);
    uint64_t block = MEMORY[0x263EF8330];
    *(void *)&long long v36 = 3221225472;
    *((void *)&v36 + 1) = sub_235F54D3C;
    int v37 = (__n128 (*)(uint64_t, uint64_t))&unk_264C965B8;
    *(void *)v40.count = v6;
    *(void *)v40.hash = v2 + 48;
    std::string v38 = v7;
    std::string v39 = (const char *)&applier;
    dispatch_sync(v8, &block);
    int v9 = *(_DWORD *)(p_applier + 24);
    _Block_object_dispose(&applier, 8);
    if (v9)
    {
      *(_DWORD *)(*(void *)(v27[8] + 8) + 24) = 2;
      goto LABEL_36;
    }
  }
  else
  {
    _Block_object_dispose(&applier, 8);
  }
  v26 = v3;
  xpc_object_t v10 = sub_235F53558(v2, v27[4], v27[5]);
  char v11 = 0;
  char v12 = 1;
  uint64_t v13 = MEMORY[0x263EF8720];
  xpc_object_t v14 = (xpc_object_t)MEMORY[0x263EF86A0];
  while (1)
  {
    char v15 = v11;
    if ((v12 & 1) == 0)
    {
      xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v16, "connection_ping", 1);
      uint64_t v17 = mach_absolute_time();
      unsigned int v18 = 0;
      do
      {
        if (v18 == 5) {
          sleep(1u);
        }
        xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v16);
        uint64_t v20 = MEMORY[0x237DF91D0]();
        xpc_release(v19);
        if (v18 > 8) {
          break;
        }
        ++v18;
      }
      while (v20 == v13);
      xpc_release(v16);
      if (v20 == v13)
      {
        xpc_object_t v3 = v26;
        uint64_t v25 = mach_absolute_time();
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          if (qword_26884DC08 != -1) {
            dispatch_once(&qword_26884DC08, &unk_26E94E910);
          }
          uint64_t block = 0xA04000200;
          LOWORD(v36) = 2048;
          *(void *)((char *)&v36 + 2) = (*(unsigned int *)algn_26884DC04
                                         + (v25 - v17) * dword_26884DC00
                                         - 1)
                                        / *(unsigned int *)algn_26884DC04;
          _os_log_fault_impl(&dword_235F52000, &_os_log_internal, OS_LOG_TYPE_FAULT, "AGXCompiler: failed to ping the compiler service %u times over %llu ns", (uint8_t *)&block, 0x12u);
        }
        uint64_t v22 = v27[7];
        goto LABEL_33;
      }
    }
    xpc_object_t v21 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 88), v10);
    if (MEMORY[0x237DF91D0]() != v13) {
      break;
    }
    if (v21 == v14)
    {
      syslog(4, "Compiler connection failed with XPC_ERROR_CONNECTION_INTERRUPTED");
    }
    else
    {
      if (v21 == (xpc_object_t)MEMORY[0x263EF86A8])
      {
        syslog(3, "Compiler connection failed with XPC_ERROR_CONNECTION_INVALID");
LABEL_23:
        sub_235F54110(v2);
        goto LABEL_24;
      }
      if (v21 == (xpc_object_t)MEMORY[0x263EF86C0])
      {
        syslog(3, "Compiler connection failed  with XPC_ERROR_TERMINATION_IMMINENT");
        goto LABEL_23;
      }
      syslog(3, "Compiler connection failed with unknown XPC error");
    }
LABEL_24:
    char v12 = 0;
    char v11 = 1;
    if (v15)
    {
      sub_235F54060((uint64_t)v21);
      xpc_object_t v3 = v26;
      uint64_t v22 = v27[7];
LABEL_33:
      *(unsigned char *)(*(void *)(v22 + 8) + 24) = 1;
      goto LABEL_36;
    }
  }
  xpc_release(v10);
  size_t applier = 0;
  xpc_object_t v3 = v26;
  v29[0] = xpc_dictionary_get_data(v21, "reply", &applier);
  if (v29[0])
  {
    (*(void (**)(void))(v27[6] + 16))();
    if (xpc_dictionary_get_BOOL(v21, "error"))
    {
      uint64_t v23 = *(void *)(v2 + 80);
      if (*(_DWORD *)v23)
      {
        v24 = *(NSObject **)(v23 + 24);
        uint64_t block = MEMORY[0x263EF8330];
        *(void *)&long long v36 = 3221225472;
        *((void *)&v36 + 1) = sub_235F54EFC;
        int v37 = (__n128 (*)(uint64_t, uint64_t))&unk_264C965D8;
        std::string v38 = (uint64_t (*)())v23;
        std::string v39 = (const char *)v29;
        *(void *)v40.count = &applier;
        *(void *)v40.hash = v2 + 48;
        dispatch_sync(v24, &block);
      }
      *(_DWORD *)(*(void *)(v27[8] + 8) + 24) = 1;
    }
  }
  else
  {
    sub_235F54060((uint64_t)v21);
    *(unsigned char *)(*(void *)(v27[7] + 8) + 24) = 1;
  }
  xpc_release(v21);
LABEL_36:

  os_activity_scope_leave(&state);
}

void sub_235F54018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

void sub_235F54060(uint64_t a1)
{
  if (a1 == MEMORY[0x263EF86A0])
  {
    v1 = "XPC_ERROR_CONNECTION_INTERRUPTED";
  }
  else if (a1 == MEMORY[0x263EF86A8])
  {
    v1 = "XPC_ERROR_CONNECTION_INVALID";
  }
  else if (a1 == MEMORY[0x263EF86C0])
  {
    v1 = "XPC_ERROR_TERMINATION_IMMINENT";
  }
  else if (a1 && MEMORY[0x237DF91D0]() == MEMORY[0x263EF8720])
  {
    v1 = "XPC_TYPE_ERROR_UNKNOWN";
  }
  else
  {
    v1 = "XPC_SERVICE_BUILD_FAILURE";
  }
  syslog(3, "AGX compiler connection %s", v1);
}

void sub_235F54110(uint64_t a1)
{
  syslog(3, "Deleting compiler connection and creating a new one");
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 88));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  uint64_t v2 = xpc_connection_create("com.apple.AGXCompilerService-S2A8", 0);
  *(void *)(a1 + 88) = v2;
  xpc_connection_set_event_handler(v2, &unk_26E94E960);
  xpc_object_t v3 = *(_xpc_connection_s **)(a1 + 88);
  xpc_connection_resume(v3);
}

void sub_235F54188(uint64_t a1)
{
  sub_235F541C0(a1);
  JUMPOUT(0x237DF8E00);
}

uint64_t sub_235F541C0(uint64_t a1)
{
  *(void *)a1 = &unk_26E94E990;
  xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 88), &unk_26E94E9D0);
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 88));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  return sub_235F54244(a1);
}

void sub_235F54230(_Unwind_Exception *a1)
{
  sub_235F54244(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_235F54244(uint64_t a1)
{
  *(void *)a1 = &unk_26E94E940;
  CompilerFSCacheDestroy((uint64_t *)(a1 + 80));
  dispatch_release(*(dispatch_object_t *)(a1 + 8));
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  return a1;
}

void CompilerConnectionCreate()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_235F5476C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (*(char *)(v36 + 47) < 0) {
    operator delete(*v37);
  }
  MEMORY[0x237DF8E00](v36, 0x10B3C40B20F9A2BLL);
  _Unwind_Resume(a1);
}

uint64_t CompilerConnectionDestroy(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void CompilerFSCacheCreate()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_235F54A40(_Unwind_Exception *a1)
{
  MEMORY[0x237DF8E00](v1, 0x10A0C40E94E7A3ELL);
  _Unwind_Resume(a1);
}

uint64_t *CompilerFSCacheDestroy(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result)
  {
    if (*(_DWORD *)v1)
    {
      uint64_t v2 = *(NSObject **)(v1 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_235F54B28;
      block[3] = &unk_264C96568;
      block[4] = v1;
      dispatch_sync(v2, block);
      dispatch_release(*(dispatch_object_t *)(v1 + 24));
    }
    JUMPOUT(0x237DF8E00);
  }
  return result;
}

void sub_235F54B28()
{
  int v0 = fscache_close();
  if (v0) {
    syslog(3, "Compiler cache close failed with status = %d\n", v0);
  }
}

uint64_t CompilerFSCacheGetShaderCacheKeys(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_235F54C14;
  v4[3] = &unk_264C96600;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_235F54C14(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 40);
  if (result)
  {
    uint64_t result = fscache_get_cache_keys();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

__n128 sub_235F54C50(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 48) = v2;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 128) = v6;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t sub_235F54C80(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  return 1;
}

uint64_t sub_235F54CB0(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  return 1;
}

uint64_t sub_235F54CE0(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, a1, a2);
  return CC_SHA256_Final(a3, &c);
}

uint64_t sub_235F54D3C(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[6];
  uint64_t result = fscache_find_and_retain();
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) == 203)
  {
    ++*(_DWORD *)(v2 + 36);
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
    return result;
  }
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = fscache_element_get_data();
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
  {
    syslog(3, "Compiler get element from cache failed with status = %d\n", *(_DWORD *)(*(void *)(a1[5] + 8) + 24));
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
    return fscache_release();
  }
  long long v7 = 0u;
  long long v8 = 0u;
  sub_235F54CE0((const void *)0x20, 0xFFFFFFE0, (unsigned __int8 *)&v7);
  if ((void)v7 == MEMORY[0]
    && *((void *)&v7 + 1) == MEMORY[8]
    && (void)v8 == MEMORY[0x10]
    && *((void *)&v8 + 1) == MEMORY[0x18])
  {
    (*(void (**)(void))(a1[4] + 16))();
    ++*(_DWORD *)(v2 + 32);
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 1;
    return fscache_release();
  }
  syslog(3, "Compiler get element from cache failed checksum, data corrupted!\n");
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 0;
  return fscache_remove_and_release();
}

void sub_235F54EFC(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v5 = 0u;
  long long v6 = 0u;
  sub_235F54CE0(**(const void ***)(a1 + 40), **(void **)(a1 + 48), (unsigned __int8 *)&v5);
  uint64_t v2 = malloc_type_calloc(1uLL, **(void **)(a1 + 48) + 32, 0x7485F2AEuLL);
  long long v3 = v6;
  *uint64_t v2 = v5;
  v2[1] = v3;
  memcpy(v2 + 2, **(const void ***)(a1 + 40), **(void **)(a1 + 48));
  int v4 = fscache_insert_and_retain();
  free(v2);
  if (v4)
  {
    syslog(3, "Compiler add element to cache failed with status = %d\n", v4);
  }
  else
  {
    if (fscache_element_get_data())
    {
      syslog(3, "Compiler element get data failed with status = %d\n");
    }
    else if (msync(0, (*MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8], 1) < 0)
    {
      __error();
      syslog(3, "Compiler flush pages failed with status = %d\n");
    }
    fscache_release();
  }
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t fscache_close()
{
  return MEMORY[0x270EF9BF0]();
}

uint64_t fscache_element_get_data()
{
  return MEMORY[0x270EF9BF8]();
}

uint64_t fscache_find_and_retain()
{
  return MEMORY[0x270EF9C00]();
}

uint64_t fscache_get_cache_keys()
{
  return MEMORY[0x270EF9C08]();
}

uint64_t fscache_insert_and_retain()
{
  return MEMORY[0x270EF9C10]();
}

uint64_t fscache_open_with_key()
{
  return MEMORY[0x270EF9C20]();
}

uint64_t fscache_release()
{
  return MEMORY[0x270EF9C28]();
}

uint64_t fscache_remove_and_release()
{
  return MEMORY[0x270EF9C30]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x270EDBF98](ddata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}