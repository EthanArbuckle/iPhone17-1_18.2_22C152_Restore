@interface COMessagingAddOn
- (BOOL)isTimerEnabled;
- (COMessagingAddOn)init;
- (COMessagingAddOnDelegate)delegate;
- (NSMutableArray)queuedIncomingRequests;
- (OS_dispatch_source)timer;
- (void)_configureTimer;
- (void)_handleRequest:(id)a3 callback:(id)a4;
- (void)_timerFired;
- (void)_timerRequestAdded:(id)a3;
- (void)_withLock:(id)a3;
- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 completionHandler:(id)a5;
- (void)didAddToMeshController:(id)a3;
- (void)didChangeNodesForMeshController:(id)a3;
- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setTimerEnabled:(BOOL)a3;
- (void)willRemoveFromMeshController:(id)a3;
@end

@implementation COMessagingAddOn

- (COMessagingAddOn)init
{
  v9.receiver = self;
  v9.super_class = (Class)COMessagingAddOn;
  v2 = [(COMeshAddOn *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    queuedIncomingRequests = v3->_queuedIncomingRequests;
    v3->_queuedIncomingRequests = (NSMutableArray *)v4;

    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v6;

    [(COMessagingAddOn *)v3 _configureTimer];
  }
  return v3;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COMessagingAddOnDelegate)delegate
{
  uint64_t v5 = 0;
  dispatch_source_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__30;
  objc_super v9 = __Block_byref_object_dispose__30;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__COMessagingAddOn_delegate__block_invoke;
  v4[3] = &unk_2645CAE08;
  v4[4] = self;
  v4[5] = &v5;
  [(COMessagingAddOn *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMessagingAddOnDelegate *)v2;
}

uint64_t __28__COMessagingAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
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
  v6[2] = __32__COMessagingAddOn_setDelegate___block_invoke;
  v6[3] = &unk_2645CAE80;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(COMessagingAddOn *)self _withLock:v6];
}

void __32__COMessagingAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  LOBYTE(v2) = [v2 isEqual:WeakRetained];

  if ((v2 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id *)(*(void *)(a1 + 40) + 32);
    objc_storeWeak(v5, v4);
  }
}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(COMeshAddOn *)self meshController];
  v12 = v11;
  if (!v9)
  {
    [v11 sendRequest:v8 withCompletionHandler:v10];

    goto LABEL_28;
  }
  v13 = [v11 nodeForMe];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v32 = v9;
  obuint64_t j = v9;
  uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v40) {
    goto LABEL_26;
  }
  uint64_t v14 = *(void *)v46;
  id v37 = v8;
  uint64_t v38 = *MEMORY[0x263F33DD8];
  v35 = self;
  id v36 = v10;
  uint64_t v33 = *(void *)v46;
  v34 = v13;
  do
  {
    for (uint64_t i = 0; i != v40; ++i)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 8 * i);
      v17 = objc_msgSend(v13, "memberSnapshot", v32);
      v18 = [v17 member];
      int v19 = [v18 isEqualToMember:v16];

      if (v19)
      {
        id v20 = v13;
        if (v20) {
          goto LABEL_9;
        }
      }
      else
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v22 = [(COMeshAddOn *)self meshController];
        v23 = [v22 nodes];

        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v42;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              v29 = [v28 memberSnapshot];
              v30 = [v29 member];
              int v31 = [v30 isEqualToMember:v16];

              if (v31)
              {
                id v20 = v28;
                goto LABEL_20;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v25) {
              continue;
            }
            break;
          }
          id v20 = 0;
LABEL_20:
          id v10 = v36;
          id v8 = v37;
          v13 = v34;
          self = v35;
          uint64_t v14 = v33;
        }
        else
        {
          id v20 = 0;
        }

        if (v20)
        {
LABEL_9:
          v21 = [(COMeshAddOn *)self meshController];
          [v21 sendRequest:v8 toPeer:v20 withCompletionHandler:v10];
          goto LABEL_24;
        }
      }
      v21 = [MEMORY[0x263F087E8] errorWithDomain:v38 code:-1111 userInfo:0];
      (*((void (**)(id, id, void, void, void *))v10 + 2))(v10, v8, 0, 0, v21);
LABEL_24:
    }
    uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  }
  while (v40);
LABEL_26:

  id v9 = v32;
LABEL_28:
}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(COMeshAddOn *)self meshController];
  [v11 broadcastRequest:v10 includingSelf:1 recipientsCallback:v9 completionHandler:v8];
}

- (void)didAddToMeshController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COMessagingAddOn;
  [(COMeshAddOn *)&v8 didAddToMeshController:v4];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__COMessagingAddOn_didAddToMeshController___block_invoke;
  v5[3] = &unk_2645CB778;
  objc_copyWeak(&v6, &location);
  [v4 registerHandler:v5 forRequestClass:objc_opt_class()];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__COMessagingAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleRequest:v8 callback:v5];
  }
}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4 = a3;
  [v4 deregisterHandlerForRequestClass:objc_opt_class()];
  id v5 = [(COMessagingAddOn *)self timer];
  dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  [(COMessagingAddOn *)self setTimerEnabled:0];
  v6.receiver = self;
  v6.super_class = (Class)COMessagingAddOn;
  [(COMeshAddOn *)&v6 willRemoveFromMeshController:v4];
}

- (void)didChangeNodesForMeshController:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)COMessagingAddOn;
  [(COMeshAddOn *)&v29 didChangeNodesForMeshController:a3];
  id v4 = [(COMeshAddOn *)self meshController];
  id v5 = [v4 nodes];

  v22 = [MEMORY[0x263EFF980] array];
  v23 = self;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(COMessagingAddOn *)self queuedIncomingRequests];
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v7 = 134218242;
    long long v20 = v7;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "senderNode", v20);
        if ([v5 containsObject:v12])
        {
          v13 = [v12 memberSnapshot];
          if (v13)
          {
            uint64_t v14 = COCoreLogForCategory(10);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = [v11 request];
              *(_DWORD *)buf = v20;
              int v31 = v23;
              __int16 v32 = 2112;
              uint64_t v33 = v15;
              _os_log_impl(&dword_2217C1000, v14, OS_LOG_TYPE_DEFAULT, "%p Add-on found a snapshot for queued request %@", buf, 0x16u);
            }
            uint64_t v16 = [(COMessagingAddOn *)v23 delegate];
            v17 = [v11 request];
            v18 = [v11 callback];
            [v16 addOn:v23 receivedRequest:v17 callback:v18];

            [v22 addObject:v11];
            uint64_t v9 = v21;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v8);
  }

  int v19 = [(COMessagingAddOn *)v23 queuedIncomingRequests];
  [v19 removeObjectsInArray:v22];
}

- (void)_handleRequest:(id)a3 callback:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v7 = a4;
  uint64_t v8 = [v6 sender];
  uint64_t v9 = [v8 memberSnapshot];
  if (v9)
  {
    id v10 = [(COMessagingAddOn *)self delegate];
    [(COMessagingQueuedIncomingRequest *)v10 addOn:self receivedRequest:v6 callback:v7];
  }
  else
  {
    id v10 = [[COMessagingQueuedIncomingRequest alloc] initWithRequest:v6 callback:v7];

    id v11 = [(COMessagingAddOn *)self queuedIncomingRequests];
    [v11 addObject:v10];

    [(COMessagingAddOn *)self _timerRequestAdded:v10];
    long long v7 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218498;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_2217C1000, v7, OS_LOG_TYPE_DEFAULT, "%p Add-on received a request %@ from node %@ with missing snapshot. Enqueuing request", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)_configureTimer
{
  uint64_t v3 = [(COMessagingAddOn *)self timer];
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  [(COMessagingAddOn *)self setTimerEnabled:0];
  objc_initWeak(&location, self);
  id v4 = [(COMessagingAddOn *)self timer];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __35__COMessagingAddOn__configureTimer__block_invoke;
  uint64_t v9 = &unk_2645CB2E0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  id v5 = [(COMessagingAddOn *)self timer];
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__COMessagingAddOn__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained meshControllerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__COMessagingAddOn__configureTimer__block_invoke_2;
    block[3] = &unk_2645CB288;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __35__COMessagingAddOn__configureTimer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerFired];
}

- (void)_timerFired
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a2 + 24);
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2217C1000, log, OS_LOG_TYPE_DEBUG, "%p cleanup timer reconfiguring to %llu", (uint8_t *)&v4, 0x16u);
}

void __31__COMessagingAddOn__timerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 remainingTimeUsingCurrentTime:*(void *)(a1 + 56)];
  if (v4 < 1)
  {
    uint64_t v9 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __31__COMessagingAddOn__timerFired__block_invoke_cold_1(a1, v3, v9);
    }

    id v10 = [MEMORY[0x263F087E8] errorWithDomain:@"COMeshNodeErrorDomain" code:-4000 userInfo:0];
    id v11 = [v3 callback];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v10);

    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    if (v6 >= v4) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = *(void *)(v5 + 24);
    }
    if (v6) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v4;
    }
    *(void *)(v5 + 24) = v8;
  }
}

- (void)_timerRequestAdded:(id)a3
{
  if (![(COMessagingAddOn *)self isTimerEnabled])
  {
    uint64_t v4 = COCoreLogForCategory(10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[COMessagingAddOn _timerRequestAdded:]((uint64_t)self, v4);
    }

    [(COMessagingAddOn *)self setTimerEnabled:1];
    uint64_t v5 = [(COMessagingAddOn *)self timer];
    dispatch_time_t v6 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (NSMutableArray)queuedIncomingRequests
{
  return self->_queuedIncomingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedIncomingRequests, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __31__COMessagingAddOn__timerFired__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 request];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "%p enqueued request %@ expired before being passed to a node", (uint8_t *)&v6, 0x16u);
}

- (void)_timerRequestAdded:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x4072C00000000000;
  _os_log_debug_impl(&dword_2217C1000, a2, OS_LOG_TYPE_DEBUG, "%p enabling cleanup timer for %f seconds.", (uint8_t *)&v2, 0x16u);
}

@end