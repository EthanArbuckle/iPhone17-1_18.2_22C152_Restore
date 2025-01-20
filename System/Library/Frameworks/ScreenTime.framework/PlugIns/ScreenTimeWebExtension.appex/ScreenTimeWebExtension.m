void sub_100001C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001C64(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained webpageUsage];
  id v5 = [v3 URL];

  if (v5)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _requestPolicyForURL:v5 replyHandler:0];
  }
}

id sub_100001E80(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _startRecordingUsageForURL:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48) usageState:*(void *)(a1 + 64) replyHandler:*(void *)(a1 + 56)];
  }
}

id sub_100002084(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _requestPolicyForURL:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
  }
}

void sub_1000021DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v8 = [v7 integerValue];

    BOOL v9 = *(void *)(a1 + 48) == 0;
    v10 = +[NSOperationQueue mainQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000236C;
    v14[3] = &unk_100004210;
    BOOL v18 = v8 != 0;
    int8x16_t v13 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v13.i64[0];
    int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
    id v17 = v8;
    BOOL v19 = v9;
    id v16 = *(id *)(a1 + 48);
    [v10 addOperationWithBlock:v14];

    [*(id *)(a1 + 40) _reportURLIsBlocked:v8 != 0];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000029F0(a1, (uint64_t)v6);
    }
  }
}

void sub_10000236C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setOpaque:*(unsigned __int8 *)(a1 + 64)];
  [v3 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 64)];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    [v2 _showBlockingViewControllerForWebpage:*(void *)(a1 + 40) withPolicy:*(void *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 65) replyHandler:*(void *)(a1 + 48)];
  }
  else {
    [v2 _hideBlockingViewControllerWithAnimation:*(unsigned __int8 *)(a1 + 65) replyHandler:*(void *)(a1 + 48)];
  }
}

void sub_100002458(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100002A80((uint64_t)a2);
  }
}

void sub_100002708(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(void **)(a1 + 40);
  id v5 = [v3 webpageUsage];
  id v4 = [v5 URL];
  [v3 _requestPolicyForURL:v4 replyHandler:0];
}

void sub_1000028A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  id v4 = *(void **)(a1 + 40);
  id v6 = [v4 webpageUsage];
  id v5 = [v6 URL];
  [v4 _requestPolicyForURL:v5 replyHandler:0];
}

void sub_1000029F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch policies for %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100002A80(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to get remote view controller proxy: %{public}@", (uint8_t *)&v1, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLIsBlocked(void *a1, const char *a2, ...)
{
  return [a1 URLIsBlocked];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__stWebServiceViewControllerCommonInit(void *a1, const char *a2, ...)
{
  return [a1 _stWebServiceViewControllerCommonInit];
}

id objc_msgSend_blockingViewController(void *a1, const char *a2, ...)
{
  return [a1 blockingViewController];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_newDelegateInterface(void *a1, const char *a2, ...)
{
  return [a1 newDelegateInterface];
}

id objc_msgSend_newServiceInterface(void *a1, const char *a2, ...)
{
  return [a1 newServiceInterface];
}

id objc_msgSend_newTranslucentBlockingViewController(void *a1, const char *a2, ...)
{
  return [a1 newTranslucentBlockingViewController];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webpageUsage(void *a1, const char *a2, ...)
{
  return [a1 webpageUsage];
}

id objc_msgSend_websitePolicyMonitor(void *a1, const char *a2, ...)
{
  return [a1 websitePolicyMonitor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}