@interface CIHardMixBlendMode
+ (id)customAttributes;
- (id)_kernel;
@end

@implementation CIHardMixBlendMode

- (id)_kernel
{
  return +[CIBlendKernel hardMix];
}

+ (id)customAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryCompositeOperation";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryInterlaced";
  v3[4] = @"CICategoryNonSquarePixels";
  v3[5] = @"CICategoryBuiltIn";
  v3[6] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

@end