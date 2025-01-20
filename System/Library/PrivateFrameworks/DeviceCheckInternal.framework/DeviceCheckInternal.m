void sub_100003590(uint64_t a1)
{
  NSObject *v2;

  v2 = sub_100003944();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100005950(a1, v2);
  }
}

id sub_1000036EC()
{
  if (qword_10000D030 != -1) {
    dispatch_once(&qword_10000D030, &stru_100008328);
  }
  v0 = (void *)qword_10000D028;

  return v0;
}

void sub_10000391C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100003944()
{
  if (qword_10000D020 != -1) {
    dispatch_once(&qword_10000D020, &stru_100008308);
  }
  v0 = (void *)qword_10000D018;

  return v0;
}

uint64_t sub_100003A58(uint64_t a1)
{
  qword_10000D008 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100003BB4(id a1, int64_t a2)
{
  v3 = sub_100003944();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    int64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initiated an out of band catalog download completed with result: %ld", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000040B0(uint64_t a1, uint64_t a2)
{
  int v4 = sub_100003944();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Catalog downloaded with result %ld...", (uint8_t *)&v7, 0xCu);
  }

  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = +[NSError errorWithDomain:@"com.apple.twobit.fetcherror" code:-3001 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    [*(id *)(a1 + 32) _queryMetadataWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void sub_100004548(id a1)
{
  qword_10000D018 = (uint64_t)os_log_create("com.apple.devicecheck", "core");

  _objc_release_x1();
}

void sub_10000458C(id a1)
{
  qword_10000D028 = (uint64_t)os_log_create("com.apple.devicecheck", "attestation");

  _objc_release_x1();
}

void sub_1000047B0(id a1)
{
  qword_10000D038 = objc_alloc_init(DCXPCListener);

  _objc_release_x1();
}

void sub_1000048D8(id a1)
{
  v1 = sub_100003944();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM requested, devicecheckd is being terminated.", v2, 2u);
  }

  exit(0);
}

uint64_t sub_100004D60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005424(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000544C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t start()
{
  v0 = +[DCTaskCreator create];
  v1 = +[DCBGSTaskController sharedInstance];
  [v1 registerForTask:v0];

  v2 = +[AppAttestTaskCreator create];
  v3 = +[DCBGSTaskController sharedInstance];
  [v3 registerForTask:v2];

  int v4 = +[DCXPCListener sharedInstance];
  [v4 start];

  CFRunLoopRun();
  return 0;
}

void sub_100005850(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected query result: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_1000058C8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Catalog refetch not allowed, failing...", v1, 2u);
}

void sub_10000590C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected result count detected!!!", v1, 2u);
}

void sub_100005950(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Connection invalidated... %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000059E8()
{
  sub_100005440();
  sub_10000544C((void *)&_mh_execute_header, v0, v1, "Unable to fetch AppID...", v2, v3, v4, v5, v6);
}

void sub_100005A1C()
{
  sub_100005440();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Handling sign data with baa certificate...", v1, 2u);
}

void sub_100005A5C()
{
  sub_100005468();
  sub_100005424((void *)&_mh_execute_header, v0, v1, "DeviceCheck_IsSupported - (%s)\n", v2, v3, v4, v5, v6);
}

void sub_100005ADC()
{
  sub_100005468();
  sub_100005424((void *)&_mh_execute_header, v0, v1, "AppAttest_AppAttestation_IsSupported - (%s)\n", v2, v3, v4, v5, v6);
}

void sub_100005B5C()
{
  sub_100005468();
  sub_100005424((void *)&_mh_execute_header, v0, v1, "AppAttest_AppAttestation_IsEligibleApplication - (%s)\n", v2, v3, v4, v5, v6);
}

void sub_100005BDC()
{
  sub_100005468();
  sub_100005424((void *)&_mh_execute_header, v0, v1, "AppAttest_AppAttestation_IsSupportedHardware - (%s)\n", v2, v3, v4, v5, v6);
}

void sub_100005C5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to parse asset, required fields are missing!", v1, 2u);
}

uint64_t AppAttest_AppAttestation_Assert()
{
  return _AppAttest_AppAttestation_Assert();
}

uint64_t AppAttest_AppAttestation_AttestKey()
{
  return _AppAttest_AppAttestation_AttestKey();
}

uint64_t AppAttest_AppAttestation_CreateKey()
{
  return _AppAttest_AppAttestation_CreateKey();
}

uint64_t AppAttest_AppAttestation_IsEligibleApplication()
{
  return _AppAttest_AppAttestation_IsEligibleApplication();
}

uint64_t AppAttest_AppAttestation_IsSupported()
{
  return _AppAttest_AppAttestation_IsSupported();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

uint64_t DeviceIdentityIsSupported()
{
  return _DeviceIdentityIsSupported();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return _SecTaskCopyTeamIdentifier();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return [a1 XPCInterface];
}

id objc_msgSend__assetQuery(void *a1, const char *a2, ...)
{
  return [a1 _assetQuery];
}

id objc_msgSend__generateAppIDFromCurrentConnection(void *a1, const char *a2, ...)
{
  return [a1 _generateAppIDFromCurrentConnection];
}

id objc_msgSend__isSupported(void *a1, const char *a2, ...)
{
  return [a1 _isSupported];
}

id objc_msgSend_allowCatalogRefresh(void *a1, const char *a2, ...)
{
  return [a1 allowCatalogRefresh];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return [a1 create];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_ignoreCachedMetadata(void *a1, const char *a2, ...)
{
  return [a1 ignoreCachedMetadata];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_publicKeyRefreshInterval(void *a1, const char *a2, ...)
{
  return [a1 publicKeyRefreshInterval];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_registerForSigtermObserver(void *a1, const char *a2, ...)
{
  return [a1 registerForSigtermObserver];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sigtermQueue(void *a1, const char *a2, ...)
{
  return [a1 sigtermQueue];
}

id objc_msgSend_sigtermSource(void *a1, const char *a2, ...)
{
  return [a1 sigtermSource];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}