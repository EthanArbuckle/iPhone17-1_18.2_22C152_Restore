@interface FBLocalSynchronousSceneClientProvider
+ (id)sharedInstance;
- (BOOL)canHaveAgent;
- (FBLocalSynchronousSceneClientProvider)init;
- (NSCopying)identifier;
- (id)_init;
- (id)callOutQueue;
- (id)createSceneFutureWithDefinition:(id)a3 completion:(id)a4;
- (id)fbsSceneForScene:(id)a3;
- (id)fbsSceneWithIdentifier:(id)a3;
- (id)hostProcess;
- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7;
- (id)sceneWithIdentity:(id)a3;
- (id)scenes;
- (void)_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:(id)a3;
- (void)dealloc;
- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5;
- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7;
- (void)requestSceneWithOptions:(id)a3 completion:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5;
- (void)unregisterHost:(id)a3;
@end

@implementation FBLocalSynchronousSceneClientProvider

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  id v17 = a3;
  v10 = (void *)MEMORY[0x1E4F29060];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  if (([v10 isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider scene:didUpdateClientSettings:withDiff:transitionContext:]");
  }
  }
  hostsByIdentity = self->_hostsByIdentity;
  v15 = [v17 identity];
  v16 = [(NSMutableDictionary *)hostsByIdentity objectForKey:v15];
  [v16 clientToken:self didUpdateClientSettings:v13 withDiff:v12 transitionContext:v11];
}

- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didUpdateSettings:withDiff:transitionContext:completion:]");
  }
  }
  v18 = [v13 definition];
  v19 = [v18 identity];

  v20 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v19];
  v21 = [v20 FBSScene];
  if (!v21)
  {
    v22 = [NSString stringWithFormat:@"Scene info for %@ was expected, but not found.", v19];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider host:didUpdateSettings:withDiff:transitionContext:completion:](a2);
    }
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631695CLL);
  }
  if ([v20 hasHandledSceneCreate])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_109;
    v30[3] = &unk_1E5C4B330;
    id v31 = v17;
    [v21 updater:self didUpdateSettings:v14 withDiff:v15 transitionContext:v16 completion:v30];
  }
  else
  {
    [v20 setHasHandledSceneCreate:1];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
    v32[3] = &unk_1E5C4A420;
    v36 = &v37;
    id v33 = v20;
    id v34 = v16;
    v35 = self;
    objc_msgSend(v21, "_callOutQueue_didCreateWithTransitionContext:alternativeCreationCallout:completion:", v34, v32, 0);
    if (!*((unsigned char *)v38 + 24))
    {
      v23 = [NSString stringWithFormat:@"creation callback was not made in scene's didCreate"];
      v24 = MEMORY[0x1E4F14500];
      id v25 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138544642;
        id v42 = v26;
        __int16 v43 = 2114;
        v44 = v28;
        __int16 v45 = 2048;
        v46 = self;
        __int16 v47 = 2114;
        v48 = @"FBLocalSynchronousSceneClientProvider.m";
        __int16 v49 = 1024;
        int v50 = 196;
        __int16 v51 = 2114;
        v52 = v23;
        _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v23 UTF8String];
      uint64_t v29 = _bs_set_crash_log_message();
      -[FBWorkspaceEventDispatcher registerTarget:](v29);
    }

    _Block_object_dispose(&v37, 8);
    if (v17) { {
      (*((void (**)(id, uint64_t, void))v17 + 2))(v17, 1, 0);
    }
    }
  }
}

uint64_t __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_109(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  }
  return result;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v13 = a3;
  v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a4;
  if (([v8 isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider scene:didReceiveActions:forExtension:]");
  }
  }
  hostsByIdentity = self->_hostsByIdentity;
  id v11 = [v13 identity];
  id v12 = [(NSMutableDictionary *)hostsByIdentity objectForKey:v11];
  [v12 clientToken:self didReceiveActions:v9 forExtension:a5];
}

- (FBLocalSynchronousSceneClientProvider)init
{
  v4 = [NSString stringWithFormat:@"-[FBLocalSynchronousSceneClientProvider init] is unavailable."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"FBLocalSynchronousSceneClientProvider.m";
    __int16 v17 = 1024;
    int v18 = 53;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  uint64_t result = (FBLocalSynchronousSceneClientProvider *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)FBLocalSynchronousSceneClientProvider;
  v2 = [(FBLocalSynchronousSceneClientProvider *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingSceneCreatesBeforeFBSWorkspaceInitialization = v2->_pendingSceneCreatesBeforeFBSWorkspaceInitialization;
    v2->_pendingSceneCreatesBeforeFBSWorkspaceInitialization = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    localSceneInfoByIdentity = v2->_localSceneInfoByIdentity;
    v2->_localSceneInfoByIdentity = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    hostsByIdentity = v2->_hostsByIdentity;
    v2->_hostsByIdentity = (NSMutableDictionary *)v7;

    v2->_workspaceInitialized = 0;
    uint64_t v9 = [MEMORY[0x1E4F62AC8] mainDispatchQueue];
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (FBSSerialQueue *)v9;

    __int16 v11 = (void *)MEMORY[0x1E4F62B08];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__FBLocalSynchronousSceneClientProvider__init__block_invoke;
    v13[3] = &unk_1E5C4A3A8;
    id v14 = v2;
    [v11 _registerBlockForWorkspaceCreation:v13];
  }
  return v2;
}

void __46__FBLocalSynchronousSceneClientProvider__init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = FBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "LocalSynchronousSceneClientProvider received workspace creation.", buf, 2u);
  }

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider _init]_block_invoke");
  }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v16 = v3;
  [v3 _registerSource:*(void *)(a1 + 32)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) { {
          objc_enumerationMutation(v5);
        }
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v11 = FBLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v10 FBSScene];
          __int16 v13 = [v12 succinctDescription];
          *(_DWORD *)buf = 138543362;
          v22 = v13;
          _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "LocalSynchronousSceneClientProvider sending scene create for: %{public}@", buf, 0xCu);
        }
        [*(id *)(a1 + 32) _sendSceneCreateFBSWorkspaceDelegateForSceneInfo:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v14 = *(void *)(a1 + 32);
  objc_super v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) { {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_20);
  }
  }
  v2 = (void *)sharedInstance___instance_3;

  return v2;
}

void __55__FBLocalSynchronousSceneClientProvider_sharedInstance__block_invoke()
{
  id v0 = [[FBLocalSynchronousSceneClientProvider alloc] _init];
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;
}

- (void)dealloc
{
  v4 = [NSString stringWithFormat:@"FBLocalSynchronousSceneClientProvider should not deallocate"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    objc_super v15 = @"FBLocalSynchronousSceneClientProvider.m";
    __int16 v16 = 1024;
    int v17 = 94;
    __int16 v18 = 2114;
    long long v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)fbsSceneForScene:(id)a3
{
  v4 = [a3 identity];
  uint64_t v5 = [(FBLocalSynchronousSceneClientProvider *)self sceneWithIdentity:v4];

  return v5;
}

- (id)fbsSceneWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) { {
          objc_enumerationMutation(v5);
        }
        }
        __int16 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v11 = [v10 identifier];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          __int16 v14 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v10];
          __int16 v13 = [v14 FBSScene];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) { {
        continue;
      }
      }
      break;
    }
  }
  __int16 v13 = 0;
LABEL_11:

  return v13;
}

- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    uint64_t v29 = [NSString stringWithFormat:@"synchronous-local scenes cannot have remnants"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]5();
    }
    }
LABEL_63:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CC34);
  }
  id v14 = [v11 identityToken];
  NSClassFromString(&cfstr_Fbssceneidenti_0.isa);
  if (!v14)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CC98);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityTokenClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CCFCLL);
  }

  objc_super v15 = [v11 definition];
  long long v16 = [v15 identity];

  id v17 = v16;
  NSClassFromString(&cfstr_Fbssceneidenti.isa);
  if (!v17)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CD60);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CDC4);
  }

  id v18 = [v11 specification];
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v18)
  {
    id v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CE28);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CE8CLL);
  }

  id v19 = v12;
  NSClassFromString(&cfstr_Fbsscenesettin.isa);
  if (!v19)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    }
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CEF0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    }
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CF54);
  }

  [v18 settingsClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = [NSString stringWithFormat:@"settings of an unexpected class"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]0();
    }
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635CFACLL);
  }
  id v20 = v13;
  NSClassFromString(&cfstr_Fbssceneclient_0.isa);
  if (!v20)
  {
    uint64_t v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    }
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D010);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    }
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D074);
  }

  [v18 clientSettingsClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [NSString stringWithFormat:@"initialClientSettings of an unexpected class"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.8();
    }
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D0CCLL);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:]");
  }
  }
  uint64_t v21 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v17];

  if (v21)
  {
    id v42 = NSString;
    __int16 v43 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v17];
    v44 = [v42 stringWithFormat:@"trying to register a local scene for an already known identifier : %@ -> previous=%@", v17, v43];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.7();
    }
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D144);
  }
  v22 = [(NSMutableDictionary *)self->_hostsByIdentity objectForKey:v17];

  if (v22)
  {
    __int16 v45 = NSString;
    v46 = [(NSMutableDictionary *)self->_hostsByIdentity objectForKey:v17];
    uint64_t v29 = [v45 stringWithFormat:@"trying to register a local host for an already known identifier : %@ -> previous=%@", v17, v46];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider registerHost:settings:initialClientSettings:fromRemnant:error:].cold.6();
    }
    }
    goto LABEL_63;
  }
  [(NSMutableDictionary *)self->_hostsByIdentity setObject:v11 forKey:v17];
  v23 = [MEMORY[0x1E4F629B8] parametersForSpecification:v18];
  [v23 setSettings:v19];
  [v23 setClientSettings:v20];
  id v24 = objc_alloc(MEMORY[0x1E4F62A20]);
  id v25 = [MEMORY[0x1E4F62A58] localHandle];
  id v26 = (void *)[v24 _initWithUpdater:self identityToken:v14 identity:v17 parameters:v23 hostHandle:v25];

  v27 = objc_alloc_init(_FBSystemAppSceneInfo);
  [(_FBSystemAppSceneInfo *)v27 setFBSScene:v26];
  [(NSMutableDictionary *)self->_localSceneInfoByIdentity setObject:v27 forKey:v17];

  return self;
}

- (void)unregisterHost:(id)a3
{
  id v9 = a3;
  id v4 = [v9 definition];
  uint64_t v5 = [v4 identity];

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider unregisterHost:]");
  }
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v5];

  if (!v6)
  {
    uint64_t v8 = [NSString stringWithFormat:@"trying to unregister a local scene for an unknown identifier : %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider unregisterHost:]();
    }
    }
LABEL_13:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D300);
  }
  id v7 = [(NSMutableDictionary *)self->_hostsByIdentity objectForKey:v5];

  if (v7 != v9)
  {
    uint64_t v8 = [NSString stringWithFormat:@"trying to unregister a local host for a mismatched identifier : %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider unregisterHost:]();
    }
    }
    goto LABEL_13;
  }
  [(NSMutableDictionary *)self->_localSceneInfoByIdentity removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_hostsByIdentity removeObjectForKey:v5];
}

uint64_t __102__FBLocalSynchronousSceneClientProvider_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  [*(id *)(a1 + 32) setPendingTransitionContext:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return [(id)v2 _sendSceneCreateFBSWorkspaceDelegateForSceneInfo:v3];
  }
  else
  {
    uint64_t result = [*(id *)(v2 + 16) containsObject:*(void *)(a1 + 32)];
    if ((result & 1) == 0)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 48) + 16);
      uint64_t v6 = *(void *)(a1 + 32);
      return [v5 addObject:v6];
    }
  }
  return result;
}

- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, uint64_t, void))a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:]");
  }
  }
  id v11 = [v8 definition];
  id v12 = [v11 identity];

  id v13 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:v12];
  uint64_t v14 = [v13 FBSScene];
  if (!v14)
  {
    id v19 = [NSString stringWithFormat:@"Must have a scene for it to be invalidated."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:]();
    }
    }
    goto LABEL_16;
  }
  objc_super v15 = (void *)v14;
  if (self->_workspaceInitialized)
  {
    uint64_t v16 = [MEMORY[0x1E4F62B08] _sharedWorkspaceIfExists];
    if (v16)
    {
      id v17 = (void *)v16;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __92__FBLocalSynchronousSceneClientProvider_host_didInvalidateWithTransitionContext_completion___block_invoke;
      v22[3] = &unk_1E5C49860;
      id v23 = v15;
      id v24 = v9;
      id v25 = v17;
      id v18 = v17;
      objc_msgSend(v18, "_calloutQueue_executeCalloutFromSource:withBlock:", self, v22);

      goto LABEL_8;
    }
    id v20 = NSString;
    uint64_t v21 = [v15 identityToken];
    id v19 = [v20 stringWithFormat:@"cannot note invalidation of %@ without a reference to the workspace", v21];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBLocalSynchronousSceneClientProvider host:didInvalidateWithTransitionContext:completion:]();
    }
    }
LABEL_16:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635D624);
  }
  [(NSMutableArray *)self->_pendingSceneCreatesBeforeFBSWorkspaceInitialization removeObject:v13];
  objc_msgSend(v15, "_callOutQueue_willDestroyWithTransitionContext:completion:", v9, 0);
LABEL_8:
  objc_msgSend(v15, "_callOutQueue_invalidate");
  if (v10) { {
    v10[2](v10, 1, 0);
  }
  }
}

void __92__FBLocalSynchronousSceneClientProvider_host_didInvalidateWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_willDestroyWithTransitionContext:completion:", *(void *)(a1 + 40), 0) & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 48) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = [*(id *)(a1 + 48) delegate];
      [v4 workspace:*(void *)(a1 + 48) willDestroyScene:*(void *)(a1 + 32) withTransitionContext:*(void *)(a1 + 40) completion:&__block_literal_global_121];
    }
  }
}

- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v14 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBLocalSynchronousSceneClientProvider host:didReceiveActions:forExtension:]");
  }
  }
  localSceneInfoByIdentity = self->_localSceneInfoByIdentity;
  __int16 v10 = [v14 definition];
  id v11 = [v10 identity];
  id v12 = [(NSMutableDictionary *)localSceneInfoByIdentity objectForKey:v11];
  id v13 = [v12 FBSScene];

  if (v13) { {
    [v13 updater:self didReceiveActions:v8 forExtension:a5];
  }
  }
}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (id)hostProcess
{
  uint64_t v2 = +[FBProcessManager sharedInstance];
  char v3 = [v2 currentProcess];

  return v3;
}

- (BOOL)canHaveAgent
{
  return 0;
}

- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  if (a5) { {
    (*((void (**)(id, void, void))a5 + 2))(a5, 0, 0);
  }
  }
}

- (NSCopying)identifier
{
  return (NSCopying *)@"LocalSynchronousWorkspace";
}

- (id)scenes
{
  char v3 = [MEMORY[0x1E4F1CA80] set];
  localSceneInfoByIdentity = self->_localSceneInfoByIdentity;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__FBLocalSynchronousSceneClientProvider_scenes__block_invoke;
  v7[3] = &unk_1E5C4B378;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)localSceneInfoByIdentity enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __47__FBLocalSynchronousSceneClientProvider_scenes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = [a3 FBSScene];
  [v3 addObject:v4];
}

- (id)sceneWithIdentity:(id)a3
{
  char v3 = [(NSMutableDictionary *)self->_localSceneInfoByIdentity objectForKey:a3];
  id v4 = [v3 FBSScene];

  return v4;
}

- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  uint64_t v6 = FBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
    -[FBLocalSynchronousSceneClientProvider sendActions:toWorkspaceID:completion:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  }

  if (v5)
  {
    id v14 = FBSWorkspaceErrorCreate();
    v5[2](v5, 0, v14);
  }
}

- (id)createSceneFutureWithDefinition:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
    -[FBLocalSynchronousSceneClientProvider createSceneFutureWithDefinition:completion:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  }

  if (v4)
  {
    uint64_t v13 = FBSWorkspaceErrorCreate();
    v4[2](v4, 0, v13);
  }
  return 0;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
    -[FBLocalSynchronousSceneClientProvider requestSceneWithOptions:completion:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  }

  if (v4)
  {
    uint64_t v13 = FBSWorkspaceErrorCreate();
    v4[2](v4, 0, v13);
  }
}

- (void)_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:(id)a3
{
  id v4 = a3;
  if ([v4 hasSentFBSWorkspaceDelegateSceneCreate]) { {
    goto LABEL_4;
  }
  }
  [v4 setHasSentFBSWorkspaceDelegateSceneCreate:1];
  id v5 = [v4 FBSScene];
  uint64_t v6 = [MEMORY[0x1E4F62B08] _sharedWorkspaceIfExists];
  if (v6)
  {
    uint64_t v7 = v6;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__FBLocalSynchronousSceneClientProvider__sendSceneCreateFBSWorkspaceDelegateForSceneInfo___block_invoke;
    v13[3] = &unk_1E5C497A0;
    id v14 = v6;
    id v8 = v4;
    id v15 = v8;
    id v9 = v7;
    objc_msgSend(v9, "_calloutQueue_executeCalloutFromSource:withBlock:", self, v13);
    [v8 setPendingTransitionContext:0];

LABEL_4:
    return;
  }
  uint64_t v10 = NSString;
  uint64_t v11 = [v5 identityToken];
  uint64_t v12 = [v10 stringWithFormat:@"cannot note creation of %@ without a reference to the workspace", v11];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBLocalSynchronousSceneClientProvider _sendSceneCreateFBSWorkspaceDelegateForSceneInfo:]();
  }
  }
  [v12 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __90__FBLocalSynchronousSceneClientProvider__sendSceneCreateFBSWorkspaceDelegateForSceneInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) FBSScene];
    uint64_t v6 = [*(id *)(a1 + 40) pendingTransitionContext];
    [v7 workspace:v4 didCreateScene:v5 withTransitionContext:v6 completion:&__block_literal_global_144];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSceneCreatesBeforeFBSWorkspaceInitialization, 0);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.6()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.7()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.8()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.10()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.15()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)unregisterHost:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)unregisterHost:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)host:(const char *)a1 didUpdateSettings:withDiff:transitionContext:completion:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)host:didInvalidateWithTransitionContext:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)host:didInvalidateWithTransitionContext:completion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:(uint64_t)a3 toWorkspaceID:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createSceneFutureWithDefinition:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestSceneWithOptions:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_sendSceneCreateFBSWorkspaceDelegateForSceneInfo:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end