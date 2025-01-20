void sub_1000059A4(id a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = (id)objc_opt_new();
  [v3 addObject:@"UIApplicationSceneManifest"];
  v1 = [v3 copy];
  v2 = (void *)qword_100025988;
  qword_100025988 = (uint64_t)v1;
}

void sub_1000060C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000060F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006100(uint64_t a1)
{
}

void sub_100006108(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  v9 = [v8 applicationWindowScene];
  uint64_t v10 = (void *)a1[4];

  if (v9 == v10)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_1000065E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000661C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v8 = a3;
  if ([v8 ownsWindowScene:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100006E84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  return UIApplicationMain(a1, a2, @"CARTemplateUIHostApplication", @"CARTemplateUIHostApplication");
}

void sub_10000828C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 144));
  _Unwind_Resume(a1);
}

void sub_1000082E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained scene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008388;
  v4[3] = &unk_10001C440;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  [v2 updateSettingsWithBlock:v4];
}

void sub_100008388(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

void sub_1000083EC(uint64_t a1, void *a2)
{
  id v3 = [a2 settings];
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___CRSUIMapStyleProviding])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained scene];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000084C4;
    v7[3] = &unk_10001C440;
    id v8 = WeakRetained;
    id v6 = WeakRetained;
    [v5 updateSettingsWithBlock:v7];
  }
}

void sub_1000084C4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setMapStyle:", objc_msgSend(v2, "mapStyle"));
}

void sub_10000851C(uint64_t a1, void *a2)
{
  id v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating frameRateLimit on template scene", buf, 2u);
  }

  id v5 = [a2 settings];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___CRSUIFrameRateLimitProviding])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = [WeakRetained scene];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008640;
    v9[3] = &unk_10001C440;
    id v10 = WeakRetained;
    id v8 = WeakRetained;
    [v7 updateSettingsWithBlock:v9];
  }
}

void sub_100008640(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 frameRateLimit];
  [v3 setFrameRateLimit:v4];
}

void sub_100008850(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 view];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");

  [*(id *)(a1 + 32) _safeAreaInsets];
  objc_msgSend(v5, "setSafeAreaInsetsPortrait:");
}

void sub_100008D00(id a1, UIMutableScenePresentationContext *a2)
{
  v2 = a2;
  [(UIMutableScenePresentationContext *)v2 setAppearanceStyle:1];
  id v3 = +[UIColor clearColor];
  [(UIMutableScenePresentationContext *)v2 setBackgroundColorWhileHosting:v3];
}

void sub_100008D6C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sceneHostView];
  id v3 = [v2 _window];
  unsigned int v4 = [v3 _contextId];

  id v5 = [*(id *)(a1 + 32) sceneHostView];
  id v6 = [v5 layer];
  uint64_t RenderId = CALayerGetRenderId();

  id v8 = [*(id *)(a1 + 32) scene];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008E64;
  v9[3] = &unk_10001C4F0;
  unsigned int v10 = v4;
  void v9[4] = RenderId;
  [v8 updateUISettingsWithBlock:v9];
}

void sub_100008E64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 setHostContextIdentifierForSnapshotting:v3];
  [v4 setScenePresenterRenderIdentifierForSnapshotting:*(void *)(a1 + 32)];
}

void sub_1000093E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

id sub_100009410(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FBMutableProcessExecutionContext);
  if ([*(id *)(a1 + 32) isForeground]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 2;
  }
  [v2 setLaunchIntent:v3];

  return v2;
}

id sub_100009474(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) debugDescription];
  if (BSLogStateCaptureCheckPlistSizeIsPermitted())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) description];
  }
  id v4 = v3;

  return v4;
}

void sub_1000094DC(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateUserInterfaceStyle];
  [WeakRetained setCurrentTransaction:0];
  id v2 = [WeakRetained pendingTransaction];

  if (v2)
  {
    id v3 = [WeakRetained pendingTransaction];
    [WeakRetained setPendingTransaction:0];
    [WeakRetained setCurrentTransaction:v3];
    [v3 begin];
  }
}

void sub_100009588(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)UIOpenURLAction);
  id v5 = [v3 URL];

  id v6 = [v4 initWithURL:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

void sub_100009B1C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
}

id sub_10000A174(unint64_t a1)
{
  if (a1 >= 0x16) {
    sub_100011B44();
  }
  if (qword_100025A50 != -1) {
    dispatch_once(&qword_100025A50, &stru_10001C5D8);
  }
  id v2 = (void *)qword_1000259A0[a1];

  return v2;
}

void sub_10000A1E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.CarPlayApp", "Default");
  id v2 = (void *)qword_1000259A0[0];
  qword_1000259A0[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.CarPlayApp", "Applications");
  id v4 = (void *)qword_1000259A8;
  qword_1000259A8 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.CarPlayApp", "Dashboard");
  id v6 = (void *)qword_1000259B0;
  qword_1000259B0 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.CarPlayApp", "Siri");
  id v8 = (void *)qword_1000259B8;
  qword_1000259B8 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.CarPlayApp", "StatusBar");
  unsigned int v10 = (void *)qword_1000259C0;
  qword_1000259C0 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.CarPlayApp", "TemplateUIHostApp");
  uint64_t v12 = (void *)qword_1000259C8;
  qword_1000259C8 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.CarPlayApp", "Workspace");
  uint64_t v14 = (void *)qword_1000259D0;
  qword_1000259D0 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.CarPlayApp", "SmartWidget");
  uint64_t v16 = (void *)qword_1000259D8;
  qword_1000259D8 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.CarPlayApp", "InstrumentCluster");
  v18 = (void *)qword_1000259E0;
  qword_1000259E0 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.CarPlayApp", "SplashScreen");
  v20 = (void *)qword_1000259E8;
  qword_1000259E8 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.CarPlayApp", "MediaPlayer");
  v22 = (void *)qword_1000259F0;
  qword_1000259F0 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.CarPlayApp", "Analytics");
  v24 = (void *)qword_1000259F8;
  qword_1000259F8 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.CarPlayApp", "Diagnostics");
  v26 = (void *)qword_100025A00;
  qword_100025A00 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.CarPlayApp", "TelemetrySignposts");
  v28 = (void *)qword_100025A08;
  qword_100025A08 = (uint64_t)v27;

  os_log_t v29 = os_log_create("com.apple.CarPlayApp", "IconBadging");
  v30 = (void *)qword_100025A10;
  qword_100025A10 = (uint64_t)v29;

  os_log_t v31 = os_log_create("com.apple.CarPlayApp", "SynchronizedAnimations");
  v32 = (void *)qword_100025A18;
  qword_100025A18 = (uint64_t)v31;

  os_log_t v33 = os_log_create("com.apple.CarPlayApp", "Appearance");
  v34 = (void *)qword_100025A20;
  qword_100025A20 = (uint64_t)v33;

  os_log_t v35 = os_log_create("com.apple.CarPlayApp", "Notification");
  v36 = (void *)qword_100025A28;
  qword_100025A28 = (uint64_t)v35;

  os_log_t v37 = os_log_create("com.apple.CarPlayApp", "UISync");
  v38 = (void *)qword_100025A30;
  qword_100025A30 = (uint64_t)v37;

  os_log_t v39 = os_log_create("com.apple.CarPlayApp", "Navigation");
  v40 = (void *)qword_100025A38;
  qword_100025A38 = (uint64_t)v39;

  os_log_t v41 = os_log_create("com.apple.CarPlayApp", "PassengerDisplay");
  v42 = (void *)qword_100025A40;
  qword_100025A40 = (uint64_t)v41;

  qword_100025A48 = (uint64_t)os_log_create("com.apple.CarPlayApp", "CarCamera");

  _objc_release_x1();
}

void sub_10000AA10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [v2 leftAnchor];
  os_log_t v29 = [*(id *)(a1 + 40) view];
  os_log_t v27 = [v29 leftAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v35[0] = v26;
  v24 = [v2 rightAnchor];
  os_log_t v25 = [*(id *)(a1 + 40) view];
  os_log_t v23 = [v25 rightAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v35[1] = v22;
  os_log_t v3 = [v2 topAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  os_log_t v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v35[2] = v6;
  v30 = v2;
  os_log_t v7 = [v2 bottomAnchor];
  id v8 = [*(id *)(a1 + 40) view];
  os_log_t v9 = [v8 bottomAnchor];
  unsigned int v10 = [v7 constraintEqualToAnchor:v9];
  v35[3] = v10;
  os_log_t v11 = +[NSArray arrayWithObjects:v35 count:4];
  +[NSLayoutConstraint activateConstraints:v11];

  uint64_t v12 = [*(id *)(a1 + 40) view];
  os_log_t v13 = [v12 window];
  uint64_t v14 = [v13 windowScene];
  if ([v14 activationState] == (id)1)
  {
    BOOL v15 = 1;
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 40) view];
    os_log_t v17 = [v16 window];
    v18 = [v17 windowScene];
    BOOL v15 = [v18 activationState] == 0;
  }
  os_log_t v19 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = NSStringFromBOOL();
    os_log_t v21 = [*(id *)(a1 + 40) bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    v32 = v20;
    __int16 v33 = 2114;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending cluster scene update with foreground: %{public}@ for bundle identifier: %{public}@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) sendSceneUpdate:v15 openURLContexts:0];
}

void sub_10000AEDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [v2 leftAnchor];
  os_log_t v19 = [*(id *)(a1 + 40) view];
  os_log_t v17 = [v19 leftAnchor];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  uint64_t v14 = [v2 rightAnchor];
  BOOL v15 = [*(id *)(a1 + 40) view];
  os_log_t v13 = [v15 rightAnchor];
  uint64_t v12 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v12;
  os_log_t v3 = [v2 topAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  os_log_t v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v20[2] = v6;
  os_log_t v7 = [v2 bottomAnchor];
  id v8 = [*(id *)(a1 + 40) view];
  os_log_t v9 = [v8 bottomAnchor];
  unsigned int v10 = [v7 constraintEqualToAnchor:v9];
  v20[3] = v10;
  os_log_t v11 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v11];
}

void sub_10000B2C0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [v2 leftAnchor];
  os_log_t v19 = [*(id *)(a1 + 40) view];
  os_log_t v17 = [v19 leftAnchor];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  uint64_t v14 = [v2 rightAnchor];
  BOOL v15 = [*(id *)(a1 + 40) view];
  os_log_t v13 = [v15 rightAnchor];
  uint64_t v12 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v12;
  os_log_t v3 = [v2 topAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  os_log_t v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v20[2] = v6;
  os_log_t v7 = [v2 bottomAnchor];
  id v8 = [*(id *)(a1 + 40) view];
  os_log_t v9 = [v8 bottomAnchor];
  unsigned int v10 = [v7 constraintEqualToAnchor:v9];
  v20[3] = v10;
  os_log_t v11 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v11];
}

void sub_10000B664(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [v2 leftAnchor];
  os_log_t v19 = [*(id *)(a1 + 40) view];
  os_log_t v17 = [v19 leftAnchor];
  uint64_t v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  uint64_t v14 = [v2 rightAnchor];
  BOOL v15 = [*(id *)(a1 + 40) view];
  os_log_t v13 = [v15 rightAnchor];
  uint64_t v12 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v12;
  os_log_t v3 = [v2 topAnchor];
  id v4 = [*(id *)(a1 + 40) view];
  os_log_t v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v20[2] = v6;
  os_log_t v7 = [v2 bottomAnchor];
  id v8 = [*(id *)(a1 + 40) view];
  os_log_t v9 = [v8 bottomAnchor];
  unsigned int v10 = [v7 constraintEqualToAnchor:v9];
  v20[3] = v10;
  os_log_t v11 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v11];
}

id sub_10000BFA4(uint64_t a1, void *a2)
{
  return [a2 setShowsCompass:*(void *)(a1 + 32)];
}

id sub_10000C044(uint64_t a1, void *a2)
{
  return [a2 setShowsSpeedLimit:*(void *)(a1 + 32)];
}

id sub_10000C0F0(uint64_t a1, void *a2)
{
  return [a2 setItemType:*(void *)(a1 + 32)];
}

id sub_10000C2B8(uint64_t a1, void *a2)
{
  return [a2 setLayoutJustification:*(void *)(a1 + 32)];
}

void sub_10000CCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CD00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained scene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CDA8;
  v4[3] = &unk_10001C440;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  [v2 updateSettingsWithBlock:v4];
}

void sub_10000CDA8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

void sub_10000CE0C(uint64_t a1, void *a2)
{
  id v3 = [a2 settings];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained scene];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CED4;
  v7[3] = &unk_10001C440;
  id v8 = v3;
  id v6 = v3;
  [v5 updateSettingsWithBlock:v7];
}

void sub_10000CED4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setMapStyle:", objc_msgSend(v2, "mapStyle"));
}

void sub_10000CF2C(uint64_t a1, void *a2)
{
  id v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating frameRateLimit on template app scene", buf, 2u);
  }

  id v5 = [a2 settings];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v7 = [WeakRetained scene];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D040;
  v9[3] = &unk_10001C440;
  id v10 = v5;
  id v8 = v5;
  [v7 updateSettingsWithBlock:v9];
}

void sub_10000D040(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 frameRateLimit];
  [v3 setFrameRateLimit:v4];
}

void sub_10000D660(id a1, UIMutableScenePresentationContext *a2)
{
  id v2 = a2;
  [(UIMutableScenePresentationContext *)v2 setAppearanceStyle:1];
  id v3 = +[UIColor clearColor];
  [(UIMutableScenePresentationContext *)v2 setBackgroundColorWhileHosting:v3];
}

id sub_10000D6CC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 pendingActivityContinuationAction];
  [v2 _handleActivityContinuationAction:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 setPendingActivityContinuationAction:0];
}

void sub_10000E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000E188(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FBMutableProcessExecutionContext);
  if ([*(id *)(a1 + 32) isForeground]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 2;
  }
  [v2 setLaunchIntent:v3];

  return v2;
}

id sub_10000E1EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) debugDescription];
  if (BSLogStateCaptureCheckPlistSizeIsPermitted())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) description];
  }
  id v4 = v3;

  return v4;
}

void sub_10000E254(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateUserInterfaceStyle];
  [WeakRetained setCurrentTransaction:0];
  id v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E344;
  v6[3] = &unk_10001C5B8;
  v6[4] = WeakRetained;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = [WeakRetained pendingTransaction];

  if (v4)
  {
    id v5 = [WeakRetained pendingTransaction];
    [WeakRetained setPendingTransaction:0];
    [WeakRetained setCurrentTransaction:v5];
    [v5 begin];
  }
}

void sub_10000E344(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 URL];
  id v6 = [v5 absoluteString];
  unsigned int v7 = [v6 hasSuffix:@"show-now-playing"];

  if (v7)
  {
    *a3 = 1;
    id v8 = [*(id *)(a1 + 32) templateInstance];
    [v8 clientRequestNowPlayingTemplateAnimated:0];
  }
}

void sub_10000E404(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attaching action to scene update for URL context: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = objc_alloc((Class)UIOpenURLAction);
  id v6 = [v3 URL];
  id v7 = [v5 initWithURL:v6];

  [*(id *)(a1 + 32) addObject:v7];
}

id sub_10000E658(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)UIApplicationSceneTransitionContext);
  id v3 = +[NSSet setWithObject:*(void *)(a1 + 32)];
  [v2 setActions:v3];

  return v2;
}

void sub_10000E74C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
}

void sub_10000F5E4(uint64_t a1)
{
  v34 = [*(id *)(a1 + 32) mapWidgetViewController];
  __int16 v33 = [v34 view];
  v30 = [v33 topAnchor];
  v32 = [*(id *)(a1 + 32) templateInstance];
  os_log_t v31 = [v32 dashboardEstimatesViewController];
  os_log_t v29 = [v31 view];
  v28 = [v29 topAnchor];
  os_log_t v27 = [v30 constraintEqualToAnchor:v28];
  v35[0] = v27;
  v26 = [*(id *)(a1 + 32) mapWidgetViewController];
  os_log_t v25 = [v26 view];
  v22 = [v25 bottomAnchor];
  v24 = [*(id *)(a1 + 32) templateInstance];
  os_log_t v23 = [v24 dashboardEstimatesViewController];
  os_log_t v21 = [v23 view];
  v20 = [v21 bottomAnchor];
  os_log_t v19 = [v22 constraintEqualToAnchor:v20];
  v35[1] = v19;
  v18 = [*(id *)(a1 + 32) mapWidgetViewController];
  os_log_t v17 = [v18 view];
  uint64_t v14 = [v17 leftAnchor];
  uint64_t v16 = [*(id *)(a1 + 32) templateInstance];
  BOOL v15 = [v16 dashboardEstimatesViewController];
  os_log_t v13 = [v15 view];
  uint64_t v12 = [v13 leftAnchor];
  id v2 = [v14 constraintEqualToAnchor:v12];
  v35[2] = v2;
  id v3 = [*(id *)(a1 + 32) mapWidgetViewController];
  id v4 = [v3 view];
  id v5 = [v4 rightAnchor];
  id v6 = [*(id *)(a1 + 32) templateInstance];
  id v7 = [v6 dashboardEstimatesViewController];
  int v8 = [v7 view];
  id v9 = [v8 rightAnchor];
  id v10 = [v5 constraintEqualToAnchor:v9];
  v35[3] = v10;
  os_log_t v11 = +[NSArray arrayWithObjects:v35 count:4];
  +[NSLayoutConstraint activateConstraints:v11];
}

void sub_10000FFEC(id a1, FBSMutableSceneSettings *a2)
{
}

void sub_100010138(id a1, FBSMutableSceneSettings *a2)
{
}

void sub_1000103C8(id a1, FBSMutableSceneSettings *a2)
{
}

void sub_100010A30(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = [v6 scene];
  int v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    id v9 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Invalidating cluster view controller: %@", (uint8_t *)&v10, 0xCu);
    }

    [v6 invalidate];
    *a4 = 1;
  }
}

void sub_100011634(id a1, UIMutableScenePresentationContext *a2)
{
  id v2 = a2;
  [(UIMutableScenePresentationContext *)v2 setAppearanceStyle:1];
  id v3 = +[UIColor clearColor];
  [(UIMutableScenePresentationContext *)v2 setBackgroundColorWhileHosting:v3];
}

void sub_1000116A0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) fakeSceneHostSnapshotView];
  [v1 setAlpha:0.0];
}

id sub_1000116E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fakeSceneHostSnapshotView];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 setFakeSceneHostSnapshotView:0];
}

void sub_1000119A4()
{
  sub_100006EA0();
  sub_100006E84((void *)&_mh_execute_header, v0, v1, "Unexpected scene entering foreground: %@", v2, v3, v4, v5, v6);
}

void sub_100011A0C()
{
  sub_100006EA0();
  sub_100006E84((void *)&_mh_execute_header, v0, v1, "Unable to find environment for scene: %@", v2, v3, v4, v5, v6);
}

void sub_100011A74()
{
  sub_100006EA0();
  sub_100006E84((void *)&_mh_execute_header, v0, v1, "Error invalidating running assertion: %@", v2, v3, v4, v5, v6);
}

void sub_100011ADC()
{
  sub_100006EA0();
  sub_100006E84((void *)&_mh_execute_header, v0, v1, "Error acquiring assertion: %@", v2, v3, v4, v5, v6);
}

void sub_100011B44()
{
}

void sub_100011B70(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Skipping scene bringup because we are invalidated, %@", (uint8_t *)&v2, 0xCu);
}

void sub_100011BE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown scene type: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return _BSLogAddStateCaptureBlockWithTitle();
}

uint64_t BSLogStateCaptureCheckPlistSizeIsPermitted()
{
  return _BSLogStateCaptureCheckPlistSizeIsPermitted();
}

uint64_t CALayerGetRenderId()
{
  return _CALayerGetRenderId();
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

id objc_msgSend__addChildSceneViewController(void *a1, const char *a2, ...)
{
  return [a1 _addChildSceneViewController];
}

id objc_msgSend__clusterWindow(void *a1, const char *a2, ...)
{
  return [a1 _clusterWindow];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__frameRateLimit(void *a1, const char *a2, ...)
{
  return [a1 _frameRateLimit];
}

id objc_msgSend__handleItemTypeUpdate(void *a1, const char *a2, ...)
{
  return [a1 _handleItemTypeUpdate];
}

id objc_msgSend__invalidateDashboardGuidanceScene(void *a1, const char *a2, ...)
{
  return [a1 _invalidateDashboardGuidanceScene];
}

id objc_msgSend__invalidateDashboardMapScene(void *a1, const char *a2, ...)
{
  return [a1 _invalidateDashboardMapScene];
}

id objc_msgSend__lastZoomDirectionString(void *a1, const char *a2, ...)
{
  return [a1 _lastZoomDirectionString];
}

id objc_msgSend__mapStyle(void *a1, const char *a2, ...)
{
  return [a1 _mapStyle];
}

id objc_msgSend__removeGuidanceCardViewController(void *a1, const char *a2, ...)
{
  return [a1 _removeGuidanceCardViewController];
}

id objc_msgSend__removeNavigationViewController(void *a1, const char *a2, ...)
{
  return [a1 _removeNavigationViewController];
}

id objc_msgSend__removeViewControllerForMapView(void *a1, const char *a2, ...)
{
  return [a1 _removeViewControllerForMapView];
}

id objc_msgSend__safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 _safeAreaInsets];
}

id objc_msgSend__sceneSettings(void *a1, const char *a2, ...)
{
  return [a1 _sceneSettings];
}

id objc_msgSend__showFakeSupportLabelIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _showFakeSupportLabelIfNecessary];
}

id objc_msgSend__updateRunningAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateRunningAssertionIfNecessary];
}

id objc_msgSend__updateSettingsText(void *a1, const char *a2, ...)
{
  return [a1 _updateSettingsText];
}

id objc_msgSend__updateUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 _updateUserInterfaceStyle];
}

id objc_msgSend__window(void *a1, const char *a2, ...)
{
  return [a1 _window];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return [a1 activationState];
}

id objc_msgSend_activeBannerScene(void *a1, const char *a2, ...)
{
  return [a1 activeBannerScene];
}

id objc_msgSend_activeWindow(void *a1, const char *a2, ...)
{
  return [a1 activeWindow];
}

id objc_msgSend_appSettingsDiffInspector(void *a1, const char *a2, ...)
{
  return [a1 appSettingsDiffInspector];
}

id objc_msgSend_appViewController(void *a1, const char *a2, ...)
{
  return [a1 appViewController];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationWindow(void *a1, const char *a2, ...)
{
  return [a1 applicationWindow];
}

id objc_msgSend_applicationWindowScene(void *a1, const char *a2, ...)
{
  return [a1 applicationWindowScene];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_button1(void *a1, const char *a2, ...)
{
  return [a1 button1];
}

id objc_msgSend_button2(void *a1, const char *a2, ...)
{
  return [a1 button2];
}

id objc_msgSend_button3(void *a1, const char *a2, ...)
{
  return [a1 button3];
}

id objc_msgSend_canBeInvalidated(void *a1, const char *a2, ...)
{
  return [a1 canBeInvalidated];
}

id objc_msgSend_capture(void *a1, const char *a2, ...)
{
  return [a1 capture];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clientProcess(void *a1, const char *a2, ...)
{
  return [a1 clientProcess];
}

id objc_msgSend_compassSetting(void *a1, const char *a2, ...)
{
  return [a1 compassSetting];
}

id objc_msgSend_contentState(void *a1, const char *a2, ...)
{
  return [a1 contentState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return [a1 currentProcess];
}

id objc_msgSend_currentSafeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 currentSafeAreaInsets];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_currentTransaction(void *a1, const char *a2, ...)
{
  return [a1 currentTransaction];
}

id objc_msgSend_dashboardEndpoint(void *a1, const char *a2, ...)
{
  return [a1 dashboardEndpoint];
}

id objc_msgSend_dashboardEstimatesViewController(void *a1, const char *a2, ...)
{
  return [a1 dashboardEstimatesViewController];
}

id objc_msgSend_dashboardGuidanceViewController(void *a1, const char *a2, ...)
{
  return [a1 dashboardGuidanceViewController];
}

id objc_msgSend_dashboardGuidanceWindowScene(void *a1, const char *a2, ...)
{
  return [a1 dashboardGuidanceWindowScene];
}

id objc_msgSend_dashboardMapWindow(void *a1, const char *a2, ...)
{
  return [a1 dashboardMapWindow];
}

id objc_msgSend_dashboardMapWindowScene(void *a1, const char *a2, ...)
{
  return [a1 dashboardMapWindowScene];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return [a1 displayConfiguration];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_etaSetting(void *a1, const char *a2, ...)
{
  return [a1 etaSetting];
}

id objc_msgSend_fakeDashboardSupport(void *a1, const char *a2, ...)
{
  return [a1 fakeDashboardSupport];
}

id objc_msgSend_fakeNeatlineDashboardSupport(void *a1, const char *a2, ...)
{
  return [a1 fakeNeatlineDashboardSupport];
}

id objc_msgSend_fakeSceneHostSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 fakeSceneHostSnapshotView];
}

id objc_msgSend_fakeSceneHostView(void *a1, const char *a2, ...)
{
  return [a1 fakeSceneHostView];
}

id objc_msgSend_fakeScenePresenter(void *a1, const char *a2, ...)
{
  return [a1 fakeScenePresenter];
}

id objc_msgSend_fakeSupportLabel(void *a1, const char *a2, ...)
{
  return [a1 fakeSupportLabel];
}

id objc_msgSend_fakesDashboardSupport(void *a1, const char *a2, ...)
{
  return [a1 fakesDashboardSupport];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameRateLimit(void *a1, const char *a2, ...)
{
  return [a1 frameRateLimit];
}

id objc_msgSend_grantWithForegroundPriority(void *a1, const char *a2, ...)
{
  return [a1 grantWithForegroundPriority];
}

id objc_msgSend_grantWithUserInteractivity(void *a1, const char *a2, ...)
{
  return [a1 grantWithUserInteractivity];
}

id objc_msgSend_guidanceCardViewController(void *a1, const char *a2, ...)
{
  return [a1 guidanceCardViewController];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierToEnvironmentMap(void *a1, const char *a2, ...)
{
  return [a1 identifierToEnvironmentMap];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_initAndWaitUntilSessionUpdated(void *a1, const char *a2, ...)
{
  return [a1 initAndWaitUntilSessionUpdated];
}

id objc_msgSend_instrumentClusterCardViewController(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterCardViewController];
}

id objc_msgSend_instrumentClusterEndpoint(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterEndpoint];
}

id objc_msgSend_instrumentClusterMapETAViewController(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterMapETAViewController];
}

id objc_msgSend_instrumentClusterViewController(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterViewController];
}

id objc_msgSend_instrumentClusterViewControllers(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterViewControllers];
}

id objc_msgSend_instrumentClusterWindowScenes(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterWindowScenes];
}

id objc_msgSend_instrumentClusterWindows(void *a1, const char *a2, ...)
{
  return [a1 instrumentClusterWindows];
}

id objc_msgSend_internalInstrumentClusterWindowScenes(void *a1, const char *a2, ...)
{
  return [a1 internalInstrumentClusterWindowScenes];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateApplicationScene(void *a1, const char *a2, ...)
{
  return [a1 invalidateApplicationScene];
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return [a1 invalidated];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return [a1 isForeground];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return [a1 itemType];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastZoomDirection(void *a1, const char *a2, ...)
{
  return [a1 lastZoomDirection];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutJustification(void *a1, const char *a2, ...)
{
  return [a1 layoutJustification];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 makeKeyWindow];
}

id objc_msgSend_mapStyle(void *a1, const char *a2, ...)
{
  return [a1 mapStyle];
}

id objc_msgSend_mapViewETATray(void *a1, const char *a2, ...)
{
  return [a1 mapViewETATray];
}

id objc_msgSend_mapWidgetViewController(void *a1, const char *a2, ...)
{
  return [a1 mapWidgetViewController];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationViewController(void *a1, const char *a2, ...)
{
  return [a1 navigationViewController];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_overlayViewController(void *a1, const char *a2, ...)
{
  return [a1 overlayViewController];
}

id objc_msgSend_pendingActivityContinuationAction(void *a1, const char *a2, ...)
{
  return [a1 pendingActivityContinuationAction];
}

id objc_msgSend_pendingTransaction(void *a1, const char *a2, ...)
{
  return [a1 pendingTransaction];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return [a1 prepare];
}

id objc_msgSend_presentationView(void *a1, const char *a2, ...)
{
  return [a1 presentationView];
}

id objc_msgSend_proxiedApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 proxiedApplicationBundleIdentifier];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requester(void *a1, const char *a2, ...)
{
  return [a1 requester];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_runningAssertion(void *a1, const char *a2, ...)
{
  return [a1 runningAssertion];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_safeView(void *a1, const char *a2, ...)
{
  return [a1 safeView];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_sceneHostView(void *a1, const char *a2, ...)
{
  return [a1 sceneHostView];
}

id objc_msgSend_sceneIdentifierSuffix(void *a1, const char *a2, ...)
{
  return [a1 sceneIdentifierSuffix];
}

id objc_msgSend_scenePresenter(void *a1, const char *a2, ...)
{
  return [a1 scenePresenter];
}

id objc_msgSend_sceneSpecificationClass(void *a1, const char *a2, ...)
{
  return [a1 sceneSpecificationClass];
}

id objc_msgSend_sceneViewController(void *a1, const char *a2, ...)
{
  return [a1 sceneViewController];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return [a1 sessionStatus];
}

id objc_msgSend_setContentReady(void *a1, const char *a2, ...)
{
  return [a1 setContentReady];
}

id objc_msgSend_setContentReadyIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 setContentReadyIfNecessary];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_settingsClass(void *a1, const char *a2, ...)
{
  return [a1 settingsClass];
}

id objc_msgSend_settingsDiffInspector(void *a1, const char *a2, ...)
{
  return [a1 settingsDiffInspector];
}

id objc_msgSend_settingsLabel(void *a1, const char *a2, ...)
{
  return [a1 settingsLabel];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showETASetting(void *a1, const char *a2, ...)
{
  return [a1 showETASetting];
}

id objc_msgSend_showsCompass(void *a1, const char *a2, ...)
{
  return [a1 showsCompass];
}

id objc_msgSend_showsSpeedLimit(void *a1, const char *a2, ...)
{
  return [a1 showsSpeedLimit];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapshotContext(void *a1, const char *a2, ...)
{
  return [a1 snapshotContext];
}

id objc_msgSend_speedLimitSetting(void *a1, const char *a2, ...)
{
  return [a1 speedLimitSetting];
}

id objc_msgSend_templateInstance(void *a1, const char *a2, ...)
{
  return [a1 templateInstance];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionContextClass(void *a1, const char *a2, ...)
{
  return [a1 transitionContextClass];
}

id objc_msgSend_uiPresentationManager(void *a1, const char *a2, ...)
{
  return [a1 uiPresentationManager];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_valueBool(void *a1, const char *a2, ...)
{
  return [a1 valueBool];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widgetStyle(void *a1, const char *a2, ...)
{
  return [a1 widgetStyle];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}

id objc_msgSend_workspaceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 workspaceIdentifier];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}

id objc_msgSend_zoomCount(void *a1, const char *a2, ...)
{
  return [a1 zoomCount];
}