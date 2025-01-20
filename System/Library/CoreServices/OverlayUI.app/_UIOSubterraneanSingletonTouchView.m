@interface _UIOSubterraneanSingletonTouchView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIOSubterraneanSingletonTouchView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(_UIOSubterraneanSingletonTouchView *)self subviews];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [(_UIOSubterraneanSingletonTouchView *)self subviews];
    v11 = [v10 firstObject];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIOSubterraneanSingletonTouchView;
    v11 = -[_UIOSubterraneanSingletonTouchView hitTest:withEvent:](&v13, "hitTest:withEvent:", v7, x, y);
  }

  return v11;
}

@end