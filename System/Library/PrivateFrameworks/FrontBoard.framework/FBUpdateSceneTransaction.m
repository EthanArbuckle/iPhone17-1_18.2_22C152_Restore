@interface FBUpdateSceneTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)destroyed;
- (BOOL)isReadyForSynchronizedCommit;
- (BOOL)waitsForSceneCommit;
- (FBSSceneSettings)settings;
- (FBSSceneSpecification)specification;
- (FBSSceneTransitionContext)transitionContext;
- (FBScene)scene;
- (FBSynchronizedTransactionDelegate)synchronizationDelegate;
- (FBUpdateSceneTransaction)initWithSceneIdentifier:(id)a3 process:(id)a4 parameters:(id)a5 transitionContext:(id)a6;
- (FBUpdateSceneTransaction)initWithSceneToUpdate:(id)a3 newSettings:(id)a4 transitionContext:(id)a5;
- (NSString)sceneIdentifier;
- (id)_customizedDescriptionProperties;
- (id)_initWithSceneDefinition:(id)a3 parameters:(id)a4 transitionContext:(id)a5;
- (void)_begin;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_commitSceneOrWait;
- (void)_commitSceneUpdate:(id)a3;
- (void)_createScene;
- (void)_didComplete;
- (void)_noteDidCommit:(BOOL)a3;
- (void)_noteDidCreate;
- (void)_noteWillCommit;
- (void)_noteWillUpdate;
- (void)_performCommit;
- (void)_updateScene;
- (void)add:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)performSynchronizedCommit;
- (void)remove:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scene;
- (void)sceneDidInvalidate:(id)a3;
- (void)setSynchronizationDelegate:(id)a3;
- (void)setWaitsForSceneCommit:(BOOL)a3;
@end

@implementation FBUpdateSceneTransaction

uint64_t __40__FBUpdateSceneTransaction__createScene__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _noteDidCommit:a2];
}

- (void)_noteDidCommit:(BOOL)a3
{
  if (a3)
  {
    if (([(FBUpdateSceneTransaction *)self isFailed] & 1) == 0)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __43__FBUpdateSceneTransaction__noteDidCommit___block_invoke;
      v5[3] = &unk_1E5C4AD18;
      v5[4] = self;
      [(FBUpdateSceneTransaction *)self _enumerateObserversWithBlock:v5];
      [(FBUpdateSceneTransaction *)self satisfyMilestone:@"sceneUpdateDidCommit"];
    }
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"Scene update failed"];
    [(FBUpdateSceneTransaction *)self _failWithReason:@"scene update failed" description:v4];
  }
}

- (void)setSynchronizationDelegate:(id)a3
{
}

- (void)setWaitsForSceneCommit:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(FBUpdateSceneTransaction *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_waitsForSceneCommit != v3)
  {
    self->_waitsForSceneCommit = v3;
    int v6 = [(FBUpdateSceneTransaction *)self isWaitingForMilestone:@"sceneUpdateDidCommit"];
    if (self->_waitsForSceneCommit || v6 == 0)
    {
      if (self->_waitsForSceneCommit) { {
        char v8 = v6;
      }
      }
      else {
        char v8 = 1;
      }
      if ((v8 & 1) == 0 && ([(FBUpdateSceneTransaction *)self isComplete] & 1) == 0)
      {
        [(FBUpdateSceneTransaction *)self addMilestone:@"sceneUpdateDidCommit"];
      }
    }
    else
    {
      [(FBUpdateSceneTransaction *)self removeMilestone:@"sceneUpdateDidCommit"];
    }
  }
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v3 addObserver:a3];
}

- (id)_initWithSceneDefinition:(id)a3 parameters:(id)a4 transitionContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Fbsscenedefini.isa);
  if (!v12)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:]();
    }
    }
LABEL_28:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630EEA4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:]();
    }
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630EF08);
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Fbssceneparame.isa);
  if (!v13)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:](a2);
    }
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630EF6CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:](a2);
    }
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630EFD0);
  }

  if (([v12 isValid] & 1) == 0)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[definition isValid]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:].cold.4();
    }
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630F034);
  }
  id v14 = v11;
  if (v14)
  {
    NSClassFromString(&cfstr_Fbsscenetransi_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneTransitionContextClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBUpdateSceneTransaction _initWithSceneDefinition:parameters:transitionContext:]();
      }
      }
      goto LABEL_28;
    }
  }

  v34.receiver = self;
  v34.super_class = (Class)FBUpdateSceneTransaction;
  v15 = [(FBTransaction *)&v34 init];
  if (v15)
  {
    uint64_t v16 = +[FBSceneManager sharedInstance];
    sceneManager = v15->_sceneManager;
    v15->_sceneManager = (FBSceneManager *)v16;

    v18 = [v12 identity];
    v19 = [v18 identifier];
    uint64_t v20 = [v19 copy];
    sceneID = v15->_sceneID;
    v15->_sceneID = (NSString *)v20;

    uint64_t v22 = [v12 copy];
    definition = v15->_definition;
    v15->_definition = (FBSSceneDefinition *)v22;

    uint64_t v24 = [v13 copy];
    parameters = v15->_parameters;
    v15->_parameters = (FBSSceneParameters *)v24;

    uint64_t v26 = [v14 copy];
    transitionContext = v15->_transitionContext;
    v15->_transitionContext = (FBSSceneTransitionContext *)v26;

    v15->_waitsForSceneCommit = 1;
  }

  return v15;
}

- (FBScene)scene
{
  objc_super v3 = [(FBUpdateSceneTransaction *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(FBSceneManager *)self->_sceneManager sceneWithIdentifier:self->_sceneID];
  v5 = (void *)v4;
  if (v4 && !-[FBScene _isLegacy](v4))
  {
    v7 = [NSString stringWithFormat:@"this transaction only supports legacy scenes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction scene]();
    }
    }
    [v7 UTF8String];
    result = (FBScene *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    return (FBScene *)v5;
  }
  return result;
}

- (void)_createScene
{
  objc_super v3 = [(FBSSceneDefinition *)self->_definition clientIdentity];
  if (([v3 isLocal] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
    int v5 = [v4 isEqual:v3];

    if (!v5)
    {
      v7 = +[FBProcessManager sharedInstance];
      char v8 = [(FBSSceneDefinition *)self->_definition clientIdentity];
      id v9 = [v8 processIdentity];
      id v10 = [v7 processForIdentity:v9];
      int v6 = [v10 workspace];

      if (v6) { {
        goto LABEL_4;
      }
      }
LABEL_6:
      id v11 = NSString;
      id v12 = [(FBSSceneDefinition *)self->_definition clientIdentity];
      id v13 = [v11 stringWithFormat:@"no client provider for client with identity %@", v12];
      [(FBUpdateSceneTransaction *)self _failWithReason:@"scene update failed" description:v13];

      goto LABEL_7;
    }
  }
  int v6 = +[FBLocalSynchronousSceneClientProvider sharedInstance];
  if (!v6) { {
    goto LABEL_6;
  }
  }
LABEL_4:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__FBUpdateSceneTransaction__createScene__block_invoke;
  v14[3] = &unk_1E5C497A0;
  v14[4] = self;
  id v15 = v6;
  [(FBUpdateSceneTransaction *)self _commitSceneUpdate:v14];

LABEL_7:
}

void __35__FBUpdateSceneTransaction_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sceneWithIdentifier:*(void *)(a1 + 40)];
  [v2 removeObserver:*(void *)(a1 + 48)];
}

- (void)_didComplete
{
  objc_super v3 = [(FBUpdateSceneTransaction *)self scene];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v4 _didComplete];
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v3 removeObserver:a3];
}

- (void)performSynchronizedCommit
{
  if ([(FBUpdateSceneTransaction *)self isReadyForSynchronizedCommit])
  {
    self->_didCommit = 1;
    if ([(FBUpdateSceneTransaction *)self isAuditHistoryEnabled]) { {
      [(FBUpdateSceneTransaction *)self _addAuditHistoryItem:@"Performing synchronized commit."];
    }
    }
    id v3 = [(FBUpdateSceneTransaction *)self synchronizationDelegate];
    [v3 synchronizedTransaction:self willCommitSynchronizedTransactions:0];
    [(FBUpdateSceneTransaction *)self _performCommit];
    [v3 synchronizedTransaction:self didCommitSynchronizedTransactions:0];
    [(FBUpdateSceneTransaction *)self satisfyMilestone:@"synchronizedCommit"];
  }
}

- (BOOL)isReadyForSynchronizedCommit
{
  return !self->_didCommit && self->_readyToCommit;
}

- (void)_performCommit
{
  id v3 = [(FBUpdateSceneTransaction *)self scene];

  if (v3)
  {
    [(FBUpdateSceneTransaction *)self _updateScene];
  }
  else
  {
    [(FBUpdateSceneTransaction *)self _createScene];
  }
}

- (void)_begin
{
  id v3 = [(FBUpdateSceneTransaction *)self scene];
  objc_super v4 = [v3 clientProcess];
  int v5 = v4;
  if (v3 && [v4 isPendingExit])
  {
    if ([(FBUpdateSceneTransaction *)self isAuditHistoryEnabled]) { {
      [(FBUpdateSceneTransaction *)self _addAuditHistoryItem:@"Scene exists but is invalidated. Waiting for it to be destroyed..."];
    }
    }
    int v6 = [[FBWaitForSceneDestructionTransaction alloc] initWithScene:v3];
    destructionTransaction = self->_destructionTransaction;
    self->_destructionTransaction = v6;

    [(FBUpdateSceneTransaction *)self addChildTransaction:self->_destructionTransaction];
  }
  else
  {
    [(FBUpdateSceneTransaction *)self _commitSceneOrWait];
  }
  v8.receiver = self;
  v8.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v8 _begin];
}

- (void)_commitSceneOrWait
{
  self->_readyToCommit = 1;
  [(FBUpdateSceneTransaction *)self addMilestone:@"synchronizedCommit"];
  id v3 = [(FBUpdateSceneTransaction *)self synchronizationDelegate];
  id v4 = v3;
  if (v3) { {
    [v3 synchronizedTransactionReadyToCommit:self];
  }
  }
  else {
    [(FBUpdateSceneTransaction *)self performSynchronizedCommit];
  }
}

- (FBSynchronizedTransactionDelegate)synchronizationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_synchronizationDelegate);

  return (FBSynchronizedTransactionDelegate *)WeakRetained;
}

void __43__FBUpdateSceneTransaction__noteWillCommit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 updateSceneTransactionWillCommitUpdate:*(void *)(a1 + 32)];
  }
  }
}

void __43__FBUpdateSceneTransaction__noteDidCommit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 updateSceneTransactionDidCommitUpdate:*(void *)(a1 + 32)];
  }
  }
}

void __42__FBUpdateSceneTransaction__noteDidCreate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 updateSceneTransactionDidCreateScene:*(void *)(a1 + 32)];
  }
  }
}

- (void)_commitSceneUpdate:(id)a3
{
  id v11 = (void (**)(void))a3;
  if (self->_waitsForSceneCommit) { {
    [(FBUpdateSceneTransaction *)self addMilestone:@"sceneUpdateDidCommit"];
  }
  }
  id v4 = [(FBUpdateSceneTransaction *)self settings];
  if ([v4 isForeground]
    && [(FBSSceneTransitionContext *)self->_transitionContext _uikitShimming_isUISubclass])
  {
    BOOL waitsForSceneCommit = self->_waitsForSceneCommit;

    if (!waitsForSceneCommit) { {
      goto LABEL_12;
    }
    }
    id v4 = [(FBSSceneTransitionContext *)self->_transitionContext watchdogTransitionContext];
    unint64_t v6 = [v4 watchdogBehavior];
    if (v6 <= 1) { {
      unint64_t v7 = 1;
    }
    }
    else {
      unint64_t v7 = v6;
    }
    [v4 setWatchdogBehavior:v7];
    if ([(FBUpdateSceneTransaction *)self isAuditHistoryEnabled])
    {
      objc_super v8 = NSStringFromFBWatchdogBehavior(v7);
      [(FBUpdateSceneTransaction *)self _addAuditHistoryItem:@"Updating scene with watchdog policy: %@", v8];
    }
  }

LABEL_12:
  v11[2]();
  id v9 = [(FBUpdateSceneTransaction *)self scene];
  [v9 addObserver:self];

  id v10 = [(FBSSceneTransitionContext *)self->_transitionContext animationFence];
  [v10 invalidate];
}

uint64_t __40__FBUpdateSceneTransaction__createScene__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 168);
  int v5 = [*(id *)(v2 + 176) settings];
  unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 176) clientSettings];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 184);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__FBUpdateSceneTransaction__createScene__block_invoke_2;
  v12[3] = &unk_1E5C4ACF0;
  v12[4] = v8;
  id v10 = (id)[v3 _createSceneWithDefinition:v4 settings:v5 initialClientSettings:v6 transitionContext:v9 fromRemnant:0 usingClientProvider:v7 completion:v12];

  [*(id *)(a1 + 32) _noteDidCreate];
  return [*(id *)(a1 + 32) _noteWillCommit];
}

- (FBSSceneSettings)settings
{
  return (FBSSceneSettings *)[(FBSSceneParameters *)self->_parameters settings];
}

- (void)_noteWillCommit
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__FBUpdateSceneTransaction__noteWillCommit__block_invoke;
  v2[3] = &unk_1E5C4AD18;
  v2[4] = self;
  [(FBUpdateSceneTransaction *)self _enumerateObserversWithBlock:v2];
}

- (void)_noteDidCreate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__FBUpdateSceneTransaction__noteDidCreate__block_invoke;
  v2[3] = &unk_1E5C4AD18;
  v2[4] = self;
  [(FBUpdateSceneTransaction *)self _enumerateObserversWithBlock:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)dealloc
{
  id v3 = self->_sceneID;
  uint64_t v4 = self->_sceneManager;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __35__FBUpdateSceneTransaction_dealloc__block_invoke;
  id v11 = &unk_1E5C4ACC8;
  id v12 = v4;
  id v13 = v3;
  id v14 = self;
  int v5 = v3;
  unint64_t v6 = v4;
  BSDispatchMain();

  v7.receiver = self;
  v7.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v7 dealloc];
}

- (FBUpdateSceneTransaction)initWithSceneIdentifier:(id)a3 process:(id)a4 parameters:(id)a5 transitionContext:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F629B0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 definition];
  uint64_t v16 = [MEMORY[0x1E4F62A60] identityForIdentifier:v14];

  [v15 setIdentity:v16];
  v17 = FBSSceneClientIdentity;
  v18 = [v13 identity];

  v19 = [v17 identityForProcessIdentity:v18];
  [v15 setClientIdentity:v19];

  uint64_t v20 = [v12 specification];
  [v15 setSpecification:v20];

  v21 = [(FBUpdateSceneTransaction *)self _initWithSceneDefinition:v15 parameters:v12 transitionContext:v11];
  return v21;
}

- (FBUpdateSceneTransaction)initWithSceneToUpdate:(id)a3 newSettings:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sceneID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:]();
    }
    }
LABEL_13:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63511E0);
  }
  if (!v9)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"newSettings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:]();
    }
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6351244);
  }
  id v11 = v10;
  id v12 = +[FBSceneManager sharedInstance];
  id v13 = [v12 sceneWithIdentifier:v8];

  if (!-[FBScene _isLegacy]((BOOL)v13))
  {
    v18 = [NSString stringWithFormat:@"this transaction only supports legacy scenes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBUpdateSceneTransaction initWithSceneToUpdate:newSettings:transitionContext:]();
    }
    }
    goto LABEL_13;
  }
  id v14 = [v13 parameters];
  [v14 setSettings:v9];
  id v15 = [v13 definition];
  uint64_t v16 = [(FBUpdateSceneTransaction *)self _initWithSceneDefinition:v15 parameters:v14 transitionContext:v11];

  return v16;
}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)[(FBSSceneParameters *)self->_parameters specification];
}

- (void)add:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v3 addObserver:a3];
}

- (void)remove:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v3 removeObserver:a3];
}

- (void)_updateScene
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __40__FBUpdateSceneTransaction__updateScene__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) scene];
  objc_super v3 = [*(id *)(a1 + 32) settings];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 184);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FBUpdateSceneTransaction__updateScene__block_invoke_2;
  v7[3] = &unk_1E5C49778;
  v7[4] = v4;
  [v2 updateSettings:v3 withTransitionContext:v5 completion:v7];

  return [*(id *)(a1 + 32) _noteWillCommit];
}

uint64_t __40__FBUpdateSceneTransaction__updateScene__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _noteDidCommit:a2];
}

- (void)_childTransactionDidComplete:(id)a3
{
  uint64_t v4 = (FBWaitForSceneDestructionTransaction *)a3;
  uint64_t v5 = v4;
  if (self->_destructionTransaction == v4)
  {
    if (([(FBWaitForSceneDestructionTransaction *)v4 isFailed] & 1) == 0
      && ([(FBWaitForSceneDestructionTransaction *)v5 isInterrupted] & 1) == 0)
    {
      if ([(FBUpdateSceneTransaction *)self isAuditHistoryEnabled]) { {
        [(FBUpdateSceneTransaction *)self _addAuditHistoryItem:@"Invalidated scene was destroyed."];
      }
      }
      [(FBUpdateSceneTransaction *)self _commitSceneOrWait];
    }
    destructionTransaction = self->_destructionTransaction;
    self->_destructionTransaction = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)FBUpdateSceneTransaction;
  [(FBUpdateSceneTransaction *)&v7 _childTransactionDidComplete:v5];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_customizedDescriptionProperties
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = v3;
  if (self->_sceneID) { {
    sceneID = (__CFString *)self->_sceneID;
  }
  }
  else {
    sceneID = @"(none)";
  }
  [v3 setObject:sceneID forKey:@"SceneID"];
  uint64_t v6 = [(FBUpdateSceneTransaction *)self settings];

  if (v6)
  {
    objc_super v7 = [(FBUpdateSceneTransaction *)self settings];
    if ([v7 isForeground]) { {
      uint64_t v8 = @"Foreground";
    }
    }
    else {
      uint64_t v8 = @"Background";
    }
    [v4 setObject:v8 forKey:@"Scene Visibility"];
  }
  uint8_t v9 = NSStringFromBOOL();
  [v4 setObject:v9 forKey:@"Wait for Commit"];

  return v4;
}

- (void)_noteWillUpdate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__FBUpdateSceneTransaction__noteWillUpdate__block_invoke;
  v2[3] = &unk_1E5C4AD18;
  v2[4] = self;
  [(FBUpdateSceneTransaction *)self _enumerateObserversWithBlock:v2];
}

void __43__FBUpdateSceneTransaction__noteWillUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) { {
    [v3 updateSceneTransactionWillUpdateScene:*(void *)(a1 + 32)];
  }
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self];
  self->_destroyed = 1;
  id v5 = [NSString stringWithFormat:@"Scene destroyed: %@", v4];

  [(FBUpdateSceneTransaction *)self _failWithReason:@"scene update failed" description:v5];
}

- (NSString)sceneIdentifier
{
  return self->_sceneID;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (BOOL)waitsForSceneCommit
{
  return self->_waitsForSceneCommit;
}

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithSceneDefinition:(const char *)a1 parameters:transitionContext:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithSceneDefinition:parameters:transitionContext:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSceneToUpdate:newSettings:transitionContext:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end