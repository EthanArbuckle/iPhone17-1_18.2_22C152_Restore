@interface CPUIBannerTransitioningDelegate
- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6;
- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4;
@end

@implementation CPUIBannerTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return [(CPUIBannerTransitioningDelegate *)self animationControllerForPresentedController:a3 presentingController:a4 sourceController:a5 userInfo:0];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [(CPUIBannerTransitioningDelegate *)self animationControllerForDismissedController:a3 userInfo:0];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v7 = a6;
  v8 = [v7 objectForKey:@"CPUIBannerTransitionAnimationStyle"];
  if (v8)
  {
    v9 = [v7 objectForKey:@"CPUIBannerTransitionAnimationStyle"];
    uint64_t v10 = [v9 integerValue];
  }
  else
  {
    uint64_t v10 = 0;
  }

  v11 = objc_msgSend(objc_alloc(-[CPUIBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v10)), "initForPresenting:", 1);
  return v11;
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKey:@"CPUIBannerTransitionAnimationStyle"];
  if (v6)
  {
    id v7 = [v5 objectForKey:@"CPUIBannerTransitionAnimationStyle"];
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    uint64_t v8 = 1;
  }

  v9 = objc_msgSend(objc_alloc(-[CPUIBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v8)), "initForPresenting:", 0);
  return v9;
}

- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4
{
  id v4 = [(BNBannerTransitionAnimator *)[CPUIBannerTransitionAnimator alloc] initForPresenting:1];
  return v4;
}

- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3
{
  id v3 = (id)objc_opt_class();
  return (Class)v3;
}

@end