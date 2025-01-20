BOOL sub_100001C7C(id a1, id a2)
{
  id v2;
  id v3;
  id v4;

  v2 = a2;
  v3 = [v2 compare:&off_10000CA90];
  v4 = [v2 compare:&off_10000CAA0];

  return (unint64_t)v4 < 2 && (unint64_t)v3 + 1 < 2;
}

void sub_1000036A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000370C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000371C(uint64_t a1)
{
}

void sub_100003724(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    char v36 = 0;
    v9 = [WeakRetained inputs];
    v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 gridRows] - 1);
    v11 = [v6 dk_numberFromRequiredKey:@"y" lowerBound:&off_10000C970 upperBound:v10 failed:&v36];
    unsigned int v12 = [v11 intValue];

    v13 = [v8 inputs];
    v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 gridColumns] - 1);
    v15 = [v6 dk_numberFromRequiredKey:@"x" lowerBound:&off_10000C970 upperBound:v14 failed:&v36];
    unsigned int v16 = [v15 intValue];

    v17 = [v6 dk_stringFromRequiredKey:@"startingColor" maxLength:7 failed:&v36];
    v18 = +[UIColor colorWithHexValue:v17 error:0];

    v19 = [v6 dk_stringFromRequiredKey:@"successColor" maxLength:7 failed:&v36];
    v20 = +[UIColor colorWithHexValue:v19 error:0];

    v21 = [v6 dk_stringFromRequiredKey:@"failedColor" maxLength:7 failed:&v36];
    v22 = +[UIColor colorWithHexValue:v21 error:0];

    if (!v36 && v18 && v20 && v22)
    {
      v35 = a4;
      v23 = [v8 inputs];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v16
                                                                  + [v23 gridColumns] * v12;

      signed int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v25 = [v8 inputs];
      unsigned int v26 = [v25 gridRows];
      v27 = [v8 inputs];
      signed int v28 = [v27 gridColumns] * v26;

      if (v24 >= v28)
      {
        v29 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100006EB8(v29);
        }

        [v8 endTestWithStatusCode:&off_10000C988];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        unsigned char *v35 = 0;
      }
      v30 = (void *)v8[12];
      uint64_t v31 = *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v32 = +[ColorOptions colorOptionsWithStarting:v18 success:v20 failed:v22];
      [v30 replaceObjectAtIndex:v31 withObject:v32];

      v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v34 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
      [v33 addObject:v34];
    }
    else
    {
      [v8 endTestWithStatusCode:&off_10000C9A0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 0;
    }
  }
}

id sub_100005254(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryButtonAction];
}

id sub_10000525C(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueButtonAction];
}

void forceTouchPathCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  objc_initWeak(location, v6);
  v7 = [v6 presentedViewController];
  if (v7)
  {

    goto LABEL_33;
  }
  if ([v6 shouldIgnoreForceEvents]) {
    goto LABEL_33;
  }
  [v6 setTouchEventRecognized:(*(_DWORD *)(a4 + 20) - 1) < 4];
  if ([v6 timeoutTimerFireDelayed])
  {
    [v6 setTimeoutTimerFireDelayed:0];
    [v6 partialInputTimedOut];
    goto LABEL_33;
  }
  float v8 = *(float *)(a4 + 32);
  float v9 = *(float *)(a4 + 36);
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeScale(&v64, 1.0, -1.0);
  CGAffineTransform v62 = v64;
  CGAffineTransformTranslate(&v63, &v62, 0.0, -1.0);
  CGAffineTransform v64 = v63;
  long long v10 = *(_OWORD *)&v63.a;
  long long v11 = *(_OWORD *)&v63.c;
  long long v12 = *(_OWORD *)&v63.tx;
  v13 = [v6 inputs];
  int v14 = [v13 gridRows];

  v15 = [v6 inputs];
  int v56 = [v15 gridColumns];

  unsigned int v16 = [v6 inputs];
  unsigned int v17 = [v16 gridColumns];

  v18 = [v6 gridIndexes];
  v19 = [v18 objectAtIndexedSubscript:(int)[v6 testCoordinatesIndex]];
  unsigned int v57 = [v19 intValue];

  v20 = [v6 gridStatus];
  v21 = [v20 objectAtIndexedSubscript:];
  if ([v21 isEqualToNumber:&off_10000CA00]) {
    goto LABEL_9;
  }
  v22 = [v6 gridStatus];
  v23 = [v22 objectAtIndexedSubscript:v57];
  if ([v23 isEqualToNumber:&off_10000CA18])
  {

LABEL_9:
    goto LABEL_10;
  }
  v35 = [v6 gridStatus];
  char v36 = [v35 objectAtIndexedSubscript:v57];
  unsigned __int8 v37 = [v36 isEqualToNumber:&off_10000CA30];
  if (vcvtmd_u64_f64((*(double *)&v12 + *(double *)&v11 * v9 + *(double *)&v10 * v8) * (double)v56)
     + v17
     * vcvtmd_u64_f64((*((double *)&v12 + 1) + *((double *)&v11 + 1) * v9 + *((double *)&v10 + 1) * v8) * (double)v14) == v57)
    char v38 = 1;
  else {
    char v38 = v37;
  }

  if ((v38 & 1) == 0)
  {
    v39 = [v6 gridStatus];
    [v39 setObject:&off_10000C9B8 atIndexedSubscript:v57];

    [v6 setPressureRatio:0.0];
    [v6 presentRingWithTestCoordinateGridIndex:v57];
    goto LABEL_33;
  }
LABEL_10:
  float v24 = *(float *)(a4 + 52);
  [v6 maximumPressure];
  if (v24 >= *(float *)&v25) {
    *(float *)&double v25 = v24;
  }
  [v6 setMaximumPressure:v25];
  unsigned int v26 = [v6 inputs];
  v27 = [v26 pressurePoints];
  signed int v28 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v6, "pressureIndex"));
  [v28 doubleValue];
  [v6 setPressureRatio:v24 / v29];

  v30 = [v6 gridStatus];
  uint64_t v31 = [v30 objectAtIndexedSubscript:v57];
  uint64_t v32 = (int)[v31 intValue];

  if (!v32)
  {
    v40 = [v6 statusLabel];
    [v40 setText:&stru_10000C830];

    v41 = +[NSDate date];
    [v41 timeIntervalSince1970];
    v43 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v42 * 1000.0)];
    [v6 setForceTouchStarted:v43];

    [v6 presentRingWithTestCoordinateGridIndex:v57];
    if (([v6 timerInvalidated] & 1) == 0)
    {
      [v6 setTimerInvalidated:1];
      v44 = [v6 timeoutTimer];

      if (v44)
      {
        v45 = [v6 timeoutTimer];
        [v45 invalidate];

        [v6 setTimeoutTimer:0];
        v46 = [v6 inputs];
        [v46 partialInputTimeout];
        v47 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v6, "partialInputTimedOut", 0, 0);
        [v6 setTimeoutTimer:v47];
      }
    }
    v48 = [v6 gridStatus];
    [v48 setObject:&off_10000CA48 atIndexedSubscript:v57];
    goto LABEL_32;
  }
  if (v32 == 1)
  {
    [v6 presentRingWithTestCoordinateGridIndex:v57];
    [v6 pressureRatio];
    if (v49 < 1.0) {
      goto LABEL_33;
    }
    v50 = [v6 timeoutTimer];

    if (v50)
    {
      v51 = [v6 timeoutTimer];
      [v51 invalidate];

      [v6 setTimeoutTimer:0];
    }
    if ([v6 timeoutTimerFireDelayed])
    {
      [v6 setPressureReachedAfterTimeout:1];
      v48 = [v6 gridStatus];
      [v48 setObject:&off_10000CA18 atIndexedSubscript:v57];
    }
    else
    {
      v52 = [v6 detectedPressurePoints];
      v53 = [v6 inputs];
      v54 = [v53 pressurePoints];
      v55 = objc_msgSend(v54, "objectAtIndexedSubscript:", objc_msgSend(v6, "pressureIndex"));
      [v52 addObject:v55];

      v48 = [v6 gridStatus];
      [v48 setObject:&off_10000CA00 atIndexedSubscript:v57];
    }
LABEL_32:

    goto LABEL_33;
  }
  if (v32 == 2 && ([v6 touchEventRecognized] & 1) == 0)
  {
    [v6 setShouldIgnoreForceEvents:1];
    v33 = [v6 gridStatus];
    [v33 setObject:&off_10000CA30 atIndexedSubscript:v57];

    v34 = [v6 forceTouchRingView];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100005F14;
    v58[3] = &unk_10000C3F0;
    objc_copyWeak(&v60, location);
    unsigned int v61 = v57;
    id v59 = v6;
    [v34 playCircleAnimationWithCompletion:v58];

    objc_destroyWeak(&v60);
  }
LABEL_33:
  objc_destroyWeak(location);
}

void sub_100005CDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 168));
  _Unwind_Resume(a1);
}

id sub_100005F14(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [v3 testCoordinates];
  v5 = [v4 objectAtIndexedSubscript:*(unsigned int *)(a1 + 48)];
  [v5 CGPointValue];
  [v3 playCheckAnimationAtPoint:];

  id WeakRetained = objc_loadWeakRetained(v2);
  v7 = [WeakRetained inputs];
  LODWORD(v4) = [v7 hapticFeedback];

  if (v4) {
    AudioServicesPlaySystemSound(0x5B1u);
  }
  float v8 = *(void **)(a1 + 32);

  return [v8 setShouldIgnoreForceEvents:0];
}

void sub_100006EB8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Coordinate exceeded max index bound", v1, 2u);
}

void sub_100006EFC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Force Touch Digitizer Test: Predicate/Specifications not found.", v1, 2u);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
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

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t MTDeviceCreateList()
{
  return _MTDeviceCreateList();
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

uint64_t MTDeviceStart()
{
  return _MTDeviceStart();
}

uint64_t MTDeviceStop()
{
  return _MTDeviceStop();
}

uint64_t MTRegisterPathCallbackWithRefcon()
{
  return _MTRegisterPathCallbackWithRefcon();
}

uint64_t MTUnregisterPathCallbackWithRefcon()
{
  return _MTUnregisterPathCallbackWithRefcon();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
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

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_animationCompletion(void *a1, const char *a2, ...)
{
  return [a1 animationCompletion];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_check(void *a1, const char *a2, ...)
{
  return [a1 check];
}

id objc_msgSend_circle(void *a1, const char *a2, ...)
{
  return [a1 circle];
}

id objc_msgSend_circlePath(void *a1, const char *a2, ...)
{
  return [a1 circlePath];
}

id objc_msgSend_circlePathAnimation(void *a1, const char *a2, ...)
{
  return [a1 circlePathAnimation];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_detectedPressurePoints(void *a1, const char *a2, ...)
{
  return [a1 detectedPressurePoints];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endingCircleRatio(void *a1, const char *a2, ...)
{
  return [a1 endingCircleRatio];
}

id objc_msgSend_failed(void *a1, const char *a2, ...)
{
  return [a1 failed];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceTouchEnded(void *a1, const char *a2, ...)
{
  return [a1 forceTouchEnded];
}

id objc_msgSend_forceTouchRingView(void *a1, const char *a2, ...)
{
  return [a1 forceTouchRingView];
}

id objc_msgSend_forceTouchSensitivityText(void *a1, const char *a2, ...)
{
  return [a1 forceTouchSensitivityText];
}

id objc_msgSend_forceTouchStarted(void *a1, const char *a2, ...)
{
  return [a1 forceTouchStarted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gridColumns(void *a1, const char *a2, ...)
{
  return [a1 gridColumns];
}

id objc_msgSend_gridIndexes(void *a1, const char *a2, ...)
{
  return [a1 gridIndexes];
}

id objc_msgSend_gridRows(void *a1, const char *a2, ...)
{
  return [a1 gridRows];
}

id objc_msgSend_gridStatus(void *a1, const char *a2, ...)
{
  return [a1 gridStatus];
}

id objc_msgSend_hapticFeedback(void *a1, const char *a2, ...)
{
  return [a1 hapticFeedback];
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

id objc_msgSend_maximumCircleRatio(void *a1, const char *a2, ...)
{
  return [a1 maximumCircleRatio];
}

id objc_msgSend_maximumPressure(void *a1, const char *a2, ...)
{
  return [a1 maximumPressure];
}

id objc_msgSend_minimumCircleRatio(void *a1, const char *a2, ...)
{
  return [a1 minimumCircleRatio];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 noInputTimeout];
}

id objc_msgSend_noInputTimerFired(void *a1, const char *a2, ...)
{
  return [a1 noInputTimerFired];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_partialInputTimedOut(void *a1, const char *a2, ...)
{
  return [a1 partialInputTimedOut];
}

id objc_msgSend_partialInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 partialInputTimeout];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_pressureIndex(void *a1, const char *a2, ...)
{
  return [a1 pressureIndex];
}

id objc_msgSend_pressurePoints(void *a1, const char *a2, ...)
{
  return [a1 pressurePoints];
}

id objc_msgSend_pressureRatio(void *a1, const char *a2, ...)
{
  return [a1 pressureRatio];
}

id objc_msgSend_pressureReachedAfterTimeout(void *a1, const char *a2, ...)
{
  return [a1 pressureReachedAfterTimeout];
}

id objc_msgSend_pressureTargetMissed(void *a1, const char *a2, ...)
{
  return [a1 pressureTargetMissed];
}

id objc_msgSend_randomizeCoordinates(void *a1, const char *a2, ...)
{
  return [a1 randomizeCoordinates];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_ringCenter(void *a1, const char *a2, ...)
{
  return [a1 ringCenter];
}

id objc_msgSend_ringFailedColor(void *a1, const char *a2, ...)
{
  return [a1 ringFailedColor];
}

id objc_msgSend_ringShouldGrow(void *a1, const char *a2, ...)
{
  return [a1 ringShouldGrow];
}

id objc_msgSend_ringStartingColor(void *a1, const char *a2, ...)
{
  return [a1 ringStartingColor];
}

id objc_msgSend_ringSuccessColor(void *a1, const char *a2, ...)
{
  return [a1 ringSuccessColor];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupHIDForceTouchRecognizer(void *a1, const char *a2, ...)
{
  return [a1 setupHIDForceTouchRecognizer];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldIgnoreForceEvents(void *a1, const char *a2, ...)
{
  return [a1 shouldIgnoreForceEvents];
}

id objc_msgSend_shuffleCoordinates(void *a1, const char *a2, ...)
{
  return [a1 shuffleCoordinates];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_startingCircleRadius(void *a1, const char *a2, ...)
{
  return [a1 startingCircleRadius];
}

id objc_msgSend_startingCircleRatio(void *a1, const char *a2, ...)
{
  return [a1 startingCircleRatio];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return [a1 statusLabel];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_testCoordinateColorsParameter(void *a1, const char *a2, ...)
{
  return [a1 testCoordinateColorsParameter];
}

id objc_msgSend_testCoordinates(void *a1, const char *a2, ...)
{
  return [a1 testCoordinates];
}

id objc_msgSend_testCoordinatesColor(void *a1, const char *a2, ...)
{
  return [a1 testCoordinatesColor];
}

id objc_msgSend_testCoordinatesCount(void *a1, const char *a2, ...)
{
  return [a1 testCoordinatesCount];
}

id objc_msgSend_testCoordinatesIndex(void *a1, const char *a2, ...)
{
  return [a1 testCoordinatesIndex];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return [a1 timedOut];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_timeoutTimerFireDelayed(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimerFireDelayed];
}

id objc_msgSend_timerInvalidated(void *a1, const char *a2, ...)
{
  return [a1 timerInvalidated];
}

id objc_msgSend_touchEventRecognized(void *a1, const char *a2, ...)
{
  return [a1 touchEventRecognized];
}

id objc_msgSend_undetectedPressurePoints(void *a1, const char *a2, ...)
{
  return [a1 undetectedPressurePoints];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}