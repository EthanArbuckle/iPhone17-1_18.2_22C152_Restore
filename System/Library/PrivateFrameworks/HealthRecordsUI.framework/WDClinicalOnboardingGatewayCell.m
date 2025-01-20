@interface WDClinicalOnboardingGatewayCell
- (HKBorderLineView)featureDownloadView;
- (HKBorderLineView)featureSharingView;
- (NSLayoutConstraint)featureDownloadBottomConstraint;
- (NSLayoutConstraint)featureSharingBottomConstraint;
- (NSLayoutConstraint)tapToConnectLabelHeightConstraint;
- (UILabel)detailLabel;
- (UILabel)featureDownloadTextLabel;
- (UILabel)featureDownloadTitleLabel;
- (UILabel)featureSharingTextLabel;
- (UILabel)featureSharingTitleLabel;
- (UILabel)subtitleLabel;
- (UILabel)tapToConnectLabel;
- (UILabel)titleLabel;
- (UIStackView)outerSpecContainerView;
- (UIStackView)verticalSpecContainerView;
- (WDBrandLogoView)logoView;
- (WDClinicalOnboardingGatewayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_contentViewMarginsGuide;
- (void)_constrainStackViewContainerWithinContentView;
- (void)_createDetailLabel;
- (void)_createDownloadAvailableView;
- (void)_createLogoView;
- (void)_createOuterSpecContainerView;
- (void)_createSharingAvailableView;
- (void)_createSubtitleLabel;
- (void)_createTapToConnectLabel;
- (void)_createTitleLabel;
- (void)_createVerticalSpecContainerView;
- (void)_positionTapToConnectLabel;
- (void)_setAccessibilityIdentifiers;
- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3;
- (void)_updateForContentSizeCategory:(id)a3;
- (void)_updateLabelVisibility;
- (void)configureWithGateway:(id)a3 dataProvider:(id)a4 connected:(BOOL)a5;
- (void)prepareForReuse;
- (void)setUpConstraints;
- (void)setupSubviews;
- (void)tintColorDidChange;
@end

@implementation WDClinicalOnboardingGatewayCell

- (WDClinicalOnboardingGatewayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingGatewayCell;
  v4 = [(WDMedicalRecordGroupableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDMedicalRecordGroupableCell *)v4 setIntendedPlacement:2];
  }
  return v5;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingGatewayCell;
  [(WDMedicalRecordGroupableCell *)&v4 prepareForReuse];
  [(WDClinicalOnboardingGatewayCell *)self configureWithGateway:0 dataProvider:0 connected:0];
  v3 = [(WDClinicalOnboardingGatewayCell *)self logoView];
  [v3 prepareForReuse];
}

- (void)setupSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingGatewayCell;
  [(WDMedicalRecordGroupableCell *)&v4 setupSubviews];
  v3 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  [(WDClinicalOnboardingGatewayCell *)self _createLogoView];
  [(WDClinicalOnboardingGatewayCell *)self _createTitleLabel];
  [(WDClinicalOnboardingGatewayCell *)self _createSubtitleLabel];
  [(WDClinicalOnboardingGatewayCell *)self _createDetailLabel];
  [(WDClinicalOnboardingGatewayCell *)self _createDownloadAvailableView];
  [(WDClinicalOnboardingGatewayCell *)self _createSharingAvailableView];
  [(WDClinicalOnboardingGatewayCell *)self _createVerticalSpecContainerView];
  [(WDClinicalOnboardingGatewayCell *)self _createTapToConnectLabel];
  [(WDClinicalOnboardingGatewayCell *)self _createOuterSpecContainerView];
}

- (void)_createLogoView
{
  v3 = [WDBrandLogoView alloc];
  objc_super v4 = -[WDBrandLogoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  logoView = self->_logoView;
  self->_logoView = v4;

  v6 = [(WDClinicalOnboardingGatewayCell *)self logoView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [(WDClinicalOnboardingGatewayCell *)self logoView];
  [v7 setContentMode:1];

  [MEMORY[0x1E4FB1838] mediumLogoViewDimension];
  double v9 = v8;
  id v10 = [(WDClinicalOnboardingGatewayCell *)self logoView];
  [v10 setSize:v9];
}

- (void)_createTitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  objc_super v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [MEMORY[0x1E4FB1618] labelColor];
  double v8 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  [v8 setTextColor:v7];

  id v10 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1280];
  double v9 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  [v9 setFont:v10];
}

- (void)_createSubtitleLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  objc_super v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  v6 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  double v8 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  [v8 setTextColor:v7];

  id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  double v9 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  [v9 setFont:v10];
}

- (void)_createDetailLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  objc_super v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  detailLabel = self->_detailLabel;
  self->_detailLabel = v4;

  v6 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v7 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v7 setNumberOfLines:0];

  double v8 = [MEMORY[0x1E4FB1618] labelColor];
  double v9 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v9 setTextColor:v8];

  id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v10 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v10 setFont:v11];
}

- (void)_createDownloadAvailableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], v5, v6, v7);
  featureDownloadTitleLabel = self->_featureDownloadTitleLabel;
  self->_featureDownloadTitleLabel = v8;

  [(UILabel *)self->_featureDownloadTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_featureDownloadTitleLabel setNumberOfLines:0];
  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_featureDownloadTitleLabel setTextColor:v10];

  uint64_t v11 = *MEMORY[0x1E4FB2950];
  v12 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
  [(UILabel *)self->_featureDownloadTitleLabel setFont:v12];

  v13 = (void *)MEMORY[0x1E4F28B18];
  v15 = HROsloLocalizedString(@"GATEWAY_FEATURE_DOWNLOAD_TITLE", v14);
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle"];
  v18 = [MEMORY[0x1E4FB1618] labelColor];
  v19 = [v13 attributedStringText:v15 textColor:v16 symbol:v17 symbolColor:v18 useLargeSpacing:0];
  [(UILabel *)self->_featureDownloadTitleLabel setAttributedText:v19];

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  featureDownloadTextLabel = self->_featureDownloadTextLabel;
  self->_featureDownloadTextLabel = v20;

  [(UILabel *)self->_featureDownloadTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_featureDownloadTextLabel setNumberOfLines:0];
  v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_featureDownloadTextLabel setTextColor:v22];

  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
  [(UILabel *)self->_featureDownloadTextLabel setFont:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F679A8]);
  v25 = (HKBorderLineView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  featureDownloadView = self->_featureDownloadView;
  self->_featureDownloadView = v25;

  [(HKBorderLineView *)self->_featureDownloadView setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [MEMORY[0x1E4FB1618] clearColor];
  [(HKBorderLineView *)self->_featureDownloadView setBackgroundColor:v27];

  v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKBorderLineView *)self->_featureDownloadView setBorderLineColor:v28];

  [(HKBorderLineView *)self->_featureDownloadView addSubview:self->_featureDownloadTitleLabel];
  [(HKBorderLineView *)self->_featureDownloadView addSubview:self->_featureDownloadTextLabel];
  LODWORD(v29) = 1131610112;
  [(UILabel *)self->_featureDownloadTitleLabel setContentHuggingPriority:1 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(UILabel *)self->_featureDownloadTitleLabel setContentCompressionResistancePriority:1 forAxis:v30];
  LODWORD(v31) = 1131806720;
  [(UILabel *)self->_featureDownloadTextLabel setContentHuggingPriority:1 forAxis:v31];
  LODWORD(v32) = 1148829696;
  [(UILabel *)self->_featureDownloadTextLabel setContentCompressionResistancePriority:1 forAxis:v32];
  v33 = [(UILabel *)self->_featureDownloadTitleLabel topAnchor];
  v34 = [(HKBorderLineView *)self->_featureDownloadView topAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(UILabel *)self->_featureDownloadTextLabel topAnchor];
  v37 = [(UILabel *)self->_featureDownloadTitleLabel bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:2.0];
  [v38 setActive:1];

  v39 = [(UILabel *)self->_featureDownloadTextLabel bottomAnchor];
  v40 = [(HKBorderLineView *)self->_featureDownloadView bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  featureDownloadBottomConstraint = self->_featureDownloadBottomConstraint;
  self->_featureDownloadBottomConstraint = v41;

  [(NSLayoutConstraint *)self->_featureDownloadBottomConstraint setActive:1];
  v43 = [(UILabel *)self->_featureDownloadTitleLabel leadingAnchor];
  v44 = [(HKBorderLineView *)self->_featureDownloadView leadingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(UILabel *)self->_featureDownloadTitleLabel trailingAnchor];
  v47 = [(HKBorderLineView *)self->_featureDownloadView trailingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [(UILabel *)self->_featureDownloadTextLabel leadingAnchor];
  v50 = [(HKBorderLineView *)self->_featureDownloadView leadingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v51 setActive:1];

  id v54 = [(UILabel *)self->_featureDownloadTextLabel trailingAnchor];
  v52 = [(HKBorderLineView *)self->_featureDownloadView trailingAnchor];
  v53 = [v54 constraintEqualToAnchor:v52];
  [v53 setActive:1];
}

- (void)_createSharingAvailableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], v5, v6, v7);
  featureSharingTitleLabel = self->_featureSharingTitleLabel;
  self->_featureSharingTitleLabel = v8;

  [(UILabel *)self->_featureSharingTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_featureSharingTitleLabel setNumberOfLines:0];
  id v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_featureSharingTitleLabel setTextColor:v10];

  uint64_t v11 = *MEMORY[0x1E4FB2950];
  v12 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] variant:1280];
  [(UILabel *)self->_featureSharingTitleLabel setFont:v12];

  v13 = (void *)MEMORY[0x1E4F28B18];
  v15 = HROsloLocalizedString(@"GATEWAY_FEATURE_SHARING_TITLE", v14);
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle"];
  v18 = [MEMORY[0x1E4FB1618] labelColor];
  v19 = [v13 attributedStringText:v15 textColor:v16 symbol:v17 symbolColor:v18 useLargeSpacing:0];
  [(UILabel *)self->_featureSharingTitleLabel setAttributedText:v19];

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  featureSharingTextLabel = self->_featureSharingTextLabel;
  self->_featureSharingTextLabel = v20;

  [(UILabel *)self->_featureSharingTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_featureSharingTextLabel setAdjustsFontForContentSizeCategory:0];
  [(UILabel *)self->_featureSharingTextLabel setNumberOfLines:0];
  v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_featureSharingTextLabel setTextColor:v22];

  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
  [(UILabel *)self->_featureSharingTextLabel setFont:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F679A8]);
  v25 = (HKBorderLineView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  featureSharingView = self->_featureSharingView;
  self->_featureSharingView = v25;

  [(HKBorderLineView *)self->_featureSharingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [MEMORY[0x1E4FB1618] clearColor];
  [(HKBorderLineView *)self->_featureSharingView setBackgroundColor:v27];

  v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(HKBorderLineView *)self->_featureSharingView setBorderLineColor:v28];

  [(HKBorderLineView *)self->_featureSharingView addSubview:self->_featureSharingTitleLabel];
  [(HKBorderLineView *)self->_featureSharingView addSubview:self->_featureSharingTextLabel];
  LODWORD(v29) = 1131675648;
  [(UILabel *)self->_featureSharingTitleLabel setContentHuggingPriority:1 forAxis:v29];
  LODWORD(v30) = 1148846080;
  [(UILabel *)self->_featureSharingTitleLabel setContentCompressionResistancePriority:1 forAxis:v30];
  LODWORD(v31) = 1131741184;
  [(UILabel *)self->_featureSharingTextLabel setContentHuggingPriority:1 forAxis:v31];
  LODWORD(v32) = 1148829696;
  [(UILabel *)self->_featureSharingTextLabel setContentCompressionResistancePriority:1 forAxis:v32];
  v33 = [(UILabel *)self->_featureSharingTitleLabel topAnchor];
  v34 = [(HKBorderLineView *)self->_featureSharingView topAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(UILabel *)self->_featureSharingTextLabel topAnchor];
  v37 = [(UILabel *)self->_featureSharingTitleLabel bottomAnchor];
  v38 = [v36 constraintEqualToAnchor:v37 constant:2.0];
  [v38 setActive:1];

  v39 = [(UILabel *)self->_featureSharingTextLabel bottomAnchor];
  v40 = [(HKBorderLineView *)self->_featureSharingView bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  featureSharingBottomConstraint = self->_featureSharingBottomConstraint;
  self->_featureSharingBottomConstraint = v41;

  [(NSLayoutConstraint *)self->_featureSharingBottomConstraint setActive:1];
  v43 = [(UILabel *)self->_featureSharingTitleLabel leadingAnchor];
  v44 = [(HKBorderLineView *)self->_featureSharingView leadingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(UILabel *)self->_featureSharingTitleLabel trailingAnchor];
  v47 = [(HKBorderLineView *)self->_featureSharingView trailingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [(UILabel *)self->_featureSharingTextLabel leadingAnchor];
  v50 = [(HKBorderLineView *)self->_featureSharingView leadingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v51 setActive:1];

  id v54 = [(UILabel *)self->_featureSharingTextLabel trailingAnchor];
  v52 = [(HKBorderLineView *)self->_featureSharingView trailingAnchor];
  v53 = [v54 constraintEqualToAnchor:v52];
  [v53 setActive:1];
}

- (void)_createTapToConnectLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  tapToConnectLabel = self->_tapToConnectLabel;
  self->_tapToConnectLabel = v4;

  [(UILabel *)self->_tapToConnectLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_tapToConnectLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_tapToConnectLabel setNumberOfLines:0];
  double v6 = [(WDClinicalOnboardingGatewayCell *)self tintColor];
  [(UILabel *)self->_tapToConnectLabel setTextColor:v6];

  double v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] variant:1024];
  [(UILabel *)self->_tapToConnectLabel setFont:v7];

  -[UILabel setEnabled:](self->_tapToConnectLabel, "setEnabled:", [MEMORY[0x1E4F2B860] isRunningStoreDemoMode] ^ 1);
  double v8 = HRLocalizedString(@"TAP_TO_CONNECT");
  [(UILabel *)self->_tapToConnectLabel setText:v8];

  [(UILabel *)self->_tapToConnectLabel setAccessibilityIdentifier:@"UIA.Health.ClinicalOnboarding.Gateway.ConnectAccount"];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_tapToConnectLabel setContentHuggingPriority:1 forAxis:v9];
  id v10 = [(WDClinicalOnboardingGatewayCell *)self contentView];
  [v10 addSubview:self->_tapToConnectLabel];
}

- (void)_createVerticalSpecContainerView
{
  v11[5] = *MEMORY[0x1E4F143B8];
  subtitleLabel = self->_subtitleLabel;
  v11[0] = self->_titleLabel;
  v11[1] = subtitleLabel;
  featureDownloadView = self->_featureDownloadView;
  v11[2] = self->_detailLabel;
  v11[3] = featureDownloadView;
  v11[4] = self->_featureSharingView;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  double v6 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v5];
  verticalSpecContainerView = self->_verticalSpecContainerView;
  self->_verticalSpecContainerView = v6;

  double v8 = [(WDClinicalOnboardingGatewayCell *)self verticalSpecContainerView];
  [v8 setAxis:1];

  double v9 = [(WDClinicalOnboardingGatewayCell *)self verticalSpecContainerView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = [(WDClinicalOnboardingGatewayCell *)self verticalSpecContainerView];
  [v10 setBaselineRelativeArrangement:0];

  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_subtitleLabel afterView:12.0];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_detailLabel afterView:20.0];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_featureDownloadView afterView:12.0];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_featureSharingView afterView:12.0];
}

- (void)_createOuterSpecContainerView
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  verticalSpecContainerView = self->_verticalSpecContainerView;
  v9[0] = self->_logoView;
  v9[1] = verticalSpecContainerView;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  double v6 = (UIStackView *)[v3 initWithArrangedSubviews:v5];
  outerSpecContainerView = self->_outerSpecContainerView;
  self->_outerSpecContainerView = v6;

  [(UIStackView *)self->_outerSpecContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_outerSpecContainerView setAxis:0];
  [(UIStackView *)self->_outerSpecContainerView setAlignment:1];
  [(UIStackView *)self->_outerSpecContainerView setSpacing:12.0];
  double v8 = [(WDClinicalOnboardingGatewayCell *)self contentView];
  [v8 addSubview:self->_outerSpecContainerView];
}

- (void)setUpConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingGatewayCell;
  [(WDMedicalRecordGroupableCell *)&v3 setUpConstraints];
  [(WDClinicalOnboardingGatewayCell *)self _constrainStackViewContainerWithinContentView];
  [(WDClinicalOnboardingGatewayCell *)self _positionTapToConnectLabel];
}

- (void)_constrainStackViewContainerWithinContentView
{
  id v15 = [(WDClinicalOnboardingGatewayCell *)self _contentViewMarginsGuide];
  objc_super v3 = [v15 topAnchor];
  double v4 = [(UIStackView *)self->_outerSpecContainerView topAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  double v6 = [v15 trailingAnchor];
  double v7 = [(UIStackView *)self->_outerSpecContainerView trailingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  double v9 = [v15 bottomAnchor];
  id v10 = [(UIStackView *)self->_outerSpecContainerView bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v15 leadingAnchor];
  v13 = [(UIStackView *)self->_outerSpecContainerView leadingAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];
}

- (id)_contentViewMarginsGuide
{
  v2 = [(WDMedicalRecordGroupableCell *)self pillBackgroundView];
  objc_super v3 = [v2 layoutMarginsGuide];

  return v3;
}

- (void)_positionTapToConnectLabel
{
  objc_super v3 = [(UILabel *)self->_tapToConnectLabel leadingAnchor];
  double v4 = [(UIStackView *)self->_verticalSpecContainerView leadingAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  double v6 = [(UILabel *)self->_tapToConnectLabel trailingAnchor];
  double v7 = [(UIStackView *)self->_verticalSpecContainerView trailingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  double v9 = [(UILabel *)self->_tapToConnectLabel topAnchor];
  id v10 = [(UIStackView *)self->_verticalSpecContainerView bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [(UILabel *)self->_tapToConnectLabel bottomAnchor];
  v13 = [(WDClinicalOnboardingGatewayCell *)self contentView];
  uint64_t v14 = [v13 bottomAnchor];
  id v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(UILabel *)self->_tapToConnectLabel heightAnchor];
  v17 = [v16 constraintGreaterThanOrEqualToConstant:42.0];
  tapToConnectLabelHeightConstraint = self->_tapToConnectLabelHeightConstraint;
  self->_tapToConnectLabelHeightConstraint = v17;

  v19 = self->_tapToConnectLabelHeightConstraint;
  [(NSLayoutConstraint *)v19 setActive:1];
}

- (void)configureWithGateway:(id)a3 dataProvider:(id)a4 connected:(BOOL)a5
{
  BOOL v5 = a5;
  id v29 = a3;
  if (v29 && a4)
  {
    id v8 = a4;
    double v9 = [(WDClinicalOnboardingGatewayCell *)self logoView];
    [v9 fetchBrandable:v29 dataProvider:v8];
  }
  id v10 = [v29 title];
  uint64_t v11 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  [v11 setText:v10];

  v12 = [v29 subtitle];
  v13 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  [v13 setText:v12];

  uint64_t v14 = [v29 displayableDescription];
  id v15 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v15 setText:v14];

  id v16 = [NSString alloc];
  v18 = HROsloLocalizedString(@"GATEWAY_%@_FEATURE_DOWNLOAD_TEXT", v17);
  v19 = [v29 title];
  v20 = objc_msgSend(v16, "initWithFormat:", v18, v19);
  [(UILabel *)self->_featureDownloadTextLabel setText:v20];

  id v21 = [NSString alloc];
  v23 = HROsloLocalizedString(@"GATEWAY_%@_FEATURE_SHARING_TEXT", v22);
  id v24 = [v29 title];
  v25 = objc_msgSend(v21, "initWithFormat:", v23, v24);
  [(UILabel *)self->_featureSharingTextLabel setText:v25];

  uint64_t v26 = [v29 supportsSharingToProviderObjC] ^ 1;
  v27 = [(WDClinicalOnboardingGatewayCell *)self featureSharingView];
  [v27 setHidden:v26];

  v28 = [(WDClinicalOnboardingGatewayCell *)self tapToConnectLabel];
  [v28 setHidden:v5];

  [(WDClinicalOnboardingGatewayCell *)self _updateLabelVisibility];
  [(WDMedicalRecordGroupableCell *)self _updateForCurrentSizeCategory];
  [(WDClinicalOnboardingGatewayCell *)self _setAccessibilityIdentifiers];
}

- (void)_updateLabelVisibility
{
  objc_super v3 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  double v4 = [v3 text];
  BOOL v5 = [v4 length] == 0;
  double v6 = [(WDClinicalOnboardingGatewayCell *)self titleLabel];
  [v6 setHidden:v5];

  double v7 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  id v8 = [v7 text];
  BOOL v9 = [v8 length] == 0;
  id v10 = [(WDClinicalOnboardingGatewayCell *)self subtitleLabel];
  [v10 setHidden:v9];

  uint64_t v11 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  v12 = [v11 text];
  BOOL v13 = [v12 length] == 0;
  uint64_t v14 = [(WDClinicalOnboardingGatewayCell *)self detailLabel];
  [v14 setHidden:v13];

  id v15 = [(WDClinicalOnboardingGatewayCell *)self tapToConnectLabel];
  if ([v15 isHidden])
  {

LABEL_5:
    v19 = [(WDClinicalOnboardingGatewayCell *)self featureDownloadView];
    [v19 setEdges:0];

    v18 = [(WDClinicalOnboardingGatewayCell *)self tapToConnectLabel];
    if ([v18 isHidden]) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 4;
    }
    id v21 = [(WDClinicalOnboardingGatewayCell *)self featureSharingView];
    [v21 setEdges:v20];

    goto LABEL_9;
  }
  id v16 = [(WDClinicalOnboardingGatewayCell *)self featureSharingView];
  char v17 = [v16 isHidden];

  if ((v17 & 1) == 0) {
    goto LABEL_5;
  }
  v18 = [(WDClinicalOnboardingGatewayCell *)self featureDownloadView];
  [v18 setEdges:4];
LABEL_9:

  id v22 = [(WDClinicalOnboardingGatewayCell *)self verticalSpecContainerView];
  [v22 setNeedsUpdateConstraints];
}

- (void)_updateForContentSizeCategory:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WDClinicalOnboardingGatewayCell;
  id v4 = a3;
  [(WDMedicalRecordGroupableCell *)&v16 _updateForContentSizeCategory:v4];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithPreferredContentSizeCategory:", v4, v16.receiver, v16.super_class);

  id v6 = objc_alloc(MEMORY[0x1E4FB17A8]);
  double v7 = (void *)[v6 initForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v7 scaledValueForValue:v5 compatibleWithTraitCollection:20.0];
  double v9 = v8;
  [v7 scaledValueForValue:v5 compatibleWithTraitCollection:12.0];
  double v11 = v10;
  int v12 = [(UILabel *)self->_tapToConnectLabel isHidden];
  [(UIStackView *)self->_outerSpecContainerView setSpacing:v11];
  [(UIStackView *)self->_verticalSpecContainerView setSpacing:v11];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_titleLabel afterView:2.0];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_subtitleLabel afterView:v11];
  [(UIStackView *)self->_verticalSpecContainerView setCustomSpacing:self->_detailLabel afterView:v9];
  if (v12) {
    double v13 = 0.0;
  }
  else {
    double v13 = -v11;
  }
  [(NSLayoutConstraint *)self->_featureDownloadBottomConstraint setConstant:v13];
  [(NSLayoutConstraint *)self->_featureSharingBottomConstraint setConstant:v13];
  [v7 scaledValueForValue:v5 compatibleWithTraitCollection:42.0];
  double v15 = fmax(v14, 42.0);
  if (v12) {
    double v15 = 0.0;
  }
  [(NSLayoutConstraint *)self->_tapToConnectLabelHeightConstraint setConstant:v15];
}

- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDMedicalRecordGroupableCell _updateBasedOnAccessibilityCategory:](&v7, sel__updateBasedOnAccessibilityCategory_);
  if (v3) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:v5];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:v6];
  [(UIStackView *)self->_outerSpecContainerView setAxis:v3];
}

- (void)_setAccessibilityIdentifiers
{
  v24[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = HKUIJoinStringsForAutomationIdentifier();
  v24[0] = v3;
  v24[1] = @"ProviderName";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v5 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:v5];

  v23[0] = v3;
  v23[1] = @"PatientPortal";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  objc_super v7 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:v7];

  v22[0] = v3;
  v22[1] = @"GetSecureAccess";
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  double v9 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_detailLabel setAccessibilityIdentifier:v9];

  v21[0] = v3;
  v21[1] = @"DownloadClinicalRecords";
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  double v11 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_featureDownloadTitleLabel setAccessibilityIdentifier:v11];

  v20[0] = v3;
  v20[1] = @"AnyRecordsCanBeAdded";
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  double v13 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_featureDownloadTextLabel setAccessibilityIdentifier:v13];

  v19[0] = v3;
  v19[1] = @"SharingHealthData";
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  double v15 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_featureSharingTitleLabel setAccessibilityIdentifier:v15];

  v18[0] = v3;
  v18[1] = @"YouCanChooseToSHare";
  objc_super v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  char v17 = HKUIJoinStringsForAutomationIdentifier();
  [(UILabel *)self->_featureSharingTextLabel setAccessibilityIdentifier:v17];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingGatewayCell;
  [(WDClinicalOnboardingGatewayCell *)&v5 tintColorDidChange];
  BOOL v3 = [(WDClinicalOnboardingGatewayCell *)self tintColor];
  id v4 = [(WDClinicalOnboardingGatewayCell *)self tapToConnectLabel];
  [v4 setTextColor:v3];
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

- (HKBorderLineView)featureDownloadView
{
  return self->_featureDownloadView;
}

- (HKBorderLineView)featureSharingView
{
  return self->_featureSharingView;
}

- (UILabel)featureDownloadTitleLabel
{
  return self->_featureDownloadTitleLabel;
}

- (UILabel)featureDownloadTextLabel
{
  return self->_featureDownloadTextLabel;
}

- (UILabel)featureSharingTitleLabel
{
  return self->_featureSharingTitleLabel;
}

- (UILabel)featureSharingTextLabel
{
  return self->_featureSharingTextLabel;
}

- (NSLayoutConstraint)featureDownloadBottomConstraint
{
  return self->_featureDownloadBottomConstraint;
}

- (NSLayoutConstraint)featureSharingBottomConstraint
{
  return self->_featureSharingBottomConstraint;
}

- (UILabel)tapToConnectLabel
{
  return self->_tapToConnectLabel;
}

- (NSLayoutConstraint)tapToConnectLabelHeightConstraint
{
  return self->_tapToConnectLabelHeightConstraint;
}

- (UIStackView)outerSpecContainerView
{
  return self->_outerSpecContainerView;
}

- (UIStackView)verticalSpecContainerView
{
  return self->_verticalSpecContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalSpecContainerView, 0);
  objc_storeStrong((id *)&self->_outerSpecContainerView, 0);
  objc_storeStrong((id *)&self->_tapToConnectLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tapToConnectLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_featureDownloadBottomConstraint, 0);
  objc_storeStrong((id *)&self->_featureSharingTextLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingTitleLabel, 0);
  objc_storeStrong((id *)&self->_featureDownloadTextLabel, 0);
  objc_storeStrong((id *)&self->_featureDownloadTitleLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingView, 0);
  objc_storeStrong((id *)&self->_featureDownloadView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
}

@end