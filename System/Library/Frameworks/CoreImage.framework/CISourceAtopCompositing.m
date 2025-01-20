@interface CISourceAtopCompositing
+ (id)_kernel;
@end

@implementation CISourceAtopCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceAtop];
}

@end