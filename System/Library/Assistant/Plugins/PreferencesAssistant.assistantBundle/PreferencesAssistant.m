uint64_t sub_3AFC(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ([v1 isEqualToString:SASettingLocationPreferenceBundleValue])
  {
    v2 = 0;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_Location_ServicesValue])
  {
    v2 = 2;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_ContactsValue])
  {
    v2 = 3;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_CalendarValue])
  {
    v2 = 4;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_RemindersValue])
  {
    v2 = 5;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_PhotosValue])
  {
    v2 = 6;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_Bluetooth_SharingValue])
  {
    v2 = 7;
  }
  else if ([v1 isEqualToString:SASettingLocationNotificationsValue])
  {
    v2 = 1;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_MicrophoneValue])
  {
    v2 = 8;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_LiverpoolValue])
  {
    v2 = 10;
  }
  else if ([v1 isEqualToString:SASettingLocationPrivacy_CameraValue])
  {
    v2 = 12;
  }
  else
  {
    v2 = 11;
  }

  return v2;
}

__CFString *sub_3C84(unint64_t a1)
{
  if (a1 <= 0xC && ((0x1DFFu >> a1) & 1) != 0)
  {
    v2 = (__CFString *)*(id *)*(&off_10520 + a1);
  }
  else
  {
    v2 = @"UNKNOWN";
  }
  return v2;
}

void sub_4610(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(void **)(a1 + 32);
    [v4 _performWithCompletion:v3];
  }
  else
  {
    if (!*(void *)(v2 + 32))
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 32);
      *(void *)(v6 + 32) = v5;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    objc_initWeak(&location, (id)v2);
    v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_47E4;
    v14[3] = &unk_10590;
    objc_copyWeak(&v16, &location);
    id v15 = *(id *)(a1 + 40);
    v9 = objc_retainBlock(v14);
    [v8 addObject:v9];

    dispatch_time_t v10 = dispatch_time(0, 200000000);
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 24);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_4834;
    v13[3] = &unk_105B8;
    v13[4] = v11;
    dispatch_after(v10, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void sub_47C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_47E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performWithCompletion:*(void *)(a1 + 32)];
}

id sub_4834(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performQueuedRequests];
}

id sub_4AF4(uint64_t a1)
{
  uint64_t v2 = PALogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(*(void *)(a1 + 32) + 8) flashlightLevel];
    double v4 = v3;
    if ([*(id *)(*(void *)(a1 + 32) + 8) isAvailable]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 8) isOverheated];
    int v9 = 134218498;
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    double v10 = v4;
    __int16 v11 = 2112;
    CFStringRef v12 = v5;
    __int16 v13 = 2112;
    CFStringRef v14 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "########## PSSetTorch (flashlightLevel: %f / available: %@ / overheated: %@)", (uint8_t *)&v9, 0x20u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  return [*(id *)(a1 + 32) _performQueuedRequests];
}

void sub_5468(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    double v4 = *(void **)(a1 + 32);
    [v4 _performWithCompletion:v3];
  }
  else
  {
    if (!*(void *)(v2 + 32))
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(a1 + 32);
      CFStringRef v7 = *(void **)(v6 + 32);
      *(void *)(v6 + 32) = v5;

      uint64_t v2 = *(void *)(a1 + 32);
    }
    objc_initWeak(&location, (id)v2);
    v8 = *(void **)(*(void *)(a1 + 32) + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_563C;
    v14[3] = &unk_10590;
    objc_copyWeak(&v16, &location);
    id v15 = *(id *)(a1 + 40);
    int v9 = objc_retainBlock(v14);
    [v8 addObject:v9];

    dispatch_time_t v10 = dispatch_time(0, 200000000);
    uint64_t v11 = *(void *)(a1 + 32);
    CFStringRef v12 = *(NSObject **)(v11 + 24);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_568C;
    v13[3] = &unk_105B8;
    v13[4] = v11;
    dispatch_after(v10, v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void sub_5620(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_563C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performWithCompletion:*(void *)(a1 + 32)];
}

id sub_568C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performQueuedRequests];
}

id sub_5C34(uint64_t a1)
{
  uint64_t v2 = PALogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(*(void *)(a1 + 32) + 8) flashlightLevel];
    double v4 = v3;
    if ([*(id *)(*(void *)(a1 + 32) + 8) isAvailable]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 8) isOverheated];
    int v9 = 134218498;
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    double v10 = v4;
    __int16 v11 = 2112;
    CFStringRef v12 = v5;
    __int16 v13 = 2112;
    CFStringRef v14 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "########## PSSetTorch (flashlightLevel: %f / available: %@ / overheated: %@)", (uint8_t *)&v9, 0x20u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  return [*(id *)(a1 + 32) _performQueuedRequests];
}

BOOL sub_6234(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 effectiveBoolValueForSetting:v1];

  return v3 == 1;
}

uint64_t sub_6298(void *a1)
{
  id v1 = a1;
  CFStringRef v28 = @"still-camera";
  v29[0] = MCFeatureCameraAllowed;
  uint64_t v2 = 1;
  unsigned int v3 = +[NSArray arrayWithObjects:&v28 count:1];
  v30[0] = v3;
  v29[1] = MCFeatureVideoConferencingAllowed;
  v27[0] = @"still-camera";
  v27[1] = @"venice";
  double v4 = +[NSArray arrayWithObjects:v27 count:2];
  v30[1] = v4;
  v29[2] = MCFeatureAssistantAllowed;
  CFStringRef v26 = @"assistant";
  CFStringRef v5 = +[NSArray arrayWithObjects:&v26 count:1];
  v30[2] = v5;
  v29[3] = off_1A068;
  CFStringRef v25 = @"CellularTelephonyCapability";
  unsigned int v6 = +[NSArray arrayWithObjects:&v25 count:1];
  v30[3] = v6;
  v29[4] = off_1A070;
  CFStringRef v24 = @"wifi";
  CFStringRef v7 = +[NSArray arrayWithObjects:&v24 count:1];
  v30[4] = v7;
  v29[5] = off_1A078;
  CFStringRef v23 = @"bluetooth";
  v8 = +[NSArray arrayWithObjects:&v23 count:1];
  v30[5] = v8;
  int v9 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];

  [v9 objectForKey:v1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v11 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    CFStringRef v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)MGCopyAnswer();
        unsigned int v16 = objc_msgSend(v15, "BOOLValue", v18);

        if (!v16)
        {
          uint64_t v2 = 0;
          goto LABEL_11;
        }
      }
      CFStringRef v12 = (char *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    uint64_t v2 = 1;
  }
LABEL_11:

  return v2;
}

id PALogForCategory(uint64_t a1)
{
  if (a1) {
    sub_C194();
  }
  if (qword_1A088 != -1) {
    dispatch_once(&qword_1A088, &stru_10620);
  }
  id v1 = (void *)qword_1A080;

  return v1;
}

void sub_9268(id a1)
{
  qword_1A080 = (uint64_t)os_log_create("com.apple.SettingsAndCoreApps.PreferencesAssistant", "Base");

  _objc_release_x1();
}

void sub_A5AC(uint64_t a1)
{
  unsigned int v2 = +[PSBluetoothSettingsDetail isEnabled];
  if ([*(id *)(a1 + 32) toggle]) {
    unsigned __int8 v3 = v2 ^ 1;
  }
  else {
    unsigned __int8 v3 = [*(id *)(a1 + 32) value];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = v3;
  double v4 = PALogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 17);
    int v18 = 136315650;
    long long v19 = "-[PreferencesAssistantSetBluetooth performWithCompletion:]_block_invoke";
    __int16 v20 = 1024;
    unsigned int v21 = v2;
    __int16 v22 = 1024;
    int v23 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "######## %s - previousValue: %d; targetEnabled: %d",
      (uint8_t *)&v18,
      0x18u);
  }

  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 17) == v2)
  {
    id v6 = objc_alloc_init((Class)SACommandFailed);
    [v6 setErrorCode:SASettingValueUnchangedErrorCode];
    [v6 setReason:@"Value unchanged, No change was made"];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = [v6 dictionary];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    return;
  }
  id v9 = [*(id *)(a1 + 40) copy];
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v9;

  if ([*(id *)(a1 + 32) dryRun])
  {
    CFStringRef v12 = PALogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      long long v19 = "-[PreferencesAssistantSetBluetooth performWithCompletion:]_block_invoke";
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "######## %s - dry run! we're done.", (uint8_t *)&v18, 0xCu);
    }
LABEL_15:

    [*(id *)(a1 + 32) _finish];
    return;
  }
  uint64_t v13 = +[BluetoothManager sharedInstance];
  unsigned int v14 = [v13 available];

  id v15 = PALogForCategory(0);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      unsigned int v17 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 17);
      int v18 = 136315394;
      long long v19 = "-[PreferencesAssistantSetBluetooth performWithCompletion:]_block_invoke";
      __int16 v20 = 1024;
      unsigned int v21 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "######## %s - BT is already available. Setting it to %d", (uint8_t *)&v18, 0x12u);
    }

    CFStringRef v12 = +[BluetoothManager sharedInstance];
    [v12 setEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 17)];
    goto LABEL_15;
  }
  if (v16)
  {
    int v18 = 136315138;
    long long v19 = "-[PreferencesAssistantSetBluetooth performWithCompletion:]_block_invoke";
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "######## %s - BT is not available. Waiting.", (uint8_t *)&v18, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
}

void sub_C194()
{
}

uint64_t AFGetFlashlightLevel()
{
  return _AFGetFlashlightLevel();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PSPreferencesLaunchURL()
{
  return _PSPreferencesLaunchURL();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return _TCCAccessCopyInformationForBundle();
}

uint64_t TCCAccessSetForBundle()
{
  return _TCCAccessSetForBundle();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return _UISUserInterfaceStyleModeValueIsAutomatic();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__finish(void *a1, const char *a2, ...)
{
  return [a1 _finish];
}

id objc_msgSend__performQueuedRequests(void *a1, const char *a2, ...)
{
  return [a1 _performQueuedRequests];
}

id objc_msgSend_appWithSettingsId(void *a1, const char *a2, ...)
{
  return [a1 appWithSettingsId];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_autoBrightnessEnabled(void *a1, const char *a2, ...)
{
  return [a1 autoBrightnessEnabled];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_beginBrightnessAdjustmentTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginBrightnessAdjustmentTransaction];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_carPlayAppearanceStyle(void *a1, const char *a2, ...)
{
  return [a1 carPlayAppearanceStyle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_currentValue(void *a1, const char *a2, ...)
{
  return [a1 currentValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceSupportsAutoBrightness(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsAutoBrightness];
}

id objc_msgSend_deviceSupportsCellularData(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsCellularData];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didShowOnboarding(void *a1, const char *a2, ...)
{
  return [a1 didShowOnboarding];
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return [a1 dryRun];
}

id objc_msgSend_endBrightnessAdjustmentTransaction(void *a1, const char *a2, ...)
{
  return [a1 endBrightnessAdjustmentTransaction];
}

id objc_msgSend_enterGuidedAccessMode(void *a1, const char *a2, ...)
{
  return [a1 enterGuidedAccessMode];
}

id objc_msgSend_failOnSiriDisconnectWarnings(void *a1, const char *a2, ...)
{
  return [a1 failOnSiriDisconnectWarnings];
}

id objc_msgSend_flashlightLevel(void *a1, const char *a2, ...)
{
  return [a1 flashlightLevel];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_guidedAccessAvailability(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessAvailability];
}

id objc_msgSend_hasFlashlight(void *a1, const char *a2, ...)
{
  return [a1 hasFlashlight];
}

id objc_msgSend_iOSAppearanceStyle(void *a1, const char *a2, ...)
{
  return [a1 iOSAppearanceStyle];
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return [a1 increment];
}

id objc_msgSend_initAndWaitUntilSessionUpdated(void *a1, const char *a2, ...)
{
  return [a1 initAndWaitUntilSessionUpdated];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 interfaceStyle];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isLowPowerModeSupported(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeSupported];
}

id objc_msgSend_isOverheated(void *a1, const char *a2, ...)
{
  return [a1 isOverheated];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_modeValue(void *a1, const char *a2, ...)
{
  return [a1 modeValue];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_override(void *a1, const char *a2, ...)
{
  return [a1 override];
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return [a1 preferencesURL];
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

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return [a1 toggle];
}

id objc_msgSend_turnPowerOff(void *a1, const char *a2, ...)
{
  return [a1 turnPowerOff];
}

id objc_msgSend_userConfirmed(void *a1, const char *a2, ...)
{
  return [a1 userConfirmed];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}