@interface CCUIContentModuleDetailAnimationController
- (BOOL)isPresenting;
- (UIViewPropertyAnimator)propertyAnimator;
- (double)transitionDuration:(id)a3;
- (id)_contentModuleContainingViewController;
- (id)_newPropertyAnimator;
- (id)initForPresenting:(BOOL)a3 anchoringViewController:(id)a4;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)performTransition:(id)a3;
@end

@implementation CCUIContentModuleDetailAnimationController

- (id)initForPresenting:(BOOL)a3 anchoringViewController:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CCUIContentModuleDetailAnimationController;
  v8 = [(CCUIContentModuleDetailAnimationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a3;
    objc_storeStrong((id *)&v8->_anchoringViewController, a4);
  }

  return v9;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    v4 = [(CCUIContentModuleDetailAnimationController *)self _newPropertyAnimator];
    v5 = self->_propertyAnimator;
    self->_propertyAnimator = v4;

    propertyAnimator = self->_propertyAnimator;
  }
  return propertyAnimator;
}

- (void)performTransition:(id)a3
{
  id v4 = a3;
  v5 = [(CCUIContentModuleDetailAnimationController *)self _contentModuleContainingViewController];
  v6 = (void *)MEMORY[0x1E4FB30B8];
  if (self->_presenting) {
    v6 = (void *)MEMORY[0x1E4FB30C8];
  }
  id v7 = [v4 viewControllerForKey:*v6];
  v8 = v7;
  if (self->_presenting) {
    [v5 contentContainerView];
  }
  else {
  v9 = [v7 view];
  }
  if (self->_presenting) {
    [v8 view];
  }
  else {
  v10 = [v5 contentContainerView];
  }
  objc_super v11 = (void *)MEMORY[0x1E4FB1EB0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke;
  v21[3] = &unk_1E6AD4340;
  id v12 = v10;
  id v22 = v12;
  id v13 = v9;
  id v23 = v13;
  [v11 performWithoutAnimation:v21];
  if (([v5 isExpanded] & 1) == 0)
  {
    if (self->_presenting)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 willPresentViewController:v8];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 willDismissViewController:v8];
    }
  }
  [v12 setAlpha:1.0];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v14;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v12 setTransform:v20];
  [v13 setAlpha:0.0];
  CGAffineTransformMakeScale(&v19, 0.8, 0.8);
  [v13 setTransform:&v19];
  if (self->_presenting)
  {
    v15 = [(CCUIContentModuleDetailAnimationController *)self propertyAnimator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke_2;
    v17[3] = &unk_1E6AD44A8;
    id v18 = v13;
    [v15 addCompletion:v17];

    v16 = v18;
  }
  else
  {
    v16 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
    [v16 removeFromSuperview];
  }
}

uint64_t __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v7, 0.8, 0.8);
  [v2 setTransform:&v7];
  [*(id *)(a1 + 40) setAlpha:1.0];
  v3 = *(void **)(a1 + 40);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v3 setTransform:v6];
}

uint64_t __64__CCUIContentModuleDetailAnimationController_performTransition___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([v4 isAnimated])
  {
    v5 = [(CCUIContentModuleDetailAnimationController *)self propertyAnimator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke;
    v9[3] = &unk_1E6AD4340;
    v9[4] = self;
    id v6 = v4;
    id v10 = v6;
    [v5 addAnimations:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke_2;
    v7[3] = &unk_1E6AD44A8;
    id v8 = v6;
    [v5 addCompletion:v7];
    [v5 startAnimation];
  }
  else
  {
    [v4 completeTransition:1];
  }
}

uint64_t __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTransition:*(void *)(a1 + 40)];
}

uint64_t __64__CCUIContentModuleDetailAnimationController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2 == 0];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animationEnded:(BOOL)a3
{
  self->_propertyAnimator = 0;
  MEMORY[0x1F41817F8]();
}

- (id)_newPropertyAnimator
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  return (id)[v2 initWithDuration:0 dampingRatio:0.5 animations:0.65];
}

- (id)_contentModuleContainingViewController
{
  id v2 = self->_anchoringViewController;
  if (v2)
  {
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([(UIViewController *)v2 definesContentModuleContainer] & 1) != 0)
      {
        break;
      }
      uint64_t v3 = [(UIViewController *)v2 parentViewController];

      id v2 = (UIViewController *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_anchoringViewController, 0);
}

@end