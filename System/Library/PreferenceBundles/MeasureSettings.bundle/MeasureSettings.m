uint64_t sub_2B80()
{
  void *v0;
  unsigned int v1;

  v0 = +[NSLocale currentLocale];
  v1 = [v0 usesMetricSystem];

  return v1;
}

uint64_t sub_2D88(uint64_t a1)
{
  qword_8420 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
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

void objc_enumerationMutation(id obj)
{
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

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cachedMeasureUnits(void *a1, const char *a2, ...)
{
  return [a1 cachedMeasureUnits];
}

id objc_msgSend_configureUnitsRadioSelector(void *a1, const char *a2, ...)
{
  return [a1 configureUnitsRadioSelector];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_getDefaultValues(void *a1, const char *a2, ...)
{
  return [a1 getDefaultValues];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_measureSettingsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 measureSettingsSpecifiers];
}

id objc_msgSend_measureUnits(void *a1, const char *a2, ...)
{
  return [a1 measureUnits];
}

id objc_msgSend_measureUnitsSpecifierID(void *a1, const char *a2, ...)
{
  return [a1 measureUnitsSpecifierID];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_setAppPolicy(void *a1, const char *a2, ...)
{
  return [a1 setAppPolicy];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_usesMetricSystem(void *a1, const char *a2, ...)
{
  return [a1 usesMetricSystem];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}