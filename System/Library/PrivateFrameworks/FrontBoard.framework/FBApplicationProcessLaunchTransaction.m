@interface FBApplicationProcessLaunchTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)exited;
- (BOOL)failedLaunch;
- (FBApplicationProcessLaunchTransaction)init;
- (FBApplicationProcessLaunchTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4;
- (FBApplicationProcessLaunchTransaction)initWithApplicationProcess:(id)a3;
- (FBApplicationProcessLaunchTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4;
- (FBProcess)process;
- (id)_customizedDescriptionProperties;
- (void)_begin;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_didComplete;
- (void)_queue_finishProcessLaunch:(BOOL)a3;
- (void)_queue_launchProcess:(id)a3;
- (void)_queue_noteExited;
- (void)_queue_processWillLaunch:(id)a3;
- (void)_willComplete;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)add:(id)a3;
- (void)addObserver:(id)a3;
- (void)remove:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation FBApplicationProcessLaunchTransaction

void __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 transaction:*(void *)(a1 + 32) willLaunchProcess:*(void *)(*(void *)(a1 + 32) + 168)];
  }
  }
}

- (FBProcess)process
{
  return self->_process;
}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishProcessLaunch:", *(unsigned __int8 *)(a1 + 40));
}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke(uint64_t a1, char a2)
{
  v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_2;
  v5[3] = &unk_1E5C49EA8;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v3 removeObserver:a3];
}

- (void)_didComplete
{
  id executionContextProvider = self->_executionContextProvider;
  self->_id executionContextProvider = 0;

  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v4 _didComplete];
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v3 addObserver:a3];
}

- (void)_begin
{
  objc_super v3 = [(FBProcessManager *)self->_processManager processForIdentity:self->_identity];
  [(FBApplicationProcessLaunchTransaction *)self addMilestone:@"processWillBeginLaunching"];
  if ([v3 isPendingExit])
  {
    if ([(FBApplicationProcessLaunchTransaction *)self isAuditHistoryEnabled]) { {
      [(FBApplicationProcessLaunchTransaction *)self _addAuditHistoryItem:@"Process is pending exit. Waiting for it to die..."];
    }
    }
    id executionContextProvider = (void (**)(void))self->_executionContextProvider;
    if (executionContextProvider)
    {
      executionContextProvider[2]();
      v5 = (FBProcessExecutionContext *)objc_claimAutoreleasedReturnValue();
      executionContext = self->_executionContext;
      self->_executionContext = v5;

      id v7 = self->_executionContextProvider;
      self->_id executionContextProvider = 0;
    }
    v8 = [[FBWaitForProcessDeathTransaction alloc] initWithProcess:v3];
    deathTransaction = self->_deathTransaction;
    self->_deathTransaction = v8;

    [(FBApplicationProcessLaunchTransaction *)self addChildTransaction:self->_deathTransaction];
  }
  else
  {
    [(FBApplicationProcessLaunchTransaction *)self _queue_launchProcess:v3];
  }
  v10.receiver = self;
  v10.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v10 _begin];
}

- (void)_queue_launchProcess:(id)a3
{
  id v4 = a3;
  if (self->_process)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_process == ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction _queue_launchProcess:]();
    }
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_19;
  }
  v5 = v4;
  if (!v4)
  {
    char v6 = self->_executionContext;
    if (!v6)
    {
      id executionContextProvider = (void (**)(void))self->_executionContextProvider;
      if (!executionContextProvider
        || (executionContextProvider[2](),
            v8 = objc_claimAutoreleasedReturnValue(),
            char v6 = (FBProcessExecutionContext *)[v8 copy],
            v8,
            !v6))
      {
        char v6 = objc_alloc_init(FBProcessExecutionContext);
      }
    }
    [(FBProcessExecutionContext *)v6 setIdentity:self->_identity];
    v9 = [(FBProcessExecutionContext *)v6 completion];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_3;
    v19 = &unk_1E5C4BBA8;
    v20 = self;
    id v10 = v9;
    id v21 = v10;
    [(FBProcessExecutionContext *)v6 setCompletion:&v16];
    v11 = [(FBProcessManager *)self->_processManager _createProcessFutureWithExecutionContext:v6 error:0];
    if (v11)
    {

      goto LABEL_12;
    }
    v15 = [NSString stringWithFormat:@"legacy transaction does not support launching process identity: %@", self->_identity, v16, v17, v18, v19, v20];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction _queue_launchProcess:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_19:
    JUMPOUT(0x1A631D6ECLL);
  }
  [(FBApplicationProcessLaunchTransaction *)self _queue_processWillLaunch:v4];
  if ([v5 finishedLaunching])
  {
    [(FBApplicationProcessLaunchTransaction *)self _queue_finishProcessLaunch:1];
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke;
    v22[3] = &unk_1E5C49778;
    v22[4] = self;
    [v5 _executeBlockAfterLaunchCompletes:v22];
  }
LABEL_12:
  executionContext = self->_executionContext;
  self->_executionContext = 0;

  id v13 = self->_executionContextProvider;
  self->_id executionContextProvider = 0;
}

- (void)_queue_processWillLaunch:(id)a3
{
  id v5 = a3;
  if (self->_process)
  {
    char v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_process == ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction _queue_processWillLaunch:]();
    }
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v5)
    {
      objc_storeStrong((id *)&self->_process, a3);
      [(FBApplicationProcessLaunchTransaction *)self addMilestone:@"processDidFinishLaunching"];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke;
      v7[3] = &unk_1E5C49AE0;
      v7[4] = self;
      [v5 _executeBlockAsCurrentProcess:v7];
      [(FBApplicationProcessLaunchTransaction *)self satisfyMilestone:@"processWillBeginLaunching"];
    }
    else
    {
      [(FBApplicationProcessLaunchTransaction *)self _failWithReason:@"process launch failed" description:@"Unable to create process."];
    }
  }
}

- (void)_queue_finishProcessLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BSAtomicSignal *)self->_interruptedOrComplete hasBeenSignalled])
  {
    if ([(FBApplicationProcessLaunchTransaction *)self isAuditHistoryEnabled])
    {
      [(FBApplicationProcessLaunchTransaction *)self _addAuditHistoryItem:@"Ignoring launched process since we were already interrupted or completed."];
    }
  }
  else if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__FBApplicationProcessLaunchTransaction__queue_finishProcessLaunch___block_invoke;
    v7[3] = &unk_1E5C4BBD0;
    v7[4] = self;
    [(FBApplicationProcessLaunchTransaction *)self _enumerateObserversWithBlock:v7];
    [(FBApplicationProcessLaunchTransaction *)self satisfyMilestone:@"processDidFinishLaunching"];
  }
  else
  {
    id v5 = [(FBProcess *)self->_process exitContext];
    id v6 = [v5 createError];

    [(FBApplicationProcessLaunchTransaction *)self _failWithReason:@"process launch failed" description:@"Process failed to launch." precipitatingError:v6];
  }
}

uint64_t __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__FBApplicationProcessLaunchTransaction__queue_processWillLaunch___block_invoke_2;
  v3[3] = &unk_1E5C4BBD0;
  v3[4] = v1;
  return [v1 _enumerateObserversWithBlock:v3];
}

- (FBApplicationProcessLaunchTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    v20.receiver = self;
    v20.super_class = (Class)FBApplicationProcessLaunchTransaction;
    v9 = [(FBTransaction *)&v20 init];
    if (v9)
    {
      uint64_t v10 = +[FBProcessManager sharedInstance];
      processManager = v9->_processManager;
      v9->_processManager = (FBProcessManager *)v10;

      uint64_t v12 = [v6 copy];
      identity = v9->_identity;
      v9->_identity = (RBSProcessIdentity *)v12;

      uint64_t v14 = [v8 copy];
      id executionContextProvider = v9->_executionContextProvider;
      v9->_id executionContextProvider = (id)v14;

      uint64_t v16 = objc_opt_new();
      interruptedOrComplete = v9->_interruptedOrComplete;
      v9->_interruptedOrComplete = (BSAtomicSignal *)v16;
    }
    return v9;
  }
  else
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction initWithProcessIdentity:executionContextProvider:]();
    }
    }
    [v19 UTF8String];
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_willComplete
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v3 _willComplete];
  [(BSAtomicSignal *)self->_interruptedOrComplete signal];
}

void __68__FBApplicationProcessLaunchTransaction__queue_finishProcessLaunch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 transaction:*(void *)(a1 + 32) didLaunchProcess:*(void *)(*(void *)(a1 + 32) + 168)];
  }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processManager, 0);
}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishProcessLaunch:", *(unsigned __int8 *)(a1 + 40));
}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_5(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_6;
  v5[3] = &unk_1E5C49EA8;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

uint64_t __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_processWillLaunch:", *(void *)(a1 + 40));
}

void __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(*(void *)(a1 + 32) + 200) hasBeenSignalled] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_4;
    block[3] = &unk_1E5C497A0;
    block[4] = *(void *)(a1 + 32);
    id v8 = v5;
    id v12 = v8;
    dispatch_async(v7, block);

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__FBApplicationProcessLaunchTransaction__queue_launchProcess___block_invoke_5;
    v10[3] = &unk_1E5C49778;
    v10[4] = *(void *)(a1 + 32);
    [v8 _executeBlockAfterLaunchCompletes:v10];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) { {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
  }
}

- (FBApplicationProcessLaunchTransaction)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBApplicationProcessLaunchTransaction"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"FBApplicationProcessLaunchTransaction.m";
    __int16 v17 = 1024;
    int v18 = 47;
    __int16 v19 = 2114;
    objc_super v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBApplicationProcessLaunchTransaction)initWithApplicationProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 identity];
    id v7 = [(FBApplicationProcessLaunchTransaction *)self initWithProcessIdentity:v6 executionContextProvider:0];

    return v7;
  }
  else
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction initWithApplicationProcess:]();
    }
    }
    [v9 UTF8String];
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBApplicationProcessLaunchTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    int v9 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v6];
    uint64_t v10 = [(FBApplicationProcessLaunchTransaction *)self initWithProcessIdentity:v9 executionContextProvider:v8];

    return v10;
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationProcessLaunchTransaction initWithApplicationBundleID:executionContextProvider:]();
    }
    }
    [v12 UTF8String];
    result = (FBApplicationProcessLaunchTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)add:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v3 addObserver:a3];
}

- (void)remove:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v3 removeObserver:a3];
}

- (BOOL)failedLaunch
{
  return [(FBProcess *)self->_process pid] < 1;
}

- (BOOL)exited
{
  return ![(FBProcess *)self->_process isRunning];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v4 _willInterruptWithReason:a3];
  [(BSAtomicSignal *)self->_interruptedOrComplete signal];
}

- (void)_willFailWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v4 _willFailWithReason:a3];
  [(BSAtomicSignal *)self->_interruptedOrComplete signal];
}

- (void)_childTransactionDidComplete:(id)a3
{
  objc_super v4 = (FBWaitForProcessDeathTransaction *)a3;
  id v5 = v4;
  if (self->_deathTransaction == v4)
  {
    if (([(FBWaitForProcessDeathTransaction *)v4 isFailed] & 1) == 0
      && ([(FBWaitForProcessDeathTransaction *)v5 isInterrupted] & 1) == 0)
    {
      if ([(FBApplicationProcessLaunchTransaction *)self isAuditHistoryEnabled]) { {
        [(FBApplicationProcessLaunchTransaction *)self _addAuditHistoryItem:@"Process officially exited. Attempting relaunch..."];
      }
      }
      [(FBApplicationProcessLaunchTransaction *)self _queue_launchProcess:0];
    }
    deathTransaction = self->_deathTransaction;
    self->_deathTransaction = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)FBApplicationProcessLaunchTransaction;
  [(FBApplicationProcessLaunchTransaction *)&v7 _childTransactionDidComplete:v5];
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return self->_deathTransaction == a3;
}

- (id)_customizedDescriptionProperties
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
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

- (void)_queue_noteExited
{
  if (([(FBApplicationProcessLaunchTransaction *)self isComplete] & 1) == 0)
  {
    [(FBApplicationProcessLaunchTransaction *)self _failWithReason:@"process launch failed" description:@"Process exited"];
  }
}

- (void)initWithApplicationProcess:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithApplicationBundleID:executionContextProvider:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithProcessIdentity:executionContextProvider:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_launchProcess:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_launchProcess:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_processWillLaunch:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end