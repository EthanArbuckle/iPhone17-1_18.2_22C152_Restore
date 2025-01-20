@interface AVCacheLargestInscribedRectInBoundingPathValue
- (AVCacheLargestInscribedRectInBoundingPathValue)initWithLargestInscribedRect:(CGRect)a3;
- (CGRect)largestInscribedRect;
- (void)setLargestInscribedRect:(CGRect)a3;
@end

@implementation AVCacheLargestInscribedRectInBoundingPathValue

- (void)setLargestInscribedRect:(CGRect)a3
{
  self->_largestInscribedRect = a3;
}

- (CGRect)largestInscribedRect
{
  double x = self->_largestInscribedRect.origin.x;
  double y = self->_largestInscribedRect.origin.y;
  double width = self->_largestInscribedRect.size.width;
  double height = self->_largestInscribedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AVCacheLargestInscribedRectInBoundingPathValue)initWithLargestInscribedRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)AVCacheLargestInscribedRectInBoundingPathValue;
  v7 = [(AVCacheLargestInscribedRectInBoundingPathValue *)&v10 init];
  v8 = v7;
  if (v7) {
    -[AVCacheLargestInscribedRectInBoundingPathValue setLargestInscribedRect:](v7, "setLargestInscribedRect:", x, y, width, height);
  }
  return v8;
}

@end