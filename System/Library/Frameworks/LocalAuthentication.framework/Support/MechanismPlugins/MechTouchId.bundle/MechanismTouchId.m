@interface MechanismTouchId
- (BOOL)_containsAHPModeFUS:(id)a3;
- (BOOL)_exceededFailureLimit;
- (BOOL)_shouldFailForUnboundMatches;
- (BOOL)_shouldShowUIBeforeFailure;
- (BOOL)hasUI;
- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4;
- (BOOL)pause:(BOOL)a3 forEvent:(int64_t)a4 error:(id *)a5;
- (LARemoteUI)remoteUiDelegate;
- (MechanismTouchId)initWithParams:(id)a3 request:(id)a4;
- (id)currentMatchingOperationUserId;
- (void)_cancelOperation:(id)a3;
- (void)_finishFingerDetectPhase;
- (void)_matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)_operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)_operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)_operation:(id)a3 stateChanged:(int64_t)a4;
- (void)_setFingerDetectTimeout;
- (void)_startBiometry;
- (void)_startBiometryMain;
- (void)_startFingerDetectPhase;
- (void)_startMatching;
- (void)_stopBiometry:(BOOL)a3;
- (void)matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (void)setHasUI:(BOOL)a3;
- (void)setRemoteUiDelegate:(id)a3;
- (void)unEnrolledWithError:(id)a3;
- (void)willFinish;
@end

@implementation MechanismTouchId

- (MechanismTouchId)initWithParams:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"AcmContextRecord"];
  v9 = [v7 objectForKeyedSubscript:@"EvaluationMode"];
  id v10 = [v9 integerValue];
  v11 = [v7 objectForKeyedSubscript:@"UserId"];

  v14.receiver = self;
  v14.super_class = (Class)MechanismTouchId;
  v12 = [(MechanismTouchId *)&v14 initWithEventIdentifier:1 remoteViewController:1 acmContextRecord:v8 request:v6 evaluationMode:v10 userId:v11];

  return v12;
}

- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4
{
  id v7 = (char *)[(MechanismTouchId *)self evaluationMode];
  if (!v7)
  {
    objc_super v14 = +[BiometryHelper touchIdInstance];
    v15 = [(MechanismTouchId *)self userId];
    unsigned int v16 = [v14 isEnrolled:v15 error:a4];

    if (!v16) {
      return 0;
    }
    v17 = +[BiometryHelper touchIdInstance];
    v18 = [(MechanismTouchId *)self userId];
    v19 = [(MechanismTouchId *)self request];
    unsigned __int8 v20 = [v17 isLockedOutForUser:v18 request:v19 error:a4];

    if (v20) {
      return 0;
    }
LABEL_8:
    v21 = +[LAPasscodeHelper sharedInstance];
    v22 = [(MechanismTouchId *)self userId];
    unsigned int v23 = objc_msgSend(v21, "isPasscodeSetForUser:error:", objc_msgSend(v22, "unsignedIntValue"), a4);

    if (v23)
    {
      v24.receiver = self;
      v24.super_class = (Class)MechanismTouchId;
      return [(MechanismTouchId *)&v24 isAvailableForPurpose:a3 error:a4];
    }
    return 0;
  }
  if (v7 != (unsigned char *)&dword_0 + 1) {
    goto LABEL_8;
  }
  v8 = +[BiometryHelper touchIdInstance];
  unsigned int v9 = [v8 isAnyUserEnrolledWithAdminRole:0 error:a4];

  BOOL result = 0;
  if (v9)
  {
    v11 = +[BiometryHelper touchIdInstance];
    v12 = [(MechanismTouchId *)self request];
    unsigned __int8 v13 = [v11 isNotLockedOutForAnyUserWithAdminRole:0 request:v12 error:a4];

    BOOL result = 0;
    if ((v13 & 1) == 0) {
      goto LABEL_8;
    }
  }
  return result;
}

- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (![(MechanismTouchId *)self _containsAHPModeFUS:v10])
  {
    uint64_t v11 = [(MechanismTouchId *)self fenceReplyWithTouchIdAssertions:v8];

    id v8 = (id)v11;
  }
  id v12 = objc_retainBlock(v8);

  v19.receiver = self;
  v19.super_class = (Class)MechanismTouchId;
  [(MechanismTouchId *)&v19 runWithHints:v10 eventsDelegate:v9 reply:v12];

  unsigned __int8 v13 = +[BiometryHelper touchIdInstance];
  objc_super v14 = [v13 device];
  touchIdDevice = self->_touchIdDevice;
  self->_touchIdDevice = v14;

  [(MechanismTouchId *)self setFailures:0];
  unsigned int v16 = [(MechanismTouchId *)self policyOptions];
  v17 = [v16 objectForKey:&off_8500];
  [(MechanismTouchId *)self setFailureLimit:v17];

  v18 = [(MechanismTouchId *)self failureLimit];

  if (!v18) {
    [(MechanismTouchId *)self setFailureLimit:&off_8518];
  }
  [(MechanismTouchId *)self _startBiometryMain];
}

- (void)_startBiometryMain
{
}

- (BOOL)_containsAHPModeFUS:(id)a3
{
  return 0;
}

- (BOOL)_exceededFailureLimit
{
  v3 = [(MechanismTouchId *)self failureLimit];

  if (!v3) {
    return 0;
  }
  v4 = (char *)[(MechanismTouchId *)self failures] + 1;
  [(MechanismTouchId *)self setFailures:v4];
  v5 = [(MechanismTouchId *)self failureLimit];
  BOOL v6 = v4 > [v5 unsignedIntegerValue];

  return v6;
}

- (BOOL)_shouldShowUIBeforeFailure
{
  unsigned int v3 = [(MechanismTouchId *)self isRunningDTOPolicy];
  if (v3)
  {
    v4 = [(MechanismTouchId *)self policyOptions];
    v5 = [v4 objectForKeyedSubscript:&off_8530];
    unsigned int v6 = [v5 BOOLValue];

    if ([(MechanismTouchId *)self biolockout])
    {
      if (((![(MechanismTouchId *)self hasUI] | v6) & 1) == 0)
      {
        LOBYTE(v3) = [(MechanismTouchId *)self isFallbackVisible] ^ 1;
        return v3;
      }
    }
    else if (([(MechanismTouchId *)self willTryToRecover] & 1) == 0)
    {
      LOBYTE(v3) = [(MechanismTouchId *)self hasUI] & (v6 ^ 1);
      return v3;
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_shouldFailForUnboundMatches
{
  return 1;
}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_37E0;
  v10[3] = &unk_81C0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(MechanismTouchId *)self dispatchAsyncOnServerQueueIfRunning:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identity];

  id v9 = [(MechanismTouchId *)self request];
  id v10 = [v9 log];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138544386;
    v82 = self;
    __int16 v83 = 2112;
    id v84 = v6;
    __int16 v85 = 1024;
    unsigned int v86 = [v7 unlocked];
    __int16 v87 = 1024;
    unsigned int v88 = [v7 credentialAdded];
    __int16 v89 = 1024;
    unsigned int v90 = [v7 resultIgnored];
    id v12 = "%{public}@ has matched by %@ (unlocked:%d, credential:%d, resultIgnored:%d)";
    id v13 = v10;
    uint32_t v14 = 40;
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    v82 = self;
    __int16 v83 = 2112;
    id v84 = v6;
    __int16 v85 = 1024;
    unsigned int v86 = [v7 lockoutState];
    id v12 = "%{public}@ has received no-match from %@ (lockout state:%d)";
    id v13 = v10;
    uint32_t v14 = 28;
  }
  _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_7:

  v15 = [(MechanismTouchId *)self request];
  unsigned int v16 = [v15 analytics];
  v17 = [v7 identity];
  objc_msgSend(v16, "authenticationAttempt:event:", v17 == 0, -[MechanismTouchId eventIdentifier](self, "eventIdentifier"));

  v79 = &off_8548;
  unsigned __int8 v18 = [v7 resultIgnored];
  if (v18)
  {
    uint64_t v19 = 10;
  }
  else
  {
    v17 = [v7 identity];
    if (v17) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 3;
    }
  }
  unsigned __int8 v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19, v6);
  v80 = v20;
  v21 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v74 = +[NSMutableDictionary dictionaryWithDictionary:v21];

  if ((v18 & 1) == 0) {
  v22 = (char *)[v7 lockoutState];
  }
  BOOL v23 = [(BKMatchTouchIDOperation *)self->_matchOperation purpose] == (char *)&dword_0 + 2
     || [(BKMatchTouchIDOperation *)self->_matchOperation purpose] == &dword_4;
  objc_super v24 = (char *)[v7 lockoutState];
  BOOL v25 = v22 != (unsigned char *)&dword_0 + 1 && v23;
  if (v24 == (unsigned char *)&dword_4 + 1) {
    BOOL v26 = v25;
  }
  else {
    BOOL v26 = v22 != (unsigned char *)&dword_0 + 1;
  }
  v27 = [(BKMatchTouchIDOperation *)self->_matchOperation userID];
  if (!v27)
  {
    if ([v7 lockoutState] == (char *)&dword_4 + 2 && v26) {
      goto LABEL_25;
    }
LABEL_30:
    uint64_t v34 = 0;
    v33 = 0;
    v32 = v74;
    goto LABEL_31;
  }

  if (!v26) {
    goto LABEL_30;
  }
LABEL_25:
  v28 = +[BiometryHelper touchIdInstance];
  id v29 = [v7 lockoutState];
  v30 = [(MechanismTouchId *)self userId];
  uint64_t v31 = [v28 lockoutErrorForState:v29 userId:v30];

  v32 = v74;
  v33 = (void *)v31;
  [v74 setObject:v31 forKey:&off_8560];
  uint64_t v34 = 1;
LABEL_31:
  [(MechanismTouchId *)self setBiolockout:v34];
  [(MechanismTouchId *)self noResponseEventWithParams:v32];
  unsigned int v36 = [v7 resultIgnored];
  v37 = [v7 identity];

  if (v37 && (v36 & 1) == 0)
  {
    v38 = +[NSMutableDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:&off_8578];
    v39 = [v7 identity];
    v40 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v39 userID]);
    [v38 setObject:v40 forKey:&off_8590];

    v41 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 credentialAdded]);
    [v38 setObject:v41 forKey:&off_85A8];

    if (v23)
    {
      v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 unlocked]);
      [v38 setObject:v42 forKey:&off_85C0];
    }
    v43 = v33;
    if (v34) {
      [v38 setObject:&__kCFBooleanTrue forKey:&off_85D8];
    }
    v44 = [(MechanismTouchId *)self policyOptions];
    v45 = [v44 objectForKeyedSubscript:&off_85F0];

    if (!v45 || [v45 BOOLValue])
    {
      v46 = +[BiometryHelper touchIdInstance];
      v47 = [v7 identity];
      v48 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v47 userID]);
      id v76 = 0;
      v49 = [v46 biometryDatabaseHashForUser:v48 error:&v76];
      id v50 = v76;

      if (v49)
      {
        [v38 setObject:v49 forKey:&off_8608];
      }
      else
      {
        v56 = [(MechanismTouchId *)self request];
        v57 = [v56 log];

        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
          sub_594C(v7, (uint64_t)v50, v57);
        }
      }
    }
    v58 = [(MechanismTouchId *)self remoteUiDelegate];
    [v58 mechanismEvent:2 reply:&stru_8200];

    CFStringRef v77 = @"Result";
    v78 = v38;
    v59 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    v60 = [v7 identity];
    v61 = [v60 uuid];
    v62 = [(MechanismTouchId *)self mergeResult:v59 withUpdateOfIdentityUUID:v61];
    [(MechanismTouchId *)self succeedAuthenticationWithResult:v62];

    v63 = +[MechanismContext sharedInstance];
    v64 = [v63 backoffCounter];
    [v64 actionSuccess];

    v54 = v73;
    v32 = v74;
    goto LABEL_69;
  }
  unsigned int v51 = [(MechanismTouchId *)self _exceededFailureLimit];
  if (v34)
  {
    if ([(MechanismTouchId *)self _shouldShowUIBeforeFailure])
    {
      v52 = [(MechanismTouchId *)self remoteUiDelegate];
      v43 = v33;
      v53 = [(MechanismTouchId *)self failuresInfoDictionaryWithError:v33];
      [v52 mechanismEvent:7 value:v53 reply:&stru_8220];

      v32 = v74;
      v54 = v73;
      [(MechanismTouchId *)self _cancelOperation:v73];
      goto LABEL_69;
    }
    v43 = v33;
    [(MechanismTouchId *)self failAuthenticationWithError:v33];
LABEL_68:
    v54 = v73;
    goto LABEL_69;
  }
  if (v51)
  {
    if ([(MechanismTouchId *)self _shouldFailForUnboundMatches])
    {
      if ([v7 resultIgnored]) {
        uint64_t v55 = -1022;
      }
      else {
        uint64_t v55 = -1;
      }
    }
    else
    {
      uint64_t v55 = -1;
    }
    v43 = v33;
    v66 = +[LAErrorHelper errorWithCode:v55 message:@"Application retry limit exceeded."];
    if ([(MechanismTouchId *)self _shouldShowUIBeforeFailure])
    {
      v67 = [(MechanismTouchId *)self remoteUiDelegate];
      v68 = [(MechanismTouchId *)self failuresInfoDictionaryWithError:v66];
      [v67 mechanismEvent:1 value:v68 reply:&stru_8240];

      v32 = v74;
      v54 = v73;
      [(MechanismTouchId *)self _cancelOperation:v73];
    }
    else
    {
      [(MechanismTouchId *)self failAuthenticationWithError:v66];
      v54 = v73;
    }

    goto LABEL_69;
  }
  BOOL v65 = [(BKMatchTouchIDOperation *)self->_matchOperation purpose] == (char *)&dword_0 + 2
     || [(BKMatchTouchIDOperation *)self->_matchOperation purpose] == &dword_4;
  v43 = v33;
  id v75 = 0;
  unsigned __int8 v69 = [(MechanismTouchId *)self isAvailableForPurpose:v65 error:&v75];
  id v70 = v75;
  if ((v69 & 1) == 0)
  {
    [(MechanismTouchId *)self failAuthenticationWithError:v70];

    goto LABEL_68;
  }
  v71 = [(MechanismTouchId *)self remoteUiDelegate];
  v72 = [(MechanismTouchId *)self failuresInfoDictionaryWithError:0];
  [v71 mechanismEvent:1 value:v72 reply:&stru_8260];

  v32 = v74;
  v54 = v73;
  if (v36 && ([v7 resultIgnored] & 1) == 0)
  {
    [(MechanismTouchId *)self _cancelOperation:v73];
    self->_shouldRestartMatching = 1;
  }
LABEL_69:
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4260;
  v8[3] = &unk_8288;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismTouchId *)self dispatchAsyncOnServerQueueIfRunning:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = (BKMatchTouchIDOperation *)a3;
  id v7 = [(MechanismTouchId *)self request];
  id v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL shouldRestartMatching = self->_shouldRestartMatching;
    int v14 = 138544130;
    v15 = self;
    __int16 v16 = 2114;
    v17 = v6;
    __int16 v18 = 1024;
    int v19 = a4;
    __int16 v20 = 1024;
    BOOL v21 = shouldRestartMatching;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has been finished by %{public}@, reason:%d, willRestartMatching: %d", (uint8_t *)&v14, 0x22u);
  }

  if (a4 == 3 && !self->_shouldRestartMatching)
  {
    id v10 = [(MechanismTouchId *)self request];
    BOOL v11 = [v10 analytics];
    objc_msgSend(v11, "authenticationAttempt:event:", 3, -[MechanismTouchId eventIdentifier](self, "eventIdentifier"));

    id v12 = +[LAErrorHelper errorWithCode:-1 message:@"Biometric operation failed"];
    [(MechanismTouchId *)self failAuthenticationWithError:v12];
  }
  p_matchOperation = &self->_matchOperation;
  if (self->_matchOperation == v6 || (p_matchOperation = &self->_detectOperation, self->_detectOperation == v6))
  {
    *p_matchOperation = 0;
  }
  if (self->_shouldRestartMatching) {
    [(MechanismTouchId *)self _startMatching];
  }
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4578;
  v8[3] = &unk_8288;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismTouchId *)self dispatchAsyncOnServerQueueIfRunning:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6 = (BKMatchTouchIDOperation *)a3;
  id v7 = [(MechanismTouchId *)self request];
  id v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = self;
    __int16 v23 = 1024;
    int v24 = a4;
    __int16 v25 = 2114;
    BOOL v26 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ state has changed to %d on %{public}@", buf, 0x1Cu);
  }

  switch(a4)
  {
    case 5:
      int v19 = &off_8548;
      __int16 v20 = &off_8620;
      id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(MechanismTouchId *)self noResponseEventWithParams:v10];
      goto LABEL_13;
    case 4:
      if ((self->_matchOperation != v6 || self->_expectingEndOfMatching)
        && (self->_detectOperation != v6 || self->_expectingEndOfDetection))
      {
        break;
      }
      id v10 = +[BiometryHelper touchIdInstance];
      BOOL v11 = [(MechanismTouchId *)self userId];
      id v12 = [(MechanismTouchId *)self request];
      id v13 = [v10 biometryLostErrorForUser:v11 request:v12];
      [(MechanismTouchId *)self failAuthenticationWithError:v13];

LABEL_13:
      break;
    case 3:
      id v9 = +[LAErrorHelper errorWithCode:-4 message:@"Preempted by another biometric operation."];
      [(MechanismTouchId *)self failAuthenticationWithError:v9];

      [(MechanismTouchId *)self _cancelOperation:v6];
      break;
  }
  if ((a4 == 2) == (self->_state != 2))
  {
    v17 = &off_8548;
    if (a4 == 2) {
      uint64_t v14 = 11;
    }
    else {
      uint64_t v14 = 12;
    }
    v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v14, v17);
    __int16 v18 = v15;
    __int16 v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    [(MechanismTouchId *)self noResponseEventWithParams:v16];
  }
  self->_state = a4;
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4990;
  v8[3] = &unk_82B0;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  BOOL v11 = a4;
  [(MechanismTouchId *)self dispatchAsyncOnServerQueueIfRunning:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MechanismTouchId *)self request];
  id v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"off";
    *(_DWORD *)buf = 138543874;
    v17 = self;
    __int16 v18 = 2114;
    if (v4) {
      CFStringRef v9 = @"on";
    }
    CFStringRef v19 = v9;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has received finger-%{public}@ from %{public}@", buf, 0x20u);
  }

  if (self->_detectOperation) {
    BOOL v10 = !v4;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4BC4;
    block[3] = &unk_82D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (v4)
  {
    BOOL v11 = &off_8638;
  }
  else
  {
    ++self->_fingerOffCounter;
    BOOL v11 = &off_8578;
  }
  uint64_t v14 = &off_8548;
  v15 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [(MechanismTouchId *)self noResponseEventWithParams:v12];
}

- (void)_cancelOperation:(id)a3
{
  BOOL v4 = (BKPresenceDetectOperation *)a3;
  if (self->_matchOperation == v4)
  {
    v5 = &OBJC_IVAR___MechanismTouchId__expectingEndOfMatching;
  }
  else
  {
    if (self->_detectOperation != v4) {
      goto LABEL_6;
    }
    v5 = &OBJC_IVAR___MechanismTouchId__expectingEndOfDetection;
  }
  self->MechanismBiometry_opaque[*v5] = 1;
  id v6 = v4;
  [(BKPresenceDetectOperation *)v4 cancel];
  BOOL v4 = v6;
LABEL_6:
}

- (void)_startBiometry
{
  unsigned int v3 = [(MechanismTouchId *)self policyOptions];
  BOOL v4 = [v3 objectForKey:&off_8650];
  fingerDetectTimeout = self->_fingerDetectTimeout;
  self->_fingerDetectTimeout = v4;

  if (self->_fingerDetectTimeout)
  {
    [(MechanismTouchId *)self _startFingerDetectPhase];
  }
  else
  {
    [(MechanismTouchId *)self _startMatching];
  }
}

- (void)_startMatching
{
  BOOL v4 = [(MechanismTouchId *)self request];
  v5 = [v4 log];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MechanismTouchId *)self userId];
    if (v6)
    {
      v2 = [(MechanismTouchId *)self userId];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"user %d", [v2 intValue]);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = @"any user";
    }
    *(_DWORD *)buf = 138543618;
    v35 = self;
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start matching %{public}@", buf, 0x16u);
    if (v6)
    {
    }
  }

  self->_BOOL shouldRestartMatching = 0;
  self->_expectingEndOfMatching = 0;
  touchIdDevice = self->_touchIdDevice;
  id v33 = 0;
  CFStringRef v9 = [(BKDeviceTouchID *)touchIdDevice createMatchOperationWithError:&v33];
  id v10 = v33;
  matchOperation = self->_matchOperation;
  self->_matchOperation = v9;

  [(BKMatchTouchIDOperation *)self->_matchOperation setDelegate:self];
  id v12 = self->_matchOperation;
  id v13 = [(MechanismTouchId *)self externalizedContext];
  [(BKMatchTouchIDOperation *)v12 setCredentialSet:v13];

  [(BKMatchTouchIDOperation *)self->_matchOperation setPriority:50];
  [(BKMatchTouchIDOperation *)self->_matchOperation setStopOnSuccess:1];
  uint64_t v14 = self->_matchOperation;
  v15 = [(MechanismTouchId *)self identityUUIDs];
  [(BKMatchTouchIDOperation *)v14 setSelectedIdentities:v15];

  __int16 v16 = [(MechanismTouchId *)self policyOptions];
  v17 = [v16 objectForKeyedSubscript:&off_8668];
  if ([v17 BOOLValue])
  {
  }
  else
  {
    unsigned __int8 v18 = +[DaemonUtils deviceSupportsSecureDoubleClick];

    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
  [(BKMatchTouchIDOperation *)self->_matchOperation setRequireFingerOff:1];
LABEL_12:
  CFStringRef v19 = self->_matchOperation;
  __int16 v20 = [(MechanismTouchId *)self userId];
  [(BKMatchTouchIDOperation *)v19 setUserID:v20];

  id v21 = [(MechanismTouchId *)self policyOptions];
  v22 = [v21 objectForKeyedSubscript:&off_8680];
  unsigned int v23 = [v22 BOOLValue];

  if (v23) {
    uint64_t v24 = 4;
  }
  else {
    uint64_t v24 = 3;
  }
  [(BKMatchTouchIDOperation *)self->_matchOperation setPurpose:v24];
  if ([(MechanismTouchId *)self policy] == &stru_3D8.segname[4])
  {
    uint64_t v25 = 2;
  }
  else
  {
    BOOL v26 = [(MechanismTouchId *)self request];
    unsigned int v27 = [v26 isPurposeInAppPayment];

    if (!v27) {
      goto LABEL_20;
    }
    uint64_t v25 = 3;
  }
  [(BKMatchTouchIDOperation *)self->_matchOperation setUseCase:v25];
LABEL_20:
  v28 = self->_matchOperation;
  id v32 = v10;
  unsigned __int8 v29 = [(BKMatchTouchIDOperation *)v28 startWithError:&v32];
  id v30 = v32;

  if ((v29 & 1) == 0)
  {
    uint64_t v31 = +[LAErrorHelper errorWithCode:-1 subcode:32 message:@"match failed" suberror:v30];
    [(MechanismTouchId *)self failAuthenticationWithError:v31];
  }
}

- (void)_startFingerDetectPhase
{
  unsigned int v3 = [(MechanismTouchId *)self request];
  BOOL v4 = [v3 log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v19 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is starting finger detect phase", buf, 0xCu);
  }

  self->_fingerOffCounter = 0;
  self->_expectingEndOfDetection = 0;
  __int16 v16 = &off_8548;
  v17 = &off_8698;
  v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [(MechanismTouchId *)self noResponseEventWithParams:v5];

  touchIdDevice = self->_touchIdDevice;
  id v15 = 0;
  id v7 = [(BKDeviceTouchID *)touchIdDevice createPresenceDetectOperationWithError:&v15];
  id v8 = v15;
  detectOperation = self->_detectOperation;
  self->_detectOperation = v7;

  [(BKPresenceDetectOperation *)self->_detectOperation setPriority:50];
  [(BKPresenceDetectOperation *)self->_detectOperation setDelegate:self];
  id v10 = self->_detectOperation;
  id v14 = v8;
  unsigned __int8 v11 = [(BKPresenceDetectOperation *)v10 startWithError:&v14];
  id v12 = v14;

  if ((v11 & 1) == 0)
  {
    id v13 = +[LAErrorHelper errorWithCode:-1 message:@"detect failed" suberror:v12];
    [(MechanismTouchId *)self failAuthenticationWithError:v13];
  }
}

- (void)_finishFingerDetectPhase
{
  unsigned int v3 = [(MechanismTouchId *)self request];
  BOOL v4 = [v3 log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v9 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish finger detect phase", buf, 0xCu);
  }

  id v6 = &off_8548;
  id v7 = &off_8608;
  v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(MechanismTouchId *)self noResponseEventWithParams:v5];

  [(MechanismTouchId *)self _cancelOperation:self->_detectOperation];
  [(MechanismTouchId *)self _startMatching];
}

- (void)_setFingerDetectTimeout
{
  [(NSNumber *)self->_fingerDetectTimeout doubleValue];
  double v4 = v3;
  CFStringRef v9 = &off_8548;
  id v10 = &off_8548;
  v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(MechanismTouchId *)self noResponseEventWithParams:v5];

  unint64_t fingerOffCounter = self->_fingerOffCounter;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_548C;
  block[3] = &unk_8300;
  block[4] = self;
  void block[5] = fingerOffCounter;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_stopBiometry:(BOOL)a3
{
  double v4 = [(MechanismTouchId *)self request];
  v5 = [v4 log];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    matchOperation = self->_matchOperation;
    if (!matchOperation) {
      matchOperation = self->_detectOperation;
    }
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = matchOperation;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will stop biometric operation: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MechanismTouchId *)self setRemoteUiDelegate:0];
  if (self->_matchOperation || self->_detectOperation) {
    -[MechanismTouchId _cancelOperation:](self, "_cancelOperation:");
  }
}

- (BOOL)pause:(BOOL)a3 forEvent:(int64_t)a4 error:(id *)a5
{
  BOOL v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MechanismTouchId;
  BOOL v7 = [(MechanismTouchId *)&v12 pause:a3 forEvent:a4 error:a5];
  if (v7)
  {
    id v8 = [(MechanismTouchId *)self request];
    __int16 v9 = [v8 log];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = "resume";
      if (v5) {
        id v10 = "pause";
      }
      *(_DWORD *)buf = 138543618;
      id v14 = self;
      __int16 v15 = 2080;
      __int16 v16 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will %s the biometric operation", buf, 0x16u);
    }

    if (v5) {
      [(MechanismTouchId *)self _stopBiometry:1];
    }
    else {
      [(MechanismTouchId *)self _startBiometryMain];
    }
  }
  return v7;
}

- (void)willFinish
{
}

- (id)currentMatchingOperationUserId
{
  v2 = [(MechanismTouchId *)self userId];
  double v3 = v2;
  if (!v2) {
    v2 = &off_86B0;
  }
  double v4 = v2;

  return v4;
}

- (void)unEnrolledWithError:(id)a3
{
  id v8 = a3;
  double v4 = self;
  if (([(MechanismTouchId *)v4 isRunning] & 1) != 0
    || ([(MechanismTouchId *)v4 parent], BOOL v5 = objc_claimAutoreleasedReturnValue(),
                                                  v5,
                                                  !v5))
  {
    id v6 = v4;
  }
  else
  {
    do
    {
      id v6 = [(MechanismTouchId *)v4 parent];

      BOOL v7 = [(MechanismTouchId *)v6 parent];

      double v4 = v6;
    }
    while (v7);
  }
  [(MechanismTouchId *)v6 failAuthenticationWithError:v8];
}

- (LARemoteUI)remoteUiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUiDelegate);

  return (LARemoteUI *)WeakRetained;
}

- (void)setRemoteUiDelegate:(id)a3
{
}

- (BOOL)hasUI
{
  return self->_hasUI;
}

- (void)setHasUI:(BOOL)a3
{
  self->_hasUI = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteUiDelegate);
  objc_storeStrong((id *)&self->_fingerDetectTimeout, 0);
  objc_storeStrong((id *)&self->_detectOperation, 0);
  objc_storeStrong((id *)&self->_matchOperation, 0);

  objc_storeStrong((id *)&self->_touchIdDevice, 0);
}

@end