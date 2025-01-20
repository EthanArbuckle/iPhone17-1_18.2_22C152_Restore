@interface CIMinimumCompositing
+ (id)_kernel;
@end

@implementation CIMinimumCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMin];
}

@end