int main(int argc, const char **argv, const char **envp)
{
  id v3;
  void *v4;
  DESRecordStoreServiceListenerDelegate *v5;
  void *v6;
  NSObject *v7;
  int v8;
  _DWORD v10[2];

  if (_set_user_dir_suffix())
  {
    v3 = NSTemporaryDirectory();
    +[NSXPCListener enableTransactions];
    v5 = objc_alloc_init(DESRecordStoreServiceListenerDelegate);
    v6 = +[NSXPCListener serviceListener];
    [v6 setDelegate:v5];
    [v6 resume];
  }
  else
  {
    v7 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = *__error();
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed™: %{darwin.errno}d", (uint8_t *)v10, 8u);
    }
  }
  exit(1);
}

void sub_100001810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001834(id a1)
{
  v1 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "In connection interruption handler.", v2, 2u);
  }
}

void sub_1000018A4(uint64_t a1)
{
  v2 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100002B48();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 2) invalidate];
    v5 = (void *)v4[2];
    v4[2] = 0;

    v6 = (void *)v4[1];
    v4[1] = 0;
  }
}

void sub_100001A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001AB8(id a1)
{
  v1 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "In forward connection interruption handler.", v2, 2u);
  }
}

void sub_100001B28(uint64_t a1)
{
  v2 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100002B88();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001BF8;
    block[3] = &unk_100004258;
    v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

void sub_100001BF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_100001DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100002C08((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

id sub_100002050(uint64_t a1, void *a2)
{
  return [a2 fetchInstalledBundlesIdsWithCompletion:*(void *)(a1 + 32)];
}

uint64_t sub_10000205C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000022E8(void *a1, void *a2)
{
  return [a2 saveRecordForBundleId:a1[4] data:a1[5] recordInfo:a1[6] completion:a1[7]];
}

uint64_t sub_1000022F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002428(uint64_t a1, void *a2)
{
  return [a2 fetchSavedRecordInfoForRecordType:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_100002434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000025B4(uint64_t a1, void *a2)
{
  return [a2 deleteAllSavedRecordsForBundleId:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_1000025C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002758(void *a1, void *a2)
{
  return [a2 deleteSavedRecordForBundleId:a1[4] identfier:a1[5] completion:a1[6]];
}

uint64_t sub_100002768(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002890(uint64_t a1, void *a2)
{
  return [a2 saveCoreDuetEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

uint64_t sub_10000289C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002AC4(void *a1, void *a2)
{
  return [a2 fetchNativeRecordDataForRecordUUID:a1[4] bundleId:a1[5] completion:a1[6]];
}

uint64_t sub_100002AD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002B48()
{
  sub_100002B3C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "In connection invalid handler.", v1, 2u);
}

void sub_100002B88()
{
  sub_100002B3C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "In forward connection invalid handler.", v1, 2u);
}

void sub_100002BC8()
{
  sub_100002B3C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Fail to create remote object proxy for forward connection", v1, 2u);
}

void sub_100002C08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "In error handler of forward connection with error=%@.", (uint8_t *)&v2, 0xCu);
}

void sub_100002C80()
{
  sub_100002B3C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "This is reserved for DESTool only.", v1, 2u);
}

uint64_t DESServiceGetXPCInterface()
{
  return _DESServiceGetXPCInterface();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_msgSend_coreChannel(void *a1, const char *a2, ...)
{
  return [a1 coreChannel];
}

id objc_msgSend_createForwardConnection(void *a1, const char *a2, ...)
{
  return [a1 createForwardConnection];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}