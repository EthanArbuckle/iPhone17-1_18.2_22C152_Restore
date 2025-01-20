void sub_1A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _wiFiStateChangedWithOldState:a2 newState:a3];
}

id sub_20B8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
  return [*(id *)(a1 + 32) _setSettingFromExternalChangeIfNeeded];
}

id ACSettingsLocalizedString(void *a1)
{
  return ACSettingsLocalizedStringWithTable(a1, 0);
}

id ACSettingsLocalizedStringWithTable(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.assistant.Settings"];
  v6 = [v5 assistantUILocalizedStringForKey:v4 table:v3];

  return v6;
}

void sub_372C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_47E0()
{
  sub_3748();
  sub_372C(&dword_0, v0, v1, "%s Failed to add self as a DNDStateUpdateListener: %@", v2, v3, v4, v5, 2u);
}

void sub_4854()
{
  sub_3748();
  sub_372C(&dword_0, v0, v1, "%s Failed to turn on DND: %@", v2, v3, v4, v5, 2u);
}

void sub_48C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_494C()
{
  sub_3748();
  sub_372C(&dword_0, v0, v1, "%s Failed to query DND state: %@", v2, v3, v4, v5, 2u);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t SiriUIInvokeOnMainQueue()
{
  return _SiriUIInvokeOnMainQueue();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_release(id a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__setSettingFromSwitchTapIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setSettingFromSwitchTapIfNeeded];
}

id objc_msgSend__waitingOnSettingState(void *a1, const char *a2, ...)
{
  return [a1 _waitingOnSettingState];
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

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceSupportsCellularData(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsCellularData];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_endBrightnessAdjustmentTransaction(void *a1, const char *a2, ...)
{
  return [a1 endBrightnessAdjustmentTransaction];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return [a1 firstItem];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return [a1 increment];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isBluetooth(void *a1, const char *a2, ...)
{
  return [a1 isBluetooth];
}

id objc_msgSend_isLowPowerMode(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerMode];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return [a1 isTracking];
}

id objc_msgSend_isVirgin(void *a1, const char *a2, ...)
{
  return [a1 isVirgin];
}

id objc_msgSend_isWiFi(void *a1, const char *a2, ...)
{
  return [a1 isWiFi];
}

id objc_msgSend_labelWithBodyFont(void *a1, const char *a2, ...)
{
  return [a1 labelWithBodyFont];
}

id objc_msgSend_leftImage(void *a1, const char *a2, ...)
{
  return [a1 leftImage];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return [a1 preferencesURL];
}

id objc_msgSend_rightImage(void *a1, const char *a2, ...)
{
  return [a1 rightImage];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return [a1 secondItem];
}

id objc_msgSend_setting(void *a1, const char *a2, ...)
{
  return [a1 setting];
}

id objc_msgSend_settingKeys(void *a1, const char *a2, ...)
{
  return [a1 settingKeys];
}

id objc_msgSend_settingsDetailClass(void *a1, const char *a2, ...)
{
  return [a1 settingsDetailClass];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return [a1 slider];
}

id objc_msgSend_snippetViewController(void *a1, const char *a2, ...)
{
  return [a1 snippetViewController];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_switchControl(void *a1, const char *a2, ...)
{
  return [a1 switchControl];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return [a1 toggle];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}