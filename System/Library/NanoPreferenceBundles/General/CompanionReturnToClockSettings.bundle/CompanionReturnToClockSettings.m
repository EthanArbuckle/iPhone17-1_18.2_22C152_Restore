id sub_34C8(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_388C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_38B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = cslprf_sessions_log();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_846C(a1, (uint64_t)v3, v6);
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
    block[2] = sub_3AA0;
    block[3] = &unk_C2A8;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    id v13 = *(id *)(a1 + 48);
    id v12 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v14);
  }
}

void sub_3AA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_4528(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_45FC, @"CSLOnWakeTimeoutPreferenceChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  id v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)sub_45FC, @"CSLPRFSessionsSettingsChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
}

id sub_45FC(uint64_t a1, void *a2)
{
  return [a2 reloadAll];
}

void sub_4670(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 184))
  {
    *(unsigned char *)(v1 + 184) = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, *(const void **)(a1 + 32));
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 32) name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
  }
}

void sub_47A0(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 nanoDomainAccessor];
  [v3 _synchronizeDomainWithAccessor:v4 keys:0 withCompletion:&stru_C338];
}

void sub_4810(id a1, CSLPRFReturnToClockSettingsViewController *a2, NSError *a3)
{
  id v4 = a2;
  id v3 = v4;
  BSDispatchMain();
}

id sub_489C(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    [result reloadReturnToAppSettingsModel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 240);
    *(void *)(v3 + 240) = 0;

    v5 = *(void **)(a1 + 32);
    return [v5 reloadSpecifiers];
  }
  return result;
}

void sub_50DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5100(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = cslprf_sessions_log();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_846C(a1, (uint64_t)v3, v6);
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
    v9 = (void *)WeakRetained[27];
    v10 = [*(id *)(a1 + 32) domain];
    [v9 synchronizeNanoDomain:v10 keys:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 48))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_52F0;
    block[3] = &unk_C2A8;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    id v13 = *(id *)(a1 + 48);
    id v12 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v14);
  }
}

void sub_52F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_56EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_570C(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [v8 name];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v5 setApp:v8];
    v6 = [v8 bundleID];
    [v5 setIdentifier:v6];

    v7 = [v8 bundleID];
    [v5 setProperty:v7 forKey:PSLazyIconAppID];

    [v5 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
    [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v5 setProperty:WeakRetained forKey:@"ReturnToAppSettingsDelegate"];
    [v5 setProperty:WeakRetained[24] forKey:@"ReturnToAppSettingsModel"];
    [v5 setProperty:&__kCFBooleanTrue forKey:@"ReturnToAppAppSpecifier"];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_596C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_5988(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 allValues];

  [WeakRetained _setApps:v4];
}

int64_t sub_5A7C(id a1, CSLPRFApp *a2, CSLPRFApp *a3)
{
  return (int64_t)[(CSLPRFApp *)a2 compare:a3];
}

void sub_6034(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__specifiers);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_60D8;
  v5[3] = &unk_C418;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void sub_60D8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 identifier];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    v9 = cslprf_sessions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%@ changed reloading specifier %@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 40) reloadSpecifier:v6];
    *a4 = 1;
  }
}

void sub_66AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  unsigned int v2 = [WeakRetained isLegacyGizmo];

  id v3 = +[NSMutableArray arrayWithArray:&off_CD98];
  if (v2) {
    uint64_t v4 = &off_CDB0;
  }
  else {
    uint64_t v4 = &off_CDC8;
  }
  v11[0] = @"RETURN_TO_CLOCK_ALWAYS";
  v11[1] = @"RETURN_TO_CLOCK_AFTER_2_MINUTES";
  v12[0] = v4;
  v12[1] = &off_CDE0;
  v11[2] = @"RETURN_TO_CLOCK_AFTER_1_HOUR";
  v11[3] = @"RETURN_TO_CLOCK_ON_CROWN_PRESS";
  v12[2] = &off_CDF8;
  v12[3] = &off_CE10;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  if ((CSLSAllowReturnToAppUntilCrownPress() & 1) == 0)
  {
    [v3 removeLastObject];
    [v6 setObject:0 forKeyedSubscript:@"RETURN_TO_CLOCK_ON_CROWN_PRESS"];
  }
  id v7 = [v3 copy];
  id v8 = (void *)qword_11A38;
  qword_11A38 = (uint64_t)v7;

  id v9 = [v6 copy];
  uint64_t v10 = (void *)qword_11A40;
  qword_11A40 = (uint64_t)v9;
}

void sub_6838(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = +[NSString stringWithFormat:@"%@_LABEL", v3];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v10 value:&stru_C5F0 table:@"CompanionWakeSettings"];

  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  [v6 setIdentifier:v3];
  id v7 = [(id)qword_11A40 objectForKeyedSubscript:v3];

  id v8 = [v7 integerValue];
  id v9 = *(void **)(a1 + 32);
  if (v8 == (id)v9[3]) {
    [v9 setSelectedSpecifier:v6];
  }
  [v6 setProperty:v7 forKey:PSValueKey];
  [v6 setProperty:&__kCFBooleanTrue forKey:@"kCSLPRFReturnToClockSetting"];
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:v6];
}

id sub_6EEC(uint64_t a1, void *a2)
{
  return [a2 reloadAll];
}

void sub_7FC8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v6 localizedStringForKey:v5 value:&stru_C5F0 table:@"CompanionWakeSettings"];

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

void sub_846C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v6 = [*(id *)(a1 + 32) domain];
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "could not synchronize %@ %@ %@", (uint8_t *)&v8, 0x20u);
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
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

id objc_msgSend__appSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _appSpecifiers];
}

id objc_msgSend__loadApps(void *a1, const char *a2, ...)
{
  return [a1 _loadApps];
}

id objc_msgSend__onTapGroup(void *a1, const char *a2, ...)
{
  return [a1 _onTapGroup];
}

id objc_msgSend__unlocalizedCustomFooter(void *a1, const char *a2, ...)
{
  return [a1 _unlocalizedCustomFooter];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysReturnToAppInSession(void *a1, const char *a2, ...)
{
  return [a1 alwaysReturnToAppInSession];
}

id objc_msgSend_appStickinessDuration(void *a1, const char *a2, ...)
{
  return [a1 appStickinessDuration];
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

id objc_msgSend_carouselDomainAccessor(void *a1, const char *a2, ...)
{
  return [a1 carouselDomainAccessor];
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

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
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

id objc_msgSend_nanoDomainAccessor(void *a1, const char *a2, ...)
{
  return [a1 nanoDomainAccessor];
}

id objc_msgSend_reloadAll(void *a1, const char *a2, ...)
{
  return [a1 reloadAll];
}

id objc_msgSend_reloadReturnToAppSettingsModel(void *a1, const char *a2, ...)
{
  return [a1 reloadReturnToAppSettingsModel];
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

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_startObservingNotifications(void *a1, const char *a2, ...)
{
  return [a1 startObservingNotifications];
}

id objc_msgSend_stopObservingNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopObservingNotifications];
}

id objc_msgSend_systemPrefsDomainAccessor(void *a1, const char *a2, ...)
{
  return [a1 systemPrefsDomainAccessor];
}