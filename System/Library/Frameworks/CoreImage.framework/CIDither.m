@interface CIDither
+ (id)_kernelDither;
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
@end

@implementation CIDither

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"12";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.14";
  v6[3] = @"inputIntensity";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeMax";
  v4[0] = &unk_1EE4A8090;
  v4[1] = &unk_1EE4A80B0;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A8090;
  v4[3] = &unk_1EE4A80A0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A80C0;
  v4[5] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

+ (id)_kernelDither
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ddither];
}

- (id)outputImage
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputIntensity floatValue];
  if (v3 < 0.0001) {
    return self->inputImage;
  }
  v5 = [+[CIFilter filterWithName:@"CIRandomGenerator"] outputImage];
  v6 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  id v7 = +[CIDither _kernelDither];
  [(CIImage *)v6 extent];
  v12[0] = v6;
  v12[1] = v5;
  v12[2] = self->inputIntensity;
  return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 3), v8, v9, v10, v11), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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