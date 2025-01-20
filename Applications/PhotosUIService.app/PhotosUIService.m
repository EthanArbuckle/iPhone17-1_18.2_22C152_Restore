void sub_100003DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003E08(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained _remoteViewControllerProxy];
  [v3 deactivate];

  id v5 = objc_loadWeakRetained(v1);
  v4 = [v5 _remoteViewControllerProxy];
  [v4 invalidate];
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100004190(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) action];
  if ([v4 canSendResponse])
  {
    if (*(unsigned char *)(a1 + 40))
    {
      v2 = +[BSActionResponse response];
      [v4 sendResponse:v2];
    }
    else
    {
      v2 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
      v3 = +[BSActionResponse responseForError:v2];
      [v4 sendResponse:v3];
    }
  }
  else
  {
    v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
    [v2 deactivate];
  }
}

void sub_10000436C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000438C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finish:a2];
}

void sub_10000475C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004778(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained _remoteViewControllerProxy];
  [v3 deactivate];

  id v5 = objc_loadWeakRetained(v1);
  id v4 = [v5 _remoteViewControllerProxy];
  [v4 invalidate];
}

void sub_100004B90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100004BC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownRemoteViewController];
}

uint64_t sub_100004C08(uint64_t a1)
{
  return _PXFileRadarWithConfiguration(*(void *)(a1 + 32));
}

void sub_100004C10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownRemoteViewController];
}

void sub_100004E44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100004E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[UIApplication sharedApplication];
  id v5 = +[NSURL URLWithString:@"https://developer.apple.com/documentation/photokit"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004FB8;
  v6[3] = &unk_1000081E8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  [v4 openURL:v5 withCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void sub_100004F64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004F78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownRemoteViewController];
}

void sub_100004FB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tearDownRemoteViewController];
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PLHasInternalUI()
{
  return _PLHasInternalUI();
}

uint64_t PXLocalizedString()
{
  return _PXLocalizedString();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__tearDownRemoteViewController(void *a1, const char *a2, ...)
{
  return [a1 _tearDownRemoteViewController];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return [a1 canSendResponse];
}

id objc_msgSend_createAlertViewController(void *a1, const char *a2, ...)
{
  return [a1 createAlertViewController];
}

id objc_msgSend_createEducationViewController(void *a1, const char *a2, ...)
{
  return [a1 createEducationViewController];
}

id objc_msgSend_createInternalAlertViewController(void *a1, const char *a2, ...)
{
  return [a1 createInternalAlertViewController];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}