@interface VCPModelR2D2
- (id).cxx_construct;
- (int)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4;
- (int)allocateFeatures;
- (int)allocateInputAndOutputBuffers;
- (int)allocateStorages;
- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5;
- (int)configForAspectRatio:(id)a3;
- (int)copyImage:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 withChannels:(int)a5;
- (int)createInput:(__CVBuffer *)a3 withImage:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6;
- (int)createModules:(id)a3;
- (int)estimateFlowForLevel:(int)a3 upperFlow:(__CVBuffer *)a4 outputFlow:(__CVBuffer *)a5;
- (int)estimateMotionFlow:(__CVBuffer *)a3;
- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4;
- (int)extractFeaturesFromFirst:(__CVBuffer *)a3 andSecond:(__CVBuffer *)a4;
- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6;
- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5;
- (int)getFlowToBuffer:(__CVBuffer *)a3;
- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7;
- (int)releaseInputAndOutputBuffers;
- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4;
- (int)updateModulesWithConfig:(id)a3;
- (void)dealloc;
- (void)releaseFeatureBuffers;
- (void)releaseMemory;
- (void)releaseStorages;
@end

@implementation VCPModelR2D2

- (int)prepareWithLightweightOption:(BOOL)a3 aspectRatio:(id)a4 numLevels:(int)a5 startLevel:(int)a6 cancel:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a7;
  resConfig = self->_resConfig;
  self->_resConfig = (NSString *)@"landscape_1024x432";

  self->super._cnnInputWidth = 1024;
  self->super._cnnInputHeight = 432;
  if (v10)
  {
    v15 = self->_resConfig;
    self->_resConfig = (NSString *)@"square_320x320";

    self->super._cnnInputWidth = 320;
    self->super._cnnInputHeight = 320;
  }
  else if (v12)
  {
    int v16 = [(VCPModelR2D2 *)self configForAspectRatio:v12];
    if (v16) {
      goto LABEL_7;
    }
  }
  self->_numLevels = a5;
  self->_startLevel = a6;
  int v16 = [(VCPModelR2D2 *)self createModules:v13];
  if (!v16)
  {
    v17 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    flowDecoderSemaphore = self->_flowDecoderSemaphore;
    self->_flowDecoderSemaphore = v17;

    int v16 = [(VCPModelR2D2 *)self allocateInputAndOutputBuffers];
  }
LABEL_7:

  return v16;
}

- (int)allocateInputAndOutputBuffers
{
  self->super._cnnOutputWidth = self->super._cnnInputWidth / 4;
  self->super._cnnOutputHeight = self->super._cnnInputHeight / 4;
  self->_firstBuffer = VCPFlowCreatePixelBuffer(self->super._cnnInputWidth, 3 * self->super._cnnInputHeight, 0x4C303068u, 32);
  self->_secondBuffer = VCPFlowCreatePixelBuffer(self->super._cnnInputWidth, 3 * self->super._cnnInputHeight, 0x4C303068u, 32);
  PixelBuffer = VCPFlowCreatePixelBuffer(self->super._cnnOutputWidth, 2 * self->super._cnnOutputHeight, 0x4C303068u, 32);
  self->_outputFlow = PixelBuffer;
  int result = -108;
  if (self->_firstBuffer)
  {
    if (PixelBuffer) {
      BOOL v5 = self->_secondBuffer == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      return -108;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (int)releaseInputAndOutputBuffers
{
  firstBuffer = self->_firstBuffer;
  if (firstBuffer) {
    CFRelease(firstBuffer);
  }
  secondBuffer = self->_secondBuffer;
  if (secondBuffer) {
    CFRelease(secondBuffer);
  }
  outputFlow = self->_outputFlow;
  if (outputFlow) {
    CFRelease(outputFlow);
  }
  return 0;
}

- (int)configForAspectRatio:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    if (v6 > 1.16)
    {
      switch(self->super._computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_384x256";
          int v8 = 256;
          int v9 = 384;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_448x320";
          int v8 = 320;
          int v9 = 448;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_640x512";
          int v8 = 512;
          goto LABEL_18;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"landscape_896x640";
          int v8 = 640;
          int v9 = 896;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    [v5 floatValue];
    unsigned int computationAccuracy = self->super._computationAccuracy;
    if (v11 < 0.86206899)
    {
      switch(computationAccuracy)
      {
        case 0u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_256x384";
          int v8 = 384;
          int v9 = 256;
          goto LABEL_22;
        case 1u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_320x448";
          int v8 = 448;
          int v9 = 320;
          goto LABEL_22;
        case 2u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_512x640";
          int v8 = 640;
          int v9 = 512;
          goto LABEL_22;
        case 3u:
          resConfig = self->_resConfig;
          self->_resConfig = (NSString *)@"portrait_640x896";
          int v8 = 896;
LABEL_18:
          int v9 = 640;
          goto LABEL_22;
        default:
          goto LABEL_11;
      }
    }
    switch(computationAccuracy)
    {
      case 0u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_256x256";
        int v9 = 256;
        int v8 = 256;
        goto LABEL_22;
      case 1u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_320x320";
        int v9 = 320;
        int v8 = 320;
        goto LABEL_22;
      case 2u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_512x512";
        int v9 = 512;
        int v8 = 512;
        goto LABEL_22;
      case 3u:
        resConfig = self->_resConfig;
        self->_resConfig = (NSString *)@"square_640x640";
        int v9 = 640;
        int v8 = 640;
LABEL_22:

        int v10 = 0;
        self->super._cnnInputWidth = v9;
        self->super._cnnInputHeight = v8;
        break;
      default:
LABEL_11:
        int v10 = -50;
        break;
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (int)createModules:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[VCPFlowFeatureExtractor alloc] initModule:self->_numLevels config:self->_resConfig cancel:v4];
  featureExtractor = self->_featureExtractor;
  self->_featureExtractor = v5;

  if (!self->_featureExtractor) {
    goto LABEL_9;
  }
  uint64_t startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    do
    {
      int v8 = [[VCPFlowDecoder alloc] initModule:startLevel config:self->_resConfig cancel:v4];
      int v9 = self->_flowDecoder[startLevel];
      self->_flowDecoder[startLevel] = v8;

      if (!self->_flowDecoder[startLevel]) {
        goto LABEL_9;
      }
    }
    while (++startLevel < (unint64_t)self->_numLevels);
  }
  int v10 = [[VCPCorrelation alloc] initWithDevice:self->super._device];
  correlation = self->_correlation;
  self->_correlation = v10;

  if (!self->_correlation
    || (id v12 = [[VCPBackwarp alloc] initWithDevice:self->super._device], backwarp = self->_backwarp, self->_backwarp = v12, backwarp, !self->_backwarp))
  {
LABEL_9:
    int v14 = -108;
    goto LABEL_10;
  }
  int v14 = [(VCPModelR2D2 *)self allocateFeatures];
  if (!v14) {
    int v14 = [(VCPModelR2D2 *)self allocateStorages];
  }
LABEL_10:

  return v14;
}

- (int)updateModulesWithConfig:(id)a3
{
  id v4 = a3;
  featureExtractor = self->_featureExtractor;
  if (!featureExtractor)
  {
    int v8 = 0;
    goto LABEL_9;
  }
  id v16 = 0;
  BOOL v6 = [(VCPEspressoModel *)featureExtractor updateModelWithConfig:v4 error:&v16];
  id v7 = v16;
  int v8 = v7;
  if (!v6)
  {
LABEL_9:
    int v13 = -18;
    goto LABEL_16;
  }
  unint64_t startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    while (1)
    {
      int v10 = self->_flowDecoder[startLevel];
      if (!v10) {
        goto LABEL_9;
      }
      id v15 = v8;
      BOOL v11 = [(VCPEspressoModel *)v10 updateModelWithConfig:v4 error:&v15];
      id v12 = v15;

      if (!v11)
      {
        int v13 = -18;
        goto LABEL_15;
      }
      ++startLevel;
      int v8 = v12;
      if (startLevel >= self->_numLevels) {
        goto LABEL_11;
      }
    }
  }
  id v12 = v7;
LABEL_11:
  [(VCPModelR2D2 *)self releaseMemory];
  int v13 = [(VCPModelR2D2 *)self allocateFeatures];
  if (!v13)
  {
    int v13 = [(VCPModelR2D2 *)self allocateStorages];
    if (!v13) {
      int v13 = [(VCPModelR2D2 *)self allocateInputAndOutputBuffers];
    }
  }
LABEL_15:
  int v8 = v12;
LABEL_16:

  return v13;
}

- (int)allocateStorages
{
  unsigned int numLevels = self->_numLevels;
  if (numLevels)
  {
    upscaledFlows = self->_storage.upscaledFlows;
    uint64_t v5 = self->_numLevels;
    do
    {
      *(upscaledFlows - 7) = 0;
      *upscaledFlows = 0;
      upscaledFlows[7] = 0;
      *(upscaledFlows - 14) = 0;
      ++upscaledFlows;
      --v5;
    }
    while (v5);
  }
  uint64_t startLevel = self->_startLevel;
  if (startLevel >= numLevels) {
    return 0;
  }
  for (i = &self->_storage.upscaledFlows[startLevel]; ; ++i)
  {
    int result = [(VCPFlowFeatureExtractor *)self->_featureExtractor setFeatureShape:&v15 height:self->super._cnnInputHeight width:self->super._cnnInputWidth level:startLevel];
    if (result) {
      break;
    }
    int v10 = v16;
    size_t v9 = v17;
    int v11 = v15;
    size_t v12 = 2 * v16;
    *(i - 7) = VCPFlowCreatePixelBuffer(v17, v12, 0x4C303068u, 0);
    *i = VCPFlowCreatePixelBuffer(v9, v12, 0x4C303068u, 0);
    CVPixelBufferRef PixelBuffer = VCPFlowCreatePixelBuffer(v9, v11 * (uint64_t)v10, 0x4C303068u, 0);
    i[7] = PixelBuffer;
    if (!*(i - 7)) {
      return -108;
    }
    CVPixelBufferRef v14 = PixelBuffer;
    int result = -108;
    if (!*i || !v14) {
      return result;
    }
    if (++startLevel >= (unint64_t)self->_numLevels) {
      return 0;
    }
  }
  return result;
}

- (void)releaseStorages
{
  unint64_t startLevel = self->_startLevel;
  if (startLevel < self->_numLevels)
  {
    id v4 = &self->_storage.upscaledFlows[startLevel];
    do
    {
      uint64_t v5 = *(v4 - 7);
      if (v5)
      {
        CFRelease(v5);
        *(v4 - 7) = 0;
      }
      if (*v4)
      {
        CFRelease(*v4);
        *id v4 = 0;
      }
      BOOL v6 = v4[7];
      if (v6)
      {
        CFRelease(v6);
        v4[7] = 0;
      }
      ++startLevel;
      ++v4;
    }
    while (startLevel < self->_numLevels);
  }
}

- (int)allocateCorreleationBuffer:(__CVBuffer *)a3 forLevel:(unsigned int)a4
{
  CVPixelBufferRef PixelBuffer = VCPFlowCreatePixelBuffer(self->_imageFeature[0].featureShape[a4].width, (81 * self->_imageFeature[0].featureShape[a4].height), 0x4C303068u, 0);
  *a3 = PixelBuffer;
  if (PixelBuffer) {
    return 0;
  }
  else {
    return -108;
  }
}

- (int)allocateFeatures
{
  uint64_t v3 = 0;
  imageFeature = self->_imageFeature;
  LODWORD(numLevels) = self->_numLevels;
  BOOL v6 = &self->_imageFeature[0].featureShape[1];
  char v7 = 1;
  int v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
  int v17 = &self->_imageFeature[0].featureShape[1];
  while (1)
  {
    char v9 = v7;
    if (numLevels >= 2) {
      break;
    }
LABEL_8:
    char v7 = 0;
    uint64_t v3 = 1;
    if ((v9 & 1) == 0) {
      return 0;
    }
  }
  int v10 = &imageFeature[v3];
  uint64_t v11 = v8[267];
  uint64_t v12 = 12;
  int v13 = &v6[12 * v3];
  while (1)
  {
    int result = [*(id *)((char *)&self->super.super.super.isa + v11) setFeatureShape:v13 height:self->super._cnnInputHeight width:self->super._cnnInputWidth level:(v12 - 11)];
    if (result) {
      return result;
    }
    CVPixelBufferRef PixelBuffer = VCPFlowCreatePixelBuffer(v13->width, v13->channels * (uint64_t)v13->height, 0x4C303068u, 0);
    *((void *)&v10->featureShape[0].channels + v12) = PixelBuffer;
    if (!PixelBuffer) {
      return -108;
    }
    unint64_t numLevels = self->_numLevels;
    unint64_t v16 = v12 - 10;
    ++v12;
    ++v13;
    if (v16 >= numLevels)
    {
      BOOL v6 = v17;
      int v8 = &OBJC_IVAR___VCPCNNModelEspresso__context;
      goto LABEL_8;
    }
  }
}

- (void)releaseFeatureBuffers
{
  uint64_t v3 = 0;
  unint64_t numLevels = self->_numLevels;
  imageFeature = self->_imageFeature;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (numLevels >= 2)
    {
      int v8 = &imageFeature[v3];
      uint64_t v9 = 12;
      do
      {
        int v10 = (const void *)*((void *)&v8->featureShape[0].channels + v9);
        if (v10)
        {
          CFRelease(v10);
          *((void *)&v8->featureShape[0].channels + v9) = 0;
          unint64_t numLevels = self->_numLevels;
        }
        unint64_t v11 = v9 - 10;
        ++v9;
      }
      while (v11 < numLevels);
    }
    char v6 = 0;
    uint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
}

- (int)extractFeaturesFromFirst:(__CVBuffer *)a3 andSecond:(__CVBuffer *)a4
{
  imageFeature = self->_imageFeature;
  int result = [(VCPModelR2D2 *)self extractFeatureFromImage:a3 toFeature:self->_imageFeature];
  if (!result)
  {
    return [(VCPModelR2D2 *)self extractFeatureFromImage:a4 toFeature:&imageFeature[1]];
  }
  return result;
}

- (int)extractFeatureFromImage:(__CVBuffer *)a3 toFeature:(id *)a4
{
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  featureExtractor = self->_featureExtractor;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__VCPModelR2D2_extractFeatureFromImage_toFeature___block_invoke;
  v11[3] = &unk_1E6296FF8;
  dispatch_semaphore_t v12 = v7;
  uint64_t v9 = v7;
  LODWORD(a4) = [(VCPFlowFeatureExtractor *)featureExtractor extractFeatureFromImage:a3 toFeature:a4 callback:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  return (int)a4;
}

intptr_t __50__VCPModelR2D2_extractFeatureFromImage_toFeature___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)estimateMotionFlow:(__CVBuffer *)a3
{
  unsigned int numLevels = self->_numLevels;
  if (numLevels - 1 < self->_startLevel) {
    return 0;
  }
  p_storage = &self->_storage;
  while (1)
  {
    uint64_t v7 = numLevels - 1;
    int v8 = (CFTypeRef *)&p_storage->correlations[v7];
    int result = [(VCPModelR2D2 *)self allocateCorreleationBuffer:v8 forLevel:v7];
    if (result) {
      break;
    }
    if (v7 + 1 == self->_numLevels) {
      int v10 = 0;
    }
    else {
      int v10 = p_storage->flows[numLevels];
    }
    unint64_t v11 = a3;
    if (v7 != self->_startLevel) {
      unint64_t v11 = p_storage->flows[v7];
    }
    int result = [(VCPModelR2D2 *)self estimateFlowForLevel:v7 upperFlow:v10 outputFlow:v11];
    if (result) {
      break;
    }
    if (*v8)
    {
      CFRelease(*v8);
      *int v8 = 0;
    }
    unsigned int numLevels = v7;
    if ((v7 - 1) < self->_startLevel) {
      return 0;
    }
  }
  return result;
}

- (int)estimateFlowForLevel:(int)a3 upperFlow:(__CVBuffer *)a4 outputFlow:(__CVBuffer *)a5
{
  imageFeature = self->_imageFeature;
  unint64_t channels = self->_imageFeature[0].featureShape[a3].channels;
  v38 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  unint64_t v11 = (__CVBuffer **)((char *)imageFeature + 8 * a3);
  v39 = createTextureFromBuffer(v11[11], self->super._device, 0, channels);
  v34 = (uint64_t *)(v11 + 11);
  uint64_t v12 = a3;
  int v13 = createTextureFromBuffer(imageFeature[1].feature[a3], self->super._device, 0, channels);
  p_storage = &self->_storage;
  uint64_t v14 = createTextureFromBuffer(self->_storage.correlations[a3], self->super._device, 0, 0x51uLL);
  int v15 = (void *)v14;
  if (v39) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v17 = v16 || v14 == 0;
  v33 = a5;
  if (v17)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_10;
  }
  if (self->_numLevels - 1 != a3)
  {
    v18 = createTextureFromBuffer(a4, self->super._device, 0, 2uLL);
    v23 = &p_storage->correlations[a3];
    v19 = createTextureFromBuffer(v23[14], self->super._device, 0, 2uLL);
    uint64_t v24 = createTextureFromBuffer(v23[21], self->super._device, 0, channels);
    v20 = (void *)v24;
    if (v19) {
      BOOL v25 = v18 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25 && v24 != 0)
    {
      v35 = v18;
      id v36 = (id)v24;
      v22 = v19;
      [(VCPBackwarp *)self->_backwarp encodeToCommandBuffer:v38 input:v13 output:v24 flow:v18 upscaledFlow:v19];
      -[VCPCorrelation encodeToCommandBuffer:firstInput:secondInput:correlation:](self->_correlation, "encodeToCommandBuffer:firstInput:secondInput:correlation:", v38, v39, v20, v15, v33);
      goto LABEL_21;
    }
LABEL_10:
    int v21 = -108;
    goto LABEL_27;
  }
  v35 = 0;
  id v36 = v13;
  v22 = 0;
  -[VCPCorrelation encodeToCommandBuffer:firstInput:secondInput:correlation:](self->_correlation, "encodeToCommandBuffer:firstInput:secondInput:correlation:", v38, v39, v36, v15, a5);
LABEL_21:
  [v38 commit];
  [v38 waitUntilCompleted];
  if (needDeepCopy([v15 width], objc_msgSend(v15, "arrayLength"))) {
    int v21 = copyTextureToBuffer(v15, p_storage->correlations[v12]);
  }
  else {
    int v21 = 0;
  }
  if (needDeepCopy([v22 width], objc_msgSend(v22, "arrayLength"))) {
    int v21 = copyTextureToBuffer(v22, p_storage->upscaledFlows[v12]);
  }
  v18 = v35;
  v20 = v36;
  v19 = v22;
LABEL_27:

  if (!v21)
  {
    v27 = self->_flowDecoder[v12];
    uint64_t v28 = *v34;
    v29 = &p_storage->correlations[v12];
    v30 = *v29;
    v31 = v29[14];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __58__VCPModelR2D2_estimateFlowForLevel_upperFlow_outputFlow___block_invoke;
    v40[3] = &unk_1E6296FF8;
    v40[4] = self;
    int v21 = [(VCPFlowDecoder *)v27 estimateFlow:v28 correlation:v30 flow:v31 outputFlow:v33 callback:v40];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_flowDecoderSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }

  return v21;
}

intptr_t __58__VCPModelR2D2_estimateFlowForLevel_upperFlow_outputFlow___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 728));
}

- (int)copyImage:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 withChannels:(int)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVReturn v47 = 0;
  CVPixelBufferRef v48 = a3;
  CVPixelBufferLockFlags v49 = 1;
  if (!a3)
  {
    BOOL v30 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v30) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
    return -50;
  }
  int v9 = Height;
  CVReturn v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v47 = v10;
  if (!v10
    || (CVReturn v11 = v10, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        pixelBuffer[0] = a3,
        LOWORD(pixelBuffer[1]) = 1024,
        *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v11,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v11 = v47) == 0))
  {
    *(_DWORD *)buf = 0;
    *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a4;
    if (a4)
    {
      CVReturn v11 = CVPixelBufferLockBaseAddress(a4, 0);
      *(_DWORD *)buf = v11;
      if (!v11
        || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
        && (*(_DWORD *)v52 = 134218240,
            uint64_t v53 = *(void *)((char *)pixelBuffer + 4),
            __int16 v54 = 1024,
            CVReturn v55 = v11,
            _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v52, 0x12u), (CVReturn v11 = *(_DWORD *)buf) == 0))
      {
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        int v14 = CVPixelBufferGetBytesPerRow(a4);
        int v15 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v9 >= 1)
        {
          int v17 = 0;
          unint64_t v18 = (unint64_t)v14 >> 1;
          v19 = &v15[4 * v9 * (int)v18];
          uint64_t v20 = 2 * (int)v18;
          int v21 = &v15[2 * (int)v18 * v9];
          do
          {
            if (Width >= 1)
            {
              uint64_t v22 = 0;
              int v23 = 1;
              do
              {
                LOBYTE(_S0) = BaseAddress[v23 + 1];
                *(float *)&_S0 = (float)LODWORD(_S0) / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v15[v22] = _S0;
                LOBYTE(_S0) = BaseAddress[v23];
                *(float *)&_S0 = (float)_S0 / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v21[v22] = _S0;
                LOBYTE(_S0) = BaseAddress[v23 - 1];
                _S0 = (float)_S0 / 255.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v19[v22] = LOWORD(_S0);
                v22 += 2;
                v23 += 4;
              }
              while (2 * Width != v22);
            }
            BaseAddress += BytesPerRow;
            ++v17;
            v19 += v20;
            v21 += v20;
            v15 += v20;
          }
          while (v17 != v9);
        }
        CVReturn v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
        if (!v11) {
          CVReturn v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
        }
      }
    }
    else
    {
      BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v39) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v39, v40, v41, v42, v43, v44, v45, v46);
      }
      CVReturn v11 = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(void *)((char *)pixelBuffer + 4)
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(void *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
    if (v48
      && !v47
      && CVPixelBufferUnlockBaseAddress(v48, v49)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
  }
  return v11;
}

- (int)createInput:(__CVBuffer *)a3 withImage:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6
{
  if (a3)
  {
    uint64_t v6 = *(void *)&a6;
    uint64_t v7 = *(void *)&a5;
    CFTypeRef cf = 0;
    int Width = CVPixelBufferGetWidth(a4);
    int Height = CVPixelBufferGetHeight(a4);
    if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 && Width == v6 && Height == v7)
    {
      BOOL v16 = 0;
      CFTypeRef cf = CFRetain(a4);
      CF<opaqueCMSampleBuffer *>::~CF(&v16);
    }
    else
    {
      Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, v6, v7, 1111970369);
      int v13 = v14;
      if (v14)
      {
LABEL_9:
        CF<opaqueCMSampleBuffer *>::~CF(&cf);
        return v13;
      }
    }
    int v13 = [(VCPModelR2D2 *)self copyImage:cf toBuffer:a3 withChannels:3];
    goto LABEL_9;
  }
  return -108;
}

- (int)analyzeImages:(__CVBuffer *)a3 secondImage:(__CVBuffer *)a4 cancel:(id)a5
{
  int result = [(VCPModelR2D2 *)self createInput:self->_firstBuffer withImage:a3 modelInputHeight:self->super._cnnInputHeight modelInputWidth:self->super._cnnInputWidth];
  if (!result)
  {
    int result = [(VCPModelR2D2 *)self createInput:self->_secondBuffer withImage:a4 modelInputHeight:self->super._cnnInputHeight modelInputWidth:self->super._cnnInputWidth];
    if (!result)
    {
      int result = [(VCPModelR2D2 *)self extractFeaturesFromFirst:self->_firstBuffer andSecond:self->_secondBuffer];
      if (!result)
      {
        outputFlow = self->_outputFlow;
        return [(VCPModelR2D2 *)self estimateMotionFlow:outputFlow];
      }
    }
  }
  return result;
}

- (int)getFlowToBuffer:(__CVBuffer *)a3
{
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  [(VCPModelR2D2 *)self flowScalingTo:a3 scalerX:v3 scalerY:v4];
  return 0;
}

- (int)flowScalingTo:(__CVBuffer *)a3 scalerX:(float)a4 scalerY:(float)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  int BytesPerRow = CVPixelBufferGetBytesPerRow(self->_outputFlow);
  int v10 = CVPixelBufferGetBytesPerRow(a3);
  outputFlow = self->_outputFlow;
  CVReturn v52 = 0;
  CVPixelBufferRef v53 = outputFlow;
  CVPixelBufferLockFlags v54 = 1;
  if (outputFlow)
  {
    int v12 = v10;
    CVReturn v13 = CVPixelBufferLockBaseAddress(outputFlow, 1uLL);
    CVReturn v52 = v13;
    if (!v13
      || (CVReturn v14 = v13, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          pixelBuffer[0] = outputFlow,
          LOWORD(pixelBuffer[1]) = 1024,
          *(_DWORD *)((char *)&pixelBuffer[1] + 2) = v14,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v14 = v52) == 0))
    {
      *(_OWORD *)((char *)pixelBuffer + 4) = (unint64_t)a3;
      if (a3)
      {
        CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 0);
        *(_DWORD *)buf = v14;
        if (!v14
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v57 = 134218240,
              uint64_t v58 = *(void *)((char *)pixelBuffer + 4),
              __int16 v59 = 1024,
              CVReturn v60 = v14,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v57, 0x12u), (CVReturn v14 = *(_DWORD *)buf) == 0))
        {
          BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_outputFlow);
          BOOL v16 = (char *)CVPixelBufferGetBaseAddress(a3);
          cnnOutputint Height = self->super._cnnOutputHeight;
          if (cnnOutputHeight >= 1)
          {
            int v18 = 0;
            unint64_t v19 = (unint64_t)BytesPerRow >> 1;
            cnnOutputint Width = self->super._cnnOutputWidth;
            uint64_t v21 = (int)v19;
            uint64_t v22 = &BaseAddress[2 * cnnOutputHeight * (int)v19];
            uint64_t v23 = 2 * v21;
            do
            {
              if ((int)cnnOutputWidth >= 1)
              {
                uint64_t v24 = 0;
                uint64_t v25 = 0;
                do
                {
                  _H0 = *(_WORD *)&BaseAddress[v25];
                  __asm { FCVT            S0, H0 }
                  _S0 = _S0 * a4;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v16[v24 >> 31] = LOWORD(_S0);
                  LOWORD(_S0) = *(_WORD *)&v22[v25];
                  __asm { FCVT            S0, H0 }
                  _S0 = _S0 * a5;
                  __asm { FCVT            H0, S0 }
                  *(_WORD *)&v16[2 * (int)v25 + 2] = LOWORD(_S0);
                  v25 += 2;
                  v24 += 0x200000000;
                }
                while (2 * cnnOutputWidth != v25);
              }
              v16 += 2 * ((uint64_t)v12 >> 1);
              ++v18;
              v22 += v23;
              BaseAddress += v23;
            }
            while (v18 != cnnOutputHeight);
          }
          CVReturn v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
          if (!v14) {
            CVReturn v14 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v52);
          }
        }
      }
      else
      {
        BOOL v44 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v44) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v44, v45, v46, v47, v48, v49, v50, v51);
        }
        CVReturn v14 = -50;
        *(_DWORD *)buf = -50;
      }
      if (*(void *)((char *)pixelBuffer + 4)
        && !*(_DWORD *)buf
        && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)pixelBuffer + 4), *(void *)((char *)&pixelBuffer[1] + 4))&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
      if (v53
        && !v52
        && CVPixelBufferUnlockBaseAddress(v53, v54)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v35 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v35) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v35, v36, v37, v38, v39, v40, v41, v42);
    }
    return -50;
  }
  return v14;
}

- (int)flowScalingTo:(__CVBuffer *)a3 flowBufferY:(__CVBuffer *)a4 scalerX:(float)a5 scalerY:(float)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  int BytesPerRow = CVPixelBufferGetBytesPerRow(self->_outputFlow);
  int v12 = CVPixelBufferGetBytesPerRow(a3);
  int v13 = CVPixelBufferGetBytesPerRow(a4);
  outputFlow = self->_outputFlow;
  CVReturn v63 = 0;
  CVPixelBufferRef pixelBuffer = outputFlow;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (outputFlow)
  {
    int v15 = v13;
    CVReturn v16 = CVPixelBufferLockBaseAddress(outputFlow, 1uLL);
    CVReturn v63 = v16;
    if (!v16
      || (CVReturn v17 = v16, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v69[0] = outputFlow,
          LOWORD(v69[1]) = 1024,
          *(_DWORD *)((char *)&v69[1] + 2) = v17,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v17 = v63) == 0))
    {
      *(_DWORD *)buf = 0;
      *(_OWORD *)((char *)v69 + 4) = (unint64_t)a3;
      if (a3)
      {
        CVReturn v17 = CVPixelBufferLockBaseAddress(a3, 0);
        *(_DWORD *)buf = v17;
        if (!v17
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v66 = 134218240,
              v67[0] = *(void *)((char *)v69 + 4),
              LOWORD(v67[1]) = 1024,
              *(_DWORD *)((char *)&v67[1] + 2) = v17,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v66, 0x12u), (CVReturn v17 = *(_DWORD *)buf) == 0))
        {
          *(_DWORD *)v66 = 0;
          *(_OWORD *)((char *)v67 + 4) = (unint64_t)a4;
          if (a4)
          {
            CVReturn v17 = CVPixelBufferLockBaseAddress(a4, 0);
            *(_DWORD *)v66 = v17;
            if (!v17
              || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v70 = 134218240,
                  uint64_t v71 = *(void *)((char *)v67 + 4),
                  __int16 v72 = 1024,
                  CVReturn v73 = v17,
                  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v70, 0x12u), (CVReturn v17 = *(_DWORD *)v66) == 0))
            {
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_outputFlow);
              unint64_t v19 = (char *)CVPixelBufferGetBaseAddress(a3);
              uint64_t v20 = (char *)CVPixelBufferGetBaseAddress(a4);
              cnnOutputint Height = self->super._cnnOutputHeight;
              if (cnnOutputHeight >= 1)
              {
                int v22 = 0;
                unint64_t v23 = (unint64_t)BytesPerRow >> 1;
                cnnOutputint Width = self->super._cnnOutputWidth;
                uint64_t v25 = (int)v23;
                v26 = &BaseAddress[2 * cnnOutputHeight * (int)v23];
                uint64_t v27 = 2 * v25;
                do
                {
                  if ((int)cnnOutputWidth >= 1)
                  {
                    uint64_t v28 = 0;
                    do
                    {
                      _H0 = *(_WORD *)&BaseAddress[v28];
                      __asm { FCVT            S0, H0 }
                      _S0 = _S0 * a5;
                      __asm { FCVT            H0, S0 }
                      *(_WORD *)&v19[v28] = LOWORD(_S0);
                      LOWORD(_S0) = *(_WORD *)&v26[v28];
                      __asm { FCVT            S0, H0 }
                      _S0 = _S0 * a6;
                      __asm { FCVT            H0, S0 }
                      *(_WORD *)&v20[v28] = LOWORD(_S0);
                      v28 += 2;
                    }
                    while (2 * cnnOutputWidth != v28);
                  }
                  ++v22;
                  v26 += v27;
                  v20 += 2 * ((uint64_t)v15 >> 1);
                  v19 += 2 * ((uint64_t)v12 >> 1);
                  BaseAddress += v27;
                }
                while (v22 != cnnOutputHeight);
              }
              CVReturn v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v66);
              if (!v17)
              {
                CVReturn v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                if (!v17) {
                  CVReturn v17 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v63);
                }
              }
            }
          }
          else
          {
            BOOL v55 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v55) {
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v55, v56, v57, v58, v59, v60, v61, v62);
            }
            CVReturn v17 = -50;
            *(_DWORD *)v66 = -50;
          }
          if (*(void *)((char *)v67 + 4)
            && !*(_DWORD *)v66
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v67 + 4), *(void *)((char *)&v67[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
          if (*(void *)((char *)v69 + 4)
            && !*(_DWORD *)buf
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)((char *)v69 + 4), *(void *)((char *)&v69[1] + 4))
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
        }
      }
      else
      {
        BOOL v47 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v47) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v47, v48, v49, v50, v51, v52, v53, v54);
        }
        CVReturn v17 = -50;
      }
      if (pixelBuffer
        && !v63
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v38) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v38, v39, v40, v41, v42, v43, v44, v45);
    }
    return -50;
  }
  return v17;
}

- (int)updateModelForAspectRatio:(id)a3 computationAccuracy:(unsigned int)a4
{
  uint64_t v7 = self->_resConfig;
  self->super._unsigned int computationAccuracy = a4;
  int v8 = [(VCPModelR2D2 *)self configForAspectRatio:a3];
  if (!v8)
  {
    if (v7 == self->_resConfig) {
      int v8 = 0;
    }
    else {
      int v8 = -[VCPModelR2D2 updateModulesWithConfig:](self, "updateModulesWithConfig:");
    }
  }

  return v8;
}

- (void)releaseMemory
{
  [(VCPModelR2D2 *)self releaseInputAndOutputBuffers];
  [(VCPModelR2D2 *)self releaseFeatureBuffers];
  [(VCPModelR2D2 *)self releaseStorages];
}

- (void)dealloc
{
  [(VCPModelR2D2 *)self releaseMemory];
  v3.receiver = self;
  v3.super_class = (Class)VCPModelR2D2;
  [(VCPModelR2D2 *)&v3 dealloc];
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_flowDecoderSemaphore, 0);
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_correlation, 0);
  for (uint64_t i = 6; i != -1; --i)
    objc_storeStrong((id *)&self->_flowDecoder[i], 0);
  objc_storeStrong((id *)&self->_featureExtractor, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
}

- (id).cxx_construct
{
  *((void *)self + 93) = 0;
  *((_DWORD *)self + 188) = 0;
  return self;
}

@end