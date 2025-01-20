@interface AVTAttributeEditorToActionsTransitionAnimator
+ (UIEdgeInsets)adjustedSafeAreaInsetsForView:(id)a3;
- (AVTAttributeEditorToActionsTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6;
- (AVTUIEnvironment)environment;
- (AVTViewLayoutInfo)avtViewLayoutInfo;
- (BOOL)RTL;
- (double)transitionDuration:(id)a3;
- (double)userInfoViewHeight;
- (void)animateTransition:(id)a3;
@end

@implementation AVTAttributeEditorToActionsTransitionAnimator

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

- (AVTAttributeEditorToActionsTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTAttributeEditorToActionsTransitionAnimator;
  v13 = [(AVTAttributeEditorToActionsTransitionAnimator *)&v16 init];
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
  id v123 = v5;
  v8 = [v7 currentLayout];
  uint64_t v120 = [v8 buttonCount];

  [v4 finalFrameForViewController:v7];
  double v10 = v9;
  double v124 = v9;
  double v12 = v11;
  v13 = [v4 viewForKey:*MEMORY[0x263F1D7A8]];
  v14 = [v4 viewForKey:*MEMORY[0x263F1D7B8]];
  uint64_t v15 = [v14 backgroundColor];
  objc_super v16 = [v4 containerView];
  v121 = (void *)v15;
  [v16 setBackgroundColor:v15];

  v17 = [MEMORY[0x263F1C550] clearColor];
  [v14 setBackgroundColor:v17];

  v18 = [v4 containerView];
  [v18 addSubview:v14];

  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:v13];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double userInfoViewHeight = self->_userInfoViewHeight;
  BOOL v28 = [(AVTAttributeEditorToActionsTransitionAnimator *)self RTL];
  v29 = [(AVTAttributeEditorToActionsTransitionAnimator *)self environment];
  double v117 = v12;
  v30 = +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v28, v29, v10, v12, v20, v22, v24, v26, userInfoViewHeight);

  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:v13];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v39 = self->_userInfoViewHeight;
  BOOL v40 = [(AVTAttributeEditorToActionsTransitionAnimator *)self RTL];
  v41 = [(AVTAttributeEditorToActionsTransitionAnimator *)self environment];
  v119 = +[AVTAvatarAttributeEditorLayoutProvider editorToActionsTransitionStartingLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "editorToActionsTransitionStartingLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v40, v41, v10, v12, v32, v34, v36, v38, v39);

  [(id)objc_opt_class() adjustedSafeAreaInsetsForView:v13];
  double v116 = v42;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v49 = self->_userInfoViewHeight;
  BOOL v50 = [(AVTAttributeEditorToActionsTransitionAnimator *)self RTL];
  [v30 avatarContainerFrame];
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  v59 = [(AVTAttributeEditorToActionsTransitionAnimator *)self environment];
  v60 = +[AVTAvatarAttributeEditorLayoutProvider actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:](AVTAvatarAttributeEditorLayoutProvider, "actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:", v50, v59, v124, v117, 0.0, v116, v44, v46, v48, v49, v52, v54, v56, v58, 0);

  v61 = [(AVTAttributeEditorToActionsTransitionAnimator *)self environment];
  v122 = v7;
  v118 = v30;
  if ([v61 deviceIsPad])
  {
  }
  else
  {
    v62 = [(AVTAttributeEditorToActionsTransitionAnimator *)self environment];
    int v63 = [v62 deviceIsMac];

    if (!v63)
    {
      v82 = [AVTAvatarActionsViewControllerTransitionStartingLayout alloc];
      [v14 safeAreaInsets];
      double v84 = v83;
      double v86 = v85;
      double v88 = v87;
      double v90 = v89;
      v91 = [(AVTAttributeEditorToActionsTransitionAnimator *)self avtViewLayoutInfo];
      [v30 avatarContainerFrame];
      double v74 = v124;
      uint64_t v75 = v120;
      v80 = -[AVTAvatarActionsViewControllerTransitionStartingLayout initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:](v82, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:", v120, v91, v124, v117, v84, v86, v88, v90, v92, v93, v94, v95);

      v81 = AVTAvatarActionsViewControllerLayout;
      goto LABEL_10;
    }
  }
  v64 = [AVTAvatarActionsViewControllerTransitionPadStartingLayout alloc];
  [v14 safeAreaInsets];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  v73 = [(AVTAttributeEditorToActionsTransitionAnimator *)self avtViewLayoutInfo];
  [v30 avatarContainerFrame];
  double v74 = v124;
  uint64_t v75 = v120;
  v80 = -[AVTAvatarActionsViewControllerTransitionPadStartingLayout initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:](v64, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:", v120, v73, v124, v117, v66, v68, v70, v72, v76, v77, v78, v79);

  v81 = AVTAvatarActionsViewControllerPadLayout;
LABEL_10:
  id v96 = [v81 alloc];
  [v14 safeAreaInsets];
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  v105 = [(AVTAttributeEditorToActionsTransitionAnimator *)self avtViewLayoutInfo];
  v106 = objc_msgSend(v96, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v75, v105, v74, v117, v98, v100, v102, v104);

  v125[0] = MEMORY[0x263EF8330];
  v125[1] = 3221225472;
  v125[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke;
  v125[3] = &unk_263FF1598;
  v125[4] = self;
  id v126 = v4;
  id v127 = v123;
  id v128 = v119;
  id v129 = v60;
  id v130 = v13;
  id v131 = v122;
  id v132 = v106;
  id v133 = v14;
  id v134 = v121;
  id v107 = v121;
  id v108 = v14;
  id v109 = v106;
  id v110 = v122;
  id v111 = v13;
  id v112 = v60;
  id v113 = v119;
  id v114 = v123;
  id v115 = v4;
  [v110 prepareForAnimatedTransitionWithLayout:v80 completionBlock:v125];
}

void __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) transitionDuration:*(void *)(a1 + 40)];
  double v3 = v2;
  [*(id *)(a1 + 48) applyLayout:*(void *)(a1 + 56)];
  id v4 = (void *)MEMORY[0x263F1CB60];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_2;
  v16[3] = &unk_263FF0780;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 64);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_3;
  v14[3] = &unk_263FF04A0;
  id v15 = *(id *)(a1 + 72);
  [v4 animateWithDuration:v16 animations:v14 completion:v3 * 0.4];
  double v5 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_4;
  v11[3] = &unk_263FF0780;
  id v12 = *(id *)(a1 + 80);
  id v13 = *(id *)(a1 + 88);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_5;
  v6[3] = &unk_263FF1570;
  id v7 = *(id *)(a1 + 96);
  id v8 = *(id *)(a1 + 104);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 72);
  [v5 animateWithDuration:0 delay:v11 options:v6 animations:v3 * 0.3 completion:v3 * 0.35];
}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyLayout:*(void *)(a1 + 40)];
}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) applyLayout:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 48) transitionWasCancelled];
  uint64_t v3 = 56;
  if (v2) {
    uint64_t v3 = 32;
  }
  [*(id *)(a1 + v3) removeFromSuperview];
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = [v4 transitionWasCancelled] ^ 1;
  return [v4 completeTransition:v5];
}

- (double)transitionDuration:(id)a3
{
  uint64_t v3 = +[AVTUIEnvironment defaultEnvironment];
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