@interface AMUIOnboardingContainerView
- (AMAmbientDefaults)ambientDefaults;
- (AMUIOnboardingContainerViewDelegate)delegate;
- (id)_newBlurMaterialViewWithInitialWeighting:(double)a3 superview:(id)a4;
- (void)_configureAnimationContainerViewIfNecessary;
- (void)_configureOnboardingViewIfNecessary;
- (void)_configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:(double)a3;
- (void)_layoutOnboardingView;
- (void)_performDismissalAnimationWithCompletion:(id)a3;
- (void)_performPresentationAnimationWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)onboardingViewRequestsDismissal:(id)a3;
- (void)performDismissalAnimation;
- (void)performPresentationAnimation;
- (void)setAmbientDefaults:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMUIOnboardingContainerView

- (void)performPresentationAnimation
{
}

- (void)performDismissalAnimation
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__AMUIOnboardingContainerView_performDismissalAnimation__block_invoke;
  v2[3] = &unk_2652247E0;
  v2[4] = self;
  [(AMUIOnboardingContainerView *)self _performDismissalAnimationWithCompletion:v2];
}

void __56__AMUIOnboardingContainerView_performDismissalAnimation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 onboardingContainerView:*(void *)(a1 + 32) requestsDismissalWithUserIntent:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingContainerView;
  [(AMUIOnboardingContainerView *)&v3 layoutSubviews];
  [(AMUIOnboardingContainerView *)self _configureAnimationContainerViewIfNecessary];
  [(AMUIOnboardingContainerView *)self _configureOnboardingViewIfNecessary];
  [(AMUIOnboardingContainerView *)self _layoutOnboardingView];
}

- (void)onboardingViewRequestsDismissal:(id)a3
{
  v4 = [(AMUIOnboardingContainerView *)self ambientDefaults];
  [v4 setFirstPresentation:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__AMUIOnboardingContainerView_onboardingViewRequestsDismissal___block_invoke;
  v5[3] = &unk_2652247E0;
  v5[4] = self;
  [(AMUIOnboardingContainerView *)self _performDismissalAnimationWithCompletion:v5];
}

void __63__AMUIOnboardingContainerView_onboardingViewRequestsDismissal___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 onboardingContainerView:*(void *)(a1 + 32) requestsDismissalWithUserIntent:1];
}

- (void)_configureAnimationContainerViewIfNecessary
{
  if (!self->_animationContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x263F1CB60]);
    [(AMUIOnboardingContainerView *)self bounds];
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    animationContainerView = self->_animationContainerView;
    self->_animationContainerView = v4;

    [(UIView *)self->_animationContainerView setAutoresizingMask:18];
    [(AMUIOnboardingContainerView *)self addSubview:self->_animationContainerView];
    [(AMUIOnboardingContainerView *)self bringSubviewToFront:self->_animationContainerView];
    v6 = self->_animationContainerView;
    [(UIView *)v6 setAlpha:0.0];
  }
}

- (void)_configureOnboardingViewIfNecessary
{
  if (!self->_onboardingView)
  {
    id v3 = [AMUIOnboardingView alloc];
    v4 = -[AMUIOnboardingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    onboardingView = self->_onboardingView;
    self->_onboardingView = v4;

    [(AMUIOnboardingView *)self->_onboardingView setDelegate:self];
    [(UIView *)self->_animationContainerView addSubview:self->_onboardingView];
    animationContainerView = self->_animationContainerView;
    v7 = self->_onboardingView;
    [(UIView *)animationContainerView bringSubviewToFront:v7];
  }
}

- (id)_newBlurMaterialViewWithInitialWeighting:(double)a3 superview:(id)a4
{
  v5 = (void *)MEMORY[0x263F53FE8];
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = [v5 materialViewWithRecipeNamed:@"ambientOnboardingOverlayBlur" inBundle:v8 options:0 initialWeighting:0 scaleAdjustment:a3];

  [v9 setGroupNameBase:@"AMUIOnboardingViewMaterialGroup"];
  [v7 addSubview:v9];
  [v7 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  [v9 setAutoresizingMask:18];
  return v9;
}

- (void)_layoutOnboardingView
{
  if (self->_onboardingView)
  {
    [(AMUIOnboardingContainerView *)self bounds];
    CGFloat x = v9.origin.x;
    CGFloat y = v9.origin.y;
    CGFloat width = v9.size.width;
    CGFloat height = v9.size.height;
    CGRectGetWidth(v9);
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    CGRectGetHeight(v10);
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    CGRectGetWidth(v11);
    UIRectCenteredRect();
    UIRectIntegralWithScale();
    onboardingView = self->_onboardingView;
    -[AMUIOnboardingView setFrame:](onboardingView, "setFrame:");
  }
}

- (void)_performPresentationAnimationWithCompletion:(id)a3
{
  [(AMUIOnboardingContainerView *)self layoutIfNeeded];
  [(AMUIOnboardingContainerView *)self _configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:1.0];
  v4 = self->_animationContainerView;
  v5 = self->_overlayBlurMaterialView;
  [(UIView *)v4 setAlpha:0.0];
  CGAffineTransformMakeScale(&v23, 1.25, 1.25);
  [(UIView *)v4 setTransform:&v23];
  v6 = [(UIView *)v4 layer];
  [v6 setAllowsGroupOpacity:1];

  id v7 = (void *)MEMORY[0x263F1CB60];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke;
  v21[3] = &unk_2652247E0;
  v22 = v5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_2;
  v19[3] = &unk_265224B88;
  v20 = v22;
  v8 = v22;
  [v7 _animateUsingSpringWithDuration:2 delay:v21 options:v19 mass:0.8 stiffness:0.195 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
  CGRect v9 = (void *)MEMORY[0x263F1CB60];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_3;
  v17[3] = &unk_2652247E0;
  CGRect v10 = v4;
  v18 = v10;
  [v9 _animateUsingSpringWithDuration:2 delay:v17 options:0 mass:2.765 stiffness:0.0 damping:2.0 initialVelocity:30.0 animations:11.0 completion:0.0];
  CGRect v11 = (void *)MEMORY[0x263F1CB60];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_4;
  v15[3] = &unk_2652247E0;
  double v16 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_5;
  v13[3] = &unk_265224B88;
  double v14 = v16;
  double v12 = v16;
  [v11 _animateUsingSpringWithDuration:2 delay:v15 options:v13 mass:2.0 stiffness:0.2 damping:1.5 initialVelocity:30.0 animations:12.0 completion:0.0];
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWeighting:0.0];
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

uint64_t __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __75__AMUIOnboardingContainerView__performPresentationAnimationWithCompletion___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setAllowsGroupOpacity:0];
}

- (void)_performDismissalAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  [(AMUIOnboardingContainerView *)self layoutIfNeeded];
  [(AMUIOnboardingContainerView *)self _configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:0.0];
  v5 = self->_animationContainerView;
  v6 = self->_onboardingView;
  id v7 = self->_overlayBlurMaterialView;
  v8 = [(UIView *)v5 layer];
  [v8 setAllowsGroupOpacity:1];

  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeScale(&v22, 0.8, 0.8);
  CGRect v9 = (void *)MEMORY[0x263F1CB60];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke;
  v17[3] = &unk_265224C78;
  v18 = v5;
  v19 = v6;
  CGAffineTransform v21 = v22;
  v20 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke_2;
  v14[3] = &unk_265224CA0;
  double v15 = v18;
  id v16 = v4;
  id v10 = v4;
  CGRect v11 = v18;
  double v12 = v7;
  double v13 = v6;
  [v9 _animateUsingSpringWithDuration:2 delay:v17 options:v14 mass:0.8 stiffness:0.0 damping:2.0 initialVelocity:300.0 animations:50.0 completion:0.0];
}

uint64_t __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v2 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 72);
  v5[0] = *(_OWORD *)(a1 + 56);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 88);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 48) setWeighting:1.0];
}

uint64_t __72__AMUIOnboardingContainerView__performDismissalAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_configureOverlayBlurMaterialViewIfNecessaryWithInitialWeighting:(double)a3
{
  id v4 = [(AMUIOnboardingContainerView *)self _newBlurMaterialViewWithInitialWeighting:self->_animationContainerView superview:a3];
  overlayBlurMaterialView = self->_overlayBlurMaterialView;
  self->_overlayBlurMaterialView = v4;

  animationContainerView = self->_animationContainerView;
  id v7 = self->_overlayBlurMaterialView;

  [(UIView *)animationContainerView bringSubviewToFront:v7];
}

- (AMUIOnboardingContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIOnboardingContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMAmbientDefaults)ambientDefaults
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);

  return (AMAmbientDefaults *)WeakRetained;
}

- (void)setAmbientDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationContainerView, 0);
  objc_storeStrong((id *)&self->_onboardingView, 0);

  objc_storeStrong((id *)&self->_overlayBlurMaterialView, 0);
}

@end