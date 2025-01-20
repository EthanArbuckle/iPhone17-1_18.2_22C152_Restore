@interface CIPlanarize
+ (id)customAttributes;
- (CIImage)inputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIPlanarize

+ (id)customAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryTileEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryStillImage";
  v3[4] = @"CICategoryHighDynamicRange";
  v3[5] = @"CICategoryBuiltIn";
  v3[6] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end