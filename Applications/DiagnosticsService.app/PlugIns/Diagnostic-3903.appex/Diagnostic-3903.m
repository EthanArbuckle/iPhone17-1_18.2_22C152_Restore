void sub_1000041BC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = [*(id *)(a1 + 32) inputs];
  [v3 noInputTimeout];
  v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "noInputTimedOut", 0, 0);
  [*(id *)(a1 + 32) setTimeoutTimer:v2];
}

id sub_100004248(uint64_t a1)
{
  return [*(id *)(a1 + 32) timedOut];
}

void sub_100004B0C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [*(id *)(a1 + 32) view];
  v3 = [v2 subviews];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) tag] == (id)1)
        {

          return;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 32) endTestWithStatusCode:&off_1000086C8];
}

void sub_1000057A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000057C4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_new();
    v7 = [v11 dk_numberFromRequiredKey:@"xPos" lowerBound:&off_100008728 upperBound:&off_100008738 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v7 doubleValue];
    [v6 setX:];

    long long v8 = [v11 dk_numberFromRequiredKey:@"yPos" lowerBound:&off_100008728 upperBound:&off_100008738 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v8 doubleValue];
    [v6 setY:];

    long long v9 = [v11 dk_numberFromRequiredKey:@"width" lowerBound:&off_100008748 upperBound:&off_100008738 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v9 doubleValue];
    [v6 setWidth:];

    long long v10 = [v11 dk_numberFromRequiredKey:@"height" lowerBound:&off_100008748 upperBound:&off_100008738 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v10 doubleValue];
    [v6 setHeight:];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (a4 && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void sub_100005A58(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Touch Response Test: Parameter not found.", v1, 2u);
}

void sub_100005A9C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Touch Response Test: Device not connected to power.", v1, 2u);
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_blockColor(void *a1, const char *a2, ...)
{
  return [a1 blockColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_connectedToPowerRequired(void *a1, const char *a2, ...)
{
  return [a1 connectedToPowerRequired];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
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

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
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

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 noInputTimeout];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
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

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return [a1 temperatureData];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_testFinished(void *a1, const char *a2, ...)
{
  return [a1 testFinished];
}

id objc_msgSend_timeoutSeconds(void *a1, const char *a2, ...)
{
  return [a1 timeoutSeconds];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_touchMap(void *a1, const char *a2, ...)
{
  return [a1 touchMap];
}

id objc_msgSend_touchMapDictionary(void *a1, const char *a2, ...)
{
  return [a1 touchMapDictionary];
}

id objc_msgSend_touchRegions(void *a1, const char *a2, ...)
{
  return [a1 touchRegions];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return [a1 x];
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return [a1 y];
}