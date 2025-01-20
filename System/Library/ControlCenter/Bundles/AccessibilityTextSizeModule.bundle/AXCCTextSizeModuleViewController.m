@interface AXCCTextSizeModuleViewController
- (AXCCTextSizeHelper)helper;
- (AXCCTextSizeModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate;
- (BOOL)_canShowWhileLocked;
- (CCUIContentModuleContext)contentModuleContext;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (id)createSliderView;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)setContentModuleContext:(id)a3;
- (void)setHelper:(id)a3;
- (void)setTextSizeDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AXCCTextSizeModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXCCTextSizeModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeModuleViewController;
  v4 = [(CCUIButtonModuleViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(AXCCTextSizeDetailViewController);
    detailController = v4->_detailController;
    v4->_detailController = v5;
  }
  return v4;
}

- (void)setHelper:(id)a3
{
  objc_msgSend_setHelper_(self->_detailController, a2, (uint64_t)a3, v3);
}

- (void)viewDidLoad
{
  v55.receiver = self;
  v55.super_class = (Class)AXCCTextSizeModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v55 viewDidLoad];
  v5 = objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x263F82818], v3, 5, v4, 27.0);
  v7 = objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x263F827E8], v6, @"textformat.size", (uint64_t)v5);
  objc_msgSend_setGlyphImage_(self, v8, (uint64_t)v7, v9);
  v13 = objc_msgSend_view(self, v10, v11, v12);
  v17 = objc_msgSend_buttonView(self, v14, v15, v16);
  objc_msgSend_addChildViewController_(self, v18, (uint64_t)self->_detailController, v19);
  v23 = objc_msgSend_view(self->_detailController, v20, v21, v22);
  objc_msgSend_bounds(v13, v24, v25, v26);
  objc_msgSend_setFrame_(v23, v27, v28, v29);

  objc_msgSend_didMoveToParentViewController_(self->_detailController, v30, (uint64_t)self, v31);
  v35 = objc_msgSend_slider(self->_detailController, v32, v33, v34);
  v36 = AXCCLocalizedString(@"text.size.label");
  objc_msgSend_setAccessibilityLabel_(v35, v37, (uint64_t)v36, v38);

  objc_msgSend_setIsAccessibilityElement_(v17, v39, 1, v40);
  v41 = AXCCLocalizedString(@"text.size.label");
  objc_msgSend_setAccessibilityLabel_(v17, v42, (uint64_t)v41, v43);

  objc_msgSend_setAccessibilityTraits_(v17, v44, *MEMORY[0x263F83260], v45);
  objc_msgSend_setAccessibilityIdentifier_(v17, v46, @"text-size", v47);
  objc_initWeak(&location, v17);
  objc_initWeak(&from, self);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_240609B6C;
  v50[3] = &unk_2650C76F8;
  objc_copyWeak(&v51, &location);
  objc_copyWeak(&v52, &from);
  objc_msgSend_setAccessibilityPathBlock_(v17, v48, (uint64_t)v50, v49);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXCCTextSizeModuleViewController;
  -[CCUISliderButtonModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_240609D2C;
  v10[3] = &unk_2650C7740;
  double v12 = width;
  double v13 = height;
  v10[4] = self;
  id v11 = v7;
  id v8 = v7;
  objc_msgSend_animateAlongsideTransition_completion_(v8, v9, (uint64_t)&unk_26F4BC108, (uint64_t)v10);
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeModuleViewController;
  [(CCUISliderButtonModuleViewController *)&v8 viewWillLayoutSubviews];
  uint64_t isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  objc_msgSend_beginAppearanceTransition_animated_(self->_detailController, v7, isExpanded, 1);
}

- (id)createSliderView
{
  return (id)objc_msgSend_slider(self->_detailController, a2, v2, v3);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  objc_msgSend_textSizeDelegate(self, a2, (uint64_t)a3, (uint64_t)a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandModule(v7, v4, v5, v6);
}

- (id)_accessibilityControlCenterButtonLabel
{
  return AXCCLocalizedString(@"text.size.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"text-size";
}

- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textSizeDelegate);

  return (AXCCTextSizeModuleViewControllerDelegate *)WeakRetained;
}

- (void)setTextSizeDelegate:(id)a3
{
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_textSizeDelegate);

  objc_storeStrong((id *)&self->_detailController, 0);
}

@end