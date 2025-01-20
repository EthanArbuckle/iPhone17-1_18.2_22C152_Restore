@interface CIKeystoneCorrection
+ (id)customAttributes;
- (CIFilter)outputRotationFilter;
- (CIImage)inputImage;
- (CIVector)inputBottomLeft;
- (CIVector)inputBottomRight;
- (CIVector)inputTopLeft;
- (CIVector)inputTopRight;
- (NSNumber)inputFocalLength;
- (double)outputTransform;
- (id).cxx_construct;
- (id)outputImage;
- (void)computeCameraIntrinsics;
- (void)setInputBottomLeft:(id)a3;
- (void)setInputBottomRight:(id)a3;
- (void)setInputFocalLength:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputTopLeft:(id)a3;
- (void)setInputTopRight:(id)a3;
@end

@implementation CIKeystoneCorrection

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryGeometryAdjustment";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
  v15[1] = @"13";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.15";
  v14[3] = @"inputFocalLength";
  v11[0] = @"CIAttributeType";
  v11[1] = @"CIAttributeDefault";
  v12[0] = @"CIAttributeTypeScalar";
  v12[1] = &unk_1EE4AAC10;
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputTopLeft";
  v9 = @"CIAttributeType";
  v10 = @"CIAttributeTypePosition";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[5] = @"inputTopRight";
  v7 = @"CIAttributeType";
  v8 = @"CIAttributeTypePosition";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v14[6] = @"inputBottomRight";
  v5 = @"CIAttributeType";
  v6 = @"CIAttributeTypePosition";
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v14[7] = @"inputBottomLeft";
  v3 = @"CIAttributeType";
  v4 = @"CIAttributeTypePosition";
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
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
  *(__n64 *)v2.f32 = CI::Perspective::getRotation((CI::Perspective *)[(id)a1 computeRotation], *(float *)(a1 + 176), *(float *)(a1 + 180), *(float *)(a1 + 184));
  uint64_t v5 = 0;
  float32x4_t v6 = vaddq_f32(v4, vmlaq_f32(vmulq_f32(v2, (float32x4_t)0), (float32x4_t)0, v3));
  float32x4_t v7 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2);
  int32x4_t v8 = (int32x4_t)vdivq_f32(v6, v7);
  v7.f32[0] = -*(float *)v8.i32;
  *(float *)v8.i32 = -*(float *)&v8.i32[1];
  __asm { FMOV            V5.4S, #1.0 }
  int32x4_t v14 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)v7.f32, 0), _Q5), v8);
  float32x4_t v15 = *(float32x4_t *)(a1 + 80);
  float32x4_t v16 = *(float32x4_t *)(a1 + 96);
  float32x4_t v17 = *(float32x4_t *)(a1 + 112);
  long long v29 = xmmword_193954F70;
  long long v30 = xmmword_193954F80;
  int32x4_t v31 = v14;
  do
  {
    *(float32x4_t *)((char *)&v32 + v5) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(long long *)((char *)&v29 + v5))), v16, *(float32x2_t *)((char *)&v29 + v5), 1), v17, *(float32x4_t *)((char *)&v29 + v5), 2);
    v5 += 16;
  }
  while (v5 != 48);
  uint64_t v18 = 0;
  float32x4_t v19 = v32;
  float32x4_t v20 = v33;
  float32x4_t v21 = v34;
  long long v29 = (__int128)v2;
  long long v30 = (__int128)v3;
  int32x4_t v31 = (int32x4_t)v4;
  do
  {
    *(float32x4_t *)((char *)&v32 + v18) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(long long *)((char *)&v29 + v18))), v20, *(float32x2_t *)((char *)&v29 + v18), 1), v21, *(float32x4_t *)((char *)&v29 + v18), 2);
    v18 += 16;
  }
  while (v18 != 48);
  uint64_t v22 = 0;
  float32x4_t v23 = v32;
  float32x4_t v24 = v33;
  float32x4_t v25 = v34;
  long long v26 = *(_OWORD *)(a1 + 144);
  int32x4_t v27 = *(int32x4_t *)(a1 + 160);
  long long v29 = *(_OWORD *)(a1 + 128);
  long long v30 = v26;
  int32x4_t v31 = v27;
  do
  {
    *(float32x4_t *)((char *)&v32 + v22) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(long long *)((char *)&v29 + v22))), v24, *(float32x2_t *)((char *)&v29 + v22), 1), v25, *(float32x4_t *)((char *)&v29 + v22), 2);
    v22 += 16;
  }
  while (v22 != 48);
  return *(double *)v32.i64;
}

- (CIFilter)outputRotationFilter
{
  [(CIKeystoneCorrection *)self computeCameraIntrinsics];
  [(CIKeystoneCorrection *)self computeRotation];
  float32x4_t v3 = +[CIFilter filterWithName:@"CIPerspectiveRotate"];
  [(CIFilter *)v3 setValue:self->inputImage forKey:@"inputImage"];
  [(CIFilter *)v3 setValue:self->inputFocalLength forKey:@"inputFocalLength"];
  *(float *)&double v4 = self->pitch;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", [NSNumber numberWithFloat:v4], @"inputPitch");
  *(float *)&double v5 = self->yaw;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", [NSNumber numberWithFloat:v5], @"inputYaw");
  *(float *)&double v6 = self->roll;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", [NSNumber numberWithFloat:v6], @"inputRoll");
  return v3;
}

- (id)outputImage
{
  id result = self->inputImage;
  if (result && self->inputBottomLeft && self->inputTopLeft && self->inputTopRight && self->inputBottomRight)
  {
    [(CIKeystoneCorrection *)self outputTransform];
    inputImage = self->inputImage;
    return perspectiveTransformImage(inputImage, v4);
  }
  return result;
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

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
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