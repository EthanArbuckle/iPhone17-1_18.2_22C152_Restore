@interface CIColorBalance
+ (id)customAttributes;
- (CIColor)inputColor;
- (CIImage)inputImage;
- (NSNumber)inputDamping;
- (NSNumber)inputStrength;
- (NSNumber)inputWarmth;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputDamping:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWarmth:(id)a3;
@end

@implementation CIColorBalance

+ (id)customAttributes
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryInterlaced";
  v11[4] = @"CICategoryNonSquarePixels";
  v11[5] = @"CICategoryBuiltIn";
  v11[6] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];
  v12[1] = @"inputColor";
  v9[0] = @"CIAttributeDefault";
  v9[1] = @"CIAttributeType";
  v10[0] = +[CIColor colorWithRed:0.5 green:0.5 blue:0.5];
  v10[1] = @"CIAttributeTypeColor";
  v13[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[2] = @"inputStrength";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A7FD0;
  v8[1] = &unk_1EE4A7FE0;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A7FD0;
  v8[3] = &unk_1EE4A7FE0;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeIdentity";
  v8[4] = &unk_1EE4A7FF0;
  v8[5] = &unk_1EE4A7FD0;
  v7[6] = @"CIAttributeType";
  v8[6] = @"CIAttributeTypeScalar";
  v13[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  v12[3] = @"inputWarmth";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A7FD0;
  v6[1] = &unk_1EE4A8000;
  v5[2] = @"CIAttributeMin";
  v5[3] = @"CIAttributeMax";
  v6[2] = &unk_1EE4A7FD0;
  v6[3] = &unk_1EE4A8000;
  v5[4] = @"CIAttributeDefault";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4A7FF0;
  v6[5] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v12[4] = @"inputDamping";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A7FD0;
  v4[1] = &unk_1EE4A8000;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A7FD0;
  v4[3] = &unk_1EE4A8000;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8000;
  v4[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorbalance];
}

- (id)outputImage
{
  v24[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputWarmth doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputStrength doubleValue];
  double v6 = fmin(fmax(v5, 0.0), 2.0);
  [(NSNumber *)self->inputDamping doubleValue];
  if (fabs(v6) >= 0.001)
  {
    double v10 = fmin(fmax(v4, 0.0), 1.0);
    double v11 = (1.0 - v10) * 0.05 + v10 * -0.05;
    double v12 = (1.0 - v10) * -0.2 + v10 * 0.2;
    double v13 = fmin(fmax(v7, 0.001), 1.0);
    uint64_t v14 = objc_msgSend(-[CIImage _imageByApplyingGamma:](self->inputImage, "_imageByApplyingGamma:", 0.25), "imageByUnpremultiplyingAlpha");
    id v15 = [(CIColorBalance *)self _kernel];
    [(CIImage *)self->inputImage extent];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v12, v11, v6, v13, v14, self->inputColor);
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 3), v17, v19, v21, v23), "imageByPremultiplyingAlpha"), "_imageByApplyingGamma:", 4.0);
  }
  else
  {
    v8 = self->inputImage;
    return v8;
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputWarmth
{
  return self->inputWarmth;
}

- (void)setInputWarmth:(id)a3
{
}

- (NSNumber)inputDamping
{
  return self->inputDamping;
}

- (void)setInputDamping:(id)a3
{
}

@end