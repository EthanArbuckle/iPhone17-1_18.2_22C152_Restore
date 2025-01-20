void sub_2FC4(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  NSObject *v5;
  int v6;
  NSError *v7;

  v4 = a3;
  if (!a2)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "DMCAccountNotificationPlugin: Failed to update RM account with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t DMCLogObjects()
{
  return _DMCLogObjects();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inSharediPadUserSession(void *a1, const char *a2, ...)
{
  return [a1 inSharediPadUserSession];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}