id sub_100004F50()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000CF88 != -1) {
    dispatch_once(&qword_10000CF88, &stru_100008288);
  }
  v0 = (void *)qword_10000CF90;

  return v0;
}

void sub_100005378(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1000053B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _denyTokenAccess];
}

void sub_1000053F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _grantTokenAccess];
}

void sub_1000056B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100004F50();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100005A78((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) _invalidate];
}

id sub_100005718(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void sub_1000057FC(id a1)
{
  qword_10000CF90 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "tkui");

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_1000058F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not decode info. Received error: '%@'", (uint8_t *)&v2, 0xCu);
}

void sub_10000596C(uint64_t a1, NSObject *a2)
{
  v4 = [*(id *)(a1 + 8) clientDisplayName];
  uint64_t v5 = [*(id *)(a1 + 8) providerDisplayName];
  v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 24);
  CFStringRef v8 = @"unknown";
  if (v7 == 2) {
    CFStringRef v8 = @"denied";
  }
  int v9 = 138412802;
  v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  if (v7 == 1) {
    CFStringRef v8 = @"granted";
  }
  __int16 v13 = 2112;
  CFStringRef v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Request to allow '%@' access to token provided by '%@' was '%@'", (uint8_t *)&v9, 0x20u);
}

void sub_100005A78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not access UI server. Received error: %@", (uint8_t *)&v2, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
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

id objc_msgSend__denyTokenAccess(void *a1, const char *a2, ...)
{
  return [a1 _denyTokenAccess];
}

id objc_msgSend__grantTokenAccess(void *a1, const char *a2, ...)
{
  return [a1 _grantTokenAccess];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__presentAlert(void *a1, const char *a2, ...)
{
  return [a1 _presentAlert];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_clientDisplayName(void *a1, const char *a2, ...)
{
  return [a1 clientDisplayName];
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return [a1 correlationID];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_providerDisplayName(void *a1, const char *a2, ...)
{
  return [a1 providerDisplayName];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}