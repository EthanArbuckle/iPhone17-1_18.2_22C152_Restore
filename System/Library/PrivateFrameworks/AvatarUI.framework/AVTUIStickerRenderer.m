@interface AVTUIStickerRenderer
+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3;
+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4;
+ (id)imageEncoder;
+ (id)stickerCacheWithEnvironment:(id)a3;
- (AVTAvatarRecord)avatarRecord;
- (AVTCacheableResource)cacheableResourceItem;
- (AVTClippableImageStore)imageStore;
- (AVTMemoji)avatar;
- (AVTResourceCache)cache;
- (AVTStickerTaskScheduler)renderingScheduler;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTUIStickerGeneratorPool)stickerGeneratorPool;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 cache:(id)a5 imageStore:(id)a6 stickerGeneratorPool:(id)a7 environment:(id)a8 renderingScheduler:(id)a9 renderingQueue:(id)a10 encodingQueue:(id)a11 callbackQueue:(id)a12;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 stickerGeneratorPool:(id)a5 scheduler:(id)a6 imageStore:(id)a7 environment:(id)a8;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 imageStore:(id)a5 stickerGeneratorPool:(id)a6 environment:(id)a7 renderingScheduler:(id)a8 renderingQueue:(id)a9 encodingQueue:(id)a10 callbackQueue:(id)a11;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 renderingScheduler:(id)a5 renderingQueue:(id)a6 encodingQueue:(id)a7 stickerGeneratorPool:(id)a8 environment:(id)a9;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5;
- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5 imageStore:(id)a6;
- (BOOL)parallelizeEncoding;
- (BOOL)usingService;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)renderingQueue;
- (id)_providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6;
- (id)_providerForResourceForScope:(id)a3 queue:(id)a4 renderWithCompletionHandler:(id)a5;
- (id)_scheduledRemoteImageRendererProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4;
- (id)_scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8;
- (id)providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6;
- (id)providerForResourceForScope:(id)a3 queue:(id)a4 renderingHandler:(id)a5;
- (id)providerForResourceWithAvatarConfiguration:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6;
- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 configuration:(id)a5 correctClipping:(BOOL)a6;
- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 stickerConfiguration:(id)a5 avatarConfiguration:(id)a6 correctClipping:(BOOL)a7;
- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3;
- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4;
- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 usingService:(BOOL)a4;
- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6;
- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6 correctClipping:(BOOL)a7;
- (id)scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8;
- (void)saveImageForResource:(id)a3 forScope:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6;
- (void)setParallelizeEncoding:(BOOL)a3;
- (void)setUsingService:(BOOL)a3;
- (void)stopUsingResources;
@end

@implementation AVTUIStickerRenderer

+ (id)imageEncoder
{
  v2 = objc_alloc_init(AVTStickerImageEncoder);
  return v2;
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (AVTUIStickersCaching())
  {
    if (AVTUIFlushStickersCache())
    {
      v4 = [v3 stickerImageStoreLocation];
      v5 = [v3 logger];
      +[AVTImageStore clearContentAtLocation:v4 logger:v5];

      AVTUISetFlushStickersCache();
    }
    v6 = [AVTInMemoryResourceCache alloc];
    v7 = [v3 lockProvider];
    v8 = [v3 logger];
    v9 = [(AVTInMemoryResourceCache *)v6 initWithLockProvider:v7 totalCostLimit:980000 logger:v8];
  }
  else
  {
    v10 = [v3 stickerImageStoreLocation];
    v11 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v10 logger:v11];

    AVTUISetFlushStickersCache();
    v9 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v9;
}

+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[AVTUIEnvironment defaultEnvironment];
  v6 = [v5 coreEnvironment];
  LOBYTE(a1) = [a1 clearStickersForAvatarRecordIdentifier:v4 withEnvironment:v6];

  return (char)a1;
}

+ (BOOL)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [AVTImageStore alloc];
  v8 = [v5 stickerImageStoreLocation];
  v9 = [(AVTImageStore *)v7 initWithEnvironment:v5 validateImages:0 location:v8];

  v10 = +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:v6];

  LOBYTE(v6) = [(AVTImageStore *)v9 deleteImagesForItemsWithPersistentIdentifierPrefix:v10 error:0];
  return (char)v6;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[AVTUIEnvironment defaultEnvironment];
  v12 = [(id)objc_opt_class() stickerCacheWithEnvironment:v11];
  v13 = [v11 backgroundRenderingQueue];
  v14 = [v11 backgroundEncodingQueue];
  v15 = [(AVTUIStickerRenderer *)self initWithAvatarRecord:v10 cache:v12 renderingScheduler:v8 renderingQueue:v13 encodingQueue:v14 stickerGeneratorPool:v9 environment:v11];

  return v15;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 stickerGeneratorPool:(id)a4 scheduler:(id)a5 imageStore:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[AVTUIEnvironment defaultEnvironment];
  v15 = [(id)objc_opt_class() stickerCacheWithEnvironment:v14];
  v16 = [v14 backgroundRenderingQueue];
  v17 = [v14 backgroundEncodingQueue];
  v18 = [(AVTUIStickerRenderer *)self initWithAvatarRecord:v13 avatar:0 cache:v15 imageStore:v10 stickerGeneratorPool:v12 environment:v14 renderingScheduler:v11 renderingQueue:v16 encodingQueue:v17 callbackQueue:MEMORY[0x263EF83A0]];

  return v18;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 stickerGeneratorPool:(id)a5 scheduler:(id)a6 imageStore:(id)a7 environment:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(id)objc_opt_class() stickerCacheWithEnvironment:v14];
  v21 = [v14 backgroundRenderingQueue];
  v22 = [v14 backgroundEncodingQueue];
  v23 = [(AVTUIStickerRenderer *)self initWithAvatarRecord:v19 avatar:v18 cache:v20 imageStore:v15 stickerGeneratorPool:v17 environment:v14 renderingScheduler:v16 renderingQueue:v21 encodingQueue:v22 callbackQueue:MEMORY[0x263EF83A0]];

  return v23;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 renderingScheduler:(id)a5 renderingQueue:(id)a6 encodingQueue:(id)a7 stickerGeneratorPool:(id)a8 environment:(id)a9
{
  id v16 = a9;
  id v29 = a8;
  id v28 = a7;
  id v27 = a6;
  id v26 = a5;
  id v25 = a4;
  id v17 = a3;
  id v18 = [(id)objc_opt_class() imageEncoder];
  id v19 = [AVTClippableImageStore alloc];
  v20 = [v16 coreEnvironment];
  v21 = [v16 stickerImageStoreLocation];
  v22 = [(AVTImageStore *)v19 initWithEnvironment:v20 validateImages:0 location:v21 encoder:v18];

  v23 = [(AVTUIStickerRenderer *)self initWithAvatarRecord:v17 avatar:0 cache:v25 imageStore:v22 stickerGeneratorPool:v29 environment:v16 renderingScheduler:v26 renderingQueue:v27 encodingQueue:v28 callbackQueue:MEMORY[0x263EF83A0]];
  return v23;
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 cache:(id)a4 imageStore:(id)a5 stickerGeneratorPool:(id)a6 environment:(id)a7 renderingScheduler:(id)a8 renderingQueue:(id)a9 encodingQueue:(id)a10 callbackQueue:(id)a11
{
  return [(AVTUIStickerRenderer *)self initWithAvatarRecord:a3 avatar:0 cache:a4 imageStore:a5 stickerGeneratorPool:a6 environment:a7 renderingScheduler:a8 renderingQueue:a9 encodingQueue:a10 callbackQueue:a11];
}

- (AVTUIStickerRenderer)initWithAvatarRecord:(id)a3 avatar:(id)a4 cache:(id)a5 imageStore:(id)a6 stickerGeneratorPool:(id)a7 environment:(id)a8 renderingScheduler:(id)a9 renderingQueue:(id)a10 encodingQueue:(id)a11 callbackQueue:(id)a12
{
  id v37 = a3;
  id obj = a4;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v29 = a8;
  id v18 = a8;
  id v32 = a9;
  id v31 = a10;
  id v19 = a11;
  id v20 = a12;
  v38.receiver = self;
  v38.super_class = (Class)AVTUIStickerRenderer;
  v21 = [(AVTUIStickerRenderer *)&v38 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_avatarRecord, a3);
    objc_storeStrong((id *)&v22->_avatar, obj);
    objc_storeStrong((id *)&v22->_cache, a5);
    objc_storeStrong((id *)&v22->_stickerGeneratorPool, a7);
    objc_storeStrong((id *)&v22->_imageStore, a6);
    objc_storeStrong((id *)&v22->_environment, v29);
    uint64_t v23 = [v18 logger];
    logger = v22->_logger;
    v22->_logger = (AVTUILogger *)v23;

    objc_storeStrong((id *)&v22->_renderingQueue, a10);
    objc_storeStrong((id *)&v22->_encodingQueue, a11);
    objc_storeStrong((id *)&v22->_renderingScheduler, a9);
    objc_storeStrong((id *)&v22->_callbackQueue, a12);
    *(_WORD *)&v22->_parallelizeEncoding = 0;
    id v25 = -[AVTAvatarRecordCacheableResource initWithAvatarRecord:includeAvatarData:environment:]([AVTAvatarRecordCacheableResource alloc], "initWithAvatarRecord:includeAvatarData:environment:", v37, [v37 isEditable], v18);
    cacheableResourceItem = v22->_cacheableResourceItem;
    v22->_cacheableResourceItem = (AVTCacheableResource *)v25;
  }
  return v22;
}

- (id)scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(AVTUIStickerRenderer *)self cache];
  if (v8)
  {
    id v20 = +[AVTResourceCacheSupport resourceFromCache:v19 forItem:v14 scope:v15 preflightCacheMissHandler:0 cacheMissHandler:v17 cacheMissQueue:0 taskScheduler:0 callbackQueue:0 resourceHandler:v18];
  }
  else
  {
    v21 = [(AVTUIStickerRenderer *)self renderingScheduler];
    v22 = [(AVTUIStickerRenderer *)self callbackQueue];
    id v20 = +[AVTResourceCacheSupport resourceFromCache:v19 forItem:v14 scope:v15 preflightCacheMissHandler:0 cacheMissHandler:v17 cacheMissQueue:v16 taskScheduler:v21 callbackQueue:v22 resourceHandler:v18];
  }
  return v20;
}

- (id)providerForResourceForScope:(id)a3 queue:(id)a4 renderingHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTUIStickerRenderer *)self cacheableResourceItem];
  id v12 = [(AVTUIStickerRenderer *)self providerForResource:v11 forScope:v10 queue:v9 renderingHandler:v8];

  return v12;
}

- (id)providerForResourceWithAvatarConfiguration:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
{
  v20[2] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [AVTAggregateCacheableResource alloc];
  id v15 = [(AVTUIStickerRenderer *)self cacheableResourceItem];
  v20[0] = v15;
  v20[1] = v13;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];

  id v17 = [(AVTAggregateCacheableResource *)v14 initWithCacheableResources:v16];
  id v18 = [(AVTUIStickerRenderer *)self providerForResource:v17 forScope:v12 queue:v11 renderingHandler:v10];

  return v18;
}

- (id)providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke;
  void v20[3] = &unk_263FF1430;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = (void *)[v20 copy];

  return v18;
}

id __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) imageStore];
  if (v6) {
    BOOL v7 = a3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) imageStore];
    uint64_t v9 = [v8 resourceExistsInCacheForItem:*(void *)(a1 + 40) scope:*(void *)(a1 + 48)];
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_2;
  v18[3] = &unk_263FF1408;
  char v21 = v9;
  id v20 = v5;
  v18[4] = v10;
  id v19 = v12;
  id v15 = v5;
  id v16 = [v10 scheduledTaskForItem:v11 scope:v12 queue:v13 renderingHandler:v14 resourceHandler:v18 synchronous:v9];

  return v16;
}

void __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 URL];

  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      BOOL v5 = 1;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      BOOL v5 = *(unsigned char *)(a1 + 56) != 0;
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_3;
    v8[3] = &unk_263FF13E0;
    id v9 = *(id *)(a1 + 48);
    [v6 saveImageForResource:v3 forScope:v7 synchronous:v5 completionHandler:v8];
  }
}

uint64_t __76__AVTUIStickerRenderer_providerForResource_forScope_queue_renderingHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveImageForResource:(id)a3 forScope:(id)a4 synchronous:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke;
  v22[3] = &unk_263FF07D0;
  v22[4] = self;
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  uint64_t v15 = MEMORY[0x210530210](v22);
  id v16 = (void *)v15;
  if (v7)
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
    v12[2](v12, v13);
  }
  else
  {
    id v17 = [(AVTUIStickerRenderer *)self encodingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_2;
    block[3] = &unk_263FF1458;
    id v20 = v16;
    block[4] = self;
    char v21 = v12;
    id v19 = v13;
    dispatch_async(v17, block);
  }
}

void __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageStore];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) cacheableResourceItem];
    id v4 = [*(id *)(a1 + 32) imageStore];
    BOOL v5 = [*(id *)(a1 + 40) image];
    uint64_t v6 = *(void *)(a1 + 48);
    [*(id *)(a1 + 40) clippingRect];
    id v10 = 0;
    objc_msgSend(v4, "saveImage:forItem:scope:clippingRect:error:", v5, v3, v6, &v10);
    id v7 = v10;

    id v8 = [*(id *)(a1 + 32) imageStore];
    id v9 = [v8 resourceURLForItem:v3 scope:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) setURL:v9];
  }
}

void __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 32) callbackQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_3;
  v3[3] = &unk_263FF02C8;
  id v5 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __84__AVTUIStickerRenderer_saveImageForResource_forScope_synchronous_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 configuration:(id)a5 correctClipping:(BOOL)a6
{
  return [(AVTUIStickerRenderer *)self renderStickerResourceForItem:a3 scope:a4 stickerConfiguration:a5 avatarConfiguration:0 correctClipping:a6];
}

- (id)renderStickerResourceForItem:(id)a3 scope:(id)a4 stickerConfiguration:(id)a5 avatarConfiguration:(id)a6 correctClipping:(BOOL)a7
{
  BOOL v59 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v62 = a6;
  id v14 = [(AVTUIStickerRenderer *)self imageStore];
  v63 = [v14 resourceURLForItem:v11 scope:v12];

  uint64_t v15 = [v13 stickerPack];
  id v16 = (void *)*MEMORY[0x263F29708];
  BOOL v17 = v15 == (void *)*MEMORY[0x263F29708];

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__8;
  v86 = __Block_byref_object_dispose__8;
  id v87 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__8;
  v80 = __Block_byref_object_dispose__8;
  id v81 = 0;
  id v18 = [(AVTUIStickerRenderer *)self imageStore];
  id v19 = (id *)(v77 + 5);
  id obj = (id)v77[5];
  id v20 = [v18 imageForItem:v11 scope:v12 error:&obj];
  objc_storeStrong(v19, obj);

  if (v20)
  {
    char v21 = [(AVTUIStickerRenderer *)self imageStore];
    [v21 resourceClippingRectForItem:v11 scope:v12];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    v30 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v20, v63, v23, v25, v27, v29);
    id v31 = (void *)v83[5];
    v83[5] = (uint64_t)v30;

    [(id)v83[5] setPrereleaseSticker:v15 == v16];
  }
  else
  {
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke;
    v67[3] = &unk_263FF1480;
    v67[4] = self;
    v72 = &v82;
    BOOL v74 = v17;
    id v68 = v11;
    id v69 = v12;
    v73 = &v76;
    id v70 = v63;
    id v32 = v13;
    id v71 = v32;
    v58 = (void *)MEMORY[0x210530210](v67);
    id v33 = [(AVTUIStickerRenderer *)self stickerGeneratorPool];
    id v34 = [(AVTUIStickerRenderer *)self avatarRecord];
    v61 = objc_msgSend(v33, "dequeueStickerGeneratorForAvatarRecord:needAvatar:", v34, objc_msgSend(v32, "preRendered") ^ 1);

    id v35 = [(AVTUIStickerRenderer *)self avatar];

    if (v62 && v35)
    {
      id v36 = [(AVTUIStickerRenderer *)self avatar];
      [v62 applyToAvatar:v36 animated:0];

      id v37 = [(AVTUIStickerRenderer *)self avatar];
      [v61 setAvatar:v37];
    }
    [v61 setAsync:0];
    if (v61)
    {
      objc_super v38 = [(AVTUIStickerRenderer *)self logger];
      v39 = [v32 name];
      v40 = [(AVTUIStickerRenderer *)self avatarRecord];
      v41 = [v40 description];
      [v38 logRenderingStickerStart:v39 forRecord:v41];

      v42 = [MEMORY[0x263F296D8] defaultOptions];
      [v42 setCorrectClipping:v59];
      if ([(AVTUIStickerRenderer *)self usingService])
      {
        v43 = [(AVTUIStickerRenderer *)self environment];
        v57 = [v43 remoteRenderer];
        v56 = v42;

        dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
        v60 = [(AVTUIStickerRenderer *)self avatarRecord];
        v45 = [v32 stickerPack];
        v46 = [v32 name];
        uint64_t v47 = v83[5];
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke_2;
        v64[3] = &unk_263FF14A8;
        v66 = &v82;
        v48 = v44;
        v65 = v48;
        [v57 getStickerAndCacheForAvatarRecord:v60 withStickerPackName:v45 stickerConfigurationName:v46 resource:v47 withReply:v64];

        dispatch_time_t v49 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v48, v49))
        {
          v50 = [(AVTUIStickerRenderer *)self logger];
          v51 = [v32 name];
          [v50 logTimedOutWaitingForSnapshotInService:v51];
        }
        if (!v83[5])
        {
          v52 = [(AVTUIStickerRenderer *)self logger];
          v53 = [v32 name];
          [v52 logFailedToGenerateStickerInService:v53];
        }
        v42 = v56;
      }
      else
      {
        [v61 stickerImageWithConfiguration:v32 options:v42 completionHandler:v58];
      }
    }
  }
  id v54 = (id)v83[5];

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  return v54;
}

void __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  if (!v13)
  {
    uint64_t v15 = [*(id *)(a1 + 32) logger];
    [v15 logNilImageReturnedFromAVTUIStickerRenderer];
  }
  id v16 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v13, 0, a4, a5, a6, a7);
  uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPrereleaseSticker:*(unsigned __int8 *)(a1 + 88)];
  if (([*(id *)(a1 + 32) parallelizeEncoding] & 1) == 0)
  {
    id v19 = [*(id *)(a1 + 32) imageStore];

    if (v19)
    {
      id v20 = [*(id *)(a1 + 32) imageStore];
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) clippingRect];
      uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
      id obj = *(id *)(v23 + 40);
      objc_msgSend(v20, "saveImage:forItem:scope:clippingRect:error:", v13, v21, v22, &obj);
      objc_storeStrong((id *)(v23 + 40), obj);

      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setURL:*(void *)(a1 + 56)];
    }
  }
  double v24 = [*(id *)(a1 + 32) logger];
  double v25 = [*(id *)(a1 + 64) name];
  [v24 logRenderingStickerEnd:v25];
}

void __116__AVTUIStickerRenderer_renderStickerResourceForItem_scope_stickerConfiguration_avatarConfiguration_correctClipping___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3
{
  return [(AVTUIStickerRenderer *)self scheduledStickerResourceProviderForStickerConfiguration:a3 correctClipping:1];
}

- (id)_scheduledTaskForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6 resourceHandler:(id)a7 synchronous:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(AVTUIStickerRenderer *)self cache];
  if (v8)
  {
    id v20 = +[AVTResourceCacheSupport resourceFromCache:v19 forItem:v14 scope:v15 preflightCacheMissHandler:0 cacheMissWithCompletionHandler:v17 cacheMissQueue:0 taskScheduler:0 callbackQueue:0 resourceHandler:v18];
  }
  else
  {
    uint64_t v21 = [(AVTUIStickerRenderer *)self renderingScheduler];
    uint64_t v22 = [(AVTUIStickerRenderer *)self callbackQueue];
    id v20 = +[AVTResourceCacheSupport resourceFromCache:v19 forItem:v14 scope:v15 preflightCacheMissHandler:0 cacheMissWithCompletionHandler:v17 cacheMissQueue:v16 taskScheduler:v21 callbackQueue:v22 resourceHandler:v18];
  }
  return v20;
}

- (id)_providerForResource:(id)a3 forScope:(id)a4 queue:(id)a5 renderWithCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke;
  void v20[3] = &unk_263FF1430;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = (void *)[v20 copy];

  return v18;
}

id __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) imageStore];
  if (v6) {
    BOOL v7 = a3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v9 = 0;
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) imageStore];
    uint64_t v9 = [v8 resourceExistsInCacheForItem:*(void *)(a1 + 40) scope:*(void *)(a1 + 48)];
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_263FF1408;
  char v21 = v9;
  id v20 = v5;
  v18[4] = v10;
  id v19 = v12;
  id v15 = v5;
  id v16 = [v10 _scheduledTaskForItem:v11 scope:v12 queue:v13 renderWithCompletionHandler:v14 resourceHandler:v18 synchronous:v9];

  return v16;
}

void __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ([v3 image], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v6 = (void *)v5,
        [v4 URL],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      BOOL v8 = 1;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      BOOL v8 = *(unsigned char *)(a1 + 56) != 0;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_263FF13E0;
    id v12 = *(id *)(a1 + 48);
    [v9 saveImageForResource:v4 forScope:v10 synchronous:v8 completionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __88__AVTUIStickerRenderer__providerForResource_forScope_queue_renderWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_providerForResourceForScope:(id)a3 queue:(id)a4 renderWithCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(AVTUIStickerRenderer *)self cacheableResourceItem];
  id v12 = [(AVTUIStickerRenderer *)self _providerForResource:v11 forScope:v10 queue:v9 renderWithCompletionHandler:v8];

  return v12;
}

- (id)_scheduledRemoteImageRendererProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [(AVTUIStickerRenderer *)self renderingQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke;
  v10[3] = &unk_263FF14F8;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = [(AVTUIStickerRenderer *)self _providerForResourceForScope:v7 queue:v6 renderWithCompletionHandler:v10];

  return v8;
}

void __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) stickerPack];
  id v11 = (void *)*MEMORY[0x263F29708];

  id v12 = [*(id *)(a1 + 40) imageStore];
  uint64_t v13 = [v12 resourceURLForItem:v7 scope:v8];

  uint64_t v14 = [*(id *)(a1 + 40) imageStore];
  id v42 = 0;
  id v15 = [v14 imageForItem:v7 scope:v8 error:&v42];
  id v16 = v42;

  if (!v15 || v16)
  {
    BOOL v28 = v10 == v11;
    double v29 = [AVTStickerResource alloc];
    double v27 = -[AVTStickerResource initWithImage:URL:clippingRect:](v29, "initWithImage:URL:clippingRect:", 0, v13, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AVTStickerResource *)v27 setPrereleaseSticker:v28];
    [*(id *)(a1 + 40) environment];
    v30 = objc_super v38 = v13;
    id v37 = [v30 remoteRenderer];

    id v31 = [*(id *)(a1 + 40) avatarRecord];
    [*(id *)(a1 + 32) stickerPack];
    v33 = id v32 = v9;
    id v34 = [*(id *)(a1 + 32) name];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke_2;
    v39[3] = &unk_263FF14D0;
    int8x16_t v36 = *(int8x16_t *)(a1 + 32);
    id v35 = (id)v36.i64[0];
    int8x16_t v40 = vextq_s8(v36, v36, 8uLL);
    id v41 = v32;
    [v37 getStickerAndCacheForAvatarRecord:v31 withStickerPackName:v33 stickerConfigurationName:v34 resource:v27 withReply:v39];

    id v9 = v32;
    uint64_t v13 = v38;

    id v16 = v37;
  }
  else
  {
    BOOL v17 = v10 == v11;
    id v18 = [*(id *)(a1 + 40) imageStore];
    [v18 resourceClippingRectForItem:v7 scope:v8];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    double v27 = -[AVTStickerResource initWithImage:URL:clippingRect:]([AVTStickerResource alloc], "initWithImage:URL:clippingRect:", v15, v13, v20, v22, v24, v26);
    [(AVTStickerResource *)v27 setPrereleaseSticker:v17];
    (*((void (**)(id, AVTStickerResource *))v9 + 2))(v9, v27);
  }
}

void __101__AVTUIStickerRenderer__scheduledRemoteImageRendererProviderForStickerConfiguration_correctClipping___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5)
  {
    id v3 = [*(id *)(a1 + 32) logger];
    id v4 = [*(id *)(a1 + 40) name];
    [v3 logFailedToGenerateStickerInService:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 usingService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTUIStickerRenderer *)self setUsingService:v4];
  if (v4) {
    [(AVTUIStickerRenderer *)self _scheduledRemoteImageRendererProviderForStickerConfiguration:v6 correctClipping:1];
  }
  else {
  id v7 = [(AVTUIStickerRenderer *)self scheduledStickerResourceProviderForStickerConfiguration:v6 correctClipping:1];
  }

  return v7;
}

- (id)scheduledStickerResourceProviderForStickerConfiguration:(id)a3 correctClipping:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(AVTUIStickerRenderer *)self renderingQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__AVTUIStickerRenderer_scheduledStickerResourceProviderForStickerConfiguration_correctClipping___block_invoke;
  v11[3] = &unk_263FF1520;
  void v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v8 = v6;
  id v9 = [(AVTUIStickerRenderer *)self providerForResourceForScope:v8 queue:v7 renderingHandler:v11];

  return v9;
}

uint64_t __96__AVTUIStickerRenderer_scheduledStickerResourceProviderForStickerConfiguration_correctClipping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) renderStickerResourceForItem:a2 scope:a3 configuration:*(void *)(a1 + 40) correctClipping:*(unsigned __int8 *)(a1 + 48)];
}

- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6
{
  return [(AVTUIStickerRenderer *)self scheduledStickerResourceProviderForThumbnailForModelPreset:a3 presetOverrides:a4 avatarConfiguration:a5 stickerConfiguration:a6 correctClipping:1];
}

- (id)scheduledStickerResourceProviderForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 avatarConfiguration:(id)a5 stickerConfiguration:(id)a6 correctClipping:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(AVTUIStickerRenderer *)self avatar];

  if (v16)
  {
    BOOL v17 = +[AVTPresetImageProvider configurationToRenderForPreset:v12 overrides:v13 baseConfiguration:v14];
    id v18 = [(AVTUIStickerRenderer *)self renderingQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __156__AVTUIStickerRenderer_scheduledStickerResourceProviderForThumbnailForModelPreset_presetOverrides_avatarConfiguration_stickerConfiguration_correctClipping___block_invoke;
    v22[3] = &unk_263FF1548;
    v22[4] = self;
    id v23 = v15;
    id v24 = v17;
    BOOL v25 = a7;
    id v19 = v17;
    double v20 = [(AVTUIStickerRenderer *)self providerForResourceWithAvatarConfiguration:v19 forScope:v23 queue:v18 renderingHandler:v22];
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

uint64_t __156__AVTUIStickerRenderer_scheduledStickerResourceProviderForThumbnailForModelPreset_presetOverrides_avatarConfiguration_stickerConfiguration_correctClipping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) renderStickerResourceForItem:a2 scope:a3 stickerConfiguration:*(void *)(a1 + 40) avatarConfiguration:*(void *)(a1 + 48) correctClipping:*(unsigned __int8 *)(a1 + 56)];
}

- (void)stopUsingResources
{
  id v4 = [(AVTUIStickerRenderer *)self stickerGeneratorPool];
  id v3 = [(AVTUIStickerRenderer *)self avatarRecord];
  [v4 didStopUsingStickerGeneratorForRecord:v3];
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTStickerTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTMemoji)avatar
{
  return self->_avatar;
}

- (AVTCacheableResource)cacheableResourceItem
{
  return self->_cacheableResourceItem;
}

- (AVTUIStickerGeneratorPool)stickerGeneratorPool
{
  return self->_stickerGeneratorPool;
}

- (BOOL)parallelizeEncoding
{
  return self->_parallelizeEncoding;
}

- (void)setParallelizeEncoding:(BOOL)a3
{
  self->_parallelizeEncoding = a3;
}

- (BOOL)usingService
{
  return self->_usingService;
}

- (void)setUsingService:(BOOL)a3
{
  self->_usingService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerGeneratorPool, 0);
  objc_storeStrong((id *)&self->_cacheableResourceItem, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end