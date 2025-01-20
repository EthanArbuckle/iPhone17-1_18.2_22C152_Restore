@interface CAMTopBar
+ (BOOL)isFloatingStyle:(int64_t)a3;
- (BOOL)_backgroundMasksToBoundsForStyle:(int64_t)a3;
- (BOOL)_shouldExpandButtonsHorizontally;
- (BOOL)_shouldHideSubview:(id)a3;
- (BOOL)isFloating;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldHideApertureButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideDoneButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideElapsedTimeViewForGraphConfiguration:(id)a3;
- (BOOL)shouldHideFilterButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideFlashButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideFlipButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideHDRButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideIntensityButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideLivePhotoButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHidePhotosButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideSharedLibraryButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideTimerButtonForGraphConfiguration:(id)a3;
- (BOOL)shouldHideVideoConfigurationStatusIndicatorForGraphConfiguration:(id)a3;
- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate;
- (CAMElapsedTimeView)elapsedTimeView;
- (CAMExpandableMenuButton)_expandedMenuButton;
- (CAMFilterButton)filterButton;
- (CAMFlashButton)flashButton;
- (CAMFlipButton)flipButton;
- (CAMHDRButton)HDRButton;
- (CAMIntensityButton)intensityButton;
- (CAMLivePhotoButton)livePhotoButton;
- (CAMMessagesPhotosButton)photosButton;
- (CAMSharedLibraryButton)sharedLibraryButton;
- (CAMTimerButton)timerButton;
- (CAMTopBar)initWithCoder:(id)a3;
- (CAMTopBar)initWithFrame:(CGRect)a3;
- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator;
- (CEKApertureButton)apertureButton;
- (CGRect)collapsedFrameForMenuButton:(id)a3;
- (CGRect)expandedFrameForMenuButton:(id)a3;
- (NSArray)_allowedControls;
- (NSSet)_controlsNeedingNonAnimatedLayout;
- (PUReviewScreenDoneButton)doneButton;
- (UIEdgeInsets)_expandedMenuButtonTappableInsets;
- (UIView)_backgroundView;
- (double)_backgroundCornerRadiusForStyle:(int64_t)a3;
- (double)_interpolatedFloatingBarHeight;
- (double)_opacityForBackgroundStyle:(int64_t)a3;
- (id)_allowedControlsForMode:(int64_t)a3 style:(int64_t)a4;
- (id)_allowedControlsForPanoramaMode;
- (id)_allowedControlsForPortraitMode;
- (id)_allowedControlsForSquareMode;
- (id)_allowedControlsForStillImageMode;
- (id)_allowedControlsForTimelapseMode;
- (id)_allowedControlsForVideoMode;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)touchingRecognizersToCancel;
- (int64_t)_mode;
- (int64_t)backgroundStyle;
- (int64_t)orientation;
- (int64_t)style;
- (void)_commonCAMTopBarInitialization;
- (void)_computeHorizontalLayoutForViewsBetweenLeftView:(id)a3 rightView:(id)a4 views:(id)a5 alignmentRects:(id)a6;
- (void)_iterateViewsInHUDManager:(id)a3 forHUDItem:(id)a4;
- (void)_layoutControls:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7;
- (void)_layoutDefaultStyle;
- (void)_layoutFloatingStyle;
- (void)_setControlsNeedingNonAnimatedLayout:(id)a3;
- (void)_setExpandedMenuButton:(id)a3;
- (void)_setExpandedMenuButtonTappableInsets:(UIEdgeInsets)a3;
- (void)_setMode:(int64_t)a3 style:(int64_t)a4 animationDuration:(double)a5 animationOptions:(unint64_t)a6;
- (void)_updateControlVisibilityAnimated:(BOOL)a3;
- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4;
- (void)configureForMode:(int64_t)a3;
- (void)configureForMode:(int64_t)a3 animated:(BOOL)a4;
- (void)expandMenuButton:(id)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setApertureButton:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setDoneButton:(id)a3;
- (void)setElapsedTimeView:(id)a3;
- (void)setFilterButton:(id)a3;
- (void)setFlashButton:(id)a3;
- (void)setFlipButton:(id)a3;
- (void)setHDRButton:(id)a3;
- (void)setIntensityButton:(id)a3;
- (void)setLivePhotoButton:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPhotosButton:(id)a3;
- (void)setSharedLibraryButton:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setTimerButton:(id)a3;
- (void)setVideoConfigurationStatusIndicator:(id)a3;
- (void)setVisibilityUpdateDelegate:(id)a3;
@end

@implementation CAMTopBar

- (CAMTopBar)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTopBar;
  v3 = -[CAMTopBar initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMTopBar *)v3 _commonCAMTopBarInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMTopBarInitialization
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  backgroundView = self->__backgroundView;
  self->__backgroundView = v4;

  [(UIView *)self->__backgroundView setAutoresizingMask:18];
  [(UIView *)self->__backgroundView setUserInteractionEnabled:0];
  v6 = self->__backgroundView;
  [(CAMTopBar *)self addSubview:v6];
}

- (void)setStyle:(int64_t)a3
{
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    if (a4) {
      double v6 = 0.3;
    }
    else {
      double v6 = 0.0;
    }
    int64_t v7 = [(CAMTopBar *)self _mode];
    [(CAMTopBar *)self _setMode:v7 style:a3 animationDuration:0 animationOptions:v6];
  }
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

- (BOOL)shouldHideHDRButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  v4 = [(CAMTopBar *)self HDRButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)_shouldHideSubview:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMTopBar *)self _expandedMenuButton];
  if (v5)
  {
    BOOL v6 = [(CAMTopBar *)self _shouldExpandButtonsHorizontally];
    BOOL v7 = v5 != v4 && v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CAMExpandableMenuButton)_expandedMenuButton
{
  return self->__expandedMenuButton;
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (BOOL)shouldHideElapsedTimeViewForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self elapsedTimeView];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (CAMLivePhotoButton)livePhotoButton
{
  return self->_livePhotoButton;
}

- (BOOL)shouldHideLivePhotoButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self livePhotoButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (BOOL)shouldHideDoneButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self doneButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (CAMFilterButton)filterButton
{
  return self->_filterButton;
}

- (BOOL)shouldHideFilterButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self filterButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (CAMTimerButton)timerButton
{
  return self->_timerButton;
}

- (BOOL)shouldHideTimerButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self timerButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (void)setFlashButton:(id)a3
{
  id v5 = (CAMFlashButton *)a3;
  p_flashButton = &self->_flashButton;
  flashButton = self->_flashButton;
  v8 = v5;
  if (flashButton != v5)
  {
    [(CAMFlashButton *)flashButton removeFromSuperview];
    [(CAMExpandableMenuButton *)*p_flashButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_flashButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_flashButton, "setTappableEdgeInsets:", 10.0, 11.0, 10.0, 11.0);
    [(CAMExpandableMenuButton *)*p_flashButton setExpandableMenuDelegate:self];
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (void)setTimerButton:(id)a3
{
  id v5 = (CAMTimerButton *)a3;
  p_timerButton = &self->_timerButton;
  timerButton = self->_timerButton;
  v8 = v5;
  if (timerButton != v5)
  {
    [(CAMTimerButton *)timerButton removeFromSuperview];
    [(CAMExpandableMenuButton *)*p_timerButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_timerButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_timerButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    [(CAMExpandableMenuButton *)*p_timerButton setExpandableMenuDelegate:self];
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (BOOL)shouldHideFlashButtonForGraphConfiguration:(id)a3
{
  id v3 = self;
  id v4 = [(CAMTopBar *)self flashButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)_shouldExpandButtonsHorizontally
{
  int64_t v3 = [(CAMTopBar *)self orientation];
  BOOL result = [(CAMTopBar *)self isFloating];
  if ((unint64_t)(v3 - 1) < 2) {
    return 1;
  }
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isFloating
{
  int64_t v2 = [(CAMTopBar *)self style];
  return +[CAMTopBar isFloatingStyle:v2];
}

- (int64_t)style
{
  return self->_style;
}

- (void)setHDRButton:(id)a3
{
  id v5 = (CAMHDRButton *)a3;
  p_HDRButton = &self->_HDRButton;
  HDRButton = self->_HDRButton;
  v8 = v5;
  if (HDRButton != v5)
  {
    [(CAMHDRButton *)HDRButton removeFromSuperview];
    [(CAMExpandableMenuButton *)*p_HDRButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_HDRButton, a3);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_HDRButton, "setTappableEdgeInsets:", 12.0, 11.0, 12.0, 11.0);
    [(CAMExpandableMenuButton *)*p_HDRButton setExpandableMenuDelegate:self];
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (void)configureForMode:(int64_t)a3
{
}

- (void)configureForMode:(int64_t)a3 animated:(BOOL)a4
{
  if (a4) {
    double v6 = 0.25;
  }
  else {
    double v6 = 0.0;
  }
  int64_t v7 = [(CAMTopBar *)self style];
  [(CAMTopBar *)self _setMode:a3 style:v7 animationDuration:0 animationOptions:v6];
}

- (id)_allowedControlsForStillImageMode
{
  int64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = v3;
  if (self->_flashButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_HDRButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_livePhotoButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_timerButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_filterButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_flipButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)setFilterButton:(id)a3
{
  id v5 = (CAMFilterButton *)a3;
  filterButton = self->_filterButton;
  v8 = v5;
  if (filterButton != v5)
  {
    [(CAMFilterButton *)filterButton removeFromSuperview];
    objc_storeStrong((id *)&self->_filterButton, a3);
    double v7 = CAMPixelWidthForView(self);
    -[CAMFilterButton setTappableEdgeInsets:](self->_filterButton, "setTappableEdgeInsets:", v7 + 9.0, v7 + 9.0, v7 + 9.0, v7 + 9.0);
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      [(CAMTopBar *)self layoutIfNeeded];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __41__CAMTopBar_setBackgroundStyle_animated___block_invoke;
      v5[3] = &unk_263FA0208;
      v5[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v5 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      [(CAMTopBar *)self setNeedsLayout];
    }
  }
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isExpanded])
  {
    [(CAMTopBar *)self collapsedFrameForMenuButton:v6];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    [(CAMTopBar *)self _setExpandedMenuButton:0];
    v15 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__CAMTopBar_collapseMenuButton_animated___block_invoke;
    v17[3] = &unk_263FA06F8;
    id v16 = v6;
    id v18 = v16;
    uint64_t v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    [v15 performWithoutAnimation:v17];
    [v16 finishCollapsingAnimated:v4];
    [(CAMTopBar *)self _updateControlVisibilityAnimated:v4];
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CAMTopBar *)self _updateControlVisibilityAnimated:1];
  }
}

- (void)_updateControlVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMTopBar *)self visibilityUpdateDelegate];
  [v4 updateControlVisibilityAnimated:v3];
}

- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityUpdateDelegate);
  return (CAMControlVisibilityUpdateDelegate *)WeakRetained;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CAMTopBar;
  [(CAMTopBar *)&v16 layoutSubviews];
  BOOL v3 = [(CAMTopBar *)self _allowedControls];
  id v4 = [(CAMTopBar *)self apertureButton];
  if (v4 && [v3 containsObject:v4])
  {
    id v5 = [v3 lastObject];
    BOOL v6 = v4 != v5;

    [v4 setExpansionDirection:2 * v6];
  }
  int64_t v7 = [(CAMTopBar *)self style];
  int64_t v8 = v7;
  if (v7 == 1)
  {
    [(CAMTopBar *)self _layoutFloatingStyle];
  }
  else if (!v7)
  {
    [(CAMTopBar *)self _layoutDefaultStyle];
  }
  uint64_t v9 = [(CAMTopBar *)self _backgroundView];
  [(CAMTopBar *)self _opacityForBackgroundStyle:[(CAMTopBar *)self backgroundStyle]];
  uint64_t v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:v10];
  [v9 setBackgroundColor:v11];

  uint64_t v12 = [v9 layer];
  [(CAMTopBar *)self _backgroundCornerRadiusForStyle:v8];
  double v14 = v13;
  BOOL v15 = [(CAMTopBar *)self _backgroundMasksToBoundsForStyle:v8];
  [v12 setCornerRadius:v14];
  [v12 setMasksToBounds:v15];
}

- (void)_layoutDefaultStyle
{
  [(CAMTopBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v13 = [(CAMTopBar *)self _backgroundView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  uint64_t v11 = [(CAMTopBar *)self _allowedControls];
  uint64_t v12 = [(CAMTopBar *)self _expandedMenuButton];
  [(CAMTopBar *)self _layoutControls:v11 apply:1 withExpandedMenuButton:v12 collapsingMenuButton:0 collapsingFrame:0];
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (NSArray)_allowedControls
{
  return self->__allowedControls;
}

- (void)_layoutControls:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7
{
  BOOL v9 = a4;
  id v11 = a3;
  id v57 = a5;
  id v61 = a6;
  uint64_t v12 = [(CAMTopBar *)self _backgroundView];
  [v12 frame];
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = 440;
  int v22 = [v11 containsObject:self->_elapsedTimeView];
  char v23 = v22;
  BOOL v60 = v9;
  if (v22
    || [v11 count] == 1
    && (uint64_t v21 = 488, [v11 containsObject:self->_timerButton]))
  {
    id v24 = *(id *)((char *)&self->super.super.super.isa + v21);
LABEL_3:
    v25 = v24;
    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v11, "count", v57) >= 2)
  {
    unint64_t v26 = [v11 count];
    if (v26)
    {
      id v24 = [v11 objectAtIndexedSubscript:v26 >> 1];
      goto LABEL_3;
    }
  }
  v25 = 0;
LABEL_9:
  objc_msgSend(v11, "firstObject", v57);
  v27 = (PUReviewScreenDoneButton *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27 == v25)
  {
    v29 = 0;
  }
  else if (v27 == self->_doneButton)
  {
    v29 = 0;
  }
  else
  {
    v29 = v27;
  }
  double v30 = v14 + 11.0;
  double v31 = v16 + 0.0;
  double v32 = v18 + -22.0;
  v33 = v29;
  uint64_t v34 = [v11 lastObject];
  v35 = self->_doneButton;
  if (!v35)
  {
    if ((PUReviewScreenDoneButton *)v34 == v28 || v34 == (void)v25) {
      v37 = 0;
    }
    else {
      v37 = (void *)v34;
    }
    v35 = v37;
  }
  v59 = (void *)v34;
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke;
  v75[3] = &unk_263FA5308;
  char v86 = v23 ^ 1;
  double v82 = v30;
  double v83 = v31;
  double v84 = v32;
  uint64_t v85 = v20;
  uint64_t v81 = 0x4036000000000000;
  v75[4] = self;
  v39 = v33;
  v76 = v39;
  v40 = v35;
  v77 = v40;
  id v41 = v25;
  id v78 = v41;
  id v42 = v12;
  id v79 = v42;
  id v43 = v38;
  id v80 = v43;
  [v11 enumerateObjectsUsingBlock:v75];
  if (!v41)
  {
    v45 = v58;
    if (!v39) {
      goto LABEL_30;
    }
    v44 = v39;
    if (!v40) {
      goto LABEL_30;
    }
LABEL_29:
    [(CAMTopBar *)self _computeHorizontalLayoutForViewsBetweenLeftView:v44 rightView:v40 views:v11 alignmentRects:v43];
    goto LABEL_30;
  }
  if (v39) {
    [(CAMTopBar *)self _computeHorizontalLayoutForViewsBetweenLeftView:v39 rightView:v41 views:v11 alignmentRects:v43];
  }
  v44 = (PUReviewScreenDoneButton *)v41;
  v45 = v58;
  if (v40) {
    goto LABEL_29;
  }
LABEL_30:
  if ((v23 & 1) == 0)
  {
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_2;
    v67[3] = &unk_263FA5330;
    id v68 = v43;
    v69 = v39;
    double v71 = v30;
    double v72 = v31;
    double v73 = v32;
    uint64_t v74 = v20;
    v70 = v40;
    [v11 enumerateObjectsUsingBlock:v67];
  }
  if (v60)
  {
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_3;
    v63[3] = &unk_263FA5358;
    id v64 = v45;
    v65 = self;
    id v66 = v43;
    [v11 enumerateObjectsUsingBlock:v63];
  }
  v46 = a7;
  if (a7)
  {
    uint64_t v47 = [v11 indexOfObjectIdenticalTo:v61];
    if (v47 == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v48 = *MEMORY[0x263F001A8];
      CGFloat v49 = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat v50 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v51 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    else
    {
      v52 = [v43 objectAtIndexedSubscript:v47];
      [v52 CGRectValue];
      objc_msgSend(v61, "frameForAlignmentRect:expanded:", 0);
      CGFloat v48 = v53;
      CGFloat v49 = v54;
      CGFloat v50 = v55;
      CGFloat v51 = v56;

      v46 = a7;
    }
    v46->origin.x = v48;
    v46->origin.y = v49;
    v46->size.width = v50;
    v46->size.height = v51;
  }
}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = v13;
  }
  else {
    double v3 = 0;
  }
  id v4 = v3;
  if (v4) {
    [v4 intrinsicContentSizeForExpansion:0];
  }
  else {
    [v13 intrinsicContentSize];
  }
  double v7 = v5;
  double v8 = v6;
  if (*(unsigned char *)(a1 + 120)) {
    double v7 = *(double *)(a1 + 80);
  }
  UIRoundToViewScale();
  double v10 = v9;
  if (*(id *)(a1 + 40) == v13)
  {
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
  }
  else if (*(id *)(a1 + 48) == v13)
  {
    double MinX = CGRectGetMaxX(*(CGRect *)(a1 + 88)) - v7;
  }
  else if (*(id *)(a1 + 56) == v13)
  {
    [*(id *)(a1 + 64) frame];
    CGRectGetMidX(v15);
    UIRoundToViewScale();
  }
  else
  {
    double MinX = *MEMORY[0x263F001A8];
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", MinX, v10, v7, v8);
  [*(id *)(a1 + 72) addObject:v12];
}

- (void)_computeHorizontalLayoutForViewsBetweenLeftView:(id)a3 rightView:(id)a4 views:(id)a5 alignmentRects:(id)a6
{
  id v47 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 indexOfObjectIdenticalTo:a3];
  uint64_t v12 = [v9 indexOfObjectIdenticalTo:v47];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = v12;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v14 = v12 - v11;
      if (v12 - v11 != 1)
      {
        CGRect v15 = [v10 objectAtIndexedSubscript:v11];
        [v15 CGRectValue];
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        id v24 = [v10 objectAtIndexedSubscript:v13];
        [v24 CGRectValue];
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        v49.origin.x = v17;
        v49.origin.y = v19;
        v49.size.width = v21;
        v49.size.height = v23;
        double MaxX = CGRectGetMaxX(v49);
        v50.origin.x = v26;
        v50.origin.y = v28;
        v50.size.width = v30;
        v50.size.height = v32;
        double MinX = CGRectGetMinX(v50);
        unint64_t v35 = v11 + 1;
        if (v35 < v13)
        {
          double v36 = MinX - MaxX;
          double v37 = 0.0;
          unint64_t v38 = v35;
          do
          {
            v39 = [v10 objectAtIndexedSubscript:v38];
            [v39 CGRectValue];
            double v37 = v37 + v40;

            ++v38;
          }
          while (v13 != v38);
          if (v35 < v13)
          {
            double v41 = (v36 - v37) / (double)v14;
            double v42 = MaxX + v41;
            do
            {
              id v43 = [v10 objectAtIndexedSubscript:v35];
              [v43 CGRectValue];
              double v45 = v44;
              UIRoundToViewScale();
              double v42 = v42 + v41 + v45;
              v46 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
              [v10 setObject:v46 atIndexedSubscript:v35];

              ++v35;
            }
            while (v13 != v35);
          }
        }
      }
    }
  }
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
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

- (double)_backgroundCornerRadiusForStyle:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 1) {
    return 4.0;
  }
  return result;
}

- (BOOL)_backgroundMasksToBoundsForStyle:(int64_t)a3
{
  return a3 == 1;
}

- (CAMTopBar)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTopBar;
  double v3 = [(CAMTopBar *)&v7 initWithCoder:a3];
  id v4 = v3;
  if (v3)
  {
    [(CAMTopBar *)v3 _commonCAMTopBarInitialization];
    double v5 = v4;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CAMTopBar *)self bounds];
  double v8 = fmax(y, CGRectGetMidY(v16));
  id v9 = [(CAMTopBar *)self _expandedMenuButton];
  [v9 frame];
  v15.double x = x;
  v15.double y = v8;
  if (CGRectContainsPoint(v17, v15))
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CAMTopBar;
    -[CAMTopBar hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  return v11;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CAMTopBar;
  unsigned int v7 = -[CAMTopBar pointInside:withEvent:](&v11, sel_pointInside_withEvent_, a4);
  double v8 = [(CAMTopBar *)self _expandedMenuButton];
  [v8 frame];
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  int v9 = v7 | CGRectContainsPoint(v13, v12);

  return v9;
}

- (double)_interpolatedFloatingBarHeight
{
  int64_t v2 = [(CAMTopBar *)self window];
  double v3 = [v2 screen];
  [v3 _referenceBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v13.origin.CGFloat x = v5;
  v13.origin.CGFloat y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  return fmin(fmax(CGRectGetWidth(v13) * 0.0545455 + 17.5455, 35.0), 38.0);
}

- (void)_layoutFloatingStyle
{
  [(CAMTopBar *)self bounds];
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  id v12 = [(CAMTopBar *)self _backgroundView];
  [(CAMTopBar *)self _interpolatedFloatingBarHeight];
  double v4 = v3;
  UIRectCenteredIntegralRectScale();
  [v12 frameForAlignmentRect:0];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  objc_msgSend(v12, "setCenter:", MidX, CGRectGetMidY(v15));
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, 274.0, v4);
  double v10 = [(CAMTopBar *)self _allowedControls];
  CGFloat v11 = [(CAMTopBar *)self _expandedMenuButton];
  [(CAMTopBar *)self _layoutControls:v10 apply:1 withExpandedMenuButton:v11 collapsingMenuButton:0 collapsingFrame:0];
}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CGFloat v5 = v20;
  }
  else {
    CGFloat v5 = 0;
  }
  id v6 = v5;
  CGFloat v7 = v6;
  if (v6) {
    [v6 intrinsicContentSizeForExpansion:0];
  }
  else {
    [v20 intrinsicContentSize];
  }
  double v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v8 CGRectValue];

  UIRectCenteredXInRectScale();
  double v11 = v10;
  double v13 = v12;
  double v14 = v9;
  double v16 = v15;
  if (*(id *)(a1 + 40) == v20)
  {
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 56));
    if (v11 < MinX) {
      double v11 = MinX;
    }
  }
  else if (*(id *)(a1 + 48) == v20)
  {
    double v17 = CGRectGetMaxX(*(CGRect *)(a1 + 56)) - v9;
    if (v11 >= v17) {
      double v11 = v17;
    }
  }
  CGFloat v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v11, v13, v14, v16, 0);
  [*(id *)(a1 + 32) setObject:v19 atIndexedSubscript:a3];
}

void __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1[4] == v5)
  {
    [a1[5] expandedFrameForMenuButton:v5];
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    double v8 = [a1[6] objectAtIndexedSubscript:a3];
    [v8 CGRectValue];
    if (v7) {
      objc_msgSend(v7, "frameForAlignmentRect:expanded:", 0);
    }
    else {
      objc_msgSend(v5, "frameForAlignmentRect:");
    }
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    double v17 = [a1[5] _controlsNeedingNonAnimatedLayout];
    int v18 = [v17 containsObject:v5];

    if (v18)
    {
      CGFloat v19 = (void *)MEMORY[0x263F82E00];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_4;
      v20[3] = &unk_263FA06F8;
      id v21 = v5;
      double v22 = v13;
      double v23 = v14;
      double v24 = v15;
      double v25 = v16;
      [v19 performWithoutAnimation:v20];
    }
    else
    {
      objc_msgSend(v5, "setFrame:", v13, v14, v15, v16);
    }
  }
}

uint64_t __95__CAMTopBar__layoutControls_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  int64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

+ (BOOL)isFloatingStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

uint64_t __41__CAMTopBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  int64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setElapsedTimeView:(id)a3
{
  id v5 = (CAMElapsedTimeView *)a3;
  elapsedTimeView = self->_elapsedTimeView;
  id v7 = v5;
  if (elapsedTimeView != v5)
  {
    [(CAMElapsedTimeView *)elapsedTimeView removeFromSuperview];
    objc_storeStrong((id *)&self->_elapsedTimeView, a3);
    [(CAMTopBar *)self addSubview:v7];
  }
}

- (void)setFlipButton:(id)a3
{
  id v5 = (CAMFlipButton *)a3;
  flipButton = self->_flipButton;
  double v8 = v5;
  if (flipButton != v5)
  {
    [(CAMFlipButton *)flipButton removeFromSuperview];
    objc_storeStrong((id *)&self->_flipButton, a3);
    double v7 = CAMPixelWidthForView(self);
    -[CAMFlipButton setTappableEdgeInsets:](self->_flipButton, "setTappableEdgeInsets:", v7 + 9.0, v7 + 9.0, v7 + 9.0, v7 + 9.0);
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (void)setApertureButton:(id)a3
{
  id v5 = (CEKApertureButton *)a3;
  p_apertureButton = &self->_apertureButton;
  apertureButton = self->_apertureButton;
  if (apertureButton != v5)
  {
    double v10 = v5;
    double v8 = [(CEKApertureButton *)apertureButton superview];

    if (v8 == self) {
      [(CEKApertureButton *)*p_apertureButton removeFromSuperview];
    }
    double v9 = [(CEKApertureButton *)*p_apertureButton delegate];

    if (v9 == self) {
      [(CEKApertureButton *)*p_apertureButton setDelegate:0];
    }
    objc_storeStrong((id *)&self->_apertureButton, a3);
    [(CEKApertureButton *)*p_apertureButton setDelegate:self];
    -[CEKApertureButton setTappableEdgeInsets:](*p_apertureButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    apertureButton = (CEKApertureButton *)[(CAMTopBar *)self addSubview:v10];
    id v5 = v10;
  }
  MEMORY[0x270F9A758](apertureButton, v5);
}

- (void)setIntensityButton:(id)a3
{
  id v5 = (CAMIntensityButton *)a3;
  p_intensityButton = &self->_intensityButton;
  intensityButton = self->_intensityButton;
  if (intensityButton != v5)
  {
    double v9 = v5;
    double v8 = [(CAMIntensityButton *)intensityButton superview];

    if (v8 == self) {
      [(CAMIntensityButton *)*p_intensityButton removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_intensityButton, a3);
    -[CAMIntensityButton setTappableEdgeInsets:](*p_intensityButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    intensityButton = (CAMIntensityButton *)[(CAMTopBar *)self addSubview:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](intensityButton, v5);
}

- (void)setLivePhotoButton:(id)a3
{
  id v5 = (CAMLivePhotoButton *)a3;
  p_livePhotoButton = &self->_livePhotoButton;
  livePhotoButton = self->_livePhotoButton;
  double v8 = v5;
  if (livePhotoButton != v5)
  {
    [(CAMLivePhotoButton *)livePhotoButton removeFromSuperview];
    [(CAMExpandableMenuButton *)*p_livePhotoButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_livePhotoButton, a3);
    [(CAMExpandableMenuButton *)*p_livePhotoButton setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v8, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    [(CAMTopBar *)self addSubview:v8];
  }
}

- (void)setSharedLibraryButton:(id)a3
{
  id v5 = (CAMSharedLibraryButton *)a3;
  p_sharedLibraryButton = &self->_sharedLibraryButton;
  sharedLibraryButton = self->_sharedLibraryButton;
  double v8 = v5;
  if (sharedLibraryButton != v5)
  {
    [(CAMSharedLibraryButton *)sharedLibraryButton removeFromSuperview];
    [(CAMExpandableMenuButton *)*p_sharedLibraryButton setExpandableMenuDelegate:0];
    objc_storeStrong((id *)&self->_sharedLibraryButton, a3);
    [(CAMExpandableMenuButton *)*p_sharedLibraryButton setExpandableMenuDelegate:self];
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v8, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    [(CAMTopBar *)self addSubview:v8];
    [(CAMTopBar *)self _setMode:[(CAMTopBar *)self _mode] style:[(CAMTopBar *)self style] animationDuration:0 animationOptions:0.0];
  }
}

- (void)setVideoConfigurationStatusIndicator:(id)a3
{
  id v5 = (CAMVideoConfigurationStatusIndicator *)a3;
  p_videoConfigurationStatusIndicator = &self->_videoConfigurationStatusIndicator;
  videoConfigurationStatusIndicator = self->_videoConfigurationStatusIndicator;
  if (videoConfigurationStatusIndicator != v5)
  {
    double v10 = v5;
    double v8 = [(CAMVideoConfigurationStatusIndicator *)videoConfigurationStatusIndicator superview];

    if (v8 == self) {
      [(CAMVideoConfigurationStatusIndicator *)*p_videoConfigurationStatusIndicator removeFromSuperview];
    }
    double v9 = [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator delegate];

    if (v9 == self) {
      [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator setDelegate:0];
    }
    objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, a3);
    [(CAMControlStatusIndicator *)*p_videoConfigurationStatusIndicator setDelegate:self];
    videoConfigurationStatusIndicator = (CAMVideoConfigurationStatusIndicator *)[(CAMTopBar *)self addSubview:*p_videoConfigurationStatusIndicator];
    id v5 = v10;
  }
  MEMORY[0x270F9A758](videoConfigurationStatusIndicator, v5);
}

- (void)setPhotosButton:(id)a3
{
  id v5 = (CAMMessagesPhotosButton *)a3;
  p_photosButton = &self->_photosButton;
  photosButton = self->_photosButton;
  if (photosButton != v5)
  {
    double v8 = v5;
    [(CAMMessagesPhotosButton *)photosButton removeFromSuperview];
    objc_storeStrong((id *)&self->_photosButton, a3);
    -[CAMMessagesPhotosButton setTappableEdgeInsets:](*p_photosButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    photosButton = (CAMMessagesPhotosButton *)[(CAMTopBar *)self addSubview:*p_photosButton];
    id v5 = v8;
  }
  MEMORY[0x270F9A758](photosButton, v5);
}

- (void)setDoneButton:(id)a3
{
  id v5 = (PUReviewScreenDoneButton *)a3;
  p_doneButton = &self->_doneButton;
  doneButton = self->_doneButton;
  if (doneButton != v5)
  {
    double v8 = v5;
    [(PUReviewScreenDoneButton *)doneButton removeFromSuperview];
    objc_storeStrong((id *)&self->_doneButton, a3);
    -[PUReviewScreenDoneButton setTappableEdgeInsets:](*p_doneButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    doneButton = (PUReviewScreenDoneButton *)[(CAMTopBar *)self addSubview:*p_doneButton];
    id v5 = v8;
  }
  MEMORY[0x270F9A758](doneButton, v5);
}

- (id)_allowedControlsForPortraitMode
{
  double v3 = [MEMORY[0x263EFF980] array];
  double v4 = v3;
  if (self->_flashButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_HDRButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_timerButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_filterButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_intensityButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_apertureButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)_allowedControlsForSquareMode
{
  double v3 = [MEMORY[0x263EFF980] array];
  double v4 = v3;
  if (self->_flashButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_HDRButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_timerButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_filterButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_flipButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)_allowedControlsForVideoMode
{
  double v3 = [MEMORY[0x263EFF980] array];
  double v4 = v3;
  if (self->_flashButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_elapsedTimeView) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_videoConfigurationStatusIndicator) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_flipButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)_allowedControlsForPanoramaMode
{
  return (id)[MEMORY[0x263EFF980] array];
}

- (id)_allowedControlsForTimelapseMode
{
  double v3 = [MEMORY[0x263EFF980] array];
  double v4 = v3;
  if (self->_flipButton) {
    objc_msgSend(v3, "addObject:");
  }
  return v4;
}

- (id)_allowedControlsForMode:(int64_t)a3 style:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForStillImageMode];
      goto LABEL_9;
    case 1:
    case 2:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForVideoMode];
      goto LABEL_9;
    case 3:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForPanoramaMode];
      goto LABEL_9;
    case 4:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForSquareMode];
      goto LABEL_9;
    case 5:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForTimelapseMode];
      goto LABEL_9;
    case 6:
      uint64_t v6 = [(CAMTopBar *)self _allowedControlsForPortraitMode];
LABEL_9:
      double v7 = (void *)v6;
      break;
    default:
      double v7 = 0;
      break;
  }
  sharedLibraryButton = self->_sharedLibraryButton;
  if (sharedLibraryButton) {
    [v7 insertObject:sharedLibraryButton atIndex:0];
  }
  BOOL v9 = +[CAMTopBar isFloatingStyle:a4];
  double v10 = [(CAMTopBar *)self photosButton];

  if (v10 && !v9)
  {
    double v11 = [(CAMTopBar *)self photosButton];
    [v7 insertObject:v11 atIndex:0];
  }
  double v12 = [(CAMTopBar *)self doneButton];

  if (v12)
  {
    double v13 = [(CAMTopBar *)self doneButton];
    [v7 addObject:v13];
  }
  return v7;
}

- (void)_setMode:(int64_t)a3 style:(int64_t)a4 animationDuration:(double)a5 animationOptions:(unint64_t)a6
{
  if (a5 > 0.0) {
    [(CAMTopBar *)self layoutIfNeeded];
  }
  double v11 = [(CAMTopBar *)self _allowedControlsForMode:a3 style:a4];
  double v12 = [(CAMTopBar *)self _allowedControls];
  self->__mode = a3;
  self->_style = a4;
  objc_storeStrong((id *)&self->__allowedControls, v11);
  [(CAMTopBar *)self setNeedsLayout];
  if (a5 > 0.0)
  {
    double v13 = [MEMORY[0x263EFF9C0] setWithArray:v11];
    double v14 = [MEMORY[0x263EFFA08] setWithArray:v12];
    [v13 minusSet:v14];

    [(CAMTopBar *)self _setControlsNeedingNonAnimatedLayout:v13];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__CAMTopBar__setMode_style_animationDuration_animationOptions___block_invoke;
    v15[3] = &unk_263FA0208;
    v15[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:a6 | 2 delay:v15 options:0 animations:a5 completion:0.0];
  }
}

uint64_t __63__CAMTopBar__setMode_style_animationDuration_animationOptions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  int64_t v2 = *(void **)(a1 + 32);
  return [v2 _setControlsNeedingNonAnimatedLayout:0];
}

- (BOOL)shouldHideApertureButtonForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self apertureButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)shouldHideIntensityButtonForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self intensityButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)shouldHideFlipButtonForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self flipButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)shouldHideSharedLibraryButtonForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self sharedLibraryButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)shouldHideVideoConfigurationStatusIndicatorForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self videoConfigurationStatusIndicator];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (BOOL)shouldHidePhotosButtonForGraphConfiguration:(id)a3
{
  double v3 = self;
  double v4 = [(CAMTopBar *)self photosButton];
  LOBYTE(v3) = [(CAMTopBar *)v3 _shouldHideSubview:v4];

  return (char)v3;
}

- (CGRect)collapsedFrameForMenuButton:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  id v5 = [(CAMTopBar *)self _allowedControls];
  [(CAMTopBar *)self _layoutControls:v5 apply:0 withExpandedMenuButton:0 collapsingMenuButton:v4 collapsingFrame:&v19];

  [v4 intrinsicContentSizeForExpansion:0];
  double v7 = v6;
  double v9 = v8;

  if (*(double *)&v20 == v7 && *((double *)&v20 + 1) == v9)
  {
    [(CAMTopBar *)self _expandedMenuButtonTappableInsets];
    *(double *)&long long v19 = *(double *)&v19 - v14;
    *((double *)&v19 + 1) = *((double *)&v19 + 1) - v13;
    *(double *)&long long v20 = *(double *)&v20 - (-v11 - v14);
    *((double *)&v20 + 1) = *((double *)&v20 + 1) - (-v12 - v13);
  }
  double v16 = *((double *)&v19 + 1);
  double v15 = *(double *)&v19;
  double v18 = *((double *)&v20 + 1);
  double v17 = *(double *)&v20;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

uint64_t __41__CAMTopBar_collapseMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startCollapsingWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  int64_t v2 = *(void **)(a1 + 32);
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
  double v6 = [(CAMTopBar *)self _backgroundView];
  [v6 frame];
  -[CAMTopBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  [(CAMTopBar *)self collapsedFrameForMenuButton:v4];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  objc_msgSend(v4, "alignmentRectForFrame:expanded:", 0);
  if (v5 >= 2)
  {
    double v20 = v12;
    double v12 = v23;
  }
  else
  {
    v35.origin.CGFloat x = v8;
    v35.origin.CGFloat y = v10;
    v35.size.CGFloat width = v12;
    v35.size.CGFloat height = v14;
    CGRectGetHeight(v35);
    v36.origin.CGFloat x = v16;
    v36.origin.CGFloat y = v18;
    v36.size.CGFloat width = v20;
    v36.size.CGFloat height = v22;
    CGRectGetHeight(v36);
    UIRoundToViewScale();
    double v10 = v24;
    double v8 = v16;
  }
  objc_msgSend(v4, "frameForAlignmentRect:expanded:", 1, v8, v10, v20, v12);
  double v28 = v27;
  double v30 = v29;
  if (v5 < 2)
  {
    CGFloat v22 = v26;
    CGFloat v18 = v25;
  }

  double v31 = v28;
  double v32 = v18;
  double v33 = v30;
  double v34 = v22;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 isExpanded] & 1) == 0)
  {
    double v7 = [(CAMTopBar *)self _expandedMenuButton];
    double v8 = v7;
    if (v7)
    {
      double v9 = (void *)MEMORY[0x263F82E00];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __39__CAMTopBar_expandMenuButton_animated___block_invoke;
      v26[3] = &unk_263FA0408;
      v26[4] = self;
      id v27 = v7;
      [v9 performWithoutAnimation:v26];
    }
    [(CAMTopBar *)self _setExpandedMenuButton:v6];
    [(CAMTopBar *)self expandedFrameForMenuButton:v6];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    CGFloat v18 = (void *)MEMORY[0x263F82E00];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__CAMTopBar_expandMenuButton_animated___block_invoke_2;
    v20[3] = &unk_263FA06F8;
    id v19 = v6;
    id v21 = v19;
    uint64_t v22 = v11;
    uint64_t v23 = v13;
    uint64_t v24 = v15;
    uint64_t v25 = v17;
    [v18 performWithoutAnimation:v20];
    [v19 finishExpansionAnimated:v4];
    [(CAMTopBar *)self _updateControlVisibilityAnimated:v4];
  }
}

uint64_t __39__CAMTopBar_expandMenuButton_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) collapsedFrameForMenuButton:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 40), "startCollapsingWithProposedFrame:");
  int64_t v2 = *(void **)(a1 + 40);
  return [v2 finishCollapsingAnimated:0];
}

uint64_t __39__CAMTopBar_expandMenuButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startExpansionWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  int64_t v2 = *(void **)(a1 + 32);
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
  double v4 = [(CAMTopBar *)self _allowedControls];
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
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id, unsigned char *))a4;
  char v24 = 0;
  double v8 = [(CAMTopBar *)self _expandedMenuButton];

  if (v8)
  {
    id v9 = [(CAMTopBar *)self _expandedMenuButton];
    v7[2](v7, v9, &v24);
  }
  else
  {
    uint64_t v10 = [(CAMTopBar *)self _allowedControls];
    [v6 locationOfAccessibilityGestureInView:self];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v10;
    uint64_t v15 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
LABEL_5:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v9);
        }
        id v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
        objc_msgSend(v19, "frame", (void)v20);
        v27.CGFloat x = v12;
        v27.CGFloat y = v14;
        if (CGRectContainsPoint(v28, v27))
        {
          if ([v19 conformsToProtocol:&unk_26BDEB7E8])
          {
            v7[2](v7, v19, &v24);
            if (v24) {
              break;
            }
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v16) {
            goto LABEL_5;
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
  CGFloat v12 = &v11;
  uint64_t v13 = 0x3032000000;
  CGFloat v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CAMTopBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_263FA0720;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CAMTopBar *)self _iterateViewsInHUDManager:v5 forHUDItem:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__CAMTopBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
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
  v6[2] = __47__CAMTopBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_263FA0748;
  id v7 = v4;
  id v5 = v4;
  [(CAMTopBar *)self _iterateViewsInHUDManager:v5 forHUDItem:v6];
}

uint64_t __47__CAMTopBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 selectedByAccessibilityHUDManager:*(void *)(a1 + 32)];
  *a3 = 1;
  return result;
}

- (CEKApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (CAMIntensityButton)intensityButton
{
  return self->_intensityButton;
}

- (CAMSharedLibraryButton)sharedLibraryButton
{
  return self->_sharedLibraryButton;
}

- (CAMMessagesPhotosButton)photosButton
{
  return self->_photosButton;
}

- (CAMVideoConfigurationStatusIndicator)videoConfigurationStatusIndicator
{
  return self->_videoConfigurationStatusIndicator;
}

- (NSSet)_controlsNeedingNonAnimatedLayout
{
  return self->__controlsNeedingNonAnimatedLayout;
}

- (void)_setControlsNeedingNonAnimatedLayout:(id)a3
{
}

- (void)_setExpandedMenuButton:(id)a3
{
}

- (UIEdgeInsets)_expandedMenuButtonTappableInsets
{
  double top = self->__expandedMenuButtonTappableInsets.top;
  double left = self->__expandedMenuButtonTappableInsets.left;
  double bottom = self->__expandedMenuButtonTappableInsets.bottom;
  double right = self->__expandedMenuButtonTappableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setExpandedMenuButtonTappableInsets:(UIEdgeInsets)a3
{
  self->__expandedMenuButtonTappableInsets = a3;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedMenuButton, 0);
  objc_storeStrong((id *)&self->__controlsNeedingNonAnimatedLayout, 0);
  objc_storeStrong((id *)&self->__allowedControls, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_videoConfigurationStatusIndicator, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_photosButton, 0);
  objc_storeStrong((id *)&self->_sharedLibraryButton, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_timerButton, 0);
  objc_storeStrong((id *)&self->_intensityButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_HDRButton, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_destroyWeak((id *)&self->_visibilityUpdateDelegate);
}

@end