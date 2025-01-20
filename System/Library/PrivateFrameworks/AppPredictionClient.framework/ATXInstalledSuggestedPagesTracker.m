@interface ATXInstalledSuggestedPagesTracker
- (ATXInstalledSuggestedPagesTracker)init;
- (ATXInstalledSuggestedPagesTracker)initWithPath:(id)a3;
- (id)_allInstalledPages;
- (id)allInstalledPages;
- (id)identifierOfSuggestedPageForModeUUID:(id)a3;
- (int64_t)suggestedPageTypeWithIdentifier:(id)a3;
- (void)_serializePages:(id)a3;
- (void)removePagesWithIdentifiersNotInSet:(id)a3;
- (void)storePageIdentifier:(id)a3 modeUUID:(id)a4 forPageType:(int64_t)a5;
- (void)trackSuggestedHomePageWithAction:(int64_t)a3 pageType:(int64_t)a4 identifier:(id)a5;
@end

@implementation ATXInstalledSuggestedPagesTracker

- (ATXInstalledSuggestedPagesTracker)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"InstalledSuggestedPages"];
  v4 = [(ATXInstalledSuggestedPagesTracker *)self initWithPath:v3];

  return v4;
}

- (ATXInstalledSuggestedPagesTracker)initWithPath:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXInstalledSuggestedPagesTracker;
  v5 = [(ATXInstalledSuggestedPagesTracker *)&v17 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("ATXInstalledSuggestedPagesTracker.queue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F4B638]);
    v10 = __atxlog_handle_modes();
    uint64_t v11 = [v9 initWithCacheFilePath:v4 loggingHandle:v10 debugName:@"installed suggested pages"];
    cache = v5->_cache;
    v5->_cache = (ATXGenericFileBasedCache *)v11;

    uint64_t v13 = objc_opt_new();
    suggestedHomePageStream = v5->_suggestedHomePageStream;
    v5->_suggestedHomePageStream = (ATXBiomeSuggestedHomePageStream *)v13;

    v15 = v5;
  }

  return v5;
}

- (id)allInstalledPages
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInstalledSuggestedPagesTracker_allInstalledPages__block_invoke;
  v5[3] = &unk_1E5D06DE8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXInstalledSuggestedPagesTracker_allInstalledPages__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _allInstalledPages];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_allInstalledPages
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)MEMORY[0x1AD0D3C30]();
  cache = self->_cache;
  id v5 = (void *)MEMORY[0x1AD0D3C30]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [(ATXGenericFileBasedCache *)cache readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:0 error:3.40282347e38];

  return v9;
}

- (int64_t)suggestedPageTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke;
  block[3] = &unk_1E5D07D88;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allInstalledPages];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke_2;
  v5[3] = &unk_1E5D07D60;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __69__ATXInstalledSuggestedPagesTracker_suggestedPageTypeWithIdentifier___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v5 = [v7 identifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 pageType];
    *a3 = 1;
  }
}

- (id)identifierOfSuggestedPageForModeUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke;
  block[3] = &unk_1E5D07D88;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allInstalledPages];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke_2;
  v5[3] = &unk_1E5D07D60;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __74__ATXInstalledSuggestedPagesTracker_identifierOfSuggestedPageForModeUUID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 modeUUID];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = [v10 identifier];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a3 = 1;
  }
}

- (void)_serializePages:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  [(ATXGenericFileBasedCache *)self->_cache storeSecureCodedObject:v5 error:0];
}

- (void)trackSuggestedHomePageWithAction:(int64_t)a3 pageType:(int64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__ATXInstalledSuggestedPagesTracker_trackSuggestedHomePageWithAction_pageType_identifier___block_invoke;
  v11[3] = &unk_1E5D05D28;
  int64_t v14 = a4;
  int64_t v15 = a3;
  id v12 = v8;
  uint64_t v13 = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

void __90__ATXInstalledSuggestedPagesTracker_trackSuggestedHomePageWithAction_pageType_identifier___block_invoke(void *a1)
{
  uint64_t v2 = [[ATXBiomeSuggestedHomePageEvent alloc] initWithPageType:a1[6] identifier:a1[4] action:a1[7]];
  [*(id *)(a1[5] + 24) sendEvent:v2];
}

- (void)storePageIdentifier:(id)a3 modeUUID:(id)a4 forPageType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__ATXInstalledSuggestedPagesTracker_storePageIdentifier_modeUUID_forPageType___block_invoke;
  v13[3] = &unk_1E5D071E0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

void __78__ATXInstalledSuggestedPagesTracker_storePageIdentifier_modeUUID_forPageType___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _allInstalledPages];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  int v6 = objc_opt_new();
  [v6 setIdentifier:*(void *)(a1 + 40)];
  [v6 setPageType:*(void *)(a1 + 56)];
  [v6 setModeUUID:*(void *)(a1 + 48)];
  [v5 removeObject:v6];
  [v5 addObject:v6];
  [*(id *)(a1 + 32) trackSuggestedHomePageWithAction:0 pageType:*(void *)(a1 + 56) identifier:*(void *)(a1 + 40)];
  uint64_t v7 = __atxlog_handle_modes();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXInstalledSuggestedPagesTracker: Adding installed suggested page: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) _serializePages:v5];
}

- (void)removePagesWithIdentifiersNotInSet:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _allInstalledPages];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke_2;
  v21[3] = &unk_1E5D07DB0;
  id v22 = *(id *)(a1 + 40);
  id v6 = [v5 objectsPassingTest:v21];
  if ([v6 count])
  {
    uint64_t v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "ATXInstalledSuggestedPagesTracker: Removing installed suggested pages: %@", buf, 0xCu);
    }

    [v5 minusSet:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = *(void **)(a1 + 32);
          uint64_t v15 = objc_msgSend(v13, "pageType", (void)v17);
          int64_t v16 = [v13 identifier];
          [v14 trackSuggestedHomePageWithAction:1 pageType:v15 identifier:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) _serializePages:v5];
  }
}

uint64_t __72__ATXInstalledSuggestedPagesTracker_removePagesWithIdentifiersNotInSet___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedHomePageStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end