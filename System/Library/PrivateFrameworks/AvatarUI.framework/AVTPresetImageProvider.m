@interface AVTPresetImageProvider
+ (id)configurationToRenderForPreset:(id)a3 overrides:(id)a4 baseConfiguration:(id)a5;
+ (id)presetImageCacheWithEnvironment:(id)a3;
- (AVTAvatarConfigurationImageRenderer)renderer;
- (AVTDeviceResourceConsumerDelegate)consumerDelegate;
- (AVTImageCache)cache;
- (AVTPresetImageProvider)initWithCache:(id)a3 environment:(id)a4;
- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 environment:(id)a5;
- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 renderingQueueProvider:(id)a5 callbackQueue:(id)a6 renderer:(id)a7 defaultScope:(id)a8 environment:(id)a9;
- (AVTPresetImageProvider)initWithRenderingScheduler:(id)a3 environment:(id)a4;
- (AVTRenderingScope)colorScope;
- (AVTRenderingScope)defaultScope;
- (AVTTaskScheduler)renderingScheduler;
- (AVTUILogger)logger;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)colorQueue;
- (OS_dispatch_queue)presetQueue;
- (id)providerForImageForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6;
- (id)providerForThumbnailForModelColor:(id)a3;
- (id)providerForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 poseOverride:(id)a5 avatarConfiguration:(id)a6 framingMode:(id)a7;
- (id)renderThumbnailForModelColor:(id)a3;
- (void)setConsumerDelegate:(id)a3;
@end

@implementation AVTPresetImageProvider

+ (id)presetImageCacheWithEnvironment:(id)a3
{
  id v3 = a3;
  if (AVTUIThumbnailCaching_once())
  {
    if (AVTUIFlushThumbnailCache())
    {
      v4 = [v3 imageCacheStoreLocation];
      v5 = [v3 logger];
      +[AVTImageStore clearContentAtLocation:v4 logger:v5];

      AVTUISetFlushThumbnailCache();
    }
    v6 = [v3 inMemoryImageCache];
    v7 = [AVTImageStore alloc];
    v8 = [v3 coreEnvironment];
    v9 = [v3 imageCacheStoreLocation];
    v10 = [(AVTImageStore *)v7 initWithEnvironment:v8 validateImages:0 location:v9];

    v11 = [[AVTTwoLevelsImageCache alloc] initWithFirstLevelCache:v6 secondLevelCache:v10 environment:v3];
  }
  else
  {
    v11 = objc_alloc_init(AVTPassThroughResourceCache);
  }

  return v11;
}

- (AVTPresetImageProvider)initWithRenderingScheduler:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() presetImageCacheWithEnvironment:v6];
  v9 = [(AVTPresetImageProvider *)self initWithCache:v8 renderingScheduler:v7 environment:v6];

  return v9;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(AVTImmediateTaskScheduler);
  v9 = [(AVTPresetImageProvider *)self initWithCache:v7 renderingScheduler:v8 environment:v6];

  return v9;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 renderer];
  v12 = [AVTRenderingScope alloc];
  [v8 mainScreenScale];
  double v14 = v13;
  unint64_t v15 = +[AVTRenderingScope scopeOptionsForEnvironment:v8];
  v16 = [MEMORY[0x263F29670] friendlyPose];
  v17 = [(AVTRenderingScope *)v12 initWithRenderingType:100 scale:v15 options:0 framingMode:v16 pose:v14];

  v18 = [v8 serialQueueProvider];
  v19 = [(AVTPresetImageProvider *)self initWithCache:v10 renderingScheduler:v9 renderingQueueProvider:v18 callbackQueue:MEMORY[0x263EF83A0] renderer:v11 defaultScope:v17 environment:v8];

  return v19;
}

- (AVTPresetImageProvider)initWithCache:(id)a3 renderingScheduler:(id)a4 renderingQueueProvider:(id)a5 callbackQueue:(id)a6 renderer:(id)a7 defaultScope:(id)a8 environment:(id)a9
{
  id v34 = a3;
  id v33 = a4;
  v16 = (void (**)(id, const char *))a5;
  id v32 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)AVTPresetImageProvider;
  v20 = [(AVTPresetImageProvider *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_cache, a3);
    objc_storeStrong((id *)&v21->_renderer, a7);
    uint64_t v22 = v16[2](v16, "com.apple.AvatarUI.AVTPresetImageProvider.presetQueue");
    presetQueue = v21->_presetQueue;
    v21->_presetQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = v16[2](v16, "com.apple.AvatarUI.AVTPresetImageProvider.colorQueue");
    colorQueue = v21->_colorQueue;
    v21->_colorQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v21->_renderingScheduler, a4);
    objc_storeStrong((id *)&v21->_callbackQueue, a6);
    uint64_t v26 = [v19 logger];
    logger = v21->_logger;
    v21->_logger = (AVTUILogger *)v26;

    v28 = [AVTRenderingScope alloc];
    [v19 mainScreenScale];
    uint64_t v29 = -[AVTRenderingScope initWithRenderingType:scale:](v28, "initWithRenderingType:scale:", 200);
    colorScope = v21->_colorScope;
    v21->_colorScope = (AVTRenderingScope *)v29;

    objc_storeStrong((id *)&v21->_defaultScope, a8);
  }

  return v21;
}

- (id)providerForThumbnailForModelColor:(id)a3
{
  id v4 = a3;
  v5 = [(AVTPresetImageProvider *)self colorScope];
  id v6 = [(AVTPresetImageProvider *)self colorQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke;
  v14[3] = &unk_263FF00C8;
  v14[4] = self;
  id v15 = v4;
  id v7 = v4;
  id v8 = [(AVTPresetImageProvider *)self providerForImageForItem:v7 scope:v5 queue:v6 renderingHandler:v14];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke_2;
  v12[3] = &unk_263FF00F0;
  id v13 = v8;
  id v9 = v8;
  id v10 = (void *)[v12 copy];

  return v10;
}

uint64_t __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderThumbnailForModelColor:*(void *)(a1 + 40)];
}

id __60__AVTPresetImageProvider_providerForThumbnailForModelColor___block_invoke_2(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)renderThumbnailForModelColor:(id)a3
{
  id v4 = a3;
  v5 = [(AVTPresetImageProvider *)self logger];
  id v6 = [v4 description];
  [v5 logRenderingModelColor:v6];

  id v7 = [v4 thumbnail];

  return v7;
}

- (id)providerForImageForItem:(id)a3 scope:(id)a4 queue:(id)a5 renderingHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__AVTPresetImageProvider_providerForImageForItem_scope_queue_renderingHandler___block_invoke;
  v20[3] = &unk_263FF0118;
  v20[4] = self;
  id v21 = v10;
  id v23 = v12;
  id v24 = v13;
  id v22 = v11;
  id v14 = v12;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = (void *)[v20 copy];

  return v18;
}

id __79__AVTPresetImageProvider_providerForImageForItem_scope_queue_renderingHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) cache];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  if (a3)
  {
    id v10 = +[AVTResourceCacheSupport resourceFromCache:v6 forItem:v7 scope:v8 preflightCacheMissHandler:0 cacheMissHandler:v9 cacheMissQueue:0 taskScheduler:0 callbackQueue:0 resourceHandler:v5];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [*(id *)(a1 + 32) renderingScheduler];
    id v13 = [*(id *)(a1 + 32) callbackQueue];
    id v10 = +[AVTResourceCacheSupport resourceFromCache:v6 forItem:v7 scope:v8 preflightCacheMissHandler:0 cacheMissHandler:v9 cacheMissQueue:v11 taskScheduler:v12 callbackQueue:v13 resourceHandler:v5];
  }
  return v10;
}

- (id)providerForThumbnailForModelPreset:(id)a3 presetOverrides:(id)a4 poseOverride:(id)a5 avatarConfiguration:(id)a6 framingMode:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = [(AVTPresetImageProvider *)self defaultScope];
  id v18 = v17;
  if (v14)
  {
    uint64_t v19 = [v17 copyWithFramingMode:v14];

    id v18 = (void *)v19;
  }
  if (v13)
  {
    uint64_t v20 = [v18 copyApplyingPoseOverride:v13];

    id v18 = (void *)v20;
  }
  id v21 = [(id)objc_opt_class() configurationToRenderForPreset:v12 overrides:v16 baseConfiguration:v15];

  id v22 = [(AVTPresetImageProvider *)self presetQueue];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __122__AVTPresetImageProvider_providerForThumbnailForModelPreset_presetOverrides_poseOverride_avatarConfiguration_framingMode___block_invoke;
  v28[3] = &unk_263FF0140;
  v28[4] = self;
  id v29 = v12;
  id v30 = v21;
  id v31 = v18;
  id v23 = v18;
  id v24 = v21;
  id v25 = v12;
  uint64_t v26 = [(AVTPresetImageProvider *)self providerForImageForItem:v24 scope:v23 queue:v22 renderingHandler:v28];

  return v26;
}

id __122__AVTPresetImageProvider_providerForThumbnailForModelPreset_presetOverrides_poseOverride_avatarConfiguration_framingMode___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  id v3 = [*(id *)(a1 + 40) description];
  [v2 logRenderingModelPreset:v3];

  id v4 = [*(id *)(a1 + 32) consumerDelegate];
  [v4 consumer:*(void *)(a1 + 32) willConsumeRenderingResourceForEstimatedDuration:0.5];

  id v5 = [*(id *)(a1 + 32) renderer];
  id v6 = [v5 imageForAvatarConfiguration:*(void *)(a1 + 48) scope:*(void *)(a1 + 56)];

  return v6;
}

+ (id)configurationToRenderForPreset:(id)a3 overrides:(id)a4 baseConfiguration:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[a5 copy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__AVTPresetImageProvider_configurationToRenderForPreset_overrides_baseConfiguration___block_invoke;
  v12[3] = &unk_263FF0168;
  id v10 = v9;
  id v13 = v10;
  [v7 enumerateObjectsUsingBlock:v12];

  [v10 addPreset:v8];
  return v10;
}

uint64_t __85__AVTPresetImageProvider_configurationToRenderForPreset_overrides_baseConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addPreset:a2];
}

- (AVTDeviceResourceConsumerDelegate)consumerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumerDelegate);
  return (AVTDeviceResourceConsumerDelegate *)WeakRetained;
}

- (void)setConsumerDelegate:(id)a3
{
}

- (AVTImageCache)cache
{
  return self->_cache;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatarConfigurationImageRenderer)renderer
{
  return self->_renderer;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (OS_dispatch_queue)presetQueue
{
  return self->_presetQueue;
}

- (OS_dispatch_queue)colorQueue
{
  return self->_colorQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTRenderingScope)colorScope
{
  return self->_colorScope;
}

- (AVTRenderingScope)defaultScope
{
  return self->_defaultScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultScope, 0);
  objc_storeStrong((id *)&self->_colorScope, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_colorQueue, 0);
  objc_storeStrong((id *)&self->_presetQueue, 0);
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_consumerDelegate);
}

@end