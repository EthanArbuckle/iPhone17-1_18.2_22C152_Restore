uint64_t start(int a1, char **a2)
{
  NSObject *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;

  if (qword_100011D78 != -1) {
    dispatch_once(&qword_100011D78, &stru_10000C290);
  }
  v4 = qword_100011D80;
  if (os_log_type_enabled((os_log_t)qword_100011D80, OS_LOG_TYPE_DEBUG)) {
    sub_1000072F8(v4);
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_10000374C(id a1)
{
  qword_100011D80 = (uint64_t)os_log_create("com.apple.AppSSO", "AppSSOUIService");

  _objc_release_x1();
}

void sub_1000037E4(id a1)
{
  qword_100011D88 = (uint64_t)dispatch_queue_create("com.apple.AppSSO.ui-queue", 0);

  _objc_release_x1();
}

id sub_1000038F4()
{
  if (qword_100011D98 != -1) {
    dispatch_once(&qword_100011D98, &stru_10000C338);
  }
  v0 = (void *)qword_100011DA0;

  return v0;
}

void sub_100003CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100003CF8()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100011DA8;
  uint64_t v7 = qword_100011DA8;
  if (!qword_100011DA8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100004148;
    v3[3] = &unk_10000C360;
    v3[4] = &v4;
    sub_100004148((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100003DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003DDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    v3 = sub_1000038F4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000745C();
    }
  }
}

void sub_100003E44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_1000038F4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1000074C4();
    }
  }
}

void sub_100004040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004058(id a1, NSError *a2)
{
  v2 = a2;
  v3 = sub_1000038F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100007570();
  }
}

void sub_100004104(id a1)
{
  qword_100011DA0 = (uint64_t)os_log_create("com.apple.AppSSO", "SOUIDaemonConnection");

  _objc_release_x1();
}

void sub_100004148(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOInternalProtocols");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100011DA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000075E4();
    sub_1000041A0();
  }
}

void sub_1000041A0()
{
  v1[0] = 0;
  if (!qword_100011DB0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000429C;
    v1[4] = &unk_10000C398;
    v1[5] = v1;
    long long v2 = off_10000C380;
    uint64_t v3 = 0;
    qword_100011DB0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100011DB0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000429C()
{
  uint64_t result = _sl_dlopen();
  qword_100011DB0 = result;
  return result;
}

void sub_100004310(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100011DB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000760C();
    sub_100004368();
  }
}

void sub_100004374(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_10000444C()
{
  if (qword_100011DC0 != -1) {
    dispatch_once(&qword_100011DC0, &stru_10000C3B8);
  }
  v0 = (void *)qword_100011DC8;

  return v0;
}

void sub_10000488C(id a1)
{
  qword_100011DC8 = (uint64_t)os_log_create("com.apple.AppSSO", "SOUIServiceAppDelegate");

  _objc_release_x1();
}

id sub_1000049A4()
{
  if (qword_100011DD0 != -1) {
    dispatch_once(&qword_100011DD0, &stru_10000C530);
  }
  v0 = (void *)qword_100011DD8;

  return v0;
}

id sub_100005778()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100011DE0;
  uint64_t v7 = qword_100011DE0;
  if (!qword_100011DE0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000070B0;
    v3[3] = &unk_10000C360;
    v3[4] = &v4;
    sub_1000070B0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100005844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000585C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = sub_1000049A4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestAuthorizationViewControllerWithCompletion: remoteViewController = %{public}@, error = %{public}@", buf, 0x16u);
  }

  uint64_t v9 = *(id **)(a1 + 32);
  if (v6)
  {
    objc_storeStrong(v9 + 3, a2);
    [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:];
    uint64_t v10 = [*(id *)(a1 + 40) identifier];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = v10;

    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(v13 + 16);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100005A50;
    v18[3] = &unk_10000C3E0;
    v18[4] = v13;
    id v19 = v14;
    [v15 beginAuthorizationWithRequestParameters:v19 completion:v18];
  }
  else
  {
    v16 = [*(id *)(a1 + 40) identifier];
    v17 = [sub_100005778() errorWithCode:-1000 message:@"Missing remote view controller" suberror:v7];
    [v9 authorization:v16 didCompleteWithCredential:0 error:v17];
  }
}

void sub_100005A50(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_1000049A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240450;
    v9[1] = a2;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithRequestParameters: %{public}d, %{public}@", (uint8_t *)v9, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [*(id *)(a1 + 40) identifier];
    [v7 authorization:v8 didCompleteWithCredential:0 error:v5];
  }
}

id sub_100005E40()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100011DF0;
  uint64_t v7 = qword_100011DF0;
  if (!qword_100011DF0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100007278;
    v3[3] = &unk_10000C360;
    v3[4] = &v4;
    sub_100007278((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100005F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006048(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000060BC;
  v3[3] = &unk_10000C430;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:0 completion:v3];
}

void sub_1000060BC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];
}

void sub_100006880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_1000068A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000068B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000068C8(uint64_t a1)
{
}

void sub_1000068D0(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v2 = sub_1000049A4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000077D0(a1, v2);
    }

    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [sub_100005778() internalErrorWithMessage:@"timed out presenting extension view controller"];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void *sub_100006978(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    [result invalidate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return (void *)v5();
  }
  return result;
}

void sub_100006B4C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000049A4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    CFStringRef v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ did finish completion: success = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_10000706C(id a1)
{
  qword_100011DD8 = (uint64_t)os_log_create("com.apple.AppSSO", "SOUIServiceViewController");

  _objc_release_x1();
}

void sub_1000070B0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100011DE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000760C();
    sub_100007108();
  }
}

void sub_100007108()
{
  v1[0] = 0;
  if (!qword_100011DE8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100007204;
    v1[4] = &unk_10000C398;
    v1[5] = v1;
    long long v2 = off_10000C550;
    uint64_t v3 = 0;
    qword_100011DE8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100011DE8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100007204()
{
  uint64_t result = _sl_dlopen();
  qword_100011DE8 = result;
  return result;
}

Class sub_100007278(uint64_t a1)
{
  sub_100007108();
  Class result = objc_getClass("SOUtils");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000078F8();
  }
  qword_100011DF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000072D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000072F8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "starting UI service", v1, 2u);
}

void sub_10000733C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "missing daemon XPC endpoint", v1, 2u);
}

void sub_100007380()
{
  sub_100004368();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: failed to create XPC connection", v1, 0xCu);
}

void sub_1000073F4()
{
  sub_100004368();
  sub_100004374((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection already exists", v2, v3, v4, v5, v6);
}

void sub_10000745C()
{
  sub_100004368();
  sub_100004374((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection invalidated", v2, v3, v4, v5, v6);
}

void sub_1000074C4()
{
  sub_100004368();
  sub_100004374((void *)&_mh_execute_header, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
}

void sub_10000752C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to connect to AppSSO daemon", v1, 2u);
}

void sub_100007570()
{
  sub_100004368();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "AppSSO daemon XPC error: %{public}@", v1, 0xCu);
}

uint64_t sub_1000075E4()
{
  uint64_t v0 = abort_report_np();
  return sub_10000760C(v0);
}

uint64_t sub_10000760C()
{
  uint64_t v0 = abort_report_np();
  return sub_100007634(v0);
}

void sub_100007634(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[SOUIServiceViewController prepareForActivationWithContext:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000076C0()
{
  sub_1000072EC();
  sub_1000072D0((void *)&_mh_execute_header, v0, v1, "no daemon connection", v2, v3, v4, v5, v6);
}

void sub_1000076F4()
{
  sub_1000072EC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "show on cover screen is allowed", v1, 2u);
}

void sub_100007734()
{
  sub_1000072EC();
  sub_1000072D0((void *)&_mh_execute_header, v0, v1, "device screen is locked => authorization request not handled", v2, v3, v4, v5, v6);
}

void sub_100007768()
{
  sub_1000072EC();
  sub_1000072D0((void *)&_mh_execute_header, v0, v1, "device screen is locked => canceling authorization request", v2, v3, v4, v5, v6);
}

void sub_10000779C()
{
  sub_1000072EC();
  sub_1000072D0((void *)&_mh_execute_header, v0, v1, "device screen is locked => cannot present extension view controller", v2, v3, v4, v5, v6);
}

void sub_1000077D0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "timed out presenting extension view controller: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100007858(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 136315650;
  uint64_t v4 = "-[SOUIServiceViewController extensionCleanupWithCompletion:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s extension = %@ on %@", (uint8_t *)&v3, 0x20u);
}

void sub_1000078F8()
{
  os_log_t v0 = (objc_class *)abort_report_np();
  NSStringFromClass(v0);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__cancelAuthorization(void *a1, const char *a2, ...)
{
  return [a1 _cancelAuthorization];
}

id objc_msgSend__checkScreenLockStatus(void *a1, const char *a2, ...)
{
  return [a1 _checkScreenLockStatus];
}

id objc_msgSend__connectToDaemon(void *a1, const char *a2, ...)
{
  return [a1 _connectToDaemon];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__extensionCleanup(void *a1, const char *a2, ...)
{
  return [a1 _extensionCleanup];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
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

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_loadInternalExtension(void *a1, const char *a2, ...)
{
  return [a1 loadInternalExtension];
}

id objc_msgSend_localizedExtensionDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedExtensionDisplayName];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_unloadExtensions(void *a1, const char *a2, ...)
{
  return [a1 unloadExtensions];
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

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_xpcDaemonEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcDaemonEndpoint];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}