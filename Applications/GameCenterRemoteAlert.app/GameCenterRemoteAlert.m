void sub_1000042D8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!os_log_GKGeneral) {
    v12 = (id)GKOSLoggers();
  }
  v13 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = [v9 isAuthenticated];
    v16 = +[NSNumber numberWithInteger:a2];
    v20 = 138413058;
    v21 = v9;
    v22 = 1024;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "RemoteAlert: authentication result: localPlayer=%@\nisAuthenticated=%d\nresult=%@\nerror=%@", (uint8_t *)&v20, 0x26u);
  }
  if (a2 == 2)
  {
    if (!os_log_GKGeneral) {
      v17 = (id)GKOSLoggers();
    }
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "RemoteAlert: Need to show the GreenBuddy flow", (uint8_t *)&v20, 2u);
    }
    [*(id *)(a1 + 32) setNeedToShowGreenBuddy:1];
  }
  v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
}

void sub_100004950(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v9 = [v3 _remoteViewControllerProxy];
    [v9 invalidate];
  }
  else
  {
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 68);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    [v3 dismissExistingAndInvokeDashboardWithHostPID:v4 game:v6 byPassPreAuthentication:v5 deepLink:v7 launchContext:v8];
  }
}

void sub_100004BFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 domain];
  if ([v7 isEqualToString:GKRemoteUIErrorDomain])
  {
    id v8 = [v6 code];

    if (v8 && v5) {
      goto LABEL_4;
    }
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_7;
  }

  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  id v9 = [objc_alloc((Class)GKRemoteUINavigationController) initWithRemoteUIController:v5];
  [v9 setModalPresentationStyle:2];
  [v9 setModalInPresentation:1];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100004D60;
  v15 = &unk_100008278;
  id v10 = *(id *)(a1 + 40);
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  [v5 setCompletionHandler:&v12];
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:v12, v13, v14, v15];

LABEL_7:
}

void sub_100004D60(uint64_t a1, void *a2)
{
  if ([a2 isServerAuthenticated])
  {
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = +[NSError userErrorForCode:2 underlyingError:0];
    id v5 = +[GKLocalPlayer local];
    [v5 authenticationDidCompleteWithError:v4];

    id v6 = +[GKLocalPlayer local];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004EA8;
    v9[3] = &unk_100008250;
    id v7 = *(id *)(a1 + 40);
    id v10 = v4;
    id v11 = v7;
    id v8 = v4;
    [v6 signOutWithCompletionHandler:v9];
  }
}

uint64_t sub_100004EA8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_10000500C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeDashboardWithHostPID:*(unsigned int *)(a1 + 64) game:*(void *)(a1 + 40) byPassPreAuthentication:*(unsigned __int8 *)(a1 + 68) deepLink:*(void *)(a1 + 48) launchContext:*(void *)(a1 + 56)];
}

void sub_100005210(id a1)
{
  id v2 = +[GKDaemonProxy proxyForLocalPlayer];
  v1 = [v2 utilityServicePrivate];
  [v1 notifyRemoteAlertCompletedPresentingDashboard];
}

void sub_100005394(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 deactivate];
  [*(id *)(a1 + 32) setGameCenterViewController:0];
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_1000054C4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "RemoteAlert: Could not launch the remote alert dashboard due to the unauthenticated local player", v1, 2u);
}

void sub_100005508(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "RemoteAlert: Failed deserializing the game data with error=%@", (uint8_t *)&v2, 0xCu);
}

uint64_t GKOSLoggers()
{
  return _GKOSLoggers();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_gameCenterViewController(void *a1, const char *a2, ...)
{
  return [a1 gameCenterViewController];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isServerAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isServerAuthenticated];
}

id objc_msgSend_local(void *a1, const char *a2, ...)
{
  return [a1 local];
}

id objc_msgSend_needToShowGreenBuddy(void *a1, const char *a2, ...)
{
  return [a1 needToShowGreenBuddy];
}

id objc_msgSend_notifyRemoteAlertCompletedPresentingDashboard(void *a1, const char *a2, ...)
{
  return [a1 notifyRemoteAlertCompletedPresentingDashboard];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_proxyForLocalPlayer(void *a1, const char *a2, ...)
{
  return [a1 proxyForLocalPlayer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_utilityServicePrivate(void *a1, const char *a2, ...)
{
  return [a1 utilityServicePrivate];
}