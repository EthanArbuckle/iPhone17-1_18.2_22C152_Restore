@interface FBSWorkspaceScenesClient
+ (BSServiceQuality)serviceQuality;
+ (id)sourceIdentifierForHostEndpoint:(uint64_t)a1;
- (BOOL)canHaveAgent;
- (FBSWorkspaceScenesClient)init;
- (NSCopying)identifier;
- (id)_createSceneWithIdentity:(void *)a3 parameters:;
- (id)_initWithIdentifier:(void *)a3 connection:(void *)a4 queue:(void *)a5 calloutQueue:(void *)a6 workspace:;
- (id)_queue_connectedSceneWithIdentity:(id *)a1;
- (id)_remoteTarget;
- (id)_reportedSceneWithIdentity:(uint64_t)a1;
- (id)callOutQueue;
- (id)createSceneFutureWithDefinition:(id)a3;
- (id)hostProcess;
- (id)initWithEndpoint:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:;
- (id)initWithPeer:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:;
- (id)sceneWithIdentity:(id)a3;
- (id)scenes;
- (uint64_t)queue_activate;
- (void)_callOutQueue_sendDidCreateForScene:(void *)a3 transitionContext:(void *)a4 completion:;
- (void)_configureReceivedActions:(void *)a3 forScene:;
- (void)_queue_invalidateScene:(void *)a3 withTransitionContext:(void *)a4 completion:;
- (void)_queue_sendHandshake;
- (void)_queue_updateScene:(void *)a3 withSettings:(void *)a4 diff:(void *)a5 transitionContext:(void *)a6 completion:;
- (void)_sceneID:(void *)a3 destroyWithTransitionContext:(void *)a4 completion:;
- (void)activateSceneFuture:(id)a3 completion:(id)a4;
- (void)createSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)queue_activate;
- (void)reconnectSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)requestSceneWithOptions:(id)a3 completion:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5;
- (void)sceneID:(id)a3 destroyWithTransitionContext:(id)a4 completion:(id)a5;
- (void)sceneID:(id)a3 sendActions:(id)a4 toExtension:(id)a5 completion:(id)a6;
- (void)sceneID:(id)a3 sendMessage:(id)a4 completion:(id)a5;
- (void)sceneID:(id)a3 updateWithSettingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)sendActions:(id)a3 completion:(id)a4;
- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5;
- (void)willTerminateWithTransitionContext:(id)a3;
@end

@implementation FBSWorkspaceScenesClient

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 identity];
  v15 = v14;
  if (v14)
  {
    queue = self->_queue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke;
    v17[3] = &unk_1E58F66C0;
    v17[4] = self;
    id v18 = v14;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    dispatch_sync(queue, v17);
  }
}

void __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2
    && (uint64_t v3 = *(void *)(a1 + 40),
        [*(id *)(a1 + 32) identity],
        v4 = objc_claimAutoreleasedReturnValue(),
        -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](v3, v4),
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v2 == v5))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [*(id *)(a1 + 48) actions];
    -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](v8, v9, *(void **)(a1 + 32));

    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_2;
    v14[3] = &unk_1E58F6850;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v16 = v13;
    id v17 = *(id *)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 72);
    [v11 _calloutQueue_executeCalloutFromSource:v10 withBlock:v14];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

- (void)_configureReceivedActions:(void *)a3 forScene:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v11 setScene:v6];
            [v11 setCallOutQueue:*(void *)(a1 + 32)];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)_reportedSceneWithIdentity:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 116));
    id v5 = [*(id *)(a1 + 104) objectForKey:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 116));
  }

  return v5;
}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitWithReason:@"runloop-turned"];
}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitWithReason:@"commit-handler"];
}

uint64_t __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) activeMessageBatch];
  [v2 commitWithReason:@"update-completion"];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)scenes
{
  p_reportingLock = &self->_reportingLock;
  os_unfair_lock_lock(&self->_reportingLock);
  uint64_t v4 = [(NSMutableDictionary *)self->_reportingLock_scenesByIdentity count];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)self->_reportingLock_scenesByIdentity allValues];
    uint64_t v7 = [v5 setWithArray:v6];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  os_unfair_lock_unlock(p_reportingLock);

  return v7;
}

void __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke_3;
  v6[3] = &unk_1E58F68A0;
  v6[4] = v2;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v1 updater:v2 didUpdateSettings:v3 withDiff:v4 transitionContext:v5 completion:v6];
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_197(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) actions];
  -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](v2, v3, *(void **)(a1 + 48));

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_198;
  v8[3] = &unk_1E58F6800;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_4;
  v6[3] = &unk_1E58F4B00;
  id v7 = *(id *)(a1 + 56);
  [v9 _callOutQueue_didCreateWithTransitionContext:v5 alternativeCreationCallout:v8 completion:v6];
}

+ (BSServiceQuality)serviceQuality
{
  self;

  return +[FBSWorkspaceServiceSpecification serviceQuality];
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v4 = +[FBSWorkspaceServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5 && *(void *)(v5 + 16))
  {
    uint64_t v6 = +[FBSWorkspaceServiceSpecification invertedInterface];
  }
  else
  {
    uint64_t v6 = +[FBSWorkspaceServiceSpecification interface];
  }
  id v7 = (void *)v6;
  [v3 setInterface:v6];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2;
  v15[3] = &unk_1E58F62D0;
  id v16 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_101;
  v13[3] = &unk_1E58F6510;
  id v14 = *(id *)(a1 + 48);
  [v3 setBatchingHandler:v13];
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8 || !*(void *)(v8 + 16))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_4;
    v11[3] = &unk_1E58F62D0;
    id v12 = *(id *)(a1 + 32);
    [v3 setInterruptionHandler:v11];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_119;
  v9[3] = &unk_1E58F6538;
  id v10 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v9];
}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = FBLogSceneClient();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(a1, (uint64_t)v3);
    }
  }
}

- (void)createSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:]((uint64_t)self, a3, a4);
  callOutQueue = self->_callOutQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__FBSWorkspaceScenesClient_createSceneWithIdentity_parameters_transitionContext_completion___block_invoke;
  v17[3] = &unk_1E58F65F8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [(FBSSerialQueue *)callOutQueue performAsync:v17];
}

- (id)_createSceneWithIdentity:(void *)a3 parameters:
{
  id v5 = a2;
  id v6 = a3;
  if (a1) {
    BSDispatchQueueAssert();
  }

  return 0;
}

- (BOOL)canHaveAgent
{
  return 1;
}

- (id)callOutQueue
{
  return self->_callOutQueue;
}

- (void)sceneID:(id)a3 updateWithSettingsDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSWorkspaceScenesClient _queue_updateScene:withSettings:diff:transitionContext:completion:]((uint64_t)self, v13, 0, v12, v11, v10);
}

- (id)_queue_connectedSceneWithIdentity:(id *)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v3 = [a1[7] objectForKey:a2];
    if (v3 && ([v2[9] containsObject:v3] & 1) == 0) {
      uint64_t v2 = v3;
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_101(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    Class v5 = NSClassFromString(&cfstr_Catransaction.isa);
    [(objc_class *)v5 activate];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2_106;
    v10[3] = &unk_1E58F4B00;
    id v11 = v4;
    [(objc_class *)v5 addCommitHandler:v10 forPhase:0];
  }
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_3;
  v8[3] = &unk_1E58F4B00;
  id v9 = v4;
  id v7 = v4;
  [v6 performAsync:v8];
}

- (void)_queue_updateScene:(void *)a3 withSettings:(void *)a4 diff:(void *)a5 transitionContext:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    id v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__FBSWorkspaceScenesClient__queue_updateScene_withSettings_diff_transitionContext_completion___block_invoke;
    v17[3] = &unk_1E58F6850;
    id v18 = v11;
    uint64_t v19 = a1;
    id v20 = v14;
    id v21 = v12;
    id v22 = v13;
    id v23 = v15;
    [v16 performAsync:v17];
  }
}

void __92__FBSWorkspaceScenesClient_createSceneWithIdentity_parameters_transitionContext_completion___block_invoke(uint64_t a1)
{
}

void __65__FBSWorkspaceScenesClient_scene_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 48)])
    {
      id v4 = FBLogSceneClient();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v5;
        _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping actions because the scene is reconnecting", buf, 0xCu);
      }
    }
    else
    {
      id v6 = -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v8 = *(objc_class **)(a1 + 64);
      id v11 = v6;
      if (v8)
      {
        id v10 = NSStringFromClass(v8);
        [v11 sceneID:v7 didReceiveActions:v9 forExtension:v10];
      }
      else
      {
        [v6 sceneID:v7 didReceiveActions:v9 forExtension:0];
      }
    }
  }
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(a1 + 56) forKey:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 48)])
    {
      id v4 = [*(id *)(a1 + 48) definition];
      uint64_t v5 = [v4 specification];
      int v6 = [v5 _isSignificantTransitionContext:*(void *)(a1 + 72)];

      if (!v6) {
        return;
      }
      uint64_t v7 = FBLogSceneClient();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v8;
        _os_log_impl(&dword_19C680000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping transition context because the scene is reconnecting", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
      id v10 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2;
      v13[3] = &unk_1E58F6698;
      uint64_t v14 = v10;
      [v9 sceneID:v14 didUpdateClientSettingsWithDiff:v12 transitionContext:v11 completion:v13];

      uint64_t v7 = v14;
    }
  }
}

- (id)_remoteTarget
{
  v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 28;
    os_unfair_lock_lock(a1 + 28);
    v1 = (id *)v1[12];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v4)
  {
    uint64_t v5 = *(void **)(v4 + 8);
    if (v5)
    {
      if ([v5 isNonLaunching])
      {
        int v6 = FBLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = *(void *)(v7 + 48);
          int v13 = 134218242;
          uint64_t v14 = v7;
          __int16 v15 = 2112;
          uint64_t v16 = v8;
          _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> attempting delayed handshake from activation handler", (uint8_t *)&v13, 0x16u);
        }

        -[FBSWorkspaceScenesClient _queue_sendHandshake](*(void *)(a1 + 32));
      }
    }
  }
  uint64_t v9 = [v3 remoteToken];
  uint64_t v10 = +[FBSSceneHostHandle handleWithAuditToken:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 88);
  *(void *)(v11 + 88) = v10;
}

- (uint64_t)queue_activate
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  if (result) {
    BSDispatchQueueAssert();
  }
  return result;
}

- (id)initWithEndpoint:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = v9;
    NSClassFromString(&cfstr_Bsserviceconne.isa);
    if (!v13)
    {
      id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:]();
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:]();
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
    }

    uint64_t v14 = [v13 service];
    __int16 v15 = +[FBSWorkspaceServiceSpecification identifier];
    char v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      v24 = [NSString stringWithFormat:@"provided endpoint is not for a workspace service"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v17 = [v13 instance];

    if (v17)
    {
      v25 = [NSString stringWithFormat:@"provided endpoint must not be instanced"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithEndpoint:queue:calloutQueue:workspace:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
    }
    id v18 = [off_1E58F4560 connectionWithEndpoint:v13];
    if (v18)
    {
      uint64_t v19 = +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v13);
      a1 = -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:](a1, v19, v18, v10, v11, v12);

      id v20 = a1;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)_queue_sendHandshake
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (id)sourceIdentifierForHostEndpoint:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (!v2)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostEndpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSWorkspaceScenesClient sourceIdentifierForHostEndpoint:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  id v3 = +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v2);

  return v3;
}

- (id)_initWithIdentifier:(void *)a3 connection:(void *)a4 queue:(void *)a5 calloutQueue:(void *)a6 workspace:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = v15;
  if (a1)
  {
    if (!v11)
    {
      v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:]();
      }
      [v33 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v12)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:]();
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v13)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:]();
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v14)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"calloutQueue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.4();
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v15)
    {
      v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"workspace"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:].cold.5();
      }
      [v37 UTF8String];
      _bs_set_crash_log_message();
    }
    v42.receiver = a1;
    v42.super_class = (Class)FBSWorkspaceScenesClient;
    a1 = (id *)[super init];
    if (a1)
    {
      uint64_t v17 = [v11 copy];
      id v18 = a1[6];
      a1[6] = (id)v17;

      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a3);
      objc_storeStrong(a1 + 1, a6);
      [a1[1] _queue_registerSource:a1];
      uint64_t v19 = [v16 delegate];
      id v20 = a1[2];
      a1[2] = (id)v19;

      uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
      id v22 = a1[7];
      a1[7] = (id)v21;

      uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
      id v24 = a1[8];
      a1[8] = (id)v23;

      uint64_t v25 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
      id v26 = a1[9];
      a1[9] = (id)v25;

      uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
      id v28 = a1[10];
      a1[10] = (id)v27;

      a1[14] = 0;
      uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
      id v30 = a1[13];
      a1[13] = (id)v29;

      id v31 = a1[5];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke;
      v38[3] = &unk_1E58F6560;
      a1 = a1;
      v39 = a1;
      id v40 = v11;
      id v41 = v14;
      [v31 configureConnection:v38];
    }
  }

  return a1;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 identity];
  id v11 = v10;
  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__FBSWorkspaceScenesClient_scene_didReceiveActions_forExtension___block_invoke;
    block[3] = &unk_1E58F66E8;
    block[4] = self;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    Class v17 = a5;
    dispatch_sync(queue, block);
  }
}

- (void)_callOutQueue_sendDidCreateForScene:(void *)a3 transitionContext:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [*(id *)(a1 + 32) assertOnQueue];
    id v10 = [v7 identity];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke;
    v29[3] = &unk_1E58F6788;
    id v30 = v9;
    id v11 = [off_1E58F44E0 sentinelWithCompletion:v29];
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    id v12 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2;
    block[3] = &unk_1E58F67B0;
    block[4] = a1;
    id v13 = v10;
    id v21 = v13;
    id v14 = v7;
    uint64_t v23 = &v25;
    id v24 = sel__callOutQueue_sendDidCreateForScene_transitionContext_completion_;
    id v22 = v14;
    dispatch_sync(v12, block);
    if (*((unsigned char *)v26 + 24))
    {
      id v15 = *(void **)(a1 + 8);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_197;
      v16[3] = &unk_1E58F6800;
      v16[4] = a1;
      id v17 = v8;
      id v18 = v14;
      id v19 = v11;
      [v15 _calloutQueue_executeCalloutFromSource:a1 withBlock:v16];
    }
    else
    {
      [v11 signal];
    }

    _Block_object_dispose(&v25, 8);
  }
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2(void *a1)
{
  id v2 = a1 + 4;
  id v3 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  uint64_t v4 = (void *)v2[2];

  if (v3 == v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 116));
    uint64_t v5 = [*(id *)(a1[4] + 104) objectForKey:a1[5]];

    if (v5)
    {
      uint64_t v6 = NSString;
      uint64_t v7 = a1[5];
      id v8 = [*(id *)(a1[4] + 104) objectForKey:v7];
      id v9 = [v6 stringWithFormat:@"already have a reported scene with identifier \"%@\" : old=%@ new=%@", v7, v8, a1[6]];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_cold_1();
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
    }
    [*(id *)(a1[4] + 104) setObject:a1[6] forKey:a1[5]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 116));
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (FBSWorkspaceScenesClient)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-[FBSWorkspaceScenesClient init] is unavailable."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = @"FBSWorkspaceScenesClient.m";
    __int16 v16 = 1024;
    int v17 = 191;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (id)initWithPeer:(void *)a3 queue:(void *)a4 calloutQueue:(void *)a5 workspace:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = v9;
    NSClassFromString(&cfstr_Bsserviceconne_0.isa);
    if (!v13)
    {
      id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]();
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]();
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
    }

    __int16 v14 = [v13 service];
    id v15 = +[FBSWorkspaceServiceSpecification identifier];
    char v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      uint64_t v23 = [NSString stringWithFormat:@"provided peer is not for a workspace service"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]();
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
    }
    int v17 = [v13 instance];

    if (v17)
    {
      id v24 = [NSString stringWithFormat:@"provided peer must not be instanced"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient initWithPeer:queue:calloutQueue:workspace:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
    }
    __int16 v18 = +[FBSWorkspaceScenesClientIdentifier identifierWithPeer:]((uint64_t)FBSWorkspaceScenesClientIdentifier, v13);
    if (v18)
    {
      a1 = -[FBSWorkspaceScenesClient _initWithIdentifier:connection:queue:calloutQueue:workspace:](a1, v18, v13, v10, v11, v12);
      id v19 = a1;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_4(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 112));
  uint64_t v4 = FBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 48);
    *(_DWORD *)buf = 134218242;
    uint64_t v51 = v5;
    __int16 v52 = 2112;
    uint64_t v53 = v6;
    _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> was interrupted", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 88);
  *(void *)(v7 + 88) = 0;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v15 = [v14 settings];
        uint64_t v16 = [v15 interruptionPolicy];

        int v17 = *(id **)(a1 + 32);
        if (v16 == 2)
        {
          [v17[9] addObject:v14];
          __int16 v18 = *(void **)(*(void *)(a1 + 32) + 32);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_115;
          v43[3] = &unk_1E58F4B00;
          v43[4] = v14;
          [v18 performAsync:v43];
        }
        else
        {
          -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](v17, v14, 0, 0);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v11);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v19 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v20)
  {
    uint64_t v26 = v20;
    uint64_t v27 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v19);
        }
        uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        id v30 = FBSWorkspaceErrorCreate(0, 3uLL, @"service was interrupted (did the server crash?) : %@", v21, v22, v23, v24, v25, *(void *)(*(void *)(a1 + 32) + 48));
        (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v30);
      }
      uint64_t v26 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v26);
  }

  uint64_t v31 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 80);
  *(void *)(v32 + 80) = v31;

  [*(id *)(*(void *)(a1 + 32) + 40) activate];
  uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 48);
  if (!v34 || (v35 = *(void **)(v34 + 8)) == 0 || ([v35 isNonLaunching] & 1) == 0)
  {
    v36 = FBLogCommon();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(v37 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v51 = v37;
      __int16 v52 = 2112;
      uint64_t v53 = v38;
      _os_log_impl(&dword_19C680000, v36, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> attempting immediate handshake from interruption handler", buf, 0x16u);
    }

    -[FBSWorkspaceScenesClient _queue_sendHandshake](*(void *)(a1 + 32));
  }
}

uint64_t __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_115(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callOutQueue_didUpdateHostHandle:0];
}

- (void)_queue_invalidateScene:(void *)a3 withTransitionContext:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = [v7 identity];
    [a1[7] removeObjectForKey:v10];
    [a1[8] removeObjectForKey:v10];
    [a1[9] removeObject:v7];
    uint64_t v11 = [v8 actions];
    -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:]((uint64_t)a1, v11, v7);

    id v12 = a1[4];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke;
    v23[3] = &unk_1E58F68C8;
    id v24 = v12;
    id v13 = v7;
    id v25 = v13;
    id v26 = v9;
    id v14 = v12;
    id v15 = [off_1E58F44E0 sentinelWithCompletion:v23];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_3;
    v18[3] = &unk_1E58F6828;
    v18[4] = a1;
    id v19 = v10;
    id v20 = v13;
    id v21 = v8;
    id v22 = v15;
    id v16 = v15;
    id v17 = v10;
    [v14 performAsync:v18];
  }
}

void __88__FBSWorkspaceScenesClient__initWithIdentifier_connection_queue_calloutQueue_workspace___block_invoke_119(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 48);
    *(_DWORD *)buf = 134218242;
    uint64_t v37 = v3;
    __int16 v38 = 2112;
    uint64_t v39 = v4;
    _os_log_impl(&dword_19C680000, v2, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> was invalidated", buf, 0x16u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](*(id **)(a1 + 32), *(void **)(*((void *)&v30 + 1) + 8 * v9++), 0, 0);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) _queue_unregisterSource];
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v13)
  {
    uint64_t v19 = v13;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v12);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * v21);
        uint64_t v23 = FBSWorkspaceErrorCreate(0, 3uLL, @"service was invalidated : %@", v14, v15, v16, v17, v18, *(void *)(*(void *)(a1 + 32) + 48));
        (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 80);
  *(void *)(v24 + 80) = 0;
}

- (id)sceneWithIdentity:(id)a3
{
  if (a3)
  {
    p_reportingLock = &self->_reportingLock;
    id v5 = a3;
    os_unfair_lock_lock(p_reportingLock);
    uint64_t v6 = [(NSMutableDictionary *)self->_reportingLock_scenesByIdentity objectForKey:v5];

    os_unfair_lock_unlock(p_reportingLock);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)sendActions:(id)a3 toWorkspaceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)self);
  if (v16)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__FBSWorkspaceScenesClient_sendActions_toWorkspaceID_completion___block_invoke;
    v18[3] = &unk_1E58F5878;
    id v19 = v10;
    [v16 workspaceID:v9 sendActions:v8 completion:v18];
  }
  else if (v10)
  {
    uint64_t v17 = FBSWorkspaceErrorCreate(0, 3uLL, @"no proxy available for %@", v11, v12, v13, v14, v15, (uint64_t)self->_identifier);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v17);
  }
}

uint64_t __65__FBSWorkspaceScenesClient_sendActions_toWorkspaceID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (id)createSceneFutureWithDefinition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identity];
  if (!v5)
  {
    uint64_t v13 = [NSString stringWithFormat:@"identity is not specified"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceScenesClient createSceneFutureWithDefinition:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v6 = (void *)v5;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  uint64_t v7 = [v4 parameters];
  [v7 updateSettingsWithBlock:&__block_literal_global_14];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke_141;
  v14[3] = &unk_1E58F65A8;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v14);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

uint64_t __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setClientFuture:1];
}

uint64_t __60__FBSWorkspaceScenesClient_createSceneFutureWithDefinition___block_invoke_141(uint64_t a1)
{
  uint64_t v2 = -[FBSWorkspaceScenesClient _createSceneWithIdentity:parameters:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)activateSceneFuture:(id)a3 completion:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(FBSSerialQueue *)self->_callOutQueue assertOnQueue];
  id v9 = [v7 settings];
  char v10 = [v9 isClientFuture];

  if ((v10 & 1) == 0)
  {
    long long v44 = [NSString stringWithFormat:@"scene is not a client future"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceScenesClient activateSceneFuture:completion:](a2);
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
  }
  id v11 = [v7 identity];
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [v7 identifier];
  [v12 setIdentifier:v13];

  uint64_t v14 = [v7 identity];
  id v15 = [v14 workspaceIdentifier];
  [v12 setWorkspaceIdentifier:v15];

  id v16 = [v7 specification];
  [v12 setSpecification:v16];

  uint64_t v17 = [v7 settings];
  [v12 setInitialSettings:v17];

  uint64_t v18 = [v7 clientSettings];
  [v12 setInitialClientSettings:v18];

  [v12 setClientFuture:1];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke;
  block[3] = &unk_1E58F65A8;
  uint64_t v54 = &v55;
  id v20 = v7;
  id v51 = v20;
  __int16 v52 = self;
  id v21 = v11;
  id v53 = v21;
  dispatch_sync(queue, block);
  uint64_t v22 = [off_1E58F44F0 builderWithObject:v20];
  id v23 = (id)[v22 appendObject:v21 withName:0];
  uint64_t v24 = [v22 build];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2;
  v45[3] = &unk_1E58F65D0;
  id v25 = v24;
  id v46 = v25;
  long long v47 = self;
  id v26 = v21;
  id v48 = v26;
  id v27 = v8;
  id v49 = v27;
  long long v33 = (void (**)(void, void))MEMORY[0x19F3991F0](v45);
  if (*((unsigned char *)v56 + 24))
  {
    uint64_t v34 = FBLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543618;
      id v60 = v25;
      __int16 v61 = 2114;
      v62 = identifier;
      _os_log_impl(&dword_19C680000, v34, OS_LOG_TYPE_DEFAULT, "Requesting scene %{public}@ from %{public}@", buf, 0x16u);
    }

    v36 = -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)self);
    long long v42 = v36;
    if (v36)
    {
      [v36 createSceneWithOptions:v12 completion:v33];
    }
    else
    {
      v43 = FBSWorkspaceErrorCreate(0, 3uLL, @"no proxy available for %@", v37, v38, v39, v40, v41, (uint64_t)self->_identifier);
      ((void (**)(void, void *))v33)[2](v33, v43);
    }
    -[FBSWorkspaceScenesClient _callOutQueue_sendDidCreateForScene:transitionContext:completion:]((uint64_t)self, v20, 0, v33);
  }
  else
  {
    long long v42 = FBSWorkspaceErrorCreate(0, 1uLL, @"scene %@ was invalidated before activation %@", v28, v29, v30, v31, v32, (uint64_t)v25);
    ((void (**)(void, void *))v33)[2](v33, v42);
  }

  _Block_object_dispose(&v55, 8);
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = [*(id *)(a1[5] + 56) objectForKey:a1[6]];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v2 == v3;

  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(a1[5] + 72);
    [v5 addObject:v4];
  }
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = FBLogCommon();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2_cold_1(a1, (uint64_t)v3);
    }

    -[FBSWorkspaceScenesClient _sceneID:destroyWithTransitionContext:completion:](*(id **)(a1 + 40), *(void *)(a1 + 48), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEFAULT, "Request for %{public}@ complete!", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v3 == 0, v3);
  }
}

- (void)_sceneID:(void *)a3 destroyWithTransitionContext:(void *)a4 completion:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = [a1[7] objectForKey:a2];
    if (v9)
    {
      -[FBSWorkspaceScenesClient _queue_invalidateScene:withTransitionContext:completion:](a1, v9, v7, v8);
    }
    else if (v8)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28588];
      v14[0] = @"No FBSScene exists with provided identifier";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v12 = [v10 errorWithDomain:@"FBSWorkspaceScenesClient" code:1 userInfo:v11];
      (*((void (**)(id, void *))v8 + 2))(v8, v12);
    }
  }
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke;
  v17[3] = &unk_1E58F6648;
  void v17[4] = self;
  id v18 = v7;
  id v19 = v8;
  SEL v20 = a2;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void *)[v17 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3;
  block[3] = &unk_1E58F6670;
  void block[4] = self;
  id v15 = v11;
  SEL v16 = a2;
  id v13 = v11;
  dispatch_sync(queue, block);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v12 = v6;
  if (v5)
  {
    if (v6)
    {
      id v18 = [NSString stringWithFormat:@"we shouldn't have an error if we have a proxy : %@", v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_2(a1);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_153;
    v22[3] = &unk_1E58F6620;
    uint64_t v13 = *(void *)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    [v5 requestSceneWithOptions:v13 completion:v22];
  }
  else
  {
    if (!v6)
    {
      uint64_t v12 = FBSWorkspaceErrorCreate(0, 3uLL, @"proxy to %@ was unexpectedly nil", v7, v8, v9, v10, v11, *(void *)(*(void *)(a1 + 32) + 48));
    }
    uint64_t v14 = FBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_1(a1, v12);
    }

    id v15 = *(void **)(*(void *)(a1 + 32) + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_162;
    v19[3] = &unk_1E58F51E0;
    id v16 = *(id *)(a1 + 48);
    id v20 = v12;
    id v21 = v16;
    v19[4] = *(void *)(a1 + 32);
    id v17 = v12;
    [v15 performAsync:v19];
  }
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2;
  v11[3] = &unk_1E58F65F8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  [v8 performAsync:v11];
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    id v9 = -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(void *)(a1 + 48), v3);
    if (!v9)
    {
      uint64_t v10 = FBSWorkspaceErrorCreate(*(void **)(a1 + 32), 1uLL, @"failed to find expected scene from %@ with identifier=%@", v4, v5, v6, v7, v8, *(void *)(*(void *)(a1 + 48) + 48));

      id v2 = (id)v10;
    }
  }
  else
  {
    id v9 = 0;
  }
  if (v2)
  {
    uint64_t v11 = FBLogCommon();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(v13 + 48);
        id v15 = [v2 succinctDescription];
        *(_DWORD *)buf = 134218498;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        __int16 v27 = 2114;
        uint64_t v28 = v15;
        _os_log_impl(&dword_19C680000, v12, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> scene request received error response : %{public}@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_cold_1(a1, v2);
    }
  }
  id v16 = *(void **)(a1 + 56);
  if (v16)
  {
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = *(void **)(v17 + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_157;
    v19[3] = &unk_1E58F51E0;
    id v22 = v16;
    id v20 = v9;
    id v21 = v2;
    [v18 _calloutQueue_executeCalloutFromSource:v17 withBlock:v19];
  }
}

uint64_t __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_157(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_162(uint64_t a1)
{
  SEL v1 = *(void **)(a1 + 48);
  if (v1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_163;
    v5[3] = &unk_1E58F5450;
    id v7 = v1;
    id v6 = *(id *)(a1 + 40);
    [v4 _calloutQueue_executeCalloutFromSource:v3 withBlock:v5];
  }
}

uint64_t __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_163(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v4 && (v5 = *(void **)(v4 + 8)) != 0 && (int v6 = [v5 isNonLaunching], v2 = *v3, v6))
  {
    id v7 = *(void **)(v2 + 80);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v7)
    {
      id v9 = (void *)MEMORY[0x19F3991F0](*(void *)(a1 + 40));
      [v7 addObject:v9];

      dispatch_time_t v10 = dispatch_time(0, 30000000000);
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(NSObject **)(v11 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_4;
      block[3] = &unk_1E58F57B0;
      void block[4] = v11;
      id v17 = *(id *)(a1 + 40);
      dispatch_after(v10, v12, block);

      return;
    }
    -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)v2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v15, 0);
  }
  else
  {
    if (*(void *)(v2 + 80))
    {
      uint64_t v14 = [NSString stringWithFormat:@"internal state inconsistency - we should never be pending send blocks for !isNonLaunching (%@) connections", *(void *)(v2 + 48)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3_cold_1();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v13 = *(void *)(a1 + 40);
    -[FBSWorkspaceScenesClient _remoteTarget]((os_unfair_lock_s *)v2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v15, 0);
  }
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v3 = (void *)MEMORY[0x19F3991F0](*(void *)(a1 + 40));
  LODWORD(v2) = [v2 containsObject:v3];

  if (v2)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    dispatch_time_t v10 = FBSWorkspaceErrorCreate(0, 3uLL, @"non-launching service failed to become available within 30s : %@", v4, v5, v6, v7, v8, *(void *)(*(void *)(a1 + 32) + 48));
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(*(void *)(a1 + 32) + 80);
    id v13 = (id)MEMORY[0x19F3991F0](v11);
    [v12 removeObject:v13];
  }
}

- (id)hostProcess
{
  return (id)[(BSServiceConnection *)self->_connection remoteProcess];
}

- (void)scene:(id)a3 sendMessage:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 identity];
  id v12 = v11;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke;
    block[3] = &unk_1E58F6760;
    void block[4] = self;
    uint64_t v14 = &v21;
    id v21 = v11;
    id v15 = &v22;
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    dispatch_sync(queue, block);

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    callOutQueue = self->_callOutQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_9;
    v17[3] = &unk_1E58F5918;
    void v17[4] = self;
    uint64_t v14 = &v19;
    id v15 = (id *)&v18;
    uint64_t v18 = 0;
    id v19 = v10;
    [(FBSSerialQueue *)callOutQueue performAsync:v17];
    goto LABEL_5;
  }
LABEL_6:
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2 != *(void **)(a1 + 48))
  {

    goto LABEL_4;
  }
  char v4 = [*(id *)(*(void *)(a1 + 32) + 72) containsObject:v2];

  if ((v4 & 1) == 0)
  {
    id v8 = -[FBSWorkspaceScenesClient _remoteTarget](*(os_unfair_lock_s **)(a1 + 32));
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_2;
      v22[3] = &unk_1E58F6738;
      uint64_t v10 = *(void *)(a1 + 56);
      id v11 = *(id *)(a1 + 64);
      v22[4] = *(void *)(a1 + 32);
      id v23 = v11;
      [v8 sceneID:v9 sendMessage:v10 withResponse:v22];
      id v12 = v23;
    }
    else
    {
      id v13 = *(void **)(a1 + 64);
      if (!v13)
      {
LABEL_11:

        return;
      }
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_5;
      v19[3] = &unk_1E58F5918;
      void v19[4] = v14;
      id v21 = v13;
      id v20 = *(id *)(a1 + 40);
      [v15 performAsync:v19];

      id v12 = v21;
    }

    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void **)(a1 + 64);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_7;
    v16[3] = &unk_1E58F5918;
    v16[4] = v6;
    id v18 = v5;
    id v17 = *(id *)(a1 + 40);
    [v7 performAsync:v16];
  }
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_3;
    v10[3] = &unk_1E58F6710;
    void v10[4] = v8;
    id v13 = v7;
    id v11 = v5;
    id v12 = v6;
    [v9 performAsync:v10];
  }
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_4;
  v4[3] = &unk_1E58F51E0;
  id v7 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 _calloutQueue_executeCalloutFromSource:v2 withBlock:v4];
}

uint64_t __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_6;
  v4[3] = &unk_1E58F5450;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 _calloutQueue_executeCalloutFromSource:v2 withBlock:v4];
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, @"the remote target isn't valid : identifier=%@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_8;
  v4[3] = &unk_1E58F5450;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 _calloutQueue_executeCalloutFromSource:v2 withBlock:v4];
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, @"scene is not valid : identifier=%@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_10;
  v4[3] = &unk_1E58F5450;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  [v3 _calloutQueue_executeCalloutFromSource:v2 withBlock:v4];
}

void __59__FBSWorkspaceScenesClient_scene_sendMessage_withResponse___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  FBSWorkspaceErrorCreate(0, 1uLL, @"scene is not valid : identifier=%@", a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v9);
}

- (void)willTerminateWithTransitionContext:(id)a3
{
  id v4 = a3;
  callOutQueue = self->_callOutQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke;
  v7[3] = &unk_1E58F4AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FBSSerialQueue *)callOutQueue performAsync:v7];
}

void __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke_2;
  v3[3] = &unk_1E58F4AB0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 _calloutQueue_executeCalloutFromSource:v1 withBlock:v3];
}

void __63__FBSWorkspaceScenesClient_willTerminateWithTransitionContext___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  if (objc_opt_respondsToSelector()) {
    [v2 workspaceShouldExit:*(void *)(*(void *)(a1 + 32) + 8) withTransitionContext:*(void *)(a1 + 40)];
  }
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_198(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(v2 + 8);
    id v4 = *(void **)(v2 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_3;
    v8[3] = &unk_1E58F67D8;
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v4 workspace:v5 didCreateScene:v3 withTransitionContext:v6 completion:v8];
  }
  else
  {
    id v7 = *(void **)(a1 + 56);
    [v7 signal];
  }
}

uint64_t __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (void)reconnectSceneWithIdentity:(id)a3 parameters:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = FBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 134218498;
    __int16 v27 = self;
    __int16 v28 = 2112;
    uint64_t v29 = identifier;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_impl(&dword_19C680000, v14, OS_LOG_TYPE_DEFAULT, "<FBSWorkspaceScenesClient:%p %@> Reconnecting scene %{public}@", buf, 0x20u);
  }

  uint64_t v16 = [(NSMutableDictionary *)self->_scenesByIdentity objectForKey:v10];
  if (v16)
  {
    id v17 = (void *)v16;
    if ([(NSHashTable *)self->_reconnectingScenes containsObject:v16])
    {
      [(NSHashTable *)self->_reconnectingScenes removeObject:v17];
      id v18 = [v17 specification];
      id v19 = [v11 specification];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();

      if (v20 == v21)
      {
        [v11 clientSettings];
        objc_claimAutoreleasedReturnValue();
        [v18 clientSettingsClass];
        if (objc_opt_isKindOfClass())
        {
          [(NSMutableDictionary *)self->_clientSettingsByIdentity objectForKey:v10];
          objc_claimAutoreleasedReturnValue();
          BSEqualObjects();
        }
        __int16 v25 = [NSString stringWithFormat:@"clientSettings mismatch in reconnect"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:]();
        }
        [v25 UTF8String];
        _bs_set_crash_log_message();
      }
      id v24 = [NSString stringWithFormat:@"specification mismatch in reconnect"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:].cold.4();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
    }
    id v22 = @"not-waiting";
  }
  else
  {
    id v22 = @"not-found";
  }
  id v23 = [NSString stringWithFormat:@"impossible to reconnect '%@' : remnant=%@", v10, v22];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[FBSWorkspaceScenesClient reconnectSceneWithIdentity:parameters:transitionContext:completion:]();
  }
  [v23 UTF8String];
  _bs_set_crash_log_message();
}

void __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = FBLogSceneClient();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(a1, (uint64_t)v3);
    }
  }
}

uint64_t __95__FBSWorkspaceScenesClient_reconnectSceneWithIdentity_parameters_transitionContext_completion___block_invoke_221(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callOutQueue_didUpdateHostHandle:*(void *)(a1 + 40)];
}

- (void)sceneID:(id)a3 destroyWithTransitionContext:(id)a4 completion:(id)a5
{
}

- (void)sendActions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  callOutQueue = self->_callOutQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke;
  v11[3] = &unk_1E58F54F0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(FBSSerialQueue *)callOutQueue performAsync:v11];
}

uint64_t __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 8);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke_2;
    v5[3] = &unk_1E58F4AB0;
    void v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    [v3 _calloutQueue_executeCalloutFromSource:v2 withBlock:v5];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __51__FBSWorkspaceScenesClient_sendActions_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) workspace:*(void *)(*(void *)(a1 + 32) + 8) didReceiveActions:*(void *)(a1 + 40)];
}

- (void)sceneID:(id)a3 sendActions:(id)a4 toExtension:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)v10);
  callOutQueue = self->_callOutQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke;
  v21[3] = &unk_1E58F6850;
  id v22 = v14;
  id v23 = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = v14;
  [(FBSSerialQueue *)callOutQueue performAsync:v21];
}

uint64_t __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = -[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(void *)(a1 + 40), *(void **)(a1 + 48));

    if (v2 == v3)
    {
      -[FBSWorkspaceScenesClient _configureReceivedActions:forScene:](*(void *)(a1 + 40), *(void **)(a1 + 56), *(void **)(a1 + 32));
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void **)(v4 + 8);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2;
      v9[3] = &unk_1E58F6828;
      id v10 = *(id *)(a1 + 64);
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      id v11 = v6;
      uint64_t v12 = v7;
      id v13 = *(id *)(a1 + 56);
      id v14 = *(id *)(a1 + 48);
      [v5 _calloutQueue_executeCalloutFromSource:v4 withBlock:v9];
    }
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2(void *a1)
{
  id v3 = a1 + 4;
  uint64_t v2 = (NSString *)a1[4];
  if (!v2)
  {
    Class v5 = 0;
LABEL_11:
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    uint64_t v10 = a1[7];
    [v8 updater:v9 didReceiveActions:v10 forExtension:v5];
    return;
  }
  Class v4 = NSClassFromString(v2);
  Class v5 = v4;
  if (*v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = FBLogSceneClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2_cold_1((uint64_t)a1, v3, v7);
  }
}

- (void)sceneID:(id)a3 sendMessage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[FBSWorkspaceScenesClient _queue_connectedSceneWithIdentity:]((id *)&self->super.isa, (uint64_t)v8);
  callOutQueue = self->_callOutQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke;
  v17[3] = &unk_1E58F6760;
  id v18 = v11;
  id v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  [(FBSSerialQueue *)callOutQueue performAsync:v17];
}

void __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = *(void **)(a1 + 32);
  if (v9
    && (-[FBSWorkspaceScenesClient _reportedSceneWithIdentity:](*(void *)(a1 + 40), *(void **)(a1 + 48)),
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9 == v10))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 8);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_2;
    v17[3] = &unk_1E58F65F8;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = v14;
    uint64_t v19 = v15;
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    [v13 _calloutQueue_executeCalloutFromSource:v12 withBlock:v17];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11)
    {
      FBSWorkspaceErrorCreate(0, 1uLL, @"failed to find expected scene with identifier=%@", a4, a5, a6, a7, a8, *(void *)(a1 + 48));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v16);
    }
  }
}

void __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_3;
  v4[3] = &unk_1E58F6878;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 updater:v2 didReceiveMessage:v3 withResponse:v4];
}

uint64_t __59__FBSWorkspaceScenesClient_sceneID_sendMessage_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_2;
  v3[3] = &unk_1E58F57B0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performAsync:v3];
}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _callOutQueue_invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 116));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 48);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 116));
  if (v2 == v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 8);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_4;
    uint64_t v12 = &unk_1E58F6800;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    id v15 = v7;
    uint64_t v16 = v8;
    [v6 _calloutQueue_executeCalloutFromSource:v5 withBlock:&v9];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 116));
    [*(id *)(*(void *)(a1 + 32) + 104) removeObjectForKey:*(void *)(a1 + 40) v9, v10, v11, v12];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 116));
  }
  else
  {
    id v4 = *(void **)(a1 + 64);
    [v4 signal];
  }
}

void __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_5;
  v11[3] = &unk_1E58F4B00;
  id v12 = *(id *)(a1 + 48);
  if ([v2 _callOutQueue_willDestroyWithTransitionContext:v3 completion:v11] == NO)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(v4 + 8);
      uint64_t v5 = *(void **)(v4 + 16);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_6;
      v9[3] = &unk_1E58F68F0;
      id v10 = *(id *)(a1 + 48);
      [v5 workspace:v6 willDestroyScene:v7 withTransitionContext:v8 completion:v9];
    }
    else
    {
      [*(id *)(a1 + 48) signal];
    }
  }
}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

uint64_t __84__FBSWorkspaceScenesClient__queue_invalidateScene_withTransitionContext_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingLock_scenesByIdentity, 0);
  objc_storeStrong((id *)&self->_handshakeLock_remoteTarget, 0);
  objc_storeStrong((id *)&self->_hostHandle, 0);
  objc_storeStrong((id *)&self->_pendedSendBlocks, 0);
  objc_storeStrong((id *)&self->_reconnectingScenes, 0);
  objc_storeStrong((id *)&self->_clientSettingsByIdentity, 0);
  objc_storeStrong((id *)&self->_scenesByIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_workspaceDelegate, 0);

  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.2()
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

- (void)initWithEndpoint:queue:calloutQueue:workspace:.cold.3()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.1()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.2()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.3()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.4()
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

- (void)_initWithIdentifier:connection:queue:calloutQueue:workspace:.cold.5()
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

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.2()
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

- (void)initWithPeer:queue:calloutQueue:workspace:.cold.3()
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

+ (void)sourceIdentifierForHostEndpoint:.cold.1()
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

- (void)queue_activate
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

- (void)createSceneFutureWithDefinition:.cold.1()
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

- (void)_createSceneWithIdentity:parameters:.cold.1()
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

- (void)_createSceneWithIdentity:(uint64_t)a1 parameters:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 identityToken];
  OUTLINED_FUNCTION_10_0(&dword_19C680000, v2, v3, "<FBSWorkspaceScenesClient:%p %@> purging remnant for incoming scene : token=%@", v4, v5, v6, v7, 2u);
}

- (void)_createSceneWithIdentity:parameters:.cold.3()
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

- (void)activateSceneFuture:(const char *)a1 completion:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __59__FBSWorkspaceScenesClient_activateSceneFuture_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_9_0(a1, a2) descriptionWithMultilinePrefix:];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v3, v4, "Error creating %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 succinctDescription];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_10_0(&dword_19C680000, v3, v4, "<FBSWorkspaceScenesClient:%p %@> failed to send scene request with error : %{public}@", v5, v6, v7, v8, v9);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_cold_2(uint64_t a1)
{
  SEL v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 succinctDescription];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_10_0(&dword_19C680000, v3, v4, "<FBSWorkspaceScenesClient:%p %@> scene request failed to return scene with error response : %{public}@", v5, v6, v7, v8, v9);
}

void __63__FBSWorkspaceScenesClient_requestSceneWithOptions_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __85__FBSWorkspaceScenesClient_scene_didUpdateClientSettings_withDiff_transitionContext___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [OUTLINED_FUNCTION_9_0(a1, a2) descriptionWithMultilinePrefix:];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_19C680000, v3, v4, "[%{public}@] error updating client settings: %{public}@", v5, v6, v7, v8, v9);
}

void __93__FBSWorkspaceScenesClient__callOutQueue_sendDidCreateForScene_transitionContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 64));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.1()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.2()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.3()
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

- (void)reconnectSceneWithIdentity:parameters:transitionContext:completion:.cold.4()
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

void __71__FBSWorkspaceScenesClient_sceneID_sendActions_toExtension_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to deliver actions to extension \"%{public}@\" because that class does not exist.", (uint8_t *)&v5, 0x16u);
}

@end