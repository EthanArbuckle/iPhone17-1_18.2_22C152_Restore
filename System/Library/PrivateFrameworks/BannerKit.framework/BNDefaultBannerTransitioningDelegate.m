@interface BNDefaultBannerTransitioningDelegate
- (BNDefaultBannerTransitioningDelegate)init;
- (BOOL)isResizeAnimationCustomizationPermitted;
- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3;
- (id)_sizeTransitionAnimationSettingsForViewController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6;
- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4;
- (id)animationControllerMorphFromPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6 stateChange:(BOOL)a7;
- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3;
- (void)setResizeAnimationCustomizationPermitted:(BOOL)a3;
@end

@implementation BNDefaultBannerTransitioningDelegate

- (BNDefaultBannerTransitioningDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)BNDefaultBannerTransitioningDelegate;
  result = [(BNDefaultBannerTransitioningDelegate *)&v3 init];
  if (result) {
    result->_resizeAnimationCustomizationPermitted = 1;
  }
  return result;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return [(BNDefaultBannerTransitioningDelegate *)self animationControllerForPresentedController:a3 presentingController:a4 sourceController:a5 userInfo:0];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [(BNDefaultBannerTransitioningDelegate *)self animationControllerForDismissedController:a3 userInfo:0];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v7 = a6;
  v8 = [v7 objectForKey:@"BNBannerTransitionAnimationStyle"];
  if (v8)
  {
    v9 = [v7 objectForKey:@"BNBannerTransitionAnimationStyle"];
    uint64_t v10 = [v9 integerValue];
  }
  else
  {
    uint64_t v10 = 0;
  }

  v11 = objc_msgSend(objc_alloc(-[BNDefaultBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v10)), "initForPresenting:", 1);
  return v11;
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKey:@"BNBannerTransitionAnimationStyle"];
  if (v6)
  {
    id v7 = [v5 objectForKey:@"BNBannerTransitionAnimationStyle"];
    uint64_t v8 = [v7 integerValue];
  }
  else
  {
    uint64_t v8 = 0;
  }

  v9 = objc_msgSend(objc_alloc(-[BNDefaultBannerTransitioningDelegate _bannerTransitionAnimatorClassForAnimationStyle:](self, "_bannerTransitionAnimatorClassForAnimationStyle:", v8)), "initForPresenting:", 0);
  return v9;
}

- (id)animationControllerForResizingController:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  v6 = [BNBannerAnimator alloc];
  id v7 = [(BNDefaultBannerTransitioningDelegate *)self _sizeTransitionAnimationSettingsForViewController:v5];

  uint64_t v8 = [(BNBannerAnimator *)v6 initWithAnimationSettings:v7];
  return v8;
}

- (id)animationControllerMorphFromPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6 stateChange:(BOOL)a7
{
  id v7 = [[BNBannerMorphTransitionAnimator alloc] initForStateChange:a7];
  return v7;
}

- (id)sizeTransitionAnimationSettingsForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 viewController];
    v6 = [(BNDefaultBannerTransitioningDelegate *)self _sizeTransitionAnimationSettingsForViewController:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sizeTransitionAnimationSettingsForViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_resizeAnimationCustomizationPermitted
    || ([v4 bannerSizeTransitionAnimationSettings],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 isHostedContent])
    {
      v6 = +[BNBannerAnimator defaultResizeAnimationSettings];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (Class)_bannerTransitionAnimatorClassForAnimationStyle:(int64_t)a3
{
  id v3 = (id)objc_opt_class();
  return (Class)v3;
}

- (BOOL)isResizeAnimationCustomizationPermitted
{
  return self->_resizeAnimationCustomizationPermitted;
}

- (void)setResizeAnimationCustomizationPermitted:(BOOL)a3
{
  self->_resizeAnimationCustomizationPermitted = a3;
}

@end