@interface MPCVocalAttenuationThermalPressurePolicy
- (BOOL)canBeReset;
- (BOOL)shouldDisableVocalAttenuation;
- (ICEnvironmentMonitor)thermalMonitor;
- (MPCVocalAttenuationPolicyDelegate)delegate;
- (MPCVocalAttenuationThermalPressurePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4;
- (MPCVocalAttenuationThermalPressurePolicy)initWithThermalMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5;
- (OS_dispatch_queue)calloutQueue;
- (id)evaluation;
- (int64_t)currentThermalLevel;
- (int64_t)cutoffThermalLevel;
- (int64_t)reenablementThermalLevel;
- (int64_t)type;
- (os_unfair_lock_s)dataLock;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setCurrentThermalLevel:(int64_t)a3;
- (void)setCutoffThermalLevel:(int64_t)a3;
- (void)setDisableVocalAttenuation:(BOOL)a3;
- (void)setReenablementThermalLevel:(int64_t)a3;
- (void)setThermalMonitor:(id)a3;
- (void)thermalStateDidChange:(int64_t)a3;
- (void)updateEvaluationWithReason:(id)a3;
@end

@implementation MPCVocalAttenuationThermalPressurePolicy

- (MPCVocalAttenuationThermalPressurePolicy)initWithThermalMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCVocalAttenuationThermalPressurePolicy;
  v12 = [(MPCVocalAttenuationThermalPressurePolicy *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = 0;
    objc_storeStrong((id *)&v12->_thermalMonitor, a3);
    [(ICEnvironmentMonitor *)v13->_thermalMonitor registerObserver:v13];
    objc_storeStrong((id *)&v13->_calloutQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    uint64_t v14 = [(ICEnvironmentMonitor *)v13->_thermalMonitor currentThermalPressureLevel];
    v13->_currentThermalLevel = v14;
    *(_OWORD *)&v13->_cutoffThermalLevel = xmmword_21BEF1660;
    v13->_disableVocalAttenuation = 0;
    v13->_dataLock._os_unfair_lock_opaque = 0;
    [(MPCVocalAttenuationThermalPressurePolicy *)v13 thermalStateDidChange:v14];
  }

  return v13;
}

- (void)thermalStateDidChange:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentThermalLevel = self->_currentThermalLevel;
    int v15 = 138543874;
    objc_super v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = currentThermalLevel;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %ld -> %ld", (uint8_t *)&v15, 0x20u);
  }

  if (![(MPCVocalAttenuationThermalPressurePolicy *)self shouldDisableVocalAttenuation])
  {
    if (self->_cutoffThermalLevel <= a3)
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int64_t cutoffThermalLevel = self->_cutoffThermalLevel;
        int v15 = 138543618;
        objc_super v16 = self;
        __int16 v17 = 2048;
        int64_t v18 = cutoffThermalLevel;
        _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure >= %ld: disabling vocal attenuation", (uint8_t *)&v15, 0x16u);
      }
      BOOL v10 = 1;
      goto LABEL_13;
    }
LABEL_9:
    int v11 = 0;
    goto LABEL_14;
  }
  if (self->_reenablementThermalLevel < a3) {
    goto LABEL_9;
  }
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t reenablementThermalLevel = self->_reenablementThermalLevel;
    int v15 = 138543618;
    objc_super v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = reenablementThermalLevel;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure < %ld: allowing vocal attenuation", (uint8_t *)&v15, 0x16u);
  }
  BOOL v10 = 0;
LABEL_13:

  self->_disableVocalAttenuation = v10;
  int v11 = 1;
LABEL_14:
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v14 = self->_currentThermalLevel;
    int v15 = 138543874;
    objc_super v16 = self;
    __int16 v17 = 2048;
    int64_t v18 = v14;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %ld -> %ld", (uint8_t *)&v15, 0x20u);
  }

  self->_int64_t currentThermalLevel = a3;
  os_unfair_lock_unlock(p_dataLock);
  if (v11) {
    [(MPCVocalAttenuationThermalPressurePolicy *)self updateEvaluationWithReason:@"value changed"];
  }
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
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

- (void)setReenablementThermalLevel:(int64_t)a3
{
  self->_int64_t reenablementThermalLevel = a3;
}

- (int64_t)reenablementThermalLevel
{
  return self->_reenablementThermalLevel;
}

- (void)setCutoffThermalLevel:(int64_t)a3
{
  self->_int64_t cutoffThermalLevel = a3;
}

- (int64_t)cutoffThermalLevel
{
  return self->_cutoffThermalLevel;
}

- (void)setCurrentThermalLevel:(int64_t)a3
{
  self->_int64_t currentThermalLevel = a3;
}

- (int64_t)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setThermalMonitor:(id)a3
{
}

- (ICEnvironmentMonitor)thermalMonitor
{
  return self->_thermalMonitor;
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
  v5 = [(MPCVocalAttenuationThermalPressurePolicy *)self evaluation];
  v6 = [v5 explanation];
  v7 = [v6 stringByAppendingFormat:@" [%@]", v4];

  [v5 setExplanation:v7];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MPCVocalAttenuationThermalPressurePolicy_updateEvaluationWithReason___block_invoke;
  block[3] = &unk_2643C5EE8;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(calloutQueue, block);
}

void __71__MPCVocalAttenuationThermalPressurePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 vocalAttenuationPolicy:*(void *)(a1 + 32) didChangeEvaluation:*(void *)(a1 + 40)];
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4 = [(MPCVocalAttenuationThermalPressurePolicy *)self thermalMonitor];
  -[MPCVocalAttenuationThermalPressurePolicy thermalStateDidChange:](self, "thermalStateDidChange:", [v4 currentThermalPressureLevel]);
}

- (id)evaluation
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationThermalPressurePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = NSString;
  BOOL v6 = [(MPCVocalAttenuationThermalPressurePolicy *)self shouldDisableVocalAttenuation];
  v7 = @"off";
  if (v6) {
    v7 = @"on";
  }
  v8 = [v5 stringWithFormat:@"Thermal pressure policy %@ [level:%ld]", v7, self->_currentThermalLevel];
  [v4 setExplanation:v8];

  [v4 setCanBeOverriden:0];
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationThermalPressurePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);

  return v4;
}

- (BOOL)canBeReset
{
  return 0;
}

- (MPCVocalAttenuationThermalPressurePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F89110];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedMonitor];
  BOOL v10 = [(MPCVocalAttenuationThermalPressurePolicy *)self initWithThermalMonitor:v9 calloutQueue:v8 delegate:v7];

  return v10;
}

@end