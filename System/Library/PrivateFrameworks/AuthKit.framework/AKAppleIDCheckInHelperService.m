@interface AKAppleIDCheckInHelperService
+ (id)sharedService;
+ (void)_setCheckInAllowedToValue:(BOOL)a3 forAccount:(id)a4;
+ (void)setCheckInAllowedForAllAccountsToValue:(BOOL)a3;
- (AKAppleIDCheckInHelperService)init;
- (BOOL)_validateMachineID:(id)a3;
- (id)_livenessEligibleAccounts;
- (id)_serviceControllerWithProvider:(id)a3;
- (void)_checkInWithIDMSWithAccount:(id)a3 pushToken:(id)a4 event:(id)a5 reason:(unint64_t)a6 completion:(id)a7;
- (void)_clearBirthDayForAltDSID:(id)a3;
- (void)_clearDeviceListCacheForAccount:(id)a3;
- (void)_handleCheckInResponse:(id)a3 data:(id)a4 context:(id)a5 account:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_performLivenessCheckInForAllEligibleAccountsWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)_sendAttestedOSVersionWithContext:(id)a3 attestationNonce:(id)a4;
- (void)ackWithPayload:(id)a3 account:(id)a4 completion:(id)a5;
- (void)didReceiveNewPublicToken:(id)a3;
- (void)didRespondToMessage:(id)a3 result:(unint64_t)a4 payload:(id)a5;
- (void)didRespondToMessage:(id)a3 withResult:(unint64_t)a4;
- (void)performCheckInForAccount:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)processPushMessage:(id)a3;
- (void)reportFinalSignOutEventForAccount:(id)a3 completion:(id)a4;
- (void)reportSignOutEventForService:(int64_t)a3 account:(id)a4 completion:(id)a5;
- (void)start;
- (void)storeLivenessNonce:(id)a3 nonce:(id)a4;
@end

@implementation AKAppleIDCheckInHelperService

- (AKAppleIDCheckInHelperService)init
{
  v11.receiver = self;
  v11.super_class = (Class)AKAppleIDCheckInHelperService;
  v2 = [(AKAppleIDCheckInHelperService *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AKCheckInQueue", v5);
    checkInQueue = v2->_checkInQueue;
    v2->_checkInQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[AKStrongDeviceIdentitySigner sharedSigner];
    strongDeviceIdentitySigner = v2->_strongDeviceIdentitySigner;
    v2->_strongDeviceIdentitySigner = (AKStrongDeviceIdentitySigner *)v8;
  }
  return v2;
}

+ (id)sharedService
{
  if (qword_1002724F8 != -1) {
    dispatch_once(&qword_1002724F8, &stru_10022A098);
  }
  v2 = (void *)qword_1002724F0;

  return v2;
}

+ (void)setCheckInAllowedForAllAccountsToValue:(BOOL)a3
{
  v5 = +[AKAccountManager sharedInstance];
  dispatch_queue_t v6 = [v5 allAuthKitAccountsWithError:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100091180;
  v7[3] = &unk_10022A0B8;
  v7[4] = a1;
  BOOL v8 = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)os_transaction_create();
  BOOL v8 = +[AKAppleIDPushHelperService sharedService];
  v9 = [v8 publicAPSTokenString];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100091294;
  v12[3] = &unk_100227BA8;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(AKAppleIDCheckInHelperService *)self _performLivenessCheckInForAllEligibleAccountsWithToken:v9 reason:a3 completion:v12];
}

- (void)performCheckInForAccount:(id)a3 event:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)os_transaction_create();
  checkInQueue = self->_checkInQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000913C4;
  v19[3] = &unk_10022A0E0;
  v19[4] = self;
  id v20 = v10;
  id v23 = v12;
  unint64_t v24 = a5;
  id v21 = v11;
  id v22 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(checkInQueue, v19);
}

- (void)processPushMessage:(id)a3
{
  id v15 = a3;
  v4 = [v15 serverMachineId];
  unsigned int v5 = [(AKAppleIDCheckInHelperService *)self _validateMachineID:v4];

  id v6 = v15;
  if (v5)
  {
    accountManager = self->_accountManager;
    BOOL v8 = [v15 altDSID];
    v9 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v8 error:0];

    if (v9)
    {
      id v10 = +[NSMutableDictionary dictionary];
      id v11 = [v15 messageId];
      [v10 setObject:v11 forKeyedSubscript:@"txnid"];

      id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 command]);
      [v10 setObject:v12 forKeyedSubscript:@"cmd"];

      if ([v15 command] == (id)1500)
      {
        +[AKAppleIDCheckInHelperService _setCheckInAllowedToValue:0 forAccount:v9];
      }
      else if ([v15 command] == (id)2200)
      {
        id v13 = [v15 idmsData];

        if (v13)
        {
          id v14 = [v15 idmsData];
          [v10 setObject:v14 forKeyedSubscript:AKIdmsDataKey];
        }
      }
      [(AKAppleIDCheckInHelperService *)self ackWithPayload:v10 account:v9 completion:0];
    }
    id v6 = v15;
  }
}

- (void)didRespondToMessage:(id)a3 withResult:(unint64_t)a4
{
}

- (void)didRespondToMessage:(id)a3 result:(unint64_t)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 != 2)
  {
    id v10 = [v8 messageId];

    if (v10)
    {
      id v11 = (id *)&off_100228408;
      id v12 = &off_100228410;
      if (a4) {
        id v12 = &off_100228418;
      }
      if (a4 != 1) {
        id v11 = (id *)v12;
      }
      id v13 = *v11;
      accountManager = self->_accountManager;
      id v15 = [v8 altDSID];
      id v16 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v15 error:0];

      if (v16)
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        id v18 = v17;
        if (v9) {
          [v17 addEntriesFromDictionary:v9];
        }
        v19 = [v8 messageId];
        [v18 setObject:v19 forKeyedSubscript:@"txnid"];

        id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 command]);
        [v18 setObject:v20 forKeyedSubscript:@"cmd"];

        [v18 setObject:v13 forKeyedSubscript:@"action"];
        id v21 = [v18 copy];
        [(AKAppleIDCheckInHelperService *)self ackWithPayload:v21 account:v16 completion:0];
      }
      else
      {
        id v22 = _AKLogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10018B084(v8, v22);
        }
      }
    }
    else
    {
      id v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10018B044();
      }
    }
  }
}

- (void)didReceiveNewPublicToken:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = nullsub_6;
  v6[3] = &unk_100226FB8;
  id v7 = (id)os_transaction_create();
  id v5 = v7;
  [(AKAppleIDCheckInHelperService *)self _performLivenessCheckInForAllEligibleAccountsWithToken:v4 reason:2 completion:v6];
}

- (void)ackWithPayload:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)os_transaction_create();
  checkInQueue = self->_checkInQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091A68;
  block[3] = &unk_10022A108;
  id v18 = v8;
  id v19 = v9;
  id v21 = v11;
  id v22 = v10;
  id v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(checkInQueue, block);
}

- (void)start
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "com.apple.ak.hb";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100091E1C;
  handler[3] = &unk_100227FF0;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.hb", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)reportFinalSignOutEventForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "authkit/sign-out", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reporting global signout to IDMS for %@", buf, 0xCu);
  }

  id v10 = (void *)os_transaction_create();
  uint64_t v11 = AKPostDataEventFinalSignOut;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009222C;
  v15[3] = &unk_10022A130;
  v15[4] = self;
  id v12 = v6;
  id v16 = v12;
  id v13 = v7;
  id v18 = v13;
  id v14 = v10;
  id v17 = v14;
  [(AKAppleIDCheckInHelperService *)self _checkInWithIDMSWithAccount:v12 pushToken:0 event:v11 reason:0 completion:v15];

  os_activity_scope_leave(&state);
}

- (void)_clearBirthDayForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AKBirthDayKeychain);
  id v7 = 0;
  [(AKBirthDayKeychain *)v4 deleteBirthdayForAltDSID:v3 error:&v7];

  id v5 = v7;
  if (v5)
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10018B150();
    }
  }
}

- (void)reportSignOutEventForService:(int64_t)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "authkit/sign-out", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)buf = 138412546;
    unint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reporting signout for service %@ with account %@", buf, 0x16u);
  }
  id v13 = +[AKAccountManager stringRepresentationForService:a3];
  if (v13)
  {
    id v14 = [AKPostDataEventServiceSignOut stringByAppendingString:v13];
    id v15 = (void *)os_transaction_create();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10009274C;
    v19[3] = &unk_100227250;
    id v21 = v9;
    id v16 = v15;
    id v20 = v16;
    [(AKAppleIDCheckInHelperService *)self _checkInWithIDMSWithAccount:v8 pushToken:0 event:v14 reason:0 completion:v19];
  }
  else
  {
    id v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = +[NSNumber numberWithInteger:a3];
      sub_10018B1C4(v18, (uint64_t)buf, v17);
    }

    id v14 = +[NSError ak_errorWithCode:-7049];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
  }

  os_activity_scope_leave(&state);
}

+ (void)_setCheckInAllowedToValue:(BOOL)a3 forAccount:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[NSNumber numberWithBool:v4];
  [v5 setAccountProperty:v6 forKey:@"com.apple.ak.checkin-allowed"];

  id v7 = +[AKAccountManager sharedInstance];
  id v10 = 0;
  [v7 saveAccount:v5 error:&v10];

  id v8 = v10;
  if (v8)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018B214();
    }
  }
}

- (void)_performLivenessCheckInForAllEligibleAccountsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000928FC;
  v9[3] = &unk_10022A158;
  id v10 = (id)objc_opt_new();
  uint64_t v11 = self;
  id v12 = v6;
  unint64_t v13 = a3;
  id v7 = v6;
  id v8 = v10;
  [v8 cleanupStaleAccountsWithCompletion:v9];
}

- (void)_performLivenessCheckInForAllEligibleAccountsWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v20 = a3;
  block = (void (**)(void))a5;
  if (a4 == 1) {
    [(AKAppleIDCheckInHelperService *)self _livenessEligibleAccounts];
  }
  else {
  id v18 = [(AKAccountManager *)self->_accountManager allAuthKitAccountsWithError:0];
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v16 = _os_activity_create((void *)&_mh_execute_header, "authkit/check-in", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &state);
  if ([v18 count])
  {
    id v8 = dispatch_group_create();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v18;
    id v9 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      uint64_t v11 = AKPostDataEventLiveness;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v14 = _AKLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            unint64_t v30 = a4;
            __int16 v31 = 2112;
            uint64_t v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Performing liveness check-in %{public}lu with account: %@", buf, 0x16u);
          }

          dispatch_group_enter(v8);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100092CE8;
          v21[3] = &unk_10022A180;
          unint64_t v23 = a4;
          v21[4] = v13;
          id v22 = v8;
          [(AKAppleIDCheckInHelperService *)self _checkInWithIDMSWithAccount:v13 pushToken:v20 event:v11 reason:a4 completion:v21];
        }
        id v9 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v9);
    }

    dispatch_group_notify(v8, (dispatch_queue_t)self->_checkInQueue, block);
  }
  else
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018B280();
    }

    if (block) {
      block[2]();
    }
  }
  os_activity_scope_leave(&state);
}

- (id)_livenessEligibleAccounts
{
  v2 = [(AKAccountManager *)self->_accountManager allAuthKitAccountsWithError:0];
  id v3 = objc_msgSend(v2, "aaf_filter:", &stru_10022A1A0);

  return v3;
}

- (void)_checkInWithIDMSWithAccount:(id)a3 pushToken:(id)a4 event:(id)a5 reason:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = _os_activity_create((void *)&_mh_execute_header, "authkit/check-in", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  id v17 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  id v18 = +[AKAccountManager sharedInstance];
  id v19 = [v18 altDSIDForAccount:v12];
  [v17 setAltDSID:v19];

  id v20 = [AKLivenessRequestProvider alloc];
  id v21 = [(AKURLRequestProviderImpl *)v20 initWithContext:v17 urlBagKey:AKURLBagKeyCheckIn];
  id v22 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  [(AKLivenessRequestProvider *)v21 setFollowUpProvider:v22];

  [(AKLivenessRequestProvider *)v21 setPushToken:v13];
  [(AKLivenessRequestProvider *)v21 setEvent:v14];
  [(AKLivenessRequestProvider *)v21 setLivenessReason:a6];
  unint64_t v23 = [(AKAppleIDCheckInHelperService *)self _serviceControllerWithProvider:v21];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000930C4;
  v27[3] = &unk_1002295F8;
  id v24 = v12;
  id v28 = v24;
  v29 = self;
  id v25 = v17;
  id v30 = v25;
  id v26 = v15;
  id v31 = v26;
  [v23 executeRequestWithCompletion:v27];

  os_activity_scope_leave(&state);
}

- (void)_handleCheckInResponse:(id)a3 data:(id)a4 context:(id)a5 account:(id)a6 error:(id)a7 completion:(id)a8
{
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t, void))a8;
  id v15 = a4;
  id v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10018B3D0();
  }

  id v17 = +[AAFSerialization dictionaryFromObject:v15 ofType:@"application/xml"];

  id v18 = _AKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10018B35C();
  }

  id v19 = [v17 objectForKey:@"livenessNonce"];
  id v20 = objc_msgSend(v19, "aaf_base64Padded");

  id v21 = [v17 objectForKey:@"attestationNonce"];
  id v22 = objc_msgSend(v21, "aaf_base64Padded");

  unint64_t v23 = [v17 objectForKey:@"sendAttestationOSVersion"];
  unsigned int v24 = [v23 BOOLValue];

  id v25 = _AKLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412802;
    id v31 = v20;
    __int16 v32 = 2112;
    v33 = v22;
    __int16 v34 = 1024;
    unsigned int v35 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received liveness nonce %@, attestation Nonce %@ sendAttestedOSVersion %d", (uint8_t *)&v30, 0x1Cu);
  }

  if (v20) {
    [(AKAppleIDCheckInHelperService *)self storeLivenessNonce:v13 nonce:v20];
  }
  if (v22) {
    unsigned int v26 = v24;
  }
  else {
    unsigned int v26 = 0;
  }
  if (v26 == 1)
  {
    long long v27 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v12 eventName:@"com.apple.authkit.osVersionAttestationReq" error:0];
    id v28 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
    [v28 sendEvent:v27];

    v29 = _AKLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Received IdMS indicator to send attested OS version", (uint8_t *)&v30, 2u);
    }

    [(AKAppleIDCheckInHelperService *)self _sendAttestedOSVersionWithContext:v12 attestationNonce:v22];
  }
  v14[2](v14, 1, 0);
}

- (void)storeLivenessNonce:(id)a3 nonce:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AKAccountManager sharedInstance];
  [v7 setNextLivenessNonce:v6 nonce:v5];

  id v8 = +[AKAccountManager sharedInstance];
  uint64_t v11 = 0;
  [v8 saveAccount:v6 error:&v11];

  uint64_t v9 = v11;
  if (v9)
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10018B410();
    }
  }
}

- (void)_sendAttestedOSVersionWithContext:(id)a3 attestationNonce:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  id v12 = _AKSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OSVersionAttestation", " enableTelemetry=YES ", buf, 2u);
  }

  id v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OSVersionAttestation  enableTelemetry=YES ", buf, 0xCu);
  }

  id v15 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:v6 eventName:@"com.apple.authkit.sendAttestedOSVersion" error:0];
  strongDeviceIdentitySigner = self->_strongDeviceIdentitySigner;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100093724;
  v20[3] = &unk_10022A1F0;
  id v21 = v6;
  id v22 = v7;
  os_signpost_id_t v24 = v9;
  uint64_t v25 = v11;
  id v23 = v15;
  id v17 = v15;
  id v18 = v7;
  id v19 = v6;
  [(AKStrongDeviceIdentitySigner *)strongDeviceIdentitySigner attestationDataForOSVersionWithContext:v19 attestationNonce:v18 completion:v20];
}

- (id)_serviceControllerWithProvider:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v3];

  return v4;
}

- (BOOL)_validateMachineID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AKAnisetteProvisioningController);
  id v5 = [v4 anisetteDataWithError:0];

  id v6 = [v5 machineID];
  if (v6)
  {
    id v7 = [v5 machineID];
    unsigned __int8 v8 = [v7 isEqualToString:v3];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_clearDeviceListCacheForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  id v5 = [v4 altDSIDForAccount:v3];
  if (v5)
  {
    id v6 = [AKDeviceListRequester alloc];
    id v7 = +[AKDeviceListStoreManager sharedManager];
    unsigned __int8 v8 = objc_opt_new();
    os_signpost_id_t v9 = [(AKDeviceListRequester *)v6 initWithStoreManager:v7 cdpFactory:v8 accountManager:v4 client:0];

    id v10 = objc_alloc_init((Class)AKDeviceListRequestContext);
    [v10 setAltDSID:v5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100093F04;
    v12[3] = &unk_100228018;
    id v13 = v10;
    id v11 = v10;
    [v9 clearDeviceListCacheWithContext:v11 completionHandler:v12];
  }
  else
  {
    os_signpost_id_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clear device list cache failed. Missing altDSID for account - %@", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongDeviceIdentitySigner, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_checkInQueue, 0);
}

@end