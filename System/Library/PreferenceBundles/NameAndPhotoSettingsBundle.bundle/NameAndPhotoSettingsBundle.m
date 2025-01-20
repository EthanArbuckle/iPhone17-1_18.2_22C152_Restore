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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 groupSpecifier];
}

id objc_msgSend_isNicknameSharingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNicknameSharingEnabled];
}

id objc_msgSend_mainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSpecifier];
}

id objc_msgSend_nicknameProvider(void *a1, const char *a2, ...)
{
  return [a1 nicknameProvider];
}

id objc_msgSend_sharedNameAndPhotoSharingFooterText(void *a1, const char *a2, ...)
{
  return [a1 sharedNameAndPhotoSharingFooterText];
}

id objc_msgSend_sharingAudience(void *a1, const char *a2, ...)
{
  return [a1 sharingAudience];
}

id objc_msgSend_startOnboardingOrEditForMode_fromViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOnboardingOrEditForMode:fromViewController:");
}