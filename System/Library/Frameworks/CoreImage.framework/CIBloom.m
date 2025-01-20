@interface CIBloom
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

@implementation CIBloom

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryStylize";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryHighDynamicRange";
  v7[4] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"6";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputIntensity";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A7D00;
  v6[1] = &unk_1EE4A7D00;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeType";
  v6[2] = &unk_1EE4A7D10;
  v6[3] = @"CIAttributeTypeScalar";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];
  v8[4] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A7D00;
  v4[1] = &unk_1EE4A7D00;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A7D20;
  v4[3] = &unk_1EE4A7D30;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A7D00;
  v4[5] = @"CIAttributeTypeDistance";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_bloom];
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

- (id)outputImage
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  BOOL v3 = [(CIBloom *)self _isIdentity];
  inputImage = self->inputImage;
  if (v3)
  {
    double v5 = inputImage;
    return v5;
  }
  else
  {
    [(NSNumber *)self->inputRadius doubleValue];
    v7 = -[CIImage imageByApplyingGaussianBlurWithSigma:](inputImage, "imageByApplyingGaussianBlurWithSigma:");
    [(CIImage *)v7 extent];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(CIImage *)self->inputImage extent];
    v29.origin.double x = v16;
    v29.origin.double y = v17;
    v29.size.double width = v18;
    v29.size.double height = v19;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    CGRect v28 = CGRectUnion(v27, v29);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
    id v24 = [(CIBloom *)self _kernel];
    v25[0] = self->inputImage;
    v25[1] = v7;
    v25[2] = self->inputIntensity;
    return (id)objc_msgSend(v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 3), x, y, width, height);
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