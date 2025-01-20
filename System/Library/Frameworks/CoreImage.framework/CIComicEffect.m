@interface CIComicEffect
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIComicEffect

- (id)outputImage
{
  id result = self->inputImage;
  if (result)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(result, "imageByApplyingFilter:withInputParameters:", @"CISpotColor", 0), "imageByApplyingFilter:withInputParameters:", @"CICMYKHalftone", &unk_1EE4AB108);
    v5 = [(CIImage *)self->inputImage imageByApplyingFilter:@"CILineOverlay" withInputParameters:0];
    return [(CIImage *)v5 imageByCompositingOverImage:v4];
  }
  return result;
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStylize";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"9";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.5";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end