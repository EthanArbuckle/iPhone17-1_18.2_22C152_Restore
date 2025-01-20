id sub_2DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t vars8;

  v10 = *(void *)(a1 + 32);
  v11 = a6;
  v12 = a5;
  v13 = +[PSSpecifier preferenceSpecifierNamed:a2 target:v10 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:a4 cell:a3 edit:0];
  [v13 setObject:v12 forKeyedSubscript:PSKeyNameKey];

  [v13 setObject:v11 forKeyedSubscript:PSDefaultValueKey];
  [v13 setObject:RCVoiceMemosBundleID forKeyedSubscript:PSDefaultsKey];

  return v13;
}

uint64_t RCLocalizedFrameworkString()
{
  return _RCLocalizedFrameworkString();
}

uint64_t RCStereoRecordingIsAvailable()
{
  return _RCStereoRecordingIsAvailable();
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

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return [a1 appPolicy];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}