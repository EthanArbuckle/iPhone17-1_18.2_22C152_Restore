@interface _DBWorkspaceStateChangeSession
- (_DBWorkspaceStateChangeSession)initWithStateChangeBlock:(id)a3 invalidationBlock:(id)a4;
- (id)owner;
- (void)_startWatchdogTimer;
- (void)_watchdogTimerFired;
- (void)dealloc;
- (void)invalidate;
- (void)setOwner:(id)a3;
- (void)setState:(id)a3;
@end

@implementation _DBWorkspaceStateChangeSession

- (_DBWorkspaceStateChangeSession)initWithStateChangeBlock:(id)a3 invalidationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DBWorkspaceStateChangeSession;
  v8 = [(_DBWorkspaceStateChangeSession *)&v14 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id stateChangeBlock = v8->_stateChangeBlock;
    v8->_id stateChangeBlock = v9;

    v11 = _Block_copy(v7);
    id invalidationBlock = v8->_invalidationBlock;
    v8->_id invalidationBlock = v11;
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_DBWorkspaceStateChangeSession;
  [(_DBWorkspaceStateChangeSession *)&v2 dealloc];
}

- (void)setState:(id)a3
{
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(NSTimer *)self->_watchdogTimer invalidate];
    watchdogTimer = self->_watchdogTimer;
    self->_watchdogTimer = 0;

    id invalidationBlock = (void (**)(id, _DBWorkspaceStateChangeSession *))self->_invalidationBlock;
    if (invalidationBlock)
    {
      invalidationBlock[2](invalidationBlock, self);
      id v5 = self->_invalidationBlock;
      self->_id invalidationBlock = 0;
    }
  }
}

- (void)_startWatchdogTimer
{
  v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__watchdogTimerFired selector:0 userInfo:0 repeats:30.0];
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = v3;
  MEMORY[0x270F9A758](v3, watchdogTimer);
}

- (void)_watchdogTimerFired
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22D6F0000, log, OS_LOG_TYPE_FAULT, "Workspace state change session watchdog timer fired!", v1, 2u);
}

- (id)owner
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  return WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong(&self->_stateChangeBlock, 0);
  objc_destroyWeak(&self->_owner);
}

@end