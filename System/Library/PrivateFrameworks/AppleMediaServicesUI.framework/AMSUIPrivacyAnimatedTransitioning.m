@interface AMSUIPrivacyAnimatedTransitioning
- (BOOL)isPresentation;
- (UIViewController)viewController;
- (double)transitionDuration:(id)a3;
- (id)_presentedViewControllerForContext:(id)a3;
- (void)_animateTransition:(id)a3 completionBlock:(id)a4;
- (void)animateTransition:(id)a3;
- (void)setPresentation:(BOOL)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIPrivacyAnimatedTransitioning

- (id)_presentedViewControllerForContext:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F83C00];
  id v5 = a3;
  v6 = [v5 viewControllerForKey:v4];
  v7 = [v5 viewControllerForKey:*MEMORY[0x263F83C10]];

  if ([(AMSUIPrivacyAnimatedTransitioning *)self isPresentation]) {
    v8 = v7;
  }
  else {
    v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (double)transitionDuration:(id)a3
{
  return 0.404;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__AMSUIPrivacyAnimatedTransitioning_animateTransition___block_invoke;
  v6[3] = &unk_2643E4568;
  id v7 = v4;
  id v5 = v4;
  [(AMSUIPrivacyAnimatedTransitioning *)self _animateTransition:v5 completionBlock:v6];
}

uint64_t __55__AMSUIPrivacyAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (void)_animateTransition:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 containerView];
  BOOL v9 = [(AMSUIPrivacyAnimatedTransitioning *)self isPresentation];
  v10 = [(AMSUIPrivacyAnimatedTransitioning *)self _presentedViewControllerForContext:v7];
  v11 = [v10 view];
  [v8 layoutIfNeeded];
  [(AMSUIPrivacyAnimatedTransitioning *)self transitionDuration:v7];
  double v13 = v12;

  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v32.c = v14;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v31.a = *(_OWORD *)&v32.a;
  *(_OWORD *)&v31.c = v14;
  *(_OWORD *)&v31.tx = *(_OWORD *)&v32.tx;
  if (v9)
  {
    CGAffineTransformMakeScale(&v32, 1.2, 1.2);
    double v15 = 0.0;
  }
  else
  {
    double v15 = 1.0;
    CGAffineTransformMakeScale(&v31, 1.0, 1.0);
  }
  CGAffineTransform v30 = v32;
  [v11 setTransform:&v30];
  [v11 setAlpha:v15];
  v16 = [v10 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v16 dimmingView];
  }
  else
  {
    v17 = 0;
  }
  if (v9) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  [v17 setAlpha:v15];
  v19 = (void *)MEMORY[0x263F82E00];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __72__AMSUIPrivacyAnimatedTransitioning__animateTransition_completionBlock___block_invoke;
  v25[3] = &unk_2643E4590;
  CGAffineTransform v28 = v31;
  double v29 = v18;
  id v26 = v11;
  id v27 = v17;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __72__AMSUIPrivacyAnimatedTransitioning__animateTransition_completionBlock___block_invoke_2;
  v23[3] = &unk_2643E45B8;
  id v24 = v6;
  id v20 = v6;
  id v21 = v17;
  id v22 = v11;
  [v19 animateWithDuration:6 delay:v25 usingSpringWithDamping:v23 initialSpringVelocity:v13 options:0.0 animations:600.0 completion:0.0];
}

uint64_t __72__AMSUIPrivacyAnimatedTransitioning__animateTransition_completionBlock___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  [*(id *)(a1 + 32) setTransform:v4];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 96)];
  return [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 96)];
}

uint64_t __72__AMSUIPrivacyAnimatedTransitioning__animateTransition_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isPresentation
{
  return self->_presentation;
}

- (void)setPresentation:(BOOL)a3
{
  self->_presentation = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end