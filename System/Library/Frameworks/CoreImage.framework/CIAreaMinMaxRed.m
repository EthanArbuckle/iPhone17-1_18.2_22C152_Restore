@interface CIAreaMinMaxRed
+ (id)customAttributes;
- (id)_reduce1X4;
- (id)_reduce2X2;
- (id)_reduce4X1;
- (id)_reduce4X4;
- (id)_reduceCrop;
@end

@implementation CIAreaMinMaxRed

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"11";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_reduceCrop
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_reduceCropMinMaxRed];
}

- (id)_reduce4X4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMinMaxRed16];
}

- (id)_reduce2X2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMinMaxRed4];
}

- (id)_reduce4X1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_horizMinMaxRed4];
}

- (id)_reduce1X4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vertMinMaxRed4];
}

@end