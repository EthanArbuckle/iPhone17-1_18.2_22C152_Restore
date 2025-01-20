@interface FAFamilySetupGetStartedViewController
- (FAFamilySetupGetStartedViewController)initWithAccount:(id)a3 store:(id)a4 familyEligibilityResponse:(id)a5;
- (FAFamilySetupPageDelegate)delegate;
- (double)_heightForText:(id)a3 constrainedToWidth:(double)a4;
- (id)_createDescriptionLabelForText:(id)a3;
- (void)_getStartedButtonWasTapped:(id)a3;
- (void)_updateFonts;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FAFamilySetupGetStartedViewController

- (FAFamilySetupGetStartedViewController)initWithAccount:(id)a3 store:(id)a4 familyEligibilityResponse:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAFamilySetupGetStartedViewController;
  v12 = [(FAFamilySetupGetStartedViewController *)&v15 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_accountStore, a4);
    objc_storeStrong((id *)&v13->_familyEligibilityResponse, a5);
  }

  return v13;
}

- (void)loadView
{
  v46.receiver = self;
  v46.super_class = (Class)FAFamilySetupGetStartedViewController;
  [(FAFamilySetupGetStartedViewController *)&v46 loadView];
  id v3 = objc_alloc(MEMORY[0x263F82B88]);
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  v5 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  v7 = self->_scrollView;
  v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UIScrollView *)v7 setBackgroundColor:v8];

  id v9 = objc_alloc(MEMORY[0x263F82E00]);
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = (UIView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
  contentView = self->_contentView;
  self->_contentView = v14;

  [(UIScrollView *)self->_scrollView addSubview:self->_contentView];
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  v18 = self->_titleLabel;
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"FAMILY_SETUP_FIRST_PAGE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  [(UILabel *)v18 setText:v20];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v21 = self->_titleLabel;
  v22 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)v21 setFont:v22];

  v23 = self->_titleLabel;
  v24 = [MEMORY[0x263F825C8] blackColor];
  [(UILabel *)v23 setTextColor:v24];

  [(UIView *)self->_contentView addSubview:self->_titleLabel];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"FAMILY_SETUP_SHORT_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];
  v27 = [(FAFamilySetupGetStartedViewController *)self _createDescriptionLabelForText:v26];
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v27;

  [(UIView *)self->_contentView addSubview:self->_descriptionLabel];
  id v29 = objc_alloc(MEMORY[0x263F82828]);
  v30 = (void *)MEMORY[0x263F827E8];
  v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v32 = [v30 imageNamed:@"FamilySharingLogo" inBundle:v31];
  v33 = (UIImageView *)[v29 initWithImage:v32];
  familySharingLogo = self->_familySharingLogo;
  self->_familySharingLogo = v33;

  [(UIView *)self->_contentView addSubview:self->_familySharingLogo];
  v35 = [MEMORY[0x263F824E8] buttonWithType:1];
  getStartedButton = self->_getStartedButton;
  self->_getStartedButton = v35;

  v37 = self->_getStartedButton;
  v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"GET_STARTED_BUTTON_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  [(UIButton *)v37 setTitle:v39 forState:0];

  [(UIButton *)self->_getStartedButton addTarget:self action:sel__getStartedButtonWasTapped_ forControlEvents:64];
  v40 = self->_getStartedButton;
  v41 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v40 setTintColor:v41];

  [(UIButton *)self->_getStartedButton setEnabled:1];
  [(UIButton *)self->_getStartedButton setUserInteractionEnabled:1];
  v42 = [(UIButton *)self->_getStartedButton titleLabel];
  v43 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargeButton");
  [v42 setFont:v43];

  [(UIView *)self->_contentView addSubview:self->_getStartedButton];
  v44 = [[FAFamilySharingFeaturesView alloc] initWithContext:0 hideLocationSharing:MGGetBoolAnswer() ^ 1];
  familyFeaturesView = self->_familyFeaturesView;
  self->_familyFeaturesView = v44;

  [(UIView *)self->_contentView addSubview:self->_familyFeaturesView];
  [(FAFamilySetupGetStartedViewController *)self setView:self->_scrollView];
}

- (void)viewWillLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)FAFamilySetupGetStartedViewController;
  [(FAFamilySetupGetStartedViewController *)&v34 viewWillLayoutSubviews];
  id v3 = [(FAFamilySetupGetStartedViewController *)self view];
  [v3 frame];
  double v5 = v4;

  v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  double v8 = 88.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v8 = 28.0;
  }
  double v9 = v5 - v8;
  [(UILabel *)self->_titleLabel frame];
  double v10 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  double v12 = 44.0;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v13 = 44.0;
  }
  else {
    double v13 = 14.0;
  }
  UIRoundToViewScale();
  double v15 = v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 0.0);
  double v17 = v16;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v15, v9, v16);
  [(UIImageView *)self->_familySharingLogo sizeToFit];
  [(UIImageView *)self->_familySharingLogo frame];
  double v19 = v18;
  [(UIImageView *)self->_familySharingLogo size];
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_familySharingLogo, "setFrame:");
  [(UILabel *)self->_descriptionLabel frame];
  UIRoundToViewScale();
  double v21 = v15 + v17 + 24.0 + v19 + v20;
  v22 = [(UILabel *)self->_descriptionLabel text];
  [(FAFamilySetupGetStartedViewController *)self _heightForText:v22 constrainedToWidth:v5 + -60.0];
  double v24 = v23;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 30.0, v21, v5 + -60.0, v24);
  [(UIButton *)self->_getStartedButton sizeToFit];
  [(UIButton *)self->_getStartedButton frame];
  double v26 = v25;
  v27 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v12 = 14.0;
  }
  UIRoundToViewScale();
  double v30 = v21 + v24 + v29;
  -[UIButton setFrame:](self->_getStartedButton, "setFrame:", v12, v30, v9, v26);
  [(FAFamilySharingFeaturesView *)self->_familyFeaturesView frame];
  double v31 = v26 + v30 + 20.0;
  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_familyFeaturesView, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v33 = v32;
  -[FAFamilySharingFeaturesView setFrame:](self->_familyFeaturesView, "setFrame:", 30.0, v31, v5 + -60.0, v32);
  [(UIView *)self->_contentView frame];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v31 + v33 + 30.0);
}

- (void)_updateFonts
{
  titleLabel = self->_titleLabel;
  double v4 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)titleLabel setFont:v4];

  descriptionLabel = self->_descriptionLabel;
  v6 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargerInformationLabel");
  [(UILabel *)descriptionLabel setFont:v6];

  uint64_t v7 = [(UIButton *)self->_getStartedButton titleLabel];
  double v8 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargeButton");
  [v7 setFont:v8];

  id v9 = [(FAFamilySetupGetStartedViewController *)self view];
  [v9 setNeedsLayout];
}

- (id)_createDescriptionLabelForText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setText:v4];

  [v6 setTextAlignment:1];
  [v6 setNumberOfLines:0];
  uint64_t v7 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForLargerInformationLabel");
  [v6 setFont:v7];

  return v6;
}

- (double)_heightForText:(id)a3 constrainedToWidth:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  id v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "aa_fontForLargerInformationLabel");
  v13[0] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;

  return ceil(v10);
}

- (void)_getStartedButtonWasTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained familySetupPage:self didCompleteWithSuccess:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FAFamilySetupGetStartedViewController;
  id v4 = a3;
  [(FAFamilySetupGetStartedViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  id v6 = [(FAFamilySetupGetStartedViewController *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(FAFamilySetupGetStartedViewController *)self _updateFonts];
  }
}

- (FAFamilySetupPageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAFamilySetupPageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyFeaturesView, 0);
  objc_storeStrong((id *)&self->_getStartedButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_familySharingLogo, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_familyEligibilityResponse, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end