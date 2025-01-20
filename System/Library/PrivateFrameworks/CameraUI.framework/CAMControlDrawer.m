@interface CAMControlDrawer
- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets;
- (BOOL)isApertureSliderExpanded;
- (BOOL)isControlExpandedForType:(int64_t)a3;
- (BOOL)isExposureSliderExpanded;
- (BOOL)isFilterScrubberExpanded;
- (BOOL)isIntensitySliderExpanded;
- (BOOL)isLowLightSliderExpanded;
- (BOOL)isSemanticStyleControlExpanded;
- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3;
- (CAMControlDrawer)initWithCoder:(id)a3;
- (CAMControlDrawer)initWithFrame:(CGRect)a3;
- (CAMControlDrawer)initWithLayoutStyle:(int64_t)a3;
- (CAMControlDrawerDelegate)delegate;
- (CAMControlDrawerExpandableButton)expandedControl;
- (CAMControlDrawerPresentationDelegate)presentationDelegate;
- (CAMDrawerApertureButton)apertureButton;
- (CAMDrawerAspectRatioButton)aspectRatioButton;
- (CAMDrawerExposureButton)exposureButton;
- (CAMDrawerFilterButton)filterButton;
- (CAMDrawerFlashButton)flashButton;
- (CAMDrawerHDRButton)hdrButton;
- (CAMDrawerIntensityButton)intensityButton;
- (CAMDrawerLivePhotoButton)livePhotoButton;
- (CAMDrawerLowLightButton)lowLightButton;
- (CAMDrawerProResButton)proResButton;
- (CAMDrawerRAWButton)rawButton;
- (CAMDrawerSemanticStyleButton)semanticStyleButton;
- (CAMDrawerSharedLibraryButton)sharedLibraryButton;
- (CAMDrawerSmartStyleButton)smartStyleButton;
- (CAMDrawerTimerButton)timerButton;
- (CAMDrawerVideoStabilizationButton)videoStabilizationButton;
- (CAMExposureSlider)exposureSlider;
- (CAMLowLightSlider)lowLightSlider;
- (CAMSemanticStyleControl)semanticStyleControl;
- (CEKApertureSlider)apertureSlider;
- (CEKSlider)intensitySlider;
- (CEKWheelScrubberView)filterScrubberView;
- (CGSize)_scrollingContentSizeForControlCount:(unint64_t)a3;
- (NSArray)visibleControlTypes;
- (NSMutableDictionary)_controlMap;
- (UIScrollView)_scrollView;
- (double)_controlCenterSpacingForControlCount:(unint64_t)a3;
- (double)_viewportLength;
- (id)_createControlForType:(int64_t)a3;
- (id)buttonForType:(int64_t)a3;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)touchingRecognizersToCancel;
- (int64_t)expandedControlType;
- (int64_t)layoutStyle;
- (int64_t)orientation;
- (unint64_t)_sliderFontStyle;
- (unint64_t)_viewportMaximumControlCount;
- (void)_apertureSliderDidChangeValue;
- (void)_commonInitializationWithLayoutStyle:(int64_t)a3;
- (void)_ensureVisibleControls;
- (void)_exposureSliderDidChangeValue;
- (void)_filterScrubberDidChangeValue;
- (void)_handleControlReleased:(id)a3;
- (void)_handleControlValueChanged:(id)a3;
- (void)_installControlIfNeededForType:(int64_t)a3;
- (void)_intensitySliderDidChangeValue;
- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4;
- (void)_layoutApertureSlider;
- (void)_layoutExposureSlider;
- (void)_layoutFilterScrubberView;
- (void)_layoutFullWidthCustomView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5;
- (void)_layoutFullWidthCustomView:(id)a3 withAlignmentRect:(CGRect)a4 forAssociatedControl:(id)a5 expanded:(BOOL)a6;
- (void)_layoutIntensitySlider;
- (void)_layoutLowLightSlider;
- (void)_layoutScrubberView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5;
- (void)_layoutSemanticStyleControl;
- (void)_layoutVisibleControlForType:(int64_t)a3 visibleControlTypes:(id)a4;
- (void)_loadApertureSliderIfNeeded;
- (void)_loadControlIfNeededForType:(int64_t)a3;
- (void)_loadCustomUIIfNeededForControlType:(int64_t)a3;
- (void)_loadExposureSliderIfNeeded;
- (void)_loadFilterScrubberIfNeeded;
- (void)_loadIntensitySliderIfNeeded;
- (void)_loadLowLightSliderIfNeeded;
- (void)_loadSemanticStyleControlIfNeeded;
- (void)_lowLightSliderDidChangeValue;
- (void)_semanticStyleControlDidChangeValue;
- (void)_setExpandedControl:(id)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5;
- (void)_updateControlsScaleAnimated:(BOOL)a3;
- (void)_updateControlsVisibilityAnimated:(BOOL)a3;
- (void)_updateExpansionInsetsForExpandableButton:(id)a3;
- (void)collapseExpandableButtonsAnimated:(BOOL)a3 updatePreferredDrawerControl:(BOOL)a4;
- (void)expandControlForType:(int64_t)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5;
- (void)expandableButton:(id)a3 willChangeExpanded:(BOOL)a4;
- (void)layoutSubviews;
- (void)menuButtonDidSelectItem:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3 forControlType:(int64_t)a4 animated:(BOOL)a5 updatePreferredDrawerControl:(BOOL)a6;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPresentationDelegate:(id)a3;
- (void)setVisibleControlTypes:(id)a3;
- (void)setVisibleControlTypes:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMControlDrawer

- (CAMControlDrawer)initWithLayoutStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v4 = -[CAMControlDrawer initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4) {
    [(CAMControlDrawer *)v4 _commonInitializationWithLayoutStyle:a3];
  }
  return v5;
}

- (void)_commonInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  controlMap = self->__controlMap;
  self->__controlMap = v4;

  v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
  scrollView = self->__scrollView;
  self->__scrollView = v6;

  [(UIScrollView *)self->__scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->__scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->__scrollView setDecelerationRate:*MEMORY[0x263F83970]];
  [(UIScrollView *)self->__scrollView setDelegate:self];
  [(UIScrollView *)self->__scrollView setContentInsetAdjustmentBehavior:2];
  v8 = self->__scrollView;
  [(CAMControlDrawer *)self addSubview:v8];
}

- (CAMControlDrawer)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v3 = -[CAMControlDrawer initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    [(CAMControlDrawer *)v3 _commonInitializationWithLayoutStyle:v5];
  }
  return v3;
}

- (CAMControlDrawer)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v3 = [(CAMControlDrawer *)&v7 initWithCoder:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    [(CAMControlDrawer *)v3 _commonInitializationWithLayoutStyle:v5];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v3 = [(CAMControlDrawer *)self visibleControlTypes];
  v4 = [(CAMControlDrawer *)self _scrollView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CAMControlDrawer *)self bounds];
  v51.origin.x = v13;
  v51.origin.y = v14;
  v51.size.width = v15;
  v51.size.height = v16;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  BOOL v17 = CGRectEqualToRect(v50, v51);

  if (!v17)
  {
    [(CAMControlDrawer *)self bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(CAMControlDrawer *)self _scrollView];
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);
  }
  -[CAMControlDrawer _scrollingContentSizeForControlCount:](self, "_scrollingContentSizeForControlCount:", [v3 count]);
  double v28 = v27;
  double v30 = v29;
  v31 = [(CAMControlDrawer *)self _scrollView];
  [v31 contentSize];
  double v33 = v32;
  double v35 = v34;

  if (v33 != v28 || v35 != v30)
  {
    v36 = [(CAMControlDrawer *)self _scrollView];
    objc_msgSend(v36, "setContentSize:", v28, v30);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v37 = v3;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v45;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v45 != v40) {
          objc_enumerationMutation(v37);
        }
        -[CAMControlDrawer _layoutVisibleControlForType:visibleControlTypes:](self, "_layoutVisibleControlForType:visibleControlTypes:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v41++), "integerValue", (void)v44), v37);
      }
      while (v39 != v41);
      uint64_t v39 = [v37 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v39);
  }

  v42 = [(CAMControlDrawer *)self expandedControl];

  if (v42)
  {
    v43 = [(CAMControlDrawer *)self expandedControl];
    [(CAMControlDrawer *)self _updateExpansionInsetsForExpandableButton:v43];
  }
  [(CAMControlDrawer *)self _layoutFilterScrubberView];
  [(CAMControlDrawer *)self _layoutApertureSlider];
  [(CAMControlDrawer *)self _layoutIntensitySlider];
  [(CAMControlDrawer *)self _layoutExposureSlider];
  [(CAMControlDrawer *)self _layoutLowLightSlider];
  [(CAMControlDrawer *)self _layoutSemanticStyleControl];
  [(CAMControlDrawer *)self _updateControlsScaleAnimated:0];
  [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
}

- (id)_createControlForType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF) {
    v4 = 0;
  }
  else {
    v4 = objc_msgSend(objc_alloc(*off_263FA0CF0[a3]), "initWithLayoutStyle:", -[CAMControlDrawer layoutStyle](self, "layoutStyle"));
  }
  [v4 addTarget:self action:sel__handleControlValueChanged_ forControlEvents:4096];
  [v4 addTarget:self action:sel__handleControlReleased_ forControlEvents:64];
  [v4 setAlpha:0.0];
  return v4;
}

- (id)buttonForType:(int64_t)a3
{
  v4 = [(CAMControlDrawer *)self _controlMap];
  double v5 = [NSNumber numberWithInteger:a3];
  CGFloat v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (CAMDrawerFlashButton)flashButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDD9B0];

  return (CAMDrawerFlashButton *)v3;
}

- (CAMDrawerLivePhotoButton)livePhotoButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDD9C8];

  return (CAMDrawerLivePhotoButton *)v3;
}

- (CAMDrawerAspectRatioButton)aspectRatioButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDD9E0];

  return (CAMDrawerAspectRatioButton *)v3;
}

- (CAMDrawerTimerButton)timerButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDD9F8];

  return (CAMDrawerTimerButton *)v3;
}

- (CAMDrawerFilterButton)filterButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA10];

  return (CAMDrawerFilterButton *)v3;
}

- (CAMDrawerApertureButton)apertureButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA28];

  return (CAMDrawerApertureButton *)v3;
}

- (CAMDrawerIntensityButton)intensityButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA40];

  return (CAMDrawerIntensityButton *)v3;
}

- (CAMDrawerExposureButton)exposureButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA58];

  return (CAMDrawerExposureButton *)v3;
}

- (CAMDrawerHDRButton)hdrButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA70];

  return (CAMDrawerHDRButton *)v3;
}

- (CAMDrawerLowLightButton)lowLightButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDA88];

  return (CAMDrawerLowLightButton *)v3;
}

- (CAMDrawerSemanticStyleButton)semanticStyleButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDAA0];

  return (CAMDrawerSemanticStyleButton *)v3;
}

- (CAMDrawerSmartStyleButton)smartStyleButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDAB8];

  return (CAMDrawerSmartStyleButton *)v3;
}

- (CAMDrawerRAWButton)rawButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDAD0];

  return (CAMDrawerRAWButton *)v3;
}

- (CAMDrawerProResButton)proResButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDAE8];

  return (CAMDrawerProResButton *)v3;
}

- (CAMDrawerSharedLibraryButton)sharedLibraryButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDB00];

  return (CAMDrawerSharedLibraryButton *)v3;
}

- (CAMDrawerVideoStabilizationButton)videoStabilizationButton
{
  v2 = [(CAMControlDrawer *)self _controlMap];
  v3 = [v2 objectForKeyedSubscript:&unk_26BDDDB18];

  return (CAMDrawerVideoStabilizationButton *)v3;
}

- (void)_handleControlValueChanged:(id)a3
{
  uint64_t v4 = [a3 controlType];
  double v5 = [(CAMControlDrawer *)self delegate];
  [v5 controlDrawer:self didChangeValueForControlType:v4];

  switch(v4)
  {
    case 0:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self flashButton];
      objc_msgSend(v7, "controlDrawer:didChangeFlashMode:", self, objc_msgSend(v6, "flashMode"));
      goto LABEL_11;
    case 1:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self livePhotoButton];
      objc_msgSend(v7, "controlDrawer:didChangeLivePhotoMode:", self, objc_msgSend(v6, "livePhotoMode"));
      goto LABEL_11;
    case 2:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self aspectRatioButton];
      objc_msgSend(v7, "controlDrawer:didChangeAspectRatio:", self, objc_msgSend(v6, "aspectRatio"));
      goto LABEL_11;
    case 3:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self timerButton];
      objc_msgSend(v7, "controlDrawer:didChangeTimerDuration:", self, objc_msgSend(v6, "timerDuration"));
      goto LABEL_11;
    case 5:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self hdrButton];
      objc_msgSend(v7, "controlDrawer:didChangeHDRMode:", self, objc_msgSend(v6, "hdrMode"));
      goto LABEL_11;
    case 12:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self rawButton];
      objc_msgSend(v7, "controlDrawer:didChangeRAWMode:", self, objc_msgSend(v6, "rawMode"));
      goto LABEL_11;
    case 13:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self proResButton];
      objc_msgSend(v7, "controlDrawer:didChangeProResVideoMode:", self, objc_msgSend(v6, "proResVideoMode"));
      goto LABEL_11;
    case 14:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self sharedLibraryButton];
      objc_msgSend(v7, "controlDrawer:didChangeSharedLibraryMode:", self, objc_msgSend(v6, "sharedLibraryMode"));
      goto LABEL_11;
    case 15:
      id v7 = [(CAMControlDrawer *)self delegate];
      CGFloat v6 = [(CAMControlDrawer *)self videoStabilizationButton];
      objc_msgSend(v7, "controlDrawer:didChangeVideoStabilizationMode:", self, objc_msgSend(v6, "videoStabilizationMode"));
LABEL_11:

      break;
    default:
      return;
  }
}

- (void)_handleControlReleased:(id)a3
{
  uint64_t v4 = [a3 controlType];
  [(CAMControlDrawer *)self _loadCustomUIIfNeededForControlType:v4];
  if (v4 == 4)
  {
    id v8 = [(CAMControlDrawer *)self delegate];
    id v7 = [(CAMControlDrawer *)self filterButton];
    objc_msgSend(v8, "controlDrawer:wantsFilterScrubberVisible:", self, objc_msgSend(v7, "isExpanded") ^ 1);
  }
  else
  {
    if (v4) {
      return;
    }
    double v5 = [(CAMControlDrawer *)self flashButton];
    int v6 = [v5 isFlashUnavailable];

    if (!v6) {
      return;
    }
    id v8 = [(CAMControlDrawer *)self delegate];
    [v8 controlDrawerFlashButtonUnavailable:self];
  }
}

- (void)_loadCustomUIIfNeededForControlType:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      [(CAMControlDrawer *)self _loadFilterScrubberIfNeeded];
      break;
    case 6:
      [(CAMControlDrawer *)self _loadApertureSliderIfNeeded];
      break;
    case 7:
      [(CAMControlDrawer *)self _loadIntensitySliderIfNeeded];
      break;
    case 8:
      [(CAMControlDrawer *)self _loadExposureSliderIfNeeded];
      break;
    case 9:
      [(CAMControlDrawer *)self _loadLowLightSliderIfNeeded];
      break;
    case 10:
      [(CAMControlDrawer *)self _loadSemanticStyleControlIfNeeded];
      break;
    default:
      return;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets
{
  +[CAMControlDrawerButton buttonSize];
  double v3 = v2 * 0.5 + 44.0 + 5.0;
  double v4 = 20.0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)_loadFilterScrubberIfNeeded
{
  if (!self->_filterScrubberView)
  {
    id v3 = objc_alloc(MEMORY[0x263F30710]);
    double v4 = (CEKWheelScrubberView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    filterScrubberView = self->_filterScrubberView;
    self->_filterScrubberView = v4;

    [(CEKWheelScrubberView *)self->_filterScrubberView setCornerStyle:1];
    [(CEKWheelScrubberView *)self->_filterScrubberView setTransparentGradients];
    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CEKWheelScrubberView setGradientInsets:](self->_filterScrubberView, "setGradientInsets:");
    int v6 = [(CAMControlDrawer *)self _scrollView];
    [v6 insertSubview:self->_filterScrubberView atIndex:0];

    [(CEKWheelScrubberView *)self->_filterScrubberView addTarget:self action:sel__filterScrubberDidChangeValue forControlEvents:4096];
    id v7 = [(CAMControlDrawer *)self delegate];
    [v7 controlDrawerDidCreateFilterScrubber:self];

    [(CAMControlDrawer *)self _layoutFilterScrubberView];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
  }
}

- (void)_filterScrubberDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:4];
}

- (void)_loadApertureSliderIfNeeded
{
  if (!self->_apertureSlider)
  {
    id v3 = (CEKApertureSlider *)objc_alloc_init(MEMORY[0x263F30680]);
    apertureSlider = self->_apertureSlider;
    self->_apertureSlider = v3;

    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CEKApertureSlider setGradientInsets:](self->_apertureSlider, "setGradientInsets:");
    [(CEKApertureSlider *)self->_apertureSlider setTitleAlignment:2];
    [(CEKApertureSlider *)self->_apertureSlider setFontStyle:[(CAMControlDrawer *)self _sliderFontStyle]];
    double v5 = [(CAMControlDrawer *)self _scrollView];
    [v5 insertSubview:self->_apertureSlider atIndex:0];

    [(CAMControlDrawer *)self _layoutApertureSlider];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
    [(CEKApertureSlider *)self->_apertureSlider addTarget:self action:sel__apertureSliderDidChangeValue forControlEvents:4096];
    id v6 = [(CAMControlDrawer *)self delegate];
    [v6 controlDrawerDidCreateApertureSlider:self];
  }
}

- (void)_apertureSliderDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:6];
}

- (void)_loadIntensitySliderIfNeeded
{
  if (!self->_intensitySlider)
  {
    CAMLocalizedFrameworkString(@"PORTRAIT_INTENSITY_SLIDER_TITLE", 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = (CEKSlider *)[objc_alloc(MEMORY[0x263F306F0]) initWithTitle:v9];
    intensitySlider = self->_intensitySlider;
    self->_intensitySlider = v3;

    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CEKSlider setGradientInsets:](self->_intensitySlider, "setGradientInsets:");
    [(CEKSlider *)self->_intensitySlider setSliderVerticalAlignment:2];
    [(CEKSlider *)self->_intensitySlider setValueLabelVisibility:2];
    [(CEKSlider *)self->_intensitySlider setTitleAlignment:2];
    [(CEKSlider *)self->_intensitySlider setFontStyle:[(CAMControlDrawer *)self _sliderFontStyle]];
    double v5 = self->_intensitySlider;
    id v6 = [MEMORY[0x263F825C8] blackColor];
    [(CEKSlider *)v5 setOpaqueGradientsWithColor:v6];

    id v7 = [(CAMControlDrawer *)self _scrollView];
    [v7 insertSubview:self->_intensitySlider atIndex:0];

    [(CAMControlDrawer *)self _layoutIntensitySlider];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
    [(CEKSlider *)self->_intensitySlider addTarget:self action:sel__intensitySliderDidChangeValue forControlEvents:4096];
    id v8 = [(CAMControlDrawer *)self delegate];
    [v8 controlDrawerDidCreateIntensitySlider:self];
  }
}

- (void)_intensitySliderDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:7];
}

- (void)_loadLowLightSliderIfNeeded
{
  if (!self->_lowLightSlider)
  {
    id v3 = objc_alloc_init(CAMLowLightSlider);
    lowLightSlider = self->_lowLightSlider;
    self->_lowLightSlider = v3;

    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CEKDiscreteSlider setGradientInsets:](self->_lowLightSlider, "setGradientInsets:");
    [(CEKDiscreteSlider *)self->_lowLightSlider setTitleAlignment:2];
    [(CEKDiscreteSlider *)self->_lowLightSlider setFontStyle:[(CAMControlDrawer *)self _sliderFontStyle]];
    [(CEKDiscreteSlider *)self->_lowLightSlider setTransparentGradients];
    double v5 = [(CAMControlDrawer *)self _scrollView];
    [v5 insertSubview:self->_lowLightSlider atIndex:0];

    [(CAMControlDrawer *)self _layoutLowLightSlider];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
    [(CAMLowLightSlider *)self->_lowLightSlider addTarget:self action:sel__lowLightSliderDidChangeValue forControlEvents:4096];
    id v6 = [(CAMControlDrawer *)self delegate];
    [v6 controlDrawerDidCreateLowLightSlider:self];
  }
}

- (void)_lowLightSliderDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:9];
}

- (void)_loadExposureSliderIfNeeded
{
  if (!self->_exposureSlider)
  {
    id v3 = objc_alloc_init(CAMExposureSlider);
    exposureSlider = self->_exposureSlider;
    self->_exposureSlider = v3;

    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CEKDiscreteSlider setGradientInsets:](self->_exposureSlider, "setGradientInsets:");
    [(CEKDiscreteSlider *)self->_exposureSlider setTitleAlignment:2];
    [(CEKDiscreteSlider *)self->_exposureSlider setFontStyle:[(CAMControlDrawer *)self _sliderFontStyle]];
    [(CEKDiscreteSlider *)self->_exposureSlider setTransparentGradients];
    double v5 = [(CAMControlDrawer *)self _scrollView];
    [v5 insertSubview:self->_exposureSlider atIndex:0];

    [(CAMControlDrawer *)self _layoutExposureSlider];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
    [(CAMExposureSlider *)self->_exposureSlider addTarget:self action:sel__exposureSliderDidChangeValue forControlEvents:4096];
    id v6 = [(CAMControlDrawer *)self delegate];
    [v6 controlDrawerDidCreateExposureSlider:self];
  }
}

- (void)_exposureSliderDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:8];
}

- (void)_loadSemanticStyleControlIfNeeded
{
  if (!self->_semanticStyleControl)
  {
    id v3 = objc_alloc_init(CAMSemanticStyleControl);
    semanticStyleControl = self->_semanticStyleControl;
    self->_semanticStyleControl = v3;

    [(CAMControlDrawer *)self _scrubberGradientEdgeInsets];
    -[CAMSemanticStyleControl setGradientInsets:](self->_semanticStyleControl, "setGradientInsets:");
    double v5 = [(CAMControlDrawer *)self _scrollView];
    [v5 insertSubview:self->_semanticStyleControl atIndex:0];

    [(CAMControlDrawer *)self _layoutSemanticStyleControl];
    [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:0];
    [(CAMSemanticStyleControl *)self->_semanticStyleControl addTarget:self action:sel__semanticStyleControlDidChangeValue forControlEvents:4096];
    id v6 = [(CAMControlDrawer *)self delegate];
    [v6 controlDrawerDidCreateSemanticStyleControl:self];
  }
}

- (void)_semanticStyleControlDidChangeValue
{
  id v3 = [(CAMControlDrawer *)self delegate];
  [v3 controlDrawer:self didChangeValueForControlType:10];
}

- (unint64_t)_sliderFontStyle
{
  double v2 = +[CAMCaptureCapabilities capabilities];
  unint64_t v3 = [v2 sfCameraFontSupported];

  return v3;
}

- (unint64_t)_viewportMaximumControlCount
{
  [(CAMControlDrawer *)self _viewportLength];
  if (v2 < 375.0) {
    return 5;
  }
  else {
    return 6;
  }
}

- (double)_viewportLength
{
  [(CAMControlDrawer *)self bounds];
  return v2;
}

- (double)_controlCenterSpacingForControlCount:(unint64_t)a3
{
  [(CAMControlDrawer *)self _viewportLength];
  double v6 = v5;
  unint64_t v7 = [(CAMControlDrawer *)self _viewportMaximumControlCount];
  double result = 0.0;
  if (a3 >= 2)
  {
    if (v7 >= a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = v7;
    }
    return (v6 + -44.0 + -44.0) / (double)(v9 - 1);
  }
  return result;
}

- (CGSize)_scrollingContentSizeForControlCount:(unint64_t)a3
{
  [(CAMControlDrawer *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if ([(CAMControlDrawer *)self _viewportMaximumControlCount] < a3)
  {
    [(CAMControlDrawer *)self _controlCenterSpacingForControlCount:a3];
    double v6 = v9 * (double)(a3 - 1) + 88.0;
  }
  double v10 = v6;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_layoutVisibleControlForType:(int64_t)a3 visibleControlTypes:(id)a4
{
  id v27 = a4;
  double v6 = [NSNumber numberWithInteger:a3];
  [v27 indexOfObject:v6];

  double v7 = [(CAMControlDrawer *)self expandedControl];
  double v8 = v7;
  if (v7)
  {
    double v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "controlType"));
    [v27 indexOfObject:v9];
  }
  [(CAMControlDrawer *)self bounds];
  uint64_t v10 = [v27 count];
  double v11 = [(CAMControlDrawer *)self _controlMap];
  CGFloat v12 = [NSNumber numberWithInteger:a3];
  CGFloat v13 = [v11 objectForKeyedSubscript:v12];

  if (v8) {
    +[CAMControlDrawerButton buttonSize];
  }
  else {
    [(CAMControlDrawer *)self _controlCenterSpacingForControlCount:v10];
  }
  [v13 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v13, "frameForAlignmentRect:");
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if (v8)
  {
    double v22 = [(CAMControlDrawer *)self _scrollView];
    -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v22, v15, v17, v19, v21);
    double v15 = v23;
    double v17 = v24;
    double v19 = v25;
    double v21 = v26;
  }
  CAMViewSetBoundsAndCenterForFrame(v13, v15, v17, v19, v21);
}

- (void)_updateExpansionInsetsForExpandableButton:(id)a3
{
  id v35 = a3;
  [v35 frame];
  objc_msgSend(v35, "alignmentRectForFrame:");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v32 = v10;
  [(CAMControlDrawer *)self _viewportLength];
  UIRectIntegralWithScale();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(CAMControlDrawer *)self _scrollView];
  -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  double v33 = *MEMORY[0x263F834E8];
  double v34 = *(double *)(MEMORY[0x263F834E8] + 16);
  v37.origin.x = v5;
  CGFloat v28 = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v32;
  double MinX = CGRectGetMinX(v37);
  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  double v30 = MinX - CGRectGetMinX(v38);
  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  double MaxX = CGRectGetMaxX(v39);
  v40.origin.x = v28;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v32;
  objc_msgSend(v35, "setExpansionInsets:", v33, v30, v34, MaxX - CGRectGetMaxX(v40));
}

- (void)_layoutFullWidthCustomView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(CAMControlDrawer *)self bounds];
  CGRect v12 = CGRectInset(v11, 0.0, 2.0);
  -[CAMControlDrawer _layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:", v9, v8, v5, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
}

- (void)_layoutFullWidthCustomView:(id)a3 withAlignmentRect:(CGRect)a4 forAssociatedControl:(id)a5 expanded:(BOOL)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v38 = a3;
  if (!a6)
  {
    id v13 = a5;
    [v13 center];
    double v15 = v14;
    double v17 = v16;
    double v18 = [v13 superview];

    -[CAMControlDrawer convertPoint:fromView:](self, "convertPoint:fromView:", v18, v15, v17);
    double v20 = v19;

    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    double x = v20 - CGRectGetMidX(v40);
  }
  objc_msgSend(v38, "frameForAlignmentRect:", x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [v38 superview];
  -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v29, v22, v24, v26, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);
}

- (void)_layoutApertureSlider
{
  id v4 = [(CAMControlDrawer *)self apertureSlider];
  unint64_t v3 = [(CAMControlDrawer *)self apertureButton];
  [(CAMControlDrawer *)self _layoutFullWidthCustomView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isApertureSliderExpanded]];
}

- (void)_layoutIntensitySlider
{
  id v4 = [(CAMControlDrawer *)self intensitySlider];
  unint64_t v3 = [(CAMControlDrawer *)self intensityButton];
  [(CAMControlDrawer *)self _layoutFullWidthCustomView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isIntensitySliderExpanded]];
}

- (void)_layoutExposureSlider
{
  id v4 = [(CAMControlDrawer *)self exposureSlider];
  unint64_t v3 = [(CAMControlDrawer *)self exposureButton];
  [(CAMControlDrawer *)self _layoutFullWidthCustomView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isExposureSliderExpanded]];
}

- (void)_layoutLowLightSlider
{
  id v4 = [(CAMControlDrawer *)self lowLightSlider];
  unint64_t v3 = [(CAMControlDrawer *)self lowLightButton];
  [(CAMControlDrawer *)self _layoutFullWidthCustomView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isLowLightSliderExpanded]];
}

- (void)_layoutSemanticStyleControl
{
  id v4 = [(CAMControlDrawer *)self semanticStyleControl];
  unint64_t v3 = [(CAMControlDrawer *)self semanticStyleButton];
  [(CAMControlDrawer *)self _layoutFullWidthCustomView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isSemanticStyleControlExpanded]];
}

- (void)_layoutFilterScrubberView
{
  id v4 = [(CAMControlDrawer *)self filterScrubberView];
  unint64_t v3 = [(CAMControlDrawer *)self filterButton];
  [(CAMControlDrawer *)self _layoutScrubberView:v4 forAssociatedControl:v3 expanded:[(CAMControlDrawer *)self isFilterScrubberExpanded]];
}

- (void)_layoutScrubberView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    id v8 = a4;
    id v9 = a3;
    [v9 thumbnailSize];
    [(CAMControlDrawer *)self bounds];
    UIRectCenteredYInRectScale();
    [(CAMControlDrawer *)self _layoutFullWidthCustomView:v9 withAlignmentRect:v8 forAssociatedControl:v5 expanded:0];

    [v9 selectedThumbnailBorderWidth];
    UIFloorToViewScale();
    objc_msgSend(v9, "setSelectionDotCenterTopSpacing:");
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(CAMControlDrawer *)self _controlMap];
    BOOL v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setLayoutStyle:a3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setVisibleControlTypes:(id)a3
{
}

- (void)setVisibleControlTypes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = (NSArray *)a3;
  uint64_t v8 = v7;
  double v27 = self;
  if (self->_visibleControlTypes != v7 && !-[NSArray isEqualToArray:](v7, "isEqualToArray:"))
  {
    id v9 = self->_visibleControlTypes;
    objc_storeStrong((id *)&self->_visibleControlTypes, a3);
    [(CAMControlDrawer *)self _ensureVisibleControls];
    long long v10 = [(CAMControlDrawer *)self expandedControl];
    long long v11 = v10;
    if (v10)
    {
      long long v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "controlType"));
      BOOL v13 = [(NSArray *)v8 containsObject:v12];

      if (!v13) {
        [(CAMControlDrawer *)v27 _setExpandedControl:0 animated:v4 updatePreferredDrawerControl:0];
      }
    }
    if (v4)
    {
      double v26 = v9;
      uint64_t v14 = [MEMORY[0x263EFFA08] setWithArray:v9];
      uint64_t v15 = v8;
      double v16 = [MEMORY[0x263EFF9C0] setWithArray:v8];
      double v25 = (void *)v14;
      [v16 minusSet:v14];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            double v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v23 = [v22 integerValue];
            double v24 = (void *)MEMORY[0x263F82E00];
            v29[0] = MEMORY[0x263EF8330];
            v29[1] = 3221225472;
            v29[2] = __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke;
            v29[3] = &unk_263FA0C58;
            v29[4] = v27;
            uint64_t v32 = v23;
            double v30 = v15;
            double v31 = v22;
            [v24 performWithoutAnimation:v29];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v19);
      }

      [(CAMControlDrawer *)v27 setNeedsLayout];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke_2;
      v28[3] = &unk_263FA0208;
      v28[4] = v27;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v28 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
      uint64_t v8 = v15;
      id v9 = v26;
    }
    else
    {
      [(CAMControlDrawer *)v27 setNeedsLayout];
    }
  }
}

void __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutVisibleControlForType:*(void *)(a1 + 56) visibleControlTypes:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _controlMap];
  double v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];
  [v2 layoutIfNeeded];
}

uint64_t __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)isFilterScrubberExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:4];
}

- (BOOL)isApertureSliderExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:6];
}

- (BOOL)isIntensitySliderExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:7];
}

- (BOOL)isExposureSliderExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:8];
}

- (BOOL)isLowLightSliderExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:9];
}

- (BOOL)isSemanticStyleControlExpanded
{
  return [(CAMControlDrawer *)self isControlExpandedForType:10];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(CAMControlDrawer *)self _controlMap];
    uint64_t v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) setOrientation:a3 animated:v4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)setExpanded:(BOOL)a3 forControlType:(int64_t)a4 animated:(BOOL)a5 updatePreferredDrawerControl:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  long long v11 = [(CAMControlDrawer *)self _controlMap];
  long long v12 = [NSNumber numberWithInteger:a4];
  long long v13 = [v11 objectForKeyedSubscript:v12];

  if ([v13 isExpandable])
  {
    id v14 = v13;
    id v15 = v14;
    if (!a3)
    {
      if (![(CAMControlDrawer *)self isControlExpandedForType:a4])
      {
LABEL_6:

        goto LABEL_10;
      }
      id v15 = 0;
    }
    [(CAMControlDrawer *)self _setExpandedControl:v15 animated:v7 updatePreferredDrawerControl:v6];
    goto LABEL_6;
  }
  double v16 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CAMControlDrawer setExpanded:forControlType:animated:updatePreferredDrawerControl:]((uint64_t)v13, v16);
  }

LABEL_10:
}

- (void)expandControlForType:(int64_t)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5
{
}

- (BOOL)isControlExpandedForType:(int64_t)a3
{
  BOOL v5 = [(CAMControlDrawer *)self expandedControl];
  if (v5)
  {
    BOOL v6 = [(CAMControlDrawer *)self expandedControl];
    BOOL v7 = [v6 controlType] == a3;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)expandedControlType
{
  id v3 = [(CAMControlDrawer *)self expandedControl];
  if (v3)
  {
    BOOL v4 = [(CAMControlDrawer *)self expandedControl];
    int64_t v5 = [v4 controlType];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (void)collapseExpandableButtonsAnimated:(BOOL)a3 updatePreferredDrawerControl:(BOOL)a4
{
}

- (void)_ensureVisibleControls
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CAMControlDrawer *)self visibleControlTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) integerValue];
        [(CAMControlDrawer *)self _loadControlIfNeededForType:v8];
        [(CAMControlDrawer *)self _installControlIfNeededForType:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_loadControlIfNeededForType:(int64_t)a3
{
  id v9 = [(CAMControlDrawer *)self _controlMap];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v9 objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v6 = [(CAMControlDrawer *)self _createControlForType:a3];
    objc_msgSend(v6, "setOrientation:", -[CAMControlDrawer orientation](self, "orientation"));
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    [v9 setObject:v6 forKeyedSubscript:v7];

    if ([v6 isExpandable]) {
      [v6 setDelegate:self];
    }
    uint64_t v8 = [(CAMControlDrawer *)self delegate];
    [v8 controlDrawer:self didCreateControlForType:a3];
  }
}

- (void)_installControlIfNeededForType:(int64_t)a3
{
  id v9 = [(CAMControlDrawer *)self _scrollView];
  uint64_t v5 = [(CAMControlDrawer *)self _controlMap];
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [v7 superview];

    if (v8 != v9) {
      [v9 addSubview:v7];
    }
  }
}

- (void)_updateControlsScaleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMControlDrawer *)self bounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  long long v13 = [(CAMControlDrawer *)self expandedControl];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__CAMControlDrawer__updateControlsScaleAnimated___block_invoke;
  v16[3] = &unk_263FA0C80;
  if (v3) {
    double v14 = 0.5;
  }
  else {
    double v14 = 0.0;
  }
  uint64_t v18 = v6;
  uint64_t v19 = v8;
  uint64_t v20 = v10;
  uint64_t v21 = v12;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v16 initialSpringVelocity:0 options:v14 animations:1.0 completion:1.0];
}

void __49__CAMControlDrawer__updateControlsScaleAnimated___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v2 = [*(id *)(a1 + 32) _controlMap];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v8 intrinsicContentSize];
        if (v10 > *(double *)(a1 + 64)
          || ((uint64_t v11 = *(void **)(a1 + 40), v11 != v8) ? (v12 = v11 == 0) : (v12 = 1),
              v12 ? (double v13 = 1.0) : (double v13 = 0.92),
              v9 > *(double *)(a1 + 72)))
        {
          double v13 = 0.75;
        }
        CGAffineTransformMakeScale(&v15, v13, v13);
        CGAffineTransform v14 = v15;
        [v8 setTransform:&v14];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_updateControlsVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CAMControlDrawer *)self expandedControl];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = [(CAMControlDrawer *)self visibleControlTypes];
  uint64_t v8 = [v6 setWithArray:v7];

  v12[1] = 3221225472;
  v12[0] = MEMORY[0x263EF8330];
  v12[2] = __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke;
  v12[3] = &unk_263FA0CD0;
  if (v3) {
    double v9 = 0.5;
  }
  else {
    double v9 = 0.0;
  }
  v12[4] = self;
  id v13 = v8;
  id v14 = v5;
  id v10 = v5;
  id v11 = v8;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v12 initialSpringVelocity:0 options:v9 animations:1.0 completion:1.0];
}

void __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke(id *a1)
{
  double v2 = [a1[4] _controlMap];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke_2;
  long long v18 = &unk_263FA0CA8;
  id v19 = a1[5];
  id v20 = a1[6];
  [v2 enumerateKeysAndObjectsUsingBlock:&v15];

  if (objc_msgSend(a1[4], "isFilterScrubberExpanded", v15, v16, v17, v18)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  uint64_t v4 = [a1[4] filterScrubberView];
  [v4 setAlpha:v3];

  if ([a1[4] isApertureSliderExpanded]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  uint64_t v6 = [a1[4] apertureSlider];
  [v6 setAlpha:v5];

  if ([a1[4] isIntensitySliderExpanded]) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  uint64_t v8 = [a1[4] intensitySlider];
  [v8 setAlpha:v7];

  if ([a1[4] isExposureSliderExpanded]) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  id v10 = [a1[4] exposureSlider];
  [v10 setAlpha:v9];

  if ([a1[4] isLowLightSliderExpanded]) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  BOOL v12 = [a1[4] lowLightSlider];
  [v12 setAlpha:v11];

  if ([a1[4] isSemanticStyleControlExpanded]) {
    double v13 = 1.0;
  }
  else {
    double v13 = 0.0;
  }
  id v14 = [a1[4] semanticStyleControl];
  [v14 setAlpha:v13];
}

void __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v9 = a3;
  objc_msgSend(v9, "setAlpha:", (double)objc_msgSend(v5, "containsObject:", a2));
  id v6 = *(id *)(a1 + 40);
  if (v6) {
    BOOL v7 = v6 == v9;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = v7;
  [v9 setUserInteractionEnabled:v8];
}

- (void)_setExpandedControl:(id)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = (CAMControlDrawerExpandableButton *)a3;
  p_expandedControl = (id *)&self->_expandedControl;
  expandedControl = self->_expandedControl;
  if (expandedControl == v9) {
    goto LABEL_23;
  }
  if (v6)
  {
    [(CAMControlDrawer *)self layoutIfNeeded];
    expandedControl = (CAMControlDrawerExpandableButton *)*p_expandedControl;
  }
  if (expandedControl)
  {
    id v12 = *p_expandedControl;
    id *p_expandedControl = 0;
    double v13 = expandedControl;

    [(CAMControlDrawerExpandableButton *)v13 setExpanded:0 animated:v6];
    if (v9) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v5;
    }
    uint64_t v15 = [(CAMControlDrawer *)self presentationDelegate];
    objc_msgSend(v15, "controlDrawer:didChangeExpanded:forControlType:animated:updatePreferredDrawerControl:", self, 0, -[CAMControlDrawerExpandableButton controlType](v13, "controlType"), v6, v14);
  }
  if (v9)
  {
    [(CAMControlDrawer *)self _loadCustomUIIfNeededForControlType:[(CAMControlDrawerExpandableButton *)v9 controlType]];
    if (v6) {
      [(CAMControlDrawer *)self layoutIfNeeded];
    }
  }
  objc_storeStrong((id *)&self->_expandedControl, a3);
  [(CAMControlDrawer *)self setNeedsLayout];
  if (!*p_expandedControl)
  {
    double v29 = [(CAMControlDrawer *)self _scrollView];
    [v29 setScrollEnabled:1];
LABEL_18:

    goto LABEL_19;
  }
  -[CAMControlDrawer bringSubviewToFront:](self, "bringSubviewToFront:");
  [*p_expandedControl setExpanded:1 animated:v6];
  uint64_t v16 = [(CAMControlDrawer *)self _scrollView];
  [v16 setScrollEnabled:0];

  long long v17 = [(CAMControlDrawer *)self _scrollView];
  [v17 stopScrollingAndZooming];

  [(CAMControlDrawerExpandableButton *)v9 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v26 = [(CAMControlDrawer *)self _scrollView];
  char v27 = objc_msgSend(v26, "_isRectFullyVisible:", v19, v21, v23, v25);

  if ((v27 & 1) == 0)
  {
    double v28 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v28, OS_LOG_TYPE_DEFAULT, "Scrolling control drawer to make control visible before expansion", buf, 2u);
    }

    double v29 = [(CAMControlDrawer *)self _scrollView];
    objc_msgSend(v29, "scrollRectToVisible:animated:", 0, v19, v21, v23, v25);
    goto LABEL_18;
  }
LABEL_19:
  if (v6)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __78__CAMControlDrawer__setExpandedControl_animated_updatePreferredDrawerControl___block_invoke;
    v31[3] = &unk_263FA0208;
    v31[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v31 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
  }
  [(CAMControlDrawer *)self _updateControlsScaleAnimated:v6];
  [(CAMControlDrawer *)self _updateControlsVisibilityAnimated:v6];
  if (v9)
  {
    double v30 = [(CAMControlDrawer *)self presentationDelegate];
    objc_msgSend(v30, "controlDrawer:didChangeExpanded:forControlType:animated:updatePreferredDrawerControl:", self, 1, objc_msgSend(*p_expandedControl, "controlType"), v6, v5);
  }
LABEL_23:
}

uint64_t __78__CAMControlDrawer__setExpandedControl_animated_updatePreferredDrawerControl___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)expandableButton:(id)a3 willChangeExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 controlType];
  [(CAMControlDrawer *)self setExpanded:v4 forControlType:v6 animated:1 updatePreferredDrawerControl:1];
}

- (void)menuButtonDidSelectItem:(id)a3
{
  id v4 = a3;
  id v6 = [(CAMControlDrawer *)self delegate];
  uint64_t v5 = [v4 controlType];

  [v6 controlDrawer:self didSelectMenuItemForControlType:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(CAMControlDrawer *)self expandedControl];
  if (v4)
  {
    id v5 = v4;
    [(CAMControlDrawer *)self setNeedsLayout];
    id v4 = v5;
  }
}

- (id)touchingRecognizersToCancel
{
  v6[1] = *MEMORY[0x263EF8340];
  double v2 = [(CAMControlDrawer *)self _scrollView];
  double v3 = [v2 panGestureRecognizer];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(CAMControlDrawer *)self expandedControl];

  if (v8)
  {
    id v9 = [(CAMControlDrawer *)self expandedControl];
    v7[2](v7, v9);
  }
  else
  {
    id v10 = [(CAMControlDrawer *)self _scrollView];
    [v6 locationOfAccessibilityGestureInView:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = [(CAMControlDrawer *)self visibleControlTypes];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          double v21 = [(CAMControlDrawer *)self _controlMap];
          double v22 = [v21 objectForKeyedSubscript:v20];

          [v22 frame];
          v29.double x = v12;
          v29.double y = v14;
          if (CGRectContainsPoint(v30, v29))
          {
            v7[2](v7, v22);

            goto LABEL_13;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CGFloat v12 = &v11;
  uint64_t v13 = 0x3032000000;
  CGFloat v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CAMControlDrawer_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_263FA0458;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CAMControlDrawer *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__CAMControlDrawer_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 hudItemForAccessibilityHUDManager:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __54__CAMControlDrawer_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_263FA0480;
  id v7 = v4;
  id v5 = v4;
  [(CAMControlDrawer *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v6];
}

uint64_t __54__CAMControlDrawer_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectedByAccessibilityHUDManager:*(void *)(a1 + 32)];
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CAMControlDrawer_shouldAccessibilityGestureBeginForHUDManager___block_invoke;
  v7[3] = &unk_263FA0458;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(CAMControlDrawer *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __65__CAMControlDrawer_shouldAccessibilityGestureBeginForHUDManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 shouldAccessibilityGestureBeginForHUDManager:*(void *)(a1 + 32)];
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMControlDrawerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMControlDrawerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMControlDrawerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (CAMControlDrawerPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (NSArray)visibleControlTypes
{
  return self->_visibleControlTypes;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CAMControlDrawerExpandableButton)expandedControl
{
  return self->_expandedControl;
}

- (CEKWheelScrubberView)filterScrubberView
{
  return self->_filterScrubberView;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (CEKSlider)intensitySlider
{
  return self->_intensitySlider;
}

- (CAMLowLightSlider)lowLightSlider
{
  return self->_lowLightSlider;
}

- (CAMExposureSlider)exposureSlider
{
  return self->_exposureSlider;
}

- (CAMSemanticStyleControl)semanticStyleControl
{
  return self->_semanticStyleControl;
}

- (NSMutableDictionary)_controlMap
{
  return self->__controlMap;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_storeStrong((id *)&self->__controlMap, 0);
  objc_storeStrong((id *)&self->_semanticStyleControl, 0);
  objc_storeStrong((id *)&self->_exposureSlider, 0);
  objc_storeStrong((id *)&self->_lowLightSlider, 0);
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_filterScrubberView, 0);
  objc_storeStrong((id *)&self->_expandedControl, 0);
  objc_storeStrong((id *)&self->_visibleControlTypes, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setExpanded:(uint64_t)a1 forControlType:(NSObject *)a2 animated:updatePreferredDrawerControl:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Trying to expand a control that is not expandable: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end