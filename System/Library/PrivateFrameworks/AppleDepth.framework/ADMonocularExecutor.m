@interface ADMonocularExecutor
- (ADMonocularExecutor)initWithInputPrioritization:(int64_t)a3;
- (ADMonocularExecutorParameters)executorParameters;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithColor:(__CVBuffer *)a3 outDepthMap:(__CVBuffer *)a4;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADMonocularExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADMonocularExecutorParameters)executorParameters
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
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v23[0] = @"name";
    v23[1] = @"image";
    v24[0] = @"CroppedScaledColor";
    v24[1] = itmCroppedScaledColor;
    v5 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v3 addObject:v5];
  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v21[0] = @"name";
    v21[1] = @"image";
    v22[0] = @"RotatedColor";
    v22[1] = itmRotatedColor;
    v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 addObject:v7];
  }
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v19[0] = @"name";
    v19[1] = @"image";
    v20[0] = @"PreProcessedColor";
    v20[1] = itmPreProcessedColor;
    v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v3 addObject:v9];
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v17[0] = @"name";
    v17[1] = @"image";
    v18[0] = @"UnprocessedDepth";
    v18[1] = itmUnprocessedDepth;
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v3 addObject:v11];
  }
  itmPostProcessedDepth = self->_itmPostProcessedDepth;
  if (itmPostProcessedDepth)
  {
    v15[0] = @"name";
    v15[1] = @"image";
    v16[0] = @"PostProcessedDepth";
    v16[1] = itmPostProcessedDepth;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 addObject:v13];
  }
  return v3;
}

- (void)dealloc
{
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor) {
    CVPixelBufferRelease(itmCroppedScaledColor);
  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor) {
    CVPixelBufferRelease(itmRotatedColor);
  }
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor) {
    CVPixelBufferRelease(itmPreProcessedColor);
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth) {
    CVPixelBufferRelease(itmUnprocessedDepth);
  }
  itmPostProcessedDepth = self->_itmPostProcessedDepth;
  if (itmPostProcessedDepth) {
    CVPixelBufferRelease(itmPostProcessedDepth);
  }
  v8.receiver = self;
  v8.super_class = (Class)ADMonocularExecutor;
  [(ADExecutor *)&v8 dealloc];
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 outDepthMap:(__CVBuffer *)a4
{
  v6 = self;
  objc_sync_enter(v6);
  if (v6->super._espressoRunner)
  {
    if (a4)
    {
      v7 = [(ADExecutorParameters *)v6->_executorParameters logger];
      objc_super v8 = [MEMORY[0x263F08AB0] processInfo];
      [v8 systemUptime];
      double v10 = v9;

      *(_DWORD *)buf = 335683096;
      long long v33 = 0u;
      long long v34 = 0u;
      kdebug_trace();
      [v7 logPixelBuffer:a3 name:"inputColor" timestamp:v10];
      uint64_t v11 = [(ADMonocularExecutor *)v6 numberOfExecutionSteps];
      uint64_t v12 = [(ADExecutorParameters *)v6->_executorParameters stepsToSkip];
      BOOL v13 = [(ADExecutorParameters *)v6->_executorParameters powerMeasureMode];
      v14 = [(ADExecutorParameters *)v6->_executorParameters timeProfiler];
      uint64_t v15 = v11 - v12;
      if (!v13 || (BOOL v16 = v15 < 1, --v15, !v16))
      {
        kdebug_trace();
        [v14 startWithUTFString:"preprocess color"];
        [(ADExecutor *)v6 frameExecutionStart];
        int64_t v17 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v6->super._rotationConstant), v6->_itmPreProcessedColor, &v6->_itmCroppedScaledColor, &v6->_itmRotatedColor, 0, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
        if (v17)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v31 = 0;
            v18 = &_os_log_internal;
            v19 = "failed scaling color image";
LABEL_24:
            _os_log_error_impl(&dword_215F16000, v18, OS_LOG_TYPE_ERROR, v19, v31, 2u);
            goto LABEL_44;
          }
          goto LABEL_44;
        }
        [v7 logPixelBuffer:v6->_itmPreProcessedColor name:"processedColor" timestamp:v10];
        [v14 stopWithUTFString:"preprocess color"];
        kdebug_trace();
        if (!v13 || (BOOL v16 = v15 < 1, --v15, !v16))
        {
          kdebug_trace();
          [v14 startWithUTFString:"network execution"];
          int64_t v17 = [(ADEspressoRunner *)v6->super._espressoRunner execute];
          if (v17)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v31 = 0;
              v18 = &_os_log_internal;
              v19 = "failed executing espresso plan";
              goto LABEL_24;
            }
LABEL_44:

            kdebug_trace();
            goto LABEL_45;
          }
          [v7 logPixelBuffer:v6->_itmUnprocessedDepth name:"depthOut" timestamp:v10];
          [v14 stopWithUTFString:"network execution"];
          kdebug_trace();
          if (!v13 || (BOOL v16 = v15 < 1, --v15, !v16))
          {
            kdebug_trace();
            [v14 startWithUTFString:"postprocess depth"];
            int64_t v17 = [(ADMonocularPipeline *)v6->_pipeline postProcessWithDepth:v6->_itmUnprocessedDepth depthOutput:v6->_itmPostProcessedDepth];
            if (v17)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v31 = 0;
                v18 = &_os_log_internal;
                v19 = "failed post processing network output";
                goto LABEL_24;
              }
              goto LABEL_44;
            }
            [v7 logPixelBuffer:v6->_itmPostProcessedDepth name:"depthOutProcessed" timestamp:v10];
            [v14 stopWithUTFString:"postprocess depth"];
            kdebug_trace();
            if (v15 >= 1 || !v13)
            {
              kdebug_trace();
              [v14 startWithUTFString:"output rotation"];
              uint64_t rotationConstant = v6->super._rotationConstant;
              if (rotationConstant == 3)
              {
                uint64_t rotationConstant = 1;
              }
              else if (rotationConstant == 1)
              {
                uint64_t rotationConstant = 3;
              }
              v22 = *a4;
              if (!*a4)
              {
                v23 = [(ADMonocularPipeline *)v6->_pipeline processedDepthOutputDescriptor];
                [v23 sizeForLayout:v6->super._layout];
                CGFloat v26 = v24;
                if ((rotationConstant | 2) == 3)
                {
                  CGFloat v27 = v25;
                }
                else
                {
                  CGFloat v27 = v24;
                  CGFloat v26 = v25;
                }

                v28 = [(ADMonocularPipeline *)v6->_pipeline processedDepthOutputDescriptor];
                OSType v29 = [v28 pixelFormat];
                v35.width = v27;
                v35.height = v26;
                *a4 = PixelBufferUtils::createPixelBuffer(v29, v35, 1);

                v22 = *a4;
              }
              if (PixelBufferUtils::rotatePixelBuffer(v6->_itmPostProcessedDepth, v22, (__CVBuffer *)rotationConstant, 0))
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v31 = 0;
                  _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed rotating depth. please verify output buffer dimensions", v31, 2u);
                }
                int64_t v17 = -22950;
                goto LABEL_44;
              }
              -[ADExecutor convertIntrinsicsFrom:cropBy:to:](v6, "convertIntrinsicsFrom:cropBy:to:", a3, *a4, v6->super._inputRoi.origin.x, v6->super._inputRoi.origin.y, v6->super._inputRoi.size.width, v6->super._inputRoi.size.height);
              [v7 logPixelBuffer:*a4 name:"depthOutProcessedRotated" priority:0 timestamp:v10];
              [v14 stopWithUTFString:"output rotation"];
              kdebug_trace();
              [(ADExecutor *)v6 frameExecutionEnd];
            }
          }
        }
      }
      int64_t v17 = 0;
      goto LABEL_44;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
    }
    int64_t v17 = -22953;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    int64_t v17 = -22960;
  }
LABEL_45:
  objc_sync_exit(v6);

  return v17;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v13 = self;
  objc_sync_enter(v13);
  kdebug_trace();
  v14 = [(ADMonocularPipeline *)v13->_pipeline inferenceDescriptor];
  uint64_t v15 = [v14 colorInput];
  BOOL v16 = [v15 imageDescriptor];
  int64_t v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v13, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, v7, a6, v14, x, y, width, height);

  if (!v17) {
    int64_t v17 = [(ADMonocularExecutor *)v13 allocateIntermediateBuffers];
  }

  kdebug_trace();
  objc_sync_exit(v13);

  return v17;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5
{
  return -[ADMonocularExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, *(void *)&a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADMonocularExecutor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  v4 = [(ADMonocularPipeline *)self->_pipeline inferenceDescriptor];
  v5 = [v4 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  v6 = self->super._espressoRunner;
  uint64_t v7 = [(ADMonocularPipeline *)self->_pipeline inferenceDescriptor];
  objc_super v8 = [v7 depthOutput];
  self->_itmUnprocessedDepth = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  if (self->_itmPreProcessedColor && self->_itmUnprocessedDepth)
  {
    double v9 = [(ADMonocularPipeline *)self->_pipeline inferenceDescriptor];
    double v10 = [v9 depthOutput];
    uint64_t v11 = [v10 imageDescriptor];

    [v11 sizeForLayout:self->super._layout];
    +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v11 pixelFormat], &self->_itmPostProcessedDepth, v12, v13);
    if (self->_itmPostProcessedDepth)
    {
      int64_t v14 = 0;
    }
    else
    {
      [(ADMonocularExecutor *)self deallocateEspressoBuffers];
      int64_t v14 = -22965;
    }
  }
  else
  {
    [(ADMonocularExecutor *)self deallocateEspressoBuffers];
    return -22971;
  }
  return v14;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
}

- (ADMonocularExecutor)initWithInputPrioritization:(int64_t)a3
{
  int v13 = 335685792;
  int64_t v14 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  kdebug_trace();
  v12.receiver = self;
  v12.super_class = (Class)ADMonocularExecutor;
  v5 = [(ADExecutor *)&v12 init];
  if (v5)
  {
    v6 = [[ADMonocularPipeline alloc] initWithInputPrioritization:a3];
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;

    if (!v5->_pipeline)
    {
      double v10 = 0;
      goto LABEL_6;
    }
    objc_super v8 = [[ADMonocularExecutorParameters alloc] initForPipeline:v5->_pipeline];
    executorParameters = v5->_executorParameters;
    v5->_executorParameters = v8;

    v5->_itmCroppedScaledColor = 0;
    v5->_itmRotatedColor = 0;
    v5->_itmPreProcessedColor = 0;
    v5->_itmUnprocessedDepth = 0;
    v5->_itmPostProcessedDepth = 0;
  }
  double v10 = v5;
LABEL_6:
  kdebug_trace();

  return v10;
}

@end