@interface COStateAddOn
- (COStateAddOn)init;
- (COStateAddOnDelegate)delegate;
- (NSDictionary)meshState;
- (void)_broadcastMeshState:(id)a3;
- (void)_constructMeshState;
- (void)_handleStateNotification:(id)a3;
- (void)_handleStateReadRequest:(id)a3 callback:(id)a4;
- (void)_handleStateUpdateNotification:(id)a3;
- (void)_handleStateUpdateRequest:(id)a3 callback:(id)a4;
- (void)_handleUpdates:(id)a3 removals:(id)a4;
- (void)_processOutstandingUpdateRequests;
- (void)_sendRequest:(id)a3 withRetryCount:(int64_t)a4 withCallback:(id)a5;
- (void)_withLock:(id)a3;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)removeKeyPaths:(id)a3 suite:(id)a4 withCallback:(id)a5;
- (void)sendStateUpdates:(id)a3 removals:(id)a4 withCallback:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3 suite:(id)a4 withCallback:(id)a5;
- (void)setMeshState:(id)a3;
- (void)willRemoveFromMeshController:(id)a3;
@end

@implementation COStateAddOn

- (COStateAddOn)init
{
  v6.receiver = self;
  v6.super_class = (Class)COStateAddOn;
  v2 = [(COMeshAddOn *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    outstandingUpdateRequests = v2->_outstandingUpdateRequests;
    v2->_outstandingUpdateRequests = (NSMutableArray *)v3;

    v2->_stateConstructionGeneration = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COStateAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__19;
  v9 = __Block_byref_object_dispose__19;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__COStateAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COStateAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COStateAddOnDelegate *)v2;
}

uint64_t __24__COStateAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__COStateAddOn_setDelegate___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(COStateAddOn *)self _withLock:v6];
}

void __28__COStateAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
  LOBYTE(v2) = [v2 isEqual:WeakRetained];

  if ((v2 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id *)(*(void *)(a1 + 40) + 56);
    objc_storeWeak(v5, v4);
  }
}

- (void)setDictionary:(id)a3 suite:(id)a4 withCallback:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = [(COMeshAddOn *)self meshController];
    int v14 = 134218498;
    v15 = v13;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl(&dword_2217C1000, v11, OS_LOG_TYPE_DEBUG, "%p setting state %@ for suite %@", (uint8_t *)&v14, 0x20u);
  }
  v12 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 setValue:v8 forKey:v9];
  [(COStateAddOn *)self sendStateUpdates:v12 removals:0 withCallback:v10];
}

- (void)removeKeyPaths:(id)a3 suite:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COStateAddOn removeKeyPaths:suite:withCallback:]();
  }

  v12 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 setObject:v8 forKey:v9];
  [(COStateAddOn *)self sendStateUpdates:0 removals:v12 withCallback:v10];
}

- (void)sendStateUpdates:(id)a3 removals:(id)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[COStateAddOn sendStateUpdates:removals:withCallback:]();
  }

  v12 = [[COStateUpdateRequest alloc] initWithUpdates:v8 removals:v9];
  v13 = [(COMeshAddOn *)self meshController];

  if (v13) {
    [(COStateAddOn *)self _sendRequest:v12 withRetryCount:5 withCallback:v10];
  }
  else {
    [(COStateAddOn *)self _handleUpdates:v8 removals:v9];
  }
}

- (void)_sendRequest:(id)a3 withRetryCount:(int64_t)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (a4 <= 0)
  {
    v13 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[COStateAddOn _sendRequest:withRetryCount:withCallback:]((uint64_t)v8, v13);
    }

    int v14 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4002 userInfo:0];
    v9[2](v9, v14);
  }
  else
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke;
    v15[3] = &unk_2645CD860;
    objc_copyWeak(v18, &location);
    id v10 = v8;
    id v16 = v10;
    v18[1] = (id)a4;
    id v17 = v9;
    v11 = (void *)MEMORY[0x223C8B4A0](v15);
    v12 = [(COMeshAddOn *)self meshController];
    [v12 sendRequest:v10 withCompletionHandler:v11];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

void __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a5)
    {
      id v8 = COCoreLogForCategory(6);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke_cold_1(a1, v8);
      }

      [WeakRetained _sendRequest:*(void *)(a1 + 32) withRetryCount:*(void *)(a1 + 56) - 1 withCallback:*(void *)(a1 + 40)];
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) updates];
      id v10 = [*(id *)(a1 + 32) removals];
      [WeakRetained _handleUpdates:v9 removals:v10];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)_handleUpdates:(id)a3 removals:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v56 = a4;
  id v7 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v92 = self;
    __int16 v93 = 2112;
    id v94 = v6;
    __int16 v95 = 2112;
    id v96 = v56;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p handling updates %@ and removals %@", buf, 0x20u);
  }

  id v8 = [(COStateAddOn *)self meshState];
  v60 = (NSDictionary *)[v8 mutableCopy];

  unint64_t v9 = 0x263EFF000uLL;
  v54 = [MEMORY[0x263EFF9A0] dictionary];
  v53 = [MEMORY[0x263EFF9A0] dictionary];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = [v6 allKeys];
  v69 = v6;
  v70 = self;
  uint64_t v57 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v84;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v84 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v83 + 1) + 8 * (void)v10);
        v12 = [(COStateAddOn *)self meshState];
        v13 = [v12 objectForKeyedSubscript:v11];
        v58 = v10;
        if (v13)
        {
          int v14 = [(COStateAddOn *)self meshState];
          v15 = [v14 objectForKeyedSubscript:v11];
          v63 = (void *)[v15 mutableCopy];

          unint64_t v9 = 0x263EFF000;
        }
        else
        {
          v63 = [MEMORY[0x263EFF9A0] dictionary];
        }

        v61 = [*(id *)(v9 + 2464) dictionary];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v16 = v69;
        id v17 = [v69 objectForKeyedSubscript:v11];
        __int16 v18 = [v17 allKeys];

        id v65 = v18;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v79 objects:v89 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v67 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v80 != v67) {
                objc_enumerationMutation(v65);
              }
              uint64_t v22 = *(void *)(*((void *)&v79 + 1) + 8 * i);
              v23 = [(COStateAddOn *)self meshState];
              v24 = [v23 objectForKeyedSubscript:v11];
              v25 = [v24 objectForKeyedSubscript:v22];
              v26 = [v16 objectForKeyedSubscript:v11];
              v27 = [v26 objectForKeyedSubscript:v22];
              char v28 = [v25 isEqual:v27];

              id v16 = v69;
              if ((v28 & 1) == 0)
              {
                v29 = [v69 objectForKeyedSubscript:v11];
                v30 = [v29 objectForKeyedSubscript:v22];
                [v61 setObject:v30 forKey:v22];

                v31 = [v69 objectForKeyedSubscript:v11];
                v32 = [v31 objectForKeyedSubscript:v22];
                [v63 setObject:v32 forKey:v22];
              }
              self = v70;
            }
            uint64_t v20 = [v65 countByEnumeratingWithState:&v79 objects:v89 count:16];
          }
          while (v20);
        }

        if ([v61 count]) {
          [v54 setObject:v61 forKey:v11];
        }
        [(NSDictionary *)v60 setObject:v63 forKey:v11];

        id v10 = v58 + 1;
        unint64_t v9 = 0x263EFF000uLL;
      }
      while (v58 + 1 != (char *)v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    }
    while (v57);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v59 = [v56 allKeys];
  uint64_t v64 = [v59 countByEnumeratingWithState:&v75 objects:v88 count:16];
  if (v64)
  {
    uint64_t v62 = *(void *)v76;
    do
    {
      v33 = 0;
      do
      {
        if (*(void *)v76 != v62) {
          objc_enumerationMutation(v59);
        }
        uint64_t v34 = *(void *)(*((void *)&v75 + 1) + 8 * (void)v33);
        v35 = [(COStateAddOn *)self meshState];
        v36 = [v35 objectForKeyedSubscript:v34];
        v66 = v33;
        if (v36)
        {
          v37 = [(COStateAddOn *)self meshState];
          v38 = [v37 objectForKeyedSubscript:v34];
          v68 = (void *)[v38 mutableCopy];
        }
        else
        {
          v68 = [*(id *)(v9 + 2464) dictionary];
        }

        v39 = [MEMORY[0x263EFF9C0] set];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v40 = [v56 objectForKeyedSubscript:v34];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v87 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v72 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*((void *)&v71 + 1) + 8 * j);
              v46 = [(COStateAddOn *)self meshState];
              v47 = [v46 objectForKeyedSubscript:v34];
              v48 = [v47 objectForKeyedSubscript:v45];

              if (v48)
              {
                [v39 addObject:v45];
                [v68 removeObjectForKey:v45];
              }
              self = v70;
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v71 objects:v87 count:16];
          }
          while (v42);
        }

        if ([v39 count]) {
          [v53 setObject:v39 forKey:v34];
        }
        [(NSDictionary *)v60 setObject:v68 forKey:v34];

        v33 = v66 + 1;
        unint64_t v9 = 0x263EFF000;
      }
      while (v66 + 1 != (char *)v64);
      uint64_t v64 = [v59 countByEnumeratingWithState:&v75 objects:v88 count:16];
    }
    while (v64);
  }

  meshState = self->_meshState;
  self->_meshState = v60;

  if ([v54 count] || objc_msgSend(v53, "count"))
  {
    v50 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v92 = self;
      __int16 v93 = 2112;
      id v94 = v54;
      __int16 v95 = 2112;
      id v96 = v53;
      _os_log_impl(&dword_2217C1000, v50, OS_LOG_TYPE_DEFAULT, "%p informing delegates of changes. Updates Diff = %@ and Removals Diff %@", buf, 0x20u);
    }

    v51 = [(COStateAddOn *)self delegate];
    [v51 addOn:self receivedUpdates:v54 removals:v53];
  }
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 3)
  {
    id v8 = [v6 me];
    unint64_t v9 = [v7 leader];
    int v10 = [v8 isEqual:v9];

    if (v10) {
      [(COStateAddOn *)self _constructMeshState];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)COStateAddOn;
  [(COMeshAddOn *)&v11 meshController:v7 didTransitionToState:a4];
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COStateAddOn;
  [(COMeshAddOn *)&v14 didAddToMeshController:v4];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__COStateAddOn_didAddToMeshController___block_invoke;
  v11[3] = &unk_2645CB778;
  objc_copyWeak(&v12, &location);
  [v4 registerHandler:v11 forRequestClass:objc_opt_class()];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_2;
  v9[3] = &unk_2645CB778;
  objc_copyWeak(&v10, &location);
  [v4 registerHandler:v9 forRequestClass:objc_opt_class()];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_3;
  v7[3] = &unk_2645CB7C8;
  objc_copyWeak(&v8, &location);
  [v4 registerHandler:v7 forNotificationClass:objc_opt_class()];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_4;
  v5[3] = &unk_2645CB7C8;
  objc_copyWeak(&v6, &location);
  [v4 registerHandler:v5 forNotificationClass:objc_opt_class()];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__COStateAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleStateReadRequest:v8 callback:v5];
  }
}

void __39__COStateAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleStateUpdateRequest:v8 callback:v5];
  }
}

void __39__COStateAddOn_didAddToMeshController___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleStateNotification:v5];
  }
}

void __39__COStateAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleStateUpdateNotification:v5];
  }
}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4 = a3;
  [v4 deregisterHandlerForRequestClass:objc_opt_class()];
  [v4 deregisterHandlerForRequestClass:objc_opt_class()];
  [v4 deregisterHandlerForNotificationClass:objc_opt_class()];
  [v4 deregisterHandlerForNotificationClass:objc_opt_class()];
  v5.receiver = self;
  v5.super_class = (Class)COStateAddOn;
  [(COMeshAddOn *)&v5 willRemoveFromMeshController:v4];
}

- (void)didChangeNodesForMeshController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(COMeshAddOn *)self meshController];
  id v6 = [v5 me];
  id v7 = [(COMeshAddOn *)self meshController];
  id v8 = [v7 leader];
  int v9 = [v6 isEqual:v8];

  if (v9) {
    [(COStateAddOn *)self _constructMeshState];
  }
  v10.receiver = self;
  v10.super_class = (Class)COStateAddOn;
  [(COMeshAddOn *)&v10 didChangeNodesForMeshController:v4];
}

- (void)_constructMeshState
{
  uint64_t v3 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v3);

  ++self->_stateConstructionGeneration;
  self->_isConstructingState = 1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__19;
  void v11[4] = __Block_byref_object_dispose__19;
  id v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__19;
  v8[4] = __Block_byref_object_dispose__19;
  id v9 = 0;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__COStateAddOn__constructMeshState__block_invoke;
  v5[3] = &unk_2645CD928;
  objc_copyWeak(&v6, &location);
  void v5[4] = v8;
  v5[5] = v11;
  v5[6] = v10;
  [WeakRetained stateForAddOn:self withCallback:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
}

void __35__COStateAddOn__constructMeshState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained meshControllerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__COStateAddOn__constructMeshState__block_invoke_2;
    v7[3] = &unk_2645CD900;
    uint64_t v10 = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v5;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    long long v11 = *(_OWORD *)(a1 + 40);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v12);
  }
}

void __35__COStateAddOn__constructMeshState__block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_super v5 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 40) meshController];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 32);
    *(_DWORD *)buf = 134218498;
    v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p constructing mesh post election. Self state = %@. generation = %lu ", buf, 0x20u);
  }
  id v9 = objc_alloc_init(COStateReadRequest);
  uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 32);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __35__COStateAddOn__constructMeshState__block_invoke_37;
  v23[3] = &unk_2645CD888;
  objc_copyWeak(v24, (id *)(a1 + 72));
  v23[4] = *(void *)(a1 + 48);
  v24[1] = v10;
  long long v11 = (void (**)(void))MEMORY[0x223C8B4A0](v23);
  id v12 = [*(id *)(a1 + 40) meshController];
  BOOL v13 = v12 == 0;

  if (v13) {
    v11[2](v11);
  }
  objc_super v14 = [*(id *)(a1 + 40) meshController];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __35__COStateAddOn__constructMeshState__block_invoke_38;
  v19[3] = &unk_2645CD8B0;
  long long v21 = *(_OWORD *)(a1 + 56);
  objc_copyWeak(&v22, (id *)(a1 + 72));
  v15 = v11;
  id v20 = v15;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __35__COStateAddOn__constructMeshState__block_invoke_2_40;
  v17[3] = &unk_2645CD8D8;
  objc_copyWeak(v18, (id *)(a1 + 72));
  uint64_t v16 = *(void *)(a1 + 48);
  v17[4] = *(void *)(a1 + 64);
  v17[5] = v16;
  v18[1] = v10;
  [v14 broadcastRequest:v9 includingSelf:0 recipientsCallback:v19 completionHandler:v17];

  objc_destroyWeak(v18);
  objc_destroyWeak(&v22);

  objc_destroyWeak(v24);
}

void __35__COStateAddOn__constructMeshState__block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __35__COStateAddOn__constructMeshState__block_invoke_37_cold_1(v3);
    }

    id v4 = [[COStateNotification alloc] initWithState:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    [WeakRetained _handleStateNotification:v4];
    if (WeakRetained[4] == *(void *)(a1 + 48)) {
      [WeakRetained _processOutstandingUpdateRequests];
    }
  }
}

void __35__COStateAddOn__constructMeshState__block_invoke_38(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && ![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __35__COStateAddOn__constructMeshState__block_invoke_2_40(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a5)
    {
      long long v11 = COCoreLogForCategory(6);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __35__COStateAddOn__constructMeshState__block_invoke_2_40_cold_1((uint64_t)v8, v11);
      }
    }
    else
    {
      id v37 = v9;
      id v12 = [v9 state];
      BOOL v13 = COCoreLogForCategory(6);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = [WeakRetained meshController];
        uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - 1;
        *(_DWORD *)buf = 134218754;
        uint64_t v55 = v34;
        __int16 v56 = 2048;
        id v57 = v8;
        __int16 v58 = 2112;
        id v59 = v12;
        __int16 v60 = 2048;
        uint64_t v61 = v35;
        _os_log_debug_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEBUG, "%p received COStateReadResponse from %p. Response state = %@. Waiting for %lu more responses", buf, 0x2Au);
      }
      v36 = WeakRetained;
      id v38 = v8;

      uint64_t v43 = v12;
      objc_super v14 = [v12 allKeys];
      uint64_t v42 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mutableCopy];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      obuint64_t j = v14;
      uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v40 = *(void *)v49;
        uint64_t v41 = a1;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v49 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v18, v36);
            if (v19)
            {
              id v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v18];
              long long v21 = (void *)[v20 mutableCopy];
            }
            else
            {
              long long v21 = [MEMORY[0x263EFF9A0] dictionary];
            }

            id v22 = [v43 objectForKeyedSubscript:v18];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v45 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                  uint64_t v28 = [v22 objectForKeyedSubscript:v27];
                  [v21 setObject:v28 forKey:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v24);
            }
            [v42 setObject:v21 forKey:v18];

            a1 = v41;
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v16);
      }

      uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v42;

      id v9 = v37;
      id v8 = v38;
      id WeakRetained = v36;
      long long v11 = v43;
    }

    if (!--*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      [WeakRetained _broadcastMeshState:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      if (WeakRetained[4] == *(void *)(a1 + 56))
      {
        uint64_t v31 = COCoreLogForCategory(6);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [WeakRetained meshController];
          v33 = [v32 meshName];
          *(_DWORD *)buf = 138412290;
          uint64_t v55 = v33;
          _os_log_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEFAULT, "Done with all outstanding mesh constructions %@, processing outstanding update requests if any", buf, 0xCu);
        }
        [WeakRetained _processOutstandingUpdateRequests];
      }
    }
  }
}

- (void)_processOutstandingUpdateRequests
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v3);

  self->_isConstructingState = 0;
  id v4 = [MEMORY[0x263EFF980] array];
  if ([(NSMutableArray *)self->_outstandingUpdateRequests count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = self->_outstandingUpdateRequests;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }
  }
  [(NSMutableArray *)self->_outstandingUpdateRequests removeAllObjects];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        uint64_t v16 = [v15 request];
        id v17 = [v15 callback];
        [(COStateAddOn *)self _handleStateUpdateRequest:v16 callback:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v12);
  }

  uint64_t v18 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "Done processing outstanding update requests", v19, 2u);
  }
}

- (void)_broadcastMeshState:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [[COStateNotification alloc] initWithState:v4];
  uint64_t v7 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "Sending state notification to all clients", v9, 2u);
  }

  uint64_t v8 = [(COMeshAddOn *)self meshController];
  [v8 sendNotification:v6];

  [(COStateAddOn *)self _handleStateNotification:v6];
}

- (void)_handleStateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 state];

  uint64_t v7 = [(COStateAddOn *)self meshState];
  char v8 = [v7 isEqualToDictionary:v6];

  if (v8)
  {
    id v9 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(COMeshAddOn *)self meshController];
      uint64_t v11 = [(COStateAddOn *)self meshState];
      *(_DWORD *)buf = 134218242;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_2217C1000, v9, OS_LOG_TYPE_DEFAULT, "%p handling state notification. No changes to current mesh state %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [(COStateAddOn *)self meshState];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__COStateAddOn__handleStateNotification___block_invoke;
    v13[3] = &unk_2645CD950;
    v13[4] = self;
    id v14 = v6;
    determineStateChanges(v12, v14, v13);
  }
}

void __41__COStateAddOn__handleStateNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = COCoreLogForCategory(6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [*(id *)(a1 + 32) meshController];
    id v9 = [*(id *)(a1 + 32) meshState];
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 134218498;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p handling state notification. Updating current mesh state %@ with new mesh state %@", (uint8_t *)&v12, 0x20u);
  }
  [*(id *)(a1 + 32) setMeshState:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained addOn:*(void *)(a1 + 32) receivedUpdates:v6 removals:v5];
}

- (void)_handleStateUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v5);

  id v7 = [v4 updates];
  id v6 = [v4 removals];

  [(COStateAddOn *)self _handleUpdates:v7 removals:v6];
}

- (void)_handleStateReadRequest:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v6);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__COStateAddOn__handleStateReadRequest_callback___block_invoke;
  v9[3] = &unk_2645CD978;
  id v10 = v5;
  id v8 = v5;
  [WeakRetained stateForAddOn:self withCallback:v9];
}

void __49__COStateAddOn__handleStateReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[COStateReadResponse alloc] initWithState:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleStateUpdateRequest:(id)a3 callback:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, COOutstandingRequests *, void))a4;
  id v8 = [(COMeshAddOn *)self meshControllerQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(COMeshAddOn *)self meshController];
  id v10 = [v9 me];
  uint64_t v11 = [(COMeshAddOn *)self meshController];
  int v12 = [v11 leader];
  char v13 = [v10 isEqual:v12];

  if (v13)
  {
    __int16 v14 = COCoreLogForCategory(6);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 updates];
      __int16 v16 = [v6 removals];
      int v27 = 134218498;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      __int16 v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p leader processing state update request [updates = %@, removals = %@]", (uint8_t *)&v27, 0x20u);
    }
    if (self->_isConstructingState)
    {
      uint64_t v17 = COCoreLogForCategory(6);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_2217C1000, v17, OS_LOG_TYPE_DEFAULT, "We are currently in the middle of constructing the mesh state. Defering update requests", (uint8_t *)&v27, 2u);
      }

      uint64_t v18 = objc_alloc_init(COOutstandingRequests);
      [(COOutstandingRequests *)v18 setRequest:v6];
      [(COOutstandingRequests *)v18 setCallback:v7];
      [(NSMutableArray *)self->_outstandingUpdateRequests addObject:v18];
    }
    else
    {
      uint64_t v18 = objc_alloc_init(COStateUpdateResponse);
      v7[2](v7, v18, 0);
      long long v20 = [COStateUpdateNotification alloc];
      long long v21 = [v6 updates];
      long long v22 = [v6 removals];
      long long v23 = [(COStateUpdateNotification *)v20 initWithUpdates:v21 removals:v22];

      long long v24 = [(COMeshAddOn *)self meshController];
      [v24 sendNotification:v23];

      long long v25 = [v6 updates];
      long long v26 = [v6 removals];
      [(COStateAddOn *)self _handleUpdates:v25 removals:v26];
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4002 userInfo:0];
    ((void (**)(id, COOutstandingRequests *, void *))v7)[2](v7, 0, v19);
  }
}

- (NSDictionary)meshState
{
  return self->_meshState;
}

- (void)setMeshState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outstandingUpdateRequests, 0);
}

- (void)removeKeyPaths:suite:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "Removing keyPath %@ for suite %@");
}

- (void)sendStateUpdates:removals:withCallback:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_2217C1000, v0, v1, "Updating state of the mesh. updates = %@ removals = %@");
}

- (void)_sendRequest:(uint64_t)a1 withRetryCount:(NSObject *)a2 withCallback:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "Failed to send request %@ too many times", (uint8_t *)&v2, 0xCu);
}

void __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56) - 1;
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "Failed to send request %@.  Remaining retries = %ld", (uint8_t *)&v4, 0x16u);
}

void __35__COStateAddOn__constructMeshState__block_invoke_37_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "We are the only ones in the mesh", v1, 2u);
}

void __35__COStateAddOn__constructMeshState__block_invoke_2_40_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2217C1000, a2, OS_LOG_TYPE_ERROR, "Failed to get state from node %@", (uint8_t *)&v2, 0xCu);
}

@end