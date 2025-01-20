@interface HDFitnessMachineStateTimers
- (BOOL)isDisconnectTimerValid;
- (BOOL)isFieldDetectTimerValid;
- (BOOL)isMachineIdentityVerificationTimerValid;
- (BOOL)isMfaTimerValid;
- (BOOL)isPauseTimerValid;
- (BOOL)isRetryConnectionTimerValid;
- (BOOL)isTagReadTimerValid;
- (BOOL)isUserAcceptanceTimerValid;
- (BOOL)isWaitForMachineStartTimerValid;
- (HDFitnessMachineStateTimers)initWithQueue:(id)a3 delegate:(id)a4;
- (HDFitnessMachineStateTimersDelegate)delegate;
- (void)beginDisconnectTimeout;
- (void)beginFieldDetectTimeout;
- (void)beginMachineIdentityVerificationTimeout;
- (void)beginMfaTimeout;
- (void)beginPauseTimeout;
- (void)beginRetryConnectionTimeout;
- (void)beginTagReadTimeout;
- (void)beginUserAcceptanceTimeout;
- (void)beginWaitForMachineStartTimeout;
- (void)cancelAllTimers;
- (void)cancelDisconnectTimeout;
- (void)cancelFieldDetectTimeout;
- (void)cancelMachineIdentityVerificationTimeout;
- (void)cancelMfaTimeout;
- (void)cancelPauseTimeout;
- (void)cancelRetryConnectionTimeout;
- (void)cancelTagReadTimeout;
- (void)cancelUserAcceptanceTimeout;
- (void)cancelWaitForMachineStartTimeout;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation HDFitnessMachineStateTimers

- (HDFitnessMachineStateTimers)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDFitnessMachineStateTimers;
  v9 = [(HDFitnessMachineStateTimers *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  [(HDFitnessMachineStateTimers *)self cancelAllTimers];
  v3.receiver = self;
  v3.super_class = (Class)HDFitnessMachineStateTimers;
  [(HDFitnessMachineStateTimers *)&v3 dealloc];
}

- (void)cancelAllTimers
{
  [(HDFitnessMachineStateTimers *)self cancelFieldDetectTimeout];
  [(HDFitnessMachineStateTimers *)self cancelTagReadTimeout];
  [(HDFitnessMachineStateTimers *)self cancelMachineIdentityVerificationTimeout];
  [(HDFitnessMachineStateTimers *)self cancelUserAcceptanceTimeout];
  [(HDFitnessMachineStateTimers *)self cancelWaitForMachineStartTimeout];
  [(HDFitnessMachineStateTimers *)self cancelPauseTimeout];
  [(HDFitnessMachineStateTimers *)self cancelDisconnectTimeout];
  [(HDFitnessMachineStateTimers *)self cancelRetryConnectionTimeout];

  [(HDFitnessMachineStateTimers *)self cancelMfaTimeout];
}

- (void)beginFieldDetectTimeout
{
  if (!self || !self->_fieldDetectTimer)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2DA3C;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Field Detect", stru_68.segname, v5, v8);
    sub_2DACC((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    fieldDetectTimer = self->_fieldDetectTimer;
  }
  else {
    fieldDetectTimer = 0;
  }
  sub_2D440((uint64_t)fieldDetectTimer);
}

- (void)cancelFieldDetectTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_fieldDetectTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2DACC((uint64_t)v2, 0);
}

- (BOOL)isFieldDetectTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_fieldDetectTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginTagReadTimeout
{
  if (!self || !self->_tagReadTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2DCB4;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Tag Read", (char *)&dword_1C + 2, v5, v8);
    sub_2DD44((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    tagReadTimer = self->_tagReadTimer;
  }
  else {
    tagReadTimer = 0;
  }
  sub_2D440((uint64_t)tagReadTimer);
}

- (void)cancelTagReadTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_tagReadTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2DD44((uint64_t)v2, 0);
}

- (BOOL)isTagReadTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_tagReadTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginMachineIdentityVerificationTimeout
{
  if (!self || !self->_machineIdentityVerificationTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2DF2C;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Machine Identity Verification", (char *)&dword_0 + 3, v5, v8);
    sub_2DFBC((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    machineIdentityVerificationTimer = self->_machineIdentityVerificationTimer;
  }
  else {
    machineIdentityVerificationTimer = 0;
  }
  sub_2D440((uint64_t)machineIdentityVerificationTimer);
}

- (void)cancelMachineIdentityVerificationTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_machineIdentityVerificationTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2DFBC((uint64_t)v2, 0);
}

- (BOOL)isMachineIdentityVerificationTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_machineIdentityVerificationTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginUserAcceptanceTimeout
{
  if (!self || !self->_userAcceptanceTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2E1A4;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"User Acceptance", stru_248.segname, v5, v8);
    sub_2E234((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    userAcceptanceTimer = self->_userAcceptanceTimer;
  }
  else {
    userAcceptanceTimer = 0;
  }
  sub_2D440((uint64_t)userAcceptanceTimer);
}

- (void)cancelUserAcceptanceTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_userAcceptanceTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2E234((uint64_t)v2, 0);
}

- (BOOL)isUserAcceptanceTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_userAcceptanceTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginWaitForMachineStartTimeout
{
  if (!self || !self->_waitForMachineStartTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2E41C;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Wait for Machine Start", stru_68.segname, v5, v8);
    sub_2E4AC((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    waitForMachineStartTimer = self->_waitForMachineStartTimer;
  }
  else {
    waitForMachineStartTimer = 0;
  }
  sub_2D440((uint64_t)waitForMachineStartTimer);
}

- (void)cancelWaitForMachineStartTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_waitForMachineStartTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2E4AC((uint64_t)v2, 0);
}

- (BOOL)isWaitForMachineStartTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_waitForMachineStartTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginPauseTimeout
{
  if (!self || !self->_pauseTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2E694;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Pause", stru_68.segname, v5, v8);
    sub_2E724((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    pauseTimer = self->_pauseTimer;
  }
  else {
    pauseTimer = 0;
  }
  sub_2D440((uint64_t)pauseTimer);
}

- (void)cancelPauseTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_pauseTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2E724((uint64_t)v2, 0);
}

- (BOOL)isPauseTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_pauseTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginDisconnectTimeout
{
  if (!self || !self->_disconnectTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2E90C;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Disconnect", (char *)&dword_1C + 2, v5, v8);
    sub_2E99C((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    disconnectTimer = self->_disconnectTimer;
  }
  else {
    disconnectTimer = 0;
  }
  sub_2D440((uint64_t)disconnectTimer);
}

- (void)cancelDisconnectTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_disconnectTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2E99C((uint64_t)v2, 0);
}

- (BOOL)isDisconnectTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_disconnectTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginRetryConnectionTimeout
{
  if (!self || !self->_retryConnectionTimer)
  {
    objc_initWeak(&location, self);
    BOOL v3 = [HDFitnessMachineStateTimer alloc];
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v5 = queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2EB84;
    v8[3] = &unk_61630;
    objc_copyWeak(&v9, &location);
    v6 = sub_2D194((id *)&v3->super.isa, @"Retry Connection", (char *)&stru_20.cmd + 3, v5, v8);
    sub_2EC14((uint64_t)self, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (self) {
    retryConnectionTimer = self->_retryConnectionTimer;
  }
  else {
    retryConnectionTimer = 0;
  }
  sub_2D440((uint64_t)retryConnectionTimer);
}

- (void)cancelRetryConnectionTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_retryConnectionTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2EC14((uint64_t)v2, 0);
}

- (BOOL)isRetryConnectionTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_retryConnectionTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (void)beginMfaTimeout
{
  if (!self || !self->_mfaTimer)
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    v4 = [v3 persistentDomainForName:kHKConnectedGymPreferencesDomain];

    v5 = [v4 objectForKeyedSubscript:kHKConnectedGymPreferencesSpartanMFATimeoutOverride];
    int v6 = [v5 intValue];

    if (v6 <= 0) {
      int v6 = 25;
    }
    objc_initWeak(&location, self);
    id v7 = [HDFitnessMachineStateTimer alloc];
    id v8 = (void *)v6;
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v10 = queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_2EE70;
    v13[3] = &unk_61630;
    objc_copyWeak(&v14, &location);
    v11 = sub_2D194((id *)&v7->super.isa, @"MFA", v8, v10, v13);
    sub_2EF00((uint64_t)self, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (self) {
    mfaTimer = self->_mfaTimer;
  }
  else {
    mfaTimer = 0;
  }
  sub_2D440((uint64_t)mfaTimer);
}

- (void)cancelMfaTimeout
{
  v2 = self;
  if (self) {
    self = (HDFitnessMachineStateTimers *)self->_mfaTimer;
  }
  sub_2D2AC((uint64_t)self);

  sub_2EF00((uint64_t)v2, 0);
}

- (BOOL)isMfaTimerValid
{
  if (!self) {
    return 0;
  }
  v2 = self->_mfaTimer;
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2->_timer != 0;

  return v3;
}

- (HDFitnessMachineStateTimersDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDFitnessMachineStateTimersDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mfaTimer, 0);
  objc_storeStrong((id *)&self->_retryConnectionTimer, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_waitForMachineStartTimer, 0);
  objc_storeStrong((id *)&self->_userAcceptanceTimer, 0);
  objc_storeStrong((id *)&self->_machineIdentityVerificationTimer, 0);
  objc_storeStrong((id *)&self->_tagReadTimer, 0);
  objc_storeStrong((id *)&self->_fieldDetectTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end