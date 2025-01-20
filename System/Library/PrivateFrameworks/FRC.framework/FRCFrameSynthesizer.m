@interface FRCFrameSynthesizer
- (BOOL)checkForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4;
- (BOOL)configureSynthesisWithMode:(int64_t)a3;
- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3;
- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4;
- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4 useLegacyNormalization:(BOOL)a5;
- (id)errorWithErrorCode:(int64_t)a3;
- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 numberOfFrames:(unint64_t)a7 withError:(id *)a8;
- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)scaledForwardFlow backwardFlow:(__CVBuffer *)scaledBackwardFlow timeScales:(id)a7 withError:(id *)a8;
- (unint64_t)flowHeight;
- (unint64_t)flowWidth;
- (void)allocateResources;
- (void)allocateScaledFlow;
- (void)dealloc;
- (void)releaseResources;
- (void)releaseScaledFlow;
- (void)setFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6;
- (void)synthesizeFrameForTimeScale:(float)a3 destination:(__CVBuffer *)a4;
- (void)synthesizeFrameFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8;
- (void)updateFlowSize;
@end

@implementation FRCFrameSynthesizer

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3
{
  return [(FRCFrameSynthesizer *)self initWithUsage:a3 qualityMode:1];
}

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4
{
  return [(FRCFrameSynthesizer *)self initWithUsage:a3 qualityMode:a4 useLegacyNormalization:0];
}

- (FRCFrameSynthesizer)initWithUsage:(int64_t)a3 qualityMode:(int64_t)a4 useLegacyNormalization:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)FRCFrameSynthesizer;
  v8 = [(FRCFrameSynthesizer *)&v30 init];
  if (!v8)
  {
LABEL_11:
    v22 = v8;
    goto LABEL_15;
  }
  os_log_t v9 = os_log_create("com.apple.FRC", "FRCFrameSynthesizer");
  logger = v8->_logger;
  v8->_logger = (OS_os_log *)v9;

  if ((a3 & 0x1000) != 0) {
    int64_t v11 = a3 & 0xFFF;
  }
  else {
    int64_t v11 = a3;
  }
  v8->_int64_t usage = v11;
  v8->_inputRotation = (unint64_t)(a3 & 0x1000) >> 11;
  FRCGetInputFrameSizeForUsage(v11, (uint64_t *)&v8->_width, (uint64_t *)&v8->_height);
  v12 = [FRCImageProcessor alloc];
  int64_t usage = v8->_usage;
  if (v5) {
    uint64_t v14 = [(FRCImageProcessor *)v12 initLegacyModeWithUsage:usage];
  }
  else {
    uint64_t v14 = [(FRCImageProcessor *)v12 initWithUsage:usage];
  }
  processor = v8->_processor;
  v8->_processor = (FRCImageProcessor *)v14;

  if ([(FRCFrameSynthesizer *)v8 configureSynthesisWithMode:a4])
  {
    [(FRCFrameSynthesizer *)v8 updateFlowSize];
    [(FRCFrameSynthesizer *)v8 allocateResources];
    v16 = v8->_logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t width = v8->_width;
      unint64_t height = v8->_height;
      synthesis = v8->_synthesis;
      v20 = v16;
      LODWORD(synthesis) = [(Synthesis *)synthesis synthesisMode];
      BOOL v21 = [(Synthesis *)v8->_synthesis temporalFiltering];
      *(_DWORD *)buf = 134219520;
      int64_t v32 = (int64_t)v8;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = a3;
      *(_WORD *)&v34[4] = 2048;
      *(void *)&v34[6] = width;
      *(_WORD *)&v34[14] = 2048;
      *(void *)&v34[16] = height;
      *(_WORD *)&v34[24] = 1024;
      *(_DWORD *)&v34[26] = a4;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = synthesis;
      HIWORD(v35) = 1024;
      BOOL v36 = v21;
      _os_log_impl(&dword_1DC827000, v20, OS_LOG_TYPE_DEFAULT, "Initialized successfully (%p) [usage:%d (%ldx%ld), mode:%d, synthesis mode:%d, temporal filtering:%d].", buf, 0x38u);
    }
    goto LABEL_11;
  }
  v23 = v8->_logger;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    unint64_t v25 = v8->_width;
    unint64_t v26 = v8->_height;
    v27 = v8->_synthesis;
    v28 = v23;
    uint64_t v29 = [(Synthesis *)v27 synthesisMode];
    *(_DWORD *)buf = 134219008;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    *(void *)v34 = v25;
    *(_WORD *)&v34[8] = 2048;
    *(void *)&v34[10] = v26;
    *(_WORD *)&v34[18] = 2048;
    *(void *)&v34[20] = a4;
    *(_WORD *)&v34[28] = 2048;
    uint64_t v35 = v29;
    _os_log_error_impl(&dword_1DC827000, v28, OS_LOG_TYPE_ERROR, "Initialization failed [usage:%ld (%ldx%ld), mode:%ld, synthesis mode:%ld].", buf, 0x34u);
  }
  v22 = 0;
LABEL_15:

  return v22;
}

- (BOOL)configureSynthesisWithMode:(int64_t)a3
{
  BOOL v5 = objc_alloc_init(Synthesis);
  synthesis = self->_synthesis;
  self->_synthesis = v5;

  if ((unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) > 0x7E8FFF && a3 == 0) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = a3;
  }
  switch(v8)
  {
    case 0:
      os_log_t v9 = self->_synthesis;
      uint64_t v10 = 0;
      goto LABEL_12;
    case 1:
      [(Synthesis *)self->_synthesis setSynthesisMode:(unint64_t)FRCGetNumberOfPixelsForUsage(self->_usage) > 0xE0FFF];
      [(Synthesis *)self->_synthesis setTemporalFiltering:1];
      break;
    case 2:
      os_log_t v9 = self->_synthesis;
      uint64_t v10 = 2;
      goto LABEL_12;
    case 3:
      os_log_t v9 = self->_synthesis;
      uint64_t v10 = 3;
LABEL_12:
      [(Synthesis *)v9 setSynthesisMode:v10];
      break;
    case 4:
      [(Synthesis *)self->_synthesis setSynthesisMode:3];
      [(Synthesis *)self->_synthesis setTwoLayerFlowSplatting:1];
      [(Synthesis *)self->_synthesis setUseFlowConsistencyMap:1];
      break;
    default:
      break;
  }
  [(Synthesis *)self->_synthesis setFramePipeline:1];
  int64_t usage = self->_usage;
  int64_t v11 = self->_synthesis;
  return [(Synthesis *)v11 switchUsageTo:usage];
}

- (void)allocateResources
{
  if (!self->_resourcePreAllocated)
  {
    [(Synthesis *)self->_synthesis allocateResources];
    self->_resourcePreAllocated = 1;
  }
}

- (void)releaseResources
{
  self->_resourcePreAllocated = 0;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_featureCreated) {
    [(Synthesis *)self->_synthesis releaseFeatures];
  }
  [(FRCFrameSynthesizer *)self releaseResources];
  synthesis = self->_synthesis;
  self->_synthesis = 0;

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int64_t usage = self->_usage;
    *(_DWORD *)buf = 134218240;
    int64_t v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = usage;
    _os_log_impl(&dword_1DC827000, logger, OS_LOG_TYPE_DEFAULT, "Released (%p) [usage:%ld]", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)FRCFrameSynthesizer;
  [(FRCFrameSynthesizer *)&v6 dealloc];
}

- (void)synthesizeFrameFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 timeScale:(float)a7 destination:(__CVBuffer *)a8
{
  scaledBackwardFlow = a6;
  scaledForwardFlow = a5;
  if ([(FRCFrameSynthesizer *)self checkForwardFlow:a5 backwardFlow:a6])
  {
    if (!self->_resourcePreAllocated) {
      [(Synthesis *)self->_synthesis allocateResources];
    }
    [(FRCImageProcessor *)self->_processor preProcessFirstInput:a3 secondInput:a4 waitForCompletion:0];
    if (self->_inputFlowScaling)
    {
      [(Synthesis *)self->_synthesis upscaleForwardFlow:scaledForwardFlow backwardFlow:scaledBackwardFlow upscaledForwardFlow:self->_scaledForwardFlow upscaledBackwardFlow:self->_scaledBackwardFlow];
      scaledForwardFlow = self->_scaledForwardFlow;
      scaledBackwardFlow = self->_scaledBackwardFlow;
    }
    [(Synthesis *)self->_synthesis createFeaturesFromFirstImage:[(FRCImageProcessor *)self->_processor normalizedFirst] secondImage:[(FRCImageProcessor *)self->_processor normalizedSecond] flowForward:scaledForwardFlow flowBackward:scaledBackwardFlow];
    *(float *)&double v15 = a7;
    v16 = [(Synthesis *)self->_synthesis synthesizeFrameForTimeScale:0 frameIndex:v15];
    *(float *)&double v17 = a7;
    [(FRCImageProcessor *)self->_processor postProcessNormalizedFrame:v16 output:a8 timeScale:1 waitForCompletion:v17];
    CVPixelBufferRelease(v16);
    [(Synthesis *)self->_synthesis releaseFeatures];
    if (!self->_resourcePreAllocated)
    {
      synthesis = self->_synthesis;
      [(Synthesis *)synthesis releaseResources];
    }
  }
}

- (void)setFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = logger;
    int v13 = 134218752;
    size_t Width = CVPixelBufferGetWidth(a3);
    __int16 v15 = 2048;
    size_t Height = CVPixelBufferGetHeight(a3);
    __int16 v17 = 2048;
    size_t v18 = CVPixelBufferGetWidth(a5);
    __int16 v19 = 2048;
    size_t v20 = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1DC827000, v12, OS_LOG_TYPE_DEFAULT, "New frame pair set: [frame size: %ldx %ld, flow Size : %ld x %ld]", (uint8_t *)&v13, 0x2Au);
  }
  if (self->_featureCreated) {
    [(Synthesis *)self->_synthesis releaseFeatures];
  }
  if (!self->_resourcePreAllocated) {
    [(Synthesis *)self->_synthesis allocateResources];
  }
  [(FRCImageProcessor *)self->_processor setInputRotation:self->_inputRotation];
  [(FRCImageProcessor *)self->_processor preProcessFirstInput:a3 secondInput:a4 waitForCompletion:0];
  [(Synthesis *)self->_synthesis createFeaturesFromFirstImage:[(FRCImageProcessor *)self->_processor normalizedFirst] secondImage:[(FRCImageProcessor *)self->_processor normalizedSecond] flowForward:a5 flowBackward:a6];
  self->_featureCreated = 1;
}

- (void)synthesizeFrameForTimeScale:(float)a3 destination:(__CVBuffer *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = a3;
    _os_log_impl(&dword_1DC827000, logger, OS_LOG_TYPE_DEFAULT, "Synthesize frame [Time Scale: %.2f]", (uint8_t *)&v11, 0xCu);
  }
  if (self->_featureCreated)
  {
    *(float *)&double v8 = a3;
    __int16 v9 = [(Synthesis *)self->_synthesis synthesizeFrameForTimeScale:0 frameIndex:v8];
    *(float *)&double v10 = a3;
    [(FRCImageProcessor *)self->_processor postProcessNormalizedFrame:v9 output:a4 timeScale:1 waitForCompletion:v10];
    CVPixelBufferRelease(v9);
  }
  else
  {
    NSLog(&cfstr_ErrorNeedToSet.isa);
  }
}

- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6 numberOfFrames:(unint64_t)a7 withError:(id *)a8
{
  uint64_t v14 = uniformTimeScales(a7);
  __int16 v15 = [(FRCFrameSynthesizer *)self synthesizeFramesFromFirstFrame:a3 secondFrame:a4 forwardFlow:a5 backwardFlow:a6 timeScales:v14 withError:a8];

  return v15;
}

- (id)synthesizeFramesFromFirstFrame:(__CVBuffer *)a3 secondFrame:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)scaledForwardFlow backwardFlow:(__CVBuffer *)scaledBackwardFlow timeScales:(id)a7 withError:(id *)a8
{
  id v14 = a7;
  if ([(FRCFrameSynthesizer *)self checkForwardFlow:scaledForwardFlow backwardFlow:scaledBackwardFlow])
  {
    if (!self->_resourcePreAllocated) {
      [(Synthesis *)self->_synthesis allocateResources];
    }
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (self->_inputFlowScaling)
    {
      [(Synthesis *)self->_synthesis upscaleForwardFlow:scaledForwardFlow backwardFlow:scaledBackwardFlow upscaledForwardFlow:self->_scaledForwardFlow upscaledBackwardFlow:self->_scaledBackwardFlow];
      scaledForwardFlow = self->_scaledForwardFlow;
      scaledBackwardFlow = self->_scaledBackwardFlow;
    }
    [(FRCImageProcessor *)self->_processor preProcessFirstInput:a3 secondInput:a4 waitForCompletion:0];
    [(Synthesis *)self->_synthesis createFeaturesFromFirstImage:[(FRCImageProcessor *)self->_processor normalizedFirst] secondImage:[(FRCImageProcessor *)self->_processor normalizedSecond] flowForward:scaledForwardFlow flowBackward:scaledBackwardFlow];
    uint64_t v16 = [v14 count];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = 0;
      uint64_t v36 = v16 - 1;
      long long v35 = *MEMORY[0x1E4F1FA48];
      uint64_t v20 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      do
      {
        uint64_t v21 = objc_msgSend(v14, "objectAtIndexedSubscript:", v19, v35);
        [v21 floatValue];
        int v23 = v22;

        LODWORD(v24) = v23;
        id v25 = v14;
        unint64_t v26 = [(Synthesis *)self->_synthesis synthesizeFrameForTimeScale:v19 frameIndex:v24];
        uint64_t v27 = PixelFormatType;
        CVPixelBufferRef PixelBuffer = createPixelBuffer(self->_width, self->_height, PixelFormatType, 0);
        LODWORD(v29) = v23;
        [(FRCImageProcessor *)self->_processor postProcessNormalizedFrame:v26 output:PixelBuffer timeScale:v36 == v19 waitForCompletion:v29];
        objc_super v30 = v26;
        id v14 = v25;
        CVPixelBufferRelease(v30);
        v31 = [FRCFrame alloc];
        long long v37 = v35;
        uint64_t v38 = v20;
        int64_t v32 = [(FRCFrame *)v31 initWithBuffer:PixelBuffer presentationTimeStamp:&v37];
        __int16 v33 = PixelBuffer;
        uint64_t PixelFormatType = v27;
        CVPixelBufferRelease(v33);
        [v17 addObject:v32];

        ++v19;
      }
      while (v18 != v19);
    }
    [(Synthesis *)self->_synthesis releaseFeatures];
    if (!self->_resourcePreAllocated) {
      [(Synthesis *)self->_synthesis releaseResources];
    }
  }
  else if (a8)
  {
    [(FRCFrameSynthesizer *)self errorWithErrorCode:-22008];
    id v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)checkForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v8 = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType == 1278226536 && v8 == 1278226536)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (Width == self->_flowWidth >> 1 && Height == self->_flowHeight)
    {
      BOOL result = 1;
      self->_inputFlowScaling = 1;
      if (self->_scaledFlowBufferAllocated) {
        return result;
      }
      [(FRCFrameSynthesizer *)self allocateScaledFlow];
      return 1;
    }
    unint64_t v13 = self->_width;
    unint64_t v12 = self->_height;
    if (Width == v13 >> 1 && Height == v12)
    {
      size_t v14 = CVPixelBufferGetWidth(a4);
      size_t v15 = CVPixelBufferGetHeight(a4);
      unint64_t v17 = self->_width;
      unint64_t v16 = self->_height;
      if (v14 == v17 >> 1 && v15 == v16) {
        return 1;
      }
      NSLog(&cfstr_FrcInvalidBack.isa, v17 >> 1, v16);
    }
    else
    {
      NSLog(&cfstr_FrcInvalidForw.isa, v13 >> 1, v12);
    }
  }
  else
  {
    NSLog(&cfstr_FrcInvalidPixe.isa);
  }
  return 0;
}

- (id)errorWithErrorCode:(int64_t)a3
{
  if (a3 == -22008) {
    v4 = @"Incorrect optical flow buffers.";
  }
  else {
    v4 = @"Unknown error.";
  }
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:*MEMORY[0x1E4F28568]];
  objc_super v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.FRC" code:a3 userInfo:v5];

  return v6;
}

- (void)updateFlowSize
{
  int64_t usage = self->_usage;
  if ((unint64_t)FRCGetNumberOfPixelsForUsage(usage) >> 10 <= 0x7E8)
  {
    p_flowsize_t Width = (int64x2_t *)&self->_flowWidth;
    p_flowsize_t Height = (uint64_t *)&self->_flowHeight;
    FRCGetInputFrameSizeForUsage(usage, p_flowWidth->i64, p_flowHeight);
    goto LABEL_6;
  }
  uint64_t QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
  if (+[OpticalFlow use4xDownScale:self->_usage])
  {
    uint64_t v5 = getQuarterSizeUsage(QuarterSizeUsage);
    p_flowsize_t Width = (int64x2_t *)&self->_flowWidth;
    p_flowsize_t Height = (uint64_t *)&self->_flowHeight;
    FRCGetInputFrameSizeForUsage(v5, p_flowWidth->i64, p_flowHeight);
    if (v5 != usage)
    {
      *p_flowsize_t Width = vaddq_s64(*p_flowWidth, *p_flowWidth);
      return;
    }
    goto LABEL_6;
  }
  p_flowsize_t Width = (int64x2_t *)&self->_flowWidth;
  p_flowsize_t Height = (uint64_t *)&self->_flowHeight;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, p_flowWidth->i64, p_flowHeight);
  if (QuarterSizeUsage == usage)
  {
LABEL_6:
    p_flowWidth->i64[0] = (unint64_t)p_flowWidth->i64[0] >> 1;
    *p_flowsize_t Height = (unint64_t)*p_flowHeight >> 1;
  }
}

- (void)allocateScaledFlow
{
  if (!self->_scaledForwardFlow) {
    self->_scaledForwardFlow = createPixelBuffer(self->_flowWidth, 2 * self->_flowHeight, 0x4C303068u, 0);
  }
  if (!self->_scaledBackwardFlow) {
    self->_scaledBackwardFlow = createPixelBuffer(self->_flowWidth, 2 * self->_flowHeight, 0x4C303068u, 0);
  }
  self->_scaledFlowBufferAllocated = 1;
}

- (void)releaseScaledFlow
{
  scaledForwardFlow = self->_scaledForwardFlow;
  if (scaledForwardFlow)
  {
    CVPixelBufferRelease(scaledForwardFlow);
    self->_scaledForwardFlow = 0;
  }
  scaledBackwardFlow = self->_scaledBackwardFlow;
  if (scaledBackwardFlow)
  {
    CVPixelBufferRelease(scaledBackwardFlow);
    self->_scaledBackwardFlow = 0;
  }
  self->_scaledFlowBufferAllocated = 0;
}

- (unint64_t)flowWidth
{
  return self->_flowWidth;
}

- (unint64_t)flowHeight
{
  return self->_flowHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
}

@end