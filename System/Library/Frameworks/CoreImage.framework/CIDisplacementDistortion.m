@interface CIDisplacementDistortion
+ (id)customAttributes;
- (CIImage)inputDisplacementImage;
- (CIImage)inputImage;
- (NSNumber)inputScale;
- (id)_CIDisplaceFromImage;
- (id)outputImage;
- (void)setInputDisplacementImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIDisplacementDistortion

- (id)_CIDisplaceFromImage
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_displaceFromImage];
}

- (id)outputImage
{
  v12[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputScale floatValue];
  if (fabsf(v3) >= 0.001 && self->inputDisplacementImage)
  {
    id v4 = [(CIDisplacementDistortion *)self _CIDisplaceFromImage];
    [(CIImage *)self->inputImage extent];
    inputDisplacementImage = self->inputDisplacementImage;
    v12[0] = self->inputImage;
    v12[1] = inputDisplacementImage;
    v12[2] = self->inputScale;
    return (id)objc_msgSend(v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_18, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 3), v6, v7, v8, v9);
  }
  else
  {
    v11 = self->inputImage;
    return v11;
  }
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryDistortionEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputScale";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A8580;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A8580;
  v4[3] = &unk_1EE4A8590;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A85A0;
  v4[5] = &unk_1EE4A8580;
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

- (CIImage)inputDisplacementImage
{
  return self->inputDisplacementImage;
}

- (void)setInputDisplacementImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end