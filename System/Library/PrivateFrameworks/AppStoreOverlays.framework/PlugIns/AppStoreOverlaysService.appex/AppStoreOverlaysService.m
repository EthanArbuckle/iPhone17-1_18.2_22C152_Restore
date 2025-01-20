void sub_100002CD0(id a1)
{
  uint64_t vars8;

  qword_10002CAB8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASOHostProtocol];

  _objc_release_x1();
}

void sub_100002D6C(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASOServiceProtocol];
  v2 = (void *)qword_10002CAC8;
  qword_10002CAC8 = v1;

  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ASORemoteAppOverlayDelegate];
  [(id)qword_10002CAC8 setInterface:v3 forSelector:"presentOverlayWithConfiguration:delegate:reply:" argumentIndex:1 ofReply:0];
  v4 = (void *)qword_10002CAC8;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = sub_10000CD5C(v9, v5);
  v6 = +[NSArray arrayWithObjects:&v8 count:3];
  v7 = +[NSSet setWithArray:](NSSet, "setWithArray:", v6, v8);
  [v4 setClasses:v7 forSelector:"presentOverlayWithConfiguration:delegate:reply:" argumentIndex:0 ofReply:0];
}

void sub_100003078(id a1)
{
  qword_10002CAD8 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceAdAttribution");

  _objc_release_x1();
}

void sub_100003B44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003BC0(id a1)
{
  qword_10002CAE8 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceContext");

  _objc_release_x1();
}

void sub_1000048A4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) finishExecuting];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100017E7C((uint64_t)v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Did finishing dismissing lockup overlay. Success: %i", (uint8_t *)v6, 8u);
  }
}

void sub_100004E60(id a1)
{
  qword_10002CAF8 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayAppClipLockupProvider");

  _objc_release_x1();
}

id sub_1000051C0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) additionalValueForKey:ASOOverlayConfigurationPrivateParameterOverrideIsBetaApp serviceContext:*(void *)(a1 + 40)];
  unsigned int v3 = [*(id *)(a1 + 40) isBetaApp];
  if (v2)
  {
    if ([v2 BOOLValue])
    {
LABEL_3:
      v4 = +[ASOServiceOverlayDevelopmentLockupProvider placeholderAppDevelopmentLockupForConfiguration:*(void *)(a1 + 32) serviceContext:*(void *)(a1 + 40)];
      id v5 = [[ASOServiceLockupDefinition alloc] initWithLockup:v4];
      id v6 = [*(id *)(a1 + 48) loadOverlayFromDefinition:v5 configuration:*(void *)(a1 + 32) serviceContext:*(void *)(a1 + 40) metricsReporter:*(void *)(a1 + 56)];

      goto LABEL_6;
    }
  }
  else if (v3)
  {
    goto LABEL_3;
  }
  id v6 = *(id *)(a1 + 64);
LABEL_6:

  return v6;
}

void sub_100005410(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) additionalValueForKey:ASOOverlayConfigurationParameterHostBundleID];
  unsigned int v3 = [*(id *)(a1 + 32) additionalValueForKey:ASOOverlayConfigurationParameterHostSceneIdentifier];
  v4 = [*(id *)(a1 + 40) request];

  if (v4)
  {
    id v5 = [_TtC23AppStoreOverlaysService24ServiceOverlayLockupView alloc];
    id v6 = [*(id *)(a1 + 40) request];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = +[ASOLocalizer defaultLocalizer];
    uint64_t v9 = -[ServiceOverlayLockupView initWithFrame:request:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:](v5, "initWithFrame:request:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:", v6, v7, v8, v2, v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
LABEL_5:
    v13 = v9;

    v14 = *(void **)(a1 + 56);
    v15 = +[ASOServiceOverlayAppClipLockupProvider configureLockupView:v13 forAppClipWithConfiguration:*(void *)(a1 + 32) serviceContext:*(void *)(a1 + 64) metricsReporter:*(void *)(a1 + 48)];
    [v14 finishWithPromise:v15];

    goto LABEL_6;
  }
  uint64_t v10 = [*(id *)(a1 + 40) lockup];

  if (v10)
  {
    v11 = [_TtC23AppStoreOverlaysService24ServiceOverlayLockupView alloc];
    id v6 = [*(id *)(a1 + 40) lockup];
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v8 = +[ASOLocalizer defaultLocalizer];
    uint64_t v9 = -[ServiceOverlayLockupView initWithFrame:lockup:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:](v11, "initWithFrame:lockup:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:", v6, v12, v8, v2, v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    goto LABEL_5;
  }
  v16 = +[ASOServiceOverlayAppClipLockupProvider log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10001811C();
  }

  v17 = *(void **)(a1 + 56);
  v13 = +[NSError errorWithDomain:@"ASOErrorDomain" code:0 userInfo:0];
  [v17 finishWithError:v13];
LABEL_6:
}

id sub_1000057BC(uint64_t a1)
{
  v2 = +[ASOServiceOverlayAppClipLockupProvider log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001815C();
  }

  uint64_t v3 = [*(id *)(a1 + 32) campaignToken];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [*(id *)(a1 + 32) providerToken];

    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = [*(id *)(a1 + 32) campaignToken];
      uint64_t v8 = [*(id *)(a1 + 32) providerToken];
      uint64_t v9 = [*(id *)(a1 + 48) lockup];
      [v6 recordCampaignToken:v7 providerToken:v8 withLockup:v9];
    }
  }
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005980;
  block[3] = &unk_100024E08;
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  id v11 = v10;
  id v20 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v12 = v20;
  id v13 = v11;

  return v13;
}

void sub_100005980(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) applicationRecord];
  unsigned __int8 v3 = [v2 isArcadeApp];

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if ([v4 BOOLValue])
    {
LABEL_3:
      uint64_t v5 = 2;
      goto LABEL_6;
    }
  }
  else if (v3)
  {
    goto LABEL_3;
  }
  uint64_t v5 = 1;
LABEL_6:
  [*(id *)(a1 + 48) setVariant:v5];
  id v6 = [*(id *)(a1 + 56) additionalValueForKey:ASOOverlayConfigurationParameterHostSignpostSpan];
  [*(id *)(a1 + 48) setHostSignpostSpan:v6];

  uint64_t v7 = [*(id *)(a1 + 56) additionalValueForKey:ASOOverlayConfigurationParameterHostIdiom];
  id v8 = [v7 integerValue];

  id v10 = -[ASOServiceOverlayContainerConfiguration initWithPosition:userDismissible:hostIdiom:]([ASOServiceOverlayContainerConfiguration alloc], "initWithPosition:userDismissible:hostIdiom:", [*(id *)(a1 + 56) position], 1, v8);
  uint64_t v9 = [[ASOServiceOverlay alloc] initWithContentView:*(void *)(a1 + 48) containerConfiguration:v10];
  [*(id *)(a1 + 64) finishWithResult:v9];
}

void sub_1000060CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000613C(id a1)
{
  qword_10002CB08 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayAppLockupProvider");

  _objc_release_x1();
}

void sub_1000064DC(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) additionalValueForKey:ASOOverlayConfigurationParameterHostBundleID];
  unsigned __int8 v3 = [*(id *)(a1 + 32) additionalValueForKey:ASOOverlayConfigurationParameterHostSceneIdentifier];
  v4 = [*(id *)(a1 + 40) request];

  if (v4)
  {
    uint64_t v5 = [_TtC23AppStoreOverlaysService24ServiceOverlayLockupView alloc];
    id v6 = [*(id *)(a1 + 40) request];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = +[ASOLocalizer defaultLocalizer];
    uint64_t v9 = -[ServiceOverlayLockupView initWithFrame:request:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:](v5, "initWithFrame:request:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:", v6, v7, v8, v2, v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
LABEL_5:
    id v13 = v9;

    v14 = [*(id *)(a1 + 64) adInteractionAttributor];
    [v13 setAdInteractionAttributor:v14];

    v15 = *(void **)(a1 + 56);
    id v16 = +[ASOServiceOverlayAppLockupProvider configureLockupView:v13 forAppWithConfiguration:*(void *)(a1 + 72) serviceContext:*(void *)(a1 + 80) metricsReporter:*(void *)(a1 + 48)];
    [v15 finishWithPromise:v16];

    goto LABEL_6;
  }
  id v10 = [*(id *)(a1 + 40) lockup];

  if (v10)
  {
    id v11 = [_TtC23AppStoreOverlaysService24ServiceOverlayLockupView alloc];
    id v6 = [*(id *)(a1 + 40) lockup];
    uint64_t v12 = *(void *)(a1 + 48);
    id v8 = +[ASOLocalizer defaultLocalizer];
    uint64_t v9 = -[ServiceOverlayLockupView initWithFrame:lockup:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:](v11, "initWithFrame:lockup:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:", v6, v12, v8, v2, v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    goto LABEL_5;
  }
  id v17 = +[ASOServiceOverlayAppLockupProvider log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10001811C();
  }

  id v18 = *(void **)(a1 + 56);
  id v13 = +[NSError errorWithDomain:@"ASOErrorDomain" code:0 userInfo:0];
  [v18 finishWithError:v13];
LABEL_6:
}

id sub_100006964(uint64_t a1)
{
  v2 = +[ASOServiceOverlayAppLockupProvider log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000181F8();
  }

  uint64_t v3 = [*(id *)(a1 + 32) campaignToken];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) providerToken];

    if (v5)
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = [*(id *)(a1 + 32) campaignToken];
      id v8 = [*(id *)(a1 + 32) providerToken];
      uint64_t v9 = [*(id *)(a1 + 48) lockup];
      [v6 recordCampaignToken:v7 providerToken:v8 withLockup:v9];
    }
  }
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B00;
  block[3] = &unk_100024EA0;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 32);
  id v11 = v10;
  id v18 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v12 = v18;
  id v13 = v11;

  return v13;
}

void sub_100006B00(id *a1)
{
  [a1[4] setVariant:0];
  v2 = [a1[5] additionalValueForKey:ASOOverlayConfigurationParameterHostSignpostSpan];
  [a1[4] setHostSignpostSpan:v2];

  uint64_t v3 = [a1[5] additionalValueForKey:ASOOverlayConfigurationParameterHostIdiom];
  id v4 = [v3 integerValue];

  id v6 = -[ASOServiceOverlayContainerConfiguration initWithPosition:userDismissible:hostIdiom:]([ASOServiceOverlayContainerConfiguration alloc], "initWithPosition:userDismissible:hostIdiom:", [a1[5] position], objc_msgSend(a1[5], "userDismissible"), v4);
  uint64_t v5 = [[ASOServiceOverlay alloc] initWithContentView:a1[4] containerConfiguration:v6];
  [a1[6] finishWithResult:v5];
}

void sub_100006D00(id a1)
{
  qword_10002CB18 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayDevelopmentLockupProvider");

  _objc_release_x1();
}

void sub_100007668(id a1)
{
  qword_10002CB28 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayLoader");

  _objc_release_x1();
}

void sub_100007A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007A3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained config];
  v2 = [v1 storage];
  uint64_t v3 = [WeakRetained config];
  id v4 = [v3 appIdentifier];
  uint64_t v5 = [WeakRetained serviceContext];
  id v6 = [v5 hostAdamID];
  uint64_t v7 = [WeakRetained serviceContext];
  id v8 = [v7 hostBundleIdentifier];
  +[ASOServiceAdAttribution recordImpressionWithParameters:v2 storeIdentifier:v4 hostAdamID:v6 clientBundleId:v8 interactionType:0];
}

void sub_100008010(_Unwind_Exception *a1)
{
}

void sub_100008030(void *a1)
{
}

void sub_100008090(id a1)
{
  qword_10002CB38 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayPresenter");

  _objc_release_x1();
}

void sub_100008660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000868C(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) convertErrorIfNeeded:a2];
  uint64_t v3 = +[AMSPromise promiseWithError:v2];

  return v3;
}

void sub_1000086F0(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setLoadedOverlay:v3];

  uint64_t v5 = [v3 contentView];

  id v12 = [v5 additionalMetricsFields];

  if (v12)
  {
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = [v6 viewMetricsReporter];
    id v8 = [v7 activity];
    uint64_t v9 = [v8 metricsActivityByMergingFields:v12 uniquingFieldsWithBlock:&stru_100024FB8];

    id v10 = objc_loadWeakRetained(v2);
    id v11 = [v10 viewMetricsReporter];
    [v11 setActivity:v9];
  }
}

NSString *__cdecl sub_100008800(id a1, NSString *a2, NSString *a3, NSString *a4)
{
  id v4 = a4;

  return v4;
}

id sub_100008908(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setUnlockedLoadedOverlay:*(void *)(a1 + 40)];
}

void sub_1000089F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008A10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008A20(uint64_t a1)
{
}

uint64_t sub_100008A28(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) unlockedLoadedOverlay];

  return _objc_release_x1();
}

void sub_100008B9C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C20;
  block[3] = &unk_100025058;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100008C20(uint64_t a1)
{
  id v2 = +[ASOServiceOverlayPresenter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "remoteStoreOverlayWillStartPresenting executeBlock called", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008DF4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008E78;
  block[3] = &unk_100025058;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100008E78(uint64_t a1)
{
  id v2 = +[ASOServiceOverlayPresenter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "remoteStoreOverlayWillStartDismissing executeBlock called", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000094A4(id a1)
{
  qword_10002CB48 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceOverlayViewController");

  _objc_release_x1();
}

id sub_100009C74(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentOverlayPresenter:*(void *)(a1 + 40)];
  id v2 = objc_alloc_init((Class)AMSMutableBinaryPromise);
  id v3 = [*(id *)(a1 + 40) loadOverlayIfNeeded];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009DD0;
  v12[3] = &unk_1000250C8;
  v12[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v13 = v4;
  char v14 = *(unsigned char *)(a1 + 48);
  [v3 addSuccessBlock:v12];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009F28;
  v9[3] = &unk_1000250F0;
  id v10 = *(id *)(a1 + 40);
  id v5 = v4;
  id v11 = v5;
  [v3 addErrorBlock:v9];
  id v6 = v11;
  id v7 = v5;

  return v7;
}

void sub_100009DD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_100009E88;
  v6[3] = &unk_1000250A0;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  char v9 = *(unsigned char *)(a1 + 48);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100009E88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) contentView];
  id v3 = [*(id *)(a1 + 32) overlayContainer];
  [v3 setContentView:v2];

  [*(id *)(a1 + 32) reloadContainerConfiguration];
  id v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) showOverlayAnimated:*(unsigned __int8 *)(a1 + 56)];
  [v4 finishWithPromise:v5];
}

void sub_100009F28(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 didFailToLoadWithError:v4];
  [*(id *)(a1 + 40) finishWithError:v4];
}

AMSBinaryPromise *sub_10000A078(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentOverlayPresenter:0];

  return +[AMSBinaryPromise promiseWithSuccess];
}

id sub_10000A3C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPercentageOnScreen:*(double *)(a1 + 40)];
}

void sub_10000A754(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshOverlayFrame];
  id v2 = *(void **)(a1 + 32);
  [v2 percentageOnScreen];
  objc_msgSend(v2, "edgePointForPercentage:");
  objc_msgSend(v2, "overlayFrameForEdgePoint:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = *(void **)(a1 + 32);
  [v11 edgePointForPercentage:1.0];
  objc_msgSend(v11, "overlayFrameForEdgePoint:");
  id v16 = objc_msgSend(objc_alloc((Class)ASOOverlayTransitionContext), "initWithStartFrame:endFrame:", v4, v6, v8, v10, v12, v13, v14, v15);
  id v17 = [*(id *)(a1 + 32) currentOverlayPresenter];
  objc_initWeak(&location, v17);

  id v18 = [*(id *)(a1 + 32) currentOverlayPresenter];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000A93C;
  v20[3] = &unk_1000251B8;
  v20[4] = *(void *)(a1 + 32);
  char v24 = *(unsigned char *)(a1 + 48);
  objc_copyWeak(&v23, &location);
  id v19 = v16;
  id v21 = v19;
  id v22 = *(id *)(a1 + 40);
  [v18 willStartPresentation:v19 executeBlock:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void sub_10000A918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A93C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AA20;
  v4[3] = &unk_100025190;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 setPercentageOnScreen:v3 animated:v4 completion:1.0];

  objc_destroyWeak(&v7);
}

void sub_10000AA0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10000AA20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained didFinishPresentation:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 40);

  return _[v3 finishWithSuccess];
}

void sub_10000AB98(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 percentageOnScreen];
  objc_msgSend(v2, "edgePointForPercentage:");
  objc_msgSend(v2, "overlayFrameForEdgePoint:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = *(void **)(a1 + 32);
  [v11 edgePointForPercentage:0.0];
  objc_msgSend(v11, "overlayFrameForEdgePoint:");
  id v16 = objc_msgSend(objc_alloc((Class)ASOOverlayTransitionContext), "initWithStartFrame:endFrame:", v4, v6, v8, v10, v12, v13, v14, v15);
  id v17 = [*(id *)(a1 + 32) currentOverlayPresenter];
  objc_initWeak(&location, v17);

  id v18 = [*(id *)(a1 + 32) currentOverlayPresenter];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000AD78;
  v20[3] = &unk_1000251B8;
  v20[4] = *(void *)(a1 + 32);
  char v24 = *(unsigned char *)(a1 + 48);
  objc_copyWeak(&v23, &location);
  id v19 = v16;
  id v21 = v19;
  id v22 = *(id *)(a1 + 40);
  [v18 willStartDismissal:v19 executeBlock:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void sub_10000AD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AD78(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AE5C;
  v4[3] = &unk_100025190;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 setPercentageOnScreen:v3 animated:v4 completion:0.0];

  objc_destroyWeak(&v7);
}

void sub_10000AE48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10000AE5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained didFinishDismissal:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 40);

  return _[v3 finishWithSuccess];
}

void sub_10000B2AC(id a1)
{
  uint64_t v1 = +[ASOServiceOverlayViewController log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Overlay presentation succeeded", v2, 2u);
  }
}

void sub_10000B31C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = +[ASOServiceOverlayViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Overlay presentation failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B748(id a1)
{
  qword_10002CB58 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServicePresentationQueue");

  _objc_release_x1();
}

void sub_10000BAA0(uint64_t a1)
{
  [*(id *)(a1 + 32) removePendingPresentationOperations];
  uint64_t v3 = [[ASOServicePresentOverlayOperation alloc] initWithQueue:*(void *)(a1 + 32) configuration:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) queue];
  [v2 addOperation:v3];
}

void sub_10000BBF4(uint64_t a1)
{
  [*(id *)(a1 + 32) removePendingPresentationOperations];
  uint64_t v3 = [[ASOServiceDismissOverlayOperation alloc] initWithQueue:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 32) queue];
  [v2 addOperation:v3];
}

void sub_10000BD6C(id a1)
{
  qword_10002CB68 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServicePresentOverlayOperation");

  _objc_release_x1();
}

void sub_10000C0DC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) finishExecuting];
  id v6 = +[ASOServicePresentOverlayOperation log];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000182F8((uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did finishing presenting lockup overlay. Success: %i", (uint8_t *)v8, 8u);
  }
}

void sub_10000C53C(id a1)
{
  qword_10002CB78 = (uint64_t)os_log_create("com.apple.AppStoreOverlays.ViewService", "ASOServiceViewMetricsReporter");

  _objc_release_x1();
}

void sub_10000CB94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_10000CBCC(uint64_t a1)
{
  id v2 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100018370(a1, v2);
  }
}

void sub_10000CC20(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100018424(a1, (uint64_t)v3, v4);
  }
}

id sub_10000CC8C(uint64_t a1)
{
  id v2 = +[ASOServiceViewMetricsReporter log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Releasing post events process assertion", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

id sub_10000CD60()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10002CB80;
  uint64_t v7 = qword_10002CB80;
  if (!qword_10002CB80)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000CE44;
    v3[3] = &unk_100025340;
    v3[4] = &v4;
    sub_10000CE44((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000CE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000CE44(uint64_t a1)
{
  sub_10000CE9C();
  Class result = objc_getClass("ASCSignpostSpan");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000184F8();
  }
  qword_10002CB80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000CE9C()
{
  v1[0] = 0;
  if (!qword_10002CB88)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000CF98;
    v1[4] = &unk_100025378;
    v1[5] = v1;
    long long v2 = off_100025360;
    uint64_t v3 = 0;
    qword_10002CB88 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10002CB88)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000CF98()
{
  uint64_t result = _sl_dlopen();
  qword_10002CB88 = result;
  return result;
}

uint64_t sub_10000D0A8(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR___ASOKeepAlive_name);
  uint64_t v5 = *(void *)(a1 + OBJC_IVAR___ASOKeepAlive_name + 8);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR___ASOKeepAlive_explanation);
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR___ASOKeepAlive_explanation + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000189A0();
  if (qword_10002C320 != -1) {
    swift_once();
  }
  sub_100018600();
  if (qword_10002C330 != -1) {
    swift_once();
  }
  double v9 = (void *)qword_10002D120;
  [(id)qword_10002D120 lock];
  a2(v4, v6, v5, v8, v7, v4);
  [v9 unlock];
  sub_1000189A0();
  sub_100018600();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_10000D254(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  type metadata accessor for KeepAliveManager();
  id v5 = a1;
  sub_10000D0A8((uint64_t)v5, a3);
}

id sub_10000D2E8()
{
  return sub_10000DBF8(type metadata accessor for KeepAlive);
}

uint64_t type metadata accessor for KeepAlive()
{
  return self;
}

uint64_t sub_10000D378()
{
  sub_10000EC7C(0, &qword_10002C500);
  uint64_t result = sub_100018A20();
  qword_10002D110 = result;
  return result;
}

uint64_t sub_10000D3EC()
{
  return _swift_deallocClassInstance(v0, 32, 7);
}

Swift::Int sub_10000D424()
{
  return sub_100018B30();
}

uint64_t sub_10000D48C()
{
  sub_100018950();

  return sub_100018950();
}

Swift::Int sub_10000D4DC()
{
  return sub_100018B30();
}

uint64_t sub_10000D540(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_100018AD0(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_100018AD0();
    }
  }
  return result;
}

unint64_t sub_10000D624()
{
  unint64_t result = sub_100012C64((uint64_t)&_swiftEmptyArrayStorage);
  qword_10002D118 = result;
  return result;
}

id sub_10000D64C()
{
  id result = [objc_allocWithZone((Class)NSLock) init];
  qword_10002D120 = (uint64_t)result;
  return result;
}

uint64_t sub_10000D680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_10002C328 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v9 = qword_10002D118;
  if (*(void *)(qword_10002D118 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1000171C8(a2, a3, a4, a5);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_endAccess();
      swift_retain();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  type metadata accessor for KeepAliveManager.Assertion();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_10000EA64();
LABEL_9:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v12 + 24);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_13;
  }
  *(void *)(v12 + 24) = v15;
  id v16 = *(void **)(v12 + 16);
  v28[0] = 0;
  unsigned __int8 v17 = [v16 acquireWithError:v28];
  id v18 = v28[0];
  if (v17)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v19 = v18;
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = qword_10002D118;
    qword_10002D118 = 0x8000000000000000;
    sub_10000E6B0(v12, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
    qword_10002D118 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  id v22 = v28[0];
  sub_100018530();

  swift_willThrow();
  sub_1000189B0();
  if (qword_10002C320 != -1) {
    goto LABEL_15;
  }
LABEL_13:
  sub_10000EA20(&qword_10002C510);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_10001C9E0;
  swift_getErrorValue();
  uint64_t v24 = sub_100018B00();
  uint64_t v26 = v25;
  *(void *)(v23 + 56) = &type metadata for String;
  *(void *)(v23 + 64) = sub_10000EC28();
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 40) = v26;
  sub_100018600();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_errorRelease();
}

uint64_t sub_10000D9DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_10002C328 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v9 = qword_10002D118;
  if (*(void *)(qword_10002D118 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1000171C8(a2, a3, a4, a5);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(v12 + 24);
      BOOL v15 = __OFSUB__(v14, 1);
      uint64_t v16 = v14 - 1;
      if (v15)
      {
        __break(1u);
      }
      else
      {
        *(void *)(v12 + 24) = v16;
        if (v16 <= 0)
        {
          [*(id *)(v12 + 16) invalidate];
          if (!*(void *)(v12 + 24))
          {
            swift_beginAccess();
            sub_10000E090(a2, a3, a4, a5);
            swift_endAccess();
            swift_release();
          }
        }
        return swift_release();
      }
      return result;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1000189B0();
  if (qword_10002C320 != -1) {
    swift_once();
  }
  return sub_100018600();
}

id sub_10000DBE0()
{
  return sub_10000DBF8(type metadata accessor for KeepAliveManager);
}

id sub_10000DBF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for KeepAliveManager()
{
  return self;
}

uint64_t type metadata accessor for KeepAliveManager.Assertion()
{
  return self;
}

uint64_t sub_10000DC7C(uint64_t a1, uint64_t a2)
{
  return sub_10000DD74(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000DC94()
{
  sub_100018930();
  sub_100018950();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000DCE8()
{
  sub_100018930();
  sub_100018B10();
  sub_100018950();
  Swift::Int v0 = sub_100018B30();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000DD5C(uint64_t a1, uint64_t a2)
{
  return sub_10000DD74(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000DD74(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100018930();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000DDB8(uint64_t a1, id *a2)
{
  uint64_t result = sub_100018910();
  *a2 = 0;
  return result;
}

uint64_t sub_10000DE30(uint64_t a1, id *a2)
{
  char v3 = sub_100018920();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000DEB0@<X0>(void *a1@<X8>)
{
  sub_100018930();
  NSString v2 = sub_100018900();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000DEF8()
{
  uint64_t v0 = sub_100018930();
  uint64_t v2 = v1;
  if (v0 == sub_100018930() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100018AD0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000DF84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100018930();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000DFB0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100018900();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000DFF8(uint64_t a1)
{
  uint64_t v2 = sub_10000F010(&qword_10002C9B0);
  uint64_t v3 = sub_10000F010((unint64_t *)&unk_10002C560);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000E090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = v4;
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1000171C8(a1, a2, a3, a4);
  LOBYTE(a4) = v11;
  swift_bridgeObjectRelease();
  if ((a4 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v5;
  uint64_t v16 = *v5;
  *char v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000E850();
    uint64_t v13 = v16;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v10);
  sub_10000E4AC(v10, v13);
  *char v5 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_10000E184(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000EA20(&qword_10002C508);
  char v38 = a2;
  uint64_t v6 = sub_100018A90();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v36[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v36[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v38)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v36[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v36[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = (uint64_t *)(*(void *)(v5 + 48) + 32 * v20);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      uint64_t v32 = v28[2];
      uint64_t v31 = v28[3];
      uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_100018B10();
      sub_100018950();
      sub_100018950();
      uint64_t result = sub_100018B30();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      id v18 = (void *)(*(void *)(v7 + 48) + 32 * v17);
      *id v18 = v29;
      v18[1] = v30;
      v18[2] = v32;
      v18[3] = v31;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_10000E4AC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100018A40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100018B10();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100018950();
        sub_100018950();
        Swift::Int v9 = sub_100018B30();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 32 * v3);
          int64_t v13 = (_OWORD *)(v11 + 32 * v6);
          if (v3 != v6 || v12 >= v13 + 2)
          {
            long long v14 = v13[1];
            *uint64_t v12 = *v13;
            v12[1] = v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (void *)(v15 + 8 * v3);
          unint64_t v17 = (void *)(v15 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
          {
            void *v16 = *v17;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    id v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *id v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000E6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_1000171C8(a2, a3, a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_10000E850();
LABEL_7:
    BOOL v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_release();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000E184(v19, a6 & 1);
  unint64_t v25 = sub_1000171C8(a2, a3, a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_100018AF0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  BOOL v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 32 * v16);
  *uint64_t v27 = a2;
  v27[1] = a3;
  v27[2] = a4;
  v27[3] = a5;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v30;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

void *sub_10000E850()
{
  uint64_t v1 = v0;
  sub_10000EA20(&qword_10002C508);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018A80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 32 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000EA20(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000EA64()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  uint64_t v2 = getpid();
  id v3 = [self targetWithPid:v2];
  sub_10000EA20(&qword_10002C520);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001C9F0;
  swift_bridgeObjectRetain();
  NSString v5 = sub_100018900();
  NSString v6 = sub_100018900();
  swift_bridgeObjectRelease();
  id v7 = [self attributeWithDomain:v5 name:v6];

  *(void *)(v4 + 32) = v7;
  sub_100018980();
  id v8 = objc_allocWithZone((Class)RBSAssertion);
  NSString v9 = sub_100018900();
  swift_bridgeObjectRelease();
  sub_10000EC7C(0, &qword_10002C528);
  Class isa = sub_100018960().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v8 initWithExplanation:v9 target:v3 attributes:isa];

  *(void *)(v1 + 16) = v11;
  *(void *)(v1 + 24) = 0;
  return v1;
}

unint64_t sub_10000EC28()
{
  unint64_t result = qword_10002C518;
  if (!qword_10002C518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C518);
  }
  return result;
}

uint64_t sub_10000EC7C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for KeepAliveManager.KeepAliveDefinition(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for KeepAliveManager.KeepAliveDefinition()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for KeepAliveManager.KeepAliveDefinition(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for KeepAliveManager.KeepAliveDefinition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for KeepAliveManager.KeepAliveDefinition(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for KeepAliveManager.KeepAliveDefinition(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for KeepAliveManager.KeepAliveDefinition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KeepAliveManager.KeepAliveDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for KeepAliveManager.KeepAliveDefinition()
{
  return &type metadata for KeepAliveManager.KeepAliveDefinition;
}

void type metadata accessor for ASCOfferTitleVariant()
{
  if (!qword_10002C530)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002C530);
    }
  }
}

uint64_t sub_10000EF1C()
{
  return sub_10000F010(&qword_10002C538);
}

uint64_t sub_10000EF50()
{
  return sub_10000F010(&qword_10002C540);
}

unint64_t sub_10000EF88()
{
  unint64_t result = qword_10002C548;
  if (!qword_10002C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C548);
  }
  return result;
}

uint64_t sub_10000EFDC()
{
  return sub_10000F010((unint64_t *)&unk_10002C550);
}

uint64_t sub_10000F010(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ASCOfferTitleVariant();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_10000F088(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  NSString v3 = sub_100018900();
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t sub_10000F0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000F17C(a1, a2, a3, a4, a5, &enum case for ImpressionIntake.InteractionType.view(_:), 73, 0xD000000000000049);
}

uint64_t sub_10000F134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000F17C(a1, a2, a3, a4, a5, &enum case for ImpressionIntake.InteractionType.click(_:), 74, 0xD00000000000004ALL);
}

uint64_t sub_10000F17C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, uint64_t a8)
{
  v14[1] = a7;
  v14[2] = a8;
  sub_100018800();
  __chkstk_darwin();
  uint64_t v9 = sub_1000185E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  unint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *a6, v9);
  sub_1000185D0();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10000F494(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = sub_100018930();
  uint64_t v11 = v10;
  uint64_t v12 = sub_100018930();
  uint64_t v14 = v13;
  id v15 = a1;
  a6(a3, v9, v11, v12, v14);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F540()
{
  return sub_1000185F0();
}

id sub_10000FB6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AttributionKitBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000FC10()
{
  return type metadata accessor for AttributionKitBridge();
}

uint64_t type metadata accessor for AttributionKitBridge()
{
  uint64_t result = qword_10002C5F8;
  if (!qword_10002C5F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000FC64()
{
  uint64_t result = sub_1000188D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_10000FCF4(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000FD58(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000FD90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000EA20(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FDEC()
{
  uint64_t v0 = sub_1000185C0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  NSString v6 = (char *)&v19 - v5;
  sub_10000EA20(&qword_10002C660);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001CCB0;
  id v8 = self;
  id v9 = objc_msgSend(v8, "asc_storefrontLocale");
  sub_1000185B0();

  uint64_t v10 = sub_1000185A0();
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v6, v0);
  *(void *)(v7 + 32) = v10;
  *(void *)(v7 + 40) = v12;
  id v14 = [v8 currentLocale];
  sub_1000185B0();

  uint64_t v15 = sub_1000185A0();
  uint64_t v17 = v16;
  v13(v4, v0);
  *(void *)(v7 + 48) = v15;
  *(void *)(v7 + 56) = v17;
  return v7;
}

char *sub_10000FF9C(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000185C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100018860();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = v3;
    if (v14) {
      goto LABEL_3;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v18 = v3;
  uint64_t result = (char *)sub_100018A70();
  if (!result) {
    goto LABEL_7;
  }
LABEL_3:
  if (!*(void *)(a2 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  size_t v16 = sub_100010C0C(a1);
  swift_bridgeObjectRelease();
  uint64_t result = (char *)swift_bridgeObjectRelease_n();
  *(void *)&v3[OBJC_IVAR___ASOLocalizer_stringTables] = v16;
  if (*(void *)(v16 + 16))
  {
    (*(void (**)(char *, size_t, uint64_t))(v11 + 16))(v13, v16 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v10);
    sub_100018850();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v3[OBJC_IVAR___ASOLocalizer_locale], v9, v6);

    uint64_t v17 = (objc_class *)type metadata accessor for Localizer();
    v19.receiver = v3;
    v19.super_class = v17;
    return (char *)objc_msgSendSuper2(&v19, "init");
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100010320(uint64_t countAndFlagsBits, void *object)
{
  uint64_t v5 = sub_100018800();
  __chkstk_darwin(v5 - 8);
  uint64_t v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000188D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100018860();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v2 + OBJC_IVAR___ASOLocalizer_stringTables);
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v28 = v10;
    uint64_t v29 = v8;
    uint64_t v30 = v7;
    uint64_t v31 = v15;
    v33._countAndFlagsBits = countAndFlagsBits;
    v33._object = object;
    objc_super v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v17 = v12 + 16;
    uint64_t v18 = v19;
    uint64_t v20 = v15 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v21 = *(void *)(v17 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      v18(v14, v20, v11);
      v37.value._countAndFlagsBits = 0;
      v37.value._object = 0;
      uint64_t v22 = sub_100018830(v33, v37);
      uint64_t v24 = v23;
      (*(void (**)(char *, uint64_t))(v17 - 8))(v14, v11);
      if (v24) {
        break;
      }
      v20 += v21;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        countAndFlagsBits = v33._countAndFlagsBits;
        object = v33._object;
        uint64_t v8 = v29;
        uint64_t v7 = v30;
        uint64_t v10 = v28;
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    return v22;
  }
  else
  {
LABEL_6:
    if (qword_10002C340 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10000FD58(v7, (uint64_t)qword_10002D150);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v25, v7);
    sub_10000EA20(&qword_10002C960);
    sub_100018820();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001C9E0;
    sub_1000187F0();
    v35._object = (void *)0x800000010001D6D0;
    v35._countAndFlagsBits = 0xD000000000000022;
    sub_1000187E0(v35);
    v34[3] = &type metadata for String;
    v34[0] = countAndFlagsBits;
    v34[1] = object;
    swift_bridgeObjectRetain();
    sub_1000187C0();
    sub_100010978((uint64_t)v34);
    v36._countAndFlagsBits = 0;
    v36._object = (void *)0xE000000000000000;
    sub_1000187E0(v36);
    sub_100018810();
    sub_100018890();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRetain();
  }
  return countAndFlagsBits;
}

id sub_1000107CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Localizer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010884()
{
  return type metadata accessor for Localizer();
}

uint64_t type metadata accessor for Localizer()
{
  uint64_t result = qword_10002C640;
  if (!qword_10002C640) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000108D8()
{
  uint64_t result = sub_1000185C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100010978(uint64_t a1)
{
  uint64_t v2 = sub_10000EA20(&qword_10002C970);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000109D8()
{
  unint64_t result = qword_10002C650;
  if (!qword_10002C650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002C650);
  }
  return result;
}

size_t sub_100010A18(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100010A38(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

size_t sub_100010A38(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000EA20(&qword_10002C658);
  uint64_t v10 = *(void *)(sub_100018860() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100018860() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_100010C0C(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v17 = sub_100018860();
  uint64_t v4 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v7) {
      return (size_t)v8;
    }
    uint64_t v18 = (unint64_t *)&_swiftEmptyArrayStorage;
    size_t result = sub_100010A18(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v18;
    unint64_t v16 = a1 & 0xC000000000000001;
    v15[0] = v2;
    v15[1] = v4 + 32;
    unint64_t v11 = a1;
    while (v7 != v10)
    {
      if (v16) {
        sub_100018A50();
      }
      else {
        id v12 = *(id *)(a1 + 8 * v10 + 32);
      }
      swift_bridgeObjectRetain();
      sub_100018840();
      uint64_t v18 = v8;
      unint64_t v14 = v8[2];
      unint64_t v13 = v8[3];
      unint64_t v2 = v14 + 1;
      if (v14 >= v13 >> 1)
      {
        sub_100010A18(v13 > 1, v14 + 1, 1);
        uint64_t v8 = v18;
      }
      ++v10;
      _DWORD v8[2] = v2;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v14, v6, v17);
      a1 = v11;
      if (v7 == v10) {
        return (size_t)v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100018A70();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_100010E34()
{
  uint64_t v0 = sub_1000188B0();
  sub_100010E98(v0, qword_10002D138);
  sub_10000FD58(v0, (uint64_t)qword_10002D138);
  return sub_1000188A0();
}

uint64_t *sub_100010E98(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100010EFC()
{
  uint64_t v0 = sub_1000188B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000188D0();
  sub_100010E98(v4, qword_10002D150);
  sub_10000FD58(v4, (uint64_t)qword_10002D150);
  if (qword_10002C338 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000FD58(v0, (uint64_t)qword_10002D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1000188C0();
}

char *sub_100011054(double a1, double a2)
{
  uint64_t v4 = sub_100018590();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (objc_class *)type metadata accessor for RateLimiter();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  *(double *)&v9[OBJC_IVAR___ASORateLimiter_requestsPerSecond] = a1;
  *(double *)&v9[OBJC_IVAR___ASORateLimiter_timeWindow] = a2;
  uint64_t v10 = (uint64_t (**)())&v9[OBJC_IVAR___ASORateLimiter_dateProvider];
  *uint64_t v10 = sub_100011050;
  v10[1] = 0;
  id v11 = objc_allocWithZone((Class)NSLock);
  id v12 = v9;
  id v13 = [v11 init];
  *(void *)&v12[OBJC_IVAR___ASORateLimiter_requestCounterLock] = v13;
  sub_100018580();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[OBJC_IVAR___ASORateLimiter_lastCounterUpdate], v7, v4);
  *(void *)&v12[OBJC_IVAR___ASORateLimiter_allowedRequestsCount] = 0;

  v16.receiver = v12;
  v16.super_class = v8;
  unint64_t v14 = (char *)objc_msgSendSuper2(&v16, "init");
  *(double *)&v14[OBJC_IVAR___ASORateLimiter_allowedRequestsCount] = fmax(*(double *)&v14[OBJC_IVAR___ASORateLimiter_timeWindow]* *(double *)&v14[OBJC_IVAR___ASORateLimiter_requestsPerSecond], 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

double sub_1000112C0(double a1)
{
  return sub_10001131C(&OBJC_IVAR___ASORateLimiter_requestsPerSecond, &OBJC_IVAR___ASORateLimiter_timeWindow, a1);
}

double sub_100011308(double a1)
{
  return sub_10001131C(&OBJC_IVAR___ASORateLimiter_timeWindow, &OBJC_IVAR___ASORateLimiter_requestsPerSecond, a1);
}

double sub_10001131C(void *a1, void *a2, double result)
{
  double v4 = *(double *)(v3 + *a1);
  *(double *)(v3 + *a1) = result;
  if (v4 != result)
  {
    size_t result = fmax(*(double *)(v3 + *a2) * result, 1.0);
    *(double *)(v3 + OBJC_IVAR___ASORateLimiter_allowedRequestsCount) = result;
  }
  return result;
}

BOOL sub_100011358()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___ASORateLimiter_requestCounterLock);
  [v1 lock];
  sub_100011408();
  double v2 = *(double *)(v0 + OBJC_IVAR___ASORateLimiter_allowedRequestsCount);
  if (v2 >= 1.0) {
    *(double *)(v0 + OBJC_IVAR___ASORateLimiter_allowedRequestsCount) = v2 + -1.0;
  }
  BOOL v3 = v2 >= 1.0;
  [v1 unlock];
  return v3;
}

uint64_t sub_100011408()
{
  uint64_t v1 = sub_100018590();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v19[-v7];
  (*(void (**)(uint64_t))(v0 + OBJC_IVAR___ASORateLimiter_dateProvider))(v6);
  uint64_t v9 = v0 + OBJC_IVAR___ASORateLimiter_lastCounterUpdate;
  swift_beginAccess();
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16);
  v10(v5, v9, v1);
  sub_100018570();
  double v12 = v11;
  id v13 = *(void (**)(unsigned char *, uint64_t))(v2 + 8);
  v13(v5, v1);
  double v14 = *(double *)(v0 + OBJC_IVAR___ASORateLimiter_requestsPerSecond);
  double v15 = v12 * v14;
  double v16 = fmax(v14 * *(double *)(v0 + OBJC_IVAR___ASORateLimiter_timeWindow), 1.0);
  double v17 = v15 + *(double *)(v0 + OBJC_IVAR___ASORateLimiter_allowedRequestsCount);
  if (v16 >= v17) {
    double v16 = v17;
  }
  *(double *)(v0 + OBJC_IVAR___ASORateLimiter_allowedRequestsCount) = v16;
  v10(v5, (uint64_t)v8, v1);
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 40))(v9, v5, v1);
  swift_endAccess();
  return ((uint64_t (*)(unsigned char *, uint64_t))v13)(v8, v1);
}

id sub_100011650()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RateLimiter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001171C()
{
  return type metadata accessor for RateLimiter();
}

uint64_t type metadata accessor for RateLimiter()
{
  uint64_t result = qword_10002C6C0;
  if (!qword_10002C6C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011770()
{
  uint64_t result = sub_100018590();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_10001182C(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_100018770();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor;
  double v16 = self;
  double v17 = v4;
  *(void *)&v5[v15] = [v16 separatorColor];
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Separator.Position.bottom(_:), v11);
  v24[3] = sub_100018680();
  v24[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_10000FCF4(v24);
  sub_100018670();
  sub_100018780();
  id v18 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v17[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineView] = v18;

  v23.receiver = v17;
  v23.super_class = ObjectType;
  objc_super v19 = (char *)objc_msgSendSuper2(&v23, "initWithFrame:", a1, a2, a3, a4);
  [v19 setUserInteractionEnabled:0];
  objc_msgSend(v19, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  uint64_t v20 = OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineView;
  [*(id *)&v19[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineView] setBackgroundColor:*(void *)&v19[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor]];
  [v19 addSubview:*(void *)&v19[v20]];

  return v19;
}

void sub_100011D3C()
{
  unint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100018AC0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33.receiver = v1;
  v33.super_class = ObjectType;
  objc_msgSendSuper2(&v33, "layoutSubviews");
  [v1 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v1 layoutMargins];
  double v17 = sub_1000121C8(v8, v10, v12, v14, v15, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  id v24 = [v1 traitCollection];
  sub_100018790();
  double v26 = v25;

  swift_beginAccess();
  sub_100018750();
  swift_endAccess();
  sub_1000121E4(v32, v32[3]);
  sub_100018610();
  sub_100018660();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_100012228((uint64_t)v32);
  id v29 = *(id *)&v1[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineView];
  v34.origin.x = v17;
  v34.origin.y = v19;
  v34.size.width = v21;
  v34.size.height = v23;
  double MinX = CGRectGetMinX(v34);
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  double v31 = v28 + CGRectGetMinY(v35);
  v36.origin.x = v17;
  v36.origin.y = v19;
  v36.size.width = v21;
  v36.size.height = v23;
  objc_msgSend(v29, "setFrame:", MinX, v31, CGRectGetWidth(v36), v26);
}

id sub_10001200C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000120D4()
{
  return type metadata accessor for SeparatorView();
}

uint64_t type metadata accessor for SeparatorView()
{
  uint64_t result = qword_10002C708;
  if (!qword_10002C708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012128()
{
  uint64_t result = sub_1000187A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

double sub_1000121C8(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void *sub_1000121E4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100012228(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100012278()
{
  uint64_t v1 = sub_100018770();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v7[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor;
  *(void *)&v0[v5] = [self separatorColor];
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Separator.Position.bottom(_:), v1);
  v7[3] = sub_100018680();
  v7[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_10000FCF4(v7);
  sub_100018670();
  sub_100018780();

  sub_100018A60();
  __break(1u);
}

char *sub_1000123FC(double a1, double a2, double a3, double a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView] = 0;
  double v10 = self;
  double v11 = v4;
  id v12 = [v10 effectWithStyle:8];
  id v13 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v12];
  *(void *)&v11[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView] = v13;

  v27.receiver = v11;
  v27.super_class = ObjectType;
  double v14 = (char *)objc_msgSendSuper2(&v27, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v15 = OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView;
  double v16 = *(void **)&v14[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView];
  double v17 = v14;
  id v18 = [v16 contentView];
  objc_msgSend(v18, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  id v19 = [*(id *)&v14[v15] contentView];
  [v19 setInsetsLayoutMarginsFromSafeArea:0];

  id v20 = [*(id *)&v14[v15] layer];
  [v20 setCornerRadius:16.0];

  id v21 = [*(id *)&v14[v15] layer];
  [v21 setMasksToBounds:1];

  id v22 = [v17 layer];
  LODWORD(v23) = 1041865114;
  [v22 setShadowOpacity:v23];

  id v24 = [v17 layer];
  objc_msgSend(v24, "setShadowOffset:", 0.0, 6.0);

  id v25 = [v17 layer];
  [v25 setShadowRadius:16.0];

  [v17 addSubview:*(void *)&v14[v15]];
  return v17;
}

void sub_100012780(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView];
  *(void *)&v1[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView] = a1;
  id v8 = a1;
  [v3 removeFromSuperview];
  uint64_t v4 = *(void **)&v1[v2];
  if (v4)
  {
    uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView];
    id v6 = v4;
    id v7 = [v5 contentView];
    [v7 addSubview:v6];
  }
  [v1 setNeedsLayout];
}

void sub_100012850()
{
  v24.receiver = v0;
  v24.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v24, "layoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView];
  [v0 bounds];
  objc_msgSend(v1, "setFrame:");
  id v2 = [v1 contentView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = [v1 contentView];
  [v11 layoutMargins];
  double v13 = v12;
  double v15 = v14;

  double v16 = *(void **)&v0[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView];
  if (v16) {
    objc_msgSend(v16, "setFrame:", sub_1000121C8(v4, v6, v8, v10, v13, v15));
  }
  [v0 bounds];
  id v21 = objc_msgSend(self, "bezierPathWithRoundedRect:cornerRadius:", v17, v18, v19, v20, 16.0);
  id v22 = [v0 layer];
  id v23 = [v21 CGPath];
  [v22 setShadowPath:v23];
}

void sub_100012A90(double a1, double a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = [*(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_visualEffectView] contentView];
  [v6 layoutMargins];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v18.top = v8;
  v18.left = v10;
  v18.bottom = v12;
  v18.right = v14;
  double v15 = sub_1000189C0(v18);
  double v16 = *(void **)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService27ServiceOverlayContainerView_contentView];
  if (v16)
  {
    [v16 sizeThatFits:v15];
    v19.top = v8;
    v19.left = v10;
    v19.bottom = v12;
    v19.right = v14;
    sub_1000189D0(v19);
  }
  else
  {
    v17.receiver = v2;
    v17.super_class = ObjectType;
    objc_msgSendSuper2(&v17, "sizeThatFits:", a1, a2);
  }
}

uint64_t type metadata accessor for ServiceOverlayContainerView()
{
  return self;
}

unint64_t sub_100012C64(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EA20(&qword_10002C508);
  id v2 = (void *)sub_100018AA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  double v4 = (uint64_t *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *(v4 - 4);
    uint64_t v6 = *(v4 - 3);
    uint64_t v7 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_1000171C8(v5, v6, v7, v8);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    CGFloat v12 = (uint64_t *)(v2[6] + 32 * result);
    *CGFloat v12 = v5;
    v12[1] = v6;
    v12[2] = v7;
    v12[3] = v8;
    *(void *)(v2[7] + 8 * result) = v9;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 5;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012DA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EA20(&qword_10002C9A0);
  id v2 = (void *)sub_100018AA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  double v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000172FC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    CGFloat v12 = (void *)(v2[7] + 16 * result);
    *CGFloat v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012ECC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EA20(&qword_10002C990);
  uint64_t v2 = sub_100018AA0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000176E8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000172FC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000176D0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012FF8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EA20(&qword_10002C950);
  uint64_t v2 = (void *)sub_100018AA0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000172FC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

BOOL sub_10001311C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100013130()
{
  Swift::UInt v1 = *v0;
  sub_100018B10();
  sub_100018B20(v1);
  return sub_100018B30();
}

void sub_100013178()
{
  sub_100018B20(*v0);
}

Swift::Int sub_1000131A4()
{
  Swift::UInt v1 = *v0;
  sub_100018B10();
  sub_100018B20(v1);
  return sub_100018B30();
}

uint64_t *sub_1000131E8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_100013204(void *a1@<X8>)
{
  *a1 = *v1;
}

double sub_100013210()
{
  double result = 0.0;
  xmmword_10002D170 = xmmword_10001CD20;
  *(_OWORD *)&qword_10002D180 = xmmword_10001CD20;
  return result;
}

UIFontTextStyle sub_100013228()
{
  uint64_t v0 = sub_100018650();
  sub_100010E98(v0, qword_10002D190);
  uint64_t v1 = sub_10000FD58(v0, (uint64_t)qword_10002D190);
  *(void *)uint64_t v1 = UIFontTextStyleSubheadline;
  *(UIFontWeight *)(v1 + 8) = UIFontWeightSemibold;
  (*(void (**)(void))(*(void *)(v0 - 8) + 104))();

  return UIFontTextStyleSubheadline;
}

id sub_1000132E4()
{
  id result = [objc_allocWithZone((Class)ASCAdamID) initWithInt64:0x8000000000000000];
  qword_10002D1A8 = (uint64_t)result;
  return result;
}

uint64_t sub_10001331C()
{
  uint64_t v0 = sub_1000188B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  BOOL v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000188D0();
  sub_100010E98(v4, qword_10002D1B0);
  sub_10000FD58(v4, (uint64_t)qword_10002D1B0);
  if (qword_10002C338 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000FD58(v0, (uint64_t)qword_10002D138);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1000188C0();
}

char *sub_100013470(void *a1, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char v11 = v10;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v11[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor] = 0;
  *(void *)&v11[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v11[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_variant] = 0;
  v68 = a1;
  swift_unknownObjectWeakAssign();
  *(void *)&v11[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_localizer] = a2;
  id v21 = objc_allocWithZone((Class)ASCLockupView);
  id v22 = v11;
  id v67 = a2;
  id v23 = objc_msgSend(v21, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v22[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView] = v23;
  id v24 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v22[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel] = v24;
  type metadata accessor for SeparatorView();
  *(void *)&v22[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  id v25 = [objc_allocWithZone((Class)AMSMutableBinaryPromise) init];
  *(void *)&v22[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise] = v25;

  v69.receiver = v22;
  v69.super_class = ObjectType;
  id v26 = objc_msgSendSuper2(&v69, "initWithFrame:", a3, a4, a5, a6);
  uint64_t v27 = qword_10002C348;
  double v28 = (char *)v26;
  if (v27 != -1) {
    swift_once();
  }
  objc_msgSend(v28, "setLayoutMargins:", xmmword_10002D170, *(double *)&qword_10002D180, unk_10002D188);
  [v28 setInsetsLayoutMarginsFromSafeArea:0];
  uint64_t v29 = OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView;
  uint64_t v30 = *(void **)&v28[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView];
  [v30 setAutomaticallyGeneratesAppearMetrics:0];
  [v30 setAutomaticallyPresentsProductDetails:0];
  id v31 = v30;
  if (a8)
  {
    swift_bridgeObjectRetain();
    NSString v32 = sub_100018900();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v32 = 0;
  }
  [v30 setStoreSheetHostBundleID:v32];

  objc_super v33 = *(void **)&v28[v29];
  id v34 = v33;
  if (a10)
  {
    NSString v35 = sub_100018900();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v35 = 0;
  }
  [v33 setPresentingSceneIdentifier:v35];

  CGRect v36 = *(void **)&v28[v29];
  id v37 = v36;
  if (a8)
  {
    NSString v38 = sub_100018900();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v38 = 0;
  }
  [v36 setPresentingSceneBundleIdentifier:v38];

  v39 = *(void **)&v28[v29];
  v40 = self;
  id v41 = v39;
  id v42 = [v40 systemGrayColor];
  id v43 = [v40 whiteColor];
  id v44 = [v40 systemGrayColor];
  id v45 = [v40 systemGrayColor];
  uint64_t v66 = v29;
  id v46 = [self grayTheme];
  id v47 = [v46 progressColor];

  id v48 = [objc_allocWithZone((Class)ASCOfferTheme) initWithTitleBackgroundColor:v42 titleTextColor:v43 subtitleTextColor:v44 iconTintColor:v45 progressColor:v47];
  [v41 setOfferTheme:v48];

  uint64_t v49 = OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView;
  v50 = (char *)*(id *)&v28[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView];
  id v51 = [v40 systemGray2Color];
  uint64_t v52 = OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor;
  v53 = *(void **)&v50[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor];
  *(void *)&v50[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineColor] = v51;
  id v54 = v51;

  [*(id *)&v50[OBJC_IVAR____TtC23AppStoreOverlaysService13SeparatorView_lineView] setBackgroundColor:*(void *)&v50[v52]];
  uint64_t v55 = OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel;
  id v56 = *(id *)&v28[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel];
  id v57 = [v40 systemGrayColor];
  [v56 setTextColor:v57];

  v58 = *(void **)&v28[v55];
  [v58 setNumberOfLines:2];
  sub_10000EC7C(0, &qword_10002C9B8);
  if (qword_10002C350 != -1) {
    swift_once();
  }
  uint64_t v59 = sub_100018650();
  sub_10000FD58(v59, (uint64_t)qword_10002D190);
  id v60 = [v28 traitCollection];
  v61 = (void *)sub_1000189E0();

  [v58 setFont:v61];
  [v28 addSubview:*(void *)&v28[v55]];
  [v28 addSubview:*(void *)&v28[v49]];
  [v28 addSubview:*(void *)&v28[v66]];
  id v62 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v28 action:"didTapOnOverlay"];
  [v28 addGestureRecognizer:v62];
  sub_10000EA20(&qword_10002CA10);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_10001C9E0;
  *(void *)(v63 + 32) = sub_1000187B0();
  *(void *)(v63 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  v64 = v28;
  sub_1000189F0();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v64;
}

char *sub_100013B68(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  id v22 = objc_allocWithZone((Class)swift_getObjectType());
  id v23 = a2;
  id v24 = a3;
  id v25 = sub_100013470(v23, v24, a8, a9, a10, a11, a4, a5, a6, a7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  id v26 = *(void **)&v25[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView];
  uint64_t v27 = v25;
  [v26 setDelegate:v27];
  id v28 = v26;
  id v29 = a1;
  [v28 setRequest:v29];

  return v27;
}

char *sub_100013CD4(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  id v22 = objc_allocWithZone((Class)swift_getObjectType());
  id v23 = a2;
  id v24 = a3;
  id v25 = sub_100013470(v23, v24, a8, a9, a10, a11, a4, a5, a6, a7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  id v26 = *(void **)&v25[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView];
  uint64_t v27 = v25;
  [v26 setDelegate:v27];
  [v26 setLockup:a1];
  id v28 = *(id *)&v27[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise];
  [v28 finishWithSuccess];

  return v27;
}

uint64_t sub_100013E4C(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(void *, void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, double, double, double, double))
{
  uint64_t v13 = a11;
  if (!a10)
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    if (a11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v25 = 0;
    return a12(a7, a8, a9, v21, v23, v13, v25, a1, a2, a3, a4);
  }
  uint64_t v21 = sub_100018930();
  uint64_t v23 = v22;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_100018930();
  uint64_t v25 = v24;
  return a12(a7, a8, a9, v21, v23, v13, v25, a1, a2, a3, a4);
}

void sub_100014054(unint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_variant) = a1;
  if (a1 >= 3)
  {
    sub_100018AE0();
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);
    sub_100018930();
    NSString v3 = sub_100018900();
    swift_bridgeObjectRelease();
    [v2 setStoreSheetUsageContext:v3];

    sub_100014114();
  }
}

void sub_100014114()
{
  uint64_t v2 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_msgSend(self, "asc_storefrontLocale");
  if (!v4)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v5 = v4;
  if (objc_msgSend(v4, "asc_prefersRightToLeftLayout"))
  {
    v22.receiver = v2;
    v22.super_class = ObjectType;
    objc_msgSendSuper2(&v22, "setSemanticContentAttribute:", 4);
    uint64_t v6 = *(void **)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel];
    uint64_t v21 = v2;
    uint64_t v7 = (objc_super *)&v21;
  }
  else
  {
    v25.receiver = v2;
    v25.super_class = ObjectType;
    objc_msgSendSuper2(&v25, "setSemanticContentAttribute:", 3);
    uint64_t v6 = *(void **)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel];
    v24.receiver = v2;
    uint64_t v7 = &v24;
  }
  v7->super_class = ObjectType;
  objc_msgSend(v6, "setSemanticContentAttribute:", -[objc_super semanticContentAttribute](v7, "semanticContentAttribute"));
  id v8 = [*(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView] lockup];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 offer];

    if (!v10) {
      goto LABEL_18;
    }
    id v11 = [v10 subtitles];
    swift_unknownObjectRelease();
    type metadata accessor for ASCOfferTitleVariant();
    sub_100017B44(&qword_10002C9B0, (void (*)(uint64_t))type metadata accessor for ASCOfferTitleVariant);
    uint64_t v12 = sub_1000188F0();

    if (qword_10002C368 == -1)
    {
      if (*(void *)(v12 + 16))
      {
LABEL_9:
        id v13 = (id)qword_10002D1C8;
        unint64_t v14 = sub_100017268((uint64_t)v13);
        if (v15)
        {
          id v10 = *(id *)(*(void *)(v12 + 56) + 16 * v14 + 8);
          swift_bridgeObjectRetain();
        }
        else
        {
          id v10 = 0;
        }

        goto LABEL_17;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v12 + 16)) {
        goto LABEL_9;
      }
    }
    id v10 = 0;
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  id v10 = 0;
LABEL_18:
  uint64_t v1 = *(void *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_variant];
  switch(v1)
  {
    case 2:
      if (!v10)
      {
        id v16 = *(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_localizer];
        uint64_t v18 = 0xD000000000000014;
        long long v17 = (void *)0x800000010001DF10;
        goto LABEL_24;
      }
LABEL_25:
      NSString v19 = sub_100018900();
      swift_bridgeObjectRelease();
      [v6 setText:v19];

      uint64_t v20 = 0;
LABEL_28:
      [v6 setHidden:v20];
      [*(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView] setHidden:v20];

      return;
    case 1:
      if (!v10)
      {
        id v16 = *(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_localizer];
        long long v17 = (void *)0x800000010001DF30;
        uint64_t v18 = 0xD000000000000010;
LABEL_24:
        sub_100010320(v18, v17);

        goto LABEL_25;
      }
      goto LABEL_25;
    case 0:
      swift_bridgeObjectRelease();
      uint64_t v20 = 1;
      goto LABEL_28;
  }
LABEL_30:
  swift_bridgeObjectRelease();
  uint64_t v23 = v1;
  sub_100018AE0();
  __break(1u);
}

void sub_10001464C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_hostSignpostSpan);
  if (v5)
  {
    if (!a1) {
      goto LABEL_5;
    }
    sub_10000EC7C(0, (unint64_t *)&unk_10002CA00);
    id v6 = v5;
    id v7 = a1;
    char v8 = sub_100018A00();

    if (v8) {
      return;
    }
    uint64_t v5 = *(void **)(v2 + v4);
    if (v5)
    {
LABEL_5:
      uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v5;
      v14[4] = sub_100017C68;
      v14[5] = v10;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 1107296256;
      v14[2] = sub_100014860;
      void v14[3] = &unk_100025580;
      id v11 = _Block_copy(v14);
      id v12 = v5;
      swift_release();
      [v9 setViewRenderSpanProvider:v11];
      _Block_release(v11);

      return;
    }
  }
  else if (!a1)
  {
    return;
  }
  id v13 = *(void **)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);

  [v13 setViewRenderSpanProvider:0];
}

uint64_t sub_1000147F8(void *a1)
{
  sub_10000EA20(&qword_10002C520);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001C9F0;
  *(void *)(v2 + 32) = a1;
  uint64_t v5 = v2;
  sub_100018980();
  id v3 = a1;
  return v5;
}

Class sub_100014860(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  swift_release();
  sub_10000EC7C(0, (unint64_t *)&unk_10002CA00);
  v3.super.Class isa = sub_100018960().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

uint64_t sub_1000149BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v3 = sub_100018700();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  uint64_t v74 = v4;
  __chkstk_darwin(v3);
  uint64_t v55 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1000186B0();
  uint64_t v77 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  id v54 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000186F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v53 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100018620();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EA20(&qword_10002C9C0);
  uint64_t v14 = *(void *)(sub_100018730() - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v71 = *(void *)(v14 + 72);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10001CD30;
  uint64_t v72 = v2;
  long long v17 = *(void **)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_calloutLabel);
  uint64_t v86 = sub_10000EC7C(0, &qword_10002C9C8);
  v87 = &protocol witness table for UIView;
  v85 = v17;
  uint64_t v18 = qword_10002C350;
  id v19 = v17;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v52 = v16;
  unint64_t v20 = v16 + v15;
  uint64_t v21 = sub_100018650();
  uint64_t v22 = sub_10000FD58(v21, (uint64_t)qword_10002D190);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v13, v22, v21);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for FontSource.useCase(_:), v10);
  v83 = (void *)sub_100018690();
  v84 = &protocol witness table for StaticDimension;
  sub_10000FCF4(&v82);
  *((void *)&v80 + 1) = v10;
  v81 = &protocol witness table for FontSource;
  uint64_t v23 = sub_10000FCF4((uint64_t *)&v79);
  (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(v23, v13, v10);
  sub_1000186A0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v81 = 0;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v60 = sub_10000EA20(&qword_10002C9D0);
  uint64_t v76 = v8;
  uint64_t v24 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v70 = ((v24 + 32) & ~v24) + *(void *)(v8 + 72);
  uint64_t v68 = (v24 + 32) & ~v24;
  uint64_t v69 = v24 | 7;
  uint64_t v25 = swift_allocObject();
  long long v67 = xmmword_10001C9E0;
  *(_OWORD *)(v25 + 16) = xmmword_10001C9E0;
  sub_1000186E0();
  uint64_t v78 = v25;
  uint64_t v66 = sub_100017B44(&qword_10002C9D8, (void (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition);
  uint64_t v65 = sub_10000EA20(&qword_10002C9E0);
  unint64_t v64 = sub_100017B8C();
  id v26 = v53;
  uint64_t v27 = v7;
  sub_100018A30();
  uint64_t v28 = v77;
  v58 = *(void (**)(void))(v77 + 104);
  uint64_t v59 = v77 + 104;
  id v29 = v54;
  uint64_t v30 = v75;
  ((void (*)(char *, void, uint64_t))v58)(v54, enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:), v75);
  unsigned int v51 = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
  uint64_t v31 = v74;
  v50 = *(void (**)(char *))(v74 + 104);
  uint64_t v57 = v74 + 104;
  NSString v32 = v55;
  uint64_t v33 = v73;
  v50(v55);
  unint64_t v49 = v20;
  sub_100018720();
  uint64_t v63 = *(void (**)(char *, uint64_t))(v31 + 8);
  v63(v32, v33);
  id v34 = *(void (**)(char *, uint64_t))(v28 + 8);
  uint64_t v77 = v28 + 8;
  id v62 = v34;
  v34(v29, v30);
  NSString v35 = *(void (**)(char *, uint64_t))(v76 + 8);
  v76 += 8;
  v61 = v35;
  v35(v26, v27);
  sub_10000FD90((uint64_t)&v79, &qword_10002C9F0);
  sub_100012228((uint64_t)&v82);
  sub_100012228((uint64_t)&v85);
  unint64_t v47 = v20 + v71;
  uint64_t v74 = v31 + 8;
  CGRect v36 = *(void **)(v72 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_separatorView);
  uint64_t v86 = type metadata accessor for SeparatorView();
  v87 = &protocol witness table for UIView;
  v85 = v36;
  v83 = &type metadata for Double;
  v84 = &protocol witness table for Double;
  v81 = 0;
  uint64_t v82 = 0x4028000000000000;
  long long v79 = 0u;
  long long v80 = 0u;
  unsigned int v48 = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
  v58(v29);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = v67;
  id v38 = v36;
  sub_1000186E0();
  uint64_t v78 = v37;
  sub_100018A30();
  uint64_t v39 = v51;
  uint64_t v40 = v73;
  id v41 = (void (*)(char *, uint64_t, uint64_t))v50;
  ((void (*)(char *, void, uint64_t))v50)(v32, v51, v73);
  sub_100018720();
  v63(v32, v40);
  v61(v26, v27);
  uint64_t v42 = v75;
  v62(v29, v75);
  sub_10000FD90((uint64_t)&v79, &qword_10002C9F0);
  sub_100012228((uint64_t)&v82);
  sub_100012228((uint64_t)&v85);
  unint64_t v71 = v49 + 2 * v71;
  id v43 = *(void **)(v72 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);
  uint64_t v86 = sub_10000EC7C(0, &qword_10002C9F8);
  v87 = &protocol witness table for UIView;
  v85 = v43;
  v84 = &protocol witness table for Double;
  v83 = &type metadata for Double;
  v81 = &protocol witness table for Double;
  uint64_t v82 = 0x4024000000000000;
  *((void *)&v80 + 1) = &type metadata for Double;
  *(void *)&long long v79 = 0x4024000000000000;
  ((void (*)(char *, void, uint64_t))v58)(v29, v48, v42);
  v41(v32, v39, v40);
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v67;
  id v45 = v43;
  sub_1000186D0();
  uint64_t v78 = v44;
  sub_100018A30();
  sub_100018720();
  v61(v26, v27);
  v63(v32, v40);
  v62(v29, v75);
  sub_10000FD90((uint64_t)&v79, &qword_10002C9F0);
  sub_100012228((uint64_t)&v82);
  sub_100012228((uint64_t)&v85);
  return sub_100018710();
}

id sub_100015BA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100018560();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018800();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000188D0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_lockupView);
  id result = [v11 lockup];
  if (result)
  {
    id v13 = result;
    v53 = v11;
    id v54 = v5;
    sub_10000EC7C(0, &qword_10002C958);
    id v14 = [v13 id];
    if (qword_10002C358 != -1) {
      swift_once();
    }
    char v15 = sub_100018A00();

    if (v15)
    {
      if (qword_10002C360 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_10000FD58(v7, (uint64_t)qword_10002D1B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v16, v7);
      sub_10000EA20(&qword_10002C960);
      sub_100018820();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001C9E0;
      sub_1000187F0();
      v57._countAndFlagsBits = 0xD00000000000002ALL;
      v57._object = (void *)0x800000010001DE00;
      sub_1000187E0(v57);
      id v17 = [v13 id];
      uint64_t v56 = sub_10000EC7C(0, &qword_10002C968);
      v55[0] = v17;
      sub_1000187D0();
      sub_10000FD90((uint64_t)v55, &qword_10002C970);
      v58._object = (void *)0x800000010001DE30;
      v58._countAndFlagsBits = 0xD000000000000017;
      sub_1000187E0(v58);
      sub_100018810();
      sub_100018870();

      swift_bridgeObjectRelease();
      return (id)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    else
    {
      id v18 = [v13 metrics];
      if (v18)
      {
        id v19 = v18;
        Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          uint64_t v21 = Strong;
          [Strong reportClickWithViewMetrics:v19];
        }
      }
      uint64_t v22 = (id *)(v1 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor);
      swift_beginAccess();
      if (*v22) {
        [*v22 recordClickThroughImpressionWithDidInitiateDownload:0];
      }
      uint64_t v51 = v2;
      if (qword_10002C360 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_10000FD58(v7, (uint64_t)qword_10002D1B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v23, v7);
      sub_10000EA20(&qword_10002C960);
      sub_100018820();
      uint64_t v24 = swift_allocObject();
      long long v52 = xmmword_10001C9E0;
      *(_OWORD *)(v24 + 16) = xmmword_10001C9E0;
      sub_1000187F0();
      v59._countAndFlagsBits = 0xD000000000000026;
      v59._object = (void *)0x800000010001DDD0;
      sub_1000187E0(v59);
      id v25 = [v13 id];
      uint64_t v56 = sub_10000EC7C(0, &qword_10002C968);
      v55[0] = v25;
      sub_1000187D0();
      sub_10000FD90((uint64_t)v55, &qword_10002C970);
      v60._countAndFlagsBits = 0;
      v60._object = (void *)0xE000000000000000;
      sub_1000187E0(v60);
      sub_100018810();
      sub_100018870();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      id v26 = [v13 id];
      id v27 = [v13 kind];
      id v28 = [v13 offer];
      if (v28)
      {
        id v29 = [v28 flags];
        swift_unknownObjectRelease();
      }
      else
      {
        id v29 = 0;
      }
      uint64_t v50 = v3;
      uint64_t v30 = self;
      Class isa = (Class)[v30 queryParametersForLockup:v13];
      if (isa)
      {
        uint64_t v32 = sub_1000188F0();

        sub_100016510(v32);
        swift_bridgeObjectRelease();
        Class isa = sub_1000188E0().super.isa;
        swift_bridgeObjectRelease();
      }
      uint64_t v33 = v53;
      id v34 = [v30 URLForLockupID:v26 ofKind:v27 offerFlags:v29 queryParameters:isa];

      sub_100018550();
      id result = [self defaultWorkspace];
      if (result)
      {
        CGRect v36 = result;
        sub_100018540(v35);
        id v38 = v37;
        sub_10000EA20(&qword_10002C978);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v52;
        *(void *)(inited + 32) = sub_100018930();
        *(void *)(inited + 40) = v40;
        sub_10000EA20(&qword_10002C980);
        uint64_t v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = v52;
        *(void *)(v41 + 32) = sub_100018930();
        *(void *)(v41 + 40) = v42;
        id v43 = [v33 storeSheetHostBundleID];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = sub_100018930();
          uint64_t v47 = v46;
        }
        else
        {
          uint64_t v45 = 0;
          uint64_t v47 = 0;
        }
        *(void *)(v41 + 48) = v45;
        *(void *)(v41 + 56) = v47;
        unint64_t v48 = sub_100012DA8(v41);
        *(void *)(inited + 72) = sub_10000EA20(&qword_10002C988);
        *(void *)(inited + 48) = v48;
        sub_100012ECC(inited);
        Class v49 = sub_1000188E0().super.isa;
        swift_bridgeObjectRelease();
        [v36 openURL:v38 withOptions:v49];

        return (id)(*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v54, v51);
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

unint64_t sub_100016510(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_10000EA20(&qword_10002C990);
    uint64_t v2 = (void *)sub_100018AA0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  uint64_t v11 = &type metadata for String;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1000176E0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000176D0(v6, v7);
    sub_1000176D0(v7, v40);
    sub_1000176D0(v40, &v38);
    unint64_t result = sub_1000172FC(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      id v13 = v6;
      uint64_t v14 = v1;
      char v15 = v11;
      uint64_t v16 = v10;
      id v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      id v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_100012228((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1000176D0(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v27 = (uint64_t *)(v2[6] + 16 * result);
    *id v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1000176D0(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1000168C4()
{
  sub_10000EA20(&qword_10002C948);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001C9E0;
  strcpy((char *)(inited + 32), "usageContext");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  if (*(void *)(v0 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_variant) >= 3uLL)
  {
    unint64_t result = sub_100018AE0();
    __break(1u);
  }
  else
  {
    uint64_t v2 = inited;
    *(void *)(inited + 48) = sub_100018930();
    *(void *)(v2 + 56) = v3;
    return sub_100012FF8(v2);
  }
  return result;
}

uint64_t type metadata accessor for ServiceOverlayLockupView()
{
  return self;
}

id sub_100016AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000EA20(&qword_10002C608);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v46 = (char *)&v45 - v8;
  sub_1000189A0();
  sub_10000EA20(&qword_10002C510);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001C9E0;
  uint64_t v10 = sub_100018930();
  uint64_t v12 = v11;
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_10000EC28();
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v12;
  sub_10000EC7C(0, &qword_10002C500);
  id v13 = (void *)sub_100018A10();
  sub_100018600();
  swift_bridgeObjectRelease();

  uint64_t v14 = sub_100018560();
  char v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v47 = a1;
  v15(a1, 1, 1, v14);
  uint64_t v16 = sub_100018930();
  uint64_t v18 = v17;
  if (v16 == sub_100018930() && v18 == v19) {
    goto LABEL_3;
  }
  char v20 = sub_100018AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_8;
  }
  uint64_t v21 = sub_100018930();
  uint64_t v23 = v22;
  if (v21 == sub_100018930() && v23 == v24) {
    goto LABEL_3;
  }
  char v25 = sub_100018AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_8;
  }
  uint64_t v28 = sub_100018930();
  uint64_t v30 = v29;
  if (v28 == sub_100018930() && v30 == v31)
  {
LABEL_3:
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  char v32 = sub_100018AD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32)
  {
LABEL_8:
    char v26 = (id *)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor);
    swift_beginAccess();
    id result = *v26;
    if (*v26) {
      return [result recordClickThroughImpressionWithDidInitiateDownload:1];
    }
    return result;
  }
  uint64_t v33 = sub_100018930();
  uint64_t v35 = v34;
  if (v33 == sub_100018930() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v37 = sub_100018AD0();
    swift_bridgeObjectRelease();
    id result = (id)swift_bridgeObjectRelease();
    if ((v37 & 1) == 0) {
      return result;
    }
  }
  long long v38 = (void **)(v2 + OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_adInteractionAttributor);
  swift_beginAccess();
  uint64_t v39 = *v38;
  if (v39)
  {
    swift_endAccess();
    id v40 = [v39 processReengagement];
    if (v40)
    {
      uint64_t v41 = v40;
      sub_100018550();

      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v42 = 1;
    }
    uint64_t v44 = (uint64_t)v46;
    uint64_t v43 = v47;
    sub_10000FD90(v47, &qword_10002C608);
    v15((uint64_t)v7, v42, 1, v14);
    sub_100017160((uint64_t)v7, v44);
  }
  else
  {
    uint64_t v43 = v47;
    sub_10000FD90(v47, &qword_10002C608);
    swift_endAccess();
    uint64_t v44 = (uint64_t)v46;
    v15((uint64_t)v46, 1, 1, v14);
  }
  return (id)sub_100017160(v44, v43);
}

ValueMetadata *type metadata accessor for ServiceOverlayLockupView.Variant()
{
  return &type metadata for ServiceOverlayLockupView.Variant;
}

unint64_t sub_1000170CC()
{
  unint64_t result = qword_10002C940;
  if (!qword_10002C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C940);
  }
  return result;
}

NSString sub_100017120()
{
  NSString result = sub_100018900();
  qword_10002D1C8 = (uint64_t)result;
  return result;
}

uint64_t sub_100017160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000EA20(&qword_10002C608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000171C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100018B10();
  sub_100018950();
  sub_100018950();
  Swift::Int v8 = sub_100018B30();

  return sub_100017374(a1, a2, a3, a4, v8);
}

unint64_t sub_100017268(uint64_t a1)
{
  sub_100018930();
  sub_100018B10();
  sub_100018950();
  Swift::Int v2 = sub_100018B30();
  swift_bridgeObjectRelease();

  return sub_100017474(a1, v2);
}

unint64_t sub_1000172FC(uint64_t a1, uint64_t a2)
{
  sub_100018B10();
  sub_100018950();
  Swift::Int v4 = sub_100018B30();

  return sub_1000175EC(a1, a2, v4);
}

unint64_t sub_100017374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = a5 & ~v7;
  if ((*(void *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(v5 + 48);
    do
    {
      char v15 = (void *)(v14 + 32 * v8);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[3];
      BOOL v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_100018AD0() & 1) != 0)
      {
        BOOL v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_100018AD0() & 1) != 0) {
          break;
        }
      }
      unint64_t v8 = (v8 + 1) & v13;
    }
    while (((*(void *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_100017474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100018930();
    uint64_t v8 = v7;
    if (v6 == sub_100018930() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100018AD0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100018930();
          uint64_t v15 = v14;
          if (v13 == sub_100018930() && v15 == v16) {
            break;
          }
          char v18 = sub_100018AD0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1000175EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100018AD0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100018AD0() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_1000176D0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000176E0()
{
  return swift_release();
}

uint64_t sub_1000176E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000EA20(&qword_10002C998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100017750()
{
  sub_100018990();
  sub_10000EA20(&qword_10002C510);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001C9E0;
  long long v2 = v0;
  id v3 = [v2 description];
  uint64_t v4 = sub_100018930();
  uint64_t v6 = v5;

  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 64) = sub_10000EC28();
  *(void *)(v1 + 32) = v4;
  *(void *)(v1 + 40) = v6;
  sub_10000EC7C(0, &qword_10002C500);
  uint64_t v7 = (void *)sub_100018A10();
  sub_100018600();
  swift_bridgeObjectRelease();

  [*(id *)&v2[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise] finishWithSuccess];
  sub_100014114();
}

void sub_100017870()
{
  uint64_t v1 = v0;
  sub_1000189B0();
  sub_10000EA20(&qword_10002C510);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001CCB0;
  swift_getErrorValue();
  uint64_t v3 = sub_100018B00();
  uint64_t v5 = v4;
  *(void *)(v2 + 56) = &type metadata for String;
  unint64_t v6 = sub_10000EC28();
  *(void *)(v2 + 64) = v6;
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v5;
  uint64_t v7 = v1;
  id v8 = [v7 description];
  uint64_t v9 = sub_100018930();
  uint64_t v11 = v10;

  *(void *)(v2 + 96) = &type metadata for String;
  *(void *)(v2 + 104) = v6;
  *(void *)(v2 + 72) = v9;
  *(void *)(v2 + 80) = v11;
  sub_10000EC7C(0, &qword_10002C500);
  uint64_t v12 = (void *)sub_100018A10();
  sub_100018600();
  swift_bridgeObjectRelease();

  uint64_t v13 = *(void **)&v7[OBJC_IVAR____TtC23AppStoreOverlaysService24ServiceOverlayLockupView_loadLockupPromise];
  BOOL v14 = (void *)sub_100018520();
  [v13 finishWithError:v14];
}

id sub_1000179F0()
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong
    || (uint64_t v1 = Strong, v2 = [Strong activity], v1, !v2))
  {
    sub_1000189B0();
    sub_10000EA20(&qword_10002C510);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10001C9E0;
    swift_unknownObjectWeakLoadStrong();
    sub_10000EA20(&qword_10002C9A8);
    uint64_t v4 = sub_100018940();
    uint64_t v6 = v5;
    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 64) = sub_10000EC28();
    *(void *)(v3 + 32) = v4;
    *(void *)(v3 + 40) = v6;
    sub_10000EC7C(0, &qword_10002C500);
    uint64_t v7 = (void *)sub_100018A10();
    sub_100018600();
    swift_bridgeObjectRelease();

    return [objc_allocWithZone((Class)ASCMetricsActivity) init];
  }
  return v2;
}

uint64_t sub_100017B44(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100017B8C()
{
  unint64_t result = qword_10002C9E8;
  if (!qword_10002C9E8)
  {
    sub_100017BE8(&qword_10002C9E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C9E8);
  }
  return result;
}

uint64_t sub_100017BE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100017C30()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017C68()
{
  return sub_1000147F8(*(void **)(v0 + 16));
}

uint64_t sub_100017C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017C80()
{
  return swift_release();
}

uint64_t sub_100017C88()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100017CBC()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "[AttributionKit] Unable to record an AttributionKit impression because the advertised item id is invalid.", v2, v3, v4, v5, v6);
}

void sub_100017CF0()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "Unable to record install attribution because the ad network is missing.", v2, v3, v4, v5, v6);
}

void sub_100017D24(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to record install attribution because not all required parameters were provided: configuration=%{private}@ hostBundleId=%{private}@", (uint8_t *)&v3, 0x16u);
}

void sub_100017DAC()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "Unable to record install attribution because the provided sourceAppAdamId isn't a NSNumber.", v2, v3, v4, v5, v6);
}

void sub_100017DE0()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "Unable to record install attribution since version was not a string", v2, v3, v4, v5, v6);
}

void sub_100017E14()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "[AttributionKit] Unable to process AdAttributionKit re-engagement because the advertised item id is invalid.", v2, v3, v4, v5, v6);
}

void sub_100017E48()
{
  sub_100003B60();
  sub_100003B44((void *)&_mh_execute_header, v0, v1, "[AttributionKit] Unable to process AdAttributionKit re-engagement because the JWS impression is missing.", v2, v3, v4, v5, v6);
}

void sub_100017E7C(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Did finishing dismissing lockup overlay with error: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100017EFC(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Start executing dismiss overlay operation: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100017F7C(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Finish dismiss overlay operation: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100017FFC()
{
  sub_100003B60();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to find a lockup definition so resolving to an error.", v1, 2u);
}

void sub_10001803C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Tried to use an app clip overlay configuration outside of an app clip: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000180B4()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "Loading overlay view using app clip lockup provider", v2, v3, v4, v5, v6);
}

void sub_1000180E8()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "Creating lockup view", v2, v3, v4, v5, v6);
}

void sub_10001811C()
{
  sub_100003B60();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "A lockup definition has neither a request or lockup. This shouldn't happen.", v1, 2u);
}

void sub_10001815C()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "App clip lockup did finish loading", v2, v3, v4, v5, v6);
}

void sub_100018190()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "Missing app identifier", v2, v3, v4, v5, v6);
}

void sub_1000181C4()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "Loading overlay view using app lockup provider", v2, v3, v4, v5, v6);
}

void sub_1000181F8()
{
  sub_100003B60();
  sub_1000060CC((void *)&_mh_execute_header, v0, v1, "App lockup did finish loading", v2, v3, v4, v5, v6);
}

void sub_10001822C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find overlay provider", v1, 2u);
}

void sub_100018270(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[AttributionKit] Click through impression was recorded during purchasing, skipping processing re-engagement", v1, 2u);
}

void sub_1000182B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Rate limit exceeded", v1, 2u);
}

void sub_1000182F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Did finishing presenting lockup overlay with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100018370(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = 138543618;
  id v7 = WeakRetained;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ posted %{public}@ metrics", (uint8_t *)&v6, 0x16u);
}

void sub_100018424(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = AMSLogableError();
  int v8 = 138543874;
  id v9 = WeakRetained;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ could not post %{public}@ metrics, reason: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_1000184F8()
{
}

uint64_t sub_100018520()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100018530()
{
  return _convertNSErrorToError(_:)();
}

void sub_100018540(NSURL *retstr@<X8>)
{
}

uint64_t sub_100018550()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018560()
{
  return type metadata accessor for URL();
}

uint64_t sub_100018570()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_100018580()
{
  return Date.init()();
}

uint64_t sub_100018590()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000185A0()
{
  return Locale.identifier.getter();
}

uint64_t sub_1000185B0()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000185C0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000185D0()
{
  return static ImpressionIntake.recordImpression(advertisedItemID:compactJWS:interactionType:clientBundleID:)();
}

uint64_t sub_1000185E0()
{
  return type metadata accessor for ImpressionIntake.InteractionType();
}

uint64_t sub_1000185F0()
{
  return static ImpressionIntake.processReengagement(advertisedItemID:compactJWS:clientBundleID:url:)();
}

uint64_t sub_100018600()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100018610()
{
  return static Dimensions.defaultRoundingRule.getter();
}

uint64_t sub_100018620()
{
  return type metadata accessor for FontSource();
}

uint64_t sub_100018630()
{
  return type metadata accessor for LayoutRect();
}

uint64_t sub_100018640()
{
  return dispatch thunk of Measurable.measurements(fitting:in:)();
}

uint64_t sub_100018650()
{
  return type metadata accessor for FontUseCase();
}

uint64_t sub_100018660()
{
  return AnyDimension.value(in:rounded:)();
}

uint64_t sub_100018670()
{
  return static ZeroDimension.zero.getter();
}

uint64_t sub_100018680()
{
  return type metadata accessor for ZeroDimension();
}

uint64_t sub_100018690()
{
  return type metadata accessor for StaticDimension();
}

uint64_t sub_1000186A0()
{
  return StaticDimension.init(_:scaledLike:)();
}

uint64_t sub_1000186B0()
{
  return type metadata accessor for VerticalFlowLayout.VerticalPlacement();
}

uint64_t sub_1000186C0()
{
  return VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1000186D0()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_1000186E0()
{
  return static VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_1000186F0()
{
  return type metadata accessor for VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_100018700()
{
  return type metadata accessor for VerticalFlowLayout.HorizontalPlacement();
}

uint64_t sub_100018710()
{
  return VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_100018720()
{
  return static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)();
}

uint64_t sub_100018730()
{
  return type metadata accessor for VerticalFlowLayout.Child();
}

uint64_t sub_100018740()
{
  return type metadata accessor for VerticalFlowLayout();
}

uint64_t sub_100018750()
{
  return Separator.verticalOutset.getter();
}

uint64_t sub_100018760()
{
  return Separator.height(in:)();
}

uint64_t sub_100018770()
{
  return type metadata accessor for Separator.Position();
}

uint64_t sub_100018780()
{
  return Separator.init(position:leadingInset:trailingInset:verticalOutset:)();
}

uint64_t sub_100018790()
{
  return static Separator.thickness(compatibleWith:)();
}

uint64_t sub_1000187A0()
{
  return type metadata accessor for Separator();
}

uint64_t sub_1000187B0()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_1000187C0()
{
  return LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)();
}

uint64_t sub_1000187D0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

void sub_1000187E0(Swift::String a1)
{
}

uint64_t sub_1000187F0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100018800()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_100018810()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_100018820()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_100018830(Swift::String forKey, Swift::String_optional in)
{
  return LocalizedStringTable.localizedString(forKey:in:)(forKey, in).value._countAndFlagsBits;
}

uint64_t sub_100018840()
{
  return LocalizedStringTable.init(targetBundle:languageCodes:)();
}

uint64_t sub_100018850()
{
  return LocalizedStringTable.locale.getter();
}

uint64_t sub_100018860()
{
  return type metadata accessor for LocalizedStringTable();
}

uint64_t sub_100018870()
{
  return Logger.info(_:)();
}

uint64_t sub_100018880()
{
  return Logger.error(_:)();
}

uint64_t sub_100018890()
{
  return Logger.warning(_:)();
}

uint64_t sub_1000188A0()
{
  return OSLogger.Subsystem.init(rawValue:)();
}

uint64_t sub_1000188B0()
{
  return type metadata accessor for OSLogger.Subsystem();
}

uint64_t sub_1000188C0()
{
  return OSLogger.init(subsystem:category:)();
}

uint64_t sub_1000188D0()
{
  return type metadata accessor for OSLogger();
}

NSDictionary sub_1000188E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000188F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100018900()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100018910()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100018920()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100018930()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018940()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100018950()
{
  return String.hash(into:)();
}

NSArray sub_100018960()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100018970()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018980()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100018990()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000189A0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000189B0()
{
  return static os_log_type_t.error.getter();
}

double sub_1000189C0(UIEdgeInsets insets)
{
  *(void *)&double result = *(_OWORD *)&CGSize.subtracting(insets:)(insets);
  return result;
}

double sub_1000189D0(UIEdgeInsets outsets)
{
  *(void *)&double result = *(_OWORD *)&CGSize.adding(outsets:)(outsets);
  return result;
}

uint64_t sub_1000189E0()
{
  return static UIFont.preferredFont(forUseWith:compatibleWith:)();
}

uint64_t sub_1000189F0()
{
  return UIView.registerForTraitChanges(_:action:)();
}

uint64_t sub_100018A00()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100018A10()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100018A20()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100018A30()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100018A40()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100018A50()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100018A60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018A70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100018A80()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100018A90()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018AA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100018AC0()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

uint64_t sub_100018AD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018AE0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_100018AF0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018B00()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100018B10()
{
  return Hasher.init(_seed:)();
}

void sub_100018B20(Swift::UInt a1)
{
}

Swift::Int sub_100018B30()
{
  return Hasher._finalize()();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return _BSUIConstrainValueWithRubberBand();
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return _CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__initWithID_kind_context_minExternalVersionID_latestReleaseID_productVariantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:");
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessQueue];
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return _[a1 acquire];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _[a1 activity];
}

id objc_msgSend_adInteractionAttributor(void *a1, const char *a2, ...)
{
  return _[a1 adInteractionAttributor];
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addInstallAttributionParamsWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInstallAttributionParamsWithConfig:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_additionalMetricsFields(void *a1, const char *a2, ...)
{
  return _[a1 additionalMetricsFields];
}

id objc_msgSend_additionalValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalValueForKey:");
}

id objc_msgSend_additionalValueForKey_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalValueForKey:serviceContext:");
}

id objc_msgSend_appClipParentApplicationRecord(void *a1, const char *a2, ...)
{
  return _[a1 appClipParentApplicationRecord];
}

id objc_msgSend_appClipParentBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appClipParentBundleIdentifier];
}

id objc_msgSend_appDevelopmentLockupForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDevelopmentLockupForConfiguration:serviceContext:");
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifier];
}

id objc_msgSend_applicationRecord(void *a1, const char *a2, ...)
{
  return _[a1 applicationRecord];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _[a1 applicationState];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascArtworkForIcon_shape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascArtworkForIcon:shape:");
}

id objc_msgSend_attributionTimer(void *a1, const char *a2, ...)
{
  return _[a1 attributionTimer];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleIdentifierFromApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierFromApplicationIdentifier:");
}

id objc_msgSend_campaignToken(void *a1, const char *a2, ...)
{
  return _[a1 campaignToken];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_catchWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "catchWithBlock:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compactJWSDictionaryKey(void *a1, const char *a2, ...)
{
  return _[a1 compactJWSDictionaryKey];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configureLockupView_forAppClipWithConfiguration_serviceContext_metricsReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureLockupView:forAppClipWithConfiguration:serviceContext:metricsReporter:");
}

id objc_msgSend_configureLockupView_forAppWithConfiguration_serviceContext_metricsReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureLockupView:forAppWithConfiguration:serviceContext:metricsReporter:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containerConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 containerConfiguration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_convertErrorIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertErrorIfNeeded:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentOverlayPresenter(void *a1, const char *a2, ...)
{
  return _[a1 currentOverlayPresenter];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultLocalizer(void *a1, const char *a2, ...)
{
  return _[a1 defaultLocalizer];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didFailToLoadWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToLoadWithError:");
}

id objc_msgSend_didFinishDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishDismissal:");
}

id objc_msgSend_didFinishPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishPresentation:");
}

id objc_msgSend_didInitiateDownload(void *a1, const char *a2, ...)
{
  return _[a1 didInitiateDownload];
}

id objc_msgSend_dismissOverlayAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissOverlayAnimated:");
}

id objc_msgSend_dismissOverlayWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissOverlayWithReply:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_edgePointForPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "edgePointForPercentage:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_finishExecuting(void *a1, const char *a2, ...)
{
  return _[a1 finishExecuting];
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithPromise:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_genericApplicationIcon(void *a1, const char *a2, ...)
{
  return _[a1 genericApplicationIcon];
}

id objc_msgSend_hideOverlayAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideOverlayAnimated:");
}

id objc_msgSend_hostAdamID(void *a1, const char *a2, ...)
{
  return _[a1 hostAdamID];
}

id objc_msgSend_hostApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationDidEnterBackground];
}

id objc_msgSend_hostApplicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationWillEnterForeground];
}

id objc_msgSend_hostBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hostBundleIdentifier];
}

id objc_msgSend_hostIdiom(void *a1, const char *a2, ...)
{
  return _[a1 hostIdiom];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_imageDescriptorNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageDescriptorNamed:");
}

id objc_msgSend_imageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForDescriptor:");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivity:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithConfiguration_remoteDelegate_serviceContext_overlayLoader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:remoteDelegate:serviceContext:overlayLoader:");
}

id objc_msgSend_initWithContentView_containerConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentView:containerConfiguration:");
}

id objc_msgSend_initWithFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFields:");
}

id objc_msgSend_initWithFrame_lockup_metricsReporter_localizer_hostBundleIdentifier_hostSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:lockup:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:");
}

id objc_msgSend_initWithFrame_request_metricsReporter_localizer_hostBundleIdentifier_hostSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:request:metricsReporter:localizer:hostBundleIdentifier:hostSceneIdentifier:");
}

id objc_msgSend_initWithID_kind_metrics_icon_heading_title_subtitle_ageRating_offer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:");
}

id objc_msgSend_initWithImage_decoration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:decoration:");
}

id objc_msgSend_initWithInt64_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt64:");
}

id objc_msgSend_initWithLockup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLockup:");
}

id objc_msgSend_initWithMetrics_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetrics:activity:");
}

id objc_msgSend_initWithName_explanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:explanation:");
}

id objc_msgSend_initWithPosition_userDismissible_hostIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPosition:userDismissible:hostIdiom:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_configuration_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:configuration:delegate:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequestsPerSecond_timeWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestsPerSecond:timeWindow:");
}

id objc_msgSend_initWithStartFrame_endFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartFrame:endFrame:");
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStringValue:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interactiveDismissStartPercentage(void *a1, const char *a2, ...)
{
  return _[a1 interactiveDismissStartPercentage];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return _[a1 isAppClip];
}

id objc_msgSend_isArcadeApp(void *a1, const char *a2, ...)
{
  return _[a1 isArcadeApp];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return _[a1 isBetaApp];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isDevelopmentApp(void *a1, const char *a2, ...)
{
  return _[a1 isDevelopmentApp];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_latestReleaseID(void *a1, const char *a2, ...)
{
  return _[a1 latestReleaseID];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_loadLockupPromise(void *a1, const char *a2, ...)
{
  return _[a1 loadLockupPromise];
}

id objc_msgSend_loadOverlayForConfiguration_delegate_serviceContext_metricsReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadOverlayForConfiguration:delegate:serviceContext:metricsReporter:");
}

id objc_msgSend_loadOverlayFromDefinition_configuration_serviceContext_metricsReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadOverlayFromDefinition:configuration:serviceContext:metricsReporter:");
}

id objc_msgSend_loadOverlayIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadOverlayIfNeeded];
}

id objc_msgSend_loadedOverlay(void *a1, const char *a2, ...)
{
  return _[a1 loadedOverlay];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockup(void *a1, const char *a2, ...)
{
  return _[a1 lockup];
}

id objc_msgSend_lockupDefinitionForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupDefinitionForConfiguration:serviceContext:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_logErrorMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logErrorMessage:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_makeMetricsActivity(void *a1, const char *a2, ...)
{
  return _[a1 makeMetricsActivity];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsActivityByMergingFields_uniquingFieldsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsActivityByMergingFields:uniquingFieldsWithBlock:");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_overlayContainer(void *a1, const char *a2, ...)
{
  return _[a1 overlayContainer];
}

id objc_msgSend_overlayFrameForEdgePoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayFrameForEdgePoint:");
}

id objc_msgSend_overlayHeight(void *a1, const char *a2, ...)
{
  return _[a1 overlayHeight];
}

id objc_msgSend_overlayLoader(void *a1, const char *a2, ...)
{
  return _[a1 overlayLoader];
}

id objc_msgSend_overlayPromise(void *a1, const char *a2, ...)
{
  return _[a1 overlayPromise];
}

id objc_msgSend_overlaysLoadTimeout(void *a1, const char *a2, ...)
{
  return _[a1 overlaysLoadTimeout];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_parentAppDevelopmentLockupForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentAppDevelopmentLockupForConfiguration:serviceContext:");
}

id objc_msgSend_parentAppLockupRequestForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentAppLockupRequestForConfiguration:serviceContext:");
}

id objc_msgSend_parentApplicationRecordForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentApplicationRecordForConfiguration:serviceContext:");
}

id objc_msgSend_percentageForEdgePoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "percentageForEdgePoint:");
}

id objc_msgSend_percentageOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 percentageOnScreen];
}

id objc_msgSend_performAnimations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAnimations:completion:");
}

id objc_msgSend_placeholderAppDevelopmentLockupForConfiguration_serviceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderAppDevelopmentLockupForConfiguration:serviceContext:");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postAppearMetrics(void *a1, const char *a2, ...)
{
  return _[a1 postAppearMetrics];
}

id objc_msgSend_postDisappearMetrics(void *a1, const char *a2, ...)
{
  return _[a1 postDisappearMetrics];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareImagesForImageDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImagesForImageDescriptors:");
}

id objc_msgSend_presentOverlayPresenter_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentOverlayPresenter:animated:");
}

id objc_msgSend_presentOverlayWithConfiguration_delegate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentOverlayWithConfiguration:delegate:reply:");
}

id objc_msgSend_presentationQueue_presentOverlayWithConfiguration_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationQueue:presentOverlayWithConfiguration:delegate:");
}

id objc_msgSend_presentationQueueDismissOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationQueueDismissOverlay:");
}

id objc_msgSend_processReengagementWithAdvertisedItemID_compactJWS_bundleID_url_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processReengagementWithAdvertisedItemID:compactJWS:bundleID:url:");
}

id objc_msgSend_processReengagementWithParameters_storeIdentifier_clientBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processReengagementWithParameters:storeIdentifier:clientBundleID:");
}

id objc_msgSend_processReengagementWithParameters_storeIdentifier_clientBundleID_attributionKitRecorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processReengagementWithParameters:storeIdentifier:clientBundleID:attributionKitRecorder:");
}

id objc_msgSend_processViewMetrics_atInvocationPoint_withActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processViewMetrics:atInvocationPoint:withActivity:");
}

id objc_msgSend_productVariantID(void *a1, const char *a2, ...)
{
  return _[a1 productVariantID];
}

id objc_msgSend_promiseAdapter(void *a1, const char *a2, ...)
{
  return _[a1 promiseAdapter];
}

id objc_msgSend_promiseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithError:");
}

id objc_msgSend_promiseWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 promiseWithSuccess];
}

id objc_msgSend_promiseWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithTimeout:");
}

id objc_msgSend_providerToken(void *a1, const char *a2, ...)
{
  return _[a1 providerToken];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queueDismissOverlay(void *a1, const char *a2, ...)
{
  return _[a1 queueDismissOverlay];
}

id objc_msgSend_queuePresentOverlayWithConfiguration_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queuePresentOverlayWithConfiguration:delegate:");
}

id objc_msgSend_rateLimitRequestsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 rateLimitRequestsPerSecond];
}

id objc_msgSend_rateLimitTimeWindow(void *a1, const char *a2, ...)
{
  return _[a1 rateLimitTimeWindow];
}

id objc_msgSend_rateLimiter(void *a1, const char *a2, ...)
{
  return _[a1 rateLimiter];
}

id objc_msgSend_recordAttempt(void *a1, const char *a2, ...)
{
  return _[a1 recordAttempt];
}

id objc_msgSend_recordAttributionKitImpressionWithCompactJWS_storeIdentifier_hostBundleID_interactionType_attributionKitRecorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAttributionKitImpressionWithCompactJWS:storeIdentifier:hostBundleID:interactionType:attributionKitRecorder:");
}

id objc_msgSend_recordCampaignToken_providerToken_withLockup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCampaignToken:providerToken:withLockup:");
}

id objc_msgSend_recordClickThroughWithAdvertisedItemID_compactJWS_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordClickThroughWithAdvertisedItemID:compactJWS:bundleID:");
}

id objc_msgSend_recordImpressionWithParameters_storeIdentifier_hostAdamID_clientBundleId_interactionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordImpressionWithParameters:storeIdentifier:hostAdamID:clientBundleId:interactionType:");
}

id objc_msgSend_recordImpressionWithParameters_storeIdentifier_hostAdamID_clientBundleId_interactionType_attributionKitRecorder_skanRecorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordImpressionWithParameters:storeIdentifier:hostAdamID:clientBundleId:interactionType:attributionKitRecorder:skanRecorder:");
}

id objc_msgSend_recordSKAdNetworkImpressionWithParameters_storeIdentifier_hostAdamID_clientBundleId_interactionType_skanRecorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordSKAdNetworkImpressionWithParameters:storeIdentifier:hostAdamID:clientBundleId:interactionType:skanRecorder:");
}

id objc_msgSend_recordViewThroughWithAdvertisedItemID_compactJWS_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordViewThroughWithAdvertisedItemID:compactJWS:bundleID:");
}

id objc_msgSend_reengagementURLDictionaryKey(void *a1, const char *a2, ...)
{
  return _[a1 reengagementURLDictionaryKey];
}

id objc_msgSend_refreshOverlayFrame(void *a1, const char *a2, ...)
{
  return _[a1 refreshOverlayFrame];
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withAction:");
}

id objc_msgSend_reloadAXSize(void *a1, const char *a2, ...)
{
  return _[a1 reloadAXSize];
}

id objc_msgSend_reloadContainerConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 reloadContainerConfiguration];
}

id objc_msgSend_remoteDelegate(void *a1, const char *a2, ...)
{
  return _[a1 remoteDelegate];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteStoreOverlayDidFailToLoadWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteStoreOverlayDidFailToLoadWithError:");
}

id objc_msgSend_remoteStoreOverlayDidFinishDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteStoreOverlayDidFinishDismissal:");
}

id objc_msgSend_remoteStoreOverlayDidFinishPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteStoreOverlayDidFinishPresentation:");
}

id objc_msgSend_remoteStoreOverlayWillStartDismissing_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteStoreOverlayWillStartDismissing:executeBlock:");
}

id objc_msgSend_remoteStoreOverlayWillStartPresenting_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteStoreOverlayWillStartPresenting:executeBlock:");
}

id objc_msgSend_removePendingPresentationOperations(void *a1, const char *a2, ...)
{
  return _[a1 removePendingPresentationOperations];
}

id objc_msgSend_removeTrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTrait:");
}

id objc_msgSend_reportAppearWithViewMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportAppearWithViewMetrics:");
}

id objc_msgSend_reportDisappearWithViewMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDisappearWithViewMetrics:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_serviceContext(void *a1, const char *a2, ...)
{
  return _[a1 serviceContext];
}

id objc_msgSend_serviceContext_presentOverlayWithConfiguration_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceContext:presentOverlayWithConfiguration:delegate:");
}

id objc_msgSend_serviceContextDismissOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceContextDismissOverlay:");
}

id objc_msgSend_serviceOverlayPresenterDidFinishDismissing(void *a1, const char *a2, ...)
{
  return _[a1 serviceOverlayPresenterDidFinishDismissing];
}

id objc_msgSend_serviceOverlayPresenterDidFinishPresenting(void *a1, const char *a2, ...)
{
  return _[a1 serviceOverlayPresenterDidFinishPresenting];
}

id objc_msgSend_serviceQueue(void *a1, const char *a2, ...)
{
  return _[a1 serviceQueue];
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setAdInteractionAttributor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdInteractionAttributor:");
}

id objc_msgSend_setAdNetworkId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdNetworkId:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAdamId:");
}

id objc_msgSend_setAttributionSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionSignature:");
}

id objc_msgSend_setAttributionTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionTimer:");
}

id objc_msgSend_setCampaignId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignId:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setContainerConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerConfiguration:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setCurrentOverlayPresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentOverlayPresenter:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHostSignpostSpan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostSignpostSpan:");
}

id objc_msgSend_setImpressionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionId:");
}

id objc_msgSend_setInsetsLayoutMarginsFromSafeArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsetsLayoutMarginsFromSafeArea:");
}

id objc_msgSend_setInteractionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionType:");
}

id objc_msgSend_setInteractiveDismissStartPercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractiveDismissStartPercentage:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setIsExecuting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsExecuting:");
}

id objc_msgSend_setIsFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFinished:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLoadedOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadedOverlay:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverlayContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayContainer:");
}

id objc_msgSend_setOverlayPromise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayPromise:");
}

id objc_msgSend_setPanGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPanGestureRecognizer:");
}

id objc_msgSend_setPercentageOnScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentageOnScreen:");
}

id objc_msgSend_setPercentageOnScreen_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentageOnScreen:animated:completion:");
}

id objc_msgSend_setPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSizeCategory:");
}

id objc_msgSend_setRateLimiter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRateLimiter:");
}

id objc_msgSend_setRequestsPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestsPerSecond:");
}

id objc_msgSend_setServiceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceContext:");
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShape:");
}

id objc_msgSend_setSourceAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAppAdamId:");
}

id objc_msgSend_setSourceAppBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAppBundleId:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTimeWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeWindow:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVariant:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewRespectsSystemMinimumLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewRespectsSystemMinimumLayoutMargins:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedMetrics(void *a1, const char *a2, ...)
{
  return _[a1 sharedMetrics];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _[a1 sharedSettings];
}

id objc_msgSend_showOverlayAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showOverlayAnimated:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_startExecuting(void *a1, const char *a2, ...)
{
  return _[a1 startExecuting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return _[a1 stateLock];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return _[a1 storage];
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeItemIdentifier];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitOverrides(void *a1, const char *a2, ...)
{
  return _[a1 traitOverrides];
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockedLoadedOverlay(void *a1, const char *a2, ...)
{
  return _[a1 unlockedLoadedOverlay];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateRateLimiterConstantsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateRateLimiterConstantsIfNeeded];
}

id objc_msgSend_userDismissible(void *a1, const char *a2, ...)
{
  return _[a1 userDismissible];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "velocityInView:");
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 versionIdentifier];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewMetrics(void *a1, const char *a2, ...)
{
  return _[a1 viewMetrics];
}

id objc_msgSend_viewMetricsReporter(void *a1, const char *a2, ...)
{
  return _[a1 viewMetricsReporter];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willStartDismissal_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willStartDismissal:executeBlock:");
}

id objc_msgSend_willStartPresentation_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willStartPresentation:executeBlock:");
}

id objc_msgSend_withLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withLock:");
}