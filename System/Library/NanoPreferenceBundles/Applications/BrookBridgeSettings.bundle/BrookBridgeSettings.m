void sub_1EA8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = +[LSApplicationWorkspace defaultWorkspace];
  v2 = +[NSURL URLWithString:*(void *)(a1 + 32)];
  [v3 openSensitiveURL:v2 withOptions:0];
}

void sub_2238(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[BRKSettingsViewController _handleRemindersFooterHyperlinkTapped]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s: unexpected condition for reminders footer hyperlink tap", (uint8_t *)&v1, 0xCu);
}

void sub_22BC(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[BRKSettingsViewController _presentMeContactCard]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s: failed to look up Me contact card, cannot present contact view controller.", (uint8_t *)&v1, 0xCu);
}

uint64_t BRKLoggingObjectForDomain()
{
  return _BRKLoggingObjectForDomain();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__isDeviceSatellitePaired(void *a1, const char *a2, ...)
{
  return [a1 _isDeviceSatellitePaired];
}

id objc_msgSend__needsRemindersSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _needsRemindersSpecifiers];
}

id objc_msgSend__newRemindersSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _newRemindersSpecifiers];
}

id objc_msgSend__newSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _newSpecifiers];
}

id objc_msgSend__newTimerSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _newTimerSpecifiers];
}

id objc_msgSend__showDataCollectionOptInIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _showDataCollectionOptInIfNeeded];
}

id objc_msgSend__updateRemindersSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _updateRemindersSpecifiers];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_alertingMode(void *a1, const char *a2, ...)
{
  return [a1 alertingMode];
}

id objc_msgSend_areRemindersAvailable(void *a1, const char *a2, ...)
{
  return [a1 areRemindersAvailable];
}

id objc_msgSend_areRemindersEnabled(void *a1, const char *a2, ...)
{
  return [a1 areRemindersEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isCachedLocationAuthFlowEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCachedLocationAuthFlowEnabled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isLocationAuthorizationValid(void *a1, const char *a2, ...)
{
  return [a1 isLocationAuthorizationValid];
}

id objc_msgSend_isLocationAvailable(void *a1, const char *a2, ...)
{
  return [a1 isLocationAvailable];
}

id objc_msgSend_isMeCardAvailable(void *a1, const char *a2, ...)
{
  return [a1 isMeCardAvailable];
}

id objc_msgSend_isOnboardingComplete(void *a1, const char *a2, ...)
{
  return [a1 isOnboardingComplete];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_remindersFooterTextAndLinkString(void *a1, const char *a2, ...)
{
  return [a1 remindersFooterTextAndLinkString];
}

id objc_msgSend_remindersSettingTitle(void *a1, const char *a2, ...)
{
  return [a1 remindersSettingTitle];
}

id objc_msgSend_requestLocationAuthorizationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 requestLocationAuthorizationIfNeeded];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_timerSettingFooter(void *a1, const char *a2, ...)
{
  return [a1 timerSettingFooter];
}

id objc_msgSend_timerSettingTitle(void *a1, const char *a2, ...)
{
  return [a1 timerSettingTitle];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_viewControllerForNewContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForNewContact:");
}