@interface CKViewController
- (BOOL)appeared;
- (BOOL)appearing;
- (BOOL)deferredAppeared;
- (BOOL)dissapearing;
- (void)childViewControllersPerform:(SEL)a3;
- (void)parentControllerDidBecomeActive;
- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4;
- (void)performResumeDeferredSetup;
- (void)prepareForResume;
- (void)prepareForSuspend;
- (void)setAppeared:(BOOL)a3;
- (void)setAppearing:(BOOL)a3;
- (void)setDeferredAppeared:(BOOL)a3;
- (void)setDissapearing:(BOOL)a3;
- (void)significantTimeChange;
- (void)systemApplicationWillEnterForeground;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  [(CKViewController *)&v4 viewWillAppear:a3];
  [(CKViewController *)self setAppearing:1];
  [(CKViewController *)self setDissapearing:0];
  [(CKViewController *)self setAppeared:0];
  [(CKViewController *)self setDeferredAppeared:0];
}

- (void)setDissapearing:(BOOL)a3
{
  self->_dissapearing = a3;
}

- (void)setDeferredAppeared:(BOOL)a3
{
  self->_deferredAppeared = a3;
}

- (void)setAppearing:(BOOL)a3
{
  self->_appearing = a3;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  [(CKViewController *)&v4 viewDidAppear:a3];
  [(CKViewController *)self setAppearing:0];
  [(CKViewController *)self setDissapearing:0];
  [(CKViewController *)self setAppeared:1];
  [(CKViewController *)self setDeferredAppeared:0];
  [(CKViewController *)self performSelector:sel_viewDidAppearDeferredSetup withObject:0 afterDelay:0.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  [(CKViewController *)&v4 viewWillDisappear:a3];
  [(CKViewController *)self setAppearing:0];
  [(CKViewController *)self setDissapearing:1];
  [(CKViewController *)self setAppeared:0];
  [(CKViewController *)self setDeferredAppeared:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKViewController;
  [(CKViewController *)&v4 viewDidDisappear:a3];
  [(CKViewController *)self setAppearing:0];
  [(CKViewController *)self setDissapearing:0];
  [(CKViewController *)self setAppeared:0];
  [(CKViewController *)self setDeferredAppeared:0];
}

- (void)significantTimeChange
{
}

- (void)prepareForSuspend
{
}

- (void)prepareForResume
{
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  v6 = [(CKViewController *)self childViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CKViewController_parentControllerDidResume_animating___block_invoke;
  v7[3] = &__block_descriptor_34_e33_v32__0__UIViewController_8Q16_B24l;
  BOOL v8 = a3;
  BOOL v9 = a4;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __56__CKViewController_parentControllerDidResume_animating___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 parentControllerDidResume:*(unsigned __int8 *)(a1 + 32) animating:*(unsigned __int8 *)(a1 + 33)];
  }
}

- (void)parentControllerDidBecomeActive
{
}

- (void)systemApplicationWillEnterForeground
{
}

- (void)performResumeDeferredSetup
{
}

- (void)viewDidAppearDeferredSetup
{
}

- (void)childViewControllersPerform:(SEL)a3
{
  objc_super v4 = [(CKViewController *)self childViewControllers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CKViewController_childViewControllersPerform___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v32__0__UIViewController_8Q16_B24l;
  v5[4] = a3;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __48__CKViewController_childViewControllersPerform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 performSelector:*(void *)(a1 + 32)];
  }
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (BOOL)deferredAppeared
{
  return self->_deferredAppeared;
}

- (BOOL)appearing
{
  return self->_appearing;
}

- (BOOL)dissapearing
{
  return self->_dissapearing;
}

@end