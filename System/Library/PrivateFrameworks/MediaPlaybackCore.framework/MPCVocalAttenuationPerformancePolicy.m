@interface MPCVocalAttenuationPerformancePolicy
- (BOOL)canBeReset;
- (BOOL)shouldDisableVocalAttenuation;
- (MPCVocalAttenuationPerformancePolicy)initWithPerformanceLimit:(double)a3 calloutQueue:(id)a4 delegate:(id)a5;
- (MPCVocalAttenuationPolicyDelegate)delegate;
- (OS_dispatch_queue)calloutQueue;
- (double)performanceLimit;
- (double)timeOfFirstGlitch;
- (double)timeThreshold;
- (id)evaluation;
- (int)currentNumberOfGlitches;
- (int)glitchesThreshold;
- (int64_t)type;
- (os_unfair_lock_s)dataLock;
- (void)processSample:(double)a3;
- (void)reset;
- (void)setCalloutQueue:(id)a3;
- (void)setCurrentNumberOfGlitches:(int)a3;
- (void)setDisableVocalAttenuation:(BOOL)a3;
- (void)setGlitchesThreshold:(int)a3;
- (void)setPerformanceLimit:(double)a3;
- (void)setTimeOfFirstGlitch:(double)a3;
- (void)setTimeThreshold:(double)a3;
- (void)updateEvaluationWithReason:(id)a3;
@end

@implementation MPCVocalAttenuationPerformancePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (os_unfair_lock_s)dataLock
{
  return self->_dataLock;
}

- (void)setCalloutQueue:(id)a3
{
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (void)setGlitchesThreshold:(int)a3
{
  self->_glitchesThreshold = a3;
}

- (int)glitchesThreshold
{
  return self->_glitchesThreshold;
}

- (void)setCurrentNumberOfGlitches:(int)a3
{
  self->_currentNumberOfGlitches = a3;
}

- (int)currentNumberOfGlitches
{
  return self->_currentNumberOfGlitches;
}

- (void)setTimeThreshold:(double)a3
{
  self->_timeThreshold = a3;
}

- (double)timeThreshold
{
  return self->_timeThreshold;
}

- (void)setTimeOfFirstGlitch:(double)a3
{
  self->_timeOfFirstGlitch = a3;
}

- (double)timeOfFirstGlitch
{
  return self->_timeOfFirstGlitch;
}

- (void)setPerformanceLimit:(double)a3
{
  self->_performanceLimit = a3;
}

- (double)performanceLimit
{
  return self->_performanceLimit;
}

- (int64_t)type
{
  return self->_type;
}

- (MPCVocalAttenuationPolicyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPCVocalAttenuationPolicyDelegate *)WeakRetained;
}

- (void)updateEvaluationWithReason:(id)a3
{
  id v4 = a3;
  v5 = [(MPCVocalAttenuationPerformancePolicy *)self evaluation];
  v6 = [v5 explanation];
  v7 = [v6 stringByAppendingFormat:@" [%@]", v4];

  [v5 setExplanation:v7];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__MPCVocalAttenuationPerformancePolicy_updateEvaluationWithReason___block_invoke;
  block[3] = &unk_2643C5EE8;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(calloutQueue, block);
}

void __67__MPCVocalAttenuationPerformancePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 vocalAttenuationPolicy:*(void *)(a1 + 32) didChangeEvaluation:*(void *)(a1 + 40)];
}

- (void)processSample:(double)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation])
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138543362;
      v30 = self;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEBUG, "[AP] - %{public}@ - ignoring sample [policy already active]", (uint8_t *)&v29, 0xCu);
    }

    return;
  }
  os_unfair_lock_lock(&self->_dataLock);
  v6 = [MEMORY[0x263F08AB0] processInfo];
  [v6 systemUptime];
  double v8 = v7;

  id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 138543874;
    v30 = self;
    __int16 v31 = 1024;
    *(_DWORD *)v32 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
    *(_WORD *)&v32[4] = 2048;
    *(double *)&v32[6] = v8;
    _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEBUG, "[AP] - %{public}@ - %{BOOL}u - process sample - %fs", (uint8_t *)&v29, 0x1Cu);
  }

  [(MPCVocalAttenuationPerformancePolicy *)self performanceLimit];
  if (v10 >= a3) {
    goto LABEL_25;
  }
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    [(MPCVocalAttenuationPerformancePolicy *)self performanceLimit];
    uint64_t v13 = v12;
    BOOL v14 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
    int v29 = 138544130;
    v30 = self;
    __int16 v31 = 2048;
    *(double *)v32 = a3;
    *(_WORD *)&v32[8] = 2048;
    *(void *)&v32[10] = v13;
    __int16 v33 = 1024;
    BOOL v34 = v14;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Sample over limit [%3.2fms > %3.2fms] - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  double timeOfFirstGlitch = self->_timeOfFirstGlitch;
  if (timeOfFirstGlitch < 0.0)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
      int v29 = 138543618;
      v30 = self;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v17;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - First glitch detected - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x12u);
    }

    self->_double timeOfFirstGlitch = v8;
    self->_uint64_t currentNumberOfGlitches = 1;
    goto LABEL_25;
  }
  if (v8 - timeOfFirstGlitch >= self->_timeThreshold)
  {
    self->_double timeOfFirstGlitch = v8;
    self->_uint64_t currentNumberOfGlitches = 1;
    v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t currentNumberOfGlitches = self->_currentNumberOfGlitches;
      BOOL v28 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
      int v29 = 138543874;
      v30 = self;
      __int16 v31 = 2048;
      *(void *)v32 = currentNumberOfGlitches;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v28;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - New glitch after time limit - %ld - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x1Cu);
    }

    goto LABEL_25;
  }
  ++self->_currentNumberOfGlitches;
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = self->_currentNumberOfGlitches;
    double timeThreshold = self->_timeThreshold;
    BOOL v21 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
    int v29 = 138544130;
    v30 = self;
    __int16 v31 = 2048;
    *(void *)v32 = v19;
    *(_WORD *)&v32[8] = 2048;
    *(double *)&v32[10] = timeThreshold;
    __int16 v33 = 1024;
    BOOL v34 = v21;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - %ld glitches detected in the last %3.2fms - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  if ([(MPCVocalAttenuationPerformancePolicy *)self currentNumberOfGlitches] < self->_glitchesThreshold
    || [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation])
  {
LABEL_25:
    os_unfair_lock_unlock(&self->_dataLock);
    return;
  }
  self->_disableVocalAttenuation = 1;
  v22 = _MPCLogCategoryPlayback();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = self->_timeThreshold;
    uint64_t v24 = self->_currentNumberOfGlitches;
    BOOL v25 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
    int v29 = 138544130;
    v30 = self;
    __int16 v31 = 2048;
    *(double *)v32 = v23;
    *(_WORD *)&v32[8] = 2048;
    *(void *)&v32[10] = v24;
    __int16 v33 = 1024;
    BOOL v34 = v25;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Too many glitches detected in the last %3.2fms: %ld - Disabling vocal attenuation - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v29, 0x26u);
  }

  os_unfair_lock_unlock(&self->_dataLock);
  [(MPCVocalAttenuationPerformancePolicy *)self updateEvaluationWithReason:@"Too many glitches"];
}

- (id)evaluation
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationPerformancePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = NSString;
  BOOL v6 = [(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation];
  double v7 = @"off";
  if (v6) {
    double v7 = @"on";
  }
  double v8 = [v5 stringWithFormat:@"Performance policy %@", v7];
  [v4 setExplanation:v8];

  [v4 setCanBeOverriden:1];
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationPerformancePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);

  return v4;
}

- (void)reset
{
  if ([(MPCVocalAttenuationPerformancePolicy *)self shouldDisableVocalAttenuation])
  {
    os_unfair_lock_lock(&self->_dataLock);
    self->_disableVocalAttenuation = 0;
    self->_double timeOfFirstGlitch = -1.0;
    self->_uint64_t currentNumberOfGlitches = 0;
    os_unfair_lock_unlock(&self->_dataLock);
    [(MPCVocalAttenuationPerformancePolicy *)self updateEvaluationWithReason:@"reset"];
  }
}

- (BOOL)canBeReset
{
  return 1;
}

- (MPCVocalAttenuationPerformancePolicy)initWithPerformanceLimit:(double)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPCVocalAttenuationPerformancePolicy;
  id v11 = [(MPCVocalAttenuationPerformancePolicy *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_type = 2;
    v11->_performanceLimit = a3;
    objc_storeStrong((id *)&v11->_calloutQueue, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_disableVocalAttenuation = 0;
    *(_OWORD *)&v12->_double timeOfFirstGlitch = xmmword_21BEF1670;
    *(void *)&v12->_glitchesThreshold = 5;
  }

  return v12;
}

@end