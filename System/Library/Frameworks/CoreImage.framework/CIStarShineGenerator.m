@interface CIStarShineGenerator
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIVector)inputCenter;
- (NSNumber)inputCrossAngle;
- (NSNumber)inputCrossOpacity;
- (NSNumber)inputCrossScale;
- (NSNumber)inputCrossWidth;
- (NSNumber)inputEpsilon;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor:(id)a3;
- (void)setInputCrossAngle:(id)a3;
- (void)setInputCrossOpacity:(id)a3;
- (void)setInputCrossScale:(id)a3;
- (void)setInputCrossWidth:(id)a3;
- (void)setInputEpsilon:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIStarShineGenerator

+ (id)customAttributes
{
  v19[10] = *MEMORY[0x1E4F143B8];
  v18[0] = @"CIAttributeFilterCategories";
  v17[0] = @"CICategoryGenerator";
  v17[1] = @"CICategoryVideo";
  v17[2] = @"CICategoryStillImage";
  v17[3] = @"CICategoryHighDynamicRange";
  v17[4] = @"CICategoryBuiltIn";
  v19[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v19[1] = @"6";
  v18[1] = @"CIAttributeFilterAvailable_iOS";
  v18[2] = @"CIAttributeFilterAvailable_Mac";
  v19[2] = @"10.4";
  v18[3] = @"inputColor";
  v15 = @"CIAttributeDefault";
  v16 = +[CIColor colorWithRed:1.0 green:0.8 blue:0.6];
  v19[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[4] = @"inputRadius";
  v13[0] = @"CIAttributeMin";
  v13[1] = @"CIAttributeSliderMin";
  v14[0] = &unk_1EE4A9D60;
  v14[1] = &unk_1EE4A9D60;
  v13[2] = @"CIAttributeSliderMax";
  v13[3] = @"CIAttributeDefault";
  v14[2] = &unk_1EE4A9D70;
  v14[3] = &unk_1EE4A9D80;
  v13[4] = @"CIAttributeType";
  v14[4] = @"CIAttributeTypeDistance";
  v19[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v18[5] = @"inputCrossScale";
  v11[0] = @"CIAttributeMin";
  v11[1] = @"CIAttributeSliderMin";
  v12[0] = &unk_1EE4A9D60;
  v12[1] = &unk_1EE4A9D60;
  v11[2] = @"CIAttributeSliderMax";
  v11[3] = @"CIAttributeDefault";
  v12[2] = &unk_1EE4A9D90;
  v12[3] = &unk_1EE4A9DA0;
  v11[4] = @"CIAttributeIdentity";
  v11[5] = @"CIAttributeType";
  v12[4] = &unk_1EE4A9DA0;
  v12[5] = @"CIAttributeTypeScalar";
  v19[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  v18[6] = @"inputCrossAngle";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A9DB0;
  v10[1] = &unk_1EE4A9DC0;
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = &unk_1EE4A9DD0;
  v10[3] = @"CIAttributeTypeAngle";
  v19[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v18[7] = @"inputCrossOpacity";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9DE0;
  v8[1] = &unk_1EE4A9DE0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9D60;
  v8[3] = &unk_1EE4A9DF0;
  v7[4] = @"CIAttributeIdentity";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9DF0;
  v8[5] = @"CIAttributeTypeScalar";
  v19[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v18[8] = @"inputCrossWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9D60;
  v6[1] = &unk_1EE4A9E00;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9E10;
  v6[3] = &unk_1EE4A9E20;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v19[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v18[9] = @"inputEpsilon";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9DE0;
  v4[1] = &unk_1EE4A9DE0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9D60;
  v4[3] = &unk_1EE4A9DF0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A9DF0;
  v4[5] = @"CIAttributeTypeScalar";
  v19[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_starshine];
}

- (id)outputImage
{
  v28[5] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputCrossScale floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputCrossAngle floatValue];
  float v8 = v7;
  [(NSNumber *)self->inputCrossOpacity floatValue];
  float v10 = __exp10(v9);
  [(NSNumber *)self->inputCrossWidth floatValue];
  float v12 = v11;
  [(NSNumber *)self->inputEpsilon floatValue];
  float v14 = __exp10(v13);
  __float2 v15 = __sincosf_stret(v8);
  v16 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15.__cosval, v15.__sinval, (float)-v15.__sinval);
  v17 = +[CIVector vectorWithX:v4 Y:(float)(1.0 / (float)(v4 * v6)) Z:v10 W:v14];
  float v18 = 1.0 / v12;
  id v19 = [(CIStarShineGenerator *)self _kernel];
  double v20 = *MEMORY[0x1E4F1DB10];
  double v21 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  *(float *)&double v24 = v18;
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithFloat:", v24, self->inputCenter, v16, v17);
  inputColor = self->inputColor;
  v28[3] = v25;
  v28[4] = inputColor;
  return (id)objc_msgSend(v19, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 5), v20, v21, v22, v23);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputEpsilon
{
  return self->inputEpsilon;
}

- (void)setInputEpsilon:(id)a3
{
}

- (NSNumber)inputCrossAngle
{
  return self->inputCrossAngle;
}

- (void)setInputCrossAngle:(id)a3
{
}

- (NSNumber)inputCrossScale
{
  return self->inputCrossScale;
}

- (void)setInputCrossScale:(id)a3
{
}

- (NSNumber)inputCrossWidth
{
  return self->inputCrossWidth;
}

- (void)setInputCrossWidth:(id)a3
{
}

- (NSNumber)inputCrossOpacity
{
  return self->inputCrossOpacity;
}

- (void)setInputCrossOpacity:(id)a3
{
}

@end