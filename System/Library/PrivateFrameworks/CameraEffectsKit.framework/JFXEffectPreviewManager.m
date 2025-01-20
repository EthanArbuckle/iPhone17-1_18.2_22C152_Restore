@interface JFXEffectPreviewManager
+ (id)JFX_createTransparentEmptyImageForPreviewSize:(CGSize)a3;
- (BOOL)JFX_lowPriorityScheduling;
- (BOOL)JFX_rendersDefaultContinousPreviewImage;
- (BOOL)continouslyPreviewing_internal;
- (BOOL)isContinouslyPreviewing;
- (CGSize)continousPreviewSize;
- (JFXEffectContinousPreviewOptions)continousPreviewOptions;
- (JFXEffectPreviewDiskCache)previewDiskCache;
- (JFXEffectPreviewManager)initWithName:(id)a3 callbackQueue:(id)a4;
- (JFXEffectPreviewManagerDelegate)delegate;
- (JFXEffectPreviewManagerDelegate)delegate_internal;
- (JFXEffectsPreviewGenerator)staticPreviewGenerator;
- (JFXLRUCache)previewCache;
- (JTImage)defaultPreviewImage_internal;
- (NSMapTable)assetRequestsForPreviewEffects;
- (NSMutableSet)effectsPreparingForPreview;
- (NSMutableSet)preparedContinousPreviewEffects;
- (NSObject)pickerPreviewingToken;
- (NSSet)continousPreviewEffects;
- (NSSet)currentContinousPreviewEffects;
- (NSString)name;
- (NSValue)_defaultPreviewImageDisplayTransformValue_internal;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)previewQueue;
- (OS_dispatch_queue)synchronizationQueue;
- (OS_dispatch_semaphore)concurrentStaticPreviewSemaphore;
- (PVLivePlayer)continousPreviewPlayer;
- (id)buildRenderRequest:(id)a3 time:(id *)a4;
- (id)defaultPreviewImage;
- (id)defaultPreviewImageDisplayTransformValue;
- (void)JFX_cancelAssetRequestForAllEffects;
- (void)JFX_configureCommonRenderingPropertiesForEffect:(id)a3 forPreviewSize:(CGSize)a4 withPreviewOptions:(id)a5;
- (void)JFX_delegateDidFinishDownloadingPreviewAssetsForEffect:(id)a3 wasCancelled:(BOOL)a4 error:(id)a5;
- (void)JFX_delegateDownloadingPreviewAssetsForEffect:(id)a3 progress:(double)a4;
- (void)JFX_delegateUpdateContinousPreviewsForEffectIDs:(id)a3;
- (void)JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:(id)a3;
- (void)JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:(id)a3;
- (void)JFX_loadRenderingResourcesForEffect:(id)a3 completion:(id)a4;
- (void)JFX_prepareEffectForContinousPreview:(id)a3;
- (void)JFX_renderPreviewForEffect:(id)a3 previewSize:(CGSize)a4 options:(id)a5 completion:(id)a6;
- (void)JFX_requestPreviewAssetsForEffect:(id)a3 withPriority:(int64_t)a4 onlyThumbnailAssetWhenAvailable:(BOOL)a5 completion:(id)a6;
- (void)JFX_setContinousPreviewEffects:(id)a3;
- (void)JFX_startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4;
- (void)JFX_stopCachingPreviewsContinuously;
- (void)JFX_updateAssetRequestsPriorityAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4;
- (void)JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4;
- (void)cachedPreviewForEffect:(id)a3 completion:(id)a4;
- (void)continousPreviewsForEffectIDs:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)preparePreviewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6;
- (void)previewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6;
- (void)purgeCachedPreviewForEffect:(id)a3;
- (void)purgeCachedPreviewsForAllEffects;
- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5;
- (void)setAssetRequestsForPreviewEffects:(id)a3;
- (void)setContinousPreviewEffects:(id)a3;
- (void)setContinousPreviewOptions:(id)a3;
- (void)setContinousPreviewPlayer:(id)a3;
- (void)setContinousPreviewSize:(CGSize)a3;
- (void)setContinouslyPreviewing:(BOOL)a3;
- (void)setContinouslyPreviewing_internal:(BOOL)a3;
- (void)setCurrentContinousPreviewEffects:(id)a3;
- (void)setDefaultPreviewImage:(id)a3 transformValue:(id)a4;
- (void)setDefaultPreviewImage_internal:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate_internal:(id)a3;
- (void)setEffectsPreparingForPreview:(id)a3;
- (void)setPreparedContinousPreviewEffects:(id)a3;
- (void)setStaticPreviewGenerator:(id)a3;
- (void)set_defaultPreviewImageDisplayTransformValue_internal:(id)a3;
- (void)startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4;
- (void)stopCachingPreviewsContinuously;
@end

@implementation JFXEffectPreviewManager

- (JFXEffectPreviewManager)initWithName:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)JFXEffectPreviewManager;
  v7 = [(JFXEffectPreviewManager *)&v28 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_name, a3);
    v8->_inDealloc = 0;
    objc_storeStrong((id *)&v8->_callbackQueue, MEMORY[0x263EF83A0]);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);

    id v11 = [NSString stringWithFormat:@"EffectPreviewManager.%@.previewQ", v6];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v10);
    previewQueue = v8->_previewQueue;
    v8->_previewQueue = (OS_dispatch_queue *)v12;

    id v14 = [NSString stringWithFormat:@"EffectPreviewManager.%@.synchronization", v6];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    synchronizationQueue = v8->_synchronizationQueue;
    v8->_synchronizationQueue = (OS_dispatch_queue *)v15;

    v17 = [[JFXLRUCache alloc] initWithCapacity:20];
    previewCache = v8->_previewCache;
    v8->_previewCache = v17;

    v19 = [[JFXEffectPreviewDiskCache alloc] initWithDirectory:v6];
    previewDiskCache = v8->_previewDiskCache;
    v8->_previewDiskCache = v19;

    dispatch_semaphore_t v21 = dispatch_semaphore_create(2);
    concurrentStaticPreviewSemaphore = v8->_concurrentStaticPreviewSemaphore;
    v8->_concurrentStaticPreviewSemaphore = (OS_dispatch_semaphore *)v21;

    uint64_t v23 = objc_opt_new();
    pickerPreviewingToken = v8->_pickerPreviewingToken;
    v8->_pickerPreviewingToken = v23;

    uint64_t v25 = objc_opt_new();
    effectsPreparingForPreview = v8->_effectsPreparingForPreview;
    v8->_effectsPreparingForPreview = (NSMutableSet *)v25;

    if (initWithName_callbackQueue__onceToken != -1) {
      dispatch_once(&initWithName_callbackQueue__onceToken, &__block_literal_global_65);
    }
  }
  return v8;
}

uint64_t __54__JFXEffectPreviewManager_initWithName_callbackQueue___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)s_renderResourceLoadingOperationsQueue;
  s_renderResourceLoadingOperationsQueue = v0;

  [(id)s_renderResourceLoadingOperationsQueue setMaxConcurrentOperationCount:2];
  [(id)s_renderResourceLoadingOperationsQueue setQualityOfService:25];
  v2 = (void *)s_renderResourceLoadingOperationsQueue;
  return [v2 setName:@"renderResourceLoadingOperationsQueue"];
}

- (void)dealloc
{
  self->_inDealloc = 1;
  [(JFXEffectPreviewManager *)self JFX_stopCachingPreviewsContinuously];
  [(JFXEffectPreviewManager *)self JFX_cancelAssetRequestForAllEffects];
  v3.receiver = self;
  v3.super_class = (Class)JFXEffectPreviewManager;
  [(JFXEffectPreviewManager *)&v3 dealloc];
}

- (void)JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:(id)a3
{
  block = (void (**)(void))a3;
  v4 = [(JFXEffectPreviewManager *)self callbackQueue];
  label = dispatch_queue_get_label(v4);
  id v6 = dispatch_queue_get_label(0);

  if (label == v6)
  {
    block[2]();
  }
  else
  {
    v7 = [(JFXEffectPreviewManager *)self callbackQueue];
    dispatch_async(v7, block);
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__JFXEffectPreviewManager_setDelegate___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __39__JFXEffectPreviewManager_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = objc_opt_respondsToSelector() & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = objc_opt_respondsToSelector() & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = objc_opt_respondsToSelector() & 1;
  uint64_t result = objc_opt_respondsToSelector();
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = result & 1;
  return result;
}

- (JFXEffectPreviewManagerDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__24;
  id v11 = __Block_byref_object_dispose__24;
  id v12 = 0;
  objc_super v3 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__JFXEffectPreviewManager_delegate__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (JFXEffectPreviewManagerDelegate *)v4;
}

uint64_t __35__JFXEffectPreviewManager_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)JFX_delegateUpdateContinousPreviewsForEffectIDs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke;
  v7[3] = &unk_264C0C380;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    id v4 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke_2;
    block[3] = &unk_264C0A888;
    v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    block[5] = v3;
    id v7 = v5;
    dispatch_async(v4, block);
  }
}

void __75__JFXEffectPreviewManager_JFX_delegateUpdateContinousPreviewsForEffectIDs___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  [WeakRetained effectPreviewManager:a1[5] didUpdateContinousPreviewsForEffectIDs:a1[6]];
}

- (void)JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke;
  v7[3] = &unk_264C0C380;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(*(void *)(a1 + 32) + 9))
  {
    id v4 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke_2;
    block[3] = &unk_264C0A888;
    v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    block[5] = v3;
    id v7 = v5;
    dispatch_async(v4, block);
  }
}

void __82__JFXEffectPreviewManager_JFX_delegateWillBeginDownloadingPreviewAssetsForEffect___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  [WeakRetained effectPreviewManager:a1[5] willBeginDownloadingPreviewAssetsForEffect:a1[6]];
}

- (void)JFX_delegateDownloadingPreviewAssetsForEffect:(id)a3 progress:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke;
  block[3] = &unk_264C0CFE8;
  objc_copyWeak(v11, &location);
  block[4] = self;
  id v10 = v6;
  v11[1] = *(id *)&a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(*(void *)(a1 + 32) + 10))
  {
    id v4 = [WeakRetained callbackQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke_2;
    v6[3] = &unk_264C09F80;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v3;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 56);
    dispatch_async(v4, v6);
  }
}

void __82__JFXEffectPreviewManager_JFX_delegateDownloadingPreviewAssetsForEffect_progress___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained effectPreviewManager:*(void *)(a1 + 40) downloadingPreviewAssetsForEffect:*(void *)(a1 + 48) progress:*(double *)(a1 + 56)];
}

- (void)JFX_delegateDidFinishDownloadingPreviewAssetsForEffect:(id)a3 wasCancelled:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke;
  v13[3] = &unk_264C0D038;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  id v14 = v8;
  BOOL v17 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    id v4 = [WeakRetained callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke_2;
    block[3] = &unk_264C0D010;
    v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    void block[5] = v3;
    id v7 = v5;
    char v9 = *(unsigned char *)(a1 + 64);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
}

void __101__JFXEffectPreviewManager_JFX_delegateDidFinishDownloadingPreviewAssetsForEffect_wasCancelled_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained effectPreviewManager:*(void *)(a1 + 40) didFinishDownloadingPreviewAssetsForEffect:*(void *)(a1 + 48) wasCancelled:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 56)];
}

- (void)setContinousPreviewEffects:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(JFXEffectPreviewManager *)self previewQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__JFXEffectPreviewManager_setContinousPreviewEffects___block_invoke;
  block[3] = &unk_264C0B650;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__JFXEffectPreviewManager_setContinousPreviewEffects___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_setContinousPreviewEffects:", *(void *)(a1 + 32));
}

- (void)JFX_setContinousPreviewEffects:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v5);

  [(JFXEffectPreviewManager *)self setCurrentContinousPreviewEffects:v4];
  id v6 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
  id v7 = [v6 effectsToApplyToBackground];

  if ([v7 count])
  {
    id v8 = [v7 firstObject];
    char v9 = [v8 isNone] ^ 1;
  }
  else
  {
    char v9 = 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
        if ((v9 & 1) != 0 || (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "isNone", (void)v16) & 1) == 0) {
          -[JFXEffectPreviewManager JFX_prepareEffectForContinousPreview:](self, "JFX_prepareEffectForContinousPreview:", v15, (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(JFXEffectPreviewManager *)self JFX_updateAssetRequestsPriorityAssociatedWithEffects:v10 toPriority:1];
  [(JFXEffectPreviewManager *)self JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:v10 toPriority:3];
}

- (NSSet)continousPreviewEffects
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__24;
  uint64_t v11 = __Block_byref_object_dispose__24;
  id v12 = 0;
  uint64_t v3 = [(JFXEffectPreviewManager *)self previewQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__JFXEffectPreviewManager_continousPreviewEffects__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

uint64_t __50__JFXEffectPreviewManager_continousPreviewEffects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentContinousPreviewEffects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (BOOL)isContinouslyPreviewing
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__JFXEffectPreviewManager_isContinouslyPreviewing__block_invoke;
  v5[3] = &unk_264C09EE8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__JFXEffectPreviewManager_isContinouslyPreviewing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 13);
  return result;
}

- (void)setContinouslyPreviewing:(BOOL)a3
{
  v5 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__JFXEffectPreviewManager_setContinouslyPreviewing___block_invoke;
  v6[3] = &unk_264C0A0C0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

uint64_t __52__JFXEffectPreviewManager_setContinouslyPreviewing___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 13) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDefaultPreviewImage:(id)a3 transformValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__JFXEffectPreviewManager_setDefaultPreviewImage_transformValue___block_invoke;
  block[3] = &unk_264C0A888;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __65__JFXEffectPreviewManager_setDefaultPreviewImage_transformValue___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 96);
  objc_storeStrong(v3, v2);
}

- (id)defaultPreviewImage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__24;
  uint64_t v11 = __Block_byref_object_dispose__24;
  id v12 = 0;
  uint64_t v3 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__JFXEffectPreviewManager_defaultPreviewImage__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__JFXEffectPreviewManager_defaultPreviewImage__block_invoke(uint64_t a1)
{
}

- (id)defaultPreviewImageDisplayTransformValue
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__24;
  uint64_t v11 = __Block_byref_object_dispose__24;
  id v12 = 0;
  uint64_t v3 = [(JFXEffectPreviewManager *)self synchronizationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__JFXEffectPreviewManager_defaultPreviewImageDisplayTransformValue__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__JFXEffectPreviewManager_defaultPreviewImageDisplayTransformValue__block_invoke(uint64_t a1)
{
}

- (void)JFX_loadRenderingResourcesForEffect:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  if ([v5 renderEffectResourcesAreReady])
  {
    v6[2](v6);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F086D0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__JFXEffectPreviewManager_JFX_loadRenderingResourcesForEffect_completion___block_invoke;
    v9[3] = &unk_264C09FA8;
    id v10 = v5;
    uint64_t v8 = [v7 blockOperationWithBlock:v9];
    [v8 setCompletionBlock:v6];
    [(id)s_renderResourceLoadingOperationsQueue addOperation:v8];
  }
}

uint64_t __74__JFXEffectPreviewManager_JFX_loadRenderingResourcesForEffect_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadRenderEffect];
}

- (void)JFX_configureCommonRenderingPropertiesForEffect:(id)a3 forPreviewSize:(CGSize)a4 withPreviewOptions:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v8 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v9, "setRenderSize:", width, height);
}

- (void)JFX_requestPreviewAssetsForEffect:(id)a3 withPriority:(int64_t)a4 onlyThumbnailAssetWhenAvailable:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v12);

  if ([v10 arePreviewingAssetsLocal])
  {
    id v13 = objc_opt_new();
    [v13 setContentType:1];
    [v13 setUsageMode:1];
    [v13 setFilteringMode:1];
    [v10 localAssetsWithFilteringOptions:v13];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v19 = [v18 attributes];
          if ([v19 contentType] == 1 && objc_msgSend(v19, "usageMode") == 1)
          {
            uint64_t v15 = [v18 localURL];

            goto LABEL_16;
          }
        }
        uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    (*((void (**)(id, void, void *, void))v11 + 2))(v11, 0, v15, 0);
  }
  else
  {
    v20 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];

    if (!v20)
    {
      uint64_t v21 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0];
      [(JFXEffectPreviewManager *)self setAssetRequestsForPreviewEffects:v21];
    }
    [(JFXEffectPreviewManager *)self JFX_delegateWillBeginDownloadingPreviewAssetsForEffect:v10];
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke;
    v33[3] = &unk_264C0D060;
    objc_copyWeak(&v35, &location);
    id v22 = v10;
    id v34 = v22;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    objc_super v28 = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_2;
    v29 = &unk_264C0D0B0;
    objc_copyWeak(&v32, &location);
    id v31 = v11;
    id v23 = v22;
    id v30 = v23;
    v24 = [v23 requestPreviewingAssetsWithPriority:a4 onlyThumbnailAssetWhenAvailable:v7 progressHandler:v33 completionHandler:&v26];
    uint64_t v25 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
    [v25 setObject:v24 forKey:v23];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_delegateDownloadingPreviewAssetsForEffect:progress:", *(void *)(a1 + 32), a2);
}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_2(id *a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    id v10 = [WeakRetained previewQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_3;
    block[3] = &unk_264C0D088;
    objc_copyWeak(&v16, &location);
    id v12 = a1[4];
    char v17 = a3;
    id v15 = a1[5];
    id v13 = v8;
    id v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __117__JFXEffectPreviewManager_JFX_requestPreviewAssetsForEffect_withPriority_onlyThumbnailAssetWhenAvailable_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained assetRequestsForPreviewEffects];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];

    if (*(unsigned char *)(a1 + 72))
    {
      id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (!*(void *)(a1 + 40))
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        id v6 = *(id *)(a1 + 48);
        id v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v13;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v13 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
              id v11 = objc_msgSend(v10, "attributes", (void)v12);
              if ([v11 contentType] == 1 && objc_msgSend(v11, "usageMode") == 1)
              {
                id v7 = [v10 localURL];

                goto LABEL_20;
              }
            }
            id v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_7;
      }
      id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v5();
LABEL_7:
    objc_msgSend(v3, "JFX_delegateDidFinishDownloadingPreviewAssetsForEffect:wasCancelled:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), (void)v12);
  }
}

- (void)JFX_updateAssetRequestsPriorityAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
        long long v13 = [v12 objectForKey:v11];

        if (v13) {
          [v11 updatePriorityForAssetRequest:v13 newPriority:a4];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)JFX_updateAssetRequestsPriorityNotAssociatedWithEffects:(id)a3 toPriority:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF9C0];
    id v11 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
    long long v12 = NSAllMapTableKeys(v11);
    long long v13 = [v10 setWithArray:v12];

    [v13 minusSet:v6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
          v20 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
          uint64_t v21 = [v20 objectForKey:v19];

          [v19 updatePriorityForAssetRequest:v21 newPriority:a4];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
  }
}

- (void)JFX_cancelAssetRequestForAllEffects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_inDealloc)
  {
    uint64_t v3 = [(JFXEffectPreviewManager *)self previewQueue];
    dispatch_assert_queue_V2(v3);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [(JFXEffectPreviewManager *)self assetRequestsForPreviewEffects];
        id v11 = [v10 objectForKey:v9];

        [v9 cancelAssetRequest:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(JFXEffectPreviewManager *)self setAssetRequestsForPreviewEffects:0];
}

- (void)startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  if (![(JFXEffectPreviewManager *)self isContinouslyPreviewing])
  {
    [(JFXEffectPreviewManager *)self setContinouslyPreviewing:1];
    objc_initWeak(&location, self);
    uint64_t v8 = [(JFXEffectPreviewManager *)self previewQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__JFXEffectPreviewManager_startPreparingPreviewsContinuouslyAtSize_options___block_invoke;
    block[3] = &unk_264C0D0D8;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&width;
    id v11[2] = *(id *)&height;
    id v10 = v7;
    dispatch_async(v8, block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __76__JFXEffectPreviewManager_startPreparingPreviewsContinuouslyAtSize_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "JFX_startPreparingPreviewsContinuouslyAtSize:options:", *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)JFX_startPreparingPreviewsContinuouslyAtSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v62[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(JFXEffectPreviewManager *)self previewCache];
  [v9 setCapacity:0];

  -[JFXEffectPreviewManager setContinousPreviewSize:](self, "setContinousPreviewSize:", width, height);
  id v10 = (void *)[v7 copy];
  [(JFXEffectPreviewManager *)self setContinousPreviewOptions:v10];

  uint64_t v61 = *MEMORY[0x263F61710];
  id v11 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
  long long v12 = [v11 outputColorSpace];
  v62[0] = v12;
  long long v13 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];

  long long v14 = (void *)[objc_alloc(MEMORY[0x263F612B0]) initWithOptions:v13 delegate:self];
  [(JFXEffectPreviewManager *)self setContinousPreviewPlayer:v14];

  long long v15 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
  uint64_t v16 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
  objc_msgSend(v15, "setQueueSize:", objc_msgSend(v16, "maxFramesRenderedAtATime"));

  uint64_t v17 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
  uint64_t v18 = NSString;
  uint64_t v19 = [(JFXEffectPreviewManager *)self name];
  v20 = [v18 stringWithFormat:@"PreviewManagerPVPlayer_%@", v19];
  [v17 setName:v20];

  uint64_t v21 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
  LOBYTE(v19) = [v21 parentCode] == -1;

  if ((v19 & 1) == 0)
  {
    long long v22 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
    uint64_t v23 = [v22 parentCode];
    long long v24 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v24 setParentCode:v23];
  }
  long long v25 = objc_opt_new();
  [(JFXEffectPreviewManager *)self setPreparedContinousPreviewEffects:v25];

  uint64_t v26 = [v7 backgroundType];
  if (!v26)
  {
    id v30 = v7;
    v41 = objc_msgSend(objc_alloc(MEMORY[0x263F612B8]), "initWithCADisplayLinkFPS:", objc_msgSend(v30, "preferredUpdatesPerSecond"));
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__JFXEffectPreviewManager_JFX_startPreparingPreviewsContinuouslyAtSize_options___block_invoke;
    block[3] = &unk_264C0B650;
    objc_copyWeak(&v59, &location);
    id v31 = v41;
    id v58 = v31;
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v42 = objc_alloc_init(MEMORY[0x263F612D8]);
    v43 = CreatePVLPThrottlingControlParameters();
    [v42 setThermalLevel:0 controlParameters:v43];

    v44 = CreatePVLPThrottlingControlParameters();
    [v42 setThermalLevel:10 controlParameters:v44];

    v45 = CreatePVLPThrottlingControlParameters();
    [v42 setThermalLevel:20 controlParameters:v45];

    v46 = CreatePVLPThrottlingControlParameters();
    [v42 setThermalLevel:30 controlParameters:v46];

    v47 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v47 setThermalThrottlingPolicy:v42];

    v48 = [v30 backgroundImage];
    v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "JFX_createTransparentEmptyImageForPreviewSize:", width, height);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
    }
    v51 = v50;

    id v52 = objc_alloc(MEMORY[0x263F612D0]);
    v53 = [v51 pvImageBuffer];
    v54 = (void *)[v52 initWithPVImageBuffer:v53];

    [(JFXEffectPreviewManager *)self setDefaultPreviewImage:v51 transformValue:0];
    v55 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v55 setSource:v54 inputID:0];

    v56 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v56 start];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v26 == 1)
  {
    uint64_t v27 = +[JFXPickerCameraSource sharedInstance];
    objc_super v28 = [(JFXEffectPreviewManager *)self pickerPreviewingToken];
    [v27 registerPickerAsPreviewingWithObject:v28];

    v29 = +[JFXPickerCameraSource sharedInstance];
    id v30 = [v29 pickerSource];

    id v31 = (id)[objc_alloc(MEMORY[0x263F612C0]) initWithPlayerCameraSource:v30];
    id v32 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v32 setSource:v30 inputID:0];

    v33 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v33 setRenderLink:v31];

    id v34 = objc_alloc_init(MEMORY[0x263F612D8]);
    id v35 = CreatePVLPThrottlingControlParameters();
    [v34 setThermalLevel:0 controlParameters:v35];

    v36 = CreatePVLPThrottlingControlParameters();
    [v34 setThermalLevel:10 controlParameters:v36];

    long long v37 = CreatePVLPThrottlingControlParameters();
    [v34 setThermalLevel:20 controlParameters:v37];

    long long v38 = CreatePVLPThrottlingControlParameters();
    [v34 setThermalLevel:30 controlParameters:v38];

    long long v39 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v39 setThermalThrottlingPolicy:v34];

    long long v40 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v40 start];

LABEL_10:
  }
}

void __80__JFXEffectPreviewManager_JFX_startPreparingPreviewsContinuouslyAtSize_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained continousPreviewPlayer];
  [v2 setRenderLink:*(void *)(a1 + 32)];
}

+ (id)JFX_createTransparentEmptyImageForPreviewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [MEMORY[0x263F1C688] defaultFormat];
  [v5 setOpaque:0];
  [v5 setPreferredRange:2];
  [v5 setScale:1.0];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithBounds:format:", v5, 0.0, 0.0, width, height);
  id v7 = [v6 imageWithActions:&__block_literal_global_69_1];
  uint64_t v8 = +[JTImage jtImageWithUIImage:v7];

  return v8;
}

- (void)JFX_prepareEffectForContinousPreview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(JFXEffectPreviewManager *)self preparedContinousPreviewEffects];
  if ([v6 containsObject:v4])
  {
  }
  else
  {
    id v7 = [(JFXEffectPreviewManager *)self effectsPreparingForPreview];
    char v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(JFXEffectPreviewManager *)self effectsPreparingForPreview];
      [v9 addObject:v4];

      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke;
      v17[3] = &unk_264C0B650;
      objc_copyWeak(&v19, &location);
      id v10 = v4;
      id v18 = v10;
      id v11 = (void *)MEMORY[0x237DD15A0](v17);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_2;
      v13[3] = &unk_264C0D148;
      objc_copyWeak(&v16, &location);
      id v12 = v11;
      id v15 = v12;
      id v14 = v10;
      [(JFXEffectPreviewManager *)self JFX_requestPreviewAssetsForEffect:v14 withPriority:1 onlyThumbnailAssetWhenAvailable:0 completion:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained effectsPreparingForPreview];
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_2(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v10 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained isContinouslyPreviewing] & 1) != 0
    && ([v10 previewQueue],
        id v11 = objc_claimAutoreleasedReturnValue(),
        dispatch_assert_queue_V2(v11),
        v11,
        !a2))
  {
    id v12 = a1[4];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_3;
    v13[3] = &unk_264C0D120;
    objc_copyWeak(&v16, a1 + 6);
    id v15 = a1[5];
    id v14 = a1[4];
    objc_msgSend(v10, "JFX_loadRenderingResourcesForEffect:completion:", v12, v13);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_3(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained previewQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_4;
    block[3] = &unk_264C0D120;
    objc_copyWeak(&v9, v2);
    id v8 = a1[5];
    id v7 = a1[4];
    dispatch_async(v5, block);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __64__JFXEffectPreviewManager_JFX_prepareEffectForContinousPreview___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isContinouslyPreviewing] & 1) != 0)
  {
    id v4 = [v3 continousPreviewOptions];
    uint64_t v5 = v4;
    memset(&v20, 0, sizeof(v20));
    if (v4) {
      [v4 effectAnimationDuration];
    }
    memset(&v19, 0, sizeof(v19));
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    CMTime duration = v20;
    CMTimeRangeMake(&v19, &start, &duration);
    uint64_t v6 = v20.flags & 1;
    [*(id *)(a1 + 32) setForceRenderAtPosterFrame:(v20.flags & 1) == 0];
    [*(id *)(a1 + 32) setBuildInAnimation:v6];
    CMTimeRange v16 = v19;
    id v7 = [*(id *)(a1 + 32) renderEffect];
    CMTimeRange v15 = v16;
    [v7 setEffectRange:&v15];

    [v3 continousPreviewSize];
    double v9 = v8;
    double v11 = v10;
    objc_msgSend(v3, "JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:", *(void *)(a1 + 32), v5);
    id v12 = [v5 renderPropertiesConfigurationBlock];

    if (v12)
    {
      long long v13 = [v5 renderPropertiesConfigurationBlock];
      v13[2](v13, *(void *)(a1 + 32), v9, v11);
    }
    id v14 = [v3 preparedContinousPreviewEffects];
    [v14 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)continousPreviewsForEffectIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  if (continousPreviewsForEffectIDs_completion__onceToken != -1) {
    dispatch_once(&continousPreviewsForEffectIDs_completion__onceToken, &__block_literal_global_73_0);
  }
  uint64_t v6 = [(JFXEffectPreviewManager *)self previewCache];
  id v7 = [v6 objectsForKeys:v5 notFoundMarker:continousPreviewsForEffectIDs_completion__s_missingImageMarker];

  uint64_t v8 = [v7 count];
  double v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v8];
  id v10 = 0;
  if (v8)
  {
    uint64_t v11 = 0;
    char v12 = 0;
    while (1)
    {
      long long v13 = [v7 objectAtIndexedSubscript:v11];
      id v14 = [v5 objectAtIndexedSubscript:v11];
      if (v13 == (void *)continousPreviewsForEffectIDs_completion__s_missingImageMarker) {
        break;
      }
      if (v13) {
        goto LABEL_7;
      }
LABEL_8:

      if (v8 == ++v11) {
        goto LABEL_14;
      }
    }
    if ((v12 & 1) == 0)
    {
      uint64_t v15 = [(JFXEffectPreviewManager *)self defaultPreviewImage];

      id v10 = (id)v15;
    }
    id v10 = v10;

    char v12 = 1;
    long long v13 = v10;
    if (!v10) {
      goto LABEL_8;
    }
LABEL_7:
    [v9 setObject:v13 forKey:v14];
    goto LABEL_8;
  }
LABEL_14:
  CMTimeRange v16 = [(JFXEffectPreviewManager *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke_2;
  block[3] = &unk_264C0AF38;
  id v23 = v9;
  id v24 = v20;
  id v17 = v9;
  id v18 = v20;
  dispatch_async(v16, block);
}

uint64_t __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke()
{
  uint64_t v0 = objc_alloc_init(JTImage);
  uint64_t v1 = continousPreviewsForEffectIDs_completion__s_missingImageMarker;
  continousPreviewsForEffectIDs_completion__s_missingImageMarker = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __68__JFXEffectPreviewManager_continousPreviewsForEffectIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)stopCachingPreviewsContinuously
{
  uint64_t v3 = [(JFXEffectPreviewManager *)self previewQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__JFXEffectPreviewManager_stopCachingPreviewsContinuously__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __58__JFXEffectPreviewManager_stopCachingPreviewsContinuously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "JFX_stopCachingPreviewsContinuously");
}

- (void)JFX_stopCachingPreviewsContinuously
{
  if (!self->_inDealloc)
  {
    uint64_t v3 = [(JFXEffectPreviewManager *)self previewQueue];
    dispatch_assert_queue_V2(v3);
  }
  if ([(JFXEffectPreviewManager *)self isContinouslyPreviewing])
  {
    [(JFXEffectPreviewManager *)self setContinouslyPreviewing:0];
    id v4 = +[JFXPickerCameraSource sharedInstance];
    id v5 = [(JFXEffectPreviewManager *)self pickerPreviewingToken];
    [v4 unregisterPickerAsPreviewingWithObject:v5];

    uint64_t v6 = [(JFXEffectPreviewManager *)self previewCache];
    [v6 setCapacity:20];

    id v7 = [(JFXEffectPreviewManager *)self continousPreviewPlayer];
    [v7 shutdown];

    [(JFXEffectPreviewManager *)self setContinousPreviewPlayer:0];
    [(JFXEffectPreviewManager *)self setContinousPreviewOptions:0];
    [(JFXEffectPreviewManager *)self setDefaultPreviewImage:0 transformValue:0];
    [(JFXEffectPreviewManager *)self setPreparedContinousPreviewEffects:0];
    [(JFXEffectPreviewManager *)self JFX_cancelAssetRequestForAllEffects];
  }
}

- (BOOL)JFX_rendersDefaultContinousPreviewImage
{
  uint64_t v2 = [(JFXEffectPreviewManager *)self continousPreviewOptions];
  BOOL v3 = [v2 backgroundType] == 1;

  return v3;
}

- (BOOL)JFX_lowPriorityScheduling
{
  return 0;
}

- (id)buildRenderRequest:(id)a3 time:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  CMTimeRange v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__24;
  id v19 = __Block_byref_object_dispose__24;
  id v20 = 0;
  id v7 = [(JFXEffectPreviewManager *)self previewQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  id v11[2] = __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke;
  id v11[3] = &unk_264C0C3D0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  v11[4] = self;
  id v12 = v6;
  long long v13 = &v15;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  long long v86 = *(_OWORD *)(a1 + 56);
  uint64_t v87 = *(void *)(a1 + 72);
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) continousPreviewOptions];
  BOOL v3 = v2;
  if (v2)
  {
    [v2 effectAnimationDuration];
  }
  else
  {
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
  }

  id v4 = [*(id *)(a1 + 32) continousPreviewOptions];
  [v4 loopAnimation];

  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:&unk_26E801DB8];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 colorImageBuffer];
    [*(id *)(a1 + 32) continousPreviewSize];
    double v9 = v8;
    double v11 = v10;
    id v12 = [*(id *)(a1 + 32) continousPreviewOptions];
    long long v13 = [v12 effectsToApplyToBackground];

    long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    time1[0] = *MEMORY[0x263F000D0];
    time1[1] = v14;
    long long v82 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    uint64_t v15 = [*(id *)(a1 + 32) continousPreviewOptions];
    v71 = v7;
    if ([v15 backgroundType] == 1)
    {
      CMTimeRange v16 = [*(id *)(a1 + 32) continousPreviewOptions];
      int v17 = [v16 rotateCameraFrameToInterfaceOrientation];

      if (v17)
      {
        id v18 = +[JFXVideoCameraController sharedInstance];
        uint64_t v19 = [v18 cameraPosition];

        id v20 = +[JFXVideoCameraController sharedInstance];
        uint64_t v21 = [v20 captureVideoOrientation];

        int64_t v22 = +[JFXOrientationMonitor interfaceOrientation];
        [v7 size];
        +[JFXRotationTransforms transformFromTopLeftCaptureDevicePivotPosition:captureVideoOrientation:toInterfaceOrientation:size:](JFXRotationTransforms, "transformFromTopLeftCaptureDevicePivotPosition:captureVideoOrientation:toInterfaceOrientation:size:", v19, v21, v22);
      }
    }
    else
    {
    }
    long long v25 = objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromImageBuffer:", v7);
    if (objc_msgSend(*(id *)(a1 + 32), "JFX_rendersDefaultContinousPreviewImage"))
    {
      if ([v13 count]
        && ([v13 firstObject],
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            int v27 = [v26 isNone],
            v26,
            !v27)
        || ([v25 isHDRSpace] & 1) != 0)
      {
        objc_super v28 = [JFXEffectsPreviewGenerationRequest alloc];
        time2[0] = kDefaultEffectPreviewRenderTime;
        *(void *)&time2[1] = 0;
        v29 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v28, "initWithInput:effectStack:outputSize:renderTime:", v7, v13, time2, v9, v11);
        id v30 = [*(id *)(a1 + 32) continousPreviewOptions];
        int v31 = [v30 parentCode];

        if (v31 != -1)
        {
          id v32 = [*(id *)(a1 + 32) continousPreviewOptions];
          -[JTImage setParentCode:](v29, "setParentCode:", [v32 parentCode]);
        }
        v79[0] = time1[0];
        v79[1] = time1[1];
        v79[2] = v82;
        [(JTImage *)v29 setUserSourceTransform:v79];
        [(JTImage *)v29 centerAnimationInfo];
        v33 = [*(id *)(a1 + 32) continousPreviewOptions];
        -[JTImage setHighQuality:](v29, "setHighQuality:", [v33 quality] == 2);

        -[JTImage setPriority:](v29, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "JFX_lowPriorityScheduling") ^ 1);
        id v34 = [*(id *)(a1 + 32) staticPreviewGenerator];
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke_2;
        v78[3] = &unk_264C0B6F0;
        v78[4] = *(void *)(a1 + 32);
        [v34 generatePreviewRequest:v29 completionHandler:v78];
      }
      else
      {
        id v35 = *(void **)(a1 + 32);
        v29 = [[JTImage alloc] initWithPVImage:v7];
        time2[0] = time1[0];
        time2[1] = time1[1];
        time2[2] = v82;
        v36 = [MEMORY[0x263F08D40] valueWithCGAffineTransform:time2];
        [v35 setDefaultPreviewImage:v29 transformValue:v36];
      }
    }
    v72 = v13;
    v70 = v6;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v37 = [*(id *)(a1 + 32) currentContinousPreviewEffects];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v37);
          }
          id v42 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          if ([v42 type] == 1)
          {
            v43 = [*(id *)(a1 + 32) delegate];
            char v44 = objc_opt_respondsToSelector();

            if (v44)
            {
              v45 = [*(id *)(a1 + 32) delegate];
              int v46 = [v45 previewIsHDR];
            }
            else
            {
              int v46 = 0;
            }
            objc_msgSend(v42, "setHDR:", objc_msgSend(v25, "isHDRSpace") | v46);
          }
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v39);
    }

    v47 = (void *)MEMORY[0x263EFF9C0];
    v48 = [*(id *)(a1 + 32) currentContinousPreviewEffects];
    v49 = [v48 allObjects];
    id v50 = [v47 setWithArray:v49];

    v51 = (void *)MEMORY[0x263EFFA08];
    id v52 = [*(id *)(a1 + 32) preparedContinousPreviewEffects];
    v53 = [v52 allObjects];
    v54 = [v51 setWithArray:v53];

    [v50 intersectSet:v54];
    v55 = [JFXEffectsPreviewGenerationRequest alloc];
    time2[0] = v86;
    *(void *)&time2[1] = v87;
    id v24 = v71;
    v56 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v55, "initWithInput:effectStack:outputSize:renderTime:", v71, v72, time2, v9, v11);
    v57 = [*(id *)(a1 + 32) continousPreviewOptions];
    uint64_t v58 = [v57 backgroundType];

    if (v58 == 1)
    {
      v73[0] = time1[0];
      v73[1] = time1[1];
      v73[2] = v82;
      [(JFXEffectsPreviewGenerationRequest *)v56 setUserSourceTransform:v73];
    }
    [(JFXEffectsPreviewGenerationRequest *)v56 centerAnimationInfo];
    id v59 = [*(id *)(a1 + 32) continousPreviewOptions];
    int v60 = [v59 parentCode];

    id v6 = v70;
    if (v60 != -1)
    {
      uint64_t v61 = [*(id *)(a1 + 32) continousPreviewOptions];
      -[JFXEffectsPreviewGenerationRequest setParentCode:](v56, "setParentCode:", [v61 parentCode]);
    }
    v62 = [*(id *)(a1 + 32) continousPreviewOptions];
    -[JFXEffectsPreviewGenerationRequest setHighQuality:](v56, "setHighQuality:", [v62 quality] == 2);

    -[JFXEffectsPreviewGenerationRequest setPriority:](v56, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "JFX_lowPriorityScheduling") ^ 1);
    v63 = [v50 allObjects];
    [(JFXEffectsPreviewGenerationRequest *)v56 setPickerPreviewEffectList:v63];

    v64 = [[JFXEffectsPreviewRequestHandler alloc] initWithRequest:v56];
    v65 = [*(id *)(a1 + 32) continousPreviewOptions];
    v66 = [v65 outputColorSpace];

    uint64_t v67 = [(JFXEffectsPreviewRequestHandler *)v64 buildPVRenderRequestWithOutputColorSpace:v66];
    uint64_t v68 = *(void *)(*(void *)(a1 + 48) + 8);
    v69 = *(void **)(v68 + 40);
    *(void *)(v68 + 40) = v67;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUserContext:v64];
  }
  else
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = 0;
  }
}

void __51__JFXEffectPreviewManager_buildRenderRequest_time___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 objectEnumerator];
  id v6 = [v3 nextObject];

  id v4 = *(void **)(a1 + 32);
  id v5 = [[JTImage alloc] initWithPVImage:v6];
  [v4 setDefaultPreviewImage:v5 transformValue:0];
}

- (void)renderRequestComplete:(id)a3 results:(id)a4 completedOutOfOrder:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (!a5 && [v8 count])
  {
    double v10 = [(JFXEffectPreviewManager *)self previewCache];
    [v10 removeAllObjects];

    id v26 = v7;
    id v24 = [v7 userContext];
    long long v25 = v9;
    double v11 = [v24 buildCallbackMap:v9];
    id v12 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v19 = [v13 objectForKey:v18];
          id v20 = [[JTImage alloc] initWithPVImage:v19];
          uint64_t v21 = [(JFXEffectPreviewManager *)self previewCache];
          int64_t v22 = [v18 effectID];
          [v21 setObject:v20 forKey:v22];

          uint64_t v23 = [v18 effectID];
          [v12 addObject:v23];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    [v12 addObject:*MEMORY[0x263F61368]];
    [(JFXEffectPreviewManager *)self JFX_delegateUpdateContinousPreviewsForEffectIDs:v12];

    double v9 = v25;
    id v7 = v26;
  }
}

- (JFXEffectsPreviewGenerator)staticPreviewGenerator
{
  BOOL v3 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v3);

  staticPreviewGenerator = self->_staticPreviewGenerator;
  if (!staticPreviewGenerator)
  {
    id v5 = objc_alloc_init(JFXEffectsPreviewGenerator);
    id v6 = self->_staticPreviewGenerator;
    self->_staticPreviewGenerator = v5;

    [(JFXEffectsPreviewGenerator *)self->_staticPreviewGenerator trackStats:0];
    id v7 = NSString;
    id v8 = [(JFXEffectPreviewManager *)self name];
    double v9 = [v7 stringWithFormat:@"PreviewManagerStaticPreview_%@", v8];
    [(JFXEffectsPreviewGenerator *)self->_staticPreviewGenerator setName:v9];

    staticPreviewGenerator = self->_staticPreviewGenerator;
  }
  return staticPreviewGenerator;
}

- (void)preparePreviewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(JFXEffectPreviewManager *)self previewQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke;
  v18[3] = &unk_264C0D210;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  CGFloat v22 = width;
  CGFloat v23 = height;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  dispatch_async(v14, v18);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectsPreparingForPreview];
  [v2 addObject:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  BOOL v3 = [*(id *)(a1 + 32) callbackQueue];
  id v4 = objc_loadWeakRetained(&location);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) dontUseThumbnailAssetWhenAvailable] ^ 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_2;
  v8[3] = &unk_264C0D1E8;
  objc_copyWeak(&v13, &location);
  id v9 = *(id *)(a1 + 40);
  id v7 = v3;
  id v10 = v7;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 64);
  objc_msgSend(v4, "JFX_requestPreviewAssetsForEffect:withPriority:onlyThumbnailAssetWhenAvailable:completion:", v5, 2, v6, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v10 = WeakRetained;
  if (a2 || !WeakRetained)
  {
    id v12 = [WeakRetained effectsPreparingForPreview];
    [v12 removeObject:*(void *)(a1 + 32)];

    id v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_3;
    block[3] = &unk_264C0A3F0;
    id v34 = *(id *)(a1 + 56);
    dispatch_async(v13, block);
  }
  else if (v7 && ([*(id *)(a1 + 48) dontUseThumbnailAssetWhenAvailable] & 1) == 0)
  {
    long long v14 = (void *)MEMORY[0x263F1C6B0];
    id v15 = [v7 path];
    id v16 = [v14 imageWithContentsOfFile:v15];
    id v17 = +[JTImage jtImageWithUIImage:v16];

    if (([*(id *)(a1 + 48) dontCache] & 1) == 0)
    {
      id v18 = [v10 previewCache];
      id v19 = [*(id *)(a1 + 32) effectID];
      [v18 setObject:v17 forKey:v19];
    }
    id v20 = *(NSObject **)(a1 + 40);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_4;
    v30[3] = &unk_264C0AF38;
    id v21 = *(id *)(a1 + 56);
    id v31 = v17;
    id v32 = v21;
    id v22 = v17;
    dispatch_async(v20, v30);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_5;
    v23[3] = &unk_264C0D1C0;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    id v24 = *(id *)(a1 + 40);
    id v27 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 32);
    id v26 = *(id *)(a1 + 48);
    long long v29 = *(_OWORD *)(a1 + 72);
    objc_msgSend(v10, "JFX_loadRenderingResourcesForEffect:completion:", v11, v23);

    objc_destroyWeak(&v28);
  }
}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained previewQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_7;
    v8[3] = &unk_264C0D198;
    uint64_t v6 = &v9;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_copyWeak(&v13, v2);
    long long v14 = *(_OWORD *)(a1 + 72);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 56);
    dispatch_async(v5, v8);

    objc_destroyWeak(&v13);
  }
  else
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_6;
    block[3] = &unk_264C0A3F0;
    uint64_t v6 = &v16;
    id v16 = *(id *)(a1 + 56);
    dispatch_async(v7, block);
  }
}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectWillRenderPreviewWithOptions:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_8;
  v5[3] = &unk_264C0D170;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "JFX_renderPreviewForEffect:previewSize:options:completion:", v4, v2, v5, *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_destroyWeak(&v9);
}

void __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained effectsPreparingForPreview];
  [v8 removeObject:*(void *)(a1 + 32)];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_9;
  block[3] = &unk_264C0A5A8;
  id v9 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v9, block);
}

uint64_t __77__JFXEffectPreviewManager_preparePreviewForEffect_atSize_options_completion___block_invoke_9(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)previewForEffect:(id)a3 atSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke;
  v17[3] = &unk_264C0D260;
  objc_copyWeak(v21, &location);
  id v14 = v13;
  id v20 = v14;
  id v15 = v11;
  id v18 = v15;
  v21[1] = *(id *)&width;
  v21[2] = *(id *)&height;
  id v16 = v12;
  id v19 = v16;
  [(JFXEffectPreviewManager *)self cachedPreviewForEffect:v15 completion:v17];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (v5 || !WeakRetained || [WeakRetained isContinouslyPreviewing])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v11[2] = __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke_2;
    id v11[3] = &unk_264C0D238;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "preparePreviewForEffect:atSize:options:completion:", v9, v10, v11, *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

uint64_t __70__JFXEffectPreviewManager_previewForEffect_atSize_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)JFX_renderPreviewForEffect:(id)a3 previewSize:(CGSize)a4 options:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v58[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(JFXEffectPreviewManager *)self previewQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = [(JFXEffectPreviewManager *)self concurrentStaticPreviewSemaphore];
  dispatch_time_t v16 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v15, v16);

  if (v12)
  {
    [v12 renderRange];
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
  }
  uint64_t v17 = [v11 renderEffect];
  v54[0] = v55;
  v54[1] = v56;
  v54[2] = v57;
  [(id)v17 setEffectRange:v54];

  [v11 setForceRenderAtPosterFrame:1];
  -[JFXEffectPreviewManager JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:](self, "JFX_configureCommonRenderingPropertiesForEffect:forPreviewSize:withPreviewOptions:", v11, v12, width, height);
  [v12 renderedImageCropRect];
  *(void *)&long long v52 = v18;
  *((void *)&v52 + 1) = v19;
  *(void *)&long long v53 = v20;
  *((void *)&v53 + 1) = v21;
  id v22 = [v12 renderPropertiesConfigurationBlock];
  LOBYTE(v17) = v22 == 0;

  if ((v17 & 1) == 0)
  {
    CGFloat v23 = [v12 renderPropertiesConfigurationBlock];
    ((void (**)(void, id, long long *, double, double))v23)[2](v23, v11, &v52, width, height);
  }
  id v24 = [v12 renderBackgroundImage];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    long long location = 0uLL;
    uint64_t v50 = 0;
    if (v12 && ([v12 renderTime], (v48 & 1) != 0))
    {
      [v12 renderTime];
    }
    else
    {
      long long location = kDefaultEffectPreviewRenderTime;
      uint64_t v50 = 0;
    }
    id v31 = [JFXEffectsPreviewGenerationRequest alloc];
    long long v46 = location;
    uint64_t v47 = v50;
    long long v30 = -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:renderTime:](v31, "initWithInputGenerator:effectStack:outputSize:renderTime:", v11, 0, &v46, width, height);
  }
  else
  {
    id v26 = [JFXEffectsPreviewGenerationRequest alloc];
    id v27 = [v12 renderBackgroundImage];
    id v28 = [v27 pvImageBuffer];
    v58[0] = v11;
    long long v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
    if (v12) {
      [v12 renderTime];
    }
    else {
      memset(v51, 0, sizeof(v51));
    }
    long long v30 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:renderTime:](v26, "initWithInput:effectStack:outputSize:renderTime:", v28, v29, v51, width, height);

    [(JFXEffectsPreviewGenerationRequest *)v30 centerAnimationInfo];
  }
  -[JFXEffectsPreviewGenerationRequest setHighQuality:](v30, "setHighQuality:", [v12 quality] == 2);
  if ([v12 parentCode] != -1) {
    -[JFXEffectsPreviewGenerationRequest setParentCode:](v30, "setParentCode:", [v12 parentCode]);
  }
  id v32 = [(JFXEffectPreviewManager *)self concurrentStaticPreviewSemaphore];
  objc_initWeak((id *)&location, self);
  uint64_t v33 = [(JFXEffectPreviewManager *)self staticPreviewGenerator];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __85__JFXEffectPreviewManager_JFX_renderPreviewForEffect_previewSize_options_completion___block_invoke;
  v38[3] = &unk_264C0D288;
  id v34 = v32;
  id v39 = v34;
  objc_copyWeak(&v43, (id *)&location);
  id v35 = v13;
  id v42 = v35;
  long long v44 = v52;
  long long v45 = v53;
  id v36 = v12;
  id v40 = v36;
  id v37 = v11;
  id v41 = v37;
  [v33 generatePreviewRequest:v30 completionHandler:v38];

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)&location);
}

void __85__JFXEffectPreviewManager_JFX_renderPreviewForEffect_previewSize_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained || !v14)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_15;
  }
  uint64_t v4 = [v14 objectEnumerator];
  id v5 = [v4 nextObject];

  if (v5)
  {
    if (CGRectIsEmpty(*(CGRect *)(a1 + 72))) {
      uint64_t v6 = [v5 copyOfUIImage];
    }
    else {
      uint64_t v6 = objc_msgSend(v5, "copyOfUIImage:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    }
    id v7 = (void *)v6;
    if (v6)
    {
      id v8 = [[JTImage alloc] initWithUIImage:v6];
      if (([*(id *)(a1 + 40) dontCache] & 1) == 0)
      {
        uint64_t v9 = [WeakRetained previewCache];
        uint64_t v10 = [*(id *)(a1 + 48) effectID];
        [v9 setObject:v8 forKey:v10];

        if (([*(id *)(a1 + 40) dontCacheToDisk] & 1) == 0)
        {
          id v11 = [WeakRetained previewDiskCache];
          id v12 = [*(id *)(a1 + 48) effectID];
          id v13 = [*(id *)(a1 + 48) contentVersion];
          [v11 savePreviewForEffectID:v12 image:v8 version:v13 completion:0];
        }
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = 0;
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_15:
}

- (void)cachedPreviewForEffect:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(JFXEffectPreviewManager *)self previewCache];
  uint64_t v9 = [v6 effectID];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke;
    v29[3] = &unk_264C0A5A8;
    id v32 = v7;
    id v30 = v10;
    id v31 = 0;
    [(JFXEffectPreviewManager *)self JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:v29];

    id v11 = v32;
  }
  else if ([(JFXEffectPreviewManager *)self isContinouslyPreviewing])
  {
    id v11 = [(JFXEffectPreviewManager *)self defaultPreviewImage];
    if (v11)
    {
      id v12 = objc_opt_new();
      id v13 = [(JFXEffectPreviewManager *)self defaultPreviewImageDisplayTransformValue];
      if (v13) {
        [v12 setValue:v13 forKey:@"JFXEffectFoundPreviewLiveCaptureImageDisplayTransform"];
      }
      [v12 setValue:MEMORY[0x263EFFA88] forKey:@"JFXEffectFoundDefaultImageToUseWhilePreparingPreview"];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_4;
      v19[3] = &unk_264C0A5A8;
      id v22 = v7;
      id v11 = v11;
      id v20 = v11;
      id v21 = v12;
      id v14 = v12;
      [(JFXEffectPreviewManager *)self JFX_dispatchBlockOnCallbackQueueImmediatelyWhenPossible:v19];
    }
  }
  else
  {
    id v15 = [(JFXEffectPreviewManager *)self callbackQueue];
    objc_initWeak(&location, self);
    dispatch_time_t v16 = [(JFXEffectPreviewManager *)self previewDiskCache];
    uint64_t v17 = [v6 effectID];
    uint64_t v18 = [v6 contentVersion];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_2;
    v23[3] = &unk_264C0D2B0;
    objc_copyWeak(&v27, &location);
    id v24 = v6;
    id v11 = v15;
    id v25 = v11;
    id v26 = v7;
    [v16 previewForEffectID:v17 version:v18 completion:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = [WeakRetained previewCache];
    id v6 = [*(id *)(a1 + 32) effectID];
    [v5 setObject:v3 forKey:v6];
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_3;
  v10[3] = &unk_264C0AF38;
  id v7 = *(NSObject **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(v7, v10);
}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __61__JFXEffectPreviewManager_cachedPreviewForEffect_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)purgeCachedPreviewForEffect:(id)a3
{
  id v4 = a3;
  id v6 = [(JFXEffectPreviewManager *)self previewCache];
  id v5 = [v4 effectID];

  [v6 removeObjectForKey:v5];
}

- (void)purgeCachedPreviewsForAllEffects
{
  id v3 = [(JFXEffectPreviewManager *)self previewCache];
  [v3 removeAllObjects];

  objc_initWeak(&location, self);
  id v4 = [(JFXEffectPreviewManager *)self previewQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__JFXEffectPreviewManager_purgeCachedPreviewsForAllEffects__block_invoke;
  v5[3] = &unk_264C0B428;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__JFXEffectPreviewManager_purgeCachedPreviewsForAllEffects__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStaticPreviewGenerator:0];
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (JFXLRUCache)previewCache
{
  return self->_previewCache;
}

- (JFXEffectPreviewDiskCache)previewDiskCache
{
  return self->_previewDiskCache;
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (OS_dispatch_queue)previewQueue
{
  return self->_previewQueue;
}

- (OS_dispatch_semaphore)concurrentStaticPreviewSemaphore
{
  return self->_concurrentStaticPreviewSemaphore;
}

- (NSObject)pickerPreviewingToken
{
  return self->_pickerPreviewingToken;
}

- (JFXEffectPreviewManagerDelegate)delegate_internal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate_internal);
  return (JFXEffectPreviewManagerDelegate *)WeakRetained;
}

- (void)setDelegate_internal:(id)a3
{
}

- (BOOL)continouslyPreviewing_internal
{
  return self->_continouslyPreviewing_internal;
}

- (void)setContinouslyPreviewing_internal:(BOOL)a3
{
  self->_continouslyPreviewing_internal = a3;
}

- (JTImage)defaultPreviewImage_internal
{
  return self->_defaultPreviewImage_internal;
}

- (void)setDefaultPreviewImage_internal:(id)a3
{
}

- (NSValue)_defaultPreviewImageDisplayTransformValue_internal
{
  return self->__defaultPreviewImageDisplayTransformValue_internal;
}

- (void)set_defaultPreviewImageDisplayTransformValue_internal:(id)a3
{
}

- (void)setStaticPreviewGenerator:(id)a3
{
}

- (PVLivePlayer)continousPreviewPlayer
{
  return self->_continousPreviewPlayer;
}

- (void)setContinousPreviewPlayer:(id)a3
{
}

- (CGSize)continousPreviewSize
{
  double width = self->_continousPreviewSize.width;
  double height = self->_continousPreviewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContinousPreviewSize:(CGSize)a3
{
  self->_continousPreviewSize = a3;
}

- (JFXEffectContinousPreviewOptions)continousPreviewOptions
{
  return self->_continousPreviewOptions;
}

- (void)setContinousPreviewOptions:(id)a3
{
}

- (NSMutableSet)preparedContinousPreviewEffects
{
  return self->_preparedContinousPreviewEffects;
}

- (void)setPreparedContinousPreviewEffects:(id)a3
{
}

- (NSMutableSet)effectsPreparingForPreview
{
  return self->_effectsPreparingForPreview;
}

- (void)setEffectsPreparingForPreview:(id)a3
{
}

- (NSSet)currentContinousPreviewEffects
{
  return self->_currentContinousPreviewEffects;
}

- (void)setCurrentContinousPreviewEffects:(id)a3
{
}

- (NSMapTable)assetRequestsForPreviewEffects
{
  return self->_assetRequestsForPreviewEffects;
}

- (void)setAssetRequestsForPreviewEffects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRequestsForPreviewEffects, 0);
  objc_storeStrong((id *)&self->_currentContinousPreviewEffects, 0);
  objc_storeStrong((id *)&self->_effectsPreparingForPreview, 0);
  objc_storeStrong((id *)&self->_preparedContinousPreviewEffects, 0);
  objc_storeStrong((id *)&self->_continousPreviewOptions, 0);
  objc_storeStrong((id *)&self->_continousPreviewPlayer, 0);
  objc_storeStrong((id *)&self->_staticPreviewGenerator, 0);
  objc_storeStrong((id *)&self->__defaultPreviewImageDisplayTransformValue_internal, 0);
  objc_storeStrong((id *)&self->_defaultPreviewImage_internal, 0);
  objc_destroyWeak((id *)&self->_delegate_internal);
  objc_storeStrong((id *)&self->_pickerPreviewingToken, 0);
  objc_storeStrong((id *)&self->_concurrentStaticPreviewSemaphore, 0);
  objc_storeStrong((id *)&self->_previewQueue, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_previewDiskCache, 0);
  objc_storeStrong((id *)&self->_previewCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end