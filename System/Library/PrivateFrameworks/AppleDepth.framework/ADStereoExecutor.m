@interface ADStereoExecutor
- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4;
- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5;
- (ADStereoExecutorParameters)executorParameters;
- (ADStereoPipeline)pipeline;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3;
- (int64_t)prepareWithBestEngine;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADStereoExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
}

- (ADStereoPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADStereoExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 4;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_refColor);
  CVPixelBufferRelease(self->_itmCroppedScaledRefColor);
  CVPixelBufferRelease(self->_itmRotatedRefColor);
  CVPixelBufferRelease(self->_itmChunkyRefColor);
  CVPixelBufferRelease(self->_auxColor);
  CVPixelBufferRelease(self->_itmCroppedScaledAuxColor);
  CVPixelBufferRelease(self->_itmRotatedAuxColor);
  CVPixelBufferRelease(self->_itmChunkyAuxColor);
  CVPixelBufferRelease(self->_disparity);
  v3.receiver = self;
  v3.super_class = (Class)ADStereoExecutor;
  [(ADExecutor *)&v3 dealloc];
}

- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5
{
  v8 = self;
  objc_sync_enter(v8);
  int64_t v9 = [(ADStereoExecutor *)v8 prepareWithBestEngine];
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
    }
    goto LABEL_4;
  }
  if (v8->super._espressoRunner)
  {
    if (a5)
    {
      v35 = [(ADExecutorParameters *)v8->_executorParameters logger];
      v11 = [MEMORY[0x263F08AB0] processInfo];
      [v11 systemUptime];
      double v13 = v12;

      *(_DWORD *)buf = 335685944;
      long long v38 = 0u;
      long long v39 = 0u;
      kdebug_trace();
      [v35 logPixelBuffer:a3 name:"refColor" timestamp:v13];
      [v35 logPixelBuffer:a4 name:"auxColor" timestamp:v13];
      uint64_t v14 = [(ADStereoExecutor *)v8 numberOfExecutionSteps];
      uint64_t v15 = [(ADExecutorParameters *)v8->_executorParameters stepsToSkip];
      BOOL v16 = [(ADExecutorParameters *)v8->_executorParameters powerMeasureMode];
      v17 = [(ADExecutorParameters *)v8->_executorParameters timeProfiler];
      uint64_t v18 = v14 - v15;
      if (v16)
      {
        BOOL v19 = v18-- < 1;
        if (v19)
        {
          int64_t v9 = 0;
          v24 = v35;
          goto LABEL_37;
        }
      }
      BOOL v34 = v16;
      kdebug_trace();
      [v17 startWithUTFString:"preprocess color"];
      [(ADExecutor *)v8 frameExecutionStart];
      BOOL v20 = [(ADStereoPipeline *)v8->_pipeline shouldPreProcessColorInputs];
      v21 = &OBJC_IVAR___ADStereoExecutor__refColor;
      if (v20) {
        v21 = &OBJC_IVAR___ADStereoExecutor__itmChunkyRefColor;
      }
      uint64_t v22 = *(uint64_t *)((char *)&v8->super.super.isa + *v21);
      v23 = (double *)MEMORY[0x263F001A8];
      int64_t v9 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v8->super._rotationConstant), v22, &v8->_itmCroppedScaledRefColor, &v8->_itmRotatedRefColor, 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      if ([(ADStereoPipeline *)v8->_pipeline shouldPreProcessColorInputs]) {
        [(ADStereoPipeline *)v8->_pipeline preProcessColorInput:v22 toBuffer:v8->_refColor];
      }
      if (v9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v36 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed converting ref image", v36, 2u);
        }
        goto LABEL_16;
      }
      [v17 stopWithUTFString:"preprocess color"];
      kdebug_trace();
      if (v34)
      {
        BOOL v19 = v18-- < 1;
        if (v19)
        {
          int64_t v9 = 0;
LABEL_16:
          v24 = v35;
LABEL_37:

          kdebug_trace();
          goto LABEL_4;
        }
      }
      kdebug_trace();
      [v17 startWithUTFString:"preprocess auxiliary color"];
      v24 = v35;
      BOOL v25 = [(ADStereoPipeline *)v8->_pipeline shouldPreProcessColorInputs];
      v26 = &OBJC_IVAR___ADStereoExecutor__auxColor;
      if (v25) {
        v26 = &OBJC_IVAR___ADStereoExecutor__itmChunkyAuxColor;
      }
      uint64_t v27 = *(uint64_t *)((char *)&v8->super.super.isa + *v26);
      int64_t v9 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a4, LOBYTE(v8->super._rotationConstant), v27, &v8->_itmCroppedScaledAuxColor, &v8->_itmRotatedAuxColor, 1, *v23, v23[1], v23[2], v23[3]);
      if ([(ADStereoPipeline *)v8->_pipeline shouldPreProcessColorInputs]) {
        [(ADStereoPipeline *)v8->_pipeline preProcessColorInput:v27 toBuffer:v8->_auxColor];
      }
      if (v9)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        *(_WORD *)v36 = 0;
        v28 = &_os_log_internal;
        v29 = "failed converting aux image";
LABEL_51:
        _os_log_error_impl(&dword_215F16000, v28, OS_LOG_TYPE_ERROR, v29, v36, 2u);
        goto LABEL_37;
      }
      [v35 logPixelBuffer:v8->_refColor name:"refColorProcessed" timestamp:v13];
      [v35 logPixelBuffer:v8->_auxColor name:"auxColorProcessed" timestamp:v13];
      [v17 stopWithUTFString:"preprocess auxiliary color"];
      kdebug_trace();
      if (!v34 || (BOOL v19 = v18 < 1, --v18, !v19))
      {
        kdebug_trace();
        [v17 startWithUTFString:"network execution"];
        int64_t v9 = [(ADEspressoRunner *)v8->super._espressoRunner execute];
        if (v9)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_37;
          }
          *(_WORD *)v36 = 0;
          v28 = &_os_log_internal;
          v29 = "failed executing espresso plan";
          goto LABEL_51;
        }
        [v35 logPixelBuffer:v8->_disparity name:"disparityOut" timestamp:v13];
        [v17 stopWithUTFString:"network execution"];
        kdebug_trace();
        BOOL v30 = v34;
        if (v18 >= 1) {
          BOOL v30 = 0;
        }
        if (!v30)
        {
          kdebug_trace();
          [v17 startWithUTFString:"postprocess depth"];
          PixelBufferWithSameSize = *a5;
          if (!*a5)
          {
            disparity = v8->_disparity;
            PixelFormatType = (__CVBuffer *)CVPixelBufferGetPixelFormatType(disparity);
            PixelBufferWithSameSize = PixelBufferUtils::createPixelBufferWithSameSize(disparity, PixelFormatType, 1);
            *a5 = PixelBufferWithSameSize;
          }
          if (PixelBufferUtils::copyPixelBuffer(PixelBufferWithSameSize, v8->_disparity, 0))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v36 = 0;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed copying disparity to output buffer. please verify buffer dimensions", v36, 2u);
            }
            int64_t v9 = -22950;
          }
          else
          {
            [v35 logPixelBuffer:*a5 name:"disparityOutProcessed" timestamp:v13];
            [v17 stopWithUTFString:"postprocess depth"];
            kdebug_trace();
            [(ADExecutor *)v8 frameExecutionEnd];
            int64_t v9 = 0;
          }
          goto LABEL_37;
        }
      }
      int64_t v9 = 0;
      goto LABEL_37;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    int64_t v9 = -22953;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    int64_t v9 = -22960;
  }
LABEL_4:
  objc_sync_exit(v8);

  return v9;
}

- (int64_t)prepareWithBestEngine
{
  if (self->_isPrepared || ![(ADStereoExecutor *)self prepareForEngineType:4]) {
    return 0;
  }
  return [(ADStereoExecutor *)self prepareForEngineType:0];
}

- (int64_t)prepareForEngineType:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  kdebug_trace();
  int64_t v5 = [(ADStereoPipeline *)v4->_pipeline adjustForEngine:a3];
  if (!v5)
  {
    v6 = [(ADStereoPipeline *)v4->_pipeline inferenceDescriptor];
    v7 = [v6 referenceInput];
    v8 = [v7 imageDescriptor];
    [v8 sizeForLayout:255];
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    v4->_refColorROI.origin.double x = 0.0;
    v4->_refColorROI.origin.double y = 0.0;
    v4->_refColorROI.size.double width = v10;
    v4->_refColorROI.size.double height = v12;
    double v13 = [v6 auxiliaryInput];
    uint64_t v14 = [v13 imageDescriptor];
    [v14 sizeForLayout:255];
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v4->_auxColorROI.origin.double x = 0.0;
    v4->_auxColorROI.origin.double y = 0.0;
    v4->_auxColorROI.size.double width = v16;
    v4->_auxColorROI.size.double height = v18;
    double x = v4->_refColorROI.origin.x;
    double y = v4->_refColorROI.origin.y;
    double width = v4->_refColorROI.size.width;
    double height = v4->_refColorROI.size.height;
    v23 = [v6 referenceInput];
    v24 = [v23 imageDescriptor];
    int64_t v5 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v4, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v24, 1, 2, v6, x, y, width, height);

    if (!v5)
    {
      int64_t v5 = [(ADStereoExecutor *)v4 allocateIntermediateBuffers];
      v4->_isPrepared = v5 == 0;
    }
  }
  kdebug_trace();
  objc_sync_exit(v4);

  return v5;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADStereoExecutor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  v4 = [(ADStereoPipeline *)self->_pipeline inferenceDescriptor];
  int64_t v5 = [v4 referenceInput];
  self->_refColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  v6 = self->super._espressoRunner;
  v7 = [(ADStereoPipeline *)self->_pipeline inferenceDescriptor];
  v8 = [v7 auxiliaryInput];
  self->_auxColor = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  double v9 = self->super._espressoRunner;
  CGFloat v10 = [(ADStereoPipeline *)self->_pipeline inferenceDescriptor];
  double v11 = [v10 disparityOutput];
  self->_disparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v11];

  refColor = self->_refColor;
  if (refColor && self->_auxColor && self->_disparity)
  {
    self->_itmChunkyRefColor = PixelBufferUtils::createPixelBufferCopy(refColor, v12);
    PixelBufferCopdouble y = PixelBufferUtils::createPixelBufferCopy(self->_auxColor, v14);
    int64_t result = 0;
    self->_itmChunkyAuxColor = PixelBufferCopy;
  }
  else
  {
    [(ADStereoExecutor *)self deallocateEspressoBuffers];
    return -22971;
  }
  return result;
}

- (void)deallocateEspressoBuffers
{
  self->_refColor = 0;
  CVPixelBufferRelease(self->_auxColor);
  self->_auxColor = 0;
  CVPixelBufferRelease(self->_disparity);
  self->_disparitdouble y = 0;
}

- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5
{
  id v8 = a5;
  int v19 = 335681024;
  long long v20 = 0u;
  long long v21 = 0u;
  kdebug_trace();
  v18.receiver = self;
  v18.super_class = (Class)ADStereoExecutor;
  double v9 = [(ADExecutor *)&v18 init];
  if (v9)
  {
    CGFloat v10 = [ADStereoPipeline alloc];
    double v11 = [v8 pipelineParameters];
    uint64_t v12 = [(ADStereoPipeline *)v10 initWithInputAlignment:a3 prioritization:a4 andParameters:v11];
    pipeline = v9->_pipeline;
    v9->_pipeline = (ADStereoPipeline *)v12;

    if (!v9->_pipeline
      || !v9->_executorParameters
      && (uint64_t v14 = [[ADStereoExecutorParameters alloc] initForPipeline:v9->_pipeline], executorParameters = v9->_executorParameters, v9->_executorParameters = v14, executorParameters, !v9->_executorParameters))
    {
      CGFloat v16 = 0;
      goto LABEL_8;
    }
    v9->_refColor = 0;
    v9->_itmCroppedScaledRefColor = 0;
    v9->_itmRotatedRefColor = 0;
    v9->_itmChunkyRefColor = 0;
    v9->_auxColor = 0;
    v9->_itmCroppedScaledAuxColor = 0;
    v9->_itmRotatedAuxColor = 0;
    v9->_itmChunkyAuxColor = 0;
    v9->_disparitdouble y = 0;
    v9->_isPrepared = 0;
  }
  CGFloat v16 = v9;
LABEL_8:
  kdebug_trace();

  return v16;
}

- (ADStereoExecutor)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4
{
  return [(ADStereoExecutor *)self initWithInputAlignment:a3 prioritization:a4 andParameters:0];
}

@end