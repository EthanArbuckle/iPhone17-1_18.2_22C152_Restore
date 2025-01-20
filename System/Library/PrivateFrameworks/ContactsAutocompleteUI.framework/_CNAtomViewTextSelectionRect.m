@interface _CNAtomViewTextSelectionRect
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isVertical;
- (CGRect)rect;
- (int64_t)writingDirection;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)setRect:(CGRect)a3;
- (void)setWritingDirection:(int64_t)a3;
@end

@implementation _CNAtomViewTextSelectionRect

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

- (int64_t)writingDirection
{
  return self->writingDirection;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->writingDirection = a3;
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

- (BOOL)isVertical
{
  return self->isVertical;
}

- (void)setIsVertical:(BOOL)a3
{
  self->isVertical = a3;
}

@end