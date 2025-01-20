uint64_t start()
{
  ServiceDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(ServiceDelegate);
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_1000038FC(void *a1, NSObject *a2)
{
  v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 processIdentifier]);
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client attempted to connect without access entitlement. pid:%@ connection:%@", (uint8_t *)&v5, 0x16u);
}

uint64_t BRLTLog()
{
  return _BRLTLog();
}

uint64_t BRLTSConnectionHasEntitlement()
{
  return _BRLTSConnectionHasEntitlement();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_auditSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 auditSessionIdentifier];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}