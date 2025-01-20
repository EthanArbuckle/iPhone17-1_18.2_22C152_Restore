@interface CIMultiplyBlendMode
- (id)_kernel;
@end

@implementation CIMultiplyBlendMode

- (id)_kernel
{
  return +[CIBlendKernel multiply];
}

@end