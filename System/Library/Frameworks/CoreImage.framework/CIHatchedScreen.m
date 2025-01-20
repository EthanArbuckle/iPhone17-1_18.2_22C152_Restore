@interface CIHatchedScreen
- (id)_kernel;
@end

@implementation CIHatchedScreen

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_hatchedscreen];
}

@end