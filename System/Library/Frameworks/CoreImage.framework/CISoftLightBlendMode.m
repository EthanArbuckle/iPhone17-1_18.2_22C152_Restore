@interface CISoftLightBlendMode
- (id)_kernel;
@end

@implementation CISoftLightBlendMode

- (id)_kernel
{
  return +[CIBlendKernel softLight];
}

@end