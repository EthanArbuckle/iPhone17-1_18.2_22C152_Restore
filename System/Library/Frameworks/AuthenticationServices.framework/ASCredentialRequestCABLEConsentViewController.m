@interface ASCredentialRequestCABLEConsentViewController
- (ASCAuthorizationPresentationContext)presentationContext;
- (ASCredentialRequestCABLEConsentViewController)initWithPresentationContext:(id)a3;
- (id)_titleText;
- (int64_t)numberOfTableRows;
- (void)_addHeaderSpacerViewWithCustomSpacingAfter:(double)a3;
- (void)_continueButtonPressed;
- (void)_setUpContinueButton;
- (void)_setUpIconView;
- (void)_setUpTitleView;
- (void)viewDidLoad;
@end

@implementation ASCredentialRequestCABLEConsentViewController

- (ASCredentialRequestCABLEConsentViewController)initWithPresentationContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialRequestCABLEConsentViewController;
  v6 = [(ASCredentialRequestPaneViewController *)&v10 initRequiringTableView:1];
  v7 = (ASCredentialRequestCABLEConsentViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 132, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ASCredentialRequestCABLEConsentViewController;
  [(ASCredentialRequestPaneViewController *)&v5 viewDidLoad];
  v3 = [(ASCredentialRequestPaneViewController *)self tableView];
  [v3 setSeparatorStyle:0];

  v4 = [(ASCredentialRequestPaneViewController *)self tableView];
  [v4 setDataSource:self];

  [(ASCredentialRequestCABLEConsentViewController *)self _addHeaderSpacerViewWithCustomSpacingAfter:24.0];
  [(ASCredentialRequestCABLEConsentViewController *)self _setUpIconView];
  [(ASCredentialRequestCABLEConsentViewController *)self _setUpTitleView];
  [(ASCredentialRequestCABLEConsentViewController *)self _addHeaderSpacerViewWithCustomSpacingAfter:0.0];
  [(ASCredentialRequestCABLEConsentViewController *)self _setUpContinueButton];
  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (int64_t)numberOfTableRows
{
  return 0;
}

- (void)_setUpIconView
{
  id v5 = +[ASCredentialRequestIconGenerator passwordManagerIcon];
  v3 = [[ASCredentialRequestImageSubPane alloc] initWithImage:v5];
  v4 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v4 addSubPane:v3 withCustomSpacingAfter:24.0];
}

- (void)_setUpTitleView
{
  v3 = [ASCredentialRequestInfoLabelSubPane alloc];
  v4 = [(ASCredentialRequestCABLEConsentViewController *)self _titleText];
  v6 = [(ASCredentialRequestInfoLabelSubPane *)v3 initWithString:v4 labelType:1];

  id v5 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v5 addSubPane:v6 withCustomSpacingAfter:40.0];
}

- (void)_setUpContinueButton
{
  v7 = objc_alloc_init(ASCredentialRequestButtonContinue);
  v3 = _WBSLocalizedString();
  [(ASCredentialRequestButton *)v7 setButtonText:v3];

  [(ASCredentialRequestButton *)v7 addTarget:self action:sel__continueButtonPressed];
  v4 = [(ASCredentialRequestPaneViewController *)self paneFooterStackView];
  [v4 addArrangedSubview:v7];

  id v5 = [(ASCredentialRequestButtonContinue *)v7 heightAnchor];
  +[ASViewServiceInterfaceUtilities continueButtonHeight];
  v6 = objc_msgSend(v5, "constraintEqualToConstant:");
  [v6 setActive:1];
}

- (void)_addHeaderSpacerViewWithCustomSpacingAfter:(double)a3
{
  id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v5 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v5 addArrangedSubview:v9];

  v6 = [(ASCredentialRequestPaneViewController *)self paneHeaderStackView];
  [v6 setCustomSpacing:v9 afterView:a3];

  v7 = [v9 heightAnchor];
  v8 = [v7 constraintEqualToConstant:0.0];
  [v8 setActive:1];
}

- (void)_continueButtonPressed
{
  id v3 = [(ASCredentialRequestPaneViewController *)self delegate];
  [v3 requestPaneViewControllerStartCABLEAuthentication:self];
}

- (id)_titleText
{
  [(ASCAuthorizationPresentationContext *)self->_presentationContext _passkeyURLType];
  v2 = [MEMORY[0x263F66290] currentDevice];
  [v2 deviceClass];

  id v3 = _WBSLocalizedString();

  return v3;
}

- (ASCAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
}

@end