@interface _SFSettingsAlertContentController
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)usesReverseOrder;
- (NSArray)items;
- (_SFSettingsAlertContentController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SFSettingsAlertController)alertController;
- (_SFSettingsAlertItem)focusedItem;
- (id)_createViewForItem:(id)a3;
- (void)_addGroupSeparatorIfNeededBeforeItemAtIndex:(unint64_t)a3;
- (void)_addViewForItem:(id)a3;
- (void)_alignButtonImageView:(id)a3;
- (void)_panRecognized:(id)a3;
- (void)_scrollToBottomIfNeeded;
- (void)_stepperValueChanged:(id)a3;
- (void)_tappedItemView:(id)a3;
- (void)_updateFocusedItemConstraints;
- (void)_updatePreferredContentSize;
- (void)_updateSeparators;
- (void)addDivider;
- (void)addItem:(id)a3;
- (void)alertItemViewContentSizeDidChange:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllItems;
- (void)setAlertController:(id)a3;
- (void)setFocusedItem:(id)a3;
- (void)setNeedsUpdatePreferredContentSize;
- (void)setUsesReverseOrder:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _SFSettingsAlertContentController

- (_SFSettingsAlertContentController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)_SFSettingsAlertContentController;
  v4 = [(_SFSettingsAlertContentController *)&v13 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    items = v4->_items;
    v4->_items = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
    groupStartIndices = v4->_groupStartIndices;
    v4->_groupStartIndices = (NSMutableIndexSet *)v7;

    v14[0] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v10 = (id)[(_SFSettingsAlertContentController *)v4 registerForTraitChanges:v9 withTarget:v4 action:sel_setNeedsUpdatePreferredContentSize];

    v11 = v4;
  }

  return v4;
}

- (void)removeAllItems
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = self->_items;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v23 + 1) + 8 * v7) viewAsUIView];
        [v8 removeObserver:self forKeyPath:@"highlighted" context:kvoContext_1];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  v9 = [MEMORY[0x1E4F1CA48] array];
  items = self->_items;
  self->_items = v9;

  lastViewForAlignment = self->_lastViewForAlignment;
  self->_lastViewForAlignment = 0;

  v12 = [MEMORY[0x1E4F28E60] indexSet];
  groupStartIndices = self->_groupStartIndices;
  self->_groupStartIndices = v12;

  v14 = [(UIStackView *)self->_stackView subviews];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) removeFromSuperview];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)kvoContext_1 == a6 && [v10 isEqualToString:@"highlighted"])
  {
    [(_SFSettingsAlertContentController *)self _updateSeparators];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFSettingsAlertContentController;
    [(_SFSettingsAlertContentController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)loadView
{
  v38[2] = *MEMORY[0x1E4F143B8];
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  [(UIScrollView *)self->_scrollView setAccessibilityIdentifier:@"FontStack"];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:3];
  UIEdgeInsetsMakeWithEdges();
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
  [(_SFSettingsAlertContentController *)self setView:self->_scrollView];
  uint64_t v5 = (objc_class *)MEMORY[0x1E4FB1C60];
  v35 = self->_scrollView;
  uint64_t v6 = (UIStackView *)objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
  stackView = self->_stackView;
  self->_stackView = v6;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIScrollView *)v35 addSubview:self->_stackView];
  v8 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  v9 = [(UIStackView *)self->_stackView topAnchor];
  id v10 = [v8 topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  id v12 = [(UIStackView *)self->_stackView bottomAnchor];
  objc_super v13 = [v8 bottomAnchor];
  v33 = [v12 constraintEqualToAnchor:v13];

  v38[0] = v11;
  v38[1] = v33;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  stackViewTopBottomConstraints = self->_stackViewTopBottomConstraints;
  self->_stackViewTopBottomConstraints = v14;

  uint64_t v16 = [(UIStackView *)self->_stackView widthAnchor];
  uint64_t v17 = [(UIScrollView *)self->_scrollView safeAreaLayoutGuide];
  uint64_t v18 = [v17 widthAnchor];
  long long v19 = [v16 constraintEqualToAnchor:v18];
  stackViewWidthConstraint = self->_stackViewWidthConstraint;
  self->_stackViewWidthConstraint = v19;

  long long v21 = (void *)MEMORY[0x1E4F28DC8];
  long long v22 = [(UIStackView *)self->_stackView leadingAnchor];
  long long v23 = v8;
  v34 = v8;
  long long v24 = [v8 leadingAnchor];
  long long v25 = [v22 constraintEqualToAnchor:v24];
  v37[0] = v25;
  long long v26 = [(UIStackView *)self->_stackView trailingAnchor];
  v27 = [v23 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v37[1] = v28;
  v37[2] = v11;
  uint64_t v29 = self->_stackViewWidthConstraint;
  v37[3] = v33;
  v37[4] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  [v21 activateConstraints:v30];

  items = self->_items;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __45___SFSettingsAlertContentController_loadView__block_invoke;
  v36[3] = &unk_1E5C76200;
  v36[4] = self;
  [(NSMutableArray *)items enumerateObjectsUsingBlock:v36];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__panRecognized_];
  [v32 setMaximumNumberOfTouches:1];
  [v32 setDelegate:self];
  [(UIScrollView *)v35 addGestureRecognizer:v32];
}

- (void)_updatePreferredContentSize
{
  v3 = [(_SFSettingsAlertContentController *)self popoverPresentationController];
  [v3 popoverLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (v7 == *(double *)(MEMORY[0x1E4FB2848] + 8)
    && v5 == *MEMORY[0x1E4FB2848]
    && v11 == *(double *)(MEMORY[0x1E4FB2848] + 24)
    && v9 == *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    UIEdgeInsetsMakeWithEdges();
    double v5 = v15;
    double v7 = v16;
    double v9 = v17;
    double v11 = v18;
  }
  long long v19 = [(_SFSettingsAlertContentController *)self popoverPresentationController];
  long long v20 = [v19 containerView];
  [v20 bounds];
  v44.origin.x = v7 + v21;
  v44.origin.y = v5 + v22;
  v44.size.width = v23 - (v11 + v7);
  v44.size.height = v24 - (v9 + v5);
  double v25 = fmin(CGRectGetWidth(v44), 414.0);

  long long v26 = [(UIStackView *)self->_stackView widthAnchor];
  id v42 = [v26 constraintLessThanOrEqualToConstant:v25];

  [v42 setActive:1];
  [(NSLayoutConstraint *)self->_stackViewWidthConstraint setActive:0];
  [(UIStackView *)self->_stackView layoutIfNeeded];
  double v27 = *MEMORY[0x1E4FB2C68];
  double v28 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], v28);
  double v31 = v30;
  focusedItem = self->_focusedItem;
  if (focusedItem)
  {
    v33 = [(_SFSettingsAlertItem *)focusedItem viewAsUIView];
    objc_msgSend(v33, "systemLayoutSizeFittingSize:", v27, v28);
    double v35 = v34;

    v36 = self->_focusedItem;
    v37 = [(NSMutableArray *)self->_items lastObject];

    if (v36 != v37)
    {
      _SFOnePixel();
      double v35 = v35 - v38;
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v31, v35);
    }
  }
  else
  {
    double v35 = v29;
  }
  [v42 setActive:0];
  [(NSLayoutConstraint *)self->_stackViewWidthConstraint setActive:1];
  v39 = [(_SFSettingsAlertContentController *)self alertController];
  v40 = [v39 _rootContentController];

  if (v40 != self)
  {
    v41 = [v39 view];
    [v41 bounds];
    double v31 = fmax(v31, CGRectGetWidth(v45));
  }
  -[_SFSettingsAlertContentController setPreferredContentSize:](self, "setPreferredContentSize:", v31, v35);
  objc_msgSend(v39, "setPreferredContentSize:", v31, v35);
}

- (void)_scrollToBottomIfNeeded
{
  self->_updateScrollPositionAfterLayout = 0;
  if (self->_usesReverseOrder)
  {
    [(UIScrollView *)self->_scrollView contentSize];
    double v4 = v3;
    [(UIScrollView *)self->_scrollView bounds];
    double v5 = v4 - CGRectGetHeight(v9);
    [(UIScrollView *)self->_scrollView adjustedContentInset];
    scrollView = self->_scrollView;
    -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, 0.0, v5 + v6);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertContentController;
  -[_SFSettingsAlertContentController viewWillAppear:](&v9, sel_viewWillAppear_);
  double v5 = [(_SFSettingsAlertContentController *)self navigationController];
  double v6 = [(_SFSettingsAlertContentController *)self navigationController];
  double v7 = [v6 viewControllers];
  double v8 = [v7 firstObject];
  [v5 setNavigationBarHidden:v8 == self animated:v3];

  [(_SFSettingsAlertContentController *)self _updateSeparators];
  [(_SFSettingsAlertContentController *)self _updatePreferredContentSize];
  if (self->_usesReverseOrder) {
    self->_updateScrollPositionAfterLayout = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertContentController;
  [(_SFSettingsAlertContentController *)&v4 viewDidAppear:a3];
  [(UIScrollView *)self->_scrollView flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SFSettingsAlertContentController;
  [(_SFSettingsAlertContentController *)&v3 viewDidLayoutSubviews];
  if (self->_updatePreferredContentSizeAfterLayout)
  {
    self->_updatePreferredContentSizeAfterLayout = 0;
    [(_SFSettingsAlertContentController *)self _updatePreferredContentSize];
  }
  if (self->_updateScrollPositionAfterLayout) {
    [(_SFSettingsAlertContentController *)self _scrollToBottomIfNeeded];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setNeedsUpdatePreferredContentSize
{
  self->_updatePreferredContentSizeAfterLayout = 1;
  id v2 = [(_SFSettingsAlertContentController *)self view];
  [v2 setNeedsLayout];
}

- (NSArray)items
{
  id v2 = (void *)[(NSMutableArray *)self->_items copy];

  return (NSArray *)v2;
}

- (void)setFocusedItem:(id)a3
{
  double v5 = (_SFSettingsAlertItem *)a3;
  if (self->_focusedItem != v5)
  {
    objc_storeStrong((id *)&self->_focusedItem, a3);
    [(UIScrollView *)self->_scrollView setScrollEnabled:v5 == 0];
    double v6 = [(_SFSettingsAlertItem *)self->_focusedItem viewAsUIView];
    [v6 layoutIfNeeded];

    [(_SFSettingsAlertContentController *)self _updateFocusedItemConstraints];
    double v7 = [(_SFSettingsAlertContentController *)self view];
    [v7 setNeedsLayout];
    double v8 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52___SFSettingsAlertContentController_setFocusedItem___block_invoke;
    v10[3] = &unk_1E5C72238;
    id v11 = v7;
    id v12 = self;
    id v9 = v7;
    [v8 _animateUsingDefaultTimingWithOptions:2 animations:v10 completion:0];
  }
}

- (void)_updateFocusedItemConstraints
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (self->_focusedItemConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    focusedItemConstraints = self->_focusedItemConstraints;
    self->_focusedItemConstraints = 0;
  }
  focusedItem = self->_focusedItem;
  if (focusedItem)
  {
    double v5 = [(_SFSettingsAlertItem *)focusedItem viewAsUIView];
    double v6 = [(_SFSettingsAlertContentController *)self view];
    double v7 = [v6 safeAreaLayoutGuide];

    double v8 = [v5 topAnchor];
    id v9 = [v7 topAnchor];
    if (self->_usesReverseOrder)
    {
      _SFOnePixel();
      double v11 = -v10;
    }
    else
    {
      double v11 = 0.0;
    }
    v14 = [v8 constraintEqualToAnchor:v9 constant:v11];
    v19[0] = v14;
    double v15 = [(UIStackView *)self->_stackView heightAnchor];
    [(UIStackView *)self->_stackView bounds];
    double v16 = [v15 constraintEqualToConstant:CGRectGetHeight(v21)];
    v19[1] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    double v18 = self->_focusedItemConstraints;
    self->_focusedItemConstraints = v17;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_focusedItemConstraints];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_stackViewTopBottomConstraints];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28DC8];
    stackViewTopBottomConstraints = self->_stackViewTopBottomConstraints;
    [v12 activateConstraints:stackViewTopBottomConstraints];
  }
}

- (void)addItem:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [(NSMutableArray *)items addObject:v5];
  [(_SFSettingsAlertContentController *)self _addGroupSeparatorIfNeededBeforeItemAtIndex:[(NSMutableArray *)self->_items count] - 1];
  [(_SFSettingsAlertContentController *)self _addViewForItem:v5];
}

- (void)addDivider
{
  groupStartIndices = self->_groupStartIndices;
  uint64_t v3 = [(NSMutableArray *)self->_items count];

  [(NSMutableIndexSet *)groupStartIndices addIndex:v3];
}

- (void)_addGroupSeparatorIfNeededBeforeItemAtIndex:(unint64_t)a3
{
  int v5 = [(_SFSettingsAlertContentController *)self isViewLoaded];
  if (a3 && v5 && [(NSMutableIndexSet *)self->_groupStartIndices containsIndex:a3])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [v10 heightAnchor];
    double v7 = [v6 constraintEqualToConstant:8.0];
    [v10 addConstraint:v7];

    double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"settingsAlertDividerBackground");
    [v10 setBackgroundColor:v8];

    stackView = self->_stackView;
    if (self->_usesReverseOrder) {
      [(UIStackView *)stackView insertArrangedSubview:v10 atIndex:0];
    }
    else {
      [(UIStackView *)stackView addArrangedSubview:v10];
    }
  }
}

- (void)_addViewForItem:(id)a3
{
  id v8 = a3;
  if ([(_SFSettingsAlertContentController *)self isViewLoaded])
  {
    objc_super v4 = [(_SFSettingsAlertContentController *)self _createViewForItem:v8];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setItem:v8];
    [v4 setDelegate:self];
    [v8 setView:v4];
    int v5 = [v8 viewConfigurationBlock];

    if (v5)
    {
      double v6 = [v8 viewConfigurationBlock];
      ((void (**)(void, void *))v6)[2](v6, v4);
    }
    stackView = self->_stackView;
    if (self->_usesReverseOrder) {
      [(UIStackView *)stackView insertArrangedSubview:v4 atIndex:0];
    }
    else {
      [(UIStackView *)stackView addArrangedSubview:v4];
    }
    [v4 addObserver:self forKeyPath:@"highlighted" options:0 context:kvoContext_1];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(_SFSettingsAlertContentController *)self _alignButtonImageView:v4];
    }
    [v8 updateOptionsGroupDetailLabel];
  }
}

- (void)_alignButtonImageView:(id)a3
{
  id obj = [a3 trailingView];
  objc_super v4 = [obj superview];

  if (v4)
  {
    p_lastViewForAlignment = &self->_lastViewForAlignment;
    if (*p_lastViewForAlignment)
    {
      double v6 = [obj centerXAnchor];
      double v7 = [(UIView *)*p_lastViewForAlignment centerXAnchor];
      id v8 = [v6 constraintEqualToAnchor:v7];

      LODWORD(v9) = 1146388480;
      [v8 setPriority:v9];
      [v8 setActive:1];
    }
    objc_storeStrong((id *)p_lastViewForAlignment, obj);
  }
}

- (id)_createViewForItem:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 type];
  if (v6 <= 5)
  {
    if (((1 << v6) & 0x1B) != 0)
    {
      double v7 = objc_alloc_init(_SFSettingsAlertButton);
      uint64_t v3 = (_SFSettingsAlertCustomViewContainer *)v7;
      if (self->_usesReverseOrder) {
        [(_SFSettingsAlertControl *)v7 setDefaultBackgroundMode:2];
      }
      id v8 = [v5 attributedTitle];

      if (v8)
      {
        double v9 = [v5 attributedTitle];
        [(_SFSettingsAlertCustomViewContainer *)v3 setAttributedText:v9];
      }
      else
      {
        double v9 = [v5 title];
        [(_SFSettingsAlertCustomViewContainer *)v3 setText:v9];
      }

      id v12 = [v5 attributedSubtitle];

      if (v12)
      {
        objc_super v13 = [v5 attributedSubtitle];
        [(_SFSettingsAlertCustomViewContainer *)v3 setAttributedDetailText:v13];
      }
      else
      {
        objc_super v13 = [v5 subtitle];
        [(_SFSettingsAlertCustomViewContainer *)v3 setDetailText:v13];
      }

      v14 = [v5 tintColor];
      [(_SFSettingsAlertCustomViewContainer *)v3 setTintColor:v14];

      double v15 = [v5 textStyle];
      [(_SFSettingsAlertCustomViewContainer *)v3 setTextStyle:v15];

      double v16 = [v5 icon];
      [(_SFSettingsAlertCustomViewContainer *)v3 setImage:v16];

      -[_SFSettingsAlertCustomViewContainer setEnabled:](v3, "setEnabled:", [v5 isEnabled]);
      -[_SFSettingsAlertCustomViewContainer setSelected:](v3, "setSelected:", [v5 isSelected]);
      double v17 = [v5 componentsArrangement];
      [(_SFSettingsAlertCustomViewContainer *)v3 setComponentsArrangement:v17];

      -[_SFSettingsAlertCustomViewContainer setLimitToSingleLine:](v3, "setLimitToSingleLine:", [v5 type] == 1);
      -[_SFSettingsAlertCustomViewContainer setShowsIndicatorDot:](v3, "setShowsIndicatorDot:", [v5 showsIndicatorDot]);
      double v18 = [v5 badgeView];
      [(_SFSettingsAlertCustomViewContainer *)v3 setAccessoryView:v18];

      long long v19 = [v5 statusImageView];
      [(_SFSettingsAlertCustomViewContainer *)v3 setStatusImageView:v19];

      [(_SFSettingsAlertCustomViewContainer *)v3 addTarget:self action:sel__tappedItemView_ forControlEvents:0x2000];
    }
    else
    {
      if (v6 == 2)
      {
        id v10 = [v5 controller];
        double v11 = [[_SFSettingsAlertStepper alloc] initUsingResetButton:objc_opt_respondsToSelector() & 1 usingTopSeparator:self->_usesReverseOrder];
        uint64_t v3 = v11;
        if (self->_usesReverseOrder) {
          [(_SFSettingsAlertCustomViewContainer *)v11 setDefaultBackgroundMode:2];
        }
        [v10 prepareStepper:v3];
        [(_SFSettingsAlertCustomViewContainer *)v3 addTarget:self action:sel__stepperValueChanged_ forControlEvents:4096];
      }
      else
      {
        long long v20 = [v5 controller];
        id v10 = [v20 customPaletteView];

        uint64_t v3 = [[_SFSettingsAlertCustomViewContainer alloc] initWithContentView:v10];
      }
    }
  }

  return v3;
}

- (void)_stepperValueChanged:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 item];
  id v5 = [v4 controller];
  uint64_t v6 = [v10 value];
  switch(v6)
  {
    case 2:
      if (objc_opt_respondsToSelector()) {
        [v5 resetValue:v10];
      }
      break;
    case 1:
      [v5 decrementValue:v10];
      break;
    case 0:
      [v5 incrementValue:v10];
      break;
  }
  double v7 = [v4 handler];
  id v8 = [(_SFSettingsAlertContentController *)self alertController];
  if (v7)
  {
    ((void (**)(void, void *, void *))v7)[2](v7, v8, v4);
    double v9 = [MEMORY[0x1E4F98948] sharedLogger];
    objc_msgSend(v9, "_sf_didPerformFormatMenuAction:provenance:", objc_msgSend(v4, "actionType"), objc_msgSend(v8, "provenance"));
  }
}

- (void)_tappedItemView:(id)a3
{
  id v7 = [a3 item];
  objc_super v4 = [v7 handler];
  id v5 = [(_SFSettingsAlertContentController *)self alertController];
  ((void (**)(void, void *, id))v4)[2](v4, v5, v7);
  uint64_t v6 = [MEMORY[0x1E4F98948] sharedLogger];
  objc_msgSend(v6, "_sf_didPerformFormatMenuAction:provenance:", objc_msgSend(v7, "actionType"), objc_msgSend(v5, "provenance"));

  [(_SFSettingsAlertContentController *)self _updateSeparators];
}

- (void)_updateSeparators
{
  items = self->_items;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54___SFSettingsAlertContentController__updateSeparators__block_invoke_2;
  v3[3] = &unk_1E5C76248;
  v3[4] = self;
  id v4 = &__block_literal_global_384;
  [(NSMutableArray *)items enumerateObjectsUsingBlock:v3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  if (self->_focusedItem) {
    return 1;
  }
  double v7 = v4;
  double v8 = v5;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat Height = CGRectGetHeight(v17);
  [(UIScrollView *)self->_scrollView contentSize];
  double v11 = v8 + v7 + v10;
  uint64_t v12 = _SFOnePixel();
  v13.n128_u64[0] = v14.n128_u64[0];
  v14.n128_f64[0] = Height;
  v15.n128_f64[0] = v11;

  return MEMORY[0x1F412FC20](v12, v14, v15, v13);
}

- (void)_panRecognized:(id)a3
{
  id v20 = a3;
  double v4 = self->_controlHighlightedForPan;
  double v5 = [(_SFSettingsAlertContentController *)self view];
  [v20 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(_SFSettingsAlertContentController *)self view];
  double v11 = objc_msgSend(v10, "hitTest:withEvent:", 0, v7, v9);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  __n128 v13 = v12;
  if ([(UIControl *)v13 isEnabled])
  {
    uint64_t v14 = [v20 state];
    if ((unint64_t)(v14 - 1) < 2)
    {
      if (v13 != v4 && ![(UIControl *)v13 isHighlighted])
      {
        feedbackGenerator = self->_feedbackGenerator;
        if (!feedbackGenerator)
        {
          double v16 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
          CGRect v17 = self->_feedbackGenerator;
          self->_feedbackGenerator = v16;

          feedbackGenerator = self->_feedbackGenerator;
        }
        [(UISelectionFeedbackGenerator *)feedbackGenerator selectionChanged];
        [(UIControl *)v4 setHighlighted:0];
        [(UIControl *)v13 setHighlighted:1];
      }
      double v18 = v13;
      goto LABEL_18;
    }
    if (v14 == 3) {
      [(UIControl *)v13 sendActionsForControlEvents:0x2000];
    }
    [(UIControl *)v13 setHighlighted:0];
LABEL_17:
    double v18 = 0;
LABEL_18:
    controlHighlightedForPan = self->_controlHighlightedForPan;
    self->_controlHighlightedForPan = v18;

    goto LABEL_19;
  }
  [(UIControl *)v4 setHighlighted:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_17;
  }
LABEL_19:
}

- (void)alertItemViewContentSizeDidChange:(id)a3
{
  double v4 = [(_SFSettingsAlertContentController *)self viewIfLoaded];
  double v5 = [v4 window];

  if (v5)
  {
    [(_SFSettingsAlertContentController *)self setNeedsUpdatePreferredContentSize];
  }
}

- (_SFSettingsAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  return (_SFSettingsAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)usesReverseOrder
{
  return self->_usesReverseOrder;
}

- (void)setUsesReverseOrder:(BOOL)a3
{
  self->_usesReverseOrder = a3;
}

- (_SFSettingsAlertItem)focusedItem
{
  return self->_focusedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedItem, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_controlHighlightedForPan, 0);
  objc_storeStrong((id *)&self->_lastViewForAlignment, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTopBottomConstraints, 0);
  objc_storeStrong((id *)&self->_focusedItemConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_groupStartIndices, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end