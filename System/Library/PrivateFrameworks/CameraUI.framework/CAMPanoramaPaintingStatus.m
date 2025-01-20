@interface CAMPanoramaPaintingStatus
- (CAMPanoramaPaintingStatus)initWithSpeed:(double)a3 cropRectangle:(CGRect)a4 normalizedBaselineOffset:(double)a5;
- (CGRect)cropRectangle;
- (double)normalizedBaselineOffset;
- (double)speed;
@end

@implementation CAMPanoramaPaintingStatus

- (CAMPanoramaPaintingStatus)initWithSpeed:(double)a3 cropRectangle:(CGRect)a4 normalizedBaselineOffset:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)CAMPanoramaPaintingStatus;
  v11 = [(CAMPanoramaPaintingStatus *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_cropRectangle.origin.CGFloat x = x;
    v11->_cropRectangle.origin.CGFloat y = y;
    v11->_cropRectangle.size.CGFloat width = width;
    v11->_cropRectangle.size.CGFloat height = height;
    v11->_speed = a3;
    v11->_normalizedBaselineOffset = a5;
    v13 = v11;
  }

  return v12;
}

- (double)speed
{
  return self->_speed;
}

- (CGRect)cropRectangle
{
  double x = self->_cropRectangle.origin.x;
  double y = self->_cropRectangle.origin.y;
  double width = self->_cropRectangle.size.width;
  double height = self->_cropRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)normalizedBaselineOffset
{
  return self->_normalizedBaselineOffset;
}

@end