@interface AVTActionsToAttributeEditorTransitionAnimator
+ (UIEdgeInsets)adjustedSafeAreaInsetsForView:(id)a3;
- (AVTActionsToAttributeEditorTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6;
- (AVTUIEnvironment)environment;
- (AVTViewLayoutInfo)avtViewLayoutInfo;
- (BOOL)RTL;
- (double)transitionDuration:(id)a3;
- (double)userInfoViewHeight;
- (void)animateTransition:(id)a3;
@end

@implementation AVTActionsToAttributeEditorTransitionAnimator

+ (UIEdgeInsets)adjustedSafeAreaInsetsForView:(id)a3
{
  [a3 safeAreaInsets];
  if (v3 > 40.0) {
    double v3 = v3 + -40.0;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (AVTActionsToAttributeEditorTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTActionsToAttributeEditorTransitionAnimator;
  v13 = [(AVTActionsToAttributeEditorTransitionAnimator *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environment, a6);
    objc_storeStrong((id *)&v14->_avtViewLayoutInfo, a3);
    v14->_RTL = a5;
    v14->_userInfoViewHeight = a4;
  }

  return v14;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  double v6 = [v4 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v6 format];
  }
  id v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v5 format];
  }
  id v8 = v5;
  v9 = [v4 viewForKey:*MEMORY[0x263F1D7A8]];
  v10 = [v4 viewForKey:*MEMORY[0x263F1D7B8]];
  [v4 finalFrameForViewController:v7];
  uint64_t v62 = v12;
  uint64_t v63 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [v8 currentLayout];
  uint64_t v18 = [v17 buttonCount];

  v19 = [(AVTActionsToAttributeEditorTransitionAnimator *)self environment];
  double v60 = v14;
  double v61 = v16;
  if ([v19 deviceIsPad])
  {
  }
  else
  {
    v20 = [(AVTActionsToAttributeEditorTransitionAnimator *)self environment];
    int v21 = [v20 deviceIsMac];

    if (!v21)
    {
      v22 = AVTAvatarActionsViewControllerLayout;
      goto LABEL_10;
    }
  }
  v22 = AVTAvatarActionsViewControllerPadLayout;
LABEL_10:
  id v23 = [v22 alloc];
  [v9 safeAreaInsets];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(AVTActionsToAttributeEditorTransitionAnimator *)self avtViewLayoutInfo];
  v33 = objc_msgSend(v23, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v18, v32, v14, v16, v25, v27, v29, v31);

  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:v9];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double userInfoViewHeight = self->_userInfoViewHeight;
  BOOL v42 = [(AVTActionsToAttributeEditorTransitionAnimator *)self RTL];
  [v33 avatarContainerViewFrame];
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  v51 = [(AVTActionsToAttributeEditorTransitionAnimator *)self environment];
  v52 = +[AVTAvatarAttributeEditorLayoutProvider actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:](AVTAvatarAttributeEditorLayoutProvider, "actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:", v42, v51, v60, v61, 100.0, v35, v37, v39, v41, userInfoViewHeight, v44, v46, v48, v50, 0x3FF0000000000000);

  v53 = [v4 containerView];
  [v53 addSubview:v10];

  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke;
  v64[3] = &unk_263FF0D68;
  uint64_t v71 = v63;
  uint64_t v72 = v62;
  double v73 = v60;
  double v74 = v61;
  id v65 = v4;
  v66 = self;
  id v67 = v10;
  id v68 = v52;
  id v69 = v9;
  id v70 = v7;
  id v54 = v7;
  id v55 = v9;
  id v56 = v52;
  id v57 = v10;
  id v58 = v4;
  [v54 prepareForAnimatedTransitionWithLayout:v56 completionBlock:v64];
}

void __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 backgroundColor];
  double v5 = [*(id *)(a1 + 32) containerView];
  [v5 setBackgroundColor:v4];

  [v3 setAlpha:0.0];
  double v6 = [AVTAvatarAttributeEditorOverridingLayout alloc];
  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:*(void *)(a1 + 48)];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [*(id *)(a1 + 56) userInfoViewHeight];
  double v16 = v15;
  uint64_t v17 = [*(id *)(a1 + 40) RTL];
  uint64_t v18 = [*(id *)(a1 + 40) environment];
  v19 = +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v17, v18, *(double *)(a1 + 96), *(double *)(a1 + 104), v8, v10, v12, v14, v16);
  v20 = [(AVTAvatarAttributeEditorOverridingLayout *)v6 initWithLayout:v19];

  [(AVTAvatarAttributeEditorOverridingLayout *)v20 attributesContentViewFrame];
  -[AVTAvatarAttributeEditorOverridingLayout setAttributesContentViewFrame:](v20, "setAttributesContentViewFrame:", v21 + 0.0, v22 + 0.0);
  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:*(void *)(a1 + 48)];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [*(id *)(a1 + 56) userInfoViewHeight];
  double v32 = v31;
  uint64_t v33 = [*(id *)(a1 + 40) RTL];
  double v34 = [*(id *)(a1 + 40) environment];
  double v35 = +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v33, v34, *(double *)(a1 + 96), *(double *)(a1 + 104), v24, v26, v28, v30, v32);

  [*(id *)(a1 + 40) transitionDuration:*(void *)(a1 + 32)];
  double v37 = v36;
  double v38 = v36 * 0.25;
  double v39 = (void *)MEMORY[0x263F1CB60];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_2;
  v55[3] = &unk_263FF03D8;
  id v56 = *(id *)(a1 + 64);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_3;
  v53[3] = &unk_263FF04A0;
  id v54 = v3;
  id v40 = v3;
  [v39 animateWithDuration:v55 animations:v53 completion:v38];
  double v41 = (void *)MEMORY[0x263F1CB60];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_4;
  v50[3] = &unk_263FF0780;
  id v51 = *(id *)(a1 + 72);
  v52 = v20;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_5;
  v44[3] = &unk_263FF0D40;
  id v45 = *(id *)(a1 + 72);
  id v46 = v35;
  id v47 = *(id *)(a1 + 64);
  id v48 = *(id *)(a1 + 32);
  id v49 = *(id *)(a1 + 48);
  id v42 = v35;
  uint64_t v43 = v20;
  [v41 animateWithDuration:0 delay:v50 usingSpringWithDamping:v44 initialSpringVelocity:v37 * 0.75 options:v38 animations:0.7 completion:0.65];
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyLayout:*(void *)(a1 + 40)];
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) applyLayout:*(void *)(a1 + 40)];
  v2 = (id *)(a1 + 48);
  [*(id *)(a1 + 48) setAlpha:1.0];
  if ([*(id *)(a1 + 56) transitionWasCancelled])
  {
    v2 = (id *)(a1 + 64);
  }
  else
  {
    id v3 = [MEMORY[0x263F1C550] clearColor];
    id v4 = [*(id *)(a1 + 56) containerView];
    [v4 setBackgroundColor:v3];
  }
  [*v2 removeFromSuperview];
  [*(id *)(a1 + 32) setDisableAvatarSnapshotting:0];
  double v5 = *(void **)(a1 + 56);
  uint64_t v6 = [v5 transitionWasCancelled] ^ 1;
  return [v5 completeTransition:v6];
}

- (double)transitionDuration:(id)a3
{
  id v3 = +[AVTUIEnvironment defaultEnvironment];
  [v3 actionAnimationsMultiplier];
  double v5 = v4 * 0.84;

  return v5;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTViewLayoutInfo)avtViewLayoutInfo
{
  return self->_avtViewLayoutInfo;
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (double)userInfoViewHeight
{
  return self->_userInfoViewHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayoutInfo, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end