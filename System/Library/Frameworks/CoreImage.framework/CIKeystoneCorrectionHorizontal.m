@interface CIKeystoneCorrectionHorizontal
- (void)computeRotation;
@end

@implementation CIKeystoneCorrectionHorizontal

- (void)computeRotation
{
  v3 = [(CIKeystoneCorrection *)self inputTopLeft];
  [(CIVector *)v3 X];
  *(float *)&double v4 = v4;
  float v34 = *(float *)&v4;
  [(CIVector *)v3 Y];
  *(float *)&double v5 = v5;
  float v33 = *(float *)&v5;
  v6 = [(CIKeystoneCorrection *)self inputTopRight];
  [(CIVector *)v6 X];
  *(float *)&double v7 = v7;
  float v32 = *(float *)&v7;
  [(CIVector *)v6 Y];
  *(float *)&double v8 = v8;
  float v31 = *(float *)&v8;
  v9 = [(CIKeystoneCorrection *)self inputBottomLeft];
  [(CIVector *)v9 X];
  *(float *)&double v10 = v10;
  float v30 = *(float *)&v10;
  [(CIVector *)v9 Y];
  *(float *)&double v11 = v11;
  float v29 = *(float *)&v11;
  v12 = [(CIKeystoneCorrection *)self inputBottomRight];
  [(CIVector *)v12 X];
  *(float *)&double v13 = v13;
  float v28 = *(float *)&v13;
  [(CIVector *)v12 Y];
  *(float *)&double v14 = v14;
  float32x4_t v15 = *(float32x4_t *)self->super._anon_80;
  float32x4_t v16 = *(float32x4_t *)&self->super._anon_80[16];
  float32x4_t v17 = *(float32x4_t *)&self->super._anon_80[32];
  int32x4_t v18 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v34), v16, v33));
  double v19 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2)));
  int32x4_t v20 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v32), v16, v31));
  double v21 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2)));
  int32x4_t v22 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v30), v16, v29));
  double v23 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2)));
  int32x4_t v24 = (int32x4_t)vaddq_f32(v17, vmlaq_n_f32(vmulq_n_f32(v15, v28), v16, *(float *)&v14));
  double v25 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v24.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2)));
  float v26 = CI::Perspective::keystoneH(v19, v21, v23, v25);
  self->super.yaw = v26;
  self->super.roll = CI::Perspective::horizonH(v27, v19, v21, v23, v25, self->super.pitch, v26);
}

@end