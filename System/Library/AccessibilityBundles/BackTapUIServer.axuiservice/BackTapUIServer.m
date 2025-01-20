id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_8400 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_37E0(id a1)
{
  qword_CE50 = objc_alloc_init(AXBackTapUIServer);

  _objc_release_x1();
}

void sub_38F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_3914(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_39E8;
  v4[3] = &unk_82B0;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained _addBackTapViewController:v4];

  objc_destroyWeak(&v6);
}

void sub_39D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_39E8(uint64_t a1)
{
  id v2 = objc_alloc((Class)AXPhoenixGestureDetector);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v2 initWithDelegate:WeakRetained];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 setGestureDetector:v4];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_3CF0, kAXSHomeClickSpeedChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, *(const void **)(a1 + 32), (CFNotificationCallback)sub_3CF0, kAXSSideButtonClickSpeedChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 _updateClickSpeed];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = [v9 gestureDetector];

  if (v10)
  {
    v11 = +[AXSettings sharedInstance];
    id v12 = [v11 backTapFalsePositiveAlertsEnabled];
    id v13 = objc_loadWeakRetained((id *)(a1 + 40));
    v14 = [v13 gestureDetector];
    [v14 setFalsePositiveLoggingEnabled:v12];

    v15 = +[AXSettings sharedInstance];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_3CF8;
    v27[3] = &unk_8288;
    objc_copyWeak(&v28, (id *)(a1 + 40));
    [v15 registerUpdateBlock:v27 forRetrieveSelector:"backTapFalsePositiveAlertsEnabled" withListener:*(void *)(a1 + 32)];

    objc_destroyWeak(&v28);
    v16 = +[AXSettings sharedInstance];
    id v17 = [v16 backTapRNNModelEnabled];
    id v18 = objc_loadWeakRetained((id *)(a1 + 40));
    v19 = [v18 gestureDetector];
    [v19 setRnnModelEnabled:v17];

    v20 = +[AXSettings sharedInstance];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_3D84;
    v25 = &unk_8288;
    objc_copyWeak(&v26, (id *)(a1 + 40));
    [v20 registerUpdateBlock:&v22 forRetrieveSelector:"backTapRNNModelEnabled" withListener:*(void *)(a1 + 32)];

    objc_destroyWeak(&v26);
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    [v21 _registerForBackTapEvents];
  }
  else
  {
    v21 = AXLogBackTap();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_5588(v21);
    }
  }
}

void sub_3CD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_3CF0(uint64_t a1, void *a2)
{
  return [a2 _updateClickSpeed];
}

void sub_3CF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[AXSettings sharedInstance];
    id v2 = [v1 backTapFalsePositiveAlertsEnabled];
    v3 = [WeakRetained gestureDetector];
    [v3 setFalsePositiveLoggingEnabled:v2];
  }
}

void sub_3D84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[AXSettings sharedInstance];
    id v2 = [v1 backTapRNNModelEnabled];
    v3 = [WeakRetained gestureDetector];
    [v3 setRnnModelEnabled:v2];
  }
}

BOOL sub_3EE0(id a1, AXEventRepresentation *a2)
{
  id v2 = [(AXEventRepresentation *)a2 accessibilityData];
  if ([v2 page] == (char *)&dword_0 + 1)
  {
    v3 = (char *)[v2 usage];
    id v4 = +[AXSettings sharedInstance];
    id v5 = v4;
    if (v3 == (unsigned char *)&dword_0 + 1) {
      [v4 backTapDoubleTapAction];
    }
    else {
    id v6 = [v4 backTapTripleTapAction];
    }

    if (v6)
    {
      v7 = +[AXPISystemActionHelper sharedInstance];
      [v7 performActionForSystemAction:v6 fromClient:AXPISystemActionHelperClientBackTap];

      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

void sub_4448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_446C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = AXLogBackTap();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_55CC((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _serverEnabled];

    [*(id *)(a1 + 32) setGestureDetectorRunning:1];
  }
}

void sub_45CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = AXLogBackTap();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_5638((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setGestureDetectorRunning:0];
  }
}

id sub_46A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addBackTapViewController:0];
}

void sub_4AC8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectForKey:@"filename"];
  [v1 _confirmFalsePositiveReportForFilename:v2];
}

void sub_4E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_4EAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setBackTapViewController:v2];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_506C(uint64_t a1)
{
  uint64_t v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 backTapFalsePositiveAlertsEnabled];

  if (v3)
  {
    id v4 = +[AXUIDisplayManager sharedDisplayManager];
    id v5 = [*(id *)(a1 + 32) activeAlertIdentifier];
    [v4 hideAlertWithIdentifier:v5 forService:*(void *)(a1 + 32)];

    uint64_t v6 = +[AXUIDisplayManager sharedDisplayManager];
    uint64_t v7 = accessibilityLocalizedString(@"alert.message.title");
    uint64_t v8 = accessibilityLocalizedString(@"alert.message.subtitle");
    uint64_t v9 = *(void *)(a1 + 40);
    CFStringRef v12 = @"filename";
    uint64_t v13 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v11 = [v6 showAlertWithText:v7 subtitleText:v8 iconImage:0 type:3 priority:30 duration:v10 userInfo:6.0 forService:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setReportAlertIdentifier:v11];
  }
}

void sub_556C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_5588(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to initialize phoenix gesture detector", v1, 2u);
}

void sub_55CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_5638(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_56A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AXDeviceHasHomeButton()
{
  return _AXDeviceHasHomeButton();
}

uint64_t AXDeviceSupportsBackTap()
{
  return _AXDeviceSupportsBackTap();
}

uint64_t AXLogBackTap()
{
  return _AXLogBackTap();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThread()
{
  return _AXPerformBlockOnMainThread();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

uint64_t _AXSHomeClickSpeed()
{
  return __AXSHomeClickSpeed();
}

uint64_t _AXSSideButtonClickSpeed()
{
  return __AXSSideButtonClickSpeed();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend__hideContentViewController(void *a1, const char *a2, ...)
{
  return [a1 _hideContentViewController];
}

id objc_msgSend__registerForBackTapEvents(void *a1, const char *a2, ...)
{
  return [a1 _registerForBackTapEvents];
}

id objc_msgSend__serverEnabled(void *a1, const char *a2, ...)
{
  return [a1 _serverEnabled];
}

id objc_msgSend__startGestureDetector(void *a1, const char *a2, ...)
{
  return [a1 _startGestureDetector];
}

id objc_msgSend__stopGestureDetector(void *a1, const char *a2, ...)
{
  return [a1 _stopGestureDetector];
}

id objc_msgSend__unregisterForBackTapEvents(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForBackTapEvents];
}

id objc_msgSend__updateClickSpeed(void *a1, const char *a2, ...)
{
  return [a1 _updateClickSpeed];
}

id objc_msgSend_accessibilityData(void *a1, const char *a2, ...)
{
  return [a1 accessibilityData];
}

id objc_msgSend_activeAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activeAlertIdentifier];
}

id objc_msgSend_backTapDoubleTapAction(void *a1, const char *a2, ...)
{
  return [a1 backTapDoubleTapAction];
}

id objc_msgSend_backTapFalsePositiveAlertsEnabled(void *a1, const char *a2, ...)
{
  return [a1 backTapFalsePositiveAlertsEnabled];
}

id objc_msgSend_backTapRNNModelEnabled(void *a1, const char *a2, ...)
{
  return [a1 backTapRNNModelEnabled];
}

id objc_msgSend_backTapTripleTapAction(void *a1, const char *a2, ...)
{
  return [a1 backTapTripleTapAction];
}

id objc_msgSend_backTapUsageCount(void *a1, const char *a2, ...)
{
  return [a1 backTapUsageCount];
}

id objc_msgSend_backTapViewController(void *a1, const char *a2, ...)
{
  return [a1 backTapViewController];
}

id objc_msgSend_gestureDetector(void *a1, const char *a2, ...)
{
  return [a1 gestureDetector];
}

id objc_msgSend_gestureDetectorRunning(void *a1, const char *a2, ...)
{
  return [a1 gestureDetectorRunning];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_reportAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reportAlertIdentifier];
}

id objc_msgSend_setDoubleTapPolicy(void *a1, const char *a2, ...)
{
  return [a1 setDoubleTapPolicy];
}

id objc_msgSend_setGeneralPolicy(void *a1, const char *a2, ...)
{
  return [a1 setGeneralPolicy];
}

id objc_msgSend_setTripleTapPolicy(void *a1, const char *a2, ...)
{
  return [a1 setTripleTapPolicy];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}