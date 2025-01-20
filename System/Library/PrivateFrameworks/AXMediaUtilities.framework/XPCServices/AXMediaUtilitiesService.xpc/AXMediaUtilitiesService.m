void sub_100005588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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
  v3 = AXMediaLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "*** AXMediaUtilitiesService is starting ***", v7, 2u);
  }

  if (_AXMProcessRequestMobileUserPrivileges())
  {
    v4 = objc_alloc_init(AXMServiceInstance);
    [(AXMServiceInstance *)v4 run];
    int v5 = 0;
  }
  else
  {
    AXMediaLogCommon();
    v4 = (AXMServiceInstance *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      main_cold_1(&v4->super);
    }
    int v5 = -1;
  }

  return v5;
}

void main_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not switch to mobile. aborting", v1, 2u);
}

uint64_t AXMAuditTokenTaskHasEntitlement()
{
  return _AXMAuditTokenTaskHasEntitlement();
}

uint64_t AXMDeleteCoreImageContext()
{
  return _AXMDeleteCoreImageContext();
}

uint64_t AXMServiceInterface()
{
  return _AXMServiceInterface();
}

uint64_t AXMediaLogCommon()
{
  return _AXMediaLogCommon();
}

uint64_t AXMediaLogService()
{
  return _AXMediaLogService();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return _AX_PERFORM_WITH_LOCK();
}

uint64_t _AXMMakeError()
{
  return __AXMMakeError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_analysisOptions(void *a1, const char *a2, ...)
{
  return [a1 analysisOptions];
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

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_engineCache(void *a1, const char *a2, ...)
{
  return [a1 engineCache];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idleManager(void *a1, const char *a2, ...)
{
  return [a1 idleManager];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_prewarmVisionEngineService(void *a1, const char *a2, ...)
{
  return [a1 prewarmVisionEngineService];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
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

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_voiceOverActivityOccurred(void *a1, const char *a2, ...)
{
  return [a1 voiceOverActivityOccurred];
}

id objc_msgSend_xpcServer(void *a1, const char *a2, ...)
{
  return [a1 xpcServer];
}