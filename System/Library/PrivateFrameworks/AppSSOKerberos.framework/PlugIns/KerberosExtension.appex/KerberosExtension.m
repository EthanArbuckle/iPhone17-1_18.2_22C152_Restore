id sub_1000033E0()
{
  void *v0;
  uint64_t vars8;

  if (qword_10001AAB0 != -1) {
    dispatch_once(&qword_10001AAB0, &stru_1000144B8);
  }
  v0 = (void *)qword_10001AAB8;
  return v0;
}

void sub_100003674(uint64_t a1)
{
  id v3 = +[UIColor colorWithWhite:0.0 alpha:0.4];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

void sub_100003840(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64) + 22.0;
  id v3 = [*(id *)(a1 + 32) bottomConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

void sub_1000039C8(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) bottomConstraint];
  [v2 setConstant:22.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

id sub_100003C64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableUI];
}

id sub_100003D70(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);
  return [v3 cancelCurrentOperation];
}

void sub_10000412C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000041B4;
  v2[3] = &unk_100014428;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_1000041B4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentUIContext:*(void *)(a1 + 40)];
  double v2 = [*(id *)(a1 + 32) currentUIContext];
  id v3 = [v2 realm];
  id v4 = [*(id *)(a1 + 32) realmLabel];
  [v4 setText:v3];

  v5 = [*(id *)(a1 + 32) currentUIContext];
  v6 = [v5 userName];
  v7 = [*(id *)(a1 + 32) usernameTextField];
  [v7 setText:v6];

  v8 = [*(id *)(a1 + 32) currentUIContext];
  uint64_t v9 = [v8 userNameIsReadOnly] ^ 1;
  v10 = [*(id *)(a1 + 32) usernameTextField];
  [v10 setEnabled:v9];

  id v11 = [*(id *)(a1 + 32) passwordTextField];
  [v11 setText:&stru_100014860];
}

void sub_100004394(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) process];
  id v3 = [*(id *)(a1 + 32) currentUIContext];
  id v4 = [v3 realm];
  v5 = [v2 kerberosForRealm:v4];

  v6 = [*(id *)(a1 + 32) currentUIContext];
  v34[0] = 0;
  LODWORD(v4) = [v5 changePasswordWithContext:v6 withError:v34];
  id v7 = v34[0];

  if (v4)
  {
    v8 = [*(id *)(a1 + 32) currentUIContext];
    uint64_t v9 = [v8 changedPassword];
    v10 = [*(id *)(a1 + 32) currentUIContext];
    [v10 setPassword:v9];

    id v11 = [*(id *)(a1 + 32) currentUIContext];
    [v11 setChangedPassword:0];

    v12 = [*(id *)(a1 + 32) currentUIContext];
    v13 = [v12 extensionData];
    if ([v13 allowAutomaticLogin])
    {
      v14 = [*(id *)(a1 + 32) currentUIContext];
      v15 = [v14 extensionUserData];
      unsigned int v16 = [v15 useKeychain];

      if (!v16)
      {
LABEL_6:
        dispatch_time_t v22 = dispatch_time(0, 5000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000047AC;
        block[3] = &unk_100014358;
        block[4] = *(void *)(a1 + 32);
        dispatch_after(v22, (dispatch_queue_t)&_dispatch_main_q, block);
        goto LABEL_12;
      }
      v12 = [*(id *)(a1 + 32) keychainHelper];
      v13 = [*(id *)(a1 + 32) currentUIContext];
      v17 = [v13 serviceName];
      v29 = [*(id *)(a1 + 32) currentUIContext];
      v18 = [v29 userPrincipalName];
      v28 = [*(id *)(a1 + 32) currentUIContext];
      v19 = [v28 password];
      v20 = [*(id *)(a1 + 32) currentUIContext];
      v21 = [v20 extensionData];
      objc_msgSend(v12, "addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:", v17, v18, v19, objc_msgSend(v21, "requireUserPresence"));
    }
    goto LABEL_6;
  }
  if (v7)
  {
    v23 = [*(id *)(a1 + 32) process];
    v24 = [v23 mapKnownPasswordErrorToString:v7];

    v25 = sub_1000033E0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10000D1A0((uint64_t)v24, v25);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100004880;
    v31[3] = &unk_100014428;
    v31[4] = *(void *)(a1 + 32);
    id v32 = v24;
    id v26 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v31);
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000048FC;
    v30[3] = &unk_100014358;
    v30[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
  }
LABEL_12:
  v27 = sub_1000033E0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10000D16C();
  }
}

void sub_1000047AC(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 didChangePassword];
  }
  v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = [v7 delegate];
    [v8 didClose];
  }
  else
  {
    id v8 = [v7 currentUIContext];
    [v8 completeRequest];
  }
}

id sub_100004880(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000048F4;
  v4[3] = &unk_100014358;
  v4[4] = v2;
  return [v2 _showMessage:v1 completionHandler:v4];
}

id sub_1000048F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableUI];
}

id sub_1000048FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableUI];
}

id sub_100004AF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  char v3 = *(void **)(a1 + 32);
  return [v3 enableElementAutoFocusForAccessibility];
}

id sub_100004B38(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableElementAutoFocusForAccessibility];
}

void sub_100004E0C(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[8])
  {
    UIAccessibilityNotifications v2 = UIAccessibilityScreenChangedNotification;
    id v3 = [v1 spinner];
    UIAccessibilityPostNotification(v2, v3);
  }
}

void sub_100005668(id a1)
{
  qword_10001AAB8 = (uint64_t)os_log_create("com.apple.AppSSO", "KerberosPasswordViewController");
  _objc_release_x1();
}

void sub_1000056AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100005D28()
{
  if (qword_10001AAC0 != -1) {
    dispatch_once(&qword_10001AAC0, &stru_100014710);
  }
  v0 = (void *)qword_10001AAC8;
  return v0;
}

void sub_100005D7C(uint64_t a1, void *a2)
{
  id v37 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained currentUIContext];
  if ([v5 smartCardNeedsInsert])
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 currentUIContext];
    id v8 = [v7 certificateTokenID];
    unsigned int v9 = [v37 isEqualToString:v8];

    if (!v9) {
      goto LABEL_5;
    }
    id v10 = objc_loadWeakRetained(v3);
    id v11 = [v10 loginButton];
    [v11 setEnabled:1];

    id v12 = objc_loadWeakRetained(v3);
    v13 = [v12 optionsButton];
    [v13 setEnabled:1];

    id v14 = objc_loadWeakRetained(v3);
    v15 = [v14 usernameTextField];
    [v15 setEnabled:0];

    id v16 = objc_loadWeakRetained(v3);
    v17 = [v16 passwordTextField];
    [v17 setEnabled:0];

    id v18 = objc_loadWeakRetained(v3);
    v19 = [v18 cancelButton];
    [v19 setEnabled:1];

    id v36 = objc_loadWeakRetained(v3);
    v20 = [v36 signInTitleLabel];
    v35 = +[NSBundle mainBundle];
    v21 = [v35 localizedStringForKey:@"SIGN_IN_TITLE" value:&stru_100014860 table:0];
    id v22 = objc_loadWeakRetained(v3);
    v23 = [v22 currentUIContext];
    v24 = [v23 callerLocalizedName];
    id v25 = objc_loadWeakRetained(v3);
    id v26 = [v25 currentUIContext];
    v27 = [v26 realm];
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v24, v27);
    [v20 setText:v28];

    id WeakRetained = objc_loadWeakRetained(v3);
    v5 = [WeakRetained signInTitleLabel];
    [v5 sizeToFit];
  }

LABEL_5:
  id v29 = objc_loadWeakRetained(v3);
  v30 = [v29 buildIdentityMenu];
  id v31 = objc_loadWeakRetained(v3);
  id v32 = [v31 identityButton];
  [v32 setMenu:v30];

  id v33 = objc_loadWeakRetained(v3);
  v34 = [v33 currentUIContext];
  [v34 setSmartCardNeedsInsert:0];
}

id sub_100006698(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) currentUIContext];
  id v3 = [v2 extensionUserData];
  unsigned int v4 = [v3 useSmartCard];

  v5 = [*(id *)(a1 + 32) currentUIContext];
  id v6 = [v5 extensionUserData];
  [v6 setUseSmartCard:v4 ^ 1];

  id v7 = [*(id *)(a1 + 32) currentUIContext];
  [v7 setPkinitPersistientRef:0];

  id v8 = [*(id *)(a1 + 32) currentUIContext];
  [v8 setCertificateTokenID:0];

  unsigned int v9 = [*(id *)(a1 + 32) currentUIContext];
  [v9 setSmartCardLAContext:0];

  id v10 = [*(id *)(a1 + 32) currentUIContext];
  [v10 setPkinitIdentity:0];

  id v11 = [*(id *)(a1 + 32) buildIdentityMenu];
  id v12 = [*(id *)(a1 + 32) identityButton];
  [v12 setMenu:v11];

  v13 = [*(id *)(a1 + 32) buildOptionsMenu];
  id v14 = [*(id *)(a1 + 32) optionsButton];
  [v14 setMenu:v13];

  v15 = *(void **)(a1 + 32);
  return [v15 changeUIForCertIdentity];
}

void sub_1000067FC(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) currentUIContext];
  id v3 = [v2 extensionUserData];
  unsigned int v4 = [v3 useKeychain];

  v5 = [*(id *)(a1 + 32) currentUIContext];
  id v6 = [v5 extensionUserData];
  [v6 setUserSetKeychainChoice:1];

  id v7 = [*(id *)(a1 + 32) currentUIContext];
  id v8 = [v7 extensionUserData];
  [v8 setUseKeychain:v4 ^ 1];

  id v10 = [*(id *)(a1 + 32) buildOptionsMenu];
  unsigned int v9 = [*(id *)(a1 + 32) optionsButton];
  [v9 setMenu:v10];
}

id sub_1000068F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:"showPasswordViewController" withObject:0 waitUntilDone:0];
}

void sub_100006908(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) process];
  id v3 = [*(id *)(a1 + 32) currentUIContext];
  [v2 handleLogoutWithContext:v3 removeRealm:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000069CC;
  block[3] = &unk_100014358;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1000069CC(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) usernameTextField];
  [v2 setText:&stru_100014860];

  id v3 = [*(id *)(a1 + 32) passwordTextField];
  [v3 setText:&stru_100014860];

  [*(id *)(a1 + 32) changeUIForCertIdentity];
  [*(id *)(a1 + 32) disableUI];
  unsigned int v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006AB8;
  block[3] = &unk_100014358;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

void sub_100006AB8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) process];
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) currentUIContext];
  [v3 attemptKerberosWithContext:v2 andDelegate:*(void *)(a1 + 32)];
}

id sub_100007034(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) currentUIContext];
  [v2 setSmartCardLAContext:0];

  id v3 = [*(id *)(a1 + 32) currentUIContext];
  [v3 setPkinitIdentity:0];

  unsigned int v4 = [*(id *)(a1 + 32) currentUIContext];
  [v4 setPkinitPersistientRef:0];

  v5 = [*(id *)(a1 + 32) currentUIContext];
  [v5 setCertificateTokenID:0];

  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"NO_IDENTITY_SELECTED_TEXT" value:&stru_100014860 table:0];
  id v8 = [*(id *)(a1 + 32) identityLabel];
  [v8 setText:v7];

  unsigned int v9 = *(void **)(a1 + 32);
  return [v9 performSelector:"updateIdentityMenu"];
}

id sub_100007140(uint64_t a1)
{
  [*(id *)(a1 + 32) selectCertForAuth:*(void *)(a1 + 40)];
  UIAccessibilityNotifications v2 = *(void **)(a1 + 32);
  return [v2 performSelector:"updateIdentityMenu"];
}

void sub_1000075C4(uint64_t a1)
{
  id v3 = +[UIColor colorWithWhite:0.0 alpha:0.4];
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v3];
}

id sub_100007708(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelCurrentOperation];
}

void sub_1000077C4(uint64_t a1)
{
  UIAccessibilityNotifications v2 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007858;
  block[3] = &unk_100014358;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_100007858(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) process];
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) currentUIContext];
  [v3 attemptKerberosWithContext:v2 andDelegate:*(void *)(a1 + 32)];
}

uint64_t sub_100007CB0(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = sub_100005D28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User consent granted: %d", (uint8_t *)v10, 8u);
  }

  v5 = [*(id *)(a1 + 32) currentUIContext];
  id v6 = [v5 extensionUserData];
  [v6 setUserSetKeychainChoice:1];

  id v7 = [*(id *)(a1 + 32) currentUIContext];
  id v8 = [v7 extensionUserData];
  [v8 setUseKeychain:a2];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100008104(uint64_t a1)
{
  [*(id *)(a1 + 32) enableElementAutoFocusForAccessibility];
  UIAccessibilityNotifications v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t sub_10000814C(uint64_t a1)
{
  [*(id *)(a1 + 32) enableElementAutoFocusForAccessibility];
  UIAccessibilityNotifications v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

id sub_100008194(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableElementAutoFocusForAccessibility];
}

void sub_1000082EC(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64) + 20.0;
  id v3 = [*(id *)(a1 + 32) bottomConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

void sub_1000084A0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) bottomConstraint];
  [v2 setConstant:20.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

void sub_100008C54(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008CCC;
  block[3] = &unk_100014358;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100008CCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) showPasswordViewController];
}

void sub_100008D6C(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  double v2 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008E00;
  v6[3] = &unk_100014450;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 showAuthControllerForContext:v4 completion:v6];
}

void sub_100008E00(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) keychainLAContext];

    if (!v3)
    {
      id v4 = objc_alloc_init((Class)LAContext);
      [*(id *)(a1 + 32) setKeychainLAContext:v4];

      uint64_t v5 = [*(id *)(a1 + 32) keychainLAContext];
      [v5 setOptionCallerName:@"Kerberos"];
    }
    id v6 = [*(id *)(a1 + 32) extensionData];
    id v7 = [v6 customUsernameLabel];

    if (![v7 length])
    {
      uint64_t v8 = +[NSBundle mainBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"ACTIVE_DIRECTORY_PRODUCTNAME" value:&stru_100014860 table:0];

      id v7 = (void *)v9;
    }
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"LAPOLICY_REASON" value:&stru_100014860 table:0];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);

    v13 = [*(id *)(a1 + 40) passwordTextField];
    [v13 setHidden:1];

    id v14 = [*(id *)(a1 + 40) identityLabel];
    [v14 setHidden:1];

    v15 = [*(id *)(a1 + 32) keychainLAContext];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000902C;
    v18[3] = &unk_100014450;
    int8x16_t v17 = *(int8x16_t *)(a1 + 32);
    id v16 = (id)v17.i64[0];
    int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
    [v15 evaluatePolicy:2 localizedReason:v12 reply:v18];
  }
}

void sub_10000902C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = sub_100005D28();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000D49C(a1, v7);
    }

    [*(id *)(a1 + 40) setAttemptedToGetCredsFromKeychain:1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000921C;
    block[3] = &unk_100014358;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v8 = dispatch_time(0, 650000000);
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009224;
    v12[3] = &unk_100014358;
    v12[4] = *(void *)(a1 + 32);
    dispatch_after(v8, v9, v12);
  }
  else
  {
    if (v5)
    {
      id v10 = sub_100005D28();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000D52C();
      }
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009294;
    v11[3] = &unk_100014358;
    v11[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

id sub_10000921C(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableUI];
}

void sub_100009224(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) process];
  double v2 = [*(id *)(a1 + 32) currentUIContext];
  [v3 attemptKerberosWithContext:v2 andDelegate:*(void *)(a1 + 32)];
}

id sub_100009294(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelClicked:0];
}

id sub_100009338(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000093AC;
  v4[3] = &unk_100014628;
  v4[4] = v2;
  return [v2 showAuthControllerForContext:v1 completion:v4];
}

void sub_1000093AC(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000942C;
    block[3] = &unk_100014358;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000942C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) usernameTextField];
  [v1 becomeFirstResponder];
}

id sub_100009508(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000957C;
  v4[3] = &unk_100014628;
  v4[4] = v2;
  return [v2 showAuthControllerForContext:v1 completion:v4];
}

void sub_10000957C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) currentUIContext];
    id v3 = [v7 pkinitPersistientRef];
    if (v3)
    {
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) currentUIContext];
      id v5 = [v4 extensionUserData];
      unsigned __int8 v6 = [v5 useSmartCard];

      if ((v6 & 1) == 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000968C;
        block[3] = &unk_100014358;
        block[4] = *(void *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

void sub_10000968C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) passwordTextField];
  [v1 becomeFirstResponder];
}

void sub_1000098E0(uint64_t a1)
{
  double v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"LOGIN_ERROR" value:&stru_100014860 table:0];
  id v4 = +[UIAlertController alertControllerWithTitle:v3 message:*(void *)(a1 + 32) preferredStyle:1];

  id v5 = +[NSBundle mainBundle];
  unsigned __int8 v6 = [v5 localizedStringForKey:@"OK_TEXT" value:&stru_100014860 table:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009AB4;
  v11[3] = &unk_100014650;
  id v7 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  dispatch_time_t v8 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v11];
  [v4 addAction:v8];

  uint64_t v9 = *(void **)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_100009AF4;
  v10[3] = &unk_100014358;
  v10[4] = v9;
  [v9 presentViewController:v4 animated:1 completion:v10];
}

id sub_100009AB4(uint64_t a1)
{
  [*(id *)(a1 + 32) enableElementAutoFocusForAccessibility];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 showAuthControllerForContext:v3 completion:v4];
}

id sub_100009AF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableElementAutoFocusForAccessibility];
}

id sub_100009AFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) length];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    unsigned int v4 = [v3 viewControllerIsShowing];
    id v5 = *(void **)(a1 + 56);
    if (v4)
    {
      unsigned __int8 v6 = (uint64_t (*)(void))v5[2];
      return (id)v6();
    }
    dispatch_time_t v8 = objc_retainBlock(v5);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    uint64_t v3 = *(void **)(a1 + 40);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  return [v3 showAuthControllerForContext:v11 completion:v12];
}

void sub_100009E68(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009F5C;
    block[3] = &unk_1000146C8;
    unsigned __int8 v6 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v9 = v6;
    id v10 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v7 = sub_100005D28();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000D608();
    }
  }
}

uint64_t sub_100009F5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentUIContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) prefillWithCredentialsFromKeychainIfPossible];
  if ([*(id *)(a1 + 40) smartCardNeedsInsert])
  {
    [*(id *)(a1 + 32) setPromptForSmartCard:1];
    [*(id *)(a1 + 32) promptForSmartcardWithContext:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setViewControllerIsShowing:1];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10000A854(uint64_t a1)
{
  id v1 = *(unsigned char **)(a1 + 32);
  if (v1[24])
  {
    UIAccessibilityNotifications v2 = UIAccessibilityScreenChangedNotification;
    id v3 = [v1 spinner];
    UIAccessibilityPostNotification(v2, v3);
  }
}

id sub_10000AB64(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) passwordViewController];
  [v2 removeFromParentViewController];

  id v3 = *(void **)(a1 + 32);
  return [v3 setPasswordViewController:0];
}

void sub_10000B2D0(id a1)
{
  qword_10001AAC8 = (uint64_t)os_log_create("com.apple.AppSSO", "KerberosLoginViewController");
  _objc_release_x1();
}

void sub_10000B580(uint64_t a1)
{
  UIAccessibilityNotifications v2 = sub_10000B7C8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000D6A0(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) requestedOperation];
  if (!v3
    || (unsigned int v4 = (void *)v3,
        [*(id *)(a1 + 32) requestedOperation],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:&stru_100014860],
        v5,
        v4,
        v6))
  {
    if (![*(id *)(a1 + 40) requestContainsNegotiateChallenge:*(void *)(a1 + 32)])
    {
      [*(id *)(a1 + 32) doNotHandle];
      return;
    }
    goto LABEL_11;
  }
  id v7 = [*(id *)(a1 + 32) requestedOperation];
  if ([v7 isEqualToString:kSOKerberosOperationLogin]) {
    goto LABEL_10;
  }
  dispatch_time_t v8 = [*(id *)(a1 + 32) requestedOperation];
  if ([v8 isEqualToString:kSOKerberosOperationGetCredentialUUID])
  {

LABEL_10:
LABEL_11:
    [*(id *)(a1 + 40) handleKerberosOperations:*(void *)(a1 + 32)];
    return;
  }
  id v9 = [*(id *)(a1 + 32) requestedOperation];
  uint64_t v18 = 0;
  int8x16_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v10 = (void *)qword_10001AAE0;
  uint64_t v21 = qword_10001AAE0;
  if (!qword_10001AAE0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000CB04;
    v17[3] = &unk_100014780;
    v17[4] = &v18;
    sub_10000CB04((uint64_t)v17);
    id v10 = (void *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v10)
  {
    id v16 = (_Unwind_Exception *)sub_10000D67C();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v16);
  }
  unsigned __int8 v11 = [v9 isEqualToString:*v10];

  if (v11) {
    goto LABEL_11;
  }
  uint64_t v12 = [*(id *)(a1 + 32) requestedOperation];
  unsigned int v13 = [v12 isEqualToString:kSOKerberosOperationChangePassword];

  id v14 = *(void **)(a1 + 40);
  if (v13)
  {
    [v14 handleChangePasswordWithRequest:*(void *)(a1 + 32)];
  }
  else
  {
    v15 = [v14 process];
    [v15 beginAuthorizationWithRequest:*(void *)(a1 + 32)];
  }
}

id sub_10000B7C8()
{
  if (qword_10001AAD0 != -1) {
    dispatch_once(&qword_10001AAD0, &stru_100014758);
  }
  v0 = (void *)qword_10001AAD8;
  return v0;
}

void sub_10000BA10(uint64_t a1)
{
  UIAccessibilityNotifications v2 = [*(id *)(a1 + 32) extensionData];
  unsigned __int8 v3 = [v2 allowPasswordChange];

  if ((v3 & 1) == 0)
  {
    unsigned int v4 = *(void **)(a1 + 32);
    id v5 = +[NSError passwordChangeNotEnabled];
    [v4 completeRequestWithError:v5];
  }
  unsigned int v6 = [[KerberosPasswordViewController alloc] initWithNibName:@"KerberosPasswordViewController" bundle:0];
  [*(id *)(a1 + 40) setPasswordViewController:v6];

  id v7 = [*(id *)(a1 + 40) process];
  dispatch_time_t v8 = [*(id *)(a1 + 40) passwordViewController];
  [v8 setProcess:v7];

  id v9 = [*(id *)(a1 + 40) keychainHelper];
  id v10 = [*(id *)(a1 + 40) passwordViewController];
  [v10 setKeychainHelper:v9];

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) passwordViewController];
  [v12 setCurrentUIContext:v11];

  unsigned int v13 = *(void **)(a1 + 40);
  id v14 = [v13 passwordViewController];
  [v13 addChildViewController:v14];

  v15 = [*(id *)(a1 + 40) passwordViewController];
  [v15 handleKerberosOperation:*(void *)(a1 + 32) withMessage:0];

  id v16 = sub_10000B7C8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10000D900(v16);
  }
}

void sub_10000C68C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) process];
    [v4 attemptKerberosWithContext:*(void *)(a1 + 40) andDelegate:*(void *)(a1 + 32)];
  }
  else
  {
    unsigned __int8 v3 = sub_10000B7C8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000D944(v3);
    }

    [*(id *)(a1 + 40) cancelRequest];
  }
}

void sub_10000C724(uint64_t a1)
{
  [*(id *)(a1 + 32) createLoginViewControllerWithContext:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) loginViewController];
  [v2 handleResult:*(void *)(a1 + 56) context:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void sub_10000CAC0(id a1)
{
  qword_10001AAD8 = (uint64_t)os_log_create("com.apple.AppSSO", "KerberosBaseViewController");
  _objc_release_x1();
}

void *sub_10000CB04(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_10001AAE8)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10000CC44;
    v5[4] = &unk_1000147B8;
    v5[5] = v5;
    long long v6 = off_1000147A0;
    uint64_t v7 = 0;
    qword_10001AAE8 = _sl_dlopen();
    unsigned __int8 v3 = (void *)v5[0];
    id v2 = (void *)qword_10001AAE8;
    if (qword_10001AAE8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      unsigned __int8 v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_10001AAE8;
LABEL_5:
  uint64_t result = dlsym(v2, "ASAuthorizationOperationLogin");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001AAE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000CC44()
{
  uint64_t result = _sl_dlopen();
  qword_10001AAE8 = result;
  return result;
}

void sub_10000CCB8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000CE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CE50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetUI];
}

void sub_10000CF68(id a1)
{
  qword_10001AAF8 = (uint64_t)os_log_create("com.apple.AppSSO", "KerberosViewController");
  _objc_release_x1();
}

void sub_10000CFAC()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "viewDidLoad", v2, v3, v4, v5, v6);
}

void sub_10000CFE0()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "starting password change", v2, v3, v4, v5, v6);
}

void sub_10000D014()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "not starting password change", v2, v3, v4, v5, v6);
}

void sub_10000D048()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "change password clicked", v2, v3, v4, v5, v6);
}

void sub_10000D07C()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "cancel clicked", v2, v3, v4, v5, v6);
}

void sub_10000D0B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "******************* handleKerberosOperation: %@, message: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000D138()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "begin changeADPassword", v2, v3, v4, v5, v6);
}

void sub_10000D16C()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "end changeADPassword", v2, v3, v4, v5, v6);
}

void sub_10000D1A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error changing password: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000D218()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "login clicked", v2, v3, v4, v5, v6);
}

void sub_10000D24C()
{
  sub_10000B314();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "******************* handleKerberosOperation: %@, message: %@", v2, 0x16u);
}

void sub_10000D2D0()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "Resetting UI", v2, v3, v4, v5, v6);
}

void sub_10000D304()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "cancelCurrentOperation", v2, v3, v4, v5, v6);
}

void sub_10000D338()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "password required", v2, v3, v4, v5, v6);
}

void sub_10000D36C()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "principal name required", v2, v3, v4, v5, v6);
}

void sub_10000D3A0()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "SmartCard not inserted", v2, v3, v4, v5, v6);
}

void sub_10000D3D4()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "user presence required", v2, v3, v4, v5, v6);
}

void sub_10000D408(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 servicePrincipalName];
  sub_10000B314();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Server Principal Unknown: %@", v4, 0xCu);
}

void sub_10000D49C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315394;
  uint64_t v4 = "-[KerberosLoginViewController promptForCertificateWithContext:]_block_invoke_3";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s MDM cert LA success on %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000D52C()
{
  sub_10000B314();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error from LAContext: %@", v1, 0xCu);
}

void sub_10000D5A0()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "LoginViewController is already showing", v2, v3, v4, v5, v6);
}

void sub_10000D5D4()
{
  sub_1000056C8();
  sub_1000056AC((void *)&_mh_execute_header, v0, v1, "showAuthControllerForContext", v2, v3, v4, v5, v6);
}

void sub_10000D608()
{
  sub_10000B314();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error presenting LoginViewController: %{public}@", v1, 0xCu);
}

uint64_t sub_10000D67C()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10000D6A0(v0);
}

void sub_10000D6A0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 realm];
  uint8_t v6 = [*v3 requestedOperation];
  int v7 = 138543874;
  dispatch_time_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "beginAuthorizationWithRequest: %{public}@, realm: %{public}@, operation: %{public}@", (uint8_t *)&v7, 0x20u);
}

void sub_10000D778(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "cancelAuthorizationWithRequest: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000D7F0(void *a1)
{
  uint64_t v1 = [a1 realm];
  sub_10000CCB8((void *)&_mh_execute_header, v2, v3, "handleKerberosOperations: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10000D878(void *a1)
{
  uint64_t v1 = [a1 realm];
  sub_10000CCB8((void *)&_mh_execute_header, v2, v3, "handleChangePasswordWithRequest: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10000D900(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "******************* end handleChangePasswordWithRequest", v1, 2u);
}

void sub_10000D944(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "LA Context failed", v1, 2u);
}

void sub_10000D988(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 loginViewController];
  uint64_t v5 = [a2 passwordViewController];
  int v6 = 136315906;
  uint64_t v7 = "-[KerberosViewController resetUI]";
  __int16 v8 = 2112;
  __int16 v9 = v4;
  __int16 v10 = 2112;
  __int16 v11 = v5;
  __int16 v12 = 2112;
  unsigned int v13 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s login: %@, password: %@ on %@", (uint8_t *)&v6, 0x2Au);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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
  return _objc_msgSendSuper2(a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend__disableUI(void *a1, const char *a2, ...)
{
  return [a1 _disableUI];
}

id objc_msgSend__enableUI(void *a1, const char *a2, ...)
{
  return [a1 _enableUI];
}

id objc_msgSend__formIsValid(void *a1, const char *a2, ...)
{
  return [a1 _formIsValid];
}

id objc_msgSend__hasFilledRequiredFormFields(void *a1, const char *a2, ...)
{
  return [a1 _hasFilledRequiredFormFields];
}

id objc_msgSend__hasVerifiedNewPassword(void *a1, const char *a2, ...)
{
  return [a1 _hasVerifiedNewPassword];
}

id objc_msgSend__updateLoginButtonState(void *a1, const char *a2, ...)
{
  return [a1 _updateLoginButtonState];
}

id objc_msgSend_allowAutomaticLogin(void *a1, const char *a2, ...)
{
  return [a1 allowAutomaticLogin];
}

id objc_msgSend_allowPasswordChange(void *a1, const char *a2, ...)
{
  return [a1 allowPasswordChange];
}

id objc_msgSend_allowPlatformSSOAuthFallback(void *a1, const char *a2, ...)
{
  return [a1 allowPlatformSSOAuthFallback];
}

id objc_msgSend_attemptedToGetCredsFromKeychain(void *a1, const char *a2, ...)
{
  return [a1 attemptedToGetCredsFromKeychain];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_availableSmartCards(void *a1, const char *a2, ...)
{
  return [a1 availableSmartCards];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 bottomConstraint];
}

id objc_msgSend_buildIdentityMenu(void *a1, const char *a2, ...)
{
  return [a1 buildIdentityMenu];
}

id objc_msgSend_buildOptionsMenu(void *a1, const char *a2, ...)
{
  return [a1 buildOptionsMenu];
}

id objc_msgSend_callerLocalizedName(void *a1, const char *a2, ...)
{
  return [a1 callerLocalizedName];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancelRequest(void *a1, const char *a2, ...)
{
  return [a1 cancelRequest];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_certName(void *a1, const char *a2, ...)
{
  return [a1 certName];
}

id objc_msgSend_certificateTokenID(void *a1, const char *a2, ...)
{
  return [a1 certificateTokenID];
}

id objc_msgSend_certificateUUID(void *a1, const char *a2, ...)
{
  return [a1 certificateUUID];
}

id objc_msgSend_changeADPassword(void *a1, const char *a2, ...)
{
  return [a1 changeADPassword];
}

id objc_msgSend_changePasswordButton(void *a1, const char *a2, ...)
{
  return [a1 changePasswordButton];
}

id objc_msgSend_changePasswordClicked(void *a1, const char *a2, ...)
{
  return [a1 changePasswordClicked];
}

id objc_msgSend_changeUIForCertIdentity(void *a1, const char *a2, ...)
{
  return [a1 changeUIForCertIdentity];
}

id objc_msgSend_changedPassword(void *a1, const char *a2, ...)
{
  return [a1 changedPassword];
}

id objc_msgSend_changedPasswordAgainTextField(void *a1, const char *a2, ...)
{
  return [a1 changedPasswordAgainTextField];
}

id objc_msgSend_changedPasswordTextField(void *a1, const char *a2, ...)
{
  return [a1 changedPasswordTextField];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_completeRequest(void *a1, const char *a2, ...)
{
  return [a1 completeRequest];
}

id objc_msgSend_completeRequestWithDoNotHandle(void *a1, const char *a2, ...)
{
  return [a1 completeRequestWithDoNotHandle];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credsCameFromKeychain(void *a1, const char *a2, ...)
{
  return [a1 credsCameFromKeychain];
}

id objc_msgSend_currentUIContext(void *a1, const char *a2, ...)
{
  return [a1 currentUIContext];
}

id objc_msgSend_customUsernameLabel(void *a1, const char *a2, ...)
{
  return [a1 customUsernameLabel];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_didChangePassword(void *a1, const char *a2, ...)
{
  return [a1 didChangePassword];
}

id objc_msgSend_didClose(void *a1, const char *a2, ...)
{
  return [a1 didClose];
}

id objc_msgSend_disableUI(void *a1, const char *a2, ...)
{
  return [a1 disableUI];
}

id objc_msgSend_doNotHandle(void *a1, const char *a2, ...)
{
  return [a1 doNotHandle];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableElementAutoFocusForAccessibility(void *a1, const char *a2, ...)
{
  return [a1 enableElementAutoFocusForAccessibility];
}

id objc_msgSend_enableUI(void *a1, const char *a2, ...)
{
  return [a1 enableUI];
}

id objc_msgSend_extensionData(void *a1, const char *a2, ...)
{
  return [a1 extensionData];
}

id objc_msgSend_extensionUserData(void *a1, const char *a2, ...)
{
  return [a1 extensionUserData];
}

id objc_msgSend_helpText(void *a1, const char *a2, ...)
{
  return [a1 helpText];
}

id objc_msgSend_httpHeaders(void *a1, const char *a2, ...)
{
  return [a1 httpHeaders];
}

id objc_msgSend_identityButton(void *a1, const char *a2, ...)
{
  return [a1 identityButton];
}

id objc_msgSend_identityLabel(void *a1, const char *a2, ...)
{
  return [a1 identityLabel];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_keychainHelper(void *a1, const char *a2, ...)
{
  return [a1 keychainHelper];
}

id objc_msgSend_keychainLAContext(void *a1, const char *a2, ...)
{
  return [a1 keychainLAContext];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_loginButton(void *a1, const char *a2, ...)
{
  return [a1 loginButton];
}

id objc_msgSend_loginStackView(void *a1, const char *a2, ...)
{
  return [a1 loginStackView];
}

id objc_msgSend_loginViewController(void *a1, const char *a2, ...)
{
  return [a1 loginViewController];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_optionsButton(void *a1, const char *a2, ...)
{
  return [a1 optionsButton];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_passwordChangeNotEnabled(void *a1, const char *a2, ...)
{
  return [a1 passwordChangeNotEnabled];
}

id objc_msgSend_passwordTextField(void *a1, const char *a2, ...)
{
  return [a1 passwordTextField];
}

id objc_msgSend_passwordViewController(void *a1, const char *a2, ...)
{
  return [a1 passwordViewController];
}

id objc_msgSend_persistientRef(void *a1, const char *a2, ...)
{
  return [a1 persistientRef];
}

id objc_msgSend_pkinitPersistientRef(void *a1, const char *a2, ...)
{
  return [a1 pkinitPersistientRef];
}

id objc_msgSend_prefillWithCredentialsFromKeychainIfPossible(void *a1, const char *a2, ...)
{
  return [a1 prefillWithCredentialsFromKeychainIfPossible];
}

id objc_msgSend_prepareContextForLogin(void *a1, const char *a2, ...)
{
  return [a1 prepareContextForLogin];
}

id objc_msgSend_presentPendingAlertIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 presentPendingAlertIfNeeded];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return [a1 realm];
}

id objc_msgSend_realmLabel(void *a1, const char *a2, ...)
{
  return [a1 realmLabel];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestedOperation(void *a1, const char *a2, ...)
{
  return [a1 requestedOperation];
}

id objc_msgSend_requireUserPresence(void *a1, const char *a2, ...)
{
  return [a1 requireUserPresence];
}

id objc_msgSend_resetUI(void *a1, const char *a2, ...)
{
  return [a1 resetUI];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_returnCredentialOnly(void *a1, const char *a2, ...)
{
  return [a1 returnCredentialOnly];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_servicePrincipalName(void *a1, const char *a2, ...)
{
  return [a1 servicePrincipalName];
}

id objc_msgSend_shouldPromptUserForConsentToPerformFutureAutomaticLogins(void *a1, const char *a2, ...)
{
  return [a1 shouldPromptUserForConsentToPerformFutureAutomaticLogins];
}

id objc_msgSend_signInTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 signInTitleLabel];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smartCardLAContext(void *a1, const char *a2, ...)
{
  return [a1 smartCardLAContext];
}

id objc_msgSend_smartCardNeedsInsert(void *a1, const char *a2, ...)
{
  return [a1 smartCardNeedsInsert];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_tokenID(void *a1, const char *a2, ...)
{
  return [a1 tokenID];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_upn(void *a1, const char *a2, ...)
{
  return [a1 upn];
}

id objc_msgSend_useKeychain(void *a1, const char *a2, ...)
{
  return [a1 useKeychain];
}

id objc_msgSend_usePlatformSSOTGT(void *a1, const char *a2, ...)
{
  return [a1 usePlatformSSOTGT];
}

id objc_msgSend_useSmartCard(void *a1, const char *a2, ...)
{
  return [a1 useSmartCard];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userName(void *a1, const char *a2, ...)
{
  return [a1 userName];
}

id objc_msgSend_userNameIsReadOnly(void *a1, const char *a2, ...)
{
  return [a1 userNameIsReadOnly];
}

id objc_msgSend_userNamePasswordView(void *a1, const char *a2, ...)
{
  return [a1 userNamePasswordView];
}

id objc_msgSend_userPrincipalName(void *a1, const char *a2, ...)
{
  return [a1 userPrincipalName];
}

id objc_msgSend_userSetKeychainChoice(void *a1, const char *a2, ...)
{
  return [a1 userSetKeychainChoice];
}

id objc_msgSend_usernameTextField(void *a1, const char *a2, ...)
{
  return [a1 usernameTextField];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerIsShowing(void *a1, const char *a2, ...)
{
  return [a1 viewControllerIsShowing];
}

id objc_msgSend_watcher(void *a1, const char *a2, ...)
{
  return [a1 watcher];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}