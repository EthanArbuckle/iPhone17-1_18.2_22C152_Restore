uint64_t HKHRSubmitNotificationsEnabledSignal()
{
  return _HKHRSubmitNotificationsEnabledSignal();
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

id objc_msgSend__resetHeartRateNotificationSettings(void *a1, const char *a2, ...)
{
  return [a1 _resetHeartRateNotificationSettings];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_isChildAccount(void *a1, const char *a2, ...)
{
  return [a1 isChildAccount];
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 isMovingFromParentViewController];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_tinkerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 tinkerModeEnabled];
}