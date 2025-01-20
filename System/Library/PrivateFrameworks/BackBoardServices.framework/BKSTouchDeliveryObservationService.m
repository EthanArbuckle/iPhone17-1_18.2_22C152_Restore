@interface BKSTouchDeliveryObservationService
+ (id)sharedInstance;
- (BKSTouchDeliveryObservationService)init;
- (BOOL)_queue_addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4;
- (BOOL)_queue_removeObserver:(id)a3 forTouchIdentifier:(unsigned int)a4;
- (BSMutableIntegerMap)touchIdentifierToObserverLists;
- (BSServiceConnection)connection;
- (NSHashTable)generalObservers;
- (NSMapTable)observersToTouchIdentifiers;
- (id)_queue_observersForTouchIdentifier:(unsigned int)a3;
- (void)_connectToTouchDeliveryService;
- (void)_processTouchEventDeliveryUpdate:(id)a3;
- (void)_queue_removeObserversForTouchIdentifier:(unsigned int)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4;
- (void)dealloc;
- (void)observeTouchEventDeliveryDidOccur:(id)a3 response:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setGeneralObservers:(id)a3;
- (void)setObserversToTouchIdentifiers:(id)a3;
- (void)setTouchIdentifierToObserverLists:(id)a3;
@end

@implementation BKSTouchDeliveryObservationService

- (void)observeTouchEventDeliveryDidOccur:(id)a3 response:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          objc_enumerationMutation(v6);
        }
        [(BKSTouchDeliveryObservationService *)self _processTouchEventDeliveryUpdate:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  v7[2](v7, 0);
}

- (void)_processTouchEventDeliveryUpdate:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v5;
    _os_log_debug_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEBUG, "update: received touch event update %{public}@", buf, 0xCu);
  }

  int v7 = [v5 touchIdentifier];
  int v8 = [v5 pid];
  char v9 = [v5 isDetached];
  int v10 = [v5 contextID];
  uint64_t v11 = [v5 type];
  if (v11)
  {
    calloutQueue = self->_calloutQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke;
    v14[3] = &unk_1E5441470;
    v14[4] = self;
    uint64_t v16 = v11;
    SEL v17 = a2;
    char v21 = v9;
    int v18 = v7;
    int v19 = v10;
    int v20 = v8;
    id v15 = v5;
    dispatch_async(calloutQueue, v14);
  }
  else
  {
    long long v13 = BKLogTouchDeliveryObserver();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v5;
      _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "update: invalid update type %{public}@", buf, 0xCu);
    }
  }
}

void __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__8065;
  v47 = __Block_byref_object_dispose__8066;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__8065;
  v41 = __Block_byref_object_dispose__8066;
  id v42 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke_84;
  block[3] = &unk_1E5441448;
  int v36 = *(_DWORD *)(a1 + 64);
  block[4] = v2;
  block[5] = &v43;
  block[6] = &v37;
  dispatch_sync(v3, block);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = [(id)v44[5] objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v52 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(a1 + 48);
        if (v8)
        {
          char v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (v8 == 1)
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v11 = BKLogTouchDeliveryObserver();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                int v14 = *(_DWORD *)(a1 + 64);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v51 = v14;
                *(_WORD *)&v51[4] = 2114;
                *(void *)&v51[6] = v9;
                _os_log_debug_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_DEBUG, "update: up for %X to pid:%{public}@", buf, 0x12u);
              }

              [v9 touchUpOccuredForIdentifier:*(unsigned int *)(a1 + 64) detached:*(unsigned __int8 *)(a1 + 76) context:*(unsigned int *)(a1 + 68) pid:*(unsigned int *)(a1 + 72)];
            }
          }
          else if (v8 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            int v10 = BKLogTouchDeliveryObserver();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              int v13 = *(_DWORD *)(a1 + 64);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v51 = v13;
              *(_WORD *)&v51[4] = 2114;
              *(void *)&v51[6] = v9;
              _os_log_debug_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_DEBUG, "update: detach for %X to %{public}@", buf, 0x12u);
            }

            [v9 touchDetachedForIdentifier:*(unsigned int *)(a1 + 64) context:*(unsigned int *)(a1 + 68) pid:*(unsigned int *)(a1 + 72)];
          }
        }
        else
        {
          long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"BKSTouchDeliveryObservationService.m", 291, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v52 count:16];
    }
    while (v5);
  }

  if ([(id)v38[5] count])
  {
    id v26 = *(id *)(a1 + 40);
    if (*(_DWORD *)(a1 + 64))
    {
      id v15 = (void *)[*(id *)(a1 + 40) copy];

      [v15 setTouchIdentifier:0];
      id v26 = v15;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v16 = [(id)v38[5] objectEnumerator];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v16);
          }
          int v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
          if (([(id)v44[5] containsObject:v20] & 1) == 0)
          {
            uint64_t v21 = *(void *)(a1 + 48);
            if (v21)
            {
              if (v21 == 1)
              {
                if (objc_opt_respondsToSelector())
                {
                  id v23 = BKLogTouchDeliveryObserver();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(void *)v51 = v20;
                    _os_log_debug_impl(&dword_18AA0B000, v23, OS_LOG_TYPE_DEBUG, "update: up to %{public}@", buf, 0xCu);
                  }

                  [v20 touchUpOccuredForIdentifier:0 detached:*(unsigned __int8 *)(a1 + 76) context:*(unsigned int *)(a1 + 68) pid:*(unsigned int *)(a1 + 72)];
                }
              }
              else if (v21 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                v22 = BKLogTouchDeliveryObserver();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v51 = v20;
                  _os_log_debug_impl(&dword_18AA0B000, v22, OS_LOG_TYPE_DEBUG, "update: detach to %{public}@", buf, 0xCu);
                }

                [v20 touchDetachedForIdentifier:0 context:*(unsigned int *)(a1 + 68) pid:*(unsigned int *)(a1 + 72)];
              }
            }
            else
            {
              uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
              [v24 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"BKSTouchDeliveryObservationService.m", 322, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v25 = [v16 countByEnumeratingWithState:&v27 objects:v49 count:16];
        uint64_t v17 = v25;
      }
      while (v25);
    }
  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

uint64_t __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke_84(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_observersForTouchIdentifier:");
    uint64_t v3 = [v2 copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserversForTouchIdentifier:", *(unsigned int *)(a1 + 56));
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void *)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  return MEMORY[0x1F41817F8](v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generalObservers, 0);
  objc_storeStrong((id *)&self->_observersToTouchIdentifiers, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToObserverLists, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_touchClientQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)setGeneralObservers:(id)a3
{
}

- (NSHashTable)generalObservers
{
  return self->_generalObservers;
}

- (void)setObserversToTouchIdentifiers:(id)a3
{
}

- (NSMapTable)observersToTouchIdentifiers
{
  return self->_observersToTouchIdentifiers;
}

- (void)setTouchIdentifierToObserverLists:(id)a3
{
}

- (BSMutableIntegerMap)touchIdentifierToObserverLists
{
  return self->_touchIdentifierToObserverLists;
}

- (void)setConnection:(id)a3
{
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)_connectToTouchDeliveryService
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:@"BKTouchDeliveryObservation"];
  if (v4)
  {
    objc_storeStrong((id *)&self->_connection, v4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke;
    v11[3] = &unk_1E5441878;
    v11[4] = self;
    [v4 configureConnection:v11];
    uint64_t v5 = BKLogTouchDeliveryObserver();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
    }

    [v4 activate];
    uint64_t v6 = BKLogTouchDeliveryObserver();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [v4 remoteTarget];
      *(_DWORD *)buf = 138543362;
      int v13 = v10;
      _os_log_debug_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);
    }
    uint64_t v7 = [v4 remoteTarget];

    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"BKSTouchDeliveryObservationService.m" lineNumber:244 description:@"we must have a remote target"];
    }
  }
  else
  {
    char v9 = BKLogTouchDeliveryObserver();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
    }
  }
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEBUG, "configured client service", buf, 2u);
  }

  uint64_t v5 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED7749C0];
  uint64_t v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779550];
  uint64_t v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"BKTouchDeliveryObservation"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v3 setInterface:v7];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_71;
  v9[3] = &unk_1E5441590;
  v9[4] = *(void *)(a1 + 32);
  [v3 setInterruptionHandler:v9];
  [v3 setInvalidationHandler:&__block_literal_global_75];
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_71(uint64_t a1)
{
  uint64_t v2 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_ERROR, "service interruption -- attempting to reconnect", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_72;
  block[3] = &unk_1E5441710;
  block[4] = v3;
  dispatch_async(v4, block);
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "backboardd must be going down, exiting", v4, 2u);
  }

  exit(0);
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_72(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_2;
  v5[3] = &unk_1E5441420;
  v5[4] = v2;
  [v3 enumerateKeysWithBlock:v5];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) remoteTarget];
    [v4 setObservesAllTouches:MEMORY[0x1E4F1CC38]];
  }
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) remoteTarget];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a2];
  [v4 setObservesTouch:MEMORY[0x1E4F1CC38] withIdentifier:v3];
}

- (BOOL)_queue_removeObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  uint64_t v7 = a4;
  uint64_t v8 = [(BSMutableIntegerMap *)self->_touchIdentifierToObserverLists objectForKey:a4];
  char v9 = v8;
  if (v8 && [v8 containsObject:v6])
  {
    [v9 removeObject:v6];
    uint64_t v10 = [v9 count];
    BOOL v11 = v10 == 0;
    if (!v10) {
      [(BSMutableIntegerMap *)self->_touchIdentifierToObserverLists removeObjectForKey:v7];
    }
    long long v12 = [(NSMapTable *)self->_observersToTouchIdentifiers objectForKey:v6];
    int v13 = v12;
    if (v12)
    {
      [v12 removeValue:v7];
      if (![v13 count]) {
        [(NSMapTable *)self->_observersToTouchIdentifiers removeObjectForKey:v6];
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_queue_addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  uint64_t v7 = a4;
  uint64_t v8 = [(BSMutableIntegerMap *)self->_touchIdentifierToObserverLists objectForKey:a4];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    [(BSMutableIntegerMap *)self->_touchIdentifierToObserverLists setObject:v8 forKey:v7];
  }
  if (([v8 containsObject:v6] & 1) == 0)
  {
    [v8 addObject:v6];
    id v9 = [(NSMapTable *)self->_observersToTouchIdentifiers objectForKey:v6];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F4F790]);
      [(NSMapTable *)self->_observersToTouchIdentifiers setObject:v9 forKey:v6];
    }
    [v9 addValue:v7];
  }
  uint64_t v10 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138543362;
    uint64_t v14 = v8;
    _os_log_debug_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_DEBUG, "addObserver:forTouchIdentifier: table:%{public}@", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = [v8 count] == 1;
  return v11;
}

- (void)_queue_removeObserversForTouchIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  uint64_t v5 = [(BKSTouchDeliveryObservationService *)self _queue_observersForTouchIdentifier:v3];
  id v6 = (void *)[v5 copy];

  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      uint64_t v3 = v3;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = -[NSMapTable objectForKey:](self->_observersToTouchIdentifiers, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v12 removeValue:v3];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v3 = v3;
    }

    [(BSMutableIntegerMap *)self->_touchIdentifierToObserverLists removeObjectForKey:v3];
  }
}

- (id)_queue_observersForTouchIdentifier:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  touchIdentifierToObserverLists = self->_touchIdentifierToObserverLists;
  return (id)[(BSMutableIntegerMap *)touchIdentifierToObserverLists objectForKey:a3];
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v8 = v13;
    _os_log_debug_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEBUG, "add observer:%{public}@", buf, 0xCu);
  }
  touchClientQueue = self->_touchClientQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke;
  v9[3] = &unk_1E5441BB0;
  id v10 = v4;
  BOOL v11 = self;
  id v7 = v4;
  dispatch_sync(touchClientQueue, v9);
}

void __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke(int8x16_t *a1)
{
  if (a1[2].i64[0])
  {
    objc_msgSend(*(id *)(a1[2].i64[1] + 48), "removeObject:");
    if (![*(id *)(a1[2].i64[1] + 48) count])
    {
      uint64_t v2 = [*(id *)(a1[2].i64[1] + 24) remoteTarget];
      [v2 setObservesAllTouches:MEMORY[0x1E4F1CC28]];
    }
    uint64_t v3 = [*(id *)(a1[2].i64[1] + 40) objectForKey:a1[2].i64[0]];
    id v4 = (void *)[v3 copy];

    if (v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke_2;
      v7[3] = &unk_1E54413F8;
      int8x16_t v6 = a1[2];
      id v5 = (id)v6.i64[0];
      int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
      [v4 enumerateWithBlock:v7];
    }
  }
}

void __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forTouchIdentifier:", *(void *)(a1 + 40), a2))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) remoteTarget];
    id v4 = [NSNumber numberWithUnsignedInt:a2];
    [v5 setObservesTouch:MEMORY[0x1E4F1CC28] withIdentifier:v4];
  }
}

- (void)addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 1024;
    unsigned int v18 = a4;
    id v10 = v16;
    _os_log_debug_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEBUG, "add observer:%{public}@ for touch:%X", buf, 0x12u);
  }
  touchClientQueue = self->_touchClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__BKSTouchDeliveryObservationService_addObserver_forTouchIdentifier___block_invoke;
  block[3] = &unk_1E54413D0;
  id v12 = v6;
  id v13 = self;
  unsigned int v14 = a4;
  id v9 = v6;
  dispatch_sync(touchClientQueue, block);
}

void __69__BKSTouchDeliveryObservationService_addObserver_forTouchIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1
    && objc_msgSend(*(id *)(a1 + 40), "_queue_addObserver:forTouchIdentifier:", v1, *(unsigned int *)(a1 + 48)))
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 24) remoteTarget];
    uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v4 setObservesTouch:MEMORY[0x1E4F1CC38] withIdentifier:v3];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEBUG, "add observer", buf, 2u);
  }

  touchClientQueue = self->_touchClientQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__BKSTouchDeliveryObservationService_addObserver___block_invoke;
  v8[3] = &unk_1E5441BB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(touchClientQueue, v8);
}

void __50__BKSTouchDeliveryObservationService_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count] == 1)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) remoteTarget];
    [v2 setObservesAllTouches:MEMORY[0x1E4F1CC38]];
  }
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKSTouchDeliveryObservationService;
  [(BKSTouchDeliveryObservationService *)&v3 dealloc];
}

- (BKSTouchDeliveryObservationService)init
{
  v14.receiver = self;
  v14.super_class = (Class)BKSTouchDeliveryObservationService;
  id v2 = [(BKSTouchDeliveryObservationService *)&v14 init];
  if (v2)
  {
    objc_super v3 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    touchIdentifierToObserverLists = v2->_touchIdentifierToObserverLists;
    v2->_touchIdentifierToObserverLists = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observersToTouchIdentifiers = v2->_observersToTouchIdentifiers;
    v2->_observersToTouchIdentifiers = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    generalObservers = v2->_generalObservers;
    v2->_generalObservers = (NSHashTable *)v7;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)Serial;

    uint64_t v11 = BSDispatchQueueCreateSerial();
    touchClientQueue = v2->_touchClientQueue;
    v2->_touchClientQueue = (OS_dispatch_queue *)v11;

    [(BKSTouchDeliveryObservationService *)v2 _connectToTouchDeliveryService];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8120 != -1) {
    dispatch_once(&sharedInstance_onceToken_8120, &__block_literal_global_8121);
  }
  id v2 = (void *)sharedInstance___shared;
  return v2;
}

uint64_t __52__BKSTouchDeliveryObservationService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BKSTouchDeliveryObservationService);
  uint64_t v1 = sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end