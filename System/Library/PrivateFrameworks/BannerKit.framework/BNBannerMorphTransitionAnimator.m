@interface BNBannerMorphTransitionAnimator
- (double)transitionDuration:(id)a3;
- (id)_materialGroupNameBaseForView:(id)a3;
- (id)_materialGroupNameBaseForViewController:(id)a3;
- (id)initForStateChange:(BOOL)a3;
- (void)actionsForTransition:(id)a3;
@end

@implementation BNBannerMorphTransitionAnimator

- (id)initForStateChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BNBannerMorphTransitionAnimator;
  id result = [(BNBannerAnimator *)&v5 init];
  if (result) {
    *((unsigned char *)result + 25) = a3;
  }
  return result;
}

- (void)actionsForTransition:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F43EB0];
  id v5 = a3;
  v6 = [v5 viewControllerForKey:v4];
  v7 = [v5 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  v8 = [v6 view];
  v9 = [v7 view];
  [v5 initialFrameForViewController:v7];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v5 finalFrameForViewController:v7];
  uint64_t v34 = v19;
  uint64_t v35 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = (void *)MEMORY[0x1E4F42FF0];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke;
  v49[3] = &unk_1E63B9DE8;
  id v25 = v9;
  id v50 = v25;
  double v51 = v15 / v21;
  double v52 = v17 / v23;
  uint64_t v53 = v11;
  uint64_t v54 = v13;
  double v55 = v15;
  double v56 = v17;
  [v24 performWithoutAnimation:v49];
  v26 = [(BNBannerMorphTransitionAnimator *)self _materialGroupNameBaseForViewController:v6];
  v27 = [(BNBannerMorphTransitionAnimator *)self _materialGroupNameBaseForViewController:v7];
  char v28 = [v26 isEqual:v27];

  if ((v28 & 1) == 0) {
    [v8 setAlpha:0.0];
  }
  [v25 setAlpha:1.0];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_2;
  v40[3] = &unk_1E63B9E10;
  id v29 = v8;
  id v41 = v29;
  double v43 = v15 / v21;
  double v44 = v17 / v23;
  id v30 = v25;
  id v42 = v30;
  uint64_t v45 = v35;
  uint64_t v46 = v34;
  double v47 = v21;
  double v48 = v23;
  uint64_t v31 = MEMORY[0x1C1899380](v40);
  v32 = (void *)v31;
  if (*(&self->super._presenting + 1))
  {
    CGAffineTransformMakeScale(&v39, 1.1 / (v15 / v21), 1.1 / (v17 / v23));
    [v29 setTransform:&v39];
    CGAffineTransformMakeScale(&v38, 1.1, 1.1);
    [v30 setTransform:&v38];
    dispatch_time_t v33 = dispatch_time(0, 275000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_3;
    block[3] = &unk_1E63B9E38;
    id v37 = v32;
    dispatch_after(v33, MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*(void (**)(uint64_t))(v31 + 16))(v31);
  }
}

uint64_t __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  [v2 setTransform:&v4];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v7, 1.0 / *(double *)(a1 + 48), 1.0 / *(double *)(a1 + 56));
  [v2 setTransform:&v7];
  v3 = *(void **)(a1 + 40);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v6];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

void __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_3(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_4;
  v1[3] = &unk_1E63B9E38;
  id v2 = *(id *)(a1 + 32);
  +[BNBannerTransitionAnimator animateInteractive:0 animations:v1 completion:0];
}

uint64_t __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)transitionDuration:(id)a3
{
  return 0.375;
}

- (id)_materialGroupNameBaseForView:(id)a3
{
  id v3 = a3;
  long long v4 = [v3 subviews];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v3 materialGroupNameBase];
    goto LABEL_8;
  }
  if ([v4 count] == 1)
  {
    v6 = [v4 lastObject];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v6 materialGroupNameBase];

      goto LABEL_8;
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (id)_materialGroupNameBaseForViewController:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 materialGroupNameBase];
  }
  else
  {
    uint64_t v6 = [v4 view];

    id v5 = [(BNBannerMorphTransitionAnimator *)self _materialGroupNameBaseForView:v6];
    id v4 = (id)v6;
  }

  return v5;
}

@end