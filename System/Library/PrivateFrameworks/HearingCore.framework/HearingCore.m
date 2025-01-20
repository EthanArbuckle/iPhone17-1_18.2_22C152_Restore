uint64_t start()
{
  passwd *v0;
  uid_t pw_uid;
  gid_t pw_gid;
  void *v3;
  id v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[8];
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;

  v0 = getpwnam("mobile");
  pw_uid = v0->pw_uid;
  pw_gid = v0->pw_gid;
  if (!_set_user_dir_suffix()
    || (NSTemporaryDirectory(),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = [v3 length],
        v3,
        !v4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002D54();
    }
    exit(1);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100002B28, @"AppleLanguagePreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (!pw_uid || !pw_gid || (getgid() == pw_gid || !setgid(pw_gid)) && (getuid() == pw_uid || !setuid(pw_uid)))
  {
    signal(15, (void (__cdecl *)(int))sub_100002B88);
    v6 = AXLogRTT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = +[HCUtilities currentProcessIsHeard];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Verifying this is heard: %d", buf, 8u);
    }

    if ((+[HCUtilities currentProcessIsHeard] & 1) == 0) {
      sub_100002DDC();
    }
    if (geteuid())
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v8 = (void *)qword_100008038;
      v18 = qword_100008038;
      if (!qword_100008038)
      {
        *(void *)buf = _NSConcreteStackBlock;
        v20 = 3221225472;
        v21 = sub_100002B9C;
        v22 = &unk_100004158;
        v23 = &v15;
        sub_100002B9C((uint64_t)buf);
        v8 = (void *)v16[3];
      }
      v9 = v8;
      _Block_object_dispose(&v15, 8);
      v10 = objc_msgSend(v9, "sharedServer", v15);
      [v10 startServer];

      do
      {
        v11 = +[NSRunLoop currentRunLoop];
        v12 = +[NSDate distantFuture];
        v13 = [v11 runMode:NSDefaultRunLoopMode beforeDate:v12];
      }
      while ((v13 & 1) != 0);
    }
  }
  return 0;
}

void sub_100002B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100002B28()
{
  v0 = AXLogRTT();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Received AppleLanguagePreferencesChangedNotification, restarting heard", v1, 2u);
  }

  exit(0);
}

void sub_100002B88()
{
}

Class sub_100002B9C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008040)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002CE0;
    v3[4] = &unk_100004190;
    v3[5] = v3;
    long long v4 = off_100004178;
    uint64_t v5 = 0;
    qword_100008040 = _sl_dlopen();
    if (!qword_100008040)
    {
      abort_report_np();
LABEL_8:
      sub_100002E08();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXHeardController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002CE0()
{
  uint64_t result = _sl_dlopen();
  qword_100008040 = result;
  return result;
}

void sub_100002D54()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_100002DDC()
{
}

void sub_100002E08()
{
}

uint64_t AXLogRTT()
{
  return _AXLogRTT();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

gid_t getgid(void)
{
  return _getgid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_currentProcessIsHeard(void *a1, const char *a2, ...)
{
  return [a1 currentProcessIsHeard];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}