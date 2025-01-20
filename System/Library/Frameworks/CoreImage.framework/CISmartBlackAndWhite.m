@interface CISmartBlackAndWhite
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputGrain;
- (NSNumber)inputHue;
- (NSNumber)inputNeutralGamma;
- (NSNumber)inputScaleFactor;
- (NSNumber)inputSeed;
- (NSNumber)inputStrength;
- (NSNumber)inputTone;
- (float)createHueArray;
- (id)_kernel;
- (id)hueArrayImage:(float *)a3;
- (id)outputImage;
- (void)getNonNormalizedSettings:(id *)a3;
- (void)setInputGrain:(id)a3;
- (void)setInputHue:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputNeutralGamma:(id)a3;
- (void)setInputScaleFactor:(id)a3;
- (void)setInputSeed:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputTone:(id)a3;
@end

@implementation CISmartBlackAndWhite

- (void)getNonNormalizedSettings:(id *)a3
{
  a3->var0 = 1;
  [(NSNumber *)self->inputHue floatValue];
  a3->float var1 = v5;
  [(NSNumber *)self->inputStrength floatValue];
  a3->float var2 = v6;
  [(NSNumber *)self->inputNeutralGamma floatValue];
  a3->var3 = v7;
  [(NSNumber *)self->inputTone floatValue];
  float v28 = v8;
  a3->var4 = v8;
  float var1 = a3->var1;
  float var2 = a3->var2;
  double v11 = var2;
  double v12 = var2 * cos((float)(0.60167 - var1) * 6.28318531) + 1.0;
  if (v12 <= 1.0) {
    double v13 = v12 * -2.0 + 3.0;
  }
  else {
    double v13 = (v12 + -1.0) * -0.55 + 1.0;
  }
  float v14 = v13;
  float v15 = powf(0.3, v14);
  double v16 = v11 * cos((float)(0.8663 - var1) * 6.28318531) + 1.0;
  if (v16 <= 1.0) {
    double v17 = v16 * -2.0 + 3.0;
  }
  else {
    double v17 = (v16 + -1.0) * -0.55 + 1.0;
  }
  float v18 = v17;
  float v19 = powf(0.6, v18);
  double v20 = v11 * cos((float)(0.22284 - var1) * 6.28318531) + 1.0;
  if (v20 <= 1.0) {
    double v21 = v20 * -2.0 + 3.0;
  }
  else {
    double v21 = (v20 + -1.0) * -0.55 + 1.0;
  }
  float v22 = v21;
  float v23 = powf(0.1, v22);
  float v24 = v23 + (float)(v15 + v19);
  a3->var5[0] = v15 / v24;
  a3->var5[1] = v19 / v24;
  a3->var5[2] = v23 / v24;
  if (a3->var0)
  {
    a3->var0 = 0;
    float v25 = var1 * 0.5 + 0.35;
    if (v25 < 0.0) {
      float v25 = v25 + 1.0;
    }
    float v26 = (float)((float)(var2 + -0.5) * 1.2) + 0.4;
    if (var2 <= 0.5) {
      float v26 = var2 * 0.8;
    }
    a3->float var1 = v25;
    a3->float var2 = v26;
    float v27 = v28 + v28;
    if (v28 <= 0.0) {
      float v27 = v28;
    }
    a3->var3 = a3->var3 + 1.0;
    a3->var4 = v27;
  }
}

- (float)createHueArray
{
  [(CISmartBlackAndWhite *)self getNonNormalizedSettings:v29];
  v2 = (float *)malloc_type_malloc(0x5A0uLL, 0x100004052888210uLL);
  uint64_t v3 = 0;
  int32x4_t v4 = (int32x4_t)xmmword_19394C9F0;
  float64x2_t v22 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
  float32x4_t v23 = (float32x4_t)vdupq_n_s32(0x43B38000u);
  float32x4_t v20 = (float32x4_t)vdupq_lane_s32(v30, 0);
  float32x4_t v21 = (float32x4_t)vdupq_n_s32(0x3EE66666u);
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v18 = _Q0;
  float64x2_t v19 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)&v30.i32[1]), 0);
  __asm { FMOV            V0.4S, #3.0 }
  float32x4_t v17 = _Q0;
  do
  {
    int32x4_t v27 = v4;
    float32x4_t v11 = vsubq_f32(vdivq_f32(vcvtq_f32_s32(v4), v23), v20);
    float64x2_t v28 = vmulq_f64(vcvt_hight_f64_f32(v11), v22);
    float64x2_t __x = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v11.f32), v22);
    long double v25 = cos(__x.f64[1]);
    v12.f64[0] = cos(__x.f64[0]);
    v12.f64[1] = v25;
    float64x2_t v26 = v12;
    __x.f64[0] = cos(v28.f64[1]);
    v13.f64[0] = cos(v28.f64[0]);
    v13.f64[1] = __x.f64[0];
    float32x4_t v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v18, v26, v19)), vmlaq_f64(v18, v13, v19));
    float32x4_t v15 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v21, v14), (int8x16_t)v21, (int8x16_t)v14);
    *(int8x16_t *)&v2[v3] = vbslq_s8((int8x16_t)vcgtq_f32(v15, v17), (int8x16_t)v17, (int8x16_t)v15);
    v15.i64[0] = 0x400000004;
    v15.i64[1] = 0x400000004;
    int32x4_t v4 = vaddq_s32(v27, (int32x4_t)v15);
    v3 += 4;
  }
  while (v3 != 360);
  return v2;
}

- (id)hueArrayImage:(float *)a3
{
  v13[5] = *MEMORY[0x1E4F143B8];
  int32x4_t v4 = [(CISmartBlackAndWhite *)self createHueArray];
  float v5 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:368];
  float v6 = v5;
  float v7 = *v4;
  for (uint64_t i = 1; i != 360; ++i)
  {
    if (v7 <= v4[i]) {
      float v7 = v4[i];
    }
  }
  uint64_t v9 = [v5 mutableBytes];
  for (uint64_t j = 0; j != 360; ++j)
    *(unsigned char *)(v9 + j) = (int)fmaxf(fminf((float)(v4[j] * 255.0) / v7, 255.0), 0.0);
  *a3 = v7;
  free(v4);
  v12[0] = @"CIImageColorSpace";
  v12[1] = @"CIImageFlipped";
  v12[2] = @"CIImageClampToEdge";
  v13[0] = [MEMORY[0x1E4F1CA98] null];
  v13[1] = MEMORY[0x1E4F1CC28];
  v13[2] = MEMORY[0x1E4F1CC38];
  v13[3] = MEMORY[0x1E4F1CC28];
  v12[3] = @"CIImageNearestSampling";
  v12[4] = @"kCIImageCacheHint";
  v13[4] = MEMORY[0x1E4F1CC38];
  return +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v6, 368, 257, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5], 360.0, 1.0);
}

+ (id)customAttributes
{
  v19[8] = *MEMORY[0x1E4F143B8];
  v18[0] = @"CIAttributeFilterCategories";
  v17[0] = @"CICategoryColorEffect";
  v17[1] = @"CICategoryVideo";
  v17[2] = @"CICategoryInterlaced";
  v17[3] = @"CICategoryNonSquarePixels";
  v17[4] = @"CICategoryStillImage";
  v17[5] = @"CICategoryBuiltIn";
  v17[6] = @"CICategoryApplePrivate";
  v19[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:7];
  v18[1] = @"inputStrength";
  v15[0] = @"CIAttributeMin";
  v15[1] = @"CIAttributeSliderMin";
  v16[0] = &unk_1EE4A9BD0;
  v16[1] = &unk_1EE4A9BD0;
  v15[2] = @"CIAttributeSliderMax";
  v15[3] = @"CIAttributeMax";
  v16[2] = &unk_1EE4A9BE0;
  v16[3] = &unk_1EE4A9BE0;
  v15[4] = @"CIAttributeDefault";
  v15[5] = @"CIAttributeType";
  v16[4] = &unk_1EE4A9BF0;
  v16[5] = @"CIAttributeTypeScalar";
  v19[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  v18[2] = @"inputNeutralGamma";
  v13[0] = @"CIAttributeMin";
  v13[1] = @"CIAttributeSliderMin";
  v14[0] = &unk_1EE4A9C00;
  v14[1] = &unk_1EE4A9C00;
  v13[2] = @"CIAttributeSliderMax";
  v13[3] = @"CIAttributeMax";
  v14[2] = &unk_1EE4A9BE0;
  v14[3] = &unk_1EE4A9BE0;
  v13[4] = @"CIAttributeDefault";
  v13[5] = @"CIAttributeType";
  v14[4] = &unk_1EE4A9BD0;
  v14[5] = @"CIAttributeTypeScalar";
  v19[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  v18[3] = @"inputTone";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9C00;
  v12[1] = &unk_1EE4A9C00;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeMax";
  v12[2] = &unk_1EE4A9BE0;
  v12[3] = &unk_1EE4A9BE0;
  v11[4] = @"CIAttributeDefault";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A9BD0;
  void v12[5] = @"CIAttributeTypeScalar";
  v19[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v18[4] = @"inputHue";
  v9[0] = @"CIAttributeMin";
  v9[1] = @"CIAttributeSliderMin";
  v10[0] = &unk_1EE4A9C00;
  v10[1] = &unk_1EE4A9C00;
  v9[2] = @"CIAttributeSliderMax";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A9BE0;
  v10[3] = &unk_1EE4A9BE0;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9BD0;
  v10[5] = @"CIAttributeTypeScalar";
  v19[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v18[5] = @"inputGrain";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9BD0;
  v8[1] = &unk_1EE4A9BD0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A9BE0;
  v8[3] = &unk_1EE4A9BE0;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9BD0;
  v8[5] = @"CIAttributeTypeScalar";
  v19[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v18[6] = @"inputSeed";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9BD0;
  v6[1] = &unk_1EE4A9BD0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9BE0;
  v6[3] = &unk_1EE4A9BD0;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v19[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v18[7] = @"inputScaleFactor";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4A9BD0;
  v4[1] = &unk_1EE4A9BE0;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeType";
  v4[2] = &unk_1EE4A9BE0;
  v4[3] = @"CIAttributeTypeScalar";
  v19[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:8];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartBlackAndWhite];
}

- (id)outputImage
{
  unsigned char v29[4] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage
    || !self->inputNeutralGamma
    || !self->inputTone
    || !self->inputStrength
    || !self->inputScaleFactor)
  {
    return 0;
  }
  float v26 = 1.0;
  id v3 = [(CISmartBlackAndWhite *)self hueArrayImage:&v26];
  if (v3)
  {
    [(CISmartBlackAndWhite *)self getNonNormalizedSettings:v20];
    int32x4_t v4 = +[CIVector vectorWithX:v23 Y:v24 Z:v25 W:v26];
    float v5 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    float v6 = +[CIVector vectorWithX:0.997222245 Y:0.00138888892 Z:v21 W:v22];
    id v7 = [(CISmartBlackAndWhite *)self _kernel];
    [(CIImage *)self->inputImage extent];
    v29[0] = v5;
    v29[1] = v3;
    v29[2] = v4;
    v29[3] = v6;
    id v3 = (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 4), v8, v9, v10, v11), "imageByPremultiplyingAlpha");
    [(NSNumber *)self->inputGrain floatValue];
    if (v12 > 0.0)
    {
      float v13 = v12;
      [(NSNumber *)self->inputScaleFactor floatValue];
      *(float *)&double v15 = v14 * 100.0;
      v27[0] = @"inputISO";
      v28[0] = [NSNumber numberWithFloat:v15];
      v27[1] = @"inputAmount";
      *(float *)&double v16 = v13;
      uint64_t v17 = [NSNumber numberWithFloat:v16];
      v27[2] = @"inputSeed";
      inputSeed = self->inputSeed;
      v28[1] = v17;
      v28[2] = inputSeed;
      return (id)objc_msgSend(v3, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    }
  }
  return v3;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputNeutralGamma
{
  return self->inputNeutralGamma;
}

- (void)setInputNeutralGamma:(id)a3
{
}

- (NSNumber)inputTone
{
  return self->inputTone;
}

- (void)setInputTone:(id)a3
{
}

- (NSNumber)inputHue
{
  return self->inputHue;
}

- (void)setInputHue:(id)a3
{
}

- (NSNumber)inputGrain
{
  return self->inputGrain;
}

- (void)setInputGrain:(id)a3
{
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
}

@end