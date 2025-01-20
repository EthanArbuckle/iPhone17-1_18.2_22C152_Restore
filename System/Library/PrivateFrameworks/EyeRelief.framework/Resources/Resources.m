void sub_10000447C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000044AC(uint64_t a1)
{
  if (+[ERDaemonManager isEyeReliefSupported])
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v2);
    unsigned int v4 = [WeakRetained isSamplingEnabled];

    if (v4)
    {
      v5 = +[NSString stringWithFormat:@"Eye Relief: ON -> OFF"];
      +[ERLogging log:v5 withType:0];

      id v6 = objc_loadWeakRetained(v2);
      [v6 setIsSamplingEnabled:0];

      id v7 = objc_loadWeakRetained(v2);
      v8 = [v7 userDefaults];
      [v8 setBool:0 forKey:@"samplingEnabled"];

      id v9 = objc_loadWeakRetained(v2);
      [v9 disablePermissibleOnscreenContentMonitoring];

      id v15 = objc_loadWeakRetained(v2);
      [v15 unscheduleSamplingWithReason:0];
    }
    else
    {
      v10 = +[NSString stringWithFormat:@"Eye Relief: OFF -> ON"];
      +[ERLogging log:v10 withType:0];

      id v11 = objc_loadWeakRetained(v2);
      [v11 setIsSamplingEnabled:1];

      id v12 = objc_loadWeakRetained(v2);
      v13 = [v12 userDefaults];
      [v13 setBool:1 forKey:@"samplingEnabled"];

      id v14 = objc_loadWeakRetained(v2);
      [v14 scheduleSampling];

      id v15 = objc_loadWeakRetained(v2);
      [v15 enablePermissibleOnscreenContentMonitoring];
    }
  }
  else
  {
    id v15 = +[NSString stringWithFormat:@"Eye Relief is not supported on this device."];
    +[ERLogging log:withType:](ERLogging, "log:withType:");
  }
}

id sub_100004698(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained isSamplingEnabled];

  return v2;
}

void sub_1000048D0(id a1, id a2)
{
  v3 = (void (**)(id, uint64_t))a2;
  id v2 = +[NSString stringWithFormat:@"XPC_ACTIVITY_STATE_CHECK_IN"];
  +[ERLogging log:v2 withType:0];

  v3[2](v3, 1);
}

id sub_100004A58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTransitionForLayout:");
}

void sub_100004E48(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isSamplingActive] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) inactivityTimestamp];

    if (v2)
    {
      v3 = +[NSDate date];
      unsigned int v4 = [*(id *)(a1 + 32) inactivityTimestamp];
      [v3 timeIntervalSinceDate:v4];
      double v6 = v5;

      id v7 = [*(id *)(a1 + 32) engine];
      [v7 processInactivity:v6 forSamplingInterval:80.0];

      [*(id *)(a1 + 32) setInactivityTimestamp:0];
    }
    v8 = +[NSString stringWithFormat:@"Distance sampling: OFF -> ON"];
    +[ERLogging log:v8 withType:0];

    [*(id *)(a1 + 32) setIsSamplingActive:1];
    objc_initWeak(&location, *(id *)(a1 + 32));
    if ([*(id *)(a1 + 32) isDemoModeActive])
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      char v14 = 0;
      id v9 = [*(id *)(a1 + 32) engine];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000052C4;
      v11[3] = &unk_100008340;
      v11[4] = v13;
      objc_copyWeak(&v12, &location);
      [v9 takeDistanceSampleWithCompletion:v11];

      objc_destroyWeak(&v12);
      _Block_object_dispose(v13, 8);
    }
    else
    {
      v10 = [*(id *)(a1 + 32) distanceSampleActivity];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000050E0;
      v15[3] = &unk_1000082F0;
      objc_copyWeak(&v16, &location);
      [v10 scheduleWithBlock:v15];

      objc_destroyWeak(&v16);
    }
    objc_destroyWeak(&location);
  }
}

void sub_100005098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 56));
  _Unwind_Resume(a1);
}

void sub_1000050E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = +[NSString stringWithFormat:@"--- Requesting distance sample ---"];
  +[ERLogging log:v4 withType:0];

  double v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained engine];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005210;
  v9[3] = &unk_1000082C8;
  objc_copyWeak(&v11, v5);
  id v8 = v3;
  id v10 = v8;
  [v7 takeDistanceSampleWithCompletion:v9];

  objc_destroyWeak(&v11);
}

void sub_1000051FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005210(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = +[NSString stringWithFormat:@"Received distance sample"];
  +[ERLogging log:v6 withType:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDistanceSample:v5 interventionType:a3 withBackgroundActivityCompletionHandler:*(void *)(a1 + 32)];
}

void sub_1000052C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    unsigned int v7 = [WeakRetained isSamplingActive];

    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000053B8;
      v9[3] = &unk_100008318;
      void v9[4] = *(void *)(a1 + 32);
      [v8 handleDistanceSample:v5 interventionType:a3 withBackgroundActivityCompletionHandler:v9];
    }
  }
}

uint64_t sub_1000053B8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void sub_10000545C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSamplingActive])
  {
    if ([*(id *)(a1 + 32) isDemoModeActive])
    {
      id v2 = [*(id *)(a1 + 32) engine];
      id v11 = 0;
      unsigned int v3 = [v2 cancelWithError:&v11];
      id v4 = v11;

      if (v3)
      {
        id v5 = +[NSString stringWithFormat:@"Cancelled demo mode"];
        double v6 = v5;
        uint64_t v7 = 0;
      }
      else
      {
        id v5 = +[NSString stringWithFormat:@"Failed to cancel demo mode: %@", v4];
        double v6 = v5;
        uint64_t v7 = 1;
      }
      +[ERLogging log:v6 withType:v7];
    }
    id v8 = +[NSString stringWithFormat:@"Distance sampling: ON -> OFF"];
    +[ERLogging log:v8 withType:0];

    id v9 = [*(id *)(a1 + 32) distanceSampleActivity];
    [v9 invalidate];

    [*(id *)(a1 + 32) setIsSamplingActive:0];
    if (*(void *)(a1 + 40) == 1)
    {
      id v10 = +[NSDate date];
      [*(id *)(a1 + 32) setInactivityTimestamp:v10];
    }
  }
}

uint64_t sub_100005800(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) engine];
  [v4 processInterventionOutcome:a2];

  [(id)objc_opt_class() reportAnalyticsInterventionOutcome:a2];
  id v5 = +[NSString stringWithFormat:@"EyeReliefUI has exited with outcome %li. Now scheduling next sample", a2];
  +[ERLogging log:v5 withType:0];

  double v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

uint64_t sub_100005B2C(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 info];
  [v3 flagForSetting:0];

  [*(id *)(a1 + 32) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

id sub_100005C4C(uint64_t a1)
{
  CFStringRef v4 = @"distance_event_category";
  v1 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) distanceCategory]);
  id v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100005D7C(uint64_t a1)
{
  CFStringRef v4 = @"intervention_outcome";
  v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  id v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void start()
{
  [(id)objc_opt_new() start];
  dispatch_main();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_disablePermissibleOnscreenContentMonitoring(void *a1, const char *a2, ...)
{
  return [a1 disablePermissibleOnscreenContentMonitoring];
}

id objc_msgSend_distanceCategory(void *a1, const char *a2, ...)
{
  return [a1 distanceCategory];
}

id objc_msgSend_distanceSampleActivity(void *a1, const char *a2, ...)
{
  return [a1 distanceSampleActivity];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_enablePermissibleOnscreenContentMonitoring(void *a1, const char *a2, ...)
{
  return [a1 enablePermissibleOnscreenContentMonitoring];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return [a1 engine];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactivityTimestamp(void *a1, const char *a2, ...)
{
  return [a1 inactivityTimestamp];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDemoModeActive(void *a1, const char *a2, ...)
{
  return [a1 isDemoModeActive];
}

id objc_msgSend_isEyeReliefSupported(void *a1, const char *a2, ...)
{
  return [a1 isEyeReliefSupported];
}

id objc_msgSend_isSamplingActive(void *a1, const char *a2, ...)
{
  return [a1 isSamplingActive];
}

id objc_msgSend_isSamplingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSamplingEnabled];
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 layoutMonitor];
}

id objc_msgSend_nonPermissibleOnscreenContent(void *a1, const char *a2, ...)
{
  return [a1 nonPermissibleOnscreenContent];
}

id objc_msgSend_samplingStateQueue(void *a1, const char *a2, ...)
{
  return [a1 samplingStateQueue];
}

id objc_msgSend_scheduleSampling(void *a1, const char *a2, ...)
{
  return [a1 scheduleSampling];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}

id objc_msgSend_tooCloseDistanceThreshold(void *a1, const char *a2, ...)
{
  return [a1 tooCloseDistanceThreshold];
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}