uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v5 = UIApplicationMain(a1, a2, 0, 0);
  return v5;
}

void sub_100003A3C(id a1)
{
  id v1 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  [v1 openApplication:@"com.apple.springboard" withOptions:0 completion:&stru_1000082B0];
}

void sub_100003A98(id a1, BSProcessHandle *a2, NSError *a3)
{
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100005098();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Returned to Springboard.", v6, 2u);
  }
}

void sub_100003CE0(id a1)
{
}

id sub_100003D9C(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v2 = *(void **)(a1 + 32);

  return [v2 _restrictionsPINControllerDidDismiss:1];
}

uint64_t sub_100003EFC(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [*(id *)(a1 + 32) _restrictionsPINControllerDidDismiss:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_1000042BC(id a1, NSError *a2)
{
  v2 = a2;
  v3 = +[STLog remoteViewService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100005170();
  }
}

void sub_100004318(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[STLog remoteViewService];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000051D8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client completed with success", (uint8_t *)&v7, 0xCu);
  }
}

void sub_100004400(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = +[STLog remoteViewService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100005170();
  }
}

void sub_10000445C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[STLog remoteViewService];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000051D8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Client completed with success", (uint8_t *)&v7, 0xCu);
  }
}

void sub_100004664(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = +[STLog remoteViewService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100005170();
  }
}

void sub_1000046C0(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = +[STLog remoteViewService];
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005244();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client completed with success", v5, 2u);
  }
}

void sub_10000475C(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = +[STLog remoteViewService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100005170();
  }
}

void sub_1000047B8(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = +[STLog remoteViewService];
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005244();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client completed with success", v5, 2u);
  }
}

void sub_100004A54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004A94(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100004C3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustToSuperviewFrame];
}

id sub_100004C44(uint64_t a1)
{
  [*(id *)(a1 + 32) setPrefersStatusBarHiddenOverride:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setNeedsStatusBarAppearanceUpdate];
}

void sub_100004D6C(id a1)
{
  id v1 = (id)MGGetStringAnswer();
  byte_10000D348 = [v1 isEqualToString:@"iPad"];
}

void sub_100005098()
{
  sub_100004A70();
  sub_100004A54((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to return to Springboard: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100005108()
{
  sub_100004A70();
  sub_100004A54((void *)&_mh_execute_header, v0, v1, "%{public}@: Unable to provide pin to client: no connection", v2, v3, v4, v5, v6);
}

void sub_100005170()
{
  sub_100004A70();
  sub_100004A54((void *)&_mh_execute_header, v0, v1, "Unable to connect to client: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000051D8()
{
  sub_100004A7C();
  sub_100004A94((void *)&_mh_execute_header, v0, v1, "%{public}@: Client completed with error: %{public}@");
}

void sub_100005244()
{
  sub_100004A70();
  sub_100004A54((void *)&_mh_execute_header, v0, v1, "Client completed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000052AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed validating restrictions PIN", v1, 2u);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

const char *getprogname(void)
{
  return _getprogname();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__freezeSupportedOrientations(void *a1, const char *a2, ...)
{
  return [a1 _freezeSupportedOrientations];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend_additionalParameters(void *a1, const char *a2, ...)
{
  return [a1 additionalParameters];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientBundleID];
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return [a1 clientConnection];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissPinController(void *a1, const char *a2, ...)
{
  return [a1 dismissPinController];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastKnownSuperviewFrame(void *a1, const char *a2, ...)
{
  return [a1 lastKnownSuperviewFrame];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_passcodeMode(void *a1, const char *a2, ...)
{
  return [a1 passcodeMode];
}

id objc_msgSend_prefersStatusBarHiddenOverride(void *a1, const char *a2, ...)
{
  return [a1 prefersStatusBarHiddenOverride];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_remoteViewService(void *a1, const char *a2, ...)
{
  return [a1 remoteViewService];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}