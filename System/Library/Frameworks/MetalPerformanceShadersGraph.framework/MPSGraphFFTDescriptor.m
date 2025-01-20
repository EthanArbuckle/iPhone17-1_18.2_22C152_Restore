@interface MPSGraphFFTDescriptor
+ (MPSGraphFFTDescriptor)descriptor;
- (BOOL)inverse;
- (BOOL)roundToOddHermitean;
- (MPSGraphFFTScalingMode)scalingMode;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInverse:(BOOL)inverse;
- (void)setRoundToOddHermitean:(BOOL)roundToOddHermitean;
- (void)setScalingMode:(MPSGraphFFTScalingMode)scalingMode;
@end

@implementation MPSGraphFFTDescriptor

+ (MPSGraphFFTDescriptor)descriptor
{
  v2 = objc_alloc_init(MPSGraphFFTDescriptor);
  v2->_inverse = 0;
  v2->_scalingMode = 0;
  v2->_roundToOddHermitean = 0;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [MPSGraphFFTDescriptor alloc];
  *((unsigned char *)result + 8) = self->_inverse;
  *((void *)result + 2) = self->_scalingMode;
  *((unsigned char *)result + 9) = self->_roundToOddHermitean;
  return result;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)inverse
{
  self->_inverse = inverse;
}

- (MPSGraphFFTScalingMode)scalingMode
{
  return self->_scalingMode;
}

- (void)setScalingMode:(MPSGraphFFTScalingMode)scalingMode
{
  self->_scalingMode = scalingMode;
}

- (BOOL)roundToOddHermitean
{
  return self->_roundToOddHermitean;
}

- (void)setRoundToOddHermitean:(BOOL)roundToOddHermitean
{
  self->_roundToOddHermitean = roundToOddHermitean;
}

@end