uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_1000050C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAccount:a2];
}

uint64_t sub_100005354(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _viewControllerProxy];
  [v2 dismiss];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

id sub_10000560C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventType:@"click"];
  [v3 setProperty:@"button" forBodyKey:@"targetType"];
  [v3 setProperty:@"com.apple.AskPermissionUI" forBodyKey:@"hostApp"];
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 <= 2)
  {
    v5 = off_100018610[v4];
    [v3 setProperty:off_1000185F8[v4] forBodyKey:@"targetId"];
    [v3 setProperty:v5 forBodyKey:@"actionType"];
  }
  v6 = +[AMSPromise promiseWithResult:v3];

  return v6;
}

void sub_100005C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_100005C78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = +[APLogConfig sharedUIServiceConfig];
  v7 = (void *)v6;
  if (v4)
  {
    if (!v6)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v9 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error loading store product view controller. Error: %{public}@", buf, 0x16u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005E78;
    block[3] = &unk_1000184B0;
    block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (!v6)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = (id)objc_opt_class();
      id v11 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded store product view controller succesfully", buf, 0xCu);
    }
  }
}

id sub_100005E78(uint64_t a1)
{
  return [*(id *)(a1 + 32) productViewControllerDidFinishWithAction:3];
}

void sub_100006164(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100006180(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = +[APLogConfig sharedUIServiceConfig];
  if (!v5)
  {
    v5 = +[APLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: Remote view controller proxy error. Error:%{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100006454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006474(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_100006688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000066B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = +[APLogConfig sharedUIServiceConfig];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v3;
      id v8 = v14;
      id v9 = "%{public}@: Error updating request. Error: %{public}@";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Updated request succesfully";
      __int16 v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }
}

void sub_100006B74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_100006BC0(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v5 = [v2 bag];
    id v4 = +[AMSMetrics internalInstanceUsingBag:v5];
    [v4 enqueueEvent:v3];
  }
}

void sub_100006C50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRequestWithAction:0];
}

void sub_100006C94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateRequestWithAction:1];
}

Class sub_100006E1C(uint64_t a1)
{
  sub_100006E74();
  Class result = objc_getClass("SKStoreProductViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000FAF8();
  }
  qword_10001FC00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006E74()
{
  v3[0] = 0;
  if (!qword_10001FC08)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100006F74;
    v3[4] = &unk_1000185D8;
    v3[5] = v3;
    long long v4 = off_1000185C0;
    uint64_t v5 = 0;
    qword_10001FC08 = _sl_dlopen();
  }
  uint64_t v0 = qword_10001FC08;
  v1 = (void *)v3[0];
  if (!qword_10001FC08)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100006F74()
{
  uint64_t result = _sl_dlopen();
  qword_10001FC08 = result;
  return result;
}

void *sub_100006FE8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006E74();
  uint64_t result = dlsym(v2, "SKStoreProductParameterITunesItemIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001FC10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000CFC0(id a1)
{
  v1 = (void *)qword_10001FC20;
  qword_10001FC20 = (uint64_t)&off_100019A30;
}

void sub_10000EC84(id a1)
{
  v1 = +[APLogConfig sharedDaemonConfig];
  if (!v1)
  {
    v1 = +[APLogConfig sharedConfig];
  }
  uint64_t v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM, stopping daemon", v3, 2u);
  }

  exit(0);
}

void sub_10000F5AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:AKAuthenticationDSIDKey];
  id v8 = [v5 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  __int16 v10 = [v5 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v6)
  {
    uint32_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint32_t v12 = +[APLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      id v28 = v6;
      id v14 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to authenticate user. Error: %{public}@", (uint8_t *)&v25, 0x16u);
    }
LABEL_26:

    v21 = APError();
    v20 = 0;
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 stringValue], __int16 v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    uint32_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint32_t v12 = +[APLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v22 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no DSID", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  if (!v9)
  {
    uint32_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint32_t v12 = +[APLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v23 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no password", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  uint64_t v16 = +[APLogConfig sharedDaemonConfig];
  uint32_t v12 = (void *)v16;
  if (!v11)
  {
    if (!v16)
    {
      uint32_t v12 = +[APLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v24 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no username", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  if (!v16)
  {
    uint32_t v12 = +[APLogConfig sharedConfig];
  }
  v17 = [v12 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    id v26 = (id)objc_opt_class();
    id v18 = v26;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticated user succesfully", (uint8_t *)&v25, 0xCu);
  }
  v19 = [v7 stringValue];
  v20 = [[User alloc] initWithDSID:v19 username:v11 password:v9 biometricsToken:0];

  v21 = 0;
LABEL_27:
  (*(void (**)(void, User *, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v20, v21);
}

void sub_10000FAD4()
{
}

void sub_10000FAF8()
{
}

uint64_t APCustomError()
{
  return _APCustomError();
}

uint64_t APError()
{
  return _APError();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend__copyKeychainQuery(void *a1, const char *a2, ...)
{
  return [a1 _copyKeychainQuery];
}

id objc_msgSend__countryCodes(void *a1, const char *a2, ...)
{
  return [a1 _countryCodes];
}

id objc_msgSend__loadWebsite(void *a1, const char *a2, ...)
{
  return [a1 _loadWebsite];
}

id objc_msgSend__presentErrorAlert(void *a1, const char *a2, ...)
{
  return [a1 _presentErrorAlert];
}

id objc_msgSend__presentStoreProductViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentStoreProductViewController];
}

id objc_msgSend__presentWebProductViewController(void *a1, const char *a2, ...)
{
  return [a1 _presentWebProductViewController];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return [a1 _run];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return [a1 _setup];
}

id objc_msgSend__setupNavigationItem(void *a1, const char *a2, ...)
{
  return [a1 _setupNavigationItem];
}

id objc_msgSend__viewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _viewControllerProxy];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_actionDelegate(void *a1, const char *a2, ...)
{
  return [a1 actionDelegate];
}

id objc_msgSend_activityIndicatorView(void *a1, const char *a2, ...)
{
  return [a1 activityIndicatorView];
}

id objc_msgSend_ageRating(void *a1, const char *a2, ...)
{
  return [a1 ageRating];
}

id objc_msgSend_approve(void *a1, const char *a2, ...)
{
  return [a1 approve];
}

id objc_msgSend_approverDSID(void *a1, const char *a2, ...)
{
  return [a1 approverDSID];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return [a1 bag];
}

id objc_msgSend_bannerLabel(void *a1, const char *a2, ...)
{
  return [a1 bannerLabel];
}

id objc_msgSend_biometricsToken(void *a1, const char *a2, ...)
{
  return [a1 biometricsToken];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_canSendViaMessages(void *a1, const char *a2, ...)
{
  return [a1 canSendViaMessages];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return [a1 childViewController];
}

id objc_msgSend_compile(void *a1, const char *a2, ...)
{
  return [a1 compile];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createdDate(void *a1, const char *a2, ...)
{
  return [a1 createdDate];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decline(void *a1, const char *a2, ...)
{
  return [a1 decline];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isMocked(void *a1, const char *a2, ...)
{
  return [a1 isMocked];
}

id objc_msgSend_isSubscription(void *a1, const char *a2, ...)
{
  return [a1 isSubscription];
}

id objc_msgSend_itemBundleID(void *a1, const char *a2, ...)
{
  return [a1 itemBundleID];
}

id objc_msgSend_itemBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemBundleIdentifier];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return [a1 itemDescription];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_itemTitle(void *a1, const char *a2, ...)
{
  return [a1 itemTitle];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedPrice(void *a1, const char *a2, ...)
{
  return [a1 localizedPrice];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_offerName(void *a1, const char *a2, ...)
{
  return [a1 offerName];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 pinchGestureRecognizer];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_previewURL(void *a1, const char *a2, ...)
{
  return [a1 previewURL];
}

id objc_msgSend_priceSummary(void *a1, const char *a2, ...)
{
  return [a1 priceSummary];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_productTypeName(void *a1, const char *a2, ...)
{
  return [a1 productTypeName];
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return [a1 productURL];
}

id objc_msgSend_removeToken(void *a1, const char *a2, ...)
{
  return [a1 removeToken];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return [a1 requestInfo];
}

id objc_msgSend_requestString(void *a1, const char *a2, ...)
{
  return [a1 requestString];
}

id objc_msgSend_requestSummary(void *a1, const char *a2, ...)
{
  return [a1 requestSummary];
}

id objc_msgSend_requesterDSID(void *a1, const char *a2, ...)
{
  return [a1 requesterDSID];
}

id objc_msgSend_requesterName(void *a1, const char *a2, ...)
{
  return [a1 requesterName];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return [a1 separatorView];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return [a1 sharedBag];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedDaemonConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemonConfig];
}

id objc_msgSend_sharedUIServiceConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedUIServiceConfig];
}

id objc_msgSend_starRating(void *a1, const char *a2, ...)
{
  return [a1 starRating];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thumbnailURLString(void *a1, const char *a2, ...)
{
  return [a1 thumbnailURLString];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return [a1 webView];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}