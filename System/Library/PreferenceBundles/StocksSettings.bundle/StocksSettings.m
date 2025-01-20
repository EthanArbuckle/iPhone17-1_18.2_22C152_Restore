id sub_2434(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  [*(id *)(a1 + 32) setPreferenceValue:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);

  return [v2 reload];
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

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return [a1 appPolicy];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_contentStoreFrontID(void *a1, const char *a2, ...)
{
  return [a1 contentStoreFrontID];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_isAustraliaStorefront(void *a1, const char *a2, ...)
{
  return [a1 isAustraliaStorefront];
}

id objc_msgSend_isCanadaStorefront(void *a1, const char *a2, ...)
{
  return [a1 isCanadaStorefront];
}

id objc_msgSend_isFrenchLanguage(void *a1, const char *a2, ...)
{
  return [a1 isFrenchLanguage];
}

id objc_msgSend_isNewsFreeExperienceDisabled(void *a1, const char *a2, ...)
{
  return [a1 isNewsFreeExperienceDisabled];
}

id objc_msgSend_isUnitedKingdomStorefront(void *a1, const char *a2, ...)
{
  return [a1 isUnitedKingdomStorefront];
}

id objc_msgSend_isUnitedStatesStorefront(void *a1, const char *a2, ...)
{
  return [a1 isUnitedStatesStorefront];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_makeBilingualFeedSpecifier(void *a1, const char *a2, ...)
{
  return [a1 makeBilingualFeedSpecifier];
}

id objc_msgSend_makeLanguageGroup(void *a1, const char *a2, ...)
{
  return [a1 makeLanguageGroup];
}

id objc_msgSend_makePrivacySpecifier(void *a1, const char *a2, ...)
{
  return [a1 makePrivacySpecifier];
}

id objc_msgSend_makeResetPrivacyIdentifierSpecifier(void *a1, const char *a2, ...)
{
  return [a1 makeResetPrivacyIdentifierSpecifier];
}

id objc_msgSend_makeSettingsGroup(void *a1, const char *a2, ...)
{
  return [a1 makeSettingsGroup];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return [a1 sharedAccount];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}