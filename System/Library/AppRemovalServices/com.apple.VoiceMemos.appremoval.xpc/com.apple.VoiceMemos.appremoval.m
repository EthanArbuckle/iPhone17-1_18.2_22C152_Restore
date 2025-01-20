uint64_t start()
{
  void *v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

id sub_100002D8C()
{
  if (qword_1000087A8 != -1) {
    dispatch_once(&qword_1000087A8, &stru_100004138);
  }
  v0 = (void *)qword_1000087A0;
  return v0;
}

void sub_100002DE0(id a1)
{
  id v4 = +[RBSProcessIdentity identityOfCurrentProcess];
  id v1 = [v4 description];
  os_log_t v2 = os_log_create((const char *)[v1 UTF8String], "XPCAppRemovalService");
  v3 = (void *)qword_1000087A0;
  qword_1000087A0 = (uint64_t)v2;
}

void sub_1000030A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100002D8C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      sub_1000034F4((uint64_t)v3, v4, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (v5)
  {
    sub_1000034B0(v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003368(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003384(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000033F0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Removing voice recordings...", v1, 2u);
}

void sub_100003434(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000034B0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Completed AppRemoval Successfully.", v1, 2u);
}

void sub_1000034F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__deleteAllUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _deleteAllUserDefaults];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_identityOfCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 identityOfCurrentProcess];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}