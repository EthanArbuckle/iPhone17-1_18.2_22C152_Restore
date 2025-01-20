@interface ADDensifiedLiDARFocusAssistExecutor
- (ADDensifiedLiDARFocusAssistExecutor)init;
- (ADDensifiedLiDARFocusAssistExecutor)initWithEngineType:(unint64_t)a3;
- (ADDensifiedLiDARFocusAssistExecutorParameters)executorParameters;
- (CGSize)expectedOutputSize;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepare;
- (int64_t)prepareForColorROI:(CGRect)a3;
- (int64_t)updateColorROI:(CGRect)a3;
- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 lidarToColorTransform:(double)a5 colorCameraCalibration:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8 outputCalibration:(void *)a9;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADDensifiedLiDARFocusAssistExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_itmPovChangedPointCloud, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADDensifiedLiDARFocusAssistExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
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
  itmPreProcessedLidar = self->_itmPreProcessedLidar;
  if (itmPreProcessedLidar)
  {
    v21[0] = @"name";
    v21[1] = @"image";
    v22[0] = @"PreProcessed Jasper";
    v22[1] = itmPreProcessedLidar;
    v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 addObject:v7];
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v19[0] = @"name";
    v19[1] = @"image";
    v20[0] = @"Unprocessed Depth";
    v20[1] = itmUnprocessedDepth;
    v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v3 addObject:v9];
  }
  itmUnprocessedUncertainty = self->_itmUnprocessedUncertainty;
  if (itmUnprocessedUncertainty)
  {
    v17[0] = @"name";
    v17[1] = @"image";
    v18[0] = @"Unprocessed Uncertainty";
    v18[1] = itmUnprocessedUncertainty;
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v3 addObject:v11];
  }
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  if (itmPovChangedPointCloud)
  {
    v15[0] = @"name";
    v15[1] = @"pointcloud";
    v16[0] = @"Pov-Changed Point Cloud";
    v16[1] = itmPovChangedPointCloud;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v3 addObject:v13];
  }
  return v3;
}

- (void)dealloc
{
  [(ADDensifiedLiDARFocusAssistExecutor *)self deallocateEspressoBuffers];
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x2166C5D90]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADDensifiedLiDARFocusAssistExecutor;
  [(ADExecutor *)&v4 dealloc];
}

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 lidarToColorTransform:(double)a5 colorCameraCalibration:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8 outputCalibration:(void *)a9
{
  id v18 = a8;
  id v93 = a9;
  int v95 = 335686992;
  long long v96 = 0u;
  long long v97 = 0u;
  kdebug_trace();
  v19 = a1;
  objc_sync_enter(v19);
  if (v19[120]
    || (uint64_t v26 = objc_msgSend(v19, "prepareForColorROI:", *((double *)v19 + 1), *((double *)v19 + 2), *((double *)v19 + 3), *((double *)v19 + 4))) == 0)
  {
    if (!a7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = &_os_log_internal;
        v25 = "Must provide input color image";
        goto LABEL_61;
      }
LABEL_24:
      uint64_t v26 = -22953;
      goto LABEL_25;
    }
    if (!v18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = &_os_log_internal;
        v25 = "Must provide point cloud";
        goto LABEL_61;
      }
      goto LABEL_24;
    }
    if (!a10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = &_os_log_internal;
        v25 = "Must provide a pointer to outputDepthMap";
        goto LABEL_61;
      }
      goto LABEL_24;
    }
    [v19 expectedOutputSize];
    double v21 = v20;
    double v23 = v22;
    if (*a10 && (v20 != (double)CVPixelBufferGetWidth(*a10) || v23 != (double)CVPixelBufferGetHeight(*a10)))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = &_os_log_internal;
        v25 = "Output depth buffer size does not match descriptor";
LABEL_61:
        _os_log_error_impl(&dword_215F16000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
        uint64_t v26 = -22953;
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    if (a11 && *a11 && (v21 != (double)CVPixelBufferGetWidth(*a11) || v23 != (double)CVPixelBufferGetHeight(*a11)))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = &_os_log_internal;
        v25 = "Output confidence buffer width does not match descriptor";
        goto LABEL_61;
      }
      goto LABEL_24;
    }
    v86 = [*((id *)v19 + 23) logger];
    v28 = [MEMORY[0x263F08AB0] processInfo];
    [v28 systemUptime];
    double v30 = v29;

    [v86 logPixelBuffer:a7 name:"inputColor" timestamp:v30];
    [v86 logPointCloud:v18 name:"inputPointCloud" timestamp:v30];
    objc_msgSend(v86, "logMatrix4x3:name:timestamp:", "lidarToColorTransform", a2, a3, a4, a5, v30);
    [v86 logCalibration:v93 name:"colorCameraCalibration" timestamp:v30];
    uint64_t v31 = [v19 numberOfExecutionSteps];
    uint64_t v32 = [*((id *)v19 + 23) stepsToSkip];
    int v85 = [*((id *)v19 + 23) powerMeasureMode];
    v87 = [*((id *)v19 + 23) timeProfiler];
    uint64_t v84 = v31 - v32;
    if (v85)
    {
      BOOL v33 = v84-- < 1;
      if (v33) {
        goto LABEL_93;
      }
    }
    v83 = a12;
    kdebug_trace();
    [v87 startWithUTFString:"preprocess color"];
    [v19 frameExecutionStart];
    uint64_t v34 = *((void *)v19 + 18);
    if (v34)
    {
      int v35 = *(_DWORD *)(v34 + 40);
      double v37 = *(double *)(v34 + 24);
      double v36 = *(double *)(v34 + 32);
      if (v37 == (double)CVPixelBufferGetWidth(a7)
        && v36 == (double)CVPixelBufferGetHeight(a7)
        && CVPixelBufferGetPixelFormatType(a7) == v35
        && PixelBufferUtilsSession::verifyOutput(*((PixelBufferUtilsSession **)v19 + 18), *((CVPixelBufferRef *)v19 + 17)))
      {
        char updated = PixelBufferUtilsSession::updateCrop(*((PixelBufferUtilsSession **)v19 + 18), *(CGRect *)(v19 + 8));
        if (updated)
        {
          if (PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v19 + 18), a7, *((__CVBuffer **)v19 + 17)))
          {
            [v86 logPixelBuffer:*((void *)v19 + 17) name:"processedColor" timestamp:v30];
            [v87 stopWithUTFString:"preprocess color"];
            kdebug_trace();
            if (v85)
            {
              BOOL v33 = v84-- < 1;
              if (v33) {
                goto LABEL_93;
              }
            }
            kdebug_trace();
            [v87 startWithUTFString:"preprocess jasper"];
            int v45 = [*((id *)v19 + 22) capacity];
            if (v45 >= (int)[v18 length])
            {
              [*((id *)v19 + 22) resize:0];
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "increasing point cloud capacity", buf, 2u);
              }
              uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x263F26CC0]), "initWithCapacity:", objc_msgSend(v18, "length"));
              v47 = (void *)*((void *)v19 + 22);
              *((void *)v19 + 22) = v46;
            }
            uint64_t v26 = objc_msgSend(*((id *)v19 + 16), "changePointCloudPOV:targetCamera:lidarToCameraTransform:outputPointCloud:", v18, v93, *((void *)v19 + 22), a2, a3, a4, a5);
            [v86 logPointCloud:*((void *)v19 + 22) name:"povChangedPointCloud" timestamp:v30];
            if (v26)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v50 = &_os_log_internal;
                v51 = "changePointCloudPOV failed";
LABEL_75:
                _os_log_error_impl(&dword_215F16000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
                goto LABEL_94;
              }
              goto LABEL_94;
            }
            double v52 = *((double *)v19 + 1);
            double v53 = *((double *)v19 + 2);
            double Width = *((double *)v19 + 3);
            double Height = *((double *)v19 + 4);
            v102.origin.x = v52;
            v102.origin.y = v53;
            v102.size.width = Width;
            v102.size.height = Height;
            if (CGRectIsEmpty(v102))
            {
              double Width = (double)CVPixelBufferGetWidth(a7);
              double Height = (double)CVPixelBufferGetHeight(a7);
              double v52 = 0.0;
              double v53 = 0.0;
            }
            uint64_t v26 = objc_msgSend(*((id *)v19 + 16), "projectLidarPoints:crop:projectedPointsBuffer:", *((void *)v19 + 22), *((void *)v19 + 19), v52 - Width * 0.5, v53 - Height * 0.5, Width + Width, Height + Height);
            if (v26)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                v50 = &_os_log_internal;
                v51 = "Projecting jasper points failed";
                goto LABEL_75;
              }
LABEL_94:

              goto LABEL_25;
            }
            [v86 logPixelBuffer:*((void *)v19 + 19) name:"processedJasper" timestamp:v30];
            BOOL v92 = *a10 != 0;
            if (*a10)
            {
              OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*a10);
              v57 = [*((id *)v19 + 16) inferenceDescriptor];
              v58 = [v57 depthOutput];
              v59 = [v58 imageDescriptor];
              int v60 = [v59 pixelFormat];

              if (PixelFormatType == v60)
              {
                BOOL v92 = 0;
                v61 = a10;
LABEL_70:
                v67 = *v61;
                v68 = (void *)*((void *)v19 + 8);
                v69 = [*((id *)v19 + 16) inferenceDescriptor];
                v70 = [v69 depthOutput];
                [v68 registerPixelBuffer:v67 forDescriptor:v70];

                [v87 stopWithUTFString:"preprocess jasper"];
                kdebug_trace();
                if (!v85 || (BOOL v33 = v84 < 1, --v84, !v33))
                {
                  kdebug_trace();
                  [v87 startWithUTFString:"network execution"];
                  uint64_t v26 = [*((id *)v19 + 8) execute];
                  [v86 logPixelBuffer:v67 name:"outputDepth" timestamp:v30];
                  [v86 logPixelBuffer:*((void *)v19 + 21) name:"outputUncertainty" timestamp:v30];
                  if (v26)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v50 = &_os_log_internal;
                      v51 = "Failed executing network";
                      goto LABEL_75;
                    }
                    goto LABEL_94;
                  }
                  [v87 stopWithUTFString:"network execution"];
                  kdebug_trace();
                  if (!v85 || (BOOL v33 = v84 < 1, --v84, !v33))
                  {
                    kdebug_trace();
                    [v87 startWithUTFString:"postprocess depth"];
                    if (v92)
                    {
                      +[ADUtils postProcessDepth:v67 depthOutput:*a10];
                      [v86 logPixelBuffer:*a10 name:"outputProcessedDepth" timestamp:v30];
                    }
                    [v87 stopWithUTFString:"postprocess depth"];
                    kdebug_trace();
                    char v71 = v85;
                    if (v84 >= 1) {
                      char v71 = 0;
                    }
                    if ((v71 & 1) == 0)
                    {
                      kdebug_trace();
                      [v87 startWithUTFString:"postprocess confidence"];
                      if (a11)
                      {
                        CVPixelBufferRef v72 = *a11;
                        if (!*a11)
                        {
                          v73 = [*((id *)v19 + 16) inferenceDescriptor];
                          v74 = [v73 uncertaintyOutput];
                          v75 = [v74 imageDescriptor];
                          OSType v76 = [v75 pixelFormat];
                          v100.width = v21;
                          v100.height = v23;
                          *a11 = PixelBufferUtils::createPixelBuffer(v76, v100, 1);

                          CVPixelBufferRef v72 = *a11;
                        }
                        v77 = (void *)*((void *)v19 + 16);
                        uint64_t v78 = *((void *)v19 + 21);
                        v79 = [*((id *)v19 + 23) pipelineParameters];
                        uint64_t v26 = objc_msgSend(v77, "postProcessUncertainty:outputConfidence:confidenceUnits:", v78, v72, objc_msgSend(v79, "confidenceUnits"));

                        if (v26)
                        {
                          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                            goto LABEL_94;
                          }
                          *(_WORD *)buf = 0;
                          v50 = &_os_log_internal;
                          v51 = "Failed uncertainty post processing";
                          goto LABEL_75;
                        }
                        [v86 logPixelBuffer:*a11 name:"outputProcessedConfidence" timestamp:v30];
                      }
                      if (v83)
                      {
                        v80 = (void *)[v93 mutableCopy];
                        objc_msgSend(v80, "crop:", v52, v53, Width, Height);
                        size_t v81 = CVPixelBufferGetWidth(v67);
                        objc_msgSend(v80, "scale:", (double)v81, (double)CVPixelBufferGetHeight(v67));
                        id v82 = v80;
                        void *v83 = v82;
                      }
                      [v87 stopWithUTFString:"postprocess confidence"];
                      kdebug_trace();
                      [v19 frameExecutionEnd];
                    }
                  }
                }
LABEL_93:
                uint64_t v26 = 0;
                goto LABEL_94;
              }
              v61 = (__CVBuffer **)(v19 + 160);
              if (*((void *)v19 + 20))
              {
                BOOL v92 = 1;
                goto LABEL_70;
              }
              v66 = (void *)*((void *)v19 + 8);
              v62 = [*((id *)v19 + 16) inferenceDescriptor];
              v63 = [v62 depthOutput];
              *v61 = (__CVBuffer *)[v66 createAndRegisterPixelBufferForDescriptor:v63];
            }
            else
            {
              v62 = [*((id *)v19 + 16) inferenceDescriptor];
              v63 = [v62 depthOutput];
              v64 = [v63 imageDescriptor];
              OSType v65 = [v64 pixelFormat];
              v99.width = v21;
              v99.height = v23;
              *a10 = PixelBufferUtils::createPixelBuffer(v65, v99, 1);

              v61 = a10;
            }

            goto LABEL_70;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v48 = &_os_log_internal;
            v49 = "Failed scaling color image";
            goto LABEL_49;
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v48 = &_os_log_internal;
          v49 = "Failed configuring color scaling session";
LABEL_49:
          _os_log_error_impl(&dword_215F16000, v48, OS_LOG_TYPE_ERROR, v49, buf, 2u);
        }
        uint64_t v26 = -22950;
        goto LABEL_94;
      }
      v38 = (PixelBufferUtilsSession *)*((void *)v19 + 18);
      if (v38)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(v38);
        MEMORY[0x2166C5D90]();
      }
    }
    size_t v39 = CVPixelBufferGetWidth(a7);
    size_t v40 = CVPixelBufferGetHeight(a7);
    v41 = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
    size_t v42 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v19 + 17));
    size_t v43 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v19 + 17));
    CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v19 + 17));
    v98.width = (double)v39;
    v98.height = (double)v40;
    v101.height = (double)v43;
    v101.width = (double)v42;
    PixelBufferUtilsSession::createCropScaleConvertRotateSession(v41, v98, v101, *(CGRect *)(v19 + 8));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed preparing for executor for engine and ROI", buf, 2u);
  }
LABEL_25:
  objc_sync_exit(v19);

  kdebug_trace();
  return v26;
}

- (CGSize)expectedOutputSize
{
  v3 = [(ADDensifiedLiDARFocusAssistPipeline *)self->_pipeline inferenceDescriptor];
  objc_super v4 = [v3 depthOutput];
  v5 = [v4 imageDescriptor];
  [v5 sizeForLayout:self->super._layout];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)updateColorROI:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (CGRectIsEmpty(a3)) {
    goto LABEL_7;
  }
  double v8 = [(ADDensifiedLiDARFocusAssistPipeline *)self->_pipeline inferenceDescriptor];
  double v9 = [v8 colorInput];
  double v10 = [v9 imageDescriptor];
  [v10 sizeForLayout:self->super._layout];
  double v12 = v11;
  double v14 = v13;

  if (fabs(height * v12 - width * v14) <= width * 0.001 * v12)
  {

LABEL_7:
    int64_t result = 0;
    self->super._inputRoi.origin.CGFloat x = x;
    self->super._inputRoi.origin.CGFloat y = y;
    self->super._inputRoi.size.double width = width;
    self->super._inputRoi.size.double height = height;
    return result;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218752;
    double v17 = width;
    __int16 v18 = 2048;
    double v19 = height;
    __int16 v20 = 2048;
    double v21 = v12;
    __int16 v22 = 2048;
    double v23 = v14;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to update color ROI: aspect ratio (%fx%f) differs from the one used during prepare (%fx%f)", (uint8_t *)&v16, 0x2Au);
  }

  return -22957;
}

- (int64_t)prepare
{
  return -[ADDensifiedLiDARFocusAssistExecutor prepareForColorROI:](self, "prepareForColorROI:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (int64_t)prepareForColorROI:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  kdebug_trace();
  double v8 = self;
  objc_sync_enter(v8);
  double v9 = [(ADDensifiedLiDARFocusAssistPipeline *)v8->_pipeline inferenceDescriptor];
  unint64_t engineType = v8->super._engineType;
  double v11 = [v9 colorInput];
  double v12 = [v11 imageDescriptor];
  int64_t v13 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v8, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", engineType, v12, 1, 2, v9, x, y, width, height);

  if (!v13)
  {
    int64_t v13 = [(ADDensifiedLiDARFocusAssistExecutor *)v8 allocateIntermediateBuffers];
    if (!v13)
    {
      colorProcessingSession = v8->_colorProcessingSession;
      if (colorProcessingSession)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
        MEMORY[0x2166C5D90]();
      }
      int64_t v13 = 0;
      v8->_colorProcessingSession = 0;
      v8->_isPrepared = 1;
    }
  }

  objc_sync_exit(v8);
  kdebug_trace();
  return v13;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADDensifiedLiDARFocusAssistExecutor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  objc_super v4 = [(ADDensifiedLiDARFocusAssistPipeline *)self->_pipeline inferenceDescriptor];
  v5 = [v4 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  double v6 = self->super._espressoRunner;
  double v7 = [(ADDensifiedLiDARFocusAssistPipeline *)self->_pipeline inferenceDescriptor];
  double v8 = [v7 lidarInput];
  self->_itmPreProcessedLidar = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  double v9 = (ADMutableJasperPointCloud *)[objc_alloc(MEMORY[0x263F26CC0]) initWithCapacity:576];
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  self->_itmPovChangedPointCloud = v9;

  double v11 = self->super._espressoRunner;
  double v12 = [(ADDensifiedLiDARFocusAssistPipeline *)self->_pipeline inferenceDescriptor];
  int64_t v13 = [v12 uncertaintyOutput];
  self->_itmUnprocessedUncertaintdouble y = (__CVBuffer *)[(ADEspressoRunner *)v11 createAndRegisterPixelBufferForDescriptor:v13];

  if (self->_itmPreProcessedColor
    && self->_itmPreProcessedLidar
    && self->_itmPovChangedPointCloud
    && self->_itmUnprocessedUncertainty)
  {
    return 0;
  }
  [(ADDensifiedLiDARFocusAssistExecutor *)self deallocateEspressoBuffers];
  return -22971;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedLidar);
  self->_itmPreProcessedLidar = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedUncertainty);
  self->_itmUnprocessedUncertaintdouble y = 0;
}

- (ADDensifiedLiDARFocusAssistExecutor)initWithEngineType:(unint64_t)a3
{
  int v14 = 335686432;
  long long v15 = 0u;
  long long v16 = 0u;
  kdebug_trace();
  v13.receiver = self;
  v13.super_class = (Class)ADDensifiedLiDARFocusAssistExecutor;
  v5 = [(ADExecutor *)&v13 init];
  if (v5)
  {
    double v6 = [[ADDensifiedLiDARFocusAssistPipeline alloc] initWithEspressoEngine:a3];
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;

    if (!v5->_pipeline
      || (double v8 = [[ADDensifiedLiDARFocusAssistExecutorParameters alloc] initForPipeline:v5->_pipeline], executorParameters = v5->_executorParameters, v5->_executorParameters = v8, executorParameters, !v5->_executorParameters))
    {
      double v11 = 0;
      goto LABEL_7;
    }
    v5->super._unint64_t engineType = a3;
    v5->_itmPreProcessedColor = 0;
    v5->_colorProcessingSession = 0;
    v5->_itmUnprocessedDepth = 0;
    v5->_itmUnprocessedUncertaintdouble y = 0;
    itmPovChangedPointCloud = v5->_itmPovChangedPointCloud;
    v5->_itmPovChangedPointCloud = 0;

    v5->_isPrepared = 0;
  }
  double v11 = v5;
LABEL_7:
  kdebug_trace();

  return v11;
}

- (ADDensifiedLiDARFocusAssistExecutor)init
{
  if ([MEMORY[0x263F28048] hasANE]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(ADDensifiedLiDARFocusAssistExecutor *)self initWithEngineType:v3];
}

@end