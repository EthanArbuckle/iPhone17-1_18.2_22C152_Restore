BOOL sub_10000364C(id a1, id a2)
{
  id v2;
  id v3;
  id v4;
  BOOL v5;
  char v7;

  v2 = a2;
  v7 = 0;
  v3 = [v2 dk_numberFromRequiredKey:@"xPos" lowerBound:&off_1000087F8 upperBound:&off_1000087E8 failed:&v7];
  v4 = [v2 dk_numberFromRequiredKey:@"yPos" lowerBound:&off_1000087F8 upperBound:&off_1000087E8 failed:&v7];
  v5 = v7 == 0;

  return v5;
}

void sub_100003CC4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputs];
  [v3 noInputTimeout];
  v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "noInputTimedOut", 0, 0);
  [*(id *)(a1 + 32) setTimeoutTimer:v2];
}

id sub_100003D50(uint64_t a1)
{
  return [*(id *)(a1 + 32) timedOut];
}

void sub_1000049D0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetView];
  v1 = +[UIColor colorWithHexValue:@"007AFF" error:0];
  [v2 setBackgroundColor:v1];
}

void sub_100005838(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Touch Accuracy Test: Parameter not found.", v1, 2u);
}

void sub_10000587C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Touch Accuracy Test: Device not connected to power.", v1, 2u);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
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

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return _IOHIDEventSystemClientCreate();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return _IOHIDServiceClientCopyEvent();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_badTaps(void *a1, const char *a2, ...)
{
  return [a1 badTaps];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_blockHeight(void *a1, const char *a2, ...)
{
  return [a1 blockHeight];
}

id objc_msgSend_blockWidth(void *a1, const char *a2, ...)
{
  return [a1 blockWidth];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_checkForNextTarget(void *a1, const char *a2, ...)
{
  return [a1 checkForNextTarget];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_connectedToPowerRequired(void *a1, const char *a2, ...)
{
  return [a1 connectedToPowerRequired];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_goodTaps(void *a1, const char *a2, ...)
{
  return [a1 goodTaps];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBatteryCharging(void *a1, const char *a2, ...)
{
  return [a1 isBatteryCharging];
}

id objc_msgSend_isPowerConnected(void *a1, const char *a2, ...)
{
  return [a1 isPowerConnected];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_multiTouchHelper(void *a1, const char *a2, ...)
{
  return [a1 multiTouchHelper];
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

id objc_msgSend_numberOfBlocks(void *a1, const char *a2, ...)
{
  return [a1 numberOfBlocks];
}

id objc_msgSend_partialInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 partialInputTimeout];
}

id objc_msgSend_positions(void *a1, const char *a2, ...)
{
  return [a1 positions];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shufflePositions(void *a1, const char *a2, ...)
{
  return [a1 shufflePositions];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_targetView(void *a1, const char *a2, ...)
{
  return [a1 targetView];
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return [a1 temperatureData];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_totalTaps(void *a1, const char *a2, ...)
{
  return [a1 totalTaps];
}

id objc_msgSend_touchLocation(void *a1, const char *a2, ...)
{
  return [a1 touchLocation];
}

id objc_msgSend_touchStatus(void *a1, const char *a2, ...)
{
  return [a1 touchStatus];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}