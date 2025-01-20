@interface CNUINavigationListViewCell
+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5;
+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3;
+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:(id)a3 navigationListStyle:(id)a4;
+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3;
+ (id)accessoryImageViewAccessibilityLabel;
+ (id)disclosureImage;
+ (id)expandedAccessoryImageViewAccessibilityLabel;
+ (id)highlightedDisclosureImage;
+ (id)reuseIdentifier;
- (BOOL)isAccessoryControlExpanded;
- (BOOL)isContentViewConstraintsLoaded;
- (BOOL)showSeparator;
- (CNUINavigationListStyle)navigationListStyle;
- (CNUINavigationListStyleApplier)styleApplier;
- (CNUINavigationListViewCell)initWithCoder:(id)a3;
- (CNUINavigationListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)contentViewBottomAnchorConstraint;
- (NSLayoutConstraint)subtitleLabelFirstBaselineAnchorConstraint;
- (NSLayoutConstraint)subtitleLabelLeadingAnchorConstraint;
- (NSLayoutConstraint)subtitleLabelTrailingAnchorConstraint;
- (NSLayoutConstraint)titleLabelFirstBaselineAnchorConstraint;
- (NSLayoutConstraint)titleLabelLeadingAnchorConstraint;
- (NSLayoutConstraint)titleLabelTrailingAnchorConstraint;
- (UIImageView)accessoryImageView;
- (UIImageView)titleImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)accessoryImageViewLayoutGuide;
- (UILayoutGuide)titleImageViewLayoutGuide;
- (double)contentViewBottomAnchorConstraintConstant;
- (double)minimumContentHeight;
- (double)subtitleLabelFirstBaselineAnchorConstraintConstant;
- (double)titleLabelFirstBaselineAnchorConstraintConstant;
- (void)applyStyle;
- (void)dealloc;
- (void)loadContentView;
- (void)loadContentViewConstraints;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setAccessoryControlExpanded:(BOOL)a3;
- (void)setAccessoryControlExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentViewBottomAnchorConstraint:(id)a3;
- (void)setContentViewConstraintsLoaded:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setNavigationListStyle:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)setStyleApplier:(id)a3;
- (void)setSubtitleLabelFirstBaselineAnchorConstraint:(id)a3;
- (void)setSubtitleLabelLeadingAnchorConstraint:(id)a3;
- (void)setSubtitleLabelTrailingAnchorConstraint:(id)a3;
- (void)setTitleLabelFirstBaselineAnchorConstraint:(id)a3;
- (void)setTitleLabelLeadingAnchorConstraint:(id)a3;
- (void)setTitleLabelTrailingAnchorConstraint:(id)a3;
- (void)setupAccessoryImageViewInView:(id)a3;
- (void)styleUpdated;
- (void)updateConstraints;
- (void)updateConstraintsConstants;
- (void)updateVisualStateAnimated:(BOOL)a3;
@end

@implementation CNUINavigationListViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleImageViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelTrailingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabelFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_styleApplier, 0);
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_accessoryImageView, 0);
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (UILayoutGuide)titleImageViewLayoutGuide
{
  return self->_titleImageViewLayoutGuide;
}

- (UILayoutGuide)accessoryImageViewLayoutGuide
{
  return self->_accessoryImageViewLayoutGuide;
}

- (NSLayoutConstraint)titleLabelTrailingAnchorConstraint
{
  return self->_titleLabelTrailingAnchorConstraint;
}

- (NSLayoutConstraint)titleLabelLeadingAnchorConstraint
{
  return self->_titleLabelLeadingAnchorConstraint;
}

- (NSLayoutConstraint)titleLabelFirstBaselineAnchorConstraint
{
  return self->_titleLabelFirstBaselineAnchorConstraint;
}

- (NSLayoutConstraint)subtitleLabelTrailingAnchorConstraint
{
  return self->_subtitleLabelTrailingAnchorConstraint;
}

- (NSLayoutConstraint)subtitleLabelLeadingAnchorConstraint
{
  return self->_subtitleLabelLeadingAnchorConstraint;
}

- (NSLayoutConstraint)subtitleLabelFirstBaselineAnchorConstraint
{
  return self->_subtitleLabelFirstBaselineAnchorConstraint;
}

- (void)setContentViewBottomAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomAnchorConstraint
{
  return self->_contentViewBottomAnchorConstraint;
}

- (void)setContentViewConstraintsLoaded:(BOOL)a3
{
  self->_contentViewConstraintsLoaded = a3;
}

- (BOOL)isContentViewConstraintsLoaded
{
  return self->_contentViewConstraintsLoaded;
}

- (BOOL)isAccessoryControlExpanded
{
  return self->_accessoryControlExpanded;
}

- (void)setStyleApplier:(id)a3
{
}

- (CNUINavigationListStyleApplier)styleApplier
{
  return self->_styleApplier;
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)titleImageView
{
  return self->_titleImageView;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(CNUINavigationListViewCell *)self subtitleLabel];
  if (v13 == v11)
  {
    if ([v10 isEqualToString:@"text"])
    {
    }
    else
    {
      char v14 = [v10 isEqualToString:@"attributedText"];

      if ((v14 & 1) == 0) {
        goto LABEL_3;
      }
    }
    [(CNUINavigationListViewCell *)self updateConstraintsConstants];
    goto LABEL_8;
  }

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CNUINavigationListViewCell;
  [(CNUINavigationListViewCell *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_8:
}

- (void)updateVisualStateAnimated:(BOOL)a3
{
  double v3 = 0.2;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__CNUINavigationListViewCell_updateVisualStateAnimated___block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v3];
}

void __56__CNUINavigationListViewCell_updateVisualStateAnimated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isAccessoryControlExpanded];
  double v3 = [*(id *)(a1 + 32) styleApplier];
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2) {
    [v3 applyExpandedBackgroundNavigationListStyleToCell:v5];
  }
  else {
    [v3 applyCollapsedBackgroundNavigationListStyleToCell:v5];
  }

  int v6 = [*(id *)(a1 + 32) isHighlighted];
  v7 = [*(id *)(a1 + 32) navigationListStyle];
  v8 = v7;
  if (v6) {
    [v7 actionIconFillHighlightedColor];
  }
  else {
  v9 = [v7 actionIconFillColor];
  }
  id v10 = [*(id *)(a1 + 32) titleImageView];
  [v10 setTintColor:v9];

  int v11 = [*(id *)(a1 + 32) isAccessoryControlExpanded];
  id v12 = objc_opt_class();
  if (v11) {
    [v12 expandedAccessoryImageViewAccessibilityLabel];
  }
  else {
  id v13 = [v12 accessoryImageViewAccessibilityLabel];
  }
  char v14 = [*(id *)(a1 + 32) accessoryImageView];
  [v14 setAccessibilityLabel:v13];

  if ([*(id *)(a1 + 32) isAccessoryControlExpanded])
  {
    CGAffineTransformMakeRotation(&v18, 3.14159265);
  }
  else
  {
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v18.c = v15;
    *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v16 = [*(id *)(a1 + 32) accessoryImageView];
  CGAffineTransform v17 = v18;
  [v16 setTransform:&v17];
}

- (void)updateConstraintsConstants
{
  [(CNUINavigationListViewCell *)self contentViewBottomAnchorConstraintConstant];
  double v4 = v3;
  uint64_t v5 = [(CNUINavigationListViewCell *)self contentViewBottomAnchorConstraint];
  [v5 setConstant:v4];

  [(CNUINavigationListViewCell *)self subtitleLabelFirstBaselineAnchorConstraintConstant];
  double v7 = v6;
  v8 = [(CNUINavigationListViewCell *)self subtitleLabelFirstBaselineAnchorConstraint];
  [v8 setConstant:v7];

  [(CNUINavigationListViewCell *)self titleLabelFirstBaselineAnchorConstraintConstant];
  double v10 = v9;
  int v11 = [(CNUINavigationListViewCell *)self titleLabelFirstBaselineAnchorConstraint];
  [v11 setConstant:v10];

  id v15 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v15 cellUserActionLeftMargin];
  double v13 = v12;
  char v14 = [(CNUINavigationListViewCell *)self titleLabelLeadingAnchorConstraint];
  [v14 setConstant:v13];
}

- (void)updateConstraints
{
  if (![(CNUINavigationListViewCell *)self isContentViewConstraintsLoaded]) {
    [(CNUINavigationListViewCell *)self loadContentViewConstraints];
  }
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  [(CNUINavigationListViewCell *)&v3 updateConstraints];
  [(CNUINavigationListViewCell *)self updateConstraintsConstants];
}

- (void)loadContentViewConstraints
{
  v88[6] = *MEMORY[0x1E4F143B8];
  if (!self->_contentViewConstraintsLoaded)
  {
    objc_super v3 = [(CNUINavigationListViewCell *)self contentView];
    v84 = [MEMORY[0x1E4F1CA48] array];
    int v76 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v82 = [(UILayoutGuide *)self->_titleImageViewLayoutGuide leadingAnchor];
    v80 = [v3 leadingAnchor];
    v78 = [v82 constraintEqualToAnchor:v80];
    v88[0] = v78;
    v74 = [(UILayoutGuide *)self->_titleImageViewLayoutGuide trailingAnchor];
    v72 = [(UILabel *)self->_titleLabel leadingAnchor];
    v70 = [v74 constraintEqualToAnchor:v72];
    v88[1] = v70;
    v68 = [(UILayoutGuide *)self->_titleImageViewLayoutGuide topAnchor];
    v83 = v3;
    v66 = [v3 topAnchor];
    v64 = [v68 constraintEqualToAnchor:v66];
    v88[2] = v64;
    v62 = [(UILayoutGuide *)self->_titleImageViewLayoutGuide bottomAnchor];
    v60 = [v3 bottomAnchor];
    v58 = [v62 constraintEqualToAnchor:v60];
    v88[3] = v58;
    double v4 = [(UIImageView *)self->_titleImageView imageContentGuide];
    uint64_t v5 = [v4 centerXAnchor];
    double v6 = [(UILayoutGuide *)self->_titleImageViewLayoutGuide centerXAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    v88[4] = v7;
    v8 = [(UIImageView *)self->_titleImageView firstBaselineAnchor];
    double v9 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v88[5] = v10;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:6];
    [v84 addObjectsFromArray:v11];

    double v12 = v83;
    double v13 = [(UILabel *)self->_titleLabel leadingAnchor];
    char v14 = [v83 leadingAnchor];
    id v15 = [(CNUINavigationListViewCell *)self navigationListStyle];
    [v15 cellUserActionLeftMargin];
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleLabelLeadingAnchorConstraint = self->_titleLabelLeadingAnchorConstraint;
    self->_titleLabelLeadingAnchorConstraint = v16;

    if (v76)
    {
      CGAffineTransform v18 = [(UILabel *)self->_titleLabel trailingAnchor];
      v19 = [v83 trailingAnchor];
      [v18 constraintLessThanOrEqualToAnchor:v19 constant:5.0];
    }
    else
    {
      CGAffineTransform v18 = [(UILabel *)self->_subtitleLabel leadingAnchor];
      v19 = [(UILabel *)self->_titleLabel trailingAnchor];
      [v18 constraintEqualToAnchor:v19 constant:8.0];
    v20 = };
    p_titleLabelTrailingAnchorConstraint = (void **)&self->_titleLabelTrailingAnchorConstraint;
    objc_storeStrong((id *)&self->_titleLabelTrailingAnchorConstraint, v20);

    v22 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v23 = [v83 topAnchor];
    [(CNUINavigationListViewCell *)self titleLabelFirstBaselineAnchorConstraintConstant];
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleLabelFirstBaselineAnchorConstraint = self->_titleLabelFirstBaselineAnchorConstraint;
    self->_titleLabelFirstBaselineAnchorConstraint = v24;

    titleLabelTrailingAnchorConstraint = self->_titleLabelTrailingAnchorConstraint;
    v87[0] = self->_titleLabelLeadingAnchorConstraint;
    v87[1] = titleLabelTrailingAnchorConstraint;
    v87[2] = self->_titleLabelFirstBaselineAnchorConstraint;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
    v28 = v84;
    [v84 addObjectsFromArray:v27];

    if (v76)
    {
      p_titleLabelTrailingAnchorConstraint = [(UILabel *)self->_subtitleLabel leadingAnchor];
      v27 = [(UILabel *)self->_titleLabel leadingAnchor];
      v29 = [p_titleLabelTrailingAnchorConstraint constraintEqualToAnchor:v27];
    }
    else
    {
      v29 = *p_titleLabelTrailingAnchorConstraint;
    }
    p_subtitleLabelLeadingAnchorConstraint = &self->_subtitleLabelLeadingAnchorConstraint;
    objc_storeStrong((id *)&self->_subtitleLabelLeadingAnchorConstraint, v29);
    if (v76)
    {
    }
    v31 = [(UILabel *)self->_subtitleLabel firstBaselineAnchor];
    v32 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    [(CNUINavigationListViewCell *)self subtitleLabelFirstBaselineAnchorConstraintConstant];
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    subtitleLabelFirstBaselineAnchorConstraint = self->_subtitleLabelFirstBaselineAnchorConstraint;
    self->_subtitleLabelFirstBaselineAnchorConstraint = v33;

    v35 = self->_subtitleLabelFirstBaselineAnchorConstraint;
    v86[0] = *p_subtitleLabelLeadingAnchorConstraint;
    v86[1] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
    [v84 addObjectsFromArray:v36];

    if (self->_accessoryImageView)
    {
      v37 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide leadingAnchor];
      if (v76) {
        [(CNUINavigationListViewCell *)self titleLabel];
      }
      else {
      v38 = [(CNUINavigationListViewCell *)self subtitleLabel];
      }
      v39 = [v38 trailingAnchor];
      v40 = [v37 constraintGreaterThanOrEqualToAnchor:v39 constant:0.0];
      objc_storeStrong((id *)&self->_subtitleLabelTrailingAnchorConstraint, v40);

      subtitleLabelTrailingAnchorConstraint = self->_subtitleLabelTrailingAnchorConstraint;
      v85[0] = *p_subtitleLabelLeadingAnchorConstraint;
      v85[1] = subtitleLabelTrailingAnchorConstraint;
      v81 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide trailingAnchor];
      v79 = [v83 trailingAnchor];
      v77 = [v81 constraintEqualToAnchor:v79 constant:-22.0];
      v85[2] = v77;
      v75 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide topAnchor];
      v73 = [v83 topAnchor];
      v71 = [v75 constraintEqualToAnchor:v73];
      v85[3] = v71;
      v69 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide bottomAnchor];
      v67 = [v83 bottomAnchor];
      v65 = [v69 constraintEqualToAnchor:v67];
      v85[4] = v65;
      v63 = [(UIImageView *)self->_accessoryImageView centerXAnchor];
      v61 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide centerXAnchor];
      v59 = [v63 constraintEqualToAnchor:v61];
      v85[5] = v59;
      v57 = [(UIImageView *)self->_accessoryImageView widthAnchor];
      v56 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide widthAnchor];
      v55 = [v57 constraintLessThanOrEqualToAnchor:v56];
      v85[6] = v55;
      v42 = [(UIImageView *)self->_accessoryImageView firstBaselineAnchor];
      v43 = [(CNUINavigationListViewCell *)self titleLabel];
      v44 = [v43 firstBaselineAnchor];
      v45 = [v42 constraintEqualToAnchor:v44];
      v85[7] = v45;
      v46 = [(UIImageView *)self->_accessoryImageView heightAnchor];
      v47 = [(UILayoutGuide *)self->_accessoryImageViewLayoutGuide heightAnchor];
      v48 = [v46 constraintLessThanOrEqualToAnchor:v47];
      v85[8] = v48;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:9];
      v28 = v84;
      [v84 addObjectsFromArray:v49];

      double v12 = v83;
    }
    v50 = [v12 bottomAnchor];
    v51 = [(UILabel *)self->_subtitleLabel firstBaselineAnchor];
    [(CNUINavigationListViewCell *)self contentViewBottomAnchorConstraintConstant];
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
    v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentViewBottomAnchorConstraint = self->_contentViewBottomAnchorConstraint;
    self->_contentViewBottomAnchorConstraint = v52;

    LODWORD(v54) = 1148829696;
    [(NSLayoutConstraint *)self->_contentViewBottomAnchorConstraint setPriority:v54];
    [v28 addObject:self->_contentViewBottomAnchorConstraint];
    [MEMORY[0x1E4F28DC8] activateConstraints:v28];
    self->_contentViewConstraintsLoaded = 1;
  }
}

- (void)setTitleLabelTrailingAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_titleLabelTrailingAnchorConstraint = &self->_titleLabelTrailingAnchorConstraint;
  if (*p_titleLabelTrailingAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_titleLabelTrailingAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_titleLabelTrailingAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setTitleLabelLeadingAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_titleLabelLeadingAnchorConstraint = &self->_titleLabelLeadingAnchorConstraint;
  if (*p_titleLabelLeadingAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_titleLabelLeadingAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_titleLabelLeadingAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setTitleLabelFirstBaselineAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_titleLabelFirstBaselineAnchorConstraint = &self->_titleLabelFirstBaselineAnchorConstraint;
  if (*p_titleLabelFirstBaselineAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_titleLabelFirstBaselineAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_titleLabelFirstBaselineAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setSubtitleLabelTrailingAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelTrailingAnchorConstraint = &self->_subtitleLabelTrailingAnchorConstraint;
  if (*p_subtitleLabelTrailingAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_subtitleLabelTrailingAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_subtitleLabelTrailingAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setSubtitleLabelLeadingAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelLeadingAnchorConstraint = &self->_subtitleLabelLeadingAnchorConstraint;
  if (*p_subtitleLabelLeadingAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_subtitleLabelLeadingAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_subtitleLabelLeadingAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setSubtitleLabelFirstBaselineAnchorConstraint:(id)a3
{
  uint64_t v5 = (NSLayoutConstraint *)a3;
  p_subtitleLabelFirstBaselineAnchorConstraint = &self->_subtitleLabelFirstBaselineAnchorConstraint;
  if (*p_subtitleLabelFirstBaselineAnchorConstraint != v5)
  {
    double v7 = v5;
    [(NSLayoutConstraint *)*p_subtitleLabelFirstBaselineAnchorConstraint setActive:0];
    objc_storeStrong((id *)p_subtitleLabelFirstBaselineAnchorConstraint, a3);
    uint64_t v5 = v7;
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  [(CNUINavigationListViewCell *)&v3 setSeparatorStyle:[(CNUINavigationListViewCell *)self showSeparator]];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNUINavigationListViewCell;
  if ([(CNUINavigationListViewCell *)&v8 isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNUINavigationListViewCell;
    [(CNUINavigationListViewCell *)&v7 setHighlighted:v5 animated:v4];
    [(CNUINavigationListViewCell *)self updateVisualStateAnimated:v4];
  }
}

- (void)setAccessoryControlExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(CNUINavigationListViewCell *)self isAccessoryControlExpanded];
  [(CNUINavigationListViewCell *)self setAccessoryControlExpanded:v5];
  if (v7 != [(CNUINavigationListViewCell *)self isAccessoryControlExpanded])
  {
    [(CNUINavigationListViewCell *)self updateVisualStateAnimated:v4];
  }
}

- (void)setAccessoryControlExpanded:(BOOL)a3
{
  if (self->_accessoryControlExpanded != a3)
  {
    BOOL v5 = [(CNUINavigationListViewCell *)self accessoryImageView];
    char v6 = [v5 isHidden];

    if ((v6 & 1) == 0) {
      self->_accessoryControlExpanded = a3;
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  [(CNUINavigationListViewCell *)&v3 prepareForReuse];
  [(CNUINavigationListViewCell *)self setAccessoryControlExpanded:0];
  [(CNUINavigationListViewCell *)self setHighlighted:0];
  [(CNUINavigationListViewCell *)self updateVisualStateAnimated:0];
}

- (void)setupAccessoryImageViewInView:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4FB1940];
  id v12 = a3;
  BOOL v5 = (UILayoutGuide *)objc_alloc_init(v4);
  accessoryImageViewLayoutGuide = self->_accessoryImageViewLayoutGuide;
  self->_accessoryImageViewLayoutGuide = v5;

  [v12 addLayoutGuide:self->_accessoryImageViewLayoutGuide];
  BOOL v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  accessoryImageView = self->_accessoryImageView;
  self->_accessoryImageView = v7;

  double v9 = [(id)objc_opt_class() disclosureImage];
  [(UIImageView *)self->_accessoryImageView setImage:v9];

  [(UIImageView *)self->_accessoryImageView setHidden:1];
  double v10 = [(id)objc_opt_class() highlightedDisclosureImage];
  [(UIImageView *)self->_accessoryImageView setHighlightedImage:v10];

  int v11 = [(id)objc_opt_class() accessoryImageViewAccessibilityLabel];
  [(UIImageView *)self->_accessoryImageView setAccessibilityLabel:v11];

  [(UIImageView *)self->_accessoryImageView setIsAccessibilityElement:1];
  [(UIImageView *)self->_accessoryImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 addSubview:self->_accessoryImageView];
}

- (void)loadContentView
{
  id v15 = [(CNUINavigationListViewCell *)self contentView];
  objc_super v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:3];
  BOOL v4 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v3 style:4];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
  [v5 setAutoresizingMask:18];
  [v15 bounds];
  objc_msgSend(v5, "setFrame:");
  [v15 addSubview:v5];
  char v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  titleImageViewLayoutGuide = self->_titleImageViewLayoutGuide;
  self->_titleImageViewLayoutGuide = v6;

  [v15 addLayoutGuide:self->_titleImageViewLayoutGuide];
  objc_super v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  titleImageView = self->_titleImageView;
  self->_titleImageView = v8;

  [(UIImageView *)self->_titleImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v10 = [v5 contentView];
  [v10 addSubview:self->_titleImageView];

  int v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 addSubview:self->_titleLabel];
  double v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v13;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 addSubview:self->_subtitleLabel];
  [(CNUINavigationListViewCell *)self applyStyle];
  [(CNUINavigationListViewCell *)self setupAccessoryImageViewInView:v15];
}

- (void)applyStyle
{
  id v3 = [(CNUINavigationListViewCell *)self styleApplier];
  [v3 applyNavigationListStyleToCell:self];
}

- (void)styleUpdated
{
  id v3 = [CNUINavigationListStyleApplier alloc];
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  BOOL v5 = [(CNUINavigationListStyleApplier *)v3 initWithNavigationListStyle:v4];
  [(CNUINavigationListViewCell *)self setStyleApplier:v5];

  [(CNUINavigationListViewCell *)self applyStyle];
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeStrong((id *)&self->_navigationListStyle, a3);

  [(CNUINavigationListViewCell *)self styleUpdated];
}

- (void)dealloc
{
  [(UILabel *)self->_subtitleLabel removeObserver:self forKeyPath:@"text"];
  [(UILabel *)self->_subtitleLabel removeObserver:self forKeyPath:@"attributedText"];
  v3.receiver = self;
  v3.super_class = (Class)CNUINavigationListViewCell;
  [(CNUINavigationListViewCell *)&v3 dealloc];
}

- (CNUINavigationListViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNUINavigationListViewCell;
  BOOL v4 = [(CNUINavigationListViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_contentViewConstraintsLoaded = 0;
    v4->_showSeparator = 1;
    [(CNUINavigationListViewCell *)v4 loadContentView];
    [(CNUINavigationListViewCell *)v5 loadContentViewConstraints];
    [(UILabel *)v5->_subtitleLabel addObserver:v5 forKeyPath:@"text" options:0 context:0];
    [(UILabel *)v5->_subtitleLabel addObserver:v5 forKeyPath:@"attributedText" options:0 context:0];
    char v6 = v5;
  }

  return v5;
}

- (CNUINavigationListViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (double)titleLabelFirstBaselineAnchorConstraintConstant
{
  objc_super v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v4];
  double v6 = v5;

  return v6;
}

- (double)subtitleLabelFirstBaselineAnchorConstraintConstant
{
  objc_super v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self subtitleLabel];
  double v5 = [v4 text];
  double v6 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:v5 navigationListStyle:v6];
  double v8 = v7;

  return v8;
}

- (double)contentViewBottomAnchorConstraintConstant
{
  objc_super v3 = objc_opt_class();
  BOOL v4 = [(CNUINavigationListViewCell *)self navigationListStyle];
  [v3 contentViewBottomAnchorConstraintConstantForNavigationListStyle:v4];
  double v6 = v5;

  return v6;
}

- (double)minimumContentHeight
{
  [(CNUINavigationListViewCell *)self titleLabelFirstBaselineAnchorConstraintConstant];
  double v4 = v3;
  [(CNUINavigationListViewCell *)self contentViewBottomAnchorConstraintConstant];
  return ceil(v4 + v5);
}

+ (id)expandedAccessoryImageViewAccessibilityLabel
{
  int v2 = CNContactsUIBundle();
  double v3 = [v2 localizedStringForKey:@"CLOSE_DISAMBIGUATION_CATEGORY" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)accessoryImageViewAccessibilityLabel
{
  int v2 = CNContactsUIBundle();
  double v3 = [v2 localizedStringForKey:@"EXPAND_DISAMBIGUATION_CATEGORY" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

+ (id)highlightedDisclosureImage
{
  int v2 = (void *)MEMORY[0x1E4FB1818];
  double v3 = +[CNUIColorRepository navigationListDisclosureImageHighlightedColor];
  double v4 = objc_msgSend(v2, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"chevron.down", 1, v3, 0);

  return v4;
}

+ (id)disclosureImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForNavigationListChevron");
}

+ (id)reuseIdentifier
{
  return @"CNUINavigationListViewCellReuseIdentifier";
}

+ (CGSize)desiredContentSizeForTitle:(id)a3 subTitle:(id)a4 navigationListStyle:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 cellUserActionLeftMargin];
  double v12 = v11 + 22.0 + 8.0 + 5.0;
  double v13 = [v10 cellTitleFont];
  char v14 = [v10 cellSubtitleFont];
  [a1 titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:v10];
  double v16 = v15;
  [a1 contentViewBottomAnchorConstraintConstantForNavigationListStyle:v10];
  double v18 = v17;
  [a1 subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:v9 navigationListStyle:v10];
  double v20 = v19;

  uint64_t v21 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v8) & 1) == 0)
  {
    if (v13)
    {
      uint64_t v33 = *MEMORY[0x1E4FB06F8];
      v34[0] = v13;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    }
    else
    {
      v22 = 0;
    }
    [v8 sizeWithAttributes:v22];
    double v12 = v12 + ceil(v23);
  }
  if (((*(uint64_t (**)(uint64_t, id))(v21 + 16))(v21, v9) & 1) == 0)
  {
    if (v14)
    {
      uint64_t v31 = *MEMORY[0x1E4FB06F8];
      v32 = v14;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    }
    else
    {
      v24 = 0;
    }
    [v9 sizeWithAttributes:v24];
    double v12 = v12 + ceil(v25);
  }
  v26 = [a1 disclosureImage];
  [v26 size];
  double v28 = v27;

  double v29 = ceil(v16 + v18 + v20);
  double v30 = v12 + v28;
  result.height = v29;
  result.width = v30;
  return result;
}

+ (double)subtitleLabelFirstBaselineAnchorConstraintConstantForSubtitle:(id)a3 navigationListStyle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = 0.0;
  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory")
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
    id v8 = [v6 cellSubtitleFont];
    [v6 cellSubtitleLabelFirstBaselineAnchorConstraintConstant];
    objc_msgSend(v8, "_scaledValueForValue:");
    double v7 = ceil(v9);
  }
  return v7;
}

+ (double)contentViewBottomAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 cellSubtitleFont];
  [v3 cellContentViewBottomAnchorConstraintConstant];
  double v6 = v5;

  [v4 _scaledValueForValue:v6];
  double v8 = ceil(v7);

  return v8;
}

+ (double)titleLabelFirstBaselineAnchorConstraintConstantForNavigationListStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 cellTitleFont];
  [v3 cellTitleLabelFirstBaselineAnchorConstraintConstant];
  double v6 = v5;

  [v4 _scaledValueForValue:v6];
  double v8 = ceil(v7);

  return v8;
}

@end