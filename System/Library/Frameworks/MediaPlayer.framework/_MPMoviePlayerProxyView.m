@interface _MPMoviePlayerProxyView
- (MPMoviePlayerController)controller;
- (_MPMoviePlayerProxyView)initWithMoviePlayerController:(id)a3;
- (void)_updateContainmentInWindow:(id)a3 superview:(id)a4;
- (void)setFrame:(CGRect)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _MPMoviePlayerProxyView

- (void).cxx_destruct
{
}

- (MPMoviePlayerController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (MPMoviePlayerController *)WeakRetained;
}

- (void)_updateContainmentInWindow:(id)a3 superview:(id)a4
{
  unint64_t v23 = (unint64_t)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if ((unint64_t)a3 | v23)
  {
    if (!v23) {
      goto LABEL_11;
    }
    v10 = [WeakRetained hostingViewController];
    if (!v10)
    {
      v10 = [MEMORY[0x1E4FB1EC0] viewControllerForView:v23];
    }
    v11 = [WeakRetained playerViewController];
    v12 = [v11 parentViewController];

    if (v10 != v12)
    {
      [WeakRetained prepareToPlay];
      v13 = [WeakRetained playerViewController];
      v14 = [v13 parentViewController];

      if (v14)
      {
        v15 = [WeakRetained playerViewController];
        [v15 willMoveToParentViewController:0];

        v16 = [WeakRetained playerViewController];
        v17 = [v16 view];
        [v17 removeFromSuperview];

        v18 = [WeakRetained playerViewController];
        [v18 removeFromParentViewController];
      }
      v19 = [WeakRetained playerViewController];
      [v10 addChildViewController:v19];

      v20 = [WeakRetained playerViewController];
      v21 = [v20 view];
      [(_MPMoviePlayerProxyView *)self addSubview:v21];

      v22 = [WeakRetained playerViewController];
      [v22 didMoveToParentViewController:v10];
    }
  }
  else
  {
    v7 = [WeakRetained playerViewController];
    [v7 willMoveToParentViewController:0];

    v8 = [WeakRetained playerViewController];
    v9 = [v8 view];
    [v9 removeFromSuperview];

    v10 = [WeakRetained playerViewController];
    [v10 removeFromParentViewController];
  }

LABEL_11:
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_MPMoviePlayerProxyView;
  -[_MPMoviePlayerProxyView setFrame:](&v11, sel_setFrame_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v9 = [WeakRetained playerViewController];
  v10 = [v9 view];
  objc_msgSend(v10, "setFrame:", x, y, width, height);
}

- (void)willMoveToSuperview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MPMoviePlayerProxyView;
  id v4 = a3;
  [(_MPMoviePlayerProxyView *)&v6 willMoveToSuperview:v4];
  v5 = [(_MPMoviePlayerProxyView *)self window];
  [(_MPMoviePlayerProxyView *)self _updateContainmentInWindow:v5 superview:v4];
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MPMoviePlayerProxyView;
  id v4 = a3;
  [(_MPMoviePlayerProxyView *)&v6 willMoveToWindow:v4];
  v5 = [(_MPMoviePlayerProxyView *)self superview];
  [(_MPMoviePlayerProxyView *)self _updateContainmentInWindow:v4 superview:v5];
}

- (_MPMoviePlayerProxyView)initWithMoviePlayerController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPMoviePlayerProxyView;
  v5 = [(_MPMoviePlayerProxyView *)&v8 init];
  objc_super v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

@end