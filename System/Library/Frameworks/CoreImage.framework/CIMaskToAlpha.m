@interface CIMaskToAlpha
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIMaskToAlpha

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryNonSquarePixels";
  v3[4] = @"CICategoryStillImage";
  v3[5] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"6";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_maskToAlpha];
}

- (id)outputImage
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  id v3 = [(CIMaskToAlpha *)self _kernel];
  [(CIImage *)self->inputImage extent];
  v9[0] = self->inputImage;
  return (id)objc_msgSend(v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 1), v4, v5, v6, v7);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end