@interface FBProcess
+ (OS_dispatch_queue)calloutQueue;
+ (id)_currentProcess;
+ (id)createCurrentProcess;
+ (id)createProcessWithExecutionContext:(id)a3;
+ (id)createProcessWithHandle:(id)a3;
+ (id)rbInteractionWorkloop;
+ (void)createCurrentProcess;
- (BOOL)_shouldWatchdogWithDeclineReason:(id *)a3;
- (BOOL)_startWatchdogTimerForContext:(id)a3;
- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4;
- (BOOL)bootstrapWithDelegate:(id)a3;
- (BOOL)executableLivesOnSystemPartition;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isApplicationProcess;
- (BOOL)isBeingDebugged;
- (BOOL)isCurrentProcess;
- (BOOL)isExtensionProcess;
- (BOOL)isFinishedLaunching;
- (BOOL)isForeground;
- (BOOL)isPendingExit;
- (BOOL)isPlatformBinary;
- (BOOL)isRunning;
- (BOOL)matchesProcess:(id)a3;
- (BSAuditToken)auditToken;
- (BSMachPortTaskNameRight)taskNameRight;
- (BSProcessHandle)handle;
- (FBProcess)init;
- (FBProcessDelegate)delegate;
- (FBProcessExecutionContext)executionContext;
- (FBProcessExitContext)exitContext;
- (FBProcessState)state;
- (FBSApplicationInfo)applicationInfo;
- (FBWorkspace)workspace;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)name;
- (RBSProcessHandle)rbsHandle;
- (RBSProcessIdentity)identity;
- (RBSTarget)target;
- (double)execTime;
- (id)_createBootstrapContext;
- (id)_initWithIdentity:(id)a3 handle:(id)a4 executionContext:(id)a5;
- (id)_newWatchdogForContext:(id)a3 completion:(id)a4;
- (id)_observers;
- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5;
- (id)_watchdogProvider;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)processPredicate;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
- (int64_t)_watchdogReportType;
- (int64_t)taskState;
- (int64_t)versionedPID;
- (int64_t)visibility;
- (unsigned)assertionState;
- (void)_bootstrapAndExec;
- (void)_configureBundleInfo;
- (void)_configureIntrinsicsFromHandle:(id)a3;
- (void)_executeBlockAfterBootstrap:(id)a3;
- (void)_executeBlockAfterLaunchCompletes:(id)a3;
- (void)_executeBlockAsCurrentProcess:(id)a3;
- (void)_killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5 completion:(id)a6;
- (void)_launchDidComplete:(BOOL)a3 finalizeBlock:(id)a4;
- (void)_lock_consumeLock_executeTerminationRequest;
- (void)_lock_consumeLock_performGracefulKill;
- (void)_noteAssertionStateDidChange;
- (void)_notePendingExitForReason:(id)a3;
- (void)_noteStateDidUpdate:(id)a3;
- (void)_processDidExitWithContext:(id)a3;
- (void)_rebuildState;
- (void)_rebuildState:(id)a3;
- (void)_setSceneLifecycleState:(unsigned __int8)a3;
- (void)_terminateWithRequest:(id)a3 completion:(id)a4;
- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4;
- (void)_updateStateWithBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)bootstrapLock:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)logProem;
- (void)noteProcessPublished;
- (void)removeObserver:(id)a3;
- (void)setWatchdogProvider:(id)a3;
@end

@implementation FBProcess

- (BOOL)hasEntitlement:(id)a3
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:a3];
}

uint64_t __47__FBProcess__newWatchdogForContext_completion___block_invoke_180(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  }
  return result;
}

- (NSString)description
{
  description = self->_description;
  if (description)
  {
    v3 = description;
  }
  else
  {
    v3 = [(FBProcess *)self succinctDescription];
  }

  return v3;
}

- (double)execTime
{
  return self->_execTime;
}

- (int)pid
{
  return self->_pid;
}

- (RBSTarget)target
{
  return self->_target;
}

- (id)succinctDescription
{
  v2 = [(FBProcess *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  v4 = NSString;
  identityDescription = self->_identityDescription;
  v6 = NSStringFromBSVersionedPID();
  v7 = [v4 stringWithFormat:@"%@:%@", identityDescription, v6];
  [v3 appendString:v7 withName:0];

  return v3;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (BOOL)isForeground
{
  LOBYTE(self) = [(FBProcessState *)self->_lock_state isForeground];
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)_noteStateDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 state];
  v6 = (void *)[v5 copy];

  if ([v6 taskState])
  {
    [(FBProcess *)self _rebuildState:v6];
  }
  else
  {
    v7 = FBLogProcess();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _noteStateDidUpdate:](v4, v7);
    }
    }
  }
}

- (BOOL)isRunning
{
  LOBYTE(self) = [(FBProcessState *)self->_lock_state isRunning];
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isApplicationProcess
{
  return 0;
}

- (BOOL)executableLivesOnSystemPartition
{
  if (self->_lock_executableLivesOnSystemPartition == 0x7FFFFFFFFFFFFFFFLL && self->_executablePath)
  {
    BSPathExistsOnSystemPartition();
    self->_lock_executableLivesOnSystemPartition = BSSettingFlagForBool();
  }
  char IsYes = BSSettingFlagIsYes();
  os_unfair_recursive_lock_unlock();
  return IsYes;
}

- (FBWorkspace)workspace
{
  return self->_workspace;
}

- (void)_noteAssertionStateDidChange
{
  id v3 = [(FBProcess *)self delegate];
  [v3 noteProcessAssertionStateDidChange:self];
}

- (FBProcessDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_recursive_lock_unlock();

  return (FBProcessDelegate *)WeakRetained;
}

uint64_t __25__FBProcess_addObserver___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  v2 = *(unsigned char **)(result + 32);
  if (v2[320])
  {
    uint64_t result = objc_msgSend(*(id *)(result + 40), "processWillExit:");
    v2 = *(unsigned char **)(v1 + 32);
  }
  if (v2[321])
  {
    uint64_t result = objc_msgSend(*(id *)(v1 + 40), "processDidExit:");
    v2 = *(unsigned char **)(v1 + 32);
  }
  if (v2[322])
  {
    uint64_t result = objc_msgSend(*(id *)(v1 + 40), "applicationProcessWillLaunch:");
    v2 = *(unsigned char **)(v1 + 32);
  }
  if (v2[323])
  {
    id v3 = *(void **)(v1 + 40);
    return objc_msgSend(v3, "applicationProcessDidLaunch:");
  }
  return result;
}

void __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * i) + 16))();
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 40) isApplicationProcess])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 323) = 1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = [*(id *)(a1 + 40) _observers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v21 != v10) { {
            objc_enumerationMutation(v7);
          }
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * j) applicationProcessDidLaunch:*(void *)(a1 + 40)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v9);
    }
  }
  if ([*(id *)(a1 + 40) isApplicationProcess]) { {
    int v12 = 0;
  }
  }
  else {
    int v12 = [*(id *)(*(void *)(a1 + 40) + 24) hasConsistentLaunchdJob];
  }
  if (*(unsigned char *)(a1 + 56)) { {
    int v13 = 1;
  }
  }
  else {
    int v13 = v12;
  }
  if (v13) { {
    int64_t v14 = 1000000000;
  }
  }
  else {
    int64_t v14 = 100000000;
  }
  dispatch_time_t v15 = dispatch_time(0, v14);
  v16 = +[FBProcess rbInteractionWorkloop];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_2;
  v18[3] = &unk_1E5C4A7D0;
  v17 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v19 = v17;
  dispatch_after(v15, v16, v18);
}

void __35__FBProcess__updateStateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [*(id *)(a1 + 32) _observers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) process:*(void *)(a1 + 32) stateDidChangeFromState:*(void *)(a1 + 40) toState:*(void *)(a1 + 48)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v13 != v10) { {
            objc_enumerationMutation(v7);
          }
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * j) applicationProcessDebuggingStateDidChange:*(void *)(a1 + 32)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (id)_observers
{
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_observerLock_observers copy];
  os_unfair_lock_unlock(p_observerLock);

  return v4;
}

+ (id)rbInteractionWorkloop
{
  if (rbInteractionWorkloop_onceToken != -1) { {
    dispatch_once(&rbInteractionWorkloop_onceToken, &__block_literal_global_3);
  }
  }
  id v2 = (void *)rbInteractionWorkloop_queue;

  return v2;
}

- (void)noteProcessPublished
{
}

- (FBProcessState)state
{
  uint64_t v3 = (void *)[(FBProcessState *)self->_lock_state copy];
  os_unfair_recursive_lock_unlock();

  return (FBProcessState *)v3;
}

- (void)_setSceneLifecycleState:(unsigned __int8)a3
{
  int v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_sceneState != v3)
  {
    self->_lock_sceneState = v3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__FBProcess__setSceneLifecycleState___block_invoke;
    v5[3] = &__block_descriptor_33_e24_v16__0__FBProcessState_8l;
    char v6 = v3;
    [(FBProcess *)self _updateStateWithBlock:v5];
  }
  os_unfair_recursive_lock_unlock();
}

void __30__FBProcess__bootstrapAndExec__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  [v4 setPid:v3];
  [v4 setTaskState:2];
  [v4 setVisibility:*(void *)(a1 + 40)];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) currentState];
  if ([v5 isRunning]) { {
    [*(id *)(a1 + 32) _rebuildState:v5];
  }
  }
}

- (void)_rebuildState:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = v5;
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong((id *)&self->_lock_rbsState, a3);
    int64_t v7 = [(FBProcessState *)self->_lock_state taskState];
    unsigned int v8 = [v6 taskState] - 2;
    if (v8 <= 2) { {
      int64_t v7 = qword_1A63864D0[(char)v8];
    }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __27__FBProcess__rebuildState___block_invoke;
    v11[3] = &unk_1E5C4A8B0;
    long long v13 = self;
    int64_t v14 = v7;
    id v12 = v6;
    id v9 = v6;
    [(FBProcess *)self _updateStateWithBlock:v11];
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"rbsState != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _rebuildState:]();
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (BOOL)isBeingDebugged
{
  BOOL v3 = [(FBProcessState *)self->_lock_state isDebugging];
  os_unfair_recursive_lock_unlock();
  if (v3) { {
    return 1;
  }
  }

  return BSPIDIsBeingDebugged();
}

- (void)_updateStateWithBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, FBProcessState *))a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_didExit)
  {
    if (self->_lock_updatingState)
    {
      if (v4) { {
        v4[2](v4, self->_lock_state);
      }
      }
    }
    else
    {
      self->_lock_updatingState = 1;
      id v5 = (void *)[(FBProcessState *)self->_lock_state copy];
      if (v4) { {
        v4[2](v4, self->_lock_state);
      }
      }
      uint64_t v6 = [v5 taskState];
      if (v6 != [(FBProcessState *)self->_lock_state taskState])
      {
        int64_t v7 = FBLogProcess();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v8 = -[FBProcess logProem](self);
          NSStringFromFBProcessTaskState([(FBProcessState *)self->_lock_state taskState]);
          id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v8;
          __int16 v29 = 2114;
          uint64_t v30 = v9;
          _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process task state to: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v10 = [v5 visibility];
      if (v10 != [(FBProcessState *)self->_lock_state visibility])
      {
        v11 = FBLogProcess();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = -[FBProcess logProem](self);
          NSStringFromFBProcessVisibility([(FBProcessState *)self->_lock_state visibility]);
          long long v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v12;
          __int16 v29 = 2114;
          uint64_t v30 = v13;
          _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process visibility to: %{public}@", buf, 0x16u);
        }
      }
      int v14 = [v5 isDebugging];
      int v15 = v14 ^ [(FBProcessState *)self->_lock_state isDebugging];
      if (v15 == 1)
      {
        long long v16 = FBLogProcess();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = -[FBProcess logProem](self);
          BOOL v18 = [(FBProcessState *)self->_lock_state isDebugging];
          long long v19 = @"NO";
          if (v18) { {
            long long v19 = @"YES";
          }
          }
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          __int16 v29 = 2114;
          uint64_t v30 = v19;
          _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting process debug state to: %{public}@", buf, 0x16u);
        }
      }
      if (([v5 isEqual:self->_lock_state] & 1) == 0)
      {
        long long v20 = (void *)[(FBProcessState *)self->_lock_state copy];
        long long v21 = +[FBProcess calloutQueue];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __35__FBProcess__updateStateWithBlock___block_invoke;
        v23[3] = &unk_1E5C4A820;
        v23[4] = self;
        id v24 = v5;
        id v25 = v20;
        char v26 = v15;
        id v22 = v20;
        dispatch_async(v21, v23);
      }
      self->_lock_updatingState = 0;
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[FBProcessObserver alloc] initWithObserver:v4];

    os_unfair_lock_lock(&self->_observerLock);
    if (v5 && ([(NSMutableSet *)self->_observerLock_observers containsObject:v5] & 1) == 0)
    {
      [(NSMutableSet *)self->_observerLock_observers addObject:v5];
      os_unfair_lock_unlock(&self->_observerLock);
      uint64_t v6 = +[FBProcess calloutQueue];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __25__FBProcess_addObserver___block_invoke;
      v7[3] = &unk_1E5C497A0;
      v7[4] = self;
      unsigned int v8 = v5;
      dispatch_async(v6, v7);
    }
    else
    {
      os_unfair_lock_unlock(&self->_observerLock);
      [(FBProcessObserver *)v5 invalidate];
    }
  }
}

uint64_t __47__FBProcess__newWatchdogForContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (a2)
  {
    uint64_t v6 = [v5 userInfo];
    int64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F626F8]];

    if (v7)
    {
      unsigned int v8 = FBLogWatchdog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        long long v17 = -[FBProcess logProem](*(void **)(a1 + 32));
        BOOL v18 = [*(id *)(a1 + 40) name];
        *(_DWORD *)buf = 138543874;
        long long v23 = v17;
        __int16 v24 = 2114;
        id v25 = v18;
        __int16 v26 = 2114;
        long long v27 = v7;
        _os_log_error_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Provision violated for watchdog %{public}@: %{public}@", buf, 0x20u);
      }
      uint64_t v9 = [v7 copy];
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 280);
      *(void *)(v10 + 280) = v9;
    }
  }
  id v12 = *(void **)(a1 + 40);
  if (v12 == *(void **)(*(void *)(a1 + 32) + 264))
  {
    [v12 invalidate];
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(void **)(v13 + 264);
    *(void *)(v13 + 264) = 0;
  }
  os_unfair_recursive_lock_unlock();
  int v15 = +[FBProcess calloutQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__FBProcess__newWatchdogForContext_completion___block_invoke_180;
  v19[3] = &unk_1E5C4A7A8;
  id v21 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  dispatch_async(v15, v19);

  return 0;
}

+ (OS_dispatch_queue)calloutQueue
{
  if (calloutQueue_onceToken != -1) { {
    dispatch_once(&calloutQueue_onceToken, &__block_literal_global_12);
  }
  }
  id v2 = (void *)calloutQueue_queue;

  return (OS_dispatch_queue *)v2;
}

void __27__FBProcess__rebuildState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setTaskState:*(void *)(a1 + 48)];
  if (([*(id *)(a1 + 32) isDebugging] & 1) != 0 || *(unsigned char *)(*(void *)(a1 + 40) + 291)) { {
    uint64_t v3 = 1;
  }
  }
  else {
    uint64_t v3 = BSPIDIsBeingDebugged();
  }
  [v4 setDebugging:v3];
}

uint64_t __37__FBProcess__setSceneLifecycleState___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 32);
  if (v2 == 1) { {
    uint64_t v3 = 1;
  }
  }
  else {
    uint64_t v3 = 2 * (v2 == 2);
  }
  return [a2 setVisibility:v3];
}

- (void)_launchDidComplete:(BOOL)a3 finalizeBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_launchFinalized)
  {
    os_unfair_recursive_lock_unlock();
    if (v6)
    {
      int64_t v7 = +[FBProcess rbInteractionWorkloop];
      dispatch_async(v7, v6);
    }
    goto LABEL_37;
  }
  self->_lock_launchFinalized = 1;
  self->_lock_launchSuccess = v4;
  unsigned int v8 = FBLogProcess();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v9)
    {
      uint64_t v10 = -[FBProcess logProem](self);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      v11 = "%{public}@ Connection to remote process established!";
LABEL_9:
      _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    }
  }
  else if (v9)
  {
    uint64_t v10 = -[FBProcess logProem](self);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    v11 = "%{public}@ Connection to remote process was not established.";
    goto LABEL_9;
  }

  id v12 = self->_lock_launchCompletionBlocks;
  lock_launchCompletionBlocks = self->_lock_launchCompletionBlocks;
  self->_lock_launchCompletionBlocks = 0;

  if ([(FBProcessWatchdog *)self->_lock_watchdog event] == 1)
  {
    [(FBSProcessWatchdog *)self->_lock_watchdog deactivate];
    if (v4)
    {
      v35 = v12;
      BOOL v36 = v4;
      id v37 = v6;
      int v14 = [MEMORY[0x1E4F1CA48] array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      int v15 = [(FBSProcessWatchdog *)self->_lock_watchdog policy];
      long long v16 = [v15 provisions];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v19) { {
              objc_enumerationMutation(v16);
            }
            }
            id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            long long v43 = 0uLL;
            uint64_t v44 = 0;
            if ([v21 isResourceProvision]
              && [v21 allowanceRemaining:&v43])
            {
              *(_OWORD *)buf = v43;
              *(void *)&buf[16] = v44;
              id v22 = [MEMORY[0x1E4F62A00] provisionWithAllowance:buf];
              if (v22)
              {
                long long v23 = FBLogWatchdog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  -[FBProcess logProem](self);
                  v25 = __int16 v24 = self;
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v25;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v21;
                  *(_WORD *)&buf[22] = 2114;
                  v50 = v22;
                  _os_log_impl(&dword_1A62FC000, v23, OS_LOG_TYPE_INFO, "%{public}@ Provision %{public}@ has remainder %{public}@", buf, 0x20u);

                  self = v24;
                }

                [v14 addObject:v22];
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v18);
      }

      __int16 v26 = v14;
      if ([v14 count])
      {
        long long v27 = [MEMORY[0x1E4F62A10] policyWithName:@"scene create after launch" forProvisions:v14];
        sceneCreateWatchdogPolicy = self->_sceneCreateWatchdogPolicy;
        self->_sceneCreateWatchdogPolicy = v27;
      }
      __int16 v29 = FBLogWatchdog();
      BOOL v4 = v36;
      id v12 = v35;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = -[FBProcess logProem](self);
        uint64_t v31 = self->_sceneCreateWatchdogPolicy;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_1A62FC000, v29, OS_LOG_TYPE_INFO, "%{public}@ Made scene-create policy: %{public}@", buf, 0x16u);
      }
      id v6 = v37;
    }
    [(FBSProcessWatchdog *)self->_lock_watchdog invalidate];
    lock_watchdog = self->_lock_watchdog;
    self->_lock_watchdog = 0;
  }
  if (v4)
  {
    if (self->_lock_waitForDebugger)
    {
      self->_lock_waitForDebugger = 0;
      [(FBProcess *)self _rebuildState];
    }
  }
  else
  {
    [(FBProcess *)self _notePendingExitForReason:@"launch failed"];
  }
  os_unfair_recursive_lock_unlock();
  v33 = +[FBProcess calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke;
  block[3] = &unk_1E5C4A8D8;
  BOOL v42 = v4;
  v39 = v12;
  v40 = self;
  id v41 = v6;
  v34 = v12;
  dispatch_async(v33, block);

LABEL_37:
}

- (void)logProem
{
  if (a1)
  {
    int v2 = (void *)a1[12];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [NSString stringWithFormat:@"[%@:-1]", a1[11]];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (FBSApplicationInfo)applicationInfo
{
  uint64_t v3 = self->_lock_applicationInfo;
  if (v3)
  {
    BOOL v4 = v3;
    os_unfair_recursive_lock_unlock();
    goto LABEL_13;
  }
  BOOL v5 = [(FBProcess *)self isApplicationProcess];
  os_unfair_recursive_lock_unlock();
  if (!v5)
  {
    BOOL v4 = 0;
    goto LABEL_13;
  }
  id v6 = +[FBSystemService sharedInstanceIfExists];
  int64_t v7 = [v6 _applicationInfoProvider];

  if (self->_auditToken && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v8 = [v7 applicationInfoForAuditToken:self->_auditToken];
  }
  else
  {
    if (!self->_bundleIdentifier)
    {
      BOOL v4 = 0;
      goto LABEL_12;
    }
    uint64_t v8 = objc_msgSend(v7, "applicationInfoForBundleIdentifier:");
  }
  BOOL v4 = (void *)v8;
LABEL_12:
  os_unfair_recursive_lock_lock_with_options();
  objc_storeStrong((id *)&self->_lock_applicationInfo, v4);
  os_unfair_recursive_lock_unlock();

LABEL_13:

  return (FBSApplicationInfo *)v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(FBProcess *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(FBProcess *)self succinctDescriptionBuilder];
  os_unfair_recursive_lock_lock_with_options();
  BOOL v5 = NSStringFromFBProcessTaskState([(FBProcessState *)self->_lock_state taskState]);
  id v6 = (id)[v4 appendObject:v5 withName:@"taskState" skipIfNil:1];

  int64_t v7 = NSStringFromFBProcessVisibility([(FBProcessState *)self->_lock_state visibility]);
  id v8 = (id)[v4 appendObject:v7 withName:@"visibility" skipIfNil:1];

  os_unfair_recursive_lock_unlock();

  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)[(FBProcess *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isPendingExit
{
  LOBYTE(self) = self->_lock_pendingExit;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isFinishedLaunching
{
  LOBYTE(self) = self->_lock_launchSuccess;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)_executeBlockAfterLaunchCompletes:(id)a3
{
  BOOL v4 = (void (**)(id, BOOL))a3;
  if (v4)
  {
    v11 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if (self->_lock_launchFinalized)
    {
      BOOL lock_launchSuccess = self->_lock_launchSuccess;
      os_unfair_recursive_lock_unlock();
      v11[2](v11, lock_launchSuccess);
    }
    else
    {
      lock_launchCompletionBlocks = self->_lock_launchCompletionBlocks;
      if (lock_launchCompletionBlocks)
      {
        int64_t v7 = (void *)[v11 copy];
        id v8 = (NSMutableArray *)MEMORY[0x1AD0B8C50]();
        [(NSMutableArray *)lock_launchCompletionBlocks addObject:v8];
      }
      else
      {
        BOOL v9 = (void *)MEMORY[0x1E4F1CA48];
        int64_t v7 = (void *)[v11 copy];
        uint64_t v10 = [v9 arrayWithObject:v7];
        id v8 = self->_lock_launchCompletionBlocks;
        self->_lock_launchCompletionBlocks = v10;
      }

      os_unfair_recursive_lock_unlock();
    }
    BOOL v4 = v11;
  }
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

+ (id)_currentProcess
{
  int v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = [v2 threadDictionary];
  BOOL v4 = [v3 objectForKey:@"FBProcess"];

  return v4;
}

- (void)_executeBlockAsCurrentProcess:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F29060];
  BOOL v5 = (void (**)(void))a3;
  id v6 = [v4 currentThread];
  id v8 = [v6 threadDictionary];

  int64_t v7 = [v8 objectForKey:@"FBProcess"];
  [v8 setObject:self forKey:@"FBProcess"];
  v5[2](v5);

  if (v7) { {
    [v8 setObject:v7 forKey:@"FBProcess"];
  }
  }
  else {
    [v8 removeObjectForKey:@"FBProcess"];
  }
}

void __30__FBProcess__bootstrapAndExec__block_invoke_2_123(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  if ([*(id *)(a1 + 40) isApplicationProcess])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 322) = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int64_t v7 = objc_msgSend(*(id *)(a1 + 40), "_observers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) { {
            objc_enumerationMutation(v7);
          }
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) applicationProcessWillLaunch:*(void *)(a1 + 40)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

void __30__FBProcess__bootstrapAndExec__block_invoke_122(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 noteProcessDidLaunch:*(void *)(a1 + 32)];

  os_unfair_recursive_lock_lock_with_options();
  id v3 = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = 0;

  os_unfair_recursive_lock_unlock();
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__FBProcess__bootstrapAndExec__block_invoke_2_123;
  v8[3] = &unk_1E5C497A0;
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v6 _executeBlockAsCurrentProcess:v8];
}

- (void)bootstrapLock:(id)a3
{
  uint64_t v4 = (void (**)(id, FBProcess *))a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_lock_lock(&self->_bootstrapLock);
  if (v4) { {
    v4[2](v4, self);
  }
  }
  os_unfair_lock_unlock(&self->_bootstrapLock);
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (BOOL)bootstrapWithDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    os_unfair_recursive_lock_lock_with_options();
    BOOL lock_attemptedBootstrap = self->_lock_attemptedBootstrap;
    if (self->_lock_attemptedBootstrap)
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      self->_BOOL lock_attemptedBootstrap = 1;
      objc_storeWeak((id *)&self->_lock_delegate, v5);
      os_unfair_recursive_lock_unlock();
      [(FBProcess *)self _bootstrapAndExec];
    }

    return !lock_attemptedBootstrap;
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess bootstrapWithDelegate:]();
    }
    }
    [v8 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)createProcessWithExecutionContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identity];
  NSClassFromString(&cfstr_Rbsprocessiden.isa);
  if (!v4)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBProcess createProcessWithExecutionContext:]();
    }
    }
LABEL_11:
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63202D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBProcess createProcessWithExecutionContext:]();
    }
    }
    goto LABEL_11;
  }

  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "fb_processClass")), "_initWithIdentity:handle:executionContext:", v4, 0, v3);

  return v5;
}

- (id)_initWithIdentity:(id)a3 handle:(id)a4 executionContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v53 = [NSString stringWithFormat:@"must be initialized with an identity : identity=%@ handle=%@", 0, v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _initWithIdentity:handle:executionContext:]();
    }
    }
LABEL_20:
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632078CLL);
  }
  long long v12 = v11;
  if ((v10 == 0) != (v11 != 0))
  {
    v53 = [NSString stringWithFormat:@"must have either a handle or a context, but not both: %@ // %@", v10, v11];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _initWithIdentity:handle:executionContext:]();
    }
    }
    goto LABEL_20;
  }
  v54.receiver = self;
  v54.super_class = (Class)FBProcess;
  long long v13 = [(FBProcess *)&v54 init];
  long long v14 = v13;
  if (v13)
  {
    v13->_lock = 0;
    *(void *)&v13->_observerLock._os_unfair_lock_opaque = 0;
    v13->_pid = -1;
    v13->_versionedPID = -1;
    objc_storeStrong((id *)&v13->_identity, a3);
    uint64_t v15 = [v9 description];
    identityDescription = v14->_identityDescription;
    v14->_identityDescription = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    executionContext = v14->_executionContext;
    v14->_executionContext = (FBProcessExecutionContext *)v17;

    uint64_t v19 = [(FBProcessExecutionContext *)v14->_executionContext watchdogProvider];
    watchdogProvider = v14->_watchdogProvider;
    v14->_watchdogProvider = (FBProcessWatchdogProviding *)v19;

    uint64_t v21 = [v9 embeddedApplicationIdentifier];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v21;

    *(int64x2_t *)&v14->_lock_executableLivesOnSystemPartition = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    long long v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observerLock_observers = v14->_observerLock_observers;
    v14->_observerLock_observers = v23;

    id v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_bootstrapBlocks = v14->_lock_bootstrapBlocks;
    v14->_lock_bootstrapBlocks = v25;

    long long v27 = (void *)MEMORY[0x1AD0B8A00]();
    uint64_t v28 = [(NSString *)v14->_identityDescription rangeOfString:@"{"];
    uint64_t v29 = [(NSString *)v14->_identityDescription rangeOfString:@"}" options:4];
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v31 = v29;
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v32 = v30;
        v33 = [(NSString *)v14->_identityDescription substringToIndex:v28];
        v34 = [(NSString *)v14->_identityDescription substringFromIndex:v31 + v32];
        uint64_t v35 = [v33 stringByAppendingString:v34];
        BOOL v36 = v14->_identityDescription;
        v14->_identityDescription = (NSString *)v35;
      }
    }
    uint64_t v37 = -[NSString rangeOfString:](v14->_identityDescription, "rangeOfString:", @"(");
    uint64_t v38 = -[NSString rangeOfString:options:](v14->_identityDescription, "rangeOfString:options:", @""), 4);
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v40 = v38;
      if (v38 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v41 = v39;
        BOOL v42 = [(NSString *)v14->_identityDescription substringToIndex:v37];
        long long v43 = [(NSString *)v14->_identityDescription substringFromIndex:v40 + v41];
        uint64_t v44 = [v42 stringByAppendingString:v43];
        long long v45 = v14->_identityDescription;
        v14->_identityDescription = (NSString *)v44;
      }
    }
    if (v10) { {
      [(FBProcess *)v14 _configureIntrinsicsFromHandle:v10];
    }
    }
    long long v46 = [[FBProcessState alloc] initWithPid:v14->_pid];
    lock_state = v14->_lock_state;
    v14->_lock_state = v46;

    [(FBProcess *)v14 _finishInit];
    long long v48 = -[FBWorkspace initWithParentProcess:]((id *)[FBWorkspace alloc], v14);
    workspace = v14->_workspace;
    v14->_workspace = (FBWorkspace *)v48;

    if (!v14->_executionContext)
    {
      v50 = [[FBProcessExecutionContext alloc] initWithIdentity:v9];
      v51 = v14->_executionContext;
      v14->_executionContext = v50;
    }
  }

  return v14;
}

- (void)_bootstrapAndExec
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 descriptionWithMultilinePrefix:0];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v5;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, a3, v6, "Bootstrapping failed for %{public}@ with error: %{public}@", (uint8_t *)&v7);
}

- (BOOL)_startWatchdogTimerForContext:(id)a3
{
  id v4 = a3;
  int pid = self->_pid;
  if (pid == getpid()) { {
    goto LABEL_4;
  }
  }
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
LABEL_4:
    BOOL v6 = 0;
    goto LABEL_5;
  }
  id v8 = [(FBProcess *)self _newWatchdogForContext:v4 completion:0];
  BOOL v6 = v8 != 0;
  if (v8)
  {
    p_lock_watchdog = &self->_lock_watchdog;
    id v10 = self->_lock_watchdog;
    objc_storeStrong((id *)p_lock_watchdog, v8);
  }
  else
  {
    id v10 = 0;
  }
  os_unfair_recursive_lock_unlock();
  [(FBSProcessWatchdog *)v10 invalidate];
  [v8 activate];

LABEL_5:
  return v6;
}

- (void)_configureIntrinsicsFromHandle:(id)a3
{
  uint64_t v5 = (RBSProcessHandle *)a3;
  if (!v5)
  {
    long long v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handle != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _configureIntrinsicsFromHandle:]();
    }
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_33:
    JUMPOUT(0x1A63225D0);
  }
  BOOL v6 = v5;
  p_rbsHandle = &self->_rbsHandle;
  rbsHandle = self->_rbsHandle;
  if (rbsHandle == v5) { {
    goto LABEL_14;
  }
  }
  if (rbsHandle)
  {
    __int16 v9 = (void *)MEMORY[0x1E4F627F0];
    [(RBSProcessHandle *)v5 auditToken];
    id v10 = [v9 tokenFromAuditToken:v40];
    if (([v10 isEqual:self->_auditToken] & 1) == 0)
    {
      uint64_t v28 = [NSString stringWithFormat:@"auditToken mismatch : existing=%@ new=%@", self->_auditToken, v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBProcess _configureIntrinsicsFromHandle:].cold.6();
      }
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6322630);
    }
    uint64_t v11 = [(RBSProcessHandle *)*p_rbsHandle identity];
    long long v12 = [(RBSProcessHandle *)v6 identity];
    char v13 = [v11 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      uint64_t v29 = NSString;
      uint64_t v30 = [(RBSProcessHandle *)*p_rbsHandle identity];
      uint64_t v31 = [(RBSProcessHandle *)v6 identity];
      uint64_t v32 = [v29 stringWithFormat:@"identity mismatch : existing=%@ new=%@", v30, v31];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBProcess _configureIntrinsicsFromHandle:].cold.5();
      }
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63226B8);
    }

    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_rbsHandle, a3);
  self->_int pid = [(RBSProcessHandle *)v6 pid];
  long long v14 = (void *)MEMORY[0x1E4F627F0];
  uint64_t v15 = self->_rbsHandle;
  if (v15) { {
    [(RBSProcessHandle *)v15 auditToken];
  }
  }
  else {
    memset(v39, 0, sizeof(v39));
  }
  long long v16 = [v14 tokenFromAuditToken:v39];
  auditToken = self->_auditToken;
  self->_auditToken = v16;

  self->_versionedPID = [(BSAuditToken *)self->_auditToken versionedPID];
  long long v18 = [MEMORY[0x1E4F96478] targetWithPid:self->_pid];
  target = self->_target;
  self->_target = v18;

  id v20 = [(FBProcess *)self succinctDescription];
  description = self->_description;
  self->_description = v20;

  uint64_t v22 = [NSString stringWithFormat:@"[%@:%d]", self->_identityDescription, self->_pid];
  handleDescription = self->_handleDescription;
  self->_handleDescription = v22;

  int pid = self->_pid;
  if (pid != [(BSAuditToken *)self->_auditToken pid])
  {
    v33 = [NSString stringWithFormat:@"RBSProcessHandle %@ gave us a pid (%d) and an audit token with pid (%d) that don't match", self->_rbsHandle, self->_pid, -[BSAuditToken pid](self->_auditToken, "pid")];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _configureIntrinsicsFromHandle:].cold.4();
    }
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6322728);
  }
  if ([(BSAuditToken *)self->_auditToken isInvalid])
  {
    v34 = [NSString stringWithFormat:@"RBSProcessHandle %@ gave us a bogus audit token: %@", self->_rbsHandle, self->_auditToken];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _configureIntrinsicsFromHandle:]();
    }
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6322788);
  }
  if (([(RBSProcessIdentity *)self->_identity isXPCService] & 1) == 0)
  {
    identity = self->_identity;
    __int16 v26 = [(RBSProcessHandle *)v6 identity];
    LOBYTE(identity) = [(RBSProcessIdentity *)identity isEqual:v26];

    if ((identity & 1) == 0)
    {
      uint64_t v35 = NSString;
      BOOL v36 = self->_identity;
      uint64_t v37 = [(RBSProcessHandle *)v6 identity];
      uint64_t v38 = [v35 stringWithFormat:@"processIdentity %@ is not equal to handleIdentity %@", v36, v37];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBProcess _configureIntrinsicsFromHandle:]();
      }
      }
      [v38 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      goto LABEL_33;
    }
  }
LABEL_14:
}

- (void)_configureBundleInfo
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)isCurrentProcess
{
  int pid = self->_pid;
  return pid == getpid();
}

- (FBProcessExecutionContext)executionContext
{
  return self->_executionContext;
}

- (id)_createBootstrapContext
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F96398]);
  [v3 setIdentity:self->_identity];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v3 setExplanation:v5];

  +[FBWorkspaceDomain sharedInstance]();
  uint64_t v6 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[FBWorkspaceDomain assertionAttributesForLaunchIntent:](v6, [(FBProcessExecutionContext *)self->_executionContext launchIntent]);
  [v3 setAttributes:v7];

  uint64_t v8 = [(FBProcessExecutionContext *)self->_executionContext overrideExecutablePath];
  [v3 _setOverrideExecutablePath:v8];

  uint8_t v9 = [(FBProcessExecutionContext *)self->_executionContext overrideExecutableSlice];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "type"));
    v18[0] = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v3 setLsBinpref:v12];

    if ([v10 subtype] != -1)
    {
      char v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "subtype"));
      uint64_t v17 = v13;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v3 setLsBinprefSubtype:v14];
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F62700]];
  [v3 setManagedEndpointLaunchIdentifiers:v15];

  return v3;
}

- (BOOL)isExtensionProcess
{
  return 0;
}

- (id)_newWatchdogForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 event];
  os_unfair_recursive_lock_lock_with_options();
  uint8_t v9 = [v6 sceneTransitionContext];
  id v10 = v9;
  if (v8 == 2
    && ([v9 watchdogTransitionContext],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 runIndependently],
        v11,
        !v12))
  {
    uint64_t v19 = self->_sceneCreateWatchdogPolicy;
    sceneCreateWatchdogPolicy = self->_sceneCreateWatchdogPolicy;
    self->_sceneCreateWatchdogPolicy = 0;

    if (v19)
    {
LABEL_10:
      uint64_t v22 = [[FBProcessWatchdog alloc] initWithProcess:self context:v6 policy:v19];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__FBProcess__newWatchdogForContext_completion___block_invoke;
      v24[3] = &unk_1E5C4A900;
      v24[4] = self;
      id v25 = v22;
      id v26 = v7;
      id v20 = v22;
      [(FBSProcessWatchdog *)v20 setCompletion:v24];

      goto LABEL_11;
    }
  }
  else
  {
    char v13 = self->_sceneCreateWatchdogPolicy;
    self->_sceneCreateWatchdogPolicy = 0;
  }
  long long v14 = [v10 watchdogTransitionContext];
  uint64_t v15 = [v14 watchdogProvider];
  long long v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [(FBProcess *)self _watchdogProvider];
  }
  long long v18 = v17;

  uint64_t v19 = [v18 watchdogPolicyForProcess:self eventContext:v6];

  if (v19) { {
    goto LABEL_10;
  }
  }
  id v20 = 0;
LABEL_11:
  os_unfair_recursive_lock_unlock();

  return v20;
}

- (RBSProcessHandle)rbsHandle
{
  return self->_rbsHandle;
}

- (id)_watchdogProvider
{
  p_watchdogProviderLock = &self->_watchdogProviderLock;
  os_unfair_lock_lock(&self->_watchdogProviderLock);
  uint64_t v4 = self->_watchdogProvider;
  os_unfair_lock_unlock(p_watchdogProviderLock);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = [(FBProcess *)self delegate];
  }
  id v6 = v5;

  return v6;
}

uint64_t __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_2(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[200]) { {
    [v2 _updateStateWithBlock:&__block_literal_global_178];
  }
  }
  os_unfair_recursive_lock_unlock();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_executeBlockAfterBootstrap:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    lock_bootstrapBlocks = self->_lock_bootstrapBlocks;
    if (lock_bootstrapBlocks)
    {
      id v6 = (void *)[v4 copy];
      id v7 = (void *)MEMORY[0x1AD0B8C50]();
      [(NSMutableArray *)lock_bootstrapBlocks addObject:v7];
    }
    else
    {
      uint64_t v8 = +[FBProcess calloutQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __41__FBProcess__executeBlockAfterBootstrap___block_invoke;
      v9[3] = &unk_1E5C4A7D0;
      v9[4] = self;
      id v10 = v4;
      dispatch_async(v8, v9);
    }
    os_unfair_recursive_lock_unlock();
  }
}

void __25__FBProcess_calloutQueue__block_invoke()
{
  id v3 = [MEMORY[0x1E4F62820] serial];
  v0 = [v3 serviceClass:33];
  uint64_t v1 = BSDispatchQueueCreate();
  id v2 = (void *)calloutQueue_queue;
  calloutQueue_queue = v1;
}

void __34__FBProcess_rbInteractionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("com.apple.frontboard.process.rb-interaction");
  uint64_t v1 = (void *)rbInteractionWorkloop_queue;
  rbInteractionWorkloop_queue = (uint64_t)inactive;

  dispatch_set_qos_class_floor((dispatch_object_t)rbInteractionWorkloop_queue, QOS_CLASS_USER_INITIATED, 0);
  id v2 = rbInteractionWorkloop_queue;

  dispatch_activate(v2);
}

+ (id)createCurrentProcess
{
  uint64_t v2 = [MEMORY[0x1E4F963E8] currentProcess];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [FBApplicationProcess alloc];
    uint64_t v5 = [v3 identity];
    id v6 = [(FBProcess *)v4 _initWithIdentity:v5 handle:v3 executionContext:0];

    return v6;
  }
  else
  {
    uint64_t v8 = [NSString stringWithFormat:@"Unable to communicate with RunningBoard"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBProcess createCurrentProcess]();
    }
    }
    [v8 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)createProcessWithHandle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identity];
  NSClassFromString(&cfstr_Rbsprocessiden.isa);
  if (!v4)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBProcess createProcessWithHandle:]();
    }
    }
LABEL_11:
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63472F0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBProcess createProcessWithHandle:]();
    }
    }
    goto LABEL_11;
  }

  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "fb_processClass")), "_initWithIdentity:handle:executionContext:", v4, v3, 0);

  return v5;
}

- (FBProcess)init
{
  id v4 = [NSString stringWithFormat:@"-[FBProcess init] is not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    int v12 = v7;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2114;
    long long v16 = @"FBProcess.m";
    __int16 v17 = 1024;
    int v18 = 186;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (FBProcess *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (NSString)name
{
  return (NSString *)[(BSProcessHandle *)self->_handle name];
}

- (FBProcessExitContext)exitContext
{
  id v3 = self->_lock_exitContext;
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (void)removeObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observerLock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = (void *)[(NSMutableSet *)self->_observerLock_observers copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) { {
            objc_enumerationMutation(v5);
          }
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 observer];
          int v12 = (void *)v11;
          if (v11) { {
            BOOL v13 = v11 == (void)v4;
          }
          }
          else {
            BOOL v13 = 1;
          }
          if (v13)
          {
            [(NSMutableSet *)self->_observerLock_observers removeObject:v10];
            [v10 invalidate];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(&self->_observerLock);
  }
}

- (id)valueForEntitlement:(id)a3
{
  return (id)[(BSAuditToken *)self->_auditToken valueForEntitlement:a3];
}

- (void)setWatchdogProvider:(id)a3
{
  id v4 = (FBProcessWatchdogProviding *)a3;
  os_unfair_lock_lock(&self->_watchdogProviderLock);
  watchdogProvider = self->_watchdogProvider;
  self->_watchdogProvider = v4;

  os_unfair_lock_unlock(&self->_watchdogProviderLock);
}

- (void)invalidate
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (int64_t)taskState
{
  int64_t v3 = [(FBProcessState *)self->_lock_state taskState];
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)visibility
{
  int64_t v3 = [(FBProcessState *)self->_lock_state visibility];
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (unsigned)assertionState
{
  return -[FBWorkspace assertionState]((uint64_t)self->_workspace);
}

- (BOOL)isPlatformBinary
{
  if (self->_lock_platformBinary == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [(FBProcess *)self applicationInfo];
    uint64_t v4 = v3;
    if (!v3 || [v3 type] == 2)
    {
      rbsHandle = self->_rbsHandle;
      if (rbsHandle) { {
        [(RBSProcessHandle *)rbsHandle auditToken];
      }
      }
      BSAuditTokenRepresentsPlatformBinary();
    }
    self->_lock_platformBinary = BSSettingFlagForBool();
  }
  char IsYes = BSSettingFlagIsYes();
  os_unfair_recursive_lock_unlock();
  return IsYes;
}

void __41__FBProcess__executeBlockAfterBootstrap___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__FBProcess__executeBlockAfterBootstrap___block_invoke_2;
  v4[3] = &unk_1E5C4A7A8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _executeBlockAsCurrentProcess:v4];
}

void __41__FBProcess__executeBlockAfterBootstrap___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 40))
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v1 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, v2, 0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) exitContext];
    id v5 = [v6 createError];
    (*(void (**)(uint64_t, uint64_t, void *))(v1 + 16))(v1, v2, v5);
  }
}

- (void)_notePendingExitForReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_pendingExit)
  {
    id v5 = FBLogProcess();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = -[FBProcess logProem](self);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1A62FC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Now flagged as pending exit for reason: %{public}@", buf, 0x16u);
    }
    self->_lock_pendingExit = 1;
    uint64_t v7 = +[FBProcess calloutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__FBProcess__notePendingExitForReason___block_invoke;
    block[3] = &unk_1E5C49AE0;
    void block[4] = self;
    dispatch_async(v7, block);

    if (self->_rbsHandle)
    {
      if ([(FBProcess *)self isApplicationProcess])
      {
        uint64_t v8 = [MEMORY[0x1E4F963E8] currentProcess];
        char v9 = objc_msgSend(v8, "fb_canTaskSuspend");

        if ((v9 & 1) == 0)
        {
          id v10 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v11 = -[FBProcess logProem](self);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          uint64_t v24 = 0;
          int v12 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F627C0]) initWithIdentifier:v11];
          lock_exitTimer = self->_lock_exitTimer;
          self->_lock_exitTimer = v12;

          long long v14 = self->_lock_exitTimer;
          long long v15 = +[FBProcess rbInteractionWorkloop];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          void v18[2] = __39__FBProcess__notePendingExitForReason___block_invoke_2;
          v18[3] = &unk_1E5C4A7F8;
          v18[4] = self;
          id v16 = v10;
          id v19 = v16;
          uint64_t v21 = buf;
          id v17 = v11;
          id v20 = v17;
          [(BSAbsoluteMachTimer *)v14 scheduleRepeatingWithFireInterval:v15 repeatInterval:v18 leewayInterval:0.5 queue:1.0 handler:0.1];

          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
  os_unfair_recursive_lock_unlock();
}

void __39__FBProcess__notePendingExitForReason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) processWillExit:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __39__FBProcess__notePendingExitForReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 296))
  {
    uint64_t v28 = [*(id *)(v4 + 40) lastExitContext];
    if (v28)
    {
      id v19 = (void *)v28;
      id v20 = [[FBProcessExitContext alloc] initWithUnderlyingContext:v28];
      [*(id *)(a1 + 32) _processDidExitWithContext:v20];
LABEL_13:

      goto LABEL_14;
    }
  }
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void *)(v7 + 24) + 1;
  *(void *)(v7 + 24) = v8;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v8, 1) >= 0x199999999999999AuLL) { {
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
  }
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  long long v10 = FBLogProcess();
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v11 = *(void *)(a1 + 48);
    int v29 = 138543618;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    double v32 = -v6;
    _os_log_impl(&dword_1A62FC000, v10, v9, "%{public}@: Still waiting on exit context after %.1f seconds", (uint8_t *)&v29, 0x16u);
  }

  if (v6 <= -300.0)
  {
    uint64_t v12 = FBLogProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
      __39__FBProcess__notePendingExitForReason___block_invoke_2_cold_1(a1, v12, v13, v14, v15, v16, v17, v18);
    }
    }

    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "bs_errorWithDomain:code:configuration:", @"FBProcessTermination", 2, &__block_literal_global_87);
    id v20 = [[FBProcessExitContext alloc] initWithTerminationError:v19];
    [*(id *)(a1 + 32) _processDidExitWithContext:v20];
    id v21 = objc_alloc(MEMORY[0x1E4F96488]);
    uint64_t v22 = [v19 userInfo];
    long long v23 = [v22 objectForKey:*MEMORY[0x1E4F28588]];
    uint64_t v24 = (void *)[v21 initWithExplanation:v23];

    [v24 setReportType:0];
    [v24 setExceptionDomain:10];
    [v24 setExceptionCode:4196196013];
    [v24 setMaximumTerminationResistance:40];
    id v25 = objc_alloc(MEMORY[0x1E4F96490]);
    id v26 = [MEMORY[0x1E4F96430] predicateMatching:*(void *)(*(void *)(a1 + 32) + 40)];
    long long v27 = (void *)[v25 initWithPredicate:v26 context:v24];

    [v27 execute:0];
    goto LABEL_13;
  }
LABEL_14:
}

void __39__FBProcess__notePendingExitForReason___block_invoke_84(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFailureDescription:@"Timed out waiting for process termination"];
  [v2 setFailureReason:@"No exit notification received after 5 minutes"];
  [v2 setCodeDescription:@"timed-out"];
}

uint64_t __30__FBProcess__bootstrapAndExec__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_processDidExitWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (FBProcessExitContext *)a3;
  [(FBProcess *)self _launchDidComplete:0 finalizeBlock:0];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    [(FBProcess *)self _notePendingExitForReason:@"process exited"];
    if (!v4
      && (!self->_bootstrapError
       || (uint64_t v4 = [[FBProcessExitContext alloc] initWithLaunchError:self->_bootstrapError]) == 0))
    {
      double v5 = FBLogProcess();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
        -[FBProcess _processDidExitWithContext:]();
      }
      }

      double v6 = [FBProcessExitContext alloc];
      id v7 = objc_alloc_init(MEMORY[0x1E4F963D8]);
      uint64_t v4 = [(FBProcessExitContext *)v6 initWithUnderlyingContext:v7];
    }
    [(FBProcessExitContext *)v4 setTerminationRequest:self->_lock_terminationRequest];
    [(FBProcessExitContext *)v4 setWatchdogContext:self->_lock_terminationWatchdogContext];
    [(FBProcessExitContext *)v4 setTerminationReason:self->_terminationReason];
    [(FBProcessExitContext *)v4 setStateBeforeExiting:self->_lock_state];
    objc_storeStrong((id *)&self->_lock_exitContext, v4);
    [(FBSProcessWatchdog *)self->_lock_watchdog invalidate];
    [(BSAbsoluteMachTimer *)self->_lock_exitTimer invalidate];
    lock_exitTimer = self->_lock_exitTimer;
    self->_lock_exitTimer = 0;

    [(RBSAssertion *)self->_lock_gracefulExitAssertion invalidate];
    lock_gracefulExitAssertion = self->_lock_gracefulExitAssertion;
    self->_lock_gracefulExitAssertion = 0;

    long long v10 = FBLogProcess();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = -[FBProcess logProem](self);
      lock_exitContext = self->_lock_exitContext;
      *(_DWORD *)buf = 138543618;
      id v21 = v11;
      __int16 v22 = 2114;
      long long v23 = lock_exitContext;
      _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Process exited: %{public}@.", buf, 0x16u);
    }
    [(FBProcess *)self _updateStateWithBlock:&__block_literal_global_162];
    self->_lock_didExit = 1;
    uint64_t v13 = self->_lock_terminateRequestCompletionBlocks;
    lock_terminateRequestCompletionBlocks = self->_lock_terminateRequestCompletionBlocks;
    self->_lock_terminateRequestCompletionBlocks = 0;

    uint64_t v15 = +[FBProcess calloutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__FBProcess__processDidExitWithContext___block_invoke_2;
    block[3] = &unk_1E5C49860;
    void block[4] = self;
    uint64_t v4 = v4;
    uint64_t v18 = v4;
    id v19 = v13;
    uint64_t v16 = v13;
    dispatch_async(v15, block);

    os_unfair_recursive_lock_unlock();
  }
}

void __40__FBProcess__processDidExitWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTaskState:1];
  [v2 setVisibility:0];
}

void __40__FBProcess__processDidExitWithContext___block_invoke_2(id *a1)
{
  id v2 = [a1[4] delegate];
  [v2 noteProcessDidExit:a1[4]];

  os_unfair_recursive_lock_lock_with_options();
  id v3 = *((id *)a1[4] + 21);
  uint64_t v4 = a1[4];
  double v5 = (void *)v4[21];
  v4[21] = 0;

  os_unfair_recursive_lock_unlock();
  *((unsigned char *)a1[4] + 321) = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__FBProcess__processDidExitWithContext___block_invoke_3;
  v11[3] = &unk_1E5C49838;
  id v12 = v3;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[4];
  id v13 = v7;
  id v14 = v8;
  id v15 = a1[6];
  id v9 = v3;
  [v6 _executeBlockAsCurrentProcess:v11];
  id v10 = FBAnalyticsLogHangTracerEvent(a1[4], 3);
}

void __40__FBProcess__processDidExitWithContext___block_invoke_3(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    id v2 = [a1[5] createError];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v3 = a1[4];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v27 != v6) { {
            objc_enumerationMutation(v3);
          }
          }
          (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v5);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [a1[6] _observers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) { {
          objc_enumerationMutation(v8);
        }
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v12++) processDidExit:a1[6]];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = a1[7];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) { {
          objc_enumerationMutation(v13);
        }
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v15);
  }
}

- (void)_rebuildState
{
  if (self->_lock_rbsState) { {
    -[FBProcess _rebuildState:](self, "_rebuildState:");
  }
  }

  os_unfair_recursive_lock_unlock();
}

uint64_t __46__FBProcess__launchDidComplete_finalizeBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setVisibility:0];
}

- (BOOL)_shouldWatchdogWithDeclineReason:(id *)a3
{
  int pid = self->_pid;
  if (pid == getpid())
  {
    BOOL result = 0;
    uint64_t v7 = @"current process can't be watchdogged";
LABEL_11:
    *a3 = v7;
    return result;
  }
  if ([(FBProcess *)self isBeingDebugged])
  {
    BOOL result = 0;
    uint64_t v7 = @"process is being debugged";
    goto LABEL_11;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"BKNoWatchdogs", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
  if ([(FBProcessExecutionContext *)self->_executionContext checkForLeaks] || AppBooleanValue)
  {
    BOOL result = 0;
    uint64_t v7 = @"override default is set";
    goto LABEL_11;
  }
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v9 = [(RBSProcessState *)self->_lock_rbsState tags];
  int v10 = [v9 containsObject:@"FBDisableWatchdog"];

  os_unfair_recursive_lock_unlock();
  if (v10) { {
    *a3 = @"watchdog is disabled via RB assertion";
  }
  }
  return v10 ^ 1;
}

- (int64_t)_watchdogReportType
{
  if (_watchdogReportType_onceToken != -1) { {
    dispatch_once(&_watchdogReportType_onceToken, &__block_literal_global_201);
  }
  }
  if (_watchdogReportType___StackshotOverride) { {
    return 2;
  }
  }
  if ([(FBProcess *)self isPlatformBinary]) { {
    return 2;
  }
  }
  return 1;
}

uint64_t __32__FBProcess__watchdogReportType__block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"BKStackshotAppTimeout", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
  _watchdogReportType___StackshotOverride = result != 0;
  return result;
}

- (void)_terminateWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    long long v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"request != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _terminateWithRequest:completion:]();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6349098);
  }
  id v8 = v7;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v9 = FBLogProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = -[FBProcess logProem](self);
    *(_DWORD *)buf = 138543618;
    long long v29 = v10;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Received termination request: %{public}@", buf, 0x16u);
  }
  if (self->_lock_launchFinalized && !self->_lock_launchSuccess || self->_lock_didExit)
  {
    os_unfair_recursive_lock_unlock();
    uint64_t v11 = FBLogProcess();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = -[FBProcess logProem](self);
      *(_DWORD *)buf = 138543362;
      long long v29 = v12;
      _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring termination request because the process either failed to launch or already exited.", buf, 0xCu);
    }
    id v13 = +[FBProcess calloutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__FBProcess__terminateWithRequest_completion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v27 = v8;
    dispatch_async(v13, block);
  }
  else
  {
    if (!self->_rbsHandle)
    {
      long long v25 = [NSString stringWithFormat:@"cannot terminate a process before it has attempted bootstrapping"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBProcess _terminateWithRequest:completion:]();
      }
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63490F0);
    }
    if (v8)
    {
      lock_terminateRequestCompletionBlocks = self->_lock_terminateRequestCompletionBlocks;
      if (lock_terminateRequestCompletionBlocks)
      {
        uint64_t v16 = (void *)[v8 copy];
        uint64_t v17 = (NSMutableArray *)MEMORY[0x1AD0B8C50]();
        [(NSMutableArray *)lock_terminateRequestCompletionBlocks addObject:v17];
      }
      else
      {
        long long v18 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v16 = (void *)[v8 copy];
        long long v19 = [v18 arrayWithObject:v16];
        uint64_t v17 = self->_lock_terminateRequestCompletionBlocks;
        self->_lock_terminateRequestCompletionBlocks = v19;
      }
    }
    uint64_t v20 = [v6 exceptionCode];
    lock_terminationRequest = self->_lock_terminationRequest;
    if (!lock_terminationRequest
      || v20 == 2343432205
      && [(FBSProcessTerminationRequest *)lock_terminationRequest exceptionCode] != 2343432205)
    {
      uint64_t v14 = (void *)[v6 copy];

      objc_storeStrong((id *)&self->_lock_terminationRequest, v14);
      if (v20 != 2343432205 && ([v14 options] & 1) != 0)
      {
        if ([(FBProcessState *)self->_lock_state taskState] == 2)
        {
          [(FBProcess *)self _lock_consumeLock_performGracefulKill];
          goto LABEL_11;
        }
        objc_msgSend(v14, "setOptions:", objc_msgSend(v14, "options") & 0xFFFFFFFFFFFFFFFELL);
        [v14 setReportType:0];
      }
      [(FBProcess *)self _lock_consumeLock_executeTerminationRequest];
      goto LABEL_11;
    }
    os_unfair_recursive_lock_unlock();
    long long v22 = FBLogProcess();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      long long v23 = -[FBProcess logProem](self);
      *(_DWORD *)buf = 138543362;
      long long v29 = v23;
      _os_log_impl(&dword_1A62FC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Already terminating; ignoring additional termination request.",
        buf,
        0xCu);
    }
  }
  uint64_t v14 = v6;
LABEL_11:
}

uint64_t __46__FBProcess__terminateWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  }
  return result;
}

- (void)_killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  int pid = self->_pid;
  if (pid == getpid())
  {
    long long v22 = NSString;
    long long v23 = FBSApplicationTerminationReasonDescription();
    long long v24 = [v22 stringWithFormat:@"The current requested its own termination (for reason \"%@\" with description \"%@\"", v23, v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _killForReason:andReport:withDescription:completion:]();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A634938CLL);
  }
  if (!v10)
  {
    FBSApplicationTerminationReasonDescription();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = FBLogProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = -[FBProcess logProem](self);
    uint64_t v15 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v16 = [v15 processName];
    *(_DWORD *)buf = 138543874;
    id v27 = v14;
    __int16 v28 = 2114;
    long long v29 = v16;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ requested termination (\"%{public}@\")", buf, 0x20u);
  }
  [(FBProcess *)self _notePendingExitForReason:@"explicit kill request from client"];
  int64_t v17 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 9)
  {
    long long v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"fbReason != FBProcessKillReasonUnknown"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcess _killForReason:andReport:withDescription:completion:]();
    }
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63493F0);
  }
  uint64_t v18 = qword_1A63864E8[v17];
  uint64_t v19 = qword_1A6386530[v17];
  if (!self->_terminationReason) { {
    self->_terminationReason = a3;
  }
  }
  if (v7) { {
    uint64_t v20 = v18;
  }
  }
  else {
    uint64_t v20 = 0;
  }
  long long v21 = [MEMORY[0x1E4F62A08] requestForProcess:self withLabel:v10];
  [v21 setReportType:v20];
  [v21 setExceptionCode:v19];
  [v21 setExplanation:v10];
  [v21 setOptions:FBSApplicationTerminationReasonIsGraceful()];
  [(FBProcess *)self _terminateWithRequest:v21 completion:v11];
}

- (void)_lock_consumeLock_executeTerminationRequest
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = [MEMORY[0x1E4F96430] predicateMatching:*(void *)(*(void *)(a1 + 32) + 40)];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithPredicate:v2 context:*(void *)(v1 + 8)];
  id v16 = 0;
  char v4 = [v3 execute:&v16];
  id v5 = v16;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = FBLogProcess();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
      __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_cold_1((void **)v1, v5, v6);
    }
    }

    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_280;
    uint64_t v14 = &unk_1E5C4A4C0;
    id v15 = v5;
    uint64_t v8 = objc_msgSend(v7, "bs_errorWithDomain:code:configuration:", @"FBProcessTermination", 1, &v11);
    uint8_t v9 = [FBProcessExitContext alloc];
    id v10 = -[FBProcessExitContext initWithTerminationError:](v9, "initWithTerminationError:", v8, v11, v12, v13, v14);
    [*(id *)v1 _processDidExitWithContext:v10];
  }
}

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_280(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Termination request failed"];
  [v3 setFailureReason:@"RunningBoard returned an error"];
  [v3 setCodeDescription:@"request-failed"];
  [v3 setUnderlyingError:*(void *)(a1 + 32)];
}

- (void)_lock_consumeLock_performGracefulKill
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, a4, a3, "%{public}@ Failed to acquire graceful termination assertion: %{public}@", (uint8_t *)a3);
}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 invalidate];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = -[FBProcess logProem](WeakRetained);
    uint64_t v8 = [v6 stringWithFormat:@"%@ Failed to terminate gracefully after %.1fs", v7, *(void *)(a1 + 56)];

    uint8_t v9 = FBLogProcess();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) { {
      __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_cold_1();
    }
    }

    id v10 = [MEMORY[0x1E4F62A08] requestForProcess:v5 withLabel:@"graceful termination failed"];
    objc_msgSend(v10, "setReportType:", objc_msgSend(v5, "_watchdogReportType"));
    [v10 setExceptionCode:2343432205];
    [v10 setExplanation:v8];
    os_unfair_recursive_lock_lock_with_options();
    id v11 = v5[27];
    v5[27] = v10;
    id v12 = v10;

    objc_storeStrong(v5 + 28, *(id *)(a1 + 32));
    objc_storeStrong(v5 + 26, *(id *)(a1 + 40));
    uint64_t v13 = [MEMORY[0x1E4F62A00] provisionWithResourceType:1 timeInterval:*(double *)(a1 + 56)];
    id v14 = v5[35];
    v5[35] = (id)v13;

    id v15 = v5[19];
    if (v15 == v3)
    {
      v5[19] = 0;
    }
    objc_msgSend(v5, "_lock_consumeLock_executeTerminationRequest");
  }
}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_309(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    if ((id)WeakRetained[19] == v4)
    {
      WeakRetained[19] = 0;
    }
    os_unfair_recursive_lock_unlock();
  }
}

- (BSMachPortTaskNameRight)taskNameRight
{
  return 0;
}

- (void)_terminateWithRequest:(id)a3 forWatchdog:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_lock_terminationWatchdogContext)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v11 eventContext];
      lock_terminationWatchdogContext = self->_lock_terminationWatchdogContext;
      self->_lock_terminationWatchdogContext = v7;

      uint8_t v9 = [v11 cpuStatistics];
      lock_watchdogCPUStatistics = self->_lock_watchdogCPUStatistics;
      self->_lock_watchdogCPUStatistics = v9;
    }
  }
  os_unfair_recursive_lock_unlock();
  [(FBProcess *)self _terminateWithRequest:v6 completion:0];

  [v11 invalidate];
}

- (id)_watchdog:(id)a3 terminationRequestForViolatedProvision:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint8_t v9 = [(FBProcess *)self _watchdogProvider];
  if (!v9
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v9 watchdogTerminationRequestForProcess:self error:v8],
        (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [MEMORY[0x1E4F62A08] requestForProcess:self withLabel:@"watchdog provision violated"];
    objc_msgSend(v10, "setReportType:", -[FBProcess _watchdogReportType](self, "_watchdogReportType"));
  }
  id v11 = NSString;
  id v12 = [v7 name];
  uint64_t v13 = [v8 localizedFailureReason];
  id v14 = (void *)v13;
  if (v13)
  {
    id v15 = [v11 stringWithFormat:@"%@ watchdog transgression: %@", v12, v13];
  }
  else
  {
    id v16 = [v8 localizedDescription];
    id v15 = [v11 stringWithFormat:@"%@ watchdog transgression: %@", v12, v16];
  }
  int64_t v17 = [v10 explanation];
  if (v17)
  {
    id v18 = [NSString stringWithFormat:@"%@; %@", v15, v17];
  }
  else
  {
    id v18 = v15;
  }
  uint64_t v19 = v18;
  [v10 setExplanation:v18];
  [v10 setExceptionCode:2343432205];

  return v10;
}

- (BOOL)_watchdog:(id)a3 shouldTerminateWithDeclineReason:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(FBProcess *)self _shouldWatchdogWithDeclineReason:a4];
  if (!v7)
  {
    id v8 = FBLogProcess();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v9 = -[FBProcess logProem](self);
      id v10 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v6];
      id v11 = *a4;
      int v14 = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      int64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring %{public}@ for reason: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    os_unfair_recursive_lock_lock_with_options();
    [(BSAbsoluteMachTimer *)self->_lock_exitTimer invalidate];
    lock_exitTimer = self->_lock_exitTimer;
    self->_lock_exitTimer = 0;

    os_unfair_recursive_lock_unlock();
  }

  return v7;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  int v5 = [v4 pid];
  int pid = self->_pid;
  if (pid <= 0 && v5 < 1)
  {
    identity = self->_identity;
    id v10 = [v4 identity];
    char v8 = [(RBSProcessIdentity *)identity isEqual:v10];
  }
  else
  {
    char v8 = pid == v5;
  }

  return v8;
}

- (id)processPredicate
{
  if (self->_pid < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F96430];
    id v3 = objc_msgSend(NSNumber, "numberWithInt:");
    id v4 = [v2 predicateMatchingIdentifier:v3];
  }

  return v4;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

+ (void)createCurrentProcess
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createProcessWithHandle:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createProcessWithExecutionContext:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:handle:executionContext:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:handle:executionContext:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)bootstrapWithDelegate:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __39__FBProcess__notePendingExitForReason___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_configureIntrinsicsFromHandle:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureIntrinsicsFromHandle:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureIntrinsicsFromHandle:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureIntrinsicsFromHandle:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureIntrinsicsFromHandle:.cold.5()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureIntrinsicsFromHandle:.cold.6()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteStateDidUpdate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 process];
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "invalid task state received from runningboard for %{public}@", v4, 0xCu);
}

- (void)_processDidExitWithContext:.cold.1()
{
}

- (void)_rebuildState:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_terminateWithRequest:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_terminateWithRequest:completion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_killForReason:andReport:withDescription:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_killForReason:andReport:withDescription:completion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __56__FBProcess__lock_consumeLock_executeTerminationRequest__block_invoke_cold_1(void **a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[FBProcess logProem](*a1);
  uint64_t v6 = [a2 descriptionWithMultilinePrefix:0];
  int v8 = 138543618;
  uint8_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v6;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, a3, v7, "%{public}@ Termination failed with error: %{public}@", (uint8_t *)&v8);
}

void __50__FBProcess__lock_consumeLock_performGracefulKill__block_invoke_cold_1()
{
}

@end