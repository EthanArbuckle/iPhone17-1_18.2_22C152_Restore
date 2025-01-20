void sub_100001720(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __SecTask *v5;
  __SecTask *v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeID v9;
  int Value;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  audit_token_t v15;
  audit_token_t buf;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void *)(a1 + 48);
    buf.val[0] = 134217984;
    *(void *)&buf.val[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received XPC event reply from [%llu]", (uint8_t *)&buf, 0xCu);
  }
  memset(&buf, 0, sizeof(buf));
  xpc_dictionary_get_audit_token();
  v15 = buf;
  v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v15);
  if (!v5) {
    goto LABEL_12;
  }
  v6 = v5;
  v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.localizationswitcher", 0);
  if (!v7) {
    goto LABEL_11;
  }
  v8 = v7;
  v9 = CFGetTypeID(v7);
  if (v9 != CFBooleanGetTypeID())
  {
    CFRelease(v8);
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  Value = CFBooleanGetValue((CFBooleanRef)v8);
  CFRelease(v8);
  CFRelease(v6);
  if (Value)
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v11, "bundleID", (const char *)[*(id *)(a1 + 32) UTF8String]);
    v12 = [*(id *)(a1 + 40) publisher];
    xpc_event_publisher_fire();

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void *)(a1 + 48);
      v14 = *(void *)(a1 + 32);
      v15.val[0] = 134218242;
      *(void *)&v15.val[1] = v13;
      LOWORD(v15.val[3]) = 2114;
      *(void *)((char *)&v15.val[3] + 2) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Fired XPC event to [%llu] with bundle ID [%{public}@]", (uint8_t *)&v15, 0x16u);
    }

    goto LABEL_14;
  }
LABEL_12:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000026E8();
  }
LABEL_14:
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Starting localizationswitcherd...", v2, 2u);
  }
  v0 = objc_opt_new();
  sub_100001A74(v0);
  id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.localizationswitcherd"];
  [v1 setDelegate:v0];
  [v1 resume];
  sub_100001B68();
  dispatch_main();
}

void sub_100001A74(void *a1)
{
  id v1 = a1;
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.IntlPreferences.events", 0);
  v3 = xpc_event_publisher_create();
  [v1 setPublisher:v3];
  v5 = v1;
  id v4 = v1;
  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();
  xpc_event_publisher_activate();
}

void sub_100001B68()
{
  id v0 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.IntlPreferences.analytics"];
  [v0 setPreregistered:1];
  [v0 scheduleWithBlock:&stru_1000042F8];
}

void sub_100001BCC(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC event publisher received XPC_EVENT_PUBLISHER_ACTION_REMOVE, token = %llu", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) removeSubscriber:a3];
  }
  else if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC event publisher received XPC_EVENT_PUBLISHER_ACTION_ADD, token = %llu", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) addSubscriber:a3];
  }
}

void sub_100001CFC(id a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC event publisher error occurred: %d", (uint8_t *)v3, 8u);
  }
}

void sub_100001D9C(id a1, id a2)
{
  dispatch_queue_t v2 = (void (**)(id, uint64_t))a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    CFStringRef v4 = @"com.apple.IntlPreferences.analytics";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running activity %@", (uint8_t *)&v3, 0xCu);
  }
  +[IPInternationalAnalytics reportStatistics];
  v2[2](v2, 1);
}

void sub_100002088(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    (*((void (**)(void))a1[6] + 2))();
    v5 = sub_100002608();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Encountered an error [%{public}@] while termianting application with bundle ID [%{public}@] using FrontBoardServices", buf, 0x16u);
    }
  }
  else
  {
    id v7 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    int v8 = [a1[5] bundleIdentifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002214;
    v9[3] = &unk_100004320;
    v11 = a1[6];
    id v10 = a1[4];
    [v7 openApplication:v8 withOptions:0 completion:v9];

    v5 = v11;
  }
}

void sub_100002214(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (v4)
  {
    v5();
    id v6 = sub_100002608();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v4;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      int v8 = "Encountered an error [%{public}@] while launching application with bundle ID [%{public}@] using FrontBoardServices";
      uint64_t v9 = v6;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    v5();
    id v6 = sub_100002608();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      int v12 = 138543362;
      id v13 = v11;
      int v8 = "Application with bundle ID [%{public}@] was relaunched successfully";
      uint64_t v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_6;
    }
  }
}

id sub_100002608()
{
  if (qword_1000089E8 != -1) {
    dispatch_once(&qword_1000089E8, &stru_100004388);
  }
  id v0 = (void *)qword_1000089F0;
  return v0;
}

void sub_10000265C(id a1)
{
  qword_1000089F0 = (uint64_t)os_log_create("com.apple.localizationswitcherd", "IPLocalizationSwitcher");
  _objc_release_x1();
}

void sub_1000026A0()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to start connection. Make sure you are entitled to use this method.", v0, 2u);
}

void sub_1000026E8()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to verify XPC event reply. Make sure you are entitled to subscribe.", v0, 2u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

uint64_t CFPreferencesFlushCaches()
{
  return _CFPreferencesFlushCaches();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return _xpc_event_publisher_fire_with_reply();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reportStatistics(void *a1, const char *a2, ...)
{
  return [a1 reportStatistics];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_subscribers(void *a1, const char *a2, ...)
{
  return [a1 subscribers];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}