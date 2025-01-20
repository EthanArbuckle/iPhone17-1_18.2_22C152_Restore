@interface CIMaximumCompositing
+ (id)_kernel;
@end

@implementation CIMaximumCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMax];
}

@end