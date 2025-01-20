@interface HUICCMenuTextView
- (BOOL)_updateIsSubModule;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (BOOL)isLargeText;
- (BOOL)isSubModule;
- (BOOL)providesOwnSeparator;
- (CCUIContentModuleDetailTransitioningDelegate)detailTransitioningDelegate;
- (CGPoint)accessibilityActivationPoint;
- (HACCCapsuleTitleView)titleView;
- (HACCContentModuleDelegate)delegate;
- (HACCStackView)stackView;
- (HUICCMenuTextView)initWithModule:(unint64_t)a3 andDelegate:(id)a4;
- (NSLayoutConstraint)titleViewHeightLayout;
- (UITapGestureRecognizer)tapRecognizer;
- (_HUIDarkTextView)textView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)contentValue;
- (id)presentVCBlock;
- (unint64_t)accessibilityTraits;
- (unint64_t)module;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_setupTitleView;
- (void)_showMenuViewController;
- (void)_updateMenuItemsForViewController:(id)a3;
- (void)_updatePresentedMenuViewControllerIfNecessary;
- (void)setDelegate:(id)a3;
- (void)setDetailTransitioningDelegate:(id)a3;
- (void)setIsLargeText:(BOOL)a3;
- (void)setIsSubModule:(BOOL)a3;
- (void)setModule:(unint64_t)a3;
- (void)setPresentVCBlock:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleViewHeightLayout:(id)a3;
- (void)updateValue;
@end

@implementation HUICCMenuTextView

- (HUICCMenuTextView)initWithModule:(unint64_t)a3 andDelegate:(id)a4
{
  v39[5] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HUICCMenuTextView;
  v7 = -[HUICCMenuTextView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    [(HUICCMenuTextView *)v7 setModule:a3];
    [(HUICCMenuTextView *)v8 setDelegate:v6];
    v9 = objc_alloc_init(HACCStackView);
    id v37 = v6;
    stackView = v8->_stackView;
    v8->_stackView = v9;

    [(HACCStackView *)v8->_stackView setAxis:1];
    [(HACCStackView *)v8->_stackView setAlignment:0];
    [(HACCStackView *)v8->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUICCMenuTextView *)v8 addSubview:v8->_stackView];
    v11 = objc_alloc_init(HACCCapsuleTitleView);
    titleView = v8->_titleView;
    v8->_titleView = v11;

    [(HACCCapsuleTitleView *)v8->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = objc_alloc_init(_HUIDarkTextView);
    textView = v8->_textView;
    v8->_textView = v13;

    [(_HUIDarkTextView *)v8->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8->_isSubModule = [(HUICCMenuTextView *)v8 _updateIsSubModule];
    [(HUICCMenuTextView *)v8 _setupTitleView];
    v30 = (void *)MEMORY[0x263F08938];
    v36 = [(HACCStackView *)v8->_stackView leadingAnchor];
    v35 = [(HUICCMenuTextView *)v8 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v39[0] = v34;
    v33 = [(HACCStackView *)v8->_stackView trailingAnchor];
    v32 = [(HUICCMenuTextView *)v8 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v39[1] = v31;
    v29 = [(HACCStackView *)v8->_stackView topAnchor];
    v15 = [(HUICCMenuTextView *)v8 topAnchor];
    v16 = [v29 constraintEqualToAnchor:v15];
    v39[2] = v16;
    v17 = [(HACCStackView *)v8->_stackView bottomAnchor];
    v18 = [(HUICCMenuTextView *)v8 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v39[3] = v19;
    v20 = [(HUICCMenuTextView *)v8 textView];
    v21 = [v20 heightAnchor];
    v22 = [v21 constraintGreaterThanOrEqualToConstant:52.0];
    v39[4] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:5];
    [v30 activateConstraints:v23];

    id v6 = v37;
    v24 = [(HACCCapsuleTitleView *)v8->_titleView heightAnchor];
    uint64_t v25 = [v24 constraintGreaterThanOrEqualToConstant:52.0];
    titleViewHeightLayout = v8->_titleViewHeightLayout;
    v8->_titleViewHeightLayout = (NSLayoutConstraint *)v25;

    v27 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v8 action:sel__handleTapGestureRecognizer_];
    [v27 setDelegate:v8];
    [(_HUIDarkTextView *)v8->_textView addGestureRecognizer:v27];
  }
  return v8;
}

- (BOOL)providesOwnSeparator
{
  unint64_t v2 = [(HUICCMenuTextView *)self module];
  return v2 == 16 || v2 == 19;
}

- (BOOL)_updateIsSubModule
{
  BOOL v3 = [(HUICCMenuTextView *)self providesOwnSeparator];
  if (v3)
  {
    unint64_t v4 = [(HUICCMenuTextView *)self module] - 1;
    v5 = [(HUICCMenuTextView *)self delegate];
    LOBYTE(v4) = [v5 shouldDisplayControlForModule:v4];

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)setIsSubModule:(BOOL)a3
{
  if (self->_isSubModule != a3)
  {
    self->_isSubModule = a3;
    [(HUICCMenuTextView *)self _setupTitleView];
  }
}

- (void)_setupTitleView
{
  BOOL v3 = [(HUICCMenuTextView *)self stackView];
  unint64_t v4 = [(HUICCMenuTextView *)self titleView];
  [v3 removeArrangedSubview:v4];

  v5 = [(HUICCMenuTextView *)self stackView];
  id v6 = [(HUICCMenuTextView *)self textView];
  [v5 removeArrangedSubview:v6];

  LODWORD(v6) = [(HUICCMenuTextView *)self isSubModule];
  v7 = [(HUICCMenuTextView *)self stackView];
  if (v6)
  {
    v8 = [(HUICCMenuTextView *)self textView];
    [v7 addArrangedSubview:v8 withPartialSeparator:1 withDarkBackground:1];

    v9 = [(HUICCMenuTextView *)self titleViewHeightLayout];
    LODWORD(v8) = [v9 isActive];

    if (!v8) {
      return;
    }
    id v14 = [(HUICCMenuTextView *)self titleViewHeightLayout];
    [v14 setActive:0];
  }
  else
  {
    uint64_t v10 = [(HUICCMenuTextView *)self titleView];
    objc_msgSend(v7, "addArrangedSubview:withSeparator:", v10, -[HUICCMenuTextView providesOwnSeparator](self, "providesOwnSeparator"));

    v11 = [(HUICCMenuTextView *)self titleViewHeightLayout];
    LOBYTE(v10) = [v11 isActive];

    if ((v10 & 1) == 0)
    {
      v12 = [(HUICCMenuTextView *)self titleViewHeightLayout];
      [v12 setActive:1];
    }
    id v14 = [(HUICCMenuTextView *)self stackView];
    v13 = [(HUICCMenuTextView *)self textView];
    [v14 addArrangedSubview:v13 withSeparator:1];
  }
}

- (void)setIsLargeText:(BOOL)a3
{
  if (self->_isLargeText != a3)
  {
    BOOL v3 = a3;
    self->_isLargeText = a3;
    id v4 = [(HUICCMenuTextView *)self textView];
    [v4 updateLayout:v3];
  }
}

- (void)updateValue
{
  BOOL v3 = [MEMORY[0x263F47568] sharedUtilities];
  id v4 = [v3 routingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HUICCMenuTextView_updateValue__block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __32__HUICCMenuTextView_updateValue__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) delegate];
  BOOL v3 = [v2 currentHearingDevice];

  switch([*(id *)(a1 + 32) module])
  {
    case 15:
      id v4 = hearingLocString();
      v5 = hearingLocString();
      id v6 = hearingLocString();
      v7 = [v3 leftSelectedProgram];
      goto LABEL_5;
    case 16:
    case 17:
      id v4 = hearingLocString();
      v5 = hearingLocString();
      id v6 = hearingLocString();
      v7 = [v3 rightSelectedProgram];
LABEL_5:
      v9 = v7;
      goto LABEL_11;
    case 18:
      id v4 = hearingLocString();
      v5 = hearingLocString();
      id v6 = hearingLocString();
      uint64_t v10 = [v3 leftSelectedStreamingProgram];
      goto LABEL_8;
    case 19:
    case 20:
      id v4 = hearingLocString();
      v5 = hearingLocString();
      id v6 = hearingLocString();
      uint64_t v10 = [v3 rightSelectedStreamingProgram];
LABEL_8:
      v9 = v10;
      if [v10 isMixingStream] && (objc_msgSend(v9, "isSelected"))
      {
        v7 = v9;
LABEL_11:
        uint64_t v11 = [v7 name];
      }
      else
      {
        uint64_t v11 = hearingLocString();
      }
      goto LABEL_14;
    case 21:
      id v4 = hearingLocString();
      v5 = hearingLocString();
      id v6 = hearingLocString();
      v9 = [MEMORY[0x263F47550] sharedInstance];
      [v9 preferredInputEar];
      inputOptionFromHearingEar();
      uint64_t v11 = hearingInputRouteStringForOption();
LABEL_14:
      v8 = (void *)v11;

      break;
    default:
      v8 = 0;
      id v6 = 0;
      v5 = 0;
      id v4 = 0;
      break;
  }
  v16 = v4;
  v17 = v5;
  v18 = v6;
  id v12 = v8;
  id v13 = v6;
  id v14 = v5;
  id v15 = v4;
  AXPerformBlockOnMainThread();
}

uint64_t __32__HUICCMenuTextView_updateValue__block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) titleView];
  BOOL v3 = [v2 titleLabel];
  [v3 setText:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) textView];
  v5 = [v4 nameLabel];
  [v5 setText:*(void *)(a1 + 48)];

  id v6 = [*(id *)(a1 + 32) textView];
  v7 = [v6 nameLabel];
  [v7 setAccessibilityLabel:*(void *)(a1 + 56)];

  v8 = [*(id *)(a1 + 32) textView];
  v9 = [v8 valueLabel];
  [v9 setText:*(void *)(a1 + 64)];

  objc_msgSend(*(id *)(a1 + 32), "setIsSubModule:", objc_msgSend(*(id *)(a1 + 32), "_updateIsSubModule"));
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = HUICCLargeTextEnabled();
  return [v10 setIsLargeText:v11];
}

- (id)contentValue
{
  return 0;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    [(HUICCMenuTextView *)self _showMenuViewController];
  }
}

- (void)_showMenuViewController
{
  BOOL v3 = [(HUICCMenuTextView *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(HUICCMenuTextView *)self delegate];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F33C88]) initWithAnchoringViewController:v5];
    [(HUICCMenuTextView *)self setDetailTransitioningDelegate:v6];
  }
  uint64_t v10 = objc_alloc_init(HACCMenuModuleViewController);
  v7 = [(HUICCMenuTextView *)self delegate];
  [(HACCMenuModuleViewController *)v10 setDelegate:v7];

  [(CCUIButtonModuleViewController *)v10 setExpanded:1];
  [(CCUIMenuModuleViewController *)v10 setShouldProvideOwnPlatter:1];
  [(CCUIMenuModuleViewController *)v10 setIndentation:1];
  [(CCUIMenuModuleViewController *)v10 setUseTrailingCheckmarkLayout:1];
  [(HACCMenuModuleViewController *)v10 setModalPresentationStyle:4];
  [(HACCMenuModuleViewController *)v10 setTransitioningDelegate:self->_detailTransitioningDelegate];
  [(HUICCMenuTextView *)self _updateMenuItemsForViewController:v10];
  v8 = [(HUICCMenuTextView *)self presentVCBlock];

  if (v8)
  {
    v9 = [(HUICCMenuTextView *)self presentVCBlock];
    ((void (**)(void, HACCMenuModuleViewController *))v9)[2](v9, v10);
  }
}

- (void)_updateMenuItemsForViewController:(id)a3
{
  v65[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40 = [(HUICCMenuTextView *)self delegate];
  v5 = [v40 currentHearingDevice];
  unint64_t v6 = [(HUICCMenuTextView *)self module];
  v7 = [MEMORY[0x263EFF980] array];
  objc_super v38 = [MEMORY[0x263EFF980] array];
  v8 = [MEMORY[0x263EFF980] array];
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  switch(v6)
  {
    case 0xFuLL:
      v9 = [v5 leftSelectedProgram];
      uint64_t v10 = [v9 name];

      if (v10)
      {
        v64 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v23 = [v5 leftPrograms];
      v24 = [v23 indexesOfObjectsPassingTest:&__block_literal_global_2];

      uint64_t v25 = [v5 leftPrograms];
      uint64_t v26 = [v25 objectsAtIndexes:v24];
      goto LABEL_22;
    case 0x10uLL:
      id v13 = [v5 rightSelectedProgram];
      uint64_t v10 = [v13 name];

      if (v10)
      {
        v63 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v27 = [v5 rightPrograms];
      v24 = [v27 indexesOfObjectsPassingTest:&__block_literal_global_144];

      uint64_t v25 = [v5 rightPrograms];
      uint64_t v28 = [v25 objectsAtIndexes:v24];
      goto LABEL_25;
    case 0x11uLL:
      id v14 = [v5 selectedPrograms];
      id v15 = [v14 lastObject];
      uint64_t v10 = [v15 name];

      if (v10)
      {
        v62 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v33 = [v5 combinedPrograms];
      v24 = [v33 indexesOfObjectsPassingTest:&__block_literal_global_146];

      uint64_t v25 = [v5 combinedPrograms];
      uint64_t v32 = [v25 objectsAtIndexes:v24];
      goto LABEL_30;
    case 0x12uLL:
      v16 = [v5 leftSelectedStreamingProgram];
      uint64_t v10 = [v16 name];

      if (v10)
      {
        v61 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v29 = [v5 leftPrograms];
      v24 = [v29 indexesOfObjectsPassingTest:&__block_literal_global_148];

      uint64_t v25 = [v5 leftPrograms];
      uint64_t v26 = [v25 objectsAtIndexes:v24];
LABEL_22:
      uint64_t v11 = (void *)v26;
      int v12 = 2;
      goto LABEL_31;
    case 0x13uLL:
      v17 = [v5 rightSelectedStreamingProgram];
      uint64_t v10 = [v17 name];

      if (v10)
      {
        v60 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v30 = [v5 rightPrograms];
      v24 = [v30 indexesOfObjectsPassingTest:&__block_literal_global_150];

      uint64_t v25 = [v5 rightPrograms];
      uint64_t v28 = [v25 objectsAtIndexes:v24];
LABEL_25:
      uint64_t v11 = (void *)v28;
      int v12 = 4;
      goto LABEL_31;
    case 0x14uLL:
      v18 = [v5 rightSelectedStreamingProgram];
      uint64_t v10 = [v18 name];

      if (v10)
      {
        v59 = v10;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
      }
      else
      {
        v36 = (void *)MEMORY[0x263EFFA68];
      }
      id v37 = hearingLocString();
      v31 = [v5 combinedPrograms];
      v24 = [v31 indexesOfObjectsPassingTest:&__block_literal_global_152];

      uint64_t v25 = [v5 combinedPrograms];
      uint64_t v32 = [v25 objectsAtIndexes:v24];
LABEL_30:
      uint64_t v11 = (void *)v32;
      int v12 = 6;
LABEL_31:

      goto LABEL_32;
    case 0x15uLL:
      id v37 = hearingLocString();
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      [v11 addObject:&unk_26DAB97D8];
      v19 = hearingInputRouteStringForOption();
      [v7 addObject:v19];

      [v11 addObject:&unk_26DAB97F0];
      v20 = hearingInputRouteStringForOption();
      [v7 addObject:v20];

      objc_initWeak(&location, self);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke;
      v54[3] = &unk_2647CD800;
      id v55 = v8;
      objc_copyWeak(&v57, &location);
      id v56 = v40;
      [v11 enumerateObjectsUsingBlock:v54];
      v21 = [MEMORY[0x263F47550] sharedInstance];
      [v21 preferredInputEar];
      inputOptionFromHearingEar();
      v22 = hearingInputRouteStringForOption();
      v65[0] = v22;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];

      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      goto LABEL_34;
    default:
      uint64_t v11 = 0;
      v36 = 0;
      id v37 = 0;
      int v12 = 0;
LABEL_32:
      if ([v11 count])
      {
        objc_initWeak(&location, self);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_7;
        v47[3] = &unk_2647CD870;
        id v48 = v7;
        id v49 = v5;
        int v53 = v12;
        objc_copyWeak(&v52, &location);
        id v50 = v40;
        id v51 = v8;
        [v11 enumerateObjectsUsingBlock:v47];

        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);
      }
LABEL_34:

      if ([v7 count])
      {
        uint64_t v34 = [v7 count];
        if (v34 == [v8 count])
        {
          [v4 setTitle:v37];
          uint64_t v35 = [v38 count];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_9;
          v41[3] = &unk_2647CD568;
          id v42 = v8;
          uint64_t v46 = v35;
          id v43 = v38;
          id v44 = v36;
          id v45 = v39;
          [v7 enumerateObjectsUsingBlock:v41];
        }
      }
      [v4 loadViewIfNeeded];
      [v4 setMenuItems:v39];

      return;
  }
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2;
  v7[3] = &unk_2647CD7D8;
  id v5 = v3;
  id v8 = v5;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  unint64_t v6 = (void *)MEMORY[0x22A6626E0](v7);
  [v4 addObject:v6];

  objc_destroyWeak(&v10);
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [MEMORY[0x263F47550] sharedInstance];
  [*(id *)(a1 + 32) unsignedIntValue];
  [v2 setPreferredInputEar:hearingEarFromInputOption()];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updatePresentedMenuViewControllerIfNecessary];

  id v4 = *(void **)(a1 + 40);
  return [v4 updateViewForProperties:&unk_26DAB9B80];
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_140(uint64_t a1, void *a2)
{
  return [a2 isMixingStream] ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_2_142(uint64_t a1, void *a2)
{
  return [a2 isMixingStream] ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isMixingStream] ^ 1;
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 isMixingStream];
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 name];
  [v4 addObject:v5];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_8;
  v10[3] = &unk_2647CD848;
  id v6 = v3;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  int v15 = *(_DWORD *)(a1 + 72);
  objc_copyWeak(&v14, (id *)(a1 + 64));
  id v13 = *(id *)(a1 + 48);
  v7 = (void *)MEMORY[0x22A6626E0](v10);
  id v8 = *(void **)(a1 + 56);
  id v9 = (void *)MEMORY[0x22A6626E0]();
  [v8 addObject:v9];

  objc_destroyWeak(&v14);
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelected") ^ 1);
  [*(id *)(a1 + 40) selectProgram:*(void *)(a1 + 32) forEar:*(unsigned int *)(a1 + 64)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updatePresentedMenuViewControllerIfNecessary];

  id v3 = *(void **)(a1 + 48);
  return [v3 updateView];
}

void __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_9(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(MEMORY[0x263F33CC0]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_10;
  id v12 = &unk_2647CD540;
  id v13 = *(id *)(a1 + 32);
  unint64_t v14 = a3;
  v7 = (void *)[v6 initWithTitle:v5 identifier:v5 handler:&v9];
  if (*(void *)(a1 + 64) > a3)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3, v9, v10, v11, v12);
    [v7 setSubtitle:v8];
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5, v9, v10, v11, v12)) {
    [v7 setSelected:1];
  }
  [*(id *)(a1 + 56) addObject:v7];
}

uint64_t __55__HUICCMenuTextView__updateMenuItemsForViewController___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 40)];
  unint64_t v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }

  return 0;
}

- (void)_updatePresentedMenuViewControllerIfNecessary
{
  id v3 = [(HUICCMenuTextView *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(HUICCMenuTextView *)self delegate];
    id v5 = [v7 expandedController];
    id v6 = [v5 presentedViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(HUICCMenuTextView *)self _updateMenuItemsForViewController:v6];
    }
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v2 = [(HUICCMenuTextView *)self textView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  unint64_t v2 = [(HUICCMenuTextView *)self textView];
  double v3 = [v2 nameLabel];
  double v4 = [v3 accessibilityLabel];

  return v4;
}

- (id)accessibilityValue
{
  unint64_t v2 = [(HUICCMenuTextView *)self textView];
  double v3 = [v2 valueLabel];
  double v4 = [v3 accessibilityLabel];

  return v4;
}

- (id)accessibilityHint
{
  return (id)hearingLocString();
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (id)presentVCBlock
{
  return self->_presentVCBlock;
}

- (void)setPresentVCBlock:(id)a3
{
}

- (HACCStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (HACCCapsuleTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (_HUIDarkTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)isSubModule
{
  return self->_isSubModule;
}

- (BOOL)isLargeText
{
  return self->_isLargeText;
}

- (NSLayoutConstraint)titleViewHeightLayout
{
  return self->_titleViewHeightLayout;
}

- (void)setTitleViewHeightLayout:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (CCUIContentModuleDetailTransitioningDelegate)detailTransitioningDelegate
{
  return self->_detailTransitioningDelegate;
}

- (void)setDetailTransitioningDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_titleViewHeightLayout, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_presentVCBlock, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end