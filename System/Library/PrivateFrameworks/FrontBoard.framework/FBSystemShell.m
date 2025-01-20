@interface FBSystemShell
+ (id)_createSingletonWithOptions:(id)a3;
+ (id)sharedInstance;
- (FBSystemShellInitializationContext)initializationContext;
- (NSString)description;
- (id)_initWithOptions:(id)a3;
- (id)assertWatchdogEnabledForLimitedDurationForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_state;
- (void)_addBlockToExecuteWhenReady:(id)a3;
- (void)_informSystemShellServiceDidFinishLaunching;
- (void)_initializationComplete;
- (void)_setState:(unint64_t)a3;
- (void)_setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_startSystemShellService;
- (void)readyForInteraction;
- (void)sendActionsToBackBoard:(id)a3;
@end

@implementation FBSystemShell

- (id)_initWithOptions:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)FBSystemShell;
  v5 = [(FBSystemShell *)&v46 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    lock_preventIdleSleepReasons = v6->_lock_preventIdleSleepReasons;
    v6->_lock_preventIdleSleepReasons = (NSMutableSet *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_blocksToRunWhenReady = v6->_lock_blocksToRunWhenReady;
    v6->_lock_blocksToRunWhenReady = v9;

    v11 = [FBSystemShellInitializationContext alloc];
    v12 = (void *)[v4 copy];
    uint64_t v13 = [(FBSystemShellInitializationContext *)v11 _initWithOptions:v12];
    initializationContext = v6->_initializationContext;
    v6->_initializationContext = (FBSystemShellInitializationContext *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = [MEMORY[0x1E4F28F08] mainQueue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __34__FBSystemShell__initWithOptions___block_invoke;
    v44[3] = &unk_1E5C49A68;
    v17 = v6;
    v45 = v17;
    uint64_t v18 = [v15 addObserverForName:@"FBSystemShellReadyNotification" object:0 queue:v16 usingBlock:v44];
    id observerToken = v17->_observerToken;
    v17->_id observerToken = (id)v18;

    [(FBSystemShell *)v17 _setSystemIdleSleepDisabled:1 forReason:@"FBSystemShellStartup"];
    v20 = FBLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A62FC000, v20, OS_LOG_TYPE_INFO, "Taking out the system app's process assertion.", buf, 2u);
    }

    kdebug_trace();
    id v21 = objc_alloc(MEMORY[0x1E4F96318]);
    v22 = [MEMORY[0x1E4F96478] currentProcess];
    v23 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"SystemShell"];
    v47[0] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    uint64_t v25 = [v21 initWithExplanation:@"FBSystemShell" target:v22 attributes:v24];
    runningAssertion = v17->_runningAssertion;
    v17->_runningAssertion = (RBSAssertion *)v25;

    [(RBSAssertion *)v17->_runningAssertion acquireWithError:0];
    kdebug_trace();
    kdebug_trace();
    id v27 = objc_alloc(MEMORY[0x1E4F4F3B8]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__FBSystemShell__initWithOptions___block_invoke_36;
    v42[3] = &unk_1E5C49A90;
    id v28 = v4;
    id v43 = v28;
    uint64_t v29 = [v27 initWithConfigurator:v42];
    systemShellService = v17->_systemShellService;
    v17->_systemShellService = (BKSSystemShellService *)v29;

    kdebug_trace();
    *(void *)buf = 0;
    v37 = buf;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v31 = v17;
    v41 = v31;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __34__FBSystemShell__initWithOptions___block_invoke_38;
    v33[3] = &unk_1E5C49AB8;
    id v34 = v28;
    v35 = buf;
    [(FBSystemShell *)v31 _addBlockToExecuteWhenReady:v33];

    _Block_object_dispose(buf, 8);
  }

  return v6;
}

uint64_t __34__FBSystemShell__initWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readyForInteraction];
}

void __34__FBSystemShell__initWithOptions___block_invoke_36(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setWaitForDataMigration:", objc_msgSend(*(id *)(a1 + 32), "shouldWaitForMigrator"));
  [*(id *)(a1 + 32) systemSleepInterval];
  objc_msgSend(v4, "setIdleSleepInterval:");
  v3 = [*(id *)(a1 + 32) independentWatchdogPortName];

  if (v3) { {
    [v4 setCollectiveWatchdogPingBlock:0];
  }
  }
}

void __34__FBSystemShell__initWithOptions___block_invoke_38(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) independentWatchdogPortName];
  id v6 = v2;
  if (v2)
  {
    [v2 UTF8String];
    wd_endpoint_register();
    wd_endpoint_add_queue();
    v3 = +[FBSystemService sharedInstanceIfExists];
    id v4 = [v3 _applicationInfoProvider];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 _synchronizationQueue];
      if (v5) { {
        wd_endpoint_add_queue();
      }
      }
    }
    wd_endpoint_activate();
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setSystemIdleSleepDisabled:0 forReason:@"FBSystemShellStartup"];
}

+ (id)_createSingletonWithOptions:(id)a3
{
  id v3 = a3;
  if (__instance)
  {
    v8 = [NSString stringWithFormat:@"Cannot create multiple FBSystemShell instances."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSystemShell _createSingletonWithOptions:]();
    }
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6333640);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FBSystemShell__createSingletonWithOptions___block_invoke;
  block[3] = &unk_1E5C49AE0;
  id v10 = v3;
  uint64_t v4 = _createSingletonWithOptions__onceToken;
  id v5 = v3;
  if (v4 != -1) { {
    dispatch_once(&_createSingletonWithOptions__onceToken, block);
  }
  }
  id v6 = (id)__instance;

  return v6;
}

void __45__FBSystemShell__createSingletonWithOptions___block_invoke(uint64_t a1)
{
  id v1 = [[FBSystemShell alloc] _initWithOptions:*(void *)(a1 + 32)];
  v2 = (void *)__instance;
  __instance = (uint64_t)v1;
}

+ (id)sharedInstance
{
  return (id)__instance;
}

- (void)readyForInteraction
{
}

- (void)sendActionsToBackBoard:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          systemShellService = self->_systemShellService;
          id v11 = v9;
          -[BKSSystemShellService restartWithOptions:](systemShellService, "restartWithOptions:", [v11 options]);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)assertWatchdogEnabledForLimitedDurationForReason:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_temporaryWatchdogAssertion)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (void *)MEMORY[0x1E4F62808];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__FBSystemShell_assertWatchdogEnabledForLimitedDurationForReason___block_invoke;
    v10[3] = &unk_1E5C49B08;
    objc_copyWeak(&v11, &location);
    uint64_t v6 = [v5 assertionWithIdentifier:@"FBSystemShell temporary watchdog" stateDidChangeHandler:v10];
    lock_temporaryWatchdogAssertion = self->_lock_temporaryWatchdogAssertion;
    self->_lock_temporaryWatchdogAssertion = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v8 = [(BSCompoundAssertion *)self->_lock_temporaryWatchdogAssertion acquireForReason:v4];

  return v8;
}

void __66__FBSystemShell_assertWatchdogEnabledForLimitedDurationForReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) { {
    objc_msgSend(WeakRetained[5], "setIndependentWatchdogEnabled:", objc_msgSend(v5, "isActive"));
  }
  }
}

- (void)_initializationComplete
{
}

- (void)_addBlockToExecuteWhenReady:(id)a3
{
  uint64_t v7 = (void (**)(void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_blocksToRunWhenReady = self->_lock_blocksToRunWhenReady;
  if (lock_blocksToRunWhenReady)
  {
    uint64_t v6 = (void *)MEMORY[0x1AD0B8C50](v7);
    [(NSMutableArray *)lock_blocksToRunWhenReady addObject:v6];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v7[2]();
  }
}

- (void)_startSystemShellService
{
}

- (void)_informSystemShellServiceDidFinishLaunching
{
}

- (NSString)description
{
  return (NSString *)[(FBSystemShell *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSystemShell *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = NSStringFromFBSystemShellState(self->_state);
  id v5 = (id)[v3 appendObject:v4 withName:@"state"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSystemShell *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(FBSystemShell *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_initializationContext withName:@"initializationContext" skipIfNil:1];

  return v4;
}

- (void)_setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSMutableSet *)a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemShell _setSystemIdleSleepDisabled:forReason:]();
    }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6333F88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemShell _setSystemIdleSleepDisabled:forReason:]();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6333FECLL);
  }

  os_unfair_lock_lock(&self->_lock);
  int v7 = [(NSMutableSet *)self->_lock_preventIdleSleepReasons containsObject:v6];
  if (v4)
  {
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = FBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v6;
        _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_INFO, "Preventing system idle sleep for reason: %{public}@", buf, 0xCu);
      }

      [(NSMutableSet *)self->_lock_preventIdleSleepReasons addObject:v6];
    }
  }
  else if (v7)
  {
    v9 = FBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v6;
      _os_log_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_INFO, "Allowing system idle sleep for reason: %{public}@", buf, 0xCu);
    }

    [(NSMutableSet *)self->_lock_preventIdleSleepReasons removeObject:v6];
  }
  id v10 = FBLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ([(NSMutableSet *)self->_lock_preventIdleSleepReasons count]) { {
      lock_preventIdleSleepReasons = self->_lock_preventIdleSleepReasons;
    }
    }
    else {
      lock_preventIdleSleepReasons = (NSMutableSet *)@"(none)";
    }
    *(_DWORD *)buf = 138543362;
    id v27 = lock_preventIdleSleepReasons;
    _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "Prevent idle sleep reasons: %{public}@", buf, 0xCu);
  }

  uint64_t v12 = [(NSMutableSet *)self->_lock_preventIdleSleepReasons count];
  lock_preventSleepAssertion = self->_lock_preventSleepAssertion;
  if (v12)
  {
    if (!lock_preventSleepAssertion)
    {
      long long v14 = FBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_DEFAULT, "Now preventing system idle sleep.", buf, 2u);
      }

      id v15 = objc_alloc(MEMORY[0x1E4F96318]);
      v16 = [MEMORY[0x1E4F96478] currentProcess];
      uint64_t v17 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"SystemShell-PreventIdleSleep"];
      uint64_t v25 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v19 = (RBSAssertion *)[v15 initWithExplanation:@"FBSystemApp-PreventIdleSleep" target:v16 attributes:v18];
      v20 = self->_lock_preventSleepAssertion;
      self->_lock_preventSleepAssertion = v19;

      [(RBSAssertion *)self->_lock_preventSleepAssertion acquireWithError:0];
    }
  }
  else if (lock_preventSleepAssertion)
  {
    id v21 = FBLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A62FC000, v21, OS_LOG_TYPE_DEFAULT, "Now allowing system idle sleep.", buf, 2u);
    }

    [(RBSAssertion *)self->_lock_preventSleepAssertion invalidate];
    v22 = self->_lock_preventSleepAssertion;
    self->_lock_preventSleepAssertion = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setState:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state == a3) { {
    return;
  }
  }
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      if (state == 1)
      {
        self->_unint64_t state = 2;
        os_unfair_lock_lock(&self->_lock);
        id v5 = (void *)[(NSMutableArray *)self->_lock_blocksToRunWhenReady copy];
        lock_blocksToRunWhenReady = self->_lock_blocksToRunWhenReady;
        self->_lock_blocksToRunWhenReady = 0;

        os_unfair_lock_unlock(&self->_lock);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v15 != v10) { {
                objc_enumerationMutation(v7);
              }
              }
              (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v9);
        }

        return;
      uint64_t v12 = };
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSystemShell _setState:]();
      }
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithFormat:@"Cannot set to state: uninitialized."];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSystemShell _setState:]();
      }
      }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63341A8);
  }
  if (state) { {
    long long v13 = {;
  }
  }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemShell _setState:]();
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6334200);
  }
  self->_unint64_t state = 1;
}

- (FBSystemShellInitializationContext)initializationContext
{
  return self->_initializationContext;
}

- (unint64_t)_state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationContext, 0);
}

+ (void)_createSingletonWithOptions:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setSystemIdleSleepDisabled:forReason:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setState:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setState:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setState:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end