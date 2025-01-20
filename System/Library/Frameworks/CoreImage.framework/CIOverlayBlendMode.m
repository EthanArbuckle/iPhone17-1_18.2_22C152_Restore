@interface CIOverlayBlendMode
- (id)_kernel;
@end

@implementation CIOverlayBlendMode

- (id)_kernel
{
  return +[CIBlendKernel overlay];
}

@end