@interface ADDensifiedLiDARFocusAssistPipeline
- (ADDensifiedLiDARFocusAssistPipeline)init;
- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3;
- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3 andParameters:(id)a4;
- (ADDensifiedLiDARFocusAssistPipelineParameters)pipelineParameters;
- (id)inferenceDescriptor;
- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5;
- (int64_t)projectLidarPoints:(id)a3 crop:(CGRect)a4 projectedPointsBuffer:(__CVBuffer *)a5;
- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 lidarToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADDensifiedLiDARFocusAssistPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADDensifiedLiDARFocusAssistPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  kdebug_trace();
  int64_t v8 = +[ADUtils postProcessConfidence:a3 confidenceOutput:a4 rawConfidenceUnits:3 outConfidenceUnits:a5 confidenceLevelRanges:0];
  kdebug_trace();
  return v8;
}

- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 lidarToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6
{
  id v11 = a7;
  id v12 = a8;
  id v13 = a9;
  int v22 = 335683544;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  if (v11 && v13)
  {
    v14 = objc_msgSend(v11, "pointCloudByChangingPointOfViewByTransform:to:", v12, a1, a2, a3, a4);
    if (v14)
    {
      [v13 appendPointsFrom:v14];
      uint64_t v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed changing point cloud POV", buf, 2u);
      }
      uint64_t v15 = -22950;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Jasper inputs/outputs must not be nil", buf, 2u);
    }
    uint64_t v15 = -22953;
  }
  kdebug_trace();

  return v15;
}

- (int64_t)projectLidarPoints:(id)a3 crop:(CGRect)a4 projectedPointsBuffer:(__CVBuffer *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  int v18 = 335683544;
  long long v19 = 0u;
  long long v20 = 0u;
  kdebug_trace();
  if (a5)
  {
    if (v11)
    {
      v21.origin.double x = x;
      v21.origin.double y = y;
      v21.size.double width = width;
      v21.size.double height = height;
      if (!CGRectIsEmpty(v21))
      {
        uint64_t v15 = [(ADDensifiedLiDARFocusAssistPipelineParameters *)self->_pipelineParameters pointCloudFilter];
        int64_t v14 = objc_msgSend(v11, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v15, 0, a5, x, y, width, height);

        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        id v12 = &_os_log_internal;
        id v13 = "Must provide a valid crop rect";
LABEL_13:
        _os_log_error_impl(&dword_215F16000, v12, OS_LOG_TYPE_ERROR, v13, v17, 2u);
        int64_t v14 = -22953;
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      id v12 = &_os_log_internal;
      id v13 = "point cloud must not be nil";
      goto LABEL_13;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    id v12 = &_os_log_internal;
    id v13 = "Output buffer must not be nil";
    goto LABEL_13;
  }
  int64_t v14 = -22953;
LABEL_11:
  kdebug_trace();

  return v14;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3 andParameters:(id)a4
{
  id v7 = a4;
  int v16 = 335680992;
  long long v17 = 0u;
  long long v18 = 0u;
  kdebug_trace();
  v15.receiver = self;
  v15.super_class = (Class)ADDensifiedLiDARFocusAssistPipeline;
  int64_t v8 = [(ADDensifiedLiDARFocusAssistPipeline *)&v15 init];
  if (v8)
  {
    uint64_t v9 = +[ADNetworkProvider providerForNetwork:@"TeleAFNet" espressoEngine:a3];
    networkProvider = v8->_networkProvider;
    v8->_networkProvider = (ADNetworkProvider *)v9;

    if (!v8->_networkProvider)
    {
      id v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_pipelineParameters, a4);
    id v11 = [[ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor alloc] initWithNetworkProvider:v8->_networkProvider espressoEngine:a3];
    inferenceDesc = v8->_inferenceDesc;
    v8->_inferenceDesc = v11;
  }
  id v13 = v8;
LABEL_6:
  kdebug_trace();

  return v13;
}

- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(ADDensifiedLiDARFocusAssistPipeline *)self initWithEspressoEngine:a3 andParameters:v5];

  return v6;
}

- (ADDensifiedLiDARFocusAssistPipeline)init
{
  if ([MEMORY[0x263F28048] hasANE]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(ADDensifiedLiDARFocusAssistPipeline *)self initWithEspressoEngine:v3];
}

@end