uint64_t sub_100003C80(uint64_t a1)
{
  uint64_t (*v2)(void);
  uint64_t vars8;

  [*(id *)(a1 + 32) _waitForPromises];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

id sub_100003E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(*(id *)(a1 + 32), "_bagContract", (void)v15);
        v12 = [v10 postMetricsWithBagContract:v11];

        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    +[AMSPromise promiseWithAll:v4];
  }
  else {
  v13 = +[AMSPromise promiseWithResult:&__NSArray0__struct];
  }

  return v13;
}

uint64_t sub_100003FA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000040FC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedFollowUpConfig];
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      v10 = *(void **)(a1 + 32);
      id v11 = v9;
      v12 = [v10 item];
      v13 = [v12 logKey];
      int v20 = 138543618;
      v21 = v9;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Follow up cleared", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      long long v15 = *(void **)(a1 + 32);
      id v16 = v14;
      long long v17 = [v15 item];
      long long v18 = [v17 logKey];
      v19 = AMSLogableError();
      int v20 = 138543874;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v18;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to clear follow up. Error = %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
}

void sub_100004414(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedFollowUpConfig];
  id v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      v10 = *(void **)(a1 + 32);
      id v11 = v9;
      v12 = [v10 item];
      v13 = [v12 logKey];
      int v20 = 138543618;
      v21 = v9;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully performed the follow up action.", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      long long v15 = *(void **)(a1 + 32);
      id v16 = v14;
      long long v17 = [v15 item];
      long long v18 = [v17 logKey];
      v19 = AMSLogableError();
      int v20 = 138543874;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v18;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform the follow up action. Error = %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
}

void sub_100004700(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      v10 = *(void **)(a1 + 32);
      id v11 = v9;
      v12 = [v10 item];
      v13 = [v12 logKey];
      AMSLogableError();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543874;
      __int16 v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      __int16 v25 = 2114;
      CFStringRef v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to flush action metrics. Error = %{public}@", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    CFStringRef v15 = @"skipped";
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 BOOLValue]) {
      CFStringRef v15 = @"posted";
    }
    id v7 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      long long v17 = *(void **)(a1 + 32);
      id v18 = v16;
      v19 = [v17 item];
      int v20 = [v19 logKey];
      int v21 = 138543874;
      __int16 v22 = v16;
      __int16 v23 = 2114;
      __int16 v24 = v20;
      __int16 v25 = 2114;
      CFStringRef v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Follow up action metrics %{public}@", (uint8_t *)&v21, 0x20u);
    }
  }
}

void sub_100004A34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activePromises];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_100004B90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 item];
      v12 = [v11 logKey];
      v13 = AMSLogableError();
      int v21 = 138543874;
      __int16 v22 = v8;
      __int16 v23 = 2114;
      __int16 v24 = v12;
      __int16 v25 = 2114;
      CFStringRef v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine URL type. Error = %{public}@", (uint8_t *)&v21, 0x20u);
    }
  }
  else if ([a2 integerValue] == (id)1)
  {
    v14 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    CFStringRef v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      long long v17 = *(void **)(a1 + 32);
      id v18 = v16;
      v19 = [v17 item];
      int v20 = [v19 logKey];
      int v21 = 138543618;
      __int16 v22 = v16;
      __int16 v23 = 2114;
      __int16 v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Follow Up is web legacy type@", (uint8_t *)&v21, 0x16u);
    }
    [*(id *)(a1 + 32) _presentLegacyAccountViewController];
  }
  else
  {
    [*(id *)(a1 + 32) _presentEngagementAccountViewControllerWithBag:*(void *)(a1 + 40)];
  }
}

void sub_100004FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004FFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000500C(uint64_t a1)
{
}

void sub_100005014(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[AMSLogConfig sharedFollowUpConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to run engagement task. %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v6 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      v12 = AMSLogKey();
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task finished successfully. Clearing follow up", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _enqueueClearFollowUp];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _dismiss];
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

id sub_10000529C(uint64_t a1)
{
  [*(id *)(a1 + 32) _waitForPromises];
  id v2 = *(void **)(a1 + 32);
  return [v2 finishProcessing];
}

void sub_10000550C(uint64_t a1)
{
  id v2 = +[UIColor whiteColor];
  id v3 = [*(id *)(a1 + 32) accountViewController];
  id v4 = [v3 view];
  [v4 setBackgroundColor:v2];

  uint64_t v5 = [*(id *)(a1 + 32) accountViewController];
  [v5 setModalPresentationStyle:2];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 accountViewController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

void sub_1000057C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000057E4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [WeakRetained item];
    uint64_t v8 = [v7 logKey];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    int v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing host controller", buf, 0x16u);
  }
  [WeakRetained setAccountViewController:0];
  v9 = [WeakRetained internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059B0;
  block[3] = &unk_100008398;
  objc_copyWeak(&v11, v1);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void sub_1000059B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _waitForPromises];
  [WeakRetained finishProcessing];
}

Class sub_100005B94()
{
  if (qword_10000D2A0 != -1) {
    dispatch_once(&qword_10000D2A0, &stru_1000083D8);
  }
  Class result = objc_getClass("SKAccountPageViewController");
  qword_10000D298 = (uint64_t)result;
  off_10000D230 = (uint64_t (*)())sub_100005BF8;
  return result;
}

id sub_100005BF8()
{
  return (id)qword_10000D298;
}

void sub_100005C04(id a1)
{
  qword_10000D2A8 = (uint64_t)dlopen("/System/Library/Frameworks/StoreKit.framework/StoreKit", 2);
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

void objc_enumerationMutation(id obj)
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

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend__bagContract(void *a1, const char *a2, ...)
{
  return [a1 _bagContract];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__enqueueClearFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _enqueueClearFollowUp];
}

id objc_msgSend__enqueueFollowUpAction(void *a1, const char *a2, ...)
{
  return [a1 _enqueueFollowUpAction];
}

id objc_msgSend__enqueueMetricsForAction(void *a1, const char *a2, ...)
{
  return [a1 _enqueueMetricsForAction];
}

id objc_msgSend__keySet(void *a1, const char *a2, ...)
{
  return [a1 _keySet];
}

id objc_msgSend__presentAccountViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentAccountViewController];
}

id objc_msgSend__presentLegacyAccountViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentLegacyAccountViewController];
}

id objc_msgSend__waitForPromises(void *a1, const char *a2, ...)
{
  return [a1 _waitForPromises];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountViewController(void *a1, const char *a2, ...)
{
  return [a1 accountViewController];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activePromises(void *a1, const char *a2, ...)
{
  return [a1 activePromises];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return [a1 createBagForSubProfile];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_followUp(void *a1, const char *a2, ...)
{
  return [a1 followUp];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_logKey(void *a1, const char *a2, ...)
{
  return [a1 logKey];
}

id objc_msgSend_pendingFollowUps(void *a1, const char *a2, ...)
{
  return [a1 pendingFollowUps];
}

id objc_msgSend_presentEngagement(void *a1, const char *a2, ...)
{
  return [a1 presentEngagement];
}

id objc_msgSend_requiresFollowUpUI(void *a1, const char *a2, ...)
{
  return [a1 requiresFollowUpUI];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedFollowUpConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedFollowUpConfig];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewHasAppeared(void *a1, const char *a2, ...)
{
  return [a1 viewHasAppeared];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}