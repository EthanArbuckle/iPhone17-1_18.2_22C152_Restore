@interface AVTPresetResourceLoader
- (AVTImageCache)inMemoryImageCache;
- (AVTInMemoryResourceCache)presetCache;
- (AVTPresetResourceLoader)initWithEnvironment:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5;
- (AVTPresetResourceLoader)initWithPresetCache:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5 environment:(id)a6;
- (AVTTaskScheduler)renderingScheduler;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (id)preLoadResourcesForPresetResourcesProvider:(id)a3 completionHandler:(id)a4;
- (id)preLoadResourcesForSectionItem:(id)a3 completionHandler:(id)a4;
- (void)performPresetLoadingForPresetResources:(id)a3 task:(id)a4;
- (void)performPresetResourcesPreloadingTask:(id)a3;
- (void)performSectionItemPreloadingTask:(id)a3;
- (void)startPresetPreloadingTask:(id)a3;
- (void)startSectionItemPreloadingTask:(id)a3;
@end

@implementation AVTPresetResourceLoader

- (AVTPresetResourceLoader)initWithEnvironment:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [AVTInMemoryResourceCache alloc];
  v12 = [v10 lockProvider];
  v13 = [v10 logger];
  v14 = [(AVTInMemoryResourceCache *)v11 initWithLockProvider:v12 totalCostLimit:50 logger:v13];

  v15 = [(AVTPresetResourceLoader *)self initWithPresetCache:v14 renderingScheduler:v9 callbackQueue:v8 environment:v10];
  return v15;
}

- (AVTPresetResourceLoader)initWithPresetCache:(id)a3 renderingScheduler:(id)a4 callbackQueue:(id)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)AVTPresetResourceLoader;
  v15 = [(AVTPresetResourceLoader *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a6);
    objc_storeStrong((id *)&v16->_presetCache, a3);
    uint64_t v17 = [v14 inMemoryImageCache];
    inMemoryImageCache = v16->_inMemoryImageCache;
    v16->_inMemoryImageCache = (AVTImageCache *)v17;

    v19 = [v14 serialQueueProvider];
    uint64_t v20 = ((void (**)(void, const char *))v19)[2](v19, "com.apple.AvatarUI.AVTPresetResourceLoader.workQueue");
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [v14 logger];
    logger = v16->_logger;
    v16->_logger = (AVTUILogger *)v22;

    objc_storeStrong((id *)&v16->_renderingScheduler, a4);
    objc_storeStrong((id *)&v16->_callbackQueue, a5);
  }

  return v16;
}

- (id)preLoadResourcesForSectionItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AVTSectionItemLoadingTask alloc] initWithSectionItem:v7 completionHandler:v6];

  [(AVTPresetResourceLoader *)self startSectionItemPreloadingTask:v8];
  return v8;
}

- (void)startSectionItemPreloadingTask:(id)a3
{
  id v4 = a3;
  v5 = [(AVTPresetResourceLoader *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AVTPresetResourceLoader_startSectionItemPreloadingTask___block_invoke;
  v7[3] = &unk_263FF0780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__AVTPresetResourceLoader_startSectionItemPreloadingTask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  v3 = [*(id *)(a1 + 40) description];
  [v2 logStartingPreLoadingTask:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 performSectionItemPreloadingTask:v5];
}

- (void)performSectionItemPreloadingTask:(id)a3
{
  id v4 = a3;
  if (([v4 isCanceled] & 1) == 0)
  {
    uint64_t v5 = [v4 sectionItem];
    id v6 = [v5 presetResourcesProvider];
    id v7 = v6[2]();
    [(AVTPresetResourceLoader *)self performPresetLoadingForPresetResources:v7 task:v4];

    if (([v4 isCanceled] & 1) == 0)
    {
      id v8 = [(AVTPresetResourceLoader *)self logger];
      id v9 = (void *)MEMORY[0x21052FFD0]();
      id v10 = [v4 sectionItem];
      id v11 = [v10 stickerResourceProvider];

      id v12 = [v4 sectionItem];
      id v13 = v12;
      if (v11)
      {
        id v14 = [v12 stickerResourceProvider];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke;
        v25[3] = &unk_263FF1970;
        v15 = &v26;
        id v26 = v8;
        v16 = &v27;
        id v27 = v4;
        ((void (**)(void, void *, void))v14)[2](v14, v25, 0);
      }
      else
      {
        id v14 = [v12 thumbnailProvider];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_2;
        v22[3] = &unk_263FF1998;
        v15 = &v23;
        id v23 = v8;
        v16 = &v24;
        id v24 = v4;
        ((void (**)(void, void *, void))v14)[2](v14, v22, 0);
      uint64_t v17 = };

      v18 = [(AVTPresetResourceLoader *)self renderingScheduler];
      [v18 lowerTaskPriority:v17];

      if (([v4 isCanceled] & 1) == 0)
      {
        v19 = [(AVTPresetResourceLoader *)self callbackQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_3;
        block[3] = &unk_263FF03D8;
        id v21 = v4;
        dispatch_async(v19, block);
      }
    }
  }
}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) description];
  [v1 logDonePreLoadingThumbnailForPreLoadingTask:v2];
}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) description];
  [v1 logDonePreLoadingThumbnailForPreLoadingTask:v2];
}

void __60__AVTPresetResourceLoader_performSectionItemPreloadingTask___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) completionHandler];
    v2[2](v2, *(void *)(a1 + 32));
  }
}

- (id)preLoadResourcesForPresetResourcesProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [AVTPresetResourcesLoadingTask alloc];
  id v9 = [v7 representedAVTPresetResources];

  id v10 = [(AVTPresetResourcesLoadingTask *)v8 initWithPresetResources:v9 completionHandler:v6];
  [(AVTPresetResourceLoader *)self startPresetPreloadingTask:v10];
  return v10;
}

- (void)startPresetPreloadingTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTPresetResourceLoader *)self logger];
  id v6 = [v4 description];
  [v5 logStartingPreLoadingTask:v6];

  id v7 = [(AVTPresetResourceLoader *)self workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__AVTPresetResourceLoader_startPresetPreloadingTask___block_invoke;
  v9[3] = &unk_263FF0780;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __53__AVTPresetResourceLoader_startPresetPreloadingTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPresetResourcesPreloadingTask:*(void *)(a1 + 40)];
}

- (void)performPresetResourcesPreloadingTask:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isCanceled] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 presetResources];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AVTPresetResourceLoader *)self performPresetLoadingForPresetResources:*(void *)(*((void *)&v13 + 1) + 8 * v9) task:v4];
        if ([v4 isCanceled]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v10 = [(AVTPresetResourceLoader *)self callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__AVTPresetResourceLoader_performPresetResourcesPreloadingTask___block_invoke;
      block[3] = &unk_263FF03D8;
      id v12 = v4;
      dispatch_async(v10, block);

      uint64_t v5 = v12;
    }
  }
}

void __64__AVTPresetResourceLoader_performPresetResourcesPreloadingTask___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) completionHandler];
    v2[2](v2, *(void *)(a1 + 32));
  }
}

- (void)performPresetLoadingForPresetResources:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x21052FFD0]();
  uint64_t v9 = [(AVTPresetResourceLoader *)self logger];
  id v10 = [v6 volatileIdentifierForScope:0];
  id v11 = [v7 description];
  [v9 logLookingUpPreLoadedPreset:v10 task:v11];

  id v12 = [(AVTPresetResourceLoader *)self presetCache];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__AVTPresetResourceLoader_performPresetLoadingForPresetResources_task___block_invoke;
  v16[3] = &unk_263FF19C0;
  v16[4] = self;
  id v13 = v6;
  id v17 = v13;
  id v14 = v7;
  id v18 = v14;
  id v15 = (id)[v12 resourceForItem:v13 scope:0 cacheMissHandler:v16];
}

id __71__AVTPresetResourceLoader_performPresetLoadingForPresetResources_task___block_invoke(id *a1)
{
  id v2 = [a1[4] logger];
  v3 = [a1[5] volatileIdentifierForScope:0];
  id v4 = [a1[6] description];
  [v2 logPreLoadingPreset:v3 task:v4];

  uint64_t v5 = [a1[5] resources];
  id v6 = [a1[4] logger];
  id v7 = [a1[5] volatileIdentifierForScope:0];
  uint64_t v8 = [a1[6] description];
  [v6 logDonePreLoadingPreset:v7 task:v8];

  return v5;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTInMemoryResourceCache)presetCache
{
  return self->_presetCache;
}

- (AVTImageCache)inMemoryImageCache
{
  return self->_inMemoryImageCache;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_presetCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end