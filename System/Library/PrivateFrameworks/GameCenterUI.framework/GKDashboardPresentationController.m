@interface GKDashboardPresentationController
+ (void)presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)presenting;
- (GKDashboardPresentationController)init;
- (double)transitionDuration;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation GKDashboardPresentationController

- (GKDashboardPresentationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPresentationController;
  v2 = [(GKDashboardPresentationController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKDashboardPresentationController *)v2 setTransitionDuration:0.5];
  }
  return v3;
}

+ (void)presentViewController:(id)a3 presentingViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v10 = objc_alloc_init(GKDashboardPresentationController);
  [v7 setTransitioningDelegate:v10];
  v9 = [v7 navigationController];

  [v9 pushViewController:v8 animated:v5];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self;
}

- (void)animationEnded:(BOOL)a3
{
}

- (void)animateTransition:(id)a3
{
  id v23 = a3;
  v4 = [v23 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  BOOL v5 = [v23 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v6 = [v23 containerView];
  if ([(GKDashboardPresentationController *)self presenting])
  {
    id v7 = [v4 view];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    v16 = [v5 view];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    v17 = [v5 view];
    [v17 setAutoresizingMask:18];

    v18 = [v5 view];
    [v6 addSubview:v18];

    v19 = [v5 view];
    [v19 layoutIfNeeded];

    v20 = [v4 view];
    [v20 layoutIfNeeded];

    [v23 completeTransition:1];
  }
  else
  {
    [v23 completeTransition:1];
    v21 = [v4 view];
    [v21 removeFromSuperview];

    v22 = [v5 view];
    [v22 layoutIfNeeded];
  }
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

@end