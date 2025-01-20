@interface Normalization
- ($18698D32E93F98CA3BC0140E41567ABB)calcDeNormParamsFromNormaParams:(id *)a3 timeScale:(float)a4;
- ($94F468A8D4C62B317260615823C2B210)calcAnchorParamsFromNormParams:(id *)a3 anchor:(int)a4;
- ($94F468A8D4C62B317260615823C2B210)calcFrameStatistics:(__CVBuffer *)a3;
- ($94F468A8D4C62B317260615823C2B210)calcTextureStatistics:(id)a3;
- ($94F468A8D4C62B317260615823C2B210)calcTextureStatisticsFromStatsBuffer:(id)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGroupForStats;
- (BOOL)selfNormalization;
- (BOOL)useFloatAtomic;
- (BOOL)useSIMDSum;
- (Normalization)init;
- (Normalization)initWithMode:(int64_t)a3;
- (id)statsBufferForTexture:(id)a3;
- (void)denormalizeFrame:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 params:(id *)a5 timeScale:(float)a6 callback:(id)a7;
- (void)encodeDenormalizationRenderToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6;
- (void)encodeDenormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6;
- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 configBuffer:(id)a6;
- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 normParamBuffer:(id)a6;
- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6;
- (void)encodeStatisticsToCommandBuffer:(id)a3 texture:(id)a4 stats:(id)a5;
- (void)normalizeFramesFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 firstOutput:(__CVBuffer *)a5 secondOutput:(__CVBuffer *)a6 callback:(id)a7;
- (void)normalizeWithParmas:(id *)a3 firstInput:(__CVBuffer *)a4 secondInput:(__CVBuffer *)a5 firstOutput:(__CVBuffer *)a6 secondOutput:(__CVBuffer *)a7;
- (void)setSelfNormalization:(BOOL)a3;
- (void)setUseFloatAtomic:(BOOL)a3;
- (void)setUseSIMDSum:(BOOL)a3;
- (void)setupMetal;
@end

@implementation Normalization

- (Normalization)init
{
  return [(Normalization *)self initWithMode:0];
}

- (Normalization)initWithMode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)Normalization;
  v4 = [(FRCMetalBase *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_selfNormalization = 1;
    if (a3 == 1) {
      v4->_disableSIMDSum = 1;
    }
    [(Normalization *)v4 setupMetal];
  }
  return v5;
}

- (void)setupMetal
{
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PaintFrames", @"com.apple.FRC", keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0]) {
    keyExistsAndHasValidFormat[1] = AppBooleanValue != 0;
  }
  v4 = objc_opt_new();
  [v4 setConstantValue:&keyExistsAndHasValidFormat[1] type:53 withName:@"paintFrame"];
  if (!self->_disableSIMDSum
    && [(MTLDevice *)self->super._device supportsFamily:1007])
  {
    self->_useSIMDSum = 1;
    self->_useFloatAtomic = 1;
  }
  if (self->_useSIMDSum)
  {
    if (self->_useFloatAtomic)
    {
      v5 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPlanarSIMDAtomicAdd"];
      statisticsPlanarKernel = self->_statisticsPlanarKernel;
      self->_statisticsPlanarKernel = v5;

      objc_super v7 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPackedSIMDAtomicAdd"];
      statisticsPackedKernel = self->_statisticsPackedKernel;
      self->_statisticsPackedKernel = v7;

      v9 = @"calcStatisticsYUV420SIMDAtomicAdd";
    }
    else
    {
      v14 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPlanarSIMD"];
      v15 = self->_statisticsPlanarKernel;
      self->_statisticsPlanarKernel = v14;

      v16 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPackedSIMD"];
      v17 = self->_statisticsPackedKernel;
      self->_statisticsPackedKernel = v16;

      v9 = @"calcStatisticsYUV420SIMD";
    }
  }
  else
  {
    v10 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPlanar"];
    v11 = self->_statisticsPlanarKernel;
    self->_statisticsPlanarKernel = v10;

    v12 = [(FRCMetalBase *)self createKernel:@"calcStatisticsPacked"];
    v13 = self->_statisticsPackedKernel;
    self->_statisticsPackedKernel = v12;

    v9 = @"calcStatisticsYUV420";
  }
  v18 = [(FRCMetalBase *)self createKernel:v9];
  statisticsYUV420Kernel = self->_statisticsYUV420Kernel;
  self->_statisticsYUV420Kernel = v18;

  v20 = [(FRCMetalBase *)self createKernel:@"normalizeTextureNonInterleaved"];
  normalizePlanarToPlanarKernel = self->_normalizePlanarToPlanarKernel;
  self->_normalizePlanarToPlanarKernel = v20;

  v22 = [(FRCMetalBase *)self createKernel:@"normalizeToTextureArray"];
  normalizePackedToPlanarKernel = self->_normalizePackedToPlanarKernel;
  self->_normalizePackedToPlanarKernel = v22;

  v24 = [(FRCMetalBase *)self createKernel:@"normalizeYUV420ToTextureArray"];
  normalizeYUV420ToPlanarKernel = self->_normalizeYUV420ToPlanarKernel;
  self->_normalizeYUV420ToPlanarKernel = v24;

  v26 = [(FRCMetalBase *)self createKernel:@"denormalizeToPlanarTexture"];
  denormalizeToPlanarKernel = self->_denormalizeToPlanarKernel;
  self->_denormalizeToPlanarKernel = v26;

  v28 = [(FRCMetalBase *)self createKernel:@"denormalize" constantValues:v4];
  denormalizeKernel = self->_denormalizeKernel;
  self->_denormalizeKernel = v28;

  v30 = [(FRCMetalBase *)self createRenderKernel:@"denormalizeToYCbCrFragment" renderTargetFormat:500];
  denormalizeYCbCr8RenderKernel = self->_denormalizeYCbCr8RenderKernel;
  self->_denormalizeYCbCr8RenderKernel = v30;

  if ([(MTLDevice *)self->super._device supportsFamily:1007])
  {
    v32 = [(FRCMetalBase *)self createRenderKernel:@"denormalizeToYCbCrFragment" renderTargetFormat:508];
    denormalizeYCbCr10RenderKernel = self->_denormalizeYCbCr10RenderKernel;
    self->_denormalizeYCbCr10RenderKernel = v32;

    v34 = [(FRCMetalBase *)self createRenderKernel:@"denormalizeToYCbCrFragment" renderTargetFormat:505];
    denormalizeYCbCr10UnpackedRenderKernel = self->_denormalizeYCbCr10UnpackedRenderKernel;
    self->_denormalizeYCbCr10UnpackedRenderKernel = v34;
  }
  v36 = [(FRCMetalBase *)self newVertexBuffer];
  vertsBuffer = self->_vertsBuffer;
  self->_vertsBuffer = v36;

  v38 = (MTLBuffer *)[(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
  firstParamBuffer = self->_firstParamBuffer;
  self->_firstParamBuffer = v38;

  v40 = (MTLBuffer *)[(MTLDevice *)self->super._device newBufferWithLength:8 options:0];
  secondParamBuffer = self->_secondParamBuffer;
  self->_secondParamBuffer = v40;

  v42 = (MTLSharedEvent *)[(MTLDevice *)self->super._device newSharedEvent];
  sharedEvent = self->_sharedEvent;
  self->_sharedEvent = v42;

  v44 = (OS_dispatch_queue *)dispatch_queue_create("com.FRC.Normalization", 0);
  synchronizationQueue = self->_synchronizationQueue;
  self->_synchronizationQueue = v44;

  v46 = (MTLSharedEventListener *)[objc_alloc(MEMORY[0x1E4F35308]) initWithDispatchQueue:self->_synchronizationQueue];
  sharedEventListener = self->_sharedEventListener;
  self->_sharedEventListener = v46;

  self->_signalValue = 1;
}

- ($18698D32E93F98CA3BC0140E41567ABB)calcDeNormParamsFromNormaParams:(id *)a3 timeScale:(float)a4
{
  int var4 = a3->var4;
  if (self->_selfNormalization) {
    float var0 = (float)(a3->var2[1] * a4) + (float)((float)(1.0 - a4) * a3->var2[0]);
  }
  else {
    float var0 = a3->var0;
  }
  unint64_t v6 = LODWORD(var0) | ((unint64_t)COERCE_UNSIGNED_INT(1.0 / a3->var1) << 32);
  result.float var0 = *(float *)&v6;
  result.var1 = *((float *)&v6 + 1);
  result.var2 = var4;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcAnchorParamsFromNormParams:(id *)a3 anchor:(int)a4
{
  int v4 = a4;
  if (a4 >= 2)
  {
    NSLog(&cfstr_AnchorFrameCan.isa, a2, a4);
    int v4 = v4 > 0;
  }
  if (self->_selfNormalization)
  {
    objc_super v7 = (char *)(&a3->var0 + v4);
    a3 = ($4A63ACB5D0C6D58F6F3C6C6671DE9604 *)(v7 + 8);
    float var1 = 1.0 / *((float *)v7 + 4);
  }
  else
  {
    float var1 = a3->var1;
  }
  float var0 = a3->var0;
  result.float var1 = var1;
  result.float var0 = var0;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcFrameStatistics:(__CVBuffer *)a3
{
  int v4 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 1uLL);
  [(Normalization *)self calcTextureStatistics:v4];
  float v6 = v5;
  float v8 = v7;

  float v9 = v6;
  float v10 = v8;
  result.float var1 = v10;
  result.float var0 = v9;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGroupForStats
{
  unint64_t v3 = 32;
  if (!BYTE2(self[8].var0)) {
    unint64_t v3 = 8;
  }
  retstr->float var0 = v3;
  retstr->float var1 = v3;
  retstr->var2 = 1;
  return self;
}

- (id)statsBufferForTexture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 width];
  uint64_t v6 = [v4 height];

  [(Normalization *)self threadsPerGroupForStats];
  if (self->_useFloatAtomic) {
    unint64_t v7 = 8;
  }
  else {
    unint64_t v7 = 8 * (v5 - 1) / 0uLL * ((v6 - 1) / 0uLL);
  }
  float v8 = (void *)[(MTLDevice *)self->super._device newBufferWithLength:v7 options:0];
  return v8;
}

- ($94F468A8D4C62B317260615823C2B210)calcTextureStatistics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(Normalization *)self statsBufferForTexture:v4];
  uint64_t v6 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  [(Normalization *)self encodeStatisticsToCommandBuffer:v6 texture:v4 stats:v5];

  kdebug_trace();
  [v6 commit];
  [v6 waitUntilCompleted];
  kdebug_trace();
  [(Normalization *)self calcTextureStatisticsFromStatsBuffer:v5];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.float var1 = v12;
  result.float var0 = v11;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)calcTextureStatisticsFromStatsBuffer:(id)a3
{
  id v4 = a3;
  BOOL useFloatAtomic = self->_useFloatAtomic;
  id v6 = v4;
  uint64_t v7 = [v6 contents];
  uint64_t v8 = v7;
  if (useFloatAtomic)
  {
    float v9 = *(float *)(v7 + 4);
    float v15 = *(float *)v7;
  }
  else
  {
    unint64_t v10 = [v6 length];
    if (v10 >= 8)
    {
      uint64_t v11 = 0;
      float32x2_t v12 = 0;
      do
        float32x2_t v12 = vadd_f32(v12, *(float32x2_t *)(v8 + 8 * v11++));
      while (v10 >> 3 > v11);
      float v15 = v12.f32[0];
      float v9 = v12.f32[1] + 0.000000001;
    }
    else
    {
      float v15 = 0.0;
      float v9 = 0.000000001;
    }
  }

  float v13 = v15;
  float v14 = v9;
  result.float var1 = v14;
  result.float var0 = v13;
  return result;
}

- (void)encodeStatisticsToCommandBuffer:(id)a3 texture:(id)a4 stats:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 width];
  uint64_t v12 = [v8 height];
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  [(Normalization *)self threadsPerGroupForStats];
  long long v13 = v20;
  float v14 = [v10 computeCommandEncoder];

  if (isTextureYUV420(v8))
  {
    float v15 = &OBJC_IVAR___Normalization__statisticsYUV420Kernel;
  }
  else
  {
    uint64_t v16 = [v8 pixelFormat];
    float v15 = &OBJC_IVAR___Normalization__statisticsPackedKernel;
    if (v16 == 25) {
      float v15 = &OBJC_IVAR___Normalization__statisticsPlanarKernel;
    }
  }
  [v14 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v15)];
  [v14 setTexture:v8 atIndex:0];
  [v14 setBuffer:v9 offset:0 atIndex:0];

  v19[0] = (v11 + (uint64_t)v13 - 1) / (unint64_t)v13;
  v19[1] = (unint64_t)(v12 + *((void *)&v13 + 1) - 1) / *((void *)&v13 + 1);
  v19[2] = 1;
  long long v17 = v20;
  uint64_t v18 = v21;
  [v14 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v14 endEncoding];
}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 normParamBuffer:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v11 width];
  uint64_t v15 = [v11 height];
  uint64_t v16 = [v13 computeCommandEncoder];

  if (isTextureYUV420(v10))
  {
    long long v17 = &OBJC_IVAR___Normalization__normalizeYUV420ToPlanarKernel;
  }
  else
  {
    uint64_t v18 = [v10 arrayLength];
    long long v17 = &OBJC_IVAR___Normalization__normalizePlanarToPlanarKernel;
    if (v18 == 1) {
      long long v17 = &OBJC_IVAR___Normalization__normalizePackedToPlanarKernel;
    }
  }
  [v16 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v17)];
  [v16 setTexture:v10 atIndex:0];
  [v16 setTexture:v11 atIndex:1];
  [v16 setBuffer:v12 offset:0 atIndex:0];

  v21[0] = (unint64_t)(v14 + 15) >> 4;
  v21[1] = (unint64_t)(v15 + 15) >> 4;
  v21[2] = 1;
  int64x2_t v19 = vdupq_n_s64(0x10uLL);
  uint64_t v20 = 1;
  [v16 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
  [v16 endEncoding];
}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  float var1 = a6.var1;
  float var0 = a6.var0;
  device = self->super._device;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = (id) [(MTLDevice *)device newBufferWithLength:8 options:0];
  uint64_t v15 = (float *)[v16 contents];
  float *v15 = var0;
  v15[1] = var1;
  [(Normalization *)self encodeNormalizationToCommandBuffer:v14 source:v13 destination:v12 configBuffer:v16];
}

- (void)encodeNormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 configBuffer:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v11 width];
  uint64_t v15 = [v11 height];
  id v16 = [v13 computeCommandEncoder];

  if (isTextureYUV420(v10))
  {
    long long v17 = &OBJC_IVAR___Normalization__normalizeYUV420ToPlanarKernel;
  }
  else
  {
    uint64_t v18 = [v10 arrayLength];
    long long v17 = &OBJC_IVAR___Normalization__normalizePlanarToPlanarKernel;
    if (v18 == 1) {
      long long v17 = &OBJC_IVAR___Normalization__normalizePackedToPlanarKernel;
    }
  }
  [v16 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v17)];
  [v16 setTexture:v10 atIndex:0];
  [v16 setTexture:v11 atIndex:1];
  [v16 setBuffer:v12 offset:0 atIndex:0];

  v21[0] = (unint64_t)(v14 + 15) >> 4;
  v21[1] = (unint64_t)(v15 + 15) >> 4;
  v21[2] = 1;
  int64x2_t v19 = vdupq_n_s64(0x10uLL);
  uint64_t v20 = 1;
  [v16 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
  [v16 endEncoding];
}

- (void)normalizeFramesFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 firstOutput:(__CVBuffer *)a5 secondOutput:(__CVBuffer *)a6 callback:(id)a7
{
  id v12 = a7;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x4010000000;
  v41[3] = &unk_1DC860132;
  memset(&v41[4], 0, 24);
  int v42 = 0;
  if (a3 || !a5)
  {
    size_t Width = CVPixelBufferGetWidth(a4);
    v27 = v12;
    size_t Height = CVPixelBufferGetHeight(a4);
    if (isYUV420(a4))
    {
      if (a3)
      {
        uint64_t v15 = createYUV420TextureFromCVPixelBuffer(a3, self->super._device);
      }
      else
      {
        uint64_t v15 = 0;
      }
      v30 = createYUV420TextureFromCVPixelBuffer(a4, self->super._device);
      uint64_t v16 = 3 * Width * Height;
    }
    else if (isPackedRGBA(a4))
    {
      if (a3)
      {
        uint64_t v15 = createRGBATextureFromCVPixelBuffer(a3, self->super._device);
      }
      else
      {
        uint64_t v15 = 0;
      }
      v30 = createRGBATextureFromCVPixelBuffer(a4, self->super._device);
      uint64_t v16 = 3 * Width * Height;
    }
    else
    {
      if (a3)
      {
        uint64_t v15 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
      }
      else
      {
        uint64_t v15 = 0;
      }
      v30 = createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 3uLL);
      uint64_t v16 = Height * Width;
    }
    if (a5)
    {
      v28 = createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
    }
    else
    {
      v28 = 0;
    }
    long long v17 = createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
    uint64_t v18 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
    int64x2_t v19 = [(Normalization *)self statsBufferForTexture:v15];
    id obj = [(Normalization *)self statsBufferForTexture:v30];
    sharedEvent = self->_sharedEvent;
    sharedEventListener = self->_sharedEventListener;
    unint64_t signalValue = self->_signalValue;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke;
    v34[3] = &unk_1E6CA41C0;
    id v22 = v15;
    id v35 = v22;
    v36 = self;
    id v23 = v19;
    id v37 = v23;
    id v24 = obj;
    id v38 = v24;
    v39 = v41;
    uint64_t v40 = v16;
    unint64_t v25 = signalValue;
    id v12 = v27;
    [(MTLSharedEvent *)sharedEvent notifyListener:sharedEventListener atValue:v25 block:v34];
    if (v22) {
      [(Normalization *)self encodeStatisticsToCommandBuffer:v18 texture:v22 stats:v23];
    }
    -[Normalization encodeStatisticsToCommandBuffer:texture:stats:](self, "encodeStatisticsToCommandBuffer:texture:stats:", v18, v30, v24, sharedEvent);
    [v18 encodeSignalEvent:self->_sharedEvent value:self->_signalValue];
    [v18 encodeWaitForEvent:self->_sharedEvent value:self->_signalValue + 1];
    if (v22) {
      [(Normalization *)self encodeNormalizationToCommandBuffer:v18 source:v22 destination:v28 normParamBuffer:self->_firstParamBuffer];
    }
    [(Normalization *)self encodeNormalizationToCommandBuffer:v18 source:v30 destination:v17 normParamBuffer:self->_secondParamBuffer];
    objc_storeStrong((id *)&self->_prevStatsBuffer, obj);
    kdebug_trace();
    if (v27)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke_2;
      v31[3] = &unk_1E6CA41E8;
      id v32 = v27;
      v33 = v41;
      v31[4] = self;
      [v18 addCompletedHandler:v31];
    }
    [v18 commit];
    if (v27) {
      [v18 waitUntilScheduled];
    }
    else {
      [v18 waitUntilCompleted];
    }
    kdebug_trace();
  }
  else
  {
    NSLog(&cfstr_NormalizationE.isa);
  }
  _Block_object_dispose(v41, 8);
}

void __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke(void *a1, void *a2)
{
  id v14 = a2;
  unint64_t v3 = (float *)a1[5];
  if (a1[4])
  {
    [v3 calcTextureStatisticsFromStatsBuffer:a1[6]];
    float v5 = v4;
    float v7 = v6;
    unint64_t v3 = (float *)a1[5];
  }
  else
  {
    float v5 = v3[32];
    float v7 = v3[33];
  }
  [v3 calcTextureStatisticsFromStatsBuffer:a1[7]];
  id v8 = (float *)(a1[5] + 128);
  *id v8 = v9;
  v8[1] = v10;
  calcNormalizationParams(a1[9], (uint64_t)v15, v5, v7, v9, v10);
  uint64_t v11 = *(void *)(a1[8] + 8);
  *(_OWORD *)(v11 + 32) = *(_OWORD *)v15;
  *(_OWORD *)(v11 + 44) = *(_OWORD *)&v15[12];
  uint64_t v12 = [*(id *)(a1[5] + 176) contents];
  *(_DWORD *)uint64_t v12 = *(_DWORD *)(*(void *)(a1[8] + 8) + 40);
  *(float *)(v12 + 4) = 1.0 / *(float *)(*(void *)(a1[8] + 8) + 48);
  uint64_t v13 = [*(id *)(a1[5] + 184) contents];
  *(_DWORD *)uint64_t v13 = *(_DWORD *)(*(void *)(a1[8] + 8) + 44);
  *(float *)(v13 + 4) = 1.0 / *(float *)(*(void *)(a1[8] + 8) + 52);
  [v14 setSignaledValue:*(void *)(a1[5] + 168) + 1];
}

uint64_t __89__Normalization_normalizeFramesFirstInput_secondInput_firstOutput_secondOutput_callback___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[6] + 8);
  float v7 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v5 + 16);
  v9[0] = *(_OWORD *)(v6 + 32);
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)(v6 + 44);
  uint64_t result = v7(v5, v9, a3, a4);
  *(void *)(a1[4] + 168) += 2;
  return result;
}

- (void)normalizeWithParmas:(id *)a3 firstInput:(__CVBuffer *)a4 secondInput:(__CVBuffer *)a5 firstOutput:(__CVBuffer *)a6 secondOutput:(__CVBuffer *)a7
{
  int v13 = isPackedRGBA(a4);
  device = self->super._device;
  if (v13)
  {
    uint64_t v15 = createRGBATextureFromCVPixelBuffer(a4, device);
    createRGBATextureFromCVPixelBuffer(a5, self->super._device);
  }
  else
  {
    uint64_t v15 = createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
    createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
  uint64_t v16 = };
  long long v17 = createTexturesFromCVPixelBuffer(a6, self->super._device, 1, 3uLL);
  uint64_t v18 = createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  *(_OWORD *)id v32 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v32[12] = *(_OWORD *)&a3->var2[1];
  [(Normalization *)self calcAnchorParamsFromNormParams:v32 anchor:0];
  int v20 = v19;
  int v22 = v21;
  *(_OWORD *)id v32 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v32[12] = *(_OWORD *)&a3->var2[1];
  [(Normalization *)self calcAnchorParamsFromNormParams:v32 anchor:1];
  int v24 = v23;
  int v26 = v25;
  v27 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  LODWORD(v28) = v20;
  LODWORD(v29) = v22;
  -[Normalization encodeNormalizationToCommandBuffer:source:destination:params:](self, "encodeNormalizationToCommandBuffer:source:destination:params:", v27, v15, v17, v28, v29);
  LODWORD(v30) = v24;
  LODWORD(v31) = v26;
  -[Normalization encodeNormalizationToCommandBuffer:source:destination:params:](self, "encodeNormalizationToCommandBuffer:source:destination:params:", v27, v16, v18, v30, v31);
  kdebug_trace();
  [v27 commit];
  [v27 waitUntilCompleted];
  kdebug_trace();
}

- (void)encodeDenormalizationToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  int var2 = a6.var2;
  uint64_t v7 = *(void *)&a6.var0;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v11 width];
  uint64_t v15 = [v11 height];
  id v16 = (id) [(MTLDevice *)self->super._device newBufferWithLength:12 options:0];
  uint64_t v17 = [v16 contents];
  *(void *)uint64_t v17 = v7;
  *(_DWORD *)(v17 + 8) = var2;
  uint64_t v18 = [v13 computeCommandEncoder];

  if ([v11 pixelFormat] == 70)
  {
    int v19 = &OBJC_IVAR___Normalization__denormalizeKernel;
  }
  else
  {
    int v19 = &OBJC_IVAR___Normalization__denormalizeKernel;
    if ([v11 pixelFormat] != 90 && objc_msgSend(v11, "pixelFormat") != 115) {
      int v19 = &OBJC_IVAR___Normalization__denormalizeToPlanarKernel;
    }
  }
  [v18 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v19)];
  [v18 setTexture:v12 atIndex:0];

  [v18 setTexture:v11 atIndex:1];
  [v18 setBuffer:v16 offset:0 atIndex:0];
  v22[0] = (unint64_t)(v14 + 15) >> 4;
  v22[1] = (unint64_t)(v15 + 15) >> 4;
  v22[2] = 1;
  int64x2_t v20 = vdupq_n_s64(0x10uLL);
  uint64_t v21 = 1;
  [v18 dispatchThreadgroups:v22 threadsPerThreadgroup:&v20];
  [v18 endEncoding];
}

- (void)encodeDenormalizationRenderToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 params:(id)a6
{
  int var2 = a6.var2;
  uint64_t v7 = *(void *)&a6.var0;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = (double)(unint64_t)[v11 width];
  double v15 = (double)(unint64_t)[v11 height];
  id v16 = (id) [(MTLDevice *)self->super._device newBufferWithLength:12 options:0];
  uint64_t v17 = [v16 contents];
  *(void *)uint64_t v17 = v7;
  *(_DWORD *)(v17 + 8) = var2;
  id v18 = [(FRCMetalBase *)self newTextureCoordinateBufferWithWidth:v14 height:v15];
  int v19 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  int64x2_t v20 = [v19 colorAttachments];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setTexture:v11];

  int v22 = [v19 colorAttachments];
  int v23 = [v22 objectAtIndexedSubscript:0];
  [v23 setLoadAction:0];

  int v24 = [v19 colorAttachments];
  int v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setStoreAction:1];

  int v26 = [v13 renderCommandEncoderWithDescriptor:v19];

  v29[0] = 0;
  *(double *)&v29[1] = v15;
  *(double *)&v29[2] = v14;
  *(double *)&v29[3] = -v15;
  long long v30 = xmmword_1DC85A3F0;
  [v26 setViewport:v29];
  if ([v11 pixelFormat] == 500)
  {
    v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr8RenderKernel;
  }
  else
  {
    uint64_t v28 = [v11 pixelFormat];
    v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr10RenderKernel;
    if (v28 == 505) {
      v27 = &OBJC_IVAR___Normalization__denormalizeYCbCr10UnpackedRenderKernel;
    }
  }
  [v26 setRenderPipelineState:*(Class *)((char *)&self->super.super.isa + *v27)];
  [v26 setFragmentTexture:v12 atIndex:0];

  [v26 setFragmentBuffer:v16 offset:0 atIndex:0];
  [v26 setVertexBuffer:self->_vertsBuffer offset:0 atIndex:0];
  [v26 setVertexBuffer:v18 offset:0 atIndex:1];
  [v26 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v26 endEncoding];
}

- (void)denormalizeFrame:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 params:(id *)a5 timeScale:(float)a6 callback:(id)a7
{
  id v12 = a7;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy_;
  id v38 = __Block_byref_object_dispose_;
  createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  double v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  if (isYUV420(a4))
  {
    uint64_t v13 = createRenderTargetTextureFromCVPixelBuffer(a4, self->super._device);
  }
  else
  {
    int v14 = isPackedRGBA(a4);
    device = self->super._device;
    if (v14) {
      createRGBATextureFromCVPixelBuffer(a4, device);
    }
    else {
    uint64_t v13 = createTexturesFromCVPixelBuffer(a4, device, 1, 3uLL);
    }
  }
  id v16 = (void *)v29[5];
  v29[5] = v13;

  uint64_t v17 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  v27[0] = *(_OWORD *)&a5->var0;
  *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)&a5->var2[1];
  uint64_t v18 = [(Normalization *)self calcDeNormParamsFromNormaParams:v27 timeScale:COERCE_DOUBLE(__PAIR64__(v27[1], LODWORD(a6)))];
  unsigned int v20 = v19;
  if ([(id)v29[5] pixelFormat] == 500
    || [(id)v29[5] pixelFormat] == 508
    || [(id)v29[5] pixelFormat] == 505)
  {
    -[Normalization encodeDenormalizationRenderToCommandBuffer:source:destination:params:](self, "encodeDenormalizationRenderToCommandBuffer:source:destination:params:", v17, v35[5], v29[5], v18, v20);
  }
  else
  {
    -[Normalization encodeDenormalizationToCommandBuffer:source:destination:params:](self, "encodeDenormalizationToCommandBuffer:source:destination:params:", v17, v35[5], v29[5], v18, v20);
  }
  kdebug_trace();
  if (v12)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__Normalization_denormalizeFrame_destination_params_timeScale_callback___block_invoke;
    v23[3] = &unk_1E6CA4210;
    int v25 = &v34;
    int v26 = &v28;
    id v24 = v12;
    [v17 addCompletedHandler:v23];
  }
  [v17 commit];
  [v17 waitUntilScheduled];
  if (!v12)
  {
    [v17 waitUntilCompleted];
    kdebug_trace();
    uint64_t v21 = (void *)v35[5];
    v35[5] = 0;

    int v22 = (void *)v29[5];
    v29[5] = 0;
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

uint64_t __72__Normalization_denormalizeFrame_destination_params_timeScale_callback___block_invoke(void *a1)
{
  kdebug_trace();
  uint64_t v2 = *(void *)(a1[5] + 8);
  unint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(uint64_t (**)(void))(a1[4] + 16);
  return v6();
}

- (BOOL)selfNormalization
{
  return self->_selfNormalization;
}

- (void)setSelfNormalization:(BOOL)a3
{
  self->_selfNormalization = a3;
}

- (BOOL)useSIMDSum
{
  return self->_useSIMDSum;
}

- (void)setUseSIMDSum:(BOOL)a3
{
  self->_useSIMDSum = a3;
}

- (BOOL)useFloatAtomic
{
  return self->_useFloatAtomic;
}

- (void)setUseFloatAtomic:(BOOL)a3
{
  self->_BOOL useFloatAtomic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondParamBuffer, 0);
  objc_storeStrong((id *)&self->_firstParamBuffer, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_prevStatsBuffer, 0);
  objc_storeStrong((id *)&self->_vertsBuffer, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr10UnpackedRenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr10RenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeYCbCr8RenderKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeKernel, 0);
  objc_storeStrong((id *)&self->_denormalizeToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizeYUV420ToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizePackedToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_normalizePlanarToPlanarKernel, 0);
  objc_storeStrong((id *)&self->_statisticsYUV420Kernel, 0);
  objc_storeStrong((id *)&self->_statisticsPackedKernel, 0);
  objc_storeStrong((id *)&self->_statisticsPlanarKernel, 0);
}

@end