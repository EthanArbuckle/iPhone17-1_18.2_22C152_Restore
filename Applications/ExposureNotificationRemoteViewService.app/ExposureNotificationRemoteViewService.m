uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = +[UIColor systemBlueColor];
  v6 = +[UIView appearance];
  [v6 setTintColor:v5];

  v7 = UIApplicationMain(a1, a2, 0, 0);
  return v7;
}

void sub_100001E3C(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) activationGroup];
  dispatch_group_leave(v1);
}

void sub_100002080(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationRequest];
  id v3 = [v2 requestType];

  if (v3 == (id)1)
  {
    id v6 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    v4 = [*(id *)(a1 + 32) presentationRequest];
    v5 = [v4 agencyRegion];
    [v6 onboardingDidStartForRegion:v5 source:2];
  }
}

void sub_100002514(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100002554(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000025E8;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    [WeakRetained _handleOnboardingResult:a2 completion:v5];
  }
}

void sub_1000025E8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedViewController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000267C;
  v3[3] = &unk_1000041A0;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

id sub_10000267C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void sub_100002688(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000271C;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    [WeakRetained _handleKeyReleaseDecision:a2 completion:v5];
  }
}

void sub_10000271C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedViewController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000027B0;
  v3[3] = &unk_1000041A0;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

id sub_1000027B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void sub_1000027BC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100002850;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    [WeakRetained _handlePreApprovalDecision:a2 completion:v5];
  }
}

void sub_100002850(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedViewController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000028E4;
  v3[3] = &unk_1000041A0;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

id sub_1000028E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void sub_1000029CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  id v3 = [*(id *)(a1 + 32) presentationRequest];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002A8C;
  v4[3] = &unk_100004218;
  id v5 = *(id *)(a1 + 40);
  [v2 remotePresentationRequestDidComplete:v3 completion:v4];
}

uint64_t sub_100002A8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002B5C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  id v3 = [*(id *)(a1 + 32) presentationRequest];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002C1C;
  v4[3] = &unk_100004218;
  id v5 = *(id *)(a1 + 40);
  [v2 remotePresentationRequestDidComplete:v3 completion:v4];
}

uint64_t sub_100002C1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002CEC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  id v3 = [*(id *)(a1 + 32) presentationRequest];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002DAC;
  v4[3] = &unk_100004218;
  id v5 = *(id *)(a1 + 40);
  [v2 remotePresentationRequestDidComplete:v3 completion:v4];
}

uint64_t sub_100002DAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002E7C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find the matching agency model to start onboarding", v1, 2u);
}

uint64_t ENUILogForCategory()
{
  return _ENUILogForCategory();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__hostViewController(void *a1, const char *a2, ...)
{
  return [a1 _hostViewController];
}

id objc_msgSend_activationGroup(void *a1, const char *a2, ...)
{
  return [a1 activationGroup];
}

id objc_msgSend_agencyRegion(void *a1, const char *a2, ...)
{
  return [a1 agencyRegion];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_defaultAdapter(void *a1, const char *a2, ...)
{
  return [a1 defaultAdapter];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_presentationRequest(void *a1, const char *a2, ...)
{
  return [a1 presentationRequest];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}