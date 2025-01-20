BOOL sub_100002FB0(id a1, id a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  BOOL v10;
  int v12;
  id v13;

  v2 = a2;
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Testing Endpoint URL: %@", (uint8_t *)&v12, 0xCu);
  }

  v4 = +[NSURL URLWithString:v2];
  v5 = v4;
  if (v4 && ([v4 host], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 scheme];
    if (![v7 caseInsensitiveCompare:@"http"])
    {
      v10 = 1;
      goto LABEL_12;
    }
    v8 = [v5 scheme];
    v9 = [v8 caseInsensitiveCompare:@"https"];

    if (!v9)
    {
      v10 = 1;
      goto LABEL_13;
    }
    v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005A98(v7);
    }
  }
  else
  {
    v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100005A54(v7);
    }
  }
  v10 = 0;
LABEL_12:

LABEL_13:
  return v10;
}

void sub_100003994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003A14(uint64_t a1)
{
}

void sub_100003A1C(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003AEC;
  v5[3] = &unk_100008290;
  v5[4] = v3;
  v5[5] = v2;
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 80);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  [v2 _testURL:v3 timeout:v4 completion:v5];
}

void sub_100003AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Testing endpoint completed: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  long long v8 = +[NSNumber numberWithLong:a2];
  [v7 setObject:v8 forKey:*(void *)(a1 + 32)];

  if (a2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  objc_sync_exit(v6);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_100003C34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100004CE0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  id v19 = v8;
  uint64_t v13 = [v19 allHeaderFields];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
  id v18 = v9;

  LODWORD(v17) = [v19 statusCode];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005A54(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "URL is invalid", v1, 2u);
}

void sub_100005A98(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "URL scheme is invalid", v1, 2u);
}

void sub_100005ADC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005B48(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005BB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t handleForCategory()
{
  return _handleForCategory();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutorelease(id a1)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectEndDate(void *a1, const char *a2, ...)
{
  return [a1 connectEndDate];
}

id objc_msgSend_connectStartDate(void *a1, const char *a2, ...)
{
  return [a1 connectStartDate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_domainLookupEndDate(void *a1, const char *a2, ...)
{
  return [a1 domainLookupEndDate];
}

id objc_msgSend_domainLookupStartDate(void *a1, const char *a2, ...)
{
  return [a1 domainLookupStartDate];
}

id objc_msgSend_endpointURLs(void *a1, const char *a2, ...)
{
  return [a1 endpointURLs];
}

id objc_msgSend_endpointsInfo(void *a1, const char *a2, ...)
{
  return [a1 endpointsInfo];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_initEndpointsInfo(void *a1, const char *a2, ...)
{
  return [a1 initEndpointsInfo];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestEndDate(void *a1, const char *a2, ...)
{
  return [a1 requestEndDate];
}

id objc_msgSend_requestStartDate(void *a1, const char *a2, ...)
{
  return [a1 requestStartDate];
}

id objc_msgSend_responseEndDate(void *a1, const char *a2, ...)
{
  return [a1 responseEndDate];
}

id objc_msgSend_responseStartDate(void *a1, const char *a2, ...)
{
  return [a1 responseStartDate];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return [a1 transactionMetrics];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}