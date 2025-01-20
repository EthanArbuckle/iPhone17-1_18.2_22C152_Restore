@interface MechanismPasscode
- (BOOL)_handleIntentConfirmationWithResult:(id)a3 error:(id)a4 finishingSecureIntent:(BOOL)a5 otherIsSecureInput:(BOOL)a6 reply:(id)a7;
- (BOOL)_isInFamiliarLocationWithError:(id *)a3;
- (BOOL)_startSecureIntentWithOptions:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4;
- (BOOL)precedesUI;
- (BackoffCounter)backoffCounter;
- (MechanismPasscode)initWithAcmContextRecord:(id)a3 userId:(id)a4 request:(id)a5;
- (MechanismPasscode)initWithParams:(id)a3 request:(id)a4;
- (id)_checkSoftLimitWithFailedAttempt;
- (id)backgroundMechanismForEventProcessing:(id)a3;
- (void)_startPasscodeMechanismWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (void)companionStateChanged:(id)a3 newState:(BOOL)a4;
- (void)enterPassphrase:(id)a3 reply:(id)a4;
- (void)finishRunWithResult:(id)a3 error:(id)a4 skipReply:(BOOL)a5;
- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (void)setCredential:(id)a3 credentialType:(int64_t)a4 reply:(id)a5;
@end

@implementation MechanismPasscode

- (MechanismPasscode)initWithParams:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"AcmContextRecord"];
  v9 = [v7 objectForKeyedSubscript:@"UserId"];

  v10 = [(MechanismPasscode *)self initWithAcmContextRecord:v8 userId:v9 request:v6];
  return v10;
}

- (MechanismPasscode)initWithAcmContextRecord:(id)a3 userId:(id)a4 request:(id)a5
{
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MechanismPasscode;
  v10 = [(MechanismPasscode *)&v16 initWithEventIdentifier:2 remoteViewController:2 acmContextRecord:a3 request:a5];
  if (v10)
  {
    uint64_t v11 = +[BackoffCounter sharedInstance];
    v12 = *(void **)(v10 + 60);
    *(void *)(v10 + 60) = v11;

    v13 = +[BackoffCounter sharedInstance];
    v14 = +[MechanismContext sharedInstance];
    [v14 setBackoffCounter:v13];

    objc_storeStrong((id *)(v10 + 52), a4);
  }

  return (MechanismPasscode *)v10;
}

- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4
{
  id v7 = +[LAPasscodeHelper sharedInstance];
  unsigned __int8 v8 = objc_msgSend(v7, "isPasscodeSetForUser:error:", objc_msgSend(*(id *)(&self->_credentialPresent + 4), "unsignedIntValue"), a4);

  if ((v8 & 1) == 0)
  {
    id v9 = [(MechanismPasscode *)self request];
    unsigned int v10 = +[LAUtils isPolicyAcceptingEmptyPassword:](LAUtils, "isPolicyAcceptingEmptyPassword:", [v9 policy]);

    if (!v10) {
      return 0;
    }
    uint64_t v11 = sub_6470();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(MechanismPasscode *)self request];
      *(_DWORD *)buf = 67109378;
      unsigned int v41 = [v12 policy];
      __int16 v42 = 2082;
      v43 = "passcode not set";
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Policy %d will accept %{public}s.", buf, 0x12u);
    }
  }
  v13 = [(MechanismPasscode *)self request];
  v14 = [v13 options];
  v15 = [v14 objectForKeyedSubscript:&off_1C830];
  unsigned int v16 = [v15 BOOLValue];

  if (!v16) {
    goto LABEL_17;
  }
  v17 = [(MechanismPasscode *)self request];
  v18 = [v17 dtoEnvironment];
  v19 = [v18 featureState];
  if (![v19 isAvailable]) {
    goto LABEL_16;
  }
  v20 = [(MechanismPasscode *)self request];
  v21 = [v20 dtoEnvironment];
  v22 = [v21 featureState];
  if (![v22 isEnabled])
  {

LABEL_16:
LABEL_17:
    v39.receiver = self;
    v39.super_class = (Class)MechanismPasscode;
    return [(MechanismPasscode *)&v39 isAvailableForPurpose:a3 error:a4];
  }
  v38 = v22;
  v23 = [(MechanismPasscode *)self request];
  unsigned int v24 = [v23 isPurposeApplePay];
  unsigned int v25 = v24;
  if (v24)
  {
    unsigned int v36 = v24;
    v26 = +[BiometryHelper sharedInstance];
    v33 = [(MechanismPasscode *)self internalOptions];
    [v33 objectForKeyedSubscript:@"UserId"];
    v32 = v34 = v26;
    if (!objc_msgSend(v26, "isBiometryOnForApplePay:"))
    {
      BOOL v37 = 0;
      goto LABEL_19;
    }
    unsigned int v25 = v36;
  }
  [(MechanismPasscode *)self request];
  v35 = v21;
  v27 = v20;
  v29 = v28 = v23;
  v30 = [v29 acl];
  BOOL v37 = v30 == 0;

  v23 = v28;
  v20 = v27;
  v21 = v35;
  if (v25)
  {
LABEL_19:
  }
  if (!v37) {
    goto LABEL_17;
  }
  return [(MechanismPasscode *)self _isInFamiliarLocationWithError:a4];
}

- (BOOL)_isInFamiliarLocationWithError:(id *)a3
{
  v5 = [(MechanismPasscode *)self request];
  id v6 = [v5 dtoEnvironment];

  if (v6)
  {
    id v7 = [(MechanismPasscode *)self request];
    unsigned __int8 v8 = [v7 dtoEnvironment];
    unsigned __int8 v9 = [v8 inFamiliarLocation];

    if (v9)
    {
      unsigned int v10 = 0;
      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    uint64_t v11 = +[LAErrorHelper errorWithCode:-1 message:@"Passcode can't be used"];
  }
  else
  {
    uint64_t v11 = +[LAErrorHelper internalErrorWithMessage:@"Missing DTO environment"];
  }
  unsigned int v10 = (void *)v11;
  if (a3) {
LABEL_8:
  }
    *a3 = v10;
LABEL_9:

  return v10 == 0;
}

- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_68F8;
  v29[3] = &unk_1C418;
  objc_copyWeak(&v33, location);
  id v11 = v8;
  id v30 = v11;
  id v12 = v9;
  id v31 = v12;
  id v13 = v10;
  id v32 = v13;
  v14 = objc_retainBlock(v29);
  v15 = *(void **)(&self->_beingCanceledByOtherConfirmation + 4);
  *(void *)(&self->_beingCanceledByOtherConfirmation + 4) = v14;

  unsigned int v16 = [(MechanismPasscode *)self preCompanion];

  if (v16)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_694C;
    v26[3] = &unk_1C440;
    objc_copyWeak(&v28, location);
    id v17 = v13;
    id v27 = v17;
    if (![(MechanismPasscode *)self _startSecureIntentWithOptions:v11 eventsDelegate:v12 reply:v26]|| +[DaemonUtils deviceHasTouchID])
    {
      v18 = [v11 objectForKeyedSubscript:@"Options"];
      v19 = [v18 objectForKeyedSubscript:&off_1C848];
      unsigned int v20 = [v19 BOOLValue];

      if (v20)
      {
        v21 = +[LAErrorHelper errorWithCode:-1023 message:@"Running push button concurrently"];
        [(MechanismPasscode *)self _handleIntentConfirmationWithResult:0 error:v21 finishingSecureIntent:0 otherIsSecureInput:0 reply:v17];
      }
      v22 = [(MechanismPasscode *)self preCompanion];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_69D4;
      v23[3] = &unk_1C440;
      objc_copyWeak(&v25, location);
      id v24 = v17;
      [v22 runWithHints:v11 eventsDelegate:v12 reply:v23];

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v28);
  }
  else
  {
    (*(void (**)(void))(*(void *)(&self->_beingCanceledByOtherConfirmation + 4) + 16))();
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

- (void)_startPasscodeMechanismWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MechanismPasscode;
  [(MechanismPasscode *)&v10 runWithHints:a3 eventsDelegate:a4 reply:a5];
  id v6 = [(MechanismPasscode *)self policyOptions];
  uint64_t v7 = [v6 objectForKey:&off_1C860];
  id v8 = *(void **)((char *)&self->_failures + 4);
  *(unint64_t *)((char *)&self->_failures + 4) = v7;

  *(void *)(&self->super + 1) = 0;
  id v9 = *(void **)(&self->_beingCanceledByOtherConfirmation + 4);
  *(void *)(&self->_beingCanceledByOtherConfirmation + 4) = 0;
}

- (BOOL)_startSecureIntentWithOptions:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  return 0;
}

- (BOOL)_handleIntentConfirmationWithResult:(id)a3 error:(id)a4 finishingSecureIntent:(BOOL)a5 otherIsSecureInput:(BOOL)a6 reply:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = (__CFString *)a4;
  v14 = (void (**)(id, void, id))a7;
  if (a6)
  {
    v15 = 0;
  }
  else
  {
    v15 = [(MechanismPasscode *)self preCompanion];
  }
  if (v9) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = v15;
  }
  if (v9) {
    id v17 = v15;
  }
  else {
    id v17 = 0;
  }
  v18 = v16;
  v19 = v17;
  unsigned int v20 = [(MechanismPasscode *)self request];
  v21 = [v20 log];

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v36 = @"success";
    *(_DWORD *)buf = 138544130;
    if (!v12) {
      CFStringRef v36 = v13;
    }
    objc_super v39 = self;
    __int16 v40 = 2114;
    CFStringRef v41 = v36;
    __int16 v42 = 2114;
    v43 = v18;
    __int16 v44 = 2114;
    v45 = v19;
    _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%{public}@ is handling intent confirmation result: %{public}@, finishing: %{public}@, other: %{public}@", buf, 0x2Au);
  }

  unsigned int v22 = +[LAErrorHelper error:v13 hasCode:-1023];
  if (v12) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v22;
  }
  if (v23)
  {
    unsigned int v24 = v22;
    BOOL v37 = v14;
    id v25 = [(MechanismPasscode *)self request];
    v26 = [v25 log];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v24 ? "been skipped by option" : "confirmed intent";
      if (v19)
      {
        id v28 = v27;
        uint64_t v29 = +[NSString stringWithFormat:@", %@ will be canceled", v19];
        id v27 = v28;
        id v30 = (__CFString *)v29;
      }
      else
      {
        id v30 = &stru_1C6A0;
      }
      *(_DWORD *)buf = 138544130;
      objc_super v39 = self;
      __int16 v40 = 2114;
      CFStringRef v41 = (const __CFString *)v18;
      __int16 v42 = 2082;
      v43 = v27;
      __int16 v44 = 2114;
      v45 = v30;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ will start after %{public}@ has %{public}s%{public}@", buf, 0x2Au);
      if (v19) {
    }
      }
    if ((v24 & 1) == 0)
    {
      id v31 = [v12 objectForKeyedSubscript:@"Result"];
      [(MechanismPasscode *)self yieldPartialResult:v31];
    }
    uint64_t v32 = *(void *)(&self->_beingCanceledByOtherConfirmation + 4);
    v14 = v37;
    if (v32) {
      (*(void (**)(void))(v32 + 16))();
    }
    if ([(__CFString *)v19 isRunning])
    {
      id v33 = +[NSString stringWithFormat:@"Canceled by %@", v18];
      BYTE4(self->_failureLimit) = 1;
      v34 = +[LAErrorHelper errorWithCode:-2 message:v33];
      [(__CFString *)v19 failAuthenticationWithError:v34];
    }
  }
  else if (([(MechanismPasscode *)self isRunning] & 1) == 0 {
         && ([(__CFString *)v19 isRunning] & 1) == 0
  }
         && !BYTE4(self->_failureLimit))
  {
    v14[2](v14, 0, v13);
  }

  return v23;
}

- (void)finishRunWithResult:(id)a3 error:(id)a4 skipReply:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)MechanismPasscode;
  [(MechanismPasscode *)&v5 finishRunWithResult:a3 error:a4 skipReply:a5];
}

- (void)enterPassphrase:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void *))a4;
  id v8 = sub_6470();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v42 = "-[MechanismPasscode enterPassphrase:reply:]";
    __int16 v43 = 2112;
    __int16 v44 = self;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v9 = [*(id *)((char *)&self->_userId + 4) errorAuthenticationFailedWithBackoff];
  if (v9)
  {
    objc_super v10 = (void *)v9;
    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = 3;
  }
  else
  {
    v38 = v7;
    v14 = +[LAPasscodeHelper sharedInstance];
    v15 = [(MechanismPasscode *)self externalizedContext];
    unsigned int v16 = [(MechanismPasscode *)self internalOptions];
    id v17 = [v16 objectForKeyedSubscript:@"UserId"];
    id v18 = [(MechanismPasscode *)self policy];
    v19 = [(MechanismPasscode *)self policyOptions];
    [(MechanismPasscode *)self request];
    v21 = unsigned int v20 = v6;
    id v22 = objc_msgSend(v14, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:", v20, v15, v17, v18, v19, objc_msgSend(v21, "isRecoveringFromBiolockout"));

    id v6 = v20;
    [v20 reset];
    uint64_t v7 = v38;
    switch((unint64_t)v22)
    {
      case 0uLL:
        [*(id *)((char *)&self->_userId + 4) actionSuccess];
        BOOL v23 = [(MechanismPasscode *)self preCompanion];
        if ([v23 eventIdentifier] == (char *)&dword_4 + 1)
        {
          unsigned int v24 = [(MechanismPasscode *)self policyOptions];
          id v25 = [v24 objectForKeyedSubscript:&off_1C848];
          unsigned int v26 = [v25 BOOLValue];

          if (v26)
          {
            id v27 = [(MechanismPasscode *)self preCompanion];
            unsigned __int8 v28 = [v27 checkCredentialValid];

            if ((v28 & 1) == 0)
            {
              id v12 = +[LAErrorHelper errorWithCode:-1023 message:@"Double press is required."];
              goto LABEL_26;
            }
          }
        }
        else
        {
        }
        id v12 = 0;
LABEL_26:
        [(MechanismPasscode *)self yieldPartialResult:3 value:&__kCFBooleanTrue];
        objc_super v10 = 0;
        uint64_t v13 = 0;
        uint64_t v11 = 1;
        break;
      case 1uLL:
        uint64_t v29 = [*(id *)((char *)&self->_userId + 4) actionFailure];
        if (!v29)
        {
          uint64_t v29 = +[LAErrorHelper errorWithCode:-1 message:@"Passcode rejected."];
        }
        objc_super v10 = (void *)v29;
        uint64_t v13 = 1;
        goto LABEL_16;
      case 2uLL:
      case 4uLL:
        objc_super v10 = [*(id *)((char *)&self->_userId + 4) actionFailureWithBackoffResult];
        uint64_t v13 = 2;
        goto LABEL_16;
      case 3uLL:
        objc_super v10 = +[LAErrorHelper internalErrorWithMessage:@"Unexpected failure during passcode verification."];
        uint64_t v13 = 3;
        goto LABEL_16;
      default:
        objc_super v10 = 0;
        uint64_t v13 = 3;
        uint64_t v7 = v38;
LABEL_16:
        id v12 = [(MechanismPasscode *)self _checkSoftLimitWithFailedAttempt];
        uint64_t v11 = 0;
        break;
    }
  }
  id v30 = [(MechanismPasscode *)self request];
  id v31 = [v30 analytics];
  objc_msgSend(v31, "authenticationAttempt:event:", v13, -[MechanismPasscode eventIdentifier](self, "eventIdentifier"));

  objc_super v39 = &off_1C878;
  uint64_t v32 = +[NSNumber numberWithBool:v11];
  __int16 v40 = v32;
  id v33 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  [(MechanismPasscode *)self noResponseEventWithParams:v33];

  v7[2](v7, v11, v10);
  if (v12)
  {
    [(MechanismPasscode *)self failAuthenticationWithError:v12];
  }
  else if (v11)
  {
    v34 = [(MechanismPasscode *)self postCompanion];

    if (v34)
    {
      v35 = [(MechanismPasscode *)self postCompanion];
      CFStringRef v36 = [(MechanismPasscode *)self internalOptions];
      BOOL v37 = [(MechanismPasscode *)self eventsDelegate];
      [v35 runWithHints:v36 eventsDelegate:v37 reply:&stru_1C480];
    }
    else
    {
      [(MechanismPasscode *)self succeedAuthenticationWithResult:&__NSDictionary0__struct];
    }
  }
}

- (id)_checkSoftLimitWithFailedAttempt
{
  if (*(unint64_t *)((char *)&self->_failures + 4)
    && (unint64_t v2 = *(void *)(&self->super + 1) + 1,
        *(void *)(&self->super + 1) = v2,
        v2 > (unint64_t)[*(id *)((char *)&self->_failures + 4) unsignedIntegerValue]))
  {
    v3 = +[LAErrorHelper errorWithCode:-1 message:@"Application retry limit exceeded."];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCredential:(id)a3 credentialType:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = +[LACSecureData secureDataWithBytes:length:](LACSecureData, "secureDataWithBytes:length:", [v8 bytes], objc_msgSend(v8, "length"));
  if (a4 == -1)
  {
    [(MechanismPasscode *)self enterPassphrase:v10 reply:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MechanismPasscode;
    [(MechanismPassphrase *)&v11 setCredential:v8 credentialType:a4 reply:v9];
  }
}

- (id)backgroundMechanismForEventProcessing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MechanismPasscode;
  v3 = [(MechanismPasscode *)&v5 backgroundMechanismForEventProcessing:a3];

  return v3;
}

- (BOOL)precedesUI
{
  unint64_t v2 = [(MechanismPasscode *)self preCompanion];
  unsigned __int8 v3 = [v2 isRunning];

  return v3;
}

- (void)companionStateChanged:(id)a3 newState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(MechanismPasscode *)self request];
  id v8 = [v7 log];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = "not present";
    *(_DWORD *)id v18 = 138543874;
    *(void *)&v18[4] = self;
    if (v4) {
      id v9 = "present";
    }
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v6;
    __int16 v19 = 2080;
    unsigned int v20 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has been notified by %{public}@ that the credential is %s", v18, 0x20u);
  }

  id v10 = [(MechanismPasscode *)self preCompanion];

  if (v10 != v6)
  {
    id v12 = [(MechanismPasscode *)self postCompanion];

    if (v12 == v6)
    {
      if (v4)
      {
        [(MechanismPasscode *)self yieldPartialResult:18 value:&__kCFBooleanTrue];
        [(MechanismPasscode *)self succeedAuthenticationWithResult:&__NSDictionary0__struct];
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v13 = [(MechanismPasscode *)self request];
      v14 = [v13 log];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_17BCC((uint64_t)v6, self, v14);
      }

      if (v4) {
        goto LABEL_19;
      }
    }
LABEL_17:
    if (!*(void *)(&self->_beingCanceledByOtherConfirmation + 4))
    {
      id v17 = +[LAErrorHelper errorWithCode:-4 subcode:9 message:@"Double click credential expired"];
      [(MechanismPasscode *)self finishRunWithResult:0 error:v17];
    }
    goto LABEL_19;
  }
  BYTE4(self->_runBlock) = v4;
  if (!v4) {
    goto LABEL_17;
  }
  uint64_t v15 = *(void *)(&self->_beingCanceledByOtherConfirmation + 4);
  if (v15)
  {
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v11);
    unsigned int v16 = *(void **)(&self->_beingCanceledByOtherConfirmation + 4);
    *(void *)(&self->_beingCanceledByOtherConfirmation + 4) = 0;
  }
  -[MechanismPasscode yieldPartialResult:value:](self, "yieldPartialResult:value:", 9, &__kCFBooleanTrue, *(_OWORD *)v18);
LABEL_19:
}

- (BackoffCounter)backoffCounter
{
  return *(BackoffCounter **)((char *)&self->_userId + 4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_userId + 4), 0);
  objc_storeStrong((id *)(&self->_credentialPresent + 4), 0);
  objc_storeStrong((id *)(&self->_beingCanceledByOtherConfirmation + 4), 0);

  objc_storeStrong((id *)((char *)&self->_failures + 4), 0);
}

@end