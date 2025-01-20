@interface CCUIDisplayModuleViewController
- (BOOL)_canAdjustBrightness;
- (BOOL)_canShowWhileLocked;
- (BOOL)isGroupRenderingRequired;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (CCUIContinuousSliderView)sliderView;
- (CCUIDisplayModuleViewControllerDelegate)delegate;
- (NSArray)punchOutRenderingViews;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (double)preferredExpandedContinuousCornerRadius;
- (float)_backlightLevel;
- (id)viewForTouchContinuation;
- (unint64_t)contentRenderingMode;
- (void)_noteScreenBrightnessDidChange:(id)a3;
- (void)_setBacklightLevel:(float)a3;
- (void)_sliderEditingDidBegin:(id)a3;
- (void)_sliderEditingDidEnd:(id)a3;
- (void)_sliderPresentationValueDidChange:(id)a3;
- (void)_updateBrightnessControlAvailability;
- (void)_updateBrightnessControlInteractionEnabled;
- (void)_updateWithCurrentBrightnessAnimated:(BOOL)a3;
- (void)dealloc;
- (void)loadView;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphState:(id)a3;
- (void)setSliderView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUIDisplayModuleViewController

- (float)_backlightLevel
{
  unint64_t contentRenderingMode = self->_contentRenderingMode;
  if (contentRenderingMode == 1)
  {
    CCUISliderPreviewRenderingModeValue();
    return v3;
  }
  else if (!contentRenderingMode)
  {
    MEMORY[0x270F10438]();
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v17 viewWillAppear:a3];
  objc_msgSend__updateBrightnessControlAvailability(self, v4, v5);
  objc_msgSend__updateWithCurrentBrightnessAnimated_(self, v6, 0);
  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v7, v8);
  v11 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v9, v10);
  uint64_t v12 = *MEMORY[0x263F1D598];
  v15 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v13, v14);
  objc_msgSend_addObserver_selector_name_object_(v11, v16, (uint64_t)self, sel__noteScreenBrightnessDidChange_, v12, v15);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v9 viewDidDisappear:a3];
  v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v4, v5);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, *MEMORY[0x263F1D598], 0);

  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (void)dealloc
{
  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F33C90]);
  v6 = (CCUIContinuousSliderView *)objc_msgSend_initWithFrame_(v3, v4, v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  sliderView = self->_sliderView;
  self->_sliderView = v6;

  uint64_t v8 = self->_sliderView;
  v11 = objc_msgSend_systemYellowColor(MEMORY[0x263F1C550], v9, v10);
  objc_msgSend_setGlyphTintColor_(v8, v12, (uint64_t)v11);

  v13 = self->_sliderView;
  objc_msgSend__backlightLevel(self, v14, v15);
  objc_msgSend_setValue_animated_(v13, v16, 0);
  objc_msgSend_setInteractiveWhenUnexpanded_(self->_sliderView, v17, 1);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v18, (uint64_t)self, sel__sliderEditingDidBegin_, 0x10000);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v19, (uint64_t)self, sel__sliderPresentationValueDidChange_, *MEMORY[0x263F33C40]);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v20, (uint64_t)self, sel__sliderEditingDidEnd_, 0x40000);
  objc_msgSend_setAccessibilityIdentifier_(self->_sliderView, v21, @"cc-brightness-slider");
  objc_msgSend_setView_(self, v22, (uint64_t)self->_sliderView);

  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v23, v24);
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v17 viewDidLoad];
  id v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x263F34238]);
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = v3;

  objc_initWeak(&location, self);
  uint64_t v5 = self->_brightnessSystemClient;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = sub_240643880;
  uint64_t v14 = &unk_2650CA478;
  objc_copyWeak(&v15, &location);
  objc_msgSend_registerNotificationBlock_forProperties_(v5, v6, (uint64_t)&v11, &unk_26F4C4AE0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v8, v9, v11, v12, v13, v14);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v10, (uint64_t)self);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIDisplayModuleViewController;
  id v7 = a4;
  -[CCUIDisplayModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_240643B30;
  v9[3] = &unk_2650CA4A0;
  v9[4] = self;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v9, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v6 viewWillDisappear:a3];
  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIDisplayModuleViewController;
  [(CCUIDisplayModuleViewController *)&v7 viewWillLayoutSubviews];
  if (self->_expanded) {
    objc_msgSend_preferredExpandedContinuousCornerRadius(self, v3, v4);
  }
  else {
    objc_msgSend_compactContinuousCornerRadius(self, v3, v4);
  }
  objc_msgSend_setContinuousSliderCornerRadius_(self->_sliderView, v5, v6);
}

- (void)setGlyphPackageDescription:(id)a3
{
  id v7 = a3;
  objc_msgSend_loadViewIfNeeded(self, v4, v5);
  objc_msgSend_setGlyphPackageDescription_(self->_sliderView, v6, (uint64_t)v7);
}

- (void)setGlyphState:(id)a3
{
  id v7 = a3;
  objc_msgSend_loadViewIfNeeded(self, v4, v5);
  objc_msgSend_setGlyphState_(self->_sliderView, v6, (uint64_t)v7);
}

- (double)preferredExpandedContentHeight
{
  MEMORY[0x270F188B0](self, a2);
  return result;
}

- (double)preferredExpandedContentWidth
{
  MEMORY[0x270F188B8](self, a2);
  return result;
}

- (double)preferredExpandedContinuousCornerRadius
{
  MEMORY[0x270F188C0](self, a2);
  return result;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    objc_msgSend_viewIfLoaded(self, a2, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v6, v4, v5);
  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_unint64_t contentRenderingMode = a3;
    objc_msgSend__updateWithCurrentBrightnessAnimated_(self, a2, 0);
  }
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_expanded = a3;
  MEMORY[0x270F9A6D0](self->_sliderView, sel_setGlyphVisible_, !a3);
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (id)viewForTouchContinuation
{
  if (objc_msgSend_isUserInteractionEnabled(self->_sliderView, a2, v2)) {
    sliderView = self->_sliderView;
  }
  else {
    sliderView = 0;
  }

  return sliderView;
}

- (BOOL)isGroupRenderingRequired
{
  return ((uint64_t (*)(CCUIContinuousSliderView *, char *))MEMORY[0x270F9A6D0])(self->_sliderView, sel_isGroupRenderingRequired);
}

- (NSArray)punchOutRenderingViews
{
  return (NSArray *)((uint64_t (*)(CCUIContinuousSliderView *, char *))MEMORY[0x270F9A6D0])(self->_sliderView, sel_punchOutRenderingViews);
}

- (void)_setBacklightLevel:(float)a3
{
}

- (BOOL)_canAdjustBrightness
{
  return MEMORY[0x270F10440](self, a2);
}

- (void)_updateBrightnessControlAvailability
{
  sliderView = self->_sliderView;
  uint64_t v5 = objc_msgSend__canAdjustBrightness(self, a2, v2) ^ 1;

  objc_msgSend_setInoperative_(sliderView, v4, v5);
}

- (void)_updateBrightnessControlInteractionEnabled
{
  sliderView = self->_sliderView;
  uint64_t isAppearingOrAppeared = objc_msgSend_bs_isAppearingOrAppeared(self, a2, v2);

  MEMORY[0x270F9A6D0](sliderView, sel_setUserInteractionEnabled_, isAppearingOrAppeared);
}

- (void)_updateWithCurrentBrightnessAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  sliderView = self->_sliderView;
  objc_msgSend__backlightLevel(self, a2, a3);
  objc_msgSend_setValue_animated_(sliderView, v6, v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v7, v8);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v9, (uint64_t)self);
}

- (void)_noteScreenBrightnessDidChange:(id)a3
{
}

- (void)_sliderEditingDidBegin:(id)a3
{
  if (!self->_brightnessTransaction) {
    self->_brightnessTransaction = (BKSDisplayBrightnessTransaction *)BKSDisplayBrightnessTransactionCreate();
  }
}

- (void)_sliderPresentationValueDidChange:(id)a3
{
  if (self->_brightnessTransaction)
  {
    objc_msgSend_presentationValue(a3, a2, (uint64_t)a3);
    objc_msgSend__setBacklightLevel_(self, v4, v5);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v6, v7);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v8, (uint64_t)self);
}

- (void)_sliderEditingDidEnd:(id)a3
{
  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (CCUIDisplayModuleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIDisplayModuleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CCUIContinuousSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end