@interface AXCCTextSizeSliderModuleViewController
- (AXCCTextSizeHelper)helper;
- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUISteppedSliderView)sliderView;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContinuousCornerRadius;
- (id)viewForTouchContinuation;
- (int64_t)gridSizeClass;
- (void)_commitTextSizeIfNeeded;
- (void)_postControlCenterStatus;
- (void)_refreshTextSizes;
- (void)_setupSlider;
- (void)_sliderTapped:(id)a3;
- (void)_sliderValueDidChange:(id)a3;
- (void)_sliderValueDidCommit:(id)a3;
- (void)_updateSliderControlInteractionEnabled;
- (void)_updateSliderControlValueVisible;
- (void)_updateTintColor;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)loadView;
- (void)perAppTextSizeToggled;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setHelper:(id)a3;
- (void)setSliderView:(id)a3;
- (void)setTextSizeDelegate:(id)a3;
- (void)updateWithCurrentTextSize:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation AXCCTextSizeSliderModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setHelper:(id)a3
{
  p_helper = (void **)&self->_helper;
  objc_storeStrong((id *)&self->_helper, a3);
  id v8 = a3;
  objc_msgSend_setDelegate_(*p_helper, v6, (uint64_t)self, v7);
}

- (void)_updateTintColor
{
  objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x263F82818], a2, 6, v2, 25.0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (self->gridSizeClass == 1) {
    objc_msgSend_systemBlueColor(MEMORY[0x263F825C8], v4, v5, v6);
  }
  else {
  uint64_t v7 = objc_msgSend_systemWhiteColor(MEMORY[0x263F825C8], v4, v5, v6);
  }
  v9 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F827E8], v8, @"textformat.size", (uint64_t)v14);
  objc_msgSend_setGlyphImage_(self->_sliderView, v10, (uint64_t)v9, v11);

  objc_msgSend_setGlyphTintColor_(self->_sliderView, v12, (uint64_t)v7, v13);
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v5 = (NSArray *)objc_msgSend_initWithObjects_(v3, (const char *)*MEMORY[0x263F83400], *MEMORY[0x263F83458], v4, *MEMORY[0x263F83488], *MEMORY[0x263F83470], *MEMORY[0x263F83468], *MEMORY[0x263F83450], *MEMORY[0x263F83440], *MEMORY[0x263F83430], *MEMORY[0x263F83420], *MEMORY[0x263F83418], *MEMORY[0x263F83410], *MEMORY[0x263F83408], *MEMORY[0x263F83400], 0);
  contentSizeCategories = self->_contentSizeCategories;
  self->_contentSizeCategories = v5;

  id v7 = objc_alloc(MEMORY[0x263F33CE0]);
  uint64_t v11 = (CCUISteppedSliderView *)objc_msgSend_initWithFrame_(v7, v8, v9, v10, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  sliderView = self->_sliderView;
  self->_sliderView = v11;

  objc_msgSend__refreshTextSizes(self, v13, v14, v15);
  objc_msgSend_updateWithCurrentTextSize_(self, v16, 0, v17);
  objc_msgSend__updateSliderControlInteractionEnabled(self, v18, v19, v20);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v21, (uint64_t)self, (uint64_t)sel__sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v22, (uint64_t)self, (uint64_t)sel__sliderValueDidCommit_, 0x40000);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v23, (uint64_t)self, (uint64_t)sel__sliderTapped_, 64);
  objc_msgSend__updateTintColor(self, v24, v25, v26);
  if (!self->gridSizeClass) {
    objc_msgSend_setUserInteractionEnabled_(self->_sliderView, v27, 0, v28);
  }
  v29 = self->_sliderView;
  v30 = AXCCLocalizedString(@"text.size.label");
  objc_msgSend_setAccessibilityLabel_(v29, v31, (uint64_t)v30, v32);

  objc_msgSend_setInteractiveWhenUnexpanded_(self->_sliderView, v33, 1, v34);
  v37 = self->_sliderView;

  objc_msgSend_setView_(self, v35, (uint64_t)v37, v36);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  [(AXCCTextSizeSliderModuleViewController *)&v7 viewWillDisappear:a3];
  objc_msgSend__updateSliderControlInteractionEnabled(self, v4, v5, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  [(AXCCTextSizeSliderModuleViewController *)&v15 viewWillAppear:a3];
  objc_msgSend__refreshTextSizes(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v7, v8, v9);
  objc_msgSend_addObserver_selector_name_object_(v10, v11, (uint64_t)self, (uint64_t)sel_sizeCategoryDidChange_, *MEMORY[0x263F83428], 0);

  objc_msgSend__updateSliderControlInteractionEnabled(self, v12, v13, v14);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24061164C;
  v5[3] = &unk_2650C7948;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2406116B4;
  v4[3] = &unk_2650C7948;
  objc_msgSend_animateAlongsideTransition_completion_(a4, a2, (uint64_t)v5, (uint64_t)v4);
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  [(AXCCTextSizeSliderModuleViewController *)&v9 viewWillLayoutSubviews];
  if (self->_expanded) {
    objc_msgSend_preferredExpandedContinuousCornerRadius(self, v3, v4, v5);
  }
  else {
    objc_msgSend_compactContinuousCornerRadius(self, v3, v4, v5);
  }
  objc_msgSend_setContinuousSliderCornerRadius_(self->_sliderView, v6, v7, v8);
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return !self->_expanded && self->gridSizeClass == 0;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    objc_msgSend_viewIfLoaded(self, a2, v3, v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v8, v5, v6, v7);
  }
}

- (double)preferredExpandedContinuousCornerRadius
{
  MEMORY[0x270F188C0](self, a2);
  return result;
}

- (void)_updateSliderControlValueVisible
{
  if (self->_expanded) {
    objc_msgSend_setValueVisible_(self->_sliderView, a2, 1, v2);
  }
  else {
    objc_msgSend_setValueVisible_(self->_sliderView, a2, self->gridSizeClass != 0, v2);
  }

  objc_msgSend__updateTintColor(self, v4, v5, v6);
}

- (void)_updateSliderControlInteractionEnabled
{
  sliderView = self->_sliderView;
  if (self->gridSizeClass)
  {
    uint64_t isAppearingOrAppeared = objc_msgSend_bs_isAppearingOrAppeared(self, a2, v2, v3);
    objc_msgSend_setUserInteractionEnabled_(sliderView, v7, isAppearingOrAppeared, v8);
  }
  else
  {
    objc_msgSend_setUserInteractionEnabled_(sliderView, a2, 0, v3);
  }

  MEMORY[0x270F9A6D0](self, sel__updateSliderControlValueVisible, v9, v10);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v4 = a3;
  self->_expanded = a3;
  objc_msgSend__refreshTextSizes(self, a2, a3, v3);
  objc_msgSend_setGlyphVisible_(self->_sliderView, v6, !v4, v7);
  objc_msgSend_setUserInteractionEnabled_(self->_sliderView, v8, 0, v9);

  MEMORY[0x270F9A6D0](self, sel__updateSliderControlValueVisible, v10, v11);
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  if (a3 || self->gridSizeClass) {
    objc_msgSend_setUserInteractionEnabled_(self->_sliderView, a2, 1, v3);
  }
}

- (void)_commitTextSizeIfNeeded
{
  if (self->_selectedCategoryIndexNeedsCommit)
  {
    self->_selectedCategoryIndexNeedsCommit = 0;
    BOOL v4 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, a2, self->_selectedCategoryIndex, v2);
    objc_msgSend_setCategoryName_(self->_helper, v5, (uint64_t)v4, v6);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263F8B110];
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 1u);
  }
}

- (void)_refreshTextSizes
{
  objc_msgSend__commitTextSizeIfNeeded(self, a2, v2, v3);
  objc_msgSend_refreshAppInfo(self->_helper, v5, v6, v7);
  objc_msgSend_refreshCategoryName(self->_helper, v8, v9, v10);

  MEMORY[0x270F9A6D0](self, sel__setupSlider, v11, v12);
}

- (void)updateWithCurrentTextSize:(BOOL)a3
{
  BOOL v4 = a3;
  sliderView = self->_sliderView;
  contentSizeCategories = self->_contentSizeCategories;
  objc_msgSend_categoryName(self->_helper, a2, a3, v3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v9 = (double)(unint64_t)objc_msgSend_indexOfObject_(contentSizeCategories, v7, (uint64_t)v12, v8);
  *(float *)&double v9 = v9;
  objc_msgSend_setValue_animated_(sliderView, v10, v4, v11, v9);
}

- (void)_setupSlider
{
  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  contentSizeCategories = self->_contentSizeCategories;
  double v9 = (void *)*MEMORY[0x263F83468];
  if (v7) {
    unint64_t v10 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, (uint64_t)v7, v6);
  }
  else {
    unint64_t v10 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, *MEMORY[0x263F83468], v6);
  }
  self->_selectedCategoryIndex = v10;
  if (objc_msgSend_state(self->_helper, v11, v12, v13) == 3)
  {
    BOOL v17 = CFPreferencesGetAppBooleanValue(@"largeTextUsesExtendedRange", @"com.apple.preferences-framework", 0) != 0;
    CFPreferencesAppSynchronize(@"com.apple.preferences-framework");
    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = 1;
    if (v7) {
      goto LABEL_9;
    }
  }
  id v7 = v9;
LABEL_9:
  v18 = self->_contentSizeCategories;
  if (v17) {
    uint64_t v20 = objc_msgSend_count(v18, v14, v15, v16) - 1;
  }
  else {
    uint64_t v20 = objc_msgSend_indexOfObject_(v18, v14, *MEMORY[0x263F83430], v16);
  }
  objc_msgSend_setNumberOfSteps_(self->_sliderView, v19, v20, v21);
  id v22 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_sliderValueDidChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend_step(a3, a2, (uint64_t)a3, v3);
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v9 = v5;
    if (v5 < objc_msgSend_count(self->_contentSizeCategories, v6, v7, v8))
    {
      unint64_t v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v11, v9, v12);
        int v32 = 138412290;
        v33 = v13;
        _os_log_impl(&dword_240604000, v10, OS_LOG_TYPE_INFO, "Setting new text size change: %@", (uint8_t *)&v32, 0xCu);
      }
      if (self->_selectedCategoryIndex != v9)
      {
        self->_selectedCategoryIndex = v9;
        self->_selectedCategoryIndexNeedsCommit = 1;
        if (self->_expanded)
        {
          uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v14, v9, v15);
          objc_msgSend_setCategoryName_(self->_helper, v17, (uint64_t)v16, v18);

          id v22 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v19, v20, v21);
          uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v23, v9, v24);
          objc_msgSend_postNotificationName_object_(v22, v26, @"AXCCInternalTextSizeDidUpdate", (uint64_t)v25);

          if (v9 == objc_msgSend_indexOfObject_(self->_contentSizeCategories, v27, *MEMORY[0x263F83468], v28)) {
            objc_msgSend_selectionChanged(self->_selectionFeedback, v29, v30, v31);
          }
        }
      }
    }
  }
}

- (void)_sliderValueDidCommit:(id)a3
{
  objc_msgSend__commitTextSizeIfNeeded(self, a2, (uint64_t)a3, v3);

  MEMORY[0x270F9A6D0](self, sel__postControlCenterStatus, v5, v6);
}

- (void)_sliderTapped:(id)a3
{
  if (!self->_expanded)
  {
    objc_msgSend__commitTextSizeIfNeeded(self, a2, (uint64_t)a3, v3);
    MEMORY[0x270F9A6D0](self, sel__postControlCenterStatus, v5, v6);
  }
}

- (void)_postControlCenterStatus
{
  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  AXTextSizePercentage();
  uint64_t v5 = NSString;
  uint64_t v6 = AXCCLocalizedString(@"text.control.center.status");
  uint64_t v7 = AXFormatFloatWithPercentage();
  unint64_t v10 = objc_msgSend_localizedStringWithFormat_(v5, v8, (uint64_t)v6, v9, v7);

  uint64_t v14 = objc_msgSend_contentModuleContext(self, v11, v12, v13);
  uint64_t v16 = objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x263F33CD8], v15, (uint64_t)v10, 0);
  objc_msgSend_enqueueStatusUpdate_(v14, v17, (uint64_t)v16, v18);
}

- (id)viewForTouchContinuation
{
  if (objc_msgSend_isUserInteractionEnabled(self->_sliderView, a2, v2, v3)) {
    sliderView = self->_sliderView;
  }
  else {
    sliderView = 0;
  }

  return sliderView;
}

- (void)perAppTextSizeToggled
{
}

- (int64_t)gridSizeClass
{
  return self->gridSizeClass;
}

- (void)setGridSizeClass:(int64_t)a3
{
  self->gridSizeClass = a3;
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textSizeDelegate);

  return (AXCCTextSizeModuleViewControllerDelegate *)WeakRetained;
}

- (void)setTextSizeDelegate:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (CCUISteppedSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_destroyWeak((id *)&self->_textSizeDelegate);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);

  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
}

@end