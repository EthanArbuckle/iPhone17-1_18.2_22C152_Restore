@interface CCUIIconScrollView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (CCUIIconScrollViewHostingDelegate)hostingDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setFrame:(CGRect)a3;
- (void)setHostingDelegate:(id)a3;
@end

@implementation CCUIIconScrollView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CCUIIconScrollView *)self frame];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)CCUIIconScrollView;
    -[CCUIIconScrollView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = [(CCUIIconScrollView *)self hostingDelegate];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v6 = [v5 scrollView:self gestureRecognizerShouldBegin:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CCUIIconScrollView;
    unsigned __int8 v6 = [(CCUIIconScrollView *)&v9 gestureRecognizerShouldBegin:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCUIIconScrollView;
  -[CCUIIconScrollView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  objc_super v8 = (CCUIIconScrollView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if ([v7 type] == 9)
    {
      objc_super v9 = [(CCUIIconScrollView *)self hostingDelegate];
      if (objc_opt_respondsToSelector())
      {
        CGRect v10 = [v9 fallbackDragHitTestViewForScrollView:self];

        self = v10;
      }
    }
    objc_super v8 = self;
  }

  return v8;
}

- (CCUIIconScrollViewHostingDelegate)hostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingDelegate);

  return (CCUIIconScrollViewHostingDelegate *)WeakRetained;
}

- (void)setHostingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end