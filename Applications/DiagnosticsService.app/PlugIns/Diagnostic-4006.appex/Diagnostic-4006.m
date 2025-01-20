id sub_100001310(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100001A18(id a1)
{
  qword_100008908 = objc_alloc_init(DAHIDEventMonitor);

  _objc_release_x1();
}

void sub_100001F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001F88(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) HIDEvents];
  v3 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  v4 = [v3 objectForKeyedSubscript:@"HIDServiceClient"];
  v5 = (__IOHIDServiceClient *)[v4 pointerValue];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(v5, *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 64)) != 0;
  }
  else
  {
    v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002884();
    }
  }
}

void sub_100002400(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _HIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    v5 = [a2 delegate];
    [v5 handleHIDEvent:a4];
  }
  return 0;
}

void sub_100002604(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100002620(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_1000027B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000027D8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Compass NOT found. (0)", v1, 2u);
}

void sub_10000281C()
{
  sub_1000027CC();
  sub_1000027B0((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
}

void sub_100002850()
{
  sub_1000027CC();
  sub_1000027B0((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
}

void sub_100002884()
{
  sub_1000027CC();
  sub_1000027B0((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
}

void sub_1000028B8()
{
  sub_1000027CC();
  sub_1000027B0((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
}

void sub_1000028EC()
{
  sub_1000027CC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
}

void sub_10000292C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_10000296C()
{
  sub_1000027CC();
  sub_1000027B0((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallback()
{
  return _IOHIDEventSystemClientRegisterEventFilterCallback();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterCallback()
{
  return _IOHIDEventSystemClientUnregisterEventFilterCallback();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return _IOHIDEventSystemClientUnscheduleFromDispatchQueue();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return [a1 HIDEvents];
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return [a1 HIDSystemClient];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return [a1 cleanUpSystemClient];
}

id objc_msgSend_compassDataCount(void *a1, const char *a2, ...)
{
  return [a1 compassDataCount];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return [a1 currentlyMonitoring];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_eventMonitor(void *a1, const char *a2, ...)
{
  return [a1 eventMonitor];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_mHIDEventQueue(void *a1, const char *a2, ...)
{
  return [a1 mHIDEventQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}