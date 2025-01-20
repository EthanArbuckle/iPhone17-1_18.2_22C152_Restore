@interface CSHomeButtonSuppressAfterUnlockRecognizer
- (CSHomeButtonSuppressAfterUnlockRecognizer)init;
- (SBHomeButtonSuppressAfterUnlockRecognizerDelegate)delegate;
- (void)_invalidateTimer;
- (void)_requestEndOfSuppression;
- (void)_startTimer;
- (void)_timerFired;
- (void)dealloc;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSHomeButtonSuppressAfterUnlockRecognizer

- (CSHomeButtonSuppressAfterUnlockRecognizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSHomeButtonSuppressAfterUnlockRecognizer;
  v2 = [(CSHomeButtonSuppressAfterUnlockRecognizer *)&v6 init];
  if (v2)
  {
    v3 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "created. starting timer.", v5, 2u);
    }

    [(CSHomeButtonSuppressAfterUnlockRecognizer *)v2 _startTimer];
  }
  return v2;
}

- (void)dealloc
{
  v3 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "deallocating", buf, 2u);
  }

  [(CSHomeButtonSuppressAfterUnlockRecognizer *)self _invalidateTimer];
  v4.receiver = self;
  v4.super_class = (Class)CSHomeButtonSuppressAfterUnlockRecognizer;
  [(CSHomeButtonSuppressAfterUnlockRecognizer *)&v4 dealloc];
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  if (!a3)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    objc_super v6 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_INFO, "finger off", v7, 2u);
    }

    [(CSHomeButtonSuppressAfterUnlockRecognizer *)self _requestEndOfSuppression];
  }
}

- (void)_requestEndOfSuppression
{
  if (!self->_done)
  {
    uint64_t v3 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "calling delegate to request end of suppression", v5, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeButtonSuppressAfterUnlockRecognizerRequestsEndOfSuppression:self];

    self->_done = 1;
  }
}

- (void)_startTimer
{
  objc_initWeak(&location, self);
  uint64_t v3 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSHomeButtonSuppressAfterUnlockRecognizer.timer"];
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CSHomeButtonSuppressAfterUnlockRecognizer__startTimer__block_invoke;
  v8[3] = &unk_1E6AD89D0;
  objc_copyWeak(&v9, &location);
  [(BSAbsoluteMachTimer *)v5 scheduleWithFireInterval:v6 leewayInterval:v8 queue:0.3 handler:0.0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__CSHomeButtonSuppressAfterUnlockRecognizer__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (void)_invalidateTimer
{
  uint64_t v3 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "invalidating timer", v5, 2u);
  }

  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_timerFired
{
  uint64_t v3 = SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_INFO, "timer fired", v4, 2u);
  }

  [(CSHomeButtonSuppressAfterUnlockRecognizer *)self _invalidateTimer];
  [(CSHomeButtonSuppressAfterUnlockRecognizer *)self _requestEndOfSuppression];
}

- (SBHomeButtonSuppressAfterUnlockRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SBHomeButtonSuppressAfterUnlockRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end