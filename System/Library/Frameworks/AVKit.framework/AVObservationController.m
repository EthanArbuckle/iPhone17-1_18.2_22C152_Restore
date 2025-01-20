@interface AVObservationController
- (AVObservationController)initWithOwner:(id)a3;
- (id)startObserving:(id)a3 keyPath:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6;
- (id)startObserving:(id)a3 keyPath:(id)a4 observationHandler:(id)a5;
- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 includeChanges:(BOOL)a6 observationHandler:(id)a7;
- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6;
- (id)startObserving:(id)a3 keyPaths:(id)a4 observationHandler:(id)a5;
- (void)_stopAllObservation;
- (void)dealloc;
- (void)startObservingNotificationForName:(id)a3 object:(id)a4 notificationCenter:(id)a5 observationHandler:(id)a6;
- (void)stopAllObservation;
- (void)stopObserving:(id)a3;
@end

@implementation AVObservationController

- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 includeChanges:(BOOL)a6 observationHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  kdebug_trace();
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4598;
  v47 = __Block_byref_object_dispose__4599;
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__4598;
  v41[4] = __Block_byref_object_dispose__4599;
  id v15 = v12;
  id v16 = v15;
  v17 = 0;
  id v42 = v15;
  v18 = (void *)v44[5];
  if (v18) {
    BOOL v19 = v15 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    id v31 = v13;
    objc_initWeak(&location, v18);
    v20 = (void *)[v14 copy];
    v21 = [AVProxyKVOObserver alloc];
    uint64_t v22 = v44[5];
    id v23 = objc_loadWeakRetained(&self->_owner);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke;
    v36[3] = &unk_1E5FC2540;
    objc_copyWeak(&v38, &location);
    BOOL v39 = v8;
    id v24 = v20;
    BOOL v25 = v8;
    id v26 = v24;
    id v37 = v24;
    uint64_t v27 = v22;
    id v13 = v31;
    v28 = [(AVProxyKVOObserver *)v21 initWithObservedObject:v16 observer:v27 keyPaths:v31 retainingObservedObject:v23 != v16 includeInitialValue:v9 includeChanges:v25 changesBlock:v36];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_3;
    v32[3] = &unk_1E5FC2568;
    v32[4] = self;
    v17 = v28;
    v33 = v17;
    v34 = &v43;
    v35 = v41;
    [(AVProxyKVOObserver *)v17 startObserving:v16 completion:v32];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  kdebug_trace();
  v29 = [(AVProxyKVOObserver *)v17 token];
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);

  return v29;
}

void __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_3(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  v4 = [v2 token];
  [v3 setObject:v2 forKeyedSubscript:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1[7] + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)startObservingNotificationForName:(id)a3 object:(id)a4 notificationCenter:(id)a5 observationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_lock(&self->_unfairLock);
  id v14 = [(NSMutableDictionary *)self->_notificationObservers objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(&self->_unfairLock);
  if (!v14)
  {
    id v15 = (void *)[v13 copy];

    if (!v12)
    {
      id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    }
    objc_copyWeak(&to, &self->_owner);
    objc_initWeak(&location, v11);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    BOOL v19 = __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke;
    v20 = &unk_1E5FC25B8;
    objc_copyWeak(&v22, &to);
    objc_copyWeak(&v23, &location);
    BOOL v24 = v11 == 0;
    id v13 = v15;
    id v21 = v13;
    id v16 = [v12 addObserverForName:v10 object:v11 queue:0 usingBlock:&v17];
    os_unfair_lock_lock(&self->_unfairLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_notificationObservers, "setObject:forKeyedSubscript:", v16, v10, v17, v18, v19, v20);
    [(NSMutableDictionary *)self->_notificationCenters setObject:v12 forKeyedSubscript:v10];
    os_unfair_lock_unlock(&self->_unfairLock);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak(&to);
  }
}

void __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v17 = WeakRetained;
  if (v11 && WeakRetained && (!v14 || v13 != v14 || !*(unsigned char *)(a1 + 48)))
  {
    uint64_t v18 = [[AVKeyValueChange alloc] initWithValue:v13 oldValue:v14 keyPath:v12 observationToken:v15];
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_2;
      v19[3] = &unk_1E5FC2518;
      objc_copyWeak(&v23, (id *)(a1 + 40));
      id v22 = *(id *)(a1 + 32);
      id v20 = v11;
      id v21 = v18;
      dispatch_async(MEMORY[0x1E4F14428], v19);

      objc_destroyWeak(&v23);
    }
  }
}

- (id)startObserving:(id)a3 keyPath:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 arrayWithObjects:&v17 count:1];

  id v15 = -[AVObservationController startObserving:keyPaths:includeInitialValue:observationHandler:](self, "startObserving:keyPaths:includeInitialValue:observationHandler:", v13, v14, v6, v11, v17, v18);

  return v15;
}

- (id)startObserving:(id)a3 keyPaths:(id)a4 includeInitialValue:(BOOL)a5 observationHandler:(id)a6
{
  return [(AVObservationController *)self startObserving:a3 keyPaths:a4 includeInitialValue:a5 includeChanges:1 observationHandler:a6];
}

- (id)startObserving:(id)a3 keyPath:(id)a4 observationHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  BOOL v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v15 count:1];

  id v13 = -[AVObservationController startObserving:keyPaths:observationHandler:](self, "startObserving:keyPaths:observationHandler:", v11, v12, v9, v15, v16);

  return v13;
}

- (id)startObserving:(id)a3 keyPaths:(id)a4 observationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_copyWeak(&to, &self->_owner);
  id v11 = (void *)[v10 copy];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__AVObservationController_startObserving_keyPaths_observationHandler___block_invoke;
  v15[3] = &unk_1E5FC2590;
  objc_copyWeak(&v17, &to);
  id v12 = v11;
  id v16 = v12;
  id v13 = [(AVObservationController *)self startObserving:v8 keyPaths:v9 includeInitialValue:0 includeChanges:0 observationHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&to);

  return v13;
}

- (void)stopAllObservation
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  [(AVObservationController *)self _stopAllObservation];

  os_unfair_lock_unlock(p_unfairLock);
}

- (void)_stopAllObservation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_proxyObserversByTokens allValues];
  [(NSMutableDictionary *)self->_proxyObserversByTokens removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) stopObserving];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(NSMutableDictionary *)self->_notificationObservers allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * j);
        id v15 = [(NSMutableDictionary *)self->_notificationCenters objectForKeyedSubscript:v14];
        id v16 = [(NSMutableDictionary *)self->_notificationObservers objectForKeyedSubscript:v14];
        [v15 removeObserver:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  [(NSMutableDictionary *)self->_notificationObservers removeAllObjects];
  [(NSMutableDictionary *)self->_notificationCenters removeAllObjects];
}

- (AVObservationController)initWithOwner:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVObservationController;
  uint64_t v5 = [(AVObservationController *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_unfairLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    proxyObserversByTokens = v6->_proxyObserversByTokens;
    v6->_proxyObserversByTokens = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationObservers = v6->_notificationObservers;
    v6->_notificationObservers = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationCenters = v6->_notificationCenters;
    v6->_notificationCenters = (NSMutableDictionary *)v11;

    objc_storeWeak(&v6->_owner, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_notificationCenters, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);

  objc_storeStrong((id *)&self->_proxyObserversByTokens, 0);
}

- (void)stopObserving:(id)a3
{
  if (a3)
  {
    p_unfairLock = &self->_unfairLock;
    id v5 = a3;
    os_unfair_lock_lock(p_unfairLock);
    uint64_t v6 = [(NSMutableDictionary *)self->_proxyObserversByTokens objectForKeyedSubscript:v5];
    [v6 stopObserving];

    [(NSMutableDictionary *)self->_proxyObserversByTokens removeObjectForKey:v5];
    os_unfair_lock_unlock(p_unfairLock);
  }
}

void __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = v5;
  if (WeakRetained && (*(unsigned char *)(a1 + 56) || v5))
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28EA0]);
      id v8 = [v3 name];
      uint64_t v9 = [v3 object];
      uint64_t v10 = [v3 userInfo];
      uint64_t v11 = (void *)[v7 initWithName:v8 object:v9 userInfo:v10];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke_2;
      block[3] = &unk_1E5FC2FC8;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      id v15 = WeakRetained;
      char v19 = *(unsigned char *)(a1 + 56);
      id v12 = *(id *)(a1 + 32);
      id v16 = v11;
      id v17 = v12;
      id v13 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v18);
    }
  }
}

uint64_t __106__AVObservationController_startObservingNotificationForName_object_notificationCenter_observationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 64) || WeakRetained != 0) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }

  return MEMORY[0x1F4181820]();
}

uint64_t __70__AVObservationController_startObserving_keyPaths_observationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

uint64_t __105__AVObservationController_startObserving_keyPaths_includeInitialValue_includeChanges_observationHandler___block_invoke_2(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 56))) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  uint64_t v4 = [(NSMutableDictionary *)self->_proxyObserversByTokens count];
  if (v4 | [(NSMutableDictionary *)self->_notificationObservers count])
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = _AVMethodProem(self);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "You must call -[AVObservationController stopAllObservation] before destroying it, perhaps in its owner's dealloc. %@", buf, 0xCu);
    }
    [(AVObservationController *)self _stopAllObservation];
  }
  os_unfair_lock_unlock(p_unfairLock);
  v7.receiver = self;
  v7.super_class = (Class)AVObservationController;
  [(AVObservationController *)&v7 dealloc];
}

@end