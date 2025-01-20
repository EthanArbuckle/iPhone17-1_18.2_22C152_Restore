@interface AVTStickerSheetControllerSwiftProvider
+ (id)stickerCacheWithEnvironment:(id)a3;
- (AVTAvatarStore)avatarStore;
- (AVTResourceCache)cache;
- (AVTStickerConfigurationProvider)configurationProvider;
- (AVTStickerSheetControllerSwiftProvider)init;
- (AVTStickerSheetControllerSwiftProviderDelegate)delegate;
- (AVTStickerTaskScheduler)stickerScheduler;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTUIStickerGeneratorPool)generatorPool;
- (NSMutableDictionary)sheetControllers;
- (NSObject)avatarStoreChangeObserver;
- (OS_dispatch_queue)encodingQueue;
- (OS_dispatch_queue)renderingQueue;
- (_AVTAvatarRecordImageProvider)imageProvider;
- (id)stickerSheetController:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6;
- (id)stickerSheetControllerForAvatarRecord:(id)a3;
- (id)stickerSheetViewForAvatarRecord:(id)a3;
- (void)_notifyStoreChanged;
- (void)beginObservingAvatarStoreChanges;
- (void)dealloc;
- (void)endObservingAvatarStoreChanges;
- (void)setAvatarStoreChangeObserver:(id)a3;
- (void)setConfigurationProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncodingQueue:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setRenderingQueue:(id)a3;
- (void)setSheetControllers:(id)a3;
- (void)setStickerScheduler:(id)a3;
- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4;
- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4;
@end

@implementation AVTStickerSheetControllerSwiftProvider

- (AVTStickerSheetControllerSwiftProvider)init
{
  v37[2] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerSheetControllerSwiftProvider;
  v2 = [(AVTStickerSheetControllerSwiftProvider *)&v35 init];
  if (v2)
  {
    uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    uint64_t v5 = [(AVTUIEnvironment *)v2->_environment logger];
    logger = v2->_logger;
    v2->_logger = (AVTUILogger *)v5;

    v7 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v2->_avatarStore;
    v2->_avatarStore = v7;

    v9 = [[AVTUIStickerGeneratorPool alloc] initWithMaxStickerGeneratorCount:2];
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = v9;

    uint64_t v11 = [(AVTUIEnvironment *)v2->_environment backgroundRenderingQueue];
    renderingQueue = v2->_renderingQueue;
    v2->_renderingQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [(AVTUIEnvironment *)v2->_environment backgroundEncodingQueue];
    encodingQueue = v2->_encodingQueue;
    v2->_encodingQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [(id)objc_opt_class() stickerCacheWithEnvironment:v2->_environment];
    cache = v2->_cache;
    v2->_cache = (AVTResourceCache *)v15;

    if (AVTUIShowPrereleaseStickerPack_once())
    {
      uint64_t v17 = *MEMORY[0x263F29708];
      v37[0] = *MEMORY[0x263F296E8];
      v37[1] = v17;
      v18 = (void *)MEMORY[0x263EFF8C0];
      v19 = v37;
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v36 = *MEMORY[0x263F296E8];
      v18 = (void *)MEMORY[0x263EFF8C0];
      v19 = &v36;
      uint64_t v20 = 1;
    }
    v21 = [v18 arrayWithObjects:v19 count:v20];
    v22 = [[AVTStickerConfigurationProvider alloc] initWithEnvironment:v2->_environment forStickerPacks:v21 stickerConfigurationNames:0];
    configurationProvider = v2->_configurationProvider;
    v2->_configurationProvider = v22;

    v24 = [AVTAvatarRecordDataSource alloc];
    v25 = v2->_avatarStore;
    v26 = [MEMORY[0x263F29718] requestForAllAvatars];
    v27 = [(AVTAvatarRecordDataSource *)v24 initWithRecordStore:v25 fetchRequest:v26 environment:v2->_environment];

    uint64_t v28 = +[AVTStickerTaskScheduler schedulerWithRecordDataSource:v27];
    stickerScheduler = v2->_stickerScheduler;
    v2->_stickerScheduler = (AVTStickerTaskScheduler *)v28;

    v30 = [[_AVTAvatarRecordImageProvider alloc] initWithEnvironment:v2->_environment taskScheduler:v2->_stickerScheduler];
    imageProvider = v2->_imageProvider;
    v2->_imageProvider = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sheetControllers = v2->_sheetControllers;
    v2->_sheetControllers = v32;

    [(AVTStickerSheetControllerSwiftProvider *)v2 beginObservingAvatarStoreChanges];
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
  v5.super_class = (Class)AVTStickerSheetControllerSwiftProvider;
  [(AVTStickerSheetControllerSwiftProvider *)&v5 dealloc];
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

- (id)stickerSheetControllerForAvatarRecord:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AVTStickerSheetControllerSwiftProvider *)self sheetControllers];
  v6 = [v4 identifier];
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = [(AVTStickerConfigurationProvider *)self->_configurationProvider stickerConfigurationsForAvatarRecord:v4];
    v10 = +[AVTStickerSheetModel sheetModelForAvatarRecord:v4 withConfigurations:v9 cache:self->_cache taskScheduler:self->_stickerScheduler renderingQueue:self->_renderingQueue encodingQueue:self->_encodingQueue stickerGeneratorPool:self->_generatorPool imageProvider:self->_imageProvider environment:self->_environment];
    uint64_t v11 = [[AVTStickerSheetController alloc] initWithStickerSheetModel:v10 taskScheduler:self->_stickerScheduler allowsPeel:1];
    v12 = [(AVTStickerSheetControllerSwiftProvider *)self sheetControllers];
    uint64_t v13 = [v4 identifier];
    [v12 setObject:v11 forKey:v13];

    v8 = v11;
  }

  return v8;
}

- (id)stickerSheetViewForAvatarRecord:(id)a3
{
  id v4 = [(AVTStickerSheetControllerSwiftProvider *)self stickerSheetControllerForAvatarRecord:a3];
  [v4 setDelegate:self];
  [v4 sheetWillAppear];
  objc_super v5 = [v4 view];

  return v5;
}

- (void)stickerSheetController:(id)a3 didFinishRenderingStickersForRecord:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTStickerSheetControllerSwiftProvider *)self generatorPool];
  [v6 flushGeneratorForRecord:v5];
}

- (void)stickerSheetController:(id)a3 didScrollToContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = [(AVTStickerSheetControllerSwiftProvider *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(AVTStickerSheetControllerSwiftProvider *)self delegate];
    objc_msgSend(v9, "stickerSheetControllerDidScrollToContentOffset:", x, y);
  }
}

- (id)stickerSheetController:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [(AVTStickerSheetControllerSwiftProvider *)self delegate];
  uint64_t v13 = [v12 stickerSheetControllerProvider:self requestsStickerForFileURL:v11 localizedDescription:v10 forItemWithIdentifier:v9];

  return v13;
}

- (void)beginObservingAvatarStoreChanges
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F29710];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__AVTStickerSheetControllerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_263FF0C50;
  objc_copyWeak(&v8, &location);
  id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __74__AVTStickerSheetControllerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyStoreChanged];
}

- (void)endObservingAvatarStoreChanges
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;
}

- (void)_notifyStoreChanged
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke;
  v2[3] = &unk_263FF09D8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[12] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];
  id v1 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = WeakRetained[12];
  WeakRetained[12] = v1;

  [WeakRetained[9] reloadData];
  id v3 = [WeakRetained delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [WeakRetained delegate];
    [v5 stickerSheetControllerDidUpdateContent];
  }
}

uint64_t __61__AVTStickerSheetControllerSwiftProvider__notifyStoreChanged__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 sheetDidDisappear];
}

- (AVTStickerSheetControllerSwiftProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTStickerSheetControllerSwiftProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTResourceCache)cache
{
  return self->_cache;
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

- (AVTStickerTaskScheduler)stickerScheduler
{
  return self->_stickerScheduler;
}

- (void)setStickerScheduler:(id)a3
{
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
}

- (_AVTAvatarRecordImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (NSMutableDictionary)sheetControllers
{
  return self->_sheetControllers;
}

- (void)setSheetControllers:(id)a3
{
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_sheetControllers, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_stickerScheduler, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_encodingQueue, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end