@interface FBWorkspace
- (BOOL)test_rejectAllSceneClients;
- (BSAuditToken)auditToken;
- (FBProcess)process;
- (FBWorkspace)init;
- (FBWorkspaceDelegate)delegate;
- (NSString)description;
- (id)_acquireAssertionForReason:(uint64_t)a3 withState:;
- (id)_connectionQueue;
- (id)_queue;
- (id)_sceneForHost:(id)a3;
- (id)_sceneForIdentity:(id)a3;
- (id)_unregisterSceneForHost:(id)a3;
- (id)createServiceQueue;
- (id)initWithParentProcess:(id *)a1;
- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7;
- (uint64_t)assertionState;
- (void)_assertLocked;
- (void)_callOutQueue_requestScene:(id)a3;
- (void)_dropLaunchAssertion;
- (void)_enableLegacyRequests:(uint64_t)a1;
- (void)_handleSceneRequest:(id)a3;
- (void)_lock;
- (void)_noteProcessBootstrapped:(void *)a3 withHandle:(void *)a4 assertion:(void *)a5 outgoingEndpoint:;
- (void)_noteProcessDidInvalidate:(uint64_t)a1;
- (void)_queue_unverifiedOutgoingConnection:(void *)a3 didError:;
- (void)_resolveSceneLifecycleStateAndInterruptionPolicy;
- (void)_setIncomingConnection:(uint64_t)a1;
- (void)_terminateGracefully:(void *)a3 withTransitionContext:;
- (void)_terminateWithReason:(id)a3;
- (void)_unlock;
- (void)_updateProcessAssertionState;
- (void)_workspaceSceneLifecycleStateChanged:(void *)a1;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)createSceneWithOptions:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handshakeWithRemnants:(id)a3;
- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5;
- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7;
- (void)requestSceneWithOptions:(id)a3 completion:(id)a4;
- (void)sceneID:(id)a3 didReceiveActions:(id)a4 forExtension:(id)a5;
- (void)sceneID:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)sceneID:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)sendActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)test_setRejectAllSceneClients:(BOOL)a3;
- (void)unregisterHost:(id)a3;
- (void)workspaceID:(id)a3 sendActions:(id)a4 completion:(id)a5;
@end

@implementation FBWorkspace

- (id)_sceneForHost:(id)a3
{
  id v4 = a3;
  v5 = [v4 definition];
  v6 = [v5 identity];
  v7 = [(FBWorkspace *)self _sceneForIdentity:v6];

  id v8 = [v7 host];

  if (v8 != v4)
  {

    v7 = 0;
  }

  return v7;
}

- (id)_sceneForIdentity:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Fbssceneidenti.isa);
  if (!v4)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _sceneForIdentity:]();
    }
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6305348);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _sceneForIdentity:]();
    }
    }
    goto LABEL_11;
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSMutableDictionary *)self->_lock_identityToSceneMap objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) { {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, a2 != 0);
  }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2;
  v8[3] = &unk_1E5C497A0;
  v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v9 = v6;
  uint64_t v10 = v7;
  [v5 _launchDidComplete:a2 != 0 finalizeBlock:v8];
}

- (void)_resolveSceneLifecycleStateAndInterruptionPolicy
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[FBProcess logProem](a1);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, a3, v5, "%{public}@ Workspace afterlife assertion failed: %{public}@", v6);
}

- (FBProcess)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);

  return (FBProcess *)WeakRetained;
}

uint64_t __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  }
  return result;
}

- (id)_connectionQueue
{
  if (a1)
  {
    a1 = (id *)a1[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_unlock
{
  if (a1) { {
    os_unfair_lock_unlock(a1 + 36);
  }
  }
}

- (void)_lock
{
  if (a1) { {
    os_unfair_lock_lock(a1 + 36);
  }
  }
}

- (void)_workspaceSceneLifecycleStateChanged:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (v3)
    {
      id v6 = v3;
      uint64_t v4 = [v3 identity];
      id v5 = [a1 _sceneForIdentity:v4];

      id v3 = v6;
      if (v5 == v6)
      {
        [a1 _resolveSceneLifecycleStateAndInterruptionPolicy];
        id v3 = v6;
      }
    }
  }
}

- (id)_acquireAssertionForReason:(uint64_t)a3 withState:
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 104);
    id v5 = NSNumber;
    id v6 = a2;
    uint64_t v7 = [v5 numberWithUnsignedChar:a3];
    id v8 = [v4 acquireForReason:v6 withContext:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __77__FBWorkspace_registerHost_settings_initialClientSettings_fromRemnant_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolveSceneLifecycleStateAndInterruptionPolicy];
}

uint64_t __37__FBWorkspace_initWithParentProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProcessAssertionState];
}

void __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2(void *a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2)
  {
    id v3 = (void *)a1[5];
    uint64_t v4 = (void *)a1[6];
    id v5 = (void *)a1[7];
    id v6 = (void *)a1[8];
    uint64_t v7 = (void *)a1[9];
    -[FBWorkspaceScene workspace:sendUpdatedSettings:withDiff:transitionContext:completion:](v2, v3, v4, v5, v6, v7);
  }
  else
  {
    uint64_t v8 = a1[9];
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v13[0] = @"Scene client is invalid.";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v11 = [v9 errorWithDomain:@"FBWorkspace" code:1 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
  }
}

- (void)sceneID:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  v14 = [(FBWorkspace *)self _sceneForIdentity:v10];
  if (v14)
  {
    v15 = +[FBWorkspaceConnection currentWorkspaceConnection]();
    -[FBWorkspaceScene workspace:handleUpdatedClientSettings:transitionContext:fromConnection:]((uint64_t)v14, self, v11, v12, v15);

    if (v13) { {
LABEL_3:
    }
    }
      v13[2](v13, 0);
  }
  else
  {
    v16 = FBLogProcessScene();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:]();
    }
    }

    if (v13) { {
      goto LABEL_3;
    }
    }
  }
}

- (void)_dropLaunchAssertion
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_connectAssertion;
  lock_connectAssertion = self->_lock_connectAssertion;
  self->_lock_connectAssertion = 0;

  os_unfair_lock_unlock(p_lock);
  [(FBWorkspace *)self _updateProcessAssertionState];
  if ([(RBSAssertion *)v4 isValid])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    uint64_t v7 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = -[FBProcess logProem](WeakRetained);
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping launch assertion.", (uint8_t *)&v9, 0xCu);
    }
    [(RBSAssertion *)v4 invalidate];
    [WeakRetained _noteAssertionStateDidChange];
  }
}

- (void)_setIncomingConnection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (*(unsigned char *)(a1 + 151))
    {
      id v6 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _setIncomingConnection:](WeakRetained);
      }
      }

      [v3 invalidate];
    }
    else
    {
      -[FBWorkspaceIncomingConnection workspaceLock_setConnection:](*(void *)(a1 + 24), v3);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_assertLocked
{
  if (a1) { {
    os_unfair_lock_assert_owner(a1 + 36);
  }
  }
}

- (void)_noteProcessBootstrapped:(void *)a3 withHandle:(void *)a4 assertion:(void *)a5 outgoingEndpoint:
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained != v9)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process == _weak_process"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.5();
      }
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6313084);
    }
    if (!v12)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:]();
      }
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63130E8);
    }
    if (!v10 && ([v12 isNullEndpoint] & 1) == 0)
    {
      v37 = [NSString stringWithFormat:@"workspace's process bootstrapped without a handle but still had a valid outgoing endpoint : process=%@ endpoint=%@", v9, v12];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:].cold.4();
      }
      }
      [v37 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63131A4);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      v36 = [NSString stringWithFormat:@"already noted bootstrap of process : previousEndpoint=%@ newEndpoint=%@ newHandle=%@", v14, v12, v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:]();
      }
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6313148);
    }
    objc_storeStrong((id *)(a1 + 64), a5);
    if (!v10 || *(unsigned char *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_3;
      v41[3] = &unk_1E5C49AE0;
      v42 = v9;
      [v42 _launchDidComplete:0 finalizeBlock:v41];
      [v11 invalidate];
      id v15 = v42;
LABEL_31:

      goto LABEL_32;
    }
    if (*(void *)(a1 + 32))
    {
      if (!v11)
      {
LABEL_20:
        v24 = FBAnalyticsLogHangTracerEvent(v9, 1);
        uint64_t v25 = *(void *)(a1 + 24);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke;
        v46[3] = &unk_1E5C4A588;
        id v15 = v24;
        id v50 = v15;
        v26 = v9;
        id v47 = v26;
        id v48 = v11;
        uint64_t v49 = a1;
        -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v25, v46);
        uint64_t v27 = *(void *)(a1 + 72);
        if (v27) { {
          -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:](v27, *(void **)(a1 + 64));
        }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
        if (*(unsigned char *)(a1 + 149))
        {
          v28 = +[FBWorkspaceDomain sharedInstance]();
          uint64_t v29 = -[FBWorkspaceDomain endpointInjectorTargetingProcess:]((uint64_t)v28, v10);
          v30 = *(void **)(a1 + 56);
          *(void *)(a1 + 56) = v29;
        }
        else
        {
          v28 = FBLogProcessWorkspace();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v31 = -[FBProcess logProem](v26);
            *(_DWORD *)buf = 138543362;
            v52 = v31;
            _os_log_impl(&dword_1A62FC000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping workspace endpoint injector.", buf, 0xCu);
          }
        }

        [(id)a1 _updateProcessAssertionState];
        [(id)a1 _resolveSceneLifecycleStateAndInterruptionPolicy];
        if (v11) { {
          [v26 _noteAssertionStateDidChange];
        }
        }
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_176;
        v43[3] = &unk_1E5C497A0;
        v44 = v26;
        id v45 = v10;
        v32 = (void (**)(void))MEMORY[0x1AD0B8C50](v43);
        if (qos_class_self() <= 0x18)
        {
          uint64_t v33 = BSDispatchBlockCreateWithQualityOfService();

          v32 = (void (**)(void))v33;
        }
        v32[2](v32);

        goto LABEL_31;
      }
    }
    else
    {
      v16 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v39 = -[FBProcess logProem](v9);
        *(_DWORD *)buf = 138543362;
        v52 = v39;
        _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering event dispatcher after bootstrap", buf, 0xCu);
      }
      v17 = +[FBWorkspaceEventDispatcher sharedInstance];
      uint64_t v18 = [v17 registerSourceWithProcessHandle:v10];
      v19 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v18;

      if (!v11) { {
        goto LABEL_20;
      }
      }
    }
    unsigned int v20 = objc_msgSend(v11, "fb_workspaceAssertionState");
    if (!v20)
    {
      v38 = [NSString stringWithFormat:@"workspace assertion but no workspace assertion state"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:]();
      }
      }
      [v38 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63131FCLL);
    }
    unsigned int v21 = v20;
    v22 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v40 = -[FBProcess logProem](v9);
      v23 = NSStringFromFBWorkspaceAssertionState(v21);
      *(_DWORD *)buf = 138543618;
      v52 = v40;
      __int16 v53 = 2114;
      v54 = v23;
      _os_log_impl(&dword_1A62FC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Initial launch assertion state: %{public}@.", buf, 0x16u);
    }
    objc_storeStrong((id *)(a1 + 120), a4);
    [*(id *)(a1 + 120) addObserver:a1];
    goto LABEL_20;
  }
LABEL_32:
}

- (void)_updateProcessAssertionState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[FBProcess logProem](a1);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, a3, v5, "%{public}@ Workspace assertion failed: %{public}@", v6);
}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_176(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2_177;
  v3[3] = &unk_1E5C4A5B0;
  objc_copyWeak(&v4, &location);
  [v2 monitorForDeath:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)host:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
  v32[3] = &unk_1E5C4A650;
  id v33 = v15;
  id v16 = a3;
  v17 = (void *)MEMORY[0x1AD0B8C50](v32);
  uint64_t v18 = [(FBWorkspace *)self _sceneForHost:v16];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__FBWorkspace_host_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2;
  block[3] = &unk_1E5C4A0C8;
  id v26 = v18;
  uint64_t v27 = self;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  id v31 = v17;
  id v20 = v17;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v18;
  dispatch_async(queue, block);
}

- (id)_queue
{
  if (a1)
  {
    a1 = (id *)a1[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_enableLegacyRequests:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) { {
    goto LABEL_5;
  }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

  if (WeakRetained == v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    uint64_t v5 = *(void *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    if (v5)
    {
      id v6 = +[FBProcess calloutQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__FBWorkspace__enableLegacyRequests___block_invoke;
      block[3] = &unk_1E5C49AE0;
      void block[4] = a1;
      dispatch_async(v6, block);
    }
LABEL_5:

    return;
  }
  uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process == _weak_process"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspace _enableLegacyRequests:]();
  }
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)handshakeWithRemnants:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssert();
  v65 = [(FBWorkspace *)self process];
  uint64_t v5 = +[FBWorkspaceConnection currentWorkspaceConnection]();
  if (!v5)
  {
    uint64_t v8 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace handshakeWithRemnants:]();
    }
    }
    goto LABEL_13;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    if (-[FBWorkspaceOutgoingConnection queue_isVerified]((BOOL)v5) && ![v4 count])
    {
      uint64_t v8 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [v65 debugDescription];
        *(_DWORD *)buf = 138412290;
        v83 = v46;
        _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "received outgoing handshake : process=%@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = [v65 description];
      int v9 = [MEMORY[0x1E4F62880] currentContext];
      id v10 = [v9 remoteToken];

      id v11 = NSString;
      id v12 = [v4 description];
      id v13 = [v11 stringWithFormat:@"outgoing connection handshake wasn't verified or included remnants: process=%@ remote=%@ remnants=%@", v8, v10, v12];
      [(FBWorkspace *)self _terminateWithReason:v13];

      id v14 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v83 = v8;
        __int16 v84 = 2112;
        v85 = v10;
        __int16 v86 = 1024;
        int v87 = [v4 count];
        _os_log_fault_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_FAULT, "outgoing connection handshake included remnants : process=%@ remote=%@ remnants=%u", buf, 0x1Cu);
      }
    }
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_didReceiveHandshake)
  {
    self->_lock_didReceiveHandshake = 1;
    if (self->_lock_invalidated)
    {
      id v15 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace handshakeWithRemnants:](v15);
      }
      }
      goto LABEL_68;
    }
    lock_eventDispatcherSource = self->_lock_eventDispatcherSource;
    v17 = FBLogProcessWorkspace();
    id v15 = v17;
    if (!lock_eventDispatcherSource)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace handshakeWithRemnants:](v15);
      }
      }
      goto LABEL_68;
    }
    v60 = &self->_lock;
    v61 = v5;
    v66 = self;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v65 debugDescription];
      v19 = [MEMORY[0x1E4F62880] currentContext];
      id v20 = [v19 remoteToken];
      *(_DWORD *)buf = 138412802;
      v83 = v18;
      __int16 v84 = 2112;
      v85 = v20;
      __int16 v86 = 1024;
      int v87 = [v4 count];
      _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_DEFAULT, "received incoming handshake : process=%@ remote=%@ remnants=%u", buf, 0x1Cu);
    }
    v64 = [MEMORY[0x1E4F1CA80] set];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v62 = v4;
    id v21 = v4;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v67 = *(void *)v77;
      id v63 = v21;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v77 != v67) { {
            objc_enumerationMutation(v21);
          }
          }
          uint64_t v25 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          id v26 = [v25 identity];
          uint64_t v27 = v26;
          if (v26)
          {
            id v28 = [v26 internalWorkspaceIdentifier];
            id v29 = [v65 identity];
            id v30 = [v25 parameters];
            if (!v28) { {
              goto LABEL_36;
            }
            }
            id v31 = +[FBWorkspaceDomain sharedInstance]();
            v32 = -[FBWorkspaceDomain reconnectableWorkspaces]((uint64_t)v31);
            int v33 = [v32 containsObject:v28];

            BOOL v34 = !v33 || v29 == 0;
            if (v34 || v30 == 0)
            {
LABEL_36:
              v36 = [(NSMutableDictionary *)v66->_lock_identityToRemnantsMap objectForKey:v27];

              if (!v36)
              {
                uint64_t lock_incomingConnection = (uint64_t)v66->_lock_incomingConnection;
                v72[0] = MEMORY[0x1E4F143A8];
                v72[1] = 3221225472;
                v72[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke_4;
                v72[3] = &unk_1E5C4A600;
                id v73 = v27;
                -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](lock_incomingConnection, v72);
                v38 = v73;
                goto LABEL_42;
              }
            }
            else
            {
              v39 = [(NSMutableDictionary *)v66->_lock_identityToRemnantsMap objectForKey:v27];

              if (v39)
              {
                v38 = 0;
              }
              else
              {
                id v40 = objc_alloc(MEMORY[0x1E4F628C0]);
                v41 = [v27 description];
                v74[0] = MEMORY[0x1E4F143A8];
                v74[1] = 3221225472;
                v74[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke;
                v74[3] = &unk_1E5C4A6E8;
                v74[4] = v66;
                id v75 = v27;
                v38 = (void *)[v40 initWithIdentifier:@"com.apple.frontboard.workspace.remnant" forReason:v41 invalidationBlock:v74];
              }
              v42 = [FBSSceneClientIdentity identityForProcessIdentity:v29];
              id v43 = [[FBSceneRemnant alloc] _initWithIdentity:v27 client:v42 workspace:v66 parameters:v30 assertionQueue:0 assertion:v38];
              [v64 addObject:v43];

              id v21 = v63;
LABEL_42:
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v23);
    }

    id v15 = v64;
    uint64_t v44 = [v64 count];
    lock_identityToRemnantsMap = v66->_lock_identityToRemnantsMap;
    if (v44)
    {
      uint64_t v5 = v61;
      if (lock_identityToRemnantsMap)
      {
        [(NSMutableDictionary *)lock_identityToRemnantsMap removeAllObjects];
      }
      else
      {
        uint64_t v47 = objc_opt_new();
        id v48 = v66->_lock_identityToRemnantsMap;
        v66->_lock_identityToRemnantsMap = (NSMutableDictionary *)v47;
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v49 = v64;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v69 != v52) { {
              objc_enumerationMutation(v49);
            }
            }
            v54 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            uint64_t v55 = [v54 _assertion];

            if (v55)
            {
              v56 = v66->_lock_identityToRemnantsMap;
              v57 = [v54 definition];
              v58 = [v57 identity];
              [(NSMutableDictionary *)v56 setObject:v54 forKey:v58];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v68 objects:v80 count:16];
        }
        while (v51);
      }

      id v4 = v62;
      p_lock = v60;
      id v15 = v64;
      if ([(NSMutableDictionary *)v66->_lock_identityToRemnantsMap count]) { {
        goto LABEL_67;
      }
      }
      lock_identityToRemnantsMap = v66->_lock_identityToRemnantsMap;
    }
    else
    {
      uint64_t v5 = v61;
      id v4 = v62;
      p_lock = v60;
    }
    v66->_lock_identityToRemnantsMap = 0;

LABEL_67:
    v59 = +[FBWorkspaceEventDispatcher sharedInstance];
    [v59 noteHandshakeFromSource:v66->_lock_eventDispatcherSource withRemnants:v15];

LABEL_68:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_14;
  }
  os_unfair_lock_unlock(&self->_lock);
  [(FBWorkspace *)self _terminateWithReason:@"double handshake"];
  uint64_t v8 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) { {
    -[FBWorkspace handshakeWithRemnants:].cold.4();
  }
  }
LABEL_13:

LABEL_14:
}

- (NSString)description
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  id v4 = [MEMORY[0x1E4F62810] builderWithObject:self];
  uint64_t v5 = [WeakRetained succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:0];

  uint64_t v7 = [v4 build];

  return (NSString *)v7;
}

- (id)initWithParentProcess:(id *)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace initWithParentProcess:]();
      }
      }
      [v39 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6323D60);
    }
    v42.receiver = a1;
    v42.super_class = (Class)FBWorkspace;
    uint64_t v5 = (id *)objc_msgSendSuper2(&v42, sel_init);
    a1 = v5;
    if (v5)
    {
      *((_DWORD *)v5 + 36) = 0;
      id v6 = [v4 identity];
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 description];
      }
      else
      {
        int v9 = [v4 bundleIdentifier];
        id v10 = v9;
        if (!v9) { {
          int v9 = @"unknown";
        }
        }
        uint64_t v8 = [(__CFString *)v9 description];
      }
      if ((int)[v4 pid] <= 0)
      {
        id v12 = [MEMORY[0x1E4F29128] UUID];
        id v11 = [v12 UUIDString];
      }
      else
      {
        id v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "pid"));
      }
      id v13 = [NSString stringWithFormat:@"FBProcess:%@-%@", v8, v11];
      id v14 = [MEMORY[0x1E4F62820] serial];
      id v15 = [v14 serviceClass:33];
      uint64_t v16 = BSDispatchQueueCreate();
      id v17 = a1[11];
      a1[11] = (id)v16;

      uint64_t v18 = [MEMORY[0x1E4F62AC8] _queueWithSerialDispatchQueue:a1[11]];
      id v19 = a1[12];
      a1[12] = (id)v18;

      objc_storeWeak(a1 + 2, v4);
      id v20 = [v4 rbsHandle];
      if (v20)
      {
        id v21 = FBLogProcessWorkspace();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[FBProcess logProem](v4);
          uint64_t v22 = (id *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          uint64_t v44 = v22;
          _os_log_impl(&dword_1A62FC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering event dispatcher at init", buf, 0xCu);
        }
        uint64_t v23 = +[FBWorkspaceEventDispatcher sharedInstance];
        uint64_t v24 = [v23 registerSourceWithProcessHandle:v20];
        id v25 = a1[4];
        a1[4] = (id)v24;
      }
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v27 = a1[6];
      a1[6] = v26;

      id v28 = (void *)MEMORY[0x1E4F62808];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __37__FBWorkspace_initWithParentProcess___block_invoke;
      v40[3] = &unk_1E5C4A538;
      a1 = a1;
      v41 = a1;
      uint64_t v29 = [v28 assertionWithIdentifier:v8 stateDidChangeHandler:v40];
      id v30 = a1[13];
      a1[13] = (id)v29;

      *((unsigned char *)a1 + 149) = 1;
      if ([v4 isExtensionProcess])
      {
        id v31 = [v4 extensionInfo];
        v32 = [v31 extensionIdentifier];

        if (!v32)
        {
          int v33 = +[FBPreferences sharedInstance];
          uint64_t v34 = [v33 disableXPCServicesEndpointHack];

          if ((v34 & 1) == 0) { {
            *((unsigned char *)a1 + 149) = 0;
          }
          }
        }
      }
      v35 = -[FBWorkspaceIncomingConnection initWithWorkspace:]((id *)[FBWorkspaceIncomingConnection alloc], a1);
      id v36 = a1[3];
      a1[3] = v35;

      v37 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v44 = a1;
        _os_log_impl(&dword_1A62FC000, v37, OS_LOG_TYPE_DEFAULT, "Created %{public}@", buf, 0xCu);
      }
    }
  }

  return a1;
}

uint64_t __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32)) { {
    return [*(id *)(result + 40) _dropLaunchAssertion];
  }
  }
  return result;
}

- (id)registerHost:(id)a3 settings:(id)a4 initialClientSettings:(id)a5 fromRemnant:(id)a6 error:(id *)a7
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v62 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"host"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v62 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328190);
  }
  v89 = v14;
  id v15 = [v11 definition];
  uint64_t v16 = [v15 identity];
  id v17 = [v15 clientIdentity];
  int v18 = [v17 targetsClientEndpoint];

  id v19 = [v15 specification];
  id v20 = v16;
  NSClassFromString(&cfstr_Fbssceneidenti.isa);
  if (!v20)
  {
    id v63 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v63 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63281F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v64 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328258);
  }
  int v21 = v18;

  id v22 = v19;
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v22)
  {
    v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v65 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63282BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]();
    }
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328320);
  }
  __int16 v86 = v15;

  id v23 = v12;
  NSClassFromString(&cfstr_Fbsscenesettin.isa);
  if (!v23)
  {
    uint64_t v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    }
    }
    [v67 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328384);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.4();
    }
    }
    [v68 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63283E8);
  }

  [v22 settingsClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v69 = [NSString stringWithFormat:@"settings of an unexpected class: expected %@, got %@", objc_msgSend(v22, "settingsClass"), objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]6();
    }
    }
    [v69 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632845CLL);
  }
  uint64_t v88 = v11;
  id v24 = v13;
  NSClassFromString(&cfstr_Fbssceneclient_0.isa);
  if (!v24)
  {
    long long v70 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    }
    }
    [v70 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63284C0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v71 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.5();
    }
    }
    [v71 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328524);
  }

  [v22 clientSettingsClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v72 = [NSString stringWithFormat:@"initialClientSettings of an unexpected class: expected %@, got %@", objc_msgSend(v22, "clientSettingsClass"), objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]4();
    }
    }
    [v72 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328598);
  }
  uint64_t v25 = (uint64_t)v89;
  if (v89)
  {
    id v26 = v89;
    NSClassFromString(&cfstr_Fbsceneremnant.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v77 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]3();
      }
      }
      [v77 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6328688);
    }

    if ([v26 _hasBeenInvalidated])
    {
      long long v78 = [NSString stringWithFormat:@"cannot create a scene from an invalidated remnant"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]0();
      }
      }
      [v78 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63286E0);
    }
    id v27 = [v26 _workspace];

    if (v27 != self)
    {
      long long v79 = [NSString stringWithFormat:@"remnant doesn't match this workspace"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]2();
      }
      }
      [v79 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6328738);
    }
    id v28 = [v26 definition];
    uint64_t v29 = [v28 specification];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();

    BOOL v32 = v30 == v31;
    uint64_t v25 = (uint64_t)v89;
    if (!v32)
    {
      v80 = [NSString stringWithFormat:@"specification must match the remnant"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:]1();
      }
      }
      [v80 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6328790);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  lock_identityToSceneMap = self->_lock_identityToSceneMap;
  if (!lock_identityToSceneMap)
  {
    uint64_t v34 = (NSMutableDictionary *)objc_opt_new();
    v35 = self->_lock_identityToSceneMap;
    self->_lock_identityToSceneMap = v34;

    lock_identityToSceneMap = self->_lock_identityToSceneMap;
  }
  id v36 = [(NSMutableDictionary *)lock_identityToSceneMap objectForKey:v20];

  if (v36)
  {
    id v73 = NSString;
    v74 = [(NSMutableDictionary *)self->_lock_identityToSceneMap objectForKey:v20];
    id v75 = [v88 debugDescription];
    long long v76 = [v73 stringWithFormat:@"cannot register a host that is already registered : existing=%@ : host=%@", v74, v75];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.9();
    }
    }
    [v76 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6328624);
  }
  if (self->_lock_didReceiveHandshake)
  {
    v37 = [(NSMutableDictionary *)self->_lock_identityToRemnantsMap objectForKey:v20];
  }
  else
  {
    if (v25)
    {
      v82 = [NSString stringWithFormat:@"how could you call createWithRemnant: if we haven't made any remnants"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.8();
      }
      }
      [v82 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63287E8);
    }
    lock_identityToRemnantsMap = self->_lock_identityToRemnantsMap;
    if (!lock_identityToRemnantsMap)
    {
      v39 = (NSMutableDictionary *)objc_opt_new();
      id v40 = self->_lock_identityToRemnantsMap;
      self->_lock_identityToRemnantsMap = v39;

      lock_identityToRemnantsMap = self->_lock_identityToRemnantsMap;
    }
    v41 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)lock_identityToRemnantsMap setObject:v41 forKey:v20];

    v37 = 0;
  }
  if (self->_lock_invalidated)
  {
    objc_super v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v103 = *MEMORY[0x1E4F28588];
    v104[0] = @"Workspace has been invalidated (process has exited).";
    id v43 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v44 = (__CFString **)v104;
    uint64_t v45 = &v103;
LABEL_31:
    id WeakRetained = [v43 dictionaryWithObjects:v44 forKeys:v45 count:1];
    uint64_t v47 = [v42 errorWithDomain:@"FBWorkspace" code:1 userInfo:WeakRetained];
    id v48 = 0;
    uint64_t v49 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (self->_test_rejectAllSceneClients)
  {
    objc_super v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v101 = *MEMORY[0x1E4F28588];
    v102 = @"Workspace is rejecting all clients for unit tests.";
    id v43 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v44 = &v102;
    uint64_t v45 = &v101;
    goto LABEL_31;
  }
  if (v21)
  {
    lock_outgoingEndpoint = self->_lock_outgoingEndpoint;
    if (lock_outgoingEndpoint
      && [(BSServiceConnectionEndpoint *)lock_outgoingEndpoint isNullEndpoint])
    {
      objc_super v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v99 = *MEMORY[0x1E4F28588];
      v100 = @"Workspace cannot establish a connection to a null endpoint.";
      id v43 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v44 = &v100;
      uint64_t v45 = &v99;
      goto LABEL_31;
    }
    lock_outgoingConnection = self->_lock_outgoingConnection;
    if (lock_outgoingConnection)
    {
      id v48 = lock_outgoingConnection;
      uint64_t v25 = 0;
LABEL_53:
      if (!-[FBWorkspaceConnection workspaceLock_isValid]((BOOL)v48))
      {
        v83 = [NSString stringWithFormat:@"internal state error : connection is invalidated"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.6();
        }
        }
        [v83 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6328840);
      }
      v60 = (objc_class *)objc_opt_class();
      if (objc_msgSend(v23, "_uikitShimming_isUISubclass")) { {
        v60 = (objc_class *)objc_opt_class();
      }
      }
      int v85 = v25;
      uint64_t v49 = (void *)[[v60 alloc] initWithConnection:v48 host:v88 settings:v23 clientSettings:v24 fromRemnant:v25];
      [(NSMutableDictionary *)self->_lock_identityToSceneMap setObject:v49 forKey:v20];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
      v61 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v84 = -[FBProcess logProem](WeakRetained);
        *(_DWORD *)buf = 138543874;
        v92 = v84;
        __int16 v93 = 2114;
        v94 = v49;
        __int16 v95 = 1024;
        int v96 = v85;
        _os_log_impl(&dword_1A62FC000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered new scene: %{public}@ (fromRemnant = %d)", buf, 0x1Cu);
      }
      uint64_t v47 = 0;
      goto LABEL_32;
    }
    v57 = (FBWorkspaceOutgoingConnection *)-[FBWorkspaceOutgoingConnection initWithWorkspace:]((id *)[FBWorkspaceOutgoingConnection alloc], self);
    v58 = self->_lock_outgoingConnection;
    self->_lock_outgoingConnection = v57;

    id v48 = v57;
    v59 = self->_lock_outgoingEndpoint;
    if (v59) { {
      -[FBWorkspaceOutgoingConnection workspaceLock_setEndpoint:]((uint64_t)self->_lock_outgoingConnection, v59);
    }
    }
    uint64_t v25 = 0;
  }
  else if (v25)
  {
    if (v37 != (void *)v25)
    {
      uint64_t v55 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace registerHost:settings:initialClientSettings:fromRemnant:error:].cold.7();
      }
      }

      objc_super v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v97 = *MEMORY[0x1E4F28588];
      v98 = @"Invalid scene remnant provided.";
      id v43 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v44 = &v98;
      uint64_t v45 = &v97;
      goto LABEL_31;
    }
    [(NSMutableDictionary *)self->_lock_identityToRemnantsMap removeObjectForKey:v20];
    id v48 = self->_lock_incomingConnection;
    uint64_t v25 = 1;
  }
  else
  {
    id v48 = self->_lock_incomingConnection;
  }
  if (v48) { {
    goto LABEL_53;
  }
  }
  uint64_t v47 = 0;
  uint64_t v49 = 0;
LABEL_33:
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v50 = [v37 _assertion];
  [v50 invalidate];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__FBWorkspace_registerHost_settings_initialClientSettings_fromRemnant_error___block_invoke;
  block[3] = &unk_1E5C49AE0;
  void block[4] = self;
  dispatch_async(queue, block);
  if (a7) { {
    *a7 = v47;
  }
  }
  id v52 = v49;

  return v52;
}

void __37__FBWorkspace__enableLegacyRequests___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) { {
          objc_enumerationMutation(v5);
        }
        }
        objc_msgSend(*(id *)(a1 + 32), "_callOutQueue_requestScene:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)sceneID:(id)a3 didReceiveActions:(id)a4 forExtension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (NSString *)a5;
  long long v11 = [(FBWorkspace *)self _sceneForIdentity:v8];
  if (!v11)
  {
    long long v13 = FBLogProcessScene();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace sceneID:didReceiveActions:forExtension:]();
    }
    }
    goto LABEL_8;
  }
  if (!v10)
  {
    Class v12 = 0;
    goto LABEL_10;
  }
  Class v12 = NSClassFromString(v10);
  if (v12)
  {
LABEL_10:
    id v14 = +[FBWorkspaceConnection currentWorkspaceConnection]();
    -[FBWorkspaceScene workspace:handleActions:forExtension:fromConnection:]((uint64_t)v11, self, v9, (uint64_t)v12, v14);

    goto LABEL_11;
  }
  long long v13 = FBLogProcessScene();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspace sceneID:didReceiveActions:forExtension:]();
  }
  }
LABEL_8:

LABEL_11:
}

- (FBWorkspace)init
{
  return (FBWorkspace *)-[FBWorkspace initWithParentProcess:]((id *)&self->super.isa, 0);
}

- (void)dealloc
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_weak_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (FBWorkspaceDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_delegate);
  os_unfair_lock_unlock(p_lock);

  return (FBWorkspaceDelegate *)WeakRetained;
}

- (BSAuditToken)auditToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  uint64_t v3 = [WeakRetained auditToken];

  return (BSAuditToken *)v3;
}

- (void)sendActions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    objc_opt_class();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) { {
            objc_enumerationMutation(v5);
          }
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v18 = [NSString stringWithFormat:@"only actions of type BSAction can be sent : tried to send %@", v10];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
              -[FBWorkspace sendActions:]();
            }
            }
            [v18 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A6344098);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v7);
    }

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      workspaceQueue = self->_workspaceQueue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __27__FBWorkspace_sendActions___block_invoke;
      v21[3] = &unk_1E5C49AE0;
      id v22 = v5;
      [(FBSSerialQueue *)workspaceQueue performAsync:v21];
      id WeakRetained = v22;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
      id v14 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = -[FBProcess logProem](WeakRetained);
        uint64_t v16 = objc_msgSend(v5, "fbs_singleLineDescriptionOfBSActions");
        *(_DWORD *)buf = 138543618;
        id v28 = v15;
        __int16 v29 = 2114;
        uint64_t v30 = v16;
        _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending action(s): %{public}@", buf, 0x16u);
      }
      uint64_t lock_incomingConnection = self->_lock_incomingConnection;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __27__FBWorkspace_sendActions___block_invoke_99;
      v19[3] = &unk_1E5C4A560;
      v19[4] = self;
      id v20 = v5;
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:]((uint64_t)lock_incomingConnection, v19);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

void __27__FBWorkspace_sendActions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) { {
          objc_enumerationMutation(v1);
        }
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __27__FBWorkspace_sendActions___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = [WeakRetained target];

  if (v3 && v5)
  {
    long long v6 = -[FBWorkspace _acquireAssertionForReason:withState:](*(void *)(a1 + 32), @"Send Actions", 2);
    long long v7 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __27__FBWorkspace_sendActions___block_invoke_2;
    v24[3] = &unk_1E5C497A0;
    id v25 = v7;
    id v26 = v6;
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = (void *)MEMORY[0x1AD0B8C50](v24);
    uint64_t v11 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __27__FBWorkspace_sendActions___block_invoke_3;
    v22[3] = &unk_1E5C4A258;
    id v23 = v10;
    id v12 = v10;
    [v3 sendActions:v11 completion:v22];
    dispatch_time_t v13 = dispatch_time(0, 5000000000);
    dispatch_after(v13, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 88), v12);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v14 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
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
            objc_enumerationMutation(v9);
          }
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "invalidate", (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

uint64_t __27__FBWorkspace_sendActions___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) signal];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 invalidate];
  }
  return result;
}

uint64_t __27__FBWorkspace_sendActions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)assertionState
{
  if (!a1) { {
    return 0;
  }
  }
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 144);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
  if (*(unsigned char *)(a1 + 151)) { {
    uint64_t v3 = 0;
  }
  }
  else {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 148);
  }
  uint64_t v4 = *(void **)(a1 + 120);
  if (v4) { {
    uint64_t v3 = FBWorkspaceAssertionStateCombine(v3, objc_msgSend(v4, "fb_workspaceAssertionState"));
  }
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

- (id)_unregisterSceneForHost:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 definition];
  long long v6 = [v5 identity];

  id v7 = v6;
  NSClassFromString(&cfstr_Fbssceneidenti.isa);
  if (!v7)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _unregisterSceneForHost:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63446E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _unregisterSceneForHost:]();
    }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6344748);
  }

  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_lock_identityToSceneMap objectForKey:v7];
  id v9 = v8;
  if (v8 && ([v8 host], id v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    id v12 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v13 = -[FBProcess logProem](WeakRetained);
      *(_DWORD *)buf = 138543618;
      long long v18 = v13;
      __int16 v19 = 2114;
      long long v20 = v9;
      _os_log_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Unregistering scene: %{public}@", buf, 0x16u);
    }
    [(NSMutableDictionary *)self->_lock_identityToSceneMap removeObjectForKey:v7];
  }
  else
  {

    id v9 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)_terminateWithReason:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  if (WeakRetained)
  {
    uint64_t v5 = [MEMORY[0x1E4F62A08] requestForProcess:WeakRetained withLabel:@"FBWorkspace misbehaving process"];
    [v5 setReportType:1];
    [v5 setExceptionCode:1269680657];
    [v5 setExplanation:v6];
    [v5 execute];
  }
}

- (id)createServiceQueue
{
  id v2 = [[FBWorkspaceServiceDispatchingQueue alloc] _initWithTargetQueue:self->_queue];

  return v2;
}

- (void)_handleSceneRequest:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    id v6 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _handleSceneRequest:]();
    }
    }
LABEL_4:

    id v7 = FBSWorkspaceErrorCreate();
    [v4 invalidateWithError:v7];
    goto LABEL_5;
  }
  if (!self->_lock_eventDispatcherSource)
  {
    id v6 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspace _handleSceneRequest:]();
    }
    }
    goto LABEL_4;
  }
  if (self->_lock_didReceiveHandshake)
  {
    id v8 = +[FBWorkspaceEventDispatcher sharedInstance];
    char v9 = [v8 handleSceneRequest:v4 fromSource:self->_lock_eventDispatcherSource];

    if (v9) { {
      goto LABEL_6;
    }
    }
    if (![v4 requiresModernDispatcher])
    {
      lock_pendedRequests = self->_lock_pendedRequests;
      if (lock_pendedRequests)
      {
        [(NSMutableArray *)lock_pendedRequests addObject:v4];
      }
      else
      {
        uint64_t v14 = +[FBProcess calloutQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __35__FBWorkspace__handleSceneRequest___block_invoke;
        block[3] = &unk_1E5C497A0;
        void block[4] = self;
        id v16 = v4;
        dispatch_async(v14, block);
      }
      goto LABEL_6;
    }
    id v7 = [v4 targetIdentifier];
    id v10 = FBSWorkspaceErrorCreate();
    objc_msgSend(v4, "invalidateWithError:", v10, v7);

LABEL_5:
LABEL_6:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_7;
  }
  uint64_t v11 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspace _handleSceneRequest:]();
  }
  }

  os_unfair_lock_unlock(&self->_lock);
  [(FBWorkspace *)self _terminateWithReason:@"scene request before handshake"];
  id v12 = FBSWorkspaceErrorCreate();
  [v4 invalidateWithError:v12];

LABEL_7:
}

void __35__FBWorkspace__handleSceneRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 151);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 144));
  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    FBSWorkspaceErrorCreate();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v4 invalidateWithError:v7];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    objc_msgSend(v5, "_callOutQueue_requestScene:", v6);
  }
}

void __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_2_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [[FBProcessExitContext alloc] initWithUnderlyingContext:v6];
    [WeakRetained _processDidExitWithContext:v5];
  }
}

uint64_t __78__FBWorkspace__noteProcessBootstrapped_withHandle_assertion_outgoingEndpoint___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processDidExitWithContext:0];
}

- (void)_callOutQueue_requestScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBWorkspace *)self delegate];
  if (v5)
  {
    id v6 = [v4 options];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__FBWorkspace__callOutQueue_requestScene___block_invoke;
    v8[3] = &unk_1E5C4A5D8;
    id v9 = v4;
    [v5 workspace:self didReceiveSceneRequestWithOptions:v6 completion:v8];
  }
  else
  {
    id v7 = FBSWorkspaceErrorCreate();
    [v4 invalidateWithError:v7];
  }
}

void __42__FBWorkspace__callOutQueue_requestScene___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    int v3 = *(void **)(a1 + 32);
    [v3 respondWithScene:a2];
  }
  else
  {
    FBSWorkspaceErrorCreate();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 invalidateWithError:v4];
  }
}

- (void)_noteProcessDidInvalidate:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained != v3)
    {
      v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process == _weak_process"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspace _noteProcessDidInvalidate:]();
      }
      }
      [v41 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6345328);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (*(unsigned char *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    }
    else
    {
      *(unsigned char *)(a1 + 151) = 1;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v56 != v8) { {
              objc_enumerationMutation(v5);
            }
            }
            id v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            uint64_t v11 = FBSWorkspaceErrorCreate();
            [v10 invalidateWithError:v11];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v7);
      }

      id v12 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      dispatch_time_t v13 = FBLogProcessWorkspace();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = -[FBProcess logProem](v3);
        *(_DWORD *)buf = 138543362;
        id v62 = v14;
        _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating workspace.", buf, 0xCu);
      }
      uint64_t v15 = [*(id *)(a1 + 40) allValues];
      [*(id *)(a1 + 40) removeAllObjects];
      id v16 = [*(id *)(a1 + 80) allValues];
      [*(id *)(a1 + 80) removeAllObjects];
      -[FBWorkspaceConnection workspaceLock_invalidate](*(const os_unfair_lock ***)(a1 + 24));
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      long long v18 = *(const os_unfair_lock ***)(a1 + 72);
      if (v18)
      {
        __int16 v19 = -[FBWorkspaceConnection workspaceLock_invalidate](v18);
        long long v20 = v19;
        if (v19)
        {
          if (v17) { {
            [v17 addObjectsFromArray:v19];
          }
          }
          else {
            id v17 = v19;
          }
        }
      }
      uint64_t v21 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      id v22 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      [*(id *)(a1 + 32) invalidate];
      [*(id *)(a1 + 56) invalidate];
      id v23 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      [*(id *)(a1 + 120) invalidate];
      long long v24 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = 0;

      [*(id *)(a1 + 112) invalidate];
      id v25 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = 0;

      [*(id *)(a1 + 128) invalidate];
      id v26 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      if ([v16 count])
      {
        id v27 = +[FBProcess calloutQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__FBWorkspace__noteProcessDidInvalidate___block_invoke;
        block[3] = &unk_1E5C497A0;
        id v53 = v16;
        v54 = v3;
        dispatch_async(v27, block);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
      [*(id *)(a1 + 104) invalidate];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v28 = v15;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v49 != v31) { {
              objc_enumerationMutation(v28);
            }
            }
            int v33 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v34 = [v33 _assertion];
              [v34 invalidate];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
        }
        while (v30);
      }

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v35 = v16;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v59 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v45 != v38) { {
              objc_enumerationMutation(v35);
            }
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * k) invalidate];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v44 objects:v59 count:16];
        }
        while (v37);
      }

      if ([v17 count])
      {
        id v40 = *(NSObject **)(a1 + 88);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __41__FBWorkspace__noteProcessDidInvalidate___block_invoke_2;
        v42[3] = &unk_1E5C49AE0;
        id v43 = v17;
        dispatch_async(v40, v42);
      }
    }
  }
}

void __41__FBWorkspace__noteProcessDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) { {
          objc_enumerationMutation(obj);
        }
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [v6 host];
        uint64_t v8 = [*(id *)(a1 + 40) exitContext];
        id v9 = [v8 createError];
        id v10 = FBSceneErrorCreate(4uLL, @"Client process exited.", v9);
        [v7 clientToken:v6 didInvalidateWithError:v10];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

void __41__FBWorkspace__noteProcessDidInvalidate___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) { {
          objc_enumerationMutation(v1);
        }
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_terminateGracefully:(void *)a3 withTransitionContext:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
LABEL_6:

    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

  if (WeakRetained == v5)
  {
    long long v8 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (!*(unsigned char *)(a1 + 151))
    {
      uint64_t v9 = *(void *)(a1 + 24);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__FBWorkspace__terminateGracefully_withTransitionContext___block_invoke;
      v11[3] = &unk_1E5C4A600;
      id v12 = v6;
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v9, v11);
    }
    os_unfair_lock_unlock(v8);
    goto LABEL_6;
  }
  id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"process == _weak_process"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspace _terminateGracefully:withTransitionContext:]();
  }
  }
  [v10 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __58__FBWorkspace__terminateGracefully_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willTerminateWithTransitionContext:*(void *)(a1 + 32)];
}

- (void)_queue_unverifiedOutgoingConnection:(void *)a3 didError:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v7 = [MEMORY[0x1E4F1CA48] array];
    long long v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = (os_unfair_lock_s *)(a1 + 144);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if (*(unsigned char *)(a1 + 151))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    }
    else
    {
      if (*(const os_unfair_lock ***)(a1 + 72) != v5)
      {
        id v26 = [NSString stringWithFormat:@"unverified outgoingConnection is unknown : expected=%@ actual=%@", *(void *)(a1 + 72), v5];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspace _queue_unverifiedOutgoingConnection:didError:]();
        }
        }
        [v26 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6345A94);
      }
      id v10 = *(void **)(a1 + 80);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke;
      v38[3] = &unk_1E5C4A628;
      id v11 = v7;
      id v39 = v11;
      id v12 = v8;
      id v40 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v38];
      [*(id *)(a1 + 80) removeObjectsForKeys:v11];
      long long v13 = -[FBWorkspaceConnection workspaceLock_invalidate](v5);
      long long v14 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;

      if ([v12 count])
      {
        long long v15 = +[FBProcess calloutQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke_2;
        block[3] = &unk_1E5C497A0;
        id v36 = v12;
        id v37 = v6;
        dispatch_async(v15, block);
      }
      os_unfair_lock_unlock(v9);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v32;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v32 != v19) { {
              objc_enumerationMutation(v16);
            }
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * v20++) invalidate];
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v42 count:16];
        }
        while (v18);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v21 = v13;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v28;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v28 != v24) { {
              objc_enumerationMutation(v21);
            }
            }
            (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v25++) + 16))();
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v41 count:16];
        }
        while (v23);
      }
    }
  }
}

void __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 usesOutgoingConnection])
  {
    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __60__FBWorkspace__queue_unverifiedOutgoingConnection_didError___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) { {
          objc_enumerationMutation(v2);
        }
        }
        long long v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v8 = objc_msgSend(v7, "host", (void)v9);
        [v8 clientToken:v7 didInvalidateWithError:*(void *)(a1 + 40)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)unregisterHost:(id)a3
{
}

- (void)host:(id)a3 didInvalidateWithTransitionContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke;
  v22[3] = &unk_1E5C4A650;
  id v23 = v9;
  id v10 = a3;
  long long v11 = (void *)MEMORY[0x1AD0B8C50](v22);
  long long v12 = [(FBWorkspace *)self _unregisterSceneForHost:v10];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_2;
  block[3] = &unk_1E5C4A078;
  id v18 = v12;
  uint64_t v19 = self;
  id v20 = v8;
  id v21 = v11;
  id v14 = v11;
  id v15 = v8;
  id v16 = v12;
  dispatch_async(queue, block);
}

uint64_t __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  }
  return result;
}

void __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(id **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_3;
    v9[3] = &unk_1E5C4A678;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    -[FBWorkspaceScene workspace:sendInvalidationWithTransitionContext:completion:](v2, v3, v4, v9);
    [*(id *)(a1 + 40) _resolveSceneLifecycleStateAndInterruptionPolicy];

    uint64_t v5 = v11;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    long long v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v13[0] = @"Scene client is invalid.";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = [v7 errorWithDomain:@"FBWorkspace" code:1 userInfo:v5];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
  }
}

uint64_t __66__FBWorkspace_host_didInvalidateWithTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

- (void)host:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8 = a4;
  id v9 = [(FBWorkspace *)self _sceneForHost:a3];
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __51__FBWorkspace_host_didReceiveActions_forExtension___block_invoke;
  v13[3] = &unk_1E5C4A6A0;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  Class v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

void __51__FBWorkspace_host_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
}

void __37__FBWorkspace_handshakeWithRemnants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 144));
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 151))
  {
    uint64_t v5 = [*(id *)(v4 + 40) objectForKey:*(void *)(a1 + 40)];
    id v6 = [v5 _assertion];

    uint64_t v4 = *(void *)(a1 + 32);
    if (v6 == v3)
    {
      [*(id *)(v4 + 40) removeObjectForKey:*(void *)(a1 + 40)];
      if (![*(id *)(*(void *)(a1 + 32) + 40) count])
      {
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = 0;
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__FBWorkspace_handshakeWithRemnants___block_invoke_2;
      v10[3] = &unk_1E5C4A600;
      id v11 = *(id *)(a1 + 40);
      -[FBWorkspaceConnection workspaceLock_enqueueConnectBlock:](v9, v10);

      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 144));
}

uint64_t __37__FBWorkspace_handshakeWithRemnants___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sceneID:*(void *)(a1 + 32) destroyWithTransitionContext:0 completion:&__block_literal_global_11];
}

uint64_t __37__FBWorkspace_handshakeWithRemnants___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 sceneID:*(void *)(a1 + 32) destroyWithTransitionContext:0 completion:&__block_literal_global_299];
}

- (void)workspaceID:(id)a3 sendActions:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
    id v12 = FBLogProcessWorkspace();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = -[FBProcess logProem](WeakRetained);
      if (v8) { {
        id v14 = v8;
      }
      }
      else {
        id v14 = @"(default)";
      }
      id v15 = objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
      *(_DWORD *)buf = 138543874;
      id v23 = v13;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      long long v27 = v15;
      _os_log_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Received action(s) for workspace %{public}@: %{public}@", buf, 0x20u);
    }
    if (v8)
    {
      id v16 = v8;
    }
    else
    {
      Class v17 = +[FBWorkspaceDomain sharedInstance]();
      -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v17);
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v18 = [FBWorkspaceSceneRequest alloc];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__FBWorkspace_workspaceID_sendActions_completion___block_invoke;
    v20[3] = &unk_1E5C4A710;
    id v21 = v10;
    uint64_t v19 = [(FBWorkspaceSceneRequest *)v18 initWithTargetIdentifier:v16 actions:v9 completion:v20];
    [(FBWorkspace *)self _handleSceneRequest:v19];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __50__FBWorkspace_workspaceID_sendActions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  }
  return result;
}

- (void)createSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = +[FBWorkspaceConnection currentWorkspaceConnection]();
  if (!v8)
  {
    if (!v7) { {
      goto LABEL_11;
    }
    }
LABEL_8:
    long long v13 = FBSWorkspaceErrorCreate();
    v7[2](v7, v13);

    goto LABEL_11;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    if (!v7) { {
      goto LABEL_11;
    }
    }
    goto LABEL_8;
  }
  id v10 = [v6 workspaceIdentifier];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v14 = +[FBWorkspaceDomain sharedInstance]();
    -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = [FBWorkspaceSceneRequest alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__FBWorkspace_createSceneWithOptions_completion___block_invoke;
  v17[3] = &unk_1E5C4A710;
  id v18 = v7;
  id v16 = [(FBWorkspaceSceneRequest *)v15 initWithTargetIdentifier:v12 options:v6 completion:v17];
  [(FBWorkspace *)self _handleSceneRequest:v16];

LABEL_11:
}

uint64_t __49__FBWorkspace_createSceneWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  }
  return result;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = +[FBWorkspaceConnection currentWorkspaceConnection]();
  if (!v8)
  {
    if (!v7) { {
      goto LABEL_15;
    }
    }
LABEL_9:
    long long v13 = FBSWorkspaceErrorCreate();
    v7[2](v7, 0, v13);

    goto LABEL_15;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    if (!v7) { {
      goto LABEL_15;
    }
    }
    goto LABEL_9;
  }
  if (v7)
  {
    id v10 = [v6 workspaceIdentifier];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v14 = +[FBWorkspaceDomain sharedInstance]();
      -[FBWorkspaceDomain defaultWorkspace]((uint64_t)v14);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    if ([v6 isKeyboardScene])
    {
      id v15 = [(FBWorkspace *)self process];
      char v16 = [v15 hasEntitlement:@"com.apple.frontboard.keyboard-provider"];
    }
    else
    {
      char v16 = 0;
    }
    Class v17 = [FBWorkspaceSceneRequest alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke;
    v19[3] = &unk_1E5C4A760;
    char v21 = v16;
    v19[4] = self;
    id v20 = v7;
    id v18 = [(FBWorkspaceSceneRequest *)v17 initWithTargetIdentifier:v12 options:v6 completion:v19];
    [(FBWorkspace *)self _handleSceneRequest:v18];
  }
LABEL_15:
}

void __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 48)) { {
      +[FBSceneManager setKeyboardScene:v5];
    }
    }
    uint64_t v7 = [v5 identity];
    id v8 = [*(id *)(a1 + 32) _sceneForIdentity:v7];
    uint64_t v9 = v8;
    if (v8 && ([v8 host], id v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 == v5))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke_2;
      v14[3] = &unk_1E5C4A738;
      v14[4] = *(void *)(a1 + 32);
      id v15 = v7;
      id v16 = v9;
      id v17 = *(id *)(a1 + 40);
      -[FBWorkspaceScene _enqueueSceneCreateCompletionBlock:]((uint64_t)v16, v14);
    }
    else
    {
      if [v5 isValid] && (objc_msgSend(v5, "isActive")) { {
        uint64_t v11 = *(void *)(a1 + 40);
      }
      }
      else {
        uint64_t v11 = *(void *)(a1 + 40);
      }
      long long v13 = FBSWorkspaceErrorCreate();
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v13);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) { {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v6);
    }
    }
  }
}

void __50__FBWorkspace_requestSceneWithOptions_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  if (a2
    && ([*(id *)(a1 + 32) _sceneForIdentity:*(void *)(a1 + 40)],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = *(void **)(a1 + 48),
        v5,
        v5 == v6))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = FBSWorkspaceErrorCreate();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

- (void)sceneID:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = FBLogProcessScene();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspace sceneID:sendMessage:withResponse:]();
  }
  }

  if (v7) { {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  id v7 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = -[FBProcess logProem](WeakRetained);
    id v9 = [v5 succinctDescription];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    long long v13 = v9;
    _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch assertion invalidated: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(FBWorkspace *)self _dropLaunchAssertion];
}

- (void)assertionWillInvalidate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_process);
  uint64_t v4 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = -[FBProcess logProem](WeakRetained);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch assertion will expire.", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)test_rejectAllSceneClients
{
  return self->_test_rejectAllSceneClients;
}

- (void)test_setRejectAllSceneClients:(BOOL)a3
{
  self->_test_rejectAllSceneClients = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_delegate);
}

- (void)initWithParentProcess:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_sceneForIdentity:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_unregisterSceneForHost:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleSceneRequest:.cold.1()
{
  v0 = [MEMORY[0x1E4F62880] currentContext];
  SEL v1 = [v0 remoteProcess];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "ignoring scene request because we have no dispatcher registration : from=%@", v4, v5, v6, v7, v8);
}

- (void)_handleSceneRequest:.cold.2()
{
  v0 = [MEMORY[0x1E4F62880] currentContext];
  SEL v1 = [v0 remoteProcess];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "ignoring request before handshake : from=%@", v4, v5, v6, v7, v8);
}

- (void)_handleSceneRequest:.cold.3()
{
  v0 = [MEMORY[0x1E4F62880] currentContext];
  SEL v1 = [v0 remoteProcess];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "ignoring scene request because we're already invalidating : from=%@", v4, v5, v6, v7, v8);
}

- (void)_setIncomingConnection:(void *)a1 .cold.1(void *a1)
{
  SEL v1 = -[FBProcess logProem](a1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "%{public}@ attempted to assign a new connection to an invalidated workspace server.", v4, v5, v6, v7, v8);
}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteProcessBootstrapped:withHandle:assertion:outgoingEndpoint:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_enableLegacyRequests:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_noteProcessDidInvalidate:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_terminateGracefully:withTransitionContext:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_queue_unverifiedOutgoingConnection:didError:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.6()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.7()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = 0;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, v0, v1, "invalid remnant specified: remnant=%{public}@ connection=%{public}@", v2);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.8()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.9()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.10()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.11()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.12()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.13()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.14()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHost:settings:initialClientSettings:fromRemnant:error:.cold.16()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handshakeWithRemnants:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 debugDescription];
  uint64_t v4 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v5 = [v4 remoteToken];
  [v1 count];
  OUTLINED_FUNCTION_7_2();
  _os_log_error_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_ERROR, "ignoring handshake for unknown connection : process=%@ remote=%@ remnants=%u", v6, 0x1Cu);
}

- (void)handshakeWithRemnants:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "ignoring handshake because we have no dispatcher registration", v1, 2u);
}

- (void)handshakeWithRemnants:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "ignoring handshake because we're already invalidating", v1, 2u);
}

- (void)handshakeWithRemnants:.cold.4()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 debugDescription];
  uint64_t v4 = [MEMORY[0x1E4F62880] currentContext];
  uint64_t v5 = [v4 remoteToken];
  [v1 count];
  OUTLINED_FUNCTION_7_2();
  _os_log_fault_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_FAULT, "double handshake detected : process=%@ remote=%@ remnants=%u", v6, 0x1Cu);
}

- (void)sceneID:didUpdateClientSettingsWithDiff:transitionContext:completion:.cold.1()
{
}

- (void)sceneID:didReceiveActions:forExtension:.cold.1()
{
}

- (void)sceneID:didReceiveActions:forExtension:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, v1, (uint64_t)v1, "[%{public}@] Unable to deliver actions to extension \"%{public}@\" because that class does not exist.", v2);
}

- (void)sceneID:sendMessage:withResponse:.cold.1()
{
}

@end