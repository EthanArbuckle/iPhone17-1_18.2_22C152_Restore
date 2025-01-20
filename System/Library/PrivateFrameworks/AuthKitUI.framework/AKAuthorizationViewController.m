@interface AKAuthorizationViewController
- (AKAuthorizationNavigationController)navigationController;
- (AKAuthorizationPresentationContext)presentationContext;
- (AKAuthorizationScopeChoices)scopeChoices;
- (AKAuthorizationViewController)init;
- (AKAuthorizationViewController)initWithAuthorizationContext:(id)a3;
- (AKAuthorizationViewController)initWithCoder:(id)a3;
- (AKAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AKAuthorizationViewControllerDelegate)delegate;
- (BOOL)_isFirstTimeAppleIDAuthorization;
- (BOOL)_isManagedAppleID;
- (id)_backBarButtonItem;
- (id)_cancelBarButtonItem;
- (id)_inputPaneViewController;
- (id)_logoBarButtonItem:(id)a3;
- (id)_paneTitleString;
- (id)_parentalApprovalRequestViewController;
- (id)firstTimeViewController;
- (int64_t)modalPresentationStyle;
- (void)_backButtonSelected:(id)a3;
- (void)_cancelButtonSelected:(id)a3;
- (void)_delegate_authorizationViewControllerDidCompleteWithAuthorization:(id)a3 error:(id)a4;
- (void)_performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:(id)a3;
- (void)_presentAuthorizationViewController;
- (void)_presentContainerViewControllerWith:(id)a3;
- (void)_presentFirstTimeViewController;
- (void)_presentInputPaneViewControllerReplacing:(BOOL)a3;
- (void)authorizationContainerViewControllerDidDismiss:(id)a3;
- (void)authorizationPaneViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5;
- (void)authorizationPaneViewController:(id)a3 didRequestIconWithCompletion:(id)a4;
- (void)authorizationPaneViewController:(id)a3 dismissWithAuthorization:(id)a4 error:(id)a5;
- (void)authorizationPaneViewController:(id)a3 pushEditScope:(id)a4 presentationContext:(id)a5 options:(id)a6;
- (void)performAppleIDAuthorizationForPaneViewController:(id)a3;
- (void)performPasswordAuthenticationForPaneViewController:(id)a3;
- (void)presentAuthenticationChoiceUIWithCompletion:(id)a3;
- (void)presentConfirmPaneViewController;
- (void)presentInputPaneViewController;
- (void)setDelegate:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKAuthorizationViewController

- (AKAuthorizationViewController)init
{
  return 0;
}

- (AKAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (AKAuthorizationViewController)initWithAuthorizationContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKAuthorizationViewController;
  v6 = [(AKAuthorizationViewController *)&v16 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
    v8 = [v5 credentialRequestContext];
    v9 = [v8 authorizationRequest];
    v10 = [v9 requestedScopes];

    v11 = [AKAuthorizationScopeChoices alloc];
    v12 = [v5 userInformation];
    uint64_t v13 = [(AKAuthorizationScopeChoices *)v11 initWithScopes:v10 userInformation:v12];
    scopeChoices = v7->_scopeChoices;
    v7->_scopeChoices = (AKAuthorizationScopeChoices *)v13;
  }
  return v7;
}

- (AKAuthorizationViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationViewController;
  return [(AKAuthorizationViewController *)&v4 initWithCoder:a3];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AKAuthorizationViewController;
  [(AKAuthorizationViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationViewController;
  [(AKAuthorizationViewController *)&v4 viewWillAppear:a3];
  if (!self->_navigationController) {
    [(AKAuthorizationViewController *)self _presentAuthorizationViewController];
  }
}

- (void)presentConfirmPaneViewController
{
  if ([(AKAuthorizationViewController *)self _isFirstTimeAppleIDAuthorization])
  {
    [(AKAuthorizationViewController *)self _presentFirstTimeViewController];
  }
  else
  {
    [(AKAuthorizationViewController *)self _presentInputPaneViewControllerReplacing:0];
  }
}

- (void)_presentFirstTimeViewController
{
  id v9 = [(AKAuthorizationViewController *)self firstTimeViewController];
  v3 = [(AKAuthorizationViewController *)self navigationController];
  objc_super v4 = [v3 viewControllers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [v9 navigationItem];
    v7 = [(AKAuthorizationViewController *)self _backBarButtonItem];
    [v6 setLeftBarButtonItem:v7];
  }
  v8 = [(AKAuthorizationViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (void)_presentAuthorizationViewController
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "No UI was shown to the user because there is no credential request!", v1, 2u);
}

- (void)presentAuthenticationChoiceUIWithCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F42728];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v6 = [v5 localizedStringForKey:@"ACCOUNT_FORK_ALERT_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v8 = [v7 localizedStringForKey:@"ACCOUNT_FORK_ALERT_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable"];
  id v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v10 = (void *)MEMORY[0x1E4F42720];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v12 = [v11 localizedStringForKey:@"ACCOUNT_FORK_ALERT_BUTTON_CREATE" value:&stru_1F1EE8138 table:@"Localizable"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke;
  v30[3] = &unk_1E648F320;
  id v13 = v3;
  id v31 = v13;
  v14 = [v10 actionWithTitle:v12 style:0 handler:v30];
  [v9 addAction:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  objc_super v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v17 = [v16 localizedStringForKey:@"ACCOUNT_FORK_ALERT_BUTTON_KEYCHAIN" value:&stru_1F1EE8138 table:@"Localizable"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_51;
  v28[3] = &unk_1E648F320;
  id v18 = v13;
  id v29 = v18;
  v19 = [v15 actionWithTitle:v17 style:0 handler:v28];
  [v9 addAction:v19];

  v20 = (void *)MEMORY[0x1E4F42720];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v22 = [v21 localizedStringForKey:@"ALERT_DEFAULT_CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_55;
  v26[3] = &unk_1E648F320;
  id v27 = v18;
  id v23 = v18;
  v24 = [v20 actionWithTitle:v22 style:0 handler:v26];
  [v9 addAction:v24];

  [(AKAuthorizationViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke(uint64_t a1)
{
  objc_super v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_51(uint64_t a1)
{
  objc_super v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_51_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_55(uint64_t a1)
{
  objc_super v2 = _AKLogSiwa();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_55_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (void)_presentContainerViewControllerWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[AKAuthorizationNavigationController alloc] initWithRootViewController:v4];
  navigationController = self->_navigationController;
  self->_navigationController = v5;

  v7 = [AKAuthorizationContainerViewController alloc];
  v8 = [(AKAuthorizationViewController *)self navigationController];
  v10 = [(AKAuthorizationContainerViewController *)v7 initWithRootViewController:v8 authorizationContext:self->_presentationContext];

  [(AKAuthorizationContainerViewController *)v10 setDelegate:self];
  [(AKAuthorizationContainerViewController *)v10 setPaneDelegate:self];
  [v4 sizeToFitPaneContent];

  id v9 = [(AKAuthorizationViewController *)self navigationController];
  [v9 setDelegate:v10];

  [(AKAuthorizationViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)_parentalApprovalRequestViewController
{
  uint64_t v3 = [AKParentalApprovalRequestViewController alloc];
  id v4 = [(AKAuthorizationViewController *)self presentationContext];
  uint64_t v5 = [(AKParentalApprovalRequestViewController *)v3 initWithPresentationContext:v4];

  [(AKParentalApprovalRequestViewController *)v5 setAuthorizationViewController:self];
  v6 = [(AKParentalApprovalRequestViewController *)v5 navigationItem];
  v7 = [(AKAuthorizationViewController *)self _paneTitleString];
  v8 = [(AKAuthorizationViewController *)self _logoBarButtonItem:v7];
  [v6 setLeftBarButtonItem:v8];

  id v9 = [(AKParentalApprovalRequestViewController *)v5 navigationItem];
  v10 = [(AKAuthorizationViewController *)self _cancelBarButtonItem];
  [v9 setRightBarButtonItem:v10];

  return v5;
}

- (id)firstTimeViewController
{
  uint64_t v3 = objc_alloc_init(AKAuthorizationFirstTimePaneViewController);
  [(AKAuthorizationFirstTimePaneViewController *)v3 setAuthorizationViewController:self];
  id v4 = [(AKAuthorizationFirstTimePaneViewController *)v3 navigationItem];
  uint64_t v5 = [(AKAuthorizationViewController *)self _cancelBarButtonItem];
  [v4 setRightBarButtonItem:v5];

  return v3;
}

- (id)_inputPaneViewController
{
  uint64_t v3 = [AKAuthorizationInputPaneViewController alloc];
  id v4 = [(AKAuthorizationViewController *)self presentationContext];
  uint64_t v5 = [(AKAuthorizationViewController *)self scopeChoices];
  v6 = [(AKAuthorizationInputPaneViewController *)v3 initWithPresentationContext:v4 scopeChoices:v5];

  [(AKAuthorizationInputPaneViewController *)v6 setAuthorizationViewController:self];
  v7 = [(AKAuthorizationInputPaneViewController *)v6 navigationItem];
  v8 = [(AKAuthorizationViewController *)self _paneTitleString];
  id v9 = [(AKAuthorizationViewController *)self _logoBarButtonItem:v8];
  [v7 setLeftBarButtonItem:v9];

  v10 = [(AKAuthorizationInputPaneViewController *)v6 navigationItem];
  v11 = [(AKAuthorizationViewController *)self _cancelBarButtonItem];
  [v10 setRightBarButtonItem:v11];

  return v6;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (id)_logoBarButtonItem:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F42B38];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0 weight:*MEMORY[0x1E4F43930]];
  [v6 setFont:v7];

  [v6 setText:v4];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v6];

  return v8;
}

- (id)_cancelBarButtonItem
{
  uint64_t v3 = [MEMORY[0x1E4F4F020] sharedManager];
  int v4 = [v3 isLisbonAvailable];

  if (v4)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__AKAuthorizationViewController__cancelBarButtonItem__block_invoke;
    v16[3] = &unk_1E648F348;
    v16[4] = self;
    id v5 = [MEMORY[0x1E4F426E8] actionWithHandler:v16];
    v6 = (void *)MEMORY[0x1E4F427E0];
    v7 = +[AKAuthorizationAppearance dismissButtonConfiguration];
    v8 = [v6 buttonWithConfiguration:v7 primaryAction:v5];

    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
    [v8 setAccessibilityLabel:v10];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v8];
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
    v11 = (void *)[v12 initWithTitle:v14 style:0 target:self action:sel__cancelButtonSelected_];
  }

  return v11;
}

uint64_t __53__AKAuthorizationViewController__cancelBarButtonItem__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cancelButtonSelected:a2];
}

- (id)_backBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  int v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_BACK" value:&stru_1F1EE8138 table:@"Localizable"];
  v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__backButtonSelected_];

  return v6;
}

- (id)_paneTitleString
{
  objc_super v2 = [(AKAuthorizationViewController *)self presentationContext];
  id v3 = [v2 credentialRequestContext];
  int v4 = [v3 _isFirstPartyLogin];

  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (v4)
  {
    if (![@"AUTHORIZATION_VIEWCONTROLLER_TITLE" containsString:@"REBRAND"])
    {
      v8 = [MEMORY[0x1E4F4F020] sharedManager];
      if ([v8 isAABrandingEnabled])
      {
        id v9 = [@"AUTHORIZATION_VIEWCONTROLLER_TITLE" stringByAppendingString:@"_REBRAND"];
        v7 = [v5 localizedStringForKey:v9 value:&stru_1F1EE8138 table:@"Localizable"];
      }
      else
      {
        v7 = [v5 localizedStringForKey:@"AUTHORIZATION_VIEWCONTROLLER_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
      }

      goto LABEL_10;
    }
    v6 = @"AUTHORIZATION_VIEWCONTROLLER_TITLE";
  }
  else
  {
    v6 = @"AUTHORIZATION_VIEWCONTROLLER_TITLE_MODERN";
  }
  v7 = [v5 localizedStringForKey:v6 value:&stru_1F1EE8138 table:@"Localizable"];
LABEL_10:

  return v7;
}

- (void)authorizationContainerViewControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AKAuthorizationViewController *)self _delegate_authorizationViewControllerDidCompleteWithAuthorization:0 error:v4];
}

- (void)presentInputPaneViewController
{
  if ([(AKAuthorizationViewController *)self _isFirstTimeAppleIDAuthorization])
  {
    [(AKAuthorizationViewController *)self _presentFirstTimeViewController];
  }
  else
  {
    [(AKAuthorizationViewController *)self _presentInputPaneViewControllerReplacing:0];
  }
}

- (BOOL)_isFirstTimeAppleIDAuthorization
{
  id v3 = [MEMORY[0x1E4F4F000] sharedConfiguration];
  uint64_t v4 = [v3 shouldAlwaysShowWelcome];

  if (v4 != 1)
  {
    v6 = [(AKAuthorizationViewController *)self presentationContext];
    v7 = [v6 userInformation];
    v8 = [v7 hasUsedAuthorization];
    if (![v8 BOOLValue])
    {
      id v9 = [(AKAuthorizationViewController *)self presentationContext];
      v10 = [v9 credentialRequestContext];
      if (([v10 _isFirstPartyLogin] & 1) == 0)
      {
        id v12 = [(AKAuthorizationViewController *)self presentationContext];
        char v13 = [v12 hasShownFirstTimeAlready];

        if (v13) {
          return 0;
        }
        v6 = [(AKAuthorizationViewController *)self presentationContext];
        BOOL v5 = 1;
        [v6 setHasShownFirstTimeAlready:1];
        goto LABEL_7;
      }
    }
    BOOL v5 = 0;
LABEL_7:

    return v5;
  }
  return 1;
}

- (BOOL)_isManagedAppleID
{
  objc_super v2 = [(AKAuthorizationViewController *)self presentationContext];
  id v3 = [v2 userInformation];
  char v4 = [v3 isManagedAppleID];

  return v4;
}

- (void)_presentInputPaneViewControllerReplacing:(BOOL)a3
{
  int v3 = a3;
  BOOL v5 = [(AKAuthorizationViewController *)self navigationController];

  if (v5)
  {
    id v17 = [(AKAuthorizationViewController *)self _inputPaneViewController];
    [v17 setPaneDelegate:self];
    v6 = [(AKAuthorizationViewController *)self navigationController];
    v7 = [v6 viewControllers];
    uint64_t v8 = [v7 count];

    if (v8 != v3)
    {
      id v9 = [v17 navigationItem];
      v10 = [(AKAuthorizationViewController *)self _backBarButtonItem];
      [v9 setLeftBarButtonItem:v10];
    }
    v11 = [(AKAuthorizationViewController *)self navigationController];
    id v12 = v11;
    if (v3)
    {
      char v13 = [v11 viewControllers];
      v14 = (void *)[v13 mutableCopy];

      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "count") - 1, v17);
      v15 = [(AKAuthorizationViewController *)self navigationController];
      objc_super v16 = (void *)[v14 copy];
      [v15 setViewControllers:v16 animated:1];

      id v12 = v14;
    }
    else
    {
      [v11 pushViewController:v17 animated:1];
    }
  }
}

- (void)_cancelButtonSelected:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AKAuthorizationViewController *)self _delegate_authorizationViewControllerDidCompleteWithAuthorization:0 error:v4];
}

- (void)_backButtonSelected:(id)a3
{
  id v4 = [(AKAuthorizationViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)_delegate_authorizationViewControllerDidCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v7 = [(AKAuthorizationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 authorizationViewController:self didCompleteWithAuthorization:v8 error:v6];
  }
}

- (void)authorizationPaneViewController:(id)a3 dismissWithAuthorization:(id)a4 error:(id)a5
{
}

- (void)authorizationPaneViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(AKAuthorizationViewController *)self delegate];
  [v9 authorizationViewController:self didRequestAuthorizationWithUserProvidedInformation:v8 completion:v7];
}

- (void)authorizationPaneViewController:(id)a3 didRequestIconWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(AKAuthorizationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(AKAuthorizationViewController *)self presentationContext];
    id v8 = [v7 credentialRequestContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke;
    v10[3] = &unk_1E648F370;
    id v11 = v5;
    [v6 authorizationViewController:self didRequestIconForRequestContext:v8 completion:v10];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v9);
  }
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSiwa();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_2();
    }

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authorizationPaneViewController:(id)a3 pushEditScope:(id)a4 presentationContext:(id)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [(AKAuthorizationViewController *)self navigationController];
  char v13 = [v12 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = v13;
    if ([v10 isEqualToString:*MEMORY[0x1E4F4EE20]])
    {
      v15 = [v11 objectForKey:@"shouldClear"];
      uint64_t v16 = [v15 BOOLValue];

      [v14 setEditingName:1 shouldClear:v16 animated:1];
    }
    else if ([v10 isEqualToString:*MEMORY[0x1E4F4EE18]])
    {
      id v17 = objc_alloc_init(AKAuthorizationEmailEditPaneViewController);
      id v18 = [(AKAuthorizationViewController *)self presentationContext];
      v19 = [v18 localizedAppName];
      [(AKAuthorizationEmailEditPaneViewController *)v17 setApplicationName:v19];

      [(AKAuthorizationPaneViewController *)v17 setEditableDataSources:v9];
      [(AKAuthorizationPaneViewController *)v17 sizeToFitPaneContent];
      v20 = [(AKAuthorizationViewController *)self navigationController];
      [v20 pushViewController:v17 animated:1];
    }
    else
    {
      v21 = _AKLogSiwa();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[AKAuthorizationViewController authorizationPaneViewController:pushEditScope:presentationContext:options:]((uint64_t)v10, v21);
      }
    }
  }
  else
  {
    v14 = _AKLogSiwa();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AKAuthorizationViewController authorizationPaneViewController:pushEditScope:presentationContext:options:]();
    }
  }
}

- (void)performAppleIDAuthorizationForPaneViewController:(id)a3
{
  id v4 = [(AKAuthorizationViewController *)self navigationController];
  id v5 = [v4 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(AKAuthorizationViewController *)self _presentInputPaneViewControllerReplacing:1];
  }
  else
  {
    [(AKAuthorizationViewController *)self presentInputPaneViewController];
  }
}

- (void)_performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  id v6 = [(AKAuthorizationViewController *)self presentationContext];
  id v7 = [v6 userInformation];
  id v8 = [v7 accountName];
  [(AKAppleIDAuthenticationInAppContext *)v5 setUsername:v8];

  [(AKAppleIDAuthenticationInAppContext *)v5 setIsUsernameEditable:0];
  id v9 = [(AKAuthorizationViewController *)self presentationContext];
  id v10 = [v9 credentialRequestContext];
  id v11 = [v10 authorizationRequest];
  id v12 = [v11 altDSID];
  [(AKAppleIDAuthenticationInAppContext *)v5 setAltDSID:v12];

  [(AKAppleIDAuthenticationInAppContext *)v5 setAuthenticationMode:2];
  [(AKAppleIDAuthenticationInAppContext *)v5 setAuthenticationType:3];
  [(AKAppleIDAuthenticationInAppContext *)v5 setPresentingViewController:v4];
  id v13 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke;
  v15[3] = &unk_1E648F398;
  id v16 = v4;
  id v14 = v4;
  [v13 authenticateWithContext:v5 completion:v15];
}

void __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke_2;
  block[3] = &unk_1E648F278;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __111__AKAuthorizationViewController__performPasswordAuthenticationForFederatedManagedAccountForPaneViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) passwordAuthenticationCompletedWithResults:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)performPasswordAuthenticationForPaneViewController:(id)a3
{
  id v10 = a3;
  if ([(AKAuthorizationViewController *)self _isManagedAppleID]
    && ([(AKAuthorizationViewController *)self presentationContext],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 userInformation],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 authMode],
        v5,
        v4,
        v6 == 2))
  {
    [(AKAuthorizationViewController *)self _performPasswordAuthenticationForFederatedManagedAccountForPaneViewController:v10];
  }
  else
  {
    id v7 = objc_alloc_init(AKAuthorizationPasswordAuthenticationViewController);
    id v8 = [(AKAuthorizationViewController *)self presentationContext];
    [(AKAuthorizationPasswordAuthenticationViewController *)v7 setPresentationContext:v8];

    [(AKAuthorizationPasswordAuthenticationViewController *)v7 setDelegate:v10];
    [(AKAuthorizationPaneViewController *)v7 sizeToFitPaneContent];
    id v9 = [(AKAuthorizationViewController *)self navigationController];
    [v9 pushViewController:v7 animated:1];
  }
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (AKAuthorizationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKAuthorizationNavigationController)navigationController
{
  return self->_navigationController;
}

- (AKAuthorizationScopeChoices)scopeChoices
{
  return self->_scopeChoices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeChoices, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User picked create", v2, v3, v4, v5, v6);
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_51_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User picked keychain", v2, v3, v4, v5, v6);
}

void __77__AKAuthorizationViewController_presentAuthenticationChoiceUIWithCompletion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User picked cancel", v2, v3, v4, v5, v6);
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch icon - %@", (uint8_t *)&v2, 0xCu);
}

void __94__AKAuthorizationViewController_authorizationPaneViewController_didRequestIconWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Successfully fetched icon.", v2, v3, v4, v5, v6);
}

- (void)authorizationPaneViewController:(uint64_t)a1 pushEditScope:(NSObject *)a2 presentationContext:options:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Unsupported scope %@.", (uint8_t *)&v2, 0xCu);
}

- (void)authorizationPaneViewController:pushEditScope:presentationContext:options:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Expected AKAuthorizationInputPaneViewController as top controller.", v1, 2u);
}

@end