void sub_100002328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000234C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000062F8((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAndExit];
}

id sub_100002850(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAndExit];
}

void sub_100002914(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "AKRemoteViewController showing alert for error %@", buf, 0xCu);
  }

  v4 = +[AKAlertHandler sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002A28;
  v6[3] = &unk_10000C348;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  [v4 showAlertForError:v5 withCompletion:v6];
}

void sub_100002A28(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = +[NSError ak_errorWithCode:-7034 underlyingError:a3];
    [v3 _callCompletionWithAuthorization:0 error:v4];
  }
}

id sub_100002C8C(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  [*(id *)(a1 + 32) setAuthorizationViewController:0];
  v2 = *(void **)(a1 + 32);

  return [v2 endUIService];
}

void sub_100002CDC(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) authorizationViewController];
  uint64_t v5 = [v7 navigationController];
  v6 = [v5 viewIfLoaded];
  [v6 setFrame:v1, v2, v3, v4];
}

uint64_t sub_100002D70(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) authorizationViewController];
  [v2 willMoveToParentViewController:0];

  double v3 = [*(id *)(a1 + 32) authorizationViewController];
  double v4 = [v3 view];
  [v4 removeFromSuperview];

  uint64_t v5 = [*(id *)(a1 + 32) authorizationViewController];
  [v5 removeFromParentViewController];

  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

id sub_100003424(uint64_t a1)
{
  return [*(id *)(a1 + 32) _main_dismissAndExit];
}

uint64_t sub_1000034F4()
{
  uint64_t v2 = 0;
  double v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100012790;
  uint64_t v5 = qword_100012790;
  if (!qword_100012790)
  {
    long long v6 = *(_OWORD *)off_10000C408;
    long long v7 = *(_OWORD *)&off_10000C418;
    v3[3] = _sl_dlopen();
    qword_100012790 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100003604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000361C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100012790 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000036AC()
{
  uint64_t v0 = sub_1000034F4();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100003708()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100012798;
  uint64_t v7 = qword_100012798;
  if (!qword_100012798)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000037EC;
    v3[3] = &unk_10000C458;
    v3[4] = &v4;
    sub_1000037EC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000037D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000037EC(uint64_t a1)
{
  sub_1000036AC();
  Class result = objc_getClass("AAUIProfilePictureStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100012798 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    double v3 = (AKPasswordResetRemoteViewController *)sub_1000064B4();
    return (Class)[(AKPasswordResetRemoteViewController *)v3 needsOptionsView];
  }
  return result;
}

void sub_100003B00(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsOptionsView])
  {
    uint64_t v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "User name is present in the context, so presenting options reset options view", v14, 2u);
    }

    double v3 = (objc_class *)sub_1000034F4();
    if (v3) {
      double v3 = (objc_class *)sub_100003708();
    }
    id v4 = objc_alloc_init(v3);
    id v5 = [objc_alloc((Class)AKPasswordResetViewController) initWithImageProvider:v4];
    [v5 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setPasswordResetController:v5];
    id v6 = objc_alloc((Class)UINavigationController);
    uint64_t v7 = [*(id *)(a1 + 32) passwordResetController];
    id v8 = [v6 initWithRootViewController:v7];
    [*(id *)(a1 + 32) setRootNavigationController:v8];

    v9 = [*(id *)(a1 + 32) rootNavigationController];
    [v9 setModalInPresentation:1];

    v10 = [*(id *)(a1 + 32) rootNavigationController];
    [v10 setModalPresentationStyle:2];

    v11 = [*(id *)(a1 + 32) fullscreenBackDropViewController];
    v12 = [*(id *)(a1 + 32) rootNavigationController];
    [v11 presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    [v13 _presentPasswordResetFlowForUsername:0];
  }
}

void sub_100003DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100003DE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000064DC((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAndExit];
}

void sub_100004520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004544(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004634;
  v9[3] = &unk_10000C480;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v13);
}

void sub_100004634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained rootNavigationController];
    id v5 = [v4 viewControllers];
    id v6 = [v5 count];

    id v7 = [v3 rootNavigationController];
    uint64_t v8 = [v7 viewControllers];
    id v9 = [(id)v8 count];

    id v10 = [v3 passwordResetController];
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();

    if (v8)
    {
      id v11 = [v3 passwordResetController];
      [v11 stopLoading];
    }
    if (![v3 needsOptionsView]) {
      goto LABEL_9;
    }
    if (v9 != (id)1)
    {
      if (v6 == (id)2 && objc_msgSend(*(id *)(a1 + 32), "ak_isUserCancelError"))
      {
        id v12 = [v3 rootNavigationController];
        id v13 = [v12 popToRootViewControllerAnimated:1];

        goto LABEL_13;
      }
LABEL_9:
      [v3 _passwordResetDidFinishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
    }
  }
  else
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000065F8(a1, v14, v15, v16, v17, v18, v19, v20);
    }
  }
LABEL_13:
}

void sub_100004988(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_1000049B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = _AKLogSystem();
  uint64_t v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing view service after password reset finished.", v5, 2u);
    }

    id v4 = [WeakRetained fullscreenBackDropViewController];
    [v4 dismissViewControllerAnimated:0 completion:0];

    [WeakRetained setFullscreenBackDropViewController:0];
    [WeakRetained dismissViewControllerAnimated:0 completion:0];
    [WeakRetained endUIService];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000066F0(v3);
    }
  }
}

void sub_100004A94(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100004B44;
    v3[3] = &unk_10000C4F8;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    id v4 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

    objc_destroyWeak(&v5);
  }
}

uint64_t sub_100004B44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  uint64_t v8 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained rootNavigationController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        id v3 = v8,
        v4))
  {
    id v5 = [v8 rootNavigationController];
    [v5 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 32)];

    [v8 setRootNavigationController:0];
    [v8 setPasswordResetController:0];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    }
  }

  return _objc_release_x1();
}

void sub_100004D44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004D60()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_1000127A0;
  uint64_t v5 = qword_1000127A0;
  if (!qword_1000127A0)
  {
    long long v6 = *(_OWORD *)off_10000C540;
    long long v7 = *(_OWORD *)&off_10000C550;
    v3[3] = _sl_dlopen();
    qword_1000127A0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100004E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E88(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000127A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004F18()
{
  uint64_t v0 = sub_100004D60();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_100004F74()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000127A8;
  uint64_t v7 = qword_1000127A8;
  if (!qword_1000127A8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005058;
    v3[3] = &unk_10000C458;
    void v3[4] = &v4;
    sub_100005058((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100005040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005058(uint64_t a1)
{
  sub_100004F18();
  Class result = objc_getClass("RUIStyle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000127A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100006734();
    return (Class)sub_1000050B0();
  }
  return result;
}

id sub_1000050B0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000127B0;
  uint64_t v7 = qword_1000127B0;
  if (!qword_1000127B0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005194;
    v3[3] = &unk_10000C458;
    void v3[4] = &v4;
    sub_100005194((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000517C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKPrivateEmailRemoteViewController *sub_100005194(uint64_t a1)
{
  sub_100004F18();
  Class result = (AKPrivateEmailRemoteViewController *)objc_getClass("RemoteUIControllerPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000127B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (AKPrivateEmailRemoteViewController *)sub_10000675C();
    return [(AKPrivateEmailRemoteViewController *)v3 initWithPrivateEmailContext:v5 altDSID:v6];
  }
  return result;
}

void sub_1000053DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005400(uint64_t a1, void *a2)
{
  id v3 = a2;
  SEL v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000062F8((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAndExit];
}

id sub_100005788(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPrivateEmailFlow];
}

void sub_100005A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005A3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005A4C(uint64_t a1)
{
}

void sub_100005A54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = AKURLBagKeyPrivateEmailUseAddress;
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resourceLoadDelegate];
  [v8 setBagUrlKey:v7];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setResourceLoadDelegate:v5];
  if (v5)
  {
    [v5 decorateWithPrivateEmailContext:*(void *)(*(void *)(a1 + 32) + 32)];
    v23 = [*(id *)(*(void *)(a1 + 32) + 16) inAppAuthUIProvider];
    uint64_t v9 = +[UIImage imageNamed:@"icloudPlus"];
    id v10 = (objc_class *)sub_100004D60();
    id v24 = v6;
    if (v10) {
      id v10 = (objc_class *)sub_1000050B0();
    }
    id v11 = [v10 alloc];
    id v12 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    id v13 = [v12 localizedStringForKey:@"PRIVATE_EMAIL_LOADING" value:&stru_10000C650 table:@"Localizable"];
    v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
    uint64_t v15 = [v14 localizedStringForKey:@"ICLOUD_PLUS_TEXT" value:&stru_10000C650 table:@"Localizable"];
    id v16 = [v11 initWithSpinner:1 spinnerLabel:v13 navBarImage:v9 navBarImageLabel:v15];
    [v23 setRuiPreferences:v16];

    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void **)(v17 + 16);
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100005D54;
    v25[3] = &unk_10000C568;
    v25[4] = v17;
    [v18 presentServerProvidedUIWithConfiguration:v19 completion:v25];

    id v6 = v24;
  }
  else
  {
    uint64_t v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Nil LoadDelegate for config:%@,\nurl=%@,\nkey=%@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) _callFlowEndedCompletionWithPrivateEmail:0 error:v6];
  }
}

void sub_100005D54(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a4;
  uint64_t v6 = AKPrivateEmailAddressKey;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:v6];
  uint64_t v9 = [v7 objectForKey:@"X-Apple-I-Private-Email-Client-Bundle"];

  if (v8
    && (id v10 = objc_alloc((Class)AKPrivateEmail),
        [*(id *)(*(void *)(a1 + 32) + 32) key],
        id v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v10 initWithAddress:v8 forKey:v11 withBundleId:v9],
        v11,
        v12))
  {
    [*(id *)(a1 + 32) _callFlowEndedCompletionWithPrivateEmail:v12 error:0];
  }
  else
  {
    [*(id *)(a1 + 32) _callFlowEndedCompletionWithPrivateEmail:0 error:v13];
  }
}

id sub_100006000(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAndExit];
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100006270(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "authorization view controller already being shown; ignoring",
    v1,
    2u);
}

void sub_1000062B4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting up look up host proxy", v1, 2u);
}

void sub_1000062F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "listener lookup connection error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006370(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "authorization context data missing", v1, 2u);
}

void sub_1000063B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "authorization context error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000642C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Host Proxy is set up in the subclass", v1, 2u);
}

void sub_100006470(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting up look up connection", v1, 2u);
}

uint64_t sub_1000064B4()
{
  uint64_t v0 = abort_report_np();
  return sub_1000064DC(v0);
}

void sub_1000064DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006548(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Context data missing", v1, 2u);
}

void sub_10000658C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000065F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006668(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Password reset flow finished with result: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000066F0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Password reset remote controller deallocated before ending the oop", v1, 2u);
}

uint64_t sub_100006734()
{
  return sub_10000675C();
}

uint64_t sub_10000675C()
{
  uint64_t v0 = abort_report_np();
  return sub_100006784(v0);
}

void sub_100006784(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Calling host proxy (%@) with private email response", (uint8_t *)&v3, 0xCu);
}

void sub_100006808(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sending private email failure back to daemon with error: %@", (uint8_t *)&v2, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AKLogHme()
{
  return __AKLogHme();
}

uint64_t _AKLogSystem()
{
  return __AKLogSystem();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_msgSend__createNavigationController(void *a1, const char *a2, ...)
{
  return [a1 _createNavigationController];
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return [a1 _invalidateLookupConnection];
}

id objc_msgSend__prepareToPresentPrivateEmailFlow(void *a1, const char *a2, ...)
{
  return [a1 _prepareToPresentPrivateEmailFlow];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__showTiburonFlow(void *a1, const char *a2, ...)
{
  return [a1 _showTiburonFlow];
}

id objc_msgSend_authorizationViewController(void *a1, const char *a2, ...)
{
  return [a1 authorizationViewController];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dismissAndExit(void *a1, const char *a2, ...)
{
  return [a1 dismissAndExit];
}

id objc_msgSend_endUIService(void *a1, const char *a2, ...)
{
  return [a1 endUIService];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullscreenBackDropViewController(void *a1, const char *a2, ...)
{
  return [a1 fullscreenBackDropViewController];
}

id objc_msgSend_hostProxy(void *a1, const char *a2, ...)
{
  return [a1 hostProxy];
}

id objc_msgSend_httpHeadersForRemoteUI(void *a1, const char *a2, ...)
{
  return [a1 httpHeadersForRemoteUI];
}

id objc_msgSend_inAppAuthUIProvider(void *a1, const char *a2, ...)
{
  return [a1 inAppAuthUIProvider];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isNativeTakeover(void *a1, const char *a2, ...)
{
  return [a1 isNativeTakeover];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lookupConnection(void *a1, const char *a2, ...)
{
  return [a1 lookupConnection];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsOptionsView(void *a1, const char *a2, ...)
{
  return [a1 needsOptionsView];
}

id objc_msgSend_passwordResetController(void *a1, const char *a2, ...)
{
  return [a1 passwordResetController];
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return [a1 presentationContext];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_privateEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 privateEmailAddress];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resourceLoadDelegate(void *a1, const char *a2, ...)
{
  return [a1 resourceLoadDelegate];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootNavigationController(void *a1, const char *a2, ...)
{
  return [a1 rootNavigationController];
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serviceIdentifier];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_setUpHostProxy(void *a1, const char *a2, ...)
{
  return [a1 setUpHostProxy];
}

id objc_msgSend_setupRemoteProxy(void *a1, const char *a2, ...)
{
  return [a1 setupRemoteProxy];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stopLoading(void *a1, const char *a2, ...)
{
  return [a1 stopLoading];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}