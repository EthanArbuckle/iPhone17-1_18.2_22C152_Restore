void sub_100001878(void *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[8];
  void v34[4];

  if (a1)
  {
    v2 = sub_100001C6C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presenting prox card flow", buf, 2u);
    }

    v32 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:80.0];
    v3 = +[UIImage systemImageNamed:@"apple.logo"];
    v31 = [v3 imageWithConfiguration:v32];

    v4 = [objc_alloc((Class)UIImageView) initWithImage:v31];
    v5 = +[UIColor labelColor];
    [v4 setTintColor:v5];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = objc_alloc_init((Class)PRXIconContentViewController);
    v7 = [v6 contentView];
    v8 = [v7 mainContentGuide];

    v9 = sub_100001CC0((uint64_t)a1);
    [v6 setTitle:v9];

    v10 = sub_100001D34(a1);
    [v6 setSubtitle:v10];

    v11 = [v6 contentView];
    [v11 addSubview:v4];

    [v6 setDismissalType:1];
    v12 = sub_100001E50(a1);
    v13 = [v6 addAction:v12];

    v30 = [v4 centerXAnchor];
    v29 = [v8 centerXAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v34[0] = v28;
    v26 = [v4 centerYAnchor];
    v25 = [v8 centerYAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v34[1] = v24;
    v14 = [v4 topAnchor];
    v27 = v8;
    v15 = [v8 topAnchor];
    v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
    v34[2] = v16;
    v17 = [v4 bottomAnchor];
    v18 = [v8 bottomAnchor];
    [v17 constraintLessThanOrEqualToAnchor:v18];
    v20 = v19 = a1;
    v34[3] = v20;
    v21 = +[NSArray arrayWithObjects:v34 count:4];
    +[NSLayoutConstraint activateConstraints:v21];

    v22 = [v19 presentProxCardFlowWithDelegate:v19 initialViewController:v6];
    v23 = (void *)v19[3];
    v19[3] = v22;
  }
}

id sub_100001C6C()
{
  if (qword_100012198 != -1) {
    dispatch_once(&qword_100012198, &stru_10000C398);
  }
  v0 = (void *)qword_100012190;

  return v0;
}

id sub_100001CC0(uint64_t a1)
{
  if (a1)
  {
    v1 = +[NSBundle mainBundle];
    v2 = [v1 localizedStringForKey:@"STORE_AUTHENTICATION_TITLE" value:&stru_10000C4E8 table:0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id sub_100001D34(void *a1)
{
  if (a1)
  {
    v2 = [a1 presentationContext];
    v3 = [v2 storeAuthenticationRequest];
    v4 = [v3 account];

    v5 = [a1 presentationContext];
    v6 = [v5 deviceName];

    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"STORE_AUTHENTICATION_SUBTITLE" value:&stru_10000C4E8 table:0];
    v9 = [v4 username];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id sub_100001E50(id val)
{
  if (val)
  {
    objc_initWeak(&location, val);
    v1 = +[NSBundle mainBundle];
    v2 = [v1 localizedStringForKey:@"CONTINUE" value:&stru_10000C4E8 table:0];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100001F90;
    v5[3] = &unk_10000C308;
    objc_copyWeak(&v6, &location);
    v3 = +[PRXAction actionWithTitle:v2 style:0 handler:v5];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_100001F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001F90(uint64_t a1, void *a2)
{
  [a2 setEnabled:0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100001FE8(WeakRetained);
}

void sub_100001FE8(void *a1)
{
  if (a1)
  {
    v2 = sub_100001C6C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Continue button pressed.", (uint8_t *)buf, 2u);
    }

    v3 = [a1 presentationContext];
    v4 = [v3 storeAuthenticationRequest];
    v5 = [v4 authenticationRequest];

    id v6 = [a1 presentationContext];
    v7 = [v6 storeAuthenticationRequest];
    v8 = [v7 account];

    v9 = +[AMSProcessInfo currentProcess];
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"STORE_AUTHENTICATION_TOUCH_ID_TITLE" value:&stru_10000C4E8 table:0];
    [v9 setLocalizedName:v11];

    id v12 = [objc_alloc((Class)AMSUIDelegateTokenTask) initWithDelegateAuthenticateRequest:v5 account:v8 processInfo:v9 presentingViewController:a1[3]];
    objc_initWeak(buf, a1);
    v13 = [v12 perform];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100002214;
    v14[3] = &unk_10000C358;
    objc_copyWeak(&v15, buf);
    [v13 addFinishBlock:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void sub_1000021F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002214(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000022F0;
  block[3] = &unk_10000C330;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_1000022F0(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  sub_100002340(WeakRetained, a1[4], a1[5]);
}

void sub_100002340(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = sub_100001C6C();
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = CUPrintNSObjectMasked();
        int v11 = 138412290;
        id v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v11, 0xCu);
      }
      id v10 = [a1 viewServicePresenter];
      [v10 storeAuthenticationFinishedWithResult:v5];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100006DE4((uint64_t)v6, v8);
      }

      id v10 = [a1 viewServicePresenter];
      [v10 storeAuthenticationFailedWithError:v6];
    }

    sub_100002494(a1, v6 == 0);
  }
}

void sub_100002494(void *a1, char a2)
{
  if (a1)
  {
    v4 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:80.0];
    if (a2)
    {
      CFStringRef v5 = @"checkmark.circle";
    }
    else
    {
      id v6 = +[UIColor systemRedColor];
      v39[0] = v6;
      id v7 = +[UIColor labelColor];
      v39[1] = v7;
      id v8 = +[NSArray arrayWithObjects:v39 count:2];
      v9 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v8];
      uint64_t v10 = [v4 configurationByApplyingConfiguration:v9];

      CFStringRef v5 = @"person.crop.circle.badge.exclamationmark";
      v4 = (void *)v10;
    }
    v34 = v4;
    int v11 = +[UIImage systemImageNamed:v5];
    v37 = [v11 imageWithConfiguration:v4];

    id v12 = [objc_alloc((Class)UIImageView) initWithImage:v37];
    v13 = +[UIColor systemBlueColor];
    [v12 setTintColor:v13];

    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v14 = objc_alloc_init((Class)PRXCardContentViewController);
    id v15 = sub_100001CC0((uint64_t)a1);
    [v14 setTitle:v15];

    v16 = sub_100001D34(a1);
    [v14 setSubtitle:v16];

    v17 = [v14 contentView];
    [v17 addSubview:v12];

    v18 = sub_1000028A0(a1);
    id v19 = [v14 addAction:v18];

    v20 = [v14 contentView];
    v21 = [v20 mainContentGuide];

    v36 = [v12 centerXAnchor];
    v35 = [v21 centerXAnchor];
    v33 = [v36 constraintEqualToAnchor:v35];
    v38[0] = v33;
    v31 = [v12 centerYAnchor];
    v30 = [v21 centerYAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v38[1] = v29;
    v22 = [v12 topAnchor];
    [v21 topAnchor];
    v23 = v32 = (id *)a1;
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];
    v38[2] = v24;
    v25 = [v12 bottomAnchor];
    v26 = [v21 bottomAnchor];
    v27 = [v25 constraintLessThanOrEqualToAnchor:v26];
    v38[3] = v27;
    v28 = +[NSArray arrayWithObjects:v38 count:4];
    +[NSLayoutConstraint activateConstraints:v28];

    [v32[3] pushViewController:v14 animated:1];
  }
}

id sub_1000028A0(id val)
{
  if (val)
  {
    objc_initWeak(&location, val);
    v1 = +[NSBundle mainBundle];
    v2 = [v1 localizedStringForKey:@"DONE" value:&stru_10000C4E8 table:0];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000029E0;
    v5[3] = &unk_10000C308;
    objc_copyWeak(&v6, &location);
    v3 = +[PRXAction actionWithTitle:v2 style:0 handler:v5];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1000029BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000029E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

void sub_100002C28(id a1)
{
  qword_100012190 = (uint64_t)os_log_create("com.apple.CompanionServices", "StoreAuthenticationViewController");

  _objc_release_x1();
}

void sub_100002FD0(id *a1)
{
  if (a1 && !a1[3])
  {
    id v2 = [a1 presentationContext];
    v3 = [v2 webAuthenticationRequest];

    objc_initWeak(&location, a1);
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000032E8;
    v18 = &unk_10000C3C0;
    objc_copyWeak(&v19, &location);
    v4 = objc_retainBlock(&v15);
    CFStringRef v5 = [v3 callback:v15, v16, v17, v18];

    id v6 = objc_alloc((Class)ASWebAuthenticationSession);
    [v3 URL];
    if (v5) {
      id v7 = {;
    }
      id v8 = [v3 callback];
      id v9 = [v6 initWithURL:v7 callback:v8 completionHandler:v4];
    }
    else {
      id v7 = {;
    }
      id v8 = [v3 callbackScheme];
      id v9 = [v6 initWithURL:v7 callbackURLScheme:v8 completionHandler:v4];
    }
    id v10 = a1[3];
    a1[3] = v9;

    [a1[3] setPresentationContextProvider:a1];
    [a1[3] setPrefersEphemeralWebBrowserSession:1];
    if (objc_opt_respondsToSelector())
    {
      int v11 = [v3 additionalHeaderFields];
      [a1[3] setAdditionalHeaderFields:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      id v12 = [a1 presentationContext];
      v13 = [v12 proxiedAppDomains];
      [a1[3] setProxiedAssociatedDomains:v13];
    }
    id v14 = sub_1000034A4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting session: %@", buf, 0xCu);
    }

    [a1[3] start];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void sub_1000032AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000032E8(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    sub_100003360(WeakRetained, v8, v5);
  }
}

void sub_100003360(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_1000034F8;
    v13 = &unk_10000C330;
    objc_copyWeak(&v16, &location);
    id v14 = v5;
    id v15 = v6;
    id v7 = objc_retainBlock(&v10);
    id v8 = (void *)a1[4];
    a1[4] = v7;

    id v9 = [a1 presentedViewController:v10, v11, v12, v13];

    if (!v9) {
      [a1 _viewControllerDismissed:0];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void sub_100003488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000034A4()
{
  if (qword_1000121A8 != -1) {
    dispatch_once(&qword_1000121A8, &stru_10000C3E0);
  }
  v0 = (void *)qword_1000121A0;

  return v0;
}

void sub_1000034F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      v3 = sub_1000034A4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = CUPrintNSObjectMasked();
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v8, 0xCu);
      }
      id v5 = [WeakRetained viewServicePresenter];
      [v5 webAuthenticationFinishedWithCallbackURL:*(void *)(a1 + 32)];
    }
    else
    {
      id v5 = sub_100003654((uint64_t)WebAuthenticationViewController, *(void **)(a1 + 40));
      id v6 = sub_1000034A4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100006DE4((uint64_t)v5, v6);
      }

      id v7 = [WeakRetained viewServicePresenter];
      [v7 webAuthenticationFailedWithError:v5];
    }
  }
}

id sub_100003654(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  v3 = [v2 domain];
  if ([v3 isEqualToString:ASWebAuthenticationSessionErrorDomain])
  {
    id v4 = [v2 code];

    if (v4 == (id)1)
    {
      CPSErrorUnderlyingMake();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (v2)
  {
    id v5 = v2;
  }
  else
  {
    NSErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  id v6 = v5;

  return v6;
}

void sub_1000038B0(id a1)
{
  qword_1000121A0 = (uint64_t)os_log_create("com.apple.CompanionServices", "WebAuthVC");

  _objc_release_x1();
}

void sub_100003DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003DD4(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (a3)
  {
    id v7 = [WeakRetained viewServicePresenter];
    [v7 shareCompleted];
LABEL_5:

    goto LABEL_6;
  }
  if (!a2)
  {
    id v7 = [WeakRetained viewServicePresenter];
    uint64_t v8 = CPSErrorDomain;
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    CFStringRef v12 = @"User dismissed share sheet without sharing.";
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v8 code:104 userInfo:v9];
    [v7 shareFailedWithError:v10];

    goto LABEL_5;
  }
LABEL_6:
}

void sub_100003F48(void *a1)
{
  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = [a1 presentationContext];
      v3 = [v2 systemAuthenticationRequest];
      *(_DWORD *)buf = 134217984;
      id v34 = [v3 service];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presenting confirm prox card flow for: %ld", buf, 0xCu);
    }
    v31 = sub_100004324(a1);
    id v4 = [objc_alloc((Class)UIImageView) initWithImage:v31];
    id v5 = +[UIColor systemBlueColor];
    [v4 setTintColor:v5];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = objc_alloc_init((Class)PRXIconContentViewController);
    id v7 = sub_1000044CC(a1);
    [v6 setTitle:v7];

    uint64_t v8 = sub_10000462C(a1);
    [v6 setSubtitle:v8];

    id v9 = [v6 contentView];
    [v9 addSubview:v4];

    [v6 setDismissalType:1];
    id v10 = sub_100004968(a1);
    id v11 = [v6 addAction:v10];

    CFStringRef v12 = [v6 contentView];
    v13 = [v12 mainContentGuide];

    v30 = [v4 centerXAnchor];
    v29 = [v13 centerXAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v32[0] = v28;
    v26 = [v4 centerYAnchor];
    v25 = [v13 centerYAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v32[1] = v24;
    v27 = v4;
    id v14 = [v4 topAnchor];
    id v15 = [v13 topAnchor];
    id v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
    v32[2] = v16;
    v17 = [v4 bottomAnchor];
    v18 = [v13 bottomAnchor];
    id v19 = [v17 constraintLessThanOrEqualToAnchor:v18];
    v32[3] = v19;
    +[NSArray arrayWithObjects:v32 count:4];
    v21 = v20 = a1;
    +[NSLayoutConstraint activateConstraints:v21];

    uint64_t v22 = [v20 presentProxCardFlowWithDelegate:v20 initialViewController:v6];
    v23 = (void *)v20[3];
    v20[3] = v22;
  }
}

id sub_100004324(id a1)
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 presentationContext];
    v3 = [v2 systemAuthenticationRequest];

    id v4 = [v1 presentationContext];
    id v5 = v4;
    if (v3)
    {
      id v6 = [v4 systemAuthenticationRequest];
      id v7 = [v6 service];

      if (v7 == (id)4)
      {
        id v11 = +[NSBundle bundleForClass:objc_opt_class()];
        id v1 = +[UIImage imageNamed:@"recognize-my-voice-icon" inBundle:v11];

        goto LABEL_13;
      }
      if (v7 == (id)3)
      {
        CFStringRef v8 = @"photos-icon";
        goto LABEL_11;
      }
      if (v7 == (id)2)
      {
        CFStringRef v8 = @"shared-with-you-icon";
LABEL_11:
        id v1 = +[UIImage imageNamed:v8];
        goto LABEL_13;
      }
      id v1 = 0;
    }
    else
    {
      id v1 = [v4 restrictedAccessRequest];

      if (v1)
      {
        id v9 = +[UIImage systemImageNamed:@"figure.child.and.lock.fill"];
        id v10 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:80.0];
        id v1 = [v9 imageWithConfiguration:v10];
      }
    }
  }
LABEL_13:

  return v1;
}

id sub_1000044CC(void *a1)
{
  if (a1)
  {
    id v2 = [a1 presentationContext];
    v3 = [v2 systemAuthenticationRequest];

    id v4 = [a1 presentationContext];
    id v5 = v4;
    if (!v3)
    {
      id v11 = [v4 restrictedAccessRequest];

      if (!v11) {
        goto LABEL_12;
      }
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"RESTRICTED_ACCESS_TITLE";
      goto LABEL_11;
    }
    id v6 = [v4 systemAuthenticationRequest];
    id v7 = [v6 service];

    if (v7 == (id)4)
    {
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"RECOGNIZE_MY_VOICE_TITLE";
      goto LABEL_11;
    }
    if (v7 == (id)3)
    {
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"PHOTOS_TITLE";
      goto LABEL_11;
    }
    if (v7 == (id)2)
    {
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"SHARED_WITH_YOU_TITLE";
LABEL_11:
      id v11 = [v8 localizedStringForKey:v10 value:&stru_10000C4E8 table:0];

      goto LABEL_12;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

id sub_10000462C(id a1)
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 presentationContext];
    v3 = [v2 systemAuthenticationRequest];

    id v4 = [v1 presentationContext];
    id v5 = v4;
    if (!v3)
    {
      id v11 = [v4 restrictedAccessRequest];

      if (!v11)
      {
        id v1 = 0;
        goto LABEL_23;
      }
      id v6 = +[NSBundle mainBundle];
      id v9 = [v6 localizedStringForKey:@"RESTRICTED_ACCESS_MESSAGE" value:&stru_10000C4E8 table:0];
      CFStringRef v12 = sub_10000510C(v1);
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v12);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    id v6 = [v4 systemAuthenticationRequest];

    id v7 = [v6 service];
    if (v7 == (id)4)
    {
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"RECOGNIZE_MY_VOICE_MESSAGE";
    }
    else
    {
      if (v7 == (id)3)
      {
        if (([v6 options] & 2) != 0)
        {
          v18 = +[ACAccountStore defaultStore];
          id v9 = [v18 aa_primaryAppleAccount];

          CFStringRef v12 = +[NSBundle mainBundle];
          v13 = [v12 localizedStringForKey:@"PHOTOS_CHANGES_MESSAGE" value:&stru_10000C4E8 table:0];
          id v19 = sub_10000510C(v1);
          uint64_t v20 = [v9 username];
        }
        else
        {
          unsigned __int8 v14 = [v6 options];
          id v15 = +[ACAccountStore defaultStore];
          id v9 = [v15 aa_primaryAppleAccount];

          id v16 = +[NSBundle mainBundle];
          CFStringRef v12 = v16;
          if ((v14 & 4) != 0) {
            CFStringRef v17 = @"PHOTOS_SHARED_ALBUMS_MESSAGE";
          }
          else {
            CFStringRef v17 = @"PHOTOS_MESSAGE";
          }
          v13 = [v16 localizedStringForKey:v17 value:&stru_10000C4E8 table:0];
          id v19 = [v9 username];
          uint64_t v20 = sub_10000510C(v1);
        }
        v21 = (void *)v20;
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v19, v20);
        id v1 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      if (v7 != (id)2)
      {
        id v1 = 0;
LABEL_22:

        goto LABEL_23;
      }
      CFStringRef v8 = +[NSBundle mainBundle];
      id v9 = v8;
      CFStringRef v10 = @"SHARED_WITH_YOU_MESSAGE";
    }
    CFStringRef v12 = [v8 localizedStringForKey:v10 value:&stru_10000C4E8 table:0];
    v13 = sub_10000510C(v1);
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v13);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
LABEL_23:

  return v1;
}

id sub_100004968(id val)
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v2 = sub_100004A84(val);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100004B30;
    v5[3] = &unk_10000C308;
    objc_copyWeak(&v6, &location);
    v3 = +[PRXAction actionWithTitle:v2 style:0 handler:v5];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_100004A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100004A84(void *a1)
{
  if (a1)
  {
    id v1 = [a1 presentationContext];
    id v2 = [v1 restrictedAccessRequest];

    v3 = +[NSBundle mainBundle];
    id v4 = v3;
    if (v2) {
      CFStringRef v5 = @"APPROVE";
    }
    else {
      CFStringRef v5 = @"CONFIRM";
    }
    id v6 = [v3 localizedStringForKey:v5 value:&stru_10000C4E8 table:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_100004B30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100004B70(WeakRetained);
}

void sub_100004B70(unsigned char *a1)
{
  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Enable button pressed.", v3, 2u);
    }
    a1[32] = 1;
    id v2 = [a1 viewServicePresenter];
    [v2 confirm];

    sub_100004C10(a1);
  }
}

void sub_100004C10(void *a1)
{
  if (a1)
  {
    v28 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:80.0];
    id v2 = +[UIImage systemImageNamed:@"checkmark.circle"];
    v27 = [v2 imageWithConfiguration:v28];

    id v3 = [objc_alloc((Class)UIImageView) initWithImage:v27];
    id v4 = +[UIColor systemBlueColor];
    [v3 setTintColor:v4];

    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = objc_alloc_init((Class)PRXCardContentViewController);
    id v6 = sub_1000044CC(a1);
    [v5 setTitle:v6];

    id v7 = sub_10000462C(a1);
    [v5 setSubtitle:v7];

    CFStringRef v8 = [v5 contentView];
    [v8 addSubview:v3];

    id v9 = sub_100004F80(a1);
    id v10 = [v5 addAction:v9];

    id v11 = [v5 contentView];
    CFStringRef v12 = [v11 mainContentGuide];

    v26 = [v3 centerXAnchor];
    v25 = [v12 centerXAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v29[0] = v24;
    v23 = [v3 centerYAnchor];
    uint64_t v22 = [v12 centerYAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v29[1] = v21;
    v13 = [v3 topAnchor];
    unsigned __int8 v14 = [v12 topAnchor];
    id v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
    v29[2] = v15;
    id v16 = [v3 bottomAnchor];
    CFStringRef v17 = [v12 bottomAnchor];
    v18 = [v16 constraintLessThanOrEqualToAnchor:v17];
    v29[3] = v18;
    +[NSArray arrayWithObjects:v29 count:4];
    id v19 = v20 = (id *)a1;
    +[NSLayoutConstraint activateConstraints:v19];

    [v20[3] pushViewController:v5 animated:1];
  }
}

id sub_100004F80(id val)
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v1 = +[NSBundle mainBundle];
    id v2 = [v1 localizedStringForKey:@"DONE" value:&stru_10000C4E8 table:0];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000050C0;
    v5[3] = &unk_10000C308;
    objc_copyWeak(&v6, &location);
    id v3 = +[PRXAction actionWithTitle:v2 style:0 handler:v5];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_10000509C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000050C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v2;
  }
}

id sub_10000510C(void *a1)
{
  if (a1)
  {
    id v1 = [a1 presentationContext];
    id v2 = [v1 deviceName];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100005518(id *a1, void *a2)
{
  if (a1 && a2)
  {
    id v3 = a2;
    id v11 = (id)objc_opt_new();
    [v11 _setEndpoint:v3];

    id v4 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v11];
    id v5 = a1[1];
    a1[1] = v4;

    [a1[1] _setQueue:&_dispatch_main_q];
    id v6 = a1[1];
    uint64_t v7 = +[CPSViewServiceInterface presenterInterface];
    [v6 setRemoteObjectInterface:v7];

    [a1[1] setExportedObject:a1];
    id v8 = a1[1];
    id v9 = +[CPSViewServiceInterface presentingInterface];
    [v8 setExportedInterface:v9];

    [a1[1] resume];
    id v10 = [a1 viewServicePresenter];
    [v10 establishConnection];
  }
}

id sub_10000565C(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v2 = [a2 userInfo];
    id v3 = self;
    id v4 = [v2 bs_safeObjectForKey:@"presentationContextData" ofType:v3];

    if (v4)
    {
      id v5 = self;
      id v16 = 0;
      id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v5 fromData:v4 error:&v16];
      id v7 = v16;

      if (!v6)
      {
        id v8 = sub_100005780();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100006E5C((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_100005780()
{
  if (qword_1000121B8 != -1) {
    dispatch_once(&qword_1000121B8, &stru_10000C488);
  }
  v0 = (void *)qword_1000121B0;

  return v0;
}

void sub_1000057E0(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100005780();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100006EC8((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10000584C(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100005780();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100006F34((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10000590C(id a1)
{
  qword_1000121B0 = (uint64_t)os_log_create("com.apple.CompanionServices", "BaseVC");

  _objc_release_x1();
}

void sub_100005950(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000059B8(__CFString *a1)
{
  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v1 = [(__CFString *)a1 presentationContext];
      id v2 = [v1 dedicatedCameraRequest];
      *(_DWORD *)buf = 138412290;
      v46 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presenting dedicated camera prox card flow for: %@", buf, 0xCu);
    }
    id v41 = objc_alloc_init((Class)PRXIconContentViewController);
    id v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"DEDICATED_CAMERA_TITLE" value:&stru_10000C4E8 table:0];
    [v41 setTitle:v4];

    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = sub_100005F88(a1);
    uint64_t v7 = +[NSString stringWithFormat:@"%@_%@", @"DEDICATED_CAMERA_MESSAGE", v6];
    uint64_t v8 = [v7 uppercaseString];

    uint64_t v9 = [v5 localizedStringForKey:v8 value:&stru_10000C4E8 table:0];
    uint64_t v10 = +[NSString localizedStringWithFormat:v9];
    [v41 setSubtitle:v10];

    [v41 setDismissalType:1];
    v39 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:80.0];
    uint64_t v11 = +[UIImage _systemImageNamed:@"rectangle.inset.filled.and.camera"];
    uint64_t v12 = [v11 imageWithConfiguration:v39];
    uint64_t v13 = [v12 imageWithRenderingMode:2];
    uint64_t v14 = +[UIColor labelColor];
    v38 = [v13 imageWithTintColor:v14];

    id v15 = [objc_alloc((Class)UIImageView) initWithImage:v38];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v16 = [v41 contentView];
    [v16 addSubview:v15];

    objc_initWeak((id *)buf, a1);
    CFStringRef v17 = +[NSBundle mainBundle];
    v18 = [v17 localizedStringForKey:@"CONTINUE" value:&stru_10000C4E8 table:0];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100005FD8;
    v42[3] = &unk_10000C308;
    objc_copyWeak(&v43, (id *)buf);
    id v19 = +[PRXAction actionWithTitle:v18 style:0 handler:v42];
    id v20 = [v41 addAction:v19];

    v21 = [v41 contentView];
    uint64_t v22 = [v21 mainContentGuide];

    v37 = [v15 centerXAnchor];
    v36 = [v22 centerXAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v44[0] = v35;
    id v34 = [v15 centerYAnchor];
    v33 = [v22 centerYAnchor];
    v23 = [v34 constraintEqualToAnchor:v33];
    v44[1] = v23;
    v24 = [v15 topAnchor];
    v25 = [v22 topAnchor];
    v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25];
    v44[2] = v26;
    v27 = [v15 bottomAnchor];
    v28 = [v22 bottomAnchor];
    v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
    v44[3] = v29;
    v30 = +[NSArray arrayWithObjects:v44 count:4];
    +[NSLayoutConstraint activateConstraints:v30];

    uint64_t v31 = [(__CFString *)a1 presentProxCardFlowWithDelegate:a1 initialViewController:v41];
    length = (void *)a1->length;
    a1->length = v31;

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
}

void sub_100005F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

__CFString *sub_100005F88(__CFString *result)
{
  if (result)
  {
    id v1 = [(__CFString *)result presentationContext];
    id v2 = [v1 dedicatedCameraRequest];
    [v2 deviceType];

    return @"AppleTV";
  }
  return result;
}

void sub_100005FD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100006018((uint64_t)WeakRetained);
}

void sub_100006018(uint64_t a1)
{
  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v1 = [(id)a1 presentationContext];
      id v2 = [v1 dedicatedCameraRequest];
      *(_DWORD *)buf = 138412290;
      v32 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Pushing bullets view controller for: %@", buf, 0xCu);
    }
    id v27 = objc_alloc_init((Class)PRXIconContentViewController);
    id v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"DEDICATED_CAMERA_TITLE" value:&stru_10000C4E8 table:0];
    [v27 setTitle:v4];

    [v27 setDismissalType:1];
    v26 = sub_100006460((__CFString *)a1);
    uint64_t v5 = [v27 contentView];
    [v5 addSubview:v26];

    objc_initWeak((id *)buf, (id)a1);
    uint64_t v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"CONTINUE" value:&stru_10000C4E8 table:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000691C;
    v28[3] = &unk_10000C308;
    objc_copyWeak(&v29, (id *)buf);
    uint64_t v8 = +[PRXAction actionWithTitle:v7 style:0 handler:v28];
    id v9 = [v27 addAction:v8];

    uint64_t v10 = [v27 contentView];
    uint64_t v11 = [v10 mainContentGuide];

    v24 = [v26 topAnchor];
    v23 = [v11 topAnchor];
    uint64_t v22 = [v24 constraintGreaterThanOrEqualToAnchor:v23 constant:10.0];
    v30[0] = v22;
    v21 = [v26 bottomAnchor];
    uint64_t v12 = [v11 bottomAnchor];
    uint64_t v13 = [v21 constraintLessThanOrEqualToAnchor:v12 constant:-20.0];
    v30[1] = v13;
    uint64_t v14 = [v26 leadingAnchor];
    id v15 = [v11 leadingAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15];
    v30[2] = v16;
    CFStringRef v17 = [v26 trailingAnchor];
    v18 = [v11 trailingAnchor];
    id v19 = [v17 constraintEqualToAnchor:v18];
    v30[3] = v19;
    id v20 = +[NSArray arrayWithObjects:v30 count:4];
    +[NSLayoutConstraint activateConstraints:v20];

    [*(id *)(a1 + 24) pushViewController:v27 animated:1];
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

void sub_100006424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

id sub_100006460(__CFString *a1)
{
  if (a1)
  {
    id v2 = objc_alloc_init((Class)UIStackView);
    [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v2 setAxis:1];
    [v2 setAlignment:1];
    v39 = v2;
    [v2 setSpacing:30.0];
    id v3 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:30.0];
    uint64_t v4 = +[UIImage systemImageNamed:@"video.fill" withConfiguration:v3];
    id v41 = [v4 imageWithRenderingMode:1];

    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = sub_100005F88(a1);
    uint64_t v7 = +[NSString stringWithFormat:@"%@_%@", @"DEDICATED_CAMERA_CAMERA_MICROPHONE_BULLET", v6];
    uint64_t v8 = [v7 uppercaseString];

    id v9 = [v5 localizedStringForKey:v8 value:&stru_10000C4E8 table:0];
    v40 = sub_100006A04((uint64_t)a1, v41, v9);

    [v2 addArrangedSubview:v40];
    uint64_t v10 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:30.0];
    uint64_t v11 = +[UIColor labelColor];
    v42[0] = v11;
    uint64_t v12 = +[UIColor labelColor];
    v42[1] = v12;
    uint64_t v13 = +[UIColor systemGreenColor];
    v42[2] = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:v42 count:3];
    id v15 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v14];
    id v16 = [v10 configurationByApplyingConfiguration:v15];
    CFStringRef v17 = +[UIImage _systemImageNamed:@"battery.powerplug" withConfiguration:v16];
    [v17 imageWithRenderingMode:2];
    id v19 = v18 = a1;

    id v20 = +[NSBundle mainBundle];
    v21 = sub_100005F88(v18);
    uint64_t v22 = +[NSString stringWithFormat:@"%@_%@", @"DEDICATED_CAMERA_POWER_BULLET", v21];
    v23 = [v22 uppercaseString];

    v24 = [v20 localizedStringForKey:v23 value:&stru_10000C4E8 table:0];
    v25 = v19;
    v26 = sub_100006A04((uint64_t)v18, v19, v24);

    [v39 addArrangedSubview:v26];
    id v27 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:30.0];
    v28 = +[UIImage systemImageNamed:@"star.fill" withConfiguration:v27];
    id v29 = [v28 imageWithRenderingMode:1];

    v30 = +[NSBundle mainBundle];
    uint64_t v31 = sub_100005F88(v18);
    v32 = +[NSString stringWithFormat:@"%@_%@", @"DEDICATED_CAMERA_FAVORITES_BULLET", v31];
    v33 = [v32 uppercaseString];

    id v34 = [v30 localizedStringForKey:v33 value:&stru_10000C4E8 table:0];
    uint64_t v35 = (uint64_t)v18;
    v36 = v39;
    v37 = sub_100006A04(v35, v29, v34);

    [v39 addArrangedSubview:v37];
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

void sub_10000691C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_10000695C(WeakRetained);
}

unsigned char *sub_10000695C(unsigned char *result)
{
  if (result)
  {
    id v1 = result;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Confirm button pressed.", v3, 2u);
    }
    v1[32] = 1;
    id v2 = [v1 viewServicePresenter];
    [v2 confirm];

    return [v1 dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

id sub_100006A04(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v4 = a3;
    id v5 = a2;
    id v6 = [objc_alloc((Class)UIImageView) initWithImage:v5];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v7) = 1148846080;
    [v6 setContentCompressionResistancePriority:0 forAxis:v7];
    [v6 setContentMode:1];
    uint64_t v8 = +[PRXLabel labelWithStyle:1];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setText:v4];

    [v8 setTextAlignment:4];
    id v9 = objc_alloc((Class)UIStackView);
    v17[0] = v6;
    v17[1] = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:v17 count:2];
    id v11 = [v9 initWithArrangedSubviews:v10];

    [v11 setSpacing:15.0];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setAxis:0];
    [v11 setAlignment:3];
    uint64_t v12 = [v6 widthAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:45.0];
    id v16 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v16 count:1];
    +[NSLayoutConstraint activateConstraints:v14];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_100006DE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006E5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006EC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006F34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t CPSErrorUnderlyingMake()
{
  return _CPSErrorUnderlyingMake();
}

uint64_t CUPrintNSObjectMasked()
{
  return _CUPrintNSObjectMasked();
}

uint64_t NSErrorF()
{
  return _NSErrorF();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__presentWebsite(void *a1, const char *a2, ...)
{
  return [a1 _presentWebsite];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__url(void *a1, const char *a2, ...)
{
  return [a1 _url];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_additionalHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 additionalHeaderFields];
}

id objc_msgSend_authenticationRequest(void *a1, const char *a2, ...)
{
  return [a1 authenticationRequest];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_callbackScheme(void *a1, const char *a2, ...)
{
  return [a1 callbackScheme];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_confirm(void *a1, const char *a2, ...)
{
  return [a1 confirm];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return [a1 currentProcess];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dedicatedCameraRequest(void *a1, const char *a2, ...)
{
  return [a1 dedicatedCameraRequest];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_establishConnection(void *a1, const char *a2, ...)
{
  return [a1 establishConnection];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return [a1 mainContentGuide];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return [a1 presentationContext];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presenterInterface(void *a1, const char *a2, ...)
{
  return [a1 presenterInterface];
}

id objc_msgSend_presentingInterface(void *a1, const char *a2, ...)
{
  return [a1 presentingInterface];
}

id objc_msgSend_providerURL(void *a1, const char *a2, ...)
{
  return [a1 providerURL];
}

id objc_msgSend_proxiedAppDomains(void *a1, const char *a2, ...)
{
  return [a1 proxiedAppDomains];
}

id objc_msgSend_restrictedAccessRequest(void *a1, const char *a2, ...)
{
  return [a1 restrictedAccessRequest];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_shareCompleted(void *a1, const char *a2, ...)
{
  return [a1 shareCompleted];
}

id objc_msgSend_sharingData(void *a1, const char *a2, ...)
{
  return [a1 sharingData];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_storeAuthenticationRequest(void *a1, const char *a2, ...)
{
  return [a1 storeAuthenticationRequest];
}

id objc_msgSend_systemAuthenticationRequest(void *a1, const char *a2, ...)
{
  return [a1 systemAuthenticationRequest];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_tvProviderRequest(void *a1, const char *a2, ...)
{
  return [a1 tvProviderRequest];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewServiceHost(void *a1, const char *a2, ...)
{
  return [a1 viewServiceHost];
}

id objc_msgSend_viewServicePresenter(void *a1, const char *a2, ...)
{
  return [a1 viewServicePresenter];
}

id objc_msgSend_webAuthenticationRequest(void *a1, const char *a2, ...)
{
  return [a1 webAuthenticationRequest];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}