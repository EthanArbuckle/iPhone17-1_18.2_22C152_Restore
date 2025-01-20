void sub_3A90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Handling notification: %@", (uint8_t *)&v14, 0xCu);
  }
  if (v6)
  {
    v8 = [v5 request];
    v9 = [v8 content];
    v10 = [v9 categoryIdentifier];
    v11 = [v10 isEqualToString:WFDialogNotificationCategoryIdentifier];

    if (v11)
    {
      v12 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Suppressed dialog notification from forwarding to watch: %@", (uint8_t *)&v14, 0xCu);
      }
      v6[2](v6, 0);
    }
    else
    {
      v6[2](v6, 1);
    }
  }
  else
  {
    v13 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "ack handler is nil, returning", (uint8_t *)&v14, 2u);
    }
  }
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_subscribeToSectionID_withNotificationAckForwardForAnyConnectionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeToSectionID:withNotificationAckForwardForAnyConnectionHandler:");
}