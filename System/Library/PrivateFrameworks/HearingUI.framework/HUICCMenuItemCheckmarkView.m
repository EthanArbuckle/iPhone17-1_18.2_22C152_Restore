@interface HUICCMenuItemCheckmarkView
- (BOOL)isAccessibilityElement;
- (CCUIMenuModuleItem)menuItem;
- (HUICCMenuItemCheckmarkView)initWithFrame:(CGRect)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSMutableDictionary)categoriesToVisualStylingProviders;
- (UIImageView)checkmarkView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UIStackView)verticalTitleStack;
- (UIView)containerView;
- (UIView)highlightedBackgroundView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setCategoriesToVisualStylingProviders:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundView:(id)a3;
- (void)setMenuItem:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVerticalTitleStack:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation HUICCMenuItemCheckmarkView

- (HUICCMenuItemCheckmarkView)initWithFrame:(CGRect)a3
{
  v84[5] = *MEMORY[0x263EF8340];
  v82.receiver = self;
  v82.super_class = (Class)HUICCMenuItemCheckmarkView;
  v3 = -[HUICCMenuItemCheckmarkView initWithFrame:](&v82, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F33CA0] _tertiaryView];
    highlightedBackgroundView = v3->_highlightedBackgroundView;
    v3->_highlightedBackgroundView = (UIView *)v4;

    [(UIView *)v3->_highlightedBackgroundView setAutoresizingMask:18];
    [(UIView *)v3->_highlightedBackgroundView setAlpha:0.0];
    [(HUICCMenuItemCheckmarkView *)v3 addSubview:v3->_highlightedBackgroundView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    containerView = v3->_containerView;
    v3->_containerView = v6;

    v8 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)v3->_containerView setBackgroundColor:v8];

    [(UIView *)v3->_containerView setUserInteractionEnabled:0];
    [(UIView *)v3->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUICCMenuItemCheckmarkView *)v3 addSubview:v3->_containerView];
    v70 = (void *)MEMORY[0x263F08938];
    v80 = [(UIView *)v3->_containerView leadingAnchor];
    v78 = [(HUICCMenuItemCheckmarkView *)v3 leadingAnchor];
    CCUILayoutGutter();
    v76 = objc_msgSend(v80, "constraintEqualToAnchor:constant:", v78);
    v84[0] = v76;
    v74 = [(UIView *)v3->_containerView trailingAnchor];
    v72 = [(HUICCMenuItemCheckmarkView *)v3 trailingAnchor];
    CCUILayoutGutter();
    v68 = [v74 constraintEqualToAnchor:v72 constant:-v9];
    v84[1] = v68;
    v66 = [(UIView *)v3->_containerView topAnchor];
    v10 = [(HUICCMenuItemCheckmarkView *)v3 topAnchor];
    CCUILayoutGutter();
    v12 = [v66 constraintEqualToAnchor:v10 constant:v11 * 0.25];
    v84[2] = v12;
    v13 = [(UIView *)v3->_containerView bottomAnchor];
    v14 = [(HUICCMenuItemCheckmarkView *)v3 bottomAnchor];
    CCUILayoutGutter();
    v16 = [v13 constraintEqualToAnchor:v14 constant:v15 * -0.25];
    v84[3] = v16;
    v17 = [(UIView *)v3->_containerView heightAnchor];
    v18 = [v17 constraintGreaterThanOrEqualToConstant:52.0];
    v84[4] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:5];
    [v70 activateConstraints:v19];

    v20 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    verticalTitleStack = v3->_verticalTitleStack;
    v3->_verticalTitleStack = v20;

    [(UIStackView *)v3->_verticalTitleStack setDistribution:1];
    [(UIStackView *)v3->_verticalTitleStack setAxis:1];
    [(UIStackView *)v3->_verticalTitleStack setSpacing:0.0];
    [(UIStackView *)v3->_verticalTitleStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_containerView addSubview:v3->_verticalTitleStack];
    uint64_t v22 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUICCMenuItemCheckmarkView semanticContentAttribute](v3, "semanticContentAttribute"));
    uint64_t v23 = HUICCMenuTextLabel();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v23;

    uint64_t v25 = 2 * (v22 == 1);
    if (v22 == 1) {
      uint64_t v26 = 7;
    }
    else {
      uint64_t v26 = 8;
    }
    [(UILabel *)v3->_titleLabel setTextAlignment:v25];
    [(UILabel *)v3->_titleLabel setLineBreakMode:4];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v27 = v3->_titleLabel;
    v28 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v27 setTextColor:v28];

    [(UILabel *)v3->_titleLabel sizeToFit];
    [(UIStackView *)v3->_verticalTitleStack addArrangedSubview:v3->_titleLabel];
    uint64_t v29 = HUICCMenuTextLabel();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v29;

    [(UILabel *)v3->_subtitleLabel setTextAlignment:v25];
    [(UILabel *)v3->_subtitleLabel setLineBreakMode:4];
    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    v31 = v3->_subtitleLabel;
    v32 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v31 setTextColor:v32];

    [(UILabel *)v3->_subtitleLabel sizeToFit];
    [(UIStackView *)v3->_verticalTitleStack addArrangedSubview:v3->_subtitleLabel];
    id v33 = objc_alloc(MEMORY[0x263F82828]);
    v34 = (void *)MEMORY[0x263F827E8];
    v35 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835F0]];
    v36 = [v34 systemImageNamed:@"checkmark" withConfiguration:v35];
    uint64_t v37 = [v33 initWithImage:v36];
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = (UIImageView *)v37;

    [(UIImageView *)v3->_checkmarkView setContentMode:v26];
    v39 = v3->_checkmarkView;
    v40 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v39 setTintColor:v40];

    [(UIImageView *)v3->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_containerView addSubview:v3->_checkmarkView];
    v64 = (void *)MEMORY[0x263F08938];
    v81 = [(UIStackView *)v3->_verticalTitleStack leadingAnchor];
    v79 = [(UIView *)v3->_containerView leadingAnchor];
    v77 = [v81 constraintEqualToAnchor:v79];
    v83[0] = v77;
    v75 = [(UIStackView *)v3->_verticalTitleStack topAnchor];
    v73 = [(UIView *)v3->_containerView topAnchor];
    v71 = [v75 constraintEqualToAnchor:v73];
    v83[1] = v71;
    v69 = [(UIStackView *)v3->_verticalTitleStack bottomAnchor];
    v67 = [(UIView *)v3->_containerView bottomAnchor];
    v65 = [v69 constraintEqualToAnchor:v67];
    v83[2] = v65;
    v63 = [(UIImageView *)v3->_checkmarkView leadingAnchor];
    v62 = [(UIStackView *)v3->_verticalTitleStack trailingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v83[3] = v61;
    v60 = [(UIImageView *)v3->_checkmarkView trailingAnchor];
    v59 = [(UIView *)v3->_containerView trailingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v83[4] = v58;
    v41 = [(UIImageView *)v3->_checkmarkView centerYAnchor];
    v42 = [(UIView *)v3->_containerView centerYAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v83[5] = v43;
    v44 = [(UIImageView *)v3->_checkmarkView heightAnchor];
    v45 = [v44 constraintEqualToConstant:18.0];
    v83[6] = v45;
    v46 = [(UIImageView *)v3->_checkmarkView widthAnchor];
    v47 = [v46 constraintEqualToConstant:18.0];
    v83[7] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:8];
    [v64 activateConstraints:v48];

    v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    categoriesToVisualStylingProviders = v3->_categoriesToVisualStylingProviders;
    v3->_categoriesToVisualStylingProviders = v49;

    v51 = HUICCBackgroundVisualStylingProviderForCategory(1);
    [(HUICCMenuItemCheckmarkView *)v3 setVisualStylingProvider:v51 forCategory:1];

    v52 = HUICCBackgroundVisualStylingProviderForCategory(2);
    [(HUICCMenuItemCheckmarkView *)v3 setVisualStylingProvider:v52 forCategory:2];

    id v53 = objc_alloc(MEMORY[0x263F82BC0]);
    v54 = [MEMORY[0x263F830C8] lightConfiguration];
    uint64_t v55 = [v53 initWithConfiguration:v54 view:v3];
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = (UISelectionFeedbackGenerator *)v55;
  }
  return v3;
}

- (void)setMenuItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_menuItem, a3);
  v6 = [v5 title];
  v7 = [(HUICCMenuItemCheckmarkView *)self titleLabel];
  [v7 setText:v6];

  v8 = [v5 subtitle];
  double v9 = [(HUICCMenuItemCheckmarkView *)self subtitleLabel];
  [v9 setText:v8];

  v10 = [(HUICCMenuItemCheckmarkView *)self subtitleLabel];
  double v11 = [(HUICCMenuItemCheckmarkView *)self subtitleLabel];
  v12 = [v11 text];
  if (v12)
  {
    v13 = [(HUICCMenuItemCheckmarkView *)self subtitleLabel];
    v14 = [v13 text];
    objc_msgSend(v10, "setHidden:", objc_msgSend(v14, "isEqualToString:", &stru_26DAB2B88));
  }
  else
  {
    [v10 setHidden:1];
  }

  double v15 = [(HUICCMenuItemCheckmarkView *)self checkmarkView];
  objc_msgSend(v15, "setHidden:", objc_msgSend(v5, "isSelected") ^ 1);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v16 = [(HUICCMenuItemCheckmarkView *)self requiredVisualStyleCategories];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v22 = [(HUICCMenuItemCheckmarkView *)self categoriesToVisualStylingProviders];
        uint64_t v23 = [v22 objectForKeyedSubscript:v21];
        -[HUICCMenuItemCheckmarkView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v23, [v21 integerValue]);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUICCMenuItemCheckmarkView;
  -[HUICCMenuItemCheckmarkView setHighlighted:](&v9, sel_setHighlighted_);
  if (v3)
  {
    id v5 = [(HUICCMenuItemCheckmarkView *)self feedbackGenerator];
    [v5 selectionChanged];

    v6 = [(HUICCMenuItemCheckmarkView *)self highlightedBackgroundView];
    v7 = v6;
    double v8 = 1.0;
  }
  else
  {
    v6 = [(HUICCMenuItemCheckmarkView *)self highlightedBackgroundView];
    v7 = v6;
    double v8 = 0.0;
  }
  [v6 setAlpha:v8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(HUICCMenuItemCheckmarkView *)self titleLabel];
  BOOL v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(HUICCMenuItemCheckmarkView *)self subtitleLabel];
  BOOL v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F83260];
  BOOL v3 = [(HUICCMenuItemCheckmarkView *)self checkmarkView];
  int v4 = [v3 isHidden];

  uint64_t v5 = *MEMORY[0x263F832A8];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26DAB9B20;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  v7 = [(HUICCMenuItemCheckmarkView *)self requiredVisualStyleCategories];
  double v8 = [NSNumber numberWithInteger:a4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10 = [(HUICCMenuItemCheckmarkView *)self categoriesToVisualStylingProviders];
    double v11 = [NSNumber numberWithInteger:a4];
    [v10 setObject:v6 forKeyedSubscript:v11];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__HUICCMenuItemCheckmarkView_setVisualStylingProvider_forCategory___block_invoke;
    v12[3] = &unk_2647CD360;
    id v13 = v6;
    v14 = self;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __67__HUICCMenuItemCheckmarkView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) titleLabel];
  [v2 automaticallyUpdateView:v3 withStyle:0];

  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) subtitleLabel];
  [v4 automaticallyUpdateView:v5 withStyle:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) checkmarkView];
  [v6 automaticallyUpdateView:v7 withStyle:0];
}

- (CCUIMenuModuleItem)menuItem
{
  return self->_menuItem;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
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

- (UIStackView)verticalTitleStack
{
  return self->_verticalTitleStack;
}

- (void)setVerticalTitleStack:(id)a3
{
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (NSMutableDictionary)categoriesToVisualStylingProviders
{
  return self->_categoriesToVisualStylingProviders;
}

- (void)setCategoriesToVisualStylingProviders:(id)a3
{
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_verticalTitleStack, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_menuItem, 0);
}

@end