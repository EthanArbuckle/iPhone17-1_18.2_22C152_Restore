@interface BNBannerReplacementTransitionAnimator
- (void)actionsForTransition:(id)a3;
@end

@implementation BNBannerReplacementTransitionAnimator

- (void)actionsForTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BNBannerTransitionAnimator *)self isPresenting];
  v6 = (void *)MEMORY[0x1E4F43EC0];
  if (!v5) {
    v6 = (void *)MEMORY[0x1E4F43EB0];
  }
  v7 = [v4 viewControllerForKey:*v6];

  v8 = [v7 view];
  memset(&v17, 0, sizeof(v17));
  if (v5)
  {
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v17.c = v9;
    *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v10 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v17, 0.8, 0.8);
    double v10 = 0.0;
  }
  CGAffineTransform v16 = v17;
  [v8 setTransform:&v16];
  v11 = (void *)MEMORY[0x1E4F42FF0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__BNBannerReplacementTransitionAnimator_actionsForTransition___block_invoke;
  v13[3] = &unk_1E63B9E78;
  id v14 = v8;
  double v15 = v10;
  id v12 = v8;
  [v11 animateWithDuration:0 delay:v13 options:0 animations:0.2 completion:0.25];
}

uint64_t __62__BNBannerReplacementTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

@end