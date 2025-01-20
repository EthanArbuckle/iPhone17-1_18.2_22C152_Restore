@interface _UIShareOverviewActionControllerSizeNotifyingView
- (_UIShareOverviewActionController)parentViewController;
- (void)setBounds:(CGRect)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation _UIShareOverviewActionControllerSizeNotifyingView

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIShareOverviewActionControllerSizeNotifyingView;
  -[_UIShareOverviewActionControllerSizeNotifyingView setBounds:](&v9, "setBounds:");
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v8 = [(_UIShareOverviewActionControllerSizeNotifyingView *)self parentViewController];
    [v8 _updateSubviewsForNewGeometry];
  }
}

- (_UIShareOverviewActionController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (_UIShareOverviewActionController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end