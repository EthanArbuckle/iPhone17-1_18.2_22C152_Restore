@interface CIColorBlendMode
- (id)_kernel_v0;
- (id)_kernel_v1;
@end

@implementation CIColorBlendMode

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_colorBlendMode_v0];
}

- (id)_kernel_v1
{
  return +[CIBlendKernel color];
}

@end