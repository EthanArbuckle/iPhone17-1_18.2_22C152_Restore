uint64_t sub_4788(uint64_t a1)
{
  uint64_t vars8;

  qword_CDF0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_4A98(uint64_t a1)
{
  v2 = +[AXUIDisplayManager sharedDisplayManager];
  v3 = [*(id *)(a1 + 32) _overlayController];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_4B58;
  v8 = &unk_8248;
  uint64_t v9 = v4;
  objc_msgSend(v2, "addContentViewController:withUserInteractionEnabled:forService:context:completion:", v3, 0);
}

void sub_4B58(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _overlayController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4BEC;
  v3[3] = &unk_8220;
  v3[4] = *(void *)(a1 + 32);
  [v2 fadeToBlackAndComeBack:v3 completion:1.0];
}

void sub_4BEC(uint64_t a1)
{
  v2 = +[AXSubsystemInvertColors sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = +[AXSubsystemInvertColors identifier];
    v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = AXColorizeFormatLog();
      v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  uint64_t v9 = +[AXUIDisplayManager sharedDisplayManager];
  v10 = [*(id *)(a1 + 32) _overlayController];
  [v9 removeContentViewController:v10 withUserInteractionEnabled:0 forService:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "set_overlayController:", 0);
  v11 = +[AXUIServiceManager sharedServiceManager];
  [v11 endTransactionWithIdentifier:@"SmartInvertDisplay" forService:*(void *)(a1 + 32)];
}

void sub_5398(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _filterView];
  [v1 setAlpha:1.0];
}

void sub_53E0(uint64_t a1)
{
  double v1 = *(double *)(a1 + 48);
  double v2 = (v1 + v1) * 0.25;
  double v3 = v1 * 0.25;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_54E0;
  v6[3] = &unk_8220;
  v6[4] = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5528;
  v4[3] = &unk_8270;
  id v5 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:0 delay:v6 options:v4 animations:v2 completion:v3];
}

void sub_54E0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _filterView];
  [v1 setAlpha:0.0];
}

uint64_t sub_5528(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MADisplayFilterCopySystemFilter()
{
  return _MADisplayFilterCopySystemFilter();
}

uint64_t MADisplayFilterCreateIdentity()
{
  return _MADisplayFilterCreateIdentity();
}

uint64_t MADisplayFilterCreateRedNightMode()
{
  return _MADisplayFilterCreateRedNightMode();
}

uint64_t MADisplayFilterGetMatrix()
{
  return _MADisplayFilterGetMatrix();
}

uint64_t MADisplayFilterGetPostOffsets()
{
  return _MADisplayFilterGetPostOffsets();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return _MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t MADisplayFilterPrefGetType()
{
  return _MADisplayFilterPrefGetType();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
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

id objc_msgSend__applyInitialLayoutConstraints(void *a1, const char *a2, ...)
{
  return [a1 _applyInitialLayoutConstraints];
}

id objc_msgSend__fadeDisplayForSmartInvertStart(void *a1, const char *a2, ...)
{
  return [a1 _fadeDisplayForSmartInvertStart];
}

id objc_msgSend__filterView(void *a1, const char *a2, ...)
{
  return [a1 _filterView];
}

id objc_msgSend__overlayController(void *a1, const char *a2, ...)
{
  return [a1 _overlayController];
}

id objc_msgSend__setupLayers(void *a1, const char *a2, ...)
{
  return [a1 _setupLayers];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_classicInvertColors(void *a1, const char *a2, ...)
{
  return [a1 classicInvertColors];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_effectBackdropLayer(void *a1, const char *a2, ...)
{
  return [a1 effectBackdropLayer];
}

id objc_msgSend_effectReplicatorLayer(void *a1, const char *a2, ...)
{
  return [a1 effectReplicatorLayer];
}

id objc_msgSend_effectView(void *a1, const char *a2, ...)
{
  return [a1 effectView];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedServiceManager(void *a1, const char *a2, ...)
{
  return [a1 sharedServiceManager];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}