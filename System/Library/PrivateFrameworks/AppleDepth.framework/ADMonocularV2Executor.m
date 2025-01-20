@interface ADMonocularV2Executor
- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3;
- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4;
- (ADMonocularV2ExecutorParameters)executorParameters;
- (__CVBuffer)prevDisparity;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithColor:(__CVBuffer *)a3 outDisparity:(__CVBuffer *)a4;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3 inputColorROI:(CGRect)a4;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADMonocularV2Executor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADMonocularV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 4;
}

- (id)getIntermediates
{
  v24[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v23[0] = @"name";
    v23[1] = @"image";
    v24[0] = @"PreProcessed Color";
    v24[1] = itmPreProcessedColor;
    v5 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v3 addObject:v5];
  }
  itmUnprocessedOutputDisparity = self->_itmUnprocessedOutputDisparity;
  if (itmUnprocessedOutputDisparity)
  {
    v21[0] = @"name";
    v21[1] = @"image";
    v22[0] = @"Unprocessed OutputDisparity";
    v22[1] = itmUnprocessedOutputDisparity;
    v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 addObject:v7];
  }
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v19[0] = @"name";
    v19[1] = @"image";
    v20[0] = @"Cropped ScaledColor";
    v20[1] = itmCroppedScaledColor;
    v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v3 addObject:v9];
  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v17[0] = @"name";
    v17[1] = @"image";
    v18[0] = @"Rotated Color";
    v18[1] = itmRotatedColor;
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v3 addObject:v11];
  }
  itmPrevDisparity = self->_itmPrevDisparity;
  if (itmPrevDisparity)
  {
    v15[0] = @"name";
    v15[1] = @"image";
    v16[0] = @"Previous Disparity";
    v16[1] = itmPrevDisparity;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 addObject:v13];
  }
  return v3;
}

- (void)dealloc
{
  [(ADMonocularV2Executor *)self deallocateEspressoBuffers];
  CVPixelBufferRelease(self->_itmCroppedScaledColor);
  CVPixelBufferRelease(self->_itmRotatedColor);
  v3.receiver = self;
  v3.super_class = (Class)ADMonocularV2Executor;
  [(ADExecutor *)&v3 dealloc];
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 outDisparity:(__CVBuffer *)a4
{
  v6 = self;
  objc_sync_enter(v6);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (!v6->_isPrepared)
  {
    int64_t v19 = -[ADMonocularV2Executor prepareForEngineType:inputColorROI:](v6, "prepareForEngineType:inputColorROI:", v6->super._engineType, 0.0, 0.0, (double)Width, (double)Height);
    if (v19)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
      }
      goto LABEL_41;
    }
  }
  if (v6->super._espressoRunner)
  {
    if (a4)
    {
      v9 = [(ADExecutorParameters *)v6->_executorParameters logger];
      v10 = [MEMORY[0x263F08AB0] processInfo];
      [v10 systemUptime];
      double v12 = v11;

      *(_DWORD *)buf = 335683588;
      long long v32 = 0u;
      long long v33 = 0u;
      kdebug_trace();
      [v9 logPixelBuffer:a3 name:"inputColor" timestamp:v12];
      uint64_t v13 = [(ADMonocularV2Executor *)v6 numberOfExecutionSteps];
      uint64_t v14 = [(ADExecutorParameters *)v6->_executorParameters stepsToSkip];
      BOOL v15 = [(ADExecutorParameters *)v6->_executorParameters powerMeasureMode];
      v16 = [(ADExecutorParameters *)v6->_executorParameters timeProfiler];
      uint64_t v17 = v13 - v14;
      if (!v15 || (BOOL v18 = v17 < 1, --v17, !v18))
      {
        kdebug_trace();
        [v16 startWithUTFString:"preprocess color"];
        [(ADExecutor *)v6 frameExecutionStart];
        int64_t v19 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v6->super._rotationConstant), v6->_itmPreProcessedColor, &v6->_itmCroppedScaledColor, &v6->_itmRotatedColor, 1, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
        if (v19)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v30 = 0;
            v20 = &_os_log_internal;
            v21 = "failed scaling color image";
LABEL_30:
            _os_log_error_impl(&dword_215F16000, v20, OS_LOG_TYPE_ERROR, v21, v30, 2u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        [v9 logPixelBuffer:v6->_itmPreProcessedColor name:"preProcessedColor" timestamp:v12];
        [v9 logPixelBuffer:v6->_itmPrevDisparity name:"prevDisparity" timestamp:v12];
        [v16 stopWithUTFString:"preprocess color"];
        kdebug_trace();
        if (!v15 || (BOOL v18 = v17 < 1, --v17, !v18))
        {
          kdebug_trace();
          [v16 startWithUTFString:"network execution"];
          int64_t v19 = [(ADEspressoRunner *)v6->super._espressoRunner execute];
          if (v19)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v30 = 0;
              v20 = &_os_log_internal;
              v21 = "failed executing espresso plan";
              goto LABEL_30;
            }
LABEL_40:

            kdebug_trace();
            goto LABEL_41;
          }
          p_itmUnprocessedOutputDisparity = &v6->_itmUnprocessedOutputDisparity;
          [v9 logPixelBuffer:v6->_itmUnprocessedOutputDisparity name:"outputDisparity" timestamp:v12];
          [v16 stopWithUTFString:"network execution"];
          kdebug_trace();
          if (!v15 || (BOOL v18 = v17 < 1, --v17, !v18))
          {
            kdebug_trace();
            [v16 startWithUTFString:"postprocess depth"];
            if (!*a4) {
              *a4 = PixelBufferUtils::createPixelBufferWithSameSize(*p_itmUnprocessedOutputDisparity, (__CVBuffer *)0x66646973, 1);
            }
            int64_t v19 = -[ADMonocularV2Pipeline postProcessDisparity:output:](v6->_pipeline, "postProcessDisparity:output:", *p_itmUnprocessedOutputDisparity);
            if (v19)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v30 = 0;
                v20 = &_os_log_internal;
                v21 = "failed post-processing disparity";
                goto LABEL_30;
              }
              goto LABEL_40;
            }
            [v9 logPixelBuffer:*a4 name:"outputConvertedUnits" timestamp:v12];
            [v16 stopWithUTFString:"postprocess depth"];
            kdebug_trace();
            if (v17 >= 1 || !v15)
            {
              kdebug_trace();
              [v16 startWithUTFString:"postprocess previous depth"];
              espressoRunner = v6->super._espressoRunner;
              v29 = [(ADMonocularV2Pipeline *)v6->_pipeline inferenceDescriptor];
              v25 = [v29 prevDisparityInput];
              v26 = [(ADMonocularV2Pipeline *)v6->_pipeline inferenceDescriptor];
              v27 = [v26 disparityOutput];
              int64_t v19 = [(ADEspressoRunner *)espressoRunner updateFeedbackLoopInputBuffer:&v6->_itmPrevDisparity inputDescriptor:v25 outputBuffer:&v6->_itmUnprocessedOutputDisparity outputDescriptor:v27];

              if (v19)
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_40;
                }
                *(_WORD *)v30 = 0;
                v20 = &_os_log_internal;
                v21 = "failed updating previous disparity";
                goto LABEL_30;
              }
              [v16 stopWithUTFString:"postprocess previous depth"];
              kdebug_trace();
              [(ADExecutor *)v6 frameExecutionEnd];
            }
          }
        }
      }
      int64_t v19 = 0;
      goto LABEL_40;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    int64_t v19 = -22953;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "executor could not be initialized", buf, 2u);
    }
    int64_t v19 = -22960;
  }
LABEL_41:
  objc_sync_exit(v6);

  return v19;
}

- (__CVBuffer)prevDisparity
{
  return self->_itmPrevDisparity;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputColorROI:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = self;
  objc_sync_enter(v9);
  int v18 = 335685116;
  long long v19 = 0u;
  long long v20 = 0u;
  kdebug_trace();
  int64_t v10 = [(ADMonocularV2Pipeline *)v9->_pipeline adjustForEngine:a3];
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to adjust for engine", v17, 2u);
    }
  }
  else
  {
    double v11 = [(ADMonocularV2Pipeline *)v9->_pipeline inferenceDescriptor];
    double v12 = [v11 colorInput];
    uint64_t v13 = [v12 imageDescriptor];
    int64_t v10 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v9, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v13, 1, 2, v11, x, y, width, height);

    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", v17, 2u);
      }
    }
    else
    {
      int64_t v10 = [(ADMonocularV2Executor *)v9 allocateIntermediateBuffers];
      CVPixelBufferLockBaseAddress(v9->_itmPrevDisparity, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v9->_itmPrevDisparity);
      size_t DataSize = CVPixelBufferGetDataSize(v9->_itmPrevDisparity);
      bzero(BaseAddress, DataSize);
      CVPixelBufferUnlockBaseAddress(v9->_itmPrevDisparity, 0);
      v9->_isPrepared = v10 == 0;
    }
  }
  kdebug_trace();
  objc_sync_exit(v9);

  return v10;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADMonocularV2Executor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  v4 = [(ADMonocularV2Pipeline *)self->_pipeline inferenceDescriptor];
  v5 = [v4 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  v6 = self->super._espressoRunner;
  v7 = [(ADMonocularV2Pipeline *)self->_pipeline inferenceDescriptor];
  v8 = [v7 disparityOutput];
  self->_itmUnprocessedOutputDisparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  v9 = self->super._espressoRunner;
  int64_t v10 = [(ADMonocularV2Pipeline *)self->_pipeline inferenceDescriptor];
  double v11 = [v10 prevDisparityInput];
  self->_itmPrevDisparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v11];

  if (self->_itmPreProcessedColor && self->_itmUnprocessedOutputDisparity && self->_itmPrevDisparity) {
    return 0;
  }
  [(ADMonocularV2Executor *)self deallocateEspressoBuffers];
  return -22971;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmUnprocessedOutputDisparity);
  self->_itmUnprocessedOutputDisparitdouble y = 0;
  CVPixelBufferRelease(self->_itmPrevDisparity);
  self->_itmPrevDisparitdouble y = 0;
}

- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  int v15 = 335686448;
  int64_t v16 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADMonocularV2Executor;
  v7 = [(ADExecutor *)&v14 init];
  if (v7)
  {
    v8 = [ADMonocularV2Pipeline alloc];
    v9 = [v6 pipelineParameters];
    uint64_t v10 = [(ADMonocularV2Pipeline *)v8 initWithInputPrioritization:a3 andParameters:v9];
    pipeline = v7->_pipeline;
    v7->_pipeline = (ADMonocularV2Pipeline *)v10;

    if (!v7->_pipeline
      || !v6
      && (id v6 = [[ADMonocularV2ExecutorParameters alloc] initForPipeline:v7->_pipeline]) == 0)
    {
      double v12 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v7->_executorParameters, v6);
    v7->_itmPreProcessedColor = 0;
    v7->_itmUnprocessedOutputDisparitdouble y = 0;
    v7->_itmCroppedScaledColor = 0;
    v7->_itmRotatedColor = 0;
    v7->_itmPrevDisparitdouble y = 0;
    v7->_isPrepared = 0;
  }
  double v12 = v7;
LABEL_8:
  kdebug_trace();

  return v12;
}

- (ADMonocularV2Executor)initWithInputPrioritization:(int64_t)a3
{
  return [(ADMonocularV2Executor *)self initWithInputPrioritization:a3 parameters:0];
}

@end