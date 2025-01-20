id sub_2CD8(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_309C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_30C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = cslprf_sessions_log();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_58AC(a1, (uint64_t)v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = [*(id *)(a1 + 32) domain];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "synchronized %@ %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 40) && WeakRetained)
  {
    v9 = (void *)WeakRetained[24];
    v10 = [*(id *)(a1 + 32) domain];
    [v9 synchronizeNanoDomain:v10 keys:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 48))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_32B0;
    block[3] = &unk_8240;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    id v13 = *(id *)(a1 + 48);
    id v12 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v14);
  }
}

void sub_32B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_3AEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  unsigned int v2 = [WeakRetained isLegacyGizmo];

  id v3 = +[NSMutableArray arrayWithArray:&off_8880];
  if (v2) {
    v4 = &off_8898;
  }
  else {
    v4 = &off_88B0;
  }
  v11[0] = @"RETURN_TO_CLOCK_ALWAYS";
  v11[1] = @"RETURN_TO_CLOCK_AFTER_2_MINUTES";
  v12[0] = v4;
  v12[1] = &off_88C8;
  v11[2] = @"RETURN_TO_CLOCK_AFTER_1_HOUR";
  v11[3] = @"RETURN_TO_CLOCK_ON_CROWN_PRESS";
  v12[2] = &off_88E0;
  v12[3] = &off_88F8;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  if ((CSLSAllowReturnToAppUntilCrownPress() & 1) == 0)
  {
    [v3 removeLastObject];
    [v6 setObject:0 forKeyedSubscript:@"RETURN_TO_CLOCK_ON_CROWN_PRESS"];
  }
  id v7 = [v3 copy];
  uint64_t v8 = (void *)qword_CF18;
  qword_CF18 = (uint64_t)v7;

  id v9 = [v6 copy];
  v10 = (void *)qword_CF20;
  qword_CF20 = (uint64_t)v9;
}

void sub_3C78(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = +[NSString stringWithFormat:@"%@_LABEL", v3];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v10 value:&stru_8440 table:@"CompanionWakeSettings"];

  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  [v6 setIdentifier:v3];
  id v7 = [(id)qword_CF20 objectForKeyedSubscript:v3];

  id v8 = [v7 integerValue];
  id v9 = *(void **)(a1 + 32);
  if (v8 == (id)v9[3]) {
    [v9 setSelectedSpecifier:v6];
  }
  [v6 setProperty:v7 forKey:PSValueKey];
  [v6 setProperty:&__kCFBooleanTrue forKey:@"kCSLPRFReturnToClockSetting"];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v6];
}

id sub_432C(uint64_t a1, void *a2)
{
  return [a2 reloadAll];
}

void sub_5408(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v6 localizedStringForKey:v5 value:&stru_8440 table:@"CompanionWakeSettings"];

  id v7 = +[PSSpecifier preferenceSpecifierNamed:v10 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  id v8 = +[NSNumber numberWithBool:a3];
  [v7 setProperty:v8 forKey:PSValueKey];

  [v7 setProperty:&__kCFBooleanTrue forKey:@"kCSLPRFReturnToClockCustomSetting"];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v7];
  id v9 = *(unsigned __int8 **)(a1 + 32);
  if (v9[24] == a3) {
    [v9 setSelectedSpecifier:v7];
  }
}

void sub_58AC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  v6 = [*(id *)(a1 + 32) domain];
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "could not synchronize %@ %@ %@", (uint8_t *)&v8, 0x20u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CSLSAllowReturnToAppUntilCrownPress()
{
  return _CSLSAllowReturnToAppUntilCrownPress();
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

uint64_t cslprf_sessions_log()
{
  return _cslprf_sessions_log();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__onTapGroup(void *a1, const char *a2, ...)
{
  return [a1 _onTapGroup];
}

id objc_msgSend__unlocalizedCustomFooter(void *a1, const char *a2, ...)
{
  return [a1 _unlocalizedCustomFooter];
}

id objc_msgSend_alwaysReturnToAppInSession(void *a1, const char *a2, ...)
{
  return [a1 alwaysReturnToAppInSession];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAppTimeoutSetting(void *a1, const char *a2, ...)
{
  return [a1 currentAppTimeoutSetting];
}

id objc_msgSend_defaultAppStickinessDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultAppStickinessDuration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hasCustomReturnToAppTimeout(void *a1, const char *a2, ...)
{
  return [a1 hasCustomReturnToAppTimeout];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isLegacyGizmo(void *a1, const char *a2, ...)
{
  return [a1 isLegacyGizmo];
}

id objc_msgSend_isWakeSetToShort(void *a1, const char *a2, ...)
{
  return [a1 isWakeSetToShort];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_returnToAppSettings(void *a1, const char *a2, ...)
{
  return [a1 returnToAppSettings];
}

id objc_msgSend_returnToAppSettingsDelegate(void *a1, const char *a2, ...)
{
  return [a1 returnToAppSettingsDelegate];
}

id objc_msgSend_returnToAppSettingsModel(void *a1, const char *a2, ...)
{
  return [a1 returnToAppSettingsModel];
}

id objc_msgSend_returnToAppTimeout(void *a1, const char *a2, ...)
{
  return [a1 returnToAppTimeout];
}

id objc_msgSend_saveAppSettings(void *a1, const char *a2, ...)
{
  return [a1 saveAppSettings];
}

id objc_msgSend_sessionCapable(void *a1, const char *a2, ...)
{
  return [a1 sessionCapable];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_systemPrefsDomainAccessor(void *a1, const char *a2, ...)
{
  return [a1 systemPrefsDomainAccessor];
}