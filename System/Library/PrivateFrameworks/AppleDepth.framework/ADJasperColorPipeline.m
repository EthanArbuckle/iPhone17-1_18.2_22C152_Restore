@interface ADJasperColorPipeline
- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3;
- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4;
- (ADJasperColorPipelineParameters)pipelineParameters;
- (id)LKTTexturesDescriptor;
- (id)inferenceDescriptor;
- (id)processedConfidenceOutputDescriptor;
- (id)processedDepthOutputDescriptor;
- (id)processedNormalsOutputDescriptor;
- (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12;
- (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5;
- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4;
- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 depthOutput:(__CVBuffer *)a5 confidenceOutput:(__CVBuffer *)a6;
- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRequiredRotation:(int64_t)a9;
- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6;
- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 depthOutput:(__CVBuffer *)a9 normalsOutput:(__CVBuffer *)a10;
- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 opticalFlow:(__CVBuffer *)a5 alphaMap:(__CVBuffer *)a6 depthOutput:(__CVBuffer *)a7;
- (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9;
- (uint64_t)warpPreviousDepth:(double)a3 intoCurrentDepth:(double)a4 previousConfidence:(double)a5 intoCurrentConfidence:(uint64_t)a6 previousNormals:(uint64_t)a7 intoCurrentNormals:(uint64_t)a8 usingPoseDelta:(uint64_t)a9 previousCalibration:(uint64_t)a10 currentCalibration:(uint64_t)a11;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADJasperColorPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_depthReprojector, 0);
  objc_storeStrong((id *)&self->_processedNormalsDesc, 0);
  objc_storeStrong((id *)&self->_processedConfDesc, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (uint64_t)warpPreviousDepth:(double)a3 intoCurrentDepth:(double)a4 previousConfidence:(double)a5 intoCurrentConfidence:(uint64_t)a6 previousNormals:(uint64_t)a7 intoCurrentNormals:(uint64_t)a8 usingPoseDelta:(uint64_t)a9 previousCalibration:(uint64_t)a10 currentCalibration:(uint64_t)a11
{
  id v21 = a13;
  id v22 = a14;
  kdebug_trace();
  uint64_t v23 = objc_msgSend(*(id *)(a1 + 56), "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:", a7, v21, v22, a8, a2, a3, a4, a5);
  if (!v23
    && (!a9 || !a10 || (uint64_t v23 = [*(id *)(a1 + 56) warpImage:a9 intoImage:a10]) == 0)
    && (!a10 || !a11 || (uint64_t v23 = [*(id *)(a1 + 56) warpImage:a11 intoImage:a12]) == 0))
  {
    uint64_t v23 = 0;
  }
  kdebug_trace();

  return v23;
}

- (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12
{
  LODWORD(v25) = 335680196;
  kdebug_trace();
  [(ADJasperColorPipelineParameters *)self->_pipelineParameters defaultAlphaForDepthWarping];
  int v20 = v19;
  unint64_t v21 = [(ADJasperColorPipelineParameters *)self->_pipelineParameters confidenceUnits];
  LODWORD(v22) = v20;
  int64_t v23 = +[ADUtils fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:defaultAlpha:confidenceUnits:](ADUtils, "fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:defaultAlpha:confidenceUnits:", a3, a4, a5, a6, a7, a8, v22, a9, a10, a11, a12, v21, v25, 0, 0, 0,
          0);
  kdebug_trace();
  return v23;
}

- (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9
{
  LODWORD(v17) = 335680196;
  kdebug_trace();
  int64_t v15 = +[ADUtils warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingOpticalFlow:](ADUtils, "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingOpticalFlow:", a3, a4, a5, a6, a7, a8, a9, v17, 0, 0, 0, 0);
  kdebug_trace();
  return v15;
}

- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 depthOutput:(__CVBuffer *)a9 normalsOutput:(__CVBuffer *)a10
{
  kdebug_trace();
  [(ADJasperColorPipelineParameters *)self->_pipelineParameters defaultAlphaForDepthWarping];
  int64_t v17 = +[ADUtils warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:](ADUtils, "warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:", a3, a4, a5, a6, a7, a8, a9, a10);
  kdebug_trace();
  return v17;
}

- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 opticalFlow:(__CVBuffer *)a5 alphaMap:(__CVBuffer *)a6 depthOutput:(__CVBuffer *)a7
{
  kdebug_trace();
  [(ADJasperColorPipelineParameters *)self->_pipelineParameters defaultAlphaForDepthWarping];
  int64_t v13 = +[ADUtils warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:](ADUtils, "warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:", a3, a4, 0, 0, a5, a6, a7, 0);
  kdebug_trace();
  return v13;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRequiredRotation:(int64_t)a9
{
  kdebug_trace();
  unint64_t v16 = [(ADJasperColorPipelineParameters *)self->_pipelineParameters confidenceUnits];
  int64_t v17 = [(ADJasperColorPipelineParameters *)self->_pipelineParameters confidenceLevelRanges];
  int64_t v18 = +[ADUtils postProcessWithDepth:a3 confidence:a4 normals:a5 depthOutput:a6 confidenceOutput:a7 normalsOutput:a8 normalsRotation:a9 rawConfidenceUnits:3 outConfidenceUnits:v16 confidenceLevelRanges:v17];

  kdebug_trace();
  return v18;
}

- (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  kdebug_trace();
  v9 = [(ADJasperColorPipelineParameters *)self->_pipelineParameters confidenceLevelRanges];
  int64_t v10 = +[ADUtils postProcessConfidence:a3 confidenceOutput:a4 rawConfidenceUnits:3 outConfidenceUnits:a5 confidenceLevelRanges:v9];

  kdebug_trace();
  return v10;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  kdebug_trace();
  int64_t v6 = +[ADUtils postProcessDepth:a3 depthOutput:a4];
  kdebug_trace();
  return v6;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 depthOutput:(__CVBuffer *)a5 confidenceOutput:(__CVBuffer *)a6
{
  return [(ADJasperColorPipeline *)self postProcessWithDepth:a3 confidence:a4 normals:0 depthOutput:a5 confidenceOutput:a6 normalsOutput:0 normalsRequiredRotation:0];
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  kdebug_trace();
  v14 = [(ADJasperColorPipelineParameters *)self->_pipelineParameters pointCloudFilter];
  int64_t v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (id)processedNormalsOutputDescriptor
{
  return self->_processedNormalsDesc;
}

- (id)processedConfidenceOutputDescriptor
{
  return self->_processedConfDesc;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (id)LKTTexturesDescriptor
{
  +[ADLKTOpticalFlow defaultConfig];
  int64_t prioritization = self->_prioritization;
  uint64_t v4 = 5;
  if (prioritization != 2) {
    uint64_t v4 = 6;
  }
  if (prioritization == 1 || prioritization == 4) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = v4;
  }
  uint64_t v18 = v6;
  v7 = [ADLKTTexturesDescriptor alloc];
  networkProvider = self->_networkProvider;
  v9 = [(ADNetworkProvider *)networkProvider bufferNameForOutputType:kADEspressoBufferIDDepth];
  int64_t v10 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDesc depthOutput];
  v11 = [v10 imageDescriptor];
  v12 = -[ADNetworkProvider supportedSizesForOutput:expectedPixelFormat:](networkProvider, "supportedSizesForOutput:expectedPixelFormat:", v9, [v11 pixelFormat]);
  v15[0] = v18;
  id v13 = v19;
  v15[1] = v13;
  long long v16 = v20;
  uint64_t v17 = v21;
  if (v7) {
    v7 = [(ADLKTTexturesDescriptor *)v7 initForSupportedSizes:v12 config:v15];
  }
  else {

  }
  return v7;
}

- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  id v7 = a4;
  int v62 = 335682780;
  int64_t v63 = a3;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  kdebug_trace();
  v61.receiver = self;
  v61.super_class = (Class)ADJasperColorPipeline;
  v8 = [(ADJasperColorPipeline *)&v61 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t prioritization = a3;
    p_pipelineParameters = (id *)&v8->_pipelineParameters;
    objc_storeStrong((id *)&v8->_pipelineParameters, a4);
    int64_t prioritization = v9->_prioritization;
    if (prioritization != 1 && prioritization != 4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        __int16 v60 = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADJasperColorPipeline only supports speed prioritization", (uint8_t *)&v60, 2u);
      }
LABEL_23:
      v57 = 0;
      goto LABEL_24;
    }
    id v13 = [*p_pipelineParameters deviceName];
    unint64_t v14 = +[ADDeviceConfiguration getLidarType:v13];

    if (v14 == 2) {
      int64_t v15 = @"DARP";
    }
    else {
      int64_t v15 = @"DSD";
    }
    uint64_t v16 = +[ADNetworkProvider providerForNetwork:v15];
    networkProvider = v9->_networkProvider;
    v9->_networkProvider = (ADNetworkProvider *)v16;

    if (!v9->_networkProvider) {
      goto LABEL_23;
    }
    uint64_t v18 = [*p_pipelineParameters confidenceLevelRanges];

    if (!v18)
    {
      id v19 = [(ADNetworkProvider *)v9->_networkProvider confidenceLevelRanges];
      [*p_pipelineParameters setConfidenceLevelRanges:v19];
    }
    [*p_pipelineParameters confidenceBucketingLowThreshold];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 v60 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "pipelinePrameters.confidenceBucketingLowThreshold is deprecated. please use confidenceLevelRanges instead", (uint8_t *)&v60, 2u);
    }
    long long v20 = [*p_pipelineParameters confidenceLevelRanges];
    [v20 highLevel];
    int v22 = v21;

    [*p_pipelineParameters confidenceBucketingLowThreshold];
    int v24 = v23;
    uint64_t v25 = [*p_pipelineParameters confidenceLevelRanges];
    LODWORD(v26) = v24;
    LODWORD(v27) = v22;
    objc_msgSend(v25, "setHighLevel:", v26, v27);

    [*p_pipelineParameters confidenceBucketingHighThreshold];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 v60 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "pipelinePrameters.confidenceBucketingHighThreshold is deprecated. please use confidenceLevelRanges instead", (uint8_t *)&v60, 2u);
    }
    v28 = [*p_pipelineParameters confidenceLevelRanges];
    [v28 lowLevel];
    int v30 = v29;

    [*p_pipelineParameters confidenceBucketingHighThreshold];
    int v32 = v31;
    v33 = [*p_pipelineParameters confidenceLevelRanges];
    LODWORD(v34) = v30;
    LODWORD(v35) = v32;
    objc_msgSend(v33, "setLowLevel:", v34, v35);

    v36 = [*p_pipelineParameters confidenceLevelRanges];
    [v36 highLevel];
    objc_msgSend(*p_pipelineParameters, "setConfidenceBucketingLowThreshold:");

    v37 = [*p_pipelineParameters confidenceLevelRanges];
    [v37 lowLevel];
    LODWORD(v39) = v38;
    [*p_pipelineParameters setConfidenceBucketingHighThreshold:v39];

    v40 = [[ADEspressoJasperColorInferenceDescriptor alloc] initWithNetworkProvider:v9->_networkProvider];
    inferenceDesc = v9->_inferenceDesc;
    v9->_inferenceDesc = v40;

    v42 = [(ADEspressoJasperColorInferenceDescriptor *)v9->_inferenceDesc depthOutput];
    v43 = [v42 imageDescriptor];
    uint64_t v44 = [v43 cloneWithDifferentFormat:1717855600];
    processedDepthDesc = v9->_processedDepthDesc;
    v9->_processedDepthDesc = (ADImageDescriptor *)v44;

    v46 = [(ADEspressoJasperColorInferenceDescriptor *)v9->_inferenceDesc confidenceOutput];
    v47 = [v46 imageDescriptor];
    uint64_t v48 = [v47 cloneWithDifferentFormat:1278226534];
    processedConfDesc = v9->_processedConfDesc;
    v9->_processedConfDesc = (ADImageDescriptor *)v48;

    v50 = [(ADEspressoJasperColorInferenceDescriptor *)v9->_inferenceDesc normalsOutput];

    if (v50)
    {
      v51 = [(ADEspressoJasperColorInferenceDescriptor *)v9->_inferenceDesc normalsOutput];
      v52 = [v51 imageDescriptor];
      uint64_t v53 = [v52 cloneWithDifferentFormat:1380410945];
      processedNormalsDesc = v9->_processedNormalsDesc;
      v9->_processedNormalsDesc = (ADImageDescriptor *)v53;
    }
    uint64_t v55 = objc_opt_new();
    depthReprojector = v9->_depthReprojector;
    v9->_depthReprojector = (ADReprojection *)v55;
  }
  v57 = v9;
LABEL_24:
  kdebug_trace();

  return v57;
}

- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3
{
  v5 = objc_opt_new();
  uint64_t v6 = [(ADJasperColorPipeline *)self initWithInputPrioritization:a3 andParameters:v5];

  return v6;
}

@end