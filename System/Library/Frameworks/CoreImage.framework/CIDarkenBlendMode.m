@interface CIDarkenBlendMode
- (id)_kernel;
@end

@implementation CIDarkenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel darken];
}

@end