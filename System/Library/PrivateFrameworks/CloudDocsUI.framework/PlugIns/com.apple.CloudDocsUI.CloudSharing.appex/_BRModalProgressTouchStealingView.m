@interface _BRModalProgressTouchStealingView
- (_BRModalProgressTouchStealingView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _BRModalProgressTouchStealingView

- (_BRModalProgressTouchStealingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_BRModalProgressTouchStealingView;
  v3 = -[_BRModalProgressTouchStealingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor colorWithWhite:0.5 alpha:0.00999999978];
    [(_BRModalProgressTouchStealingView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_BRModalProgressTouchStealingView;
  v5 = -[_BRModalProgressTouchStealingView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  objc_super v6 = v5;
  if (!v5) {
    v5 = self;
  }
  id v7 = v5;

  return v7;
}

@end