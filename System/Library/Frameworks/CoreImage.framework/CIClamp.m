@interface CIClamp
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIClamp

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryTileEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"10";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.12";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(CIVector *)self->inputExtent CGRectValue];
  inputImage = self->inputImage;

  return -[CIImage imageByClampingToRect:](inputImage, "imageByClampingToRect:");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

@end