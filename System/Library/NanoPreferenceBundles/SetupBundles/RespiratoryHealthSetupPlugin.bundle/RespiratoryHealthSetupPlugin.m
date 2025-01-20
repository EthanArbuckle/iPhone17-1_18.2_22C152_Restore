uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_cacheCompletedOnboardingStateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 cacheCompletedOnboardingStateIfNeeded];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_onboardingDuringPairingShouldAppear(void *a1, const char *a2, ...)
{
  return [a1 onboardingDuringPairingShouldAppear];
}

id objc_msgSend_standardSettings(void *a1, const char *a2, ...)
{
  return [a1 standardSettings];
}