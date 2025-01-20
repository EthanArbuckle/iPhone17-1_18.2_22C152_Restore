id sub_100002C9C(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)AAUIFollowUpExtensionViewController;
  return objc_msgSendSuper2(&v2, "finishProcessing");
}

void sub_100002DCC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
  }
  else
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100009530();
    }

    [*(id *)(a1 + 32) finishProcessing];
  }
}

id sub_1000032A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRecoveryKeyGenerationFlow];
}

id sub_1000032A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRecoveryContactGenerationFlowForWalrusUser:0];
}

id sub_1000032B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginTurnOffRecoveryKeyFlow];
}

id sub_1000032BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

id sub_100003630(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRecoveryKeyGenerationFlow];
}

id sub_100003638(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginRecoveryContactGenerationFlowForWalrusUser:1];
}

id sub_100003644(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000037A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000037BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100009600();
      }
LABEL_12:

      [v7 finishProcessing];
      goto LABEL_13;
    }
    if ((a2 & 1) == 0)
    {
      v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000095CC();
      }
      goto LABEL_12;
    }
    [WeakRetained _dismissRecoveryKeyMismatchCFU];
  }
  else
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100009598();
    }
  }
LABEL_13:
}

void sub_100003A08(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RK turning off flow invocation success: %@, error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100003BC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100003BDC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      CFStringRef v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10000969C();
      }
LABEL_12:

      [v7 finishProcessing];
      goto LABEL_13;
    }
    if ((a2 & 1) == 0)
    {
      CFStringRef v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100009668();
      }
      goto LABEL_12;
    }
    [WeakRetained _dismissRecoveryKeyMismatchCFU];
  }
  else
  {
    __int16 v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100009598();
    }
  }
LABEL_13:
}

void sub_100003D80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100003DA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    CFStringRef v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100009704();
    }
  }
  [WeakRetained finishProcessing];
}

id sub_100003FEC(uint64_t a1, char a2)
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_renewCredentialsForFollowUpItem starting...", buf, 2u);
  }

  id v5 = _AAUILogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing renew credentials follow up...", v13, 2u);
    }

    unsigned int v7 = +[AAUICDPHelper isEDPEligible];
    CFStringRef v8 = _AAUILogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "about to dismiss CDPEDP followup...", v12, 2u);
      }

      return [*(id *)(a1 + 32) _continueDismissingRenewCredentialsFollowUpForCDPEDP];
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "about to dismiss CDP followup, EDP ineligible...", v11, 2u);
      }

      return [*(id *)(a1 + 32) _continueDismissingRenewCredentialsFollowUpForCDP];
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not dismissing renew credentials follow up...", v14, 2u);
    }

    return [*(id *)(a1 + 32) finishProcessing];
  }
}

void sub_100004344(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension dismissed renewCredentials follow up with success: %@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000048E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000048F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004908(uint64_t a1)
{
}

void sub_100004910(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A3C;
  block[3] = &unk_100010550;
  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v9;
  id v16 = v10;
  id v17 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 64);
  id v18 = v6;
  id v19 = *(id *)(a1 + 56);
  id v11 = v6;
  id v12 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004A3C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = +[AAUICDPHelper helperWithPresenter:*(void *)(a1 + 40)];
    id v3 = [objc_alloc((Class)CDPContext) initWithAuthenticationResults:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 48) uniqueIdentifier];
    [v3 setFollowUpType:v4];

    id v5 = [v2 cdpStateControllerWithContext:v3];
    id v17 = 0;
    unsigned int v6 = [v5 shouldPerformRepairWithOptionForceFetch:1 error:&v17];
    id v7 = v17;
    int v8 = _AAUILogSystem();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138477827;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current state requires repair. Starting repair...: %{private}@", buf, 0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100004D0C;
      v14[3] = &unk_100010528;
      id v15 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 80);
      [v5 repairCloudDataProtectionStateWithCompletion:v14];
    }
    else
    {
      if (v9)
      {
        v13 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138477827;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully renewed credentials for account: %{private}@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
  }
  else
  {
    __int16 v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000990C();
    }

    if (*(void *)(a1 + 72))
    {
      id v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Renew Credentials attempt was for proxied device. We gave it a shot, dismissing followup.", buf, 2u);
      }

      id v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    }
    else
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    }
    v12();
  }
}

void sub_100004D0C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = _AAUILogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138477827;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully renewed credentials with repair for account: %{private}@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100009978();
    }

    BOOL v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void sub_1000051F8(uint64_t a1, char a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing embargo recovery follow up...", buf, 2u);
    }

    unsigned int v6 = [*(id *)(a1 + 32) _followUpController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005324;
    v7[3] = &unk_100010500;
    v7[4] = *(void *)(a1 + 32);
    [v6 dismissFollowUpWithIdentifier:AAFollowUpIdentifierCustodianEmbargo completion:v7];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not dismissing embargo recovery follow up...", buf, 2u);
    }

    [*(id *)(a1 + 32) finishProcessing];
  }
}

void sub_100005324(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension dismissed embargo recovery follow up with success: %@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000055F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFStringRef v7 = _AAUILogSystem();
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found Custodian recovery info for session sent in followUp. starting iForgot flow", v9, 2u);
    }

    [*(id *)(a1 + 32) _beginCustodianAccountRecoveryFlowWithInfo:v5 sessionID:*(void *)(a1 + 40) altDSID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100009A48();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1000058C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000058D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (v5)
  {
    id v9 = objc_alloc_init((Class)AIDAMutableServiceContext);
    [v9 setAuthenticationResults:v5];
    [v9 setViewController:*(void *)(a1 + 32)];
    [v9 setCdpUiProvider:*(void *)(a1 + 32)];
    [v9 setOperationUIPermissions:1];
    __int16 v10 = [v9 signInContexts];
    id v11 = [v10 mutableCopy];
    id v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = (id)objc_opt_new();
    }
    id v15 = v13;

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_1000048F8;
    v29 = sub_100004908;
    id v16 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
    id v17 = [v9 viewController];
    id v30 = [v16 initWithPresentingViewController:v17];

    [v15 setObject:v26[5] forKeyedSubscript:AIDAServiceTypeCloud];
    id v18 = objc_alloc((Class)AIDAServiceOwnersManager);
    id v19 = +[ACAccountStore defaultStore];
    id v20 = [v18 initWithAccountStore:v19];

    id v21 = [v9 copy];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005B88;
    v22[3] = &unk_1000105F0;
    v24 = &v25;
    id v23 = *(id *)(a1 + 40);
    [v20 signInToAllServicesInBackgroundUsingContext:v21 completion:v22];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100009AB0();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100005B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005B88(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005C34;
  v6[3] = &unk_1000105C8;
  id v7 = *(id *)(a1 + 32);
  char v8 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_100005C34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

id sub_100005DCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_100005F08(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100009B80();
    }

    if ([*(id *)(*(void *)(a1 + 32) + 80) isDTOGatingEnabled])
    {
      uint64_t v4 = _AAUILogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_100009B4C();
      }

      id v5 = *(void **)(a1 + 32);
      id v6 = (void *)v5[10];
      id v7 = [v5 presentingViewController];
      char v8 = [v6 makeRatchetContextWithPresentationContext:v7 DTOContextType:1];

      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = *(void **)(v9 + 80);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000611C;
      v15[3] = &unk_100010420;
      v15[4] = v9;
      id v16 = *(id *)(a1 + 40);
      [v10 shouldAllowOpForContext:v8 completion:v15];
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100006208;
      v13[3] = &unk_100010668;
      id v11 = *(void **)(a1 + 40);
      v13[4] = *(void *)(a1 + 32);
      id v14 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006258;
    block[3] = &unk_1000103F8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000611C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100009BB4();
  }

  if (a2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000061FC;
    v8[3] = &unk_100010668;
    id v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
}

id sub_1000061FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueSettingupCustodianForFollowUpItem:*(void *)(a1 + 40)];
}

id sub_100006208(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100009C1C();
  }

  return [*(id *)(a1 + 32) _continueSettingupCustodianForFollowUpItem:*(void *)(a1 + 40)];
}

id sub_100006258(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100009C50();
  }

  return [*(id *)(a1 + 32) _displayCustodianAddNotAllowedAlert];
}

id sub_100006560(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_100006618(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100009C84();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _dismissRecoveryKeyMismatchRepairCFU];
  }
}

void sub_100006728(uint64_t a1, uint64_t a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5) {
      sub_100009D64();
    }

    [*(id *)(a1 + 40) dismissFollowUpWithIdentifier:*(void *)(a1 + 32) completion:&stru_1000106B0];
  }
  else
  {
    if (v5) {
      sub_100009CEC();
    }
  }
}

void sub_1000067B0(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100009DDC();
    }
  }
}

void sub_100006928(uint64_t a1, int a2)
{
  if (!a2)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006C5C;
    v12[3] = &unk_1000103F8;
    v12[4] = *(void *)(a1 + 32);
    id v11 = v12;
LABEL_10:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    return;
  }
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100009B80();
  }

  if (![*(id *)(*(void *)(a1 + 32) + 80) isDTOGatingEnabled])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006C08;
    block[3] = &unk_100010700;
    void block[4] = *(void *)(a1 + 32);
    char v14 = *(unsigned char *)(a1 + 40);
    id v11 = block;
    goto LABEL_10;
  }
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100009B4C();
  }

  BOOL v5 = *(void **)(a1 + 32);
  id v6 = (void *)v5[10];
  id v7 = [v5 presentingViewController];
  char v8 = [v6 makeRatchetContextWithPresentationContext:v7 DTOContextType:1];

  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(v9 + 80);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006B20;
  v15[3] = &unk_100010728;
  v15[4] = v9;
  char v16 = *(unsigned char *)(a1 + 40);
  [v10 shouldAllowOpForContext:v8 completion:v15];
}

void sub_100006B20(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100009BB4();
  }

  if (a2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006BF8;
    v7[3] = &unk_100010700;
    v7[4] = *(void *)(a1 + 32);
    char v8 = *(unsigned char *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

id sub_100006BF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continueRecoveryContactGenerationFlowForWalrusUser:*(unsigned __int8 *)(a1 + 40)];
}

id sub_100006C08(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100009C1C();
  }

  return [*(id *)(a1 + 32) _continueRecoveryContactGenerationFlowForWalrusUser:*(unsigned __int8 *)(a1 + 40)];
}

id sub_100006C5C(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100009C50();
  }

  return [*(id *)(a1 + 32) _displayCustodianAddNotAllowedAlert];
}

void sub_100007134(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2114;
    __int16 v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RK generation flow invocation success: %@, error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_1000072C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100009600();
    }

    [*(id *)(a1 + 32) finishProcessing];
  }
  else
  {
    CFStringRef v6 = [*(id *)(a1 + 32) _followUpController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000073B4;
    v8[3] = &unk_100010420;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = 0;
    uint64_t v10 = v7;
    [v6 dismissFollowUpWithIdentifier:AAFollowUpIdentifierCustodianWalrusRemoved completion:v8];
  }
}

id sub_1000073B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100009E44();
    }
  }
  return [*(id *)(a1 + 40) finishProcessing];
}

id sub_10000758C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000076BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _followUpController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007758;
  v3[3] = &unk_100010500;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissFollowUpWithIdentifier:AAFollowUpIdentifierBeneficiaryIneligible completion:v3];
}

id sub_100007758(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

id sub_10000791C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

uint64_t sub_100007CE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007FB8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStore];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008048;
  v3[3] = &unk_1000107C0;
  v3[4] = *(void *)(a1 + 40);
  objc_msgSend(v2, "aa_appleAccountsWithCompletion:", v3);
}

void sub_100008048(uint64_t a1, void *a2)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      CFStringRef v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "aa_needsToVerifyTerms") & 1) != 0
        || (objc_msgSend(v8, "aa_hasOptionalTerms") & 1) != 0)
      {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found pending account, posting verify terms: %@", buf, 0xCu);
    }

    id v11 = [*(id *)(a1 + 32) _followUpController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000082F4;
    v14[3] = &unk_100010500;
    void v14[4] = *(void *)(a1 + 32);
    [v11 postFollowUpWithIdentifier:AAFollowUpIdentifierVerifyTerms forAccount:v9 userInfo:0 completion:v14];
  }
  else
  {
LABEL_10:

LABEL_15:
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No pending accounts, dismissing verify terms...", buf, 2u);
    }

    id v9 = [*(id *)(a1 + 32) _followUpController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000083DC;
    v13[3] = &unk_100010500;
    v13[4] = *(void *)(a1 + 32);
    [v9 dismissFollowUpWithIdentifier:AAFollowUpIdentifierVerifyTerms completion:v13];
  }
}

void sub_1000082F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension posted follow up with success: %@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000083DC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension dismissed verify terms follow up with success: %@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000084C4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 40) accountStore];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000085BC;
    v9[3] = &unk_100010798;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v6 saveVerifiedAccount:v7 withCompletionHandler:v9];
  }
  else
  {
    int v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100009EE4();
    }

    [*(id *)(a1 + 32) finishProcessing];
  }
}

void sub_1000085BC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AAUIFollowUpExtension saved verified account with success: %@, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008C60(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  if (v4)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000A050();
    }
  }
  uint64_t v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "UCRT healing completed with success - [%@]", (uint8_t *)&v8, 0xCu);
  }
}

void sub_100008D60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    CFStringRef v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138477827;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully verified credentials for account %{private}@!", (uint8_t *)&v11, 0xCu);
    }

    int v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    CFStringRef v9 = _AAUILogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10) {
        sub_10000A0EC();
      }
    }
    else if (v10)
    {
      sub_10000A0B8();
    }

    int v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v8();
}

uint64_t sub_1000091F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000947C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009498(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000094C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100009510(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_100009530()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Sign in controller said not to continue, error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100009598()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "AAUIFollowUpExtensionViewController was deallocated", v2, v3, v4, v5, v6);
}

void sub_1000095CC()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Failed to set up Recovery Key, but did not receive an error. Please file a sysdiagnose.", v2, v3, v4, v5, v6);
}

void sub_100009600()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error occurred while setting up Recovery Key: %@", v2, v3, v4, v5, v6);
}

void sub_100009668()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Failed to delete Recovery Key, but did not receive an error. Please file a sysdiagnose.", v2, v3, v4, v5, v6);
}

void sub_10000969C()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error occurred while deleting Recovery Key: %@", v2, v3, v4, v5, v6);
}

void sub_100009704()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error occurred while dismissing recovery key mismatch followup: %@", v2, v3, v4, v5, v6);
}

void sub_10000976C()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "We are missing an altDSID, unable to show generic terms UI.", v2, v3, v4, v5, v6);
}

void sub_1000097A0()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Experienced error while attempting to clear CDP+EDP CFU in AAUI: %@", v2, v3, v4, v5, v6);
}

void sub_100009808()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Experienced error while attempting to clear CDP+EDP CFU in CDPFollowUpController: %@", v2, v3, v4, v5, v6);
}

void sub_100009870()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Missing accountIdentifier on renewCredentials follow up, tearing down!", v2, v3, v4, v5, v6);
}

void sub_1000098A4()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Failed to find account for identifier (%{private}@), tearing down!", v2, v3, v4, v5, v6);
}

void sub_10000990C()
{
  sub_100009504();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Authentication returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100009978()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "CDP Repair returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000099E0()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Missing altDSID on embargo recovery follow up, tearing down!", v2, v3, v4, v5, v6);
}

void sub_100009A14()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Missing recovery session id on embargo recovery follow up, tearing down!", v2, v3, v4, v5, v6);
}

void sub_100009A48()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Missing recovery token for embargo recovery with error: %@, tearing down followUp", v2, v3, v4, v5, v6);
}

void sub_100009AB0()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Authentication returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100009B18()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "appleAccount found nil, returning without setting up the custodian", v2, v3, v4, v5, v6);
}

void sub_100009B4C()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "DTO enabled, IdMS says RC add is allowed, proceeding to ratchet auth", v2, v3, v4, v5, v6);
}

void sub_100009B80()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "IdMS says RC add is allowed on this device, proceeding to check if DTO is enabled", v2, v3, v4, v5, v6);
}

void sub_100009BB4()
{
  sub_1000094E8();
  sub_100009510((void *)&_mh_execute_header, v0, v1, "Ratchet auth returned with success: %d, error: %@,");
}

void sub_100009C1C()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "DTO disabled, proceeding with usual flow without auth", v2, v3, v4, v5, v6);
}

void sub_100009C50()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "IdMS says RC add is not allowed on weak device, proceeding to show error alert", v2, v3, v4, v5, v6);
}

void sub_100009C84()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error deleting RK from all Systems: %@", v2, v3, v4, v5, v6);
}

void sub_100009CEC()
{
  sub_100009504();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No previous %@ CFU exists. Nothing to dismiss", v1, 0xCu);
}

void sub_100009D64()
{
  sub_100009504();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "CFU %@ exists. Dismissing...", v1, 0xCu);
}

void sub_100009DDC()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error occurred while dismissing the followup - %@", v2, v3, v4, v5, v6);
}

void sub_100009E44()
{
  sub_100009504();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Error occurred while dismissing custodian walrus removed followup: %@", v2, v3, v4, v5, v6);
}

void sub_100009EB0()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Failed to find account for terms agreement!", v2, v3, v4, v5, v6);
}

void sub_100009EE4()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Failed to update properties for account, error: %@", v2, v3, v4, v5, v6);
}

void sub_100009F4C()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Missing authentication PET, bailing!", v2, v3, v4, v5, v6);
}

void sub_100009F80()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "AuthKit authentication has no accountIdentifier, bailing!", v2, v3, v4, v5, v6);
}

void sub_100009FB4()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "Could not find Apple account for identifier: %{private}@, bailing!", v2, v3, v4, v5, v6);
}

void sub_10000A01C()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "AuthKit authentication resulted in error, bailing!", v2, v3, v4, v5, v6);
}

void sub_10000A050()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "UCRT healing could not be completed: Error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A0B8()
{
  sub_1000094B4();
  sub_100009498((void *)&_mh_execute_header, v0, v1, "Unexpected response from verify credentials, bailing!", v2, v3, v4, v5, v6);
}

void sub_10000A0EC()
{
  sub_100009504();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to verify credentials for account %{private}@, error: %{public}@", v2, 0x16u);
}

void sub_10000A174()
{
  sub_1000094DC();
  sub_10000947C((void *)&_mh_execute_header, v0, v1, "AAUIFollowUpExtensionCleanup: Failed to fetch follow up items with error %@", v2, v3, v4, v5, v6);
}

void sub_10000A1DC()
{
  sub_1000094B4();
  sub_1000094C0((void *)&_mh_execute_header, v0, v1, "AAUIFollowUpExtensionCleanup: Running cleanup for credential renewal.", v2, v3, v4, v5, v6);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
}

uint64_t _AAUILogSystem()
{
  return __AAUILogSystem();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__beginRecoveryKeyGenerationFlow(void *a1, const char *a2, ...)
{
  return [a1 _beginRecoveryKeyGenerationFlow];
}

id objc_msgSend__beginRecoveryKeyGenerationFlowOnClient(void *a1, const char *a2, ...)
{
  return [a1 _beginRecoveryKeyGenerationFlowOnClient];
}

id objc_msgSend__beginTurnOffRecoveryKeyFlowOnClient(void *a1, const char *a2, ...)
{
  return [a1 _beginTurnOffRecoveryKeyFlowOnClient];
}

id objc_msgSend__beginVerifyRecoveryKeyFlow(void *a1, const char *a2, ...)
{
  return [a1 _beginVerifyRecoveryKeyFlow];
}

id objc_msgSend__continueDismissingRenewCredentialsFollowUpForCDP(void *a1, const char *a2, ...)
{
  return [a1 _continueDismissingRenewCredentialsFollowUpForCDP];
}

id objc_msgSend__continueDismissingRenewCredentialsFollowUpForCDPEDP(void *a1, const char *a2, ...)
{
  return [a1 _continueDismissingRenewCredentialsFollowUpForCDPEDP];
}

id objc_msgSend__dismissRecoveryKeyMismatchCFU(void *a1, const char *a2, ...)
{
  return [a1 _dismissRecoveryKeyMismatchCFU];
}

id objc_msgSend__dismissRecoveryKeyMismatchRepairCFU(void *a1, const char *a2, ...)
{
  return [a1 _dismissRecoveryKeyMismatchRepairCFU];
}

id objc_msgSend__displayCustodianAddNotAllowedAlert(void *a1, const char *a2, ...)
{
  return [a1 _displayCustodianAddNotAllowedAlert];
}

id objc_msgSend__followUpController(void *a1, const char *a2, ...)
{
  return [a1 _followUpController];
}

id objc_msgSend__presentSignInController(void *a1, const char *a2, ...)
{
  return [a1 _presentSignInController];
}

id objc_msgSend__setupActivityIndicator(void *a1, const char *a2, ...)
{
  return [a1 _setupActivityIndicator];
}

id objc_msgSend__shouldContinueRecoveryKeyMismatchRepair(void *a1, const char *a2, ...)
{
  return [a1 _shouldContinueRecoveryKeyMismatchRepair];
}

id objc_msgSend__showGenericTermsUI(void *a1, const char *a2, ...)
{
  return [a1 _showGenericTermsUI];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cdpStateControllerForPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 cdpStateControllerForPrimaryAccount];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return [a1 clientInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contextForCDPEDPStateRepair(void *a1, const char *a2, ...)
{
  return [a1 contextForCDPEDPStateRepair];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_custodianRecoveryToken(void *a1, const char *a2, ...)
{
  return [a1 custodianRecoveryToken];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isDTOGatingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDTOGatingEnabled];
}

id objc_msgSend_isEDPEligible(void *a1, const char *a2, ...)
{
  return [a1 isEDPEligible];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_makeCustodianAddOpNotAllowedAlert(void *a1, const char *a2, ...)
{
  return [a1 makeCustodianAddOpNotAllowedAlert];
}

id objc_msgSend_makeGenericRatchetFailedAlert(void *a1, const char *a2, ...)
{
  return [a1 makeGenericRatchetFailedAlert];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_normalizedDSID(void *a1, const char *a2, ...)
{
  return [a1 normalizedDSID];
}

id objc_msgSend_ownerAppleID(void *a1, const char *a2, ...)
{
  return [a1 ownerAppleID];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_proxiedDevice(void *a1, const char *a2, ...)
{
  return [a1 proxiedDevice];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return [a1 sharedBag];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signInContexts(void *a1, const char *a2, ...)
{
  return [a1 signInContexts];
}

id objc_msgSend_startWithoutFirstTimeSetup(void *a1, const char *a2, ...)
{
  return [a1 startWithoutFirstTimeSetup];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
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

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}