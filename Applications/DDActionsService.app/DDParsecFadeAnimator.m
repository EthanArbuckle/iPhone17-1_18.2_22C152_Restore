@interface DDParsecFadeAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation DDParsecFadeAnimator

- (double)transitionDuration:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = [location[0] viewControllerForKey:UITransitionContextToViewControllerKey];
  id v22 = [location[0] viewControllerForKey:UITransitionContextFromViewControllerKey];
  id v5 = [location[0] containerView];
  id v4 = [v23 view];
  [v5 addSubview:];

  id v6 = [v23 view];
  [v6 setAlpha:0.0];

  [(DDParsecFadeAnimator *)v25 transitionDuration:location[0]];
  double v7 = v3;
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_10000AD88;
  v19 = &unk_1000208A8;
  id v20 = v23;
  id v21 = v22;
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_10000AE10;
  v12 = &unk_1000208D0;
  id v13 = v22;
  id v14 = location[0];
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v15, v7);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end