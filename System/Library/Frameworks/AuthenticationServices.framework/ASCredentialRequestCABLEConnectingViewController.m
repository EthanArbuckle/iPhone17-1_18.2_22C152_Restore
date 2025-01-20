@interface ASCredentialRequestCABLEConnectingViewController
- (id)_connectingText;
- (id)_informativeText;
- (id)_informativeTextFont;
- (id)initRequiringTableView:(BOOL)a3;
- (void)_setUpInformativeTextLabel;
- (void)_showInformativeText;
- (void)_startInformativeTextTimerIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ASCredentialRequestCABLEConnectingViewController

- (id)initRequiringTableView:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  return [(ASCredentialRequestPaneViewController *)&v4 initRequiringTableView:0];
}

- (void)viewDidLoad
{
  v30[2] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  [(ASCredentialRequestPaneViewController *)&v28 viewDidLoad];
  v3 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x263F823E8]);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

  id v5 = objc_alloc_init(MEMORY[0x263F828E0]);
  v6 = [(ASCredentialRequestCABLEConnectingViewController *)self _connectingText];
  [v5 setText:v6];

  [v5 setMaximumContentSizeCategory:*MEMORY[0x263F83410]];
  v7 = +[ASViewServiceInterfaceUtilities headerTitleFont];
  [v5 setFont:v7];

  id v8 = objc_alloc(MEMORY[0x263F82BF8]);
  v30[0] = self->_activityIndicator;
  v30[1] = v5;
  v9 = v5;
  v26 = v5;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  v11 = (void *)[v8 initWithArrangedSubviews:v10];

  [v11 setAlignment:3];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setSpacing:8.0];
  v12 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  [v12 addSubview:v11];

  v21 = (void *)MEMORY[0x263F08938];
  v25 = [v11 centerXAnchor];
  v27 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  v24 = [v27 safeAreaLayoutGuide];
  v23 = [v24 centerXAnchor];
  v22 = [v25 constraintEqualToAnchor:v23];
  v29[0] = v22;
  v13 = [v9 lastBaselineAnchor];
  v14 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  v15 = [v14 centerYAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v29[1] = v16;
  v17 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  v18 = [v17 heightAnchor];
  v19 = [v18 constraintGreaterThanOrEqualToConstant:300.0];
  v29[2] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  [v21 activateConstraints:v20];

  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  [(ASCredentialRequestPaneViewController *)&v4 viewWillAppear:a3];
  [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  [(ASCredentialRequestPaneViewController *)&v4 viewDidAppear:a3];
  [(ASCredentialRequestCABLEConnectingViewController *)self _startInformativeTextTimerIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestCABLEConnectingViewController;
  [(ASCredentialRequestCABLEConnectingViewController *)&v5 viewWillDisappear:a3];
  [(NSTimer *)self->_informativeTextTimer invalidate];
  informativeTextTimer = self->_informativeTextTimer;
  self->_informativeTextTimer = 0;
}

- (id)_connectingText
{
  return (id)_WBSLocalizedString();
}

- (void)_startInformativeTextTimerIfNeeded
{
  if (!self->_informativeTextTimer && !self->_informativeTextLabel)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x263EFFA20];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __86__ASCredentialRequestCABLEConnectingViewController__startInformativeTextTimerIfNeeded__block_invoke;
    v6[3] = &unk_264396940;
    objc_copyWeak(&v7, &location);
    objc_super v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:5.0];
    informativeTextTimer = self->_informativeTextTimer;
    self->_informativeTextTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __86__ASCredentialRequestCABLEConnectingViewController__startInformativeTextTimerIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[132];
    WeakRetained[132] = 0;
    id v3 = WeakRetained;

    [v3 _showInformativeText];
    WeakRetained = v3;
  }
}

- (void)_showInformativeText
{
  [(ASCredentialRequestCABLEConnectingViewController *)self _setUpInformativeTextLabel];
  [(UILabel *)self->_informativeTextLabel setAlpha:0.0];
  id v3 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  [v3 layoutIfNeeded];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__ASCredentialRequestCABLEConnectingViewController__showInformativeText__block_invoke;
  v4[3] = &unk_264395388;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0.3];
}

uint64_t __72__ASCredentialRequestCABLEConnectingViewController__showInformativeText__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:1.0];
}

- (void)_setUpInformativeTextLabel
{
  v30[4] = *MEMORY[0x263EF8340];
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  informativeTextLabel = self->_informativeTextLabel;
  self->_informativeTextLabel = v3;

  objc_super v5 = [(ASCredentialRequestCABLEConnectingViewController *)self _informativeText];
  [(UILabel *)self->_informativeTextLabel setText:v5];

  [(UILabel *)self->_informativeTextLabel setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
  [(UILabel *)self->_informativeTextLabel setNumberOfLines:0];
  [(UILabel *)self->_informativeTextLabel setTextAlignment:1];
  [(UILabel *)self->_informativeTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_informativeTextLabel setTextColor:v6];

  id v7 = [(ASCredentialRequestCABLEConnectingViewController *)self _informativeTextFont];
  [(UILabel *)self->_informativeTextLabel setFont:v7];

  id v8 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  [v8 addSubview:self->_informativeTextLabel];

  v9 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  v10 = [v9 layoutMarginsGuide];

  if ([MEMORY[0x263F29440] isPad]) {
    double v11 = 8.0;
  }
  else {
    double v11 = 0.0;
  }
  v22 = (void *)MEMORY[0x263F08938];
  [(UILabel *)self->_informativeTextLabel leadingAnchor];
  v29 = objc_super v28 = v10;
  v27 = [v10 leadingAnchor];
  v26 = [v29 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:v11];
  v30[0] = v26;
  v25 = [v10 trailingAnchor];
  v24 = [(UILabel *)self->_informativeTextLabel trailingAnchor];
  v23 = [v25 constraintEqualToSystemSpacingAfterAnchor:v24 multiplier:v11];
  v30[1] = v23;
  v12 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [(UILabel *)self->_informativeTextLabel lastBaselineAnchor];
  v15 = [v13 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v14 multiplier:2.0];
  v30[2] = v15;
  v16 = [(ASCredentialRequestCABLEConnectingViewController *)self view];
  v17 = [v16 safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  v19 = [(UILabel *)self->_informativeTextLabel lastBaselineAnchor];
  v20 = [v18 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v19 multiplier:1.0];
  void v30[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  [v22 activateConstraints:v21];
}

- (id)_informativeText
{
  return (id)_WBSLocalizedString();
}

- (id)_informativeTextFont
{
  return (id)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informativeTextLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_informativeTextTimer, 0);
}

@end