void sub_236725364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2367258D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

id nanocamera_log_preview()
{
  if (nanocamera_log_preview_onceToken != -1) {
    dispatch_once(&nanocamera_log_preview_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)nanocamera_log_preview_log;
  return v0;
}

id nanocamera_log_control()
{
  if (nanocamera_log_control_onceToken != -1) {
    dispatch_once(&nanocamera_log_control_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)nanocamera_log_control_log;
  return v0;
}

uint64_t __nanocamera_log_preview_block_invoke()
{
  nanocamera_log_preview_log = (uint64_t)os_log_create("com.apple.NanoCamera", "preview");
  return MEMORY[0x270F9A758]();
}

uint64_t __nanocamera_log_control_block_invoke()
{
  nanocamera_log_control_log = (uint64_t)os_log_create("com.apple.NanoCamera", "control");
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id nanocamera_log_app()
{
  if (nanocamera_log_app_onceToken != -1) {
    dispatch_once(&nanocamera_log_app_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)nanocamera_log_app_log;
  return v0;
}

uint64_t __nanocamera_log_app_block_invoke()
{
  nanocamera_log_app_log = (uint64_t)os_log_create("com.apple.NanoCamera", "app");
  return MEMORY[0x270F9A758]();
}

BOOL _ncCaptureDeviceFromCCCaptureDevice(uint64_t a1)
{
  return a1 != 0;
}

BOOL _ccCaptureDeviceFromNCCaptureDevice(int a1)
{
  return a1 != 0;
}

uint64_t _ncCaptureModeFromCCCaptureMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return dword_23672E610[a1 - 1];
  }
}

uint64_t _ccCaptureModeFromNCCaptureMode(int a1)
{
  if ((a1 - 1) > 9) {
    return 0;
  }
  else {
    return qword_23672E630[a1 - 1];
  }
}

uint64_t _ncFlashSupportFromCCFlashSupport(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ncFlashModeFromCCFlashMode(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ccFlashModeFromNCFlashMode(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ncHDRSupportFromCCHDRSupport(uint64_t result)
{
  if ((unint64_t)(result - 1) < 3) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t _ncHDRModeFromCCHDRMode(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ccHDRModeFromNCHDRMode(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ncIrisSupportFromCCIrisSupport(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ncIrisModeFromCCIrisMode(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

uint64_t _ccIrisModeFromNCIrisMode(int a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return a1 == 1;
  }
}

BOOL _ncSharedLibrarySupportFromCCSharedLibrarySupport(uint64_t a1)
{
  return a1 != 0;
}

BOOL _ncSharedLibraryModeFromCCSharedLibraryMode(uint64_t a1)
{
  return a1 != 0;
}

BOOL _ccSharedLibraryModeFromNCSharedLibraryMode(int a1)
{
  return a1 != 0;
}

uint64_t _ncShallowDepthOfFieldStatusFromCCShallowDepthOfFieldStatus(uint64_t result)
{
  if ((unint64_t)(result - 1) < 8) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t _ncOrientationFromDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return dword_23672E680[a1 - 1];
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}