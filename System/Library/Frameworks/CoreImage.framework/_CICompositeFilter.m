@interface _CICompositeFilter
+ (id)_kernel;
+ (id)customAttributes;
- (CIImage)inputBackgroundImage;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputBackgroundImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation _CICompositeFilter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryCompositeOperation";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryInterlaced";
  v3[4] = @"CICategoryNonSquarePixels";
  v3[5] = @"CICategoryHighDynamicRange";
  v3[6] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  v5[1] = @"5";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (void)setInputImage:(id)a3
{
}

- (void)setInputBackgroundImage:(id)a3
{
}

- (id)outputImage
{
  if (!self->inputImage || !self->inputBackgroundImage) {
    return 0;
  }
  v3 = (void *)[(id)objc_opt_class() _kernel];
  inputImage = self->inputImage;
  inputBackgroundImage = self->inputBackgroundImage;

  return (id)[v3 applyWithForeground:inputImage background:inputBackgroundImage];
}

+ (id)_kernel
{
  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (CIImage)inputBackgroundImage
{
  return self->inputBackgroundImage;
}

@end