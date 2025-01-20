uint64_t HIDAnalyticsEventSetIntegerValueForField(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setIntegerValue:a3 forField:a2];
}

uint64_t HIDAnalyticsHistogramEventSetIntegerValue(void *a1, const char *a2)
{
  return [a1 setIntegerValue:a2];
}

HIDAnalyticsEvent *HIDAnalyticsEventCreate(uint64_t a1, void *DeepCopy)
{
  v3 = [NSString stringWithString:a1];
  v4 = v3;
  if (v3)
  {
    if (DeepCopy) {
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], DeepCopy, 2uLL);
    }
    v3 = [[HIDAnalyticsEvent alloc] initWithAttributes:v4 description:DeepCopy];
  }
  else
  {
    DeepCopy = 0;
  }
  v5 = v3;

  return v5;
}

HIDAnalyticsHistogramEvent *HIDAnalyticsHistogramEventCreate(uint64_t a1, void *DeepCopy, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9 = [NSString stringWithString:a1];
  uint64_t v10 = [NSString stringWithString:a3];
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v14 = 0;
    DeepCopy = 0;
  }
  else
  {
    if (DeepCopy) {
      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], DeepCopy, 2uLL);
    }
    v13 = [[HIDAnalyticsHistogramEvent alloc] initWithAttributes:v9 description:DeepCopy];
    v14 = v13;
    if (v13) {
      [(HIDAnalyticsHistogramEvent *)v13 addHistogramFieldWithSegments:v11 segments:a4 count:a5];
    }
  }
  v15 = v14;

  return v15;
}

uint64_t HIDAnalyticsEventAddHistogramField(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [NSString stringWithString:a2];
  if (v7) {
    [a1 addHistogramFieldWithSegments:v7 segments:a3 count:a4];
  }
  return MEMORY[0x270F9A758]();
}

void sub_22133BBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_22133CB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t HIDAnalyticsEventAddField(void *a1, uint64_t a2)
{
  uint64_t v3 = [NSString stringWithString:a2];
  if (v3) {
    [a1 addField:v3];
  }
  return MEMORY[0x270F9A758]();
}

uint64_t HIDAnalyticsEventSetStringValueForField(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setStringValue:a3 forField:a2];
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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