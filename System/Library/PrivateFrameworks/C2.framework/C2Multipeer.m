@interface C2Multipeer
- (C2Multipeer)initWithChunkDelegate:(id)a3;
- (C2Multipeer)initWithChunkDelegate:(id)a3 createListener:(BOOL)a4;
- (C2MultipeerChunkDelegate)chunkDelegate;
- (C2MultipeerDiscovery)listener;
- (NSMutableDictionary)clientConnectionByPeer;
- (NSMutableDictionary)clientContextByRequestUUID;
- (NSMutableDictionary)serverConnectionByPeer;
- (OS_dispatch_queue)chunkDelegateQueue;
- (OS_dispatch_queue)queue;
- (void)addClientConnection:(id)a3 peerID:(id)a4;
- (void)addServerConnection:(id)a3 peerID:(id)a4;
- (void)discoverChunkSignature:(id)a3 forContainerIdentifier:(id)a4 chunkDataCallback:(id)a5;
- (void)setChunkDelegate:(id)a3;
- (void)setChunkDelegateQueue:(id)a3;
- (void)setClientConnectionByPeer:(id)a3;
- (void)setClientContextByRequestUUID:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerConnectionByPeer:(id)a3;
@end

@implementation C2Multipeer

- (C2Multipeer)initWithChunkDelegate:(id)a3 createListener:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)C2Multipeer;
  v8 = [(C2Multipeer *)&v25 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("c2.multipeer", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    if (v4)
    {
      v12 = [[C2MultipeerDiscovery alloc] initWithParent:v8];
      listener = v8->_listener;
      v8->_listener = v12;
    }
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clientConnectionByPeer = v8->_clientConnectionByPeer;
    v8->_clientConnectionByPeer = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serverConnectionByPeer = v8->_serverConnectionByPeer;
    v8->_serverConnectionByPeer = v16;

    objc_storeStrong((id *)&v8->_chunkDelegate, a3);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("c2.multipeer.delegateQueue", v18);
    chunkDelegateQueue = v8->_chunkDelegateQueue;
    v8->_chunkDelegateQueue = (OS_dispatch_queue *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clientContextByRequestUUID = v8->_clientContextByRequestUUID;
    v8->_clientContextByRequestUUID = v21;
  }
  if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_10);
  }
  v23 = C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v8;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1DD523000, v23, OS_LOG_TYPE_DEFAULT, "[%@ initWithChunkDelegate:%@]", buf, 0x16u);
  }

  return v8;
}

uint64_t __52__C2Multipeer_initWithChunkDelegate_createListener___block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (C2Multipeer)initWithChunkDelegate:(id)a3
{
  return [(C2Multipeer *)self initWithChunkDelegate:a3 createListener:1];
}

- (void)addClientConnection:(id)a3 peerID:(id)a4
{
  clientConnectionByPeer = self->_clientConnectionByPeer;
  id v6 = a3;
  [(NSMutableDictionary *)clientConnectionByPeer setObject:v6 forKeyedSubscript:a4];
  [v6 startConnection];
}

- (void)addServerConnection:(id)a3 peerID:(id)a4
{
  serverConnectionByPeer = self->_serverConnectionByPeer;
  id v6 = a3;
  [(NSMutableDictionary *)serverConnectionByPeer setObject:v6 forKeyedSubscript:a4];
  [v6 startConnection];
}

- (void)discoverChunkSignature:(id)a3 forContainerIdentifier:(id)a4 chunkDataCallback:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(C2MultipeerClientContext);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v12 = [(C2MultipeerClientContext *)v11 osActivity];
  os_activity_scope_enter(v12, &state);

  if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_9);
  }
  v13 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = _Block_copy(v10);
    *(_DWORD *)buf = 138413058;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2048;
    v34 = v15;
    _os_log_impl(&dword_1DD523000, v14, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p]", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_10;
  block[3] = &unk_1E6CCC5E8;
  block[4] = self;
  id v22 = v8;
  id v23 = v9;
  v24 = v11;
  id v25 = v10;
  id v17 = v10;
  v18 = v11;
  id v19 = v9;
  id v20 = v8;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_10(uint64_t a1)
{
  v75[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 16) touch];
  v39 = objc_alloc_init(C2MultipeerDiscoveryRequest);
  v3 = [MEMORY[0x1E4F29128] UUID];
  [(C2MultipeerDiscoveryRequest *)v39 setRequestUUID:v3];

  [(C2MultipeerDiscoveryRequest *)v39 setChunkSignature:*(void *)(a1 + 40)];
  [(C2MultipeerDiscoveryRequest *)v39 setContainerIdentifier:*(void *)(a1 + 48)];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [*(id *)(a1 + 56) setDiscoveryPeers:v4];

  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 56));
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2;
  v52[3] = &unk_1E6CCC598;
  v52[4] = *v2;
  objc_copyWeak(&v57, &location);
  id v53 = *(id *)(a1 + 40);
  id v54 = *(id *)(a1 + 48);
  id v56 = *(id *)(a1 + 64);
  id v55 = *(id *)(a1 + 56);
  [*(id *)(a1 + 56) setChunkDataCallback:v52];
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    id v51 = 0;
    v38 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v51, &v57);
    id v5 = v51;
    uint64_t v35 = (void (**)(void, void, void))v5;
    if (!v38 || v5)
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_35_1);
      }
      __int16 v29 = C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v35;
        _os_log_impl(&dword_1DD523000, v29, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
      }
      id v30 = [*(id *)(a1 + 56) chunkDataCallback];

      if (!v30) {
        goto LABEL_30;
      }
      id v25 = [*(id *)(a1 + 56) chunkDataCallback];
      __int16 v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v73 = @"failed to encode request";
      id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      __int16 v33 = [v31 errorWithDomain:@"C2MultipeerErrorDomain" code:401 userInfo:v32];
      ((void (**)(void, void, void *))v25)[2](v25, 0, v33);
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = *(void **)(*(void *)(a1 + 32) + 40);
      id v8 = [(C2MultipeerDiscoveryRequest *)v39 requestUUID];
      [v7 setObject:v6 forKeyedSubscript:v8];

      [*(id *)(a1 + 56) startTimerOnQueue:*(void *)(*(void *)(a1 + 32) + 8)];
      [*(id *)(a1 + 56) resetTimerForDiscovery];
      long long v50 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      id v9 = [*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v71 count:16];
      if (v10)
      {
        uint64_t v37 = *(void *)v48;
        id obj = v9;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v48 != v37) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
            if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_41_1);
            }
            v13 = (id)C2_MULTIPEER_LOG_INTERNAL_2;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = *(void (***)(void, void, void))(a1 + 32);
              uint64_t v15 = *(void *)(a1 + 40);
              uint64_t v16 = *(void *)(a1 + 48);
              id v17 = _Block_copy(*(const void **)(a1 + 64));
              v18 = [v12 peerID];
              *(_DWORD *)buf = 138413570;
              v60 = v14;
              __int16 v61 = 2112;
              uint64_t v62 = v15;
              __int16 v63 = 2112;
              uint64_t v64 = v16;
              __int16 v65 = 2048;
              v66 = v17;
              __int16 v67 = 2112;
              v68 = v39;
              __int16 v69 = 2112;
              v70 = v18;
              _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - Sending %@ to peer %@", buf, 0x3Eu);
            }
            id v19 = [*(id *)(a1 + 56) discoveryPeers];
            id v20 = [v12 peerID];
            [v19 addObject:v20];

            v21 = [v12 oustandingDiscoveryRequestsByRequestUUID];
            id v22 = [(C2MultipeerDiscoveryRequest *)v39 requestUUID];
            [v21 addObject:v22];

            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_42;
            v40[3] = &unk_1E6CCC5C0;
            id v23 = *(void **)(a1 + 40);
            v40[4] = *(void *)(a1 + 32);
            id v41 = v23;
            id v42 = *(id *)(a1 + 48);
            id v46 = *(id *)(a1 + 64);
            v43 = v39;
            v44 = v12;
            id v45 = *(id *)(a1 + 56);
            [v12 sendMessageWithData:v38 completionHandler:v40];

            ++v11;
          }
          while (v10 != v11);
          id v9 = obj;
          uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v71 count:16];
        }
        while (v10);
      }

      if (![*(id *)(a1 + 56) hadFailedToDiscover]) {
        goto LABEL_30;
      }
      v24 = *(void **)(*(void *)(a1 + 32) + 40);
      id v25 = [(C2MultipeerDiscoveryRequest *)v39 requestUUID];
      [v24 setObject:0 forKeyedSubscript:v25];
    }
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_26);
  }
  v26 = C2_MULTIPEER_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD523000, v26, OS_LOG_TYPE_DEFAULT, "No peers to ask for chunks.", buf, 2u);
  }
  v27 = objc_msgSend(*(id *)(a1 + 56), "chunkDataCallback", &v57);

  if (v27)
  {
    uint64_t v35 = [*(id *)(a1 + 56) chunkDataCallback];
    __int16 v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    v75[0] = @"no peers to ask for chunks";
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
    id v25 = [v28 errorWithDomain:@"C2MultipeerErrorDomain" code:100 userInfo:v38];
    v35[2](v35, 0, v25);
    goto LABEL_29;
  }
LABEL_31:

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v9 = [WeakRetained osActivity];
    os_activity_scope_enter(v9, &state);

    if ([v8 hasReplied])
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_18_0);
      }
      uint64_t v10 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        v14 = *(const void **)(a1 + 64);
        uint64_t v15 = v10;
        uint64_t v16 = _Block_copy(v14);
        *(_DWORD *)buf = 138413570;
        uint64_t v37 = v12;
        __int16 v38 = 2112;
        uint64_t v39 = v11;
        __int16 v40 = 2112;
        uint64_t v41 = v13;
        __int16 v42 = 2048;
        v43 = v16;
        __int16 v44 = 2112;
        id v45 = v5;
        __int16 v46 = 2112;
        id v47 = v6;
        _os_log_impl(&dword_1DD523000, v15, OS_LOG_TYPE_DEBUG, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - already replied to chunkDataCallback, ignoring chunkData(%@), error(%@)", buf, 0x3Eu);
      }
    }
    else
    {
      if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_21_0);
      }
      v24 = (id)C2_MULTIPEER_LOG_INTERNAL_2;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 40);
        uint64_t v27 = *(void *)(a1 + 48);
        __int16 v28 = _Block_copy(*(const void **)(a1 + 64));
        mach_continuous_time();
        [*(id *)(a1 + 56) startTimestamp];
        TMConvertTicksToSeconds();
        *(_DWORD *)buf = 138413826;
        uint64_t v37 = v26;
        __int16 v38 = 2112;
        uint64_t v39 = v25;
        __int16 v40 = 2112;
        uint64_t v41 = v27;
        __int16 v42 = 2048;
        v43 = v28;
        __int16 v44 = 2112;
        id v45 = v5;
        __int16 v46 = 2112;
        id v47 = v6;
        __int16 v48 = 2048;
        uint64_t v49 = v29;
        _os_log_impl(&dword_1DD523000, v24, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - chunkDataCallback(%@, %@) after %.3f seconds", buf, 0x48u);
      }
      [v8 setHasReplied:1];
      [v8 stopTimer];
      id v30 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_22;
      block[3] = &unk_1E6CCC380;
      id v34 = *(id *)(a1 + 64);
      id v32 = v5;
      id v33 = v6;
      dispatch_async(v30, block);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_15_0);
    }
    id v17 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      v21 = *(const void **)(a1 + 64);
      id v22 = v17;
      id v23 = _Block_copy(v21);
      *(_DWORD *)buf = 138413570;
      uint64_t v37 = v18;
      __int16 v38 = 2112;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      uint64_t v41 = v20;
      __int16 v42 = 2048;
      v43 = v23;
      __int16 v44 = 2112;
      id v45 = v5;
      __int16 v46 = 2112;
      id v47 = v6;
      _os_log_impl(&dword_1DD523000, v22, OS_LOG_TYPE_ERROR, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - blockSafeClientContext unexpctedly nil, ignoring chunkData(%@), error(%@)", buf, 0x3Eu);
    }
  }
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_3()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_16()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_19()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_22(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2_24()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_33()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_39()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_2 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_2, &__block_literal_global_45);
    }
    id v4 = (void *)C2_MULTIPEER_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = *(const void **)(a1 + 80);
      id v9 = v4;
      uint64_t v10 = _Block_copy(v8);
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = [*(id *)(a1 + 64) peerID];
      int v19 = 138413826;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v3;
      _os_log_impl(&dword_1DD523000, v9, OS_LOG_TYPE_DEFAULT, "[%@ discoverChunkSignature:%@ forContainerIdentifier:%@ chunkDataCallback:%p] - Sending %@ to peer %@ encountered error %@", (uint8_t *)&v19, 0x48u);
    }
    uint64_t v13 = [*(id *)(a1 + 72) discoveryPeers];
    v14 = [*(id *)(a1 + 64) peerID];
    [v13 removeObject:v14];

    uint64_t v15 = [*(id *)(a1 + 64) oustandingDiscoveryRequestsByRequestUUID];
    uint64_t v16 = [*(id *)(a1 + 56) requestUUID];
    [v15 removeObject:v16];

    if ([*(id *)(a1 + 72) hadFailedToDiscover])
    {
      id v17 = *(void **)(*(void *)(a1 + 32) + 40);
      uint64_t v18 = [*(id *)(a1 + 56) requestUUID];
      [v17 setObject:0 forKeyedSubscript:v18];
    }
  }
}

uint64_t __79__C2Multipeer_discoverChunkSignature_forContainerIdentifier_chunkDataCallback___block_invoke_2_43()
{
  C2_MULTIPEER_LOG_INTERNAL_2 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (C2MultipeerDiscovery)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)clientConnectionByPeer
{
  return self->_clientConnectionByPeer;
}

- (void)setClientConnectionByPeer:(id)a3
{
}

- (NSMutableDictionary)serverConnectionByPeer
{
  return self->_serverConnectionByPeer;
}

- (void)setServerConnectionByPeer:(id)a3
{
}

- (NSMutableDictionary)clientContextByRequestUUID
{
  return self->_clientContextByRequestUUID;
}

- (void)setClientContextByRequestUUID:(id)a3
{
}

- (C2MultipeerChunkDelegate)chunkDelegate
{
  return self->_chunkDelegate;
}

- (void)setChunkDelegate:(id)a3
{
}

- (OS_dispatch_queue)chunkDelegateQueue
{
  return self->_chunkDelegateQueue;
}

- (void)setChunkDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chunkDelegateQueue, 0);
  objc_storeStrong((id *)&self->_chunkDelegate, 0);
  objc_storeStrong((id *)&self->_clientContextByRequestUUID, 0);
  objc_storeStrong((id *)&self->_serverConnectionByPeer, 0);
  objc_storeStrong((id *)&self->_clientConnectionByPeer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end