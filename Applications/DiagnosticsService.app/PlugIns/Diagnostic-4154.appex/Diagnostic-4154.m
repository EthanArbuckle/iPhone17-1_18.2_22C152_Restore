void sub_100002B48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100002B74(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v29 = a2;
  v7 = [a3 dk_dictionaryFromRequiredKey:*(void *)(a1 + 32) limitedToKeys:*(void *)(a1 + 40) failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  v8 = objc_opt_new();
  v9 = [*(id *)(a1 + 48) boundOffsetMin];
  v10 = [*(id *)(a1 + 48) boundOffsetMax];
  v11 = [v7 dk_numberFromRequiredKey:@"lowerBoundOffsetX" lowerBound:v9 upperBound:v10 failed:[*(void *)(*(void *)(a1 + 64) + 8) + 24]];
  [v11 floatValue];
  [v8 setLowerBoundOffsetThresholdX:];

  v12 = [*(id *)(a1 + 48) boundOffsetMin];
  v13 = [*(id *)(a1 + 48) boundOffsetMax];
  v14 = [v7 dk_numberFromRequiredKey:@"upperBoundOffsetX" lowerBound:v12 upperBound:v13 failed:[*(void *)(*(void *)(a1 + 64) + 8) + 24]];
  [v14 floatValue];
  [v8 setUpperBoundOffsetThresholdX:];

  v15 = [*(id *)(a1 + 48) boundOffsetMin];
  v16 = [*(id *)(a1 + 48) boundOffsetMax];
  v17 = [v7 dk_numberFromRequiredKey:@"lowerBoundOffsetY" lowerBound:v15 upperBound:v16 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v17 floatValue];
  [v8 setLowerBoundOffsetThresholdY:];

  v18 = [*(id *)(a1 + 48) boundOffsetMin];
  v19 = [*(id *)(a1 + 48) boundOffsetMax];
  v20 = [v7 dk_numberFromRequiredKey:@"upperBoundOffsetY" lowerBound:v18 upperBound:v19 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v20 floatValue];
  [v8 setUpperBoundOffsetThresholdY:];

  v21 = [*(id *)(a1 + 48) boundOffsetMin];
  v22 = [*(id *)(a1 + 48) boundOffsetMax];
  v23 = [v7 dk_numberFromRequiredKey:@"lowerBoundOffsetZ" lowerBound:v21 upperBound:v22 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v23 floatValue];
  [v8 setLowerBoundOffsetThresholdZ:];

  v24 = [*(id *)(a1 + 48) boundOffsetMin];
  v25 = [*(id *)(a1 + 48) boundOffsetMax];
  v26 = [v7 dk_numberFromRequiredKey:@"upperBoundOffsetZ" lowerBound:v24 upperBound:v25 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v26 floatValue];
  [v8 setUpperBoundOffsetThresholdZ:];

  v27 = [v7 dk_numberFromRequiredKey:@"zeroRangeThreshold" lowerBound:&off_100010BB0 upperBound:&off_100010BA0 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v27 floatValue];
  [v8 setZeroRangeThreshold:];

  v28 = [v7 dk_numberFromRequiredKey:@"degreesShiftRangeThreshold" lowerBound:&off_100010BB0 upperBound:&off_100010BA0 failed:*(void *)(*(void *)(a1 + 64) + 8) + 24];
  [v28 floatValue];
  [v8 setDegreesShiftRangeThreshold:];

  if (v8 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 56) setObject:v8 forKeyedSubscript:v29];
  }
  else if (a4)
  {
    *a4 = 1;
  }
}

void sub_100005760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006B94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008DA8(id a1)
{
  qword_1000160F8 = objc_alloc_init(DAHIDEventMonitor);

  _objc_release_x1();
}

void sub_100009300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009318(uint64_t a1)
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
      sub_100009C64();
    }
  }
}

void sub_100009790(_Unwind_Exception *a1)
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

void sub_100009994(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000099B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_100009B40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id numberOrNullForDouble()
{
  v0 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v0;
}

void sub_100009BB8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Interactive Accelerometer and Gyroscope Test: Failed Test Specifications sanity check", v1, 2u);
}

void sub_100009BFC()
{
  sub_100009B5C();
  sub_100009B40((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
}

void sub_100009C30()
{
  sub_100009B5C();
  sub_100009B40((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
}

void sub_100009C64()
{
  sub_100009B5C();
  sub_100009B40((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
}

void sub_100009C98()
{
  sub_100009B5C();
  sub_100009B40((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
}

void sub_100009CCC()
{
  sub_100009B5C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
}

void sub_100009D0C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_100009D4C()
{
  sub_100009B5C();
  sub_100009B40((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DTranslate(retstr, t, tx, ty, tz);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
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

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
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

long double acos(long double __x)
{
  return _acos(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return [a1 HIDEvents];
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return [a1 HIDSystemClient];
}

id objc_msgSend_addNotStationaryData(void *a1, const char *a2, ...)
{
  return [a1 addNotStationaryData];
}

id objc_msgSend_addStationaryData(void *a1, const char *a2, ...)
{
  return [a1 addStationaryData];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_averagedRawData(void *a1, const char *a2, ...)
{
  return [a1 averagedRawData];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomInnerCircle(void *a1, const char *a2, ...)
{
  return [a1 bottomInnerCircle];
}

id objc_msgSend_bottomOuterCircle(void *a1, const char *a2, ...)
{
  return [a1 bottomOuterCircle];
}

id objc_msgSend_boundOffsetMax(void *a1, const char *a2, ...)
{
  return [a1 boundOffsetMax];
}

id objc_msgSend_boundOffsetMin(void *a1, const char *a2, ...)
{
  return [a1 boundOffsetMin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bubbleContainer(void *a1, const char *a2, ...)
{
  return [a1 bubbleContainer];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_checkWithinOffset(void *a1, const char *a2, ...)
{
  return [a1 checkWithinOffset];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return [a1 cleanUpSystemClient];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_componentOrientationSpecifications(void *a1, const char *a2, ...)
{
  return [a1 componentOrientationSpecifications];
}

id objc_msgSend_componentSensor(void *a1, const char *a2, ...)
{
  return [a1 componentSensor];
}

id objc_msgSend_copiedMotionManagerData(void *a1, const char *a2, ...)
{
  return [a1 copiedMotionManagerData];
}

id objc_msgSend_copiedRawComponentData(void *a1, const char *a2, ...)
{
  return [a1 copiedRawComponentData];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return [a1 currentlyMonitoring];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debuggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 debuggingEnabled];
}

id objc_msgSend_degreesLabel(void *a1, const char *a2, ...)
{
  return [a1 degreesLabel];
}

id objc_msgSend_degreesShift(void *a1, const char *a2, ...)
{
  return [a1 degreesShift];
}

id objc_msgSend_degreesShiftRange(void *a1, const char *a2, ...)
{
  return [a1 degreesShiftRange];
}

id objc_msgSend_degreesShiftRangeThreshold(void *a1, const char *a2, ...)
{
  return [a1 degreesShiftRangeThreshold];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_determineTestingOrientation(void *a1, const char *a2, ...)
{
  return [a1 determineTestingOrientation];
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return [a1 deviceMotion];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didCompleteSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 didCompleteSuccessfully];
}

id objc_msgSend_displayLink(void *a1, const char *a2, ...)
{
  return [a1 displayLink];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_filterContainer(void *a1, const char *a2, ...)
{
  return [a1 filterContainer];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_framesLevel(void *a1, const char *a2, ...)
{
  return [a1 framesLevel];
}

id objc_msgSend_holdStationaryTimeout(void *a1, const char *a2, ...)
{
  return [a1 holdStationaryTimeout];
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

id objc_msgSend_isDebuggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDebuggingEnabled];
}

id objc_msgSend_isLeveled(void *a1, const char *a2, ...)
{
  return [a1 isLeveled];
}

id objc_msgSend_lastDisplayDegrees(void *a1, const char *a2, ...)
{
  return [a1 lastDisplayDegrees];
}

id objc_msgSend_lastLevelChange(void *a1, const char *a2, ...)
{
  return [a1 lastLevelChange];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftLevelTic(void *a1, const char *a2, ...)
{
  return [a1 leftLevelTic];
}

id objc_msgSend_levelBottom(void *a1, const char *a2, ...)
{
  return [a1 levelBottom];
}

id objc_msgSend_levelContainer(void *a1, const char *a2, ...)
{
  return [a1 levelContainer];
}

id objc_msgSend_levelHoldContainer(void *a1, const char *a2, ...)
{
  return [a1 levelHoldContainer];
}

id objc_msgSend_lowerBoundOffsetThresholdX(void *a1, const char *a2, ...)
{
  return [a1 lowerBoundOffsetThresholdX];
}

id objc_msgSend_lowerBoundOffsetThresholdY(void *a1, const char *a2, ...)
{
  return [a1 lowerBoundOffsetThresholdY];
}

id objc_msgSend_lowerBoundOffsetThresholdZ(void *a1, const char *a2, ...)
{
  return [a1 lowerBoundOffsetThresholdZ];
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

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_motionManagerData(void *a1, const char *a2, ...)
{
  return [a1 motionManagerData];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_notStationaryData(void *a1, const char *a2, ...)
{
  return [a1 notStationaryData];
}

id objc_msgSend_notStationaryTimeout(void *a1, const char *a2, ...)
{
  return [a1 notStationaryTimeout];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_orientationMissed(void *a1, const char *a2, ...)
{
  return [a1 orientationMissed];
}

id objc_msgSend_orientationsIndex(void *a1, const char *a2, ...)
{
  return [a1 orientationsIndex];
}

id objc_msgSend_orientationsParameter(void *a1, const char *a2, ...)
{
  return [a1 orientationsParameter];
}

id objc_msgSend_outputDataRate(void *a1, const char *a2, ...)
{
  return [a1 outputDataRate];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return [a1 predicates];
}

id objc_msgSend_previousRotation(void *a1, const char *a2, ...)
{
  return [a1 previousRotation];
}

id objc_msgSend_previousShift(void *a1, const char *a2, ...)
{
  return [a1 previousShift];
}

id objc_msgSend_rawComponentData(void *a1, const char *a2, ...)
{
  return [a1 rawComponentData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rightLevelTic(void *a1, const char *a2, ...)
{
  return [a1 rightLevelTic];
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return [a1 rotationMatrix];
}

id objc_msgSend_rotationOrientation(void *a1, const char *a2, ...)
{
  return [a1 rotationOrientation];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_samplingRawData(void *a1, const char *a2, ...)
{
  return [a1 samplingRawData];
}

id objc_msgSend_secondsToRunOrientation(void *a1, const char *a2, ...)
{
  return [a1 secondsToRunOrientation];
}

id objc_msgSend_setZeroRangeAndDegreesShiftRange(void *a1, const char *a2, ...)
{
  return [a1 setZeroRangeAndDegreesShiftRange];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifications(void *a1, const char *a2, ...)
{
  return [a1 specifications];
}

id objc_msgSend_startAnimations(void *a1, const char *a2, ...)
{
  return [a1 startAnimations];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_stationaryData(void *a1, const char *a2, ...)
{
  return [a1 stationaryData];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_testingOrientation(void *a1, const char *a2, ...)
{
  return [a1 testingOrientation];
}

id objc_msgSend_ticContainer(void *a1, const char *a2, ...)
{
  return [a1 ticContainer];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_topInnerCircle(void *a1, const char *a2, ...)
{
  return [a1 topInnerCircle];
}

id objc_msgSend_topOuterCircle(void *a1, const char *a2, ...)
{
  return [a1 topOuterCircle];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateColors(void *a1, const char *a2, ...)
{
  return [a1 updateColors];
}

id objc_msgSend_upperBoundOffsetThresholdX(void *a1, const char *a2, ...)
{
  return [a1 upperBoundOffsetThresholdX];
}

id objc_msgSend_upperBoundOffsetThresholdY(void *a1, const char *a2, ...)
{
  return [a1 upperBoundOffsetThresholdY];
}

id objc_msgSend_upperBoundOffsetThresholdZ(void *a1, const char *a2, ...)
{
  return [a1 upperBoundOffsetThresholdZ];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_zeroRange(void *a1, const char *a2, ...)
{
  return [a1 zeroRange];
}

id objc_msgSend_zeroRangeThreshold(void *a1, const char *a2, ...)
{
  return [a1 zeroRangeThreshold];
}