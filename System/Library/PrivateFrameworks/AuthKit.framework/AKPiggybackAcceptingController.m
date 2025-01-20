@interface AKPiggybackAcceptingController
+ (BOOL)isInCircle;
- (AKConfiguration)configuration;
- (AKPiggybackAcceptingController)initWithPiggybackReporter:(id)a3;
- (BOOL)isDone;
- (KCJoiningAcceptSession)acceptSession;
- (id)_acceptSessionForPayload:(id)a3 error:(id *)a4;
- (id)_authKitAccountForPayload:(id)a3;
- (id)_generateSecret;
- (id)accountCode;
- (id)replyContextWithPayload:(id)a3;
- (id)secret;
- (int)verificationFailed:(id *)a3;
- (void)_checkForProximityIfNeededWithCircleStep:(unint64_t)a3 completion:(id)a4;
- (void)_checkForProximityWithCompletion:(id)a3;
- (void)_finishProcessingPushPayload:(id)a3 withReplyContext:(id)a4 completion:(id)a5;
- (void)_grabLockAssertion;
- (void)_processProximityDetection:(BOOL)a3 withReplyContext:(id)a4 forPushPayload:(id)a5;
- (void)_releaseAssertion;
- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)_startProximityControllerWithPresenceSID:(id)a3;
- (void)_stopProximityController;
- (void)processPushPayload:(id)a3 completion:(id)a4;
- (void)setAcceptSession:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation AKPiggybackAcceptingController

- (AKPiggybackAcceptingController)initWithPiggybackReporter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKPiggybackAcceptingController;
  v6 = [(AKPiggybackAcceptingController *)&v12 init];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    assertionLock = v6->_assertionLock;
    v6->_assertionLock = v7;

    objc_storeStrong((id *)&v6->_piggybackReporter, a3);
    uint64_t v9 = +[AKConfiguration sharedConfiguration];
    configuration = v6->_configuration;
    v6->_configuration = (AKConfiguration *)v9;
  }
  return v6;
}

- (void)processPushPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a4;
  objc_storeStrong((id *)&self->_lastPayload, a3);
  if ([v7 clientErrorCode])
  {
    if ([v7 clientErrorCode] == (id)-9004) {
      uint64_t v9 = -7003;
    }
    else {
      uint64_t v9 = -7001;
    }
    objc_super v12 = +[NSError ak_errorWithCode:v9];
    v8[2](v8, 0, v12);
  }
  else
  {
    id v10 = [v7 circleStep];
    v11 = +[NSNumber numberWithUnsignedInteger:v10];
    objc_super v12 = [v11 stringValue];

    if ((unint64_t)v10 > 1) {
      goto LABEL_27;
    }
    self->_verificationFailed = 0;
    self->_verificationAttempts = 0;
    objc_storeStrong((id *)&self->_initiatingPayload, a3);
    if (self->_acceptSession)
    {
      v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will tear down an existing piggybacking session", buf, 2u);
      }
    }
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting a piggybacking session", buf, 2u);
    }

    v15 = _AKSignpostLogSystem();
    os_signpost_id_t v16 = _AKSignpostCreate();

    v17 = _AKSignpostLogSystem();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138543362;
      os_signpost_id_t v35 = (os_signpost_id_t)v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PiggyAcceptSessionForAcceptController", " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", buf, 0xCu);
    }

    v19 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      os_signpost_id_t v35 = v16;
      __int16 v36 = 2114;
      double v37 = *(double *)&v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyAcceptSessionForAcceptController  CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", buf, 0x16u);
    }

    id v33 = 0;
    v20 = [(AKPiggybackAcceptingController *)self _acceptSessionForPayload:v7 error:&v33];
    id v21 = v33;
    acceptSession = self->_acceptSession;
    self->_acceptSession = v20;

    uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
    v24 = _AKSignpostLogSystem();
    v25 = v24;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      unsigned int v26 = [v21 code];
      *(_DWORD *)buf = 138543618;
      os_signpost_id_t v35 = (os_signpost_id_t)v12;
      __int16 v36 = 1026;
      LODWORD(v37) = v26;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v16, "PiggyAcceptSessionForAcceptController", " CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);
    }

    v27 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = [v21 code];
      *(_DWORD *)buf = 134218754;
      os_signpost_id_t v35 = v16;
      __int16 v36 = 2048;
      double v37 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v38 = 2114;
      v39 = v12;
      __int16 v40 = 1026;
      unsigned int v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggyAcceptSessionForAcceptController  CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);
    }

    if (v21)
    {
      v29 = _AKLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10017C6C4();
      }

      v8[2](v8, 0, v21);
    }
    else
    {
LABEL_27:
      [(AKPiggybackAcceptingController *)self _startProximityControllerIfNeededWithPushPayload:v7];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001E07C;
      v30[3] = &unk_100226F68;
      v30[4] = self;
      id v31 = v7;
      v32 = v8;
      [(AKPiggybackAcceptingController *)self _checkForProximityIfNeededWithCircleStep:v10 completion:v30];
    }
  }
}

- (void)_processProximityDetection:(BOOL)a3 withReplyContext:(id)a4 forPushPayload:(id)a5
{
  BOOL v6 = a3;
  v8 = (AKPiggybackAcceptingController *)a4;
  id v9 = a5;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      CFStringRef v49 = @"YES";
    }
    else {
      CFStringRef v49 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    v55 = self;
    __int16 v56 = 2112;
    double v57 = *(double *)&v49;
    __int16 v58 = 2112;
    v59 = v8;
    __int16 v60 = 2112;
    id v61 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: Processing physical proximity detection (%@) with replyContext (%@) for pushPayload (%@)", buf, 0x2Au);
  }
  v52 = v8;

  unsigned int v11 = [v9 presenceFallbackApproved];
  [(AKConfiguration *)self->_configuration piggybackingIDMSPresenceOverride];
  int v12 = AKConfigApplyOverride();
  [(AKConfiguration *)self->_configuration piggybackingLocalPresenceOverride];
  uint64_t v13 = AKConfigApplyOverride();
  v51 = v9;
  id v14 = [v9 presenceMode];
  if (v11) {
    CFStringRef v15 = @"YES";
  }
  else {
    CFStringRef v15 = @"NO";
  }
  if (v6) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  uint64_t v17 = +[NSString stringWithFormat:@"idmsPresence=%@, foundDevice=%@", v15, v16];
  if (v12) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  if (v13) {
    CFStringRef v19 = @"YES";
  }
  else {
    CFStringRef v19 = @"NO";
  }
  +[NSString stringWithFormat:@"idmsPresence=%@, foundDevice=%@", v18, v19];
  v53 = (AKPiggybackAcceptingController *)objc_claimAutoreleasedReturnValue();
  v20 = _AKSignpostLogSystem();
  os_signpost_id_t v21 = _AKSignpostCreate();

  v22 = _AKSignpostLogSystem();
  v23 = v22;
  unint64_t v24 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v55) = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PiggybackingProcessPressenceForAcceptController", " PresenceMode=%{public,signpost.telemetry:number1,name=PresenceMode}d  enableTelemetry=YES ", buf, 8u);
  }

  v25 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v55 = (AKPiggybackAcceptingController *)v21;
    __int16 v56 = 1026;
    LODWORD(v57) = v14;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingProcessPressenceForAcceptController  PresenceMode=%{public,signpost.telemetry:number1,name=PresenceMode}d  enableTelemetry=YES ", buf, 0x12u);
  }

  uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
  v27 = _AKSignpostLogSystem();
  unsigned int v28 = v27;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_DWORD *)buf = 138543362;
    v55 = (AKPiggybackAcceptingController *)v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, v21, "PiggybackingProcessPressenceForAcceptControllerResults", " Results=%{public,signpost.telemetry:string1,name=Results}@ ", buf, 0xCu);
  }

  v29 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v55 = (AKPiggybackAcceptingController *)v21;
    __int16 v56 = 2048;
    double v57 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v58 = 2114;
    v59 = (AKPiggybackAcceptingController *)v17;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "EVENT [%lld] %fs:PiggybackingProcessPressenceForAcceptControllerResults  Results=%{public,signpost.telemetry:string1,name=Results}@ ", buf, 0x20u);
  }
  uint64_t v30 = v12 | v13;

  uint64_t v31 = _AKSignpostGetNanoseconds();
  v32 = _AKSignpostLogSystem();
  id v33 = v32;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_DWORD *)buf = 138543362;
    v55 = v53;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_EVENT, v21, "PiggybackingProcessPressenceForAcceptControllerResultsOverrides", " Results=%{public,signpost.telemetry:string2,name=Results}@ ", buf, 0xCu);
  }
  v50 = (void *)v17;

  v34 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v55 = (AKPiggybackAcceptingController *)v21;
    __int16 v56 = 2048;
    double v57 = (double)(unint64_t)v31 / 1000000000.0;
    __int16 v58 = 2114;
    v59 = v53;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EVENT [%lld] %fs:PiggybackingProcessPressenceForAcceptControllerResultsOverrides  Results=%{public,signpost.telemetry:string2,name=Results}@ ", buf, 0x20u);
  }

  os_signpost_id_t v35 = +[NSNumber numberWithBool:v30];
  __int16 v36 = [(AKPiggybackAcceptingController *)v52 payload];
  [v36 setPresenceCheckPassed:v35];

  double v37 = +[NSNumber numberWithBool:v13];
  __int16 v38 = [(AKPiggybackAcceptingController *)v52 payload];
  [v38 setLocalPresenceFound:v37];

  if ((unint64_t)v14 > 1) {
    char v39 = 1;
  }
  else {
    char v39 = v30;
  }
  if ((v39 & 1) == 0)
  {
    uint64_t v40 = _AKSignpostGetNanoseconds();
    unsigned int v41 = _AKSignpostLogSystem();
    v42 = v41;
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_EVENT, v21, "ReportedEnforceModeFailure", "", buf, 2u);
    }

    v43 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v55 = (AKPiggybackAcceptingController *)v21;
      __int16 v56 = 2048;
      double v57 = (double)(unint64_t)v40 / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "EVENT [%lld] %fs:ReportedEnforceModeFailure ", buf, 0x16u);
    }

    v44 = _AKLogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_10017C72C();
    }

    self->_proximityFailed = 1;
  }
  uint64_t v45 = _AKSignpostGetNanoseconds();
  v46 = _AKSignpostLogSystem();
  v47 = v46;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v55) = v30;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v21, "PiggybackingProcessPressenceForAcceptController", " CheckPassed=%{public,signpost.telemetry:number2,name=CheckPassed}d ", buf, 8u);
  }

  v48 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v55 = (AKPiggybackAcceptingController *)v21;
    __int16 v56 = 2048;
    double v57 = (double)(unint64_t)v45 / 1000000000.0;
    __int16 v58 = 1026;
    LODWORD(v59) = v30;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggybackingProcessPressenceForAcceptController  CheckPassed=%{public,signpost.telemetry:number2,name=CheckPassed}d ", buf, 0x1Cu);
  }
}

- (void)_finishProcessingPushPayload:(id)a3 withReplyContext:(id)a4 completion:(id)a5
{
  id v43 = a3;
  id v8 = a4;
  id v40 = a5;
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10017C92C((uint64_t)self, v43, v9);
  }

  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v43 circleStep]);
  v42 = [v10 stringValue];

  unsigned int v11 = _AKSignpostLogSystem();
  os_signpost_id_t v12 = _AKSignpostCreate();

  uint64_t v13 = _AKSignpostLogSystem();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    os_signpost_id_t v49 = (os_signpost_id_t)v42;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PiggyClientInfoForAcceptController", " CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", buf, 0xCu);
  }

  CFStringRef v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    os_signpost_id_t v49 = v12;
    __int16 v50 = 2114;
    double v51 = *(double *)&v42;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyClientInfoForAcceptController  CircleStep=%{public,signpost.telemetry:string1,name=CircleStep}@  enableTelemetry=YES ", buf, 0x16u);
  }

  acceptSession = self->_acceptSession;
  uint64_t v17 = [v43 clientInfo];
  id v47 = 0;
  CFStringRef v18 = [(KCJoiningAcceptSession *)acceptSession processMessage:v17 error:&v47];
  id v19 = v47;
  v20 = [v8 payload];
  [v20 setClientInfo:v18];

  uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
  v22 = _AKSignpostLogSystem();
  v23 = v22;
  if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
  {
    unsigned int v24 = objc_msgSend(v19, "code", v40);
    *(_DWORD *)buf = 138543618;
    os_signpost_id_t v49 = (os_signpost_id_t)v42;
    __int16 v50 = 1026;
    LODWORD(v51) = v24;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v12, "PiggyClientInfoForAcceptController", " CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x12u);
  }

  v25 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v26 = [v19 code];
    *(_DWORD *)buf = 134218754;
    os_signpost_id_t v49 = v12;
    __int16 v50 = 2048;
    double v51 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v52 = 2114;
    v53 = v42;
    __int16 v54 = 1026;
    unsigned int v55 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggyClientInfoForAcceptController  CircleStep=%{public,signpost.telemetry:string2,name=CircleStep}@  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x26u);
  }

  v27 = _AKLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10017C864((uint64_t *)&self->_acceptSession, v8, v27);
  }

  if (self->_verificationFailed)
  {
    self->_verificationFailed = 0;
    unsigned int v28 = [v8 payload];
    [v28 setClientErrorCode:-9003];
  }
  else if (self->_proximityFailed)
  {
    v29 = _AKLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10017C7FC();
    }

    [v8 setWaitForReply:0];
    uint64_t v30 = [v8 payload];
    [v30 setClientErrorCode:-9005];

    [(AKPiggybackAcceptingController *)self _releaseAssertion];
  }
  else
  {
    uint64_t v31 = [v8 payload];
    v32 = [v31 clientInfo];
    BOOL v33 = v32 == 0;

    if (v33)
    {
      v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10017C794();
      }

      [v8 setWaitForReply:0];
      os_signpost_id_t v35 = [v8 payload];
      [v35 setClientErrorCode:-9001];

      [(AKPiggybackAcceptingController *)self _releaseAssertion];
    }
  }
  if ([(AKPiggybackAcceptingController *)self isDone])
  {
    __int16 v36 = _AKLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Approver is reporting as done...", buf, 2u);
    }

    [v8 setWaitForReply:0];
    [(AKCAPiggybackReporter *)self->_piggybackReporter didFinishAccepting];
  }
  objc_initWeak((id *)buf, self);
  double v37 = +[AKPiggybackController sharedController];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10001EE10;
  v44[3] = &unk_100226F90;
  objc_copyWeak(&v46, (id *)buf);
  id v38 = v41;
  id v45 = v38;
  id v39 = [v37 performCircleRequestWithContext:v8 completion:v44];

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);
}

- (id)_acceptSessionForPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AKPiggybackAcceptingController *)self _authKitAccountForPayload:v6];
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10017C9E4(v7, v8);
  }

  id v9 = (objc_class *)sub_1000344B8();
  if (v9) {
    id v9 = (objc_class *)sub_1000346CC();
  }
  id v10 = (KCJoiningAcceptAccountCircleDelegate *)objc_alloc_init(v9);
  circleDelegate = self->_circleDelegate;
  self->_circleDelegate = v10;

  if (sub_1000344B8()) {
    id v12 = sub_100034944();
  }
  else {
    id v12 = 0;
  }
  uint64_t v13 = [v6 clientInfo];
  id v14 = self->_circleDelegate;
  CFStringRef v15 = [v7 accountPropertyForKey:@"DSID"];
  CFStringRef v16 = objc_msgSend(v12, "sessionWithInitialMessage:secretDelegate:circleDelegate:dsid:error:", v13, self, v14, objc_msgSend(v15, "unsignedLongLongValue"), a4);

  return v16;
}

- (id)replyContextWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 replyPayload];
  [v5 setPayload:v6];

  [v5 setWaitForReplyTimeout:1200.0];
  id v7 = +[AKAppleIDPushHelperService sharedService];
  id v8 = [v7 publicAPSTokenString];
  [v5 setPushToken:v8];

  id v9 = [(AKPiggybackAcceptingController *)self _authKitAccountForPayload:v4];

  if (v9)
  {
    id v10 = +[AKAccountManager sharedInstance];
    unsigned int v11 = [v10 hearbeatTokenForAccount:v9];
    [v5 setHeartbeatTokenValue:v11];
  }

  return v5;
}

- (id)_authKitAccountForPayload:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  id v5 = [v3 altDSID];

  id v6 = [v4 authKitAccountWithAltDSID:v5 error:0];

  return v6;
}

+ (BOOL)isInCircle
{
  v2 = +[AKDevice currentDevice];
  unsigned __int8 v3 = [v2 isInCircle];

  return v3;
}

- (BOOL)isDone
{
  return [(KCJoiningAcceptSession *)self->_acceptSession isDone];
}

- (id)secret
{
  [(AKPiggybackAcceptingController *)self _grabLockAssertion];
  unsigned __int8 v3 = [(AKPiggybackAcceptingController *)self _generateSecret];
  id v4 = +[AKAppleIDPushHelperService sharedService];
  id v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 longLongValue]);
  id v6 = [(AKCircleRequestPayload *)self->_initiatingPayload responseMessage];
  [v4 showPigCode:v5 withIncomingMessage:v6];

  return v3;
}

- (int)verificationFailed:(id *)a3
{
  self->_verificationFailed = 1;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSNumber numberWithInteger:self->_verificationAttempts];
    int v10 = 138412290;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to verify requesting secret, attempts: %@", (uint8_t *)&v10, 0xCu);
  }
  int64_t verificationAttempts = self->_verificationAttempts;
  BOOL v7 = verificationAttempts <= 1;
  if (verificationAttempts <= 1) {
    int64_t v8 = verificationAttempts + 1;
  }
  else {
    int64_t v8 = 0;
  }
  self->_int64_t verificationAttempts = v8;
  if (v7) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)accountCode
{
  uint64_t v5 = 0;
  v2 = +[AKAppleIDCodeGenerator generateLoginCode:&v5];
  unsigned __int8 v3 = [v2 stringValue];

  return v3;
}

- (id)_generateSecret
{
  return +[NSString stringWithFormat:@"%06u", arc4random_uniform(0xF423Fu)];
}

- (void)_grabLockAssertion
{
  [(NSLock *)self->_assertionLock lock];
  assertionRef = self->_assertionRef;
  id v4 = _AKLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (assertionRef)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Lock assertion already taken", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accepting session is grabbing lock assertion", buf, 2u);
    }

    v13[0] = @"MKBAssertionKey";
    v13[1] = @"MKBAssertionTimeout";
    v14[0] = @"RemoteProfile";
    v14[1] = &off_10023AF30;
    id v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    *(void *)buf = 0;
    id v6 = (__MKBAssertion *)MKBDeviceLockAssertion();
    self->_assertionRef = v6;
    BOOL v7 = *(void **)buf;
    if (*(void *)buf)
    {
      int64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10017CA80();
      }
    }
    else if (v6)
    {
      +[NSXPCConnection beginTransaction];
      dispatch_time_t v9 = dispatch_time(0, 600000000000);
      int v10 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F64C;
      block[3] = &unk_100226FB8;
      block[4] = self;
      dispatch_after(v9, v10, block);
    }
  }

  [(NSLock *)self->_assertionLock unlock];
}

- (void)_releaseAssertion
{
  unsigned __int8 v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing a lock assertion", v5, 2u);
  }

  [(NSLock *)self->_assertionLock lock];
  assertionRef = self->_assertionRef;
  if (assertionRef)
  {
    CFRelease(assertionRef);
    self->_assertionRef = 0;
  }
  [(NSLock *)self->_assertionLock unlock];
}

- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 circleStep];
  id v6 = [v4 presenceSID];
  unsigned int v7 = [v4 supportsPresence];
  int64_t v8 = _AKLogSystem();
  dispatch_time_t v9 = v8;
  if (v5 != (id)1 || !v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v10 = @"NO";
      int v11 = 138413058;
      id v12 = self;
      __int16 v13 = 2112;
      if (v7) {
        CFStringRef v10 = @"YES";
      }
      CFStringRef v14 = v10;
      __int16 v15 = 2048;
      id v16 = v5;
      __int16 v17 = 2112;
      CFStringRef v18 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: Determined proximity scanner should not be started (wantsPresence: %@, circleStep: %lu, presenceSID: %@)", (uint8_t *)&v11, 0x2Au);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Determined proximity scanner should be started", (uint8_t *)&v11, 0xCu);
  }

  if (!v6)
  {
    dispatch_time_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10017CAE8();
    }
LABEL_13:

    goto LABEL_14;
  }
  [(AKPiggybackAcceptingController *)self _startProximityControllerWithPresenceSID:v6];
LABEL_14:
}

- (void)_startProximityControllerWithPresenceSID:(id)a3
{
  id v4 = a3;
  id v5 = _AKSignpostLogSystem();
  os_signpost_id_t v6 = _AKSignpostCreate();
  uint64_t v8 = v7;

  dispatch_time_t v9 = _AKSignpostLogSystem();
  CFStringRef v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PiggybackingDetectPresenceForAcceptController", " enableTelemetry=YES ", buf, 2u);
  }

  int v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v36 = (AKPiggybackAcceptingController *)v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingDetectPresenceForAcceptController  enableTelemetry=YES ", buf, 0xCu);
  }

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001FCE8;
  v32[3] = &unk_100226FE0;
  v32[4] = v33;
  v32[5] = v6;
  v32[6] = v8;
  id v12 = objc_retainBlock(v32);
  objc_initWeak(&location, self);
  __int16 v13 = [(AKProximityPiggybackEngine *)[AKProximityPiggybackAcceptingEngine alloc] initWithPresenceSID:v4];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001FE68;
  v28[3] = &unk_100227008;
  CFStringRef v14 = v12;
  id v29 = v14;
  objc_copyWeak(&v30, &location);
  [(AKProximityPiggybackAcceptingEngine *)v13 setMatchHandler:v28];
  __int16 v15 = [[AKFuture alloc] initWithMaxWait:@"proximityDetected" description:5.0];
  proximityDetected = self->_proximityDetected;
  self->_proximityDetected = v15;

  __int16 v17 = [[AKProximityController alloc] initWithEngine:v13];
  proximityController = self->_proximityController;
  self->_proximityController = v17;

  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  unsigned int v24 = sub_10001FF7C;
  v25 = &unk_100227008;
  id v19 = v14;
  id v26 = v19;
  objc_copyWeak(&v27, &location);
  [(AKProximityController *)self->_proximityController setInvalidationHandler:&v22];
  v20 = _AKLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v21 = self->_proximityController;
    *(_DWORD *)buf = 138413058;
    __int16 v36 = self;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2160;
    uint64_t v40 = 1752392040;
    __int16 v41 = 2112;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: Setting up proximity controller (%@) with presenceSID (%{mask.hash}@)", buf, 0x2Au);
  }

  [(AKProximityController *)self->_proximityController activate];
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  _Block_object_dispose(v33, 8);
}

- (void)_stopProximityController
{
}

- (void)_checkForProximityIfNeededWithCircleStep:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  proximityController = self->_proximityController;
  uint64_t v8 = _AKLogSystem();
  dispatch_time_t v9 = v8;
  if (a3 == 3 && proximityController)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Determined checking for proximity is needed", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100020238;
    v11[3] = &unk_100227030;
    id v12 = v6;
    [(AKPiggybackAcceptingController *)self _checkForProximityWithCompletion:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v10 = self->_proximityController;
      *(_DWORD *)buf = 138412802;
      CFStringRef v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2112;
      CFStringRef v18 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: Determined checking for proximity is not needed for circleStep (%lu) with controller (%@)", buf, 0x20u);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)_checkForProximityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AKSignpostLogSystem();
  os_signpost_id_t v6 = _AKSignpostCreate();
  uint64_t v8 = v7;

  dispatch_time_t v9 = _AKSignpostLogSystem();
  CFStringRef v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PiggybackingCheckPresenceForAcceptController", " enableTelemetry=YES ", buf, 2u);
  }

  int v11 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingCheckPresenceForAcceptController  enableTelemetry=YES ", buf, 0xCu);
  }

  id v12 = dispatch_get_global_queue(33, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_100020408;
  v14[3] = &unk_100227058;
  os_signpost_id_t v16 = v6;
  uint64_t v17 = v8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, v14);
}

- (KCJoiningAcceptSession)acceptSession
{
  return self->_acceptSession;
}

- (void)setAcceptSession:(id)a3
{
}

- (AKConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_acceptSession, 0);
  objc_storeStrong((id *)&self->_proximityDetected, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_piggybackReporter, 0);
  objc_storeStrong((id *)&self->_assertionLock, 0);
  objc_storeStrong((id *)&self->_circleDelegate, 0);
  objc_storeStrong((id *)&self->_initiatingPayload, 0);

  objc_storeStrong((id *)&self->_lastPayload, 0);
}

@end