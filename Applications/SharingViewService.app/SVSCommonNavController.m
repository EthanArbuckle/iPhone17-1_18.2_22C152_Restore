@interface SVSCommonNavController
- (BOOL)_canShowWhileLocked;
- (UIView)dimmingView;
- (UIViewControllerAnimatedTransitioning)transitionAnimator;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)cancelProxCardDraggingWithCompletion:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 transition:(int)a4;
- (void)setTransitionAnimator:(id)a3;
@end

@implementation SVSCommonNavController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAnimator, 0);

  objc_storeStrong((id *)&self->_dimmingView, 0);
}

- (void)setTransitionAnimator:(id)a3
{
}

- (UIViewControllerAnimatedTransitioning)transitionAnimator
{
  return self->_transitionAnimator;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)pushViewController:(id)a3 transition:(int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100136374;
  v6[3] = &unk_1001A17A8;
  int v9 = a4;
  id v7 = a3;
  v8 = self;
  id v5 = v7;
  [(SVSCommonNavController *)self cancelProxCardDraggingWithCompletion:v6];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100136450;
  v6[3] = &unk_1001A1848;
  BOOL v9 = a4;
  id v7 = a3;
  v8 = self;
  id v5 = v7;
  [(SVSCommonNavController *)self cancelProxCardDraggingWithCompletion:v6];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100136558;
  v11[3] = &unk_1001A1820;
  BOOL v15 = a4;
  v13 = self;
  id v14 = a5;
  id v12 = v8;
  id v9 = v14;
  id v10 = v8;
  [(SVSCommonNavController *)self cancelProxCardDraggingWithCompletion:v11];
}

- (void)cancelProxCardDraggingWithCompletion:(id)a3
{
  id v8 = (void (**)(void))a3;
  v4 = [(SVSCommonNavController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(SVSCommonNavController *)self topViewController];
    id v7 = v6;
    if (v6) {
      [v6 cancelProxCardDraggingWithCompletion:v8];
    }
    else {
      v8[2]();
    }
  }
  else
  {
    v8[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[PopUpPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  id v10 = [(PopUpPresentationController *)v9 dimmingView];
  dimmingView = self->_dimmingView;
  self->_dimmingView = v10;

  return v9;
}

@end