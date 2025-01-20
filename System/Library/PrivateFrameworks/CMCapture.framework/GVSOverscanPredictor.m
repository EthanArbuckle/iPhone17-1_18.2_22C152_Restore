@interface GVSOverscanPredictor
- (BOOL)predictOverscanFitsFromMetadata:(id)a3 finalCropRect:(CGRect)a4 boundingRect:(CGRect)a5;
- (GVSOverscanPredictor)initWithConfig:(VISOverscanPredictorConfiguration)a3 cameraInfoByPortType:(id)a4 visInputPixelBufferAttributes:(id)a5;
- (__n64)estimateOverscanUseFromRotation:(float32x4_t)a3 focalLength:(float32x4_t)a4 cornerCoords:;
- (int)computeFocalLength:(float *)a3 fromMetadata:(id)a4;
- (int)estimateOverscanUseFromMetadata:(id)a3 finalCropRect:(CGRect)a4;
- (int)parseCameraInfoByPortType:(id)a3;
- (void)resetAndClear;
- (void)resetPrediction;
- (void)setCameraAlignmentForPortType:(id)a3;
@end

@implementation GVSOverscanPredictor

- (GVSOverscanPredictor)initWithConfig:(VISOverscanPredictorConfiguration)a3 cameraInfoByPortType:(id)a4 visInputPixelBufferAttributes:(id)a5
{
  v6 = v5;
  id v9 = a5;
  id v10 = v6;
  v21.receiver = self;
  v21.super_class = (Class)GVSOverscanPredictor;
  v11 = [(GVSOverscanPredictor *)&v21 init];
  v12 = (float32x2_t *)v11;
  if (v11)
  {
    *(void *)v11->_margin = *((void *)a4 + 1);
    double v13 = *((float *)a4 + 4);
    v11->_detectionTimeoutSeconds = v13;
    v11->_resetTimeoutSeconds = v13;
    v14 = [VISRotationCorrectionEstimator alloc];
    LODWORD(v15) = *(_DWORD *)a4;
    uint64_t v16 = [(VISRotationCorrectionEstimator *)v14 initWithTimeScale:v15];
    v17 = (void *)v12[11];
    v12[11] = (float32x2_t)v16;

    if (!*(void *)&v12[11]
      || !FigCFDictionaryGetInt32IfPresent()
      || !FigCFDictionaryGetInt32IfPresent())
    {
      goto LABEL_14;
    }
    v12[2] = 0;
    v12[3] = vmul_f32(vcvt_f32_s32(vadd_s32(0, (int32x2_t)-1)), (float32x2_t)0x3F0000003F000000);
    float32x2_t v18 = v12[1];
    if (v18.f32[0] < 0.0)
    {
      v18.f32[0] = (float)0 * 8388600.0;
      v12[1] = v18;
    }
    if (v18.f32[1] < 0.0)
    {
      v18.f32[1] = (float)0 * 8388600.0;
      v12[1] = v18;
    }
    [(float32x2_t *)v12 resetAndClear];
    if ([(float32x2_t *)v12 parseCameraInfoByPortType:v9]
      || !*(void *)&v12[12])
    {
LABEL_14:
      fig_log_get_emitter();
      FigDebugAssert3();
      v19 = 0;
      goto LABEL_13;
    }
    objc_storeStrong((id *)&v12[10], (id)*MEMORY[0x1E4F52DD8]);
    [(float32x2_t *)v12 setCameraAlignmentForPortType:*(void *)&v12[10]];
  }
  v19 = v12;
LABEL_13:

  return v19;
}

- (int)parseCameraInfoByPortType:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  pixelSizeByPortType = [v3 allKeys];
  uint64_t v6 = [pixelSizeByPortType countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x1E4F52D28];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(pixelSizeByPortType);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = [v3 objectForKeyedSubscript:v11];
        double v13 = [v12 objectForKeyedSubscript:v9];
        v14 = v13;
        if (!v13 || ([v13 floatValue], v15 <= 0.0))
        {
          fig_log_get_emitter();
          FigDebugAssert3();

          int v17 = -12780;
          goto LABEL_12;
        }
        [v4 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v7 = [pixelSizeByPortType countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = v4;
  int v17 = 0;
  pixelSizeByPortType = self->_pixelSizeByPortType;
  self->_pixelSizeByPortType = v16;
LABEL_12:

  return v17;
}

- (void)setCameraAlignmentForPortType:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4F52DF8]])
  {
    int8x16_t v4 = (int8x16_t)xmmword_1A5F0C8A0;
  }
  else
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F52E10]]) {
      unsigned int v5 = -1;
    }
    else {
      unsigned int v5 = 0;
    }
    int8x16_t v4 = vbslq_s8((int8x16_t)vdupq_n_s32(v5), (int8x16_t)xmmword_1A5F0C8A0, (int8x16_t)xmmword_1A5F0C8B0);
  }
  *(int8x16_t *)self->_anon_20 = v4;
}

- (void)resetAndClear
{
  self->_latestSampleTimestamp = 0.0;
  *(_OWORD *)self->_estimatedCorrection = 0u;
  *(_OWORD *)self->_estimatedOverscan = 0u;
  [(GVSOverscanPredictor *)self resetPrediction];
  visEstimator = self->_visEstimator;
  [(VISRotationCorrectionEstimator *)visEstimator reset];
}

- (void)resetPrediction
{
  self->_overscanFitsTimestamp = -1.0;
}

- (int)computeFocalLength:(float *)a3 fromMetadata:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54118]];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v9 = [(NSDictionary *)self->_pixelSizeByPortType objectForKeyedSubscript:v8];
  if (a3)
  {
    if (v7 && ([v7 floatValue], v10 > 0.0) && v8 && v9)
    {
      uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54148]];
      if ((int)[v11 intValue] < 1) {
        int32x2_t v12 = (int32x2_t)0x100000001;
      }
      else {
        int32x2_t v12 = vdup_n_s32([v11 intValue]);
      }
      int32x2_t v18 = v12;

      float v19 = 1.0;
      int v13 = FigMotionComputeLensPositionScalingFactor((const __CFDictionary *)v6, *(void *)self->_imageSize, HIDWORD(*(void *)self->_imageSize), v18.i32[0], v18.u32[1], &v19);
      if (v13)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        [v7 floatValue];
        float v15 = v14;
        [v9 floatValue];
        *a3 = (float)(v15 / v16) * v19;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v13 = -12780;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v13 = -12782;
  }

  return v13;
}

- (__n64)estimateOverscanUseFromRotation:(float32x4_t)a3 focalLength:(float32x4_t)a4 cornerCoords:
{
  float32x2_t v4 = vrecpe_f32((float32x2_t)a2.u32[0]);
  LODWORD(v5) = vmul_f32(v4, vrecps_f32((float32x2_t)a2.u32[0], v4)).u32[0];
  v4.i32[0] = a1.n128_i32[2];
  float32x4_t v6 = vmulq_n_f32(a3, v5);
  float v7 = vminvq_f32(a3);
  float v8 = vmaxvq_f32(a3);
  float32x4_t v9 = vmlaq_lane_f32(vmlsq_lane_f32(a3, a4, v4, 0), (float32x4_t)vdupq_lane_s32(a2, 0), (float32x2_t)a1.n128_u64[0], 1);
  float32x4_t v10 = vmulq_n_f32(a4, v5);
  __asm { FMOV            V4.4S, #1.0 }
  float32x4_t v16 = vmlaq_n_f32(_Q4, v10, a1.n128_f32[0]);
  a1.n128_u32[0] = a1.n128_u32[1];
  float32x4_t v17 = vmlsq_lane_f32(v16, v6, (float32x2_t)a1.n128_u64[0], 0);
  v10.i64[0] = 0x3400000034000000;
  v10.i64[1] = 0x3400000034000000;
  int8x16_t v18 = (int8x16_t)vmaxnmq_f32(vabsq_f32(v17), v10);
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  float32x4_t v19 = (float32x4_t)vbslq_s8((int8x16_t)v10, (int8x16_t)v17, v18);
  float32x4_t v20 = vrecpeq_f32(v19);
  float32x4_t v21 = vmulq_f32(v9, vmulq_f32(v20, vrecpsq_f32(v19, v20)));
  result.n64_f32[0] = v7 - vminvq_f32(v21);
  result.n64_f32[1] = vmaxvq_f32(v21) - v8;
  return result;
}

- (int)estimateOverscanUseFromMetadata:(id)a3 finalCropRect:(CGRect)a4
{
  id v5 = a3;
  float32x4_t v6 = [v5 allKeys];
  char v7 = [v6 containsObject:*MEMORY[0x1E4F53F90]];

  if ((v7 & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = -12780;
    goto LABEL_13;
  }
  int v30 = 0;
  int MotionDataFromISP = FigMotionGetMotionDataFromISP((CFDictionaryRef)v5, (float64x2_t *)self->_rawQuaternionArray, 0, 36, &v30, 0, 0, 0, 0);
  if (MotionDataFromISP)
  {
    int v26 = MotionDataFromISP;
    fig_log_get_emitter();
LABEL_18:
    FigDebugAssert3();
    goto LABEL_13;
  }
  if (v30 <= 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = 0;
    goto LABEL_13;
  }
  int v29 = 0;
  int v9 = [(GVSOverscanPredictor *)self computeFocalLength:&v29 fromMetadata:v5];
  if (v9)
  {
    int v26 = v9;
    fig_log_get_emitter();
    goto LABEL_18;
  }
  int v10 = v30;
  if (v30 < 1)
  {
    float32x4_t v14 = 0uLL;
  }
  else
  {
    uint64_t v11 = 0;
    double latestSampleTimestamp = self->_latestSampleTimestamp;
    p_timestamp = &self->_rawQuaternionArray[0].timestamp;
    float32x4_t v14 = 0uLL;
    do
    {
      if (*p_timestamp > latestSampleTimestamp)
      {
        float32x4_t v28 = v14;
        float v15 = p_timestamp[2];
        float v16 = p_timestamp[3];
        float v17 = p_timestamp[4];
        float v18 = p_timestamp[1];
        float32x4_t v19 = *(float32x4_t *)self->_anon_20;
        int32x4_t v20 = (int32x4_t)vnegq_f32(v19);
        int8x16_t v21 = (int8x16_t)vtrn2q_s32((int32x4_t)v19, vtrn1q_s32((int32x4_t)v19, v20));
        float32x4_t v22 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v20, 8uLL), v16), (float32x4_t)vextq_s8(v21, v21, 8uLL), v15);
        float32x4_t v23 = (float32x4_t)vrev64q_s32((int32x4_t)v19);
        v23.i32[0] = v20.i32[1];
        v23.i32[3] = v20.i32[2];
        [(VISRotationCorrectionEstimator *)self->_visEstimator updateWithRotation:*(double *)vaddq_f32(v22, vmlaq_n_f32(vmulq_n_f32(v19, v18), v23, v17)).i64 atTime:*p_timestamp];
        [(VISRotationCorrectionEstimator *)self->_visEstimator estimatedCorrection];
        *(_OWORD *)self->_estimatedCorrection = v24;
        -[GVSOverscanPredictor estimateOverscanUseFromRotation:focalLength:cornerCoords:](self, "estimateOverscanUseFromRotation:focalLength:cornerCoords:");
        float32x4_t v14 = vmaxnmq_f32(v28, v25);
        double latestSampleTimestamp = *p_timestamp;
        self->_double latestSampleTimestamp = *p_timestamp;
        int v10 = v30;
      }
      ++v11;
      p_timestamp += 6;
    }
    while (v11 < v10);
  }
  int v26 = 0;
  *(float32x4_t *)self->_estimatedOverscan = v14;
LABEL_13:

  return v26;
}

- (BOOL)predictOverscanFitsFromMetadata:(id)a3 finalCropRect:(CGRect)a4 boundingRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double v12 = a4.origin.y;
  double v13 = a4.origin.x;
  id v15 = a3;
  float v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  float v17 = [v15 allKeys];
  char v18 = [v17 containsObject:*MEMORY[0x1E4F53F90]];

  if ((v18 & 1) == 0 || !v16) {
    goto LABEL_16;
  }
  if (![(NSString *)self->_previousPort isEqualToString:v16])
  {
    [(GVSOverscanPredictor *)self setCameraAlignmentForPortType:v16];
    objc_storeStrong((id *)&self->_previousPort, v16);
  }
  int v19 = -[GVSOverscanPredictor estimateOverscanUseFromMetadata:finalCropRect:](self, "estimateOverscanUseFromMetadata:finalCropRect:", v15, v13, v12, v11, v10);
  if (v19)
  {
    int v30 = v19;
    fig_log_get_emitter();
    uint64_t v32 = v5;
    LODWORD(v31) = v30;
LABEL_17:
    FigDebugAssert3();
    [(GVSOverscanPredictor *)self resetPrediction];
    BOOL v28 = 0;
    goto LABEL_12;
  }
  double overscanFitsTimestamp = self->_overscanFitsTimestamp;
  if (overscanFitsTimestamp < 0.0)
  {
    double overscanFitsTimestamp = self->_latestSampleTimestamp + self->_resetTimeoutSeconds;
    self->_double overscanFitsTimestamp = overscanFitsTimestamp;
  }
  v22.f32[0] = v13 - x;
  *(float *)v20.i32 = v12 - y;
  float v23 = width - v11;
  float v24 = height - v10;
  v22.f32[1] = v23 - v22.f32[0];
  v22.i64[1] = __PAIR64__(v24 - *(float *)v20.i32, v20.u32[0]);
  v20.i64[0] = *(void *)self->_margin;
  float32x4_t v25 = vsubq_f32(v22, (float32x4_t)vzip1q_s32(v20, v20));
  if (vminvq_f32(v25) <= 0.0)
  {
LABEL_16:
    fig_log_get_emitter();
    uint64_t v32 = v5;
    LODWORD(v31) = 0;
    goto LABEL_17;
  }
  float v26 = vminvq_f32(vsubq_f32(v25, *(float32x4_t *)self->_estimatedOverscan));
  double latestSampleTimestamp = self->_latestSampleTimestamp;
  if (v26 <= 0.0)
  {
    double overscanFitsTimestamp = fmax(overscanFitsTimestamp, latestSampleTimestamp + self->_detectionTimeoutSeconds);
    self->_double overscanFitsTimestamp = overscanFitsTimestamp;
  }
  BOOL v28 = latestSampleTimestamp > overscanFitsTimestamp;
LABEL_12:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelSizeByPortType, 0);
  objc_storeStrong((id *)&self->_visEstimator, 0);
  objc_storeStrong((id *)&self->_previousPort, 0);
}

@end