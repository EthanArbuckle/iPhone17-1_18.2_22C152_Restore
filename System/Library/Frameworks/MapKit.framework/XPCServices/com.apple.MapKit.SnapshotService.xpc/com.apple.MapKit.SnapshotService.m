id sub_100003B2C()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000CC60 != -1) {
    dispatch_once(&qword_10000CC60, &stru_1000082D0);
  }
  v0 = (void *)qword_10000CC58;

  return v0;
}

void sub_100003B80(id a1)
{
  qword_10000CC58 = (uint64_t)os_log_create("com.apple.MapKit", "Snapshot");

  _objc_release_x1();
}

void sub_100003DAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_100003DDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 8) cancelSnapshotForConnection:WeakRetained];
  }

  return _objc_release_x1();
}

uint64_t sub_100003E3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 8) cancelSnapshotForConnection:WeakRetained];
  }

  return _objc_release_x1();
}

uint64_t start()
{
  v0 = objc_alloc_init(ServiceDelegate);
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

uint64_t sub_100003F04(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CC68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003F94()
{
  v3[0] = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = qword_10000CC68;
  uint64_t v9 = qword_10000CC68;
  if (!qword_10000CC68)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100003F04;
    v3[4] = &unk_100008340;
    v4 = &v6;
    v5 = v3;
    long long v10 = *(_OWORD *)off_100008318;
    long long v11 = *(_OWORD *)&off_100008328;
    v7[3] = _sl_dlopen();
    qword_10000CC68 = *(void *)(v4[1] + 24);
    uint64_t v0 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  v1 = v3[0];
  if (!v0)
  {
    v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_1000040D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000040F4(uint64_t a1)
{
  v2 = (void *)sub_100003F94();
  uint64_t result = dlsym(v2, "MapKitConfig_SnapshotServiceQueueWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CC70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004144(uint64_t a1)
{
  v2 = (void *)sub_100003F94();
  uint64_t result = dlsym(v2, "MapKitConfig_SnapshotServicePerProcessSerializationEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CC78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004194(uint64_t a1)
{
  v2 = (void *)sub_100003F94();
  uint64_t result = dlsym(v2, "MapKitConfig_SnapshotServiceMaxPixels");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CC80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004628(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(a1 + 32) _cleanupForRequest:v2];
  }
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 requestId]);
  v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v3];
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v3];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v2];
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  [v4 cancel];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004884;
  block[3] = &unk_100008390;
  block[4] = v5;
  dispatch_async(v6, block);
  v7 = sub_100003B2C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v2 requestId];
    unsigned int v9 = [v2 processIdentifier];
    *(_DWORD *)buf = 134349312;
    id v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Canceled request %{public}llu for process %d", buf, 0x12u);
  }

  long long v10 = sub_100003B2C();
  long long v11 = [v2 options];
  v12 = (char *)[v11 signpostId];

  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v12, "RequestSnapshotWithOptions", (const char *)&unk_100007C07, buf, 2u);
  }
}

id sub_100004884(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:0];
}

void sub_100004B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_1000054B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000054C4(uint64_t a1)
{
}

void sub_1000054CC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id v7 = a2;
  [v5 lock];
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:");
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _cleanupForRequest:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  unsigned int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  long long v10 = (void *)os_transaction_create();
  long long v11 = sub_100003B2C();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 56) requestId];
      unsigned int v14 = [*(id *)(a1 + 56) processIdentifier];
      *(_DWORD *)buf = 134349312;
      id v29 = v13;
      __int16 v30 = 1024;
      unsigned int v31 = v14;
      id v15 = "Failed to render snapshot for request %{public}llu for process %d";
      __int16 v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v18 = [*(id *)(a1 + 56) requestId];
    unsigned int v19 = [*(id *)(a1 + 56) processIdentifier];
    *(_DWORD *)buf = 134349312;
    id v29 = v18;
    __int16 v30 = 1024;
    unsigned int v31 = v19;
    id v15 = "Finished rendering snapshot for request %{public}llu for process %d";
    __int16 v16 = v12;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  v20 = sub_100003B2C();
  v21 = [*(id *)(a1 + 56) options];
  v22 = (char *)[v21 signpostId];

  if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v22, "RequestSnapshotWithOptions", (const char *)&unk_100007C07, buf, 2u);
  }

  uint64_t v23 = *(void *)(a1 + 32);
  v24 = *(NSObject **)(v23 + 48);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000578C;
  v26[3] = &unk_1000083B8;
  v26[4] = v23;
  id v27 = v10;
  id v25 = v10;
  dispatch_async(v24, v26);
}

id sub_10000578C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:*(void *)(a1 + 40)];
}

void sub_1000058F8(uint64_t a1)
{
  v2 = objc_alloc_init(_SnapshotRequest);
  [(_SnapshotRequest *)v2 setRequestId:(*(void *)(*(void *)(a1 + 32) + 16))++];
  [(_SnapshotRequest *)v2 setConnection:*(void *)(a1 + 40)];
  -[_SnapshotRequest setProcessIdentifier:](v2, "setProcessIdentifier:", [*(id *)(a1 + 40) processIdentifier]);
  [(_SnapshotRequest *)v2 setOptions:*(void *)(a1 + 48)];
  [(_SnapshotRequest *)v2 setCompletionHandler:*(void *)(a1 + 56)];
  uint64_t v3 = sub_100003B2C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349312;
    unint64_t v8 = [(_SnapshotRequest *)v2 requestId];
    __int16 v9 = 1024;
    unsigned int v10 = [(_SnapshotRequest *)v2 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Enqueuing snapshot request: %{public}llu for process %d", (uint8_t *)&v7, 0x12u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKey:*(void *)(a1 + 40)];
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 64);
  unsigned int v5 = [(_SnapshotRequest *)v2 processIdentifier];
  id v6 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v4 == v5) {
    [v6 addObject:v2];
  }
  else {
    [v6 insertObject:v2 atIndex:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
  [*(id *)(a1 + 32) _startNextSnapshotterIfPossible:0];
}

void sub_100005C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005CF8(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10000CC90)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100005E4C;
    v4[4] = &unk_100008440;
    v4[5] = v4;
    long long v5 = off_100008428;
    uint64_t v6 = 0;
    qword_10000CC90 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_10000CC90)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UIImage");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_10000CC88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005E4C()
{
  uint64_t result = _sl_dlopen();
  qword_10000CC90 = result;
  return result;
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return _CGImageRetain(image);
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

uint64_t GEOConfigGetUInteger()
{
  return _GEOConfigGetUInteger();
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend__auditToken(void *a1, const char *a2, ...)
{
  return [a1 _auditToken];
}

id objc_msgSend__customFeatureAnnotations(void *a1, const char *a2, ...)
{
  return [a1 _customFeatureAnnotations];
}

id objc_msgSend__nextSnapshotRequest(void *a1, const char *a2, ...)
{
  return [a1 _nextSnapshotRequest];
}

id objc_msgSend__snapshotServiceSerialPerProcess(void *a1, const char *a2, ...)
{
  return [a1 _snapshotServiceSerialPerProcess];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contentScale(void *a1, const char *a2, ...)
{
  return [a1 contentScale];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_requestId(void *a1, const char *a2, ...)
{
  return [a1 requestId];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_signpostId(void *a1, const char *a2, ...)
{
  return [a1 signpostId];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}