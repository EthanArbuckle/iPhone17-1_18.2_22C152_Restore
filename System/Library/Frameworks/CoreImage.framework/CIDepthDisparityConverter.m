@interface CIDepthDisparityConverter
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIDepthDisparityConverter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"11";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_convertDepthOrDisparity];
  [(CIImage *)self->inputImage extent];
  v9[0] = self->inputImage;
  return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1], v4, v5, v6, v7);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

@end