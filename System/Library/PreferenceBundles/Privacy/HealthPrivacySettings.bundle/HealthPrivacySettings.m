uint64_t sub_3744(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  uint64_t v5;

  v3 = a2;
  if ([v3 isAppleAudioDevice]) {
    v4 = 1;
  }
  else {
    v4 = [*(id *)(a1 + 32) containsObject:v3];
  }
  v5 = v4 ^ (*(unsigned char *)(a1 + 40) != 0);

  return v5;
}

void sub_4198(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = HKLogWellnessDashboard;
  if (os_log_type_enabled(HKLogWellnessDashboard, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Presenting privacy splash", v4, 2u);
  }
  v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.healthapp"];
  [v3 setPresentingViewController:*(void *)(a1 + 32)];
  [v3 present];
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return _HKUIJoinStringsForAutomationIdentifier();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return [a1 _setupConstraints];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_footerConfiguration(void *a1, const char *a2, ...)
{
  return [a1 footerConfiguration];
}

id objc_msgSend_footerTextView(void *a1, const char *a2, ...)
{
  return [a1 footerTextView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleAudioDevice];
}

id objc_msgSend_measureLevelsFooterText(void *a1, const char *a2, ...)
{
  return [a1 measureLevelsFooterText];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_otherHeadphonesFooterText(void *a1, const char *a2, ...)
{
  return [a1 otherHeadphonesFooterText];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairedNonAppleHAEDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedNonAppleHAEDevices];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_tableSections(void *a1, const char *a2, ...)
{
  return [a1 tableSections];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}