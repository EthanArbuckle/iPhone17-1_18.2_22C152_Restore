@interface CIAreaMinimumAlpha
- (id)_reduce1X4;
- (id)_reduce2X2;
- (id)_reduce4X1;
@end

@implementation CIAreaMinimumAlpha

- (id)_reduce2X2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMinAlphaS4];
}

- (id)_reduce4X1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMinAlphaH4];
}

- (id)_reduce1X4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMinAlphaV4];
}

@end