@interface ADJasperColorInFieldCalibrationExecutor
- (ADCameraCalibration)colorCameraCalibration;
- (ADCameraCalibration)jasperCameraCalibration;
- (ADJasperColorInFieldCalibrationExecutor)init;
- (ADJasperColorInFieldCalibrationExecutorParameters)executorParameters;
- (ADJasperColorInFieldCalibrationPipeline)pipeline;
- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3;
- (__n128)vmcamToWmcamExtrinsics;
- (__n128)wmcamToMcamExtrinsics;
- (double)rectifyColorCameraExtrinsics:(float32x4_t)a3;
- (id)initForEngineType:(unint64_t)a3;
- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)clearFeaturesAggregator;
- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepare;
- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:(uint64_t)a7 colorCameraCalibration:(uint64_t)a8 timestamp:(void *)a9 colorMetadata:(double *)a10;
- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:colorCameraCalibration:colorMetadata:;
- (uint64_t)preprocessInputColorFrame:(void *)a1 colorPose:(const char *)a2 jasperPointClouds:(uint64_t)a3 jasperPoses:(uint64_t)a4 jasperCameraCalibration:(uint64_t)a5 colorCameraCalibration:(uint64_t)a6 timestamp:(uint64_t)a7;
- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setColorCameraCalibration:(id)a3;
- (void)setExecutorParameters:(id)a3;
- (void)setJasperCameraCalibration:(id)a3;
@end

@implementation ADJasperColorInFieldCalibrationExecutor

- (int64_t)allocateIntermediateBuffers
{
  [(ADJasperColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];
  v48 = [(ADJasperColorInFieldCalibrationPipeline *)self->_pipeline backendInferenceDescriptor];
  v3 = [(ADJasperColorInFieldCalibrationPipeline *)self->_pipeline frontendInferenceDescriptor];
  backendEspressoRunner = self->_backendEspressoRunner;
  v5 = [v48 colorInput];
  self->_itmPreProcessedColor = (__CVBuffer *)[(ADEspressoRunner *)backendEspressoRunner createAndRegisterPixelBufferForDescriptor:v5];

  v6 = +[ADUtils getStandardNameForBufferOfType:@"itmPreProcessedColor" moduleName:@"RGBJ"];
  +[ADUtils updatePixelBufferIOSurfaceLabel:v6 pixelBuffer:self->_itmPreProcessedColor];
  v7 = self->_backendEspressoRunner;
  v8 = [v48 jasperInput];
  self->_itmPreProcessedJasper = (__CVBuffer *)[(ADEspressoRunner *)v7 createAndRegisterPixelBufferForDescriptor:v8];

  uint64_t v9 = +[ADUtils getStandardNameForBufferOfType:@"itmPreProcessedJasper" moduleName:@"RGBJ"];

  v49 = (void *)v9;
  +[ADUtils updatePixelBufferIOSurfaceLabel:v9 pixelBuffer:self->_itmPreProcessedJasper];
  v10 = self->_backendEspressoRunner;
  v11 = [v48 featuresOutput];
  v12 = [(ADEspressoRunner *)v10 registerDescriptor:v11];
  featuresOutputEspressoBufferHandle = self->_featuresOutputEspressoBufferHandle;
  self->_featuresOutputEspressoBufferHandle = v12;

  frontendEspressoRunner = self->_frontendEspressoRunner;
  v15 = [v3 featuresInput];
  v16 = [(ADEspressoRunner *)frontendEspressoRunner registerDescriptor:v15];
  frontendFeaturesInputEspressoBufferHandle = self->_frontendFeaturesInputEspressoBufferHandle;
  self->_frontendFeaturesInputEspressoBufferHandle = v16;

  v18 = self->_frontendEspressoRunner;
  v19 = [v3 rotationXOutput];
  v20 = [(ADEspressoRunner *)v18 registerDescriptor:v19];
  frontendRotXOutputEspressoBufferHandle = self->_frontendRotXOutputEspressoBufferHandle;
  self->_frontendRotXOutputEspressoBufferHandle = v20;

  v22 = self->_frontendEspressoRunner;
  v23 = [v3 rotationYOutput];
  v24 = [(ADEspressoRunner *)v22 registerDescriptor:v23];
  frontendRotYOutputEspressoBufferHandle = self->_frontendRotYOutputEspressoBufferHandle;
  self->_frontendRotYOutputEspressoBufferHandle = v24;

  v26 = self->_frontendEspressoRunner;
  v27 = [v3 errorXOutput];
  v28 = [(ADEspressoRunner *)v26 registerDescriptor:v27];
  frontendRotErrorXOutputEspressoBufferHandle = self->_frontendRotErrorXOutputEspressoBufferHandle;
  self->_frontendRotErrorXOutputEspressoBufferHandle = v28;

  v30 = self->_frontendEspressoRunner;
  v31 = [v3 errorYOutput];
  v32 = [(ADEspressoRunner *)v30 registerDescriptor:v31];
  frontendRotErrorYOutputEspressoBufferHandle = self->_frontendRotErrorYOutputEspressoBufferHandle;
  self->_frontendRotErrorYOutputEspressoBufferHandle = v32;

  v34 = [v3 rotationZOutput];
  if (v34)
  {
    v35 = [v3 errorZOutput];

    if (v35)
    {
      v36 = self->_frontendEspressoRunner;
      v37 = [v3 rotationZOutput];
      v38 = [(ADEspressoRunner *)v36 registerDescriptor:v37];
      frontendRotZOutputEspressoBufferHandle = self->_frontendRotZOutputEspressoBufferHandle;
      self->_frontendRotZOutputEspressoBufferHandle = v38;

      v40 = self->_frontendEspressoRunner;
      v41 = [v3 errorZOutput];
      v42 = [(ADEspressoRunner *)v40 registerDescriptor:v41];
      frontendRotErrorZOutputEspressoBufferHandle = self->_frontendRotErrorZOutputEspressoBufferHandle;
      self->_frontendRotErrorZOutputEspressoBufferHandle = v42;
    }
  }
  if (self->_itmPreProcessedColor)
  {
    if (self->_itmPreProcessedJasper)
    {
      v44 = self->_featuresOutputEspressoBufferHandle;
      if (v44)
      {
        if (self->_frontendFeaturesInputEspressoBufferHandle
          && self->_frontendRotXOutputEspressoBufferHandle
          && self->_frontendRotYOutputEspressoBufferHandle
          && self->_frontendRotErrorXOutputEspressoBufferHandle
          && self->_frontendRotErrorYOutputEspressoBufferHandle)
        {
          uint64_t v45 = [(ADEspressoBufferHandle *)v44 dimensionsProduct];
          v46 = [(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
          [v46 featuresVectorAggregationSize];

          self->_backendSingleResultSize = self->_backendFeaturesOutputElementSize * v45;
          operator new[]();
        }
      }
    }
  }
  [(ADJasperColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];

  return -22971;
}

- (int64_t)prepare
{
  v2 = self;
  objc_sync_enter(v2);
  int v22 = 335687084;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "jasper color infield calibration executor: preparing executor", v21, 2u);
  }
  v3 = [(ADJasperColorInFieldCalibrationPipeline *)v2->_pipeline backendInferenceDescriptor];
  id v4 = objc_alloc(MEMORY[0x263F26C58]);
  v5 = [v3 networkURL];
  v6 = [v5 absoluteString];
  unint64_t engineType = v2->super._engineType;
  v8 = [v3 configurationNameForLayout:v2->super._layout];
  uint64_t v9 = [v4 initWithPath:v6 forEngine:engineType configurationName:v8];
  backendEspressoRunner = v2->_backendEspressoRunner;
  v2->_backendEspressoRunner = (ADEspressoRunner *)v9;

  if (v2->_backendEspressoRunner)
  {
    v11 = [(ADJasperColorInFieldCalibrationPipeline *)v2->_pipeline frontendInferenceDescriptor];
    id v12 = objc_alloc(MEMORY[0x263F26C58]);
    v13 = [v11 networkURL];
    v14 = [v13 absoluteString];
    unint64_t v15 = v2->super._engineType;
    v16 = [v11 configurationNameForLayout:v2->super._layout];
    uint64_t v17 = [v12 initWithPath:v14 forEngine:v15 configurationName:v16];
    frontendEspressoRunner = v2->_frontendEspressoRunner;
    v2->_frontendEspressoRunner = (ADEspressoRunner *)v17;

    if (v2->_frontendEspressoRunner)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "preparing jasper color in field calibration executor", v21, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "preparing jasper color in field calibration executor", v21, 2u);
      }
      int64_t v19 = [(ADJasperColorInFieldCalibrationExecutor *)v2 allocateIntermediateBuffers];
      if (v19)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to allocate buffers", v21, 2u);
        }
      }
      else
      {
        v2->_isPrepared = 1;
      }
    }
    else
    {
      int64_t v19 = -22960;
    }
  }
  else
  {
    int64_t v19 = -22960;
  }

  kdebug_trace();
  objc_sync_exit(v2);

  return v19;
}

- (ADJasperColorInFieldCalibrationPipeline)pipeline
{
  return self->_pipeline;
}

- (id)initForEngineType:(unint64_t)a3 andExecutorParameters:(id)a4
{
  id v6 = a4;
  int v48 = 335682504;
  long long v49 = 0u;
  long long v50 = 0u;
  kdebug_trace();
  v47.receiver = self;
  v47.super_class = (Class)ADJasperColorInFieldCalibrationExecutor;
  v7 = [(ADExecutor *)&v47 init];
  v8 = v7;
  uint64_t v9 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  v7->_isPrepared = 0;
  v7->_preProcessInputColorFrameDone = 0;
  v10 = [ADJasperColorInFieldCalibrationPipeline alloc];
  v11 = [v6 pipelineParameters];
  uint64_t v12 = [(ADJasperColorInFieldCalibrationPipeline *)v10 initWithParameters:v11 espressoEngine:a3];
  pipeline = v9->_pipeline;
  v9->_pipeline = (ADJasperColorInFieldCalibrationPipeline *)v12;

  +[ADDeviceConfiguration floatForKey:kADDeviceConfigurationKeyJasperColorInFieldForceAngularVelocityLogic];
  v9->_forceAngularVelocityLogic = (int)v14;
  if (!v9->_pipeline)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v43 = &_os_log_internal;
    v44 = "Jasper Color In Field Calibration pipeline failed to init ";
LABEL_18:
    _os_log_error_impl(&dword_215F16000, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_19;
  }
  -[ADJasperColorInFieldCalibrationExecutor setVmcamToWmcamExtrinsics:](v9, "setVmcamToWmcamExtrinsics:");
  -[ADJasperColorInFieldCalibrationExecutor setWmcamToMcamExtrinsics:](v9, "setWmcamToMcamExtrinsics:", *(double *)&_PromotedConst_5734, 0.0078125, 0.0, 0.0);
  v9->super._unint64_t engineType = a3;
  backendEspressoRunner = v9->_backendEspressoRunner;
  v9->_backendEspressoRunner = 0;

  frontendEspressoRunner = v9->_frontendEspressoRunner;
  v9->_frontendEspressoRunner = 0;

  mcamJCameraCalibration = v9->_mcamJCameraCalibration;
  v9->_mcamJCameraCalibration = 0;

  v18 = [ADJasperColorInFieldCalibrationExecutorParameters alloc];
  int64_t v19 = [(ADJasperColorInFieldCalibrationPipeline *)v9->_pipeline pipelineParameters];
  uint64_t v20 = [(ADJasperColorInFieldCalibrationExecutorParameters *)v18 initWithPipelineParameters:v19];
  executorParameters = v9->_executorParameters;
  v9->_executorParameters = (ADJasperColorInFieldCalibrationExecutorParameters *)v20;

  if (!v9->_executorParameters)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v43 = &_os_log_internal;
    v44 = "Jasper Color In Field Calibration executor parameters failed to init ";
    goto LABEL_18;
  }
  aggregatedPointCloud = v9->_aggregatedPointCloud;
  v9->_aggregatedPointCloud = 0;

  v9->_itmPreProcessedColor = 0;
  v9->_itmPreProcessedJasper = 0;
  featuresOutputEspressoBufferHandle = v9->_featuresOutputEspressoBufferHandle;
  v9->_featuresOutputEspressoBufferHandle = 0;

  frontendFeaturesInputEspressoBufferHandle = v9->_frontendFeaturesInputEspressoBufferHandle;
  v9->_frontendFeaturesInputEspressoBufferHandle = 0;

  frontendRotErrorXOutputEspressoBufferHandle = v9->_frontendRotErrorXOutputEspressoBufferHandle;
  v9->_frontendRotErrorXOutputEspressoBufferHandle = 0;

  frontendRotErrorYOutputEspressoBufferHandle = v9->_frontendRotErrorYOutputEspressoBufferHandle;
  v9->_frontendRotErrorYOutputEspressoBufferHandle = 0;

  frontendRotErrorZOutputEspressoBufferHandle = v9->_frontendRotErrorZOutputEspressoBufferHandle;
  v9->_frontendRotErrorZOutputEspressoBufferHandle = 0;

  frontendRotXOutputEspressoBufferHandle = v9->_frontendRotXOutputEspressoBufferHandle;
  v9->_frontendRotXOutputEspressoBufferHandle = 0;

  frontendRotYOutputEspressoBufferHandle = v9->_frontendRotYOutputEspressoBufferHandle;
  v9->_frontendRotYOutputEspressoBufferHandle = 0;

  frontendRotZOutputEspressoBufferHandle = v9->_frontendRotZOutputEspressoBufferHandle;
  v9->_frontendRotZOutputEspressoBufferHandle = 0;

  v31 = [(ADJasperColorInFieldCalibrationPipeline *)v9->_pipeline frontendInferenceDescriptor];
  v32 = [v31 featuresInput];
  v33 = [v32 imageDescriptor];
  v9->_unint64_t frontendFeaturesInputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v33 pixelFormat], 0);

  unint64_t frontendFeaturesInputElementSize = v9->_frontendFeaturesInputElementSize;
  if (frontendFeaturesInputElementSize != 2 && frontendFeaturesInputElementSize != 4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    v43 = &_os_log_internal;
    v44 = "Unexpected pixel format for frontend input";
    goto LABEL_18;
  }
  v35 = [(ADJasperColorInFieldCalibrationPipeline *)v9->_pipeline backendInferenceDescriptor];
  v36 = [v35 featuresOutput];
  v37 = [v36 imageDescriptor];
  v9->_unint64_t backendFeaturesOutputElementSize = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v37 pixelFormat], 0);

  unint64_t backendFeaturesOutputElementSize = v9->_backendFeaturesOutputElementSize;
  if (backendFeaturesOutputElementSize != 2 && backendFeaturesOutputElementSize != 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v43 = &_os_log_internal;
      v44 = "Unexpected pixel format for backend output";
      goto LABEL_18;
    }
LABEL_19:
    v42 = 0;
    goto LABEL_20;
  }
  v9->_backendResultAggregated = 0;
  v9->_backendResultAggregationCounter = 0;
  v9->_backendSingleResultSize = 0;
  v9->_lastColorTimestamp = 0.0;
  long long v40 = *MEMORY[0x263EF89A8];
  long long v39 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  long long v41 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  *(_OWORD *)&v8->_anon_130[32] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  *(_OWORD *)&v8->_anon_130[48] = v41;
  *(_OWORD *)v8->_anon_130 = v40;
  *(_OWORD *)&v8->_anon_130[16] = v39;
LABEL_9:
  v42 = v9;
LABEL_20:
  kdebug_trace();

  return v42;
}

- (id)initForEngineType:(unint64_t)a3
{
  kdebug_trace();
  v5 = objc_alloc_init(ADJasperColorInFieldCalibrationExecutorParameters);
  id v6 = [(ADJasperColorInFieldCalibrationExecutor *)self initForEngineType:a3 andExecutorParameters:v5];

  kdebug_trace();
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jasperCameraCalibration, 0);
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotErrorXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotZOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotYOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendRotXOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_frontendFeaturesInputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_featuresOutputEspressoBufferHandle, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloud, 0);
  objc_storeStrong((id *)&self->_mcamJCameraCalibration, 0);
  objc_storeStrong((id *)&self->_frontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_backendEspressoRunner, 0);
}

- (__n128)wmcamToMcamExtrinsics
{
  return a1[29];
}

- (__n128)setVmcamToWmcamExtrinsics:(__n128)a3
{
  result[25] = a2;
  result[26] = a3;
  result[27] = a4;
  result[28] = a5;
  return result;
}

- (__n128)vmcamToWmcamExtrinsics
{
  return a1[25];
}

- (ADCameraCalibration)jasperCameraCalibration
{
  return self->_jasperCameraCalibration;
}

- (ADCameraCalibration)colorCameraCalibration
{
  return self->_colorCameraCalibration;
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADJasperColorInFieldCalibrationExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  return 6;
}

- (int64_t)clearFeaturesAggregator
{
  self->_backendResultAggregationCounter = 0;
  return 0;
}

- (int64_t)executePreprocessedInputsWithInterSessionData:(id)a3 outResult:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v7 setExecutionStatus:-22950];
  v8 = [(ADExecutorParameters *)self->_executorParameters logger];
  uint64_t v9 = [v6 persistenceData];
  [v8 logDictionary:v9 name:"inputIntersessionData" timestamp:self->_lastColorTimestamp];

  if ([v6 intersessionFeaturesHistoryCount])
  {
    unsigned int v10 = [v6 intersessionFeaturesHistoryCount];
    v11 = [(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
    unsigned int v12 = [v11 featuresVectorAggregationSize];

    if (v10 <= v12)
    {
      self->_unsigned int backendResultAggregationCounter = [v6 intersessionFeaturesHistoryCount];
      backendResultAggregated = self->_backendResultAggregated;
      id v16 = [v6 intersessionFeaturesHistory];
      uint64_t v17 = (const void *)[v16 bytes];
      v18 = [v6 intersessionFeaturesHistory];
      memcpy(backendResultAggregated, v17, [v18 length]);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v6 intersessionFeaturesHistoryCount];
      float v14 = [(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v102 = v13;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = [v14 featuresVectorAggregationSize];
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "mismatch intersession features count of %d against aggregation size of %d, history will not be loaded", buf, 0xEu);
    }
  }
  if (self->_preProcessInputColorFrameDone)
  {
    self->_preProcessInputColorFrameDone = 0;
    [v7 setExecuted:0];
    int64_t v19 = [v6 inFieldCalibrationTelemetryData];
    objc_msgSend(v19, "updateValidPointsSum:", (int)-[ADJasperPointCloud length](self->_aggregatedPointCloud, "length"));
    if (!self->_isPrepared)
    {
      int64_t v25 = -22970;
LABEL_43:

      goto LABEL_44;
    }
    if (!self->_backendEspressoRunner || !self->_frontendEspressoRunner)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
      }
      int64_t v25 = -22960;
      goto LABEL_43;
    }
    if (!v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide a pointer to ADJasperColorInFieldCalibrationResult", buf, 2u);
      }
      int64_t v25 = -22953;
      goto LABEL_43;
    }
    int64_t v20 = [(ADJasperColorInFieldCalibrationExecutor *)self numberOfExecutionSteps];
    int64_t v21 = [(ADExecutorParameters *)self->_executorParameters stepsToSkip];
    BOOL v99 = [(ADExecutorParameters *)self->_executorParameters powerMeasureMode];
    v100 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
    uint64_t v98 = v20 - v21;
    if (v99)
    {
      BOOL v22 = v98-- < 1;
      if (v22) {
        goto LABEL_41;
      }
    }
    kdebug_trace();
    [v100 startWithUTFString:"first network execution"];
    [(ADExecutor *)self frameExecutionStart];
    long long v23 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
    [v23 start:@"BackendProcess"];

    unint64_t v24 = +[ADTimeProfiler currentTimeUsec];
    int64_t v25 = [(ADEspressoRunner *)self->_backendEspressoRunner execute];
    objc_msgSend(v19, "reportBackendRunTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec") - v24);
    if (v25)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
LABEL_42:

        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v26 = &_os_log_internal;
      v27 = "failed executing backend";
LABEL_16:
      _os_log_error_impl(&dword_215F16000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_42;
    }
    v28 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
    [v28 stop:@"BackendProcess"];

    v29 = [(ADExecutorParameters *)self->_executorParameters logger];
    objc_msgSend(v29, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_featuresOutputEspressoBufferHandle, "data"), self->_backendSingleResultSize, "featureVectorItr", self->_lastColorTimestamp);

    memcpy((char *)self->_backendResultAggregated + self->_backendSingleResultSize * self->_backendResultAggregationCounter, (const void *)[(ADEspressoBufferHandle *)self->_featuresOutputEspressoBufferHandle data], self->_backendSingleResultSize);
    unsigned int backendResultAggregationCounter = self->_backendResultAggregationCounter + 1;
    self->_unsigned int backendResultAggregationCounter = backendResultAggregationCounter;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
      int v32 = [v31 featuresVectorAggregationSize];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v102 = backendResultAggregationCounter;
      *(_WORD *)&v102[4] = 1024;
      *(_DWORD *)&v102[6] = v32;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "executeForPreprocesed features index %d/%d", buf, 0xEu);

      unsigned int backendResultAggregationCounter = self->_backendResultAggregationCounter;
    }
    v33 = [(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters pipelineParameters];
    BOOL v34 = backendResultAggregationCounter < [v33 featuresVectorAggregationSize];

    if (v34)
    {
      [v7 setExecutionStatus:-22973];
      v35 = "first network execution";
    }
    else
    {
      v38 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
      [v38 start:@"FrontendProcess"];

      unint64_t v96 = +[ADTimeProfiler currentTimeUsec];
      self->_unsigned int backendResultAggregationCounter = 0;
      [v100 stopWithUTFString:"first network execution"];
      kdebug_trace();
      if (v99)
      {
        BOOL v22 = v98-- < 1;
        if (v22) {
          goto LABEL_41;
        }
      }
      kdebug_trace();
      [v100 startWithUTFString:"preprocess features"];
      pipeline = self->_pipeline;
      v97 = self->_backendResultAggregated;
      uint64_t v40 = [(ADEspressoBufferHandle *)self->_frontendFeaturesInputEspressoBufferHandle data];
      long long v41 = [(ADEspressoBufferHandle *)self->_featuresOutputEspressoBufferHandle dimensions];
      int64_t v25 = [(ADJasperColorInFieldCalibrationPipeline *)pipeline processIntermediateResultsWithBackendFeaturesOutputVector:v97 frontendEspressoFeaturesInput:v40 dimensions:v41];

      if (v25)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v26 = &_os_log_internal;
        v27 = "failed processing intermediate results (backend features vector output to frontend features input)";
        goto LABEL_16;
      }
      [v100 stopWithUTFString:"preprocess features"];
      kdebug_trace();
      if (v99)
      {
        BOOL v22 = v98-- < 1;
        if (v22) {
          goto LABEL_41;
        }
      }
      kdebug_trace();
      [v100 startWithUTFString:"second network execution"];
      int64_t v25 = [(ADEspressoRunner *)self->_frontendEspressoRunner execute];
      if (v25)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v26 = &_os_log_internal;
        v27 = "failed executing frontend";
        goto LABEL_16;
      }
      unint64_t v43 = +[ADTimeProfiler currentTimeUsec];
      v44 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
      [v44 stop:@"FrontendProcess"];

      [v19 reportFrontendRunTime:v43 - v96];
      uint64_t v45 = [(ADEspressoBufferHandle *)self->_frontendFeaturesInputEspressoBufferHandle dimensionsProduct];
      unint64_t frontendFeaturesInputElementSize = self->_frontendFeaturesInputElementSize;
      objc_super v47 = [(ADExecutorParameters *)self->_executorParameters logger];
      objc_msgSend(v47, "logRawBuffer:size:name:timestamp:", -[ADEspressoBufferHandle data](self->_frontendFeaturesInputEspressoBufferHandle, "data"), frontendFeaturesInputElementSize * v45, "featureVectorAvg", self->_lastColorTimestamp);

      [v100 stopWithUTFString:"second network execution"];
      kdebug_trace();
      BOOL v48 = v99;
      if (v98 >= 1) {
        BOOL v48 = 0;
      }
      if (v48)
      {
LABEL_41:
        int64_t v25 = 0;
        goto LABEL_42;
      }
      kdebug_trace();
      [v100 startWithUTFString:"postprocess rotation"];
      long long v49 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
      [v49 start:@"PostProcess"];

      int64_t v25 = [(ADJasperColorInFieldCalibrationPipeline *)self->_pipeline postProcessFrontendOutputX:[(ADEspressoBufferHandle *)self->_frontendRotXOutputEspressoBufferHandle data] frontendOutputY:[(ADEspressoBufferHandle *)self->_frontendRotYOutputEspressoBufferHandle data] frontendOutputZ:[(ADEspressoBufferHandle *)self->_frontendRotZOutputEspressoBufferHandle data] frontendOutputErrorX:[(ADEspressoBufferHandle *)self->_frontendRotErrorXOutputEspressoBufferHandle data] frontendOutputErrotY:[(ADEspressoBufferHandle *)self->_frontendRotErrorYOutputEspressoBufferHandle data] frontendOutputErrorZ:[(ADEspressoBufferHandle *)self->_frontendRotErrorZOutputEspressoBufferHandle data] interSessionData:v6 jasperColorInFieldCalibrationResult:v7];
      if (v25)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v26 = &_os_log_internal;
        v27 = "failed post processing pipeline results";
        goto LABEL_16;
      }
      long long v50 = [(ADExecutorParameters *)self->_executorParameters timeProfiler];
      [v50 stop:@"PostProcess"];

      v51 = [(ADExecutorParameters *)self->_executorParameters logger];
      v52 = [v7 dictionaryRepresentation];
      [v51 logDictionary:v52 name:"internalUseResults" timestamp:self->_lastColorTimestamp];

      v53 = [(ADExecutorParameters *)self->_executorParameters logger];
      [v7 jasperToColorExtrinsics];
      objc_msgSend(v53, "logMatrix4x3:name:timestamp:", "depthToColorExtrinsics");

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 preRelative2FactoryX];
        float v55 = v54;
        [v7 preRelative2FactoryY];
        float v57 = v56;
        [v7 preRelative2FactoryZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v55;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v57;
        __int16 v103 = 2048;
        double v104 = v58;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to factory [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 postRelative2FactoryX];
        float v60 = v59;
        [v7 postRelative2FactoryY];
        float v62 = v61;
        [v7 postRelative2FactoryZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v60;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v62;
        __int16 v103 = 2048;
        double v104 = v63;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to factory post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 deltaRotationX];
        float v65 = v64;
        [v7 deltaRotationY];
        float v67 = v66;
        [v7 deltaRotationZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v65;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v67;
        __int16 v103 = 2048;
        double v104 = v68;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to previouse [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 postRelative2PrevX];
        float v70 = v69;
        [v7 postRelative2PrevY];
        float v72 = v71;
        [v7 postRelative2PrevZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v70;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v72;
        __int16 v103 = 2048;
        double v104 = v73;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results relative to previouse post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 absoluteRotationX];
        float v75 = v74;
        [v7 absoluteRotationY];
        float v77 = v76;
        [v7 absoluteRotationZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v75;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v77;
        __int16 v103 = 2048;
        double v104 = v78;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results absolute [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 absoluteRotationPostISFX];
        float v80 = v79;
        [v7 absoluteRotationPostISFY];
        float v82 = v81;
        [v7 absoluteRotationPostISFZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v80;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v82;
        __int16 v103 = 2048;
        double v104 = v83;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run results absolute post ISF [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 factoryRotationX];
        float v85 = v84;
        [v7 factoryRotationY];
        float v87 = v86;
        [v7 factoryRotationZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v85;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v87;
        __int16 v103 = 2048;
        double v104 = v88;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run factory [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        [v7 stdX];
        float v90 = v89;
        [v7 stdY];
        float v92 = v91;
        [v7 stdZ];
        *(_DWORD *)buf = 134218496;
        *(double *)v102 = v90;
        *(_WORD *)&v102[8] = 2048;
        *(double *)&v102[10] = v92;
        __int16 v103 = 2048;
        double v104 = v93;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run std [%f, %f, %f]", buf, 0x20u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v94 = [v7 executed];
        [v7 confidence];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v102 = v94;
        *(_WORD *)&v102[4] = 2048;
        *(double *)&v102[6] = v95;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration run executed: %d with std: %f]", buf, 0x12u);
      }
      [v19 increaseRunTimesByOne];
      objc_msgSend(v19, "updateLastExecutionTime:", +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec"));
      if ([(ADJasperColorInFieldCalibrationExecutorParameters *)self->_executorParameters reportTelemetry])
      {
        [(ADJasperColorInFieldCalibrationPipeline *)self->_pipeline reportTelemetry:v7 withInterSessionData:v6];
        [v19 reset];
      }
      v35 = "postprocess rotation";
    }
    [v6 setIntersessionFeaturesHistoryCount:self->_backendResultAggregationCounter];
    uint64_t v36 = self->_backendResultAggregationCounter;
    if (v36)
    {
      v37 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_backendResultAggregated length:self->_backendSingleResultSize * v36];
    }
    else
    {
      v37 = objc_opt_new();
    }
    [v6 setIntersessionFeaturesHistory:v37];

    [v100 stopWithUTFString:v35];
    kdebug_trace();
    [(ADExecutor *)self frameExecutionEnd];
    goto LABEL_41;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "running executeForPreprocesed before preProcessInputColorFrame called", buf, 2u);
  }
  int64_t v25 = -22961;
LABEL_44:

  return v25;
}

- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:colorCameraCalibration:colorMetadata:
{
  return objc_msgSend(a1, "preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:", a3, a4, a5, a6, 0.0);
}

- (uint64_t)preprocessInputColorFrame:(void *)a1 colorPose:(const char *)a2 jasperPointClouds:(uint64_t)a3 jasperPoses:(uint64_t)a4 jasperCameraCalibration:(uint64_t)a5 colorCameraCalibration:(uint64_t)a6 timestamp:(uint64_t)a7
{
  return objc_msgSend(a1, "preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:", a3, a4, a5, a6, a7, 0);
}

- (uint64_t)preprocessInputColorFrame:(double)a3 colorPose:(double)a4 jasperPointClouds:(double)a5 jasperPoses:(double)a6 jasperCameraCalibration:(uint64_t)a7 colorCameraCalibration:(uint64_t)a8 timestamp:(void *)a9 colorMetadata:(double *)a10
{
  id v18 = a9;
  id v19 = a11;
  id v83 = a12;
  id v20 = a13;
  float v84 = v20;
  if (a6 == 0.0 && v20 != 0)
  {
    [MEMORY[0x263F26C68] getMidExposureTimestampFromMetadataDictionary:v20];
    a6 = v22;
  }
  unsigned int v23 = 0;
  *(double *)(a1 + 280) = a6;
  while (1)
  {
    uint64_t v24 = v23;
    if ([v18 count] <= (unint64_t)v23) {
      break;
    }
    int64_t v25 = [*(id *)(a1 + 376) logger];
    v26 = [v18 objectAtIndexedSubscript:v24];
    *((unsigned char *)&v86.__r_.__value_.__s + 23) = 15;
    strcpy((char *)&v86, "inputPointCloud");
    std::to_string(&v85, v24);
    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v27 = &v85;
    }
    else {
      v27 = (std::string *)v85.__r_.__value_.__r.__words[0];
    }
    if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v85.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v85.__r_.__value_.__l.__size_;
    }
    v29 = std::string::append(&v86, (const std::string::value_type *)v27, size);
    long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
    int64_t v88 = v29->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v30;
    v29->__r_.__value_.__l.__size_ = 0;
    v29->__r_.__value_.__r.__words[2] = 0;
    v29->__r_.__value_.__r.__words[0] = 0;
    if (v88 >= 0) {
      v31 = buf;
    }
    else {
      v31 = *(uint8_t **)buf;
    }
    [v25 logPointCloud:v26 name:v31 timestamp:*(double *)(a1 + 280)];
    if (SHIBYTE(v88) < 0)
    {
      operator delete(*(void **)buf);
      if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_23:
        if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_8;
        }
        goto LABEL_24;
      }
    }
    else if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_23;
    }
    operator delete(v85.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_8;
    }
LABEL_24:
    operator delete(v86.__r_.__value_.__l.__data_);
LABEL_8:

    unsigned int v23 = v24 + 1;
  }
  *(unsigned char *)(a1 + 288) = 0;
  [(id)a1 setColorCameraCalibration:v83];
  [(id)a1 setJasperCameraCalibration:v19];
  uint64_t v32 = [(id)a1 numberOfExecutionSteps];
  uint64_t v33 = [*(id *)(a1 + 376) stepsToSkip];
  int v34 = [*(id *)(a1 + 376) powerMeasureMode];
  v35 = [*(id *)(a1 + 376) timeProfiler];
  uint64_t v36 = v32 - v33;
  if (v34 && (BOOL v37 = v36 < 1, --v36, v37))
  {
    uint64_t v41 = 0;
  }
  else
  {
    kdebug_trace();
    [v35 startWithUTFString:"preprocess color"];
    [(id)a1 frameExecutionStart];
    v38 = [*(id *)(a1 + 376) timeProfiler];
    [v38 start:@"preprocessColor"];

    long long v39 = [*(id *)(a1 + 376) logger];
    [v39 logPixelBuffer:a8 name:"inputColor" timestamp:*(double *)(a1 + 280)];

    if (v84
      && (([*(id *)(a1 + 376) logger],
           uint64_t v40 = objc_claimAutoreleasedReturnValue(),
           [v40 logDictionary:v84 name:"inputColorMetadata" timestamp:*(double *)(a1 + 280)],
           v40,
           *(_DWORD *)(a1 + 292))
       || (unint64_t)[v18 count] >= 3)
      && ([*(id *)(a1 + 368) isAngularVelocityValid:v84] & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration preprocessInputColorFrameImpl fail for to high angular velocity", buf, 2u);
      }
      uint64_t v41 = -22964;
    }
    else
    {
      uint64_t v41 = [*(id *)(a1 + 368) preProcessColor:a8 processedColor:*(void *)(a1 + 160) referenceCameraCalibration:*(void *)(a1 + 144) colorCameraCalibration:*(void *)(a1 + 384) colorMetadata:v84];
      v42 = [*(id *)(a1 + 376) timeProfiler];
      [v42 stop:@"preprocessColor"];

      unint64_t v43 = [*(id *)(a1 + 376) logger];
      [v43 logPixelBuffer:*(void *)(a1 + 160) name:"processedColor" timestamp:*(double *)(a1 + 280)];

      if (v41)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed preProcessColor jasper", buf, 2u);
        }
      }
      else
      {
        [v35 stopWithUTFString:"preprocess color"];
        kdebug_trace();
        if (v36 < 1) {
          char v44 = v34;
        }
        else {
          char v44 = 0;
        }
        if (v44)
        {
          uint64_t v41 = 0;
        }
        else
        {
          kdebug_trace();
          [v35 startWithUTFString:"preprocess jasper"];
          [*(id *)(a1 + 144) cameraToPlatformTransform];
          int32x4_t v78 = v45;
          int32x4_t v79 = v46;
          int32x4_t v77 = v47;
          float32x4_t v82 = v48;
          [*(id *)(a1 + 392) cameraToPlatformTransform];
          float32x4_t v73 = v49;
          float32x4_t v74 = v50;
          float32x4_t v75 = v51;
          float32x4_t v76 = v52;
          v53 = [*(id *)(a1 + 376) timeProfiler];
          [v53 start:@"AggregateAndProjectJasperPoints"];

          float v72 = [MEMORY[0x263F26C98] pointCloudByMergingPointClouds:v18];
          float v54 = [*(id *)(a1 + 368) pipelineParameters];
          float v55 = [v54 pointCloudFilterParameters];
          float v56 = [v72 pointCloudByApplyingFilter:v55];
          float32x4_t v57 = (float32x4_t)vzip1q_s32(vzip2q_s32(v78, v77), vdupq_laneq_s32(v79, 2));
          int32x4_t v58 = vzip1q_s32(v78, v77);
          float32x4_t v59 = (float32x4_t)vtrn2q_s32(v78, v79);
          v59.i32[2] = v77.i32[1];
          float32x4_t v60 = (float32x4_t)vzip1q_s32(v58, v79);
          float32x4_t v61 = vnegq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v82.f32[0]), v59, *(float32x2_t *)v82.f32, 1), v57, v82, 2));
          v61.i32[3] = 1.0;
          v57.i32[3] = 0;
          float32x4_t v62 = (float32x4_t)vzip2q_s32(v58, vdupq_lane_s32(*(int32x2_t *)v79.i8, 1));
          v62.i32[3] = 0;
          v60.i32[3] = 0;
          v82.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v73.f32[0]), v62, *(float32x2_t *)v73.f32, 1), v57, v73, 2), (float32x4_t)0, v61).u64[0];
          v79.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v74.f32[0]), v62, *(float32x2_t *)v74.f32, 1), v57, v74, 2), (float32x4_t)0, v61).u64[0];
          v77.i64[0] = vaddq_f32(v61, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v76.f32[0]), v62, *(float32x2_t *)v76.f32, 1), v57, v76, 2)).u64[0];
          v78.i64[0] = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, v75.f32[0]), v62, *(float32x2_t *)v75.f32, 1), v57, v75, 2), (float32x4_t)0, v61).u64[0];

          uint64_t v63 = objc_msgSend(v56, "pointCloudByChangingPointOfViewByTransform:to:", *(void *)(a1 + 144), *(double *)v82.i64, *(double *)v79.i64, *(double *)v78.i64, *(double *)v77.i64);
          float v64 = *(void **)(a1 + 152);
          *(void *)(a1 + 152) = v63;

          float v65 = [*(id *)(a1 + 376) logger];
          [v65 logPointCloud:*(void *)(a1 + 152) name:"aggregatedJasper" timestamp:*(double *)(a1 + 280)];

          uint64_t v41 = objc_msgSend(*(id *)(a1 + 368), "preProcessJasper:pose:prevPose:referenceCameraCalibration:jasperCameraCalibration:reprojectedPointsBuffer:", *(void *)(a1 + 152), *(void *)(a1 + 144), *(void *)(a1 + 392), *(void *)(a1 + 168), *a10, a10[2], a10[4], a10[6], *(double *)(a1 + 304), *(double *)(a1 + 320), *(double *)(a1 + 336), *(double *)(a1 + 352));
          long long v66 = *(_OWORD *)a10;
          long long v67 = *((_OWORD *)a10 + 1);
          long long v68 = *((_OWORD *)a10 + 3);
          *(_OWORD *)(a1 + 336) = *((_OWORD *)a10 + 2);
          *(_OWORD *)(a1 + 352) = v68;
          *(_OWORD *)(a1 + 304) = v66;
          *(_OWORD *)(a1 + 320) = v67;
          float v69 = [*(id *)(a1 + 376) timeProfiler];
          [v69 stop:@"AggregateAndProjectJasperPoints"];

          if (v41)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed preProcessJasper jasper", buf, 2u);
            }
          }
          else
          {
            float v70 = [*(id *)(a1 + 376) logger];
            [v70 logPixelBuffer:*(void *)(a1 + 168) name:"jasperProcessed" timestamp:*(double *)(a1 + 280)];

            [v35 stopWithUTFString:"preprocess jasper"];
            kdebug_trace();
            [(id)a1 frameExecutionEnd];
            *(unsigned char *)(a1 + 288) = 1;
          }
        }
      }
    }
  }

  return v41;
}

- (uint64_t)setWmcamToMcamExtrinsics:(float32x4_t)a3
{
  uint32x4_t v5 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 480), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 464), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(result + 496), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(result + 512), a5)));
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    *(float32x4_t *)(result + 464) = a2;
    *(float32x4_t *)(result + 480) = a3;
    *(float32x4_t *)(result + 496) = a4;
    *(float32x4_t *)(result + 512) = a5;
    return objc_msgSend(*(id *)(result + 368), "updateWmcamToMcamExtrinsics:");
  }
  return result;
}

- (void)setColorCameraCalibration:(id)a3
{
  id v13 = a3;
  id v4 = [(ADExecutorParameters *)self->_executorParameters logger];
  [v4 logCalibration:v13 name:"inputColorCalibration" timestamp:self->_lastColorTimestamp];

  colorCameraCalibration = self->_colorCameraCalibration;
  if (!colorCameraCalibration || ([(ADCameraCalibration *)colorCameraCalibration isEqual:v13] & 1) == 0)
  {
    id v6 = (ADCameraCalibration *)[v13 copy];
    id v7 = self->_colorCameraCalibration;
    self->_colorCameraCalibration = v6;

    pipeline = self->_pipeline;
    uint64_t v9 = self->_colorCameraCalibration;
    [(ADCameraCalibration *)v9 cameraToPlatformTransform];
    -[ADJasperColorInFieldCalibrationExecutor rectifyColorCameraExtrinsics:](self, "rectifyColorCameraExtrinsics:");
    -[ADJasperColorInFieldCalibrationPipeline createReferenceCameraForColor:withExtrinsics:](pipeline, "createReferenceCameraForColor:withExtrinsics:", v9);
    unsigned int v10 = (ADCameraCalibration *)objc_claimAutoreleasedReturnValue();
    mcamJCameraCalibration = self->_mcamJCameraCalibration;
    self->_mcamJCameraCalibration = v10;

    unsigned int v12 = [(ADExecutorParameters *)self->_executorParameters logger];
    [v12 logCalibration:self->_mcamJCameraCalibration name:"referenceColorCameraCalibration" timestamp:self->_lastColorTimestamp];
  }
}

- (void)setJasperCameraCalibration:(id)a3
{
  id v8 = a3;
  id v4 = [(ADExecutorParameters *)self->_executorParameters logger];
  [v4 logCalibration:v8 name:"inputPointCloudCalibration" timestamp:self->_lastColorTimestamp];

  jasperCameraCalibration = self->_jasperCameraCalibration;
  if (!jasperCameraCalibration || ([(ADCameraCalibration *)jasperCameraCalibration isEqual:v8] & 1) == 0)
  {
    id v6 = (ADCameraCalibration *)[v8 copy];
    id v7 = self->_jasperCameraCalibration;
    self->_jasperCameraCalibration = v6;

    [(ADJasperColorInFieldCalibrationPipeline *)self->_pipeline updateJasperCamera:v8];
  }
}

- (double)rectifyColorCameraExtrinsics:(float32x4_t)a3
{
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[50].f32)), a3, a1[50], 1), a4, *(float32x4_t *)a1[50].f32, 2).u64[0];
  return result;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
}

- (void)dealloc
{
  if (self->_backendResultAggregated) {
    MEMORY[0x2166C5D70]();
  }
  [(ADJasperColorInFieldCalibrationExecutor *)self deallocateEspressoBuffers];
  v3.receiver = self;
  v3.super_class = (Class)ADJasperColorInFieldCalibrationExecutor;
  [(ADExecutor *)&v3 dealloc];
}

- (ADJasperColorInFieldCalibrationExecutor)init
{
  return (ADJasperColorInFieldCalibrationExecutor *)[(ADJasperColorInFieldCalibrationExecutor *)self initForEngineType:0];
}

@end