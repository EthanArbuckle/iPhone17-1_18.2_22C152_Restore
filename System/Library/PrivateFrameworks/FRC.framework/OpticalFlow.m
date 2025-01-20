@interface OpticalFlow
+ (BOOL)use4xDownScale:(int64_t)a3;
- ($2B7190B9495AC8840DAD8324B3694CED)storages;
- ($6BD85E8A05A9A99EBA8D4F18A81F03F3)imageFeatures;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)featureSizeForLevel:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)flowSizeForLevel:(SEL)a3;
- (BOOL)adaptationLayerOnly;
- (BOOL)concurrentDualFlowProcessing;
- (BOOL)createBaseLayer;
- (BOOL)createModules;
- (BOOL)disableOutputFlowScaling;
- (BOOL)skipLastLevel;
- (BOOL)switchUsageTo:(int64_t)a3;
- (BOOL)twoStageFlow;
- (BOOL)useAdaptationLayer;
- (BOOL)waitForCompletion;
- (Backwarp)backwarp;
- (MTLDevice)device;
- (OpticalFlow)init;
- (OpticalFlow)initWithMode:(int64_t)a3;
- (int)numLevels;
- (int64_t)revision;
- (unint64_t)downsampling;
- (unint64_t)flowHeight;
- (unint64_t)flowWidth;
- (void)adaptFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 inputFlow:(__CVBuffer *)a6 outputFlow:(__CVBuffer *)a7;
- (void)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4 extractor:(id)a5;
- (void)allocateFeatureBuffers:(id *)a3;
- (void)allocateImageFeature:(id *)a3 extractor:(id)a4;
- (void)allocateIntermediateStageStorage:(id *)a3 baseStage:(BOOL)a4;
- (void)allocateIntermediateStorage:(id *)a3;
- (void)allocateResources;
- (void)dealloc;
- (void)estimateFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputFlow:(__CVBuffer *)a6;
- (void)estimateFlowLevel:(unsigned int)a3 withEstimator:(id *)a4 firstFeatures:(id *)a5 secondFeatures:(id *)a6 correlation:(__CVBuffer *)a7 upscaledFlow:(__CVBuffer *)a8 warpedImage:(__CVBuffer *)a9 prevFlow:(__CVBuffer *)a10 outputFlow:(__CVBuffer *)a11 waitForComplete:(BOOL)a12;
- (void)estimateStageFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 baseStage:(BOOL)a6 startLevel:(int)a7 lastLevel:(int)a8 startFlow:(__CVBuffer *)a9 outputFlow:(__CVBuffer *)a10;
- (void)estimateTwoWayFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputForwardFlow:(__CVBuffer *)a6 outputBackwardFlow:(__CVBuffer *)a7;
- (void)extractFeaturesFromFirst:(__CVBuffer *)a3 second:(__CVBuffer *)a4;
- (void)extractFeaturesFromImage:(__CVBuffer *)a3 outputFeatures:(id *)a4;
- (void)flowAdaptationFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 inputFlowForward:(__CVBuffer *)a5 inputFlowBackward:(__CVBuffer *)a6 outputFlowForward:(__CVBuffer *)a7 outputFlowBackward:(__CVBuffer *)a8;
- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flow:(__CVBuffer *)a5;
- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6;
- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 reUseFlow:(BOOL)a7;
- (void)postProcessFlow:(__CVBuffer *)a3 outputFlow:(__CVBuffer *)a4;
- (void)predictFowardFlow:(__CVBuffer *)a3 fromBackwardFlow:(__CVBuffer *)a4;
- (void)releaseFeatureBuffers:(id *)a3;
- (void)releaseImageFeature:(id *)a3;
- (void)releaseIntermediateStageStorage:(id *)a3;
- (void)releaseIntermediateStorage:(id *)a3;
- (void)releaseResources;
- (void)releaseUnusedFeatures:(id *)a3;
- (void)reshuffleFlow:(__CVBuffer *)a3 previsouFlow:(__CVBuffer *)a4 destination:(__CVBuffer *)a5;
- (void)setAdaptationLayerOnly:(BOOL)a3;
- (void)setConcurrentDualFlowProcessing:(BOOL)a3;
- (void)setDisableOutputFlowScaling:(BOOL)a3;
- (void)setDownsampling:(unint64_t)a3;
- (void)setNetworkClasses;
- (void)setRevision:(int64_t)a3;
- (void)setSkipLastLevel:(BOOL)a3;
- (void)setTwoStageFlow:(BOOL)a3;
- (void)setUseAdaptationLayer:(BOOL)a3;
- (void)setWaitForCompletion:(BOOL)a3;
- (void)subsampleInput:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forUsage:(int64_t)a5;
- (void)updateFlowSize;
- (void)upscaleInputFlow:(__CVBuffer *)a3 outFlow:(__CVBuffer *)a4;
@end

@implementation OpticalFlow

- (void)setNetworkClasses
{
  self->_featureExtractorClass = (Class)objc_opt_class();
  self->_flowEstimatorClass = (Class)objc_opt_class();
  self->_adaptationFeatureExtractorClass = (Class)objc_opt_class();
  self->_adaptationDecoderClass = (Class)objc_opt_class();
}

- (OpticalFlow)init
{
  return [(OpticalFlow *)self initWithMode:-1];
}

- (OpticalFlow)initWithMode:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)OpticalFlow;
  v4 = [(OpticalFlow *)&v17 init];
  [(OpticalFlow *)v4 setNetworkClasses];
  v4->_revision = 1;
  [(objc_class *)v4->_flowEstimatorClass setNumLevels:[(objc_class *)v4->_featureExtractorClass numLevels]];
  v4->_twoStageFlow = 0;
  v4->_usage = a3;
  if ([(OpticalFlow *)v4 createModules])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    flowEstimateSemaphore = v4->_flowEstimateSemaphore;
    v4->_flowEstimateSemaphore = (OS_dispatch_semaphore *)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    completionSemaphore = v4->_completionSemaphore;
    v4->_completionSemaphore = (OS_dispatch_semaphore *)v7;

    uint64_t v9 = [(MTLDevice *)v4->_device newCommandQueue];
    commandQueue = v4->_commandQueue;
    v4->_commandQueue = (MTLCommandQueue *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    dispatchGroup = v4->_dispatchGroup;
    v4->_dispatchGroup = (OS_dispatch_group *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("Main Concurrent Task Queue", MEMORY[0x1E4F14430]);
    concurrentQueue = v4->_concurrentQueue;
    v4->_concurrentQueue = (OS_dispatch_queue *)v13;

    v4->_upscaleFinalFlow = 0;
    v4->_waitForCompletion = 1;
    if (v4->_usage != -1) {
      [(OpticalFlow *)v4 updateFlowSize];
    }
    v15 = v4;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateFlowSize
{
  p_unint64_t flowWidth = &self->_flowWidth;
  p_unint64_t flowHeight = &self->_flowHeight;
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&self->_flowWidth, (uint64_t *)&self->_flowHeight);
  if (self->_upscaleFinalFlow)
  {
    if (!self->_4xUpscale) {
      return;
    }
    *p_flowWidth *= 2;
    uint64_t v5 = 2 * *p_flowHeight;
  }
  else
  {
    unint64_t flowWidth = self->_flowWidth;
    self->_unint64_t flowWidth = flowWidth >> 1;
    unint64_t flowHeight = self->_flowHeight;
    self->_unint64_t flowHeight = flowHeight >> 1;
    if (!self->_skipLastLevel) {
      return;
    }
    unint64_t *p_flowWidth = flowWidth >> 2;
    uint64_t v5 = flowHeight >> 2;
  }
  unint64_t *p_flowHeight = v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)OpticalFlow;
  [(OpticalFlow *)&v2 dealloc];
}

- (BOOL)createModules
{
  self->_numLevels = [(objc_class *)self->_featureExtractorClass numLevels];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  uint64_t v5 = [[Correlation alloc] initWithDevice:self->_device interleaved:0];
  correlation = self->_correlation;
  self->_correlation = v5;

  if (!self->_correlation) {
    return 0;
  }
  dispatch_semaphore_t v7 = [[Backwarp alloc] initWithDevice:self->_device interleaved:0];
  backwarp = self->_backwarp;
  self->_backwarp = v7;

  return self->_backwarp != 0;
}

- (void)setTwoStageFlow:(BOOL)a3
{
  self->_twoStageFlow = a3;
}

- (void)allocateIntermediateStorage:(id *)a3
{
  [(OpticalFlow *)self allocateIntermediateStageStorage:a3 baseStage:0];
  if (self->_twoStageFlow)
  {
    [(OpticalFlow *)self allocateIntermediateStageStorage:&a3->var1 baseStage:1];
  }
}

- (void)allocateIntermediateStageStorage:(id *)a3 baseStage:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  a3->var5 = self->_numLevels;
  if (a4) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 0;
  }
  if (a4)
  {
    *(_OWORD *)a3->var1 = 0u;
    *(_OWORD *)a3->var2 = 0u;
    *(_OWORD *)a3->var3 = 0u;
    *(_OWORD *)a3->var0 = 0u;
  }
  else if (self->_useAdaptationLayer)
  {
    size_t v22 = 0;
    size_t v23 = 0;
    uint64_t v24 = 0;
    [(FlowAdaptationFeatureExtractor *)self->_adaptationFeatureExtractor getOutputTensorSize:&v22 level:0];
    v5->var4 = createPixelBuffer(v22, 8 * v23, 0x4C303068u, 0);
  }
  LODWORD(numLevels) = self->_numLevels;
  if (v7 < numLevels)
  {
    unint64_t v9 = v7;
    v21 = v5;
    v10 = &v5->var0[v7];
    do
    {
      BOOL useAdaptationLayer = self->_useAdaptationLayer;
      BOOL v12 = v9 == 0;
      uint64_t v13 = 40;
      if (v12 && useAdaptationLayer) {
        uint64_t v13 = 152;
      }
      if (v4) {
        uint64_t v13 = 96;
      }
      id v14 = *(id *)((char *)&self->super.isa + v13);
      size_t v22 = 0;
      size_t v23 = 0;
      uint64_t v24 = 0;
      [v14 getOutputTensorSize:&v22 level:v9];
      if (v12 && useAdaptationLayer) {
        size_t v15 = v22;
      }
      else {
        size_t v15 = 128;
      }
      if (v12 && useAdaptationLayer) {
        size_t v16 = v23;
      }
      else {
        size_t v16 = 8;
      }
      if (v9 >= 2) {
        size_t v17 = v22;
      }
      else {
        size_t v17 = v15;
      }
      if (v9 >= 2) {
        size_t v18 = v23;
      }
      else {
        size_t v18 = v16;
      }
      v10[12] = createPixelBuffer(v17, v18, 0x32433068u, 0);
      v10[18] = createPixelBuffer(v22, v24 * v23, 0x4C303068u, 0);
      if (self->_resourcePreAllocated) {
        [(OpticalFlow *)self allocateCorreleationBuffer:v10 forLevel:v9 extractor:v14];
      }

      ++v9;
      unint64_t numLevels = self->_numLevels;
      ++v10;
    }
    while (v9 < numLevels);
    uint64_t v5 = v21;
  }
  if (v7 < numLevels)
  {
    if (v4) {
      uint64_t v19 = 96;
    }
    else {
      uint64_t v19 = 40;
    }
    do
    {
      v20 = *(Class *)((char *)&self->super.isa + v19);
      size_t v22 = 0;
      size_t v23 = 0;
      uint64_t v24 = 0;
      objc_msgSend(v20, "getOutputTensorSize:level:", &v22, v7, v21);
      v5->var1[v7++] = createPixelBuffer(v22, v23, 0x32433068u, 0);
    }
    while (v7 < self->_numLevels);
  }
}

- (void)releaseIntermediateStorage:(id *)a3
{
  -[OpticalFlow releaseIntermediateStageStorage:](self, "releaseIntermediateStageStorage:");
  if (self->_twoStageFlow)
  {
    [(OpticalFlow *)self releaseIntermediateStageStorage:&a3->var1];
  }
}

- (void)releaseIntermediateStageStorage:(id *)a3
{
  CVPixelBufferRelease(a3->var4);
  if (self->_numLevels)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = &a3->var0[v5];
      CVPixelBufferRelease(*v6);
      CVPixelBufferRelease(v6[6]);
      CVPixelBufferRelease(v6[12]);
      CVPixelBufferRelease(v6[18]);
      ++v5;
    }
    while (v5 < self->_numLevels);
  }
}

- (void)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4 extractor:(id)a5
{
  size_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  objc_msgSend(a5, "getOutputTensorSize:level:", &v9);
  if (a4 <= 1 && (a4 || !self->_useAdaptationLayer)) {
    uint64_t v8 = v11 + 83;
  }
  else {
    uint64_t v8 = 81;
  }
  *a3 = createPixelBuffer(v9, v10 * v8, 0x4C303068u, 0);
}

- (void)allocateFeatureBuffers:(id *)a3
{
  if (self->_useAdaptationLayer)
  {
    [(FlowAdaptationFeatureExtractor *)self->_adaptationFeatureExtractor getOutputTensorSize:&a3->var0.var4 level:0];
    a3->var0.var3 = createPixelBuffer(a3->var0.var4.var0, a3->var0.var4.var2 * a3->var0.var4.var1, 0x4C303068u, 0);
  }
  uint64_t v5 = 0;
  size_t v6 = 0;
  if (self->_downsampling)
  {
    FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&v6, &v5);
    a3->var2 = createPixelBuffer(v6, 3 * v5, 0x4C303068u, 0);
  }
  if (!self->_adaptationLayerOnly)
  {
    [(OpticalFlow *)self allocateImageFeature:a3 extractor:self->_featureExtractor];
    if (self->_twoStageFlow)
    {
      [(OpticalFlow *)self allocateImageFeature:&a3->var1 extractor:self->_baseFeatureExtractor];
      FRCGetInputFrameSizeForUsage(self->_baseStageUsage, (uint64_t *)&v6, &v5);
      a3->var3 = createPixelBuffer(v6, 3 * v5, 0x4C303068u, 0);
    }
  }
}

- (void)allocateImageFeature:(id *)a3 extractor:(id)a4
{
  a3->var0 = self->_numLevels;
  if (self->_numLevels)
  {
    unint64_t v6 = 0;
    var2 = a3->var2;
    var1 = a3->var1;
    do
    {
      [a4 getOutputTensorSize:var2 level:v6];
      var1[v6++] = createPixelBuffer(var2->var0, var2->var2 * var2->var1, 0x4C303068u, 0);
      ++var2;
    }
    while (v6 < self->_numLevels);
  }
}

- (void)releaseFeatureBuffers:(id *)a3
{
  a3->var0.var3 = 0;
  if (self->_downsampling)
  {
    CVPixelBufferRelease(a3->var2);
    a3->var2 = 0;
  }
  if (!self->_adaptationLayerOnly)
  {
    [(OpticalFlow *)self releaseImageFeature:a3];
    if (self->_twoStageFlow)
    {
      [(OpticalFlow *)self releaseImageFeature:&a3->var1];
      CVPixelBufferRelease(a3->var3);
      a3->var3 = 0;
    }
  }
}

- (void)releaseImageFeature:(id *)a3
{
  if (self->_numLevels)
  {
    unint64_t v4 = 0;
    var1 = a3->var1;
    do
    {
      CVPixelBufferRelease(var1[v4]);
      var1[v4++] = 0;
    }
    while (v4 < self->_numLevels);
  }
}

- (void)subsampleInput:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forUsage:(int64_t)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E01A5320](self, a2, a3, a4, a5);
  size_t v9 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 3uLL);
  uint64_t v10 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 3uLL);
  uint64_t v11 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [(Backwarp *)self->_backwarp encodeSubsampleInputToCommandBufferr:v11 source:v9 destination:v10];
  [v11 commit];
  [v11 waitUntilScheduled];
}

- (void)extractFeaturesFromFirst:(__CVBuffer *)a3 second:(__CVBuffer *)a4
{
  if (a3)
  {
    [(OpticalFlow *)self extractFeaturesFromImage:a3 outputFeatures:self->_features];
  }
  else
  {
    memcpy(v6, self->_features, sizeof(v6));
    memcpy(self->_features, &self->_features[1], 0x1E0uLL);
    memcpy(&self->_features[1], v6, sizeof(self->_features[1]));
  }
  [(OpticalFlow *)self extractFeaturesFromImage:a4 outputFeatures:&self->_features[1]];
}

- (void)extractFeaturesFromImage:(__CVBuffer *)a3 outputFeatures:(id *)a4
{
  var2 = a3;
  if (self->_downsampling)
  {
    var2 = a4->var2;
    [(OpticalFlow *)self subsampleInput:a3 to:var2 forUsage:self->_usage];
  }
  if (self->_useAdaptationLayer) {
    [(FlowAdaptationFeatureExtractor *)self->_adaptationFeatureExtractor extractFeaturesFromImage:var2 toFeatures:a4 callback:0];
  }
  if (!self->_adaptationLayerOnly)
  {
    [(FeatureExtractor *)self->_featureExtractor extractFeaturesFromImage:var2 toFeatures:a4 callback:0];
    if (self->_twoStageFlow)
    {
      [(OpticalFlow *)self subsampleInput:a3 to:a4->var3 forUsage:self->_baseStageUsage];
      [self->_baseFeatureExtractor extractFeaturesFromImage:a4->var3 toFeatures:&a4->var1 callback:0];
    }
    if (!self->_resourcePreAllocated && self->_twoStageFlow)
    {
      [(OpticalFlow *)self releaseUnusedFeatures:a4];
    }
  }
}

- (void)estimateFlowLevel:(unsigned int)a3 withEstimator:(id *)a4 firstFeatures:(id *)a5 secondFeatures:(id *)a6 correlation:(__CVBuffer *)a7 upscaledFlow:(__CVBuffer *)a8 warpedImage:(__CVBuffer *)a9 prevFlow:(__CVBuffer *)a10 outputFlow:(__CVBuffer *)a11 waitForComplete:(BOOL)a12
{
  unint64_t var2 = a6->var2[a3].var2;
  BOOL v36 = a3 == 0 && self->_useAdaptationLayer;
  int v17 = a3 > 1 || v36;
  if (v36) {
    uint64_t v18 = 4 * var2;
  }
  else {
    uint64_t v18 = a6->var2[a3].var2;
  }
  if (a3 == 0 && self->_useAdaptationLayer) {
    p_var3 = &a5->var3;
  }
  else {
    p_var3 = &a5->var1[a3];
  }
  if (a3 == 0 && self->_useAdaptationLayer) {
    v20 = &a6->var3;
  }
  else {
    v20 = &a6->var1[a3];
  }
  commandQueue = self->_commandQueue;
  if (v17) {
    unint64_t v22 = 81;
  }
  else {
    unint64_t v22 = (var2 + 83);
  }
  size_t v23 = [(MTLCommandQueue *)commandQueue commandBuffer];
  v35 = p_var3;
  uint64_t v24 = *v20;
  v41 = createTexturesFromCVPixelBufferWithCommandBuffer(*p_var3, self->_device, v23, 1, v18);
  v25 = createTexturesFromCVPixelBufferWithCommandBuffer(v24, self->_device, v23, 1, v18);
  v38 = a8;
  v26 = createTexturesFromCVPixelBufferWithCommandBuffer(a8, self->_device, v23, 2, 2uLL);
  v40 = a7;
  v27 = createTexturesFromCVPixelBufferWithCommandBuffer(a7, self->_device, v23, 1, v22);
  v39 = v25;
  if (self->_numLevels - 1 == a3)
  {
    id v28 = v25;

    v26 = 0;
    v29 = 0;
    v30 = a9;
  }
  else
  {
    v29 = createTexturesFromCVPixelBufferWithCommandBuffer(a10, self->_device, v23, 2, 2uLL);
    v30 = a9;
    createTexturesFromCVPixelBufferWithCommandBuffer(a9, self->_device, v23, 1, v18);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v17) {
      v31 = v26;
    }
    else {
      v31 = v27;
    }
    [(Backwarp *)self->_backwarp encodeToCommandBuffer:v23 source:v39 flow:v29 destination:v28 upscaledFlow:v31];
  }
  [(Correlation *)self->_correlation encodeToCommandBuffer:v23 first:v41 second:v28 destination:v27];
  if (isBufferCopyNecessaryForCVtoTextureConversion([v28 width], objc_msgSend(v28, "height"), objc_msgSend(v28, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v28, v30, self->_device, v23);
  }
  if (isBufferCopyNecessaryForCVtoTextureConversion([v27 width], objc_msgSend(v27, "height"), objc_msgSend(v27, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v27, v40, self->_device, v23);
  }
  if (v26
    && isBufferCopyNecessaryForCVtoTextureConversion([v26 width], objc_msgSend(v26, "height"), objc_msgSend(v26, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v26, v38, self->_device, v23);
  }
  kdebug_trace();
  [v23 commit];
  [v23 waitUntilScheduled];
  kdebug_trace();

  if (v36) {
    v32 = a10;
  }
  else {
    v32 = v38;
  }
  v33 = *v35;
  id v34 = a4[a3];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __149__OpticalFlow_estimateFlowLevel_withEstimator_firstFeatures_secondFeatures_correlation_upscaledFlow_warpedImage_prevFlow_outputFlow_waitForComplete___block_invoke;
  v42[3] = &unk_1E6CA4450;
  BOOL v43 = a12;
  v42[4] = self;
  [v34 estimateFlow:v33 correlation:v40 flow:v32 output:a11 callback:v42];
  if (a12) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowEstimateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __149__OpticalFlow_estimateFlowLevel_withEstimator_firstFeatures_secondFeatures_correlation_upscaledFlow_warpedImage_prevFlow_outputFlow_waitForComplete___block_invoke(intptr_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 176));
  }
  return result;
}

- (void)postProcessFlow:(__CVBuffer *)a3 outputFlow:(__CVBuffer *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  BOOL v9 = isBufferCopyNecessaryForCVtoTextureConversion(Width, Height, 1uLL);
  uint64_t v10 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  device = self->_device;
  if (v9) {
    createTexturesFromCVPixelBufferWithCommandBuffer(a3, device, v10, 2, 1uLL);
  }
  else {
  BOOL v12 = createTexturesFromCVPixelBuffer(a3, device, 2, 1uLL);
  }
  uint64_t v13 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  backwarp = self->_backwarp;
  if (self->_upscaleFinalFlow)
  {
    [(Backwarp *)backwarp encodeUpscaleFlowToCommandBuffer:v10 source:v12 destination:v13];
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(Backwarp *)backwarp encodePaddingTextureToCommandBuffer:v10 source:v12 destination:v13];
  if (v9) {
LABEL_6:
  }
    copyTextureToBufferWithBlit(v13, a4, self->_device, v10);
LABEL_7:
  if (self->_waitForCompletion)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __42__OpticalFlow_postProcessFlow_outputFlow___block_invoke;
    v15[3] = &unk_1E6CA4510;
    v15[4] = self;
    [v10 addCompletedHandler:v15];
  }
  [v10 commit];
  [v10 waitUntilScheduled];
  if (self->_waitForCompletion) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __42__OpticalFlow_postProcessFlow_outputFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 184));
}

- (void)estimateFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputFlow:(__CVBuffer *)a6
{
  BOOL skipLastLevel = self->_skipLastLevel;
  if (self->_upscaleFinalFlow
    || self->_skipLastLevel
    && (size_t Height = CVPixelBufferGetHeight(a5->var0.var1[self->_skipLastLevel]),
        Height != CVPixelBufferGetHeight(a6)))
  {
    BOOL v12 = 1;
  }
  else if (self->_useAdaptationLayer)
  {
    BOOL v12 = 0;
  }
  else
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
    BOOL v12 = PixelFormatType != CVPixelBufferGetPixelFormatType(a5->var0.var1[skipLastLevel]);
  }
  uint64_t v13 = (self->_numLevels - 1);
  if (self->_twoStageFlow)
  {
    [(OpticalFlow *)self estimateStageFlowFromFirstFeatures:&a3->var1 secondFeature:&a4->var1 storage:&a5->var1 baseStage:1 startLevel:v13 lastLevel:2 startFlow:0 outputFlow:0];
    id v14 = a5->var1.var1[2];
    uint64_t v13 = 3;
  }
  else
  {
    id v14 = 0;
  }
  if (v12) {
    size_t v16 = 0;
  }
  else {
    size_t v16 = a6;
  }
  [(OpticalFlow *)self estimateStageFlowFromFirstFeatures:a3 secondFeature:a4 storage:a5 baseStage:0 startLevel:v13 lastLevel:skipLastLevel startFlow:v14 outputFlow:v16];
  if (v12)
  {
    int v17 = a5->var0.var1[skipLastLevel];
    [(OpticalFlow *)self postProcessFlow:v17 outputFlow:a6];
  }
}

- (void)estimateStageFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 baseStage:(BOOL)a6 startLevel:(int)a7 lastLevel:(int)a8 startFlow:(__CVBuffer *)a9 outputFlow:(__CVBuffer *)a10
{
  uint64_t v13 = a10;
  if (a6) {
    uint64_t v14 = 104;
  }
  else {
    uint64_t v14 = 48;
  }
  uint64_t v15 = 40;
  if (a6) {
    uint64_t v15 = 96;
  }
  id v32 = *(id *)((char *)&self->super.isa + v15);
  if (a7 >= a8)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a7;
    v33 = (char *)self + v14;
    uint64_t v18 = a8 - (uint64_t)a7;
    int v19 = a7;
    v20 = &a5->var0[a7];
    do
    {
      if (v17 + v16) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = !self->_useAdaptationLayer;
      }
      char v22 = !v21;
      if (a10) {
        BOOL v23 = !self->_waitForCompletion;
      }
      else {
        BOOL v23 = 1;
      }
      char v25 = !v23 && v18 == v16;
      if (!self->_resourcePreAllocated) {
        [(OpticalFlow *)self allocateCorreleationBuffer:v20 forLevel:(v19 + v16) extractor:v32];
      }
      v26 = a9;
      if (v16) {
        v26 = v20[7];
      }
      p_var4 = &a5->var4;
      if ((v22 & 1) == 0)
      {
        if (a10)
        {
          id v28 = a10;
          if (v18 == v16) {
            goto LABEL_32;
          }
        }
        p_var4 = v20 + 6;
      }
      id v28 = *p_var4;
LABEL_32:
      LOBYTE(v29) = v25;
      [(OpticalFlow *)self estimateFlowLevel:(v19 + v16) withEstimator:v33 firstFeatures:a3 secondFeatures:a4 correlation:*v20 upscaledFlow:v20[12] warpedImage:v20[18] prevFlow:v26 outputFlow:v28 waitForComplete:v29];
      if (!self->_resourcePreAllocated)
      {
        CVPixelBufferRelease(*v20);
        CVPixelBufferRef *v20 = 0;
      }
      --v16;
      --v20;
    }
    while (v17 + v16 + 1 > a8);
  }
  if (!a8 && self->_useAdaptationLayer)
  {
    if (!a10) {
      uint64_t v13 = a5->var1[0];
    }
    [(OpticalFlow *)self reshuffleFlow:a5->var4 previsouFlow:a5->var1[1] destination:v13];
  }
}

- (void)adaptFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 inputFlow:(__CVBuffer *)a6 outputFlow:(__CVBuffer *)a7
{
  if (self->_upscaleFinalFlow
    || self->_skipLastLevel && (size_t Height = CVPixelBufferGetHeight(a5->var1[0]), Height != CVPixelBufferGetHeight(a7)))
  {
    v31 = a5->var1[0];
    int v30 = 1;
  }
  else
  {
    int v30 = 0;
    v31 = a7;
  }
  unint64_t var2 = a3->var4.var2;
  uint64_t v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  uint64_t v15 = createTexturesFromCVPixelBufferWithCommandBuffer(a3->var3, self->_device, v14, 1, var2);
  uint64_t v16 = createTexturesFromCVPixelBufferWithCommandBuffer(a4->var3, self->_device, v14, 1, var2);
  uint64_t v17 = createTexturesFromCVPixelBufferWithCommandBuffer(a5->var2[0], self->_device, v14, 1, 2uLL);
  uint64_t v18 = createTexturesFromCVPixelBufferWithCommandBuffer(a5->var3[0], self->_device, v14, 1, var2);
  createTexturesFromCVPixelBufferWithCommandBuffer(a5->var0[0], self->_device, v14, 1, 0x51uLL);
  uint64_t v19 = v32 = a3;
  v20 = createTexturesFromCVPixelBufferWithCommandBuffer(a6, self->_device, v14, 1, 2uLL);
  [(Backwarp *)self->_backwarp encodeToCommandBuffer:v14 source:v16 flow:v20 destination:v18 upscaledFlow:v17];
  v33 = (void *)v19;
  [(Correlation *)self->_correlation encodeToCommandBuffer:v14 first:v15 second:v18 destination:v19];
  [v14 commit];
  [v14 waitUntilScheduled];

  BOOL v21 = self->_flowEstimator[0];
  var3 = v32->var3;
  BOOL v23 = a5->var0[0];
  var4 = a5->var4;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __85__OpticalFlow_adaptFlowFromFirstFeatures_secondFeature_storage_inputFlow_outputFlow___block_invoke;
  v34[3] = &unk_1E6CA4478;
  v34[4] = self;
  [(FlowEstimate *)v21 estimateFlow:var3 correlation:v23 flow:a6 output:var4 callback:v34];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowEstimateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_resourcePreAllocated)
  {
    CVPixelBufferRelease(a5->var0[0]);
    a5->var0[0] = 0;
  }
  [(OpticalFlow *)self reshuffleFlow:a5->var4 previsouFlow:a6 destination:v31];
  if (v30)
  {
    char v25 = createTexturesFromCVPixelBuffer(v31, self->_device, 1, 2uLL);
    v26 = createTexturesFromCVPixelBuffer(pixelBuffera, self->_device, 1, 2uLL);
    backwarp = self->_backwarp;
    if (self->_upscaleFinalFlow) {
      [(Backwarp *)backwarp upscaleFlow:v25 destination:v26];
    }
    else {
      [(Backwarp *)backwarp copyTextureWithPaddingSource:v25 destination:v26];
    }
  }
}

intptr_t __85__OpticalFlow_adaptFlowFromFirstFeatures_secondFeature_storage_inputFlow_outputFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 176));
}

- (void)reshuffleFlow:(__CVBuffer *)a3 previsouFlow:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  id v12 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  BOOL v9 = createTexturesFromCVPixelBufferWithCommandBuffer(a3, self->_device, v12, 1, 8uLL);
  uint64_t v10 = createTexturesFromCVPixelBufferWithCommandBuffer(a4, self->_device, v12, 1, 2uLL);
  uint64_t v11 = createTexturesFromCVPixelBuffer(a5, self->_device, 1, 2uLL);
  [(Backwarp *)self->_backwarp encodeReShuffleFlowToCommandBuffer:v12 shuffledFlow:v9 previousFlow:v10 destination:v11];
  if (isBufferCopyNecessaryForCVtoTextureConversion([v11 width], objc_msgSend(v11, "height"), objc_msgSend(v11, "arrayLength")))
  {
    copyTextureToBufferWithBlit(v11, a5, self->_device, v12);
  }
  [v12 commit];
  [v12 waitUntilScheduled];
}

- (void)predictFowardFlow:(__CVBuffer *)a3 fromBackwardFlow:(__CVBuffer *)a4
{
  unint64_t v6 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(Backwarp *)self->_backwarp reverseFlowWithSource:v6 destination:v7];
}

- (void)estimateTwoWayFlowFromFirstFeatures:(id *)a3 secondFeature:(id *)a4 storage:(id *)a5 outputForwardFlow:(__CVBuffer *)a6 outputBackwardFlow:(__CVBuffer *)a7
{
  dispatchGroup = self->_dispatchGroup;
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke;
  block[3] = &unk_1E6CA4538;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_group_async(dispatchGroup, concurrentQueue, block);
  uint64_t v14 = self->_dispatchGroup;
  uint64_t v15 = self->_concurrentQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke_2;
  v16[3] = &unk_1E6CA4538;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = a3;
  v16[7] = a5;
  v16[8] = a7;
  dispatch_group_async(v14, v15, v16);
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) estimateFlowFromFirstFeatures:*(void *)(a1 + 40) secondFeature:*(void *)(a1 + 48) storage:*(void *)(a1 + 56) outputFlow:*(void *)(a1 + 64)];
}

uint64_t __110__OpticalFlow_estimateTwoWayFlowFromFirstFeatures_secondFeature_storage_outputForwardFlow_outputBackwardFlow___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) estimateFlowFromFirstFeatures:*(void *)(a1 + 40) secondFeature:*(void *)(a1 + 48) storage:*(void *)(a1 + 56) + 416 outputFlow:*(void *)(a1 + 64)];
}

+ (BOOL)use4xDownScale:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1D) & (0x1E040000u >> a3);
}

- (BOOL)switchUsageTo:(int64_t)a3
{
  if (self->_adaptationLayerOnly)
  {
    self->_int numLevels = [(objc_class *)self->_adaptationFeatureExtractorClass numLevels];
    self->_twoStageFlow = 0;
  }
  *(_WORD *)&self->_upscaleFinalFlow = 0;
  if (self->_downsampling != 1) {
    goto LABEL_10;
  }
  if (!self->_disableOutputFlowScaling) {
    self->_upscaleFinalFlow = 1;
  }
  uint64_t QuarterSizeUsage = getQuarterSizeUsage(a3);
  if (+[OpticalFlow use4xDownScale:a3])
  {
    uint64_t QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
    self->_4xUpscale = 1;
  }
  if (QuarterSizeUsage == a3)
  {
    NSLog(&cfstr_NoSupportFor14.isa, a3);
    self->_upscaleFinalFlow = 0;
LABEL_10:
    uint64_t QuarterSizeUsage = a3;
  }
  if (QuarterSizeUsage == self->_usage)
  {
    [(OpticalFlow *)self updateFlowSize];
    if (self->_useAdaptationLayer)
    {
      unint64_t v6 = (FlowAdaptationFeatureExtractor *)[objc_alloc(self->_adaptationFeatureExtractorClass) initWithMode:self->_usage revision:self->_revision];
      adaptationFeatureExtractor = self->_adaptationFeatureExtractor;
      self->_adaptationFeatureExtractor = v6;

      uint64_t v8 = (FlowEstimate *)[objc_alloc(self->_adaptationDecoderClass) initWithMode:self->_usage revision:self->_revision];
    }
    else
    {
      uint64_t v8 = (FlowEstimate *)[objc_alloc(self->_flowEstimatorClass) initWithMode:self->_usage level:0];
    }
    char v25 = self->_flowEstimator[0];
    self->_flowEstimator[0] = v8;

    if (self->_twoStageFlow && !self->_baseStageCreated) {
      [(OpticalFlow *)self createBaseLayer];
    }
    return 1;
  }
  self->_int64_t usage = QuarterSizeUsage;
  [(OpticalFlow *)self updateFlowSize];
  BOOL v9 = (FeatureExtractor *)[objc_alloc(self->_featureExtractorClass) initWithMode:self->_usage revision:self->_revision];
  featureExtractor = self->_featureExtractor;
  self->_featureExtractor = v9;

  if (!self->_featureExtractor) {
    return 0;
  }
  if (self->_useAdaptationLayer)
  {
    uint64_t v11 = (FlowAdaptationFeatureExtractor *)[objc_alloc(self->_adaptationFeatureExtractorClass) initWithMode:self->_usage revision:self->_revision];
    id v12 = self->_adaptationFeatureExtractor;
    self->_adaptationFeatureExtractor = v11;

    if (!self->_adaptationFeatureExtractor) {
      return 0;
    }
  }
  int numLevels = self->_numLevels;
  if (numLevels)
  {
    unint64_t v14 = 0;
    unint64_t v15 = (numLevels - self->_twoStageFlow);
    flowEstimator = self->_flowEstimator;
    do
    {
      if (v14 >= v15)
      {
        uint64_t v19 = flowEstimator[v14];
        flowEstimator[v14] = 0;
      }
      else
      {
        if (v14 || !self->_useAdaptationLayer)
        {
          id v20 = objc_alloc(self->_flowEstimatorClass);
          int64_t usage = self->_usage;
          if (v14)
          {
            uint64_t v22 = [v20 initWithMode:usage level:v14 revision:self->_revision];
            uint64_t v18 = flowEstimator[v14];
            flowEstimator[v14] = (FlowEstimate *)v22;
          }
          else
          {
            uint64_t v23 = [v20 initWithMode:usage level:0];
            uint64_t v18 = *flowEstimator;
            *flowEstimator = (FlowEstimate *)v23;
          }
        }
        else
        {
          uint64_t v17 = (FlowEstimate *)[objc_alloc(self->_adaptationDecoderClass) initWithMode:self->_usage revision:self->_revision];
          uint64_t v18 = self->_flowEstimator[0];
          self->_flowEstimator[0] = v17;
        }

        if (!flowEstimator[v14]) {
          return 0;
        }
      }
      ++v14;
    }
    while (v14 < self->_numLevels);
    if (!self->_twoStageFlow) {
      return 1;
    }
    goto LABEL_37;
  }
  if (self->_twoStageFlow)
  {
LABEL_37:
    [(OpticalFlow *)self createBaseLayer];
    if (!self->_baseStageCreated) {
      self->_twoStageFlow = 0;
    }
  }
  return 1;
}

- (BOOL)createBaseLayer
{
  self->_baseStageCreated = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  FRCGetInputFrameSizeForUsage(self->_usage, &v14, &v13);
  int64_t usage = self->_usage;
  if ((unint64_t)(v14 - 1920) > 0x280) {
    int64_t QuarterSizeUsage = get4xDownSizeUsage(usage);
  }
  else {
    int64_t QuarterSizeUsage = getQuarterSizeUsage(usage);
  }
  self->_baseStageUsage = QuarterSizeUsage;
  uint64_t v5 = (FeatureExtractor *)[objc_alloc(self->_featureExtractorClass) initWithMode:self->_baseStageUsage revision:self->_revision];
  baseFeatureExtractor = self->_baseFeatureExtractor;
  self->_baseFeatureExtractor = v5;

  if (!self->_featureExtractor) {
    return 0;
  }
  BOOL v7 = 1;
  [self->_baseFeatureExtractor setBaseStage:1];
  if (self->_numLevels >= 3u)
  {
    uint64_t v8 = 15;
    do
    {
      uint64_t v9 = [objc_alloc(self->_flowEstimatorClass) initWithMode:self->_baseStageUsage level:(v8 - 13) revision:self->_revision];
      uint64_t v10 = (void *)*((void *)&self->super.isa + v8);
      *((void *)&self->super.isa + v8) = v9;

      if (!*((void *)&self->super.isa + v8)) {
        return 0;
      }
      unint64_t v11 = v8 - 12;
      ++v8;
    }
    while (v11 < self->_numLevels);
  }
  self->_baseStageCreated = 1;
  return v7;
}

- (void)releaseUnusedFeatures:(id *)a3
{
  CVPixelBufferRelease(a3->var1.var1[0]);
  a3->var1.var1[0] = 0;
  CVPixelBufferRelease(a3->var1.var1[1]);
  a3->var1.var1[1] = 0;
  if (self->_numLevels >= 5u)
  {
    unint64_t v5 = 5;
    do
    {
      CVPixelBufferRelease(*((CVPixelBufferRef *)&a3->var0.var0 + v5));
      *((void *)&a3->var0.var0 + v5) = 0;
    }
    while (v5++ < self->_numLevels);
  }
}

- (void)upscaleInputFlow:(__CVBuffer *)a3 outFlow:(__CVBuffer *)a4
{
  unint64_t v6 = createTexturesFromCVPixelBuffer(a3, self->_device, 1, 2uLL);
  BOOL v7 = createTexturesFromCVPixelBuffer(a4, self->_device, 1, 2uLL);
  backwarp = self->_backwarp;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__OpticalFlow_upscaleInputFlow_outFlow___block_invoke;
  v9[3] = &unk_1E6CA4478;
  v9[4] = self;
  [(Backwarp *)backwarp upscaleFlow:v6 destination:v7 callback:v9];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __40__OpticalFlow_upscaleInputFlow_outFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 184));
}

- (void)allocateResources
{
  self->_resourcePreAllocated = 1;
  [(OpticalFlow *)self allocateFeatureBuffers:self->_features];
  [(OpticalFlow *)self allocateFeatureBuffers:&self->_features[1]];
  [(OpticalFlow *)self allocateIntermediateStorage:self->_opticalFlowStroages];
  if (self->_concurrentDualFlowProcessing)
  {
    [(OpticalFlow *)self allocateIntermediateStorage:&self->_opticalFlowStroages[1]];
  }
}

- (void)releaseResources
{
  if (self->_resourcePreAllocated)
  {
    [(OpticalFlow *)self releaseFeatureBuffers:self->_features];
    [(OpticalFlow *)self releaseFeatureBuffers:&self->_features[1]];
    [(OpticalFlow *)self releaseIntermediateStorage:self->_opticalFlowStroages];
    [(OpticalFlow *)self releaseIntermediateStorage:&self->_opticalFlowStroages[1]];
    self->_resourcePreAllocated = 0;
  }
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flow:(__CVBuffer *)a5
{
  if (self->_resourcePreAllocated)
  {
    [(OpticalFlow *)self extractFeaturesFromFirst:a3 second:a4];
    [(OpticalFlow *)self estimateFlowFromFirstFeatures:self->_features secondFeature:&self->_features[1] storage:self->_opticalFlowStroages outputFlow:a5];
  }
  else
  {
    [(OpticalFlow *)self allocateResources];
    [(OpticalFlow *)self extractFeaturesFromFirst:a3 second:a4];
    [(OpticalFlow *)self estimateFlowFromFirstFeatures:self->_features secondFeature:&self->_features[1] storage:self->_opticalFlowStroages outputFlow:a5];
    [(OpticalFlow *)self releaseResources];
  }
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6
{
}

- (void)opticalFlowFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 flowForward:(__CVBuffer *)a5 flowBackward:(__CVBuffer *)a6 reUseFlow:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL resourcePreAllocated = self->_resourcePreAllocated;
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self allocateResources];
  }
  [(OpticalFlow *)self extractFeaturesFromFirst:a3 second:a4];
  if (v7)
  {
    [(OpticalFlow *)self predictFowardFlow:a5 fromBackwardFlow:a6];
    features = self->_features;
    unint64_t v15 = &self->_features[1];
    opticalFlowStroages = self->_opticalFlowStroages;
    uint64_t v17 = self;
    goto LABEL_11;
  }
  if (!self->_concurrentDualFlowProcessing)
  {
    [(OpticalFlow *)self estimateFlowFromFirstFeatures:self->_features secondFeature:&self->_features[1] storage:self->_opticalFlowStroages outputFlow:a5];
    uint64_t v17 = self;
    unint64_t v15 = &self->_features[1];
    features = self->_features;
    opticalFlowStroages = self->_opticalFlowStroages;
LABEL_11:
    [(OpticalFlow *)v17 estimateFlowFromFirstFeatures:v15 secondFeature:features storage:opticalFlowStroages outputFlow:a6];
    if (resourcePreAllocated) {
      return;
    }
    goto LABEL_7;
  }
  [(OpticalFlow *)self estimateTwoWayFlowFromFirstFeatures:self->_features secondFeature:&self->_features[1] storage:self->_opticalFlowStroages outputForwardFlow:a5 outputBackwardFlow:a6];
  if (resourcePreAllocated) {
    return;
  }
LABEL_7:
  [(OpticalFlow *)self releaseResources];
}

- (void)flowAdaptationFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 inputFlowForward:(__CVBuffer *)a5 inputFlowBackward:(__CVBuffer *)a6 outputFlowForward:(__CVBuffer *)a7 outputFlowBackward:(__CVBuffer *)a8
{
  BOOL resourcePreAllocated = self->_resourcePreAllocated;
  if (self->_resourcePreAllocated)
  {
    if (a3)
    {
LABEL_3:
      [(OpticalFlow *)self extractFeaturesFromImage:a3 outputFeatures:self->_features];
      goto LABEL_6;
    }
  }
  else
  {
    [(OpticalFlow *)self allocateResources];
    if (a3) {
      goto LABEL_3;
    }
  }
  memcpy(__dst, self->_features, sizeof(__dst));
  memcpy(self->_features, &self->_features[1], 0x1E0uLL);
  memcpy(&self->_features[1], __dst, sizeof(self->_features[1]));
LABEL_6:
  [(OpticalFlow *)self extractFeaturesFromImage:a4 outputFeatures:&self->_features[1]];
  dispatchGroup = self->_dispatchGroup;
  concurrentQueue = self->_concurrentQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke;
  block[3] = &unk_1E6CA4560;
  block[4] = self;
  block[5] = a5;
  block[6] = a7;
  dispatch_group_async(dispatchGroup, concurrentQueue, block);
  uint64_t v18 = self->_dispatchGroup;
  uint64_t v19 = self->_concurrentQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke_2;
  v20[3] = &unk_1E6CA4560;
  v20[4] = self;
  v20[5] = a6;
  v20[6] = a8;
  dispatch_group_async(v18, v19, v20);
  dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!resourcePreAllocated) {
    [(OpticalFlow *)self releaseResources];
  }
}

uint64_t __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) adaptFlowFromFirstFeatures:*(void *)(a1 + 32) + 232 secondFeature:*(void *)(a1 + 32) + 712 storage:*(void *)(a1 + 32) + 1192 inputFlow:*(void *)(a1 + 40) outputFlow:*(void *)(a1 + 48)];
}

uint64_t __124__OpticalFlow_flowAdaptationFirstFrame_secondFrame_inputFlowForward_inputFlowBackward_outputFlowForward_outputFlowBackward___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) adaptFlowFromFirstFeatures:*(void *)(a1 + 32) + 712 secondFeature:*(void *)(a1 + 32) + 232 storage:*(void *)(a1 + 32) + 1608 inputFlow:*(void *)(a1 + 40) outputFlow:*(void *)(a1 + 48)];
}

- ($6BD85E8A05A9A99EBA8D4F18A81F03F3)imageFeatures
{
  return ($6BD85E8A05A9A99EBA8D4F18A81F03F3 *)self->_features;
}

- ($2B7190B9495AC8840DAD8324B3694CED)storages
{
  return ($2B7190B9495AC8840DAD8324B3694CED *)self->_opticalFlowStroages;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)flowSizeForLevel:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[(FeatureExtractor *)self->_featureExtractor getOutputTensorSize:retstr level:*(void *)&a4];
  retstr->unint64_t var2 = 2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)featureSizeForLevel:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  uint64_t v6 = 40;
  if (!a4) {
    uint64_t v6 = 152;
  }
  return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend(*(id *)((char *)&self->super.isa + v6), "getOutputTensorSize:level:", retstr);
}

- (unint64_t)flowWidth
{
  return self->_flowWidth;
}

- (unint64_t)flowHeight
{
  return self->_flowHeight;
}

- (int)numLevels
{
  return self->_numLevels;
}

- (unint64_t)downsampling
{
  return self->_downsampling;
}

- (void)setDownsampling:(unint64_t)a3
{
  self->_downsampling = a3;
}

- (BOOL)skipLastLevel
{
  return self->_skipLastLevel;
}

- (void)setSkipLastLevel:(BOOL)a3
{
  self->_BOOL skipLastLevel = a3;
}

- (BOOL)twoStageFlow
{
  return self->_twoStageFlow;
}

- (BOOL)concurrentDualFlowProcessing
{
  return self->_concurrentDualFlowProcessing;
}

- (void)setConcurrentDualFlowProcessing:(BOOL)a3
{
  self->_concurrentDualFlowProcessing = a3;
}

- (BOOL)useAdaptationLayer
{
  return self->_useAdaptationLayer;
}

- (void)setUseAdaptationLayer:(BOOL)a3
{
  self->_BOOL useAdaptationLayer = a3;
}

- (BOOL)disableOutputFlowScaling
{
  return self->_disableOutputFlowScaling;
}

- (void)setDisableOutputFlowScaling:(BOOL)a3
{
  self->_disableOutputFlowScaling = a3;
}

- (BOOL)adaptationLayerOnly
{
  return self->_adaptationLayerOnly;
}

- (void)setAdaptationLayerOnly:(BOOL)a3
{
  self->_adaptationLayerOnly = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (BOOL)waitForCompletion
{
  return self->_waitForCompletion;
}

- (void)setWaitForCompletion:(BOOL)a3
{
  self->_waitForCompletion = a3;
}

- (Backwarp)backwarp
{
  return self->_backwarp;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 2080, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_flowEstimateSemaphore, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_correlation, 0);
  objc_storeStrong((id *)&self->_adaptationFeatureExtractor, 0);
  for (uint64_t i = 0; i != -6; --i)
    objc_storeStrong((id *)&self->_baseFlowEstimator[i + 5], 0);
  objc_storeStrong((id *)&self->_baseFeatureExtractor, 0);
  for (uint64_t j = 88; j != 40; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
}

@end