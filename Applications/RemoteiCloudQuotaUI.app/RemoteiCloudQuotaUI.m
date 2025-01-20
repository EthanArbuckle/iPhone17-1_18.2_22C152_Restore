id sub_1000036CC(void *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v2 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:a1[5]];
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  [*(id *)(a1[4] + 8) setDelegate:];
  [*(id *)(a1[4] + 8) setFlowOptions:a1[6]];
  [*(id *)(a1[4] + 8) setIcqLink:a1[7]];
  v5 = *(void **)(a1[4] + 8);
  v6 = a1[8];
  v7 = a1[9];

  return [v5 _configurePresentingViewController:v6 preloadedRemoteUIData:v7];
}

id sub_100003928(uint64_t a1)
{
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "presenting local upgrade flow manager within hidden app", v13, 2u);
  }

  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  unsigned int v4 = [v3 isEqualToString:ICQBundleId];

  uint64_t v5 = [*(id *)(a1 + 32) serverUIURL];
  if (v5)
  {
    v6 = v5;
    int v7 = 0;
LABEL_5:

    goto LABEL_8;
  }
  v8 = [*(id *)(a1 + 40) actionURL];

  if (!v8)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000072F4(v6);
    }
    int v7 = 1;
    goto LABEL_5;
  }
  int v7 = 0;
LABEL_8:
  if ([*(id *)(a1 + 40) action] == (id)127) {
    return [*(id *)(a1 + 48) _presentOSLOWithOffer:*(void *)(a1 + 32) link:*(void *)(a1 + 40) presenter:*(void *)(a1 + 56)];
  }
  if ((v4 | v7) == 1) {
    return [*(id *)(a1 + 48) _presentFlowWithOffer:*(void *)(a1 + 32) flowOptions:*(void *)(a1 + 64) containerViewController:*(void *)(a1 + 56)];
  }
  id v10 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(a1 + 48);
  v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = v10;

  [*(id *)(*(void *)(a1 + 48) + 8) setDelegate:];
  [*(id *)(*(void *)(a1 + 48) + 8) setFlowOptions:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 48) + 8) setIcqLink:*(void *)(a1 + 40)];
  return [*(id *)(*(void *)(a1 + 48) + 8) _configurePresentingViewController:*(void *)(a1 + 56) preloadedRemoteUIData:*(void *)(a1 + 72)];
}

void sub_100003D34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetchedOffer = %@", buf, 0xCu);
  }

  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "error = %@", buf, 0xCu);
  }

  if (!v5 || v6)
  {
    [*(id *)(a1 + 40) _cancelFlow];
    v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [*(id *)(a1 + 32) context];
      *(_DWORD *)buf = 138412290;
      id v41 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to launch offer with context = %@", buf, 0xCu);
    }
    v25 = [*(id *)(a1 + 32) context];
    uint64_t v11 = +[NSURL URLWithString:v25];

    unsigned int v26 = [v11 icq_isICQLaunchURL];
    v27 = _ICQGetLogSystem();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_WORD *)buf = 0;
      }

      id v29 = +[NSURL URLWithString:ICQManageStoragePreferencesURL];
      v30 = +[LSApplicationWorkspace defaultWorkspace];
      [v30 openSensitiveURL:v29 withOptions:0];
    }
    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v11;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Launching link %@ in safari", buf, 0xCu);
      }

      id v29 = objc_alloc_init((Class)_LSOpenConfiguration);
      [v29 setAllowURLOverrides:0];
      v30 = +[LSApplicationWorkspace defaultWorkspace];
      [v30 openURL:v11 configuration:v29 completionHandler:&stru_10000C368];
    }
  }
  else
  {
    v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "fetch offer success presenting flow in RemoteApp", buf, 2u);
    }

    id v10 = [*(id *)(a1 + 32) context];
    uint64_t v11 = [v5 universalLinkForContext:v10];

    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v11 action];
      v13 = _ICQStringForAction();
      *(_DWORD *)buf = 138412290;
      id v41 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using link with action %@", buf, 0xCu);
    }
    id v14 = [v11 action];
    v15 = *(void **)(a1 + 32);
    if (v14 == (id)118)
    {
      [v15 updateOfferWithAction:118];
      v16 = *(void **)(a1 + 32);
      v17 = [v11 actionURL];
      [v16 _updateRequestedServerUIURLWithURL:v17];

      id v18 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:*(void *)(a1 + 32)];
      uint64_t v19 = *(void *)(a1 + 40);
      v20 = *(void **)(v19 + 8);
      *(void *)(v19 + 8) = v18;

      [*(id *)(*(void *)(a1 + 40) + 8) setDelegate:];
      [*(id *)(*(void *)(a1 + 40) + 8) setIcqLink:v11];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000042E0;
      block[3] = &unk_10000C300;
      v21 = *(void **)(a1 + 48);
      block[4] = *(void *)(a1 + 40);
      v22 = &v38;
      id v38 = v21;
      id v39 = *(id *)(a1 + 56);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v31 = [v15 context];
      [v5 setContext:v31];

      id v32 = [objc_alloc((Class)ICQUpgradeFlowManager) initWithOffer:v5];
      uint64_t v33 = *(void *)(a1 + 40);
      v34 = *(void **)(v33 + 8);
      *(void *)(v33 + 8) = v32;

      [*(id *)(*(void *)(a1 + 40) + 8) setDelegate:];
      [*(id *)(*(void *)(a1 + 40) + 8) setFlowOptions:*(void *)(a1 + 64)];
      [*(id *)(*(void *)(a1 + 40) + 8) setIcqLink:v11];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000042FC;
      v35[3] = &unk_10000C328;
      v35[4] = *(void *)(a1 + 40);
      v22 = &v36;
      id v36 = *(id *)(a1 + 56);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v35);
    }
  }
}

id sub_1000042E0(void *a1)
{
  return [*(id *)(a1[4] + 8) _configurePresentingViewController:a1[5] andPresentedViewController:a1[6]];
}

id sub_1000042FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) _configurePresentingViewController:*(void *)(a1 + 40)];
}

void sub_100004310(id a1, NSDictionary *a2, NSError *a3)
{
  unsigned int v4 = a2;
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      v12 = v5;
      v8 = "Success %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
    }
  }
  else if (v7)
  {
    int v9 = 138412546;
    id v10 = 0;
    __int16 v11 = 2112;
    v12 = v5;
    v8 = "Failure %@ %@";
    goto LABEL_6;
  }
}

void sub_100004728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_10000475C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "listener lookup connection error %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndExit];
}

id sub_10000489C(uint64_t a1)
{
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Exiting Hidden App Process", v4, 2u);
  }

  return [*(id *)(a1 + 32) _main_dismissAndExit];
}

void sub_10000499C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  id v4 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v4 invalidate];
}

void sub_100004C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error creating remoteVCProxy: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _cancelFlow];
}

Class sub_100005278(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100012228)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000053BC;
    v4[4] = &unk_10000C468;
    v4[5] = v4;
    long long v5 = off_10000C450;
    uint64_t v6 = 0;
    qword_100012228 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_100012228)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("INDaemonInterface");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_100007338();
LABEL_8:
    free(v2);
  }
  qword_100012220 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000053BC()
{
  uint64_t result = _sl_dlopen();
  qword_100012228 = result;
  return result;
}

void sub_100005B58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t start(int a1, char **a2)
{
  long long v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_100006154(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) _configurePresentingViewController:];
}

void sub_100006204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _ICQGetLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetch offer completed successfully: %@", buf, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) remoteContext];
    id v10 = [v9 offer];
    __int16 v11 = [v10 context];
    [v5 setContext:v11];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006420;
    block[3] = &unk_10000C328;
    block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch offer with error: %@", buf, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000647C;
    v12[3] = &unk_10000C3E0;
    v12[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

void sub_100006420(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 universalLink];
  [v1 _launchUpgradeFlowWithOffer:v2 icqLink:v3];
}

id sub_10000647C(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleFallback];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _dismissAndExit];
}

void sub_1000066E4(id a1, NSDictionary *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      v12 = v5;
      BOOL v8 = "Success %@ %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
    }
  }
  else if (v7)
  {
    int v9 = 138412546;
    id v10 = 0;
    __int16 v11 = 2112;
    v12 = v5;
    BOOL v8 = "Failure %@ %@";
    goto LABEL_6;
  }
}

void sub_100006E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006E28(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to connect to remote proxy with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006F34(id a1)
{
  v1 = _ICQGetLogSystem();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Exiting hidden app process.", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = +[UIApplication sharedApplication];
  id v3 = [v2 openSessions];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        int v9 = +[UIApplication sharedApplication];
        [v9 requestSceneSessionDestruction:v8 options:0 errorHandler:0];

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  exit(0);
}

Class sub_100007120(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100012238)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100007264;
    v4[4] = &unk_10000C468;
    v4[5] = v4;
    long long v5 = off_10000C550;
    uint64_t v6 = 0;
    qword_100012238 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_100012238)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("INDaemonInterface");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_100007338();
LABEL_8:
    free(v2);
  }
  qword_100012230 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007264()
{
  uint64_t result = _sl_dlopen();
  qword_100012238 = result;
  return result;
}

void sub_1000072D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000072F4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ICQRemoteViewController offer is missing remoteUI URL. Will fall back to default flow", v1, 2u);
}

uint64_t sub_100007338()
{
  uint64_t v0 = abort_report_np();
  return sub_100007360(v0);
}

void sub_100007360(void *a1, NSObject *a2)
{
  id v3 = [a1 _sceneIdentifier];
  int v4 = 138412290;
  long long v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "windowScene._sceneIdentifier: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000073F8()
{
  sub_100005B74();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to connect to the session.", v1, 2u);
}

void sub_100007438()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "sceneDidDisconnect", v2, v3, v4, v5, v6);
}

void sub_10000746C()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "sceneDidBecomeActive", v2, v3, v4, v5, v6);
}

void sub_1000074A0()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "sceneWillResignActive", v2, v3, v4, v5, v6);
}

void sub_1000074D4()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "sceneWillEnterForeground", v2, v3, v4, v5, v6);
}

void sub_100007508(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No context found. Action unhandled.", buf, 2u);
}

void sub_100007548()
{
  sub_100005B74();
  sub_1000072D8((void *)&_mh_execute_header, v0, v1, "No remote context found. Failed to launch the flow.", v2, v3, v4, v5, v6);
}

void sub_10000757C()
{
  sub_100005B74();
  sub_1000072D8((void *)&_mh_execute_header, v0, v1, "Offer received in context is an icqLink and/or missing LiftUI URL, will fetch the default offer and continue if possible.", v2, v3, v4, v5, v6);
}

void sub_1000075B0()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "upgradeFlowManagerDidCancel", v2, v3, v4, v5, v6);
}

void sub_1000075E4()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "upgradeFlowManagerDidComplete", v2, v3, v4, v5, v6);
}

void sub_100007618()
{
  sub_100005B74();
  sub_100005B58((void *)&_mh_execute_header, v0, v1, "upgradeFlowManager:didPresentViewController:", v2, v3, v4, v5, v6);
}

void sub_10000764C()
{
  sub_100005B74();
  sub_1000072D8((void *)&_mh_execute_header, v0, v1, "Failed to initiate connection to ind.", v2, v3, v4, v5, v6);
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

uint64_t _ICQGetLogSystem()
{
  return __ICQGetLogSystem();
}

uint64_t _ICQStringForAction()
{
  return __ICQStringForAction();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return [a1 XPCInterface];
}

id objc_msgSend__cancelFlow(void *a1, const char *a2, ...)
{
  return [a1 _cancelFlow];
}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return [a1 _dismissAndExit];
}

id objc_msgSend__fetchDefaultOfferAndLaunchUpgradeFlow(void *a1, const char *a2, ...)
{
  return [a1 _fetchDefaultOfferAndLaunchUpgradeFlow];
}

id objc_msgSend__handleFallback(void *a1, const char *a2, ...)
{
  return [a1 _handleFallback];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return [a1 _setupRemoteProxy];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return [a1 actionURL];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dismissUpgradeFlow(void *a1, const char *a2, ...)
{
  return [a1 dismissUpgradeFlow];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_flowOptionsData(void *a1, const char *a2, ...)
{
  return [a1 flowOptionsData];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDefaultOffer(void *a1, const char *a2, ...)
{
  return [a1 isDefaultOffer];
}

id objc_msgSend_isPostPurchaseFlow(void *a1, const char *a2, ...)
{
  return [a1 isPostPurchaseFlow];
}

id objc_msgSend_isPremiumOffer(void *a1, const char *a2, ...)
{
  return [a1 isPremiumOffer];
}

id objc_msgSend_link(void *a1, const char *a2, ...)
{
  return [a1 link];
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

id objc_msgSend_offer(void *a1, const char *a2, ...)
{
  return [a1 offer];
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return [a1 openSessions];
}

id objc_msgSend_preloadedRemoteUIData(void *a1, const char *a2, ...)
{
  return [a1 preloadedRemoteUIData];
}

id objc_msgSend_presentingSceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 presentingSceneIdentifier];
}

id objc_msgSend_remoteContext(void *a1, const char *a2, ...)
{
  return [a1 remoteContext];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_serverUIURL(void *a1, const char *a2, ...)
{
  return [a1 serverUIURL];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return [a1 sharedOfferManager];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_teardownCachedOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownCachedOffer];
}

id objc_msgSend_teardownCachedPremiumOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownCachedPremiumOffer];
}

id objc_msgSend_universalLink(void *a1, const char *a2, ...)
{
  return [a1 universalLink];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}