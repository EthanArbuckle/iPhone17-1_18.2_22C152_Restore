@interface _CNAtomTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (CGRect)rect;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation _CNAtomTextSelectionRect

- (CGRect)rect
{
  double x = self->rect.origin.x;
  double y = self->rect.origin.y;
  double width = self->rect.size.width;
  double height = self->rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->rect = a3;
}

- (BOOL)containsStart
{
  return self->containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->containsEnd = a3;
}

@end