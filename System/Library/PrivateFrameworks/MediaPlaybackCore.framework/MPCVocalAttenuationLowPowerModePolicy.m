@interface MPCVocalAttenuationLowPowerModePolicy
- (BOOL)canBeReset;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)shouldDisableVocalAttenuation;
- (MPCVocalAttenuationLowPowerModePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4;
- (MPCVocalAttenuationLowPowerModePolicy)initWithPowerModeMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5;
- (MPCVocalAttenuationPolicyDelegate)delegate;
- (NSProcessInfo)powerMonitor;
- (OS_dispatch_queue)calloutQueue;
- (id)evaluation;
- (int64_t)type;
- (os_unfair_lock_s)dataLock;
- (void)powerModeDidChange:(BOOL)a3;
- (void)processInfoPowerStateDidChange:(id)a3;
- (void)setCalloutQueue:(id)a3;
- (void)setDisableVocalAttenuation:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setPowerMonitor:(id)a3;
- (void)updateEvaluationWithReason:(id)a3;
@end

@implementation MPCVocalAttenuationLowPowerModePolicy

- (MPCVocalAttenuationLowPowerModePolicy)initWithPowerModeMonitor:(id)a3 calloutQueue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCVocalAttenuationLowPowerModePolicy;
  v12 = [(MPCVocalAttenuationLowPowerModePolicy *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = 1;
    objc_storeStrong((id *)&v12->_powerMonitor, a3);
    objc_storeStrong((id *)&v13->_calloutQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_disableVocalAttenuation = 0;
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v13 selector:sel_processInfoPowerStateDidChange_ name:*MEMORY[0x263F08450] object:0];

    v13->_dataLock._os_unfair_lock_opaque = 0;
    [(MPCVocalAttenuationLowPowerModePolicy *)v13 powerModeDidChange:[(NSProcessInfo *)v13->_powerMonitor isLowPowerModeEnabled]];
  }

  return v13;
}

- (void)powerModeDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(MPCVocalAttenuationLowPowerModePolicy *)self isLowPowerModeEnabled] != a3)
  {
    [(MPCVocalAttenuationLowPowerModePolicy *)self setLowPowerModeEnabled:v3];
    [(MPCVocalAttenuationLowPowerModePolicy *)self setDisableVocalAttenuation:v3];
    [(MPCVocalAttenuationLowPowerModePolicy *)self updateEvaluationWithReason:@"value changed"];
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(MPCVocalAttenuationLowPowerModePolicy *)self evaluation];
      v7 = [v6 explanation];
      int v8 = 138543874;
      id v9 = self;
      __int16 v10 = 2114;
      id v11 = v7;
      __int16 v12 = 1024;
      BOOL v13 = [(MPCVocalAttenuationLowPowerModePolicy *)self shouldDisableVocalAttenuation];
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - %{public}@ - _disableVocalAttenuation=%{BOOL}u", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_powerMonitor, 0);

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

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (void)setPowerMonitor:(id)a3
{
}

- (NSProcessInfo)powerMonitor
{
  return self->_powerMonitor;
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
  v5 = [(MPCVocalAttenuationLowPowerModePolicy *)self evaluation];
  v6 = [v5 explanation];
  v7 = [v6 stringByAppendingFormat:@" [%@]", v4];

  [v5 setExplanation:v7];
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MPCVocalAttenuationLowPowerModePolicy_updateEvaluationWithReason___block_invoke;
  block[3] = &unk_2643C5EE8;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(calloutQueue, block);
}

void __68__MPCVocalAttenuationLowPowerModePolicy_updateEvaluationWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 vocalAttenuationPolicy:*(void *)(a1 + 32) didChangeEvaluation:*(void *)(a1 + 40)];
}

- (void)processInfoPowerStateDidChange:(id)a3
{
  BOOL v4 = [(NSProcessInfo *)self->_powerMonitor isLowPowerModeEnabled];

  [(MPCVocalAttenuationLowPowerModePolicy *)self powerModeDidChange:v4];
}

- (id)evaluation
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  BOOL v4 = objc_opt_new();
  objc_msgSend(v4, "setDisableVocalAttenuation:", -[MPCVocalAttenuationLowPowerModePolicy shouldDisableVocalAttenuation](self, "shouldDisableVocalAttenuation"));
  v5 = NSString;
  BOOL v6 = [(MPCVocalAttenuationLowPowerModePolicy *)self shouldDisableVocalAttenuation];
  v7 = @"off";
  if (v6) {
    v7 = @"on";
  }
  int v8 = [v5 stringWithFormat:@"Low power mode policy %@", v7];
  [v4 setExplanation:v8];

  [v4 setCanBeOverriden:1];
  objc_msgSend(v4, "setPolicyType:", -[MPCVocalAttenuationLowPowerModePolicy type](self, "type"));
  os_unfair_lock_unlock(p_dataLock);

  return v4;
}

- (BOOL)canBeReset
{
  return 0;
}

- (MPCVocalAttenuationLowPowerModePolicy)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F08AB0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 processInfo];
  __int16 v10 = [(MPCVocalAttenuationLowPowerModePolicy *)self initWithPowerModeMonitor:v9 calloutQueue:v8 delegate:v7];

  return v10;
}

@end