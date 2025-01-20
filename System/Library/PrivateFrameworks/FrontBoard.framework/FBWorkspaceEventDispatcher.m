@interface FBWorkspaceEventDispatcher
+ (id)sharedInstance;
- (BOOL)handleSceneRequest:(id)a3 fromSource:(id)a4;
- (FBWorkspaceEventDispatcher)init;
- (id)_initWithConnectionStore:(id)a3 preregisteredWorkspaces:(id)a4;
- (id)registerSourceWithProcessHandle:(id)a3;
- (id)registerTarget:(id)a3;
- (void)_flushCalloutsWithCompletion:(id)a3;
- (void)_mainThread_dispatchHandshakeFromSource:(id)a3 toTarget:(id)a4;
- (void)_mainThread_dispatchSceneRequestsFromSource:(id)a3 toTarget:(id)a4;
- (void)noteHandshakeFromSource:(id)a3 withRemnants:(id)a4;
@end

@implementation FBWorkspaceEventDispatcher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) { {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_1);
  }
  }
  v2 = (void *)sharedInstance___sharedInstance_0;

  return v2;
}

void __67__FBWorkspaceEventDispatcher_noteHandshakeFromSource_withRemnants___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 16);
  v2 = (void *)*((void *)a1[4] + 3);
  v3 = NSNumber;
  v4 = [a1[5] processHandle];
  v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "rbs_pid"));
  id v6 = [v2 objectForKey:v5];
  id v7 = a1[5];

  if (v6 == v7)
  {
    [a1[5] noteHandshakeWithRemnants:a1[6]];
    v15 = NSAllMapTableValues(*((NSMapTable **)a1[4] + 4));
    v16 = (void *)[v15 copy];

    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 16);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = v16;
    uint64_t v17 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) { {
            objc_enumerationMutation(v10);
          }
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = (void *)*((void *)a1[4] + 5);
          v23 = [v21 workspaceIdentifier];
          LOBYTE(v22) = [v22 containsObject:v23];

          if ((v22 & 1) == 0) { {
            objc_msgSend(a1[4], "_mainThread_dispatchHandshakeFromSource:toTarget:", a1[5], v21);
          }
          }
        }
        uint64_t v18 = [v10 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v18);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 16);
    v8 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [a1[5] processHandle];
      *(_DWORD *)buf = 67240192;
      int v34 = objc_msgSend(v9, "rbs_pid");
      _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring invalid source registration for %{public}i", buf, 8u);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = a1[6];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v25 != v13) { {
            objc_enumerationMutation(v10);
          }
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "invalidate", (void)v24);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v12);
    }
  }
}

- (void)_mainThread_dispatchHandshakeFromSource:(id)a3 toTarget:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__FBWorkspaceEventDispatcher__mainThread_dispatchHandshakeFromSource_toTarget___block_invoke;
  v12[3] = &unk_1E5C499A0;
  id v7 = v6;
  id v13 = v7;
  v8 = [v5 consumeRemnantsPassingTest:v12];
  if (v8)
  {
    v9 = [FBSceneClientHandshake alloc];
    id v10 = [v5 processHandle];
    id v11 = [(FBSceneClientHandshake *)v9 _initWithHandle:v10 remnants:v8];
    [v7 didReceiveHandshake:v11];
  }
}

- (id)registerSourceWithProcessHandle:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Rbsprocesshand.isa);
  if (!v5)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:]();
    }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63155CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:].cold.4();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6315630);
  }

  uint64_t v6 = [v5 pid];
  if ((int)v6 <= 0)
  {
    long long v25 = [NSString stringWithFormat:@"invalid pid for %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher registerSourceWithProcessHandle:]();
    }
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631568CLL);
  }
  id v7 = [NSNumber numberWithInt:v6];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  id v8 = objc_alloc(MEMORY[0x1E4F628C0]);
  v9 = [v5 description];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke;
  v33[3] = &unk_1E5C49950;
  v33[4] = self;
  id v10 = v7;
  id v34 = v10;
  uint64_t v36 = &v38;
  SEL v37 = a2;
  id v11 = v5;
  id v35 = v11;
  uint64_t v12 = (void *)[v8 initWithIdentifier:@"com.apple.frontboard.workspace-events.registration" forReason:v9 invalidationBlock:v33];

  os_unfair_lock_lock(&self->_lock);
  id v13 = [(NSMutableDictionary *)self->_lock_restartAssertionsByPidNumber objectForKey:v10];
  if (v13)
  {
    [(NSMutableDictionary *)self->_lock_restartAssertionsByPidNumber removeObjectForKey:v10];
    if (![(NSMutableDictionary *)self->_lock_restartAssertionsByPidNumber count])
    {
      lock_restartAssertionsByPidNumber = self->_lock_restartAssertionsByPidNumber;
      self->_lock_restartAssertionsByPidNumber = 0;
    }
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_lock_sourcesByPidNumber objectForKey:v10];
  if (v15)
  {
    long long v26 = [NSString stringWithFormat:@"already have a source registered for %@: %@", v10, v15];
    long long v27 = MEMORY[0x1E4F14500];
    id v28 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      long long v30 = (objc_class *)objc_opt_class();
      long long v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      id v45 = v29;
      __int16 v46 = 2114;
      v47 = v31;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 2114;
      v51 = @"FBWorkspaceEventDispatcher.m";
      __int16 v52 = 1024;
      int v53 = 250;
      __int16 v54 = 2114;
      v55 = v26;
      _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    uint64_t v32 = _bs_set_crash_log_message();
    -[FBWorkspaceEventDispatcher registerTarget:](v32);
  }
  id v16 = [[FBWorkspaceEventDispatcherSource alloc] _initWithProcessHandle:v11 underlyingAssertion:v12];
  uint64_t v17 = (void *)v39[5];
  v39[5] = (uint64_t)v16;

  [(NSMutableDictionary *)self->_lock_sourcesByPidNumber setObject:v39[5] forKey:v10];
  uint64_t v18 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)v39[5];
    *(_DWORD *)buf = 138543618;
    id v45 = v10;
    __int16 v46 = 2114;
    v47 = v19;
    _os_log_impl(&dword_1A62FC000, v18, OS_LOG_TYPE_DEFAULT, "Registering Source for %{public}@ : %{public}@", buf, 0x16u);
  }

  int v20 = objc_msgSend(v10, "rbs_pid");
  if (v20 != getpid()
    && [(FBMutableWorkspaceConnectionsState *)self->_lock_mutableState addProcessIdentifier:v10])
  {
    [(FBWorkspaceConnectionsStateStore *)self->_store setState:self->_lock_mutableState];
  }
  os_unfair_lock_unlock(&self->_lock);
  [v13 invalidate];
  id v21 = (id)v39[5];

  _Block_object_dispose(&v38, 8);

  return v21;
}

- (void)noteHandshakeFromSource:(id)a3 withRemnants:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Fbworkspaceeve_0.isa);
  if (!v8)
  {
    int v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
    }
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631B0BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceEventDispatcherSourceClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
    }
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631B120);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Nsset.isa);
  if (!v9)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
    }
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631B184);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
    }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631B1E8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) { {
          objc_enumerationMutation(v10);
        }
        }
        id v15 = *(id *)(*((void *)&v27 + 1) + 8 * v14);
        NSClassFromString(&cfstr_Fbsceneremnant.isa);
        if (!v15)
        {
          uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
          }
          }
          [v18 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A631AFF4);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcher noteHandshakeFromSource:withRemnants:]();
          }
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A631B058);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FBWorkspaceEventDispatcher_noteHandshakeFromSource_withRemnants___block_invoke;
  block[3] = &unk_1E5C49860;
  block[4] = self;
  id v25 = v8;
  id v26 = v10;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)_initWithConnectionStore:(id)a3 preregisteredWorkspaces:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Fbworkspacecon.isa);
  if (!v9)
  {
    __int16 v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
    }
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632FC9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateStoreClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
    }
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632FD00);
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v10)
  {
    __int16 v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
    }
    }
    [v52 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632FD64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v53 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
    }
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632FDC8);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v56 = v10;
  uint64_t v11 = [v10 allValues];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v71 != v14) { {
          objc_enumerationMutation(v11);
        }
        }
        id v16 = *(id *)(*((void *)&v70 + 1) + 8 * i);
        NSClassFromString(&cfstr_Fbworkspacereg.isa);
        if (!v16)
        {
          __int16 v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
          }
          }
          [v48 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A632FBD4);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceRegistrationClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcher _initWithConnectionStore:preregisteredWorkspaces:]();
          }
          }
          [v49 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A632FC38);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v13);
  }

  v69.receiver = self;
  v69.super_class = (Class)FBWorkspaceEventDispatcher;
  id v17 = [(FBWorkspaceEventDispatcher *)&v69 init];
  uint64_t v18 = v17;
  uint64_t v19 = v56;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_store, a3);
    uint64_t v20 = [v56 copy];
    preregisteredWorkspaces = v18->_preregisteredWorkspaces;
    v18->_preregisteredWorkspaces = (NSDictionary *)v20;

    v22 = [(FBWorkspaceConnectionsStateStore *)v18->_store state];
    v23 = [v22 processIdentifiers];

    uint64_t v24 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0x10000 valueOptions:517];
    lock_targetsByIdentifier = v18->_lock_targetsByIdentifier;
    v18->_lock_targetsByIdentifier = (NSMapTable *)v24;

    uint64_t v26 = [MEMORY[0x1E4F28BD0] set];
    main_incompleteTargetRegistrations = v18->_main_incompleteTargetRegistrations;
    v18->_main_incompleteTargetRegistrations = (NSCountedSet *)v26;

    v18->_lock._os_unfair_lock_opaque = 0;
    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    lock_sourcesByPidNumber = v18->_lock_sourcesByPidNumber;
    v18->_lock_sourcesByPidNumber = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    lock_mutableState = v18->_lock_mutableState;
    v18->_lock_mutableState = (FBMutableWorkspaceConnectionsState *)v30;

    uint64_t v57 = [v23 count];
    if (v57)
    {
      id v55 = v9;
      lock = &v18->_lock;
      os_unfair_lock_lock(&v18->_lock);
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke;
      v67[3] = &unk_1E5C498B0;
      v58 = v18;
      v60 = v18;
      v68 = v60;
      v61 = (void *)[v67 copy];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      obuint64_t j = v23;
      uint64_t v32 = [obj countByEnumeratingWithState:&v63 objects:v79 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v64;
        do
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v64 != v34) { {
              objc_enumerationMutation(obj);
            }
            }
            uint64_t v36 = *(void **)(*((void *)&v63 + 1) + 8 * v35);
            id v37 = objc_alloc(MEMORY[0x1E4F96318]);
            uint64_t v38 = objc_msgSend(MEMORY[0x1E4F96478], "targetWithPid:", objc_msgSend(v36, "rbs_pid"));
            v39 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"AfterLife-Interrupted"];
            v78 = v39;
            uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
            v41 = (void *)[v37 initWithExplanation:@"com.apple.frontboard.workspace.reconnect" target:v38 attributes:v40];

            [v41 setInvalidationHandler:v61];
            id v62 = 0;
            LODWORD(v39) = [v41 acquireWithError:&v62];
            id v42 = v62;
            if (v39)
            {
              lock_restartAssertionsByPidNumber = v60->_lock_restartAssertionsByPidNumber;
              if (!lock_restartAssertionsByPidNumber)
              {
                uint64_t v44 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v57];
                id v45 = v60->_lock_restartAssertionsByPidNumber;
                v60->_lock_restartAssertionsByPidNumber = (NSMutableDictionary *)v44;

                lock_restartAssertionsByPidNumber = v60->_lock_restartAssertionsByPidNumber;
              }
              [(NSMutableDictionary *)lock_restartAssertionsByPidNumber setObject:v41 forKey:v36];
              [(FBMutableWorkspaceConnectionsState *)v58->_lock_mutableState addProcessIdentifier:v36];
            }
            else
            {
              __int16 v46 = FBLogProcessWorkspace();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v75 = v36;
                __int16 v76 = 2112;
                id v77 = v42;
                _os_log_error_impl(&dword_1A62FC000, v46, OS_LOG_TYPE_ERROR, "failed to acquire restart assertion on %@ : %@", buf, 0x16u);
              }

              [v41 invalidate];
            }

            ++v35;
          }
          while (v33 != v35);
          uint64_t v33 = [obj countByEnumeratingWithState:&v63 objects:v79 count:16];
        }
        while (v33);
      }

      uint64_t v18 = v58;
      [(FBWorkspaceConnectionsStateStore *)v58->_store setState:v58->_lock_mutableState];
      os_unfair_lock_unlock(lock);

      id v9 = v55;
      uint64_t v19 = v56;
    }
  }
  return v18;
}

void __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke_2;
  v41[3] = &unk_1E5C49888;
  id v5 = v3;
  id v42 = v5;
  id v6 = [v4 keysOfEntriesPassingTest:v41];
  if ([v6 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) { {
            objc_enumerationMutation(v7);
          }
          }
          [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v9);
    }

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v12;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v34 != v18) { {
            objc_enumerationMutation(v15);
          }
          }
          uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          int v21 = objc_msgSend(v20, "rbs_pid");
          if (v21 != getpid()) { {
            [*(id *)(*(void *)(a1 + 32) + 56) addProcessIdentifier:v20];
          }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v17);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v30 != v25) { {
            objc_enumerationMutation(v22);
          }
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "addProcessIdentifier:", *(void *)(*((void *)&v29 + 1) + 8 * k), (void)v29);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v24);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setState:*(void *)(*(void *)(a1 + 32) + 56)];
  }
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "count", (void)v29))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void **)(v27 + 48);
    *(void *)(v27 + 48) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
}

BOOL __79__FBWorkspaceEventDispatcher__initWithConnectionStore_preregisteredWorkspaces___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a1 + 32) == a3;
}

- (void)_flushCalloutsWithCompletion:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__FBWorkspaceEventDispatcher__flushCalloutsWithCompletion___block_invoke;
    block[3] = &unk_1E5C498D8;
    id v7 = v3;
    id v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher _flushCalloutsWithCompletion:]();
    }
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __59__FBWorkspaceEventDispatcher__flushCalloutsWithCompletion___block_invoke(uint64_t a1)
{
}

- (FBWorkspaceEventDispatcher)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBWorkspaceEventDispatcher"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"FBWorkspaceEventDispatcher.m";
    __int16 v17 = 1024;
    int v18 = 127;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBWorkspaceEventDispatcher *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __44__FBWorkspaceEventDispatcher_sharedInstance__block_invoke()
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [FBWorkspaceConnectionsStateStore alloc];
  v1 = -[FBWorkspaceDomain machName]((uint64_t)v7);
  id v2 = [(FBWorkspaceConnectionsStateStore *)v0 _initWithIdentifier:v1];

  id v3 = [FBWorkspaceEventDispatcher alloc];
  id v4 = -[FBWorkspaceDomain preregisteredWorkspaces]((uint64_t)v7);
  uint64_t v5 = [(FBWorkspaceEventDispatcher *)v3 _initWithConnectionStore:v2 preregisteredWorkspaces:v4];
  id v6 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = v5;
}

- (id)registerTarget:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher registerTarget:]();
    }
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6330704);
  }
  id v6 = [v5 workspaceIdentifier];
  objc_initWeak(&location, v5);
  id v7 = objc_alloc(MEMORY[0x1E4F628C0]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke;
  v25[3] = &unk_1E5C49900;
  objc_copyWeak(v27, &location);
  v25[4] = self;
  id v8 = v6;
  id v26 = v8;
  v27[1] = (id)a2;
  int v9 = (void *)[v7 initWithIdentifier:@"com.apple.frontboard.workspace-events.registration.target" forReason:v8 invalidationBlock:v25];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMapTable *)self->_lock_targetsByIdentifier objectForKey:v8];
  if (v10)
  {
    __int16 v15 = [NSString stringWithFormat:@"already have a target registered for %@: %@", v8, v10];
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      id v30 = v18;
      __int16 v31 = 2114;
      id v32 = v20;
      __int16 v33 = 2048;
      long long v34 = self;
      __int16 v35 = 2114;
      long long v36 = @"FBWorkspaceEventDispatcher.m";
      __int16 v37 = 1024;
      int v38 = 170;
      __int16 v39 = 2114;
      long long v40 = v15;
      _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    uint64_t v21 = _bs_set_crash_log_message();
    -[FBWorkspaceEventDispatcher registerTarget:](v21);
  }
  [(NSMapTable *)self->_lock_targetsByIdentifier setObject:v5 forKey:v8];
  __int16 v11 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "Registering Target for %{public}@: %{public}@", buf, 0x16u);
  }

  os_unfair_lock_unlock(&self->_lock);
  [(NSCountedSet *)self->_main_incompleteTargetRegistrations addObject:v8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_68;
  block[3] = &unk_1E5C49928;
  objc_copyWeak(&v24, &location);
  void block[4] = self;
  id v23 = v8;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  return v9;
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if (!WeakRetained)
  {
    id v8 = [NSString stringWithFormat:@"target for %@ dealloced before invalidation", *(void *)(a1 + 40)];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_1();
    }
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63309DCLL);
  }
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];

  if (v5 != WeakRetained)
  {
    int v9 = NSString;
    uint64_t v10 = *(void *)(a1 + 40);
    __int16 v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v10];
    id v12 = [v9 stringWithFormat:@"target mismatch for %@ : actual=%p expected=%p", v10, v11, WeakRetained];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_2();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6330A5CLL);
  }
  id v6 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, "Removing target registration for workspaceIdentifier: %{public}@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_68(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if (WeakRetained
    && ([*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)],
        id v3 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 == WeakRetained))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
    id v4 = (void *)[v5 copy];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) { {
          objc_enumerationMutation(v6);
        }
        }
        objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchHandshakeFromSource:toTarget:", *(void *)(*((void *)&v20 + 1) + 8 * v10++), WeakRetained);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) { {
          objc_enumerationMutation(v11);
        }
        }
        objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchSceneRequestsFromSource:toTarget:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), WeakRetained, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

void __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (os_unfair_lock_s **)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 64));
  id v5 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  id v6 = *(void **)(*(void *)(a1[7] + 8) + 40);

  if (v5 != v6)
  {
    id v24 = NSString;
    uint64_t v25 = a1[5];
    uint64_t v26 = [*(id *)(a1[4] + 24) objectForKey:v25];
    uint64_t v27 = [v24 stringWithFormat:@"source mismatch for %@ : actual=%p expected=%p", v25, v26, *(void *)(*(void *)(a1[7] + 8) + 40)];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke_cold_1();
    }
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6330F98);
  }
  uint64_t v7 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[6];
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v8;
    _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "Removing source registration for processHandle: %{public}@", buf, 0xCu);
  }

  [*(id *)(a1[4] + 24) removeObjectForKey:a1[5]];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = a1[4];
  id v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v9;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = *(id *)(a1[4] + 24);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) { {
          objc_enumerationMutation(v12);
        }
        }
        long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        int v18 = objc_msgSend(v17, "rbs_pid");
        if (v18 != getpid()) { {
          [*(id *)&(*v4)[14]._os_unfair_lock_opaque addProcessIdentifier:v17];
        }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = *(id *)&(*v4)[12]._os_unfair_lock_opaque;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v22) { {
          objc_enumerationMutation(v19);
        }
        }
        [*(id *)&(*v4)[14]._os_unfair_lock_opaque addProcessIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  [*(id *)&(*v4)[2]._os_unfair_lock_opaque setState:*(void *)&(*v4)[14]._os_unfair_lock_opaque];
  os_unfair_lock_unlock(*v4 + 16);
}

- (BOOL)handleSceneRequest:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Fbworkspacesce.isa);
  if (!v8)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:]();
    }
    }
LABEL_22:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6331194);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceSceneRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63311F8);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Fbworkspaceeve_0.isa);
  if (!v9)
  {
    long long v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:]();
    }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A633125CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceEventDispatcherSourceClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcher handleSceneRequest:fromSource:]();
    }
    }
    goto LABEL_22;
  }

  uint64_t v10 = [v8 targetIdentifier];
  id v11 = [(NSDictionary *)self->_preregisteredWorkspaces objectForKey:v10];

  if (v10 && (v11 || ([v8 requiresTargetPreregistration] & 1) == 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FBWorkspaceEventDispatcher_handleSceneRequest_fromSource___block_invoke;
    block[3] = &unk_1E5C49978;
    void block[4] = self;
    id v18 = v9;
    id v19 = v10;
    BOOL v21 = v11 != 0;
    id v20 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);

    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __60__FBWorkspaceEventDispatcher_handleSceneRequest_fromSource___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = NSNumber;
  id v4 = [*(id *)(a1 + 40) processHandle];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "rbs_pid"));
  id v6 = [v2 objectForKey:v5];
  id v7 = *(void **)(a1 + 40);

  uint64_t v8 = *(void *)(a1 + 32);
  if (v6 != v7)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 64));
    id v9 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) processHandle];
      *(_DWORD *)buf = 67240192;
      LODWORD(v23) = objc_msgSend(v10, "rbs_pid");
      _os_log_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring scene request from invalid source registration for %{public}i", buf, 8u);
    }
    id v11 = *(void **)(a1 + 56);
    BOOL v12 = FBSWorkspaceErrorCreate();
    [v11 invalidateWithError:v12];

LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  uint64_t v13 = [*(id *)(v8 + 32) objectForKey:*(void *)(a1 + 48)];
  uint64_t v14 = (void *)v13;
  if (!*(unsigned char *)(a1 + 64) && !v13)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
    goto LABEL_11;
  }
  [*(id *)(a1 + 40) enqueueSceneRequest:*(void *)(a1 + 56)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  if (!v14)
  {
LABEL_11:
    if (!*(unsigned char *)(a1 + 64))
    {
      long long v17 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1A62FC000, v17, OS_LOG_TYPE_DEFAULT, "Denying scene request because target workspace \"%{public}@\" does not exist", buf, 0xCu);
      }

      id v19 = *(void **)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 48);
      id v20 = FBSWorkspaceErrorCreate();
      objc_msgSend(v19, "invalidateWithError:", v20, v21);
    }
    goto LABEL_15;
  }
  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 40);
  long long v16 = [v14 workspaceIdentifier];
  LOBYTE(v15) = [v15 containsObject:v16];

  if ((v15 & 1) == 0) { {
    objc_msgSend(*(id *)(a1 + 32), "_mainThread_dispatchSceneRequestsFromSource:toTarget:", *(void *)(a1 + 40), v14);
  }
  }
LABEL_16:
}

uint64_t __79__FBWorkspaceEventDispatcher__mainThread_dispatchHandshakeFromSource_toTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 definition];
  id v4 = [v3 identity];
  id v5 = [v4 internalWorkspaceIdentifier];
  id v6 = [*(id *)(a1 + 32) workspaceIdentifier];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

- (void)_mainThread_dispatchSceneRequestsFromSource:(id)a3 toTarget:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BSDispatchQueueAssertMain();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend(v6, "workspaceIdentifier", 0);
  uint64_t v8 = [v5 dequeueSceneRequestsForTargetIdentifier:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) { {
          objc_enumerationMutation(v8);
        }
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        uint64_t v14 = [v5 processHandle];
        [v6 didReceiveSceneRequest:v13 fromHandle:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithConnectionStore:preregisteredWorkspaces:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_flushCalloutsWithCompletion:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerTarget:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_1()
{
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 56));
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __45__FBWorkspaceEventDispatcher_registerTarget___block_invoke_cold_2()
{
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 56));
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerSourceWithProcessHandle:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerSourceWithProcessHandle:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerSourceWithProcessHandle:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __62__FBWorkspaceEventDispatcher_registerSourceWithProcessHandle___block_invoke_cold_1()
{
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 64));
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeFromSource:withRemnants:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeFromSource:withRemnants:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeFromSource:withRemnants:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleSceneRequest:fromSource:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleSceneRequest:fromSource:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end