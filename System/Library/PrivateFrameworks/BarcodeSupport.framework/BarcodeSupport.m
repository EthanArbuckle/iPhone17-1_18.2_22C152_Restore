uint64_t start()
{
  id v0;
  id v1;
  id v2;
  void *v3;

  if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000032BC();
  }
  v0 = objc_alloc_init((Class)BCSNotificationServiceDelegate);
  v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.BarcodeSupport.BarcodeNotificationService"];
  [v1 setDelegate:v0];
  [v1 resume];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004100);
  v2 = +[BCSNotificationManager sharedManager];
  v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_100003128(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string && !strcmp(string, "Region Setting Changed"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Region Setting Changed", v4, 2u);
    }
    id v3 = objc_alloc_init((Class)BCSConfigurationManager);
    [v3 setUpQRCodeControlCenterModuleWithCompletionHandler:&stru_100004140];
  }
}

void sub_1000031D4(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003348(v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"fail";
    if (v3) {
      CFStringRef v5 = @"succeed";
    }
    int v6 = 138543362;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Setting up QR Code Control Center module did %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_1000032BC()
{
  v0 = __error();
  v1 = strerror(*v0);
  int v2 = 136315138;
  BOOL v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set user tmp directory suffix: %s", (uint8_t *)&v2, 0xCu);
}

void sub_100003348(void *a1)
{
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  BOOL v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set up QR Code Control Center module %{public}@", (uint8_t *)&v2, 0xCu);
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}