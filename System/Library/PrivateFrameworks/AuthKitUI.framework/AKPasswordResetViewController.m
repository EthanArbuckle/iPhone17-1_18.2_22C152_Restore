@interface AKPasswordResetViewController
- (AKPasswordResetViewController)initWithImageProvider:(id)a3;
- (AKPasswordResetViewControllerDelegate)delegate;
- (AKProfileImageProviding)imageProvider;
- (BOOL)showHelpSomeoneElseButtonLoading;
- (BOOL)showResetMyPasswordButtonLoading;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)closeButton;
- (UIButton)helpSomeoneElseButton;
- (UIButton)resetMyPasswordButton;
- (UIImageView)keyIconImageView;
- (UIImageView)profilePictureImageView;
- (UILabel)screenSummaryLabel;
- (UILabel)screenTitleLabel;
- (UILabel)serviceNameLabel;
- (UIScrollView)contentScrollView;
- (UIStackView)contentView;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)footerView;
- (UIView)titleView;
- (id)_helpSomeonElseButtonTitle;
- (id)_helpSomeoneElseButtonConfiguration;
- (id)_resetMyPasswordButtonConfiguration;
- (id)_resetMyPasswordButtonTitle;
- (void)_applyLocalization;
- (void)_applyStyle;
- (void)_loadProfilePicture;
- (void)_setupSubviews;
- (void)_startLoading;
- (void)didSelectClose:(id)a3;
- (void)didSelectHelpSomeoneElse:(id)a3;
- (void)didSelectResetMyPassword:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContentScrollView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHelpSomeoneElseButton:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setKeyIconImageView:(id)a3;
- (void)setProfilePictureImageView:(id)a3;
- (void)setResetMyPasswordButton:(id)a3;
- (void)setScreenSummaryLabel:(id)a3;
- (void)setScreenTitleLabel:(id)a3;
- (void)setServiceNameLabel:(id)a3;
- (void)setShowHelpSomeoneElseButtonLoading:(BOOL)a3;
- (void)setShowResetMyPasswordButtonLoading:(BOOL)a3;
- (void)setTitleView:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)stopLoading;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AKPasswordResetViewController

- (AKPasswordResetViewController)initWithImageProvider:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9.receiver = self;
  v9.super_class = (Class)AKPasswordResetViewController;
  v7 = [(AKPasswordResetViewController *)&v9 initWithNibName:@"AKPasswordResetViewController" bundle:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_imageProvider, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AKPasswordResetViewController;
  [(AKPasswordResetViewController *)&v3 viewDidLoad];
  [(AKPasswordResetViewController *)self _setupSubviews];
  [(AKPasswordResetViewController *)self _applyStyle];
  [(AKPasswordResetViewController *)self _applyLocalization];
  [(AKPasswordResetViewController *)self _loadProfilePicture];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)AKPasswordResetViewController;
  [(AKPasswordResetViewController *)&v8 viewDidLayoutSubviews];
  objc_super v3 = [(AKPasswordResetViewController *)self footerView];
  [v3 frame];
  double v5 = v4;

  v6 = [(AKPasswordResetViewController *)self contentScrollView];
  objc_msgSend(v6, "setContentInset:", 0.0, 0.0, v5, 0.0);

  v7 = [(AKPasswordResetViewController *)self contentScrollView];
  objc_msgSend(v7, "setScrollIndicatorInsets:", 0.0, 0.0, v5, 0.0);
}

- (void)_setupSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  double v4 = [(AKPasswordResetViewController *)self titleView];
  double v5 = (void *)[v3 initWithCustomView:v4];
  v6 = [(AKPasswordResetViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F427C0]);
  objc_super v8 = [(AKPasswordResetViewController *)self closeButton];
  objc_super v9 = (void *)[v7 initWithCustomView:v8];
  v10 = [(AKPasswordResetViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  v11 = [(AKPasswordResetViewController *)self profilePictureImageView];
  [v11 frame];
  double v13 = v12 * 0.5;
  v14 = [(AKPasswordResetViewController *)self profilePictureImageView];
  v15 = [v14 layer];
  [v15 setCornerRadius:v13];

  v16 = [(AKPasswordResetViewController *)self profilePictureImageView];
  v17 = [v16 layer];
  [v17 setMasksToBounds:1];

  v18 = [(AKPasswordResetViewController *)self contentScrollView];
  [v18 setAccessibilityIdentifier:@"SCROLL_VIEW"];

  id v19 = [(AKPasswordResetViewController *)self contentView];
  [v19 setAccessibilityIdentifier:@"SCROLL_VIEW_CONTENT_VIEW"];
}

- (void)_applyLocalization
{
  double v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v5 = @"PASSWORD_RESET_OPTIONS_SERVICE_TITLE";
  char v6 = [@"PASSWORD_RESET_OPTIONS_SERVICE_TITLE" containsString:@"REBRAND"];
  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v2 isAABrandingEnabled])
    {
      double v5 = [@"PASSWORD_RESET_OPTIONS_SERVICE_TITLE" stringByAppendingString:@"_REBRAND"];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
    }
  }
  objc_super v8 = [v4 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];
  objc_super v9 = [(AKPasswordResetViewController *)self serviceNameLabel];
  [v9 setText:v8];

  if (v7) {
  if ((v6 & 1) == 0)
  }

  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PASSWORD_RESET_OPTIONS_SCREEN_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  double v12 = [(AKPasswordResetViewController *)self screenTitleLabel];
  [v12 setText:v11];

  double v13 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v35 = [v13 primaryAuthKitAccount];

  v14 = (void *)MEMORY[0x1E4F4F0E0];
  v15 = [v35 username];
  v16 = [v14 formattedUsernameFromUsername:v15];

  id v17 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v18 = [MEMORY[0x1E4F4EF40] sharedInstance];
  id v19 = [v18 familyNameForAccount:v35];
  [v17 setFamilyName:v19];

  v20 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v21 = [v20 givenNameForAccount:v35];
  [v17 setGivenName:v21];

  id v22 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  v23 = [v22 stringFromPersonNameComponents:v17];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"PASSWORD_RESET_OPTIONS_SCREEN_SUMMARY" value:&stru_1F1EE8138 table:@"Localizable"];

  v26 = NSString;
  v27 = [MEMORY[0x1E4F42948] currentDevice];
  v28 = [v27 localizedModel];
  v29 = objc_msgSend(v26, "stringWithFormat:", v25, v23, v16, v28);

  v30 = [(AKPasswordResetViewController *)self screenSummaryLabel];
  [v30 setText:v29];

  v31 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  v32 = [(AKPasswordResetViewController *)self _resetMyPasswordButtonTitle];
  [v31 setTitle:v32 forState:0];

  v33 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  v34 = [(AKPasswordResetViewController *)self _helpSomeonElseButtonTitle];
  [v33 setTitle:v34 forState:0];
}

- (id)_resetMyPasswordButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PASSWORD_RESET_OPTIONS_CURRENT_USER_ACTION_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];

  return v3;
}

- (id)_helpSomeonElseButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PASSWORD_RESET_OPTIONS_SOMEONE_ELSE_ACTION_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];

  return v3;
}

- (void)_applyStyle
{
  id v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  double v4 = [(AKPasswordResetViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [(AKPasswordResetViewController *)self keyIconImageView];
  [v5 frame];
  double v7 = v6 * 0.5;
  objc_super v8 = [(AKPasswordResetViewController *)self keyIconImageView];
  objc_super v9 = [v8 layer];
  [v9 setCornerRadius:v7];

  v10 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v11 = [(AKPasswordResetViewController *)self keyIconImageView];
  [v11 setBackgroundColor:v10];

  double v12 = +[AKPasswordResetAppearance serviceNameFont];
  double v13 = [(AKPasswordResetViewController *)self serviceNameLabel];
  [v13 setFont:v12];

  v14 = [(AKPasswordResetViewController *)self serviceNameLabel];
  [v14 setAdjustsFontForContentSizeCategory:0];

  v15 = +[AKPasswordResetAppearance closeButtonConfiguration];
  v16 = [(AKPasswordResetViewController *)self closeButton];
  [v16 setConfiguration:v15];

  id v17 = +[AKPasswordResetAppearance screenTitleFont];
  v18 = [(AKPasswordResetViewController *)self screenTitleLabel];
  [v18 setFont:v17];

  id v19 = +[AKPasswordResetAppearance screenSummaryFont];
  v20 = [(AKPasswordResetViewController *)self screenSummaryLabel];
  [v20 setFont:v19];

  objc_initWeak(&location, self);
  v21 = [(AKPasswordResetViewController *)self _resetMyPasswordButtonConfiguration];
  id v22 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  [v22 setConfiguration:v21];

  v23 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__AKPasswordResetViewController__applyStyle__block_invoke;
  v29[3] = &unk_1E648F030;
  objc_copyWeak(&v30, &location);
  [v23 setConfigurationUpdateHandler:v29];

  v24 = [(AKPasswordResetViewController *)self _helpSomeoneElseButtonConfiguration];
  v25 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  [v25 setConfiguration:v24];

  v26 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__AKPasswordResetViewController__applyStyle__block_invoke_2;
  v27[3] = &unk_1E648F030;
  objc_copyWeak(&v28, &location);
  [v26 setConfigurationUpdateHandler:v27];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __44__AKPasswordResetViewController__applyStyle__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = [v6 configuration];
    objc_msgSend(v4, "setShowsActivityIndicator:", objc_msgSend(WeakRetained, "showResetMyPasswordButtonLoading"));
    if ([WeakRetained showResetMyPasswordButtonLoading])
    {
      [v4 setTitle:0];
    }
    else
    {
      double v5 = [WeakRetained _resetMyPasswordButtonTitle];
      [v4 setTitle:v5];
    }
    [v6 setConfiguration:v4];
  }
}

void __44__AKPasswordResetViewController__applyStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = [v6 configuration];
    objc_msgSend(v4, "setShowsActivityIndicator:", objc_msgSend(WeakRetained, "showHelpSomeoneElseButtonLoading"));
    if ([WeakRetained showHelpSomeoneElseButtonLoading])
    {
      [v4 setTitle:0];
    }
    else
    {
      double v5 = [WeakRetained _helpSomeonElseButtonTitle];
      [v4 setTitle:v5];
    }
    [v6 setConfiguration:v4];
  }
}

- (void)didSelectClose:(id)a3
{
  double v4 = [(AKPasswordResetViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();
  id v6 = _AKLogSystem();
  double v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "User selected close in password reset options screen", v8, 2u);
    }

    [v4 passwordResetControllerDidSelectClose:self];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKPasswordResetViewController didSelectClose:](v7);
    }
  }
}

- (void)didSelectResetMyPassword:(id)a3
{
  [(AKPasswordResetViewController *)self setShowResetMyPasswordButtonLoading:1];
  double v4 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  [v4 setNeedsUpdateConfiguration];

  [(AKPasswordResetViewController *)self _startLoading];
  id v5 = [(AKPasswordResetViewController *)self delegate];
  [v5 passwordResetControllerDidSelectPrimaryUser:self];
}

- (void)didSelectHelpSomeoneElse:(id)a3
{
  [(AKPasswordResetViewController *)self setShowHelpSomeoneElseButtonLoading:1];
  double v4 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  [v4 setNeedsUpdateConfiguration];

  [(AKPasswordResetViewController *)self _startLoading];
  id v5 = [(AKPasswordResetViewController *)self delegate];
  [v5 passwordResetControllerDidSelectOtherUser:self];
}

- (void)_loadProfilePicture
{
  id v3 = [(AKPasswordResetViewController *)self imageProvider];
  double v4 = [v3 profilePictureForAccountOwner];

  if (v4)
  {
    id v5 = [(AKPasswordResetViewController *)self profilePictureImageView];
    [v5 setImage:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = [(AKPasswordResetViewController *)self imageProvider];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__AKPasswordResetViewController__loadProfilePicture__block_invoke;
    v7[3] = &unk_1E648F080;
    objc_copyWeak(&v8, &location);
    [v6 profilePictureForAccountOwnerWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __52__AKPasswordResetViewController__loadProfilePicture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AKPasswordResetViewController__loadProfilePicture__block_invoke_2;
  v5[3] = &unk_1E648F058;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __52__AKPasswordResetViewController__loadProfilePicture__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = [WeakRetained profilePictureImageView];
      [v4 setImage:v3];

      id WeakRetained = v5;
    }
  }
}

- (id)_resetMyPasswordButtonConfiguration
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
  [v2 setCornerStyle:3];
  [v2 setImagePadding:6.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AKPasswordResetViewController__resetMyPasswordButtonConfiguration__block_invoke;
  v4[3] = &unk_1E648F0A8;
  objc_copyWeak(&v5, &location);
  [v2 setTitleTextAttributesTransformer:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

id __68__AKPasswordResetViewController__resetMyPasswordButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained showResetMyPasswordButtonLoading] & 1) != 0
      || [v5 showHelpSomeoneElseButtonLoading])
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    id v7 = (void *)v6;
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F42510]];

    id v8 = +[AKPasswordResetAppearance actionButtonFont];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42508]];
  }

  return v3;
}

- (id)_helpSomeoneElseButtonConfiguration
{
  objc_initWeak(&location, self);
  v2 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  [v2 setImagePadding:6.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__AKPasswordResetViewController__helpSomeoneElseButtonConfiguration__block_invoke;
  v4[3] = &unk_1E648F0A8;
  objc_copyWeak(&v5, &location);
  [v2 setTitleTextAttributesTransformer:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

id __68__AKPasswordResetViewController__helpSomeoneElseButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained showResetMyPasswordButtonLoading] & 1) != 0
      || [v5 showHelpSomeoneElseButtonLoading])
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] systemBlueColor];
    }
    id v7 = (void *)v6;
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F42510]];

    id v8 = +[AKPasswordResetAppearance actionButtonFont];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F42508]];
  }

  return v3;
}

- (void)_startLoading
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Started loading state in password reset options screen", v8, 2u);
  }

  id v4 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  [v4 setEnabled:0];

  id v5 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  [v5 setEnabled:0];

  uint64_t v6 = [(AKPasswordResetViewController *)self closeButton];
  [v6 setHidden:1];

  id v7 = [(AKPasswordResetViewController *)self view];
  [v7 setUserInteractionEnabled:0];
}

- (void)stopLoading
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Stopped loading state in password reset options screen", v10, 2u);
  }

  [(AKPasswordResetViewController *)self setShowResetMyPasswordButtonLoading:0];
  id v4 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  [v4 setNeedsUpdateConfiguration];

  [(AKPasswordResetViewController *)self setShowHelpSomeoneElseButtonLoading:0];
  id v5 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  [v5 setNeedsUpdateConfiguration];

  uint64_t v6 = [(AKPasswordResetViewController *)self resetMyPasswordButton];
  [v6 setEnabled:1];

  id v7 = [(AKPasswordResetViewController *)self helpSomeoneElseButton];
  [v7 setEnabled:1];

  id v8 = [(AKPasswordResetViewController *)self closeButton];
  [v8 setHidden:0];

  objc_super v9 = [(AKPasswordResetViewController *)self view];
  [v9 setUserInteractionEnabled:1];
}

- (AKPasswordResetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKPasswordResetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)titleView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleView);

  return (UIView *)WeakRetained;
}

- (void)setTitleView:(id)a3
{
}

- (UILabel)serviceNameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceNameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setServiceNameLabel:(id)a3
{
}

- (UIButton)closeButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closeButton);

  return (UIButton *)WeakRetained;
}

- (void)setCloseButton:(id)a3
{
}

- (UIScrollView)contentScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setContentScrollView:(id)a3
{
}

- (UIStackView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);

  return (UIStackView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (UIImageView)profilePictureImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profilePictureImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setProfilePictureImageView:(id)a3
{
}

- (UIImageView)keyIconImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyIconImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setKeyIconImageView:(id)a3
{
}

- (UILabel)screenTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenTitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setScreenTitleLabel:(id)a3
{
}

- (UILabel)screenSummaryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenSummaryLabel);

  return (UILabel *)WeakRetained;
}

- (void)setScreenSummaryLabel:(id)a3
{
}

- (UIView)footerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_footerView);

  return (UIView *)WeakRetained;
}

- (void)setFooterView:(id)a3
{
}

- (UIButton)resetMyPasswordButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resetMyPasswordButton);

  return (UIButton *)WeakRetained;
}

- (void)setResetMyPasswordButton:(id)a3
{
}

- (UIButton)helpSomeoneElseButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_helpSomeoneElseButton);

  return (UIButton *)WeakRetained;
}

- (void)setHelpSomeoneElseButton:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (BOOL)showResetMyPasswordButtonLoading
{
  return self->_showResetMyPasswordButtonLoading;
}

- (void)setShowResetMyPasswordButtonLoading:(BOOL)a3
{
  self->_showResetMyPasswordButtonLoading = a3;
}

- (BOOL)showHelpSomeoneElseButtonLoading
{
  return self->_showHelpSomeoneElseButtonLoading;
}

- (void)setShowHelpSomeoneElseButtonLoading:(BOOL)a3
{
  self->_showHelpSomeoneElseButtonLoading = a3;
}

- (AKProfileImageProviding)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_helpSomeoneElseButton);
  objc_destroyWeak((id *)&self->_resetMyPasswordButton);
  objc_destroyWeak((id *)&self->_footerView);
  objc_destroyWeak((id *)&self->_screenSummaryLabel);
  objc_destroyWeak((id *)&self->_screenTitleLabel);
  objc_destroyWeak((id *)&self->_keyIconImageView);
  objc_destroyWeak((id *)&self->_profilePictureImageView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_contentScrollView);
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_serviceNameLabel);
  objc_destroyWeak((id *)&self->_titleView);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didSelectClose:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Password reset option controller's delegate didn't implement to close event.", v1, 2u);
}

@end