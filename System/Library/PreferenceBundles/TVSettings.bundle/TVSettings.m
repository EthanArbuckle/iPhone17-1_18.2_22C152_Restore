id sub_2628(uint64_t a1)
{
  id result;
  uint64_t state64;

  state64 = 0;
  notify_get_state(**(_DWORD **)(a1 + 40), &state64);
  result = (id)getpid();
  if (state64 != (int)result)
  {
    NSLog(@"TVSettingsLog - preferences did change notification received from pid: %llu", state64);
    return [*(id *)(a1 + 32) externalPreferencesDidUpdate];
  }
  return result;
}

void sub_29A8(id a1)
{
  qword_1FA38 = (uint64_t)os_log_create("com.apple.Preferences.TVAppPreferences", "TVSettingsAddLanguageController");

  _objc_release_x1();
}

id sub_2E10(uint64_t a1, uint64_t a2)
{
  v3 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:a2];
  id v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  return v4;
}

int64_t sub_3ACC(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  return (int64_t)[(PSSpecifier *)a2 titleCompare:a3];
}

int64_t sub_4164(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  return (int64_t)[(PSSpecifier *)a2 titleCompare:a3];
}

void sub_4EF4(id a1)
{
  qword_1FA48 = (uint64_t)os_log_create("com.apple.Preferences.TVAppPreferences", "TVSettingsLanguageSettingsController");

  _objc_release_x1();
}

int64_t sub_5AF0(id a1, NSString *a2, NSString *a3)
{
  id v4 = a2;
  v5 = a3;
  if ([(NSString *)v4 isEqualToString:@"ORIGINAL_AUDIO_LANGUAGE"])
  {
    int64_t v6 = -1;
  }
  else
  {
    unsigned int v7 = [(NSString *)v4 isEqualToString:@"DEVICE_AUDIO_LANGUAGE"];
    unsigned int v8 = [(NSString *)v5 isEqualToString:@"ORIGINAL_AUDIO_LANGUAGE"];
    if (v7)
    {
      if (v8) {
        int64_t v6 = 1;
      }
      else {
        int64_t v6 = -1;
      }
    }
    else if ((v8 & 1) != 0 || [(NSString *)v5 isEqualToString:@"DEVICE_AUDIO_LANGUAGE"])
    {
      int64_t v6 = 1;
    }
    else
    {
      v9 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v4];
      v10 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v5];
      int64_t v6 = (int64_t)[v9 compare:v10];
    }
  }

  return v6;
}

int64_t sub_5BFC(id a1, NSString *a2, NSString *a3)
{
  id v4 = a3;
  v5 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:a2];
  int64_t v6 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v4];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_6C50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    v10 = (void (*)(id, uint64_t, id, id))[v7 methodForSelector:a1];
    id v11 = [v7 methodSignatureForSelector:a1];
    int v12 = *(unsigned __int8 *)[v11 methodReturnType];

    if (v9)
    {
      if (v12 == 64)
      {
        uint64_t v13 = v10(v7, a1, v8, v9);
LABEL_14:
        v15 = (void *)v13;
LABEL_16:
        if (v12 == 64) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v14 = v16;

        goto LABEL_20;
      }
      v10(v7, a1, v8, v9);
    }
    else if (v8)
    {
      if (v12 == 64)
      {
        uint64_t v13 = ((void (*)(id, uint64_t, id))v10)(v7, a1, v8);
        goto LABEL_14;
      }
      ((void (*)(id, uint64_t, id))v10)(v7, a1, v8);
    }
    else
    {
      if (v12 == 64)
      {
        uint64_t v13 = ((void (*)(id, uint64_t))v10)(v7, a1);
        goto LABEL_14;
      }
      ((void (*)(id, uint64_t))v10)(v7, a1);
    }
    v15 = 0;
    goto LABEL_16;
  }
  id v14 = 0;
LABEL_20:

  return v14;
}

void sub_7630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_7680(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_76C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_7700(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = sub_7804();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [WeakRetained _descriptionForExternalScreenType:a2];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Initial external screen type is %@", (uint8_t *)&v7, 0xCu);
  }
  if (a2 == 2)
  {
    int64_t v6 = +[WLKSystemPreferencesStore sharedPreferences];
    [v6 setHasAVAdapterEvenBeenConnected:1];

    [WeakRetained reloadSpecifiers];
  }
}

id sub_7804()
{
  if (qword_1FA60 != -1) {
    dispatch_once(&qword_1FA60, &stru_18838);
  }
  v0 = (void *)qword_1FA58;

  return v0;
}

void sub_8848(uint64_t a1)
{
  v2 = +[ISNetworkObserver sharedInstance];
  unsigned int v3 = +[ISNetworkObserver isLikelyToReachRemoteServerWithReachabilityFlags:](ISNetworkObserver, "isLikelyToReachRemoteServerWithReachabilityFlags:", [v2 networkReachabilityFlags]);

  id v4 = +[SSAccountStore defaultStore];
  v5 = [v4 activeAccount];

  if (v5) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeeded:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8958;
  block[3] = &unk_18700;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
}

void sub_8958(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[220] = 1;
  }
  id v2 = WeakRetained;
  [WeakRetained reloadSpecifiers];
}

void sub_96FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_9718(uint64_t a1)
{
  uint64_t v2 = +[WLKSettingsAMSBagTracker sharedTracker];
  [v2 updateTrackedBagValues];

  unsigned int v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void sub_9768(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[221] = a2;
  }
  id v5 = WeakRetained;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_97CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadSpecifiers];
    id WeakRetained = v2;
  }
}

void sub_A66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_A690(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3 && *(void *)(a1 + 32)) {
    return objc_msgSend(a2, "performSelector:withObject:withObject:", v4);
  }
  else {
    return objc_msgSend(a2, "performSelector:withObject:", v4);
  }
}

void sub_A6B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    NSLog(@"TVSettingsLog - undoing specifier %@ to old value of %@", *(void *)(a1 + 32), *(void *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_C0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C120(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    int v7 = +[HSAccountStore defaultStore];
    id v8 = [v5 objectForKeyedSubscript:AKAuthenticationUsernameKey];
    [v7 setAppleID:v8];

    id v9 = [v5 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    [v7 setPassword:v9];

    if ([v7 canDetermineGroupID])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_C284;
      v10[3] = &unk_18750;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      id v11 = *(id *)(a1 + 32);
      [v7 determineGroupIDWithCompletionHandler:v10];

      objc_destroyWeak(&v12);
    }
  }
}

void sub_C270(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_C284(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C33C;
  block[3] = &unk_187C8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_C33C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = WeakRetained;
  if (!*(unsigned char *)(a1 + 48))
  {
    unsigned int v3 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    uint64_t v4 = [v3 localizedStringForKey:@"HOME_SHARING_ERROR_TITLE" value:&stru_18968 table:@"TVSettings"];
    id v5 = +[UIAlertController alertControllerWithTitle:v4 message:0 preferredStyle:1];

    id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    char v7 = [v6 localizedStringForKey:@"OK" value:&stru_18968 table:@"TVSettings"];
    id v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:0];
    [v5 addAction:v8];

    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
    id WeakRetained = v14;
  }
  [WeakRetained _updateHomeSharingSpecifiersAnimated:1 shouldUpdateUsingTableView:1];
  uint64_t v9 = [v14 parentController];
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = [v14 parentController];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v13 = [v14 parentController];
      [v13 reloadSpecifiers];
    }
  }
}

void sub_C770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C798(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[HSAccountStore defaultStore];
  [v1 clearAllCredentials];
  [WeakRetained _updateHomeSharingSpecifiersAnimated:1 shouldUpdateUsingTableView:1];
  uint64_t v2 = [WeakRetained parentController];
  if (v2)
  {
    unsigned int v3 = (void *)v2;
    uint64_t v4 = [WeakRetained parentController];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [WeakRetained parentController];
      [v6 reloadSpecifiers];
    }
  }
}

void sub_DBD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[WLKSystemPreferencesStore sharedPreferences];
  [v1 setHasAVAdapterEvenBeenConnected:1];

  [WeakRetained reloadSpecifiers];
}

void sub_E130(id a1)
{
  qword_1FA58 = (uint64_t)os_log_create("com.apple.TVSettings", "TopLevelSetting");

  _objc_release_x1();
}

uint64_t sub_E214(uint64_t a1)
{
  qword_1FA70 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_E31C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_EA58(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[TVLog] Error: Corresponding cellular toggle specifier must exist in _specifiers to show cellular quality controls for %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MRMediaRemoteGetExternalScreenType()
{
  return _MRMediaRemoteGetExternalScreenType();
}

uint64_t MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications()
{
  return _MRMediaRemoteSetWantsExternalScreenTypeChangeNotifications();
}

void NSLog(NSString *format, ...)
{
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

uint64_t SSDeviceIsHDRCapable()
{
  return _SSDeviceIsHDRCapable();
}

uint64_t WLKFetchIsSportsEnabled()
{
  return _WLKFetchIsSportsEnabled();
}

uint64_t WLKIsRegulatedSKU()
{
  return _WLKIsRegulatedSKU();
}

uint64_t WLKSystemSettingsDebugOverride()
{
  return _WLKSystemSettingsDebugOverride();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_msgSend__autoPlayNextVideoPreferenceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _autoPlayNextVideoPreferenceSpecifier];
}

id objc_msgSend__checkSettingsAndReload(void *a1, const char *a2, ...)
{
  return [a1 _checkSettingsAndReload];
}

id objc_msgSend__devicePreferenceSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _devicePreferenceSpecifiers];
}

id objc_msgSend__isDebugMode(void *a1, const char *a2, ...)
{
  return [a1 _isDebugMode];
}

id objc_msgSend__loadingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _loadingSpecifiers];
}

id objc_msgSend__okayToShowCellularPlaybackAndDownloadSettings(void *a1, const char *a2, ...)
{
  return [a1 _okayToShowCellularPlaybackAndDownloadSettings];
}

id objc_msgSend__setupNavigationBar(void *a1, const char *a2, ...)
{
  return [a1 _setupNavigationBar];
}

id objc_msgSend__shouldEditButtonBeEnabled(void *a1, const char *a2, ...)
{
  return [a1 _shouldEditButtonBeEnabled];
}

id objc_msgSend__syncDevicePreferenceValues(void *a1, const char *a2, ...)
{
  return [a1 _syncDevicePreferenceValues];
}

id objc_msgSend__updateRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _updateRestrictions];
}

id objc_msgSend_accessStatus(void *a1, const char *a2, ...)
{
  return [a1 accessStatus];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_audioLanguageCodeIncludingSentinel(void *a1, const char *a2, ...)
{
  return [a1 audioLanguageCodeIncludingSentinel];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_canBeDeleted(void *a1, const char *a2, ...)
{
  return [a1 canBeDeleted];
}

id objc_msgSend_canDetermineGroupID(void *a1, const char *a2, ...)
{
  return [a1 canDetermineGroupID];
}

id objc_msgSend_cellularQualityDownload(void *a1, const char *a2, ...)
{
  return [a1 cellularQualityDownload];
}

id objc_msgSend_cellularQualityPlayback(void *a1, const char *a2, ...)
{
  return [a1 cellularQualityPlayback];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return [a1 channelID];
}

id objc_msgSend_clearAllCredentials(void *a1, const char *a2, ...)
{
  return [a1 clearAllCredentials];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return [a1 connectedScenes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_downloadsCompatibleWithAVAdapter(void *a1, const char *a2, ...)
{
  return [a1 downloadsCompatibleWithAVAdapter];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return [a1 editButtonItem];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_externalPreferencesDidUpdate(void *a1, const char *a2, ...)
{
  return [a1 externalPreferencesDidUpdate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flow(void *a1, const char *a2, ...)
{
  return [a1 flow];
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return [a1 groupID];
}

id objc_msgSend_hasAVAdapterEvenBeenConnected(void *a1, const char *a2, ...)
{
  return [a1 hasAVAdapterEvenBeenConnected];
}

id objc_msgSend_homeSharingAppleID(void *a1, const char *a2, ...)
{
  return [a1 homeSharingAppleID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isNowPlayingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNowPlayingEnabled];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastSyncDate(void *a1, const char *a2, ...)
{
  return [a1 lastSyncDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_methodReturnType(void *a1, const char *a2, ...)
{
  return [a1 methodReturnType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_networkReachabilityFlags(void *a1, const char *a2, ...)
{
  return [a1 networkReachabilityFlags];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return [a1 performGetter];
}

id objc_msgSend_postPlayAutoPlayNextVideo(void *a1, const char *a2, ...)
{
  return [a1 postPlayAutoPlayNextVideo];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredPlaybackDimensionality(void *a1, const char *a2, ...)
{
  return [a1 preferredPlaybackDimensionality];
}

id objc_msgSend_preferredSubtitleLanguageCodes(void *a1, const char *a2, ...)
{
  return [a1 preferredSubtitleLanguageCodes];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_privateModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 privateModeEnabled];
}

id objc_msgSend_purchaseResolution(void *a1, const char *a2, ...)
{
  return [a1 purchaseResolution];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_scrollToSelectedCell(void *a1, const char *a2, ...)
{
  return [a1 scrollToSelectedCell];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return [a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedAudioLanguages(void *a1, const char *a2, ...)
{
  return [a1 selectedAudioLanguages];
}

id objc_msgSend_selectedAudioLanguagesDownload(void *a1, const char *a2, ...)
{
  return [a1 selectedAudioLanguagesDownload];
}

id objc_msgSend_selectedLanguages(void *a1, const char *a2, ...)
{
  return [a1 selectedLanguages];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_sharedTracker(void *a1, const char *a2, ...)
{
  return [a1 sharedTracker];
}

id objc_msgSend_sportsScoreSpoilersAllowed(void *a1, const char *a2, ...)
{
  return [a1 sportsScoreSpoilersAllowed];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtitleAudioLanguagesDownload(void *a1, const char *a2, ...)
{
  return [a1 subtitleAudioLanguagesDownload];
}

id objc_msgSend_subtitleDefaultLanguageEnabledDownload(void *a1, const char *a2, ...)
{
  return [a1 subtitleDefaultLanguageEnabledDownload];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topLevelController(void *a1, const char *a2, ...)
{
  return [a1 topLevelController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unselectedLanguages(void *a1, const char *a2, ...)
{
  return [a1 unselectedLanguages];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_upNextLockupsUseCoverArt(void *a1, const char *a2, ...)
{
  return [a1 upNextLockupsUseCoverArt];
}

id objc_msgSend_updateLabels(void *a1, const char *a2, ...)
{
  return [a1 updateLabels];
}

id objc_msgSend_updateTrackedBagValues(void *a1, const char *a2, ...)
{
  return [a1 updateTrackedBagValues];
}

id objc_msgSend_useCellularDataDownload(void *a1, const char *a2, ...)
{
  return [a1 useCellularDataDownload];
}

id objc_msgSend_useCellularDataPlayback(void *a1, const char *a2, ...)
{
  return [a1 useCellularDataPlayback];
}

id objc_msgSend_useDefaultSubtitleLanguages(void *a1, const char *a2, ...)
{
  return [a1 useDefaultSubtitleLanguages];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_wifiQualityDownload(void *a1, const char *a2, ...)
{
  return [a1 wifiQualityDownload];
}

id objc_msgSend_wifiQualityPlayback(void *a1, const char *a2, ...)
{
  return [a1 wifiQualityPlayback];
}