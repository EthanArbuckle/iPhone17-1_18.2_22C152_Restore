uint64_t sub_100005670(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

unsigned char *sub_100005A54(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100005A70(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[1] = a1;
  if (location[0])
  {
    objc_storeStrong((id *)a1[4] + 12, location[0]);
    [*((id *)a1[4] + 12) setDelegate:a1[4]];
    [a1[4] _setChildViewController:*((void *)a1[4] + 12)];
    id v4 = [*((id *)a1[4] + 12) view];
    [v4 setAlpha:0.0];

    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    v12 = sub_100005C98;
    v13 = &unk_100018530;
    v14[0] = a1[4];
    +[UIView animateWithDuration:&v9 animations:0.4];
    objc_storeStrong(v14, 0);
  }
  else
  {
    id v8 = (id)SUSUILogAuthenticationUI();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      log = v8;
      os_log_type_t type = v7;
      sub_100005A54(v6);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Failed to create emergency call view controller", v6, 2u);
    }
    objc_storeStrong(&v8, 0);
    [a1[4] _authenticationCancelled];
  }
  objc_storeStrong(location, 0);
}

void sub_100005C98(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 96) view];
  [v1 setAlpha:1.0];
}

void sub_100005E64(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 96) view];
  [v1 setAlpha:0.0];
}

void sub_100005EC4(uint64_t a1)
{
}

id sub_100006238(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setPasscodeViewsToVisible:*(unsigned char *)(a1 + 48) & 1 animated:*(unsigned char *)(a1 + 49) & 1 completion:a1, a1];
}

void sub_1000065DC(uint64_t a1)
{
  v5[2] = (id)a1;
  v5[1] = (id)a1;
  char v3 = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    id v1 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) passcode];
    char v3 = 1;
    id v1 = v4;
  }
  v5[0] = v1;
  if (v3) {

  }
  [*(id *)(a1 + 40) _attemptUnlock:*(void *)(a1 + 32) passcode:v5[0]];
  objc_storeStrong(v5, 0);
}

void sub_100006C00(id *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  id v4 = (void *)*((void *)a1[4] + 4);
  uint64_t v2 = *((void *)a1[4] + 6);
  uint64_t v3 = *((void *)a1[4] + 2);
  v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_100006D3C;
  v9 = &unk_1000185F8;
  id v10 = a1[4];
  v11[0] = a1[5];
  [v4 presentTermsIfNecessaryForUpdate:v2 overController:v3 showLoadSpinner:0];
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
}

void sub_100006D3C(NSObject *a1, char a2, id obj)
{
  id v8 = a1;
  char v7 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)SUSUILogAuthenticationUI();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_100006F34((uint64_t)v9, (uint64_t)v3, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Terms accepted? %@, error: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v7) {
    [(objc_class *)a1[4].isa _termsAgree];
  }
  else {
    [(objc_class *)a1[4].isa _termsDisagree];
  }
  if (!location)
  {
    [*((id *)a1[4].isa + 3) setAlpha:0.0];
    [*((id *)a1[4].isa + 3) setHidden:1];
  }
  if (a1[5].isa) {
    (*((void (**)(void))a1[5].isa + 2))();
  }
  objc_storeStrong(&location, 0);
}

uint64_t sub_100006F34(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_10000765C(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100007848(uint64_t a1)
{
  v13[2] = (id)a1;
  v13[1] = (id)a1;
  v13[0] = objc_alloc_init((Class)SUKeybagOptions);
  [v13[0] setDescriptor:*(void *)(*(void *)(a1 + 32) + 48)];
  [v13[0] setPasscode:*(void *)(a1 + 40)];
  [v13[0] setKeybagType:];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [WeakRetained createInstallationKeybagWithOptions:v13[0]] & 1;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id location = (id)SUSUILogAuthenticationUI();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v11;
      sub_100005A54(v10);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Successfully created installation keybag with passcode!", v10, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v9 = (id)SUSUILogAuthenticationUI();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      id v1 = v9;
      os_log_type_t v2 = v8;
      sub_100005A54(v7);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to create installation keybag with passcode!", v7, 2u);
    }
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v13, 0);
}

void sub_100007C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v19 - 80));
  _Unwind_Resume(a1);
}

void sub_100007CC4(uint64_t a1, char a2)
{
  uint64_t v10 = a1;
  char v9 = a2 & 1;
  location[1] = (id)a1;
  location[0] = (id)SUSUILogAuthenticationUI();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v7;
    sub_100005A54(v6);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismissal completed", v6, 2u);
  }
  objc_storeStrong(location, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndSendCompletionResponse:*(unsigned char *)(a1 + 40) & 1];
}

id sub_100008690(uint64_t a1)
{
  os_log_type_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  double v3 = 1.0;
  if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
    double v3 = 0.0;
  }
  return [v2 setAlpha:v3 a1, a1];
}

id sub_1000086EC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  if (*(unsigned char *)(a1 + 48)) {
    id result = [*(id *)(*(void *)(a1 + 32) + 16) becomeFirstResponder];
  }
  else {
    id result = [*(id *)(*(void *)(a1 + 32) + 16) resignFirstResponder];
  }
  if (*(void *)(a1 + 40)) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return result;
}

uint64_t sub_100009DA8(uint64_t result, uint64_t a2)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_10000A3B4(id *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  v9[0] = (id)SUSUILogLaggardsUI();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v9[0];
    os_log_type_t type = v8;
    id v5 = [a1[4] buildSUSettingsAction:1];
    id v7 = v5;
    sub_10000A54C((uint64_t)v10, (uint64_t)"-[SUSUIScheduleUpdateViewController performUpdateNow]_block_invoke", (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s: Opening the Software Update Settings pane with URL: %@", v10, 0x16u);

    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  id v1 = [a1[4] buildSUSettingsAction:1];
  [v2 openSensitiveURL:withOptions:];
}

uint64_t sub_10000A54C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10000AC98(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void sub_10000AD04(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) cancellationDialogRemindMeLaterButtonTapped:location[0]];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

uint64_t start(int a1, char **a2)
{
  id v2 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0, v4);

  return v8;
}

void sub_10000C290(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), location[0]);
  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _setRootViewController:*(void *)(*(void *)(a1 + 32) + 8)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) view];
  [v2 setAlpha:0.0];

  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10000C440;
  unsigned int v8 = &unk_100018530;
  v9[0] = *(id *)(a1 + 32);
  +[UIView animateWithDuration:&v4 animations:0.4];
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void sub_10000C440(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) view];
  [v1 setAlpha:1.0];
}

void sub_10000C568(uint64_t a1)
{
  [*(id *)(a1 + 32) _fireActionWithResponseIfNecessary:0];
  id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 dismiss];
}

void sub_10000C7FC(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) view];
  [v1 setAlpha:0.0];
}

void sub_10000C85C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];
}

id sub_10000DDA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

uint64_t sub_10000DF78(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)id result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_10000E46C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) == dword_100020238)
  {
    id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
    [v1 setIdleTimerDisabled:0 forReason:@"reset"];
  }
}

uint64_t sub_10000F958(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_10000FBF8(id *a1)
{
  v8[2] = a1;
  v8[1] = a1;
  dispatch_queue_t queue = &_dispatch_main_q;
  double v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10000FCD0;
  id v7 = &unk_100018530;
  v8[0] = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

void sub_10000FCD0(id *a1)
{
  v7[2] = a1;
  v7[1] = a1;
  id v1 = (void *)*((void *)a1[4] + 1);
  id v2 = _NSConcreteStackBlock;
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = sub_10000FDA0;
  int v6 = &unk_100018530;
  v7[0] = a1[4];
  [v1 dismissViewControllerAnimated:1];
  objc_storeStrong(v7, 0);
}

void sub_10000FDA0(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = (id)SUSUILogLaggardsUI();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v4, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController handleCancelButtonTapped:]_block_invoke_3");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Dismissed controller", v4, 0xCu);
  }
  objc_storeStrong(location, 0);
  [a1[4] _fireActionWithResponseIfNecessary:0];
  id v1 = [a1[4] _remoteViewControllerProxy];
  [v1 dismiss];
}

void sub_10000FED0(NSObject *a1, char a2)
{
  int v6 = a1;
  char v5 = a2 & 1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      CFStringRef v2 = @"YES";
    }
    else {
      CFStringRef v2 = @"NO";
    }
    sub_10000A54C((uint64_t)v7, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController handleCancelButtonTapped:]_block_invoke", (uint64_t)v2);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: should proceed with dialog cancellation: %@", v7, 0x16u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v5) {
    (*((void (**)(void))a1[4].isa + 2))();
  }
}

void sub_100010100(uint64_t a1)
{
  [*(id *)(a1 + 32) _fireActionWithResponseIfNecessary:0];
  id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 dismiss];
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SUSUILog()
{
  return _SUSUILog();
}

uint64_t SUSUILogAuthenticationUI()
{
  return _SUSUILogAuthenticationUI();
}

uint64_t SUSUILogEmergencyCallUI()
{
  return _SUSUILogEmergencyCallUI();
}

uint64_t SUSUILogLaggardsUI()
{
  return _SUSUILogLaggardsUI();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__authenticationCancelled(void *a1, const char *a2, ...)
{
  return [a1 _authenticationCancelled];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__sendDeactivationResponseFailureIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _sendDeactivationResponseFailureIfNecessary];
}

id objc_msgSend__shouldShowPasscodeView(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowPasscodeView];
}

id objc_msgSend__termsAgree(void *a1, const char *a2, ...)
{
  return [a1 _termsAgree];
}

id objc_msgSend__termsDisagree(void *a1, const char *a2, ...)
{
  return [a1 _termsDisagree];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return [a1 alertType];
}

id objc_msgSend_allowCancel(void *a1, const char *a2, ...)
{
  return [a1 allowCancel];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return [a1 alphaComponent];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_autoInstallForecast(void *a1, const char *a2, ...)
{
  return [a1 autoInstallForecast];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_canDeferInstallation(void *a1, const char *a2, ...)
{
  return [a1 canDeferInstallation];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return [a1 combinedTintColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_createPasscodeView(void *a1, const char *a2, ...)
{
  return [a1 createPasscodeView];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_documentation(void *a1, const char *a2, ...)
{
  return [a1 documentation];
}

id objc_msgSend_enableSwipeToCancel(void *a1, const char *a2, ...)
{
  return [a1 enableSwipeToCancel];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forInstallTonight(void *a1, const char *a2, ...)
{
  return [a1 forInstallTonight];
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 hasPasscodeSet];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_installTonightPasscodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 installTonightPasscodeLockViewForUsersCurrentStyle];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isSplatOnly(void *a1, const char *a2, ...)
{
  return [a1 isSplatOnly];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return [a1 passcode];
}

id objc_msgSend_passcodeLockView(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockView];
}

id objc_msgSend_passcodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockViewForUsersCurrentStyle];
}

id objc_msgSend_performUpdateNow(void *a1, const char *a2, ...)
{
  return [a1 performUpdateNow];
}

id objc_msgSend_performUpdateTonight(void *a1, const char *a2, ...)
{
  return [a1 performUpdateTonight];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return [a1 productSystemName];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return [a1 resetForFailedPasscode];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rollbackDescriptor(void *a1, const char *a2, ...)
{
  return [a1 rollbackDescriptor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return [a1 topItem];
}

id objc_msgSend_updateIcon(void *a1, const char *a2, ...)
{
  return [a1 updateIcon];
}

id objc_msgSend_updateStatusText(void *a1, const char *a2, ...)
{
  return [a1 updateStatusText];
}

id objc_msgSend_useNavigationController(void *a1, const char *a2, ...)
{
  return [a1 useNavigationController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}