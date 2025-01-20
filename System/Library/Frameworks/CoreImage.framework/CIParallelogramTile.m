@interface CIParallelogramTile
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIParallelogramTile

- (id)outputImage
{
  v43[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputAcuteAngle floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputWidth floatValue];
  float v39 = v7;
  inputCenter = self->inputCenter;
  [(CIVector *)inputCenter X];
  float64_t v37 = v9;
  [(CIVector *)inputCenter Y];
  v10.f64[0] = v37;
  v10.f64[1] = v11;
  float32x2_t v12 = vcvt_f32_f64(v10);
  __float2 v13 = __sincosf_stret(v4);
  float32x2_t v38 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v13.__sinval), LODWORD(v13.__cosval)), v39);
  __float2 v14 = __sincosf_stret(v4 + v6);
  float32x2_t v15 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v14.__sinval), LODWORD(v14.__cosval)), v39);
  float v16 = v15.f32[1];
  float v17 = vmlas_n_f32((float)-v38.f32[1] * v15.f32[0], v15.f32[1], v38.f32[0]);
  if (fabsf(v17) >= 0.01)
  {
    float v21 = 0.5 / v17;
    float v22 = v15.f32[1] * v21;
    float v23 = v21 * (float)-v38.f32[1];
    float v24 = -(float)(v15.f32[0] * v21);
    float v25 = v38.f32[0] * v21;
    float32x2_t v26 = vadd_f32(v38, v12);
    float32x2_t v27 = vadd_f32(v15, v12);
    float32x2_t v28 = vadd_f32(v15, v26);
    *(float32x2_t *)&long long v29 = vminnm_f32(v12, vminnm_f32(v26, vminnm_f32(v27, v28)));
    *((float32x2_t *)&v29 + 1) = vsub_f32(vmaxnm_f32(v12, vmaxnm_f32(v26, vmaxnm_f32(v27, v28))), *(float32x2_t *)&v29);
    long long v34 = v29;
    float v35 = v15.f32[0];
    v30 = +[CIKernel kernelWithInternalRepresentation:&CI::_parallelogramTile];
    double v40 = *MEMORY[0x1E4F1DB10];
    double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v36 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v32 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __34__CIParallelogramTile_outputImage__block_invoke;
    v41[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    long long v42 = v34;
    inputImage = self->inputImage;
    v43[0] = self->inputCenter;
    v43[1] = +[CIVector vectorWithX:v22 Y:v24 Z:v23 W:v25];
    v43[2] = +[CIVector vectorWithX:v38.f32[0] Y:v35 Z:v38.f32[1] W:v16];
    return -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](v30, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3], v40, v36, v31, v32);
  }
  else
  {
    float32x2_t v18 = vrndm_f32(v12);
    v19 = -[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", v18.f32[0], v18.f32[1], 1.0, 1.0, *(double *)&v38);
    return [(CIImage *)v19 imageByClampingToExtent];
  }
}

double __34__CIParallelogramTile_outputImage__block_invoke(float *a1)
{
  v2.origin.x = a1[8];
  v2.origin.y = a1[9];
  v2.size.width = a1[10];
  v2.size.height = a1[11];
  *(void *)&double result = (unint64_t)CGRectInset(v2, -0.5, -0.5);
  return result;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryTileEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"9";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputAcuteAngle";
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
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputWidth";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A95F0;
  v4[1] = &unk_1EE4A9600;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9610;
  v4[3] = &unk_1EE4A9620;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9620;
  v4[5] = @"CIAttributeTypeDistance";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end