@interface AKPiggybackController
+ (id)sharedController;
+ (void)tearDown;
- (BOOL)_hasPrimaryiCloudAccountForPayload:(id)a3;
- (BOOL)_processPendingCompletionsForPayload:(id)a3;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (double)_processingTimeOut;
- (id)_acceptingControllerForTransactionId:(id)a3;
- (id)performCircleRequestWithContext:(id)a3 completion:(id)a4;
- (id)serviceControllerForContext:(id)a3;
- (void)_displaySwitchWiFiAlert;
- (void)_processPiggybackPayload:(id)a3;
- (void)_processUIIfNeededForError:(id)a3 circleStep:(unint64_t)a4;
- (void)_removeAcceptingControllerForTransaction:(id)a3;
- (void)processPushMessage:(id)a3;
- (void)startRequestSessionWithController:(id)a3 completion:(id)a4;
@end

@implementation AKPiggybackController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0B88;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272650 != -1) {
    dispatch_once(&qword_100272650, block);
  }
  v2 = (void *)qword_100272648;

  return v2;
}

+ (void)tearDown
{
  v3 = +[AKPiggybackController sharedController];
  [v3[1] removeAllObjects];
  id v2 = v3[2];
  objc_sync_enter(v2);
  [v3[5] cancelAllOperations];
  [v3[5] waitUntilAllOperationsAreFinished];
  [v3[2] removeAllObjects];
  objc_sync_exit(v2);

  objc_storeWeak(v3 + 3, 0);
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)700)
  {
    v5 = +[AKCircleRequestPayload payloadWithMessage:v4];
    id v6 = objc_alloc_init((Class)AKAnisetteProvisioningController);
    v7 = [v6 anisetteDataWithError:0];

    v8 = [v7 machineID];
    if (v8)
    {
      v9 = [v7 machineID];
      v10 = [v4 serverMachineId];
      self->_requiresHSA2Repair = [v9 isEqualToString:v10] ^ 1;
      p_requiresHSA2Repair = &self->_requiresHSA2Repair;
    }
    else
    {
      self->_requiresHSA2Repair = 0;
      p_requiresHSA2Repair = &self->_requiresHSA2Repair;
    }

    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (*p_requiresHSA2Repair) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      int v17 = 138412290;
      CFStringRef v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "HSA2 repair required: %@", (uint8_t *)&v17, 0xCu);
    }

    if (!*p_requiresHSA2Repair && ![v5 clientErrorCode])
    {
      if (![v5 isAcceptingPayload]
        || [(AKPiggybackController *)self _hasPrimaryiCloudAccountForPayload:v5])
      {
        BOOL v12 = 0;
        goto LABEL_14;
      }
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Suppressing piggybacking for non-primary iCloud accounts", (uint8_t *)&v17, 2u);
      }
    }
    BOOL v12 = 1;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)700)
  {
    v5 = +[AKCircleRequestPayload payloadWithMessage:v4];
    id v6 = _AKSignpostLogSystem();
    os_signpost_id_t v7 = _AKSignpostCreate();

    v8 = _AKSignpostLogSystem();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v18 = 67240192;
      LODWORD(v19) = [v5 circleStep];
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PiggybackingProcessPushPayload", " CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ", (uint8_t *)&v18, 8u);
    }

    v10 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [v5 circleStep];
      int v18 = 134218240;
      os_signpost_id_t v19 = v7;
      __int16 v20 = 1026;
      LODWORD(v21) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingProcessPushPayload  CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ", (uint8_t *)&v18, 0x12u);
    }

    if (([v5 isRequestingPayload] & 1) != 0
      || [(AKPiggybackController *)self _hasPrimaryiCloudAccountForPayload:v5]
      && !self->_requiresHSA2Repair)
    {
      [(AKPiggybackController *)self _processPiggybackPayload:v5];
      int v12 = 1;
    }
    else
    {
      v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        os_signpost_id_t v19 = (os_signpost_id_t)v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Suppressed payload: %@", (uint8_t *)&v18, 0xCu);
      }

      int v12 = 0;
    }
    uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
    v15 = _AKSignpostLogSystem();
    v16 = v15;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = 67240192;
      LODWORD(v19) = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v7, "PiggybackingProcessPushPayload", " DidProcess=%{public,signpost.telemetry:number2,name=DidProcess}d ", (uint8_t *)&v18, 8u);
    }

    int v17 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218496;
      os_signpost_id_t v19 = v7;
      __int16 v20 = 2048;
      double v21 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v22 = 1026;
      int v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggybackingProcessPushPayload  DidProcess=%{public,signpost.telemetry:number2,name=DidProcess}d ", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)_processPiggybackPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clientErrorCode];
  id v6 = _AKLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)-9000)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "Suppressing the circle error payload";
      v9 = v6;
      uint32_t v10 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v31 = (os_signpost_id_t)v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We received a reply: %@", buf, 0xCu);
    }

    if ([(AKPiggybackController *)self _processPendingCompletionsForPayload:v4])
    {
      id v6 = _AKLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v31 = (os_signpost_id_t)v4;
        v8 = "Processed a pending reply with payload: %@";
        v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_9;
      }
    }
    else
    {
      unsigned int v11 = [v4 isAcceptingPayload];
      int v12 = _AKLogSystem();
      id v6 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_signpost_id_t v31 = (os_signpost_id_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting an accepting session with payload: %@", buf, 0xCu);
        }

        v13 = [v4 transactionId];
        id v6 = [(AKPiggybackController *)self _acceptingControllerForTransactionId:v13];

        if (!v6)
        {
          CFStringRef v14 = _AKLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_100193284();
          }
        }
        v15 = _AKSignpostLogSystem();
        os_signpost_id_t v16 = _AKSignpostCreate();
        uint64_t v18 = v17;

        os_signpost_id_t v19 = _AKSignpostLogSystem();
        __int16 v20 = v19;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          double v21 = (objc_class *)objc_opt_class();
          __int16 v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138543362;
          os_signpost_id_t v31 = (os_signpost_id_t)v22;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PiggybackingProcessPiggybackPayloadWithController", " Class=%{public,signpost.telemetry:string1,name=Class}@  enableTelemetry=YES ", buf, 0xCu);
        }
        int v23 = _AKSignpostLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 134218242;
          os_signpost_id_t v31 = v16;
          __int16 v32 = 2114;
          v33 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingProcessPiggybackPayloadWithController  Class=%{public,signpost.telemetry:string1,name=Class}@  enableTelemetry=YES ", buf, 0x16u);
        }
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000C1614;
        v26[3] = &unk_10022B1F0;
        os_signpost_id_t v28 = v16;
        uint64_t v29 = v18;
        v26[4] = self;
        id v27 = v4;
        [v6 processPushPayload:v27 completion:v26];
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        sub_1001932B8();
      }
    }
  }
}

- (void)_displaySwitchWiFiAlert
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100193390();
  }

  int v3 = MGGetBoolAnswer();
  id v4 = @"WIFI";
  if (v3) {
    id v4 = @"WLAN";
  }
  id v5 = v4;
  id v6 = +[NSString stringWithFormat:@"%@_PBV2_WINDOWS_IP_MISMATCH_TITLE", v5];
  BOOL v7 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  v8 = [v7 localizedStringForKey:v6 value:&stru_100233250 table:@"Localizable"];

  v9 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  uint32_t v10 = [v9 localizedStringForKey:@"PBV2_WINDOWS_IP_MISMATCH_MSG" value:&stru_100233250 table:@"Localizable"];

  unsigned int v11 = +[NSString stringWithFormat:@"%@_PBV2_WINDOWS_IP_MISMATCH_BUTTON_SETTINGS", v5];

  int v12 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  v13 = [v12 localizedStringForKey:v11 value:&stru_100233250 table:@"Localizable"];

  CFStringRef v14 = +[NSBundle bundleWithIdentifier:@"com.apple.AuthKit"];
  v15 = [v14 localizedStringForKey:@"PBV2_WINDOWS_IP_MISMATCH_BUTTON_CANCEL" value:&stru_100233250 table:@"Localizable"];

  os_signpost_id_t v16 = +[AKAlertHandler sharedInstance];
  uint64_t v17 = [v16 notificationDictionaryWithTitle:v8 message:v10 defaultButton:v13 alternateButton:v15];

  uint64_t v18 = +[AKAlertHandler sharedInstance];
  [v18 showAlert:v17 primaryAction:&stru_10022B210 altAction:&stru_10022B230];
}

- (BOOL)_hasPrimaryiCloudAccountForPayload:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  id v5 = [v3 altDSID];

  LOBYTE(v3) = [v4 hasPrimaryiCloudAccountForAltDSID:v5];
  return (char)v3;
}

- (BOOL)_processPendingCompletionsForPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionId];

  if (v5)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    piggybackingRequestQueue = self->_piggybackingRequestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C1D70;
    block[3] = &unk_10022B258;
    block[4] = self;
    id v10 = v4;
    unsigned int v11 = &v12;
    dispatch_sync(piggybackingRequestQueue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_acceptingControllerForTransactionId:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  os_signpost_id_t v16 = sub_10000F9D0;
  uint64_t v17 = sub_10000F838;
  id v18 = 0;
  if (v4)
  {
    piggybackingRequestQueue = self->_piggybackingRequestQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C1FA4;
    block[3] = &unk_1002299B0;
    uint64_t v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(piggybackingRequestQueue, block);

    BOOL v7 = (void *)v14[5];
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_removeAcceptingControllerForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    piggybackingRequestQueue = self->_piggybackingRequestQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C2124;
    v7[3] = &unk_100226C00;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(piggybackingRequestQueue, v7);
  }
}

- (void)startRequestSessionWithController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_storeWeak((id *)&self->_requestingController, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C21F0;
  v9[3] = &unk_100227DB0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 initiatePiggybackingWithCompletion:v9];
}

- (id)serviceControllerForContext:(id)a3
{
  id v3 = a3;
  id v4 = [[AKPiggybackingRequestProvider alloc] initWithCircleContext:v3];

  id v5 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v4];

  return v5;
}

- (id)performCircleRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "authkit/circle-request", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = _AKLogSystem();
  v73 = v8;
  v74 = self;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 payload];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting circle request with context: %@", (uint8_t *)&buf, 0xCu);
  }
  id v11 = +[AKAppleIDPushHelperService sharedService];
  [v11 setEnableCriticalReliability:1];

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_1000C2DA8;
  v100[3] = &unk_100229108;
  id v72 = v7;
  id v101 = v72;
  v75 = objc_retainBlock(v100);
  uint64_t v12 = [v6 payload];
  uint64_t v13 = [v12 transactionId];
  LODWORD(v11) = v13 == 0;

  if (v11)
  {
    int v23 = +[NSError ak_errorWithCode:-7056];
    ((void (*)(void *, void, void *))v75[2])(v75, 0, v23);
    v26 = 0;
  }
  else
  {
    uint64_t v14 = [v6 pushToken];
    BOOL v15 = v14 == 0;

    if (!v15) {
      goto LABEL_8;
    }
    os_signpost_id_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Populating push token", (uint8_t *)&buf, 2u);
    }

    uint64_t v17 = +[AKAppleIDPushHelperService sharedService];
    id v18 = [v17 publicAPSTokenString];
    [v6 setPushToken:v18];

    os_signpost_id_t v19 = [v6 pushToken];
    LODWORD(v17) = v19 == 0;

    if (v17)
    {
      v63 = _AKLogSystem();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_10019342C();
      }

      int v23 = +[NSError ak_errorWithCode:-7056];
      ((void (*)(void *, void, void *))v75[2])(v75, 0, v23);
      v26 = 0;
    }
    else
    {
LABEL_8:
      __int16 v20 = [v6 authContext];
      unsigned int v21 = [v20 piggybackingForTrustedDevice];

      if (v21)
      {
        __int16 v22 = [v6 payload];
        [v22 setPiggybackingContext:1];
      }
      int v23 = [(AKPiggybackController *)self serviceControllerForContext:v6];
      if ([v6 waitForReply])
      {
        [v6 waitForReplyTimeout];
        if (v24 <= 0.0) {
          [(AKPiggybackController *)self _processingTimeOut];
        }
        else {
          [v6 waitForReplyTimeout];
        }
        uint64_t v27 = v25;
        uint64_t v28 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
        id v29 = objc_alloc_init((Class)NSCondition);
        v30 = objc_opt_new();
        [v30 setCondition:v29];
        piggybackingRequestQueue = v74->_piggybackingRequestQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000C2E98;
        block[3] = &unk_100226BD8;
        block[4] = v74;
        id v32 = v6;
        id v98 = v32;
        id v33 = v30;
        id v99 = v33;
        dispatch_sync(piggybackingRequestQueue, block);
        v34 = _AKLogSystem();
        v68 = v33;
        v70 = (void *)v28;
        v66 = v29;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v27;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Waiting for reply with timeout: %f", (uint8_t *)&buf, 0xCu);
        }

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v108 = 0x3032000000;
        v109 = sub_10000F9D0;
        v110 = sub_10000F838;
        id v111 = 0;
        v26 = objc_opt_new();
        objc_initWeak(&location, v26);
        v35 = [AKCAPiggybackReporter alloc];
        v36 = [v32 payload];
        v37 = [v36 transactionId];
        v65 = [(AKCAPiggybackReporter *)v35 initWithRequestID:v37];

        v38 = [v32 payload];
        v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 circleStep]);
        v40 = [v39 stringValue];

        v41 = _AKSignpostLogSystem();
        v42 = (char *)_AKSignpostCreate();
        v44 = v43;

        v45 = _AKSignpostLogSystem();
        v46 = v45;
        if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
        {
          v47 = [v32 payload];
          *(_DWORD *)v103 = 138543362;
          v104 = v47;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v42, "PiggyCircleRequest", " Payload=%{public,signpost.telemetry:string1,name=Payload}@  enableTelemetry=YES ", v103, 0xCu);
        }
        v48 = _AKSignpostLogSystem();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = [v32 payload];
          *(_DWORD *)v103 = 134218242;
          v104 = v42;
          __int16 v105 = 2114;
          id v106 = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyCircleRequest  Payload=%{public,signpost.telemetry:string1,name=Payload}@  enableTelemetry=YES ", v103, 0x16u);
        }
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_1000C2F10;
        v85[3] = &unk_10022B2C0;
        id v50 = v32;
        id v86 = v50;
        objc_copyWeak(v95, &location);
        id v51 = v66;
        id v87 = v51;
        p_long long buf = &buf;
        id v69 = v68;
        id v88 = v69;
        id v67 = v70;
        id v89 = v67;
        v90 = v74;
        v95[1] = v42;
        v95[2] = v44;
        v52 = v40;
        id v91 = v52;
        v53 = v75;
        id v93 = v53;
        v71 = v65;
        v92 = v71;
        [v26 addExecutionBlock:v85];
        [(NSOperationQueue *)v74->_circleRequestProcessingQueue addOperation:v26];
        v54 = _AKSignpostLogSystem();
        os_signpost_id_t v55 = _AKSignpostCreate();
        uint64_t v57 = v56;

        v58 = _AKSignpostLogSystem();
        v59 = v58;
        if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_DWORD *)v103 = 138543362;
          v104 = v52;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, v55, "PiggyExecuteRequest", " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", v103, 0xCu);
        }

        v60 = _AKSignpostLogSystem();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v103 = 134218242;
          v104 = (char *)v55;
          __int16 v105 = 2114;
          id v106 = v52;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyExecuteRequest  CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", v103, 0x16u);
        }

        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_1000C3A48;
        v76[3] = &unk_10022B2E8;
        os_signpost_id_t v83 = v55;
        uint64_t v84 = v57;
        v61 = v52;
        v77 = v61;
        v82 = &buf;
        id v78 = v50;
        v79 = v74;
        id v62 = v51;
        id v80 = v62;
        v81 = v53;
        [v23 executeRequestWithCompletion:v76];

        objc_destroyWeak(v95);
        objc_destroyWeak(&location);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        [v23 executeRequestWithCompletion:&stru_10022B298];
        ((void (*)(void *, void, void))v75[2])(v75, 0, 0);
        v26 = 0;
      }
    }
  }

  os_activity_scope_leave(&state);

  return v26;
}

- (void)_processUIIfNeededForError:(id)a3 circleStep:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001934FC();
    }

    objc_opt_class();
    id v8 = [v6 userInfo];
    id v9 = [v8 objectForKeyedSubscript:AKCircleClientErrorCode];
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    id v11 = [v10 integerValue];
    if (v11 == (id)-27955) {
      [(AKPiggybackController *)self _displaySwitchWiFiAlert];
    }
  }
}

- (double)_processingTimeOut
{
  return 120.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleRequestProcessingQueue, 0);
  objc_storeStrong((id *)&self->_piggybackingRequestQueue, 0);
  objc_destroyWeak((id *)&self->_requestingController);
  objc_storeStrong((id *)&self->_pendingReplies, 0);

  objc_storeStrong((id *)&self->_acceptingControllers, 0);
}

@end