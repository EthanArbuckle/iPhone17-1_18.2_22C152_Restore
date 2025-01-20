@interface AKParentalApprovalRequestViewController
- (AKAuthorizationViewController)authorizationViewController;
- (AKParentalApprovalRequestViewController)initWithPresentationContext:(id)a3;
- (id)_localizedButtonTitleString;
- (id)_localizedDescriptionLabelString;
- (id)_localizedTitleString;
- (id)_userResponse;
- (void)_addSendButtonToContext:(id)a3;
- (void)_createIconViewWithIcon:(id)a3;
- (void)_handleAuthorizationError:(id)a3;
- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4;
- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4;
- (void)_sendButtonSelected:(id)a3;
- (void)_setupIconView;
- (void)_setupMessageLabel;
- (void)_setupTitleLabel;
- (void)setAuthorizationViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AKParentalApprovalRequestViewController

- (AKParentalApprovalRequestViewController)initWithPresentationContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKParentalApprovalRequestViewController;
  v6 = [(AKAuthorizationPaneViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AKParentalApprovalRequestViewController;
  [(AKAuthorizationPaneViewController *)&v6 viewDidLoad];
  [(AKParentalApprovalRequestViewController *)self _setupIconView];
  [(AKParentalApprovalRequestViewController *)self _setupTitleLabel];
  [(AKParentalApprovalRequestViewController *)self _setupMessageLabel];
  v3 = [(AKAuthorizationPaneViewController *)self footerPaneContext];
  [(AKParentalApprovalRequestViewController *)self _addSendButtonToContext:v3];

  v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = [(AKAuthorizationPaneViewController *)self mutableConstraints];
  [v4 activateConstraints:v5];
}

- (void)_setupIconView
{
  id v5 = +[AKIcon iconWithPresentationContext:self->_presentationContext];
  if ([v5 iconType] == 1)
  {
    +[AKAuthorizationPaneMetrics iconSize];
    uint64_t v3 = +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", @"AppleLogo");

    id v4 = (id)v3;
  }
  else
  {
    id v4 = v5;
  }
  id v6 = v4;
  [(AKParentalApprovalRequestViewController *)self _createIconViewWithIcon:v4];
}

- (void)_setupTitleLabel
{
  uint64_t v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  id v4 = [(AKParentalApprovalRequestViewController *)self _localizedTitleString];
  id v6 = [(AKAuthorizationSubPaneInfoLabel *)v3 initWithString:v4];

  [(AKAuthorizationSubPaneInfoLabel *)v6 setInfoLabelType:1];
  id v5 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v5 addSubPane:v6];
}

- (void)_setupMessageLabel
{
  uint64_t v3 = [AKAuthorizationSubPaneInfoLabel alloc];
  id v4 = [(AKParentalApprovalRequestViewController *)self _localizedDescriptionLabelString];
  id v5 = [(AKAuthorizationSubPaneInfoLabel *)v3 initWithString:v4];
  messageLabel = self->_messageLabel;
  self->_messageLabel = v5;

  [(AKAuthorizationSubPaneInfoLabel *)self->_messageLabel setInfoLabelType:0];
  id v7 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  [v7 addSubPane:self->_messageLabel];
}

- (void)_addSendButtonToContext:(id)a3
{
  id v4 = a3;
  id v5 = [AKAuthorizationContinueButton alloc];
  v18 = -[AKAuthorizationContinueButton initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(AKAuthorizationContinueButton *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(AKParentalApprovalRequestViewController *)self _localizedButtonTitleString];
  [(AKAuthorizationButton *)v18 setButtonText:v6];

  [(AKAuthorizationButton *)v18 addTarget:self action:sel__sendButtonSelected_];
  id v7 = [v4 stackView];
  +[AKAuthorizationPaneMetrics continueButtonTopSpacing];
  double v9 = v8;
  v10 = [v4 stackView];
  v11 = [v10 arrangedSubviews];
  v12 = [v11 lastObject];
  [v7 setCustomSpacing:v12 afterView:v9];

  v13 = [v4 stackView];
  [v13 addArrangedSubview:v18];

  v14 = [v4 stackView];
  +[AKAuthorizationPaneMetrics continueButtonBottomSpacing];
  objc_msgSend(v14, "setCustomSpacing:afterView:", v18);

  v15 = [v4 mutableConstraints];

  v16 = [(AKAuthorizationContinueButton *)v18 heightAnchor];
  +[AKAuthorizationPaneMetrics continueButtonHeight];
  v17 = objc_msgSend(v16, "constraintEqualToConstant:");
  [v15 addObject:v17];
}

- (void)_createIconViewWithIcon:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  double v8 = [v7 stackView];
  [v8 addArrangedSubview:v6];

  v33 = self;
  double v9 = [(AKAuthorizationPaneViewController *)self headerPaneContext];
  v10 = [v9 stackView];
  +[AKAuthorizationPaneMetrics iconTopSpacing];
  v34 = v6;
  objc_msgSend(v10, "setCustomSpacing:afterView:", v6);

  uint64_t v11 = [v5 automaskedImage];

  v32 = (void *)v11;
  v12 = [[AKAuthorizationSubPaneImage alloc] initWithImage:v11];
  v13 = [(AKAuthorizationSubPaneImage *)v12 image];
  [v13 size];
  if (v14 == 0.0)
  {
    double v20 = 1.0;
  }
  else
  {
    v15 = [(AKAuthorizationSubPaneImage *)v12 image];
    [v15 size];
    double v17 = v16;
    v18 = [(AKAuthorizationSubPaneImage *)v12 image];
    [v18 size];
    double v20 = v17 / v19;
  }
  v21 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v22 = [v21 heightAnchor];
  +[AKAuthorizationPaneMetrics iconSize];
  v24 = [v22 constraintEqualToConstant:v23];
  v35[0] = v24;
  v25 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v26 = [v25 widthAnchor];
  v27 = [(AKAuthorizationSubPaneImage *)v12 imageView];
  v28 = [v27 heightAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 multiplier:v20];
  v35[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  [(AKAuthorizationSubPaneImage *)v12 setImageViewConstraints:v30];

  v31 = [(AKAuthorizationPaneViewController *)v33 headerPaneContext];
  [v31 addSubPane:v12];

  +[AKAuthorizationPaneMetrics iconBottomSpacing];
  -[AKAuthorizationSubPane setCustomSpacingAfter:](v12, "setCustomSpacingAfter:");
}

- (id)_localizedTitleString
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"APPROVAL_REQUEST_TITLE_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable"];

  return v3;
}

- (id)_localizedDescriptionLabelString
{
  uint64_t v3 = [(AKAuthorizationPresentationContext *)self->_presentationContext localizedAppName];
  uint64_t v4 = [v3 length];
  BOOL requestStatusPending = self->_requestStatusPending;
  if (v4)
  {
    id v6 = NSString;
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v8 = v7;
    if (requestStatusPending) {
      double v9 = @"APPROVAL_REQUEST_PENDING_MESSAGE_FORMAT";
    }
    else {
      double v9 = @"APPROVAL_REQUEST_MESSAGE_FORMAT";
    }
    v12 = [v7 localizedStringForKey:v9 value:&stru_1F1EE8138 table:@"Localizable"];
    v13 = objc_msgSend(v6, "stringWithFormat:", v12, v3);
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v8 = v10;
    if (requestStatusPending) {
      uint64_t v11 = @"APPROVAL_REQUEST_PENDING_MESSAGE";
    }
    else {
      uint64_t v11 = @"APPROVAL_REQUEST_MESSAGE";
    }
    v13 = [v10 localizedStringForKey:v11 value:&stru_1F1EE8138 table:@"Localizable"];
  }

  return v13;
}

- (id)_localizedButtonTitleString
{
  BOOL requestStatusPending = self->_requestStatusPending;
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (requestStatusPending) {
    id v5 = @"APPROVAL_REQUEST_OK_BUTTON";
  }
  else {
    id v5 = @"APPROVAL_REQUEST_BUTTON";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];

  return v6;
}

- (void)_sendButtonSelected:(id)a3
{
  uint64_t v4 = _AKLogSiwa();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AKParentalApprovalRequestViewController _sendButtonSelected:](v4);
  }

  id v5 = [(AKParentalApprovalRequestViewController *)self _userResponse];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke;
  v6[3] = &unk_1E648F2F0;
  v6[4] = self;
  [(AKParentalApprovalRequestViewController *)self _paneDelegate_didRequestAuthorizationWithUserProvidedInformation:v5 completion:v6];
}

void __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_2;
    block[3] = &unk_1E648F2C8;
    block[4] = *(void *)(a1 + 32);
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_3;
    v6[3] = &unk_1E648EF28;
    v6[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAuthorizationError:*(void *)(a1 + 40)];
}

uint64_t __63__AKParentalApprovalRequestViewController__sendButtonSelected___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:error:", 0, 0);
}

- (void)_handleAuthorizationError:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ak_isUserCancelError");
  [(AKParentalApprovalRequestViewController *)self _paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:0 error:v4];
}

- (id)_userResponse
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EFC0]);
  [v2 setRequestParentalPermission:1];

  return v2;
}

- (void)_paneDelegate_authorizationPaneViewControllerDismissWithAuthorization:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 authorizationPaneViewController:self dismissWithAuthorization:v8 error:v6];
  }
}

- (void)_paneDelegate_didRequestAuthorizationWithUserProvidedInformation:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(AKAuthorizationPaneViewController *)self paneDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 authorizationPaneViewController:self didRequestAuthorizationWithUserProvidedInformation:v8 completion:v6];
  }
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
  objc_destroyWeak((id *)&self->_authorizationViewController);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_messageLabel, 0);
}

- (void)_sendButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "User requested parental permission", v1, 2u);
}

@end