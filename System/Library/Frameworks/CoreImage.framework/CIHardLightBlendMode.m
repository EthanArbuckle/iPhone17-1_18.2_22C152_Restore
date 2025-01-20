@interface CIHardLightBlendMode
- (id)_kernel;
@end

@implementation CIHardLightBlendMode

- (id)_kernel
{
  return +[CIBlendKernel hardLight];
}

@end