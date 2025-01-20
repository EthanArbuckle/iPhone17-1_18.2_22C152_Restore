void sub_100005390(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1000053C0(uint64_t a1)
{
  if (+[CDPUtilities canEnableMultiUserManatee])
  {
    v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v7 = 141558274;
      uint64_t v8 = 1752392040;
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MUM - setting up context with altDSID %{mask.hash}@", (uint8_t *)&v7, 0x16u);
    }

    uint64_t v4 = +[CDPContext contextForAccountWithAltDSID:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = +[CDPContext contextForPrimaryAccount];
  }
  v5 = (void *)v4;
  v6 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v5 setFollowUpType:v6];

  [*(id *)(a1 + 48) _setupWithContext:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_100005504(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupEncryptionFlowContextWithAltDSID:*(void *)(a1 + 40)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void sub_100005550(uint64_t a1)
{
  id v3 = +[CDPContext contextForPrimaryAccount];
  v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  [v3 setFollowUpType:v2];

  [*(id *)(a1 + 40) _setupSOSCompatibilityModeEnabledFlowWithContext:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000055E0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = _CDPLogSystem();
  int v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 72);
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 1024;
      int v13 = 1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CDPFollowUpViewController: Successfully completed displaying AuthKit Server UI with urlKey=%@, sucess=%{BOOL}d, error=%@", (uint8_t *)&v10, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000A064(a1, (uint64_t)v5, v7);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
  }
}

void sub_100005708(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[9];
  id v5 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v2 _presentAKServerUIWithUrlKey:v4 altDSID:v3 itemID:v5 completion:*(void *)(a1 + 56)];
}

void sub_100005784(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000585C;
  block[3] = &unk_1000104E8;
  uint64_t v13 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v12 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10000585C(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 64);
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2 || *(void *)(a1 + 32))
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A130(v3, a1, v4);
    }

    uint64_t v2 = *v3;
  }
  if (v2 != 1)
  {
    [*(id *)(a1 + 40) _setupEncryptionFlowContextWithAltDSID:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _setupWithContext:*(void *)(*(void *)(a1 + 40) + 88)];
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000A0FC();
  }

  [*(id *)(a1 + 40) _clearADPUpsellFollowUpWithAKController];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void sub_100006168(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allHeaderFields];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"X-Apple-AK-Action"];

  if (v4 && [v4 isEqual:@"delete"])
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000A500();
    }

    [*(id *)(a1 + 32) _clearFollowUpWithAKControllerWithItemID:*(void *)(a1 + 40)];
  }
}

void sub_1000062A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000A534();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _clearLocalSecretCreateFollowUp];
  }
  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000067F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100006818(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

id sub_100006820(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

id sub_100006828(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

id sub_100006830(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _clearRecoveryKeyRepairFollowUp];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 finishProcessing];
}

void sub_100006870(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2)
  {
    [WeakRetained _clearSOSCompatibilityModeFollowUp];
    id WeakRetained = v4;
  }
  [WeakRetained finishProcessing];
}

void sub_1000068CC(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    id v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000A59C(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  [WeakRetained finishProcessing];
}

void sub_1000069F4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _makeADPUpsellLandingPageViewedEventWithCDPContext:*(void *)(*(void *)(a1 + 32) + 88)];
  v1 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v1 sendEvent:v2];
}

void sub_100006B78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10000A6E8();
  }

  [*(id *)(a1 + 32) setAdpUpsellLandingScreen:v6];
  [*(id *)(a1 + 32) setAdpUpsellErrorPresenter:v5];

  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [v8 setNavigationBarHidden:0];
  [v8 setModalInPresentation:1];
  [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:*(void *)(a1 + 40)];
}

void sub_1000077F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000080B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000828C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) accountStore];
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008374;
    v9[3] = &unk_100010560;
    v9[4] = *(void *)(a1 + 32);
    [v6 saveVerifiedAccount:v7 withCompletionHandler:v9];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000A820();
    }

    [*(id *)(a1 + 32) finishProcessing];
  }
}

void sub_100008374(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v7;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saved verified account with success: %@, error: %{public}@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000084B4;
  v10[3] = &unk_100010560;
  v10[4] = v8;
  [v9 finishCyrusFlowAfterTermsAgreementWithContext:v10];
}

id sub_1000084B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _secureTermsTearDownWithUpdatedSecret:a2 error:a3];
}

void sub_100008728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008750(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000881C;
  block[3] = &unk_100010628;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
}

void sub_10000881C(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000A974(a1);
  }
}

void sub_100008B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008B24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000AAD8();
  }

  [WeakRetained finishProcessing];
}

void sub_100008EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008ED4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000AC00(a1, v5, v6);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008FB4;
    block[3] = &unk_100010678;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
  }
}

void sub_100008FB4(uint64_t a1)
{
  id v3 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"AAUIWebAccessChangeNotification" object:WeakRetained];
}

void sub_100009110(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) adpUpsellErrorPresenter];
  [v2 showErrorAlertTitled:*(void *)(a1 + 40) message:*(void *)(a1 + 48)];
}

id sub_100009640()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100015168;
  uint64_t v7 = qword_100015168;
  if (!qword_100015168)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009E58;
    v3[3] = &unk_1000106C8;
    v3[4] = &v4;
    sub_100009E58((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009970(uint64_t a1)
{
  id v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000AF2C(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

Class sub_100009C38(uint64_t a1)
{
  sub_100009C90();
  Class result = objc_getClass("AAUISpinnerViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000B088();
  }
  qword_100015150 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009C90()
{
  v1[0] = 0;
  if (!qword_100015158)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100009D8C;
    v1[4] = &unk_100010700;
    v1[5] = v1;
    long long v2 = off_1000106E8;
    uint64_t v3 = 0;
    qword_100015158 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100015158)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100009D8C()
{
  uint64_t result = _sl_dlopen();
  qword_100015158 = result;
  return result;
}

Class sub_100009E00(uint64_t a1)
{
  sub_100009C90();
  Class result = objc_getClass("AAUIGenericTermsRemoteUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000B0B0();
  }
  qword_100015160 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100009E58(uint64_t a1)
{
  sub_100009C90();
  Class result = objc_getClass("AAUIGrandSlamRemoteUIPresenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000B0D8();
  }
  qword_100015168 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009EB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100009ECC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009EF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100009F14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100009F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009F74(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_100009F94()
{
  sub_100009F3C();
  sub_100009F74((void *)&_mh_execute_header, v0, v1, "CDPFollowUpViewController: follow up item synchronized=%{BOOL}d, syncError=%@");
}

void sub_100009FFC()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "CDPFollowUpViewController: AKFollowUpSynchronizer failed to synchronize with an error: %@. Let's do a best effort retry synchronize item with AKFollowUpProvider since AuthKit sometimes post CFU on behalf of other clients (i.e. ADP Upsell CFU)", v2, v3, v4, v5, v6);
}

void sub_10000A064(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CDPFollowUpViewController: Failed to display AuthKit Server UI with urlKey=%@, error=%@", (uint8_t *)&v4, 0x16u);
}

void sub_10000A0FC()
{
  sub_100009F30();
  sub_100009F58((void *)&_mh_execute_header, v0, v1, "ADP CFU is present but ADP is already turned on. This is not expected since in most cases IdMS should have sent tearDown signal. Clearing the CFU on the client side...", v2, v3, v4, v5, v6);
}

void sub_10000A130(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:*a1];
  sub_100009EE8();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Issue getting Walrus status (got %@) with error: %@", v6, 0x16u);
}

void sub_10000A1F0(id *a1)
{
  uint64_t v2 = [*a1 telemetryFlowID];
  uint64_t v9 = [*a1 telemetryDeviceSessionID];
  sub_100009EF4((void *)&_mh_execute_header, v3, v4, "%s:ADPUpsell CFU setting telemetryFlowId: %@ and deviceSessionId: %@", v5, v6, v7, v8, 2u);
}

void sub_10000A2B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A330(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A3A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A420(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A498()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "CDPFollowUpViewController: Asking Authkit to present Server UI with urlKey=%@", v2, v3, v4, v5, v6);
}

void sub_10000A500()
{
  sub_100009F30();
  sub_100009F14((void *)&_mh_execute_header, v0, v1, "Got delete in X-Apple-AK-Action. Tearing down the ADU CFU...", v2, v3, v4, v5, v6);
}

void sub_10000A534()
{
  sub_100009EE8();
  sub_100009ECC((void *)&_mh_execute_header, v0, v1, "Failed to create local secret, error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A59C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A614(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 88) telemetryFlowID];
  uint64_t v9 = [*(id *)(a1 + 88) telemetryDeviceSessionID];
  sub_100009EF4((void *)&_mh_execute_header, v3, v4, "Using context %@ with flow ID %{public}@ and device session ID %{public}@ for ADP upsell.", v5, v6, v7, v8, 2u);
}

void sub_10000A6E8()
{
  sub_100009F30();
  sub_100009F14((void *)&_mh_execute_header, v0, v1, "Presenting upsell landing screen and registering for Walrus state change notifications", v2, v3, v4, v5, v6);
}

void sub_10000A71C()
{
  sub_100009EE8();
  sub_100009ECC((void *)&_mh_execute_header, v0, v1, "Failed to clear local secret create followup with error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A784()
{
  sub_100009EE8();
  sub_100009ECC((void *)&_mh_execute_header, v0, v1, "Error encountered while attempting to update escrow records following terms agreement: %@", v2, v3, v4, v5, v6);
}

void sub_10000A7EC()
{
  sub_100009F30();
  sub_100009F58((void *)&_mh_execute_header, v0, v1, "Failed to find account for terms agreement!", v2, v3, v4, v5, v6);
}

void sub_10000A820()
{
  sub_100009EE8();
  sub_100009ECC((void *)&_mh_execute_header, v0, v1, "Failed to update properties for account, error: %@", v2, v3, v4, v5, v6);
}

void sub_10000A888(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CDPFollowUpViewController upsellViewModelDidRequestBeginEnablementFlowWithContext:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Upsell landing screen should have been populated. Exiting.", (uint8_t *)&v1, 0xCu);
}

void sub_10000A90C()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "Loading Remote UI request, %@", v2, v3, v4, v5, v6);
}

void sub_10000A974(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v11 = [*(id *)(a1 + 32) debugDescription];
  sub_100009EF4((void *)&_mh_execute_header, v5, v6, "%@: Request %@ completed with error: %{private}@", v7, v8, v9, v10, 3u);
}

void sub_10000AA54(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[CDPFollowUpViewController upsellViewModelDidRequestCFUDismissalWithContext:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Upsell landing screen should have been populated. Exiting.", (uint8_t *)&v1, 0xCu);
}

void sub_10000AAD8()
{
  sub_100009F3C();
  sub_100009F74((void *)&_mh_execute_header, v0, v1, "Finished presenting ADP upsell teardown action with success: %d, error: %@");
}

void sub_10000AB40()
{
  sub_100009F30();
  sub_100009F58((void *)&_mh_execute_header, v0, v1, "Value for web access enablement was missing, or settings are nil.", v2, v3, v4, v5, v6);
}

void sub_10000AB74(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 BOOLValue];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Web access enablement state is %d", (uint8_t *)v3, 8u);
}

void sub_10000AC00(uint64_t a1, void *a2, NSObject *a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint8_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [a2 localizedDescription];
  int v9 = 138412547;
  uint64_t v10 = v7;
  __int16 v11 = 2113;
  CFStringRef v12 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: Done saving web access state with error: %{private}@", (uint8_t *)&v9, 0x16u);
}

void sub_10000ACD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AD50()
{
  sub_100009F30();
  sub_100009F14((void *)&_mh_execute_header, v0, v1, "does not respondToSelector, not passing in cdpContext - custodian events will not be triggered for adpUpsell", v2, v3, v4, v5, v6);
}

void sub_10000AD84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ADF4()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "Creating new grand slam presenter with presenting screen: %@", v2, v3, v4, v5, v6);
}

void sub_10000AE5C()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "Done loading Remote UI request with response: %@", v2, v3, v4, v5, v6);
}

void sub_10000AEC4()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "%@: RemoteUI dismiss flow.", v2, v3, v4, v5, v6);
}

void sub_10000AF2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AF9C()
{
  sub_100009EE8();
  sub_100009EB0((void *)&_mh_execute_header, v0, v1, "%@: RemoteUI did handle the cancel button, calling finishProcessing...", v2, v3, v4, v5, v6);
}

void sub_10000B004()
{
  sub_100009EE8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%@: RemoteUI did handle button: %@.", v2, 0x16u);
}

void sub_10000B088()
{
  uint64_t v0 = abort_report_np();
  sub_10000B0B0(v0);
}

void sub_10000B0B0()
{
  uint64_t v0 = abort_report_np();
  sub_10000B0D8(v0);
}

void sub_10000B0D8()
{
}

uint64_t CDPLocalizedString()
{
  return _CDPLocalizedString();
}

uint64_t CDPLocalizedStringInTable()
{
  return _CDPLocalizedStringInTable();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CDPLogSystem()
{
  return __CDPLogSystem();
}

uint64_t _CDPStateError()
{
  return __CDPStateError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__beginLocalSecretCreateActionFlow(void *a1, const char *a2, ...)
{
  return [a1 _beginLocalSecretCreateActionFlow];
}

id objc_msgSend__beginWalrusEnablementFromUpsellCFU(void *a1, const char *a2, ...)
{
  return [a1 _beginWalrusEnablementFromUpsellCFU];
}

id objc_msgSend__clearADPUpsellFollowUpWithAKController(void *a1, const char *a2, ...)
{
  return [a1 _clearADPUpsellFollowUpWithAKController];
}

id objc_msgSend__clearLocalSecretCreateFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _clearLocalSecretCreateFollowUp];
}

id objc_msgSend__clearRecoveryKeyRepairFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _clearRecoveryKeyRepairFollowUp];
}

id objc_msgSend__clearSOSCompatibilityModeFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _clearSOSCompatibilityModeFollowUp];
}

id objc_msgSend__clearSecureTermsFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _clearSecureTermsFollowUp];
}

id objc_msgSend__followupProvider(void *a1, const char *a2, ...)
{
  return [a1 _followupProvider];
}

id objc_msgSend__navController(void *a1, const char *a2, ...)
{
  return [a1 _navController];
}

id objc_msgSend__showADPUpsellNetworkError(void *a1, const char *a2, ...)
{
  return [a1 _showADPUpsellNetworkError];
}

id objc_msgSend__showGenericTermsUI(void *a1, const char *a2, ...)
{
  return [a1 _showGenericTermsUI];
}

id objc_msgSend__spinnerViewController(void *a1, const char *a2, ...)
{
  return [a1 _spinnerViewController];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_adpUpsellErrorPresenter(void *a1, const char *a2, ...)
{
  return [a1 adpUpsellErrorPresenter];
}

id objc_msgSend_adpUpsellLandingScreen(void *a1, const char *a2, ...)
{
  return [a1 adpUpsellLandingScreen];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_canEnableMultiUserManatee(void *a1, const char *a2, ...)
{
  return [a1 canEnableMultiUserManatee];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contextForADPUpsell(void *a1, const char *a2, ...)
{
  return [a1 contextForADPUpsell];
}

id objc_msgSend_contextForConfirmExistingSecret(void *a1, const char *a2, ...)
{
  return [a1 contextForConfirmExistingSecret];
}

id objc_msgSend_contextForEDPStateRepair(void *a1, const char *a2, ...)
{
  return [a1 contextForEDPStateRepair];
}

id objc_msgSend_contextForOfflinePasscodeChange(void *a1, const char *a2, ...)
{
  return [a1 contextForOfflinePasscodeChange];
}

id objc_msgSend_contextForPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 contextForPrimaryAccount];
}

id objc_msgSend_contextForRecoveryKeyRepair(void *a1, const char *a2, ...)
{
  return [a1 contextForRecoveryKeyRepair];
}

id objc_msgSend_contextForSOSCompatibilityMode(void *a1, const char *a2, ...)
{
  return [a1 contextForSOSCompatibilityMode];
}

id objc_msgSend_contextForSecureTerms(void *a1, const char *a2, ...)
{
  return [a1 contextForSecureTerms];
}

id objc_msgSend_contextForStateRepair(void *a1, const char *a2, ...)
{
  return [a1 contextForStateRepair];
}

id objc_msgSend_dataRecoveryServiceDisableURL(void *a1, const char *a2, ...)
{
  return [a1 dataRecoveryServiceDisableURL];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_hasFullCDPSupport(void *a1, const char *a2, ...)
{
  return [a1 hasFullCDPSupport];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isGuitarfishEnabled(void *a1, const char *a2, ...)
{
  return [a1 isGuitarfishEnabled];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_primaryAccountAltDSID(void *a1, const char *a2, ...)
{
  return [a1 primaryAccountAltDSID];
}

id objc_msgSend_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryAppleAccount];
}

id objc_msgSend_primaryAuthKitAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryAuthKitAccount];
}

id objc_msgSend_rtcAnalyticsReporter(void *a1, const char *a2, ...)
{
  return [a1 rtcAnalyticsReporter];
}

id objc_msgSend_sharedAuthKitFollowupProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedAuthKitFollowupProvider];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return [a1 sharedBag];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_telemetryDeviceSessionID(void *a1, const char *a2, ...)
{
  return [a1 telemetryDeviceSessionID];
}

id objc_msgSend_telemetryFlowID(void *a1, const char *a2, ...)
{
  return [a1 telemetryFlowID];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_walrusStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walrusStatusWithCompletion:");
}