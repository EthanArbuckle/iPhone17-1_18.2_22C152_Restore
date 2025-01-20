id _DKLogSystem()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008130 != -1) {
    dispatch_once(&qword_100008130, &stru_100004108);
  }
  v0 = (void *)qword_100008128;
  return v0;
}

void sub_100003890(id a1)
{
  qword_100008128 = (uint64_t)os_log_create("com.apple.disembarkui", "general");
  _objc_release_x1();
}

uint64_t _DKIsInternalInstall()
{
  return _os_variant_has_internal_ui("com.apple.disembarkui");
}

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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_msgSend_clearFollowUp(void *a1, const char *a2, ...)
{
  return [a1 clearFollowUp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}