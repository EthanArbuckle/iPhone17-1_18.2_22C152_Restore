@interface C2MultipeerConnection
- (BOOL)isClientConnection;
- (C2Multipeer)parent;
- (C2MultipeerConnection)initWithParent:(id)a3 queue:(id)a4 peerID:(id)a5 isClientConnection:(BOOL)a6;
- (NSMutableDictionary)serverContextByRequestUUID;
- (NSMutableSet)oustandingDiscoveryRequestsByRequestUUID;
- (NSString)peerID;
- (OS_dispatch_queue)queue;
- (void)handleData:(id)a3;
- (void)handleDiscoveryRequest:(id)a3;
- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4;
- (void)setIsClientConnection:(BOOL)a3;
- (void)setOustandingDiscoveryRequestsByRequestUUID:(id)a3;
- (void)setParent:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerContextByRequestUUID:(id)a3;
- (void)stopConnection;
@end

@implementation C2MultipeerConnection

- (C2MultipeerConnection)initWithParent:(id)a3 queue:(id)a4 peerID:(id)a5 isClientConnection:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)C2MultipeerConnection;
  v13 = [(C2MultipeerConnection *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_parent, v10);
    objc_storeStrong((id *)&v14->_queue, a4);
    objc_storeStrong((id *)&v14->_peerID, a5);
    uint64_t v15 = objc_opt_new();
    oustandingDiscoveryRequestsByRequestUUID = v14->_oustandingDiscoveryRequestsByRequestUUID;
    v14->_oustandingDiscoveryRequestsByRequestUUID = (NSMutableSet *)v15;

    uint64_t v17 = objc_opt_new();
    serverContextByRequestUUID = v14->_serverContextByRequestUUID;
    v14->_serverContextByRequestUUID = (NSMutableDictionary *)v17;

    v14->_isClientConnection = a6;
  }

  return v14;
}

- (void)stopConnection
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = self->_oustandingDiscoveryRequestsByRequestUUID;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * v6);
        v8 = [(C2MultipeerConnection *)self parent];
        v9 = [v8 clientContextByRequestUUID];
        id v10 = [v9 objectForKeyedSubscript:v7];

        state.opaque[0] = 0;
        state.opaque[1] = 0;
        id v11 = [v10 osActivity];
        os_activity_scope_enter(v11, &state);

        if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
          dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_2);
        }
        id v12 = C2_MULTIPEER_LOG_INTERNAL_0;
        if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)objc_super v20 = 0;
          _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEFAULT, "_stopConnection", v20, 2u);
        }
        v13 = [v10 discoveryPeers];
        [v13 removeObject:self->_peerID];

        if ([v10 hadFailedToDiscover])
        {
          v14 = [(C2MultipeerConnection *)self parent];
          uint64_t v15 = [v14 clientContextByRequestUUID];
          [v15 setObject:0 forKeyedSubscript:v7];
        }
        os_activity_scope_leave(&state);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }

  [(NSMutableSet *)self->_oustandingDiscoveryRequestsByRequestUUID removeAllObjects];
  BOOL v16 = !self->_isClientConnection;
  uint64_t v17 = [(C2MultipeerConnection *)self parent];
  v18 = v17;
  if (v16) {
    [v17 serverConnectionByPeer];
  }
  else {
  v19 = [v17 clientConnectionByPeer];
  }
  [v19 setObject:0 forKeyedSubscript:self->_peerID];
}

uint64_t __39__C2MultipeerConnection_stopConnection__block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)sendMessageWithData:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [(C2MultipeerConnection *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"C2MultipeerConnection.m" lineNumber:49 description:@"Subclass Implementation Required."];
}

- (void)handleDiscoveryRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(C2MultipeerServerContext);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v6 = [(C2MultipeerServerContext *)v5 osActivity];
  os_activity_scope_enter(v6, &state);

  id v7 = objc_alloc_init(C2MultipeerDiscoveryResponse);
  v8 = [v4 requestUUID];
  [(C2MultipeerDiscoveryResponse *)v7 setRequestUUID:v8];

  v9 = [v4 chunkSignature];
  [(C2MultipeerDiscoveryResponse *)v7 setChunkSignature:v9];

  id v10 = [(C2MultipeerConnection *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(C2MultipeerConnection *)self parent];
  id v12 = [v11 chunkDelegateQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke;
  v16[3] = &unk_1E6CCC000;
  v16[4] = self;
  id v17 = v4;
  v18 = v5;
  v19 = v7;
  v13 = v7;
  v14 = v5;
  id v15 = v4;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke(id *a1)
{
  v2 = [a1[4] parent];
  v3 = [v2 chunkDelegate];
  id v4 = [a1[5] chunkSignature];
  uint64_t v5 = [a1[5] containerIdentifier];
  uint64_t v6 = [v3 chunkDataFromSignature:v4 forContainerIdentifier:v5];

  id v7 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2;
  block[3] = &unk_1E6CCBFD8;
  id v11 = a1[6];
  id v12 = v6;
  id v8 = a1[5];
  id v13 = a1[4];
  id v14 = v8;
  id v15 = a1[7];
  id v9 = v6;
  dispatch_async(v7, block);
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setChunkData:*(void *)(a1 + 40)];
  if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
    dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_15);
  }
  v2 = (void *)C2_MULTIPEER_LOG_INTERNAL_0;
  if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 48);
    id v4 = v2;
    uint64_t v5 = [v3 parent];
    uint64_t v6 = [*(id *)(a1 + 48) parent];
    id v7 = [v6 chunkDelegate];
    id v8 = [*(id *)(a1 + 56) chunkSignature];
    id v9 = [*(id *)(a1 + 56) containerIdentifier];
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    long long v24 = v5;
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 2112;
    v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2112;
    uint64_t v32 = v10;
    _os_log_impl(&dword_1DD523000, v4, OS_LOG_TYPE_DEFAULT, "[[%@ %@] chunkDataFromSignature:%@ forContainerIdentifier:%@] - returned %@", buf, 0x34u);
  }
  [*(id *)(a1 + 64) setChunkAvailable:*(void *)(a1 + 40) != 0];
  uint64_t v11 = *(void *)(a1 + 64);
  id v22 = 0;
  id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v22];
  id v13 = v22;
  id v14 = v13;
  if (!v12 || v13)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_19);
    }
    v19 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v24 = v14;
      _os_log_impl(&dword_1DD523000, v19, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    BOOL v16 = [*(id *)(a1 + 48) serverContextByRequestUUID];
    id v17 = [*(id *)(a1 + 56) requestUUID];
    [v16 setObject:v15 forKeyedSubscript:v17];

    v18 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_20;
    v20[3] = &unk_1E6CCBFB0;
    v20[4] = v18;
    id v21 = *(id *)(a1 + 56);
    [v18 sendMessageWithData:v12 completionHandler:v20];
  }
}

uint64_t __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_3()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_17()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_23);
    }
    id v4 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1DD523000, v4, OS_LOG_TYPE_DEFAULT, "Unable to send response with error %@", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = [*(id *)(a1 + 32) serverContextByRequestUUID];
    uint64_t v6 = [*(id *)(a1 + 40) requestUUID];
    [v5 setObject:0 forKeyedSubscript:v6];
  }
}

uint64_t __48__C2MultipeerConnection_handleDiscoveryRequest___block_invoke_2_21()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)handleData:(id)a3
{
  v97[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(C2MultipeerConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:4];
  uint64_t v9 = [v7 setWithArray:v8];
  id v84 = 0;
  uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v4 error:&v84];
  uint64_t v11 = (C2MultipeerConnection *)v84;

  if (!v10 || v11)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_32);
    }
    id v13 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v88 = self;
      __int16 v89 = 2112;
      id v90 = v4;
      __int16 v91 = 2112;
      uint64_t v92 = (uint64_t)v10;
      __int16 v93 = 2112;
      v94 = v11;
      _os_log_impl(&dword_1DD523000, v13, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - Ignoring response %@ due to error %@", buf, 0x2Au);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_35);
      }
      id v12 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v88 = self;
        __int16 v89 = 2112;
        id v90 = v4;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v10;
        __int16 v93 = 2112;
        v94 = 0;
        _os_log_impl(&dword_1DD523000, v12, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
      }
      [(C2MultipeerConnection *)self handleDiscoveryRequest:v10];
LABEL_9:
      uint64_t v11 = 0;
      goto LABEL_73;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      uint64_t v15 = [(C2MultipeerConnection *)self parent];
      BOOL v16 = [v15 clientContextByRequestUUID];
      id v17 = [v14 requestUUID];
      v76 = [v16 objectForKeyedSubscript:v17];

      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v18 = [v76 osActivity];
      os_activity_scope_enter(v18, &state);

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_38);
      }
      v19 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        mach_continuous_time();
        [v76 startTimestamp];
        TMConvertTicksToSeconds();
        *(_DWORD *)buf = 138413314;
        v88 = self;
        __int16 v89 = 2112;
        id v90 = v4;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v14;
        __int16 v93 = 2112;
        v94 = 0;
        __int16 v95 = 2048;
        uint64_t v96 = v20;
        _os_log_impl(&dword_1DD523000, v19, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@ after %.3f seconds.", buf, 0x34u);
      }

      id v21 = objc_alloc_init(C2MultipeerChunkDataRequest);
      id v22 = [v14 requestUUID];
      [(C2MultipeerChunkDataRequest *)v21 setRequestUUID:v22];

      long long v23 = [v76 discoveryPeers];
      long long v24 = [(C2MultipeerConnection *)self peerID];
      [v23 removeObject:v24];

      __int16 v25 = [(C2MultipeerConnection *)self oustandingDiscoveryRequestsByRequestUUID];
      v26 = [v14 requestUUID];
      [v25 removeObject:v26];

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_41);
      }
      __int16 v27 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(C2MultipeerConnection *)self peerID];
        __int16 v29 = [v14 requestUUID];
        v30 = [v76 discoveryPeers];
        uint64_t v31 = [v30 count];
        *(_DWORD *)buf = 138412802;
        v88 = v28;
        __int16 v89 = 2112;
        id v90 = v29;
        __int16 v91 = 2048;
        uint64_t v92 = v31;
        _os_log_impl(&dword_1DD523000, v27, OS_LOG_TYPE_DEFAULT, "Received discovery response from %@ for %@, %llu peers remaining.", buf, 0x20u);
      }
      uint64_t v32 = [v76 chunkDataRequestedFromPeer];
      BOOL v33 = v32 == 0;

      if (v33) {
        uint64_t v34 = [v14 chunkAvailable];
      }
      else {
        uint64_t v34 = 0;
      }
      [(C2MultipeerChunkDataRequest *)v21 setChunkDataRequested:v34];
      if ([v14 chunkAvailable])
      {
        id v82 = 0;
        v61 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v21 requiringSecureCoding:1 error:&v82];
        v62 = (C2MultipeerConnection *)v82;
        uint64_t v11 = v62;
        if (!v61 || v62)
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_44);
          }
          v68 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v11;
            _os_log_impl(&dword_1DD523000, v68, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
          }
        }
        else
        {
          if (v34)
          {
            v63 = [(C2MultipeerConnection *)self peerID];
            [v76 setChunkDataRequestedFromPeer:v63];

            [v76 resetTimerForChunkData];
            if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
              dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_47);
            }
            v64 = (id)C2_MULTIPEER_LOG_INTERNAL_0;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              v65 = [(C2MultipeerConnection *)self peerID];
              v66 = [v14 requestUUID];
              *(_DWORD *)buf = 138412546;
              v88 = v65;
              __int16 v89 = 2112;
              id v90 = v66;
              _os_log_impl(&dword_1DD523000, v64, OS_LOG_TYPE_DEFAULT, "Requested data from %@ for %@", buf, 0x16u);
            }
          }
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __36__C2MultipeerConnection_handleData___block_invoke_48;
          v78[3] = &unk_1E6CCC028;
          id v79 = v76;
          v80 = self;
          id v81 = v14;
          [(C2MultipeerConnection *)self sendMessageWithData:v61 completionHandler:v78];
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      if ([v76 hadFailedToDiscover])
      {
        v69 = [(C2MultipeerConnection *)self parent];
        v70 = [v69 clientContextByRequestUUID];
        v71 = [v14 requestUUID];
        [v70 setObject:0 forKeyedSubscript:v71];
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v46 = v10;
          v47 = [(C2MultipeerConnection *)self parent];
          v48 = [v47 clientContextByRequestUUID];
          v49 = [v46 requestUUID];
          v50 = [v48 objectForKeyedSubscript:v49];

          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v51 = [v50 osActivity];
          os_activity_scope_enter(v51, &state);

          if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_65);
          }
          v52 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v88 = self;
            __int16 v89 = 2112;
            id v90 = v4;
            __int16 v91 = 2112;
            uint64_t v92 = (uint64_t)v46;
            __int16 v93 = 2112;
            v94 = 0;
            _os_log_impl(&dword_1DD523000, v52, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
          }
          v53 = [(C2MultipeerConnection *)self parent];
          v54 = [v53 clientContextByRequestUUID];
          v55 = [v46 requestUUID];
          [v54 setObject:0 forKeyedSubscript:v55];

          v56 = [v50 chunkDataCallback];

          if (v56)
          {
            v57 = [v50 chunkDataCallback];
            v58 = [v46 chunkData];
            v59 = [v46 chunkData];
            if (v59)
            {
              v60 = 0;
            }
            else
            {
              v75 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v85 = *MEMORY[0x1E4F28568];
              v86 = @"chunk data response missing data.";
              v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
              v60 = [v75 errorWithDomain:@"C2MultipeerErrorDomain" code:400 userInfo:v49];
            }
            ((void (**)(void, void *, void *))v57)[2](v57, v58, v60);
            if (!v59)
            {
            }
          }
          os_activity_scope_leave(&state);
        }
        else
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_73);
          }
          v67 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v88 = self;
            __int16 v89 = 2112;
            id v90 = v4;
            __int16 v91 = 2112;
            uint64_t v92 = (uint64_t)v10;
            __int16 v93 = 2112;
            v94 = 0;
            _os_log_impl(&dword_1DD523000, v67, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received Unknown object %@ with error %@", buf, 0x2Au);
          }
        }
        goto LABEL_9;
      }
      id v35 = v10;
      v36 = [(C2MultipeerConnection *)self serverContextByRequestUUID];
      v37 = [v35 requestUUID];
      v38 = [v36 objectForKeyedSubscript:v37];

      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v39 = [v38 osActivity];
      os_activity_scope_enter(v39, &state);

      if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
        dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_53);
      }
      v40 = C2_MULTIPEER_LOG_INTERNAL_0;
      if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v88 = self;
        __int16 v89 = 2112;
        id v90 = v4;
        __int16 v91 = 2112;
        uint64_t v92 = (uint64_t)v35;
        __int16 v93 = 2112;
        v94 = 0;
        _os_log_impl(&dword_1DD523000, v40, OS_LOG_TYPE_DEFAULT, "[%@ handleData:%@] - received message %@ with error %@", buf, 0x2Au);
      }
      if ([v35 chunkDataRequested])
      {
        v41 = objc_alloc_init(C2MultipeerChunkDataResponse);
        v42 = [v35 requestUUID];
        [(C2MultipeerChunkDataResponse *)v41 setRequestUUID:v42];

        v43 = [v38 chunkData];
        [(C2MultipeerChunkDataResponse *)v41 setChunkData:v43];

        id v77 = 0;
        v44 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v41 requiringSecureCoding:1 error:&v77];
        v45 = (C2MultipeerConnection *)v77;
        uint64_t v11 = v45;
        if (!v44 || v45)
        {
          if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
            dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_56);
          }
          v72 = C2_MULTIPEER_LOG_INTERNAL_0;
          if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v11;
            _os_log_impl(&dword_1DD523000, v72, OS_LOG_TYPE_DEFAULT, "Unable to serialize request with error %@", buf, 0xCu);
          }
        }
        else
        {
          [(C2MultipeerConnection *)self sendMessageWithData:v44 completionHandler:&__block_literal_global_59];
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      v73 = [(C2MultipeerConnection *)self serverContextByRequestUUID];
      v74 = [v35 requestUUID];
      [v73 setObject:0 forKeyedSubscript:v74];

      os_activity_scope_leave(&state);
    }
  }
LABEL_73:
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_33()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_36()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_39()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_42()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_45()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __36__C2MultipeerConnection_handleData___block_invoke_48(id *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_50);
    }
    id v4 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1DD523000, v4, OS_LOG_TYPE_DEFAULT, "Unable to send request with error %@", (uint8_t *)&v8, 0xCu);
    }
    [a1[4] setChunkDataRequestedFromPeer:0];
    if ([a1[4] hadFailedToDiscover])
    {
      uint64_t v5 = [a1[5] parent];
      uint64_t v6 = [v5 clientContextByRequestUUID];
      int v7 = [a1[6] requestUUID];
      [v6 setObject:0 forKeyedSubscript:v7];
    }
  }
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_51()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_54()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

void __36__C2MultipeerConnection_handleData___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    if (C2_MULTIPEER_LOG_BLOCK_0 != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK_0, &__block_literal_global_62);
    }
    id v3 = C2_MULTIPEER_LOG_INTERNAL_0;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL_0, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1DD523000, v3, OS_LOG_TYPE_DEFAULT, "Unable to send response with error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_2_60()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_63()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__C2MultipeerConnection_handleData___block_invoke_71()
{
  C2_MULTIPEER_LOG_INTERNAL_0 = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (C2Multipeer)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (C2Multipeer *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSMutableSet)oustandingDiscoveryRequestsByRequestUUID
{
  return self->_oustandingDiscoveryRequestsByRequestUUID;
}

- (void)setOustandingDiscoveryRequestsByRequestUUID:(id)a3
{
}

- (NSMutableDictionary)serverContextByRequestUUID
{
  return self->_serverContextByRequestUUID;
}

- (void)setServerContextByRequestUUID:(id)a3
{
}

- (BOOL)isClientConnection
{
  return self->_isClientConnection;
}

- (void)setIsClientConnection:(BOOL)a3
{
  self->_isClientConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverContextByRequestUUID, 0);
  objc_storeStrong((id *)&self->_oustandingDiscoveryRequestsByRequestUUID, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end