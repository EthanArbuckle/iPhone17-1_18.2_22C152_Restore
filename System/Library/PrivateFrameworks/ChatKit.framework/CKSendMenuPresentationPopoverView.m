@interface CKSendMenuPresentationPopoverView
+ (CGAffineTransform)affineTransformToDownScaleSize:(SEL)a3 toSize:(CGSize)a4;
- (BOOL)isLayoutSubviewsEnabled;
- (CKEntryViewPlusButton)plusButton;
- (CKSendMenuPopoverBlurContentsView)blurContentsView;
- (CKSendMenuPresentationPopoverBackdropView)backdropView;
- (CKSendMenuPresentationPopoverView)init;
- (UIView)appView;
- (UIView)sendMenuView;
- (UIVisualEffectView)blurBackgroundView;
- (id)_animationForDismissingContentView:(id)a3 finalBounds:(CGRect)a4 finalCenter:(CGPoint)a5 finalAlpha:(double)a6;
- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5;
- (id)animationForPresentingInitialViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4;
- (id)animationForTransitioningToAppViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4;
- (id)animationForTransitioningToNewSize:(CGSize)a3 center:(CGPoint)a4;
- (id)contentContainerView;
- (void)layoutSubviews;
- (void)prepareForPresentation;
- (void)setAppView:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBlurBackgroundView:(id)a3;
- (void)setLayoutSubviewsEnabled:(BOOL)a3;
- (void)setPlusButton:(id)a3;
- (void)setSendMenuView:(id)a3;
@end

@implementation CKSendMenuPresentationPopoverView

- (CKSendMenuPresentationPopoverView)init
{
  v21.receiver = self;
  v21.super_class = (Class)CKSendMenuPresentationPopoverView;
  v2 = -[CKSendMenuPresentationPopoverView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKSendMenuPresentationPopoverView *)v2 setBackgroundColor:v3];

    [(CKSendMenuPresentationPopoverView *)v2 setAlpha:1.0];
    v2->_layoutSubviewsEnabled = 0;
    v4 = objc_alloc_init(CKSendMenuPresentationPopoverBackdropView);
    backdropView = v2->_backdropView;
    v2->_backdropView = v4;

    v6 = [CKEntryViewPlusButton alloc];
    v7 = +[CKUIBehavior sharedBehaviors];
    [v7 entryViewPlusButtonSize];
    double v9 = v8;
    v10 = +[CKUIBehavior sharedBehaviors];
    [v10 entryViewPlusButtonSize];
    uint64_t v12 = -[CKEntryViewPlusButton initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, v9, v11);
    plusButton = v2->_plusButton;
    v2->_plusButton = (CKEntryViewPlusButton *)v12;

    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKSendMenuPresentationPopoverBackdropView *)v2->_backdropView setBackgroundColor:v14];

    [(CKSendMenuPresentationPopoverBackdropView *)v2->_backdropView setClipsToBounds:1];
    v15 = [(CKSendMenuPresentationPopoverBackdropView *)v2->_backdropView layer];
    [v15 setMasksToBounds:1];

    v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4F43028]);
    blurBackgroundView = v2->_blurBackgroundView;
    v2->_blurBackgroundView = v16;

    v18 = [(UIVisualEffectView *)v2->_blurBackgroundView layer];
    [v18 setMasksToBounds:1];

    v19 = [(UIVisualEffectView *)v2->_blurBackgroundView contentView];
    [v19 addSubview:v2->_plusButton];

    [(CKSendMenuPresentationPopoverView *)v2 addSubview:v2->_backdropView];
    [(CKSendMenuPresentationPopoverView *)v2 addSubview:v2->_blurBackgroundView];
  }
  return v2;
}

- (BOOL)isLayoutSubviewsEnabled
{
  return self->_layoutSubviewsEnabled;
}

- (void)setLayoutSubviewsEnabled:(BOOL)a3
{
  if (self->_layoutSubviewsEnabled != a3) {
    self->_layoutSubviewsEnabled = a3;
  }
}

- (UIView)appView
{
  return self->_appView;
}

- (void)setAppView:(id)a3
{
  v5 = (UIView *)a3;
  p_appView = &self->_appView;
  appView = self->_appView;
  double v9 = v5;
  if (appView != v5)
  {
    if (appView) {
      [(UIView *)appView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_appView, a3);
    if (*p_appView)
    {
      double v8 = [(CKSendMenuPresentationPopoverView *)self contentContainerView];
      [v8 addSubview:*p_appView];
    }
  }
}

- (void)setSendMenuView:(id)a3
{
  v5 = (UIView *)a3;
  p_sendMenuView = &self->_sendMenuView;
  sendMenuView = self->_sendMenuView;
  double v9 = v5;
  if (sendMenuView != v5)
  {
    if (sendMenuView) {
      [(UIView *)sendMenuView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_sendMenuView, a3);
    if (*p_sendMenuView)
    {
      double v8 = [(CKSendMenuPresentationPopoverView *)self contentContainerView];
      [v8 addSubview:*p_sendMenuView];
    }
  }
}

- (id)contentContainerView
{
  return [(UIVisualEffectView *)self->_blurBackgroundView contentView];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CKSendMenuPresentationPopoverView;
  [(CKSendMenuPresentationPopoverView *)&v9 layoutSubviews];
  if (self->_layoutSubviewsEnabled)
  {
    [(CKSendMenuPresentationPopoverView *)self bounds];
    double x = v10.origin.x;
    double y = v10.origin.y;
    double width = v10.size.width;
    double height = v10.size.height;
    double MidX = CGRectGetMidX(v10);
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    double MidY = CGRectGetMidY(v11);
    -[UIVisualEffectView setFrame:](self->_blurBackgroundView, "setFrame:", x, y, width, height);
    -[CKSendMenuPresentationPopoverBackdropView setBounds:](self->_backdropView, "setBounds:", x, y, width, height);
    -[CKSendMenuPresentationPopoverBackdropView setCenter:](self->_backdropView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_sendMenuView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_sendMenuView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_appView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_appView, "setCenter:", MidX, MidY);
  }
}

- (id)animationForDismissingWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4 finalAlpha:(double)a5
{
  appView = self->_appView;
  if (!appView) {
    appView = self->_sendMenuView;
  }
  return -[CKSendMenuPresentationPopoverView _animationForDismissingContentView:finalBounds:finalCenter:finalAlpha:](self, "_animationForDismissingContentView:finalBounds:finalCenter:finalAlpha:", appView, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y, a5);
}

- (id)_animationForDismissingContentView:(id)a3 finalBounds:(CGRect)a4 finalCenter:(CGPoint)a5 finalAlpha:(double)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat v10 = a4.origin.y;
  CGFloat v11 = a4.origin.x;
  v85[11] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  [v13 bounds];
  double v14 = width / CGRectGetWidth(v87);
  [v13 bounds];
  double v15 = height / CGRectGetHeight(v88);
  if (v14 >= v15) {
    double v14 = v15;
  }
  v16 = +[CKUIBehavior sharedBehaviors];
  v41 = (void *)[v16 newSendMenuDismissPopoverWidthAnimator];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke;
  v78[3] = &unk_1E5628598;
  CGFloat v80 = v11;
  CGFloat v81 = v10;
  double v82 = width;
  double v83 = height;
  v78[4] = self;
  id v17 = v13;
  id v79 = v17;
  double v84 = v14;
  [v41 addAnimations:v78];
  v18 = (void *)[v16 newSendMenuDismissPopoverHeightAnimator];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_2;
  v71[3] = &unk_1E5628598;
  CGFloat v73 = v11;
  CGFloat v74 = v10;
  double v75 = width;
  double v76 = height;
  v71[4] = self;
  id v19 = v17;
  id v72 = v19;
  double v77 = v14;
  v20 = v18;
  v35 = v18;
  [v18 addAnimations:v71];
  v40 = (void *)[v16 newSendMenuDismissPopoverCenterXAnimator];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_3;
  v63[3] = &unk_1E56285C0;
  v63[4] = self;
  CGFloat v65 = x;
  CGFloat v66 = y;
  CGFloat v67 = v11;
  CGFloat v68 = v10;
  double v69 = width;
  double v70 = height;
  id v21 = v19;
  id v64 = v21;
  [v40 addAnimations:v63];
  v37 = (void *)[v16 newSendMenuDismissPopoverCenterYAnimator];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_4;
  v55[3] = &unk_1E56285C0;
  v55[4] = self;
  CGFloat v57 = x;
  CGFloat v58 = y;
  CGFloat v59 = v11;
  CGFloat v60 = v10;
  double v61 = width;
  double v62 = height;
  id v22 = v21;
  id v56 = v22;
  [v37 addAnimations:v55];
  v36 = (void *)[v16 newSendMenuDismissPopoverPlusCenterXAnimator];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_5;
  v54[3] = &unk_1E5621968;
  *(CGFloat *)&v54[5] = v11;
  *(CGFloat *)&v54[6] = v10;
  *(double *)&v54[7] = width;
  *(double *)&v54[8] = height;
  v54[4] = self;
  [v36 addAnimations:v54];
  v23 = (void *)[v16 newSendMenuDismissPopoverPlusCenterYAnimator];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_6;
  v53[3] = &unk_1E5621968;
  *(CGFloat *)&v53[5] = v11;
  *(CGFloat *)&v53[6] = v10;
  *(double *)&v53[7] = width;
  *(double *)&v53[8] = height;
  v53[4] = self;
  v24 = v23;
  [v23 addAnimations:v53];
  v25 = (void *)[v16 newSendMenuDismissPopoverPlusIconScaleXAnimator];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_7;
  v52[3] = &unk_1E5620C40;
  v52[4] = self;
  v26 = v25;
  [v25 addAnimations:v52];
  v27 = (void *)[v16 newSendMenuDismissPopoverPlusIconScaleYAnimator];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_8;
  v51[3] = &unk_1E5620C40;
  v51[4] = self;
  v28 = v27;
  [v27 addAnimations:v51];
  v34 = (void *)[v16 newSendMenuDismissPopoverPlusIconBlurRadiusAnimator];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_9;
  v50[3] = &unk_1E5620C40;
  v50[4] = self;
  [v34 addAnimations:v50 delayFactor:0.185];
  v29 = (void *)[v16 newSendMenuDismissPopoverPlusIconOpacityAnimator];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_10;
  v49[3] = &unk_1E5622950;
  v49[4] = self;
  *(double *)&v49[5] = a6;
  [v29 addAnimations:v49 delayFactor:0.185];
  v30 = (void *)[v16 newSendMenuDismissPopoverAnimator];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_11;
  v42[3] = &unk_1E5628598;
  CGFloat v44 = v11;
  CGFloat v45 = v10;
  double v46 = width;
  double v47 = height;
  v42[4] = self;
  id v43 = v22;
  double v48 = a6;
  id v39 = v22;
  [v30 addAnimations:v42];
  v85[0] = v20;
  v85[1] = v41;
  v85[2] = v40;
  v85[3] = v37;
  v85[4] = v30;
  v85[5] = v36;
  v85[6] = v24;
  v85[7] = v26;
  v85[8] = v28;
  v85[9] = v29;
  v85[10] = v34;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:11];
  v33 = [[CKSendMenuPopoverAnimation alloc] initWithAnimators:v31];

  return v33;
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke(uint64_t a1)
{
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  double v4 = *(double *)(a1 + 80);
  v5 = *(void **)(a1 + 40);

  return objc_msgSend(v5, "ck_setScaleX:", v4);
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_2(uint64_t a1)
{
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:");
  v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setBoundsHeight:", Height);

  double v4 = *(double *)(a1 + 80);
  v5 = *(void **)(a1 + 40);

  return objc_msgSend(v5, "ck_setScaleY:", v4);
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 48));
  double v2 = CGRectGetWidth(*(CGRect *)(a1 + 64)) * 0.5;
  v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setPositionX:", v2);

  double v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "ck_setPositionX:", v2);
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 56));
  double v2 = CGRectGetHeight(*(CGRect *)(a1 + 64)) * 0.5;
  v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setPositionY:", v2);

  double v4 = *(void **)(a1 + 40);

  return objc_msgSend(v4, "ck_setPositionY:", v2);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_5(uint64_t a1)
{
  CGFloat v2 = CGRectGetWidth(*(CGRect *)(a1 + 40)) * 0.5;
  id v3 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v3, "ck_setPositionX:", v2);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_6(uint64_t a1)
{
  CGFloat v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  id v3 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v3, "ck_setPositionY:", v2);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v1, "ck_setScaleX:", 1.0);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v1, "ck_setScaleY:", 1.0);
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_9(uint64_t a1)
{
  CGFloat v2 = [*(id *)(a1 + 32) plusButton];
  [v2 setBackgroundBlurRadiusLightMode:-1.0];

  id v3 = [*(id *)(a1 + 32) plusButton];
  [v3 setBackgroundBlurRadiusDarkMode:-1.0];
}

void __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_10(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) plusButton];
  [v2 setAlpha:v1];
}

uint64_t __107__CKSendMenuPresentationPopoverView__animationForDismissingContentView_finalBounds_finalCenter_finalAlpha___block_invoke_11(uint64_t a1)
{
  double v2 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  if (v2 <= 40.0) {
    double v3 = v2;
  }
  else {
    double v3 = 40.0;
  }
  double v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 entryViewPlusButtonDefaultBackgroundColor];
  v6 = [*(id *)(a1 + 32) backdropView];
  [v6 setBackgroundColor:v5];

  v7 = [*(id *)(a1 + 32) backdropView];
  double v8 = [v7 layer];
  [v8 setCornerRadius:v3];

  [*(id *)(a1 + 40) setAlpha:0.0];
  double v9 = *(double *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  double v11 = *(double *)(a1 + 64);
  double v12 = *(double *)(a1 + 72);
  id v13 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);

  double v14 = [*(id *)(a1 + 32) blurBackgroundView];
  [v14 setEffect:0];

  double v15 = [*(id *)(a1 + 32) blurBackgroundView];
  v16 = [v15 layer];
  [v16 setMasksToBounds:1];

  id v17 = [*(id *)(a1 + 32) blurBackgroundView];
  v18 = [v17 layer];
  [v18 setCornerRadius:v3];

  id v19 = [*(id *)(a1 + 32) blurBackgroundView];
  [v19 setClipsToBounds:1];

  double v20 = *(double *)(a1 + 80);
  id v21 = [*(id *)(a1 + 32) blurBackgroundView];
  [v21 setAlpha:v20];

  double v22 = *(double *)(a1 + 80);
  v23 = [*(id *)(a1 + 32) backdropView];
  [v23 setAlpha:v22];

  CGFloat v24 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  CGFloat v25 = CGRectGetWidth(*(CGRect *)(a1 + 48)) * 0.5;
  v26 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v26, "setCenter:", v24, v25);

  double v27 = *(double *)(a1 + 48);
  double v28 = *(double *)(a1 + 56);
  double v29 = *(double *)(a1 + 64);
  double v30 = *(double *)(a1 + 72);
  v31 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v31, "setBounds:", v27, v28, v29, v30);

  v32 = [*(id *)(a1 + 32) backdropView];
  v33 = [v32 layer];
  [v33 setCornerRadius:v3];

  v34 = *(void **)(a1 + 40);

  return [v34 setUserInteractionEnabled:1];
}

- (id)animationForPresentingInitialViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  v77[11] = *MEMORY[0x1E4F143B8];
  double v11 = +[CKUIBehavior sharedBehaviors];
  sendMenuView = self->_sendMenuView;
  if (!sendMenuView) {
    sendMenuView = self->_appView;
  }
  id v13 = sendMenuView;
  v35 = (void *)[v11 newSendMenuPresentPopoverWidthAnimator];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke;
  v71[3] = &unk_1E56285E8;
  CGFloat v73 = v9;
  CGFloat v74 = v8;
  CGFloat v75 = width;
  CGFloat v76 = height;
  v71[4] = self;
  double v14 = v13;
  id v72 = v14;
  [v35 addAnimations:v71 delayFactor:0.025];
  v34 = (void *)[v11 newSendMenuPresentPopoverHeightAnimator];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_2;
  v65[3] = &unk_1E56285E8;
  v65[4] = self;
  CGFloat v67 = v9;
  CGFloat v68 = v8;
  CGFloat v69 = width;
  CGFloat v70 = height;
  double v15 = v14;
  CGFloat v66 = v15;
  [v34 addAnimations:v65];
  v16 = (void *)[v11 newSendMenuPresentPopoverCenterXAnimator];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_3;
  v57[3] = &unk_1E56285C0;
  v57[4] = self;
  CGFloat v59 = x;
  CGFloat v60 = y;
  CGFloat v61 = v9;
  CGFloat v62 = v8;
  CGFloat v63 = width;
  CGFloat v64 = height;
  id v17 = v15;
  CGFloat v58 = v17;
  [v16 addAnimations:v57 delayFactor:0.025];
  v33 = (void *)[v11 newSendMenuPresentPopoverCenterYAnimator];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_4;
  v49[3] = &unk_1E56285C0;
  v49[4] = self;
  CGFloat v51 = x;
  CGFloat v52 = y;
  CGFloat v53 = v9;
  CGFloat v54 = v8;
  CGFloat v55 = width;
  CGFloat v56 = height;
  v18 = v17;
  v50 = v18;
  [v33 addAnimations:v49];
  v32 = (void *)[v11 newSendMenuPresentPopoverPlusCenterXAnimator];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_5;
  v48[3] = &unk_1E5621968;
  *(CGFloat *)&v48[5] = v9;
  *(CGFloat *)&v48[6] = v8;
  *(CGFloat *)&v48[7] = width;
  *(CGFloat *)&v48[8] = height;
  v48[4] = self;
  [v32 addAnimations:v48 delayFactor:0.025];
  id v19 = (void *)[v11 newSendMenuPresentPopoverPlusCenterYAnimator];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_6;
  v47[3] = &unk_1E5621968;
  *(CGFloat *)&v47[5] = v9;
  *(CGFloat *)&v47[6] = v8;
  *(CGFloat *)&v47[7] = width;
  *(CGFloat *)&v47[8] = height;
  v47[4] = self;
  double v20 = v19;
  [v19 addAnimations:v47];
  id v21 = (void *)[v11 newSendMenuPresentPopoverPlusIconScaleXAnimator];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_7;
  v46[3] = &unk_1E5620C40;
  v46[4] = self;
  double v22 = v21;
  [v21 addAnimations:v46 delayFactor:0.025];
  double v29 = (void *)[v11 newSendMenuPresentPopoverPlusIconScaleYAnimator];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_8;
  v45[3] = &unk_1E5620C40;
  v45[4] = self;
  [v29 addAnimations:v45];
  v23 = (void *)[v11 newSendMenuPresentPopoverPlusIconBlurRadiusAnimator];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_9;
  v44[3] = &unk_1E5620C40;
  v44[4] = self;
  [v23 addAnimations:v44];
  CGFloat v24 = (void *)[v11 newSendMenuPresentPopoverPlusIconOpacityAnimator];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_10;
  v43[3] = &unk_1E5620C40;
  v43[4] = self;
  [v24 addAnimations:v43];
  CGFloat v25 = (void *)[v11 newSendMenuPresentPopoverAnimator];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_11;
  v36[3] = &unk_1E5625070;
  CGFloat v39 = v9;
  CGFloat v40 = v8;
  CGFloat v41 = width;
  CGFloat v42 = height;
  v36[4] = self;
  id v37 = v11;
  v38 = v18;
  v31 = v18;
  id v30 = v11;
  [v25 addAnimations:v36];
  v77[0] = v34;
  v77[1] = v35;
  v77[2] = v16;
  v77[3] = v33;
  v77[4] = v25;
  v77[5] = v32;
  v77[6] = v20;
  v77[7] = v22;
  v77[8] = v29;
  v77[9] = v24;
  v77[10] = v23;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:11];
  double v28 = [[CKSendMenuPopoverAnimation alloc] initWithAnimators:v26];

  return v28;
}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke(uint64_t a1)
{
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  double v3 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  double v4 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v4, "ck_setBoundsWidth:", Width);

  v5 = *(void **)(a1 + 40);

  return objc_msgSend(v5, "ck_setScaleX:", 1.0);
}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:", *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 72);
  double v3 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v3, "ck_setBoundsHeight:", v2);

  double v4 = *(double *)(a1 + 72);
  v5 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v5, "ck_setBoundsHeight:", v4);

  v6 = *(void **)(a1 + 40);

  return objc_msgSend(v6, "ck_setScaleY:", 1.0);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 48));
  CGFloat v2 = CGRectGetWidth(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "ck_setPositionX:", v2);
  double v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setPositionX:", v2);

  id v4 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v4, "ck_setPositionX:", v2);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 56));
  CGFloat v2 = CGRectGetHeight(*(CGRect *)(a1 + 64)) * 0.5;
  objc_msgSend(*(id *)(a1 + 40), "ck_setPositionY:", v2);
  double v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setPositionY:", v2);

  id v4 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v4, "ck_setPositionY:", v2);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_5(uint64_t a1)
{
  CGFloat v2 = CGRectGetWidth(*(CGRect *)(a1 + 40)) * 0.5;
  id v3 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v3, "ck_setPositionX:", v2);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_6(uint64_t a1)
{
  CGFloat v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  id v3 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v3, "ck_setPositionY:", v2);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_7(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v1, "ck_setScaleX:", 8.1);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) plusButton];
  objc_msgSend(v1, "ck_setScaleY:", 16.6);
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_9(uint64_t a1)
{
  CGFloat v2 = [*(id *)(a1 + 32) plusButton];
  [v2 setBackgroundBlurRadiusLightMode:4.0];

  id v3 = [*(id *)(a1 + 32) plusButton];
  [v3 setBackgroundBlurRadiusDarkMode:4.0];
}

void __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_10(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) plusButton];
  [v1 setAlpha:0.0];
}

uint64_t __98__CKSendMenuPresentationPopoverView_animationForPresentingInitialViewWithFinalBounds_finalCenter___block_invoke_11(uint64_t a1)
{
  double v2 = CGRectGetWidth(*(CGRect *)(a1 + 56)) * 0.5;
  if (v2 <= 40.0) {
    double v3 = v2;
  }
  else {
    double v3 = 40.0;
  }
  id v4 = [*(id *)(a1 + 40) sendMenuPresentPopoverBackdropViewBackgroundColor];
  v5 = [*(id *)(a1 + 32) backdropView];
  [v5 setBackgroundColor:v4];

  v6 = [*(id *)(a1 + 32) backdropView];
  v7 = [v6 layer];
  [v7 setCornerRadius:v3];

  [*(id *)(a1 + 48) setAlpha:1.0];
  [*(id *)(a1 + 48) setUserInteractionEnabled:1];
  CGFloat v8 = [*(id *)(a1 + 40) sendMenuPresentPopoverEffect];
  CGFloat v9 = [*(id *)(a1 + 32) blurBackgroundView];
  [v9 setEffect:v8];

  double v10 = [*(id *)(a1 + 32) blurBackgroundView];
  double v11 = [v10 layer];
  [v11 setMasksToBounds:1];

  double v12 = [*(id *)(a1 + 32) blurBackgroundView];
  id v13 = [v12 layer];
  [v13 setCornerRadius:v3];

  double v14 = [*(id *)(a1 + 32) blurBackgroundView];
  [v14 setClipsToBounds:1];

  double v15 = *(void **)(a1 + 32);

  return [v15 setNeedsLayout];
}

- (id)animationForTransitioningToAppViewWithFinalBounds:(CGRect)a3 finalCenter:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v7 = a3.origin.y;
  CGFloat v8 = a3.origin.x;
  v34[5] = *MEMORY[0x1E4F143B8];
  double v10 = +[CKUIBehavior sharedBehaviors];
  v36.origin.CGFloat x = v8;
  v36.origin.CGFloat y = v7;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v36);
  double v12 = [(CKSendMenuPresentationPopoverView *)self sendMenuView];
  [v12 bounds];
  double v13 = v11 / CGRectGetWidth(v37);

  v38.origin.CGFloat x = v8;
  v38.origin.CGFloat y = v7;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v38);
  double v15 = [(CKSendMenuPresentationPopoverView *)self sendMenuView];
  [v15 bounds];
  double v16 = v14 / CGRectGetHeight(v39);

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke;
  v33[3] = &unk_1E5621968;
  v33[4] = self;
  *(CGFloat *)&v33[5] = v8;
  *(CGFloat *)&v33[6] = v7;
  *(CGFloat *)&v33[7] = width;
  *(CGFloat *)&v33[8] = height;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v33];
  id v17 = (void *)[v10 newSendMenuPresentAppInPopoverWidthAnimator];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_2;
  v32[3] = &unk_1E5628610;
  *(CGFloat *)&v32[5] = v8;
  *(CGFloat *)&v32[6] = v7;
  *(CGFloat *)&v32[7] = width;
  *(CGFloat *)&v32[8] = height;
  v32[4] = self;
  *(double *)&v32[9] = v13;
  [v17 addAnimations:v32 delayFactor:0.0];
  v18 = (void *)[v10 newSendMenuPresentAppInPopoverHeightAnimator];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_3;
  v31[3] = &unk_1E5628610;
  *(CGFloat *)&v31[5] = v8;
  *(CGFloat *)&v31[6] = v7;
  *(CGFloat *)&v31[7] = width;
  *(CGFloat *)&v31[8] = height;
  v31[4] = self;
  *(double *)&v31[9] = v16;
  [v18 addAnimations:v31];
  id v19 = (void *)[v10 newSendMenuPresentAppInPopoverCenterXAnimator];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_4;
  v30[3] = &unk_1E5621D50;
  v30[4] = self;
  *(CGFloat *)&v30[5] = x;
  *(CGFloat *)&v30[6] = y;
  *(CGFloat *)&v30[7] = v8;
  *(CGFloat *)&v30[8] = v7;
  *(CGFloat *)&v30[9] = width;
  *(CGFloat *)&v30[10] = height;
  [v19 addAnimations:v30 delayFactor:0.0];
  double v20 = (void *)[v10 newSendMenuPresentAppInPopoverOpacityAnimator];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_5;
  v29[3] = &unk_1E5621D50;
  *(CGFloat *)&v29[5] = v8;
  *(CGFloat *)&v29[6] = v7;
  *(CGFloat *)&v29[7] = width;
  *(CGFloat *)&v29[8] = height;
  v29[4] = self;
  *(CGFloat *)&v29[9] = x;
  *(CGFloat *)&v29[10] = y;
  [v20 addAnimations:v29];
  id v21 = (void *)[v10 newSendMenuPresentAppInPopoverOpacityAnimator];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_6;
  v27[3] = &unk_1E5620AF8;
  v27[4] = self;
  id v28 = v10;
  id v22 = v10;
  [v21 addAnimations:v27];
  v34[0] = v18;
  v34[1] = v17;
  v34[2] = v19;
  v34[3] = v20;
  v34[4] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  CGFloat v24 = [[CKSendMenuPopoverAnimation alloc] initWithAnimators:v23];

  return v24;
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  v6 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v6, "setBounds:", v2, v3, v4, v5);

  CGFloat v7 = [*(id *)(a1 + 32) sendMenuView];
  [v7 center];
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v12, "setCenter:", v9, v11);

  double v13 = [*(id *)(a1 + 32) appView];
  [v13 setNeedsLayout];

  double v14 = [*(id *)(a1 + 32) appView];
  [v14 layoutIfNeeded];

  double v15 = [*(id *)(a1 + 32) appView];
  [v15 setAlpha:0.0];

  [*(id *)(a1 + 32) bounds];
  double Width = CGRectGetWidth(v25);
  id v17 = [*(id *)(a1 + 32) appView];
  [v17 bounds];
  double v18 = Width / CGRectGetWidth(v26);

  [*(id *)(a1 + 32) bounds];
  double Height = CGRectGetHeight(v27);
  double v20 = [*(id *)(a1 + 32) appView];
  [v20 bounds];
  double v21 = Height / CGRectGetHeight(v28);

  id v22 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v22, "ck_setScaleX:", v18);

  id v23 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v23, "ck_setScaleY:", v21);
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_2(uint64_t a1)
{
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsWidth:");
  double v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setBoundsWidth:", Width);

  double v4 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v4, "ck_setScaleX:", 1.0);

  double v5 = *(double *)(a1 + 72);
  v6 = [*(id *)(a1 + 32) sendMenuView];
  objc_msgSend(v6, "ck_setScaleX:", v5);

  double v7 = CGRectGetWidth(*(CGRect *)(a1 + 40));
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  id v9 = [*(id *)(a1 + 32) blurBackgroundView];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v7, Height);
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_3(uint64_t a1)
{
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "ck_setBoundsHeight:");
  double v3 = *(double *)(a1 + 72);
  double v4 = [*(id *)(a1 + 32) sendMenuView];
  objc_msgSend(v4, "ck_setScaleY:", v3);

  double v5 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v5, "ck_setScaleY:", 1.0);

  id v6 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v6, "ck_setBoundsHeight:", Height);
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionX:", *(double *)(a1 + 40));
  CGFloat v2 = CGRectGetWidth(*(CGRect *)(a1 + 56)) * 0.5;
  double v3 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v3, "ck_setPositionX:", v2);

  double v4 = [*(id *)(a1 + 32) sendMenuView];
  objc_msgSend(v4, "ck_setPositionX:", v2);

  id v5 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v5, "ck_setPositionX:", v2);
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_5(uint64_t a1)
{
  CGFloat v2 = CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "ck_setPositionY:", *(double *)(a1 + 80));
  double v3 = [*(id *)(a1 + 32) backdropView];
  objc_msgSend(v3, "ck_setPositionY:", v2);

  double v4 = [*(id *)(a1 + 32) sendMenuView];
  objc_msgSend(v4, "ck_setPositionY:", v2);

  id v5 = [*(id *)(a1 + 32) appView];
  objc_msgSend(v5, "ck_setPositionY:", v2);
}

void __99__CKSendMenuPresentationPopoverView_animationForTransitioningToAppViewWithFinalBounds_finalCenter___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 40) sendMenuPopoverPresentingAppCornerRadius];
  double v3 = v2;
  double v4 = [*(id *)(a1 + 32) backdropView];
  id v5 = [v4 layer];
  [v5 setCornerRadius:v3];

  [*(id *)(a1 + 40) sendMenuPopoverPresentingAppCornerRadius];
  double v7 = v6;
  double v8 = [*(id *)(a1 + 32) blurBackgroundView];
  id v9 = [v8 layer];
  [v9 setCornerRadius:v7];

  double v10 = [*(id *)(a1 + 32) appView];
  [v10 setAlpha:1.0];

  id v11 = [*(id *)(a1 + 32) sendMenuView];
  [v11 setAlpha:0.0];
}

- (id)animationForTransitioningToNewSize:(CGSize)a3 center:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = (void *)[v9 newSendMenuPresentAppInPopoverOpacityAnimator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CKSendMenuPresentationPopoverView_animationForTransitioningToNewSize_center___block_invoke;
  v14[3] = &unk_1E5621968;
  v14[4] = self;
  *(CGFloat *)&v14[5] = width;
  *(CGFloat *)&v14[6] = height;
  *(CGFloat *)&v14[7] = x;
  *(CGFloat *)&v14[8] = y;
  [v10 addAnimations:v14];
  v15[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  double v12 = [[CKSendMenuPopoverAnimation alloc] initWithAnimators:v11];

  return v12;
}

uint64_t __79__CKSendMenuPresentationPopoverView_animationForTransitioningToNewSize_center___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "setCenter:", v2, v3);
}

- (void)prepareForPresentation
{
  sendMenuView = self->_sendMenuView;
  if (!sendMenuView) {
    sendMenuView = self->_appView;
  }
  double v4 = sendMenuView;
  [(UIView *)v4 bounds];
  double v6 = v5;
  double v8 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  id v9 = objc_opt_class();
  [(CKSendMenuPresentationPopoverView *)self bounds];
  if (v9)
  {
    objc_msgSend(v9, "affineTransformToDownScaleSize:toSize:", v10, v11, v6, v8);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
  }
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  [(UIView *)v4 setTransform:v26];
  [(CKSendMenuPresentationPopoverView *)self bounds];
  double v13 = v12 * 0.5;
  [(CKSendMenuPresentationPopoverView *)self bounds];
  -[UIView setCenter:](v4, "setCenter:", v13, v14 * 0.5);

  [(CKSendMenuPresentationPopoverView *)self bounds];
  CGFloat v15 = CGRectGetWidth(v30) * 0.5;
  double v16 = [(CKSendMenuPresentationPopoverView *)self backdropView];
  id v17 = [v16 layer];
  [v17 setCornerRadius:v15];

  double v18 = [(CKSendMenuPresentationPopoverView *)self plusButton];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v25[0] = *MEMORY[0x1E4F1DAB8];
  v25[1] = v19;
  v25[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v18 setTransform:v25];

  double v20 = +[CKUIBehavior sharedBehaviors];
  double v21 = [v20 entryViewPlusButtonDefaultBackgroundColor];
  id v22 = [(CKSendMenuPresentationPopoverView *)self backdropView];
  [v22 setBackgroundColor:v21];

  id v23 = [(CKSendMenuPresentationPopoverView *)self backdropView];
  [v23 setHidden:0];

  CGFloat v24 = [(CKSendMenuPresentationPopoverView *)self backdropView];
  [v24 setAlpha:1.0];
}

+ (CGAffineTransform)affineTransformToDownScaleSize:(SEL)a3 toSize:(CGSize)a4
{
  double v5 = a4.width / a5.width;
  double v6 = a4.height / a5.height;
  if (v5 >= v6) {
    double v5 = v6;
  }
  return CGAffineTransformMakeScale(retstr, v5, v5);
}

- (UIView)sendMenuView
{
  return self->_sendMenuView;
}

- (UIVisualEffectView)blurBackgroundView
{
  return self->_blurBackgroundView;
}

- (void)setBlurBackgroundView:(id)a3
{
}

- (CKSendMenuPresentationPopoverBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (CKSendMenuPopoverBlurContentsView)blurContentsView
{
  return self->_blurContentsView;
}

- (CKEntryViewPlusButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_blurContentsView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_blurBackgroundView, 0);
  objc_storeStrong((id *)&self->_sendMenuView, 0);

  objc_storeStrong((id *)&self->_appView, 0);
}

@end