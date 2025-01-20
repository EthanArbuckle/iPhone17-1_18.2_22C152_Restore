@interface MechanismPearl
- (BOOL)_checkFailureCounter:(BOOL)a3 wrongAuthentication:(BOOL)a4 error:(id *)a5;
- (BOOL)_exceededFailureLimit;
- (BOOL)_shouldRespectFailureLimit;
- (BOOL)_shouldShowUIBeforeFailure;
- (BOOL)hasFallback;
- (BOOL)hasUI;
- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4;
- (BOOL)noRestartWithDoublePress;
- (BOOL)pause:(BOOL)a3 forEvent:(int64_t)a4 error:(id *)a5;
- (LARemoteUI)remoteUiDelegate;
- (MechanismPearl)initWithParams:(id)a3 request:(id)a4;
- (NSDictionary)matchResult;
- (id)additionalControllerInternalInfoForPolicy:(int64_t)a3;
- (id)tccError:(BOOL)a3;
- (id)tccService;
- (void)_cancelOperation:(id)a3;
- (void)_dispatchBKOperationWithBlock:(id)a3;
- (void)_expireMatchThatStartedAt:(id)a3;
- (void)_finishFaceDetectPhase;
- (void)_generateArtificialFaceOutIfNeeded;
- (void)_matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)_operation:(id)a3 failedWithReason:(int64_t)a4;
- (void)_operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)_operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)_operation:(id)a3 providedFeedback:(int64_t)a4;
- (void)_operation:(id)a3 stateChanged:(int64_t)a4;
- (void)_pauseFaceIdAfterSecureUIMovement;
- (void)_scheduleMatchExpirationWithResult:(id)a3 identityUUID:(id)a4;
- (void)_setFaceDetectTimeout;
- (void)_setupCoachingFilter;
- (void)_startBiometry;
- (void)_startFaceDetectPhase;
- (void)_startMatching;
- (void)_stopBiometry;
- (void)_succeedAuthenticationWithResult:(id)a3 identityUUID:(id)a4;
- (void)companionStateChanged:(id)a3 newState:(BOOL)a4;
- (void)handleUIEvent:(int64_t)a3 params:(id)a4;
- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4;
- (void)mechanismEvent:(int64_t)a3 reply:(id)a4;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)noResponseEventWithParams:(id)a3;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)restartWithEventIdentifier:(int64_t)a3 lastAttempt:(BOOL)a4;
- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (void)setHasFallback:(BOOL)a3;
- (void)setHasUI:(BOOL)a3;
- (void)setMatchResult:(id)a3;
- (void)setNoRestartWithDoublePress:(BOOL)a3;
- (void)setRemoteUiDelegate:(id)a3;
- (void)setShowingCoachingHint:(BOOL)a3 reply:(id)a4;
- (void)willFinish;
@end

@implementation MechanismPearl

- (MechanismPearl)initWithParams:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"AcmContextRecord"];
  v9 = [v7 objectForKeyedSubscript:@"EvaluationMode"];
  id v10 = [v9 integerValue];
  v11 = [v7 objectForKeyedSubscript:@"UserId"];

  v14.receiver = self;
  v14.super_class = (Class)MechanismPearl;
  v12 = [(MechanismPearl *)&v14 initWithEventIdentifier:7 remoteViewController:5 acmContextRecord:v8 request:v6 evaluationMode:v10 userId:v11];

  return v12;
}

- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4
{
  id v7 = (char *)[(MechanismPearl *)self evaluationMode];
  if (v7)
  {
    if (v7 == (unsigned char *)&dword_0 + 1)
    {
      v8 = +[BiometryHelper faceIdInstance];
      unsigned __int8 v9 = [v8 isAnyUserEnrolledWithError:a4];

      if ((v9 & 1) == 0) {
        return 0;
      }
    }
  }
  else
  {
    id v10 = +[BiometryHelper faceIdInstance];
    v11 = [(MechanismPearl *)self userId];
    unsigned int v12 = [v10 isEnrolled:v11 error:a4];

    if (!v12) {
      return 0;
    }
    v13 = +[BiometryHelper faceIdInstance];
    objc_super v14 = [(MechanismPearl *)self userId];
    v15 = [(MechanismPearl *)self request];
    unsigned __int8 v16 = [v13 isLockedOutForUser:v14 request:v15 error:a4];

    if (v16) {
      return 0;
    }
  }
  v17 = +[LAPasscodeHelper sharedInstance];
  v18 = [(MechanismPearl *)self userId];
  unsigned int v19 = objc_msgSend(v17, "isPasscodeSetForUser:error:", objc_msgSend(v18, "unsignedIntValue"), a4);

  if (v19)
  {
    v21.receiver = self;
    v21.super_class = (Class)MechanismPearl;
    return [(MechanismPearl *)&v21 isAvailableForPurpose:a3 error:a4];
  }
  return 0;
}

- (id)tccService
{
  return kTCCServiceFaceID;
}

- (id)tccError:(BOOL)a3
{
  BOOL v3 = a3;
  v9[0] = LAErrorInfoTCCService;
  v4 = [(MechanismPearl *)self tccService];
  v10[0] = v4;
  v9[1] = LAErrorInfoTCCServerPrompt;
  v5 = +[NSNumber numberWithBool:v3];
  v10[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = +[LAErrorHelper errorWithCode:-1018 message:@"User has denied the use of biometry for this app." moreInfo:v6];

  return v7;
}

- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MechanismPearl;
  id v35 = a4;
  id v36 = v7;
  -[MechanismPearl runWithHints:eventsDelegate:reply:](&v38, "runWithHints:eventsDelegate:reply:", v7);
  v8 = [(MechanismPearl *)self internalOptions];
  unsigned __int8 v9 = [v8 objectForKeyedSubscript:@"AuditToken"];
  id v10 = [(MechanismPearl *)self internalOptions];
  v11 = [v10 objectForKeyedSubscript:@"Options"];
  unsigned int v12 = [v11 objectForKey:&off_C9A8];
  v13 = [(MechanismPearl *)self policyOptions];
  objc_super v14 = [v13 objectForKeyedSubscript:&off_C9C0];
  id v37 = 0;
  LOBYTE(v7) = [(MechanismPearl *)self isTCCAllowedWithAuditTokenData:v9 optionAuditTokenData:v12 forcePrompt:0 auditTokenUsage:v14 error:&v37];
  id v15 = v37;

  if ((v7 & 1) == 0)
  {
    [(MechanismPearl *)self failAuthenticationWithError:v15];
LABEL_18:
    v34 = v35;
    v33 = v36;
    goto LABEL_19;
  }
  unsigned __int8 v16 = +[BiometryHelper faceIdInstance];
  v17 = [v16 device];
  pearlDevice = self->_pearlDevice;
  self->_pearlDevice = v17;

  self->_standardUifailures = 0;
  [(MechanismPearl *)self setFailures:0];
  unsigned int v19 = [(MechanismPearl *)self policyOptions];
  v20 = [v19 objectForKey:&off_C9D8];
  [(MechanismPearl *)self setFailureLimit:v20];

  unsigned int v21 = [(MechanismPearl *)self _shouldRespectFailureLimit];
  if (v21)
  {
    v22 = [(MechanismPearl *)self failureLimit];

    if (!v22) {
      [(MechanismPearl *)self setFailureLimit:&off_C9F0];
    }
  }
  v23 = [(MechanismPearl *)self request];
  v24 = [v23 log];

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = +[NSNumber numberWithInteger:[(MechanismPearl *)self policy]];
    *(_DWORD *)buf = 138543874;
    v40 = self;
    __int16 v41 = 1024;
    int v42 = v21 ^ 1;
    __int16 v43 = 2114;
    v44 = v25;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring failure limit: %d for policy %{public}@", buf, 0x1Cu);
  }
  v26 = [(MechanismPearl *)self failureLimit];
  if (v26) {
    char v27 = v21;
  }
  else {
    char v27 = 0;
  }

  if ((v27 & 1) == 0) {
    [(MechanismPearl *)self setFailureLimit:&off_CA08];
  }
  v28 = [(MechanismPearl *)self preCompanion];

  if (!v28)
  {
    [(MechanismPearl *)self _startBiometry];
    goto LABEL_18;
  }
  v29 = [(MechanismPearl *)self policyOptions];
  v30 = [v29 objectForKeyedSubscript:&off_CA20];
  unsigned int v31 = [v30 BOOLValue];

  if (v31) {
    [(MechanismPearl *)self _startBiometry];
  }
  v32 = [(MechanismPearl *)self preCompanion];
  v34 = v35;
  v33 = v36;
  [v32 runWithHints:v36 eventsDelegate:v35 reply:&stru_C318];

LABEL_19:
}

- (BOOL)_exceededFailureLimit
{
  BOOL v3 = [(MechanismPearl *)self failureLimit];

  if (!v3) {
    return 0;
  }
  v4 = (char *)[(MechanismPearl *)self failures] + 1;
  [(MechanismPearl *)self setFailures:v4];
  v5 = [(MechanismPearl *)self failureLimit];
  BOOL v6 = v4 > [v5 unsignedIntegerValue];

  return v6;
}

- (BOOL)_checkFailureCounter:(BOOL)a3 wrongAuthentication:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  unsigned __int8 v9 = [(MechanismPearl *)self failureLimit];

  if (v9
    && ((BOOL lastCounterCheckInNoMatch = self->_lastCounterCheckInNoMatch,
         self->_BOOL lastCounterCheckInNoMatch = v7,
         lastCounterCheckInNoMatch)
      ? (BOOL v11 = !v7)
      : (BOOL v11 = 0),
        !v11 && [(MechanismPearl *)self _exceededFailureLimit]))
  {
    if (a5 && v6)
    {
      id v12 = +[LAErrorHelper errorWithCode:-1022 message:@"Application retry limit exceeded - matched unbound identity."];
      BOOL result = 0;
      *a5 = v12;
    }
    else
    {
      if (a5)
      {
        if (v7) {
          +[LAErrorHelper errorWithCode:-1 message:@"Application retry limit exceeded."];
        }
        else {
        id v14 = +[LAErrorHelper errorWithCode:-1 subcode:11 message:@"Application retry limit exceeded."];
        }
        *a5 = v14;
      }
      return 0;
    }
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    return 1;
  }
  return result;
}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_331C;
  v10[3] = &unk_C340;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_dispatchBKOperationWithBlock:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate now];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3480;
  v8[3] = &unk_C368;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(MechanismPearl *)self dispatchAsyncOnServerQueueIfRunning:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldRespectFailureLimit
{
  if ([(MechanismPearl *)self isRunningDTOPolicy]) {
    return 1;
  }
  if ([(MechanismPearl *)self policy] != &dword_4) {
    return 0;
  }
  id v4 = [(MechanismPearl *)self failureLimit];
  BOOL v3 = [v4 integerValue] == 0;

  return v3;
}

- (BOOL)_shouldShowUIBeforeFailure
{
  BOOL v3 = +[LACDevice sharedInstance];
  if ([v3 isDynamicIslandAvailable])
  {
    id v4 = [(MechanismPearl *)self policyOptions];
    v5 = [v4 objectForKeyedSubscript:&off_CA38];
    unsigned int v6 = [v5 BOOLValue] ^ 1;
  }
  else
  {
    unsigned int v6 = 1;
  }

  unsigned int v7 = [(MechanismPearl *)self hasUI] & v6;
  if ([(MechanismPearl *)self _shouldRespectFailureLimit])
  {
    id v8 = [(MechanismPearl *)self policyOptions];
    id v9 = [v8 objectForKeyedSubscript:&off_CA50];
    unsigned __int8 v10 = [v9 BOOLValue];

    LOBYTE(v7) = v7 & (v10 ^ 1);
  }
  return v7;
}

- (void)_matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v69 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 identity];

  BOOL v8 = v7 == 0;
  id v9 = [(MechanismPearl *)self request];
  unsigned __int8 v10 = [v9 log];

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    v82 = self;
    __int16 v83 = 2112;
    id v84 = v69;
    __int16 v85 = 1024;
    unsigned int v86 = [v6 lockoutState];
    id v12 = "%{public}@ has received no-match from %@ (lockout state:%d)";
    id v13 = v10;
    uint32_t v14 = 28;
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138544386;
    v82 = self;
    __int16 v83 = 2112;
    id v84 = v69;
    __int16 v85 = 1024;
    unsigned int v86 = [v6 unlocked];
    __int16 v87 = 1024;
    unsigned int v88 = [v6 credentialAdded];
    __int16 v89 = 1024;
    unsigned int v90 = [v6 resultIgnored];
    id v12 = "%{public}@ has matched by %@ (unlocked:%d, credential:%d, resultIgnored:%d)";
    id v13 = v10;
    uint32_t v14 = 40;
  }
  _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_7:

  id v15 = [(MechanismPearl *)self request];
  unsigned __int8 v16 = [v15 analytics];
  v17 = [v6 identity];
  uint64_t v18 = v17 == 0;
  objc_msgSend(v16, "authenticationAttempt:event:", v18, -[MechanismPearl eventIdentifier](self, "eventIdentifier"));

  v79 = &off_CA68;
  unsigned __int8 v19 = [v6 resultIgnored];
  if (v19)
  {
    uint64_t v20 = 13;
  }
  else
  {
    uint64_t v18 = [v6 identity];
    if (v18) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = 3;
    }
  }
  unsigned int v21 = +[NSNumber numberWithInteger:v20];
  v80 = v21;
  v22 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v23 = +[NSMutableDictionary dictionaryWithDictionary:v22];

  if ((v19 & 1) == 0) {
  v24 = (char *)[v6 lockoutState];
  }
  BOOL v25 = [(BKMatchPearlOperation *)self->_matchOperation purpose] == (char *)&dword_0 + 2
     || [(BKMatchPearlOperation *)self->_matchOperation purpose] == &dword_4;
  int v26 = v24 != (unsigned char *)&dword_0 + 1;
  if ([v6 lockoutState] == (char *)&dword_4 + 1) {
    v26 &= v25;
  }
  char v27 = [(BKMatchPearlOperation *)self->_matchOperation userID];
  if (!v27)
  {
    if ([v6 lockoutState] == (char *)&dword_4 + 2) {
      int v32 = v26;
    }
    else {
      int v32 = 0;
    }
    if (v32 == 1) {
      goto LABEL_21;
    }
LABEL_26:
    int v31 = 0;
    uint64_t v67 = 0;
    goto LABEL_27;
  }

  if ((v26 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_21:
  v28 = +[BiometryHelper faceIdInstance];
  id v29 = [v6 lockoutState];
  v30 = [(MechanismPearl *)self userId];
  uint64_t v67 = [v28 lockoutErrorForState:v29 userId:v30];

  [v23 setObject:v67 forKey:&off_CA80];
  [(MechanismPearl *)self setBiolockout:1];
  int v31 = 1;
LABEL_27:
  -[MechanismPearl noResponseEventWithParams:](self, "noResponseEventWithParams:", v23, v67);
  v33 = [v6 identity];
  if (v33)
  {
    unsigned __int8 v34 = [v6 resultIgnored];

    if ((v34 & 1) == 0)
    {
      id v41 = +[NSMutableDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:&off_CA98];
      v45 = [v6 identity];
      v46 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v45 userID]);
      [v41 setObject:v46 forKey:&off_CAB0];

      v47 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 credentialAdded]);
      [v41 setObject:v47 forKey:&off_CAC8];

      if (v25)
      {
        v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 unlocked]);
        [v41 setObject:v48 forKey:&off_CAE0];
      }
      if (v31) {
        [v41 setObject:&__kCFBooleanTrue forKey:&off_CAF8];
      }
      v49 = [(MechanismPearl *)self policyOptions];
      id v43 = [v49 objectForKeyedSubscript:&off_CB10];

      if (!v43 || [v43 BOOLValue])
      {
        v50 = +[BiometryHelper faceIdInstance];
        v51 = [v6 identity];
        v52 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v51 userID]);
        id v76 = 0;
        v53 = [v50 biometryDatabaseHashForUser:v52 error:&v76];
        id v54 = v76;

        if (v53)
        {
          [v41 setObject:v53 forKey:&off_CB28];
        }
        else
        {
          v56 = [(MechanismPearl *)self request];
          v57 = [v56 log];

          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
            sub_7A98(v6, (uint64_t)v54, v57);
          }
        }
      }
      v44 = [(MechanismPearl *)self preCompanion];
      if (v44
        && ([v41 setObject:&__kCFBooleanTrue forKey:&off_CA80],
            ([v44 checkCredentialValid] & 1) == 0))
      {
        v59 = [v6 identity];
        v60 = [v59 uuid];
        [(MechanismPearl *)self _scheduleMatchExpirationWithResult:v41 identityUUID:v60];

        v77 = &off_CAF8;
        v78 = &__kCFBooleanFalse;
        v61 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        [v44 noResponseEventWithParams:v61];

        v62 = [(MechanismPearl *)self policyOptions];
        v63 = [v62 objectForKeyedSubscript:&off_CA20];
        LODWORD(v60) = [v63 BOOLValue];

        if (v60)
        {
          v64 = +[LAErrorHelper errorWithCode:-1023 message:@"Double press is required."];
          [(MechanismPearl *)self failAuthenticationWithError:v64];
        }
        else
        {
          [(MechanismPearl *)self prepareForRestart];
        }
        [(MechanismPearl *)self mechanismEvent:2 reply:&stru_C388];
      }
      else
      {
        [(MechanismPearl *)self mechanismEvent:2 reply:&stru_C388];
        objc_initWeak((id *)buf, self);
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_40CC;
        v72[3] = &unk_C340;
        objc_copyWeak(&v75, (id *)buf);
        id v73 = v41;
        id v74 = v6;
        v58 = objc_retainBlock(v72);
        if ([(CoachingFeedbackFilter *)self->_coachingFeedbackFilter isFinished]) {
          ((void (*)(void *))v58[2])(v58);
        }
        else {
          [(CoachingFeedbackFilter *)self->_coachingFeedbackFilter dispatchNowOrWhenFeedbackDurationAchieved:0 finish:0 block:v58];
        }

        objc_destroyWeak(&v75);
        objc_destroyWeak((id *)buf);
      }
      v65 = +[MechanismContext sharedInstance];
      v66 = [v65 backoffCounter];
      [v66 actionSuccess];

      goto LABEL_65;
    }
  }
  if (v31)
  {
    id v35 = +[BiometryHelper faceIdInstance];
    id v36 = [v6 lockoutState];
    id v37 = [(MechanismPearl *)self userId];
    objc_super v38 = [v35 lockoutErrorForState:v36 userId:v37];

    if ([(MechanismPearl *)self _shouldShowUIBeforeFailure])
    {
      v39 = [(MechanismPearl *)self failuresInfoDictionaryWithError:v38];
      [(MechanismPearl *)self mechanismEvent:7 value:v39 reply:&stru_C3A8];

      self->_expectingEndOfMatching = 1;
    }
    else
    {
      [(MechanismPearl *)self failAuthenticationWithError:v38];
    }

    goto LABEL_66;
  }
  id v71 = 0;
  unsigned __int8 v40 = -[MechanismPearl _checkFailureCounter:wrongAuthentication:error:](self, "_checkFailureCounter:wrongAuthentication:error:", 1, [v6 resultIgnored], &v71);
  id v41 = v71;
  if (v40)
  {
    id v70 = 0;
    unsigned int v42 = [(MechanismPearl *)self isAvailableForPurpose:0 error:&v70];
    id v43 = v70;
    if (!v42)
    {
      [(MechanismPearl *)self failAuthenticationWithError:v43];

      goto LABEL_66;
    }
    [(MechanismPearl *)self prepareForRestart];
    v44 = [(MechanismPearl *)self failuresInfoDictionaryWithError:0];
    [(MechanismPearl *)self mechanismEvent:1 value:v44 reply:&stru_C3E8];
LABEL_65:

    self->_expectingEndOfMatching = 1;
    goto LABEL_66;
  }
  if ([(MechanismPearl *)self _shouldShowUIBeforeFailure])
  {
    v55 = [(MechanismPearl *)self failuresInfoDictionaryWithError:v41];
    [(MechanismPearl *)self mechanismEvent:1 value:v55 reply:&stru_C3C8];

    self->_expectingEndOfMatching = 1;
  }
  else
  {
    [(MechanismPearl *)self failAuthenticationWithError:v41];
  }

LABEL_66:
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_429C;
  v8[3] = &unk_C410;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = (BKMatchPearlOperation *)a3;
  id v7 = [(MechanismPearl *)self request];
  BOOL v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    uint32_t v14 = self;
    __int16 v15 = 2114;
    unsigned __int8 v16 = v6;
    __int16 v17 = 1024;
    int v18 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has been finished by %{public}@, reason:%d", (uint8_t *)&v13, 0x1Cu);
  }

  if (a4 == 3)
  {
    id v9 = [(MechanismPearl *)self request];
    unsigned __int8 v10 = [v9 analytics];
    objc_msgSend(v10, "authenticationAttempt:event:", 3, -[MechanismPearl eventIdentifier](self, "eventIdentifier"));

    if (!self->_expectingEndOfMatching)
    {
      BOOL v11 = +[LAErrorHelper errorWithCode:-1 message:@"Biometric operation failed"];
      [(MechanismPearl *)self failAuthenticationWithError:v11];
    }
  }
  p_matchOperation = &self->_matchOperation;
  if (self->_matchOperation == v6 || (p_matchOperation = &self->_detectOperation, self->_detectOperation == v6))
  {
    *p_matchOperation = 0;
  }
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4590;
  v8[3] = &unk_C410;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 stateChanged:(int64_t)a4
{
  id v6 = (BKPresenceDetectOperation *)a3;
  id v7 = [(MechanismPearl *)self request];
  BOOL v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v37 = self;
    __int16 v38 = 1024;
    int v39 = a4;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ state has changed to %d on %{public}@", buf, 0x1Cu);
  }

  switch(a4)
  {
    case 2:
      if ([(CoachingFeedbackFilter *)self->_coachingFeedbackFilter isFinished]) {
        [(MechanismPearl *)self _setupCoachingFilter];
      }
      unsigned __int8 v34 = &off_CA68;
      id v35 = &off_CA68;
      id v9 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [(MechanismPearl *)self noResponseEventWithParams:v9];

      [(MechanismPearl *)self mechanismEvent:5 reply:&stru_C430];
      break;
    case 3:
      int v32 = &off_CA68;
      v33 = &off_CAF8;
      unsigned __int8 v10 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      [(MechanismPearl *)self noResponseEventWithParams:v10];

      BOOL v11 = +[LAErrorHelper errorWithCode:-4 message:@"Preempted by another biometric operation."];
      [(MechanismPearl *)self failAuthenticationWithError:v11];

      [(MechanismPearl *)self _cancelOperation:v6];
      break;
    case 4:
      if (self->_operationState == 2)
      {
        v30 = &off_CA68;
        int v31 = &off_CAF8;
        id v12 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        [(MechanismPearl *)self noResponseEventWithParams:v12];
      }
      matchOperation = self->_matchOperation;
      if (matchOperation == v6)
      {
        v28 = &off_CA68;
        id v29 = &off_CA80;
        uint32_t v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        [(MechanismPearl *)self noResponseEventWithParams:v14];

        matchOperation = self->_matchOperation;
      }
      if (matchOperation == v6 && !self->_expectingEndOfMatching
        || self->_detectOperation == v6 && !self->_expectingEndOfDetection)
      {
        id v15 = +[BiometryHelper faceIdInstance];
        unsigned __int8 v16 = [(MechanismPearl *)self userId];
        __int16 v17 = [(MechanismPearl *)self request];
        int v18 = [v15 biometryLostErrorForUser:v16 request:v17];
        [(MechanismPearl *)self failAuthenticationWithError:v18];

        goto LABEL_26;
      }
      break;
    case 5:
      id v25 = 0;
      unsigned __int8 v19 = [(MechanismPearl *)self _checkFailureCounter:0 wrongAuthentication:0 error:&v25];
      id v15 = v25;
      if ((v19 & 1) == 0)
      {
        if (![(MechanismPearl *)self _shouldShowUIBeforeFailure]) {
          [(MechanismPearl *)self failAuthenticationWithError:v15];
        }
        self->_expectingEndOfMatching = 1;
      }
      [(MechanismPearl *)self prepareForRestart];
      [(MechanismPearl *)self _generateArtificialFaceOutIfNeeded];
      int v26 = &off_CA68;
      char v27 = &off_CAF8;
      uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [(MechanismPearl *)self noResponseEventWithParams:v20];

      if (self->_hasUI)
      {
        unsigned int v21 = [(MechanismPearl *)self failuresInfoDictionaryWithError:v15];
        [(MechanismPearl *)self mechanismEvent:6 value:v21 reply:&stru_C450];

        v22 = [(MechanismPearl *)self eventsDelegate];
        if (!v22)
        {
          unint64_t v23 = self->_standardUifailures + 1;
          self->_standardUifailures = v23;
          if (v23 > 1) {
            goto LABEL_25;
          }
        }
        unsigned int v24 = [(MechanismPearl *)self isLastRestartAttempt];

        if (v24) {
LABEL_25:
        }
          [(MechanismPearl *)self _stopBiometry];
      }
LABEL_26:

      break;
    default:
      break;
  }
  self->_operationState = a4;
}

- (void)noResponseEventWithParams:(id)a3
{
  id v4 = a3;
  if ([(MechanismPearl *)self isMirroringUI])
  {
    v5 = [v4 objectForKeyedSubscript:&off_CA68];
    id v6 = (char *)[v5 integerValue];

    if (v6 == (unsigned char *)&dword_8 + 3) {
      goto LABEL_5;
    }
    if (v6 == (unsigned char *)&dword_8 + 2)
    {
      id v7 = &__kCFBooleanTrue;
      goto LABEL_7;
    }
    if (v6 == (unsigned char *)&dword_0 + 3)
    {
LABEL_5:
      id v7 = &__kCFBooleanFalse;
LABEL_7:
      BOOL v8 = +[NSMutableDictionary dictionaryWithDictionary:v4];
      [v8 setObject:v7 forKey:&off_CB40];

      id v4 = v8;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MechanismPearl;
  [(MechanismPearl *)&v9 noResponseEventWithParams:v4];
}

- (void)_generateArtificialFaceOutIfNeeded
{
  if (self->_facePresent)
  {
    self->_facePresent = 0;
    id v4 = &off_CA68;
    v5 = &off_CA98;
    BOOL v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [(MechanismPearl *)self noResponseEventWithParams:v3];
  }
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4D34;
  v8[3] = &unk_C478;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  BOOL v11 = a4;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MechanismPearl *)self request];
  BOOL v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"out";
    *(_DWORD *)buf = 138543874;
    unsigned int v21 = self;
    __int16 v22 = 2114;
    if (v4) {
      CFStringRef v9 = @"in";
    }
    CFStringRef v23 = v9;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has received face-%{public}@ from %{public}@", buf, 0x20u);
  }

  self->_facePresent = v4;
  if (self->_detectOperation)
  {
    id v10 = +[DaemonUtils sharedInstance];
    BOOL v11 = [v10 serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4FE4;
    block[3] = &unk_C2B8;
    block[4] = self;
    dispatch_async(v11, block);
  }
  if (v4)
  {
    id v12 = &off_CB58;
    uint64_t v13 = 3;
  }
  else
  {
    ++self->_faceOutCounter;
    uint32_t v14 = [(MechanismPearl *)self request];
    id v15 = [v14 analytics];
    objc_msgSend(v15, "authenticationAttempt:event:", 2, -[MechanismPearl eventIdentifier](self, "eventIdentifier"));

    id v12 = &off_CA98;
    uint64_t v13 = 4;
  }
  int v18 = &off_CA68;
  unsigned __int8 v19 = v12;
  unsigned __int8 v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [(MechanismPearl *)self noResponseEventWithParams:v16];

  [(MechanismPearl *)self mechanismEvent:v13 reply:&stru_C498];
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_50E0;
  v8[3] = &unk_C410;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MechanismPearl *)self request];
  BOOL v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    unsigned int v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has failed by %{public}@ with reason:%d", buf, 0x1Cu);
  }

  switch(a4)
  {
    case 3:
      uint64_t v10 = 8;
      char v9 = 1;
      break;
    case 5:
      char v9 = 0;
      uint64_t v10 = 9;
      break;
    case 4:
      char v9 = 0;
      uint64_t v10 = 10;
      break;
    default:
      goto LABEL_17;
  }
  int v18 = &off_CA68;
  unsigned __int8 v19 = &off_CAE0;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [(MechanismPearl *)self noResponseEventWithParams:v11];

  self->_expectingEndOfMatching = 1;
  if ((v9 & 1) != 0
    || ([(MechanismPearl *)self policyOptions],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectForKeyedSubscript:&off_CA50],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 BOOLValue],
        v13,
        v12,
        self->_hasFallback)
    || v14)
  {
    [(MechanismPearl *)self mechanismEvent:11 reply:&stru_C4B8];
    id v15 = +[LAErrorHelper errorWithCode:-4 subcode:qword_9838[v10 - 8] message:*(&off_C600 + v10 - 8)];
    matchFailure = self->_matchFailure;
    self->_matchFailure = v15;

    if (self->_hasUI)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUiDelegate);

      if (WeakRetained) {
        [(MechanismPearl *)self failAuthenticationWithError:self->_matchFailure];
      }
    }
    else
    {
      [(MechanismPearl *)self setSilentFailure:self->_matchFailure];
      [(MechanismPearl *)self _generateArtificialFaceOutIfNeeded];
      [(MechanismPearl *)self _stopBiometry];
    }
  }
  else
  {
    [(MechanismPearl *)self mechanismEvent:v10 reply:&stru_C4D8];
  }
LABEL_17:
}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_54D8;
  v8[3] = &unk_C410;
  objc_copyWeak(v10, &location);
  id v7 = v6;
  id v9 = v7;
  v10[1] = (id)a4;
  [(MechanismPearl *)self _dispatchBKOperationWithBlock:v8];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)_operation:(id)a3 providedFeedback:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) < 0xA || (unint64_t)(a4 - 12) < 2) {
    goto LABEL_2;
  }
  if (a4 == 11)
  {
    id v7 = +[BiometryHelper faceIdInstance];
    BOOL v8 = [(MechanismPearl *)self userId];
    unsigned int v9 = [v7 isPeriocularMatchingEnabledForUser:v8];

    if (v9)
    {
      uint64_t v10 = [(MechanismPearl *)self request];
      BOOL v11 = [v10 log];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = self;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will ignore occlusion feedback", (uint8_t *)&v14, 0xCu);
      }

      goto LABEL_3;
    }
LABEL_2:
    [(CoachingFeedbackFilter *)self->_coachingFeedbackFilter scheduleFeedback:a4];
    goto LABEL_3;
  }
  id v12 = [(MechanismPearl *)self request];
  uint64_t v13 = [v12 log];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_7B44(a4, v13);
  }

LABEL_3:
}

- (void)_cancelOperation:(id)a3
{
  BOOL v4 = (BKPresenceDetectOperation *)a3;
  if (self->_matchOperation == v4)
  {
    v5 = &OBJC_IVAR___MechanismPearl__expectingEndOfMatching;
  }
  else
  {
    if (self->_detectOperation != v4) {
      goto LABEL_6;
    }
    v5 = &OBJC_IVAR___MechanismPearl__expectingEndOfDetection;
  }
  self->MechanismBiometry_opaque[*v5] = 1;
  id v6 = v4;
  [(BKPresenceDetectOperation *)v4 cancel];
  BOOL v4 = v6;
LABEL_6:
}

- (void)_startBiometry
{
  BOOL v3 = [(MechanismPearl *)self policyOptions];
  BOOL v4 = [v3 objectForKey:&off_CB70];
  faceDetectTimeout = self->_faceDetectTimeout;
  self->_faceDetectTimeout = v4;

  if (self->_faceDetectTimeout)
  {
    [(MechanismPearl *)self _startFaceDetectPhase];
  }
  else
  {
    [(MechanismPearl *)self _startMatching];
  }
}

- (void)_setupCoachingFilter
{
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_CA98, &off_CAB0, &off_CA68, &off_CAF8, 0);
  BOOL v3 = [[CoachingFeedbackFilter alloc] initWithDelegate:self feedbackSet:v5 feedbackDuration:0.4 iconDuration:0.5];
  coachingFeedbackFilter = self->_coachingFeedbackFilter;
  self->_coachingFeedbackFilter = v3;
}

- (void)_startMatching
{
  BOOL v4 = [(MechanismPearl *)self request];
  v5 = [v4 log];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MechanismPearl *)self userId];
    if (v6)
    {
      v2 = [(MechanismPearl *)self userId];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"user %d", [v2 intValue]);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = @"any user";
    }
    *(_DWORD *)buf = 138543618;
    id v36 = self;
    __int16 v37 = 2114;
    __int16 v38 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start matching %{public}@", buf, 0x16u);
    if (v6)
    {
    }
  }

  [(MechanismPearl *)self _setupCoachingFilter];
  self->_expectingEndOfMatching = 0;
  pearlDevice = self->_pearlDevice;
  id v32 = 0;
  unsigned int v9 = [(BKDevicePearl *)pearlDevice createMatchOperationWithError:&v32];
  id v10 = v32;
  matchOperation = self->_matchOperation;
  self->_matchOperation = v9;

  [(BKMatchPearlOperation *)self->_matchOperation setDelegate:self];
  id v12 = self->_matchOperation;
  uint64_t v13 = [(MechanismPearl *)self externalizedContext];
  [(BKMatchPearlOperation *)v12 setCredentialSet:v13];

  [(BKMatchPearlOperation *)self->_matchOperation setPriority:50];
  [(BKMatchPearlOperation *)self->_matchOperation setStopOnSuccess:1];
  int v14 = self->_matchOperation;
  id v15 = [(MechanismPearl *)self identityUUIDs];
  [(BKMatchPearlOperation *)v14 setSelectedIdentities:v15];

  unsigned __int8 v16 = self->_matchOperation;
  __int16 v17 = [(MechanismPearl *)self userId];
  [(BKMatchPearlOperation *)v16 setUserID:v17];

  int v18 = [(MechanismPearl *)self policyOptions];
  unsigned __int8 v19 = [v18 objectForKeyedSubscript:&off_CB88];
  unsigned int v20 = [v19 BOOLValue];

  if (v20) {
    uint64_t v21 = 4;
  }
  else {
    uint64_t v21 = 3;
  }
  [(BKMatchPearlOperation *)self->_matchOperation setPurpose:v21];
  if ([(MechanismPearl *)self policy] == &stru_3D8.segname[4])
  {
    uint64_t v22 = 2;
  }
  else
  {
    id v23 = [(MechanismPearl *)self request];
    unsigned int v24 = [v23 isPurposeApplePay];

    if (!v24) {
      goto LABEL_16;
    }
    uint64_t v22 = 3;
  }
  [(BKMatchPearlOperation *)self->_matchOperation setUseCase:v22];
LABEL_16:
  int v25 = self->_matchOperation;
  id v31 = v10;
  unsigned __int8 v26 = [(BKMatchPearlOperation *)v25 startWithError:&v31];
  id v27 = v31;

  if (v26)
  {
    v28 = +[NSDate date];
    startedMatching = self->_startedMatching;
    self->_startedMatching = v28;

    v33 = &off_CA68;
    unsigned __int8 v34 = &off_CAB0;
    v30 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [(MechanismPearl *)self noResponseEventWithParams:v30];
  }
  else
  {
    v30 = +[LAErrorHelper errorWithCode:-1 subcode:32 message:@"match failed" suberror:v27];
    [(MechanismPearl *)self failAuthenticationWithError:v30];
  }
}

- (void)_startFaceDetectPhase
{
  BOOL v3 = [(MechanismPearl *)self request];
  BOOL v4 = [v3 log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v19 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is starting face detect phase", buf, 0xCu);
  }

  self->_faceOutCounter = 0;
  self->_expectingEndOfDetection = 0;
  unsigned __int8 v16 = &off_CA68;
  __int16 v17 = &off_CBA0;
  v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [(MechanismPearl *)self noResponseEventWithParams:v5];

  pearlDevice = self->_pearlDevice;
  id v15 = 0;
  id v7 = [(BKDevicePearl *)pearlDevice createPresenceDetectOperationWithError:&v15];
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
    uint64_t v13 = +[LAErrorHelper errorWithCode:-1 message:@"detect failed" suberror:v12];
    [(MechanismPearl *)self failAuthenticationWithError:v13];
  }
}

- (void)_finishFaceDetectPhase
{
  BOOL v3 = [(MechanismPearl *)self request];
  BOOL v4 = [v3 log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v9 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish face detect phase", buf, 0xCu);
  }

  id v6 = &off_CA68;
  id v7 = &off_CB28;
  v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(MechanismPearl *)self noResponseEventWithParams:v5];

  [(MechanismPearl *)self _cancelOperation:self->_detectOperation];
  [(MechanismPearl *)self _startMatching];
}

- (void)_setFaceDetectTimeout
{
  [(NSNumber *)self->_faceDetectTimeout doubleValue];
  double v4 = v3;
  unsigned __int8 v11 = &off_CA68;
  id v12 = &off_CBB8;
  v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(MechanismPearl *)self noResponseEventWithParams:v5];

  unint64_t faceOutCounter = self->_faceOutCounter;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  id v8 = +[DaemonUtils sharedInstance];
  unsigned int v9 = [v8 serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_607C;
  block[3] = &unk_C500;
  block[4] = self;
  void block[5] = faceOutCounter;
  dispatch_after(v7, v9, block);
}

- (void)_stopBiometry
{
  double v3 = [(MechanismPearl *)self request];
  double v4 = [v3 log];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    matchOperation = self->_matchOperation;
    if (!matchOperation) {
      matchOperation = self->_detectOperation;
    }
    int v6 = 138543618;
    dispatch_time_t v7 = self;
    __int16 v8 = 2114;
    unsigned int v9 = matchOperation;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will stop biometric operation: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  if (self->_matchOperation || self->_detectOperation) {
    -[MechanismPearl _cancelOperation:](self, "_cancelOperation:");
  }
}

- (BOOL)pause:(BOOL)a3 forEvent:(int64_t)a4 error:(id *)a5
{
  BOOL v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MechanismPearl;
  BOOL v7 = [(MechanismPearl *)&v12 pause:a3 forEvent:a4 error:a5];
  if (v7)
  {
    __int16 v8 = [(MechanismPearl *)self request];
    unsigned int v9 = [v8 log];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = "resume";
      if (v5) {
        id v10 = "pause";
      }
      *(_DWORD *)buf = 138543618;
      id v14 = self;
      __int16 v15 = 2080;
      unsigned __int8 v16 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will %s the biometric operation", buf, 0x16u);
    }

    if (v5) {
      [(MechanismPearl *)self _stopBiometry];
    }
    else {
      [(MechanismPearl *)self _startBiometry];
    }
  }
  return v7;
}

- (void)willFinish
{
  if (self->_operationState == 2)
  {
    BOOL v7 = &off_CA68;
    __int16 v8 = &off_CAF8;
    double v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [(MechanismPearl *)self noResponseEventWithParams:v3];
  }
  if (self->_matchOperation)
  {
    BOOL v5 = &off_CA68;
    int v6 = &off_CA80;
    double v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [(MechanismPearl *)self noResponseEventWithParams:v4];
  }
  [(MechanismPearl *)self setRemoteUiDelegate:0];
  [(MechanismPearl *)self _stopBiometry];
}

- (void)companionStateChanged:(id)a3 newState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(MechanismPearl *)self request];
  __int16 v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ state changed to %d", buf, 0x12u);
  }

  if (v4)
  {
    matchResult = self->_matchResult;
    if (matchResult)
    {
      CFStringRef v13 = @"Result";
      id v14 = matchResult;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      [(MechanismPearl *)self _succeedAuthenticationWithResult:v10 identityUUID:self->_matchIdentityUUID];
LABEL_14:

      goto LABEL_15;
    }
    if ([(MechanismPearl *)self biolockout])
    {
      objc_super v12 = [(MechanismPearl *)self request];
      id v10 = [v12 log];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_7BBC((uint64_t)self, v10);
      }
      goto LABEL_14;
    }
    if (([(MechanismPearl *)self isLastRestartAttempt] & 1) == 0
      && ![(MechanismPearl *)self noRestartWithDoublePress])
    {
      if (self->_matchOperation)
      {
        if ([(MechanismPearl *)self isRestartable]) {
          [(MechanismPearl *)self restartWithEventIdentifier:7 lastAttempt:0];
        }
      }
      else if (!self->_detectOperation)
      {
        [(MechanismPearl *)self _startBiometry];
      }
    }
    uint64_t v11 = 12;
  }
  else
  {
    if (self->_matchOperation || self->_detectOperation)
    {
      [(MechanismPearl *)self _stopBiometry];
      [(MechanismPearl *)self prepareForRestart];
    }
    uint64_t v11 = 13;
  }
  [(MechanismPearl *)self mechanismEvent:v11 reply:&stru_C520];
LABEL_15:
}

- (void)restartWithEventIdentifier:(int64_t)a3 lastAttempt:(BOOL)a4
{
  if (self->_operationState != 2)
  {
    BOOL v7 = a4;
    if ([(MechanismPearl *)self biolockout])
    {
      unsigned int v9 = [(MechanismPearl *)self request];
      id v10 = [v9 log];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_7C34((uint64_t)self, v10);
      }
    }
    else
    {
      unsigned int v11 = [(MechanismPearl *)self isRestartable];
      v16.receiver = self;
      v16.super_class = (Class)MechanismPearl;
      [(MechanismPearl *)&v16 restartWithEventIdentifier:a3 lastAttempt:v7];
      if (!v11) {
        return;
      }
      [(MechanismPearl *)self _setupCoachingFilter];
      self->_expectingEndOfMatching = 0;
      if (self->_operationState != 5)
      {
        [(MechanismPearl *)self _startMatching];
        return;
      }
      matchOperation = self->_matchOperation;
      id v15 = 0;
      unsigned __int8 v13 = [(BKMatchPearlOperation *)matchOperation startNewMatchAttemptWithError:&v15];
      id v10 = v15;
      if ((v13 & 1) == 0)
      {
        id v14 = +[LAErrorHelper errorWithCode:-1000 message:@"Failed to restart match"];
        [(MechanismPearl *)self failAuthenticationWithError:v14];
      }
    }

    return;
  }
  BOOL v5 = [(MechanismPearl *)self request];
  id v6 = [v5 log];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Match is already running, no need to restart.", buf, 2u);
  }
}

- (void)setShowingCoachingHint:(BOOL)a3 reply:(id)a4
{
  matchOperation = self->_matchOperation;
  if (matchOperation)
  {
    BOOL v6 = a3;
    id v12 = 0;
    BOOL v7 = (void (**)(id, id, id))a4;
    id v8 = [(BKMatchPearlOperation *)matchOperation pauseFaceDetectTimer:v6 error:&v12];
    id v9 = v12;
    v7[2](v7, v8, v9);
  }
  else
  {
    id v10 = a4;
    id v11 = +[LAErrorHelper errorWithCode:-1008 message:@"Match not running"];
    (*((void (**)(id, void, id))a4 + 2))(v10, 0, v11);
  }
}

- (id)additionalControllerInternalInfoForPolicy:(int64_t)a3
{
  BOOL v4 = [(MechanismPearl *)self preCompanion];
  if (v4)
  {
    BOOL v5 = [(MechanismPearl *)self preCompanion];
    BOOL v6 = (char *)[v5 eventIdentifier];

    if (v6 == (unsigned char *)&dword_4 + 1)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      id v10[2] = sub_6A88;
      v10[3] = &unk_C548;
      void v10[4] = self;
      uint64_t v7 = sub_6A88((uint64_t)v10);
      id v8 = (void *)v7;
      if (v7)
      {
        CFStringRef v11 = @"FaceIdWithButton";
        uint64_t v12 = v7;
        BOOL v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (void)mechanismEvent:(int64_t)a3 reply:(id)a4
{
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = [(MechanismPearl *)self request];
  CFStringRef v11 = [v10 log];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v30 = a3;
    __int16 v31 = 2114;
    id v32 = v8;
    __int16 v33 = 2114;
    unsigned __int8 v34 = self;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Mechanism event %d(%{public}@) on %{public}@", buf, 0x1Cu);
  }
  if (!self->_hasUI)
  {
    v9[2](v9);
    goto LABEL_27;
  }
  if (a3 == 14 && !self->_facePresent && [v8 intValue] != 11)
  {
    unsigned int v12 = [v8 isEqualToNumber:&off_CA98];
    if (v12)
    {
      if (!self->_faceDetectTimerPaused) {
        goto LABEL_18;
      }
LABEL_12:
      uint64_t v13 = v12 ^ 1;
      matchOperation = self->_matchOperation;
      id v28 = 0;
      unsigned int v15 = [(BKMatchPearlOperation *)matchOperation pauseFaceDetectTimer:v13 error:&v28];
      id v16 = v28;
      if (v15)
      {
        self->_faceDetectTimerPaused = v13;
      }
      else
      {
        __int16 v17 = v11;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_7CAC(v8, (uint64_t)v16, v17);
        }
      }
      goto LABEL_18;
    }
    if (!self->_faceDetectTimerPaused) {
      goto LABEL_12;
    }
  }
LABEL_18:
  BOOL v19 = a3 == 14 || a3 == 3;
  unsigned int v20 = v11;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = (MechanismPearl *)objc_loadWeakRetained((id *)&self->_remoteUiDelegate);
    *(_DWORD *)buf = 67109634;
    int v30 = a3;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    unsigned __int8 v34 = WeakRetained;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Pre-fligthing mechanism event %d (%@) to %@", buf, 0x1Cu);
  }
  coachingFeedbackFilter = self->_coachingFeedbackFilter;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_6EC0;
  v23[3] = &unk_C590;
  unsigned int v24 = v20;
  int64_t v27 = a3;
  id v25 = v8;
  unsigned __int8 v26 = self;
  [(CoachingFeedbackFilter *)coachingFeedbackFilter dispatchNowOrWhenFeedbackDurationAchieved:v19 finish:(unint64_t)(a3 - 1) < 2 block:v23];
  v9[2](v9);

LABEL_27:
}

- (void)_succeedAuthenticationWithResult:(id)a3 identityUUID:(id)a4
{
  BOOL v5 = [(MechanismPearl *)self mergeResult:a3 withUpdateOfIdentityUUID:a4];
  v6.receiver = self;
  v6.super_class = (Class)MechanismPearl;
  [(MechanismPearl *)&v6 succeedAuthenticationWithResult:v5];
}

- (void)_scheduleMatchExpirationWithResult:(id)a3 identityUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_matchResult, a3);
  objc_storeStrong((id *)&self->_matchIdentityUUID, a4);
  id v9 = self->_startedMatching;
  objc_initWeak(&location, self);
  id v10 = +[DaemonUtils sharedInstance];
  CFStringRef v11 = [v10 serverQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_71CC;
  v13[3] = &unk_C5B8;
  objc_copyWeak(&v15, &location);
  unsigned int v12 = v9;
  id v14 = v12;
  +[DaemonUtils dispatchReallyAfter:29900000000 tolerance:v11 queue:v13 block:0.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_expireMatchThatStartedAt:(id)a3
{
  if (self->_startedMatching == a3)
  {
    matchResult = self->_matchResult;
    self->_matchResult = 0;

    matchIdentityUUID = self->_matchIdentityUUID;
    self->_matchIdentityUUID = 0;

    id v7 = &off_CA68;
    id v8 = &off_CBE8;
    objc_super v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [(MechanismPearl *)self noResponseEventWithParams:v6];
  }
}

- (void)handleUIEvent:(int64_t)a3 params:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MechanismPearl;
  [(MechanismPearl *)&v7 handleUIEvent:a3 params:a4];
  if (a3 == 13)
  {
    objc_super v6 = +[LACSecureFaceIDUIUtilities sharedInstance];
    if ([v6 isSupported])
    {
      if ([v6 isEnabled]) {
        [(MechanismPearl *)self _pauseFaceIdAfterSecureUIMovement];
      }
    }
  }
}

- (void)_pauseFaceIdAfterSecureUIMovement
{
  unsigned int v3 = [(MechanismPearl *)self pause:1 forEvent:7 error:0];
  BOOL v4 = LACLogBiometry();
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v12 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ paused after secure UI movement", buf, 0xCu);
    }

    int v6 = ++dword_114D8;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_7514;
    v8[3] = &unk_C5E0;
    objc_copyWeak(&v9, (id *)buf);
    int v10 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_7D3C((uint64_t)self, v5);
    }
  }
}

- (LARemoteUI)remoteUiDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUiDelegate);

  return (LARemoteUI *)WeakRetained;
}

- (void)setRemoteUiDelegate:(id)a3
{
}

- (BOOL)hasFallback
{
  return self->_hasFallback;
}

- (void)setHasFallback:(BOOL)a3
{
  self->_hasFallback = a3;
}

- (BOOL)hasUI
{
  return self->_hasUI;
}

- (void)setHasUI:(BOOL)a3
{
  self->_hasUI = a3;
}

- (BOOL)noRestartWithDoublePress
{
  return self->_noRestartWithDoublePress;
}

- (void)setNoRestartWithDoublePress:(BOOL)a3
{
  self->_noRestartWithDoublePress = a3;
}

- (NSDictionary)matchResult
{
  return self->_matchResult;
}

- (void)setMatchResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingFeedbackFilter, 0);
  objc_storeStrong((id *)&self->_matchIdentityUUID, 0);
  objc_storeStrong((id *)&self->_matchResult, 0);
  objc_storeStrong((id *)&self->_matchFailure, 0);
  objc_storeStrong((id *)&self->_bkInvocation, 0);
  objc_storeStrong((id *)&self->_startedMatching, 0);
  objc_destroyWeak((id *)&self->_remoteUiDelegate);
  objc_storeStrong((id *)&self->_faceDetectTimeout, 0);
  objc_storeStrong((id *)&self->_detectOperation, 0);
  objc_storeStrong((id *)&self->_matchOperation, 0);

  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

@end