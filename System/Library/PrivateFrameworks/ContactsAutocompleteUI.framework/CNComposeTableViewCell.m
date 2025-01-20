@interface CNComposeTableViewCell
+ (Class)containerViewClass;
+ (double)additionalSeparatorInset;
+ (id)axCappedFontWithTextStyle:(id)a3 bold:(BOOL)a4;
+ (id)axCappedSymbolConfigurationIsBold:(BOOL)a3;
+ (id)identifier;
+ (void)requireIntrinsicSizeForView:(id)a3;
- (BOOL)canCollapseRecipient;
- (BOOL)canExpandRecipient;
- (BOOL)supportsAvatarView;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (CNComposeRecipient)recipient;
- (CNComposeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NUIContainerStackView)labelViewStack;
- (UIColor)backgroundColor;
- (UIColor)labelColor;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3;
- (double)trailingButtonMidlineInsetFromLayoutMargin;
- (double)trailingButtonWidth;
- (id)labelWithTextStyle:(id)a3;
- (id)titleTextStyle;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)layoutMarginsDidChange;
- (void)setBackgroundColor:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLabelViewStack:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3;
@end

@implementation CNComposeTableViewCell

+ (id)identifier
{
  return 0;
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

+ (double)additionalSeparatorInset
{
  return 48.0;
}

+ (void)requireIntrinsicSizeForView:(id)a3
{
  id v5 = a3;
  LODWORD(v3) = 1148846080;
  [v5 setContentHuggingPriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [v5 setContentCompressionResistancePriority:0 forAxis:v4];
}

- (CNComposeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)CNComposeTableViewCell;
  double v4 = [(NUITableViewContainerCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    v6 = [(CNComposeTableViewCell *)v4 titleTextStyle];
    v7 = [(CNComposeTableViewCell *)v5 labelWithTextStyle:v6];
    [(CNComposeTableViewCell *)v5 setTitleLabel:v7];

    v8 = [MEMORY[0x1E4F428B8] labelColor];
    v9 = [(CNComposeTableViewCell *)v5 titleLabel];
    [v9 setTextColor:v8];

    int IsAppDesignedForVisionOS = CNComposeIsAppDesignedForVisionOS();
    v11 = (void *)MEMORY[0x1E4F43890];
    if (!IsAppDesignedForVisionOS) {
      v11 = (void *)MEMORY[0x1E4F438C8];
    }
    v12 = [(CNComposeTableViewCell *)v5 labelWithTextStyle:*v11];
    [(CNComposeTableViewCell *)v5 setDetailLabel:v12];

    v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v14 = [(CNComposeTableViewCell *)v5 detailLabel];
    [v14 setTextColor:v13];

    v15 = (void *)MEMORY[0x1E4F4BF00];
    v16 = [(CNComposeTableViewCell *)v5 titleLabel];
    v34[0] = v16;
    v17 = [(CNComposeTableViewCell *)v5 detailLabel];
    v34[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v19 = [v15 verticalContainerStackViewWithArrangedSubviews:v18];

    [v19 setDelegate:v5];
    [v19 setBaselineRelativeArrangement:0];
    int v20 = CNComposeIsAppDesignedForVisionOS();
    double v21 = 0.0;
    if (v20) {
      double v21 = 4.0;
    }
    [v19 setSpacing:v21];
    [(CNComposeTableViewCell *)v5 setLabelViewStack:v19];
    v33 = v19;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v23 = [(NUITableViewContainerCell *)v5 containerView];
    [v23 setArrangedSubviews:v22];

    v24 = [(NUITableViewContainerCell *)v5 containerView];
    [v24 setPreservesSuperviewLayoutMargins:0];

    v25 = [(NUITableViewContainerCell *)v5 containerView];
    [v25 setSpacing:12.0];

    v26 = [(NUITableViewContainerCell *)v5 containerView];
    [v26 setAlignment:3];

    v27 = [(NUITableViewContainerCell *)v5 containerView];
    [v27 setDelegate:v5];

    v28 = objc_opt_new();
    [(CNComposeTableViewCell *)v5 setBackgroundView:v28];

    v29 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v30 = [(CNComposeTableViewCell *)v5 backgroundView];
    [v30 setBackgroundColor:v29];
  }
  return v5;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E4F43870];
}

+ (id)axCappedFontWithTextStyle:(id)a3 bold:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:a3 maximumContentSizeCategory:*MEMORY[0x1E4F43778]];
  v6 = v5;
  if (v4) {
    uint64_t v7 = 32770;
  }
  else {
    uint64_t v7 = 0x8000;
  }
  v8 = [v5 fontDescriptor];
  v9 = [v8 fontDescriptorWithSymbolicTraits:v7];

  v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];

  return v10;
}

+ (id)axCappedSymbolConfigurationIsBold:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  id v5 = [v4 fontDescriptor];

  v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = [v5 fontDescriptorWithSymbolicTraits:v3];
  v8 = [v6 fontWithDescriptor:v7 size:0.0];

  v9 = [MEMORY[0x1E4F42738] sharedApplication];
  v10 = [v9 preferredContentSizeCategory];

  if (v10)
  {
    if (UIContentSizeCategoryCompareToCategory(v10, (UIContentSizeCategory)*MEMORY[0x1E4F43778]) == NSOrderedDescending)
    {
      uint64_t v11 = 1;
    }
    else if (UIContentSizeCategoryCompareToCategory(v10, (UIContentSizeCategory)*MEMORY[0x1E4F43790]) == NSOrderedDescending)
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 3;
    }
  }
  else
  {
    uint64_t v11 = 3;
  }
  v12 = [MEMORY[0x1E4F42A98] configurationWithFont:v8 scale:v11];

  return v12;
}

- (id)labelWithTextStyle:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setLineBreakMode:4];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v3];

  [v4 setFont:v5];

  return v4;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
  [(CNComposeTableViewCell *)self layoutMarginsDidChange];
}

- (void)layoutMarginsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)CNComposeTableViewCell;
  [(CNComposeTableViewCell *)&v8 layoutMarginsDidChange];
  [(CNComposeTableViewCell *)self directionalLayoutMargins];
  double v4 = v3;
  [(CNComposeTableViewCell *)self leadingInsetsFromCurrentMargins:6.0];
  double v6 = v5;
  uint64_t v7 = [(NUITableViewContainerCell *)self containerView];
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 6.0, v6, 5.0, v4);
}

- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3
{
  return a3.leading;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(NUITableViewContainerCell *)self containerView];
  if (v9 != v7) {
    goto LABEL_4;
  }
  v10 = [v7 arrangedSubviews];
  id v11 = [v10 firstObject];
  if (v11 != v8)
  {

    id v9 = v7;
LABEL_4:

    goto LABEL_5;
  }
  BOOL v16 = [(CNComposeTableViewCell *)self supportsAvatarView];

  if (v16)
  {
    uint64_t v12 = 0x4042000000000000;
    uint64_t v13 = 0x4042000000000000;
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v12 = *MEMORY[0x1E4F4BED8];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F4BED8] + 8);
LABEL_6:

  double v14 = *(double *)&v12;
  double v15 = *(double *)&v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(CNComposeTableViewCell *)self labelViewStack];

  if (v5 == v4)
  {
    id v6 = [(CNComposeTableViewCell *)self labelViewStack];
    [v6 frame];
    [(CNComposeTableViewCell *)self labelsChangedWidth:CGRectGetWidth(v8)];
  }
}

- (void)setLabelColor:(id)a3
{
  id v13 = a3;
  if ([v13 isEqual:self->_labelColor]) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_labelColor, a3);
  id v5 = v13;
  if (!v13)
  {
    id v5 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v6 = [(CNComposeTableViewCell *)self titleLabel];
  [v6 setTextColor:v5];

  if (!v13) {
  id v7 = [(CNComposeTableViewCell *)self recipient];
  }
  if ([v7 kind] == 6)
  {

LABEL_9:
LABEL_10:
    v10 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    id v13 = 0;
    int v11 = 1;
    goto LABEL_11;
  }
  CGRect v8 = [(CNComposeTableViewCell *)self recipient];
  uint64_t v9 = [v8 kind];

  if (v9 == 7) {
    goto LABEL_9;
  }
  if (!v13) {
    goto LABEL_10;
  }
  int v11 = 0;
  v10 = v13;
LABEL_11:
  uint64_t v12 = [(CNComposeTableViewCell *)self detailLabel];
  [v12 setTextColor:v10];

  if (v11) {
LABEL_13:
  }
}

- (BOOL)supportsAvatarView
{
  return 0;
}

- (BOOL)canExpandRecipient
{
  return 0;
}

- (BOOL)canCollapseRecipient
{
  return 0;
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (double)trailingButtonWidth
{
  return self->_trailingButtonWidth;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NUIContainerStackView)labelViewStack
{
  return self->_labelViewStack;
}

- (void)setLabelViewStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelViewStack, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end