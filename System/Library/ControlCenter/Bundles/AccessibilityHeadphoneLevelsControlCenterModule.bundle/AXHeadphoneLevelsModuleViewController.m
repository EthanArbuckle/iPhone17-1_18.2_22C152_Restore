@interface AXHeadphoneLevelsModuleViewController
- (AXHeadphoneLevelsModuleViewController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)canDismissPresentedContent;
- (double)preferredExpandedContentHeight;
- (id)shortcutViewController;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)headphoneLevelsIconButtonTapped;
- (void)setContentModuleContext:(id)a3;
- (void)shortcutDidChangeSize:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AXHeadphoneLevelsModuleViewController

- (AXHeadphoneLevelsModuleViewController)init
{
  v22.receiver = self;
  v22.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  v2 = [(AXHeadphoneLevelsModuleViewController *)&v22 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F474D8]);
    uint64_t v5 = objc_msgSend_initWithDelegate_andAvailableModules_(v3, v4, (uint64_t)v2, (uint64_t)&unk_26F84A040);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v5;

    objc_msgSend_setPrefersContentToAlwaysExpand_(v2->_shortcutController, v7, 1, v8);
    v9 = (void *)MEMORY[0x263F1C6B0];
    v10 = (void *)MEMORY[0x263F086E0];
    uint64_t v11 = objc_opt_class();
    v14 = objc_msgSend_bundleForClass_(v10, v12, v11, v13);
    v16 = objc_msgSend_imageNamed_inBundle_(v9, v15, @"headphones.dots", (uint64_t)v14);
    objc_msgSend_setGlyphImage_(v2, v17, (uint64_t)v16, v18);

    objc_msgSend_addChildViewController_(v2, v19, (uint64_t)v2->_shortcutController, v20);
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  [(CCUIButtonModuleViewController *)&v47 viewDidLoad];
  v6 = objc_msgSend_view(self, v3, v4, v5);
  v10 = objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  objc_msgSend_addSubview_(v6, v11, (uint64_t)v10, v12);

  uint64_t v13 = hearingLocString();
  objc_msgSend_setTitle_(self, v14, (uint64_t)v13, v15);

  objc_msgSend_setValueText_(self, v16, 0, v17);
  objc_msgSend_setSelectedValueText_(self, v18, 0, v19);
  objc_initWeak(&location, self);
  v23 = objc_msgSend_buttonView(self, v20, v21, v22);
  objc_msgSend_setAccessibilityTraits_(v23, v24, *MEMORY[0x263F1CEE8], v25);

  v29 = objc_msgSend_buttonView(self, v26, v27, v28);
  v30 = hearingLocString();
  objc_msgSend_setAccessibilityLabel_(v29, v31, (uint64_t)v30, v32);

  v36 = objc_msgSend_buttonView(self, v33, v34, v35);
  objc_msgSend_setAccessibilityIdentifier_(v36, v37, @"AX_HEADPHONE_LEVELS", v38);

  v42 = objc_msgSend_buttonView(self, v39, v40, v41);
  v43 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  objc_msgSend_setAccessibilityHint_(v42, v44, (uint64_t)v43, v45);

  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  [(CCUIButtonModuleViewController *)&v15 viewWillLayoutSubviews];
  int isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  v10 = objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  v14 = v10;
  if (isExpanded) {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 0.0);
  }
}

- (BOOL)canDismissPresentedContent
{
  uint64_t v4 = objc_msgSend_expandedController(self->_shortcutController, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)shortcutDidChangeSize:(id)a3
{
  BOOL v5 = objc_msgSend_view(self, a2, (uint64_t)a3, v3);
  objc_msgSend_bounds(v5, v6, v7, v8);
  objc_msgSend_preferredExpandedContentHeight(self, v9, v10, v11);

  if (objc_msgSend_isExpanded(self, v12, v13, v14))
  {
    MEMORY[0x270F9A6D0](self, sel_setPreferredContentSize_, v15, v16);
  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  HAInitializeLogging();
  uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"Dismissing Control Center", v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s:%d %@", v11, "-[AXHeadphoneLevelsModuleViewController dismissPresentedContentAnimated:completion:]", 101, v9);
  uint64_t v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    uint64_t v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = objc_msgSend_UTF8String(v14, v16, v17, v18);
    _os_log_impl(&dword_242774000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v22 = objc_msgSend_presentedViewController(self, v19, v20, v21);
  objc_msgSend_dismissViewControllerAnimated_completion_(v22, v23, v4, (uint64_t)v6);
}

- (double)preferredExpandedContentHeight
{
  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
}

- (void)headphoneLevelsIconButtonTapped
{
  BOOL v4 = objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  objc_msgSend_requestExpandModule(v4, v5, v6, v7);

  uint64_t v8 = AXLogAggregate();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_242774000, v8, OS_LOG_TYPE_INFO, "Live headphone level opened", v9, 2u);
  }
}

- (void).cxx_destruct
{
}

@end