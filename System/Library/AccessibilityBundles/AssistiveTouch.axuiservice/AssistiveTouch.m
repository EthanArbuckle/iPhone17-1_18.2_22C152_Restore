void sub_59A8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t vars8;

  [*(id *)(a1 + 32) hideContentViewController];
  v2 = +[AXUIDisplayManager sharedDisplayManager];
  v3 = [*(id *)(a1 + 32) lastShownAlertIdentifier];
  [v2 hideAlertWithIdentifier:v3 forService:*(void *)(a1 + 32)];

  v5 = +[AXUIDisplayManager sharedDisplayManager];
  v4 = [*(id *)(a1 + 32) lastShownBannerIdentifier];
  [v5 hideAlertWithIdentifier:v4 forService:*(void *)(a1 + 32)];
}

void HNDTestingSetLastFiredAction(id obj)
{
}

id HNDTestingLastFiredAction()
{
  return (id)qword_CD40;
}

BOOL HNDIsPhoneUserInterfaceIdiom()
{
  v0 = +[UIDevice currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

id HNDLocString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_8390 table:@"HNDUIServer"];
  }
  else
  {
    _AXAssert();
    v4 = 0;
  }

  return v4;
}

uint64_t AXSAssistiveTouchCursorColor()
{
  return _AXSAssistiveTouchCursorColor();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXLogWithFacility()
{
  return __AXLogWithFacility();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__hideAlertsForAllSources(void *a1, const char *a2, ...)
{
  return [a1 _hideAlertsForAllSources];
}

id objc_msgSend__hideStateForAllSources(void *a1, const char *a2, ...)
{
  return [a1 _hideStateForAllSources];
}

id objc_msgSend_assistiveTouchCursorColor(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchCursorColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cameraInputSourceAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cameraInputSourceAlertIdentifier];
}

id objc_msgSend_cameraInputSourceStateLeftLayer(void *a1, const char *a2, ...)
{
  return [a1 cameraInputSourceStateLeftLayer];
}

id objc_msgSend_cameraInputSourceStateRightLayer(void *a1, const char *a2, ...)
{
  return [a1 cameraInputSourceStateRightLayer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hardwareInputSourceAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareInputSourceAlertIdentifier];
}

id objc_msgSend_hideAlerts(void *a1, const char *a2, ...)
{
  return [a1 hideAlerts];
}

id objc_msgSend_hideContentViewController(void *a1, const char *a2, ...)
{
  return [a1 hideContentViewController];
}

id objc_msgSend_lastShownAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 lastShownAlertIdentifier];
}

id objc_msgSend_lastShownBannerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 lastShownBannerIdentifier];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_scannerInputViewController(void *a1, const char *a2, ...)
{
  return [a1 scannerInputViewController];
}

id objc_msgSend_screenInputSourceAlertIdentifier(void *a1, const char *a2, ...)
{
  return [a1 screenInputSourceAlertIdentifier];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showContentViewController(void *a1, const char *a2, ...)
{
  return [a1 showContentViewController];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceServer(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceServer];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}