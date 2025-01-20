@interface FBWorkspaceScene
+ (unsigned)_sceneActionForLifecycleFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4;
- (BOOL)usesOutgoingConnection;
- (FBSSceneIdentity)identity;
- (FBSSceneSettings)settings;
- (FBSSceneSpecification)specification;
- (FBSceneHost)host;
- (FBWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7;
- (NSString)debugDescription;
- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5;
- (id)callOutQueue;
- (id)clientProcess;
- (id)counterpartAgent;
- (id)definition;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostProcess;
- (id)identifier;
- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4;
- (id)parameters;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_enqueueSceneCreateCompletionBlock:(uint64_t)a1;
- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3;
- (void)_workspaceQueue_decrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5;
- (void)_workspaceQueue_incrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5;
- (void)_workspaceQueue_invalidate;
- (void)_workspaceQueue_invalidateSceneAgentWithEvent:(id)a3;
- (void)_workspaceQueue_sendMessageToClient:(id)a3;
- (void)_workspaceQueue_sendSceneCreateToClient:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)_workspaceQueue_sendSceneUpdateToClient:(id)a3 settingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)_workspaceQueue_updateAssertion;
- (void)agent:(id)a3 registerMessageHandler:(id)a4;
- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)closeSession:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)workspace:(void *)a3 handleActions:(uint64_t)a4 forExtension:(void *)a5 fromConnection:;
- (void)workspace:(void *)a3 handleUpdatedClientSettings:(void *)a4 transitionContext:(void *)a5 fromConnection:;
- (void)workspace:(void *)a3 sendActions:(uint64_t)a4 toExtension:;
- (void)workspace:(void *)a3 sendInvalidationWithTransitionContext:(void *)a4 completion:;
- (void)workspace:(void *)a3 sendUpdatedSettings:(void *)a4 withDiff:(void *)a5 transitionContext:(void *)a6 completion:;
@end

@implementation FBWorkspaceScene

- (FBSceneHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (FBSceneHost *)WeakRetained;
}

uint64_t __102__FBWorkspaceScene__workspaceQueue_sendSceneUpdateToClient_settingsDiff_transitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v3 = MEMORY[0x1AD0B8C50](a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __100__FBWorkspaceScene__workspaceQueue_sendSceneCreateToClient_parameters_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = FBLogProcessScene();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v5;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pretending scene creation was successful, even though we got no response (<rdar://problem/62751231>). This does *not* mean there is a problem in FrontBoard, only that we are working around a bug in UIKit.", buf, 0xCu);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 136));
  id v6 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 136));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) { {
          objc_enumerationMutation(v9);
        }
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (void)workspace:(void *)a3 handleUpdatedClientSettings:(void *)a4 transitionContext:(void *)a5 fromConnection:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    [*(id *)(a1 + 152) assertOnQueue];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    id v13 = *(id *)(a1 + 8);
    if (v13 == v12)
    {
      long long v17 = (__CFString *)*(id *)(a1 + 72);
      v18 = v17;
      if (v10)
      {
        v19 = FBLogProcessScene();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          id v37 = v20;
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl(&dword_1A62FC000, v19, OS_LOG_TYPE_INFO, "[%{public}@] Client settings updated with diff: %@", buf, 0x16u);
        }

        uint64_t v21 = [v10 settingsByApplyingToMutableCopyOfSettings:v18];
        long long v14 = (__CFString *)[v21 copy];

        objc_storeStrong((id *)(a1 + 72), v14);
      }
      else
      {
        long long v14 = v17;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      if (*(void *)(a1 + 48))
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F62A48]);
        [v22 setClientSettingsDiff:v10];
        [v22 setTransitionContext:v11];
        [v22 setSource:2];
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2020000000;
        char v35 = 0;
        v23 = *(void **)(a1 + 48);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke;
        v31[3] = &unk_1E5C4AA90;
        v31[4] = a1;
        v31[5] = &v32;
        [v23 scene:a1 reviewEvent:v22 withCompletion:v31];
        if (!*((unsigned char *)v33 + 24))
        {
          v24 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v22, *(void *)(a1 + 48)];
          v25 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel_workspace_handleUpdatedClientSettings_transitionContext_fromConnection_);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            *(_DWORD *)buf = 138544642;
            id v37 = v27;
            __int16 v38 = 2114;
            id v39 = v29;
            __int16 v40 = 2048;
            uint64_t v41 = a1;
            __int16 v42 = 2114;
            v43 = @"FBWorkspaceScene.m";
            __int16 v44 = 1024;
            int v45 = 855;
            __int16 v46 = 2114;
            v47 = v24;
            _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v24 UTF8String];
          uint64_t v30 = _bs_set_crash_log_message();
          -[FBWorkspaceEventDispatcher registerTarget:](v30);
        }
        _Block_object_dispose(&v32, 8);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained clientToken:a1 didUpdateClientSettings:v14 withDiff:v10 transitionContext:v11];
    }
    else
    {
      long long v14 = (__CFString *)v13;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      id WeakRetained = FBLogProcessScene();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        long long v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        id v37 = v16;
        __int16 v38 = 2112;
        id v39 = v10;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v12;
        __int16 v42 = 2112;
        v43 = v14;
        _os_log_error_impl(&dword_1A62FC000, WeakRetained, OS_LOG_TYPE_ERROR, "[%{public}@] Client settings update aborted due to connection mismatch : diff=%@ connection=%@ expected=%@", buf, 0x2Au);
      }
    }
  }
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(unsigned __int8 *)(a1 + 66));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) { {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v10);
  }
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v7 = v10;
  if (v6)
  {
    if (a2)
    {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, 0);
    }
    else
    {
      v8 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:2];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v8);
    }
    uint64_t v7 = v10;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);
    uint64_t v7 = v10;
  }
}

- (void)workspace:(void *)a3 sendUpdatedSettings:(void *)a4 withDiff:(void *)a5 transitionContext:(void *)a6 completion:
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v44 = a3;
  id v46 = a4;
  id v11 = a5;
  id v41 = a6;
  if (a1)
  {
    [*(id *)(a1 + 152) assertOnQueue];
    v47 = [v45 process];
    uint32_t v40 = arc4random();
    uint64_t v12 = FBSceneLifecycleStateForSettings(v44);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    uint64_t v13 = [v44 copy];
    long long v14 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v13;

    uint64_t v15 = +[FBWorkspaceScene _sceneActionForLifecycleFromState:*(unsigned __int8 *)(a1 + 140) toState:v12];
    if (v15 == 1)
    {
      uint64_t v15 = 1;
      if (([v46 _isSignifcant] & 1) == 0)
      {
        long long v16 = [*(id *)(a1 + 24) specification];
        int v17 = [v16 _isSignificantTransitionContext:v11];

        if (!v17) { {
          uint64_t v15 = 0;
        }
        }
      }
    }
    unsigned int v42 = [v11 allowCPUThrottling];
    v18 = [v11 updateContext];
    uint64_t v19 = [v18 isClientLifecycleExternallyManaged];

    v43 = [v11 _uiApplicationSceneTransitionContextShim];
    [v47 execTime];
    objc_msgSend(v43, "setExecTime:");
    int v20 = *(unsigned __int8 *)(a1 + 140);
    if (v20 != v12)
    {
      uint64_t v21 = FBLogProcessScene();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = *(void **)(a1 + 40);
        v23 = FBSceneLifecycleStateDescription(v12);
        *(_DWORD *)buf = 138543618;
        id v73 = v22;
        __int16 v74 = 2114;
        v75 = v23;
        _os_log_impl(&dword_1A62FC000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene lifecycle state did change: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(a1 + 140) = v12;
    }
    if (*(unsigned char *)(a1 + 143))
    {
      v24 = 0;
    }
    else
    {
      *(unsigned char *)(a1 + 143) = 1;
      v25 = (void *)MEMORY[0x1E4F629B8];
      id v26 = [*(id *)(a1 + 24) specification];
      v24 = [v25 parametersForSpecification:v26];

      [v24 setSettings:*(void *)(a1 + 64)];
      [v24 setClientSettings:*(void *)(a1 + 72)];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__4;
    v70[4] = __Block_byref_object_dispose__4;
    id v71 = 0;
    if (*(void *)(a1 + 48))
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F62A48]);
      [v27 setSettingsDiff:v46];
      [v27 setTransitionContext:v11];
      [v27 setSource:1];
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      char v69 = 0;
      v28 = *(void **)(a1 + 48);
      if (v24)
      {
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke;
        v65[3] = &unk_1E5C496D8;
        v65[4] = &v66;
        [v28 scene:a1 didInitializeWithEvent:v27 completion:v65];
      }
      else
      {
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2;
        v64[3] = &unk_1E5C4A9A0;
        v64[4] = &v66;
        v64[5] = v70;
        [v28 scene:a1 reviewEvent:v27 withCompletion:v64];
      }
      if (!*((unsigned char *)v67 + 24))
      {
        v33 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v27, *(void *)(a1 + 48)];
        uint64_t v34 = MEMORY[0x1E4F14500];
        id v35 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_sendUpdatedSettings_withDiff_transitionContext_completion_);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          id v37 = (objc_class *)objc_opt_class();
          __int16 v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138544642;
          id v73 = v36;
          __int16 v74 = 2114;
          v75 = v38;
          __int16 v76 = 2048;
          uint64_t v77 = a1;
          __int16 v78 = 2114;
          v79 = @"FBWorkspaceScene.m";
          __int16 v80 = 1024;
          int v81 = 671;
          __int16 v82 = 2114;
          v83 = v33;
          _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v33 UTF8String];
        uint64_t v39 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:](v39);
      }
      _Block_object_dispose(&v66, 8);
    }
    objc_msgSend((id)a1, "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", v15, v42, v19);
    if (v20 != v12) { {
      -[FBWorkspace _workspaceSceneLifecycleStateChanged:](v45, (void *)a1);
    }
    }
    if (v24)
    {
      v29 = FBAnalyticsLogHangTracerEvent(v47, 2);
    }
    else
    {
      v29 = 0;
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_91;
    v57[3] = &unk_1E5C4A9C8;
    v57[4] = a1;
    char v61 = v15;
    char v62 = v42;
    char v63 = v19;
    id v58 = v41;
    v60 = v70;
    id v30 = v29;
    id v59 = v30;
    uint64_t v31 = MEMORY[0x1AD0B8C50](v57);
    uint64_t v32 = (void *)v31;
    if (v15)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2_93;
      v48[3] = &unk_1E5C4AA18;
      id v49 = v47;
      uint64_t v50 = a1;
      char v56 = v15;
      id v51 = v11;
      unsigned int v55 = v40 % 0xFFFF;
      id v54 = v32;
      id v52 = v24;
      id v53 = v46;
      objc_msgSend((id)a1, "_workspaceQueue_sendMessageToClient:", v48);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, void))(v31 + 16))(v31, 1, 0);
    }

    _Block_object_dispose(v70, 8);
  }
}

- (void)_workspaceQueue_updateAssertion
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    return;
  }
  uint64_t v4 = self->_lock_settings;
  int v5 = [(FBSSceneSettings *)v4 activityMode];
  int lock_lifecycleState = self->_lock_lifecycleState;
  uint64_t v7 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    if ([(FBSSceneSettings *)v4 isForeground]
      && ([(FBSSceneSettings *)v4 prefersProcessTaskSuspensionWhileSceneForeground] & 1) == 0)
    {
      int v8 = 0;
      if ([(FBSSceneSettings *)v4 isOccluded]) { {
        LOBYTE(v5) = [(FBSSceneSettings *)v4 isIgnoringOcclusions] - 1;
      }
      }
      else {
        LOBYTE(v5) = 0;
      }
      goto LABEL_21;
    }
    LOBYTE(v5) = -3;
  }
  int v8 = 0;
  unint64_t queue_inFlightUpdateEvents = self->_queue_inFlightUpdateEvents;
  if (queue_inFlightUpdateEvents && v5 == 253)
  {
    if (queue_inFlightUpdateEvents == self->_queue_inFlightExternallyManagedEvents)
    {
      int v8 = 0;
      LOBYTE(v5) = -3;
    }
    else
    {
      if (self->_queue_inFlightUpdateAllowsThrottling)
      {
        if (self->_queue_inFlightUpdateDisallowsThrottling) { {
          LOBYTE(v5) = -1;
        }
        }
        else {
          LOBYTE(v5) = -2;
        }
      }
      else
      {
        LOBYTE(v5) = -1;
      }
      int v8 = 1;
    }
  }
LABEL_21:
  if (lock_lifecycleState == 2)
  {
    uint64_t IsForeground = 1;
  }
  else if (self->_queue_inFlightLifecycleEvents)
  {
    uint64_t IsForeground = FBWorkspaceAssertionStateIsForeground(self->_queue_assertionState);
    v8 |= IsForeground;
  }
  else
  {
    uint64_t IsForeground = 0;
  }
  int v11 = (char)v5;
  if (self->_queue_activityMode == v5) { {
    goto LABEL_34;
  }
  }
  self->_queue_activityMode = v5;
  uint64_t v12 = FBLogProcessScene();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      logProem = self->_logProem;
      uint64_t v15 = NSStringFromFBSSceneActivityMode();
      int v27 = 138543618;
      v28 = logProem;
      __int16 v29 = 2114;
      id v30 = v15;
      long long v16 = "[%{public}@] Scene activity mode did change: %{public}@ (transient).";
LABEL_32:
      _os_log_impl(&dword_1A62FC000, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, 0x16u);
    }
  }
  else if (v13)
  {
    int v17 = self->_logProem;
    uint64_t v15 = NSStringFromFBSSceneActivityMode();
    int v27 = 138543618;
    v28 = v17;
    __int16 v29 = 2114;
    id v30 = v15;
    long long v16 = "[%{public}@] Scene activity mode did change: %{public}@.";
    goto LABEL_32;
  }

LABEL_34:
  switch(v11)
  {
    case -3:
      if (IsForeground)
      {
        BOOL v18 = [(FBSSceneSettings *)v4 jetsamMode] == 1;
        unsigned int v19 = 3;
        unsigned int v20 = 7;
        goto LABEL_44;
      }
      break;
    case -2:
      if (IsForeground)
      {
        BOOL v18 = [(FBSSceneSettings *)v4 jetsamMode] == 1;
        unsigned int v19 = 4;
        unsigned int v20 = 8;
        goto LABEL_44;
      }
      uint64_t IsForeground = 1;
      break;
    case -1:
      if (!IsForeground) { {
        goto LABEL_47;
      }
      }
      BOOL v18 = [(FBSSceneSettings *)v4 jetsamMode] == 1;
      unsigned int v19 = 5;
      unsigned int v20 = 9;
      goto LABEL_44;
    case 0:
      if (IsForeground)
      {
        BOOL v18 = [(FBSSceneSettings *)v4 jetsamMode] == 1;
        unsigned int v19 = 6;
        unsigned int v20 = 10;
LABEL_44:
        if (v18) { {
          uint64_t IsForeground = v20;
        }
        }
        else {
          uint64_t IsForeground = v19;
        }
      }
      else
      {
LABEL_47:
        uint64_t IsForeground = 2;
      }
      break;
    default:
      uint64_t IsForeground = 0;
      break;
  }
  if (self->_queue_assertionState != IsForeground)
  {
    self->_queue_assertionState = IsForeground;
    uint64_t v21 = FBLogProcessScene();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = self->_logProem;
      v23 = NSStringFromFBWorkspaceAssertionState(IsForeground);
      int v27 = 138543618;
      v28 = v22;
      __int16 v29 = 2114;
      id v30 = v23;
      _os_log_impl(&dword_1A62FC000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene assertion state did change: %{public}@.", (uint8_t *)&v27, 0x16u);
    }
    v24 = self->_queue_workspaceAssertion;
    -[FBWorkspaceConnection _workspaceScene:acquireAssertionWithState:]((uint64_t)v7, self, IsForeground);
    v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    queue_workspaceAssertion = self->_queue_workspaceAssertion;
    self->_queue_workspaceAssertion = v25;

    [(BSInvalidatable *)v24 invalidate];
  }
}

- (void)_workspaceQueue_incrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5
{
  if (a3)
  {
    ++self->_queue_inFlightUpdateEvents;
    uint64_t v5 = 120;
    if (a4) { {
      uint64_t v5 = 112;
    }
    }
    ++*(Class *)((char *)&self->super.isa + v5);
    if (a3 != 1) { {
      ++self->_queue_inFlightLifecycleEvents;
    }
    }
    if (a5) { {
      ++self->_queue_inFlightExternallyManagedEvents;
    }
    }
  }
  [(FBWorkspaceScene *)self _workspaceQueue_updateAssertion];
}

+ (unsigned)_sceneActionForLifecycleFromState:(unsigned __int8)a3 toState:(unsigned __int8)a4
{
  if (a3)
  {
    if (a3 == 2)
    {
      if (a4 < 3u)
      {
        char v4 = 8 * a4;
        unsigned int v5 = 66307;
        return v5 >> v4;
      }
    }
    else if (a3 == 1 && a4 < 3u)
    {
      char v4 = 8 * a4;
      unsigned int v5 = 131329;
      return v5 >> v4;
    }
    LOBYTE(v6) = 1;
    return v6;
  }
  LOBYTE(v6) = 2;
  return v6;
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:(unsigned __int8)a3 allowThrottling:(BOOL)a4 externallyManaged:(BOOL)a5
{
  if (a3)
  {
    unint64_t queue_inFlightUpdateEvents = self->_queue_inFlightUpdateEvents;
    if (!queue_inFlightUpdateEvents)
    {
      id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", a4, a5, @"_queue_inFlightUpdateEvents > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:]();
      }
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6308B14);
    }
    self->_unint64_t queue_inFlightUpdateEvents = queue_inFlightUpdateEvents - 1;
    if (a4)
    {
      p_unint64_t queue_inFlightUpdateAllowsThrottling = &self->_queue_inFlightUpdateAllowsThrottling;
      unint64_t queue_inFlightUpdateAllowsThrottling = self->_queue_inFlightUpdateAllowsThrottling;
      if (!queue_inFlightUpdateAllowsThrottling)
      {
        int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_queue_inFlightUpdateAllowsThrottling > 0"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:]();
        }
        }
        goto LABEL_25;
      }
    }
    else
    {
      p_unint64_t queue_inFlightUpdateAllowsThrottling = &self->_queue_inFlightUpdateDisallowsThrottling;
      unint64_t queue_inFlightUpdateAllowsThrottling = self->_queue_inFlightUpdateDisallowsThrottling;
      if (!queue_inFlightUpdateAllowsThrottling)
      {
        int v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_queue_inFlightUpdateDisallowsThrottling > 0"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:].cold.4();
        }
        }
        [v11 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6308B78);
      }
    }
    unint64_t *p_queue_inFlightUpdateAllowsThrottling = queue_inFlightUpdateAllowsThrottling - 1;
    if (a3 >= 2u) { {
      --self->_queue_inFlightLifecycleEvents;
    }
    }
    if (a5)
    {
      unint64_t queue_inFlightExternallyManagedEvents = self->_queue_inFlightExternallyManagedEvents;
      if (!queue_inFlightExternallyManagedEvents)
      {
        int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_queue_inFlightExternallyManagedEvents > 0"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceScene _workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:]();
        }
        }
LABEL_25:
        [v8 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6308A50);
      }
      self->_unint64_t queue_inFlightExternallyManagedEvents = queue_inFlightExternallyManagedEvents - 1;
    }
  }

  [(FBWorkspaceScene *)self _workspaceQueue_updateAssertion];
}

- (void)_workspaceQueue_sendMessageToClient:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v5 = self->_lock_connection;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__FBWorkspaceScene__workspaceQueue_sendMessageToClient___block_invoke;
    v6[3] = &unk_1E5C4A978;
    v6[4] = self;
    id v7 = v4;
    -[FBWorkspaceConnection _workspaceScene:enqueueConnectBlock:]((uint64_t)v5, self, v6);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __56__FBWorkspaceScene__workspaceQueue_sendMessageToClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 136);
  id v6 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v4 = *(void *)(a1 + 32);
  LODWORD(v3) = *(unsigned __int8 *)(v4 + 145);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 136));
  id v5 = v6;
  if (v3) { {
    id v5 = 0;
  }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = FBLogProcessScene();
  os_log_type_t v7 = *(unsigned char *)(a1 + 60);
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
    uint64_t v9 = _FBSceneActionToString(*(unsigned __int8 *)(a1 + 61));
    int v10 = *(_DWORD *)(a1 + 56);
    int v12 = 138544130;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 1024;
    int v19 = a2;
    _os_log_impl(&dword_1A62FC000, v6, v7, "[%{public}@] Scene action [%{public}@][%#04x] completed with success: %d", (uint8_t *)&v12, 0x22u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_cancelWatchdogTimer:", *(void *)(a1 + 40));
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) { {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
  }
}

void __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_2_93(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4 && (int v5 = [v4 pid], v5 != getpid()))
    {
      id v6 = objc_msgSend(*(id *)(a1 + 40), "_workspaceQueue_createWatchdogForProcess:sceneAction:transitionContext:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 84), *(void *)(a1 + 48));
    }
    else
    {
      id v6 = 0;
    }
    os_log_type_t v12 = *(unsigned char *)(a1 + 84) == 1 && v6 == 0;
    uint64_t v13 = FBLogProcessScene();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 40);
      uint64_t v15 = _FBSceneActionToString(*(unsigned __int8 *)(a1 + 84));
      int v16 = *(_DWORD *)(a1 + 80);
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [v6 _policyDesc];
      int v19 = (void *)v18;
      *(_DWORD *)buf = 138544386;
      uint64_t v20 = @"none";
      uint64_t v37 = v14;
      if (v18) { {
        uint64_t v20 = (__CFString *)v18;
      }
      }
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      __int16 v40 = 1024;
      int v41 = v16;
      __int16 v42 = 2048;
      uint64_t v43 = v17;
      __int16 v44 = 2114;
      id v45 = v20;
      _os_log_impl(&dword_1A62FC000, v13, v12, "[%{public}@] Sending scene action [%{public}@][%#04x] to process %p (watchdog: %{public}@)", buf, 0x30u);
    }
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke_97;
    int v27 = &unk_1E5C4A9F0;
    os_log_type_t v32 = v12;
    uint64_t v28 = *(void *)(a1 + 40);
    char v33 = *(unsigned char *)(a1 + 84);
    int v31 = *(_DWORD *)(a1 + 80);
    id v9 = v6;
    id v29 = v9;
    id v30 = *(id *)(a1 + 72);
    uint64_t v21 = (void *)MEMORY[0x1AD0B8C50](&v24);
    uint64_t v22 = *(void *)(a1 + 56);
    v23 = *(void **)(a1 + 40);
    if (v22) { {
      objc_msgSend(v23, "_workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:", v3, v22, *(void *)(a1 + 48), v21, v24, v25, v26, v27, v28, v29);
    }
    }
    else {
      objc_msgSend(v23, "_workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:", v3, *(void *)(a1 + 64), *(void *)(a1 + 48), v21, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28588];
    id v35 = @"Client process exited.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    int v10 = [v8 errorWithDomain:@"FBWorkspaceScene" code:1 userInfo:v9];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v10);
  }
}

- (FBSSceneSettings)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_settings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_workspaceQueue_sendSceneUpdateToClient:(id)a3 settingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    uint64_t v14 = (void (**)(void, void, void))v13;
    if (([v11 _isSignifcant] & 1) != 0
      || ([(FBSSceneDefinition *)self->_definition specification],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 _isSignificantTransitionContext:v12],
          v15,
          v16))
    {
      identity = self->_identity;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __102__FBWorkspaceScene__workspaceQueue_sendSceneUpdateToClient_settingsDiff_transitionContext_completion___block_invoke;
      v19[3] = &unk_1E5C4A258;
      uint64_t v20 = v14;
      [v10 sceneID:identity updateWithSettingsDiff:v11 transitionContext:v12 completion:v19];
    }
    else
    {
      v14[2](v14, 1, 0);
    }
  }
  else
  {
    uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"client != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceScene _workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:]();
    }
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_workspaceQueue_sendSceneCreateToClient:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    int v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"client != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceScene _workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:]();
    }
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6309CD4);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __100__FBWorkspaceScene__workspaceQueue_sendSceneCreateToClient_parameters_transitionContext_completion___block_invoke;
  v20[3] = &unk_1E5C49F40;
  v20[4] = self;
  id v14 = v13;
  id v21 = v14;
  uint64_t v15 = (void *)MEMORY[0x1AD0B8C50](v20);
  int v16 = FBLogProcessScene();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    logProem = self->_logProem;
    *(_DWORD *)buf = 138543362;
    v23 = logProem;
    _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending scene create.", buf, 0xCu);
  }

  identity = self->_identity;
  if (self->_reconnect) { {
    [v10 reconnectSceneWithIdentity:identity parameters:v11 transitionContext:v12 completion:v15];
  }
  }
  else {
    [v10 createSceneWithIdentity:identity parameters:v11 transitionContext:v12 completion:v15];
  }
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (id)succinctDescription
{
  v2 = [(FBWorkspaceScene *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identity withName:0];
  os_unfair_lock_lock(&self->_lock);
  id v5 = (id)[v3 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  os_unfair_lock_unlock(&self->_lock);

  return v3;
}

void __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke_2;
    v6[3] = &unk_1E5C498D8;
    id v7 = v3;
    [v5 performAsync:v6];
  }
}

- (FBWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = (id **)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    id v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceScene initWithConnection:host:settings:clientSettings:fromRemnant:]();
    }
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6317C1CLL);
  }
  uint64_t v17 = v16;
  uint64_t v18 = [v14 definition];
  if (([v18 isValid] & 1) == 0)
  {
    uint64_t v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[definition isValid]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceScene initWithConnection:host:settings:clientSettings:fromRemnant:]();
    }
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6317C80);
  }
  int v19 = [(FBWorkspaceScene *)self init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_host, v14);
    v20->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_lock_connection, a3);
    v20->_usesOutgoingConnection = -[FBWorkspaceConnection isOutgoing]((BOOL)v13);
    uint64_t v21 = -[FBWorkspaceConnection queue](v13);
    workspaceQueue = v20->_workspaceQueue;
    v20->_workspaceQueue = (FBSSerialQueue *)v21;

    uint64_t v23 = [v18 copy];
    definition = v20->_definition;
    v20->_definition = (FBSSceneDefinition *)v23;

    uint64_t v25 = [v18 identity];
    identity = v20->_identity;
    v20->_identity = (FBSSceneIdentity *)v25;

    int v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_sceneCreatedBlocks = v20->_lock_sceneCreatedBlocks;
    v20->_lock_sceneCreatedBlocks = v27;

    if (a7) { {
      char v29 = 1;
    }
    }
    else {
      char v29 = [v15 isClientFuture];
    }
    v20->_reconnect = v29;
    uint64_t v30 = [v15 copy];
    lock_settings = v20->_lock_settings;
    v20->_lock_settings = (FBSSceneSettings *)v30;

    uint64_t v32 = [v17 copy];
    lock_clientSettings = v20->_lock_clientSettings;
    v20->_lock_clientSettings = (FBSSceneClientSettings *)v32;

    v20->_queue_activityMode = 0;
    uint64_t v34 = [NSString stringWithFormat:@"%p:%@", v20, v20->_identity];
    logProem = v20->_logProem;
    v20->_logProem = (NSString *)v34;

    id v36 = [v18 specification];
    uint64_t v37 = (objc_class *)[v36 hostAgentClass];

    if (v37)
    {
      __int16 v38 = (FBSSceneHostAgent *)objc_alloc_init(v37);
      hostAgent = v20->_hostAgent;
      v20->_hostAgent = v38;

      __int16 v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      agentSessions = v20->_agentSessions;
      v20->_agentSessions = v40;

      objc_opt_class();
      if (objc_opt_isKindOfClass()) { {
        [(FBSSceneHostAgent *)v20->_hostAgent _configureWithScene:v20];
      }
      }
    }
    __int16 v42 = FBLogProcessScene();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = v20->_logProem;
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v43;
      __int16 v49 = 2048;
      uint64_t v50 = v13;
      _os_log_impl(&dword_1A62FC000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initialized with connection: %p.", buf, 0x16u);
    }
  }
  return v20;
}

uint64_t __88__FBWorkspaceScene_workspace_sendUpdatedSettings_withDiff_transitionContext_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke_2;
    v6[3] = &unk_1E5C498D8;
    id v7 = v3;
    [v5 performAsync:v6];
  }
}

- (void)workspace:(void *)a3 handleActions:(uint64_t)a4 forExtension:(void *)a5 fromConnection:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    [*(id *)(a1 + 152) assertOnQueue];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    id v12 = *(id *)(a1 + 8);
    if (v12 != v11)
    {
      id WeakRetained = v12;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
      id v14 = FBLogProcessScene();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        id v36 = v22;
        __int16 v37 = 1024;
        *(_DWORD *)__int16 v38 = [v10 count];
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v11;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = WeakRetained;
        _os_log_error_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Aborted %u action(s) due to connection mismatch : connection=%@ expected=%@", buf, 0x26u);
      }

      goto LABEL_14;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    id v15 = FBLogProcessScene();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v36 = v16;
      __int16 v37 = 1024;
      *(_DWORD *)__int16 v38 = [v10 count];
      _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Received %u action(s)", buf, 0x12u);
    }

    if (!a4 && *(void *)(a1 + 48))
    {
      uint64_t v17 = [*(id *)(a1 + 24) specification];
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v17, "transitionContextClass"), "transitionContext");

      [v18 setActions:v10];
      id v19 = objc_alloc_init(MEMORY[0x1E4F62A48]);
      [v19 setTransitionContext:v18];
      [v19 setSource:2];
      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x2020000000;
      char v34 = 0;
      uint64_t v20 = *(void **)(a1 + 48);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke;
      v30[3] = &unk_1E5C4AA90;
      v30[4] = a1;
      v30[5] = &v31;
      [v20 scene:a1 reviewEvent:v19 withCompletion:v30];
      if (!*((unsigned char *)v32 + 24))
      {
        uint64_t v23 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v19, *(void *)(a1 + 48)];
        uint64_t v24 = MEMORY[0x1E4F14500];
        id v25 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_handleActions_forExtension_fromConnection_);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          int v27 = (objc_class *)objc_opt_class();
          uint64_t v28 = NSStringFromClass(v27);
          *(_DWORD *)buf = 138544642;
          id v36 = v26;
          __int16 v37 = 2114;
          *(void *)__int16 v38 = v28;
          *(_WORD *)&v38[8] = 2048;
          *(void *)&v38[10] = a1;
          *(_WORD *)&v38[18] = 2114;
          *(void *)&v38[20] = @"FBWorkspaceScene.m";
          __int16 v39 = 1024;
          int v40 = 893;
          __int16 v41 = 2114;
          __int16 v42 = v23;
          _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v23 UTF8String];
        uint64_t v29 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:](v29);
      }
      uint64_t v21 = [v18 actions];

      _Block_object_dispose(&v31, 8);
      id v10 = (id)v21;
    }
    if ([v10 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      [WeakRetained clientToken:a1 didReceiveActions:v10 forExtension:a4];
LABEL_14:
    }
  }
}

- (void)dealloc
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidate
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v4 = FBLogProcessScene();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      logProem = self->_logProem;
      lock_connection = self->_lock_connection;
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = logProem;
      __int16 v31 = 2048;
      uint64_t v32 = lock_connection;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated for connection: %p.", buf, 0x16u);
    }

    uint64_t v7 = self->_lock_connection;
    self->_lock_connection = 0;

    self->_lock_invalidated = 1;
    uint64_t v8 = self->_lock_sceneCreatedBlocks;
    lock_sceneCreatedBlocks = self->_lock_sceneCreatedBlocks;
    self->_lock_sceneCreatedBlocks = 0;

    os_unfair_lock_unlock(p_lock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = v8;
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      uint64_t v13 = *MEMORY[0x1E4F28588];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) { {
            objc_enumerationMutation(obj);
          }
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = v13;
          int v27 = @"scene was invalidated";
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          uint64_t v18 = [v16 errorWithDomain:@"FBWorkspaceScene" code:1 userInfo:v17];
          (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v18);
        }
        uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v11);
    }

    workspaceQueue = self->_workspaceQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __30__FBWorkspaceScene_invalidate__block_invoke;
    v21[3] = &unk_1E5C49AE0;
    v21[4] = self;
    [(FBSSerialQueue *)workspaceQueue performAsync:v21];
  }
}

uint64_t __30__FBWorkspaceScene_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_invalidate");
}

- (void)_enqueueSceneCreateCompletionBlock:(uint64_t)a1
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void (**)(void, void, void))v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceScene _enqueueSceneCreateCompletionBlock:]();
      }
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A634B288);
    }
    uint64_t v5 = (os_unfair_lock_s *)(a1 + 136);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    uint64_t v6 = *(void **)(a1 + 80);
    if (v6)
    {
      uint64_t v7 = (void *)[v4 copy];
      uint64_t v8 = (void *)MEMORY[0x1AD0B8C50]();
      [v6 addObject:v8];

      os_unfair_lock_unlock(v5);
    }
    else
    {
      int v9 = *(unsigned __int8 *)(a1 + 145);
      os_unfair_lock_unlock(v5);
      if (v9)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28588];
        v15[0] = @"scene was invalidated";
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
        uint64_t v12 = [v10 errorWithDomain:@"FBWorkspaceScene" code:1 userInfo:v11];
        ((void (**)(void, void, void *))v4)[2](v4, 0, v12);
      }
      else
      {
        v4[2](v4, 1, 0);
      }
    }
  }
}

- (void)_workspaceQueue_invalidateSceneAgentWithEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  hostAgent = self->_hostAgent;
  if (hostAgent)
  {
    if (v4)
    {
      [(FBSSceneHostAgent *)self->_hostAgent scene:self willInvalidateWithEvent:v4 completion:&__block_literal_global_13];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F62A48]);
      [(FBSSceneHostAgent *)hostAgent scene:self willInvalidateWithEvent:v7 completion:&__block_literal_global_13];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = self->_agentSessions;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) { {
            objc_enumerationMutation(v8);
          }
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "invalidate", (void)v15);
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    uint64_t v13 = self->_hostAgent;
    self->_hostAgent = 0;

    agentSessions = self->_agentSessions;
    self->_agentSessions = 0;
  }
}

- (void)_workspaceQueue_invalidate
{
  [(FBWorkspaceScene *)self _workspaceQueue_invalidateSceneAgentWithEvent:0];
}

- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5
{
  return 0;
}

- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3
{
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBWorkspaceScene *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBWorkspaceScene *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__FBWorkspaceScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5C497A0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

uint64_t __58__FBWorkspaceScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 40) + 48))
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F62810], "succinctDescriptionForObject:");
    id v4 = (id)[v2 appendObject:v3 withName:@"agent"];
  }
  else
  {
    id v5 = (id)[*(id *)(a1 + 32) appendObject:@"(none)" withName:@"agent"];
  }
  id v6 = (void *)MEMORY[0x1E4F62810];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) clientProcess];
  uint64_t v9 = [v6 succinctDescriptionForObject:v8];
  id v10 = (id)[v7 appendObject:v9 withName:@"clientProcess"];

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 56);

  return [v11 appendArraySection:v12 withName:@"agentSessions" skipIfEmpty:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(FBWorkspaceScene *)self descriptionWithMultilinePrefix:0];
}

- (id)identifier
{
  return (id)[(FBSSceneIdentity *)self->_identity identifier];
}

- (id)definition
{
  return self->_definition;
}

- (id)parameters
{
  id v3 = objc_alloc(MEMORY[0x1E4F629B8]);
  id v4 = [(FBSSceneDefinition *)self->_definition specification];
  id v5 = (void *)[v3 initWithSpecification:v4];

  os_unfair_lock_lock(&self->_lock);
  [v5 setSettings:self->_lock_settings];
  [v5 setClientSettings:self->_lock_clientSettings];
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)[(FBSSceneDefinition *)self->_definition specification];
}

- (id)callOutQueue
{
  return self->_workspaceQueue;
}

- (id)counterpartAgent
{
  return 0;
}

- (id)hostProcess
{
  v2 = +[FBProcessManager sharedInstance];
  id v3 = [v2 currentProcess];

  return v3;
}

- (id)clientProcess
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_connection;
  os_unfair_lock_unlock(p_lock);
  id v5 = -[FBWorkspaceConnection remoteProcess]((id *)&v4->super.isa);

  return v5;
}

- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4
{
  workspaceQueue = self->_workspaceQueue;
  id v7 = a4;
  id v8 = a3;
  [(FBSSerialQueue *)workspaceQueue assertOnQueue];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F62A28]) initWithName:v8 scene:self executionPolicy:v7];

  if (v9) { {
    [(NSMutableArray *)self->_agentSessions addObject:v9];
  }
  }
  [v9 open];

  return v9;
}

- (void)closeSession:(id)a3
{
  id v4 = a3;
  [(FBSSerialQueue *)self->_workspaceQueue assertOnQueue];
  if (v4 && [(NSMutableArray *)self->_agentSessions containsObject:v4])
  {
    [v4 close];
    [v4 invalidate];
    [(NSMutableArray *)self->_agentSessions removeObject:v4];
  }
}

- (void)agent:(id)a3 registerMessageHandler:(id)a4
{
  id v5 = FBLogProcessScene();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspaceScene agent:registerMessageHandler:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
  }
  }
}

- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  uint64_t v6 = (void (**)(id, void, void *))a5;
  uint64_t v7 = FBLogProcessScene();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspaceScene agent:sendMessage:withResponse:]((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }
  }

  if (v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:2];
    v6[2](v6, 0, v14);
  }
}

- (void)workspace:(void *)a3 sendInvalidationWithTransitionContext:(void *)a4 completion:
{
  id v6 = a3;
  id v7 = a4;
  if (a1)
  {
    [a1[19] assertOnQueue];
    uint64_t v8 = [v6 allowCPUThrottling];
    char v9 = v8;
    objc_msgSend(a1, "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 3, v8, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke;
    v15[3] = &unk_1E5C4AA40;
    v15[4] = a1;
    char v17 = v9;
    id v16 = v7;
    uint64_t v10 = (void *)MEMORY[0x1AD0B8C50](v15);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_2;
    v12[3] = &unk_1E5C4AA68;
    v12[4] = a1;
    id v13 = v6;
    id v14 = v10;
    id v11 = v10;
    objc_msgSend(a1, "_workspaceQueue_sendMessageToClient:", v12);
  }
}

void __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 3, *(unsigned __int8 *)(a1 + 48), 0);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) { {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
  }
}

void __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = FBLogProcessScene();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v5;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending scene destroy.", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 48))
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F62A48]);
      [v7 setTransitionContext:*(void *)(a1 + 40)];
      [v7 setSource:1];
      objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_invalidateSceneAgentWithEvent:", v7);

      uint64_t v6 = *(void *)(a1 + 32);
    }
    uint64_t v8 = *(void *)(v6 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_101;
    v14[3] = &unk_1E5C4A258;
    uint64_t v9 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v3 sceneID:v8 destroyWithTransitionContext:v9 completion:v14];
    uint64_t v10 = v15;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    char v17 = @"Client is nil";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v13 = [v12 errorWithDomain:@"FBWorkspaceScene" code:1 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v13);
  }
}

uint64_t __79__FBWorkspaceScene_workspace_sendInvalidationWithTransitionContext_completion___block_invoke_101(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)workspace:(void *)a3 sendActions:(uint64_t)a4 toExtension:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    [*(id *)(a1 + 152) assertOnQueue];
    id v9 = v8;
    if (!a4 && *(void *)(a1 + 48))
    {
      uint64_t v10 = [*(id *)(a1 + 24) specification];
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "transitionContextClass"), "transitionContext");

      [v11 setActions:v9];
      id v12 = objc_alloc_init(MEMORY[0x1E4F62A48]);
      [v12 setTransitionContext:v11];
      [v12 setSource:1];
      uint64_t v26 = 0;
      int v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      id v13 = *(void **)(a1 + 48);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke;
      v25[3] = &unk_1E5C4AA90;
      v25[4] = a1;
      v25[5] = &v26;
      [v13 scene:a1 reviewEvent:v12 withCompletion:v25];
      if (!*((unsigned char *)v27 + 24))
      {
        id v15 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v12, *(void *)(a1 + 48)];
        uint64_t v16 = MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_workspace_sendActions_toExtension_);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = (objc_class *)objc_opt_class();
          uint64_t v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138544642;
          id v31 = v18;
          __int16 v32 = 2114;
          uint64_t v33 = v20;
          __int16 v34 = 2048;
          uint64_t v35 = a1;
          __int16 v36 = 2114;
          __int16 v37 = @"FBWorkspaceScene.m";
          __int16 v38 = 1024;
          int v39 = 792;
          __int16 v40 = 2114;
          __int16 v41 = v15;
          _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v15 UTF8String];
        uint64_t v21 = _bs_set_crash_log_message();
        -[FBWorkspaceEventDispatcher registerTarget:](v21);
      }
      uint64_t v14 = [v11 actions];

      _Block_object_dispose(&v26, 8);
      id v9 = (id)v14;
    }
    if ([v9 count])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_107;
      v22[3] = &unk_1E5C4AAE0;
      v22[4] = a1;
      id v23 = v9;
      uint64_t v24 = a4;
      objc_msgSend((id)a1, "_workspaceQueue_sendMessageToClient:", v22);
    }
  }
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 152);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2;
    v6[3] = &unk_1E5C498D8;
    id v7 = v3;
    [v5 performAsync:v6];
  }
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_107(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_incrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 1, 0, 0);
    id v4 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2_109;
    v24[3] = &unk_1E5C497A0;
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    id v25 = v5;
    uint64_t v26 = v6;
    id v7 = (void *)[v24 copy];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      uint64_t v11 = NSStringFromClass(*(Class *)(a1 + 48));
    }
    else
    {
      uint64_t v11 = 0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_3;
    v22[3] = &unk_1E5C4A258;
    id v12 = v7;
    id v23 = v12;
    [v3 sceneID:v9 sendActions:v8 toExtension:v11 completion:v22];
    if (v10) { {

    }
    }
    dispatch_time_t v13 = BSDispatchTimeWithInterval();
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 152) backingQueueIfExists];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4;
    v18[3] = &unk_1E5C4AAB8;
    uint64_t v15 = *(void *)(a1 + 32);
    id v19 = v5;
    uint64_t v20 = v15;
    id v21 = v12;
    id v16 = v12;
    id v17 = v5;
    dispatch_after(v13, v14, v18);
  }
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_2_109(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) signal];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:", 1, 0, 0);
  }
  return result;
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    id v2 = FBLogProcessScene();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) { {
      __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __91__FBWorkspaceScene_workspace_handleUpdatedClientSettings_transitionContext_fromConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__FBWorkspaceScene_workspace_handleActions_forExtension_fromConnection___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)usesOutgoingConnection
{
  return self->_usesOutgoingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

- (void)initWithConnection:host:settings:clientSettings:fromRemnant:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConnection:host:settings:clientSettings:fromRemnant:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_enqueueSceneCreateCompletionBlock:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_sendSceneCreateToClient:parameters:transitionContext:completion:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_sendSceneUpdateToClient:settingsDiff:transitionContext:completion:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_workspaceQueue_decrementInFlightUpdatesForAction:allowThrottling:externallyManaged:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)agent:(uint64_t)a3 registerMessageHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)agent:(uint64_t)a3 sendMessage:(uint64_t)a4 withResponse:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__FBWorkspaceScene_workspace_sendActions_toExtension___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end