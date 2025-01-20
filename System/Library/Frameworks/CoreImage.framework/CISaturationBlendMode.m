@interface CISaturationBlendMode
- (id)_kernel_v0;
- (id)_kernel_v1;
@end

@implementation CISaturationBlendMode

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_saturationBlendMode_v0];
}

- (id)_kernel_v1
{
  return +[CIBlendKernel saturation];
}

@end