uint64_t start()
{
  void *v0;
  void *v1;
  NSObject *v2;
  SubmissionController *v3;
  id v4;
  SubmissionController *v5;
  void *v6;
  void handler[4];
  SubmissionController *v9;
  uint8_t buf[16];

  v1 = +[OSASystemConfiguration sharedInstance];
  v2 = [v1 logDomain];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "*** Starting OTACrashCopier ***", buf, 2u);
  }

  +[OSATasking checkTaskingRelevance];
  v3 = objc_alloc_init(SubmissionController);
  if (v3)
  {
    v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.OSASubmission.client"];
    [v4 setDelegate:v3];
    [v4 resume];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000025E0();
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001430;
  handler[3] = &unk_1000042A0;
  v5 = v3;
  v9 = v5;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  v6 = +[NSRunLoop currentRunLoop];
  [v6 run];

  return 1;
}

void sub_100001430(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v5 = "Unknown XPC event type - ignoring.";
        uint32_t v6 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, v6);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    v7 = xpc_dictionary_get_value(v3, _xpc_event_key_name);
    v8 = v7;
    if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v8);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        string = string_ptr;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Got event called '%s'", (uint8_t *)&v12, 0xCu);
      }
      if (!strcmp(string_ptr, "SubmissionPreferenceChangedEvent"))
      {
        [*(id *)(a1 + 32) handleOptInChange];
        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        string = string_ptr;
        v9 = "Recieved LaunchEvent with unknown name '%s'";
        uint32_t v10 = 12;
        goto LABEL_12;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v9 = "Recieved nameless LaunchEvent - ignoring.";
      uint32_t v10 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v10);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    v5 = "Got XPC error in notifyd event handler: %s";
    uint32_t v6 = 12;
    goto LABEL_7;
  }
LABEL_14:
}

id sub_100001818(uint64_t a1, int a2, void *a3)
{
  CFStringRef v4 = @"cellular";
  if ((a2 & 0x40000) == 0) {
    CFStringRef v4 = @"wifi";
  }
  if ((a2 & 6) == 2) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = @"<none>";
  }
  return [a3 reachabilityCallback:v5];
}

void sub_100001FC8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "submit mode=%{public}@", buf, 0xCu);
  }
  +[OSAStateMonitor recordEvent:OSAStateMonitorEventSubmissionStarted];
  if (&_CPPowerAssertionCreate)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = 0x4082C00000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "creating power assertion for %.0f secs", buf, 0xCu);
    }
    *(void *)(*(void *)(a1 + 40) + 32) = CPPowerAssertionCreate();
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000024CC;
  v32[3] = &unk_1000042C8;
  v32[4] = *(void *)(a1 + 40);
  CFStringRef v5 = +[NSBlockOperation blockOperationWithBlock:v32];
  uint32_t v6 = +[NSTimer scheduledTimerWithTimeInterval:v5 target:"main" selector:0 userInfo:0 repeats:600.0];

  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"];
  unsigned __int8 v8 = [v7 isEqualToString:@"beta"];
  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    v1 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"];
    uint64_t v9 = (uint64_t)[v1 isEqualToString:@"urgent"];
  }
  uint32_t v10 = +[NSNumber numberWithInt:v9];
  v11 = [*(id *)(*(void *)(a1 + 40) + 48) scanOptions];
  [v11 setObject:v10 forKeyedSubscript:kOSALogScanOptionIncludeOnlyUrgent];

  if ((v8 & 1) == 0) {
  runCrashMoverService();
  }
  int v12 = objc_opt_new();
  v13 = [*(id *)(*(void *)(a1 + 40) + 8) connectionType];
  [*(id *)(*(void *)(a1 + 40) + 16) setConnectionType:v13];

  v14 = +[NSDate date];
  id v15 = [*(id *)(a1 + 32) mutableCopy];
  id v16 = [*(id *)(*(void *)(a1 + 40) + 24) copy];
  [v15 setObject:v16 forKeyedSubscript:@"notifications"];

  [v15 setObject:v14 forKeyedSubscript:@"time"];
  [*(id *)(*(void *)(a1 + 40) + 16) setLaunchInfo:v15];
  uint64_t v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 16);
  uint64_t v19 = *(void *)(v17 + 48);
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  v29 = sub_100002558;
  v30 = &unk_1000042F0;
  id v20 = v12;
  id v31 = v20;
  [v18 submitLogsUsingPolicy:v19 resultsCallback:&v27];
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, @"submissions", v27, v28, v29, v30);
    v21 = [*(id *)(*(void *)(a1 + 40) + 16) submissionURL];
    v22 = [v21 absoluteString];
    [v15 setObject:v22 forKeyedSubscript:@"url"];

    v23 = [*(id *)(*(void *)(a1 + 40) + 16) connectionType];
    [v15 setObject:v23 forKeyedSubscript:@"connection"];

    v24 = +[OSASystemConfiguration sharedInstance];
    v25 = [v24 buildVersion];
    [v15 setObject:v25 forKeyedSubscript:@"version"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "removeAllObjects", v27, v28, v29, v30);
  v26 = *(const void **)(*(void *)(a1 + 40) + 32);
  if (v26) {
    CFRelease(v26);
  }
  [v6 invalidate];
  +[OSAStateMonitor recordEvent:OSAStateMonitorEventSubmissionCompleted];
}

id sub_1000024CC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "power assertion expired; aborting submission",
      v3,
      2u);
  }
  +[OSAStateMonitor recordEvent:OSAStateMonitorEventSubmissionErrorPowerAssertionExpired];
  return [*(id *)(*(void *)(a1 + 32) + 16) abort];
}

id sub_100002558(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_1000025E0()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create submission controller object.", v0, 2u);
}

void sub_100002628()
{
  int v0 = 138543362;
  uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not retrieve data vault submission path: %{public}@", (uint8_t *)&v0, 0xCu);
}

void sub_1000026A8()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Client not entitled to submit logs.", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return _SCNetworkReachabilityScheduleWithRunLoop(target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t runCrashMoverService()
{
  return _runCrashMoverService();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return [a1 abort];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_checkTaskingRelevance(void *a1, const char *a2, ...)
{
  return [a1 checkTaskingRelevance];
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return [a1 connectionType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_handleOptInChange(void *a1, const char *a2, ...)
{
  return [a1 handleOptInChange];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDataVaultEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDataVaultEnabled];
}

id objc_msgSend_logDomain(void *a1, const char *a2, ...)
{
  return [a1 logDomain];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_optInApple(void *a1, const char *a2, ...)
{
  return [a1 optInApple];
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return [a1 pathSubmission];
}

id objc_msgSend_pathSubmissionDataVault(void *a1, const char *a2, ...)
{
  return [a1 pathSubmissionDataVault];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scanOptions(void *a1, const char *a2, ...)
{
  return [a1 scanOptions];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_submissionURL(void *a1, const char *a2, ...)
{
  return [a1 submissionURL];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}