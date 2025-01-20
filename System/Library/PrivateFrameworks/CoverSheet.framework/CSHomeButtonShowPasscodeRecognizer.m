@interface CSHomeButtonShowPasscodeRecognizer
- (CSHomeButtonShowPasscodeRecognizer)initWithFingerOn:(BOOL)a3;
- (NSString)description;
- (SBHomeButtonShowPasscodeRecognizerDelegate)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_state;
- (void)_invalidateMinimumTimer;
- (void)_minimumTimerFired;
- (void)_reallySetState:(unint64_t)a3 forReason:(id)a4;
- (void)_switchedFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)dealloc;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)noteAuthenticated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSHomeButtonShowPasscodeRecognizer

- (CSHomeButtonShowPasscodeRecognizer)initWithFingerOn:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CSHomeButtonShowPasscodeRecognizer;
  v4 = [(CSHomeButtonShowPasscodeRecognizer *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_fingerWasOnInitially = a3;
    v6 = [MEMORY[0x1E4F4F718] builderWithObject:v4];
    uint64_t v7 = [v6 build];
    simplePublicDescription = v5->_simplePublicDescription;
    v5->_simplePublicDescription = (NSString *)v7;

    v9 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v5->_simplePublicDescription;
      v11 = NSStringFromBOOL();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_INFO, "Initialized %{public}@ with finger on: %{public}@", buf, 0x16u);
    }
    [(CSHomeButtonShowPasscodeRecognizer *)v5 _reallySetState:1 forReason:@"InitializedFromHomeButtonPress"];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(CSHomeButtonShowPasscodeRecognizer *)self _invalidateMinimumTimer];
  v3 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    simplePublicDescription = self->_simplePublicDescription;
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = simplePublicDescription;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "[%{public}@] dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)CSHomeButtonShowPasscodeRecognizer;
  [(CSHomeButtonShowPasscodeRecognizer *)&v5 dealloc];
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v5 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:](a3, v5);
  }

  if (self->_state - 3 >= 2)
  {
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
    {
      v6 = NSString;
      uint64_t v7 = NSStringFromSBUIBiometricEvent();
      [v6 stringWithFormat:@"BiometricEventRequiresPasscode: %@", v7];
      uint64_t v8 = LABEL_7:;
      [(CSHomeButtonShowPasscodeRecognizer *)self _reallySetState:3 forReason:v8];

LABEL_8:
      return;
    }
    if (a3 - 9 <= 1)
    {
      v9 = NSString;
      uint64_t v7 = NSStringFromSBUIBiometricEvent();
      [v9 stringWithFormat:@"MatchFailure: %@", v7];
      goto LABEL_7;
    }
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t v7 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:]((uint64_t)self, v7);
        }
        goto LABEL_8;
      }
    }
    else
    {
      v10 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:]((uint64_t)self, v10);
      }

      if (self->_fingerWasOnInitially)
      {
        self->_fingerHasLifted = 1;
        v11 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          simplePublicDescription = self->_simplePublicDescription;
          *(_DWORD *)buf = 138543362;
          v14 = simplePublicDescription;
          _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_INFO, "[%{public}@] initial finger down has lifted", buf, 0xCu);
        }

        if (self->_state == 2) {
          [(CSHomeButtonShowPasscodeRecognizer *)self _reallySetState:3 forReason:@"Finger Off After Minimum Timer Has Passed"];
        }
      }
    }
  }
}

- (void)noteAuthenticated:(BOOL)a3
{
  if (self->_state - 3 >= 2)
  {
    BOOL v3 = a3;
    objc_super v5 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(CSHomeButtonShowPasscodeRecognizer *)(uint64_t)self noteAuthenticated:v5];
    }

    if (v3) {
      [(CSHomeButtonShowPasscodeRecognizer *)self _reallySetState:4 forReason:@"Authenticated"];
    }
  }
}

- (void)_reallySetState:(unint64_t)a3 forReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t state = self->_state;
  if (state != a3 && state - 3 >= 2)
  {
    self->_unint64_t state = a3;
    v10 = SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      simplePublicDescription = self->_simplePublicDescription;
      unint64_t v12 = self->_state - 1;
      if (v12 > 3) {
        objc_super v13 = @"Initial";
      }
      else {
        objc_super v13 = off_1E6ADAEC8[v12];
      }
      int v14 = 138543874;
      uint64_t v15 = simplePublicDescription;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_INFO, "[%{public}@] changed to state: %{public}@ for reason: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    [(CSHomeButtonShowPasscodeRecognizer *)self _switchedFromState:state toState:self->_state];
    if (self->_state - 3 <= 1) {
      objc_storeStrong((id *)&self->_terminalStateReasoning, a4);
    }
  }
}

- (void)_switchedFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a3 == 1) {
    [(CSHomeButtonShowPasscodeRecognizer *)self _invalidateMinimumTimer];
  }
  switch(a4)
  {
    case 4uLL:
      [WeakRetained homeButtonShowPasscodeRecognizerDidFailToRecognize:self];
      break;
    case 3uLL:
      [WeakRetained homeButtonShowPasscodeRecognizerRequestsPasscodeUIToBeShown:self];
      break;
    case 1uLL:
      objc_initWeak(&location, self);
      uint64_t v8 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSHomeButtonShowPasscodeRecognizer.minimumTimer"];
      minimumTimer = self->_minimumTimer;
      self->_minimumTimer = v8;

      v10 = self->_minimumTimer;
      uint64_t v11 = MEMORY[0x1E4F14428];
      id v12 = MEMORY[0x1E4F14428];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__CSHomeButtonShowPasscodeRecognizer__switchedFromState_toState___block_invoke;
      v13[3] = &unk_1E6AD89D0;
      objc_copyWeak(&v14, &location);
      [(BSAbsoluteMachTimer *)v10 scheduleWithFireInterval:v11 leewayInterval:v13 queue:0.15 handler:0.0];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      break;
  }
}

void __65__CSHomeButtonShowPasscodeRecognizer__switchedFromState_toState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _minimumTimerFired];
}

- (NSString)description
{
  return (NSString *)[(CSHomeButtonShowPasscodeRecognizer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CSHomeButtonShowPasscodeRecognizer *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(CSHomeButtonShowPasscodeRecognizer *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(CSHomeButtonShowPasscodeRecognizer *)self succinctDescriptionBuilder];
  objc_super v5 = v4;
  unint64_t v6 = self->_state - 1;
  if (v6 > 3) {
    id v7 = @"Initial";
  }
  else {
    id v7 = off_1E6ADAEC8[v6];
  }
  [v4 appendString:v7 withName:@"state"];
  id v8 = (id)[v5 appendBool:self->_minimumTimer != 0 withName:@"minimumTimerActive"];
  id v9 = (id)[v5 appendBool:self->_fingerWasOnInitially withName:@"initialFingerOn?"];
  id v10 = (id)[v5 appendBool:self->_fingerHasLifted withName:@"initialFingerOnHasLifted?"];
  if (self->_state - 3 <= 1) {
    id v11 = (id)[v5 appendObject:self->_terminalStateReasoning withName:@"finalStateReason"];
  }

  return v5;
}

- (unint64_t)_state
{
  return self->_state;
}

- (void)_invalidateMinimumTimer
{
  [(BSAbsoluteMachTimer *)self->_minimumTimer invalidate];
  minimumTimer = self->_minimumTimer;
  self->_minimumTimer = 0;
}

- (void)_minimumTimerFired
{
  [(CSHomeButtonShowPasscodeRecognizer *)self _invalidateMinimumTimer];
  if (self->_state != 1) {
    return;
  }
  if (self->_fingerWasOnInitially)
  {
    if (!self->_fingerHasLifted)
    {
      BOOL v3 = @"MinimumTimeToShowPasscodePassed - finger on initially but hasn't yet lifted";
      v4 = self;
      uint64_t v5 = 2;
      goto LABEL_9;
    }
    BOOL v3 = @"MinimumTimerExpired - was on initially and lifted during the minimum timer.";
  }
  else
  {
    BOOL v3 = @"MinimumTimerExpired - finger was not on at the time the home button press recognized";
  }
  v4 = self;
  uint64_t v5 = 3;
LABEL_9:

  [(CSHomeButtonShowPasscodeRecognizer *)v4 _reallySetState:v5 forReason:v3];
}

- (SBHomeButtonShowPasscodeRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SBHomeButtonShowPasscodeRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalStateReasoning, 0);
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_simplePublicDescription, 0);
}

- (void)handleBiometricEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D839D000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] fingerOn", (uint8_t *)&v3, 0xCu);
}

- (void)handleBiometricEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D839D000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] fingerOff", (uint8_t *)&v3, 0xCu);
}

- (void)handleBiometricEvent:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = NSStringFromSBUIBiometricEvent();
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D839D000, a2, OS_LOG_TYPE_DEBUG, "Received biometric event: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)noteAuthenticated:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = NSStringFromBOOL();
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D839D000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] authenticated: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end