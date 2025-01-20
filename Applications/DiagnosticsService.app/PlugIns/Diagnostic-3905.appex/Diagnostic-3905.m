void sub_100001FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001FE8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_opt_new();
    v7 = [v11 dk_numberFromRequiredKey:@"xPos" lowerBound:&off_1000087F0 upperBound:&off_100008800 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v7 doubleValue];
    [v6 setX:];

    v8 = [v11 dk_numberFromRequiredKey:@"yPos" lowerBound:&off_1000087F0 upperBound:&off_100008800 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v8 doubleValue];
    [v6 setY:];

    v9 = [v11 dk_numberFromRequiredKey:@"width" lowerBound:&off_100008810 upperBound:&off_100008800 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
    [v9 doubleValue];
    [v6 setWidth:];

    v10 = [v11 dk_numberFromRequiredKey:@"height" lowerBound:&off_100008810 upperBound:&off_100008800 failed:*(void *)(*(void *)(a1 + 40) + 8) + 24];
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

void sub_1000040A0(uint64_t a1)
{
  [*(id *)(a1 + 32) setSecondsTicked:[*(id *)(a1 + 32) secondsTicked] + 1];
  id v5 = [*(id *)(a1 + 32) progressBar];
  float v2 = (float)(int)[*(id *)(a1 + 32) secondsTicked];
  v3 = [*(id *)(a1 + 32) inputs];
  *(float *)&double v4 = v2 / (float)(int)(60 * [v3 minutesToRun]);
  [v5 setProgress:1 animated:v4];
}

void sub_10000414C(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) progressBar];
    [v3 progress];
    float v5 = v4;

    if (v5 >= 1.0)
    {
      id v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"TEST_COMPLETED" value:&stru_1000086A8 table:0];
      v13 = [*(id *)(a1 + 32) progressLabel];
      [v13 setText:v12];

      dispatch_time_t v14 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004310;
      block[3] = &unk_100008298;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v6 = *(void **)(a1 + 32);
      id v15 = [v6 inputs];
      unsigned int v7 = [v15 minutesToRun];
      signed int v8 = [*(id *)(a1 + 32) secondsTicked];
      v9 = [v6 localizedTimeRemaining:((int)(((unint64_t)(2004318071 * v8) >> 32) - v8) >> 5)+ ((((unint64_t)(2004318071 * v8) >> 32) - v8) >> 31)+ v7];
      v10 = [*(id *)(a1 + 32) progressLabel];
      [v10 setText:v9];
    }
  }
}

id sub_100004310(uint64_t a1)
{
  return [*(id *)(a1 + 32) endTest];
}

void sub_100004D98(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) inputs];
  float v2 = [v3 fadeColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
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

id objc_msgSend_darkTextColor(void *a1, const char *a2, ...)
{
  return [a1 darkTextColor];
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

id objc_msgSend_doNotDisturbLabel(void *a1, const char *a2, ...)
{
  return [a1 doNotDisturbLabel];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fadeColor(void *a1, const char *a2, ...)
{
  return [a1 fadeColor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_hitPixelTimes(void *a1, const char *a2, ...)
{
  return [a1 hitPixelTimes];
}

id objc_msgSend_hitPixels(void *a1, const char *a2, ...)
{
  return [a1 hitPixels];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
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

id objc_msgSend_minutesToRun(void *a1, const char *a2, ...)
{
  return [a1 minutesToRun];
}

id objc_msgSend_multiTouchHelper(void *a1, const char *a2, ...)
{
  return [a1 multiTouchHelper];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressBar(void *a1, const char *a2, ...)
{
  return [a1 progressBar];
}

id objc_msgSend_progressLabel(void *a1, const char *a2, ...)
{
  return [a1 progressLabel];
}

id objc_msgSend_progressTimer(void *a1, const char *a2, ...)
{
  return [a1 progressTimer];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_secondsTicked(void *a1, const char *a2, ...)
{
  return [a1 secondsTicked];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return [a1 temperatureData];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_touchColor(void *a1, const char *a2, ...)
{
  return [a1 touchColor];
}

id objc_msgSend_touchEvents(void *a1, const char *a2, ...)
{
  return [a1 touchEvents];
}

id objc_msgSend_touchMap(void *a1, const char *a2, ...)
{
  return [a1 touchMap];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
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