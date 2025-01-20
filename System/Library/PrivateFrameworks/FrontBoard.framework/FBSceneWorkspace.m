@interface FBSceneWorkspace
+ (id)debugDescription;
+ (id)sceneIdentityTokenForIdentifier:(id)a3 workspaceIdentifier:(id)a4;
+ (id)workspaceWithIdentifier:(id)a3;
- (BOOL)_isSynchronizingSceneUpdates;
- (BOOL)_suppressConnectionHandshakes;
- (FBSceneWorkspace)init;
- (FBSceneWorkspace)initWithIdentifier:(id)a3;
- (FBSceneWorkspaceDelegate)delegate;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)workspaceIdentifier;
- (char)_createSceneWithDefinition:(void *)a3 settings:(void *)a4 initialClientSettings:(void *)a5 transitionContext:(void *)a6 fromRemnant:(void *)a7 usingClientProvider:(void *)a8 completion:;
- (id)_eventForScene:(void *)a3 withName:(uint64_t)a4 block:;
- (id)_initWithIdentifier:(int)a3 legacy:;
- (id)_initWithLegacySceneManager:(id)a1;
- (id)allScenes;
- (id)createScene:(id)a3;
- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5;
- (id)createSceneWithDefinition:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sceneIdentityTokenForIdentifier:(id)a3;
- (id)sceneWithIdentifier:(id)a3;
- (id)sceneWithIdentityToken:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_setSuppressConnectionHandshakes:(uint64_t)result;
- (void)_beginSynchronizationBlock;
- (void)_endSynchronizationBlock;
- (void)_enqueueEventForScene:(void *)a3 withName:(void *)a4 block:;
- (void)_enqueueObserverCallouts:(void *)a3 forScene:(void *)a4 eventName:(char)a5 preferInternal:(void *)a6 sceneObserverBlock:(void *)a7 sceneManagerObserverBlock:;
- (void)_executeEventWhenIdle:(uint64_t)a1;
- (void)_executeNextIdleEventIfAppropriate;
- (void)_executeWhenIdle:(uint64_t)a1;
- (void)_objc_initiateDealloc;
- (void)_synchronizeChanges:(uint64_t)a1;
- (void)addObserver:(id)a3;
- (void)configureParameters:(id)a3;
- (void)dealloc;
- (void)didReceiveHandshake:(id)a3;
- (void)didReceiveSceneRequest:(id)a3 fromHandle:(id)a4;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 deactivateAndInvalidate:(BOOL)a4 withContext:(id)a5 block:(id)a6;
- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 enqueueCalloutsToObserversWithEventName:(id)a4 block:(id)a5;
- (void)scene:(id)a3 handleUpdate:(id)a4 withCompletion:(id)a5;
- (void)scene:(id)a3 performCalloutsToObservers:(id)a4;
- (void)setClientIdentity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSpecification:(id)a3;
@end

@implementation FBSceneWorkspace

void __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) { {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  }
  if (*(void *)(a1 + 40)) { {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  }
  if (*(unsigned char *)(a1 + 88))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v2 = *(id *)(a1 + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v35 != v5) { {
            objc_enumerationMutation(v2);
          }
          }
          if (*(void *)(*((void *)&v34 + 1) + 8 * i) != *(void *)(a1 + 32)
            && [*(id *)(*((void *)&v34 + 1) + 8 * i) isInternalObserver])
          {
            (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v4);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v31 != v10) { {
          objc_enumerationMutation(v7);
        }
        }
        if (*(void *)(*((void *)&v30 + 1) + 8 * j) != *(void *)(a1 + 32)
          && (!*(unsigned char *)(a1 + 88)
           || ([*(id *)(*((void *)&v30 + 1) + 8 * j) isInternalObserver] & 1) == 0))
        {
          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v27 != v15) { {
          objc_enumerationMutation(v12);
        }
        }
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *(id *)(a1 + 64);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t m = 0; m != v19; ++m)
      {
        if (*(void *)v23 != v20) { {
          objc_enumerationMutation(v17);
        }
        }
        if (*(void *)(*((void *)&v22 + 1) + 8 * m) != *(void *)(a1 + 40)) { {
          (*(void (**)(void))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80));
        }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v38 count:16];
    }
    while (v19);
  }
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_262(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v5 scene:v3 didUpdateSettings:v4];
  [v5 scene:a1[4] didApplyUpdateWithContext:a1[6]];
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scene:*(void *)(a1 + 32) didPrepareUpdateWithContext:*(void *)(a1 + 40)];
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_280(void *a1, void *a2)
{
  return [a2 scene:a1[4] didCompleteUpdateWithContext:a1[5] error:a1[6]];
}

uint64_t __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 scene:*(void *)(a1 + 32) didUpdateClientSettings:*(void *)(a1 + 40)];
}

uint64_t __46__FBSceneWorkspace__beginSynchronizationBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneManagerWillBeginSceneUpdateSynchronization:__LegacyManager];
}

uint64_t __44__FBSceneWorkspace__endSynchronizationBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneManagerDidEndSceneUpdateSynchronization:__LegacyManager];
}

- (void)_enqueueObserverCallouts:(void *)a3 forScene:(void *)a4 eventName:(char)a5 preferInternal:(void *)a6 sceneObserverBlock:(void *)a7 sceneManagerObserverBlock:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  unint64_t v16 = a6;
  unint64_t v17 = a7;
  if (!a1)
  {
LABEL_8:

    return;
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]");
  }
  }
  if (v13)
  {
    if (v15)
    {
      if (v16 | v17)
      {
        id v18 = v15;
        uint64_t v19 = (void *)MEMORY[0x1E4F62838];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke;
        v23[3] = &unk_1E5C4AE70;
        id v28 = (id)v16;
        id v24 = v14;
        id v29 = (id)v17;
        uint64_t v25 = a1;
        id v26 = v18;
        char v30 = a5;
        id v20 = v13;
        id v27 = v20;
        v21 = [v19 eventWithName:v18 handler:v23];
        [v20 executeOrInsertEvent:v21 atPosition:1];
      }
    }
    goto LABEL_8;
  }
  long long v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"eventQueue"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]();
  }
  }
  [v22 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_executeNextIdleEventIfAppropriate
{
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _executeNextIdleEventIfAppropriate]");
    }
    }
    if (([*(id *)(a1 + 48) isLocked] & 1) == 0)
    {
      id v2 = [*(id *)(a1 + 48) executingEvent];
      if (!v2)
      {
        uint64_t v3 = [*(id *)(a1 + 48) pendingEvents];
        uint64_t v4 = [v3 count];

        if (v4 || ![*(id *)(a1 + 56) count]) { {
          return;
        }
        }
        uint64_t v5 = [*(id *)(a1 + 56) firstObject];
        [*(id *)(a1 + 56) removeObjectAtIndex:0];
        [*(id *)(a1 + 48) executeOrInsertEvent:v5 atPosition:1];
        id v2 = (void *)v5;
      }
    }
  }
}

void __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    id v2 = -[FBScene delegateProxy](*(id **)(a1 + 32));
  }
  else
  {
    id v2 = 0;
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v3 = -[FBScene _allComponentProxies](*(id **)(a1 + 32));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v4 = -[FBScene observerProxies](*(char **)(a1 + 32));
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void **)(a1 + 72);
  if (v5) { {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 24);
  }
  }
  id v6 = v5;
  if (*(void *)(a1 + 72))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
    id v7 = [*(id *)(*(void *)(a1 + 40) + 32) array];
    uint64_t v8 = (void *)[v7 copy];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 88));
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F62838];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __124__FBSceneWorkspace__enqueueObserverCallouts_forScene_eventName_preferInternal_sceneObserverBlock_sceneManagerObserverBlock___block_invoke_2;
  v21 = &unk_1E5C4AE48;
  id v22 = v6;
  id v27 = *(id *)(a1 + 72);
  id v23 = v2;
  id v11 = *(id *)(a1 + 64);
  char v29 = *(unsigned char *)(a1 + 80);
  id v24 = v8;
  id v25 = v3;
  id v28 = v11;
  id v26 = v4;
  id v12 = v4;
  id v13 = v3;
  id v14 = v8;
  id v15 = v2;
  id v16 = v6;
  unint64_t v17 = [v9 eventWithName:v10 handler:&v18];
  objc_msgSend(*(id *)(a1 + 56), "executeOrInsertEvent:atPosition:", v17, 0, v18, v19, v20, v21);
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3_263(uint64_t a1, void *a2)
{
  return [a2 sceneManager:__LegacyManager updateForScene:*(void *)(a1 + 32) appliedWithContext:*(void *)(a1 + 40)];
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sceneManager:__LegacyManager updateForScene:*(void *)(a1 + 32) preparedWithContext:*(void *)(a1 + 40)];
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_281(void *a1, void *a2)
{
  return [a2 sceneManager:__LegacyManager updateForScene:a1[4] completedWithContext:a1[5] error:a1[6]];
}

uint64_t __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = __LegacyManager;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v9 = [v5 settingsDiff];
  id v7 = [*(id *)(a1 + 40) previousSettings];
  uint64_t v8 = [*(id *)(a1 + 40) transitionContext];
  [v6 sceneManager:v3 scene:v4 didUpdateClientSettingsWithDiff:v9 oldClientSettings:v7 transitionContext:v8];
}

- (void)_beginSynchronizationBlock
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "Begin scene update synchronization.", v1, 2u);
}

uint64_t __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 sceneDidActivate:*(void *)(a1 + 32)];
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:didUpdateClientSettings:]");
  }
  }
  if (!v6)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:didUpdateClientSettings:]();
    }
    }
LABEL_11:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6300968);
  }
  allScenesByID = self->_allScenesByID;
  id v9 = [v6 identifier];
  id v10 = [(NSMutableDictionary *)allScenesByID objectForKey:v9];

  if (v10 != v6)
  {
    id v16 = NSString;
    unint64_t v17 = self->_allScenesByID;
    uint64_t v18 = [v6 identifier];
    uint64_t v19 = [(NSMutableDictionary *)v17 objectForKey:v18];
    id v15 = [v16 stringWithFormat:@"the scene must match our own mapped scene : %@ != %@", v6, v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:didUpdateClientSettings:]();
    }
    }
    goto LABEL_11;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke;
  v20[3] = &unk_1E5C49860;
  v20[4] = self;
  id v21 = v6;
  id v22 = v7;
  id v11 = v7;
  id v12 = v6;
  id v14 = -[FBSceneWorkspace _eventForScene:withName:block:]((uint64_t)self, v13, @"handleDidUpdateClientSettings", (uint64_t)v20);
  -[FBSceneWorkspace _executeEventWhenIdle:]((uint64_t)self, v14);
}

- (void)_executeEventWhenIdle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _executeEventWhenIdle:]");
    }
    }
    id v3 = v4;
    if (v4)
    {
      [*(id *)(a1 + 56) addObject:v4];
      -[FBSceneWorkspace _executeNextIdleEventIfAppropriate](a1);
      id v3 = v4;
    }
  }
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80))
  {
    uint64_t v5 = FBLogScene();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) { {
      __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7_cold_1(a1, v5);
    }
    }
  }
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6) { {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 40));
  }
  }
  if ([*(id *)(a1 + 48) isActive])
  {
    id v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_280;
    v16[3] = &unk_1E5C4AF38;
    id v9 = v7;
    id v17 = v9;
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 40);
    int v10 = *(unsigned __int8 *)(a1 + 81);
    if (*(unsigned char *)(a1 + 81))
    {
      id v11 = v12;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_281;
      v12[3] = &unk_1E5C4AFD8;
      v1 = &v13;
      id v13 = *(id *)(a1 + 48);
      id v2 = &v14;
      id v14 = *(id *)(a1 + 64);
      id v3 = &v15;
      id v15 = *(id *)(a1 + 40);
      if (!v8)
      {
LABEL_11:
        if (v10)
        {
        }
        return;
      }
    }
    else
    {
      id v11 = 0;
      if (!v8) { {
        goto LABEL_11;
      }
      }
    }
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v8, *(void **)(v8 + 48), v9, @"sceneUpdateCompleted", 0, v16, v11);
    goto LABEL_11;
  }
}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_4(uint64_t a1)
{
}

- (void)scene:(id)a3 handleUpdate:(id)a4 withCompletion:(id)a5
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (char *)a4;
  id v11 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:handleUpdate:withCompletion:]");
  }
  }
  if (!v10)
  {
    v78 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"update != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:]();
    }
    }
    [v78 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63033ACLL);
  }
  if ([v9 _isInTransaction])
  {
    v79 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"![scene _isInTransaction]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:]();
    }
    }
    [v79 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6303410);
  }
  allScenesByID = self->_allScenesByID;
  id v13 = [v9 identifier];
  id v14 = [(NSMutableDictionary *)allScenesByID objectForKey:v13];

  if (v14 != v9)
  {
    v80 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene == [_allScenesByID objectForKey:[scene identifier]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.6();
    }
    }
    [v80 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6303474);
  }
  v89 = v11;
  -[FBSceneWorkspace _beginSynchronizationBlock]((uint64_t)self);
  v90 = [v9 loggingIdentifier];
  BOOL v93 = -[FBScene _isLegacy]((BOOL)v9);
  uint64_t v92 = -[FBScene _beginTransaction]((uint64_t)v9);
  id v15 = (int *)MEMORY[0x1E4F62B60];
  id v16 = *(id *)&v10[*MEMORY[0x1E4F62B60]];
  v88 = (id *)a2;
  if (v16)
  {
    id v17 = v16;
    id v18 = (void *)[v16 copy];
    uint64_t v19 = *v15;
    id v20 = *(void **)&v10[v19];
    *(void *)&v10[v19] = v18;

    id v91 = v18;
  }
  else
  {
    id v21 = [v9 _createTransitionContext];
    uint64_t v22 = *v15;
    id v23 = *(void **)&v10[v22];
    *(void *)&v10[v22] = v21;

    id v91 = v21;
  }
  id v24 = [v10 settings];
  id v25 = [v10 mutableSettings];
  id v26 = (int *)MEMORY[0x1E4F62B78];
  if (!v25)
  {
    id v25 = (void *)[v24 mutableCopy];
    objc_storeStrong((id *)&v10[*v26], v25);
  }
  if (self->_supportsLegacy)
  {
    if ([(FBSceneManagerObserver *)self->_delegate delegateHandlesLegacyInterception])
    {
      [(FBSceneManagerObserver *)self->_delegate sceneManager:__LegacyManager interceptUpdateForScene:v9 withNewSettings:v25];
      id v27 = (int *)MEMORY[0x1E4F62B88];
      if (([*(id *)&v10[*MEMORY[0x1E4F62B88]] isEqual:v25] & 1) == 0)
      {
        id v28 = [(FBSceneManagerObserver *)self->_delegate delegate];
        char v29 = FBLogScene();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v87 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v28];
          v86 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v10[*v27] toSettings:v25];
          *(_DWORD *)buf = 138412802;
          v112 = v90;
          __int16 v113 = 2112;
          *(void *)v114 = v87;
          *(_WORD *)&v114[8] = 2112;
          v115 = v86;
          _os_log_debug_impl(&dword_1A62FC000, v29, OS_LOG_TYPE_DEBUG, "[%@] manager delegate %@ mutated settings: %@", buf, 0x20u);
        }
        uint64_t v30 = [v25 _copyClearingProgenitor:0];
        uint64_t v31 = *v27;
        long long v32 = *(void **)&v10[v31];
        *(void *)&v10[v31] = v30;

        uint64_t v33 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v10[*MEMORY[0x1E4F62B80]] toSettings:*(void *)&v10[*v27]];
        uint64_t v34 = (int)*MEMORY[0x1E4F62B68];
        long long v35 = *(void **)&v10[v34];
        *(void *)&v10[v34] = v33;
      }
    }
  }
  long long v36 = -[FBScene delegateProxy]((id *)v9);
  if (-[FBSceneObserver receiverImplementsWillUpdate]((unint64_t)v36))
  {
    [v36 scene:v9 willUpdateSettings:v10];
    long long v37 = (int *)MEMORY[0x1E4F62B88];
    if (([*(id *)&v10[*MEMORY[0x1E4F62B88]] isEqual:v25] & 1) == 0)
    {
      -[FBSceneObserver delegate]((id *)v36);
      v87 = (id *)objc_claimAutoreleasedReturnValue();
      v38 = FBLogScene();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        v85 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v87];
        v84 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v10[*v37] toSettings:v25];
        *(_DWORD *)buf = 138412802;
        v112 = v90;
        __int16 v113 = 2112;
        *(void *)v114 = v85;
        *(_WORD *)&v114[8] = 2112;
        v115 = v84;
        _os_log_debug_impl(&dword_1A62FC000, v38, OS_LOG_TYPE_DEBUG, "[%@] delegate %@ mutated settings: %@", buf, 0x20u);
      }
      uint64_t v39 = [v25 _copyClearingProgenitor:0];
      uint64_t v40 = *v37;
      v41 = *(void **)&v10[v40];
      *(void *)&v10[v40] = v39;

      uint64_t v42 = [MEMORY[0x1E4F62AE0] diffFromSettings:*(void *)&v10[*MEMORY[0x1E4F62B80]] toSettings:*(void *)&v10[*v37]];
      uint64_t v43 = (int)*MEMORY[0x1E4F62B68];
      v44 = *(void **)&v10[v43];
      *(void *)&v10[v43] = v42;
    }
  }
  int v45 = [v24 isForeground];
  if (v45 != [v25 isForeground])
  {
    v46 = FBLogScene();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = [v24 isForeground];
      int v48 = [v25 isForeground];
      *(_DWORD *)buf = 138543874;
      v112 = v90;
      __int16 v113 = 1024;
      *(_DWORD *)v114 = v47;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v48;
      _os_log_impl(&dword_1A62FC000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] isForeground changed from %{BOOL}u to %{BOOL}u after interception", buf, 0x18u);
    }
  }
  if (v93 && v92 == 1)
  {
    v49 = [v10 settings];
    -[FBScene _adjustInitialSettings:]((uint64_t)v9, v49);
  }
  uint64_t v50 = *v26;
  v51 = *(void **)&v10[v50];
  *(void *)&v10[v50] = 0;

  v52 = [v10 settings];
  uint64_t v53 = [v52 interruptionPolicy];

  if (v53 == 2)
  {
    v54 = [v9 definition];
    v55 = [v54 clientIdentity];
    int v56 = [v55 targetsClientEndpoint];

    if (v56)
    {
      v81 = [NSString stringWithFormat:@"reconnect not supported for direct connections"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace scene:handleUpdate:withCompletion:]();
      }
      }
      [v81 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63034CCLL);
    }
    v57 = +[FBWorkspaceDomain sharedInstance]();
    v58 = -[FBWorkspaceDomain reconnectableWorkspaces]((uint64_t)v57);
    int v59 = [v58 containsObject:self->_identifier];

    if ((v59 & 1) == 0)
    {
      v82 = [NSString stringWithFormat:@"workspace (%@) of scene (%@) does not support reconnect", self->_identifier, v90];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.5();
      }
      }
      [v82 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6303530);
    }
    v60 = [v9 workspaceIdentifier];

    if (v60)
    {
      identifier = self->_identifier;
      v62 = [v9 workspaceIdentifier];
      LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v62];

      if ((identifier & 1) == 0)
      {
        v83 = [NSString stringWithFormat:@"reconnect not supported for (legacy) scenes with conflicting workspace identifiers : workspace (%@) != scene (%@)", self->_identifier, v90];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBSceneWorkspace scene:handleUpdate:withCompletion:].cold.4();
        }
        }
        [v83 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6303594);
      }
    }
  }
  v63 = [(BSEventQueue *)self->_eventQueue pendingEvents];
  v64 = [(BSEventQueue *)self->_eventQueue acquireLockForReason:@"FBSceneUpdate"];
  v65 = [v9 identifier];
  v66 = [v10 settings];
  v67 = [v10 settingsDiff];
  v68 = +[FBSceneUpdateContext contextWithSceneID:v65 transactionID:v92 settings:v66 settingsDiff:v67 transitionContext:v91];

  [v91 setUpdateContext:v68];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke;
  v108[3] = &unk_1E5C4AEE8;
  id v69 = v9;
  id v109 = v69;
  id v70 = v68;
  id v110 = v70;
  if (v93)
  {
    v71 = v105;
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2;
    v105[3] = &unk_1E5C4AF10;
    v88 = &v106;
    id v106 = v69;
    v87 = &v107;
    id v107 = v70;
  }
  else
  {
    v71 = 0;
  }
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v69, @"sceneUpdatePrepared", 0, v108, v71);
  if ([v63 count]) { {
    [(BSEventQueue *)self->_eventQueue flushEvents:v63];
  }
  }
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3;
  v94[3] = &unk_1E5C4B050;
  id v72 = v91;
  id v95 = v72;
  id v73 = v90;
  id v96 = v73;
  id v74 = v69;
  id v97 = v74;
  v75 = v10;
  v98 = v75;
  v99 = self;
  id v76 = v70;
  BOOL v103 = v93;
  id v100 = v76;
  uint64_t v102 = v92;
  BOOL v104 = v92 == 1;
  id v77 = v89;
  id v101 = v77;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:]((uint64_t)self, v74, @"applySettings", v94);
  [(BSEventQueue *)self->_eventQueue flushAllEvents];
  [(BSEventQueue *)self->_eventQueue relinquishLock:v64];
  -[FBSceneWorkspace _endSynchronizationBlock]((uint64_t)self);

  if (v93)
  {
  }
}

- (void)_endSynchronizationBlock
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A62FC000, log, OS_LOG_TYPE_DEBUG, "End scene update synchronization.", v1, 2u);
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_258(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_2_262;
  v28[3] = &unk_1E5C4AF38;
  id v8 = v6;
  id v29 = v8;
  id v30 = *(id *)(a1 + 48);
  id v31 = *(id *)(a1 + 56);
  int v9 = *(unsigned __int8 *)(a1 + 80);
  if (*(unsigned char *)(a1 + 80))
  {
    int v10 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3_263;
    v25[3] = &unk_1E5C4AF10;
    id v2 = &v26;
    id v26 = *(id *)(a1 + 40);
    id v3 = &v27;
    id v27 = *(id *)(a1 + 56);
    if (!v7) { {
      goto LABEL_4;
    }
    }
    goto LABEL_3;
  }
  int v10 = 0;
  if (v7) { {
LABEL_3:
  }
  }
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v7, *(void **)(v7 + 48), v8, @"didUpdateSettings", 0, v28, v10);
LABEL_4:
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](*(void *)(a1 + 32), *(void **)(a1 + 40), @"sceneUpdateSend", v5);
  uint64_t v12 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_4;
  v18[3] = &unk_1E5C4AF88;
  id v13 = v11;
  id v15 = *(void **)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  id v19 = v13;
  uint64_t v23 = v14;
  id v20 = v15;
  id v16 = *(id *)(a1 + 48);
  char v24 = *(unsigned char *)(a1 + 81);
  uint64_t v17 = *(void *)(a1 + 32);
  id v21 = v16;
  uint64_t v22 = v17;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v12, v13, @"sceneMutationCompletion", v18);

  if (v9)
  {
  }
}

- (void)_enqueueEventForScene:(void *)a3 withName:(void *)a4 block:
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
      __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _enqueueEventForScene:withName:block:]");
    }
    }
    int v10 = -[FBSceneWorkspace _eventForScene:withName:block:](a1, v9, v7, (uint64_t)v8);
    if (v10) { {
      [*(id *)(a1 + 48) executeOrInsertEvent:v10 atPosition:1];
    }
    }
  }
}

- (id)_eventForScene:(void *)a3 withName:(uint64_t)a4 block:
{
  id v6 = a3;
  id v7 = 0;
  if (a1 && a4)
  {
    id v7 = [MEMORY[0x1E4F62838] eventWithName:v6 handler:a4];
  }

  return v7;
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) actions];
  if ([v2 count])
  {
    id v3 = objc_msgSend(v2, "fbs_singleLineDescriptionOfBSActions");
    id v4 = FBLogScene();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v5;
      __int16 v29 = 2114;
      id v30 = v3;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) in update: %{public}@", buf, 0x16u);
    }
  }
  id v6 = [*(id *)(a1 + 32) animationFence];
  if (v6)
  {
    id v7 = FBGetFencingProvider();
    id v8 = [*(id *)(a1 + 32) animationFence];
    [v7 synchronizeDrawingWithFence:v8];
  }
  uint64_t v9 = *(void **)(a1 + 48);
  int v10 = *(void **)(a1 + 56);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_258;
  v19[3] = &unk_1E5C4AFB0;
  v19[4] = *(void *)(a1 + 64);
  id v20 = v9;
  id v21 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 72);
  char v25 = *(unsigned char *)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 88);
  id v22 = v11;
  uint64_t v24 = v12;
  id v23 = *(id *)(a1 + 40);
  char v26 = *(unsigned char *)(a1 + 97);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_6;
  v13[3] = &unk_1E5C4B028;
  v13[4] = *(void *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 80);
  id v16 = *(id *)(a1 + 72);
  char v18 = *(unsigned char *)(a1 + 96);
  -[FBScene _applyUpdate:postStateApplicator:completion:]((unint64_t)v20, v10, v19, v13);
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = (int)*MEMORY[0x1E4F62B60];
  id v4 = *(void **)(v2 + v3);
  *(void *)(v2 + v3) = 0;

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = (int)*MEMORY[0x1E4F62B70];
  id v7 = *(void **)(v5 + v6);
  *(void *)(v5 + v6) = 0;

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_5;
    v11[3] = &unk_1E5C4AF60;
    id v10 = v9;
    id v12 = v10;
    if (v8)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v8, *(void **)(v8 + 48), v10, @"sceneDidActivate", 0, v11, 0);
      id v10 = v12;
    }
  }
}

- (void)scene:(id)a3 didReceiveActions:(id)a4 forExtension:(Class)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:didReceiveActions:forExtension:]");
  }
  }
  if (!v8)
  {
    id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:didReceiveActions:forExtension:]();
    }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630A2ACLL);
  }
  allScenesByID = self->_allScenesByID;
  id v11 = [v8 identifier];
  id v12 = [(NSMutableDictionary *)allScenesByID objectForKey:v11];

  if (v12 != v8)
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene && (scene == [_allScenesByID objectForKey:[scene identifier]])"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:didReceiveActions:forExtension:]();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630A310);
  }
  id v13 = [v8 loggingIdentifier];
  id v14 = FBLogScene();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (a5)
  {
    if (v15)
    {
      id v16 = NSStringFromClass(a5);
      id v17 = objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      __int16 v34 = 2114;
      long long v35 = v17;
      _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s) for \"%{public}@\": %{public}@", buf, 0x20u);

LABEL_10:
    }
  }
  else if (v15)
  {
    id v16 = objc_msgSend(v9, "fbs_singleLineDescriptionOfBSActions");
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v13;
    __int16 v32 = 2114;
    uint64_t v33 = v16;
    _os_log_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action(s): %{public}@", buf, 0x16u);
    goto LABEL_10;
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke;
  v25[3] = &unk_1E5C4B118;
  void v25[4] = self;
  id v26 = v9;
  id v28 = v13;
  Class v29 = a5;
  id v27 = v8;
  id v18 = v13;
  id v19 = v8;
  id v20 = v9;
  id v22 = -[FBSceneWorkspace _eventForScene:withName:block:]((uint64_t)self, v21, @"didReceiveActions", (uint64_t)v25);
  -[FBSceneWorkspace _executeEventWhenIdle:]((uint64_t)self, v22);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)allScenes
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace allScenes]");
  }
  }
  allScenesByID = self->_allScenesByID;

  return (id)[(NSMutableDictionary *)allScenesByID allValues];
}

- (id)sceneWithIdentifier:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(1, (uint64_t)"-[FBSceneWorkspace sceneWithIdentifier:]");
  }
  }
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_allScenesByID objectForKey:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_synchronizeChanges:(uint64_t)a1
{
  if (a1 && a2)
  {
    uint64_t v3 = a2;
    -[FBSceneWorkspace _beginSynchronizationBlock](a1);
    v3[2](v3);

    -[FBSceneWorkspace _endSynchronizationBlock](a1);
  }
}

- (NSString)workspaceIdentifier
{
  return self->_identifier;
}

- (void)didReceiveHandshake:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_suppressConnectionHandshakes || (id v10 = self->_delegate) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(v4, "remnants", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) { {
            objc_enumerationMutation(v5);
          }
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) invalidate];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v5 = v10;
    [(FBSceneManagerObserver *)v10 workspace:self clientDidConnectWithHandshake:v4];
  }
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:handleUpdate:withCompletion:]_block_invoke_6");
  }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7;
  v11[3] = &unk_1E5C4B000;
  char v18 = a2;
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v17 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 56);
  char v19 = *(unsigned char *)(a1 + 72);
  id v10 = v5;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v6, v7, @"updateComplete", v11);
}

- (void)scene:(id)a3 performCalloutsToObservers:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F62830];
  id v8 = a3;
  id v9 = [v7 alloc];
  id v10 = (void *)[v9 initWithName:0 onQueue:MEMORY[0x1E4F14428]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke;
  v17[3] = &unk_1E5C4AE98;
  id v18 = v6;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __53__FBSceneWorkspace_scene_performCalloutsToObservers___block_invoke_2;
  uint64_t v15 = &unk_1E5C4AEC0;
  id v16 = v18;
  id v11 = v18;
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, v10, v8, @"performCallouts", 0, v17, &v12);

  objc_msgSend(v10, "flushAllEvents", v12, v13, v14, v15);
}

void __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_2;
  v15[3] = &unk_1E5C4AEE8;
  id v6 = v4;
  id v16 = v6;
  id v17 = *(id *)(a1 + 48);
  BOOL v7 = -[FBScene _isLegacy](*(void *)(a1 + 40));
  if (v7)
  {
    id v8 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_3;
    v12[3] = &unk_1E5C4AF10;
    v1 = &v13;
    id v13 = *(id *)(a1 + 40);
    uint64_t v2 = &v14;
    id v14 = *(id *)(a1 + 48);
  }
  else
  {
    id v8 = 0;
  }
  if (v5) { {
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v5, *(void **)(v5 + 48), v6, @"didUpdateClientSettings", 0, v15, v8);
  }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FBSceneWorkspace_scene_didUpdateClientSettings___block_invoke_4;
  v11[3] = &unk_1E5C49AE0;
  void v11[4] = v9;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v9, v10, @"didUpdateClientSettingsCompletion", v11);
  if (v7)
  {
  }
}

- (char)_createSceneWithDefinition:(void *)a3 settings:(void *)a4 initialClientSettings:(void *)a5 transitionContext:(void *)a6 fromRemnant:(void *)a7 usingClientProvider:(void *)a8 completion:
{
  id v80 = a2;
  id v15 = a3;
  id v79 = a4;
  id v77 = a5;
  id v16 = a6;
  id v76 = a7;
  id v75 = a8;
  if (!a1)
  {
    v44 = 0;
    goto LABEL_55;
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]");
  }
  }
  if (*(unsigned char *)(a1 + 92))
  {
    v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_invalidated"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]5();
    }
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326120);
  }
  if (([v80 isValid] & 1) == 0)
  {
    uint64_t v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[definition isValid]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]4();
    }
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326184);
  }
  id v17 = [v80 identity];
  id v18 = [v17 identifier];

  id v19 = v18;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v19)
  {
    v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]();
    }
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63261E8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]();
    }
    }
    [v52 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632624CLL);
  }

  id v20 = [v80 specification];
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v20)
  {
    uint64_t v53 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]();
    }
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63262B0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v54 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]();
    }
    }
    [v54 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326314);
  }

  v78 = v19;
  if (v16)
  {
    id v21 = v16;
    NSClassFromString(&cfstr_Fbsceneremnant.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v61 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]1();
      }
      }
      [v61 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63265CCLL);
    }

    id v22 = [v21 definition];
    id v23 = [v22 identity];
    uint64_t v24 = [v23 internalWorkspaceIdentifier];
    uint64_t v73 = a1;
    char v25 = BSEqualObjects();

    if ((v25 & 1) == 0)
    {
      v62 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualObjects([[[remnant definition] identity] internalWorkspaceIdentifier], _identifier)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]0();
      }
      }
      [v62 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A632662CLL);
    }
    a1 = v73;
    if ([v21 _hasBeenInvalidated])
    {
      v63 = [NSString stringWithFormat:@"cannot create a scene from an invalidated remnant"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]();
      }
      }
      [v63 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6326684);
    }
  }
  id v26 = v77;
  if (v26)
  {
    NSClassFromString(&cfstr_Fbsscenetransi_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v64 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneTransitionContextClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]9();
      }
      }
      [v64 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63266E8);
    }
  }

  id v27 = v76;
  unint64_t v28 = (unint64_t)v27;
  if (v27)
  {
    if (([v27 conformsToProtocol:&unk_1EFB30128] & 1) == 0)
    {
      v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(FBSceneClientProvider)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]6();
      }
      }
      [v65 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A632674CLL);
    }

    if (!*(unsigned char *)(a1 + 93))
    {
      v66 = [NSString stringWithFormat:@"legacy scenes can only be created on a legacy workspace"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.4();
      }
      }
      [v66 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63267A4);
    }
    Class v29 = [v15 displayConfiguration];
    NSClassFromString(&cfstr_Fbsdisplayconf.isa);
    if (!v29)
    {
      v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.5();
      }
      }
      [v67 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6326808);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSDisplayConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.5();
      }
      }
      [v68 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A632686CLL);
    }
  }
  else
  {
    if (v26 && !v16)
    {
      id v70 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"remnant != nil || transitionContext == nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]8();
      }
      }
      [v70 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A632692CLL);
    }
    if (v75)
    {
      v71 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion == nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]7();
      }
      }
      [v71 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6326990);
    }
    if (!v15)
    {
      objc_msgSend((id)objc_msgSend(v20, "settingsClass"), "settings");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!v79)
    {
      objc_msgSend((id)objc_msgSend(v20, "clientSettingsClass"), "settings");
      id v79 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v15 = v15;
  NSClassFromString(&cfstr_Fbsscenesettin.isa);
  if (!v15)
  {
    v55 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.6();
    }
    }
    [v55 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326378);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v56 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.6();
    }
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63263DCLL);
  }

  id v30 = v79;
  NSClassFromString(&cfstr_Fbssceneclient_0.isa);
  id v79 = v30;
  if (!v30)
  {
    v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.7();
    }
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326440);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v58 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.7();
    }
    }
    [v58 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63264A4);
  }
  unint64_t v74 = (unint64_t)v16;

  int v31 = *(unsigned __int8 *)(a1 + 93);
  __int16 v32 = [v80 identity];
  uint64_t v33 = [v32 workspaceIdentifier];
  __int16 v34 = (void *)v33;
  if (v31)
  {
    uint64_t v35 = a1;
    if (v33)
    {
      uint64_t v36 = [(id)__Workspaces objectForKey:v33];

      if (v36)
      {
        id v69 = [NSString stringWithFormat:@"modern workspace \"%@\" already exists", v34];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]2();
        }
        }
        [v69 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A63268C8);
      }
    }
    long long v37 = (void *)[v32 mutableCopy];
    v38 = v37;
    uint64_t v39 = @"FBSceneManager";
LABEL_41:
    [v37 setInternalWorkspaceIdentifier:v39];
    uint64_t v40 = (void *)[v80 mutableCopy];
    [v40 setIdentity:v38];

    goto LABEL_42;
  }
  uint64_t v35 = a1;
  if ((BSEqualStrings() & 1) == 0)
  {
    if (v34)
    {
      id v72 = [NSString stringWithFormat:@"provided workspaceID \"%@\" does not match actual workspaceID \"%@\"", v34, *(void *)(a1 + 96)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]1();
      }
      }
      [v72 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A63269F0);
    }
    v38 = (void *)[v32 mutableCopy];
    [v38 setWorkspaceIdentifier:*(void *)(a1 + 96)];
    long long v37 = v38;
    uint64_t v39 = 0;
    goto LABEL_41;
  }
  uint64_t v40 = 0;
LABEL_42:

  if (v40)
  {
    uint64_t v41 = [v40 copy];

    id v80 = (id)v41;
  }
  uint64_t v42 = v35;
  id v16 = (id)v74;
  uint64_t v43 = -[FBScene initWithDefiniton:remnant:settings:initialClientSettings:clientProvider:workspace:]([FBScene alloc], v80, (void *)v74, v15, v79, (void *)v28, (void *)v42);
  if (!v43)
  {
    int v59 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.8();
    }
    }
    [v59 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326508);
  }
  v44 = v43;
  int v45 = [*(id *)(v42 + 40) objectForKey:v78];

  if (v45)
  {
    v60 = [NSString stringWithFormat:@"scene \"%@\" already exists in workspace \"%@\"", v78, *(void *)(v42 + 96)];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]0();
    }
    }
    [v60 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6326568);
  }
  [*(id *)(v42 + 40) setObject:v44 forKey:v78];
  if (v74 | v28)
  {
    [v44 activateWithTransitionContext:v26 completion:v75];
    if (v28)
    {
      if (([v44 isActive] & 1) == 0)
      {
        [v44 invalidate];
        v46 = [*(id *)(v42 + 40) objectForKey:v78];

        if (v46)
        {
          int v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_allScenesByID objectForKey:identifier] == nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:].cold.9();
          }
          }
          [v47 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6325FE0);
        }
      }
    }
  }
  else
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __139__FBSceneWorkspace__createSceneWithDefinition_settings_initialClientSettings_transitionContext_fromRemnant_usingClientProvider_completion___block_invoke;
    v81[3] = &unk_1E5C4AE00;
    v81[4] = v42;
    v82 = v44;
    [(id)v42 scene:v82 performCalloutsToObservers:v81];
  }
LABEL_55:

  return v44;
}

- (id)sceneIdentityTokenForIdentifier:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace sceneIdentityTokenForIdentifier:]();
    }
    }
LABEL_11:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63289B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace sceneIdentityTokenForIdentifier:]();
    }
    }
    goto LABEL_11;
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F62A68];
  +[FBWorkspaceDomain sharedInstance]();
  id v6 = (id *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = -[FBWorkspaceDomain endpoint](v6);
  id v8 = [v5 tokenWithHostEndpoint:v7 workspace:self->_identifier identifier:v4];

  return v8;
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_351(uint64_t a1)
{
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  -[FBSceneWorkspace _beginSynchronizationBlock](*(void *)(a1 + 32));
  id v2 = *(id *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 64);
  id v4 = *(id **)(v1 + 48);
  if (v3) { {
    -[FBScene _componentProxiesForExtension:]((uint64_t)v4, v3);
  }
  }
  else {
  uint64_t v5 = -[FBScene _allComponentProxies](v4);
  }
  v49 = v5;
  if ([v5 count])
  {
    int v48 = v2;
    id v6 = (void *)[v2 mutableCopy];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v61;
      id v50 = v7;
LABEL_7:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v61 != v10) { {
          objc_enumerationMutation(v7);
        }
        }
        uint64_t v12 = *(void **)(*((void *)&v60 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(v1 + 48);
        if (*(void *)(v1 + 64)) { {
          [v12 scene:v13 handlePrivateActions:v6];
        }
        }
        else {
        id v14 = [v12 scene:v13 handleActions:v6];
        }
        if ([v14 count])
        {
          id v15 = FBLogScene();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(v1 + 56);
            id v17 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v12];
            id v18 = objc_msgSend(v14, "fbs_singleLineDescriptionOfBSActions");
            *(_DWORD *)buf = 138543874;
            uint64_t v65 = v16;
            id v7 = v50;
            __int16 v66 = 2114;
            v67 = v17;
            __int16 v68 = 2112;
            id v69 = v18;
            _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Component %{public}@ handled action(s): %@", buf, 0x20u);
          }
          [v6 minusSet:v14];
        }
        uint64_t v19 = [v6 count];

        if (!v19) { {
          break;
        }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v60 objects:v70 count:16];
          if (v9) { {
            goto LABEL_7;
          }
          }
          break;
        }
      }
    }

    id v2 = (id)[v6 copy];
  }
  if (*(void *)(v1 + 64) && [v2 count])
  {
    id v20 = FBLogScene();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = v1;
      uint64_t v45 = *(void *)(v1 + 56);
      v46 = NSStringFromClass(*(Class *)(v44 + 64));
      int v47 = objc_msgSend(v2, "fbs_singleLineDescriptionOfBSActions");
      *(_DWORD *)buf = 138543874;
      uint64_t v65 = v45;
      uint64_t v1 = v44;
      __int16 v66 = 2114;
      v67 = v46;
      __int16 v68 = 2114;
      id v69 = v47;
      _os_log_error_impl(&dword_1A62FC000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Extension \"%{public}@\" did not handle actions: %{public}@", buf, 0x20u);
    }
    id v2 = 0;
  }
  if ([v2 count])
  {
    -[FBScene delegateProxy](*(id **)(v1 + 48));
    id v21 = (id *)objc_claimAutoreleasedReturnValue();
    if (-[FBSceneObserver delegateReceivesActions]((uint64_t)v21))
    {
      id v22 = FBLogScene();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

      if (v23)
      {
        uint64_t v24 = v1;
        char v25 = -[FBSceneObserver delegate](v21);
        id v26 = FBLogScene();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) { {
          __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_1(v24, (uint64_t)v25);
        }
        }

        uint64_t v1 = v24;
      }
      [v21 scene:*(void *)(v1 + 48) didReceiveActions:v2];
    }
    else if (-[FBScene _isLegacy](*(void *)(v1 + 48)) { {
           && [*(id *)(*(void *)(v1 + 32) + 24) delegateReceivesSceneActions])
    }
    }
    {
      id v27 = FBLogScene();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

      if (v28)
      {
        uint64_t v29 = v1;
        id v30 = [*(id *)(*(void *)(v1 + 32) + 24) delegate];
        int v31 = FBLogScene();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) { {
          __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_2(v29, (uint64_t)v30);
        }
        }

        uint64_t v1 = v29;
      }
      [*(id *)(*(void *)(v1 + 32) + 24) sceneManager:__LegacyManager scene:*(void *)(v1 + 48) didReceiveActions:v2];
    }
    else
    {
      id v32 = v2;
      uint64_t v33 = (void *)[v2 mutableCopy];
      uint64_t v34 = *(void *)(v1 + 32);
      uint64_t v35 = *(void **)(v1 + 48);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_337;
      v55[3] = &unk_1E5C4B0F0;
      uint64_t v36 = v1;
      id v37 = v33;
      id v56 = v37;
      v57 = v21;
      id v58 = *(id *)(v36 + 48);
      uint64_t v38 = v36;
      id v59 = *(id *)(v36 + 56);
      if (v34) { {
        -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v34, *(void **)(v34 + 48), v35, @"handleActions-sceneObserver", 0, v55, 0);
      }
      }
      uint64_t v39 = *(void *)(v36 + 32);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_343;
      v52[3] = &unk_1E5C497A0;
      id v53 = v37;
      uint64_t v40 = *(void **)(v38 + 48);
      id v54 = *(id *)(v38 + 56);
      id v41 = v37;
      -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v39, v40, @"handleActions-cleanup", v52);

      uint64_t v1 = v38;
      id v2 = v32;
    }
  }
  uint64_t v42 = *(void *)(v1 + 32);
  uint64_t v43 = *(void **)(v1 + 48);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_351;
  v51[3] = &unk_1E5C49AE0;
  v51[4] = v42;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v42, v43, @"didReceiveActionsCompletion", v51);
}

- (FBSceneWorkspace)init
{
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  uint64_t v5 = (FBSceneWorkspace *)-[FBSceneWorkspace _initWithIdentifier:legacy:](self, v4, 0);

  return v5;
}

- (id)_initWithIdentifier:(int)a3 legacy:
{
  uint64_t v5 = a2;
  if (!a1) { {
    goto LABEL_19;
  }
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace _initWithIdentifier:legacy:]");
  }
  }
  if (_initWithIdentifier_legacy__onceToken == -1)
  {
    if (a3)
    {
LABEL_6:
      id v6 = @"FBSceneManager";

      uint64_t v5 = v6;
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&_initWithIdentifier_legacy__onceToken, &__block_literal_global_18);
    if (a3) { {
      goto LABEL_6;
    }
    }
  }
  if (!v5 || [@"FBSceneManager" isEqualToString:v5])
  {
    uint64_t v33 = [NSString stringWithFormat:@"invalid identifier for workspace : %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.5();
    }
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_35:
    JUMPOUT(0x1A6352760);
  }
LABEL_10:
  os_unfair_lock_lock((os_unfair_lock_t)&__WorkspacesMutationLock);
  if (!__Workspaces)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = (void *)__Workspaces;
    __Workspaces = (uint64_t)v7;
  }
  uint64_t v9 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    uint64_t v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _initWithIdentifier:legacy:]();
    }
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63527C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _initWithIdentifier:legacy:].cold.4();
    }
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6352828);
  }

  uint64_t v10 = [(id)__Workspaces objectForKey:v9];

  if (v10)
  {
    uint64_t v36 = [NSString stringWithFormat:@"workspace already exists with identifier \"%@\"", v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _initWithIdentifier:legacy:]();
    }
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6352884);
  }
  uint64_t v11 = (void *)__LegacyManager;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_24;
  v41[3] = &unk_1E5C4ADB0;
  uint64_t v5 = v9;
  uint64_t v42 = v5;
  uint64_t v12 = [v11 scenesPassingTest:v41];
  if ([v12 count])
  {
    id v37 = [NSString stringWithFormat:@"legacy scene manager contains scene with workspaceID \"%@\"", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace _initWithIdentifier:legacy:]();
    }
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_35;
  }
  v40.receiver = a1;
  v40.super_class = (Class)FBSceneWorkspace;
  uint64_t v13 = objc_msgSendSuper2(&v40, sel_init);
  id v14 = v13;
  if (v13)
  {
    v13[22] = 0;
    uint64_t v15 = [(__CFString *)v5 copy];
    uint64_t v16 = (void *)*((void *)v14 + 12);
    *((void *)v14 + 12) = v15;

    *((unsigned char *)v14 + 93) = a3;
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = (void *)*((void *)v14 + 5);
    *((void *)v14 + 5) = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v20 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = (void *)*((void *)v14 + 7);
    *((void *)v14 + 7) = v21;

    BOOL v23 = [FBSceneEventQueue alloc];
    uint64_t v24 = [(BSEventQueue *)v23 initWithName:*((void *)v14 + 12) onQueue:MEMORY[0x1E4F14428]];
    char v25 = (void *)*((void *)v14 + 6);
    *((void *)v14 + 6) = v24;

    [*((id *)v14 + 6) setDelegate:v14];
    id v26 = +[FBWorkspaceEventDispatcher sharedInstance];
    uint64_t v27 = [v26 registerTarget:v14];
    BOOL v28 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v27;

    uint64_t v29 = [NSString stringWithFormat:@"FBSceneWorkspace minus scenes - %@", *((void *)v14 + 12)];
    objc_initWeak(&location, v14);
    objc_copyWeak(&v38, &location);
    uint64_t v30 = BSLogAddStateCaptureBlockWithTitle();
    int v31 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v30;

    [(id)__Workspaces setObject:v14 forKey:*((void *)v14 + 12)];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__WorkspacesMutationLock);
  a1 = v14;

LABEL_19:
  return a1;
}

uint64_t __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x1F41813B0](v0);
}

uint64_t __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = [a2 workspaceIdentifier];
  uint64_t v3 = BSEqualStrings();

  return v3;
}

id __47__FBSceneWorkspace__initWithIdentifier_legacy___block_invoke_38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained succinctDescription];

  return v2;
}

- (FBSceneWorkspace)initWithIdentifier:(id)a3
{
  return (FBSceneWorkspace *)-[FBSceneWorkspace _initWithIdentifier:legacy:](self, a3, 0);
}

- (id)_initWithLegacySceneManager:(id)a1
{
  id v4 = a2;
  if (a1)
  {
    a1 = -[FBSceneWorkspace _initWithIdentifier:legacy:](a1, 0, 1);
    if (a1) { {
      objc_storeStrong((id *)&__LegacyManager, a2);
    }
    }
  }

  return a1;
}

+ (id)workspaceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[FBSceneWorkspace _initWithIdentifier:legacy:]([FBSceneWorkspace alloc], v3, 0);

  return v4;
}

- (void)_objc_initiateDealloc
{
  if (pthread_main_np())
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    id v3 = MEMORY[0x1E4F14428];
    id v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (FBSceneWorkspaceDelegate)delegate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace delegate]");
  }
  }
  delegate = self->_delegate;

  return (FBSceneWorkspaceDelegate *)[(FBSceneManagerObserver *)delegate delegate];
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setDelegate:]");
  }
  }
  uint64_t v6 = [[FBSceneManagerObserver alloc] initWithDelegate:v5 supportLegacy:self->_supportsLegacy];

  delegate = self->_delegate;
  self->_delegate = v6;
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace addObserver:]");
  }
  }
  uint64_t v4 = v6;
  if (v6)
  {
    id v5 = [[FBSceneManagerObserver alloc] initWithObserver:v6 supportLegacy:self->_supportsLegacy];
    os_unfair_lock_lock(&self->_lock);
    if (([(NSMutableOrderedSet *)self->_lock_observers containsObject:v5] & 1) == 0) { {
      [(NSMutableOrderedSet *)self->_lock_observers addObject:v5];
    }
    }
    os_unfair_lock_unlock(&self->_lock);

    uint64_t v4 = v6;
  }
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
  id v6 = (void *)[(NSMutableOrderedSet *)self->_lock_observers copy];
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
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 observer];
        uint64_t v13 = v12;
        if (v12) { {
          BOOL v14 = v12 == a3;
        }
        }
        else {
          BOOL v14 = 1;
        }
        if (v14) { {
          [(NSMutableOrderedSet *)self->_lock_observers removeObject:v11];
        }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)sceneWithIdentityToken:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace sceneWithIdentityToken:]");
  }
  }
  if (v4)
  {
    id v5 = [v4 identifier];
    id v6 = [(FBSceneWorkspace *)self sceneWithIdentifier:v5];

    if (v6
      && ([v6 identityToken],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isEqual:v4],
          v7,
          v8))
    {
      id v9 = v6;
    }
    else
    {
      id v9 = 0;
    }

    return v9;
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"token"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace sceneWithIdentityToken:]();
    }
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)sceneIdentityTokenForIdentifier:(id)a3 workspaceIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    BOOL v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:]();
    }
    }
LABEL_19:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635314CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63531B0);
  }

  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    long long v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:]();
    }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353214);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneWorkspace sceneIdentityTokenForIdentifier:workspaceIdentifier:]();
    }
    }
    goto LABEL_19;
  }

  id v9 = (void *)MEMORY[0x1E4F62A68];
  +[FBWorkspaceDomain sharedInstance]();
  uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = -[FBWorkspaceDomain endpoint](v10);
  id v12 = [v9 tokenWithHostEndpoint:v11 workspace:v8 identifier:v7];

  return v12;
}

- (id)createScene:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace createScene:]");
  }
  }
  if (self->_buildingDefinition)
  {
    long long v16 = NSString;
    long long v17 = NSStringFromSelector(a2);
    long long v18 = [v16 stringWithFormat:@"%@ was called reentrantly", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace createScene:]();
    }
    }
    [v18 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F629B0] definition];
    buildingDefinition = self->_buildingDefinition;
    self->_buildingDefinition = v6;

    id v8 = (void (*)(void *, FBSceneWorkspace *))v5[2];
    id v9 = v6;
    v8(v5, self);
    uint64_t v10 = [(FBSMutableSceneParameters *)self->_buildingParameters settings];
    uint64_t v11 = [(FBSMutableSceneParameters *)self->_buildingParameters clientSettings];
    id v12 = self->_buildingDefinition;
    self->_buildingDefinition = 0;

    buildingParameters = self->_buildingParameters;
    self->_buildingParameters = 0;

    BOOL v14 = -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, v9, v10, v11, 0, 0, 0, 0);

    return v14;
  }
  return result;
}

- (id)createSceneWithDefinition:(id)a3
{
  return -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, a3, 0, 0, 0, 0, 0, 0);
}

- (id)createSceneFromRemnant:(id)a3 withSettings:(id)a4 transitionContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 definition];
  id v12 = [v10 _clientSettings];
  uint64_t v13 = -[FBSceneWorkspace _createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:]((uint64_t)self, v11, v9, v12, v8, v10, 0, 0);

  return v13;
}

- (void)invalidate
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __139__FBSceneWorkspace__createSceneWithDefinition_settings_initialClientSettings_transitionContext_fromRemnant_usingClientProvider_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 workspace:*(void *)(a1 + 32) didAddScene:*(void *)(a1 + 40)];
}

- (BOOL)_isSynchronizingSceneUpdates
{
  if (result) { {
    return *(void *)(result + 64) != 0;
  }
  }
  return result;
}

- (void)_executeWhenIdle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F62838] eventWithName:@"external" handler:a2];
    -[FBSceneWorkspace _executeEventWhenIdle:](a1, v3);
  }
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setIdentifier:]");
  }
  }
  if (!self->_buildingDefinition)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_buildingDefinition != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setIdentifier:]();
    }
    }
LABEL_17:
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63538C8);
  }
  id v9 = v4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setIdentifier:]();
    }
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A635392CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setIdentifier:]();
    }
    }
    goto LABEL_17;
  }

  buildingDefinition = self->_buildingDefinition;
  uint64_t v6 = [MEMORY[0x1E4F62A60] identityForIdentifier:v9 workspaceIdentifier:self->_identifier];
  [(FBSMutableSceneDefinition *)buildingDefinition setIdentity:v6];
}

- (void)setSpecification:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setSpecification:]");
  }
  }
  if (!self->_buildingDefinition)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_buildingDefinition != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setSpecification:]();
    }
    }
LABEL_17:
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353AACLL);
  }
  id v7 = v4;
  NSClassFromString(&cfstr_Fbsscenespecif.isa);
  if (!v7)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setSpecification:]();
    }
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353B10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setSpecification:]();
    }
    }
    goto LABEL_17;
  }

  [(FBSMutableSceneDefinition *)self->_buildingDefinition setSpecification:v7];
}

- (void)setClientIdentity:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace setClientIdentity:]");
  }
  }
  if (!self->_buildingDefinition)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_buildingDefinition != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setClientIdentity:]();
    }
    }
LABEL_17:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353C78);
  }
  if (!v8)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clientID != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setClientIdentity:]();
    }
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353CDCLL);
  }
  uint64_t v4 = objc_msgSend(v8, "fbs_sceneClientIdentity");
  if (!v4)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"realID != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace setClientIdentity:]();
    }
    }
    goto LABEL_17;
  }
  uint64_t v5 = (void *)v4;
  [(FBSMutableSceneDefinition *)self->_buildingDefinition setClientIdentity:v4];
}

- (void)configureParameters:(id)a3
{
  uint64_t v4 = (void (**)(id, FBSMutableSceneParameters *))a3;
  buildingDefinition = self->_buildingDefinition;
  if (!buildingDefinition)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_buildingDefinition != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace configureParameters:]();
    }
    }
LABEL_13:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6353E50);
  }
  id v12 = v4;
  uint64_t v6 = [(FBSMutableSceneDefinition *)buildingDefinition specification];
  if (!v6)
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"specification != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace configureParameters:]();
    }
    }
    goto LABEL_13;
  }
  id v7 = (void *)v6;
  buildingParameters = self->_buildingParameters;
  if (!buildingParameters)
  {
    id v9 = [MEMORY[0x1E4F629B8] parametersForSpecification:v6];
    id v10 = self->_buildingParameters;
    self->_buildingParameters = v9;

    buildingParameters = self->_buildingParameters;
  }
  v12[2](v12, buildingParameters);
}

- (void)scene:(id)a3 enqueueCalloutsToObserversWithEventName:(id)a4 block:(id)a5
{
  if (self) { {
    -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, a3, a4, 0, a5, 0);
  }
  }
}

- (void)scene:(id)a3 deactivateAndInvalidate:(BOOL)a4 withContext:(id)a5 block:(id)a6
{
  LODWORD(v8) = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v37 = a5;
  id v11 = a6;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:]");
  }
  }
  if (!v10 || [v10 _isInTransaction])
  {
    int v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene && ![scene _isInTransaction]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:]();
    }
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63543CCLL);
  }
  allScenesByID = self->_allScenesByID;
  uint64_t v13 = [v10 identifier];
  id v14 = [(NSMutableDictionary *)allScenesByID objectForKey:v13];

  if (v14 != v10)
  {
    id v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene == [_allScenesByID objectForKey:[scene identifier]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneWorkspace scene:deactivateAndInvalidate:withContext:block:]();
    }
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6354430);
  }
  long long v15 = FBLogScene();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v16)
    {
      long long v17 = [v10 identifier];
      *(_DWORD *)buf = 138543362;
      v55 = v17;
      long long v18 = "Invalidating scene: %{public}@";
LABEL_11:
      _os_log_impl(&dword_1A62FC000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    }
  }
  else if (v16)
  {
    long long v17 = [v10 identifier];
    *(_DWORD *)buf = 138543362;
    v55 = v17;
    long long v18 = "Deactivating scene: %{public}@";
    goto LABEL_11;
  }

  -[FBSceneWorkspace _beginSynchronizationBlock]((uint64_t)self);
  id v19 = [(BSEventQueue *)self->_eventQueue pendingEvents];
  uint64_t v20 = [(BSEventQueue *)self->_eventQueue acquireLockForReason:@"FBSceneDeactivate"];
  int v21 = [v10 isActive];
  int v22 = v21;
  BOOL v23 = 0;
  if (v8 && v21) { {
    BOOL v23 = -[FBScene _isLegacy]((BOOL)v10);
  }
  }
  if ([v10 contentState]) { {
    LODWORD(v24) = !-[FBScene _isLegacy]((BOOL)v10);
  }
  }
  else {
    LOBYTE(v24) = 0;
  }
  if (v22)
  {
    uint64_t v33 = v19;
    char v25 = (char)v24;
    char v36 = (char)v8;
    id v8 = v20;
    uint64_t v26 = -[FBScene _beginTransaction]((uint64_t)v10);
    uint64_t v27 = v51;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke;
    v51[3] = &unk_1E5C4AEE8;
    uint64_t v35 = &v52;
    id v24 = v10;
    id v52 = v24;
    uint64_t v34 = &v53;
    id v53 = v37;
    if (!v23)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v24, @"willInvalidate/willDestroy", 0, v51, 0);
      uint64_t v20 = v8;
      LOBYTE(v8) = v36;
      LOBYTE(v24) = v25;
      id v19 = v33;
      goto LABEL_26;
    }
    LOBYTE(v24) = v25;
    id v19 = v33;
  }
  else
  {
    if (!v23)
    {
      uint64_t v26 = 0;
      goto LABEL_28;
    }
    char v36 = (char)v8;
    id v8 = v20;
    uint64_t v27 = 0;
    uint64_t v26 = 0;
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_2;
  v48[3] = &unk_1E5C4B078;
  BOOL v50 = v23;
  id v49 = v10;
  -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:]((uint64_t)self, self->_eventQueue, v49, @"willInvalidate/willDestroy", 0, v27, v48);

  uint64_t v20 = v8;
  LOBYTE(v8) = v36;
  if (v22)
  {
LABEL_26:
  }
LABEL_28:
  if ([v19 count]) { {
    [(BSEventQueue *)self->_eventQueue flushEvents:v19];
  }
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_3;
  v38[3] = &unk_1E5C4B0C8;
  char v44 = v22;
  char v45 = (char)v8;
  id v39 = v10;
  objc_super v40 = self;
  char v46 = (char)v24;
  id v42 = v11;
  uint64_t v43 = v26;
  id v41 = v37;
  BOOL v47 = v23;
  id v28 = v37;
  id v29 = v11;
  id v30 = v10;
  -[FBSceneWorkspace _enqueueEventForScene:withName:block:]((uint64_t)self, v30, @"sceneDeactivation", v38);
  [(BSEventQueue *)self->_eventQueue flushAllEvents];
  [(BSEventQueue *)self->_eventQueue relinquishLock:v20];
  -[FBSceneWorkspace _endSynchronizationBlock]((uint64_t)self);
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sceneWillDeactivate:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40)];
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_2(uint64_t result, void *a2)
{
  if (*(unsigned char *)(result + 40)) { {
    return [a2 sceneManager:__LegacyManager willDestroyScene:*(void *)(result + 32)];
  }
  }
  return result;
}

void __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) { {
    -[FBScene _endTransaction:](*(void *)(a1 + 32), *(void *)(a1 + 64));
  }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(unsigned char *)(a1 + 73))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_4;
    v33[3] = &unk_1E5C4AF10;
    v33[4] = v3;
    id v4 = v2;
    id v34 = v4;
    if (v3) { {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v3, *(void **)(v3 + 48), v4, @"willRemoveScene-sceneManager", 0, 0, v33);
    }
    }
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_5;
    v31[3] = &unk_1E5C497A0;
    v31[4] = v6;
    id v32 = v5;
    -[FBSceneWorkspace _enqueueEventForScene:withName:block:](v6, v32, @"sceneRemoval", v31);
  }
  if (*(unsigned char *)(a1 + 74))
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_6;
    v29[3] = &unk_1E5C4AF60;
    id v9 = v7;
    id v30 = v9;
    if (v8)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v8, *(void **)(v8 + 48), v9, @"contentStateDidChange-sceneObserver", 0, v29, 0);
      id v9 = v30;
    }
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_7;
    v26[3] = &unk_1E5C4AEE8;
    id v12 = v10;
    id v27 = v12;
    id v13 = *(id *)(a1 + 48);
    id v28 = v13;
    if (v11)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v11, *(void **)(v11 + 48), v12, @"didDeactivate-sceneObserver", 0, v26, 0);
      id v13 = v28;
    }
  }
  if (*(unsigned char *)(a1 + 73))
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_8;
    v23[3] = &unk_1E5C4AEE8;
    id v16 = v14;
    id v24 = v16;
    id v17 = *(id *)(a1 + 48);
    id v25 = v17;
    if (v15)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v15, *(void **)(v15 + 48), v16, @"didInvalidate-sceneObserver", 0, v23, 0);
      id v17 = v25;
    }
  }
  if (*(unsigned char *)(a1 + 75))
  {
    long long v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_9;
    v21[3] = &unk_1E5C4B0A0;
    id v20 = v18;
    id v22 = v20;
    if (v19)
    {
      -[FBSceneWorkspace _enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:](v19, *(void **)(v19 + 48), v20, @"didDestroyScene-sceneManager", 0, 0, v21);
      id v20 = v22;
    }
  }
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 workspace:*(void *)(a1 + 32) willRemoveScene:*(void *)(a1 + 40)];
}

void __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_5(uint64_t a1)
{
  SEL v1 = *(void **)(*(void *)(a1 + 32) + 40);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 removeObjectForKey:v2];
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 sceneContentStateDidChange:*(void *)(a1 + 32)];
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 sceneDidDeactivate:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40)];
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 sceneDidInvalidate:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40)];
}

uint64_t __68__FBSceneWorkspace_scene_deactivateAndInvalidate_withContext_block___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 sceneManager:__LegacyManager didDestroyScene:*(void *)(a1 + 32)];
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_337(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = -[FBSceneObserver component]((uint64_t)v3);
    if (v4)
    {
    }
    else if (-[FBSceneObserver observerHandlesActions]((uint64_t)v3))
    {
      uint64_t v5 = *(id **)(a1 + 40);
      uint64_t v6 = -[FBSceneObserver observer](v3);
      id v7 = [v3 scene:*(void *)(a1 + 48) handleActions:*(void *)(a1 + 32)];
      uint64_t v8 = [v7 count];
      id v9 = FBLogScene();
      id v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 56);
          if (v5 == v3) { {
            id v12 = "Delegate";
          }
          }
          else {
            id v12 = "Observer";
          }
          id v13 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v6];
          id v14 = objc_msgSend(v7, "fbs_singleLineDescriptionOfBSActions");
          int v18 = 138544130;
          uint64_t v19 = v11;
          __int16 v20 = 2082;
          int v21 = v12;
          __int16 v22 = 2114;
          BOOL v23 = v13;
          __int16 v24 = 2112;
          id v25 = v14;
          _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}s %{public}@ handled action(s): %@", (uint8_t *)&v18, 0x2Au);
        }
        [*(id *)(a1 + 32) minusSet:v7];
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = *(void *)(a1 + 56);
          if (v5 == v3) { {
            id v16 = "Delegate";
          }
          }
          else {
            id v16 = "Observer";
          }
          id v17 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:v6];
          int v18 = 138543874;
          uint64_t v19 = v15;
          __int16 v20 = 2082;
          int v21 = v16;
          __int16 v22 = 2114;
          BOOL v23 = v17;
          _os_log_debug_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}s %{public}@ handled no actions.", (uint8_t *)&v18, 0x20u);
        }
      }
    }
  }
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_343(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    id v2 = FBLogScene();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = objc_msgSend(*(id *)(a1 + 32), "fbs_singleLineDescriptionOfBSActions");
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v3;
      __int16 v21 = 2114;
      __int16 v22 = v4;
      _os_log_impl(&dword_1A62FC000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dropping unhandled action(s): %{public}@", buf, 0x16u);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) { {
            objc_enumerationMutation(v5);
          }
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "canSendResponse", (void)v14))
          {
            uint64_t v11 = (void *)MEMORY[0x1E4F627D8];
            id v12 = FBSceneErrorCreate(3uLL, @"No handler for action.", 0);
            id v13 = [v11 responseForError:v12];
            [v10 sendResponse:v13];
          }
          [v10 invalidate];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)didReceiveSceneRequest:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_delegate;
  id v9 = [v6 options];
  id v10 = [[_FBSceneClientProcess alloc] _initWithHandle:v7];
  if (![v9 isClientFuture])
  {
    __int16 v24 = [v6 actions];

    if (v24)
    {
      if ([(FBSceneManagerObserver *)v8 delegateReceivesActions])
      {
        id v25 = [v6 actions];
        [(FBSceneManagerObserver *)v8 workspace:self didReceiveActions:v25];

        [v6 respondWithScene:0];
LABEL_25:

        return;
      }
      identifier = self->_identifier;
    }
    else
    {
      if (v8)
      {
        uint64_t v26 = (void *)MEMORY[0x1E4F627F8];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_372;
        v38[3] = &unk_1E5C4B1B8;
        id v39 = v6;
        objc_super v40 = self;
        id v27 = [v26 sentinelWithCompletion:v38];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2_381;
        v36[3] = &unk_1E5C4A5D8;
        id v37 = v27;
        id v28 = v27;
        [(FBSceneManagerObserver *)v8 workspace:self didReceiveSceneRequestWithOptions:v9 fromProcess:v10 completion:v36];

        goto LABEL_25;
      }
      identifier = self->_identifier;
    }
    id v30 = FBSWorkspaceErrorCreate();
    objc_msgSend(v6, "invalidateWithError:", v30, identifier);

    goto LABEL_25;
  }
  uint64_t v35 = v10;
  uint64_t v11 = +[FBWorkspaceDomain sharedInstance]();
  id v12 = -[FBWorkspaceDomain preregisteredWorkspaces]((uint64_t)v11);
  id v13 = [(FBSceneWorkspace *)self identifier];
  long long v14 = [v12 objectForKey:v13];

  if (([v14 acceptsClientScenes] & 1) == 0
    && ![(FBSceneManagerObserver *)v8 delegateHandlesClientScenes])
  {
    id v34 = self->_identifier;
    id v29 = FBSWorkspaceErrorCreate();
    objc_msgSend(v6, "invalidateWithError:", v29, v34);

    goto LABEL_22;
  }
  long long v15 = [v9 identifier];
  long long v16 = [(FBSceneWorkspace *)self sceneWithIdentifier:v15];
  if (v16)
  {
LABEL_7:
    if (([v16 isActive] & 1) != 0
      || ([v16 settings],
          __int16 v21 = objc_claimAutoreleasedReturnValue(),
          int v22 = [v21 isClientFuture],
          v21,
          !v22))
    {
      id v32 = self->_identifier;
      uint64_t v23 = FBSWorkspaceErrorCreate();
      objc_msgSend(v6, "invalidateWithError:", v23, v32, v15);
    }
    else
    {
      [v6 observeScene:v16];
      if (![v16 isValid])
      {
LABEL_17:

LABEL_22:
        id v10 = v35;
        goto LABEL_25;
      }
      if (![(FBSceneManagerObserver *)v8 delegateHandlesClientScenes])
      {
        [v16 activate:0];
        goto LABEL_17;
      }
      uint64_t v23 = [v9 transitionContext];
      [(FBSceneManagerObserver *)v8 workspace:self didReceiveScene:v16 withContext:v23 fromProcess:v35];
    }

    goto LABEL_17;
  }
  long long v17 = FBSSceneClientIdentity;
  int v18 = [v7 identity];
  uint64_t v19 = [v17 defaultIdentityForProcessIdentity:v18];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke;
  v41[3] = &unk_1E5C4B190;
  id v42 = v9;
  id v20 = v19;
  id v43 = v20;
  id v44 = v35;
  long long v16 = [(FBSceneWorkspace *)self createScene:v41];
  if (![v16 isActive])
  {

    goto LABEL_7;
  }
  int v31 = [NSString stringWithFormat:@"it's not valid to activate this kind of scene from workspace:didAddScene:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    -[FBSceneWorkspace didReceiveSceneRequest:fromHandle:]();
  }
  }
  [v31 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) identifier];
  if (v4)
  {
    [v3 setIdentifier:v4];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [v5 UUIDString];
    [v3 setIdentifier:v6];
  }
  [v3 setClientIdentity:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) specification];
  if (v7)
  {
    [v3 setSpecification:v7];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F62AB0] specification];
    [v3 setSpecification:v8];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2;
  v9[3] = &unk_1E5C4B168;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  [v3 configureParameters:v9];
}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 initialSettings];
  [v4 setSettings:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_3;
  v7[3] = &unk_1E5C4B140;
  id v8 = *(id *)(a1 + 40);
  [v4 updateSettingsWithBlock:v7];
  id v6 = [*(id *)(a1 + 32) initialClientSettings];
  [v4 setClientSettings:v6];
}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setClientFuture:1];
  [v3 setClientProcess:*(void *)(a1 + 32)];
}

void __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_372(uint64_t a1, void *a2)
{
  id v3 = [a2 context];
  uint64_t v4 = objc_opt_class();
  id v14 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) { {
      id v5 = v14;
    }
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    [*(id *)(a1 + 32) respondWithScene:v6];
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v14;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) { {
        id v9 = v8;
      }
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 96);
    id v12 = FBSWorkspaceErrorCreate();
    objc_msgSend(v11, "invalidateWithError:", v12, v13);
  }
}

uint64_t __54__FBSceneWorkspace_didReceiveSceneRequest_fromHandle___block_invoke_2_381(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) { {
    a3 = a2;
  }
  }
  return [v3 signalWithContext:a3];
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSceneWorkspace *)self descriptionWithMultilinePrefix:0];
}

+ (id)debugDescription
{
  id v2 = [MEMORY[0x1E4F62810] builderWithObject:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FBSceneWorkspace_debugDescription__block_invoke;
  v7[3] = &unk_1E5C49AE0;
  id v8 = v2;
  id v3 = v2;
  id v4 = (id)[v3 modifyProem:v7];
  os_unfair_lock_lock((os_unfair_lock_t)&__WorkspacesMutationLock);
  [v3 appendDictionarySection:__Workspaces withName:0 skipIfEmpty:0];
  os_unfair_lock_unlock((os_unfair_lock_t)&__WorkspacesMutationLock);
  id v5 = [v3 build];

  return v5;
}

uint64_t __36__FBSceneWorkspace_debugDescription__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendString:@"All Workspaces" withName:0];
}

- (id)succinctDescription
{
  id v2 = [(FBSceneWorkspace *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneWorkspace succinctDescriptionBuilder]");
  }
  }
  id v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:0];
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableDictionary count](self->_allScenesByID, "count"), @"scenes");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSceneWorkspace *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSceneWorkspace *)self succinctDescriptionBuilder];
  if ([(NSMutableDictionary *)self->_allScenesByID count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__FBSceneWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E5C497A0;
    id v8 = v5;
    id v9 = self;
    [v8 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];
  }

  return v5;
}

void __58__FBSceneWorkspace_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  SEL v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 40) allValues];
  [v1 appendArraySection:v2 withName:@"scenes" skipIfEmpty:1];
}

- (BOOL)_suppressConnectionHandshakes
{
  if (result) { {
    return *(unsigned char *)(result + 94) != 0;
  }
  }
  return result;
}

- (uint64_t)_setSuppressConnectionHandshakes:(uint64_t)result
{
  if (result) { {
    *(unsigned char *)(result + 94) = a2;
  }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcherTargetRegistration, 0);
}

- (void)_initWithIdentifier:legacy:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentifier:legacy:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentifier:legacy:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentifier:legacy:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentifier:legacy:.cold.5()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_10();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sceneWithIdentityToken:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sceneIdentityTokenForIdentifier:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sceneIdentityTokenForIdentifier:workspaceIdentifier:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sceneIdentityTokenForIdentifier:workspaceIdentifier:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)createScene:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.5()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.6()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.7()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.8()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.9()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.10()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.11()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.12()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.16()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.17()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.18()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.19()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.20()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.21()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.24()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_createSceneWithDefinition:settings:initialClientSettings:transitionContext:fromRemnant:usingClientProvider:completion:.cold.25()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_enqueueObserverCallouts:forScene:eventName:preferInternal:sceneObserverBlock:sceneManagerObserverBlock:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setIdentifier:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setIdentifier:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setSpecification:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setSpecification:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setClientIdentity:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setClientIdentity:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setClientIdentity:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configureParameters:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)configureParameters:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.3()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.4()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.5()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:handleUpdate:withCompletion:.cold.6()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__FBSceneWorkspace_scene_handleUpdate_withCompletion___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) descriptionWithMultilinePrefix:0];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Update failed: %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)scene:didUpdateClientSettings:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:didUpdateClientSettings:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:deactivateAndInvalidate:withContext:block:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:deactivateAndInvalidate:withContext:block:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:didReceiveActions:forExtension:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)scene:didReceiveActions:forExtension:.cold.2()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:a2];
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_8_2(&dword_1A62FC000, v3, v4, "[%{public}@] Handing all actions to delegate: %@", v5, v6, v7, v8, v9);
}

void __57__FBSceneWorkspace_scene_didReceiveActions_forExtension___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F62810] succinctDescriptionForObject:a2];
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_8_2(&dword_1A62FC000, v3, v4, "[%{public}@] Handing all actions to legacy delegate: %@", v5, v6, v7, v8, v9);
}

- (void)didReceiveSceneRequest:fromHandle:.cold.1()
{
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end