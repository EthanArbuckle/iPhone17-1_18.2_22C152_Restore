@interface JFXAnimojiEffectRenderer
+ (BOOL)isSupported;
+ (CGSize)animojiBufferSizeWithImageSize:(CGSize)result interfaceOrientation:(int64_t)a4;
+ (void)setupAVTMetalShaderCache;
- (AVTAvatarStore)avatarStore;
- (AVTRenderer)renderer;
- (BOOL)JFX_getRenderer:(id *)a3 forAnimojiEffect:(id)a4 primeFrame:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 backgroundColor:(id)a8;
- (BOOL)JFX_inputBufferIsPortraitAspect:(CGSize)a3;
- (BOOL)allowAntialiasing;
- (BOOL)asynchronouslyLoadNewPuppets;
- (BOOL)constrainHeadPose;
- (BOOL)currentPuppetIsEqualTo:(id)a3;
- (BOOL)setupHeadPoseAndBlendShapesForFrame:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 isInitialSetup:(BOOL)a7;
- (BOOL)setupPoseForPreRecordedBlendShapes:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 withFrame:(id)a7;
- (CGSize)workingSize;
- (JFXAnimojiEffect)currentPuppet;
- (JFXAnimojiEffectRenderer)init;
- (JFXAnimojiEffectRenderer)initWithConstrainedHeadPose:(BOOL)a3;
- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate;
- (NSLock)renderPassLock;
- (NSLock)rendererLock;
- (NSString)description;
- (__CVBuffer)JFX_depthDataToTexture:(id)a3;
- (__CVBuffer)newPixelBufferRenderedFromARFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9;
- (__CVMetalTextureCache)metalDepthTextureCache;
- (__CVMetalTextureCache)metalTextureCache;
- (__CVPixelBufferPool)inputBufferPool;
- (double)JFX_focalLengthForFrame:(id)a3 workingSize:(CGSize)a4 interfaceOrientation:(int64_t)a5;
- (double)systemTimeForAVTRenderer;
- (id)JFX_blendShapesForRenderer:(id)a3;
- (id)createNewRendererForPuppet:(id)a3;
- (id)preRecordedBlendShapesForFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 backgroundColor:(id)a6;
- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6;
- (id)renderWithTime:(id *)a3 metadata:(id)a4;
- (void)asyncLoadNewPuppet:(id)a3 currentPuppet:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 primeFrame:(id)a7 backgroundColor:(id)a8;
- (void)clear;
- (void)clearRenderer_renderLocked;
- (void)createTextureCaches;
- (void)dealloc;
- (void)flush;
- (void)renderAnimoji:(id)a3 withPresentationTime:(id *)a4 frame:(id)a5 depthData:(id)a6 backgroundColor:(id)a7 completionBlock:(id)a8;
- (void)renderFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9 completionBlock:(id)a10;
- (void)setAllowAntialiasing:(BOOL)a3;
- (void)setAsynchronouslyLoadNewPuppets:(BOOL)a3;
- (void)setAvatarStore:(id)a3;
- (void)setCurrentPuppet:(id)a3;
- (void)setInputBufferPool:(__CVPixelBufferPool *)a3;
- (void)setMetalDepthTextureCache:(__CVMetalTextureCache *)a3;
- (void)setMetalTextureCache:(__CVMetalTextureCache *)a3;
- (void)setRenderer:(id)a3;
- (void)setRendererLock:(id)a3;
- (void)setSystemTimeForAVTRenderer:(double)a3;
- (void)setTrackingLossDelegate:(id)a3;
- (void)setWorkingSize:(CGSize)a3;
- (void)setupInputBufferPoolForSize:(CGSize)a3;
- (void)updateCurrentRenderer:(id)a3 withPuppet:(id)a4;
@end

@implementation JFXAnimojiEffectRenderer

+ (void)setupAVTMetalShaderCache
{
}

+ (CGSize)animojiBufferSizeWithImageSize:(CGSize)result interfaceOrientation:(int64_t)a4
{
  BOOL v5 = result.height > result.width || (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
  if (v5) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if (!v5) {
    result.width = result.height;
  }
  double v7 = height;
  result.double height = v7;
  return result;
}

+ (BOOL)isSupported
{
  if (isSupported_onceToken != -1) {
    dispatch_once(&isSupported_onceToken, &__block_literal_global_7);
  }
  return isSupported_isAnimojiCapableDevice;
}

uint64_t __39__JFXAnimojiEffectRenderer_isSupported__block_invoke()
{
  char v0 = [MEMORY[0x263EF8F50] isSupported];
  uint64_t result = [MEMORY[0x263EF8F50] supportsFrameSemantics:1];
  isSupported_isAnimojiCapableDevice = v0 & result;
  return result;
}

- (JFXAnimojiEffectRenderer)init
{
  return [(JFXAnimojiEffectRenderer *)self initWithConstrainedHeadPose:0];
}

- (JFXAnimojiEffectRenderer)initWithConstrainedHeadPose:(BOOL)a3
{
  v29.receiver = self;
  v29.super_class = (Class)JFXAnimojiEffectRenderer;
  v4 = [(JFXAnimojiEffectRenderer *)&v29 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F29790]);
    [v4 setAvatarStore:v5];

    id v6 = objc_alloc_init(MEMORY[0x263F08958]);
    double v7 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v6;

    id v8 = objc_alloc_init(MEMORY[0x263F08958]);
    v9 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v8;

    *((void *)v4 + 12) = 0;
    *(_WORD *)(v4 + 25) = 256;
    v10 = NSString;
    v11 = [MEMORY[0x263F086E0] jfxBundle];
    v12 = [v11 bundleIdentifier];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = [v10 stringWithFormat:@"%@.%@.puppetLoading", v12, v14];

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    v18 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v17;

    v19 = NSString;
    v20 = [MEMORY[0x263F086E0] jfxBundle];
    v21 = [v20 bundleIdentifier];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = [v19 stringWithFormat:@"%@.%@.puppetRendering", v21, v23];

    id v25 = v24;
    dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
    v27 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v26;

    v4[24] = 0;
    v4[27] = a3;
    [v4 createTextureCaches];
  }
  return (JFXAnimojiEffectRenderer *)v4;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_inputBufferPool);
  CFRelease(self->_metalTextureCache);
  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose]
    && [(JFXAnimojiEffectRenderer *)self metalDepthTextureCache])
  {
    CFRelease([(JFXAnimojiEffectRenderer *)self metalDepthTextureCache]);
  }
  v3.receiver = self;
  v3.super_class = (Class)JFXAnimojiEffectRenderer;
  [(JFXAnimojiEffectRenderer *)&v3 dealloc];
}

- (void)clear
{
  objc_super v3 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v3 lock];

  [(JFXAnimojiEffectRenderer *)self setCurrentPuppet:0];
  [(JFXAnimojiEffectRenderer *)self clearRenderer_renderLocked];
  [(JFXAnimojiEffectRenderer *)self setRenderer:0];
  [(JFXAnimojiEffectRenderer *)self setAvatarStore:0];
  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache) {
    CFRelease(metalTextureCache);
  }
  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose]
    && [(JFXAnimojiEffectRenderer *)self metalDepthTextureCache])
  {
    CFRelease([(JFXAnimojiEffectRenderer *)self metalDepthTextureCache]);
  }
  [(JFXAnimojiEffectRenderer *)self createTextureCaches];
  inputBufferPool = self->_inputBufferPool;
  if (inputBufferPool) {
    CVPixelBufferPoolFlush(inputBufferPool, 1uLL);
  }
  id v6 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v6 unlock];
}

- (void)flush
{
  objc_super v3 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v3 lock];

  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache) {
    CVMetalTextureCacheFlush(metalTextureCache, 0);
  }
  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose])
  {
    metalDepthTextureCache = self->_metalDepthTextureCache;
    if (metalDepthTextureCache) {
      CVMetalTextureCacheFlush(metalDepthTextureCache, 0);
    }
  }
  inputBufferPool = self->_inputBufferPool;
  if (inputBufferPool) {
    CVPixelBufferPoolFlush(inputBufferPool, 1uLL);
  }
  id v7 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v7 unlock];
}

- (void)clearRenderer_renderLocked
{
  objc_super v3 = [(JFXAnimojiEffectRenderer *)self renderer];

  if (v3)
  {
    v4 = [(JFXAnimojiEffectRenderer *)self renderer];
    [v4 setEnableDepthMask:0];

    LODWORD(v4) = [(JFXAnimojiEffectRenderer *)self constrainHeadPose];
    id v5 = [(JFXAnimojiEffectRenderer *)self renderer];
    id v7 = v5;
    if (v4)
    {
      id v6 = [v5 faceTracker];
      [v6 discardARFrameData];
    }
    else
    {
      [v5 setCapturedDepth:0];
    }
  }
}

- (NSString)description
{
  [(NSLock *)self->_rendererLock lock];
  objc_super v3 = [(JFXAnimojiEffectRenderer *)self currentPuppet];
  v4 = [v3 effectID];

  [(NSLock *)self->_rendererLock unlock];
  v8.receiver = self;
  v8.super_class = (Class)JFXAnimojiEffectRenderer;
  id v5 = [(JFXAnimojiEffectRenderer *)&v8 description];
  id v6 = [v5 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v6;
}

- (AVTAvatarStore)avatarStore
{
  avatarStore = self->_avatarStore;
  if (!avatarStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F29790]);
    [(JFXAnimojiEffectRenderer *)self setAvatarStore:v4];

    avatarStore = self->_avatarStore;
  }
  return avatarStore;
}

- (void)setupInputBufferPoolForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v16[3] = *MEMORY[0x263EF8340];
  [(JFXAnimojiEffectRenderer *)self workingSize];
  if (width != v7 || height != v6)
  {
    -[JFXAnimojiEffectRenderer setWorkingSize:](self, "setWorkingSize:", width, height);
    if ([(JFXAnimojiEffectRenderer *)self inputBufferPool])
    {
      CVPixelBufferPoolRelease([(JFXAnimojiEffectRenderer *)self inputBufferPool]);
      [(JFXAnimojiEffectRenderer *)self setInputBufferPool:0];
    }
    v9 = objc_opt_new();
    [v9 setObject:&unk_26E801770 forKeyedSubscript:*MEMORY[0x263F04180]];
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F04158]];
    v10 = [NSNumber numberWithDouble:width];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F04240]];

    v11 = [NSNumber numberWithDouble:height];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F04118]];

    v12 = [MEMORY[0x263F61230] sRGBColorSpace];
    v13 = [v12 nclcTriplet];

    v15[0] = *MEMORY[0x263F03ED8];
    v16[0] = [v13 colorPrimary];
    v15[1] = *MEMORY[0x263F03FC0];
    v16[1] = [v13 transferFunction];
    v15[2] = *MEMORY[0x263F04020];
    v16[2] = [v13 ycbcrMatrix];
    v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F03DF8]];

    CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFDictionaryRef)v9, &self->_inputBufferPool);
  }
}

- (id)renderWithTime:(id *)a3 metadata:(id)a4
{
  id v5 = a4;
  double v6 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_JFXARMetadata"];
  id v25 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_DepthData"];
  double v7 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_Effect"];
  objc_super v8 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_DataRepresentation"];
  v24 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_BackgroundColor"];
  v9 = [v6 arFrame];
  v10 = [v7 dataRepresentation];
  int v11 = [v8 isEqualToData:v10];

  v23 = v6;
  if (v11)
  {
    v12 = [v6 animojiPhysicsBlendShapes];
  }
  else
  {
    v12 = 0;
  }
  v13 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation"];
  uint64_t v14 = [v13 integerValue];

  v15 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_UIInterfaceOrientation"];
  uint64_t v16 = [v15 integerValue];

  dispatch_queue_t v17 = [v5 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_RenderSize"];
  [v17 CGSizeValue];
  -[JFXAnimojiEffectRenderer setupInputBufferPoolForSize:](self, "setupInputBufferPoolForSize:");
  v18 = [(JFXAnimojiEffectRenderer *)self renderPassLock];
  [v18 lock];

  kdebug_trace();
  v19 = [(JFXAnimojiEffectRenderer *)self newPixelBufferRenderedFromARFrame:v9 withEffect:v7 depthData:v25 captureOrientation:v14 interfaceOrientation:v16 preRecordedBlendShapes:v12 backgroundColor:v24];
  kdebug_trace();
  v20 = [(JFXAnimojiEffectRenderer *)self renderPassLock];
  [v20 unlock];

  if (v19)
  {
    v21 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v19];
    CVPixelBufferRelease(v19);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)renderWithInputs:(id)a3 time:(id *)a4 userContext:(id)a5 compositeContext:(id)a6
{
  id v9 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  v10 = [(JFXAnimojiEffectRenderer *)self renderWithTime:&v15 metadata:a5];
  int v11 = v10;
  if (v10)
  {
    id v12 = v10;
LABEL_3:
    v13 = v12;
    goto LABEL_4;
  }
  if (v9)
  {
    v13 = [v9 objectForKeyedSubscript:&unk_26E801788];

    if (v13)
    {
      id v12 = [v9 objectForKeyedSubscript:&unk_26E801788];
      goto LABEL_3;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_4:

  return v13;
}

- (id)createNewRendererForPuppet:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 dataRepresentation];
  if (v5 && [MEMORY[0x263F29658] canLoadDataRepresentation:v5])
  {
    id v31 = 0;
    double v6 = [MEMORY[0x263F29658] avatarWithDataRepresentation:v5 error:&v31];
    id v7 = v31;
  }
  else
  {
    objc_super v8 = (void *)MEMORY[0x263F29778];
    id v9 = [v4 effectID];
    v10 = [v8 requestForAvatarWithIdentifier:v9];

    int v11 = [(JFXAnimojiEffectRenderer *)self avatarStore];
    id v30 = 0;
    id v12 = [v11 avatarsForFetchRequest:v10 error:&v30];
    id v29 = v30;

    v13 = [v12 firstObject];
    uint64_t v14 = NSString;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = NSStringFromJFXEffectType(7);
    uint64_t v16 = [v4 effectID];
    dispatch_queue_t v17 = [v14 stringWithFormat:@"Unable to render effect - type: %@, name: %@, reason: An Animoji with the specified name does not exist", v15, v16];

    if (v13)
    {
      double v6 = [MEMORY[0x263F29780] avatarForRecord:v13];
    }
    else
    {
      v18 = JFXLog_animoji();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[JFXAnimojiEffectRenderer createNewRendererForPuppet:]((uint64_t)v17, v18);
      }

      double v6 = 0;
    }

    id v7 = v29;
  }
  v19 = (void *)MEMORY[0x263F296B8];
  v32[0] = *MEMORY[0x263F29610];
  BOOL v20 = [(JFXAnimojiEffectRenderer *)self constrainHeadPose];
  uint64_t v21 = MEMORY[0x263EFFA88];
  uint64_t v22 = MEMORY[0x263EFFA80];
  if (v20) {
    uint64_t v23 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v23 = MEMORY[0x263EFFA88];
  }
  v33[0] = v23;
  v32[1] = *MEMORY[0x263F29608];
  if ([(JFXAnimojiEffectRenderer *)self constrainHeadPose]) {
    uint64_t v24 = v21;
  }
  else {
    uint64_t v24 = v22;
  }
  v33[1] = v24;
  id v25 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  dispatch_queue_t v26 = [v19 rendererWithDevice:0 options:v25];

  [v26 setAvatar:v6];
  v27 = objc_opt_new();
  [v26 setFaceTracker:v27];

  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose]) {
    [v26 setEnableDepthMask:1 withFlippedDepth:1];
  }

  return v26;
}

- (void)asyncLoadNewPuppet:(id)a3 currentPuppet:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 primeFrame:(id)a7 backgroundColor:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  puppetLoadingQ = self->_puppetLoadingQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke;
  block[3] = &unk_264C0A860;
  block[4] = self;
  id v24 = v14;
  int64_t v28 = a5;
  int64_t v29 = a6;
  id v25 = v16;
  id v26 = v15;
  id v27 = v17;
  id v19 = v17;
  id v20 = v15;
  id v21 = v16;
  id v22 = v14;
  dispatch_async(puppetLoadingQ, block);
}

void __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) currentPuppetIsEqualTo:*(void *)(a1 + 40)])
  {
    v2 = [*(id *)(a1 + 32) createNewRendererForPuppet:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) currentPuppetIsEqualTo:*(void *)(a1 + 40)])
    {
      if (([*(id *)(a1 + 32) setupHeadPoseAndBlendShapesForFrame:*(void *)(a1 + 48) forRenderer:v2 captureOrientation:*(void *)(a1 + 72) interfaceOrientation:*(void *)(a1 + 80) isInitialSetup:1] & 1) == 0)
      {
        double v6 = JFXLog_animoji();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11.value) = 0;
          _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "setupPuppetRenderer was not successful", (uint8_t *)&v11, 2u);
        }

        if (([*(id *)(a1 + 32) currentPuppetIsEqualTo:*(void *)(a1 + 40)] & 1) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      if ([*(id *)(a1 + 32) currentPuppetIsEqualTo:*(void *)(a1 + 40)])
      {
        if (!*(void *)(a1 + 56))
        {
          memset(&v11, 0, sizeof(v11));
          [*(id *)(a1 + 48) timestamp];
          CMTimeMakeWithSeconds(&v11, v3, 1000000000);
          id v4 = *(void **)(a1 + 32);
          uint64_t v5 = *(void *)(a1 + 64);
          v8[0] = MEMORY[0x263EF8330];
          v8[1] = 3221225472;
          v8[2] = __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke_57;
          v8[3] = &unk_264C0A838;
          v8[4] = v4;
          id v9 = v2;
          id v10 = *(id *)(a1 + 40);
          CMTime v7 = v11;
          [v4 renderAnimoji:v9 withPresentationTime:&v7 frame:0 depthData:0 backgroundColor:v5 completionBlock:v8];

          goto LABEL_11;
        }
LABEL_10:
        [*(id *)(a1 + 32) updateCurrentRenderer:v2 withPuppet:*(void *)(a1 + 40)];
      }
    }
LABEL_11:
  }
}

uint64_t __128__JFXAnimojiEffectRenderer_asyncLoadNewPuppet_currentPuppet_captureOrientation_interfaceOrientation_primeFrame_backgroundColor___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCurrentRenderer:*(void *)(a1 + 40) withPuppet:*(void *)(a1 + 48)];
}

- (void)updateCurrentRenderer:(id)a3 withPuppet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  puppetRenderingQ = self->_puppetRenderingQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__JFXAnimojiEffectRenderer_updateCurrentRenderer_withPuppet___block_invoke;
  block[3] = &unk_264C0A888;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(puppetRenderingQ, block);
}

void __61__JFXAnimojiEffectRenderer_updateCurrentRenderer_withPuppet___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rendererLock];
  [v2 lock];

  Float64 v3 = [*(id *)(a1 + 32) currentPuppet];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearRenderer_renderLocked");
    [*(id *)(a1 + 32) setRenderer:*(void *)(a1 + 48)];
  }
  id v5 = [*(id *)(a1 + 32) rendererLock];
  [v5 unlock];
}

- (BOOL)currentPuppetIsEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v5 lock];

  id v6 = [(JFXAnimojiEffectRenderer *)self currentPuppet];
  char v7 = [v6 isEqual:v4];

  objc_super v8 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v8 unlock];

  return v7;
}

- (BOOL)setupPoseForPreRecordedBlendShapes:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 withFrame:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.0];
  if ([(JFXAnimojiEffectRenderer *)self constrainHeadPose])
  {
    id v15 = [v13 scene];
    id v16 = [v15 rootNode];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke;
    v35[3] = &unk_264C0A8B0;
    id v36 = v12;
    id v37 = v13;
    [v16 enumerateHierarchyUsingBlock:v35];

    BOOL v17 = 1;
    v18 = v36;
  }
  else
  {
    if ((unint64_t)(a5 - 1) > 3) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = qword_234D610A8[a5 - 1];
    }
    id v20 = [v13 faceTracker];
    [v20 setInterfaceOrientation:a6];

    v18 = [MEMORY[0x263F29688] trackingInfoWithARFrame:v14 inputOrientation:v19 outputOrientation:a6];
    BOOL v17 = v18 != 0;
    if (v18)
    {
      id v21 = [v13 avatar];
      id v22 = [v13 pointOfView];
      [v21 applyHeadPoseWithTrackingInfo:v18 gazeCorrection:0 pointOfView:v22];

      uint64_t v23 = [v13 scene];
      id v24 = [v23 rootNode];
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      id v31 = __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke_2;
      v32 = &unk_264C0A8B0;
      id v33 = v12;
      id v25 = v13;
      id v34 = v25;
      [v24 enumerateHierarchyUsingBlock:&v29];

      id v26 = objc_msgSend(v25, "avatar", v29, v30, v31, v32);
      id v27 = [v25 pointOfView];
      [v26 applyHeadPoseWithTrackingInfo:v18 gazeCorrection:0 pointOfView:v27];

      BOOL v17 = 1;
    }
  }

  [MEMORY[0x263F16B08] commit];
  return v17;
}

void __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  Float64 v3 = [v14 name];
  int v4 = AVTMorphTargetNameDefinesPose(v3);

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v14 name];
    char v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      objc_super v8 = [*(id *)(a1 + 40) scene];
      id v9 = [v8 rootNode];
      id v10 = [v14 name];
      CMTime v11 = [v9 childNodeWithName:v10 recursively:1];

      id v12 = [v11 presentationNode];
      id v13 = [v12 morpher];
      [v13 setWeights:v7];
    }
  }
}

void __125__JFXAnimojiEffectRenderer_setupPoseForPreRecordedBlendShapes_forRenderer_captureOrientation_interfaceOrientation_withFrame___block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  Float64 v3 = [v14 name];
  int v4 = AVTMorphTargetNameDefinesPose(v3);

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v14 name];
    char v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      objc_super v8 = [*(id *)(a1 + 40) scene];
      id v9 = [v8 rootNode];
      id v10 = [v14 name];
      CMTime v11 = [v9 childNodeWithName:v10 recursively:1];

      id v12 = [v11 presentationNode];
      id v13 = [v12 morpher];
      [v13 setWeights:v7];
    }
  }
}

- (BOOL)setupHeadPoseAndBlendShapesForFrame:(id)a3 forRenderer:(id)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 isInitialSetup:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  BOOL v15 = 0;
  if (v12 && v13)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:0.0];
    if ([(JFXAnimojiEffectRenderer *)self constrainHeadPose])
    {
      BOOL v15 = 1;
    }
    else
    {
      if ((unint64_t)(a5 - 1) > 3) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = qword_234D610A8[a5 - 1];
      }
      BOOL v17 = [v14 faceTracker];
      [v17 setInterfaceOrientation:a6];

      v18 = [MEMORY[0x263F29688] trackingInfoWithARFrame:v12 inputOrientation:v16 outputOrientation:a6];
      BOOL v15 = v18 != 0;
      uint64_t v19 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
      int v20 = [v19 shouldShowAnimojiFaceReticle];

      if (v18)
      {
        if ((v20 & 1) == 0)
        {
          id v21 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
          [v21 hideAnimojiFaceReticleForTrackingGain];
        }
        id v22 = [v14 avatar];
        uint64_t v23 = [v14 pointOfView];
        [v22 applyHeadPoseWithTrackingInfo:v18 gazeCorrection:0 pointOfView:v23];

        [v22 applyBlendShapesWithTrackingInfo:v18];
        if (v7)
        {
          id v24 = [v14 pointOfView];
          [v22 applyHeadPoseWithTrackingInfo:v18 gazeCorrection:0 pointOfView:v24];
        }
        if (self->_logged_render_failed)
        {
          id v25 = JFXLog_animoji();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = NSStringFromJFXEffectType(7);
            int v31 = 138543362;
            v32 = v26;
            _os_log_impl(&dword_234C41000, v25, OS_LOG_TYPE_DEFAULT, "Rendering effect - type: %{public}@", (uint8_t *)&v31, 0xCu);
          }
          self->_logged_render_failed = 0;
        }
      }
      else
      {
        if (v20)
        {
          id v27 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
          [v27 setupAnimojiFaceReticleForTrackingLoss];

          int64_t v28 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
          [v28 showAnimojiFaceReticleForTrackingLoss];
        }
        if (!self->_logged_render_failed)
        {
          uint64_t v29 = JFXLog_animoji();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[JFXAnimojiEffectRenderer setupHeadPoseAndBlendShapesForFrame:forRenderer:captureOrientation:interfaceOrientation:isInitialSetup:](self, v29);
          }

          self->_logged_render_failed = 1;
        }
      }
    }
    [MEMORY[0x263F16B08] commit];
  }

  return v15;
}

- (id)preRecordedBlendShapesForFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 backgroundColor:(id)a6
{
  id v18 = 0;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(JFXAnimojiEffectRenderer *)self currentPuppet];
  [(JFXAnimojiEffectRenderer *)self JFX_getRenderer:&v18 forAnimojiEffect:v12 primeFrame:0 captureOrientation:a4 interfaceOrientation:a5 backgroundColor:v10];

  id v13 = v18;
  LODWORD(a4) = [(JFXAnimojiEffectRenderer *)self setupHeadPoseAndBlendShapesForFrame:v11 forRenderer:v13 captureOrientation:a4 interfaceOrientation:a5 isInitialSetup:1];
  [v11 timestamp];
  double v15 = v14;

  [v13 updateAtTime:v15];
  uint64_t v16 = 0;
  if (a4)
  {
    uint64_t v16 = [(JFXAnimojiEffectRenderer *)self JFX_blendShapesForRenderer:v13];
  }

  return v16;
}

- (BOOL)JFX_getRenderer:(id *)a3 forAnimojiEffect:(id)a4 primeFrame:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 backgroundColor:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  BOOL v17 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v17 lock];

  id v18 = [(JFXAnimojiEffectRenderer *)self currentPuppet];
  char v19 = [v18 isEqual:v14];

  if ((v19 & 1) == 0)
  {
    if (![(JFXAnimojiEffectRenderer *)self asynchronouslyLoadNewPuppets])
    {
      id v22 = [(JFXAnimojiEffectRenderer *)self createNewRendererForPuppet:v14];
      [(JFXAnimojiEffectRenderer *)self setRenderer:v22];

      [(JFXAnimojiEffectRenderer *)self setCurrentPuppet:v14];
      BOOL v21 = 1;
      goto LABEL_6;
    }
    int v20 = [(JFXAnimojiEffectRenderer *)self currentPuppet];
    [(JFXAnimojiEffectRenderer *)self setCurrentPuppet:v14];
    [(JFXAnimojiEffectRenderer *)self asyncLoadNewPuppet:v14 currentPuppet:v20 captureOrientation:a6 interfaceOrientation:a7 primeFrame:v15 backgroundColor:v16];
  }
  BOOL v21 = 0;
LABEL_6:
  *a3 = [(JFXAnimojiEffectRenderer *)self renderer];
  uint64_t v23 = [(JFXAnimojiEffectRenderer *)self rendererLock];
  [v23 unlock];

  return v21;
}

- (void)renderFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9 completionBlock:(id)a10
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v50 = a5;
  id v51 = a8;
  id v18 = a9;
  v48 = v17;
  id v49 = a10;
  id v70 = 0;
  BOOL v19 = [(JFXAnimojiEffectRenderer *)self JFX_getRenderer:&v70 forAnimojiEffect:v17 primeFrame:v16 captureOrientation:a6 interfaceOrientation:a7 backgroundColor:v18];
  id v20 = v70;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  if ([(JFXAnimojiEffectRenderer *)self constrainHeadPose])
  {
    if (v20)
    {
      if ([v16 segmentationBuffer])
      {
        BOOL v21 = [v20 faceTracker];
        objc_msgSend(v21, "updateWithARFrame:captureOrientation:interfaceOrientation:constrainHeadPose:mirroredDepthData:", v16, a6, a7, -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"), 1);
      }
      else
      {
        BOOL v21 = [v20 faceTracker];
        LOBYTE(v47) = 1;
        objc_msgSend(v21, "updateWithARFrame:worldAlignment:fallBackDepthData:captureOrientation:interfaceOrientation:constrainHeadPose:mirroredDepthData:", v16, 2, v50, a6, a7, -[JFXAnimojiEffectRenderer constrainHeadPose](self, "constrainHeadPose"), v47);
      }

      if (v51)
      {
        BOOL v27 = [(JFXAnimojiEffectRenderer *)self setupPoseForPreRecordedBlendShapes:v51 forRenderer:v20 captureOrientation:a6 interfaceOrientation:a7 withFrame:v16];
LABEL_12:
        *((unsigned char *)v67 + 24) = v27;
        goto LABEL_13;
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v34 = [v16 anchors];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v63;
        while (2)
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v63 != v36) {
              objc_enumerationMutation(v34);
            }
            v38 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v39 = v38;
              if ([v39 isTracked])
              {
                *((unsigned char *)v67 + 24) = 1;

                goto LABEL_26;
              }
            }
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v71 count:16];
          if (v35) {
            continue;
          }
          break;
        }
      }
LABEL_26:

      if (!*((unsigned char *)v67 + 24))
      {
        v43 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
        int v44 = [v43 shouldShowAnimojiFaceReticle];

        if (v44)
        {
          v45 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
          [v45 setupAnimojiFaceReticleForTrackingLoss];

          v46 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
          [v46 showAnimojiFaceReticleForTrackingLoss];
        }
        BOOL v27 = [(JFXAnimojiEffectRenderer *)self constrainHeadPose];
        goto LABEL_12;
      }
      v40 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
      char v41 = [v40 shouldShowAnimojiFaceReticle];

      if ((v41 & 1) == 0)
      {
        v42 = [(JFXAnimojiEffectRenderer *)self trackingLossDelegate];
        [v42 hideAnimojiFaceReticleForTrackingGain];
      }
    }
  }
  else
  {
    if (v51) {
      BOOL v22 = [(JFXAnimojiEffectRenderer *)self setupPoseForPreRecordedBlendShapes:v51 forRenderer:v20 captureOrientation:a6 interfaceOrientation:a7 withFrame:v16];
    }
    else {
      BOOL v22 = [(JFXAnimojiEffectRenderer *)self setupHeadPoseAndBlendShapesForFrame:v16 forRenderer:v20 captureOrientation:a6 interfaceOrientation:a7 isInitialSetup:v19];
    }
    *((unsigned char *)v67 + 24) = v22;
    [(JFXAnimojiEffectRenderer *)self workingSize];
    -[JFXAnimojiEffectRenderer JFX_focalLengthForFrame:workingSize:interfaceOrientation:](self, "JFX_focalLengthForFrame:workingSize:interfaceOrientation:", v16, a7);
    double v24 = v23;
    id v25 = [v20 pointOfView];
    id v26 = [v25 camera];
    [v26 setFocalLength:v24];
  }
LABEL_13:
  objc_initWeak(&location, self);
  puppetRenderingQ = self->_puppetRenderingQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __156__JFXAnimojiEffectRenderer_renderFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor_completionBlock___block_invoke;
  block[3] = &unk_264C0A8D8;
  objc_copyWeak(&v60, &location);
  v59 = &v66;
  id v53 = v16;
  v54 = self;
  id v55 = v20;
  id v56 = v50;
  id v57 = v18;
  id v58 = v49;
  id v29 = v49;
  id v30 = v18;
  id v31 = v50;
  id v32 = v20;
  id v33 = v16;
  dispatch_async(puppetRenderingQ, block);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v66, 8);
}

void __156__JFXAnimojiEffectRenderer_renderFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    memset(&v12, 0, sizeof(v12));
    [*(id *)(a1 + 32) timestamp];
    CMTimeMakeWithSeconds(&v12, v3, 1000000000);
    uint64_t v5 = *(void *)(a1 + 32);
    int v4 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    CMTime v11 = v12;
    [v4 renderAnimoji:v6 withPresentationTime:&v11 frame:v5 depthData:v7 backgroundColor:v8 completionBlock:v9];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
    [WeakRetained flush];
  }
}

- (__CVBuffer)newPixelBufferRenderedFromARFrame:(id)a3 withEffect:(id)a4 depthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 preRecordedBlendShapes:(id)a8 backgroundColor:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  uint64_t v27 = 0;
  int64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  if (!v16)
  {
    id v16 = [v14 capturedDepthData];
  }
  BOOL v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __162__JFXAnimojiEffectRenderer_newPixelBufferRenderedFromARFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke;
  v24[3] = &unk_264C0A900;
  id v26 = &v27;
  id v20 = v19;
  id v25 = v20;
  [(JFXAnimojiEffectRenderer *)self renderFrame:v14 withEffect:v15 depthData:v16 captureOrientation:a6 interfaceOrientation:a7 preRecordedBlendShapes:v17 backgroundColor:v18 completionBlock:v24];
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v21 = (__CVBuffer *)v28[3];

  _Block_object_dispose(&v27, 8);
  return v21;
}

void __162__JFXAnimojiEffectRenderer_newPixelBufferRenderedFromARFrame_withEffect_depthData_captureOrientation_interfaceOrientation_preRecordedBlendShapes_backgroundColor___block_invoke(uint64_t a1, CVPixelBufferRef texture)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CVPixelBufferRetain(texture);
  Float64 v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

- (void)renderAnimoji:(id)a3 withPresentationTime:(id *)a4 frame:(id)a5 depthData:(id)a6 backgroundColor:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v49 = a5;
  id v51 = a6;
  id v15 = a7;
  id v50 = a8;
  CVPixelBufferRef pixelBufferOut = 0;
  CMTime time = *(CMTime *)a4;
  [(JFXAnimojiEffectRenderer *)self setSystemTimeForAVTRenderer:CMTimeGetSeconds(&time)];
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVReturn v17 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_inputBufferPool, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
  bzero(BaseAddress, Height * BytesPerRow);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (v17)
  {
    BOOL v21 = JFXLog_effects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[JFXAnimojiEffectRenderer renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:](v17, v21);
    }
  }
  time.value = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBufferOut, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, 0);
  CVReturn TextureFromImage = CVMetalTextureCacheCreateTextureFromImage(v16, self->_metalTextureCache, pixelBufferOut, 0, MTLPixelFormatBGRA8Unorm_sRGB, WidthOfPlane, HeightOfPlane, 0, (CVMetalTextureRef *)&time);
  if (TextureFromImage)
  {
    int v25 = TextureFromImage;
    id v26 = JFXLog_effects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[JFXAnimojiEffectRenderer renderAnimoji:withPresentationTime:frame:depthData:backgroundColor:completionBlock:](v25, v26);
    }
  }
  uint64_t v27 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:81 width:WidthOfPlane height:HeightOfPlane mipmapped:0];
  [v27 setStorageMode:3];
  [v27 setUsage:5];
  int64_t v28 = [MEMORY[0x263F129A0] renderPassDescriptor];
  uint64_t v29 = [v28 colorAttachments];
  uint64_t v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setLoadAction:2];

  double v58 = 0.0;
  double v59 = 0.0;
  double v56 = 0.0;
  double v57 = 0.0;
  if (v15)
  {
    [v15 getRed:&v59 green:&v58 blue:&v57 alpha:&v56];
    double v31 = v58;
    double v32 = v59;
    double v33 = v56;
    double v34 = v57;
  }
  else
  {
    double v33 = 0.0;
    double v34 = 0.0;
    double v31 = 0.0;
    double v32 = 0.0;
  }
  uint64_t v35 = [v28 colorAttachments];
  uint64_t v36 = [v35 objectAtIndexedSubscript:0];
  objc_msgSend(v36, "setClearColor:", v32, v31, v34, v33);

  id v37 = CVMetalTextureGetTexture((CVMetalTextureRef)time.value);
  v38 = [v28 colorAttachments];
  id v39 = [v38 objectAtIndexedSubscript:0];
  [v39 setTexture:v37];

  v40 = [v14 commandQueue];
  char v41 = [v40 commandBuffer];

  v42 = 0;
  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose])
  {
    v43 = v51;
    if (!v51) {
      goto LABEL_18;
    }
    int v44 = [(JFXAnimojiEffectRenderer *)self JFX_depthDataToTexture:v51];
    v42 = v44;
    if (!v44) {
      goto LABEL_18;
    }
    uint64_t v45 = CVMetalTextureGetTexture(v44);
    if (v45)
    {
      v46 = (void *)v45;
      [v14 setCapturedDepth:v45];
    }
  }
  v43 = v51;
LABEL_18:
  if ([(JFXAnimojiEffectRenderer *)self allowAntialiasing]) {
    uint64_t v47 = 2;
  }
  else {
    uint64_t v47 = 0;
  }
  objc_msgSend(v14, "setAvt_antialiasingMode:", v47);
  [MEMORY[0x263F16B08] flush];
  [(JFXAnimojiEffectRenderer *)self systemTimeForAVTRenderer];
  objc_msgSend(v14, "renderAtTime:viewport:commandBuffer:passDescriptor:", v41, v28);
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __111__JFXAnimojiEffectRenderer_renderAnimoji_withPresentationTime_frame_depthData_backgroundColor_completionBlock___block_invoke;
  v52[3] = &unk_264C0A928;
  objc_copyWeak(v54, &location);
  id v48 = v50;
  v54[1] = pixelBufferOut;
  v54[2] = (id)time.value;
  v52[4] = self;
  id v53 = v48;
  v54[3] = v42;
  [v41 addCompletedHandler:v52];
  [v41 commit];

  objc_destroyWeak(v54);
  objc_destroyWeak(&location);
}

void __111__JFXAnimojiEffectRenderer_renderAnimoji_withPresentationTime_frame_depthData_backgroundColor_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 56));
  }
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (([*(id *)(a1 + 32) constrainHeadPose] & 1) == 0) {
    CVBufferRelease(*(CVBufferRef *)(a1 + 72));
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  [WeakRetained flush];
}

- (id)JFX_blendShapesForRenderer:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  uint64_t v5 = [v3 scene];

  uint64_t v6 = [v5 rootNode];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__JFXAnimojiEffectRenderer_JFX_blendShapesForRenderer___block_invoke;
  v10[3] = &unk_264C0A950;
  id v7 = v4;
  id v11 = v7;
  [v6 enumerateHierarchyUsingBlock:v10];

  if ([v7 count])
  {
    uint64_t v8 = [NSDictionary dictionaryWithDictionary:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __55__JFXAnimojiEffectRenderer_JFX_blendShapesForRenderer___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 name];

  if (v3)
  {
    int v4 = [v14 name];
    int v5 = AVTMorphTargetNameDefinesPose(v4);

    if (v5)
    {
      uint64_t v6 = [v14 presentationNode];
      id v7 = [v6 morpher];
      uint64_t v8 = [v7 weights];

      if (v8)
      {
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v14 presentationNode];
        id v11 = [v10 morpher];
        CMTime v12 = [v11 weights];
        id v13 = [v14 name];
        [v9 setObject:v12 forKey:v13];
      }
    }
  }
}

- (void)createTextureCaches
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = MTLCreateSystemDefaultDevice();
  uint64_t v12 = *MEMORY[0x263F04068];
  v13[0] = &unk_26E801E70;
  CFDictionaryRef v4 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v5 = *MEMORY[0x263F04070];
  uint64_t v10 = *MEMORY[0x263F04070];
  id v11 = &unk_26E8017A0;
  CFDictionaryRef v6 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, v3, v6, &self->_metalTextureCache);
  if (![(JFXAnimojiEffectRenderer *)self constrainHeadPose])
  {
    uint64_t v8 = v5;
    uint64_t v9 = &unk_26E8017B8;
    CVMetalTextureCacheCreate(v7, v4, v3, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1], &self->_metalDepthTextureCache);
  }
}

- (BOOL)JFX_inputBufferIsPortraitAspect:(CGSize)a3
{
  return a3.height > a3.width;
}

- (__CVBuffer)JFX_depthDataToTexture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  id v6 = v4;
  if ([v6 depthDataType] != 1717855600)
  {
    uint64_t v7 = [v6 depthDataByConvertingToDepthDataType:1717855600];

    id v6 = (id)v7;
  }
  id v8 = v6;
  uint64_t v9 = (__CVBuffer *)[v8 depthDataMap];
  size_t Width = CVPixelBufferGetWidth(v9);
  size_t Height = CVPixelBufferGetHeight(v9);
  CVMetalTextureRef textureOut = 0;
  LODWORD(v9) = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_metalDepthTextureCache, v9, 0, MTLPixelFormatR32Float, Width, Height, 0, &textureOut);
  uint64_t v12 = textureOut;

  if (v9) {
LABEL_5:
  }
    uint64_t v12 = 0;

  return v12;
}

- (double)JFX_focalLengthForFrame:(id)a3 workingSize:(CGSize)a4 interfaceOrientation:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  uint64_t v10 = [v9 camera];
  [v10 intrinsics];
  double v30 = v12;
  double v32 = v11;
  double v28 = v13;
  id v14 = [v9 camera];

  [v14 imageResolution];
  +[JFXFaceTrackingUtilities adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:](JFXFaceTrackingUtilities, "adjustIntrinsics:forRenderSize:capturedSize:interfaceOrientation:", a5, v32, v30, v28, width, height, v15, v16);
  simd_float3 v31 = v18;
  simd_float3 v33 = v17;
  simd_float3 v29 = v19;

  if (-[JFXAnimojiEffectRenderer JFX_inputBufferIsPortraitAspect:](self, "JFX_inputBufferIsPortraitAspect:", width, height))
  {
    double height = width;
  }
  v34.columns[2] = v29;
  v34.columns[1] = v31;
  v34.columns[2].i32[3] = 0;
  v34.columns[1].i32[3] = 0;
  v34.columns[0] = v33;
  v34.columns[0].i32[3] = 0;
  pv_focal_length_from_intrinsics(v34);
  double v21 = v20;
  BOOL v22 = [(JFXAnimojiEffectRenderer *)self renderer];
  double v23 = [v22 pointOfView];
  double v24 = [v23 camera];
  [v24 sensorHeight];
  double v26 = v25 * v21 / height;

  return v26;
}

- (BOOL)asynchronouslyLoadNewPuppets
{
  return self->_asynchronouslyLoadNewPuppets;
}

- (void)setAsynchronouslyLoadNewPuppets:(BOOL)a3
{
  self->_asynchronouslyLoadNewPuppets = a3;
}

- (JFXAnimojiTrackingLossDelegate)trackingLossDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackingLossDelegate);
  return (JFXAnimojiTrackingLossDelegate *)WeakRetained;
}

- (void)setTrackingLossDelegate:(id)a3
{
}

- (BOOL)allowAntialiasing
{
  return self->_allowAntialiasing;
}

- (void)setAllowAntialiasing:(BOOL)a3
{
  self->_allowAntialiasing = a3;
}

- (AVTRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void)setAvatarStore:(id)a3
{
}

- (JFXAnimojiEffect)currentPuppet
{
  return self->_currentPuppet;
}

- (void)setCurrentPuppet:(id)a3
{
}

- (NSLock)renderPassLock
{
  return self->_renderPassLock;
}

- (NSLock)rendererLock
{
  return self->_rendererLock;
}

- (void)setRendererLock:(id)a3
{
}

- (__CVMetalTextureCache)metalTextureCache
{
  return self->_metalTextureCache;
}

- (void)setMetalTextureCache:(__CVMetalTextureCache *)a3
{
  self->_metalTextureCache = a3;
}

- (CGSize)workingSize
{
  double width = self->_workingSize.width;
  double height = self->_workingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWorkingSize:(CGSize)a3
{
  self->_workingSize = a3;
}

- (__CVPixelBufferPool)inputBufferPool
{
  return self->_inputBufferPool;
}

- (void)setInputBufferPool:(__CVPixelBufferPool *)a3
{
  self->_inputBufferPool = a3;
}

- (double)systemTimeForAVTRenderer
{
  return self->_systemTimeForAVTRenderer;
}

- (void)setSystemTimeForAVTRenderer:(double)a3
{
  self->_systemTimeForAVTRenderer = a3;
}

- (__CVMetalTextureCache)metalDepthTextureCache
{
  return self->_metalDepthTextureCache;
}

- (void)setMetalDepthTextureCache:(__CVMetalTextureCache *)a3
{
  self->_metalDepthTextureCache = a3;
}

- (BOOL)constrainHeadPose
{
  return self->_constrainHeadPose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererLock, 0);
  objc_storeStrong((id *)&self->_renderPassLock, 0);
  objc_storeStrong((id *)&self->_currentPuppet, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_destroyWeak((id *)&self->_trackingLossDelegate);
  objc_storeStrong((id *)&self->_puppetRenderingQ, 0);
  objc_storeStrong((id *)&self->_puppetLoadingQ, 0);
}

- (void)createNewRendererForPuppet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)setupHeadPoseAndBlendShapesForFrame:(void *)a1 forRenderer:(NSObject *)a2 captureOrientation:interfaceOrientation:isInitialSetup:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromJFXEffectType(7);
  uint64_t v5 = [a1 currentPuppet];
  id v6 = [v5 effectID];
  int v7 = 138543618;
  id v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "Unable to render effect - type: %{public}@, name: %{public}@, reason: No tracked face anchors for the current frame", (uint8_t *)&v7, 0x16u);
}

- (void)renderAnimoji:(int)a1 withPresentationTime:(NSObject *)a2 frame:depthData:backgroundColor:completionBlock:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "CVMetalTextureCacheCreateTextureFromImage returned error %d", (uint8_t *)v2, 8u);
}

- (void)renderAnimoji:(int)a1 withPresentationTime:(NSObject *)a2 frame:depthData:backgroundColor:completionBlock:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "CVPixelBufferPoolCreatePixelBuffer returned error %d", (uint8_t *)v2, 8u);
}

@end