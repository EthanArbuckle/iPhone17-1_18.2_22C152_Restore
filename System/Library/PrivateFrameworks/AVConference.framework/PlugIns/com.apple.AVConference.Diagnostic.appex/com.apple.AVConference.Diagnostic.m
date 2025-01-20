uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_attachmentList(void *a1, const char *a2, ...)
{
  return [a1 attachmentList];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copyDumps(void *a1, const char *a2, ...)
{
  return [a1 copyDumps];
}

id objc_msgSend_copyRTCReporting(void *a1, const char *a2, ...)
{
  return [a1 copyRTCReporting];
}

id objc_msgSend_copySpindumps(void *a1, const char *a2, ...)
{
  return [a1 copySpindumps];
}

id objc_msgSend_copyStackshotsAndCrashes(void *a1, const char *a2, ...)
{
  return [a1 copyStackshotsAndCrashes];
}

id objc_msgSend_defaultAVConferenceCachePath(void *a1, const char *a2, ...)
{
  return [a1 defaultAVConferenceCachePath];
}

id objc_msgSend_defaultCrashReportPath(void *a1, const char *a2, ...)
{
  return [a1 defaultCrashReportPath];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRTCReportingPath(void *a1, const char *a2, ...)
{
  return [a1 defaultRTCReportingPath];
}

id objc_msgSend_defaultSpindumpPath(void *a1, const char *a2, ...)
{
  return [a1 defaultSpindumpPath];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}