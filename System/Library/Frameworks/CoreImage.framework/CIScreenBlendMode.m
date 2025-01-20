@interface CIScreenBlendMode
- (id)_kernel;
@end

@implementation CIScreenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel screen];
}

@end