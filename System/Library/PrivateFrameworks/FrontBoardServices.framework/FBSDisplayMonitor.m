@interface FBSDisplayMonitor
- (BOOL)allowsUnknownDisplays;
- (BOOL)canPostToBookendObserver;
- (FBSDisplayConfiguration)mainConfiguration;
- (FBSDisplayIdentity)mainIdentity;
- (FBSDisplayMonitor)init;
- (FBSDisplayMonitor)initWithInitializationCompletion:(id)a3;
- (FBSDisplayMonitor)initWithTransformer:(id)a3;
- (FBSDisplayObserving)bookendObserver;
- (FBSDisplayTransformer)transformer;
- (NSArray)observers;
- (NSSet)connectedIdentities;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)callOutQueue;
- (id)_initWithBookendObserver:(id)a3 transformer:(id)a4;
- (id)_sortedSources;
- (id)configurationForIdentity:(id)a3;
- (void)_lock_enumerateConnectedWithBlock:(id)a3;
- (void)_lock_enumerateSourcesWithBlock:(id)a3;
- (void)_postInitialBookendObserverConnections;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setAllowsUnknownDisplays:(BOOL)a3;
- (void)updateTransformsWithCompletion:(id)a3;
@end

@implementation FBSDisplayMonitor

- (NSSet)connectedIdentities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x1E4F1CA80] set];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FBSDisplayMonitor_connectedIdentities__block_invoke;
  v7[3] = &unk_1E58F7630;
  id v5 = v4;
  id v8 = v5;
  [(FBSDisplayMonitor *)self _lock_enumerateConnectedWithBlock:v7];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v5;
}

- (void)_lock_enumerateConnectedWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__FBSDisplayMonitor__lock_enumerateConnectedWithBlock___block_invoke;
    v6[3] = &unk_1E58F7718;
    id v7 = v4;
    [(FBSDisplayMonitor *)self _lock_enumerateSourcesWithBlock:v6];
  }
}

void __40__FBSDisplayMonitor_connectedIdentities__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identity];
  [v2 addObject:v3];
}

- (FBSDisplayIdentity)mainIdentity
{
  v2 = [(FBSDisplayMonitor *)self mainConfiguration];
  id v3 = [v2 identity];

  return (FBSDisplayIdentity *)v3;
}

- (FBSDisplayConfiguration)mainConfiguration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = -[FBSDisplaySource connectedConfigurations]((os_unfair_lock_s *)self->_mainDisplaySource);
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isMainRootDisplay])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (FBSDisplayConfiguration *)v3;
}

- (void)_lock_enumerateSourcesWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  if (v4)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSMapTable *)self->_lock_sourcesByDisplay objectEnumerator];
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
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

void __55__FBSDisplayMonitor__lock_enumerateConnectedWithBlock___block_invoke(uint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = -[FBSDisplaySource connectedConfigurations](a2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __31__FBSDisplayMonitor_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)_initWithBookendObserver:(id)a3 transformer:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)FBSDisplayMonitor;
  long long v8 = [(FBSDisplayMonitor *)&v47 init];
  long long v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_callOutQueue, MEMORY[0x1E4F14428]);
    objc_storeWeak((id *)&v9->_lock_bookendObserver, v6);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:4];
    lock_observers = v9->_lock_observers;
    v9->_lock_observers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_transformer, a4);
    if (!getCADisplayClass())
    {
      v36 = [NSString stringWithFormat:@"failed to find the symbol for CADisplay"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:]();
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
    }
    long long v12 = [getCADisplayClass() displays];
    uint64_t v13 = [v12 firstObject];
    mainDisplay = v9->_mainDisplay;
    v9->_mainDisplay = (CADisplay *)v13;

    uint64_t v15 = v9->_mainDisplay;
    if (!v15)
    {
      v37 = [NSString stringWithFormat:@"failed to find the main CADisplay"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:]();
      }
      [v37 UTF8String];
      _bs_set_crash_log_message();
    }
    v16 = (FBSDisplaySource *)-[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]([FBSDisplaySource alloc], v9->_mainDisplay, 1, [(CADisplay *)v15 isExternal], v9);
    mainDisplaySource = v9->_mainDisplaySource;
    v9->_mainDisplaySource = v16;

    if (!v9->_mainDisplaySource)
    {
      v38 = [NSString stringWithFormat:@"failed to initialize mainDisplay source -> mainDisplay=%@", v9->_mainDisplay];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:]();
      }
      [v38 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:2];
    lock_sourcesByDisplay = v9->_lock_sourcesByDisplay;
    v9->_lock_sourcesByDisplay = (NSMapTable *)v18;

    [(NSMapTable *)v9->_lock_sourcesByDisplay setObject:v9->_mainDisplaySource forKey:v9->_mainDisplay];
    v20 = [(FBSDisplayMonitor *)v9 mainIdentity];
    char v21 = [v20 isMainDisplay];

    if ((v21 & 1) == 0)
    {
      v39 = NSString;
      v40 = [(FBSDisplayMonitor *)v9 mainConfiguration];
      v41 = [v39 stringWithFormat:@"failed to initialize mainConfiguration -> %@", v40];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.6();
      }
      [v41 UTF8String];
      _bs_set_crash_log_message();
    }
    id v42 = v7;
    v22 = [MEMORY[0x1E4F1CA80] initWithCapacity:[v12 count]];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(CADisplay **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v29 = [(CADisplay *)v28 displayId];
          v30 = [NSNumber numberWithUnsignedInt:v29];
          if ([v22 containsObject:v30])
          {
            v34 = [NSString stringWithFormat:@"two CADisplays had the same displayID(%u) -> $@", v29, v23];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.4();
            }
            [v34 UTF8String];
            _bs_set_crash_log_message();
          }
          [v22 addObject:v30];
          if (v9->_mainDisplay != v28)
          {
            id v31 = -[FBSDisplaySource initWithDisplay:alwaysConnected:triggers:monitor:]([FBSDisplaySource alloc], v28, 0, 1, v9);
            if (!v31)
            {
              v35 = [NSString stringWithFormat:@"failed to initialize display source -> display=%@", v28];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSDisplayMonitor _initWithBookendObserver:transformer:].cold.5();
              }
              [v35 UTF8String];
              _bs_set_crash_log_message();
            }
            v32 = v31;
            [(NSMapTable *)v9->_lock_sourcesByDisplay setObject:v31 forKey:v28];
            -[FBSDisplaySource setAllowsUnknown:]((uint64_t)v32, v9->_lock_allowsUnknownDisplays);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v25);
    }

    id v7 = v42;
  }

  return v9;
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (FBSDisplayTransformer)transformer
{
  return self->_transformer;
}

- (FBSDisplayMonitor)init
{
  return (FBSDisplayMonitor *)[(FBSDisplayMonitor *)self _initWithBookendObserver:0 transformer:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_sourcesByDisplay, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_destroyWeak((id *)&self->_lock_bookendObserver);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_mainDisplaySource, 0);
  objc_storeStrong((id *)&self->_mainDisplay, 0);

  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (![(NSHashTable *)self->_lock_observers containsObject:v4]) {
    [(NSHashTable *)self->_lock_observers addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  [(FBSDisplayMonitor *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FBSDisplayMonitor;
  [(FBSDisplayMonitor *)&v3 dealloc];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lock_bookendObserver, 0);
  lock_observers = self->_lock_observers;
  self->_lock_observers = 0;

  [(FBSDisplayMonitor *)self _lock_enumerateSourcesWithBlock:&__block_literal_global_30];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_lock_observers containsObject:v4]) {
    [(NSHashTable *)self->_lock_observers removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (FBSDisplayMonitor)initWithInitializationCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSDisplayMonitor *)self _initWithBookendObserver:0 transformer:0];
  id v6 = v5;
  if (v4 && v5)
  {
    callOutQueue = v5->_callOutQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke;
    v9[3] = &unk_1E58F57B0;
    uint64_t v10 = v5;
    id v11 = v4;
    dispatch_async(callOutQueue, v9);
  }
  return v6;
}

void __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  v2 = [MEMORY[0x1E4F1CA80] set];
  objc_super v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke_2;
  v5[3] = &unk_1E58F7630;
  id v6 = v2;
  id v4 = v2;
  [v3 _lock_enumerateConnectedWithBlock:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__FBSDisplayMonitor_initWithInitializationCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)configurationForIdentity:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  uint64_t v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__FBSDisplayMonitor_configurationForIdentity___block_invoke;
  v9[3] = &unk_1E58F7658;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  long long v12 = &v14;
  SEL v13 = a2;
  [(FBSDisplayMonitor *)self _lock_enumerateConnectedWithBlock:v9];
  os_unfair_lock_unlock(&self->_lock);
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v7;
}

void __46__FBSDisplayMonitor_configurationForIdentity___block_invoke(uint64_t a1, void *a2)
{
}

- (FBSDisplayMonitor)initWithTransformer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"transformer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSDisplayMonitor initWithTransformer:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  id v5 = v4;
  id v6 = [(FBSDisplayMonitor *)self _initWithBookendObserver:0 transformer:v4];

  return v6;
}

- (void)updateTransformsWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock(&self->_lock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__FBSDisplayMonitor_updateTransformsWithCompletion___block_invoke;
  v16[3] = &unk_1E58F76A0;
  id v6 = v5;
  id v17 = v6;
  [(FBSDisplayMonitor *)self _lock_enumerateSourcesWithBlock:v16];
  os_unfair_lock_unlock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[FBSDisplaySource updateTransforms](*(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v9);
  }

  if (v4) {
    dispatch_async((dispatch_queue_t)self->_callOutQueue, v4);
  }
}

uint64_t __52__FBSDisplayMonitor_updateTransformsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)allowsUnknownDisplays
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsUnknownDisplays;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowsUnknownDisplays:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&setAllowsUnknownDisplays____allowsUnknownLock);
  id v5 = [MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_allowsUnknownDisplays != v3)
  {
    self->_lock_allowsUnknownDisplays = v3;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__FBSDisplayMonitor_setAllowsUnknownDisplays___block_invoke;
    v15[3] = &unk_1E58F76A0;
    id v16 = v5;
    [(FBSDisplayMonitor *)self _lock_enumerateSourcesWithBlock:v15];
  }
  os_unfair_lock_unlock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
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
        -[FBSDisplaySource setAllowsUnknown:](*(void *)(*((void *)&v11 + 1) + 8 * v10++), v3);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&setAllowsUnknownDisplays____allowsUnknownLock);
}

uint64_t __46__FBSDisplayMonitor_setAllowsUnknownDisplays___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_postInitialBookendObserverConnections
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C680000, a2, OS_LOG_TYPE_DEBUG, "posting bookend initialization %@", (uint8_t *)&v2, 0xCu);
}

void __59__FBSDisplayMonitor__postInitialBookendObserverConnections__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 identity];
  uint64_t v4 = [*(id *)(a1 + 32) identity];

  if (v3 != v4)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      [v5 addObject:v9];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithObject:v9];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

- (BOOL)canPostToBookendObserver
{
  int v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_canPostToBookendObserver;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (FBSDisplayObserving)bookendObserver
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_bookendObserver);
  os_unfair_lock_unlock(p_lock);

  return (FBSDisplayObserving *)WeakRetained;
}

- (NSArray)observers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (NSString)description
{
  uint64_t v3 = [off_1E58F44F0 builderWithObject:self];
  uint64_t v4 = [v3 activeMultilinePrefix];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __32__FBSDisplayMonitor_description__block_invoke;
  long long v11 = &unk_1E58F4AB0;
  long long v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"sources" multilinePrefix:v4 block:&v8];

  uint64_t v6 = [v5 build:v8, v9, v10, v11, v12];

  return (NSString *)v6;
}

void __32__FBSDisplayMonitor_description__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [*(id *)(a1 + 32) _sortedSources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) succinctDescription];
        [v7 appendString:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (NSString)debugDescription
{
  uint64_t v3 = [off_1E58F44F0 builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __37__FBSDisplayMonitor_debugDescription__block_invoke;
  long long v11 = &unk_1E58F4AB0;
  id v12 = v3;
  id v13 = self;
  id v4 = v3;
  id v5 = (id)[v4 modifyBody:&v8];
  uint64_t v6 = [v4 build:v8, v9, v10, v11];

  return (NSString *)v6;
}

void __37__FBSDisplayMonitor_debugDescription__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _sortedSources];
  [v1 appendArraySection:v2 withName:@"sources" skipIfEmpty:0];
}

- (id)_sortedSources
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMapTable *)self->_lock_sourcesByDisplay objectEnumerator];
  uint64_t v6 = [v5 allObjects];

  os_unfair_lock_unlock(p_lock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__FBSDisplayMonitor__sortedSources__block_invoke;
  v9[3] = &unk_1E58F76F0;
  void v9[4] = self;
  v9[5] = a2;
  uint64_t v7 = [v6 sortedArrayUsingComparator:v9];

  return v7;
}

uint64_t __35__FBSDisplayMonitor__sortedSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = -[FBSDisplaySource displayID]((uint64_t)v5);
  unsigned int v8 = -[FBSDisplaySource displayID]((uint64_t)v6);
  if (v7 == v8)
  {
    long long v11 = [NSString stringWithFormat:@"we previously guaranteed that they can never be the same"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __35__FBSDisplayMonitor__sortedSources__block_invoke_cold_1(a1);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v7 < v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)_initWithBookendObserver:transformer:.cold.1()
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

- (void)_initWithBookendObserver:transformer:.cold.2()
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

- (void)_initWithBookendObserver:transformer:.cold.3()
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

- (void)_initWithBookendObserver:transformer:.cold.4()
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

- (void)_initWithBookendObserver:transformer:.cold.5()
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

- (void)_initWithBookendObserver:transformer:.cold.6()
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

void __46__FBSDisplayMonitor_configurationForIdentity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 56));
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithTransformer:.cold.1()
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

void __35__FBSDisplayMonitor__sortedSources__block_invoke_cold_1(uint64_t a1)
{
  SEL v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end