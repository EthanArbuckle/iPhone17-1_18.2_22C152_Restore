void sub_2970(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_31D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PLIsNotificationTypeEnabledForKey()
{
  return _PLIsNotificationTypeEnabledForKey();
}

uint64_t PLLocalizedFrameworkString()
{
  return _PLLocalizedFrameworkString();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PXSharedLibraryShouldDisplaySettings()
{
  return _PXSharedLibraryShouldDisplaySettings();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibrary];
}

id objc_msgSend_systemPhotoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibraryURL];
}

id objc_msgSend_unregisterAvailabilityObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterAvailabilityObserver:");
}