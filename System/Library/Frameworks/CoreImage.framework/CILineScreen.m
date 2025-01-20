@interface CILineScreen
- (id)_kernel;
@end

@implementation CILineScreen

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_linescreen];
}

@end