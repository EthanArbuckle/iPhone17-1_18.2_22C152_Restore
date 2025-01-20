@interface FBSceneMonitor
- (BOOL)isPairedWithExternalSceneID:(id)a3;
- (FBSSceneSettings)sceneSettings;
- (FBScene)scene;
- (FBSceneMonitor)initWithScene:(id)a3;
- (FBSceneMonitor)initWithSceneID:(id)a3;
- (FBSceneMonitorBehaviors)behaviors;
- (FBSceneMonitorDelegate)delegate;
- (NSString)description;
- (NSString)sceneID;
- (id)_effectiveBehaviors;
- (id)_initWithSceneManager:(id)a3 sceneID:(id)a4;
- (void)_evaluateEffectiveMonitorBehaviors;
- (void)_setEffectiveMonitorBehaviors:(id)a3;
- (void)_updateAllSceneStateIgnoringDelegate;
- (void)_updateExternalScenes:(BOOL)a3;
- (void)_updateScenePairingState:(BOOL)a3;
- (void)_updateSceneSettings:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3;
- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3;
- (void)setBehaviors:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FBSceneMonitor

- (void)sceneManagerWillBeginSceneUpdateSynchronization:(id)a3
{
  self->_isSynchronizing = 1;
}

- (void)sceneManagerDidEndSceneUpdateSynchronization:(id)a3
{
  id v4 = a3;
  self->_isSynchronizing = 0;
  if (self->_updateSettingsAfterSync)
  {
    self->_updateSettingsAfterSync = 0;
    [(FBSceneMonitor *)self _updateSceneSettings:0];
  }
  if (self->_updateExternalScenesAfterSync)
  {
    self->_updateExternalScenesAfterSync = 0;
    [(FBSceneMonitor *)self _updateExternalScenes:0];
  }
}

- (void)_updateSceneSettings:(BOOL)a3
{
  if (!self->_isSynchronizing || a3)
  {
    v9 = [(FBScene *)self->_scene settings];
    id v4 = self->_sceneSettings;
    if ([(FBSceneMonitorBehaviors *)self->_effectiveMonitorBehaviors monitorsSettings])
    {
      v5 = [MEMORY[0x1E4F62A80] diffFromSettings:self->_sceneSettings toSettings:v9];
    }
    else
    {
      v5 = 0;
    }
    if (v9 != self->_sceneSettings)
    {
      v6 = (FBSMutableSceneSettings *)[(FBSMutableSceneSettings *)v9 copy];
      sceneSettings = self->_sceneSettings;
      self->_sceneSettings = v6;
    }
    if ([(FBSceneMonitorBehaviors *)self->_effectiveMonitorBehaviors monitorsSettings] && v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained sceneMonitor:self sceneSettingsDidChangeWithDiff:v5 previousSettings:v4];
    }
  }
  else
  {
    self->_updateSettingsAfterSync = 1;
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  if (self->_scene == a3) { {
    -[FBSceneMonitor _updateSceneSettings:](self, "_updateSceneSettings:", 0, a4);
  }
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  v10 = (FBScene *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_scene == v10
    && [(FBSceneMonitorBehaviors *)self->_effectiveMonitorBehaviors monitorsClientSettings])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sceneMonitor:self sceneClientSettingsDidChangeWithDiff:v11 transitionContext:v13];
  }
  else
  {
    externalSceneIDs = self->_externalSceneIDs;
    v16 = [(FBScene *)v10 identifier];
    LODWORD(externalSceneIDs) = [(NSMutableSet *)externalSceneIDs containsObject:v16];

    if (externalSceneIDs)
    {
      diffInspector = self->_diffInspector;
      if (!diffInspector)
      {
        objc_initWeak(&location, self);
        v18 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F62A40]);
        v19 = self->_diffInspector;
        self->_diffInspector = v18;

        v20 = self->_diffInspector;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
        v24[3] = &unk_1E5C49E58;
        objc_copyWeak(&v25, &location);
        [(FBSSceneClientSettingsDiffInspector *)v20 observePreferredSceneHostIdentifierWithBlock:v24];
        v21 = self->_diffInspector;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
        v22[3] = &unk_1E5C49E58;
        objc_copyWeak(&v23, &location);
        [(FBSSceneClientSettingsDiffInspector *)v21 observePreferredSceneHostIdentityWithBlock:v22];
        objc_destroyWeak(&v23);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
        diffInspector = self->_diffInspector;
      }
      [(FBSSceneClientSettingsDiffInspector *)diffInspector inspectDiff:v11 withContext:0];
    }
  }
}

- (void)_updateExternalScenes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_isSynchronizing || a3)
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = [(FBScene *)self->_scene layerManager];
    v7 = [v6 layers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) { {
            objc_enumerationMutation(v7);
          }
          }
          id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [v12 externalSceneID];

          if (v13)
          {
            v14 = [v12 externalSceneID];
            [v5 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    if (([v5 isEqualToSet:self->_externalSceneIDs] & 1) == 0)
    {
      externalSceneIDs = self->_externalSceneIDs;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__FBSceneMonitor__updateExternalScenes___block_invoke;
      v18[3] = &unk_1E5C49E08;
      v18[4] = self;
      [(NSMutableSet *)externalSceneIDs enumerateObjectsUsingBlock:v18];
      [(NSMutableSet *)self->_externalSceneIDs removeAllObjects];
      [(NSMutableSet *)self->_externalSceneIDs unionSet:v5];
      v16 = self->_externalSceneIDs;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __40__FBSceneMonitor__updateExternalScenes___block_invoke_2;
      v17[3] = &unk_1E5C49E08;
      v17[4] = self;
      [(NSMutableSet *)v16 enumerateObjectsUsingBlock:v17];
    }
    [(FBSceneMonitor *)self _updateScenePairingState:v3];
  }
  else
  {
    self->_updateExternalScenesAfterSync = 1;
  }
}

- (void)_updateScenePairingState:(BOOL)a3
{
  if (!self->_isSynchronizing || a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
    externalSceneIDs = self->_externalSceneIDs;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __43__FBSceneMonitor__updateScenePairingState___block_invoke;
    id v12 = &unk_1E5C49E30;
    id v13 = self;
    id v6 = v4;
    id v14 = v6;
    [(NSMutableSet *)externalSceneIDs enumerateObjectsUsingBlock:&v9];
    if ([(FBSceneMonitorBehaviors *)self->_effectiveMonitorBehaviors monitorsPairingStatus]&& ([(NSMutableSet *)self->_pairedExternalSceneIDs isEqualToSet:v6] & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F1CA80] setWithSet:self->_pairedExternalSceneIDs];
      [v7 unionSet:v6];
    }
    else
    {
      v7 = 0;
    }
    [(NSMutableSet *)self->_pairedExternalSceneIDs removeAllObjects];
    [(NSMutableSet *)self->_pairedExternalSceneIDs unionSet:v6];
    if ([(FBSceneMonitorBehaviors *)self->_effectiveMonitorBehaviors monitorsPairingStatus])
    {
      if ([v7 count])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained sceneMonitor:self pairingStatusDidChangeForExternalSceneIDs:v7];
      }
    }
  }
  else
  {
    self->_updateExternalScenesAfterSync = 1;
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = v6;
  if (self->_scene
    || (sceneID = self->_sceneID,
        [v6 identifier],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        LODWORD(sceneID) = [(NSString *)sceneID isEqualToString:v9],
        v9,
        !sceneID))
  {
    externalSceneIDs = self->_externalSceneIDs;
    id v14 = [v7 identifier];
    LODWORD(externalSceneIDs) = [(NSMutableSet *)externalSceneIDs containsObject:v14];

    if (externalSceneIDs)
    {
      [v7 addObserver:self];
      [(FBSceneMonitor *)self _updateExternalScenes:0];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_scene, a4);
    [v7 addObserver:self];
    uint64_t v10 = [v7 identityToken];
    identityToken = self->_identityToken;
    self->_identityToken = v10;

    [(FBSceneMonitor *)self _updateAllSceneStateIgnoringDelegate];
    id v12 = [(FBSceneMonitor *)self delegate];
    if (objc_opt_respondsToSelector()) { {
      [v12 sceneMonitor:self sceneWasCreated:v7];
    }
    }
  }
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
}

- (FBSceneMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBSceneMonitorDelegate *)WeakRetained;
}

- (BOOL)isPairedWithExternalSceneID:(id)a3
{
  return [(NSMutableSet *)self->_pairedExternalSceneIDs containsObject:a3];
}

- (void)_updateAllSceneStateIgnoringDelegate
{
  if (self->_scene)
  {
    p_delegate = &self->_delegate;
    id obj = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)p_delegate, 0);
    id v4 = [(FBScene *)self->_scene layerManager];
    [v4 addObserver:self];

    [(FBSceneMonitor *)self _updateSceneSettings:1];
    [(FBSceneMonitor *)self _updateExternalScenes:1];
    objc_storeWeak((id *)p_delegate, obj);
  }
}

- (id)_initWithSceneManager:(id)a3 sceneID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = v9;
    v24.receiver = self;
    v24.super_class = (Class)FBSceneMonitor;
    id v11 = [(FBSceneMonitor *)&v24 init];
    id v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_sceneManager, a3);
      uint64_t v13 = [v10 copy];
      sceneID = v12->_sceneID;
      v12->_sceneID = (NSString *)v13;

      id v15 = [(FBSceneManager *)v12->_sceneManager sceneWithIdentifier:v12->_sceneID];
      if ([v15 isValid])
      {
        objc_storeStrong((id *)&v12->_scene, v15);
        [(FBScene *)v12->_scene addObserver:v12];
        uint64_t v16 = [v15 identityToken];
        identityToken = v12->_identityToken;
        v12->_identityToken = (FBSSceneIdentityToken *)v16;
      }
      v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      externalSceneIDs = v12->_externalSceneIDs;
      v12->_externalSceneIDs = v18;

      long long v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      pairedExternalSceneIDs = v12->_pairedExternalSceneIDs;
      v12->_pairedExternalSceneIDs = v20;

      v12->_isSynchronizing = [(FBSceneManager *)v12->_sceneManager _isSynchronizingSceneUpdates];
      [(FBSceneMonitor *)v12 _evaluateEffectiveMonitorBehaviors];
    }
    return v12;
  }
  else
  {
    id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sceneManager"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneMonitor _initWithSceneManager:sceneID:](a2);
    }
    }
    [v23 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSceneMonitor)initWithScene:(id)a3
{
  id v5 = a3;
  if (-[FBScene _isLegacy]((BOOL)v5))
  {
    id v6 = +[FBSceneManager sharedInstance];
    v7 = [v5 identifier];
    id v8 = [(FBSceneMonitor *)self _initWithSceneManager:v6 sceneID:v7];

    return v8;
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"this deprecated class only supports legacy scenes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneMonitor initWithScene:](a2);
    }
    }
    [v10 UTF8String];
    id result = (FBSceneMonitor *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSceneMonitor)initWithSceneID:(id)a3
{
  id v4 = a3;
  id v5 = +[FBSceneManager sharedInstance];
  id v6 = [(FBSceneMonitor *)self _initWithSceneManager:v5 sceneID:v4];

  return v6;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_sceneID withName:@"sceneID"];
  uint64_t v5 = (void *)MEMORY[0x1E4F62810];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [v5 descriptionForObject:WeakRetained];
  id v8 = (id)[v3 appendObject:v7 withName:@"delegate"];

  uint8_t v9 = [v3 build];

  return (NSString *)v9;
}

- (void)invalidate
{
  self->_invalidated = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
  [(FBSSceneClientSettingsDiffInspector *)self->_diffInspector removeAllObservers];
  BOOL v3 = [(FBScene *)self->_scene layerManager];
  [v3 removeObserver:self];

  [(FBSceneManager *)self->_sceneManager removeObserver:self];
  externalSceneIDs = self->_externalSceneIDs;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__FBSceneMonitor_invalidate__block_invoke;
  v5[3] = &unk_1E5C49DE0;
  v5[4] = self;
  [(NSMutableSet *)externalSceneIDs enumerateObjectsUsingBlock:v5];
}

void __28__FBSceneMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) sceneWithIdentifier:a2];
  [v3 removeObserver:*(void *)(a1 + 32)];
}

- (void)setBehaviors:(id)a3
{
  if (self->_givenMonitorBehaviors != a3)
  {
    id v4 = (FBSceneMonitorBehaviors *)[a3 copy];
    givenMonitorBehaviors = self->_givenMonitorBehaviors;
    self->_givenMonitorBehaviors = v4;

    [(FBSceneMonitor *)self _evaluateEffectiveMonitorBehaviors];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    delegateMonitorBehaviors = self->_delegateMonitorBehaviors;
    self->_delegateMonitorBehaviors = 0;

    if (obj)
    {
      uint64_t v6 = objc_alloc_init(FBSceneMonitorBehaviors);
      uint64_t v7 = self->_delegateMonitorBehaviors;
      self->_delegateMonitorBehaviors = v6;

      [(FBSceneMonitorBehaviors *)self->_delegateMonitorBehaviors setMonitorsSettings:objc_opt_respondsToSelector() & 1];
      [(FBSceneMonitorBehaviors *)self->_delegateMonitorBehaviors setMonitorsPairingStatus:objc_opt_respondsToSelector() & 1];
      [(FBSceneMonitorBehaviors *)self->_delegateMonitorBehaviors setMonitorsClientSettings:objc_opt_respondsToSelector() & 1];
      [(FBSceneMonitor *)self _evaluateEffectiveMonitorBehaviors];
      if (!WeakRetained)
      {
        [(FBSceneManager *)self->_sceneManager addObserver:self];
        if (!self->_scene)
        {
          id v8 = [(FBSceneManager *)self->_sceneManager sceneWithIdentifier:self->_sceneID];
          if ([v8 isValid]) { {
            objc_storeStrong((id *)&self->_scene, v8);
          }
          }
        }
        [(FBSceneMonitor *)self _updateAllSceneStateIgnoringDelegate];
      }
    }
    else
    {
      [(FBSceneMonitor *)self _evaluateEffectiveMonitorBehaviors];
    }
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (void)_evaluateEffectiveMonitorBehaviors
{
  givenMonitorBehaviors = self->_givenMonitorBehaviors;
  if (!givenMonitorBehaviors) { {
    givenMonitorBehaviors = self->_delegateMonitorBehaviors;
  }
  }
  [(FBSceneMonitor *)self _setEffectiveMonitorBehaviors:givenMonitorBehaviors];
}

- (void)_setEffectiveMonitorBehaviors:(id)a3
{
  uint64_t v5 = (FBSceneMonitorBehaviors *)a3;
  if (self->_effectiveMonitorBehaviors != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_effectiveMonitorBehaviors, a3);
    [(FBSceneMonitor *)self _updateAllSceneStateIgnoringDelegate];
    uint64_t v5 = v6;
  }
}

void __40__FBSceneMonitor__updateExternalScenes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) sceneWithIdentifier:a2];
  [v3 removeObserver:*(void *)(a1 + 32)];
}

void __40__FBSceneMonitor__updateExternalScenes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) sceneWithIdentifier:a2];
  [v3 addObserver:*(void *)(a1 + 32)];
}

void __43__FBSceneMonitor__updateScenePairingState___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sceneWithIdentifier:");
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 clientSettings];
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v7 = [v5 preferredSceneHostIdentifier];
    if ([v6 isEqualToString:v7])
    {
    }
    else
    {
      id v8 = [v5 preferredSceneHostIdentity];
      int v9 = BSEqualObjects();

      if (!v9)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    [*(id *)(a1 + 40) addObject:v10];
    goto LABEL_6;
  }
LABEL_7:
}

- (id)_effectiveBehaviors
{
  return self->_effectiveMonitorBehaviors;
}

void __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateScenePairingState:0];
}

void __92__FBSceneMonitor_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateScenePairingState:0];
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  if (self->_scene == a4)
  {
    objc_msgSend(a4, "layerManager", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 removeObserver:self];
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v12 = a3;
  uint64_t v6 = (FBScene *)a4;
  uint64_t v7 = v6;
  if (self->_scene == v6)
  {
    [(FBScene *)v6 removeObserver:self];
    id v10 = [(FBSceneMonitor *)self delegate];
    if (objc_opt_respondsToSelector()) { {
      [v10 sceneMonitor:self sceneWasDestroyed:self->_scene];
    }
    }
    scene = self->_scene;
    self->_scene = 0;

    [(FBSceneMonitor *)self _updateExternalScenes:0];
  }
  else
  {
    externalSceneIDs = self->_externalSceneIDs;
    int v9 = [(FBScene *)v6 identifier];
    LODWORD(externalSceneIDs) = [(NSMutableSet *)externalSceneIDs containsObject:v9];

    if (externalSceneIDs)
    {
      [(FBScene *)v7 removeObserver:self];
      [(FBSceneMonitor *)self _updateExternalScenes:0];
    }
  }
}

- (FBScene)scene
{
  return self->_scene;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (FBSSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (FBSceneMonitorBehaviors)behaviors
{
  return self->_givenMonitorBehaviors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

- (void)_initWithSceneManager:(const char *)a1 sceneID:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithScene:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end