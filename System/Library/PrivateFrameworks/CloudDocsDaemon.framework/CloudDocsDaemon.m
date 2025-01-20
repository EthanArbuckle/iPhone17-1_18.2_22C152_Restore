uint64_t start(int a1, char **a2)
{
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t (**v9)(void);
  void *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  uid_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v22;
  NSObject *v23;
  uint8_t buf[4];
  void v25[2];

  do
  {
    while (1)
    {
      v4 = getopt_long(a1, a2, "hpU", (const option *)&off_100004120, 0);
      if (v4 <= 58) {
        break;
      }
      if (v4 <= 111)
      {
        if (v4 == 59 || v4 == 63 || v4 == 104) {
          sub_100002F3C();
        }
        goto LABEL_12;
      }
      if (v4 != 112) {
        goto LABEL_12;
      }
      v5 = brc_bread_crumbs();
      v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25[0] = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Got called with postlogoutsync argument%@", buf, 0xCu);
      }
LABEL_14:
    }
  }
  while (!v4);
  if (v4 != -1)
  {
LABEL_12:
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25[0] = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: 0%@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v8 = FPIsCloudDocsWithFPFSEnabled();
  v9 = &off_100008040;
  if (!v8) {
    v9 = &off_100008048;
  }
  v10 = [(id)(*v9)() daemon];
  v11 = getenv("LaunchInstanceID");
  if (v11)
  {
    syslog(3, "started in unit-test mode (uid: %s)", v11);
    [v10 waitForConfiguration];
    exit(71);
  }
  if (+[UMUserManager br_isInSyncBubble])
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = geteuid();
      *(_DWORD *)buf = 67109378;
      LODWORD(v25[0]) = v14;
      WORD2(v25[0]) = 2112;
      *(void *)((char *)v25 + 6) = v12;
      v15 = "[INFO] shared iPad: bird running in sync bubble for euid %u%@";
      v16 = v13;
      v17 = 18;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v18 = +[UMUserManager sharedManager];
  v19 = [v18 isSharedIPad];

  if (v19)
  {
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25[0] = v12;
      v15 = "[INFO] shared iPad: bird running normally%@";
      v16 = v13;
      v17 = 12;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
    }
LABEL_25:
  }
  if (qos_class_self() != QOS_CLASS_DEFAULT)
  {
    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_1000030C8((uint64_t)v22, v23);
    }
  }
  [v10 start];

  v20 = +[NSRunLoop mainRunLoop];
  [v20 run];

  return 0;
}

void sub_100002F3C()
{
  v0 = getprogname();
  printf("Usage: %s [options]\n", v0);
  putchar(10);
  puts("    -h,--help            show this help");
  puts("    -p,--postlogoutsync  start bird in post logout sync mode");
  exit(64);
}

Class sub_100002F88()
{
  if (!qword_100008058)
  {
    qword_100008058 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/iCloudDriveCore.framework/iCloudDriveCore", 2);
    if (!qword_100008058) {
      sub_100003140();
    }
  }
  Class Class = objc_getClass("BRCDaemonFPFS");
  qword_100008050 = (uint64_t)Class;
  if (!Class) {
    sub_1000031F4();
  }
  off_100008040 = (uint64_t (*)())sub_10000300C;

  return Class;
}

id sub_10000300C()
{
  return (id)qword_100008050;
}

Class sub_100003018()
{
  if (!qword_100008068)
  {
    qword_100008068 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudDocsDaemon.framework/CloudDocsDaemon", 2);
    if (!qword_100008068) {
      sub_100003220();
    }
  }
  Class Class = objc_getClass("BRCDaemon");
  qword_100008060 = (uint64_t)Class;
  if (!Class) {
    sub_1000032D4();
  }
  off_100008048 = (uint64_t (*)())sub_10000309C;

  return Class;
}

id sub_10000309C()
{
  return (id)qword_100008060;
}

void sub_1000030A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

void sub_1000030C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_DEFAULT%@", (uint8_t *)&v2, 0xCu);
}

void sub_100003140()
{
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    sub_1000030A8((void *)&_mh_execute_header, v2, v3, "[WARNING] Can't open iCloudDriveCore : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("iCloudDriveCoreLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/daemon/main.m", 17, "Can't open iCloudDriveCore");
}

void sub_1000031F4()
{
}

void sub_100003220()
{
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    sub_1000030A8((void *)&_mh_execute_header, v2, v3, "[WARNING] Can't open CloudDocsDaemon : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("CloudDocsDaemonLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/daemon/main.m", 20, "Can't open CloudDocsDaemon");
}

void sub_1000032D4()
{
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return _FPIsCloudDocsWithFPFSEnabled();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void exit(int a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return _getprogname();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_waitForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 waitForConfiguration];
}