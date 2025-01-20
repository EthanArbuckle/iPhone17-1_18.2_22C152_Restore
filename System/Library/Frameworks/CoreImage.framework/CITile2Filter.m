@interface CITile2Filter
+ (id)customAttributes;
- (CGRect)_roiRect;
- (NSNumber)inputAcuteAngle;
- (double)_roiArea;
- (float32x2_t)_roiCenter;
- (id)_singlePixelImage;
- (id)outputImage;
- (void)setInputAcuteAngle:(id)a3;
@end

@implementation CITile2Filter

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryTileEffect";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"6";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.5";
  v12[3] = @"inputCenter";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v10[1] = @"CIAttributeTypePosition";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputAngle";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A9990;
  v8[1] = &unk_1EE4A99A0;
  v7[2] = @"CIAttributeDefault";
  v7[3] = @"CIAttributeIdentity";
  v8[2] = &unk_1EE4A99B0;
  v8[3] = &unk_1EE4A99B0;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeAngle";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputAcuteAngle";
  v5[0] = @"CIAttributeSliderMin";
  v6[0] = [NSNumber numberWithDouble:-3.14159265];
  v5[1] = @"CIAttributeSliderMax";
  v6[1] = [NSNumber numberWithDouble:3.14159265];
  v5[2] = @"CIAttributeDefault";
  v6[2] = [NSNumber numberWithDouble:1.57079633];
  v5[3] = @"CIAttributeIdentity";
  v5[4] = @"CIAttributeType";
  v6[3] = [NSNumber numberWithDouble:1.57079633];
  v6[4] = @"CIAttributeTypeAngle";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v12[6] = @"inputWidth";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A99B0;
  v4[1] = &unk_1EE4A99C0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A99D0;
  v4[3] = &unk_1EE4A99E0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A99E0;
  v4[5] = @"CIAttributeTypeDistance";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (CGRect)_roiRect
{
  [(NSNumber *)self->super.inputWidth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->super.inputAngle doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputAcuteAngle doubleValue];
  double v8 = v7;
  __double2 v9 = __sincos_stret(v6);
  double v10 = v4 * v9.__cosval;
  double v11 = v4 * v9.__sinval;
  __double2 v12 = __sincos_stret(v6 + v8);
  double v13 = v4 * v12.__cosval;
  double v14 = v4 * v12.__sinval;
  [(CIVector *)self->super.inputCenter X];
  float64_t v32 = v15;
  [(CIVector *)self->super.inputCenter Y];
  v16.f64[0] = v32;
  v16.f64[1] = v17;
  float32x2_t v18 = vcvt_f32_f64(v16);
  *(float *)v16.f64 = v10;
  float v19 = v11;
  *((float *)v16.f64 + 1) = v19;
  *(float32x2_t *)&v16.f64[0] = vadd_f32(*(float32x2_t *)&v16.f64[0], v18);
  v20.f32[0] = v13;
  float32_t v21 = v14;
  v20.f32[1] = v21;
  float32x2_t v22 = vadd_f32(v20, v18);
  v23.f32[0] = v10 + v13;
  float32_t v24 = v11 + v14;
  v23.f32[1] = v24;
  float32x2_t v25 = vadd_f32(v23, v18);
  float32x2_t v26 = vminnm_f32(vminnm_f32(vminnm_f32(v18, *(float32x2_t *)&v16.f64[0]), v22), v25);
  float32x2_t v29 = vsub_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(v18, *(float32x2_t *)&v16.f64[0]), v22), v25), v26);
  double v30 = v29.f32[0];
  double v31 = v29.f32[1];

  double v27 = v26.f32[0];
  double v28 = v26.f32[1];
  return CGRectIntegral(*(CGRect *)(&v30 - 2));
}

- (double)_roiArea
{
  [(NSNumber *)self->super.inputWidth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputAcuteAngle doubleValue];
  return v4 * v4 * fabs(sin(v5));
}

- (float32x2_t)_roiCenter
{
  [a1[13] doubleValue];
  double v3 = v2;
  [a1[12] doubleValue];
  double v5 = v4;
  [a1[14] doubleValue];
  double v7 = v6;
  __double2 v8 = __sincos_stret(v5);
  __double2 v9 = __sincos_stret(v5 + v7);
  [a1[11] X];
  float64_t v16 = v10;
  [a1[11] Y];
  v11.f64[0] = v16;
  v11.f64[1] = v12;
  float32x2_t v13 = vcvt_f32_f64(v11);
  v14.f32[0] = v3 * v9.__cosval * 0.5 + v3 * v8.__cosval * 0.5;
  *(float *)v11.f64 = v3 * v9.__sinval * 0.5 + v3 * v8.__sinval * 0.5;
  v14.i32[1] = LODWORD(v11.f64[0]);
  return vadd_f32(v14, v13);
}

- (id)_singlePixelImage
{
  [(CITile2Filter *)self _roiArea];
  if (v3 >= 1.0) {
    return 0;
  }
  [(CITile2Filter *)self _roiCenter];
  float32x2_t v5 = vrndm_f32(v4);
  double v6 = -[CIImage imageByCroppingToRect:](self->super.inputImage, "imageByCroppingToRect:", v5.f32[0], v5.f32[1], 1.0, 1.0);

  return [(CIImage *)v6 imageByClampingToExtent];
}

- (id)outputImage
{
  v40[3] = *MEMORY[0x1E4F143B8];
  if (!self->super.inputImage || !self->super.inputCenter) {
    return 0;
  }
  id v3 = [(CITile2Filter *)self _singlePixelImage];
  if (!v3)
  {
    [(NSNumber *)self->super.inputWidth doubleValue];
    double v5 = v4;
    [(NSNumber *)self->super.inputAngle doubleValue];
    double v7 = v6;
    [(NSNumber *)self->inputAcuteAngle doubleValue];
    double v9 = v8;
    [(CIVector *)self->super.inputCenter X];
    double v11 = v10;
    [(CIVector *)self->super.inputCenter Y];
    double v13 = v12;
    __double2 v14 = __sincos_stret(v7);
    __double2 v15 = __sincos_stret(v7 + v9);
    double v36 = v5 * v14.__cosval;
    double v37 = v5 * v14.__sinval;
    double v38 = v5 * v15.__cosval;
    double v39 = v5 * v15.__sinval;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x5012000000;
    v33[3] = __Block_byref_object_copy__16;
    v33[4] = __Block_byref_object_dispose__16;
    v33[5] = "";
    long long v34 = 0u;
    long long v35 = 0u;
    [(CITile2Filter *)self _roiRect];
    *(void *)&long long v34 = v16;
    *((void *)&v34 + 1) = v17;
    *(void *)&long long v35 = v18;
    *((void *)&v35 + 1) = v19;
    affine::inverse((affine *)&v36, v32);
    float32x2_t v20 = +[CIVector vectorWithX:v32[0] * 0.5 Y:v32[2] * 0.5 Z:v32[1] * 0.5 W:v32[3] * 0.5];
    float32_t v21 = +[CIVector vectorWithX:v36 Y:v38 Z:v37 W:v39];
    id v22 = [(CITileFilter *)self _kernel];
    float v23 = v11;
    float v24 = v13;
    double v25 = *MEMORY[0x1E4F1DB10];
    double v26 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __28__CITile2Filter_outputImage__block_invoke;
    v31[3] = &unk_1E5771720;
    v31[4] = v33;
    inputImage = self->super.inputImage;
    v40[0] = +[CIVector vectorWithX:v23 Y:v24];
    v40[1] = v20;
    v40[2] = v21;
    id v3 = (id)objc_msgSend(v22, "applyWithExtent:roiCallback:inputImage:arguments:", v31, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v40, 3), v25, v26, v27, v28);
    _Block_object_dispose(v33, 8);
  }
  return v3;
}

double __28__CITile2Filter_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
}

- (NSNumber)inputAcuteAngle
{
  return self->inputAcuteAngle;
}

- (void)setInputAcuteAngle:(id)a3
{
}

@end