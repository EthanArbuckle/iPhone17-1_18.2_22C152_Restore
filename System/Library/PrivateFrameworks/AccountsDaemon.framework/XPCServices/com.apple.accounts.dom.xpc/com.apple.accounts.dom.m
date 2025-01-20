void sub_1000043DC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[8];
  void v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100004610;
  v24 = sub_100004620;
  v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004628;
  v14[3] = &unk_100008228;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(void *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v18 = &v20;
  v19 = &v26;
  [v2 enumerateKeysAndObjectsUsingBlock:v14];
  [*(id *)(a1 + 48) _decrementBusyCounterForAccount:*(void *)(a1 + 40)];
  Nanoseconds = _ACSignpostGetNanoseconds();
  v7 = sub_100005828();
  v8 = v7;
  v9 = *(void *)(a1 + 72);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, v9, "PerformActions", (const char *)&unk_100007411, v13, 2u);
  }

  v10 = sub_100005828();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100005ECC((uint64_t *)(a1 + 72), v10, v11, (double)(unint64_t)Nanoseconds / 1000000000.0);
  }

  v12 = *(void *)(a1 + 64);
  if (v12) {
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 16))(v12, *((unsigned __int8 *)v27 + 24), v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

void sub_1000045E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004610(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004620(uint64_t a1)
{
}

void sub_100004628(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v8 = sub_100005828();
  os_signpost_id_t v9 = _ACSignpostCreate();

  v10 = sub_100005828();
  uint64_t v11 = v10;
  unint64_t v36 = v9 - 1;
  os_signpost_id_t spid = v9;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v40 = (os_signpost_id_t)v5;
    __int16 v41 = 1026;
    LODWORD(v42) = [v6 type];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformActionOwner", " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@  Action=%{public,signpost.telemetry:number1,name=Action}d  enableTelemetry=YES ", buf, 0x12u);
  }

  v12 = sub_100005828();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v34 = [v6 type];
    *(_DWORD *)buf = 134218498;
    os_signpost_id_t v40 = v9;
    __int16 v41 = 2114;
    id v42 = v5;
    __int16 v43 = 1026;
    LODWORD(v44) = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: PerformActionOwner  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@  Action=%{public,signpost.telemetry:number1,name=Action}d  enableTelemetry=YES ", buf, 0x1Cu);
  }

  v13 = _ACLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    os_signpost_id_t v40 = (os_signpost_id_t)v5;
    __int16 v41 = 2112;
    id v42 = v6;
    __int16 v43 = 2112;
    uint64_t v44 = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "\"Asking owner of dataclass %@ to perform action %@ for account %@\"", buf, 0x20u);
  }

  v14 = [*(id *)(a1 + 40) _ownerForDataclass:v5];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    id v38 = 0;
    unsigned __int8 v17 = [v14 performAction:v6 forAccount:v15 withChildren:v16 forDataclass:v5 withError:&v38];
    id v18 = v38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v22 = _ACLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100006030((uint64_t)v14, v22);
      }
      v20 = v6;

      id v18 = 0;
      unsigned __int8 v17 = 0;
      BOOL v19 = 1;
      goto LABEL_18;
    }
    unsigned __int8 v17 = [v14 performAction:v6 forAccount:*(void *)(a1 + 32) withChildren:*(void *)(a1 + 48) forDataclass:v5];
    id v18 = 0;
  }
  BOOL v19 = v18 == 0;
  v20 = v6;
  if (!v18 && (v17 & 1) != 0)
  {
    v21 = v7;
    id v18 = 0;
    unsigned __int8 v17 = 1;
    goto LABEL_24;
  }
LABEL_18:
  v21 = v7;
  v23 = _ACLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_100005FB8();
  }

  if (v19)
  {
    uint64_t v24 = +[NSError errorWithDomain:ACErrorDomain code:17 userInfo:0];
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  else
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    id v28 = v18;
    v26 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v28;
  }

LABEL_24:
  _ACSignpostGetNanoseconds();
  v29 = sub_100005828();
  v30 = v29;
  if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, spid, "PerformActionOwner", (const char *)&unk_100007411, buf, 2u);
  }

  v31 = sub_100005828();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100005F4C();
  }

  uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v32 + 24)) {
    unsigned __int8 v33 = v17;
  }
  else {
    unsigned __int8 v33 = 0;
  }
  *(unsigned char *)(v32 + 24) = v33;
}

void sub_100004B7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004CA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004DD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F70(uint64_t a1, void *a2)
{
}

void sub_1000056B0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100005700(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = +[NSXPCListener serviceListener];
  uint64_t v4 = objc_alloc_init(ACDataclassOwnersManagerListener);
  [v3 setDelegate:v4];
  uint64_t v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\"DOM XPC Service resuming...\"", buf, 2u);
  }

  [v3 resume];
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"DOM XPC Service is returning control!\"", v8, 2u);
  }

  return 0;
}

id sub_100005828()
{
  if (qword_10000CA30 != -1) {
    dispatch_once(&qword_10000CA30, &stru_1000082B8);
  }
  v0 = (void *)qword_10000CA28;

  return v0;
}

void sub_10000587C(id a1)
{
  qword_10000CA28 = (uint64_t)os_log_create("com.apple.accounts", "dataclass.signpost");

  _objc_release_x1();
}

void sub_100005974()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: DataclassPreload ", v2);
}

void sub_1000059E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "\"ACRemoteDataclassOwnersManager did preload dataclass owners\"", v1, 2u);
}

void sub_100005A24(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: DataclassPreload ", (uint8_t *)&v2, 0xCu);
}

void sub_100005A9C()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: ActionsForAdding ", v2);
}

void sub_100005B08()
{
  sub_1000056E8();
  sub_1000056B0((void *)&_mh_execute_header, v0, v1, "\"ACRemoteDataclassOwnersManager returning actions %@ for dataclass %@\"");
}

void sub_100005B70()
{
  sub_100005718();
  sub_1000056B0((void *)&_mh_execute_header, v0, v1, "BEGIN [%lld]: ActionsForAdding  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
}

void sub_100005BD8()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: ActionsForDeleting ", v2);
}

void sub_100005C44()
{
  sub_100005718();
  sub_1000056B0((void *)&_mh_execute_header, v0, v1, "BEGIN [%lld]: ActionsForDeleting  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
}

void sub_100005CAC()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: ActionsForEnabling ", v2);
}

void sub_100005D18()
{
  sub_100005718();
  sub_1000056B0((void *)&_mh_execute_header, v0, v1, "BEGIN [%lld]: ActionsForEnabling  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
}

void sub_100005D80()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: ActionsForDisabling ", v2);
}

void sub_100005DEC()
{
  sub_100005718();
  sub_1000056B0((void *)&_mh_execute_header, v0, v1, "BEGIN [%lld]: ActionsForDisabling  Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ");
}

void sub_100005E54(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_1000056B0((void *)&_mh_execute_header, a2, a3, "BEGIN [%lld]: PerformActions actions: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100005ECC(uint64_t *a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v4 = *a1;
  int v5 = 134218240;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  double v8 = a4;
  sub_100005700((void *)&_mh_execute_header, a2, a3, "END [%lld] %fs: PerformActions ", (uint8_t *)&v5);
}

void sub_100005F4C()
{
  sub_1000056D0();
  sub_100005700((void *)&_mh_execute_header, v0, v1, "END [%lld] %fs: PerformActionOwner ", v2);
}

void sub_100005FB8()
{
  sub_1000056E8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "\"Failed to perform actions for dataclass: %@, error: %@\"", v1, 0x16u);
}

void sub_100006030(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "\"Dataclass owner does not implement performAction:forAccount:withChildren:forDataclass: %@\"", (uint8_t *)&v2, 0xCu);
}

void sub_1000060A8(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  __int16 v7 = [a2 bundlePath];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "\"Found dataclass owner at path %@\"", a1, 0xCu);
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
}

uint64_t _ACSignpostCreate()
{
  return __ACSignpostCreate();
}

uint64_t _ACSignpostGetNanoseconds()
{
  return __ACSignpostGetNanoseconds();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return [a1 XPCInterface];
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return [a1 _accountStore];
}

id objc_msgSend__dataclassOwnerBundles(void *a1, const char *a2, ...)
{
  return [a1 _dataclassOwnerBundles];
}

id objc_msgSend__dataclassToOwnerMap(void *a1, const char *a2, ...)
{
  return [a1 _dataclassToOwnerMap];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_dataclasses(void *a1, const char *a2, ...)
{
  return [a1 dataclasses];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}