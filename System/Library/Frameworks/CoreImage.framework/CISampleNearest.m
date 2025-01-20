@interface CISampleNearest
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CISampleNearest

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStylize";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  return [(CIImage *)self->inputImage imageBySamplingNearest];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end