uint64_t compileRequestMain(unsigned int *a1)
{
  (*(void (**)(void, void, void, void, void, void))(**((void **)a1 + 4) + 24))(*(void *)(*((void *)a1 + 4) + 8), *a1, a1[1], *((void *)a1 + 1), *((void *)a1 + 2), *((void *)a1 + 3));
  return 0;
}

int main(int argc, const char **argv, const char **envp)
{
  initialize_sandbox();
  global_queue = dispatch_get_global_queue(0, 0);
  gTimer = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
  idle_timer_init();
  xpc_main((xpc_connection_handler_t)MTLCompilerServiceHandleEvent);
}

void initialize_sandbox(void)
{
  if (getenv("TMPDIR")) {
    unsetenv("TMPDIR");
  }
  bzero(v0, 0x400uLL);
  _set_user_dir_suffix();
  if (!confstr(65537, v0, 0x400uLL) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    initialize_sandbox();
  }
}

void idle_timer_init(void)
{
  v0 = getenv("MTL_IDLE_EXIT_TIMEOUT_SECONDS");
  g_idle_timer_reason = (uint64_t)"EV";
  if (v0)
  {
    g_idle_timer_seconds = atoll(v0);
    if (g_idle_timer_seconds >= 1)
    {
      if (serial_queue(void)::onceToken != -1) {
        dispatch_once(&serial_queue(void)::onceToken, &__block_literal_global);
      }
      v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)serial_queue(void)::_serial_queue);
      g_idle_timer = (uint64_t)v1;
      if (v1)
      {
        dispatch_source_set_event_handler_f(v1, (dispatch_function_t)idle_timer_exit);
        idle_timer_reset();
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        idle_timer_init();
      }
    }
  }
  else
  {
    g_idle_timer_seconds = 0;
  }
}

void MTLCompilerServiceHandleEvent(xpc_connection_t connection)
{
  if (serial_queue(void)::onceToken != -1) {
    dispatch_once(&serial_queue(void)::onceToken, &__block_literal_global);
  }
  xpc_connection_set_target_queue(connection, (dispatch_queue_t)serial_queue(void)::_serial_queue);
  xpc_connection_set_event_handler(connection, &__block_literal_global_7);

  xpc_connection_resume(connection);
}

void idle_timer_exit(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134349314;
    uint64_t v2 = g_idle_timer_seconds;
    __int16 v3 = 2082;
    uint64_t v4 = g_idle_timer_reason;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Idle exit MTLCompilerService after %{public}lld seconds (reason: %{public}s).", (uint8_t *)&v1, 0x16u);
  }
  _Exit(0);
}

void idle_timer_reset(void)
{
  if (g_idle_timer)
  {
    dispatch_time_t v0 = dispatch_time(0, 1000000000 * g_idle_timer_seconds);
    dispatch_source_set_timer((dispatch_source_t)g_idle_timer, v0, 0xFFFFFFFFFFFFFFFFLL, 0);
    int v1 = g_idle_timer;
    dispatch_resume(v1);
  }
}

void ___ZL12serial_queuev_block_invoke(id a1)
{
  serial_queue(void)::_serial_queue = (uint64_t)dispatch_queue_create(0, 0);
}

void ___ZL29MTLCompilerServiceHandleEventPU24objcproto13OS_xpc_object8NSObject_block_invoke(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    if (g_idle_timer) {
      dispatch_suspend((dispatch_object_t)g_idle_timer);
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v38 = ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke;
    v39 = &unk_100004388;
    v40 = a2;
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "requestType");
    if (uint64 == 9)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      if (isProbGuardMallocEnabled(void)::onceToken != -1) {
        dispatch_once(&isProbGuardMallocEnabled(void)::onceToken, &__block_literal_global_31);
      }
      if (isProbGuardMallocEnabled(void)::result == 1) {
        xpc_dictionary_set_BOOL(reply, "ProbGuardMalloc", 1);
      }
      remote_connection = xpc_dictionary_get_remote_connection(a2);
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
      goto LABEL_38;
    }
    value = (SandboxExtensionContainer *)xpc_dictionary_get_value(a2, "sandboxTokens");
    v7 = SandboxExtensionContainer::CompilerSandboxExtensions(value);
    SandboxExtensionContainer::SetSandbox((SandboxExtensionContainer *)v7, value);
    int v8 = xpc_dictionary_get_uint64(a2, "llvmVersion");
    string = xpc_dictionary_get_string(a2, "client_name");
    if (string) {
      v10 = (char *)string;
    }
    else {
      v10 = "(unknown client)";
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v10);
    handler = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = ___ZL3ctxiRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke;
    v31 = &__block_descriptor_44_e5_v8__0l;
    LODWORD(v33) = v8;
    v32 = __p;
    if (ctx(int,std::string const&)::onceToken != -1) {
      dispatch_once(&ctx(int,std::string const&)::onceToken, &handler);
    }
    v11 = (void *)ctx(int,std::string const&)::context;
    if (v36 < 0) {
      operator delete(__p[0]);
    }
    v12 = xpc_dictionary_get_string(a2, "pluginPath");
    if (v12)
    {
      v13 = v12;
      xpc_object_t v14 = xpc_dictionary_get_value(a2, "targetData");
      if (v14)
      {
        v15 = v14;
        bytes_ptr = xpc_data_get_bytes_ptr(v14);
        size_t length = xpc_data_get_length(v15);
      }
      else
      {
        bytes_ptr = 0;
        size_t length = 0;
      }
      uint64_t v18 = (*(uint64_t (**)(void, const char *, const void *, size_t))(*v11 + 32))(v11[1], v13, bytes_ptr, length);
      if (v18 == -1)
      {
        handler = 0;
        asprintf_l((char **)&handler, 0, "- Could not load compiler plugin at %s", v13);
        v38((uint64_t)v37, 2u, 0, 0, (const char *)handler);
        free(handler);
LABEL_38:
        idle_timer_reset();
        return;
      }
    }
    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
    xpc_object_t v19 = xpc_dictionary_get_value(a2, "data");
    if (xpc_get_type(v19) == (xpc_type_t)&_xpc_type_data)
    {
      v20 = xpc_data_get_bytes_ptr(v19);
      size_t v21 = xpc_data_get_length(v19);
    }
    else
    {
      v20 = 0;
      size_t v21 = 0;
    }
    if (uint64 == 16)
    {
      xpc_object_t v22 = xpc_dictionary_get_value(a2, "machOFD");
      if (xpc_get_type(v22) == (xpc_type_t)&_xpc_type_fd)
      {
        v20[3] = xpc_fd_dup(v22);
        *((unsigned char *)v20 + 129) = 0;
      }
    }
    if (xpc_dictionary_get_uint64(a2, "setRelaxedMath")) {
      setenv("MTL_REPLACE_FAST_MATH_WITH_RELAXED_MATH", "1", 1);
    }
    v23 = getenv("MTL_HANG_TIMER_LENGTH_IN_SECONDS");
    if (v23)
    {
      uint64_t v24 = atoi(v23);
      int v25 = 2;
    }
    else
    {
      int v25 = 0;
      uint64_t v24 = 700;
    }
    handler = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
    v31 = &unk_1000043B0;
    v32 = (void **)v37;
    v33 = v10;
    int v34 = v25;
    dispatch_source_set_event_handler((dispatch_source_t)gTimer, &handler);
    if (v24 < 1)
    {
      (*(void (**)(void, uint64_t, uint64_t, void *, size_t, void *))(*v11 + 24))(v11[1], v18, uint64, v20, v21, v37);
    }
    else
    {
      v26 = gTimer;
      dispatch_time_t v27 = dispatch_time(0, 1000000000 * (int)v24);
      dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_activate((dispatch_object_t)gTimer);
      (*(void (**)(void, uint64_t, uint64_t, void *, size_t, void *))(*v11 + 24))(v11[1], v18, uint64, v20, v21, v37);
      dispatch_source_set_timer((dispatch_source_t)gTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    goto LABEL_38;
  }
}

void ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke(uint64_t a1, unsigned int a2, const void *a3, size_t a4, const char *a5)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    v11 = reply;
    if (a2)
    {
      xpc_dictionary_set_uint64(reply, "error", a2);
      if (a5) {
        xpc_dictionary_set_string(v11, "errorMessage", a5);
      }
    }
    else
    {
      xpc_object_t v12 = xpc_data_create(a3, a4);
      xpc_dictionary_set_uint64(v11, "error", 0);
      xpc_dictionary_set_value(v11, "reply", v12);
      xpc_release(v12);
    }
    remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(remote_connection, v11);
    xpc_release(v11);
  }
}

long long *SandboxExtensionContainer::CompilerSandboxExtensions(SandboxExtensionContainer *this)
{
  {
    xmmword_100008010 = 0u;
    unk_100008020 = 0u;
    SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton = 0u;
    __cxa_atexit((void (*)(void *))SandboxExtensionContainer::~SandboxExtensionContainer, &SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton, (void *)&_mh_execute_header);
  }
  return &SandboxExtensionContainer::CompilerSandboxExtensions(void)::singleton;
}

BOOL SandboxExtensionContainer::SetSandbox(SandboxExtensionContainer *this, xpc_object_t xarray)
{
  if (xarray)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke;
    applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
    applier[4] = this;
    if (!xpc_array_apply(xarray, applier))
    {
      SandboxExtensionContainer::ResetSandbox(this);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
      v5[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
      v5[4] = this;
      return xpc_array_apply(xarray, v5);
    }
  }
  else if (*(void *)this != *((void *)this + 1))
  {
    SandboxExtensionContainer::ResetSandbox(this);
  }
  return 1;
}

uint64_t ___ZL23MTLServiceHandleMessagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel((dispatch_source_t)gTimer);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  std::string::basic_string[abi:ne180100]<0>(&v14, "Compiler service plugin hung while serving ");
  uint64_t v2 = std::string::append(&v14, *(const std::string::value_type **)(a1 + 40));
  long long v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  uint64_t v4 = std::string::append(&v15, ". Timeout type was ");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  int v6 = *(_DWORD *)(a1 + 48);
  v7 = "API Specified";
  int v8 = "Unknown";
  if (v6 == 2) {
    int v8 = "Environment Variable";
  }
  if (v6 != 1) {
    v7 = v8;
  }
  if (v6) {
    v9 = v7;
  }
  else {
    v9 = "Default";
  }
  v10 = std::string::append(&v18, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  int64_t v17 = v10->__r_.__value_.__r.__words[2];
  long long v16 = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    xpc_object_t v12 = &v16;
    if (v17 < 0) {
      xpc_object_t v12 = (long long *)v16;
    }
    LODWORD(v18.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v18.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v18, 0xCu);
  }
  uint64_t result = abort_with_reason();
  __break(1u);
  return result;
}

void sub_100002620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZL24isProbGuardMallocEnabledv_block_invoke(id a1)
{
  if (malloc_num_zones >= 1)
  {
    uint64_t v1 = 0;
    while (1)
    {
      zone_name = malloc_get_zone_name(*(malloc_zone_t **)(malloc_zones + 8 * v1));
      if (!strncmp(zone_name, "ProbGuardMallocZone", 0x14uLL)) {
        break;
      }
      if (++v1 >= malloc_num_zones) {
        return;
      }
    }
    isProbGuardMallocEnabled(void)::uint64_t result = 1;
  }
}

void __clang_call_terminate(void *a1)
{
}

void SandboxExtensionContainer::~SandboxExtensionContainer(SandboxExtensionContainer *this)
{
  SandboxExtensionContainer::ResetSandbox(this);
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  long long v3 = (void **)this;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void SandboxExtensionContainer::ResetSandbox(SandboxExtensionContainer *this)
{
  uint64_t v2 = *((void *)this + 3);
  uint64_t v3 = *((void *)this + 4);
  if (v2 != v3)
  {
    do
    {
      v2 += 8;
      sandbox_extension_release();
    }
    while (v2 != v3);
    uint64_t v2 = *((void *)this + 3);
  }
  *((void *)this + 4) = v2;

  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

BOOL ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke(uint64_t a1, unint64_t a2, xpc_object_t xstring)
{
  uint64_t v4 = *(void **)(a1 + 32);
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[1] - *v4) >> 3) > a2)
  {
    int v6 = string_ptr;
    v7 = (void *)(*v4 + 24 * a2);
    size_t v8 = strlen(string_ptr);
    if (*((char *)v7 + 23) < 0)
    {
      if (v8 == v7[1])
      {
        if (v8 == -1) {
          goto LABEL_11;
        }
        v7 = (void *)*v7;
        return memcmp(v7, v6, v8) == 0;
      }
    }
    else if (v8 == *((unsigned __int8 *)v7 + 23))
    {
      if (v8 == -1) {
LABEL_11:
      }
        std::string::__throw_out_of_range[abi:ne180100]();
      return memcmp(v7, v6, v8) == 0;
    }
  }
  return 0;
}

BOOL ___ZN25SandboxExtensionContainer10SetSandboxEPU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1, int a2, xpc_object_t xstring)
{
  uint64_t v3 = *(SandboxExtensionContainer **)(a1 + 32);
  string_ptr = (char *)xpc_string_get_string_ptr(xstring);

  return SandboxExtensionContainer::ExtendSandbox(v3, string_ptr);
}

BOOL SandboxExtensionContainer::ExtendSandbox(SandboxExtensionContainer *this, char *a2)
{
  size_t v21 = a2;
  uint64_t v4 = sandbox_extension_consume();
  uint64_t v5 = v4;
  if (v4 != -1)
  {
    unint64_t v6 = *((void *)this + 5);
    v7 = (uint64_t *)*((void *)this + 4);
    if ((unint64_t)v7 >= v6)
    {
      v9 = (uint64_t *)*((void *)this + 3);
      uint64_t v10 = v7 - v9;
      if ((unint64_t)(v10 + 1) >> 61) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v11 = v6 - (void)v9;
      unint64_t v12 = (uint64_t)(v6 - (void)v9) >> 2;
      if (v12 <= v10 + 1) {
        unint64_t v12 = v10 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        std::string v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)this + 40, v13);
        v9 = (uint64_t *)*((void *)this + 3);
        v7 = (uint64_t *)*((void *)this + 4);
      }
      else
      {
        std::string v14 = 0;
      }
      std::string v15 = (uint64_t *)&v14[8 * v10];
      long long v16 = &v14[8 * v13];
      uint64_t *v15 = v5;
      size_t v8 = v15 + 1;
      while (v7 != v9)
      {
        uint64_t v17 = *--v7;
        *--std::string v15 = v17;
      }
      *((void *)this + 3) = v15;
      *((void *)this + 4) = v8;
      *((void *)this + 5) = v16;
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      uint64_t *v7 = v4;
      size_t v8 = v7 + 1;
    }
    *((void *)this + 4) = v8;
    unint64_t v18 = *((void *)this + 1);
    if (v18 >= *((void *)this + 2))
    {
      uint64_t v19 = std::vector<std::string>::__emplace_back_slow_path<char const*&>((uint64_t *)this, &v21);
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(*((void **)this + 1), a2);
      uint64_t v19 = v18 + 24;
      *((void *)this + 1) = v18 + 24;
    }
    *((void *)this + 1) = v19;
  }
  return v5 != -1;
}

void sub_100002AC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_100002B30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::vector<long long>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_100002BD8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const*&>(uint64_t *a1, char **a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_ = __v.__begin_;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, *a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_100002D80(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void ___ZL3ctxiRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke()
{
}

void sub_100003054()
{
}

void MTLConnectionCtx::MTLConnectionCtx(uint64_t a1, int a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = a2;
  operator new();
}

void sub_1000030EC()
{
}

void CompilerPluginInterface::CompilerPluginInterface(CompilerPluginInterface *this, int a2)
{
  *((_DWORD *)this + 10) = a2;
  uint64_t v3 = "/System/Library/PrivateFrameworks/MTLCompiler.framework/Versions/32023/MTLCompiler";
  if (a2 != 32023) {
    uint64_t v3 = 0;
  }
  if (a2 == 32024) {
    unint64_t v4 = "/System/Library/PrivateFrameworks/MTLCompiler.framework/Versions/32024/MTLCompiler";
  }
  else {
    unint64_t v4 = v3;
  }
  unint64_t v5 = dlopen(v4, 5);
  *(void *)this = v5;
  if (v5)
  {
    *((void *)this + 1) = dlsym(v5, "MTLCodeGenServiceCreate");
    *((void *)this + 2) = dlsym(*(void **)this, "MTLCodeGenServiceDestroy");
    *((void *)this + 3) = dlsym(*(void **)this, "MTLCodeGenServiceBuildRequest");
    *((void *)this + 4) = dlsym(*(void **)this, "MTLCodeGenServiceSetPluginPath");
  }
  else
  {
    unint64_t v6 = dlerror();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      CompilerPluginInterface::CompilerPluginInterface((uint64_t)v6);
    }
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + 8) = 0u;
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void initialize_sandbox()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to configure _CS_DARWIN_USER_TEMP_DIR: %{errno}d", (uint8_t *)v1, 8u);
}

void idle_timer_init()
{
  int v0 = 136446210;
  uint64_t v1 = "EV";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create idle timer, idle exit %{public}s is disabled.", (uint8_t *)&v0, 0xCu);
}

void CompilerPluginInterface::CompilerPluginInterface(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to dlopen MTLCompiler framework with error: %s", (uint8_t *)&v1, 0xCu);
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

int asprintf_l(char **a1, locale_t a2, const char *a3, ...)
{
  return _asprintf_l(a1, a2, a3);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t atoll(const char *a1)
{
  return _atoll(a1);
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return _malloc_get_zone_name(zone);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
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

int xpc_fd_dup(xpc_object_t xfd)
{
  return _xpc_fd_dup(xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}