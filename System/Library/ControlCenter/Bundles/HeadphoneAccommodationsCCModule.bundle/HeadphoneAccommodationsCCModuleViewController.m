@interface HeadphoneAccommodationsCCModuleViewController
- (BOOL)_canShowWhileLocked;
- (HeadphoneAccommodationsCCModuleViewController)init;
- (double)preferredExpandedContentHeight;
- (id)shortcutViewController;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)expandModule;
- (void)setContentModuleContext:(id)a3;
- (void)shortcutDidChangeSize:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HeadphoneAccommodationsCCModuleViewController

- (HeadphoneAccommodationsCCModuleViewController)init
{
  v21.receiver = self;
  v21.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
  v2 = [(HeadphoneAccommodationsCCModuleViewController *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F474D8]);
    uint64_t v5 = objc_msgSend_initWithDelegate_andAvailableModules_(v3, v4, (uint64_t)v2, (uint64_t)&unk_26F84C410);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v5;

    objc_msgSend_setPrefersContentToAlwaysExpand_(v2->_shortcutController, v7, 1, v8);
    objc_msgSend_addChildViewController_(v2, v9, (uint64_t)v2->_shortcutController, v10);
    objc_msgSend_didMoveToParentViewController_(v2->_shortcutController, v11, (uint64_t)v2, v12);
    v15 = objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x263F1C6C8], v13, 3, v14, 30.0);
    v17 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v16, @"headphones", (uint64_t)v15);
    objc_msgSend_setGlyphImage_(v2, v18, (uint64_t)v17, v19);
  }
  return v2;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
  [(CCUIButtonModuleViewController *)&v41 viewDidLoad];
  v6 = objc_msgSend_view(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  objc_msgSend_addSubview_(v6, v11, (uint64_t)v10, v12);

  objc_initWeak(&location, self);
  v16 = objc_msgSend_buttonView(self, v13, v14, v15);
  v17 = paLocString();
  objc_msgSend_setAccessibilityLabel_(v16, v18, (uint64_t)v17, v19);

  v23 = objc_msgSend_buttonView(self, v20, v21, v22);
  objc_msgSend_setAccessibilityIdentifier_(v23, v24, @"AX_HEADPHONE_ACCOMMODATIONS", v25);

  v29 = objc_msgSend_buttonView(self, v26, v27, v28);
  v30 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  objc_msgSend_setAccessibilityHint_(v29, v31, (uint64_t)v30, v32);

  v33 = paLocString();
  objc_msgSend_setTitle_(self, v34, (uint64_t)v33, v35);

  objc_msgSend_setValueText_(self, v36, 0, v37);
  objc_msgSend_setSelectedValueText_(self, v38, 0, v39);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
  [(CCUIButtonModuleViewController *)&v15 viewWillLayoutSubviews];
  int isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  uint64_t v14 = v10;
  if (isExpanded) {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 1.0);
  }
  else {
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 0.0);
  }
}

- (void)shortcutDidChangeSize:(id)a3
{
  uint64_t v5 = objc_msgSend_view(self, a2, (uint64_t)a3, v3);
  objc_msgSend_bounds(v5, v6, v7, v8);
  objc_msgSend_preferredExpandedContentHeight(self, v9, v10, v11);

  if (objc_msgSend_isExpanded(self, v12, v13, v14))
  {
    MEMORY[0x270F9A6D0](self, sel_setPreferredContentSize_, v15, v16);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (double)preferredExpandedContentHeight
{
  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (void)setContentModuleContext:(id)a3
{
  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)expandModule
{
  objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v7, v4, v5, v6);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
}

- (void).cxx_destruct
{
}

@end