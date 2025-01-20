@interface FBApplicationUpdateScenesTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)_isReadyToLaunch;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)waitsForSceneCommits;
- (FBApplicationProcess)process;
- (FBApplicationUpdateScenesTransaction)init;
- (FBApplicationUpdateScenesTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4;
- (FBApplicationUpdateScenesTransaction)initWithClientIdentity:(id)a3 executionContextProvider:(id)a4;
- (FBApplicationUpdateScenesTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4;
- (NSString)bundleID;
- (id)_customizedDescriptionProperties;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_childTransactionDidFinishWork:(id)a3;
- (void)_didComplete;
- (void)_didRemoveChildTransaction:(id)a3;
- (void)_didSatisfyMilestone:(id)a3;
- (void)_executeProcessLaunchIfAppropriate;
- (void)_executeSceneUpdatesIfAppropriate;
- (void)_updateSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5;
- (void)_willAddChildTransaction:(id)a3;
- (void)_willBegin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)add:(id)a3;
- (void)addObserver:(id)a3;
- (void)remove:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setWaitsForSceneCommits:(BOOL)a3;
- (void)transaction:(id)a3 didLaunchProcess:(id)a4;
- (void)transaction:(id)a3 willLaunchProcess:(id)a4;
- (void)updateSceneTransactionDidCommitUpdate:(id)a3;
- (void)updateSceneTransactionDidCreateScene:(id)a3;
- (void)updateSceneTransactionWillCommitUpdate:(id)a3;
- (void)updateSceneTransactionWillUpdateScene:(id)a3;
- (void)updateSceneWithIdentifier:(id)a3 parameters:(id)a4 transitionContext:(id)a5;
@end

@implementation FBApplicationUpdateScenesTransaction

- (void)updateSceneWithIdentifier:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F62A60];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 identityForIdentifier:a3];
  [(FBApplicationUpdateScenesTransaction *)self _updateSceneWithIdentity:v11 parameters:v10 transitionContext:v9];
}

void __70__FBApplicationUpdateScenesTransaction_transaction_willLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 transaction:*(void *)(a1 + 32) willLaunchProcess:*(void *)(a1 + 40)];
  }
  }
}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
  id v5 = a4;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __70__FBApplicationUpdateScenesTransaction_transaction_willLaunchProcess___block_invoke;
  id v10 = &unk_1E5C49D90;
  id v11 = self;
  id v12 = v5;
  id v6 = v5;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:&v7];
  self->_processLaunched = 1;
  [(FBApplicationUpdateScenesTransaction *)self _executeSceneUpdatesIfAppropriate];
}

- (void)_updateSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  NSClassFromString(&cfstr_Fbssceneparame.isa);
  if (!v10)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:]();
    }
    }
LABEL_22:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630E748);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:]();
    }
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630E7ACLL);
  }

  id v11 = [v10 specification];
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v11)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:]();
    }
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630E810);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction _updateSceneWithIdentity:parameters:transitionContext:]();
    }
    }
    goto LABEL_22;
  }

  if (([(FBApplicationUpdateScenesTransaction *)self isRunning] & 1) == 0
    && ([(FBApplicationUpdateScenesTransaction *)self isComplete] & 1) == 0)
  {
    id v12 = [(FBApplicationUpdateScenesTransaction *)self queue];
    dispatch_assert_queue_V2(v12);

    v13 = [MEMORY[0x1E4F629B0] definition];
    [v13 setIdentity:v19];
    [v13 setClientIdentity:self->_clientIdentity];
    v14 = [v10 specification];
    [v13 setSpecification:v14];

    v15 = [[FBUpdateSceneTransaction alloc] initWithSceneDefinition:v13 parameters:v10 transitionContext:v9];
    [(NSMutableArray *)self->_pendingUpdateTransactions addObject:v15];
    [(FBApplicationUpdateScenesTransaction *)self _executeSceneUpdatesIfAppropriate];
  }
}

- (void)_executeSceneUpdatesIfAppropriate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_processLaunched)
  {
    uint64_t v3 = [(FBApplicationProcessLaunchTransaction *)self->_processLaunchTransaction process];
    if (v3)
    {
      v4 = (void *)v3;
      uint64_t v5 = [(NSMutableArray *)self->_pendingUpdateTransactions count];

      if (v5)
      {
        if ([(FBApplicationUpdateScenesTransaction *)self isAuditHistoryEnabled]) { {
          [(FBApplicationUpdateScenesTransaction *)self _addAuditHistoryItem:@"Beginning scene updates."];
        }
        }
        id v6 = (void *)[(NSMutableArray *)self->_pendingUpdateTransactions copy];
        [(NSMutableArray *)self->_pendingUpdateTransactions removeAllObjects];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v14;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v14 != v10) { {
                objc_enumerationMutation(v7);
              }
              }
              id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
              objc_msgSend(v12, "addObserver:", self, (void)v13);
              [v12 setWaitsForSceneCommit:self->_waitsForSceneCommits];
              [(FBSynchronizedTransactionGroup *)self addSynchronizedTransaction:v12];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v9);
        }
      }
    }
  }
}

- (void)_didComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(FBApplicationProcessLaunchTransaction *)self->_processLaunchTransaction removeObserver:self];
  [(NSMutableArray *)self->_pendingUpdateTransactions removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_updateSceneTransactions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) { {
          objc_enumerationMutation(v3);
        }
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBSynchronizedTransactionGroup *)&v8 _didComplete];
}

- (void)_willAddChildTransaction:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v5 _willAddChildTransaction:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) { {
    [(NSMutableArray *)self->_updateSceneTransactions addObject:v4];
  }
  }
}

- (void)_didSatisfyMilestone:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v4 _didSatisfyMilestone:a3];
  [(FBApplicationUpdateScenesTransaction *)self _executeProcessLaunchIfAppropriate];
}

- (void)_willBegin
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v3 _willBegin];
  [(FBApplicationUpdateScenesTransaction *)self _executeProcessLaunchIfAppropriate];
}

- (void)_childTransactionDidFinishWork:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v4 _childTransactionDidFinishWork:a3];
  [(FBApplicationUpdateScenesTransaction *)self _executeProcessLaunchIfAppropriate];
}

- (void)_childTransactionDidComplete:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBSynchronizedTransactionGroup *)&v4 _childTransactionDidComplete:a3];
  [(FBApplicationUpdateScenesTransaction *)self _executeProcessLaunchIfAppropriate];
}

- (void)_executeProcessLaunchIfAppropriate
{
  if (!self->_hasScheduledProcessLaunch
    && [(FBApplicationUpdateScenesTransaction *)self _isReadyToLaunch])
  {
    self->_hasScheduledProcessLaunch = 1;
    [(FBApplicationProcessLaunchTransaction *)self->_processLaunchTransaction addObserver:self];
    processLaunchTransaction = self->_processLaunchTransaction;
    [(FBApplicationUpdateScenesTransaction *)self addChildTransaction:processLaunchTransaction];
  }
}

- (FBApplicationUpdateScenesTransaction)initWithProcessIdentity:(id)a3 executionContextProvider:(id)a4
{
  uint64_t v6 = FBSSceneClientIdentity;
  id v7 = a4;
  objc_super v8 = [v6 identityForProcessIdentity:a3];
  long long v9 = [(FBApplicationUpdateScenesTransaction *)self initWithClientIdentity:v8 executionContextProvider:v7];

  return v9;
}

- (FBApplicationUpdateScenesTransaction)initWithClientIdentity:(id)a3 executionContextProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clientIdentity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction initWithClientIdentity:executionContextProvider:](a2);
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_12;
  }
  long long v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)FBApplicationUpdateScenesTransaction;
  long long v10 = [(FBSynchronizedTransactionGroup *)&v31 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    clientIdentity = v10->_clientIdentity;
    v10->_clientIdentity = (FBSSceneClientIdentity *)v11;

    v10->_waitsForSceneCommits = 1;
    long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updateSceneTransactions = v10->_updateSceneTransactions;
    v10->_updateSceneTransactions = v13;

    long long v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingUpdateTransactions = v10->_pendingUpdateTransactions;
    v10->_pendingUpdateTransactions = v15;

    uint64_t v17 = [v7 processIdentity];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      objc_initWeak(&location, v10);
      id v19 = [FBApplicationProcessLaunchTransaction alloc];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __88__FBApplicationUpdateScenesTransaction_initWithClientIdentity_executionContextProvider___block_invoke;
      v26[3] = &unk_1E5C49D68;
      objc_copyWeak(&v29, &location);
      id v28 = v9;
      id v20 = v18;
      id v27 = v20;
      uint64_t v21 = [(FBApplicationProcessLaunchTransaction *)v19 initWithProcessIdentity:v20 executionContextProvider:v26];
      processLaunchTransaction = v10->_processLaunchTransaction;
      v10->_processLaunchTransaction = (FBApplicationProcessLaunchTransaction *)v21;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

      goto LABEL_5;
    }
    v25 = [NSString stringWithFormat:@"must be a process identity based client identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction initWithClientIdentity:executionContextProvider:]();
    }
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_12:
    JUMPOUT(0x1A6324990);
  }
LABEL_5:

  return v10;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v3 addObserver:a3];
}

- (void)updateSceneTransactionWillCommitUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 scene];
  [(FBApplicationUpdateScenesTransaction *)self _noteWillCommitUpdateForScene:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillCommitUpdate___block_invoke;
  v7[3] = &unk_1E5C49D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:v7];
}

- (void)updateSceneTransactionDidCommitUpdate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 scene];
  [(FBApplicationUpdateScenesTransaction *)self _noteDidCommitUpdateForScene:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCommitUpdate___block_invoke;
  v7[3] = &unk_1E5C49D90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:v7];
}

void __69__FBApplicationUpdateScenesTransaction_transaction_didLaunchProcess___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 transaction:*(void *)(a1 + 32) didLaunchProcess:*(void *)(a1 + 40)];
  }
  }
}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__FBApplicationUpdateScenesTransaction_transaction_didLaunchProcess___block_invoke;
  v7[3] = &unk_1E5C49D90;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:v7];
}

- (void)updateSceneTransactionDidCreateScene:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCreateScene___block_invoke;
  v6[3] = &unk_1E5C49D90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:v6];
}

void __79__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillCommitUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) scene];
    [v5 transaction:v3 willCommitSceneUpdate:v4];
  }
}

void __77__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) scene];
    [v5 transaction:v3 didCreateScene:v4];
  }
}

void __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionDidCommitUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) scene];
    [v5 transaction:v3 didCommitSceneUpdate:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

- (void)setWaitsForSceneCommits:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_waitsForSceneCommits = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_updateSceneTransactions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", self->_waitsForSceneCommits, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

id __88__FBApplicationUpdateScenesTransaction_initWithClientIdentity_executionContextProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) { {
    id v4 = (void *)*((void *)WeakRetained + 28);
  }
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6
    || ((*(void (**)(void))(v6 + 16))(),
        (uint64_t v7 = (FBMutableProcessExecutionContext *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [(FBProcessExecutionContext *)[FBMutableProcessExecutionContext alloc] initWithIdentity:*(void *)(a1 + 32)];
  }
  uint64_t v8 = [v5 firstObject];
  long long v9 = [v8 settings];
  id v10 = [(FBProcessExecutionContext *)v7 copyOrUpdateForSceneActivationWithSettings:v9];

  return v10;
}

- (FBApplicationUpdateScenesTransaction)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBApplicationProcessLaunchTransaction"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    long long v16 = @"FBApplicationUpdateScenesTransaction.m";
    __int16 v17 = 1024;
    int v18 = 50;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBApplicationUpdateScenesTransaction *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBApplicationUpdateScenesTransaction)initWithApplicationBundleID:(id)a3 executionContextProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = v7;
    int v9 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v6];
    id v10 = [(FBApplicationUpdateScenesTransaction *)self initWithProcessIdentity:v9 executionContextProvider:v8];

    return v10;
  }
  else
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBApplicationUpdateScenesTransaction initWithApplicationBundleID:executionContextProvider:]();
    }
    }
    [v12 UTF8String];
    result = (FBApplicationUpdateScenesTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSString)bundleID
{
  v2 = [(FBSSceneClientIdentity *)self->_clientIdentity processIdentity];
  uint64_t v3 = [v2 embeddedApplicationIdentifier];

  return (NSString *)v3;
}

- (FBApplicationProcess)process
{
  uint64_t v3 = [(FBApplicationUpdateScenesTransaction *)self queue];
  dispatch_assert_queue_V2(v3);

  processLaunchTransaction = self->_processLaunchTransaction;

  return (FBApplicationProcess *)[(FBApplicationProcessLaunchTransaction *)processLaunchTransaction process];
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v3 removeObserver:a3];
}

- (void)add:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v3 addObserver:a3];
}

- (void)remove:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v3 removeObserver:a3];
}

- (void)_didRemoveChildTransaction:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v5 _didRemoveChildTransaction:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 removeObserver:self];
    [(NSMutableArray *)self->_updateSceneTransactions removeObject:v4];
  }
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  if (self->_processLaunchTransaction == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v13 _willInterruptWithReason:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_updateSceneTransactions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_willFailWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)FBApplicationUpdateScenesTransaction;
  [(FBApplicationUpdateScenesTransaction *)&v13 _willFailWithReason:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_updateSceneTransactions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setWaitsForSceneCommit:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_customizedDescriptionProperties
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_clientIdentity forKey:@"ClientIdentity"];
  id v4 = NSStringFromBOOL();
  [v3 setObject:v4 forKey:@"Waits for scene commits"];

  return v3;
}

- (BOOL)_isReadyToLaunch
{
  return 1;
}

- (void)updateSceneTransactionWillUpdateScene:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillUpdateScene___block_invoke;
  v6[3] = &unk_1E5C49D90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FBApplicationUpdateScenesTransaction *)self _enumerateObserversWithBlock:v6];
}

void __78__FBApplicationUpdateScenesTransaction_updateSceneTransactionWillUpdateScene___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) scene];
    [v5 transaction:v3 willUpdateScene:v4];
  }
}

- (BOOL)waitsForSceneCommits
{
  return self->_waitsForSceneCommits;
}

- (void)initWithApplicationBundleID:executionContextProvider:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithClientIdentity:(const char *)a1 executionContextProvider:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)initWithClientIdentity:executionContextProvider:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateSceneWithIdentity:parameters:transitionContext:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateSceneWithIdentity:parameters:transitionContext:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end