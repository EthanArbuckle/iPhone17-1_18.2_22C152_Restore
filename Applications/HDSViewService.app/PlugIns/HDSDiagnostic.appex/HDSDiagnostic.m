id sub_100002EE4()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000081D0 != -1) {
    dispatch_once(&qword_1000081D0, &stru_100004148);
  }
  v0 = (void *)qword_1000081C8;

  return v0;
}

void sub_1000034CC(id a1)
{
  qword_1000081C8 = (uint64_t)os_log_create("com.apple.HomeDeviceSetup", "iOS-DiagnosticExtension");

  _objc_release_x1();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_appGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appGroupIdentifier];
}

id objc_msgSend_attachmentList(void *a1, const char *a2, ...)
{
  return [a1 attachmentList];
}

id objc_msgSend_cleanupDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 cleanupDiagnostics];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_productionCacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 productionCacheDirectory];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}