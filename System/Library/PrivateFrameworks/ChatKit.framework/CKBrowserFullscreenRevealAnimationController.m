@interface CKBrowserFullscreenRevealAnimationController
- (BOOL)isPresenting;
- (CKBrowserFullscreenRevealAnimationController)initWithDirection:(BOOL)a3;
- (UIViewPropertyAnimator)ascentDescentAnimator;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setAscentDescentAnimator:(id)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation CKBrowserFullscreenRevealAnimationController

- (CKBrowserFullscreenRevealAnimationController)initWithDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKBrowserFullscreenRevealAnimationController;
  v4 = [(CKBrowserFullscreenRevealAnimationController *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_presenting = v3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42910]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    v7 = [CKBrowserFullscreenCubicSpringTimingParameters alloc];
    if (v3) {
      double v8 = 100.0;
    }
    else {
      double v8 = 39.0;
    }
    v9 = -[CKBrowserFullscreenCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v7, "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, v8, 0.0, 0.0);
    [(CKBrowserFullscreenCubicSpringTimingParameters *)v9 setSpringCubicTimingParameters:v6];
    v10 = [(UIViewPropertyAnimator *)[CKBrowserFullscreenCubicSpringPropertyAnimator alloc] initWithDuration:v9 timingParameters:0.0];
    ascentDescentAnimator = v5->_ascentDescentAnimator;
    v5->_ascentDescentAnimator = &v10->super;

    [(UIViewPropertyAnimator *)v5->_ascentDescentAnimator setInterruptible:0];
  }
  return v5;
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(CKBrowserFullscreenRevealAnimationController *)self ascentDescentAnimator];
  [v3 duration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKBrowserFullscreenRevealAnimationController *)self isPresenting];
  v6 = (void *)MEMORY[0x1E4F43EC0];
  if (!v5) {
    v6 = (void *)MEMORY[0x1E4F43EB0];
  }
  v7 = [v4 viewControllerForKey:*v6];
  BOOL v8 = [(CKBrowserFullscreenRevealAnimationController *)self isPresenting];
  v9 = (void *)MEMORY[0x1E4F43EC8];
  if (!v8) {
    v9 = (void *)MEMORY[0x1E4F43EB8];
  }
  v10 = [v4 viewForKey:*v9];
  v11 = [v4 containerView];
  [v4 finalFrameForViewController:v7];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(CKBrowserFullscreenRevealAnimationController *)self isPresenting])
  {
    [v11 addSubview:v10];
    objc_msgSend(v10, "setFrame:", v13, v15, v17, v19);
    [v10 layoutIfNeeded];
    [v11 bounds];
    double Height = CGRectGetHeight(v48);
    v49.origin.x = v13;
    v49.origin.y = v15;
    v49.size.width = v17;
    v49.size.height = v19;
    CGFloat MinY = CGRectGetMinY(v49);
    CGAffineTransformMakeTranslation(&v47, 0.0, Height - MinY);
    CGAffineTransform v46 = v47;
    [v10 setTransform:&v46];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E5620C40;
  id v22 = v7;
  id v45 = v22;
  v23 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_2;
  v37[3] = &unk_1E56285E8;
  id v38 = v22;
  id v39 = v11;
  double v40 = v13;
  double v41 = v15;
  double v42 = v17;
  double v43 = v19;
  id v24 = v11;
  id v25 = v22;
  v26 = _Block_copy(v37);
  v27 = [(CKBrowserFullscreenRevealAnimationController *)self ascentDescentAnimator];
  if ([(CKBrowserFullscreenRevealAnimationController *)self isPresenting]) {
    v28 = v23;
  }
  else {
    v28 = v26;
  }
  [v27 addAnimations:v28];

  v29 = [(CKBrowserFullscreenRevealAnimationController *)self ascentDescentAnimator];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  v34 = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_3;
  v35 = &unk_1E5622978;
  id v36 = v4;
  id v30 = v4;
  [v29 addCompletion:&v32];

  v31 = [(CKBrowserFullscreenRevealAnimationController *)self ascentDescentAnimator];
  [v31 startAnimation];
}

void __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) view];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v3[0] = *MEMORY[0x1E4F1DAB8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v1 setTransform:v3];
}

void __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 40) bounds];
  double Height = CGRectGetHeight(v7);
  CGFloat MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeTranslation(&v6, 0.0, Height - MinY);
  id v4 = [*(id *)(a1 + 32) view];
  CGAffineTransform v5 = v6;
  [v4 setTransform:&v5];
}

uint64_t __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) transitionWasCancelled] ^ 1;
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 completeTransition:v3];
}

- (UIViewPropertyAnimator)ascentDescentAnimator
{
  return self->_ascentDescentAnimator;
}

- (void)setAscentDescentAnimator:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
}

@end