@interface CINoiseReduction
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputNoiseLevel;
- (NSNumber)inputSharpness;
- (id)_CINoiseReduction;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputNoiseLevel:(id)a3;
- (void)setInputSharpness:(id)a3;
@end

@implementation CINoiseReduction

- (id)_CINoiseReduction
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_noiseReduction];
}

- (id)outputImage
{
  v27[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputSharpness floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputNoiseLevel floatValue];
  if (v5 <= 0.0)
  {
    double v7 = (float)-v4;
    double v8 = 0.0;
  }
  else
  {
    float v6 = (v4 + 1.0) / -0.0199999996;
    double v7 = (float)-(float)(v4 + (float)(v6 * v5));
    double v8 = v6 / 3.0;
  }
  v9 = +[CIVector vectorWithX:v7 Y:v8 Z:(float)-v4];
  v10 = +[CIVector vectorWithX:1.2912 Y:1.2921];
  v11 = +[CIVector vectorWithX:0.109088909 Y:0.114934928 Z:0.103904704];
  [(CIImage *)self->inputImage extent];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(CIImage *)self->inputImage imageByClampingToExtent];
  id v21 = [(CINoiseReduction *)self _CINoiseReduction];
  double v22 = *MEMORY[0x1E4F1DB10];
  double v23 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  v27[0] = v20;
  v27[1] = v10;
  v27[2] = v11;
  v27[3] = v9;
  return (id)objc_msgSend((id)objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_61, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 4), v22, v23, v24, v25), "imageByCroppingToRect:", v13, v15, v17, v19);
}

double __31__CINoiseReduction_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryBlur";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"9";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputSharpness";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeScalar";
  v6[1] = &unk_1EE4A9AA0;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A9AA0;
  v6[3] = &unk_1EE4A9AB0;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeIdentity";
  v6[4] = &unk_1EE4A9AC0;
  v6[5] = &unk_1EE4A9AA0;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputNoiseLevel";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A9AA0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A9AA0;
  v4[3] = &unk_1EE4A9AD0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A9AE0;
  v4[5] = &unk_1EE4A9AA0;
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

- (NSNumber)inputNoiseLevel
{
  return self->inputNoiseLevel;
}

- (void)setInputNoiseLevel:(id)a3
{
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
}

@end