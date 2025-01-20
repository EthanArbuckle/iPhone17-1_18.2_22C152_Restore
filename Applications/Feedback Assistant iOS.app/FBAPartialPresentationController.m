@interface FBAPartialPresentationController
- (BOOL)isPresentingFullScreen;
- (CGRect)frameOfPresentedViewInContainerView;
- (FBAPartialPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIView)dimmingView;
- (double)height;
- (int64_t)adaptivePresentationStyle;
- (void)containerViewWillLayoutSubviews;
- (void)dismissPresentation:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
- (void)setHeight:(double)a3;
@end

@implementation FBAPartialPresentationController

- (FBAPartialPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FBAPartialPresentationController;
  return [(FBAPartialPresentationController *)&v5 initWithPresentedViewController:a3 presentingViewController:a4];
}

- (void)containerViewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)FBAPartialPresentationController;
  [(FBAPartialPresentationController *)&v17 containerViewWillLayoutSubviews];
  [(FBAPartialPresentationController *)self frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(FBAPartialPresentationController *)self presentedViewController];
  v12 = [v11 view];
  [v12 setFrame:v4, v6, v8, v10];

  v13 = [(FBAPartialPresentationController *)self presentedView];
  v14 = [v13 layer];
  [v14 setCornerRadius:7.0];

  v15 = [(FBAPartialPresentationController *)self presentedView];
  v16 = [v15 layer];
  [v16 setMasksToBounds:1];
}

- (void)presentationTransitionWillBegin
{
  double v3 = [(FBAPartialPresentationController *)self dimmingView];
  double v4 = [(FBAPartialPresentationController *)self containerView];
  [v4 addSubview:v3];
  double v5 = +[NSLayoutConstraint constraintWithItem:v3 attribute:8 relatedBy:0 toItem:v4 attribute:8 multiplier:1.0 constant:0.0];
  double v6 = +[NSLayoutConstraint constraintWithItem:v3 attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];
  double v7 = +[NSLayoutConstraint constraintWithItem:v3 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  double v8 = +[NSLayoutConstraint constraintWithItem:v3 attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v7;
  v15[3] = v8;
  double v9 = +[NSArray arrayWithObjects:v15 count:4];
  [v4 addConstraints:v9];

  double v10 = [(FBAPartialPresentationController *)self presentingViewController];
  v11 = [v10 transitionCoordinator];

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027610;
  v12[3] = &unk_1000F3330;
  objc_copyWeak(&v13, &location);
  [v11 animateAlongsideTransition:v12 completion:0];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)dismissalTransitionWillBegin
{
  double v3 = [(FBAPartialPresentationController *)self presentingViewController];
  double v4 = [v3 transitionCoordinator];

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100027758;
  v5[3] = &unk_1000F3330;
  objc_copyWeak(&v6, &location);
  [v4 animateAlongsideTransition:v5 completion:0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  id v3 = [(FBAPartialPresentationController *)self dimmingView];
  [v3 removeFromSuperview];
}

- (CGRect)frameOfPresentedViewInContainerView
{
  [(FBAPartialPresentationController *)self height];
  double v4 = v3;
  double v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;

  [(FBAPartialPresentationController *)self height];
  double v8 = 150.0;
  if (v9 >= 150.0)
  {
    double v8 = v4;
    if ([(FBAPartialPresentationController *)self isPresentingFullScreen])
    {
      double v10 = +[UIApplication sharedApplication];
      v11 = [v10 windows];
      v12 = [v11 firstObject];
      [v12 safeAreaInsets];
      double v8 = v7 - v13;
    }
  }
  v14 = [(FBAPartialPresentationController *)self containerView];
  [v14 bounds];
  double v16 = v15 - v8;
  objc_super v17 = [(FBAPartialPresentationController *)self containerView];
  [v17 bounds];
  double v19 = v18;

  double v20 = 0.0;
  double v21 = v16;
  double v22 = v19;
  double v23 = v8;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIView)dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    id v4 = objc_alloc((Class)UIView);
    double v5 = [(FBAPartialPresentationController *)self containerView];
    [v5 bounds];
    double v7 = v6;
    double v8 = [(FBAPartialPresentationController *)self containerView];
    [v8 bounds];
    double v9 = [v4 initWithFrame:0.0, 0.0, v7];
    double v10 = self->_dimmingView;
    self->_dimmingView = v9;

    v11 = +[UIColor _dimmingViewColor];
    [(UIView *)self->_dimmingView setBackgroundColor:v11];

    [(UIView *)self->_dimmingView setAlpha:0.0];
    [(UIView *)self->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"dismissPresentation:"];
    [v12 setNumberOfTouchesRequired:1];
    [(UIView *)self->_dimmingView addGestureRecognizer:v12];

    dimmingView = self->_dimmingView;
  }

  return dimmingView;
}

- (void)dismissPresentation:(id)a3
{
  id v3 = [(FBAPartialPresentationController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)isPresentingFullScreen
{
  id v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  [(FBAPartialPresentationController *)self height];
  return v6 > v5 * 0.9;
}

- (int64_t)adaptivePresentationStyle
{
  if ([(FBAPartialPresentationController *)self isPresentingFullScreen]) {
    return 5;
  }
  else {
    return -2;
  }
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end