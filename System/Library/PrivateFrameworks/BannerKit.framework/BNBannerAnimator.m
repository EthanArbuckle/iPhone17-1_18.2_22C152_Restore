@interface BNBannerAnimator
+ (id)defaultResizeAnimationSettings;
+ (void)_animateInteractive:(BOOL)a3 settings:(id)a4 animations:(id)a5 completion:(id)a6;
+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5;
- (BNBannerAnimator)init;
- (BNBannerAnimator)initWithAnimationSettings:(id)a3;
- (BOOL)_popTransitionForContext:(id)a3;
- (BOOL)isRetargetable;
- (double)transitionDuration:(id)a3;
- (void)_pushTransitionForContext:(id)a3;
- (void)actionsForTransition:(id)a3;
- (void)animateTransition:(id)a3;
- (void)retargetTransition:(id)a3;
@end

@implementation BNBannerAnimator

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
}

+ (void)animateWithSettings:(id)a3 animations:(id)a4 completion:(id)a5
{
}

+ (id)defaultResizeAnimationSettings
{
  return (id)[MEMORY[0x1E4F4F840] settingsWithMass:3.0 stiffness:1000.0 damping:500.0];
}

- (BNBannerAnimator)initWithAnimationSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BNBannerAnimator;
  v6 = [(BNBannerAnimator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animationSettings, a3);
  }

  return v7;
}

- (BNBannerAnimator)init
{
  return [(BNBannerAnimator *)self initWithAnimationSettings:0];
}

- (BOOL)isRetargetable
{
  return self->_animationSettings == 0;
}

- (void)retargetTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BNBannerAnimator *)self isRetargetable];
  if (v4 && v5)
  {
    [(BNBannerAnimator *)self _pushTransitionForContext:v4];
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__BNBannerAnimator_retargetTransition___block_invoke;
    v11[3] = &unk_1E63B9B88;
    id v7 = v4;
    id v12 = v7;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__BNBannerAnimator_retargetTransition___block_invoke_2;
    v8[3] = &unk_1E63BA0C0;
    objc_copyWeak(&v10, &location);
    id v9 = v7;
    [v6 _animateByRetargetingAnimations:v11 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __39__BNBannerAnimator_retargetTransition___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

void __39__BNBannerAnimator_retargetTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained _popTransitionForContext:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 32) completeTransition:1];
  }
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__BNBannerAnimator_animateTransition___block_invoke;
  v23[3] = &unk_1E63BA0E8;
  objc_copyWeak(&v24, &location);
  BOOL v5 = (void (**)(void, void))MEMORY[0x1C1899380](v23);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__BNBannerAnimator_animateTransition___block_invoke_2;
  v20[3] = &unk_1E63BA0C0;
  objc_copyWeak(&v22, &location);
  id v6 = v4;
  id v21 = v6;
  id v7 = (void *)MEMORY[0x1C1899380](v20);
  if ([v6 isAnimated]
    && ([(BNBannerAnimator *)self transitionDuration:v6], v8 > 0.0))
  {
    [(BNBannerAnimator *)self _pushTransitionForContext:v6];
    if (self->_animationSettings)
    {
      id v9 = objc_opt_class();
      animationSettings = self->_animationSettings;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __38__BNBannerAnimator_animateTransition___block_invoke_3;
      v17[3] = &unk_1E63BA110;
      v19 = v5;
      id v18 = v6;
      [v9 animateWithSettings:animationSettings animations:v17 completion:v7];
      v11 = (id *)&v19;
      id v12 = &v18;
    }
    else
    {
      v13 = objc_opt_class();
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __38__BNBannerAnimator_animateTransition___block_invoke_4;
      v14[3] = &unk_1E63BA110;
      v16 = v5;
      id v15 = v6;
      [v13 animateInteractive:0 animations:v14 completion:v7];
      v11 = (id *)&v16;
      id v12 = &v15;
    }
  }
  else
  {
    ((void (**)(void, id))v5)[2](v5, v6);
    [v6 completeTransition:1];
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __38__BNBannerAnimator_animateTransition___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained actionsForTransition:v4];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "__runAlongsideAnimations");
  }
}

void __38__BNBannerAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained _popTransitionForContext:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 32) completeTransition:1];
  }
}

uint64_t __38__BNBannerAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __38__BNBannerAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__BNBannerAnimator_animateTransition___block_invoke_5;
  v9[3] = &unk_1E63BA110;
  id v11 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 3145729, v9, v6, v7, v8);
}

uint64_t __38__BNBannerAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (double)transitionDuration:(id)a3
{
  animationSettings = self->_animationSettings;
  if (!animationSettings) {
    return 0.375;
  }
  [(BSAnimationSettings *)animationSettings duration];
  return result;
}

+ (void)_animateInteractive:(BOOL)a3 settings:(id)a4 animations:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  CAFrameRateRange v12 = v11;
  if (v10)
  {
    if (v9)
    {
      v13 = (void *)MEMORY[0x1E4F4F898];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71__BNBannerAnimator__animateInteractive_settings_animations_completion___block_invoke;
      v14[3] = &unk_1E63B9FC0;
      id v15 = v11;
      [v13 animateWithSettings:v9 options:6 actions:v10 completion:v14];
    }
    else
    {
      [MEMORY[0x1E4F42FF0] _animateUsingSpringInteractive:v8 animations:v10 completion:v11];
    }
  }
  else if (v11)
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

uint64_t __71__BNBannerAnimator__animateInteractive_settings_animations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)_pushTransitionForContext:(id)a3
{
  if (a3)
  {
    transitionContextsToTransitionCount = self->_transitionContextsToTransitionCount;
    id v5 = a3;
    double v6 = [(NSMapTable *)transitionContextsToTransitionCount objectForKey:v5];
    uint64_t v7 = [v6 unsignedIntegerValue];

    BOOL v8 = self->_transitionContextsToTransitionCount;
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      id v10 = self->_transitionContextsToTransitionCount;
      self->_transitionContextsToTransitionCount = v9;

      BOOL v8 = self->_transitionContextsToTransitionCount;
    }
    id v11 = [NSNumber numberWithUnsignedInteger:v7 + 1];
    [(NSMapTable *)v8 setObject:v11 forKey:v5];
  }
}

- (BOOL)_popTransitionForContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  id v5 = [(NSMapTable *)self->_transitionContextsToTransitionCount objectForKey:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  transitionContextsToTransitionCount = self->_transitionContextsToTransitionCount;
  if (!v6)
  {
    [(NSMapTable *)transitionContextsToTransitionCount removeObjectForKey:v4];
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = v6 - 1;
  id v9 = [NSNumber numberWithUnsignedInteger:v8];
  [(NSMapTable *)transitionContextsToTransitionCount setObject:v9 forKey:v4];

  BOOL v10 = v8 != 0;
LABEL_6:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContextsToTransitionCount, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (void)actionsForTransition:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F43EC0];
  id v4 = a3;
  id v14 = [v4 viewControllerForKey:v3];
  id v5 = [v14 view];
  [v4 finalFrameForViewController:v14];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
}

@end