@interface GAXInterestAreaViewButton
+ (GAXInterestAreaViewButton)buttonWithImage:(id)a3;
- (BOOL)isCloseButton;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unint64_t)associatedInterestAreaPathIndex;
- (unint64_t)knobPosition;
- (void)setAssociatedInterestAreaPathIndex:(unint64_t)a3;
- (void)setCloseButton:(BOOL)a3;
- (void)setKnobPosition:(unint64_t)a3;
@end

@implementation GAXInterestAreaViewButton

+ (GAXInterestAreaViewButton)buttonWithImage:(id)a3
{
  id v4 = a3;
  v5 = [a1 buttonWithType:0];
  [v5 setImage:v4 forState:0];

  [v5 sizeToFit];

  return (GAXInterestAreaViewButton *)v5;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(GAXInterestAreaViewButton *)self bounds];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityLabel
{
  if ([(GAXInterestAreaViewButton *)self isCloseButton]) {
    v2 = @"AX_CLOSE_BUTTON";
  }
  else {
    v2 = @"AX_RESIZE_KNOB";
  }

  return GAXLocString(v2);
}

- (id)accessibilityHint
{
  if ([(GAXInterestAreaViewButton *)self isCloseButton])
  {
    v2 = 0;
  }
  else
  {
    v2 = GAXLocString(@"AX_RESIZE_KNOB_HINT");
  }

  return v2;
}

- (id)accessibilityValue
{
  unint64_t v2 = [(GAXInterestAreaViewButton *)self knobPosition] - 1;
  if (v2 <= 7 && ((0x8Bu >> v2) & 1) != 0)
  {
    v3 = GAXLocString(off_5D400[v2]);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)associatedInterestAreaPathIndex
{
  return self->_associatedInterestAreaPathIndex;
}

- (void)setAssociatedInterestAreaPathIndex:(unint64_t)a3
{
  self->_associatedInterestAreaPathIndeCGFloat x = a3;
}

- (unint64_t)knobPosition
{
  return self->_knobPosition;
}

- (void)setKnobPosition:(unint64_t)a3
{
  self->_knobPosition = a3;
}

- (BOOL)isCloseButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(BOOL)a3
{
  self->_closeButton = a3;
}

@end