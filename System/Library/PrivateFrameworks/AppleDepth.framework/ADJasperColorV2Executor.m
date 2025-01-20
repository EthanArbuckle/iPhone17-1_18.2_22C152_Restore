@interface ADJasperColorV2Executor
- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3;
- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3 engineType:(unint64_t)a4;
- (ADJasperColorV2Executor)initWithParameters:(id)a3 prioritization:(int64_t)a4 engineType:(unint64_t)a5;
- (ADJasperColorV2ExecutorParameters)executorParameters;
- (CGSize)expectedOutputSize;
- (__CVBuffer)prevColor;
- (__CVBuffer)prevDepth;
- (__CVBuffer)prevUncertainty;
- (id)getIntermediates;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForColorROI:(CGRect)a3;
- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 jasperToColorTransform:(double)a5 colorCamera:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADJasperColorV2Executor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_itmPovChangedPointCloud, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADJasperColorV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (__CVBuffer)prevColor
{
  return self->_itmPrevColor;
}

- (__CVBuffer)prevUncertainty
{
  return self->_itmPrevUncertainty;
}

- (__CVBuffer)prevDepth
{
  return self->_itmPrevDepth;
}

- (int64_t)numberOfExecutionSteps
{
  return 6;
}

- (id)getIntermediates
{
  v44[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v43[0] = @"name";
    v43[1] = @"image";
    v44[0] = @"PreProcessed Color";
    v44[1] = itmPreProcessedColor;
    v5 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v3 addObject:v5];
  }
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  if (itmPovChangedPointCloud)
  {
    v41[0] = @"name";
    v41[1] = @"pointcloud";
    v42[0] = @"Pov-Changed Point Cloud";
    v42[1] = itmPovChangedPointCloud;
    v7 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    [v3 addObject:v7];
  }
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper)
  {
    v39[0] = @"name";
    v39[1] = @"image";
    v40[0] = @"PreProcessed Jasper";
    v40[1] = itmPreProcessedJasper;
    v9 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    [v3 addObject:v9];
  }
  itmPrevDepth = self->_itmPrevDepth;
  if (itmPrevDepth)
  {
    v37[0] = @"name";
    v37[1] = @"image";
    v38[0] = @"Previous Depth";
    v38[1] = itmPrevDepth;
    v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    [v3 addObject:v11];
  }
  itmPrevColor = self->_itmPrevColor;
  if (itmPrevColor)
  {
    v35[0] = @"name";
    v35[1] = @"image";
    v36[0] = @"Previous Color";
    v36[1] = itmPrevColor;
    v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v3 addObject:v13];
  }
  itmPrevUncertainty = self->_itmPrevUncertainty;
  if (itmPrevUncertainty)
  {
    v33[0] = @"name";
    v33[1] = @"image";
    v34[0] = @"Previous Uncertainty";
    v34[1] = itmPrevUncertainty;
    v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [v3 addObject:v15];
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v31[0] = @"name";
    v31[1] = @"image";
    v32[0] = @"Unprocessed Depth";
    v32[1] = itmUnprocessedDepth;
    v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v3 addObject:v17];
  }
  itmUnprocessedUncertainty = self->_itmUnprocessedUncertainty;
  if (itmUnprocessedUncertainty)
  {
    v29[0] = @"name";
    v29[1] = @"image";
    v30[0] = @"Unprocessed Uncertainty";
    v30[1] = itmUnprocessedUncertainty;
    v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v3 addObject:v19];
  }
  itmDepthFeatures = self->_itmDepthFeatures;
  if (itmDepthFeatures)
  {
    v27[0] = @"name";
    v27[1] = @"image";
    v28[0] = @"Depth features";
    v28[1] = itmDepthFeatures;
    v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v3 addObject:v21];
  }
  itmColorFeatures = self->_itmColorFeatures;
  if (itmColorFeatures)
  {
    v25[0] = @"name";
    v25[1] = @"image";
    v26[0] = @"Color features";
    v26[1] = itmColorFeatures;
    v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v3 addObject:v23];
  }
  return v3;
}

- (void)dealloc
{
  [(ADJasperColorV2Executor *)self deallocateEspressoBuffers];
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x2166C5D90]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADJasperColorV2Executor;
  [(ADExecutor *)&v4 dealloc];
}

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 jasperToColorTransform:(double)a5 colorCamera:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v144 = a8;
  id v16 = a9;
  int v146 = 335683608;
  long long v147 = 0u;
  long long v148 = 0u;
  v143 = v16;
  kdebug_trace();
  v17 = a1;
  objc_sync_enter(v17);
  if (v17[120]
    || (size_t v24 = CVPixelBufferGetWidth(a7),
        (uint64_t v25 = objc_msgSend(v17, "prepareForColorROI:", 0.0, 0.0, (double)v24, (double)CVPixelBufferGetHeight(a7))) == 0))
  {
    if (!a7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = &_os_log_internal;
        v23 = "Must provide input color image";
        goto LABEL_74;
      }
LABEL_20:
      uint64_t v25 = -22953;
      goto LABEL_21;
    }
    if (!a10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = &_os_log_internal;
        v23 = "Must provide a pointer to outputDepthMap";
        goto LABEL_74;
      }
      goto LABEL_20;
    }
    [v17 expectedOutputSize];
    double v19 = v18;
    double v21 = v20;
    if (*a10 && v18 != (double)CVPixelBufferGetWidth(*a10))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = &_os_log_internal;
        v23 = "Output depth buffer width does not match descriptor";
LABEL_74:
        _os_log_error_impl(&dword_215F16000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&buf, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (a11 && *a11 && v19 != (double)CVPixelBufferGetWidth(*a11))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = &_os_log_internal;
        v23 = "Output confidence buffer width does not match descriptor";
        goto LABEL_74;
      }
      goto LABEL_20;
    }
    v137 = [*((id *)v17 + 33) logger];
    v27 = [MEMORY[0x263F08AB0] processInfo];
    [v27 systemUptime];
    double v29 = v28;

    [v137 logPixelBuffer:a7 name:"inputColor" timestamp:v29];
    [v137 logPointCloud:v144 name:"inputPointCloud" timestamp:v29];
    objc_msgSend(v137, "logMatrix4x3:name:timestamp:", "jasper2ColorTransform", a2, a3, a4, a5, v29);
    [v137 logCalibration:v16 name:"colorCameraCalibration" timestamp:v29];
    if (v17[226]) {
      double v21 = v21 - (double)(unint64_t)(*((void *)v17 + 30) + *((void *)v17 + 29));
    }
    uint64_t v30 = [v17 numberOfExecutionSteps];
    uint64_t v31 = [*((id *)v17 + 33) stepsToSkip];
    int v133 = [*((id *)v17 + 33) powerMeasureMode];
    v136 = [*((id *)v17 + 33) timeProfiler];
    uint64_t v132 = v30 - v31;
    if (v133)
    {
      BOOL v32 = v132-- < 1;
      if (v32)
      {
        uint64_t v25 = 0;
LABEL_134:

        goto LABEL_21;
      }
    }
    v131 = a11;
    kdebug_trace();
    [v136 startWithUTFString:"preprocess jasper"];
    [v17 frameExecutionStart];
    if (!v144 || (int)[v144 length] < 1)
    {
      id v134 = 0;
      PixelBufferUtils::blacken(*((__CVBuffer **)v17 + 19), v33);
      goto LABEL_31;
    }
    int v34 = [*((id *)v17 + 27) capacity];
    if (v34 >= (int)[v144 length])
    {
      [*((id *)v17 + 27) resize:0];
    }
    else
    {
      uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x263F26CC0]), "initWithCapacity:", objc_msgSend(v144, "length"));
      v36 = (void *)*((void *)v17 + 27);
      *((void *)v17 + 27) = v35;
    }
    double v129 = v21;
    double v130 = v19;
    id v64 = v16;
    v65 = v64;
    double v66 = *((double *)v17 + 1);
    double v67 = *((double *)v17 + 2);
    double v68 = *((double *)v17 + 3);
    double v69 = *((double *)v17 + 4);
    if (v17[226])
    {
      double v135 = v29;
      double v70 = *((double *)v17 + 3);
      unint64_t v71 = *((void *)v17 + 29);
      double v72 = *((double *)v17 + 32);
      double v73 = *((double *)v17 + 31);
      v74 = (void *)[v64 mutableCopy];
      [v65 referenceDimensions];
      double v76 = v75;
      [v65 referenceDimensions];
      objc_msgSend(v74, "crop:", 0.0, -(double)v71 / v72, v76, v73 + v77);

      double v69 = v69 + v73;
      v65 = v74;
      double v68 = v70;
      double v29 = v135;
    }
    uint64_t v25 = objc_msgSend(*((id *)v17 + 16), "changePointCloudPOV:targetCamera:jasperToCameraTransform:outputPointCloud:", v144, v65, *((void *)v17 + 27), a2, a3, a4, a5);
    [v137 logPointCloud:*((void *)v17 + 27) name:"povChangedPointCloud" timestamp:v29];
    if (v25)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "changePointCloudPOV failed", (uint8_t *)&buf, 2u);
      }
      id v134 = 0;
LABEL_71:

      goto LABEL_133;
    }
    v78 = (void *)*((void *)v17 + 16);
    uint64_t v79 = *((void *)v17 + 27);
    uint64_t v80 = *((void *)v17 + 10);
    uint64_t v81 = *((void *)v17 + 19);
    id v145 = 0;
    uint64_t v25 = objc_msgSend(v78, "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:filteredPoints:", v79, v80, v81, &v145, v66, v67, v68, v69);
    id v134 = v145;
    if (v25)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Projecting jasper points failed", (uint8_t *)&buf, 2u);
      }
      goto LABEL_71;
    }
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v82 = [v144 length];
        int v83 = [v134 length];
        LODWORD(buf.data) = 67109376;
        HIDWORD(buf.data) = v82;
        LOWORD(buf.height) = 1024;
        *(_DWORD *)((char *)&buf.height + 2) = v83;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorV2Executor: got input point cloud of %u points, %u were used for inference", (uint8_t *)&buf, 0xEu);
        if (!v17[226]) {
          goto LABEL_85;
        }
        goto LABEL_84;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v98 = [v144 length];
      int v99 = [v134 length];
      LODWORD(buf.data) = 67109376;
      HIDWORD(buf.data) = v98;
      LOWORD(buf.height) = 1024;
      *(_DWORD *)((char *)&buf.height + 2) = v99;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ADJasperColorV2Executor: got input point cloud of %u points, %u were used for inference", (uint8_t *)&buf, 0xEu);
      if (!v17[226]) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
    if (!v17[226])
    {
LABEL_85:

      double v21 = v129;
      double v19 = v130;
LABEL_31:
      [v137 logPixelBuffer:*((void *)v17 + 19) name:"processedJasper" timestamp:v29];
      [v136 stopWithUTFString:"preprocess jasper"];
      kdebug_trace();
      if (v133)
      {
        if (v132 < 1) {
          goto LABEL_132;
        }
        --v132;
      }
      kdebug_trace();
      [v136 startWithUTFString:"preprocess color"];
      uint64_t v37 = *((void *)v17 + 18);
      if (!v37) {
        goto LABEL_41;
      }
      int v38 = *(_DWORD *)(v37 + 40);
      double v40 = *(double *)(v37 + 24);
      double v39 = *(double *)(v37 + 32);
      if (v40 != (double)CVPixelBufferGetWidth(a7)
        || v39 != (double)CVPixelBufferGetHeight(a7)
        || CVPixelBufferGetPixelFormatType(a7) != v38
        || !PixelBufferUtilsSession::verifyOutput(*((PixelBufferUtilsSession **)v17 + 18), *((CVPixelBufferRef *)v17 + 17)))
      {
        v41 = (PixelBufferUtilsSession *)*((void *)v17 + 18);
        if (v41)
        {
          PixelBufferUtilsSession::~PixelBufferUtilsSession(v41);
          MEMORY[0x2166C5D90]();
        }
LABEL_41:
        size_t Width = CVPixelBufferGetWidth(a7);
        size_t Height = CVPixelBufferGetHeight(a7);
        PixelFormatType = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
        size_t v45 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v17 + 17));
        size_t v46 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v17 + 17));
        CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v17 + 17));
        v151.width = (double)Width;
        v151.height = (double)Height;
        v154.height = (double)v46;
        v154.width = (double)v45;
        PixelBufferUtilsSession::createCropScaleConvertRotateSession(PixelFormatType, v151, v154, *(CGRect *)(v17 + 8));
      }
      v47 = (CVPixelBufferRef *)(v17 + 136);
      if ((PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v17 + 18), a7, *((__CVBuffer **)v17 + 17)) & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.data) = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed scaling color image", (uint8_t *)&buf, 2u);
        }
        uint64_t v25 = -22950;
        goto LABEL_133;
      }
      v48 = v137;
      if (v17[226])
      {
        CVPixelBufferLockBaseAddress(*v47, 0);
        memset(&buf, 0, sizeof(buf));
        PixelBufferUtils::asVImageBuffer(*v47, *MEMORY[0x263F001A8], &buf);
        unint64_t v49 = *((void *)v17 + 29);
        if (v49)
        {
          unint64_t v50 = 0;
          unsigned int v51 = 1;
          data = (char *)buf.data;
          size_t rowBytes = buf.rowBytes;
          do
          {
            memcpy(&data[rowBytes * v50], &data[rowBytes * v49], rowBytes);
            unint64_t v50 = v51;
            unint64_t v49 = *((void *)v17 + 29);
            ++v51;
          }
          while (v49 > v50);
        }
        unint64_t v54 = *((void *)v17 + 30);
        if (v54)
        {
          unint64_t v55 = 0;
          size_t v56 = buf.rowBytes;
          unsigned int v57 = 1;
          v58 = (char *)buf.data;
          vImagePixelCount v59 = buf.height;
          do
          {
            memcpy(&v58[(v59 + ~v55) * v56], &v58[(v59 + ~v54) * v56], v56);
            unint64_t v55 = v57;
            unint64_t v54 = *((void *)v17 + 30);
            ++v57;
          }
          while (v54 > v55);
        }
        CVPixelBufferUnlockBaseAddress(*v47, 0);
        v48 = v137;
      }
      [v48 logPixelBuffer:*v47 name:"processedColor" timestamp:v29];
      [v136 stopWithUTFString:"preprocess color"];
      kdebug_trace();
      if (v133)
      {
        if (v132 < 1) {
          goto LABEL_132;
        }
        --v132;
      }
      kdebug_trace();
      [v136 startWithUTFString:"network execution"];
      if (v17[224])
      {
        [v137 logPixelBuffer:*((void *)v17 + 20) name:"prevDepth" timestamp:v29];
        [v137 logPixelBuffer:*((void *)v17 + 21) name:"prevColor" timestamp:v29];
        uint64_t v60 = *((void *)v17 + 22);
        if (v60) {
          [v137 logPixelBuffer:v60 name:"prevUncertainty" timestamp:v29];
        }
      }
      uint64_t v25 = [*((id *)v17 + 8) execute];
      v61 = (CVPixelBufferRef *)(v17 + 184);
      [v137 logPixelBuffer:*((void *)v17 + 23) name:"outputDepth" timestamp:v29];
      [v137 logPixelBuffer:*((void *)v17 + 24) name:"outputUncertainty" timestamp:v29];
      if (v25)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
LABEL_133:

          goto LABEL_134;
        }
        LOWORD(buf.data) = 0;
        v62 = &_os_log_internal;
        v63 = "Failed executing network";
LABEL_99:
        _os_log_error_impl(&dword_215F16000, v62, OS_LOG_TYPE_ERROR, v63, (uint8_t *)&buf, 2u);
        goto LABEL_133;
      }
      [v136 stopWithUTFString:"network execution"];
      kdebug_trace();
      if (v133)
      {
        if (v132 < 1) {
          goto LABEL_132;
        }
        --v132;
      }
      kdebug_trace();
      [v136 startWithUTFString:"postprocess depth"];
      if (!*a10)
      {
        v86 = [*((id *)v17 + 16) inferenceDescriptor];
        v87 = [v86 depthOutput];
        v88 = [v87 imageDescriptor];
        OSType v89 = [v88 pixelFormat];
        v152.width = v19;
        v152.height = v21;
        *a10 = PixelBufferUtils::createPixelBuffer(v89, v152, 1);
      }
      v90 = v131;
      v142 = v17 + 192;
      if (v131)
      {
        CVPixelBufferRef v91 = *v131;
        uint64_t v92 = v132;
        if (*v131)
        {
LABEL_96:
          size_t v97 = CVPixelBufferGetWidth(*v61);
          uint64_t v25 = objc_msgSend(*((id *)v17 + 16), "postProcessDepth:uncertainty:filteredPointCloud:outputDepth:outputUncertainty:depthRoi:", *v61, *v142, v134, *a10, v91, ((double)v97 - v19) * 0.5, ((double)CVPixelBufferGetHeight(*v61) - v21) * 0.5, v19, v21);
          if (v25)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_133;
            }
            LOWORD(buf.data) = 0;
            v62 = &_os_log_internal;
            v63 = "Failed depth post processing";
            goto LABEL_99;
          }
          [v137 logPixelBuffer:*a10 name:"outputProcessedDepth" timestamp:v29];
          [v136 stopWithUTFString:"postprocess depth"];
          kdebug_trace();
          if (!v133 || (BOOL v32 = v92 < 1, --v92, !v32))
          {
            kdebug_trace();
            [v136 startWithUTFString:"postprocess confidence"];
            if (v90)
            {
              uint64_t v25 = [*((id *)v17 + 16) postProcessUncertainty:v91 outputConfidence:*v90 confidenceUnits:0];
              if (v25)
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_133;
                }
                LOWORD(buf.data) = 0;
                v62 = &_os_log_internal;
                v63 = "Failed uncertainty post processing";
                goto LABEL_99;
              }
              [v137 logPixelBuffer:*v90 name:"outputProcessedConfidence" timestamp:v29];
            }
            [v136 stopWithUTFString:"postprocess confidence"];
            kdebug_trace();
            char v100 = v133;
            if (v92 >= 1) {
              char v100 = 0;
            }
            if ((v100 & 1) == 0)
            {
              kdebug_trace();
              [v136 startWithUTFString:"postprocess previous depth"];
              if (v17[224])
              {
                if (*((void *)v17 + 25) && *((void *)v17 + 26))
                {
                  v101 = (void *)*((void *)v17 + 8);
                  v102 = [*((id *)v17 + 16) inferenceDescriptor];
                  v103 = [v102 prevDepthInput];
                  v104 = [*((id *)v17 + 16) inferenceDescriptor];
                  v105 = [v104 depthFeaturesOutput];
                  uint64_t v25 = [v101 updateFeedbackLoopInputBuffer:v17 + 160 inputDescriptor:v103 outputBuffer:v17 + 200 outputDescriptor:v105];

                  if (v25)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_133;
                    }
                    LOWORD(buf.data) = 0;
                    v62 = &_os_log_internal;
                    v63 = "Failed updating previous depth buffer";
                    goto LABEL_99;
                  }
                  v116 = (void *)*((void *)v17 + 8);
                  v117 = [*((id *)v17 + 16) inferenceDescriptor];
                  v118 = [v117 prevColorInput];
                  v119 = [*((id *)v17 + 16) inferenceDescriptor];
                  v120 = [v119 colorFeaturesOutput];
                  uint64_t v25 = [v116 updateFeedbackLoopInputBuffer:v17 + 168 inputDescriptor:v118 outputBuffer:v17 + 208 outputDescriptor:v120];

                  if (v25)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_133;
                    }
                    LOWORD(buf.data) = 0;
                    v62 = &_os_log_internal;
                    v63 = "Failed updating previous color buffer";
                    goto LABEL_99;
                  }
                }
                else
                {
                  v106 = (void *)*((void *)v17 + 8);
                  v107 = [*((id *)v17 + 16) inferenceDescriptor];
                  v108 = [v107 prevDepthInput];
                  v109 = [*((id *)v17 + 16) inferenceDescriptor];
                  v110 = [v109 depthOutput];
                  uint64_t v25 = [v106 updateFeedbackLoopInputBuffer:v17 + 160 inputDescriptor:v108 outputBuffer:v17 + 184 outputDescriptor:v110];

                  if (v25)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_133;
                    }
                    LOWORD(buf.data) = 0;
                    v62 = &_os_log_internal;
                    v63 = "Failed updating previous depth buffer";
                    goto LABEL_99;
                  }
                  v111 = (void *)*((void *)v17 + 8);
                  v112 = [*((id *)v17 + 16) inferenceDescriptor];
                  v113 = [v112 prevColorInput];
                  v114 = [*((id *)v17 + 16) inferenceDescriptor];
                  v115 = [v114 colorInput];
                  uint64_t v25 = [v111 updateFeedbackLoopInputBuffer:v17 + 168 inputDescriptor:v113 outputBuffer:v17 + 136 outputDescriptor:v115];

                  if (v25)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_133;
                    }
                    LOWORD(buf.data) = 0;
                    v62 = &_os_log_internal;
                    v63 = "Failed updating previous color buffer";
                    goto LABEL_99;
                  }
                }
                v121 = [*((id *)v17 + 16) inferenceDescriptor];
                v122 = [v121 prevUncertaintyInput];
                BOOL v123 = v122 == 0;

                if (!v123)
                {
                  v124 = (void *)*((void *)v17 + 8);
                  v125 = [*((id *)v17 + 16) inferenceDescriptor];
                  v126 = [v125 prevUncertaintyInput];
                  v127 = [*((id *)v17 + 16) inferenceDescriptor];
                  v128 = [v127 uncertaintyOutput];
                  uint64_t v25 = [v124 updateFeedbackLoopInputBuffer:v17 + 176 inputDescriptor:v126 outputBuffer:v142 outputDescriptor:v128];

                  if (v25)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_133;
                    }
                    LOWORD(buf.data) = 0;
                    v62 = &_os_log_internal;
                    v63 = "Failed updating previous uncertainty buffer";
                    goto LABEL_99;
                  }
                }
              }
              [v136 stopWithUTFString:"postprocess previous depth"];
              kdebug_trace();
              [v17 frameExecutionEnd];
            }
          }
LABEL_132:
          uint64_t v25 = 0;
          goto LABEL_133;
        }
        v93 = [*((id *)v17 + 16) inferenceDescriptor];
        v94 = [v93 uncertaintyOutput];
        v95 = [v94 imageDescriptor];
        OSType v96 = [v95 pixelFormat];
        v153.width = v19;
        v153.height = v21;
        CVPixelBufferRef *v131 = PixelBufferUtils::createPixelBuffer(v96, v153, 1);

        v90 = v131;
        CVPixelBufferRef v91 = *v131;
      }
      else
      {
        CVPixelBufferRef v91 = 0;
      }
      uint64_t v92 = v132;
      goto LABEL_96;
    }
LABEL_84:
    CVPixelBufferLockBaseAddress(*((CVPixelBufferRef *)v17 + 19), 0);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(*((PixelBufferUtils **)v17 + 19), *MEMORY[0x263F001A8], &buf);
    v84 = (char *)buf.data;
    size_t v85 = buf.rowBytes;
    bzero(buf.data, *((void *)v17 + 29) * buf.rowBytes);
    bzero(&v84[(buf.height - *((void *)v17 + 30)) * v85], *((void *)v17 + 30) * v85);
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v17 + 19), 0);
    goto LABEL_85;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.data) = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed preparing for executor for engine and ROI", (uint8_t *)&buf, 2u);
  }
LABEL_21:
  objc_sync_exit(v17);

  kdebug_trace();
  return v25;
}

- (CGSize)expectedOutputSize
{
  v3 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
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

- (int64_t)prepareForColorROI:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  kdebug_trace();
  double v8 = self;
  objc_sync_enter(v8);
  double v9 = [(ADJasperColorV2Pipeline *)v8->_pipeline inferenceDescriptor];
  uint64_t v10 = objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", width, height);
  double v11 = [v9 colorInput];
  v12 = [v11 imageDescriptor];
  [v12 sizeForLayout:v10];
  double v14 = v13;
  double v16 = v15;

  v8->_colorScaleFactor = v14 / width;
  double v17 = (double)(unint64_t)(height * (v14 / width));
  v8->_isPaddingRequired = v16 > v17;
  double v18 = v16 - v17;
  v8->_paddingLinesTop = (unint64_t)(v18 * 0.5);
  unint64_t v19 = (unint64_t)(v18 - (double)(unint64_t)(v18 * 0.5));
  v8->_paddingLinesBottom = v19;
  v8->_preScaledPaddingLines = (double)(v8->_paddingLinesTop + v19) / (v14 / width);
  unint64_t engineType = v8->super._engineType;
  double v21 = [v9 colorInput];
  v22 = [v21 imageDescriptor];
  int64_t v23 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v8, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", engineType, v22, 1, 2, v9, x, y, width, height);

  if (!v23)
  {
    int64_t v23 = [(ADJasperColorV2Executor *)v8 allocateIntermediateBuffers];
    if (!v23)
    {
      PixelBufferUtils::blacken(v8->_itmPrevDepth, v24);
      PixelBufferUtils::blacken(v8->_itmPrevColor, v25);
      if (!v8->_temporalConsistencyWithFeatures) {
        PixelBufferUtils::blacken(v8->_itmPrevUncertainty, v26);
      }
      colorProcessingSession = v8->_colorProcessingSession;
      if (colorProcessingSession)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
        MEMORY[0x2166C5D90]();
      }
      int64_t v23 = 0;
      v8->_colorProcessingSession = 0;
      v8->_isPrepared = 1;
    }
  }

  objc_sync_exit(v8);
  kdebug_trace();
  return v23;
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADJasperColorV2Executor *)self deallocateEspressoBuffers];
  espressoRunner = self->super._espressoRunner;
  objc_super v4 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
  v5 = [v4 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)espressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  double v6 = self->super._espressoRunner;
  double v7 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
  double v8 = [v7 jasperInput];
  self->_itmPreProcessedJasper = (__CVBuffer *)[(ADEspressoRunner *)v6 createAndRegisterPixelBufferForDescriptor:v8];

  if (self->_temporalConsistencySupported)
  {
    double v9 = self->super._espressoRunner;
    uint64_t v10 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
    double v11 = [v10 prevDepthInput];
    self->_itmPrevDepth = (__CVBuffer *)[(ADEspressoRunner *)v9 createAndRegisterPixelBufferForDescriptor:v11];

    v12 = self->super._espressoRunner;
    double v13 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
    double v14 = [v13 prevColorInput];
    self->_itmPrevColor = (__CVBuffer *)[(ADEspressoRunner *)v12 createAndRegisterPixelBufferForDescriptor:v14];

    LODWORD(v14) = self->_temporalConsistencyWithFeatures;
    double v15 = self->super._espressoRunner;
    double v16 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
    double v17 = v16;
    if (v14)
    {
      double v18 = [v16 depthFeaturesOutput];
      self->_itmDepthFeatures = (__CVBuffer *)[(ADEspressoRunner *)v15 createAndRegisterPixelBufferForDescriptor:v18];

      unint64_t v19 = self->super._espressoRunner;
      double v17 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
      double v20 = [v17 colorFeaturesOutput];
      double v21 = (objc_class *)[(ADEspressoRunner *)v19 createAndRegisterPixelBufferForDescriptor:v20];
      v22 = &OBJC_IVAR___ADJasperColorV2Executor__itmColorFeatures;
    }
    else
    {
      double v20 = [v16 prevUncertaintyInput];
      double v21 = (objc_class *)[(ADEspressoRunner *)v15 createAndRegisterPixelBufferForDescriptor:v20];
      v22 = &OBJC_IVAR___ADJasperColorV2Executor__itmPrevUncertainty;
    }
    *(Class *)((char *)&self->super.super.isa + *v22) = v21;
  }
  int64_t v23 = (ADMutableJasperPointCloud *)[objc_alloc(MEMORY[0x263F26CC0]) initWithCapacity:336];
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  self->_itmPovChangedPointCloud = v23;

  uint64_t v25 = self->super._espressoRunner;
  v26 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
  v27 = [v26 depthOutput];
  self->_itmUnprocessedDepth = (__CVBuffer *)[(ADEspressoRunner *)v25 createAndRegisterPixelBufferForDescriptor:v27];

  double v28 = self->super._espressoRunner;
  double v29 = [(ADJasperColorV2Pipeline *)self->_pipeline inferenceDescriptor];
  uint64_t v30 = [v29 uncertaintyOutput];
  self->_itmUnprocessedUncertaintdouble y = (__CVBuffer *)[(ADEspressoRunner *)v28 createAndRegisterPixelBufferForDescriptor:v30];

  if (!self->_itmPreProcessedColor
    || !self->_itmPreProcessedJasper
    || !self->_itmUnprocessedDepth
    || !self->_itmUnprocessedUncertainty
    || !self->_itmPovChangedPointCloud)
  {
    goto LABEL_21;
  }
  if (!self->_temporalConsistencySupported)
  {
    if (!self->_temporalConsistencyWithFeatures) {
      return 0;
    }
    goto LABEL_18;
  }
  if (!self->_itmPrevDepth || !self->_itmPrevColor) {
    goto LABEL_21;
  }
  if (self->_temporalConsistencyWithFeatures)
  {
LABEL_18:
    if (!self->_itmDepthFeatures || !self->_itmColorFeatures) {
      goto LABEL_21;
    }
    return 0;
  }
  if (self->_itmPrevUncertainty) {
    return 0;
  }
LABEL_21:
  [(ADJasperColorV2Executor *)self deallocateEspressoBuffers];
  return -22971;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmPrevDepth);
  self->_itmPrevDepth = 0;
  CVPixelBufferRelease(self->_itmPrevColor);
  self->_itmPrevColor = 0;
  CVPixelBufferRelease(self->_itmPrevUncertainty);
  self->_itmPrevUncertaintdouble y = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedUncertainty);
  self->_itmUnprocessedUncertaintdouble y = 0;
  CVPixelBufferRelease(self->_itmDepthFeatures);
  self->_itmDepthFeatures = 0;
  CVPixelBufferRelease(self->_itmColorFeatures);
  self->_itmColorFeatures = 0;
}

- (ADJasperColorV2Executor)initWithParameters:(id)a3 prioritization:(int64_t)a4 engineType:(unint64_t)a5
{
  id v8 = a3;
  int v24 = 335685812;
  long long v25 = 0u;
  long long v26 = 0u;
  kdebug_trace();
  v23.receiver = self;
  v23.super_class = (Class)ADJasperColorV2Executor;
  double v9 = [(ADExecutor *)&v23 init];
  uint64_t v10 = v9;
  if (v9)
  {
    if (!v8) {
      id v8 = (id)objc_opt_new();
    }
    p_executorParameters = (id *)&v9->_executorParameters;
    objc_storeStrong(p_executorParameters, v8);
    v12 = [ADJasperColorV2Pipeline alloc];
    double v13 = [*p_executorParameters pipelineParameters];
    uint64_t v14 = [(ADJasperColorV2Pipeline *)v12 initWithInputPrioritization:a4 espressoEngine:a5 andParameters:v13];
    pipeline = v10->_pipeline;
    v10->_pipeline = (ADJasperColorV2Pipeline *)v14;

    if (!v10->_pipeline)
    {
      double v21 = 0;
      goto LABEL_8;
    }
    v10->super._unint64_t engineType = a5;
    v10->_itmPreProcessedColor = 0;
    v10->_colorProcessingSession = 0;
    v10->_itmPreProcessedJasper = 0;
    v10->_itmPrevDepth = 0;
    v10->_itmPrevColor = 0;
    v10->_itmPrevUncertaintdouble y = 0;
    v10->_itmUnprocessedDepth = 0;
    v10->_itmUnprocessedUncertaintdouble y = 0;
    itmPovChangedPointCloud = v10->_itmPovChangedPointCloud;
    v10->_itmPovChangedPointCloud = 0;

    v10->_itmDepthFeatures = 0;
    v10->_itmColorFeatures = 0;
    v10->_isPrepared = 0;
    double v17 = [(ADJasperColorV2Pipeline *)v10->_pipeline inferenceDescriptor];
    double v18 = [v17 prevDepthInput];
    v10->_temporalConsistencySupported = v18 != 0;

    unint64_t v19 = [(ADJasperColorV2Pipeline *)v10->_pipeline inferenceDescriptor];
    double v20 = [v19 depthFeaturesOutput];
    v10->_temporalConsistencyWithFeatures = v20 != 0;

    v10->_isPaddingRequired = 0;
    v10->_paddingLinesBottom = 0;
    v10->_paddingLinesTop = 0;
    v10->_preScaledPaddingLines = 0.0;
    v10->_colorScaleFactor = 1.0;
  }
  double v21 = v10;
LABEL_8:
  kdebug_trace();

  return v21;
}

- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3 engineType:(unint64_t)a4
{
  double v7 = objc_opt_new();
  id v8 = [(ADJasperColorV2Executor *)self initWithParameters:v7 prioritization:a3 engineType:a4];

  return v8;
}

- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3
{
  if ([MEMORY[0x263F28048] hasANE]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }
  return [(ADJasperColorV2Executor *)self initWithInputPrioritization:a3 engineType:v5];
}

@end