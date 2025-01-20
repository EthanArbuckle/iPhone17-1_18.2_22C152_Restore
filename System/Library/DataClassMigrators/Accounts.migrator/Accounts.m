void sub_21B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;

  v5 = a3;
  v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[NSNumber numberWithBool:a2];
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "\"Remove success %@ error %@\"", (uint8_t *)&v8, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_28D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if (objc_msgSend(v11, "type", (void)v13) == (char *)&dword_0 + 3) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (!v12) {
      goto LABEL_12;
    }
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v5];
  }
  else
  {
LABEL_9:

LABEL_12:
    v12 = _ACLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2F5C((uint64_t)v5, a1, v12);
    }
  }
}

void sub_2A44(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = +[NSNumber numberWithBool:a2];
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "\"Did remove obsolete account %@ with success %@ error %@\"", (uint8_t *)&v9, 0x20u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_2C40(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2DC8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "\"Ran account migration plugins, success: %@ error: %@\"", (uint8_t *)&v8, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2EC4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2EE4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_2EC4(&dword_0, a2, a3, "\"Couldn't remove file at %@: %@\"", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_2F5C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 40);
  sub_2EC4(&dword_0, a2, a3, "\"Could not find acceptable action for dataclass %@ for removal of account %@. Probably orphaning data.\"", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_2FD8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "\"Timed scheduling backup\"", v1, 2u);
}

void sub_301C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "\"Timed out running account migration plugins\"", v1, 2u);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return _CPCopySharedResourcesPreferencesDomainForDomain();
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__migrateOutdatedKeychainItems(void *a1, const char *a2, ...)
{
  return [a1 _migrateOutdatedKeychainItems];
}

id objc_msgSend__oldAccountsPlistPath(void *a1, const char *a2, ...)
{
  return [a1 _oldAccountsPlistPath];
}

id objc_msgSend__removeAccountsPlist(void *a1, const char *a2, ...)
{
  return [a1 _removeAccountsPlist];
}

id objc_msgSend__removeMultipleTencentWeiboAccounts(void *a1, const char *a2, ...)
{
  return [a1 _removeMultipleTencentWeiboAccounts];
}

id objc_msgSend__runAccountMigrationPlugins(void *a1, const char *a2, ...)
{
  return [a1 _runAccountMigrationPlugins];
}

id objc_msgSend__scheduleBackupIfNonexistent(void *a1, const char *a2, ...)
{
  return [a1 _scheduleBackupIfNonexistent];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_writeMigrationVersionPrefForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMigrationVersionPrefForKey:");
}