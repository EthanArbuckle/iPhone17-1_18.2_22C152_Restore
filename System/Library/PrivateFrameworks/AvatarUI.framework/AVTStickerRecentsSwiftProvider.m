@interface AVTStickerRecentsSwiftProvider
+ (id)imageStoreWithEnvironment:(id)a3;
+ (id)stickerCacheWithEnvironment:(id)a3;
- (AVTAvatarRecord)defaultMemoji;
- (AVTAvatarStoreInternal)avatarStore;
- (AVTClippableImageStore)imageStore;
- (AVTResourceCache)cache;
- (AVTSerialTaskScheduler)taskScheduler;
- (AVTStickerConfigurationProvider)configurationProvider;
- (AVTStickerGenerator)stickerGenerator;
- (AVTStickerRecentsLayout)stickerRecentsLayout;
- (AVTStickerRecentsMigrator)stickerRecentsMigrator;
- (AVTStickerRecentsSwiftProvider)initWithDelegate:(id)a3;
- (AVTUIEnvironment)environment;
- (AVTUIStickerGeneratorPool)generatorPool;
- (BOOL)hasFetchedDefaultMemoji;
- (NSArray)displayItems;
- (NSObject)avatarStoreChangeObserver;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)recentsWorkQueue;
- (OS_dispatch_queue)renderingQueue;
- (id)fetchRecents:(int64_t)a3 excludingStickersMatchingRules:(id)a4;
- (void)_notifyStoreChanged;
- (void)beginObservingAvatarStoreChanges;
- (void)dealloc;
- (void)endObservingAvatarStoreChanges;
- (void)fetchDefaultMemojiIfNeeded;
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
- (void)setStickerRecentsMigrator:(id)a3;
- (void)setTaskScheduler:(id)a3;
@end

@implementation AVTStickerRecentsSwiftProvider

- (AVTStickerRecentsSwiftProvider)initWithDelegate:(id)a3
{
  v41[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AVTStickerRecentsSwiftProvider;
  v5 = [(AVTStickerRecentsSwiftProvider *)&v39 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_recentsRequestedCount = 0;
    uint64_t v7 = +[AVTUIEnvironment defaultEnvironment];
    environment = v6->_environment;
    v6->_environment = (AVTUIEnvironment *)v7;

    uint64_t v9 = [(id)objc_opt_class() imageStoreWithEnvironment:v6->_environment];
    imageStore = v6->_imageStore;
    v6->_imageStore = (AVTClippableImageStore *)v9;

    v11 = objc_alloc_init(AVTAvatarStore);
    if (([(AVTAvatarStore *)v11 conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v11 format];
    }
    v12 = v11;
    [(AVTAvatarStore *)v12 setStickerBackendDelegate:v6];
    objc_storeStrong((id *)&v6->_avatarStore, v11);
    v13 = [AVTUIStickerGeneratorPool alloc];
    v14 = [(AVTUIEnvironment *)v6->_environment logger];
    uint64_t v15 = [(AVTUIStickerGeneratorPool *)v13 initWithMaxStickerGeneratorCount:1 logger:v14];
    generatorPool = v6->_generatorPool;
    v6->_generatorPool = (AVTUIStickerGeneratorPool *)v15;

    v17 = [(AVTUIEnvironment *)v6->_environment serialQueueProvider];
    uint64_t v18 = ((void (**)(void, const char *))v17)[2](v17, "com.apple.AvatarUI.StickerRecentsWorkQueue");
    recentsWorkQueue = v6->_recentsWorkQueue;
    v6->_recentsWorkQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [(AVTUIEnvironment *)v6->_environment backgroundRenderingQueue];
    renderingQueue = v6->_renderingQueue;
    v6->_renderingQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [(AVTUIEnvironment *)v6->_environment backgroundEncodingQueue];
    encodingQueue = v6->_encodingQueue;
    v6->_encodingQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [(id)objc_opt_class() stickerCacheWithEnvironment:v6->_environment];
    cache = v6->_cache;
    v6->_cache = (AVTResourceCache *)v24;

    if (AVTUIShowPrereleaseStickerPack_once())
    {
      uint64_t v26 = *MEMORY[0x263F29708];
      v41[0] = *MEMORY[0x263F296E8];
      v41[1] = v26;
      v27 = (void *)MEMORY[0x263EFF8C0];
      v28 = v41;
      uint64_t v29 = 2;
    }
    else
    {
      uint64_t v40 = *MEMORY[0x263F296E8];
      v27 = (void *)MEMORY[0x263EFF8C0];
      v28 = &v40;
      uint64_t v29 = 1;
    }
    v30 = [v27 arrayWithObjects:v28 count:v29];
    v31 = [[AVTStickerConfigurationProvider alloc] initWithEnvironment:v6->_environment forStickerPacks:v30 stickerConfigurationNames:0];
    configurationProvider = v6->_configurationProvider;
    v6->_configurationProvider = v31;

    v33 = [[AVTStickerRecentsMigrator alloc] initWithStore:v6->_avatarStore stickerConfigurationProvider:v6->_configurationProvider environment:v6->_environment];
    stickerRecentsMigrator = v6->_stickerRecentsMigrator;
    v6->_stickerRecentsMigrator = v33;

    v35 = [(AVTUIEnvironment *)v6->_environment coreEnvironment];
    uint64_t v36 = +[AVTSerialTaskScheduler fifoSchedulerWithEnvironment:v35];
    taskScheduler = v6->_taskScheduler;
    v6->_taskScheduler = (AVTSerialTaskScheduler *)v36;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsSwiftProvider;
  [(AVTStickerRecentsSwiftProvider *)&v5 dealloc];
}

+ (id)stickerCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (!AVTUIStickersCaching() || AVTUIFlushStickersCache())
  {
    id v4 = [v3 stickerImageStoreLocation];
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
    id v4 = [v3 stickerImageStoreLocation];
    objc_super v5 = [v3 logger];
    +[AVTImageStore clearContentAtLocation:v4 logger:v5];

    AVTUISetFlushStickersCache();
  }
  v6 = +[AVTUIStickerRenderer imageEncoder];
  uint64_t v7 = [AVTClippableImageStore alloc];
  v8 = [v3 coreEnvironment];
  uint64_t v9 = [v3 stickerImageStoreLocation];
  v10 = [(AVTImageStore *)v7 initWithEnvironment:v8 validateImages:1 location:v9 encoder:v6];

  return v10;
}

- (id)fetchRecents:(int64_t)a3 excludingStickersMatchingRules:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v43 = a3;
  self->_recentsRequestedCount = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke;
  block[3] = &unk_263FF03D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  val = self;
  [(AVTStickerRecentsMigrator *)self->_stickerRecentsMigrator performMigrationIfNeeded];
  [(AVTStickerRecentsSwiftProvider *)self fetchDefaultMemojiIfNeeded];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__13;
  v68 = __Block_byref_object_dispose__13;
  id v69 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__13;
  v62 = __Block_byref_object_dispose__13;
  id v63 = 0;
  v46 = [MEMORY[0x263EFF980] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  long long v54 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x263F29768]);
        v12 = [MEMORY[0x263F08C38] UUID];
        v13 = [v12 UUIDString];
        v14 = [v10 avatarRecordIdentifier];
        uint64_t v15 = [v10 stickerConfigurationIdentifier];
        v16 = (void *)[v11 initWithIdentifier:v13 avatarRecordIdentifier:v14 stickerConfigurationIdentifier:v15 frequencySum:&unk_26BF4D400 serializationVersion:&unk_26BF4D418];

        [v46 addObject:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v71 count:16];
    }
    while (v7);
  }

  v17 = [(AVTAvatarRecord *)val->_defaultMemoji identifier];
  avatarStore = val->_avatarStore;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_102;
  v53[3] = &unk_263FF0C78;
  v53[4] = &v64;
  v53[5] = &v58;
  +[AVTStickerRecentsPresetsProvider filteredAndPaddedStickerRecordsWithRecents:MEMORY[0x263EFFA68] excludingRecords:v46 paddingMemojiIdentifier:v17 avatarStore:avatarStore numberOfStickers:v43 resultBlock:v53];

  v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)v65[5], "count"));
  if (v43 >= 1)
  {
    unint64_t v20 = 0;
    while (v20 < [(id)v65[5] count])
    {
      v21 = [(id)v65[5] objectAtIndexedSubscript:v20];
      uint64_t v22 = (void *)v59[5];
      v23 = [v21 avatarRecordIdentifier];
      uint64_t v24 = [v22 objectForKeyedSubscript:v23];

      configurationProvider = val->_configurationProvider;
      uint64_t v26 = [v21 stickerConfigurationIdentifier];
      v27 = [(AVTStickerConfigurationProvider *)configurationProvider stickerConfigurationForAvatarRecord:v24 stickerName:v26];

      if (!v27)
      {
        [(AVTStickerRecentsMigrator *)val->_stickerRecentsMigrator setNeedsMigrationOnNextLaunch];
        uint64_t v40 = [(AVTUIEnvironment *)val->_environment logger];
        v41 = [v21 description];
        [v40 logFetchedRecentStickerWithNoStickerConfiguration:v41];

        id v39 = (id)MEMORY[0x263EFFA68];
        goto LABEL_17;
      }
      v28 = [AVTUIStickerRenderer alloc];
      uint64_t v29 = (void *)MEMORY[0x263EF83A0];
      v30 = [(AVTUIStickerRenderer *)v28 initWithAvatarRecord:v24 cache:val->_cache imageStore:val->_imageStore stickerGeneratorPool:val->_generatorPool environment:val->_environment renderingScheduler:val->_taskScheduler renderingQueue:val->_renderingQueue encodingQueue:val->_encodingQueue callbackQueue:MEMORY[0x263EF83A0]];

      v31 = [(AVTUIStickerRenderer *)v30 scheduledStickerResourceProviderForStickerConfiguration:v27];
      id v32 = objc_alloc(MEMORY[0x263F08C38]);
      v33 = [v21 identifier];
      v34 = (void *)[v32 initWithUUIDString:v33];

      objc_initWeak(&location, val);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_2;
      v47[3] = &unk_263FF1D38;
      objc_copyWeak(&v51, &location);
      id v35 = v34;
      id v48 = v35;
      id v36 = v27;
      id v49 = v36;
      id v37 = v21;
      id v50 = v37;
      v38 = ((void (**)(void, void *, void))v31)[2](v31, v47, 0);
      if (v38) {
        [(AVTSerialTaskScheduler *)val->_taskScheduler scheduleTask:v38];
      }
      [v19 addObject:v35];

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);

      if (v43 == ++v20) {
        break;
      }
    }
  }
  id v39 = v19;
LABEL_17:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  return v39;
}

uint64_t __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginObservingAvatarStoreChanges];
}

void __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __78__AVTStickerRecentsSwiftProvider_fetchRecents_excludingStickersMatchingRules___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) localizedName];
    uint64_t v8 = [v12 image];
    uint64_t v9 = [v12 URL];
    v10 = [*(id *)(a1 + 48) avatarRecordIdentifier];
    id v11 = [*(id *)(a1 + 48) stickerConfigurationIdentifier];
    [v5 avtStickerRecentRenderedWithIdentifier:v6 localizedDescription:v7 image:v8 url:v9 avatarRecordIdentifier:v10 stickerConfigurationIdentifier:v11];
  }
}

- (void)fetchDefaultMemojiIfNeeded
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AF1F000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch default memoji: %@", (uint8_t *)&v2, 0xCu);
}

- (void)beginObservingAvatarStoreChanges
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F29710];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AVTStickerRecentsSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_263FF0C50;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__AVTStickerRecentsSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyStoreChanged];
}

- (void)endObservingAvatarStoreChanges
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;
}

- (void)_notifyStoreChanged
{
  objc_initWeak(&location, self);
  recentsWorkQueue = self->_recentsWorkQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__AVTStickerRecentsSwiftProvider__notifyStoreChanged__block_invoke;
  v4[3] = &unk_263FF09D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(recentsWorkQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__AVTStickerRecentsSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (uint64_t)WeakRetained[2] >= 1)
  {
    uint64_t v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 1);
    [v2 avtStickerRecentStoreDidChange];

    id WeakRetained = v3;
  }
}

- (AVTStickerRecentsMigrator)stickerRecentsMigrator
{
  return self->_stickerRecentsMigrator;
}

- (void)setStickerRecentsMigrator:(id)a3
{
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
  self->_hasFetchedDefaultMemojuint64_t i = a3;
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
  objc_storeStrong((id *)&self->_stickerRecentsMigrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end