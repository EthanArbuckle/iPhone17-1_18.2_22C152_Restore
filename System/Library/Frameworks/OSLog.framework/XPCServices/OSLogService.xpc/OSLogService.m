void sub_100001D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001D40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001D50(uint64_t a1)
{
}

uint64_t sub_100001D58(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_getNextOSLogEntryWithReply:", *(void *)(a1 + 40));

  return _objc_release_x1();
}

void sub_100001E1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void sub_10000230C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  objc_destroyWeak(v37);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_10000247C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = 32;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    uint64_t v6 = 40;
    v7 = v11;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + v6) + 8);
  id v9 = v7;
  v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
}

void sub_100002500(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 type] == (id)1024)
  {
    id v5 = convertEventProxyToEntry();
    uint64_t v6 = WeakRetained[2];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100002768;
    v8[3] = &unk_1000042B0;
    v8[4] = WeakRetained;
    id v9 = v5;
    id v7 = v5;
    dispatch_sync(v6, v8);
  }
}

void sub_1000025D8(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2 != 5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Error invalidation: %d", buf, 8u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (WeakRetained)
  {
    id v5 = WeakRetained[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000271C;
    block[3] = &unk_100004300;
    block[4] = WeakRetained;
    dispatch_sync(v5, block);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_10000271C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

void *sub_100002768(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 48)) {
    return [*(id *)(v1 + 40) addObject:result[5]];
  }
  return result;
}

id sub_10000284C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setupWithPredicate:reply:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_100002A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void start()
{
  unsetenv("TMPDIR");
  bzero(v8, 0x400uLL);
  if (!_set_user_dir_suffix() || !confstr(65537, v8, 0x400uLL))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v0 = *__error();
    int v6 = 67109120;
    int v7 = v0;
    uint64_t v1 = "failed to initialize temporary directory: %{darwin.errno}d";
    goto LABEL_5;
  }
  uint64_t v2 = realpath_DARWIN_EXTSN(v8, 0);
  if (v2)
  {
    free(v2);
    uint64_t v4 = objc_opt_new();
    id v5 = +[NSXPCListener serviceListener];
    [v5 setDelegate:v4];
    [v5 resume];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v3 = *__error();
    int v6 = 67109120;
    int v7 = v3;
    uint64_t v1 = "failed to resolve temporary directory: %{darwin.errno}d";
LABEL_5:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v1, (uint8_t *)&v6, 8u);
  }
LABEL_6:
  exit(1);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return _audit_token_to_pidversion(atoken);
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t convertEventProxyToEntry()
{
  return _convertEventProxyToEntry();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
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