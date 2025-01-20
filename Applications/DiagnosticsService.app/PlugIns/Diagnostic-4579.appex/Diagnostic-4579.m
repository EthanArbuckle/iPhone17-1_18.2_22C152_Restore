id *sub_100004554(id *result, void *a2)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  int v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  CFStringRef v28;

  if (a2)
  {
    v2 = result;
    [a2 acceleration];
    v4 = v3;
    v6 = fabs(v5);
    v7 = [v2[4] xThreshold];
    [v7 doubleValue];
    if (v6 > fabs(v8))
    {
    }
    else
    {
      v9 = [v2[4] zThreshold];
      [v9 doubleValue];
      v11 = fabs(v10);

      if (fabs(v4) <= v11) {
        return (id *)[v2[4] stop];
      }
    }
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v2[4] xThreshold];
      [v14 doubleValue];
      v16 = fabs(v15);
      v17 = [v2[4] zThreshold];
      [v17 doubleValue];
      v19 = 134219010;
      v20 = v6;
      v21 = 2048;
      v22 = fabs(v4);
      v23 = 2048;
      v24 = v16;
      v25 = 2048;
      v26 = fabs(v18);
      v27 = 2112;
      v28 = @"IncorrectOrientationNotification";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Gyroscope values { x: %f z: %f } are out of the thresholds allowed { x: %f z: %f }. Posting %@", (uint8_t *)&v19, 0x34u);
    }
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"IncorrectOrientationNotification" object:0];

    return (id *)[v2[4] stop];
  }
  return result;
}

void sub_100004AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Block_object_dispose((const void *)(v29 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100004B4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [v5 acceleration];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v7 > *(double *)(v10 + 24)) {
      *(double *)(v10 + 24) = v7;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v7 < *(double *)(v11 + 24)) {
      *(double *)(v11 + 24) = v7;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 > *(double *)(v12 + 24)) {
      *(double *)(v12 + 24) = v8;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v8 < *(double *)(v13 + 24)) {
      *(double *)(v13 + 24) = v8;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    if (v9 > *(double *)(v14 + 24)) {
      *(double *)(v14 + 24) = v9;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    double v16 = *(double *)(v15 + 24);
    if (v9 < v16)
    {
      *(double *)(v15 + 24) = v9;
      double v16 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v18 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    double v20 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    double v21 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    double v22 = vabdd_f64(v17, v18);
    double v23 = vabdd_f64(v19, v20);
    double v24 = vabdd_f64(v21, v16);
    if (v23 < v24) {
      double v23 = v24;
    }
    if (v22 >= v23) {
      double v25 = v22;
    }
    else {
      double v25 = v23;
    }
    v26 = [*(id *)(a1 + 32) threshold];
    [v26 doubleValue];
    double v28 = v27;

    if (v25 > v28)
    {
      uint64_t v29 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v33 = [*(id *)(a1 + 32) threshold];
        [v33 doubleValue];
        v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v35 = +[NSNumber numberWithDouble:v17 - v18];
        v36 = +[NSNumber numberWithDouble:v19 - v20];
        v37 = +[NSNumber numberWithDouble:v21 - v16];
        int v38 = 138413058;
        v39 = v34;
        __int16 v40 = 2112;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Motion detection threshold value %@ exceeded. X: %@ Y: %@ Z: %@", (uint8_t *)&v38, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 postNotificationName:@"MotionDetectedNotification" object:0];
    }
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v31 + 24))
    {
      *(unsigned char *)(v31 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x7FEFFFFFFFFFFFFFLL;
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0x10000000000000;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x10000000000000;
    }
  }
  else
  {
    v32 = [*(id *)(a1 + 32) motionManager];
    [v32 stopAccelerometerUpdates];
  }
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

void forceTouchImageCallback(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006C74;
  v18[3] = &unk_10000C3B8;
  id v6 = a4;
  id v19 = v6;
  uint64_t v20 = a3;
  if (qword_100011A60 != -1) {
    dispatch_once(&qword_100011A60, v18);
  }
  id v7 = [v6 deviceOrientation];
  if (v7 == (id)5)
  {
    signed int v8 = [v6 upFrameNumber];
    double v9 = [v6 faceUpPixelMaps];
  }
  else
  {
    signed int v8 = [v6 downFrameNumber];
    double v9 = [v6 faceDownPixelMaps];
  }
  uint64_t v10 = (void *)v9[v8];
  uint64_t v11 = [v6 inputs];
  signed int v12 = [v11 numFramesToRecord];

  if (v8 >= v12)
  {
    if (v7 == (id)5)
    {
      if ([v6 isFinishedFaceUpPixelMaps]) {
        goto LABEL_16;
      }
      [v6 setIsFinishedFaceUpPixelMaps:1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006C80;
      block[3] = &unk_10000C390;
      id v17 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      uint64_t v13 = v17;
    }
    else
    {
      if ([v6 isFinishedFaceDownPixelMaps]) {
        goto LABEL_16;
      }
      [v6 setIsFinishedFaceDownPixelMaps:1];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006CD8;
      v14[3] = &unk_10000C390;
      id v15 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      uint64_t v13 = v15;
    }

    goto LABEL_16;
  }
  memcpy(v10, a2, 2 * *(__int16 *)(a3 + 16) * (uint64_t)*(__int16 *)(a3 + 18));
  if (v7 == (id)5) {
    [v6 setUpFrameNumber:[v6 upFrameNumber] + 1];
  }
  else {
    [v6 setDownFrameNumber:[v6 downFrameNumber] + 1];
  }
LABEL_16:
}

void sub_100006B18(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) flipInstructionImageView];
  [v1 setAlpha:1.0];
}

id sub_100006C74(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRowZeroAtBottom:*(unsigned __int8 *)(*(void *)(a1 + 40) + 38)];
}

void sub_100006C80(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 samplingTimer];
  [v1 samplingFinished:v2];
}

void sub_100006CD8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 samplingTimer];
  [v1 samplingFinished:v2];
}

void sub_1000079F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007FF4()
{
  sub_100007A10();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "You started the test with the device in an orientation that is not Face Up", v2, v3, v4, v5, v6);
}

void sub_100008028()
{
  sub_100007A10();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "The angle at which the device is at is too steep to get a stable reading", v2, v3, v4, v5, v6);
}

void sub_10000805C()
{
  sub_100007A10();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "The test was cancelled due to Excessive Motion", v2, v3, v4, v5, v6);
}

void sub_100008090()
{
  sub_100007A10();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "The device was not flipped in the time allocated", v2, v3, v4, v5, v6);
}

void sub_1000080C4()
{
  sub_100007A10();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "Test cancelled by touching display", v2, v3, v4, v5, v6);
}

void sub_1000080F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Ended Swollen Battery Test with status code: %@.", (uint8_t *)&v2, 0xCu);
}

void sub_100008170(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 result];
  uint64_t v4 = [v3 data];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
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

uint64_t MTDeviceCreateDefault()
{
  return _MTDeviceCreateDefault();
}

uint64_t MTDeviceCreateMultitouchRunLoopSource()
{
  return _MTDeviceCreateMultitouchRunLoopSource();
}

uint64_t MTDeviceGetDeviceID()
{
  return _MTDeviceGetDeviceID();
}

uint64_t MTDeviceGetParserType()
{
  return _MTDeviceGetParserType();
}

uint64_t MTDeviceGetSensorSurfaceDimensions()
{
  return _MTDeviceGetSensorSurfaceDimensions();
}

uint64_t MTDeviceGetTransportMethod()
{
  return _MTDeviceGetTransportMethod();
}

uint64_t MTDeviceIsBuiltIn()
{
  return _MTDeviceIsBuiltIn();
}

uint64_t MTDeviceIsRunning()
{
  return _MTDeviceIsRunning();
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

uint64_t MTRegisterImageCallbackWithRefcon()
{
  return _MTRegisterImageCallbackWithRefcon();
}

uint64_t MTUnregisterImageCallback()
{
  return _MTUnregisterImageCallback();
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

long double acos(long double __x)
{
  return _acos(__x);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_allocatePixelMaps(void *a1, const char *a2, ...)
{
  return [a1 allocatePixelMaps];
}

id objc_msgSend_angleTolerance(void *a1, const char *a2, ...)
{
  return [a1 angleTolerance];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return [a1 audioRouteChanged];
}

id objc_msgSend_batteryTemp(void *a1, const char *a2, ...)
{
  return [a1 batteryTemp];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_builtInDevice(void *a1, const char *a2, ...)
{
  return [a1 builtInDevice];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_determineBatteryGasGaugeTemp(void *a1, const char *a2, ...)
{
  return [a1 determineBatteryGasGaugeTemp];
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return [a1 deviceMotion];
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 deviceOrientation];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableSensorMonitoring(void *a1, const char *a2, ...)
{
  return [a1 disableSensorMonitoring];
}

id objc_msgSend_displayLink(void *a1, const char *a2, ...)
{
  return [a1 displayLink];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downFrameNumber(void *a1, const char *a2, ...)
{
  return [a1 downFrameNumber];
}

id objc_msgSend_enableSensorMonitoring(void *a1, const char *a2, ...)
{
  return [a1 enableSensorMonitoring];
}

id objc_msgSend_faceDownPixelMaps(void *a1, const char *a2, ...)
{
  return [a1 faceDownPixelMaps];
}

id objc_msgSend_faceUpPixelMaps(void *a1, const char *a2, ...)
{
  return [a1 faceUpPixelMaps];
}

id objc_msgSend_flipInstructionImageView(void *a1, const char *a2, ...)
{
  return [a1 flipInstructionImageView];
}

id objc_msgSend_flipSetupTimeout(void *a1, const char *a2, ...)
{
  return [a1 flipSetupTimeout];
}

id objc_msgSend_flipSetupTimer(void *a1, const char *a2, ...)
{
  return [a1 flipSetupTimer];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_instructionImageName(void *a1, const char *a2, ...)
{
  return [a1 instructionImageName];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccelerometerActive(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerActive];
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerAvailable];
}

id objc_msgSend_isCompleted(void *a1, const char *a2, ...)
{
  return [a1 isCompleted];
}

id objc_msgSend_isFinishedFaceDownPixelMaps(void *a1, const char *a2, ...)
{
  return [a1 isFinishedFaceDownPixelMaps];
}

id objc_msgSend_isFinishedFaceUpPixelMaps(void *a1, const char *a2, ...)
{
  return [a1 isFinishedFaceUpPixelMaps];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return [a1 modelNumbers];
}

id objc_msgSend_monitoringAngle(void *a1, const char *a2, ...)
{
  return [a1 monitoringAngle];
}

id objc_msgSend_motionDetectionMonitor(void *a1, const char *a2, ...)
{
  return [a1 motionDetectionMonitor];
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return [a1 motionManager];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numFramesToRecord(void *a1, const char *a2, ...)
{
  return [a1 numFramesToRecord];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_pixelMapHeight(void *a1, const char *a2, ...)
{
  return [a1 pixelMapHeight];
}

id objc_msgSend_pixelMapWidth(void *a1, const char *a2, ...)
{
  return [a1 pixelMapWidth];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return [a1 rotationMatrix];
}

id objc_msgSend_rowZeroAtBottom(void *a1, const char *a2, ...)
{
  return [a1 rowZeroAtBottom];
}

id objc_msgSend_samplingSetupTimeout(void *a1, const char *a2, ...)
{
  return [a1 samplingSetupTimeout];
}

id objc_msgSend_samplingSetupTimer(void *a1, const char *a2, ...)
{
  return [a1 samplingSetupTimer];
}

id objc_msgSend_samplingTimeout(void *a1, const char *a2, ...)
{
  return [a1 samplingTimeout];
}

id objc_msgSend_samplingTimer(void *a1, const char *a2, ...)
{
  return [a1 samplingTimer];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setupAngleMonitoring(void *a1, const char *a2, ...)
{
  return [a1 setupAngleMonitoring];
}

id objc_msgSend_setupAngleMotionManager(void *a1, const char *a2, ...)
{
  return [a1 setupAngleMotionManager];
}

id objc_msgSend_setupExcessiveMotionNotification(void *a1, const char *a2, ...)
{
  return [a1 setupExcessiveMotionNotification];
}

id objc_msgSend_setupHIDForceTouchImageRecognizer(void *a1, const char *a2, ...)
{
  return [a1 setupHIDForceTouchImageRecognizer];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startExcessiveMotionMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startExcessiveMotionMonitoring];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopAccelerometerUpdates];
}

id objc_msgSend_stopExcessiveMotionMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopExcessiveMotionMonitoring];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return [a1 temperatureData];
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return [a1 threshold];
}

id objc_msgSend_touchAllowed(void *a1, const char *a2, ...)
{
  return [a1 touchAllowed];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_upFrameNumber(void *a1, const char *a2, ...)
{
  return [a1 upFrameNumber];
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

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return [a1 xThreshold];
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return [a1 zThreshold];
}