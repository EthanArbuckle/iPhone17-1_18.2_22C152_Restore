@interface CIAreaCentroid
+ (id)customAttributes;
- (id)_kernelCentroid;
- (id)_kernelWeightedCoordinate;
- (id)outputImage;
@end

@implementation CIAreaCentroid

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryBuiltIn";
  v3[4] = @"CICategoryHighDynamicRange";
  v3[5] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"12";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.14";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_kernelWeightedCoordinate
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ACWeightedCoordinatesR];
}

- (id)_kernelCentroid
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_ACCentroid];
}

- (id)outputImage
{
  return 0;
}

@end