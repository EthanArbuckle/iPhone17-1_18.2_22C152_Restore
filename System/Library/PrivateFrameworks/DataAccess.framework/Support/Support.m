uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  CFRunLoopRunResult v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  unsigned __int8 v10;

  v10 = 0;
  setDAIsRunningInDataAccessD();
  +[DAPowerAssertionManager vendDaemons:objc_opt_class()];
  +[DAPriorityManager vendPriorityManagers];
  +[DADConnection setShouldIgnoreAccountChanges];
  v1 = +[DADMain sharedMain];
  [v1 waitForSystemAvailability];
  v2 = +[DADAccessManager sharedManager];
  [v1 setRunLoopStoppedRef:&v10];
  [v1 addToOperationsQueueDisabledCheckAndGoBlock:0 wrappedBlock:&stru_1000040E0];
  v3 = +[DAPriorityManager sharedManager];
  dispatch_resume(gDADHighAvailabilityQueue);

  do
  {
    v5 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 86400.0, 1u);
    v6 = v10;
    v7 = v5 - 3;
    if (v6) {
      v8 = 1;
    }
    else {
      v8 = v7 >= 0xFFFFFFFE;
    }
  }
  while (!v8);
  return 0;
}

void sub_10000377C(id a1)
{
  v1 = DALoggingwithCategory();
  os_log_type_t v2 = _CPLog_to_os_log_type[6];
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "dataaccessd_main kicking off our agents - with licencse to kill", v4, 2u);
  }

  v3 = +[DADAgentManager sharedManager];
  [v3 _loadAndStartMonitoringAgents];
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

{
}

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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t setDAIsRunningInDataAccessD()
{
  return _setDAIsRunningInDataAccessD();
}

id objc_msgSend__loadAndStartMonitoringAgents(void *a1, const char *a2, ...)
{
  return [a1 _loadAndStartMonitoringAgents];
}

id objc_msgSend_setShouldIgnoreAccountChanges(void *a1, const char *a2, ...)
{
  return [a1 setShouldIgnoreAccountChanges];
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