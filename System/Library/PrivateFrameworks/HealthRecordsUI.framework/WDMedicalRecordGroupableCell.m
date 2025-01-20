@interface WDMedicalRecordGroupableCell
+ (double)defaultGap;
- (BOOL)extraTopPadding;
- (HKSeparatorLineView)separatorView;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)separatorLeadingConstant;
- (NSLayoutConstraint)separatorTrailingConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIColor)pillBackgroundColor;
- (UIColor)pillBackgroundColorOverride;
- (UIEdgeInsets)separatorInsets;
- (UIView)pillBackgroundView;
- (WDMedicalRecordGroupableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)_cornerRadius;
- (double)sectionTopPadding;
- (int64_t)intendedPlacement;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)_updateForIntendedPlacement;
- (void)prepareForReuse;
- (void)setBottomConstraint:(id)a3;
- (void)setExtraTopPadding:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIntendedPlacement:(int64_t)a3;
- (void)setPillBackgroundColor:(id)a3;
- (void)setPillBackgroundColorOverride:(id)a3;
- (void)setPillBackgroundView:(id)a3;
- (void)setSectionTopPadding:(double)a3;
- (void)setSeparatorDashStyle:(int64_t)a3 hidden:(BOOL)a4;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
- (void)setSeparatorLeadingConstant:(id)a3;
- (void)setSeparatorTrailingConstraint:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setUpConstraints;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordGroupableCell

- (WDMedicalRecordGroupableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)WDMedicalRecordGroupableCell;
  v4 = [(WDMedicalRecordGroupableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDMedicalRecordGroupableCell *)v4 setSelectionStyle:0];
    [(WDMedicalRecordGroupableCell *)v5 setupSubviews];
    [(WDMedicalRecordGroupableCell *)v5 setUpConstraints];
    [(WDMedicalRecordGroupableCell *)v5 setIntendedPlacement:0];
    v10[0] = objc_opt_class();
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = (id)[(WDMedicalRecordGroupableCell *)v5 registerForTraitChanges:v6 withAction:sel__traitCollectionDidChange_];
  }
  return v5;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordGroupableCell;
  [(WDMedicalRecordGroupableCell *)&v3 prepareForReuse];
  [(WDMedicalRecordGroupableCell *)self setHighlighted:0];
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(WDMedicalRecordGroupableCell *)self setPillBackgroundView:v3];

  v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [(WDMedicalRecordGroupableCell *)self setPillBackgroundColor:v4];

  v5 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(WDMedicalRecordGroupableCell *)self contentView];
  id v7 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  [v6 addSubview:v7];

  -[WDMedicalRecordGroupableCell setSeparatorInsets:](self, "setSeparatorInsets:", 0.0, 16.0, 0.0, 16.0);
  id v8 = objc_alloc(MEMORY[0x1E4F67C08]);
  objc_super v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(WDMedicalRecordGroupableCell *)self setSeparatorView:v9];

  v10 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(WDMedicalRecordGroupableCell *)self traitCollection];
  [v11 displayPixel];
  double v13 = v12;
  v14 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v14 setSeparatorThickness:v13];

  v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalRecordSeparatorColor");
  v16 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v16 setColor:v15];

  v17 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v17 setDashStyle:1];

  v18 = [(WDMedicalRecordGroupableCell *)self contentView];
  v19 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v18 addSubview:v19];

  id v20 = [(WDMedicalRecordGroupableCell *)self separatorView];
  -[WDMedicalRecordGroupableCell setSeparatorDashStyle:hidden:](self, "setSeparatorDashStyle:hidden:", [v20 dashStyle], 1);
}

- (void)setUpConstraints
{
  v48[7] = *MEMORY[0x1E4F143B8];
  id v3 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v4 = [v3 topAnchor];
  v5 = [(WDMedicalRecordGroupableCell *)self contentView];
  v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [(WDMedicalRecordGroupableCell *)self setTopConstraint:v7];

  id v8 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_super v9 = [v8 bottomAnchor];
  v10 = [(WDMedicalRecordGroupableCell *)self contentView];
  v11 = [v10 bottomAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  [(WDMedicalRecordGroupableCell *)self setBottomConstraint:v12];

  double v13 = [(WDMedicalRecordGroupableCell *)self separatorView];
  v14 = [v13 leadingAnchor];
  v15 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v16 = [v15 leadingAnchor];
  [(WDMedicalRecordGroupableCell *)self separatorInsets];
  v18 = [v14 constraintEqualToAnchor:v16 constant:v17];
  [(WDMedicalRecordGroupableCell *)self setSeparatorLeadingConstant:v18];

  v19 = [(WDMedicalRecordGroupableCell *)self separatorView];
  id v20 = [v19 trailingAnchor];
  v21 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v22 = [v21 trailingAnchor];
  [(WDMedicalRecordGroupableCell *)self separatorInsets];
  v24 = [v20 constraintEqualToAnchor:v22 constant:-v23];
  [(WDMedicalRecordGroupableCell *)self setSeparatorTrailingConstraint:v24];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v47 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v45 = [v47 leadingAnchor];
  v46 = [(WDMedicalRecordGroupableCell *)self contentView];
  v44 = [v46 layoutMarginsGuide];
  v43 = [v44 leadingAnchor];
  v42 = [v45 constraintEqualToAnchor:v43];
  v48[0] = v42;
  v41 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v39 = [v41 trailingAnchor];
  v40 = [(WDMedicalRecordGroupableCell *)self contentView];
  v37 = [v40 layoutMarginsGuide];
  v36 = [v37 trailingAnchor];
  v35 = [v39 constraintEqualToAnchor:v36];
  v48[1] = v35;
  v25 = [(WDMedicalRecordGroupableCell *)self topConstraint];
  v48[2] = v25;
  v26 = [(WDMedicalRecordGroupableCell *)self bottomConstraint];
  v48[3] = v26;
  v27 = [(WDMedicalRecordGroupableCell *)self separatorView];
  v28 = [v27 bottomAnchor];
  v29 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v48[4] = v31;
  v32 = [(WDMedicalRecordGroupableCell *)self separatorLeadingConstant];
  v48[5] = v32;
  v33 = [(WDMedicalRecordGroupableCell *)self separatorTrailingConstraint];
  v48[6] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:7];
  [v38 activateConstraints:v34];
}

- (void)setSeparatorDashStyle:(int64_t)a3 hidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v7 setDashStyle:a3];

  id v8 = [(WDMedicalRecordGroupableCell *)self separatorView];
  [v8 setHidden:v4];
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
  [(WDMedicalRecordGroupableCell *)self separatorInsets];
  double v5 = v4;
  v6 = [(WDMedicalRecordGroupableCell *)self separatorLeadingConstant];
  [v6 setConstant:v5];

  [(WDMedicalRecordGroupableCell *)self separatorInsets];
  double v8 = -v7;
  id v9 = [(WDMedicalRecordGroupableCell *)self separatorTrailingConstraint];
  [v9 setConstant:v8];
}

+ (double)defaultGap
{
  return 16.0;
}

- (void)setExtraTopPadding:(BOOL)a3
{
  self->_extraTopPadding = a3;
  double v4 = 0.0;
  if (a3) {
    double v4 = 10.0;
  }
  [(WDMedicalRecordGroupableCell *)self setSectionTopPadding:v4];
  [(WDMedicalRecordGroupableCell *)self _topPadding];
  double v6 = v5;
  id v7 = [(WDMedicalRecordGroupableCell *)self topConstraint];
  [v7 setConstant:v6];
}

- (void)setPillBackgroundColorOverride:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_pillBackgroundColorOverride != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_pillBackgroundColorOverride, a3);
    [(WDMedicalRecordGroupableCell *)self _updateForIntendedPlacement];
    double v5 = v6;
  }
}

- (double)_cornerRadius
{
  return 10.0;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(WDMedicalRecordGroupableCell *)self selectionStyle] == 3)
  {
    v11.receiver = self;
    v11.super_class = (Class)WDMedicalRecordGroupableCell;
    [(WDMedicalRecordGroupableCell *)&v11 setHighlighted:v5 animated:v4];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WDMedicalRecordGroupableCell_setHighlighted_animated___block_invoke;
    v9[3] = &unk_1E644AB70;
    v9[4] = self;
    BOOL v10 = v5;
    id v7 = _Block_copy(v9);
    double v8 = v7;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.5];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

void __56__WDMedicalRecordGroupableCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hrui_tableViewCellHighlightColor");
  }
  else {
  id v3 = [*(id *)(a1 + 32) pillBackgroundColor];
  }
  v2 = [*(id *)(a1 + 32) pillBackgroundView];
  [v2 setBackgroundColor:v3];
}

- (void)setIntendedPlacement:(int64_t)a3
{
  if (self->_intendedPlacement != a3)
  {
    self->_intendedPlacement = a3;
    [(WDMedicalRecordGroupableCell *)self _updateForIntendedPlacement];
  }
}

- (void)_updateForIntendedPlacement
{
  int64_t intendedPlacement = self->_intendedPlacement;
  if (intendedPlacement == 1)
  {
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    double v8 = [(WDMedicalRecordGroupableCell *)self contentView];
    [v8 setBackgroundColor:v7];

    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(WDMedicalRecordGroupableCell *)self setBackgroundColor:v9];

    if (self->_pillBackgroundColorOverride) {
      goto LABEL_8;
    }
    uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    if (!intendedPlacement)
    {
      BOOL v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
      BOOL v5 = [(WDMedicalRecordGroupableCell *)self contentView];
      [v5 setBackgroundColor:v4];

      double v6 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
      [(WDMedicalRecordGroupableCell *)self setBackgroundColor:v6];

      if (self->_pillBackgroundColorOverride)
      {
        -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:");
      }
      else
      {
        v14 = [MEMORY[0x1E4FB1618] clearColor];
        [(WDMedicalRecordGroupableCell *)self setPillBackgroundColor:v14];
      }
      [(WDMedicalRecordGroupableCell *)self _topPadding];
      double v16 = v15;
      double v17 = [(WDMedicalRecordGroupableCell *)self topConstraint];
      [v17 setConstant:v16];

      v18 = [(WDMedicalRecordGroupableCell *)self bottomConstraint];
      [v18 setConstant:0.0];
      goto LABEL_13;
    }
    objc_super v11 = [MEMORY[0x1E4FB1618] clearColor];
    double v12 = [(WDMedicalRecordGroupableCell *)self contentView];
    [v12 setBackgroundColor:v11];

    double v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(WDMedicalRecordGroupableCell *)self setBackgroundColor:v13];

    if (self->_pillBackgroundColorOverride)
    {
LABEL_8:
      -[WDMedicalRecordGroupableCell setPillBackgroundColor:](self, "setPillBackgroundColor:");
      goto LABEL_14;
    }
    uint64_t v10 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  v18 = (void *)v10;
  [(WDMedicalRecordGroupableCell *)self setPillBackgroundColor:v10];
LABEL_13:

LABEL_14:
  switch(self->_intendedPlacement)
  {
    case 2:
      [(WDMedicalRecordGroupableCell *)self _cornerRadius];
      double v20 = v19;
      v21 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v22 = [v21 layer];
      [v22 setCornerRadius:v20];

      double v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v24 = [v23 layer];
      v25 = v24;
      uint64_t v26 = 15;
      goto LABEL_19;
    case 3:
      [(WDMedicalRecordGroupableCell *)self _cornerRadius];
      double v28 = v27;
      v29 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v30 = [v29 layer];
      [v30 setCornerRadius:v28];

      double v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v24 = [v23 layer];
      v25 = v24;
      uint64_t v26 = 3;
      goto LABEL_19;
    case 4:
      double v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v25 = [v23 layer];
      [v25 setCornerRadius:0.0];
      goto LABEL_20;
    case 5:
      [(WDMedicalRecordGroupableCell *)self _cornerRadius];
      double v32 = v31;
      v33 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v34 = [v33 layer];
      [v34 setCornerRadius:v32];

      double v23 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
      v24 = [v23 layer];
      v25 = v24;
      uint64_t v26 = 12;
LABEL_19:
      [v24 setMaskedCorners:v26];
LABEL_20:

      [(WDMedicalRecordGroupableCell *)self _topPadding];
      double v36 = v35;
      v37 = [(WDMedicalRecordGroupableCell *)self topConstraint];
      [v37 setConstant:v36];

      v38 = [(WDMedicalRecordGroupableCell *)self bottomConstraint];
      [v38 setConstant:0.0];

      break;
    default:
      break;
  }
  id v40 = [(WDMedicalRecordGroupableCell *)self pillBackgroundColor];
  v39 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  [v39 setBackgroundColor:v40];
}

- (void)_updateForCurrentSizeCategory
{
  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordGroupableCell;
  [(WDMedicalRecordGroupableCell *)&v6 _updateForCurrentSizeCategory];
  id v3 = [(WDMedicalRecordGroupableCell *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  HKUIContentSizeCategoryMin();
  BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  [(WDMedicalRecordGroupableCell *)self _updateForContentSizeCategory:v5];
  [(WDMedicalRecordGroupableCell *)self _updateBasedOnAccessibilityCategory:UIContentSizeCategoryIsAccessibilityCategory(v5)];
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4)
  {
    BOOL v5 = [(WDMedicalRecordGroupableCell *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    id v7 = [v16 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    id v4 = v16;
    if ((v8 & 1) == 0)
    {
      [(WDMedicalRecordGroupableCell *)self _updateForCurrentSizeCategory];
      id v4 = v16;
    }
  }
  [v4 displayPixel];
  id v9 = [(WDMedicalRecordGroupableCell *)self traitCollection];
  [v9 displayPixel];
  char v10 = HKUIEqualCGFloats();

  if ((v10 & 1) == 0)
  {
    objc_super v11 = [(WDMedicalRecordGroupableCell *)self traitCollection];
    [v11 displayPixel];
    double v13 = v12;
    v14 = [(WDMedicalRecordGroupableCell *)self separatorView];
    [v14 setSeparatorThickness:v13];

    double v15 = [(WDMedicalRecordGroupableCell *)self separatorView];
    [v15 setNeedsDisplay];
  }
}

- (BOOL)extraTopPadding
{
  return self->_extraTopPadding;
}

- (int64_t)intendedPlacement
{
  return self->_intendedPlacement;
}

- (UIView)pillBackgroundView
{
  return self->_pillBackgroundView;
}

- (void)setPillBackgroundView:(id)a3
{
}

- (UIColor)pillBackgroundColorOverride
{
  return self->_pillBackgroundColorOverride;
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)pillBackgroundColor
{
  return self->_pillBackgroundColor;
}

- (void)setPillBackgroundColor:(id)a3
{
}

- (double)sectionTopPadding
{
  return self->_sectionTopPadding;
}

- (void)setSectionTopPadding:(double)a3
{
  self->_sectionTopPadding = a3;
}

- (HKSeparatorLineView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (NSLayoutConstraint)separatorLeadingConstant
{
  return self->_separatorLeadingConstant;
}

- (void)setSeparatorLeadingConstant:(id)a3
{
}

- (NSLayoutConstraint)separatorTrailingConstraint
{
  return self->_separatorTrailingConstraint;
}

- (void)setSeparatorTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_separatorTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorLeadingConstant, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_pillBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pillBackgroundColorOverride, 0);
  objc_storeStrong((id *)&self->_pillBackgroundView, 0);
}

@end