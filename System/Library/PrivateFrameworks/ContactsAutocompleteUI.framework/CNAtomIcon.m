@interface CNAtomIcon
- (CGPoint)drawingOffset;
- (void)setDrawingOffset:(CGPoint)a3;
@end

@implementation CNAtomIcon

- (CGPoint)drawingOffset
{
  double x = self->drawingOffset.x;
  double y = self->drawingOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDrawingOffset:(CGPoint)a3
{
  self->drawingOffset = a3;
}

@end