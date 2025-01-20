@interface WDMedicalRecordCategoryMinimizedSectionHeaderCell
+ (double)_pillBackgroundViewHeightConstraint;
+ (id)_titleLabelFont;
- (HKGradient)gradient;
- (HKGradientView)backgroundGradientView;
- (NSLayoutConstraint)heightConstraint;
- (double)_cornerRadius;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)setBackgroundGradientView:(id)a3;
- (void)setGradient:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setupSubviews;
@end

@implementation WDMedicalRecordCategoryMinimizedSectionHeaderCell

- (void)setupSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)WDMedicalRecordCategoryMinimizedSectionHeaderCell;
  [(WDMedicalRecordGroupableCell *)&v17 setupSubviews];
  id v3 = objc_alloc_init(MEMORY[0x1E4F67AE8]);
  [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self setBackgroundGradientView:v3];

  v4 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  [v4 maskCorners:3 radius:10.0];

  v5 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  [v5 setClipsToBounds:1];

  v6 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self contentView];
  v8 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  [v7 addSubview:v8];

  v9 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  v10 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_msgSend(v9, "hk_alignConstraintsWithView:", v10);

  v11 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v12 = [v11 heightAnchor];
  [(id)objc_opt_class() _pillBackgroundViewHeightConstraint];
  v13 = objc_msgSend(v12, "constraintEqualToConstant:");
  [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self setHeightConstraint:v13];

  v14 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self heightConstraint];
  LODWORD(v15) = 1144750080;
  [v14 setPriority:v15];

  v16 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self heightConstraint];
  [v16 setActive:1];
}

- (void)setGradient:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  [v5 setGradient:v4];
}

- (HKGradient)gradient
{
  v2 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self backgroundGradientView];
  id v3 = [v2 gradient];

  return (HKGradient *)v3;
}

+ (id)_titleLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1024];
}

+ (double)_pillBackgroundViewHeightConstraint
{
  v2 = [(id)objc_opt_class() _titleLabelFont];
  [v2 _scaledValueForValue:16.0];
  double v4 = v3;

  return v4;
}

- (double)_cornerRadius
{
  return 10.0;
}

- (void)_updateForCurrentSizeCategory
{
  [(id)objc_opt_class() _pillBackgroundViewHeightConstraint];
  double v4 = v3;
  id v5 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self heightConstraint];
  [v5 setConstant:v4];

  [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self setNeedsDisplay];
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    v7 = [v9 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    id v4 = v9;
    if ((v8 & 1) == 0)
    {
      [(WDMedicalRecordCategoryMinimizedSectionHeaderCell *)self _updateForCurrentSizeCategory];
      id v4 = v9;
    }
  }
}

- (HKGradientView)backgroundGradientView
{
  return self->_backgroundGradientView;
}

- (void)setBackgroundGradientView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundGradientView, 0);
}

@end