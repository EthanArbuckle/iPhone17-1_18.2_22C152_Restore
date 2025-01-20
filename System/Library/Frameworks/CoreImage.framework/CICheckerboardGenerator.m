@interface CICheckerboardGenerator
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIVector)inputCenter;
- (NSNumber)inputSharpness;
- (NSNumber)inputWidth;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputSharpness:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CICheckerboardGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_checker];
}

+ (id)customAttributes
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"CIAttributeFilterCategories";
  v13[0] = @"CICategoryGenerator";
  v13[1] = @"CICategoryVideo";
  v13[2] = @"CICategoryStillImage";
  v13[3] = @"CICategoryHighDynamicRange";
  v13[4] = @"CICategoryBuiltIn";
  v15[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
  v15[1] = @"5";
  v14[1] = @"CIAttributeFilterAvailable_iOS";
  v14[2] = @"CIAttributeFilterAvailable_Mac";
  v15[2] = @"10.4";
  v14[3] = @"inputCenter";
  v11[0] = @"CIAttributeDefault";
  v11[1] = @"CIAttributeType";
  v12[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v12[1] = @"CIAttributeTypePosition";
  v15[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[4] = @"inputWidth";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A7EE0;
  v10[1] = &unk_1EE4A7EF0;
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = &unk_1EE4A7F00;
  v10[3] = @"CIAttributeTypeDistance";
  v15[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v14[5] = @"inputSharpness";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4A7EE0;
  v8[1] = &unk_1EE4A7F10;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A7EE0;
  v8[3] = &unk_1EE4A7F10;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A7F10;
  v8[5] = @"CIAttributeTypeScalar";
  v15[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v14[6] = @"inputColor0";
  v5 = @"CIAttributeDefault";
  v6 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v15[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v14[7] = @"inputColor1";
  v4 = +[CIColor colorWithRed:0.0, 0.0, 0.0, @"CIAttributeDefault" green blue];
  v15[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)outputImage
{
  v24[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  v5 = &OBJC_IVAR___CICheckerboardGenerator_inputColor1;
  double v6 = fabsf(v3);
  if (v6 <= 0.000001) {
    v5 = &OBJC_IVAR___CICheckerboardGenerator_inputColor0;
  }
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + *v5);
  [(NSNumber *)self->inputSharpness floatValue];
  if (v6 > 0.000001) {
    double v9 = (float)(1.0 / (float)(v4 + v4));
  }
  else {
    double v9 = 500000.0;
  }
  float v10 = 1.0 / (1.00001 - fminf(fmaxf(v8, 0.0), 1.0));
  v11 = +[CIVector vectorWithX:v9 Y:(float)(v10 + v10) Z:(float)((float)(1.0 - v10) * 0.5)];
  [(CIVector *)self->inputCenter X];
  double v12 = 0.25 / v9;
  double v14 = 0.25 / v9 + v13;
  [(CIVector *)self->inputCenter Y];
  v16 = +[CIVector vectorWithX:v14 Y:v12 + v15];
  id v17 = [(CICheckerboardGenerator *)self _kernel];
  double v18 = *MEMORY[0x1E4F1DB10];
  double v19 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v21 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  inputColor0 = self->inputColor0;
  v24[0] = v16;
  v24[1] = inputColor0;
  v24[2] = v7;
  v24[3] = v11;
  return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 4), v18, v19, v20, v21);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
}

@end