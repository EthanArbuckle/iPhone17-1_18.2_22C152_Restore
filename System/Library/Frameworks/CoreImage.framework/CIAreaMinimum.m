@interface CIAreaMinimum
- (id)_reduce1X4;
- (id)_reduce2X2;
- (id)_reduce4X1;
@end

@implementation CIAreaMinimum

- (id)_reduce2X2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_areaMin4];
}

- (id)_reduce4X1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_horizMin4];
}

- (id)_reduce1X4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vertMin4];
}

@end