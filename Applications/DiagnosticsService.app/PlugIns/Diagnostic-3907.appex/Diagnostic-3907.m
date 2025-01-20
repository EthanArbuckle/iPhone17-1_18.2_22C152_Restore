id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    v3 = +[NSNull null];
  }
  v4 = v3;

  return v4;
}

id sub_100002BEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDeviceDocked];
}

id sub_100002BF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isHeadsetPluggedIn];
}

void sub_100003008(void *a1, NSObject *a2)
{
  v3 = [a1 inputs];
  v4 = [v3 identifier];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Test %@ is not found.", (uint8_t *)&v5, 0xCu);
}

void sub_1000030B8(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  v7 = [a2 portType];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Audio Out: %@", a1, 0xCu);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return [a1 currentRoute];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return [a1 modelNumbers];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}