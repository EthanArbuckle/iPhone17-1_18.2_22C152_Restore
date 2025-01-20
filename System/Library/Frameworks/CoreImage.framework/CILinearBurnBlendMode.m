@interface CILinearBurnBlendMode
+ (id)customAttributes;
- (CILinearBurnBlendMode)init;
- (id)_kernel;
- (id)_kernel_v0;
- (id)_kernel_v1;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
@end

@implementation CILinearBurnBlendMode

- (CILinearBurnBlendMode)init
{
  v5.receiver = self;
  v5.super_class = (Class)CILinearBurnBlendMode;
  v2 = [(CILinearBurnBlendMode *)&v5 init];
  v3 = v2;
  if (v2) {
    -[CILinearBurnBlendMode setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CILinearBurnBlendMode _defaultVersion](v2, "_defaultVersion")), @"__inputVersion");
  }
  return v3;
}

- (void)setDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)CILinearBurnBlendMode;
  [(CIFilter *)&v3 setDefaults];
  -[CILinearBurnBlendMode setValue:forKey:](self, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CILinearBurnBlendMode _defaultVersion](self, "_defaultVersion")), @"__inputVersion");
}

- (int)_maxVersion
{
  return 1;
}

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_linearBurnBlendMode_v0];
}

- (id)_kernel_v1
{
  return +[CIBlendKernel linearBurn];
}

- (id)_kernel
{
  int v3 = objc_msgSend((id)-[CILinearBurnBlendMode valueForKey:](self, "valueForKey:", @"__inputVersion"), "intValue");
  if (v3 == 1)
  {
    return [(CILinearBurnBlendMode *)self _kernel_v1];
  }
  else if (v3)
  {
    return 0;
  }
  else
  {
    return [(CILinearBurnBlendMode *)self _kernel_v0];
  }
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryCompositeOperation";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryInterlaced";
  v3[4] = @"CICategoryNonSquarePixels";
  v3[5] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"8";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.10";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

@end