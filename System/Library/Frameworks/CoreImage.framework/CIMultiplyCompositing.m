@interface CIMultiplyCompositing
+ (id)_kernel;
@end

@implementation CIMultiplyCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMultiply];
}

@end