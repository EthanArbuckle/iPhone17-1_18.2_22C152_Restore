void sub_2FAC(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 takeScreenshot];

  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_344C(v3);
  }
}

void sub_3168(uint64_t a1)
{
  v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateHomeButton];

  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_34D4(v3);
  }
}

void sub_3324(uint64_t a1)
{
  v2 = +[AXPISystemActionHelper sharedInstance];
  [v2 activateLockButton];

  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_355C(v3);
  }
}

void sub_3380(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCRebootDevice performWithCompletion | Submitted shutdown command", v1, 2u);
}

void sub_33C4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCRebootDevice performWithCompletion | Executing DCRebootDevice", v1, 2u);
}

void sub_3408(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCTakeScreenshot performWithCompletion | Executing DCTakeScreenshot", v1, 2u);
}

void sub_344C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCTakeScreenshot performWithCompletion | Submitted screenshot command", v1, 2u);
}

void sub_3490(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCShowHomeScreen performWithCompletion | Executing DCShowHomeScreen", v1, 2u);
}

void sub_34D4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCShowHomeScreen performWithCompletion | Submitted home command", v1, 2u);
}

void sub_3518(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCLockDevice performWithCompletion | Executing DCLockDevice", v1, 2u);
}

void sub_355C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "DCLockDevice performWithCompletion | Submitted lock command", v1, 2u);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activateHomeButton(void *a1, const char *a2, ...)
{
  return [a1 activateHomeButton];
}

id objc_msgSend_activateLockButton(void *a1, const char *a2, ...)
{
  return [a1 activateLockButton];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_isShutdownOnly(void *a1, const char *a2, ...)
{
  return [a1 isShutdownOnly];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_takeScreenshot(void *a1, const char *a2, ...)
{
  return [a1 takeScreenshot];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}