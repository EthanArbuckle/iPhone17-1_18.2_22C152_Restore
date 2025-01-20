@interface CIAppleLogToLinear
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIAppleLogToLinear

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryNonSquarePixels";
  v3[5] = @"CICategoryStillImage";
  v3[6] = @"CICategoryBuiltIn";
  v3[7] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:8];
  v5[1] = @"18";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"15.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_appleLogToLinear];
  v4 = [(CIImage *)[(CIAppleLogToLinear *)self inputImage] imageByUnpremultiplyingAlpha];
  [(CIImage *)v4 extent];
  v10[0] = v4;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1], v5, v6, v7, v8), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end