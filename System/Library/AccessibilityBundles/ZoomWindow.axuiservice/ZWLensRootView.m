@interface ZWLensRootView
- (ZWLensRootView)initWithDelegate:(id)a3;
- (ZWLensRootViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ZWLensRootView

- (ZWLensRootView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ZWLensRootView;
  v5 = -[ZWLensRootView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    [(ZWLensRootView *)v5 setDelegate:v4];
    [(ZWLensRootView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(ZWLensRootView *)self delegate];
  v9 = objc_msgSend(v8, "zoomRootview:viewForHitTestAtPoint:", self, x, y);

  if (!v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)ZWLensRootView;
    v9 = -[ZWLensRootView hitTest:withEvent:](&v11, "hitTest:withEvent:", v7, x, y);
  }

  return v9;
}

- (ZWLensRootViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWLensRootViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end