id sub_5150()
{
  void *v0;
  uint64_t vars8;

  if (qword_CE78 != -1) {
    dispatch_once(&qword_CE78, &stru_8240);
  }
  v0 = (void *)qword_CE70;

  return v0;
}

void sub_56B8(id a1, CSLPRFMutableDepthAutoLaunchSettings *a2)
{
  v2 = a2;
  [(CSLPRFMutableDepthAutoLaunchSettings *)v2 setChangeSource:0];
  [(CSLPRFMutableDepthAutoLaunchSettings *)v2 setBundleID:@"com.apple.Depth"];
  [(CSLPRFMutableDepthAutoLaunchSettings *)v2 setAutoLaunchBehavior:1];
}

void sub_5798(id a1, CSLPRFMutableDepthAutoLaunchSettings *a2)
{
  v2 = a2;
  [(CSLPRFMutableDepthAutoLaunchSettings *)v2 setChangeSource:0];
  [(CSLPRFMutableDepthAutoLaunchSettings *)v2 setAutoLaunchBehavior:0];
}

void sub_5884(id a1)
{
  qword_CE70 = (uint64_t)os_log_create("com.apple.Depth", "setup");

  _objc_release_x1();
}

void sub_611C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "DepthSetupFirstController: Unable to retrieve the current device", v1, 2u);
}

uint64_t BPSPillButtonBackground()
{
  return _BPSPillButtonBackground();
}

uint64_t BPSPillDeselectedColor()
{
  return _BPSPillDeselectedColor();
}

uint64_t BPSPillSelectedColor()
{
  return _BPSPillSelectedColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return __HKGenerateDefaultUnitForQuantityType();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__addContinueButton(void *a1, const char *a2, ...)
{
  return [a1 _addContinueButton];
}

id objc_msgSend__learnMoreLink(void *a1, const char *a2, ...)
{
  return [a1 _learnMoreLink];
}

id objc_msgSend__unitString(void *a1, const char *a2, ...)
{
  return [a1 _unitString];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_autoLaunchSetting(void *a1, const char *a2, ...)
{
  return [a1 autoLaunchSetting];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailText(void *a1, const char *a2, ...)
{
  return [a1 detailText];
}

id objc_msgSend_deviceDepthLimit(void *a1, const char *a2, ...)
{
  return [a1 deviceDepthLimit];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_meterUnit(void *a1, const char *a2, ...)
{
  return [a1 meterUnit];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_okayButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 okayButtonTitle];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleString(void *a1, const char *a2, ...)
{
  return [a1 titleString];
}

id objc_msgSend_unitString(void *a1, const char *a2, ...)
{
  return [a1 unitString];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}