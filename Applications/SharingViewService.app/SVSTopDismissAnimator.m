@interface SVSTopDismissAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SVSTopDismissAnimator

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(SVSTopDismissAnimator *)self transitionDuration:v4];
  double v6 = v5;
  [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001359E0;
  v12[3] = &unk_1001A1BD8;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100135A5C;
  v9[3] = &unk_1001A18C0;
  id v10 = v13;
  id v11 = v4;
  id v7 = v4;
  id v8 = v13;
  +[UIView animateWithDuration:v12 animations:v9 completion:v6];
}

@end