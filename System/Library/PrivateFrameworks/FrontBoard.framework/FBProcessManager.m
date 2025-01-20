@interface FBProcessManager
+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (FBApplicationProcess)systemApplicationProcess;
- (FBProcessManager)init;
- (FBProcessWatchdogProviding)defaultWatchdogPolicy;
- (NSString)description;
- (id)_bootstrapProcessWithExecutionContext:(id)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (id)_bootstrapProcessWithHandle:(id)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (id)_createProcessFutureForProcessHandle:(id)a3 error:(id *)a4;
- (id)_createProcessFutureWithExecutionContext:(id)a3 error:(id *)a4;
- (id)_createProcessWithExecutionContext:(id)a3 error:(id *)a4;
- (id)_reallyRegisterProcessForHandle:(id)a3;
- (id)allApplicationProcesses;
- (id)allProcesses;
- (id)applicationProcessForPID:(int)a3;
- (id)applicationProcessesForBundleIdentifier:(id)a3;
- (id)currentProcess;
- (id)processForIdentity:(id)a3;
- (id)processForPID:(int)a3;
- (id)processForVersionedPID:(int64_t)a3;
- (id)processesForBundleIdentifier:(id)a3;
- (id)registerProcessForAuditToken:(id *)a3;
- (id)registerProcessForHandle:(id)a3;
- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4;
- (void)_bootstrap_consumeLock_addProcess:(id)a3;
- (void)_bootstrap_consumeLock_addProcess:(id)a3 synchronously:(BOOL)a4;
- (void)_noteShellInitializationComplete;
- (void)_notifyObserversUsingBlock:(id)a3 completion:(id)a4;
- (void)_removeProcess:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)init;
- (void)launchProcessWithContext:(id)a3;
- (void)noteProcessAssertionStateDidChange:(id)a3;
- (void)noteProcessDidLaunch:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDefaultWatchdogPolicy:(id)a3;
@end

@implementation FBProcessManager

- (id)processForPID:(int)a3
{
  if (a3 < 1)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)&a3;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_processesByPID = self->_lock_processesByPID;
    v7 = [NSNumber numberWithInt:v3];
    v8 = [(NSMutableDictionary *)lock_processesByPID objectForKey:v7];

    os_unfair_lock_unlock(p_lock);
  }

  return v8;
}

- (id)processesForBundleIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(FBProcessManager *)self allProcesses];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) { {
          objc_enumerationMutation(v6);
        }
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 bundleIdentifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13) { {
          [v5 addObject:v11];
        }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)allProcesses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_lock_processesByPID allValues];
  v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  if (v5) { {
    v6 = v5;
  }
  }
  else {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  return v7;
}

void __24__FBProcessManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v8) { {
    [v8 auditToken];
  }
  }
  v11 = [v10 processForVersionedPID:BSVersionedPIDForAuditToken()];
  v12 = v11;
  if (v11) { {
    [v11 _noteStateDidUpdate:v9];
  }
  }
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__FBProcessManager__sharedInstanceCreateIfNeeded___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_sharedInstanceCreateIfNeeded__onceToken != -1) { {
      dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken, block);
    }
    }
  }
  uint64_t v3 = (void *)atomic_load(&_sharedInstanceCreateIfNeeded____SharedManager);

  return v3;
}

+ (id)sharedInstance
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:1];
}

- (id)registerProcessForHandle:(id)a3
{
  id v4 = [a3 auditToken];
  v5 = v4;
  if (v4) { {
    [v4 realToken];
  }
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  v6 = [(FBProcessManager *)self registerProcessForAuditToken:v8];

  return v6;
}

- (id)registerProcessForAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v15 = *(_OWORD *)a3->var0;
  long long v16 = v4;
  uint64_t v5 = BSVersionedPIDForAuditToken();
  if (v5 == -1)
  {
    id v7 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  id v7 = [(FBProcessManager *)self processForVersionedPID:v5];
  if (v7) { {
    goto LABEL_13;
  }
  }
  id v8 = (void *)MEMORY[0x1E4F963E8];
  id v9 = [NSNumber numberWithInt:v6];
  id v14 = 0;
  v10 = [v8 handleForIdentifier:v9 error:&v14];
  id v11 = v14;

  if (!v10)
  {
    v12 = FBLogProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
      [(FBProcessManager *)v11 registerProcessForAuditToken:v12];
    }
    }
    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = [(FBProcessManager *)self _reallyRegisterProcessForHandle:v10];
  if (v6 != [v7 versionedPID])
  {
    v12 = FBLogProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager registerProcessForAuditToken:]();
    }
    }
LABEL_11:
  }
LABEL_13:

  return v7;
}

- (id)processForVersionedPID:(int64_t)a3
{
  if (a3 == -1)
  {
    id v8 = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_processesByVersionedPID = self->_lock_processesByVersionedPID;
    id v7 = [NSNumber numberWithLongLong:a3];
    id v8 = [(NSMutableDictionary *)lock_processesByVersionedPID objectForKey:v7];

    if (!v8)
    {
      lock_processesByPID = self->_lock_processesByPID;
      v10 = [NSNumber numberWithInt:a3];
      id v8 = [(NSMutableDictionary *)lock_processesByPID objectForKey:v10];

      if (v8)
      {
        id v11 = FBLogProcess();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) { {
          -[FBProcessManager processForVersionedPID:]();
        }
        }
      }
    }
    os_unfair_lock_unlock(p_lock);
  }

  return v8;
}

- (void)noteProcessAssertionStateDidChange:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v4 = +[FBWorkspaceDomain sharedInstance]();
  BOOL v5 = -[FBWorkspaceDomain selfAssertRuntime]((BOOL)v4);

  if (!v5) { {
    return;
  }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  uint64_t v6 = [(FBProcessManager *)self allProcesses];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned __int8 v9 = 0;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v10) { {
          objc_enumerationMutation(v6);
        }
        }
        unsigned __int8 v9 = FBWorkspaceAssertionStateCombine(v9, [*(id *)(*((void *)&v42 + 1) + 8 * i) assertionState]);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  os_unfair_lock_lock(&self->_bootstrapLock);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v12 = self->_bootstrap_pendingProcesses;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v39 != v15) { {
          objc_enumerationMutation(v12);
        }
        }
        unsigned __int8 v9 = FBWorkspaceAssertionStateCombine(v9, [*(id *)(*((void *)&v38 + 1) + 8 * j) assertionState]);
      }
      uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(&self->_bootstrapLock);
  unsigned __int8 v37 = v9;
  long long v17 = +[FBWorkspaceDomain sharedInstance]();
  long long v18 = -[FBWorkspaceDomain selfAssertionAttributesForWorkspaceState:]((uint64_t)v17, (char *)&v37);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v17) = v37;
  p_lock_assertion = &self->_lock_assertion;
  if (v17 == [(RBSAssertion *)self->_lock_assertion fb_workspaceAssertionState])
  {
    v21 = 0;
  }
  else
  {
    v22 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSStringFromFBWorkspaceAssertionState(v37);
      *(_DWORD *)buf = 138543362;
      v47 = v23;
      _os_log_impl(&dword_1A62FC000, v22, OS_LOG_TYPE_DEFAULT, "Updating self-assertion for unified workspace state: %{public}@", buf, 0xCu);
    }
    v21 = *p_lock_assertion;
    v24 = *p_lock_assertion;
    *p_lock_assertion = 0;

    if (v18)
    {
      v25 = self;
      id v26 = objc_alloc(MEMORY[0x1E4F96318]);
      v27 = [MEMORY[0x1E4F96478] currentProcess];
      v28 = (void *)[v26 initWithExplanation:@"FBWorkspace Self-Assert" target:v27 attributes:v18];
      objc_storeStrong((id *)&self->_lock_assertion, v28);

      [(RBSAssertion *)self->_lock_assertion fb_setWorkspaceAssertionState:v37];
      lock_assertion = self->_lock_assertion;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke;
      v35[3] = &unk_1E5C498B0;
      v36 = v25;
      v30 = v25;
      [(RBSAssertion *)lock_assertion setInvalidationHandler:v35];

      os_unfair_lock_unlock(p_lock);
      if (v28)
      {
        id v34 = 0;
        char v31 = [v28 acquireWithError:&v34];
        id v32 = v34;
        if ((v31 & 1) == 0)
        {
          v33 = FBLogProcessWorkspace();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) { {
            -[FBProcessManager noteProcessAssertionStateDidChange:](v32);
          }
          }
        }
      }
      goto LABEL_30;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v28 = 0;
LABEL_30:
  if (v21) { {
    [(RBSAssertion *)v21 invalidate];
  }
  }
}

void __58__FBProcessManager__notifyObserversUsingBlock_completion___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 80));
  v2 = (void *)[*(id *)(a1[4] + 112) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 80));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(a1[5] + 16))(a1[5]);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = a1[6];
  if (v8) { {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  }
}

uint64_t __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_108(uint64_t a1, void *a2)
{
  return [a2 processManager:*(void *)(a1 + 32) didAddProcess:*(void *)(a1 + 40)];
}

void __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 128);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 80));
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 noteProcessPublished];
  }
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:0];
}

id __45__FBProcessManager_launchProcessWithContext___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _createProcessWithExecutionContext:*(void *)(a1 + 40) error:0];
}

- (id)_createProcessWithExecutionContext:(id)a3 error:(id *)a4
{
  return [(FBProcessManager *)self _bootstrapProcessWithExecutionContext:a3 synchronously:1 error:a4];
}

- (id)_bootstrapProcessWithExecutionContext:(id)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"executionContext != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:]();
    }
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A631D254);
  }
  long long v9 = v8;
  long long v10 = (void *)[v8 copy];

  long long v11 = [v10 completion];
  [v10 setCompletion:0];
  long long v12 = [v10 identity];
  uint64_t v13 = v12;
  if (!v12 || ![v12 supportsLaunchingDirectly])
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_3;
    v44[3] = &unk_1E5C4A4C0;
    id v45 = v13;
    objc_msgSend(v19, "bs_errorWithDomain:code:configuration:", @"FBProcessManager", 1, v44);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_11:
      if (v18) { {
        goto LABEL_12;
      }
      }
      id v16 = 0;
      goto LABEL_38;
    }
LABEL_10:
    uint64_t v20 = +[FBProcess calloutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_5;
    block[3] = &unk_1E5C4A7A8;
    id v40 = v11;
    id v18 = v18;
    id v39 = v18;
    dispatch_async(v20, block);

    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_bootstrapLock);
  uint64_t v14 = FBLogProcess();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v55 = v13;
    _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_DEFAULT, "Asked to bootstrap a new process with identity: %{public}@", buf, 0xCu);
  }

  uint64_t v15 = [(FBProcessManager *)self processForIdentity:v13];
  if (v15)
  {
    id v16 = (id)v15;
    long long v17 = (void *)MEMORY[0x1E4F28C58];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_2;
    v46[3] = &unk_1E5C4A4C0;
    id v47 = v13;
    objc_msgSend(v17, "bs_errorWithDomain:code:configuration:", @"FBProcessManager", 2, v46);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_bootstrapLock);

    if (!v11) { {
      goto LABEL_34;
    }
    }
    goto LABEL_32;
  }
  BOOL v37 = v6;
  v35 = a5;
  v36 = self;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v22 = self->_bootstrap_pendingProcesses;
  uint64_t v23 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v51;
LABEL_19:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v51 != v25) { {
        objc_enumerationMutation(v22);
      }
      }
      v27 = *(void **)(*((void *)&v50 + 1) + 8 * v26);
      v28 = [v27 identity];
      char v29 = [v28 isEqual:v13];

      if (v29) { {
        break;
      }
      }
      if (v24 == ++v26)
      {
        uint64_t v24 = [(NSMutableSet *)v22 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v24) { {
          goto LABEL_19;
        }
        }
        goto LABEL_25;
      }
    }
    id v16 = v27;

    if (!v16) { {
      goto LABEL_28;
    }
    }
    v30 = (void *)MEMORY[0x1E4F28C58];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke;
    v48[3] = &unk_1E5C4A4C0;
    id v49 = v13;
    objc_msgSend(v30, "bs_errorWithDomain:code:configuration:", @"FBProcessManager", 2, v48);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    self = v36;
  }
  else
  {
LABEL_25:

LABEL_28:
    char v31 = FBLogProcess();
    self = v36;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v55 = v37;
      *(_WORD *)&v55[4] = 2114;
      *(void *)&v55[6] = v13;
      _os_log_impl(&dword_1A62FC000, v31, OS_LOG_TYPE_DEFAULT, "Creating process (sync=%{BOOL}u) with identity: %{public}@", buf, 0x12u);
    }

    id v16 = +[FBProcess createProcessWithExecutionContext:v10];
    [(NSMutableSet *)v36->_bootstrap_pendingProcesses addObject:v16];
    id v18 = 0;
  }
  a5 = v35;
  [(FBProcessManager *)self _bootstrap_consumeLock_addProcess:v16 synchronously:v37];
  if (v11)
  {
LABEL_32:
    if (v16)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_4;
      v41[3] = &unk_1E5C4B618;
      id v43 = v11;
      id v42 = v18;
      [v16 _executeBlockAfterBootstrap:v41];

      goto LABEL_34;
    }
    goto LABEL_10;
  }
LABEL_34:
  if (v18)
  {
    if (v16)
    {
      v21 = FBLogProcess();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [v18 localizedFailureReason];
        *(_DWORD *)buf = 138543362;
        *(void *)v55 = v32;
        _os_log_impl(&dword_1A62FC000, v21, OS_LOG_TYPE_DEFAULT, "Did not create a new process: %{public}@", buf, 0xCu);
      }
LABEL_15:

      goto LABEL_38;
    }
LABEL_12:
    v21 = FBLogProcess();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _bootstrapProcessWithExecutionContext:synchronously:error:](v18);
    }
    }
    id v16 = 0;
    goto LABEL_15;
  }
LABEL_38:
  if (a5) { {
    *a5 = v18;
  }
  }
  os_unfair_lock_assert_not_owner(&self->_bootstrapLock);

  return v16;
}

- (id)processForIdentity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  BOOL v6 = [(NSMutableDictionary *)self->_lock_processesByIdentity objectForKey:v5];

  uint64_t v7 = [v6 lastObject];

  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_bootstrap_consumeLock_addProcess:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    p_bootstrapLock = &self->_bootstrapLock;
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    if (v4)
    {
      [(FBProcessManager *)self _bootstrap_consumeLock_addProcess:v7];
    }
    else
    {
      bootstrapQueue = self->_bootstrapQueue;
      id v12 = v7;
      long long v10 = (void *)BSDispatchBlockCreateWithCurrentQualityOfService();
      dispatch_async(bootstrapQueue, v10);

      os_unfair_lock_unlock(p_bootstrapLock);
    }
    os_unfair_lock_assert_not_owner(p_bootstrapLock);
  }
  else
  {
    long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _bootstrap_consumeLock_addProcess:synchronously:]();
    }
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_bootstrap_consumeLock_addProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_assert_owner(&self->_bootstrapLock);
    if ([(NSMutableSet *)self->_bootstrap_bootstrappingProcesses containsObject:v5])
    {
      os_unfair_lock_unlock(&self->_bootstrapLock);
      [v5 bootstrapLock:0];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke;
      v7[3] = &unk_1E5C4B668;
      v7[4] = self;
      id v8 = v5;
      [v8 bootstrapLock:v7];
      os_unfair_lock_assert_not_owner(&self->_bootstrapLock);
    }
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _bootstrap_consumeLock_addProcess:]();
    }
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = a2;
  [v4 addObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  LODWORD(v3) = [v5 bootstrapWithDelegate:*(void *)(a1 + 32)];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  if (v3)
  {
    id v6 = FBLogProcess();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v7;
      _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, "Adding: %{public}@", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    id v8 = [*(id *)(a1 + 40) identity];
    long long v9 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:v8];
    long long v10 = v9;
    if (v9)
    {
      [v9 addObject:*(void *)(a1 + 40)];
    }
    else
    {
      id v12 = *(void **)(*(void *)(a1 + 32) + 104);
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 40)];
      [v12 setObject:v13 forKey:v8];
    }
    uint64_t v14 = [*(id *)(a1 + 40) pid];
    if ((int)v14 >= 1)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(void **)(*(void *)(a1 + 32) + 88);
      long long v17 = [NSNumber numberWithInt:v14];
      [v16 setObject:v15 forKey:v17];
    }
    uint64_t v18 = [*(id *)(a1 + 40) versionedPID];
    if (v18 != -1)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 96);
      v21 = [NSNumber numberWithLongLong:v18];
      [v20 setObject:v19 forKey:v21];
    }
    v22 = +[FBWorkspaceDomain sharedInstance]();
    if (-[FBWorkspaceDomain monitorAllSuspendableProcesses]((BOOL)v22)) { {
      goto LABEL_15;
    }
    }
    uint64_t v24 = [*(id *)(a1 + 40) rbsHandle];
    int v25 = objc_msgSend(v24, "fb_canTaskSuspend");

    if (!v25)
    {
      uint64_t v23 = 0;
      goto LABEL_23;
    }
    v22 = [*(id *)(a1 + 40) processPredicate];
    if (!v22 || ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v22] & 1) != 0)
    {
LABEL_15:
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v26 = *(void **)(*(void *)(a1 + 32) + 64);
      if (v26)
      {
        [v26 addObject:v22];
      }
      else
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA80] setWithObject:v22];
        uint64_t v32 = *(void *)(a1 + 32);
        v33 = *(void **)(v32 + 64);
        *(void *)(v32 + 64) = v31;
      }
      uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 64) allObjects];
    }

LABEL_23:
    v27 = *(void **)(a1 + 32);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_108;
    v38[3] = &unk_1E5C4B640;
    v38[4] = v27;
    id v39 = *(id *)(a1 + 40);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_2;
    v36[3] = &unk_1E5C497A0;
    v28 = *(void **)(a1 + 40);
    v36[4] = *(void *)(a1 + 32);
    id v37 = v28;
    [v27 _notifyObserversUsingBlock:v38 completion:v36];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    char v29 = *(os_unfair_lock_s **)(a1 + 32);
    if (v23)
    {
      os_unfair_lock_lock(v29 + 11);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      v30 = *(void **)(*(void *)(a1 + 32) + 32);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_3;
      v34[3] = &unk_1E5C4B5A8;
      id v35 = v23;
      [v30 updateConfiguration:v34];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 44));
    }
    else
    {
      os_unfair_lock_unlock(v29 + 10);
    }

    return;
  }
  long long v11 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 40);

  os_unfair_lock_unlock(v11);
}

- (void)noteProcessDidLaunch:(id)a3
{
}

- (void)_notifyObserversUsingBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FBProcessManager__notifyObserversUsingBlock_completion___block_invoke;
  block[3] = &unk_1E5C4B6B0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(callOutQueue, block);
}

- (void)launchProcessWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identity];

  if (v5)
  {
    id v6 = (void *)[v4 copy];

    bootstrapQueue = self->_bootstrapQueue;
    long long v11 = v6;
    id v8 = v6;
    id v9 = (void *)BSDispatchBlockCreateWithCurrentQualityOfService();
    dispatch_async(bootstrapQueue, v9);
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[context identity] != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager launchProcessWithContext:]();
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32)) { {
    a3 = *(void *)(a1 + 32);
  }
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3);
}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Ignoring execution context."];
  [v3 setFailureReason:@"A pending process for %@ already exists.", *(void *)(a1 + 32)];
  [v3 setCodeDescription:@"already-exists"];
}

uint64_t __68__FBProcessManager__bootstrap_consumeLock_addProcess_synchronously___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return objc_msgSend(v2, "_bootstrap_consumeLock_addProcess:synchronously:", v3, 1);
}

- (id)_createProcessFutureWithExecutionContext:(id)a3 error:(id *)a4
{
  return [(FBProcessManager *)self _bootstrapProcessWithExecutionContext:a3 synchronously:0 error:a4];
}

void __50__FBProcessManager__sharedInstanceCreateIfNeeded___block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  atomic_store((unint64_t)v1, &_sharedInstanceCreateIfNeeded____SharedManager);
}

- (FBProcessManager)init
{
  v49.receiver = self;
  v49.super_class = (Class)FBProcessManager;
  uint64_t v2 = [(FBProcessManager *)&v49 init];
  if (!v2) { {
    return v2;
  }
  }
  uint64_t v3 = [MEMORY[0x1E4F62820] concurrent];
  uint64_t v4 = BSDispatchQueueCreate();
  bootstrapQueue = v2->_bootstrapQueue;
  v2->_bootstrapQueue = (OS_dispatch_queue *)v4;

  id v6 = [MEMORY[0x1E4F62820] serial];
  id v7 = [v6 serviceClass:33];
  uint64_t v8 = BSDispatchQueueCreate();
  callOutQueue = v2->_callOutQueue;
  v2->_callOutQueue = (OS_dispatch_queue *)v8;

  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  lock_processesByPID = v2->_lock_processesByPID;
  v2->_lock_processesByPID = (NSMutableDictionary *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  lock_processesByVersionedPID = v2->_lock_processesByVersionedPID;
  v2->_lock_processesByVersionedPID = (NSMutableDictionary *)v12;

  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  lock_processesByIdentity = v2->_lock_processesByIdentity;
  v2->_lock_processesByIdentity = (NSMutableDictionary *)v14;

  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
  lock_observers = v2->_lock_observers;
  v2->_lock_observers = (NSHashTable *)v16;

  v2->_bootstrapLock._os_unfair_lock_opaque = 0;
  uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
  bootstrap_pendingProcesses = v2->_bootstrap_pendingProcesses;
  v2->_bootstrap_pendingProcesses = (NSMutableSet *)v18;

  uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
  bootstrap_bootstrappingProcesses = v2->_bootstrap_bootstrappingProcesses;
  v2->_bootstrap_bootstrappingProcesses = (NSMutableSet *)v20;

  uint64_t v22 = +[FBApplicationProcessWatchdogPolicy defaultPolicy];
  noDirectAccess_defaultWatchdogPolicy = v2->_noDirectAccess_defaultWatchdogPolicy;
  v2->_noDirectAccess_defaultWatchdogPolicy = (FBProcessWatchdogProviding *)v22;

  uint64_t v24 = +[FBProcess createCurrentProcess];
  currentProcess = v2->_currentProcess;
  v2->_currentProcess = (FBProcess *)v24;

  uint64_t v26 = v2->_currentProcess;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __24__FBProcessManager_init__block_invoke;
  v47[3] = &unk_1E5C4B558;
  v27 = v2;
  v48 = v27;
  [(FBProcess *)v26 bootstrapLock:v47];
  v28 = v2->_currentProcess;
  if (v28)
  {
    char v29 = v2->_lock_processesByPID;
    v30 = [NSNumber numberWithInt:getpid()];
    [(NSMutableDictionary *)v29 setObject:v28 forKey:v30];

    uint64_t v31 = v2->_lock_processesByVersionedPID;
    uint64_t v32 = v2->_currentProcess;
    v33 = objc_msgSend(NSNumber, "numberWithLongLong:", -[FBProcess versionedPID](v32, "versionedPID"));
    [(NSMutableDictionary *)v31 setObject:v32 forKey:v33];

    id v34 = v2->_lock_processesByIdentity;
    id v35 = [MEMORY[0x1E4F1CA48] arrayWithObject:v2->_currentProcess];
    v36 = [(FBProcess *)v2->_currentProcess identity];
    [(NSMutableDictionary *)v34 setObject:v35 forKey:v36];

    id v37 = (void *)MEMORY[0x1E4F96418];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __24__FBProcessManager_init__block_invoke_21;
    v45[3] = &unk_1E5C4B5A8;
    long long v38 = v27;
    v46 = v38;
    uint64_t v39 = [v37 monitorWithConfiguration:v45];
    processMonitor = v38->_processMonitor;
    v38->_processMonitor = (RBSProcessMonitor *)v39;

    long long v44 = v38;
    id v41 = (id)BSLogAddStateCaptureBlockWithTitle();

    return v2;
  }
  id v43 = [NSString stringWithFormat:@"Must have a current process."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBProcessManager init]();
  }
  }
  [v43 UTF8String];
  result = (FBProcessManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __24__FBProcessManager_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 bootstrapWithDelegate:*(void *)(a1 + 32)];
}

void __24__FBProcessManager_init__block_invoke_21(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F96448]);
  [v4 setValues:3];
  [v3 setServiceClass:25];
  [v3 setStateDescriptor:v4];
  id v5 = +[FBWorkspaceDomain sharedInstance]();
  BOOL v6 = -[FBWorkspaceDomain monitorAllSuspendableProcesses]((BOOL)v5);

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F96430] predicateMatchingSuspendableProcesses];
    v11[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v3 setPredicates:v8];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __24__FBProcessManager_init__block_invoke_2;
  v9[3] = &unk_1E5C4B580;
  id v10 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v9];
}

uint64_t __24__FBProcessManager_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) description];
}

- (void)dealloc
{
  id v4 = [NSString stringWithFormat:@"this object shouldn't go away"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    long long v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = @"FBProcessManager.m";
    __int16 v16 = 1024;
    int v17 = 138;
    __int16 v18 = 2114;
    uint64_t v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)currentProcess
{
  return self->_currentProcess;
}

- (FBApplicationProcess)systemApplicationProcess
{
  if ([(FBProcess *)self->_currentProcess isApplicationProcess]) { {
    id v3 = self->_currentProcess;
  }
  }
  else {
    id v3 = 0;
  }

  return (FBApplicationProcess *)v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_lock_observers containsObject:v4]) { {
    [(NSHashTable *)self->_lock_observers addObject:v4];
  }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_lock_observers containsObject:v4]) { {
    [(NSHashTable *)self->_lock_observers removeObject:v4];
  }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)description
{
  id v3 = [(FBProcessManager *)self allProcesses];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_24];

  id v5 = [MEMORY[0x1E4F62810] builderWithObject:self];
  [v5 appendArraySection:v4 withName:@"processes" skipIfEmpty:0];
  BOOL v6 = [v5 build];

  return (NSString *)v6;
}

uint64_t __31__FBProcessManager_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 pid];
  int v5 = [v4 pid];

  if ((int)a2 < v5) { {
    return -1;
  }
  }
  else {
    return 1;
  }
}

- (id)allApplicationProcesses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = [(NSMutableDictionary *)self->_lock_processesByPID objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) { {
          objc_enumerationMutation(v5);
        }
        }
        __int16 v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isApplicationProcess]) { {
          [v4 addObject:v10];
        }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)applicationProcessForPID:(int)a3
{
  id v3 = [(FBProcessManager *)self processForPID:*(void *)&a3];
  if ([v3 isApplicationProcess]) { {
    id v4 = v3;
  }
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)applicationProcessesForBundleIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(FBProcessManager *)self allProcesses];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) { {
          objc_enumerationMutation(v6);
        }
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 isApplicationProcess])
        {
          long long v12 = [v11 bundleIdentifier];
          int v13 = [v12 isEqualToString:v4];

          if (v13) { {
            [v5 addObject:v11];
          }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_createProcessFutureForProcessHandle:(id)a3 error:(id *)a4
{
  return [(FBProcessManager *)self _bootstrapProcessWithHandle:a3 synchronously:0 error:a4];
}

- (void)_noteShellInitializationComplete
{
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__FBProcessManager__noteShellInitializationComplete__block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_async(callOutQueue, block);
}

void __52__FBProcessManager__noteShellInitializationComplete__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 1;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allValues];
  id v3 = (void *)[v2 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "noteProcessPublished", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FBProcessManager *)self defaultWatchdogPolicy];
  long long v9 = [v8 watchdogPolicyForProcess:v7 eventContext:v6];

  return v9;
}

void __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) { {
    __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke_cold_1(v6);
  }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(id *)(v8 + 120) == v5)
  {
    [v5 invalidate];
    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    long long v12 = +[FBProcess calloutQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke_54;
    block[3] = &unk_1E5C49AE0;
    id v14 = *(id *)(a1 + 32);
    dispatch_after(v11, v12, block);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 80));
  }
}

uint64_t __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteProcessAssertionStateDidChange:0];
}

- (id)_reallyRegisterProcessForHandle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    dispatch_time_t v11 = 0;
LABEL_8:

    return v11;
  }
  NSClassFromString(&cfstr_Rbsprocesshand.isa);
  if (objc_opt_isKindOfClass())
  {

    id v5 = [v4 identity];
    id v6 = [v5 hostIdentifier];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = -[FBProcessManager processForPID:](self, "processForPID:", [v6 pid]);

      if (!v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F963E8] handleForIdentifier:v7 error:0];
        id v10 = [(FBProcessManager *)self _reallyRegisterProcessForHandle:v9];
      }
    }
    dispatch_time_t v11 = [(FBProcessManager *)self _bootstrapProcessWithHandle:v4 synchronously:1 error:0];

    goto LABEL_8;
  }
  int v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBProcessManager _reallyRegisterProcessForHandle:]();
  }
  }
  [v13 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Ignoring execution context."];
  [v3 setFailureReason:@"A process for %@ already exists.", *(void *)(a1 + 32)];
  [v3 setCodeDescription:@"already-exists"];
}

void __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFailureDescription:@"Ignoring execution context."];
  [v3 setFailureReason:@"RunningBoard does not support directly launching %@", *(void *)(a1 + 32)];
  [v3 setCodeDescription:@"not-supported"];
}

uint64_t __78__FBProcessManager__bootstrapProcessWithExecutionContext_synchronously_error___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_bootstrapProcessWithHandle:(id)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v58[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    id v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processHandle != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:]();
    }
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6361054);
  }
  uint64_t v9 = v8;
  [v8 auditToken];
  uint64_t v10 = BSVersionedPIDForAuditToken();
  if (v10 != -1)
  {
    uint64_t v11 = v10;
    p_bootstrapLock = &self->_bootstrapLock;
    os_unfair_lock_lock(&self->_bootstrapLock);
    int v13 = FBLogProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)long long v53 = v9;
      _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "Asked to bootstrap a new process for handle: %{public}@", buf, 0xCu);
    }

    uint64_t v14 = [(FBProcessManager *)self processForVersionedPID:v11];
    if (v14)
    {
      id v15 = (id)v14;
      long long v16 = FBLogProcess();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)long long v53 = v15;
        _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "A process already exists for this handle: %{public}@", buf, 0xCu);
      }

      long long v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28588];
      long long v51 = @"A process already exists for this handle.";
      long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v19 = [v17 errorWithDomain:@"FBProcessManager" code:2 userInfo:v18];

      os_unfair_lock_unlock(p_bootstrapLock);
      if (!a5) { {
        goto LABEL_10;
      }
      }
    }
    else
    {
      BOOL v42 = v6;
      id v43 = a5;
      long long v44 = [v9 identity];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v23 = self->_bootstrap_pendingProcesses;
      uint64_t v24 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v47;
LABEL_21:
        uint64_t v27 = 0;
        while (1)
        {
          if (*(void *)v47 != v26) { {
            objc_enumerationMutation(v23);
          }
          }
          v28 = *(void **)(*((void *)&v46 + 1) + 8 * v27);
          uint64_t v29 = [v28 versionedPID];
          if (v11 == v29) { {
            break;
          }
          }
          if (v29 == -1)
          {
            v30 = [v28 identity];
            char v31 = [v44 isEqual:v30];

            if (v31) { {
              break;
            }
            }
          }
          if (v25 == ++v27)
          {
            uint64_t v25 = [(NSMutableSet *)v23 countByEnumeratingWithState:&v46 objects:v56 count:16];
            if (v25) { {
              goto LABEL_21;
            }
            }
            goto LABEL_29;
          }
        }
        id v15 = v28;

        if (!v15) { {
          goto LABEL_34;
        }
        }
        uint64_t v32 = FBLogProcess();
        a5 = v43;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)long long v53 = v15;
          _os_log_impl(&dword_1A62FC000, v32, OS_LOG_TYPE_DEFAULT, "A pending process already exists for this handle: %{public}@", buf, 0xCu);
        }

        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28588];
        v55 = @"A pending process already exists for this handle.";
        id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        uint64_t v19 = [v33 errorWithDomain:@"FBProcessManager" code:2 userInfo:v34];

        p_bootstrapLock = &self->_bootstrapLock;
        BOOL v35 = v42;
      }
      else
      {
LABEL_29:

LABEL_34:
        v36 = FBLogProcess();
        a5 = v43;
        BOOL v35 = v42;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v53 = v42;
          *(_WORD *)&v53[4] = 2114;
          *(void *)&v53[6] = v9;
          _os_log_impl(&dword_1A62FC000, v36, OS_LOG_TYPE_DEFAULT, "Creating process (sync=%{BOOL}u) for handle: %{public}@", buf, 0x12u);
        }

        id v15 = +[FBProcess createProcessWithHandle:v9];
        [(NSMutableSet *)self->_bootstrap_pendingProcesses addObject:v15];
        uint64_t v19 = 0;
        p_bootstrapLock = &self->_bootstrapLock;
      }
      [(FBProcessManager *)self _bootstrap_consumeLock_addProcess:v15 synchronously:v35];
      if (v35 && v11 != [v15 versionedPID])
      {
        id v37 = FBLogProcess();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          long long v38 = NSStringFromBSVersionedPID();
          *(_DWORD *)buf = 138543618;
          *(void *)long long v53 = v38;
          *(_WORD *)&v53[8] = 2114;
          *(void *)&v53[10] = v15;
          _os_log_impl(&dword_1A62FC000, v37, OS_LOG_TYPE_DEFAULT, "resolved process does not match handle %{public}@: %{public}@", buf, 0x16u);
        }
        id v45 = 0;
        uint64_t v39 = [(FBProcessManager *)self _bootstrapProcessWithHandle:v9 synchronously:1 error:&v45];
        id v40 = v45;

        id v15 = (id)v39;
        uint64_t v19 = v40;
      }

      if (!a5) { {
        goto LABEL_10;
      }
      }
    }
    *a5 = v19;
LABEL_10:
    os_unfair_lock_assert_not_owner(p_bootstrapLock);
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v20 = FBLogProcess();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) { {
    -[FBProcessManager _bootstrapProcessWithHandle:synchronously:error:]();
  }
  }

  if (a5)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F28588];
    v58[0] = @"Specified process is not valid.";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    [v21 errorWithDomain:@"FBProcessManager" code:1 userInfo:v19];
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  id v15 = 0;
LABEL_16:

  return v15;
}

uint64_t __54__FBProcessManager__bootstrap_consumeLock_addProcess___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

- (void)_removeProcess:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBProcessManager _removeProcess:]();
    }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6361428);
  }
  id v5 = v4;
  [v4 bootstrapLock:&__block_literal_global_111];
  BOOL v6 = FBLogProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v5;
    _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, "Removing: %{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_bootstrapLock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [v5 identity];
  if (v7)
  {
    lock_processesByIdentity = self->_lock_processesByIdentity;
    uint64_t v9 = [v5 identity];
    uint64_t v10 = [(NSMutableDictionary *)lock_processesByIdentity objectForKey:v9];

    if ([v10 containsObject:v5])
    {
      if ([v10 count] == 1) { {
        [(NSMutableDictionary *)self->_lock_processesByIdentity removeObjectForKey:v7];
      }
      }
      else {
        [v10 removeObject:v5];
      }
    }
  }
  uint64_t v11 = [v5 pid];
  if ((int)v11 >= 1)
  {
    lock_processesByPID = self->_lock_processesByPID;
    int v13 = [NSNumber numberWithInt:v11];
    [(NSMutableDictionary *)lock_processesByPID removeObjectForKey:v13];
  }
  uint64_t v14 = +[FBWorkspaceDomain sharedInstance]();
  BOOL v15 = -[FBWorkspaceDomain monitorAllSuspendableProcesses]((BOOL)v14);

  if (v15)
  {
    long long v16 = 0;
  }
  else
  {
    long long v17 = [v5 processPredicate];
    if (v17
      && [(NSMutableSet *)self->_bootstrap_processPredicates containsObject:v17])
    {
      [(NSMutableSet *)self->_bootstrap_processPredicates removeObject:v17];
      long long v16 = [(NSMutableSet *)self->_bootstrap_processPredicates allObjects];
    }
    else
    {
      long long v16 = 0;
    }
  }
  uint64_t v18 = [v5 versionedPID];
  if (v18 != -1)
  {
    lock_processesByVersionedPID = self->_lock_processesByVersionedPID;
    uint64_t v20 = [NSNumber numberWithLongLong:v18];
    [(NSMutableDictionary *)lock_processesByVersionedPID removeObjectForKey:v20];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    os_unfair_lock_lock(&self->_bootstrapPredicatesLock);
    os_unfair_lock_unlock(&self->_bootstrapLock);
    processMonitor = self->_processMonitor;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __35__FBProcessManager__removeProcess___block_invoke_112;
    v26[3] = &unk_1E5C4B5A8;
    id v27 = v16;
    [(RBSProcessMonitor *)processMonitor updateConfiguration:v26];
    os_unfair_lock_unlock(&self->_bootstrapPredicatesLock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_bootstrapLock);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __35__FBProcessManager__removeProcess___block_invoke_2;
  v24[3] = &unk_1E5C4B640;
  v24[4] = self;
  id v25 = v5;
  id v22 = v5;
  [(FBProcessManager *)self _notifyObserversUsingBlock:v24 completion:0];
}

uint64_t __35__FBProcessManager__removeProcess___block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __35__FBProcessManager__removeProcess___block_invoke_112(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

uint64_t __35__FBProcessManager__removeProcess___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 processManager:*(void *)(a1 + 32) didRemoveProcess:*(void *)(a1 + 40)];
}

- (FBProcessWatchdogProviding)defaultWatchdogPolicy
{
  return (FBProcessWatchdogProviding *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDefaultWatchdogPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProcess, 0);
}

- (void)init
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)processForVersionedPID:.cold.1()
{
  v0 = NSStringFromBSVersionedPID();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_8_3(&dword_1A62FC000, v1, v2, "Returning %{public}@, even though it does not match provided vpid %{public}@", v3, v4, v5, v6, v7);
}

- (void)registerProcessForAuditToken:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 succinctDescription];
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2114;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "Unable to resolve process %d: %{public}@", (uint8_t *)v6, 0x12u);
}

- (void)registerProcessForAuditToken:.cold.2()
{
  v0 = NSStringFromBSVersionedPID();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_8_3(&dword_1A62FC000, v1, v2, "Resolved %{public}@, even though it does not match provided audit token %{public}@", v3, v4, v5, v6, v7);
}

- (void)launchProcessWithContext:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteProcessAssertionStateDidChange:(void *)a1 .cold.1(void *a1)
{
  SEL v1 = [a1 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "Self-assertion acquisition failed: %{public}@", v4, v5, v6, v7, v8);
}

void __55__FBProcessManager_noteProcessAssertionStateDidChange___block_invoke_cold_1(void *a1)
{
  SEL v1 = [a1 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "Self-assertion invalidated: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_reallyRegisterProcessForHandle:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_bootstrapProcessWithExecutionContext:synchronously:error:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_bootstrapProcessWithExecutionContext:(void *)a1 synchronously:error:.cold.2(void *a1)
{
  SEL v1 = [a1 localizedFailureReason];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "Failed to create a new process: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_bootstrapProcessWithHandle:synchronously:error:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_bootstrapProcessWithHandle:synchronously:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_ERROR, "Not registering process %{public}@ with an invalid audit token.", v1, 0xCu);
}

- (void)_bootstrap_consumeLock_addProcess:synchronously:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_bootstrap_consumeLock_addProcess:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_removeProcess:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end