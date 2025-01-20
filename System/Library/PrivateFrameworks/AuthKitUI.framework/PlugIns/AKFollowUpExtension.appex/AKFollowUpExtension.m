void sub_100003134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003158(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v6 = [v11 actions];
  if ([v6 count])
  {
    v7 = [v11 informativeText];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = v7 == 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v8 = a1 + 32;
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
  }

  if (*(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24)) {
    *a4 = 1;
  }
}

void sub_1000032E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100007DD8((uint64_t)v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000036BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

uint64_t sub_1000036DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003F84(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_100003FDC(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) identifier];
  unsigned int v5 = [v4 isEqualToString:@"continuity_push_followup_notification"];

  if (v5) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v7();
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000040F0;
    v10[3] = &unk_10000C418;
    id v11 = *(id *)(a1 + 56);
    char v12 = 1;
    [v8 _handleAuthKitAction:@"open" forItem:v9 completion:v10];
  }
}

uint64_t sub_1000040F0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_100004108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000411C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004158(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    unsigned int v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100008024(a1, v5, v6, v7, v8, v9, v10, v11);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000042F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000080FC(a1);
    }
  }
}

uint64_t sub_100004650(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004AE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004AF8(uint64_t a1)
{
}

void sub_100004B00(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void sub_100004B78(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000083CC(a2);
  }

  uint64_t v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  if (![v7 isEqualToString:AKFollowUpVerifyPrimaryEmailIdentifier]) {
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 40) isEqualToString:AKActionTeardown])
  {

LABEL_7:
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100008398();
    }

    notify_post((const char *)[AKEmailVerificationCompletedNotificationKey UTF8String]);
    uint64_t v7 = +[AKAccountManager sharedInstance];
    [v7 updateVerifiedEmail:1 forAccountWithAltDSID:*(void *)(a1 + 48)];
LABEL_10:

    goto LABEL_11;
  }
  unsigned __int8 v8 = [*(id *)(a1 + 40) isEqualToString:AKActionDelete];

  if (v8) {
    goto LABEL_7;
  }
LABEL_11:
  if (!v5
    && (([*(id *)(a1 + 40) isEqualToString:AKActionTeardown] & 1) != 0
     || [*(id *)(a1 + 40) isEqualToString:AKActionDelete]))
  {
    [*(id *)(a1 + 56) _fetchUserInformationIfNeededForAltDSID:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void sub_100004FD4(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(a1[4] + 8), a2);
  [*(id *)(a1[4] + 8) setBagUrlKey:*(void *)(a1[4] + 40)];
  uint64_t v7 = (void *)a1[5];
  if (v7)
  {
    unsigned __int8 v8 = [v7 uniqueIdentifier];
    unsigned int v9 = [v8 hasPrefix:@"edp"];

    if (v9) {
      [*(id *)(a1[4] + 8) setAttachEDPToken:1];
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1000051CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished showing server UI: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) finishProcessing];
}

void sub_1000053D0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) _updateAccountUsernameWithHarvestedData:v8];
  unsigned int v10 = [*(id *)(*(void *)(a1 + 32) + 8) isResponseFinalForHSA2ServerFlow:v7];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005554;
    v16[3] = &unk_10000C5A8;
    v16[4] = v11;
    id v17 = v7;
    id v18 = *(id *)(a1 + 40);
    [v11 _startCDPRepairWithAdditionalData:v8 completion:v16];

    char v12 = v17;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005694;
    v13[3] = &unk_10000C4B8;
    id v15 = *(id *)(a1 + 40);
    id v14 = v9;
    [v11 _handleFinalServerResponse:v7 completion:v13];

    char v12 = v15;
  }
}

void sub_100005554(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = +[AKCDPFactory followUpRepairContext];
    [v6 setRepairType:2];
    id v7 = +[AKCDPFactory followUpController];
    [v7 postFollowUpWithContext:v6 error:0];

    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000084AC();
    }
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005680;
  v13[3] = &unk_10000C4B8;
  id v11 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v11;
  id v12 = v5;
  [v9 _handleFinalServerResponse:v10 completion:v13];
}

uint64_t sub_100005680(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100005694(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000056A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (([*(id *)(*(void *)(a1 + 32) + 8) isAuthenticationRequired:v7] & 1) != 0
    || ([v9 userInfo],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:@"statusCode"],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isEqual:&off_10000C980],
        v11,
        v10,
        v12))
  {
    v13 = *(void **)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100005810;
    v17[3] = &unk_10000C5F8;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    id v19 = v14;
    v17[4] = v15;
    id v18 = v16;
    [v13 _reauthenticateContext:v17];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_100005810(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _beginServerUIRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void sub_100005BCC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || [*(id *)(*(void *)(a1 + 32) + 8) isAuthenticationRequired:v7])
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if ([*(id *)(*(void *)(a1 + 32) + 8) isResponseActionable:v7])
    {
      id v11 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
      [v11 _updateWithValuesFromContext:*(void *)(*(void *)(a1 + 32) + 16)];
      [v11 setAnticipateEscrowAttempt:1];
      unsigned int v12 = *(void **)(*(void *)(a1 + 32) + 24);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005D74;
      v13[3] = &unk_10000C648;
      id v16 = *(id *)(a1 + 40);
      id v14 = v7;
      id v15 = v8;
      [v12 updateStateWithExternalAuthenticationResponse:v14 forContext:v11 completion:v13];

      goto LABEL_5;
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
LABEL_5:
}

uint64_t sub_100005D74(void *a1, int a2, uint64_t a3)
{
  uint64_t v4 = a1[6];
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, a1[4], a1[5], a3);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  }
}

void sub_100005F50(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100008514();
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:AKFollowUpAltDSIDKey];

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
  id v6 = +[AKCDPFactory contextForAltDSID:v4];
  id v7 = v6;
  if (v6)
  {
    [v6 setPassword:v5];
    id v8 = +[AKCDPFactory stateControllerWithContext:v7];
    id v9 = +[AKCDPFactory cdpUIControllerWithPresentingViewController:*(void *)(a1 + 32)];
    [v8 setUiProvider:v9];
    [v8 repairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 48)];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    id v8 = +[NSError ak_errorWithCode:-7114];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

id sub_100006210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _refreshServerUIDelegateWithParentContext:*(void *)(*(void *)(a1 + 32) + 16) item:*(void *)(*(void *)(a1 + 32) + 48) completion:*(void *)(a1 + 40)];
  }
}

void sub_100006378(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000085E4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_10000857C();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000066BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000066E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006710(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000672C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_100006758()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_100010B58;
  uint64_t v5 = qword_100010B58;
  if (!qword_100010B58)
  {
    long long v6 = *(_OWORD *)off_10000C6E0;
    long long v7 = *(_OWORD *)&off_10000C6F0;
    v3[3] = _sl_dlopen();
    qword_100010B58 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100006868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006880(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010B58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006910()
{
  uint64_t v0 = sub_100006758();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_10000696C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B60;
  uint64_t v7 = qword_100010B60;
  if (!qword_100010B60)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006A50;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_100006A50((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100006A50(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLFollowUpAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000864C();
  }
  qword_100010B60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100006AA8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B68;
  uint64_t v7 = qword_100010B68;
  if (!qword_100010B68)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006B8C;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_100006B8C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100006B8C(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLFollowUpController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100008674();
  }
  qword_100010B68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100006BE4()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B70;
  uint64_t v7 = qword_100010B70;
  if (!qword_100010B70)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006CC8;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_100006CC8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100006CC8(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLFollowUpItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000869C();
  }
  qword_100010B70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100006D20()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B78;
  uint64_t v7 = qword_100010B78;
  if (!qword_100010B78)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006E04;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_100006E04((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100006E04(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLFollowUpNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000086C4();
  }
  qword_100010B78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100006E5C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B80;
  uint64_t v7 = qword_100010B80;
  if (!qword_100010B80)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006F40;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_100006F40((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100006F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100006F40(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLHSA2LoginNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000086EC();
  }
  qword_100010B80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100006F98()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100010B88;
  uint64_t v7 = qword_100010B88;
  if (!qword_100010B88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000707C;
    v3[3] = &unk_10000C730;
    v3[4] = &v4;
    sub_10000707C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100007064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000707C(uint64_t a1)
{
  sub_100006910();
  Class result = objc_getClass("FLHSA2PasswordResetNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100008714();
  }
  qword_100010B88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000070D4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010B90;
  uint64_t v6 = qword_100010B90;
  if (!qword_100010B90)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLGroupIdentifierAccount");
    qword_100010B90 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000071AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000071C4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLGroupIdentifierAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010B90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007214()
{
  uint64_t v0 = (void **)sub_1000070D4();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_100007248()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010B98;
  uint64_t v6 = qword_100010B98;
  if (!qword_100010B98)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionForce");
    qword_100010B98 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007338(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionForce");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010B98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007388()
{
  uint64_t v0 = (void **)sub_100007248();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_1000073BC()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BA0;
  uint64_t v6 = qword_100010BA0;
  if (!qword_100010BA0)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionSpringboardAlert");
    qword_100010BA0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000074AC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionSpringboardAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000074FC()
{
  uint64_t v0 = (void **)sub_1000073BC();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_100007530()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BA8;
  uint64_t v6 = qword_100010BA8;
  if (!qword_100010BA8)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionSpringboardAlertActionOnly");
    qword_100010BA8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007620(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionSpringboardAlertActionOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007670()
{
  uint64_t v0 = (void **)sub_100007530();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_1000076A4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BB0;
  uint64_t v6 = qword_100010BB0;
  if (!qword_100010BB0)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLHSA2ActionChangePassword");
    qword_100010BB0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000777C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007794(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLHSA2ActionChangePassword");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000077E4()
{
  uint64_t v0 = (void **)sub_1000076A4();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_100007818()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BB8;
  uint64_t v6 = qword_100010BB8;
  if (!qword_100010BB8)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionExtensionForNotification");
    qword_100010BB8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000078F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007908(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionExtensionForNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007958()
{
  uint64_t v0 = (void **)sub_100007818();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_10000798C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BC0;
  uint64_t v6 = qword_100010BC0;
  if (!qword_100010BC0)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionExtensionActions");
    qword_100010BC0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007A7C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionExtensionActions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007ACC()
{
  uint64_t v0 = (void **)sub_10000798C();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

uint64_t sub_100007B00()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_100010BC8;
  uint64_t v6 = qword_100010BC8;
  if (!qword_100010BC8)
  {
    id v1 = (void *)sub_100006910();
    v4[3] = (uint64_t)dlsym(v1, "FLNotificationOptionBannerAlert");
    qword_100010BC8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007BF0(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100006910();
  Class result = dlsym(v2, "FLNotificationOptionBannerAlert");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010BC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100007C40()
{
  uint64_t v0 = (void **)sub_100007B00();
  if (!v0) {
    sub_10000873C();
  }
  id v1 = *v0;

  return v1;
}

void sub_100007C74(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AKFollowUpSynchronizer: Client provided nil account, defaulting to the primary iCloud account", v1, 2u);
}

void sub_100007CB8(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 username];
  uint64_t v5 = +[AKAccountManager sharedInstance];
  uint64_t v6 = [v5 altDSIDForAccount:a1];
  int v7 = 138478083;
  id v8 = v4;
  __int16 v9 = 2113;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Sync for account: %{private}@ - %{private}@", (uint8_t *)&v7, 0x16u);
}

void sub_100007D94(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch items, falling back to sync", v1, 2u);
}

void sub_100007DD8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to update follow up synchronization date: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100007E50()
{
  sub_1000066D8();
  sub_1000066BC((void *)&_mh_execute_header, v0, v1, "Failed to synchronize follow ups with error %@", v2, v3, v4, v5, v6);
}

void sub_100007EB8()
{
  sub_10000674C();
  sub_100006710((void *)&_mh_execute_header, v0, v1, "Action suppressed, unknown parameters", v2, v3, v4, v5, v6);
}

void sub_100007EEC()
{
  sub_1000066D8();
  sub_1000066E4((void *)&_mh_execute_header, v0, v1, "Redirecting follow up action to url :%@", v2, v3, v4, v5, v6);
}

void sub_100007F54()
{
  sub_1000066D8();
  sub_1000066BC((void *)&_mh_execute_header, v0, v1, "Failed to find urlKey %@ in the bag, cannot launch server UI.", v2, v3, v4, v5, v6);
}

void sub_100007FBC(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Processing Item: %@ - %@", buf, 0x16u);
}

void sub_100008024(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008094()
{
  sub_1000066D8();
  sub_1000066E4((void *)&_mh_execute_header, v0, v1, "Handling url %@", v2, v3, v4, v5, v6);
}

void sub_1000080FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v1;
  sub_100006700();
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to open process FollowUp URL %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100008180()
{
  sub_1000066D8();
  sub_1000066E4((void *)&_mh_execute_header, v0, v1, "Handling Sensitive url key %@", v2, v3, v4, v5, v6);
}

void sub_1000081E8()
{
  sub_1000066D8();
  sub_1000066BC((void *)&_mh_execute_header, v0, v1, "Failed to find urlKey %@ in the bag.", v2, v3, v4, v5, v6);
}

void sub_100008250(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100006700();
  sub_10000672C((void *)&_mh_execute_header, v1, v2, "Handling local url key %@ for item %@", (void)v3, DWORD2(v3));
}

void sub_1000082C0()
{
  sub_1000066D8();
  sub_1000066E4((void *)&_mh_execute_header, v0, v1, "Starting teardown with teardown context :%@", v2, v3, v4, v5, v6);
}

void sub_100008328(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100006700();
  sub_10000672C((void *)&_mh_execute_header, v1, v2, "Handling ak-action %@ for item %@", (void)v3, DWORD2(v3));
}

void sub_100008398()
{
  sub_10000674C();
  sub_100006710((void *)&_mh_execute_header, v0, v1, "Primary email verification completed, notifying the world!", v2, v3, v4, v5, v6);
}

void sub_1000083CC(char a1)
{
  CFStringRef v1 = @"YES";
  if ((a1 & 1) == 0) {
    CFStringRef v1 = @"NO";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  sub_100006700();
  sub_10000672C((void *)&_mh_execute_header, v2, v3, "Followup teardown is complete with success: %@, error: %@", (void)v4, DWORD2(v4));
}

void sub_100008454()
{
}

void sub_100008480()
{
}

void sub_1000084AC()
{
  sub_1000066D8();
  sub_1000066BC((void *)&_mh_execute_header, v0, v1, "Posted CDP repair follow up in response to error: %@", v2, v3, v4, v5, v6);
}

void sub_100008514()
{
  sub_10000674C();
  sub_100006710((void *)&_mh_execute_header, v0, v1, "Starting iCDP repair...", v2, v3, v4, v5, v6);
}

void sub_100008548()
{
  sub_10000674C();
  sub_100006710((void *)&_mh_execute_header, v0, v1, "Starting to reauthenticate...", v2, v3, v4, v5, v6);
}

void sub_10000857C()
{
  sub_1000066D8();
  sub_1000066E4((void *)&_mh_execute_header, v0, v1, "Successfully fetched user information: %@", v2, v3, v4, v5, v6);
}

void sub_1000085E4()
{
  sub_1000066D8();
  sub_1000066BC((void *)&_mh_execute_header, v0, v1, "Failed to fetch user information, error: %@", v2, v3, v4, v5, v6);
}

void sub_10000864C()
{
  uint64_t v0 = abort_report_np();
  sub_100008674(v0);
}

void sub_100008674()
{
  uint64_t v0 = abort_report_np();
  sub_10000869C(v0);
}

void sub_10000869C()
{
  uint64_t v0 = abort_report_np();
  sub_1000086C4(v0);
}

void sub_1000086C4()
{
  uint64_t v0 = abort_report_np();
  sub_1000086EC(v0);
}

void sub_1000086EC()
{
  uint64_t v0 = abort_report_np();
  sub_100008714(v0);
}

void sub_100008714()
{
  uint64_t v0 = abort_report_np();
  sub_10000873C(v0);
}

void sub_10000873C()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__authController(void *a1, const char *a2, ...)
{
  return [a1 _authController];
}

id objc_msgSend__primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 _primaryAppleAccount];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_followUpController(void *a1, const char *a2, ...)
{
  return [a1 followUpController];
}

id objc_msgSend_followUpRepairContext(void *a1, const char *a2, ...)
{
  return [a1 followUpRepairContext];
}

id objc_msgSend_followupProvider(void *a1, const char *a2, ...)
{
  return [a1 followupProvider];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_primaryiCloudAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryiCloudAccount];
}

id objc_msgSend_sharedAuthKitFollowupProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedAuthKitFollowupProvider];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
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