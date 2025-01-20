void sub_100001AE4(id a1, unint64_t a2, NSError *a3)
{
  NSError *v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100002B48((uint64_t)v3, v4);
    }
  }
}

void sub_100002ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100002D68((uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100002B48(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to install: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002BC0(void *a1, void *a2, NSObject *a3)
{
  v5 = [a1 userInfo];
  id v6 = [v5 valueForKey:@"ServerURL"];
  id v7 = [v6 UTF8String];
  id v8 = [a2 description];
  int v9 = 136315394;
  id v10 = v7;
  __int16 v11 = 2080;
  id v12 = [v8 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Completed opening URL (%s) - Error: (%s)", (uint8_t *)&v9, 0x16u);
}

void sub_100002CB8(void *a1, uint64_t a2, NSObject *a3)
{
  v5 = [a1 identifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Extension processed unexpected action %@ for item %@", (uint8_t *)&v6, 0x16u);
}

void sub_100002D68(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "launch SIMSetup failed - %@", (uint8_t *)&v2, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _FLLogSystem()
{
  return __FLLogSystem();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wifiCallingCTFollowUpComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiCallingCTFollowUpComplete:");
}