@interface CIUnsharpMask
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (NSNumber)inputRadius;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIUnsharpMask

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
  v8[3] = @"inputIntensity";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4AA110;
  v6[1] = &unk_1EE4AA110;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4AA120;
  v6[3] = &unk_1EE4AA130;
  v5[4] = @"CIAttributeIdentity";
  v5[5] = @"CIAttributeType";
  v6[4] = &unk_1EE4AA110;
  v6[5] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  v8[4] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4AA110;
  v4[1] = &unk_1EE4AA110;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AA140;
  v4[3] = &unk_1EE4AA150;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AA110;
  v4[5] = @"CIAttributeTypeDistance";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius doubleValue];
  if (v3 < 0.16) {
    return 1;
  }
  [(NSNumber *)self->inputIntensity doubleValue];
  return v5 < 0.001;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_unsharpmask];
}

- (id)outputImage
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  BOOL v3 = [(CIUnsharpMask *)self _isIdentity];
  inputImage = self->inputImage;
  if (v3)
  {
    double v5 = inputImage;
    return v5;
  }
  else
  {
    [(NSNumber *)self->inputRadius doubleValue];
    uint64_t v7 = -[CIImage imageByApplyingGaussianBlurWithSigma:](inputImage, "imageByApplyingGaussianBlurWithSigma:");
    id v8 = [(CIUnsharpMask *)self _kernel];
    [(CIImage *)self->inputImage extent];
    v13[0] = self->inputImage;
    v13[1] = v7;
    v13[2] = self->inputIntensity;
    return (id)objc_msgSend(v8, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 3), v9, v10, v11, v12);
  }
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

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
}

@end