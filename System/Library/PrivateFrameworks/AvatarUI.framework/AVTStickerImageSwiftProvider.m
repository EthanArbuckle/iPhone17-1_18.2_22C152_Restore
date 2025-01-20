@interface AVTStickerImageSwiftProvider
+ (id)imageStoreWithEnvironment:(id)a3;
+ (id)stickerCacheWithEnvironment:(id)a3;
- (AVTAvatarRecord)defaultMemoji;
- (AVTAvatarStoreInternal)avatarStore;
- (AVTClippableImageStore)imageStore;
- (AVTResourceCache)cache;
- (AVTSerialTaskScheduler)taskScheduler;
- (AVTStickerConfigurationProvider)configurationProvider;
- (AVTStickerGenerator)stickerGenerator;
- (AVTStickerImageSwiftProvider)init;
- (AVTStickerRecentsLayout)stickerRecentsLayout;
- (AVTUIEnvironment)environment;
- (AVTUIStickerGeneratorPool)generatorPool;
- (BOOL)hasFetchedDefaultMemoji;
- (NSArray)displayItems;
- (NSObject)avatarStoreChangeObserver;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)recentsWorkQueue;
- (OS_dispatch_queue)renderingQueue;
- (void)dealloc;
- (void)imageForAvatarRecord:(id)a3 poseName:(id)a4 completionHandler:(id)a5;
- (void)setAvatarStoreChangeObserver:(id)a3;
- (void)setConfigurationProvider:(id)a3;
- (void)setDefaultMemoji:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setEncodingQueue:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setHasFetchedDefaultMemoji:(BOOL)a3;
- (void)setImageStore:(id)a3;
- (void)setRecentsWorkQueue:(id)a3;
- (void)setRenderingQueue:(id)a3;
- (void)setTaskScheduler:(id)a3;
@end

@implementation AVTStickerImageSwiftProvider

- (AVTStickerImageSwiftProvider)init
{
  v35[2] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)AVTStickerImageSwiftProvider;
  v2 = [(AVTStickerImageSwiftProvider *)&v33 init];
  if (v2)
  {
    uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    uint64_t v5 = [(id)objc_opt_class() imageStoreWithEnvironment:v2->_environment];
    imageStore = v2->_imageStore;
    v2->_imageStore = (AVTClippableImageStore *)v5;

    v7 = objc_alloc_init(AVTAvatarStore);
    if (([(AVTAvatarStore *)v7 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v7 format];
    }
    v8 = v7;
    [(AVTAvatarStore *)v8 setStickerBackendDelegate:v2];
    objc_storeStrong((id *)&v2->_avatarStore, v7);
    v9 = [AVTUIStickerGeneratorPool alloc];
    v10 = [(AVTUIEnvironment *)v2->_environment logger];
    uint64_t v11 = [(AVTUIStickerGeneratorPool *)v9 initWithMaxStickerGeneratorCount:2 logger:v10];
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = (AVTUIStickerGeneratorPool *)v11;

    v13 = [(AVTUIEnvironment *)v2->_environment serialQueueProvider];
    uint64_t v14 = ((void (**)(void, const char *))v13)[2](v13, "com.apple.AvatarUI.StickerImageWorkQueue");
    recentsWorkQueue = v2->_recentsWorkQueue;
    v2->_recentsWorkQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [(AVTUIEnvironment *)v2->_environment backgroundRenderingQueue];
    renderingQueue = v2->_renderingQueue;
    v2->_renderingQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [(AVTUIEnvironment *)v2->_environment backgroundEncodingQueue];
    encodingQueue = v2->_encodingQueue;
    v2->_encodingQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [(id)objc_opt_class() stickerCacheWithEnvironment:v2->_environment];
    cache = v2->_cache;
    v2->_cache = (AVTResourceCache *)v20;

    if (AVTUIShowPrereleaseStickerPack_once())
    {
      uint64_t v22 = *MEMORY[0x263F29708];
      v35[0] = *MEMORY[0x263F296E8];
      v35[1] = v22;
      v23 = (void *)MEMORY[0x263EFF8C0];
      v24 = v35;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v34 = *MEMORY[0x263F296E8];
      v23 = (void *)MEMORY[0x263EFF8C0];
      v24 = &v34;
      uint64_t v25 = 1;
    }
    v26 = [v23 arrayWithObjects:v24 count:v25];
    v27 = [[AVTStickerConfigurationProvider alloc] initWithEnvironment:v2->_environment forStickerPacks:v26 stickerConfigurationNames:0];
    configurationProvider = v2->_configurationProvider;
    v2->_configurationProvider = v27;

    v29 = [(AVTUIEnvironment *)v2->_environment coreEnvironment];
    uint64_t v30 = +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:v29];
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (AVTSerialTaskScheduler *)v30;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerImageSwiftProvider;
  [(AVTStickerImageSwiftProvider *)&v5 dealloc];
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    v4 = [v3 stickerImageStoreLocation];
    objc_super v5 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v4 logger:v5];

    AVTUISetFlushStickersCache();
  }
  v6 = objc_alloc_init(AVTPassThroughResourceCache);

  return v6;
}

+ (id)imageStoreWithEnvironment:(id)a3
{
  id v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    v4 = [v3 stickerImageStoreLocation];
    objc_super v5 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v4 logger:v5];

    AVTUISetFlushStickersCache();
  }
  v6 = +[AVTUIStickerRenderer imageEncoder];
  v7 = [AVTClippableImageStore alloc];
  v8 = [v3 coreEnvironment];
  v9 = [v3 stickerImageStoreLocation];
  v10 = [(AVTImageStore *)v7 initWithEnvironment:v8 validateImages:1 location:v9 encoder:v6];

  return v10;
}

- (void)imageForAvatarRecord:(id)a3 poseName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AVTStickerConfigurationProvider *)self->_configurationProvider stickerConfigurationForAvatarRecord:v8 stickerName:v9];
  v12 = [AVTUIStickerRenderer alloc];
  v13 = [(AVTUIStickerRenderer *)v12 initWithAvatarRecord:v8 cache:self->_cache imageStore:self->_imageStore stickerGeneratorPool:self->_generatorPool environment:self->_environment renderingScheduler:self->_taskScheduler renderingQueue:self->_renderingQueue encodingQueue:self->_encodingQueue callbackQueue:MEMORY[0x263EF83A0]];
  uint64_t v14 = [(AVTUIStickerRenderer *)v13 scheduledStickerResourceProviderForStickerConfiguration:v11];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__AVTStickerImageSwiftProvider_imageForAvatarRecord_poseName_completionHandler___block_invoke;
  v17[3] = &unk_263FF27C8;
  objc_copyWeak(&v20, &location);
  v19 = v22;
  id v15 = v10;
  id v18 = v15;
  id v16 = (id)((uint64_t (**)(void, void *, void))v14)[2](v14, v17, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
}

void __80__AVTStickerImageSwiftProvider_imageForAvatarRecord_poseName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = [v6 image];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
}

- (BOOL)hasFetchedDefaultMemoji
{
  return self->_hasFetchedDefaultMemoji;
}

- (void)setHasFetchedDefaultMemoji:(BOOL)a3
{
  self->_hasFetchedDefaultMemoji = a3;
}

- (AVTAvatarRecord)defaultMemoji
{
  return self->_defaultMemoji;
}

- (void)setDefaultMemoji:(id)a3
{
}

- (AVTClippableImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTResourceCache)cache
{
  return self->_cache;
}

- (AVTStickerGenerator)stickerGenerator
{
  return self->_stickerGenerator;
}

- (OS_dispatch_queue)recentsWorkQueue
{
  return self->_recentsWorkQueue;
}

- (void)setRecentsWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)renderingQueue
{
  return self->_renderingQueue;
}

- (void)setRenderingQueue:(id)a3
{
}

- (OS_dispatch_queue)encodingQueue
{
  return self->_encodingQueue;
}

- (void)setEncodingQueue:(id)a3
{
}

- (AVTStickerConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void)setConfigurationProvider:(id)a3
{
}

- (AVTSerialTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void)setTaskScheduler:(id)a3
{
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
}

- (AVTStickerRecentsLayout)stickerRecentsLayout
{
  return self->_stickerRecentsLayout;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_stickerRecentsLayout, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_recentsWorkQueue, 0);
  objc_storeStrong((id *)&self->_stickerGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_defaultMemoji, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
}

@end