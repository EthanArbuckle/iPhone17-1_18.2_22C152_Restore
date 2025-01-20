@interface CAMBottomBar
+ (BOOL)shouldUseSafeAreaInsetForLayoutStyle:(int64_t)a3 traitCollection:(id)a4;
+ (BOOL)wantsVerticalBarForLayoutStyle:(int64_t)a3;
+ (CGRect)shutterButtonAlignmentRectInBounds:(CGRect)a3 forLayoutStyle:(int64_t)a4 traitCollection:(id)a5 safeAreaInsets:(UIEdgeInsets)a6;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAMBottomBar)initWithCoder:(id)a3;
- (CAMBottomBar)initWithFrame:(CGRect)a3;
- (CAMBottomBar)initWithLayoutStyle:(int64_t)a3;
- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate;
- (CAMCreativeCameraButton)creativeCameraButton;
- (CAMExpandableMenuButton)_expandedMenuButton;
- (CAMFlashButton)flashButton;
- (CAMFlipButton)flipButton;
- (CAMHDRButton)HDRButton;
- (CAMImageAnalysisButton)imageAnalysisButton;
- (CAMImageWell)imageWell;
- (CAMLivePhotoButton)livePhotoButton;
- (CAMModeDial)modeDial;
- (CAMSharedLibraryButton)sharedLibraryButton;
- (CAMTimerButton)timerButton;
- (CAMUtilityBar)utilityBar;
- (CEKApertureButton)apertureButton;
- (CGRect)collapsedFrameForMenuButton:(id)a3;
- (CGRect)expandedFrameForMenuButton:(id)a3;
- (CUShutterButton)shutterButton;
- (CUShutterButton)stillDuringVideoButton;
- (PUReviewScreenDoneButton)doneButton;
- (UIButton)reviewButton;
- (UIView)backgroundView;
- (UIView)imageAnalysisButtonBackgroundOverlay;
- (double)_opacityForBackgroundStyle:(int64_t)a3;
- (double)utilityBarExtensionDistance;
- (id)_currentMenuButtons;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)touchingRecognizersToCancel;
- (int64_t)backgroundStyle;
- (int64_t)layoutStyle;
- (void)_commonCAMBottomBarInitializationInitWithLayoutStyle:(int64_t)a3;
- (void)_ensureSubviewOrdering;
- (void)_iterateViewsInHUDManager:(id)a3 forHUDItem:(id)a4;
- (void)_layoutCreativeCameraButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutDoneButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutImageWellForLayoutStyle:(int64_t)a3;
- (void)_layoutMenuButtons:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7;
- (void)_layoutModeDialForLayoutStyle:(int64_t)a3;
- (void)_layoutReviewButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutStillDuringVideoButtonForLayoutStyle:(int64_t)a3;
- (void)_layoutUtilityBarForLayoutStyle:(int64_t)a3;
- (void)_setExpandedMenuButton:(id)a3;
- (void)_updateControlVisibilityAnimated:(BOOL)a3;
- (void)_updateCreativeCameraButtonTappableEdgeInsets;
- (void)_updateFlipButtonTappableEdgeInsets;
- (void)_updateImageWellTappableEdgeInsets;
- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4;
- (void)expandMenuButton:(id)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setApertureButton:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setCreativeCameraButton:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setFlashButton:(id)a3;
- (void)setFlipButton:(id)a3;
- (void)setHDRButton:(id)a3;
- (void)setImageAnalysisButton:(id)a3;
- (void)setImageAnalysisButtonBackgroundOverlay:(id)a3;
- (void)setImageWell:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLivePhotoButton:(id)a3;
- (void)setModeDial:(id)a3;
- (void)setReviewButton:(id)a3;
- (void)setSharedLibraryButton:(id)a3;
- (void)setShutterButton:(id)a3;
- (void)setStillDuringVideoButton:(id)a3;
- (void)setTimerButton:(id)a3;
- (void)setUtilityBar:(id)a3;
- (void)setUtilityBarExtensionDistance:(double)a3;
- (void)setVisibilityUpdateDelegate:(id)a3;
@end

@implementation CAMBottomBar

- (CAMBottomBar)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMBottomBar;
  v4 = -[CAMBottomBar initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMBottomBar *)v4 _commonCAMBottomBarInitializationInitWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMBottomBarInitializationInitWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  [(UIView *)self->_backgroundView setAutoresizingMask:18];
  [(UIView *)self->_backgroundView setUserInteractionEnabled:0];
  v7 = self->_backgroundView;
  [(CAMBottomBar *)self addSubview:v7];
}

- (void)setShutterButton:(id)a3
{
  v5 = (CUShutterButton *)a3;
  shutterButton = self->_shutterButton;
  if (shutterButton != v5)
  {
    v7 = v5;
    [(CUShutterButton *)shutterButton removeFromSuperview];
    objc_storeStrong((id *)&self->_shutterButton, a3);
    shutterButton = (CUShutterButton *)[(CAMBottomBar *)self addSubview:self->_shutterButton];
    v5 = v7;
  }
  MEMORY[0x270F9A758](shutterButton, v5);
}

+ (BOOL)wantsVerticalBarForLayoutStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)setFlipButton:(id)a3
{
  v5 = (CAMFlipButton *)a3;
  flipButton = self->_flipButton;
  v7 = v5;
  if (flipButton != v5)
  {
    [(CAMFlipButton *)flipButton removeFromSuperview];
    objc_storeStrong((id *)&self->_flipButton, a3);
    [(CAMBottomBar *)self _updateFlipButtonTappableEdgeInsets];
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)_updateFlipButtonTappableEdgeInsets
{
  double v3 = 5.0;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")) & 1) == 0)
  {
    [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    double v3 = 11.0;
  }
  id v4 = [(CAMBottomBar *)self flipButton];
  objc_msgSend(v4, "setTappableEdgeInsets:", v3, 11.0, v3, 11.0);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setModeDial:(id)a3
{
  v5 = (CAMModeDial *)a3;
  modeDial = self->_modeDial;
  v7 = v5;
  if (modeDial != v5)
  {
    [(CAMModeDial *)modeDial removeFromSuperview];
    objc_storeStrong((id *)&self->_modeDial, a3);
    [(CAMBottomBar *)self addSubview:v7];
    [(CAMBottomBar *)self _ensureSubviewOrdering];
  }
}

- (void)_ensureSubviewOrdering
{
  id v3 = [(CAMBottomBar *)self utilityBar];
  [(CAMBottomBar *)self bringSubviewToFront:v3];
}

- (CAMUtilityBar)utilityBar
{
  return self->_utilityBar;
}

- (void)setImageWell:(id)a3
{
  v5 = (CAMImageWell *)a3;
  imageWell = self->_imageWell;
  v7 = v5;
  if (imageWell != v5)
  {
    [(CAMImageWell *)imageWell removeFromSuperview];
    objc_storeStrong((id *)&self->_imageWell, a3);
    [(CAMBottomBar *)self _updateImageWellTappableEdgeInsets];
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)_updateImageWellTappableEdgeInsets
{
  double v3 = 11.0;
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")))
  {
    double v4 = 5.0;
    double v5 = 11.0;
    double v3 = 5.0;
    double v6 = 11.0;
  }
  else
  {
    int v7 = [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    double v4 = 0.0;
    if (v7) {
      double v5 = 15.0;
    }
    else {
      double v5 = 0.0;
    }
    if (v7) {
      double v6 = 0.0;
    }
    else {
      double v6 = 15.0;
    }
  }
  id v8 = [(CAMBottomBar *)self imageWell];
  objc_msgSend(v8, "setTappableEdgeInsets:", v4, v6, v3, v5);
}

- (CAMImageWell)imageWell
{
  return self->_imageWell;
}

- (void)setFlashButton:(id)a3
{
  double v5 = (CAMFlashButton *)a3;
  p_flashButton = &self->_flashButton;
  flashButton = self->_flashButton;
  id v8 = v5;
  if (flashButton != v5)
  {
    [(CAMExpandableMenuButton *)flashButton setExpandableMenuDelegate:0];
    [(CAMFlashButton *)*p_flashButton removeFromSuperview];
    objc_storeStrong((id *)&self->_flashButton, a3);
    [(CAMExpandableMenuButton *)*p_flashButton setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_flashButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    [(CAMBottomBar *)self addSubview:v8];
  }
}

- (void)setTimerButton:(id)a3
{
  double v5 = (CAMTimerButton *)a3;
  p_timerButton = &self->_timerButton;
  timerButton = self->_timerButton;
  id v8 = v5;
  if (timerButton != v5)
  {
    [(CAMExpandableMenuButton *)timerButton setExpandableMenuDelegate:0];
    [(CAMTimerButton *)*p_timerButton removeFromSuperview];
    objc_storeStrong((id *)&self->_timerButton, a3);
    [(CAMExpandableMenuButton *)*p_timerButton setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_timerButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    [(CAMBottomBar *)self addSubview:v8];
  }
}

- (void)setHDRButton:(id)a3
{
  double v5 = (CAMHDRButton *)a3;
  p_HDRButton = &self->_HDRButton;
  HDRButton = self->_HDRButton;
  id v8 = v5;
  if (HDRButton != v5)
  {
    [(CAMExpandableMenuButton *)HDRButton setExpandableMenuDelegate:0];
    [(CAMHDRButton *)*p_HDRButton removeFromSuperview];
    objc_storeStrong((id *)&self->_HDRButton, a3);
    [(CAMExpandableMenuButton *)*p_HDRButton setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_HDRButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    [(CAMBottomBar *)self addSubview:v8];
  }
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      [(CAMBottomBar *)self layoutIfNeeded];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __44__CAMBottomBar_setBackgroundStyle_animated___block_invoke;
      v5[3] = &unk_263FA0208;
      v5[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v5 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      [(CAMBottomBar *)self setNeedsLayout];
    }
  }
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)layoutSubviews
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)CAMBottomBar;
  [(CAMBottomBar *)&v44 layoutSubviews];
  [(CAMBottomBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMBottomBar *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  [(CAMBottomBar *)self _opacityForBackgroundStyle:[(CAMBottomBar *)self backgroundStyle]];
  v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:v12];
  [v11 setBackgroundColor:v13];

  int64_t v14 = [(CAMBottomBar *)self layoutStyle];
  [(CAMBottomBar *)self _layoutShutterButtonForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutStillDuringVideoButtonForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutImageWellForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutReviewButtonForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutCreativeCameraButtonForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutModeDialForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutFlipButtonForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutUtilityBarForLayoutStyle:v14];
  [(CAMBottomBar *)self _layoutDoneButtonForLayoutStyle:v14];
  v15 = [(CAMBottomBar *)self _currentMenuButtons];
  v16 = [(CAMBottomBar *)self _expandedMenuButton];
  [(CAMBottomBar *)self _layoutMenuButtons:v15 apply:1 withExpandedMenuButton:v16 collapsingMenuButton:0 collapsingFrame:0];

  v17 = +[CAMCaptureCapabilities capabilities];
  LODWORD(v16) = [v17 isFrontCameraOnRightEdge];

  int v18 = [(id)objc_opt_class() wantsVerticalBarForLayoutStyle:v14];
  v19 = [(CAMBottomBar *)self superview];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;

  if (v16)
  {
    if (v18)
    {
      if (v23 > v21)
      {
        v24 = [(CAMBottomBar *)self modeDial];

        if (v24)
        {
          v47.origin.x = v4;
          v47.origin.y = v6;
          v47.size.width = v8;
          v47.size.height = v10;
          double MaxY = CGRectGetMaxY(v47);
          v26 = [(CAMBottomBar *)self modeDial];
          [v26 frame];
          double v27 = MaxY - CGRectGetMaxY(v48);

          if (v27 >= 84.0)
          {
            v39 = v11;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            v28 = [(CAMBottomBar *)self subviews];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v41;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v41 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                  uint64_t v34 = [(CAMBottomBar *)self backgroundView];
                  if (v33 == (void *)v34)
                  {
                  }
                  else
                  {
                    v35 = (void *)v34;
                    uint64_t v36 = [(CAMBottomBar *)self reviewButton];
                    if (v33 == (void *)v36)
                    {
                    }
                    else
                    {
                      v37 = (void *)v36;
                      v38 = [(CAMBottomBar *)self doneButton];

                      if (v33 != v38)
                      {
                        [v33 center];
                        objc_msgSend(v33, "setCenter:");
                      }
                    }
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
              }
              while (v30);
            }

            v11 = v39;
          }
        }
      }
    }
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)_opacityForBackgroundStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 2) {
    double result = 1.0;
  }
  if (!a3) {
    return 0.3;
  }
  return result;
}

- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v41 = [(CAMBottomBar *)self shutterButton];
  v13 = objc_opt_class();
  int64_t v14 = [(CAMBottomBar *)self traitCollection];
  [(CAMBottomBar *)self safeAreaInsets];
  objc_msgSend(v13, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", a3, v14, v6, v8, v10, v12, v15, v16, v17, v18);
  CGFloat v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  if ([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3])
  {
    v43.origin.x = v20;
    v43.origin.y = v22;
    v43.size.width = v24;
    v43.size.height = v26;
    double MinX = CGRectGetMinX(v43);
    if (MinX < 0.0) {
      double MinX = 0.0;
    }
    v44.size.height = v12;
    double v28 = 25.0;
    v44.size.width = v10;
    CGFloat v29 = v26;
    double v30 = v24;
    double v31 = v22;
    CGFloat v32 = v20;
    double v33 = fmin(MinX, 25.0);
    v44.origin.x = v6;
    v44.origin.y = v8;
    double Width = CGRectGetWidth(v44);
    double v35 = v32;
    v45.origin.x = v32;
    double v22 = v31;
    double v24 = v30;
    double v26 = v29;
    v45.origin.y = v22;
    v45.size.width = v24;
    v45.size.height = v29;
    double v36 = Width - CGRectGetMaxX(v45) + -10.0;
    if (v36 < 0.0) {
      double v36 = 0.0;
    }
    double v37 = fmin(v36, 25.0);
    double v38 = 25.0;
  }
  else
  {
    v46.origin.x = v6;
    v46.origin.y = v8;
    v46.size.width = v10;
    v46.size.height = v12;
    double Height = CGRectGetHeight(v46);
    double v35 = v20;
    v47.origin.x = v20;
    v47.origin.y = v22;
    v47.size.width = v24;
    v47.size.height = v26;
    double v40 = Height - CGRectGetMaxY(v47) + -5.0;
    double v28 = 0.0;
    if (v40 < 0.0) {
      double v40 = 0.0;
    }
    double v33 = 24.0;
    double v38 = fmin(v40, 24.0);
    double v37 = 24.0;
  }
  objc_msgSend(v41, "setTappableEdgeInsets:", v28, v33, v38, v37);
  objc_msgSend(v41, "frameForAlignmentRect:", v35, v22, v24, v26);
  objc_msgSend(v41, "setFrame:");
}

- (void)_layoutStillDuringVideoButtonForLayoutStyle:(int64_t)a3
{
  if (([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3] & 1) == 0)
  {
    id v30 = [(CAMBottomBar *)self stillDuringVideoButton];
    [v30 intrinsicContentSize];
    double v5 = v4;
    double v6 = [(CAMBottomBar *)self traitCollection];
    [v6 displayScale];
    UIRectIntegralWithScale();
    double v8 = v7;
    double v10 = v9;

    [(CAMBottomBar *)self bounds];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    double v19 = [(CAMBottomBar *)self shutterButton];
    [v19 frame];
    objc_msgSend(v19, "alignmentRectForFrame:");
    CGRectGetMidY(v32);
    UIRoundToViewScale();
    double v21 = v20;
    int v22 = [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    uint64_t v23 = v12;
    uint64_t v24 = v14;
    uint64_t v25 = v16;
    uint64_t v26 = v18;
    if (v22)
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v23) - v5;
      double v28 = -15.0;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v23);
      double v28 = 15.0;
    }
    double v29 = MinX + v28;
    objc_msgSend(v30, "setTappableEdgeInsets:", 20.0, 20.0, 20.0, 20.0);
    objc_msgSend(v30, "frameForAlignmentRect:", v29, v21, v8, v10);
    objc_msgSend(v30, "setFrame:");
  }
}

- (CUShutterButton)stillDuringVideoButton
{
  return self->_stillDuringVideoButton;
}

- (void)_layoutImageWellForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  CGFloat v30 = v5;
  CGFloat v31 = v6;
  CGFloat v8 = v7;
  double v10 = v9;
  id v32 = [(CAMBottomBar *)self shutterButton];
  [v32 frame];
  objc_msgSend(v32, "alignmentRectForFrame:");
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v19 = [(CAMBottomBar *)self imageWell];
  LODWORD(a3) = [(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3];
  [v19 intrinsicContentSize];
  double v21 = v20;
  double v23 = v22;
  if (a3)
  {
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    double v24 = CGRectGetMaxY(v34) + 30.0;
    v35.origin.x = v12;
    v35.origin.y = v14;
    v35.size.width = v16;
    v35.size.height = v18;
    CGRectGetMidX(v35);
    UIRoundToViewScale();
  }
  else
  {
    CGFloat rect = v10;
    v36.origin.x = v12;
    v36.origin.y = v14;
    v36.size.width = v16;
    v36.size.height = v18;
    CGRectGetMidY(v36);
    UIRoundToViewScale();
    double v24 = v26;
    if ([(CAMBottomBar *)self _shouldReverseLayoutDirection])
    {
      v37.origin.x = v30;
      v37.origin.y = v31;
      v37.size.width = v8;
      v37.size.height = rect;
      double MinX = CGRectGetMaxX(v37) - v21;
      double v28 = -15.0;
    }
    else
    {
      v38.origin.x = v30;
      v38.origin.y = v31;
      v38.size.width = v8;
      v38.size.height = rect;
      double MinX = CGRectGetMinX(v38);
      double v28 = 15.0;
    }
    double v25 = MinX + v28;
  }
  objc_msgSend(v19, "frameForAlignmentRect:", v25, v24, v21, v23, *(void *)&rect);
  objc_msgSend(v19, "setFrame:");
}

- (void)_layoutReviewButtonForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v49 = [(CAMBottomBar *)self reviewButton];
  if ([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3])
  {
    [v49 intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    double v14 = v13;
    CGFloat v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v51.origin.CGFloat x = v6;
    v51.origin.CGFloat y = v8;
    v51.size.CGFloat width = v10;
    v51.size.CGFloat height = v12;
    double MaxY = CGRectGetMaxY(v51);
    v52.origin.CGFloat x = v14;
    v52.origin.CGFloat y = v16;
    v52.size.CGFloat width = v18;
    v52.size.CGFloat height = v20;
    objc_msgSend(v49, "frameForAlignmentRect:", v14, MaxY - CGRectGetHeight(v52) + -31.0, v18, v20, 0);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    int v30 = [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    [v49 intrinsicContentSize];
    CGFloat v48 = v12;
    double v32 = v31;
    double v33 = [(CAMBottomBar *)self shutterButton];
    [v33 frame];
    objc_msgSend(v33, "alignmentRectForFrame:");
    CGFloat x = v53.origin.x;
    CGFloat y = v53.origin.y;
    CGFloat width = v53.size.width;
    CGFloat height = v53.size.height;
    CGRectGetMidX(v53);
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v54);
    UIRectCenteredIntegralRectScale();
    double v39 = v55.size.width;
    double v40 = v55.size.height;
    CGRectGetHeight(v55);
    UIRoundToViewScale();
    double v42 = MidY - v41;
    double v43 = 15.0;
    if (v30)
    {
      v56.origin.CGFloat x = v6;
      v56.origin.CGFloat y = v8;
      v56.size.CGFloat width = v10;
      v56.size.CGFloat height = v48;
      double v43 = CGRectGetMaxX(v56) - v32 + -15.0;
    }
    objc_msgSend(v49, "frameForAlignmentRect:", v43, v42, v39, v40, 0);
    double v23 = v44;
    double v25 = v45;
    double v27 = v46;
    double v29 = v47;
  }
  objc_msgSend(v49, "setFrame:", v23, v25, v27, v29);
}

- (UIButton)reviewButton
{
  return self->_reviewButton;
}

- (void)_layoutCreativeCameraButtonForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  CGFloat v31 = v5;
  CGFloat v32 = v6;
  CGFloat v8 = v7;
  double v10 = v9;
  id v33 = [(CAMBottomBar *)self shutterButton];
  [v33 frame];
  objc_msgSend(v33, "alignmentRectForFrame:");
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  uint64_t v19 = CAMIsSmallPhone();
  double v20 = [(CAMBottomBar *)self creativeCameraButton];
  [v20 useCompactLayout:v19];
  LODWORD(a3) = [(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3];
  [v20 intrinsicContentSize];
  double v22 = v21;
  double v24 = v23;
  if (a3)
  {
    v35.origin.CGFloat x = v12;
    v35.origin.CGFloat y = v14;
    v35.size.CGFloat width = v16;
    v35.size.CGFloat height = v18;
    double v25 = CGRectGetMaxY(v35) + 30.0;
    v36.origin.CGFloat x = v12;
    v36.origin.CGFloat y = v14;
    v36.size.CGFloat width = v16;
    v36.size.CGFloat height = v18;
    CGRectGetMidX(v36);
    UIRoundToViewScale();
  }
  else
  {
    CGFloat rect = v10;
    v37.origin.CGFloat x = v12;
    v37.origin.CGFloat y = v14;
    v37.size.CGFloat width = v16;
    v37.size.CGFloat height = v18;
    CGRectGetMidY(v37);
    UIRoundToViewScale();
    double v25 = v27;
    if ([(CAMBottomBar *)self _shouldReverseLayoutDirection])
    {
      v38.origin.CGFloat x = v31;
      v38.origin.CGFloat y = v32;
      v38.size.CGFloat width = v8;
      v38.size.CGFloat height = rect;
      double MinX = CGRectGetMaxX(v38) - v22;
      double v29 = -20.0;
    }
    else
    {
      v39.origin.CGFloat x = v31;
      v39.origin.CGFloat y = v32;
      v39.size.CGFloat width = v8;
      v39.size.CGFloat height = rect;
      double MinX = CGRectGetMinX(v39);
      double v29 = 20.0;
    }
    double v26 = MinX + v29;
  }
  objc_msgSend(v20, "frameForAlignmentRect:", v26, v25, v22, v24, *(void *)&rect);
  objc_msgSend(v20, "setFrame:");
}

- (CAMCreativeCameraButton)creativeCameraButton
{
  return self->_creativeCameraButton;
}

- (void)_layoutModeDialForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat width = v52.size.width;
  CGFloat height = v52.size.height;
  CGFloat v48 = CGRectGetWidth(v52);
  id v50 = [(CAMBottomBar *)self shutterButton];
  [v50 frame];
  objc_msgSend(v50, "alignmentRectForFrame:");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v17 = [(CAMBottomBar *)self modeDial];
  if ([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3])
  {
    CGFloat v18 = [(CAMBottomBar *)self creativeCameraButton];
    CGFloat v47 = width;
    CGFloat v45 = x;
    CGFloat v46 = y;
    CGFloat v44 = v14;
    if (v18
      || ([(CAMBottomBar *)self imageWell], (CGFloat v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v19 = v18;
      double v20 = v19;
    }
    else
    {
      id v19 = [(CAMBottomBar *)self shutterButton];
      double v20 = 0;
    }
    [v19 frame];
    objc_msgSend(v19, "alignmentRectForFrame:");
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v49 = v25;
    CGFloat rect = v26;
    v53.origin.CGFloat x = v10;
    v53.origin.CGFloat y = v12;
    v53.size.CGFloat width = v14;
    v53.size.CGFloat height = v16;
    CGFloat v27 = v12;
    double v28 = CGRectGetWidth(v53);
    objc_msgSend(v17, "sizeThatFits:", v28, 190.0);
    if (v28 < v29) {
      double v28 = v29;
    }
    v54.origin.CGFloat x = v22;
    v54.origin.CGFloat y = v24;
    v54.size.CGFloat width = v49;
    v54.size.CGFloat height = rect;
    double v30 = CGRectGetMaxY(v54) + 30.0;
    v55.origin.CGFloat x = v10;
    v55.origin.CGFloat y = v27;
    v55.size.CGFloat width = v44;
    v55.size.CGFloat height = v16;
    CGRectGetMidX(v55);
    UIRoundToViewScale();
    double v32 = v31;
    v56.origin.CGFloat x = v45;
    v56.origin.CGFloat y = v46;
    v56.size.CGFloat width = v47;
    v56.size.CGFloat height = height;
    CGFloat v33 = CGRectGetMaxX(v56) + -10.0;
    v57.origin.CGFloat x = v32;
    v57.origin.CGFloat y = v30;
    v57.size.CGFloat width = v28;
    v57.size.CGFloat height = 190.0;
    if (v33 - CGRectGetMaxX(v57) < 0.0)
    {
      v58.origin.CGFloat x = v10;
      v58.size.CGFloat height = v16;
      v58.origin.CGFloat y = v27;
      v58.size.CGFloat width = v44;
      double v32 = CGRectGetMaxX(v58) - v28;
    }
    objc_msgSend(v17, "frameForAlignmentRect:", v32, v30, v28, 190.0, *(void *)&rect);
    double v35 = v34;
    double MinY = v36;
    double v39 = v38;
    double v41 = v40;
  }
  else
  {
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGFloat recta = CGRectGetMinX(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v60);
    v61.origin.CGFloat x = v10;
    v61.origin.CGFloat y = v12;
    v61.size.CGFloat width = v14;
    double v35 = recta;
    v61.size.CGFloat height = v16;
    double v41 = CGRectGetMinY(v61);
    double v39 = v48;
  }
  objc_msgSend(v17, "setFrame:", v35, MinY, v39, v41, *(void *)&recta);
}

- (CAMModeDial)modeDial
{
  return self->_modeDial;
}

- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3
{
  int v4 = [(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3];
  [(CAMBottomBar *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v35 = v9;
  uint64_t v36 = v10;
  id v37 = [(CAMBottomBar *)self shutterButton];
  [v37 frame];
  objc_msgSend(v37, "alignmentRectForFrame:");
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  id v19 = [(CAMBottomBar *)self flipButton];
  [v19 intrinsicContentSize];
  double v21 = v20;
  double v23 = v22;
  if (v4)
  {
    v39.origin.CGFloat x = v12;
    v39.origin.CGFloat y = v14;
    v39.size.CGFloat width = v16;
    v39.size.CGFloat height = v18;
    CGRectGetMidX(v39);
    UIRoundToViewScale();
    double v25 = v24;
    v40.origin.CGFloat x = v12;
    v40.origin.CGFloat y = v14;
    v40.size.CGFloat width = v16;
    v40.size.CGFloat height = v18;
    double v26 = CGRectGetMinY(v40) + -29.0 - v23;
  }
  else
  {
    v41.origin.CGFloat x = v12;
    v41.origin.CGFloat y = v14;
    v41.size.CGFloat width = v16;
    v41.size.CGFloat height = v18;
    CGRectGetMidY(v41);
    UIRoundToViewScale();
    double v26 = v27;
    int v28 = [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    uint64_t v29 = v6;
    uint64_t v30 = v8;
    uint64_t v31 = v35;
    uint64_t v32 = v36;
    if (v28)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v29);
      double v34 = 20.0;
    }
    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v29) - v21;
      double v34 = -20.0;
    }
    double v25 = MinX + v34;
  }
  objc_msgSend(v19, "frameForAlignmentRect:", v25, v26, v21, v23);
  objc_msgSend(v19, "setFrame:");
}

- (void)_layoutUtilityBarForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = objc_opt_class();
  int64_t v14 = [(CAMBottomBar *)self layoutStyle];
  double v15 = [(CAMBottomBar *)self traitCollection];
  [(CAMBottomBar *)self safeAreaInsets];
  objc_msgSend(v13, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", v14, v15, v6, v8, v10, v12, v16, v17, v18, v19);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;

  [(CAMBottomBar *)self utilityBarExtensionDistance];
  double v29 = v28;
  int v30 = [(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3];
  double v31 = -v29;
  uint64_t v32 = v21;
  uint64_t v33 = v23;
  uint64_t v34 = v25;
  uint64_t v35 = v27;
  if (v30)
  {
    double v10 = v29 + CGRectGetMinX(*(CGRect *)&v32);
    double v36 = -v29;
    double v31 = 0.0;
  }
  else
  {
    double v12 = v29 + CGRectGetMinY(*(CGRect *)&v32);
    double v36 = 0.0;
  }
  id v37 = [(CAMBottomBar *)self utilityBar];
  objc_msgSend(v37, "frameForAlignmentRect:", v36, v31, v10, v12);
  objc_msgSend(v37, "setFrame:");
}

- (void)_layoutDoneButtonForLayoutStyle:(int64_t)a3
{
  [(CAMBottomBar *)self bounds];
  id v5 = [(CAMBottomBar *)self doneButton];
  if ([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:a3])
  {
    CAMPixelWidthForView(self);
    [v5 intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    [v5 frameForAlignmentRect:0];
    objc_msgSend(v5, "setFrame:");
  }
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (id)_currentMenuButtons
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v4 = v3;
  if (self->_imageAnalysisButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_livePhotoButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_HDRButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_timerButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_flashButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sharedLibraryButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (CAMExpandableMenuButton)_expandedMenuButton
{
  return self->__expandedMenuButton;
}

- (void)_layoutMenuButtons:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  int64_t v15 = [(CAMBottomBar *)self layoutStyle];
  if ([(id)objc_opt_class() wantsVerticalBarForLayoutStyle:v15])
  {
    [(CAMBottomBar *)self bounds];
    -[CAMBottomBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v88 = 0;
    v89 = (double *)&v88;
    uint64_t v90 = 0x2020000000;
    uint64_t v91 = 0;
    uint64_t v24 = [(CAMBottomBar *)self flipButton];
    uint64_t v25 = v24;
    if (v24)
    {
      [v24 frame];
      objc_msgSend(v25, "alignmentRectForFrame:");
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      uint64_t v34 = +[CAMCaptureCapabilities capabilities];
      int v35 = [v34 overContentFlipButtonSupported];

      v92.origin.CGFloat x = v27;
      v92.origin.CGFloat y = v29;
      v92.size.CGFloat width = v31;
      v92.size.CGFloat height = v33;
      double MinY = CGRectGetMinY(v92);
      double v37 = 29.0;
      if (v35) {
        double v37 = 10.0;
      }
      double v38 = MinY - v37;
    }
    else
    {
      CGRect v39 = objc_opt_class();
      [(CAMBottomBar *)self bounds];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      CGFloat v48 = [(CAMBottomBar *)self traitCollection];
      [(CAMBottomBar *)self safeAreaInsets];
      objc_msgSend(v39, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", v15, v48, v41, v43, v45, v47, v49, v50, v51, v52);
      CGFloat v54 = v53;
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      CGFloat v60 = v59;

      v93.origin.CGFloat x = v54;
      v93.origin.CGFloat y = v56;
      v93.size.CGFloat width = v58;
      v93.size.CGFloat height = v60;
      double v38 = CGRectGetMinY(v93) + -30.0;
    }
    v89[3] = v38;
    uint64_t v74 = MEMORY[0x263EF8330];
    uint64_t v75 = 3221225472;
    v76 = __101__CAMBottomBar__layoutMenuButtons_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke;
    v77 = &unk_263FA06D0;
    uint64_t v82 = v17;
    uint64_t v83 = v19;
    uint64_t v84 = v21;
    uint64_t v85 = v23;
    id v78 = v14;
    v81 = &v88;
    id v79 = v13;
    v80 = self;
    v86 = a7;
    BOOL v87 = v10;
    [v12 enumerateObjectsWithOptions:2 usingBlock:&v74];
    CGRect v61 = [(CAMBottomBar *)self apertureButton];
    v62 = v61;
    if (v61)
    {
      [v61 intrinsicContentSize];
      UIRectCenteredIntegralRectScale();
      double v64 = v63;
      double v66 = v65;
      double v68 = v67;
      v69 = objc_msgSend(v12, "lastObject", 0, v74, v75, v76, v77, v78);
      [v69 frame];
      objc_msgSend(v69, "alignmentRectForFrame:");
      double MaxY = CGRectGetMaxY(v94);
      if (v10)
      {
        double v71 = MaxY;
        [v62 setExpansionDirection:2];
        objc_msgSend(v62, "frameForAlignmentRect:", v64, v71 + 10.0, v66, v68);
        objc_msgSend(v62, "setFrame:");
      }
    }
    v72 = [(CAMBottomBar *)self imageAnalysisButton];
    v73 = v72;
    if (v72 && v10)
    {
      [v72 frame];
      UIRectInset();
      objc_msgSend(v73, "setFrame:");
    }

    _Block_object_dispose(&v88, 8);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [(CAMBottomBar *)self _expandedMenuButton];
  double v9 = v8;
  if (v8 && ([v8 frame], v32.double x = x, v32.y = y, CGRectContainsPoint(v34, v32)))
  {
    BOOL v10 = v9;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CAMBottomBar;
    -[CAMBottomBar hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y);
    BOOL v10 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();
    if ([(CAMBottomBar *)self backgroundStyle] == 1 && v10 == self)
    {
      [(CAMBottomBar *)self subviews];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
LABEL_8:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            if ((objc_msgSend(v17, "isEnabled", (void)v24) & 1) == 0)
            {
              -[CAMBottomBar convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
              CGFloat v19 = v18;
              CGFloat v21 = v20;
              [v17 alpha];
              if (v22 > 0.0)
              {
                [v17 bounds];
                v33.double x = v19;
                v33.double y = v21;
                if (CGRectContainsPoint(v35, v33))
                {

                  if (v17) {
                    goto LABEL_21;
                  }
                  goto LABEL_20;
                }
              }
            }
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
            if (v13) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

LABEL_20:
      id v17 = 0;
      self = 0;
LABEL_21:

      BOOL v10 = self;
    }
  }

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v20.receiver = self;
  v20.super_class = (Class)CAMBottomBar;
  unsigned __int8 v7 = -[CAMBottomBar pointInside:withEvent:](&v20, sel_pointInside_withEvent_, a4);
  double v8 = [(CAMBottomBar *)self _expandedMenuButton];
  double v9 = v8;
  if (v8)
  {
    [v8 frame];
    v21.CGFloat x = x;
    v21.CGFloat y = y;
    BOOL v10 = CGRectContainsPoint(v24, v21);
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = [(CAMBottomBar *)self utilityBar];
  uint64_t v12 = v11;
  if (!v11 || ([v11 isHidden] & 1) != 0 || (objc_msgSend(v12, "alpha"), v13 <= 0.0))
  {
    BOOL v14 = 0;
  }
  else
  {
    [v12 frame];
    v22.CGFloat x = x;
    v22.CGFloat y = y;
    BOOL v14 = CGRectContainsPoint(v25, v22);
  }
  uint64_t v15 = [(CAMBottomBar *)self imageAnalysisButtonBackgroundOverlay];
  uint64_t v16 = (void *)v15;
  if (v15)
  {
    if (([(id)v15 isHidden] & 1) != 0 || (objc_msgSend(v16, "alpha"), v17 <= 0.0))
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      [v16 frame];
      v23.CGFloat x = x;
      v23.CGFloat y = y;
      LOBYTE(v15) = CGRectContainsPoint(v26, v23);
    }
  }
  if ((v7 | v10)) {
    char v18 = 1;
  }
  else {
    char v18 = v14 | v15;
  }

  return v18;
}

- (CAMBottomBar)initWithFrame:(CGRect)a3
{
  int v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMBottomBar *)self initWithLayoutStyle:v5];
}

- (CAMBottomBar)initWithCoder:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMBottomBar *)self initWithLayoutStyle:v5];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMBottomBar *)self _updateImageWellTappableEdgeInsets];
    [(CAMBottomBar *)self _updateFlipButtonTappableEdgeInsets];
    [(CAMBottomBar *)self _updateCreativeCameraButtonTappableEdgeInsets];
    [(CAMBottomBar *)self setNeedsLayout];
  }
}

- (void)setStillDuringVideoButton:(id)a3
{
  uint64_t v5 = (CUShutterButton *)a3;
  stillDuringVideoButton = self->_stillDuringVideoButton;
  if (stillDuringVideoButton != v5)
  {
    unsigned __int8 v7 = v5;
    [(CUShutterButton *)stillDuringVideoButton removeFromSuperview];
    objc_storeStrong((id *)&self->_stillDuringVideoButton, a3);
    stillDuringVideoButton = (CUShutterButton *)[(CAMBottomBar *)self addSubview:self->_stillDuringVideoButton];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](stillDuringVideoButton, v5);
}

- (void)setReviewButton:(id)a3
{
  uint64_t v5 = (UIButton *)a3;
  reviewButton = self->_reviewButton;
  unsigned __int8 v7 = v5;
  if (reviewButton != v5)
  {
    [(UIButton *)reviewButton removeFromSuperview];
    objc_storeStrong((id *)&self->_reviewButton, a3);
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)setCreativeCameraButton:(id)a3
{
  uint64_t v5 = (CAMCreativeCameraButton *)a3;
  creativeCameraButton = self->_creativeCameraButton;
  unsigned __int8 v7 = v5;
  if (creativeCameraButton != v5)
  {
    [(CAMCreativeCameraButton *)creativeCameraButton removeFromSuperview];
    objc_storeStrong((id *)&self->_creativeCameraButton, a3);
    [(CAMBottomBar *)self _updateCreativeCameraButtonTappableEdgeInsets];
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)setDoneButton:(id)a3
{
  uint64_t v5 = (PUReviewScreenDoneButton *)a3;
  doneButton = self->_doneButton;
  unsigned __int8 v7 = v5;
  if (doneButton != v5)
  {
    [(PUReviewScreenDoneButton *)doneButton removeFromSuperview];
    objc_storeStrong((id *)&self->_doneButton, a3);
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)_updateCreativeCameraButtonTappableEdgeInsets
{
  double v3 = 5.0;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")) & 1) == 0)
  {
    [(CAMBottomBar *)self _shouldReverseLayoutDirection];
    double v3 = 11.0;
  }
  id v4 = [(CAMBottomBar *)self creativeCameraButton];
  objc_msgSend(v4, "setTappableEdgeInsets:", v3, 11.0, v3, 11.0);
}

- (void)setLivePhotoButton:(id)a3
{
  uint64_t v5 = (CAMLivePhotoButton *)a3;
  livePhotoButton = self->_livePhotoButton;
  unsigned __int8 v7 = v5;
  if (livePhotoButton != v5)
  {
    [(CAMLivePhotoButton *)livePhotoButton removeFromSuperview];
    [(CAMExpandableMenuButton *)self->_livePhotoButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_livePhotoButton, a3);
    [(CAMExpandableMenuButton *)v7 setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v7, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)setSharedLibraryButton:(id)a3
{
  uint64_t v5 = (CAMSharedLibraryButton *)a3;
  sharedLibraryButton = self->_sharedLibraryButton;
  unsigned __int8 v7 = v5;
  if (sharedLibraryButton != v5)
  {
    [(CAMSharedLibraryButton *)sharedLibraryButton removeFromSuperview];
    [(CAMExpandableMenuButton *)self->_sharedLibraryButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_sharedLibraryButton, a3);
    [(CAMExpandableMenuButton *)v7 setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v7, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    [(CAMBottomBar *)self addSubview:v7];
  }
}

- (void)setApertureButton:(id)a3
{
  uint64_t v5 = (CEKApertureButton *)a3;
  p_apertureButton = &self->_apertureButton;
  apertureButton = self->_apertureButton;
  if (apertureButton != v5)
  {
    BOOL v10 = v5;
    double v8 = [(CEKApertureButton *)apertureButton superview];

    if (v8 == self) {
      [(CEKApertureButton *)*p_apertureButton removeFromSuperview];
    }
    double v9 = [(CEKApertureButton *)*p_apertureButton delegate];

    if (v9 == self) {
      [(CEKApertureButton *)*p_apertureButton setDelegate:0];
    }
    objc_storeStrong((id *)&self->_apertureButton, a3);
    [(CEKApertureButton *)v10 setDelegate:self];
    -[CEKApertureButton setTappableEdgeInsets:](v10, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    apertureButton = (CEKApertureButton *)[(CAMBottomBar *)self addSubview:v10];
    uint64_t v5 = v10;
  }
  MEMORY[0x270F9A758](apertureButton, v5);
}

- (void)setImageAnalysisButton:(id)a3
{
  uint64_t v5 = (CAMImageAnalysisButton *)a3;
  imageAnalysisButton = self->_imageAnalysisButton;
  if (imageAnalysisButton != v5)
  {
    double v9 = v5;
    unsigned __int8 v7 = [(CAMImageAnalysisButton *)imageAnalysisButton superview];

    if (v7 == self) {
      [(CAMImageAnalysisButton *)self->_imageAnalysisButton removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_imageAnalysisButton, a3);
    [(VKImageAnalysisButton *)v9 setBackgroundDiameter:44.0];
    double v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
    [(VKImageAnalysisButton *)v9 setCameraModeBackgroundColor:v8];

    imageAnalysisButton = (CAMImageAnalysisButton *)[(CAMBottomBar *)self addSubview:v9];
    uint64_t v5 = v9;
  }
  MEMORY[0x270F9A758](imageAnalysisButton, v5);
}

- (void)setImageAnalysisButtonBackgroundOverlay:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  imageAnalysisButtonBackgroundOverlaCGFloat y = self->_imageAnalysisButtonBackgroundOverlay;
  if (imageAnalysisButtonBackgroundOverlay != v5)
  {
    double v9 = v5;
    unsigned __int8 v7 = [(UIView *)imageAnalysisButtonBackgroundOverlay superview];

    if (v7 == self) {
      [(UIView *)self->_imageAnalysisButtonBackgroundOverlay removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_imageAnalysisButtonBackgroundOverlay, a3);
    double v8 = [(CAMBottomBar *)self imageAnalysisButton];
    [(CAMBottomBar *)self insertSubview:v9 belowSubview:v8];

    uint64_t v5 = v9;
  }
  MEMORY[0x270F9A758](imageAnalysisButtonBackgroundOverlay, v5);
}

- (void)_updateControlVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMBottomBar *)self visibilityUpdateDelegate];
  [v4 updateControlVisibilityAnimated:v3];
}

- (void)setUtilityBar:(id)a3
{
  uint64_t v5 = (CAMUtilityBar *)a3;
  utilityBar = self->_utilityBar;
  unsigned __int8 v7 = v5;
  if (utilityBar != v5)
  {
    [(CAMUtilityBar *)utilityBar removeFromSuperview];
    objc_storeStrong((id *)&self->_utilityBar, a3);
    [(CAMBottomBar *)self addSubview:v7];
    [(CAMBottomBar *)self _ensureSubviewOrdering];
  }
}

- (void)setUtilityBarExtensionDistance:(double)a3
{
  if (self->_utilityBarExtensionDistance != a3)
  {
    self->_utilityBarExtensionDistance = a3;
    [(CAMBottomBar *)self setNeedsLayout];
  }
}

+ (CGRect)shutterButtonAlignmentRectInBounds:(CGRect)a3 forLayoutStyle:(int64_t)a4 traitCollection:(id)a5 safeAreaInsets:(UIEdgeInsets)a6
{
  double bottom = a6.bottom;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGRectGetHeight(v39);
  [v12 displayScale];
  double v14 = v13;
  uint64_t v38 = 0;
  memset(v37, 0, sizeof(v37));
  CAMShutterButtonSpecForLayoutStyle(a4, (uint64_t)v37);
  double v15 = 0.0;
  UIRectCenteredIntegralRectScale();
  double v35 = v17;
  double v36 = v16;
  double v19 = v18;
  double v34 = v20;
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a4, 0))
  {
    double v22 = v35;
    double v21 = v36;
    double v23 = v34;
    goto LABEL_17;
  }
  if ((unint64_t)a4 < 4)
  {
    double v24 = 1.0 / v14 + 23.0;
    double v25 = 4.0;
LABEL_8:
    UIRoundToScale();
    double v15 = v26;
    goto LABEL_9;
  }
  if (a4 == 4)
  {
    double v25 = 0.0;
    double v24 = 1.79769313e308;
    goto LABEL_8;
  }
  double v24 = 1.79769313e308;
  double v25 = 0.0;
LABEL_9:
  if (v24 >= v15) {
    double v27 = v15;
  }
  else {
    double v27 = v24;
  }
  if (v27 >= v25) {
    double v25 = v27;
  }
  if (([a1 shouldUseSafeAreaInsetForLayoutStyle:a4 traitCollection:v12] & (v25 < bottom)) != 0) {
    double v25 = bottom;
  }
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v28 = CGRectGetMaxY(v40) - v25;
  double v23 = v34;
  double v22 = v35;
  double v19 = v28 - v34;
  double v21 = v36;
LABEL_17:

  double v29 = v21;
  double v30 = v19;
  double v31 = v22;
  double v32 = v23;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

+ (BOOL)shouldUseSafeAreaInsetForLayoutStyle:(int64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  char v7 = [a1 wantsVerticalBarForLayoutStyle:a3];
  uint64_t v8 = [v6 verticalSizeClass];

  if (v8 == 2) {
    return v7 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

uint64_t __44__CAMBottomBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __101__CAMBottomBar__layoutMenuButtons_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (*(id *)(a1 + 32) == v3) {
    [v3 intrinsicContentSizeForExpansion:0];
  }
  else {
    [v3 intrinsicContentSize];
  }
  UIRectCenteredIntegralRectScale();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) - v8;
  if (*(id *)(a1 + 32) == v17) {
    [v17 frameForAlignmentRect:0 expanded:0];
  }
  else {
    [v17 frameForAlignmentRect:0];
  }
  id v15 = v17;
  if (*(id *)(a1 + 40) == v17)
  {
    [*(id *)(a1 + 48) expandedFrameForMenuButton:v17];
    id v15 = v17;
  }
  if (*(id *)(a1 + 32) == v15)
  {
    double v16 = *(void **)(a1 + 96);
    if (v16)
    {
      void *v16 = v11;
      v16[1] = v12;
      v16[2] = v13;
      v16[3] = v14;
    }
  }
  if (*(unsigned char *)(a1 + 104)) {
    objc_msgSend(v17, "setFrame:");
  }
  v19.origin.CGFloat x = v5;
  v19.origin.CGFloat y = v10;
  v19.size.CGFloat width = v7;
  v19.size.CGFloat height = v9;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGRectGetMinY(v19) + -10.0;
}

- (CGRect)collapsedFrameForMenuButton:(id)a3
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v11 = *MEMORY[0x263F001A8];
  long long v12 = v4;
  id v5 = a3;
  double v6 = [(CAMBottomBar *)self _currentMenuButtons];
  [(CAMBottomBar *)self _layoutMenuButtons:v6 apply:0 withExpandedMenuButton:0 collapsingMenuButton:v5 collapsingFrame:&v11];

  double v8 = *((double *)&v11 + 1);
  double v7 = *(double *)&v11;
  double v10 = *((double *)&v12 + 1);
  double v9 = *(double *)&v12;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isExpanded])
  {
    [(CAMBottomBar *)self collapsedFrameForMenuButton:v6];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    [(CAMBottomBar *)self _setExpandedMenuButton:0];
    id v15 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__CAMBottomBar_collapseMenuButton_animated___block_invoke;
    v17[3] = &unk_263FA06F8;
    id v16 = v6;
    id v18 = v16;
    uint64_t v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    [v15 performWithoutAnimation:v17];
    [v16 finishCollapsingAnimated:v4];
    [(CAMBottomBar *)self _updateControlVisibilityAnimated:v4];
  }
}

uint64_t __44__CAMBottomBar_collapseMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startCollapsingWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

- (CGRect)expandedFrameForMenuButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 orientation] - 3;
  [(CAMBottomBar *)self bounds];
  -[CAMBottomBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  CGFloat v43 = v7;
  CGFloat v44 = v6;
  CGFloat v45 = v8;
  CGFloat rect = v9;
  [(CAMBottomBar *)self collapsedFrameForMenuButton:v4];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v46 = v15;
  CGFloat v47 = v14;
  objc_msgSend(v4, "alignmentRectForFrame:expanded:", 0);
  CGFloat v17 = v16;
  double MinY = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [v4 intrinsicContentSizeForExpansion:1];
  double v25 = v24;
  double v27 = v26;
  v48.origin.CGFloat x = v17;
  v48.origin.double y = MinY;
  v48.size.CGFloat width = v21;
  v48.size.CGFloat height = v23;
  double MaxX = CGRectGetMaxX(v48);
  if (v5 > 1)
  {
    double v30 = MaxX - v25;
  }
  else
  {
    objc_msgSend(v4, "frame", MaxX);
    double v30 = v29;
    double v25 = v31;
    v49.origin.double y = v43;
    v49.origin.CGFloat x = v44;
    double v27 = v45;
    v49.size.CGFloat width = v45;
    v49.size.CGFloat height = rect;
    double MinY = CGRectGetMinY(v49);
  }
  objc_msgSend(v4, "frameForAlignmentRect:expanded:", 0, v30, MinY, v25, v27);
  CGFloat x = v50.origin.x;
  double y = v50.origin.y;
  CGFloat width = v50.size.width;
  CGFloat height = v50.size.height;
  CGRectGetHeight(v50);
  v51.origin.double y = v46;
  v51.origin.CGFloat x = v47;
  v51.size.CGFloat width = v11;
  v51.size.CGFloat height = v13;
  CGRectGetHeight(v51);
  UIRoundToViewScale();
  double v37 = y - v36;

  double v38 = x;
  double v39 = v37;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.double y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isExpanded] & 1) == 0)
  {
    double v7 = [(CAMBottomBar *)self _expandedMenuButton];
    double v8 = v7;
    if (v7)
    {
      double v9 = (void *)MEMORY[0x263F82E00];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __42__CAMBottomBar_expandMenuButton_animated___block_invoke;
      v26[3] = &unk_263FA0408;
      v26[4] = self;
      id v27 = v7;
      [v9 performWithoutAnimation:v26];
    }
    [(CAMBottomBar *)self _setExpandedMenuButton:v6];
    [(CAMBottomBar *)self expandedFrameForMenuButton:v6];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    double v18 = (void *)MEMORY[0x263F82E00];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__CAMBottomBar_expandMenuButton_animated___block_invoke_2;
    v20[3] = &unk_263FA06F8;
    id v19 = v6;
    id v21 = v19;
    uint64_t v22 = v11;
    uint64_t v23 = v13;
    uint64_t v24 = v15;
    uint64_t v25 = v17;
    [v18 performWithoutAnimation:v20];
    [v19 finishExpansionAnimated:v4];
    [(CAMBottomBar *)self _updateControlVisibilityAnimated:v4];
  }
}

uint64_t __42__CAMBottomBar_expandMenuButton_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) collapsedFrameForMenuButton:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 40), "startCollapsingWithProposedFrame:");
  v2 = *(void **)(a1 + 40);
  return [v2 finishCollapsingAnimated:0];
}

uint64_t __42__CAMBottomBar_expandMenuButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startExpansionWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

- (id)touchingRecognizersToCancel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(CAMBottomBar *)self _currentMenuButtons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 touchingGestureRecognizer];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_iterateViewsInHUDManager:(id)a3 forHUDItem:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, unsigned char *))a4;
  char v31 = 0;
  double v8 = [(CAMBottomBar *)self _expandedMenuButton];

  if (v8)
  {
    id v9 = [(CAMBottomBar *)self _expandedMenuButton];
    v7[2](v7, v9, &v31);
  }
  else
  {
    uint64_t v10 = [(CAMBottomBar *)self _currentMenuButtons];
    uint64_t v11 = (void *)[v10 mutableCopy];

    long long v12 = [(CAMBottomBar *)self modeDial];
    [v11 addObject:v12];

    long long v13 = [(CAMBottomBar *)self apertureButton];

    if (v13)
    {
      long long v14 = [(CAMBottomBar *)self apertureButton];
      [v11 addObject:v14];
    }
    long long v15 = [(CAMBottomBar *)self flipButton];

    if (v15)
    {
      uint64_t v16 = [(CAMBottomBar *)self flipButton];
      [v11 addObject:v16];
    }
    [v6 locationOfAccessibilityGestureInView:self];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v11;
    uint64_t v21 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
LABEL_9:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v9);
        }
        uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * v24);
        objc_msgSend(v25, "frame", (void)v27);
        v34.CGFloat x = v18;
        v34.double y = v20;
        if (CGRectContainsPoint(v35, v34))
        {
          if ([v25 conformsToProtocol:&unk_26BDEB7E8])
          {
            if (([v25 isHidden] & 1) == 0)
            {
              [v25 alpha];
              if (v26 != 0.0)
              {
                v7[2](v7, v25, &v31);
                if (v31) {
                  break;
                }
              }
            }
          }
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v22) {
            goto LABEL_9;
          }
          break;
        }
      }
    }
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__1;
  long long v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CAMBottomBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_263FA0720;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CAMBottomBar *)self _iterateViewsInHUDManager:v5 forHUDItem:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__CAMBottomBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 hudItemForAccessibilityHUDManager:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CAMBottomBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_263FA0748;
  id v7 = v4;
  id v5 = v4;
  [(CAMBottomBar *)self _iterateViewsInHUDManager:v5 forHUDItem:v6];
}

uint64_t __50__CAMBottomBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 selectedByAccessibilityHUDManager:*(void *)(a1 + 32)];
  *a3 = 1;
  return result;
}

- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityUpdateDelegate);
  return (CAMControlVisibilityUpdateDelegate *)WeakRetained;
}

- (void)setVisibilityUpdateDelegate:(id)a3
{
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (CAMHDRButton)HDRButton
{
  return self->_HDRButton;
}

- (CAMTimerButton)timerButton
{
  return self->_timerButton;
}

- (CAMLivePhotoButton)livePhotoButton
{
  return self->_livePhotoButton;
}

- (CAMSharedLibraryButton)sharedLibraryButton
{
  return self->_sharedLibraryButton;
}

- (CEKApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (CAMImageAnalysisButton)imageAnalysisButton
{
  return self->_imageAnalysisButton;
}

- (UIView)imageAnalysisButtonBackgroundOverlay
{
  return self->_imageAnalysisButtonBackgroundOverlay;
}

- (double)utilityBarExtensionDistance
{
  return self->_utilityBarExtensionDistance;
}

- (void)_setExpandedMenuButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedMenuButton, 0);
  objc_storeStrong((id *)&self->_utilityBar, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButtonBackgroundOverlay, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_sharedLibraryButton, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_timerButton, 0);
  objc_storeStrong((id *)&self->_HDRButton, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_creativeCameraButton, 0);
  objc_storeStrong((id *)&self->_reviewButton, 0);
  objc_storeStrong((id *)&self->_imageWell, 0);
  objc_storeStrong((id *)&self->_modeDial, 0);
  objc_storeStrong((id *)&self->_stillDuringVideoButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_destroyWeak((id *)&self->_visibilityUpdateDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end