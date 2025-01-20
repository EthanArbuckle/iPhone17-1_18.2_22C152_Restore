void sub_405C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  id *v22;

  v22 = v21;
  objc_destroyWeak(v22);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4098(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_DWORD *)WeakRetained + 50) == a2)
  {
    v5 = WeakRetained;
    id v4 = [WeakRetained[23] synchronize];
    [v5 reloadSpecifiers];
    WeakRetained = v5;
  }
}

void sub_4118(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_DWORD *)WeakRetained + 51) == a2)
  {
    v5 = WeakRetained;
    id v4 = [WeakRetained[24] synchronize];
    [v5 reloadSpecifiers];
    WeakRetained = v5;
  }
}

void sub_4B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4B34(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_DWORD *)WeakRetained + 48) == a2)
  {
    v5 = WeakRetained;
    id v4 = [WeakRetained[23] synchronize];
    [v5 reloadSpecifiers];
    WeakRetained = v5;
  }
}

void sub_5388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_53B0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) setObject:*(void *)(a1 + 40) forKey:@"gestureMode"];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 184) synchronize];
  v3 = objc_opt_new();
  id v4 = WAGPreferencesDomain;
  CFStringRef v7 = @"gestureMode";
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = +[NSSet setWithArray:v5];
  [v3 synchronizeNanoDomain:v4 keys:v6];
}

void sub_54B8(uint64_t a1)
{
  id v2 = +[WatchControlSettings sharedInstance];
  [v2 disableAllGreySupportFeatures];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_557C;
  block[3] = &unk_8320;
  id v5 = *(id *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_557C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_558C(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:&__kCFBooleanFalse forKey:PSValueKey];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

void sub_6478(id a1)
{
  qword_C4F8 = (uint64_t)os_log_create("com.apple.WatchGestures", "EltonPhoneSettings");

  _objc_release_x1();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__coverToMuteSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _coverToMuteSpecifiers];
}

id objc_msgSend__doubleTapSettingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _doubleTapSettingSpecifiers];
}

id objc_msgSend__eltonGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _eltonGroupSpecifiers];
}

id objc_msgSend__gestureMode(void *a1, const char *a2, ...)
{
  return [a1 _gestureMode];
}

id objc_msgSend__ignoreWhileVisionProDonnedSettingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _ignoreWhileVisionProDonnedSettingSpecifiers];
}

id objc_msgSend__pairedDeviceIsTinker(void *a1, const char *a2, ...)
{
  return [a1 _pairedDeviceIsTinker];
}

id objc_msgSend__pairedDeviceSupportsElton(void *a1, const char *a2, ...)
{
  return [a1 _pairedDeviceSupportsElton];
}

id objc_msgSend__phoneSettings(void *a1, const char *a2, ...)
{
  return [a1 _phoneSettings];
}

id objc_msgSend__playbackSettingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _playbackSettingSpecifiers];
}

id objc_msgSend__smartStackSettingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _smartStackSettingSpecifiers];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_disableAllGreySupportFeatures(void *a1, const char *a2, ...)
{
  return [a1 disableAllGreySupportFeatures];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getNowPlayingType(void *a1, const char *a2, ...)
{
  return [a1 getNowPlayingType];
}

id objc_msgSend_getSmartStackPrimaryActionType(void *a1, const char *a2, ...)
{
  return [a1 getSmartStackPrimaryActionType];
}

id objc_msgSend_hasGreySupportFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 hasGreySupportFeatureEnabled];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}