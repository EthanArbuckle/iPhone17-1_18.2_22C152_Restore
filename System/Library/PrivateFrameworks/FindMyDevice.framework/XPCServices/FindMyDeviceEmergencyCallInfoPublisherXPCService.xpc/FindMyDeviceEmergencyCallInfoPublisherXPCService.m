void sub_100003D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003DD0(uint64_t a1)
{
  v2 = sub_100004738();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) directoryURL];
    v4 = [v3 path];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Monitored directory changed: %@", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained directoryChanged];
}

void sub_100003EB4(uint64_t a1)
{
  v2 = sub_100004738();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) directoryURL];
    v4 = [v3 path];
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Monitored directory went away: %@", (uint8_t *)&v9, 0xCu);
  }
  v5 = sub_100004738();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [*(id *)(a1 + 32) directoryURL];
    v7 = [v6 path];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Monitored directory went away: %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancel];
}

id sub_100004738()
{
  if (qword_1000158F8 != -1) {
    dispatch_once(&qword_1000158F8, &stru_10000CDF8);
  }
  v0 = (void *)qword_100015900;

  return v0;
}

void sub_10000478C(id a1)
{
  qword_100015900 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_1000047D0()
{
  if (qword_100015908 != -1) {
    dispatch_once(&qword_100015908, &stru_10000CE18);
  }
  v0 = (void *)qword_100015910;

  return v0;
}

void sub_100004824(id a1)
{
  qword_100015910 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_100004868()
{
  if (qword_100015918 != -1) {
    dispatch_once(&qword_100015918, &stru_10000CE38);
  }
  v0 = (void *)qword_100015920;

  return v0;
}

void sub_1000048BC(id a1)
{
  qword_100015920 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_100004900()
{
  if (qword_100015928 != -1) {
    dispatch_once(&qword_100015928, &stru_10000CE58);
  }
  v0 = (void *)qword_100015930;

  return v0;
}

void sub_100004954(id a1)
{
  qword_100015930 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_100004998()
{
  if (qword_100015938 != -1) {
    dispatch_once(&qword_100015938, &stru_10000CE78);
  }
  v0 = (void *)qword_100015940;

  return v0;
}

void sub_1000049EC(id a1)
{
  qword_100015940 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_100004A30()
{
  if (qword_100015948 != -1) {
    dispatch_once(&qword_100015948, &stru_10000CE98);
  }
  v0 = (void *)qword_100015950;

  return v0;
}

void sub_100004A84(id a1)
{
  qword_100015950 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_100004AC8()
{
  if (qword_100015958 != -1) {
    dispatch_once(&qword_100015958, &stru_10000CEB8);
  }
  v0 = (void *)qword_100015960;

  return v0;
}

void sub_100004B1C(id a1)
{
  qword_100015960 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_100004B60()
{
  if (qword_100015968 != -1) {
    dispatch_once(&qword_100015968, &stru_10000CED8);
  }
  v0 = (void *)qword_100015970;

  return v0;
}

void sub_100004BB4(id a1)
{
  qword_100015970 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_100004BF8()
{
  if (qword_100015978 != -1) {
    dispatch_once(&qword_100015978, &stru_10000CEF8);
  }
  v0 = (void *)qword_100015980;

  return v0;
}

void sub_100004C4C(id a1)
{
  qword_100015980 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_100004C90()
{
  if (qword_100015988 != -1) {
    dispatch_once(&qword_100015988, &stru_10000CF18);
  }
  v0 = (void *)qword_100015990;

  return v0;
}

void sub_100004CE4(id a1)
{
  qword_100015990 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100004D28()
{
  if (qword_100015998 != -1) {
    dispatch_once(&qword_100015998, &stru_10000CF38);
  }
  v0 = (void *)qword_1000159A0;

  return v0;
}

void sub_100004D7C(id a1)
{
  qword_1000159A0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_100004DC0()
{
  if (qword_1000159A8 != -1) {
    dispatch_once(&qword_1000159A8, &stru_10000CF58);
  }
  v0 = (void *)qword_1000159B0;

  return v0;
}

void sub_100004E14(id a1)
{
  qword_1000159B0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100004E58()
{
  if (qword_1000159B8 != -1) {
    dispatch_once(&qword_1000159B8, &stru_10000CF78);
  }
  v0 = (void *)qword_1000159C0;

  return v0;
}

void sub_100004EAC(id a1)
{
  qword_1000159C0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_100004EF0()
{
  if (qword_1000159C8 != -1) {
    dispatch_once(&qword_1000159C8, &stru_10000CF98);
  }
  v0 = (void *)qword_1000159D0;

  return v0;
}

void sub_100004F44(id a1)
{
  qword_1000159D0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_100004F88()
{
  if (qword_1000159D8 != -1) {
    dispatch_once(&qword_1000159D8, &stru_10000CFB8);
  }
  v0 = (void *)qword_1000159E0;

  return v0;
}

void sub_100004FDC(id a1)
{
  qword_1000159E0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_100005020()
{
  if (qword_1000159E8 != -1) {
    dispatch_once(&qword_1000159E8, &stru_10000CFD8);
  }
  v0 = (void *)qword_1000159F0;

  return v0;
}

void sub_100005074(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_1000159F0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_100005134(id a1)
{
  qword_1000159F8 = objc_alloc_init(FMDAutomationHelperFactory);

  _objc_release_x1();
}

uint64_t start()
{
  v0 = sub_100004738();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "FindMyDeviceEmergencyCallInfoPublisherXPCService started", v5, 2u);
  }

  v2 = objc_alloc_init(FindMyDeviceEmergencyCallInfoPublisherXPCService);
  v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];

  return 0;
}

void sub_100005718(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    v7 = sub_100004738();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 URL];
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FindMyDeviceEmergencyCallInfoPublisherXPCService URL: %@", buf, 0xCu);
    }
    int v9 = sub_100004738();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v5 allHTTPHeaderFields];
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FindMyDeviceEmergencyCallInfoPublisherXPCService Sending headers: %@", buf, 0xCu);
    }
    v11 = sub_100004738();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v5 HTTPBody];
      v13 = +[NSJSONSerialization JSONObjectWithData:v12 options:0 error:0];
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FindMyDeviceEmergencyCallInfoPublisherXPCService Sending with body dict: %@", buf, 0xCu);
    }
    v14 = [*(id *)(a1 + 32) _session];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10000599C;
    v20 = &unk_10000D020;
    id v15 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = v15;
    v16 = [v14 dataTaskWithRequest:v5 completionHandler:&v17];
    objc_msgSend(v16, "resume", v17, v18, v19, v20);
  }
}

void sub_10000599C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v8 = v6;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_processServerStatusCode:", objc_msgSend(v6, "statusCode"));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100005C04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000623C(_Unwind_Exception *a1)
{
}

void sub_100006254(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSMutableURLRequest);
  v7 = [*(id *)(a1 + 32) _requestURLWithServerHostStr:*(void *)(a1 + 40)];
  id v8 = [v6 initWithURL:v7];

  [v8 setHTTPMethod:@"POST"];
  [v8 setHTTPBody:*(void *)(a1 + 48)];
  int v9 = [*(id *)(a1 + 32) _requestHeaders];
  id v10 = [v9 mutableCopy];

  if (v5)
  {
    v11 = [v5 domain];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@|%ld", v11, [v5 code]);
    CFStringRef v13 = @"X-Apple-Sign5-Error";
  }
  else
  {
    v14 = [v17 signature];
    id v15 = [v14 base64EncodedStringWithOptions:0];
    objc_msgSend(v10, "fm_safelyMapKey:toObject:", @"X-Mme-Sign5", v15);

    v11 = [v17 attestation];
    v12 = [v11 base64EncodedStringWithOptions:0];
    CFStringRef v13 = @"X-Mme-Sign6";
  }
  objc_msgSend(v10, "fm_safelyMapKey:toObject:", v13, v12);

  id v16 = [v10 copy];
  [v8 setAllHTTPHeaderFields:v16];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100006C90(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open %@", buf, 0xCu);
}

void sub_100006CE8(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 directoryURL];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error while trying to read the contents of directory %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100006D98(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend__requestHeaders(void *a1, const char *a2, ...)
{
  return [a1 _requestHeaders];
}

id objc_msgSend__session(void *a1, const char *a2, ...)
{
  return [a1 _session];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_attestation(void *a1, const char *a2, ...)
{
  return [a1 attestation];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return [a1 automationHelperBundle];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return [a1 deviceUDID];
}

id objc_msgSend_directoryChanged(void *a1, const char *a2, ...)
{
  return [a1 directoryChanged];
}

id objc_msgSend_directoryURL(void *a1, const char *a2, ...)
{
  return [a1 directoryURL];
}

id objc_msgSend_dispatchSourceAbort(void *a1, const char *a2, ...)
{
  return [a1 dispatchSourceAbort];
}

id objc_msgSend_dispatchSourceChange(void *a1, const char *a2, ...)
{
  return [a1 dispatchSourceChange];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return [a1 fd];
}

id objc_msgSend_fileDiscovered(void *a1, const char *a2, ...)
{
  return [a1 fileDiscovered];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return [a1 hasAttemptedLoad];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 osBuildVersion];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serverHost(void *a1, const char *a2, ...)
{
  return [a1 serverHost];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return [a1 standardizedURL];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetFilename(void *a1, const char *a2, ...)
{
  return [a1 targetFilename];
}

id objc_msgSend_triggered(void *a1, const char *a2, ...)
{
  return [a1 triggered];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}