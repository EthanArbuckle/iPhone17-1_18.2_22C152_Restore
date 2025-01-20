void sub_100001FA0(uint64_t a1)
{
  id v2;
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) delegate];
  [v2 trainWithDetectorID:*(void *)(a1 + 40) hallucinatorPath:*(void *)(a1 + 48) pretrainedWeightsPath:*(void *)(a1 + 56) resultHandler:*(void *)(a1 + 64)];
}

void sub_100002298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000022DC(id a1)
{
  v1 = AXLogUltronKShot();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection from client interrupted", v2, 2u);
  }
}

void sub_100002344(uint64_t a1)
{
  v2 = AXLogUltronKShot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100002B6C(v2);
  }

  v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 _destroyXPCConnection:WeakRetained];
}

uint64_t _AXMProcessRequestMobileUserPrivileges()
{
  uint64_t result = (uint64_t)getpwnam("mobile");
  if (result)
  {
    uint64_t v1 = result;
    if (getuid() == *(_DWORD *)(result + 16)) {
      return 1;
    }
    else {
      return !setgid(*(_DWORD *)(v1 + 20)) && setuid(*(_DWORD *)(v1 + 16)) == 0;
    }
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = AXLogUltron();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "*** HearingMLHelperService is starting ***", v7, 2u);
  }

  if (_AXMProcessRequestMobileUserPrivileges())
  {
    v4 = objc_alloc_init(HearingMLHelperServiceInstance);
    [(HearingMLHelperServiceInstance *)v4 run];
    int v5 = 0;
  }
  else
  {
    AXLogUltron();
    v4 = (HearingMLHelperServiceInstance *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      sub_100002C2C(&v4->super);
    }
    int v5 = -1;
  }

  return v5;
}

void sub_1000029B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Run XPC Server: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002A2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Entitlement check passed for connection: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002AA4(void *a1, NSObject *a2)
{
  v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 processIdentifier]);
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  v8 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Invalid client tried to connect to HearingMLHelperService. Does not have entitlement: com.apple.accessibility.HearingMLHelperService-access. PID:%@. connection: %@", (uint8_t *)&v5, 0x16u);
}

void sub_100002B6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Connection from client invalidated", v1, 2u);
}

void sub_100002BB0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get entitlements for client task. Error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100002C2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not switch to mobile. aborting", v1, 2u);
}

uint64_t AXLogUltron()
{
  return _AXLogUltron();
}

uint64_t AXLogUltronKShot()
{
  return _AXLogUltronKShot();
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

void CFRelease(CFTypeRef cf)
{
}

uint64_t HearingMLHelperServiceInterface()
{
  return _HearingMLHelperServiceInterface();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 auditSessionIdentifier];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return [a1 xpcServer];
}