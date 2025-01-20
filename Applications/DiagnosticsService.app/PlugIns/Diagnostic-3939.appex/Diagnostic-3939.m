void sub_100003D9C(id a1)
{
  uint64_t vars8;

  qword_1000167E8 = objc_alloc_init(DAHIDEventMonitor);

  _objc_release_x1();
}

void sub_1000042F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000430C(uint64_t a1)
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
      sub_10000A868();
    }
  }
}

void sub_100004784(_Unwind_Exception *a1)
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

void sub_100004988(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000049A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUpSystemClient];
}

void sub_100004B34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000776C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000077F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007804(uint64_t a1)
{
}

void sub_10000780C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000786C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Haptic engine was reset", buf, 2u);
    }

    v3 = [WeakRetained hapticEngine];
    id v12 = 0;
    [v3 startAndReturnError:&v12];
    id v4 = v12;

    if (v4)
    {
      v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10000AA34((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
}

void sub_100007958(id a1, int64_t a2)
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    int64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Haptic engine stoped for reason %ld", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100007A00(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained buttonEventMonitor];
  id v3 = objc_loadWeakRetained(v1);
  [v2 addTarget:v3 action:@"didReceiveButtonEvent:" forButtonEvents:[v3 targetButtonEvents] propagate:0];
}

void sub_1000081B4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) inputs];
  id v3 = [v2 buttonParameters];

  int v4 = [*(id *)(a1 + 32) inputs];
  int64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 buttonParameters];
    uint64_t v7 = [v6 segments];
  }
  else
  {
    uint64_t v8 = [v4 switchParameters];

    uint64_t v9 = [*(id *)(a1 + 32) inputs];
    int64_t v5 = v9;
    if (v8)
    {
      uint64_t v6 = [v9 switchParameters];
      uint64_t v7 = [v6 states];
    }
    else
    {
      uint64_t v10 = [v9 touchButtonParameters];

      if (!v10) {
        return;
      }
      int64_t v5 = [*(id *)(a1 + 32) inputs];
      uint64_t v6 = [v5 touchButtonParameters];
      uint64_t v7 = [v6 targetEvents];
    }
  }
  uint64_t v11 = v7;
  id v12 = [v7 objectAtIndexedSubscript:[*(id *)(a1 + 32) currentSegment]];
  v13 = [v12 range];

  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    id v15 = [v13 transitionAssetRange];
    uint64_t v17 = v16;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100008380;
    v19[3] = &unk_100010558;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v18 = v13;
    [v14 showTransitionWithRange:v15 WithCompletionHandler:v17, v19];
  }
}

void sub_100008380(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) testImage];
  id v3 = [*(id *)(a1 + 32) spriteImage];
  id v4 = [*(id *)(a1 + 40) displayAssetRange];
  uint64_t v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) inputs];
  uint64_t v8 = [v7 buttonSwitchSpecification];
  uint64_t v9 = [v8 asset];
  [v9 size];
  uint64_t v10 = +[DASpriteImage imagesFromSprite:v3 inRange:v4 withImageSize:v6];
  [v2 setAnimationImages:v10];

  [*(id *)(a1 + 40) displayAssetRange];
  double v12 = (double)v11 / 60.0;
  v13 = [*(id *)(a1 + 32) testImage];
  [v13 setAnimationRepeatCount:0];

  v14 = [*(id *)(a1 + 32) testImage];
  [v14 setAnimationDuration:v12];

  id v15 = [*(id *)(a1 + 32) testImage];
  [v15 startAnimating];
}

uint64_t sub_1000086E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000087E4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008914;
  block[3] = &unk_100010428;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (+[CBSUtilities isCheckerBoardActive]) {
    +[CBSUtilities disableTouchButtonEvents];
  }
  v2 = +[DAHIDEventMonitor sharedInstance];
  unsigned int v3 = [v2 currentlyMonitoring];

  if (v3)
  {
    id v4 = +[DAHIDEventMonitor sharedInstance];
    [v4 stopMonitoring];
  }
  uint64_t v5 = [*(id *)(a1 + 32) hapticEngine];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) hapticEngine];
    [v6 stopWithCompletionHandler:0];

    [*(id *)(a1 + 32) setHapticEngine:0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008914(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeoutTimer];

  if (v2)
  {
    unsigned int v3 = [*(id *)(a1 + 32) timeoutTimer];
    [v3 invalidate];

    id v4 = *(void **)(a1 + 32);
    [v4 setTimeoutTimer:0];
  }
}

intptr_t sub_100008A2C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100008ACC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  unsigned int v3 = [*(id *)(a1 + 32) result];
  [v3 setStatusCode:v2];

  id v4 = [*(id *)(a1 + 32) result];
  uint64_t v5 = [v4 statusCode];
  unsigned int v6 = [v5 isEqualToNumber:&off_1000111A8];

  if (v6)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000AAA0(v7);
    }

    goto LABEL_7;
  }
  uint64_t v8 = [*(id *)(a1 + 32) allResults];

  if (!v8)
  {
LABEL_7:
    uint64_t v9 = [*(id *)(a1 + 32) result];
    [v9 setData:&__NSDictionary0__struct];
    goto LABEL_8;
  }
  CFStringRef v13 = @"inputEvents";
  uint64_t v9 = [*(id *)(a1 + 32) allResults];
  v14 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  unint64_t v11 = [*(id *)(a1 + 32) result];
  [v11 setData:v10];

LABEL_8:
  return [*(id *)(a1 + 32) setFinished:1];
}

void sub_100008F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008F78(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained inputs];
  uint64_t v5 = [v4 touchButtonParameters];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setupTest];

    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setAllResults:v8];

    [*(id *)(a1 + 32) startTimer];
    [*(id *)(a1 + 32) showNextSegment];
    [*(id *)(a1 + 32) setIsInputMonitoringPaused:0];
  }
  else
  {
    uint64_t v10 = [v6 buttonEventMonitor];
    id v11 = objc_loadWeakRetained(v2);
    [v10 addTarget:v11 action:@"didReceiveButtonEvent:" forButtonEvents:[v11 targetButtonEvents] propagate:0];
  }
  [*(id *)(a1 + 32) setIsInputMonitoringPaused:0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 resetTimer];
}

void sub_1000090C8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained inputs];
  uint64_t v5 = [v4 touchButtonParameters];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 timedOut];
  }
  else
  {
    id v8 = [v6 buttonEventMonitor];
    id v9 = objc_loadWeakRetained(v2);
    [v8 addTarget:v9 action:@"didReceiveButtonEvent:" forButtonEvents:[v9 targetButtonEvents] propagate:0];
  }
  [*(id *)(a1 + 32) setIsInputMonitoringPaused:0];
  id v10 = objc_loadWeakRetained(v2);
  [v10 setButtonFailure:1];

  id v11 = objc_loadWeakRetained(v2);
  [v11 showNextSegment];

  id v12 = objc_loadWeakRetained(v2);
  [v12 resetTimer];
}

id sub_100009A54(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetTimer];
}

void sub_100009B30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputs];
  unsigned int v3 = [v2 touchButtonParameters];

  if (v3
    && ([*(id *)(a1 + 32) isCancelled] & 1) == 0
    && ([*(id *)(a1 + 32) isFinished] & 1) == 0
    && ([*(id *)(a1 + 32) isInputMonitoringPaused] & 1) == 0
    && IOHIDEventGetType() == 42)
  {
    id v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found touch sensitive button event %@", buf, 0xCu);
    }

    id v6 = +[NSDate date];
    [v6 timeIntervalSince1970];
    uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)(v7 * 1000.0)];

    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    IOHIDEventGetFloatValue();
    float v11 = v10;
    if (_UIEventHIDGetChildForceStageEvent(*(void *)(a1 + 40)))
    {
      IOHIDEventGetFloatValue();
      uint64_t v13 = (uint64_t)v12;
    }
    else
    {
      uint64_t v13 = -1;
    }
    v42[0] = @"type";
    v38 = [*(id *)(a1 + 32) inputs];
    v14 = [v38 type];
    v43[0] = v14;
    v42[1] = @"identifier";
    id v15 = [*(id *)(a1 + 32) inputs];
    uint64_t v16 = [v15 identifier];
    v43[1] = v16;
    v43[2] = v8;
    v37 = (void *)v8;
    v42[2] = @"timestamp";
    v42[3] = @"eventData";
    v40[0] = @"touch";
    uint64_t v17 = +[NSNumber numberWithLong:IntegerValue];
    v41[0] = v17;
    v40[1] = @"stage";
    uint64_t v36 = v13;
    +[NSNumber numberWithLong:v13];
    id v18 = v35 = IntegerValue;
    v41[1] = v18;
    v40[2] = @"positionY";
    *(float *)&double v19 = v11;
    id v20 = +[NSNumber numberWithFloat:v19];
    v41[2] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    v43[3] = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];

    v23 = (void *)v22;
    v24 = [*(id *)(a1 + 32) allResults];
    [v24 addObject:v22];

    v25 = [v3 targetEvents];
    v26 = [v25 objectAtIndexedSubscript:[*(id *)(a1 + 32) currentSegment]];

    id v27 = [v26 eventType];
    if (v27 == (id)1)
    {
      v32 = [v26 value];
      v33 = +[NSNumber numberWithInteger:v35];
      unsigned int v34 = [v32 isEqualToNumber:v33];

      v28 = v37;
      if (!v34)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v28 = v37;
      if (v27) {
        goto LABEL_21;
      }
      v29 = [v26 value];
      v30 = +[NSNumber numberWithInteger:v36];
      unsigned __int8 v31 = [v29 isEqualToNumber:v30];

      if ((v31 & 1) == 0) {
        goto LABEL_21;
      }
    }
    if ([v3 resetTimer])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A098;
      block[3] = &unk_100010428;
      block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    if ([v26 performHapticOnEvent]) {
      [*(id *)(a1 + 32) playHaptic];
    }
    [*(id *)(a1 + 32) setCurrentSegmentActionCount: [*(id *)(a1 + 32) currentSegmentActionCount] + 1];
    [*(id *)(a1 + 32) showNextSegment];
    goto LABEL_21;
  }
LABEL_22:
}

uint64_t _UIEventHIDGetChildForceStageEvent(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A500;
  v3[3] = &unk_100010688;
  v3[4] = &v4;
  _UIEventHIDEnumerateChildren(a1, 41, v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A098(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetTimer];
}

void sub_10000A364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10000A384(id a1, NSError *a2)
{
  return 1;
}

void sub_10000A38C(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = 0;
  [v1 startAtTime:&v10 error:0.0];
  id v2 = v10;
  if (v2)
  {
    unsigned int v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000AAE4((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void _UIEventHIDEnumerateChildren(uint64_t a1, int a2, void *a3)
{
  uint64_t v4 = a3;
  if (!a2 || IOHIDEventConformsTo())
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v6 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      char v12 = 0;
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        CFIndex v9 = 0;
        do
        {
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
            if (!a2 || IOHIDEventGetType() == a2) {
              break;
            }
            if (++v9 >= v8) {
              goto LABEL_14;
            }
          }
          v4[2](v4, ValueAtIndex, v9++, &v12);
          if (v12) {
            BOOL v11 = 0;
          }
          else {
            BOOL v11 = v9 < v8;
          }
        }
        while (v11);
      }
    }
  }
LABEL_14:
}

uint64_t sub_10000A500(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

void sub_10000A7E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A800()
{
  sub_100004B50();
  sub_100004B34((void *)&_mh_execute_header, v0, v1, "[ERROR] - Invalid HID Event", v2, v3, v4, v5, v6);
}

void sub_10000A834()
{
  sub_100004B50();
  sub_100004B34((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client could not be found.", v2, v3, v4, v5, v6);
}

void sub_10000A868()
{
  sub_100004B50();
  sub_100004B34((void *)&_mh_execute_header, v0, v1, "[ERROR] - Service client does not exist.", v2, v3, v4, v5, v6);
}

void sub_10000A89C()
{
  sub_100004B50();
  sub_100004B34((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not open HID system.", v2, v3, v4, v5, v6);
}

void sub_10000A8D0()
{
  sub_100004B50();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] - Calling cleanUpSystemClient on nil dispatch queue", v1, 2u);
}

void sub_10000A910(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Could not find plugin.", buf, 2u);
}

void sub_10000A950()
{
  sub_100004B50();
  sub_100004B34((void *)&_mh_execute_header, v0, v1, "[ERROR] - Could not set up system client.", v2, v3, v4, v5, v6);
}

void sub_10000A984(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to parse Specification", v1, 2u);
}

void sub_10000A9C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AA34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AAA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] - Button/Switch Input Test: Predicate not found.", v1, 2u);
}

void sub_10000AAE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t IOHIDEventConformsTo()
{
  return _IOHIDEventConformsTo();
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetFloatValue()
{
  return _IOHIDEventGetFloatValue();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void objc_enumerationMutation(id obj)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_HIDEvents(void *a1, const char *a2, ...)
{
  return [a1 HIDEvents];
}

id objc_msgSend_HIDSystemClient(void *a1, const char *a2, ...)
{
  return [a1 HIDSystemClient];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return [a1 allResults];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return [a1 buttonEventMonitor];
}

id objc_msgSend_buttonFailure(void *a1, const char *a2, ...)
{
  return [a1 buttonFailure];
}

id objc_msgSend_buttonParameters(void *a1, const char *a2, ...)
{
  return [a1 buttonParameters];
}

id objc_msgSend_buttonSwitchSpecification(void *a1, const char *a2, ...)
{
  return [a1 buttonSwitchSpecification];
}

id objc_msgSend_buttonSwitchState(void *a1, const char *a2, ...)
{
  return [a1 buttonSwitchState];
}

id objc_msgSend_checkCurrentSwitchState(void *a1, const char *a2, ...)
{
  return [a1 checkCurrentSwitchState];
}

id objc_msgSend_cleanUpSystemClient(void *a1, const char *a2, ...)
{
  return [a1 cleanUpSystemClient];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentSegment(void *a1, const char *a2, ...)
{
  return [a1 currentSegment];
}

id objc_msgSend_currentSegmentActionCount(void *a1, const char *a2, ...)
{
  return [a1 currentSegmentActionCount];
}

id objc_msgSend_currentlyMonitoring(void *a1, const char *a2, ...)
{
  return [a1 currentlyMonitoring];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_disableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return [a1 disableTouchButtonEvents];
}

id objc_msgSend_displayAssetRange(void *a1, const char *a2, ...)
{
  return [a1 displayAssetRange];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return [a1 enableTouchButtonEvents];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expectedEvent(void *a1, const char *a2, ...)
{
  return [a1 expectedEvent];
}

id objc_msgSend_getNextEvent(void *a1, const char *a2, ...)
{
  return [a1 getNextEvent];
}

id objc_msgSend_hapticEngine(void *a1, const char *a2, ...)
{
  return [a1 hapticEngine];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return [a1 isCheckerBoardActive];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isInputMonitoringPaused(void *a1, const char *a2, ...)
{
  return [a1 isInputMonitoringPaused];
}

id objc_msgSend_isSecondEvent(void *a1, const char *a2, ...)
{
  return [a1 isSecondEvent];
}

id objc_msgSend_listenForInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 listenForInputTimeout];
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_noInputTimeout(void *a1, const char *a2, ...)
{
  return [a1 noInputTimeout];
}

id objc_msgSend_numberOfActions(void *a1, const char *a2, ...)
{
  return [a1 numberOfActions];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_performHapticOnEvent(void *a1, const char *a2, ...)
{
  return [a1 performHapticOnEvent];
}

id objc_msgSend_playHaptic(void *a1, const char *a2, ...)
{
  return [a1 playHaptic];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return [a1 predicates];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return [a1 resetTimer];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_segments(void *a1, const char *a2, ...)
{
  return [a1 segments];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupTest(void *a1, const char *a2, ...)
{
  return [a1 setupTest];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return [a1 setupView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showNextSegment(void *a1, const char *a2, ...)
{
  return [a1 showNextSegment];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_specifications(void *a1, const char *a2, ...)
{
  return [a1 specifications];
}

id objc_msgSend_spriteImage(void *a1, const char *a2, ...)
{
  return [a1 spriteImage];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return [a1 startTimer];
}

id objc_msgSend_startingState(void *a1, const char *a2, ...)
{
  return [a1 startingState];
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return [a1 states];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_switchParameters(void *a1, const char *a2, ...)
{
  return [a1 switchParameters];
}

id objc_msgSend_targetButtonEvents(void *a1, const char *a2, ...)
{
  return [a1 targetButtonEvents];
}

id objc_msgSend_targetEvents(void *a1, const char *a2, ...)
{
  return [a1 targetEvents];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_testImage(void *a1, const char *a2, ...)
{
  return [a1 testImage];
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

id objc_msgSend_touchButtonParameters(void *a1, const char *a2, ...)
{
  return [a1 touchButtonParameters];
}

id objc_msgSend_transitionAssetRange(void *a1, const char *a2, ...)
{
  return [a1 transitionAssetRange];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}