@interface CIColorDodgeBlendMode
- (id)_kernel;
@end

@implementation CIColorDodgeBlendMode

- (id)_kernel
{
  return +[CIBlendKernel colorDodge];
}

@end