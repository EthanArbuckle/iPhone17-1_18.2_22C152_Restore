@interface MKPlaceBatchController
- (MKPlaceBatchConsumer)batchConsumer;
- (MKPlaceBatchController)initWithItemIdentifiers:(id)a3 withBatchSize:(unint64_t)a4 minimumNumberOfItemBeforeFetching:(unint64_t)a5 shouldLoadFirstBatchImmediately:(BOOL)a6 usingBatchFetcher:(id)a7 usingBatchConsumer:(id)a8 displayedItemCount:(unint64_t)a9;
- (MKPlaceBatchFetcher)batchFetcher;
- (id)batchesForTesting;
- (int64_t)lastDisplayedIndexForTesting;
- (int64_t)lastFetchedBatchForTesting;
- (int64_t)stateForTesting;
- (unint64_t)batchSize;
- (unint64_t)minNumberOfItems;
- (void)buildBatchesFromIdentifiers:(id)a3;
- (void)didDisplayItemAtIndex:(unint64_t)a3;
- (void)fetchBatchItemsWithIdentifiers:(id)a3;
- (void)handleFetchGuidesCompleted:(BOOL)a3 error:(id)a4 usingGuides:(id)a5;
- (void)setBatchConsumer:(id)a3;
- (void)setBatchFetcher:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setMinNumberOfItems:(unint64_t)a3;
@end

@implementation MKPlaceBatchController

- (MKPlaceBatchController)initWithItemIdentifiers:(id)a3 withBatchSize:(unint64_t)a4 minimumNumberOfItemBeforeFetching:(unint64_t)a5 shouldLoadFirstBatchImmediately:(BOOL)a6 usingBatchFetcher:(id)a7 usingBatchConsumer:(id)a8 displayedItemCount:(unint64_t)a9
{
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MKPlaceBatchController;
  v18 = [(MKPlaceBatchController *)&v24 init];
  if (!v18) {
    goto LABEL_8;
  }
  uint64_t v19 = [v15 count];
  v20 = 0;
  if (a5 <= a4 && a4 && v19)
  {
    *((void *)v18 + 9) = a4;
    *((void *)v18 + 10) = a5;
    objc_storeWeak((id *)v18 + 11, v16);
    objc_storeWeak((id *)v18 + 12, v17);
    uint64_t v21 = geo_dispatch_queue_create_with_qos();
    v22 = (void *)*((void *)v18 + 8);
    *((void *)v18 + 8) = v21;

    [v18 buildBatchesFromIdentifiers:v15];
    *(_OWORD *)(v18 + 24) = xmmword_18BD1ABA0;
    *((void *)v18 + 1) = 0;
    if (v11)
    {
      *((void *)v18 + 7) = 0;
      [v18 didDisplayItemAtIndex:a5];
    }
    else
    {
      *((void *)v18 + 7) = a9;
    }
LABEL_8:
    v20 = v18;
  }

  return v20;
}

- (void)didDisplayItemAtIndex:(unint64_t)a3
{
  batchControllerQueue = self->_batchControllerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MKPlaceBatchController_didDisplayItemAtIndex___block_invoke;
  v4[3] = &unk_1E54B81B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(batchControllerQueue, v4);
}

void __48__MKPlaceBatchController_didDisplayItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  unint64_t v1 = *(void *)(a1 + 40);
  if (v1 <= v2[6] + v2[7] && v2[1] <= (int64_t)v1)
  {
    v2[1] = v1;
    v4 = MKGetCuratedCollectionsBatchControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v20 = 134217984;
      uint64_t v21 = v5;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "[<-->] Last displayed cell : %ld", (uint8_t *)&v20, 0xCu);
    }

    v6 = *(void **)(a1 + 32);
    if (v6[4] != 1)
    {
      v6[4] = 2;
      v6 = *(void **)(a1 + 32);
    }
    uint64_t v7 = v6[1];
    uint64_t v8 = v6[7];
    uint64_t v9 = [v6 minNumberOfItems];
    uint64_t v10 = v8 - v9;
    if (v8 - v9 < 0) {
      uint64_t v10 = v9 - v8;
    }
    if (v7 >= v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 24);
      if (v12 < [*(id *)(v11 + 40) count] - 1)
      {
        uint64_t v13 = *(void *)(a1 + 32);
        if (*(void *)(v13 + 32) != 1)
        {
          ++*(void *)(v13 + 24);
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = *(void *)(v14 + 24);
          if (v15 < [*(id *)(v14 + 40) count])
          {
            id v16 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndex:*(void *)(*(void *)(a1 + 32) + 24)];
            *(void *)(*(void *)(a1 + 32) + 32) = 1;
            id v17 = MKGetCuratedCollectionsBatchControllerLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 24);
              uint64_t v19 = [v16 count];
              int v20 = 134218240;
              uint64_t v21 = v18;
              __int16 v22 = 2048;
              uint64_t v23 = v19;
              _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_INFO, "[<-->] Started Fetching Batch: %ld of %ld Items", (uint8_t *)&v20, 0x16u);
            }

            [*(id *)(a1 + 32) fetchBatchItemsWithIdentifiers:v16];
          }
        }
      }
    }
  }
}

- (void)fetchBatchItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MKPlaceBatchController *)self batchConsumer];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(MKPlaceBatchController *)self batchConsumer];
    [v7 didStartFetchingBatch];
  }
  objc_initWeak(&location, self);
  uint64_t v8 = [(MKPlaceBatchController *)self batchFetcher];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MKPlaceBatchController_fetchBatchItemsWithIdentifiers___block_invoke;
  v9[3] = &unk_1E54B81D8;
  objc_copyWeak(&v10, &location);
  [v8 fetchGuidesWithIdentifiers:v4 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__MKPlaceBatchController_fetchBatchItemsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleFetchGuidesCompleted:a2 error:v10 usingGuides:v7];
  }
}

- (void)handleFetchGuidesCompleted:(BOOL)a3 error:(id)a4 usingGuides:(id)a5
{
  BOOL v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    --self->_lastFetchedBatch;
    self->_state = 3;
    uint64_t v11 = MKGetCuratedCollectionsBatchControllerLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int64_t lastFetchedBatch = self->_lastFetchedBatch;
      int v20 = 134218242;
      int64_t v21 = lastFetchedBatch;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v8;
      _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_INFO, "[<-->] Failed Fetching Batch: %ld. Informing cosumer. Error: %@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v13 = [(MKPlaceBatchController *)self batchConsumer];
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    id v16 = 0;
LABEL_9:
    [v13 shouldConsumeBatch:v15 fetchedBatch:v16];

    goto LABEL_10;
  }
  if (v6)
  {
    self->_state = 2;
    self->_totalIdentifiersFetched += [v9 count];
    id v17 = MKGetCuratedCollectionsBatchControllerLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int64_t v18 = self->_lastFetchedBatch;
      unint64_t totalIdentifiersFetched = self->_totalIdentifiersFetched;
      int v20 = 134218240;
      int64_t v21 = v18;
      __int16 v22 = 2048;
      unint64_t v23 = totalIdentifiersFetched;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_INFO, "[<-->] Finished Fetching Batch: %ld. Informing cosumer.. Total Identifiers fetched: %ld", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v13 = [(MKPlaceBatchController *)self batchConsumer];
    uint64_t v14 = v13;
    uint64_t v15 = 1;
    id v16 = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)buildBatchesFromIdentifiers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_totalIdentifiers = [v4 count];
  unint64_t v5 = [(MKPlaceBatchController *)self batchSize];
  unint64_t v6 = [v4 count] / v5;
  if ([v4 count] % v5) {
    unint64_t v7 = v6 + 1;
  }
  else {
    unint64_t v7 = v6;
  }
  self->_numberOfBatches = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_numberOfBatches];
  if (self->_totalIdentifiers)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = v5;
    do
    {
      unint64_t v13 = v11 + v5;
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
      uint64_t v15 = [v4 objectsAtIndexes:v14];
      [v8 addObject:v15];

      v10 -= v5;
      v12 += v5;
      uint64_t v11 = v13;
    }
    while (v13 < self->_totalIdentifiers);
  }
  id v16 = (NSArray *)[v8 copy];
  batches = self->_batches;
  self->_batches = v16;

  int64_t v18 = MKGetCuratedCollectionsBatchControllerLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v19 = [(NSArray *)self->_batches count];
    int v20 = 134218496;
    NSUInteger v21 = v19;
    __int16 v22 = 2048;
    uint64_t v23 = [v4 count];
    __int16 v24 = 2048;
    unint64_t v25 = v5;
    _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_DEBUG, "[<-->] Built %ld batches from %ld identifiers. Maximum batch size: %ld", (uint8_t *)&v20, 0x20u);
  }
}

- (id)batchesForTesting
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MKPlaceBatchController_batchesForTesting__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__MKPlaceBatchController_batchesForTesting__block_invoke(uint64_t a1)
{
}

- (int64_t)lastDisplayedIndexForTesting
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MKPlaceBatchController_lastDisplayedIndexForTesting__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__MKPlaceBatchController_lastDisplayedIndexForTesting__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

- (int64_t)lastFetchedBatchForTesting
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MKPlaceBatchController_lastFetchedBatchForTesting__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__MKPlaceBatchController_lastFetchedBatchForTesting__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (int64_t)stateForTesting
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  batchControllerQueue = self->_batchControllerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MKPlaceBatchController_stateForTesting__block_invoke;
  v5[3] = &unk_1E54B8200;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(batchControllerQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__MKPlaceBatchController_stateForTesting__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)minNumberOfItems
{
  return self->_minNumberOfItems;
}

- (void)setMinNumberOfItems:(unint64_t)a3
{
  self->_minNumberOfItems = a3;
}

- (MKPlaceBatchFetcher)batchFetcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_batchFetcher);

  return (MKPlaceBatchFetcher *)WeakRetained;
}

- (void)setBatchFetcher:(id)a3
{
}

- (MKPlaceBatchConsumer)batchConsumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_batchConsumer);

  return (MKPlaceBatchConsumer *)WeakRetained;
}

- (void)setBatchConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_batchConsumer);
  objc_destroyWeak((id *)&self->_batchFetcher);
  objc_storeStrong((id *)&self->_batchControllerQueue, 0);

  objc_storeStrong((id *)&self->_batches, 0);
}

@end