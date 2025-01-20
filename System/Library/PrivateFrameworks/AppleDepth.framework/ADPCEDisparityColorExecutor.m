@interface ADPCEDisparityColorExecutor
- (ADPCEDisparityColorExecutor)init;
- (ADPCEDisparityColorExecutorParameters)executorParameters;
- (__CVBuffer)prevDisparity;
- (__CVBuffer)prevFeatures;
- (id)getIntermediates;
- (id)initForInputSource:(unint64_t)a3;
- (id)initForInputSource:(unint64_t)a3 parameters:(id)a4;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)executeWithDisparity:(__CVBuffer *)a3 color:(__CVBuffer *)a4 outDisparity:(__CVBuffer *)a5;
- (int64_t)executeWithDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 color:(__CVBuffer *)a6 outDisparity:(__CVBuffer *)a7;
- (int64_t)numberOfExecutionSteps;
- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4;
- (int64_t)preProcessDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 output:(__CVBuffer *)a6;
- (int64_t)prepareForEngineType:(unint64_t)a3 inputColorROI:(CGRect)a4;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADPCEDisparityColorExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_cmdQueue, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADPCEDisparityColorExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
}

- (id)getIntermediates
{
  v52[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v51[0] = @"name";
    v51[1] = @"image";
    v52[0] = @"PreProcessed Color";
    v52[1] = itmPreProcessedColor;
    v5 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    [v3 addObject:v5];
  }
  itmProcessedUnfilteredDisparity = self->_itmProcessedUnfilteredDisparity;
  if (itmProcessedUnfilteredDisparity)
  {
    v49[0] = @"name";
    v49[1] = @"image";
    v50[0] = @"Processed Unfiltered Disparity";
    v50[1] = itmProcessedUnfilteredDisparity;
    v7 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    [v3 addObject:v7];
  }
  itmPreProcessedDisparity = self->_itmPreProcessedDisparity;
  if (itmPreProcessedDisparity)
  {
    v47[0] = @"name";
    v47[1] = @"image";
    v48[0] = @"PreProcessed Disparity";
    v48[1] = itmPreProcessedDisparity;
    v9 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    [v3 addObject:v9];
  }
  itmUnprocessedOutputDisparity = self->_itmUnprocessedOutputDisparity;
  if (itmUnprocessedOutputDisparity)
  {
    v45[0] = @"name";
    v45[1] = @"image";
    v46[0] = @"Unprocessed OutputDisparity";
    v46[1] = itmUnprocessedOutputDisparity;
    v11 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    [v3 addObject:v11];
  }
  itmPostProcessedDisparity = self->_itmPostProcessedDisparity;
  if (itmPostProcessedDisparity)
  {
    v43[0] = @"name";
    v43[1] = @"image";
    v44[0] = @"PostProcessed OutputDisparity";
    v44[1] = itmPostProcessedDisparity;
    v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v3 addObject:v13];
  }
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v41[0] = @"name";
    v41[1] = @"image";
    v42[0] = @"Cropped ScaledColor";
    v42[1] = itmCroppedScaledColor;
    v15 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    [v3 addObject:v15];
  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v39[0] = @"name";
    v39[1] = @"image";
    v40[0] = @"Rotated Color";
    v40[1] = itmRotatedColor;
    v17 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    [v3 addObject:v17];
  }
  itmCroppedScaledDisparity = self->_itmCroppedScaledDisparity;
  if (itmCroppedScaledDisparity)
  {
    v37[0] = @"name";
    v37[1] = @"image";
    v38[0] = @"Cropped Scaled Disparity";
    v38[1] = itmCroppedScaledDisparity;
    v19 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    [v3 addObject:v19];
  }
  itmRotatedDisparity = self->_itmRotatedDisparity;
  if (itmRotatedDisparity)
  {
    v35[0] = @"name";
    v35[1] = @"image";
    v36[0] = @"Rotated Disparity";
    v36[1] = itmRotatedDisparity;
    v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v3 addObject:v21];
  }
  itmPrevDisparity = self->_itmPrevDisparity;
  if (itmPrevDisparity)
  {
    v33[0] = @"name";
    v33[1] = @"image";
    v34[0] = @"Previous Disparity";
    v34[1] = itmPrevDisparity;
    v23 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [v3 addObject:v23];
  }
  itmPrevFeatures = self->_itmPrevFeatures;
  if (itmPrevFeatures)
  {
    v31[0] = @"name";
    v31[1] = @"image";
    v32[0] = @"Previous Features";
    v32[1] = itmPrevFeatures;
    v25 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v3 addObject:v25];
  }
  itmFeaturesOutput = self->_itmFeaturesOutput;
  if (itmFeaturesOutput)
  {
    v29[0] = @"name";
    v29[1] = @"image";
    v30[0] = @"Output Features";
    v30[1] = itmFeaturesOutput;
    v27 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v3 addObject:v27];
  }
  return v3;
}

- (void)dealloc
{
  [(ADPCEDisparityColorExecutor *)self deallocateEspressoBuffers];
  CVPixelBufferRelease(self->_itmProcessedUnfilteredDisparity);
  CVPixelBufferRelease(self->_itmCroppedScaledColor);
  CVPixelBufferRelease(self->_itmRotatedColor);
  CVPixelBufferRelease(self->_itmCroppedScaledDisparity);
  CVPixelBufferRelease(self->_itmRotatedDisparity);
  CVPixelBufferRelease(self->_itmPostProcessedDisparity);
  CVPixelBufferRelease(self->_preprocessorInputMetalHelper);
  CVPixelBufferRelease(self->_preprocessorOutputMetalHelper);
  CVPixelBufferRelease(self->_postprocessorInputMetalHelper);
  CVPixelBufferRelease(self->_postprocessorOutputMetalHelper);
  v3.receiver = self;
  v3.super_class = (Class)ADPCEDisparityColorExecutor;
  [(ADExecutor *)&v3 dealloc];
}

- (int64_t)executeWithDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 color:(__CVBuffer *)a6 outDisparity:(__CVBuffer *)a7
{
  v97[4] = *MEMORY[0x263EF8340];
  v12 = self;
  objc_sync_enter(v12);
  size_t Width = CVPixelBufferGetWidth(a6);
  size_t Height = CVPixelBufferGetHeight(a6);
  if (!v12->_isPrepared)
  {
    int64_t v33 = -[ADPCEDisparityColorExecutor prepareForEngineType:inputColorROI:](v12, "prepareForEngineType:inputColorROI:", v12->super._engineType, 0.0, 0.0, (double)Width, (double)Height);
    if (v33)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", buf, 2u);
      }
      goto LABEL_104;
    }
  }
  if (v12->super._espressoRunner)
  {
    if (a7)
    {
      v91 = [(ADExecutorParameters *)v12->_executorParameters logger];
      v15 = [MEMORY[0x263F08AB0] processInfo];
      [v15 systemUptime];
      double v90 = v16;

      *(_DWORD *)buf = 335684600;
      long long v94 = 0u;
      long long v95 = 0u;
      kdebug_trace();
      v87 = a7;
      [v91 logPixelBuffer:a3 name:"inputDisparity" timestamp:v90];
      [v91 logPixelBuffer:a6 name:"inputColor" timestamp:v90];
      v96[0] = @"DisparityNormalizationMultiplier";
      *(float *)&double v17 = a4;
      v18 = [NSNumber numberWithFloat:v17];
      v97[0] = v18;
      v96[1] = @"DisparityNormalizationOffset";
      *(float *)&double v19 = a5;
      v20 = [NSNumber numberWithFloat:v19];
      v97[1] = v20;
      v96[2] = @"PCEBias";
      v21 = NSNumber;
      v22 = [(ADPCEDisparityColorPipeline *)v12->_pipeline pipelineParameters];
      [v22 pceBias];
      v23 = objc_msgSend(v21, "numberWithFloat:");
      v97[2] = v23;
      v96[3] = @"NetworkTrainingWidth";
      v24 = NSNumber;
      v25 = [(ADPCEDisparityColorPipeline *)v12->_pipeline pipelineParameters];
      v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "trainingWidth"));
      v97[3] = v26;
      v89 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:4];

      [v91 logDictionary:v89 name:"frameMetadata" timestamp:v90];
      uint64_t v27 = objc_msgSend(MEMORY[0x263F26CA8], "adjustLayout:sourceOrientation:toRotationPreference:", objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", v12->super._inputRoi.size.width, v12->super._inputRoi.size.height), 1, 2);
      double x = v12->super._inputRoi.origin.x;
      double y = v12->super._inputRoi.origin.y;
      double v30 = v12->super._inputRoi.size.width;
      double v31 = v12->super._inputRoi.size.height;
      if (![(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityPreprocessingActive])
      {
        int v32 = 0;
        goto LABEL_24;
      }
      if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityRotation] == 3)
      {
        double x = v12->super._inputRoi.origin.y;
        double y = (double)CVPixelBufferGetWidth(a6) - v12->super._inputRoi.origin.x;
        double v30 = v12->super._inputRoi.size.height;
        double v31 = -v12->super._inputRoi.size.width;
      }
      else
      {
        if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityRotation] == 2)
        {
          int v32 = 0;
          double x = (double)CVPixelBufferGetWidth(a6) - v12->super._inputRoi.origin.x;
          double y = (double)CVPixelBufferGetHeight(a6) - v12->super._inputRoi.origin.y;
          double v30 = -v12->super._inputRoi.size.width;
          double v31 = -v12->super._inputRoi.size.height;
          goto LABEL_23;
        }
        if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityRotation] != 1)
        {
          int v32 = 0;
          goto LABEL_23;
        }
        size_t v34 = CVPixelBufferGetHeight(a6);
        double y = v12->super._inputRoi.origin.x;
        double x = (double)v34 - v12->super._inputRoi.origin.y;
        double v31 = v12->super._inputRoi.size.width;
        double v30 = -v12->super._inputRoi.size.height;
      }
      int v32 = 1;
LABEL_23:
      v98.origin.double x = x;
      v98.origin.double y = y;
      v98.size.width = v30;
      v98.size.height = v31;
      CGRect v99 = CGRectStandardize(v98);
      double x = v99.origin.x;
      double y = v99.origin.y;
      double v30 = v99.size.width;
      double v31 = v99.size.height;
LABEL_24:
      size_t v35 = CVPixelBufferGetWidth(a3);
      if (v32) {
        size_t v36 = CVPixelBufferGetHeight(a6);
      }
      else {
        size_t v36 = CVPixelBufferGetWidth(a6);
      }
      unint64_t v37 = v36;
      size_t v38 = CVPixelBufferGetHeight(a3);
      if (v32) {
        size_t v39 = CVPixelBufferGetWidth(a6);
      }
      else {
        size_t v39 = CVPixelBufferGetHeight(a6);
      }
      double v40 = (float)((float)v35 / (float)v37);
      double v41 = (float)((float)v38 / (float)v39);
      double v42 = floor(v30 * v40);
      double v43 = floor(v31 * v41);
      uint64_t v44 = objc_msgSend(MEMORY[0x263F26CA8], "adjustLayout:sourceOrientation:toRotationPreference:", objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", v42, v43), 1, 2);
      if (v32) {
        uint64_t v44 = [MEMORY[0x263F26CA8] transposeLayout:v44];
      }
      if (v27 != v44)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v92 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "color and disparity layouts don't match", v92, 2u);
        }
        int64_t v33 = -22957;
        goto LABEL_103;
      }
      uint64_t v45 = [(ADPCEDisparityColorExecutor *)v12 numberOfExecutionSteps];
      uint64_t v46 = [(ADExecutorParameters *)v12->_executorParameters stepsToSkip];
      BOOL v47 = [(ADExecutorParameters *)v12->_executorParameters powerMeasureMode];
      v88 = [(ADExecutorParameters *)v12->_executorParameters timeProfiler];
      uint64_t v48 = v45 - v46;
      if (!v47 || (BOOL v49 = v48 < 1, --v48, !v49))
      {
        kdebug_trace();
        [v88 startWithUTFString:"preprocess color"];
        [(ADExecutor *)v12 frameExecutionStart];
        int64_t v33 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a6, LOBYTE(v12->super._rotationConstant), v12->_itmPreProcessedColor, &v12->_itmCroppedScaledColor, &v12->_itmRotatedColor, 1, v12->super._inputRoi.origin.x, v12->super._inputRoi.origin.y, v12->super._inputRoi.size.width, v12->super._inputRoi.size.height);
        if (v33)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v92 = 0;
            v50 = &_os_log_internal;
            v51 = "failed scaling color image";
LABEL_64:
            _os_log_error_impl(&dword_215F16000, v50, OS_LOG_TYPE_ERROR, v51, v92, 2u);
            goto LABEL_102;
          }
          goto LABEL_102;
        }
        [v91 logPixelBuffer:v12->_itmPreProcessedColor name:"preProcessedColor" timestamp:v90];
        [v88 stopWithUTFString:"preprocess color"];
        kdebug_trace();
        if (!v47 || (BOOL v49 = v48 < 1, --v48, !v49))
        {
          kdebug_trace();
          [v88 startWithUTFString:"preprocess disparity"];
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
          v53 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
          v54 = [v53 disparityInput];
          v55 = [v54 imageDescriptor];
          uint64_t v56 = 1751411059;
          BOOL v58 = [v55 pixelFormat] == 1751411059 && PixelFormatType == 1717856627;

          if (!v58)
          {
            v59 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
            v60 = [v59 disparityInput];
            v61 = [v60 imageDescriptor];
            BOOL v63 = [v61 pixelFormat] == 1717856627 && PixelFormatType == 1751411059;

            if (v63) {
              uint64_t v56 = 1717856627;
            }
            else {
              uint64_t v56 = PixelFormatType;
            }
          }
          size_t v64 = CVPixelBufferGetWidth(a3);
          p_itmProcessedUnfilteredDisparitdouble y = &v12->_itmProcessedUnfilteredDisparity;
          if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", v56, &v12->_itmProcessedUnfilteredDisparity, (double)v64, (double)CVPixelBufferGetHeight(a3)))
          {
            CVPixelBufferRelease(v12->_itmCroppedScaledDisparity);
            v12->_itmCroppedScaledDisparitdouble y = 0;
            CVPixelBufferRelease(v12->_itmRotatedDisparity);
            v12->_itmRotatedDisparitdouble y = 0;
          }
          int64_t v33 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, LOBYTE(v12->super._rotationConstant), *p_itmProcessedUnfilteredDisparity, &v12->_itmCroppedScaledDisparity, &v12->_itmRotatedDisparity, 1, floor(x * v40), floor(y * v41), v42, v43);
          if (v33)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v92 = 0;
              v50 = &_os_log_internal;
              v51 = "failed scaling disparity image";
              goto LABEL_64;
            }
LABEL_102:

LABEL_103:
            kdebug_trace();

            goto LABEL_104;
          }
          [v91 logPixelBuffer:*p_itmProcessedUnfilteredDisparity name:"preProcessedUnfilteredDisparity" timestamp:v90];
          if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityPreprocessingActive])
          {
            *(float *)&double v66 = a4;
            *(float *)&double v67 = a5;
            int64_t v33 = [(ADPCEDisparityColorExecutor *)v12 preProcessDisparity:*p_itmProcessedUnfilteredDisparity normalizationMultiplier:v12->_itmPreProcessedDisparity normalizationOffset:v66 output:v67];
            if (v33)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_102;
              }
              *(_WORD *)v92 = 0;
              v50 = &_os_log_internal;
              v51 = "failed to pre-process disparity";
              goto LABEL_64;
            }
          }
          else
          {
            PixelBufferUtils::copyPixelBuffer(v12->_itmPreProcessedDisparity, *p_itmProcessedUnfilteredDisparity, 0);
          }
          [v91 logPixelBuffer:v12->_itmPreProcessedDisparity name:"preProcessedDisparity" timestamp:v90];
          p_itmPrevDisparitdouble y = &v12->_itmPrevDisparity;
          [v91 logPixelBuffer:v12->_itmPrevDisparity name:"prevDisparity" timestamp:v90];
          [v91 logPixelBuffer:v12->_itmPrevFeatures name:"prevFeatures" timestamp:v90];
          [v88 stopWithUTFString:"preprocess disparity"];
          kdebug_trace();
          if (!v47 || (BOOL v49 = v48 < 1, --v48, !v49))
          {
            kdebug_trace();
            [v88 startWithUTFString:"network execution"];
            int64_t v33 = [(ADEspressoRunner *)v12->super._espressoRunner execute];
            if (v33)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                goto LABEL_102;
              }
              *(_WORD *)v92 = 0;
              v50 = &_os_log_internal;
              v51 = "failed executing espresso plan";
              goto LABEL_64;
            }
            p_itmUnprocessedOutputDisparitdouble y = &v12->_itmUnprocessedOutputDisparity;
            [v91 logPixelBuffer:v12->_itmUnprocessedOutputDisparity name:"outputDisparity" timestamp:v90];
            [v91 logPixelBuffer:v12->_itmFeaturesOutput name:"outputFeatures" timestamp:v90];
            [v88 stopWithUTFString:"network execution"];
            kdebug_trace();
            if (!v47 || (BOOL v49 = v48 < 1, --v48, !v49))
            {
              kdebug_trace();
              [v88 startWithUTFString:"postprocess depth"];
              itmPostProcessedDisparitdouble y = *p_itmUnprocessedOutputDisparity;
              if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters disparityPostprocessingActive])
              {
                size_t v71 = CVPixelBufferGetWidth(*p_itmUnprocessedOutputDisparity);
                size_t v72 = CVPixelBufferGetHeight(*p_itmUnprocessedOutputDisparity);
                +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(*p_itmUnprocessedOutputDisparity), &v12->_itmPostProcessedDisparity, (double)v71, (double)v72);
                int64_t v33 = [(ADPCEDisparityColorExecutor *)v12 postProcessDisparity:*p_itmUnprocessedOutputDisparity output:v12->_itmPostProcessedDisparity];
                if (v33)
                {
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_102;
                  }
                  *(_WORD *)v92 = 0;
                  v50 = &_os_log_internal;
                  v51 = "failed to post-process disparity";
                  goto LABEL_64;
                }
                itmPostProcessedDisparitdouble y = v12->_itmPostProcessedDisparity;
              }
              [v91 logPixelBuffer:itmPostProcessedDisparity name:"postProcessedOutputDisparity" timestamp:v90];
              if (!*v87) {
                *v87 = PixelBufferUtils::createPixelBufferWithSameSize(itmPostProcessedDisparity, (__CVBuffer *)0x66646973, 1);
              }
              int64_t v33 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", itmPostProcessedDisparity);
              if (v33)
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_102;
                }
                *(_WORD *)v92 = 0;
                v50 = &_os_log_internal;
                v51 = "failed converting disparity";
                goto LABEL_64;
              }
              [v91 logPixelBuffer:*v87 name:"outputConvertedUnits" timestamp:v90];
              [v88 stopWithUTFString:"postprocess depth"];
              kdebug_trace();
              BOOL v73 = v47;
              if (v48 >= 1) {
                BOOL v73 = 0;
              }
              if (!v73)
              {
                kdebug_trace();
                [v88 startWithUTFString:"postprocess previous depth"];
                if ([(ADPCEDisparityColorExecutorParameters *)v12->_executorParameters temporalConsistencyActive])
                {
                  v12->_prevDisparityIsZeros = 0;
                  espressoRunner = v12->super._espressoRunner;
                  v75 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
                  v76 = [v75 prevDisparityInput];
                  v77 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
                  v78 = [v77 disparityOutput];
                  int64_t v33 = [(ADEspressoRunner *)espressoRunner updateFeedbackLoopInputBuffer:&v12->_itmPrevDisparity inputDescriptor:v76 outputBuffer:&v12->_itmUnprocessedOutputDisparity outputDescriptor:v78];

                  if (v33)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_102;
                    }
                    *(_WORD *)v92 = 0;
                    v50 = &_os_log_internal;
                    v51 = "failed updating previous disparity";
                    goto LABEL_64;
                  }
                  if (v12->_itmPrevFeatures)
                  {
                    v81 = v12->super._espressoRunner;
                    v82 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
                    v83 = [v82 prevFeaturesInput];
                    v84 = [(ADPCEDisparityColorPipeline *)v12->_pipeline inferenceDescriptor];
                    v85 = [v84 featuresOutput];
                    int64_t v33 = [(ADEspressoRunner *)v81 updateFeedbackLoopInputBuffer:&v12->_itmPrevFeatures inputDescriptor:v83 outputBuffer:&v12->_itmFeaturesOutput outputDescriptor:v85];

                    if (v33)
                    {
                      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_102;
                      }
                      *(_WORD *)v92 = 0;
                      v50 = &_os_log_internal;
                      v51 = "failed updating previous features";
                      goto LABEL_64;
                    }
                  }
                }
                else if (!v12->_prevDisparityIsZeros)
                {
                  CVPixelBufferLockBaseAddress(*p_itmPrevDisparity, 0);
                  BaseAddress = CVPixelBufferGetBaseAddress(*p_itmPrevDisparity);
                  size_t DataSize = CVPixelBufferGetDataSize(*p_itmPrevDisparity);
                  bzero(BaseAddress, DataSize);
                  CVPixelBufferUnlockBaseAddress(*p_itmPrevDisparity, 0);
                  v12->_prevDisparityIsZeros = 1;
                }
                [v88 stopWithUTFString:"postprocess previous depth"];
                kdebug_trace();
                [(ADExecutor *)v12 frameExecutionEnd];
              }
            }
          }
        }
      }
      int64_t v33 = 0;
      goto LABEL_102;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide an output pointer to CVPixelBufferRef", buf, 2u);
    }
    int64_t v33 = -22953;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "executor could not be initialized", buf, 2u);
    }
    int64_t v33 = -22960;
  }
LABEL_104:
  objc_sync_exit(v12);

  return v33;
}

- (int64_t)executeWithDisparity:(__CVBuffer *)a3 color:(__CVBuffer *)a4 outDisparity:(__CVBuffer *)a5
{
  LODWORD(v5) = 1.0;
  return [(ADPCEDisparityColorExecutor *)self executeWithDisparity:a3 normalizationMultiplier:a4 normalizationOffset:a5 color:v5 outDisparity:0.0];
}

- (int64_t)postProcessDisparity:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  double v5 = a3;
  if (CVPixelBufferGetIOSurface(a3)) {
    goto LABEL_12;
  }
  double Width = (double)CVPixelBufferGetWidth(v5);
  double Height = (double)CVPixelBufferGetHeight(v5);
  p_postprocessorInputMetalHelper = &self->_postprocessorInputMetalHelper;
  if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(v5), &self->_postprocessorInputMetalHelper, Width, Height))
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v36 = 0;
        v10 = &_os_log_internal;
        v11 = (uint8_t *)&v36;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_215F16000, v10, v12, "preprocessor input disparity buffer is not io-surface backed. This will degregate performance", v11, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = &_os_log_internal;
      v11 = buf;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }
  v13 = *p_postprocessorInputMetalHelper;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType(v13)) {
    copyPixelBufferVImage(v13, *MEMORY[0x263F00148], v5, *MEMORY[0x263F001A8]);
  }
  double v5 = *p_postprocessorInputMetalHelper;
LABEL_12:
  postprocessorOutputMetalHelper = a4;
  if (!CVPixelBufferGetIOSurface(a4))
  {
    double v16 = (double)CVPixelBufferGetWidth(a4);
    double v17 = (double)CVPixelBufferGetHeight(a4);
    if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(a4), &self->_postprocessorOutputMetalHelper, v16, v17))
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = 0;
          v18 = &_os_log_internal;
          double v19 = (uint8_t *)&v34;
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
          _os_log_impl(&dword_215F16000, v18, v20, "preprocessor output disparity buffer is not io-surface backed. This will degregate performance", v19, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int64_t v33 = 0;
        v18 = &_os_log_internal;
        double v19 = v33;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
    postprocessorOutputMetalHelper = self->_postprocessorOutputMetalHelper;
  }
  v21 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:v5 metalDevice:self->_metalDevice];
  v22 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:postprocessorOutputMetalHelper metalDevice:self->_metalDevice];
  cmdQueue = self->_cmdQueue;
  if (cmdQueue
    || (v24 = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue],
        v25 = self->_cmdQueue,
        self->_cmdQueue = v24,
        v25,
        (cmdQueue = self->_cmdQueue) != 0))
  {
    v26 = [(MTLCommandQueue *)cmdQueue commandBuffer];
    int64_t v27 = [(ADPCEDisparityColorPipeline *)self->_pipeline encodeDisparityPostprocessingToCommandBuffer:v26 input:v21 output:v22];
    if (v27)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v31 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed encoding postprocessing to command buffer", v31, 2u);
      }
    }
    else
    {
      [v26 commit];
      [v26 waitUntilCompleted];
      if (postprocessorOutputMetalHelper == a4
        || (OSType v28 = CVPixelBufferGetPixelFormatType(postprocessorOutputMetalHelper),
            v28 == CVPixelBufferGetPixelFormatType(a4))
        && !copyPixelBufferVImage(a4, *MEMORY[0x263F00148], postprocessorOutputMetalHelper, *MEMORY[0x263F001A8]))
      {
        int64_t v27 = 0;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v30 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed copying result to output buffer", v30, 2u);
        }
        int64_t v27 = -22950;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v32 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed initializing command queue", v32, 2u);
    }
    int64_t v27 = -22950;
  }

  return v27;
}

- (int64_t)preProcessDisparity:(__CVBuffer *)a3 normalizationMultiplier:(float)a4 normalizationOffset:(float)a5 output:(__CVBuffer *)a6
{
  v9 = a3;
  if (CVPixelBufferGetIOSurface(a3)) {
    goto LABEL_12;
  }
  double Width = (double)CVPixelBufferGetWidth(v9);
  double Height = (double)CVPixelBufferGetHeight(v9);
  p_preprocessorInputMetalHelper = &self->_preprocessorInputMetalHelper;
  if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(v9), &self->_preprocessorInputMetalHelper, Width, Height))
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v45 = 0;
        v14 = &_os_log_internal;
        v15 = (uint8_t *)&v45;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_215F16000, v14, v16, "Preprocessor input disparity buffer is not io-surface backed. This will degregate performance", v15, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = &_os_log_internal;
      v15 = buf;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
  }
  double v17 = *p_preprocessorInputMetalHelper;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType(v17)) {
    copyPixelBufferVImage(v17, *MEMORY[0x263F00148], v9, *MEMORY[0x263F001A8]);
  }
  v9 = *p_preprocessorInputMetalHelper;
LABEL_12:
  preprocessorOutputMetalHelper = a6;
  if (!CVPixelBufferGetIOSurface(a6))
  {
    double v20 = (double)CVPixelBufferGetWidth(a6);
    double v21 = (double)CVPixelBufferGetHeight(a6);
    if (+[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(a6), &self->_preprocessorOutputMetalHelper, v20, v21))
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v43 = 0;
          v22 = &_os_log_internal;
          v23 = (uint8_t *)&v43;
          os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
          _os_log_impl(&dword_215F16000, v22, v24, "Preprocessor output disparity buffer is not io-surface backed. This will degregate performance", v23, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v42 = 0;
        v22 = &_os_log_internal;
        v23 = v42;
        os_log_type_t v24 = OS_LOG_TYPE_INFO;
        goto LABEL_19;
      }
    }
    preprocessorOutputMetalHelper = self->_preprocessorOutputMetalHelper;
  }
  v25 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:v9 metalDevice:self->_metalDevice];
  v26 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:preprocessorOutputMetalHelper metalDevice:self->_metalDevice];
  cmdQueue = self->_cmdQueue;
  if (cmdQueue
    || (OSType v28 = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue],
        v29 = self->_cmdQueue,
        self->_cmdQueue = v28,
        v29,
        (cmdQueue = self->_cmdQueue) != 0))
  {
    double v30 = [(MTLCommandQueue *)cmdQueue commandBuffer];
    pipeline = self->_pipeline;
    uint64_t v32 = [(ADPCEDisparityColorExecutorParameters *)self->_executorParameters disparityInvalidValue];
    int64_t v33 = [(ADPCEDisparityColorExecutorParameters *)self->_executorParameters disparityRotation];
    *(float *)&double v34 = a4;
    *(float *)&double v35 = a5;
    int64_t v36 = [(ADPCEDisparityColorPipeline *)pipeline encodeDisparityPreprocessingToCommandBuffer:v30 input:v25 normalizationMultiplier:v32 normalizationOffset:v33 invalidValue:v26 rotation:v34 output:v35];
    if (v36)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v40 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed encoding preprocessing to command buffer", v40, 2u);
      }
    }
    else
    {
      [v30 commit];
      [v30 waitUntilCompleted];
      if (preprocessorOutputMetalHelper == a6
        || (OSType v37 = CVPixelBufferGetPixelFormatType(preprocessorOutputMetalHelper),
            v37 == CVPixelBufferGetPixelFormatType(a6))
        && !copyPixelBufferVImage(a6, *MEMORY[0x263F00148], preprocessorOutputMetalHelper, *MEMORY[0x263F001A8]))
      {
        int64_t v36 = 0;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)size_t v39 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed copying result to output buffer", v39, 2u);
        }
        int64_t v36 = -22950;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v41 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed initializing command queue", v41, 2u);
    }
    int64_t v36 = -22950;
  }

  return v36;
}

- (__CVBuffer)prevFeatures
{
  if ([(ADPCEDisparityColorExecutorParameters *)self->_executorParameters temporalConsistencyActive])
  {
    return self->_itmPrevFeatures;
  }
  else
  {
    return 0;
  }
}

- (__CVBuffer)prevDisparity
{
  if (![(ADPCEDisparityColorExecutorParameters *)self->_executorParameters temporalConsistencyActive])return 0; {
  self->_prevDisparityIsZeros = 0;
  }
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
  int v19 = 335680668;
  long long v20 = 0u;
  long long v21 = 0u;
  kdebug_trace();
  int64_t v10 = [(ADPCEDisparityColorPipeline *)v9->_pipeline adjustForEngine:a3];
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to adjust for engine", v18, 2u);
    }
  }
  else
  {
    v11 = [(ADPCEDisparityColorPipeline *)v9->_pipeline inferenceDescriptor];
    os_log_type_t v12 = [v11 colorInput];
    v13 = [v12 imageDescriptor];
    int64_t v10 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v9, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v13, 1, 2, v11, x, y, width, height);

    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prepare engine", v18, 2u);
      }
    }
    else
    {
      int64_t v10 = [(ADPCEDisparityColorExecutor *)v9 allocateIntermediateBuffers];
      CVPixelBufferLockBaseAddress(v9->_itmPrevDisparity, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v9->_itmPrevDisparity);
      size_t DataSize = CVPixelBufferGetDataSize(v9->_itmPrevDisparity);
      bzero(BaseAddress, DataSize);
      CVPixelBufferUnlockBaseAddress(v9->_itmPrevDisparity, 0);
      v9->_prevDisparityIsZeros = 1;
      PixelBufferUtils::blacken(v9->_itmPrevFeatures, v16);
      v9->_isPrepared = v10 == 0;
    }
  }
  kdebug_trace();
  objc_sync_exit(v9);

  return v10;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADPCEDisparityColorExecutor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  v4 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  double v5 = [v4 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  v6 = self->super._espressoRunner;
  v7 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  v8 = [v7 disparityInput];
  self->_itmPreProcessedDisparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  v9 = self->super._espressoRunner;
  int64_t v10 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  v11 = [v10 disparityOutput];
  self->_itmUnprocessedOutputDisparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v11];

  os_log_type_t v12 = self->super._espressoRunner;
  v13 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  v14 = [v13 prevDisparityInput];
  self->_itmPrevDisparitdouble y = (__CVBuffer *)[(ADEspressoRunner *)v12 createAndRegisterPixelBufferForDescriptor:v14];

  v15 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  os_log_type_t v16 = [v15 prevFeaturesInput];

  if (v16)
  {
    double v17 = self->super._espressoRunner;
    v18 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
    int v19 = [v18 prevFeaturesInput];
    self->_itmPrevFeatures = (__CVBuffer *)[(ADEspressoRunner *)v17 createAndRegisterPixelBufferForDescriptor:v19];

    long long v20 = self->super._espressoRunner;
    long long v21 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
    v22 = [v21 featuresOutput];
    self->_itmFeaturesOutput = (__CVBuffer *)[(ADEspressoRunner *)v20 createAndRegisterPixelBufferForDescriptor:v22];

    if (!self->_itmPreProcessedColor) {
      goto LABEL_15;
    }
  }
  else
  {
    self->_itmPrevFeatures = 0;
    self->_itmFeaturesOutput = 0;
    if (!self->_itmPreProcessedColor) {
      goto LABEL_15;
    }
  }
  if (!self->_itmPreProcessedDisparity || !self->_itmUnprocessedOutputDisparity || !self->_itmPrevDisparity) {
    goto LABEL_15;
  }
  v23 = [(ADPCEDisparityColorPipeline *)self->_pipeline inferenceDescriptor];
  os_log_type_t v24 = [v23 prevFeaturesInput];
  if (!v24)
  {

    return 0;
  }
  if (self->_itmPrevFeatures)
  {
    itmFeaturesOutput = self->_itmFeaturesOutput;

    if (!itmFeaturesOutput) {
      goto LABEL_15;
    }
    return 0;
  }

LABEL_15:
  [(ADPCEDisparityColorExecutor *)self deallocateEspressoBuffers];
  return -22971;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedDisparity);
  self->_itmPreProcessedDisparitdouble y = 0;
  CVPixelBufferRelease(self->_itmUnprocessedOutputDisparity);
  self->_itmUnprocessedOutputDisparitdouble y = 0;
  CVPixelBufferRelease(self->_itmPrevDisparity);
  self->_itmPrevDisparitdouble y = 0;
  CVPixelBufferRelease(self->_itmPrevFeatures);
  self->_itmPrevFeatures = 0;
  CVPixelBufferRelease(self->_itmFeaturesOutput);
  self->_itmFeaturesOutput = 0;
}

- (id)initForInputSource:(unint64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  int v23 = 335685520;
  long long v24 = 0u;
  long long v25 = 0u;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADPCEDisparityColorExecutor;
  v7 = [(ADExecutor *)&v22 init];
  if (!v7) {
    goto LABEL_9;
  }
  v8 = [ADPCEDisparityColorPipeline alloc];
  v9 = [v6 pipelineParameters];
  uint64_t v10 = [(ADPCEDisparityColorPipeline *)v8 initWithParameters:v9 inputSource:a3 metalDevice:0];
  pipeline = v7->_pipeline;
  v7->_pipeline = (ADPCEDisparityColorPipeline *)v10;

  if (!v7->_pipeline) {
    goto LABEL_12;
  }
  if (v6)
  {
    os_log_type_t v12 = (ADPCEDisparityColorExecutorParameters *)v6;
    executorParameters = v7->_executorParameters;
    v7->_executorParameters = v12;
  }
  else
  {
    v14 = [ADPCEDisparityColorExecutorParameters alloc];
    executorParameters = [(ADPCEDisparityColorPipeline *)v7->_pipeline pipelineParameters];
    uint64_t v15 = [(ADPCEDisparityColorExecutorParameters *)v14 initForPipelineParameters:executorParameters inputSource:a3];
    os_log_type_t v16 = v7->_executorParameters;
    v7->_executorParameters = (ADPCEDisparityColorExecutorParameters *)v15;
  }
  if (!v7->_executorParameters)
  {
LABEL_12:
    int v19 = 0;
    goto LABEL_13;
  }
  double v17 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  metalDevice = v7->_metalDevice;
  v7->_metalDevice = v17;

  if (!v7->_metalDevice)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v21 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create default metal device", v21, 2u);
    }
    goto LABEL_12;
  }
  v7->_itmPreProcessedColor = 0;
  v7->_itmProcessedUnfilteredDisparitdouble y = 0;
  v7->_itmPreProcessedDisparitdouble y = 0;
  v7->_itmUnprocessedOutputDisparitdouble y = 0;
  v7->_itmPostProcessedDisparitdouble y = 0;
  v7->_itmCroppedScaledColor = 0;
  v7->_itmRotatedColor = 0;
  v7->_itmCroppedScaledDisparitdouble y = 0;
  v7->_itmRotatedDisparitdouble y = 0;
  v7->_itmPrevDisparitdouble y = 0;
  v7->_itmPrevFeatures = 0;
  v7->_itmFeaturesOutput = 0;
  v7->_preprocessorInputMetalHelper = 0;
  v7->_preprocessorOutputMetalHelper = 0;
  v7->_postprocessorInputMetalHelper = 0;
  v7->_postprocessorOutputMetalHelper = 0;
  v7->_prevDisparityIsZeros = 0;
  v7->_isPrepared = 0;
LABEL_9:
  int v19 = v7;
LABEL_13:
  kdebug_trace();

  return v19;
}

- (id)initForInputSource:(unint64_t)a3
{
  return [(ADPCEDisparityColorExecutor *)self initForInputSource:a3 parameters:0];
}

- (ADPCEDisparityColorExecutor)init
{
  return (ADPCEDisparityColorExecutor *)[(ADPCEDisparityColorExecutor *)self initForInputSource:0];
}

@end