@interface AXCCTextSizeDetailViewController
- (AXCCTextSizeHelper)helper;
- (BOOL)_canShowWhileLocked;
- (CCUISteppedSliderView)slider;
- (void)_commitTextSizeIfNeeded;
- (void)_refreshTextSizes;
- (void)_setupSlider;
- (void)_sliderValueDidChange:(id)a3;
- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)endTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)loadView;
- (void)perAppTextSizeToggled;
- (void)setHelper:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXCCTextSizeDetailViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F33CE0]);
  v7 = (CCUISteppedSliderView *)objc_msgSend_initWithFrame_(v3, v4, v5, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  slider = self->_slider;
  self->_slider = v7;

  objc_msgSend_setGlyphVisible_(self->_slider, v9, 0, v10);
  objc_msgSend_setView_(self, v11, (uint64_t)self->_slider, v12);
  objc_msgSend_addTarget_action_forControlEvents_(self->_slider, v13, (uint64_t)self, (uint64_t)sel__sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(self->_slider, v14, (uint64_t)self, (uint64_t)sel__sliderValueDidCommit_, 0x40000);
  v15 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F82BC0]);
  selectionFeedback = self->_selectionFeedback;
  self->_selectionFeedback = v15;

  id v17 = objc_alloc(MEMORY[0x263EFF8C0]);
  self->_contentSizeCategories = (NSArray *)objc_msgSend_initWithObjects_(v17, (const char *)*MEMORY[0x263F83400], *MEMORY[0x263F83458], v18, *MEMORY[0x263F83488], *MEMORY[0x263F83470], *MEMORY[0x263F83468], *MEMORY[0x263F83450], *MEMORY[0x263F83440], *MEMORY[0x263F83430], *MEMORY[0x263F83420], *MEMORY[0x263F83418], *MEMORY[0x263F83410], *MEMORY[0x263F83408], *MEMORY[0x263F83400], 0);

  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeDetailViewController;
  [(AXCCTextSizeDetailViewController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  objc_msgSend__refreshTextSizes(self, a2, v2, v3);
  objc_super v8 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v5, v6, v7);
  objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)self, (uint64_t)sel_sizeCategoryDidChange_, *MEMORY[0x263F83428], 0);

  v10.receiver = self;
  v10.super_class = (Class)AXCCTextSizeDetailViewController;
  [(AXCCTextSizeDetailViewController *)&v10 viewDidLoad];
}

- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    objc_msgSend__refreshTextSizes(self, a2, a3, a4);
  }
  v7.receiver = self;
  v7.super_class = (Class)AXCCTextSizeDetailViewController;
  [(AXCCTextSizeDetailViewController *)&v7 beginAppearanceTransition:v5 animated:v4];
}

- (void)endTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240607D34;
  block[3] = &unk_2650C76D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend__refreshTextSizes(self, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeDetailViewController;
  [(AXCCTextSizeDetailViewController *)&v6 viewWillAppear:v4];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend__commitTextSizeIfNeeded(self, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeDetailViewController;
  [(AXCCTextSizeDetailViewController *)&v6 viewDidDisappear:v4];
}

- (CCUISteppedSliderView)slider
{
  objc_msgSend_loadViewIfNeeded(self, a2, v2, v3);
  slider = self->_slider;

  return slider;
}

- (void)setHelper:(id)a3
{
  p_helper = (void **)&self->_helper;
  objc_storeStrong((id *)&self->_helper, a3);
  id v8 = a3;
  objc_msgSend_setDelegate_(*p_helper, v6, (uint64_t)self, v7);
}

- (void)_refreshTextSizes
{
  objc_msgSend__commitTextSizeIfNeeded(self, a2, v2, v3);
  objc_msgSend_refreshAppInfo(self->_helper, v5, v6, v7);
  objc_msgSend_refreshCategoryName(self->_helper, v8, v9, v10);

  MEMORY[0x270F9A6D0](self, sel__setupSlider, v11, v12);
}

- (void)_setupSlider
{
  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  BOOL v5 = (const char *)objc_claimAutoreleasedReturnValue();
  contentSizeCategories = self->_contentSizeCategories;
  id v8 = (void *)*MEMORY[0x263F83468];
  v26 = (char *)v5;
  if (v5) {
    unint64_t v9 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, (uint64_t)v5, v6);
  }
  else {
    unint64_t v9 = objc_msgSend_indexOfObject_(contentSizeCategories, 0, (uint64_t)v8, v6);
  }
  self->_selectedCategoryIndex = v9;
  if (objc_msgSend_state(self->_helper, v10, v11, v12) == 3)
  {
    BOOL v16 = CFPreferencesGetAppBooleanValue(@"largeTextUsesExtendedRange", @"com.apple.preferences-framework", 0) != 0;
    CFPreferencesAppSynchronize(@"com.apple.preferences-framework");
  }
  else
  {
    BOOL v16 = 1;
  }
  if (!v26) {
    v26 = v8;
  }
  id v17 = self->_contentSizeCategories;
  if (v16) {
    uint64_t v19 = objc_msgSend_count(v17, v13, v14, v15) - 1;
  }
  else {
    uint64_t v19 = objc_msgSend_indexOfObject_(v17, v13, *MEMORY[0x263F83430], v15);
  }
  objc_msgSend_setNumberOfSteps_(self->_slider, v18, v19, v20);
  uint64_t v23 = objc_msgSend_indexOfObject_(self->_contentSizeCategories, v21, (uint64_t)v26, v22);
  objc_msgSend_setStep_(self->_slider, v24, (unint64_t)(double)(unint64_t)v23, v25);
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
      uint64_t v10 = AXLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v11, v9, v12);
        int v32 = 138412290;
        v33 = v13;
        _os_log_impl(&dword_240604000, v10, OS_LOG_TYPE_INFO, "Setting new text size change: %@", (uint8_t *)&v32, 0xCu);
      }
      if (self->_selectedCategoryIndex != v9)
      {
        self->_selectedCategoryIndex = v9;
        BOOL v16 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v14, v9, v15);
        objc_msgSend_setCategoryName_(self->_helper, v17, (uint64_t)v16, v18);

        self->_selectedCategoryIndexNeedsCommit = 1;
        uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v19, v20, v21);
        uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v23, v9, v24);
        objc_msgSend_postNotificationName_object_(v22, v26, @"AXCCInternalTextSizeDidUpdate", (uint64_t)v25);

        if (v9 == objc_msgSend_indexOfObject_(self->_contentSizeCategories, v27, *MEMORY[0x263F83468], v28)) {
          objc_msgSend_selectionChanged(self->_selectionFeedback, v29, v30, v31);
        }
      }
    }
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

- (void)perAppTextSizeToggled
{
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);
  objc_storeStrong((id *)&self->_slider, 0);

  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
}

@end