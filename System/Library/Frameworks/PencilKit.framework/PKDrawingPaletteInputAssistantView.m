@interface PKDrawingPaletteInputAssistantView
- (BOOL)_useThreeButtonLayout;
- (BOOL)enableKeyboardButtons;
- (BOOL)hasInputAssistantItems;
- (BOOL)shouldShowKeyboardButton;
- (BOOL)shouldShowReturnKeyButton;
- (BOOL)useCompactLayout;
- (CGSize)intrinsicContentSize;
- (NSArray)buttons;
- (NSHashTable)viewStateObservers;
- (PKDrawingPaletteInputAssistantView)initWithFrame:(CGRect)a3;
- (PKPaletteButton)returnKeyButton;
- (PKPaletteButtonGroupView)bottomOrLeadingGroupView;
- (PKPaletteButtonGroupView)topOrTrailingGroupView;
- (PKPaletteKeyboardButton)keyboardButton;
- (UIStackView)contentStackView;
- (double)_contentStackViewSpacing;
- (double)scalingFactor;
- (id)_topOrTrailingGroupViewButtons;
- (int64_t)_contentStackViewAlignment;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_notifyViewStateDidChange;
- (void)_updateContentOrientation;
- (void)_updateContentScalingFactor;
- (void)_updateContentViewSpacing;
- (void)_updateGroupViewContents;
- (void)_updateUI;
- (void)addViewStateObserver:(id)a3;
- (void)buttonDidChangeIntrinsicContentSize:(id)a3;
- (void)removeViewStateObserver:(id)a3;
- (void)setBottomOrLeadingGroupView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setContentStackView:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setEnableKeyboardButtons:(BOOL)a3;
- (void)setKeyboardButton:(id)a3;
- (void)setReturnKeyButton:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setShouldShowKeyboardButton:(BOOL)a3;
- (void)setShouldShowReturnKeyButton:(BOOL)a3;
- (void)setTopOrTrailingGroupView:(id)a3;
- (void)setUseCompactLayout:(BOOL)a3;
- (void)setViewStateObservers:(id)a3;
@end

@implementation PKDrawingPaletteInputAssistantView

- (PKDrawingPaletteInputAssistantView)initWithFrame:(CGRect)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKDrawingPaletteInputAssistantView;
  v3 = -[PKDrawingPaletteInputAssistantView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    viewStateObservers = v4->_viewStateObservers;
    v4->_viewStateObservers = (NSHashTable *)v5;

    v7 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    contentStackView = v4->_contentStackView;
    v4->_contentStackView = v7;

    [(UIStackView *)v4->_contentStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_contentStackView setAlignment:1];
    [(PKDrawingPaletteInputAssistantView *)v4 addSubview:v4->_contentStackView];
    v9 = objc_alloc_init(PKPaletteButtonGroupView);
    topOrTrailingGroupView = v4->_topOrTrailingGroupView;
    v4->_topOrTrailingGroupView = v9;

    [(PKPaletteButtonGroupView *)v4->_topOrTrailingGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_contentStackView addArrangedSubview:v4->_topOrTrailingGroupView];
    v11 = objc_alloc_init(PKPaletteButtonGroupView);
    bottomOrLeadingGroupView = v4->_bottomOrLeadingGroupView;
    v4->_bottomOrLeadingGroupView = v11;

    [(PKPaletteButtonGroupView *)v4->_bottomOrLeadingGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_contentStackView addArrangedSubview:v4->_bottomOrLeadingGroupView];
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = [(UIStackView *)v4->_contentStackView centerXAnchor];
    v15 = [(PKDrawingPaletteInputAssistantView *)v4 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v23[0] = v16;
    v17 = [(UIStackView *)v4->_contentStackView centerYAnchor];
    v18 = [(PKDrawingPaletteInputAssistantView *)v4 centerYAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v23[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v13 activateConstraints:v20];

    [(PKDrawingPaletteInputAssistantView *)v4 _updateUI];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  if ([(PKDrawingPaletteInputAssistantView *)self useCompactLayout])
  {
    v3 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    BOOL v10 = [(PKDrawingPaletteInputAssistantView *)self _useThreeButtonLayout];
    unint64_t v11 = [(PKDrawingPaletteInputAssistantView *)self edgeLocation];
    if (v10)
    {
      BOOL v12 = v11 == 2 || v11 == 8;
      if (v12) {
        double v13 = 132.0;
      }
      else {
        double v13 = 84.0;
      }
      if (v12) {
        double v14 = 84.0;
      }
      else {
        double v14 = 132.0;
      }
      [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
      double v16 = v14 * v15;
      double v9 = v13 * v15;
    }
    else
    {
      [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
      double v16 = v17 * 84.0;
      [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
      double v9 = v18 * 84.0;
    }
    double v8 = v16;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)addViewStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingPaletteInputAssistantView *)self viewStateObservers];
  [v5 addObject:v4];
}

- (void)removeViewStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingPaletteInputAssistantView *)self viewStateObservers];
  [v5 removeObject:v4];
}

- (void)_notifyViewStateDidChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PKDrawingPaletteInputAssistantView *)self viewStateObservers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) paletteInputAssistantViewDidChangeViewState:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasInputAssistantItems
{
  v3 = [(PKDrawingPaletteInputAssistantView *)self buttons];
  BOOL v4 = [v3 count]
    || [(PKDrawingPaletteInputAssistantView *)self shouldShowKeyboardButton]
    || [(PKDrawingPaletteInputAssistantView *)self shouldShowReturnKeyButton];

  return v4;
}

- (void)setButtons:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSArray *)a3;
  buttons = self->_buttons;
  if (buttons != v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = buttons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v11 removeIntrinsicContentSizeObserver:self];
          [v11 removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    BOOL v12 = (NSArray *)[(NSArray *)v4 copy];
    uint64_t v13 = self->_buttons;
    self->_buttons = v12;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v14 = self->_buttons;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          objc_msgSend(v19, "removeFromSuperview", (void)v20);
          [v19 addIntrinsicContentSizeObserver:self];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)setShouldShowKeyboardButton:(BOOL)a3
{
  if (self->_shouldShowKeyboardButton != a3)
  {
    self->_shouldShowKeyboardButton = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)setShouldShowReturnKeyButton:(BOOL)a3
{
  if (self->_shouldShowReturnKeyButton != a3)
  {
    self->_shouldShowReturnKeyButton = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)setEnableKeyboardButtons:(BOOL)a3
{
  if (self->_enableKeyboardButtons != a3)
  {
    self->_enableKeyboardButtons = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)_updateUI
{
  if ([(PKDrawingPaletteInputAssistantView *)self shouldShowKeyboardButton]
    && ([(PKDrawingPaletteInputAssistantView *)self keyboardButton],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v6 = +[PKPaletteButton keyboardButton];
    [(PKDrawingPaletteInputAssistantView *)self setKeyboardButton:v6];

    uint64_t v7 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
    [v7 addIntrinsicContentSizeObserver:self];
  }
  else if (![(PKDrawingPaletteInputAssistantView *)self shouldShowKeyboardButton])
  {
    BOOL v4 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];

    if (v4)
    {
      uint64_t v5 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
      [v5 removeFromSuperview];

      [(PKDrawingPaletteInputAssistantView *)self setKeyboardButton:0];
    }
  }
  uint64_t v8 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];

  if (v8)
  {
    BOOL v9 = [(PKDrawingPaletteInputAssistantView *)self useCompactLayout];
    long long v10 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
    [v10 setUseCompactLayout:v9];

    BOOL v11 = [(PKDrawingPaletteInputAssistantView *)self enableKeyboardButtons];
    BOOL v12 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
    [v12 setEnableKeyboardToggle:v11];
  }
  if ([(PKDrawingPaletteInputAssistantView *)self shouldShowReturnKeyButton]
    && ([(PKDrawingPaletteInputAssistantView *)self returnKeyButton],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    uint64_t v16 = +[PKPaletteButton returnKeyButton];
    [(PKDrawingPaletteInputAssistantView *)self setReturnKeyButton:v16];

    uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
    [v17 addIntrinsicContentSizeObserver:self];
  }
  else if (![(PKDrawingPaletteInputAssistantView *)self shouldShowReturnKeyButton])
  {
    double v14 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];

    if (v14)
    {
      uint64_t v15 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
      [v15 removeFromSuperview];

      [(PKDrawingPaletteInputAssistantView *)self setReturnKeyButton:0];
    }
  }
  double v18 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];

  if (v18)
  {
    BOOL v19 = [(PKDrawingPaletteInputAssistantView *)self useCompactLayout];
    long long v20 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
    [v20 setUseCompactLayout:v19];

    BOOL v21 = [(PKDrawingPaletteInputAssistantView *)self enableKeyboardButtons];
    long long v22 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
    [v22 setEnabled:v21];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__PKDrawingPaletteInputAssistantView__updateUI__block_invoke;
  void v23[3] = &unk_1E64C61C0;
  v23[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];
  [(PKDrawingPaletteInputAssistantView *)self invalidateIntrinsicContentSize];
  UIAccessibilityPostNotification(*MEMORY[0x1E4FB2470], 0);
}

uint64_t __47__PKDrawingPaletteInputAssistantView__updateUI__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContentViewSpacing];
  [*(id *)(a1 + 32) _updateGroupViewContents];
  [*(id *)(a1 + 32) _updateContentOrientation];
  [*(id *)(a1 + 32) _updateContentScalingFactor];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (BOOL)_useThreeButtonLayout
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.mobilenotes"];

  if (!v5
    || [(PKDrawingPaletteInputAssistantView *)self useCompactLayout]
    || ![(PKDrawingPaletteInputAssistantView *)self shouldShowKeyboardButton]
    || ![(PKDrawingPaletteInputAssistantView *)self shouldShowReturnKeyButton])
  {
    return 0;
  }
  uint64_t v6 = [(PKDrawingPaletteInputAssistantView *)self buttons];
  BOOL v7 = [v6 count] == 1;

  return v7;
}

- (void)_updateGroupViewContents
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v3 = [(PKDrawingPaletteInputAssistantView *)self buttons];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    int v5 = [(PKDrawingPaletteInputAssistantView *)self buttons];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v101 objects:v111 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v102;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v102 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * v9++), "setUseCompactLayout:", -[PKDrawingPaletteInputAssistantView useCompactLayout](self, "useCompactLayout"));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v101 objects:v111 count:16];
      }
      while (v7);
    }

    long long v10 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
    [v10 removeAllButtons];

    BOOL v11 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
    [v11 removeAllButtons];

    BOOL v12 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
    [v12 removeFromSuperview];

    uint64_t v13 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
    [v13 removeFromSuperview];

    double v14 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
    uint64_t v15 = [(PKDrawingPaletteInputAssistantView *)self _topOrTrailingGroupViewButtons];
    [v14 addButtonsFromArray:v15];

    if ([(PKDrawingPaletteInputAssistantView *)self useCompactLayout])
    {
      uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
      uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self buttons];
      [v16 addButtonsFromArray:v17];
    }
    else
    {
      if ([(PKDrawingPaletteInputAssistantView *)self _useThreeButtonLayout])
      {
        double v18 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
        [v18 removeAllButtons];

        BOOL v19 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
        [(PKDrawingPaletteInputAssistantView *)self addSubview:v19];

        long long v20 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

        BOOL v21 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
        [(PKDrawingPaletteInputAssistantView *)self addSubview:v21];

        long long v22 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
        [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

        long long v23 = [(PKDrawingPaletteInputAssistantView *)self buttons];
        uint64_t v16 = [v23 lastObject];

        [v16 removeFromSuperview];
        [(PKDrawingPaletteInputAssistantView *)self addSubview:v16];
        [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
        double v25 = v24 * 12.0;
        unint64_t v26 = [(PKDrawingPaletteInputAssistantView *)self edgeLocation];
        if (v26 == 8 || v26 == 2)
        {
          v75 = (void *)MEMORY[0x1E4F28DC8];
          v76 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
          v73 = [v76 topAnchor];
          uint64_t v74 = [(PKDrawingPaletteInputAssistantView *)self topAnchor];
          v100 = [v73 constraintGreaterThanOrEqualToAnchor:v74];
          v110[0] = v100;
          v99 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
          long long v27 = [v99 centerXAnchor];
          v97 = [(PKDrawingPaletteInputAssistantView *)self centerXAnchor];
          v98 = v27;
          v96 = [v27 constraintEqualToAnchor:v97];
          v110[1] = v96;
          v95 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
          v28 = [v95 bottomAnchor];
          v93 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          [v93 topAnchor];
          v92 = v94 = v28;
          v91 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", -v25);
          v110[2] = v91;
          v29 = [v16 leadingAnchor];
          v89 = [(PKDrawingPaletteInputAssistantView *)self leadingAnchor];
          v90 = v29;
          v88 = [v29 constraintEqualToAnchor:v89];
          v110[3] = v88;
          uint64_t v30 = [v16 trailingAnchor];
          v86 = [(PKDrawingPaletteInputAssistantView *)self centerXAnchor];
          v87 = v30;
          v85 = [v30 constraintEqualToAnchor:v86 constant:-(v25 * 0.5)];
          v110[4] = v85;
          v31 = [v16 bottomAnchor];
          v83 = [(PKDrawingPaletteInputAssistantView *)self bottomAnchor];
          v84 = v31;
          v82 = [v31 constraintEqualToAnchor:v83];
          v110[5] = v82;
          v81 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v32 = [v81 leadingAnchor];
          v79 = [(PKDrawingPaletteInputAssistantView *)self centerXAnchor];
          v80 = v32;
          v78 = [v32 constraintEqualToAnchor:v79 constant:v25 * 0.5];
          v110[6] = v78;
          v33 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v34 = [v33 trailingAnchor];
          v35 = [(PKDrawingPaletteInputAssistantView *)self trailingAnchor];
          v36 = [v34 constraintEqualToAnchor:v35];
          v110[7] = v36;
          v37 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v38 = [v37 bottomAnchor];
          v39 = [(PKDrawingPaletteInputAssistantView *)self bottomAnchor];
          v40 = [v38 constraintEqualToAnchor:v39];
          v110[8] = v40;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:9];
          [v75 activateConstraints:v41];

          v42 = v73;
          v43 = v76;

          v44 = (void *)v74;
        }
        else
        {
          v77 = (void *)MEMORY[0x1E4F28DC8];
          v43 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v42 = [v43 topAnchor];
          v44 = [(PKDrawingPaletteInputAssistantView *)self topAnchor];
          v100 = [v42 constraintGreaterThanOrEqualToAnchor:v44];
          v109[0] = v100;
          v99 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v47 = [v99 bottomAnchor];
          v97 = [(PKDrawingPaletteInputAssistantView *)self centerYAnchor];
          v98 = v47;
          v96 = [v47 constraintEqualToAnchor:v97 constant:-(v25 * 0.5)];
          v109[1] = v96;
          v95 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          v48 = [v95 trailingAnchor];
          v93 = [(PKDrawingPaletteInputAssistantView *)self trailingAnchor];
          v94 = v48;
          v92 = [v48 constraintEqualToAnchor:v93];
          v109[2] = v92;
          v49 = [v16 topAnchor];
          v90 = [(PKDrawingPaletteInputAssistantView *)self centerYAnchor];
          v91 = v49;
          v89 = [v49 constraintEqualToAnchor:v90 constant:v25 * 0.5];
          v109[3] = v89;
          v50 = [v16 trailingAnchor];
          v87 = [(PKDrawingPaletteInputAssistantView *)self trailingAnchor];
          v88 = v50;
          v86 = [v50 constraintEqualToAnchor:v87];
          v109[4] = v86;
          v51 = [v16 bottomAnchor];
          v84 = [(PKDrawingPaletteInputAssistantView *)self bottomAnchor];
          v85 = v51;
          v83 = [v51 constraintLessThanOrEqualToAnchor:v84];
          v109[5] = v83;
          v82 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
          v52 = [v82 trailingAnchor];
          v80 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
          [v80 leadingAnchor];
          v79 = v81 = v52;
          v78 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", -v25);
          v109[6] = v78;
          v33 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
          v34 = [v33 centerYAnchor];
          v35 = [(PKDrawingPaletteInputAssistantView *)self centerYAnchor];
          v36 = [v34 constraintEqualToAnchor:v35];
          v109[7] = v36;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:8];
          [v77 activateConstraints:v37];
        }

        goto LABEL_26;
      }
      switch(v4)
      {
        case 1:
          v45 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
          v46 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          [v45 addButtonsFromArray:v46];

          uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          [v16 removeAllButtons];
          goto LABEL_26;
        case 2:
          v53 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
          v54 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v55 = [v54 firstObject];
          v108 = v55;
          v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
          [v53 addButtonsFromArray:v56];

          uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v57 = [v17 lastObject];
          v107 = v57;
          v58 = (void *)MEMORY[0x1E4F1C978];
          v59 = &v107;
          goto LABEL_23;
        case 3:
          v60 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
          v61 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v62 = objc_msgSend(v61, "subarrayWithRange:", 0, 2);
          [v60 addButtonsFromArray:v62];

          uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v57 = [v17 lastObject];
          v106 = v57;
          v58 = (void *)MEMORY[0x1E4F1C978];
          v59 = &v106;
          goto LABEL_23;
        case 4:
          v63 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
          v64 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v65 = objc_msgSend(v64, "subarrayWithRange:", 0, 2);
          [v63 addButtonsFromArray:v65];

          uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v57 = objc_msgSend(v17, "subarrayWithRange:", 2, 2);
          [v16 addButtonsFromArray:v57];
          goto LABEL_24;
        default:
          v66 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
          v67 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v68 = objc_msgSend(v67, "subarrayWithRange:", 0, 2);
          [v66 addButtonsFromArray:v68];

          v69 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          v70 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v71 = objc_msgSend(v70, "subarrayWithRange:", 2, 1);
          [v69 addButtonsFromArray:v71];

          uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
          uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self buttons];
          v57 = [v17 lastObject];
          v105 = v57;
          v58 = (void *)MEMORY[0x1E4F1C978];
          v59 = &v105;
LABEL_23:
          v72 = [v58 arrayWithObjects:v59 count:1];
          [v16 addButtonsFromArray:v72];

LABEL_24:
          break;
      }
    }

LABEL_26:
  }
}

- (id)_topOrTrailingGroupViewButtons
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(PKDrawingPaletteInputAssistantView *)self useCompactLayout])
  {
    if ([(PKDrawingPaletteInputAssistantView *)self shouldShowKeyboardButton])
    {
      uint64_t v4 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];

      if (v4)
      {
        int v5 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
        [v3 addObject:v5];
      }
    }
    if ([(PKDrawingPaletteInputAssistantView *)self shouldShowReturnKeyButton])
    {
      uint64_t v6 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];

      if (v6)
      {
        uint64_t v7 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
        [v3 addObject:v7];
      }
    }
  }

  return v3;
}

- (void)_updateContentOrientation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
  uint64_t v4 = [v3 arrangedSubviews];
  int v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        BOOL v11 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
        [v11 removeArrangedSubview:v10];

        [v10 removeFromSuperview];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  int64_t v12 = [(PKDrawingPaletteInputAssistantView *)self _contentStackViewAlignment];
  uint64_t v13 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
  [v13 setAlignment:v12];

  LODWORD(v13) = [(PKDrawingPaletteInputAssistantView *)self useCompactLayout];
  double v14 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
  uint64_t v15 = v14;
  if (!v13)
  {
    [v14 setAxis:1];

    v28 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
    v29 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
    [v28 addArrangedSubview:v29];

    unint64_t v26 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
    uint64_t v27 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
    goto LABEL_14;
  }
  [v14 setAxis:0];

  uint64_t v16 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
  [v16 setAxis:0];

  uint64_t v17 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
  [v17 setAxis:0];

  double v18 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
  BOOL v19 = [v18 buttons];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    BOOL v21 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
    long long v22 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
    [v21 addArrangedSubview:v22];
  }
  long long v23 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
  double v24 = [v23 buttons];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    unint64_t v26 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
    uint64_t v27 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
LABEL_14:
    uint64_t v30 = (void *)v27;
    [v26 addArrangedSubview:v27];
  }
}

- (void)_updateContentScalingFactor
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
  double v4 = v3;
  int v5 = [(PKDrawingPaletteInputAssistantView *)self topOrTrailingGroupView];
  [v5 setScalingFactor:v4];

  [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
  double v7 = v6;
  uint64_t v8 = [(PKDrawingPaletteInputAssistantView *)self bottomOrLeadingGroupView];
  [v8 setScalingFactor:v7];

  [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
  double v10 = v9;
  BOOL v11 = [(PKDrawingPaletteInputAssistantView *)self returnKeyButton];
  [v11 setScalingFactor:v10];

  [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
  double v13 = v12;
  double v14 = [(PKDrawingPaletteInputAssistantView *)self keyboardButton];
  [v14 setScalingFactor:v13];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [(PKDrawingPaletteInputAssistantView *)self buttons];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v21 + 1) + 8 * v19);
        [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
        objc_msgSend(v20, "setScalingFactor:");
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)_updateContentViewSpacing
{
  [(PKDrawingPaletteInputAssistantView *)self _contentStackViewSpacing];
  double v4 = v3;
  id v5 = [(PKDrawingPaletteInputAssistantView *)self contentStackView];
  [v5 setSpacing:v4];
}

- (int64_t)_contentStackViewAlignment
{
  if ([(PKDrawingPaletteInputAssistantView *)self useCompactLayout]) {
    return 3;
  }
  else {
    return 1;
  }
}

- (double)_contentStackViewSpacing
{
  if ([(PKDrawingPaletteInputAssistantView *)self useCompactLayout]
    || ([(PKDrawingPaletteInputAssistantView *)self buttons],
        double v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = [v3 count],
        v3,
        double result = 0.0,
        v4 >= 2))
  {
    [(PKDrawingPaletteInputAssistantView *)self scalingFactor];
    return v6 * 12.0;
  }
  return result;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateContentOrientation];
    [(PKDrawingPaletteInputAssistantView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKDrawingPaletteInputAssistantView *)self _updateUI];
    [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];
  }
}

- (void)buttonDidChangeIntrinsicContentSize:(id)a3
{
  [(PKDrawingPaletteInputAssistantView *)self _notifyViewStateDidChange];

  [(PKDrawingPaletteInputAssistantView *)self invalidateIntrinsicContentSize];
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (BOOL)shouldShowKeyboardButton
{
  return self->_shouldShowKeyboardButton;
}

- (BOOL)shouldShowReturnKeyButton
{
  return self->_shouldShowReturnKeyButton;
}

- (BOOL)enableKeyboardButtons
{
  return self->_enableKeyboardButtons;
}

- (PKPaletteKeyboardButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
}

- (PKPaletteButton)returnKeyButton
{
  return self->_returnKeyButton;
}

- (void)setReturnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->_returnKeyButton, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
}

- (PKPaletteButtonGroupView)topOrTrailingGroupView
{
  return self->_topOrTrailingGroupView;
}

- (void)setTopOrTrailingGroupView:(id)a3
{
}

- (PKPaletteButtonGroupView)bottomOrLeadingGroupView
{
  return self->_bottomOrLeadingGroupView;
}

- (void)setBottomOrLeadingGroupView:(id)a3
{
}

- (NSHashTable)viewStateObservers
{
  return self->_viewStateObservers;
}

- (void)setViewStateObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewStateObservers, 0);
  objc_storeStrong((id *)&self->_bottomOrLeadingGroupView, 0);
  objc_storeStrong((id *)&self->_topOrTrailingGroupView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_returnKeyButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

@end