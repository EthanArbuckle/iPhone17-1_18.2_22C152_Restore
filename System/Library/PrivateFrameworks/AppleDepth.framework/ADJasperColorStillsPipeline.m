@interface ADJasperColorStillsPipeline
- (ADJasperColorStillsPipeline)init;
- (ADJasperColorStillsPipeline)initWithParameters:(id)a3;
- (ADJasperColorStillsPipelineParameters)pipelineParameters;
- (id)correctionBackendInferenceDescriptor;
- (id)correctionFrontendInferenceDescriptor;
- (id)inferenceDescriptor;
- (id)processedDepthOutputDescriptor;
- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 depthUnits:(unint64_t)a5;
- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4;
- (int64_t)processJasperToColorCorrectionIntermediateResultWithBackendEspressoFeaturesOutput:(const float *)a3 frontendEspressoFeaturesInput:(float *)a4 featuresDimensions:(id)a5;
- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6;
- (int64_t)projectJasperPointsForJasperToColorTransformCorrection:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6;
- (uint64_t)postProcessJasperToColorCorrectionWithAngles:(__n128)a3 errors:(__n128)a4 originalTransform:(__n128)a5 correctedTransform:(float)a6 colorCameraCalibration:(uint64_t)a7 colorImageScale:(double *)a8 transformCorrectionResults:(double *)a9;
- (uint64_t)postProcessJasperToColorTransformCorrection:(float32x4_t)a3 originalTransform:(float32x4_t)a4 correctedTransform:(__n128)a5;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADJasperColorStillsPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_correctionFrontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_correctionBackendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_correctionFrontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_correctionBackendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADJasperColorStillsPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (uint64_t)postProcessJasperToColorCorrectionWithAngles:(__n128)a3 errors:(__n128)a4 originalTransform:(__n128)a5 correctedTransform:(float)a6 colorCameraCalibration:(uint64_t)a7 colorImageScale:(double *)a8 transformCorrectionResults:(double *)a9
{
  id v18 = a11;
  kdebug_trace();
  uint64_t v19 = -22953;
  if (a8 && a9)
  {
    [v18 intrinsicMatrix];
    a1[24] = 500.0 / (float)(a6 * v20);
    v21 = objc_opt_new();
    [v21 setRotation:*a8];
    [v21 setStd:*a9];
    if (a12) {
      *a12 = v21;
    }
    uint64_t v19 = objc_msgSend(a1, "postProcessJasperToColorTransformCorrection:originalTransform:correctedTransform:", v21, a10, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
  }
  kdebug_trace();

  return v19;
}

- (int64_t)processJasperToColorCorrectionIntermediateResultWithBackendEspressoFeaturesOutput:(const float *)a3 frontendEspressoFeaturesInput:(float *)a4 featuresDimensions:(id)a5
{
  id v7 = a5;
  if ([v7 count])
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    unsigned int v9 = [v8 unsignedIntValue];
  }
  else
  {
    unsigned int v9 = 1;
  }
  if ((unint64_t)[v7 count] < 2)
  {
    int v11 = 1;
  }
  else
  {
    v10 = [v7 objectAtIndexedSubscript:1];
    int v11 = [v10 unsignedIntValue];
  }
  if ((unint64_t)[v7 count] < 3) {
    goto LABEL_10;
  }
  v12 = [v7 objectAtIndexedSubscript:2];
  int v13 = [v12 unsignedIntValue];

  if (v13)
  {
    if (v13 == 1)
    {
LABEL_10:
      memcpy(a4, a3, 4 * v11 * v9);
      goto LABEL_11;
    }
    if (v11 && v9)
    {
      int v15 = v11 * v9;
      if (v9 > 0xF)
      {
        int v24 = 0;
        for (int i = 0; i != v13; ++i)
        {
          int v26 = 0;
          uint64_t v27 = 0;
          int v28 = v24;
          int v29 = i;
          do
          {
            uint64_t v30 = v9;
            int v31 = i + v13 * v26;
            int v32 = v28;
            do
            {
              a4[v31] = a3[v32];
              v31 += v13;
              ++v32;
              --v30;
            }
            while (v30);
            ++v27;
            v29 += v9;
            v28 += v9;
            v26 += v9;
          }
          while (v27 != v11);
          v24 += v15;
        }
      }
      else
      {
        int v16 = 0;
        for (int j = 0; j != v13; ++j)
        {
          int v18 = 0;
          int v19 = v16;
          int v20 = j;
          do
          {
            int v21 = v19;
            int v22 = v20;
            uint64_t v23 = v9;
            do
            {
              a4[v22] = a3[v21];
              v22 += v13;
              ++v21;
              --v23;
            }
            while (v23);
            ++v18;
            v20 += v9 * v13;
            v19 += v9;
          }
          while (v18 != v11);
          v16 += v15;
        }
      }
    }
  }
LABEL_11:

  return 0;
}

- (uint64_t)postProcessJasperToColorTransformCorrection:(float32x4_t)a3 originalTransform:(float32x4_t)a4 correctedTransform:(__n128)a5
{
  id v10 = a7;
  int v11 = v10;
  if (v10)
  {
    [v10 std];
    float32x4_t v13 = vmulq_f32(v12, a1[5]);
    if ((float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0]/ 3.0) <= a1[6].f32[1])
    {
      [v11 rotation];
      +[ADUtils calcRotationMatrix:*(double *)vmulq_n_f32(v18, a1[6].f32[0]).i64];
      float32x4_t v16 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a2.f32[0]), v20, *(float32x2_t *)a2.f32, 1), v21, a2, 2);
      float32x4_t v15 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a3.f32[0]), v20, *(float32x2_t *)a3.f32, 1), v21, a3, 2);
      float32x4_t v14 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a4.f32[0]), v20, *(float32x2_t *)a4.f32, 1), v21, a4, 2);
    }
    else
    {
      float32x4_t v15 = a3;
      float32x4_t v14 = a4;
      float32x4_t v16 = a2;
    }
    uint64_t v17 = 0;
    *(float32x4_t *)a8 = v16;
    *(float32x4_t *)(a8 + 16) = v15;
    *(float32x4_t *)(a8 + 32) = v14;
    *(__n128 *)(a8 + 48) = a5;
  }
  else
  {
    uint64_t v17 = -22953;
  }

  return v17;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 depthUnits:(unint64_t)a5
{
  kdebug_trace();
  int64_t v7 = +[ADUtils postProcessDepth:a3 depthOutput:a4];
  kdebug_trace();
  return v7;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  kdebug_trace();
  int64_t v6 = +[ADUtils postProcessDepth:a3 depthOutput:a4];
  kdebug_trace();
  return v6;
}

- (int64_t)projectJasperPointsForJasperToColorTransformCorrection:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  kdebug_trace();
  float32x4_t v14 = [(ADJasperColorStillsPipelineParameters *)self->_pipelineParameters pointCloudFilterForTransformCorrection];
  int64_t v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  kdebug_trace();
  float32x4_t v14 = [(ADJasperColorStillsPipelineParameters *)self->_pipelineParameters pointCloudFilter];
  int64_t v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (id)correctionFrontendInferenceDescriptor
{
  return self->_correctionFrontendInferenceDesc;
}

- (id)correctionBackendInferenceDescriptor
{
  return self->_correctionBackendInferenceDesc;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADJasperColorStillsPipeline)initWithParameters:(id)a3
{
  id v4 = a3;
  int v31 = 335684784;
  long long v32 = 0u;
  long long v33 = 0u;
  kdebug_trace();
  v30.receiver = self;
  v30.super_class = (Class)ADJasperColorStillsPipeline;
  v5 = [(ADJasperColorStillsPipeline *)&v30 init];
  if (v5)
  {
    if (!v4) {
      id v4 = (id)objc_opt_new();
    }
    objc_storeStrong((id *)&v5->_pipelineParameters, v4);
    v5->_STDThreshold = 6.0;
    *(_OWORD *)v5->_STDWeights = xmmword_215FC46B0;
    int64_t v6 = [(ADPipelineParameters *)v5->_pipelineParameters deviceName];
    unint64_t v7 = +[ADDeviceConfiguration getLidarType:v6];

    if (v7 == 2)
    {
      v5->_STDThreshold = 10.0;
      v8 = @"SIPNetFrontend";
      unsigned int v9 = @"SIPNetBackend";
      id v10 = @"NMPPeridot";
    }
    else
    {
      v8 = @"SIJNetFrontend";
      unsigned int v9 = @"SIJNetBackend";
      id v10 = @"NMP";
    }
    uint64_t v11 = +[ADNetworkProvider providerForNetwork:v10];
    networkProvider = v5->_networkProvider;
    v5->_networkProvider = (ADNetworkProvider *)v11;

    uint64_t v13 = +[ADNetworkProvider providerForNetwork:v9];
    correctionBackendNetworkProvider = v5->_correctionBackendNetworkProvider;
    v5->_correctionBackendNetworkProvider = (ADNetworkProvider *)v13;

    uint64_t v15 = +[ADNetworkProvider providerForNetwork:v8];
    correctionFrontendNetworkProvider = v5->_correctionFrontendNetworkProvider;
    v5->_correctionFrontendNetworkProvider = (ADNetworkProvider *)v15;

    if (!v5->_networkProvider)
    {
      int v28 = 0;
      goto LABEL_11;
    }
    uint64_t v17 = [[ADEspressoStillImageInferenceDescriptor alloc] initWithNetworkProvider:v5->_networkProvider];
    inferenceDesc = v5->_inferenceDesc;
    v5->_inferenceDesc = v17;

    float32x4_t v19 = [[ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor alloc] initWithNetworkProvider:v5->_correctionBackendNetworkProvider];
    correctionBackendInferenceDesc = v5->_correctionBackendInferenceDesc;
    v5->_correctionBackendInferenceDesc = v19;

    float32x4_t v21 = [[ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor alloc] initWithNetworkProvider:v5->_correctionFrontendNetworkProvider];
    correctionFrontendInferenceDesc = v5->_correctionFrontendInferenceDesc;
    v5->_correctionFrontendInferenceDesc = v21;

    uint64_t v23 = [(ADNetworkProvider *)v5->_networkProvider bufferNameForInputType:kADEspressoBufferIDDisparity];
    v5->_isDisparitdouble y = v23 != 0;

    int v24 = [(ADEspressoStillImageInferenceDescriptor *)v5->_inferenceDesc depthOutput];
    v25 = [v24 imageDescriptor];
    uint64_t v26 = [v25 cloneWithDifferentFormat:1717856627];
    processedDepthDesc = v5->_processedDepthDesc;
    v5->_processedDepthDesc = (ADImageDescriptor *)v26;
  }
  int v28 = v5;
LABEL_11:
  kdebug_trace();

  return v28;
}

- (ADJasperColorStillsPipeline)init
{
  v3 = objc_opt_new();
  id v4 = [(ADJasperColorStillsPipeline *)self initWithParameters:v3];

  return v4;
}

@end