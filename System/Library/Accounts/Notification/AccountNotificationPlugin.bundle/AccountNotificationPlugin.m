void sub_3168(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "FAAccountNotificationPlugin: Error from service - %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_3350(id a1, NSNumber *a2, NSError *a3)
{
  v4 = a3;
  unsigned int v5 = [(NSNumber *)a2 BOOLValue];
  v6 = _FALogSystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[FAAccountNotificationPlugin _enableScreentimeForAccount:]_block_invoke";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: screentime all setup", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_3484((uint64_t)v4, v7);
  }
}

void sub_3440(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Account changed notification received with no account info.", v1, 2u);
}

void sub_3484(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  v3 = "-[FAAccountNotificationPlugin _enableScreentimeForAccount:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s: Error Setting up Screentime: %@", (uint8_t *)&v2, 0x16u);
}

uint64_t _FALogSystem()
{
  return __FALogSystem();
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

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_startRequestWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRequestWithCompletionHandler:");
}