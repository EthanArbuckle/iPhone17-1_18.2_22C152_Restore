@interface CIColorBurnBlendMode
- (id)_kernel;
@end

@implementation CIColorBurnBlendMode

- (id)_kernel
{
  return +[CIBlendKernel colorBurn];
}

@end