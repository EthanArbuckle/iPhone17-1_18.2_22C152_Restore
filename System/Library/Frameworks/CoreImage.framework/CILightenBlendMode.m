@interface CILightenBlendMode
- (id)_kernel;
@end

@implementation CILightenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel lighten];
}

@end