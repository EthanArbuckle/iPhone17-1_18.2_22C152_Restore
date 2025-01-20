@interface FRCOpticalFlowEstimator
- (BOOL)skipFirstFramePreProcessing;
- (FRCOpticalFlowEstimator)initWithUsage:(int64_t)a3;
- (FRCOpticalFlowEstimator)initWithWidth:(int64_t)a3 height:(int64_t)a4 configuration:(id)a5;
- (__CVBuffer)allocateFlowBufferFullSize:(BOOL)a3;
- (__CVBuffer)matchFlow:(__CVBuffer *)a3;
- (__CVBuffer)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4;
- (id)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4;
- (int64_t)flowAdaptationFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 inputForwardFlow:(__CVBuffer *)a5 inputBackwardFlow:(__CVBuffer *)a6 outputForwardFlow:(__CVBuffer *)a7 outputBackwardFlow:(__CVBuffer *)a8;
- (int64_t)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 flow:(__CVBuffer *)a5;
- (int64_t)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6;
- (unint64_t)flowHeight;
- (unint64_t)flowWidth;
- (void)allocateResources;
- (void)dealloc;
- (void)matchFlow:(__CVBuffer *)a3 toFullSizeFlow:(__CVBuffer *)a4;
- (void)releaseResources;
@end

@implementation FRCOpticalFlowEstimator

- (unint64_t)flowWidth
{
  if (self->_matchFlowDimensions) {
    return self->_inputWidth;
  }
  else {
    return [(OpticalFlow *)self->_opticalFlow flowWidth];
  }
}

- (unint64_t)flowHeight
{
  if (self->_matchFlowDimensions) {
    return self->_inputHeight;
  }
  else {
    return [(OpticalFlow *)self->_opticalFlow flowHeight];
  }
}

- (BOOL)skipFirstFramePreProcessing
{
  return self->_streamingMode && !self->_firstPair;
}

- (FRCOpticalFlowEstimator)initWithUsage:(int64_t)a3
{
  __int16 v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  FRCGetInputFrameSizeForUsage(a3, &v10, &v9);
  v5 = objc_alloc_init(FRCOpticalFlowEstimatorConfiguration);
  v6 = [(FRCOpticalFlowEstimator *)self initWithWidth:v10 height:v9 configuration:v5];
  v7 = v6;
  if ((v3 & 0x1000) != 0) {
    v6->_inputRotation = 2;
  }

  return v7;
}

- (FRCOpticalFlowEstimator)initWithWidth:(int64_t)a3 height:(int64_t)a4 configuration:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v46.receiver = self;
  v46.super_class = (Class)FRCOpticalFlowEstimator;
  uint64_t v9 = [(FRCOpticalFlowEstimator *)&v46 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_inputWidth = a3;
    v9->_inputHeight = a4;
    v9->_matchFlowDimensions = [v8 matchOutputDimensions] != 0;
    uint64_t v11 = FRCGetUsageFromSize(a3, a4);
    os_log_t v12 = os_log_create("com.apple.FRC", "FRCOpticalFlowEstimator");
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v12;

    if ((v11 & 0x1000) != 0) {
      uint64_t v14 = v11 & 0xFFF;
    }
    else {
      uint64_t v14 = v11;
    }
    v10->_int64_t usage = v14;
    v10->_inputRotation = (unint64_t)(v11 & 0x1000) >> 11;
    FRCGetInputFrameSizeForUsage(v14, (uint64_t *)&v10->_width, (uint64_t *)&v10->_height);
    int v15 = [v8 legacyNormalization];
    v16 = [FRCImageProcessor alloc];
    int64_t usage = v10->_usage;
    if (v15) {
      uint64_t v18 = [(FRCImageProcessor *)v16 initLegacyModeWithUsage:usage];
    }
    else {
      uint64_t v18 = [(FRCImageProcessor *)v16 initWithUsage:usage];
    }
    processor = v10->_processor;
    v10->_processor = (FRCImageProcessor *)v18;

    v20 = objc_alloc_init(OpticalFlow);
    opticalFlow = v10->_opticalFlow;
    v10->_opticalFlow = v20;

    if ([v8 outputPixelFormat] == 1278226536
      || [v8 outputPixelFormat] == 843264104)
    {
      v10->_outputPixelFormat = [v8 outputPixelFormat];
      v22 = v10->_opticalFlow;
      if (v22)
      {
        if (v8)
        {
          if ([v8 mode] == 1 || objc_msgSend(v8, "adaptationLayerOnly")) {
            [(OpticalFlow *)v10->_opticalFlow setUseAdaptationLayer:1];
          }
          v10->_streamingMode = [v8 streamingMode];
          -[OpticalFlow setDisableOutputFlowScaling:](v10->_opticalFlow, "setDisableOutputFlowScaling:", [v8 disableOutputFlowScaling]);
          -[OpticalFlow setRevision:](v10->_opticalFlow, "setRevision:", [v8 revision]);
          -[OpticalFlow setSkipLastLevel:](v10->_opticalFlow, "setSkipLastLevel:", [v8 skipLastLevel]);
          -[OpticalFlow setAdaptationLayerOnly:](v10->_opticalFlow, "setAdaptationLayerOnly:", [v8 adaptationLayerOnly]);
          v22 = v10->_opticalFlow;
        }
        v10->_firstPair = 1;
        [(OpticalFlow *)v22 setConcurrentDualFlowProcessing:1];
        int64_t v23 = v10->_usage;
        if (!v23)
        {
          [(OpticalFlow *)v10->_opticalFlow setTwoStageFlow:1];
          int64_t v23 = v10->_usage;
        }
        if ((unint64_t)FRCGetNumberOfPixelsForUsage(v23) >> 10 >= 0x7E9) {
          [(OpticalFlow *)v10->_opticalFlow setDownsampling:1];
        }
        if ((unint64_t)FRCGetNumberOfPixelsForUsage(v10->_usage) >= 0x7E9000) {
          [(OpticalFlow *)v10->_opticalFlow setTwoStageFlow:1];
        }
        if ([(OpticalFlow *)v10->_opticalFlow switchUsageTo:v10->_usage])
        {
          uint64_t v24 = [(OpticalFlow *)v10->_opticalFlow backwarp];
          backwarp = v10->_backwarp;
          v10->_backwarp = (Backwarp *)v24;

          if (v10->_matchFlowDimensions)
          {
            v10->_intermediateFlow = [(FRCOpticalFlowEstimator *)v10 allocateFlowBufferFullSize:0];
            if ([(OpticalFlow *)v10->_opticalFlow useAdaptationLayer]
              || v10->_outputPixelFormat == 1278226536)
            {
              [(OpticalFlow *)v10->_opticalFlow setWaitForCompletion:0];
            }
          }
          v26 = v10->_logger;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v10->_opticalFlow;
            v28 = v26;
            LODWORD(v27) = [(OpticalFlow *)v27 downsampling];
            BOOL v29 = [(OpticalFlow *)v10->_opticalFlow useAdaptationLayer];
            BOOL v30 = [(OpticalFlow *)v10->_opticalFlow twoStageFlow];
            int v31 = [(OpticalFlow *)v10->_opticalFlow revision];
            uint64_t v32 = [(FRCOpticalFlowEstimator *)v10 flowWidth];
            uint64_t v33 = [(FRCOpticalFlowEstimator *)v10 flowHeight];
            *(_DWORD *)buf = 134219776;
            v48 = v10;
            __int16 v49 = 1024;
            int v50 = v11;
            __int16 v51 = 1024;
            int v52 = (int)v27;
            __int16 v53 = 1024;
            BOOL v54 = v29;
            __int16 v55 = 1024;
            BOOL v56 = v30;
            __int16 v57 = 1024;
            int v58 = v31;
            __int16 v59 = 2048;
            uint64_t v60 = v32;
            __int16 v61 = 2048;
            uint64_t v62 = v33;
            _os_log_impl(&dword_1DC827000, v28, OS_LOG_TYPE_DEFAULT, "Initialized successfully (%p) [usage:%d, 1/4 flow:%d, adaptation layer:%d, twoStage:%d, revision:%d, flow size (%ldx%ld)].", buf, 0x3Eu);
          }
          goto LABEL_29;
        }
        v36 = v10->_logger;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v10->_opticalFlow;
          v38 = v36;
          LODWORD(v37) = [(OpticalFlow *)v37 downsampling];
          BOOL v39 = [(OpticalFlow *)v10->_opticalFlow useAdaptationLayer];
          BOOL v40 = [(OpticalFlow *)v10->_opticalFlow twoStageFlow];
          int v41 = [(OpticalFlow *)v10->_opticalFlow revision];
          uint64_t v42 = [(FRCOpticalFlowEstimator *)v10 flowWidth];
          uint64_t v43 = [(FRCOpticalFlowEstimator *)v10 flowHeight];
          *(_DWORD *)buf = 134219776;
          v48 = v10;
          __int16 v49 = 1024;
          int v50 = v11;
          __int16 v51 = 1024;
          int v52 = (int)v37;
          __int16 v53 = 1024;
          BOOL v54 = v39;
          __int16 v55 = 1024;
          BOOL v56 = v40;
          __int16 v57 = 1024;
          int v58 = v41;
          __int16 v59 = 2048;
          uint64_t v60 = v42;
          __int16 v61 = 2048;
          uint64_t v62 = v43;
          _os_log_impl(&dword_1DC827000, v38, OS_LOG_TYPE_DEFAULT, "Failed to switch (%p) [usage:%d, 1/4 flow:%d, adaptation layer:%d, twoStage:%d, revision:%d, flow size (%ldx%ld)].", buf, 0x3Eu);
        }
        v44 = v10->_processor;
        v10->_processor = 0;

        v35 = v10->_opticalFlow;
        v10->_opticalFlow = 0;
LABEL_36:

        v34 = 0;
        goto LABEL_37;
      }
      NSLog(&cfstr_FailedToCreate_0.isa);
    }
    else
    {
      NSLog(&cfstr_ErrorOutputpix.isa);
    }
    v35 = v10->_processor;
    v10->_processor = 0;
    goto LABEL_36;
  }
LABEL_29:
  v34 = v10;
LABEL_37:

  return v34;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  intermediateFlow = self->_intermediateFlow;
  if (intermediateFlow) {
    CVPixelBufferRelease(intermediateFlow);
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int64_t usage = self->_usage;
    *(_DWORD *)buf = 134218240;
    id v8 = self;
    __int16 v9 = 2048;
    int64_t v10 = usage;
    _os_log_impl(&dword_1DC827000, logger, OS_LOG_TYPE_DEFAULT, "Released (%p) [usage:%ld]", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)FRCOpticalFlowEstimator;
  [(FRCOpticalFlowEstimator *)&v6 dealloc];
}

- (void)allocateResources
{
  self->_resourcePreAllocated = 1;
}

- (void)releaseResources
{
  self->_resourcePreAllocated = 0;
}

- (__CVBuffer)allocateFlowBufferFullSize:(BOOL)a3
{
  if (a3)
  {
    size_t inputWidth = self->_inputWidth;
    unint64_t inputHeight = self->_inputHeight;
  }
  else
  {
    size_t inputWidth = [(OpticalFlow *)self->_opticalFlow flowWidth];
    unint64_t inputHeight = [(OpticalFlow *)self->_opticalFlow flowHeight];
  }
  OSType outputPixelFormat = self->_outputPixelFormat;
  return createPixelBuffer(inputWidth, inputHeight << (outputPixelFormat == 1278226536), outputPixelFormat, 0);
}

- (int64_t)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 flow:(__CVBuffer *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = logger;
    int v17 = 134218240;
    size_t Width = CVPixelBufferGetWidth(a5);
    __int16 v19 = 2048;
    size_t Height = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1DC827000, v10, OS_LOG_TYPE_DEFAULT, "opticalFlowFrom:to:outputFlow [Flow Size %ld x %ld]\n", (uint8_t *)&v17, 0x16u);
  }
  intermediateFlow = a5;
  if (self->_matchFlowDimensions) {
    intermediateFlow = self->_intermediateFlow;
  }
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow allocateResources];
  }
  [(FRCImageProcessor *)self->_processor setInputRotation:self->_inputRotation];
  processor = self->_processor;
  if ([(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    v13 = 0;
  }
  else {
    v13 = a3;
  }
  [(FRCImageProcessor *)processor preProcessFirstInput:v13 secondInput:a4 waitForCompletion:0];
  opticalFlow = self->_opticalFlow;
  int v15 = 0;
  if (![(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    int v15 = [(FRCImageProcessor *)self->_processor normalizedFirst];
  }
  [(OpticalFlow *)opticalFlow opticalFlowFirstFrame:v15 secondFrame:[(FRCImageProcessor *)self->_processor normalizedSecond] flow:intermediateFlow];
  if (self->_matchFlowDimensions) {
    [(FRCOpticalFlowEstimator *)self matchFlow:self->_intermediateFlow toFullSizeFlow:a5];
  }
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow releaseResources];
  }
  self->_firstPair = 0;
  return -22000;
}

- (int64_t)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 forwardFlow:(__CVBuffer *)a5 backwardFlow:(__CVBuffer *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v12 = logger;
    int v18 = 134218240;
    size_t Width = CVPixelBufferGetWidth(a5);
    __int16 v20 = 2048;
    size_t Height = CVPixelBufferGetHeight(a5);
    _os_log_impl(&dword_1DC827000, v12, OS_LOG_TYPE_DEFAULT, "opticalFlowsFrom:to:forwardFlow:backwardFlow [Flow Size %ld x %ld]\n", (uint8_t *)&v18, 0x16u);
  }
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow allocateResources];
  }
  [(FRCImageProcessor *)self->_processor setInputRotation:self->_inputRotation];
  processor = self->_processor;
  if ([(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = a3;
  }
  [(FRCImageProcessor *)processor preProcessFirstInput:v14 secondInput:a4 waitForCompletion:0];
  opticalFlow = self->_opticalFlow;
  v16 = 0;
  if (![(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    v16 = [(FRCImageProcessor *)self->_processor normalizedFirst];
  }
  [(OpticalFlow *)opticalFlow opticalFlowFirstFrame:v16 secondFrame:[(FRCImageProcessor *)self->_processor normalizedSecond] flowForward:a5 flowBackward:a6];
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow releaseResources];
  }
  self->_firstPair = 0;
  return -22000;
}

- (__CVBuffer)opticalFlowFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    opticalFlow = self->_opticalFlow;
    __int16 v9 = logger;
    uint64_t v10 = [(OpticalFlow *)opticalFlow flowWidth];
    unint64_t v11 = [(OpticalFlow *)self->_opticalFlow flowHeight];
    int v14 = 134218240;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    unint64_t v17 = v11;
    _os_log_impl(&dword_1DC827000, v9, OS_LOG_TYPE_DEFAULT, "opticalFlowFrom:to: [Flow Size %ld x %ld]\n", (uint8_t *)&v14, 0x16u);
  }
  os_log_t v12 = [(FRCOpticalFlowEstimator *)self allocateFlowBufferFullSize:self->_matchFlowDimensions];
  if ([(FRCOpticalFlowEstimator *)self opticalFlowFrom:a3 to:a4 flow:v12] != -22000)
  {
    CVPixelBufferRelease(v12);
    return 0;
  }
  return v12;
}

- (__CVBuffer)matchFlow:(__CVBuffer *)a3
{
  v5 = [(FRCOpticalFlowEstimator *)self allocateFlowBufferFullSize:1];
  [(FRCOpticalFlowEstimator *)self matchFlow:a3 toFullSizeFlow:v5];
  return v5;
}

- (void)matchFlow:(__CVBuffer *)a3 toFullSizeFlow:(__CVBuffer *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = logger;
    int v15 = 134218240;
    unint64_t v16 = [(FRCOpticalFlowEstimator *)self flowWidth];
    __int16 v17 = 2048;
    unint64_t v18 = [(FRCOpticalFlowEstimator *)self flowHeight];
    _os_log_impl(&dword_1DC827000, v8, OS_LOG_TYPE_DEFAULT, "Output Flow %ld, %ld", (uint8_t *)&v15, 0x16u);
  }
  if (self->_outputPixelFormat == 1278226536) {
    unint64_t v9 = 2;
  }
  else {
    unint64_t v9 = 1;
  }
  if (self->_outputPixelFormat == 1278226536) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  unint64_t v11 = [(OpticalFlow *)self->_opticalFlow device];
  os_log_t v12 = createTexturesFromCVPixelBuffer(a3, v11, v10, v9);

  v13 = [(OpticalFlow *)self->_opticalFlow device];
  int v14 = createTexturesFromCVPixelBuffer(a4, v13, v10, v9);

  [(Backwarp *)self->_backwarp upscaleFlow:v12 destination:v14];
}

- (id)opticalFlowsFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    opticalFlow = self->_opticalFlow;
    unint64_t v9 = logger;
    uint64_t v10 = [(OpticalFlow *)opticalFlow flowWidth];
    unint64_t v11 = [(OpticalFlow *)self->_opticalFlow flowHeight];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1DC827000, v9, OS_LOG_TYPE_DEFAULT, "opticalFlowsFrom:to: [Flow Size %ld x %ld]\n", buf, 0x16u);
  }
  size_t v12 = [(FRCOpticalFlowEstimator *)self flowHeight] << (self->_outputPixelFormat == 1278226536);
  PixelBuffer = createPixelBuffer([(FRCOpticalFlowEstimator *)self flowWidth], v12, self->_outputPixelFormat, 0);
  int v14 = createPixelBuffer([(FRCOpticalFlowEstimator *)self flowWidth], v12, self->_outputPixelFormat, 0);
  if ([(FRCOpticalFlowEstimator *)self opticalFlowsFrom:a3 to:a4 forwardFlow:PixelBuffer backwardFlow:v14] == -22000)
  {
    int v15 = [FRCFrame alloc];
    *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
    long long v22 = *(_OWORD *)buf;
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v16 = *(void *)&buf[16];
    __int16 v17 = [(FRCFrame *)v15 initWithBuffer:PixelBuffer presentationTimeStamp:buf];
    unint64_t v18 = [FRCFrame alloc];
    *(_OWORD *)buf = v22;
    *(void *)&buf[16] = v16;
    uint64_t v19 = [(FRCFrame *)v18 initWithBuffer:v14 presentationTimeStamp:buf];
    CVPixelBufferRelease(PixelBuffer);
    CVPixelBufferRelease(v14);
    __int16 v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v17, v19, 0);
  }
  else
  {
    CVPixelBufferRelease(PixelBuffer);
    CVPixelBufferRelease(v14);
    __int16 v20 = 0;
  }
  return v20;
}

- (int64_t)flowAdaptationFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 inputForwardFlow:(__CVBuffer *)a5 inputBackwardFlow:(__CVBuffer *)a6 outputForwardFlow:(__CVBuffer *)a7 outputBackwardFlow:(__CVBuffer *)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    log = logger;
    *(_DWORD *)buf = 134218752;
    size_t Width = CVPixelBufferGetWidth(a5);
    __int16 v24 = 2048;
    size_t Height = CVPixelBufferGetHeight(a6);
    __int16 v26 = 2048;
    size_t v27 = CVPixelBufferGetWidth(a7);
    __int16 v28 = 2048;
    size_t v29 = CVPixelBufferGetHeight(a8);
    _os_log_impl(&dword_1DC827000, log, OS_LOG_TYPE_DEFAULT, "flowAdaptationFrom:to:inputForwardFlow:inputBackwardFlow:outputForwardFlow:outputBackwardFlow [inputFlow Size %ld x %ld] [outputFlow Size %ld x %ld]\n", buf, 0x2Au);
  }
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow allocateResources];
  }
  [(FRCImageProcessor *)self->_processor setInputRotation:self->_inputRotation];
  processor = self->_processor;
  if ([(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    __int16 v17 = 0;
  }
  else {
    __int16 v17 = a3;
  }
  [(FRCImageProcessor *)processor preProcessFirstInput:v17 secondInput:a4 waitForCompletion:0];
  opticalFlow = self->_opticalFlow;
  uint64_t v19 = 0;
  if (![(FRCOpticalFlowEstimator *)self skipFirstFramePreProcessing]) {
    uint64_t v19 = [(FRCImageProcessor *)self->_processor normalizedFirst];
  }
  [(OpticalFlow *)opticalFlow flowAdaptationFirstFrame:v19 secondFrame:[(FRCImageProcessor *)self->_processor normalizedSecond] inputFlowForward:a5 inputFlowBackward:a6 outputFlowForward:a7 outputFlowBackward:a8];
  if (!self->_resourcePreAllocated) {
    [(OpticalFlow *)self->_opticalFlow releaseResources];
  }
  self->_firstPair = 0;
  return -22000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backwarp, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_processor, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
}

@end