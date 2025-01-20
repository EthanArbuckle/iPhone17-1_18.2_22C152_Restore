@interface PKViewWithHitTestHandler
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PKViewWithHitTestHandler

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKViewWithHitTestHandler;
  v8 = -[PKViewWithHitTestHandler hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  hitTestHandler = (void (**)(id, void *, id, double, double))self->_hitTestHandler;
  if (hitTestHandler)
  {
    hitTestHandler[2](hitTestHandler, v8, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
}

@end