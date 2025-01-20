@interface PKTContainerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PKTContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  v9 = objc_msgSend(WeakRetained, "containerView:hitTest:withEvent:", self, v7, x, y);

  return v9;
}

- (void).cxx_destruct
{
}

@end