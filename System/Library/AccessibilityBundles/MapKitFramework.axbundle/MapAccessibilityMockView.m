@interface MapAccessibilityMockView
- (CGRect)accessibilityFrame;
- (UIView)view;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setView:(id)a3;
@end

@implementation MapAccessibilityMockView

- (id)accessibilityLabel
{
  return (id)[(UIView *)self->_view accessibilityLabel];
}

- (id)accessibilityValue
{
  return (id)[(UIView *)self->_view accessibilityValue];
}

- (CGRect)accessibilityFrame
{
  [(UIView *)self->_view accessibilityFrame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    v7 = [(MapAccessibilityMockView *)self accessibilityContainer];
    [v7 accessibilityFrame];
    CGFloat x = v8;
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return [(UIView *)self->_view accessibilityTraits];
}

- (id)accessibilityHint
{
  return (id)[(UIView *)self->_view accessibilityHint];
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end