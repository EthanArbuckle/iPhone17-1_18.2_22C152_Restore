@interface AVTCoreEnvironment
+ (id)defaultEnvironment;
+ (id)imageCacheStoreLocationWithError:(id *)a3;
+ (id)imageStoreLocation;
+ (id)serialQueueProvider;
+ (id)stickerImageStoreLocation;
+ (id)storeLocation;
+ (void)resetFlushCacheValuesIfNeeded;
- (AVTBlockScheduler)scheduler;
- (AVTCoreEnvironment)init;
- (AVTUILogger)logger;
- (NSNotificationCenter)notificationCenter;
- (NSURL)imageCacheStoreLocation;
- (NSURL)imageStoreLocation;
- (NSURL)stickerImageStoreLocation;
- (NSURL)storeLocation;
- (OS_dispatch_queue)backgroundQueue;
- (id)lockProvider;
- (id)serialQueueProvider;
@end

@implementation AVTCoreEnvironment

+ (void)resetFlushCacheValuesIfNeeded
{
  uint64_t v2 = AVTAvatarKitSnapshotVersionNumber();
  if (AVTUILastCacheVersion() != v2)
  {
    AVTUISetLastCacheVersion(v2);
    AVTUISetFlushStickersCache(1);
    AVTUISetFlushThumbnailCache(1);
  }
}

- (AVTCoreEnvironment)init
{
  v16.receiver = self;
  v16.super_class = (Class)AVTCoreEnvironment;
  uint64_t v2 = [(AVTCoreEnvironment *)&v16 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVTUILogger);
    logger = v2->_logger;
    v2->_logger = v3;

    v5 = objc_alloc_init(AVTBlockScheduler);
    scheduler = v2->_scheduler;
    v2->_scheduler = v5;

    v7 = [(id)objc_opt_class() serialQueueProvider];
    uint64_t v8 = [v7 copy];
    id serialQueueProvider = v2->_serialQueueProvider;
    v2->_id serialQueueProvider = (id)v8;

    v10 = [(id)objc_opt_class() serialQueueProvider];
    uint64_t v11 = [v10 copy];
    id lockProvider = v2->_lockProvider;
    v2->_id lockProvider = (id)v11;

    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v13;

    [(id)objc_opt_class() resetFlushCacheValuesIfNeeded];
  }
  return v2;
}

+ (id)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1) {
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)defaultEnvironment_sInstance;

  return v2;
}

uint64_t __40__AVTCoreEnvironment_defaultEnvironment__block_invoke()
{
  defaultEnvironment_sInstance = objc_alloc_init(AVTCoreEnvironment);

  return MEMORY[0x270F9A758]();
}

+ (id)serialQueueProvider
{
  uint64_t v2 = (void *)[&__block_literal_global_6 copy];

  return v2;
}

dispatch_queue_t __41__AVTCoreEnvironment_serialQueueProvider__block_invoke(uint64_t a1, const char *a2)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create(a2, v3);

  return v4;
}

+ (id)storeLocation
{
  return (id)[NSURL fileURLWithPath:@"/var/mobile/Library/Avatar"];
}

+ (id)imageStoreLocation
{
  uint64_t v2 = [a1 storeLocation];
  v3 = [v2 URLByAppendingPathComponent:@"Images"];

  return v3;
}

+ (id)imageCacheStoreLocationWithError:(id *)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F08850]);
  uint64_t v8 = 0;
  dispatch_queue_t v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v8];
  if (v4)
  {
    v5 = v4;
    v6 = [v4 URLByAppendingPathComponent:@"Animoji"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)stickerImageStoreLocation
{
  uint64_t v2 = [a1 storeLocation];
  id v3 = [v2 URLByAppendingPathComponent:@"Stickers"];

  return v3;
}

- (NSURL)storeLocation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  storeLocation = v2->_storeLocation;
  if (!storeLocation)
  {
    dispatch_queue_t v4 = [(id)objc_opt_class() storeLocation];
    uint64_t v5 = [v4 copy];
    v6 = v2->_storeLocation;
    v2->_storeLocation = (NSURL *)v5;

    storeLocation = v2->_storeLocation;
  }
  v7 = storeLocation;
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)imageStoreLocation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  imageStoreLocation = v2->_imageStoreLocation;
  if (!imageStoreLocation)
  {
    dispatch_queue_t v4 = [(id)objc_opt_class() imageStoreLocation];
    uint64_t v5 = [v4 copy];
    v6 = v2->_imageStoreLocation;
    v2->_imageStoreLocation = (NSURL *)v5;

    imageStoreLocation = v2->_imageStoreLocation;
  }
  v7 = imageStoreLocation;
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)imageCacheStoreLocation
{
  id v3 = [(AVTCoreEnvironment *)self logger];
  dispatch_queue_t v4 = self;
  objc_sync_enter(v4);
  imageCacheStoreLocation = v4->_imageCacheStoreLocation;
  if (!imageCacheStoreLocation)
  {
    id v13 = 0;
    v6 = [(id)objc_opt_class() imageCacheStoreLocationWithError:&v13];
    id v7 = v13;
    uint64_t v8 = [v6 copy];
    v9 = v4->_imageCacheStoreLocation;
    v4->_imageCacheStoreLocation = (NSURL *)v8;

    if (!v4->_imageCacheStoreLocation)
    {
      v10 = [NSString stringWithFormat:@"Can't get image cache location %@", v7];
      [v3 logFileSystemError:v10];
    }
    imageCacheStoreLocation = v4->_imageCacheStoreLocation;
  }
  uint64_t v11 = imageCacheStoreLocation;
  objc_sync_exit(v4);

  return v11;
}

- (NSURL)stickerImageStoreLocation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  stickerImageStoreLocation = v2->_stickerImageStoreLocation;
  if (!stickerImageStoreLocation)
  {
    dispatch_queue_t v4 = [(id)objc_opt_class() stickerImageStoreLocation];
    uint64_t v5 = [v4 copy];
    v6 = v2->_stickerImageStoreLocation;
    v2->_stickerImageStoreLocation = (NSURL *)v5;

    stickerImageStoreLocation = v2->_stickerImageStoreLocation;
  }
  id v7 = stickerImageStoreLocation;
  objc_sync_exit(v2);

  return v7;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)scheduler
{
  return self->_scheduler;
}

- (id)serialQueueProvider
{
  return self->_serialQueueProvider;
}

- (id)lockProvider
{
  return self->_lockProvider;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong(&self->_lockProvider, 0);
  objc_storeStrong(&self->_serialQueueProvider, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_imageCacheStoreLocation, 0);
  objc_storeStrong((id *)&self->_stickerImageStoreLocation, 0);
  objc_storeStrong((id *)&self->_imageStoreLocation, 0);

  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end