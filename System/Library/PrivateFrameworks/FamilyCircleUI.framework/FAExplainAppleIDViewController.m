@interface FAExplainAppleIDViewController
- (BOOL)shouldShowInviteeInstructions;
- (double)_heightForText:(id)a3 constrainedToWidth:(double)a4;
- (void)_updateFonts;
- (void)loadView;
- (void)setShouldShowInviteeInstructions:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FAExplainAppleIDViewController

- (void)loadView
{
  v37.receiver = self;
  v37.super_class = (Class)FAExplainAppleIDViewController;
  [(FAExplainAppleIDViewController *)&v37 loadView];
  id v3 = objc_alloc(MEMORY[0x263F82B88]);
  v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  v5 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  v7 = self->_scrollView;
  v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UIScrollView *)v7 setBackgroundColor:v8];

  [(FAExplainAppleIDViewController *)self setView:self->_scrollView];
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
  v20 = @"FAMILY_SETUP_YOUR_APPLE_ID_TITLE";
  if (([@"FAMILY_SETUP_YOUR_APPLE_ID_TITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v21 = 0;
  }
  else
  {
    v20 = [@"FAMILY_SETUP_YOUR_APPLE_ID_TITLE" stringByAppendingString:@"_REBRAND"];
    int v21 = 1;
  }
  v22 = [v19 localizedStringForKey:v20 value:&stru_26CA2C800 table:@"Localizable"];
  [(UILabel *)v18 setText:v22];

  if (v21) {
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v23 = self->_titleLabel;
  v24 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)v23 setFont:v24];

  [(UIView *)self->_contentView addSubview:self->_titleLabel];
  v25 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v25;

  BOOL shouldShowInviteeInstructions = self->_shouldShowInviteeInstructions;
  v28 = self->_descriptionLabel;
  v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (shouldShowInviteeInstructions)
  {
    v30 = @"FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE";
    if (([@"FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      char v31 = 0;
    }
    else
    {
      v30 = [@"FAMILY_SETUP_APPLE_ID_EXPLANATION_FOR_INVITEE" stringByAppendingString:@"_REBRAND"];
      char v31 = 1;
    }
    v32 = [v29 localizedStringForKey:v30 value:&stru_26CA2C800 table:@"Localizable"];
    [(UILabel *)v28 setText:v32];

    if (v31) {
LABEL_13:
    }
  }
  else
  {
    v30 = @"FAMILY_SETUP_APPLE_ID_EXPLANATION";
    if (([@"FAMILY_SETUP_APPLE_ID_EXPLANATION" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v35 = 0;
    }
    else
    {
      v30 = [@"FAMILY_SETUP_APPLE_ID_EXPLANATION" stringByAppendingString:@"_REBRAND"];
      int v35 = 1;
    }
    v36 = [v29 localizedStringForKey:v30 value:&stru_26CA2C800 table:@"Localizable"];
    [(UILabel *)v28 setText:v36];

    if (v35) {
      goto LABEL_13;
    }
  }

  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  v33 = self->_descriptionLabel;
  v34 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [(UILabel *)v33 setFont:v34];

  [(UIView *)self->_contentView addSubview:self->_descriptionLabel];
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)FAExplainAppleIDViewController;
  [(FAExplainAppleIDViewController *)&v28 viewWillLayoutSubviews];
  id v3 = [(FAExplainAppleIDViewController *)self view];
  [v3 frame];
  double v5 = v4;

  [(UILabel *)self->_titleLabel frame];
  v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v8 = 44.0;
  }
  else {
    double v8 = 14.0;
  }
  UIRoundToViewScale();
  double v10 = v9;
  double v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v13 = 88.0;
  }
  else {
    double v13 = 28.0;
  }
  double v14 = v5 - v13;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5 - v13, 0.0);
  double v16 = v15;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v8, v10, v14, v15);
  [(UILabel *)self->_descriptionLabel frame];
  v17 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v19 = 44.0;
  }
  else {
    double v19 = 14.0;
  }
  double v20 = v10 + v16 + 20.0;
  int v21 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v23 = 88.0;
  }
  else {
    double v23 = 28.0;
  }
  double v24 = v5 - v23;
  v25 = [(UILabel *)self->_descriptionLabel text];
  [(FAExplainAppleIDViewController *)self _heightForText:v25 constrainedToWidth:v24];
  double v27 = v26;

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v19, v20, v24, v27);
}

- (double)_heightForText:(id)a3 constrainedToWidth:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  double v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "aa_fontForPrimaryInformationLabel");
  v13[0] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;

  return ceil(v10);
}

- (void)_updateFonts
{
  titleLabel = self->_titleLabel;
  double v4 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
  [(UILabel *)titleLabel setFont:v4];

  descriptionLabel = self->_descriptionLabel;
  id v6 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [(UILabel *)descriptionLabel setFont:v6];

  id v7 = [(FAExplainAppleIDViewController *)self view];
  [v7 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FAExplainAppleIDViewController;
  id v4 = a3;
  [(FAExplainAppleIDViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  id v6 = [(FAExplainAppleIDViewController *)self traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(FAExplainAppleIDViewController *)self _updateFonts];
  }
}

- (BOOL)shouldShowInviteeInstructions
{
  return self->_shouldShowInviteeInstructions;
}

- (void)setShouldShowInviteeInstructions:(BOOL)a3
{
  self->_BOOL shouldShowInviteeInstructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goToSettingsButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end