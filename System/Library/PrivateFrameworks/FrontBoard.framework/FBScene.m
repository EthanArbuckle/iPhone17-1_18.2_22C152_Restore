@interface FBScene
- (BOOL)_isInTransaction;
- (BOOL)_isLegacy;
- (BOOL)conformsToExtension:(Class)a3;
- (BOOL)executeWhenMutable:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMutable;
- (BOOL)isValid;
- (BOOL)updateWhenMutable:(id)a3;
- (FBProcess)clientProcess;
- (FBSScene)parentScene;
- (FBSSceneClientSettings)clientSettings;
- (FBSSceneDefinition)definition;
- (FBSSceneIdentity)identity;
- (FBSSceneIdentityToken)identityToken;
- (FBSSceneParameters)parameters;
- (FBSSceneSettings)settings;
- (FBSSceneSpecification)specification;
- (FBSceneClientHandle)clientHandle;
- (FBSceneDelegate)delegate;
- (FBSceneLayerManager)layerManager;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)workspaceIdentifier;
- (char)_beginUpdate;
- (char)initWithDefiniton:(void *)a3 remnant:(void *)a4 settings:(void *)a5 initialClientSettings:(void *)a6 clientProvider:(void *)a7 workspace:;
- (char)observerProxies;
- (id)_allComponentProxies;
- (id)_componentProxiesForExtension:(uint64_t)a1;
- (id)_createTransitionContext;
- (id)_verifyIntegrityOfExtensionsInSettings:(void *)a1;
- (id)client;
- (id)componentForExtension:(Class)a3 ofClass:(Class)a4;
- (id)createSnapshot;
- (id)createSnapshotWithContext:(id)a3;
- (id)delegateProxy;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)display;
- (id)loggingIdentifier;
- (id)snapshotContext;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)uiClientSettings;
- (id)uiSettings;
- (int64_t)contentState;
- (int64_t)currentInterfaceOrientation;
- (uint64_t)_activateWithTransitionContext:(void *)a3 error:;
- (uint64_t)_beginTransaction;
- (uint64_t)_endTransaction:(uint64_t)result;
- (unint64_t)_setContentState:(unint64_t)result;
- (unint64_t)_transactionID;
- (void)_addExtensions:(void *)a3 removeExtensions:(void *)a4 settings:;
- (void)_adjustInitialSettings:(uint64_t)a1;
- (void)_applySettingsUpdateWithCompletion:(uint64_t)a1;
- (void)_applyUpdate:(void *)a3 postStateApplicator:(void *)a4 completion:;
- (void)_beginTransaction;
- (void)_beginUpdate;
- (void)_deactivateAndInvalidate:(void *)a3 transitionContext:;
- (void)_deactivateForClientError:(void *)a1;
- (void)_dispatchClientMessageWithBlock:(uint64_t)a1;
- (void)_finalizeSettingsUpdate;
- (void)_joinUpdate:(void *)a3 block:(void *)a4 completion:;
- (void)_objc_initiateDealloc;
- (void)_propagateSettings:(void *)a3 fromSettings:(void *)a4 toSettings:;
- (void)_resetUpdateState;
- (void)activate:(id)a3;
- (void)activateWithTransitionContext:(id)a3;
- (void)activateWithTransitionContext:(id)a3 completion:(id)a4;
- (void)addExtension:(Class)a3;
- (void)addExtensions:(id)a3;
- (void)addObserver:(id)a3;
- (void)clientToken:(id)a3 didInvalidateWithError:(id)a4;
- (void)clientToken:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)clientToken:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6;
- (void)configureParameters:(id)a3;
- (void)deactivate:(id)a3;
- (void)deactivateWithTransitionContext:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidate:(id)a3;
- (void)performUpdate:(id)a3;
- (void)performUpdate:(id)a3 withCompletion:(id)a4;
- (void)removeExtension:(Class)a3;
- (void)removeExtensions:(id)a3;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneWillInvalidate:(id)a3;
- (void)sendActions:(id)a3;
- (void)sendActions:(id)a3 toExtension:(Class)a4;
- (void)setDelegate:(id)a3;
- (void)setParentScene:(id)a3;
- (void)updateSettings:(id)a3;
- (void)updateSettings:(id)a3 withTransitionContext:(id)a4;
- (void)updateSettings:(id)a3 withTransitionContext:(id)a4 completion:(id)a5;
- (void)updateSettingsWithTransitionBlock:(id)a3;
- (void)updateUISettingsWithBlock:(id)a3;
- (void)updateUISettingsWithTransitionBlock:(id)a3;
@end

@implementation FBScene

- (int64_t)contentState
{
  return self->_contentState;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (FBSceneClientHandle)clientHandle
{
  return self->_clientHandle;
}

- (void)_addExtensions:(void *)a3 removeExtensions:(void *)a4 settings:
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v60 = a2;
  id v59 = a3;
  id v73 = a4;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 211))
    {
      v58 = [NSString stringWithFormat:@"components cannot mutate extensions during init"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _addExtensions:removeExtensions:settings:]();
      }
      }
      [v58 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A62FE320);
    }
    uint64_t v72 = a1;
    *(unsigned char *)(a1 + 211) = 1;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = v60;
    uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v64)
    {
      id v62 = *(id *)v91;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(id *)v91 != v62) { {
            objc_enumerationMutation(obj);
          }
          }
          uint64_t v66 = v7;
          v8 = *(objc_class **)(*((void *)&v90 + 1) + 8 * v7);
          v9 = FBLogScene();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v36 = [*(id *)(v72 + 112) identity];
            *(_DWORD *)buf = 138412546;
            v99 = v36;
            __int16 v100 = 2112;
            v101 = v8;
            _os_log_debug_impl(&dword_1A62FC000, v9, OS_LOG_TYPE_DEBUG, "[%@] Adding extension: \"%@\"", buf, 0x16u);
          }
          v10 = (void *)[objc_alloc(MEMORY[0x1E4F62910]) initWithScene:v72 extension:v8];
          v11 = [MEMORY[0x1E4F1CA48] array];
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          v68 = v8;
          v12 = [(objc_class *)v8 hostComponents];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v86 objects:v97 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v87;
            v71 = v11;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v87 != v15) { {
                  objc_enumerationMutation(v12);
                }
                }
                id v17 = objc_alloc(*(Class *)(*((void *)&v86 + 1) + 8 * i));
                if (objc_opt_respondsToSelector()) { {
                  uint64_t v18 = [v17 initWithScene:v10];
                }
                }
                else {
                  uint64_t v18 = [v17 init];
                }
                v19 = (void *)v18;
                if (v18)
                {
                  v20 = FBLogScene();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    v22 = [*(id *)(v72 + 112) identity];
                    v23 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v19];
                    *(_DWORD *)buf = 138412546;
                    v99 = v22;
                    __int16 v100 = 2112;
                    v101 = v23;
                    _os_log_debug_impl(&dword_1A62FC000, v20, OS_LOG_TYPE_DEBUG, "[%@] Instantiated component: \"%@\"", buf, 0x16u);

                    v11 = v71;
                  }

                  v21 = -[FBSceneObserver initWithComponent:]([FBSceneObserver alloc], v19);
                  [v11 addObject:v21];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v86 objects:v97 count:16];
            }
            while (v14);
          }

          v24 = *(void **)(v72 + 136);
          if (!v24)
          {
            uint64_t v25 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
            v26 = *(void **)(v72 + 136);
            *(void *)(v72 + 136) = v25;

            uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
            v28 = *(void **)(v72 + 144);
            *(void *)(v72 + 144) = v27;

            v24 = *(void **)(v72 + 136);
          }
          v29 = [v24 objectForKey:v68];

          if (v29)
          {
            v55 = NSString;
            v56 = NSStringFromClass(v68);
            v57 = [v55 stringWithFormat:@"shouldn't have existing components for new extension %@", v56];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
              -[FBScene _addExtensions:removeExtensions:settings:]();
            }
            }
            [v57 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A62FE2C8);
          }
          [*(id *)(v72 + 136) setObject:v11 forKey:v68];
          [*(id *)(v72 + 144) addObjectsFromArray:v11];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v30 = v11;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v82 objects:v96 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v83;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v83 != v33) { {
                  objc_enumerationMutation(v30);
                }
                }
                v35 = -[FBSceneObserver component](*(void *)(*((void *)&v82 + 1) + 8 * j));
                if (objc_opt_respondsToSelector()) { {
                  [v35 setScene:v10];
                }
                }
                if (objc_opt_respondsToSelector()) { {
                  [v35 configureInitialSettings:v73];
                }
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v82 objects:v96 count:16];
            }
            while (v32);
          }

          uint64_t v7 = v66 + 1;
        }
        while (v66 + 1 != v64);
        uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      }
      while (v64);
    }

    v37 = (id *)v72;
    *(unsigned char *)(v72 + 211) = 0;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v63 = v59;
    uint64_t v67 = [v63 countByEnumeratingWithState:&v78 objects:v95 count:16];
    if (v67)
    {
      uint64_t v65 = *(void *)v79;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v79 != v65) { {
            objc_enumerationMutation(v63);
          }
          }
          uint64_t v70 = v38;
          v39 = *(objc_class **)(*((void *)&v78 + 1) + 8 * v38);
          v40 = FBLogScene();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v53 = [v37 loggingIdentifier];
            NSStringFromClass(v39);
            v54 = (objc_class *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v99 = v53;
            __int16 v100 = 2112;
            v101 = v54;
            _os_log_debug_impl(&dword_1A62FC000, v40, OS_LOG_TYPE_DEBUG, "[%@] Removing extension: \"%@\"", buf, 0x16u);
          }
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          v69 = v39;
          v41 = [v37[17] objectForKey:v39];
          uint64_t v42 = [v41 countByEnumeratingWithState:&v74 objects:v94 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v75;
            do
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v75 != v44) { {
                  objc_enumerationMutation(v41);
                }
                }
                uint64_t v46 = *(void *)(*((void *)&v74 + 1) + 8 * k);
                v47 = -[FBSceneObserver component](v46);
                if (objc_opt_respondsToSelector()) { {
                  [v47 componentWillInvalidate:v73];
                }
                }
                if (objc_opt_respondsToSelector()) { {
                  [v47 invalidate];
                }
                }
                [v37[18] removeObjectIdenticalTo:v46];
                v48 = FBLogScene();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                {
                  v49 = [v37 loggingIdentifier];
                  v50 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v47];
                  *(_DWORD *)buf = 138412546;
                  v99 = v49;
                  __int16 v100 = 2112;
                  v101 = v50;
                  _os_log_debug_impl(&dword_1A62FC000, v48, OS_LOG_TYPE_DEBUG, "[%@] Invalidated component: \"%@\"", buf, 0x16u);

                  v37 = (id *)v72;
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v74 objects:v94 count:16];
            }
            while (v43);
          }

          [v37[17] removeObjectForKey:v69];
          if (![v37[17] count])
          {
            id v51 = v37[17];
            v37[17] = 0;

            id v52 = v37[18];
            v37[18] = 0;
          }
          uint64_t v38 = v70 + 1;
        }
        while (v70 + 1 != v67);
        uint64_t v67 = [v63 countByEnumeratingWithState:&v78 objects:v95 count:16];
      }
      while (v67);
    }
  }
}

- (id)_allComponentProxies
{
  v1 = a1;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _allComponentProxies]");
    }
    }
    uint64_t v2 = [v1[18] copy];
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x1E4F1CBF0];
    if (v2) { {
      v4 = (void *)v2;
    }
    }
    v1 = v4;
  }

  return v1;
}

- (id)delegateProxy
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __28__FBScene__setContentState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneContentStateDidChange:*(void *)(a1 + 32)];
}

- (char)observerProxies
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene observerProxies]");
    }
    }
    uint64_t v2 = (os_unfair_lock_s *)(v1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)v1 + 2);
    v3 = [*((id *)v1 + 4) array];
    uint64_t v1 = (char *)[v3 copy];

    os_unfair_lock_unlock(v2);
  }

  return v1;
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5 && (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))) { {
    objc_msgSend(v5, "workspace:didAddScene:", *(void *)(*(void *)(a1 + 32) + 232));
  }
  }
  if (v7 && !*(unsigned char *)(a1 + 40)) { {
    [v7 sceneWillActivate:*(void *)(a1 + 32)];
  }
  }
}

- (void)addObserver:(id)a3
{
  v6 = (const char *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene addObserver:]");
  }
  }
  v4 = (char *)v6;
  if (v6)
  {
    id v5 = -[FBSceneObserver initWithObserver:]([FBSceneObserver alloc], v6);
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableOrderedSet *)self->_lock_observerProxies addObject:v5];
    os_unfair_lock_unlock(&self->_lock);

    v4 = (char *)v6;
  }
}

- (FBSceneLayerManager)layerManager
{
  return self->_layerManager;
}

void __74__FBScene_clientToken_didUpdateClientSettings_withDiff_transitionContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 48))
  {
    v12 = (char *)objc_opt_new();
    objc_storeStrong((id *)&v12[*MEMORY[0x1E4F62B80]], *(id *)(*(void *)(a1 + 40) + 104));
    v6 = (void *)[*(id *)(a1 + 48) copy];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 104);
    *(void *)(v7 + 104) = v6;

    objc_storeStrong((id *)&v12[*MEMORY[0x1E4F62B88]], v6);
    objc_storeStrong((id *)&v12[*MEMORY[0x1E4F62B68]], *(id *)(a1 + 56));
    objc_storeStrong((id *)&v12[*MEMORY[0x1E4F62B60]], *(id *)(a1 + 64));
    if ([*(id *)(a1 + 56) containsProperty:sel_layers])
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = *(void **)(v9 + 16);
      v11 = [*(id *)(v9 + 104) layers];
      [v10 _setLayers:v11];
    }
    [*(id *)(*(void *)(a1 + 40) + 232) scene:*(void *)(a1 + 40) didUpdateClientSettings:v12];
  }
  else
  {
    uint64_t v2 = FBLogScene();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(a1 + 40) loggingIdentifier];
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v3;
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1A62FC000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring scene client update due to token mismatch (probably due to prior deactivation). expected=%p received=%p", buf, 0x20u);
    }
  }
}

- (BOOL)isActive
{
  return self->_active || self->_updateShouldActivate;
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a1 + 64)) { {
    BOOL v6 = 1;
  }
  }
  else {
    BOOL v6 = a2 == 0;
  }
  if (v6)
  {
    id v12 = v5;
    if (a2)
    {
      uint64_t v7 = 0;
    }
    else
    {
      if (*(void *)(a1 + 40)) { {
        v8 = *(void **)(a1 + 40);
      }
      }
      else {
        v8 = v5;
      }
      uint64_t v7 = FBSceneErrorCreate(1uLL, @"Scene activation failed.", v8);
      -[FBScene _deactivateForClientError:](*(void **)(a1 + 32), v7);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) { {
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, a2, v7);
    }
    }
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activated || !success"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __52__FBScene_activateWithTransitionContext_completion___block_invoke_5_cold_1(a1);
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (FBProcess)clientProcess
{
  if (self->_legacy) { {
    uint64_t v2 = self->_clientProcess;
  }
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
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
  v9.super_class = (Class)FBScene;
  BOOL v7 = [(FBScene *)&v9 isEqual:v5];

  return v7;
}

- (int64_t)currentInterfaceOrientation
{
  v3 = [(FBScene *)self settings];
  uint64_t v4 = [v3 _uiApplicationSceneSettingsShim];

  id v5 = [(FBScene *)self clientSettings];
  uint64_t v6 = [v5 _uiApplicationSceneClientSettingsShim];

  if (!v4 || !v6)
  {
    if (!v4)
    {
      int64_t v7 = 0;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (![v4 deviceOrientationEventsEnabled]
    || (int64_t v7 = [v6 interfaceOrientation]) == 0)
  {
LABEL_7:
    int64_t v7 = [v4 interfaceOrientation];
  }
LABEL_9:

  return v7;
}

void __35__FBScene_scene_didUpdateSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 209))
  {
    int64_t v7 = [v5 _allSceneExtensions];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v8 = objc_msgSend(*(id *)(a1 + 40), "settings", 0);
    objc_super v9 = [v8 _allSceneExtensions];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) { {
            objc_enumerationMutation(v9);
          }
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (([v7 containsObject:v14] & 1) == 0
            && [v14 propagateToSceneWithDefinition:*(void *)(*(void *)(a1 + 32) + 112)])
          {
            [v5 _addSceneExtension:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v11);
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    int v15 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 203);
    uint64_t v16 = FBLogScene();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (!v17) { {
        goto LABEL_20;
      }
      }
      uint64_t v18 = [*(id *)(a1 + 32) loggingIdentifier];
      uint64_t v19 = [*(id *)(a1 + 48) count];
      v20 = [*(id *)(a1 + 40) loggingIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v18;
      __int16 v33 = 2048;
      uint64_t v34 = v19;
      __int16 v35 = 2114;
      v36 = v20;
      v21 = "[%{public}@] propagating %lu settings from %{public}@";
    }
    else
    {
      if (!v17) { {
        goto LABEL_20;
      }
      }
      uint64_t v18 = [*(id *)(a1 + 32) loggingIdentifier];
      uint64_t v22 = [*(id *)(a1 + 48) count];
      v20 = [*(id *)(a1 + 40) loggingIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v18;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      __int16 v35 = 2114;
      v36 = v20;
      v21 = "[%{public}@ (inactive)] propagating %lu settings from %{public}@";
    }
    _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 0x20u);

LABEL_20:
    -[FBScene _propagateSettings:fromSettings:toSettings:](*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), v5);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 203))
    {
      v23 = (int *)MEMORY[0x1E4F62B60];
      v24 = [*(id *)(*(void *)(a1 + 64) + (int)*MEMORY[0x1E4F62B60]) animationSettings];
      [v6 setAnimationSettings:v24];

      uint64_t v25 = [*(id *)(*(void *)(a1 + 64) + *v23) animationFence];
      v26 = (void *)[v25 copy];
      [v6 setAnimationFence:v26];
    }
  }
  [v6 setParentUpdate:*(void *)(a1 + 64)];
}

- (void)_joinUpdate:(void *)a3 block:(void *)a4 completion:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  int64_t v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _joinUpdate:block:completion:]");
    }
    }
    if (*(unsigned char *)(a1 + 203)) { {
      BOOL v9 = 1;
    }
    }
    else {
      BOOL v9 = *(unsigned char *)(a1 + 210) != 0;
    }
    if (*(unsigned __int8 *)(a1 + 200) >= 0x10u)
    {
      v58 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_updateDepth < 16"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _joinUpdate:block:completion:]();
      }
      }
      [v58 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6302590);
    }
    if (!v9 && a2)
    {
      if (!*(unsigned char *)(a1 + 208))
      {
        id v60 = [NSString stringWithFormat:@"cannot activate a scene during init"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene _joinUpdate:block:completion:]();
        }
        }
        [v60 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6302640);
      }
      if (*(unsigned char *)(a1 + 211))
      {
        v61 = [NSString stringWithFormat:@"cannot activate a scene during component init"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene _joinUpdate:block:completion:].cold.4();
        }
        }
        [v61 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6302698);
      }
    }
    if (*(unsigned char *)(a1 + 212))
    {
      id v59 = [NSString stringWithFormat:@"re-entrant mutation during configureParameters is not supported"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _joinUpdate:block:completion:]();
      }
      }
      [v59 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63025E8);
    }
    uint64_t v10 = (char *)*(id *)(a1 + 160);
    if (!v10)
    {
      -[FBScene _beginUpdate](a1);
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    }
    int v11 = v9 | a2;
    uint64_t v12 = (int *)MEMORY[0x1E4F62B60];
    if (v11 == 1 && !*(void *)(*(void *)(a1 + 160) + (int)*MEMORY[0x1E4F62B60]))
    {
      uint64_t v13 = [(id)a1 _createTransitionContext];
      uint64_t v14 = *v12;
      int v15 = *(void **)&v10[v14];
      *(void *)&v10[v14] = v13;
    }
    if (v8)
    {
      if (*(void *)(a1 + 168))
      {
        uint64_t v16 = (void *)MEMORY[0x1AD0B8C50]();
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __40__FBScene__joinUpdate_block_completion___block_invoke;
        v68[3] = &unk_1E5C4B968;
        id v69 = v8;
        id v70 = v16;
        id v17 = v16;
        uint64_t v18 = MEMORY[0x1AD0B8C50](v68);
        uint64_t v19 = *(void **)(a1 + 168);
        *(void *)(a1 + 168) = v18;
      }
      else
      {
        uint64_t v20 = [v8 copy];
        v21 = *(void **)(a1 + 168);
        *(void *)(a1 + 168) = v20;
      }
    }
    char v22 = *(unsigned char *)(a1 + 200);
    *(unsigned char *)(a1 + 200) = v22 + 1;
    if (v7)
    {
      v23 = (int *)MEMORY[0x1E4F62B78];
      id v24 = *(id *)&v10[*MEMORY[0x1E4F62B78]];
      uint64_t v25 = (int *)MEMORY[0x1E4F62B88];
      if (!v24)
      {
        id v24 = (id)[*(id *)&v10[*MEMORY[0x1E4F62B88]] mutableCopy];
        objc_storeStrong((id *)&v10[*v23], v24);
      }
      v7[2](v7, v24, *(void *)&v10[*v12]);
      id v26 = *(id *)&v10[*v25];
      if (([v26 isEqual:v24] & 1) == 0)
      {
        uint64_t v27 = [v24 copy];
        uint64_t v28 = *v25;
        long long v29 = *(void **)&v10[v28];
        *(void *)&v10[v28] = v27;

        long long v30 = [v26 _allSceneExtensions];
        uint64_t v66 = [v24 _allSceneExtensions];
        if (([v66 isEqualToOrderedSet:v30] & 1) == 0)
        {
          uint64_t v31 = (void *)[v66 mutableCopy];
          [v31 minusOrderedSet:v30];
          uint64_t v32 = (void *)[v30 mutableCopy];
          [v32 minusOrderedSet:v66];
          -[FBScene _addExtensions:removeExtensions:settings:](a1, v31, v32, v24);
          if (([*(id *)&v10[*MEMORY[0x1E4F62B88]] isEqual:v24] & 1) == 0)
          {
            uint64_t v33 = [v24 copy];
            uint64_t v34 = (int)*MEMORY[0x1E4F62B88];
            __int16 v35 = *(void **)&v10[v34];
            *(void *)&v10[v34] = v33;
          }
        }
        id v65 = v8;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 152));
        if (WeakRetained)
        {
          v37 = [v26 propagatedSettings];
          [v24 propagatedSettings];
          uint64_t v38 = v64 = v30;
          char v39 = [v37 isEqualToSet:v38];

          long long v30 = v64;
          if ((v39 & 1) == 0)
          {
            id v63 = WeakRetained;
            v40 = [WeakRetained settings];
            v41 = [v10 settings];
            uint64_t v42 = [v41 _propagatedSettings];
            uint64_t v43 = (void *)[v42 mutableCopy];

            uint64_t v44 = [v10 previousSettings];
            v45 = [v44 _propagatedSettings];
            [v43 minusSet:v45];

            uint64_t v46 = [MEMORY[0x1E4F62AE0] diffFromSettings:0 toSettings:v40];
            v47 = [v46 _changedSettings];
            [v43 intersectSet:v47];

            v48 = v43;
            if ([v43 count])
            {
              -[FBScene _propagateSettings:fromSettings:toSettings:]((void *)a1, v43, v40, v24);
              if (([*(id *)&v10[*MEMORY[0x1E4F62B88]] isEqual:v24] & 1) == 0)
              {
                v49 = FBLogScene();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  [(id)a1 loggingIdentifier];
                  id v62 = v40;
                  v56 = v55 = v48;
                  v57 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v10[*MEMORY[0x1E4F62B88]] toSettings:v24];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v72 = v56;
                  __int16 v73 = 2112;
                  long long v74 = v57;
                  _os_log_debug_impl(&dword_1A62FC000, v49, OS_LOG_TYPE_DEBUG, "[%@] propagation mutated settings: %@", buf, 0x16u);

                  v48 = v55;
                  v40 = v62;
                }

                uint64_t v50 = [v24 copy];
                uint64_t v51 = (int)*MEMORY[0x1E4F62B88];
                id v52 = *(void **)&v10[v51];
                *(void *)&v10[v51] = v50;
              }
            }

            id WeakRetained = v63;
            long long v30 = v64;
          }
        }

        id v8 = v65;
      }

      char v22 = *(unsigned char *)(a1 + 200) - 1;
    }
    *(unsigned char *)(a1 + 200) = v22;
    BOOL v53 = (v11 & 1) != 0 || *(unsigned char *)(a1 + 210) != 0;
    *(unsigned char *)(a1 + 210) = v53;
    if (!v22 && !*(unsigned char *)(a1 + 213))
    {
      *(unsigned char *)(a1 + 213) = 1;
      if (*(unsigned char *)(a1 + 214))
      {
        uint64_t v54 = *(void *)(a1 + 232);
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __40__FBScene__joinUpdate_block_completion___block_invoke_202;
        v67[3] = &unk_1E5C49AE0;
        v67[4] = a1;
        -[FBSceneWorkspace _executeWhenIdle:](v54, (uint64_t)v67);
      }
      else
      {
        -[FBScene _finalizeSettingsUpdate](a1);
      }
    }
  }
}

- (void)_finalizeSettingsUpdate
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 210) || *(unsigned char *)(a1 + 203) || *(unsigned char *)(a1 + 202) || *(unsigned char *)(a1 + 205))
    {
      uint64_t v2 = *(void **)(a1 + 168);
      -[FBScene _applySettingsUpdateWithCompletion:](a1, v2);
    }
    else
    {
      v3 = (int *)MEMORY[0x1E4F62B60];
      uint64_t v4 = *(void *)(a1 + 168);
      id v5 = *(id *)(*(void *)(a1 + 160) + (int)*MEMORY[0x1E4F62B60]);
      id v9 = (id)MEMORY[0x1AD0B8C50](v4);
      uint64_t v6 = *(void *)(a1 + 160);
      uint64_t v7 = *v3;
      id v8 = *(void **)(v6 + v7);
      *(void *)(v6 + v7) = 0;

      -[FBScene _applySettingsUpdateWithCompletion:](a1, 0);
      [(id)a1 activateWithTransitionContext:v5 completion:v9];
    }
  }
}

- (char)_beginUpdate
{
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _beginUpdate]");
    }
    }
    if (*(unsigned char *)(a1 + 207))
    {
      id v9 = [NSString stringWithFormat:@"cannot re-entrantly begin a new scene update"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _beginUpdate]();
      }
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63028ECLL);
    }
    if (*(void *)(a1 + 160))
    {
      uint64_t v10 = [NSString stringWithFormat:@"cannot begin a new update while one is ongoing"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _beginUpdate]();
      }
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6302944);
    }
    if (*(unsigned char *)(a1 + 204))
    {
      int v11 = [NSString stringWithFormat:@"cannot update a deactivating scene"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _beginUpdate]();
      }
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A630299CLL);
    }
    *(unsigned char *)(a1 + 207) = 1;
    uint64_t v2 = *(void *)(a1 + 184);
    v3 = objc_opt_new();
    uint64_t v4 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v3;

    id v5 = v3;
    uint64_t v6 = (int *)MEMORY[0x1E4F62B88];
    objc_storeStrong((id *)&v5[*MEMORY[0x1E4F62B88]], *(id *)(a1 + 96));
    if (v2) { {
      uint64_t v7 = (id *)&v5[*v6];
    }
    }
    else {
      uint64_t v7 = (id *)(a1 + 128);
    }
    objc_storeStrong((id *)&v5[*MEMORY[0x1E4F62B80]], *v7);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)uiSettings
{
  v3 = [(FBScene *)self settings];
  if (objc_msgSend(v3, "_uikitShimming_isUISubclass"))
  {
    return v3;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"settings is of an unexpected class : %@", v3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene(UIApp) uiSettings](a2);
    }
    }
    [v5 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSceneSettings)settings
{
  settings = [(FBSSceneUpdate *)self->_settingsUpdate settings];
  uint64_t v4 = settings;
  if (!settings) { {
    settings = self->_settings;
  }
  }
  id v5 = settings;

  return v5;
}

- (id)uiClientSettings
{
  v3 = [(FBScene *)self clientSettings];
  if (objc_msgSend(v3, "_uikitShimming_isUISubclass"))
  {
    return v3;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"clientSettings is of an unexpected class : %@", v3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene(UIApp) uiClientSettings](a2);
    }
    }
    [v5 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (FBSSceneClientSettings)clientSettings
{
  return self->_clientSettings;
}

- (BOOL)_isLegacy
{
  if (result) { {
    return *(unsigned char *)(result + 202) != 0;
  }
  }
  return result;
}

- (id)loggingIdentifier
{
  uint64_t v2 = [(FBScene *)self identity];
  v3 = [v2 description];

  return v3;
}

- (FBSSceneIdentity)identity
{
  return (FBSSceneIdentity *)[(FBSSceneDefinition *)self->_definition identity];
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (void)_applySettingsUpdateWithCompletion:(uint64_t)a1
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _applySettingsUpdateWithCompletion:]");
    }
    }
    if (*(unsigned char *)(a1 + 214))
    {
      uint64_t v46 = NSString;
      v47 = [(id)a1 loggingIdentifier];
      v48 = [v46 stringWithFormat:@"re-entrant scene mutation is not supported (%@)", v47];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _applySettingsUpdateWithCompletion:]2();
      }
      }
      [v48 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6303F90);
    }
    if (!*(unsigned char *)(a1 + 207))
    {
      v49 = [NSString stringWithFormat:@"cannot finish an update when we are not in an update"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _applySettingsUpdateWithCompletion:]();
      }
      }
      [v49 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6303FE8);
    }
    uint64_t v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      uint64_t v50 = [NSString stringWithFormat:@"no active settings update"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _applySettingsUpdateWithCompletion:]();
      }
      }
      [v50 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6304040);
    }
    if (*(unsigned char *)(a1 + 212))
    {
      uint64_t v51 = [NSString stringWithFormat:@"re-entrant mutation during configureParameters is not supported"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _applySettingsUpdateWithCompletion:]1();
      }
      }
      [v51 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6304098);
    }
    if (!*(unsigned char *)(a1 + 213))
    {
      id v52 = [NSString stringWithFormat:@"cannot apply another update while the previous one is pending"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _applySettingsUpdateWithCompletion:]();
      }
      }
      [v52 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63040F0);
    }
    if (!*(unsigned char *)(a1 + 205))
    {
      uint64_t v7 = v4;
      uint64_t v6 = v7;
      if (*(unsigned char *)(a1 + 203))
      {
        if (!*(void *)(a1 + 232))
        {
          BOOL v53 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_workspace != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _applySettingsUpdateWithCompletion:].cold.7();
          }
          }
          [v53 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6304154);
        }
        id v8 = (int *)MEMORY[0x1E4F62B78];
        id v9 = *(void **)&v7[*MEMORY[0x1E4F62B78]];
        uint64_t v10 = *(void **)&v6[*MEMORY[0x1E4F62B88]];
        id v58 = v3;
        if (v9)
        {
          if (([v9 isEqual:v10] & 1) == 0)
          {
            int v11 = [NSString stringWithFormat:@"mutable and non-mutable settings must be equal"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
              -[FBScene _applySettingsUpdateWithCompletion:].cold.9();
            }
            }
            [v11 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A6303B60);
          }
        }
        else
        {
          uint64_t v18 = [v10 mutableCopy];
          uint64_t v19 = *v8;
          uint64_t v20 = *(void **)&v6[v19];
          *(void *)&v6[v19] = v18;
        }
        uint64_t v21 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v6[*MEMORY[0x1E4F62B80]] toSettings:*(void *)&v6[*MEMORY[0x1E4F62B88]]];
        uint64_t v22 = (int)*MEMORY[0x1E4F62B68];
        v23 = *(void **)&v6[v22];
        *(void *)&v6[v22] = v21;

        uint64_t v24 = [*(id *)&v6[*MEMORY[0x1E4F62B60]] parentUpdate];
        uint64_t v25 = (int)*MEMORY[0x1E4F62B70];
        id v26 = *(void **)&v6[v25];
        *(void *)&v6[v25] = v24;

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v27 = -[FBScene _allComponentProxies]((id *)a1);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v63;
          uint64_t v59 = a1;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v63 != v30) { {
                objc_enumerationMutation(v27);
              }
              }
              uint64_t v32 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if (-[FBSceneObserver receiverImplementsWillUpdate]((unint64_t)v32))
              {
                uint64_t v33 = [v6 settings];
                [v32 scene:a1 willUpdateSettings:v6];
                if (([v33 isEqual:*(void *)&v6[*v8]] & 1) == 0)
                {
                  uint64_t v34 = FBLogScene();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    v61 = [(id)a1 loggingIdentifier];
                    uint64_t v42 = (void *)MEMORY[0x1E4F62810];
                    id v60 = -[FBSceneObserver component]((uint64_t)v32);
                    uint64_t v43 = [v42 succinctDescriptionForObject:v60];
                    uint64_t v44 = [MEMORY[0x1E4F62AE0] diffFromSettings:v33 toSettings:*(void *)&v6[*v8]];
                    *(_DWORD *)buf = 138412802;
                    id v69 = v61;
                    __int16 v70 = 2112;
                    v71 = v43;
                    __int16 v72 = 2112;
                    __int16 v73 = v44;
                    _os_log_debug_impl(&dword_1A62FC000, v34, OS_LOG_TYPE_DEBUG, "[%@] component %@ mutated settings: %@", buf, 0x20u);

                    a1 = v59;
                  }

                  uint64_t v35 = [*(id *)&v6[*v8] copy];
                  v36 = (int *)MEMORY[0x1E4F62B88];
                  uint64_t v37 = (int)*MEMORY[0x1E4F62B88];
                  uint64_t v38 = *(void **)&v6[v37];
                  *(void *)&v6[v37] = v35;

                  uint64_t v39 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v6[*MEMORY[0x1E4F62B80]] toSettings:*(void *)&v6[*v36]];
                  uint64_t v40 = (int)*MEMORY[0x1E4F62B68];
                  v41 = *(void **)&v6[v40];
                  *(void *)&v6[v40] = v39;
                }
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v62 objects:v74 count:16];
          }
          while (v29);
        }

        v45 = *(void **)(a1 + 160);
        *(void *)(a1 + 160) = 0;

        id v3 = v58;
        [*(id *)(a1 + 232) scene:a1 handleUpdate:v6 withCompletion:v58];
        if (*(unsigned char *)(a1 + 214))
        {
          uint64_t v54 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_inTransaction == NO"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _applySettingsUpdateWithCompletion:].cold.8();
          }
          }
          [v54 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A63041B8);
        }
      }
      else
      {
        if (*(unsigned char *)(a1 + 208) && *(unsigned char *)(a1 + 202))
        {
          v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_legacy"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _applySettingsUpdateWithCompletion:].cold.6();
          }
          }
          [v57 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A63042E4);
        }
        uint64_t v12 = [*(id *)(a1 + 112) specification];
        uint64_t v13 = [v6 transitionContext];
        int v14 = [v12 _isSignificantTransitionContext:v13];

        if (v14)
        {
          v55 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"![[_definition specification] _isSignificantTransitionContext:[update transitionContext]]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _applySettingsUpdateWithCompletion:].cold.4();
          }
          }
          [v55 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A630421CLL);
        }
        if (v3)
        {
          v56 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion == nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _applySettingsUpdateWithCompletion:].cold.5();
          }
          }
          [v56 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6304280);
        }
        int v15 = [v6 settings];
        uint64_t v16 = [v15 _copyClearingProgenitor:0];
        id v17 = *(void **)(a1 + 96);
        *(void *)(a1 + 96) = v16;

        -[FBScene _resetUpdateState](a1);
      }
      goto LABEL_41;
    }
    -[FBScene _resetUpdateState](a1);
    id v5 = FBLogScene();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
      -[FBScene _applySettingsUpdateWithCompletion:]0((void *)a1);
    }
    }

    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__FBScene__applySettingsUpdateWithCompletion___block_invoke;
      block[3] = &unk_1E5C498D8;
      uint64_t v67 = (char *)v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
      uint64_t v6 = v67;
LABEL_41:
    }
  }
}

- (BOOL)_isInTransaction
{
  return self->_inTransaction;
}

- (uint64_t)_beginTransaction
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 203))
    {
      if (!*(unsigned char *)(result + 214))
      {
        *(unsigned char *)(result + 214) = 1;
        id result = *(void *)(result + 184) + 1;
        *(void *)(v1 + 184) = result;
        return result;
      }
      id v5 = NSString;
      uint64_t v6 = [(id)result loggingIdentifier];
      uint64_t v4 = [v5 stringWithFormat:@"cannot begin a transition while we're already in one (%@)", v6];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _beginTransaction]();
      }
      }
    }
    else
    {
      uint64_t v2 = NSString;
      id v3 = [(id)result loggingIdentifier];
      uint64_t v4 = [v2 stringWithFormat:@"scene is not actually active: %@", v3];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _beginTransaction]();
      }
      }
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6304720);
  }
  return result;
}

- (void)_applyUpdate:(void *)a3 postStateApplicator:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) { {
    goto LABEL_9;
  }
  }
  if (*(unsigned char *)(a1 + 214))
  {
    uint64_t v10 = *(void *)(a1 + 184);
    if (v10)
    {
      int v11 = [v7 settings];
      uint64_t v12 = (void *)[v11 _copyClearingProgenitor:0];

      uint64_t v13 = [v7 settingsDiff];
      int v14 = [v7 transitionContext];
      objc_storeStrong((id *)(a1 + 96), v12);
      int v15 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      *(unsigned char *)(a1 + 207) = 0;
      uint64_t v16 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = 0;

      *(unsigned char *)(a1 + 213) = 0;
      *(unsigned char *)(a1 + 210) = 0;
      id v17 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = 0;

      int v18 = [v12 isForeground];
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      if (v18)
      {
        if (*(void *)(a1 + 224))
        {
LABEL_8:
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke;
          v26[3] = &unk_1E5C4B918;
          v26[4] = a1;
          id v27 = v12;
          id v28 = v13;
          id v29 = v14;
          uint64_t v31 = sel__applyUpdate_postStateApplicator_completion_;
          uint64_t v32 = v10;
          id v30 = v9;
          uint64_t v21 = (void (*)(void *, void *))v8[2];
          id v22 = v14;
          id v23 = v13;
          id v24 = v12;
          v21(v8, v26);

LABEL_9:
          return;
        }
        unint64_t v20 = 1;
        uint64_t v19 = v10;
      }
      *(void *)(a1 + 192) = v19;
      -[FBScene _setContentState:](a1, v20);
      goto LABEL_8;
    }
  }
  uint64_t v25 = [NSString stringWithFormat:@"cannot perform scene update without first beginning a transaction"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBScene _applyUpdate:postStateApplicator:completion:]();
  }
  }
  [v25 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_createTransitionContext
{
  uint64_t v2 = [(FBSSceneDefinition *)self->_definition specification];
  id v3 = objc_msgSend((id)objc_msgSend(v2, "transitionContextClass"), "transitionContext");

  return v3;
}

- (FBSSceneDefinition)definition
{
  return self->_definition;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene scene:didUpdateSettings:]");
  }
  }
  id v7 = objc_msgSend(v6, "settings", v21);
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = [(FBSSceneSettings *)self->_settings _propagatedSettings];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [v6 settingsDiff];
  int v11 = [v10 changedSettings];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) { {
          objc_enumerationMutation(v11);
        }
        }
        uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(v16, "indirect_isPropagating") & 1) != 0
          || [v9 containsObject:v16])
        {
          [v8 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __35__FBScene_scene_didUpdateSettings___block_invoke;
  v23[3] = &unk_1E5C4B8A0;
  v23[4] = self;
  id v24 = v22;
  id v25 = v8;
  id v26 = v7;
  id v27 = v6;
  id v17 = v6;
  id v18 = v7;
  id v19 = v8;
  id v20 = v22;
  -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, v23, 0);
  self->_newlyReparented = 0;
}

void __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(v4, "_uikitShimming_isUISubclass"))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = [NSString stringWithFormat:@"settings is of an unexpected class : %@", v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke_cold_1(a1);
    }
    }
    [v3 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableSettings:a2];
}

- (void)_resetUpdateState
{
  if (a1)
  {
    *(unsigned char *)(a1 + 207) = 0;
    uint64_t v2 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = 0;

    *(unsigned char *)(a1 + 213) = 0;
    *(unsigned char *)(a1 + 210) = 0;
    id v3 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;
  }
}

- (void)_adjustInitialSettings:(uint64_t)a1
{
  id v3 = a2;
  if (!a1)
  {
LABEL_5:

    return;
  }
  if (*(void *)(a1 + 184) == 1)
  {
    if (*(id *)(a1 + 96) != v3)
    {
      id v7 = v3;
      uint64_t v4 = [v3 _copyClearingProgenitor:0];
      id v5 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v4;

      id v3 = v7;
    }
    goto LABEL_5;
  }
  id v6 = [NSString stringWithFormat:@"Initial settings may only be adjusted at create time before any transactions have begun."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBScene _adjustInitialSettings:]();
  }
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (uint64_t)_endTransaction:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 184);
    if (*(unsigned char *)(result + 214)) { {
      BOOL v3 = v2 == a2;
    }
    }
    else {
      BOOL v3 = 0;
    }
    if (v3)
    {
      *(unsigned char *)(result + 214) = 0;
    }
    else
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"ending transactionID %llu does not match active transactionID %llu", a2, v2);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _endTransaction:]();
      }
      }
      [v4 UTF8String];
      id result = _bs_set_crash_log_message();
      __break(0);
    }
  }
  return result;
}

- (void)performUpdate:(id)a3
{
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_168(void *a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_2;
  v9[3] = &unk_1E5C4B8C8;
  char v13 = a2;
  uint64_t v7 = a1[4];
  id v6 = (void *)a1[5];
  uint64_t v12 = a1[6];
  v9[4] = v7;
  id v10 = v5;
  id v11 = v6;
  id v8 = v5;
  -[FBScene _dispatchClientMessageWithBlock:](v7, v9);
}

- (void)_dispatchClientMessageWithBlock:(uint64_t)a1
{
  blocuint64_t k = a2;
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      BOOL v3 = (void *)MEMORY[0x1AD0B8A00]();
      block[2]();
    }
    else
    {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)clientToken:(id)a3 didUpdateClientSettings:(id)a4 withDiff:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__FBScene_clientToken_didUpdateClientSettings_withDiff_transitionContext___block_invoke;
  v18[3] = &unk_1E5C4A470;
  id v19 = v10;
  id v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v18);
}

void __54__FBScene_clientToken_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v2 + 48))
  {
    uint64_t v7 = *(void **)(v2 + 232);
    objc_msgSend(v7, "scene:didReceiveActions:forExtension:");
  }
  else
  {
    BOOL v3 = FBLogScene();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 40) loggingIdentifier];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 48);
      int v8 = 138543874;
      id v9 = v4;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring actions due to token mismatch (probably due to prior deactivation). expected=%p received=%p", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)addExtension:(Class)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene addExtension:]();
    }
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630A408);
  }
  v6[0] = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(FBScene *)self addExtensions:v4];
}

- (id)succinctDescription
{
  uint64_t v2 = [(FBScene *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  workspaceIdentifier = self->_workspaceIdentifier;
  if (workspaceIdentifier
    && ([(FBSceneWorkspace *)self->_workspace identifier],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(NSString *)workspaceIdentifier isEqualToString:v5],
        v5,
        !v6))
  {
    id v9 = NSString;
    __int16 v10 = self->_workspaceIdentifier;
    int v8 = [(FBSceneWorkspace *)self->_workspace identifier];
    [v9 stringWithFormat:@"%@(%@):%@", v10, v8, self->_identifier];
  }
  else
  {
    uint64_t v7 = NSString;
    int v8 = [(FBSceneWorkspace *)self->_workspace identifier];
    [v7 stringWithFormat:@"%@:%@", v8, self->_identifier, v14];
  uint64_t v11 = };
  id v12 = (id)[v3 appendObject:v11 withName:0];

  return v3;
}

- (FBSSceneIdentityToken)identityToken
{
  return self->_identityToken;
}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _removeVolatileSettings];
}

void __25__FBScene_addExtensions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        objc_msgSend(v3, "_addSceneExtension:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1[6])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_3;
    block[3] = &unk_1E5C498D8;
    id v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v7 = v10;
    goto LABEL_5;
  }
  uint64_t v2 = v1[12];
  if (v2 == *(void *)(a1 + 40))
  {
    id v3 = (void *)v1[7];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_168;
    v11[3] = &unk_1E5C4B8F0;
    uint64_t v6 = *(void *)(a1 + 80);
    v11[4] = v1;
    uint64_t v13 = v6;
    id v12 = *(id *)(a1 + 64);
    [v3 host:v1 didUpdateSettings:v2 withDiff:v4 transitionContext:v5 completion:v11];
    uint64_t v7 = v12;
LABEL_5:

    return;
  }
  uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_settings == newSettings"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_cold_1();
  }
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 203)
      && *(void *)(v2 + 192) == *(void *)(a1 + 56)
      && [*(id *)(v2 + 96) isForeground])
    {
      -[FBScene _setContentState:](*(void *)(a1 + 32), 2uLL);
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = FBSceneErrorCreate(1uLL, @"Scene update failed.", *(void **)(a1 + 40));
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) { {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 160) + (int)*MEMORY[0x1E4F62B60]), v7);
  }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!*(void *)(v8 + 184))
  {
    LOBYTE(v9) = *(unsigned char *)(v8 + 202);
    BYTE1(v9) = *(unsigned char *)(a1 + 48);
    objc_msgSend(*(id *)(v8 + 232), "scene:performCalloutsToObservers:", MEMORY[0x1E4F143A8], 3221225472, __52__FBScene_activateWithTransitionContext_completion___block_invoke_4, &unk_1E5C4B7B0, v8, v9);
    if ([v5 isClientFuture])
    {
      [v5 setClientFuture:0];
      [v5 setClientProcess:0];
    }
  }
}

- (unint64_t)_setContentState:(unint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v3 = result;
    id result = *(void *)(result + 224);
    if (result != a2)
    {
      if (!*(void *)(v3 + 232))
      {
        uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_workspace != nil"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene _setContentState:]();
        }
        }
        [v8 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6317F64);
      }
      if (*(unsigned char *)(v3 + 201))
      {
        uint64_t v9 = NSString;
        id v10 = NSStringFromFBSceneContentState(result);
        long long v11 = NSStringFromFBSceneContentState(a2);
        id v12 = [v9 stringWithFormat:@"cannot re-entrantly mutate contentState (%@ --> %@)", v10, v11];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene _setContentState:]();
        }
        }
        [v12 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6317FE8);
      }
      id v4 = FBLogScene();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [(id)v3 loggingIdentifier];
        id v6 = NSStringFromFBSceneContentState(a2);
        *(_DWORD *)buf = 138543618;
        id v15 = v5;
        __int16 v16 = 2114;
        id v17 = v6;
        _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] scene content state changed: %{public}@", buf, 0x16u);
      }
      *(void *)(v3 + 224) = a2;
      *(unsigned char *)(v3 + 201) = 1;
      uint64_t v7 = *(void **)(v3 + 232);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __28__FBScene__setContentState___block_invoke;
      v13[3] = &unk_1E5C4B940;
      v13[4] = v3;
      id result = [v7 scene:v3 performCalloutsToObservers:v13];
      *(unsigned char *)(v3 + 201) = 0;
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (void *)[(NSMutableOrderedSet *)self->_lock_observerProxies copy];
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
        long long v11 = *(id **)(*((void *)&v15 + 1) + 8 * i);
        -[FBSceneObserver observer](v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = v12;
        if (v12) { {
          BOOL v14 = v12 == a3;
        }
        }
        else {
          BOOL v14 = 1;
        }
        if (v14) { {
          [(NSMutableOrderedSet *)self->_lock_observerProxies removeObject:v11];
        }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setParentScene:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene setParentScene:]");
  }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);
  id v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    [WeakRetained removeObserver:self];
    objc_storeWeak((id *)&self->_parentScene, v4);
    [v4 addObserver:self];
    uint64_t v7 = FBLogScene();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v8)
      {
        uint64_t v9 = [(FBScene *)self loggingIdentifier];
        id v10 = [v4 loggingIdentifier];
        int v22 = 138543618;
        id v23 = v9;
        __int16 v24 = 2114;
        id v25 = v10;
        _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting parent scene: %{public}@", (uint8_t *)&v22, 0x16u);
      }
      self->_newlyReparented = 1;
      uint64_t v7 = objc_opt_new();
      uint64_t v11 = [v4 settings];
      id v12 = (int *)MEMORY[0x1E4F62B88];
      uint64_t v13 = (int)*MEMORY[0x1E4F62B88];
      BOOL v14 = *(Class *)((char *)&v7->isa + v13);
      *(Class *)((char *)&v7->isa + v13) = (Class)v11;

      uint64_t v15 = (int)*MEMORY[0x1E4F62B80];
      long long v16 = *(Class *)((char *)&v7->isa + v15);
      *(Class *)((char *)&v7->isa + v15) = 0;

      uint64_t v17 = [MEMORY[0x1E4F62AE0] diffFromSettings:0 toSettings:*(Class *)((char *)&v7->isa + *v12)];
      uint64_t v18 = (int)*MEMORY[0x1E4F62B68];
      id v19 = *(Class *)((char *)&v7->isa + v18);
      *(Class *)((char *)&v7->isa + v18) = (Class)v17;

      [(FBScene *)self scene:v4 didUpdateSettings:v7];
      if (self->_newlyReparented)
      {
        uint64_t v20 = [NSString stringWithFormat:@"reparenting was not completed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene setParentScene:]();
        }
        }
        [v20 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A631BE6CLL);
      }
    }
    else if (v8)
    {
      id v21 = [(FBScene *)self loggingIdentifier];
      int v22 = 138543362;
      id v23 = v21;
      _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing parent scene.", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)_propagateSettings:(void *)a3 fromSettings:(void *)a4 toSettings:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v29 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  long long v28 = a1;
  if (a1)
  {
    if (!v7)
    {
      __int16 v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsToPropagate"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _propagateSettings:fromSettings:toSettings:]();
      }
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A631C7E8);
    }
    if (!v29)
    {
      id v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"parentSettings"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _propagateSettings:fromSettings:toSettings:]();
      }
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A631C84CLL);
    }
    if (!v8)
    {
      uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"mutableSettings"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _propagateSettings:fromSettings:toSettings:]();
      }
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A631C8B0);
    }
    id v10 = [v29 otherSettings];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v7;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) { {
            objc_enumerationMutation(v11);
          }
          }
          long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v17 = FBLogScene();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            int v22 = [v28 loggingIdentifier];
            id v23 = objc_msgSend(v16, "indirect_name");
            *(_DWORD *)buf = 138543618;
            uint64_t v35 = v22;
            __int16 v36 = 2112;
            uint64_t v37 = v23;
            _os_log_debug_impl(&dword_1A62FC000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Propagating %@", buf, 0x16u);
          }
          if (objc_msgSend(v16, "indirect_isLegacy"))
          {
            uint64_t v18 = objc_msgSend(v16, "indirect_legacySetting");
            id v19 = [v10 objectForSetting:v18];
            uint64_t v20 = [v10 flagForSetting:v18];
            id v21 = [v9 otherSettings];
            [v21 setObject:v19 forSetting:v18];
            [v21 setFlag:v20 forSetting:v18];
          }
          else
          {
            id v19 = MEMORY[0x1AD0B8520](v29, v16);
            FBSSettingsSetValueForSetting();
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v13);
    }

    id v7 = v27;
  }
}

- (FBSScene)parentScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScene);

  return (FBSScene *)WeakRetained;
}

- (void)updateSettings:(id)a3 withTransitionContext:(id)a4
{
}

- (void)activateWithTransitionContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_finishedInit)
  {
    long long v28 = [NSString stringWithFormat:@"cannot activate a scene during init"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene activateWithTransitionContext:completion:]();
    }
    }
    goto LABEL_29;
  }
  if (self->_midUpdate)
  {
    id v29 = [NSString stringWithFormat:@"cannot activate a scene mid update"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene activateWithTransitionContext:completion:].cold.4();
    }
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326E20);
  }
  if (self->_deactivating)
  {
    long long v30 = [NSString stringWithFormat:@"cannot activate a scene mid deactivation"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene activateWithTransitionContext:completion:]();
    }
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326E78);
  }
  uint64_t v9 = v8;
  if (self->_legacy)
  {
    if (!self->_legacyActivated)
    {
      self->_legacyActivated = 1;
      goto LABEL_7;
    }
    long long v28 = [NSString stringWithFormat:@"legacy scenes can only ever be activated once"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene activateWithTransitionContext:completion:]();
    }
    }
LABEL_29:
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326DC8);
  }
LABEL_7:
  BOOL active = self->_active;
  remnant = self->_remnant;
  v50[0] = 0;
  char v12 = -[FBScene _activateWithTransitionContext:error:]((uint64_t)self, v7, v50);
  id v13 = v50[0];
  uint64_t v14 = [v7 executionContext];
  uint64_t v15 = [v14 completion];

  if (v15)
  {
    char v31 = v12;
    if (active)
    {
      long long v16 = @"Provided execution context was not used because the scene was already active.";
    }
    else if (self->_invalidated)
    {
      long long v16 = @"Scene was not activated because it had already been invalidated.";
    }
    else
    {
      long long v16 = @"Provided execution context was not used to create a process.";
    }
    long long v32 = a2;
    clientProcess = self->_clientProcess;
    if (clientProcess)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke;
      v46[3] = &unk_1E5C4B760;
      uint64_t v18 = &v49;
      id v19 = (id *)&v47;
      id v49 = v15;
      v47 = v16;
      uint64_t v20 = &v48;
      id v48 = v13;
      [(FBProcess *)clientProcess _executeBlockAfterBootstrap:v46];
    }
    else
    {
      id v21 = +[FBProcess calloutQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_2;
      block[3] = &unk_1E5C4B788;
      uint64_t v18 = &v45;
      id v19 = (id *)&v43;
      id v45 = v15;
      uint64_t v43 = v16;
      uint64_t v20 = &v44;
      id v44 = v13;
      dispatch_async(v21, block);
    }
    a2 = v32;
    char v12 = v31;
  }
  BOOL v22 = remnant != 0;
  layerManager = self->_layerManager;
  __int16 v24 = [(FBSSceneClientSettings *)self->_clientSettings layers];
  [(FBSceneLayerManager *)layerManager _setLayers:v24];

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_3;
  v38[3] = &unk_1E5C4B7D8;
  id v39 = v7;
  uint64_t v40 = self;
  BOOL v41 = v22;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __52__FBScene_activateWithTransitionContext_completion___block_invoke_5;
  v33[3] = &unk_1E5C4B800;
  char v37 = v12;
  v33[4] = self;
  id v34 = v13;
  id v35 = v9;
  SEL v36 = a2;
  id v25 = v9;
  id v26 = v13;
  id v27 = v7;
  [(FBScene *)self performUpdate:v38 withCompletion:v33];
}

- (void)performUpdate:(id)a3 withCompletion:(id)a4
{
}

- (uint64_t)_activateWithTransitionContext:(void *)a3 error:
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) { {
    goto LABEL_8;
  }
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _activateWithTransitionContext:error:]");
  }
  }
  if (*(unsigned char *)(a1 + 203))
  {
    if (a3) { {
      *a3 = 0;
    }
    }
    a1 = 1;
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 205))
  {
    if (a3)
    {
      FBSceneErrorCreate(2uLL, @"Cannot activate an invalidated scene.", 0);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_8;
  }
  if (!*(void *)(a1 + 232))
  {
    long long v76 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_workspace"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:]();
    }
    }
    [v76 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63277E4);
  }
  if (*(void *)(a1 + 216))
  {
    long long v77 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_clientHandle == nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:]0();
    }
    }
    [v77 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6327848);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 202))
  {
    if (v7)
    {
      long long v80 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_client == nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _activateWithTransitionContext:error:].cold.7();
      }
      }
      [v80 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6327968);
    }
    id v11 = [*(id *)(a1 + 112) clientIdentity];
    if ([v11 isLocal])
    {
      char v12 = +[FBProcessManager sharedInstance];
      uint64_t v13 = [v12 currentProcess];
      uint64_t v14 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v13;

      uint64_t v15 = +[FBSceneClientHandle handleForScene:a1 clientProcess:*(void *)(a1 + 64)];
      long long v16 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v15;

      uint64_t v17 = +[FBLocalSynchronousSceneClientProvider sharedInstance];
      uint64_t v18 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v17;

      id v19 = 0;
LABEL_47:

      goto LABEL_48;
    }
    __int16 v24 = *(void **)(a1 + 120);
    if (v24)
    {
      id v25 = [v24 _workspace];
      uint64_t v26 = [v25 process];
      id v27 = (void *)v26;
      if (v25
        && v26
        && ([*(id *)(a1 + 120) _assertion],
            long long v28 = objc_claimAutoreleasedReturnValue(),
            char v29 = [v28 isValid],
            v28,
            (v29 & 1) != 0))
      {
        id v19 = 0;
      }
      else
      {

        FBSceneErrorCreate(1uLL, @"failed to activate scene from remnant", 0);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        id v25 = 0;
        id v27 = 0;
      }
      goto LABEL_46;
    }
    long long v30 = [v11 processIdentity];
    char v31 = [v5 clientProcessHandle];
    if ([*(id *)(a1 + 96) isClientFuture])
    {
      long long v32 = [*(id *)(a1 + 96) clientProcess];
      long long v33 = [v32 handle];

      if (v33)
      {
        if (v31 && ([v31 isEqual:v33] & 1) == 0)
        {
          long long v74 = [NSString stringWithFormat:@"a client future can only activate for the process that requested it"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _activateWithTransitionContext:error:].cold.6();
          }
          }
LABEL_100:
          [v74 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A63276F0);
        }
        id v34 = v33;

        char v31 = v34;
      }
    }
    if (v31)
    {
      id v35 = [v31 identity];
      char v36 = [v35 isEqual:v30];

      if ((v36 & 1) == 0)
      {
        long long v81 = [NSString stringWithFormat:@"Client process identity does not match provided handle's identity"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene _activateWithTransitionContext:error:].cold.5();
        }
        }
        [v81 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A63279C0);
      }
      char v37 = +[FBProcessManager sharedInstance];
      id v89 = 0;
      id v27 = [v37 _createProcessFutureForProcessHandle:v31 error:&v89];
      id v19 = v89;

LABEL_40:
      if (v27)
      {
        id v25 = [v27 workspace];

        id v19 = 0;
LABEL_45:

LABEL_46:
        uint64_t v38 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v27;
        id v39 = v27;

        uint64_t v40 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v25;

        goto LABEL_47;
      }
LABEL_44:
      id v25 = 0;
      goto LABEL_45;
    }
    if ([*(id *)(a1 + 96) isClientFuture])
    {
      FBSceneErrorCreate(3uLL, @"client futures must be activated with a specific client process", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = 0;
      goto LABEL_44;
    }
    long long v64 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
    int v65 = [v64 isEqual:v30];

    if (v65)
    {
      uint64_t v66 = +[FBProcessManager sharedInstance];
      id v27 = [v66 currentProcess];

      uint64_t v67 = +[FBSceneClientHandle handleForScene:a1 clientProcess:v27];
      v68 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v67;

      id v19 = 0;
      goto LABEL_40;
    }
    id v69 = [v5 executionContext];
    __int16 v70 = (FBMutableProcessExecutionContext *)[v69 mutableCopy];

    if (v70)
    {
      v71 = [(FBProcessExecutionContext *)v70 identity];

      if (v71)
      {
        __int16 v72 = [(FBProcessExecutionContext *)v70 identity];
        char v73 = [v72 isEqual:v30];

        if ((v73 & 1) == 0)
        {
          long long v74 = [NSString stringWithFormat:@"Client process identity does not match execution context identity"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene _activateWithTransitionContext:error:].cold.4();
          }
          }
          goto LABEL_100;
        }
      }
      else
      {
        [(FBProcessExecutionContext *)v70 setIdentity:v30];
      }
    }
    else
    {
      __int16 v70 = [(FBProcessExecutionContext *)[FBMutableProcessExecutionContext alloc] initWithIdentity:v30];
    }
    id v82 = [(FBProcessExecutionContext *)v70 copyOrUpdateForSceneActivationWithSettings:*(void *)(a1 + 96)];

    uint64_t v75 = +[FBProcessManager sharedInstance];
    id v88 = 0;
    id v27 = [v75 _createProcessFutureWithExecutionContext:v82 error:&v88];
    id v19 = v88;

    [v5 setExecutionContext:0];
    goto LABEL_40;
  }
  if (!v7)
  {
    long long v78 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_client != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:].cold.8();
    }
    }
    [v78 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63278ACLL);
  }
  id v8 = [v5 clientProcessHandle];

  if (v8)
  {
    long long v79 = [NSString stringWithFormat:@"legacy scenes do not support targeting clients by PID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:].cold.9();
    }
    }
    [v79 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6327904);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [*(id *)(a1 + 56) process];
    id v10 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v9;
  }
  else
  {
    id v10 = +[FBProcessManager sharedInstance];
    uint64_t v20 = [v10 currentProcess];
    id v21 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v20;
  }
  uint64_t v22 = +[FBSceneClientHandle handleForScene:a1 clientProcess:*(void *)(a1 + 64)];
  id v23 = *(void **)(a1 + 216);
  *(void *)(a1 + 216) = v22;

  id v19 = 0;
LABEL_48:
  BOOL v41 = [v5 executionContext];

  if (v41)
  {
    uint64_t v42 = FBLogScene();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:]((void *)a1);
    }
    }
  }
  uint64_t v43 = [*(id *)(a1 + 104) copy:&__block_literal_global_246];
  id v44 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = v43;

  id v45 = *(void **)(a1 + 56);
  if (!v45)
  {
    BOOL v53 = FBLogScene();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) { {
      -[FBScene _activateWithTransitionContext:error:]((void *)a1, v19, v53);
    }
    }
    id v50 = v19;
    goto LABEL_60;
  }
  uint64_t v46 = *(void *)(a1 + 96);
  uint64_t v47 = *(void *)(a1 + 104);
  uint64_t v48 = *(void *)(a1 + 120);
  id v87 = 0;
  uint64_t v49 = [v45 registerHost:a1 settings:v46 initialClientSettings:v47 fromRemnant:v48 error:&v87];
  id v50 = v87;

  uint64_t v51 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v49;

  if (!*(void *)(a1 + 48))
  {
    BOOL v53 = FBLogScene();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v61 = [(id)a1 loggingIdentifier];
      uint64_t v62 = *(void *)(a1 + 56);
      long long v63 = [v50 descriptionWithMultilinePrefix:0];
      *(_DWORD *)buf = 138543874;
      long long v92 = v61;
      __int16 v93 = 2114;
      uint64_t v94 = v62;
      __int16 v95 = 2114;
      v96 = v63;
      _os_log_error_impl(&dword_1A62FC000, v53, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to connect with %{public}@: %{public}@.", buf, 0x20u);
    }
LABEL_60:

    int v52 = 0;
    goto LABEL_61;
  }
  int v52 = 1;
LABEL_61:
  *(unsigned char *)(a1 + 203) = 1;
  uint64_t v54 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = 0;

  ++*(void *)(a1 + 176);
  v55 = FBLogScene();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = [(id)a1 loggingIdentifier];
    uint64_t v57 = *(void *)(a1 + 176);
    *(_DWORD *)buf = 138543618;
    long long v92 = v56;
    __int16 v93 = 2048;
    uint64_t v94 = v57;
    _os_log_impl(&dword_1A62FC000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@][%lu] Scene activated.", buf, 0x16u);
  }
  if (v52 && !*(void *)(a1 + 216))
  {
    uint64_t v58 = *(void *)(a1 + 176);
    id v59 = *(id *)(a1 + 64);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __48__FBScene__activateWithTransitionContext_error___block_invoke_247;
    v83[3] = &unk_1E5C4B9D8;
    uint64_t v85 = v58;
    long long v86 = sel__activateWithTransitionContext_error_;
    v83[4] = a1;
    id v84 = v59;
    id v60 = v59;
    [v60 _executeBlockAfterLaunchCompletes:v83];
  }
  if (a3) { {
    *a3 = v50;
  }
  }
  unsigned __int8 v90 = v52;

  a1 = v90;
LABEL_8:

  return a1;
}

- (char)initWithDefiniton:(void *)a3 remnant:(void *)a4 settings:(void *)a5 initialClientSettings:(void *)a6 clientProvider:(void *)a7 workspace:
{
  id v13 = a2;
  obuint64_t j = a3;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v76 = a6;
  id v17 = a7;
  long long v74 = v17;
  uint64_t v75 = v16;
  if (a1)
  {
    if (!v17)
    {
      long long v64 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"workspace != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:]();
      }
      }
      [v64 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6328FB4);
    }
    if (([v13 isValid] & 1) == 0)
    {
      int v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[definition isValid]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.5();
      }
      }
      [v65 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6329018);
    }
    id v18 = v14;
    if (v18)
    {
      NSClassFromString(&cfstr_Fbsceneremnant.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:].cold.4();
        }
        }
        [v66 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6329094);
      }
    }

    id v19 = v15;
    if (v19)
    {
      NSClassFromString(&cfstr_Fbsscenesettin.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:]();
        }
        }
        [v67 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A63290F8);
      }
    }

    id v20 = v16;
    if (v20)
    {
      NSClassFromString(&cfstr_Fbssceneclient_0.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:]();
        }
        }
        [v68 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A632915CLL);
      }
    }

    if (initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace__onceToken != -1) { {
      dispatch_once(&initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace__onceToken, &__block_literal_global_26);
    }
    }
    v79.receiver = a1;
    v79.super_class = (Class)FBScene;
    id v21 = (char *)objc_msgSendSuper2(&v79, sel_init);
    uint64_t v22 = v21;
    if (v21)
    {
      id v70 = v15;
      id v71 = v14;
      *((_DWORD *)v21 + 2) = 0;
      uint64_t v23 = [v13 copy];
      __int16 v24 = (void *)*((void *)v22 + 14);
      *((void *)v22 + 14) = v23;

      *((void *)v22 + 23) = 0;
      objc_storeStrong((id *)v22 + 29, a7);
      id v25 = [v13 identity];
      uint64_t v26 = [v13 clientIdentity];
      char v73 = [v13 specification];
      id v27 = [v25 identifier];
      uint64_t v28 = [v27 copy];
      char v29 = (void *)*((void *)v22 + 9);
      *((void *)v22 + 9) = v28;

      long long v30 = [v25 workspaceIdentifier];
      uint64_t v31 = [v30 copy];
      long long v32 = (void *)*((void *)v22 + 10);
      *((void *)v22 + 10) = v31;

      int v33 = [v26 targetsClientEndpoint];
      id v34 = (void *)MEMORY[0x1E4F62A68];
      id v69 = v26;
      if (v33)
      {
        uint64_t v35 = getpid();
        char v36 = [v26 processIdentity];
        char v37 = [v25 internalWorkspaceIdentifier];
        uint64_t v38 = [v34 tokenWithHostPID:v35 directEndpointTarget:v36 workspace:v37 identifier:*((void *)v22 + 9)];
        id v39 = (void *)*((void *)v22 + 11);
        *((void *)v22 + 11) = v38;
      }
      else
      {
        +[FBWorkspaceDomain sharedInstance]();
        char v36 = (id *)objc_claimAutoreleasedReturnValue();
        char v37 = -[FBWorkspaceDomain endpoint](v36);
        id v39 = [v25 internalWorkspaceIdentifier];
        uint64_t v40 = [v34 tokenWithHostEndpoint:v37 workspace:v39 identifier:*((void *)v22 + 9)];
        BOOL v41 = (void *)*((void *)v22 + 11);
        *((void *)v22 + 11) = v40;
      }
      if (v19)
      {
        uint64_t v42 = [v19 _copyClearingProgenitor:0];
      }
      else
      {
        uint64_t v42 = objc_msgSend((id)objc_msgSend(v73, "settingsClass"), "settings");
      }
      id v44 = (id *)(v22 + 96);
      uint64_t v43 = (void *)*((void *)v22 + 12);
      *((void *)v22 + 12) = v42;
      id v15 = v70;
      id v14 = v71;

      if (v20)
      {
        uint64_t v45 = [v20 copy];
      }
      else
      {
        uint64_t v45 = objc_msgSend((id)objc_msgSend(v73, "clientSettingsClass"), "settings");
      }
      uint64_t v47 = (id *)(v22 + 104);
      uint64_t v46 = (void *)*((void *)v22 + 13);
      *((void *)v22 + 13) = v45;

      id v48 = [[FBSceneLayerManager alloc] _initWithScene:v22];
      uint64_t v49 = (void *)*((void *)v22 + 2);
      *((void *)v22 + 2) = v48;

      id v50 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
      uint64_t v51 = (void *)*((void *)v22 + 4);
      *((void *)v22 + 4) = v50;

      v22[202] = v76 != 0;
      objc_storeStrong((id *)v22 + 7, a6);
      objc_storeStrong((id *)v22 + 15, obj);
      if ([*((id *)v22 + 12) _hasAnySceneExtension])
      {
        uint64_t v52 = [*v44 _copyClearingProgenitor:&__block_literal_global_53];
        id v53 = *v44;
        *id v44 = (id)v52;
      }
      if ([*v47 _hasAnySceneExtension])
      {
        uint64_t v54 = [*v47 copy:&__block_literal_global_55];
        id v55 = *v47;
        id *v47 = (id)v54;
      }
      v56 = FBSGetDefaultExtensions();
      [v22 addExtensions:v56];

      objc_initWeak(&location, v22);
      id v57 = MEMORY[0x1E4F14428];
      uint64_t v58 = NSString;
      id v59 = [v22 loggingIdentifier];
      id v60 = [v58 stringWithFormat:@"FBScene - %@", v59];
      objc_copyWeak(&v77, &location);
      uint64_t v61 = BSLogAddStateCaptureBlockWithTitle();
      uint64_t v62 = (void *)*((void *)v22 + 5);
      *((void *)v22 + 5) = v61;

      v22[208] = 1;
      objc_destroyWeak(&v77);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)addExtensions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __25__FBScene_addExtensions___block_invoke;
    v5[3] = &unk_1E5C4B140;
    id v6 = v4;
    [(FBScene *)self updateSettings:v5];
  }
}

- (void)updateUISettingsWithBlock:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke;
    v7[3] = &unk_1E5C49668;
    SEL v9 = a2;
    v7[4] = self;
    id v8 = v5;
    [(FBScene *)self updateSettingsWithBlock:v7];
  }
}

- (void)updateSettings:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene setDelegate:]");
  }
  }
  delegateProxy = self->_delegateProxy;
  if (delegateProxy)
  {
    self->_delegateProxy = 0;
  }
  id v5 = v8;
  if (v8)
  {
    id v6 = (FBSceneObserver *)-[FBSceneObserver initWithDelegate:]([FBSceneObserver alloc], v8);
    uint64_t v7 = self->_delegateProxy;
    self->_delegateProxy = v6;

    id v5 = v8;
  }
}

- (void)updateUISettingsWithTransitionBlock:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke;
    v7[3] = &unk_1E5C49690;
    SEL v9 = a2;
    v7[4] = self;
    id v8 = v5;
    [(FBScene *)self updateSettingsWithTransitionBlock:v7];
  }
}

- (void)updateSettingsWithTransitionBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    SEL v9 = v4;
    id v5 = [(FBScene *)self settings];
    id v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = v9[2](v9, v6);
    [(FBScene *)self updateSettings:v6 withTransitionContext:v7 completion:0];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsUpdateBlock"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene updateSettingsWithTransitionBlock:]();
    }
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)updateSettings:(id)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  char v12 = -[FBScene _verifyIntegrityOfExtensionsInSettings:](self, a3);
  if (v11)
  {
    id v13 = v21;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke;
    v21[3] = &unk_1E5C4A650;
    id v5 = &v22;
    id v22 = v11;
  }
  else
  {
    id v13 = 0;
  }
  id v14 = (void *)MEMORY[0x1AD0B8C50](v13);
  if (v10 && !objc_msgSend(v10, "_indirect_isEmpty"))
  {
    -[FBScene _beginUpdate]((uint64_t)self);
    id v18 = (char *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v18[*MEMORY[0x1E4F62B88]], v12);
    objc_storeStrong((id *)&v18[*MEMORY[0x1E4F62B60]], a4);
    -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, 0, v14);
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F62AE0];
    id v16 = [(FBScene *)self settings];
    id v17 = [v15 diffFromSettings:v16 toSettings:v12];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke_2;
    v19[3] = &unk_1E5C4B850;
    id v20 = v17;
    id v18 = v17;
    -[FBScene _joinUpdate:block:completion:]((uint64_t)self, 0, v19, v14);
  }
  if (v11) { {
}
  }
  }

- (id)_verifyIntegrityOfExtensionsInSettings:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 _progenitor];
    id v6 = (void *)a1[12];

    if (v5 != v6)
    {
      uint64_t v7 = FBLogScene();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) { {
        -[FBScene _verifyIntegrityOfExtensionsInSettings:](a1);
      }
      }
    }
    id v8 = v4;
    SEL v9 = [a1 settings];
    id v10 = [v9 _allSceneExtensions];
    id v11 = [v8 _allSceneExtensions];
    if ((BSEqualObjects() & 1) == 0)
    {
      char v12 = FBLogScene();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) { {
        -[FBScene _verifyIntegrityOfExtensionsInSettings:](a1, v12);
      }
      }

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__FBScene__verifyIntegrityOfExtensionsInSettings___block_invoke;
      v15[3] = &unk_1E5C4BA50;
      id v16 = v10;
      id v17 = v9;
      uint64_t v13 = [v8 copy:v15];

      id v8 = (id)v13;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "_uikitShimming_isUISubclass"))
  {
    id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    return v4;
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"settings is of an unexpected class : %@", v3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke_cold_1(a1);
    }
    }
    [v6 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_verifyIntegrityOfExtensionsInSettings:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "[%{public}@] updated settings were not derived from the scene's previous settings", v4, v5, v6, v7, v8);
}

- (id)componentForExtension:(Class)a3 ofClass:(Class)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene componentForExtension:ofClass:]");
  }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = -[NSMapTable objectForKey:](self->_components, "objectForKey:", a3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) { {
        objc_enumerationMutation(v7);
      }
      }
      -[FBSceneObserver component](*(void *)(*((void *)&v16 + 1) + 8 * v11));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (a4) { {
        id v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
      }
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;

      if (v14) { {
        break;
      }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) { {
          goto LABEL_5;
        }
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    id v14 = 0;
  }

  return v14;
}

- (void)clientToken:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__FBScene_clientToken_didReceiveActions_forExtension___block_invoke;
  v12[3] = &unk_1E5C4A6A0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  Class v16 = a5;
  id v10 = v9;
  id v11 = v8;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v12);
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x1F41813B0](v0);
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _removeAllSceneExtensions];
}

uint64_t __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _removeAllSceneExtensions];
}

id __93__FBScene_initWithDefiniton_remnant_settings_initialClientSettings_clientProvider_workspace___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained debugDescription];

  return v2;
}

- (void)_objc_initiateDealloc
{
  if (pthread_main_np())
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14428];
    uint64_t v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (FBSceneDelegate)delegate
{
  return (FBSceneDelegate *)-[FBSceneObserver delegate]((id *)&self->_delegateProxy->super.isa);
}

- (FBSSceneParameters)parameters
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene parameters]");
  }
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F62A70];
  uint64_t v4 = [(FBSSceneDefinition *)self->_definition specification];
  uint64_t v5 = [v3 parametersForSpecification:v4];

  uint64_t v6 = [(FBScene *)self settings];
  [v5 setSettings:v6];

  [v5 setClientSettings:self->_clientSettings];

  return (FBSSceneParameters *)v5;
}

- (void)activate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(void))a3;
    id v5 = [(FBScene *)self _createTransitionContext];
    v4[2](v4);
  }
  else
  {
    id v5 = 0;
  }
  [(FBScene *)self activateWithTransitionContext:v5];
}

- (void)activateWithTransitionContext:(id)a3
{
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[5];
  uint64_t v2 = a1[6];
  uint64_t v4 = (void *)a1[4];
  id v5 = a2;
  FBSceneErrorCreate(3uLL, v4, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v6);
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  FBSceneErrorCreate(3uLL, *(void **)(a1 + 32), *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_deactivateForClientError:(void *)a1
{
  id v3 = a2;
  if (!a1)
  {
LABEL_4:

    return;
  }
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [a1 _createTransitionContext];
    [v4 setError:v6];
    -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)a1, 0, v4);

    id v3 = v6;
    goto LABEL_4;
  }
  id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"error != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBScene _deactivateForClientError:]();
  }
  }
  [v5 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(void))a3;
    id v5 = [(FBScene *)self _createTransitionContext];
    v4[2](v4);
  }
  else
  {
    id v5 = 0;
  }
  [(FBScene *)self deactivateWithTransitionContext:v5];
}

- (void)deactivateWithTransitionContext:(id)a3
{
}

- (void)_deactivateAndInvalidate:(void *)a3 transitionContext:
{
  id v5 = a3;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene _deactivateAndInvalidate:transitionContext:]");
    }
    }
    if (*(unsigned char *)(a1 + 207))
    {
      long long v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_midUpdate"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _deactivateAndInvalidate:transitionContext:]();
      }
      }
      goto LABEL_34;
    }
    if (*(unsigned char *)(a1 + 204))
    {
      long long v18 = [NSString stringWithFormat:@"cannot re-entrantly deactivate a scene"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene _deactivateAndInvalidate:transitionContext:]();
      }
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6363164);
    }
    BOOL v6 = (a2 & 1) != 0 || (unint64_t)(*(unsigned char *)(a1 + 202) != 0);
    if (!*(unsigned char *)(a1 + 205) && (*(unsigned char *)(a1 + 203) != 0 || !~v6))
    {
      uint64_t v7 = *(void *)(a1 + 176);
      uint64_t v8 = [v5 error];
      uint8_t v9 = [v8 domain];
      char v10 = [v9 isEqualToString:@"FBSceneErrorDomain"];

      id v11 = v8;
      id v12 = v11;
      char v13 = !v6;
      if (v11) { {
        char v13 = 1;
      }
      }
      id v14 = v11;
      if (v13)
      {
        if (!v6) { {
          goto LABEL_15;
        }
        }
      }
      else
      {
        id v14 = FBSceneErrorCreate(2uLL, @"Scene was invalidated.", 0);
        if (!v6)
        {
LABEL_15:
          if (v14)
          {
LABEL_16:
            if (!v5)
            {
              id v5 = [(id)a1 _createTransitionContext];
            }
            [v5 setError:v14];
LABEL_23:
            *(unsigned char *)(a1 + 204) = 1;
            Class v16 = *(void **)(a1 + 232);
            if (v16)
            {
              v19[0] = MEMORY[0x1E4F143A8];
              v19[1] = 3221225472;
              v19[2] = __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke;
              v19[3] = &unk_1E5C4BA28;
              void v19[4] = a1;
              uint64_t v21 = sel__deactivateAndInvalidate_transitionContext_;
              uint64_t v22 = v7;
              char v23 = v10;
              BOOL v24 = v6;
              id v5 = v5;
              id v20 = v5;
              [v16 scene:a1 deactivateAndInvalidate:v6 withContext:v5 block:v19];

              goto LABEL_25;
            }
            long long v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_workspace != nil"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
              -[FBScene _deactivateAndInvalidate:transitionContext:]();
            }
            }
LABEL_34:
            [v17 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A636310CLL);
          }
LABEL_21:
          if (objc_msgSend(v5, "_indirect_isEmpty"))
          {

            id v5 = 0;
          }
          goto LABEL_23;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 152));
      [WeakRetained removeObserver:a1];

      if (v14) { {
        goto LABEL_16;
      }
      }
      goto LABEL_21;
    }
  }
LABEL_25:
}

- (void)invalidate
{
}

- (void)invalidate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void (**)(void))a3;
    id v5 = [(FBScene *)self _createTransitionContext];
    v4[2](v4);
  }
  else
  {
    id v5 = 0;
  }
  -[FBScene _deactivateAndInvalidate:transitionContext:]((uint64_t)self, 1, v5);
}

- (void)removeExtension:(Class)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene removeExtension:]();
    }
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6363350);
  }
  v6[0] = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(FBScene *)self removeExtensions:v4];
}

- (void)removeExtensions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(FBSSceneDefinition *)self->_definition specification];
    BOOL v6 = FBSGetDefaultExtensions();

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __28__FBScene_removeExtensions___block_invoke;
    v8[3] = &unk_1E5C4B828;
    id v9 = v4;
    id v10 = v6;
    id v11 = self;
    id v7 = v6;
    [(FBScene *)self updateSettings:v8];
  }
}

void __28__FBScene_removeExtensions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138543618;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) { {
          objc_enumerationMutation(v4);
        }
        }
        id v10 = *(objc_class **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10, v14, (void)v15))
        {
          id v11 = FBLogScene();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            id v12 = [*(id *)(*(void *)(a1 + 48) + 112) identity];
            char v13 = NSStringFromClass(v10);
            *(_DWORD *)buf = v14;
            id v20 = v12;
            __int16 v21 = 2114;
            uint64_t v22 = v13;
            _os_log_error_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot remove extension \"%{public}@\" because it is part of this scene's specification", buf, 0x16u);
          }
        }
        else
        {
          [v3 _removeSceneExtension:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }
}

uint64_t __59__FBScene_updateSettings_withTransitionContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureParameters:(id)a3
{
  long long v14 = (void (**)(id, void *))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene configureParameters:]");
  }
  }
  if (!v14)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene configureParameters:]();
    }
    }
LABEL_17:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63637BCLL);
  }
  if (self->_active)
  {
    char v13 = [NSString stringWithFormat:@"cannot call configureParameters on an active scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene configureParameters:]();
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6363814);
  }
  if (self->_configuringParameters)
  {
    id v12 = [NSString stringWithFormat:@"re-entrant mutation during configureParameters is not supported"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene configureParameters:]();
    }
    }
    goto LABEL_17;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F629B8]);
  uint64_t v5 = [(FBSSceneDefinition *)self->_definition specification];
  long long v6 = (void *)[v4 initWithSpecification:v5];

  uint64_t v7 = [(FBScene *)self settings];
  [v6 setSettings:v7];

  [v6 setClientSettings:self->_clientSettings];
  self->_configuringParameters = 1;
  v14[2](v14, v6);
  self->_configuringParameters = 0;
  uint64_t v8 = [v6 clientSettings];
  id v9 = (FBSSceneClientSettings *)[v8 copy];
  clientSettings = self->_clientSettings;
  self->_clientSettings = v9;

  id v11 = [v6 settings];
  [(FBScene *)self updateSettings:v11 withTransitionContext:0];
}

- (void)sendActions:(id)a3
{
}

- (void)sendActions:(id)a3 toExtension:(Class)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene sendActions:toExtension:]");
  }
  }
  uint64_t v7 = objc_msgSend(v6, "fbs_singleLineDescriptionOfBSActions");
  uint64_t v8 = FBLogScene();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (!v9) { {
      goto LABEL_9;
    }
    }
    id v10 = [(FBScene *)self loggingIdentifier];
    id v11 = NSStringFromClass(a4);
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v10;
    __int16 v32 = 2114;
    int v33 = v11;
    __int16 v34 = 2114;
    uint64_t v35 = v7;
    _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to \"%{public}@\": %{public}@", buf, 0x20u);
  }
  else
  {
    if (!v9) { {
      goto LABEL_9;
    }
    }
    id v10 = [(FBScene *)self loggingIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v10;
    __int16 v32 = 2114;
    int v33 = v7;
    _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s): %{public}@", buf, 0x16u);
  }

LABEL_9:
  if (self->_legacy)
  {
    if (self->_invalidated)
    {
      id v12 = FBLogScene();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
        -[FBScene sendActions:toExtension:].cold.6(self);
      }
      }
LABEL_29:

      goto LABEL_30;
    }
  }
  else
  {
    if (!self->_active)
    {
      char v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_active"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene sendActions:toExtension:]();
      }
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6363C9CLL);
    }
    if (self->_invalidated)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_invalidated"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBScene sendActions:toExtension:].cold.5();
      }
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6363D00);
    }
  }
  if (a4 && ![(FBScene *)self conformsToExtension:a4])
  {
    id v20 = NSString;
    __int16 v21 = NSStringFromClass(a4);
    uint64_t v22 = [v20 stringWithFormat:@"scene does not conform to extension \"%@\"", v21];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBScene sendActions:toExtension:].cold.4();
    }
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6363C38);
  }
  objc_opt_class();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) { {
          objc_enumerationMutation(v13);
        }
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v19 = [NSString stringWithFormat:@"only actions of type BSAction can be sent : tried to send %@", v18];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBScene sendActions:toExtension:]();
          }
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6363BB4);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  if (!self->_clientToken)
  {
    id v12 = FBLogScene();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) { {
      -[FBScene sendActions:toExtension:](self);
    }
    }
    goto LABEL_29;
  }
  [(FBSceneClient *)self->_client host:self didReceiveActions:v13 forExtension:a4];
LABEL_30:
}

- (BOOL)updateWhenMutable:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__FBScene_updateWhenMutable___block_invoke;
  v7[3] = &unk_1E5C4A7D0;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(FBScene *)self executeWhenMutable:v7];

  return (char)self;
}

void __29__FBScene_updateWhenMutable___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isActive];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 32);
    [v5 performUpdate:v4];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __29__FBScene_updateWhenMutable___block_invoke_2;
    v6[3] = &unk_1E5C4B878;
    id v7 = *(id *)(a1 + 40);
    [v3 updateSettings:v6];
  }
}

uint64_t __29__FBScene_updateWhenMutable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)executeWhenMutable:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  BOOL v5 = [(FBScene *)self isMutable];
  if (v5) { {
    v4[2](v4);
  }
  }
  else {
    -[FBSceneWorkspace _executeWhenIdle:]((uint64_t)self->_workspace, (uint64_t)v4);
  }

  return v5;
}

- (BOOL)isMutable
{
  return (!self->_inTransaction || !self->_midUpdate)
      && !self->_contentStateIsChanging
      && !self->_deactivating
      && !self->_configuringParameters
      && !self->_invalidated;
}

- (id)createSnapshot
{
  id v3 = [(FBScene *)self snapshotContext];
  uint64_t v4 = [(FBScene *)self createSnapshotWithContext:v3];

  return v4;
}

- (id)createSnapshotWithContext:(id)a3
{
  id v4 = a3;
  if ([(FBScene *)self isValid] && self->_active)
  {
    if (v4)
    {
      BOOL v5 = [[FBSceneSnapshot alloc] initWithScene:self snapshotContext:v4];
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = FBLogScene();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
      -[FBScene createSnapshotWithContext:](self);
    }
    }
  }
  BOOL v5 = 0;
LABEL_9:

  return v5;
}

- (id)snapshotContext
{
  int v2 = [[FBSceneSnapshotContext alloc] initWithScene:self];

  return v2;
}

- (void)sceneWillInvalidate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene sceneWillInvalidate:]");
  }
  }
  id v4 = FBLogScene();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(FBScene *)self loggingIdentifier];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Parent scene invalidated", (uint8_t *)&v6, 0xCu);
  }
  [(FBScene *)self setParentScene:0];
}

- (BOOL)conformsToExtension:(Class)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene conformsToExtension:]");
  }
  }
  BOOL v5 = [(FBScene *)self settings];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    int v6 = [(FBSSceneDefinition *)self->_definition specification];
    id v7 = FBSGetDefaultExtensions();
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

- (NSString)debugDescription
{
  return (NSString *)[(FBScene *)self descriptionWithMultilinePrefix:0];
}

- (id)client
{
  if (a1)
  {
    a1 = (id *)a1[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_componentProxiesForExtension:(uint64_t)a1
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 136) objectForKey:a2];
    uint64_t v3 = [v2 copy];
    id v4 = (void *)v3;
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) { {
      BOOL v5 = (void *)v3;
    }
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  FBSceneErrorCreate(1uLL, @"No scene client exists", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __40__FBScene__joinUpdate_block_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  id v7 = a3;
  v6(v5, a2, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __40__FBScene__joinUpdate_block_completion___block_invoke_202(uint64_t a1)
{
}

void __48__FBScene__activateWithTransitionContext_error___block_invoke_247(void *a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__FBScene__activateWithTransitionContext_error___block_invoke_2;
  v5[3] = &unk_1E5C4B9B0;
  char v10 = a2;
  uint64_t v2 = a1[6];
  uint64_t v3 = (void *)a1[5];
  uint64_t v6 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v8 = v2;
  uint64_t v9 = v4;
  id v7 = v3;
  -[FBScene _dispatchClientMessageWithBlock:](v6, v5);
}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 64))
  {
    uint64_t v1 = result;
    uint64_t v3 = (id *)(result + 32);
    uint64_t v2 = *(void *)(result + 32);
    if (!*(unsigned char *)(v2 + 205) && *(unsigned char *)(v2 + 203) && *(void *)(result + 48) == *(void *)(v2 + 176))
    {
      if (*(void *)(v2 + 216))
      {
        id v12 = [NSString stringWithFormat:@"client handle must be nil"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          __48__FBScene__activateWithTransitionContext_error___block_invoke_2_cold_1();
        }
        }
        [v12 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A63646A0);
      }
      uint64_t v4 = +[FBSceneClientHandle handleForScene:clientProcess:](FBSceneClientHandle, "handleForScene:clientProcess:");
      uint64_t v5 = *(void *)(v1 + 32);
      uint64_t v6 = *(void **)(v5 + 216);
      *(void *)(v5 + 216) = v4;

      id v7 = FBLogScene();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*v3 loggingIdentifier];
        uint64_t v9 = *((void *)*v3 + 27);
        *(_DWORD *)buf = 138543618;
        long long v19 = v8;
        __int16 v20 = 2114;
        uint64_t v21 = v9;
        _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client process connected: %{public}@", buf, 0x16u);
      }
      id result = -[FBSceneWorkspace _suppressConnectionHandshakes](*((void *)*v3 + 29));
      if ((result & 1) == 0)
      {
        id v10 = *v3;
        id v11 = (void *)*((void *)*v3 + 29);
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __48__FBScene__activateWithTransitionContext_error___block_invoke_254;
        uint64_t v16 = &unk_1E5C4AF60;
        id v17 = v10;
        return objc_msgSend(v11, "scene:enqueueCalloutsToObserversWithEventName:block:");
      }
    }
  }
  return result;
}

uint64_t __48__FBScene__activateWithTransitionContext_error___block_invoke_254(uint64_t a1, void *a2)
{
  return [a2 scene:*(void *)(a1 + 32) clientDidConnect:*(void *)(*(void *)(a1 + 32) + 216)];
}

void __46__FBScene__applySettingsUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  FBSceneErrorCreate(2uLL, @"Cannot update an invalidated scene.", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke(uint64_t a1)
{
  uint64_t v3 = (void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 207))
  {
    char v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_midUpdate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_3();
    }
    }
LABEL_27:
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63649B8);
  }
  if (!*(unsigned char *)(v2 + 204))
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_deactivating"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_1();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6364A1CLL);
  }
  if (*(unsigned char *)(v2 + 214))
  {
    char v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_inTransaction"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_2();
    }
    }
    goto LABEL_27;
  }
  id v4 = *(id *)(v2 + 56);
  if (*(unsigned char *)(*v3 + 203))
  {
    uint64_t v5 = *(void **)(*v3 + 48);
    if (v5 && *(unsigned char *)(a1 + 64)) { {
      uint64_t v5 = 0;
    }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_333;
  v25[3] = &unk_1E5C4BA00;
  char v26 = *(unsigned char *)(a1 + 65);
  uint64_t v7 = *(void *)(a1 + 56);
  v25[4] = *(void *)(a1 + 32);
  v25[5] = v7;
  uint64_t v8 = (void (**)(void, void, void))MEMORY[0x1AD0B8C50](v25);
  *(unsigned char *)(*(void *)(a1 + 32) + 203) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 204) = 0;
  *(void *)(*(void *)(a1 + 32) + 184) = 0;
  *(void *)(*(void *)(a1 + 32) + 192) = 0;
  *(void *)(*(void *)(a1 + 32) + 224) = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 216);
  *(void *)(v11 + 216) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 56);
  *(void *)(v13 + 56) = 0;

  uint64_t v15 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v15 + 202))
  {
    uint64_t v16 = *(void **)(v15 + 64);
    *(void *)(v15 + 64) = 0;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 65))
  {
    *(unsigned char *)(v17 + 205) = 1;
    uint64_t v18 = *(void **)(*v3 + 232);
    *(void *)(*v3 + 232) = 0;

    long long v19 = *(void **)(*v3 + 16);
    *(void *)(*v3 + 16) = 0;

    [*(id *)(*v3 + 40) invalidate];
    __int16 v20 = *(void **)(*v3 + 40);
    *(void *)(*v3 + 40) = 0;

    [*(id *)(*v3 + 120) invalidate];
    uint64_t v21 = *(void **)(*v3 + 120);
    *(void *)(*v3 + 120) = 0;
  }
  else
  {
    id v22 = *(id *)(v17 + 96);
    uint64_t v21 = *(void **)(v17 + 128);
    *(void *)(v17 + 128) = v22;
  }

  if (v6) { {
    [v4 host:*(void *)(a1 + 32) didInvalidateWithTransitionContext:*(void *)(a1 + 40) completion:v8];
  }
  }
  else {
    v8[2](v8, 1, 0);
  }
  [v4 unregisterHost:*v3];
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_333(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *(unsigned __int8 *)(a1 + 48);
  id v6 = FBLogScene();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v4)
    {
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
        uint64_t v9 = *(void *)(a1 + 40);
        id v10 = [v4 succinctDescription];
        int v16 = 138543874;
        uint64_t v17 = v8;
        __int16 v18 = 2048;
        uint64_t v19 = v9;
        __int16 v20 = 2114;
        uint64_t v21 = v10;
        uint64_t v11 = "[%{public}@][%lu] Scene invalidated with error: %{public}@.";
LABEL_8:
        _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0x20u);

LABEL_14:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (!v7) { {
      goto LABEL_15;
    }
    }
    uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
    uint64_t v13 = *(void *)(a1 + 40);
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v13;
    uint64_t v14 = "[%{public}@][%lu] Scene invalidated.";
LABEL_13:
    _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);
    goto LABEL_14;
  }
  if (!v4)
  {
    if (!v7) { {
      goto LABEL_15;
    }
    }
    uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
    uint64_t v15 = *(void *)(a1 + 40);
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v15;
    uint64_t v14 = "[%{public}@][%lu] Scene deactivated.";
    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    id v10 = [v4 succinctDescription];
    int v16 = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    uint64_t v11 = "[%{public}@][%lu] Scene deactivated with error: %{public}@.";
    goto LABEL_8;
  }
LABEL_15:
}

void __50__FBScene__verifyIntegrityOfExtensionsInSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 _removeAllSceneExtensions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        objc_msgSend(v3, "_addSceneExtension:applyingSettings:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), *(void *)(a1 + 40), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (FBSSceneSpecification)specification
{
  return (FBSSceneSpecification *)[(FBSSceneDefinition *)self->_definition specification];
}

- (void)clientToken:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__FBScene_clientToken_didInvalidateWithError___block_invoke;
  v10[3] = &unk_1E5C49860;
  id v11 = v6;
  long long v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  -[FBScene _dispatchClientMessageWithBlock:]((uint64_t)self, v10);
}

void __46__FBScene_clientToken_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 48);
  id v4 = FBLogScene();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      id v9 = [*(id *)(a1 + 40) loggingIdentifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] client invalidated", (uint8_t *)&v10, 0xCu);
    }
    -[FBScene _deactivateForClientError:](*(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) loggingIdentifier];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48);
      int v10 = 138543874;
      id v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring client invalidation due to token mismatch (probably due to prior deactivation). expected=%p received=%p", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(FBScene *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBScene descriptionBuilderWithMultilinePrefix:]");
  }
  }
  id v6 = [(FBScene *)self succinctDescriptionBuilder];
  id v7 = (id)[v6 appendBool:self->_legacy withName:@"legacy" ifEqualTo:1];
  id v8 = (id)[v6 appendBool:self->_invalidated withName:@"invalidated" ifEqualTo:1];
  if (!self->_invalidated) { {
    id v9 = (id)[v6 appendBool:self->_active withName:@"active"];
  }
  }
  id v10 = (id)objc_msgSend(v6, "appendBool:withName:", -[FBSSceneSettings isForeground](self->_settings, "isForeground"), @"FG");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__FBScene_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E5C497A0;
  id v11 = v6;
  id v15 = v11;
  uint64_t v16 = self;
  [v11 appendBodySectionWithName:0 multilinePrefix:v5 block:v14];

  id v12 = v11;
  return v12;
}

id __49__FBScene_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 112) specification];
  id v4 = (id)[v2 appendClass:objc_opt_class() withName:@"specification"];

  id v5 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 152));
  id v7 = [WeakRetained succinctDescription];
  id v8 = (id)[v5 appendObject:v7 withName:@"parentScene" skipIfNil:1];

  id v9 = *(void **)(a1 + 32);
  id v10 = NSStringFromFBSceneContentState(*(void *)(*(void *)(a1 + 40) + 224));
  [v9 appendString:v10 withName:@"contentState"];

  id v11 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 96) withName:@"settings" skipIfNil:1];
  id v12 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 104) withName:@"clientSettings" skipIfNil:1];
  uint64_t v13 = *(void **)(a1 + 32);
  __int16 v14 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:*(void *)(*(void *)(a1 + 40) + 56)];
  id v15 = (id)[v13 appendObject:v14 withName:@"clientProvider"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 216) withName:@"clientProcess"];
}

- (unint64_t)_transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerManager, 0);
}

- (id)display
{
  uint64_t v2 = [(FBScene *)self settings];
  uint64_t v3 = [v2 displayConfiguration];

  return v3;
}

void __44__FBScene_UIApp__updateUISettingsWithBlock___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__FBScene_UIApp__updateUISettingsWithTransitionBlock___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithTransitionContext:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithTransitionContext:completion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithTransitionContext:completion:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithTransitionContext:completion:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:(NSObject *)a3 error:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 loggingIdentifier];
  uint64_t v6 = [a2 descriptionWithMultilinePrefix:0];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to resolve a scene client provider: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_activateWithTransitionContext:(void *)a1 error:.cold.3(void *a1)
{
  SEL v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "[%{public}@] Execution contexts are not supported for this scene.", v4, v5, v6, v7, v8);
}

- (void)_activateWithTransitionContext:error:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.6()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.7()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.8()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.9()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateWithTransitionContext:error:.cold.10()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __52__FBScene_activateWithTransitionContext_completion___block_invoke_5_cold_1(uint64_t a1)
{
  SEL v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_deactivateForClientError:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_deactivateAndInvalidate:transitionContext:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_deactivateAndInvalidate:transitionContext:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_deactivateAndInvalidate:transitionContext:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addExtension:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeExtension:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setParentScene:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateSettingsWithTransitionBlock:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_verifyIntegrityOfExtensionsInSettings:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  _os_log_fault_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_FAULT, "[%{public}@] Extension mismatch in new scene settings", v4, 0xCu);
}

- (void)_joinUpdate:block:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_joinUpdate:block:completion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_joinUpdate:block:completion:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_joinUpdate:block:completion:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_beginUpdate
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configureParameters:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configureParameters:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configureParameters:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:toExtension:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:(void *)a1 toExtension:.cold.2(void *a1)
{
  SEL v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "[%{public}@] Dropping actions for scene with no client.", v4, v5, v6, v7, v8);
}

- (void)sendActions:toExtension:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:toExtension:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:toExtension:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:(void *)a1 toExtension:.cold.6(void *a1)
{
  SEL v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "[%{public}@]  Dropping actions for invalidated scene.", v4, v5, v6, v7, v8);
}

- (void)createSnapshotWithContext:(void *)a1 .cold.1(void *a1)
{
  SEL v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "cannot take a snapshot for an invalid or inactive scene: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_propagateSettings:fromSettings:toSettings:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_propagateSettings:fromSettings:toSettings:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_propagateSettings:fromSettings:toSettings:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_adjustInitialSettings:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_beginTransaction
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_endTransaction:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applyUpdate:postStateApplicator:completion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setContentState:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_setContentState:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __55__FBScene__applyUpdate_postStateApplicator_completion___block_invoke_cold_1()
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addExtensions:removeExtensions:settings:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_addExtensions:removeExtensions:settings:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __48__FBScene__activateWithTransitionContext_error___block_invoke_2_cold_1()
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.6()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.7()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.8()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.9()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:(void *)a1 .cold.10(void *a1)
{
  SEL v1 = [a1 loggingIdentifier];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0(&dword_1A62FC000, v2, v3, "Ignoring update for invalidated scene: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_applySettingsUpdateWithCompletion:.cold.11()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_applySettingsUpdateWithCompletion:.cold.12()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_1()
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_2()
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__FBScene__deactivateAndInvalidate_transitionContext___block_invoke_cold_3()
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end