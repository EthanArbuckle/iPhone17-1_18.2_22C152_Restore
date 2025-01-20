@interface AVTUIEnvironment
+ (id)createEditorCoreModelForPlatform:(unint64_t)a3 withLogger:(id)a4;
+ (id)createFunCamEnvironment;
+ (id)createQueueWithQoSClass:(unsigned int)a3 label:(const char *)a4;
+ (id)createUsageTrackingSessionWithCoreModel:(id)a3 serialQueueProvider:(id)a4 logger:(id)a5;
+ (id)defaultEnvironment;
- (AVTAvatarConfigurationImageRenderer)renderer;
- (AVTAvatarRemoteImageRenderer)remoteRenderer;
- (AVTCoreEnvironment)coreEnvironment;
- (AVTCoreModel)editorCoreModel;
- (AVTDeviceResourceManager)deviceResourceManager;
- (AVTImageCache)inMemoryImageCache;
- (AVTMemoji)editorThumbnailAvatar;
- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3;
- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3 platform:(unint64_t)a4;
- (AVTUILogger)logger;
- (AVTUsageTrackingSession)usageTrackingSession;
- (BOOL)deviceIsMac;
- (BOOL)deviceIsPad;
- (BOOL)deviceIsVision;
- (CGSize)mainScreenSize;
- (NSNotificationCenter)notificationCenter;
- (NSURL)imageCacheStoreLocation;
- (NSURL)imageStoreLocation;
- (NSURL)stickerImageStoreLocation;
- (NSURL)storeLocation;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)backgroundEncodingQueue;
- (OS_dispatch_queue)backgroundQueue;
- (OS_dispatch_queue)backgroundRenderingQueue;
- (double)actionAnimationsMultiplier;
- (double)mainScreenScale;
- (id)lockProvider;
- (id)serialQueueProvider;
- (int64_t)userInterfaceLayoutDirection;
- (unint64_t)platform;
- (void)flushResourcesForEnteringBackground;
- (void)setActionAnimationsMultiplier:(double)a3;
@end

@implementation AVTUIEnvironment

+ (id)createQueueWithQoSClass:(unsigned int)a3 label:(const char *)a4
{
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)a3, 0);
  dispatch_queue_t v8 = dispatch_queue_create(a4, v7);

  return v8;
}

- (NSURL)imageCacheStoreLocation
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  v3 = [v2 imageCacheStoreLocation];

  return (NSURL *)v3;
}

+ (id)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1) {
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultEnvironment_sInstance;
  return v2;
}

- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3
{
  return [(AVTUIEnvironment *)self initWithCoreEnvironment:a3 platform:0];
}

- (AVTUIEnvironment)initWithCoreEnvironment:(id)a3 platform:(unint64_t)a4
{
  id v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AVTUIEnvironment;
  dispatch_queue_t v8 = [(AVTUIEnvironment *)&v31 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_coreEnvironment, a3);
    v9->_platform = a4;
    v10 = [MEMORY[0x263F1C5C0] currentDevice];
    v9->_deviceIsPad = [v10 userInterfaceIdiom] == 1;

    v11 = [MEMORY[0x263F1C5C0] currentDevice];
    v9->_deviceIsMac = [v11 userInterfaceIdiom] == 5;

    v12 = [MEMORY[0x263F1C5C0] currentDevice];
    v9->_deviceIsVision = [v12 userInterfaceIdiom] == 6;

    v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 bounds];
    v9->_mainScreenSize.width = v14;
    v9->_mainScreenSize.height = v15;

    v16 = [MEMORY[0x263F1C920] mainScreen];
    [v16 scale];
    v9->_mainScreenScale = v17;

    v18 = [MEMORY[0x263F1C408] sharedApplication];
    v9->_userInterfaceLayoutDirection = [v18 userInterfaceLayoutDirection];

    v19 = [AVTDeviceResourceManager alloc];
    v20 = [v7 logger];
    v21 = [v7 lockProvider];
    uint64_t v22 = [(AVTDeviceResourceManager *)v19 initWithLogger:v20 lockProvider:v21];
    deviceResourceManager = v9->_deviceResourceManager;
    v9->_deviceResourceManager = (AVTDeviceResourceManager *)v22;

    v9->_actionAnimationsMultiplier = 1.0;
    uint64_t v24 = [(id)objc_opt_class() createQueueWithQoSClass:21 label:"com.apple.AvatarUI.AVTUIEnvironment.backgroundQueue"];
    backgroundQueue = v9->_backgroundQueue;
    v9->_backgroundQueue = (OS_dispatch_queue *)v24;

    uint64_t v26 = [(id)objc_opt_class() createQueueWithQoSClass:21 label:"com.apple.AvatarUI.AVTUIEnvironment.backgroundRenderingQueue"];
    backgroundRenderingQueue = v9->_backgroundRenderingQueue;
    v9->_backgroundRenderingQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = [(id)objc_opt_class() createQueueWithQoSClass:21 label:"com.apple.AvatarUI.AVTUIEnvironment.backgroundEncodingQueue"];
    backgroundEncodingQueue = v9->_backgroundEncodingQueue;
    v9->_backgroundEncodingQueue = (OS_dispatch_queue *)v28;
  }
  return v9;
}

void __38__AVTUIEnvironment_defaultEnvironment__block_invoke()
{
  v0 = [AVTUIEnvironment alloc];
  id v3 = [MEMORY[0x263F29740] defaultEnvironment];
  uint64_t v1 = [(AVTUIEnvironment *)v0 initWithCoreEnvironment:v3];
  v2 = (void *)defaultEnvironment_sInstance;
  defaultEnvironment_sInstance = v1;
}

+ (id)createFunCamEnvironment
{
  v2 = [AVTUIEnvironment alloc];
  id v3 = [MEMORY[0x263F29740] defaultEnvironment];
  v4 = [(AVTUIEnvironment *)v2 initWithCoreEnvironment:v3];

  return v4;
}

- (void)flushResourcesForEnteringBackground
{
  self->_inMemoryImageCache = 0;
  MEMORY[0x270F9A758]();
}

- (AVTCoreModel)editorCoreModel
{
  v2 = self;
  objc_sync_enter(v2);
  editorCoreModel = v2->_editorCoreModel;
  if (!editorCoreModel)
  {
    v4 = objc_opt_class();
    uint64_t v5 = [(AVTUIEnvironment *)v2 platform];
    v6 = [(AVTUIEnvironment *)v2 logger];
    uint64_t v7 = [v4 createEditorCoreModelForPlatform:v5 withLogger:v6];
    dispatch_queue_t v8 = v2->_editorCoreModel;
    v2->_editorCoreModel = (AVTCoreModel *)v7;

    editorCoreModel = v2->_editorCoreModel;
  }
  v9 = editorCoreModel;
  objc_sync_exit(v2);

  return v9;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  v2 = self;
  objc_sync_enter(v2);
  renderer = v2->_renderer;
  if (!renderer)
  {
    v4 = [AVTAvatarConfigurationImageRenderer alloc];
    uint64_t v5 = [(AVTUIEnvironment *)v2 editorThumbnailAvatar];
    uint64_t v6 = [(AVTAvatarConfigurationImageRenderer *)v4 initWithEnvironment:v2 avatar:v5];
    uint64_t v7 = v2->_renderer;
    v2->_renderer = (AVTAvatarConfigurationImageRenderer *)v6;

    renderer = v2->_renderer;
  }
  dispatch_queue_t v8 = renderer;
  objc_sync_exit(v2);

  return v8;
}

- (AVTAvatarRemoteImageRenderer)remoteRenderer
{
  v2 = self;
  objc_sync_enter(v2);
  remoteRenderer = v2->_remoteRenderer;
  if (!remoteRenderer)
  {
    v4 = [[AVTAvatarRemoteImageRenderer alloc] initWithEnvironment:v2];
    uint64_t v5 = v2->_remoteRenderer;
    v2->_remoteRenderer = v4;

    remoteRenderer = v2->_remoteRenderer;
  }
  uint64_t v6 = remoteRenderer;
  objc_sync_exit(v2);

  return v6;
}

- (AVTMemoji)editorThumbnailAvatar
{
  v2 = self;
  objc_sync_enter(v2);
  editorThumbnailAvatar = v2->_editorThumbnailAvatar;
  if (!editorThumbnailAvatar)
  {
    uint64_t v4 = [MEMORY[0x263F29698] memoji];
    uint64_t v5 = v2->_editorThumbnailAvatar;
    v2->_editorThumbnailAvatar = (AVTMemoji *)v4;

    editorThumbnailAvatar = v2->_editorThumbnailAvatar;
  }
  uint64_t v6 = editorThumbnailAvatar;
  objc_sync_exit(v2);

  return v6;
}

- (AVTImageCache)inMemoryImageCache
{
  v2 = self;
  objc_sync_enter(v2);
  inMemoryImageCache = v2->_inMemoryImageCache;
  if (!inMemoryImageCache)
  {
    uint64_t v4 = [AVTInMemoryImageCache alloc];
    uint64_t v5 = [(AVTUIEnvironment *)v2 lockProvider];
    uint64_t v6 = [(AVTUIEnvironment *)v2 logger];
    uint64_t v7 = [(AVTInMemoryImageCache *)v4 initWithLockProvider:v5 logger:v6];
    dispatch_queue_t v8 = v2->_inMemoryImageCache;
    v2->_inMemoryImageCache = (AVTImageCache *)v7;

    inMemoryImageCache = v2->_inMemoryImageCache;
  }
  v9 = inMemoryImageCache;
  objc_sync_exit(v2);

  return v9;
}

- (AVTUsageTrackingSession)usageTrackingSession
{
  id v3 = [(AVTUIEnvironment *)self editorCoreModel];
  uint64_t v4 = [(AVTUIEnvironment *)self serialQueueProvider];
  uint64_t v5 = [(AVTUIEnvironment *)self logger];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  usageTrackingSession = v6->_usageTrackingSession;
  if (!usageTrackingSession)
  {
    uint64_t v8 = [(id)objc_opt_class() createUsageTrackingSessionWithCoreModel:v3 serialQueueProvider:v4 logger:v5];
    v9 = v6->_usageTrackingSession;
    v6->_usageTrackingSession = (AVTUsageTrackingSession *)v8;

    usageTrackingSession = v6->_usageTrackingSession;
  }
  v10 = usageTrackingSession;
  objc_sync_exit(v6);

  return v10;
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)[MEMORY[0x263EFFA40] standardUserDefaults];
}

+ (id)createEditorCoreModelForPlatform:(unint64_t)a3 withLogger:(id)a4
{
  return +[AVTEditingModelBuilder buildCoreModelFromPlistForPlatform:a3 withLogger:a4];
}

+ (id)createUsageTrackingSessionWithCoreModel:(id)a3 serialQueueProvider:(id)a4 logger:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [AVTUsageTrackingSession alloc];
  v11 = +[AVTUsageTrackingSession defaultRecordTransformerForCoreModel:v9];

  v12 = [(AVTUsageTrackingSession *)v10 initWithSerialQueueProvider:v8 recordTransformer:v11 logger:v7];
  return v12;
}

- (AVTUILogger)logger
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 logger];

  return (AVTUILogger *)v3;
}

- (id)serialQueueProvider
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 serialQueueProvider];

  return v3;
}

- (id)lockProvider
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 lockProvider];

  return v3;
}

- (NSURL)storeLocation
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 storeLocation];

  return (NSURL *)v3;
}

- (NSURL)imageStoreLocation
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 imageStoreLocation];

  return (NSURL *)v3;
}

- (NSURL)stickerImageStoreLocation
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 stickerImageStoreLocation];

  return (NSURL *)v3;
}

- (NSNotificationCenter)notificationCenter
{
  v2 = [(AVTUIEnvironment *)self coreEnvironment];
  id v3 = [v2 notificationCenter];

  return (NSNotificationCenter *)v3;
}

- (AVTCoreEnvironment)coreEnvironment
{
  return self->_coreEnvironment;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (double)mainScreenScale
{
  return self->_mainScreenScale;
}

- (CGSize)mainScreenSize
{
  double width = self->_mainScreenSize.width;
  double height = self->_mainScreenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)userInterfaceLayoutDirection
{
  return self->_userInterfaceLayoutDirection;
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)deviceIsMac
{
  return self->_deviceIsMac;
}

- (BOOL)deviceIsVision
{
  return self->_deviceIsVision;
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (OS_dispatch_queue)backgroundRenderingQueue
{
  return self->_backgroundRenderingQueue;
}

- (OS_dispatch_queue)backgroundEncodingQueue
{
  return self->_backgroundEncodingQueue;
}

- (AVTDeviceResourceManager)deviceResourceManager
{
  return self->_deviceResourceManager;
}

- (double)actionAnimationsMultiplier
{
  return self->_actionAnimationsMultiplier;
}

- (void)setActionAnimationsMultiplier:(double)a3
{
  self->_actionAnimationsMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceResourceManager, 0);
  objc_storeStrong((id *)&self->_backgroundEncodingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundRenderingQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_coreEnvironment, 0);
  objc_storeStrong((id *)&self->_usageTrackingSession, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_editorThumbnailAvatar, 0);
  objc_storeStrong((id *)&self->_remoteRenderer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_editorCoreModel, 0);
}

@end