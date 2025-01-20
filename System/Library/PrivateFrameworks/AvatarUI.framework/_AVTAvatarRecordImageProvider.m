@interface _AVTAvatarRecordImageProvider
+ (void)makePersistentImageCache:(id *)a3 volatileImageCache:(id *)a4 withEnvironment:(id)a5;
- (AVTAvatarConfigurationImageRenderer)configurationRenderer;
- (AVTAvatarImageRenderer)avatarRenderer;
- (AVTImageCache)peristentCache;
- (AVTImageCache)volatileCache;
- (AVTTaskScheduler)renderingScheduler;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (BOOL)allowPreFlight;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3;
- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3 taskScheduler:(id)a4;
- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 allowPreFlight:(BOOL)a5 taskScheduler:(id)a6 environment:(id)a7;
- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6 configurationRenderer:(id)a7 avatarRenderer:(id)a8 taskScheduler:(id)a9 allowPreFlight:(BOOL)a10 environment:(id)a11;
- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6;
- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6 usingService:(BOOL)a7;
- (id)_providerForRecord:(id)a3 scope:(id)a4;
- (id)providerForRecord:(id)a3 scope:(id)a4;
- (id)providerForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5;
@end

@implementation _AVTAvatarRecordImageProvider

+ (void)makePersistentImageCache:(id *)a3 volatileImageCache:(id *)a4 withEnvironment:(id)a5
{
  id v23 = a5;
  if (AVTUIThumbnailCaching_once())
  {
    if (AVTUIFlushThumbnailCache())
    {
      v7 = [v23 imageStoreLocation];
      v8 = [v23 logger];
      +[AVTImageStore clearContentAtLocation:v7 logger:v8];

      v9 = [v23 imageCacheStoreLocation];
      v10 = [v23 logger];
      +[AVTImageStore clearContentAtLocation:v9 logger:v10];

      AVTUISetFlushThumbnailCache();
    }
    v11 = [v23 inMemoryImageCache];
    v12 = [AVTImageStore alloc];
    v13 = [v23 coreEnvironment];
    v14 = [v23 imageStoreLocation];
    v15 = [(AVTImageStore *)v12 initWithEnvironment:v13 validateImages:1 location:v14];

    v16 = [[AVTTwoLevelsImageCache alloc] initWithFirstLevelCache:v11 secondLevelCache:v15 environment:v23];
    *a3 = v16;
    v17 = [AVTImageStore alloc];
    v18 = [v23 coreEnvironment];
    v19 = [v23 imageCacheStoreLocation];
    v20 = [(AVTImageStore *)v17 initWithEnvironment:v18 validateImages:1 location:v19];

    v21 = [[AVTTwoLevelsImageCache alloc] initWithFirstLevelCache:v11 secondLevelCache:v20 environment:v23];
    *a4 = v21;
  }
  else
  {
    v22 = objc_alloc_init(AVTPassThroughResourceCache);
    *a3 = v22;
    *a4 = v22;
  }
}

- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6
{
  return [(_AVTAvatarRecordImageProvider *)self _providerForAvatar:a3 forRecord:a4 scope:a5 usingCache:a6 usingService:0];
}

- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  v12 = 0;
  [(id)objc_opt_class() makePersistentImageCache:&v12 volatileImageCache:&v11 withEnvironment:v4];
  v5 = v12;
  id v6 = v11;
  id v7 = v5;
  v8 = objc_alloc_init(AVTImmediateTaskScheduler);
  v9 = [(_AVTAvatarRecordImageProvider *)self initWithPersistentCache:v7 volatileCache:v6 allowPreFlight:1 taskScheduler:v8 environment:v4];

  return v9;
}

- (_AVTAvatarRecordImageProvider)initWithEnvironment:(id)a3 taskScheduler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v12 = 0;
  id v13 = 0;
  [(id)objc_opt_class() makePersistentImageCache:&v13 volatileImageCache:&v12 withEnvironment:v7];
  uint64_t v8 = v12;
  id v9 = v13;
  v10 = [(_AVTAvatarRecordImageProvider *)self initWithPersistentCache:v9 volatileCache:v8 allowPreFlight:1 taskScheduler:v6 environment:v7];

  return v10;
}

- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 allowPreFlight:(BOOL)a5 taskScheduler:(id)a6 environment:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = [[AVTAvatarImageRenderer alloc] initWithEnvironment:v12];
  v17 = [v12 backgroundRenderingQueue];
  LOBYTE(v20) = a5;
  v18 = [(_AVTAvatarRecordImageProvider *)self initWithPersistentCache:v15 volatileCache:v14 renderingQueue:v17 callbackQueue:MEMORY[0x263EF83A0] configurationRenderer:0 avatarRenderer:v16 taskScheduler:v13 allowPreFlight:v20 environment:v12];

  return v18;
}

- (_AVTAvatarRecordImageProvider)initWithPersistentCache:(id)a3 volatileCache:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6 configurationRenderer:(id)a7 avatarRenderer:(id)a8 taskScheduler:(id)a9 allowPreFlight:(BOOL)a10 environment:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v28 = a5;
  id v18 = a5;
  id v29 = a6;
  id v19 = a6;
  id v33 = a7;
  id v27 = a8;
  id v32 = a8;
  id v20 = a9;
  id v21 = a11;
  v34.receiver = self;
  v34.super_class = (Class)_AVTAvatarRecordImageProvider;
  v22 = [(_AVTAvatarRecordImageProvider *)&v34 init];
  id v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_peristentCache, a3);
    objc_storeStrong((id *)&v23->_volatileCache, a4);
    objc_storeStrong((id *)&v23->_configurationRenderer, a7);
    objc_storeStrong((id *)&v23->_avatarRenderer, v27);
    v23->_allowPreFlight = a10;
    objc_storeStrong((id *)&v23->_environment, a11);
    objc_storeStrong((id *)&v23->_workQueue, v28);
    objc_storeStrong((id *)&v23->_callbackQueue, v29);
    objc_storeStrong((id *)&v23->_renderingScheduler, a9);
    uint64_t v24 = [v21 logger];
    logger = v23->_logger;
    v23->_logger = (AVTUILogger *)v24;
  }
  return v23;
}

- (id)providerForRecord:(id)a3 scope:(id)a4
{
  return [(_AVTAvatarRecordImageProvider *)self providerForRecord:a3 scope:a4 usingService:0];
}

- (id)providerForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  return [(_AVTAvatarRecordImageProvider *)self _providerForAvatar:0 forRecord:a3 scope:a4 usingCache:1 usingService:a5];
}

- (id)_providerForRecord:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_AVTAvatarRecordImageProvider *)self configurationRenderer];

  if (!v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't render without a configuration renderer"];
  }
  id v9 = [AVTAvatarRecordCacheableResource alloc];
  v10 = [(_AVTAvatarRecordImageProvider *)self environment];
  id v11 = [(AVTAvatarRecordCacheableResource *)v9 initWithAvatarRecord:v6 includeAvatarData:0 environment:v10];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke;
  v22[3] = &unk_263FF25F0;
  v22[4] = self;
  id v23 = v6;
  id v24 = v7;
  v25 = v11;
  id v12 = v11;
  id v13 = v7;
  id v14 = v6;
  id v15 = (void *)[v22 copy];
  id v20 = (void *)MEMORY[0x210530210](v15, v16, v17, v18, v19);

  return v20;
}

- (id)_providerForAvatar:(id)a3 forRecord:(id)a4 scope:(id)a5 usingCache:(BOOL)a6 usingService:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [AVTAvatarRecordCacheableResource alloc];
  uint64_t v16 = [(_AVTAvatarRecordImageProvider *)self environment];
  uint64_t v17 = [(AVTAvatarRecordCacheableResource *)v15 initWithAvatarRecord:v13 includeAvatarData:0 environment:v16];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke;
  v29[3] = &unk_263FF2668;
  v29[4] = self;
  id v30 = v13;
  BOOL v34 = a7;
  id v31 = v14;
  id v32 = v17;
  id v33 = v12;
  BOOL v35 = a6;
  id v18 = v12;
  uint64_t v19 = v17;
  id v20 = v14;
  id v21 = v13;
  v22 = (void *)[v29 copy];
  id v27 = (void *)MEMORY[0x210530210](v22, v23, v24, v25, v26);

  return v27;
}

- (AVTImageCache)peristentCache
{
  return self->_peristentCache;
}

- (AVTImageCache)volatileCache
{
  return self->_volatileCache;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarConfigurationImageRenderer)configurationRenderer
{
  return self->_configurationRenderer;
}

- (AVTAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (BOOL)allowPreFlight
{
  return self->_allowPreFlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_configurationRenderer, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_volatileCache, 0);
  objc_storeStrong((id *)&self->_peristentCache, 0);
}

@end