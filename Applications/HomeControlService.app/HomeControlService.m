void sub_100002B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002B64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dropInViewController];
  [v1 beginAppearanceTransition:1 animated:0];

  v2 = [WeakRetained dropInViewController];
  [WeakRetained addChildViewController:v2];

  v3 = [WeakRetained view];
  v4 = [WeakRetained dropInViewController];
  v5 = [v4 view];
  [v3 addSubview:v5];

  v6 = [WeakRetained view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [WeakRetained dropInViewController];
  v16 = [v15 view];
  [v16 setFrame:v8, v10, v12, v14];

  v17 = [WeakRetained dropInViewController];
  [v17 didMoveToParentViewController:WeakRetained];

  v18 = [WeakRetained dropInViewController];
  [v18 endAppearanceTransition];
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100003820(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100003E0C(a1, (uint64_t)v3, v4);
  }
}

void sub_100003A18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100003A3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 events] & 0x10) != 0)
  {
    v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Home button pressed.", buf, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    goto LABEL_9;
  }
  if ([v3 events])
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lock button pressed.", v7, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 40);
LABEL_9:
    *(unsigned char *)(*(void *)(v5 + 8) + 24) = 1;
  }
}

void sub_100003B34(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteViewController];
  id v3 = [v2 view];
  [v3 visibleBounds];
  CGAffineTransformMakeTranslation(&v10, 0.0, -v4);
  uint64_t v5 = [*(id *)(a1 + 32) remoteViewController];
  v6 = [v5 view];
  CGAffineTransform v9 = v10;
  [v6 setTransform:&v9];

  uint64_t v7 = [*(id *)(a1 + 32) remoteViewController];
  double v8 = [v7 view];
  [v8 setAlpha:0.0];
}

void sub_100003C0C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
    [v2 invalidate];
  }
}

void sub_100003D74(const char *a1, NSObject *a2)
{
  id v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ Remote View Controller Proxy is nil, returning", (uint8_t *)&v4, 0xCu);
}

void sub_100003E0C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ Remote View Service Error Handler called with error %@", (uint8_t *)&v6, 0x16u);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t HFLogForCategory()
{
  return _HFLogForCategory();
}

uint64_t HFPlatformSpecificHomeAppBundleID()
{
  return _HFPlatformSpecificHomeAppBundleID();
}

uint64_t HULocalizedString()
{
  return _HULocalizedString();
}

uint64_t NAEmptyResult()
{
  return _NAEmptyResult();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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
  return [super a2];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__layoutAnnounceViewController(void *a1, const char *a2, ...)
{
  return [a1 _layoutAnnounceViewController];
}

id objc_msgSend__layoutDashboardViewController(void *a1, const char *a2, ...)
{
  return [a1 _layoutDashboardViewController];
}

id objc_msgSend__layoutDropInViewController(void *a1, const char *a2, ...)
{
  return [a1 _layoutDropInViewController];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__updateNavigationView(void *a1, const char *a2, ...)
{
  return [a1 _updateNavigationView];
}

id objc_msgSend_announceRecordingViewController(void *a1, const char *a2, ...)
{
  return [a1 announceRecordingViewController];
}

id objc_msgSend_authorizeIfLocked(void *a1, const char *a2, ...)
{
  return [a1 authorizeIfLocked];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_dashboardNavigationView(void *a1, const char *a2, ...)
{
  return [a1 dashboardNavigationView];
}

id objc_msgSend_dashboardViewController(void *a1, const char *a2, ...)
{
  return [a1 dashboardViewController];
}

id objc_msgSend_dropInViewController(void *a1, const char *a2, ...)
{
  return [a1 dropInViewController];
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return [a1 endAppearanceTransition];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_executionEnvironmentDidEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 executionEnvironmentDidEnterBackground];
}

id objc_msgSend_executionEnvironmentWillEnterForeground(void *a1, const char *a2, ...)
{
  return [a1 executionEnvironmentWillEnterForeground];
}

id objc_msgSend_gradientLayer(void *a1, const char *a2, ...)
{
  return [a1 gradientLayer];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAnIPad(void *a1, const char *a2, ...)
{
  return [a1 isAnIPad];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_lockAuthFuture(void *a1, const char *a2, ...)
{
  return [a1 lockAuthFuture];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return [a1 remoteViewController];
}

id objc_msgSend_remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteViewControllerProxy];
}

id objc_msgSend_requestDismissal(void *a1, const char *a2, ...)
{
  return [a1 requestDismissal];
}

id objc_msgSend_runningState(void *a1, const char *a2, ...)
{
  return [a1 runningState];
}

id objc_msgSend_serviceContext(void *a1, const char *a2, ...)
{
  return [a1 serviceContext];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return [a1 sharedDispatcher];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return [a1 visibleBounds];
}

id objc_msgSend_warmup(void *a1, const char *a2, ...)
{
  return [a1 warmup];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}