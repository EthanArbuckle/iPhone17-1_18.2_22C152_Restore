@interface ADPearlColorInFieldCalibrationPipeline
+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4;
+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4;
+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5;
+ (BOOL)isPearlMaskExpectedFor:(int)a3;
+ (BOOL)isValidDepthAboveThreshold:(__CVBuffer *)a3 threshold:(float)a4 invalid:(unsigned __int16)a5 validDepthPercentage:(float *)a6;
+ (BOOL)isZUsedFor:(int)a3;
- (ADPearlColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4;
- (ADPearlColorInFieldCalibrationPipeline)init;
- (ADPearlColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4;
- (ADPearlColorInFieldCalibrationPipelineParameters)pipelineParameters;
- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4;
- (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4;
- (BOOL)isPearlMaskExpected;
- (BOOL)isZused;
- (__n128)pearlToColorCurrentTransform;
- (__n128)setPearlToColorCurrentTransform:(__n128)a3;
- (float)claculateWeightedStd:(ADPearlColorInFieldCalibrationPipeline *)self;
- (float)convertStdToWeight:(float)a3;
- (id)backendInferenceDescriptor;
- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3;
- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4;
- (id)frontendInferenceDescriptor;
- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrorY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 pearlColorInFieldCalibrationResult:(id)a10;
- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6;
- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5;
- (int64_t)undistortColorImage:(__CVBuffer *)a3 undistortedImage:(__CVBuffer *)a4 calibration:(id)a5;
- (uint64_t)isPearlFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5;
- (uint64_t)preProcessPearl:(double)a3 pose:(double)a4 prevPose:(double)a5 referenceCameraCalibration:(double)a6 pearlCameraCalibration:(double)a7 reprojectedPointsBuffer:(double)a8 reprojectedPointsMaskBuffer:(double)a9;
- (uint64_t)updateWmcamToMcamExtrinsics:(__n128)a3;
- (void)dealloc;
- (void)deallocMemory;
- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4;
- (void)setPipelineParameters:(id)a3;
- (void)updatePearlCamera:(id)a3;
@end

@implementation ADPearlColorInFieldCalibrationPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_pearlCalib, 0);
  objc_storeStrong((id *)&self->_colorCalib, 0);
  objc_storeStrong((id *)&self->_pearlReprojector, 0);
  objc_storeStrong((id *)&self->_controllerParameters, 0);
  objc_storeStrong((id *)&self->_frontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_backendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_frontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_backendNetworkProvider, 0);
}

- (__n128)setPearlToColorCurrentTransform:(__n128)a3
{
  result[245019] = a2;
  result[245020] = a3;
  result[245021] = a4;
  result[245022] = a5;
  return result;
}

- (__n128)pearlToColorCurrentTransform
{
  return a1[245019];
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADPearlColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BOOL)isZused
{
  return +[ADPearlColorInFieldCalibrationPipeline isZUsedFor:self->_networkFlowType];
}

- (BOOL)isPearlMaskExpected
{
  return +[ADPearlColorInFieldCalibrationPipeline isPearlMaskExpectedFor:self->_networkFlowType];
}

- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4
{
  v62[20] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v56 = a4;
  v58 = [v56 inFieldCalibrationTelemetryData];
  v57 = [v58 firedEventTimestampsArray];
  if ([v5 executed])
  {
    [v5 postRelative2FactoryX];
    float v7 = v6;
    [v5 postRelative2FactoryY];
    float v9 = v8;
    [v5 postRelative2FactoryZ];
    analyzeOneShotExtremeRotation(v7, v9, v10, &cfstr_ComAppleApplec.isa, v57);
  }
  v61[0] = @"MaxBackendRunTime";
  v11 = NSNumber;
  double v12 = (double)(unint64_t)[v58 maxBackendRunTime] / 1000.0;
  *(float *)&double v12 = v12;
  v55 = [v11 numberWithFloat:v12];
  v62[0] = v55;
  v61[1] = @"MinBackendRunTime";
  v13 = NSNumber;
  double v14 = (double)(unint64_t)[v58 minBackendRunTime] / 1000.0;
  *(float *)&double v14 = v14;
  v54 = [v13 numberWithFloat:v14];
  v62[1] = v54;
  v61[2] = @"TimeSincePrevRun";
  v15 = NSNumber;
  double v16 = (double)(unint64_t)[v58 timeSincePrevRun] / 1000.0;
  *(float *)&double v16 = v16;
  v53 = [v15 numberWithFloat:v16];
  v62[2] = v53;
  v61[3] = @"TotalBackendTime";
  v17 = NSNumber;
  double v18 = (double)(unint64_t)[v58 totalBackendTime] / 1000.0;
  *(float *)&double v18 = v18;
  v52 = [v17 numberWithFloat:v18];
  v62[3] = v52;
  v61[4] = @"TotalFrontEndTime";
  v19 = NSNumber;
  double v20 = (double)(unint64_t)[v58 frontEndTime] / 1000.0;
  *(float *)&double v20 = v20;
  v51 = [v19 numberWithFloat:v20];
  v62[4] = v51;
  v61[5] = @"TotalNumRuns";
  v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v58, "totalNumRuns"));
  v62[5] = v50;
  v61[6] = @"Confidence";
  v21 = NSNumber;
  [v5 confidence];
  v49 = objc_msgSend(v21, "numberWithFloat:");
  v62[6] = v49;
  v61[7] = @"FilteredRotXComparedToFactory";
  v22 = NSNumber;
  [v5 postRelative2FactoryX];
  v48 = objc_msgSend(v22, "numberWithFloat:");
  v62[7] = v48;
  v61[8] = @"FilteredRotXComparedToPrev";
  v23 = NSNumber;
  [v5 postRelative2PrevX];
  v47 = objc_msgSend(v23, "numberWithFloat:");
  v62[8] = v47;
  v61[9] = @"FilteredRotYComparedToFactory";
  v24 = NSNumber;
  [v5 postRelative2FactoryY];
  v46 = objc_msgSend(v24, "numberWithFloat:");
  v62[9] = v46;
  v61[10] = @"FilteredRotYComparedToPrev";
  v25 = NSNumber;
  [v5 postRelative2PrevY];
  v45 = objc_msgSend(v25, "numberWithFloat:");
  v62[10] = v45;
  v61[11] = @"FilteredRotZComparedToFactory";
  v26 = NSNumber;
  [v5 postRelative2FactoryZ];
  v44 = objc_msgSend(v26, "numberWithFloat:");
  v62[11] = v44;
  v61[12] = @"FilteredRotZComparedToPrev";
  v27 = NSNumber;
  [v5 postRelative2PrevZ];
  v28 = objc_msgSend(v27, "numberWithFloat:");
  v62[12] = v28;
  v61[13] = @"RotXComparedToFactory";
  v29 = NSNumber;
  [v5 preRelative2FactoryX];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  v62[13] = v30;
  v61[14] = @"RotXComparedToPrev";
  v31 = NSNumber;
  [v5 deltaRotationX];
  v32 = objc_msgSend(v31, "numberWithFloat:");
  v62[14] = v32;
  v61[15] = @"RotYComparedToFactory";
  v33 = NSNumber;
  [v5 preRelative2FactoryY];
  v34 = objc_msgSend(v33, "numberWithFloat:");
  v62[15] = v34;
  v61[16] = @"RotYComparedToPrev";
  v35 = NSNumber;
  [v5 deltaRotationY];
  v36 = objc_msgSend(v35, "numberWithFloat:");
  v62[16] = v36;
  v61[17] = @"RotZComparedToFactory";
  v37 = NSNumber;
  [v5 preRelative2FactoryZ];
  v38 = objc_msgSend(v37, "numberWithFloat:");
  v62[17] = v38;
  v61[18] = @"RotZComparedToPrev";
  v39 = NSNumber;
  [v5 deltaRotationZ];
  v40 = objc_msgSend(v39, "numberWithFloat:");
  v62[18] = v40;
  v61[19] = @"Succeeded";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "executed"));
  v62[19] = v41;
  v42 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:20];

  id v43 = v42;
  if (AnalyticsSendEventLazy())
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = @"com.apple.applecamerad.PearlToRGB";
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "pearl Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = @"com.apple.applecamerad.PearlToRGB";
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "pearl Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v60 = @"com.apple.applecamerad.PearlToRGB";
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "pearl Color In-Field calibration pipeline Telemetry event %{public}@ failed to fire", buf, 0xCu);
  }
}

id __79__ADPearlColorInFieldCalibrationPipeline_reportTelemetry_withInterSessionData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (float)convertStdToWeight:(float)a3
{
  return 1.0 / (a3 * a3);
}

- (float)claculateWeightedStd:(ADPearlColorInFieldCalibrationPipeline *)self
{
  int v17 = *(_DWORD *)&v2[8];
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffX];
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffY];
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffZ];
  _V1.S[2] = v17;
  __asm { FMLA            S9, S0, V1.S[2] }
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffX];
  float v12 = v11;
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffY];
  float v14 = v12 + v13;
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffZ];
  return _S9 / (float)(v14 + v15);
}

- (int64_t)undistortColorImage:(__CVBuffer *)a3 undistortedImage:(__CVBuffer *)a4 calibration:(id)a5
{
  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  unint64_t v9 = PixelBufferUtils::pixelSizeForPixelFormat(PixelFormatType, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(a3, 0);
  memset(&v62, 0, sizeof(v62));
  float v10 = (CGRect *)MEMORY[0x263F001A8];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &v62);
  memset(&v61, 0, sizeof(v61));
  PixelBufferUtils::asVImageBuffer(a4, *v10, &v61);
  vImagePixelCount height = v61.height;
  if (v61.height)
  {
    vImagePixelCount width = v61.width;
    if (v61.width)
    {
      vImagePixelCount v18 = 0;
      distortedImagePixels = self->_distortedImagePixels;
      size_t rowBytes = v62.rowBytes;
      float v21 = (float)(v62.width - 1);
      data = (char *)v62.data;
      float v23 = (float)(v62.height - 1);
      v24 = (char *)v61.data;
      size_t v25 = v61.rowBytes;
      p_y = &self->_distortedImagePixels[1].y;
      v27 = (char *)v61.data;
      vImagePixelCount v28 = v61.width;
      do
      {
        if (v28)
        {
          v29 = &v24[v25 * v18];
          if (v9)
          {
            vImagePixelCount v30 = 0;
            v31 = v27;
            do
            {
              p_x = &distortedImagePixels[v30 + v28 * v18].x;
              float v33 = *p_x + -0.5;
              BOOL v34 = v33 >= 0.0 && v33 < v21;
              if (v34 && ((float v35 = p_x[1] + -0.5, v35 >= 0.0) ? (v36 = v35 < v23) : (v36 = 0), v36))
              {
                unint64_t v37 = vcvtms_u32_f32(v33);
                unint64_t v38 = vcvtps_u32_f32(v33);
                unint64_t v39 = vcvtms_u32_f32(v35);
                unint64_t v40 = vcvtps_u32_f32(v35);
                if (v37 == v38) {
                  unint64_t v41 = v38 + 1;
                }
                else {
                  unint64_t v41 = v38;
                }
                if (v39 == v40) {
                  ++v40;
                }
                v42.f32[0] = (float)v41 - v33;
                v42.f32[1] = v33 - (float)v37;
                float v43 = (float)v40 - v35;
                v11.f32[0] = v35 - (float)v39;
                if ((v40 - v39) * (v41 - v37) == 1) {
                  float v44 = 1.0;
                }
                else {
                  float v44 = 0.0;
                }
                float32x2_t v11 = (float32x2_t)vdup_lane_s32((int32x2_t)v11, 0);
                size_t v45 = rowBytes * v39;
                size_t v46 = rowBytes * v40;
                v47 = &data[v41 * v9];
                v48 = &data[v9 * v37];
                v49 = v31;
                unint64_t v50 = v9;
                do
                {
                  LOBYTE(v12) = v48[v45];
                  v13.i8[0] = v48[v46];
                  v51.f32[0] = (float)LODWORD(v12);
                  LOBYTE(v14) = v47[v45];
                  float v14 = (float)LODWORD(v14);
                  LOBYTE(v15) = v47[v46];
                  v13.f32[0] = (float)v13.u32[0];
                  float v15 = (float)LODWORD(v15);
                  v51.f32[1] = v14;
                  v13.f32[1] = v15;
                  float v12 = vaddv_f32(vmul_f32(v42, vmla_f32(vmul_n_f32(v51, v43), v11, v13))) * v44;
                  *v49++ = (int)v12;
                  ++v47;
                  ++v48;
                  --v50;
                }
                while (v50);
              }
              else
              {
                *(_DWORD *)&v29[v30 * v9] = 0;
              }
              ++v30;
              v31 += v9;
              vImagePixelCount v28 = width;
            }
            while (v30 < width);
          }
          else
          {
            float v52 = distortedImagePixels[v28 * v18].x + -0.5;
            if (v52 < 0.0
              || v52 >= v21
              || ((float v53 = distortedImagePixels[v28 * v18].y + -0.5, v53 >= 0.0) ? (v54 = v53 < v23) : (v54 = 0), !v54))
            {
              *(_DWORD *)v29 = 0;
            }
            vImagePixelCount v28 = width;
            if (width < 2) {
              goto LABEL_5;
            }
            v55 = p_y;
            for (uint64_t i = 1; i != width; ++i)
            {
              float v57 = *(v55 - 1) + -0.5;
              if (v57 < 0.0 || v57 >= v21 || ((float v58 = *v55 + -0.5, v58 >= 0.0) ? (v59 = v58 < v23) : (v59 = 0), !v59)) {
                *(_DWORD *)v29 = 0;
              }
              v55 += 2;
            }
          }
          vImagePixelCount v28 = width;
        }
LABEL_5:
        ++v18;
        v27 += v25;
        p_y += 2 * width;
      }
      while (v18 < height);
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return 0;
}

- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrorY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 pearlColorInFieldCalibrationResult:(id)a10
{
  id v193 = a9;
  id v12 = a10;
  float32x2_t v13 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationXOutput];
  float v14 = [v13 imageDescriptor];
  unint64_t v15 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v14 pixelFormat], 0);

  double v16 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationYOutput];
  int v17 = [v16 imageDescriptor];
  unint64_t v18 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v17 pixelFormat], 0);

  v19 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationZOutput];

  if (v19)
  {
    double v20 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationZOutput];
    float v21 = [v20 imageDescriptor];
    unint64_t v198 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v21 pixelFormat], 0);
  }
  else
  {
    unint64_t v198 = 0;
  }
  v22 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorXOutput];
  float v23 = [v22 imageDescriptor];
  unint64_t v24 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v23 pixelFormat], 0);

  size_t v25 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorYOutput];
  v26 = [v25 imageDescriptor];
  unint64_t v27 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v26 pixelFormat], 0);

  vImagePixelCount v28 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorZOutput];

  if (v28)
  {
    v29 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorZOutput];
    vImagePixelCount v30 = [v29 imageDescriptor];
    unint64_t v31 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v30 pixelFormat], 0);
  }
  else
  {
    unint64_t v31 = 0;
  }
  [v12 setExecuted:0];
  int32x4_t v238 = 0u;
  int32x4_t v239 = 0u;
  int32x4_t v237 = 0u;
  [v193 pearlToColorRotationAngles];
  long long v191 = v32;
  +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
  float32x4_t v181 = v33;
  float32x4_t v183 = v34;
  float32x4_t v185 = v35;
  anon_3bd140 = self->_anon_3bd140;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v234 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v231 = 0u;
  int networkFlowType = self->_networkFlowType;
  if (networkFlowType == 2)
  {
    float32x4_t v178 = *(float32x4_t *)&self[1]._frontendNetworkProvider;
    float32x4_t v179 = *(float32x4_t *)&self[1].super.isa;
    float32x4_t v176 = *(float32x4_t *)self[1]._anon_30;
    float32x4_t v177 = *(float32x4_t *)&self[1]._frontendInferenceDesc;
    goto LABEL_11;
  }
  if (!networkFlowType)
  {
    int32x4_t v38 = *(int32x4_t *)&self->_anon_3bd140[16];
    int32x4_t v39 = *(int32x4_t *)&self->_anon_3bd140[32];
    float32x4_t v40 = (float32x4_t)vzip1q_s32(vzip1q_s32(*(int32x4_t *)anon_3bd140, v39), v38);
    float32x4_t v41 = (float32x4_t)vtrn2q_s32(*(int32x4_t *)anon_3bd140, v38);
    v41.i32[2] = HIDWORD(*(void *)&self->_anon_3bd140[32]);
    float32x4_t v42 = (float32x4_t)vzip1q_s32(vzip2q_s32(*(int32x4_t *)anon_3bd140, v39), vdupq_laneq_s32(v38, 2));
    float32x4_t v179 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)self->_anon_70)), v41, *(float32x2_t *)self->_anon_70, 1), v42, *(float32x4_t *)self->_anon_70, 2);
    float32x4_t v178 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)&self->_anon_70[16])), v41, *(float32x2_t *)&self->_anon_70[16], 1), v42, *(float32x4_t *)&self->_anon_70[16], 2);
    float32x4_t v177 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)&self->_anon_70[32])), v41, *(float32x2_t *)&self->_anon_70[32], 1), v42, *(float32x4_t *)&self->_anon_70[32], 2);
    float32x4_t v43 = vsubq_f32(*(float32x4_t *)&self->_anon_70[48], *(float32x4_t *)&self->_anon_3bd140[48]);
    float32x4_t v176 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, v43.f32[0]), v41, *(float32x2_t *)v43.f32, 1), v42, v43, 2);
LABEL_11:
    float32x4_t v173 = *(float32x4_t *)MEMORY[0x263EF89A0];
    float32x4_t v174 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 16);
    float32x4_t v175 = *(float32x4_t *)(MEMORY[0x263EF89A0] + 32);
    goto LABEL_13;
  }
  float32x4_t v178 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_215FC4660, COERCE_FLOAT(*(_OWORD *)&self[1]._frontendNetworkProvider)), (float32x4_t)xmmword_215FC4670, (float32x2_t)self[1]._frontendNetworkProvider, 1), (float32x4_t)xmmword_215FC45E0, *(float32x4_t *)&self[1]._frontendNetworkProvider, 2);
  float32x4_t v179 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_215FC4660, COERCE_FLOAT(*(_OWORD *)&self[1].super.isa)), (float32x4_t)xmmword_215FC4670, (float32x2_t)self[1].super.isa, 1), (float32x4_t)xmmword_215FC45E0, *(float32x4_t *)&self[1].super.isa, 2);
  float32x4_t v177 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_215FC4660, COERCE_FLOAT(*(_OWORD *)&self[1]._frontendInferenceDesc)), (float32x4_t)xmmword_215FC4670, (float32x2_t)self[1]._frontendInferenceDesc, 1), (float32x4_t)xmmword_215FC45E0, *(float32x4_t *)&self[1]._frontendInferenceDesc, 2);
  float32x4_t v175 = (float32x4_t)xmmword_215FC45E0;
  float32x4_t v176 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_215FC4660, COERCE_FLOAT(*(_OWORD *)self[1]._anon_30)), (float32x4_t)xmmword_215FC4670, *(float32x2_t *)self[1]._anon_30, 1), (float32x4_t)xmmword_215FC45E0, *(float32x4_t *)self[1]._anon_30, 2);
  float32x4_t v174 = (float32x4_t)xmmword_215FC4680;
  float32x4_t v173 = (float32x4_t)xmmword_215FC4690;
LABEL_13:
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters colorCameraNominalEfl];
  float v45 = v44 / self->_colorCameraEfl;
  if (v15 == 2)
  {
    _H1 = *(_WORD *)a3;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a3;
  }
  float v52 = v45 * _S1;
  if (v18 == 2)
  {
    _H1 = *(_WORD *)a4;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a4;
  }
  float v55 = v45 * _S1;
  if (v24 == 2)
  {
    _H3 = *(_WORD *)a6;
    __asm { FCVT            S3, H3 }
  }
  else
  {
    _S3 = *(_DWORD *)a6;
  }
  long long v58 = 0u;
  *(float *)&long long v58 = v52;
  if (v27 == 2)
  {
    _H2 = *(_WORD *)a7;
    __asm { FCVT            S2, H2 }
  }
  else
  {
    _S2 = *(_DWORD *)a7;
  }
  *((float *)&v58 + 1) = v55;
  long long v210 = v58;
  long long v61 = __PAIR64__(_S2, _S3);
  if (a5 && a8)
  {
    if (v198 == 2)
    {
      _H1 = *(_WORD *)a5;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(float *)a5;
    }
    float v64 = v45 * _S1;
    if (v31 == 2)
    {
      _H1 = *(_WORD *)a8;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(_DWORD *)a8;
    }
    long long v67 = v58;
    *((float *)&v67 + 2) = v64;
    long long v210 = v67;
    DWORD2(v61) = _S1;
  }
  long long v192 = v61;
  -[ADPearlColorInFieldCalibrationPipeline claculateWeightedStd:](self, "claculateWeightedStd:");
  float v69 = v68;
  [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters maxStdForValidResult];
  long long v202 = 0u;
  long long v204 = 0u;
  int8x16_t v207 = 0u;
  long long v194 = 0u;
  long long v199 = 0u;
  if (v69 > v70) {
    goto LABEL_47;
  }
  [(ADPearlColorInFieldCalibrationPipeline *)self convertStdToWeight:COERCE_DOUBLE((unint64_t)LODWORD(v69))];
  float v72 = v71;
  unsigned int v73 = self->_networkFlowType;
  if (v73 <= 1)
  {
    +[ADUtils addAnglesToRotation:angles:](ADUtils, "addAnglesToRotation:angles:", *(double *)v179.i64, *(double *)v178.i64, *(double *)v177.i64, *(double *)&v210);
    int32x4_t v74 = *(int32x4_t *)self->_anon_30;
    int32x4_t v75 = *(int32x4_t *)&self->_anon_30[16];
    int32x4_t v76 = *(int32x4_t *)&self->_anon_30[32];
    int32x4_t v77 = vzip2q_s32(v74, v76);
    float32x4_t v78 = (float32x4_t)vzip1q_s32(vzip1q_s32(v74, v76), v75);
    float32x4_t v79 = (float32x4_t)vtrn2q_s32(v74, v75);
    v79.i32[2] = HIDWORD(*(void *)&self->_anon_30[32]);
    float32x4_t v80 = (float32x4_t)vzip1q_s32(v77, vdupq_laneq_s32(v75, 2));
    float32x4_t v81 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(_OWORD *)anon_3bd140)), v79, *(float32x2_t *)anon_3bd140, 1), v80, *(float32x4_t *)anon_3bd140, 2);
    float32x4_t v82 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[16])), v79, *(float32x2_t *)&self->_anon_3bd140[16], 1), v80, *(float32x4_t *)&self->_anon_3bd140[16], 2);
    float32x4_t v83 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[32])), v79, *(float32x2_t *)&self->_anon_3bd140[32], 1), v80, *(float32x4_t *)&self->_anon_3bd140[32], 2);
    float32x4_t v84 = *(float32x4_t *)self->_anon_b0;
    float32x4_t v85 = *(float32x4_t *)&self->_anon_b0[16];
    float32x4_t v86 = *(float32x4_t *)&self->_anon_b0[32];
    float32x4_t v87 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, v81.f32[0]), v85, *(float32x2_t *)v81.f32, 1), v86, v81, 2);
    float32x4_t v88 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, v82.f32[0]), v85, *(float32x2_t *)v82.f32, 1), v86, v82, 2);
    float32x4_t v89 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, v83.f32[0]), v85, *(float32x2_t *)v83.f32, 1), v86, v83, 2);
    float32x4_t v91 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v90.f32[0]), v88, *(float32x2_t *)v90.f32, 1), v89, v90, 2);
    float32x4_t v93 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v92.f32[0]), v88, *(float32x2_t *)v92.f32, 1), v89, v92, 2);
    float32x4_t v195 = v87;
    float32x4_t v171 = v89;
    float32x4_t v172 = v88;
    float32x4_t v95 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v94.f32[0]), v88, *(float32x2_t *)v94.f32, 1), v89, v94, 2);
    v240.i32[2] = v91.i32[2];
    v241.i32[2] = v93.i32[2];
    v240.i64[0] = v91.i64[0];
    v241.i64[0] = v93.i64[0];
    v242.i32[2] = v95.i32[2];
    v242.i64[0] = v95.i64[0];
    +[ADUtils calcRotationAngle:&v240];
    long long v204 = v96;
    float32x4_t v97 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v240, v181.f32[0]), v241, v183.f32[0]), v242, v185.f32[0]);
    float32x4_t v98 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v240, *(float32x2_t *)v181.f32, 1), v241, *(float32x2_t *)v183.f32, 1), v242, *(float32x2_t *)v185.f32, 1);
    float32x4_t v99 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v240, v181, 2), v241, v183, 2), v242, v185, 2);
    DWORD2(v234) = v97.i32[2];
    DWORD2(v235) = v98.i32[2];
    *(void *)&long long v234 = v97.i64[0];
    *(void *)&long long v235 = v98.i64[0];
    DWORD2(v236) = v99.i32[2];
    *(void *)&long long v236 = v99.i64[0];
    +[ADUtils calcRotationAngle:&v234];
    v100.i64[0] = 0;
    v101.i64[0] = (uint64_t)a5;
    int8x16_t v102 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v101, v100).i64[0], 0);
    int8x16_t v104 = v103;
    v104.i32[2] = 0;
    int8x16_t v105 = vbslq_s8(v102, v104, v103);
    v105.i32[3] = v103.i32[3];
    int8x16_t v207 = v105;
    v106 = [v193 convertExtrinsicsAnglesToDict:*(double *)v105.i64];
    id v230 = 0;
    uint64_t v107 = [v193 insertEntryAndCalculate:v106 withWeight:&v230 toResult:v72];
    id v108 = v230;
    if (!v107)
    {
      [v193 convertDictToExtrinsicsAngles:v108];
      long long v202 = v109;
      +[ADUtils calcRotationMatrix:*(double *)&v109];
      float32x4_t v113 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v110, v181.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v181.f32, 1), v111), (float32x4_t)vdupq_laneq_s32((int32x4_t)v181, 2), v112);
      float32x4_t v114 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v110, v183.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v183.f32, 1), v111), (float32x4_t)vdupq_laneq_s32((int32x4_t)v183, 2), v112);
      float32x4_t v115 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v110, v185.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v185.f32, 1), v111), (float32x4_t)vdupq_laneq_s32((int32x4_t)v185, 2), v112);
      v237.i32[2] = v113.i32[2];
      v238.i32[2] = v114.i32[2];
      v237.i64[0] = v113.i64[0];
      v238.i64[0] = v114.i64[0];
      v239.i32[2] = v115.i32[2];
      v239.i64[0] = v115.i64[0];
      +[ADUtils calcRotationAngle:&v237];
      long long v199 = v116;
      objc_msgSend(v12, "setPearlToColorExtrinsics:", *(double *)v237.i64, *(double *)v238.i64, *(double *)v239.i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v195, v176.f32[0]), v172, *(float32x2_t *)v176.f32, 1), v171, v176, 2).i64);
      [v12 setExecuted:1];
      float32x4_t v117 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v195, v179.f32[0]), v172, *(float32x2_t *)v179.f32, 1), v171, v179, 2);
      float32x4_t v118 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v195, v178.f32[0]), v172, *(float32x2_t *)v178.f32, 1), v171, v178, 2);
      float32x4_t v119 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v195, v177.f32[0]), v172, *(float32x2_t *)v177.f32, 1), v171, v177, 2);
      float32x4_t v120 = (float32x4_t)vzip1q_s32(vzip1q_s32(v237, v239), v238);
      float32x4_t v121 = (float32x4_t)vtrn2q_s32(v237, v238);
      v121.i32[2] = v239.i32[1];
      float32x4_t v122 = (float32x4_t)vzip1q_s32(vzip2q_s32(v237, v239), vdupq_laneq_s32(v238, 2));
      float32x4_t v123 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v173.f32[0]), v121, *(float32x2_t *)v173.f32, 1), v122, v173, 2);
      float32x4_t v124 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v174.f32[0]), v121, *(float32x2_t *)v174.f32, 1), v122, v174, 2);
      float32x4_t v125 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v175.f32[0]), v121, *(float32x2_t *)v175.f32, 1), v122, v175, 2);
      float32x4_t v126 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v123, v117.f32[0]), v124, *(float32x2_t *)v117.f32, 1), v125, v117, 2);
      float32x4_t v127 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v123, v118.f32[0]), v124, *(float32x2_t *)v118.f32, 1), v125, v118, 2);
      float32x4_t v128 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v123, v119.f32[0]), v124, *(float32x2_t *)v119.f32, 1), v125, v119, 2);
      DWORD2(v231) = v126.i32[2];
      DWORD2(v232) = v127.i32[2];
      *(void *)&long long v231 = v126.i64[0];
      *(void *)&long long v232 = v127.i64[0];
      DWORD2(v233) = v128.i32[2];
      *(void *)&long long v233 = v128.i64[0];
      +[ADUtils calcRotationAngle:&v231];
      long long v194 = v129;
LABEL_46:

LABEL_47:
      [v12 setDeltaRotationX:*(double *)&v210];
      HIDWORD(v160) = DWORD1(v210);
      LODWORD(v160) = DWORD1(v210);
      [v12 setDeltaRotationY:v160];
      objc_msgSend(v12, "setDeltaRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v210), DWORD2(v210))));
      [v12 setStdX:*(double *)&v192];
      HIDWORD(v161) = DWORD1(v192);
      LODWORD(v161) = DWORD1(v192);
      [v12 setStdY:v161];
      objc_msgSend(v12, "setStdZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v192), DWORD2(v192))));
      [v12 setAbsoluteRotationX:*(double *)&v204];
      HIDWORD(v162) = DWORD1(v204);
      LODWORD(v162) = DWORD1(v204);
      [v12 setAbsoluteRotationY:v162];
      objc_msgSend(v12, "setAbsoluteRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v204), DWORD2(v204))));
      [v12 setFactoryRotationX:*(double *)&v191];
      HIDWORD(v163) = DWORD1(v191);
      LODWORD(v163) = DWORD1(v191);
      [v12 setFactoryRotationY:v163];
      objc_msgSend(v12, "setFactoryRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v191), DWORD2(v191))));
      [v12 setAbsoluteRotationPostISFX:*(double *)&v199];
      HIDWORD(v164) = DWORD1(v199);
      LODWORD(v164) = DWORD1(v199);
      [v12 setAbsoluteRotationPostISFY:v164];
      objc_msgSend(v12, "setAbsoluteRotationPostISFZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v199), DWORD2(v199))));
      *(float *)&double v165 = v69;
      [v12 setConfidence:v165];
      [v12 setPreRelative2FactoryX:*(double *)v207.i64];
      HIDWORD(v166) = v207.i32[1];
      LODWORD(v166) = v207.i32[1];
      [v12 setPreRelative2FactoryY:v166];
      objc_msgSend(v12, "setPreRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(v207.u32[1], v207.u32[2])));
      [v12 setPostRelative2FactoryX:*(double *)&v202];
      HIDWORD(v167) = DWORD1(v202);
      LODWORD(v167) = DWORD1(v202);
      [v12 setPostRelative2FactoryY:v167];
      objc_msgSend(v12, "setPostRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v202), DWORD2(v202))));
      [v12 setPostRelative2PrevX:*(double *)&v194];
      HIDWORD(v168) = DWORD1(v194);
      LODWORD(v168) = DWORD1(v194);
      [v12 setPostRelative2PrevY:v168];
      objc_msgSend(v12, "setPostRelative2PrevZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v194), DWORD2(v194))));
      [v12 setMotionRotation:*((double *)anon_3bd140 + 8)];
      [v12 setMotionTranslation:*((double *)anon_3bd140 + 10)];
      LODWORD(v169) = *((_DWORD *)anon_3bd140 + 24);
      [v12 setValidDepthPercentage:v169];
      int64_t v148 = 0;
      goto LABEL_48;
    }
LABEL_43:

    goto LABEL_44;
  }
  if (v73 == 2)
  {
    v130.columns[1] = (simd_float3)xmmword_215FC4620;
    v130.columns[0] = (simd_float3)xmmword_215FC4600;
LABEL_42:
    v130.columns[2] = (simd_float3)xmmword_215FC45E0;
    float32x4_t v205 = (float32x4_t)v130.columns[0];
    float32x4_t v208 = (float32x4_t)v130.columns[1];
    simd_float3x3 v243 = __invert_f3(v130);
    float32x4_t v189 = (float32x4_t)v243.columns[0];
    float32x4_t v196 = (float32x4_t)v243.columns[1];
    float32x4_t v200 = (float32x4_t)v243.columns[2];
    +[ADUtils calcRotationMatrix:*(double *)&v210];
    float32x4_t v131 = *(float32x4_t *)&self[1].super.isa;
    float32x4_t v132 = *(float32x4_t *)&self[1]._frontendNetworkProvider;
    float32x4_t v133 = *(float32x4_t *)&self[1]._frontendInferenceDesc;
    long long v180 = *(_OWORD *)self[1]._anon_30;
    float32x4_t v134 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v131, v205.f32[0]), v132, *(float32x2_t *)v205.f32, 1), v133, v205, 2);
    float32x4_t v135 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v131, v208.f32[0]), v132, *(float32x2_t *)v208.f32, 1), v133, v208, 2);
    float32x4_t v136 = vaddq_f32(v133, vmlaq_f32(vmulq_f32(v131, (float32x4_t)0), (float32x4_t)0, v132));
    float32x4_t v137 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v181, v205.f32[0]), v183, *(float32x2_t *)v205.f32, 1), v185, v205, 2);
    float32x4_t v138 = vaddq_f32(v185, vmlaq_f32(vmulq_f32(v181, (float32x4_t)0), (float32x4_t)0, v183));
    float32x4_t v142 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v139, v134.f32[0]), v140, *(float32x2_t *)v134.f32, 1), v141, v134, 2);
    float32x4_t v143 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v139, v135.f32[0]), v140, *(float32x2_t *)v135.f32, 1), v141, v135, 2);
    float32x4_t v144 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v139, v136.f32[0]), v140, *(float32x2_t *)v136.f32, 1), v141, v136, 2);
    v227.i32[2] = v142.i32[2];
    v228.i32[2] = v143.i32[2];
    v227.i64[0] = v142.i64[0];
    v228.i64[0] = v143.i64[0];
    v229.i32[2] = v144.i32[2];
    v229.i64[0] = v144.i64[0];
    float32x4_t v184 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v181, v208.f32[0]), v183, *(float32x2_t *)v208.f32, 1), v185, v208, 2);
    float32x4_t v186 = v137;
    v244.columns[0] = (simd_float3)v137;
    v244.columns[1] = (simd_float3)v184;
    float32x4_t v182 = v138;
    v244.columns[2] = (simd_float3)v138;
    simd_float3x3 v245 = __invert_f3(v244);
    float32x4_t v145 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[0].f32[0]), v228, *(float32x2_t *)v245.columns[0].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[0], 2);
    v245.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[1].f32[0]), v228, *(float32x2_t *)v245.columns[1].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[1], 2);
    v245.columns[1] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[2].f32[0]), v228, *(float32x2_t *)v245.columns[2].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[2], 2);
    __int32 v222 = v145.i32[2];
    __int32 v224 = v245.columns[0].i32[2];
    uint64_t v221 = v145.i64[0];
    uint64_t v223 = v245.columns[0].i64[0];
    __int32 v226 = v245.columns[1].i32[2];
    uint64_t v225 = v245.columns[1].i64[0];
    +[ADUtils calcRotationAngle:&v221];
    int8x16_t v207 = v146;
    v106 = objc_msgSend(v193, "convertExtrinsicsAnglesToDict:");
    id v220 = 0;
    uint64_t v147 = [v193 insertEntryAndCalculate:v106 withWeight:&v220 toResult:v72];
    id v108 = v220;
    if (!v147)
    {
      [v193 convertDictToExtrinsicsAngles:v108];
      long long v202 = v149;
      +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
      float32x4_t v153 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v150, v186.f32[0]), v151, *(float32x2_t *)v186.f32, 1), v152, v186, 2);
      float32x4_t v154 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v150, v184.f32[0]), v151, *(float32x2_t *)v184.f32, 1), v152, v184, 2);
      float32x4_t v155 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v150, v182.f32[0]), v151, *(float32x2_t *)v182.f32, 1), v152, v182, 2);
      v217.i32[2] = v153.i32[2];
      v218.i32[2] = v154.i32[2];
      v217.i64[0] = v153.i64[0];
      v218.i64[0] = v154.i64[0];
      v219.i32[2] = v155.i32[2];
      v219.i64[0] = v155.i64[0];
      objc_msgSend(v12, "setPearlToColorExtrinsics:", *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v189.f32[0]), v218, *(float32x2_t *)v189.f32, 1), v219, v189, 2).i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v196.f32[0]), v218, *(float32x2_t *)v196.f32, 1), v219, v196, 2).i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v200.f32[0]), v218, *(float32x2_t *)v200.f32, 1), v219, v200, 2).i64, *(double *)&v180);
      [v12 setExecuted:1];
      +[ADUtils calcRotationAngle:&v227];
      long long v204 = v156;
      +[ADUtils calcRotationAngle:&v217];
      long long v199 = v157;
      float32x4_t v187 = v217;
      float32x4_t v190 = v218;
      float32x4_t v197 = v219;
      v246.columns[0] = (simd_float3)v227;
      v246.columns[1] = (simd_float3)v228;
      v246.columns[2] = v229;
      simd_float3x3 v247 = __invert_f3(v246);
      float32x4_t v158 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v187, v247.columns[0].f32[0]), v190, *(float32x2_t *)v247.columns[0].f32, 1), v197, (float32x4_t)v247.columns[0], 2);
      v247.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v187, v247.columns[1].f32[0]), v190, *(float32x2_t *)v247.columns[1].f32, 1), v197, (float32x4_t)v247.columns[1], 2);
      v247.columns[1] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v187, v247.columns[2].f32[0]), v190, *(float32x2_t *)v247.columns[2].f32, 1), v197, (float32x4_t)v247.columns[2], 2);
      __int32 v212 = v158.i32[2];
      __int32 v214 = v247.columns[0].i32[2];
      uint64_t v211 = v158.i64[0];
      uint64_t v213 = v247.columns[0].i64[0];
      __int32 v216 = v247.columns[1].i32[2];
      uint64_t v215 = v247.columns[1].i64[0];
      +[ADUtils calcRotationAngle:&v211];
      long long v194 = v159;
      goto LABEL_46;
    }
    goto LABEL_43;
  }
  if (v73 == 3)
  {
    v130.columns[1] = (simd_float3)xmmword_215FC4630;
    v130.columns[0] = (simd_float3)xmmword_215FC4620;
    goto LABEL_42;
  }
LABEL_44:
  int64_t v148 = -22950;
LABEL_48:

  return v148;
}

- (ADPearlColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4
{
  unint64_t v9 = -[ADPearlColorInFieldCalibrationInterSessionData initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:]([ADPearlColorInFieldCalibrationInterSessionData alloc], "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:", *(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8, a9);
  return v9;
}

- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [ADPearlColorInFieldCalibrationInterSessionData alloc];
  float v6 = [(ADPipelineParameters *)self->_pipelineParameters deviceName];
  float v7 = [(ADPearlColorInFieldCalibrationInterSessionData *)v5 initWithDictionaryRepresentation:v4 andDeviceName:v6];

  return v7;
}

- (id)frontendInferenceDescriptor
{
  return self->_frontendInferenceDesc;
}

- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor *)self->_backendInferenceDesc featuresOutput];
  float v10 = [v9 imageDescriptor];
  unint64_t v11 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v10 pixelFormat], 0);

  id v12 = [(ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc featuresInput];
  float32x2_t v13 = [v12 imageDescriptor];
  unint64_t v14 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v13 pixelFormat], 0);

  if (v11 == 2 && v14 == 2)
  {
    unsigned int v15 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v16 = v8;
    unsigned int v17 = 0;
    unsigned int v18 = 1;
    while ([v16 count] > (unint64_t)v17)
    {
      double v20 = [v16 objectAtIndexedSubscript:v17];
      v18 *= [v20 intValue];

      ++v17;
    }
    if (!v18) {
      goto LABEL_123;
    }
    float v27 = (float)v15;
    if (v15)
    {
      uint64_t v28 = 0;
      uint64_t v29 = v15 & 0xFFFFFFF0;
      while (1)
      {
        float v35 = 0.0;
        if (v15 >= 0x10)
        {
          uint64_t v36 = 0;
          BOOL v41 = __CFADD__(v28, v15 - 1);
          if (v18 == 1 && !v41)
          {
            uint64_t v42 = 0;
            do
            {
              float32x4_t v43 = (float16x8_t *)((char *)a3 + 2 * (v28 + v42));
              float16x8_t v44 = v43[1];
              float32x4_t v45 = vcvt_hight_f32_f16(*v43);
              float32x4_t v46 = vcvtq_f32_f16(*(float16x4_t *)v43->i8);
              float32x4_t v47 = vcvt_hight_f32_f16(v44);
              float32x4_t v48 = vcvtq_f32_f16(*(float16x4_t *)v44.i8);
              float v35 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v35 + v46.f32[0]) + v46.f32[1]) + v46.f32[2]) + v46.f32[3]) + v45.f32[0])
                                                                                                  + v45.f32[1])
                                                                                          + v45.f32[2])
                                                                                  + v45.f32[3])
                                                                          + v48.f32[0])
                                                                  + v48.f32[1])
                                                          + v48.f32[2])
                                                  + v48.f32[3])
                                          + v47.f32[0])
                                  + v47.f32[1])
                          + v47.f32[2])
                  + v47.f32[3];
              v42 += 16;
            }
            while (v29 != v42);
            uint64_t v36 = v15 & 0xFFFFFFF0;
            if (v29 == v15) {
              goto LABEL_14;
            }
          }
        }
        else
        {
          uint64_t v36 = 0;
        }
        uint64_t v37 = v15 - v36;
        unsigned int v38 = v28 + v18 * v36;
        do
        {
          _H2 = *((_WORD *)a3 + v38);
          __asm { FCVT            S2, H2 }
          float v35 = v35 + _S2;
          v38 += v18;
          --v37;
        }
        while (v37);
LABEL_14:
        _S1 = v35 / v27;
        __asm { FCVT            H1, S1 }
        *((_WORD *)a4 + v28++) = LOWORD(_S1);
        if (v28 == v18) {
          goto LABEL_123;
        }
      }
    }
    *(float *)_D0.i32 = 0.0 / v27;
    __asm { FCVT            H0, S0 }
    if (v18 > 0xF)
    {
      uint64_t v90 = v18 & 0xFFFFFFF0;
      int16x8_t v102 = vdupq_lane_s16(_D0, 0);
      int8x16_t v103 = (int16x8_t *)((char *)a4 + 16);
      uint64_t v104 = v90;
      do
      {
        v103[-1] = v102;
        *int8x16_t v103 = v102;
        v103 += 2;
        v104 -= 16;
      }
      while (v104);
      if (v90 == v18) {
        goto LABEL_123;
      }
    }
    else
    {
      uint64_t v90 = 0;
    }
    uint64_t v105 = v18 - v90;
    v106 = (char *)a4 + 2 * v90;
    do
    {
      *v106++ = _D0.i16[0];
      --v105;
    }
    while (v105);
LABEL_123:

    int64_t v72 = 0;
    goto LABEL_124;
  }
  if (v11 == 2 && v14 == 4)
  {
    unsigned int v21 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v22 = v8;
    unsigned int v23 = 0;
    unsigned int v24 = 1;
    while ([v22 count] > (unint64_t)v23)
    {
      v26 = [v22 objectAtIndexedSubscript:v23];
      v24 *= [v26 intValue];

      ++v23;
    }
    if (!v24) {
      goto LABEL_123;
    }
    float v55 = (float)v21;
    if (!v21)
    {
      *(float *)v25.i32 = 0.0 / v55;
      if (v24 > 7)
      {
        uint64_t v101 = v24 & 0xFFFFFFF8;
        int32x4_t v108 = vdupq_lane_s32(v25, 0);
        long long v109 = (int32x4_t *)((char *)a4 + 16);
        uint64_t v110 = v101;
        do
        {
          v109[-1] = v108;
          *long long v109 = v108;
          v109 += 2;
          v110 -= 8;
        }
        while (v110);
        if (v101 == v24) {
          goto LABEL_123;
        }
      }
      else
      {
        uint64_t v101 = 0;
      }
      uint64_t v111 = v24 - v101;
      float32x4_t v112 = (char *)a4 + 4 * v101;
      do
      {
        *v112++ = v25.i32[0];
        --v111;
      }
      while (v111);
      goto LABEL_123;
    }
    uint64_t v56 = 0;
    uint64_t v57 = v21 & 0xFFFFFFF0;
    while (1)
    {
      float v58 = 0.0;
      if (v21 >= 0x10)
      {
        uint64_t v59 = 0;
        BOOL v64 = __CFADD__(v56, v21 - 1);
        if (v24 == 1 && !v64)
        {
          uint64_t v65 = 0;
          do
          {
            v66 = (float16x8_t *)((char *)a3 + 2 * (v56 + v65));
            float16x8_t v67 = v66[1];
            float32x4_t v68 = vcvt_hight_f32_f16(*v66);
            float32x4_t v69 = vcvtq_f32_f16(*(float16x4_t *)v66->i8);
            float32x4_t v70 = vcvt_hight_f32_f16(v67);
            float32x4_t v71 = vcvtq_f32_f16(*(float16x4_t *)v67.i8);
            float v58 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v58 + v69.f32[0]) + v69.f32[1]) + v69.f32[2]) + v69.f32[3]) + v68.f32[0])
                                                                                                + v68.f32[1])
                                                                                        + v68.f32[2])
                                                                                + v68.f32[3])
                                                                        + v71.f32[0])
                                                                + v71.f32[1])
                                                        + v71.f32[2])
                                                + v71.f32[3])
                                        + v70.f32[0])
                                + v70.f32[1])
                        + v70.f32[2])
                + v70.f32[3];
            v65 += 16;
          }
          while (v57 != v65);
          uint64_t v59 = v21 & 0xFFFFFFF0;
          if (v57 == v21) {
            goto LABEL_37;
          }
        }
      }
      else
      {
        uint64_t v59 = 0;
      }
      uint64_t v60 = v21 - v59;
      unsigned int v61 = v56 + v24 * v59;
      do
      {
        _H2 = *((_WORD *)a3 + v61);
        __asm { FCVT            S2, H2 }
        float v58 = v58 + _S2;
        v61 += v24;
        --v60;
      }
      while (v60);
LABEL_37:
      *((float *)a4 + v56++) = v58 / v55;
      if (v56 == v24) {
        goto LABEL_123;
      }
    }
  }
  if (v11 == 4 && v14 == 2)
  {
    unsigned int v49 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v50 = v8;
    unsigned int v51 = 0;
    unsigned int v52 = 1;
    while ([v50 count] > (unint64_t)v51)
    {
      BOOL v54 = [v50 objectAtIndexedSubscript:v51];
      v52 *= [v54 intValue];

      ++v51;
    }
    if (!v52) {
      goto LABEL_123;
    }
    float v79 = (float)v49;
    if (!v49)
    {
      *(float *)_D0.i32 = 0.0 / v79;
      __asm { FCVT            H0, S0 }
      if (v52 > 0xF)
      {
        uint64_t v107 = v52 & 0xFFFFFFF0;
        int16x8_t v114 = vdupq_lane_s16(_D0, 0);
        float32x4_t v115 = (int16x8_t *)((char *)a4 + 16);
        uint64_t v116 = v107;
        do
        {
          v115[-1] = v114;
          *float32x4_t v115 = v114;
          v115 += 2;
          v116 -= 16;
        }
        while (v116);
        if (v107 == v52) {
          goto LABEL_123;
        }
      }
      else
      {
        uint64_t v107 = 0;
      }
      uint64_t v117 = v52 - v107;
      float32x4_t v118 = (char *)a4 + 2 * v107;
      do
      {
        *v118++ = _D0.i16[0];
        --v117;
      }
      while (v117);
      goto LABEL_123;
    }
    uint64_t v80 = 0;
    uint64_t v81 = v49 & 0xFFFFFFF8;
    while (1)
    {
      float v83 = 0.0;
      if (v49 >= 0xC)
      {
        uint64_t v84 = 0;
        BOOL v87 = __CFADD__(v80, v49 - 1);
        if (v52 == 1 && !v87)
        {
          uint64_t v88 = 0;
          do
          {
            float32x4_t v89 = (char *)a3 + 4 * (v80 + v88);
            float v83 = (float)((float)((float)((float)((float)((float)((float)(v83 + COERCE_FLOAT(*(_OWORD *)v89))
                                                                + COERCE_FLOAT(HIDWORD(*(void *)v89)))
                                                        + COERCE_FLOAT(*((void *)v89 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v89)))
                                        + COERCE_FLOAT(*((_OWORD *)v89 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((void *)v89 + 2))))
                        + COERCE_FLOAT(*((void *)v89 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v89 + 1)));
            v88 += 8;
          }
          while (v81 != v88);
          uint64_t v84 = v49 & 0xFFFFFFF8;
          if (v81 == v49) {
            goto LABEL_60;
          }
        }
      }
      else
      {
        uint64_t v84 = 0;
      }
      uint64_t v85 = v49 - v84;
      unsigned int v86 = v80 + v52 * v84;
      do
      {
        float v83 = v83 + *((float *)a3 + v86);
        v86 += v52;
        --v85;
      }
      while (v85);
LABEL_60:
      _S1 = v83 / v79;
      __asm { FCVT            H1, S1 }
      *((_WORD *)a4 + v80++) = LOWORD(_S1);
      if (v80 == v52) {
        goto LABEL_123;
      }
    }
  }
  int64_t v72 = -22950;
  if (v11 == 4 && v14 == 4)
  {
    unsigned int v73 = [(ADPearlColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v74 = v8;
    unsigned int v75 = 0;
    unsigned int v76 = 1;
    while ([v74 count] > (unint64_t)v75)
    {
      float32x4_t v78 = [v74 objectAtIndexedSubscript:v75];
      v76 *= [v78 intValue];

      ++v75;
    }
    if (!v76) {
      goto LABEL_123;
    }
    float v91 = (float)v73;
    if (!v73)
    {
      *(float *)v77.i32 = 0.0 / v91;
      if (v76 > 7)
      {
        uint64_t v113 = v76 & 0xFFFFFFF8;
        int32x4_t v119 = vdupq_lane_s32(v77, 0);
        float32x4_t v120 = (int32x4_t *)((char *)a4 + 16);
        uint64_t v121 = v113;
        do
        {
          v120[-1] = v119;
          *float32x4_t v120 = v119;
          v120 += 2;
          v121 -= 8;
        }
        while (v121);
        if (v113 == v76) {
          goto LABEL_123;
        }
      }
      else
      {
        uint64_t v113 = 0;
      }
      uint64_t v122 = v76 - v113;
      float32x4_t v123 = (char *)a4 + 4 * v113;
      do
      {
        *v123++ = v77.i32[0];
        --v122;
      }
      while (v122);
      goto LABEL_123;
    }
    uint64_t v92 = 0;
    uint64_t v93 = v73 & 0xFFFFFFF8;
    while (1)
    {
      float v94 = 0.0;
      if (v73 >= 0xC)
      {
        uint64_t v95 = 0;
        BOOL v96 = __CFADD__(v92, v73 - 1);
        if (v76 == 1 && !v96)
        {
          uint64_t v97 = 0;
          do
          {
            float32x4_t v98 = (char *)a3 + 4 * (v92 + v97);
            float v94 = (float)((float)((float)((float)((float)((float)((float)(v94 + COERCE_FLOAT(*(_OWORD *)v98))
                                                                + COERCE_FLOAT(HIDWORD(*(void *)v98)))
                                                        + COERCE_FLOAT(*((void *)v98 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v98)))
                                        + COERCE_FLOAT(*((_OWORD *)v98 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((void *)v98 + 2))))
                        + COERCE_FLOAT(*((void *)v98 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v98 + 1)));
            v97 += 8;
          }
          while (v93 != v97);
          uint64_t v95 = v73 & 0xFFFFFFF8;
          if (v93 == v73) {
            goto LABEL_80;
          }
        }
      }
      else
      {
        uint64_t v95 = 0;
      }
      uint64_t v99 = v73 - v95;
      unsigned int v100 = v92 + v76 * v95;
      do
      {
        float v94 = v94 + *((float *)a3 + v100);
        v100 += v76;
        --v99;
      }
      while (v99);
LABEL_80:
      *((float *)a4 + v92++) = v94 / v91;
      if (v92 == v76) {
        goto LABEL_123;
      }
    }
  }
LABEL_124:

  return v72;
}

- (id)backendInferenceDescriptor
{
  return self->_backendInferenceDesc;
}

- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return +[ADPearlColorInFieldCalibrationPipeline isColorFrameValid:a3 withMetadata:a4];
}

- (uint64_t)isPearlFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5
{
  uint64_t v13 = a1 + 3920096;
  [*(id *)(a1 + 3920096) thresholdPrecOfValidDepth];
  if (!+[ADPearlColorInFieldCalibrationPipeline isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:](ADPearlColorInFieldCalibrationPipeline, "isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:", a11, 0, a1 + 3920288))
  {
    BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v33) {
      return result;
    }
    *(_WORD *)buf = 0;
    vImagePixelCount v30 = &_os_log_internal;
    unint64_t v31 = "ADPearlColorInFieldCalibration pearl controller failed: frame does not have enough valid depth pixels";
    long long v32 = buf;
    goto LABEL_11;
  }
  [*(id *)v13 minRotationBetweenFrames];
  if (v14 != 0.0)
  {
    int32x4_t v15 = vzip1q_s32(a6, a8);
    int32x4_t v16 = vzip2q_s32(a6, a8);
    int32x4_t v17 = vzip1q_s32(a7, a9);
    int32x4_t v18 = vzip2q_s32(a7, a9);
    float32x4_t v19 = (float32x4_t)vzip1q_s32(v15, v17);
    float32x4_t v20 = (float32x4_t)vzip2q_s32(v15, v17);
    float32x4_t v21 = (float32x4_t)vzip1q_s32(v16, v18);
    float32x4_t v22 = (float32x4_t)vzip2q_s32(v16, v18);
    float32x4_t v23 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a2.f32[0]), v20, *(float32x2_t *)a2.f32, 1), v21, a2, 2), v22, a2, 3);
    float32x4_t v24 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a3.f32[0]), v20, *(float32x2_t *)a3.f32, 1), v21, a3, 2), v22, a3, 3);
    float32x4_t v25 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a4.f32[0]), v20, *(float32x2_t *)a4.f32, 1), v21, a4, 2), v22, a4, 3);
    float32x4_t v43 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a5.f32[0]), v20, *(float32x2_t *)a5.f32, 1), v21, a5, 2), v22, a5, 3);
    *(_OWORD *)buf = 0u;
    long long v46 = 0u;
    *(_DWORD *)&buf[8] = v23.i32[2];
    long long v47 = 0u;
    DWORD2(v46) = v24.i32[2];
    *(void *)buf = v23.i64[0];
    *(void *)&long long v46 = v24.i64[0];
    DWORD2(v47) = v25.i32[2];
    *(void *)&long long v47 = v25.i64[0];
    +[ADUtils calcRotationAngle:buf];
    *(_OWORD *)(v13 + 160) = v26;
    *(float32x4_t *)(v13 + 176) = v43;
    float32x2_t v27 = vabs_f32(*(float32x2_t *)&v26);
    float v28 = v27.f32[0] <= v27.f32[1] ? v27.f32[1] : v27.f32[0];
    [*(id *)v13 minRotationBetweenFrames];
    if (v28 < v29)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      __int16 v44 = 0;
      vImagePixelCount v30 = &_os_log_internal;
      unint64_t v31 = "ADPearlColorInFieldCalibration pearl controller failed: frame not passing minimum rotation";
      long long v32 = (uint8_t *)&v44;
LABEL_11:
      _os_log_impl(&dword_215F16000, v30, OS_LOG_TYPE_DEFAULT, v31, v32, 2u);
      return 0;
    }
  }
  return 1;
}

- (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return +[ADPearlColorInFieldCalibrationPipeline isPearlFrameValid:a3 withMetadata:a4 andPipelineParameters:self->_controllerParameters];
}

- (uint64_t)preProcessPearl:(double)a3 pose:(double)a4 prevPose:(double)a5 referenceCameraCalibration:(double)a6 pearlCameraCalibration:(double)a7 reprojectedPointsBuffer:(double)a8 reprojectedPointsMaskBuffer:(double)a9
{
  id v20 = a12;
  id v21 = a13;
  int v22 = objc_msgSend((id)a1, "isPearlFrameValid:pose:prevPose:", a11, a2, a3, a4, a5, a6, a7, a8, a9);
  BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v23)
    {
      *(_WORD *)float32x4_t v142 = 0;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller fail", v142, 2u);
    }
    uint64_t v36 = -22964;
    goto LABEL_104;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller pass", buf, 2u);
  }
  if (CVPixelBufferGetPixelFormatType(a11) != 825437747)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float32x4_t v143 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Pearl depth frame invalid format", v143, 2u);
    }
    uint64_t v36 = -22956;
    goto LABEL_104;
  }
  if (!*(_DWORD *)(a1 + 40)) {
    goto LABEL_43;
  }
  float32x4_t v139 = a15;
  pixelBuffer = a14;
  float32x4_t v24 = [*(id *)(a1 + 24) colorInput];
  float32x4_t v25 = [v24 imageDescriptor];
  [v25 sizeForLayout:255];
  double v27 = v26;

  int v28 = *(_DWORD *)(a1 + 40);
  if (v28 == 3)
  {
LABEL_22:
    size_t Width = CVPixelBufferGetWidth(a11);
    size_t Height = CVPixelBufferGetHeight(a11);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a11);
    size_t v41 = CVPixelBufferGetWidth(pixelBuffer);
    size_t v42 = CVPixelBufferGetHeight(pixelBuffer);
    size_t v43 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a11, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (v139) {
      CVPixelBufferLockBaseAddress(v139, 0);
    }
    BaseAddress = CVPixelBufferGetBaseAddress(a11);
    float32x4_t v45 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t v46 = BytesPerRow >> 1;
    size_t v47 = v43 >> 1;
    double v48 = (double)v41 / (double)Height;
    if (v139)
    {
      unsigned int v49 = (char *)CVPixelBufferGetBaseAddress(v139);
      if (!v42 || !v41) {
        goto LABEL_102;
      }
      LODWORD(v50) = 0;
      uint64_t v51 = 2 * v47;
      do
      {
        uint64_t v52 = 0;
        do
        {
          _D2 = (double)v52 / v48;
          LOWORD(_D2) = BaseAddress[Width - (int)((double)v50 / v48) + v46 * (int)_D2];
          uint64_t v54 = 2 * v52;
          *(float *)&_D2 = (double)*(unint64_t *)&_D2 / 8000.0;
          __asm { FCVT            H3, S2 }
          *(_WORD *)&v45[2 * v52] = _H3;
          if (*(float *)&_D2 <= 0.0) {
            short float v60 = COERCE_SHORT_FLOAT(0);
          }
          else {
            LOWORD(v60) = COERCE_UNSIGNED_INT(1.0);
          }
          ++v52;
          *(short float *)&v49[v54] = v60;
        }
        while (v41 > v52);
        size_t v50 = (v50 + 1);
        v49 += v51;
        v45 += v51;
      }
      while (v42 > v50);
    }
    else if (v42 && v41)
    {
      if (v41 > 1)
      {
        if (!v41 || (unint64_t v65 = (v41 - 1) >> 32) != 0)
        {
          LODWORD(v116) = 0;
          do
          {
            uint64_t v117 = 0;
            do
            {
              _D0 = (double)v117 / v48;
              LOWORD(_D0) = BaseAddress[Width - (int)((double)v116 / v48) + v46 * (int)_D0];
              *(float *)&_D0 = (double)*(unint64_t *)&_D0 / 8000.0;
              __asm { FCVT            H0, S0 }
              *(_WORD *)&v45[2 * v117++] = LOWORD(_D0);
            }
            while (v41 > v117);
            size_t v116 = (v116 + 1);
            v45 += 2 * v47;
          }
          while (v42 > v116);
        }
        else
        {
          unint64_t v66 = v41 & 0xFFFFFFFFFFFFFFFELL;
          do
          {
            uint64_t v67 = 0;
            size_t v68 = Width - (int)((double)v65 / v48);
            do
            {
              _D0 = (double)v67 / v48;
              _D1 = (double)(v67 + 1) / v48;
              LOWORD(_D0) = BaseAddress[v68 + v46 * (int)_D0];
              LOWORD(_D1) = BaseAddress[v68 + v46 * (int)_D1];
              *(float *)&_D0 = (double)*(unint64_t *)&_D0 / 8000.0;
              *(float *)&_D1 = (double)*(unint64_t *)&_D1 / 8000.0;
              float32x4_t v71 = &v45[2 * v67];
              __asm
              {
                FCVT            H0, S0
                FCVT            H1, S1
              }
              *(_WORD *)float32x4_t v71 = LOWORD(_D0);
              *((_WORD *)v71 + 1) = LOWORD(_D1);
              v67 += 2;
            }
            while (v66 != v67);
            if (v41 != v66)
            {
              unint64_t v72 = 2 * (v41 & 0xFFFFFFFFFFFFFFFELL);
              LODWORD(v73) = v41 & 0xFFFFFFFE;
              do
              {
                _D0 = (double)v73 / v48;
                LOWORD(_D0) = BaseAddress[v68 + v46 * (int)_D0];
                *(float *)&_D0 = (double)*(unint64_t *)&_D0 / 8000.0;
                __asm { FCVT            H0, S0 }
                *(_WORD *)&v45[v72] = LOWORD(_D0);
                size_t v73 = (v73 + 1);
                v72 += 2;
              }
              while (v41 > v73);
            }
            unint64_t v65 = (v65 + 1);
            v45 += 2 * v47;
          }
          while (v42 > v65);
        }
      }
      else
      {
        LODWORD(v61) = 0;
        do
        {
          uint64_t v62 = 0;
          double v63 = 0.0;
          do
          {
            _D2 = v63 / v48;
            LOWORD(_D2) = BaseAddress[Width - (int)((double)v61 / v48) + v46 * (int)(v63 / v48)];
            *(float *)&_D2 = (double)*(unint64_t *)&_D2 / 8000.0;
            __asm { FCVT            H2, S2 }
            *(_WORD *)&v45[2 * v62] = LOWORD(_D2);
            double v63 = v63 + 1.0;
            ++v62;
          }
          while (v62 < v41);
          size_t v61 = (v61 + 1);
          v45 += 2 * v47;
        }
        while (v42 > v61);
      }
    }
    if (!v139)
    {
LABEL_103:
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      CVPixelBufferUnlockBaseAddress(a11, 1uLL);
      uint64_t v36 = 0;
      goto LABEL_104;
    }
LABEL_102:
    CVPixelBufferUnlockBaseAddress(v139, 0);
    goto LABEL_103;
  }
  if (v28 != 2)
  {
    [v21 referenceDimensions];
    if (v27 > v38)
    {
      float32x4_t v139 = 0;
      goto LABEL_22;
    }
LABEL_43:
    uint64_t v36 = objc_msgSend(*(id *)(a1 + 3920120), "warpDepth:srcCalibration:dstCalibration:poseTransform:warpedDepth:", a11, v21, v20, a14, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
    goto LABEL_104;
  }
  size_t v29 = CVPixelBufferGetWidth(a11);
  size_t v134 = CVPixelBufferGetHeight(a11);
  size_t v132 = CVPixelBufferGetBytesPerRow(a11);
  size_t v30 = CVPixelBufferGetWidth(pixelBuffer);
  size_t v31 = CVPixelBufferGetHeight(pixelBuffer);
  size_t v32 = CVPixelBufferGetBytesPerRow(pixelBuffer);
  size_t v33 = CVPixelBufferGetWidth(v139);
  size_t v34 = CVPixelBufferGetHeight(v139);
  size_t v35 = CVPixelBufferGetBytesPerRow(v139);
  uint64_t v36 = -22950;
  if (v30 == v33 && v31 == v34)
  {
    size_t v37 = v32 >> 1;
    if (v32 >> 1 == v35 >> 1)
    {
      if (v30 <= v29)
      {
        size_t v130 = 0;
        if (v30 >= v29) {
          size_t v136 = 0;
        }
        else {
          size_t v136 = (v29 - v30) >> 1;
        }
      }
      else
      {
        size_t v136 = 0;
        size_t v130 = (v30 - v29) >> 1;
      }
      if (v31 <= v134)
      {
        size_t v76 = 0;
        if (v31 >= v134) {
          size_t v75 = 0;
        }
        else {
          size_t v75 = (v134 - v31) >> 1;
        }
      }
      else
      {
        size_t v75 = 0;
        size_t v76 = (v31 - v134) >> 1;
        size_t v31 = v134;
      }
      CVPixelBufferLockBaseAddress(a11, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      CVPixelBufferLockBaseAddress(v139, 0);
      int32x2_t v77 = CVPixelBufferGetBaseAddress(a11);
      float32x4_t v78 = CVPixelBufferGetBaseAddress(pixelBuffer);
      float v79 = CVPixelBufferGetBaseAddress(v139);
      if (v31 && v30)
      {
        size_t v82 = v132 >> 1;
        uint64_t v83 = 2 * v76 * v37;
        uint64_t v84 = &v78[2 * v130 + v83];
        uint64_t v85 = (short float *)&v79[2 * v130 + v83];
        if (v30 <= 7)
        {
          uint64_t v86 = 0;
          BOOL v87 = (char *)&v77[v75 * v82 + v136];
          uint64_t v88 = 2 * v82;
          uint64_t v89 = 2 * v37;
          do
          {
            uint64_t v90 = 0;
            do
            {
              LOWORD(_D2) = *(_WORD *)&v87[2 * v90];
              _D2 = (double)*(unint64_t *)&_D2 / 8000.0;
              *(float *)&_D2 = _D2;
              __asm { FCVT            H3, S2 }
              v84[v90] = _H3;
              if (*(float *)&_D2 <= 0.0) {
                short float v92 = COERCE_SHORT_FLOAT(0);
              }
              else {
                LOWORD(v92) = COERCE_UNSIGNED_INT(1.0);
              }
              v85[v90++] = v92;
            }
            while (v90 < v30);
            ++v86;
            v87 += v88;
            uint64_t v85 = (short float *)((char *)v85 + v89);
            uint64_t v84 = (_WORD *)((char *)v84 + v89);
          }
          while (v31 > v86);
          goto LABEL_102;
        }
        if (!v30 || (unint64_t v93 = (v30 - 1) >> 32) != 0)
        {
          uint64_t v119 = 0;
          float32x4_t v120 = (char *)&v77[v75 * v82 + v136];
          uint64_t v121 = 2 * v82;
          uint64_t v122 = 2 * v37;
          do
          {
            uint64_t v123 = 0;
            do
            {
              LOWORD(_D2) = *(_WORD *)&v120[2 * v123];
              _D2 = (double)*(unint64_t *)&_D2 / 8000.0;
              *(float *)&_D2 = _D2;
              __asm { FCVT            H3, S2 }
              v84[v123] = _H3;
              if (*(float *)&_D2 <= 0.0) {
                short float v125 = COERCE_SHORT_FLOAT(0);
              }
              else {
                LOWORD(v125) = COERCE_UNSIGNED_INT(1.0);
              }
              v85[v123++] = v125;
            }
            while (v30 > v123);
            ++v119;
            v120 += v121;
            uint64_t v85 = (short float *)((char *)v85 + v122);
            uint64_t v84 = (_WORD *)((char *)v84 + v122);
          }
          while (v31 > v119);
          goto LABEL_102;
        }
        unint64_t v94 = v30 & 0xFFFFFFFFFFFFFFF8;
        uint64_t v95 = (char *)&v77[v75 * v82 + v136];
        uint64_t v96 = 2 * v37;
        float64x2_t v97 = (float64x2_t)vdupq_n_s64(0x40BF400000000000uLL);
        while ((unint64_t)(v79 - v78) >= 0x10)
        {
          uint64_t v102 = 0;
          unsigned int v100 = &v85[v94];
          unint64_t v103 = v30 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            uint16x8_t v104 = *(uint16x8_t *)&v95[v102 * 2];
            uint32x4_t v105 = vmovl_high_u16(v104);
            v106.i64[0] = v105.u32[0];
            v106.i64[1] = v105.u32[1];
            float64x2_t v107 = vcvtq_f64_u64(v106);
            v106.i64[0] = v105.u32[2];
            v106.i64[1] = v105.u32[3];
            float64x2_t v108 = vcvtq_f64_u64(v106);
            uint32x4_t v109 = vmovl_u16(*(uint16x4_t *)v104.i8);
            v106.i64[0] = v109.u32[0];
            v106.i64[1] = v109.u32[1];
            float64x2_t v110 = vcvtq_f64_u64(v106);
            v106.i64[0] = v109.u32[2];
            v106.i64[1] = v109.u32[3];
            float32x4_t v111 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v107, v97)), vdivq_f64(v108, v97));
            float32x4_t v112 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v110, v97)), vdivq_f64(vcvtq_f64_u64(v106), v97));
            *(float16x8_t *)&v84[v102] = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v112), v111);
            _Q4 = vcvtq_f16_u16(vmovl_u8((uint8x8_t)vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vcgtzq_f32(v112), (int16x8_t)vcgtzq_f32(v111))), (int8x8_t)0x101010101010101)));
            *(float16x8_t *)&v85[v102] = _Q4;
            v102 += 8;
            v103 -= 8;
          }
          while (v103);
          if (v30 != (v30 & 0xFFFFFFFFFFFFFFF8))
          {
            uint64_t v101 = &v84[v94];
            unint64_t v98 = v30 & 0xFFFFFFFFFFFFFFF8;
            int v99 = v30 & 0xFFFFFFF8;
LABEL_83:
            unsigned int v113 = v99 + 1;
            do
            {
              _Q4.i16[0] = v77[v136 + (v93 + v75) * v82 + v98];
              *(double *)_Q4.i64 = (double)_Q4.u64[0] / 8000.0;
              *(float *)_Q4.i32 = *(double *)_Q4.i64;
              __asm { FCVT            H5, S4 }
              *v101++ = _H5;
              if (*(float *)_Q4.i32 <= 0.0) {
                short float v115 = COERCE_SHORT_FLOAT(0);
              }
              else {
                LOWORD(v115) = COERCE_UNSIGNED_INT(1.0);
              }
              *v100++ = v115;
              unint64_t v98 = v113++;
            }
            while (v30 > v98);
          }
          uint64_t v84 = (_WORD *)((char *)v84 + v96);
          uint64_t v85 = (short float *)((char *)v85 + v96);
          ++v93;
          v95 += 2 * v82;
          if (v31 <= v93) {
            goto LABEL_102;
          }
        }
        unint64_t v98 = 0;
        int v99 = 0;
        unsigned int v100 = v85;
        uint64_t v101 = v84;
        goto LABEL_83;
      }
      goto LABEL_102;
    }
  }
LABEL_104:

  return v36;
}

- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  kdebug_trace();
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a3))
  {
    p_colorImageRaw = &self->_colorImageRaw;
    colorInputProcessingSession = self->_colorInputProcessingSession;
    if (!colorInputProcessingSession)
    {
      OSType v43 = CVPixelBufferGetPixelFormatType(a3);
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      CVPixelBufferGetPixelFormatType(a4);
      double v17 = (double)Width;
      double v18 = (double)Height;
      if ((self->_networkFlowType - 1) <= 2)
      {
        size_t v42 = CVPixelBufferGetWidth(a4);
        size_t v19 = CVPixelBufferGetHeight(a4);
        id v20 = [(ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor *)self->_backendInferenceDesc colorInput];
        id v21 = [v20 imageDescriptor];
        [v21 sizeForLayout:255];
        double v23 = v22;
        double v25 = v24;

        double v26 = v25 / v23;
        if (v18 / (v25 / v23) <= v17) {
          double v27 = v18 / (v25 / v23);
        }
        else {
          double v27 = v17;
        }
        double v28 = v26 * v27;
        double v29 = (v17 - v27) * 0.5;
        double v30 = (v18 - v26 * v27) * 0.5;
        v45.vImagePixelCount width = v17;
        v45.vImagePixelCount height = v18;
        v47.vImagePixelCount width = (double)v42;
        v47.vImagePixelCount height = (double)v19;
        PixelBufferUtilsSession::createCropScaleConvertRotateSession((PixelBufferUtilsSession *)v43, v45, v47, *(CGRect *)(&v27 - 2));
      }
      v46.vImagePixelCount width = (double)Width;
      v46.vImagePixelCount height = (double)Height;
      v48.vImagePixelCount width = (double)Width;
      v48.vImagePixelCount height = (double)Height;
      PixelBufferUtilsSession::createCropScaleConvertRotateSession((PixelBufferUtilsSession *)v43, v46, v48, *MEMORY[0x263F001A0]);
    }
    int networkFlowType = self->_networkFlowType;
    if ((networkFlowType - 1) >= 3)
    {
      if (!networkFlowType)
      {
        size_t v33 = *p_colorImageRaw;
        if (!*p_colorImageRaw)
        {
          OSType v34 = CVPixelBufferGetPixelFormatType(a4);
          size_t v35 = CVPixelBufferGetWidth(a3);
          size_t v36 = CVPixelBufferGetHeight(a3);
          CVPixelBufferRef pixelBufferOut = 0;
          CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
          CVReturn v38 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v35, v36, v34, BufferAttributes, &pixelBufferOut);
          CVPixelBufferRef v39 = pixelBufferOut;
          if (v38) {
            CVPixelBufferRef v39 = 0;
          }
          *p_colorImageRaw = v39;
          float32x4_t v40 = +[ADUtils getStandardNameForBufferOfType:@"colorImageRaw" moduleName:@"RGBP"];
          +[ADUtils updatePixelBufferIOSurfaceLabel:v40 pixelBuffer:*p_colorImageRaw];

          size_t v33 = *p_colorImageRaw;
          colorInputProcessingSession = self->_colorInputProcessingSession;
        }
        if (PixelBufferUtilsSession::run(colorInputProcessingSession, a3, v33))
        {
          a3 = *p_colorImageRaw;
          if (self->_networkFlowType) {
            goto LABEL_12;
          }
LABEL_20:
          int64_t v32 = [(ADPearlColorInFieldCalibrationPipeline *)self undistortColorImage:a3 undistortedImage:a4 calibration:v11];
          goto LABEL_22;
        }
      }
    }
    else if (PixelBufferUtilsSession::run(colorInputProcessingSession, a3, a4))
    {
      goto LABEL_11;
    }
    int64_t v32 = -22950;
    goto LABEL_22;
  }
LABEL_11:
  if (!self->_networkFlowType) {
    goto LABEL_20;
  }
LABEL_12:
  int64_t v32 = 0;
LABEL_22:
  kdebug_trace();

  return v32;
}

- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4
{
  id v9 = a7;
  id v10 = v9;
  if (v9)
  {
    id v11 = (unint64_t *)(a1 + 3920128);
    int v12 = *(_DWORD *)(a1 + 40);
    if ((v12 - 1) < 3)
    {
      uint64_t v13 = (void *)[v9 mutableCopy];
      float v14 = [*(id *)(a1 + 24) colorInput];
      int32x4_t v15 = [v14 imageDescriptor];
      [v15 sizeForLayout:255];
      double v17 = v16;
      double v19 = v18;

      [v13 referenceDimensions];
      double v22 = v21 / (v19 / v17);
      if (v20 < v22) {
        double v22 = v20;
      }
      objc_msgSend(v13, "crop:", (v20 - v22) * 0.5, (v21 - v19 / v17 * v22) * 0.5);
      objc_msgSend(v13, "scale:", v17, v19);
LABEL_15:
      *(float32x4_t *)(a1 + 3920192) = a2;
      *(float32x4_t *)(a1 + 3920208) = a3;
      *(float32x4_t *)(a1 + 3920224) = a4;
      *(float32x4_t *)(a1 + 3920240) = a5;
      [v13 intrinsicMatrix];
      *(_DWORD *)(a1 + 44) = v39;
      [v10 cameraToPlatformTransform];
      *(_DWORD *)(a1 + 56) = v40;
      *(void *)(a1 + 48) = v41;
      *(_DWORD *)(a1 + 72) = v42;
      *(_DWORD *)(a1 + 88) = v43;
      *(void *)(a1 + 64) = v44;
      *(void *)(a1 + 80) = v45;
      *(_DWORD *)(a1 + 104) = v46;
      *(void *)(a1 + 96) = v47;
      goto LABEL_17;
    }
    if (!v12)
    {
      id v23 = objc_alloc(MEMORY[0x263F26CB8]);
      [v10 intrinsicMatrix];
      double v50 = v25;
      double v51 = v24;
      double v49 = v26;
      [v10 pixelSize];
      int v28 = v27;
      [v10 referenceDimensions];
      LODWORD(v29) = v28;
      uint64_t v13 = objc_msgSend(v23, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", 0, v51, v50, v49, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v29, v30, v31);
      [v13 referenceDimensions];
      if (v32 == 864.0)
      {
        [v13 referenceDimensions];
        if (v33 == 704.0) {
          objc_msgSend(v13, "crop:", 0.0, -4.0, 872.0, 712.0);
        }
      }
      objc_msgSend(v13, "centerCrop:", 866.0, 710.0);
      objc_msgSend(v13, "scale:", 644.0, 528.0);
      objc_msgSend(v13, "centerCrop:", 464.0, 528.0);
      [v13 referenceDimensions];
      double v35 = v34;
      [v13 referenceDimensions];
      unint64_t v37 = (unint64_t)v36 * (unint64_t)v35;
      if (*v11 != v37)
      {
        [(id)a1 deallocMemory];
        operator new[]();
      }
      if (*(void **)(a1 + 3920176) != v10
        || (uint32x4_t v38 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920208), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920192), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920224), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920240), a5))), v38.i32[3] = v38.i32[2], (vminvq_u32(v38) & 0x80000000) == 0))
      {
        [v13 transform:v37 points:*(void *)(a1 + 3920152) toCamera:v10 outPoints:*(void *)(a1 + 3920160)];
        [v10 project:v37 points:*(void *)(a1 + 3920160) outUndistortedPixels:*(void *)(a1 + 3920168)];
        [v10 distort:v37 undistortedPixels:*(void *)(a1 + 3920168) outDistorted:a1 + 224];
      }
      unint64_t *v11 = v37;
      objc_storeStrong((id *)(a1 + 3920176), a7);
      goto LABEL_15;
    }
  }
  uint64_t v13 = 0;
LABEL_17:

  return v13;
}

- (uint64_t)updateWmcamToMcamExtrinsics:(__n128)a3
{
  *(_DWORD *)(result + 184) = a2.n128_u32[2];
  *(_DWORD *)(result + 200) = a3.n128_u32[2];
  *(void *)(result + 176) = a2.n128_u64[0];
  *(void *)(result + 192) = a3.n128_u64[0];
  *(_DWORD *)(result + 216) = a4.n128_u32[2];
  *(void *)(result + 208) = a4.n128_u64[0];
  return result;
}

- (void)updatePearlCamera:(id)a3
{
  objc_storeStrong((id *)&self->_pearlCalib, a3);
  id v5 = a3;
  [v5 cameraToPlatformTransform];
  long long v10 = v6;
  long long v11 = v7;
  long long v12 = v8;
  long long v13 = v9;

  *(_DWORD *)&self->_anon_70[8] = DWORD2(v10);
  *(void *)self->_anon_70 = v10;
  *(_DWORD *)&self->_anon_70[24] = DWORD2(v11);
  *(_DWORD *)&self->_anon_70[40] = DWORD2(v12);
  *(void *)&self->_anon_70[16] = v11;
  *(void *)&self->_anon_70[32] = v12;
  *(_DWORD *)&self->_anon_70[56] = DWORD2(v13);
  *(void *)&self->_anon_70[48] = v13;
}

- (void)dealloc
{
  [(ADPearlColorInFieldCalibrationPipeline *)self deallocMemory];
  v3.receiver = self;
  v3.super_class = (Class)ADPearlColorInFieldCalibrationPipeline;
  [(ADPearlColorInFieldCalibrationPipeline *)&v3 dealloc];
}

- (void)deallocMemory
{
  p_colorImageRaw = &self->_colorImageRaw;
  zVals = self->_zVals;
  if (zVals) {
    MEMORY[0x2166C5D70](zVals, 0x1000C8052888210);
  }
  id v5 = p_colorImageRaw[5];
  if (v5) {
    MEMORY[0x2166C5D70](v5, 0x1000C80451B5BE8);
  }
  long long v6 = p_colorImageRaw[6];
  if (v6) {
    MEMORY[0x2166C5D70](v6, 0x1000C80451B5BE8);
  }
  long long v7 = p_colorImageRaw[7];
  if (v7) {
    MEMORY[0x2166C5D70](v7, 0x1000C80451B5BE8);
  }
  long long v8 = p_colorImageRaw[8];
  if (v8) {
    MEMORY[0x2166C5D70](v8, 0x1000C80451B5BE8);
  }
  long long v9 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  if (v9)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v9);
    MEMORY[0x2166C5D90]();
  }
  CVPixelBufferRelease(*p_colorImageRaw);
  *(_OWORD *)&self->_rectifiedPoints = 0u;
  *(_OWORD *)self->_origWorldPoints = 0u;
  *(_OWORD *)&self->_referenceCameraNumOfPoints = 0u;
  *p_colorImageRaw = 0;
  p_colorImageRaw[1] = 0;
}

- (ADPearlColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4
{
  id v7 = a3;
  int v34 = 335685188;
  long long v35 = 0u;
  long long v36 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v8 = &_os_log_internal;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    long long v8 = &_os_log_internal;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_215F16000, v8, v9, "Pearl Color In-Field calibration pipeline init for", buf, 2u);
LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)ADPearlColorInFieldCalibrationPipeline;
  long long v10 = [(ADPearlColorInFieldCalibrationPipeline *)&v32 init];
  long long v11 = v10;
  if (!v10) {
    goto LABEL_22;
  }
  p_controllerParameters = (id *)&v10->_controllerParameters;
  v10->_colorImageRaw = 0;
  *(_OWORD *)&v10->_referenceCameraNumOfPoints = 0u;
  *(_OWORD *)&v10->_rectifiedPoints = 0u;
  *(_OWORD *)v10->_origWorldPoints = 0u;
  objc_storeStrong((id *)&v10->_pipelineParameters, a3);
  id v13 = [(ADPipelineParameters *)v11->_pipelineParameters deviceName];
  if ([v13 hasPrefix:@"N301"])
  {
    int v14 = 0;
  }
  else if ([v13 hasPrefix:@"J7"])
  {
    int v14 = 2;
  }
  else
  {
    int v14 = 1;
  }

  v11->_int networkFlowType = v14;
  int networkFlowType = v11->_networkFlowType;
  if (networkFlowType == 2)
  {
    uint64_t v19 = +[ADNetworkProvider providerForNetwork:@"NuCoReNetBackend" espressoEngine:a4];
    backendNetworkProvider = v11->_backendNetworkProvider;
    v11->_backendNetworkProvider = (ADNetworkProvider *)v19;

    uint64_t v18 = +[ADNetworkProvider providerForNetwork:@"NuCoReNetFrontend" espressoEngine:a4];
  }
  else
  {
    if (networkFlowType != 1) {
      goto LABEL_18;
    }
    uint64_t v16 = +[ADNetworkProvider providerForNetwork:@"RGBPNetSMPBackend"];
    double v17 = v11->_backendNetworkProvider;
    v11->_backendNetworkProvider = (ADNetworkProvider *)v16;

    uint64_t v18 = +[ADNetworkProvider providerForNetwork:@"RGBPNetSMPFrontend"];
  }
  frontendNetworkProvider = v11->_frontendNetworkProvider;
  v11->_frontendNetworkProvider = (ADNetworkProvider *)v18;

LABEL_18:
  if (!v11->_backendNetworkProvider || !v11->_frontendNetworkProvider)
  {
    uint64_t v30 = 0;
    goto LABEL_24;
  }
  double v22 = [[ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor alloc] initWithNetworkProvider:v11->_backendNetworkProvider espressoEngine:a4 networkFlowType:v11->_networkFlowType];
  backendInferenceDesc = v11->_backendInferenceDesc;
  v11->_backendInferenceDesc = v22;

  double v24 = [[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor alloc] initWithNetworkProvider:v11->_frontendNetworkProvider espressoEngine:a4 networkFlowType:v11->_networkFlowType];
  frontendInferenceDesc = v11->_frontendInferenceDesc;
  v11->_frontendInferenceDesc = v24;

  uint64_t v26 = [objc_alloc(MEMORY[0x263F26CE8]) initWithStreakingInfill:0];
  pearlReprojector = v11->_pearlReprojector;
  v11->_pearlReprojector = (ADReprojection *)v26;

  [(ADReprojection *)v11->_pearlReprojector setFullPassReprojectionAllowed:0];
  uint64_t v28 = objc_opt_new();
  id v29 = *p_controllerParameters;
  id *p_controllerParameters = (id)v28;

  if (v11->_networkFlowType)
  {
    [*p_controllerParameters setMinRotationBetweenFrames:0.0];
    [(ADReprojection *)v11->_pearlReprojector setFullPassReprojectionAllowed:1];
  }
LABEL_22:
  uint64_t v30 = v11;
LABEL_24:
  kdebug_trace();

  return v30;
}

- (ADPearlColorInFieldCalibrationPipeline)init
{
  self->_colorInputProcessingSession = 0;
  objc_super v3 = objc_opt_new();
  id v4 = [(ADPearlColorInFieldCalibrationPipeline *)self initWithParameters:v3 espressoEngine:4];

  return v4;
}

+ (BOOL)isZUsedFor:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

+ (BOOL)isPearlMaskExpectedFor:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2;
}

+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int64_t v5 = +[ADDeviceConfiguration integerForKey:kADDeviceConfigurationKeyPearlColorMinimumLuxLevel];
  long long v6 = [v4 valueForKey:@"AEStable"];
  uint64_t v7 = [v4 valueForKey:@"LuxLevel"];
  long long v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        int v21 = 67109120;
        int v22 = [v6 intValue];
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInfieldCalibration: AE is stable: %d", (uint8_t *)&v21, 8u);
        if (ADDebugUtilsADVerboseLogsEnabled) {
          goto LABEL_6;
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v21 = 67109120;
        int v22 = [v6 intValue];
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ADPearlColorInfieldCalibration: AE is stable: %d", (uint8_t *)&v21, 8u);
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
LABEL_6:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = [v8 intValue];
            int v21 = 67109120;
            int v22 = v9;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInfieldCalibration: Lux level: %d", (uint8_t *)&v21, 8u);
          }
LABEL_19:
          if (v5 > (int)[v8 intValue])
          {
            if (ADDebugUtilsADVerboseLogsEnabled)
            {
              BOOL v10 = 0;
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_15;
              }
              int v15 = [v8 intValue];
              int v21 = 67109376;
              int v22 = v15;
              __int16 v23 = 2048;
              int64_t v24 = v5;
              long long v11 = &_os_log_internal;
              long long v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level too low (%d < %ld)";
              uint32_t v13 = 18;
              goto LABEL_13;
            }
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_14;
            }
            int v16 = [v8 intValue];
            int v21 = 67109376;
            int v22 = v16;
            __int16 v23 = 2048;
            int64_t v24 = v5;
            double v17 = &_os_log_internal;
            uint64_t v18 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level too low (%d < %ld)";
            uint32_t v19 = 18;
LABEL_32:
            _os_log_debug_impl(&dword_215F16000, v17, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v21, v19);
            goto LABEL_14;
          }
          if ([v6 intValue])
          {
            BOOL v10 = 1;
            goto LABEL_15;
          }
          if (!ADDebugUtilsADVerboseLogsEnabled)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_14;
            }
            LOWORD(v21) = 0;
            double v17 = &_os_log_internal;
            uint64_t v18 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE not stable";
            uint32_t v19 = 2;
            goto LABEL_32;
          }
          BOOL v10 = 0;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          LOWORD(v21) = 0;
          long long v11 = &_os_log_internal;
          long long v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE not stable";
LABEL_12:
          uint32_t v13 = 2;
LABEL_13:
          _os_log_impl(&dword_215F16000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, v13);
LABEL_14:
          BOOL v10 = 0;
          goto LABEL_15;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v20 = [v8 intValue];
        int v21 = 67109120;
        int v22 = v20;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ADPearlColorInfieldCalibration: Lux level: %d", (uint8_t *)&v21, 8u);
      }
      goto LABEL_19;
    }
    BOOL v10 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      long long v11 = &_os_log_internal;
      long long v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level unknown";
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      long long v11 = &_os_log_internal;
      long long v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE stable unknown";
      goto LABEL_12;
    }
  }
LABEL_15:

  return v10;
}

+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  id v5 = a4;
  long long v6 = objc_alloc_init(ADPearlColorInFieldCalibrationControllerParameters);
  LOBYTE(a3) = +[ADPearlColorInFieldCalibrationPipeline isPearlFrameValid:a3 withMetadata:v5 andPipelineParameters:v6];

  return (char)a3;
}

+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = [v7 valueForKey:@"RegType"];
  BOOL v10 = v9;
  if (!v9)
  {
    BOOL v17 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    LOWORD(v22[0]) = 0;
    uint64_t v18 = &_os_log_internal;
    uint32_t v19 = "ADPearlColorInFieldCalibration: pearl buffer not valid for algorithm: registration mode unknown";
    uint32_t v20 = 2;
LABEL_10:
    _os_log_impl(&dword_215F16000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v22, v20);
    BOOL v17 = 0;
    goto LABEL_16;
  }
  int v11 = [v9 intValue];
  int v12 = v11;
  if (v11 != 3 && v11 != 27)
  {
    BOOL v17 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    v22[0] = 67109120;
    v22[1] = v12;
    uint64_t v18 = &_os_log_internal;
    uint32_t v19 = "ADPearlColorInFieldCalibration: pearl buffer not valid for algorithm: unregistered mode (%d)";
    uint32_t v20 = 8;
    goto LABEL_10;
  }
  uint32_t v13 = CVPixelBufferGetAttributes();
  int v14 = [v13 objectForKey:@"FixedPointInvalidValue"];
  int v15 = v14;
  if (v14) {
    unsigned __int16 v16 = [v14 intValue];
  }
  else {
    unsigned __int16 v16 = 0;
  }
  [v8 thresholdPrecOfValidDepth];
  BOOL v17 = +[ADPearlColorInFieldCalibrationPipeline isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:](ADPearlColorInFieldCalibrationPipeline, "isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:", a3, v16, 0);
  if (!v17 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller failed: frame does not have enough valid depth pixels", (uint8_t *)v22, 2u);
  }

LABEL_16:
  return v17;
}

+ (BOOL)isValidDepthAboveThreshold:(__CVBuffer *)a3 threshold:(float)a4 invalid:(unsigned __int16)a5 validDepthPercentage:(float *)a6
{
  unsigned int v7 = a5;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unint64_t v93 = (unint64_t)(float)((float)(Height * Width) * a4);
  if (Height)
  {
    if (Width)
    {
      unint64_t v13 = Width & 0xFFFFFFFFFFFFFFF0;
      int16x8_t v94 = vdupq_n_s16(v7);
      unint64_t v89 = Height * Width;
      uint64_t v90 = a6;
      if (a6)
      {
        if (Width >= 0x10)
        {
          uint64_t v25 = 0;
          unint64_t v16 = 0;
          unint64_t v26 = (2 * Width) & 0xFFFFFFFFFFFFFFE0;
          uint64_t v27 = 16;
          int8x16_t v91 = (int8x16_t)vdupq_n_s64(1uLL);
          do
          {
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
            int64x2_t v29 = 0uLL;
            int64x2_t v30 = (int64x2_t)v16;
            uint64_t v31 = (int16x8_t *)&BaseAddress[v27];
            unint64_t v32 = Width & 0xFFFFFFFFFFFFFFF0;
            int64x2_t v33 = 0uLL;
            int64x2_t v34 = 0uLL;
            int64x2_t v35 = 0uLL;
            int64x2_t v36 = 0uLL;
            int64x2_t v37 = 0uLL;
            int64x2_t v38 = 0uLL;
            do
            {
              uint16x8_t v39 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v31[-1], v94));
              uint32x4_t v40 = vmovl_u16(*(uint16x4_t *)v39.i8);
              v41.i64[0] = v40.u32[0];
              v41.i64[1] = v40.u32[1];
              int64x2_t v42 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v40.u32[2];
              v41.i64[1] = v40.u32[3];
              int64x2_t v43 = (int64x2_t)vandq_s8(v41, v91);
              uint32x4_t v44 = vmovl_high_u16(v39);
              v41.i64[0] = v44.u32[0];
              v41.i64[1] = v44.u32[1];
              int64x2_t v45 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v44.u32[2];
              v41.i64[1] = v44.u32[3];
              int64x2_t v46 = (int64x2_t)vandq_s8(v41, v91);
              uint16x8_t v47 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(*v31, v94));
              uint32x4_t v48 = vmovl_u16(*(uint16x4_t *)v47.i8);
              v41.i64[0] = v48.u32[0];
              v41.i64[1] = v48.u32[1];
              int64x2_t v49 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v48.u32[2];
              v41.i64[1] = v48.u32[3];
              int64x2_t v50 = (int64x2_t)vandq_s8(v41, v91);
              uint32x4_t v51 = vmovl_high_u16(v47);
              v41.i64[0] = v51.u32[0];
              v41.i64[1] = v51.u32[1];
              int64x2_t v52 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v51.u32[2];
              v41.i64[1] = v51.u32[3];
              int64x2_t v34 = vaddq_s64(v34, v46);
              int64x2_t v33 = vaddq_s64(v33, v45);
              int64x2_t v29 = vaddq_s64(v29, v43);
              int64x2_t v30 = vaddq_s64(v30, v42);
              int64x2_t v38 = vaddq_s64(v38, (int64x2_t)vandq_s8(v41, v91));
              int64x2_t v37 = vaddq_s64(v37, v52);
              int64x2_t v36 = vaddq_s64(v36, v50);
              int64x2_t v35 = vaddq_s64(v35, v49);
              v31 += 2;
              v32 -= 16;
            }
            while (v32);
            unint64_t v16 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v35, v30), vaddq_s64(v37, v33)), vaddq_s64(vaddq_s64(v36, v29), vaddq_s64(v38, v34))));
            if (Width != v13)
            {
              float v53 = &BaseAddress[v26];
              size_t v54 = Width - v13;
              do
              {
                int v55 = *(unsigned __int16 *)v53;
                v53 += 2;
                if (v55 != v7) {
                  ++v16;
                }
                --v54;
              }
              while (v54);
            }
            ++v25;
            v27 += BytesPerRow;
            v26 += BytesPerRow;
          }
          while (v25 != Height);
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          unint64_t v16 = 0;
          do
          {
            BOOL v17 = (unsigned __int16 *)((char *)CVPixelBufferGetBaseAddress(a3) + v14);
            size_t v18 = Width;
            do
            {
              int v19 = *v17++;
              if (v19 != v7) {
                ++v16;
              }
              --v18;
            }
            while (v18);
            ++v15;
            v14 += BytesPerRow;
          }
          while (v15 != Height);
        }
        goto LABEL_39;
      }
      if (Width >= 0x10)
      {
        uint64_t v58 = 0;
        unint64_t v16 = 0;
        unint64_t v59 = (2 * Width) & 0xFFFFFFFFFFFFFFE0;
        uint64_t v60 = 16;
        int8x16_t v92 = (int8x16_t)vdupq_n_s64(1uLL);
        while (v16 < v93)
        {
          size_t v61 = (char *)CVPixelBufferGetBaseAddress(a3);
          int64x2_t v62 = 0uLL;
          int64x2_t v63 = (int64x2_t)v16;
          BOOL v64 = (int16x8_t *)&v61[v60];
          unint64_t v65 = Width & 0xFFFFFFFFFFFFFFF0;
          int64x2_t v66 = 0uLL;
          int64x2_t v67 = 0uLL;
          int64x2_t v68 = 0uLL;
          int64x2_t v69 = 0uLL;
          int64x2_t v70 = 0uLL;
          int64x2_t v71 = 0uLL;
          do
          {
            uint16x8_t v72 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v64[-1], v94));
            uint32x4_t v73 = vmovl_u16(*(uint16x4_t *)v72.i8);
            v74.i64[0] = v73.u32[0];
            v74.i64[1] = v73.u32[1];
            int64x2_t v75 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v73.u32[2];
            v74.i64[1] = v73.u32[3];
            int64x2_t v76 = (int64x2_t)vandq_s8(v74, v92);
            uint32x4_t v77 = vmovl_high_u16(v72);
            v74.i64[0] = v77.u32[0];
            v74.i64[1] = v77.u32[1];
            int64x2_t v78 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v77.u32[2];
            v74.i64[1] = v77.u32[3];
            int64x2_t v79 = (int64x2_t)vandq_s8(v74, v92);
            uint16x8_t v80 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(*v64, v94));
            uint32x4_t v81 = vmovl_u16(*(uint16x4_t *)v80.i8);
            v74.i64[0] = v81.u32[0];
            v74.i64[1] = v81.u32[1];
            int64x2_t v82 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v81.u32[2];
            v74.i64[1] = v81.u32[3];
            int64x2_t v83 = (int64x2_t)vandq_s8(v74, v92);
            uint32x4_t v84 = vmovl_high_u16(v80);
            v74.i64[0] = v84.u32[0];
            v74.i64[1] = v84.u32[1];
            int64x2_t v85 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v84.u32[2];
            v74.i64[1] = v84.u32[3];
            int64x2_t v67 = vaddq_s64(v67, v79);
            int64x2_t v66 = vaddq_s64(v66, v78);
            int64x2_t v62 = vaddq_s64(v62, v76);
            int64x2_t v63 = vaddq_s64(v63, v75);
            int64x2_t v71 = vaddq_s64(v71, (int64x2_t)vandq_s8(v74, v92));
            int64x2_t v70 = vaddq_s64(v70, v85);
            int64x2_t v69 = vaddq_s64(v69, v83);
            int64x2_t v68 = vaddq_s64(v68, v82);
            v64 += 2;
            v65 -= 16;
          }
          while (v65);
          unint64_t v16 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v68, v63), vaddq_s64(v70, v66)), vaddq_s64(vaddq_s64(v69, v62), vaddq_s64(v71, v67))));
          if (Width != v13)
          {
            uint64_t v86 = &v61[v59];
            size_t v87 = Width - v13;
            do
            {
              int v88 = *(unsigned __int16 *)v86;
              v86 += 2;
              if (v88 != v7) {
                ++v16;
              }
              --v87;
            }
            while (v87);
          }
          ++v58;
          v60 += BytesPerRow;
          v59 += BytesPerRow;
          if (v58 == Height) {
            goto LABEL_39;
          }
        }
      }
      else
      {
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        unint64_t v16 = 0;
        while (v16 < v93)
        {
          int v22 = (unsigned __int16 *)((char *)CVPixelBufferGetBaseAddress(a3) + v20);
          size_t v23 = Width;
          do
          {
            int v24 = *v22++;
            if (v24 != v7) {
              ++v16;
            }
            --v23;
          }
          while (v23);
          ++v21;
          v20 += BytesPerRow;
          if (v21 == Height) {
            goto LABEL_39;
          }
        }
      }
LABEL_16:
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return v16 >= v93;
    }
    if (!a6 && !v93)
    {
      unint64_t v16 = 0;
      goto LABEL_16;
    }
    unint64_t v89 = 0;
    uint64_t v90 = a6;
    do
    {
      CVPixelBufferGetBaseAddress(a3);
      --Height;
    }
    while (Height);
  }
  else
  {
    unint64_t v89 = 0;
    uint64_t v90 = a6;
  }
  unint64_t v16 = 0;
LABEL_39:
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (v90)
  {
    float v56 = (double)v16 * 100.0 / (double)v89;
    *uint64_t v90 = v56;
  }
  return v16 >= v93;
}

@end