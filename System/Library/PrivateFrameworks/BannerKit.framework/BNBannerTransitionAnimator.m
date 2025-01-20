@interface BNBannerTransitionAnimator
+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (BOOL)isPresenting;
- (double)transitionDuration:(id)a3;
- (id)initForPresenting:(BOOL)a3;
- (void)actionsForTransition:(id)a3;
@end

@implementation BNBannerTransitionAnimator

- (id)initForPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BNBannerTransitionAnimator;
  id result = [(BNBannerAnimator *)&v5 init];
  if (result) {
    *((unsigned char *)result + 24) = a3;
  }
  return result;
}

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    if (v6) {
      double v11 = 0.85;
    }
    else {
      double v11 = 1.0;
    }
    if (v6) {
      double v12 = 0.08;
    }
    else {
      double v12 = 0.5;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__BNBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke;
    v13[3] = &unk_1E63B9E38;
    id v14 = v7;
    [v10 _animateUsingSpringWithDampingRatio:v6 response:v13 tracking:v9 dampingRatioSmoothing:v11 responseSmoothing:v12 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.998];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
  }
}

uint64_t __71__BNBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)actionsForTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_presenting) {
    BOOL v6 = (void *)MEMORY[0x1E4F43EC0];
  }
  else {
    BOOL v6 = (void *)MEMORY[0x1E4F43EB0];
  }
  id v7 = [v4 viewControllerForKey:*v6];
  id v8 = [v7 view];
  if (self->_presenting)
  {
    [v5 initialFrameForViewController:v7];
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    v17 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__BNBannerTransitionAnimator_actionsForTransition___block_invoke;
    v18[3] = &unk_1E63B9EC8;
    id v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    uint64_t v23 = v16;
    [v17 performWithoutAnimation:v18];
  }
  [v5 finalFrameForViewController:v7];
  objc_msgSend(v8, "setFrame:");
}

uint64_t __51__BNBannerTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (double)transitionDuration:(id)a3
{
  if (self->_presenting) {
    v3 = (uint64_t *)MEMORY[0x1E4F43EC0];
  }
  else {
    v3 = (uint64_t *)MEMORY[0x1E4F43EB0];
  }
  uint64_t v4 = *v3;
  id v5 = a3;
  BOOL v6 = [v5 viewControllerForKey:v4];
  [v5 initialFrameForViewController:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v5 finalFrameForViewController:v6];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  if (CGRectEqualToRect(v25, v26)) {
    double v23 = 0.0;
  }
  else {
    double v23 = 0.375;
  }

  return v23;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end