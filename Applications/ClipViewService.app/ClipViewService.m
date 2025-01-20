void sub_100003870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003890(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000038A0(uint64_t a1)
{
}

void sub_1000038A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = sub_1000039A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "App Clip request finished with error: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

uint64_t sub_1000039A4()
{
  if (qword_10000D2F8 != -1) {
    dispatch_once(&qword_10000D2F8, &stru_1000082A8);
  }
  return qword_10000D2F0;
}

void sub_1000039E8(id a1)
{
  qword_10000D2F0 = (uint64_t)os_log_create("com.apple.ClipViewService", "ClipViewService");

  _objc_release_x1();
}

void sub_100003B2C(id a1, NSError *a2)
{
  v2 = a2;
  v3 = sub_1000039A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004DA4((uint64_t)v2, v3);
  }
}

void sub_100003C10(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForSetting:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    id v13 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v13];
    id v5 = v13;
    if (v4)
    {
      id v6 = objc_alloc_init((Class)UIViewController);
      [v6 setModalPresentationStyle:5];
      v7 = *(void **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100003D98;
      v10[3] = &unk_100008338;
      v10[4] = v7;
      id v11 = v4;
      id v12 = v6;
      id v8 = v6;
      [v7 presentViewController:v8 animated:1 completion:v10];
    }
    else
    {
      id v9 = sub_1000039A4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100004E1C((uint64_t)v5, v9);
      }
    }
  }
}

void sub_100003D98(uint64_t a1)
{
  id v2 = [objc_alloc((Class)CPSLocationConsentViewController) initWithRequest:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  [*(id *)(*(void *)(a1 + 32) + 16) setModalPresentationStyle:2];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_100003EBC;
  id v8 = &unk_100008310;
  objc_copyWeak(&v9, &location);
  [*(id *)(*(void *)(a1 + 32) + 16) setActionHandler:&v5];
  [*(id *)(a1 + 48) presentViewController:*(void *)(*(void *)(a1 + 32) + 16) animated:1 completion:v5, v6, v7, v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_100003E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003EBC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissLocationContentViewControllerAnimated:1 response:a2];
}

void sub_100003FE0(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) canSendResponse])
  {
    id v2 = objc_alloc_init((Class)BSMutableSettings);
    uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v2 setObject:v3 forSetting:0];

    id v4 = *(void **)(*(void *)(a1 + 32) + 8);
    id v5 = +[BSActionResponse responseWithInfo:v2];
    [v4 sendResponse:v5];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0;

  id v10 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v10 dismiss];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t sub_100004220()
{
  v2[0] = 0;
  if (!qword_10000D300)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_100004C10;
    v2[4] = &unk_100008400;
    v2[5] = v2;
    long long v3 = off_1000083E8;
    uint64_t v4 = 0;
    qword_10000D300 = _sl_dlopen();
  }
  uint64_t v0 = qword_10000D300;
  if (!qword_10000D300) {
    sub_100004E94(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void sub_100004600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000046B0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)CPSLaunchContentViewController) initWithURL:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:];
  id v5 = *(void **)(a1 + 32);

  return [v5 _displayLaunchContentViewController];
}

void sub_10000485C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_1000039A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004DA4((uint64_t)v2, v3);
  }
}

void sub_100004930(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_1000039A4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004F14((uint64_t)v2, v3);
  }
}

void sub_100004A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C10()
{
  uint64_t result = _sl_dlopen();
  qword_10000D300 = result;
  return result;
}

Class sub_100004C84(uint64_t a1)
{
  sub_100004220();
  Class result = objc_getClass("PRXFlowConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100005004();
  }
  qword_10000D308 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004CDC(uint64_t a1)
{
  id v2 = (void *)sub_100004220();
  Class result = dlsym(v2, "PRXSupportedInterfaceOrientations");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000D310 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004D2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received an invalid URL from NSUserActivity. %{sensitive}@", (uint8_t *)&v2, 0xCu);
}

void sub_100004DA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "configureWithContext: error when configuring remote view controller proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100004E1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fail to decode location confirmation request with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100004E94(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *ProxCardKitLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"CPSAlertViewController.m" lineNumber:21 description:@"%s" *a1];

  __break(1u);
}

void sub_100004F14(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "configureWithContext: error when preparing remote view controller proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100004F8C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"UIInterfaceOrientationMask _PRXSupportedInterfaceOrientations(UIViewController *__strong, BOOL)"];
  [v0 handleFailureInFunction:v1 file:@"CPSAlertViewController.m" lineNumber:23 description:@"%s" dlerror()];

  __break(1u);
}

void sub_100005004()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  v1 = +[NSString stringWithUTF8String:"Class getPRXFlowConfigurationClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"CPSAlertViewController.m" lineNumber:22 description:@"Unable to find class %s" "PRXFlowConfiguration"];

  __break(1u);
  NSStringFromClass(v2);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__sourceApplication(void *a1, const char *a2, ...)
{
  return [a1 _sourceApplication];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return [a1 canSendResponse];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceHasHomeButton(void *a1, const char *a2, ...)
{
  return [a1 deviceHasHomeButton];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissalInProgress(void *a1, const char *a2, ...)
{
  return [a1 dismissalInProgress];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_sessionProxy(void *a1, const char *a2, ...)
{
  return [a1 sessionProxy];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}