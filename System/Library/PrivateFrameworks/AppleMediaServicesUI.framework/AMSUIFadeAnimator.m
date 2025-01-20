@interface AMSUIFadeAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation AMSUIFadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v7 = [v4 containerView];
  v8 = [v5 presentedViewController];

  [(AMSUIFadeAnimator *)self transitionDuration:v4];
  double v10 = v9;
  if (v8 == v6)
  {
    [v4 finalFrameForViewController:v6];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    v23 = [v6 view];
    [v23 setAlpha:0.0];

    v24 = [v6 view];
    objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);

    v25 = [v6 view];
    [v7 addSubview:v25];

    v11 = v32;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    uint64_t v12 = 1;
    v13 = __39__AMSUIFadeAnimator_animateTransition___block_invoke;
    v14 = v6;
  }
  else
  {
    v11 = v31;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    uint64_t v12 = 2;
    v13 = __39__AMSUIFadeAnimator_animateTransition___block_invoke_2;
    v14 = v5;
  }
  v11[2] = v13;
  v11[3] = &unk_2643E3118;
  v11[4] = v14;
  v26 = _Block_copy(v11);

  v27 = (void *)[objc_alloc(MEMORY[0x263F82E30]) initWithDuration:v12 curve:v26 animations:v10];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __39__AMSUIFadeAnimator_animateTransition___block_invoke_3;
  v29[3] = &unk_2643E3BE0;
  id v30 = v4;
  id v28 = v4;
  [v27 addCompletion:v29];
  [v27 startAnimation];
}

void __39__AMSUIFadeAnimator_animateTransition___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __39__AMSUIFadeAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t __39__AMSUIFadeAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2 == 0];
}

@end