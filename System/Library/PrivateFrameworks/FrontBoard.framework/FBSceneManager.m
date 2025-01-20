@interface FBSceneManager
+ (FBSceneManager)sharedInstance;
+ (id)keyboardScene;
+ (id)observeKeyboardSceneAvailability:(id)a3;
+ (void)_clearKeyboardScene;
+ (void)setKeyboardScene:(id)a3;
+ (void)synchronizeChanges:(id)a3;
- (BOOL)_isSynchronizingSceneUpdates;
- (BOOL)_suppressConnectionHandshakes;
- (FBSceneManager)init;
- (FBSceneManagerDelegate)delegate;
- (id)_createSceneWithDefinition:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 transitionContext:(id)a6 fromRemnant:(id)a7 usingClientProvider:(id)a8 completion:(id)a9;
- (id)createLegacySceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5;
- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5;
- (id)createSceneWithDefinition:(id)a3;
- (id)createSceneWithDefinition:(id)a3 initialParameters:(id)a4;
- (id)createSceneWithIdentifier:(id)a3 parameters:(id)a4 clientProvider:(id)a5 transitionContext:(id)a6;
- (id)createSceneWithIdentifier:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 clientProvider:(id)a6 transitionContext:(id)a7;
- (id)debugDescription;
- (id)description;
- (id)newSceneIdentityTokenForIdentity:(id)a3;
- (id)sceneFromIdentityToken:(id)a3;
- (id)sceneFromIdentityTokenStringRepresentation:(id)a3;
- (id)sceneWithIdentifier:(id)a3;
- (id)scenesPassingTest:(id)a3;
- (void)_setSuppressConnectionHandshakes:(BOOL)a3;
- (void)add:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)destroyScene:(id)a3 withTransitionContext:(id)a4;
- (void)enumerateScenesWithBlock:(id)a3;
- (void)remove:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FBSceneManager

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__FBSceneManager_sceneFromIdentityTokenStringRepresentation___block_invoke;
    v10[3] = &unk_1E5C4B290;
    id v6 = v5;
    id v11 = v6;
    v12 = &v13;
    [(FBSceneManager *)self enumerateScenesWithBlock:v10];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    return v7;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"tokenString"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager sceneFromIdentityTokenStringRepresentation:](a2);
    }
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)enumerateScenesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(FBSceneWorkspace *)self->_workspace allScenes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) { {
        objc_enumerationMutation(v5);
      }
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) { {
        break;
      }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) { {
          goto LABEL_3;
        }
        }
        break;
      }
    }
  }
}

void __61__FBSceneManager_sceneFromIdentityTokenStringRepresentation___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  uint64_t v6 = [v9 identityToken];
  uint64_t v7 = [v6 stringRepresentation];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)sceneWithIdentifier:(id)a3
{
  return [(FBSceneWorkspace *)self->_workspace sceneWithIdentifier:a3];
}

+ (void)synchronizeChanges:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  -[FBSceneWorkspace _synchronizeChanges:](v5[1], v4);
}

+ (FBSceneManager)sharedInstance
{
  if (sharedInstance___once_0 != -1) { {
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_19);
  }
  }
  v2 = (void *)sharedInstance___instance_2;

  return (FBSceneManager *)v2;
}

- (void)addObserver:(id)a3
{
}

- (id)newSceneIdentityTokenForIdentity:(id)a3
{
  workspace = self->_workspace;
  id v4 = [a3 identifier];
  id v5 = [(FBSceneWorkspace *)workspace sceneIdentityTokenForIdentifier:v4];

  return v5;
}

- (id)_createSceneWithDefinition:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 transitionContext:(id)a6 fromRemnant:(id)a7 usingClientProvider:(id)a8 completion:(id)a9
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self->_workspace, a3, a4, a5, a6, a7, a8, a9);
}

+ (id)keyboardScene
{
  v2 = (void *)__fbKeyboardScene;

  return v2;
}

+ (void)_clearKeyboardScene
{
  v2 = (void *)__fbKeyboardScene;
  __fbKeyboardScene = 0;
}

+ (void)setKeyboardScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (__fbKeyboardScene)
  {
    long long v15 = [NSString stringWithFormat:@"Cannot set a keyboard scene twice."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneManager(Keyboard) setKeyboardScene:](a2);
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6336FF8);
  }
  uint64_t v6 = v5;
  if (!v5)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"keyboardScene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneManager(Keyboard) setKeyboardScene:](a2);
    }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A633705CLL);
  }
  BSDispatchQueueAssertMain();
  if (!__fbKeyboardScene)
  {
    objc_storeStrong((id *)&__fbKeyboardScene, a3);
    uint64_t v7 = (void *)[(id)__availabilityObserverMap copy];
    [(id)__availabilityObserverMap removeAllObjects];
    int v8 = (void *)__availabilityObserverMap;
    __availabilityObserverMap = 0;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = [v7 keyEnumerator];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) { {
            objc_enumerationMutation(v9);
          }
          }
          long long v14 = [v7 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          v14[2](v14, __fbKeyboardScene);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

+ (id)observeKeyboardSceneAvailability:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    id v5 = v4;
    BSDispatchQueueAssertMain();
    if (__fbKeyboardScene)
    {
      v5[2](v5);
      uint64_t v6 = 0;
    }
    else
    {
      if (!__availabilityObserverMap)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:1];
        int v8 = (void *)__availabilityObserverMap;
        __availabilityObserverMap = v7;
      }
      id v9 = objc_alloc(MEMORY[0x1E4F628C0]);
      uint64_t v6 = (void *)[v9 initWithIdentifier:@"keyboardAvailableObserverToken" forReason:@"observation" queue:MEMORY[0x1E4F14428] invalidationBlock:&__block_literal_global_5];
      uint64_t v10 = (void *)__availabilityObserverMap;
      uint64_t v11 = (void *)MEMORY[0x1AD0B8C50](v5);
      [v10 setObject:v11 forKey:v6];
    }
    return v6;
  }
  else
  {
    long long v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneManager(Keyboard) observeKeyboardSceneAvailability:](a2);
    }
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

uint64_t __61__FBSceneManager_Keyboard__observeKeyboardSceneAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  return [(id)__availabilityObserverMap removeObjectForKey:a2];
}

void __32__FBSceneManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FBSceneManager);
  v1 = (void *)sharedInstance___instance_2;
  sharedInstance___instance_2 = (uint64_t)v0;
}

- (FBSceneManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FBSceneManager;
  v2 = [(FBSceneManager *)&v6 init];
  if (v2)
  {
    v3 = (FBSceneWorkspace *)-[FBSceneWorkspace _initWithLegacySceneManager:]([FBSceneWorkspace alloc], v2);
    workspace = v2->_workspace;
    v2->_workspace = v3;
  }
  return v2;
}

- (void)dealloc
{
  id v4 = [NSString stringWithFormat:@"FBSceneManager should not deallocate"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    objc_super v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    long long v13 = self;
    __int16 v14 = 2114;
    long long v15 = @"FBSceneManager.m";
    __int16 v16 = 1024;
    int v17 = 46;
    __int16 v18 = 2114;
    long long v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (FBSceneManagerDelegate)delegate
{
  return [(FBSceneWorkspace *)self->_workspace delegate];
}

- (void)setDelegate:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)add:(id)a3
{
}

- (void)remove:(id)a3
{
}

- (id)scenesPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__FBSceneManager_scenesPassingTest___block_invoke;
    v7[3] = &unk_1E5C4B268;
    id v9 = v4;
    id v8 = v5;
    [(FBSceneManager *)self enumerateScenesWithBlock:v7];
  }

  return v5;
}

void __36__FBSceneManager_scenesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) { {
    [*(id *)(a1 + 32) addObject:v3];
  }
  }
}

- (id)sceneFromIdentityToken:(id)a3
{
  return [(FBSceneWorkspace *)self->_workspace sceneWithIdentityToken:a3];
}

- (id)createSceneWithDefinition:(id)a3
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self->_workspace, a3, 0, 0, 0, 0, 0, 0);
}

- (id)createSceneWithDefinition:(id)a3 initialParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 clientIdentity];
  if (([v8 isLocal] & 1) != 0
    || ([MEMORY[0x1E4F96408] identityOfCurrentProcess],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqual:v8],
        v9,
        v10))
  {
    uint64_t v11 = +[FBLocalSynchronousSceneClientProvider sharedInstance];
    if (v11)
    {
LABEL_4:
      __int16 v12 = [v7 settings];
      long long v13 = [v7 clientSettings];
      __int16 v14 = [(FBSceneManager *)self _createSceneWithDefinition:v6 settings:v12 initialClientSettings:v13 transitionContext:0 fromRemnant:0 usingClientProvider:v11 completion:0];

      goto LABEL_9;
    }
  }
  else
  {
    long long v15 = +[FBProcessManager sharedInstance];
    __int16 v16 = [v8 processIdentity];
    int v17 = [v15 processForIdentity:v16];
    uint64_t v11 = [v17 workspace];

    if (v11) { {
      goto LABEL_4;
    }
    }
  }
  __int16 v18 = FBLogScene();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) { {
    -[FBSceneManager createSceneWithDefinition:initialParameters:](v6, v8, v18);
  }
  }

  __int16 v14 = 0;
LABEL_9:

  return v14;
}

- (id)createSceneWithIdentifier:(id)a3 parameters:(id)a4 clientProvider:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  if (!v14)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:]();
    }
    }
LABEL_14:
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6358CA4);
  }
  long long v15 = v14;
  if (([v14 conformsToProtocol:&unk_1EFB30128] & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSceneClientProvider)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:]();
    }
    }
    goto LABEL_14;
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v17 = FBSSceneClientIdentity;
  if (isKindOfClass)
  {
    __int16 v18 = [v15 process];
    long long v19 = [v18 identity];
    long long v20 = [v17 identityForProcessIdentity:v19];
  }
  else
  {
    long long v20 = [FBSSceneClientIdentity localIdentity];
  }
  v21 = [MEMORY[0x1E4F629B0] definition];
  uint64_t v22 = [MEMORY[0x1E4F62A60] identityForIdentifier:v10];
  [v21 setIdentity:v22];

  [v21 setClientIdentity:v20];
  v23 = [v11 specification];
  [v21 setSpecification:v23];

  v24 = [v11 settings];
  v25 = [v11 clientSettings];
  v26 = [(FBSceneManager *)self _createSceneWithDefinition:v21 settings:v24 initialClientSettings:v25 transitionContext:v13 fromRemnant:0 usingClientProvider:v15 completion:0];

  return v26;
}

- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  return [(FBSceneWorkspace *)self->_workspace createSceneFromRemnant:a3 withSettings:a4 transitionContext:a5];
}

- (id)createLegacySceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Fbsceneremnant.isa);
  if (!v11)
  {
    long long v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:]();
    }
    }
LABEL_20:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6358ED0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:]();
    }
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6358F34);
  }

  if ([v11 _hasBeenInvalidated])
  {
    long long v19 = [NSString stringWithFormat:@"cannot create a scene from an invalidated remnant"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createLegacySceneFromRemnant:withSettings:transitionContext:]();
    }
    }
    goto LABEL_20;
  }
  id v12 = [v11 _workspace];
  if (v12)
  {
    id v13 = [v11 _assertion];
    int v14 = [v13 isValid];

    if (v14)
    {
      long long v15 = [v11 definition];
      __int16 v16 = [v11 _clientSettings];
      int v17 = [(FBSceneManager *)self _createSceneWithDefinition:v15 settings:v9 initialClientSettings:v16 transitionContext:v10 fromRemnant:v11 usingClientProvider:v12 completion:0];

      if ([v17 isValid]) { {
        goto LABEL_9;
      }
      }
    }
  }
  int v17 = 0;
LABEL_9:

  return v17;
}

- (id)createSceneWithIdentifier:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 clientProvider:(id)a6 transitionContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    int v17 = v16;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v19 = FBSSceneClientIdentity;
    if (isKindOfClass)
    {
      long long v20 = [v15 process];
      v21 = [v20 identity];
      uint64_t v22 = [v19 identityForProcessIdentity:v21];
    }
    else
    {
      uint64_t v22 = [FBSSceneClientIdentity localIdentity];
    }
    v23 = objc_msgSend(v13, "fb_fallbackSpecification");
    v24 = [MEMORY[0x1E4F629B0] definition];
    v25 = [MEMORY[0x1E4F62A60] identityForIdentifier:v12];
    [v24 setIdentity:v25];

    [v24 setClientIdentity:v22];
    [v24 setSpecification:v23];
    v26 = [(FBSceneManager *)self _createSceneWithDefinition:v24 settings:v13 initialClientSettings:v14 transitionContext:v17 fromRemnant:0 usingClientProvider:v15 completion:0];

    return v26;
  }
  else
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clientProvider != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager createSceneWithIdentifier:settings:initialClientSettings:clientProvider:transitionContext:]();
    }
    }
    [v28 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)destroyScene:(id)a3 withTransitionContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneManager destroyScene:withTransitionContext:]");
  }
  }
  if (!v10)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sceneIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager destroyScene:withTransitionContext:]();
    }
    }
LABEL_15:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63592C8);
  }
  uint64_t v7 = -[FBSceneManager sceneWithIdentifier:](self, "sceneWithIdentifier:");
  id v8 = (void *)v7;
  if (!v7) { {
    goto LABEL_7;
  }
  }
  if (!-[FBScene _isLegacy](v7))
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[scene _isLegacy]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneManager destroyScene:withTransitionContext:]();
    }
    }
    goto LABEL_15;
  }
  [v8 deactivateWithTransitionContext:v6];
LABEL_7:
}

- (BOOL)_suppressConnectionHandshakes
{
  return -[FBSceneWorkspace _suppressConnectionHandshakes]((BOOL)self->_workspace);
}

- (void)_setSuppressConnectionHandshakes:(BOOL)a3
{
}

- (BOOL)_isSynchronizingSceneUpdates
{
  return -[FBSceneWorkspace _isSynchronizingSceneUpdates]((BOOL)self->_workspace);
}

- (id)description
{
  return [(FBSceneWorkspace *)self->_workspace description];
}

- (id)debugDescription
{
  return [(FBSceneWorkspace *)self->_workspace descriptionWithMultilinePrefix:0];
}

- (void).cxx_destruct
{
}

- (void)sceneFromIdentityTokenStringRepresentation:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)createSceneWithDefinition:(NSObject *)a3 initialParameters:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 identity];
  uint64_t v6 = [a2 processIdentity];
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "scene %{public}@ cannot be created because there is no running process for %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)createSceneWithIdentifier:parameters:clientProvider:transitionContext:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createLegacySceneFromRemnant:withSettings:transitionContext:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createLegacySceneFromRemnant:withSettings:transitionContext:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createSceneWithIdentifier:settings:initialClientSettings:clientProvider:transitionContext:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)destroyScene:withTransitionContext:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)destroyScene:withTransitionContext:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end