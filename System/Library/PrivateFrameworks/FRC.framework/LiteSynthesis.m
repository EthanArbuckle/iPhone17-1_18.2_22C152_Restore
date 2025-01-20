@interface LiteSynthesis
- (BOOL)createModules;
- (BOOL)dumpMemoryAt:(float)a3 frameIndex:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 channels:(unint64_t)a7;
- (BOOL)enableMemDump;
- (BOOL)framePipeline;
- (BOOL)frameSyncRequired;
- (BOOL)linearSplatting;
- (BOOL)switchUsageTo:(int64_t)a3;
- (BOOL)temporalFiltering;
- (BOOL)textureFromCVPixelBuffer;
- (LiteSynthesis)initWithMode:(int64_t)a3;
- (LiteSynthesis)liteSynthesisWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 firstFeature:(id)a5 secondFeature:(id)a6 outputTexture:(id)a7 timeScale:(float)a8 frameIndex:(unint64_t)a9;
- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4;
- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8;
- (int64_t)usage;
- (void)allocateResources;
- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 commandBuffer:(id)a5 callback:(id)a6;
- (void)combineWarpedTexture:(id)a3 and:(id)a4 normalized0:(id)a5 normalized1:(id)a6 alpha:(id)a7 toOutput:(id)a8 mapTexture:(id)a9 callback:(id)a10;
- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6;
- (void)forwardWarpForFlow:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 callback:(id)a9;
- (void)forwarpFirstTexture:(id)a3 SecondTexture:(id)a4 timeScale:(float)a5 needWait:(BOOL)a6;
- (void)generateBlendingMap:(id)a3 and:(id)a4 toAlpha:(id)a5 timeScale:(float)a6 normalized0:(id)a7 normalized1:(id)a8 callback:(id)a9;
- (void)postFilterFrom:(id)a3 mapTexture:(id)a4 toTexture:(id)a5 callback:(id)a6;
- (void)releaseFeatures;
- (void)releaseResources;
- (void)setEnableMemDump:(BOOL)a3;
- (void)setFramePipeline:(BOOL)a3;
- (void)setLinearSplatting:(BOOL)a3;
- (void)setTemporalFiltering:(BOOL)a3;
- (void)setTextureFromCVPixelBuffer:(BOOL)a3;
- (void)setUsage:(int64_t)a3;
- (void)upScaleforwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 outputTexture:(id)a5 commandBuffer:(id)a6;
@end

@implementation LiteSynthesis

- (LiteSynthesis)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LiteSynthesis;
  v4 = [(LiteSynthesis *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    if (![(LiteSynthesis *)v4 createModules])
    {
      NSLog(&cfstr_FailedToCreate_2.isa);
      v8 = 0;
      goto LABEL_6;
    }
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    completionSemaphore = v5->_completionSemaphore;
    v5->_completionSemaphore = (OS_dispatch_semaphore *)v6;
  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (BOOL)createModules
{
  v3 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = (MTLCommandQueue *)[(MTLDeviceSPI *)self->_device newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  v7 = [[Backwarp alloc] initWithDevice:self->_device interleaved:0];
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  if (self->_backwarp)
  {
    v9 = [[Forwarp alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue mode:10];
    forwarp = self->_forwarp;
    self->_forwarp = v9;

    if (self->_forwarp)
    {
      v11 = [[GPUSynthesis alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue];
      synthesis = self->_synthesis;
      self->_synthesis = v11;

      if (self->_synthesis) {
        return 1;
      }
    }
    NSLog(&cfstr_FailedToCreate_4.isa);
  }
  else
  {
    NSLog(&cfstr_FailedToCreate_3.isa);
  }
  return 0;
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  self->_usage = a3;
  return 1;
}

- (void)allocateResources
{
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v51, &v50);
  v3 = [(Forwarp *)self->_forwarp createBestBufferWidth:v51 height:v50];
  v4 = self->_bestErrorBuffer[0];
  self->_bestErrorBuffer[0] = v3;

  v5 = [(Forwarp *)self->_forwarp createBestBufferWidth:v51 height:v50];
  dispatch_semaphore_t v6 = self->_bestErrorBuffer[1];
  self->_bestErrorBuffer[1] = v5;

  v7 = [(Forwarp *)self->_forwarp createOutputBufferWidth:v51 height:v50 channels:3];
  v8 = self->_warpOutputBuffer[0];
  self->_warpOutputBuffer[0] = v7;

  v9 = [(Forwarp *)self->_forwarp createOutputBufferWidth:v51 height:v50 channels:3];
  objc_super v10 = self->_warpOutputBuffer[1];
  self->_warpOutputBuffer[1] = v9;

  if (self->_textureFromCVPixelBuffer)
  {
    self->_flowPixelBuffer0 = createPixelBuffer(v51, 2 * v50, 0x4C303068u, 0);
    self->_flowPixelBuffer1 = createPixelBuffer(v51, 2 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_flowPixelBuffer0, self->_device, 1, 2uLL);
    v11 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    flowTexture0 = self->_flowTexture0;
    self->_flowTexture0 = v11;

    createTexturesFromCVPixelBuffer(self->_flowPixelBuffer1, self->_device, 1, 2uLL);
    v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    flowTexture1 = self->_flowTexture1;
    self->_flowTexture1 = v13;

    PixelBuffer = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    self->_alphaMap = PixelBuffer;
    createTexturesFromCVPixelBuffer(PixelBuffer, self->_device, 1, 1uLL);
    v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    alphaTexture = self->_alphaTexture;
    self->_alphaTexture = v16;

    self->_selectMap = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    self->_intermediaCVBuffer = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_selectMap, self->_device, 1, 3uLL);
    v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    mapTexture = self->_mapTexture;
    self->_mapTexture = v18;

    createTexturesFromCVPixelBuffer(self->_intermediaCVBuffer, self->_device, 1, 3uLL);
    v20 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    combinedWarpedTexture = self->_combinedWarpedTexture;
    self->_combinedWarpedTexture = v20;

    self->_L1Loss0 = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    self->_L1Loss1 = createPixelBuffer(v51, v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_L1Loss0, self->_device, 1, 1uLL);
    v22 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    L1Texture0 = self->_L1Texture0;
    self->_L1Texture0 = v22;

    createTexturesFromCVPixelBuffer(self->_L1Loss1, self->_device, 1, 1uLL);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    L1Texture1 = self->_L1Texture1;
    self->_L1Texture1 = v24;

    self->_warpedForwardFeatures[0] = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    self->_warpedForwardFeatures[1] = createPixelBuffer(v51, 3 * v50, 0x4C303068u, 0);
    createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[0], self->_device, 1, 3uLL);
    v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v27 = self->_warpedForwardTextures[0];
    self->_warpedForwardTextures[0] = v26;

    createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[1], self->_device, 1, 3uLL);
  }
  else
  {
    createTextures(self->_device, v51, v50, 1, 1uLL);
    v29 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v30 = self->_alphaTexture;
    self->_alphaTexture = v29;

    createTextures(self->_device, v51, v50, 1, 2uLL);
    v31 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v32 = self->_flowTexture0;
    self->_flowTexture0 = v31;

    createTextures(self->_device, v51, v50, 1, 2uLL);
    v33 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v34 = self->_flowTexture1;
    self->_flowTexture1 = v33;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v36 = self->_mapTexture;
    self->_mapTexture = v35;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v37 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v38 = self->_combinedWarpedTexture;
    self->_combinedWarpedTexture = v37;

    createTextures(self->_device, v51, v50, 1, 1uLL);
    v39 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v40 = self->_L1Texture0;
    self->_L1Texture0 = v39;

    createTextures(self->_device, v51, v50, 1, 1uLL);
    v41 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v42 = self->_L1Texture1;
    self->_L1Texture1 = v41;

    createTextures(self->_device, v51, v50, 1, 3uLL);
    v43 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v44 = self->_warpedForwardTextures[0];
    self->_warpedForwardTextures[0] = v43;

    createTextures(self->_device, v51, v50, 1, 3uLL);
  }
  v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v45 = self->_warpedForwardTextures[1];
  self->_warpedForwardTextures[1] = v28;

  createTextures(self->_device, v51, v50, 4, 1uLL);
  v46 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v47 = self->_normalizedFwarpTextures[0];
  self->_normalizedFwarpTextures[0] = v46;

  createTextures(self->_device, v51, v50, 4, 1uLL);
  v48 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  v49 = self->_normalizedFwarpTextures[1];
  self->_normalizedFwarpTextures[1] = v48;
}

- (void)releaseResources
{
  flowTexture0 = self->_flowTexture0;
  self->_flowTexture0 = 0;

  flowTexture1 = self->_flowTexture1;
  self->_flowTexture1 = 0;

  L1Texture0 = self->_L1Texture0;
  self->_L1Texture0 = 0;

  L1Texture1 = self->_L1Texture1;
  self->_L1Texture1 = 0;

  mapTexture = self->_mapTexture;
  self->_mapTexture = 0;

  combinedWarpedTexture = self->_combinedWarpedTexture;
  self->_combinedWarpedTexture = 0;

  v9 = self->_bestErrorBuffer[0];
  self->_bestErrorBuffer[0] = 0;

  objc_super v10 = self->_bestErrorBuffer[1];
  self->_bestErrorBuffer[1] = 0;

  v11 = self->_warpOutputBuffer[0];
  self->_warpOutputBuffer[0] = 0;

  v12 = self->_warpOutputBuffer[1];
  self->_warpOutputBuffer[1] = 0;

  v13 = self->_warpedForwardTextures[0];
  self->_warpedForwardTextures[0] = 0;

  v14 = self->_warpedForwardTextures[1];
  self->_warpedForwardTextures[1] = 0;

  alphaTexture = self->_alphaTexture;
  self->_alphaTexture = 0;

  v16 = self->_normalizedFwarpTextures[0];
  self->_normalizedFwarpTextures[0] = 0;

  v17 = self->_normalizedFwarpTextures[1];
  self->_normalizedFwarpTextures[1] = 0;

  if (self->_textureFromCVPixelBuffer)
  {
    CVPixelBufferRelease(self->_intermediaCVBuffer);
    CVPixelBufferRelease(self->_selectMap);
    CVPixelBufferRelease(self->_flowPixelBuffer0);
    CVPixelBufferRelease(self->_flowPixelBuffer1);
    CVPixelBufferRelease(self->_L1Loss0);
    CVPixelBufferRelease(self->_L1Loss1);
    CVPixelBufferRelease(self->_warpedForwardFeatures[0]);
    CVPixelBufferRelease(self->_warpedForwardFeatures[1]);
    alphaMap = self->_alphaMap;
    CVPixelBufferRelease(alphaMap);
  }
}

- (void)forwardWarpForFlow:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 callback:(id)a9
{
  id v16 = a9;
  commandQueue = self->_commandQueue;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [(MTLCommandQueue *)commandQueue commandBuffer];
  *(float *)&double v23 = a7;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v22 input:v21 flow:v20 error:v19 timeScale:1 fullWarp:self->_bestErrorBuffer[a3] bestError:v23 output:self->_warpOutputBuffer[a3] destination:v18];

  kdebug_trace();
  if (v16)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__LiteSynthesis_forwardWarpForFlow_feature_flow_error_timeScale_warpedOutput_callback___block_invoke;
    v24[3] = &unk_1E6CA4198;
    id v25 = v16;
    [v22 addCompletedHandler:v24];
  }
  [v22 commit];
}

uint64_t __87__LiteSynthesis_forwardWarpForFlow_feature_flow_error_timeScale_warpedOutput_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)combineWarpedTexture:(id)a3 and:(id)a4 normalized0:(id)a5 normalized1:(id)a6 alpha:(id)a7 toOutput:(id)a8 mapTexture:(id)a9 callback:(id)a10
{
  id v26 = a10;
  commandQueue = self->_commandQueue;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = [(MTLCommandQueue *)commandQueue commandBuffer];
  [(GPUSynthesis *)self->_synthesis encodeCombineCmdToCommandBuffer:v25 fromBuffer0:v24 buffer1:v23 best0:self->_bestErrorBuffer[0] best1:self->_bestErrorBuffer[1] map:v18 normalized0:v22 normalized1:v21 alpha:v20 flowStats0:&self->flowStats0 flowStats1:&self->flowStats1 toTexture:v19];

  kdebug_trace();
  if (v26)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __101__LiteSynthesis_combineWarpedTexture_and_normalized0_normalized1_alpha_toOutput_mapTexture_callback___block_invoke;
    v27[3] = &unk_1E6CA4198;
    id v28 = v26;
    [v25 addCompletedHandler:v27];
  }
  [v25 commit];
}

uint64_t __101__LiteSynthesis_combineWarpedTexture_and_normalized0_normalized1_alpha_toOutput_mapTexture_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)generateBlendingMap:(id)a3 and:(id)a4 toAlpha:(id)a5 timeScale:(float)a6 normalized0:(id)a7 normalized1:(id)a8 callback:(id)a9
{
  id v16 = a9;
  commandQueue = self->_commandQueue;
  id v18 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(MTLCommandQueue *)commandQueue commandBuffer];
  *(float *)&double v24 = a6;
  [(GPUSynthesis *)self->_synthesis encodeAlphaCmdToCommandBuffer:v23 fromBuffer0:v22 buffer1:v21 toAlpha:v20 timeScale:v19 toNormalized0:v18 toNormalized1:v24];

  kdebug_trace();
  if (v16)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __92__LiteSynthesis_generateBlendingMap_and_toAlpha_timeScale_normalized0_normalized1_callback___block_invoke;
    v25[3] = &unk_1E6CA4198;
    id v26 = v16;
    [v23 addCompletedHandler:v25];
  }
  [v23 commit];
}

uint64_t __92__LiteSynthesis_generateBlendingMap_and_toAlpha_timeScale_normalized0_normalized1_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)postFilterFrom:(id)a3 mapTexture:(id)a4 toTexture:(id)a5 callback:(id)a6
{
  id v10 = a6;
  commandQueue = self->_commandQueue;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(MTLCommandQueue *)commandQueue commandBuffer];
  [(GPUSynthesis *)self->_synthesis encodePostSmoothFilterCmdToCommandBuffer:v15 map:v13 fromTexture:v14 toTexture:v12];

  kdebug_trace();
  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__LiteSynthesis_postFilterFrom_mapTexture_toTexture_callback___block_invoke;
    v16[3] = &unk_1E6CA4198;
    id v17 = v10;
    [v15 addCompletedHandler:v16];
  }
  [v15 commit];
}

uint64_t __62__LiteSynthesis_postFilterFrom_mapTexture_toTexture_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 commandBuffer:(id)a5 callback:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  backwarp = self->_backwarp;
  flowTexture0 = self->_flowTexture0;
  L1Texture0 = self->_L1Texture0;
  id v15 = a4;
  id v16 = a3;
  LODWORD(v17) = 1.0;
  [(Backwarp *)backwarp encodeBackwarpLossToCommandBuffer:v10 first:v16 second:v15 flow:flowTexture0 timeScale:L1Texture0 destination:v17];
  LODWORD(v18) = 1.0;
  [(Backwarp *)self->_backwarp encodeBackwarpLossToCommandBuffer:v10 first:v15 second:v16 flow:self->_flowTexture1 timeScale:self->_L1Texture1 destination:v18];

  kdebug_trace();
  if (v11)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__LiteSynthesis_calcBackwarpLossFirst_second_commandBuffer_callback___block_invoke;
    v19[3] = &unk_1E6CA4198;
    id v20 = v11;
    [v10 addCompletedHandler:v19];
  }
  [v10 commit];
}

uint64_t __69__LiteSynthesis_calcBackwarpLossFirst_second_commandBuffer_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)upScaleforwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 outputTexture:(id)a5 commandBuffer:(id)a6
{
  id v15 = a6;
  id v10 = a5;
  size_t Width = CVPixelBufferGetWidth(a3);
  id v12 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  id v13 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  uint64_t v14 = [v10 width];

  if (v14 == Width)
  {
    objc_storeStrong((id *)&self->_flowTexture0, v12);
    objc_storeStrong((id *)&self->_flowTexture1, v13);
  }
  else
  {
    [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v15 source:v12 destination:self->_flowTexture0];
    [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v15 source:v13 destination:self->_flowTexture1];
  }
}

- (void)forwarpFirstTexture:(id)a3 SecondTexture:(id)a4 timeScale:(float)a5 needWait:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x1E01A5320]();
  flowTexture0 = self->_flowTexture0;
  L1Texture0 = self->_L1Texture0;
  id v15 = self->_warpedForwardTextures[0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke;
  v24[3] = &unk_1E6CA4450;
  BOOL v25 = v6;
  void v24[4] = self;
  *(float *)&double v16 = a5;
  [(LiteSynthesis *)self forwardWarpForFlow:0 feature:v10 flow:flowTexture0 error:L1Texture0 timeScale:v15 warpedOutput:v24 callback:v16];
  if (v6) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  double v17 = (void *)MEMORY[0x1E01A5320]();
  flowTexture1 = self->_flowTexture1;
  L1Texture1 = self->_L1Texture1;
  *(float *)&double v20 = 1.0 - a5;
  id v21 = self->_warpedForwardTextures[1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke_2;
  v22[3] = &unk_1E6CA4450;
  BOOL v23 = v6;
  v22[4] = self;
  [(LiteSynthesis *)self forwardWarpForFlow:1 feature:v11 flow:flowTexture1 error:L1Texture1 timeScale:v21 warpedOutput:v22 callback:v20];
  if (v6) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 48));
  }
  return result;
}

intptr_t __70__LiteSynthesis_forwarpFirstTexture_SecondTexture_timeScale_needWait___block_invoke_2(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 48));
  }
  return result;
}

- (LiteSynthesis)liteSynthesisWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 firstFeature:(id)a5 secondFeature:(id)a6 outputTexture:(id)a7 timeScale:(float)a8 frameIndex:(unint64_t)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  self->flowStats0.timeScale = a8;
  self->flowStats1.timeScale = 1.0 - a8;
  if (!a9)
  {
    id v21 = (void *)MEMORY[0x1E01A5320]([(LiteSynthesis *)self upScaleforwardFlow:a3 backwardFlow:a4 outputTexture:v18 commandBuffer:v19]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke;
    v46[3] = &unk_1E6CA4450;
    char v47 = 0;
    v46[4] = self;
    [(LiteSynthesis *)self calcBackwarpLossFirst:v16 second:v17 commandBuffer:v19 callback:v46];
  }
  *(float *)&double v20 = a8;
  [(LiteSynthesis *)self forwarpFirstTexture:v16 SecondTexture:v17 timeScale:0 needWait:v20];
  id v22 = self->_warpOutputBuffer[0];
  BOOL v23 = self->_warpOutputBuffer[1];
  alphaTexture = self->_alphaTexture;
  BOOL v25 = self->_normalizedFwarpTextures[0];
  id v26 = self->_normalizedFwarpTextures[1];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_2;
  v44[3] = &unk_1E6CA4450;
  char v45 = 0;
  v44[4] = self;
  *(float *)&double v27 = a8;
  [(LiteSynthesis *)self generateBlendingMap:v22 and:v23 toAlpha:alphaTexture timeScale:v25 normalized0:v26 normalized1:v44 callback:v27];
  id v28 = self->_warpOutputBuffer[0];
  v29 = self->_warpOutputBuffer[1];
  v30 = self->_normalizedFwarpTextures[0];
  v31 = self->_normalizedFwarpTextures[1];
  v32 = self->_alphaTexture;
  mapTexture = self->_mapTexture;
  combinedWarpedTexture = self->_combinedWarpedTexture;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_3;
  v42[3] = &unk_1E6CA4450;
  char v43 = 0;
  v42[4] = self;
  [(LiteSynthesis *)self combineWarpedTexture:v28 and:v29 normalized0:v30 normalized1:v31 alpha:v32 toOutput:combinedWarpedTexture mapTexture:mapTexture callback:v42];
  v36 = self->_mapTexture;
  v35 = self->_combinedWarpedTexture;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_4;
  v41[3] = &unk_1E6CA4478;
  v41[4] = self;
  [(LiteSynthesis *)self postFilterFrom:v35 mapTexture:v36 toTexture:v18 callback:v41];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_enableMemDump)
  {
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v40, &v39);
    *(float *)&double v37 = a8;
    [(LiteSynthesis *)self dumpMemoryAt:a9 frameIndex:v40 width:v39 height:3 channels:v37];
  }

  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 48));
  }
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_2(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 48));
  }
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_3(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 48));
  }
  return result;
}

intptr_t __121__LiteSynthesis_liteSynthesisWithFlowForward_flowBackward_firstFeature_secondFeature_outputTexture_timeScale_frameIndex___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 48));
}

- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4
{
  return -[LiteSynthesis synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:](self, "synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:", self->_normalizedFirst, self->_normalizedSecond, self->_forwardFlow, self->_backwardFlow, a4);
}

- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8
{
  uint64_t v21 = 0;
  size_t v22 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, (uint64_t *)&v22, &v21);
  PixelBuffer = createPixelBuffer(v22, 3 * v21, 0x4C303068u, 0);
  id v16 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  id v17 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  id v18 = createTexturesFromCVPixelBuffer(PixelBuffer, self->_device, 1, 3uLL);
  *(float *)&double v19 = a7;
  [(LiteSynthesis *)self liteSynthesisWithFlowForward:a5 flowBackward:a6 firstFeature:v16 secondFeature:v17 outputTexture:v18 timeScale:a8 frameIndex:v19];

  return PixelBuffer;
}

- (BOOL)dumpMemoryAt:(float)a3 frameIndex:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 channels:(unint64_t)a7
{
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ldx%ld.float", a5, a6);
  id v13 = [NSString stringWithFormat:@"ts%d_%@", (int)(float)(a3 * 1000.0), v12];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if (([v14 fileExistsAtPath:@"/var/mobile/tmp/"] & 1) != 0
    || ([v14 createDirectoryAtPath:@"/var/mobile/tmp/" withIntermediateDirectories:1 attributes:0 error:0] & 1) != 0)
  {
    id v37 = v14;
    if (!a4)
    {
      id v15 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"flow0", v12];
      id v16 = fopen((const char *)[v15 UTF8String], "wb");
      writeBufferFlt32(v16, self->_flowPixelBuffer0);
      fclose(v16);
      id v17 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"flow1", v12];

      id v18 = v17;
      double v19 = fopen((const char *)[v18 UTF8String], "wb");
      writeBufferFlt32(v19, self->_flowPixelBuffer1);
      fclose(v19);
    }
    id v20 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"map", v13];
    v38 = v12;
    uint64_t v21 = fopen((const char *)[v20 UTF8String], "wb");
    writeBufferFlt32(v21, self->_selectMap);
    saveTextureBufferFlt32(v21, self->_bestErrorBuffer[0], a5, a6, 0.0000001);
    saveTextureBufferFlt32(v21, self->_bestErrorBuffer[1], a5, a6, 0.0000001);
    fclose(v21);
    size_t v22 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"warpOutput0", v13];

    id v23 = v22;
    double v24 = fopen((const char *)[v23 UTF8String], "wb");
    unint64_t v25 = a6 + a6 * a7;
    saveTextureBufferFlt32(v24, self->_warpOutputBuffer[0], a5, v25, 0.0000001);
    fclose(v24);
    id v26 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"warpOutput1", v13];

    id v27 = v26;
    id v28 = fopen((const char *)[v27 UTF8String], "wb");
    saveTextureBufferFlt32(v28, self->_warpOutputBuffer[1], a5, v25, 0.0000001);
    fclose(v28);
    v29 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"loss0", v13];

    id v30 = v29;
    v31 = fopen((const char *)[v30 UTF8String], "wb");
    writeBufferFlt32(v31, self->_L1Loss0);
    fclose(v31);
    v32 = [NSString stringWithFormat:@"%@%@_%@", @"/var/mobile/tmp/", @"loss1", v13];

    id v33 = v32;
    v34 = fopen((const char *)[v33 UTF8String], "wb");
    writeBufferFlt32(v34, self->_L1Loss1);
    fclose(v34);

    id v14 = v37;
    id v12 = v38;
    BOOL v35 = 1;
  }
  else
  {
    NSLog(&cfstr_CouldNotBeCrea.isa, @"/var/mobile/tmp/");
    BOOL v35 = 0;
  }

  return v35;
}

- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  self->_forwardFlow = CVPixelBufferRetain(a5);
  self->_backwardFlow = CVPixelBufferRetain(a6);
  self->_normalizedFirst = CVPixelBufferRetain(a3);
  self->_normalizedSecond = CVPixelBufferRetain(a4);
}

- (void)releaseFeatures
{
  *(_OWORD *)&self->_normalizedFirst = 0u;
  *(_OWORD *)&self->_forwardFlow = 0u;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (BOOL)enableMemDump
{
  return self->_enableMemDump;
}

- (void)setEnableMemDump:(BOOL)a3
{
  self->_enableMemDump = a3;
}

- (BOOL)textureFromCVPixelBuffer
{
  return self->_textureFromCVPixelBuffer;
}

- (void)setTextureFromCVPixelBuffer:(BOOL)a3
{
  self->_textureFromCVPixelBuffer = a3;
}

- (BOOL)framePipeline
{
  return self->_framePipeline;
}

- (void)setFramePipeline:(BOOL)a3
{
  self->_framePipeline = a3;
}

- (BOOL)temporalFiltering
{
  return self->_temporalFiltering;
}

- (void)setTemporalFiltering:(BOOL)a3
{
  self->_temporalFiltering = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)frameSyncRequired
{
  return self->_frameSyncRequired;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  v4 = &self->_normalizedFwarpTextures[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_warpedForwardTextures[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_warpOutputBuffer[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_bestErrorBuffer[k + 1], 0);
  objc_storeStrong((id *)&self->_combinedWarpedTexture, 0);
  objc_storeStrong((id *)&self->_mapTexture, 0);
  objc_storeStrong((id *)&self->_L1Texture1, 0);
  objc_storeStrong((id *)&self->_L1Texture0, 0);
  objc_storeStrong((id *)&self->_flowTexture1, 0);
  objc_storeStrong((id *)&self->_flowTexture0, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_forwarp, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end