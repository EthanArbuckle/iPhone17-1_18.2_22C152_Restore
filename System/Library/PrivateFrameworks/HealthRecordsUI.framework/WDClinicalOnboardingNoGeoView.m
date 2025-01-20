@interface WDClinicalOnboardingNoGeoView
- (NSLayoutConstraint)containerCenterYConstraint;
- (NSLayoutConstraint)locationServicesButtonBaselineConstraint;
- (NSLayoutConstraint)subtitleBaselineConstraint;
- (UIButton)locationServicesButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)containerView;
- (WDClinicalOnboardingNoGeoView)init;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_tappedLocationServices:(id)a3;
- (void)_updateForCurrentSizeCategory;
- (void)layoutSubviews;
- (void)setContainerCenterYConstraint:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setLocationServicesButton:(id)a3;
- (void)setLocationServicesButtonBaselineConstraint:(id)a3;
- (void)setSubtitleBaselineConstraint:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WDClinicalOnboardingNoGeoView

- (WDClinicalOnboardingNoGeoView)init
{
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingNoGeoView;
  v2 = [(WDClinicalOnboardingNoGeoView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(WDClinicalOnboardingNoGeoView *)v2 _setupSubviews];
    [(WDClinicalOnboardingNoGeoView *)v3 _setupConstraints];
  }
  return v3;
}

- (void)_setupSubviews
{
  id v33 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WDClinicalOnboardingNoGeoView *)self addSubview:v33];
  [(WDClinicalOnboardingNoGeoView *)self setContainerView:v33];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDClinicalOnboardingNoGeoView *)self setTitleLabel:v3];

  v4 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v4 setNumberOfLines:0];

  objc_super v5 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_OFF_TITLE");
  v6 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v6 setText:v5];

  v7 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v7 setTextAlignment:1];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  v9 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v9 setTextColor:v8];

  v10 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v33 addSubview:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(WDClinicalOnboardingNoGeoView *)self setSubtitleLabel:v12];

  v13 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v13 setNumberOfLines:0];

  v14 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_OFF_SUBTITLE");
  v15 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v15 setText:v14];

  v16 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v16 setTextAlignment:1];

  v17 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v18 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v18 setTextColor:v17];

  v19 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v33 addSubview:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  [(WDClinicalOnboardingNoGeoView *)self setLocationServicesButton:v21];

  v22 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v23 = [v22 titleLabel];
  [v23 setNumberOfLines:0];

  v24 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v25 = [v24 titleLabel];
  [v25 setTextAlignment:1];

  v26 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v28 = HRLocalizedString(@"HEALTH_RECORDS_ONBOARDING_LOCATION_SERVICES_SETTINGS_TITLE");
  [v27 setTitle:v28 forState:0];

  v29 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v30 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v29 setTitleColor:v30 forState:0];

  v31 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  [v31 addTarget:self action:sel__tappedLocationServices_ forControlEvents:64];

  v32 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  [v33 addSubview:v32];
}

- (void)_setupConstraints
{
  id v68 = [(WDClinicalOnboardingNoGeoView *)self safeAreaLayoutGuide];
  id v3 = [(UIView *)self->_containerView topAnchor];
  v4 = [v68 topAnchor];
  objc_super v5 = [v3 constraintGreaterThanOrEqualToAnchor:v4];
  [v5 setActive:1];

  v6 = [(UIView *)self->_containerView bottomAnchor];
  v7 = [v68 bottomAnchor];
  v8 = [v6 constraintLessThanOrEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [(UIView *)self->_containerView leadingAnchor];
  v10 = [v68 leadingAnchor];
  double v11 = *MEMORY[0x1E4F67908];
  id v12 = [v9 constraintGreaterThanOrEqualToAnchor:v10 constant:*MEMORY[0x1E4F67908]];
  [v12 setActive:1];

  v13 = [(UIView *)self->_containerView trailingAnchor];
  v14 = [v68 trailingAnchor];
  v15 = [v13 constraintLessThanOrEqualToAnchor:v14 constant:-v11];
  [v15 setActive:1];

  v16 = [(UIView *)self->_containerView centerXAnchor];
  v17 = [v68 centerXAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(UIView *)self->_containerView centerYAnchor];
  v20 = [v68 centerYAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];
  [(WDClinicalOnboardingNoGeoView *)self setContainerCenterYConstraint:v21];

  v22 = [(WDClinicalOnboardingNoGeoView *)self containerCenterYConstraint];
  [v22 setActive:1];

  v23 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  v24 = [v23 leadingAnchor];
  v25 = [(UIView *)self->_containerView leadingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  v28 = [v27 trailingAnchor];
  v29 = [(UIView *)self->_containerView trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  v32 = [v31 topAnchor];
  id v33 = [(UIView *)self->_containerView topAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  v36 = [v35 leadingAnchor];
  v37 = [(UIView *)self->_containerView leadingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  v40 = [v39 trailingAnchor];
  v41 = [(UIView *)self->_containerView trailingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  v44 = [v43 firstBaselineAnchor];
  v45 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  v46 = [v45 lastBaselineAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [(WDClinicalOnboardingNoGeoView *)self setSubtitleBaselineConstraint:v47];

  v48 = [(WDClinicalOnboardingNoGeoView *)self subtitleBaselineConstraint];
  [v48 setActive:1];

  v49 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v50 = [v49 leadingAnchor];
  v51 = [(UIView *)self->_containerView leadingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v54 = [v53 trailingAnchor];
  v55 = [(UIView *)self->_containerView trailingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v58 = [v57 bottomAnchor];
  v59 = [(UIView *)self->_containerView bottomAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v62 = [v61 titleLabel];
  v63 = [v62 firstBaselineAnchor];
  v64 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  v65 = [v64 lastBaselineAnchor];
  v66 = [v63 constraintEqualToAnchor:v65];
  [(WDClinicalOnboardingNoGeoView *)self setLocationServicesButtonBaselineConstraint:v66];

  v67 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButtonBaselineConstraint];
  [v67 setActive:1];

  [(WDClinicalOnboardingNoGeoView *)self _updateForCurrentSizeCategory];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WDClinicalOnboardingNoGeoView;
  [(WDClinicalOnboardingNoGeoView *)&v6 layoutSubviews];
  [(WDClinicalOnboardingNoGeoView *)self bounds];
  double v4 = -(v3 * 0.5 + v3 * -0.45);
  objc_super v5 = [(WDClinicalOnboardingNoGeoView *)self containerCenterYConstraint];
  [v5 setConstant:v4];
}

- (void)_tappedLocationServices:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=LOCATION/com.apple.Health"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingNoGeoView;
  [(WDClinicalOnboardingNoGeoView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    objc_super v5 = [(WDClinicalOnboardingNoGeoView *)self traitCollection];
    objc_super v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(WDClinicalOnboardingNoGeoView *)self _updateForCurrentSizeCategory];
    }
  }
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3 = *MEMORY[0x1E4FB27B0];
  uint64_t v4 = *MEMORY[0x1E4FB2990];
  objc_super v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:1280 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  objc_super v6 = [(WDClinicalOnboardingNoGeoView *)self titleLabel];
  [v6 setFont:v5];

  uint64_t v7 = *MEMORY[0x1E4FB2950];
  char v8 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:0 maximumContentSizeCategory:v3];
  objc_super v9 = [(WDClinicalOnboardingNoGeoView *)self subtitleLabel];
  [v9 setFont:v8];

  id v20 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v4 variant:256 maximumContentSizeCategory:v3];
  [v20 _scaledValueForValue:26.0];
  double v11 = v10;
  id v12 = [(WDClinicalOnboardingNoGeoView *)self subtitleBaselineConstraint];
  [v12 setConstant:v11];

  v13 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:0 maximumContentSizeCategory:v3];
  v14 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButton];
  v15 = [v14 titleLabel];
  [v15 setFont:v13];

  v16 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v7 variant:0 maximumContentSizeCategory:v3];
  [v16 _scaledValueForValue:32.0];
  double v18 = v17;
  v19 = [(WDClinicalOnboardingNoGeoView *)self locationServicesButtonBaselineConstraint];
  [v19 setConstant:v18];
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

- (UIButton)locationServicesButton
{
  return self->_locationServicesButton;
}

- (void)setLocationServicesButton:(id)a3
{
}

- (NSLayoutConstraint)subtitleBaselineConstraint
{
  return self->_subtitleBaselineConstraint;
}

- (void)setSubtitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)locationServicesButtonBaselineConstraint
{
  return self->_locationServicesButtonBaselineConstraint;
}

- (void)setLocationServicesButtonBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerCenterYConstraint
{
  return self->_containerCenterYConstraint;
}

- (void)setContainerCenterYConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_locationServicesButtonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationServicesButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end