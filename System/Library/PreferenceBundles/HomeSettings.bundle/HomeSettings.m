uint64_t sub_43F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_440C(id a1, HMHome *a2)
{
  return [(HMHome *)a2 hos_isMyHome];
}

BOOL sub_4420(id a1, HMHome *a2)
{
  return ![(HMHome *)a2 hos_isMyHome];
}

void sub_465C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4680(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
}

void sub_53C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_53DC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = [a2 propertyForKey:kHUHomePropertyKey];
  if (v7 == *(void **)(a1 + 32))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

id sub_559C(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    return objc_msgSend(v3, "hos_showError:", a2);
  }
  else
  {
    [v3 removeSpecifier:*(void *)(a1 + 40) animated:1];
    v4 = *(void **)(a1 + 32);
    return [v4 updateHomesSections];
  }
}

void sub_5A04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_94E8(v3, v4);
    }

    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"HOSResetHomeAlertTitle" value:&stru_108B0 table:@"HOSLocalizable"];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"HOSResetHomeFailedErrorMessage" value:&stru_108B0 table:@"HOSLocalizable"];
    v9 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"HOSButtonAlertOK" value:&stru_108B0 table:@"HOSLocalizable"];
    v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
    [v9 addAction:v12];

    v13 = [*(id *)(a1 + 32) navigationController];
    [v13 presentViewController:v9 animated:1 completion:0];
  }
  [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_6194(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  v4 = [*(id *)(a1 + 32) detailController];
  v5 = [v4 homeBuilder];
  v6 = [v5 home];
  v7 = [v6 uniqueIdentifier];
  id v8 = [v3 isEqual:v7];

  return v8;
}

void sub_6D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6D40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6D50(uint64_t a1)
{
}

void sub_6D58(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  double y = NSZeroPoint.y;
  id v5 = a2;
  objc_msgSend(v3, "drawAtPoint:blendMode:alpha:", 17, NSZeroPoint.x, y, 1.0);
  objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:blendMode:alpha:", 0, NSZeroPoint.x, y, 1.0);
  uint64_t v6 = [v5 currentImage];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t sub_71D8()
{
  v0 = +[UIScreen mainScreen];
  [v0 scale];
  double v2 = v1;

  id v3 = +[UIDevice currentDevice];
  v4 = (char *)[v3 userInterfaceIdiom];

  float v5 = v2;
  if (fabsf(v5 + -3.0) >= 0.00000011921)
  {
    if (fabsf(v5 + -2.0) >= 0.00000011921) {
      return v4 == (unsigned char *)&dword_0 + 1;
    }
    BOOL v6 = v4 == (unsigned char *)&dword_0 + 1;
    unsigned int v7 = 15;
  }
  else
  {
    BOOL v6 = v4 == (unsigned char *)&dword_0 + 1;
    unsigned int v7 = 32;
  }
  if (v6) {
    return 63;
  }
  else {
    return v7;
  }
}

id sub_7538(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateDownloadControlWithInstallStatus:a2 animated:1];
}

id sub_7548(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[HFErrorHandler sharedHandler];
  float v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [v4 logError:v3 operationDescription:v5];

  BOOL v6 = *(void **)(a1 + 32);

  return [v6 _updateDownloadControl:1];
}

void sub_75D4(id a1, id a2)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_10848);
}

void sub_7618(id a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  double v1 = HFHomeAppBundleID();
  [v2 openApplicationWithBundleID:v1];
}

void sub_8A08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  BOOL v6 = [a3 capitalizedString];
  id v11 = +[NSString stringWithFormat:@"Upgrade: %@", v6];

  unsigned int v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  unsigned int v9 = [v5 unsignedShortValue];

  v10 = objc_msgSend(v8, "ho_globalPerformanceSwitchSpecifierWithName:forUpgrade:", v11, v9);
  [v7 addObject:v10];
}

void sub_94A4(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "No HomeManager while trying to reset HomeKit data. Temporarily creating one", v1, 2u);
}

void sub_94E8(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Error erasing Home data: %@", (uint8_t *)&v4, 0xCu);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t HFHomeAppBundleID()
{
  return _HFHomeAppBundleID();
}

uint64_t HFLogForCategory()
{
  return _HFLogForCategory();
}

uint64_t HFPerformanceUpgradeTitles()
{
  return _HFPerformanceUpgradeTitles();
}

uint64_t LIIconContinuousCornerRadiusForVariant()
{
  return _LIIconContinuousCornerRadiusForVariant();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__gridForecastError(void *a1, const char *a2, ...)
{
  return [a1 _gridForecastError];
}

id objc_msgSend__setUpActiveAssertion(void *a1, const char *a2, ...)
{
  return [a1 _setUpActiveAssertion];
}

id objc_msgSend__showMyHomesGroup(void *a1, const char *a2, ...)
{
  return [a1 _showMyHomesGroup];
}

id objc_msgSend__showNoHomesGroup(void *a1, const char *a2, ...)
{
  return [a1 _showNoHomesGroup];
}

id objc_msgSend__showSharedHomesGroup(void *a1, const char *a2, ...)
{
  return [a1 _showSharedHomesGroup];
}

id objc_msgSend__sortByNameDescriptor(void *a1, const char *a2, ...)
{
  return [a1 _sortByNameDescriptor];
}

id objc_msgSend__sortedMyHomes(void *a1, const char *a2, ...)
{
  return [a1 _sortedMyHomes];
}

id objc_msgSend__sortedSharedHomes(void *a1, const char *a2, ...)
{
  return [a1 _sortedSharedHomes];
}

id objc_msgSend__tearDownActiveAssertion(void *a1, const char *a2, ...)
{
  return [a1 _tearDownActiveAssertion];
}

id objc_msgSend_activeAssertion(void *a1, const char *a2, ...)
{
  return [a1 activeAssertion];
}

id objc_msgSend_administrator(void *a1, const char *a2, ...)
{
  return [a1 administrator];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_areAnySpeakersConfigured(void *a1, const char *a2, ...)
{
  return [a1 areAnySpeakersConfigured];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAppReinstallSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createAppReinstallSpecifiers];
}

id objc_msgSend_createGroupSpecifierForHomeHub(void *a1, const char *a2, ...)
{
  return [a1 createGroupSpecifierForHomeHub];
}

id objc_msgSend_createGroupSpecifierForMyHomes(void *a1, const char *a2, ...)
{
  return [a1 createGroupSpecifierForMyHomes];
}

id objc_msgSend_createGroupSpecifierForNoHomes(void *a1, const char *a2, ...)
{
  return [a1 createGroupSpecifierForNoHomes];
}

id objc_msgSend_createGroupSpecifierForResetButton(void *a1, const char *a2, ...)
{
  return [a1 createGroupSpecifierForResetButton];
}

id objc_msgSend_createGroupSpecifierForSharedHomes(void *a1, const char *a2, ...)
{
  return [a1 createGroupSpecifierForSharedHomes];
}

id objc_msgSend_createHomeEnergyPreferences(void *a1, const char *a2, ...)
{
  return [a1 createHomeEnergyPreferences];
}

id objc_msgSend_createHomeHubSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createHomeHubSpecifiers];
}

id objc_msgSend_createMyHomesSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createMyHomesSpecifiers];
}

id objc_msgSend_createSharedHomesSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createSharedHomesSpecifiers];
}

id objc_msgSend_createSpecifierForHomeHub(void *a1, const char *a2, ...)
{
  return [a1 createSpecifierForHomeHub];
}

id objc_msgSend_createSpecifierForHomeKitReset(void *a1, const char *a2, ...)
{
  return [a1 createSpecifierForHomeKitReset];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentImage(void *a1, const char *a2, ...)
{
  return [a1 currentImage];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detailController(void *a1, const char *a2, ...)
{
  return [a1 detailController];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_downloadControl(void *a1, const char *a2, ...)
{
  return [a1 downloadControl];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return [a1 home];
}

id objc_msgSend_homeBuilder(void *a1, const char *a2, ...)
{
  return [a1 homeBuilder];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return [a1 homeManager];
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return [a1 homes];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_installController(void *a1, const char *a2, ...)
{
  return [a1 installController];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAdministrator(void *a1, const char *a2, ...)
{
  return [a1 isAdministrator];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isResidentEnabledForThisDevice(void *a1, const char *a2, ...)
{
  return [a1 isResidentEnabledForThisDevice];
}

id objc_msgSend_isThisDeviceResidentCapable(void *a1, const char *a2, ...)
{
  return [a1 isThisDeviceResidentCapable];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
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

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_preferredFont(void *a1, const char *a2, ...)
{
  return [a1 preferredFont];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return [a1 sharedDispatcher];
}

id objc_msgSend_sharedHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedHandler];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateHomesSections(void *a1, const char *a2, ...)
{
  return [a1 updateHomesSections];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}