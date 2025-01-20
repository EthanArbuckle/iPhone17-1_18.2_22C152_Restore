void sub_2620(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t vars8;

  v6 = a3;
  kdebug_trace();
  v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void sub_2950(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Error saving account: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2D20(uint64_t a1)
{
  id v2 = +[FMDFMIPManager sharedInstance];
  [v2 didReceiveLostModeExitAuthToken:*(void *)(a1 + 32)];
}

void sub_2D78(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Error saving account: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return [a1 _accountStore];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_fmipLostModeToken(void *a1, const char *a2, ...)
{
  return [a1 fmipLostModeToken];
}

id objc_msgSend_iCloudAuthToken(void *a1, const char *a2, ...)
{
  return [a1 iCloudAuthToken];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_needsLostModeExitAuth(void *a1, const char *a2, ...)
{
  return [a1 needsLostModeExitAuth];
}

id objc_msgSend_personID(void *a1, const char *a2, ...)
{
  return [a1 personID];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}