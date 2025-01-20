@interface FBSScene
+ (id)pseudoSceneWithIdentifier:(id)a3 specification:(id)a4;
- (BOOL)_callOutQueue_willDestroyWithTransitionContext:(id)a3 completion:(id)a4;
- (BOOL)conformsToExtension:(Class)a3;
- (BOOL)everActivated;
- (BOOL)invalidateSnapshotWithContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)performSnapshotWithContext:(id)a3;
- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4;
- (BOOL)snapshotRequestAllowSnapshot:(id)a3;
- (BSAuditToken)hostAuditToken;
- (FBSScene)init;
- (FBSSceneClientSettings)clientSettings;
- (FBSSceneDefinition)definition;
- (FBSSceneDelegate)delegate;
- (FBSSceneHostHandle)hostHandle;
- (FBSSceneIdentity)identity;
- (FBSSceneIdentityToken)identityToken;
- (FBSSceneSettings)settings;
- (FBSSceneSpecification)specification;
- (FBSSceneUpdater)updater;
- (FBSWorkspaceService)workspaceService;
- (NSString)description;
- (NSString)identifier;
- (id)_beginUpdate;
- (id)_callOutQueue;
- (id)_createTransitionContext;
- (id)_initWithUpdater:(id)a3 identityToken:(id)a4 identity:(id)a5 parameters:(id)a6 hostHandle:(id)a7;
- (id)_lock_allComponents;
- (id)_observers;
- (id)callOutQueue;
- (id)clientProcess;
- (id)componentForExtension:(Class)a3 ofClass:(Class)a4;
- (id)counterpartAgent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)display;
- (id)fbsDisplay;
- (id)hostProcess;
- (id)layers;
- (id)loggingIdentifier;
- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4;
- (id)parameters;
- (id)snapshotRequest;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_beginUpdate;
- (void)_callOutQueue_coalesceClientSettingsUpdates:(id)a3;
- (void)_callOutQueue_didCreateWithTransitionContext:(id)a3 alternativeCreationCallout:(id)a4 completion:(id)a5;
- (void)_callOutQueue_didUpdateHostHandle:(id)a3;
- (void)_callOutQueue_invalidate;
- (void)_callOutQueue_updateExtensionsFromSettings:(id)a3 toSettings:(id)a4 withDiff:(id)a5;
- (void)_configureParameters:(id)a3;
- (void)_sendUpdate:(id)a3;
- (void)_updateClientSettings:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 withConfiguration:(id)a4;
- (void)agent:(id)a3 registerMessageHandler:(id)a4;
- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)attachContext:(id)a3;
- (void)attachLayer:(id)a3;
- (void)closeSession:(id)a3;
- (void)detachContext:(id)a3;
- (void)detachLayer:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)sendActions:(id)a3;
- (void)sendActions:(id)a3 toExtension:(Class)a4;
- (void)setDelegate:(id)a3;
- (void)updateClientSettings:(id)a3 withTransitionContext:(id)a4;
- (void)updateClientSettingsWithBlock:(id)a3;
- (void)updateClientSettingsWithTransitionBlock:(id)a3;
- (void)updateSettings:(id)a3;
- (void)updater:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)updater:(id)a3 didReceiveMessage:(id)a4 withResponse:(id)a5;
- (void)updater:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7;
@end

@implementation FBSScene

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

- (FBSSceneSpecification)specification
{
  return [(FBSSceneDefinition *)self->_definition specification];
}

- (void)updateClientSettingsWithTransitionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__FBSScene_updateClientSettingsWithTransitionBlock___block_invoke;
    v6[3] = &unk_1E58F5018;
    v6[4] = self;
    id v7 = v4;
    [(FBSScene *)self _updateClientSettings:v6];
  }
}

- (void)attachLayer:(id)a3
{
  id v4 = a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__FBSScene_attachLayer___block_invoke;
  v6[3] = &unk_1E58F4FC8;
  id v7 = v4;
  id v5 = v4;
  [(FBSScene *)self updateClientSettings:v6];
}

- (void)updateClientSettingsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__FBSScene_updateClientSettingsWithBlock___block_invoke;
    v6[3] = &unk_1E58F4FF0;
    id v7 = v4;
    [(FBSScene *)self _updateClientSettings:v6];
  }
}

- (void)updater:(id)a3 didUpdateSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6 completion:(id)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (uint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  id v14 = a7;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  os_unfair_lock_lock(&self->_lock);
  v15 = self->_lock_settings;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  if (v11 || !v12)
  {
    if (v11 && !v12) {
      BSEqualObjects();
    }
    if (!(v11 | v12))
    {
      unint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = [(id)v12 settingsByApplyingToMutableCopyOfSettings:self->_lock_settings];
  }
  v17 = (FBSSceneSettings *)[(id)v11 copy];
  lock_settings = self->_lock_settings;
  self->_lock_settings = v17;

LABEL_10:
  v39 = self->_lock_settings;
  os_unfair_lock_unlock(&self->_lock);
  v19 = [v13 animationFence];
  v20 = (BKSAnimationFenceHandle *)[v19 copy];
  calloutQueue_animationFence = self->_calloutQueue_animationFence;
  self->_calloutQueue_animationFence = v20;

  v22 = self->_callOutQueue_agent;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke;
  v49[3] = &unk_1E58F50D8;
  v49[4] = self;
  v23 = v22;
  v50 = v23;
  id v24 = WeakRetained;
  id v51 = v24;
  id v52 = v14;
  id v40 = v14;
  v25 = [off_1E58F44E0 sentinelWithSignalCount:2 signalHandler:v49];
  v26 = [v13 actions];
  if ([v26 count])
  {
    v27 = FBLogSceneClient();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [(FBSScene *)self loggingIdentifier];
      v28 = v38 = v15;
      v29 = [v26 fbs_singleLineDescriptionOfBSActions];
      *(_DWORD *)buf = 138543618;
      v54 = v28;
      __int16 v55 = 2114;
      v56 = v29;
      _os_log_impl(&dword_19C680000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) in scene-update: %{public}@", buf, 0x16u);

      v15 = v38;
    }
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_146;
  v41[3] = &unk_1E58F5150;
  v41[4] = self;
  v42 = v15;
  v43 = v39;
  id v44 = (id)v12;
  id v45 = v13;
  v46 = v23;
  id v47 = v25;
  id v48 = v24;
  id v30 = v24;
  id v31 = v25;
  v32 = v23;
  id v33 = v13;
  id v34 = (id)v12;
  v35 = v39;
  v36 = v15;
  [(FBSScene *)self _callOutQueue_coalesceClientSettingsUpdates:v41];
  [v31 signal];
  [(BKSAnimationFenceHandle *)self->_calloutQueue_animationFence invalidate];
  v37 = self->_calloutQueue_animationFence;
  self->_calloutQueue_animationFence = 0;
}

- (void)_sendUpdate:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = (FBSSceneUpdate *)a3;
  if (self->_callout_sceneUpdate != v4)
  {
    id v30 = [NSString stringWithFormat:@"invalid scene update"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _sendUpdate:](a2);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
  }
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
    v6 = (FBSSceneClientSettings *)p_isa[1];
    v38 = (FBSSceneClientSettings *)p_isa[3];
    id v7 = p_isa[5];
    os_unfair_lock_lock(&self->_lock);
    if (self->_everActivated) {
      lock_updater = self->_lock_updater;
    }
    else {
      lock_updater = 0;
    }
    v9 = lock_updater;
    if (v38 != v6)
    {
      v10 = [(FBSSettings *)v6 _copyClearingProgenitor:0];
      lock_clientSettings = self->_lock_clientSettings;
      self->_lock_clientSettings = v10;

      unint64_t v12 = v10;
      objc_storeStrong(p_isa + 1, v10);
      v6 = v12;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      id v13 = +[FBSSceneClientSettingsDiff diffFromSettings:v38 toSettings:v6];
      if (v13
        || ([(FBSSceneDefinition *)self->_definition specification],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v14 _isSignificantTransitionContext:v7],
            v14,
            v15))
      {
        self->_callOutQueue_mutationLocked = 1;
        objc_storeStrong(p_isa + 4, v13);
        if (!v7)
        {
          v16 = [(FBSScene *)self _createTransitionContext];
          id v17 = p_isa[5];
          p_isa[5] = v16;

          id v7 = v16;
        }
        if (self->_calloutQueue_animationFence && [v13 containsProperty:sel_layers])
        {
          v18 = (void *)[(BKSAnimationFenceHandle *)self->_calloutQueue_animationFence copy];
          [v7 setAnimationFence:v18];
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v19 = [(FBSScene *)self _observers];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * i) scene:self didUpdateClientSettings:p_isa];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v60 count:16];
          }
          while (v20);
        }

        if (self->_hasAgent)
        {
          v23 = objc_alloc_init(FBSSceneEvent);
          [(FBSSceneEvent *)v23 setClientSettingsDiff:v13];
          [(FBSSceneEvent *)v23 setTransitionContext:v7];
          [(FBSSceneEvent *)v23 setSource:2];
          uint64_t v40 = 0;
          v41 = &v40;
          uint64_t v42 = 0x2020000000;
          char v43 = 0;
          callOutQueue_agent = self->_callOutQueue_agent;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __24__FBSScene__sendUpdate___block_invoke;
          v39[3] = &unk_1E58F5068;
          v39[4] = self;
          v39[5] = &v40;
          [(FBSSceneClientAgent *)callOutQueue_agent scene:self reviewEvent:v23 withCompletion:v39];
          if (!*((unsigned char *)v41 + 24))
          {
            id v31 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v23, self->_callOutQueue_agent];
            v32 = MEMORY[0x1E4F14500];
            id v33 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v34 = (id)objc_claimAutoreleasedReturnValue();
              v35 = (objc_class *)objc_opt_class();
              v36 = NSStringFromClass(v35);
              *(_DWORD *)buf = 138544642;
              id v49 = v34;
              __int16 v50 = 2114;
              id v51 = v36;
              __int16 v52 = 2048;
              v53 = self;
              __int16 v54 = 2114;
              __int16 v55 = @"FBSScene.m";
              __int16 v56 = 1024;
              int v57 = 491;
              __int16 v58 = 2114;
              v59 = v31;
              _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v31 UTF8String];
            _bs_set_crash_log_message();
          }
          _Block_object_dispose(&v40, 8);
        }
        self->_callOutQueue_mutationLocked = 0;
        v25 = [v7 actions];
        if ([v25 count])
        {
          v26 = [v25 fbs_singleLineDescriptionOfBSActions];
          v27 = FBLogSceneClient();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [(FBSScene *)self identity];
            *(_DWORD *)buf = 138543618;
            id v49 = v28;
            __int16 v50 = 2114;
            id v51 = v26;
            _os_log_impl(&dword_19C680000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) in update: %{public}@", buf, 0x16u);
          }
        }
        [(FBSSceneUpdater *)v9 scene:self didUpdateClientSettings:v6 withDiff:v13 transitionContext:v7];
      }
    }
    callout_sceneUpdate = self->_callout_sceneUpdate;
    self->_callout_sceneUpdate = 0;
  }
}

- (void)_updateClientSettings:(id)a3
{
  id v4 = (void (**)(id, FBSMutableSettings *, FBSSceneTransitionContext *))a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (self->_callOutQueue_mutationLocked)
  {
    self->_callOutQueue_mutationLocked = 0;
    uint64_t v20 = [NSString stringWithFormat:@"mutation locked"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _updateClientSettings:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  id v5 = self->_callout_sceneUpdate;
  if (!v5)
  {
    id v5 = [(FBSScene *)self _beginUpdate];
  }
  if (v4)
  {
    if (!v5->_mutableSettings)
    {
      uint64_t v6 = [(FBSSettings *)v5->_settings mutableCopy];
      mutableSettings = v5->_mutableSettings;
      v5->_mutableSettings = (FBSMutableSettings *)v6;
    }
    context = v5->_context;
    if (!context)
    {
      uint64_t v9 = [(FBSScene *)self _createTransitionContext];
      v10 = v5->_context;
      v5->_context = (FBSSceneTransitionContext *)v9;

      context = v5->_context;
    }
    v4[2](v4, v5->_mutableSettings, context);
    if (![(FBSSettings *)v5->_settings isEqual:v5->_mutableSettings])
    {
      os_unfair_lock_lock(&self->_lock);
      uint64_t v11 = (FBSSceneClientSettings *)[(FBSMutableSettings *)v5->_mutableSettings _copyClearingProgenitor:0];
      lock_clientSettings = self->_lock_clientSettings;
      self->_lock_clientSettings = v11;

      objc_storeStrong((id *)&v5->_settings, v11);
      os_unfair_lock_unlock(&self->_lock);
    }
    if (v5->_settings == v5->_previousSettings)
    {
      uint64_t v13 = [(FBSSceneTransitionContext *)v5->_context animationSettings];
      if (v13)
      {
        id v14 = (void *)v13;
        [(FBSSceneTransitionContext *)v5->_context setAnimationSettings:0];
        int v15 = [(FBSSceneDefinition *)self->_definition specification];
        int v16 = [v15 _isSignificantTransitionContext:v5->_context];

        if (v16)
        {
          [(FBSSceneTransitionContext *)v5->_context setAnimationSettings:v14];
        }
        else
        {
          id v17 = FBLogSceneClient();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[FBSScene _updateClientSettings:](self, v17);
          }
        }
      }
    }
  }
  if (!self->_callout_coalesceUpdates
    || ([(FBSSceneDefinition *)self->_definition specification],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 _isSignificantTransitionContext:v5->_context],
        v18,
        v19))
  {
    [(FBSScene *)self _sendUpdate:v5];
  }
}

uint64_t __42__FBSScene_updateClientSettingsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_createTransitionContext
{
  v2 = [(FBSSceneDefinition *)self->_definition specification];
  v3 = [v2 transitionContext];

  return v3;
}

- (id)_beginUpdate
{
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (self->_callout_sceneUpdate)
  {
    uint64_t v9 = [NSString stringWithFormat:@"cannot begin a new update while one is ongoing"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _beginUpdate]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  v3 = (FBSSceneUpdate *)objc_opt_new();
  callout_sceneUpdate = self->_callout_sceneUpdate;
  self->_callout_sceneUpdate = v3;

  id v5 = v3;
  uint64_t v6 = [(FBSScene *)self clientSettings];
  id v7 = v5[1];
  v5[1] = (id)v6;

  objc_storeStrong(v5 + 3, v5[1]);

  return v5;
}

- (FBSSceneClientSettings)clientSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_clientSettings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_callOutQueue_coalesceClientSettingsUpdates:(id)a3
{
  id v4 = a3;
  if (self->_callout_coalesceUpdates)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_callout_coalesceUpdates"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _callOutQueue_coalesceClientSettingsUpdates:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  self->_callout_coalesceUpdates = 1;
  id v6 = v4;
  (*((void (**)(void))v4 + 2))();
  self->_callout_coalesceUpdates = 0;
  [(FBSScene *)self _sendUpdate:self->_callout_sceneUpdate];
}

uint64_t __24__FBSScene_attachLayer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addLayer:*(void *)(a1 + 32)];
}

void __24__FBSScene__sendUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) assertOnQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__FBSScene__sendUpdate___block_invoke_2;
    v5[3] = &unk_1E58F5040;
    id v6 = v3;
    [v4 performAsync:v5];
  }
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

uint64_t __52__FBSScene_updateClientSettingsWithTransitionBlock___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = v2;
  if (v2)
  {
    id v5 = v2;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 48) + 40), v2);
    id v3 = v5;
  }

  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __24__FBSScene_detachLayer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeLayer:*(void *)(a1 + 32)];
}

void __36__FBSScene_sendActions_toExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) assertOnQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__FBSScene_sendActions_toExtension___block_invoke_2;
    v5[3] = &unk_1E58F5040;
    id v6 = v3;
    [v4 performAsync:v5];
  }
}

uint64_t __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (id)loggingIdentifier
{
  return [(FBSSceneIdentity *)self->_identity description];
}

- (id)componentForExtension:(Class)a3 ofClass:(Class)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(NSMapTable *)self->_lock_components objectForKey:a3];
  uint64_t v9 = (void *)[v8 copy];

  os_unfair_lock_unlock(p_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v10);
      }
      [*(id *)(*((void *)&v19 + 1) + 8 * v14) component:v19];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (a4) {
        id v16 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    id v17 = 0;
  }

  return v17;
}

- (void)addObserver:(id)a3 withConfiguration:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, FBSSceneObserver *))a4;
  if (!v12)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene addObserver:withConfiguration:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = [[FBSSceneObserver alloc] initWithObserver:v12];
  if (v6) {
    v6[2](v6, v7);
  }
  os_unfair_lock_lock(&self->_lock);
  lock_sceneObservers = self->_lock_sceneObservers;
  if (!lock_sceneObservers)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    id v10 = self->_lock_sceneObservers;
    self->_lock_sceneObservers = v9;

    lock_sceneObservers = self->_lock_sceneObservers;
  }
  [(NSMutableArray *)lock_sceneObservers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_callOutQueue_didCreateWithTransitionContext:(id)a3 alternativeCreationCallout:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  self->_everActivated = 1;
  uint64_t v11 = [(FBSScene *)self settings];
  id v12 = +[FBSSceneSettingsDiff diffFromSettings:0 toSettings:v11];
  uint64_t v13 = [v8 actions];
  if ([v13 count])
  {
    uint64_t v14 = FBLogSceneClient();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(FBSScene *)self loggingIdentifier];
      id v16 = [v13 fbs_singleLineDescriptionOfBSActions];
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      __int16 v30 = 2114;
      id v31 = v16;
      _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) in scene-create: %{public}@", buf, 0x16u);
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke;
  v22[3] = &unk_1E58F50B0;
  v22[4] = self;
  id v23 = v12;
  id v24 = v8;
  id v25 = v11;
  id v26 = v10;
  id v27 = v9;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v20 = v8;
  id v21 = v12;
  [(FBSScene *)self _callOutQueue_coalesceClientSettingsUpdates:v22];
}

- (FBSSceneSettings)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_settings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

void __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    id v3 = objc_alloc_init(FBSSceneEvent);
    [(FBSSceneEvent *)v3 setSettingsDiff:*(void *)(a1 + 40)];
    [(FBSSceneEvent *)v3 setTransitionContext:*(void *)(a1 + 48)];
    [(FBSSceneEvent *)v3 setSource:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 16) _configureWithScene:];
    }
    [*(id *)(a1 + 32) _callOutQueue_updateExtensionsFromSettings:0 toSettings:*(void *)(a1 + 56) withDiff:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke_2;
    v18[3] = &unk_1E58F5040;
    id v19 = *(id *)(a1 + 64);
    [v5 scene:v4 didInitializeWithEvent:v3 completion:v18];
  }
  else
  {
    [v2 _callOutQueue_updateExtensionsFromSettings:0 toSettings:*(void *)(a1 + 56) withDiff:0];
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  id v7 = [*(id *)(a1 + 32) _lock_allComponents];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56));
  if ([v7 count])
  {
    id v8 = (id *)objc_opt_new();
    objc_storeStrong(v8 + 1, *(id *)(a1 + 56));
    objc_storeStrong(v8 + 4, *(id *)(a1 + 40));
    objc_storeStrong(v8 + 5, *(id *)(a1 + 48));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) scene:didUpdateSettings:*(void *)(a1 + 32) v8, (void)v14];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_146(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 115))
  {
    [*(id *)(a1 + 32) _callOutQueue_updateExtensionsFromSettings:*(void *)(a1 + 40) toSettings:*(void *)(a1 + 48) withDiff:*(void *)(a1 + 56)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 112))
  {
    id v3 = objc_alloc_init(FBSSceneEvent);
    [(FBSSceneEvent *)v3 setSettingsDiff:*(void *)(a1 + 56)];
    [(FBSSceneEvent *)v3 setTransitionContext:*(void *)(a1 + 64)];
    [(FBSSceneEvent *)v3 setSource:1];
    uint64_t v4 = *(void *)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_2;
    v22[3] = &unk_1E58F5100;
    id v5 = *(void **)(a1 + 72);
    id v23 = *(id *)(a1 + 80);
    [v5 scene:v4 handleEvent:v3 withCompletion:v22];
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 88);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 64);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_3;
      v20[3] = &unk_1E58F5128;
      id v21 = *(id *)(a1 + 80);
      [v6 scene:v2 didUpdateWithDiff:v7 transitionContext:v8 completion:v20];
    }
    else
    {
      [*(id *)(a1 + 80) signal];
    }
  }
  id v9 = [*(id *)(a1 + 32) _observers];
  if ([v9 count])
  {
    uint64_t v10 = (id *)objc_opt_new();
    objc_storeStrong(v10 + 1, *(id *)(a1 + 48));
    objc_storeStrong(v10 + 3, *(id *)(a1 + 40));
    objc_storeStrong(v10 + 4, *(id *)(a1 + 56));
    objc_storeStrong(v10 + 5, *(id *)(a1 + 64));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) scene:didUpdateSettings:*(void *)(a1 + 32) v10:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)_callOutQueue_updateExtensionsFromSettings:(id)a3 toSettings:(id)a4 withDiff:(id)a5
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_callout_coalesceUpdates)
  {
    v68 = [NSString stringWithFormat:@"extensions should only be updated while coalescing"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:]();
    }
    [v68 UTF8String];
    _bs_set_crash_log_message();
  }
  if (self->_callOutQueue_mutationLocked)
  {
    v69 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_callOutQueue_mutationLocked == NO"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:]();
    }
    [v69 UTF8String];
    _bs_set_crash_log_message();
  }
  v71 = v9;
  v72 = v8;
  v70 = v10;
  if (v8 && !-[FBSSettingsDiff _containsKey:]((uint64_t)v10, @"FBSSceneExtensions"))
  {
    v75 = 0;
    long long v15 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    id v11 = [v8 _allSceneExtensions];
    uint64_t v12 = [v9 _allSceneExtensions];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v111 objects:v125 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v15 = 0;
      uint64_t v16 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v112 != v16) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          if (([v11 containsObject:v18] & 1) == 0)
          {
            FBSRealizeSceneExtension(v18);
            if (!v15)
            {
              long long v15 = [MEMORY[0x1E4F1CA48] array];
            }
            [v15 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v111 objects:v125 count:16];
      }
      while (v14);
    }
    else
    {
      long long v15 = 0;
    }
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v107 objects:v124 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      v75 = 0;
      uint64_t v22 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v108 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v107 + 1) + 8 * j);
          if (([v12 containsObject:v24] & 1) == 0)
          {
            uint64_t v25 = v75;
            if (!v75)
            {
              uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
            }
            v75 = v25;
            [v25 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v107 objects:v124 count:16];
      }
      while (v21);
    }
    else
    {
      v75 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v15;
  v85 = self;
  uint64_t v78 = [obj countByEnumeratingWithState:&v103 objects:v123 count:16];
  if (v78)
  {
    id v76 = *(id *)v104;
    locuint64_t k = &self->_lock;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(id *)v104 != v76) {
          objc_enumerationMutation(obj);
        }
        uint64_t v82 = v26;
        id v27 = *(void **)(*((void *)&v103 + 1) + 8 * v26);
        v28 = FBLogSceneClient();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          id v51 = [(FBSScene *)self loggingIdentifier];
          *(_DWORD *)buf = 138412546;
          v120 = v51;
          __int16 v121 = 2112;
          v122 = v27;
          _os_log_debug_impl(&dword_19C680000, v28, OS_LOG_TYPE_DEBUG, "[%@] Adding extension: \"%@\"", buf, 0x16u);
        }
        v29 = [[FBSComponentScene alloc] initWithScene:self extension:v27];
        v86 = [MEMORY[0x1E4F1CA48] array];
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        v80 = v27;
        __int16 v30 = [v27 clientComponents];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v99 objects:v118 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v100;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v100 != v33) {
                objc_enumerationMutation(v30);
              }
              id v35 = objc_alloc(*(Class *)(*((void *)&v99 + 1) + 8 * k));
              if (objc_opt_respondsToSelector()) {
                uint64_t v36 = [v35 initWithScene:v29];
              }
              else {
                uint64_t v36 = [v35 init];
              }
              v37 = (void *)v36;
              if (v36)
              {
                v38 = FBLogSceneClient();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v40 = [(FBSScene *)self loggingIdentifier];
                  v41 = [off_1E58F44F0 succinctDescriptionForObject:v37];
                  *(_DWORD *)buf = 138412546;
                  v120 = v40;
                  __int16 v121 = 2112;
                  v122 = v41;
                  _os_log_debug_impl(&dword_19C680000, v38, OS_LOG_TYPE_DEBUG, "[%@] Instantiated component: \"%@\"", buf, 0x16u);

                  self = v85;
                }

                v39 = [[FBSSceneObserver alloc] initWithComponent:v37];
                [v86 addObject:v39];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v99 objects:v118 count:16];
          }
          while (v32);
        }

        if ([v86 count])
        {
          os_unfair_lock_lock(lock);
          lock_components = self->_lock_components;
          if (!lock_components)
          {
            char v43 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
            long long v44 = self->_lock_components;
            self->_lock_components = v43;

            lock_components = self->_lock_components;
          }
          [(NSMapTable *)lock_components setObject:v86 forKey:v80];
          os_unfair_lock_unlock(lock);
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v45 = v86;
          uint64_t v46 = [v45 countByEnumeratingWithState:&v95 objects:v117 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v96;
            do
            {
              for (uint64_t m = 0; m != v47; ++m)
              {
                if (*(void *)v96 != v48) {
                  objc_enumerationMutation(v45);
                }
                __int16 v50 = [*(id *)(*((void *)&v95 + 1) + 8 * m) component];
                if (objc_opt_respondsToSelector()) {
                  [v50 setScene:v29];
                }
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v95 objects:v117 count:16];
            }
            while (v47);
          }
        }
        uint64_t v26 = v82 + 1;
      }
      while (v82 + 1 != v78);
      uint64_t v78 = [obj countByEnumeratingWithState:&v103 objects:v123 count:16];
    }
    while (v78);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v77 = v75;
  uint64_t v83 = [v77 countByEnumeratingWithState:&v91 objects:v116 count:16];
  if (v83)
  {
    uint64_t v81 = *(void *)v92;
    p_locuint64_t k = &self->_lock;
    v79 = &self->_lock;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v92 != v81) {
          objc_enumerationMutation(v77);
        }
        __int16 v54 = *(void **)(*((void *)&v91 + 1) + 8 * v53);
        __int16 v55 = FBLogSceneClient();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          v67 = [(FBSScene *)self loggingIdentifier];
          *(_DWORD *)buf = 138412546;
          v120 = v67;
          __int16 v121 = 2112;
          v122 = v54;
          _os_log_debug_impl(&dword_19C680000, v55, OS_LOG_TYPE_DEBUG, "[%@] Removing extension: \"%@\"", buf, 0x16u);

          self = v85;
        }
        uint64_t v84 = v53;

        os_unfair_lock_lock(p_lock);
        __int16 v56 = [(NSMapTable *)self->_lock_components objectForKey:v54];
        [(NSMapTable *)self->_lock_components removeObjectForKey:v54];
        if (![(NSMapTable *)self->_lock_components count])
        {
          int v57 = self->_lock_components;
          self->_lock_components = 0;
        }
        os_unfair_lock_unlock(p_lock);
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v58 = v56;
        uint64_t v59 = [v58 countByEnumeratingWithState:&v87 objects:v115 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = *(void *)v88;
          do
          {
            for (uint64_t n = 0; n != v60; ++n)
            {
              if (*(void *)v88 != v61) {
                objc_enumerationMutation(v58);
              }
              v63 = [*(id *)(*((void *)&v87 + 1) + 8 * n) component];
              [v63 invalidate];
              v64 = FBLogSceneClient();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v65 = [(FBSScene *)v85 loggingIdentifier];
                v66 = [off_1E58F44F0 succinctDescriptionForObject:v63];
                *(_DWORD *)buf = 138412546;
                v120 = v65;
                __int16 v121 = 2112;
                v122 = v66;
                _os_log_debug_impl(&dword_19C680000, v64, OS_LOG_TYPE_DEBUG, "[%@] Invalidated component: \"%@\"", buf, 0x16u);
              }
            }
            uint64_t v60 = [v58 countByEnumeratingWithState:&v87 objects:v115 count:16];
          }
          while (v60);
        }

        uint64_t v53 = v84 + 1;
        self = v85;
        p_locuint64_t k = v79;
      }
      while (v84 + 1 != v83);
      uint64_t v83 = [v77 countByEnumeratingWithState:&v91 objects:v116 count:16];
    }
    while (v83);
  }
}

- (void)addObserver:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if ([v5 isProxy])
  {
    uint64_t v6 = [v5 forwardingTargetForSelector:a2];

    id v5 = (id)v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)FBSScene;
  BOOL v7 = [(FBSScene *)&v9 isEqual:v5];

  return v7;
}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isComplete])
  {
    if ([v3 isFailed])
    {
      uint64_t v4 = FBLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_cold_1(a1, v4);
      }
    }
    uint64_t v5 = *(void *)(a1 + 56);
    if ([v3 isFailed])
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
    else
    {
      uint64_t v6 = objc_opt_new();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
}

- (FBSSceneDelegate)delegate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
  os_unfair_lock_unlock(p_lock);

  return (FBSSceneDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return [(FBSSceneIdentity *)self->_identity identifier];
}

uint64_t __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (id)_initWithUpdater:(id)a3 identityToken:(id)a4 identity:(id)a5 parameters:(id)a6 hostHandle:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  a6;
  id v14 = a7;
  if (v11)
  {
    id v15 = [v11 callOutQueue];
    NSClassFromString(&cfstr_Fbsserialqueue.isa);
    if (v15)
    {
      if (objc_opt_isKindOfClass())
      {

        id v16 = v12;
        NSClassFromString(&cfstr_Fbssceneidenti.isa);
        if (v16)
        {
          if (objc_opt_isKindOfClass())
          {

            id v17 = v13;
            NSClassFromString(&cfstr_Fbssceneidenti_0.isa);
            if (v17)
            {
              if (objc_opt_isKindOfClass())
              {

                [v17 identifier];
                objc_claimAutoreleasedReturnValue();
                [v16 identifier];
                objc_claimAutoreleasedReturnValue();
                BSEqualObjects();
              }
              uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.4();
              }
              [v24 UTF8String];
              _bs_set_crash_log_message();
            }
            id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:].cold.4();
            }
            [v23 UTF8String];
            _bs_set_crash_log_message();
          }
          uint64_t v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityTokenClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]();
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
        }
        uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]();
        }
        [v21 UTF8String];
        _bs_set_crash_log_message();
      }
      uint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSerialQueueClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
    }
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  long long v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"updater"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSScene _initWithUpdater:identityToken:identity:parameters:hostHandle:]();
  }
  [v18 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_observers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(FBSScene *)self _lock_allComponents];
  [v3 addObjectsFromArray:v4];

  if ([(NSMutableArray *)self->_lock_sceneObservers count]) {
    [v3 addObjectsFromArray:self->_lock_sceneObservers];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v3;
}

- (id)_lock_allComponents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSMapTable *)self->_lock_components count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = NSAllMapTableValues(self->_lock_components);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * i) withObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }

  return v3;
}

uint64_t __95__FBSScene__callOutQueue_didCreateWithTransitionContext_alternativeCreationCallout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)sendActions:(id)a3 toExtension:(Class)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (!self->_everActivated)
  {
    uint64_t v24 = [NSString stringWithFormat:@"cannot send actions until activated"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene sendActions:toExtension:](a2);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }
  objc_opt_class();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v22 = [NSString stringWithFormat:@"only actions of type BSAction can be sent : tried to send %@", v12];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSScene sendActions:toExtension:]();
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v9);
  }

  if ([v8 count])
  {
    long long v13 = [(FBSScene *)self updater];
    if (v13)
    {
      if (self->_callout_coalesceUpdates && self->_callout_sceneUpdate) {
        -[FBSScene _sendUpdate:](self, "_sendUpdate:");
      }
      if (self->_hasAgent)
      {
        id v14 = [(FBSScene *)self _createTransitionContext];
        [v14 setActions:v8];
        uint64_t v15 = objc_alloc_init(FBSSceneEvent);
        [(FBSSceneEvent *)v15 setTransitionContext:v14];
        [(FBSSceneEvent *)v15 setSource:2];
        uint64_t v32 = 0;
        uint64_t v33 = &v32;
        uint64_t v34 = 0x2020000000;
        char v35 = 0;
        callOutQueue_agent = self->_callOutQueue_agent;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __36__FBSScene_sendActions_toExtension___block_invoke;
        v31[3] = &unk_1E58F5068;
        v31[4] = self;
        v31[5] = &v32;
        [(FBSSceneClientAgent *)callOutQueue_agent scene:self reviewEvent:v15 withCompletion:v31];
        if (!*((unsigned char *)v33 + 24))
        {
          uint64_t v25 = [NSString stringWithFormat:@"agent callout's completion was not called in scope : event=%@ agent=%@", v15, self->_callOutQueue_agent];
          uint64_t v26 = MEMORY[0x1E4F14500];
          id v27 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            __int16 v30 = (FBSScene *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            id v41 = v28;
            __int16 v42 = 2114;
            char v43 = v30;
            __int16 v44 = 2048;
            id v45 = self;
            __int16 v46 = 2114;
            uint64_t v47 = @"FBSScene.m";
            __int16 v48 = 1024;
            int v49 = 225;
            __int16 v50 = 2114;
            id v51 = v25;
            _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v25 UTF8String];
          _bs_set_crash_log_message();
        }
        _Block_object_dispose(&v32, 8);
      }
      [v8 fbs_singleLineDescriptionOfBSActions];
      id v17 = (FBSScene *)objc_claimAutoreleasedReturnValue();
      long long v18 = FBLogSceneClient();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (v19)
        {
          uint64_t v20 = [(FBSScene *)self identity];
          NSStringFromClass(a4);
          uint64_t v21 = (FBSScene *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v41 = v20;
          __int16 v42 = 2114;
          char v43 = v21;
          __int16 v44 = 2114;
          id v45 = v17;
          _os_log_impl(&dword_19C680000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to \"%{public}@\": %{public}@", buf, 0x20u);
        }
      }
      else if (v19)
      {
        id v23 = [(FBSScene *)self identity];
        *(_DWORD *)buf = 138543618;
        id v41 = v23;
        __int16 v42 = 2114;
        char v43 = v17;
        _os_log_impl(&dword_19C680000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s): %{public}@", buf, 0x16u);
      }
      [v13 scene:self didReceiveActions:v8 forExtension:a4];
    }
  }
}

- (FBSSceneUpdater)updater
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_updater;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)sendActions:(id)a3
{
}

- (void)removeObserver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = (void *)[(NSMutableArray *)self->_lock_sceneObservers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 observer];
        long long v13 = v12;
        if (v12) {
          BOOL v14 = v12 == a3;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          [(NSMutableArray *)self->_lock_sceneObservers removeObject:v11];
          [v11 invalidate];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (![(NSMutableArray *)self->_lock_sceneObservers count])
  {
    lock_sceneObservers = self->_lock_sceneObservers;
    self->_lock_sceneObservers = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateClientSettings:(id)a3 withTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FBSScene *)self clientSettings];
  uint64_t v9 = [v6 _progenitor];

  if (v9 != v8)
  {
    long long v11 = FBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FBSScene updateClientSettings:withTransitionContext:](self, v11);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke;
    v18[3] = &unk_1E58F4FA0;
    id v19 = v6;
    id v6 = (id)[v8 copy:v18];
  }
  if (v7 && ![(FBSSettings *)v7 _isEmpty])
  {
    [(FBSScene *)self _sendUpdate:self->_callout_sceneUpdate];
    id v13 = [(FBSScene *)self _beginUpdate];
    uint64_t v14 = [v6 copy];
    uint64_t v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v14;

    objc_storeStrong((id *)v13 + 5, a4);
    [(FBSScene *)self _updateClientSettings:0];
  }
  else
  {
    id v12 = +[FBSSceneClientSettingsDiff diffFromSettings:v8 toSettings:v6];
    id v13 = v12;
    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke_2;
      v16[3] = &unk_1E58F4FC8;
      id v13 = v12;
      id v17 = v13;
      [(FBSScene *)self _updateClientSettings:v16];
    }
  }
}

- (void)detachLayer:(id)a3
{
  id v4 = a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__FBSScene_detachLayer___block_invoke;
  v6[3] = &unk_1E58F4FC8;
  id v7 = v4;
  id v5 = v4;
  [(FBSScene *)self updateClientSettings:v6];
}

- (FBSScene)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBSScene"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    long long v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = @"FBSScene.m";
    __int16 v16 = 1024;
    int v17 = 72;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (FBSSceneHostHandle)hostHandle
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_hostHandle;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (FBSWorkspaceService)workspaceService
{
  id v3 = [(FBSScene *)self updater];
  if (v3)
  {
    id v4 = [FBSWorkspaceService alloc];
    id v5 = [(FBSSceneIdentity *)self->_identity internalWorkspaceIdentifier];
    id v6 = [(FBSWorkspaceService *)v4 _initWithTarget:v3 identifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (FBSWorkspaceService *)v6;
}

uint64_t __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _applySafeValuesFromUntrustedSettings:*(void *)(a1 + 32)];
}

uint64_t __55__FBSScene_updateClientSettings_withTransitionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableSettings:a2];
}

void __36__FBSScene_sendActions_toExtension___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)attachContext:(id)a3
{
  id v4 = +[FBSCAContextSceneLayer layerWithCAContext:a3];
  [(FBSScene *)self attachSceneContext:v4];
}

- (void)detachContext:(id)a3
{
  id v4 = +[FBSCAContextSceneLayer layerWithCAContext:a3];
  [(FBSScene *)self detachSceneContext:v4];
}

- (id)snapshotRequest
{
  id v3 = [FBSSceneSnapshotRequest alloc];
  id v4 = [(FBSScene *)self settings];
  id v5 = [(FBSSceneSnapshotRequest *)v3 initWithSettings:v4];

  id v6 = [(FBSScene *)self identifier];
  [(FBSSceneSnapshotRequest *)v5 setSceneID:v6];

  [(FBSSceneSnapshotRequest *)v5 setDelegate:self];

  return v5;
}

- (BOOL)performSnapshotWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSScene *)self snapshotRequest];
  char v6 = [v5 performSnapshotWithContext:v4];

  return v6;
}

- (BOOL)invalidateSnapshotWithContext:(id)a3
{
  id v4 = +[FBSSceneSnapshotRequestHandle handleForRequestType:2 context:a3];
  [v4 performRequestForScene:self];

  return 1;
}

- (id)display
{
  id v2 = [(FBSScene *)self settings];
  id v3 = [v2 displayConfiguration];
  id v4 = [v3 CADisplay];

  return v4;
}

- (id)fbsDisplay
{
  id v2 = [(FBSScene *)self settings];
  id v3 = [v2 displayConfiguration];

  return v3;
}

- (id)layers
{
  id v2 = [(FBSScene *)self clientSettings];
  id v3 = [v2 layers];
  id v4 = [v3 array];

  return v4;
}

void __24__FBSScene__sendUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:1];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

+ (id)pseudoSceneWithIdentifier:(id)a3 specification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    int v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSScene pseudoSceneWithIdentifier:specification:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = v6;
  if (!v6)
  {
    __int16 v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"specification"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSScene pseudoSceneWithIdentifier:specification:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  int v8 = [NSString stringWithFormat:@"PseudoScene:%@", v5];
  uint64_t v9 = [FBSScene alloc];
  __int16 v10 = +[FBSPseudoSceneUpdater sharedInstance];
  long long v11 = +[FBSSceneIdentityToken pseudoTokenWithIdentifier:v8];
  __int16 v12 = +[FBSSceneIdentity identityForIdentifier:v8];
  id v13 = +[FBSSceneParameters parametersForSpecification:v7];
  __int16 v14 = +[FBSSceneHostHandle localHandle];
  id v15 = [(FBSScene *)v9 _initWithUpdater:v10 identityToken:v11 identity:v12 parameters:v13 hostHandle:v14];

  return v15;
}

- (void)updateSettings:(id)a3
{
  __int16 v10 = (void (**)(id, void *, void *))a3;
  id v4 = [(FBSScene *)self updater];
  id v5 = +[FBSPseudoSceneUpdater sharedInstance];

  if (v4 != v5)
  {
    uint64_t v9 = [NSString stringWithFormat:@"it is not appropriate to call -updateSettings: on this scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene updateSettings:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = [(FBSScene *)self settings];
  id v7 = (void *)[v6 mutableCopy];

  int v8 = [(FBSScene *)self _createTransitionContext];
  v10[2](v10, v7, v8);
  [(FBSScene *)self updater:v4 didUpdateSettings:v7 withDiff:0 transitionContext:v8 completion:&__block_literal_global_1];
}

- (void)invalidate
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BSAuditToken)hostAuditToken
{
  id v2 = [(FBSScene *)self hostHandle];
  id v3 = [v2 auditToken];

  return (BSAuditToken *)v3;
}

- (void)_configureParameters:(id)a3
{
  __int16 v12 = (void (**)(id, void *))a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (self->_everActivated)
  {
    long long v11 = [NSString stringWithFormat:@"cannot update parameters after activation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene _configureParameters:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v4 = [(FBSScene *)self parameters];
  v12[2](v12, v4);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [v4 settings];
  uint64_t v6 = (FBSSceneSettings *)[v5 copy];
  lock_settings = self->_lock_settings;
  self->_lock_settings = v6;

  uint64_t v8 = [v4 clientSettings];
  uint8_t v9 = (FBSSceneClientSettings *)[v8 _copyClearingProgenitor:0];
  lock_clientSettings = self->_lock_clientSettings;
  self->_lock_clientSettings = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_callOutQueue_invalidate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(FBSScene *)self _observers];
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lock_delegate, 0);
  lock_updater = self->_lock_updater;
  self->_lock_updater = 0;

  lock_sceneObservers = self->_lock_sceneObservers;
  self->_lock_sceneObservers = 0;

  lock_components = self->_lock_components;
  self->_lock_components = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v11++) invalidate];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  __int16 v12 = self->_callOutQueue_agentSessions;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v16++) invalidate:v20];
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  callOutQueue_agentSessions = self->_callOutQueue_agentSessions;
  self->_callOutQueue_agentSessions = 0;

  id callOutQueue_agentMessageHandler = self->_callOutQueue_agentMessageHandler;
  self->_id callOutQueue_agentMessageHandler = 0;

  callOutQueue_agent = self->_callOutQueue_agent;
  self->_callOutQueue_agent = 0;
}

- (void)_callOutQueue_didUpdateHostHandle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_hostHandle, a3);
  os_unfair_lock_unlock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(FBSScene *)self _observers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) scene:self didUpdateHostHandle:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_callOutQueue
{
  return self->_callOutQueue;
}

- (BOOL)_callOutQueue_willDestroyWithTransitionContext:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (!v6)
  {
    id v6 = [(FBSScene *)self _createTransitionContext];
  }
  uint64_t v8 = [(FBSScene *)self _observers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) sceneWillInvalidate:self];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  if (self->_callOutQueue_agent)
  {
    long long v13 = objc_alloc_init(FBSSceneEvent);
    [(FBSSceneEvent *)v13 setTransitionContext:v6];
    [(FBSSceneEvent *)v13 setSource:1];
    callOutQueue_agent = self->_callOutQueue_agent;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__FBSScene__callOutQueue_willDestroyWithTransitionContext_completion___block_invoke;
    v17[3] = &unk_1E58F5040;
    id v18 = v7;
    [(FBSSceneClientAgent *)callOutQueue_agent scene:self willInvalidateWithEvent:v13 completion:v17];

    BOOL v15 = self->_callOutQueue_agent != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __70__FBSScene__callOutQueue_willDestroyWithTransitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(FBSScene *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(FBSScene *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identity withName:0];
  id v5 = [(FBSScene *)self updater];
  id v6 = (id)[v3 appendBool:v5 != 0 withName:@"valid"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSScene *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSScene *)self succinctDescriptionBuilder];
  os_unfair_lock_lock(&self->_lock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__FBSScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  os_unfair_lock_unlock(&self->_lock);
  id v7 = v6;

  return v7;
}

void __50__FBSScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"settings" skipIfNil:1];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"clientSettings" skipIfNil:1];
  id v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 144) hostProcess];
  id v5 = (id)[v4 appendObject:v6 withName:@"hostProcess"];
}

- (void)updater:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (a5 && ![(FBSScene *)self conformsToExtension:a5])
  {
    int v17 = FBLogSceneClient();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[FBSScene updater:didReceiveActions:forExtension:](self, a5);
    }
  }
  else
  {
    uint64_t v8 = [v7 bs_map:&__block_literal_global_150];
    uint64_t v9 = [v8 allObjects];
    uint64_t v10 = [v9 componentsJoinedByString:@", "];

    uint64_t v11 = FBLogSceneClient();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    __int16 v54 = a5;
    id v51 = v10;
    if (a5)
    {
      if (v12)
      {
        long long v13 = [(FBSScene *)self loggingIdentifier];
        long long v14 = NSStringFromClass(a5);
        *(_DWORD *)buf = 138543874;
        v69 = v13;
        __int16 v70 = 2114;
        uint64_t v71 = (uint64_t)v14;
        __int16 v72 = 2114;
        uint64_t v73 = v10;
        _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) for \"%{public}@\": %{public}@", buf, 0x20u);

        a5 = v54;
      }

      p_locuint64_t k = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      uint64_t v16 = [(NSMapTable *)self->_lock_components objectForKey:a5];
      id WeakRetained = 0;
      uint64_t v53 = 0;
    }
    else
    {
      if (v12)
      {
        id v18 = [(FBSScene *)self loggingIdentifier];
        *(_DWORD *)buf = 138543618;
        v69 = v18;
        __int16 v70 = 2114;
        uint64_t v71 = v10;
        _os_log_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s): %{public}@", buf, 0x16u);
      }
      p_locuint64_t k = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
      uint64_t v53 = (void *)[(NSMutableArray *)self->_lock_sceneObservers copy];
      uint64_t v16 = [(FBSScene *)self _lock_allComponents];
    }
    os_unfair_lock_unlock(p_lock);
    __int16 v50 = v7;
    long long v19 = (void *)[v7 mutableCopy];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v16;
    uint64_t v20 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    __int16 v56 = self;
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v63;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v63 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (a5) {
            [v24 scene:self handlePrivateActions:v19];
          }
          else {
          long long v25 = [v24 scene:self handleActions:v19];
          }
          if ([v25 count])
          {
            long long v26 = FBLogCommon();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              long long v27 = [(FBSScene *)self loggingIdentifier];
              id v28 = [v24 component];
              v29 = [off_1E58F44F0 succinctDescriptionForObject:v28];
              uint64_t v30 = [v25 bs_reduce:&stru_1EED27028 block:&__block_literal_global_160];
              *(_DWORD *)buf = 138543874;
              v69 = v27;
              __int16 v70 = 2114;
              uint64_t v71 = (uint64_t)v29;
              __int16 v72 = 2112;
              uint64_t v73 = (uint64_t)v30;
              _os_log_impl(&dword_19C680000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Component %{public}@ handled action(s): %@", buf, 0x20u);

              self = v56;
              a5 = v54;
            }

            [v19 minusSet:v25];
            if (![v19 count])
            {

              goto LABEL_28;
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    if ([v19 count])
    {
      if (a5)
      {
        uint64_t v31 = FBLogSceneClient();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v46 = [(FBSScene *)self loggingIdentifier];
          uint64_t v47 = NSStringFromClass(a5);
          __int16 v48 = [v19 bs_map:&__block_literal_global_166];
          *(_DWORD *)buf = 138543874;
          v69 = v46;
          __int16 v70 = 2114;
          uint64_t v71 = (uint64_t)v47;
          __int16 v72 = 2114;
          uint64_t v73 = (uint64_t)v48;
          _os_log_error_impl(&dword_19C680000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Extension \"%{public}@\" did not handle actions: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v32 = [v19 copy];

      int v49 = (void *)v32;
      if (self->_hasAgent)
      {
        uint64_t v33 = [(FBSScene *)self _createTransitionContext];
        [v33 setActions:v32];
        uint64_t v34 = objc_alloc_init(FBSSceneEvent);
        [(FBSSceneEvent *)v34 setTransitionContext:v33];
        [(FBSSceneEvent *)v34 setSource:1];
        [(FBSSceneClientAgent *)self->_callOutQueue_agent scene:self handleEvent:v34 withCompletion:0];
      }
      else
      {
        [WeakRetained scene:self didReceiveActions:v32];
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v55 = v53;
      uint64_t v35 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v59;
        while (2)
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v59 != v37) {
              objc_enumerationMutation(v55);
            }
            long long v39 = *(void **)(*((void *)&v58 + 1) + 8 * j);
            uint64_t v40 = [v39 scene:self handleActions:v19];
            if ([v40 count])
            {
              id v41 = FBLogCommon();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v42 = [(FBSScene *)self loggingIdentifier];
                char v43 = [v39 observer];
                __int16 v44 = [off_1E58F44F0 succinctDescriptionForObject:v43];
                id v45 = [v40 bs_reduce:&stru_1EED27028 block:&__block_literal_global_169];
                *(_DWORD *)buf = 138543874;
                v69 = v42;
                __int16 v70 = 2114;
                uint64_t v71 = (uint64_t)v44;
                __int16 v72 = 2112;
                uint64_t v73 = (uint64_t)v45;
                _os_log_impl(&dword_19C680000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Observer %{public}@ handled action(s): %@", buf, 0x20u);

                self = v56;
              }

              [v19 minusSet:v40];
              if (![v19 count])
              {

                goto LABEL_50;
              }
            }
          }
          uint64_t v36 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }
LABEL_50:

      id v7 = v49;
    }
    else
    {
      id v7 = v50;
    }

    int v17 = v51;
  }
}

NSString *__51__FBSScene_updater_didReceiveActions_forExtension___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

id __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_157(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [off_1E58F44F0 succinctDescriptionForObject:a3];
  if ([v4 length])
  {
    id v6 = [v4 stringByAppendingFormat:@", %@", v5];
  }
  else
  {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

uint64_t __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_164(uint64_t a1, uint64_t a2)
{
  return [off_1E58F44F0 succinctDescriptionForObject:a2];
}

id __51__FBSScene_updater_didReceiveActions_forExtension___block_invoke_167(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = [off_1E58F44F0 succinctDescriptionForObject:a3];
  if ([v4 length])
  {
    id v6 = [v4 stringByAppendingFormat:@", %@", v5];
  }
  else
  {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (void)updater:(id)a3 didReceiveMessage:(id)a4 withResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (self->_hasAgent && (uint64_t v9 = MEMORY[0x19F3991F0](self->_callOutQueue_agentMessageHandler)) != 0)
  {
    uint64_t v10 = (void (**)(void, void, void))v9;
    if (v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__FBSScene_updater_didReceiveMessage_withResponse___block_invoke;
      v11[3] = &unk_1E58F51B8;
      v11[4] = self;
      id v12 = v8;
      ((void (**)(void, id, void *))v10)[2](v10, v7, v11);
    }
    else
    {
      (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v7, 0);
    }
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __51__FBSScene_updater_didReceiveMessage_withResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  [v3 assertOnQueue];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (id)parameters
{
  id v3 = [FBSMutableSceneParameters alloc];
  id v4 = [(FBSScene *)self specification];
  id v5 = [(FBSSceneParameters *)v3 initWithSpecification:v4];

  os_unfair_lock_lock(&self->_lock);
  [(FBSMutableSceneParameters *)v5 setSettings:self->_lock_settings];
  [(FBSSceneParameters *)v5 setClientSettings:self->_lock_clientSettings];
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (id)counterpartAgent
{
  return 0;
}

- (id)hostProcess
{
  id v2 = [(FBSScene *)self updater];
  id v3 = [v2 hostProcess];

  return v3;
}

- (id)clientProcess
{
  return +[FBSProcess currentProcess];
}

- (id)openSessionWithName:(id)a3 executionPolicy:(id)a4
{
  callOutQueue = self->_callOutQueue;
  id v7 = a4;
  id v8 = a3;
  [(FBSSerialQueue *)callOutQueue assertOnQueue];
  uint64_t v9 = [[FBSSceneActivitySession alloc] initWithName:v8 scene:self executionPolicy:v7];

  if (v9) {
    [(NSMutableArray *)self->_callOutQueue_agentSessions addObject:v9];
  }
  [(FBSSceneActivitySession *)v9 open];

  return v9;
}

- (void)closeSession:(id)a3
{
  id v4 = a3;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (v4 && [(NSMutableArray *)self->_callOutQueue_agentSessions containsObject:v4])
  {
    [v4 close];
    [v4 invalidate];
    [(NSMutableArray *)self->_callOutQueue_agentSessions removeObject:v4];
  }
}

- (void)agent:(id)a3 registerMessageHandler:(id)a4
{
  uint64_t v10 = (FBSSceneClientAgent *)a3;
  id v6 = a4;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (!v10 || self->_callOutQueue_agent != v10)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"agent && (agent == _callOutQueue_agent)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene agent:registerMessageHandler:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  if (self->_callOutQueue_agentMessageHandler != v6)
  {
    id v7 = (void *)[v6 copy];
    id callOutQueue_agentMessageHandler = self->_callOutQueue_agentMessageHandler;
    self->_id callOutQueue_agentMessageHandler = v7;
  }
}

- (void)agent:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v8 = (FBSSceneClientAgent *)a3;
  id v9 = a4;
  id v10 = a5;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  if (self->_callOutQueue_agent != v8)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"agent == _callOutQueue_agent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene agent:sendMessage:withResponse:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  id v11 = v9;
  NSClassFromString(&cfstr_Fbsscenemessag.isa);
  if (!v11)
  {
    int v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene agent:sendMessage:withResponse:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneMessageClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene agent:sendMessage:withResponse:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }

  if (v10)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__FBSScene_agent_sendMessage_withResponse___block_invoke;
    v19[3] = &unk_1E58F5208;
    v19[4] = self;
    id v20 = v10;
    id v12 = (void (**)(void, void, void))MEMORY[0x19F3991F0](v19);
  }
  else
  {
    id v12 = 0;
  }
  long long v13 = [(FBSScene *)self updater];
  long long v14 = v13;
  if (v13)
  {
    [v13 scene:self sendMessage:v11 withResponse:v12];
  }
  else if (v12)
  {
    BOOL v15 = [MEMORY[0x1E4F28C58] sceneMessageErrorWithCode:2];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v15);
  }
}

void __43__FBSScene_agent_sendMessage_withResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__FBSScene_agent_sendMessage_withResponse___block_invoke_2;
  v11[3] = &unk_1E58F51E0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  [v7 performAsync:v11];
}

uint64_t __43__FBSScene_agent_sendMessage_withResponse___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)snapshotRequestAllowSnapshot:(id)a3
{
  id v3 = [(FBSScene *)self delegate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4
{
  id v6 = a4;
  [a3 setDelegate:0];
  id v7 = +[FBSSceneSnapshotRequestHandle handleForRequestType:1 context:v6];

  [v7 performRequestForScene:self];
  return 1;
}

- (BOOL)conformsToExtension:(Class)a3
{
  id v5 = [(FBSScene *)self settings];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v6 = [(FBSSceneDefinition *)self->_definition specification];
    id v7 = FBSGetDefaultExtensions(v6);
    char v8 = [v7 containsObject:a3];

    if (v8)
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [v5 _allSceneExtensions];
      char v9 = [v10 containsObject:a3];
    }
  }
  else
  {
    char v9 = [v5 conformsToExtension:a3];
  }

  return v9;
}

- (BOOL)everActivated
{
  return self->_everActivated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_updater, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_lock_hostHandle, 0);
  objc_storeStrong((id *)&self->_lock_components, 0);
  objc_storeStrong((id *)&self->_lock_sceneObservers, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_clientSettings, 0);
  objc_storeStrong((id *)&self->_lock_settings, 0);
  objc_storeStrong((id *)&self->_callout_sceneUpdate, 0);
  objc_storeStrong((id *)&self->_calloutQueue_animationFence, 0);
  objc_storeStrong(&self->_callOutQueue_agentMessageHandler, 0);
  objc_storeStrong((id *)&self->_callOutQueue_agentSessions, 0);
  objc_storeStrong((id *)&self->_callOutQueue_agent, 0);

  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSScene *)self _callOutQueue];
  [v5 assertOnQueue];

  if ([(FBSScene *)self everActivated])
  {
    char v9 = [NSString stringWithFormat:@"cannot configure parameters after activation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSScene(FBSWorkspaceService) activateWithCompletion:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = [(FBSScene *)self updater];
  id v7 = v6;
  if (v6)
  {
    [v6 activateSceneFuture:self completion:v4];
  }
  else if (v4)
  {
    char v8 = [(FBSScene *)self _callOutQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__FBSScene_FBSWorkspaceService__activateWithCompletion___block_invoke;
    v10[3] = &unk_1E58F5040;
    id v11 = v4;
    [v8 performAsync:v10];
  }
}

void __56__FBSScene_FBSWorkspaceService__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  FBSWorkspaceErrorCreate(0, 1uLL, @"scene cannot be activated because it was already invalidated", a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v10);
}

- (void)updateClientSettings:(void *)a1 withTransitionContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 identity];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] updated client settings were not derived from the scene's previous client settings", (uint8_t *)&v4, 0xCu);
}

- (void)sendActions:(const char *)a1 toExtension:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:toExtension:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:withConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_beginUpdate
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_updateClientSettings:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 loggingIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_19C680000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Ignoring update containing only animation settings.", (uint8_t *)&v4, 0xCu);
}

- (void)_updateClientSettings:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_sendUpdate:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pseudoSceneWithIdentifier:specification:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pseudoSceneWithIdentifier:specification:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateSettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.5()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.6()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:(int)a1 identityToken:(Class)aClass identity:parameters:hostHandle:.cold.7(int a1, Class aClass)
{
  id v2 = NSStringFromClass(aClass);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v3, v4, "[%{public}@] Specified client agent class (%{public}@) does not conform to <FBSSceneClientAgent>", v5, v6, v7, v8, v9);
}

- (void)_initWithUpdater:identityToken:identity:parameters:hostHandle:.cold.9()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_configureParameters:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_callOutQueue_coalesceClientSettingsUpdates:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_callOutQueue_updateExtensionsFromSettings:toSettings:withDiff:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __76__FBSScene_updater_didUpdateSettings_withDiff_transitionContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) loggingIdentifier];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ did not call the settings update completion block", (uint8_t *)&v6, 0x16u);
}

- (void)updater:(void *)a1 didReceiveActions:(objc_class *)a2 forExtension:.cold.1(void *a1, objc_class *a2)
{
  uint64_t v3 = [a1 loggingIdentifier];
  uint64_t v4 = NSStringFromClass(a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v5, v6, "[%{public}@] Ignoring actions destined for unknown extension \"%{public}@\"", v7, v8, v9, v10, v11);
}

- (void)agent:registerMessageHandler:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)agent:sendMessage:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)agent:sendMessage:withResponse:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end