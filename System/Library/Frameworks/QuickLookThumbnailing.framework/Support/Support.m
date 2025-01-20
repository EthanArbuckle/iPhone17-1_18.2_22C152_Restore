uint64_t sub_10000488C(uint64_t a1)
{
  uint64_t result;

  result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t start()
{
  _set_user_dir_suffix();
  id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.quicklook.ThumbnailsAgent"];
  v2 = (void *)qword_10000CC00;
  qword_10000CC00 = (uint64_t)v1;

  v3 = objc_alloc_init(QLThumbnailsServiceDelegate);
  v4 = (void *)qword_10000CC10;
  qword_10000CC10 = (uint64_t)v3;

  [(id)qword_10000CC00 setDelegate:qword_10000CC10];
  [(id)qword_10000CC00 resume];
  +[QLThumbnailAdditionIndex setUpCleanupXPCActivitySynchronously:1];
  uint64_t v5 = +[QLServerThread sharedInstance];
  v6 = (void *)qword_10000CC08;
  qword_10000CC08 = v5;

  v7 = +[QLThumbnailAdditionIndex sharedInstance];
  +[QLCacheDeleteHandler setUpCacheDeleteWithThumbnailAdditionIndex:v7];

  v8 = +[NSRunLoop mainRunLoop];
  [v8 run];

  v9 = qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    v9 = qltLogHandles;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000058F8(v9);
  }
  return 0;
}

id sub_100004A14(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && [v1 isFileURL])
  {
    int v3 = open((const char *)[v2 fileSystemRepresentation], 0x8000, 0);
    if (v3 < 0)
    {
      v8 = sub_100004B98();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10000593C();
      }
    }
    else
    {
      int v4 = v3;
      if (fcntl(v3, 50, v11) == -1)
      {
        v9 = sub_100004B98();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000059C0();
        }

        close(v4);
      }
      else
      {
        close(v4);
        if (v11[0])
        {
          uint64_t v5 = sandbox_extension_issue_file();
          if (v5)
          {
            v6 = (void *)v5;
            v7 = +[NSString stringWithUTF8String:v5];
            free(v6);
            goto LABEL_15;
          }
        }
      }
    }
  }
  v7 = 0;
LABEL_15:

  return v7;
}

id sub_100004B98()
{
  v0 = (void *)qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    v0 = (void *)qltLogHandles;
  }

  return v0;
}

void sub_100004E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004E44(uint64_t a1)
{
}

void sub_100004E4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _CFURLPromiseCopyPhysicalURL();
  uint64_t v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;

  id v8 = v7;
  if (!access((const char *)[v8 fileSystemRepresentation], 4))
  {
    uint64_t v10 = *__error();
    NSErrorDomain v11 = NSPOSIXErrorDomain;
LABEL_12:
    uint64_t v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v10, 0, v17);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    goto LABEL_13;
  }
  v9 = *(void **)(a1 + 32);
  if (v9) {
    [v9 auditToken];
  }
  id v12 = v8;
  id v17 = [v12 fileSystemRepresentation];
  if (sandbox_check_by_audit_token())
  {
    v13 = sub_100004B98();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100005AD0((id *)(a1 + 32), (uint64_t)v12, v13);
    }

    NSErrorDomain v11 = (NSErrorDomain)QLThumbnailsServiceErrorDomain;
    uint64_t v10 = 1;
    goto LABEL_12;
  }
LABEL_13:
}

void sub_1000058D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000058F8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The main run loop should never exit!", v1, 2u);
}

void sub_10000593C()
{
  v0 = __error();
  strerror(*v0);
  sub_1000058C0();
  sub_1000058D8((void *)&_mh_execute_header, v1, v2, "failed to open path %s: %s", v3, v4, v5, v6, v7);
}

void sub_1000059C0()
{
  v0 = __error();
  strerror(*v0);
  sub_1000058C0();
  sub_1000058D8((void *)&_mh_execute_header, v1, v2, "failed to get real path for %s: %s", v3, v4, v5, v6, v7);
}

void sub_100005A44(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find application identifier for pid %d: %@", (uint8_t *)v4, 0x12u);
}

void sub_100005AD0(id *a1, uint64_t a2, NSObject *a3)
{
  unsigned int v5 = [*a1 pid];
  v6[0] = 67109378;
  v6[1] = v5;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Client (pid %d) does not have sandbox access to %@", (uint8_t *)v6, 0x12u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t QLTInitLogging()
{
  return _QLTInitLogging();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return __CFURLPromiseCopyPhysicalURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_additionURL(void *a1, const char *a2, ...)
{
  return [a1 additionURL];
}

id objc_msgSend_allKnownDataSeparatedVolumes(void *a1, const char *a2, ...)
{
  return [a1 allKnownDataSeparatedVolumes];
}

id objc_msgSend_allThumbnailsInfo(void *a1, const char *a2, ...)
{
  return [a1 allThumbnailsInfo];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_cacheInfo(void *a1, const char *a2, ...)
{
  return [a1 cacheInfo];
}

id objc_msgSend_clientApplicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientApplicationIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_providerDomainID(void *a1, const char *a2, ...)
{
  return [a1 providerDomainID];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}