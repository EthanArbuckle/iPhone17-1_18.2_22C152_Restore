uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _CFPreferencesManagementStatusChangedForDomains()
{
  return __CFPreferencesManagementStatusChangedForDomains();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return __CFPreferencesPostValuesChangedInDomains();
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return __CFPreferencesWriteManagedDomainForUser();
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

void objc_release(id a1)
{
}

id objc_msgSend__addDAManagedDefaults(void *a1, const char *a2, ...)
{
  return [a1 _addDAManagedDefaults];
}

id objc_msgSend__removeDAManagedDefaults(void *a1, const char *a2, ...)
{
  return [a1 _removeDAManagedDefaults];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}