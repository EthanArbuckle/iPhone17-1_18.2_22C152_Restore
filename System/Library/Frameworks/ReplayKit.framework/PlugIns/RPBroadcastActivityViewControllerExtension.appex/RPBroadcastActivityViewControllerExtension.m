void sub_100003D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003DB0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = *(void **)(a1 + 32);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100003F54;
  v27[3] = &unk_10000C2F8;
  id v19 = v15;
  uint64_t v20 = *(void *)(a1 + 32);
  id v28 = v19;
  uint64_t v29 = v20;
  id v21 = v13;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  id v23 = v16;
  id v32 = v23;
  id v24 = v17;
  id v33 = v24;
  objc_copyWeak(&v35, (id *)(a1 + 40));
  id v25 = v26;
  id v34 = v25;
  [v18 loadStreamingActivitiesWithHandler:v27];

  objc_destroyWeak(&v35);
}

void sub_100003F40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100003F54(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (![v9 count] && !*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) showNotInstalledAlert:*(void *)(a1 + 48) appName:*(void *)(a1 + 56) broadcastActivitiesNotInstalledAlertTitle:*(void *)(a1 + 64) broadcastActivitiesNotInstalledAlertMessage:*(void *)(a1 + 72)];
  }
  v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    [v3 setupSingleExtensionView:WeakRetained hostBundleID:*(void *)(a1 + 48) preferredExtension:*(void *)(a1 + 32) iconImage:*(void *)(a1 + 80) appName:*(void *)(a1 + 56) activities:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v7 = (id *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 80);
    id WeakRetained = objc_loadWeakRetained(v7);
    [v3 setUpActivityViewController:v5 hostBundleID:v6 iconImage:v8 activities:v9 weakSelf:WeakRetained];
  }
}

id sub_1000047E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

id sub_100004800(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

void sub_100004818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000048D0;
  v7[3] = &unk_10000C3E8;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = *(id *)(a1 + 32);
  [v5 loadItems:a3 withHandler:v7];
}

void sub_1000048D0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446722;
    id v23 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:iconImag"
          "e:appName:activities:]_block_invoke_4";
    __int16 v24 = 1024;
    int v25 = 211;
    __int16 v26 = 2048;
    uint64_t v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p setupBroadcastWithHostBundleID", buf, 0x1Cu);
  }
  id v14 = +[RPDaemonProxy daemonProxy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004AB0;
  v18[3] = &unk_10000C3C0;
  uint64_t v15 = *(void *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  id v20 = v12;
  id v21 = v9;
  id v16 = v9;
  id v17 = v12;
  [v14 setupBroadcastWithHostBundleID:v15 broadcastExtensionBundleID:v16 broadcastConfigurationData:v10 userInfo:v11 handler:v18];
}

void sub_100004AB0(id *a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004B88;
  v4[3] = &unk_10000C398;
  id v5 = a2;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100004B88(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  if (*(void *)(a1 + 32)) {
    BOOL v3 = __RPLogLevel > 2u;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007CB8(v2);
  }
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  return [*(id *)(a1 + 40) extensionDidFinishWithLaunchURL:0 broadcastURL:*(void *)(a1 + 48) extensionBundleID:*(void *)(a1 + 56) cancelled:0];
}

void sub_100004C0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 setModalPresentationStyle:2];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136446722;
      id v8 = "-[RPBroadcastActivityExtensionViewController setupSingleExtensionView:hostBundleID:preferredExtension:iconIma"
           "ge:appName:activities:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 244;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p present remoteViewController for ReplayKitTestRunneriOS", (uint8_t *)&v7, 0x1Cu);
    }
    [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];
  }
}

void sub_100004D18(uint64_t a1)
{
  v2 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_PREFERRED_ALERT_MESSAGE_FORMAT"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) activityTitle];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v3, v4);

  uint64_t v6 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_PREFERRED_ALERT_TITLE"];
  int v7 = +[UIAlertController alertControllerWithTitle:v6 message:v5 preferredStyle:1];

  id v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004F58;
  v15[3] = &unk_10000C488;
  __int16 v9 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  id v16 = v9;
  int v10 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v15];
  [v7 addAction:v10];

  __int16 v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_BUTTON_CANCEL"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005068;
  v13[3] = &unk_10000C4B0;
  id v14 = *(id *)(a1 + 48);
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v13];
  [v7 addAction:v12];

  [*(id *)(a1 + 48) presentViewController:v7 animated:1 completion:0];
}

void sub_100004F58(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) applicationExtension];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005000;
  v3[3] = &unk_10000C460;
  id v4 = *(id *)(a1 + 40);
  [v2 instantiateViewControllerWithInputItems:&__NSArray0__struct connectionHandler:v3];
}

void sub_100005000(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = a3;
    [v4 setModalPresentationStyle:2];
    [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
  }
}

id sub_100005068(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

void sub_100005378(uint64_t a1)
{
  id v2 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:*(void *)(a1 + 32) applicationActivities:*(void *)(a1 + 40)];
  [v2 setExcludedActivityCategories:1];
  UIActivityType v27 = UIActivityTypeAirDrop;
  uint64_t v3 = +[NSArray arrayWithObjects:&v27 count:1];
  [v2 setExcludedActivityTypes:v3];

  id v4 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      __int16 v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v9) applicationExtension];
        __int16 v11 = [v10 identifier];
        [v4 addObject:v11];

        __int16 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  [v2 setIncludedActivityTypes:v4];
  uint64_t v12 = [*(id *)(a1 + 48) broadcastExtensionContext];
  uint64_t v13 = [v12 extensionObjectProxy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000055D4;
  v17[3] = &unk_10000C5A0;
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void **)(a1 + 56);
  id v18 = v2;
  uint64_t v19 = v14;
  id v20 = v15;
  id v21 = *(id *)(a1 + 64);
  id v16 = v2;
  [v13 presentationInfoWithCompletion:v17];
}

void sub_1000055D4(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005798;
  block[3] = &unk_10000C500;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v25 = v12;
  uint64_t v26 = v13;
  uint64_t v27 = a2;
  double v28 = a3;
  double v29 = a4;
  double v30 = a5;
  double v31 = a6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v14 = *(void **)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005844;
  v20[3] = &unk_10000C550;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 40);
  id v21 = v15;
  uint64_t v22 = v16;
  id v23 = *(id *)(a1 + 56);
  [v14 setCompletionWithItemsHandler:v20];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005B68;
  v17[3] = &unk_10000C578;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
}

void sub_100005798(uint64_t a1)
{
  [*(id *)(a1 + 32) setModalPresentationStyle:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 48) == 7)
  {
    id v3 = [*(id *)(a1 + 32) popoverPresentationController];
    [v3 setPermittedArrowDirections:15];
    id v2 = [*(id *)(a1 + 40) view];
    [v3 setSourceView:v2];

    objc_msgSend(v3, "setSourceRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

void sub_100005844(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6 = a4;
  id v7 = [v6 count];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7 && a3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000591C;
    v10[3] = &unk_10000C528;
    __int16 v9 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v9;
    [v8 loadItems:v6 withHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
  }
}

void sub_10000591C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446722;
    uint64_t v22 = "-[RPBroadcastActivityExtensionViewController setUpActivityViewController:hostBundleID:iconImage:activities:wea"
          "kSelf:]_block_invoke_5";
    __int16 v23 = 1024;
    int v24 = 359;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p setupBroadcastWithHostBundleID", buf, 0x1Cu);
  }
  uint64_t v14 = +[RPDaemonProxy daemonProxy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100005AF0;
  v18[3] = &unk_10000C3C0;
  uint64_t v15 = *(void *)(a1 + 40);
  void v18[4] = *(void *)(a1 + 32);
  id v19 = v12;
  id v20 = v9;
  id v16 = v9;
  id v17 = v12;
  [v14 setupBroadcastWithHostBundleID:v15 broadcastExtensionBundleID:v16 broadcastConfigurationData:v10 userInfo:v11 handler:v18];
}

void sub_100005AF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007D44(v3);
  }
  [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:*(void *)(a1 + 40) extensionBundleID:*(void *)(a1 + 48) cancelled:0];
}

id sub_100005B68(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_100005CD4(uint64_t a1)
{
  id v2 = +[UIAlertController alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  id v3 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_BUTTON_FIND"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005E78;
  v8[3] = &unk_10000C4B0;
  v8[4] = *(void *)(a1 + 48);
  id v4 = +[UIAlertAction actionWithTitle:v3 style:0 handler:v8];
  [v2 addAction:v4];

  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_BUTTON_CANCEL"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005EE8;
  v7[3] = &unk_10000C4B0;
  v7[4] = *(void *)(a1 + 48);
  id v6 = +[UIAlertAction actionWithTitle:v5 style:1 handler:v7];
  [v2 addAction:v6];

  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
}

void sub_100005E78(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  +[NSURL URLWithString:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewFeature?id=1152708765&mt=8&ls=1"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 extensionDidFinishWithLaunchURL:v2 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

id sub_100005EE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionDidFinishWithLaunchURL:0 broadcastURL:0 extensionBundleID:0 cancelled:1];
}

void sub_100006304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006370(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006380(uint64_t a1)
{
}

void sub_100006388(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136446466;
      uint64_t v22 = "-[RPBroadcastActivityExtensionViewController loadItems:withHandler:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 454;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error loading input item for type", (uint8_t *)&v21, 0x12u);
    }
    goto LABEL_16;
  }
  uint64_t v8 = [*(id *)(a1 + 32) attributedTitle];
  id v9 = [v8 string];
  unsigned int v10 = [v9 isEqualToString:@"RPBroadcastExtensionKeyExtensionBundleIdentifier"];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 48);
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) attributedTitle];
    uint64_t v13 = [v12 string];
    unsigned int v14 = [v13 isEqualToString:@"RPBroadcastExtensionKeyExtensionUserInfo"];

    if (v14)
    {
      uint64_t v11 = *(void *)(a1 + 56);
    }
    else
    {
      uint64_t v15 = [*(id *)(a1 + 32) attributedTitle];
      id v16 = [v15 string];
      unsigned int v17 = [v16 isEqualToString:@"RPBroadcastExtensionKeyBroadcastConfiguration"];

      if (v17)
      {
        uint64_t v11 = *(void *)(a1 + 64);
      }
      else
      {
        id v18 = [*(id *)(a1 + 32) attributedTitle];
        id v19 = [v18 string];
        unsigned int v20 = [v19 isEqualToString:@"kRPBroadcastExtensionKeyExtensionServiceURL"];

        if (!v20) {
          goto LABEL_14;
        }
        uint64_t v11 = *(void *)(a1 + 72);
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), a2);
LABEL_14:
  if (++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == *(void *)(a1 + 88)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_16:
}

void sub_10000674C(uint64_t a1)
{
  id v3 = +[UIColor clearColor];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

void sub_100006A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100006A9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attachments];
  id v5 = [v4 objectAtIndexedSubscript:0];

  id v6 = (id)kUTTypeData;
  if ([v5 hasItemConformingToTypeIdentifier:v6])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006BBC;
    v11[3] = &unk_10000C640;
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 48);
    id v12 = v7;
    uint64_t v14 = v8;
    long long v10 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v10;
    long long v13 = v10;
    [v5 loadItemForTypeIdentifier:v6 options:0 completionHandler:v11];
  }
}

void sub_100006BBC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446466;
      id v19 = "-[RPBroadcastActivityExtensionViewController loadHostAppInfo:]_block_invoke_2";
      __int16 v20 = 1024;
      int v21 = 517;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error loading input item for type", (uint8_t *)&v18, 0x12u);
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) attributedTitle];
    id v9 = [v8 string];
    unsigned int v10 = [v9 isEqualToString:@"RPBroadcastExtensionKeyExtensionHostInfo"];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = 0;

      long long v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];

      if (v13)
      {
        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppIcon"];
        uint64_t v15 = +[UIImage imageWithData:v14];
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
        unsigned int v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100006DA8(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1)
  {
    id v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBundleID"];
    id v3 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoAppName"];
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 40);
    id v5 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoPreferredExtension"];
    id v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertTitle"];
    id v7 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertMessage"];
    (*(void (**)(uint64_t, id, void *, uint64_t, void *, void *, void *))(v1 + 16))(v1, v8, v3, v4, v5, v6, v7);
  }
}

void sub_10000712C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007DCC(v6);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007240;
  v10[3] = &unk_10000C6B8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v5;
  +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services" activationRule:@"NSExtensionActivationSupportsReplayKitStreaming" completion:v10];
}

void sub_100007240(uint64_t a1, void *a2, void *a3)
{
  id obj = a2;
  id v5 = a3;
  if (v5 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007E54(v5);
  }
  double v31 = v5;
  id v34 = +[NSMutableArray array];
  id v6 = +[NSMutableSet set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v7 = a1;
  id v8 = *(id *)(a1 + 32);
  id v9 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [*(id *)(v7 + 40) _autoOptInExtensionIfNeverOptedIn:v13];
        uint64_t v14 = [[RPStreamingActivity alloc] initWithApplicationExtension:v13];
        [v34 addObject:v14];
        uint64_t v15 = [v13 _extensionBundle];
        uint64_t v16 = [v15 bundleIdentifier];
        unsigned int v17 = +[NSBundle baseIdentifier:v16];

        [v6 addObject:v17];
      }
      id v10 = [v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v10);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obja = obj;
  id v18 = [obja countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obja);
        }
        uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        __int16 v23 = [v22 _extensionBundle];
        int v24 = [v23 bundleIdentifier];
        __int16 v25 = +[NSBundle baseIdentifier:v24];

        if (([v6 containsObject:v25] & 1) == 0)
        {
          [*(id *)(v7 + 40) _autoOptInExtensionIfNeverOptedIn:v22];
          uint64_t v26 = [[RPStreamingActivity alloc] initWithApplicationExtension:v22];
          [v34 addObject:v26];
        }
      }
      id v19 = [obja countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v19);
  }

  [*(id *)(v7 + 40) setStreamingActivities:v34];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [*(id *)(v7 + 40) streamingActivities];
    unsigned int v28 = [v27 count];
    *(_DWORD *)buf = 136446722;
    v44 = "-[RPBroadcastActivityExtensionViewController loadStreamingActivitiesWithHandler:]_block_invoke";
    __int16 v45 = 1024;
    int v46 = 601;
    __int16 v47 = 1024;
    unsigned int v48 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Returning streaming activity count = %i", buf, 0x18u);
  }
  uint64_t v29 = *(void *)(v7 + 48);
  double v30 = [*(id *)(v7 + 40) streamingActivities];
  (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);
}

void sub_100007958(id a1, NSError *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100007F78(v2);
  }
}

void sub_1000079D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_100007CB8(id *a1)
{
  [*a1 code];
  sub_1000079B4();
  sub_1000079C4();
  sub_1000079D4((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d Error setting up broadcast, error code: %i", v2, v3, v4, v5, 2u);
}

void sub_100007D44(void *a1)
{
  [a1 code];
  sub_1000079B4();
  sub_1000079C4();
  sub_1000079D4((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d Error setting up broadcast, error code: %i", v2, v3, v4, v5, 2u);
}

void sub_100007DCC(void *a1)
{
  [a1 code];
  sub_1000079B4();
  sub_1000079C4();
  sub_1000079D4((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d Error finding setup UI extensions : %i", v2, v3, v4, v5, 2u);
}

void sub_100007E54(void *a1)
{
  [a1 code];
  sub_1000079B4();
  sub_1000079C4();
  sub_1000079D4((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d Error finding legacy setup UI extensions : %i", v2, v3, v4, v5, 2u);
}

void sub_100007EDC()
{
  *(_DWORD *)uint64_t v1 = 136446722;
  sub_1000079B4();
  *(_DWORD *)&v1[7] = 630;
  v1[9] = 2112;
  uint64_t v2 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error opting in extension %@", (uint8_t *)v1, 0x1Cu);
}

void sub_100007F78(void *a1)
{
  [a1 code];
  sub_1000079B4();
  sub_1000079C4();
  sub_1000079D4((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d error calling extension - %i", v2, v3, v4, v5, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__autoOptedInExtensionBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _autoOptedInExtensionBundleIdentifiers];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__extensionBundle(void *a1, const char *a2, ...)
{
  return [a1 _extensionBundle];
}

id objc_msgSend_activityTitle(void *a1, const char *a2, ...)
{
  return [a1 activityTitle];
}

id objc_msgSend_applicationExtension(void *a1, const char *a2, ...)
{
  return [a1 applicationExtension];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return [a1 attributedTitle];
}

id objc_msgSend_broadcastExtensionContext(void *a1, const char *a2, ...)
{
  return [a1 broadcastExtensionContext];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_daemonProxy(void *a1, const char *a2, ...)
{
  return [a1 daemonProxy];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 extensionObjectProxy];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_icons(void *a1, const char *a2, ...)
{
  return [a1 icons];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_replyQueue(void *a1, const char *a2, ...)
{
  return [a1 replyQueue];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_streamingActivities(void *a1, const char *a2, ...)
{
  return [a1 streamingActivities];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}