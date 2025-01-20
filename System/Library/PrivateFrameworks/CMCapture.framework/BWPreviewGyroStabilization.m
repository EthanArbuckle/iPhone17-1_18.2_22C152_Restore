@interface BWPreviewGyroStabilization
- ($01BB1521EC52D44A8E7628F5261DCEC8)_adjustQuaternionForSagRemoval:(id)a3 focalLength:(float)a4;
- (PreviewStabilizationFrameRateCompensatedParameter)_updateTripodSmoothParametersWithSphereVideoEnabled:(SEL)a3 frameRateNormalization:(BOOL)a4;
- (float)_computeSmoothParameterForNonStationaryCaseWithPanningStatus:(BOOL)a3 frameIsSphereStabilized:(BOOL)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8;
- (float)_computeSmoothParameterForPhysicalTripod:(BOOL)a3 lowpassParameter:(float)a4 previousLowPassParameter:(float)a5 frameRateNormalization:(float)a6;
- (float)_computeSmoothParameterForStationaryCaseWithPanningStatus:(BOOL)a3 translation:(float)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8;
- (id)initForStillImagePreview:(BOOL)a3;
- (int)_computeMotionStatisticsWithQuaternion:(id *)a3 focalLength:(float)a4 maxAngleAccumulateOut:(double *)a5 maxAngleInstantOut:(double *)a6 translationOut:;
- (int)_extractMetadataFromTopToBottomRowsFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4 quaternion:(id *)a5;
- (int)_getAllMetadataFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4;
- (int)_limitSmoothParameterToOverscanWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 minSmoothParameter:(float)a5 smoothParameterInOut:(float *)a6;
- (int)computeStabilizationShiftUsingMetadata:(id)a3 pixelBufferDimensions:(id)a4 pixelSizeInMicrons:(float)a5 stabilizationShiftOut:(CGPoint *)a6;
- (void)_adjustSmoothParameterWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 reduceSmoothParameterForLowLight:(BOOL)a5;
- (void)_applyCascadeFiltering:(id *)a3 quaternion:(id)a4 lowpassParameter:(float)a5 cascadeLevel:(int)a6;
- (void)_setDefaultParametersForStillImagePreview:(BOOL)a3 isFrontCamera:(BOOL)a4;
- (void)dealloc;
@end

@implementation BWPreviewGyroStabilization

- (void)_adjustSmoothParameterWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 reduceSmoothParameterForLowLight:(BOOL)a5
{
  BOOL v5 = a5;
  p_lowpassParameter = &self->_lowpassParameter;
  double frameRateNormalizationFactor = self->_frameRateNormalizationFactor;
  int var3 = a4->var3;
  BOOL v12 = a4->var3 != 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  [(BWPreviewGyroStabilization *)self _updateTripodSmoothParametersWithSphereVideoEnabled:v12 frameRateNormalization:frameRateNormalizationFactor];
  if ([(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection empty]) {
    v14 = (float *)&v52;
  }
  else {
    v14 = p_lowpassParameter;
  }
  float v15 = *v14;
  double v50 = 2.0;
  double v51 = 0.0;
  double v49 = 2.0;
  *(float *)&double v13 = a4->var1;
  [(BWPreviewGyroStabilization *)self _computeMotionStatisticsWithQuaternion:a3 focalLength:&v49 maxAngleAccumulateOut:&v50 maxAngleInstantOut:&v51 translationOut:v13];
  int v48 = 0;
  BOOL v16 = [(BWPreviewGyroStabilizationPanningDetection *)self->_previewPanningDetection detectPanningUsingTranslation:&v48 maxAvgTranslationOut:v51];
  HIDWORD(v18) = HIDWORD(v49);
  HIDWORD(v17) = HIDWORD(v50);
  *(float *)&double v17 = v50;
  *(float *)&double v18 = v49;
  float v19 = frameRateNormalizationFactor;
  *(float *)&double v20 = v19;
  [(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection detectTripodStateUsingMaxAngleInstant:v17 maxAngleAccumulate:v18 frameRateNormalizationFactor:v20];
  if ([(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection isStationary])
  {
    LODWORD(v21) = v48;
    LODWORD(v23) = v54;
    LODWORD(v24) = v53;
    LODWORD(v25) = v52;
    *(float *)&double v22 = v15;
    [(BWPreviewGyroStabilization *)self _computeSmoothParameterForStationaryCaseWithPanningStatus:v16 translation:v21 previousLowPassParameter:v22 rampDownRate:v23 rampUpRate:v24 targetSmoothParameter:v25];
  }
  else
  {
    v27 = (char *)&v53 + 4;
    double deltaFrameTime = self->_deltaFrameTime;
    double v29 = (float)(fmaxf(fabsf(*(float *)&v51), fabsf(*((float *)&v51 + 1))) / a4->var1) / deltaFrameTime;
    *(float *)&double v29 = v29;
    if (p_lowpassParameter[37] < *(float *)&v29) {
      v27 = (char *)&v54 + 4;
    }
    LODWORD(deltaFrameTime) = *(_DWORD *)v27;
    LODWORD(v23) = v53;
    LODWORD(v24) = v52;
    *(float *)&double v29 = v15;
    [(BWPreviewGyroStabilization *)self _computeSmoothParameterForNonStationaryCaseWithPanningStatus:v16 frameIsSphereStabilized:var3 != 0 previousLowPassParameter:v29 rampDownRate:deltaFrameTime rampUpRate:v23 targetSmoothParameter:v24];
  }
  float v30 = fminf(fmaxf(v26, fminf(p_lowpassParameter[21], *(float *)&v52)), *((float *)&v52 + 1));
  float v31 = fmaxf(v15 - *((float *)&v53 + 1), 0.4);
  if (v5) {
    float v32 = v31;
  }
  else {
    float v32 = v30;
  }
  BOOL v33 = [(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection isLikelyPhysicalTripod];
  BOOL v34 = [(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection isPhysicalTripod];
  if (v33)
  {
    *(float *)&double v35 = v32;
    *(float *)&double v36 = v15;
    *(float *)&double v37 = frameRateNormalizationFactor;
    [(BWPreviewGyroStabilization *)self _computeSmoothParameterForPhysicalTripod:v34 lowpassParameter:v35 previousLowPassParameter:v36 frameRateNormalization:v37];
    float v39 = v38;
  }
  else
  {
    float v40 = 0.08 / frameRateNormalizationFactor + v15;
    float v39 = fminf(v32, v40);
    float v41 = 0.005 / frameRateNormalizationFactor;
    p_lowpassParameter[11] = v41;
  }
  long double quaternionThreshold = self->_quaternionThreshold;
  double v43 = fabs(FigMotionMultiplyByInverseOfQuaternion(&self->_stabilizedCenterQuaternion[0].w, (uint64_t *)a3));
  if (v43 < quaternionThreshold)
  {
    double v44 = acos(quaternionThreshold);
    long double v45 = acos(v43);
    float v46 = v44 / (v45 + v45);
    if (v39 > v46) {
      float v39 = v46;
    }
  }
  float v47 = v39;
  if (var3
    && v39 > *(float *)&v52
    && !-[BWPreviewGyroStabilization _limitSmoothParameterToOverscanWithQuaternion:cameraMetadata:minSmoothParameter:smoothParameterInOut:](self, "_limitSmoothParameterToOverscanWithQuaternion:cameraMetadata:minSmoothParameter:smoothParameterInOut:", a3, a4, &v47))
  {
    float v39 = v47;
  }
  float *p_lowpassParameter = v39;
}

- (PreviewStabilizationFrameRateCompensatedParameter)_updateTripodSmoothParametersWithSphereVideoEnabled:(SEL)a3 frameRateNormalization:(BOOL)a4
{
  float var2 = self[1136].var2;
  float v6 = self[1136].var3 + self[1136].var4 * a5;
  float v7 = self[1136].var5 + self[1137].var0 * a5;
  if (a4)
  {
    float v7 = v7 + 0.02;
    float v6 = v6 + 0.1;
  }
  float v8 = fminf(var2, v6);
  float v9 = fminf(var2, v7);
  double v10 = (float)(v9 - v8) / a5;
  *(float *)&double v10 = v10;
  retstr->var0 = v8;
  retstr->var1 = v9;
  *(float32x4_t *)&retstr->float var2 = vdivq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v10, 0), vcvtq_f32_s32(*(int32x4_t *)&self[1137].var1));
  return self;
}

- (float)_computeSmoothParameterForStationaryCaseWithPanningStatus:(BOOL)a3 translation:(float)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8
{
  float result = fmaxf(a8, a5 - a6);
  float v9 = a5 + a7;
  if (!a3) {
    return v9;
  }
  return result;
}

- (float)_computeSmoothParameterForPhysicalTripod:(BOOL)a3 lowpassParameter:(float)a4 previousLowPassParameter:(float)a5 frameRateNormalization:(float)a6
{
  if (!a3) {
    return fminf(a4, a5);
  }
  float v6 = fminf(self->_physicalTripodRate * 1.3, 1.0);
  self->_physicalTripodRate = v6;
  return fmaxf(self->_physicalTripodMinSmoothParameter, a5 - (float)(v6 / a6));
}

- (int)_computeMotionStatisticsWithQuaternion:(id *)a3 focalLength:(float)a4 maxAngleAccumulateOut:(double *)a5 maxAngleInstantOut:(double *)a6 translationOut:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 && a5 && a6 && (float v9 = v6) != 0)
  {
    *float v6 = 0;
    double v13 = fabs(FigMotionMultiplyByInverseOfQuaternion(&a3->var0, (uint64_t *)self->_stabilizedCenterQuaternion));
    double v14 = 2.0;
    if (v13 <= 2.0) {
      double v15 = v13;
    }
    else {
      double v15 = 2.0;
    }
    v23[0] = FigMotionMultiplyByInverseOfQuaternion(&a3->var0, (uint64_t *)&self->_lowpassQuaternionsInstant);
    v23[1] = v16;
    v23[2] = v17;
    v23[3] = v18;
    double v19 = fabs(v23[0]);
    if (v19 <= 2.0) {
      double v14 = v19;
    }
    pgs_inverseRotationMatrixFromQuaternion(v23, (uint64_t)v24);
    if (fabsf(v27) <= 0.00000001)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v20 = FigSignalErrorAt();
      float32x2_t v21 = 0;
    }
    else
    {
      int v20 = 0;
      float32x2_t v21 = vmul_n_f32((float32x2_t)__PAIR64__(v26, v25), a4 / v27);
    }
    *float v9 = v21;
    *a6 = acos(v14) * self->_frameRateNormalizationFactor;
    *a5 = acos(v15) * sqrt(self->_frameRateNormalizationFactor);
    return v20;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)computeStabilizationShiftUsingMetadata:(id)a3 pixelBufferDimensions:(id)a4 pixelSizeInMicrons:(float)a5 stabilizationShiftOut:(CGPoint *)a6
{
  p_isFirstFrame = &self->_isFirstFrame;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_49;
  }
  self->_transformContext.width = a4.var0;
  p_transformContext = &self->_transformContext;
  self->_transformContext.height = a4.var1;
  self->_transformContext.imageCenter.int x = ((double)a4.var0 + -1.0) * 0.5;
  p_imageCenter = &self->_transformContext.imageCenter;
  self->_transformContext.imageCenter.y = ((double)a4.var1 + -1.0) * 0.5;
  if (a5 <= 0.0) {
    float v12 = 1.0;
  }
  else {
    float v12 = 1.0 / a5;
  }
  self->_transformContext.pixelsPerMicron = v12;
  long long v66 = 0u;
  long long v67 = 0u;
  memset(v59, 0, sizeof(v59));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  int v13 = -[BWPreviewGyroStabilization _extractMetadataFromTopToBottomRowsFromDictionary:cameraMetadata:quaternion:](self, "_extractMetadataFromTopToBottomRowsFromDictionary:cameraMetadata:quaternion:");
  if (!v13)
  {
    p_didHaveMotionData = &self->_motionData.didHaveMotionData;
    self->_transformContext.forceIdentity = self->_motionData.didHaveMotionData == 0;
    int v16 = (int)((double)(int)v63 * 0.14);
    int x = self->_transformContext.finalCropRect.origin.x;
    if (x <= self->_transformContext.finalCropRect.origin.y) {
      int x = self->_transformContext.finalCropRect.origin.y;
    }
    if (x < v16) {
      int v16 = x;
    }
    *((float *)p_isFirstFrame + 109) = (float)(*((float *)p_isFirstFrame + 127) * (float)v16) / 10.0;
    double v18 = *((double *)&v66 + 1);
    double v19 = *(double *)&v66;
    double v20 = *((double *)&v67 + 1);
    double v21 = *(double *)&v67;
    if (*((_DWORD *)p_isFirstFrame + 111) == 2)
    {
      LODWORD(v14) = DWORD1(v59[0]);
      -[BWPreviewGyroStabilization _adjustQuaternionForSagRemoval:focalLength:](self, "_adjustQuaternionForSagRemoval:focalLength:", v66, v67, v14);
      double v19 = v22;
      double v18 = v23;
      double v21 = v24;
      double v20 = v25;
    }
    BOOL v26 = *p_isFirstFrame;
    if (!*p_isFirstFrame)
    {
      if (!*p_didHaveMotionData) {
        goto LABEL_45;
      }
      if (self->_motionData.prevDidHaveMotionData) {
        goto LABEL_20;
      }
    }
    uint64_t v27 = 0x7FFFFFFFFFFFFFCLL;
    do
    {
      uint64_t v28 = (double *)((char *)self + v27 * 32);
      double v29 = &self->_stabilizedCenterQuaternionAdjusted[v27];
      long long v30 = v67;
      *(_OWORD *)&v29->w = v66;
      *(_OWORD *)&v29->y = v30;
      v28[3383] = v19;
      v28[3384] = v18;
      v28[3385] = v21;
      v28[3386] = v20;
      ++v27;
    }
    while (v27 * 32);
    long long v31 = v67;
    *(_OWORD *)&self->_lowpassQuaternionsInstant.w = v66;
    *(_OWORD *)&self->_lowpassQuaternionsInstant.y = v31;
    if (!*p_didHaveMotionData)
    {
LABEL_45:
      if (self->_transformContext.forceIdentity)
      {
        long long v54 = v67;
        *(_OWORD *)&self->_stabilizedCenterQuaternion[0].w = v66;
        *(_OWORD *)&self->_stabilizedCenterQuaternion[0].y = v54;
        float v55 = 0.0;
        float v56 = 0.0;
        if (!a6)
        {
LABEL_48:
          int v57 = 0;
          *((float *)p_isFirstFrame + 95) = v55;
          *((float *)p_isFirstFrame + 96) = v56;
          self->_motionData.prevDidHaveMotionData = *p_didHaveMotionData;
          self->_double previousCaptureTime = *((double *)&v61 + 1);
          goto LABEL_49;
        }
      }
      else
      {
        float v55 = *((float *)p_isFirstFrame + 88);
        float v56 = *((float *)p_isFirstFrame + 91);
        if (!a6) {
          goto LABEL_48;
        }
      }
      a6->int x = v55;
      a6->y = v56;
      goto LABEL_48;
    }
    if (!v26)
    {
LABEL_20:
      double previousCaptureTime = self->_previousCaptureTime;
      if (*((double *)&v61 + 1) <= previousCaptureTime) {
        double v33 = 0.0333333333;
      }
      else {
        double v33 = *((double *)&v61 + 1) - previousCaptureTime;
      }
      self->_double deltaFrameTime = v33;
      self->_double frameRateNormalizationFactor = 0.0333333333 / v33;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DA0]), "floatValue");
      if (p_isFirstFrame[452]) {
        BOOL v35 = v34 < 16.0 || *(double *)&v60 > 0.0299999993;
      }
      else {
        BOOL v35 = 0;
      }
      [(BWPreviewGyroStabilization *)self _adjustSmoothParameterWithQuaternion:&v66 cameraMetadata:v59 reduceSmoothParameterForLowLight:v35];
      float v36 = *((float *)p_isFirstFrame + 112);
      if (v36 > 0.0) {
        *((float *)p_isFirstFrame + 97) = v36;
      }
    }
    if (p_isFirstFrame[440]) {
      uint64_t v37 = 4;
    }
    else {
      uint64_t v37 = 1;
    }
    if (p_isFirstFrame[440]) {
      LODWORD(v14) = 1045220557;
    }
    else {
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
    }
    *((_DWORD *)p_isFirstFrame + 98) = LODWORD(v14);
    self->_transformContext.limitFactor = 1.0;
    stabilizedCenterQuaternion = self->_stabilizedCenterQuaternion;
    int v39 = *((_DWORD *)p_isFirstFrame + 111);
    if (v39)
    {
      if (v39 != 2)
      {
        if (v39 != 1)
        {
          int v57 = -12780;
          goto LABEL_49;
        }
        LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
        double v41 = *((double *)&v66 + 1);
        double v40 = *(double *)&v66;
        double v43 = *((double *)&v67 + 1);
        double v42 = *(double *)&v67;
        double v44 = self;
        stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternion;
        uint64_t v46 = 1;
        goto LABEL_43;
      }
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 97);
      -[BWPreviewGyroStabilization _applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:](self, "_applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:", self->_stabilizedCenterQuaternion, 1, v66, v67, v14);
      stabilizedCenterQuaternion = self->_stabilizedCenterQuaternionAdjusted;
      LODWORD(v14) = *((_DWORD *)p_isFirstFrame + 98);
      double v44 = self;
      stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternionAdjusted;
      double v40 = v19;
      double v41 = v18;
      double v42 = v21;
      double v43 = v20;
    }
    else
    {
      double v41 = *((double *)&v66 + 1);
      double v40 = *(double *)&v66;
      double v43 = *((double *)&v67 + 1);
      double v42 = *(double *)&v67;
      double v44 = self;
      stabilizedCenterQuaternionAdjusted = self->_stabilizedCenterQuaternion;
    }
    uint64_t v46 = v37;
LABEL_43:
    -[BWPreviewGyroStabilization _applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:](v44, "_applyCascadeFiltering:quaternion:lowpassParameter:cascadeLevel:", stabilizedCenterQuaternionAdjusted, v46, v40, v41, v42, v43, v14);
    FigMotionInterpolateQuaternionsByAngle((uint64_t)&v66, &self->_lowpassQuaternionsInstant.w, 0.05);
    self->_lowpassQuaternionsInstant.w = v47;
    self->_lowpassQuaternionsInstant.int x = v48;
    self->_lowpassQuaternionsInstant.y = v49;
    self->_lowpassQuaternionsInstant.z = v50;
    self->_correctionQuaternion.w = FigMotionMultiplyByInverseOfQuaternion(&stabilizedCenterQuaternion->w, (uint64_t *)&v66);
    self->_correctionQuaternion.int x = v51;
    self->_correctionQuaternion.y = v52;
    self->_correctionQuaternion.z = v53;
    int v13 = pgs_computeTransformFromCameraMotion(&self->_correctionQuaternion.w, &p_imageCenter->x, (float32x2_t *)&self->_oisOffsetInput, (float32x2_t *)&self->_sagPosition, (uint64_t)self->_baseVector, *((float *)v59 + 1));
    if (!v13)
    {
      pgs_limitTransformToOverscan((uint64_t)p_transformContext, (int *)&v62 + 2, (uint64_t)self->_baseVector);
      goto LABEL_45;
    }
  }
  int v57 = v13;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_49:
  if (*p_isFirstFrame) {
    BOOL *p_isFirstFrame = 0;
  }
  return v57;
}

- (void)_applyCascadeFiltering:(id *)a3 quaternion:(id)a4 lowpassParameter:(float)a5 cascadeLevel:(int)a6
{
  $01BB1521EC52D44A8E7628F5261DCEC8 v22 = a4;
  if (a6 >= 4) {
    int v8 = 4;
  }
  else {
    int v8 = a6;
  }
  uint64_t v9 = (v8 - 1);
  double v10 = &a3[(int)v9];
  FigMotionInterpolateQuaternionsByAngle((uint64_t)&v22, &v10->var0, a5);
  v10->var0 = v11;
  v10->var1 = v12;
  v10->float var2 = v13;
  v10->int var3 = v14;
  if (v8 >= 2)
  {
    unint64_t v15 = v9 + 1;
    int v16 = &a3[v9];
    do
    {
      double v17 = &a3[(v15 - 2)];
      FigMotionInterpolateQuaternionsByAngle((uint64_t)v16, &v17->var0, a5);
      v17->var0 = v18;
      v17->var1 = v19;
      v17->float var2 = v20;
      v17->int var3 = v21;
      --v15;
      --v16;
    }
    while (v15 > 1);
  }
}

- (int)_extractMetadataFromTopToBottomRowsFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4 quaternion:(id *)a5
{
  BOOL v5 = (char *)MEMORY[0x1F4188790](self, a2, a3, a4);
  v69[658] = *MEMORY[0x1E4F143B8];
  if (v6)
  {
    uint64_t v9 = v7;
    if (v7)
    {
      double v10 = v8;
      if (v8)
      {
        CFDictionaryRef v11 = v6;
        double v12 = v5;
        int v13 = objc_msgSend(v5, "_getAllMetadataFromDictionary:cameraMetadata:");
        if (v13)
        {
          int v60 = v13;
          fig_log_get_emitter();
        }
        else
        {
          uint64_t v63 = 0;
          uint64_t v64 = 0;
          if (*(_OWORD *)(v9 + 88) == 0) {
            *(void *)(v9 + 96) = *((void *)v12 + 1);
          }
          int v14 = *((_DWORD *)v12 + 2);
          int v15 = *((_DWORD *)v12 + 3);
          v66[0] = 0;
          v66[1] = 0;
          __asm { FMOV            V0.2D, #1.0 }
          long long v67 = _Q0;
          FigCFDictionaryGetCGRectIfPresent();
          double v21 = (float)v14;
          float v22 = v21 * 0.0 + 0.5;
          int v23 = llroundf(v22);
          double v24 = (float)v15;
          float v25 = v24 * 0.0 + 0.5;
          double v26 = *((double *)&v67 + 1);
          *(float *)&double v21 = v21 * *(double *)&v67 + -0.5;
          int v27 = llroundf(*(float *)&v21);
          *((_DWORD *)v12 + 9) = v23;
          *((_DWORD *)v12 + 10) = llroundf(v25);
          *(float *)&double v21 = v24 * v26 + -0.5;
          int v28 = llroundf(*(float *)&v21);
          *((_DWORD *)v12 + 11) = v27;
          *((_DWORD *)v12 + 12) = v28;
          double v29 = *(double *)(v9 + 32)
              + *(double *)(v9 + 48) * -0.5
              + ((double)v28 + -1.0) / (double)v28 * 0.5 * *(double *)(v9 + 56);
          *(double *)(v9 + 72) = v29;
          unsigned int v62 = 0;
          Value = CFDictionaryGetValue(v11, (const void *)*MEMORY[0x1E4F54128]);
          int v31 = portIndexFromPortType(Value, (int *)&v62);
          if (v31)
          {
            int v60 = v31;
            fig_log_get_emitter();
          }
          else
          {
            uint64_t v32 = v62;
            double v33 = *((double *)v12 + 1289);
            bzero(&v68, 0x14A0uLL);
            bzero(v66, 0x2FD0uLL);
            uint64_t v65 = 0;
            int MotionDataFromISP = FigMotionGetMotionDataFromISP(v11, &v68, 0, 110, (int *)&v65 + 1, 0, (uint64_t)v66, 510, (int *)&v65);
            if (MotionDataFromISP)
            {
              int v60 = MotionDataFromISP;
              fig_log_get_emitter();
              FigDebugAssert3();
              fig_log_get_emitter();
            }
            else
            {
              BOOL v35 = (int *)(v12 + 64);
              float v36 = v12 + 10328;
              uint64_t v37 = HIDWORD(v65);
              if (SHIDWORD(v65) >= 1)
              {
                int v38 = *v35;
                int v39 = (double *)v69;
                do
                {
                  *(double *)&v35[2 * v38 + 2] = v33 + -0.005 + *(v39 - 1);
                  double v40 = &v35[8 * v38 + 514];
                  long long v42 = *(_OWORD *)v39;
                  long long v41 = *((_OWORD *)v39 + 1);
                  v39 += 6;
                  *(_OWORD *)double v40 = v42;
                  *((_OWORD *)v40 + 1) = v41;
                  int v38 = (*v35 + 1);
                  *BOOL v35 = v38;
                  --v37;
                }
                while (v37);
              }
              uint64_t v43 = v65;
              if ((int)v65 >= 1)
              {
                double v44 = &v36[v32 + 16416];
                long double v45 = (float32x2_t *)&v36[8 * v32];
                uint64_t v46 = v45 + 2049;
                double v47 = v45 + 2053;
                int v48 = *(_DWORD *)&v36[4 * v32];
                float32x2_t v49 = (float32x2_t)vdup_n_s32(0x3C23D700u);
                float32x2_t v50 = (float32x2_t)vdup_n_s32(0x3F7D70A4u);
                double v51 = (float32x2_t *)&v67;
                do
                {
                  uint64_t v52 = v48;
                  uint64_t v53 = (uint64_t)&v36[4096 * v32 + 8 * v48];
                  *(float32x2_t *)(v53 + 8) = v51[-2];
                  *(float32x2_t *)(v53 + 8200) = v51[-1];
                  if (*v44)
                  {
                    *(float32x2_t *)(*(void *)v46 + 8 * v52) = *v51;
                    float32x2_t v54 = *v51;
                    *double v44 = 0;
                  }
                  else
                  {
                    float32x2_t v55 = vmla_f32(vmul_f32(*v51, v49), v50, *v47);
                    *(float32x2_t *)(*(void *)v46 + 8 * v52) = v55;
                    float32x2_t v54 = v55;
                  }
                  *double v47 = v54;
                  int v48 = ((unsigned __int16)*(_DWORD *)&v36[4 * v32] + 1) & 0x1FF;
                  *(_DWORD *)&v36[4 * v32] = v48;
                  v51 += 3;
                  --v43;
                }
                while (v43);
              }
              FigMotionComputeQuaternionForTimeStamp((uint64_t)v35, v10, v12 + 10322, v29);
              if (!v12[10322])
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                return FigSignalErrorAt();
              }
              *double v10 = FigMotionMultiplyQuaternions(v10, (double *)v12 + 3346);
              *((void *)v10 + 1) = v56;
              *((void *)v10 + 2) = v57;
              *((void *)v10 + 3) = v58;
              if (!*(unsigned char *)(v9 + 12))
              {
                int v60 = 0;
                *(_OWORD *)(v12 + 27128) = 0u;
                return v60;
              }
              if (*((_DWORD *)v12 + 6811) == 1) {
                v59 = (float32x2_t *)(v12 + 27136);
              }
              else {
                v59 = 0;
              }
              int v60 = FigMotionComputeLensMovementAndSagForTimeStamp((uint64_t)(v12 + 10328), (float32x2_t *)v12 + 3391, v59, v62, v29, *(float *)(v9 + 16));
              if (!v60) {
                return v60;
              }
              fig_log_get_emitter();
            }
          }
        }
        FigDebugAssert3();
        return v60;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_getAllMetadataFromDictionary:(__CFDictionary *)a3 cameraMetadata:(id *)a4
{
  if (a3 && a4)
  {
    *(_OWORD *)&a4->var15.origin.y = 0u;
    *(_OWORD *)&a4->var15.size.height = 0u;
    *(_OWORD *)&a4->var13.var0 = 0u;
    *(_OWORD *)&a4->var14.var1.var0 = 0u;
    *(_OWORD *)&a4->var9 = 0u;
    *(_OWORD *)&a4->var11 = 0u;
    *(_OWORD *)&a4->var4 = 0u;
    *(_OWORD *)&a4->var7 = 0u;
    *(_OWORD *)&a4->var0 = 0u;
    a4->var14.var0 = 0;
    a4->var14.var1 = 0;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v12 = *MEMORY[0x1E4F1DB28];
    long long v13 = v6;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      int v7 = llround(*((double *)&v12 + 1));
      a4->var14.var0.var0 = llround(*(double *)&v12);
      a4->var14.var0.var1 = v7;
      int v8 = llround(*((double *)&v13 + 1));
      a4->var14.var1.var0 = llround(*(double *)&v13);
      a4->var14.var1.var1 = v8;
    }
    a4->int var3 = CFDictionaryContainsKey(a3, (const void *)*MEMORY[0x1E4F54280]);
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      int v11 = 0;
      if (FigCFDictionaryGetInt32IfPresent() || FigCFDictionaryGetInt32IfPresent())
      {
        a4->var10 = (double)v11 / 1000000.0;
        if (!FigCFDictionaryGetInt32IfPresent()) {
          a4->var17 = 1;
        }
        int v10 = 0;
        FigCFDictionaryGetFloatIfPresent();
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_adjustQuaternionForSagRemoval:(id)a3 focalLength:(float)a4
{
  p_oisOffsetInput = &self->_oisOffsetInput;
  $01BB1521EC52D44A8E7628F5261DCEC8 v16 = a3;
  v15[0] = atanf(self->_oisOffsetInput.y / a4);
  v15[1] = -atanf(p_oisOffsetInput->x / a4);
  v15[2] = 0.0;
  FigMotionQuaternionFromDeltaRotation(v15);
  v14[0] = v6;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  double v10 = FigMotionMultiplyQuaternions(&v16.var0, v14);
  result.int var3 = v13;
  result.float var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)_setDefaultParametersForStillImagePreview:(BOOL)a3 isFrontCamera:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  isFirstSample = self->_hallData.isFirstSample;
  self->_isStillImagePreview = a3;
  self->_sagRemovalMethod = 0;
  self->_isFirstFrame = 1;
  *(_WORD *)&self->_motionData.didHaveMotionData = 257;
  self->_double previousCaptureTime = 0.0;
  *(_WORD *)self->_hallData.isFirstSample = 257;
  self->_double frameRateNormalizationFactor = 1.0;
  self->_sagPosition = 0;
  [(BWPreviewGyroStabilizationPanningDetection *)self->_previewPanningDetection reset];
  [(BWPreviewGyroStabilizationTripodDetection *)self->_previewTripodDetection reset];
  uint64_t v8 = 0;
  *((_DWORD *)isFirstSample + 122) = 1000593162;
  do
    FigMotionInitializeQuaternion(&self->_stabilizedCenterQuaternion[v8++].w);
  while (v8 != 4);
  FigMotionInitializeQuaternion(&self->_lowpassQuaternionsInstant.w);
  FigMotionInitializeQuaternion(&self->_correctionQuaternion.w);
  self->_transformContext.limitFactor = 1.0;
  self->_double deltaFrameTime = 0.0333333333;
  *((_DWORD *)isFirstSample + 111) = 1057971241;
  self->_long double quaternionThreshold = 0.99;
  if (v4)
  {
    int v9 = FigCaptureCameraRequires180DegreesRotation(1, 0);
    double v10 = -0.707106781;
    double v11 = 0.0;
    if (v9)
    {
      double v12 = 0.707106781;
    }
    else
    {
      double v10 = 0.0;
      double v12 = 0.0;
    }
    if (!v9) {
      double v11 = 0.707106781;
    }
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.707106781;
    double v10 = -0.707106781;
  }
  self->_extrinsicAlignmentPose.w = v11;
  self->_extrinsicAlignmentPose.int x = v12;
  self->_extrinsicAlignmentPose.y = v10;
  self->_extrinsicAlignmentPose.z = v11;
  *((_OWORD *)isFirstSample + 33) = xmmword_1A5F0C6B0;
  *((_DWORD *)isFirstSample + 136) = 1000593162;
  *((_DWORD *)isFirstSample + 138) = 30;
  *(_OWORD *)(isFirstSample + 564) = xmmword_1A5F0C6C0;
  *(_OWORD *)(isFirstSample + 580) = xmmword_1A5F0C6D0;
  if (v5) {
    int v13 = 2;
  }
  else {
    int v13 = 1;
  }
  if (v5) {
    int v14 = 10;
  }
  else {
    int v14 = 20;
  }
  if (v5) {
    unsigned int v15 = -1;
  }
  else {
    unsigned int v15 = 0;
  }
  *((_DWORD *)isFirstSample + 125) = v13;
  *((_DWORD *)isFirstSample + 137) = v14;
  *(int8x8_t *)(isFirstSample + 556) = vbsl_s8((int8x8_t)vdup_n_s32(v15), (int8x8_t)0x500000096, (int8x8_t)0x140000003CLL);
  isFirstSample[496] = 0;
  *((_DWORD *)isFirstSample + 126) = -1082130432;
}

- (id)initForStillImagePreview:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BWPreviewGyroStabilization;
  BOOL v4 = [(BWPreviewGyroStabilization *)&v18 init];
  BOOL v5 = v4;
  if (v4)
  {
    [(BWPreviewGyroStabilization *)v4 _setDefaultParametersForStillImagePreview:v3 isFrontCamera:0];
    uint64_t v6 = 0;
    for (char i = 1; ; char i = 0)
    {
      char v8 = i;
      int v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_malloc(0x1000uLL, 0x100004000313F17uLL);
      v5->_hallData.fusedRingSagPosition[v6] = v9;
      if (!v9) {
        break;
      }
      uint64_t v6 = 1;
      if ((v8 & 1) == 0)
      {
        double v10 = [BWPreviewGyroStabilizationPanningDetection alloc];
        *(float *)&double v11 = v5->_panningSpeedThreshold;
        v5->_previewPanningDetection = [(BWPreviewGyroStabilizationPanningDetection *)v10 initWithPanningThreshold:v11];
        double v12 = [BWPreviewGyroStabilizationTripodDetection alloc];
        *(float *)&double v14 = v5->_tripodMaxAngleThresholdAccumulate;
        *(float *)&double v13 = v5->_tripodMaxAngleThresholdInstant;
        *(float *)&double v15 = v5->_physicalTripodLikelyMaxAngleThreshold;
        *(float *)&double v16 = v5->_physicalTripodGuaranteedMaxAngleThreshold;
        v5->_previewTripodDetection = [(BWPreviewGyroStabilizationTripodDetection *)v12 initWithTripodDetectionThresholds:v13 tripodMaxAngleThresholdAccumulate:v14 physicalTripodLikelyMaxAngleThreshold:v15 physicalTripodGuaranteedMaxAngleThreshold:v16];
        return v5;
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  fusedRingSagPosition = self->_hallData.fusedRingSagPosition;
  char v5 = 1;
  do
  {
    char v6 = v5;
    double v7 = fusedRingSagPosition[v3];
    if (v7)
    {
      fusedRingSagPosition[v3] = 0;
      free(v7);
    }
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  v8.receiver = self;
  v8.super_class = (Class)BWPreviewGyroStabilization;
  [(BWPreviewGyroStabilization *)&v8 dealloc];
}

- (int)_limitSmoothParameterToOverscanWithQuaternion:(id *)a3 cameraMetadata:(id *)a4 minSmoothParameter:(float)a5 smoothParameterInOut:(float *)a6
{
  char v20 = 1;
  p_transformContext = &self->_transformContext;
  self->_transformContext.prevTransformLimited = 0;
  float v12 = *a6;
  p_imageCenter = &self->_transformContext.imageCenter;
  stabilizedCenterQuaternion = self->_stabilizedCenterQuaternion;
  p_oisOffsetInput = &self->_oisOffsetInput;
  p_sagPosition = &self->_sagPosition;
  int result = pgs_iir_TestCorrectionFitsForSmoothParameter((uint64_t)&self->_transformContext, &self->_transformContext.imageCenter.x, (uint64_t *)a3, &self->_stabilizedCenterQuaternion[0].w, (uint64_t)a4, (float32x2_t *)&self->_oisOffsetInput, (float32x2_t *)&self->_sagPosition, (BOOL *)&v20, *a6);
  if (result) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v20 == 0;
  }
  if (v18)
  {
    self->_transformContext.prevTransformLimited = 1;
    if (v12 < a5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int result = FigSignalErrorAt();
      float v19 = a5;
    }
    else
    {
      while (1)
      {
        float v19 = a5;
        if ((float)(v12 - a5) <= 0.01) {
          break;
        }
        BOOL v21 = 0;
        a5 = (float)(v12 + a5) * 0.5;
        int result = pgs_iir_TestCorrectionFitsForSmoothParameter((uint64_t)p_transformContext, &p_imageCenter->x, (uint64_t *)a3, &stabilizedCenterQuaternion->w, (uint64_t)a4, (float32x2_t *)p_oisOffsetInput, (float32x2_t *)p_sagPosition, &v21, (float)(v12 + v19) * 0.5);
        if (!v21)
        {
          float v12 = (float)(v12 + v19) * 0.5;
          a5 = v19;
        }
        if (result) {
          goto LABEL_13;
        }
      }
      int result = 0;
    }
LABEL_13:
    *a6 = v19;
  }
  return result;
}

- (float)_computeSmoothParameterForNonStationaryCaseWithPanningStatus:(BOOL)a3 frameIsSphereStabilized:(BOOL)a4 previousLowPassParameter:(float)a5 rampDownRate:(float)a6 rampUpRate:(float)a7 targetSmoothParameter:(float)a8
{
  if (!a4) {
    return fmaxf(a8, a5 - a6);
  }
  if (a3 && self->_transformContext.prevTransformLimited) {
    return a5 - a6;
  }
  if (a5 <= a8) {
    return fminf(a8, a5 + a7);
  }
  else {
    return fmaxf(a8, a5 - a6);
  }
}

@end