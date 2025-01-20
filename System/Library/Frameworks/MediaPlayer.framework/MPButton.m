@interface MPButton
+ (UIEdgeInsets)easyTouchDefaultHitRectInsets;
+ (id)easyTouchButtonWithType:(int64_t)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hitTestDebugEnabled;
- (BOOL)isHolding;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (MPButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)hitRectInsets;
- (double)holdDelayInterval;
- (void)_delayedTriggerHold;
- (void)_handleTouchCancel;
- (void)_handleTouchDown;
- (void)_handleTouchUp;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setHitRectInsets:(UIEdgeInsets)a3;
- (void)setHitTestDebugEnabled:(BOOL)a3;
- (void)setHoldDelayInterval:(double)a3;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation MPButton

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MPButton;
  [(MPButton *)&v4 layoutSubviews];
  hitTestDebugView = self->_hitTestDebugView;
  [(MPButton *)self hitRect];
  -[UIView setFrame:](hitTestDebugView, "setFrame:");
}

- (CGRect)hitRect
{
  v13.receiver = self;
  v13.super_class = (Class)MPButton;
  [(MPButton *)&v13 hitRect];
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double v6 = v5 + left;
  double v8 = v7 - (left + self->_hitRectInsets.right);
  double v10 = v9 + top;
  double v12 = v11 - (top + self->_hitRectInsets.bottom);
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v6;
  return result;
}

- (MPButton)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPButton;
  CGRect result = -[MPButton initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_holdDelayInterval = 0.75;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)hitTestDebugEnabled
{
  return self->_hitTestDebugEnabled;
}

- (void)setHoldDelayInterval:(double)a3
{
  self->_holdDelayInterval = a3;
}

- (double)holdDelayInterval
{
  return self->_holdDelayInterval;
}

- (UIEdgeInsets)hitRectInsets
{
  double top = self->_hitRectInsets.top;
  double left = self->_hitRectInsets.left;
  double bottom = self->_hitRectInsets.bottom;
  double right = self->_hitRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_handleTouchUp
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedTriggerHold object:0];
  if ([(MPButton *)self isHolding])
  {
    [(MPButton *)self sendActionsForControlEvents:0x2000000];
  }
}

- (void)_handleTouchDown
{
  [(MPButton *)self holdDelayInterval];

  -[MPButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedTriggerHold, 0);
}

- (void)_handleTouchCancel
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedTriggerHold object:0];
  if ([(MPButton *)self isHolding])
  {
    [(MPButton *)self sendActionsForControlEvents:0x2000000];
  }
}

- (void)_delayedTriggerHold
{
  *((unsigned char *)self + 744) |= 1u;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];

  [(MPButton *)self sendActionsForControlEvents:0x1000000];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPButton;
  [(MPButton *)&v5 touchesEnded:a3 withEvent:a4];
  *((unsigned char *)self + 744) &= ~1u;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPButton;
  [(MPButton *)&v5 touchesCancelled:a3 withEvent:a4];
  *((unsigned char *)self + 744) &= ~1u;
}

- (void)setHitTestDebugEnabled:(BOOL)a3
{
  if (self->_hitTestDebugEnabled != a3)
  {
    self->_hitTestDebugEnabled = a3;
    hitTestDebugView = self->_hitTestDebugView;
    if (a3)
    {
      if (!hitTestDebugView)
      {
        objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        double v6 = self->_hitTestDebugView;
        self->_hitTestDebugView = v5;

        [(UIView *)self->_hitTestDebugView setUserInteractionEnabled:0];
        id v7 = [MEMORY[0x1E4FB1618] redColor];
        uint64_t v8 = [v7 CGColor];
        double v9 = [(UIView *)self->_hitTestDebugView layer];
        [v9 setBorderColor:v8];

        double v10 = [(UIView *)self->_hitTestDebugView layer];
        [v10 setBorderWidth:1.0];

        double v11 = [MEMORY[0x1E4FB1618] redColor];
        double v12 = [v11 colorWithAlphaComponent:0.1];
        [(UIView *)self->_hitTestDebugView setBackgroundColor:v12];

        hitTestDebugView = self->_hitTestDebugView;
      }
      [(MPButton *)self addSubview:hitTestDebugView];
      [(MPButton *)self setNeedsLayout];
    }
    else
    {
      [(UIView *)self->_hitTestDebugView removeFromSuperview];
      objc_super v13 = self->_hitTestDebugView;
      self->_hitTestDebugView = 0;
    }
  }
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  if (self->_alignmentRectInsets.left != a3.left
    || self->_alignmentRectInsets.top != a3.top
    || self->_alignmentRectInsets.right != a3.right
    || self->_alignmentRectInsets.bottom != a3.bottom)
  {
    self->_alignmentRectInsets = a3;
    id v6 = [(MPButton *)self superview];
    [v6 setNeedsLayout];
  }
}

- (BOOL)isHolding
{
  return *((unsigned char *)self + 744) & 1;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MPButton *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MPButton;
  [(MPButton *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  [(MPButton *)self _handleTouchUp];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPButton;
  [(MPButton *)&v4 cancelTrackingWithEvent:a3];
  [(MPButton *)self _handleTouchCancel];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MPButton *)self _handleTouchDown];
  v9.receiver = self;
  v9.super_class = (Class)MPButton;
  LOBYTE(self) = [(MPButton *)&v9 beginTrackingWithTouch:v7 withEvent:v6];

  return (char)self;
}

+ (id)easyTouchButtonWithType:(int64_t)a3
{
  v3 = [(id)objc_opt_class() buttonWithType:a3];
  [(id)objc_opt_class() easyTouchDefaultHitRectInsets];
  objc_msgSend(v3, "setHitRectInsets:");

  return v3;
}

+ (UIEdgeInsets)easyTouchDefaultHitRectInsets
{
  double v2 = -20.0;
  double v3 = -20.0;
  double v4 = -20.0;
  double v5 = -20.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

@end