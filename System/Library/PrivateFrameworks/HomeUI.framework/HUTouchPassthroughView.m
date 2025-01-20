@interface HUTouchPassthroughView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation HUTouchPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HUTouchPassthroughView;
  -[HUTouchPassthroughView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (HUTouchPassthroughView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

@end