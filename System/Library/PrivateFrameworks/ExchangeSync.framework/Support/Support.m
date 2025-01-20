uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  CFRunLoopRunResult v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  uint8_t v13[15];
  unsigned __int8 v14;

  v14 = 0;
  setESIsRunningInExchangeSyncD();
  +[DAPriorityManager vendPriorityManagers];
  v1 = +[ESDMain sharedMain];
  [v1 waitForSystemAvailability];
  v2 = +[ESDAccessManager sharedManager];
  [v1 setRunLoopStoppedRef:&v14];
  [v1 addToOperationsQueueDisabledCheckAndGoBlock:0 wrappedBlock:&stru_1000040D8];
  if ((+[DAEASOAuthMigrationActivity profileMigrationDisabled] & 1) == 0)
  {
    v3 = objc_alloc_init((Class)DAEASOAuthMigrationActivity);
    [v3 scheduleActivity];
  }
  v4 = +[DAPriorityManager sharedManager];
  v5 = DALoggingwithCategory();
  v6 = _CPLog_to_os_log_type[7];
  if (os_log_type_enabled(v5, v6))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Resuming high availability queue", v13, 2u);
  }

  dispatch_resume(gDADHighAvailabilityQueue);
  do
  {
    v8 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 86400.0, 1u);
    v9 = v14;
    v10 = v8 - 3;
    if (v9) {
      v11 = 1;
    }
    else {
      v11 = v10 >= 0xFFFFFFFE;
    }
  }
  while (!v11);
  return 0;
}

void sub_1000037AC(id a1)
{
  v1 = DALoggingwithCategory();
  os_log_type_t v2 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "exchangesyncd_main kicking off our agents - with license to kill", v4, 2u);
  }

  v3 = +[ESDAgentManager sharedManager];
  [v3 _loadAndStartExchangeMonitoringAgents];
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t DALoggingwithCategory()
{
  return _DALoggingwithCategory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t setESIsRunningInExchangeSyncD()
{
  return _setESIsRunningInExchangeSyncD();
}

id objc_msgSend__loadAndStartExchangeMonitoringAgents(void *a1, const char *a2, ...)
{
  return [a1 _loadAndStartExchangeMonitoringAgents];
}

id objc_msgSend_profileMigrationDisabled(void *a1, const char *a2, ...)
{
  return [a1 profileMigrationDisabled];
}

id objc_msgSend_scheduleActivity(void *a1, const char *a2, ...)
{
  return [a1 scheduleActivity];
}

id objc_msgSend_sharedMain(void *a1, const char *a2, ...)
{
  return [a1 sharedMain];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_vendPriorityManagers(void *a1, const char *a2, ...)
{
  return [a1 vendPriorityManagers];
}

id objc_msgSend_waitForSystemAvailability(void *a1, const char *a2, ...)
{
  return [a1 waitForSystemAvailability];
}