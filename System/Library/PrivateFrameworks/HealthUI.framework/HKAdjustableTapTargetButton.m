@interface HKAdjustableTapTargetButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)hitTargetInsets;
- (void)setHitTargetInsets:(UIEdgeInsets)a3;
@end

@implementation HKAdjustableTapTargetButton

- (void)setHitTargetInsets:(UIEdgeInsets)a3
{
  self->_insetSet = 1;
  self->_hitTargetInsets = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HKAdjustableTapTargetButton *)self bounds];
  if (self->_insetSet)
  {
    double top = self->_hitTargetInsets.top;
    double left = self->_hitTargetInsets.left;
    double v7 = v7 + left;
    double v8 = v8 + top;
    double v9 = v9 - (left + self->_hitTargetInsets.right);
    double v10 = v10 - (top + self->_hitTargetInsets.bottom);
  }
  CGFloat v13 = x;
  CGFloat v14 = y;
  return CGRectContainsPoint(*(CGRect *)&v7, *(CGPoint *)&v13);
}

- (UIEdgeInsets)hitTargetInsets
{
  double top = self->_hitTargetInsets.top;
  double left = self->_hitTargetInsets.left;
  double bottom = self->_hitTargetInsets.bottom;
  double right = self->_hitTargetInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end