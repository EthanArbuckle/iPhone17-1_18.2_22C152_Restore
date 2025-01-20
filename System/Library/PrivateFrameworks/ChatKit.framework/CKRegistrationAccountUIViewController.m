@interface CKRegistrationAccountUIViewController
- (AAUISignInViewController)authViewController;
- (CGSize)preferredContentSize;
- (id)_account;
- (id)_accountRegistrar;
- (id)authenticationContext;
- (id)completionBlock;
- (void)_processAuthenticationResults:(id)a3 authCompletion:(id)a4;
- (void)_registerAccountWithUsername:(id)a3 password:(id)a4 authCompletion:(id)a5;
- (void)setAuthViewController:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4;
- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CKRegistrationAccountUIViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)CKRegistrationAccountUIViewController;
  [(CKRegistrationAccountUIViewController *)&v16 viewDidLoad];
  v3 = (AAUISignInViewController *)objc_alloc_init(MEMORY[0x1E4F4C078]);
  authViewController = self->_authViewController;
  self->_authViewController = v3;

  v5 = [(CKRegistrationAccountUIViewController *)self _account];
  v6 = [v5 username];
  [(AAUISignInViewController *)self->_authViewController setUsername:v6];

  [(AAUISignInViewController *)self->_authViewController setShowServiceIcons:0];
  [(AAUISignInViewController *)self->_authViewController setTableViewStyle:2];
  v7 = self->_authViewController;
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 signInAppIconImage];
  [(AAUISignInViewController *)v7 setHeaderImage:v9];

  v10 = CKFrameworkBundle();
  v11 = [v10 localizedStringForKey:@"IMESSAGE_REGISTRATION_BLURB_NO_NEWLINE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(AAUISignInViewController *)self->_authViewController setMessageLabel:v11];

  [(AAUISignInViewController *)self->_authViewController setPrivacyLinkIdentifiers:&unk_1EDF15020];
  v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [v12 signInTintColor];
  [(AAUISignInViewController *)self->_authViewController setTintColor:v13];

  [(AAUISignInViewController *)self->_authViewController setDelegate:self];
  [(CKRegistrationAccountUIViewController *)self addChildViewController:self->_authViewController];
  v14 = [(CKRegistrationAccountUIViewController *)self view];
  v15 = [(AAUISignInViewController *)self->_authViewController view];
  [v14 addSubview:v15];

  [(AAUISignInViewController *)self->_authViewController didMoveToParentViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKRegistrationAccountUIViewController;
  [(CKRegistrationAccountUIViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(AAUISignInViewController *)self->_authViewController view];
  v4 = [(CKRegistrationAccountUIViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (CGSize)preferredContentSize
{
  [(AAUISignInViewController *)self->_authViewController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)authenticationContext
{
  id v3 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"AKAppleIDAuthenticationInAppContext", @"AuthKitUI"));
  [v3 setServiceType:4];
  v4 = CKFrameworkBundle();
  objc_super v5 = [v4 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v3 setTitle:v5];

  [v3 setPresentingViewController:self];
  [v3 setShouldOfferSecurityUpgrade:0];
  [v3 setShouldUpdatePersistentServiceTokens:1];
  [v3 setAuthenticationType:2];

  return v3;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "didCompleteWithAuthenticationResults", v8, 2u);
    }
  }
}

- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
}

- (id)_account
{
  id v2 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"ACAccountStore", @"Accounts"));
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (id)_accountRegistrar
{
  id v2 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"CNFAccountRegistrar", @"CommunicationsSetupUI")), "initWithServiceType:presentationViewController:", 1, self);

  return v2;
}

- (void)_registerAccountWithUsername:(id)a3 password:(id)a4 authCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Registering", buf, 2u);
    }
  }
  v12 = [(CKRegistrationAccountUIViewController *)self _accountRegistrar];
  v13 = [MEMORY[0x1E4F6BDC0] iMessageService];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke;
  v15[3] = &unk_1E5620D00;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v12 registerAccountWithUsername:v8 password:v9 service:v13 completionBlock:v15];
}

void __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke_2;
  v8[3] = &unk_1E5620CD8;
  char v11 = a2;
  id v6 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  v8[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  if (*(unsigned char *)(a1 + 56))
  {
    v2();
    id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 976) + 16);
    return v3();
  }
  else
  {
    v2();
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_processAuthenticationResults:(id)a3 authCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (!_processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey)
  {
    id v8 = (void **)MEMORY[0x192FBA870]("AKAuthenticationUsernameKey", @"AuthKit");
    if (v8) {
      id v9 = *v8;
    }
    else {
      id v9 = 0;
    }
    objc_storeStrong((id *)&_processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey, v9);
  }
  if (!_processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey)
  {
    id v10 = (void **)MEMORY[0x192FBA870]("AKAuthenticationPasswordKey", @"AuthKit");
    if (v10) {
      char v11 = *v10;
    }
    else {
      char v11 = 0;
    }
    objc_storeStrong((id *)&_processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey, v11);
  }
  v12 = [v6 objectForKey:_processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey];
  v13 = [v6 objectForKey:_processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey];
  int v14 = IMOSLoggingEnabled();
  if (v12 && v13)
  {
    if (v14)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "AAUISignInViewController results had username+password", buf, 2u);
      }
    }
    [(CKRegistrationAccountUIViewController *)self _registerAccountWithUsername:v12 password:v13 authCompletion:v7];
  }
  else
  {
    if (v14)
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "AAUISignInViewController handler: Missing either username or password", v17, 2u);
      }
    }
    v7[2](v7, 0);
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (AAUISignInViewController)authViewController
{
  return self->_authViewController;
}

- (void)setAuthViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authViewController, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end