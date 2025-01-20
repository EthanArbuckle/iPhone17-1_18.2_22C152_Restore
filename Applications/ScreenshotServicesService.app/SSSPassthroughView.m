@interface SSSPassthroughView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SSSPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SSSPassthroughView;
  -[SSSPassthroughView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (SSSPassthroughView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

@end