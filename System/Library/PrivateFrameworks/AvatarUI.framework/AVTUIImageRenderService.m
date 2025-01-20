@interface AVTUIImageRenderService
+ (id)sharedInstance;
- (AVTAvatarRecord)currentAvatarRecord;
- (AVTClippableImageStore)clippableImageStore;
- (AVTImageStore)imageStore;
- (AVTTaskScheduler)taskScheduler;
- (AVTUIEnvironment)environment;
- (AVTUIImageRenderService)init;
- (AVTUILogger)logger;
- (AVTUIStickerGeneratorPool)generatorPool;
- (AVTUIStickerRenderer)currentStickerRenderer;
- (NSLock)transactionCountLock;
- (OS_dispatch_queue)workQueue;
- (OS_os_transaction)transaction;
- (id)cleanupBlock;
- (int64_t)activeTransactionCount;
- (void)_generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)_lock_beginCleanupTimer;
- (void)_lock_invalidateCleanupTimer;
- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6;
- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)_requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7;
- (void)dealloc;
- (void)exit;
- (void)generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)requestAnimojiStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7;
- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6;
- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7;
- (void)setActiveTransactionCount:(int64_t)a3;
- (void)setCleanupBlock:(id)a3;
- (void)setCurrentAvatarRecord:(id)a3;
- (void)setCurrentStickerRenderer:(id)a3;
- (void)setGeneratorPool:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionCountLock:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionAdded;
- (void)transactionCompleted;
@end

@implementation AVTUIImageRenderService

- (AVTUIImageRenderService)init
{
  v27.receiver = self;
  v27.super_class = (Class)AVTUIImageRenderService;
  v2 = [(AVTUIImageRenderService *)&v27 init];
  if (v2)
  {
    uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
    environment = v2->_environment;
    v2->_environment = (AVTUIEnvironment *)v3;

    v5 = [MEMORY[0x263F29740] defaultEnvironment];
    v6 = [AVTImageStore alloc];
    v7 = [v5 imageStoreLocation];
    uint64_t v8 = [(AVTImageStore *)v6 initWithEnvironment:v5 validateImages:1 location:v7];
    imageStore = v2->_imageStore;
    v2->_imageStore = (AVTImageStore *)v8;

    v10 = [AVTClippableImageStore alloc];
    v11 = [v5 stickerImageStoreLocation];
    v12 = objc_alloc_init(AVTStickerImageEncoder);
    uint64_t v13 = [(AVTImageStore *)v10 initWithEnvironment:v5 validateImages:1 location:v11 encoder:v12];
    clippableImageStore = v2->_clippableImageStore;
    v2->_clippableImageStore = (AVTClippableImageStore *)v13;

    uint64_t v15 = [(AVTUIEnvironment *)v2->_environment logger];
    logger = v2->_logger;
    v2->_logger = (AVTUILogger *)v15;

    v17 = [[AVTUIStickerGeneratorPool alloc] initWithMaxStickerGeneratorCount:1];
    generatorPool = v2->_generatorPool;
    v2->_generatorPool = v17;

    uint64_t v19 = +[AVTSerialTaskScheduler fifoScheduler];
    taskScheduler = v2->_taskScheduler;
    v2->_taskScheduler = (AVTTaskScheduler *)v19;

    v2->_activeTransactionCount = 0;
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    transactionCountLock = v2->_transactionCountLock;
    v2->_transactionCountLock = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.avatarui.MemojiImageRenderService.work", v23);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v24;
  }
  return v2;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVTUIImageRenderService;
  [(AVTUIImageRenderService *)&v4 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_renderService;
  return v2;
}

uint64_t __41__AVTUIImageRenderService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AVTUIImageRenderService);
  uint64_t v1 = sharedInstance_renderService;
  sharedInstance_renderService = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)transactionAdded
{
  uint64_t v3 = [(AVTUIImageRenderService *)self transactionCountLock];
  [v3 lock];

  [(AVTUIImageRenderService *)self setActiveTransactionCount:[(AVTUIImageRenderService *)self activeTransactionCount] + 1];
  int64_t v4 = [(AVTUIImageRenderService *)self activeTransactionCount];
  [(AVTUIImageRenderService *)self _lock_invalidateCleanupTimer];
  v5 = [(AVTUIImageRenderService *)self transactionCountLock];
  [v5 unlock];

  id v6 = [(AVTUIImageRenderService *)self logger];
  [v6 logIncrementingRemoteRendererTransactionCount:v4];
}

- (void)transactionCompleted
{
  uint64_t v3 = [(AVTUIImageRenderService *)self transactionCountLock];
  [v3 lock];

  [(AVTUIImageRenderService *)self setActiveTransactionCount:[(AVTUIImageRenderService *)self activeTransactionCount] - 1];
  int64_t v4 = [(AVTUIImageRenderService *)self activeTransactionCount];
  v5 = [(AVTUIImageRenderService *)self logger];
  [v5 logDecrementingRemoteRendererTransactionCount:v4];

  if (!v4) {
    [(AVTUIImageRenderService *)self _lock_beginCleanupTimer];
  }
  id v6 = [(AVTUIImageRenderService *)self transactionCountLock];
  [v6 unlock];
}

- (void)_lock_beginCleanupTimer
{
  uint64_t v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__AVTUIImageRenderService__lock_beginCleanupTimer__block_invoke;
  v7[3] = &unk_263FF09D8;
  objc_copyWeak(&v8, &location);
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v7);
  objc_storeWeak(&self->_cleanupBlock, v5);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_after(v6, MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__AVTUIImageRenderService__lock_beginCleanupTimer__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v6 = WeakRetained;
    v2 = [WeakRetained logger];
    [v2 logCleanupTimerComplete];

    uint64_t v3 = [v6 transactionCountLock];
    [v3 lock];

    int64_t v4 = (void *)v6[9];
    v6[9] = 0;

    dispatch_block_t v5 = [v6 transactionCountLock];
    [v5 unlock];

    [v6 exit];
    WeakRetained = v6;
  }
}

- (void)_lock_invalidateCleanupTimer
{
  transaction = self->_transaction;
  self->_transaction = 0;

  p_cleanupBlock = &self->_cleanupBlock;
  id WeakRetained = objc_loadWeakRetained(&self->_cleanupBlock);

  if (WeakRetained)
  {
    dispatch_time_t v6 = [(AVTUIImageRenderService *)self logger];
    [v6 logCancellingCleanupBlock];

    id v7 = objc_loadWeakRetained(p_cleanupBlock);
    dispatch_block_cancel(v7);
  }
}

- (void)exit
{
}

- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  [(AVTUIImageRenderService *)self transactionAdded];
  v12 = [[AVTAvatarImageRenderer alloc] initWithEnvironment:self->_environment];
  v11 = [(AVTAvatarImageRenderer *)v12 _imageForAvatar:v10 scope:v9];

  v8[2](v8, v11);
  [(AVTUIImageRenderService *)self transactionCompleted];
}

- (void)_requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  id v17 = a5;
  id v10 = (void (**)(id, void *))a6;
  id v11 = a4;
  id v12 = a3;
  [(AVTUIImageRenderService *)self transactionAdded];
  uint64_t v13 = [AVTAvatarImageRenderer alloc];
  if (v17) {
    v14 = [(AVTAvatarImageRenderer *)v13 initWithSceneNodeModifications:v17];
  }
  else {
    v14 = [(AVTAvatarImageRenderer *)v13 initWithEnvironment:self->_environment];
  }
  uint64_t v15 = v14;
  v16 = [(AVTAvatarImageRenderer *)v14 _imageForAvatar:v12 scope:v11];

  v10[2](v10, v16);
  [(AVTUIImageRenderService *)self transactionCompleted];
}

- (void)_generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  v21 = (void *)MEMORY[0x21052FFD0]([(AVTUIImageRenderService *)self transactionAdded]);
  id v10 = [MEMORY[0x263F29730] avatarForRecord:v22];
  id v11 = [[AVTAvatarImageRenderer alloc] initWithEnvironment:self->_environment];
  id v12 = [(AVTAvatarImageRenderer *)v11 _imageForAvatar:v10 scope:v8];
  if (!v12)
  {
    uint64_t v13 = [(AVTUIImageRenderService *)self logger];
    [v13 logNilImageReturnedFromAVTAvatarRecordImageProvider];
  }
  v14 = [AVTAvatarRecordCacheableResource alloc];
  uint64_t v15 = [(AVTUIImageRenderService *)self environment];
  v16 = [(AVTAvatarRecordCacheableResource *)v14 initWithAvatarRecord:v22 includeAvatarData:0 environment:v15];

  BOOL v17 = [(AVTImageStore *)self->_imageStore saveImage:v12 forItem:v16 scope:v8 error:0];
  v18 = [(AVTUIImageRenderService *)self logger];
  uint64_t v19 = [0 path];
  if (v17)
  {
    [v18 logImageStoreDoneInServiceForPath:v19];

    v20 = [(AVTImageStore *)self->_imageStore resourceURLForItem:v16 scope:v8];
    v9[2](v9, v20);
  }
  else
  {
    [v18 logImageStoreFailedInServiceForPath:v19 error:0];

    v9[2](v9, 0);
  }
  [(AVTUIImageRenderService *)self transactionCompleted];
}

- (void)_requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  BOOL v17 = (void (**)(id, void))a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v19 = (void *)MEMORY[0x263F296C8];
  if (isKindOfClass)
  {
    id v20 = v13;
    v21 = [v20 puppetName];
    id v22 = [v19 stickerConfigurationForAnimojiNamed:v21 inStickerPack:v14 stickerName:v15];

    if (v22) {
      goto LABEL_3;
    }
LABEL_8:
    objc_super v27 = [v13 identifier];
    NSLog(&cfstr_NoStickerConfi.isa, v27, v14, v15);

    v17[2](v17, 0);
    goto LABEL_9;
  }
  id v22 = [MEMORY[0x263F296C8] stickerConfigurationForMemojiInStickerPack:v14 stickerName:v15];
  if (!v22) {
    goto LABEL_8;
  }
LABEL_3:
  id v28 = v16;
  [(AVTUIImageRenderService *)self transactionAdded];
  v23 = self->_currentStickerRenderer;
  if (!v23 || ([v13 isEqual:self->_currentAvatarRecord] & 1) == 0)
  {
    dispatch_queue_t v24 = [[AVTUIStickerRenderer alloc] initWithAvatarRecord:v13 stickerGeneratorPool:self->_generatorPool scheduler:self->_taskScheduler];

    objc_storeStrong((id *)&self->_currentAvatarRecord, a3);
    objc_storeStrong((id *)&self->_currentStickerRenderer, v24);
    v23 = v24;
  }
  v25 = [(AVTUIStickerRenderer *)v23 scheduledStickerResourceProviderForStickerConfiguration:v22 usingService:0];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  int v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __127__AVTUIImageRenderService__requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v29[3] = &unk_263FF2728;
  v33 = v34;
  id v30 = v22;
  v31 = self;
  v32 = v17;
  id v26 = (id)((uint64_t (**)(void, void *, uint64_t))v25)[2](v25, v29, 1);

  _Block_object_dispose(v34, 8);
  id v16 = v28;
LABEL_9:
}

void __127__AVTUIImageRenderService__requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 URL];

  if (v3) {
    [*(id *)(a1 + 32) unload];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  int v5 = *(_DWORD *)(v4 + 24);
  *(_DWORD *)(v4 + 24) = v5 + 1;
  if (!v5)
  {
    if (!v9)
    {
      dispatch_time_t v6 = [*(id *)(a1 + 40) logger];
      [v6 logNilImageReturnedFromAVTUIStickerRenderer];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v7 = [*(id *)(a1 + 40) logger];
    id v8 = [*(id *)(a1 + 32) name];
    [v7 logRenderingStickerEnd:v8];

    [*(id *)(a1 + 40) transactionCompleted];
  }
}

- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__AVTUIImageRenderService_requestImageForAvatar_scope_withReply___block_invoke;
  v15[3] = &unk_263FF2750;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(workQueue, v15);
}

uint64_t __65__AVTUIImageRenderService_requestImageForAvatar_scope_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestImageForAvatar:*(void *)(a1 + 40) scope:*(void *)(a1 + 48) withReply:*(void *)(a1 + 56)];
}

- (void)requestImageForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__AVTUIImageRenderService_requestImageForAvatar_scope_withModifications_withReply___block_invoke;
  block[3] = &unk_263FF2778;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(workQueue, block);
}

uint64_t __83__AVTUIImageRenderService_requestImageForAvatar_scope_withModifications_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestImageForAvatar:*(void *)(a1 + 40) scope:*(void *)(a1 + 48) withModifications:*(void *)(a1 + 56) withReply:*(void *)(a1 + 64)];
}

- (void)generateAndCacheImageForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__AVTUIImageRenderService_generateAndCacheImageForAvatarRecord_scope_withReply___block_invoke;
  v15[3] = &unk_263FF2750;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(workQueue, v15);
}

uint64_t __80__AVTUIImageRenderService_generateAndCacheImageForAvatarRecord_scope_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateAndCacheImageForAvatarRecord:*(void *)(a1 + 40) scope:*(void *)(a1 + 48) withReply:*(void *)(a1 + 56)];
}

- (void)requestStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __126__AVTUIImageRenderService_requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v23[3] = &unk_263FF27A0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workQueue, v23);
}

uint64_t __126__AVTUIImageRenderService_requestStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestStickerImageForAvatarRecord:*(void *)(a1 + 40) withStickerPackName:*(void *)(a1 + 48) stickerConfigurationName:*(void *)(a1 + 56) resource:*(void *)(a1 + 64) withReply:*(void *)(a1 + 72)];
}

- (void)requestAnimojiStickerImageForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __133__AVTUIImageRenderService_requestAnimojiStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v23[3] = &unk_263FF27A0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workQueue, v23);
}

uint64_t __133__AVTUIImageRenderService_requestAnimojiStickerImageForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestAnimojiStickerImageForAvatarRecord:*(void *)(a1 + 40) withStickerPackName:*(void *)(a1 + 48) stickerConfigurationName:*(void *)(a1 + 56) resource:*(void *)(a1 + 64) withReply:*(void *)(a1 + 72)];
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTClippableImageStore)clippableImageStore
{
  return self->_clippableImageStore;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIStickerGeneratorPool)generatorPool
{
  return self->_generatorPool;
}

- (void)setGeneratorPool:(id)a3
{
}

- (AVTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (int64_t)activeTransactionCount
{
  return self->_activeTransactionCount;
}

- (void)setActiveTransactionCount:(int64_t)a3
{
  self->_activeTransactionCount = a3;
}

- (NSLock)transactionCountLock
{
  return self->_transactionCountLock;
}

- (void)setTransactionCountLock:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (id)cleanupBlock
{
  id WeakRetained = objc_loadWeakRetained(&self->_cleanupBlock);
  return WeakRetained;
}

- (void)setCleanupBlock:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (AVTAvatarRecord)currentAvatarRecord
{
  return self->_currentAvatarRecord;
}

- (void)setCurrentAvatarRecord:(id)a3
{
}

- (AVTUIStickerRenderer)currentStickerRenderer
{
  return self->_currentStickerRenderer;
}

- (void)setCurrentStickerRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStickerRenderer, 0);
  objc_storeStrong((id *)&self->_currentAvatarRecord, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak(&self->_cleanupBlock);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transactionCountLock, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_generatorPool, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_clippableImageStore, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end