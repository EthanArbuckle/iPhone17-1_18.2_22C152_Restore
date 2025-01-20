@interface FRCImageProcessor
- (BOOL)selfNormalization;
- (BOOL)shouldCropOutputFrame:(__CVBuffer *)a3;
- (BOOL)shouldScaleBuffer:(__CVBuffer *)a3;
- (FRCImageProcessor)initWithUsage:(int64_t)a3;
- (FRCImageProcessor)initWithUsage:(int64_t)a3 normalizationMode:(int64_t)a4;
- (__CVBuffer)normalizedFirst;
- (__CVBuffer)normalizedSecond;
- (float)firstFramePixelMean;
- (float)secondFramePixelMean;
- (id)initLegacyModeWithUsage:(int64_t)a3;
- (int64_t)inputRotation;
- (unsigned)rgbaPixelFormatForBuffer:(__CVBuffer *)a3 useScaler:(BOOL)a4;
- (void)allocateNormalizedBuffers;
- (void)allocteRGBABuffersForBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)postProcessNormalizedFrame:(__CVBuffer *)a3 output:(__CVBuffer *)a4 timeScale:(float)a5 waitForCompletion:(BOOL)a6;
- (void)preProcessFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 waitForCompletion:(BOOL)a5;
- (void)releaseNormalizedBuffers;
- (void)setInputRotation:(int64_t)a3;
- (void)setSelfNormalization:(BOOL)a3;
- (void)storeColorProperties:(__CVBuffer *)a3;
@end

@implementation FRCImageProcessor

- (FRCImageProcessor)initWithUsage:(int64_t)a3
{
  return [(FRCImageProcessor *)self initWithUsage:a3 normalizationMode:0];
}

- (id)initLegacyModeWithUsage:(int64_t)a3
{
  return [(FRCImageProcessor *)self initWithUsage:a3 normalizationMode:1];
}

- (FRCImageProcessor)initWithUsage:(int64_t)a3 normalizationMode:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)FRCImageProcessor;
  v6 = [(FRCImageProcessor *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_usage = a3;
    v6->_inputRotation = 0;
    FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v6->_width, (uint64_t *)&v6->_height);
    v8 = [[Normalization alloc] initWithMode:a4];
    normalization = v7->_normalization;
    v7->_normalization = v8;

    v10 = objc_alloc_init(FRCScaler);
    scaler = v7->_scaler;
    v7->_scaler = v10;

    [(FRCImageProcessor *)v7 allocateNormalizedBuffers];
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    completionSemaphore = v7->_completionSemaphore;
    v7->_completionSemaphore = (OS_dispatch_semaphore *)v12;
  }
  return v7;
}

- (void)dealloc
{
  [(FRCImageProcessor *)self releaseNormalizedBuffers];
  if (self->_rgbaBuffersAllocated)
  {
    CVPixelBufferRelease(self->_rgbaFirst);
    CVPixelBufferRelease(self->_rgbaSecond);
    self->_rgbaBuffersAllocated = 0;
  }
  denormalizedBufferPool = self->_denormalizedBufferPool;
  if (denormalizedBufferPool)
  {
    CFRelease(denormalizedBufferPool);
    self->_denormalizedBufferPool = 0;
  }
  self->_rgbaPixelFormat = 0;
  v4.receiver = self;
  v4.super_class = (Class)FRCImageProcessor;
  [(FRCImageProcessor *)&v4 dealloc];
}

- (void)setSelfNormalization:(BOOL)a3
{
}

- (BOOL)selfNormalization
{
  return [(Normalization *)self->_normalization selfNormalization];
}

- (void)allocateNormalizedBuffers
{
  uint64_t v3 = 0;
  size_t v4 = 0;
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&v4, &v3);
  if (!self->_normalizedFirst) {
    self->_normalizedFirst = createPixelBuffer(v4, 3 * v3, 0x4C303068u, 0);
  }
  if (!self->_normalizedSecond) {
    self->_normalizedSecond = createPixelBuffer(v4, 3 * v3, 0x4C303068u, 0);
  }
}

- (void)releaseNormalizedBuffers
{
  self->_normalizedFirst = 0;
  self->_normalizedSecond = 0;
}

- (void)allocteRGBABuffersForBuffer:(__CVBuffer *)a3
{
  self->_rgbaPixelFormat = [(FRCImageProcessor *)self rgbaPixelFormatForBuffer:a3 useScaler:1];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t v8 = Width;
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t v7 = Height;
  if (self->_inputScaling)
  {
    Width >>= 1;
    Height >>= 1;
    size_t v7 = Height;
    size_t v8 = Width;
  }
  if (Width < Height) {
    swapWidthAndHeight((uint64_t *)&v8, (uint64_t *)&v7);
  }
  if (!self->_rgbaFirst) {
    self->_rgbaFirst = createPixelBuffer(v8, v7, self->_rgbaPixelFormat, 0);
  }
  if (!self->_rgbaSecond) {
    self->_rgbaSecond = createPixelBuffer(v8, v7, self->_rgbaPixelFormat, 0);
  }
  self->_rgbaBuffersAllocated = 1;
}

- (BOOL)shouldScaleBuffer:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t v9 = Width;
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t v8 = Height;
  if (CVPixelBufferGetPixelFormatType(a3) == 1278226536)
  {
    Height /= 3uLL;
    unint64_t v8 = Height;
  }
  if (Width < Height)
  {
    swapWidthAndHeight((uint64_t *)&v9, (uint64_t *)&v8);
    size_t Width = v9;
  }
  return self->_width < Width || self->_height < v8;
}

- (void)preProcessFirstInput:(__CVBuffer *)a3 secondInput:(__CVBuffer *)a4 waitForCompletion:(BOOL)a5
{
  BOOL v5 = a5;
  kdebug_trace();
  if (!a3) {
    *(int8x16_t *)&self->_normalizedFirst = vextq_s8(*(int8x16_t *)&self->_normalizedFirst, *(int8x16_t *)&self->_normalizedFirst, 8uLL);
  }
  [(FRCImageProcessor *)self storeColorProperties:a4];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  char v10 = 0;
  if (PixelFormatType != 1882468912 && PixelFormatType != 1885745712) {
    char v10 = isYUV420(a4);
  }
  self->_isYUV = isBufferYUV(a4);
  BOOL v11 = [(FRCImageProcessor *)self shouldScaleBuffer:a4];
  self->_inputScaling = v11;
  if (!self->_inputRotation && !v11)
  {
    char v12 = self->_isYUV ? v10 : 1;
    if (v12)
    {
      self->_useGPUOnlyForPreProcessing = 1;
      self->_rgbaFirst = a3;
      self->_rgbaSecond = a4;
      self->_rgbaPixelFormat = [(FRCImageProcessor *)self rgbaPixelFormatForBuffer:a4 useScaler:0];
      goto LABEL_19;
    }
  }
  if (!self->_rgbaPixelFormat)
  {
    [(FRCImageProcessor *)self allocteRGBABuffersForBuffer:a4];
    if (a3) {
      goto LABEL_15;
    }
LABEL_17:
    int8x16_t v14 = *(int8x16_t *)&self->_rgbaFirst;
    *(int8x16_t *)&self->_rgbaFirst = vextq_s8(v14, v14, 8uLL);
    rgbaSecond = (__CVBuffer *)v14.i64[0];
    goto LABEL_18;
  }
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  [(FRCScaler *)self->_scaler downScaleFrameSource:a3 destination:self->_rgbaFirst rotate:self->_inputRotation waitForCompletion:v5];
  rgbaSecond = self->_rgbaSecond;
LABEL_18:
  [(FRCScaler *)self->_scaler downScaleFrameSource:a4 destination:rgbaSecond rotate:self->_inputRotation waitForCompletion:v5];
LABEL_19:
  normalization = self->_normalization;
  if (a3)
  {
    rgbaFirst = self->_rgbaFirst;
    normalizedFirst = self->_normalizedFirst;
  }
  else
  {
    rgbaFirst = 0;
    normalizedFirst = 0;
  }
  v18 = self->_rgbaSecond;
  normalizedSecond = self->_normalizedSecond;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__FRCImageProcessor_preProcessFirstInput_secondInput_waitForCompletion___block_invoke;
  v20[3] = &unk_1E6CA4288;
  v20[4] = self;
  [(Normalization *)normalization normalizeFramesFirstInput:rgbaFirst secondInput:v18 firstOutput:normalizedFirst secondOutput:normalizedSecond callback:v20];
}

uint64_t __72__FRCImageProcessor_preProcessFirstInput_secondInput_waitForCompletion___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *a2;
  *(_OWORD *)(v2 + 92) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)(v2 + 80) = v3;
  NSLog(&cfstr_MeanFStdFFirst.isa, *(float *)a2, 1.0 / *((float *)a2 + 1), *((float *)a2 + 2), *((float *)a2 + 4), *((float *)a2 + 3), *((float *)a2 + 5));
  return kdebug_trace();
}

- (void)storeColorProperties:(__CVBuffer *)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F24A90];
  CFTypeRef v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  uint64_t v7 = *MEMORY[0x1E4F24BC8];
  CFTypeRef v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  uint64_t v9 = *MEMORY[0x1E4F24C18];
  CFTypeRef v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
  if (v6) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v10 == 0)
  {
    colorProperties = self->_colorProperties;
    self->_colorProperties = 0;
  }
  else
  {
    v16[0] = v5;
    v16[1] = v7;
    v17[0] = v6;
    v17[1] = v8;
    v16[2] = v9;
    v17[2] = v10;
    int8x16_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    objc_super v15 = self->_colorProperties;
    self->_colorProperties = v14;
  }
}

- (BOOL)shouldCropOutputFrame:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t v8 = Width;
  size_t Height = CVPixelBufferGetHeight(a3);
  if (Width < Height)
  {
    swapWidthAndHeight((uint64_t *)&v8, (uint64_t *)&Height);
    size_t Width = v8;
  }
  return Width < self->_width || Height < self->_height;
}

- (void)postProcessNormalizedFrame:(__CVBuffer *)a3 output:(__CVBuffer *)a4 timeScale:(float)a5 waitForCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  if (self->_inputRotation) {
    BOOL inputScaling = 1;
  }
  else {
    BOOL inputScaling = self->_inputScaling;
  }
  colorProperties = self->_colorProperties;
  if (colorProperties) {
    CMSetAttachments(a4, (CFDictionaryRef)colorProperties, 1u);
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  char v15 = Width | Height;
  if ((Width | Height))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:](Width, Height);
    }
    CVPixelBufferRef pixelBufferOut = 0;
    p_useGPUOnlyForPreProcessing = &self->_useGPUOnlyForPreProcessing;
  }
  else
  {
    CVPixelBufferRef pixelBufferOut = 0;
    p_useGPUOnlyForPreProcessing = &self->_useGPUOnlyForPreProcessing;
    if (self->_useGPUOnlyForPreProcessing)
    {
      CVPixelBufferRef pixelBufferOut = a4;
      goto LABEL_17;
    }
  }
  denormalizedBufferPool = self->_denormalizedBufferPool;
  if (!denormalizedBufferPool)
  {
    denormalizedBufferPool = createPixelBufferPool(self->_width, self->_height, self->_rgbaPixelFormat, 0);
    self->_denormalizedBufferPool = denormalizedBufferPool;
  }
  CVPixelBufferPoolCreatePixelBuffer(0, denormalizedBufferPool, &pixelBufferOut);
  v18 = self->_colorProperties;
  if (v18 && *p_useGPUOnlyForPreProcessing) {
    CMSetAttachments(pixelBufferOut, (CFDictionaryRef)v18, 1u);
  }
LABEL_17:
  normalization = self->_normalization;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__FRCImageProcessor_postProcessNormalizedFrame_output_timeScale_waitForCompletion___block_invoke;
  v20[3] = &unk_1E6CA42B0;
  BOOL v21 = inputScaling;
  BOOL v22 = v6;
  v20[4] = self;
  [(Normalization *)normalization denormalizeFrame:a3 destination:pixelBufferOut params:&self->_normalizationParams timeScale:v20 callback:COERCE_DOUBLE((unint64_t)LODWORD(a5))];
  if (v15 & 1 | !self->_useGPUOnlyForPreProcessing)
  {
    [(FRCScaler *)self->_scaler upScaleAndCropFrameSource:pixelBufferOut destination:a4 upscale:self->_inputScaling rotate:FRCGetReverseRotation(self->_inputRotation) waitForCompletion:v6];
    CVPixelBufferRelease(pixelBufferOut);
  }
  else if (v6)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __83__FRCImageProcessor_postProcessNormalizedFrame_output_timeScale_waitForCompletion___block_invoke(intptr_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    if (*(unsigned char *)(result + 41)) {
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 32) + 112));
    }
  }
  return result;
}

- (float)firstFramePixelMean
{
  return self->_normalizationParams.anchor_mean[0];
}

- (float)secondFramePixelMean
{
  return self->_normalizationParams.anchor_mean[1];
}

- (unsigned)rgbaPixelFormatForBuffer:(__CVBuffer *)a3 useScaler:(BOOL)a4
{
  BOOL v4 = a4;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFDictionaryRef v7 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  size_t v8 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F24E20]];
  int v9 = [v8 intValue];

  CFTypeRef v10 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F24EB0]];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    OSType v12 = CVPixelBufferGetPixelFormatType(a3);
  }
  else
  {
    if (v4) {
      int v13 = 1999843442;
    }
    else {
      int v13 = 1815162994;
    }
    if (v9 == 10) {
      int v14 = v13;
    }
    else {
      int v14 = 1380411457;
    }
    if (v9 == 8) {
      OSType v12 = 1111970369;
    }
    else {
      OSType v12 = v14;
    }
  }

  return v12;
}

- (int64_t)inputRotation
{
  return self->_inputRotation;
}

- (void)setInputRotation:(int64_t)a3
{
  self->_inputRotation = a3;
}

- (__CVBuffer)normalizedFirst
{
  return self->_normalizedFirst;
}

- (__CVBuffer)normalizedSecond
{
  return self->_normalizedSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_normalization, 0);
}

- (void)postProcessNormalizedFrame:(uint64_t)a1 output:(uint64_t)a2 timeScale:waitForCompletion:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1DC827000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Output Buffer not aligned %ld x %ld", (uint8_t *)&v2, 0x16u);
}

@end