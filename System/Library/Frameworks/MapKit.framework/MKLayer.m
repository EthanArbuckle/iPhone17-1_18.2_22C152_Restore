@interface MKLayer
- (BOOL)containsPoint:(CGPoint)a3;
- (CGPoint)hitOffset;
- (CGPoint)hitOutset;
- (CGRect)hitBounds;
- (void)setBounds:(CGRect)a3;
- (void)setHitOffset:(CGPoint)a3;
- (void)setHitOutset:(CGPoint)a3;
@end

@implementation MKLayer

- (void)setHitOutset:(CGPoint)a3
{
  p_hitOutset = &self->_hitOutset;
  self->_hitOutset = a3;
  p_hitBounds = &self->_hitBounds;
  [(MKLayer *)self bounds];
  CGRect v7 = CGRectOffset(v6, self->_hitOffset.x, self->_hitOffset.y);
  CGRect *p_hitBounds = CGRectInset(v7, -p_hitOutset->x, -p_hitOutset->y);
}

- (void)setHitOffset:(CGPoint)a3
{
  p_hitOffset = &self->_hitOffset;
  self->_hitOffset = a3;
  p_hitBounds = &self->_hitBounds;
  [(MKLayer *)self bounds];
  CGRect v7 = CGRectOffset(v6, p_hitOffset->x, p_hitOffset->y);
  CGRect *p_hitBounds = CGRectInset(v7, -self->_hitOutset.x, -self->_hitOutset.y);
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKLayer;
  -[MKLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MKLayer *)self bounds];
  CGRect v6 = CGRectOffset(v5, self->_hitOffset.x, self->_hitOffset.y);
  self->_hitBounds = CGRectInset(v6, -self->_hitOutset.x, -self->_hitOutset.y);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MKLayer *)self hitBounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (CGPoint)hitOffset
{
  double x = self->_hitOffset.x;
  double y = self->_hitOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)hitOutset
{
  double x = self->_hitOutset.x;
  double y = self->_hitOutset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)hitBounds
{
  double x = self->_hitBounds.origin.x;
  double y = self->_hitBounds.origin.y;
  double width = self->_hitBounds.size.width;
  double height = self->_hitBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end