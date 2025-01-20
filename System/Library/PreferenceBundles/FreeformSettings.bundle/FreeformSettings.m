id CRLAppBundleIdentifier()
{
  void *v0;
  uint64_t vars8;

  if (CRLAppBundleIdentifier_onceToken != -1) {
    dispatch_once(&CRLAppBundleIdentifier_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)CRLAppBundleIdentifier_identifier;

  return v0;
}

id CRLAppGroupIdentifier()
{
  if (CRLAppGroupIdentifier_onceToken != -1) {
    dispatch_once(&CRLAppGroupIdentifier_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)CRLAppGroupIdentifier_identifier;

  return v0;
}

void __CRLAppBundleIdentifier_block_invoke_cold_1()
{
}

void __CRLAppGroupIdentifier_block_invoke_cold_1()
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultDefaults(void *a1, const char *a2, ...)
{
  return [a1 defaultDefaults];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_usesMetricSystem(void *a1, const char *a2, ...)
{
  return [a1 usesMetricSystem];
}