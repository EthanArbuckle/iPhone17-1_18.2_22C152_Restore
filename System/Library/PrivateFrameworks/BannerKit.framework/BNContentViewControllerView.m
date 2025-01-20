@interface BNContentViewControllerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation BNContentViewControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BNContentViewControllerView;
  -[BNContentViewControllerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (BNContentViewControllerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

@end