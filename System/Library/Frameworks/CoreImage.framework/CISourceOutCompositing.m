@interface CISourceOutCompositing
+ (id)_kernel;
@end

@implementation CISourceOutCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceOut];
}

@end