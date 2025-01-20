void sub_3938(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void (**v5)(id, uint64_t);
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;

  v4 = a2;
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)HKLogNotifications;
  if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v23 = 138543618;
    v24 = (id)objc_opt_class();
    v25 = 2112;
    v26 = v4;
    v8 = v24;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] received notification: %@", (uint8_t *)&v23, 0x16u);
  }
  if (v5)
  {
    v9 = [v4 request];
    v10 = [v9 content];
    v11 = [v10 userInfo];
    v12 = kHKNotificationsSuppressNotificationForwardingKey;
    v13 = [v11 objectForKeyedSubscript:kHKNotificationsSuppressNotificationForwardingKey];
    v14 = [v13 isEqual:&__kCFBooleanTrue];

    if (v14)
    {
      _HKInitializeLogging();
      v15 = (void *)HKLogNotifications;
      if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = objc_opt_class();
        v18 = v17;
        v19 = [v4 request];
        v20 = [v19 content];
        v21 = [v20 categoryIdentifier];
        v23 = 138543874;
        v24 = v17;
        v25 = 2114;
        v26 = v21;
        v27 = 2114;
        v28 = v12;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification with identifier %{public}@ has key %{public}@, suppressing forwarding to watch", (uint8_t *)&v23, 0x20u);
      }
      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    v5[2](v5, v22);
  }
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}