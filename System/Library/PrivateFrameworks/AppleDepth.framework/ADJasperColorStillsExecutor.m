@interface ADJasperColorStillsExecutor
- (ADJasperColorStillsExecutor)init;
- (ADJasperColorStillsExecutor)initWithParameters:(id)a3;
- (ADJasperColorStillsExecutorParameters)executorParameters;
- (id)getIntermediates;
- (id)initForDevice:(id)a3;
- (int64_t)allocateIntermediateBuffers;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3 inputROI:(CGRect)a4;
- (int64_t)prepareForEngineType:(unint64_t)a3 inputSize:(CGSize)a4;
- (uint64_t)executeWithColor:(__n128)a3 pointCloudArray:(__n128)a4 pointCloud2ColorTransform:(__n128)a5 colorCameraCalibration:(uint64_t)a6 outDepthMap:(__CVBuffer *)a7;
- (void)dealloc;
- (void)deallocateEspressoBuffers;
- (void)setExecutorParameters:(id)a3;
@end

@implementation ADJasperColorStillsExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_calibFeaturesOutputBuffer, 0);
  objc_storeStrong((id *)&self->_correctionFrontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_correctionBackendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloudBeforeCorrection, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloud, 0);
  objc_storeStrong((id *)&self->_correctionLogString, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

- (void)setExecutorParameters:(id)a3
{
}

- (ADJasperColorStillsExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (int64_t)numberOfExecutionSteps
{
  if ([(ADJasperColorStillsExecutorParameters *)self->_executorParameters performJasperToColorTransformCorrection])
  {
    return 9;
  }
  else
  {
    return 5;
  }
}

- (id)getIntermediates
{
  v44[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v43[0] = @"name";
    v43[1] = @"image";
    v44[0] = @"CroppedScaledColor";
    v44[1] = itmCroppedScaledColor;
    v5 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v3 addObject:v5];
  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v41[0] = @"name";
    v41[1] = @"image";
    v42[0] = @"RotatedColor";
    v42[1] = itmRotatedColor;
    v7 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    [v3 addObject:v7];
  }
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v39[0] = @"name";
    v39[1] = @"image";
    v40[0] = @"PreProcessed Color";
    v40[1] = itmPreProcessedColor;
    v9 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    [v3 addObject:v9];
  }
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper)
  {
    v37[0] = @"name";
    v37[1] = @"image";
    v38[0] = @"PreProcessed Jasper";
    v38[1] = itmPreProcessedJasper;
    v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    [v3 addObject:v11];
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v35[0] = @"name";
    v35[1] = @"image";
    v36[0] = @"Unprocessed Depth";
    v36[1] = itmUnprocessedDepth;
    v13 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v3 addObject:v13];
  }
  itmUnscaledProcessedDepth = self->_itmUnscaledProcessedDepth;
  if (itmUnscaledProcessedDepth)
  {
    v33[0] = @"name";
    v33[1] = @"image";
    v34[0] = @"Unscaled processed Depth";
    v34[1] = itmUnscaledProcessedDepth;
    v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [v3 addObject:v15];
  }
  itmPreProcessedJasperForCorrection = self->_itmPreProcessedJasperForCorrection;
  if (itmPreProcessedJasperForCorrection)
  {
    v31[0] = @"name";
    v31[1] = @"image";
    v32[0] = @"Unprocessed point cloud for correction";
    v32[1] = itmPreProcessedJasperForCorrection;
    v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v3 addObject:v17];
  }
  aggregatedPointCloud = self->_aggregatedPointCloud;
  if (aggregatedPointCloud)
  {
    v29[0] = @"name";
    v29[1] = @"pointcloud";
    v30[0] = @"Aggregated point cloud";
    v30[1] = aggregatedPointCloud;
    v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v3 addObject:v19];
  }
  aggregatedPointCloudBeforeCorrection = self->_aggregatedPointCloudBeforeCorrection;
  if (aggregatedPointCloudBeforeCorrection)
  {
    v27[0] = @"name";
    v27[1] = @"pointcloud";
    v28[0] = @"Aggregated point cloud before correction";
    v28[1] = aggregatedPointCloudBeforeCorrection;
    v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v3 addObject:v21];
  }
  correctionLogString = self->_correctionLogString;
  if (correctionLogString)
  {
    v25[0] = @"name";
    v25[1] = @"string";
    v26[0] = @"Correction results";
    v26[1] = correctionLogString;
    v23 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v3 addObject:v23];
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
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper) {
    CVPixelBufferRelease(itmPreProcessedJasper);
  }
  itmPreProcessedJasperForCorrection = self->_itmPreProcessedJasperForCorrection;
  if (itmPreProcessedJasperForCorrection) {
    CVPixelBufferRelease(itmPreProcessedJasperForCorrection);
  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth) {
    CVPixelBufferRelease(itmUnprocessedDepth);
  }
  itmUnscaledProcessedDepth = self->_itmUnscaledProcessedDepth;
  if (itmUnscaledProcessedDepth) {
    CVPixelBufferRelease(itmUnscaledProcessedDepth);
  }
  v10.receiver = self;
  v10.super_class = (Class)ADJasperColorStillsExecutor;
  [(ADExecutor *)&v10 dealloc];
}

- (uint64_t)executeWithColor:(__n128)a3 pointCloudArray:(__n128)a4 pointCloud2ColorTransform:(__n128)a5 colorCameraCalibration:(uint64_t)a6 outDepthMap:(__CVBuffer *)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  double v42 = a2.n128_f64[0];
  double v43 = a3.n128_f64[0];
  v48[0] = a2;
  v48[1] = a3;
  double v44 = a4.n128_f64[0];
  double v45 = a5.n128_f64[0];
  v48[2] = a4;
  v48[3] = a5;
  id v14 = a8;
  id v47 = a9;
  v15 = a1;
  objc_sync_enter(v15);
  if (*((unsigned char *)v15 + 120)
    || (size_t Width = CVPixelBufferGetWidth(a7),
        (uint64_t v25 = objc_msgSend(v15, "prepareForEngineType:inputSize:", v15[7], (double)Width, (double)CVPixelBufferGetHeight(a7))) == 0))
  {
    if (v15[8])
    {
      if (a10)
      {
        v16 = [v15[34] logger];
        v41 = v16;
        v17 = [MEMORY[0x263F08AB0] processInfo];
        [v17 systemUptime];
        double v19 = v18;

        kdebug_trace();
        [v16 logPixelBuffer:a7 name:"inputColor" timestamp:v19];
        [v16 logCalibration:v47 name:"inputColorCameraCalibration" timestamp:v19];
        objc_msgSend(v16, "logMatrix4x3:name:timestamp:", "inputPointCloud2ColorTransform", v42, v43, v44, v45, v19);
        for (unsigned int i = 0; [v14 count] > (unint64_t)i; ++i)
        {
          v21 = objc_msgSend(NSString, "stringWithFormat:", @"inputPointCloud_%d", i);
          v22 = [v14 objectAtIndexedSubscript:i];
          id v23 = v21;
          objc_msgSend(v16, "logPointCloud:name:timestamp:", v22, objc_msgSend(v23, "UTF8String"), v19);
        }
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        v28 = &_os_log_internal;
        while (1)
        {
          uint64_t v29 = v26;
          if ([v14 count] <= (unint64_t)v26) {
            break;
          }
          v30 = [v14 objectAtIndexedSubscript:v26];
          BOOL v31 = (int)[v30 length] > 0;

          if (v31)
          {
            v32 = [v14 objectAtIndexedSubscript:v29];
            char v33 = *(unsigned char *)[v32 bankIds];

            uint64_t v34 = 1 << v33;
            if ((v34 & v27) != 0 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v35 = [v14 objectAtIndexedSubscript:v29];
              int v36 = *(unsigned __int8 *)[v35 bankIds];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v36;
              _os_log_impl(&dword_215F16000, v28, OS_LOG_TYPE_DEFAULT, "Warning: Bank %d appears in more than one input point cloud", buf, 8u);
            }
            v27 |= v34;
          }
          unsigned int v26 = v29 + 1;
        }
        uint64_t v37 = [v15 numberOfExecutionSteps];
        uint64_t v38 = [v15[34] stepsToSkip];
        int v39 = [v15[34] powerMeasureMode];
        v46 = [v15[34] timeProfiler];
        if (!v39 || v37 - v38 >= 1)
        {
          kdebug_trace();
          [v46 startWithUTFString:"preprocess jasper"];
          [v15 frameExecutionStart];
          mergePointCloudsUsingSameTransform(v47, (uint64_t)v48, v14);
        }
        uint64_t v25 = 0;

        kdebug_trace();
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
        }
        uint64_t v25 = -22953;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
      }
      uint64_t v25 = -22960;
    }
  }
  objc_sync_exit(v15);

  return v25;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputROI:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = self;
  objc_sync_enter(v9);
  int v32 = 335682096;
  long long v33 = 0u;
  long long v34 = 0u;
  kdebug_trace();
  unint64_t engineType = v9->super._engineType;
  unint64_t layout = v9->super._layout;
  v12 = [(ADExecutorParameters *)v9->_executorParameters logger];
  v13 = [NSString stringWithFormat:@"ROI: Origin: (%d, %d), Size: (%d, %d)", (int)x, (int)y, (int)width, (int)height];
  [v12 logString:v13 name:"inputROI" priority:0];

  id v14 = [(ADJasperColorStillsPipeline *)v9->_pipeline inferenceDescriptor];
  v15 = [v14 colorInput];
  v16 = [v15 imageDescriptor];
  int64_t v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v9, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, 1, 2, v14, x, y, width, height);

  if (!v17)
  {
    if (v9->super._engineType == engineType && v9->super._layout == layout && v9->_isPrepared)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Skipping buffers re-allocation and SIP runners init as nothing relevant has changed", buf, 2u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Skipping buffers re-allocation and SIP runners init as nothing relevant has changed", buf, 2u);
        int64_t v17 = 0;
        goto LABEL_15;
      }
      int64_t v17 = 0;
    }
    else
    {
      double v18 = [(ADJasperColorStillsPipeline *)v9->_pipeline correctionBackendInferenceDescriptor];
      id v19 = objc_alloc(MEMORY[0x263F26C58]);
      v20 = [v18 networkURL];
      v21 = [v20 absoluteString];
      uint64_t v22 = [v19 initWithPath:v21 forEngine:v9->super._engineType configurationName:0];
      correctionBackendEspressoRunner = v9->_correctionBackendEspressoRunner;
      v9->_correctionBackendEspressoRunner = (ADEspressoRunner *)v22;

      if (v9->_correctionBackendEspressoRunner)
      {
        v24 = [(ADJasperColorStillsPipeline *)v9->_pipeline correctionFrontendInferenceDescriptor];
        id v25 = objc_alloc(MEMORY[0x263F26C58]);
        unsigned int v26 = [v24 networkURL];
        uint64_t v27 = [v26 absoluteString];
        uint64_t v28 = [v25 initWithPath:v27 forEngine:v9->super._engineType configurationName:0];
        correctionFrontendEspressoRunner = v9->_correctionFrontendEspressoRunner;
        v9->_correctionFrontendEspressoRunner = (ADEspressoRunner *)v28;

        if (v9->_correctionFrontendEspressoRunner)
        {
          int64_t v17 = [(ADJasperColorStillsExecutor *)v9 allocateIntermediateBuffers];
          v9->_isPrepared = v17 == 0;
        }
        else
        {
          int64_t v17 = -22960;
        }
      }
      else
      {
        int64_t v17 = -22960;
      }
    }
  }
LABEL_15:

  kdebug_trace();
  objc_sync_exit(v9);

  return v17;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputSize:(CGSize)a4
{
  return -[ADJasperColorStillsExecutor prepareForEngineType:inputROI:](self, "prepareForEngineType:inputROI:", a3, 0.0, 0.0, a4.width, a4.height);
}

- (int64_t)allocateIntermediateBuffers
{
  [(ADJasperColorStillsExecutor *)self deallocateEspressoBuffers];
  v3 = [(ADJasperColorStillsPipeline *)self->_pipeline inferenceDescriptor];
  v4 = [v3 colorInput];
  v5 = [v4 imageDescriptor];

  [v5 sizeForLayout:self->super._layout];
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", [v5 pixelFormat], &self->_itmPreProcessedColor, v6, v7);
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    espressoRunner = self->super._espressoRunner;
    objc_super v10 = [(ADJasperColorStillsPipeline *)self->_pipeline inferenceDescriptor];
    v11 = [v10 colorInput];
    int64_t v12 = [(ADEspressoRunner *)espressoRunner registerPixelBuffer:itmPreProcessedColor forDescriptor:v11];

    if (v12)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __int16 v48 = 0;
        v13 = &_os_log_internal;
        id v14 = "Failed binding _itmPreProcessedColor for _espressoExecutor";
        v15 = (uint8_t *)&v48;
LABEL_9:
        _os_log_error_impl(&dword_215F16000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
      }
    }
    else
    {
      correctionBackendEspressoRunner = self->_correctionBackendEspressoRunner;
      int64_t v17 = self->_itmPreProcessedColor;
      double v18 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionBackendInferenceDescriptor];
      id v19 = [v18 colorInput];
      int64_t v12 = [(ADEspressoRunner *)correctionBackendEspressoRunner registerPixelBuffer:v17 forDescriptor:v19];

      if (v12)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          __int16 v47 = 0;
          v13 = &_os_log_internal;
          id v14 = "Failed binding _itmPreProcessedColor for _correctionBackendEspressoExecutor";
          v15 = (uint8_t *)&v47;
          goto LABEL_9;
        }
      }
      else
      {
        v20 = self->super._espressoRunner;
        v21 = [(ADJasperColorStillsPipeline *)self->_pipeline inferenceDescriptor];
        uint64_t v22 = [v21 jasperInput];
        self->_itmPreProcessedJasper = (__CVBuffer *)[(ADEspressoRunner *)v20 createAndRegisterPixelBufferForDescriptor:v22];

        id v23 = self->super._espressoRunner;
        v24 = [(ADJasperColorStillsPipeline *)self->_pipeline inferenceDescriptor];
        id v25 = [v24 depthOutput];
        self->_itmUnprocessedDepth = (__CVBuffer *)[(ADEspressoRunner *)v23 createAndRegisterPixelBufferForDescriptor:v25];

        unsigned int v26 = self->_correctionBackendEspressoRunner;
        uint64_t v27 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionBackendInferenceDescriptor];
        uint64_t v28 = [v27 jasperInput];
        self->_itmPreProcessedJasperForCorrection = (__CVBuffer *)[(ADEspressoRunner *)v26 createAndRegisterPixelBufferForDescriptor:v28];

        uint64_t v29 = self->_correctionBackendEspressoRunner;
        v30 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionBackendInferenceDescriptor];
        BOOL v31 = [v30 featuresOutput];
        int v32 = [(ADEspressoRunner *)v29 registerDescriptor:v31];
        calibFeaturesOutputBuffer = self->_calibFeaturesOutputBuffer;
        self->_calibFeaturesOutputBuffer = v32;

        self->_calibFeaturesOutput = (float *)[(ADEspressoBufferHandle *)self->_calibFeaturesOutputBuffer data];
        correctionFrontendEspressoRunner = self->_correctionFrontendEspressoRunner;
        v35 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionFrontendInferenceDescriptor];
        int v36 = [v35 featuresInput];
        uint64_t v37 = [(ADEspressoRunner *)correctionFrontendEspressoRunner registerDescriptor:v36];
        self->_calibFeaturesInput = (float *)[v37 data];

        uint64_t v38 = self->_correctionFrontendEspressoRunner;
        int v39 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionFrontendInferenceDescriptor];
        v40 = [v39 anglesOutput];
        v41 = [(ADEspressoRunner *)v38 registerDescriptor:v40];
        self->_calibAnglesOutput = (float *)[v41 data];

        double v42 = self->_correctionFrontendEspressoRunner;
        double v43 = [(ADJasperColorStillsPipeline *)self->_pipeline correctionFrontendInferenceDescriptor];
        double v44 = [v43 errorsOutput];
        double v45 = [(ADEspressoRunner *)v42 registerDescriptor:v44];
        self->_calibErrorsOutput = (float *)[v45 data];

        if (self->_itmPreProcessedJasper && self->_itmUnprocessedDepth && self->_itmPreProcessedJasperForCorrection)
        {
          int64_t v12 = 0;
        }
        else
        {
          [(ADJasperColorStillsExecutor *)self deallocateEspressoBuffers];
          int64_t v12 = -22971;
        }
      }
    }
  }
  else
  {
    int64_t v12 = -22965;
  }

  return v12;
}

- (void)deallocateEspressoBuffers
{
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasperForCorrection);
  self->_itmPreProcessedJasperForCorrection = 0;
}

- (ADJasperColorStillsExecutor)initWithParameters:(id)a3
{
  id v5 = a3;
  int v18 = 335679544;
  long long v19 = 0u;
  long long v20 = 0u;
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)ADJasperColorStillsExecutor;
  double v6 = [(ADExecutor *)&v17 init];
  if (!v6) {
    goto LABEL_6;
  }
  if (!v5
    || ([v5 pipelineParameters], double v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to initialize jasperColorStills executor: bad executorParameters input", v16, 2u);
    }
    goto LABEL_10;
  }
  v8 = [v5 pipelineParameters];
  v9 = [[ADJasperColorStillsPipeline alloc] initWithParameters:v8];
  pipeline = v6->_pipeline;
  v6->_pipeline = v9;

  if (!v6->_pipeline)
  {

LABEL_10:
    id v14 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_executorParameters, a3);
  v6->_itmCroppedScaledColor = 0;
  v6->_itmRotatedColor = 0;
  v6->_itmPreProcessedColor = 0;
  v6->_itmPreProcessedJasper = 0;
  v6->_itmPreProcessedJasperForCorrection = 0;
  v6->_itmUnprocessedDepth = 0;
  v6->_itmUnscaledProcessedDepth = 0;
  v6->_isPrepared = 0;
  correctionBackendEspressoRunner = v6->_correctionBackendEspressoRunner;
  v6->_correctionBackendEspressoRunner = 0;

  correctionFrontendEspressoRunner = v6->_correctionFrontendEspressoRunner;
  v6->_correctionFrontendEspressoRunner = 0;

  v6->_calibFeaturesOutput = 0;
  v6->_calibFeaturesInput = 0;
  v6->_calibAnglesOutput = 0;
  v6->_calibErrorsOutput = 0;
  correctionLogString = v6->_correctionLogString;
  v6->_correctionLogString = 0;

LABEL_6:
  id v14 = v6;
LABEL_11:
  kdebug_trace();

  return v14;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [[ADJasperColorStillsExecutorParameters alloc] initForDevice:v4];
  double v6 = [(ADJasperColorStillsExecutor *)self initWithParameters:v5];

  return v6;
}

- (ADJasperColorStillsExecutor)init
{
  v3 = objc_opt_new();
  id v4 = [(ADJasperColorStillsExecutor *)self initWithParameters:v3];

  return v4;
}

@end