@interface CISharpenLuminance
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (NSNumber)inputSharpness;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
- (void)setInputSharpness:(id)a3;
@end

@implementation CISharpenLuminance

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategorySharpen";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputSharpness";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A9B40;
  v6[1] = &unk_1EE4A9B50;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeIdentity";
  v6[2] = &unk_1EE4A9B60;
  v6[3] = &unk_1EE4A9B40;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputRadius";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A9B40;
  v4[1] = &unk_1EE4A9B70;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A9B80;
  v4[3] = &unk_1EE4A9B40;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputSharpness floatValue];
  if (fabsf(v3) <= 0.001) {
    return 1;
  }
  [(NSNumber *)self->inputRadius floatValue];
  return v4 < 0.16;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_sharpenLuminance];
}

- (id)outputImage
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  BOOL v3 = [(CISharpenLuminance *)self _isIdentity];
  inputImage = self->inputImage;
  if (v3)
  {
    v5 = inputImage;
    return v5;
  }
  else
  {
    v7 = [(CIImage *)inputImage imageByClampingToExtent];
    [(NSNumber *)self->inputRadius floatValue];
    uint64_t v9 = [(CIImage *)v7 imageByApplyingGaussianBlurWithSigma:v8];
    id v10 = [(CISharpenLuminance *)self _kernel];
    [(CIImage *)v7 extent];
    v16[0] = v7;
    v16[1] = v9;
    v16[2] = self->inputSharpness;
    v15 = objc_msgSend(v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 3), v11, v12, v13, v14);
    [(CIImage *)self->inputImage extent];
    return (id)objc_msgSend(v15, "imageByCroppingToRect:");
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
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