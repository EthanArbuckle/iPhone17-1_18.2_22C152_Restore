@interface _HKStackedBarSegment
- (BOOL)shouldSeparateFromAdjacentSegments;
- (CGRect)rect;
- (unint64_t)roundedCorners;
- (void)setRect:(CGRect)a3;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setShouldSeparateFromAdjacentSegments:(BOOL)a3;
@end

@implementation _HKStackedBarSegment

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(unint64_t)a3
{
  self->_roundedCorners = a3;
}

- (BOOL)shouldSeparateFromAdjacentSegments
{
  return self->_shouldSeparateFromAdjacentSegments;
}

- (void)setShouldSeparateFromAdjacentSegments:(BOOL)a3
{
  self->_shouldSeparateFromAdjacentSegments = a3;
}

@end