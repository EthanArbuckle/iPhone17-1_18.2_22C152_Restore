@interface WDClinicalOnboardingLocationCell
- (HKClinicalProvider)provider;
- (WDClinicalOnboardingLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setupSubviews;
- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4;
- (void)_updateForContentSizeCategory:(id)a3;
- (void)prepareForReuse;
- (void)setProvider:(id)a3 dataProvider:(id)a4;
@end

@implementation WDClinicalOnboardingLocationCell

- (WDClinicalOnboardingLocationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingLocationCell;
  v4 = [(WDClinicalLocationCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    [MEMORY[0x1E4FB1838] providerDetailLogoViewDimension];
    double v6 = v5;
    v7 = [(WDClinicalLocationCell *)v4 logoView];
    [v7 setSize:v6];
  }
  return v4;
}

- (void)_setupSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)WDClinicalOnboardingLocationCell;
  [(WDClinicalLocationCell *)&v14 _setupSubviews];
  v3 = [(WDClinicalLocationCell *)self stackView];
  v4 = [(WDClinicalLocationCell *)self subtitleLabel];
  [v3 addArrangedSubview:v4];

  double v5 = [(WDClinicalLocationCell *)self stackView];
  double v6 = [(WDClinicalLocationCell *)self detailLabel];
  [v5 addArrangedSubview:v6];

  double v7 = *MEMORY[0x1E4F67908];
  v8 = [(WDClinicalLocationCell *)self stackView];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 8.0, v7, 4.0, v7);

  objc_super v9 = [(WDClinicalLocationCell *)self stackView];
  [v9 setBaselineRelativeArrangement:0];

  v10 = [(WDClinicalLocationCell *)self stackView];
  [v10 setPreservesSuperviewLayoutMargins:0];

  v11 = [(WDClinicalLocationCell *)self stackView];
  [v11 setSpacing:15.0];

  v12 = [(WDClinicalLocationCell *)self stackView];
  v13 = [(WDClinicalLocationCell *)self logoView];
  [v12 setCustomSpacing:v13 afterView:20.0];
}

- (void)setProvider:(id)a3 dataProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (HKClinicalProvider *)[v7 copy];
  provider = self->_provider;
  self->_provider = v8;

  v10.receiver = self;
  v10.super_class = (Class)WDClinicalOnboardingLocationCell;
  [(WDClinicalLocationCell *)&v10 setBrandable:v7 dataProvider:v6];
}

- (void)_updateContentWithBrandable:(id)a3 dataProvider:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingLocationCell;
  [(WDClinicalLocationCell *)&v9 _updateContentWithBrandable:v6 dataProvider:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 location];
  }
  else
  {
    id v7 = 0;
  }
  v8 = [(WDClinicalLocationCell *)self detailLabel];
  [v8 setText:v7];
}

- (void)_updateForContentSizeCategory:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)WDClinicalOnboardingLocationCell;
  id v4 = a3;
  [(WDClinicalLocationCell *)&v22 _updateForContentSizeCategory:v4];
  double v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E4FB2928], 1280, v4, v22.receiver, v22.super_class);
  id v6 = [(WDClinicalLocationCell *)self titleLabel];
  [v6 setFont:v5];

  id v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:256 maximumContentSizeCategory:v4];
  v8 = [(WDClinicalLocationCell *)self subtitleLabel];
  [v8 setFont:v7];

  objc_super v9 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:256 maximumContentSizeCategory:v4];

  objc_super v10 = [(WDClinicalLocationCell *)self detailLabel];
  [v10 setFont:v9];

  v11 = [(WDClinicalLocationCell *)self titleLabel];
  v12 = [v11 font];
  [v12 _scaledValueForValue:20.0];
  double v14 = v13;

  v15 = [(WDClinicalLocationCell *)self subtitleLabel];
  v16 = [v15 font];
  [v16 _scaledValueForValue:15.0];
  double v18 = v17;

  v19 = [(WDClinicalLocationCell *)self stackView];
  [v19 setSpacing:v18];

  v20 = [(WDClinicalLocationCell *)self stackView];
  v21 = [(WDClinicalLocationCell *)self logoView];
  [v20 setCustomSpacing:v21 afterView:v14];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingLocationCell;
  [(WDClinicalLocationCell *)&v3 prepareForReuse];
  [(WDClinicalOnboardingLocationCell *)self setProvider:0 dataProvider:0];
}

- (HKClinicalProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
}

@end