@interface Synthesis
- ($4F8AEDB151FE6B7D930C67B8235148C5)secondFeatures;
- ($5F31EEEF43F9D35F5EF7F84C27E8E4C6)firstFeatures;
- ($E5C4B62B72694C91D3AF528F66444F85)warpedBackwardFeatures;
- ($E5C4B62B72694C91D3AF528F66444F85)warpedForwardFeatures;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)synthesisTensorSizeForLevel:(SEL)a3;
- (BOOL)createModules;
- (BOOL)framePipeline;
- (BOOL)frameSyncRequired;
- (BOOL)linearSplatting;
- (BOOL)switchUsageTo:(int64_t)a3;
- (BOOL)temporalFiltering;
- (BOOL)tilingEnabled;
- (BOOL)twoLayerFlowSplatting;
- (BOOL)twoLayerQuarterSizeDC;
- (BOOL)useFlowConsistencyMap;
- (BOOL)useFusedKernel;
- (Synthesis)init;
- (Synthesis)initWithMode:(int64_t)a3;
- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4;
- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8;
- (__CVBuffer)synthesizeTilesWithTimeScale:(float)a3;
- (id)backwardLossTextureLevel:(int)a3;
- (id)bestErrorBufferLevel:(int)a3;
- (id)firstForwarpInput;
- (id)forwardFlowTextureLevel:(int)a3;
- (id)forwardLossTextureLevel:(int)a3;
- (id)secondForwarpInput;
- (id)warpOutputBufferLevel:(int)a3;
- (int)flowLevel;
- (int)twoLayerFlowSplattingFeatureLevelForLevel:(int)a3;
- (int64_t)usage;
- (int64_t)usageForTiling:(int64_t)a3;
- (unint64_t)synthesisMode;
- (void)allocateFeatures;
- (void)allocateFeaturesForUsage:(int64_t)a3 Level:(int)a4;
- (void)allocateFlowAndLossTextures;
- (void)allocateForwardWarpBuffersForLevel:(int)a3;
- (void)allocateForwardWarpInternalBuffers;
- (void)allocateOutputTile:(__CVBuffer *)a3 tileInfo:(id *)a4;
- (void)allocateResources;
- (void)allocateSplattingTextures;
- (void)allocateWarpedFeatures;
- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 timeScale:(float)a5;
- (void)createConsistencyMapFormFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6;
- (void)createFeaturePyramid:(__CVBuffer *)a3 second:(__CVBuffer *)a4;
- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6;
- (void)createSubsampledInputsFromFirstFrame:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4;
- (void)createTilesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6;
- (void)dealloc;
- (void)encodeConsistencyMapCreationWithFlowToCommandBuffer:(id)a3 firstSource:(id)a4 secondSource:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 firstForwarpInput:(id)a8 secondForwarpInput:(id)a9;
- (void)encodeForwarpInputsForBlendToCommandBuffer:(id)a3 timeScale:(float)a4;
- (void)encodeForwarpToCommandBuffer:(id)a3 level:(int)a4 firstTexture:(id)a5 secondTexture:(id)a6 firstWarpedTexture:(id)a7 secondWarpedTexture:(id)a8 timeScale:(float)a9 useFlowMagnitude:(BOOL)a10;
- (void)encodeSubsampleToCommandBuffer:(id)a3 flow:(id *)a4 loss:(id *)a5;
- (void)encodeWarpPyramidToCommandBuffer:(id)a3 forwardFlow:(id)a4 backwardFlow:(id)a5 forwarpConsistency:(id)a6 backwardConsistency:(id)a7 timeScale:(float)a8 destination:(id)a9;
- (void)filterGridNetOutput:(__CVBuffer *)a3 timeScale:(float)a4 destination:(__CVBuffer *)a5;
- (void)forwardWarpForLevel:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 fullWarp:(BOOL)a9 callback:(id)a10;
- (void)forwardWarpForLevel:(int)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 forwardOutput:(id)a7 backwardOutput:(id)a8;
- (void)getWarpedFeatureSizeForLevel:(int)a3 tensorSize:(id *)a4;
- (void)releaseFeatures;
- (void)releaseFeaturesForLevel:(int)a3;
- (void)releaseForwardWarpInternalTextures;
- (void)releaseForwardWarpInternalTexturesAndBuffers;
- (void)releaseForwardWarpLinearBuffersForLevel:(int)a3;
- (void)releaseForwardWarpTexturesForLevel:(int)a3;
- (void)releaseResources;
- (void)releaseSplattingTextures;
- (void)releaseTiles;
- (void)releaseWarpedFeaturesForIndex:(unint64_t)a3;
- (void)setFlowLevel:(int)a3;
- (void)setFramePipeline:(BOOL)a3;
- (void)setLinearSplatting:(BOOL)a3;
- (void)setSynthesisMode:(unint64_t)a3;
- (void)setTemporalFiltering:(BOOL)a3;
- (void)setTilingEnabled:(BOOL)a3;
- (void)setTwoLayerFlowSplatting:(BOOL)a3;
- (void)setTwoLayerQuarterSizeDC:(BOOL)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUseFlowConsistencyMap:(BOOL)a3;
- (void)setUseFusedKernel:(BOOL)a3;
- (void)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 callback:(id)a6;
- (void)synthesizeImageFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8;
- (void)synthesizeImageWithFlowSplattingFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8;
- (void)synthesizeImageWithForwarpOnlyFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8;
- (void)upscaleFlowsForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4;
- (void)upscaleForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 upscaledForwardFlow:(__CVBuffer *)a5 upscaledBackwardFlow:(__CVBuffer *)a6;
- (void)warpFeatureLevel:(int)a3 timeScale:(float)a4;
- (void)warpFeaturesPerLayerWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 timeScale:(float)a5;
@end

@implementation Synthesis

- (Synthesis)init
{
  return [(Synthesis *)self initWithMode:4];
}

- (Synthesis)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)Synthesis;
  v4 = [(Synthesis *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    if (![(Synthesis *)v4 createModules])
    {
      NSLog(&cfstr_FailedToCreate_2.isa);
      v8 = 0;
      goto LABEL_6;
    }
    v5->_resourcesPreAllocated = 0;
    v5->_tilingEnabled = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    completionSemaphore = v5->_completionSemaphore;
    v5->_completionSemaphore = (OS_dispatch_semaphore *)v6;

    v5->_numWarpedBuffers = 1;
    v5->_framePipeline = 1;
    v5->_pyramidLevels = 3;
    v5->_flowLevel = 1;
    v5->_fullWarpStartLevel = 1;
    *(_WORD *)&v5->_filterErrorMap = 0;
    v5->_useFusedKernel = 1;
  }
  v8 = v5;
LABEL_6:

  return v8;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)synthesisTensorSizeForLevel:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  BOOL linearSplatting = self->_linearSplatting;
  int64_t usage = self->_usage;
  if (linearSplatting) {
    FRCGetInputFrameSizeForUsage(usage, &v12, &v11);
  }
  else {
    FRCGetAlignedInputFrameSizeForUsage(usage, &v12, &v11);
  }
  uint64_t v10 = v11;
  for (uint64_t i = v12; a4; --a4)
  {
    uint64_t i = (unint64_t)(i + 1) >> 1;
    uint64_t v10 = (unint64_t)(v10 + 1) >> 1;
  }
  retstr->var0 = i;
  retstr->var1 = v10;
  retstr->var2 = 3;
  return result;
}

- (void)allocateResources
{
  if (!self->_resourcesPreAllocated)
  {
    [(Synthesis *)self allocateForwardWarpInternalBuffers];
    [(Synthesis *)self allocateFeatures];
    [(Synthesis *)self allocateWarpedFeatures];
    [(Synthesis *)self allocateFlowAndLossTextures];
    [(Synthesis *)self allocateSplattingTextures];
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v6, &v5);
    self->_normalizedBufferPool = createPixelBufferPool(v6, 3 * v5, 1278226536, 0);
    unint64_t synthesisMode = self->_synthesisMode;
    if (synthesisMode == 1 || !synthesisMode && self->_temporalFiltering)
    {
      __int16 v4 = [(EspressoModel *)self->_gridNet usage];
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      FRCGetAlignedInputFrameSizeForUsage(v4, &v8, &v7);
      self->_dcBufferPool = createPixelBufferPool(v8, 3 * v7, 1278226536, 0);
    }
    self->_resourcesPreAllocated = 1;
  }
}

- (void)releaseResources
{
  if (self->_resourcesPreAllocated)
  {
    uint64_t v3 = 0;
    do
    {
      [(Synthesis *)self releaseFeaturesForLevel:v3];
      uint64_t v3 = (v3 + 1);
    }
    while (v3 != 5);
    if (self->_numWarpedBuffers)
    {
      uint64_t v4 = 0;
      unsigned int v5 = 1;
      do
      {
        [(Synthesis *)self releaseWarpedFeaturesForIndex:v4];
        uint64_t v4 = v5;
      }
      while (self->_numWarpedBuffers > v5++);
    }
    [(Synthesis *)self releaseForwardWarpInternalTexturesAndBuffers];
    normalizedBufferPool = self->_normalizedBufferPool;
    if (normalizedBufferPool) {
      CFRelease(normalizedBufferPool);
    }
    dcBufferPool = self->_dcBufferPool;
    if (dcBufferPool) {
      CFRelease(dcBufferPool);
    }
    [(Synthesis *)self releaseSplattingTextures];
    self->_resourcesPreAllocated = 0;
  }
}

- ($E5C4B62B72694C91D3AF528F66444F85)warpedForwardFeatures
{
  if (self->_resourcesPreAllocated) {
    return ($E5C4B62B72694C91D3AF528F66444F85 *)self->_warpedForwardFeatures;
  }
  else {
    return 0;
  }
}

- ($E5C4B62B72694C91D3AF528F66444F85)warpedBackwardFeatures
{
  if (self->_resourcesPreAllocated) {
    return ($E5C4B62B72694C91D3AF528F66444F85 *)self->_warpedBackwardFeatures;
  }
  else {
    return 0;
  }
}

- ($5F31EEEF43F9D35F5EF7F84C27E8E4C6)firstFeatures
{
  if (self->_resourcesPreAllocated) {
    return ($5F31EEEF43F9D35F5EF7F84C27E8E4C6 *)&self->_firstFeatures;
  }
  else {
    return 0;
  }
}

- (id)firstForwarpInput
{
  uint64_t v2 = 344;
  if (!self->_useFlowConsistencyMap) {
    uint64_t v2 = 368;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- (id)secondForwarpInput
{
  uint64_t v2 = 352;
  if (!self->_useFlowConsistencyMap) {
    uint64_t v2 = 408;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- ($4F8AEDB151FE6B7D930C67B8235148C5)secondFeatures
{
  if (self->_resourcesPreAllocated) {
    return ($4F8AEDB151FE6B7D930C67B8235148C5 *)&self->_secondFeatures;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  gridNet = self->_gridNet;
  self->_gridNet = 0;

  tiling = self->_tiling;
  self->_tiling = 0;

  flowConsisteny = self->_flowConsisteny;
  self->_flowConsisteny = 0;

  v6.receiver = self;
  v6.super_class = (Class)Synthesis;
  [(Synthesis *)&v6 dealloc];
}

- (BOOL)createModules
{
  uint64_t v3 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  unsigned int v5 = (MTLCommandQueue *)[(MTLDeviceSPI *)self->_device newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v5;

  uint64_t v7 = [[Backwarp alloc] initWithDevice:self->_device interleaved:0];
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  if (!self->_backwarp)
  {
    NSLog(&cfstr_FailedToCreate_3.isa);
    return 0;
  }
  v9 = [[Pyramid alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue];
  pyramid = self->_pyramid;
  self->_pyramid = v9;

  if (!self->_pyramid)
  {
    NSLog(&cfstr_FailedToCreate_5.isa);
    return 0;
  }
  if (self->_useFlowConsistencyMap)
  {
    uint64_t v11 = [[FlowConsistencyMap alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue];
    flowConsisteny = self->_flowConsisteny;
    self->_flowConsisteny = v11;
  }
  return 1;
}

- (void)allocateForwardWarpInternalBuffers
{
  if (self->_pyramidLevels)
  {
    unint64_t v3 = 0;
    do
      [(Synthesis *)self allocateForwardWarpBuffersForLevel:v3++];
    while (self->_pyramidLevels > v3);
  }
}

- (void)allocateFlowAndLossTextures
{
  if (self->_pyramidLevels)
  {
    unint64_t v3 = 0;
    backwardLossTexture = self->_backwardLossTexture;
    do
    {
      if (self->_synthesisMode == 3 && !self->_fullSizeSplatting) {
        unint64_t flowLevel = self->_flowLevel;
      }
      else {
        unint64_t flowLevel = v3;
      }
      [(Synthesis *)self synthesisTensorSizeForLevel:flowLevel];
      uint64_t v6 = createTextures(self->_device, 0, 0, 1, 1uLL);
      uint64_t v7 = *(backwardLossTexture - 5);
      *(backwardLossTexture - 5) = (MTLTexture *)v6;

      uint64_t v8 = createTextures(self->_device, 0, 0, 1, 1uLL);
      v9 = *backwardLossTexture;
      *backwardLossTexture = (MTLTexture *)v8;

      if (v3 != 1)
      {
        uint64_t v10 = createTextures(self->_device, 0, 0, 1, 2uLL);
        uint64_t v11 = backwardLossTexture[5];
        backwardLossTexture[5] = (MTLTexture *)v10;

        uint64_t v12 = createTextures(self->_device, 0, 0, 1, 2uLL);
        v13 = backwardLossTexture[10];
        backwardLossTexture[10] = (MTLTexture *)v12;

        if (!v3 && self->_filterErrorMap)
        {
          [(Forwarp *)self->_forwarp filterErrorMapByGaussian];
          createTextures(self->_device, 0, 0, 1, 1uLL);
          v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          filteredForwardLossTexture = self->_filteredForwardLossTexture;
          self->_filteredForwardLossTexture = v14;

          createTextures(self->_device, 0, 0, 1, 1uLL);
          v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          filteredBackwarLossTexture = self->_filteredBackwarLossTexture;
          self->_filteredBackwarLossTexture = v16;
        }
      }
      ++v3;
      ++backwardLossTexture;
    }
    while (self->_pyramidLevels > v3);
  }
}

- (void)allocateForwardWarpBuffersForLevel:(int)a3
{
  if (self->_synthesisMode != 3)
  {
    uint64_t v5 = 3;
    goto LABEL_5;
  }
  if (self->_fullSizeSplatting)
  {
    uint64_t v5 = 2;
LABEL_5:
    int flowLevel = a3;
    goto LABEL_6;
  }
  int flowLevel = self->_flowLevel;
  uint64_t v5 = 2;
LABEL_6:
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  getSynthesisTensorSize(self->_usage, flowLevel, &v13);
  unint64_t v7 = v13;
  uint64_t v8 = v14;
  if (a3 <= 0
    && (unint64_t synthesisMode = self->_synthesisMode, synthesisMode - 2 >= 2)
    && (synthesisMode || !self->_temporalFiltering)
    || self->_linearSplatting)
  {
    uint64_t v10 = [(Forwarp *)self->_forwarp createBestBufferWidth:32 height:32];
    uint64_t v11 = &self->super.isa + a3;
  }
  else
  {
    uint64_t v10 = [(Forwarp *)self->_forwarp createBestBufferWidth:v13 height:v14];
    uint64_t v11 = &self->super.isa + a3;
  }
  Class v12 = v11[31];
  v11[31] = (Class)v10;

  self->_warpOutputBuffer[a3] = [(Forwarp *)self->_forwarp createOutputBufferWidth:v7 height:v8 channels:v5 + self->_useFlowConsistencyMap];
  MEMORY[0x1F41817F8]();
}

- (void)allocateSplattingTextures
{
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_usage, &v35, &v34);
  switch(self->_synthesisMode)
  {
    case 0uLL:
      if (self->_temporalFiltering)
      {
        createTextures(self->_device, v35, v34, 1, 4uLL);
        unint64_t v3 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        firstWarpedTexture = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v3;

        createTextures(self->_device, v35, v34, 1, 4uLL);
        uint64_t v5 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        secondWarpedTexture = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v5;

        goto LABEL_4;
      }
      return;
    case 1uLL:
      if (self->_temporalFiltering) {
        goto LABEL_6;
      }
      return;
    case 2uLL:
LABEL_4:
      createTextures(self->_device, v35, v34, 1, 1uLL);
      unint64_t v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      dilatedForwardMask = self->_dilatedForwardMask;
      self->_dilatedForwardMask = v7;

      createTextures(self->_device, v35, v34, 1, 1uLL);
      v9 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      dilatedBackwardMask = self->_dilatedBackwardMask;
      self->_dilatedBackwardMask = v9;
      goto LABEL_18;
    case 3uLL:
LABEL_6:
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      getSynthesisTensorSize(self->_usage, self->_flowLevel, (unint64_t *)&v31);
      uint64_t v11 = v31;
      uint64_t v12 = v32;
      if (self->_fullSizeSplatting) {
        uint64_t v13 = v35;
      }
      else {
        uint64_t v13 = v31;
      }
      if (self->_fullSizeSplatting) {
        uint64_t v14 = v34;
      }
      else {
        uint64_t v14 = v32;
      }
      createTextures(self->_device, v13, v14, 1, 1uLL);
      uint64_t v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v16 = self->_dilatedForwardMask;
      self->_dilatedForwardMask = v15;

      createTextures(self->_device, v13, v14, 1, 1uLL);
      v17 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v18 = self->_dilatedBackwardMask;
      self->_dilatedBackwardMask = v17;

      if (self->_synthesisMode != 3)
      {
        createTextures(self->_device, v11, v12, 1, 4uLL);
        v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v29 = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v28;

        createTextures(self->_device, v11, v12, 1, 4uLL);
        v30 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        dilatedBackwardMask = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v30;
        goto LABEL_18;
      }
      if (!self->_useFusedKernel)
      {
        createTextures(self->_device, v35, v34, 1, 3uLL);
        v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v20 = self->_firstWarpedTexture;
        self->_firstWarpedTexture = v19;

        createTextures(self->_device, v35, v34, 1, 3uLL);
        v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v22 = self->_secondWarpedTexture;
        self->_secondWarpedTexture = v21;
      }
      if (self->_twoLayerFlowSplatting)
      {
        uint64_t v23 = [(MTLTexture *)self->_firstFeatures.features[3] width];
        uint64_t v24 = [(MTLTexture *)self->_firstFeatures.features[3] height];
        createTextures(self->_device, v23, v24, 1, 3uLL);
        v25 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        blendedDCTexture = self->_blendedDCTexture;
        self->_blendedDCTexture = v25;

        createTextures(self->_device, v23, v24, 1, 3uLL);
        v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        dilatedBackwardMask = self->_filteredDCTexture;
        self->_filteredDCTexture = v27;
LABEL_18:
      }
      return;
    default:
      return;
  }
}

- (void)releaseSplattingTextures
{
  firstWarpedTexture = self->_firstWarpedTexture;
  self->_firstWarpedTexture = 0;

  secondWarpedTexture = self->_secondWarpedTexture;
  self->_secondWarpedTexture = 0;

  dilatedForwardMask = self->_dilatedForwardMask;
  self->_dilatedForwardMask = 0;

  dilatedBackwardMask = self->_dilatedBackwardMask;
  self->_dilatedBackwardMask = 0;

  firstForwarpInputWithConsistencyMap = self->_firstForwarpInputWithConsistencyMap;
  self->_firstForwarpInputWithConsistencyMap = 0;

  secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  self->_secondForwarpInputWithConsistencyMap = 0;

  blendedDCTexture = self->_blendedDCTexture;
  self->_blendedDCTexture = 0;

  filteredDCTexture = self->_filteredDCTexture;
  self->_filteredDCTexture = 0;
}

- (void)releaseForwardWarpTexturesForLevel:(int)a3
{
  unint64_t v3 = &self->super.isa + a3;
  Class v4 = v3[11];
  v3[11] = 0;

  Class v5 = v3[16];
  v3[16] = 0;

  Class v6 = v3[21];
  v3[21] = 0;

  Class v7 = v3[26];
  v3[26] = 0;
}

- (void)releaseForwardWarpLinearBuffersForLevel:(int)a3
{
  unint64_t v3 = &self->super.isa + a3;
  Class v4 = v3[31];
  v3[31] = 0;

  Class v5 = v3[36];
  v3[36] = 0;
}

- (void)releaseForwardWarpInternalTextures
{
  if (self->_pyramidLevels)
  {
    unint64_t v3 = 0;
    do
      [(Synthesis *)self releaseForwardWarpTexturesForLevel:v3++];
    while (self->_pyramidLevels > v3);
  }
  filteredForwardLossTexture = self->_filteredForwardLossTexture;
  self->_filteredForwardLossTexture = 0;

  filteredBackwarLossTexture = self->_filteredBackwarLossTexture;
  self->_filteredBackwarLossTexture = 0;
}

- (void)releaseForwardWarpInternalTexturesAndBuffers
{
  if (self->_pyramidLevels)
  {
    unint64_t v3 = 0;
    do
    {
      [(Synthesis *)self releaseForwardWarpTexturesForLevel:v3];
      [(Synthesis *)self releaseForwardWarpLinearBuffersForLevel:v3++];
    }
    while (self->_pyramidLevels > v3);
  }
}

- (void)encodeSubsampleToCommandBuffer:(id)a3 flow:(id *)a4 loss:(id *)a5
{
  backwarp = self->_backwarp;
  id v9 = *a4;
  id v10 = a4[1];
  id v11 = a3;
  [(Backwarp *)backwarp encodeSubsampleFlowToCommandBuffer:v11 source:v9 destination:v10];
  [(Backwarp *)self->_backwarp encodeSubsampleFlowToCommandBuffer:v11 source:a4[1] destination:a4[2]];
  [(Backwarp *)self->_backwarp encodeSubsampleErrorToCommandBuffer:v11 source:*a5 destination:a5[1]];
  [(Backwarp *)self->_backwarp encodeSubsampleErrorToCommandBuffer:v11 source:a5[1] destination:a5[2]];
}

- (id)forwardLossTextureLevel:(int)a3
{
  return self->_forwardLossTexture[a3];
}

- (id)backwardLossTextureLevel:(int)a3
{
  return self->_backwardLossTexture[a3];
}

- (id)forwardFlowTextureLevel:(int)a3
{
  return self->_forwardFlowTexture[a3];
}

- (id)bestErrorBufferLevel:(int)a3
{
  return self->_bestErrorBuffer[a3];
}

- (id)warpOutputBufferLevel:(int)a3
{
  return self->_warpOutputBuffer[a3];
}

- (void)warpFeatureLevel:(int)a3 timeScale:(float)a4
{
  uint64_t v5 = *(void *)&a3;
  unint64_t v40 = 0;
  unint64_t v41 = 0;
  unint64_t v42 = 0;
  [(Synthesis *)self getWarpedFeatureSizeForLevel:*(void *)&a3 tensorSize:&v40];
  unint64_t v7 = v42;
  uint64_t v8 = (id *)(&self->super.isa + (int)v5);
  id v9 = v8[46];
  id v23 = v8[51];
  BOOL v10 = isBufferCopyNecessaryForCVtoTextureConversion(v40, v41, v42);
  int64_t fullWarpStartLevel = self->_fullWarpStartLevel;
  context = (void *)MEMORY[0x1E01A5320]();
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[(int)v5], self->_device, 1, v7);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v8[21];
  id v13 = v8[11];
  uint64_t v14 = v35[5];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__Synthesis_warpFeatureLevel_timeScale___block_invoke;
  v32[3] = &unk_1E6CA4588;
  BOOL v33 = v10;
  v32[4] = &v34;
  *(float *)&double v15 = a4;
  [(Synthesis *)self forwardWarpForLevel:v5 feature:v9 flow:v12 error:v13 timeScale:v14 warpedOutput:fullWarpStartLevel <= (int)v5 fullWarp:v15 callback:v32];
  uint64_t v16 = (int)v5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[(int)v5], self->_device, 1, v7);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v8[26];
  id v18 = v8[16];
  *(float *)&double v19 = 1.0 - a4;
  uint64_t v20 = v27[5];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__Synthesis_warpFeatureLevel_timeScale___block_invoke_2;
  v24[3] = &unk_1E6CA4588;
  BOOL v25 = v10;
  v24[4] = &v26;
  [(Synthesis *)self forwardWarpForLevel:v5 feature:v23 flow:v17 error:v18 timeScale:v20 warpedOutput:fullWarpStartLevel <= (int)v5 fullWarp:v19 callback:v24];
  if (v10)
  {
    v21 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    copyTextureToBufferWithBlit((void *)v35[5], self->_warpedForwardFeatures[self->_bufferIndex].features[v16], self->_device, v21);
    copyTextureToBufferWithBlit((void *)v27[5], self->_warpedBackwardFeatures[self->_bufferIndex].features[v16], self->_device, v21);
    [v21 commit];
    [v21 waitUntilScheduled];
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v34, 8);
}

void __40__Synthesis_warpFeatureLevel_timeScale___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v2 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = 0;
  }
}

void __40__Synthesis_warpFeatureLevel_timeScale___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v2 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = 0;
  }
}

- (void)warpFeaturesPerLayerWithFlowForward:(__CVBuffer *)a3 flowBackward:(__CVBuffer *)a4 timeScale:(float)a5
{
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  uint64_t v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  id v9 = self->_forwardFlowTexture[1];
  self->_forwardFlowTexture[1] = v8;

  createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  BOOL v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  id v11 = self->_backwardFlowTexture[1];
  self->_backwardFlowTexture[1] = v10;

  id v18 = self->_firstFeatures.features[self->_pyramidLevels];
  id v12 = self->_secondFeatures.features[self->_pyramidLevels];
  id v13 = (void *)MEMORY[0x1E01A5320]();
  *(float *)&double v14 = a5;
  [(Synthesis *)self calcBackwarpLossFirst:v18 second:v12 timeScale:v14];
  uint64_t v16 = self->_synthesisMode == 1;
  if (self->_synthesisMode == 1) {
    unsigned int v17 = 4;
  }
  else {
    unsigned int v17 = 3;
  }
  do
  {
    *(float *)&double v15 = a5;
    [(Synthesis *)self warpFeatureLevel:v16 timeScale:v15];
    uint64_t v16 = (v16 + 1);
  }
  while (v16 < v17);
}

- (void)calcBackwarpLossFirst:(id)a3 second:(id)a4 timeScale:(float)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v9 enqueue];
  *(float *)&double v10 = a5;
  [(Backwarp *)self->_backwarp encodeBackwarpLossToCommandBuffer:v9 first:v18 second:v8 flow:self->_forwardFlowTexture[1] timeScale:self->_forwardLossTexture[1] destination:v10];
  *(float *)&double v11 = 1.0 - a5;
  [(Backwarp *)self->_backwarp encodeBackwarpLossToCommandBuffer:v9 first:v8 second:v18 flow:self->_backwardFlowTexture[1] timeScale:self->_backwardLossTexture[1] destination:v11];
  if (self->_pyramidLevels >= 3)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = &self->super.isa + v12;
      [(Backwarp *)self->_backwarp encodeSubsampleErrorToCommandBuffer:v9 source:v13[12] destination:v13[13]];
      [(Backwarp *)self->_backwarp encodeSubsampleErrorToCommandBuffer:v9 source:v13[17] destination:v13[18]];
      unint64_t v14 = v12 + 3;
      ++v12;
    }
    while (self->_pyramidLevels > v14);
  }
  if (self->_synthesisMode == 1)
  {
    [(Backwarp *)self->_backwarp encodeUpscaleErrorToCommandBuffer:v9 source:self->_forwardLossTexture[1] destination:self->_forwardLossTexture[0]];
    [(Backwarp *)self->_backwarp encodeUpscaleErrorToCommandBuffer:v9 source:self->_backwardLossTexture[1] destination:self->_backwardLossTexture[0]];
  }
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v9 source:self->_forwardFlowTexture[1] destination:self->_forwardFlowTexture[0]];
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v9 source:self->_backwardFlowTexture[1] destination:self->_backwardFlowTexture[0]];
  if (self->_pyramidLevels >= 3)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = &self->super.isa + v15;
      [(Backwarp *)self->_backwarp encodeSubsampleFlowToCommandBuffer:v9 source:v16[22] destination:v16[23]];
      [(Backwarp *)self->_backwarp encodeSubsampleFlowToCommandBuffer:v9 source:v16[27] destination:v16[28]];
      unint64_t v17 = v15 + 3;
      ++v15;
    }
    while (self->_pyramidLevels > v17);
  }
  kdebug_trace();
  [v9 addCompletedHandler:&__block_literal_global_0];
  [v9 commit];
}

uint64_t __52__Synthesis_calcBackwarpLossFirst_second_timeScale___block_invoke()
{
  return kdebug_trace();
}

- (void)forwardWarpForLevel:(int)a3 feature:(id)a4 flow:(id)a5 error:(id)a6 timeScale:(float)a7 warpedOutput:(id)a8 fullWarp:(BOOL)a9 callback:(id)a10
{
  BOOL v10 = a9;
  id v18 = a10;
  commandQueue = self->_commandQueue;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  uint64_t v24 = [(MTLCommandQueue *)commandQueue commandBuffer];
  *(float *)&double v25 = a7;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v24 input:v23 flow:v22 error:v21 timeScale:v10 fullWarp:self->_bestErrorBuffer[a3] bestError:v25 output:self->_warpOutputBuffer[a3] destination:v20];

  kdebug_trace();
  if (v18)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__Synthesis_forwardWarpForLevel_feature_flow_error_timeScale_warpedOutput_fullWarp_callback___block_invoke;
    v26[3] = &unk_1E6CA4198;
    id v27 = v18;
    [v24 addCompletedHandler:v26];
  }
  [v24 commit];
  if (self->_pyramidLevels - 1 == a3) {
    [v24 waitUntilScheduled];
  }
  kdebug_trace();
}

uint64_t __93__Synthesis_forwardWarpForLevel_feature_flow_error_timeScale_warpedOutput_fullWarp_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forwardWarpForLevel:(int)a3 first:(id)a4 second:(id)a5 timeScale:(float)a6 forwardOutput:(id)a7 backwardOutput:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  commandQueue = self->_commandQueue;
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v22 = [(MTLCommandQueue *)commandQueue commandBuffer];
  double v19 = &self->super.isa + (int)v12;
  *(float *)&double v20 = a6;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v22 input:v18 flow:v19[21] error:v19[11] timeScale:(int)v12 > 0 fullWarp:v19[31] bestError:v20 output:v19[36] destination:v16];

  *(float *)&double v21 = a6;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v22 input:v17 flow:v19[26] error:v19[16] timeScale:(int)v12 > 0 fullWarp:v19[31] bestError:v21 output:v19[36] destination:v15];

  [v22 commit];
  [v22 waitUntilCompleted];
  [(Synthesis *)self releaseFeaturesForLevel:v12];
}

- (void)synthesizeFrameFromFeatureForward:(id *)a3 backward:(id *)a4 destination:(__CVBuffer *)a5 callback:(id)a6
{
  [(SynthesisGridNet *)self->_gridNet synthesizeFrameFromFeatureForward:a3 backward:a4 destination:a5 pyramidStartLevel:self->_synthesisMode == 1 callback:a6];
}

- (void)allocateFeatures
{
  unint64_t pyramidLevels = self->_pyramidLevels;
  unint64_t v4 = pyramidLevels + 1;
  if (self->_synthesisMode == 3)
  {
    unint64_t v5 = pyramidLevels + 2;
    if (self->_twoLayerFlowSplatting) {
      unint64_t v4 = v5;
    }
  }
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
      [(Synthesis *)self allocateFeaturesForUsage:self->_usage Level:i];
  }
}

- (int)twoLayerFlowSplattingFeatureLevelForLevel:(int)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 == 1) {
    return 0;
  }
  if ((unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) >> 12 > 0x7E8) {
    return 2;
  }
  if (self->_twoLayerQuarterSizeDC) {
    return 2;
  }
  return 1;
}

- (void)allocateFeaturesForUsage:(int64_t)a3 Level:(int)a4
{
  __int16 v5 = a3;
  if (self->_synthesisMode == 3)
  {
    if (self->_fullSizeSplatting)
    {
      int flowLevel = 0;
    }
    else if (self->_twoLayerFlowSplatting)
    {
      int flowLevel = [(Synthesis *)self twoLayerFlowSplattingFeatureLevelForLevel:*(void *)&a4];
    }
    else
    {
      int flowLevel = self->_flowLevel;
    }
  }
  else if (self->_pyramidLevels <= a4)
  {
    int flowLevel = 1;
  }
  else
  {
    int flowLevel = a4;
  }
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  getSynthesisTensorSize(v5, flowLevel, &v14);
  id v13 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:v14 height:v15 mipmapped:0];
  [v13 setUsage:3];
  [v13 setTextureType:3];
  [v13 setArrayLength:v16];
  uint64_t v8 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v13];
  id v9 = &self->super.isa + a4;
  Class v10 = v9[46];
  v9[46] = (Class)v8;

  uint64_t v11 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v13];
  Class v12 = v9[51];
  v9[51] = (Class)v11;
}

- (void)releaseFeaturesForLevel:(int)a3
{
  unint64_t v3 = &self->super.isa + a3;
  Class v4 = v3[46];
  v3[46] = 0;

  Class v5 = v3[51];
  v3[51] = 0;
}

- (void)getWarpedFeatureSizeForLevel:(int)a3 tensorSize:(id *)a4
{
  int v5 = a3 - 1;
  if (a3 >= 1 && self->_synthesisMode == 1)
  {
    __int16 QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
    getSynthesisTensorSize(QuarterSizeUsage, v5, &a4->var0);
  }
  else
  {
    -[Synthesis synthesisTensorSizeForLevel:](self, "synthesisTensorSizeForLevel:");
    *(_OWORD *)&a4->var0 = v7;
    a4->var2 = v8;
  }
}

- (void)allocateWarpedFeatures
{
  unint64_t numTiles = self->_numTiles;
  if (!numTiles)
  {
    unint64_t numTiles = 3;
    if (!self->_framePipeline) {
      unint64_t numTiles = 1;
    }
  }
  LODWORD(v4) = 0;
  self->_numWarpedBuffers = numTiles;
  unint64_t pyramidLevels = self->_pyramidLevels;
  do
  {
    if (pyramidLevels)
    {
      for (unint64_t i = 0; i < pyramidLevels; ++i)
      {
        if (self->_synthesisMode == 3)
        {
          if (self->_fullSizeSplatting) {
            unint64_t flowLevel = 0;
          }
          else {
            unint64_t flowLevel = self->_flowLevel;
          }
        }
        else
        {
          unint64_t flowLevel = i;
        }
        size_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        [(Synthesis *)self getWarpedFeatureSizeForLevel:flowLevel tensorSize:&v11];
        uint64_t v8 = v13;
        if (self->_synthesisMode == 2) {
          uint64_t v8 = v13 + 1;
        }
        int64_t v9 = v8 + self->_useFlowConsistencyMap;
        self->_warpedFeatureChannels = v9;
        Class v10 = (char *)self + 40 * v4 + 8 * i;
        *((void *)v10 + 56) = createPixelBuffer(v11, v12 * v9, 0x4C303068u, 0);
        *((void *)v10 + 71) = createPixelBuffer(v11, v12 * v9, 0x4C303068u, 0);
        unint64_t pyramidLevels = self->_pyramidLevels;
      }
      unint64_t numTiles = self->_numWarpedBuffers;
    }
    unint64_t v4 = (v4 + 1);
  }
  while (numTiles > v4);
}

- (void)releaseWarpedFeaturesForIndex:(unint64_t)a3
{
  if (self->_pyramidLevels)
  {
    unint64_t v4 = 0;
    int v5 = (char *)self + 40 * a3;
    do
    {
      Class v6 = &v5[8 * v4];
      CVPixelBufferRelease(*((CVPixelBufferRef *)v6 + 56));
      CVPixelBufferRelease(*((CVPixelBufferRef *)v6 + 71));
      ++v4;
    }
    while (self->_pyramidLevels > v4);
  }
}

- (__CVBuffer)synthesizeFrameForTimeScale:(float)a3 frameIndex:(unint64_t)a4
{
  return -[Synthesis synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:](self, "synthesizeFrameFromFirstImage:secondImage:flowForward:flowBackward:timeScale:frameIndex:", self->_normalizedFirst, self->_normalizedSecond, self->_forwardFlow, self->_backwardFlow, a4);
}

- (__CVBuffer)synthesizeFrameFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 frameIndex:(unint64_t)a8
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (self->_tilingEnabled) {
    return -[Synthesis synthesizeTilesWithTimeScale:](self, "synthesizeTilesWithTimeScale:", a3, a4, a5, a6, a8, *(double *)&a7);
  }
  CVPixelBufferPoolCreatePixelBuffer(0, self->_normalizedBufferPool, &pixelBufferOut);
  self->_bufferIndex = a8 % self->_numWarpedBuffers;
  unint64_t synthesisMode = self->_synthesisMode;
  if (synthesisMode == 3)
  {
    *(float *)&double v16 = a7;
    [(Synthesis *)self synthesizeImageWithFlowSplattingFromFirstImage:a3 secondImage:a4 flowForward:a5 flowBackward:a6 timeScale:pixelBufferOut destination:v16];
  }
  else
  {
    *(float *)&double v16 = a7;
    if (synthesisMode == 2) {
      [(Synthesis *)self synthesizeImageWithForwarpOnlyFromFirstImage:a3 secondImage:a4 flowForward:a5 flowBackward:a6 timeScale:pixelBufferOut destination:v16];
    }
    else {
      [(Synthesis *)self synthesizeImageFromFirstImage:a3 secondImage:a4 flowForward:a5 flowBackward:a6 timeScale:pixelBufferOut destination:v16];
    }
  }
  return pixelBufferOut;
}

- (void)createFeaturesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  self->_forwardFlow = CVPixelBufferRetain(a5);
  self->_backwardFlow = CVPixelBufferRetain(a6);
  self->_normalizedFirst = CVPixelBufferRetain(a3);
  self->_normalizedSecond = CVPixelBufferRetain(a4);
  if (self->_synthesisMode == 3)
  {
    if (!self->_fullSizeSplatting) {
      [(Synthesis *)self createSubsampledInputsFromFirstFrame:a3 secondImage:a4];
    }
    size_t Width = CVPixelBufferGetWidth(a5);
    if (Width != [(MTLTexture *)self->_forwardLossTexture[0] width]) {
      [(Synthesis *)self upscaleFlowsForward:a5 backward:a6];
    }
  }
  if (self->_useFlowConsistencyMap) {
    [(Synthesis *)self createConsistencyMapFormFirstImage:a3 secondImage:a4 flowForward:a5 flowBackward:a6];
  }
  if (self->_pyramidLevels != 1)
  {
    if (self->_tilingEnabled)
    {
      [(Synthesis *)self createTilesFromFirstImage:a3 secondImage:a4 flowForward:a5 flowBackward:a6];
      CVPixelBufferRelease(a3);
      CVPixelBufferRelease(a4);
    }
    else
    {
      [(Synthesis *)self createFeaturePyramid:a3 second:a4];
    }
  }
}

- (void)releaseFeatures
{
  if (self->_tilingEnabled) {
    [(Synthesis *)self releaseTiles];
  }
  CVPixelBufferRelease(self->_forwardFlow);
  CVPixelBufferRelease(self->_backwardFlow);
  if (self->_pyramidLevels == 1)
  {
    CVPixelBufferRelease(self->_normalizedFirst);
    CVPixelBufferRelease(self->_normalizedSecond);
  }
  *(_OWORD *)&self->_forwardFlow = 0u;
  *(_OWORD *)&self->_normalizedFirst = 0u;
}

- (void)createFeaturePyramid:(__CVBuffer *)a3 second:(__CVBuffer *)a4
{
  kdebug_trace();
  long long v7 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  uint64_t v8 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  int64_t v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v9 enqueue];
  [(Pyramid *)self->_pyramid encodeResiduePyramidToCommandBuffer:v9 fromTexture:v7 toTexture:&self->_firstFeatures levels:self->_pyramidLevels];
  [(Pyramid *)self->_pyramid encodeResiduePyramidToCommandBuffer:v9 fromTexture:v8 toTexture:&self->_secondFeatures levels:self->_pyramidLevels];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__Synthesis_createFeaturePyramid_second___block_invoke;
  v10[3] = &unk_1E6CA45D0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  [v9 addCompletedHandler:v10];
  [v9 commit];
  [v9 waitUntilScheduled];
}

uint64_t __41__Synthesis_createFeaturePyramid_second___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 962))
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  }
  return kdebug_trace();
}

- (void)synthesizeImageFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  if (self->_tilingEnabled) {
    [(Synthesis *)self createFeaturePyramid:a3 second:a4];
  }
  *(float *)&double v13 = a7;
  [(Synthesis *)self warpFeaturesPerLayerWithFlowForward:a5 flowBackward:a6 timeScale:v13];
  CVPixelBufferRef v25 = 0;
  CVPixelBufferRef pixelBufferOut = a8;
  unint64_t v14 = a8;
  if (self->_synthesisMode <= 1)
  {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_dcBufferPool, &pixelBufferOut);
    unint64_t v14 = pixelBufferOut;
  }
  [(Synthesis *)self synthesizeFrameFromFeatureForward:&self->_warpedForwardFeatures[self->_bufferIndex] backward:&self->_warpedBackwardFeatures[self->_bufferIndex] destination:v14 callback:&__block_literal_global_42];
  unint64_t synthesisMode = self->_synthesisMode;
  if (synthesisMode)
  {
    if (synthesisMode == 1)
    {
      CVPixelBufferRef v17 = pixelBufferOut;
      *(float *)&double v15 = a7;
      [(Synthesis *)self warpFeatureLevel:0 timeScale:v15];
      if (self->_temporalFiltering)
      {
        CVPixelBufferPoolCreatePixelBuffer(0, self->_dcBufferPool, &v25);
        CVPixelBufferRef v17 = v25;
        *(float *)&double v19 = a7;
        [(Synthesis *)self filterGridNetOutput:pixelBufferOut timeScale:v25 destination:v19];
        CVPixelBufferRef v20 = v25;
        LODWORD(v18) = 0.5;
        if (self->_temporalFiltering) {
          *(float *)&double v18 = a7;
        }
      }
      else
      {
        CVPixelBufferRef v20 = 0;
        LODWORD(v18) = 0.5;
      }
      double v21 = self->_warpedForwardFeatures[self->_bufferIndex].features[0];
      id v22 = self->_warpedBackwardFeatures[self->_bufferIndex].features[0];
      pyramid = self->_pyramid;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __102__Synthesis_synthesizeImageFromFirstImage_secondImage_flowForward_flowBackward_timeScale_destination___block_invoke_2;
      v24[3] = &__block_descriptor_48_e5_v8__0l;
      v24[4] = pixelBufferOut;
      void v24[5] = v20;
      [(Pyramid *)pyramid blendWarpedResidueForward:v21 backward:v22 withGridNetOutput:v17 timeScale:a8 destination:v24 callback:v18];
    }
  }
  else if (self->_temporalFiltering)
  {
    *(float *)&double v15 = a7;
    [(Synthesis *)self filterGridNetOutput:pixelBufferOut timeScale:a8 destination:v15];
    CVPixelBufferRelease(pixelBufferOut);
  }
}

void __102__Synthesis_synthesizeImageFromFirstImage_secondImage_flowForward_flowBackward_timeScale_destination___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
  uint64_t v2 = *(__CVBuffer **)(a1 + 40);
  CVPixelBufferRelease(v2);
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  int64_t QuarterSizeUsage = a3;
  self->_originalUsage = a3;
  if (self->_tilingEnabled) {
    int64_t QuarterSizeUsage = [(Synthesis *)self usageForTiling:a3];
  }
  self->_int64_t usage = QuarterSizeUsage;
  self->_int64_t fullWarpStartLevel = 1;
  self->_filterErrorMap = 0;
  unint64_t synthesisMode = self->_synthesisMode;
  if (synthesisMode == 1)
  {
    self->_unint64_t pyramidLevels = 4;
    int64_t QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
    if (!self->_temporalFiltering)
    {
      char v7 = 1;
      self->_int64_t fullWarpStartLevel = 1;
      goto LABEL_17;
    }
    self->_int64_t fullWarpStartLevel = 4;
LABEL_15:
    char v7 = 1;
    goto LABEL_17;
  }
  if (synthesisMode == 2)
  {
LABEL_8:
    unint64_t v6 = 1;
    goto LABEL_9;
  }
  if (synthesisMode != 3)
  {
    self->_unint64_t pyramidLevels = 3;
    goto LABEL_15;
  }
  if (!self->_twoLayerFlowSplatting) {
    goto LABEL_8;
  }
  unint64_t v6 = 2;
LABEL_9:
  self->_unint64_t pyramidLevels = v6;
  if (self->_linearSplatting) {
    self->_filterErrorMap = 1;
  }
  char v7 = 0;
  self->_framePipeline = 0;
  int64_t QuarterSizeUsage = 1;
LABEL_17:
  uint64_t v8 = [[Forwarp alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue mode:self->_synthesisMode];
  forwarp = self->_forwarp;
  self->_forwarp = v8;

  Class v10 = self->_forwarp;
  if (v10)
  {
    [(Forwarp *)v10 setLinearSplatting:self->_linearSplatting];
    if (self->_framePipeline) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v7;
    }
    self->_frameSyncRequired = v11;
    if (self->_useFlowConsistencyMap && !self->_flowConsisteny)
    {
      uint64_t v12 = [[FlowConsistencyMap alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue];
      flowConsisteny = self->_flowConsisteny;
      self->_flowConsisteny = v12;
    }
    if (self->_synthesisMode > 1) {
      return 1;
    }
    unint64_t v14 = [[SynthesisGridNet alloc] initWithMode:QuarterSizeUsage];
    gridNet = self->_gridNet;
    self->_gridNet = v14;

    if (self->_gridNet) {
      return 1;
    }
    NSLog(&cfstr_FailedToCreate_6.isa);
  }
  else
  {
    NSLog(&cfstr_FailedToCreate_4.isa);
  }
  return 0;
}

- (void)setTilingEnabled:(BOOL)a3
{
  self->_tilingEnabled = a3;
  if (a3) {
    self->_tiling = [[Tiling alloc] initWithDevice:self->_device commmandQueue:self->_commandQueue];
  }
  else {
    self->_tiling = 0;
  }
  MEMORY[0x1F41817F8]();
}

- (int64_t)usageForTiling:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return -1;
  }
  int64_t result = a3 + 100;
  self->_unint64_t numTiles = dword_1DC85A77C[a3];
  return result;
}

- (void)createTilesFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  CVPixelBufferRef v25 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = (void *)MEMORY[0x1E01A5320](self, a2);
  tiling = self->_tiling;
  size_t Width = CVPixelBufferGetWidth(a3);
  uint64_t v12 = [(Tiling *)tiling createTileInfoArrayForFrameWithWidth:Width height:CVPixelBufferGetHeight(a3) / 3 numTiles:self->_numTiles];
  uint64_t v24 = (uint64_t)&v24;
  self->_imageTileInfo = v12;
  double v13 = (char *)&v24 - ((24 * self->_numTiles + 15) & 0x3FFFFFFFF0);
  uint64_t numTiles = self->_numTiles;
  if (numTiles)
  {
    double v15 = (uint64x2_t *)(v13 + 16);
    p_var2 = &self->_imageTileInfo->var2;
    do
    {
      v15[-1] = vshrq_n_u64(*((uint64x2_t *)p_var2 - 1), 1uLL);
      unint64_t v17 = *p_var2;
      p_var2 += 3;
      v15->i64[0] = v17 >> 1;
      double v15 = (uint64x2_t *)((char *)v15 + 24);
      --numTiles;
    }
    while (numTiles);
    unint64_t v18 = 0;
    outputTiles = self->_outputTiles;
    uint64_t v20 = 8;
    do
    {
      *(outputTiles - 12) = createPixelBuffer(*(void *)((char *)self->_imageTileInfo + v20 - 8), 3 * *(unint64_t *)((char *)&self->_imageTileInfo->var0 + v20), 0x4C303068u, 0);
      *(outputTiles - 9) = createPixelBuffer(*(void *)((char *)self->_imageTileInfo + v20 - 8), 3 * *(unint64_t *)((char *)&self->_imageTileInfo->var0 + v20), 0x4C303068u, 0);
      size_t v21 = *(void *)&v13[v20 - 8];
      size_t v22 = 2 * *(void *)&v13[v20];
      *(outputTiles - 6) = createPixelBuffer(v21, v22, 0x4C303068u, 0);
      *(outputTiles - 3) = createPixelBuffer(v21, v22, 0x4C303068u, 0);
      -[Synthesis allocateOutputTile:tileInfo:](self, "allocateOutputTile:tileInfo:", outputTiles, (char *)self->_imageTileInfo + v20 - 8, v24);
      ++v18;
      v20 += 24;
      ++outputTiles;
    }
    while (v18 < self->_numTiles);
  }
  kdebug_trace();
  id v23 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v23 enqueue];
  [(Tiling *)self->_tiling encodeTileBufferToCommandBuffer:v23 from:a3 to:self->_firstImageTiles channels:3 tileInfo:self->_imageTileInfo numTiles:self->_numTiles];
  [(Tiling *)self->_tiling encodeTileBufferToCommandBuffer:v23 from:a4 to:self->_secondImageTiles channels:3 tileInfo:self->_imageTileInfo numTiles:self->_numTiles];
  [(Tiling *)self->_tiling encodeTileBufferToCommandBuffer:v23 from:a5 to:self->_forwardFlowTiles channels:2 tileInfo:v13 numTiles:self->_numTiles];
  [(Tiling *)self->_tiling encodeTileBufferToCommandBuffer:v23 from:v25 to:self->_backwardFlowTiles channels:2 tileInfo:v13 numTiles:self->_numTiles];
  [v23 addCompletedHandler:&__block_literal_global_53];
  [v23 commit];
}

uint64_t __76__Synthesis_createTilesFromFirstImage_secondImage_flowForward_flowBackward___block_invoke()
{
  return kdebug_trace();
}

- (void)releaseTiles
{
  if (self->_numTiles)
  {
    unint64_t v3 = 0;
    firstImageTiles = self->_firstImageTiles;
    do
    {
      CVPixelBufferRelease(*firstImageTiles);
      CVPixelBufferRelease(firstImageTiles[3]);
      CVPixelBufferRelease(firstImageTiles[6]);
      CVPixelBufferRelease(firstImageTiles[9]);
      CVPixelBufferRelease(firstImageTiles[12]);
      ++v3;
      ++firstImageTiles;
    }
    while (v3 < self->_numTiles);
  }
  free(self->_imageTileInfo);
  self->_imageTileInfo = 0;
}

- (void)allocateOutputTile:(__CVBuffer *)a3 tileInfo:(id *)a4
{
  *a3 = createPixelBuffer(a4->var0, 3 * a4->var1, 0x4C303068u, 0);
}

- (__CVBuffer)synthesizeTilesWithTimeScale:(float)a3
{
  if (self->_numTiles)
  {
    unint64_t v5 = 0;
    firstImageTiles = self->_firstImageTiles;
    do
    {
      self->_bufferIndex = v5;
      *(float *)&double v7 = a3;
      [(Synthesis *)self synthesizeImageFromFirstImage:*firstImageTiles secondImage:firstImageTiles[3] flowForward:firstImageTiles[6] flowBackward:firstImageTiles[9] timeScale:firstImageTiles[12] destination:v7];
      ++v5;
      ++firstImageTiles;
    }
    while (v5 < self->_numTiles);
  }
  uint64_t v10 = 0;
  size_t v11 = 0;
  FRCGetAlignedInputFrameSizeForUsage(self->_originalUsage, (uint64_t *)&v11, &v10);
  PixelBuffer = createPixelBuffer(v11, 3 * v10, 0x4C303068u, 0);
  [(Tiling *)self->_tiling assembleTiles:self->_outputTiles to:PixelBuffer tileInfo:self->_imageTileInfo numTiles:self->_numTiles];
  return PixelBuffer;
}

- (void)encodeForwarpToCommandBuffer:(id)a3 level:(int)a4 firstTexture:(id)a5 secondTexture:(id)a6 firstWarpedTexture:(id)a7 secondWarpedTexture:(id)a8 timeScale:(float)a9 useFlowMagnitude:(BOOL)a10
{
  id v49 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  BOOL linearSplatting = self->_linearSplatting;
  forwarp = self->_forwarp;
  v48 = v20;
  if (a10)
  {
    LODWORD(v21) = 1051931443;
    [(Forwarp *)forwarp setErrorTolerance:v21];
    [(Forwarp *)self->_forwarp setLimitBilinearInterpolation:0];
    if (self->_linearSplatting) {
      float v27 = 0.03;
    }
    else {
      float v27 = 3.4028e38;
    }
    uint64_t v28 = a4;
    v29 = &self->super.isa + a4;
    if (linearSplatting) {
      *(float *)&double v24 = 1.0;
    }
    else {
      *(float *)&double v24 = a9;
    }
    if (linearSplatting) {
      float v30 = 1.0;
    }
    else {
      float v30 = 1.0 - a9;
    }
    LODWORD(v25) = 1050253722;
    *(float *)&double v26 = v27;
    [(Backwarp *)self->_backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:v49 first:v17 second:v18 flow:v29[21] timeScale:v29[11] gamma:v24 protectionThreshold:v25 destination:v26];
    *(float *)&double v31 = v30;
    LODWORD(v32) = 1050253722;
    *(float *)&double v33 = v27;
    [(Backwarp *)self->_backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:v49 first:v18 second:v17 flow:v29[26] timeScale:v29[16] gamma:v31 protectionThreshold:v32 destination:v33];
  }
  else
  {
    LODWORD(v21) = 1028443341;
    [(Forwarp *)forwarp setErrorTolerance:v21];
    [(Forwarp *)self->_forwarp setLimitBilinearInterpolation:0];
    uint64_t v28 = a4;
    uint64_t v35 = &self->super.isa + a4;
    if (linearSplatting) {
      *(float *)&double v34 = 1.0;
    }
    else {
      *(float *)&double v34 = a9;
    }
    if (linearSplatting) {
      float v36 = 1.0;
    }
    else {
      float v36 = 1.0 - a9;
    }
    [(Backwarp *)self->_backwarp encodeBackwarpLossToCommandBuffer:v49 first:v17 second:v18 flow:v35[21] timeScale:v35[11] destination:v34];
    *(float *)&double v37 = v36;
    [(Backwarp *)self->_backwarp encodeBackwarpLossToCommandBuffer:v49 first:v18 second:v17 flow:v35[26] timeScale:v35[16] destination:v37];
  }
  v38 = self->_forwardLossTexture[v28];
  id v39 = self->_backwardLossTexture[v28];
  if (self->_filterErrorMap)
  {
    unint64_t v41 = self->_filteredForwardLossTexture;

    id v47 = v18;
    id v42 = v17;
    id v43 = v19;
    v44 = self->_filteredBackwarLossTexture;

    [(Forwarp *)self->_forwarp encodeErrorMapFilteringToCommandBuffer:v49 source:self->_forwardLossTexture[v28] destination:v41];
    [(Forwarp *)self->_forwarp encodeErrorMapFilteringToCommandBuffer:v49 source:self->_backwardLossTexture[v28] destination:v44];
    v38 = v41;
    id v39 = v44;
    id v19 = v43;
    id v17 = v42;
    id v18 = v47;
  }
  v45 = &self->super.isa + v28;
  *(float *)&double v40 = a9;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v49 input:v17 flow:v45[21] error:v38 timeScale:1 fullWarp:v45[31] bestError:v40 output:v45[36] destination:v19];
  *(float *)&double v46 = 1.0 - a9;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v49 input:v18 flow:v45[26] error:v39 timeScale:1 fullWarp:v45[31] bestError:v46 output:v45[36] destination:v48];
}

- (void)synthesizeImageWithForwarpOnlyFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  secondForwarpInputWithConsistencyMap = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  uint64_t v15 = createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  double v16 = createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  id v17 = createTexturesFromCVPixelBuffer(a8, self->_device, 1, 3uLL);
  id v18 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v18 enqueue];
  uint64_t v28 = (void *)v15;
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v18 source:v15 destination:self->_forwardFlowTexture[0]];
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v18 source:v16 destination:self->_backwardFlowTexture[0]];
  id v19 = createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  id v20 = createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  v29 = secondForwarpInputWithConsistencyMap;
  if (self->_useFlowConsistencyMap)
  {
    double v21 = self->_firstForwarpInputWithConsistencyMap;
    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  else
  {
    double v21 = (MTLTexture *)v30;
  }
  id v22 = secondForwarpInputWithConsistencyMap;
  [(Forwarp *)self->_forwarp setCreateOcclusionMask:1];
  LOBYTE(v27) = !self->_useFlowConsistencyMap;
  *(float *)&double v23 = a7;
  [(Synthesis *)self encodeForwarpToCommandBuffer:v18 level:0 firstTexture:v21 secondTexture:v22 firstWarpedTexture:v19 secondWarpedTexture:v20 timeScale:v23 useFlowMagnitude:v27];
  [(Forwarp *)self->_forwarp encodeErrorMapDilationToCommandBuffer:v18 forwardSource:v19 backwardSource:v20 forwardDestination:self->_dilatedForwardMask backwardDestination:self->_dilatedBackwardMask minimumAdjacentHoleCount:3 maximumHoleValue:0.0];
  if (self->_useFlowConsistencyMap)
  {
    double v25 = objc_msgSend(v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 3, 1);
    double v26 = objc_msgSend(v20, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 3, 1);
  }
  else
  {
    double v26 = 0;
    double v25 = 0;
  }
  *(float *)&double v24 = a7;
  [(Forwarp *)self->_forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:v18 first:v19 second:v20 forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:self->_dilatedBackwardMask forwarpConsistency:v25 backwardConsistency:v24 timeScale:v26 destination:v17];
  [v18 commit];
  [v18 waitUntilScheduled];
}

- (void)createSubsampledInputsFromFirstFrame:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4
{
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  double v7 = self->_firstFeatures.features[0];
  commandQueue = self->_commandQueue;
  int64_t v9 = self->_secondFeatures.features[0];
  uint64_t v10 = v7;
  size_t v11 = [(MTLCommandQueue *)commandQueue commandBuffer];
  [v11 enqueue];
  [(Backwarp *)self->_backwarp encodeSubsampleInputToCommandBufferr:v11 source:v12 destination:v10];
  [(Backwarp *)self->_backwarp encodeSubsampleInputToCommandBufferr:v11 source:v6 destination:v9];

  [v11 commit];
}

- (void)upscaleFlowsForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4
{
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  double v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v7 enqueue];
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v7 source:v8 destination:self->_forwardFlowTexture[0]];
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v7 source:v6 destination:self->_backwardFlowTexture[0]];
  [v7 commit];
}

- (void)synthesizeImageWithFlowSplattingFromFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  LODWORD(v15) = 1028443341;
  [(Forwarp *)self->_forwarp setErrorTolerance:v15];
  [(Forwarp *)self->_forwarp setLimitBilinearInterpolation:1];
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  v65 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  size_t Width = CVPixelBufferGetWidth(a5);
  if (Width == [(MTLTexture *)self->_forwardFlowTexture[0] width])
  {
    createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
    id v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
    id v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = self->_forwardFlowTexture[0];
    id v19 = self->_backwardFlowTexture[0];
  }
  id v20 = v19;
  uint64_t v59 = createTexturesFromCVPixelBuffer(a8, self->_device, 1, 3uLL);
  double v21 = v65;
  if (!self->_fullSizeSplatting) {
    double v21 = self->_firstFeatures.features[0];
  }
  id v22 = v21;
  double v23 = (MTLTexture *)v16;
  if (!self->_fullSizeSplatting) {
    double v23 = self->_secondFeatures.features[0];
  }
  double v24 = v23;
  double v25 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v25 enqueue];
  if (self->_fullSizeSplatting)
  {
    [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v25 source:v18 destination:self->_forwardFlowTexture[0]];
    [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v25 source:v20 destination:self->_backwardFlowTexture[0]];
    v29 = self->_forwardFlowTexture[0];

    id v30 = self->_backwardFlowTexture[0];
    id v20 = v30;
    id v18 = v29;
  }
  LODWORD(v26) = 1.0;
  LODWORD(v27) = 1008981770;
  LODWORD(v28) = 2139095039;
  [(Backwarp *)self->_backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:v25 first:v22 second:v24 flow:v18 timeScale:self->_forwardLossTexture[0] gamma:v26 protectionThreshold:v27 destination:v28];
  LODWORD(v31) = 1.0;
  LODWORD(v32) = 1008981770;
  LODWORD(v33) = 2139095039;
  [(Backwarp *)self->_backwarp encodeBackwarpLossWithFlowMagnitudeToCommandBuffer:v25 first:v24 second:v22 flow:v20 timeScale:self->_backwardLossTexture[0] gamma:v31 protectionThreshold:v32 destination:v33];
  v60 = v24;
  if (self->_useFlowConsistencyMap)
  {
    v63 = self->_firstForwarpInputWithConsistencyMap;
    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  else
  {
    v63 = v18;
    secondForwarpInputWithConsistencyMap = v20;
  }
  v64 = secondForwarpInputWithConsistencyMap;
  uint64_t v35 = self->_forwardLossTexture[0];
  float v36 = self->_backwardLossTexture[0];
  v61 = v22;
  double v37 = (void *)v16;
  if (self->_filterErrorMap)
  {
    v38 = self->_filteredForwardLossTexture;

    id v39 = self->_filteredBackwarLossTexture;
    [(Forwarp *)self->_forwarp encodeErrorMapFilteringToCommandBuffer:v25 source:self->_forwardLossTexture[0] destination:v38];
    [(Forwarp *)self->_forwarp encodeErrorMapFilteringToCommandBuffer:v25 source:self->_backwardLossTexture[0] destination:v39];
    float v36 = v39;
    uint64_t v35 = v38;
  }
  double v40 = createTexturesFromCVPixelBuffer(self->_warpedForwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  unint64_t v41 = createTexturesFromCVPixelBuffer(self->_warpedBackwardFeatures[self->_bufferIndex].features[0], self->_device, 1, self->_warpedFeatureChannels);
  [(Forwarp *)self->_forwarp setCreateOcclusionMask:1];
  *(float *)&double v42 = a7;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v25 input:v63 flow:v18 error:v35 timeScale:1 fullWarp:self->_bestErrorBuffer[0] bestError:v42 output:self->_warpOutputBuffer[0] destination:v40];
  *(float *)&double v43 = 1.0 - a7;
  [(Forwarp *)self->_forwarp encodeToCommandBuffer:v25 input:v64 flow:v20 error:v36 timeScale:1 fullWarp:self->_bestErrorBuffer[0] bestError:v43 output:self->_warpOutputBuffer[0] destination:v41];
  [(Forwarp *)self->_forwarp encodeErrorMapDilationToCommandBuffer:v25 forwardSource:v40 backwardSource:v41 forwardDestination:self->_dilatedForwardMask backwardDestination:self->_dilatedBackwardMask minimumAdjacentHoleCount:3 maximumHoleValue:0.0];
  v62 = v18;
  if (self->_useFlowConsistencyMap)
  {
    v45 = objc_msgSend(v40, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 2, 1);
    double v46 = objc_msgSend(v41, "newTextureViewWithPixelFormat:textureType:levels:slices:", 25, 2, 0, 1, 2, 1);
  }
  else
  {
    v45 = 0;
    double v46 = 0;
  }
  if (self->_pyramidLevels == 1)
  {
    if (self->_useFusedKernel)
    {
      forwarp = self->_forwarp;
      dilatedForwardMask = self->_dilatedForwardMask;
      dilatedBackwardMask = self->_dilatedBackwardMask;
      v50 = (void *)v59;
      *(float *)&double v44 = a7;
      [(Forwarp *)forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:v25 first:v65 second:v37 forwardFlow:v40 backwardFlow:v41 forwardErrorMap:dilatedForwardMask backwardErrorMap:v44 forwarpConsistency:dilatedBackwardMask backwardConsistency:0 timeScale:0 destination:v59];
    }
    else
    {
      *(float *)&double v44 = a7;
      [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v25 source:v65 flow:v40 timeScale:self->_firstWarpedTexture destination:v44];
      *(float *)&double v52 = 1.0 - a7;
      [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v25 source:v37 flow:v41 timeScale:self->_secondWarpedTexture destination:v52];
      v53 = self->_forwarp;
      firstWarpedTexture = self->_firstWarpedTexture;
      secondWarpedTexture = self->_secondWarpedTexture;
      v56 = self->_dilatedForwardMask;
      v57 = self->_dilatedBackwardMask;
      v50 = (void *)v59;
      *(float *)&double v58 = a7;
      [(Forwarp *)v53 encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:v25 first:firstWarpedTexture second:secondWarpedTexture forwardErrorMap:v56 backwardErrorMap:v57 forwarpConsistency:v45 backwardConsistency:v58 timeScale:v46 destination:v59];
    }
  }
  else
  {
    v51 = self;
    *(float *)&double v44 = a7;
    v50 = (void *)v59;
    [(Synthesis *)v51 encodeWarpPyramidToCommandBuffer:v25 forwardFlow:v40 backwardFlow:v41 forwarpConsistency:v45 backwardConsistency:v46 timeScale:v59 destination:v44];
  }
  [v25 commit];
  [v25 waitUntilScheduled];
}

- (void)encodeForwarpInputsForBlendToCommandBuffer:(id)a3 timeScale:(float)a4
{
  id v11 = a3;
  if (self->_synthesisMode == 1)
  {
    unint64_t v6 = self->_firstFeatures.features[4];
    double v7 = self->_secondFeatures.features[4];
    uint64_t v8 = 1;
  }
  else
  {
    createTexturesFromCVPixelBuffer(self->_normalizedFirst, self->_device, 1, 3uLL);
    unint64_t v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    createTexturesFromCVPixelBuffer(self->_normalizedSecond, self->_device, 1, 3uLL);
    double v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = 0;
  }
  [(Forwarp *)self->_forwarp setCreateOcclusionMask:1];
  LOBYTE(v10) = 0;
  *(float *)&double v9 = a4;
  [(Synthesis *)self encodeForwarpToCommandBuffer:v11 level:v8 firstTexture:v6 secondTexture:v7 firstWarpedTexture:self->_firstWarpedTexture secondWarpedTexture:self->_secondWarpedTexture timeScale:v9 useFlowMagnitude:v10];
  [(Forwarp *)self->_forwarp encodeErrorMapDilationToCommandBuffer:v11 forwardSource:self->_firstWarpedTexture backwardSource:self->_secondWarpedTexture forwardDestination:self->_dilatedForwardMask backwardDestination:self->_dilatedBackwardMask minimumAdjacentHoleCount:3 maximumHoleValue:0.0];
  [(Forwarp *)self->_forwarp setCreateOcclusionMask:0];
}

- (void)filterGridNetOutput:(__CVBuffer *)a3 timeScale:(float)a4 destination:(__CVBuffer *)a5
{
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = createTexturesFromCVPixelBuffer(a5, self->_device, 1, 3uLL);
  double v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v9 enqueue];
  *(float *)&double v10 = a4;
  [(Synthesis *)self encodeForwarpInputsForBlendToCommandBuffer:v9 timeScale:v10];
  LODWORD(v11) = 1045220557;
  *(float *)&double v12 = a4;
  [(Forwarp *)self->_forwarp encodeBlendTexturesToCommandBuffer:v9 firstWarpedTexture:self->_firstWarpedTexture secondWarpedTexture:self->_secondWarpedTexture forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:self->_dilatedBackwardMask synthesizedTexture:v13 timeScale:v12 synthesizedImageWeight:v11 destination:v8];
  [v9 commit];
  [v9 waitUntilScheduled];
}

- (void)createConsistencyMapFormFirstImage:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
  double v11 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  uint64_t v12 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  id v13 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  unint64_t v14 = createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  double v15 = createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  double v28 = (void *)v12;
  if (self->_synthesisMode == 3) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = (void *)v12;
  }
  id v17 = v16;
  if (self->_synthesisMode == 3) {
    id v18 = v15;
  }
  else {
    id v18 = v13;
  }
  id v19 = v18;
  uint64_t v20 = [v17 width];
  uint64_t v21 = [v17 height];
  unint64_t v22 = [v17 arrayLength] + 1;
  if (!self->_firstForwarpInputWithConsistencyMap)
  {
    createTextures(self->_device, v20, v21, 1, v22);
    double v23 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    firstForwarpInputWithConsistencyMap = self->_firstForwarpInputWithConsistencyMap;
    self->_firstForwarpInputWithConsistencyMap = v23;
  }
  secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  if (!secondForwarpInputWithConsistencyMap)
  {
    createTextures(self->_device, v20, v21, 1, v22);
    double v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    double v27 = self->_secondForwarpInputWithConsistencyMap;
    self->_secondForwarpInputWithConsistencyMap = v26;

    secondForwarpInputWithConsistencyMap = self->_secondForwarpInputWithConsistencyMap;
  }
  [(Synthesis *)self encodeConsistencyMapCreationWithFlowToCommandBuffer:v11 firstSource:v17 secondSource:v19 forwardFlow:v14 backwardFlow:v15 firstForwarpInput:self->_firstForwarpInputWithConsistencyMap secondForwarpInput:secondForwarpInputWithConsistencyMap];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85__Synthesis_createConsistencyMapFormFirstImage_secondImage_flowForward_flowBackward___block_invoke;
  v29[3] = &unk_1E6CA4510;
  v29[4] = self;
  [v11 addCompletedHandler:v29];
  [v11 commit];
  [v11 waitUntilScheduled];
}

void __85__Synthesis_createConsistencyMapFormFirstImage_secondImage_flowForward_flowBackward___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 968))
  {
    [*(id *)(v1 + 952) maxConsistency];
    NSLog(&cfstr_SynthesisMaxFl.isa, v2);
  }
}

- (void)encodeConsistencyMapCreationWithFlowToCommandBuffer:(id)a3 firstSource:(id)a4 secondSource:(id)a5 forwardFlow:(id)a6 backwardFlow:(id)a7 firstForwarpInput:(id)a8 secondForwarpInput:(id)a9
{
  id v30 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v28 = a5;
  uint64_t v20 = [v18 arrayLength] - 1;
  uint64_t v21 = [v15 width];
  uint64_t v22 = [v16 width];
  v29 = objc_msgSend(v18, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v18, "pixelFormat"), 2, 0, 1, v20, 1);
  double v23 = objc_msgSend(v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v18, "pixelFormat"), 2, 0, 1, v20, 1);
  if (v21 == v22)
  {
    id v24 = v29;
    id v25 = v23;
    [(FlowConsistencyMap *)self->_flowConsisteny encodeToCommandBuffer:v30 forwardFlow:v16 backwardFlow:v17 forwardConsistencyMap:v24 backwardConsistencyMap:v25];
  }
  else
  {
    createTextures(self->_device, [v16 width], objc_msgSend(v16, "height"), 1, 1uLL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    createTextures(self->_device, [v16 width], objc_msgSend(v16, "height"), 1, 1uLL);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    [(FlowConsistencyMap *)self->_flowConsisteny encodeToCommandBuffer:v30 forwardFlow:v16 backwardFlow:v17 forwardConsistencyMap:v24 backwardConsistencyMap:v25];
    [(FlowConsistencyMap *)self->_flowConsisteny encodeMapUpscalingToCommandBuffer:v30 source:v24 detination:v29];
    [(FlowConsistencyMap *)self->_flowConsisteny encodeMapUpscalingToCommandBuffer:v30 source:v25 detination:v23];
  }
  uint64_t v26 = [v15 arrayLength];
  double v27 = [v30 blitCommandEncoder];
  [v27 copyFromTexture:v15 sourceSlice:0 sourceLevel:0 toTexture:v18 destinationSlice:0 destinationLevel:0 sliceCount:v26 levelCount:1];
  [v27 copyFromTexture:v28 sourceSlice:0 sourceLevel:0 toTexture:v19 destinationSlice:0 destinationLevel:0 sliceCount:v26 levelCount:1];

  [v27 endEncoding];
}

- (void)encodeWarpPyramidToCommandBuffer:(id)a3 forwardFlow:(id)a4 backwardFlow:(id)a5 forwarpConsistency:(id)a6 backwardConsistency:(id)a7 timeScale:(float)a8 destination:(id)a9
{
  id v31 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v21 = self->_firstFeatures.features[3];
  uint64_t v22 = self->_secondFeatures.features[3];
  double v23 = self->_firstFeatures.features[2];
  *(float *)&double v24 = a8;
  if (self->_useFusedKernel)
  {
    [(Forwarp *)self->_forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:v31 first:v23 second:self->_secondFeatures.features[2] forwardFlow:v16 backwardFlow:v17 forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:v24 forwarpConsistency:self->_dilatedBackwardMask backwardConsistency:v18 timeScale:v19 destination:self->_blendedDCTexture];
  }
  else
  {
    [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v31 source:v23 flow:v16 timeScale:v21 destination:v24];
    *(float *)&double v25 = 1.0 - a8;
    [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v31 source:self->_secondFeatures.features[2] flow:v17 timeScale:v22 destination:v25];
    *(float *)&double v26 = a8;
    [(Forwarp *)self->_forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:v31 first:v21 second:v22 forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:self->_dilatedBackwardMask forwarpConsistency:v18 backwardConsistency:v26 timeScale:v19 destination:self->_blendedDCTexture];
  }
  [(Pyramid *)self->_pyramid encode3x3GaussianFilterToCommandBuffer:v31 source:self->_blendedDCTexture destination:self->_filteredDCTexture];
  double v27 = self->_firstFeatures.features[1];
  *(float *)&double v28 = a8;
  if (self->_useFusedKernel)
  {
    [(Forwarp *)self->_forwarp encodeWarpAndBlendFeaturesWithErrorMaskToCommandBuffer:v31 first:v27 second:self->_secondFeatures.features[1] forwardFlow:v16 backwardFlow:v17 forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:v28 forwarpConsistency:self->_dilatedBackwardMask backwardConsistency:v18 timeScale:v19 destination:v20];
  }
  else
  {
    [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v31 source:v27 flow:v16 timeScale:self->_firstWarpedTexture destination:v28];
    *(float *)&double v29 = 1.0 - a8;
    [(Backwarp *)self->_backwarp encodeFlowSplattingWarpToCommandBuffer:v31 source:self->_secondFeatures.features[1] flow:v17 timeScale:self->_secondWarpedTexture destination:v29];
    *(float *)&double v30 = a8;
    [(Forwarp *)self->_forwarp encodeBlendWarpedFeaturesWithErrorMaskToCommandBuffer:v31 first:self->_firstWarpedTexture second:self->_secondWarpedTexture forwardErrorMap:self->_dilatedForwardMask backwardErrorMap:self->_dilatedBackwardMask forwarpConsistency:v18 backwardConsistency:v30 timeScale:v19 destination:v20];
  }
  [(Pyramid *)self->_pyramid encodeLayerBlendToCommandBuffer:v31 baseLayer:self->_filteredDCTexture toDestination:v20];
}

- (void)upscaleForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 upscaledForwardFlow:(__CVBuffer *)a5 upscaledBackwardFlow:(__CVBuffer *)a6
{
  id v15 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  double v11 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  uint64_t v12 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  id v13 = createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  unint64_t v14 = createTexturesFromCVPixelBuffer(a6, self->_device, 1, 2uLL);
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v15 source:v11 destination:v13];
  [(Backwarp *)self->_backwarp encodeUpscaleFlowToCommandBuffer:v15 source:v12 destination:v14];
  [v15 commit];
  [v15 waitUntilScheduled];
}

- (BOOL)tilingEnabled
{
  return self->_tilingEnabled;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_int64_t usage = a3;
}

- (BOOL)framePipeline
{
  return self->_framePipeline;
}

- (void)setFramePipeline:(BOOL)a3
{
  self->_framePipeline = a3;
}

- (unint64_t)synthesisMode
{
  return self->_synthesisMode;
}

- (void)setSynthesisMode:(unint64_t)a3
{
  self->_unint64_t synthesisMode = a3;
}

- (int)flowLevel
{
  return self->_flowLevel;
}

- (void)setFlowLevel:(int)a3
{
  self->_unint64_t flowLevel = a3;
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
  self->_BOOL linearSplatting = a3;
}

- (BOOL)useFusedKernel
{
  return self->_useFusedKernel;
}

- (void)setUseFusedKernel:(BOOL)a3
{
  self->_useFusedKernel = a3;
}

- (BOOL)frameSyncRequired
{
  return self->_frameSyncRequired;
}

- (BOOL)useFlowConsistencyMap
{
  return self->_useFlowConsistencyMap;
}

- (void)setUseFlowConsistencyMap:(BOOL)a3
{
  self->_useFlowConsistencyMap = a3;
}

- (BOOL)twoLayerFlowSplatting
{
  return self->_twoLayerFlowSplatting;
}

- (void)setTwoLayerFlowSplatting:(BOOL)a3
{
  self->_twoLayerFlowSplatting = a3;
}

- (BOOL)twoLayerQuarterSizeDC
{
  return self->_twoLayerQuarterSizeDC;
}

- (void)setTwoLayerQuarterSizeDC:(BOOL)a3
{
  self->_twoLayerQuarterSizeDC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowConsisteny, 0);
  objc_storeStrong((id *)&self->_filteredDCTexture, 0);
  objc_storeStrong((id *)&self->_blendedDCTexture, 0);
  objc_storeStrong((id *)&self->_secondWarpedTexture, 0);
  objc_storeStrong((id *)&self->_firstWarpedTexture, 0);
  objc_storeStrong((id *)&self->_dilatedBackwardMask, 0);
  objc_storeStrong((id *)&self->_dilatedForwardMask, 0);
  objc_storeStrong((id *)&self->_tiling, 0);
  for (uint64_t i = 0; i != 5; ++i)

  for (uint64_t j = 0; j != 5; ++j)
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_secondForwarpInputWithConsistencyMap, 0);
  objc_storeStrong((id *)&self->_firstForwarpInputWithConsistencyMap, 0);
  objc_storeStrong((id *)&self->_filteredBackwarLossTexture, 0);
  objc_storeStrong((id *)&self->_filteredForwardLossTexture, 0);
  for (uint64_t k = 0; k != -5; --k)
    objc_storeStrong((id *)&self->_warpOutputBuffer[k + 4], 0);
  for (uint64_t m = 0; m != -5; --m)
    objc_storeStrong((id *)&self->_bestErrorBuffer[m + 4], 0);
  for (uint64_t n = 0; n != -5; --n)
    objc_storeStrong((id *)&self->_backwardFlowTexture[n + 4], 0);
  for (iuint64_t i = 0; ii != -5; --ii)
    objc_storeStrong((id *)&self->_forwardFlowTexture[ii + 4], 0);
  for (juint64_t j = 0; jj != -5; --jj)
    objc_storeStrong((id *)&self->_backwardLossTexture[jj + 4], 0);
  for (kuint64_t k = 0; kk != -5; --kk)
    objc_storeStrong((id *)&self->_forwardLossTexture[kk + 4], 0);
  objc_storeStrong((id *)&self->_pyramid, 0);
  objc_storeStrong((id *)&self->_gridNet, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_forwarp, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end