@interface AMSUISlideAnimator
- (CASpringAnimation)animation;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setAnimation:(id)a3;
@end

@implementation AMSUISlideAnimator

- (double)transitionDuration:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F83C00];
  id v4 = a3;
  v5 = [v4 viewControllerForKey:v3];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];

  v7 = [v5 presentedViewController];

  if (v7 == v6)
  {
    v9 = [MEMORY[0x263F15890] animationWithKeyPath:@"position.y"];
    [v9 setMass:1.0];
    [v9 setStiffness:150.0];
    [v9 setDamping:19.0];
    [v9 setInitialVelocity:0.0];
    [v9 settlingDuration];
    double v8 = v10;
  }
  else
  {
    double v8 = 0.18;
  }

  return v8;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v7 = [v5 presentedViewController];

  double v8 = [v4 containerView];
  [(AMSUISlideAnimator *)self transitionDuration:v4];
  double v10 = v9;
  if (v7 == v6)
  {
    [v4 finalFrameForViewController:v6];
    double v26 = v25;
    uint64_t v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [v8 frame];
    double v34 = v33;
    v35 = [v6 view];
    objc_msgSend(v35, "setFrame:", v26, v34, v30, v32);

    v36 = [v6 view];
    [v8 addSubview:v36];

    v19 = objc_msgSend(objc_alloc(MEMORY[0x263F82BF0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 19.0, 0.0, 0.0);
    v20 = (void *)[objc_alloc(MEMORY[0x263F82E30]) initWithDuration:v19 timingParameters:v10];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke;
    v47[3] = &unk_2643E4608;
    v21 = (id *)v48;
    v48[0] = v6;
    *(double *)&v48[1] = v26;
    v48[2] = v28;
    *(double *)&v48[3] = v30;
    *(double *)&v48[4] = v32;
    [v20 addAnimations:v47];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke_2;
    v45[3] = &unk_2643E3BE0;
    v22 = &v46;
    id v46 = v4;
    id v37 = v4;
    v24 = v45;
  }
  else
  {
    [v4 initialFrameForViewController:v5];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    [v8 frame];
    uint64_t v18 = v17;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x263F82640]), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.65, 0.0);
    v20 = (void *)[objc_alloc(MEMORY[0x263F82E30]) initWithDuration:v19 timingParameters:v10];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __40__AMSUISlideAnimator_animateTransition___block_invoke_3;
    v43[3] = &unk_2643E4608;
    v21 = (id *)v44;
    v44[0] = v5;
    v44[1] = v12;
    v44[2] = v18;
    v44[3] = v14;
    v44[4] = v16;
    [v20 addAnimations:v43];
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __40__AMSUISlideAnimator_animateTransition___block_invoke_4;
    v41 = &unk_2643E3BE0;
    v22 = &v42;
    id v42 = v4;
    id v23 = v4;
    v24 = &v38;
  }
  objc_msgSend(v20, "addCompletion:", v24, v38, v39, v40, v41);
  [v20 startAnimation];
}

void __40__AMSUISlideAnimator_animateTransition___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) view];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __40__AMSUISlideAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2 == 0];
}

void __40__AMSUISlideAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) view];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __40__AMSUISlideAnimator_animateTransition___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2 == 0];
}

- (CASpringAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end