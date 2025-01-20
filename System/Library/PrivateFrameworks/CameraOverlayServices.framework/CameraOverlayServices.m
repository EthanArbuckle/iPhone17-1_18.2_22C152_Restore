uint64_t CAMIsCameraButtonAvailable()
{
  uint64_t result;
  uint64_t vars8;

  result = _os_feature_enabled_impl();
  if (result)
  {
    return MEMORY[0x270F95FB8](@"CameraButtonCapability");
  }
  return result;
}

void sub_2497035AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t CAMIsCameraButtonEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t CAMIsCameraOverlayEnabled()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    if (_os_feature_enabled_impl())
    {
      return 1;
    }
    else
    {
      return _os_feature_enabled_impl();
    }
  }
  return result;
}

uint64_t CAMIsCameraOverlayAvailable()
{
  uint64_t result = CAMIsCameraOverlayEnabled();
  if (result)
  {
    return CAMIsCameraButtonAvailable();
  }
  return result;
}

uint64_t CAMIsCameraButtonPOREventRoutingEnabled()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    return _os_feature_enabled_impl();
  }
  return result;
}

__CFString *CAMStringForOverlayServiceConnectionStatus(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_265261EE0[a1];
  }
}

void sub_249705DB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

id CAMOverlayErrorForStatus(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a1 == 2)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F80];
    v9[0] = @"InvalidConnection";
    v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v3 = v5;
    uint64_t v4 = -2;
    goto LABEL_5;
  }
  if (!a1)
  {
    uint64_t v1 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F80];
    v9[0] = @"InactiveConnection";
    v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v3 = v1;
    uint64_t v4 = -1;
LABEL_5:
    v6 = [v3 errorWithDomain:@"CAMOverlayErrorDomain" code:v4 userInfo:v2];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  return v6;
}

id CAMOverlayErrorForCode(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  v3 = @"InvalidValueType";
  if (a1 != -12) {
    v3 = 0;
  }
  if (a1 == -13) {
    v3 = @"InvalidValue";
  }
  if (a1 == -100) {
    v3 = @"InvalidIdentifier";
  }
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v2 errorWithDomain:@"CAMOverlayErrorDomain" code:a1 userInfo:v4];

  return v5;
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}