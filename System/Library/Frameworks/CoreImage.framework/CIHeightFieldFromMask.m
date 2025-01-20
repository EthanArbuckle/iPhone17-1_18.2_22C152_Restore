@interface CIHeightFieldFromMask
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (id)_CIResetalpha;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIHeightFieldFromMask

- (id)_CIResetalpha
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_resetalpha];
}

- (id)outputImage
{
  v14[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputRadius floatValue];
  float v4 = v3;
  inputImage = self->inputImage;
  if (v3 >= 1.0)
  {
    do
    {
      inputImage = [+[CIBlendKernel componentMultiply] applyWithForeground:self->inputImage background:[(CIImage *)inputImage imageByApplyingGaussianBlurWithSigma:v4]];
      float v4 = v4 * 0.5;
    }
    while (v4 >= 1.0);
    id v8 = [(CIHeightFieldFromMask *)self _CIResetalpha];
    [(CIImage *)self->inputImage extent];
    v9 = self->inputImage;
    v14[0] = inputImage;
    v14[1] = v9;
    return (id)objc_msgSend(v8, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2), v10, v11, v12, v13);
  }
  else
  {
    v6 = inputImage;
    return v6;
  }
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8E60;
  v4[1] = &unk_1EE4A8E60;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[2] = &unk_1EE4A8E70;
  v4[3] = &unk_1EE4A8E80;
  v4[4] = &unk_1EE4A8E80;
  v4[5] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

@end