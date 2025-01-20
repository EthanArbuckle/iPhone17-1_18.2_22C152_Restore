uint64_t start()
{
  NSObject *v0;
  int v1;
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v29;
  void *context;
  id v31;
  uint8_t buf[4];
  uid_t v33;

  v0 = _ACLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v33 = getuid();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "\"Starting accountsd... (uid: %u)\"", buf, 8u);
  }

  v1 = setiopolicy_np(9, 0, 1);
  if (v1)
  {
    v2 = v1;
    v3 = _ACLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100003168(v2, v3);
    }
  }
  v4 = +[NSFileManager defaultManager];
  v5 = [v4 URLsForDirectory:5 inDomains:1];
  v6 = [v5 firstObject];

  v7 = [v6 URLByAppendingPathComponent:@"Accounts" isDirectory:1];
  v8 = [v7 URLByAppendingPathComponent:@"Accounts3.sqlite" isDirectory:0];

  v9 = [v8 URLByDeletingLastPathComponent];
  v31 = 0;
  v10 = +[NSFileManager defaultManager];
  v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v31];

  v12 = v31;
  if ((v11 & 1) == 0)
  {
    v13 = _ACLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000030E0((uint64_t)v9, (uint64_t)v12, v13);
    }

    v14 = +[ACDEventLedger sharedLedger];
    v15 = +[NSString stringWithFormat:@"ACDServerCreateDirectory('%@') failed: %@", v9, v12];
    [v14 recordEvent:v15];
  }
  v16 = [objc_alloc((Class)ACDDatabase) initWithDatabaseURL:v8];
  v17 = [objc_alloc((Class)ACDDatabaseBackupActivity) initWithDatabase:v16];
  v29 = v12;
  v18 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accountsd.accountmanager"];
  v19 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accountsd.oauthsigner"];
  v20 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.accountsd.oopa"];
  v21 = [objc_alloc((Class)ACDServer) initWithAccountStoreListener:v18 oauthSignerListener:v19 authenticationDialogListener:v20];
  v22 = (void *)qword_1000080C0;
  qword_1000080C0 = (uint64_t)v21;

  v23 = objc_alloc((Class)ACDAccountNotifier);
  v24 = [objc_alloc((Class)ACDLazyArray) initWithInitializer:&stru_100004148];
  v25 = [v23 initWithNotificationEntries:v24];
  [(id)qword_1000080C0 setAccountNotifier:v25];

  v26 = objc_alloc_init((Class)ACDClientProvider);
  [(id)qword_1000080C0 setClientProvider:v26];

  [(id)qword_1000080C0 setDatabase:v16];
  [(id)qword_1000080C0 setDatabaseBackupActivity:v17];
  [v17 registerActivityIfNeeded];
  [(id)qword_1000080C0 start];

  v27 = +[NSRunLoop mainRunLoop];
  [v27 run];

  return 0;
}

NSArray *__cdecl sub_1000030D4(id a1)
{
  return (NSArray *)+[ACDAccountNotifier allNotificationEntries];
}

void sub_1000030E0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "\"Error creating database directory at %@: %@\"", (uint8_t *)&v3, 0x16u);
}

void sub_100003168(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "\"Error setting io policy: %d\"", (uint8_t *)v2, 8u);
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

uid_t getuid(void)
{
  return _getuid();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_registerActivityIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 registerActivityIfNeeded];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedLedger(void *a1, const char *a2, ...)
{
  return [a1 sharedLedger];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}