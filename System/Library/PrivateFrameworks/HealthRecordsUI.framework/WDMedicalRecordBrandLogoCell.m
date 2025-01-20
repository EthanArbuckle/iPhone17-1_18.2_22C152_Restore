@interface WDMedicalRecordBrandLogoCell
- (BOOL)showsDisclosureChevron;
- (HKClinicalBrandable)brandable;
- (UIImageView)disclosureChevronView;
- (WDBrandLogoView)logoView;
- (WDClinicalSourcesDataProvider)dataProvider;
- (WDMedicalRecordBrandLogoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WDMedicalRecordBrandView)brandView;
- (double)logoSize;
- (id)_contentViewMarginsGuide;
- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3;
- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4;
- (void)prepareForReuse;
- (void)setBrandable:(id)a3 dataProvider:(id)a4;
- (void)setLogoSize:(double)a3;
- (void)setShowDisclosureChevron:(BOOL)a3;
- (void)setUpConstraints;
- (void)setupSubviews;
- (void)updateConstraints;
@end

@implementation WDMedicalRecordBrandLogoCell

- (WDMedicalRecordBrandLogoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDMedicalRecordBrandLogoCell;
  v4 = [(WDMedicalRecordGroupableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDMedicalRecordBrandLogoCell *)v4 setShowDisclosureChevron:0];
  }
  return v5;
}

- (void)setupSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)WDMedicalRecordBrandLogoCell;
  [(WDMedicalRecordGroupableCell *)&v14 setupSubviews];
  v3 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 12.0, 0.0, 12.0, 0.0);

  v4 = [WDMedicalRecordBrandView alloc];
  v5 = -[WDMedicalRecordBrandView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  brandView = self->_brandView;
  self->_brandView = v5;

  [(WDMedicalRecordBrandView *)self->_brandView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v7 = [(WDMedicalRecordBrandLogoCell *)self contentView];
  [v7 addSubview:self->_brandView];

  id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
  v9 = objc_msgSend(MEMORY[0x1E4FB1818], "hk_disclosureChevronImage");
  v10 = (UIImageView *)[v8 initWithImage:v9];
  disclosureChevronView = self->_disclosureChevronView;
  self->_disclosureChevronView = v10;

  [(UIImageView *)self->_disclosureChevronView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1148846080;
  [(UIImageView *)self->_disclosureChevronView setContentHuggingPriority:0 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(UIImageView *)self->_disclosureChevronView setContentCompressionResistancePriority:0 forAxis:v13];
}

- (void)setUpConstraints
{
  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordBrandLogoCell;
  [(WDMedicalRecordGroupableCell *)&v21 setUpConstraints];
  v3 = [(WDMedicalRecordBrandLogoCell *)self _contentViewMarginsGuide];
  v4 = [v3 topAnchor];
  v5 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  v6 = [v5 topAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v8 = [v3 leadingAnchor];
  v9 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  v10 = [v9 leadingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  double v12 = [v3 bottomAnchor];
  double v13 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  objc_super v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v3 trailingAnchor];
  v17 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];

  LODWORD(v20) = 1148829696;
  [v19 setPriority:v20];
  [v19 setActive:1];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WDMedicalRecordBrandLogoCell;
  [(WDMedicalRecordGroupableCell *)&v4 prepareForReuse];
  v3 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v3 setBrandable:0 dataProvider:0];
}

- (void)updateConstraints
{
  v17.receiver = self;
  v17.super_class = (Class)WDMedicalRecordBrandLogoCell;
  [(WDMedicalRecordBrandLogoCell *)&v17 updateConstraints];
  if ([(WDMedicalRecordBrandLogoCell *)self showsDisclosureChevron])
  {
    v3 = [(WDMedicalRecordBrandLogoCell *)self disclosureChevronView];
    objc_super v4 = [v3 leadingAnchor];
    v5 = [(WDMedicalRecordBrandLogoCell *)self brandView];
    v6 = [v5 trailingAnchor];
    objc_super v7 = [v4 constraintEqualToAnchor:v6 constant:*MEMORY[0x1E4F67908]];
    [v7 setActive:1];

    id v8 = [(WDMedicalRecordBrandLogoCell *)self _contentViewMarginsGuide];
    v9 = [v8 centerYAnchor];
    v10 = [(WDMedicalRecordBrandLogoCell *)self disclosureChevronView];
    v11 = [v10 centerYAnchor];
    double v12 = [v9 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    double v13 = [v8 trailingAnchor];
    objc_super v14 = [(WDMedicalRecordBrandLogoCell *)self disclosureChevronView];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    [v16 setActive:1];
  }
}

- (void)setShowDisclosureChevron:(BOOL)a3
{
  self->_showDisclosureChevron = a3;
  if (a3)
  {
    objc_super v4 = [(WDMedicalRecordBrandLogoCell *)self contentView];
    [v4 addSubview:self->_disclosureChevronView];
  }
  else
  {
    objc_super v4 = [(WDMedicalRecordBrandLogoCell *)self disclosureChevronView];
    [v4 removeFromSuperview];
  }

  [(WDMedicalRecordBrandLogoCell *)self setNeedsUpdateConstraints];
}

- (id)_contentViewMarginsGuide
{
  v2 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  v3 = [v2 layoutMarginsGuide];

  return v3;
}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v8 _updateContentWithBrandable:v7 dataProvider:v6];
}

- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WDMedicalRecordBrandLogoCell;
  -[WDMedicalRecordGroupableCell _updateBasedOnAccessibilityCategory:](&v6, sel__updateBasedOnAccessibilityCategory_);
  v5 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v5 _updateBasedOnAccessibilityCategory:v3];
}

- (void)setBrandable:(id)a3 dataProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v8 setBrandable:v7 dataProvider:v6];
}

- (HKClinicalBrandable)brandable
{
  v2 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  BOOL v3 = [v2 brandable];

  return (HKClinicalBrandable *)v3;
}

- (WDClinicalSourcesDataProvider)dataProvider
{
  v2 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  BOOL v3 = [v2 dataProvider];

  return (WDClinicalSourcesDataProvider *)v3;
}

- (double)logoSize
{
  v2 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v2 logoSize];
  double v4 = v3;

  return v4;
}

- (void)setLogoSize:(double)a3
{
  id v4 = [(WDMedicalRecordBrandLogoCell *)self brandView];
  [v4 setLogoSize:a3];
}

- (BOOL)showsDisclosureChevron
{
  return self->_showDisclosureChevron;
}

- (UIImageView)disclosureChevronView
{
  return self->_disclosureChevronView;
}

- (WDBrandLogoView)logoView
{
  return self->_logoView;
}

- (WDMedicalRecordBrandView)brandView
{
  return self->_brandView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandView, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_disclosureChevronView, 0);
}

@end