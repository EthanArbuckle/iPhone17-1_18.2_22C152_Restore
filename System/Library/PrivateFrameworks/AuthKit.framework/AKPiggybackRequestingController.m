@interface AKPiggybackRequestingController
- (AKAppleIDAuthenticationContext)initiatingContext;
- (AKAuthenticationServerResponse)initialAuthResponse;
- (AKPiggybackRequestingController)initWithServerResponse:(id)a3 andDelegate:(id)a4 piggybackReporter:(id)a5;
- (AKPiggybackRequestingControllerDelegate)delegate;
- (AKProximityController)proximityController;
- (BOOL)_shouldContinueProcessing:(id *)a3;
- (BOOL)isDone;
- (BOOL)processAccountCode:(id)a3 error:(id *)a4;
- (BOOL)unitTestContext;
- (KCJoiningRequestSecretSession)requestSession;
- (NSDictionary)authResults;
- (NSError)escapeHatchError;
- (NSError)escapeHatchTrigger;
- (NSNumber)capturedCode;
- (NSString)initiatingPassword;
- (double)initialHandshakeTimeout;
- (id)_capturedCodeString;
- (id)contextWithIncomingPayload:(id)a3;
- (id)idmsData;
- (id)secret;
- (id)verificationFailed:(BOOL)a3;
- (void)_cacheSecondFactor:(id)a3 codeCaptureError:(id)a4;
- (void)_clearCaptureState;
- (void)_clearSessionState;
- (void)_deliverPushPayload:(id)a3 attachDuplexSession:(BOOL)a4 completion:(id)a5;
- (void)_deliverPushPayload:(id)a3 completion:(id)a4;
- (void)_handleVerificationError:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)_initiatePiggybackingWithCleanSession:(BOOL)a3 withCompletion:(id)a4;
- (void)_processCachedUserInputWithContext:(id)a3 completion:(id)a4;
- (void)_processCodeEntryErrorWithContext:(id)a3 completion:(id)a4;
- (void)_processHandshakeWithContext:(id)a3 handshakeReply:(id)a4 andHandshakeError:(id)a5 withCompletion:(id)a6;
- (void)_promptForSecretWithContext:(id)a3 completion:(id)a4;
- (void)_sendDeviceCancelledReplyWithContext:(id)a3;
- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)_startProximityControllerWithPresenceSID:(id)a3;
- (void)_stopProximityController;
- (void)_stopProximityControllerIfNeededWithPushPayload:(id)a3;
- (void)initiatePiggybackingWithCompletion:(id)a3;
- (void)processPushPayload:(id)a3 completion:(id)a4;
- (void)replyWithContext:(id)a3 withCompletion:(id)a4;
- (void)setAuthResults:(id)a3;
- (void)setCapturedCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEscapeHatchError:(id)a3;
- (void)setEscapeHatchTrigger:(id)a3;
- (void)setInitialHandshakeTimeout:(double)a3;
- (void)setInitiatingContext:(id)a3;
- (void)setInitiatingPassword:(id)a3;
- (void)setProximityController:(id)a3;
- (void)setRequestSession:(id)a3;
- (void)setUnitTestContext:(BOOL)a3;
@end

@implementation AKPiggybackRequestingController

- (AKPiggybackRequestingController)initWithServerResponse:(id)a3 andDelegate:(id)a4 piggybackReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPiggybackRequestingController;
  v12 = [(AKPiggybackRequestingController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_initialAuthResponse, a3);
    objc_storeStrong((id *)&v13->_piggybackReporter, a5);
    v13->_initialHandshakeTimeout = 600.0;
    v13->_unitTestContext = 0;
    v13->_retryCount = 0;
  }

  return v13;
}

- (void)initiatePiggybackingWithCompletion:(id)a3
{
}

- (void)_initiatePiggybackingWithCleanSession:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = _AKSignpostLogSystem();
  os_signpost_id_t v8 = _AKSignpostCreate();
  uint64_t v10 = v9;

  id v11 = _AKSignpostLogSystem();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PiggybackingRequestingInitiateSession", " CleanSession=%{public,signpost.telemetry:number1,name=CleanSession}d  enableTelemetry=YES ", buf, 8u);
  }

  v13 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingRequestingInitiateSession  CleanSession=%{public,signpost.telemetry:number1,name=CleanSession}d  enableTelemetry=YES ", buf, 0x12u);
  }

  if (!v6) {
    sub_10018611C();
  }
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100066534;
  v78[3] = &unk_100229220;
  os_signpost_id_t v80 = v8;
  uint64_t v81 = v10;
  id v50 = v6;
  id v79 = v50;
  v51 = objc_retainBlock(v78);
  v14 = [(AKPiggybackRequestingController *)self initialAuthResponse];
  objc_super v15 = [v14 transactionId];
  v52 = +[NSString stringWithFormat:@"%@-%lu", v15, self->_retryCount];

  v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v52;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Initiating a piggybacking flow for transaction id: %@", buf, 0xCu);
  }

  if (v4) {
    [(AKPiggybackRequestingController *)self _clearSessionState];
  }
  v17 = _AKSignpostLogSystem();
  os_signpost_id_t v18 = _AKSignpostCreate();

  v19 = _AKSignpostLogSystem();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PiggyInitialMessageData", " enableTelemetry=YES ", buf, 2u);
  }

  v21 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyInitialMessageData  enableTelemetry=YES ", buf, 0xCu);
  }

  v22 = [(AKPiggybackRequestingController *)self requestSession];
  id v77 = 0;
  v23 = [v22 initialMessage:&v77];
  id v24 = v77;

  uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
  v26 = _AKSignpostLogSystem();
  v27 = v26;
  if (v18 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
  {
    unsigned int v28 = [v24 code];
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v28;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, v18, "PiggyInitialMessageData", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v29 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v30 = [v24 code];
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    LODWORD(v83) = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggyInitialMessageData  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  if (v23)
  {
    v31 = objc_opt_new();
    [v31 setClientInfo:v23];
    [v31 setTransactionId:v52];
    v32 = [(AKPiggybackRequestingController *)self initialAuthResponse];
    v33 = [v32 altDSID];
    [v31 setAltDSID:v33];

    v34 = [(AKPiggybackRequestingController *)self contextWithIncomingPayload:v31];
    id v35 = objc_alloc_init((Class)NSCondition);
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    char v76 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v83 = sub_10000F8E0;
    v84 = sub_10000F7C0;
    id v85 = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = sub_10000F8E0;
    v73[4] = sub_10000F7C0;
    id v74 = 0;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1000666E0;
    v70[3] = &unk_100226BD8;
    v70[4] = self;
    id v36 = v34;
    id v71 = v36;
    id v37 = v35;
    id v72 = v37;
    v38 = objc_retainBlock(v70);
    v39 = v38;
    if (self->_unitTestContext)
    {
      dispatch_time_t v40 = dispatch_time(0, 1000000000);
      v41 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000667F4;
      block[3] = &unk_100228040;
      id v69 = v39;
      dispatch_after(v40, v41, block);
    }
    else
    {
      ((void (*)(void *))v38[2])(v38);
    }
    objc_msgSend(v36, "set_notifyOfTimeout:", 0);
    [v36 setWaitForReplyTimeout:self->_initialHandshakeTimeout];
    v42 = +[AKPiggybackController sharedController];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100066804;
    v63[3] = &unk_100229248;
    v63[4] = self;
    id v43 = v37;
    id v64 = v43;
    v65 = v75;
    v66 = buf;
    v67 = v73;
    v44 = [v42 performCircleRequestWithContext:v36 completion:v63];

    v45 = dispatch_get_global_queue(17, 0);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100066A68;
    v53[3] = &unk_100229270;
    id v54 = v43;
    v55 = self;
    v60 = v75;
    id v57 = v36;
    id v58 = v39;
    id v56 = v44;
    v61 = buf;
    v62 = v73;
    v59 = v51;
    id v46 = v36;
    id v47 = v44;
    id v48 = v39;
    id v49 = v43;
    dispatch_async(v45, v53);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v75, 8);
  }
  else
  {
    ((void (*)(void *, void, id))v51[2])(v51, 0, v24);
  }
}

- (void)_processHandshakeWithContext:(id)a3 handshakeReply:(id)a4 andHandshakeError:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, NSDictionary *, NSError *))a6;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting to process handshake results", buf, 2u);
  }

  if (self->_authResults)
  {
    objc_super v15 = _AKLogSystem();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      v13[2](v13, self->_authResults, self->_escapeHatchError);
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v16 = "We got results, finish the flow";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    goto LABEL_7;
  }
  if (self->_escapeHatchError)
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "User elected to escape before handshake completed", buf, 2u);
    }

    if ([(NSError *)self->_escapeHatchError ak_isUserTryAgainError])
    {
      ++self->_retryCount;
      [(AKPiggybackRequestingController *)self _initiatePiggybackingWithCleanSession:1 withCompletion:v13];
      goto LABEL_8;
    }
    objc_super v15 = _AKLogSystem();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v16 = "We did not capture a code, completing with escape results";
    goto LABEL_6;
  }
  os_signpost_id_t v18 = _AKLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Handshake failed with error: %@", buf, 0xCu);
    }

    uint64_t v20 = AKAppleIDAuthenticationErrorDomain;
    NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    id v32 = v12;
    v21 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v22 = +[NSError errorWithDomain:v20 code:-7063 userInfo:v21];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100067134;
    v27[3] = &unk_100227618;
    v27[4] = self;
    id v28 = v10;
    id v29 = v12;
    unsigned int v30 = v13;
    [(AKPiggybackRequestingController *)self _handleVerificationError:v22 withContext:v28 completion:v27];
  }
  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Code collected, starting to wait for: %@", buf, 0xCu);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100067148;
    v23[3] = &unk_100229298;
    v23[4] = self;
    id v24 = v10;
    id v25 = v11;
    v26 = v13;
    [(AKPiggybackRequestingController *)self processPushPayload:v25 completion:v23];
  }
LABEL_8:
}

- (void)_clearSessionState
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing requesting controller state", v6, 2u);
  }

  requestSession = self->_requestSession;
  self->_requestSession = 0;

  escapeHatchError = self->_escapeHatchError;
  self->_escapeHatchError = 0;

  [(AKPiggybackRequestingController *)self _clearCaptureState];
}

- (void)processPushPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  id v12 = _AKSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v37) = [v6 circleStep];
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PiggybackingRequestingProcessPushPayload", " CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ", buf, 8u);
  }

  v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [v6 circleStep];
    *(_DWORD *)buf = 134218240;
    os_signpost_id_t v37 = v9;
    __int16 v38 = 1026;
    unsigned int v39 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingRequestingProcessPushPayload  CircleStep=%{public,signpost.telemetry:number1,name=CircleStep}d  enableTelemetry=YES ", buf, 0x12u);
  }

  if (!v7) {
    sub_100186148();
  }
  v16 = [v6 serverInfo];
  latestIDMSData = self->_latestIDMSData;
  self->_latestIDMSData = v16;

  os_signpost_id_t v18 = [v6 replyPayload];
  BOOL v19 = [(AKPiggybackRequestingController *)self contextWithIncomingPayload:v18];
  currentReplyContext = self->_currentReplyContext;
  self->_currentReplyContext = v19;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100067648;
  v32[3] = &unk_1002292C0;
  os_signpost_id_t v34 = v9;
  uint64_t v35 = v11;
  id v21 = v7;
  id v33 = v21;
  v22 = objc_retainBlock(v32);
  [(AKPiggybackRequestingController *)self _startProximityControllerIfNeededWithPushPayload:v6];
  [(AKPiggybackRequestingController *)self _stopProximityControllerIfNeededWithPushPayload:v6];
  if ([v6 clientErrorCode])
  {
    if ([v6 clientErrorCode] == (id)-9005)
    {
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100186174();
      }

      [(AKPiggybackRequestingController *)self _deliverPushPayload:v6 attachDuplexSession:0 completion:v22];
    }
    else
    {
      if ([v6 clientErrorCode] == (id)-9003) {
        uint64_t v24 = -7036;
      }
      else {
        uint64_t v24 = -7001;
      }
      id v25 = +[NSError ak_errorWithCode:v24];
      v26 = self->_currentReplyContext;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000677E0;
      v28[3] = &unk_100227618;
      v28[4] = self;
      id v29 = v25;
      id v30 = v6;
      NSErrorUserInfoKey v31 = v22;
      id v27 = v25;
      [(AKPiggybackRequestingController *)self _handleVerificationError:v27 withContext:v26 completion:v28];
    }
  }
  else
  {
    [(AKPiggybackRequestingController *)self _deliverPushPayload:v6 completion:v22];
  }
}

- (void)_deliverPushPayload:(id)a3 completion:(id)a4
{
}

- (void)_deliverPushPayload:(id)a3 attachDuplexSession:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  os_signpost_id_t v8 = (void (**)(id, BOOL, id))a5;
  os_signpost_id_t v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting to process request message", buf, 2u);
  }

  uint64_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100186338(self, v7);
  }

  uint64_t v11 = _AKSignpostLogSystem();
  os_signpost_id_t v12 = _AKSignpostCreate();

  v13 = _AKSignpostLogSystem();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PiggyClientInfoForRequestController", " enableTelemetry=YES ", buf, 2u);
  }

  unsigned int v15 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v60 = (AKPiggybackRequestingController *)v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyClientInfoForRequestController  enableTelemetry=YES ", buf, 0xCu);
  }

  v16 = [(AKPiggybackRequestingController *)self requestSession];
  id v54 = v7;
  v17 = [v7 clientInfo];
  id v56 = 0;
  os_signpost_id_t v18 = [v16 processMessage:v17 error:&v56];
  id v19 = v56;
  p_currentReplyContext = &self->_currentReplyContext;
  id v21 = [(AKCircleRequestContext *)self->_currentReplyContext payload];
  [v21 setClientInfo:v18];

  uint64_t Nanoseconds = _AKSignpostGetNanoseconds();
  v23 = _AKSignpostLogSystem();
  uint64_t v24 = v23;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    unsigned int v25 = [v19 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v60) = v25;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v12, "PiggyClientInfoForRequestController", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v26 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v27 = [v19 code];
    *(_DWORD *)buf = 134218496;
    v60 = (AKPiggybackRequestingController *)v12;
    __int16 v61 = 2048;
    double v62 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v63 = 1026;
    unsigned int v64 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:PiggyClientInfoForRequestController  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  id v28 = _AKLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_100186284(self, (id *)&self->_currentReplyContext);
  }

  if ([(AKPiggybackRequestingController *)self isDone])
  {
    id v29 = _AKLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requesting session indicated that we are DONE", buf, 2u);
    }

    id v55 = 0;
    BOOL v30 = [(AKPiggybackRequestingController *)self _shouldContinueProcessing:&v55];
    id v31 = v55;
    if (!v30)
    {
      +[AKCAAuthEventReporter reportAuthEventOfType:AKAuthEventType_SECOND_FACTOR_PIGGYBACK_FAILURE success:0 error:v31];
LABEL_39:
      v8[2](v8, v30, v31);

      goto LABEL_40;
    }
    if (a4)
    {
      id v32 = [(KCJoiningRequestSecretSession *)self->_requestSession session];
      requestSession = self->_requestSession;
      self->_requestSession = 0;

      if (v32)
      {
        os_signpost_id_t v34 = _AKLogSystem();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Passing duplex session", buf, 2u);
        }

        v57[0] = AKAuthenticationDuplexSessionKey;
        v57[1] = AKAuthenticationCircleContinuationContextKey;
        currentReplyContext = self->_currentReplyContext;
        v58[0] = v32;
        v58[1] = currentReplyContext;
        id v36 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        id v37 = [(NSDictionary *)self->_authResults mutableCopy];
        [v37 addEntriesFromDictionary:v36];
        __int16 v38 = (NSDictionary *)[v37 copy];
        authResults = self->_authResults;
        self->_authResults = v38;

        latestIDMSData = self->_latestIDMSData;
        v41 = [(AKCircleRequestContext *)self->_currentReplyContext payload];
        [v41 setServerInfo:latestIDMSData];

        uint64_t v42 = 1;
LABEL_38:

        +[AKCAAuthEventReporter reportAuthEventOfType:AKAuthEventType_SECOND_FACTOR_PIGGYBACK_TRANSITION success:v42 error:v31];
        goto LABEL_39;
      }
    }
    else
    {
      v51 = _AKLogSystem();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = self;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@: Will not attach duplex session to authentication results", buf, 0xCu);
      }

      v52 = self->_requestSession;
      self->_requestSession = 0;
    }
    id v36 = _AKLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1001861DC();
    }
    uint64_t v42 = 0;
    id v32 = 0;
    goto LABEL_38;
  }
  id v43 = [(AKCircleRequestContext *)*p_currentReplyContext payload];
  v44 = [v43 clientInfo];

  if (v44)
  {
    [(AKPiggybackRequestingController *)self replyWithContext:self->_currentReplyContext withCompletion:v8];
  }
  else
  {
    v45 = _AKLogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_10018621C();
    }

    id v46 = [(AKCircleRequestContext *)*p_currentReplyContext payload];
    [v46 setClientErrorCode:-9001];

    [(AKCircleRequestContext *)*p_currentReplyContext setWaitForReply:0];
    id v47 = +[AKPiggybackController sharedController];
    id v48 = [v47 performCircleRequestWithContext:*p_currentReplyContext completion:0];

    id v49 = objc_msgSend(v19, "ac_secureCodingError");
    id v50 = +[NSError ak_errorWithCode:-7001 underlyingError:v49];
    v8[2](v8, 0, v50);
  }
LABEL_40:
}

- (void)_sendDeviceCancelledReplyWithContext:(id)a3
{
  id v8 = a3;
  [(AKCAPiggybackReporter *)self->_piggybackReporter didCancelRequesting];
  BOOL v4 = [v8 payload];
  [v4 setClientErrorCode:-9004];

  v5 = [v8 payload];
  [v5 setClientInfo:0];

  [v8 setWaitForReply:0];
  id v6 = +[AKPiggybackController sharedController];
  id v7 = [v6 performCircleRequestWithContext:v8 completion:0];
}

- (void)replyWithContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKSignpostLogSystem();
  os_signpost_id_t v9 = _AKSignpostCreate();
  uint64_t v11 = v10;

  os_signpost_id_t v12 = _AKSignpostLogSystem();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PiggybackingRequestingReplyWithContext", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggybackingRequestingReplyWithContext  enableTelemetry=YES ", buf, 0xCu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100068390;
  v22[3] = &unk_1002292C0;
  os_signpost_id_t v24 = v9;
  uint64_t v25 = v11;
  id v23 = v7;
  id v15 = v7;
  v16 = objc_retainBlock(v22);
  v17 = +[AKPiggybackController sharedController];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006852C;
  v20[3] = &unk_1002292E8;
  v20[4] = self;
  id v21 = v16;
  os_signpost_id_t v18 = v16;
  id v19 = [v17 performCircleRequestWithContext:v6 completion:v20];
}

- (id)contextWithIncomingPayload:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setPayload:v4];

  id v6 = [(AKAuthenticationServerResponse *)self->_initialAuthResponse masterToken];
  id v7 = [v6 stringValue];
  [v5 setIdentityTokenValue:v7];

  [v5 setAuthContext:self->_initiatingContext];

  return v5;
}

- (id)idmsData
{
  return self->_latestIDMSData;
}

- (BOOL)_shouldContinueProcessing:(id *)a3
{
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1001863DC();
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  os_signpost_id_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10000F8E0;
  id v21 = sub_10000F7C0;
  id v22 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100068888;
  v14[3] = &unk_100229310;
  v14[4] = self;
  v16 = &v17;
  id v8 = v6;
  id v15 = v8;
  [WeakRetained piggyback:self shouldContinueWithCompletion:v14];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    os_signpost_id_t v9 = (void *)v18[5];
    if (v9) {
      *a3 = v9;
    }
  }
  uint64_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = self->_authResults != 0;
    *(_DWORD *)buf = 67109120;
    BOOL v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Should continue: %d", buf, 8u);
  }

  BOOL v12 = self->_authResults != 0;
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)isDone
{
  v2 = [(AKPiggybackRequestingController *)self requestSession];
  unsigned __int8 v3 = [v2 isDone];

  return v3;
}

- (KCJoiningRequestSecretSession)requestSession
{
  unsigned __int8 v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10018641C(self, v3);
  }

  requestSession = self->_requestSession;
  if (!requestSession)
  {
    if (sub_1000344B8()) {
      id v5 = sub_100034A80();
    }
    else {
      id v5 = 0;
    }
    dispatch_semaphore_t v6 = [(AKPiggybackRequestingController *)self initialAuthResponse];
    id v7 = [v6 dsid];
    objc_msgSend(v5, "sessionWithSecretDelegate:dsid:error:", self, objc_msgSend(v7, "unsignedLongLongValue"), 0);
    id v8 = (KCJoiningRequestSecretSession *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v9 = self->_requestSession;
    self->_requestSession = v8;

    requestSession = self->_requestSession;
  }

  return requestSession;
}

- (id)secret
{
  unsigned __int8 v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    capturedCode = self->_capturedCode;
    escapeHatchError = self->_escapeHatchError;
    int v8 = 138412546;
    os_signpost_id_t v9 = capturedCode;
    __int16 v10 = 2112;
    BOOL v11 = escapeHatchError;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Using a previously cached code or error: %@ - %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_semaphore_t v6 = [(AKPiggybackRequestingController *)self _capturedCodeString];

  return v6;
}

- (id)verificationFailed:(BOOL)a3
{
  return [(AKPiggybackRequestingController *)self secret];
}

- (BOOL)processAccountCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1001864C8();
  }

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = sub_10000F8E0;
  uint64_t v25 = sub_10000F7C0;
  id v26 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  __int16 v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 longLongValue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100068E18;
  v17[3] = &unk_100229338;
  uint64_t v19 = &v27;
  uint64_t v20 = &v21;
  BOOL v11 = v8;
  os_signpost_id_t v18 = v11;
  [WeakRetained piggyback:self validateSecurityCode:v10 completion:v17];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *((unsigned __int8 *)v28 + 24);
    uint64_t v14 = v22[5];
    *(_DWORD *)buf = 67109378;
    int v32 = v13;
    __int16 v33 = 2112;
    uint64_t v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Code validated with result: %d - %@", buf, 0x12u);
  }

  if (a4) {
    *a4 = (id) v22[5];
  }
  BOOL v15 = *((unsigned char *)v28 + 24) != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)_handleVerificationError:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100068FC8;
  v14[3] = &unk_100229360;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [WeakRetained piggyback:self handleVerificationWithError:v10 completion:v14];
}

- (void)_promptForSecretWithContext:(id)a3 completion:(id)a4
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
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PiggyCodeCollect", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v14 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PiggyCodeCollect  enableTelemetry=YES ", buf, 0xCu);
  }

  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Prompting user for piggybacking code", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006922C;
  v19[3] = &unk_100229388;
  os_signpost_id_t v22 = v9;
  uint64_t v23 = v11;
  v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v17 = v7;
  id v18 = v6;
  [WeakRetained piggyback:self promptForRandomCodeWithCompletion:v19];
}

- (void)_processCachedUserInputWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(AKAppleIDAuthenticationContext *)self->_initiatingContext piggybackingForTrustedDevice]&& self->_escapeHatchTrigger)
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      escapeHatchTrigger = self->_escapeHatchTrigger;
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = escapeHatchTrigger;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received error %@, sending cancelled reply...", buf, 0xCu);
    }

    [(AKPiggybackRequestingController *)self _sendDeviceCancelledReplyWithContext:v6];
    objc_storeStrong((id *)&self->_escapeHatchError, self->_escapeHatchTrigger);
    v7[2](v7);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006958C;
    v10[3] = &unk_1002287C0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(AKPiggybackRequestingController *)self _processCodeEntryErrorWithContext:v11 completion:v10];
  }
}

- (void)_processCodeEntryErrorWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, NSError *))a4;
  escapeHatchTrigger = self->_escapeHatchTrigger;
  if (escapeHatchTrigger)
  {
    if ([(NSError *)escapeHatchTrigger ak_isUserCancelError])
    {
      [(AKPiggybackRequestingController *)self _sendDeviceCancelledReplyWithContext:v6];
      v7[2](v7, 0, self->_escapeHatchTrigger);
    }
    else
    {
      if ([(NSError *)self->_escapeHatchTrigger code] == -7035)
      {
        os_signpost_id_t v9 = _AKLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1001865A4((id *)&self->_escapeHatchTrigger, v9);
        }

        [(AKPiggybackRequestingController *)self _sendDeviceCancelledReplyWithContext:v6];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = self->_escapeHatchTrigger;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100069844;
      v12[3] = &unk_100227DB0;
      v12[4] = self;
      id v13 = v7;
      [WeakRetained piggyback:self handleEscapeHatchError:v11 completion:v12];
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (id)_capturedCodeString
{
  return +[NSString stringWithFormat:@"%06lu", [(NSNumber *)self->_capturedCode unsignedIntegerValue]];
}

- (void)_cacheSecondFactor:(id)a3 codeCaptureError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AKPiggybackRequestingController *)self _clearCaptureState];
  if (v6)
  {
    id v8 = (NSNumber *)v6;
    capturedCode = self->_capturedCode;
    self->_capturedCode = v8;
  }
  else
  {
    if (v7)
    {
      uint64_t v10 = (NSError *)v7;
    }
    else
    {
      uint64_t v10 = +[NSError ak_errorWithCode:-7035];
    }
    capturedCode = self->_escapeHatchTrigger;
    self->_escapeHatchTrigger = v10;
  }

  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_capturedCode;
    escapeHatchTrigger = self->_escapeHatchTrigger;
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2112;
    id v17 = escapeHatchTrigger;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Captured code: %@ - %@", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_clearCaptureState
{
  capturedCode = self->_capturedCode;
  self->_capturedCode = 0;

  escapeHatchTrigger = self->_escapeHatchTrigger;
  self->_escapeHatchTrigger = 0;
}

- (void)_startProximityControllerIfNeededWithPushPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 circleStep];
  id v6 = [v4 presenceSID];
  unsigned int v7 = [(AKAuthenticationServerResponse *)self->_initialAuthResponse allowPiggybackingPresence];
  id v8 = _AKLogSystem();
  os_signpost_id_t v9 = v8;
  if (v5 || !v7)
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
      id v18 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: Determined proximity advertiser should not be started (wantsPresence: %@, circleStep: %lu, presenceSID: %@)", (uint8_t *)&v11, 0x2Au);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Determined proximity advertiser should be started", (uint8_t *)&v11, 0xCu);
  }

  if (!v6)
  {
    os_signpost_id_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018663C();
    }
LABEL_13:

    goto LABEL_14;
  }
  [(AKPiggybackRequestingController *)self _startProximityControllerWithPresenceSID:v6];
LABEL_14:
}

- (void)_stopProximityControllerIfNeededWithPushPayload:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 circleStep];
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4
    && ([(AKPiggybackRequestingController *)self proximityController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      os_signpost_id_t v9 = self;
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Determined proximity advertiser should be stopped (circleStep: %lu)", (uint8_t *)&v8, 0x16u);
    }

    [(AKPiggybackRequestingController *)self _stopProximityController];
  }
  else
  {
    unsigned int v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001866C0(self, v4, v7);
    }
  }
}

- (void)_startProximityControllerWithPresenceSID:(id)a3
{
  id v4 = a3;
  id v5 = [(AKProximityPiggybackEngine *)[AKProximityPiggybackRequestingEngine alloc] initWithPresenceSID:v4];
  id v6 = [[AKProximityController alloc] initWithEngine:v5];
  [(AKPiggybackRequestingController *)self setProximityController:v6];

  unsigned int v7 = [(AKPiggybackRequestingController *)self proximityController];
  [v7 setInvalidationHandler:&stru_1002293A8];

  int v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v9 = [(AKPiggybackRequestingController *)self proximityController];
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    __int16 v15 = 2160;
    uint64_t v16 = 1752392040;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting up proximity controller (%@) with presenceSID (%{mask.hash}@)", (uint8_t *)&v11, 0x2Au);
  }
  __int16 v10 = [(AKPiggybackRequestingController *)self proximityController];
  [v10 activate];
}

- (void)_stopProximityController
{
  unsigned __int8 v3 = [(AKPiggybackRequestingController *)self proximityController];

  id v4 = _AKLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AKPiggybackRequestingController: Invalidating proximity controller.", v7, 2u);
    }

    id v6 = [(AKPiggybackRequestingController *)self proximityController];
    [v6 invalidate];

    [(AKPiggybackRequestingController *)self setProximityController:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1001867C0();
    }
  }
}

- (AKPiggybackRequestingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKPiggybackRequestingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAppleIDAuthenticationContext)initiatingContext
{
  return self->_initiatingContext;
}

- (void)setInitiatingContext:(id)a3
{
}

- (NSString)initiatingPassword
{
  return self->_initiatingPassword;
}

- (void)setInitiatingPassword:(id)a3
{
}

- (AKAuthenticationServerResponse)initialAuthResponse
{
  return self->_initialAuthResponse;
}

- (void)setRequestSession:(id)a3
{
}

- (NSNumber)capturedCode
{
  return self->_capturedCode;
}

- (void)setCapturedCode:(id)a3
{
}

- (NSError)escapeHatchTrigger
{
  return self->_escapeHatchTrigger;
}

- (void)setEscapeHatchTrigger:(id)a3
{
}

- (NSError)escapeHatchError
{
  return self->_escapeHatchError;
}

- (void)setEscapeHatchError:(id)a3
{
}

- (NSDictionary)authResults
{
  return self->_authResults;
}

- (void)setAuthResults:(id)a3
{
}

- (BOOL)unitTestContext
{
  return self->_unitTestContext;
}

- (void)setUnitTestContext:(BOOL)a3
{
  self->_unitTestContext = a3;
}

- (double)initialHandshakeTimeout
{
  return self->_initialHandshakeTimeout;
}

- (void)setInitialHandshakeTimeout:(double)a3
{
  self->_initialHandshakeTimeout = a3;
}

- (AKProximityController)proximityController
{
  return self->_proximityController;
}

- (void)setProximityController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong((id *)&self->_authResults, 0);
  objc_storeStrong((id *)&self->_escapeHatchError, 0);
  objc_storeStrong((id *)&self->_escapeHatchTrigger, 0);
  objc_storeStrong((id *)&self->_capturedCode, 0);
  objc_storeStrong((id *)&self->_requestSession, 0);
  objc_storeStrong((id *)&self->_initialAuthResponse, 0);
  objc_storeStrong((id *)&self->_initiatingPassword, 0);
  objc_storeStrong((id *)&self->_initiatingContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_piggybackReporter, 0);
  objc_storeStrong((id *)&self->_currentReplyContext, 0);

  objc_storeStrong((id *)&self->_latestIDMSData, 0);
}

@end