@interface AKAuthorizationFirstTimePaneViewController
- (AKAuthorizationViewController)authorizationViewController;
- (BOOL)shouldEmbedContentTrayIfNeeded;
- (void)_addAdditionalCTAToContext:(id)a3;
- (void)_addContinueButtonToContext:(id)a3 title:(id)a4;
- (void)_addIconToContext:(id)a3;
- (void)_addPrivacyLinkToContext:(id)a3;
- (void)_addTitleToContext:(id)a3;
- (void)_continueButtonSelected:(id)a3;
- (void)_performAdditionalCTA:(id)a3;
- (void)setAuthorizationViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AKAuthorizationFirstTimePaneViewController

- (void)viewDidLoad
{
  v52.receiver = self;
  v52.super_class = (Class)AKAuthorizationFirstTimePaneViewController;
  [(AKAuthorizationPaneViewController *)&v52 viewDidLoad];
  v3 = +[AKAuthorizationAppearance paneBackgroundColor];
  v4 = [(AKAuthorizationFirstTimePaneViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(AKAuthorizationPaneViewController *)self tableView];
  [v5 setDelegate:self];

  v51 = [(AKAuthorizationPaneViewController *)self mutableConstraints];
  uint64_t v6 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [(AKAuthorizationFirstTimePaneViewController *)self _addIconToContext:v6];
  v50 = (void *)v6;
  [(AKAuthorizationFirstTimePaneViewController *)self _addTitleToContext:v6];
  v7 = [(AKAuthorizationFirstTimePaneViewController *)self authorizationViewController];
  int v8 = [v7 _isManagedAppleID];

  v9 = [AKAuthorizationBulletPointSubPane alloc];
  v10 = +[AKAuthorizationBiometricImage biometricImage];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_TITLE_1" value:&stru_1F1EE8138 table:@"Localizable"];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v49 = v8;
  if (v8)
  {
    v14 = @"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1";
    char v15 = [@"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1" containsString:@"REBRAND"];
    if (v15)
    {
      int v16 = 0;
    }
    else
    {
      v48 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v48 isAABrandingEnabled])
      {
        v14 = [@"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_1" stringByAppendingString:@"_REBRAND"];
        int v16 = 1;
      }
      else
      {
        int v16 = 0;
      }
    }
    v20 = [v13 localizedStringForKey:v14 value:&stru_1F1EE8138 table:@"Localizable"];
    v21 = [(AKAuthorizationBulletPointSubPane *)v9 initWithImage:v10 title:v12 message:v20];

    if (v16) {
    if ((v15 & 1) == 0)
    }

    v22 = [AKAuthorizationBulletPointSubPane alloc];
    v23 = objc_msgSend(MEMORY[0x1E4F42A80], "ak_imageNamed:", @"lock.fill");
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_TITLE_2" value:&stru_1F1EE8138 table:@"Localizable"];
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v27 = v26;
    v28 = @"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_MESSAGE_2";
  }
  else
  {
    v17 = @"AUTHORIZE_FIRST_TIME_MESSAGE_1";
    char v18 = [@"AUTHORIZE_FIRST_TIME_MESSAGE_1" containsString:@"REBRAND"];
    if (v18)
    {
      int v19 = 0;
    }
    else
    {
      v48 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v48 isAABrandingEnabled])
      {
        v17 = [@"AUTHORIZE_FIRST_TIME_MESSAGE_1" stringByAppendingString:@"_REBRAND"];
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
      }
    }
    v29 = [v13 localizedStringForKey:v17 value:&stru_1F1EE8138 table:@"Localizable"];
    v21 = [(AKAuthorizationBulletPointSubPane *)v9 initWithImage:v10 title:v12 message:v29];

    if (v19) {
    if ((v18 & 1) == 0)
    }

    v22 = [AKAuthorizationBulletPointSubPane alloc];
    v23 = objc_msgSend(MEMORY[0x1E4F42A80], "ak_imageNamed:", @"hand.raised.fill");
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_TITLE_2" value:&stru_1F1EE8138 table:@"Localizable"];
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v27 = v26;
    v28 = @"AUTHORIZE_FIRST_TIME_MESSAGE_2";
  }
  v30 = [v26 localizedStringForKey:v28 value:&stru_1F1EE8138 table:@"Localizable"];
  v31 = [(AKAuthorizationBulletPointSubPane *)v22 initWithImage:v23 title:v25 message:v30];

  v32 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v32 addSubPane:v21];

  v33 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v33 addSubPane:v31];

  +[AKAuthorizationPaneMetrics interBulletSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v21, "setCustomSpacingAfter:");
  +[AKAuthorizationPaneMetrics interBulletSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v31, "setCustomSpacingAfter:");
  if ((v49 & 1) == 0)
  {
    v34 = [AKAuthorizationBulletPointSubPane alloc];
    v35 = objc_msgSend(MEMORY[0x1E4F42A80], "ak_imageNamed:", *MEMORY[0x1E4F4EF18]);
    v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v37 = [v36 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_TITLE_3" value:&stru_1F1EE8138 table:@"Localizable"];
    v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v39 = [v38 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_MESSAGE_3" value:&stru_1F1EE8138 table:@"Localizable"];
    v40 = [(AKAuthorizationBulletPointSubPane *)v34 initWithImage:v35 title:v37 message:v39];

    v41 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
    [v41 addSubPane:v40];
  }
  v42 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKAuthorizationFirstTimePaneViewController *)self _addPrivacyLinkToContext:v42];

  v43 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v45 = [v44 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_BUTTON_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKAuthorizationFirstTimePaneViewController *)self _addContinueButtonToContext:v43 title:v45];

  v46 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKAuthorizationFirstTimePaneViewController *)self _addAdditionalCTAToContext:v46];

  v47 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [v47 addEmptyViewWithSpacing:0.0];

  [MEMORY[0x1E4F28DC8] activateConstraints:v51];
}

- (BOOL)shouldEmbedContentTrayIfNeeded
{
  return 1;
}

- (void)_addIconToContext:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v24 = a3;
  v25 = [v3 bundleForClass:objc_opt_class()];
  v23 = objc_msgSend(MEMORY[0x1E4F42A80], "imageNamed:inBundle:", @"SignInWithAppleLogo");
  v4 = [[AKAuthorizationSubPaneImage alloc] initWithImage:v23];
  v5 = [(AKAuthorizationSubPaneImage *)v4 image];
  [v5 size];
  if (v6 == 0.0)
  {
    double v12 = 1.0;
  }
  else
  {
    v7 = [(AKAuthorizationSubPaneImage *)v4 image];
    [v7 size];
    double v9 = v8;
    v10 = [(AKAuthorizationSubPaneImage *)v4 image];
    [v10 size];
    double v12 = v9 / v11;
  }
  v13 = [(AKAuthorizationSubPaneImage *)v4 imageView];
  v14 = [v13 heightAnchor];
  +[AKAuthorizationPaneMetrics iconSize];
  int v16 = [v14 constraintEqualToConstant:v15];
  v26[0] = v16;
  v17 = [(AKAuthorizationSubPaneImage *)v4 imageView];
  char v18 = [v17 widthAnchor];
  int v19 = [(AKAuthorizationSubPaneImage *)v4 imageView];
  v20 = [v19 heightAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 multiplier:v12];
  v26[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [(AKAuthorizationSubPaneImage *)v4 setImageViewConstraints:v22];

  [v24 addSubPane:v4];
  +[AKAuthorizationPaneMetrics iconBottomSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v4, "setCustomSpacingAfter:");
}

- (void)_addTitleToContext:(id)a3
{
  id v14 = a3;
  v4 = [(AKAuthorizationFirstTimePaneViewController *)self authorizationViewController];
  int v5 = [v4 _isManagedAppleID];

  double v6 = [AKAuthorizationSubPaneInfoLabel alloc];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v8 = [v7 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  double v9 = [(AKAuthorizationSubPaneInfoLabel *)v6 initWithString:v8];

  [(AKAuthorizationSubPaneInfoLabel *)v9 setInfoLabelType:1];
  [v14 addSubPane:v9];
  if (v5)
  {
    +[AKAuthorizationPaneMetrics titleToSmallTitleVerticalSpacing];
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v9, "setCustomSpacingAfter:");
    v10 = [AKAuthorizationSubPaneInfoLabel alloc];
    double v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"AUTHORIZE_FIRST_TIME_MANAGED_ACCOUNT_SMALLTITLE" value:&stru_1F1EE8138 table:@"Localizable"];
    v13 = [(AKAuthorizationSubPaneInfoLabel *)v10 initWithString:v12];

    [(AKAuthorizationSubPaneInfoLabel *)v13 setInfoLabelType:3];
    [v14 addSubPane:v13];
    +[AKAuthorizationPaneMetrics titleBottomSpacing];
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v13, "setCustomSpacingAfter:");
  }
  else
  {
    +[AKAuthorizationPaneMetrics titleBottomSpacing];
    -[AKAuthorizationSubPane setCustomSpacingAfter:](v9, "setCustomSpacingAfter:");
  }
}

- (void)_addPrivacyLinkToContext:(id)a3
{
  id v4 = a3;
  +[AKAuthorizationPaneMetrics privacyLinkTopSpacing];
  objc_msgSend(v4, "addEmptyViewWithSpacing:");
  int v5 = [(AKAuthorizationFirstTimePaneViewController *)self authorizationViewController];
  unsigned int v6 = [v5 _isManagedAppleID];

  v7 = [[AKAuthorizationSubPanePrivacyLink alloc] initWithPrivacyLinkType:v6];
  [v4 addSubPane:v7];

  +[AKAuthorizationPaneMetrics privacyLinkBottomSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v7, "setCustomSpacingAfter:");
}

- (void)_addContinueButtonToContext:(id)a3 title:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [AKAuthorizationContinueButton alloc];
  double v9 = -[AKAuthorizationContinueButton initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKAuthorizationContinueButton *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AKAuthorizationButton *)v9 setButtonText:v6];

  [(AKAuthorizationButton *)v9 addTarget:self action:sel__continueButtonSelected_];
  v10 = [v7 stackView];
  +[AKAuthorizationPaneMetrics continueButtonTopSpacing];
  double v12 = v11;
  v13 = [v7 stackView];
  id v14 = [v13 arrangedSubviews];
  double v15 = [v14 lastObject];
  [v10 setCustomSpacing:v15 afterView:v12];

  int v16 = [v7 stackView];
  [v16 addArrangedSubview:v9];

  v17 = [v7 stackView];
  +[AKAuthorizationPaneMetrics continueButtonBottomSpacing];
  objc_msgSend(v17, "setCustomSpacing:afterView:", v9);

  char v18 = [v7 mutableConstraints];

  int v19 = [(AKAuthorizationContinueButton *)v9 heightAnchor];
  +[AKAuthorizationPaneMetrics continueButtonHeight];
  v20 = objc_msgSend(v19, "constraintEqualToConstant:");
  v22[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v18 addObjectsFromArray:v21];
}

- (void)_continueButtonSelected:(id)a3
{
  id v4 = [(AKAuthorizationFirstTimePaneViewController *)self navigationController];
  int v5 = [v4 topViewController];

  if (v5 == self)
  {
    id v6 = [(AKAuthorizationPaneViewController *)self paneDelegate];
    [v6 performAppleIDAuthorizationForPaneViewController:self];
  }
}

- (void)_addAdditionalCTAToContext:(id)a3
{
  id v19 = a3;
  id v4 = [(AKAuthorizationFirstTimePaneViewController *)self authorizationViewController];
  int v5 = [v4 presentationContext];
  id v6 = [v5 credentialRequestContext];
  int v7 = [v6 _shouldShowAdditionalCTA];

  if (v7)
  {
    double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringForKey:@"ADDITIONAL_CTA" value:&stru_1F1EE8138 table:@"Localizable"];

    v10 = +[AKTextualLinkButton buttonWithText:v9 fontSize:self target:sel__performAdditionalCTA_ action:16.0];
    double v11 = [v19 stackView];
    [v11 addArrangedSubview:v10];

    double v12 = [v19 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDTopSpacing];
    double v14 = v13;
    double v15 = [v19 stackView];
    int v16 = [v15 arrangedSubviews];
    v17 = [v16 lastObject];
    [v12 setCustomSpacing:v17 afterView:v14];

    char v18 = [v19 stackView];
    +[AKAuthorizationPaneMetrics useOtherAppleIDBottomSpacing];
    objc_msgSend(v18, "setCustomSpacing:afterView:", v10);
  }
}

- (void)_performAdditionalCTA:(id)a3
{
  id v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Perform Additional CTA.", v10, 2u);
  }

  int v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7124);
  id v6 = self;
  int v7 = [(AKAuthorizationFirstTimePaneViewController *)v6 authorizationViewController];
  double v8 = [v7 delegate];
  double v9 = [(AKAuthorizationFirstTimePaneViewController *)v6 authorizationViewController];

  [v8 authorizationViewController:v9 didCompleteWithAuthorization:0 error:v5];
}

- (AKAuthorizationViewController)authorizationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorizationViewController);

  return (AKAuthorizationViewController *)WeakRetained;
}

- (void)setAuthorizationViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end