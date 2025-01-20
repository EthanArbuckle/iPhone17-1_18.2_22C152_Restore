@interface WDClinicalLocationCell
- (HKClinicalBrandable)brandable;
- (UILabel)detailLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (WDBrandLogoView)logoView;
- (WDClinicalLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WDClinicalSourcesDataProvider)dataProvider;
- (void)_configureDistinctIntrinsicLayoutPrioritiesForLabels;
- (void)_setUpConstraints;
- (void)_setupSubviews;
- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4;
- (void)_updateForCurrentSizeCategory;
- (void)prepareForReuse;
- (void)setBrandable:(id)a3 dataProvider:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willDisplay;
@end

@implementation WDClinicalLocationCell

- (WDClinicalLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WDClinicalLocationCell;
  v4 = [(WDClinicalLocationCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDClinicalLocationCell *)v4 setSelectionStyle:0];
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(WDClinicalLocationCell *)v5 setBackgroundColor:v6];

    [(WDClinicalLocationCell *)v5 _setupSubviews];
    [(WDClinicalLocationCell *)v5 _setUpConstraints];
  }
  return v5;
}

- (void)_setupSubviews
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v3 = [WDBrandLogoView alloc];
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  objc_super v8 = -[WDBrandLogoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], v5, v6, v7);
  logoView = self->_logoView;
  self->_logoView = v8;

  [(WDBrandLogoView *)self->_logoView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v12 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v12];

  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v13;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_subtitleLabel setAdjustsFontForContentSizeCategory:0];
  uint64_t v15 = *MEMORY[0x1E4FB2950];
  v16 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_scalableFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2950], 0x8000);
  [(UILabel *)self->_subtitleLabel setFont:v16];

  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v17];

  v18 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v18;

  [(UILabel *)self->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_detailLabel setAdjustsFontForContentSizeCategory:0];
  v20 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_scalableFontForTextStyle:symbolicTraits:", v15, 0x8000);
  [(UILabel *)self->_detailLabel setFont:v20];

  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  [(UILabel *)self->_detailLabel setTextAlignment:1];
  v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_detailLabel setTextColor:v21];

  id v22 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v23 = self->_titleLabel;
  v28[0] = self->_logoView;
  v28[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v25 = (UIStackView *)[v22 initWithArrangedSubviews:v24];
  stackView = self->_stackView;
  self->_stackView = v25;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setSpacing:1.17549435e-38];
  [(UIStackView *)self->_stackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_stackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_stackView setPreservesSuperviewLayoutMargins:1];
  v27 = [(WDClinicalLocationCell *)self contentView];
  [v27 addSubview:self->_stackView];

  [(WDClinicalLocationCell *)self _updateForCurrentSizeCategory];
}

- (void)_setUpConstraints
{
  stackView = self->_stackView;
  double v4 = [(WDClinicalLocationCell *)self contentView];
  [(UIStackView *)stackView hk_alignConstraintsWithView:v4];

  [(WDClinicalLocationCell *)self _configureDistinctIntrinsicLayoutPrioritiesForLabels];
}

- (void)_configureDistinctIntrinsicLayoutPrioritiesForLabels
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v3 = [(UIStackView *)self->_stackView constraintsAffectingLayoutForAxis:1];
  double v4 = [v3 firstObject];

  LODWORD(v5) = 1132003328;
  [v4 setPriority:v5];
  double v6 = [(WDClinicalLocationCell *)self titleLabel];
  double v7 = [(WDClinicalLocationCell *)self subtitleLabel];
  v10[1] = v7;
  objc_super v8 = [(WDClinicalLocationCell *)self detailLabel];
  v10[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  [v9 enumerateObjectsUsingBlock:&__block_literal_global_0];
}

void __78__WDClinicalLocationCell__configureDistinctIntrinsicLayoutPrioritiesForLabels__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  float v3 = (float)a3;
  float v4 = (float)a3 + 750.0;
  id v7 = a2;
  *(float *)&double v5 = v4;
  [v7 setContentCompressionResistancePriority:1 forAxis:v5];
  *(float *)&double v6 = v3 + 250.0;
  [v7 setContentHuggingPriority:1 forAxis:v6];
}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  double v6 = (HKClinicalBrandable *)a3;
  id v7 = (WDClinicalSourcesDataProvider *)a4;
  brandable = self->_brandable;
  self->_brandable = v6;
  v11 = v6;

  dataProvider = self->_dataProvider;
  self->_dataProvider = v7;
  v10 = v7;

  [(WDClinicalLocationCell *)self _updateContentWithBrandable:v11 dataProvider:v10];
}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(WDClinicalLocationCell *)self logoView];
  objc_super v8 = v7;
  if (v13 && v6) {
    [v7 fetchBrandable:v13 dataProvider:v6];
  }
  else {
    [v7 prepareForReuse];
  }

  v9 = [v13 title];
  v10 = [(WDClinicalLocationCell *)self titleLabel];
  [v10 setText:v9];

  v11 = [v13 subtitle];
  v12 = [(WDClinicalLocationCell *)self subtitleLabel];
  [v12 setText:v11];
}

- (void)_updateForCurrentSizeCategory
{
  v6.receiver = self;
  v6.super_class = (Class)WDClinicalLocationCell;
  [(WDClinicalLocationCell *)&v6 _updateForCurrentSizeCategory];
  float v3 = [(WDClinicalLocationCell *)self traitCollection];
  float v4 = [v3 preferredContentSizeCategory];
  double v5 = HKUIContentSizeCategoryMin();

  [(WDClinicalLocationCell *)self _updateForContentSizeCategory:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalLocationCell;
  [(WDClinicalLocationCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(WDClinicalLocationCell *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    id v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDClinicalLocationCell *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalLocationCell;
  [(WDClinicalLocationCell *)&v3 prepareForReuse];
  [(WDClinicalLocationCell *)self setBrandable:0 dataProvider:0];
}

- (void)willDisplay
{
  objc_super v3 = [(WDClinicalLocationCell *)self titleLabel];
  id v4 = [v3 text];
  BOOL v5 = [v4 length] == 0;
  objc_super v6 = [(WDClinicalLocationCell *)self titleLabel];
  [v6 setHidden:v5];

  id v7 = [(WDClinicalLocationCell *)self subtitleLabel];
  char v8 = [v7 text];
  BOOL v9 = [v8 length] == 0;
  v10 = [(WDClinicalLocationCell *)self subtitleLabel];
  [v10 setHidden:v9];

  id v14 = [(WDClinicalLocationCell *)self detailLabel];
  v11 = [v14 text];
  BOOL v12 = [v11 length] == 0;
  id v13 = [(WDClinicalLocationCell *)self detailLabel];
  [v13 setHidden:v12];
}

- (HKClinicalBrandable)brandable
{
  return self->_brandable;
}

- (WDClinicalSourcesDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (WDBrandLogoView)logoView
{
  return self->_logoView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_brandable, 0);
}

@end