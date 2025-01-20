@interface FBSceneManagerObserver
- (BOOL)delegateHandlesClientScenes;
- (BOOL)delegateHandlesLegacyInterception;
- (BOOL)delegateReceivesActions;
- (BOOL)delegateReceivesSceneActions;
- (BOOL)isDelegate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalObserver;
- (FBSceneManagerObserver)initWithDelegate:(id)a3 supportLegacy:(BOOL)a4;
- (NSString)description;
- (id)_initWithObserver:(id)a3 supportLegacy:(BOOL)a4;
- (id)_internalObserver;
- (id)_privateDelegate;
- (id)delegate;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)observer;
- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5;
- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5;
- (void)sceneManager:(id)a3 scene:(id)a4 didUpdateClientSettingsWithDiff:(id)a5 oldClientSettings:(id)a6 transitionContext:(id)a7;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 appliedWithContext:(id)a5;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 completedWithContext:(id)a5 error:(id)a6;
- (void)sceneManager:(id)a3 updateForScene:(id)a4 preparedWithContext:(id)a5;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 willRemoveScene:(id)a4;
- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3;
- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3;
- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)workspace:(id)a3 didAddScene:(id)a4;
- (void)workspace:(id)a3 didReceiveActions:(id)a4;
- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6;
- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6;
- (void)workspace:(id)a3 willRemoveScene:(id)a4;
@end

@implementation FBSceneManagerObserver

- (BOOL)isInternalObserver
{
  return self->_internalObserver;
}

- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3
{
  if (self->_willSynchronizeLEGACY)
  {
    id v4 = a3;
    id v5 = [(FBSceneManagerObserver *)self _internalObserver];
    [v5 sceneManagerWillBeginSceneUpdateSynchronization:v4];
  }
}

- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3
{
  if (self->_didSynchronizeLEGACY)
  {
    id v4 = a3;
    id v5 = [(FBSceneManagerObserver *)self _internalObserver];
    [v5 sceneManagerDidEndSceneUpdateSynchronization:v4];
  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 preparedWithContext:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(FBSceneManagerObserver *)self observer];
  v11 = v10;
  if (self->_updatePreparedDEPRECATED)
  {
    [v10 sceneManager:v14 updateForScene:v8 preparedWithContext:v9];
  }
  else if (self->_willUpdateSceneDEPRECATED && (unint64_t)[v9 transactionID] >= 2)
  {
    v12 = [v9 settings];
    v13 = [v9 transitionContext];
    [v11 sceneManager:v14 willUpdateScene:v8 withSettings:v12 transitionContext:v13];
  }
}

- (id)_internalObserver
{
  if (self->_internalObserver)
  {
    v2 = [(FBSceneManagerObserver *)self observer];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return WeakRetained;
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 appliedWithContext:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(FBSceneManagerObserver *)self observer];
  v11 = v10;
  if (self->_updateAppliedDEPRECATED)
  {
    [v10 sceneManager:v12 updateForScene:v8 appliedWithContext:v9];
  }
  else if (self->_willCommitDEPRECATED)
  {
    objc_msgSend(v10, "sceneManager:willCommitUpdateForScene:transactionID:", v12, v8, objc_msgSend(v9, "transactionID"));
  }
}

- (void)sceneManager:(id)a3 updateForScene:(id)a4 completedWithContext:(id)a5 error:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(FBSceneManagerObserver *)self observer];
  id v14 = v13;
  if (self->_updateCompletedDEPRECATED)
  {
    [v13 sceneManager:v15 updateForScene:v10 completedWithContext:v11 error:v12];
  }
  else if (self->_didCommitDEPRECATED2)
  {
    objc_msgSend(v13, "sceneManager:didCommitUpdateForScene:transactionID:success:", v15, v10, objc_msgSend(v11, "transactionID"), v12 == 0);
  }
  else if (self->_didCommitDEPRECATED)
  {
    objc_msgSend(v13, "sceneManager:didCommitUpdateForScene:transactionID:", v15, v10, objc_msgSend(v11, "transactionID"));
  }
}

- (void)sceneManager:(id)a3 scene:(id)a4 didUpdateClientSettingsWithDiff:(id)a5 oldClientSettings:(id)a6 transitionContext:(id)a7
{
  if (self->_didUpdateClientSettingsDEPRECATED)
  {
    id v12 = a7;
    id v13 = a6;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    id v17 = [(FBSceneManagerObserver *)self delegate];
    [v17 sceneManager:v16 scene:v15 didUpdateClientSettingsWithDiff:v14 oldClientSettings:v13 transitionContext:v12];
  }
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id v11 = a3;
  v6 = (id *)a4;
  v7 = [(FBSceneManagerObserver *)self observer];
  id v8 = v7;
  if (self->_supportLegacy)
  {
    if (self->_didAddLEGACY) { {
      [v7 sceneManager:__LegacyManager_0 didAddScene:v6];
    }
    }
    if (self->_didCreateDEPRECATED)
    {
      [v8 sceneManager:__LegacyManager_0 didCreateScene:v6];
    }
    else if (self->_didCreateSceneDEPRECATED)
    {
      uint64_t v9 = __LegacyManager_0;
      id v10 = -[FBScene client](v6);
      [v8 sceneManager:v9 didCreateScene:v6 withClient:v10];
    }
  }
  else if (self->_didAdd)
  {
    [v7 workspace:v11 didAddScene:v6];
  }
}

- (void)sceneManager:(id)a3 interceptUpdateForScene:(id)a4 withNewSettings:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (self->_interceptSceneUpdatesLEGACY)
  {
    id v9 = a5;
    id v10 = a3;
    id v11 = FBLogScene();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 identifier];
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_INFO, "Client intercepting scene update for scene: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [(FBSceneManagerObserver *)self _privateDelegate];
    [v13 sceneManager:v10 interceptUpdateForScene:v8 withNewSettings:v9];
  }
}

- (BOOL)delegateHandlesLegacyInterception
{
  return self->_interceptSceneUpdatesLEGACY;
}

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSceneManagerObserver *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_observerAddress == self->_observerAddress
      && v4->_observerClass == self->_observerClass)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      id v8 = objc_loadWeakRetained((id *)&self->_observer);
      BOOL v5 = WeakRetained == v8;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)_privateDelegate
{
  if (self->_privateDelegate)
  {
    v2 = [(FBSceneManagerObserver *)self delegate];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBSceneManagerObserver *)self delegate];
  id v9 = v8;
  if (!v8)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = objc_msgSend(v7, "remnants", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) { {
            objc_enumerationMutation(v10);
          }
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) invalidate];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v12);
    }
LABEL_11:

    goto LABEL_14;
  }
  if (!self->_clientDidConnect)
  {
    if (self->_clientDidConnectLEGACY)
    {
      [v8 sceneManager:__LegacyManager_0 clientDidConnectWithHandshake:v7];
      goto LABEL_14;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [v7 remnants];
    uint64_t v15 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) { {
            objc_enumerationMutation(v10);
          }
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * j) invalidate];
        }
        uint64_t v16 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v16);
    }
    goto LABEL_11;
  }
  [v8 workspace:v6 clientDidConnectWithHandshake:v7];
LABEL_14:
}

- (id)delegate
{
  if (self->_isDelegate) { {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  }
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)_initWithObserver:(id)a3 supportLegacy:(BOOL)a4
{
  id v6 = a3;
  if (!__LegacyManager_0)
  {
    uint64_t v7 = +[FBSceneManager sharedInstance];
    id v8 = (void *)__LegacyManager_0;
    __LegacyManager_0 = v7;
  }
  v14.receiver = self;
  v14.super_class = (Class)FBSceneManagerObserver;
  id v9 = [(FBSceneManagerObserver *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_supportLegacy = a4;
    uint64_t v11 = objc_opt_class();
    v10->_observerAddress = (unint64_t)v6;
    v10->_observerClass = (Class)v11;
    objc_storeWeak((id *)&v10->_observer, v6);
    v10->_didAdd = objc_opt_respondsToSelector() & 1;
    v10->_willRemove = objc_opt_respondsToSelector() & 1;
    if (v10->_supportLegacy)
    {
      v10->_didAddLEGACY = objc_opt_respondsToSelector() & 1;
      v10->_willRemoveLEGACY = objc_opt_respondsToSelector() & 1;
      v10->_didCreateDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willDestroyDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didDestroyDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updatePreparedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updateAppliedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_updateCompletedDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didCreateSceneDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willUpdateSceneDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willCommitDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_didCommitDEPRECATED2 = objc_opt_respondsToSelector() & 1;
      v10->_didCommitDEPRECATED = objc_opt_respondsToSelector() & 1;
      v10->_willSynchronizeLEGACY = objc_opt_respondsToSelector() & 1;
      char v12 = objc_opt_respondsToSelector();
      v10->_didSynchronizeLEGACY = v12 & 1;
      v10->_internalObserver = v10->_willSynchronizeLEGACY | v12 & 1;
    }
  }

  return v10;
}

- (FBSceneManagerObserver)initWithDelegate:(id)a3 supportLegacy:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(FBSceneManagerObserver *)self _initWithObserver:v6 supportLegacy:v4];
  id v8 = v7;
  if (v7)
  {
    v7->_isDelegate = 1;
    v7->_clientDidConnect = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveSceneRequest = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveScene = objc_opt_respondsToSelector() & 1;
    v8->_didReceiveActions = objc_opt_respondsToSelector() & 1;
    if (v4)
    {
      v8->_clientDidConnectLEGACY = objc_opt_respondsToSelector() & 1;
      v8->_didReceiveSceneRequestLEGACY = objc_opt_respondsToSelector() & 1;
      v8->_didReceiveActionsDEPRECATED = objc_opt_respondsToSelector() & 1;
      v8->_didUpdateClientSettingsDEPRECATED = objc_opt_respondsToSelector() & 1;
      char v9 = objc_opt_respondsToSelector();
      v8->_interceptSceneUpdatesLEGACY = v9 & 1;
      v8->_privateDelegate = v9 & 1;
    }
  }

  return v8;
}

- (BOOL)isDelegate
{
  return self->_isDelegate;
}

- (BOOL)delegateReceivesActions
{
  return self->_isDelegate && self->_didReceiveActions;
}

- (BOOL)delegateHandlesClientScenes
{
  return self->_isDelegate && self->_didReceiveScene;
}

- (BOOL)delegateReceivesSceneActions
{
  return self->_didReceiveActionsDEPRECATED;
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = (void (**)(id, void, void *))a6;
  uint64_t v13 = [(FBSceneManagerObserver *)self delegate];
  objc_super v14 = v13;
  if (!v13) { {
    goto LABEL_7;
  }
  }
  if (self->_didReceiveSceneRequest)
  {
    [v13 workspace:v16 didReceiveSceneRequestWithOptions:v10 fromProcess:v11 completion:v12];
    goto LABEL_8;
  }
  if (self->_didReceiveSceneRequestLEGACY)
  {
    [v13 sceneManager:__LegacyManager_0 didReceiveSceneRequestWithOptions:v10 fromProcess:v11 completion:v12];
  }
  else
  {
LABEL_7:
    uint64_t v15 = FBSWorkspaceErrorCreate();
    v12[2](v12, 0, v15);
  }
LABEL_8:
}

- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(FBSceneManagerObserver *)self delegate];
  objc_super v14 = v13;
  if (v13 && self->_didReceiveScene) { {
    [v13 workspace:v15 didReceiveScene:v10 withContext:v11 fromProcess:v12];
  }
  }
}

- (void)workspace:(id)a3 didReceiveActions:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(FBSceneManagerObserver *)self delegate];
  id v8 = v7;
  if (v7 && self->_didReceiveActions) { {
    [v7 workspace:v9 didReceiveActions:v6];
  }
  }
}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(FBSceneManagerObserver *)self observer];
  id v8 = v7;
  if (self->_supportLegacy && self->_willRemoveLEGACY)
  {
    [v7 sceneManager:__LegacyManager_0 willRemoveScene:v6];
  }
  else if (self->_willRemove)
  {
    [v7 workspace:v9 willRemoveScene:v6];
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"no longer used"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    objc_super v14 = v10;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    long long v20 = @"FBSceneManagerObserver.m";
    __int16 v21 = 1024;
    int v22 = 293;
    __int16 v23 = 2114;
    long long v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  if (self->_willDestroyDEPRECATED)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(FBSceneManagerObserver *)self observer];
    [v8 sceneManager:v7 willDestroyScene:v6];
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  if (self->_didDestroyDEPRECATED)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(FBSceneManagerObserver *)self observer];
    [v8 sceneManager:v7 didDestroyScene:v6];
  }
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"no longer used"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    objc_super v14 = v10;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    long long v20 = @"FBSceneManagerObserver.m";
    __int16 v21 = 1024;
    int v22 = 341;
    __int16 v23 = 2114;
    long long v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneManager:(id)a3 willRemoveScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"no longer used"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    objc_super v14 = v10;
    __int16 v15 = 2114;
    id v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    long long v20 = @"FBSceneManagerObserver.m";
    __int16 v21 = 1024;
    int v22 = 345;
    __int16 v23 = 2114;
    long long v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneManager:(id)a3 scene:(id)a4 didReceiveActions:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_didReceiveActionsDEPRECATED)
  {
    id v11 = [(FBSceneManagerObserver *)self delegate];
    [v11 sceneManager:v8 scene:v9 didReceiveActions:v10];
  }
  else
  {
    id v11 = FBLogScene();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v9 identifier];
      int v13 = 138543362;
      objc_super v14 = v12;
      _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_DEFAULT, "Dropping actions since manager delegate does not implement handler: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)sceneManager:(id)a3 createDefaultTransitionContextForScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"no longer used"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v14 = 138544642;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    __int16 v17 = v12;
    __int16 v18 = 2048;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = @"FBSceneManagerObserver.m";
    __int16 v22 = 1024;
    int v23 = 363;
    __int16 v24 = 2114;
    long long v25 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);
  }
  [v9 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)sceneManager:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"no longer used"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    int v14 = v10;
    __int16 v15 = 2114;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = @"FBSceneManagerObserver.m";
    __int16 v21 = 1024;
    int v22 = 368;
    __int16 v23 = 2114;
    __int16 v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (NSString)description
{
  return (NSString *)[(FBSceneManagerObserver *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSceneManagerObserver *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v5 = (id)[v3 appendPointer:WeakRetained withName:@"observer"];

  if (self->_isDelegate) { {
    id v6 = (id)[v3 appendBool:1 withName:@"isDelegate"];
  }
  }
  if (self->_internalObserver) { {
    id v7 = (id)[v3 appendBool:1 withName:@"isInternalObserver"];
  }
  }

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSceneManagerObserver *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
}

@end