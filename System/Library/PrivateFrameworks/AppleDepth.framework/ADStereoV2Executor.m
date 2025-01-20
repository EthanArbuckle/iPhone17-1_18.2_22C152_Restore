@interface ADStereoV2Executor
- (ADStereoV2Executor)init;
- (ADStereoV2Executor)initWithParameters:(id)a3;
- (ADStereoV2ExecutorParameters)executorParameters;
- (__CVBuffer)prevColorFeatures;
- (__CVBuffer)prevDepthFeatures;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADStereoV2Executor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingPreviousFeaturesRatioMinBuffer, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingCurrentFeaturesRatioMinBuffer, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADStereoV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
}

- (id)getIntermediates
{
  v32[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  BOOL v4 = [(ADStereoV2Pipeline *)self->_pipeline shouldPreProcessColorInputs];
  v5 = &OBJC_IVAR___ADStereoV2Executor__refColor;
  if (v4) {
    v5 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyRefColor;
  }
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + *v5);
  if (v6)
  {
    v31[0] = @"name";
    v31[1] = @"image";
    v32[0] = @"PreProcessed Reference";
    v32[1] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v3 addObject:v7];
  }
  BOOL v8 = [(ADStereoV2Pipeline *)self->_pipeline shouldPreProcessColorInputs];
  v9 = &OBJC_IVAR___ADStereoV2Executor__auxColor;
  if (v8) {
    v9 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyAuxColor;
  }
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.isa + *v9);
  if (v10)
  {
    v29[0] = @"name";
    v29[1] = @"image";
    v30[0] = @"PreProcessed Auxerence";
    v30[1] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v3 addObject:v11];
  }
  itmPrevColorFeatures = self->_itmPrevColorFeatures;
  if (itmPrevColorFeatures)
  {
    v27[0] = @"name";
    v27[1] = @"image";
    v28[0] = @"Previous Color Features";
    v28[1] = itmPrevColorFeatures;
    v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v3 addObject:v13];
  }
  itmPrevDepthFeatures = self->_itmPrevDepthFeatures;
  if (itmPrevDepthFeatures)
  {
    v25[0] = @"name";
    v25[1] = @"image";
    v26[0] = @"Previous Depth Features";
    v26[1] = itmPrevDepthFeatures;
    v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v3 addObject:v15];
  }
  itmColorFeaturesOutput = self->_itmColorFeaturesOutput;
  if (itmColorFeaturesOutput)
  {
    v23[0] = @"name";
    v23[1] = @"image";
    v24[0] = @"Output Color Features";
    v24[1] = itmColorFeaturesOutput;
    v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v3 addObject:v17];
  }
  itmDepthFeaturesOutput = self->_itmDepthFeaturesOutput;
  if (itmDepthFeaturesOutput)
  {
    v21[0] = @"name";
    v21[1] = @"image";
    v22[0] = @"Output Depth Features";
    v22[1] = itmDepthFeaturesOutput;
    v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 addObject:v19];
  }
  return v3;
}

- (void)dealloc
{
  [(ADStereoV2Executor *)self deallocateEspressoBuffers];
  CVPixelBufferRelease(self->_itmCroppedScaledRefColor);
  CVPixelBufferRelease(self->_itmRotatedRefColor);
  CVPixelBufferRelease(self->_itmChunkyRefColor);
  CVPixelBufferRelease(self->_itmCroppedScaledAuxColor);
  CVPixelBufferRelease(self->_itmRotatedAuxColor);
  CVPixelBufferRelease(self->_itmChunkyAuxColor);
  v3.receiver = self;
  v3.super_class = (Class)ADStereoV2Executor;
  [(ADExecutor *)&v3 dealloc];
}

- (int64_t)executeWithRefColor:(__CVBuffer *)a3 auxColor:(__CVBuffer *)a4 outDisparityMap:(__CVBuffer *)a5
{
  BOOL v8 = self;
  objc_sync_enter(v8);
  if (!v8->_isPrepared)
  {
    int64_t v21 = [(ADStereoV2Executor *)v8 prepareForEngineType:v8->super._engineType];
    if (v21)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v51 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", v51, 2u);
      }
      goto LABEL_70;
    }
  }
  if (v8->super._espressoRunner)
  {
    if (a5)
    {
      v48 = [(ADExecutorParameters *)v8->_executorParameters logger];
      v9 = [MEMORY[0x263F08AB0] processInfo];
      [v9 systemUptime];
      double v11 = v10;

      *(_DWORD *)v51 = 335683080;
      long long v52 = 0u;
      long long v53 = 0u;
      kdebug_trace();
      [v48 logPixelBuffer:a3 name:"refColor" timestamp:v11];
      [v48 logPixelBuffer:a4 name:"auxColor" timestamp:v11];
      uint64_t v12 = [(ADStereoV2Executor *)v8 numberOfExecutionSteps];
      uint64_t v13 = [(ADExecutorParameters *)v8->_executorParameters stepsToSkip];
      BOOL v14 = [(ADExecutorParameters *)v8->_executorParameters powerMeasureMode];
      v49 = [(ADExecutorParameters *)v8->_executorParameters timeProfiler];
      uint64_t v15 = v12 - v13;
      if (!v14 || (BOOL v16 = v15 < 1, --v15, !v16))
      {
        kdebug_trace();
        [v49 startWithUTFString:"preprocess color"];
        [(ADExecutor *)v8 frameExecutionStart];
        BOOL v17 = [(ADStereoV2Pipeline *)v8->_pipeline shouldPreProcessColorInputs];
        v18 = &OBJC_IVAR___ADStereoV2Executor__refColor;
        if (v17) {
          v18 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyRefColor;
        }
        uint64_t v19 = *(uint64_t *)((char *)&v8->super.super.isa + *v18);
        v20 = (double *)MEMORY[0x263F001A8];
        int64_t v21 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v8->super._rotationConstant), v19, &v8->_itmCroppedScaledRefColor, &v8->_itmRotatedRefColor, 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        if (v21)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
LABEL_69:

            kdebug_trace();
            goto LABEL_70;
          }
          *(_WORD *)buf = 0;
          v22 = &_os_log_internal;
          v23 = "failed converting ref image";
LABEL_11:
          _os_log_error_impl(&dword_215F16000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
          goto LABEL_69;
        }
        if ([(ADStereoV2Pipeline *)v8->_pipeline shouldPreProcessColorInputs])
        {
          int64_t v21 = [(ADStereoV2Pipeline *)v8->_pipeline preProcessColorInput:v19 toBuffer:v8->_refColor];
          if (v21)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_69;
            }
            *(_WORD *)buf = 0;
            v22 = &_os_log_internal;
            v23 = "failed pre processing ref image";
            goto LABEL_11;
          }
        }
        [v49 stopWithUTFString:"preprocess color"];
        kdebug_trace();
        if (!v14 || (BOOL v16 = v15 < 1, --v15, !v16))
        {
          kdebug_trace();
          [v49 startWithUTFString:"preprocess auxiliary color"];
          BOOL v24 = [(ADStereoV2Pipeline *)v8->_pipeline shouldPreProcessColorInputs];
          v25 = &OBJC_IVAR___ADStereoV2Executor__auxColor;
          if (v24) {
            v25 = &OBJC_IVAR___ADStereoV2Executor__itmChunkyAuxColor;
          }
          uint64_t v26 = *(uint64_t *)((char *)&v8->super.super.isa + *v25);
          int64_t v21 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a4, LOBYTE(v8->super._rotationConstant), v26, &v8->_itmCroppedScaledAuxColor, &v8->_itmRotatedAuxColor, 1, *v20, v20[1], v20[2], v20[3]);
          if (v21)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_69;
            }
            *(_WORD *)buf = 0;
            v22 = &_os_log_internal;
            v23 = "failed converting aux image";
            goto LABEL_11;
          }
          if ([(ADStereoV2Pipeline *)v8->_pipeline shouldPreProcessColorInputs])
          {
            int64_t v21 = [(ADStereoV2Pipeline *)v8->_pipeline preProcessColorInput:v26 toBuffer:v8->_auxColor];
            if (v21)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_69;
              }
              *(_WORD *)buf = 0;
              v22 = &_os_log_internal;
              v23 = "failed pre processing aux image";
              goto LABEL_11;
            }
          }
          [v48 logPixelBuffer:v8->_refColor name:"refColorProcessed" timestamp:v11];
          [v48 logPixelBuffer:v8->_auxColor name:"auxColorProcessed" timestamp:v11];
          [v48 logPixelBuffer:v8->_itmPrevDepthFeatures name:"prevDepthFeatures" timestamp:v11];
          p_itmPrevColorFeatures = &v8->_itmPrevColorFeatures;
          [v48 logPixelBuffer:v8->_itmPrevColorFeatures name:"prevColorFeatures" timestamp:v11];
          v27 = [(ADStereoV2Pipeline *)v8->_pipeline inferenceDescriptor];
          v28 = [v27 temporalSmoothingCurrentFeaturesRatioMinInput];
          v29 = [v28 imageDescriptor];
          int v30 = [v29 pixelFormat];

          if (v30 != 1278226534 && v30 != 1278226536)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "unsupported temporal smoothing knob pixel format", buf, 2u);
            }
            int64_t v21 = -22950;
            goto LABEL_69;
          }
          [(ADStereoV2ExecutorParameters *)v8->_executorParameters temporalSmoothingCurrentFeaturesRatioMin];
          *(_DWORD *)[(ADEspressoBufferHandle *)v8->_temporalSmoothingCurrentFeaturesRatioMinBuffer data] = v31;
          [(ADStereoV2ExecutorParameters *)v8->_executorParameters temporalSmoothingPreviousFeaturesRatioMin];
          *(_DWORD *)[(ADEspressoBufferHandle *)v8->_temporalSmoothingPreviousFeaturesRatioMinBuffer data] = v32;
          [v49 stopWithUTFString:"preprocess auxiliary color"];
          kdebug_trace();
          if (!v14 || (BOOL v16 = v15 < 1, --v15, !v16))
          {
            kdebug_trace();
            [v49 startWithUTFString:"network execution"];
            int64_t v21 = [(ADEspressoRunner *)v8->super._espressoRunner execute];
            if (v21)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_69;
              }
              *(_WORD *)buf = 0;
              v22 = &_os_log_internal;
              v23 = "failed executing espresso plan";
              goto LABEL_11;
            }
            [v48 logPixelBuffer:v8->_disparity name:"outputDisparity" timestamp:v11];
            [v48 logPixelBuffer:v8->_itmColorFeaturesOutput name:"outputColorFeatures" timestamp:v11];
            [v48 logPixelBuffer:v8->_itmDepthFeaturesOutput name:"outputDepthFeatures" timestamp:v11];
            [v49 stopWithUTFString:"network execution"];
            kdebug_trace();
            if (!v14 || (BOOL v16 = v15 < 1, --v15, !v16))
            {
              kdebug_trace();
              [v49 startWithUTFString:"postprocess depth"];
              if (!*a5)
              {
                disparity = v8->_disparity;
                PixelFormatType = (__CVBuffer *)CVPixelBufferGetPixelFormatType(disparity);
                *a5 = PixelBufferUtils::createPixelBufferWithSameSize(disparity, PixelFormatType, 1);
              }
              int64_t v21 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", v8->_disparity);
              if (v21)
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_69;
                }
                *(_WORD *)buf = 0;
                v22 = &_os_log_internal;
                v23 = "failed converting disparity";
                goto LABEL_11;
              }
              [v48 logPixelBuffer:*a5 name:"outputDisparityConvertedUnits" timestamp:v11];
              [v49 stopWithUTFString:"postprocess depth"];
              kdebug_trace();
              if (v15 >= 1 || !v14)
              {
                kdebug_trace();
                [v49 startWithUTFString:"postprocess previous depth"];
                if ([(ADStereoV2ExecutorParameters *)v8->_executorParameters temporalConsistencyActive])
                {
                  if (v8->_itmPrevDepthFeatures)
                  {
                    espressoRunner = v8->super._espressoRunner;
                    v37 = [(ADStereoV2Pipeline *)v8->_pipeline inferenceDescriptor];
                    v38 = [v37 prevDepthFeaturesInput];
                    v39 = [(ADStereoV2Pipeline *)v8->_pipeline inferenceDescriptor];
                    v40 = [v39 depthFeaturesOutput];
                    int64_t v21 = [(ADEspressoRunner *)espressoRunner updateFeedbackLoopInputBuffer:&v8->_itmPrevDepthFeatures inputDescriptor:v38 outputBuffer:&v8->_itmDepthFeaturesOutput outputDescriptor:v40];

                    if (v21)
                    {
                      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_69;
                      }
                      *(_WORD *)buf = 0;
                      v22 = &_os_log_internal;
                      v23 = "failed updating previous depth features";
                      goto LABEL_11;
                    }
                  }
                  if (*p_itmPrevColorFeatures)
                  {
                    v41 = v8->super._espressoRunner;
                    v42 = [(ADStereoV2Pipeline *)v8->_pipeline inferenceDescriptor];
                    v43 = [v42 prevColorFeaturesInput];
                    v44 = [(ADStereoV2Pipeline *)v8->_pipeline inferenceDescriptor];
                    v45 = [v44 colorFeaturesOutput];
                    int64_t v21 = [(ADEspressoRunner *)v41 updateFeedbackLoopInputBuffer:p_itmPrevColorFeatures inputDescriptor:v43 outputBuffer:&v8->_itmColorFeaturesOutput outputDescriptor:v45];

                    if (v21)
                    {
                      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_69;
                      }
                      *(_WORD *)buf = 0;
                      v22 = &_os_log_internal;
                      v23 = "failed updating previous color features";
                      goto LABEL_11;
                    }
                  }
                }
                [v49 stopWithUTFString:"postprocess previous depth"];
                kdebug_trace();
                [(ADExecutor *)v8 frameExecutionEnd];
              }
            }
          }
        }
      }
      int64_t v21 = 0;
      goto LABEL_69;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", v51, 2u);
    }
    int64_t v21 = -22953;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v51 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "executor could not be initialized", v51, 2u);
    }
    int64_t v21 = -22960;
  }
LABEL_70:
  objc_sync_exit(v8);

  return v21;
}

- (__CVBuffer)prevDepthFeatures
{
  if ([(ADStereoV2ExecutorParameters *)self->_executorParameters temporalConsistencyActive]) {
    return self->_itmPrevDepthFeatures;
  }
  else {
    return 0;
  }
}

- (__CVBuffer)prevColorFeatures
{
  if ([(ADStereoV2ExecutorParameters *)self->_executorParameters temporalConsistencyActive]) {
    return self->_itmPrevColorFeatures;
  }
  else {
    return 0;
  }
}

- (int64_t)prepareForEngineType:(unint64_t)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  int v19 = 335682368;
  long long v20 = 0u;
  long long v21 = 0u;
  kdebug_trace();
  int64_t v5 = [(ADStereoV2Pipeline *)v4->_pipeline adjustForEngine:a3];
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to adjust for engine", v18, 2u);
    }
  }
  else
  {
    uint64_t v6 = [(ADStereoV2Pipeline *)v4->_pipeline inferenceDescriptor];
    v7 = [v6 referenceInput];
    BOOL v8 = [v7 imageDescriptor];
    [v8 sizeForLayout:255];
    double v10 = v9;
    double v12 = v11;

    uint64_t v13 = [v6 referenceInput];
    BOOL v14 = [v13 imageDescriptor];
    int64_t v5 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v4, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v14, 1, 2, v6, 0.0, 0.0, v10, v12);

    if (v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", v18, 2u);
      }
    }
    else
    {
      int64_t v5 = [(ADStereoV2Executor *)v4 allocateIntermediateBuffers];
      PixelBufferUtils::blacken(v4->_itmPrevDepthFeatures, v15);
      PixelBufferUtils::blacken(v4->_itmPrevColorFeatures, v16);
      v4->_isPrepared = v5 == 0;
    }
  }
  kdebug_trace();
  objc_sync_exit(v4);

  return v5;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADStereoV2Executor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  BOOL v4 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  int64_t v5 = [v4 referenceInput];
  self->_refColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  uint64_t v6 = self->super._espressoRunner;
  v7 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  BOOL v8 = [v7 auxiliaryInput];
  self->_auxColor = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  double v9 = self->super._espressoRunner;
  double v10 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  double v11 = [v10 disparityOutput];
  self->_disparity = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v11];

  double v12 = self->super._espressoRunner;
  uint64_t v13 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  BOOL v14 = [v13 prevDepthFeaturesInput];
  self->_itmPrevDepthFeatures = (__CVBuffer *)[(ADEspressoRunner *)v12 createAndRegisterPixelBufferForDescriptor:v14];

  uint64_t v15 = self->super._espressoRunner;
  BOOL v16 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  BOOL v17 = [v16 prevColorFeaturesInput];
  self->_itmPrevColorFeatures = (__CVBuffer *)[(ADEspressoRunner *)v15 createAndRegisterPixelBufferForDescriptor:v17];

  v18 = self->super._espressoRunner;
  int v19 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  long long v20 = [v19 temporalSmoothingCurrentFeaturesRatioMinInput];
  long long v21 = [(ADEspressoRunner *)v18 registerDescriptor:v20];
  temporalSmoothingCurrentFeaturesRatioMinBuffer = self->_temporalSmoothingCurrentFeaturesRatioMinBuffer;
  self->_temporalSmoothingCurrentFeaturesRatioMinBuffer = v21;

  v23 = self->super._espressoRunner;
  BOOL v24 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  v25 = [v24 temporalSmoothingPreviousFeaturesRatioMinInput];
  uint64_t v26 = [(ADEspressoRunner *)v23 registerDescriptor:v25];
  temporalSmoothingPreviousFeaturesRatioMinBuffer = self->_temporalSmoothingPreviousFeaturesRatioMinBuffer;
  self->_temporalSmoothingPreviousFeaturesRatioMinBuffer = v26;

  v28 = self->super._espressoRunner;
  v29 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  int v30 = [v29 depthFeaturesOutput];
  self->_itmDepthFeaturesOutput = (__CVBuffer *)[(ADEspressoRunner *)v28 createAndRegisterPixelBufferForDescriptor:v30];

  int v31 = self->super._espressoRunner;
  int v32 = [(ADStereoV2Pipeline *)self->_pipeline inferenceDescriptor];
  v33 = [v32 colorFeaturesOutput];
  self->_itmColorFeaturesOutput = (__CVBuffer *)[(ADEspressoRunner *)v31 createAndRegisterPixelBufferForDescriptor:v33];

  self->_itmChunkyRefColor = PixelBufferUtils::createPixelBufferCopy(self->_refColor, v34);
  self->_itmChunkyAuxColor = PixelBufferUtils::createPixelBufferCopy(self->_auxColor, v35);
  return 0;
}

- (void)deallocateEspressoBuffers
{
  self->_refColor = 0;
  CVPixelBufferRelease(self->_auxColor);
  self->_auxColor = 0;
  CVPixelBufferRelease(self->_disparity);
  self->_disparity = 0;
  CVPixelBufferRelease(self->_itmPrevDepthFeatures);
  self->_itmPrevDepthFeatures = 0;
  CVPixelBufferRelease(self->_itmPrevColorFeatures);
  self->_itmPrevColorFeatures = 0;
  CVPixelBufferRelease(self->_itmDepthFeaturesOutput);
  self->_itmDepthFeaturesOutput = 0;
  CVPixelBufferRelease(self->_itmColorFeaturesOutput);
  self->_itmColorFeaturesOutput = 0;
}

- (ADStereoV2Executor)initWithParameters:(id)a3
{
  id v4 = a3;
  int v15 = 335682764;
  long long v16 = 0u;
  long long v17 = 0u;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADStereoV2Executor;
  int64_t v5 = [(ADExecutor *)&v14 init];
  if (v5)
  {
    if (!v4) {
      id v4 = (id)objc_opt_new();
    }
    objc_storeStrong((id *)&v5->_executorParameters, v4);
    if (!v5->_executorParameters) {
      goto LABEL_8;
    }
    uint64_t v6 = [ADStereoV2Pipeline alloc];
    v7 = [(ADStereoV2ExecutorParameters *)v5->_executorParameters pipelineParameters];
    uint64_t v8 = [(ADStereoV2Pipeline *)v6 initWithParameters:v7];
    pipeline = v5->_pipeline;
    v5->_pipeline = (ADStereoV2Pipeline *)v8;

    if (!v5->_pipeline)
    {
LABEL_8:
      double v12 = 0;
      goto LABEL_9;
    }
    temporalSmoothingCurrentFeaturesRatioMinBuffer = v5->_temporalSmoothingCurrentFeaturesRatioMinBuffer;
    v5->_temporalSmoothingCurrentFeaturesRatioMinBuffer = 0;

    temporalSmoothingPreviousFeaturesRatioMinBuffer = v5->_temporalSmoothingPreviousFeaturesRatioMinBuffer;
    v5->_temporalSmoothingPreviousFeaturesRatioMinBuffer = 0;

    v5->_refColor = 0;
    v5->_itmChunkyRefColor = 0;
    v5->_itmCroppedScaledRefColor = 0;
    v5->_itmRotatedRefColor = 0;
    v5->_auxColor = 0;
    v5->_itmChunkyAuxColor = 0;
    v5->_itmCroppedScaledAuxColor = 0;
    v5->_itmRotatedAuxColor = 0;
    v5->_itmPrevDepthFeatures = 0;
    v5->_itmPrevColorFeatures = 0;
    v5->_disparity = 0;
    v5->_itmDepthFeaturesOutput = 0;
    v5->_itmColorFeaturesOutput = 0;
    v5->_isPrepared = 0;
  }
  double v12 = v5;
LABEL_9:
  kdebug_trace();

  return v12;
}

- (ADStereoV2Executor)init
{
  return [(ADStereoV2Executor *)self initWithParameters:0];
}

@end