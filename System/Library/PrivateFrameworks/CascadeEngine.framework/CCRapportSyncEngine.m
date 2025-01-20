@interface CCRapportSyncEngine
- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4;
- (CCRapportSyncEngine)initWithQueue:(id)a3;
- (CCRapportSyncEngine)initWithQueue:(id)a3 rapportManager:(id)a4 rapportFileTransferManager:(id)a5 readAccess:(id)a6 donateServiceProvider:(id)a7;
- (NSString)siteSuffix;
- (id)buildDoneFetchingMergeableDeltasMessageToDevice:(id)a3 withIsReciprocal:(BOOL)a4;
- (id)buildMergeableDeltasRequestForSet:(id)a3 device:(id)a4;
- (id)buildVersionedMergeableForSet:(id)a3;
- (id)doneFetchingMergeableDeltasRequestHandler;
- (id)fetchMergeableDeltasRequestHandler;
- (id)itemTypesSupportingSync;
- (id)setsWithItemType:(id)a3;
- (id)syncPolicyForSet:(id)a3;
- (unsigned)protocolVersion;
- (void)addOperationsToFetchMergeableDeltasFromDevice:(id)a3 isReciprocal:(BOOL)a4;
- (void)completeRequestAsDeliveredToDevices:(id)a3 withErrors:(id)a4;
- (void)completeRequestIfDeliveredToAllNearbyDevices;
- (void)deleteDanglingFilesFromFileTransferDirectory;
- (void)fetchMergeableDeltasWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)fetchReciprocalMergeableDeltasFromDevice:(id)a3 completionHandler:(id)a4;
- (void)handleIncomingMergeableDeltaFileTransfer:(id)a3 fromDevice:(id)a4;
- (void)rapportManager:(id)a3 didDiscoverCCRapportDevice:(id)a4;
- (void)registerRequests;
- (void)sendDoneFetchingMergeableDeltasRequest:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)sendFetchMergeableDeltasRequest:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)setSiteSuffix:(id)a3;
- (void)startClient;
- (void)startServerWithCompletion:(id)a3;
- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)teardown;
@end

@implementation CCRapportSyncEngine

- (CCRapportSyncEngine)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = [[CCRapportManager alloc] initWithQueue:v4 forSharedUse:0];
  v6 = +[CCRapportFileTransferManager defaultInstance];
  v7 = [MEMORY[0x263F316D8] defaultInstanceWithUseCase:*MEMORY[0x263F29E38]];
  v8 = [(CCRapportSyncEngine *)self initWithQueue:v4 rapportManager:v5 rapportFileTransferManager:v6 readAccess:v7 donateServiceProvider:0];

  return v8;
}

- (CCRapportSyncEngine)initWithQueue:(id)a3 rapportManager:(id)a4 rapportFileTransferManager:(id)a5 readAccess:(id)a6 donateServiceProvider:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CCRapportSyncEngine;
  v17 = [(CCRapportSyncEngine *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    objc_storeStrong((id *)&v18->_rapportManager, a4);
    [(CCRapportManager *)v18->_rapportManager setDelegate:v18];
    objc_storeStrong((id *)&v18->_fileTransferSessionManager, a5);
    objc_storeStrong((id *)&v18->_readAcccess, a6);
    objc_storeStrong((id *)&v18->_donateServiceProvider, a7);
    uint64_t v19 = objc_opt_new();
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = (NSOperationQueue *)v19;

    [(NSOperationQueue *)v18->_operationQueue setUnderlyingQueue:v18->_queue];
    [(NSOperationQueue *)v18->_operationQueue setMaxConcurrentOperationCount:1];
  }

  return v18;
}

- (id)buildVersionedMergeableForSet:(id)a3
{
  id v4 = a3;
  v5 = [CCSetVersionedMergeable alloc];
  v6 = [(CCDataResourceReadAccess *)self->_readAcccess databaseReadAccessForSet:v4];
  donateServiceProvider = self->_donateServiceProvider;
  v8 = [(CCRapportFileTransferManager *)self->_fileTransferSessionManager directoryURL];
  v9 = [(CCSetVersionedMergeable *)v5 initWithSet:v4 readAccess:v6 donateServiceProvider:donateServiceProvider mergeableDeltasFileURL:v8];

  return v9;
}

- (id)itemTypesSupportingSync
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [MEMORY[0x263F31790] syncableSetConfigurations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138412546;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "syncPolicy", v17);
        int v11 = [v10 supportsTransport:2 direction:1];

        if (v11)
        {
          v12 = __biome_log_for_category();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [(CCRapportSyncEngine *)self siteSuffix];
            id v14 = [v9 setIdentifier];
            *(_DWORD *)buf = v17;
            v24 = v13;
            __int16 v25 = 2112;
            v26 = v14;
            _os_log_impl(&dword_249B69000, v12, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: found syncable set %@", buf, 0x16u);
          }
          id v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v9, "itemType"));
          [v2 addObject:v15];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v6);
  }

  return v2;
}

- (id)setsWithItemType:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = objc_opt_new();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F316E8]) initWithReadAccess:self->_readAcccess];
  id v22 = 0;
  uint64_t v7 = [v6 allSetsWithOptions:1 error:&v22];
  id v8 = v22;

  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CCRapportSyncEngine setsWithItemType:]();
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v16 = objc_msgSend(v15, "itemType", (void)v18);
        if (v16 == [v4 unsignedShortValue]) {
          [v5 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }

  return v5;
}

- (void)startClient
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CCRapportSyncEngine_startClient__block_invoke;
  block[3] = &unk_265277CC0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__CCRapportSyncEngine_startClient__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerRequests];
}

- (void)startServerWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CCRapportSyncEngine_startServerWithCompletion___block_invoke;
  v7[3] = &unk_265277F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __49__CCRapportSyncEngine_startServerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) registerRequests];
  [*(id *)(*(void *)(a1 + 32) + 8) start];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)teardown
{
  OUTLINED_FUNCTION_5_0();
  v1 = [v0 siteSuffix];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine%@: attempting to tear down sync engine but a request is still in progress %@", v4, v5, v6, v7, v8);
}

- (void)registerRequests
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(CCRapportManager *)self->_rapportManager start];
  rapportManager = self->_rapportManager;
  uint64_t v4 = [(CCRapportSyncEngine *)self fetchMergeableDeltasRequestHandler];
  [(CCRapportManager *)rapportManager registerRequestID:@"com.apple.biomesyncd.cascade.fetchMergeableDeltas" requestHandler:v4];

  uint64_t v5 = self->_rapportManager;
  id v6 = [(CCRapportSyncEngine *)self doneFetchingMergeableDeltasRequestHandler];
  [(CCRapportManager *)v5 registerRequestID:@"com.apple.biomesyncd.cascade.doneFetchingMergeableDeltas" requestHandler:v6];
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__CCRapportSyncEngine_syncNowWithReason_activity_completionHandler___block_invoke;
  v13[3] = &unk_265277F90;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __68__CCRapportSyncEngine_syncNowWithReason_activity_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchMergeableDeltasWithReason:*(void *)(a1 + 56) activity:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)fetchReciprocalMergeableDeltasFromDevice:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (NSOperationQueue *)objc_opt_new();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v8;

  [(NSOperationQueue *)self->_operationQueue setUnderlyingQueue:self->_queue];
  [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
  id v10 = [(CCRapportSyncEngine *)self itemTypesSupportingSync];
  if ([v10 count])
  {
    id v11 = [CCRapportRequest alloc];
    id v12 = objc_opt_new();
    uint64_t v13 = [(CCRapportRequest *)v11 initWithUUID:v12 activity:0 itemTypesSupportingSync:v10 queue:self->_queue completionHandler:v7];

    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __82__CCRapportSyncEngine_fetchReciprocalMergeableDeltasFromDevice_completionHandler___block_invoke;
    v19[3] = &unk_265277FB8;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    [(CCRapportRequest *)v13 setRequestTimeoutHandler:v19];
    objc_storeStrong((id *)&self->_currentRequest, v13);
    [(CCRapportRequest *)self->_currentRequest setState:1];
    [(CCRapportSyncEngine *)self addOperationsToFetchMergeableDeltasFromDevice:v6 isReciprocal:1];
    id v14 = self->_operationQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__CCRapportSyncEngine_fetchReciprocalMergeableDeltasFromDevice_completionHandler___block_invoke_103;
    v16[3] = &unk_265277FB8;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    [(NSOperationQueue *)v14 addBarrierBlock:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CCRapportSyncEngine fetchReciprocalMergeableDeltasFromDevice:completionHandler:](self);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68]);
  }
}

void __82__CCRapportSyncEngine_fetchReciprocalMergeableDeltasFromDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  uint64_t v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) siteSuffix];
    *(_DWORD *)buf = 138412290;
    long long v21 = v4;
    _os_log_impl(&dword_249B69000, v3, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: request timed out because no devices are nearby or messages in flight to devices failed to respond in time", buf, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:6 userInfo:0];
  id v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(*((id *)WeakRetained + 7), "deliveredToDevices", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) rapportIdentifier];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  id v18 = v5;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [WeakRetained completeRequestAsDeliveredToDevices:v6 withErrors:v13];
}

void __82__CCRapportSyncEngine_fetchReciprocalMergeableDeltasFromDevice_completionHandler___block_invoke_103(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  uint64_t v3 = [*((id *)WeakRetained + 7) errorFromDevice];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) rapportIdentifier];
  uint64_t v8 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  [WeakRetained completeRequestAsDeliveredToDevices:v7 withErrors:v5];
}

- (void)fetchMergeableDeltasWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x263F29E78] currentPersonaIdentifierLoggingDescription];
    *(_DWORD *)buf = 138412290;
    v38 = v10;
    _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "fetchMergeableDeltasWithReason persona is %@", buf, 0xCu);
  }
  if (self->_currentRequest)
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:11 userInfo:0];
    v41[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    v8[2](v8, MEMORY[0x263EFFA68], v12);
  }
  else
  {
    [(CCRapportSyncEngine *)self deleteDanglingFilesFromFileTransferDirectory];
    uint64_t v13 = (NSOperationQueue *)objc_opt_new();
    operationQueue = self->_operationQueue;
    self->_operationQueue = v13;

    [(NSOperationQueue *)self->_operationQueue setUnderlyingQueue:self->_queue];
    [(NSOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    uint64_t v11 = [(CCRapportSyncEngine *)self itemTypesSupportingSync];
    if ([v11 count])
    {
      long long v15 = [CCRapportRequest alloc];
      long long v16 = objc_opt_new();
      uint64_t v28 = [(CCRapportRequest *)v15 initWithUUID:v16 activity:v7 itemTypesSupportingSync:v11 queue:self->_queue completionHandler:v8];

      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __81__CCRapportSyncEngine_fetchMergeableDeltasWithReason_activity_completionHandler___block_invoke;
      v33[3] = &unk_265277FB8;
      v27 = &v34;
      objc_copyWeak(&v34, &location);
      v33[4] = self;
      [(CCRapportRequest *)v28 setRequestTimeoutHandler:v33];
      objc_storeStrong((id *)&self->_currentRequest, v28);
      [(CCRapportRequest *)self->_currentRequest setState:1];
      long long v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(CCRapportSyncEngine *)self siteSuffix];
        long long v19 = [(CCRapportManager *)self->_rapportManager discoveredDevices];
        *(_DWORD *)buf = 138412546;
        v38 = v18;
        __int16 v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_249B69000, v17, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: discovered devices: %@", buf, 0x16u);
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v20 = [(CCRapportManager *)self->_rapportManager discoveredDevices];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            __int16 v25 = (void *)MEMORY[0x24C5B0A20]();
            [(CCRapportSyncEngine *)self addOperationsToFetchMergeableDeltasFromDevice:v24 isReciprocal:0];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v21);
      }

      [(CCRapportManager *)self->_rapportManager start];
      objc_destroyWeak(v27);
      objc_destroyWeak(&location);
    }
    else
    {
      v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CCRapportSyncEngine fetchMergeableDeltasWithReason:activity:completionHandler:](self);
      }

      v8[2](v8, MEMORY[0x263EFFA68], (void *)MEMORY[0x263EFFA68]);
    }
  }
}

void __81__CCRapportSyncEngine_fetchMergeableDeltasWithReason_activity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[4]);
  uint64_t v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) siteSuffix];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl(&dword_249B69000, v3, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:6 userInfo:0];
  id v7 = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  [(dispatch_queue_t *)WeakRetained completeRequestAsDeliveredToDevices:MEMORY[0x263EFFA68] withErrors:v6];
}

- (void)addOperationsToFetchMergeableDeltasFromDevice:(id)a3 isReciprocal:(BOOL)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(CCRapportSyncEngine *)self siteSuffix];
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_249B69000, v7, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: engaging with device: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v9 = [CCAsyncBlockOperation alloc];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke;
  v33[3] = &unk_265278008;
  objc_copyWeak(&v34, (id *)buf);
  v33[4] = self;
  uint64_t v10 = [(CCAsyncBlockOperation *)v9 initWithAsyncOperationBlock:v33];
  [(NSOperationQueue *)self->_operationQueue addOperation:v10];
  uint64_t v11 = [CCAsyncBlockOperation alloc];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_109;
  v28[3] = &unk_265278080;
  objc_copyWeak(&v32, (id *)buf);
  id v12 = v6;
  id v29 = v12;
  long long v30 = self;
  uint64_t v13 = v10;
  long long v31 = v13;
  long long v14 = [(CCAsyncBlockOperation *)v11 initWithAsyncOperationBlock:v28];
  long long v15 = [CCAsyncBlockOperation alloc];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_114;
  objc_super v23 = &unk_2652780D0;
  objc_copyWeak(&v26, (id *)buf);
  uint64_t v24 = self;
  id v16 = v12;
  id v25 = v16;
  BOOL v27 = a4;
  long long v17 = [(CCAsyncBlockOperation *)v15 initWithAsyncOperationBlock:&v20];
  -[CCAsyncBlockOperation addDependency:](v17, "addDependency:", v14, v20, v21, v22, v23, v24);
  operationQueue = self->_operationQueue;
  v35[0] = v14;
  v35[1] = v17;
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [(NSOperationQueue *)operationQueue addOperations:v19 waitUntilFinished:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) siteSuffix];
    id v7 = [WeakRetained[1] localDevice];
    *(_DWORD *)buf = 138412546;
    long long v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_249B69000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: local device %@", buf, 0x16u);
  }
  uint64_t v8 = [WeakRetained[1] localDevice];
  uint64_t v9 = [v8 rapportIdentifier];

  if (v9)
  {
    v3[2](v3);
  }
  else
  {
    id v10 = WeakRetained[1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_106;
    v11[3] = &unk_265277FE0;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v3;
    [v10 registerLocalDeviceUpdatedHandler:v11];
  }
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 identifier];

  if (v4)
  {
    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) siteSuffix];
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_249B69000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: discovered local device %@", (uint8_t *)&v7, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v38 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = objc_opt_new();
  [v4 setUnderlyingQueue:*((void *)WeakRetained + 4)];
  v44 = v4;
  [v4 setMaxConcurrentOperationCount:1];
  uint64_t v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained siteSuffix];
    int v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v60 = v6;
    __int16 v61 = 2112;
    v62 = v7;
    _os_log_impl(&dword_249B69000, v5, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: creating operations for syncing sets with device %@", buf, 0x16u);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [*((id *)WeakRetained + 7) itemTypesSupportingSync];
  uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
  uint64_t v8 = 0;
  if (v41)
  {
    uint64_t v40 = *(void *)v56;
    v43 = WeakRetained;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v40) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        uint64_t v11 = [*(id *)(a1 + 40) setsWithItemType:v10];
        id v12 = (void *)[v11 mutableCopy];

        if (![v12 count])
        {
          uint64_t v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = [v43 siteSuffix];
            *(_DWORD *)buf = 138412546;
            v60 = v14;
            __int16 v61 = 2112;
            v62 = v10;
            _os_log_impl(&dword_249B69000, v13, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: no set found on device, but set is registered for sync, initiating day zero request for item type %@", buf, 0x16u);
          }
          __int16 v15 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
          id v16 = objc_alloc(MEMORY[0x263F31770]);
          uint64_t v17 = [v10 unsignedShortValue];
          id v18 = (void *)[v16 initWithItemType:v17 personaIdentifier:v15 descriptors:MEMORY[0x263EFFA68] options:1 error:0];
          [v12 addObject:v18];

          id WeakRetained = v43;
        }
        uint64_t v42 = v9;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v51 = 0u;
        id v19 = v12;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v52;
          do
          {
            uint64_t v23 = 0;
            uint64_t v24 = v8;
            do
            {
              if (*(void *)v52 != v22) {
                objc_enumerationMutation(v19);
              }
              id v25 = *(void **)(*((void *)&v51 + 1) + 8 * v23);
              id v26 = __biome_log_for_category();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v27 = [*(id *)(a1 + 40) siteSuffix];
                uint64_t v28 = *(void *)(a1 + 32);
                *(_DWORD *)buf = 138412802;
                v60 = v27;
                __int16 v61 = 2112;
                v62 = v25;
                __int16 v63 = 2112;
                uint64_t v64 = v28;
                _os_log_impl(&dword_249B69000, v26, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: beginning to fetch deltas for set %@ from device %@", buf, 0x20u);

                id WeakRetained = v43;
              }

              id v29 = [CCAsyncBlockOperation alloc];
              v48[0] = MEMORY[0x263EF8330];
              v48[1] = 3221225472;
              v48[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_111;
              v48[3] = &unk_265278030;
              v48[4] = WeakRetained;
              v48[5] = v25;
              id v30 = *(id *)(a1 + 32);
              uint64_t v31 = *(void *)(a1 + 40);
              id v49 = v30;
              uint64_t v50 = v31;
              id v32 = [(CCAsyncBlockOperation *)v29 initWithAsyncOperationBlock:v48];
              uint64_t v8 = v32;
              if (v24) {
                v33 = v24;
              }
              else {
                v33 = *(CCAsyncBlockOperation **)(a1 + 48);
              }
              [(CCAsyncBlockOperation *)v32 addDependency:v33];
              [v44 addOperation:v8];

              ++v23;
              uint64_t v24 = v8;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v65 count:16];
          }
          while (v21);
        }

        uint64_t v9 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v41);
  }

  id v34 = [CCAsyncBlockOperation alloc];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_113;
  v45[3] = &unk_265278058;
  v45[4] = WeakRetained;
  id v46 = *(id *)(a1 + 32);
  id v35 = v38;
  id v47 = v35;
  v36 = [(CCAsyncBlockOperation *)v34 initWithAsyncOperationBlock:v45];
  v37 = v36;
  if (v8) {
    [(CCAsyncBlockOperation *)v36 addDependency:v8];
  }
  [v44 addOperation:v37];
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) siteSuffix];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    _os_log_impl(&dword_249B69000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: sending request for set: %@ to device %@", buf, 0x20u);
  }
  uint64_t v8 = [*(id *)(a1 + 56) buildMergeableDeltasRequestForSet:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 56) markAsInFlightToDevice:*(void *)(a1 + 48)];
  uint64_t v9 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_112;
  v11[3] = &unk_265277EF0;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v13 = v9;
  id v14 = v3;
  id v10 = v3;
  [(id)v12 sendFetchMergeableDeltasRequest:v8 toDevice:v13 completionHandler:v11];
}

uint64_t __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_112(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) siteSuffix];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_249B69000, v2, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: done fetching deltas for set %@ from device %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) siteSuffix];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_249B69000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: barrier hit, all deltas fetched for device %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v3[2](v3);
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 48);
  uint64_t v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [*(id *)(a1 + 32) siteSuffix];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: done fetching all deltas from device, signalling remote device we are done fetching %@", buf, 0x16u);
  }
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 32) siteSuffix];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_249B69000, v10, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: expecting reciprocal request from device %@", buf, 0x16u);
    }
    BOOL v9 = *(unsigned char *)(a1 + 56) != 0;
  }
  uint64_t v13 = [*(id *)(a1 + 32) buildDoneFetchingMergeableDeltasMessageToDevice:*(void *)(a1 + 40) withIsReciprocal:v9];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_115;
  v15[3] = &unk_2652780A8;
  id v14 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v14;
  __int16 v17 = WeakRetained;
  [WeakRetained sendDoneFetchingMergeableDeltasRequest:v13 toDevice:v16 completionHandler:v15];
  [WeakRetained[7] markAsDeliveredToDevice:*(void *)(a1 + 40) withError:0];
  v4[2](v4);
}

void __82__CCRapportSyncEngine_addOperationsToFetchMergeableDeltasFromDevice_isReciprocal___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) siteSuffix];
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412802;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_249B69000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: signalled remote device we are done fetching %@ with error %@", (uint8_t *)&v13, 0x20u);
  }
  int v7 = [v3 domain];
  uint64_t v8 = v7;
  if (v7 == @"CCRapportErrorDomain")
  {
    uint64_t v9 = [v3 code];

    if (v9 == 11)
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [*(id *)(a1 + 32) siteSuffix];
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412546;
        id v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_249B69000, v10, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: other device is already syncing so will not reciprocate with us, complete the request %@", (uint8_t *)&v13, 0x16u);
      }
      [*(id *)(a1 + 48) completeRequestIfDeliveredToAllNearbyDevices];
    }
  }
  else
  {
  }
}

- (void)completeRequestIfDeliveredToAllNearbyDevices
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = [(CCRapportManager *)self->_rapportManager discoveredDevices];
  uint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        int v13 = [(CCRapportRequest *)self->_currentRequest deliveredToDevices];
        int v14 = [v13 containsObject:v12];

        if (v14) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v9);
  }

  if ([v7 isSubsetOfSet:v6])
  {
    __int16 v15 = [(CCRapportRequest *)self->_currentRequest deliveredToDevices];
    [v6 unionSet:v15];

    uint64_t v16 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          uint64_t v23 = objc_msgSend(v22, "rapportIdentifier", (void)v31);

          if (v23)
          {
            uint64_t v24 = [v22 rapportIdentifier];
            [v16 addObject:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v19);
    }

    id v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [(CCRapportSyncEngine *)self siteSuffix];
      BOOL v27 = [(CCRapportRequest *)self->_currentRequest inFlightToDevices];
      *(_DWORD *)buf = 138412546;
      uint64_t v40 = v26;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      _os_log_impl(&dword_249B69000, v25, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: completing request, still inflight: %@", buf, 0x16u);
    }
    uint64_t v28 = [v16 allObjects];
    id v29 = [(CCRapportRequest *)self->_currentRequest errorFromDevice];
    id v30 = [v29 allValues];
    [(CCRapportSyncEngine *)self completeRequestAsDeliveredToDevices:v28 withErrors:v30];
  }
}

- (void)completeRequestAsDeliveredToDevices:(id)a3 withErrors:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = (CCRapportRequest *)a3;
  id v7 = a4;
  if ([(CCRapportRequest *)self->_currentRequest state] == 2)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(CCRapportSyncEngine *)self siteSuffix];
      currentRequest = self->_currentRequest;
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = currentRequest;
      _os_log_impl(&dword_249B69000, v8, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: request %@ already finished running", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    [(CCRapportRequest *)self->_currentRequest setState:2];
    uint64_t v11 = [(CCRapportRequest *)self->_currentRequest completionHandler];

    if (v11)
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [(CCRapportSyncEngine *)self siteSuffix];
        int v16 = 138412802;
        id v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_249B69000, v12, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: completeRequest:deliveredToDevices %@ withErrors:%@", (uint8_t *)&v16, 0x20u);
      }
      int v14 = [(CCRapportRequest *)self->_currentRequest completionHandler];
      ((void (**)(void, CCRapportRequest *, id))v14)[2](v14, v6, v7);
    }
    __int16 v15 = self->_currentRequest;
    self->_currentRequest = 0;

    [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
    [(CCRapportFileTransferManager *)self->_fileTransferSessionManager closeAllFileTransferSessions];
    [(CCRapportSyncEngine *)self deleteDanglingFilesFromFileTransferDirectory];
  }
}

- (void)sendFetchMergeableDeltasRequest:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  fileTransferSessionManager = self->_fileTransferSessionManager;
  uint64_t v12 = [(CCRapportManager *)self->_rapportManager localDevice];
  int v13 = [v12 rapportIdentifier];
  int v14 = [(CCRapportFileTransferManager *)fileTransferSessionManager buildFileTransferSessionWithTargetDeviceIdentifier:v13];

  __int16 v15 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
  int v16 = [v14 selfPublicKey];
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke;
  v30[3] = &unk_265278148;
  objc_copyWeak(&v34, &location);
  id v17 = v15;
  id v31 = v17;
  id v18 = v9;
  id v32 = v18;
  id v19 = v10;
  id v33 = v19;
  [v14 setReceivedItemHandler:v30];
  __int16 v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v37 = v16;
    _os_log_impl(&dword_249B69000, v20, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: registering to receive incoming files with peer key %@", buf, 0xCu);
  }

  [v8 setPeerPublicKey:v16];
  id v21 = [v8 dictionaryRepresentation];
  rapportManager = self->_rapportManager;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120;
  v26[3] = &unk_265278170;
  id v23 = v18;
  id v27 = v23;
  id v24 = v19;
  id v29 = v24;
  id v25 = v14;
  id v28 = v25;
  [(CCRapportManager *)rapportManager sendRequest:@"com.apple.biomesyncd.cascade.fetchMergeableDeltas" request:v21 toDevice:v23 responseHandler:v26];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained[5] fileTransferQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received item over file transfer session %@", buf, 0xCu);
  }

  id v10 = (void *)MEMORY[0x263F29E78];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_118;
  v14[3] = &unk_265278120;
  v14[4] = WeakRetained;
  id v15 = v5;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = *(id *)(a1 + 48);
  id v12 = v6;
  id v13 = v5;
  [v10 runAsPersonaIdentifier:v11 block:v14];
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_118(uint64_t a1)
{
  [*(id *)(a1 + 32) handleIncomingMergeableDeltaFileTransfer:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_2;
  block[3] = &unk_2652780F8;
  id v4 = *(id *)(a1 + 64);
  dispatch_async(v2, block);
}

uint64_t __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 domain];
    id v10 = v9;
    if (v9 == @"CCRapportErrorDomain")
    {
      uint64_t v18 = [v8 code];

      if (v18 == 4)
      {
        id v19 = [(CCPeerToPeerMessage *)[CCFetchMergeableDeltasResponse alloc] initFromDictionary:v6];
        id v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_1();
        }

        goto LABEL_15;
      }
    }
    else
    {
    }
    id v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_2();
    }
LABEL_15:

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  uint64_t v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = 0;
    _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received response from initating file transfer %@ with error %@", (uint8_t *)&v21, 0x16u);
  }

  id v12 = [(CCPeerToPeerMessage *)[CCFileTransferSessionInitiatedResponse alloc] initFromDictionary:v6];
  id v13 = [v12 device];
  int v14 = [v13 identifier];
  [*(id *)(a1 + 32) setCcDeviceIdentifier:v14];

  id v15 = __biome_log_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = *(void **)(a1 + 40);
    int v21 = 138412290;
    id v22 = v16;
    _os_log_impl(&dword_249B69000, v15, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: activating file transfer session %@", (uint8_t *)&v21, 0xCu);
  }

  id v17 = [v12 peerPublicKey];
  [*(id *)(a1 + 40) setPeerPublicKey:v17];

  [*(id *)(a1 + 40) activate];
LABEL_16:
}

- (void)sendDoneFetchingMergeableDeltasRequest:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 dictionaryRepresentation];
  rapportManager = self->_rapportManager;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__CCRapportSyncEngine_sendDoneFetchingMergeableDeltasRequest_toDevice_completionHandler___block_invoke;
  v14[3] = &unk_265278198;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(CCRapportManager *)rapportManager sendRequest:@"com.apple.biomesyncd.cascade.doneFetchingMergeableDeltas" request:v10 toDevice:v13 responseHandler:v14];
}

void __89__CCRapportSyncEngine_sendDoneFetchingMergeableDeltasRequest_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_249B69000, v8, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received response from signalling end of fetching %@ with error %@", (uint8_t *)&v14, 0x16u);
  }

  if (v7)
  {
    id v9 = [v7 domain];
    id v10 = v9;
    if (v9 == @"CCRapportErrorDomain")
    {
      uint64_t v11 = [v7 code];

      if (v11 == 4)
      {
        id v12 = [(CCPeerToPeerMessage *)[CCFetchMergeableDeltasResponse alloc] initFromDictionary:v6];
        id v13 = __biome_log_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_1();
        }

        goto LABEL_12;
      }
    }
    else
    {
    }
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_2();
    }
LABEL_12:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleIncomingMergeableDeltaFileTransfer:(id)a3 fromDevice:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 itemURL];
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_249B69000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: received file transfer item with url %@ from device %@", buf, 0x16u);
  }

  id v10 = [CCMergeableDeltaFileTransferMessageMetadata alloc];
  uint64_t v11 = [v6 metadata];
  id v12 = [(CCMergeableDeltaFileTransferMessageMetadata *)v10 initFromDictionary:v11];

  id v13 = [v12 set];
  uint64_t v14 = [v12 device];
  id v15 = (void *)v14;
  if (v13 && v14)
  {
    if ([v12 fileFormatVersion] == 1)
    {
      __int16 v16 = [(CCRapportSyncEngine *)self buildVersionedMergeableForSet:v13];
      id v17 = (void *)MEMORY[0x263EFD720];
      uint64_t v18 = [v12 mergeableDeltaMetadataVectors];
      id v22 = 0;
      id v19 = [v17 decodeMergeableDeltaMetadata:v18 withError:&v22];
      id v20 = v22;

      int v21 = (void *)[objc_alloc(MEMORY[0x263EFD718]) initWithFileURL:v8 metadata:v19];
      [v16 mergeDelta:v21 fromDevice:v15];
    }
    else
    {
      __int16 v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CCRapportSyncEngine handleIncomingMergeableDeltaFileTransfer:fromDevice:](v12);
      }
    }
  }
  else
  {
    __int16 v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CCRapportSyncEngine handleIncomingMergeableDeltaFileTransfer:fromDevice:](v6);
    }
  }
}

- (id)buildMergeableDeltasRequestForSet:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = [(CCRapportSyncEngine *)self buildVersionedMergeableForSet:v5];
  id v7 = [v6 stateVector];
  id v8 = [(CCDataResourceReadAccess *)self->_readAcccess localDeviceIdForSet:v5];
  id v9 = [CCPeerToPeerMessage alloc];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F31700]) initWithIdentifier:v8 options:1];
  uint64_t v11 = [(CCPeerToPeerMessage *)v9 initWithDevice:v10 protocolVersion:[(CCRapportSyncEngine *)self protocolVersion] wallTime:0 peerPublicKey:CFAbsoluteTimeGetCurrent()];

  id v12 = +[CCFetchMergeableDeltasRequest fetchMergableDeltasRequestFromPeerToPeerMessage:v11 set:v5 stateVector:v7 atomBatchVersion:3];

  return v12;
}

- (id)buildDoneFetchingMergeableDeltasMessageToDevice:(id)a3 withIsReciprocal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [CCPeerToPeerMessage alloc];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F31700]) initWithIdentifier:self->_localDeviceIdentifier options:1];
  id v8 = [(CCPeerToPeerMessage *)v6 initWithDevice:v7 protocolVersion:[(CCRapportSyncEngine *)self protocolVersion] wallTime:0 peerPublicKey:CFAbsoluteTimeGetCurrent()];

  id v9 = [MEMORY[0x263F29E78] currentPersonaIdentifier];
  id v10 = +[CCSignalDoneFetchingMergeableDeltas doneFetchingMergeableDeltasMessageFromPeerToPeerMessage:v8 isReciprocal:v4 rapportIdentifier:v9];

  return v10;
}

- (void)deleteDanglingFilesFromFileTransferDirectory
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "Failed to enumerate contents of file transfer directory %@", v2, v3, v4, v5, v6);
}

- (id)fetchMergeableDeltasRequestHandler
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke;
  v5[3] = &unk_2652781E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x24C5B0C10](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[4]);
  uint64_t v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 32) siteSuffix];
    *(_DWORD *)buf = 138412802;
    uint64_t v88 = (uint64_t)v12;
    __int16 v89 = 2112;
    uint64_t v90 = (uint64_t)v7;
    __int16 v91 = 2112;
    id v92 = v8;
    _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: received request %@ %@", buf, 0x20u);
  }
  id v13 = [v8 objectForKeyedSubscript:@"senderModelID"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v75 = v8;
      v76 = WeakRetained;
      id v15 = *(void **)(a1 + 32);
      uint64_t v14 = (id *)(a1 + 32);
      int v16 = [v15 protocolVersion];
      id v17 = [[CCPeerToPeerMessage alloc] initFromDictionary:v7];
      id v78 = v7;
      id v18 = [[CCFetchMergeableDeltasRequest alloc] initFromDictionary:v7];
      uint64_t v19 = [v18 set];
      id v20 = [*v14 syncPolicyForSet:v19];
      BMDevicePlatformFromModelString();
      v77 = v20;
      id v79 = v17;
      if (([v20 supportsSyncingWithPlatform:BMDevicePlatformFromModelString() overTransport:2 inDirection:2] & 1) == 0)
      {
        uint64_t v45 = (void *)v19;
        long long v52 = __biome_log_for_category();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_2();
        }

        long long v53 = (void *)MEMORY[0x263F087E8];
        uint64_t v83 = *MEMORY[0x263F08320];
        v84 = @"Unable to determine sender model info";
        long long v54 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v46 = [v53 errorWithDomain:@"CCRapportErrorDomain" code:5 userInfo:v54];
        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v46);
        id v8 = v75;
        id WeakRetained = v76;
        goto LABEL_29;
      }
      int v69 = v16;
      v74 = (void *)v19;
      uint64_t v21 = [*((id *)*v14 + 2) localDeviceIdForSet:v19];
      id v22 = [CCPeerToPeerMessage alloc];
      __int16 v23 = (void *)[objc_alloc(MEMORY[0x263F31700]) initWithIdentifier:v21 options:1];
      uint64_t v73 = -[CCPeerToPeerMessage initWithDevice:protocolVersion:wallTime:peerPublicKey:](v22, "initWithDevice:protocolVersion:wallTime:peerPublicKey:", v23, [*v14 protocolVersion], 0, CFAbsoluteTimeGetCurrent());

      id v71 = v18;
      v72 = (void *)v21;
      if ([v17 protocolVersion] == 3)
      {
        id WeakRetained = v76;
        if (v21)
        {
          id v8 = v75;
          uint64_t v24 = [v75 objectForKeyedSubscript:*MEMORY[0x263F62C88]];
          __int16 v25 = __biome_log_for_category();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v88 = v24;
            _os_log_impl(&dword_249B69000, v25, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: initiating file transfer session with device %@", buf, 0xCu);
          }

          dispatch_queue_t v26 = v76[5];
          uint64_t v27 = [v18 peerPublicKey];
          v70 = [v26 initiateFileTransferSesionBackToTargetDeviceWithIdentifier:v24 withExchangedPeerPublicKey:v27];

          id v28 = __biome_log_for_category();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v88 = v24;
            __int16 v89 = 2112;
            uint64_t v90 = (uint64_t)v70;
            _os_log_impl(&dword_249B69000, v28, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: initiated file transfer session with device %@ fileTransferSession %@", buf, 0x16u);
          }
          v68 = (void *)v24;

          id v29 = [v70 selfPublicKey];
          id v30 = +[CCFileTransferSessionInitiatedResponse fileTransferSessionInitiatedResponseFromPeerToPeerMessage:v73 peerPublicKey:v29];

          uint64_t v67 = v30;
          v66 = [v30 dictionaryRepresentation];
          (*((void (**)(id))v9 + 2))(v9);
          uint64_t v31 = [v18 stateVector];
          LOBYTE(v30) = [v18 atomBatchVersion];
          uint64_t v64 = [*v14 buildVersionedMergeableForSet:v74];
          v65 = (void *)v31;
          id v32 = [v64 mergeableDeltaAfterStateVector:v31 atomBatchVersion:v30];
          id v33 = (void *)MEMORY[0x263EFD720];
          id v34 = [v32 metadata];
          id v82 = 0;
          long long v35 = [v33 encodeMergeableDeltaMetadata:v34 withError:&v82];
          id v63 = v82;

          long long v36 = objc_opt_new();
          long long v37 = [v32 fileURL];
          uint64_t v38 = [v37 lastPathComponent];
          [v36 setFilename:v38];

          id v39 = [v32 fileURL];
          [v36 setItemURL:v39];

          v80[0] = MEMORY[0x263EF8330];
          v80[1] = 3221225472;
          v80[2] = __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_142;
          v80[3] = &unk_2652781C0;
          id v62 = v32;
          id v81 = v62;
          [v36 setCompletionHandler:v80];
          uint64_t v40 = [v70 selfPublicKey];
          __int16 v41 = +[CCMergeableDeltaFileTransferMessageMetadata mergeableDeltaFileTransferMessageMetadataFromPeerToPeerMessage:v73 set:v74 mergeableDeltaMetadataVectors:v35 fileFormatVersion:1 peerPublicKey:v40];

          uint64_t v42 = [v41 dictionaryRepresentation];
          [v36 setMetadata:v42];

          v43 = __biome_log_for_category();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v88 = (uint64_t)v36;
            __int16 v89 = 2112;
            uint64_t v90 = (uint64_t)v70;
            _os_log_impl(&dword_249B69000, v43, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: adding items %@ to file transfer session %@", buf, 0x16u);
          }

          [v70 addItem:v36];
          [v70 activate];

          v44 = v70;
          id v7 = v78;
          id v46 = (void *)v73;
          uint64_t v45 = v74;
          v48 = v67;
          id v47 = v68;
          goto LABEL_28;
        }
        v59 = __biome_log_for_category();
        id v7 = v78;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = [*v14 siteSuffix];
          *(_DWORD *)buf = 138412546;
          uint64_t v88 = (uint64_t)v60;
          __int16 v89 = 2112;
          uint64_t v90 = (uint64_t)v74;
          _os_log_impl(&dword_249B69000, v59, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: set does not exist on device %@", buf, 0x16u);
        }
        id v46 = (void *)v73;
        id v47 = +[CCFetchMergeableDeltasResponse fetchMergeableDeltasResponseFromPeerToPeerMessage:v73];
        uint64_t v61 = [v47 dictionaryRepresentation];
        v48 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:1 userInfo:0];
        v44 = (void *)v61;
        (*((void (**)(id, uint64_t, void, void *))v9 + 2))(v9, v61, 0, v48);
      }
      else
      {
        long long v55 = __biome_log_for_category();
        id WeakRetained = v76;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          long long v56 = [*v14 siteSuffix];
          uint64_t v57 = [v17 protocolVersion];
          *(_DWORD *)buf = 138412802;
          uint64_t v88 = (uint64_t)v56;
          __int16 v89 = 2048;
          uint64_t v90 = v57;
          __int16 v91 = 1024;
          LODWORD(v92) = v69;
          _os_log_impl(&dword_249B69000, v55, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: mismatched protocol version %lu, expected %d", buf, 0x1Cu);
        }
        id v46 = (void *)v73;
        id v47 = +[CCFetchMergeableDeltasResponse fetchMergeableDeltasResponseFromPeerToPeerMessage:v73];
        uint64_t v58 = [v47 dictionaryRepresentation];
        v48 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:4 userInfo:0];
        v44 = (void *)v58;
        (*((void (**)(id, uint64_t, void, void *))v9 + 2))(v9, v58, 0, v48);
        id v7 = v78;
      }
      uint64_t v45 = v74;
      id v8 = v75;
LABEL_28:

      id v18 = v71;
      long long v54 = v72;
LABEL_29:

      long long v51 = v79;
      goto LABEL_30;
    }
  }
  id v49 = __biome_log_for_category();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
    __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_1();
  }

  uint64_t v50 = (void *)MEMORY[0x263F087E8];
  uint64_t v85 = *MEMORY[0x263F08320];
  v86 = @"Unable to determine sender model info";
  long long v51 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  id v18 = [v50 errorWithDomain:@"CCRapportErrorDomain" code:5 userInfo:v51];
  (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v18);
LABEL_30:
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_249B69000, v4, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine: item completion handler invoked with error %@", buf, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [*(id *)(a1 + 32) fileURL];
  id v9 = 0;
  [v5 removeItemAtURL:v6 error:&v9];
  id v7 = v9;

  if (v7)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_142_cold_1();
    }
  }
}

- (id)doneFetchingMergeableDeltasRequestHandler
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke;
  v5[3] = &unk_2652781E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = (void *)MEMORY[0x24C5B0C10](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[4]);
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 32) siteSuffix];
    *(_DWORD *)buf = 138412802;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: received done fetching mergeable deltas message %@ %@", buf, 0x20u);
  }
  id v13 = [[CCSignalDoneFetchingMergeableDeltas alloc] initFromDictionary:v7];
  dispatch_queue_t v14 = WeakRetained[1];
  uint64_t v15 = *MEMORY[0x263F62C88];
  int v16 = [v8 objectForKeyedSubscript:*MEMORY[0x263F62C88]];
  id v17 = [v14 deviceWithIdentifier:v16];

  if (v17) {
    goto LABEL_7;
  }
  id v18 = __biome_log_for_category();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = [*(id *)(a1 + 32) siteSuffix];
    dispatch_queue_t v26 = [v8 objectForKeyedSubscript:v15];
    *(_DWORD *)buf = 138412546;
    id v29 = v25;
    __int16 v30 = 2112;
    id v31 = v26;
    _os_log_error_impl(&dword_249B69000, v18, OS_LOG_TYPE_ERROR, "CCRapportSyncEngine%@: could not find device to reciprocate with RPOptionSenderIDSDeviceID %@", buf, 0x16u);
  }
  dispatch_queue_t v19 = WeakRetained[1];
  id v20 = [v13 rapportIdentifier];
  id v17 = [v19 deviceWithIdentifier:v20];

  if (v17)
  {
LABEL_7:
    char v21 = [v13 isReciprocalRequest];
    dispatch_queue_t v22 = WeakRetained[7];
    if (v21)
    {
      [v22 markAsDeliveredToDevice:v17 withError:0];
      [(dispatch_queue_t *)WeakRetained completeRequestIfDeliveredToAllNearbyDevices];
LABEL_12:
      (*((void (**)(id, void, void, void))v9 + 2))(v9, MEMORY[0x263EFFA78], 0, 0);
      goto LABEL_13;
    }
    if (!v22)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke_144;
      v27[3] = &unk_265278210;
      v27[4] = *(void *)(a1 + 32);
      [(dispatch_queue_t *)WeakRetained fetchReciprocalMergeableDeltasFromDevice:v17 completionHandler:v27];
      goto LABEL_12;
    }
    __int16 v23 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:11 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, MEMORY[0x263EFFA78], 0, v23);
  }
  else
  {
    uint64_t v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke_cold_1();
    }

    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:7 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v17);
  }
LABEL_13:
}

void __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) siteSuffix];
    int v9 = 138412802;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_249B69000, v7, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: reciprocal request completed with %@ %@", (uint8_t *)&v9, 0x20u);
  }
}

- (unsigned)protocolVersion
{
  return 3;
}

- (void)setSiteSuffix:(id)a3
{
}

- (NSString)siteSuffix
{
  return (NSString *)&stru_26FDBAF88;
}

- (id)syncPolicyForSet:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F31790], "setConfigurationForItemType:", objc_msgSend(a3, "itemType"));
  uint64_t v4 = [v3 syncPolicy];

  return v4;
}

- (BOOL)rapportManager:(id)a3 isDeviceSupported:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CCRapportSyncEngine *)self siteSuffix];
    id v8 = [v5 device];
    *(_DWORD *)buf = 138412546;
    __int16 v25 = v7;
    __int16 v26 = 2112;
    uint64_t v27 = v8;
    _os_log_impl(&dword_249B69000, v6, OS_LOG_TYPE_DEFAULT, "CCRapportSyncEngine%@: evaluating whether device is supported for messaging %@", buf, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263F29E68] platform];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = objc_msgSend(MEMORY[0x263F31790], "syncableSetConfigurations", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) syncPolicy];
        char v16 = objc_msgSend(v15, "supportsSyncingWithPlatform:overTransport:inDirection:fromPlatform:", objc_msgSend(v5, "platform"), 2, 3, v9);

        if (v16)
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)rapportManager:(id)a3 didDiscoverCCRapportDevice:(id)a4
{
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(CCRapportRequest *)self->_currentRequest deliveredToDevices];
  if ([v5 containsObject:v8])
  {
  }
  else
  {
    id v6 = [(CCRapportRequest *)self->_currentRequest inFlightToDevices];
    char v7 = [v6 containsObject:v8];

    if ((v7 & 1) == 0 && [(CCRapportRequest *)self->_currentRequest state] == 1) {
      [(CCRapportSyncEngine *)self addOperationsToFetchMergeableDeltasFromDevice:v8 isReciprocal:0];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_siteSuffix, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_donateServiceProvider, 0);
  objc_storeStrong((id *)&self->_readAcccess, 0);
  objc_storeStrong((id *)&self->_rapportManager, 0);
}

- (void)setsWithItemType:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = [v1 siteSuffix];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_249B69000, v0, OS_LOG_TYPE_DEBUG, "CCRapportSyncEngine%@: all sets %@", v3, 0x16u);
}

- (void)fetchReciprocalMergeableDeltasFromDevice:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v1 = [a1 siteSuffix];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine%@: no syncable sets", v4, v5, v6, v7, v8);
}

- (void)fetchMergeableDeltasWithReason:(void *)a1 activity:completionHandler:.cold.1(void *a1)
{
  id v1 = [a1 siteSuffix];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine%@: no syncable sets", v4, v5, v6, v7, v8);
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "CCRapportSyncEngine: protocol version mismatch %@, cannot initiate file transfer with device %@");
}

void __82__CCRapportSyncEngine_sendFetchMergeableDeltasRequest_toDevice_completionHandler___block_invoke_120_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_249B69000, v0, v1, "CCRapportSyncEngine: encountered rapport messaging error %@", v2, v3, v4, v5, v6);
}

- (void)handleIncomingMergeableDeltaFileTransfer:(void *)a1 fromDevice:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "fileFormatVersion"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine: unsupported file format version %@", v4, v5, v6, v7, v8);
}

- (void)handleIncomingMergeableDeltaFileTransfer:(void *)a1 fromDevice:.cold.2(void *a1)
{
  uint64_t v1 = [a1 metadata];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine: cannot determine set or device from incoming file transfer metadata %@", v4, v5, v6, v7, v8);
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = [*(id *)(v0 + 32) siteSuffix];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v2, v3, "CCRapportSyncEngine%@: unable to determine sender model info: %@", v4, v5, v6, v7, v8);
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = [*v0 siteSuffix];
  uint64_t v2 = BMDevicePlatformGetDescription();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v3, v4, "CCRapportSyncEngine%@: syncing to platform %@ is not supported from this device", v5, v6, v7, v8, v9);
}

void __57__CCRapportSyncEngine_fetchMergeableDeltasRequestHandler__block_invoke_142_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = [*v0 fileURL];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v2, v3, "Failed to remove item at url %@ with error %@", v4, v5, v6, v7, v8);
}

void __64__CCRapportSyncEngine_doneFetchingMergeableDeltasRequestHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = [*(id *)(v1 + 32) siteSuffix];
  uint64_t v3 = [v0 rapportIdentifier];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_249B69000, v4, v5, "CCRapportSyncEngine%@: could not find device to reciprocate with fallback identifier %@", v6, v7, v8, v9, v10);
}

@end