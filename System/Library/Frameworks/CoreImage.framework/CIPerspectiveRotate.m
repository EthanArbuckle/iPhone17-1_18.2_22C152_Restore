@interface CIPerspectiveRotate
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputFocalLength;
- (NSNumber)inputPitch;
- (NSNumber)inputRoll;
- (NSNumber)inputYaw;
- (double)outputTransform;
- (id).cxx_construct;
- (id)outputImage;
- (void)computeCameraIntrinsics;
- (void)setInputFocalLength:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPitch:(id)a3;
- (void)setInputRoll:(id)a3;
- (void)setInputYaw:(id)a3;
@end

@implementation CIPerspectiveRotate

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGeometryAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"13";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.15";
  v12[3] = @"inputFocalLength";
  v9[0] = @"CIAttributeType";
  v9[1] = @"CIAttributeDefault";
  v10[0] = @"CIAttributeTypeScalar";
  v10[1] = &unk_1EE4AAC10;
  v9[2] = @"CIAttributeSliderMin";
  v9[3] = @"CIAttributeSliderMax";
  v10[2] = &unk_1EE4AAC28;
  v10[3] = &unk_1EE4AAC40;
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v12[4] = @"inputPitch";
  v7[0] = @"CIAttributeType";
  v7[1] = @"CIAttributeDefault";
  v8[0] = @"CIAttributeTypeAngle";
  v8[1] = &unk_1EE4AAC58;
  v7[2] = @"CIAttributeIdentity";
  v7[3] = @"CIAttributeSliderMin";
  v8[2] = &unk_1EE4AAC58;
  v8[3] = &unk_1EE4A9650;
  v7[4] = @"CIAttributeSliderMax";
  v8[4] = &unk_1EE4A9660;
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputYaw";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeDefault";
  v6[0] = @"CIAttributeTypeAngle";
  v6[1] = &unk_1EE4AAC58;
  v5[2] = @"CIAttributeIdentity";
  v5[3] = @"CIAttributeSliderMin";
  v6[2] = &unk_1EE4AAC58;
  v6[3] = &unk_1EE4A9650;
  v5[4] = @"CIAttributeSliderMax";
  v6[4] = &unk_1EE4A9660;
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v12[6] = @"inputRoll";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeAngle";
  v4[1] = &unk_1EE4AAC58;
  v3[2] = @"CIAttributeIdentity";
  v3[3] = @"CIAttributeSliderMin";
  v4[2] = &unk_1EE4AAC58;
  v4[3] = &unk_1EE4A9670;
  v3[4] = @"CIAttributeSliderMax";
  v4[4] = &unk_1EE4A9680;
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (void)computeCameraIntrinsics
{
  [(CIImage *)self->inputImage extent];
  v4.f64[1] = v3;
  *(float *)&float64_t v3 = v5;
  *(float *)&double v6 = v6;
  float v18 = *(float *)&v6;
  float v19 = *(float *)&v3;
  int32x2_t v20 = (int32x2_t)vmla_f32(vcvt_f32_f64(v4), (float32x2_t)0x3F0000003F000000, (float32x2_t)__PAIR64__(LODWORD(v6), LODWORD(v3)));
  [(NSNumber *)self->inputFocalLength floatValue];
  float v8 = v7 / hypotf(36.0, 24.0);
  float v9 = hypotf(v19, v18);
  v11.i64[0] = COERCE_UNSIGNED_INT(v8 * v9);
  v11.u64[1] = (unint64_t)v20;
  v21.columns[0].i32[1] = 0;
  v21.columns[0].i64[1] = 0;
  v21.columns[0].f32[0] = v8 * v9;
  *(float *)v10.i32 = v21.columns[0].f32[0];
  __asm { FMOV            V3.4S, #1.0 }
  int32x4_t v17 = vzip2q_s32(v11, _Q3);
  *(int32x2_t *)_Q3.i8 = vdup_lane_s32(v20, 1);
  v21.columns[2] = (simd_float3)vzip1q_s32(v17, _Q3);
  v21.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v21.columns[0].u32[0], vdupq_lane_s32(v10, 0));
  *(_OWORD *)self->_anon_50 = v21.columns[0].u32[0];
  *(simd_float3 *)&self->_anon_50[16] = v21.columns[1];
  *(simd_float3 *)&self->_anon_50[32] = v21.columns[2];
  simd_float3x3 v22 = __invert_f3(v21);
  *(void *)self->_anon_80 = v22.columns[0].i64[0];
  *(_DWORD *)&self->_anon_80[8] = v22.columns[0].i32[2];
  *(void *)&self->_anon_80[16] = v22.columns[1].i64[0];
  *(_DWORD *)&self->_anon_80[24] = v22.columns[1].i32[2];
  *(void *)&self->_anon_80[32] = v22.columns[2].i64[0];
  *(_DWORD *)&self->_anon_80[40] = v22.columns[2].i32[2];
}

- (double)outputTransform
{
  [(id)a1 computeCameraIntrinsics];
  [*(id *)(a1 + 192) floatValue];
  float v3 = v2;
  [*(id *)(a1 + 200) floatValue];
  float v5 = v4;
  double v6 = (CI::Perspective *)[*(id *)(a1 + 208) floatValue];
  *(__n64 *)v8.f32 = CI::Perspective::getRotation(v6, v3, v5, v7);
  uint64_t v11 = 0;
  float32x4_t v12 = vaddq_f32(v10, vmlaq_f32(vmulq_f32(v8, (float32x4_t)0), (float32x4_t)0, v9));
  float32x4_t v13 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2);
  int32x4_t v14 = (int32x4_t)vdivq_f32(v12, v13);
  v13.f32[0] = -*(float *)v14.i32;
  *(float *)v14.i32 = -*(float *)&v14.i32[1];
  __asm { FMOV            V5.4S, #1.0 }
  int32x4_t v20 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)v13.f32, 0), _Q5), v14);
  float32x4_t v21 = *(float32x4_t *)(a1 + 80);
  float32x4_t v22 = *(float32x4_t *)(a1 + 96);
  float32x4_t v23 = *(float32x4_t *)(a1 + 112);
  long long v35 = xmmword_193954F70;
  long long v36 = xmmword_193954F80;
  int32x4_t v37 = v20;
  do
  {
    *(float32x4_t *)((char *)&v38 + v11) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(long long *)((char *)&v35 + v11))), v22, *(float32x2_t *)((char *)&v35 + v11), 1), v23, *(float32x4_t *)((char *)&v35 + v11), 2);
    v11 += 16;
  }
  while (v11 != 48);
  uint64_t v24 = 0;
  float32x4_t v25 = v38;
  float32x4_t v26 = v39;
  float32x4_t v27 = v40;
  long long v35 = (__int128)v8;
  long long v36 = (__int128)v9;
  int32x4_t v37 = (int32x4_t)v10;
  do
  {
    *(float32x4_t *)((char *)&v38 + v24) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v25, COERCE_FLOAT(*(long long *)((char *)&v35 + v24))), v26, *(float32x2_t *)((char *)&v35 + v24), 1), v27, *(float32x4_t *)((char *)&v35 + v24), 2);
    v24 += 16;
  }
  while (v24 != 48);
  uint64_t v28 = 0;
  float32x4_t v29 = v38;
  float32x4_t v30 = v39;
  float32x4_t v31 = v40;
  long long v32 = *(_OWORD *)(a1 + 144);
  int32x4_t v33 = *(int32x4_t *)(a1 + 160);
  long long v35 = *(_OWORD *)(a1 + 128);
  long long v36 = v32;
  int32x4_t v37 = v33;
  do
  {
    *(float32x4_t *)((char *)&v38 + v28) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(long long *)((char *)&v35 + v28))), v30, *(float32x2_t *)((char *)&v35 + v28), 1), v31, *(float32x4_t *)((char *)&v35 + v28), 2);
    v28 += 16;
  }
  while (v28 != 48);
  return *(double *)v38.i64;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(CIPerspectiveRotate *)self outputTransform];
  inputImage = self->inputImage;

  return perspectiveTransformImage(inputImage, v3);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputFocalLength
{
  return self->inputFocalLength;
}

- (void)setInputFocalLength:(id)a3
{
}

- (NSNumber)inputPitch
{
  return self->inputPitch;
}

- (void)setInputPitch:(id)a3
{
}

- (NSNumber)inputYaw
{
  return self->inputYaw;
}

- (void)setInputYaw:(id)a3
{
}

- (NSNumber)inputRoll
{
  return self->inputRoll;
}

- (void)setInputRoll:(id)a3
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 8) = 0u;
  return self;
}

@end