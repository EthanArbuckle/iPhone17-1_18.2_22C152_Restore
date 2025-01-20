@interface VCPHandGestureMitigator
+ (float)getFaceExtensionRatio;
+ (float)getGestureTypeConsistencyLookBackDuration;
+ (float)getHandMotionLookBackDuration;
+ (float)getMinHandFaceRatio;
+ (float)getMinTiltingAngle;
+ (float)getMinTiltingThumbAngle;
+ (float)getPalmMoveDistanceThreshold;
+ (float)getPalmScaleChangeThreshold;
- (BOOL)checkHandGestureGlobalMotion:(id)a3 forHand:(id)a4;
- (BOOL)checkHandGestureJitter:(id)a3 forHand:(id)a4;
- (BOOL)checkHandGestureTemporalInconsistency:(id)a3 forHand:(id)a4;
- (BOOL)checkHandHoldObject:(id)a3 forHand:(id)a4;
- (BOOL)handInMitigationQuadrant:(id)a3 withFace:(CGRect)a4;
- (BOOL)handPalmFacingCamera:(id)a3 rotationInDegrees:(int)a4 useTips:(BOOL)a5;
- (BOOL)handTouchFace:(id)a3 andFace:(CGRect)a4 rotationInDegrees:(int)a5;
- (BOOL)handsOverlap:(id)a3 pairedHand:(id)a4;
- (BOOL)handsTooClose:(id)a3 pairedHand:(id)a4;
- (BOOL)mitigateWithFingerOpennessForHand:(id)a3;
- (BOOL)mitigateWithFingerTiltingForHand:(id)a3;
- (VCPHandGestureMitigator)init;
- (float)minHandSize;
- (int)mitigate:(id)a3 rightHand:(id)a4 featureProvider:(id)a5 faceRects:(id)a6 faceYaws:(id)a7;
- (int)mitigateHand:(id)a3 handKey:(id)a4 pairedHand:(id)a5 featureProvider:(id)a6 faceRects:(id)a7 faceYaws:(id)a8;
- (int)rotationInDegrees;
- (void)adjustGestureForHand:(id)a3 withFace:(CGRect)a4;
- (void)adjustGestureForHand:(id)a3 withFaceYaw:(id)a4;
- (void)setMinHandSize:(float)a3;
- (void)setRotationInDegrees:(int)a3;
@end

@implementation VCPHandGestureMitigator

+ (float)getMinHandFaceRatio
{
  return 1.2;
}

+ (float)getFaceExtensionRatio
{
  return 0.4;
}

+ (float)getPalmMoveDistanceThreshold
{
  return 0.2;
}

+ (float)getPalmScaleChangeThreshold
{
  return 0.8;
}

+ (float)getHandMotionLookBackDuration
{
  return 0.601;
}

+ (float)getGestureTypeConsistencyLookBackDuration
{
  return 0.5;
}

+ (float)getMinTiltingAngle
{
  return 0.16;
}

+ (float)getMinTiltingThumbAngle
{
  return 0.25;
}

- (VCPHandGestureMitigator)init
{
  v3.receiver = self;
  v3.super_class = (Class)VCPHandGestureMitigator;
  return [(VCPHandGestureMitigator *)&v3 init];
}

- (BOOL)checkHandGestureJitter:(id)a3 forHand:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v38 = a4;
  unint64_t v40 = 1;
  do
  {
    unint64_t v5 = [v39 count];
    unint64_t v6 = [&unk_1F15EE400 count];
    unint64_t v7 = v6 >= v5 ? v5 : v6;
    BOOL v37 = v7 > v40;
    if (v7 <= v40) {
      break;
    }
    v8 = [v39 objectAtIndexedSubscript:v40 - 1];
    v42 = [v8 objectForKeyedSubscript:v38];

    v9 = [v39 objectAtIndexedSubscript:v40];
    v10 = [v9 objectForKeyedSubscript:v38];

    if (!v10 || !v42)
    {

      BOOL v37 = 0;
      break;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v11 = [&unk_1F15EE418 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(&unk_1F15EE418);
          }
          int v14 = [*(id *)(*((void *)&v43 + 1) + 8 * i) intValue];
          int rotationInDegrees = self->_rotationInDegrees;
          v16 = v42;
          v17 = [v10 keypoints];
          uint64_t v18 = [(VCPHandObservation *)v16 keypoints];
          v19 = (void *)v18;
          if (!v17) {
            goto LABEL_16;
          }
          if (!v18) {
            goto LABEL_16;
          }
          v20 = [v17 objectAtIndexedSubscript:0];
          double v21 = keyPointPosition(v20, rotationInDegrees);

          v22 = [v17 objectAtIndexedSubscript:v14];
          double v23 = keyPointPosition(v22, rotationInDegrees);

          v24 = [v19 objectAtIndexedSubscript:v14];
          double v25 = keyPointPosition(v24, rotationInDegrees);

          v26 = [v19 objectAtIndexedSubscript:0];
          double v27 = keyPointPosition(v26, rotationInDegrees);

          float v28 = palmScale(v16, rotationInDegrees);
          if (v28 >= 0.0)
          {
            int v29 = MediaAnalysisLogLevel();
            float32x2_t v30 = vsub_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v21);
            float v31 = sqrtf(vaddv_f32(vmul_f32(v30, v30)));
            float32x2_t v32 = vsub_f32(*(float32x2_t *)&v25, *(float32x2_t *)&v27);
            float v33 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
            if (v29 >= 7)
            {
              v34 = VCPLogInstance();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218496;
                double v49 = v31;
                __int16 v50 = 2048;
                double v51 = v33;
                __int16 v52 = 2048;
                double v53 = v28;
                _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : jittering logic distance1 %f distance2 %f, palmScale %f", buf, 0x20u);
              }
            }
            if (vabds_f32(v31, v33) > (float)(v28 * 0.8))
            {
              char v35 = 0;
              goto LABEL_26;
            }
          }
          else
          {
LABEL_16:
          }
        }
        uint64_t v11 = [&unk_1F15EE418 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    char v35 = 1;
LABEL_26:

    ++v40;
  }
  while ((v35 & 1) != 0);

  return v37;
}

- (BOOL)checkHandHoldObject:(id)a3 forHand:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0;
  while ([v5 count] > v7)
  {
    v8 = [v5 objectAtIndexedSubscript:v7];
    v9 = [v8 objectForKeyedSubscript:v6];

    if (!v9) {
      break;
    }
    [v9 holdObject];
    float v11 = v10;

    ++v7;
    if (v11 >= 0.975)
    {
      BOOL v12 = 1;
      goto LABEL_7;
    }
  }
  BOOL v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)handsOverlap:(id)a3 pairedHand:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v8 = (VCPHandObservation *)a3;
  v9 = (VCPHandObservation *)a4;
  float v10 = v9;
  BOOL v11 = 0;
  if (!v8 || !v9) {
    goto LABEL_41;
  }
  BOOL v12 = +[VCPHandObservation twoHandGestureTypes];
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPHandObservation gestureType](v8, "gestureType"));
  if ([v12 containsObject:v13])
  {
  }
  else
  {
    int v14 = +[VCPHandObservation twoHandGestureTypes];
    v15 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPHandObservation gestureType](v10, "gestureType"));
    int v16 = [v14 containsObject:v15];

    float v17 = 0.0;
    if (!v16) {
      goto LABEL_7;
    }
  }
  float v17 = 0.2;
LABEL_7:
  uint64_t v18 = [(VCPHandObservation *)v8 keypoints];
  uint64_t v19 = [(VCPHandObservation *)v10 keypoints];
  v20 = (void *)v19;
  BOOL v11 = 0;
  if (v18 && v19)
  {
    uint64_t v21 = 0;
    int32x2_t v53 = 0;
    __asm { FMOV            V0.2S, #1.0 }
    int32x2_t v51 = _D0;
    int32x2_t v47 = _D0;
    int32x2_t v49 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v21, *(void *)&v45);
      v26 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      int32x2_t v46 = COERCE_INT32X2_T(keyPointPosition(v26, self->_rotationInDegrees));

      double v27 = [v20 objectAtIndexedSubscript:v21];
      int32x2_t v45 = COERCE_INT32X2_T(keyPointPosition(v27, self->_rotationInDegrees));

      if (vcgt_f32((float32x2_t)v46, (float32x2_t)v51).u8[0]) {
        float v28 = *(float *)v51.i32;
      }
      else {
        float v28 = *(float *)v46.i32;
      }
      if (vcgt_f32((float32x2_t)v46, (float32x2_t)v53).u8[0]) {
        v4.i32[0] = v46.i32[0];
      }
      else {
        v4.i32[0] = v53.i32[0];
      }
      if (vcgt_f32((float32x2_t)v45, (float32x2_t)v47).u8[0]) {
        v5.i32[0] = v47.i32[0];
      }
      else {
        v5.i32[0] = v45.i32[0];
      }
      float32x2_t v29 = (float32x2_t)vzip2_s32(v47, v51);
      float32x2_t v30 = (float32x2_t)vzip2_s32(v45, v46);
      int32x2_t v31 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v29), (int8x8_t)v29, (int8x8_t)v30);
      int32x2_t v51 = (int32x2_t)__PAIR64__(v31.u32[1], LODWORD(v28));
      if (vcgt_f32((float32x2_t)v45, (float32x2_t)v49).u8[0]) {
        float v32 = *(float *)v45.i32;
      }
      else {
        float v32 = *(float *)v49.i32;
      }
      float32x2_t v33 = (float32x2_t)vzip2_s32(v53, v49);
      float32x2_t v34 = (float32x2_t)vzip2_s32(v46, v45);
      int32x2_t v35 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v33), (int8x8_t)v34, (int8x8_t)v33);
      int32x2_t v53 = vzip1_s32(v4, v35);
      int32x2_t v47 = vzip1_s32(v5, v31);
      int32x2_t v49 = (int32x2_t)__PAIR64__(v35.u32[1], LODWORD(v32));
      ++v21;
    }
    while (v21 != 21);
    float32x2_t v48 = (float32x2_t)v35;
    float v50 = v32;
    float32x2_t v52 = (float32x2_t)v31;
    float v54 = v28;
    float v36 = palmScale(v8, self->_rotationInDegrees);
    float v37 = (float)(v36 + palmScale(v10, self->_rotationInDegrees)) * 0.5;
    if ((float)(*(float *)v4.i32 - *(float *)v5.i32) >= (float)(v50 - v54)) {
      float v38 = v50 - v54;
    }
    else {
      float v38 = *(float *)v4.i32 - *(float *)v5.i32;
    }
    float32x2_t v39 = vsub_f32(v48, v52);
    if (v39.f32[0] >= v39.f32[1]) {
      float v40 = v39.f32[1];
    }
    else {
      float v40 = v39.f32[0];
    }
    if (v38 < (float)(v17 * v37) || v40 < (float)(v17 * v37))
    {
      BOOL v11 = 0;
    }
    else
    {
      int v42 = MediaAnalysisLogLevel();
      if (v42 >= 7)
      {
        long long v43 = VCPLogInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218752;
          double v56 = v38;
          __int16 v57 = 2048;
          double v58 = v40;
          __int16 v59 = 2048;
          double v60 = v37;
          __int16 v61 = 2048;
          double v62 = v17;
          _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "Hands overlaps, XminOverlapAmount %f, YminOverlapAmount %f, avgPalmScale %f, thresh %f", buf, 0x2Au);
        }
      }
      BOOL v11 = 1;
    }
  }

LABEL_41:
  return v11;
}

- (BOOL)handsTooClose:(id)a3 pairedHand:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (VCPHandObservation *)a3;
  unint64_t v7 = (VCPHandObservation *)a4;
  v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    if ([(VCPHandObservation *)v6 gestureType] == 13
      || [(VCPHandObservation *)v6 gestureType] == 17
      || [(VCPHandObservation *)v8 gestureType] == 13
      || [(VCPHandObservation *)v8 gestureType] == 17)
    {
      goto LABEL_7;
    }
    if ([(VCPHandGestureMitigator *)self handsOverlap:v6 pairedHand:v8])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        BOOL v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v23) = 0;
          BOOL v12 = "Hands are too close due to overlapping";
          v13 = v11;
          uint32_t v14 = 2;
LABEL_24:
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v23, v14);
        }
LABEL_25:
      }
LABEL_26:
      BOOL v9 = 1;
      goto LABEL_8;
    }
    double v15 = palmCenter(v6, self->_rotationInDegrees);
    double v16 = palmCenter(v8, self->_rotationInDegrees);
    float v17 = palmScale(v6, self->_rotationInDegrees);
    float v18 = palmScale(v8, self->_rotationInDegrees);
    int v19 = [(VCPHandObservation *)v6 gestureType];
    float32x2_t v20 = vsub_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v16);
    float v21 = sqrtf(vaddv_f32(vmul_f32(v20, v20)));
    float v22 = (float)(v17 + v18) * 0.5;
    if (v19 == 9 || [(VCPHandObservation *)v8 gestureType] == 9)
    {
      if (v21 < (float)(v22 * 1.25))
      {
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_26;
        }
        BOOL v11 = VCPLogInstance();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_25;
        }
        int v23 = 134218240;
        double v24 = v21;
        __int16 v25 = 2048;
        double v26 = v22;
        BOOL v12 = "Hands are too close in palmDistance %f when double-thumbsup, avgPlmScale %f";
LABEL_23:
        v13 = v11;
        uint32_t v14 = 22;
        goto LABEL_24;
      }
    }
    else if (v21 < (float)(v22 * 0.5))
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_26;
      }
      BOOL v11 = VCPLogInstance();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      int v23 = 134218240;
      double v24 = v21;
      __int16 v25 = 2048;
      double v26 = v22;
      BOOL v12 = "Hands are too close in palmDistance %f, avgPlmScale %f";
      goto LABEL_23;
    }
LABEL_7:
    BOOL v9 = 0;
  }
LABEL_8:

  return v9;
}

- (BOOL)checkHandGestureTemporalInconsistency:(id)a3 forHand:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [(id)objc_opt_class() getGestureTypeConsistencyLookBackDuration];
  unsigned int v8 = vcvtms_s32_f32(v7 * 5.0);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    BOOL v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v19[0] = 67109120;
      v19[1] = v8;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "checkHandGestureTemporalInconsistency: frameChannelLookBackCount %d", (uint8_t *)v19, 8u);
    }
  }
  for (uint64_t i = (int)[v5 count] - 2; ; --i)
  {
    int v11 = [v5 count];
    uint64_t v12 = (v11 + ~v8) & ~((int)(v11 + ~v8) >> 31);
    if (i + 1 <= v12) {
      break;
    }
    v13 = [v5 objectAtIndexedSubscript:i];
    uint32_t v14 = [v13 objectForKeyedSubscript:v6];

    double v15 = [v5 objectAtIndexedSubscript:i + 1];
    double v16 = [v15 objectForKeyedSubscript:v6];

    if (!v16 || !v14 || (int v17 = [v16 gestureType], v17 != objc_msgSend(v14, "gestureType")))
    {

      break;
    }
  }
  return i + 1 > v12;
}

- (BOOL)checkHandGestureGlobalMotion:(id)a3 forHand:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(id)objc_opt_class() getHandMotionLookBackDuration];
  float v9 = v8;
  [(id)objc_opt_class() getPalmScaleChangeThreshold];
  float v11 = v10;
  [(id)objc_opt_class() getPalmMoveDistanceThreshold];
  float v13 = v12;
  unsigned int v14 = vcvtms_s32_f32(v9 * 5.0);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    double v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v47 = 67109120;
      LODWORD(v48) = v14;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "checkHandGestureGlobalMotion: frameChannelLookBackCount %d", (uint8_t *)&v47, 8u);
    }
  }
  int v16 = ~v14;
  for (uint64_t i = (int)[v6 count] - 2; ; --i)
  {
    int v18 = [v6 count];
    if (i + 1 <= ((v18 + v16) & ~((v18 + v16) >> 31))) {
      break;
    }
    int v19 = [v6 objectAtIndexedSubscript:i];
    uint64_t v20 = [v19 objectForKeyedSubscript:v7];

    float v21 = [v6 objectAtIndexedSubscript:i + 1];
    float v22 = [v21 objectForKeyedSubscript:v7];

    if (!v22 || !v20) {
      goto LABEL_34;
    }
    double v23 = palmCenter(v22, self->_rotationInDegrees);
    double v24 = palmCenter(v20, self->_rotationInDegrees);
    float v25 = palmScale(v20, self->_rotationInDegrees);
    float v26 = palmScale(v22, self->_rotationInDegrees);
    float32x2_t v27 = vsub_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v24);
    float v28 = sqrtf(vaddv_f32(vmul_f32(v27, v27)));
    float v29 = vabds_f32(v26, v25);
    if (v25 >= v26) {
      float v30 = v26;
    }
    else {
      float v30 = v25;
    }
    if (v29 > (float)(v11 * v30) || v28 > (float)(v13 * v25))
    {
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_34;
      }
      long long v43 = VCPLogInstance();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        int v47 = 134219264;
        double v48 = v11;
        __int16 v49 = 2048;
        double v50 = v13;
        __int16 v51 = 2048;
        double v52 = v29;
        __int16 v53 = 2048;
        double v54 = v28;
        __int16 v55 = 2048;
        double v56 = v25;
        __int16 v57 = 2048;
        double v58 = v26;
        long long v44 = "Global motion (consecutive): thresh_scale %f, thresh_dist %f, palmScaleChange %f, palmCenterChange %f, pal"
              "mScaleRef %f, palmScaleCur %f";
        goto LABEL_32;
      }
      goto LABEL_33;
    }
  }
  for (uint64_t j = (int)([v6 count] - 2); ; --j)
  {
    int v32 = [v6 count];
    if (j < ((v32 + v16) & ~((v32 + v16) >> 31)))
    {
      BOOL v45 = 0;
      goto LABEL_35;
    }
    float32x2_t v33 = objc_msgSend(v6, "objectAtIndexedSubscript:", (int)(objc_msgSend(v6, "count") - 1));
    uint64_t v20 = [v33 objectForKeyedSubscript:v7];

    float32x2_t v34 = [v6 objectAtIndexedSubscript:j];
    float v22 = [v34 objectForKeyedSubscript:v7];

    if (!v22 || !v20) {
      goto LABEL_34;
    }
    double v35 = palmCenter(v22, self->_rotationInDegrees);
    double v36 = palmCenter(v20, self->_rotationInDegrees);
    float v37 = palmScale(v20, self->_rotationInDegrees);
    float v38 = palmScale(v22, self->_rotationInDegrees);
    float32x2_t v39 = vsub_f32(*(float32x2_t *)&v35, *(float32x2_t *)&v36);
    float v40 = sqrtf(vaddv_f32(vmul_f32(v39, v39)));
    float v41 = vabds_f32(v38, v37);
    float v42 = v37 >= v38 ? v38 : v37;
    if (v41 > (float)(v11 * v42) || v40 > (float)(v13 * v37)) {
      break;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v43 = VCPLogInstance();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      int v47 = 134219264;
      double v48 = v11;
      __int16 v49 = 2048;
      double v50 = v13;
      __int16 v51 = 2048;
      double v52 = v41;
      __int16 v53 = 2048;
      double v54 = v40;
      __int16 v55 = 2048;
      double v56 = v37;
      __int16 v57 = 2048;
      double v58 = v38;
      long long v44 = "Global motion (buffer head): thresh_scale %f, thresh_dist %f, palmScaleChange %f, palmCenterChange %f, palmS"
            "caleRef %f, palmScaleCur %f";
LABEL_32:
      _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, v44, (uint8_t *)&v47, 0x3Eu);
    }
LABEL_33:
  }
LABEL_34:

  BOOL v45 = 1;
LABEL_35:

  return v45;
}

- (BOOL)mitigateWithFingerTiltingForHand:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(id)objc_opt_class() getMinTiltingAngle];
  float v6 = v5 * 3.14159265;
  if ([v4 gestureType] == 9)
  {
    +[VCPHandGestureImageRequest tiltingAngleForHand:v4 srcKeypointType:4 dstKeypointType:3 rotationInDegrees:self->_rotationInDegrees];
  }
  else
  {
    if ([v4 gestureType] == 12)
    {
      [(id)objc_opt_class() getMinTiltingThumbAngle];
      float v9 = v8;
      +[VCPHandGestureImageRequest tiltingAngleForHand:v4 srcKeypointType:4 dstKeypointType:3 rotationInDegrees:self->_rotationInDegrees];
      float v11 = v10;
      float v12 = v9 * 3.14159265;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        float v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 134218240;
          double v18 = v11;
          __int16 v19 = 2048;
          double v20 = v12;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "mitigateWithFingerTiltingForHand: tiltingAngle %f, threshold %f", (uint8_t *)&v17, 0x16u);
        }
      }
      BOOL v14 = v11 < v12;
      goto LABEL_13;
    }
    if ([v4 gestureType] != 2 && objc_msgSend(v4, "gestureType") != 7)
    {
      BOOL v15 = 0;
      goto LABEL_16;
    }
    +[VCPHandGestureImageRequest tiltingAngleForHand:v4 srcKeypointType:8 dstKeypointType:5 rotationInDegrees:self->_rotationInDegrees];
  }
  BOOL v14 = v7 < v6;
LABEL_13:
  BOOL v15 = v14;
LABEL_16:

  return v15;
}

- (BOOL)mitigateWithFingerOpennessForHand:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() heuristicFingerOpenness:v4 rotationInDegrees:self->_rotationInDegrees];
  [v4 setFingerOpenness:v5];
  int v6 = [v4 chirality];
  float v7 = VCPGestureLeftHandKey;
  if (v6 != -1) {
    float v7 = &VCPGestureRightHandKey;
  }
  float v8 = *v7;
  if (([v4 gestureType] == 9 || objc_msgSend(v4, "gestureType") == 12)
    && ((v9 = objc_msgSend((id)objc_opt_class(), "heuristicIsThumbOpenWide:rotationInDegrees:isRelaxed:", v4, self->_rotationInDegrees, objc_msgSend(v4, "gestureType") == 12), objc_msgSend(v4, "setFingerOpenness:", v5 & 0xFFFFFFFFFFFFFFFELL | v9), (v5 & 0xFFFFFFFFFFFFFFFELL) == 0)? (char v10 = v9): (char v10 = 0), (v10 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      float v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v17 = 138412290;
        *(void *)&v17[4] = v8;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out %@ hand thumbs up/down with finger openness heuristic constraints", v17, 0xCu);
      }
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  if ([v4 gestureType] == 2)
  {
    if (v5 != 6)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        float v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int v17 = 138412290;
          *(void *)&v17[4] = v8;
          BOOL v14 = "VCPHandGestureVideoRequest : gate out %@ hand victory with finger openness heuristic constraints";
          goto LABEL_24;
        }
LABEL_25:
      }
LABEL_26:
      BOOL v11 = 1;
      goto LABEL_27;
    }
    if ([(id)objc_opt_class() heuristicIsIndexMiddleTooClose:v4 rotationInDegrees:self->_rotationInDegrees])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        float v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int v17 = 138412290;
          *(void *)&v17[4] = v8;
          BOOL v14 = "VCPHandGestureVideoRequest : gate out %@ hand victory due to index and middle tips too close";
LABEL_24:
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, v14, v17, 0xCu);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
      goto LABEL_26;
    }
  }
LABEL_27:
  if (objc_msgSend(v4, "gestureType", *(_OWORD *)v17) == 7 && v5 != 18)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      BOOL v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int v17 = 138412290;
        *(void *)&v17[4] = v8;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out %@ hand rock with finger openness heuristic constraints", v17, 0xCu);
      }
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)handPalmFacingCamera:(id)a3 rotationInDegrees:(int)a4 useTips:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  float v8 = v7;
  if (v7)
  {
    [v7 bounds];
    if (v9 > 0.0)
    {
      char v10 = [v8 keypoints];
      BOOL v11 = v10;
      if (!v10)
      {
        LOBYTE(v24) = 0;
LABEL_19:

        goto LABEL_20;
      }
      float v12 = [v10 objectAtIndexedSubscript:0];
      double v13 = keyPointPosition(v12, a4);

      BOOL v14 = [v11 objectAtIndexedSubscript:5];
      double v15 = keyPointPosition(v14, a4);

      int v16 = [v11 objectAtIndexedSubscript:13];
      double v17 = keyPointPosition(v16, a4);

      if (v5)
      {
        uint64_t v18 = [v11 objectAtIndexedSubscript:8];
        double v15 = keyPointPosition(v18, a4);

        __int16 v19 = [v11 objectAtIndexedSubscript:12];
        double v17 = keyPointPosition(v19, a4);
      }
      int v20 = [v8 chirality];
      float32x2_t v21 = vsub_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v13);
      float32x2_t v22 = vsub_f32(*(float32x2_t *)&v17, *(float32x2_t *)&v13);
      float v23 = vmlas_n_f32((float)-v21.f32[1] * v22.f32[0], v22.f32[1], v21.f32[0]);
      if (v20 == 1)
      {
        if (v23 <= 0.0)
        {
LABEL_8:
          BOOL v24 = 0;
          goto LABEL_13;
        }
      }
      else if (v23 >= 0.0)
      {
        goto LABEL_8;
      }
      BOOL v24 = 1;
LABEL_13:
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        float v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v26 = [v8 chirality];
          float32x2_t v27 = "right";
          int v29 = 136315906;
          if (v26 == -1) {
            float32x2_t v27 = "left";
          }
          float v30 = v27;
          __int16 v31 = 2048;
          double v32 = v23;
          __int16 v33 = 1024;
          BOOL v34 = v24;
          __int16 v35 = 1024;
          BOOL v36 = v5;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : chirality %s, cross_product %f, facingCamera %d, usedTips %d", (uint8_t *)&v29, 0x22u);
        }
      }
      goto LABEL_19;
    }
  }
  LOBYTE(v24) = 0;
LABEL_20:

  return v24;
}

- (BOOL)handTouchFace:(id)a3 andFace:(CGRect)a4 rotationInDegrees:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v11
    && (v57.origin.x = x, v57.origin.y = y, v57.size.width = width, v57.size.double height = height, !CGRectIsEmpty(v57)))
  {
    [(id)objc_opt_class() getFaceExtensionRatio];
    float v15 = v14;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v16 = [&unk_1F15EE430 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v16)
    {
      double v17 = y + (float)(v15 * -0.5) * height;
      double v18 = height * (float)(v15 + 1.0);
      uint64_t v19 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(&unk_1F15EE430);
          }
          float32x2_t v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          float32x2_t v22 = [v11 keypoints];
          float v23 = objc_msgSend(v22, "objectAtIndexedSubscript:", (int)objc_msgSend(v21, "intValue"));

          if (v23)
          {
            [v23 location];
            CGFloat v25 = v24;
            [v23 location];
            v56.double y = v26;
            v58.origin.CGFloat x = x;
            v58.origin.double y = v17;
            v58.size.CGFloat width = width;
            v58.size.double height = v18;
            v56.CGFloat x = v25;
            if (CGRectContainsPoint(v58, v56))
            {

              int v27 = 1;
              goto LABEL_16;
            }
          }
        }
        uint64_t v16 = [&unk_1F15EE430 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    int v27 = 0;
LABEL_16:
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    float v28 = [v11 keypoints];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v46;
      float v31 = 0.0;
      float v32 = 1.0;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(v28);
          }
          BOOL v34 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          [v34 location];
          double v36 = v35;
          [v34 location];
          float v32 = fmin(v36, v32);
          float v31 = fmax(v37, v31);
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v29);
    }
    else
    {
      float v31 = 0.0;
      float v32 = 1.0;
    }

    [(id)objc_opt_class() getMinHandFaceRatio];
    float v39 = v38;
    if ([v11 gestureType] != 12 && objc_msgSend(v11, "gestureType") != 9) {
      float v39 = v39 * 1.2;
    }
    if (height * v39 >= (float)(v31 - v32)) {
      int v12 = v27;
    }
    else {
      int v12 = 0;
    }
    if ([v11 gestureType] == 2)
    {
      if ([(VCPHandGestureMitigator *)self handPalmFacingCamera:v11 rotationInDegrees:v5 useTips:1]&& [(VCPHandGestureMitigator *)self handPalmFacingCamera:v11 rotationInDegrees:v5 useTips:0])
      {
        int v12 = 0;
      }
      else
      {
        objc_msgSend(v11, "setMitigationType:", objc_msgSend(v11, "mitigationType") | 0x20);
        LODWORD(v40) = 1036831949;
        [v11 setGestureConfidence:v40];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          float v41 = VCPLogInstance();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v44 = 0;
            _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out victory gesture due to palm-not-facing-camera", v44, 2u);
          }
        }
      }
    }
    if ([v11 gestureType] == 7)
    {
      BOOL v42 = [(VCPHandGestureMitigator *)self handPalmFacingCamera:v11 rotationInDegrees:v5 useTips:0];
      if ((v42 | v12 ^ 1))
      {
        LOBYTE(v12) = v12 & ~v42;
      }
      else
      {
        objc_msgSend(v11, "setMitigationType:", objc_msgSend(v11, "mitigationType") | 0x20);
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          long long v43 = VCPLogInstance();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v44 = 0;
            _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out rock gesture due to palm-not-facing-camera while in hand-touch-face", v44, 2u);
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)adjustGestureForHand:(id)a3 withFace:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  char v10 = v9;
  if (v9
    && ([v9 gestureType] == 12
     || [v10 gestureType] == 9
     || [v10 gestureType] == 2
     || [v10 gestureType] == 7
     || [v10 gestureType] == 8)
    && -[VCPHandGestureMitigator handTouchFace:andFace:rotationInDegrees:](self, "handTouchFace:andFace:rotationInDegrees:", v10, self->_rotationInDegrees, x, y, width, height))
  {
    [v10 gestureConfidence];
    *(float *)&double v12 = v11 * 0.7;
    [v10 setGestureConfidence:v12];
    objc_msgSend(v10, "setMitigationType:", objc_msgSend(v10, "mitigationType") | 1);
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15[0] = 67109376;
        v15[1] = [v10 groupID];
        __int16 v16 = 1024;
        int v17 = [v10 chirality];
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : adjust gesture confidence based on hand-face position for hand with groupID = %d, chiralitdouble y = %d", (uint8_t *)v15, 0xEu);
      }
    }
    [v10 gestureConfidence];
    if (v14 < 0.5) {
      [v10 setGestureType:0];
    }
  }
}

- (void)adjustGestureForHand:(id)a3 withFaceYaw:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if ([v5 gestureType])
    {
      [v6 floatValue];
      if ((float)(v7 * 180.0) / 3.14159265 < -45.0
        || ([v6 floatValue], (float)(v8 * 180.0) / 3.14159265 > 45.0))
      {
        objc_msgSend(v5, "setMitigationType:", objc_msgSend(v5, "mitigationType") | 0x1000);
        LODWORD(v9) = 1036831949;
        [v5 setGestureConfidence:v9];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          char v10 = VCPLogInstance();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            [v6 floatValue];
            float v12 = v11;
            [v6 floatValue];
            int v14 = 134218240;
            double v15 = v12;
            __int16 v16 = 2048;
            double v17 = (float)(v13 * 180.0) / 3.14159265;
            _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : adjust gesture confidence based on face yaw = %f (%f degrees)", (uint8_t *)&v14, 0x16u);
          }
        }
      }
    }
  }
}

- (BOOL)handInMitigationQuadrant:(id)a3 withFace:(CGRect)a4
{
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = v8;
  if (v8)
  {
    char v10 = [v8 keypoints];

    if (v10)
    {
      float v11 = [v9 keypoints];
      v31.double x = x + width * 0.5;
      v31.CGFloat y = y;
      transformLocation(v31, 0, self->_rotationInDegrees);
      double v13 = v12;
      double v15 = v14;
      __int16 v16 = [v11 objectAtIndexedSubscript:4];
      double v21 = keyPointPosition(v16, self->_rotationInDegrees);

      if ([v9 chirality] == -1)
      {
        if (v13 > *(float *)&v21 && v15 > *((float *)&v21 + 1))
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218752;
              double v23 = v13;
              __int16 v24 = 2048;
              double v25 = v15;
              __int16 v26 = 2048;
              double v27 = *(float *)&v21;
              __int16 v28 = 2048;
              double v29 = *((float *)&v21 + 1);
              uint64_t v18 = "handInMitigationQuadrant: faceLowerCenter (%f, %f), handCenter(%f, %f), left hand mitigation ON in quadrant 3";
              goto LABEL_19;
            }
LABEL_20:
          }
LABEL_21:
          BOOL v19 = 1;
LABEL_23:

          goto LABEL_24;
        }
      }
      else if ([v9 chirality] == 1 && v13 < *(float *)&v21 && v15 > *((float *)&v21 + 1))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          double v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218752;
            double v23 = v13;
            __int16 v24 = 2048;
            double v25 = v15;
            __int16 v26 = 2048;
            double v27 = *(float *)&v21;
            __int16 v28 = 2048;
            double v29 = *((float *)&v21 + 1);
            uint64_t v18 = "handInMitigationQuadrant: faceLowerCenter (%f, %f), handCenter(%f, %f), right hand mitigation ON in quadrant 4";
LABEL_19:
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x2Au);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
        goto LABEL_21;
      }
LABEL_22:
      BOOL v19 = 0;
      goto LABEL_23;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    float v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "handInMitigationQuadrant invalid hand input", buf, 2u);
    }
    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_24:

  return v19;
}

- (int)mitigateHand:(id)a3 handKey:(id)a4 pairedHand:(id)a5 featureProvider:(id)a6 faceRects:(id)a7 faceYaws:(id)a8
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  double v14 = (VCPHandObservation *)a3;
  id v78 = a4;
  id v15 = a5;
  id v16 = a6;
  id v77 = a7;
  id v17 = a8;
  uint64_t v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "count", v77) != 1) {
      goto LABEL_12;
    }
    BOOL v19 = [v18 objectAtIndexedSubscript:0];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        [v19 floatValue];
        *(_DWORD *)buf = 138412546;
        double v85 = *(double *)&v19;
        __int16 v86 = 2048;
        double v87 = (float)(v21 * 180.0) / 3.14159265;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "VCPHandGestureMitigator - faceYaw = %@ (%f degree)", buf, 0x16u);
      }
    }
    [(VCPHandGestureMitigator *)self adjustGestureForHand:v14 withFaceYaw:v19];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_12;
    }
    BOOL v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "VCPHandGestureMitigator - face yaw angles not available", buf, 2u);
    }
  }

LABEL_12:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v22 = v77;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v80 != v24) {
          objc_enumerationMutation(v22);
        }
        NSRect v89 = NSRectFromString((NSString *)*(void *)(*((void *)&v79 + 1) + 8 * i));
        double x = v89.origin.x;
        double y = v89.origin.y;
        double width = v89.size.width;
        double height = v89.size.height;
        if (!CGRectIsEmpty(v89)) {
          -[VCPHandGestureMitigator adjustGestureForHand:withFace:](self, "adjustGestureForHand:withFace:", v14, x, y, width, height);
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v23);
  }

  [(VCPHandObservation *)v14 bounds];
  double v31 = v30;
  [(VCPHandObservation *)v14 bounds];
  if (v31 >= v32) {
    double v33 = v31;
  }
  else {
    double v33 = v32;
  }
  if (v33 < self->_minHandSize)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        double minHandSize = self->_minHandSize;
        *(_DWORD *)buf = 134217984;
        double v85 = minHandSize;
        _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out small hand < %f", buf, 0xCu);
      }
    }
    LODWORD(v34) = 1036831949;
    -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v34, v77);
    [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 8];
  }
  if (!v15)
  {
    double v37 = +[VCPHandObservation twoHandGestureTypes];
    float v38 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPHandObservation gestureType](v14, "gestureType"));
    int v39 = [v37 containsObject:v38];

    if (v39) {
      [(VCPHandObservation *)v14 setGestureType:0];
    }
  }
  if ([(VCPHandObservation *)v14 gestureType] != 13
    && [(VCPHandObservation *)v14 gestureType] != 17)
  {
    double v40 = [v16 observationsForCurrentGroup];
    BOOL v41 = [(VCPHandGestureMitigator *)self checkHandGestureJitter:v40 forHand:v78];

    if (v41)
    {
      [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 2];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v43 = VCPLogInstance();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to jittering", buf, 2u);
        }
      }
      LODWORD(v42) = 1036831949;
      [(VCPHandObservation *)v14 setGestureConfidence:v42];
    }
  }
  if ([(VCPHandObservation *)v14 gestureType] == 9)
  {
    if (v15 && [v15 gestureType] == 9)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v44 = VCPLogInstance();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : skip checking holding object for two-hand thumbs-up", buf, 2u);
        }
      }
    }
    else
    {
      long long v45 = [v16 observationsForCurrentGroup];
      BOOL v46 = [(VCPHandGestureMitigator *)self checkHandHoldObject:v45 forHand:v78];

      if (v46)
      {
        [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x2000];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          long long v48 = VCPLogInstance();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to holding object", buf, 2u);
          }
        }
        LODWORD(v47) = 1036831949;
        [(VCPHandObservation *)v14 setGestureConfidence:v47];
      }
    }
  }
  if ([(VCPHandObservation *)v14 gestureType] != 13
    && [(VCPHandObservation *)v14 gestureType] != 14)
  {
    long long v49 = [v16 observationsForCurrentGroup];
    BOOL v50 = [(VCPHandGestureMitigator *)self checkHandGestureGlobalMotion:v49 forHand:v78];

    if (v50)
    {
      [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x10];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        long long v52 = VCPLogInstance();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to global motion", buf, 2u);
        }
      }
      LODWORD(v51) = 1036831949;
      [(VCPHandObservation *)v14 setGestureConfidence:v51];
    }
  }
  if ([(VCPHandGestureMitigator *)self mitigateWithFingerOpennessForHand:v14])
  {
    [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 4];
    LODWORD(v53) = 1036831949;
    [(VCPHandObservation *)v14 setGestureConfidence:v53];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v54 = VCPLogInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to opennnes", buf, 2u);
      }
    }
  }
  uint64_t v55 = +[VCPHandObservation twoHandGestureTypes];
  CGPoint v56 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPHandObservation gestureType](v14, "gestureType"));
  if ([v55 containsObject:v56])
  {
    BOOL v57 = [(VCPHandObservation *)v14 gestureType] == 15;

    if (!v57) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  CGRect v58 = [v16 observationsForCurrentGroup];
  BOOL v59 = [(VCPHandGestureMitigator *)self checkHandGestureTemporalInconsistency:v58 forHand:v78];

  if (v59)
  {
    [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x200];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      __int16 v61 = VCPLogInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to temporal gesture type consistency", buf, 2u);
      }
    }
    LODWORD(v60) = 1036831949;
    [(VCPHandObservation *)v14 setGestureConfidence:v60];
  }
LABEL_77:
  if ([(VCPHandGestureMitigator *)self mitigateWithFingerTiltingForHand:v14])
  {
    [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x400];
    LODWORD(v62) = 1036831949;
    [(VCPHandObservation *)v14 setGestureConfidence:v62];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v63 = VCPLogInstance();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to tilting angle", buf, 2u);
      }
    }
  }
  if ([(VCPHandObservation *)v14 gestureType] == 12)
  {
    LODWORD(v64) = 1058642330;
    if (!+[VCPHandGestureImageRequest isFistClosedTight:v14 rotationInDegrees:self->_rotationInDegrees scalingFactor:v64])
    {
      [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x800];
      LODWORD(v65) = 1036831949;
      [(VCPHandObservation *)v14 setGestureConfidence:v65];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v66 = VCPLogInstance();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to fist not closed tight in thumbs down", buf, 2u);
        }
      }
    }
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType") == 9 && [v22 count] == 1)
  {
    v67 = [v22 objectAtIndexedSubscript:0];
    NSRect v90 = NSRectFromString(v67);
    double v68 = v90.origin.x;
    double v69 = v90.origin.y;
    double v70 = v90.size.width;
    double v71 = v90.size.height;

    v91.origin.double x = v68;
    v91.origin.double y = v69;
    v91.size.double width = v70;
    v91.size.double height = v71;
    if (!CGRectIsEmpty(v91)
      && -[VCPHandGestureMitigator handInMitigationQuadrant:withFace:](self, "handInMitigationQuadrant:withFace:", v14, v68, v69, v70, v71))
    {
      LODWORD(v72) = palmScale(v14, self->_rotationInDegrees);
      LODWORD(v73) = 1061997773;
      if (!+[VCPHandGestureImageRequest isFistClosedTightOccluded:v14 rotationInDegrees:self->_rotationInDegrees scalingFactor:v73 palmScale:v72])
      {
        [(VCPHandObservation *)v14 setMitigationType:[(VCPHandObservation *)v14 mitigationType] | 0x800];
        LODWORD(v74) = 1036831949;
        [(VCPHandObservation *)v14 setGestureConfidence:v74];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v75 = VCPLogInstance();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to fist not closed tight in thumbs up", buf, 2u);
          }
        }
      }
    }
  }

  return 0;
}

- (int)mitigate:(id)a3 rightHand:(id)a4 featureProvider:(id)a5 faceRects:(id)a6 faceYaws:(id)a7
{
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!(v12 | v13)) {
    goto LABEL_33;
  }
  if (!v12)
  {
    if (!v13) {
      goto LABEL_33;
    }
    goto LABEL_7;
  }
  int v17 = [(VCPHandGestureMitigator *)self mitigateHand:v12 handKey:@"leftHand" pairedHand:v13 featureProvider:v14 faceRects:v15 faceYaws:v16];
  int v18 = v17;
  if (v13 && !v17)
  {
LABEL_7:
    int v18 = [(VCPHandGestureMitigator *)self mitigateHand:v13 handKey:@"rightHand" pairedHand:v12 featureProvider:v14 faceRects:v15 faceYaws:v16];
    if (v18 || !v12) {
      goto LABEL_34;
    }
    double v34 = +[VCPHandObservation twoHandGestureTypes];
    BOOL v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)v12, "gestureType"));
    if ([v34 containsObject:v19])
    {
    }
    else
    {
      int v20 = +[VCPHandObservation twoHandGestureTypes];
      float v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)v13, "gestureType"));
      int v22 = [v20 containsObject:v21];

      if (!v22)
      {
        if ([(VCPHandGestureMitigator *)self handsTooClose:v12 pairedHand:v13])
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            double v30 = VCPLogInstance();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)double v35 = 0;
              _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to two-hand too close", v35, 2u);
            }
          }
          objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x80);
          LODWORD(v31) = 1036831949;
          [(id)v12 setGestureConfidence:v31];
          objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x80);
          LODWORD(v32) = 1036831949;
          [(id)v13 setGestureConfidence:v32];
        }
        goto LABEL_33;
      }
    }
    int v23 = [(id)v12 gestureType];
    if (v23 != [(id)v13 gestureType])
    {
      [(id)v12 setGestureType:0];
      [(id)v13 setGestureType:0];
      int v18 = 0;
      goto LABEL_34;
    }
    if ([(id)v12 gestureType] == 15)
    {
      if ((objc_msgSend((id)objc_opt_class(), "heuristicHeart:andRightHand:rotationInDegrees:relax:", v12, v13, objc_msgSend(v14, "rotationInDegrees"), 1) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out heart with heuristic constraints", buf, 2u);
          }
        }
        objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x40);
        objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x40);
        LODWORD(v25) = 1036831949;
        [(id)v13 setGestureConfidence:v25];
        LODWORD(v26) = 1036831949;
        [(id)v12 setGestureConfidence:v26];
      }
      if ([(VCPHandGestureMitigator *)self handsOverlap:v12 pairedHand:v13])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          double v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v36 = 0;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out heart due to overlapping hands", v36, 2u);
          }
        }
        objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x100);
        objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x100);
        LODWORD(v28) = 1036831949;
        [(id)v13 setGestureConfidence:v28];
        LODWORD(v29) = 1036831949;
        [(id)v12 setGestureConfidence:v29];
      }
    }
LABEL_33:
    int v18 = 0;
  }
LABEL_34:

  return v18;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_int rotationInDegrees = a3;
}

- (float)minHandSize
{
  return self->_minHandSize;
}

- (void)setMinHandSize:(float)a3
{
  self->_double minHandSize = a3;
}

@end