@interface AXCodeLoader
+ (id)defaultLoader;
- (AXCodeLoader)init;
- (AXCodeLoader)initWithImageMonitor:(id)a3;
- (BOOL)isInitialLoadFinished;
- (BOOL)isTrackingLoadedCodeItems;
- (BOOL)shouldAutoloadAccessibilityCodeItems;
- (id)_accessibilityBundleMapURLs;
- (id)_accessibilityCodeItemMatchingName:(id)a3 type:(int64_t)a4 path:(id)a5;
- (id)_createAccessibilityCodeItemsFromBundleMapURLs:(id)a3;
- (id)_platformKeyForPlatform:(unsigned int)a3;
- (id)_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3;
- (id)_stateDescForItem:(id)a3;
- (id)_validDidLoadAccessibilityCodeItemBlock;
- (id)_validLoadEventDidOccurBlock;
- (id)_validLoadEventWillOccurBlock;
- (id)_validShouldLoadAccessibilityCodeItemBlock;
- (id)accessibilityCodeItemDefinitions;
- (id)codeItemForBundle:(id)a3;
- (id)didLoadAccessibilityCodeItemBlock;
- (id)loadEventDidOccurBlock;
- (id)loadEventWillOccurBlock;
- (id)loadedCodeItemPathsUsingTrackedItemsIfAvailable:(BOOL)a3;
- (id)loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3;
- (id)recomputedCodeItemsForAllFrameworks;
- (id)recomputedCodeItemsForLoadedAccessibilityBundles;
- (id)rogueAccessibilityCodeItems;
- (id)shouldLoadAccessibilityCodeItemBlock;
- (id)trackedCodeItems;
- (int64_t)trackingMode;
- (void)_addTrackedCodeItem:(id)a3;
- (void)_associateAccessibilityCodeItemWithLoadedCodeItem:(id)a3;
- (void)_associateAccessibilityCodeItemsWithAllTrackedCodeItems;
- (void)_cancelDyldImageActivityTimer;
- (void)_consumeBeginTrackingCompletionHandlerIfNeeded;
- (void)_initializeCodeItemMappings;
- (void)_loadAccessibilityCodeItems;
- (void)_reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions;
- (void)_scheduleDyldImageActivityTimerWithDelay:(double)a3;
- (void)_updateAccessibilityCodeItemDefinitionsIfNeeded;
- (void)beginTrackingLoadedCodeItemsWithMode:(int64_t)a3 completion:(id)a4 targetQueue:(id)a5;
- (void)endTrackingLoadedCodeItemsWithCompletion:(id)a3 targetQueue:(id)a4;
- (void)imageMonitor:(id)a3 didAddImage:(id)a4;
- (void)iterateInitialImageListForImageMonitor:(id)a3;
- (void)logLoaderState;
- (void)prewarmAccessibilityCodeItemDefinitionsWithCompletion:(id)a3 targetQueue:(id)a4;
- (void)queryAccessibilityBundleIsLoadedWithName:(id)a3 completion:(id)a4;
- (void)setAccessibilityCodeItemsNeedLoaded;
- (void)setDidLoadAccessibilityCodeItemBlock:(id)a3;
- (void)setLoadEventDidOccurBlock:(id)a3;
- (void)setLoadEventWillOccurBlock:(id)a3;
- (void)setShouldAutoloadAccessibilityCodeItems:(BOOL)a3;
- (void)setShouldLoadAccessibilityCodeItemBlock:(id)a3;
- (void)setTrackingMode:(int64_t)a3;
@end

@implementation AXCodeLoader

+ (id)defaultLoader
{
  if (defaultLoader_onceToken != -1) {
    dispatch_once(&defaultLoader_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)defaultLoader__DefaultLoader;
  return v2;
}

void __29__AXCodeLoader_defaultLoader__block_invoke()
{
  v0 = [AXCodeLoader alloc];
  id v3 = +[_AXDyldImageMonitor sharedInstance];
  uint64_t v1 = [(AXCodeLoader *)v0 initWithImageMonitor:v3];
  v2 = (void *)defaultLoader__DefaultLoader;
  defaultLoader__DefaultLoader = v1;
}

- (AXCodeLoader)initWithImageMonitor:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXCodeLoader;
  v6 = [(AXCodeLoader *)&v22 init];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(AXCodeLoader *)v6 _platformKeyForPlatform:1];
    currentPlatformKey = v7->_currentPlatformKey;
    v7->_currentPlatformKey = (NSString *)v8;

    if (!v7->_currentPlatformKey) {
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Swizzling/Loading/AXCodeLoader.m", (void *)0x56, (uint64_t)"-[AXCodeLoader initWithImageMonitor:]", @"Unknown platform", v10, v11, v12, v19[0]);
    }
    objc_storeStrong((id *)&v7->_imageMonitor, a3);
    dispatch_queue_t v13 = dispatch_queue_create("AXCodeLoader", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, (dispatch_queue_t)v7->_queue);
    loadAccessibilityCodeItemsSource = v7->_loadAccessibilityCodeItemsSource;
    v7->_loadAccessibilityCodeItemsSource = (OS_dispatch_source *)v15;

    objc_initWeak(&location, v7);
    v17 = v7->_loadAccessibilityCodeItemsSource;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__37__AXCodeLoader_initWithImageMonitor___block_invoke;
    v19[3] = (uint64_t)&unk_1E5673098;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_activate((dispatch_object_t)v7->_loadAccessibilityCodeItemsSource);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __37__AXCodeLoader_initWithImageMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadAccessibilityCodeItems];
}

- (AXCodeLoader)init
{
  return 0;
}

- (id)_validShouldLoadAccessibilityCodeItemBlock
{
  id v3 = [(AXCodeLoader *)self shouldLoadAccessibilityCodeItemBlock];
  if (v3)
  {
    v4 = [(AXCodeLoader *)self shouldLoadAccessibilityCodeItemBlock];
    id v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);
  }
  else
  {
    v4 = (void *)[&__block_literal_global_14 copy];
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __58__AXCodeLoader__validShouldLoadAccessibilityCodeItemBlock__block_invoke()
{
  return 1;
}

- (id)_validDidLoadAccessibilityCodeItemBlock
{
  id v3 = [(AXCodeLoader *)self didLoadAccessibilityCodeItemBlock];
  if (v3)
  {
    v4 = [(AXCodeLoader *)self didLoadAccessibilityCodeItemBlock];
    id v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);
  }
  else
  {
    v4 = (void *)[&__block_literal_global_17 copy];
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __55__AXCodeLoader__validDidLoadAccessibilityCodeItemBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
}

- (id)_validLoadEventWillOccurBlock
{
  id v3 = [(AXCodeLoader *)self loadEventWillOccurBlock];
  if (v3)
  {
    v4 = [(AXCodeLoader *)self loadEventWillOccurBlock];
    id v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);
  }
  else
  {
    v4 = (void *)[&__block_literal_global_20 copy];
    v6 = _Block_copy(v4);
  }

  return v6;
}

- (id)_validLoadEventDidOccurBlock
{
  id v3 = [(AXCodeLoader *)self loadEventDidOccurBlock];
  if (v3)
  {
    v4 = [(AXCodeLoader *)self loadEventDidOccurBlock];
    id v5 = _Block_copy(v4);
    v6 = _Block_copy(v5);
  }
  else
  {
    v4 = (void *)[&__block_literal_global_23 copy];
    v6 = _Block_copy(v4);
  }

  return v6;
}

uint64_t __44__AXCodeLoader__validLoadEventDidOccurBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
}

- (BOOL)isTrackingLoadedCodeItems
{
  return self->_trackingMode != 0;
}

- (BOOL)isInitialLoadFinished
{
  return self->_initialLoadHasFinished;
}

- (void)beginTrackingLoadedCodeItemsWithMode:(int64_t)a3 completion:(id)a4 targetQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!a3)
  {
    uint64_t v10 = AXLogLoading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[AXCodeLoader beginTrackingLoadedCodeItemsWithMode:completion:targetQueue:](v10);
    }
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__AXCodeLoader_beginTrackingLoadedCodeItemsWithMode_completion_targetQueue___block_invoke;
  v14[3] = &unk_1E5673140;
  id v16 = v8;
  int64_t v17 = a3;
  v14[4] = self;
  id v15 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

void __76__AXCodeLoader_beginTrackingLoadedCodeItemsWithMode_completion_targetQueue___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isTrackingLoadedCodeItems] & 1) == 0 && *(void *)(a1 + 56))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    *(void *)(*(void *)(a1 + 32) + 112) = *(void *)(a1 + 56);
    if (*(void *)(a1 + 56) == 2) {
      [*(id *)(a1 + 32) _updateAccessibilityCodeItemDefinitionsIfNeeded];
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addImageMonitorObserver:");
    uint64_t v5 = [*(id *)(a1 + 48) copy];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v5;

    id v8 = *(void **)(a1 + 40);
    id v9 = (id *)(*(void *)(a1 + 32) + 80);
    objc_storeStrong(v9, v8);
  }
}

- (void)endTrackingLoadedCodeItemsWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke;
  block[3] = &unk_1E5672ED0;
  id v12 = v7;
  id v13 = v6;
  block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTrackingLoadedCodeItems])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeImageMonitorObserver:");
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;

    *(void *)(*(void *)(a1 + 32) + 112) = 0;
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 40);
    id v6 = v5;
    if (!v5)
    {
      id v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
      v4 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke_2;
    block[3] = &unk_1E5673168;
    id v9 = v4;
    dispatch_async(v6, block);
    if (!v5) {
  }
    }
}

uint64_t __69__AXCodeLoader_endTrackingLoadedCodeItemsWithCompletion_targetQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addTrackedCodeItem:(id)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3;
  v7[4] = __Block_byref_object_dispose__3;
  id v8 = a3;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AXCodeLoader__addTrackedCodeItem___block_invoke;
  v6[3] = &unk_1E5673190;
  v6[4] = self;
  v6[5] = v7;
  id v5 = v8;
  dispatch_async(queue, v6);
  _Block_object_dispose(v7, 8);
}

void __36__AXCodeLoader__addTrackedCodeItem___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) trackingMode]) {
    return;
  }
  id obj = [*(id *)(*(void *)(a1 + 32) + 56) member:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  if (obj)
  {
    objc_msgSend(obj, "setIsLoaded:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "isLoaded"));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isAccessibilityBundle] & 1) == 0) {
    [*(id *)(a1 + 32) _associateAccessibilityCodeItemWithLoadedCodeItem:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  if ([*(id *)(a1 + 32) trackingMode] == 1) {
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 32) trackingMode] == 2)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) associatedAccessibilityCodeItem];
    if (v2)
    {

LABEL_12:
      [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      goto LABEL_13;
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isAccessibilityBundle]) {
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (id)loadedCodeItemPathsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  if (!a3) {
    goto LABEL_4;
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__AXCodeLoader_loadedCodeItemPathsUsingTrackedItemsIfAvailable___block_invoke;
  v9[3] = &unk_1E5673190;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  id v5 = (void *)v11[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
LABEL_4:
    id v6 = [(AXImageMonitor *)self->_imageMonitor loadedImagePaths];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __64__AXCodeLoader_loadedCodeItemPathsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isTrackingLoadedCodeItems])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "count"));
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "path", (void)v12);
          [v10 addObject:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (id)_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  if (!a3
    || ![(AXCodeLoader *)self isTrackingLoadedCodeItems]
    || (v4 = self->_trackedCodeItems) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    imageMonitor = self->_imageMonitor;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__AXCodeLoader__queue_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke;
    v8[3] = &unk_1E5673070;
    v4 = v5;
    uint64_t v9 = v4;
    [(AXImageMonitor *)imageMonitor enumerateLoadedImagePaths:v8];
  }
  return v4;
}

void __67__AXCodeLoader__queue_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [[AXCodeItem alloc] initWithPath:v3 isDyldOpened:1];

  [v2 addObject:v4];
}

- (id)loadedCodeItemsUsingTrackedItemsIfAvailable:(BOOL)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__3;
  long long v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__AXCodeLoader_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke;
  block[3] = &unk_1E56731B8;
  void block[4] = self;
  void block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __60__AXCodeLoader_loadedCodeItemsUsingTrackedItemsIfAvailable___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:", *(unsigned __int8 *)(a1 + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)codeItemForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AXCodeLoader_codeItemForBundle___block_invoke;
  block[3] = &unk_1E56731E0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __34__AXCodeLoader_codeItemForBundle___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_loadedCodeItemsUsingTrackedItemsIfAvailable:", 1, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 path];
        uint64_t v9 = [v8 stringByDeletingLastPathComponent];

        id v10 = [*(id *)(a1 + 40) bundlePath];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setAccessibilityCodeItemsNeedLoaded
{
}

- (void)_scheduleDyldImageActivityTimerWithDelay:(double)a3
{
  if (!self->_dyldImageActivityCoalesceTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    dyldImageActivityCoalesceTimer = self->_dyldImageActivityCoalesceTimer;
    self->_dyldImageActivityCoalesceTimer = v5;

    id v7 = self->_dyldImageActivityCoalesceTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__AXCodeLoader__scheduleDyldImageActivityTimerWithDelay___block_invoke;
    handler[3] = &unk_1E5673208;
    objc_copyWeak(&v10, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate((dispatch_object_t)self->_dyldImageActivityCoalesceTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_dyldImageActivityCoalesceTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __57__AXCodeLoader__scheduleDyldImageActivityTimerWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  [(dispatch_source_t *)WeakRetained _consumeBeginTrackingCompletionHandlerIfNeeded];
  if (*(uint64_t *)(*(void *)(a1 + 32) + 40) >= 1
    && [(dispatch_source_t *)WeakRetained shouldAutoloadAccessibilityCodeItems])
  {
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    dispatch_source_merge_data(WeakRetained[3], 1uLL);
  }
}

- (void)_cancelDyldImageActivityTimer
{
  dyldImageActivityCoalesceTimer = self->_dyldImageActivityCoalesceTimer;
  if (dyldImageActivityCoalesceTimer) {
    dispatch_source_set_timer(dyldImageActivityCoalesceTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)_consumeBeginTrackingCompletionHandlerIfNeeded
{
  id beginTrackingCompletion = self->_beginTrackingCompletion;
  if (beginTrackingCompletion)
  {
    uint64_t v4 = (void *)[beginTrackingCompletion copy];
    beginTrackingCompletionQueue = self->_beginTrackingCompletionQueue;
    id v6 = beginTrackingCompletionQueue;
    if (!beginTrackingCompletionQueue)
    {
      id v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AXCodeLoader__consumeBeginTrackingCompletionHandlerIfNeeded__block_invoke;
    block[3] = &unk_1E5673168;
    id v12 = v4;
    id v8 = v4;
    dispatch_async(v6, block);
    if (!beginTrackingCompletionQueue) {

    }
    id v9 = self->_beginTrackingCompletion;
    self->_id beginTrackingCompletion = 0;

    id v10 = self->_beginTrackingCompletionQueue;
    self->_beginTrackingCompletionQueue = 0;
  }
}

uint64_t __62__AXCodeLoader__consumeBeginTrackingCompletionHandlerIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prewarmAccessibilityCodeItemDefinitionsWithCompletion:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke;
  block[3] = &unk_1E5672ED0;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAccessibilityCodeItemDefinitionsIfNeeded];
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 40);
    uint64_t v4 = v3;
    if (!v3)
    {
      uint64_t v4 = MEMORY[0x1E4F14428];
      id v5 = MEMORY[0x1E4F14428];
      uint64_t v2 = *(void **)(a1 + 48);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke_2;
    block[3] = &unk_1E5673168;
    id v7 = v2;
    dispatch_async(v4, block);
    if (!v3) {
  }
    }
}

uint64_t __82__AXCodeLoader_prewarmAccessibilityCodeItemDefinitionsWithCompletion_targetQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateAccessibilityCodeItemDefinitionsIfNeeded
{
  if (!self->_accessibilityCodeItems)
  {
    uint64_t v3 = AXLogLoading();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC6C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateAXCodeItemDefs", "", buf, 2u);
    }

    uint64_t v4 = [(AXCodeLoader *)self _accessibilityBundleMapURLs];
    id v5 = [(AXCodeLoader *)self _createAccessibilityCodeItemsFromBundleMapURLs:v4];
    accessibilityCodeItems = self->_accessibilityCodeItems;
    self->_accessibilityCodeItems = v5;

    id v7 = AXLogLoading();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_18FC6C000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateAXCodeItemDefs", "", v8, 2u);
    }

    [(AXCodeLoader *)self _reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions];
    [(AXCodeLoader *)self _initializeCodeItemMappings];
  }
}

- (void)_initializeCodeItemMappings
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSMutableDictionary *)objc_opt_new();
  codeItemsByNameType = self->_codeItemsByNameType;
  self->_codeItemsByNameType = v3;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = self->_accessibilityCodeItems;
  uint64_t v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        if (self->_currentPlatformKey)
        {
          id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [v9 platformToTarget];
          int v11 = [v10 objectForKeyedSubscript:self->_currentPlatformKey];
          id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "targetType"));
          id v13 = [v12 stringValue];
          long long v14 = [v11 stringByAppendingString:v13];

          if (v14) {
            [(NSMutableDictionary *)self->_codeItemsByNameType setObject:v9 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions
{
  trackedCodeItems = self->_trackedCodeItems;
  if (trackedCodeItems)
  {
    if (self->_accessibilityCodeItems)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke;
      v4[3] = &unk_1E5673250;
      v4[4] = self;
      [(NSMutableSet *)trackedCodeItems enumerateObjectsUsingBlock:v4];
      [(AXCodeLoader *)self _associateAccessibilityCodeItemsWithAllTrackedCodeItems];
    }
  }
}

uint64_t __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "ax_replaceWithMatchingObject:updatingWithBlock:", a2, &__block_literal_global_31);
}

void __78__AXCodeLoader__reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v7 = a2;
  uint64_t v5 = [v4 platformToTarget];
  [v7 setPlatformToTarget:v5];

  objc_msgSend(v7, "setTargetType:", objc_msgSend(v4, "targetType"));
  uint64_t v6 = [v4 loadOrder];

  [v7 setLoadOrder:v6];
}

- (id)_platformKeyForPlatform:(unsigned int)a3
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 - 2;
  unsigned int v3 = v4 >> 1;
  if (v3 > 7) {
    uint64_t v5 = (id *)&_AXBundleMapPlatformKey_iOS;
  }
  else {
    uint64_t v5 = (id *)off_1E56733D8[v3];
  }
  return *v5;
}

- (id)_accessibilityCodeItemMatchingName:(id)a3 type:(int64_t)a4 path:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [NSNumber numberWithInteger:a4];
  id v9 = [v8 stringValue];
  id v10 = [v7 stringByAppendingString:v9];

  int v11 = [(NSMutableDictionary *)self->_codeItemsByNameType objectForKeyedSubscript:v10];
  if (!v11)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = self->_accessibilityCodeItems;
    int v11 = (NSMutableSet *)[(NSMutableSet *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v20 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v23;
      do
      {
        long long v14 = 0;
        long long v15 = v12;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(obj);
          }
          id v12 = (NSMutableSet *)*(id *)(*((void *)&v22 + 1) + 8 * (void)v14);

          long long v16 = [(NSMutableSet *)v12 platformToTarget];
          long long v17 = [v16 objectForKeyedSubscript:self->_currentPlatformKey];
          if ([v17 isEqualToString:v7])
          {
            uint64_t v18 = [(NSMutableSet *)v12 targetType];

            if (v18 == a4)
            {
              int v11 = v12;
              id v12 = obj;
              id obj = v11;
              goto LABEL_13;
            }
          }
          else
          {
          }
          long long v14 = (NSMutableSet *)((char *)v14 + 1);
          long long v15 = v12;
        }
        while (v11 != v14);
        int v11 = (NSMutableSet *)[(NSMutableSet *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
LABEL_13:

      id v10 = v20;
    }
  }
  return v11;
}

- (void)_associateAccessibilityCodeItemWithLoadedCodeItem:(id)a3
{
  id v4 = a3;
  if ([v4 isAccessibilityBundle])
  {
    uint64_t v5 = AXLogLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AXCodeLoader _associateAccessibilityCodeItemWithLoadedCodeItem:](v5);
    }
  }
  else
  {
    uint64_t v6 = [v4 name];
    uint64_t v7 = [v4 type];
    id v8 = [v4 path];
    uint64_t v5 = [(AXCodeLoader *)self _accessibilityCodeItemMatchingName:v6 type:v7 path:v8];

    [v4 setAssociatedAccessibilityCodeItem:v5];
    [v5 setTargetCodeItem:v4];
  }
}

- (void)_associateAccessibilityCodeItemsWithAllTrackedCodeItems
{
  trackedCodeItems = self->_trackedCodeItems;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__AXCodeLoader__associateAccessibilityCodeItemsWithAllTrackedCodeItems__block_invoke;
  v3[3] = &unk_1E5673250;
  v3[4] = self;
  [(NSMutableSet *)trackedCodeItems enumerateObjectsUsingBlock:v3];
}

void __71__AXCodeLoader__associateAccessibilityCodeItemsWithAllTrackedCodeItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isAccessibilityBundle] & 1) == 0) {
    [*(id *)(a1 + 32) _associateAccessibilityCodeItemWithLoadedCodeItem:v3];
  }
}

- (id)_accessibilityBundleMapURLs
{
  if (_accessibilityBundleMapURLs_onceToken != -1) {
    dispatch_once(&_accessibilityBundleMapURLs_onceToken, &__block_literal_global_34);
  }
  uint64_t v2 = (void *)_accessibilityBundleMapURLs_KnownBundleMapURLs;
  return v2;
}

void __43__AXCodeLoader__accessibilityBundleMapURLs__block_invoke()
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v2 = AXAccessibilityBundlesDirectory();
  v17[0] = v2;
  v17[1] = @"mainbundles.axbundlemap";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v4 = [v1 fileURLWithPathComponents:v3];
  [v0 addObject:v4];

  if (!_AXSMossdeepEnabled())
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = AXAccessibilityBundlesDirectory();
    v16[0] = v6;
    v16[1] = @"watchbundles.axbundlemap";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v8 = [v5 fileURLWithPathComponents:v7];
    [v0 addObject:v8];
  }
  if (_AXSMossdeepEnabled())
  {
    id v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = AXAccessibilityBundlesDirectory();
    v15[0] = v10;
    v15[1] = @"mossdeepbundles.axbundlemap";
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v12 = [v9 fileURLWithPathComponents:v11];
    [v0 addObject:v12];
  }
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v0];
  long long v14 = (void *)_accessibilityBundleMapURLs_KnownBundleMapURLs;
  _accessibilityBundleMapURLs_KnownBundleMapURLs = v13;
}

- (id)_createAccessibilityCodeItemsFromBundleMapURLs:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v21 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = objc_alloc_init(_AXCodeItemDecoder);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v33;
    long long v19 = &v37;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v32 + 1) + 8 * v4);
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v19);
        uint64_t v24 = v5;
        uint64_t v7 = [(_AXCodeItemDecoder *)v23 decodedCodeItemsFromURL:v5 decodingErrors:v6];
        if ([v6 count])
        {
          id v8 = AXLogLoading();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:]((uint64_t)v40, (uint64_t)v6);
          }

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v9 = v6;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v39 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v29;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
                long long v15 = AXLogLoading();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                  -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:]((uint64_t)v38, v14);
                }

                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v39 count:16];
            }
            while (v11);
          }
        }
        if ([v7 count])
        {
          long long v16 = [MEMORY[0x1E4F1CA80] setWithSet:v7];
          [v16 intersectSet:v21];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __63__AXCodeLoader__createAccessibilityCodeItemsFromBundleMapURLs___block_invoke;
          v26[3] = &unk_1E5673250;
          id v17 = v21;
          id v27 = v17;
          [v16 enumerateObjectsUsingBlock:v26];
          [v17 unionSet:v7];
        }
        else
        {
          long long v16 = AXLogLoading();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[AXCodeLoader _createAccessibilityCodeItemsFromBundleMapURLs:]((uint64_t)v36, v24);
          }
        }

        ++v4;
      }
      while (v4 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v25);
  }

  return v21;
}

void __63__AXCodeLoader__createAccessibilityCodeItemsFromBundleMapURLs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 member:v3];
  uint64_t v4 = [v3 platformToTarget];

  [v5 addPlatformToTargetEntries:v4];
}

- (void)_loadAccessibilityCodeItems
{
  uint64_t v2 = (dispatch_object_t *)self;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 1;
  if (!self->_initialLoadHasOccurred)
  {
    self->_initialLoadHasOccurred = 1;
    uint64_t v3 = 0;
  }
  int v37 = [(AXCodeLoader *)self _validLoadEventWillOccurBlock];
  v37[2](v37, v3);
  dispatch_suspend(v2[3]);
  if (AXShouldLogValidationErrors())
  {
    uint64_t v4 = AXLogLoading();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC6C000, v4, OS_LOG_TYPE_INFO, "Will reevaluate code items and load any needed ax code items now", buf, 2u);
    }
  }
  uint64_t v36 = v3;
  [(dispatch_object_t *)v2 _updateAccessibilityCodeItemDefinitionsIfNeeded];
  id v5 = [(dispatch_object_t *)v2 _validShouldLoadAccessibilityCodeItemBlock];
  uint64_t v6 = [(dispatch_object_t *)v2 _queue_loadedCodeItemsUsingTrackedItemsIfAvailable:1];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke;
  v56[3] = &unk_1E5673278;
  v56[4] = v2;
  id v35 = v5;
  id v57 = v35;
  uint64_t v7 = objc_msgSend(v6, "ax_filteredSetUsingBlock:", v56);

  id v8 = (void *)MEMORY[0x1E4F1CA70];
  long long v34 = v7;
  id v9 = objc_msgSend(v7, "ax_flatMappedSetUsingBlock:", &__block_literal_global_54);
  uint64_t v10 = [v8 orderedSetWithSet:v9];

  [v10 sortUsingComparator:&__block_literal_global_57_1];
  v38 = v2;
  if (AXShouldLogValidationErrors())
  {
    uint64_t v11 = AXLogLoading();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v61 = v12;
      _os_log_impl(&dword_18FC6C000, v11, OS_LOG_TYPE_DEFAULT, "found %lu axbundle(s) requiring load", buf, 0xCu);
    }

    uint64_t v13 = AXLogLoading();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    if (v14)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v53 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            id v21 = AXLogLoading();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v61 = v20;
              _os_log_impl(&dword_18FC6C000, v21, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v59 count:16];
        }
        while (v17);
      }

      uint64_t v2 = v38;
    }
  }
  uint64_t v22 = dispatch_group_create();
  long long v23 = [(dispatch_object_t *)v2 _validDidLoadAccessibilityCodeItemBlock];
  dispatch_queue_t v24 = dispatch_queue_create("AXBundleLoadQueue", 0);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v10;
  uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v29 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        dispatch_group_enter(v22);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_59;
        v45[3] = &unk_1E56732E0;
        id v47 = v23;
        v46 = v22;
        [v29 loadWithStrategy:0 onQueue:v24 completion:v45];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v26);
  }

  long long v30 = [(dispatch_object_t *)v38 _validLoadEventDidOccurBlock];
  long long v31 = v38[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_62;
  block[3] = &unk_1E5673330;
  id v43 = v30;
  uint64_t v44 = v36;
  id v41 = obj;
  uint64_t v42 = v38;
  id v32 = obj;
  id v33 = v30;
  dispatch_group_notify(v22, v31, block);
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 associatedAccessibilityCodeItem];
  uint64_t v4 = v3;
  if (v3 && ([v3 isLoaded] & 1) == 0 && *(void *)(*(void *)(a1 + 32) + 96))
  {
    id v5 = [v4 excludedProcesses];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
      id v8 = [v7 processName];

      id v9 = [v4 excludedProcesses];
      int v10 = [v9 containsObject:v8];

      if (v10)
      {
        uint64_t v11 = AXLogLoading();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v4 name];
          int v15 = 138412290;
          uint64_t v16 = v12;
          _os_log_impl(&dword_18FC6C000, v11, OS_LOG_TYPE_INFO, "Not loading ax bundle '%@' because its listed as an excluded bundle", (uint8_t *)&v15, 0xCu);
        }
        goto LABEL_9;
      }
    }
    uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v13 = 0;
LABEL_10:

  return v13;
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_51(uint64_t a1, void *a2)
{
  return [a2 associatedAccessibilityCodeItem];
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 loadOrder];
  if (v6 <= [v5 loadOrder])
  {
    unsigned int v8 = [v4 loadOrder];
    uint64_t v7 = v8 < [v5 loadOrder];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_59(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_60;
  v13[3] = &unk_1E5672F70;
  id v14 = v8;
  id v15 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = *(id *)(a1 + 32);
  int v10 = *(void (**)(uint64_t, id, uint64_t, id, void *))(v9 + 16);
  id v11 = v7;
  id v12 = v8;
  v10(v9, v11, a3, v12, v13);
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_60(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = AXLogLoading();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_60_cold_1(a1, v2, v3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [*(id *)(a1 + 32) count];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_63;
  v7[3] = &unk_1E5673308;
  uint64_t v5 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 40);
  void v7[5] = v5;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4, v7);
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_63(uint64_t a1)
{
  if (!*(void *)(a1 + 40)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 89) = 1;
  }
  if (AXShouldLogValidationErrors())
  {
    uint64_t v2 = AXLogLoading();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_18FC6C000, v2, OS_LOG_TYPE_INFO, "Finished loading ax code items", v3, 2u);
    }
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
}

- (void)queryAccessibilityBundleIsLoadedWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__AXCodeLoader_queryAccessibilityBundleIsLoadedWithName_completion___block_invoke;
  block[3] = &unk_1E5673358;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __68__AXCodeLoader_queryAccessibilityBundleIsLoadedWithName_completion___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "name", (void)v10);
        char v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          (*(void (**)(void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], [v7 isLoaded], objc_msgSend(v7, "loadedAtTimestamp"));

          return;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)imageMonitor:(id)a3 didAddImage:(id)a4
{
  id v5 = a4;
  id v6 = [[AXCodeItem alloc] initWithPath:v5 isDyldOpened:1];

  if (![(AXCodeItem *)v6 isAccessibilityBundle]) {
    ++self->_monitoredLoadTriggeringImageCountSinceLastLoad;
  }
  [(AXCodeLoader *)self _addTrackedCodeItem:v6];
  [(AXCodeLoader *)self _scheduleDyldImageActivityTimerWithDelay:0.3];
}

- (void)iterateInitialImageListForImageMonitor:(id)a3
{
  uint64_t v4 = [(AXCodeLoader *)self loadedCodeItemsUsingTrackedItemsIfAvailable:0];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AXCodeLoader_iterateInitialImageListForImageMonitor___block_invoke;
  v7[3] = &unk_1E5672FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __55__AXCodeLoader_iterateInitialImageListForImageMonitor___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 48) setByAddingObjectsFromSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _reconcileTrackedCodeItemsWithAccessibilityCodeItemDefinitions];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _consumeBeginTrackingCompletionHandlerIfNeeded];
}

- (int64_t)trackingMode
{
  return self->_trackingMode;
}

- (void)setTrackingMode:(int64_t)a3
{
  self->_trackingMode = a3;
}

- (BOOL)shouldAutoloadAccessibilityCodeItems
{
  return self->_shouldAutoloadAccessibilityCodeItems;
}

- (void)setShouldAutoloadAccessibilityCodeItems:(BOOL)a3
{
  self->_shouldAutoloadAccessibilityCodeItems = a3;
}

- (id)shouldLoadAccessibilityCodeItemBlock
{
  return self->_shouldLoadAccessibilityCodeItemBlock;
}

- (void)setShouldLoadAccessibilityCodeItemBlock:(id)a3
{
}

- (id)didLoadAccessibilityCodeItemBlock
{
  return self->_didLoadAccessibilityCodeItemBlock;
}

- (void)setDidLoadAccessibilityCodeItemBlock:(id)a3
{
}

- (id)loadEventWillOccurBlock
{
  return self->_loadEventWillOccurBlock;
}

- (void)setLoadEventWillOccurBlock:(id)a3
{
}

- (id)loadEventDidOccurBlock
{
  return self->_loadEventDidOccurBlock;
}

- (void)setLoadEventDidOccurBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadEventDidOccurBlock, 0);
  objc_storeStrong(&self->_loadEventWillOccurBlock, 0);
  objc_storeStrong(&self->_didLoadAccessibilityCodeItemBlock, 0);
  objc_storeStrong(&self->_shouldLoadAccessibilityCodeItemBlock, 0);
  objc_storeStrong((id *)&self->_currentPlatformKey, 0);
  objc_storeStrong((id *)&self->_beginTrackingCompletionQueue, 0);
  objc_storeStrong(&self->_beginTrackingCompletion, 0);
  objc_storeStrong((id *)&self->_codeItemsByNameType, 0);
  objc_storeStrong((id *)&self->_accessibilityCodeItems, 0);
  objc_storeStrong((id *)&self->_trackedCodeItems, 0);
  objc_storeStrong((id *)&self->_dyldImageActivityCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_loadAccessibilityCodeItemsSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_imageMonitor, 0);
}

- (id)recomputedCodeItemsForAllFrameworks
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [MEMORY[0x1E4F28B50] allFrameworks];
  uint64_t v4 = [v2 setWithArray:v3];

  id v5 = objc_msgSend(v4, "ax_filteredSetUsingBlock:", &__block_literal_global_219_0);
  id v6 = objc_msgSend(v5, "ax_flatMappedSetUsingBlock:", &__block_literal_global_222);

  return v6;
}

BOOL __69__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForAllFrameworks__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 bundlePath];
  BOOL v3 = v2 != 0;

  return v3;
}

AXCodeItem *__69__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForAllFrameworks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [AXCodeItem alloc];
  uint64_t v4 = [v2 bundlePath];

  id v5 = [(AXCodeItem *)v3 initWithPath:v4 isDyldOpened:1];
  return v5;
}

- (id)recomputedCodeItemsForLoadedAccessibilityBundles
{
  id v2 = [(AXCodeLoader *)self loadedCodeItemsUsingTrackedItemsIfAvailable:0];
  BOOL v3 = objc_msgSend(v2, "ax_filteredSetUsingBlock:", &__block_literal_global_224);

  return v3;
}

uint64_t __82__AXCodeLoader_ExtendedCodeInfo__recomputedCodeItemsForLoadedAccessibilityBundles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityBundle];
}

- (id)accessibilityCodeItemDefinitions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__3;
  long long v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__AXCodeLoader_ExtendedCodeInfo__accessibilityCodeItemDefinitions__block_invoke;
  v5[3] = &unk_1E5673190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __66__AXCodeLoader_ExtendedCodeInfo__accessibilityCodeItemDefinitions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAccessibilityCodeItemDefinitionsIfNeeded];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)_stateDescForItem:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  if ([v4 isAccessibilityBundle]) {
    id v5 = @"AX-BUNDLE ";
  }
  else {
    id v5 = &stru_1EDF601D0;
  }
  uint64_t v6 = [v4 name];
  id v7 = [v4 debugCodeTypeDescription];
  int v8 = [v4 isLoaded];
  char v9 = @"[LOADED]";
  if (!v8) {
    char v9 = &stru_1EDF601D0;
  }
  long long v10 = [v3 stringWithFormat:@"%@%@.%@ <%p> %@", v5, v6, v7, v4, v9];

  return v10;
}

- (void)logLoaderState
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AXCodeLoader_ExtendedCodeInfo__logLoaderState__block_invoke;
  block[3] = &unk_1E5672590;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __48__AXCodeLoader_ExtendedCodeInfo__logLoaderState__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
  id v2 = AXLogLoading();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC6C000, v2, OS_LOG_TYPE_DEFAULT, "AXCodeLoader State:", buf, 2u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v9 = [v8 associatedAccessibilityCodeItem];
        long long v10 = [v8 targetCodeItem];
        id v11 = AXLogLoading();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          long long v12 = [*(id *)(a1 + 32) _stateDescForItem:v8];
          *(_DWORD *)buf = 138412290;
          v38 = v12;
          _os_log_impl(&dword_18FC6C000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        if (v9)
        {
          long long v13 = AXLogLoading();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [*(id *)(a1 + 32) _stateDescForItem:v9];
            *(_DWORD *)buf = 138412290;
            v38 = v14;
            _os_log_impl(&dword_18FC6C000, v13, OS_LOG_TYPE_DEFAULT, "  -> %@", buf, 0xCu);
          }
        }
        if ([v8 isAccessibilityBundle]) {
          BOOL v15 = v10 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15) {
          [v27 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v5);
  }

  if ([v27 count])
  {
    id v16 = AXLogLoading();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC6C000, v16, OS_LOG_TYPE_DEFAULT, "-------------------------------------------------", buf, 2u);
    }

    uint64_t v17 = AXLogLoading();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC6C000, v17, OS_LOG_TYPE_DEFAULT, "\nWARNING: The following AX Bundles are loaded but\nwere not in our definitions! This means the old\nloader knows how to load some bundles that we do\nnot, and we have more compile-time work to do", buf, 2u);
    }

    uint64_t v18 = AXLogLoading();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC6C000, v18, OS_LOG_TYPE_DEFAULT, "--------------------------------------------", buf, 2u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v27;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v25 = AXLogLoading();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = [*(id *)(a1 + 32) _stateDescForItem:v24];
            *(_DWORD *)buf = 138412290;
            v38 = v26;
            _os_log_impl(&dword_18FC6C000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (id)trackedCodeItems
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__3;
  long long v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AXCodeLoader_ExtendedCodeInfo__trackedCodeItems__block_invoke;
  v5[3] = &unk_1E5673030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __50__AXCodeLoader_ExtendedCodeInfo__trackedCodeItems__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)rogueAccessibilityCodeItems
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__3;
  long long v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AXCodeLoader_ExtendedCodeInfo__rogueAccessibilityCodeItems__block_invoke;
  v5[3] = &unk_1E5673190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__AXCodeLoader_ExtendedCodeInfo__rogueAccessibilityCodeItems__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "targetCodeItem", (void)v13);
        if ([v8 isAccessibilityBundle]) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v2;
}

- (void)beginTrackingLoadedCodeItemsWithMode:(os_log_t)log completion:targetQueue:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_18FC6C000, log, OS_LOG_TYPE_FAULT, "Begin tracking with AXCodeLoaderTrackingModeDisabled is invalid", v1, 2u);
}

- (void)_associateAccessibilityCodeItemWithLoadedCodeItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18FC6C000, log, OS_LOG_TYPE_ERROR, "Trying to associate an axBundle code with another axBundle makes no sense!", v1, 2u);
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "path");
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 UTF8String];
  *id v3 = 136315138;
  uint64_t *v2 = v5;
  OUTLINED_FUNCTION_0_2(&dword_18FC6C000, v6, v7, "No code items decoded from URL %s");
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "ax_nonRedundantDescription");
  *id v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_18FC6C000, v5, v6, "  %@");
}

- (void)_createAccessibilityCodeItemsFromBundleMapURLs:(uint64_t)a1 .cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "count");
  *id v3 = 134217984;
  uint64_t *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_18FC6C000, v5, v6, "(%lu) Decoding errors found with axbundlemap:");
}

void __43__AXCodeLoader__loadAccessibilityCodeItems__block_invoke_2_60_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_18FC6C000, log, OS_LOG_TYPE_ERROR, "Failed to load item %@. error: %@", (uint8_t *)&v5, 0x16u);
}

@end