__CFString *AMStringForAmbientTriggerState(uint64_t a1)
{
  __CFString *v1;

  v1 = @"unknown";
  if (a1 == 1) {
    v1 = @"asserted";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"idle";
  }
}

__CFString *AMStringForCMMagicMountStateStatus(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_2652233C0[a1 - 1];
  }
}

__CFString *AMStringForAmbientMountState(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_2652233A0[a1];
  }
}

void sub_24782CCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24782D340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *AMStringForAmbientPresentationState(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_2652233E0[a1];
  }
}

void sub_24782DD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24782E7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AMLogGeneral()
{
  if (AMLogGeneral_onceToken != -1) {
    dispatch_once(&AMLogGeneral_onceToken, &__block_literal_global);
  }
  v0 = (void *)AMLogGeneral___logObj;
  return v0;
}

uint64_t __AMLogGeneral_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.Ambient", "General");
  uint64_t v1 = AMLogGeneral___logObj;
  AMLogGeneral___logObj = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id AMLogMotion()
{
  if (AMLogMotion_onceToken != -1) {
    dispatch_once(&AMLogMotion_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)AMLogMotion___logObj;
  return v0;
}

uint64_t __AMLogMotion_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.Ambient", "Motion");
  uint64_t v1 = AMLogMotion___logObj;
  AMLogMotion___logObj = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id AMLogPresentation()
{
  if (AMLogPresentation_onceToken != -1) {
    dispatch_once(&AMLogPresentation_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)AMLogPresentation___logObj;
  return v0;
}

uint64_t __AMLogPresentation_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.Ambient", "Presentation");
  uint64_t v1 = AMLogPresentation___logObj;
  AMLogPresentation___logObj = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id AMLogRedMode()
{
  if (AMLogRedMode_onceToken != -1) {
    dispatch_once(&AMLogRedMode_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)AMLogRedMode___logObj;
  return v0;
}

uint64_t __AMLogRedMode_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ambient.Ambient", "RedMode");
  uint64_t v1 = AMLogRedMode___logObj;
  AMLogRedMode___logObj = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_247830C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_247831040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}