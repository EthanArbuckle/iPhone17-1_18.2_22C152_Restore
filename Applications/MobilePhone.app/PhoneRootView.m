@interface PhoneRootView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PhoneRootView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PhoneRootView;
  -[PhoneRootView hitTest:withEvent:](&v7, "hitTest:withEvent:", a4, a3.x, a3.y);
  v5 = (PhoneRootView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

@end