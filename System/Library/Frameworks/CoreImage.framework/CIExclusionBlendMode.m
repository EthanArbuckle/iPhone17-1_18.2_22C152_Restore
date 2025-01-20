@interface CIExclusionBlendMode
- (id)_kernel;
@end

@implementation CIExclusionBlendMode

- (id)_kernel
{
  return +[CIBlendKernel exclusion];
}

@end