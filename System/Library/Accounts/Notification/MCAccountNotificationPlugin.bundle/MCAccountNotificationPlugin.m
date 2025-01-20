void sub_3460(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;

  v4 = [a1 username];
  v5 = [a1 accountType];
  v6 = [v5 accountTypeDescription];
  v7 = [a1 identifier];
  v8 = 138412802;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "\"MCUserEnrollmentAccountNotificationPlugin: account(%@, %@, %@) doesn'thave a persona ID.\"", (uint8_t *)&v8, 0x20u);
}

void sub_3558(uint64_t a1, void *a2, NSObject *a3)
{
  v6 = [a2 username];
  v7 = [a2 accountType];
  v8 = [v7 accountTypeDescription];
  v9 = [a2 identifier];
  int v10 = 138413058;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  v13 = v6;
  __int16 v14 = 2112;
  v15 = v8;
  __int16 v16 = 2112;
  v17 = v9;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "\"MCUserEnrollmentAccountNotificationPlugin: persona with identifier: %@ exists for account(%@, %@, %@)\"", (uint8_t *)&v10, 0x2Au);
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 accountTypeDescription];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}