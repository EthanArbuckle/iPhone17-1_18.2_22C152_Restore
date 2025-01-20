void sub_100004CD4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  CAMDailySettingsUseCaseEvent *v5;
  uint64_t v6;
  id v7;
  CAMDailySettingsUseCaseEvent *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a2;
  v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent Running in background", buf, 2u);
  }

  [v3 setExpirationHandler:&stru_100008248];
  *(void *)buf = 0;
  v17 = buf;
  v18 = 0x3032000000;
  v19 = sub_100004EC4;
  v20 = sub_100004ED4;
  v21 = 0;
  v5 = [CAMDailySettingsUseCaseEvent alloc];
  v6 = *(void *)(a1 + 32);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100004EDC;
  v13 = &unk_100008270;
  v15 = buf;
  v7 = v3;
  v14 = v7;
  v8 = [(CAMDailySettingsUseCaseEvent *)v5 initWithQueue:v6 andMetricsSubmittedBlock:&v10];
  v9 = (void *)*((void *)v17 + 5);
  *((void *)v17 + 5) = v8;

  objc_msgSend(*((id *)v17 + 5), "submitMetrics", v10, v11, v12, v13);
  _Block_object_dispose(buf, 8);
}

void sub_100004E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004E74(id a1)
{
  v1 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_10000633C();
  }
}

uint64_t sub_100004EC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004ED4(uint64_t a1)
{
}

id sub_100004EDC(uint64_t a1)
{
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent completed", v6, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  return [*(id *)(a1 + 32) setTaskCompleted];
}

void sub_10000521C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005238(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained _metricQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005330;
    block[3] = &unk_1000082C0;
    objc_copyWeak(&v7, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v7);
  }
  else
  {
    v5 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100006370();
    }
  }
}

void sub_100005330(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.camera", "Nebula");
  uint64_t v3 = (uint64_t)v2;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100006370();
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitMetrics completionSync called", buf, 2u);
  }

  if ([WeakRetained isMetricSubmissionsCompleted])
  {
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitMetrics completionSync completed", v5, 2u);
    }

    uint64_t v3 = [WeakRetained _completion];
    (*(void (**)(void))(v3 + 16))();
LABEL_10:
  }
}

void sub_100005628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_destroyWeak(v17);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak((id *)(v18 - 56));
  _Unwind_Resume(a1);
}

void sub_100005658(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000063A4();
    }
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000063D8();
    }
LABEL_7:

    goto LABEL_13;
  }
  *(unsigned char *)(v5 + 24) = 1;
  id v7 = &stru_100008468;
  if (v3) {
    id v7 = v3;
  }
  v8 = v7;
  v9 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion dispatched with info %{public}@", buf, 0xCu);
  }

  v10 = [WeakRetained _metricQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005884;
  block[3] = &unk_1000082E8;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v13 = v8;
  id v14 = *(id *)(a1 + 32);
  v11 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v15);
LABEL_13:
}

void sub_100005884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = os_log_create("com.apple.camera", "Nebula");
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion completed %{public}@", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    CFStringRef v7 = @"Config";
    uint64_t v8 = v6;
    v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    +[CAMDailySettingsUseCaseEvent getCameraCaptureStreamID];
    PPSSendTelemetry();
    objc_msgSend(WeakRetained, "set_numberOfMetricsSubmitted:", (char *)objc_msgSend(WeakRetained, "_numberOfMetricsSubmitted") + 1);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_10000640C();
  }
}

void sub_100005A20(id a1)
{
  id v2 = [@"Button" copy];
  id v1 = [@"CaptureButtonConfig" copy];
  qword_10000C4B8 = PPSCreateTelemetryIdentifier();
}

void sub_100005B40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005BBC(id a1)
{
  qword_10000C4D0 = objc_alloc_init(CAMFirstUnlockProtection);
  _objc_release_x1();
}

void sub_100005F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005FB0(uint64_t a1)
{
  id result = (id)MKBDeviceUnlockedSinceBoot();
  if (result == 1)
  {
    notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _performPendingBlocksAfterFirstUnlock];
  }
  return result;
}

uint64_t sub_100006018(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

intptr_t sub_10000617C(uint64_t a1)
{
  [*(id *)(a1 + 32) _performPendingBlocksAfterFirstUnlock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 8) ^ 1;
  id v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

uint64_t start()
{
  id v1 = objc_alloc_init((Class)CAMNebulaDaemon);
  id v2 = (void *)os_transaction_create();
  uint64_t v3 = +[CAMFirstUnlockProtection sharedInstance];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_100006330;
  v12 = &unk_1000083C8;
  id v4 = v1;
  id v13 = v4;
  id v5 = v2;
  id v14 = v5;
  [v3 performAfterFirstUnlock:&v9];

  if (MGGetBoolAnswer())
  {
    uint64_t v6 = objc_msgSend(v4, "_queue", v9, v10, v11, v12, v13);
    +[CAMDailySettingsUseCaseEvent registerForBackgroundTaskWithQueue:v6];
  }
  CFStringRef v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  return 0;
}

id sub_100006330(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPendingWorkAfterDelay:3.0];
}

void sub_10000633C()
{
  sub_100005B5C();
  sub_100005B40((void *)&_mh_execute_header, v0, v1, "DailySettingsUseCaseEvent abort requested", v2, v3, v4, v5, v6);
}

void sub_100006370()
{
  sub_100005B5C();
  sub_100005B40((void *)&_mh_execute_header, v0, v1, "DailySettingsUseCaseEvent submitMetrics completionSync error casting to strong", v2, v3, v4, v5, v6);
}

void sub_1000063A4()
{
  sub_100005B5C();
  sub_100005B40((void *)&_mh_execute_header, v0, v1, "DailySettingsUseCaseEvent addObserverForAssociatedAppUpdatesUsingBlock error casting to strong", v2, v3, v4, v5, v6);
}

void sub_1000063D8()
{
  sub_100005B5C();
  sub_100005B40((void *)&_mh_execute_header, v0, v1, "DailySettingsUseCaseEvent submitCameraCapturePreferencesWithCompletion error already submit", v2, v3, v4, v5, v6);
}

void sub_10000640C()
{
  sub_100005B5C();
  sub_100005B40((void *)&_mh_execute_header, v0, v1, "DailySettingsUseCaseEvent addObserverForAssociatedAppUpdatesUsingBlock completion error casting to strong", v2, v3, v4, v5, v6);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return _PPSCreateTelemetryIdentifier();
}

uint64_t PPSSendTelemetry()
{
  return _PPSSendTelemetry();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend__appConfigurationController(void *a1, const char *a2, ...)
{
  return [a1 _appConfigurationController];
}

id objc_msgSend__completion(void *a1, const char *a2, ...)
{
  return [a1 _completion];
}

id objc_msgSend__metricQueue(void *a1, const char *a2, ...)
{
  return [a1 _metricQueue];
}

id objc_msgSend__numberMetricSubmisions(void *a1, const char *a2, ...)
{
  return [a1 _numberMetricSubmisions];
}

id objc_msgSend__numberOfMetricsSubmitted(void *a1, const char *a2, ...)
{
  return [a1 _numberOfMetricsSubmitted];
}

id objc_msgSend__performPendingBlocksAfterFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 _performPendingBlocksAfterFirstUnlock];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_getCameraCaptureStreamID(void *a1, const char *a2, ...)
{
  return [a1 getCameraCaptureStreamID];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMetricSubmissionsCompleted(void *a1, const char *a2, ...)
{
  return [a1 isMetricSubmissionsCompleted];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_submitMetrics(void *a1, const char *a2, ...)
{
  return [a1 submitMetrics];
}