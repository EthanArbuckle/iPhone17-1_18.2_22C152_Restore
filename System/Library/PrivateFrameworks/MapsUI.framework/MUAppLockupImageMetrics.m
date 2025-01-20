@interface MUAppLockupImageMetrics
- (CGSize)frameSize;
- (double)scale;
- (unint64_t)variant;
- (void)setFrameSize:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation MUAppLockupImageMetrics

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)frameSize
{
  double width = self->_frameSize.width;
  double height = self->_frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  self->_frameSize = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

@end