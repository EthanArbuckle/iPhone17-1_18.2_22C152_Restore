void sub_100001E7C(id a1)
{
  uint64_t vars8;

  qword_100011C80 = objc_alloc_init(DAOpticalProximityManager);

  _objc_release_x1();
}

void MTProximityChangedCallbackFunc(uint64_t a1, uint64_t a2)
{
  id v3 = +[DAOpticalProximityManager sharedInstance];
  [v3 handleNewProximityValue:a2];
}

id numberOrNull(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NSNull null];
  }
  v4 = v3;

  return v4;
}

void sub_1000025D4(id a1)
{
  qword_100011C90 = objc_alloc_init(DADopplerProximityManager);

  _objc_release_x1();
}

void sub_1000028D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_1000028E8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) activateProximitySensor];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000291C(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRunLoop];
}

void sub_100002E10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7 == 132)
  {
    uint64_t v18 = v10;
    uint64_t v19 = v9;
    uint64_t v20 = v7;
    uint64_t v21 = v8;
    int v11 = *(_DWORD *)(a6 + 16);
    v12 = a1;
    v13 = v12[7];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100003108;
    v15[3] = &unk_10000C4A8;
    id v16 = v12;
    int v17 = v11;
    v14 = v12;
    dispatch_async(v13, v15);
  }
}

void sub_100003108(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isUpdating])
  {
    float v3 = *(float *)(a1 + 40);
    v2 = (float *)(a1 + 40);
    [*((id *)v2 - 1) handleNewProximityValue:(int)v3];
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100006FEC(v2, v4);
    }
  }
}

void sub_1000039C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000039F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003A00(uint64_t a1)
{
}

void sub_100003A08(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DiagnosticLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asset data for [%@] is nil", buf, 0xCu);
    }

    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"Image asset data is nil.";
    v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v13 = -7;
    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got asset data for [%@]", buf, 0xCu);
  }

  id v7 = [objc_alloc((Class)UIImage) initWithData:v3];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to load asset data for [%@]", buf, 0xCu);
    }

    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"Downloaded image data is not compatible with UIImage.";
    v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v13 = -6;
LABEL_11:
    uint64_t v15 = +[NSError errorWithDomain:@"DAProximitySensorErrorDomain" code:v13 userInfo:v12];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100004450(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id v2 = [*(id *)(a1 + 32) testPhase];
  if (v2 == (id)2)
  {
    id v3 = [*v1 result];
    v4 = v3;
    BOOL v5 = &off_10000CB00;
    goto LABEL_7;
  }
  if (v2 == (id)1)
  {
    id v3 = [*v1 result];
    v4 = v3;
    BOOL v5 = &off_10000CAE8;
    goto LABEL_7;
  }
  if (!v2)
  {
    id v3 = [*v1 result];
    v4 = v3;
    BOOL v5 = &off_10000CAD0;
LABEL_7:
    [v3 setStatusCode:v5];
    goto LABEL_10;
  }
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000718C(v1, v4);
  }
LABEL_10:

  return [*v1 setTestPhase:3];
}

id sub_100004520(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTestPhase:0];
}

void sub_100004710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004728(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  if (a2 < 200 && v7 == 1)
  {
    id v9 = v5;
    uint64_t v8 = 0;
LABEL_7:
    *(void *)(v6 + 24) = v8;
    [*(id *)(a1 + 32) resetHoldTimerWithProximityState:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v5 = v9;
    goto LABEL_8;
  }
  if (a2 > 200 && !v7)
  {
    id v9 = v5;
    uint64_t v8 = 1;
    goto LABEL_7;
  }
LABEL_8:
}

void sub_100004C2C(uint64_t a1)
{
  [*(id *)(a1 + 32) stopHoldTimer];
  id v8 = [*(id *)(a1 + 32) inputs];
  id v2 = [v8 holdTime];
  [v2 doubleValue];
  double v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v7 = +[NSTimer scheduledTimerWithTimeInterval:v5 target:"holdTimerFinished:" selector:v6 userInfo:0 repeats:v4];
  [*(id *)(a1 + 32) setHoldTimer:v7];
}

void sub_100005134(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) instructionImageView];
  [v1 setAlpha:1.0];
}

void sub_10000523C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) instructionImageView];
  [v1 setAlpha:0.0];
}

void sub_100005520(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000061A0(id a1)
{
  qword_100011CA0 = objc_alloc_init(DAHIDEventMonitor);

  _objc_release_x1();
}

void sub_1000066F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006710(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) HIDEvents];
  double v3 = [v2 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  double v4 = [v3 objectForKeyedSubscript:@"HIDServiceClient"];
  uint64_t v5 = (__IOHIDServiceClient *)[v4 pointerValue];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(v5, *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 64)) != 0;
  }
  else
  {
    uint64_t v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007284();
    }
  }
}

void sub_100006B88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _HIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = [a2 delegate];
    [v5 handleHIDEvent:a4];
  }
  return 0;
}

void sub_100006D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100006DA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_100006F38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006F60(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Found %li dopplers, which is unexpected. Taking the first one.", (uint8_t *)&v3, 0xCu);
}

double sub_100006FEC(float *a1, NSObject *a2)
{
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "ProxVal = %f", (uint8_t *)&v4, 0xCu);
  return result;
}

void sub_10000706C(void *a1)
{
  [a1 proximityState];
  [a1 testPhase];
  sub_100005508();
  sub_100005520((void *)&_mh_execute_header, v2, v3, "Hit unexpected proximity state (%lu) with test phase (%lu).", v4, v5, v6, v7, v8);
}

void sub_1000070FC(void *a1)
{
  [a1 testPhase];
  [a1 proximityState];
  sub_100005508();
  sub_100005520((void *)&_mh_execute_header, v2, v3, "Hit unexpected test phase (%lu) with proximity state (%lu).", v4, v5, v6, v7, v8);
}

void sub_10000718C(id *a1, NSObject *a2)
{
  id v3 = [*a1 testPhase];
  int v4 = 134217984;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Hit unexpected test phase (%lu) while timed out.", (uint8_t *)&v4, 0xCu);
}

void sub_10000721C()
{
  sub_100006F54();
  sub_100006F38((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
}

void sub_100007250()
{
  sub_100006F54();
  sub_100006F38((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
}

void sub_100007284()
{
  sub_100006F54();
  sub_100006F38((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
}

void sub_1000072B8()
{
  sub_100006F54();
  sub_100006F38((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
}

void sub_1000072EC()
{
  sub_100006F54();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
}

void sub_10000732C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_10000736C()
{
  sub_100006F54();
  sub_100006F38((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
}

uint64_t BKSHIDServicesRequestProximityDetectionMode()
{
  return _BKSHIDServicesRequestProximityDetectionMode();
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return _IOHIDDeviceGetReport(device, reportType, reportID, report, pReportLength);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return _IOHIDDeviceSetReport(device, reportType, reportID, report, reportLength);
}

void IOHIDDeviceUnscheduleFromRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
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

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerClose(manager, options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return _IOHIDManagerCopyDevices(manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return _IOHIDManagerCreate(allocator, options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerOpen(manager, options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

uint64_t MTDeviceCreateDefault()
{
  return _MTDeviceCreateDefault();
}

uint64_t MTDeviceGetSensorRegionOfType()
{
  return _MTDeviceGetSensorRegionOfType();
}

uint64_t MTDeviceSetReport()
{
  return _MTDeviceSetReport();
}

uint64_t MTDeviceStart()
{
  return _MTDeviceStart();
}

uint64_t MTDeviceStop()
{
  return _MTDeviceStop();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_activateProximitySensor(void *a1, const char *a2, ...)
{
  return [a1 activateProximitySensor];
}

id objc_msgSend_actualCloseStateThreshold(void *a1, const char *a2, ...)
{
  return [a1 actualCloseStateThreshold];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetDownloadTimeout(void *a1, const char *a2, ...)
{
  return [a1 assetDownloadTimeout];
}

id objc_msgSend_backupDopplerState(void *a1, const char *a2, ...)
{
  return [a1 backupDopplerState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return [a1 cleanUpSystemClient];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return [a1 currentlyMonitoring];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deactivateProximitySensor(void *a1, const char *a2, ...)
{
  return [a1 deactivateProximitySensor];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deregisterForCallback(void *a1, const char *a2, ...)
{
  return [a1 deregisterForCallback];
}

id objc_msgSend_deviceRef(void *a1, const char *a2, ...)
{
  return [a1 deviceRef];
}

id objc_msgSend_deviceStart(void *a1, const char *a2, ...)
{
  return [a1 deviceStart];
}

id objc_msgSend_deviceStop(void *a1, const char *a2, ...)
{
  return [a1 deviceStop];
}

id objc_msgSend_deviceUsageMap(void *a1, const char *a2, ...)
{
  return [a1 deviceUsageMap];
}

id objc_msgSend_disableProximitySensor(void *a1, const char *a2, ...)
{
  return [a1 disableProximitySensor];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downImage(void *a1, const char *a2, ...)
{
  return [a1 downImage];
}

id objc_msgSend_downImageFileName(void *a1, const char *a2, ...)
{
  return [a1 downImageFileName];
}

id objc_msgSend_enableProximitySensor(void *a1, const char *a2, ...)
{
  return [a1 enableProximitySensor];
}

id objc_msgSend_endTest(void *a1, const char *a2, ...)
{
  return [a1 endTest];
}

id objc_msgSend_eventMonitor(void *a1, const char *a2, ...)
{
  return [a1 eventMonitor];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_holdTime(void *a1, const char *a2, ...)
{
  return [a1 holdTime];
}

id objc_msgSend_holdTimer(void *a1, const char *a2, ...)
{
  return [a1 holdTimer];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_instructionImageView(void *a1, const char *a2, ...)
{
  return [a1 instructionImageView];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isUpdating(void *a1, const char *a2, ...)
{
  return [a1 isUpdating];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mHIDEventQueue(void *a1, const char *a2, ...)
{
  return [a1 mHIDEventQueue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 noInputTimeout];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_opticalSensorPresent(void *a1, const char *a2, ...)
{
  return [a1 opticalSensorPresent];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsage];
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsagePage];
}

id objc_msgSend_proxDeviceRef(void *a1, const char *a2, ...)
{
  return [a1 proxDeviceRef];
}

id objc_msgSend_proxQueue(void *a1, const char *a2, ...)
{
  return [a1 proxQueue];
}

id objc_msgSend_proxRunLoop(void *a1, const char *a2, ...)
{
  return [a1 proxRunLoop];
}

id objc_msgSend_proximityManager(void *a1, const char *a2, ...)
{
  return [a1 proximityManager];
}

id objc_msgSend_proximityState(void *a1, const char *a2, ...)
{
  return [a1 proximityState];
}

id objc_msgSend_registerForCallback(void *a1, const char *a2, ...)
{
  return [a1 registerForCallback];
}

id objc_msgSend_registerProximityChangedCallback(void *a1, const char *a2, ...)
{
  return [a1 registerProximityChangedCallback];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resetTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 resetTimeoutTimer];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_retrieveHIDDevice(void *a1, const char *a2, ...)
{
  return [a1 retrieveHIDDevice];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheduleProximityUpdates(void *a1, const char *a2, ...)
{
  return [a1 scheduleProximityUpdates];
}

id objc_msgSend_sensorData(void *a1, const char *a2, ...)
{
  return [a1 sensorData];
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return [a1 sensorType];
}

id objc_msgSend_setupUI(void *a1, const char *a2, ...)
{
  return [a1 setupUI];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stopHoldTimer(void *a1, const char *a2, ...)
{
  return [a1 stopHoldTimer];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopProximitySensorUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopProximitySensorUpdates];
}

id objc_msgSend_stopTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 stopTimeoutTimer];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_testPhase(void *a1, const char *a2, ...)
{
  return [a1 testPhase];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return [a1 timedOut];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_unregisterProximityChangedCallback(void *a1, const char *a2, ...)
{
  return [a1 unregisterProximityChangedCallback];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_upImage(void *a1, const char *a2, ...)
{
  return [a1 upImage];
}

id objc_msgSend_upImageFileName(void *a1, const char *a2, ...)
{
  return [a1 upImageFileName];
}

id objc_msgSend_usageDeviceMap(void *a1, const char *a2, ...)
{
  return [a1 usageDeviceMap];
}

id objc_msgSend_usageSubscribers(void *a1, const char *a2, ...)
{
  return [a1 usageSubscribers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}