uint64_t THLogHandleForCategory(int a1)
{
  if (THLogHandleForCategory_onceToken != -1) {
    dispatch_once(&THLogHandleForCategory_onceToken, &__block_literal_global);
  }
  return THLogHandleForCategory_logHandles[a1];
}

os_log_t __THLogHandleForCategory_block_invoke()
{
  THLogHandleForCategory_logHandles[0] = (uint64_t)os_log_create("com.apple.thread", "unspecified");
  os_log_t result = os_log_create("com.apple.thread", "credentials");
  qword_1EA7074D8 = (uint64_t)result;
  return result;
}

int setlogmask(int a1)
{
  int v1 = logMask;
  logMask = a1;
  return v1;
}

uint64_t syslog_is_the_mask_enabled(char a1)
{
  return (logMask >> a1) & 1;
}

uint64_t ThreadNetworkLoggingCategory(int a1)
{
  if (ThreadNetworkLoggingCategory_onceToken != -1) {
    dispatch_once(&ThreadNetworkLoggingCategory_onceToken, &__block_literal_global_1);
  }
  return ThreadNetworkLoggingCategory_logHandles[a1];
}

os_log_t __ThreadNetworkLoggingCategory_block_invoke()
{
  ThreadNetworkLoggingCategory_logHandles = (uint64_t)os_log_create("com.apple.ThreadNetwork", "THClient");
  os_log_t result = os_log_create("com.apple.ThreadNetwork", "THServer");
  qword_1EC05F400 = (uint64_t)result;
  return result;
}

void sub_1D49C4B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void DispatchXPCConnectionQueueIfNecessarySync(void *a1)
{
}

void sub_1D49C4CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v17 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D49C4E54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D49C519C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_1D49C54AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D49C5640(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D49C58B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D49C5D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1D49C62A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t dispatch_get_xpc_connection_queue()
{
  if (dispatch_get_xpc_connection_queue_onceToken != -1) {
    dispatch_once(&dispatch_get_xpc_connection_queue_onceToken, &__block_literal_global_28);
  }
  return dispatch_get_xpc_connection_queue__xpcConnectionQueue;
}

dispatch_queue_t __dispatch_get_xpc_connection_queue_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t result = dispatch_queue_create("CTCS Client XPC Connection Queue", v0);
  dispatch_get_xpc_connection_queue__xpcConnectionQueue = (uint64_t)result;
  return result;
}

void DispatchXPCConnectionQueueIfNecessaryAndWait(void *a1, int a2)
{
  block = a1;
  if (DispatchXPCConnectionQueueIfNecessaryAndWait_onceToken != -1) {
    dispatch_once(&DispatchXPCConnectionQueueIfNecessaryAndWait_onceToken, &__block_literal_global_31);
  }
  if (dispatch_get_specific((const void *)DispatchXPCConnectionQueueIfNecessaryAndWait_xpcConnectionQueueMarker))
  {
    block[2]();
  }
  else
  {
    v3 = block;
    if (a2)
    {
      if (dispatch_get_xpc_connection_queue_onceToken != -1)
      {
        dispatch_once(&dispatch_get_xpc_connection_queue_onceToken, &__block_literal_global_28);
        v3 = block;
      }
      dispatch_sync((dispatch_queue_t)dispatch_get_xpc_connection_queue__xpcConnectionQueue, v3);
    }
    else
    {
      if (dispatch_get_xpc_connection_queue_onceToken != -1)
      {
        dispatch_once(&dispatch_get_xpc_connection_queue_onceToken, &__block_literal_global_28);
        v3 = block;
      }
      dispatch_async((dispatch_queue_t)dispatch_get_xpc_connection_queue__xpcConnectionQueue, v3);
    }
  }
}

void __DispatchXPCConnectionQueueIfNecessaryAndWait_block_invoke()
{
  if (dispatch_get_xpc_connection_queue_onceToken != -1) {
    dispatch_once(&dispatch_get_xpc_connection_queue_onceToken, &__block_literal_global_28);
  }
  v0 = dispatch_get_xpc_connection_queue__xpcConnectionQueue;
  int v1 = (const void *)DispatchXPCConnectionQueueIfNecessaryAndWait_xpcConnectionQueueMarker;
  uint64_t v2 = (void *)DispatchXPCConnectionQueueIfNecessaryAndWait_xpcConnectionQueueMarker;

  dispatch_queue_set_specific(v0, v1, v2, 0);
}

void sub_1D49C68B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D49C6AD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}