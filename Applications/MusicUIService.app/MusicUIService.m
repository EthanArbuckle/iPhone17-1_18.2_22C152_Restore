uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

void sub_10000504C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000507C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanup];
}

void sub_1000050BC(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained customRowDidTap:v3];
}

void sub_100005118(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error occured while atempting to retrive remote proxy to open connection: %@", (uint8_t *)&v3, 0xCu);
  }
}

id sub_10000522C(uint64_t a1, void *a2)
{
  id result = [a2 events];
  if ((result & 0x10) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Dismissing view service due to home button event.", v4, 2u);
    }
    return [*(id *)(*(void *)(a1 + 32) + 8) transitionToVisible:0 animated:1];
  }
  return result;
}

void sub_100005418(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained remoteViewController];
  [v2 setConfiguration:v1];
}

void sub_1000057B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000057D8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "XPC connection to host app invalidated.", v3, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];
}

void sub_100005C1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performSwitchToNowPlayingForBundleID:*(void *)(a1 + 32) showNowPlaying:*(unsigned __int8 *)(a1 + 48)];
}

void sub_100006608(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = [a2 URL];
  v5 = [v7 lastPathComponent];
  unsigned int v6 = [v5 isEqualToString:@"show-now-playing"];

  if (v6)
  {
    [*(id *)(a1 + 32) _switchToNowPlaying];
    *a3 = 1;
  }
}

void sub_10000694C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000697C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) processAssertion];

    if (v7)
    {
      v8 = [*(id *)(a1 + 32) processAssertion];
      [v8 invalidate];
    }
    [*(id *)(a1 + 32) setAppHandle:v5];
    v9 = [*(id *)(a1 + 32) appHandle];
    v10 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v9 pid]);
    v11 = +[RBSTarget targetWithProcessIdentifier:v10];

    id v12 = objc_alloc((Class)RBSAssertion);
    v13 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.music" name:@"MusicUIService"];
    v33 = v13;
    v14 = +[NSArray arrayWithObjects:&v33 count:1];
    id v15 = [v12 initWithExplanation:@"MusicUIService" target:v11 attributes:v14];
    [*(id *)(a1 + 32) setProcessAssertion:v15];

    v16 = [*(id *)(a1 + 32) processAssertion];
    id v26 = 0;
    LOBYTE(v15) = [v16 acquireWithError:&v26];
    id v17 = v26;

    if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000073B0((uint64_t)v17);
    }
    v18 = [*(id *)(a1 + 32) appHandle];
    v19 = [v18 taskNameRight];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100006CA8;
    v24 = &unk_10000C2C0;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    +[BSPortDeathSentinel monitorSendRight:v19 withHandler:&v21];

    objc_destroyWeak(&v25);
  }
  [*(id *)(a1 + 32) setLaunchRequested:0 v21, v22, v23, v24];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v20;
    __int16 v29 = 2114;
    id v30 = v5;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Open application completed. service:%{public}@, process:%{public}@, error:%{public}@", buf, 0x20u);
  }
}

void sub_100006C8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006CA8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D38;
  block[3] = &unk_10000C2C0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100006D38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAppHandle:0];
  [WeakRetained _launchTargetAppIfNecessary];
}

void sub_1000073B0(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to acquire assertion. %{public}@", (uint8_t *)&v1, 0xCu);
}

uint64_t MRMediaRemoteApplicationSupportsImmediatePlayback()
{
  return _MRMediaRemoteApplicationSupportsImmediatePlayback();
}

uint64_t MRMediaRemotePostBrowsableContentNotification()
{
  return _MRMediaRemotePostBrowsableContentNotification();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return [a1 _FBSScene];
}

id objc_msgSend__isCarScreen(void *a1, const char *a2, ...)
{
  return [a1 _isCarScreen];
}

id objc_msgSend__launchTargetAppIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _launchTargetAppIfNecessary];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__switchToNowPlaying(void *a1, const char *a2, ...)
{
  return [a1 _switchToNowPlaying];
}

id objc_msgSend__userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 _userInterfaceIdiom];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_appHandle(void *a1, const char *a2, ...)
{
  return [a1 appHandle];
}

id objc_msgSend_appMustBeRunning(void *a1, const char *a2, ...)
{
  return [a1 appMustBeRunning];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_associatedBundleID(void *a1, const char *a2, ...)
{
  return [a1 associatedBundleID];
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 beginGeneratingLibraryChangeNotifications];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_currentStack(void *a1, const char *a2, ...)
{
  return [a1 currentStack];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_environments(void *a1, const char *a2, ...)
{
  return [a1 environments];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchRequested(void *a1, const char *a2, ...)
{
  return [a1 launchRequested];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_openConnection(void *a1, const char *a2, ...)
{
  return [a1 openConnection];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_presentingAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 presentingAppBundleID];
}

id objc_msgSend_processAssertion(void *a1, const char *a2, ...)
{
  return [a1 processAssertion];
}

id objc_msgSend_proxiedApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 proxiedApplicationBundleIdentifier];
}

id objc_msgSend_refreshNavigationStackForLaunch(void *a1, const char *a2, ...)
{
  return [a1 refreshNavigationStackForLaunch];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return [a1 remoteViewController];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_saveCurrentStack(void *a1, const char *a2, ...)
{
  return [a1 saveCurrentStack];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setNeedsFocusUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsFocusUpdate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_stateContextForNowPlaying(void *a1, const char *a2, ...)
{
  return [a1 stateContextForNowPlaying];
}

id objc_msgSend_stateName(void *a1, const char *a2, ...)
{
  return [a1 stateName];
}

id objc_msgSend_taskNameRight(void *a1, const char *a2, ...)
{
  return [a1 taskNameRight];
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

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}