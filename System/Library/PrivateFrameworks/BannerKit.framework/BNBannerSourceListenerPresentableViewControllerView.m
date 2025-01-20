@interface BNBannerSourceListenerPresentableViewControllerView
- (BNBannerSourceListenerPresentableViewControllerViewDelegate)delegate;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation BNBannerSourceListenerPresentableViewControllerView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BNBannerSourceListenerPresentableViewControllerView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
  -[BNBannerSourceListenerPresentableViewControllerView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(BNBannerSourceListenerPresentableViewControllerView *)self frame];
  v23.origin.double x = v17;
  v23.origin.double y = v18;
  v23.size.double width = v19;
  v23.size.double height = v20;
  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  if (!CGRectEqualToRect(v22, v23) && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained bannerSourceListenerPresentableViewControllerViewDidChangeSize:self];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BNBannerSourceListenerPresentableViewControllerView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
  -[BNBannerSourceListenerPresentableViewControllerView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(BNBannerSourceListenerPresentableViewControllerView *)self bounds];
  BOOL v15 = v9 == v14 && v11 == v13;
  if (!v15 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained bannerSourceListenerPresentableViewControllerViewDidChangeSize:self];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained contentInsetsForBannerSourceListenerPresentableViewControllerView:self];
    [(BNBannerSourceListenerPresentableViewControllerView *)self bounds];
    UIRectInset();
    v13.double x = x;
    v13.double y = y;
    BOOL v9 = CGRectContainsPoint(v14, v13);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BNBannerSourceListenerPresentableViewControllerView;
    BOOL v9 = -[BNBannerSourceListenerPresentableViewControllerView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }
  BOOL v10 = v9;

  return v10;
}

- (BNBannerSourceListenerPresentableViewControllerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSourceListenerPresentableViewControllerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end