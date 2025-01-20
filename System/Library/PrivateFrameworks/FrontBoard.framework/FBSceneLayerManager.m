@interface FBSceneLayerManager
- (FBScene)scene;
- (NSOrderedSet)layers;
- (NSString)description;
- (NSString)identifier;
- (id)_initWithScene:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)layerWithContextID:(unsigned int)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_objc_initiateDealloc;
- (void)_observer_didStartTrackingLayers;
- (void)_observer_didStopTrackingLayers;
- (void)_observer_sceneLayerManagerDidUpdateLayers;
- (void)_setLayers:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation FBSceneLayerManager

- (NSOrderedSet)layers
{
  return self->_layers;
}

- (void)_setLayers:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager _setLayers:]");
  }
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    v24 = self;
    NSUInteger v22 = [(NSOrderedSet *)self->_layers count];
    v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      location = (id *)&self->_scene;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) { {
            objc_enumerationMutation(v6);
          }
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v12 = +[FBSceneLayer layerWithFBSSceneLayer:v11];
          if (v12)
          {
            [v5 addObject:v12];
          }
          else
          {
            id WeakRetained = objc_loadWeakRetained(location);
            v14 = FBLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = [WeakRetained clientHandle];
              *(_DWORD *)buf = 138543618;
              uint64_t v31 = v11;
              __int16 v32 = 2114;
              uint64_t v33 = v15;
              v16 = (void *)v15;
              _os_log_error_impl(&dword_1A62FC000, v14, OS_LOG_TYPE_ERROR, "Ignoring bogus scene layer %{public}@ from %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v8);
    }

    uint64_t v17 = [v5 copy];
    layers = v24->_layers;
    v24->_layers = (NSOrderedSet *)v17;

    uint64_t v19 = [v6 copy];
    fbsLayers = v24->_fbsLayers;
    v24->_fbsLayers = (NSOrderedSet *)v19;

    id v21 = objc_loadWeakRetained((id *)&v24->_scene);
    if ([v21 isActive])
    {
      if ([v5 count] && !v22) { {
        [(FBSceneLayerManager *)v24 _observer_didStartTrackingLayers];
      }
      }
      [(FBSceneLayerManager *)v24 _observer_sceneLayerManagerDidUpdateLayers];
      if (![v5 count] && v22) { {
        [(FBSceneLayerManager *)v24 _observer_didStopTrackingLayers];
      }
      }
    }

    id v4 = v23;
  }
}

- (void)_observer_sceneLayerManagerDidUpdateLayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(NSHashTable *)self->_observers copy];
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
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) { {
          [v8 sceneLayerManagerDidUpdateLayers:self];
        }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_observer_didStartTrackingLayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(NSHashTable *)self->_observers copy];
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
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) { {
          [v8 sceneLayerManagerDidStartTrackingLayers:self];
        }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (FBScene *)WeakRetained;
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager addObserver:]");
  }
  }
  uint64_t v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      uint64_t v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:4];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    uint64_t v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager removeObserver:]");
  }
  }
  [(NSHashTable *)self->_observers removeObject:v5];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (id)_initWithScene:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBSceneLayerManager *)a2 _initWithScene:(uint64_t)v13];
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6329508);
  }
  uint64_t v6 = v5;
  if (_initWithScene__onceToken != -1) { {
    dispatch_once(&_initWithScene__onceToken, &__block_literal_global_23);
  }
  }
  v14.receiver = self;
  v14.super_class = (Class)FBSceneLayerManager;
  uint64_t v7 = [(FBSceneLayerManager *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 identifier];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    objc_storeWeak((id *)&v7->_scene, v6);
    uint64_t v10 = [MEMORY[0x1E4F1CAA0] orderedSet];
    layers = v7->_layers;
    v7->_layers = (NSOrderedSet *)v10;
  }
  return v7;
}

- (id)layerWithContextID:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_layers;
  uint64_t v5 = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "contextID", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) { {
        continue;
      }
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)description
{
  return (NSString *)[(FBSceneLayerManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSceneLayerManager *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  uint64_t v4 = [(FBSceneLayerManager *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSceneLayerManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSceneLayerManager *)self succinctDescriptionBuilder];
  if ([(NSOrderedSet *)self->_layers count])
  {
    uint64_t v6 = [(NSOrderedSet *)self->_layers array];
    [v5 appendArraySection:v6 withName:@"layers" multilinePrefix:v4 skipIfEmpty:1];
  }
  else
  {
    id v7 = (id)[v5 appendObject:@"(none)" withName:@"layers"];
  }

  return v5;
}

uint64_t __38__FBSceneLayerManager__initWithScene___block_invoke()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x1F41813B0](v0);
}

- (void)_objc_initiateDealloc
{
  if (pthread_main_np())
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    id v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)_observer_didStopTrackingLayers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(NSHashTable *)self->_observers copy];
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
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) { {
          [v8 sceneLayerManagerDidStopTrackingLayers:self];
        }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  long long v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  long long v15 = @"FBSceneLayerManager.m";
  __int16 v16 = 1024;
  int v17 = 106;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end