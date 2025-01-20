@interface FBSWorkspace
+ (id)_sharedWorkspaceIfExists;
+ (void)_registerBlockForWorkspaceCreation:(id)a3;
- (BSServiceConnectionEndpoint)defaultShellEndpoint;
- (FBSWorkspace)init;
- (FBSWorkspace)initWithSerialQueue:(id)a3;
- (FBSWorkspaceDelegate)delegate;
- (NSArray)scenes;
- (NSString)debugDescription;
- (id)_callOutQueue;
- (id)_queue_scenesClientForEndpoint:(uint64_t)a1 creatingIfNecessary:(void *)a2;
- (id)defaultService;
- (id)defaultServiceForEndpoint:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sceneWithIdentifier:(id)a3;
- (id)serviceForEndpoint:(id)a3 withIdentifier:(id)a4;
- (id)serviceQueue;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activate;
- (void)_calloutQueue_executeCalloutFromSource:(id)a3 withBlock:(id)a4;
- (void)_consumeSharedLock_activateWithAlreadyHeldLock:(uint64_t)a1;
- (void)_initWithOptions:(void *)a1;
- (void)_queue_registerSource:(id)a3;
- (void)_queue_unregisterSource:(id)a3;
- (void)_registerSource:(id)a3;
- (void)_registerSourceEndpoint:(id)a3;
- (void)_registerSourcePeer:(id)a3;
- (void)_scenesClientForEndpoint:(void *)a1;
- (void)dealloc;
- (void)enumerateScenesWithBlock:(id)a3;
- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4;
- (void)monitor:(id)a3 willLoseEndpoint:(id)a4;
- (void)requestDestructionOfScene:(id)a3 withCompletion:(id)a4;
- (void)requestSceneCreationWithIdentifier:(id)a3 initialClientSettings:(id)a4 completion:(id)a5;
- (void)requestSceneCreationWithInitialClientSettings:(id)a3 completion:(id)a4;
- (void)requestSceneFromEndpoint:(id)a3 withOptions:(id)a4 completion:(id)a5;
@end

@implementation FBSWorkspace

- (void)_initWithOptions:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"options"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspace _initWithOptions:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }
    v5 = [v3 delegate];

    if (!v5)
    {
      v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[options delegate]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspace _initWithOptions:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    v15.receiver = a1;
    v15.super_class = (Class)FBSWorkspace;
    a1 = [super init];
    if (a1)
    {
      uint64_t v6 = [v4 delegate];
      v7 = (void *)a1[3];
      a1[3] = v6;

      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = (void *)a1[5];
      a1[5] = v8;

      v10 = +[FBSWorkspaceScenesClient serviceQuality]();
      v11 = [off_1E58F44F8 serial];
      [v11 serviceClass:[v10 serviceClass] relativePriority:[v10 relativePriority]];
      objc_claimAutoreleasedReturnValue();

      BSDispatchQueueCreate();
    }
  }

  return a1;
}

- (void)_calloutQueue_executeCalloutFromSource:(id)a3 withBlock:(id)a4
{
  id v13 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (!v6)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"callout"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspace _calloutQueue_executeCalloutFromSource:withBlock:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  v7 = v6;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  id v8 = [MEMORY[0x1E4F29060] currentThread];
  v9 = [v8 threadDictionary];

  v10 = [v9 objectForKey:@"FBSWorkspaceCalloutScenesSourceKey"];
  v11 = (void *)MEMORY[0x19F398F90]([v9 setObject:v13 forKey:@"FBSWorkspaceCalloutScenesSourceKey"]);
  v7[2](v7);
  if (v10) {
    [v9 setObject:v10 forKey:@"FBSWorkspaceCalloutScenesSourceKey"];
  }
  else {
    [v9 removeObjectForKey:@"FBSWorkspaceCalloutScenesSourceKey"];
  }
}

void __36__FBSWorkspace_sceneWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29060] currentThread];
  id v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"FBSWorkspaceCalloutScenesSourceKey"];

  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [v4 scenes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v11 = [v10 identifier];
          int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

          if (v12)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_consumeSharedLock_activateWithAlreadyHeldLock:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2) {
      os_unfair_lock_assert_owner(&__sharedInstanceLock);
    }
    else {
      os_unfair_lock_lock(&__sharedInstanceLock);
    }
    id v3 = (id)__sharedInstanceInitializationBlocks;
    v4 = (void *)__sharedInstanceInitializationBlocks;
    __sharedInstanceInitializationBlocks = 0;

    if (v3)
    {
      [*(id *)(a1 + 48) activate];
      if (*(void *)(a1 + 56)) {
        [a1 monitor:didReceiveEndpoint:*(void *)(a1 + 48)];
      }
      os_unfair_lock_unlock(&__sharedInstanceLock);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * i));
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
    else
    {
      os_unfair_lock_unlock(&__sharedInstanceLock);
    }
  }
}

- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__FBSWorkspace_monitor_didReceiveEndpoint___block_invoke;
  v8[3] = &unk_1E58F4AB0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

- (id)sceneWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  long long v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__FBSWorkspace_sceneWithIdentifier___block_invoke;
  v9[3] = &unk_1E58F5230;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

id __43__FBSWorkspace_monitor_didReceiveEndpoint___block_invoke(uint64_t a1)
{
  return -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (id)_queue_scenesClientForEndpoint:(uint64_t)a1 creatingIfNecessary:(void *)a2
{
  id v3 = a2;
  if (a1) {
    BSDispatchQueueAssert();
  }

  return 0;
}

- (FBSWorkspaceDelegate)delegate
{
  return self->_delegate;
}

- (void)_queue_registerSource:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BSDispatchQueueAssert();
}

- (FBSWorkspace)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-init is unavailable on FBSWorkspace"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    long long v11 = v7;
    __int16 v12 = 2048;
    long long v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = @"FBSWorkspace.m";
    __int16 v16 = 1024;
    int v17 = 134;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSWorkspace)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"-initWithQueue: is unavailable on FBSWorkspace"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    long long v11 = v7;
    __int16 v12 = 2114;
    long long v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    int v17 = @"FBSWorkspace.m";
    __int16 v18 = 1024;
    int v19 = 144;
    __int16 v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
}

- (void)dealloc
{
  uint64_t v4 = [NSString stringWithFormat:@"dealloc is not allowed on FBSWorkspace"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    long long v11 = v7;
    __int16 v12 = 2048;
    long long v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = @"FBSWorkspace.m";
    __int16 v16 = 1024;
    int v17 = 195;
    __int16 v18 = 2114;
    int v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

+ (id)_sharedWorkspaceIfExists
{
  return (id)__sharedInstance;
}

+ (void)_registerBlockForWorkspaceCreation:(id)a3
{
  id v9 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_lock(&__sharedInstanceLock);
  id v3 = (void *)__sharedInstanceInitializationBlocks;
  if (__sharedInstance) {
    BOOL v4 = __sharedInstanceInitializationBlocks == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    os_unfair_lock_unlock(&__sharedInstanceLock);
    v9[2](v9, __sharedInstance);
  }
  else
  {
    if (__sharedInstanceInitializationBlocks)
    {
      id v5 = (void *)[v9 copy];
      [v3 addObject:v5];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CA48];
      id v5 = (void *)[v9 copy];
      uint64_t v7 = [v6 arrayWithObject:v5];
      int v8 = (void *)__sharedInstanceInitializationBlocks;
      __sharedInstanceInitializationBlocks = v7;
    }
    os_unfair_lock_unlock(&__sharedInstanceLock);
  }
}

- (id)defaultService
{
  id v3 = [(FBSWorkspace *)self defaultShellEndpoint];
  BOOL v4 = [(FBSWorkspace *)self serviceForEndpoint:v3 withIdentifier:0];

  return v4;
}

- (id)defaultServiceForEndpoint:(id)a3
{
  return [(FBSWorkspace *)self serviceForEndpoint:a3 withIdentifier:0];
}

- (id)serviceForEndpoint:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[FBSWorkspace _sharedWorkspaceIfExists];
  if (!v7)
  {
    __int16 v12 = [NSString stringWithFormat:@"FBSWorkspaceService cannot be used until the core FBSWorkspace is initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspace serviceForEndpoint:withIdentifier:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
  }
  int v8 = v7;
  id v9 = -[FBSWorkspace _scenesClientForEndpoint:](v7, v5);
  if (v9) {
    id v10 = [[FBSWorkspaceService alloc] _initWithTarget:v9 identifier:v6];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)_scenesClientForEndpoint:(void *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    __int16 v12 = &v11;
    uint64_t v13 = 0x3032000000;
    __int16 v14 = __Block_byref_object_copy__4;
    uint64_t v15 = __Block_byref_object_dispose__4;
    id v16 = 0;
    if (v3)
    {
      id v5 = a1[4];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__FBSWorkspace__scenesClientForEndpoint___block_invoke;
      block[3] = &unk_1E58F59F8;
      id v10 = &v11;
      block[4] = a1;
      id v9 = v3;
      dispatch_sync(v5, block);

      id v6 = (void *)v12[5];
    }
    else
    {
      id v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

- (void)requestSceneFromEndpoint:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(FBSWorkspace *)self defaultServiceForEndpoint:v8];
  __int16 v12 = v11;
  if (v11)
  {
    [v11 requestSceneWithOptions:v9 completion:v10];
  }
  else
  {
    callOutQueue = self->_callOutQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__FBSWorkspace_requestSceneFromEndpoint_withOptions_completion___block_invoke;
    v14[3] = &unk_1E58F5450;
    id v16 = v10;
    id v15 = v8;
    [(FBSSerialQueue *)callOutQueue performAsync:v14];
  }
}

void __64__FBSWorkspace_requestSceneFromEndpoint_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 3uLL, @"could not connect to endpoint %@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
}

- (NSArray)scenes
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __22__FBSWorkspace_scenes__block_invoke;
  v9[3] = &unk_1E58F4AB0;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  uint64_t v7 = (NSArray *)v5;

  return v7;
}

void __22__FBSWorkspace_scenes__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __22__FBSWorkspace_scenes__block_invoke_2;
  v2[3] = &unk_1E58F5940;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __22__FBSWorkspace_scenes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = [a3 scenes];
  BOOL v4 = [v5 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (void)enumerateScenesWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FBSWorkspace *)self scenes];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__FBSWorkspace_enumerateScenesWithBlock___block_invoke;
    v6[3] = &unk_1E58F5968;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __41__FBSWorkspace_enumerateScenesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSceneCreationWithInitialClientSettings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setInitialClientSettings:v7];

  defaultShellEndpoint = self->_defaultShellEndpoint;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__FBSWorkspace_requestSceneCreationWithInitialClientSettings_completion___block_invoke;
  v11[3] = &unk_1E58F5990;
  id v12 = v6;
  id v10 = v6;
  [(FBSWorkspace *)self requestSceneFromEndpoint:defaultShellEndpoint withOptions:v8 completion:v11];
}

uint64_t __73__FBSWorkspace_requestSceneCreationWithInitialClientSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestSceneCreationWithIdentifier:(id)a3 initialClientSettings:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  [v11 setIdentifier:v10];

  [v11 setInitialClientSettings:v9];
  defaultShellEndpoint = self->_defaultShellEndpoint;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__FBSWorkspace_requestSceneCreationWithIdentifier_initialClientSettings_completion___block_invoke;
  v14[3] = &unk_1E58F5990;
  id v15 = v8;
  id v13 = v8;
  [(FBSWorkspace *)self requestSceneFromEndpoint:defaultShellEndpoint withOptions:v11 completion:v14];
}

uint64_t __84__FBSWorkspace_requestSceneCreationWithIdentifier_initialClientSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestDestructionOfScene:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    callOutQueue = self->_callOutQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__FBSWorkspace_requestDestructionOfScene_withCompletion___block_invoke;
    v8[3] = &unk_1E58F5040;
    id v9 = v5;
    [(FBSSerialQueue *)callOutQueue performAsync:v8];
  }
}

uint64_t __57__FBSWorkspace_requestDestructionOfScene_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)serviceQueue
{
  return self->_serviceQueue;
}

- (void)_registerSourceEndpoint:(id)a3
{
}

- (void)_registerSourcePeer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FBSWorkspace__registerSourcePeer___block_invoke;
  v7[3] = &unk_1E58F4AB0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __36__FBSWorkspace__registerSourcePeer___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [FBSWorkspaceScenesClient alloc];
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void ***)(a1 + 40);
  id v5 = (id *)(a1 + 32);
  id v6 = -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]((id *)&v2->super.isa, v3, v4[4], v4[1], v4);
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 identifier];
    id v9 = FBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      __int16 v18 = v8;
      _os_log_impl(&dword_19C680000, v9, OS_LOG_TYPE_DEFAULT, "FBSWorkspace connected to peer : %@", (uint8_t *)&v17, 0xCu);
    }

    -[FBSWorkspaceScenesClient queue_activate]((uint64_t)v7);
  }
  else
  {
    id v10 = FBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __36__FBSWorkspace__registerSourcePeer___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }

    [*v5 invalidate];
  }
}

- (void)_registerSource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__FBSWorkspace__registerSource___block_invoke;
  v7[3] = &unk_1E58F4AB0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __32__FBSWorkspace__registerSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_registerSource:*(void *)(a1 + 40)];
}

- (void)_queue_unregisterSource:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BSDispatchQueueAssert();
}

- (void)_activate
{
}

- (void)monitor:(id)a3 willLoseEndpoint:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = FBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEFAULT, "FBSWorkspace lost endpoint : %@", (uint8_t *)&v6, 0xCu);
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSWorkspace *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSWorkspace *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v29 = [off_1E58F44F0 builderWithObject:self];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke;
  block[3] = &unk_1E58F4AB0;
  block[4] = self;
  id v7 = v5;
  id v35 = v7;
  dispatch_sync(queue, block);
  uint64_t v8 = [v7 allKeys];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_6];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    id v27 = v4;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = objc_opt_class();
          id v16 = v14;
          if (v15)
          {
            if (objc_opt_isKindOfClass()) {
              int v17 = v16;
            }
            else {
              int v17 = 0;
            }
          }
          else
          {
            int v17 = 0;
          }
          id v19 = v17;

          __int16 v20 = [v19 instance];
          if (v20)
          {
            v21 = NSString;
            uint64_t v22 = [v19 targetDescription];

            __int16 v18 = [v21 stringWithFormat:@"%@:%@", v22, v20];
            id v19 = (id)v22;
          }
          else
          {
            __int16 v18 = [v19 targetDescription];
          }

          id v4 = v27;
        }
        else
        {
          __int16 v18 = [v14 description];
        }
        v23 = [v7 objectForKey:v14];
        v24 = [v23 allObjects];
        v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_179];

        [v29 appendArraySection:v25 withName:v18 multilinePrefix:v4 skipIfEmpty:0];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v11);
  }

  return v29;
}

void __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v2[3] = &unk_1E58F5940;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  int v6 = [a3 scenes];
  if (v6)
  {
    [v5 setObject:v6 forKey:v8];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
    [v5 setObject:v7 forKey:v8];
  }
}

uint64_t __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    uint64_t v10 = [v5 compare:v4];
  }
  else
  {
    id v7 = (objc_class *)objc_opt_class();

    NSStringFromClass(v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = [v5 compare:v9];
  }
  return v10;
}

uint64_t __54__FBSWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)succinctDescription
{
  v2 = [(FBSWorkspace *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

uint64_t __41__FBSWorkspace__scenesClientForEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[FBSWorkspace _queue_scenesClientForEndpoint:creatingIfNecessary:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_callOutQueue
{
  return self->_callOutQueue;
}

- (BSServiceConnectionEndpoint)defaultShellEndpoint
{
  return self->_defaultShellEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultShellEndpoint, 0);
  objc_storeStrong((id *)&self->_connectionEndpointMonitor, 0);
  objc_storeStrong((id *)&self->_queue_identifierToScenesSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);

  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)_initWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithOptions:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithOptions:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
}

- (void)_initWithOptions:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithOptions:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)serviceForEndpoint:withIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __36__FBSWorkspace__registerSourcePeer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_calloutQueue_executeCalloutFromSource:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_scenesClientForEndpoint:(uint64_t)a3 creatingIfNecessary:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_scenesClientForEndpoint:creatingIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end