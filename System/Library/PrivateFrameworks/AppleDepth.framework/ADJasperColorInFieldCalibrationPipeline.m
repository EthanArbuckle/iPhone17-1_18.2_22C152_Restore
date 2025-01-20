@interface ADJasperColorInFieldCalibrationPipeline
+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5;
+ (BOOL)isCroppingPointInThresholdRange:(double)a3 distanceFromSymmetricCroppingPoint:(double)a4 normalizedBySensorDimention:(double)a5 andAllowedDriftFromSymmetricCrop:(float)a6;
+ (BOOL)isInSupportedFormat:(__CVBuffer *)a3;
+ (BOOL)isJasperFrameValid:(id)a3 andPipelineParameters:(id)a4;
- (ADJasperColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4;
- (ADJasperColorInFieldCalibrationPipeline)init;
- (ADJasperColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4;
- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters;
- (BOOL)isAngularVelocityValid:(id)a3;
- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4;
- (BOOL)isSDF:(id)a3;
- (CGRect)calculateJasperFOVInImageWithJasperCalibration:(id)a3 withCameraCalibration:(id)a4 withOriginalImageWidth:(unint64_t)a5 withOriginalImageHeight:(unint64_t)a6 forOutputImageWidth:(unint64_t)a7 forOutputImageHeight:(unint64_t)a8;
- (double)getDeviceFrequency;
- (float)claculateWeightedStd:(ADJasperColorInFieldCalibrationPipeline *)self;
- (float)convertStdToWeight:(float)a3;
- (id).cxx_construct;
- (id)backendInferenceDescriptor;
- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3;
- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4;
- (id)frontendInferenceDescriptor;
- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrotY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 jasperColorInFieldCalibrationResult:(id)a10;
- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6 colorMetadata:(id)a7;
- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5;
- (int64_t)resizeImage:(id)a3 colorImage:(__CVBuffer *)a4 processedColor:(__CVBuffer *)a5 colorMetadata:(id)a6;
- (int64_t)undistortColorImage:(__CVBuffer *)a3 undistortedImage:(__CVBuffer *)a4 calibration:(id)a5;
- (int64_t)validateInternalMemoryStatus:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4;
- (uint64_t)isJasperFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5;
- (uint64_t)preProcessJasper:(__n128)a3 pose:(__n128)a4 prevPose:(__n128)a5 referenceCameraCalibration:(__n128)a6 jasperCameraCalibration:(__n128)a7 reprojectedPointsBuffer:(__n128)a8;
- (uint64_t)updateWmcamToMcamExtrinsics:(__n128)a3;
- (void)dealloc;
- (void)deallocMemory;
- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4;
- (void)setPipelineParameters:(id)a3;
- (void)updateJasperCamera:(id)a3;
- (void)updateLastKnownDepthMap:(id)a3;
@end

@implementation ADJasperColorInFieldCalibrationPipeline

- (ADJasperColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4
{
  id v7 = a3;
  int v34 = 335681116;
  long long v35 = 0u;
  long long v36 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v8 = &_os_log_internal;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v8 = &_os_log_internal;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_215F16000, v8, v9, "Jasper Color In-Field calibration pipeline init for", buf, 2u);
LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)ADJasperColorInFieldCalibrationPipeline;
  v10 = [(ADJasperColorInFieldCalibrationPipeline *)&v32 init];
  v11 = v10;
  v12 = v10;
  if (v10)
  {
    v13 = v10 + 3920096;
    *(_OWORD *)(v10 + 3920120) = 0u;
    *(_OWORD *)(v10 + 3920136) = 0u;
    *((_DWORD *)v10 + 980064) = 1065353216;
    *(_OWORD *)(v10 + 3920152) = 0u;
    objc_storeStrong((id *)v10 + 490049, a3);
    v14 = [*((id *)v11 + 490049) deviceName];
    int v15 = [v14 hasPrefix:@"J7"];
    v16 = &g_streamTrainedCropRect;
    if (v15) {
      v16 = &g_streamTrainedCropRectPad;
    }
    long long v17 = v16[1];
    *(_OWORD *)(v11 + 3920296) = *v16;
    *(_OWORD *)(v11 + 3920312) = v17;

    v12[10] = 0;
    v18 = [*((id *)v11 + 490049) deviceName];
    char v19 = [v18 hasPrefix:@"N301"];

    if (v19)
    {
      if (v12[10] != 1)
      {
        if (!*((void *)v12 + 1)) {
          goto LABEL_19;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v12[10] = 1;
    }
    uint64_t v20 = +[ADNetworkProvider providerForNetwork:@"PeCoNetBackend" espressoEngine:a4];
    v21 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v20;

    uint64_t v22 = +[ADNetworkProvider providerForNetwork:@"PeCoNetFrontend" espressoEngine:a4];
    v23 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v22;

    if (!*((void *)v12 + 1))
    {
LABEL_19:
      v30 = 0;
      goto LABEL_20;
    }
LABEL_16:
    if (*((void *)v12 + 2))
    {
      v24 = [[ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor alloc] initWithNetworkProvider:*((void *)v12 + 1) espressoEngine:a4];
      v25 = (void *)*((void *)v12 + 3);
      *((void *)v12 + 3) = v24;

      v26 = [[ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor alloc] initWithNetworkProvider:*((void *)v12 + 2) espressoEngine:a4 networkFlowType:v12[10]];
      v27 = (void *)*((void *)v12 + 4);
      *((void *)v12 + 4) = v26;

      v28 = [[ADJasperColorInFieldCalibrationControllerParameters alloc] initWithFlowType:v12[10]];
      v29 = *(void **)v13;
      *(void *)v13 = v28;

      *((void *)v13 + 1) = 0;
      [*((id *)v13 + 37) featuresVectorAggregationSize];
      operator new[]();
    }
    goto LABEL_19;
  }
  v30 = (ADJasperColorInFieldCalibrationPipeline *)0;
LABEL_20:
  kdebug_trace();

  return v30;
}

- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [ADJasperColorInFieldCalibrationInterSessionData alloc];
  v6 = [(ADPipelineParameters *)self->_pipelineParameters deviceName];
  id v7 = [(ADJasperColorInFieldCalibrationInterSessionData *)v5 initWithDictionaryRepresentation:v4 andDeviceName:v6];

  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 490014) = 0;
  *((void *)self + 490046) = 0;
  *((void *)self + 490047) = 0;
  *((void *)self + 490045) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_colorInputProcessingSession = &self->_colorInputProcessingSession;
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  value = p_colorInputProcessingSession[31].__ptr_.__value_;
  if (value)
  {
    v5 = p_colorInputProcessingSession[32].__ptr_.__value_;
    v6 = p_colorInputProcessingSession[31].__ptr_.__value_;
    if (v5 != value)
    {
      id v7 = p_colorInputProcessingSession[32].__ptr_.__value_;
      do
      {
        CGFloat width = v7[-1].var7.size.width;
        id v7 = (PixelBufferUtilsSession *)((char *)v7 - 24);
        CGFloat v8 = width;
        if (width != 0.0)
        {
          v5[-1].var7.size.height = v8;
          operator delete(*(void **)&v8);
        }
        v5 = v7;
      }
      while (v7 != value);
      v6 = p_colorInputProcessingSession[31].__ptr_.__value_;
    }
    p_colorInputProcessingSession[32].__ptr_.__value_ = value;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_jasperCalib, 0);
  objc_storeStrong((id *)&self->_colorCalib, 0);
  v10 = p_colorInputProcessingSession->__ptr_.__value_;
  p_colorInputProcessingSession->__ptr_.__value_ = 0;
  if (v10)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v10);
    MEMORY[0x2166C5D90]();
  }
  objc_storeStrong((id *)&self->_controllerParameters, 0);
  objc_storeStrong((id *)&self->_frontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_backendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_frontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_backendNetworkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4
{
  v66[24] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v61 = a4;
  v62 = [v61 inFieldCalibrationTelemetryData];
  v60 = [v62 firedEventTimestampsArray];
  if ([v5 executed])
  {
    [v5 postRelative2FactoryX];
    float v7 = v6;
    [v5 postRelative2FactoryY];
    float v9 = v8;
    [v5 postRelative2FactoryZ];
    analyzeOneShotExtremeRotation(v7, v9, v10, &cfstr_ComAppleApplec_1.isa, v60);
  }
  [v5 confidence];
  [v5 confidence];
  int v12 = v11;
  v66[0] = @"N/A";
  v65[0] = @"JasperPreset";
  v65[1] = @"MaxBackBoneRunTime";
  v59 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v62, "maxBackEndRunTime") / 1000.0);
  v66[1] = v59;
  v65[2] = @"MinBackBoneRunTime";
  v13 = NSNumber;
  double v14 = (double)(unint64_t)[v62 minBackEndRunTime] / 1000.0;
  *(float *)&double v14 = v14;
  v58 = [v13 numberWithFloat:v14];
  v66[2] = v58;
  v65[3] = @"TimeSincePrevRun";
  int v15 = NSNumber;
  double v16 = (double)(unint64_t)[v62 timeSincePrevRun] / 1000.0;
  *(float *)&double v16 = v16;
  v57 = [v15 numberWithFloat:v16];
  v66[3] = v57;
  v65[4] = @"TotalBackBoneTime";
  long long v17 = NSNumber;
  double v18 = (double)(unint64_t)[v62 totalBackEndTime] / 1000.0;
  *(float *)&double v18 = v18;
  v56 = [v17 numberWithFloat:v18];
  v66[4] = v56;
  v65[5] = @"TotalFrontEndTime";
  char v19 = NSNumber;
  double v20 = (double)(unint64_t)[v62 frontEndTime] / 1000.0;
  *(float *)&double v20 = v20;
  v55 = [v19 numberWithFloat:v20];
  v66[5] = v55;
  v65[6] = @"TotalNumRuns";
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v62, "totalNumRuns"));
  v66[6] = v54;
  v65[7] = @"WideAverageNumValidPoints";
  v21 = NSNumber;
  [v62 getAverageNumValidPoints];
  v52 = objc_msgSend(v21, "numberWithFloat:");
  v66[7] = v52;
  v65[8] = @"WideConfidence";
  LODWORD(v22) = v12;
  v53 = [NSNumber numberWithFloat:v22];
  v66[8] = v53;
  v65[9] = @"WideFilteredRotXComparedToFactory";
  v23 = NSNumber;
  [v5 postRelative2FactoryX];
  v51 = objc_msgSend(v23, "numberWithFloat:");
  v66[9] = v51;
  v65[10] = @"WideFilteredRotXComparedToPrev";
  v24 = NSNumber;
  [v5 postRelative2PrevX];
  v50 = objc_msgSend(v24, "numberWithFloat:");
  v66[10] = v50;
  v65[11] = @"WideFilteredRotYComparedToFactory";
  v25 = NSNumber;
  [v5 postRelative2FactoryY];
  v49 = objc_msgSend(v25, "numberWithFloat:");
  v66[11] = v49;
  v65[12] = @"WideFilteredRotYComparedToPrev";
  v26 = NSNumber;
  [v5 postRelative2PrevY];
  v48 = objc_msgSend(v26, "numberWithFloat:");
  v66[12] = v48;
  v65[13] = @"WideFilteredRotZComparedToFactory";
  v27 = NSNumber;
  [v5 postRelative2FactoryZ];
  v47 = objc_msgSend(v27, "numberWithFloat:");
  v66[13] = v47;
  v65[14] = @"WideFilteredRotZComparedToPrev";
  v28 = NSNumber;
  [v5 postRelative2PrevZ];
  v46 = objc_msgSend(v28, "numberWithFloat:");
  v66[14] = v46;
  v65[15] = @"WideNumberOfFrames";
  v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v62, "validPointsSumEventsCount"));
  v66[15] = v45;
  v65[16] = @"WideRotXComparedToFactory";
  v29 = NSNumber;
  [v5 preRelative2FactoryX];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  v66[16] = v30;
  v65[17] = @"WideRotXComparedToPrev";
  v31 = NSNumber;
  [v5 deltaRotationX];
  objc_super v32 = objc_msgSend(v31, "numberWithFloat:");
  v66[17] = v32;
  v65[18] = @"WideRotYComparedToFactory";
  v33 = NSNumber;
  [v5 preRelative2FactoryY];
  int v34 = objc_msgSend(v33, "numberWithFloat:");
  v66[18] = v34;
  v65[19] = @"WideRotYComparedToPrev";
  long long v35 = NSNumber;
  [v5 deltaRotationY];
  long long v36 = objc_msgSend(v35, "numberWithFloat:");
  v66[19] = v36;
  v65[20] = @"WideRotZComparedToFactory";
  v37 = NSNumber;
  [v5 preRelative2FactoryZ];
  v38 = objc_msgSend(v37, "numberWithFloat:");
  v66[20] = v38;
  v65[21] = @"WideRotZComparedToPrev";
  v39 = NSNumber;
  [v5 deltaRotationZ];
  v40 = objc_msgSend(v39, "numberWithFloat:");
  v66[21] = v40;
  v65[22] = @"WideSucceeded";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "executed"));
  v66[22] = v41;
  v65[23] = @"IsFirstTimeForDevice";
  v42 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "isfCapacity") == objc_msgSend(v61, "successfulResultCount"));
  v66[23] = v42;
  v43 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:24];

  id v44 = v43;
  if (AnalyticsSendEventLazy())
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = @"com.apple.applecamerad.JasperToRGB";
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Jasper Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v64 = @"com.apple.applecamerad.JasperToRGB";
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Jasper Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v64 = @"com.apple.applecamerad.JasperToRGB";
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Jasper Color In-Field calibration pipeline Telemetry event %{public}@ failed to fire", buf, 0xCu);
  }
}

id __80__ADJasperColorInFieldCalibrationPipeline_reportTelemetry_withInterSessionData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (float)convertStdToWeight:(float)a3
{
  return 1.0 / (a3 * a3);
}

- (float)claculateWeightedStd:(ADJasperColorInFieldCalibrationPipeline *)self
{
  int v17 = *(_DWORD *)&v2[8];
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffX];
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffY];
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffZ];
  _V1.S[2] = v17;
  __asm { FMLA            S9, S0, V1.S[2] }
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffX];
  float v12 = v11;
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffY];
  float v14 = v12 + v13;
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters coeffZ];
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

- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrotY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 jasperColorInFieldCalibrationResult:(id)a10
{
  uint64_t v198 = *MEMORY[0x263EF8340];
  id v167 = a9;
  id v13 = a10;
  float v14 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationXOutput];
  float v15 = [v14 imageDescriptor];
  unint64_t v16 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v15 pixelFormat], 0);

  int v17 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationYOutput];
  vImagePixelCount v18 = [v17 imageDescriptor];
  unint64_t v19 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v18 pixelFormat], 0);

  double v20 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorXOutput];
  float v21 = [v20 imageDescriptor];
  unint64_t v22 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v21 pixelFormat], 0);

  float v23 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorYOutput];
  v24 = [v23 imageDescriptor];
  unint64_t v25 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v24 pixelFormat], 0);

  [v13 setExecuted:0];
  int32x4_t v186 = 0u;
  int32x4_t v184 = 0u;
  int32x4_t v185 = 0u;
  [v167 jasperToColorRotationAngles];
  long long v172 = v26;
  +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
  float32x4_t v160 = v27;
  float32x4_t v161 = v28;
  float32x4_t v163 = v29;
  long long v182 = 0u;
  long long v183 = 0u;
  anon_3bd140 = (float32x2_t *)self->_anon_3bd140;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  int32x4_t v152 = *(int32x4_t *)&self->_anon_3bd140[16];
  int32x4_t v154 = *(int32x4_t *)self->_anon_3bd140;
  int32x4_t v156 = *(int32x4_t *)&self->_anon_3bd140[32];
  float32x4_t v158 = *(float32x4_t *)self->_anon_70;
  float32x4_t v165 = *(float32x4_t *)&self->_anon_70[16];
  float32x4_t v168 = *(float32x4_t *)&self->_anon_70[32];
  float32x4_t v146 = *(float32x4_t *)&self->_anon_70[48];
  float32x4_t v147 = *(float32x4_t *)&self->_anon_3bd140[48];
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters colorCameraNominalEfl];
  float v32 = (float)(v31 / self->_scale) / self->_colorCameraEfl;
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters colorCameraNominalEfl];
    double colorCameraEfl = self->_colorCameraEfl;
    double scale = self->_scale;
    *(_DWORD *)buf = 134218752;
    double v191 = v32;
    __int16 v192 = 2048;
    double v193 = v36;
    __int16 v194 = 2048;
    double v195 = colorCameraEfl;
    __int16 v196 = 2048;
    double v197 = scale;
    unint64_t v37 = &_os_log_internal;
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters colorCameraNominalEfl];
    double v39 = self->_colorCameraEfl;
    double v40 = self->_scale;
    *(_DWORD *)buf = 134218752;
    double v191 = v32;
    __int16 v192 = 2048;
    double v193 = v41;
    __int16 v194 = 2048;
    double v195 = v39;
    __int16 v196 = 2048;
    double v197 = v40;
    unint64_t v37 = &_os_log_internal;
    os_log_type_t v38 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_215F16000, v37, v38, "postProcessFront: alpha = %f colorCameraNominalEfl = %f double colorCameraEfl = %f scale = %f", buf, 0x2Au);
LABEL_7:
  *(float *)&double v33 = v32;
  [v13 setAlpha:v33];
  if (v16 == 2)
  {
    _H0 = *(_WORD *)a3;
    __asm { FCVT            S0, H0 }
  }
  else
  {
    _S0 = *(float *)a3;
  }
  float v48 = v32 * _S0;
  if (v19 == 2)
  {
    _H1 = *(_WORD *)a4;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a4;
  }
  float v51 = v32 * _S1;
  if (v22 == 2)
  {
    _H2 = *(_WORD *)a6;
    __asm { FCVT            S2, H2 }
  }
  else
  {
    _S2 = *(_DWORD *)a6;
  }
  long long v54 = 0u;
  *(float *)&long long v54 = v48;
  if (v25 == 2)
  {
    _H0 = *(_WORD *)a7;
    __asm { FCVT            S0, H0 }
  }
  else
  {
    _S0 = *(_DWORD *)a7;
  }
  *((float *)&v54 + 1) = v51;
  long long v174 = __PAIR64__(_S0, _S2);
  long long v175 = v54;
  if (self->_networkFlowType)
  {
    float v57 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc rotationZOutput];
    float v58 = [v57 imageDescriptor];
    unint64_t v59 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v58 pixelFormat], 0);

    v60 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc errorZOutput];
    vImage_Buffer v61 = [v60 imageDescriptor];
    unint64_t v62 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v61 pixelFormat], 0);

    if (v59 == 2)
    {
      _H0 = *(_WORD *)a5;
      __asm { FCVT            S0, H0 }
    }
    else
    {
      _S0 = *(float *)a5;
    }
    float v71 = v32 * _S0;
    if (v62 == 2)
    {
      _H1 = *(_WORD *)a8;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(_DWORD *)a8;
    }
    float32x4_t v65 = v168;
    float32x4_t v66 = v165;
    int32x4_t v67 = v156;
    float32x4_t v68 = v158;
    int32x4_t v70 = v152;
    int32x4_t v69 = v154;
    long long v54 = v175;
    *((float *)&v54 + 2) = v71;
    long long v74 = v174;
    DWORD2(v74) = _S1;
    long long v174 = v74;
  }
  else
  {
    float32x4_t v65 = v168;
    float32x4_t v66 = v165;
    int32x4_t v67 = v156;
    float32x4_t v68 = v158;
    int32x4_t v70 = v152;
    int32x4_t v69 = v154;
  }
  float32x4_t v75 = (float32x4_t)vtrn2q_s32(v69, v70);
  v75.i32[2] = v67.i32[1];
  float32x4_t v151 = (float32x4_t)vzip1q_s32(vzip1q_s32(v69, v67), v70);
  float32x4_t v153 = v75;
  float32x4_t v149 = (float32x4_t)vzip1q_s32(vzip2q_s32(v69, v67), vdupq_laneq_s32(v70, 2));
  float32x4_t v76 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v65.f32[0]), v75, *(float32x2_t *)v65.f32, 1), v149, v65, 2);
  float32x4_t v141 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v68.f32[0]), v75, *(float32x2_t *)v68.f32, 1), v149, v68, 2);
  float32x4_t v143 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v66.f32[0]), v75, *(float32x2_t *)v66.f32, 1), v149, v66, 2);
  long long v176 = v54;
  +[ADUtils addAnglesToRotation:angles:](ADUtils, "addAnglesToRotation:angles:", *(double *)v141.i64, *(double *)v143.i64, *(double *)v76.i64, *(_OWORD *)&v141, *(_OWORD *)&v143, *(_OWORD *)&v76);
  int32x4_t v77 = *(int32x4_t *)self->_anon_30;
  int32x4_t v78 = *(int32x4_t *)&self->_anon_30[16];
  int32x4_t v79 = *(int32x4_t *)&self->_anon_30[32];
  int32x4_t v80 = vzip2q_s32(v77, v79);
  float32x4_t v81 = (float32x4_t)vzip1q_s32(vzip1q_s32(v77, v79), v78);
  float32x4_t v82 = (float32x4_t)vtrn2q_s32(v77, v78);
  v82.i32[2] = HIDWORD(*(void *)&self->_anon_30[32]);
  float32x4_t v83 = (float32x4_t)vzip1q_s32(v80, vdupq_laneq_s32(v78, 2));
  float32x4_t v84 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)anon_3bd140->f32)), v82, *anon_3bd140, 1), v83, *(float32x4_t *)anon_3bd140->f32, 2);
  float32x4_t v85 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[16])), v82, *(float32x2_t *)&self->_anon_3bd140[16], 1), v83, *(float32x4_t *)&self->_anon_3bd140[16], 2);
  float32x4_t v86 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[32])), v82, *(float32x2_t *)&self->_anon_3bd140[32], 1), v83, *(float32x4_t *)&self->_anon_3bd140[32], 2);
  float32x4_t v87 = *(float32x4_t *)self->_anon_b0;
  float32x4_t v88 = *(float32x4_t *)&self->_anon_b0[16];
  float32x4_t v89 = *(float32x4_t *)&self->_anon_b0[32];
  float32x4_t v90 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v84.f32[0]), v88, *(float32x2_t *)v84.f32, 1), v89, v84, 2);
  float32x4_t v91 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v85.f32[0]), v88, *(float32x2_t *)v85.f32, 1), v89, v85, 2);
  float32x4_t v92 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v87, v86.f32[0]), v88, *(float32x2_t *)v86.f32, 1), v89, v86, 2);
  float32x4_t v94 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v93.f32[0]), v91, *(float32x2_t *)v93.f32, 1), v92, v93, 2);
  float32x4_t v96 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v95.f32[0]), v91, *(float32x2_t *)v95.f32, 1), v92, v95, 2);
  float32x4_t v157 = v91;
  float32x4_t v159 = v90;
  float32x4_t v155 = v92;
  float32x4_t v98 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, v97.f32[0]), v91, *(float32x2_t *)v97.f32, 1), v92, v97, 2);
  v187.i32[2] = v94.i32[2];
  v188.i32[2] = v96.i32[2];
  v187.i64[0] = v94.i64[0];
  v188.i64[0] = v96.i64[0];
  v189.i32[2] = v98.i32[2];
  v189.i64[0] = v98.i64[0];
  +[ADUtils calcRotationAngle:&v187];
  long long v171 = v99;
  float32x4_t v100 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v187, v160.f32[0]), v188, v161.f32[0]), v189, v163.f32[0]);
  float32x4_t v101 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v187, *(float32x2_t *)v160.f32, 1), v188, *(float32x2_t *)v161.f32, 1), v189, *(float32x2_t *)v163.f32, 1);
  float32x4_t v102 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v187, v160, 2), v188, v161, 2), v189, v163, 2);
  DWORD2(v181) = v100.i32[2];
  DWORD2(v182) = v101.i32[2];
  *(void *)&long long v181 = v100.i64[0];
  *(void *)&long long v182 = v101.i64[0];
  DWORD2(v183) = v102.i32[2];
  *(void *)&long long v183 = v102.i64[0];
  +[ADUtils calcRotationAngle:&v181];
  long long v169 = v103;
  v104 = objc_msgSend(v167, "convertExtrinsicsAnglesToDict:");
  [(ADJasperColorInFieldCalibrationPipeline *)self claculateWeightedStd:*(double *)&v174];
  float v106 = v105;
  objc_msgSend(v13, "setConfidence:");
  [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters maxStdForValidResult];
  if (v106 > *(float *)&v107)
  {
    long long v164 = 0u;
    [v13 setExecutionStatus:-22976];
    float32x4_t v166 = 0u;
    long long v162 = 0u;
LABEL_35:

    [v13 setDeltaRotationX:*(double *)&v176];
    HIDWORD(v132) = DWORD1(v176);
    LODWORD(v132) = DWORD1(v176);
    [v13 setDeltaRotationY:v132];
    objc_msgSend(v13, "setDeltaRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v176), DWORD2(v176))));
    [v13 setStdX:*(double *)&v174];
    HIDWORD(v133) = DWORD1(v174);
    LODWORD(v133) = DWORD1(v174);
    [v13 setStdY:v133];
    objc_msgSend(v13, "setStdZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v174), DWORD2(v174))));
    [v13 setAbsoluteRotationX:*(double *)&v171];
    HIDWORD(v134) = DWORD1(v171);
    LODWORD(v134) = DWORD1(v171);
    [v13 setAbsoluteRotationY:v134];
    objc_msgSend(v13, "setAbsoluteRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v171), DWORD2(v171))));
    [v13 setFactoryRotationX:*(double *)&v172];
    HIDWORD(v135) = DWORD1(v172);
    LODWORD(v135) = DWORD1(v172);
    [v13 setFactoryRotationY:v135];
    objc_msgSend(v13, "setFactoryRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v172), DWORD2(v172))));
    [v13 setAbsoluteRotationPostISFX:*(double *)&v164];
    HIDWORD(v136) = DWORD1(v164);
    LODWORD(v136) = DWORD1(v164);
    [v13 setAbsoluteRotationPostISFY:v136];
    objc_msgSend(v13, "setAbsoluteRotationPostISFZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v164), DWORD2(v164))));
    [v13 setPreRelative2FactoryX:*(double *)&v169];
    HIDWORD(v137) = DWORD1(v169);
    LODWORD(v137) = DWORD1(v169);
    [v13 setPreRelative2FactoryY:v137];
    objc_msgSend(v13, "setPreRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), DWORD2(v169))));
    [v13 setPostRelative2FactoryX:*(double *)v166.i64];
    HIDWORD(v138) = v166.i32[1];
    LODWORD(v138) = v166.i32[1];
    [v13 setPostRelative2FactoryY:v138];
    objc_msgSend(v13, "setPostRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(v166.u32[1], v166.u32[2])));
    [v13 setPostRelative2PrevX:*(double *)&v162];
    HIDWORD(v139) = DWORD1(v162);
    LODWORD(v139) = DWORD1(v162);
    [v13 setPostRelative2PrevY:v139];
    objc_msgSend(v13, "setPostRelative2PrevZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v162), DWORD2(v162))));
    [v13 setMotionRotation:*(void *)&anon_3bd140[17]];
    [v13 setMotionTranslation:*(void *)&anon_3bd140[18]];
    [v13 setValidDepthPercentage:*(void *)&anon_3bd140[19]];
    int64_t v111 = 0;
    goto LABEL_36;
  }
  *(float *)&double v107 = v106;
  [(ADJasperColorInFieldCalibrationPipeline *)self convertStdToWeight:v107];
  id v177 = 0;
  uint64_t v109 = [v167 insertEntryAndCalculate:v104 withWeight:&v177 toResult:v108];
  id v110 = v177;
  if (!v109)
  {
    objc_msgSend(v167, "setSuccessfulResultCount:", objc_msgSend(v167, "successfulResultCount") + 1);
    [v13 setExecutionStatus:0];
    [v167 convertDictToExtrinsicsAngles:v110];
    float32x4_t v166 = v112;
    +[ADUtils calcRotationMatrix:*(double *)v112.i64];
    float32x4_t v116 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v160.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v160.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v160, 2), v115);
    float32x4_t v117 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v161.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v161.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v161, 2), v115);
    float32x4_t v118 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v113, v163.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v163.f32, 1), v114), (float32x4_t)vdupq_laneq_s32((int32x4_t)v163, 2), v115);
    v184.i32[2] = v116.i32[2];
    v185.i32[2] = v117.i32[2];
    v184.i64[0] = v116.i64[0];
    v185.i64[0] = v117.i64[0];
    v186.i32[2] = v118.i32[2];
    v186.i64[0] = v118.i64[0];
    +[ADUtils calcRotationAngle:&v184];
    long long v164 = v119;
    float32x4_t v120 = vsubq_f32(v146, v147);
    float32x4_t v121 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v151, v120.f32[0]), v153, *(float32x2_t *)v120.f32, 1), v149, v120, 2);
    objc_msgSend(v13, "setJasperToColorExtrinsics:", *(double *)v184.i64, *(double *)v185.i64, *(double *)v186.i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v121.f32[0]), v157, *(float32x2_t *)v121.f32, 1), v155, v121, 2).i64);
    [v13 setExecuted:1];
    float32x4_t v122 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v142.f32[0]), v157, *(float32x2_t *)v142.f32, 1), v155, v142, 2);
    float32x4_t v123 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v144.f32[0]), v157, *(float32x2_t *)v144.f32, 1), v155, v144, 2);
    float32x4_t v124 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v159, v145.f32[0]), v157, *(float32x2_t *)v145.f32, 1), v155, v145, 2);
    float32x4_t v125 = (float32x4_t)vzip1q_s32(vzip1q_s32(v184, v186), v185);
    float32x4_t v126 = (float32x4_t)vtrn2q_s32(v184, v185);
    v126.i32[2] = v186.i32[1];
    float32x4_t v127 = (float32x4_t)vzip1q_s32(vzip2q_s32(v184, v186), vdupq_laneq_s32(v185, 2));
    float32x4_t v128 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v122.f32[0]), v126, *(float32x2_t *)v122.f32, 1), v127, v122, 2);
    float32x4_t v129 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v123.f32[0]), v126, *(float32x2_t *)v123.f32, 1), v127, v123, 2);
    float32x4_t v130 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, v124.f32[0]), v126, *(float32x2_t *)v124.f32, 1), v127, v124, 2);
    DWORD2(v178) = v128.i32[2];
    DWORD2(v179) = v129.i32[2];
    *(void *)&long long v178 = v128.i64[0];
    *(void *)&long long v179 = v129.i64[0];
    DWORD2(v180) = v130.i32[2];
    *(void *)&long long v180 = v130.i64[0];
    +[ADUtils calcRotationAngle:&v178];
    long long v162 = v131;

    goto LABEL_35;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "postProcessFront failed to update intersession entry", buf, 2u);
  }

  int64_t v111 = -22950;
LABEL_36:

  return v111;
}

- (ADJasperColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryJasperToColorTransform:(double)a3 currentJasperToColorTransform:(double)a4
{
  unint64_t v9 = -[ADJasperColorInFieldCalibrationInterSessionData initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:]([ADJasperColorInFieldCalibrationInterSessionData alloc], "initWithFactoryJasperToColorTransform:currentJasperToColorTransform:andFlowType:", *(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8, a9);
  return v9;
}

- (id)frontendInferenceDescriptor
{
  return self->_frontendInferenceDesc;
}

- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor *)self->_backendInferenceDesc featuresOutput];
  float v10 = [v9 imageDescriptor];
  unint64_t v11 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v10 pixelFormat], 0);

  float v12 = [(ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *)self->_frontendInferenceDesc featuresInput];
  id v13 = [v12 imageDescriptor];
  unint64_t v14 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)[v13 pixelFormat], 0);

  if (v11 == 2 && v14 == 2)
  {
    unsigned int v15 = [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
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
              float v43 = (float16x8_t *)((char *)a3 + 2 * (v28 + v42));
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
      long long v103 = (int16x8_t *)((char *)a4 + 16);
      uint64_t v104 = v90;
      do
      {
        v103[-1] = v102;
        *long long v103 = v102;
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
    float v106 = (char *)a4 + 2 * v90;
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
    unsigned int v21 = [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v22 = v8;
    unsigned int v23 = 0;
    unsigned int v24 = 1;
    while ([v22 count] > (unint64_t)v23)
    {
      long long v26 = [v22 objectAtIndexedSubscript:v23];
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
        uint64_t v109 = (int32x4_t *)((char *)a4 + 16);
        uint64_t v110 = v101;
        do
        {
          v109[-1] = v108;
          *uint64_t v109 = v108;
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
            float32x4_t v66 = (float16x8_t *)((char *)a3 + 2 * (v56 + v65));
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
    unsigned int v49 = [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v50 = v8;
    unsigned int v51 = 0;
    unsigned int v52 = 1;
    while ([v50 count] > (unint64_t)v51)
    {
      long long v54 = [v50 objectAtIndexedSubscript:v51];
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
    unsigned int v73 = [(ADJasperColorInFieldCalibrationPipelineParameters *)self->_pipelineParameters featuresVectorAggregationSize];
    id v74 = v8;
    unsigned int v75 = 0;
    unsigned int v76 = 1;
    while ([v74 count] > (unint64_t)v75)
    {
      int32x4_t v78 = [v74 objectAtIndexedSubscript:v75];
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

- (uint64_t)preProcessJasper:(__n128)a3 pose:(__n128)a4 prevPose:(__n128)a5 referenceCameraCalibration:(__n128)a6 jasperCameraCalibration:(__n128)a7 reprojectedPointsBuffer:(__n128)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v17 = a11;
  id v18 = a12;
  uint64_t v19 = a1 + 3920096;
  if ((objc_msgSend((id)a1, "isJasperFrameValid:pose:prevPose:", v17, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0], a9.n128_f64[0]) & 1) == 0&& !objc_msgSend(*(id *)(a1 + 3920392), "forceRun"))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int32x2_t v25 = &_os_log_internal;
      long long v26 = "ADJasperColorInFieldCalibration jasper controller fail";
      uint32_t v27 = 2;
LABEL_15:
      _os_log_impl(&dword_215F16000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    }
LABEL_16:
    uint64_t v28 = -22964;
    goto LABEL_23;
  }
  objc_msgSend(*(id *)v19, "sceneDiversityMinDepthDiff", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6, *(_OWORD *)&a7, *(_OWORD *)&a8, *(_OWORD *)&a9);
  if (v20 > 0.0 && [*(id *)v19 sceneDiversityMinChangedSpots])
  {
    if (*(void *)(a1 + 3920368) == *(void *)(a1 + 3920360))
    {
      [(id)a1 updateLastKnownDepthMap:v17];
      goto LABEL_18;
    }
    if ([(id)a1 isSDF:v17] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 3920392), "forceRun"))
    {
      [(id)a1 updateLastKnownDepthMap:v17];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *(_DWORD *)(a1 + 3920384);
        *(_DWORD *)buf = 67109120;
        int v47 = v21;
        id v22 = &_os_log_internal;
        unsigned int v23 = "ADJasperColorInFieldCalibration jasper controller pass %d good spots";
        uint32_t v24 = 8;
LABEL_12:
        _os_log_impl(&dword_215F16000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = *(_DWORD *)(a1 + 3920384);
      *(_DWORD *)buf = 67109120;
      int v47 = v37;
      int32x2_t v25 = &_os_log_internal;
      long long v26 = "ADJasperColorInFieldCalibration jasper controller fail for only %d good spots";
      uint32_t v27 = 8;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v22 = &_os_log_internal;
    unsigned int v23 = "ADJasperColorInFieldCalibration jasper controller pass";
    uint32_t v24 = 2;
    goto LABEL_12;
  }
LABEL_18:
  [v18 referenceDimensions];
  double v30 = v29;
  [v18 referenceDimensions];
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    double v32 = *(double *)(a1 + 3920264);
    double v33 = *(double *)(a1 + 3920272);
    double v30 = *(double *)(a1 + 3920280);
    double v34 = *(double *)(a1 + 3920288);
  }
  else
  {
    double v34 = v31;
    double v33 = 0.0;
    double v32 = 0.0;
  }
  uint64_t v28 = objc_msgSend(v17, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", 0, a14, v32, v33, v30, v34);
  if (!v28)
  {
    int v35 = *(unsigned __int8 *)(a1 + 3920352);
    uint64_t v28 = 0;
    *(unsigned char *)(v19 + 256) = (v35 + 1) % [*(id *)(v19 + 296) featuresVectorAggregationSize];
  }
LABEL_23:

  return v28;
}

- (BOOL)isSDF:(id)a3
{
  p_controllerParameters = &self->_controllerParameters;
  id v4 = a3;
  if ([(ADJasperColorInFieldCalibrationControllerParameters *)p_controllerParameters[37] disableSDF])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 0;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ADJasperColorInFieldCalibration, NOTE: SDF is disabled by user!", (uint8_t *)v21, 2u);
    }
    BOOL v5 = 1;
  }
  else
  {
    *((_DWORD *)p_controllerParameters + 72) = 0;
    LODWORD(v6) = [v4 length];
    float v7 = (float *)[v4 euclideanDistances];
    id v8 = (unsigned __int8 *)[v4 bankIds];
    unint64_t v9 = (unsigned __int8 *)[v4 spotIds];
    unsigned int v10 = [(ADJasperColorInFieldCalibrationControllerParameters *)*p_controllerParameters sceneDiversityMinChangedSpots];
    if (v6)
    {
      uint64_t v6 = v6;
      do
      {
        unsigned int v12 = *v8++;
        unsigned int v11 = v12;
        id v13 = p_controllerParameters[33];
        if (0xAAAAAAAAAAAAAAABLL * (((char *)p_controllerParameters[34] - (char *)v13) >> 3) > v12)
        {
          unint64_t v14 = *v9;
          id v16 = &v13->super.isa + 3 * v11;
          Class v15 = *v16;
          if (v14 < (v16[1] - *v16) >> 2)
          {
            float v17 = *((float *)v15 + v14);
            if (v17 > 0.0)
            {
              float v18 = *v7;
              [(ADJasperColorInFieldCalibrationControllerParameters *)*p_controllerParameters sceneDiversityMinDepthDiff];
              if (vabds_f32(v17, v18) > v19) {
                ++*((_DWORD *)p_controllerParameters + 72);
              }
            }
          }
        }
        ++v9;
        ++v7;
        --v6;
      }
      while (v6);
    }
    BOOL v5 = *((_DWORD *)p_controllerParameters + 72) >= v10;
  }

  return v5;
}

- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6 colorMetadata:(id)a7
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  kdebug_trace();
  int64_t v15 = [(ADJasperColorInFieldCalibrationPipeline *)self validateInternalMemoryStatus:a3 processedColor:a4];
  if (v15) {
    goto LABEL_2;
  }
  p_colorImageRaw = &self->_colorImageRaw;
  int networkFlowType = self->_networkFlowType;
  if (!networkFlowType)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    if (PixelFormatType != CVPixelBufferGetPixelFormatType(a3))
    {
      value = self->_colorInputProcessingSession.__ptr_.__value_;
      if (!value)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "init colorInput ProcessingSession", buf, 2u);
        }
        int v21 = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a3);
        CVPixelBufferGetPixelFormatType(*p_colorImageRaw);
        size_t Width = CVPixelBufferGetWidth(a3);
        size_t Height = CVPixelBufferGetHeight(a3);
        v27.vImagePixelCount width = (double)Width;
        v27.vImagePixelCount height = (double)Height;
        v28.vImagePixelCount width = (double)Width;
        v28.vImagePixelCount height = (double)Height;
        PixelBufferUtilsSession::createCropScaleConvertRotateSession(v21, v27, v28, *MEMORY[0x263F001A0]);
      }
      if (!PixelBufferUtilsSession::run(value, a3, *p_colorImageRaw))
      {
        int64_t v15 = -22966;
        goto LABEL_2;
      }
      a3 = *p_colorImageRaw;
    }
    int networkFlowType = self->_networkFlowType;
    if (networkFlowType != 1) {
      goto LABEL_5;
    }
LABEL_15:
    int64_t v15 = [(ADJasperColorInFieldCalibrationPipeline *)self resizeImage:v13 colorImage:a3 processedColor:a4 colorMetadata:v14];
    goto LABEL_2;
  }
  if (networkFlowType == 1) {
    goto LABEL_15;
  }
LABEL_5:
  if (networkFlowType)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = networkFlowType;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "JasperColorInfieldCalibration unfamiliar network flow type %d", buf, 8u);
    }
    int64_t v15 = -22950;
  }
  else
  {
    int64_t v15 = [(ADJasperColorInFieldCalibrationPipeline *)self undistortColorImage:a3 undistortedImage:a4 calibration:v13];
    self->_double scale = 1.0;
  }
LABEL_2:
  kdebug_trace();

  return v15;
}

- (int64_t)validateInternalMemoryStatus:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4
{
  if (self->_networkFlowType) {
    return 0;
  }
  p_colorImageRaw = &self->_colorImageRaw;
  colorImageRaw = self->_colorImageRaw;
  if (colorImageRaw)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(colorImageRaw);
    if (PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
    {
      size_t Width = CVPixelBufferGetWidth(*p_colorImageRaw);
      if (Width == CVPixelBufferGetWidth(a3))
      {
        size_t Height = CVPixelBufferGetHeight(*p_colorImageRaw);
        if (Height == CVPixelBufferGetWidth(a3)) {
          return 0;
        }
      }
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "init color image raw buffer and reseting colorInput ProcessingSession", buf, 2u);
  }
  CVPixelBufferRelease(*p_colorImageRaw);
  unsigned int v11 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  *p_colorImageRaw = 0;
  p_colorImageRaw[1] = 0;
  if (v11)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v11);
    MEMORY[0x2166C5D90]();
  }
  OSType v12 = CVPixelBufferGetPixelFormatType(a4);
  size_t v13 = CVPixelBufferGetWidth(a3);
  size_t v14 = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  CVReturn v17 = CVPixelBufferCreate(v15, v13, v14, v12, BufferAttributes, &pixelBufferOut);
  CVPixelBufferRef v18 = pixelBufferOut;
  if (v17) {
    CVPixelBufferRef v18 = 0;
  }
  *p_colorImageRaw = v18;
  if (v18)
  {
    float v19 = +[ADUtils getStandardNameForBufferOfType:@"colorImageRaw" moduleName:@"RGBJ"];
    +[ADUtils updatePixelBufferIOSurfaceLabel:v19 pixelBuffer:*p_colorImageRaw];

    return 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v21 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "fail to create colorImageRaw", v21, 2u);
  }
  return -22965;
}

- (int64_t)resizeImage:(id)a3 colorImage:(__CVBuffer *)a4 processedColor:(__CVBuffer *)a5 colorMetadata:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (!v11)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      int64_t v14 = -22950;
      goto LABEL_13;
    }
    LOWORD(v30) = 0;
    CGSize v27 = &_os_log_internal;
    CGSize v28 = "missing meta data for resizing";
LABEL_16:
    _os_log_error_impl(&dword_215F16000, v27, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v30, 2u);
    goto LABEL_12;
  }
  size_t Width = CVPixelBufferGetWidth(a5);
  size_t Height = CVPixelBufferGetHeight(a5);
  int64_t v14 = -22950;
  if (Width && Height)
  {
    size_t v15 = CVPixelBufferGetWidth(a4);
    size_t v16 = CVPixelBufferGetHeight(a4);
    if (![(ADJasperColorInFieldCalibrationPipeline *)self isColorFrameValid:a4 withMetadata:v11])goto LABEL_12; {
    p_double scale = &self->_scale;
    }
    objc_msgSend(MEMORY[0x263F26C68], "calcSensorCrop:onImageWithDimensions:metadataDictionary:negativeCropHandling:", v11, 2, *((double *)p_scale + 5), *((double *)p_scale + 6), *((double *)p_scale + 7), *((double *)p_scale + 8), (double)v15, (double)v16);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;
    CGFloat v25 = v24;
    *((double *)p_scale + 1) = v18;
    *((double *)p_scale + 2) = v20;
    *((double *)p_scale + 3) = v22;
    *((double *)p_scale + 4) = v24;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218752;
      double v31 = v23;
      __int16 v32 = 2048;
      CGFloat v33 = v25;
      __int16 v34 = 2048;
      CGFloat v35 = v19;
      __int16 v36 = 2048;
      CGFloat v37 = v21;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "AD-RGBJ controller final buffer crop    size.width:%.2f, size.height:%.2f, origin.x:%.2f, origin.y:%.2f", (uint8_t *)&v30, 0x2Au);
      CGFloat v19 = *((double *)p_scale + 1);
      CGFloat v21 = *((double *)p_scale + 2);
      double v23 = *((double *)p_scale + 3);
      CGFloat v25 = *((double *)p_scale + 4);
    }
    float v26 = (double)Width / v23;
    *p_double scale = v26;
    v39.origin.x = v19;
    v39.origin.y = v21;
    v39.size.vImagePixelCount width = v23;
    v39.size.vImagePixelCount height = v25;
    if (!PixelBufferUtils::cropAndScalePixelBuffer(a4, a5, (__CVBuffer *)1, v39, *MEMORY[0x263F001A8]))
    {
      int64_t v14 = 0;
      goto LABEL_13;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v30) = 0;
    CGSize v27 = &_os_log_internal;
    CGSize v28 = "cropAndScalePixelBuffer failed";
    goto LABEL_16;
  }
LABEL_13:

  return v14;
}

- (CGRect)calculateJasperFOVInImageWithJasperCalibration:(id)a3 withCameraCalibration:(id)a4 withOriginalImageWidth:(unint64_t)a5 withOriginalImageHeight:(unint64_t)a6 forOutputImageWidth:(unint64_t)a7 forOutputImageHeight:(unint64_t)a8
{
  double v8 = floor((double)a6 / (double)a8) * (double)a8;
  double v9 = floor((double)a5 / (double)a7) * (double)a7;
  double v10 = floor(((double)a5 - v9) * 0.5) + 0.0;
  double v11 = floor(((double)a6 - v8) * 0.5) + 0.0;
  double v12 = (double)a7 / (double)a8;
  BOOL v13 = v9 / v8 == v12;
  BOOL v14 = v9 / v8 < v12;
  double v15 = v11 + floor((v8 - (double)(unint64_t)(v9 / (double)a7 * (double)a8)) * 0.5);
  double v16 = (double)(unint64_t)(v8 / (double)a8 * (double)a7);
  double v17 = v10 + floor((v9 - v16) * 0.5);
  if (v14 || v13)
  {
    double v11 = v15;
    double v16 = v9;
  }
  else
  {
    double v10 = v17;
  }
  if (v14 || v13) {
    double v8 = (double)(unint64_t)(v9 / (double)a7 * (double)a8);
  }
  result.size.vImagePixelCount height = v8;
  result.size.vImagePixelCount width = v16;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4
{
  id v9 = a7;
  double v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  double v11 = (unint64_t *)(a1 + 3920120);
  int v12 = *(_DWORD *)(a1 + 40);
  if (!v12)
  {
    id v14 = objc_alloc(MEMORY[0x263F26CB8]);
    [v10 intrinsicMatrix];
    double v41 = v16;
    double v42 = v15;
    double v40 = v17;
    [v10 pixelSize];
    int v19 = v18;
    [v10 referenceDimensions];
    LODWORD(v20) = v19;
    BOOL v13 = objc_msgSend(v14, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", 0, v42, v41, v40, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v20, v21, v22);
    [v13 referenceDimensions];
    if (v23 == 864.0)
    {
      [v13 referenceDimensions];
      if (v24 == 704.0) {
        objc_msgSend(v13, "crop:", 0.0, -4.0, 872.0, 712.0);
      }
    }
    objc_msgSend(v13, "centerCrop:", 866.0, 710.0);
    objc_msgSend(v13, "scale:", 644.0, 528.0);
    objc_msgSend(v13, "centerCrop:", 464.0, 528.0);
    [v13 referenceDimensions];
    double v26 = v25;
    [v13 referenceDimensions];
    unint64_t v28 = (unint64_t)v27 * (unint64_t)v26;
    if (*v11 != v28)
    {
      [(id)a1 deallocMemory];
      operator new[]();
    }
    if (*(void **)(a1 + 3920168) != v10
      || (uint32x4_t v29 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920208), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920192), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920224), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920240), a5))), v29.i32[3] = v29.i32[2], (vminvq_u32(v29) & 0x80000000) == 0))
    {
      [v13 transform:v28 points:*(void *)(a1 + 3920144) toCamera:v10 outPoints:*(void *)(a1 + 3920152)];
      [v10 project:v28 points:*(void *)(a1 + 3920152) outUndistortedPixels:*(void *)(a1 + 3920160)];
      [v10 distort:v28 undistortedPixels:*(void *)(a1 + 3920160) outDistorted:a1 + 224];
    }
    unint64_t *v11 = v28;
    objc_storeStrong((id *)(a1 + 3920168), a7);
    goto LABEL_14;
  }
  if (v12 != 1)
  {
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  BOOL v13 = (void *)[v9 mutableCopy];
LABEL_14:
  *(float32x4_t *)(a1 + 3920192) = a2;
  *(float32x4_t *)(a1 + 3920208) = a3;
  *(float32x4_t *)(a1 + 3920224) = a4;
  *(float32x4_t *)(a1 + 3920240) = a5;
  [v13 intrinsicMatrix];
  *(_DWORD *)(a1 + 44) = v30;
  [v10 cameraToPlatformTransform];
  *(_DWORD *)(a1 + 56) = v31;
  *(void *)(a1 + 48) = v32;
  *(_DWORD *)(a1 + 72) = v33;
  *(_DWORD *)(a1 + 88) = v34;
  *(void *)(a1 + 64) = v35;
  *(void *)(a1 + 80) = v36;
  *(_DWORD *)(a1 + 104) = v37;
  *(void *)(a1 + 96) = v38;
LABEL_15:

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

- (void)updateJasperCamera:(id)a3
{
  objc_storeStrong((id *)&self->_jasperCalib, a3);
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

- (uint64_t)isJasperFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5
{
  return isJasperFrameValidImpl(a11, *(void **)(a1 + 3920392), *(void **)(a1 + 3920096), (_OWORD *)(*(void *)(a1 + 3920328) + 16 * *(unsigned __int8 *)(a1 + 3920352)), (float32x4_t *)(*(void *)(a1 + 3920336) + 16 * *(unsigned __int8 *)(a1 + 3920352)), (unsigned char *)(*(void *)(a1 + 3920344) + *(unsigned __int8 *)(a1 + 3920352)), a2, a3, a4, a5, a6, a7, a8, a9);
}

- (BOOL)isAngularVelocityValid:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_networkFlowType == 1
    && ([(ADJasperColorInFieldCalibrationPipeline *)self getDeviceFrequency],
        *(float *)&double v5 = v5,
        [MEMORY[0x263F26C68] getAngularVelocityFromMetadataDictionary:v4 deviceClock:*(float *)&v5],
        float v7 = v6,
        [(ADJasperColorInFieldCalibrationControllerParameters *)self->_controllerParameters thresholdAngularVelocity], v7 >= v8))
  {
    BOOL v9 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      [(ADJasperColorInFieldCalibrationControllerParameters *)self->_controllerParameters thresholdAngularVelocity];
      int v12 = 134218240;
      double v13 = v7;
      __int16 v14 = 2048;
      double v15 = v11;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "High Angular velocity of %f detected against threshold of %f", (uint8_t *)&v12, 0x16u);
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return isColorFrameValidImpl(a3, (NSDictionary *)a4, self->_pipelineParameters, self->_controllerParameters);
}

- (double)getDeviceFrequency
{
  v2 = [(ADPipelineParameters *)self->_pipelineParameters deviceName];
  v3 = [v2 uppercaseString];

  if (([v3 containsString:@"J717"] & 1) == 0
    && ([v3 containsString:@"J718"] & 1) == 0
    && ([v3 containsString:@"J720"] & 1) == 0
    && ([v3 containsString:@"J721"] & 1) == 0
    && ([v3 containsString:@"D93"] & 1) == 0
    && ([v3 containsString:@"D94"] & 1) == 0
    && ([v3 containsString:@"D83"] & 1) == 0
    && ([v3 containsString:@"D84"] & 1) == 0)
  {
    NSLog(&cfstr_UnknownDeviceF.isa, v3);
  }

  return 24000000.0;
}

- (void)dealloc
{
  [(ADJasperColorInFieldCalibrationPipeline *)self deallocMemory];
  uint64_t v3 = *(void *)self->_motionRotationAngles;
  if (v3) {
    MEMORY[0x2166C5D70](v3, 0x1000C80451B5BE8);
  }
  uint64_t v4 = *(void *)self->_motionTranslation;
  if (v4) {
    MEMORY[0x2166C5D70](v4, 0x1000C80451B5BE8);
  }
  validDepthPercentage = self->_validDepthPercentage;
  if (validDepthPercentage) {
    MEMORY[0x2166C5D70](validDepthPercentage, 0x1000C8077774924);
  }
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "pipeline terminated", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ADJasperColorInFieldCalibrationPipeline;
  [(ADJasperColorInFieldCalibrationPipeline *)&v6 dealloc];
}

- (void)deallocMemory
{
  p_colorImageRaw = &self->_colorImageRaw;
  zVals = self->_zVals;
  if (zVals) {
    MEMORY[0x2166C5D70](zVals, 0x1000C8052888210);
  }
  double v5 = p_colorImageRaw[4];
  if (v5) {
    MEMORY[0x2166C5D70](v5, 0x1000C80451B5BE8);
  }
  objc_super v6 = p_colorImageRaw[5];
  if (v6) {
    MEMORY[0x2166C5D70](v6, 0x1000C80451B5BE8);
  }
  float v7 = p_colorImageRaw[6];
  if (v7) {
    MEMORY[0x2166C5D70](v7, 0x1000C80451B5BE8);
  }
  float v8 = p_colorImageRaw[7];
  if (v8) {
    MEMORY[0x2166C5D70](v8, 0x1000C80451B5BE8);
  }
  BOOL v9 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  p_colorImageRaw[1] = 0;
  if (v9)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v9);
    MEMORY[0x2166C5D90]();
  }
  *(_OWORD *)&self->_rectifiedPoints = 0u;
  *(_OWORD *)self->_origWorldPoints = 0u;
  *(_OWORD *)&self->_referenceCameraNumOfPoints = 0u;
  CVPixelBufferRelease(*p_colorImageRaw);
  *p_colorImageRaw = 0;
}

- (ADJasperColorInFieldCalibrationPipeline)init
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(ADJasperColorInFieldCalibrationPipeline *)self initWithParameters:v3 espressoEngine:4];

  return v4;
}

- (void)updateLastKnownDepthMap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 length];
  uint64_t v6 = [v4 euclideanDistances];
  float v7 = (unsigned __int8 *)[v4 bankIds];
  float v8 = (unsigned __int8 *)[v4 spotIds];
  p_lastKnownPointsCollectionVec = &self->_lastKnownPointsCollectionVec;
  begin = self->_lastKnownPointsCollectionVec.__begin_;
  end = self->_lastKnownPointsCollectionVec.__end_;
  uint64_t v12 = end - begin;
  if (end != begin)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    do
    {
      uint64_t v15 = *(void *)&begin[24 * v13];
      uint64_t v16 = *(void *)&begin[24 * v13 + 8] - v15;
      if (v16)
      {
        unint64_t v17 = v16 >> 2;
        if (v17 <= 1) {
          unint64_t v18 = 1;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18 > 0x13 && (v18 ? (BOOL v19 = (v18 - 1) >> 32 == 0) : (BOOL v19 = 0), v19))
        {
          unint64_t v20 = v18 & 0xFFFFFFFFFFFFFFF8;
          double v23 = *(_OWORD **)&begin[24 * v13];
          unint64_t v24 = v18 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            _OWORD *v23 = 0uLL;
            v23[1] = 0uLL;
            v23 += 2;
            v24 -= 8;
          }
          while (v24);
          int v21 = v18 & 0xFFFFFFF8;
          if (v18 == v20) {
            goto LABEL_3;
          }
        }
        else
        {
          unint64_t v20 = 0;
          int v21 = 0;
        }
        unsigned int v22 = v21 + 1;
        do
        {
          *(_DWORD *)(v15 + 4 * v20) = 0;
          unint64_t v20 = v22++;
        }
        while (v17 > v20);
      }
LABEL_3:
      ++v13;
    }
    while (v14 > v13);
  }
  if (!v5) {
    goto LABEL_86;
  }
  uint64_t v90 = (int *)v6;
  id v91 = v4;
  uint64_t v25 = 0;
  long long v26 = 0uLL;
  uint64_t v95 = v8;
  BOOL v96 = &self->_lastKnownPointsCollectionVec;
  uint64_t v93 = v7;
  uint64_t v94 = v5;
  do
  {
    unint64_t v28 = v7[v25];
    uint32x4_t v29 = (char *)p_lastKnownPointsCollectionVec->__begin_;
    int v30 = (char *)p_lastKnownPointsCollectionVec->__end_;
    unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (char *)p_lastKnownPointsCollectionVec->__begin_) >> 3);
    if (v31 <= v28)
    {
      unint64_t v32 = v28 + 1;
      unint64_t v33 = v28 + 1 - v31;
      value = p_lastKnownPointsCollectionVec->__end_cap_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((value - v30) >> 3) >= v33)
      {
        if (v32 != v31)
        {
          bzero(p_lastKnownPointsCollectionVec->__end_, 24 * ((24 * v33 - 24) / 0x18) + 24);
          long long v26 = 0uLL;
          float v8 = v95;
          v30 += 24 * ((24 * v33 - 24) / 0x18) + 24;
        }
        p_lastKnownPointsCollectionVec->__end_ = v30;
      }
      else
      {
        unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((value - v29) >> 3);
        if (2 * v35 > v32) {
          unint64_t v32 = 2 * v35;
        }
        if (v35 >= 0x555555555555555) {
          unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v36 = v32;
        }
        if (v36 > 0xAAAAAAAAAAAAAAALL) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        int v37 = (char *)operator new(24 * v36);
        uint64_t v38 = &v37[24 * v31];
        CGRect v39 = &v37[24 * v36];
        bzero(v38, 24 * ((24 * v33 - 24) / 0x18) + 24);
        double v40 = &v38[24 * ((24 * v33 - 24) / 0x18) + 24];
        if (v30 == v29)
        {
          p_lastKnownPointsCollectionVec = v96;
          v96->__begin_ = v38;
          v96->__end_ = v40;
          v96->__end_cap_.__value_ = v39;
          long long v26 = 0uLL;
        }
        else
        {
          p_lastKnownPointsCollectionVec = v96;
          long long v26 = 0uLL;
          do
          {
            double v41 = v38;
            *((void *)v38 - 2) = 0;
            *((void *)v38 - 1) = 0;
            long long v42 = *(_OWORD *)(v30 - 24);
            v30 -= 24;
            *(_OWORD *)(v38 - 24) = v42;
            v38 -= 24;
            *((void *)v41 - 1) = *((void *)v30 + 2);
            *(void *)int v30 = 0;
            *((void *)v30 + 1) = 0;
            *((void *)v30 + 2) = 0;
          }
          while (v30 != v29);
          int v30 = (char *)v96->__begin_;
          float v43 = (char *)v96->__end_;
          v96->__begin_ = v38;
          v96->__end_ = v40;
          v96->__end_cap_.__value_ = v39;
          if (v43 != v30)
          {
            float16x8_t v44 = v43;
            do
            {
              float32x4_t v46 = (void *)*((void *)v44 - 3);
              v44 -= 24;
              float32x4_t v45 = v46;
              if (v46)
              {
                *((void *)v43 - 2) = v45;
                operator delete(v45);
                long long v26 = 0uLL;
              }
              float v43 = v44;
            }
            while (v44 != v30);
          }
        }
        float v8 = v95;
        if (v30)
        {
          operator delete(v30);
          long long v26 = 0uLL;
          float v8 = v95;
        }
      }
      uint32x4_t v29 = (char *)p_lastKnownPointsCollectionVec->__begin_;
    }
    unint64_t v47 = v8[v25];
    uint64_t v48 = &v29[24 * v28];
    unsigned int v49 = (char **)(v48 + 8);
    id v50 = (char *)*((void *)v48 + 1);
    unsigned int v51 = *(char **)v48;
    uint64_t v52 = (uint64_t)&v50[-*(void *)v48];
    uint64_t v53 = v52 >> 2;
    if (v52 >> 2 <= v47)
    {
      int v97 = 0;
      unint64_t v54 = v47 + 1;
      unint64_t v55 = v47 + 1 - v53;
      uint64_t v56 = &v29[24 * v28];
      uint64_t v59 = *((void *)v56 + 2);
      float v58 = v56 + 16;
      uint64_t v57 = v59;
      if (v55 > (v59 - (uint64_t)v50) >> 2)
      {
        uint64_t v60 = v57 - (void)v51;
        unint64_t v61 = v60 >> 1;
        if (v60 >> 1 <= v54) {
          unint64_t v61 = v54;
        }
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v61 = 0x3FFFFFFFFFFFFFFFLL;
        }
        if (v61 >> 62) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        unint64_t v92 = v61;
        unint64_t v62 = operator new(4 * v61);
        v63 = (uint64_t *)&v62[4 * v53];
        BOOL v64 = (uint64_t *)&v62[4 * v54];
        unint64_t v65 = (v55 - 1) & 0x3FFFFFFFFFFFFFFFLL;
        float32x4_t v66 = v63;
        float v7 = v93;
        long long v26 = 0uLL;
        if (v65 >= 0x13)
        {
          if (v63 >= &v98 || (float32x4_t v66 = (uint64_t *)&v62[4 * v53], &v62[4 * v55 + v52] <= (unsigned char *)&v97))
          {
            uint64_t v67 = (v65 + 1) & 0x7FFFFFFFFFFFFFF8;
            float32x4_t v68 = &v62[4 * v53];
            uint64_t v69 = v67;
            do
            {
              *float32x4_t v68 = 0uLL;
              v68[1] = 0uLL;
              v68 += 2;
              v69 -= 8;
            }
            while (v69);
            if (v65 + 1 == v67) {
              goto LABEL_65;
            }
            float32x4_t v66 = (uint64_t *)((char *)v63 + 4 * v67);
          }
        }
        int v70 = v97;
        do
        {
          *(_DWORD *)float32x4_t v66 = v70;
          float32x4_t v66 = (uint64_t *)((char *)v66 + 4);
        }
        while (v66 != v64);
LABEL_65:
        if (v50 != v51)
        {
          unint64_t v71 = v50 - v51 - 4;
          if (v71 < 0x2C) {
            goto LABEL_91;
          }
          if ((unint64_t)(v50 - &v62[v52]) < 0x20) {
            goto LABEL_91;
          }
          uint64_t v72 = (v71 >> 2) + 1;
          unsigned int v73 = &v62[4 * v53 - 16];
          id v74 = v50 - 16;
          uint64_t v75 = v72 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v76 = *(_OWORD *)v74;
            *(v73 - 1) = *((_OWORD *)v74 - 1);
            *unsigned int v73 = v76;
            v73 -= 2;
            v74 -= 32;
            v75 -= 8;
          }
          while (v75);
          v63 = (uint64_t *)((char *)v63 - 4 * (v72 & 0x7FFFFFFFFFFFFFF8));
          v50 -= 4 * (v72 & 0x7FFFFFFFFFFFFFF8);
          if (v72 != (v72 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_91:
            do
            {
              int v77 = *((_DWORD *)v50 - 1);
              v50 -= 4;
              *((_DWORD *)v63 - 1) = v77;
              v63 = (uint64_t *)((char *)v63 - 4);
            }
            while (v50 != v51);
          }
        }
        *(void *)uint64_t v48 = v63;
        *((void *)v48 + 1) = v64;
        void *v58 = &v62[4 * v92];
        if (v51)
        {
          operator delete(v51);
          long long v26 = 0uLL;
        }
        goto LABEL_24;
      }
      if (v54 == v53)
      {
        float v7 = v93;
        unsigned char *v49 = v50;
LABEL_24:
        float v8 = v95;
        goto LABEL_25;
      }
      int32x4_t v78 = &v50[4 * v55];
      unint64_t v79 = (v55 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      float v7 = v93;
      if (v79 >= 0xF && (v50 >= (char *)&v98 || &v50[4 * v55] <= (char *)&v97))
      {
        unint64_t v80 = v79 + 1;
        uint64_t v81 = v50;
        uint64_t v82 = v80 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          *(_OWORD *)uint64_t v81 = v26;
          *((_OWORD *)v81 + 1) = v26;
          v81 += 32;
          v82 -= 8;
        }
        while (v82);
        if (v80 == (v80 & 0x7FFFFFFFFFFFFFF8)) {
          goto LABEL_83;
        }
        v50 += 4 * (v80 & 0x7FFFFFFFFFFFFFF8);
      }
      do
      {
        *(_DWORD *)id v50 = v97;
        v50 += 4;
      }
      while (v50 != v78);
LABEL_83:
      unsigned char *v49 = v78;
      goto LABEL_24;
    }
LABEL_25:
    ++v25;
    uint64_t v27 = v94;
    p_lastKnownPointsCollectionVec = v96;
  }
  while (v25 != v94);
  float v83 = v96->__begin_;
  uint64_t v84 = v90;
  id v4 = v91;
  do
  {
    int v85 = *v84++;
    int v86 = v85;
    unsigned int v88 = *v7++;
    unsigned int v87 = v88;
    unsigned int v89 = *v8++;
    *(_DWORD *)(v83[3 * v87] + 4 * v89) = v86;
    --v27;
  }
  while (v27);
LABEL_86:
}

+ (BOOL)isJasperFrameValid:(id)a3 andPipelineParameters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = [v6 deviceName];
  int v8 = [v7 hasPrefix:@"N301"];

  BOOL v9 = [[ADJasperColorInFieldCalibrationControllerParameters alloc] initWithFlowType:v8 ^ 1u];
  LOBYTE(v8) = isJasperFrameValidImpl(v5, v6, v9, 0, 0, 0, *MEMORY[0x263EF89A8], *(float32x4_t *)(MEMORY[0x263EF89A8] + 16), *(float32x4_t *)(MEMORY[0x263EF89A8] + 32), *(float32x4_t *)(MEMORY[0x263EF89A8] + 48), *MEMORY[0x263EF89A8], *(int32x4_t *)(MEMORY[0x263EF89A8] + 16), *(int32x4_t *)(MEMORY[0x263EF89A8] + 32), *(int32x4_t *)(MEMORY[0x263EF89A8] + 48));

  return v8;
}

+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5
{
  float v7 = (NSDictionary *)a4;
  int v8 = (ADJasperColorInFieldCalibrationPipelineParameters *)a5;
  BOOL v9 = [(ADPipelineParameters *)v8 deviceName];
  int v10 = [v9 hasPrefix:@"N301"];

  float v11 = [[ADJasperColorInFieldCalibrationControllerParameters alloc] initWithFlowType:v10 ^ 1u];
  LOBYTE(a3) = isColorFrameValidImpl(a3, v7, v8, v11);

  return (char)a3;
}

+ (BOOL)isCroppingPointInThresholdRange:(double)a3 distanceFromSymmetricCroppingPoint:(double)a4 normalizedBySensorDimention:(double)a5 andAllowedDriftFromSymmetricCrop:(float)a6
{
  return vabdd_f64(a4, a3) / a5 < a6;
}

+ (BOOL)isInSupportedFormat:(__CVBuffer *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"AD-RGBJ controller CVPixelBufferGetPixelFormatType:%c%c%c%c \n", HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
    id v4 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = [v4 UTF8String];
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  BOOL result = 1;
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType > 2084070959)
    {
      if (PixelFormatType != 2084070960 && PixelFormatType != 2084075056 && PixelFormatType != 2088269360) {
        return 0;
      }
    }
    else if (PixelFormatType != 875704438 && PixelFormatType != 1882468912 && PixelFormatType != 2016686640)
    {
      return 0;
    }
  }
  else if (PixelFormatType > 758674991)
  {
    if (PixelFormatType != 758674992 && PixelFormatType != 762869296 && PixelFormatType != 875704422) {
      return 0;
    }
  }
  else if (PixelFormatType != 641234480 && PixelFormatType != 645428784 && PixelFormatType != 758670896)
  {
    return 0;
  }
  return result;
}

@end