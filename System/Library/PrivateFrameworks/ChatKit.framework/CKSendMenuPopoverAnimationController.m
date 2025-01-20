@interface CKSendMenuPopoverAnimationController
- (BOOL)isPresenting;
- (CKSendMenuPopoverAnimationController)initWithConfiguration:(id)a3 presenting:(BOOL)a4;
- (CKSendMenuPopoverPresentationConfiguration)configuration;
- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem;
- (double)transitionDuration:(id)a3;
- (void)animateDismissTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5;
- (void)animatePresentTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5;
- (void)animateTransition:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation CKSendMenuPopoverAnimationController

- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem
{
  v2 = [(CKSendMenuPopoverAnimationController *)self configuration];
  v3 = [v2 anchorItem];

  return (CKSendMenuPopoverPresentationControllerAnchorItem *)v3;
}

- (CKSendMenuPopoverAnimationController)initWithConfiguration:(id)a3 presenting:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKSendMenuPopoverAnimationController;
  v8 = [(CKSendMenuPopoverAnimationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a4;
    objc_storeStrong((id *)&v8->_configuration, a3);
  }

  return v9;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  if (self->_presenting)
  {
    v6 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
    id v7 = [v6 popoverView];
    v8 = [(CKSendMenuPopoverAnimationController *)self configuration];
    v9 = [v8 initialViewController];

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3010000000;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    v28[3] = "";
    [v9 preferredContentSize];
    uint64_t v29 = v10;
    uint64_t v30 = v11;
    v12 = (void *)MEMORY[0x1E4F42FF0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke;
    v22[3] = &unk_1E5621E60;
    v27 = v28;
    id v13 = v6;
    id v23 = v13;
    id v14 = v7;
    id v24 = v14;
    v25 = self;
    id v15 = v5;
    id v26 = v15;
    [v12 performWithoutAnimation:v22];
    v16 = [(CKSendMenuPopoverAnimationController *)self configuration];
    v17 = [v16 sendMenuViewController];

    if (v17) {
      [v13 setSendMenuViewController:v9];
    }
    else {
      [v13 setAppContainerViewController:v9];
    }
    v19 = (void *)MEMORY[0x1E4F42FF0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke_2;
    v20[3] = &unk_1E5620C40;
    id v18 = v14;
    id v21 = v18;
    [v19 performWithoutAnimation:v20];
    [(CKSendMenuPopoverAnimationController *)self animatePresentTransitionUsingContext:v4 containerView:v15 popoverViewController:v13];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v13 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EB0]];
    id v18 = [v13 popoverView];
    [(CKSendMenuPopoverAnimationController *)self animateDismissTransitionUsingContext:v4 containerView:v5 popoverViewController:v13];
  }
}

void __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8);
  double v3 = *(double *)(v2 + 32);
  if (v3 <= 300.0 || (double v4 = *(double *)(v2 + 40), v4 <= 300.0))
  {
    *(int64x2_t *)(v2 + 32) = vdupq_n_s64(0x4072C00000000000uLL);
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    double v3 = *(double *)(v5 + 32);
    double v4 = *(double *)(v5 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v3, v4);
  v6 = [*(id *)(a1 + 32) view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:1];

  id v7 = [*(id *)(a1 + 32) view];
  [v7 setAutoresizingMask:0];

  v8 = [*(id *)(a1 + 32) view];
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v3, v4);

  v9 = [*(id *)(a1 + 32) view];
  [v9 setNeedsLayout];

  uint64_t v10 = [*(id *)(a1 + 32) view];
  [v10 layoutIfNeeded];

  uint64_t v11 = [*(id *)(a1 + 40) blurBackgroundView];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v3, v4);

  v12 = [*(id *)(a1 + 40) backdropView];
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v3, v4);

  id v13 = [*(id *)(a1 + 40) blurContentsView];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v3, v4);

  id v14 = [*(id *)(a1 + 48) configuration];
  id v24 = [v14 anchorItem];

  id v15 = [v24 anchorView];
  [v24 anchorRect];
  objc_msgSend(v15, "convertRect:toView:", *(void *)(a1 + 56));
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [*(id *)(a1 + 56) addSubview:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v17, v19, v21, v23);
}

void __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareForPresentation];
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  [*(id *)(a1 + 32) bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [*(id *)(a1 + 32) bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  id v28 = [*(id *)(a1 + 32) blurContentsView];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);
}

- (void)animatePresentTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  [v6 finalFrameForViewController:v7];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  double MinX = CGRectGetMinX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  double v13 = MinX + CGRectGetWidth(v20) * 0.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double MinY = CGRectGetMinY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double v15 = objc_msgSend(v7, "animationForPresentingInitialViewControllerWithFinalBounds:finalCenter:", 0.0, 0.0, width, height, v13, MinY + CGRectGetHeight(v22) * 0.5);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__CKSendMenuPopoverAnimationController_animatePresentTransitionUsingContext_containerView_popoverViewController___block_invoke;
  v17[3] = &unk_1E5620C40;
  id v18 = v6;
  id v16 = v6;
  [v15 setCompletion:v17];
  [v15 startAnimation];
}

uint64_t __113__CKSendMenuPopoverAnimationController_animatePresentTransitionUsingContext_containerView_popoverViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)animateDismissTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  double v11 = [(CKSendMenuPopoverAnimationController *)self anchorItem];
  double v12 = [v11 anchorView];
  [v11 anchorRect];
  objc_msgSend(v10, "convertRect:fromView:", v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v35.origin.CGFloat x = v14;
  v35.origin.CGFloat y = v16;
  v35.size.double width = v18;
  v35.size.double height = v20;
  double MinX = CGRectGetMinX(v35);
  v36.origin.CGFloat x = v14;
  v36.origin.CGFloat y = v16;
  v36.size.double width = v18;
  v36.size.double height = v20;
  double Width = CGRectGetWidth(v36);
  v37.origin.CGFloat x = v14;
  v37.origin.CGFloat y = v16;
  v37.size.double width = v18;
  v37.size.double height = v20;
  double MinY = CGRectGetMinY(v37);
  v38.origin.CGFloat x = v14;
  v38.origin.CGFloat y = v16;
  v38.size.double width = v18;
  v38.size.double height = v20;
  double Height = CGRectGetHeight(v38);
  double v25 = [(CKSendMenuPopoverAnimationController *)self configuration];
  double v26 = [v25 sendMenuViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v28 = 1.0;
  if (isKindOfClass)
  {
    uint64_t v29 = [(CKSendMenuPopoverAnimationController *)self configuration];
    uint64_t v30 = [v29 sendMenuViewController];

    LODWORD(v29) = [v30 isPresentingAudioRecordingQuickSend];
    if (v29) {
      double v28 = 0.0;
    }
    else {
      double v28 = 1.0;
    }
  }
  v31 = objc_msgSend(v9, "animationForDismissingWithFinalBounds:finalCenter:finalAlpha:", 0.0, 0.0, v18, v20, MinX + Width * 0.5, MinY + Height * 0.5, v28);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __113__CKSendMenuPopoverAnimationController_animateDismissTransitionUsingContext_containerView_popoverViewController___block_invoke;
  v33[3] = &unk_1E5620C40;
  id v34 = v8;
  id v32 = v8;
  [v31 setCompletion:v33];
  [v31 startAnimation];
}

uint64_t __113__CKSendMenuPopoverAnimationController_animateDismissTransitionUsingContext_containerView_popoverViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
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