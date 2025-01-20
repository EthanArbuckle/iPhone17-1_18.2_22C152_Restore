@interface CIDifferenceBlendMode
- (id)_kernel;
@end

@implementation CIDifferenceBlendMode

- (id)_kernel
{
  return +[CIBlendKernel difference];
}

@end