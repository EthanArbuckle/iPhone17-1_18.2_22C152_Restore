@interface HUICCCapsuleButton
- (BOOL)accessibilityActivate;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (BOOL)isExpanded;
- (BOOL)shouldAddSeparatorForView:(id)a3;
- (BOOL)shouldAutoExpandForView:(id)a3;
- (BOOL)shouldIncludeIconViewInFooterViews;
- (BOOL)supportsExpanding;
- (CGPoint)accessibilityActivationPoint;
- (HACCContentModuleDelegate)delegate;
- (HACCStackView)expandedStack;
- (HUICCCapsuleButton)initWithFrame:(CGRect)a3;
- (MTMaterialView)backgroundView;
- (NSArray)defaultLayouts;
- (NSArray)largeTextLayouts;
- (NSArray)requiredVisualStyleCategories;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)horizontalPillStack;
- (UIStackView)mainStack;
- (UIStackView)verticalTitleStack;
- (UIView)accessoryView;
- (UIView)accessoryViewContainer;
- (UIView)iconView;
- (UIView)iconViewContainer;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)contentValue;
- (int64_t)_indexToInsertFor:(id)a3;
- (unint64_t)accessibilityTraits;
- (unint64_t)module;
- (void)_setIsExpanded:(BOOL)a3;
- (void)_updateStackConstraints;
- (void)addExpandedView:(id)a3;
- (void)buttonTapped;
- (void)removeExpandedView:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewContainer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDefaultLayouts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingState:(BOOL)a3;
- (void)setExpandedStack:(id)a3;
- (void)setHorizontalPillStack:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIconViewContainer:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setLargeTextLayouts:(id)a3;
- (void)setMainStack:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setVerticalTitleStack:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation HUICCCapsuleButton

- (HUICCCapsuleButton)initWithFrame:(CGRect)a3
{
  v90[4] = *MEMORY[0x263EF8340];
  v85.receiver = self;
  v85.super_class = (Class)HUICCCapsuleButton;
  v3 = -[HUICCCapsuleButton initWithFrame:](&v85, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(HUICCCapsuleButton *)v3 setClipsToBounds:1];
    [(HUICCCapsuleButton *)v4 _setContinuousCornerRadius:37.0];
    uint64_t v5 = HUICCBackgroundMaterialView();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (MTMaterialView *)v5;

    [(MTMaterialView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MTMaterialView *)v4->_backgroundView setUserInteractionEnabled:1];
    [(HUICCCapsuleButton *)v4 insertSubview:v4->_backgroundView atIndex:0];
    v74 = (void *)MEMORY[0x263F08938];
    v84 = [(MTMaterialView *)v4->_backgroundView leadingAnchor];
    v82 = [(HUICCCapsuleButton *)v4 leadingAnchor];
    v80 = [v84 constraintEqualToAnchor:v82];
    v90[0] = v80;
    v78 = [(MTMaterialView *)v4->_backgroundView trailingAnchor];
    v76 = [(HUICCCapsuleButton *)v4 trailingAnchor];
    v7 = [v78 constraintEqualToAnchor:v76];
    v90[1] = v7;
    v8 = [(MTMaterialView *)v4->_backgroundView topAnchor];
    v9 = [(HUICCCapsuleButton *)v4 topAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v90[2] = v10;
    v11 = [(MTMaterialView *)v4->_backgroundView bottomAnchor];
    v12 = [(HUICCCapsuleButton *)v4 bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v90[3] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:4];
    [v74 activateConstraints:v14];

    v15 = (void *)MEMORY[0x263F08938];
    v16 = [(HUICCCapsuleButton *)v4 heightAnchor];
    v17 = [v16 constraintGreaterThanOrEqualToConstant:74.0];
    v89 = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
    [v15 activateConstraints:v18];

    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    mainStack = v4->_mainStack;
    v4->_mainStack = v19;

    [(UIStackView *)v4->_mainStack setDistribution:0];
    [(UIStackView *)v4->_mainStack setAxis:1];
    [(UIStackView *)v4->_mainStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MTMaterialView *)v4->_backgroundView addSubview:v4->_mainStack];
    v75 = (void *)MEMORY[0x263F08938];
    v83 = [(UIStackView *)v4->_mainStack leadingAnchor];
    v81 = [(HUICCCapsuleButton *)v4 leadingAnchor];
    v79 = [v83 constraintEqualToAnchor:v81];
    v88[0] = v79;
    v77 = [(UIStackView *)v4->_mainStack trailingAnchor];
    v21 = [(HUICCCapsuleButton *)v4 trailingAnchor];
    v22 = [v77 constraintEqualToAnchor:v21];
    v88[1] = v22;
    v23 = [(UIStackView *)v4->_mainStack topAnchor];
    v24 = [(HUICCCapsuleButton *)v4 topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v88[2] = v25;
    v26 = [(UIStackView *)v4->_mainStack bottomAnchor];
    v27 = [(HUICCCapsuleButton *)v4 bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v88[3] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:4];
    [v75 activateConstraints:v29];

    v30 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    horizontalPillStack = v4->_horizontalPillStack;
    v4->_horizontalPillStack = v30;

    [(UIStackView *)v4->_horizontalPillStack setAxis:0];
    [(UIStackView *)v4->_horizontalPillStack setAlignment:3];
    [(UIStackView *)v4->_horizontalPillStack setSpacing:20.0];
    [(UIStackView *)v4->_horizontalPillStack setLayoutMarginsRelativeArrangement:1];
    -[UIStackView setLayoutMargins:](v4->_horizontalPillStack, "setLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
    [(UIStackView *)v4->_horizontalPillStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_mainStack addArrangedSubview:v4->_horizontalPillStack];
    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(HUICCCapsuleButton *)v4 horizontalPillStack];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintGreaterThanOrEqualToConstant:74.0];
    v87 = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v87 count:1];
    [v32 activateConstraints:v36];

    v37 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    iconViewContainer = v4->_iconViewContainer;
    v4->_iconViewContainer = v37;

    [(UIView *)v4->_iconViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_horizontalPillStack addArrangedSubview:v4->_iconViewContainer];
    v39 = (void *)MEMORY[0x263F08938];
    v40 = [(UIView *)v4->_iconViewContainer heightAnchor];
    v41 = [v40 constraintEqualToConstant:54.0];
    v86[0] = v41;
    v42 = [(UIView *)v4->_iconViewContainer widthAnchor];
    v43 = [v42 constraintEqualToConstant:54.0];
    v86[1] = v43;
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:2];
    [v39 activateConstraints:v44];

    v45 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    verticalTitleStack = v4->_verticalTitleStack;
    v4->_verticalTitleStack = v45;

    [(UIStackView *)v4->_verticalTitleStack setAxis:1];
    [(UIStackView *)v4->_verticalTitleStack setAlignment:3];
    [(UIStackView *)v4->_horizontalPillStack addArrangedSubview:v4->_verticalTitleStack];
    v47 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    accessoryViewContainer = v4->_accessoryViewContainer;
    v4->_accessoryViewContainer = v47;

    [(UIView *)v4->_accessoryViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_horizontalPillStack addArrangedSubview:v4->_accessoryViewContainer];
    v49 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v49;

    v51 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] addingSymbolicTraits:32770 options:0];
    v52 = v4->_titleLabel;
    v53 = (void *)MEMORY[0x263F81708];
    [v51 pointSize];
    v54 = objc_msgSend(v53, "fontWithDescriptor:size:", v51);
    [(UILabel *)v52 setFont:v54];

    v55 = v4->_titleLabel;
    v56 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v55 setTextColor:v56];

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_titleLabel setClipsToBounds:0];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    LODWORD(v57) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v57];
    LODWORD(v58) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:0 forAxis:v58];
    [(UILabel *)v4->_titleLabel setAutoresizingMask:18];
    [(UIStackView *)v4->_verticalTitleStack addArrangedSubview:v4->_titleLabel];
    v59 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v59;

    v61 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835E8] addingSymbolicTraits:0x8000 options:0];

    v62 = v4->_subtitleLabel;
    v63 = (void *)MEMORY[0x263F81708];
    [v61 pointSize];
    v64 = objc_msgSend(v63, "fontWithDescriptor:size:", v61);
    [(UILabel *)v62 setFont:v64];

    v65 = v4->_subtitleLabel;
    v66 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v65 setTextColor:v66];

    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v4->_subtitleLabel setClipsToBounds:0];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    LODWORD(v67) = 1144750080;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v67];
    LODWORD(v68) = 1144750080;
    [(UILabel *)v4->_subtitleLabel setContentCompressionResistancePriority:0 forAxis:v68];
    [(UILabel *)v4->_subtitleLabel setAutoresizingMask:18];
    [(UIStackView *)v4->_verticalTitleStack addArrangedSubview:v4->_subtitleLabel];
    v69 = objc_alloc_init(HACCStackView);
    expandedStack = v4->_expandedStack;
    v4->_expandedStack = v69;

    [(HACCStackView *)v4->_expandedStack setAxis:1];
    [(HACCStackView *)v4->_expandedStack setAlignment:0];
    [(UIStackView *)v4->_mainStack addArrangedSubview:v4->_expandedStack];
    v4->_isExpanded = 0;
    [(HACCStackView *)v4->_expandedStack setAlpha:0.0];
    [(HACCStackView *)v4->_expandedStack setHidden:1];
    v71 = HUICCBackgroundVisualStylingProviderForCategory(1);
    [(HUICCCapsuleButton *)v4 setVisualStylingProvider:v71 forCategory:1];

    v72 = HUICCBackgroundVisualStylingProviderForCategory(2);
    [(HUICCCapsuleButton *)v4 setVisualStylingProvider:v72 forCategory:2];
  }
  return v4;
}

- (void)setIconView:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_iconView = &self->_iconView;
  objc_storeStrong((id *)&self->_iconView, a3);
  if (self->_iconView)
  {
    v7 = [(HUICCCapsuleButton *)self iconViewContainer];
    [v7 addSubview:*p_iconView];

    [(UIView *)*p_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x263F08938];
    v8 = [(UIView *)*p_iconView centerYAnchor];
    v9 = [(HUICCCapsuleButton *)self iconViewContainer];
    v10 = [v9 centerYAnchor];
    v11 = [v8 constraintEqualToAnchor:v10];
    v18[0] = v11;
    v12 = [(UIView *)*p_iconView centerXAnchor];
    v13 = [(HUICCCapsuleButton *)self iconViewContainer];
    v14 = [v13 centerXAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    v18[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    [v17 activateConstraints:v16];
  }
}

- (void)setAccessoryView:(id)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_accessoryView = &self->_accessoryView;
  objc_storeStrong((id *)&self->_accessoryView, a3);
  if (self->_accessoryView)
  {
    v7 = [(HUICCCapsuleButton *)self accessoryViewContainer];
    [v7 addSubview:*p_accessoryView];

    [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = (void *)MEMORY[0x263F08938];
    v24 = [(UIView *)*p_accessoryView leadingAnchor];
    v25 = [(HUICCCapsuleButton *)self accessoryViewContainer];
    v23 = [v25 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v27[0] = v22;
    v20 = [(UIView *)*p_accessoryView trailingAnchor];
    v21 = [(HUICCCapsuleButton *)self accessoryViewContainer];
    v19 = [v21 trailingAnchor];
    v8 = [v20 constraintEqualToAnchor:v19];
    v27[1] = v8;
    v9 = [(UIView *)*p_accessoryView topAnchor];
    [(HUICCCapsuleButton *)self accessoryViewContainer];
    v10 = id v26 = v5;
    v11 = [v10 topAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v27[2] = v12;
    v13 = [(UIView *)*p_accessoryView bottomAnchor];
    v14 = [(HUICCCapsuleButton *)self accessoryViewContainer];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v27[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    [v18 activateConstraints:v17];

    id v5 = v26;
  }
}

- (void)_updateStackConstraints
{
  v32[2] = *MEMORY[0x263EF8340];
  int v3 = HUICCLargeTextEnabled();
  v4 = [(HUICCCapsuleButton *)self horizontalPillStack];
  id v5 = v4;
  if (v3)
  {
    [v4 setAxis:1];

    v6 = [(HUICCCapsuleButton *)self defaultLayouts];

    if (v6)
    {
      v7 = (void *)MEMORY[0x263F08938];
      v8 = [(HUICCCapsuleButton *)self defaultLayouts];
      [v7 deactivateConstraints:v8];
    }
    v9 = [(HUICCCapsuleButton *)self largeTextLayouts];

    if (!v9)
    {
      v10 = [(HUICCCapsuleButton *)self accessoryViewContainer];
      v11 = [v10 widthAnchor];
      v12 = [v11 constraintLessThanOrEqualToConstant:54.0];
      v32[0] = v12;
      v13 = [(HUICCCapsuleButton *)self accessoryViewContainer];
      v14 = [v13 heightAnchor];
      v15 = [v14 constraintLessThanOrEqualToConstant:54.0];
      v32[1] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
      [(HUICCCapsuleButton *)self setLargeTextLayouts:v16];
    }
    v17 = (void *)MEMORY[0x263F08938];
    uint64_t v18 = [(HUICCCapsuleButton *)self largeTextLayouts];
  }
  else
  {
    [v4 setAxis:0];

    v19 = [(HUICCCapsuleButton *)self largeTextLayouts];

    if (v19)
    {
      v20 = (void *)MEMORY[0x263F08938];
      v21 = [(HUICCCapsuleButton *)self largeTextLayouts];
      [v20 deactivateConstraints:v21];
    }
    v22 = [(HUICCCapsuleButton *)self defaultLayouts];

    if (!v22)
    {
      v23 = [(HUICCCapsuleButton *)self accessoryViewContainer];
      v24 = [v23 widthAnchor];
      v25 = [v24 constraintEqualToConstant:54.0];
      v31[0] = v25;
      id v26 = [(HUICCCapsuleButton *)self accessoryViewContainer];
      v27 = [v26 heightAnchor];
      v28 = [v27 constraintEqualToConstant:54.0];
      v31[1] = v28;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      [(HUICCCapsuleButton *)self setDefaultLayouts:v29];
    }
    v17 = (void *)MEMORY[0x263F08938];
    uint64_t v18 = [(HUICCCapsuleButton *)self defaultLayouts];
  }
  v30 = (void *)v18;
  [v17 activateConstraints:v18];
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUICCCapsuleButton *)self titleLabel];
  [v5 setText:v4];
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUICCCapsuleButton *)self subtitleLabel];
  [v5 setText:v4];
}

- (void)setDimmingState:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 0.3;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [(HUICCCapsuleButton *)self mainStack];
  [v6 setAlpha:v5];

  [(HUICCCapsuleButton *)self setEnabled:!v3];
}

- (void)setIsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUICCCapsuleButton *)self supportsExpanding] && self->_isExpanded != v3)
  {
    [(HUICCCapsuleButton *)self _setIsExpanded:v3];
  }
}

- (void)_setIsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isExpanded = a3;
  double v5 = [(HUICCCapsuleButton *)self expandedStack];
  v6 = v5;
  double v7 = 0.0;
  if (v3) {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  v8 = [(HUICCCapsuleButton *)self expandedStack];
  [v8 setHidden:!v3];

  id v9 = [(HUICCCapsuleButton *)self delegate];
  [v9 updateHeight];
}

- (BOOL)supportsExpanding
{
  unint64_t v3 = [(HUICCCapsuleButton *)self module];
  if (v3)
  {
    if (v3 == 24)
    {
      return 1;
    }
    else
    {
      if (v3 == 31)
      {
        id v4 = [(HUICCCapsuleButton *)self delegate];
        char v5 = [v4 showPMEExpandedOptions];

        return v5;
      }
      return 0;
    }
  }
  else
  {
    double v7 = [(HUICCCapsuleButton *)self delegate];
    v8 = [v7 currentHearingDevice];
    if (v8)
    {
      id v9 = [MEMORY[0x263F47528] sharedInstance];
      char v10 = [v9 hearingAidReachable];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (void)addExpandedView:(id)a3
{
  id v4 = a3;
  char v5 = [(HUICCCapsuleButton *)self expandedStack];
  objc_msgSend(v5, "insertArrangedSubview:atIndex:withSeparator:", v4, -[HUICCCapsuleButton _indexToInsertFor:](self, "_indexToInsertFor:", v4), -[HUICCCapsuleButton shouldAddSeparatorForView:](self, "shouldAddSeparatorForView:", v4));

  LODWORD(v5) = [(HUICCCapsuleButton *)self shouldAutoExpandForView:v4];
  if (v5)
  {
    v6 = [(HUICCCapsuleButton *)self expandedStack];
    double v7 = [v6 arrangedSubviews];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      [(HUICCCapsuleButton *)self _setIsExpanded:1];
    }
  }
}

- (int64_t)_indexToInsertFor:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v5 = [(HUICCCapsuleButton *)self expandedStack];
  v6 = [v5 arrangedSubviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      uint64_t v11 = 0;
      int64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        uint64_t v14 = [v4 tag];
        if (v14 < [v13 tag])
        {
          int64_t v12 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      int64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v12 = 0;
  }
LABEL_12:

  return v12;
}

- (void)removeExpandedView:(id)a3
{
  id v4 = a3;
  char v5 = [(HUICCCapsuleButton *)self expandedStack];
  [v5 removeArrangedSubview:v4];

  v6 = [(HUICCCapsuleButton *)self expandedStack];
  uint64_t v7 = [v6 arrangedSubviews];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [(HUICCCapsuleButton *)self setIsExpanded:0];
  }
}

- (void)buttonTapped
{
  unint64_t v3 = [(HUICCCapsuleButton *)self delegate];
  [v3 controlDidActivate:self];

  AXPerformBlockOnMainThreadAfterDelay();
}

void __34__HUICCCapsuleButton_buttonTapped__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 updateHeight];
}

- (BOOL)shouldAutoExpandForView:(id)a3
{
  return 0;
}

- (BOOL)shouldAddSeparatorForView:(id)a3
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(HUICCCapsuleButton *)self titleLabel];
  unint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(HUICCCapsuleButton *)self subtitleLabel];
  unint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(HUICCCapsuleButton *)self supportsExpanding])
  {
    [(HUICCCapsuleButton *)self isExpanded];
    id v4 = hearingLocString();
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x263F823A0]);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __48__HUICCCapsuleButton_accessibilityCustomActions__block_invoke;
    uint64_t v11 = &unk_2647CD388;
    objc_copyWeak(&v12, &location);
    v6 = (void *)[v5 initWithName:v4 actionHandler:&v8];
    objc_msgSend(v3, "addObject:", v6, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __48__HUICCCapsuleButton_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained isExpanded] ^ 1;
  id v4 = objc_loadWeakRetained(v1);
  [v4 setIsExpanded:v3];

  UIAccessibilityNotifications v5 = *MEMORY[0x263F831C0];
  id v6 = objc_loadWeakRetained(v1);
  if ([v6 isExpanded])
  {
    id v7 = objc_loadWeakRetained(v1);
    UIAccessibilityPostNotification(v5, v7);
  }
  else
  {
    UIAccessibilityPostNotification(v5, 0);
  }

  return 1;
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)HUICCCapsuleButton;
  BOOL v2 = [(HUICCCapsuleButton *)&v4 accessibilityActivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v3 = [(HUICCCapsuleButton *)self titleLabel];

  if (v3)
  {
    objc_super v4 = [(HUICCCapsuleButton *)self titleLabel];
    [v4 accessibilityActivationPoint];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUICCCapsuleButton;
    [(HUICCCapsuleButton *)&v11 accessibilityActivationPoint];
  }
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)shouldIncludeIconViewInFooterViews
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(HUICCCapsuleButton *)self isExpanded])
  {
    uint64_t v3 = [(HUICCCapsuleButton *)self expandedStack];
    objc_super v4 = [v3 arrangedSubviews];
    double v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    double v5 = [MEMORY[0x263EFF980] array];
  }
  if ([(HUICCCapsuleButton *)self shouldIncludeIconViewInFooterViews])
  {
    double v6 = [(HUICCCapsuleButton *)self iconView];

    if (v6)
    {
      double v7 = [(HUICCCapsuleButton *)self iconView];
      [v5 insertObject:v7 atIndex:0];
    }
  }
  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26DAB9B38;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(HUICCCapsuleButton *)self requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__HUICCCapsuleButton_setVisualStylingProvider_forCategory___block_invoke;
    v10[3] = &unk_2647CD360;
    id v11 = v6;
    id v12 = self;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __59__HUICCCapsuleButton_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) titleLabel];
  [v2 automaticallyUpdateView:v3 withStyle:0];

  objc_super v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) subtitleLabel];
  [v4 automaticallyUpdateView:v5 withStyle:1];
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

- (UIView)iconView
{
  return self->_iconView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIStackView)mainStack
{
  return self->_mainStack;
}

- (void)setMainStack:(id)a3
{
}

- (HACCStackView)expandedStack
{
  return self->_expandedStack;
}

- (void)setExpandedStack:(id)a3
{
}

- (UIStackView)horizontalPillStack
{
  return self->_horizontalPillStack;
}

- (void)setHorizontalPillStack:(id)a3
{
}

- (UIView)iconViewContainer
{
  return self->_iconViewContainer;
}

- (void)setIconViewContainer:(id)a3
{
}

- (UIStackView)verticalTitleStack
{
  return self->_verticalTitleStack;
}

- (void)setVerticalTitleStack:(id)a3
{
}

- (UIView)accessoryViewContainer
{
  return self->_accessoryViewContainer;
}

- (void)setAccessoryViewContainer:(id)a3
{
}

- (NSArray)defaultLayouts
{
  return self->_defaultLayouts;
}

- (void)setDefaultLayouts:(id)a3
{
}

- (NSArray)largeTextLayouts
{
  return self->_largeTextLayouts;
}

- (void)setLargeTextLayouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextLayouts, 0);
  objc_storeStrong((id *)&self->_defaultLayouts, 0);
  objc_storeStrong((id *)&self->_accessoryViewContainer, 0);
  objc_storeStrong((id *)&self->_verticalTitleStack, 0);
  objc_storeStrong((id *)&self->_iconViewContainer, 0);
  objc_storeStrong((id *)&self->_horizontalPillStack, 0);
  objc_storeStrong((id *)&self->_expandedStack, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)enabled
{
  return 1;
}

- (id)contentValue
{
  return (id)MEMORY[0x263EFFA88];
}

@end