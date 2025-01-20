uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  CFRunLoopRunResult v15;
  NSObject *v16;
  int v18;
  id v19;

  if (!objc_opt_class()
    || (+[CALNModuleProvider modules],
        v1 = objc_claimAutoreleasedReturnValue(),
        v2 = [v1 mutableCopy],
        v1,
        !v2))
  {
    v2 = objc_alloc_init((Class)NSMutableArray);
  }
  v3 = objc_alloc_init((Class)CISIntegrationServerModule);
  [v2 addObject:v3];
  v4 = objc_alloc((Class)CADSpotlightServerModule);
  v5 = objc_opt_new();
  v6 = [v4 initWithSpotlightEntityAnnotator:v5];

  [v2 addObject:v6];
  v7 = objc_alloc((Class)CADAppEntityNotifierModule);
  v8 = +[CalendarLinkAppEntityNotifier sharedNotifier];
  v9 = [v7 initWithAppEntityNotifier:v8];

  [v2 addObject:v9];
  v10 = objc_alloc_init((Class)CADStateDumpModule);
  [v2 addObject:v10];
  v11 = [objc_alloc((Class)CADServer) initWithModules:v2];
  [v11 activate];
  v12 = sub_1000036D8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activated server: %@.", (uint8_t *)&v18, 0xCu);
  }

  v13 = sub_1000036D8();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting run loop.", (uint8_t *)&v18, 2u);
  }

  do
  {
    v15 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 86400.0, 1u);
  }
  while ((v15 - 3) < 0xFFFFFFFE);
  v16 = sub_1000036D8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Server exiting unexpectedly.", (uint8_t *)&v18, 2u);
  }

  return 1;
}

id sub_1000036D8()
{
  if (qword_100008048 != -1) {
    dispatch_once(&qword_100008048, &stru_100004138);
  }
  v0 = (void *)qword_100008040;
  return v0;
}

void sub_10000372C(id a1)
{
  qword_100008040 = (uint64_t)os_log_create("com.apple.calaccessd", "main");
  _objc_release_x1();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_modules(void *a1, const char *a2, ...)
{
  return [a1 modules];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return [a1 sharedNotifier];
}