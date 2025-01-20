@interface PopUpPresentationController
- (BOOL)blurBackground;
- (UIView)dimmingView;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setBlurBackground:(BOOL)a3;
- (void)setDimmingView:(id)a3;
@end

@implementation PopUpPresentationController

- (void).cxx_destruct
{
}

- (void)setDimmingView:(id)a3
{
}

- (void)setBlurBackground:(BOOL)a3
{
  self->_blurBackground = a3;
}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

- (void)containerViewWillLayoutSubviews
{
  id v3 = [(PopUpPresentationController *)self containerView];
  [v3 bounds];
  -[UIView setFrame:](self->_dimmingView, "setFrame:");
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    [(UIView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
}

- (void)dismissalTransitionWillBegin
{
  id v3 = [(PopUpPresentationController *)self presentedViewController];
  v4 = [v3 transitionCoordinator];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011B010;
  v5[3] = &unk_1001A1068;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    [(UIView *)self->_dimmingView removeFromSuperview];
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;
  }
}

- (void)presentationTransitionWillBegin
{
  uint64_t v3 = [(PopUpPresentationController *)self dimmingView];
  [v3 setAlpha:0.0];

  if (self->_blurBackground) {
    +[UIColor clearColor];
  }
  else {
  v4 = +[UIColor colorWithWhite:0.0 alpha:0.600000024];
  }
  [(UIView *)self->_dimmingView setBackgroundColor:v4];

  v5 = [(PopUpPresentationController *)self containerView];
  [v5 addSubview:self->_dimmingView];

  v6 = [(PopUpPresentationController *)self presentedViewController];
  v7 = [v6 transitionCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011B1A8;
  v8[3] = &unk_1001A1068;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (UIView)dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    if (self->_blurBackground)
    {
      id v4 = objc_alloc((Class)UIVisualEffectView);
      v5 = +[UIBlurEffect effectWithStyle:2];
      v6 = (UIView *)[v4 initWithEffect:v5];
    }
    else
    {
      id v7 = objc_alloc((Class)UIView);
      v5 = [(PopUpPresentationController *)self containerView];
      [v5 bounds];
      v6 = [v7 initWithFrame:];
    }
    v8 = self->_dimmingView;
    self->_dimmingView = v6;

    dimmingView = self->_dimmingView;
  }

  return dimmingView;
}

@end