@interface CISourceInCompositing
+ (id)_kernel;
@end

@implementation CISourceInCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceIn];
}

@end