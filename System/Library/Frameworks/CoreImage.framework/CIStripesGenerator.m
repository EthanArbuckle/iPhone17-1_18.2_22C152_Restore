@interface CIStripesGenerator
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

@implementation CIStripesGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_stripes];
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGenerator";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryHighDynamicRange";
  v11[4] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"5";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.4";
  v12[3] = @"inputWidth";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A9E60;
  v10[1] = &unk_1EE4A9E70;
  v9[2] = @"CIAttributeDefault";
  v9[3] = @"CIAttributeType";
  v10[2] = &unk_1EE4A9E80;
  v10[3] = @"CIAttributeTypeDistance";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v12[4] = @"inputSharpness";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeMax";
  v8[0] = &unk_1EE4A9E60;
  v8[1] = &unk_1EE4A9E90;
  v7[2] = @"CIAttributeSliderMin";
  v7[3] = @"CIAttributeSliderMax";
  v8[2] = &unk_1EE4A9E60;
  v8[3] = &unk_1EE4A9E90;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9E90;
  v8[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputColor0";
  v5 = @"CIAttributeDefault";
  v6 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0];
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v12[6] = @"inputColor1";
  v4 = +[CIColor colorWithRed:0.0, 0.0, 0.0, @"CIAttributeDefault" green blue];
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v19[4] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  if (fabsf(v3) <= 0.000001)
  {
    inputColor0 = self->inputColor0;
    return +[CIImage imageWithColor:inputColor0];
  }
  else
  {
    v5 = self->inputColor0;
    if (!v5) {
      v5 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    }
    inputColor1 = self->inputColor1;
    if (!inputColor1) {
      inputColor1 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    }
    [(NSNumber *)self->inputSharpness floatValue];
    float v8 = 1.0 / (1.00001 - fminf(fmaxf(v7, 0.0), 1.0));
    float v9 = 1.0 / (float)(v4 + v4);
    inputCenter = self->inputCenter;
    if (!inputCenter) {
      inputCenter = +[CIVector vectorWithX:0.0 Y:0.0];
    }
    v11 = +[CIVector vectorWithX:v9 Y:(float)(v8 + v8) Z:(float)((float)(1.0 - v8) * 0.5)];
    id v12 = [(CIStripesGenerator *)self _kernel];
    double v13 = *MEMORY[0x1E4F1DB10];
    double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v19[0] = inputCenter;
    v19[1] = v5;
    v19[2] = inputColor1;
    v19[3] = v11;
    return (id)objc_msgSend(v12, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 4), v13, v14, v15, v16);
  }
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
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

@end