os_log_t sub_28B4()
{
  os_log_t v0;
  uint64_t vars8;

  v0 = os_log_create("com.apple.amp.medialibrary.migrator", "Migration");

  return v0;
}

void sub_30DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    v12 = sub_28B4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)(v10 - 128) = 138543362;
      *(void *)(v10 - 124) = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "[Migrator] !!! Exception while trying to migrate library. %{public}@", (uint8_t *)(v10 - 128), 0xCu);
    }

    *(unsigned char *)(a10 + 24) = 0;
    objc_end_catch();
    JUMPOUT(0x30A0);
  }
  _Unwind_Resume(a1);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return _MSVDeviceOSIsInternalInstall();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allLibraries(void *a1, const char *a2, ...)
{
  return [a1 allLibraries];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDatabaseVersion(void *a1, const char *a2, ...)
{
  return [a1 currentDatabaseVersion];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceSupportsMultipleLibraries(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsMultipleLibraries];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_mediaFolderPath(void *a1, const char *a2, ...)
{
  return [a1 mediaFolderPath];
}

id objc_msgSend_sharedCoordinator(void *a1, const char *a2, ...)
{
  return [a1 sharedCoordinator];
}

id objc_msgSend_sharedMediaLibraryService(void *a1, const char *a2, ...)
{
  return [a1 sharedMediaLibraryService];
}

id objc_msgSend_validateDatabase(void *a1, const char *a2, ...)
{
  return [a1 validateDatabase];
}

id objc_msgSend_valueForDatabaseProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForDatabaseProperty:");
}