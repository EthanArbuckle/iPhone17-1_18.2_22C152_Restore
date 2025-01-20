void sub_100004DD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100004DF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100005B44(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Result %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"statusCode"];
  v6 = [*(id *)(a1 + 32) result];
  [v6 setStatusCode:v5];

  v7 = [v3 objectForKeyedSubscript:@"data"];
  v8 = [*(id *)(a1 + 32) result];
  [v8 setData:v7];

  [*(id *)(a1 + 40) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100005D10()
{
  sub_100004DEC();
  sub_100004DD0((void *)&_mh_execute_header, v0, v1, "updateProperties invalid", v2, v3, v4, v5, v6);
}

void sub_100005D44(id *a1, NSObject *a2)
{
  id v3 = [*a1 count];
  int v5 = 134217984;
  id v6 = v3;
  sub_100004DF8((void *)&_mh_execute_header, a2, v4, "partSPC count %lu", (uint8_t *)&v5);
}

void sub_100005DCC(void *a1, NSObject *a2)
{
  int v4 = 134217984;
  id v5 = [a1 length];
  sub_100004DF8((void *)&_mh_execute_header, a2, v3, "partSPC is too short, length = %lu", (uint8_t *)&v4);
}

void sub_100005E50()
{
  sub_100004DEC();
  sub_100004DD0((void *)&_mh_execute_header, v0, v1, "FDR Sealing URL is invalid", v2, v3, v4, v5, v6);
}

void sub_100005E84()
{
  sub_100004DEC();
  sub_100004DD0((void *)&_mh_execute_header, v0, v1, "FDR DS URL is invalid", v2, v3, v4, v5, v6);
}

void sub_100005EB8()
{
  sub_100004DEC();
  sub_100004DD0((void *)&_mh_execute_header, v0, v1, "FDR Trust Object URL is invalid", v2, v3, v4, v5, v6);
}

void sub_100005EEC()
{
  sub_100004DEC();
  sub_100004DD0((void *)&_mh_execute_header, v0, v1, "FDR CA URL is invalid", v2, v3, v4, v5, v6);
}

void sub_100005F20(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_100004DF8((void *)&_mh_execute_header, a2, a3, "Failed to match Property:%@", (uint8_t *)&v3);
}

void sub_100005F90(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  CFStringRef v4 = @"PrCL";
  sub_100004DF8((void *)&_mh_execute_header, a1, a3, "Property:%@ not a string", (uint8_t *)&v3);
}

void sub_10000600C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Not in diagnostics mode", v1, 2u);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_FDRCAURL(void *a1, const char *a2, ...)
{
  return [a1 FDRCAURL];
}

id objc_msgSend_FDRDSURL(void *a1, const char *a2, ...)
{
  return [a1 FDRDSURL];
}

id objc_msgSend_FDRSealingURL(void *a1, const char *a2, ...)
{
  return [a1 FDRSealingURL];
}

id objc_msgSend_KBBSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 KBBSerialNumber];
}

id objc_msgSend_KGBSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 KGBSerialNumber];
}

id objc_msgSend_SOCKSHost(void *a1, const char *a2, ...)
{
  return [a1 SOCKSHost];
}

id objc_msgSend_SOCKSPort(void *a1, const char *a2, ...)
{
  return [a1 SOCKSPort];
}

id objc_msgSend_allowSelfService(void *a1, const char *a2, ...)
{
  return [a1 allowSelfService];
}

id objc_msgSend_allowUsedPart(void *a1, const char *a2, ...)
{
  return [a1 allowUsedPart];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_displayMaxDuration(void *a1, const char *a2, ...)
{
  return [a1 displayMaxDuration];
}

id objc_msgSend_doSeal(void *a1, const char *a2, ...)
{
  return [a1 doSeal];
}

id objc_msgSend_enableProxy(void *a1, const char *a2, ...)
{
  return [a1 enableProxy];
}

id objc_msgSend_enableStagedSeal(void *a1, const char *a2, ...)
{
  return [a1 enableStagedSeal];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_ignoreStagedData(void *a1, const char *a2, ...)
{
  return [a1 ignoreStagedData];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keyBlob(void *a1, const char *a2, ...)
{
  return [a1 keyBlob];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_partSPC(void *a1, const char *a2, ...)
{
  return [a1 partSPC];
}

id objc_msgSend_patchItems(void *a1, const char *a2, ...)
{
  return [a1 patchItems];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_skipStageEAN(void *a1, const char *a2, ...)
{
  return [a1 skipStageEAN];
}

id objc_msgSend_timeoutPeriod(void *a1, const char *a2, ...)
{
  return [a1 timeoutPeriod];
}

id objc_msgSend_trustObjectURL(void *a1, const char *a2, ...)
{
  return [a1 trustObjectURL];
}

id objc_msgSend_updateProperties(void *a1, const char *a2, ...)
{
  return [a1 updateProperties];
}

id objc_msgSend_validateUpdateProperties_(void *a1, const char *a2, ...)
{
  return [a1 validateUpdateProperties:];
}