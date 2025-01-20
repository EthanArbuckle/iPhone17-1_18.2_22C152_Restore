@interface CADMockSpotlightIndex
- (BOOL)_incrementAndCheckIfShouldFailCall;
- (CADMockSpotlightIndex)initWithProvider:(id)a3;
- (double)_artificialDelay;
- (id)_mockFailureError;
- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4;
@end

@implementation CADMockSpotlightIndex

- (CADMockSpotlightIndex)initWithProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADMockSpotlightIndex;
  v5 = [(CADMockSpotlightIndex *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("CADMockSpotlightIndex", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (double)_artificialDelay
{
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  [WeakRetained minArtificialDelay];
  uint64_t v5 = (uint64_t)(v4 * 1000.0);

  id v6 = objc_loadWeakRetained((id *)p_provider);
  [v6 maxArtificialDelay];
  uint64_t v8 = (uint64_t)(v7 * 1000.0);

  unint64_t v9 = v5 & ~(v5 >> 63);
  unint64_t v10 = v8 & ~(v8 >> 63);
  if (v9 >= v10) {
    uint64_t v11 = v8 & ~(v8 >> 63);
  }
  else {
    uint64_t v11 = v5 & ~(v5 >> 63);
  }
  if (v10 > v9) {
    v11 += arc4random_uniform(v10 - v11 + 1);
  }
  return (double)v11 / 1000.0;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CADMockSpotlightIndex *)self _artificialDelay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__CADMockSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E624E7B0;
  id v14 = v6;
  id v15 = v7;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_after(v9, queue, block);
}

void __86__CADMockSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _incrementAndCheckIfShouldFailCall] & 1) != 0
    || (id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8)),
        int v3 = [v2 failDeleteSearchableItemsWithDomainIdentifiers],
        v2,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) _mockFailureError];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v7);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained deleteSearchableItemsWithDomainIdentifiers:*(void *)(a1 + 40)];

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CADMockSpotlightIndex *)self _artificialDelay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CADMockSpotlightIndex_indexSearchableItems_completionHandler___block_invoke;
  block[3] = &unk_1E624E7B0;
  id v14 = v6;
  id v15 = v7;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_after(v9, queue, block);
}

void __64__CADMockSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _incrementAndCheckIfShouldFailCall] & 1) != 0
    || (id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8)),
        int v3 = [v2 failIndexSearchableItems],
        v2,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) _mockFailureError];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v7);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained indexSearchableItems:*(void *)(a1 + 40)];

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CADMockSpotlightIndex *)self _artificialDelay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CADMockSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  block[3] = &unk_1E624E7B0;
  id v14 = v6;
  id v15 = v7;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_after(v9, queue, block);
}

void __79__CADMockSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _incrementAndCheckIfShouldFailCall] & 1) != 0
    || (id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8)),
        int v3 = [v2 failDeleteAllSearchableItemsForBundleID],
        v2,
        v3))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) _mockFailureError];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v7);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [WeakRetained deleteAllSearchableItemsForBundleID:*(void *)(a1 + 40)];

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (id)_mockFailureError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CADMockSpotlightIndexProviderErrorDomain" code:1 userInfo:0];
}

- (BOOL)_incrementAndCheckIfShouldFailCall
{
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  objc_msgSend(WeakRetained, "setNumCalls:", objc_msgSend(WeakRetained, "numCalls") + 1);

  id v4 = objc_loadWeakRetained((id *)p_provider);
  uint64_t v5 = [v4 failureMode];

  switch(v5)
  {
    case 3:
      return 1;
    case 2:
      id v6 = objc_loadWeakRetained((id *)p_provider);
      BOOL v7 = [v6 numCalls] == 2;
      break;
    case 1:
      id v6 = objc_loadWeakRetained((id *)p_provider);
      BOOL v7 = [v6 numCalls] == 1;
      break;
    default:
      return 0;
  }
  BOOL v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end