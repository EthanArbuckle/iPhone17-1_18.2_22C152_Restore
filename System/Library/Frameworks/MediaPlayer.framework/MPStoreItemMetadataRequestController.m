@interface MPStoreItemMetadataRequestController
+ (MPStoreItemMetadataRequestController)sharedStoreItemMetadataRequestController;
+ (unint64_t)optimalBatchSize;
- (MPStoreItemMetadataRequestController)init;
- (id)getStoreItemMetadataForRequest:(id)a3 includeBatchResponseError:(BOOL)a4 responseHandler:(id)a5;
- (id)getStoreItemMetadataForRequest:(id)a3 responseHandler:(id)a4;
- (int64_t)cacheSize;
- (void)_removeExpiredItemsPeriodically;
- (void)addStoreItemMetadata:(id)a3;
- (void)addStoreItemMetadata:(id)a3 forUserIdentity:(id)a4;
- (void)beginTransaction;
- (void)endTransaction;
- (void)requestStoreItemMetadataForReason:(unint64_t)a3 withItemIdentifiers:(id)a4 responseHandler:(id)a5;
- (void)setCacheSize:(int64_t)a3;
@end

@implementation MPStoreItemMetadataRequestController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importWindow, 0);
  objc_storeStrong((id *)&self->_itemCaches, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)_removeExpiredItemsPeriodically
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  int64_t transactionCount = self->_transactionCount;
  os_unfair_lock_unlock(p_transactionLock);
  if (transactionCount <= 0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint64_t v5 = mach_absolute_time();
      if ((v5 - self->_lastExpiredMetadataPurgeMachTime) * (info.numer / info.denom) >= 0x6FC23AC00)
      {
        unint64_t v6 = v5;
        [(NSMutableDictionary *)self->_itemCaches enumerateKeysAndObjectsUsingBlock:&__block_literal_global_31];
        self->_lastExpiredMetadataPurgeMachTime = v6;
      }
    }
  }
}

uint64_t __71__MPStoreItemMetadataRequestController__removeExpiredItemsPeriodically__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeExpiredMetadata];
}

- (id)getStoreItemMetadataForRequest:(id)a3 includeBatchResponseError:(BOOL)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v11 = [v8 itemIdentifiers];
  if ([v11 count])
  {
    [v10 setCancellable:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke;
    v14[3] = &unk_1E57EF530;
    v14[4] = v11;
    v14[5] = self;
    id v15 = v8;
    id v17 = v9;
    id v16 = v10;
    BOOL v18 = a4;
    +[MPStoreItemMetadataCacheKey getCacheKeyWithRequest:v15 completionHandler:v14];
  }
  else
  {
    [v10 setCompletedUnitCount:1];
    if (v9)
    {
      v12 = objc_alloc_init(MPStoreItemMetadataResponse);
      [(MPStoreItemMetadataResponse *)v12 setFinalResponse:1];
      (*((void (**)(id, MPStoreItemMetadataResponse *, void))v9 + 2))(v9, v12, 0);
    }
  }

  return v10;
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MPAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_2;
  v7[3] = &unk_1E57EF508;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 72);
  id v5 = v3;
  unint64_t v6 = [(MPAsyncBlockOperation *)v4 initWithStartHandler:v7];
  [*(id *)(*(void *)(a1 + 40) + 16) addOperation:v6];
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v5 = objc_alloc_init(MPStoreItemMetadataResponse);
  [(MPStoreItemMetadataResponse *)v5 setRequestItemIdentifiers:*(void *)(a1 + 32)];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:*(void *)(a1 + 48)];
  uint64_t v7 = [*(id *)(a1 + 56) reason];
  v33 = (void *)v6;
  if (v6 && (uint64_t v8 = v7, ![*(id *)(a1 + 56) shouldIgnoreCache]))
  {
    id v31 = v3;
    v32 = v5;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v10 = a1;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * v15);
          id v17 = objc_msgSend(v33, "metadataForItemIdentifier:ignoreExpiration:", v16, objc_msgSend(*(id *)(v10 + 56), "shouldIgnoreExpiration"));
          if (v17) {
            [(MPStoreItemMetadataResponse *)v32 setStoreItemMetadata:v17 forItemIdentifier:v16];
          }
          if ([v17 hasMetadataForRequestReason:v8]) {
            BOOL v18 = v9;
          }
          else {
            BOOL v18 = v4;
          }
          [v18 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v13);
    }

    id v5 = v32;
    [(MPStoreItemMetadataResponse *)v32 setLastBatchItemIdentifiers:v9];

    id v3 = v31;
    a1 = v10;
  }
  else
  {
    [v4 addObjectsFromArray:*(void *)(a1 + 32)];
  }
  if ([v4 count] && !objc_msgSend(*(id *)(a1 + 56), "shouldRequireCachedResults"))
  {
    v20 = [(MPStoreItemMetadataResponse *)v5 lastBatchItemIdentifiers];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      uint64_t v22 = *(void *)(a1 + 72);
      if (v22)
      {
        v23 = (void *)[(MPStoreItemMetadataResponse *)v5 copy];
        (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
      }
    }
    v24 = [*(id *)(a1 + 56) storePlatformRequest];
    v25 = [v4 array];
    [v24 setItemIdentifiers:v25];

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreItemMetadataRequestController", v26);

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_3;
    v37[3] = &unk_1E57EF4B8;
    id v28 = *(id *)(a1 + 56);
    uint64_t v29 = *(void *)(a1 + 40);
    id v38 = v28;
    uint64_t v39 = v29;
    dispatch_queue_t v40 = v27;
    v41 = v5;
    id v42 = *(id *)(a1 + 72);
    char v43 = *(unsigned char *)(a1 + 80);
    [v24 setBatchResultsHandler:v37];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_8;
    v34[3] = &unk_1E57EF4E0;
    id v36 = *(id *)(a1 + 72);
    v34[4] = v27;
    v34[5] = v5;
    id v35 = v3;
    v30 = [v24 performWithResponseHandler:v34];
    [*(id *)(a1 + 64) addChild:v30 withPendingUnitCount:1];
  }
  else
  {
    if ([v4 count])
    {
      v19 = [v4 array];
      [(MPStoreItemMetadataResponse *)v5 setCacheMissItemIdentifiers:v19];
    }
    if (*(void *)(a1 + 72))
    {
      [*(id *)(a1 + 64) setCompletedUnitCount:1];
      [(MPStoreItemMetadataResponse *)v5 setFinalResponse:1];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    [v3 finishWithError:0];
  }
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = v10;
  if (v8)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_4;
    v30[3] = &unk_1E57EF468;
    v30[4] = v10;
    [v8 enumerateItemsUsingBlock:v30];
    if ((MSVDeviceIsAudioAccessory() & 1) == 0)
    {
      uint64_t v12 = [[MPStoreItemMetadataCacheKey alloc] initWithRequest:*(void *)(a1 + 32) response:v8];
      uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKey:v12];
      if (!v13)
      {
        uint64_t v13 = [[MPStoreItemMetadataCache alloc] initWithCacheSize:*(void *)(*(void *)(a1 + 40) + 64)];
        [*(id *)(*(void *)(a1 + 40) + 32) setObject:v13 forKey:v12];
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_5;
      v28[3] = &unk_1E57EF490;
      uint64_t v29 = v13;
      uint64_t v14 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v28];
    }
    [*(id *)(a1 + 40) _removeExpiredItemsPeriodically];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_6;
  block[3] = &unk_1E57F83C0;
  uint64_t v16 = *(NSObject **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v17 = *(void **)(a1 + 64);
  block[4] = v11;
  block[5] = v15;
  id v23 = v7;
  id v24 = v8;
  id v18 = v17;
  char v27 = *(unsigned char *)(a1 + 72);
  id v25 = v9;
  id v26 = v18;
  id v19 = v9;
  id v20 = v8;
  id v21 = v7;
  dispatch_async(v16, block);
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_9;
    block[3] = &unk_1E57F8408;
    uint64_t v6 = *(NSObject **)(a1 + 32);
    block[4] = *(void *)(a1 + 40);
    id v9 = v5;
    id v8 = v4;
    dispatch_async(v6, block);
  }
  [*(id *)(a1 + 48) finishWithError:0];
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_9(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) copy];
  [v2 setLastBatchItemIdentifiers:0];
  [v2 setFinalResponse:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MPStoreItemMetadata alloc];
  id v5 = [v3 metadataDictionary];
  uint64_t v6 = [v3 expirationDate];

  id v8 = [(MPStoreItemMetadata *)v4 initWithStorePlatformDictionary:v5 expirationDate:v6];
  id v7 = [(MPStoreItemMetadata *)v8 cacheableItemIdentifier];
  if (v8 && [v7 length]) {
    [*(id *)(a1 + 32) setObject:v8 forKey:v7];
  }
}

id __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)[*(id *)(a1 + 32) addMetadata:a3 forItemIdentifier:a2];
}

void __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_7;
  v8[3] = &unk_1E57EF490;
  v8[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v8];
  [*(id *)(a1 + 40) setLastBatchItemIdentifiers:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 56) performanceMetrics];
  [v3 setPerformanceMetrics:v4];

  uint64_t v5 = *(void *)(a1 + 72);
  if (v5)
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 40) copy];
    if (*(unsigned char *)(a1 + 80)) {
      uint64_t v7 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v7 = 0;
    }
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, v7);
  }
}

uint64_t __113__MPStoreItemMetadataRequestController_getStoreItemMetadataForRequest_includeBatchResponseError_responseHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setStoreItemMetadata:a3 forItemIdentifier:a2];
}

- (id)getStoreItemMetadataForRequest:(id)a3 responseHandler:(id)a4
{
  return [(MPStoreItemMetadataRequestController *)self getStoreItemMetadataForRequest:a3 includeBatchResponseError:0 responseHandler:a4];
}

- (void)requestStoreItemMetadataForReason:(unint64_t)a3 withItemIdentifiers:(id)a4 responseHandler:(id)a5
{
  id v11 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(MPStoreItemMetadataRequest);
  [(MPStoreItemMetadataRequest *)v9 setItemIdentifiers:v8];

  [(MPStoreItemMetadataRequest *)v9 setReason:a3];
  id v10 = [(MPStoreItemMetadataRequestController *)self getStoreItemMetadataForRequest:v9 responseHandler:v11];
}

- (void)addStoreItemMetadata:(id)a3 forUserIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((MSVDeviceIsAudioAccessory() & 1) == 0)
  {
    id v8 = [v6 cacheableItemIdentifier];
    if ([v8 length])
    {
      id v9 = [MPAsyncBlockOperation alloc];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke;
      v13[3] = &unk_1E57EF440;
      v13[4] = v8;
      v13[5] = self;
      id v14 = v6;
      id v10 = [(MPAsyncBlockOperation *)v9 initWithStartHandler:v13];
      [(NSOperationQueue *)self->_operationQueue addOperation:v10];
    }
  }
  importWindow = self->_importWindow;
  uint64_t v12 = [v6 importableStorePlatformDictionary];
  [(MPStoreItemMetadataImportWindow *)importWindow addPayload:v12 userIdentity:v7];
}

void __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MPStoreItemMetadataRequest);
  v14[0] = a1[4];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(MPStoreItemMetadataRequest *)v4 setItemIdentifiers:v5];

  [(MPStoreItemMetadataRequest *)v4 setPersonalizationStyle:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke_2;
  v10[3] = &unk_1E57EF418;
  id v6 = (void *)a1[6];
  v10[4] = a1[5];
  id v7 = v6;
  uint64_t v8 = a1[4];
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v3;
  id v9 = v3;
  +[MPStoreItemMetadataCacheKey getCacheKeyWithRequest:v4 completionHandler:v10];
}

void __77__MPStoreItemMetadataRequestController_addStoreItemMetadata_forUserIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:");
  id v3 = (MPStoreItemMetadataCache *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v3 = [[MPStoreItemMetadataCache alloc] initWithCacheSize:*(void *)(*(void *)(a1 + 32) + 64)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v3 forKey:v5];
  }
  id v4 = [(MPStoreItemMetadataCache *)v3 addMetadata:*(void *)(a1 + 40) forItemIdentifier:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _removeExpiredItemsPeriodically];
  [*(id *)(a1 + 56) finishWithError:0];
}

- (void)addStoreItemMetadata:(id)a3
{
}

- (void)setCacheSize:(int64_t)a3
{
  id v5 = [MPAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MPStoreItemMetadataRequestController_setCacheSize___block_invoke;
  v7[3] = &unk_1E57EF3F0;
  void v7[4] = self;
  v7[5] = a3;
  id v6 = [(MPAsyncBlockOperation *)v5 initWithStartHandler:v7];
  [(NSOperationQueue *)self->_operationQueue addOperation:v6];
}

void __53__MPStoreItemMetadataRequestController_setCacheSize___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 != *(void *)(v4 + 64))
  {
    [*(id *)(v4 + 32) removeAllObjects];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  *(void *)(v4 + 64) = v3;
  [v5 finishWithError:0];
}

- (void)endTransaction
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  int64_t transactionCount = self->_transactionCount;
  BOOL v6 = transactionCount < 1;
  int64_t v7 = transactionCount - 1;
  if (v6)
  {
    os_unfair_lock_unlock(p_transactionLock);
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MPStoreItemMetadataRequestController.m" lineNumber:91 description:@"Attempting to end a transaction that never began"];
  }
  else
  {
    self->_int64_t transactionCount = v7;
    os_unfair_lock_unlock(p_transactionLock);
  }
}

- (void)beginTransaction
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  ++self->_transactionCount;

  os_unfair_lock_unlock(p_transactionLock);
}

- (MPStoreItemMetadataRequestController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadataRequestController;
  id v2 = [(MPStoreItemMetadataRequestController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemCaches = v2->_itemCaches;
    v2->_itemCaches = v3;

    v2->_lastExpiredMetadataPurgeMachTime = mach_absolute_time();
    v2->_cacheSize = 250;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer/MPStoreItemMetadata.callout", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    int64_t v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v7;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.MediaPlayer.MPStoreItemMetadataRequestController.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v2->_transactionLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (unint64_t)optimalBatchSize
{
  return *MEMORY[0x1E4FB87C8];
}

+ (MPStoreItemMetadataRequestController)sharedStoreItemMetadataRequestController
{
  if (sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestControllerOnceToken != -1) {
    dispatch_once(&sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestControllerOnceToken, &__block_literal_global_11071);
  }
  id v2 = (void *)sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController;

  return (MPStoreItemMetadataRequestController *)v2;
}

void __80__MPStoreItemMetadataRequestController_sharedStoreItemMetadataRequestController__block_invoke()
{
  v0 = objc_alloc_init(MPStoreItemMetadataRequestController);
  v1 = (void *)sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController;
  sharedStoreItemMetadataRequestController_sSharedStoreItemMetadataRequestController = (uint64_t)v0;
}

@end