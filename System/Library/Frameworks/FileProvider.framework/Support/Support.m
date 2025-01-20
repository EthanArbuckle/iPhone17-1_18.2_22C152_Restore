uint64_t start(uint64_t a1, uint64_t *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  FPDNotReachableServer *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uid_t v27;

  fpfs_enable_fts_thread_fchdir();
  v4 = (id)fp_default_log();
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *a2;
    v24 = 136315394;
    v25 = v6;
    v26 = 1024;
    v27 = geteuid();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] %s starting for euid %u.", (uint8_t *)&v24, 0x12u);
  }

  v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100002CEC(v7);
  }

  +[FPDaemonConnection setDisallowedConnectionReason:@"daemon should not XPC to itself"];
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100002C6C();
    }
LABEL_40:

    exit(1);
  }
  if (os_variant_has_internal_content())
  {
    v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.fileproviderd"];
    v9 = [v8 objectForKey:@"com.apple.fileproviderd.debug.sleepOnStartInitialDate"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = v9;
        [v10 timeIntervalSinceNow];
        if (v11 >= -21600.0)
        {
          v13 = (uint64_t)[v8 integerForKey:@"com.apple.fileproviderd.debug.sleepOnStartDuration"];
          if ((v13 & 0x8000000000000000) == 0)
          {
            if (v13 >= 300) {
              v14 = 300;
            }
            else {
              v14 = v13;
            }
            v15 = fp_current_or_default_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v24 = 134217984;
              v25 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] fileproviderd is going to sleep for %lds", (uint8_t *)&v24, 0xCu);
            }

            sleep(v14);
          }
        }
        else
        {
          v12 = fp_current_or_default_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            sub_100002BD0(v10, v12);
          }
        }
      }
    }
  }
  if ((fpfs_enable_vnode_rapid_aging() & 0x80000000) != 0)
  {
    v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *__error();
      v24 = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to activate VNODE rapid aging: %{errno}d", (uint8_t *)&v24, 8u);
    }
  }
  fpfs_allow_operation();
  if ((fpfs_set_vfs_ignore_permissions_iopolicy() & 0x80000000) != 0)
  {
    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100002A8C();
    }
    goto LABEL_40;
  }
  if ((fpfs_set_vfs_parent_mtime_iopolicy() & 0x80000000) != 0)
  {
    v23 = fp_current_or_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100002B0C();
    }
    goto LABEL_40;
  }
  if (geteuid())
  {
    v18 = (FPDNotReachableServer *)objc_alloc_init((Class)FPDServer);
    [(FPDNotReachableServer *)v18 setFpfsClass:getFPDDomainFPFSBackendClass()];
    [(FPDNotReachableServer *)v18 setFpfsSQLBackupManagerClass:getFPFSSQLBackupManagerClass()];
    [(FPDNotReachableServer *)v18 setFpfsSQLRestoreManagerClass:getFPFSSQLRestoreManagerClass()];
    [(FPDNotReachableServer *)v18 setFpckTaskClass:getFPCKTaskClass()];
    [(FPDNotReachableServer *)v18 setFpdPurgerClass:getFPDPurgerClass()];
  }
  else
  {
    v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100002B8C(v19);
    }

    v18 = objc_alloc_init(FPDNotReachableServer);
  }
  [(FPDNotReachableServer *)v18 start];
  v20 = +[NSRunLoop currentRunLoop];
  [v20 run];

  v21 = self;
  return 0;
}

void sub_10000296C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id Blah.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id Blah.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Blah();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for Blah()
{
  return self;
}

id Blah.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Blah();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100002A8C()
{
  __error();
  sub_10000296C((void *)&_mh_execute_header, v0, v1, "[ERROR] failed to set ignore permissions iopolicy %d\n", v2, v3, v4, v5, 0);
}

void sub_100002B0C()
{
  __error();
  sub_10000296C((void *)&_mh_execute_header, v0, v1, "[ERROR] failed to set parent mTime iopolicy %d\n", v2, v3, v4, v5, 0);
}

void sub_100002B8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[CRIT] Running as euid 0. We will keep running, but deny all IPCs.", v1, 2u);
}

void sub_100002BD0(void *a1, NSObject *a2)
{
  [a1 timeIntervalSinceNow];
  int v5 = 138412546;
  v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Start date expired: %@ (%f)", (uint8_t *)&v5, 0x16u);
}

void sub_100002C6C()
{
  __error();
  sub_10000296C((void *)&_mh_execute_header, v0, v1, "[ERROR] Could not setup dirhelper suffix: %{errno}d", v2, v3, v4, v5, 0);
}

void sub_100002CEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] with fpfs support. debug logging enabled", v1, 2u);
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void exit(int a1)
{
}

uint64_t fp_current_or_default_log()
{
  return _fp_current_or_default_log();
}

uint64_t fp_default_log()
{
  return _fp_default_log();
}

uint64_t fpfs_allow_operation()
{
  return _fpfs_allow_operation();
}

uint64_t fpfs_enable_fts_thread_fchdir()
{
  return _fpfs_enable_fts_thread_fchdir();
}

uint64_t fpfs_enable_vnode_rapid_aging()
{
  return _fpfs_enable_vnode_rapid_aging();
}

uint64_t fpfs_set_vfs_ignore_permissions_iopolicy()
{
  return _fpfs_set_vfs_ignore_permissions_iopolicy();
}

uint64_t fpfs_set_vfs_parent_mtime_iopolicy()
{
  return _fpfs_set_vfs_parent_mtime_iopolicy();
}

uint64_t getFPCKTaskClass()
{
  return _getFPCKTaskClass();
}

uint64_t getFPDDomainFPFSBackendClass()
{
  return _getFPDDomainFPFSBackendClass();
}

uint64_t getFPDPurgerClass()
{
  return _getFPDPurgerClass();
}

uint64_t getFPFSSQLBackupManagerClass()
{
  return _getFPFSSQLBackupManagerClass();
}

uint64_t getFPFSSQLRestoreManagerClass()
{
  return _getFPFSSQLRestoreManagerClass();
}

uid_t geteuid(void)
{
  return _geteuid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisallowedConnectionReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisallowedConnectionReason:");
}

id objc_msgSend_setFpckTaskClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpckTaskClass:");
}

id objc_msgSend_setFpdPurgerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpdPurgerClass:");
}

id objc_msgSend_setFpfsClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpfsClass:");
}

id objc_msgSend_setFpfsSQLBackupManagerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpfsSQLBackupManagerClass:");
}

id objc_msgSend_setFpfsSQLRestoreManagerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpfsSQLRestoreManagerClass:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}