@interface FBWaitForProcessDeathTransaction
- (BOOL)_canBeInterrupted;
- (FBProcess)process;
- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3;
- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3 timeout:(double)a4;
- (double)timeout;
- (id)_customizedDescriptionProperties;
- (void)_begin;
- (void)_didComplete;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
@end

@implementation FBWaitForProcessDeathTransaction

- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3
{
  return [(FBWaitForProcessDeathTransaction *)self initWithProcess:a3 timeout:-1.0];
}

- (FBWaitForProcessDeathTransaction)initWithProcess:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBWaitForProcessDeathTransaction;
  v8 = [(FBTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_process, a3);
    v9->_timeout = a4;
  }

  return v9;
}

- (void)_begin
{
  if (self->_process)
  {
    v3 = +[FBProcessManager sharedInstance];
    [v3 addObserver:self];
    objc_msgSend(v3, "processForPID:", -[FBProcess pid](self->_process, "pid"));
    v4 = (FBProcess *)objc_claimAutoreleasedReturnValue();
    process = self->_process;

    if (v4 == process)
    {
      [(FBWaitForProcessDeathTransaction *)self addMilestone:@"FBProcessDidExitMilestone"];
      if (self->_timeout > 0.0)
      {
        v6 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F627C0]) initWithIdentifier:@"FBWaitForProcessDeathTransaction-watchdog"];
        timer = self->_timer;
        self->_timer = v6;

        v8 = self->_timer;
        double timeout = self->_timeout;
        v10 = [(FBWaitForProcessDeathTransaction *)self queue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __42__FBWaitForProcessDeathTransaction__begin__block_invoke;
        v12[3] = &unk_1E5C4B2E0;
        v12[4] = self;
        [(BSAbsoluteMachTimer *)v8 scheduleWithFireInterval:v10 leewayInterval:v12 queue:timeout handler:1.0];
      }
      v11.receiver = self;
      v11.super_class = (Class)FBWaitForProcessDeathTransaction;
      [(FBWaitForProcessDeathTransaction *)&v11 _begin];
    }
    else
    {
      [v3 removeObserver:self];
    }
  }
}

uint64_t __42__FBWaitForProcessDeathTransaction__begin__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _failForTimeoutWithDescription:@"process didn't exit in time"];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  v3 = +[FBProcessManager sharedInstance];
  [v3 removeObserver:self];

  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  v4.receiver = self;
  v4.super_class = (Class)FBWaitForProcessDeathTransaction;
  [(FBWaitForProcessDeathTransaction *)&v4 _didComplete];
}

- (id)_customizedDescriptionProperties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v4 = v3;
  if (self->_process) { {
    process = self->_process;
  }
  }
  else {
    process = (FBProcess *)@"(none)";
  }
  [v3 setObject:process forKey:@"Process"];

  return v4;
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  v6 = [(FBWaitForProcessDeathTransaction *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke;
  v8[3] = &unk_1E5C497A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke_2;
  v5[3] = &unk_1E5C4B308;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 evaluateMilestone:@"FBProcessDidExitMilestone" withEvaluator:v5];
}

BOOL __68__FBWaitForProcessDeathTransaction_processManager_didRemoveProcess___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 152);
}

- (FBProcess)process
{
  return self->_process;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
}

@end