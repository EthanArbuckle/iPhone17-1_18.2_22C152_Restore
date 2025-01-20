@interface ATXWidgetDescriptorCache
+ (id)sharedInstance;
- (ATXWidgetDescriptorCache)init;
- (ATXWidgetDescriptorCache)initWithCachePath:(id)a3 legacyCachePath:(id)a4;
- (ATXWidgetDescriptorCache)initWithProvider:(id)a3 cachePath:(id)a4 legacyCachePath:(id)a5;
- (BOOL)_queue_writeAllDescriptorMetadata:(id)a3 error:(id *)a4;
- (NSSet)allWidgetDescriptorsAllowedOnLockscreen;
- (NSSet)complicationWidgetDescriptors;
- (NSSet)homeScreenDescriptors;
- (NSSet)inlineComplicationWidgetDescriptors;
- (NSSet)landscapeModularComplicationWidgetDescriptors;
- (NSSet)modularComplicationWidgetDescriptors;
- (id)_fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3;
- (id)_fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3;
- (id)_mergeNewDescriptorsWithCachedMetadataOnInternalQueue:(id)a3 descriptors:(id)a4;
- (id)_queue_allVisibleDescriptors;
- (id)_queue_fetchAllDescriptorMetadataWithError:(id *)a3;
- (id)_queue_fetchAllLegacyDescriptorMetadataWithError:(id *)a3;
- (id)_queue_homeScreenWidgetDescriptors;
- (id)_updateAllDescriptorMetadataOnInternalQueue;
- (id)fetchAccessoryWidgetDescriptorMetadataWithError:(id *)a3;
- (id)fetchHomeScreenWidgetDescriptorMetadataWithError:(id *)a3;
- (id)homeScreenDescriptorForContainerBundleId:(id)a3 widgetKind:(id)a4;
- (id)homeScreenDescriptorForExtensionBundleId:(id)a3 kind:(id)a4;
- (id)homeScreenDescriptorForIntent:(id)a3;
- (id)homeScreenDescriptorForWidget:(id)a3;
- (void)_queue_descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)_scheduleCoalescedDescriptorUpdateOperation;
- (void)_updateAllDescriptorMetadataOnInternalQueue;
- (void)_updateDescriptorMappings;
- (void)dealloc;
- (void)descriptorsDidChangeForDescriptorProvider:(id)a3;
- (void)prepareForTermination;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation ATXWidgetDescriptorCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_82);
  }
  v2 = (void *)sharedInstance_updater;

  return v2;
}

uint64_t __42__ATXWidgetDescriptorCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_updater;
  sharedInstance_updater = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXWidgetDescriptorCache)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"WidgetDescriptorsWithInstallDates"];
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"ATXAvocadoDescriptorsWithInstallDates"];
  v5 = [(ATXWidgetDescriptorCache *)self initWithCachePath:v3 legacyCachePath:v4];

  return v5;
}

- (ATXWidgetDescriptorCache)initWithCachePath:(id)a3 legacyCachePath:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F58E00];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initIncludingIntents:0];
  v10 = [(ATXWidgetDescriptorCache *)self initWithProvider:v9 cachePath:v8 legacyCachePath:v7];

  return v10;
}

- (ATXWidgetDescriptorCache)initWithProvider:(id)a3 cachePath:(id)a4 legacyCachePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)ATXWidgetDescriptorCache;
  v11 = [(ATXWidgetDescriptorCache *)&v36 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("ATXWidgetDescriptorCache.internal", v12);
    internalQueue = v11->_internalQueue;
    v11->_internalQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("ATXWidgetDescriptorCache.observer", v15);
    observerQueue = v11->_observerQueue;
    v11->_observerQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v9 copy];
    cachePath = v11->_cachePath;
    v11->_cachePath = (NSString *)v18;

    uint64_t v20 = [v10 copy];
    legacyCachePath = v11->_legacyCachePath;
    v11->_legacyCachePath = (NSString *)v20;

    objc_initWeak(&location, v11);
    id v22 = objc_alloc(MEMORY[0x1E4F93B98]);
    v23 = v11->_internalQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke;
    v33[3] = &unk_1E5D05748;
    objc_copyWeak(&v34, &location);
    uint64_t v24 = [v22 initWithQueue:v23 operation:v33];
    coalescedDescriptorUpdateOperation = v11->_coalescedDescriptorUpdateOperation;
    v11->_coalescedDescriptorUpdateOperation = (_PASSimpleCoalescingTimer *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v26;

    v28 = v11->_internalQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_23;
    v30[3] = &unk_1E5D04FC8;
    v31 = v11;
    id v32 = v8;
    dispatch_async(v28, v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateDescriptorMappings];
  }
  else
  {
    v3 = __atxlog_handle_blending();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_cold_1(v3);
    }
  }
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_23(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addObserver:");
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) descriptors];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v3;

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
  id v7 = __atxlog_handle_default();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 64) count];
    int v14 = 134217984;
    uint64_t v15 = v9;
    id v10 = "ATXWidgetDescriptorCache init - descriptor count: %ld";
    v11 = v7;
    uint32_t v12 = 12;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    LOWORD(v14) = 0;
    id v10 = "ATXWidgetDescriptorCache init - descriptors nil";
    v11 = v7;
    uint32_t v12 = 2;
  }
  _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
LABEL_7:

  uint64_t v13 = *(void *)(a1 + 32);
  if (*(void *)(v13 + 8))
  {
    *(void *)(v13 + 40) = 1;
    [*(id *)(a1 + 32) _scheduleCoalescedDescriptorUpdateOperation];
  }
}

- (void)_scheduleCoalescedDescriptorUpdateOperation
{
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATXWidgetDescriptorCache_registerObserver___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __45__ATXWidgetDescriptorCache_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ATXWidgetDescriptorCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __47__ATXWidgetDescriptorCache_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (NSSet)homeScreenDescriptors
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  uint32_t v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ATXWidgetDescriptorCache_homeScreenDescriptors__block_invoke;
  v7[3] = &unk_1E5D06DE8;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(internalQueue, v7);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

uint64_t __49__ATXWidgetDescriptorCache_homeScreenDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_homeScreenWidgetDescriptors");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSSet)allWidgetDescriptorsAllowedOnLockscreen
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F93B08] isiPad];
  uint64_t v4 = objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ATXWidgetDescriptorCache_allWidgetDescriptorsAllowedOnLockscreen__block_invoke;
  block[3] = &unk_1E5D05AC0;
  block[4] = self;
  char v14 = v3;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(internalQueue, block);
  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Returning all complication descriptors: %lu", buf, 0xCu);
  }

  uint64_t v9 = v13;
  uint64_t v10 = (NSSet *)v6;

  return v10;
}

void __67__ATXWidgetDescriptorCache_allWidgetDescriptorsAllowedOnLockscreen__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  char v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v2 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (void)v10) & 0x400) != 0
           || ([v9 supportedFamilies] & 0x800) != 0
           || ([v9 supportedFamilies] & 0x1000) != 0
           || ([v9 supportedFamilies] & 2) != 0)
          && (!*(unsigned char *)(a1 + 48) || [v9 isBackgroundRemovable]))
        {
          [*(id *)(a1 + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSSet)complicationWidgetDescriptors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F93B08] isiPad];
  id v4 = objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ATXWidgetDescriptorCache_complicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E5D05AC0;
  block[4] = self;
  char v14 = v3;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(internalQueue, block);
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Returning all complication descriptors: %lu", buf, 0xCu);
  }

  uint64_t v9 = v13;
  long long v10 = (NSSet *)v6;

  return v10;
}

void __57__ATXWidgetDescriptorCache_complicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  char v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v2 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (void)v10) & 0x400) != 0
           || ([v9 supportedFamilies] & 0x800) != 0
           || ([v9 supportedFamilies] & 0x1000) != 0)
          && (!*(unsigned char *)(a1 + 48) || [v9 isBackgroundRemovable]))
        {
          [*(id *)(a1 + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSSet)modularComplicationWidgetDescriptors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F93B08] isiPad];
  id v4 = objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ATXWidgetDescriptorCache_modularComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E5D05AC0;
  block[4] = self;
  char v14 = v3;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(internalQueue, block);
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Returning modular complication descriptors: %lu", buf, 0xCu);
  }

  uint64_t v9 = v13;
  long long v10 = (NSSet *)v6;

  return v10;
}

void __64__ATXWidgetDescriptorCache_modularComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  char v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v2 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (void)v10) & 0x400) != 0
           || ([v9 supportedFamilies] & 0x800) != 0)
          && (!*(unsigned char *)(a1 + 48) || [v9 isBackgroundRemovable]))
        {
          [*(id *)(a1 + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSSet)landscapeModularComplicationWidgetDescriptors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F93B08] isiPad];
  id v4 = objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ATXWidgetDescriptorCache_landscapeModularComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E5D05AC0;
  block[4] = self;
  char v14 = v3;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(internalQueue, block);
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Returning modular complication descriptors: %lu", buf, 0xCu);
  }

  uint64_t v9 = v13;
  long long v10 = (NSSet *)v6;

  return v10;
}

void __73__ATXWidgetDescriptorCache_landscapeModularComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  char v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v2 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (((objc_msgSend(v9, "supportedFamilies", (void)v10) & 0x400) != 0
           || ([v9 supportedFamilies] & 0x800) != 0
           || ([v9 supportedFamilies] & 2) != 0)
          && (!*(unsigned char *)(a1 + 48) || [v9 isBackgroundRemovable]))
        {
          [*(id *)(a1 + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSSet)inlineComplicationWidgetDescriptors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F93B08] isiPad];
  id v4 = objc_opt_new();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__ATXWidgetDescriptorCache_inlineComplicationWidgetDescriptors__block_invoke;
  block[3] = &unk_1E5D05AC0;
  block[4] = self;
  char v14 = v3;
  id v6 = v4;
  id v13 = v6;
  dispatch_sync(internalQueue, block);
  uint64_t v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Returning inline complication descriptors: %lu", buf, 0xCu);
  }

  uint64_t v9 = v13;
  long long v10 = (NSSet *)v6;

  return v10;
}

void __63__ATXWidgetDescriptorCache_inlineComplicationWidgetDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_allVisibleDescriptors");
  char v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = [v2 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Descriptor count: %lu", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((!*(unsigned char *)(a1 + 48)
           || objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isBackgroundRemovable", (void)v10))
          && (objc_msgSend(v9, "supportedFamilies", (void)v10) & 0x1000) != 0)
        {
          [*(id *)(a1 + 40) addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_queue_allVisibleDescriptors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  allDescriptors = self->_allDescriptors;

  return (id)[(NSSet *)allDescriptors _pas_filteredSetWithTest:&__block_literal_global_29_0];
}

BOOL __56__ATXWidgetDescriptorCache__queue_allVisibleDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 widgetVisibility];
  if (v3 == 3)
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Filtering out descriptor with default-off visibility: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 != 3;
}

- (id)_queue_homeScreenWidgetDescriptors
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v3 = [(ATXWidgetDescriptorCache *)self _queue_allVisibleDescriptors];
  id v4 = objc_msgSend(v3, "_pas_filteredSetWithTest:", &__block_literal_global_31_1);

  return v4;
}

uint64_t __62__ATXWidgetDescriptorCache__queue_homeScreenWidgetDescriptors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_hasHomeScreenWidgetFamilies");
}

- (void)prepareForTermination
{
}

- (void)dealloc
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ATXWidgetDescriptorCache_dealloc__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  dispatch_sync(internalQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ATXWidgetDescriptorCache;
  [(ATXWidgetDescriptorCache *)&v4 dealloc];
}

uint64_t __35__ATXWidgetDescriptorCache_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObserver:");
}

- (id)homeScreenDescriptorForIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 launchId];

  if (v5)
  {
    int v6 = [v4 launchId];
    id v7 = objc_msgSend(v4, "atx_intentType");
    uint64_t v8 = keyForStrings(v6, v7);

    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__19;
    v21 = __Block_byref_object_dispose__19;
    id v22 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke;
    block[3] = &unk_1E5D072F0;
    id v15 = v8;
    uint64_t v16 = &v17;
    block[4] = self;
    id v10 = v8;
    dispatch_sync(internalQueue, block);
    id v11 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    long long v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetDescriptorCache homeScreenDescriptorForIntent:]();
    }

    id v11 = 0;
  }

  return v11;
}

void __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(v1 + 16) + 8) + 40))
  {
    uint64_t v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke_cold_1(v1 + 8, v1);
    }
  }
}

- (id)homeScreenDescriptorForContainerBundleId:(id)a3 widgetKind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__19;
  id v22 = __Block_byref_object_dispose__19;
  id v23 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke;
  v13[3] = &unk_1E5D09D10;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = self;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

void __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke(uint64_t a1)
{
  uint64_t v2 = keyForStrings(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = a1 + 48;
  uint64_t v5 = [*(id *)(v4 + 88) objectForKeyedSubscript:v2];
  uint64_t v6 = *(void *)(*(void *)(v3 + 8) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40))
  {
    uint64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)homeScreenDescriptorForWidget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appBundleId];
  uint64_t v6 = [v4 widgetKind];

  id v7 = [(ATXWidgetDescriptorCache *)self homeScreenDescriptorForContainerBundleId:v5 widgetKind:v6];

  return v7;
}

- (id)homeScreenDescriptorForExtensionBundleId:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXWidgetDescriptorCache *)self homeScreenDescriptors];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__ATXWidgetDescriptorCache_homeScreenDescriptorForExtensionBundleId_kind___block_invoke;
  v13[3] = &unk_1E5D09D38;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_msgSend(v8, "bs_firstObjectPassingTest:", v13);

  return v11;
}

uint64_t __74__ATXWidgetDescriptorCache_homeScreenDescriptorForExtensionBundleId_kind___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 extensionIdentity];
  uint64_t v5 = [v4 extensionBundleIdentifier];
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    id v6 = [v3 kind];
    uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_mergeNewDescriptorsWithCachedMetadataOnInternalQueue:(id)a3 descriptors:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v8 = objc_opt_new();
  id v32 = [MEMORY[0x1E4F1C9C8] now];
  id v9 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v10 = (void *)[v9 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v11 = [v10 objectForKey:@"dateOfFirstInstalledAvocado"];

  if (!v11) {
    [v10 setObject:v32 forKey:@"dateOfFirstInstalledAvocado"];
  }
  v29 = v10;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    id v15 = off_1E5D04000;
    uint64_t v30 = *(void *)v36;
    id v31 = v6;
    do
    {
      uint64_t v16 = 0;
      uint64_t v33 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
        uint64_t v18 = (void *)MEMORY[0x1AD0D3C30]();
        uint64_t v19 = (void *)[objc_alloc(v15[192]) initWithDescriptor:v17];
        uint64_t v20 = [v6 objectForKeyedSubscript:v19];
        if (v20)
        {
          [v8 setObject:v20 forKeyedSubscript:v19];
        }
        else
        {
          v21 = v8;
          id v22 = __atxlog_handle_default();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v40 = "-[ATXWidgetDescriptorCache _mergeNewDescriptorsWithCachedMetadataOnInternalQueue:descriptors:]";
            __int16 v41 = 2112;
            v42 = v17;
            _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "%s: added new widget descriptor to cache: %@", buf, 0x16u);
          }

          id v23 = [ATXWidgetDescriptorCacheMetadata alloc];
          uint64_t v24 = [v17 extensionIdentity];
          v25 = [v24 containerBundleIdentifier];
          uint64_t v26 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v23, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v32, v25, objc_msgSend(v17, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v17, "atx_hasAccessoryWidgetFamiliesOnly"));
          uint64_t v8 = v21;
          [v21 setObject:v26 forKeyedSubscript:v19];

          uint64_t v14 = v30;
          id v6 = v31;
          id v15 = off_1E5D04000;
          uint64_t v13 = v33;
        }

        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v13);
  }

  v27 = (void *)[v8 copy];

  return v27;
}

- (id)_updateAllDescriptorMetadataOnInternalQueue
{
  id v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v4 = [(ATXWidgetDescriptorCache *)self _queue_fetchAllDescriptorMetadataWithError:0];
  uint64_t v5 = [(ATXWidgetDescriptorCache *)self _queue_allVisibleDescriptors];
  id v6 = [(ATXWidgetDescriptorCache *)self _mergeNewDescriptorsWithCachedMetadataOnInternalQueue:v4 descriptors:v5];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:self->_legacyCachePath];

  if (![v4 isEqualToDictionary:v6] || v8)
  {
    id v30 = 0;
    BOOL v9 = [(ATXWidgetDescriptorCache *)self _queue_writeAllDescriptorMetadata:v6 error:&v30];
    id v10 = v30;
    if (v9)
    {
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      legacyCachePath = self->_legacyCachePath;
      id v29 = v10;
      char v13 = [v11 removeItemAtPath:legacyCachePath error:&v29];
      id v14 = v29;

      if (v13)
      {
        id v10 = v14;
        goto LABEL_13;
      }
      id v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(ATXWidgetDescriptorCache *)(uint64_t)v14 _updateAllDescriptorMetadataOnInternalQueue];
      }
      id v10 = v14;
    }
    else
    {
      id v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(ATXWidgetDescriptorCache *)(uint64_t)v10 _updateAllDescriptorMetadataOnInternalQueue];
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (id)fetchAccessoryWidgetDescriptorMetadataWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  uint64_t v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__19;
  uint64_t v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ATXWidgetDescriptorCache_fetchAccessoryWidgetDescriptorMetadataWithError___block_invoke;
  block[3] = &unk_1E5D09D60;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __76__ATXWidgetDescriptorCache_fetchAccessoryWidgetDescriptorMetadataWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)fetchHomeScreenWidgetDescriptorMetadataWithError:(id *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  uint64_t v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__19;
  uint64_t v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ATXWidgetDescriptorCache_fetchHomeScreenWidgetDescriptorMetadataWithError___block_invoke;
  block[3] = &unk_1E5D09D60;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(internalQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __77__ATXWidgetDescriptorCache_fetchHomeScreenWidgetDescriptorMetadataWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v11 = 0;
  id v6 = [(ATXWidgetDescriptorCache *)self _queue_fetchAllDescriptorMetadataWithError:&v11];
  id v7 = v11;
  uint64_t v8 = [v6 keysOfEntriesPassingTest:&__block_literal_global_44];
  BOOL v9 = [v8 allObjects];

  [v6 removeObjectsForKeys:v9];
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

uint64_t __92__ATXWidgetDescriptorCache__fetchAccessoryWidgetDescriptorMetadataOnInternalQueueWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 hasHomeScreenWidgetFamiliesOnly];
}

- (id)_fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError:(id *)a3
{
  uint64_t v5 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v11 = 0;
  id v6 = [(ATXWidgetDescriptorCache *)self _queue_fetchAllDescriptorMetadataWithError:&v11];
  id v7 = v11;
  uint64_t v8 = [v6 keysOfEntriesPassingTest:&__block_literal_global_46];
  BOOL v9 = [v8 allObjects];

  [v6 removeObjectsForKeys:v9];
  if (a3) {
    *a3 = v7;
  }

  return v6;
}

uint64_t __93__ATXWidgetDescriptorCache__fetchHomeScreenWidgetDescriptorMetadataOnInternalQueueWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 hasAccessoryWidgetFamiliesOnly];
}

- (id)_queue_fetchAllDescriptorMetadataWithError:(id *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = objc_alloc(MEMORY[0x1E4F4B638]);
  cachePath = self->_cachePath;
  id v7 = __atxlog_handle_default();
  uint64_t v8 = (void *)[v5 initWithCacheFilePath:cachePath loggingHandle:v7 debugName:@"widget descriptor metadata"];

  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
  id v63 = 0;
  id v13 = [v8 readSecureCodedObjectWithMaxValidAge:v12 allowableClasses:&v63 error:-1.0];
  id v14 = v63;
  if ([v13 count])
  {
    id v44 = v14;
    v46 = v12;
    v47 = v8;
    id v52 = (id)objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v45 = v13;
    id v15 = v13;
    uint64_t v54 = [v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v54)
    {
      uint64_t v16 = self;
      uint64_t v53 = *(void *)v59;
      id v50 = v15;
      v51 = self;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(v15);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          id v19 = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v20 = [v15 objectForKeyedSubscript:v18];
          allDescriptors = v16->_allDescriptors;
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __71__ATXWidgetDescriptorCache__queue_fetchAllDescriptorMetadataWithError___block_invoke;
          v57[3] = &unk_1E5D09DA8;
          v57[4] = v18;
          uint64_t v22 = [(NSSet *)allDescriptors bs_firstObjectPassingTest:v57];
          if (v22)
          {
            v55 = v19;
            uint64_t v23 = [ATXWidgetDescriptorCacheMetadata alloc];
            v56 = v20;
            uint64_t v24 = [v20 installDate];
            uint64_t v25 = (uint64_t)v24;
            if (!v24)
            {
              uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
              v49 = (void *)v25;
            }
            uint64_t v26 = [v22 extensionIdentity];
            uint64_t v27 = [v26 containerBundleIdentifier];
            uint64_t v28 = (uint64_t)v27;
            if (!v27)
            {
              uint64_t v28 = [v56 containerBundleId];
              v48 = (void *)v28;
            }
            id v29 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v23, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v25, v28, objc_msgSend(v22, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v22, "atx_hasAccessoryWidgetFamiliesOnly"));
            [v52 setObject:v29 forKeyedSubscript:v18];

            if (!v27) {
            if (!v24)
            }

            id v15 = v50;
            uint64_t v16 = v51;
            id v19 = v55;
            uint64_t v20 = v56;
          }
          else
          {
            uint64_t v24 = __atxlog_handle_default();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v65 = "-[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:]";
              __int16 v66 = 2112;
              uint64_t v67 = v18;
              _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "%s: could not find descriptor matching %@ that was present in cached metadata", buf, 0x16u);
            }
          }
        }
        uint64_t v54 = [v15 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v54);
    }

    uint64_t v12 = v46;
    uint64_t v8 = v47;
    id v14 = v44;
    id v13 = v45;
  }
  else if (self->_legacyCachePath {
         && ([MEMORY[0x1E4F28CB8] defaultManager],
  }
             id v30 = objc_claimAutoreleasedReturnValue(),
             char v31 = [v30 fileExistsAtPath:self->_legacyCachePath],
             v30,
             (v31 & 1) != 0))
  {
    id v62 = 0;
    id v32 = [(ATXWidgetDescriptorCache *)self _queue_fetchAllLegacyDescriptorMetadataWithError:&v62];
    id v33 = v62;
    if ([v32 count])
    {
      id v52 = v32;
    }
    else
    {
      __int16 v41 = __atxlog_handle_default();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        [(ATXWidgetDescriptorCache *)(uint64_t)v33 _queue_fetchAllDescriptorMetadataWithError:v41];
      }

      if (a3)
      {
        if (v33) {
          v42 = v33;
        }
        else {
          v42 = v14;
        }
        id v52 = 0;
        *a3 = v42;
      }
      else
      {
        id v52 = 0;
      }
    }
  }
  else
  {
    id v34 = __atxlog_handle_default();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetDescriptorCache _queue_fetchAllDescriptorMetadataWithError:]((uint64_t)v14, v34, v35, v36, v37, v38, v39, v40);
    }

    id v52 = 0;
    if (a3) {
      *a3 = v14;
    }
  }

  return v52;
}

uint64_t __71__ATXWidgetDescriptorCache__queue_fetchAllDescriptorMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = [[ATXWidgetPersonality alloc] initWithDescriptor:v3];
  uint64_t v6 = [(ATXWidgetPersonality *)v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (BOOL)_queue_writeAllDescriptorMetadata:(id)a3 error:(id *)a4
{
  internalQueue = self->_internalQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(internalQueue);
  id v8 = objc_alloc(MEMORY[0x1E4F4B638]);
  cachePath = self->_cachePath;
  uint64_t v10 = __atxlog_handle_default();
  uint64_t v11 = (void *)[v8 initWithCacheFilePath:cachePath loggingHandle:v10 debugName:@"widget descriptor metadata"];

  LOBYTE(a4) = [v11 storeSecureCodedObject:v7 error:a4];
  return (char)a4;
}

- (id)_queue_fetchAllLegacyDescriptorMetadataWithError:(id *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v5 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v52 = self;
  legacyCachePath = self->_legacyCachePath;
  id v7 = __atxlog_handle_default();
  id v8 = (void *)[v5 initWithCacheFilePath:legacyCachePath loggingHandle:v7 debugName:@"legacy widget descriptor metadata"];

  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  id v14 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
  id v15 = [v8 readSecureCodedObjectWithMaxValidAge:v14 allowableClasses:a3 error:-1.0];
  if (v15)
  {
    id v50 = (id)objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (!v17) {
      goto LABEL_25;
    }
    uint64_t v18 = v17;
    v45 = v15;
    v46 = v14;
    v47 = v8;
    uint64_t v19 = *(void *)v56;
    uint64_t v48 = *(void *)v56;
    v49 = v16;
    while (1)
    {
      uint64_t v20 = 0;
      uint64_t v51 = v18;
      do
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
        uint64_t v22 = (void *)MEMORY[0x1AD0D3C30]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v21;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_19;
          }
          extensionBundleIdAndKindKey(v21);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        allDescriptors = v52->_allDescriptors;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __77__ATXWidgetDescriptorCache__queue_fetchAllLegacyDescriptorMetadataWithError___block_invoke;
        v53[3] = &unk_1E5D09DA8;
        id v25 = v23;
        id v54 = v25;
        uint64_t v26 = [(NSSet *)allDescriptors bs_firstObjectPassingTest:v53];
        if (v26)
        {
          uint64_t v27 = [v16 objectForKeyedSubscript:v21];
          uint64_t v28 = [v27 objectForKeyedSubscript:@"installDate"];
          id v29 = v28;
          if (v28)
          {
            id v30 = v28;
          }
          else
          {
            id v30 = [MEMORY[0x1E4F1C9C8] now];
          }
          char v31 = v30;

          id v32 = [[ATXWidgetPersonality alloc] initWithDescriptor:v26];
          id v33 = [ATXWidgetDescriptorCacheMetadata alloc];
          id v34 = [v26 extensionIdentity];
          uint64_t v35 = [v34 containerBundleIdentifier];
          uint64_t v36 = -[ATXWidgetDescriptorCacheMetadata initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:](v33, "initWithInstallDate:containerBundleId:hasHomeScreenWidgetFamiliesOnly:hasAccessoryWidgetFamiliesOnly:", v31, v35, objc_msgSend(v26, "atx_hasHomeScreenWidgetFamiliesOnly"), objc_msgSend(v26, "atx_hasAccessoryWidgetFamiliesOnly"));
          [v50 setObject:v36 forKeyedSubscript:v32];

          uint64_t v19 = v48;
          uint64_t v16 = v49;
          uint64_t v18 = v51;
        }
        else
        {
          uint64_t v27 = __atxlog_handle_default();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            long long v60 = "-[ATXWidgetDescriptorCache _queue_fetchAllLegacyDescriptorMetadataWithError:]";
            __int16 v61 = 2112;
            id v62 = v21;
            _os_log_impl(&dword_1A790D000, v27, OS_LOG_TYPE_DEFAULT, "%s: could not find descriptor matching %@ that was present in cached metadata", buf, 0x16u);
          }
        }

LABEL_19:
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (!v18)
      {
        id v14 = v46;
        id v8 = v47;
        id v15 = v45;
        goto LABEL_25;
      }
    }
  }
  uint64_t v16 = __atxlog_handle_default();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ATXWidgetDescriptorCache _queue_fetchAllLegacyDescriptorMetadataWithError:](v16, v37, v38, v39, v40, v41, v42, v43);
  }
  id v50 = 0;
LABEL_25:

  return v50;
}

uint64_t __77__ATXWidgetDescriptorCache__queue_fetchAllLegacyDescriptorMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD0D3C30]();
  id v5 = extensionBundleIdAndKindKey(v3);
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

- (void)_updateDescriptorMappings
{
  uint64_t v2 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v3 = [(ATXWidgetDescriptorCache *)v2 _updateAllDescriptorMetadataOnInternalQueue];
  uint64_t v4 = (void *)v3;
  if (v2->_coalescedDescriptorUpdateOptions)
  {
    v46 = (void *)v3;
    v47 = v2;
    id v6 = [(ATXWidgetDescriptorCache *)v2 _queue_homeScreenWidgetDescriptors];
    uint64_t v48 = (NSDictionary *)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:buf count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      uint64_t v10 = @".";
      uint64_t v11 = @"appintent:";
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v14 = (void *)MEMORY[0x1AD0D3C30]();
          id v15 = [v13 intentType];
          uint64_t v16 = [v15 componentsSeparatedByString:v10];
          uint64_t v17 = [v16 lastObject];

          if ([v17 hasPrefix:v11])
          {
            uint64_t v18 = objc_msgSend(v17, "substringFromIndex:", -[__CFString length](v11, "length"));

            uint64_t v17 = (void *)v18;
          }
          uint64_t v19 = [v13 extensionIdentity];
          uint64_t v20 = [v19 containerBundleIdentifier];

          if (v20) {
            BOOL v21 = v17 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            uint64_t v22 = [v13 extensionIdentity];
            id v23 = [v22 containerBundleIdentifier];
            keyForStrings(v23, v17);
            id v50 = v14;
            uint64_t v24 = v8;
            uint64_t v25 = v9;
            uint64_t v26 = v11;
            v28 = uint64_t v27 = v10;

            [(NSDictionary *)v48 setObject:v13 forKeyedSubscript:v28];
            uint64_t v10 = v27;
            uint64_t v11 = v26;
            uint64_t v9 = v25;
            uint64_t v8 = v24;
            id v14 = v50;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:buf count:16];
      }
      while (v8);
    }

    intentToHomeScreenDescriptorDictionary = v47->_intentToHomeScreenDescriptorDictionary;
    v47->_intentToHomeScreenDescriptorDictionary = v48;

    id v30 = obj;
    char v31 = (NSDictionary *)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v51 = v30;
    uint64_t v32 = [v51 countByEnumeratingWithState:&v53 objects:buf count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v51);
          }
          uint64_t v36 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          uint64_t v37 = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v38 = [v36 extensionIdentity];
          uint64_t v39 = [v38 containerBundleIdentifier];

          if (v39)
          {
            uint64_t v40 = [v36 extensionIdentity];
            uint64_t v41 = [v40 containerBundleIdentifier];
            uint64_t v42 = [v36 kind];
            uint64_t v43 = keyForStrings(v41, v42);

            [(NSDictionary *)v31 setObject:v36 forKeyedSubscript:v43];
          }
        }
        uint64_t v33 = [v51 countByEnumeratingWithState:&v53 objects:buf count:16];
      }
      while (v33);
    }
    id v5 = v51;

    uint64_t v2 = v47;
    containerBundleIdAndKindToHomeScreenDescriptorDictionary = v47->_containerBundleIdAndKindToHomeScreenDescriptorDictionary;
    v47->_containerBundleIdAndKindToHomeScreenDescriptorDictionary = v31;

    uint64_t v4 = v46;
    if (v46 && v51)
    {
      v45 = dispatch_get_global_queue(17, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__ATXWidgetDescriptorCache__updateDescriptorMappings__block_invoke;
      block[3] = &unk_1E5D05300;
      block[4] = v47;
      dispatch_async(v45, block);
    }
  }
  else
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXWidgetDescriptorCache: home screen descriptors did not change", buf, 2u);
    }
  }

  v2->_coalescedDescriptorUpdateOptions = 0;
}

void __53__ATXWidgetDescriptorCache__updateDescriptorMappings__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ATXHomeScreenWidgetDescriptorCacheRefresh" object:*(void *)(a1 + 32)];
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__ATXWidgetDescriptorCache_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v7[3] = &unk_1E5D04FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __70__ATXWidgetDescriptorCache_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_descriptorsDidChangeForDescriptorProvider:", *(void *)(a1 + 40));
}

- (void)_queue_descriptorsDidChangeForDescriptorProvider:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  id v6 = [(ATXWidgetDescriptorCache *)self _queue_homeScreenWidgetDescriptors];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  uint64_t v9 = v8;

  uint64_t v10 = [v5 descriptors];

  allDescriptors = self->_allDescriptors;
  self->_allDescriptors = v10;

  uint64_t v12 = self->_allDescriptors;
  uint64_t v13 = __atxlog_handle_default();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14) {
      goto LABEL_10;
    }
    NSUInteger v15 = [(NSSet *)self->_allDescriptors count];
    *(_DWORD *)buf = 136315394;
    id v30 = "-[ATXWidgetDescriptorCache _queue_descriptorsDidChangeForDescriptorProvider:]";
    __int16 v31 = 2048;
    NSUInteger v32 = v15;
    uint64_t v16 = "%s, descriptor count: %ld";
    uint64_t v17 = v13;
    uint32_t v18 = 22;
  }
  else
  {
    if (!v14) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    id v30 = "-[ATXWidgetDescriptorCache _queue_descriptorsDidChangeForDescriptorProvider:]";
    uint64_t v16 = "%s, nil descriptors provided";
    uint64_t v17 = v13;
    uint32_t v18 = 12;
  }
  _os_log_impl(&dword_1A790D000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_10:

  uint64_t v19 = [(ATXWidgetDescriptorCache *)self _queue_homeScreenWidgetDescriptors];
  uint64_t v20 = v19;
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = (id)objc_opt_new();
  }
  uint64_t v22 = v21;

  if (([v22 isEqualToSet:v9] & 1) == 0) {
    self->_coalescedDescriptorUpdateOptions |= 1uLL;
  }
  [(ATXWidgetDescriptorCache *)self _scheduleCoalescedDescriptorUpdateOperation];
  id v23 = [(NSHashTable *)self->_observers allObjects];
  observerQueue = self->_observerQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__ATXWidgetDescriptorCache__queue_descriptorsDidChangeForDescriptorProvider___block_invoke;
  v26[3] = &unk_1E5D04FC8;
  id v27 = v23;
  uint64_t v28 = self;
  id v25 = v23;
  dispatch_async(observerQueue, v26);
}

void __77__ATXWidgetDescriptorCache__queue_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "widgetDescriptorCacheDidUpdateDescriptors:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdAndKindToHomeScreenDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_intentToHomeScreenDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_allDescriptors, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_coalescedDescriptorUpdateOperation, 0);
  objc_storeStrong((id *)&self->_legacyCachePath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

void __71__ATXWidgetDescriptorCache_initWithProvider_cachePath_legacyCachePath___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXWidgetDescriptorCache: couldn't perform update operation because swelf is nil", v1, 2u);
}

- (void)homeScreenDescriptorForIntent:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1A790D000, v1, OS_LOG_TYPE_ERROR, "%s, intent has no launchId: %@", (uint8_t *)v2, 0x16u);
}

void __58__ATXWidgetDescriptorCache_homeScreenDescriptorForIntent___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)a2 + 80) allKeys];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v3, v4, "%s, key (%@) not present in dictionary: %@", v5, v6, v7, v8, 2u);
}

void __80__ATXWidgetDescriptorCache_homeScreenDescriptorForContainerBundleId_widgetKind___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)a2 + 88) allKeys];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v3, v4, "%s, key (%@) not present in dictionary: %@", v5, v6, v7, v8, 2u);
}

- (void)_updateAllDescriptorMetadataOnInternalQueue
{
}

- (void)_queue_fetchAllDescriptorMetadataWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_queue_fetchAllDescriptorMetadataWithError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1) {
    a2 = a1;
  }
  int v4 = 138412290;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXWidgetDescriptorCache: Error unarchiving data during migration: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_queue_fetchAllLegacyDescriptorMetadataWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end