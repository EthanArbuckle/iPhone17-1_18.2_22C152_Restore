@interface MechanismPushButton
- (BOOL)_attemptToAddCredentialWithError:(id *)a3;
- (BOOL)_checkDoublePressRequirementEnabled;
- (BOOL)_isMechanismPushButton;
- (BOOL)_pollingAddCredentialWithError:(id *)a3;
- (BOOL)axMode;
- (BOOL)checkCredentialValid;
- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4;
- (BOOL)isCredentialValid;
- (BOOL)secondary;
- (MechanismPushButton)initWithACMContextRecord:(id)a3 secondary:(BOOL)a4 axMode:(BOOL)a5 request:(id)a6;
- (MechanismPushButton)initWithParams:(id)a3 request:(id)a4;
- (double)expirationTimeout;
- (id)descriptionFlags;
- (void)_intentWaiting:(BOOL)a3;
- (void)monitor:(id)a3 axApplePayConfirmation:(BOOL)a4;
- (void)monitor:(id)a3 doubleTapDetected:(BOOL)a4;
- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5;
- (void)willFinish;
@end

@implementation MechanismPushButton

- (MechanismPushButton)initWithParams:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"AcmContextRecord"];
  v9 = [v7 objectForKeyedSubscript:@"Secondary"];
  id v10 = [v9 BOOLValue];
  v11 = [v7 objectForKeyedSubscript:@"AXMode"];

  v12 = -[MechanismPushButton initWithACMContextRecord:secondary:axMode:request:](self, "initWithACMContextRecord:secondary:axMode:request:", v8, v10, [v11 BOOLValue], v6);
  return v12;
}

- (MechanismPushButton)initWithACMContextRecord:(id)a3 secondary:(BOOL)a4 axMode:(BOOL)a5 request:(id)a6
{
  if (a4) {
    uint64_t v9 = 9;
  }
  else {
    uint64_t v9 = 5;
  }
  v14.receiver = self;
  v14.super_class = (Class)MechanismPushButton;
  id v10 = [(MechanismPushButton *)&v14 initWithEventIdentifier:v9 remoteViewController:0 acmContextRecord:a3 request:a6];
  if (v10)
  {
    uint64_t v11 = +[PushButtonMonitor sharedInstance];
    pushButtonMonitor = v10->_pushButtonMonitor;
    v10->_pushButtonMonitor = (PushButtonMonitor *)v11;

    v10->_secondary = a4;
    v10->_axMode = a5;
  }
  return v10;
}

- (BOOL)isAvailableForPurpose:(int64_t)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MechanismPushButton;
  return [(MechanismPushButton *)&v5 isAvailableForPurpose:a3 error:a4];
}

- (id)descriptionFlags
{
  v7.receiver = self;
  v7.super_class = (Class)MechanismPushButton;
  v3 = [(MechanismPushButton *)&v7 descriptionFlags];
  if ([(MechanismPushButton *)self secondary])
  {
    uint64_t v4 = [v3 arrayByAddingObject:@"sec"];

    v3 = (void *)v4;
  }
  if ([(MechanismPushButton *)self axMode])
  {
    uint64_t v5 = [v3 arrayByAddingObject:@"ax"];

    v3 = (void *)v5;
  }

  return v3;
}

- (void)runWithHints:(id)a3 eventsDelegate:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MechanismPushButton *)self fenceReplyWithTouchIdAssertions:a5];
  v35.receiver = self;
  v35.super_class = (Class)MechanismPushButton;
  [(MechanismPushButton *)&v35 runWithHints:v8 eventsDelegate:v9 reply:v10];

  uint64_t v11 = (LAACMHelper *)objc_msgSend(objc_alloc((Class)LAACMHelper), "initWithACMContext:", -[MechanismPushButton acmContext](self, "acmContext"));
  acmHelper = self->_acmHelper;
  self->_acmHelper = v11;

  id v13 = [(MechanismPushButton *)self request];
  if ([v13 isPurposeInAppPayment]
    && +[DaemonUtils deviceSupportsSecureDoubleClick])
  {
    unsigned __int8 v14 = +[DaemonUtils deviceHasPearl];

    if (v14) {
      goto LABEL_9;
    }
    v15 = self->_acmHelper;
    id v34 = 0;
    unsigned int v16 = [(LAACMHelper *)v15 verifyRequirementOfType:21 policy:+[LAACMHelper acmPolicyForPolicy:[(MechanismPushButton *)self policy]] error:&v34];
    id v13 = v34;
    if (v16)
    {
      v17 = sub_1EBC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = self;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ will not be required because biometry match was attempted, simulating credential present", buf, 0xCu);
      }

      v42 = &off_4318;
      v43 = &__kCFBooleanTrue;
      v18 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      [(MechanismPushButton *)self noResponseEventWithParams:v18];

      v19 = [(MechanismPushButton *)self parent];
      [v19 companionStateChanged:self newState:1];
      goto LABEL_33;
    }
  }

LABEL_9:
  if (![(MechanismPushButton *)self secondary])
  {
    v20 = [(PushButtonMonitor *)self->_pushButtonMonitor delegate];
    otherDelegate = self->_otherDelegate;
    self->_otherDelegate = v20;
  }
  [(PushButtonMonitor *)self->_pushButtonMonitor setDelegate:self];
  v22 = [v8 objectForKeyedSubscript:@"MechanismIndex"];
  id v13 = v22;
  if (v22) {
    unsigned int v23 = [v22 intValue];
  }
  else {
    unsigned int v23 = 1;
  }
  unsigned int v24 = v23 + [(MechanismPushButton *)self secondary];
  v25 = sub_1EBC();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v39 = self;
    __int16 v40 = 1024;
    unsigned int v41 = v24;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ running as index:%d", buf, 0x12u);
  }

  v26 = [(MechanismPushButton *)self request];
  unsigned int v27 = [v26 isPurposeInAppPayment];

  if (v27 && v24 == 1)
  {
    CFStringRef v28 = @"it can't be reused for in-app payment";
LABEL_21:
    [(PushButtonMonitor *)self->_pushButtonMonitor consumeDoubleTapWithReason:v28];
    goto LABEL_22;
  }
  if ([(MechanismPushButton *)self policy] == (char *)&stru_3D8.vmaddr + 7)
  {
    CFStringRef v28 = @"it can't be reused for DoublePressBypass";
    goto LABEL_21;
  }
LABEL_22:
  if (+[DaemonUtils deviceHasTouchIDAndSecureDoublePress]&& [(MechanismPushButton *)self policy] != (char *)&stru_3D8.vmaddr + 7)
  {
    unsigned int v31 = 1;
  }
  else
  {
    v29 = [(MechanismPushButton *)self policyOptions];
    v30 = [v29 objectForKeyedSubscript:&off_4330];
    unsigned int v31 = [v30 BOOLValue];
  }
  pushButtonMonitor = self->_pushButtonMonitor;
  if (self->_axMode)
  {
    if ([(PushButtonMonitor *)pushButtonMonitor axDoubleTapDetected]) {
      goto LABEL_28;
    }
  }
  else if (([(PushButtonMonitor *)pushButtonMonitor doubleTapDetected] | v31) == 1)
  {
LABEL_28:
    v33 = self->_pushButtonMonitor;
    if (self->_axMode) {
      [(MechanismPushButton *)self monitor:v33 axApplePayConfirmation:1];
    }
    else {
      [(MechanismPushButton *)self monitor:v33 doubleTapDetected:1];
    }
    goto LABEL_35;
  }
  if ([(MechanismPushButton *)self _checkDoublePressRequirementEnabled])
  {
    [(MechanismPushButton *)self _intentWaiting:1];
    v36 = &off_4318;
    v37 = &__kCFBooleanFalse;
    v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [(MechanismPushButton *)self noResponseEventWithParams:v19];
LABEL_33:
  }
LABEL_35:
}

- (BOOL)_checkDoublePressRequirementEnabled
{
  v3 = [(MechanismPushButton *)self policyOptions];
  uint64_t v4 = [v3 objectForKeyedSubscript:&off_4330];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = +[LAErrorHelper errorWithCode:-1023 message:@"Double press is required."];
    [(MechanismPushButton *)self failAuthenticationWithError:v6];
  }
  return v5 ^ 1;
}

- (void)willFinish
{
  [(MechanismPushButton *)self _intentWaiting:0];
  [(PushButtonMonitor *)self->_pushButtonMonitor stop];
  v3 = [(PushButtonMonitor *)self->_pushButtonMonitor delegate];

  if (v3 == self) {
    [(PushButtonMonitor *)self->_pushButtonMonitor setDelegate:0];
  }
  id prearmAssertion = self->_prearmAssertion;
  self->_id prearmAssertion = 0;
}

- (BOOL)_pollingAddCredentialWithError:(id *)a3
{
  id v19 = 0;
  unsigned __int8 v5 = [(MechanismPushButton *)self _attemptToAddCredentialWithError:&v19];
  id v6 = v19;
  if (v5)
  {
    char v7 = 1;
    unsigned int v8 = 1;
LABEL_12:
    if (v8 >= 2)
    {
      v15 = sub_1EBC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = [(MechanismPushButton *)self secondary];
        v17 = "primary";
        *(_DWORD *)buf = 138543874;
        v21 = self;
        if (v16) {
          v17 = "secondary";
        }
        __int16 v22 = 2080;
        unsigned int v23 = v17;
        __int16 v24 = 1024;
        unsigned int v25 = v8;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ has successfully added the %s credential at attempt #%d", buf, 0x1Cu);
      }
    }
  }
  else
  {
    unsigned int v9 = 0;
    while (1)
    {
      id v10 = sub_1EBC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned int v13 = [(MechanismPushButton *)self secondary];
        *(_DWORD *)buf = 138544386;
        unsigned __int8 v14 = "primary";
        if (v13) {
          unsigned __int8 v14 = "secondary";
        }
        v21 = self;
        __int16 v22 = 2080;
        unsigned int v23 = v14;
        __int16 v24 = 1024;
        unsigned int v25 = v9 + 1;
        __int16 v26 = 1024;
        int v27 = 5;
        __int16 v28 = 2114;
        id v29 = v6;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}@ has failed to add the %s credential at attempt %d/%d: %{public}@", buf, 0x2Cu);
      }

      usleep(0x7530u);
      if (v9 == 4) {
        break;
      }
      id v19 = v6;
      unsigned int v11 = [(MechanismPushButton *)self _attemptToAddCredentialWithError:&v19];
      id v12 = v19;

      ++v9;
      id v6 = v12;
      if (v11)
      {
        char v7 = v9 < 5;
        unsigned int v8 = v9 + 1;
        id v6 = v12;
        goto LABEL_12;
      }
    }
    char v7 = 0;
  }
  if (a3) {
    *a3 = v6;
  }

  return v7;
}

- (BOOL)_attemptToAddCredentialWithError:(id *)a3
{
  acmHelper = self->_acmHelper;
  if ([(MechanismPushButton *)self secondary]) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 5;
  }
  id v16 = 0;
  unsigned int v7 = [(LAACMHelper *)acmHelper addCredential:v6 scope:1 error:&v16];
  id v8 = v16;
  if (!v7)
  {
    unsigned __int8 v10 = 0;
    if (!a3) {
      goto LABEL_11;
    }
LABEL_10:
    *a3 = v8;
    goto LABEL_11;
  }
  if ([(MechanismPushButton *)self policy])
  {
    unsigned int v9 = (const char *)+[LAACMHelper acmPolicyForPolicy:[(MechanismPushButton *)self policy]];
    if (!v9)
    {
      unsigned __int8 v10 = 1;
      if (!a3) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unsigned int v9 = "Oslo";
  }
  id v12 = self->_acmHelper;
  if ([(MechanismPushButton *)self secondary]) {
    uint64_t v13 = 19;
  }
  else {
    uint64_t v13 = 11;
  }
  id v15 = v8;
  unsigned __int8 v10 = [(LAACMHelper *)v12 verifyRequirementOfType:v13 policy:v9 mustBePresent:0 parameter:0 flags:0 error:&v15];
  id v14 = v15;

  id v8 = v14;
  if (a3) {
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (void)_intentWaiting:(BOOL)a3
{
  if (self->_intentWaiting != a3)
  {
    BOOL v3 = a3;
    if ([(MechanismPushButton *)self isRunning])
    {
      self->_intentWaiting = v3;
      unsigned __int8 v5 = @"com.apple.LocalAuthentication.intent.not-waiting";
      if (v3) {
        unsigned __int8 v5 = @"com.apple.LocalAuthentication.intent.waiting";
      }
      uint64_t v6 = v5;
      unsigned int v7 = sub_1EBC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        id v12 = self;
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ is posting %{public}@", (uint8_t *)&v11, 0x16u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v6, 0, 0, 1u);
      if (v3 && ![(MechanismPushButton *)self axMode])
      {
        [(PushButtonMonitor *)self->_pushButtonMonitor start];
        unsigned int v9 = [(PushButtonMonitor *)self->_pushButtonMonitor prearmAssertion];
        id prearmAssertion = self->_prearmAssertion;
        self->_id prearmAssertion = v9;
      }
    }
  }
}

- (void)monitor:(id)a3 doubleTapDetected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(MechanismPushButton *)self axMode]) {
    goto LABEL_11;
  }
  if (!v4)
  {
    self->_credentialValid = 0;
    goto LABEL_6;
  }
  [(MechanismPushButton *)self checkCredentialValid];
  if (!self->_credentialValid)
  {
LABEL_6:
    if (![(MechanismPushButton *)self _checkDoublePressRequirementEnabled]) {
      goto LABEL_11;
    }
  }
  id v12 = &off_4318;
  unsigned int v7 = +[NSNumber numberWithBool:[(MechanismPushButton *)self isCredentialValid]];
  __int16 v13 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [(MechanismPushButton *)self noResponseEventWithParams:v8];

  [(MechanismPushButton *)self _intentWaiting:[(MechanismPushButton *)self isCredentialValid] ^ 1];
  unsigned int v9 = [(MechanismPushButton *)self parent];
  objc_msgSend(v9, "companionStateChanged:newState:", self, -[MechanismPushButton isCredentialValid](self, "isCredentialValid"));

  unsigned __int8 v10 = [(MechanismPushButton *)self parent];
  int v11 = [v10 preCompanion];

  if ([(MechanismPushButton *)self isCredentialValid] && v11 != self) {
    [(MechanismPushButton *)self succeedAuthenticationWithDefaultResult];
  }
  [(PushButtonDelegate *)self->_otherDelegate monitor:v6 doubleTapDetected:v4];
LABEL_11:
}

- (void)monitor:(id)a3 axApplePayConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(MechanismPushButton *)self axMode])
  {
    int v11 = &off_4318;
    unsigned int v7 = +[NSNumber numberWithBool:v4];
    id v12 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [(MechanismPushButton *)self noResponseEventWithParams:v8];

    [(MechanismPushButton *)self _intentWaiting:v4 ^ 1];
    unsigned int v9 = [(MechanismPushButton *)self parent];

    if (v9)
    {
      unsigned __int8 v10 = [(MechanismPushButton *)self parent];
      [v10 companionStateChanged:self newState:v4];
    }
    else
    {
      [(MechanismPushButton *)self succeedAuthenticationWithDefaultResult];
    }
    [(PushButtonDelegate *)self->_otherDelegate monitor:v6 axApplePayConfirmation:v4];
  }
}

- (double)expirationTimeout
{
  BOOL v3 = [(MechanismPushButton *)self request];
  unsigned __int8 v4 = [v3 isPurposeApplePay];

  double result = 30.0;
  if ((v4 & 1) == 0)
  {
    id v6 = (char *)[(MechanismPushButton *)self policy];
    double result = 60.0;
    if (v6 == (unsigned char *)&stru_3D8.vmaddr + 7) {
      return 120.0;
    }
  }
  return result;
}

- (BOOL)checkCredentialValid
{
  if (self->_axMode)
  {
    BOOL v3 = +[PushButtonMonitor sharedInstance];
    self->_credentialValid = [v3 axDoubleTapDetected];

    return [(MechanismPushButton *)self isCredentialValid];
  }
  else
  {
    id v8 = 0;
    BOOL v5 = [(MechanismPushButton *)self _pollingAddCredentialWithError:&v8];
    id v6 = v8;
    self->_credentialValid = v5;
    if ([(MechanismPushButton *)self isCredentialValid]) {
      [(PushButtonMonitor *)self->_pushButtonMonitor adviseDoubleTap];
    }
    BOOL v7 = [(MechanismPushButton *)self isCredentialValid];

    return v7;
  }
}

- (BOOL)_isMechanismPushButton
{
  return 1;
}

- (BOOL)isCredentialValid
{
  return self->_credentialValid;
}

- (BOOL)axMode
{
  return self->_axMode;
}

- (BOOL)secondary
{
  return self->_secondary;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prearmAssertion, 0);
  objc_storeStrong((id *)&self->_otherDelegate, 0);
  objc_storeStrong((id *)&self->_pushButtonMonitor, 0);

  objc_storeStrong((id *)&self->_acmHelper, 0);
}

@end