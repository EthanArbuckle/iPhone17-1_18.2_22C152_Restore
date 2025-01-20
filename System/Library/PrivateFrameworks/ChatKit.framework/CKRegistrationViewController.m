@interface CKRegistrationViewController
+ (BOOL)_refreshAccountKeyCDPSyncingOrWaitingForUser;
+ (BOOL)_shouldShowAuthKitSignIn;
+ (BOOL)shouldShowRegistration;
+ (id)_inProgressRegisteringNonPhoneAccount;
- (AKTapToSignInViewController)akSignInVC;
- (BOOL)canBecomeFirstResponder;
- (CKRegistrationViewController)init;
- (OBPrivacyLinkController)privacyLinkController;
- (id)accountRegistrar;
- (id)completionBlock;
- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4;
- (void)dealloc;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)setAkSignInVC:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setErrorPresentationViewController:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)updateInsetsForKeyboardFrame:(CGRect)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKRegistrationViewController

+ (BOOL)shouldShowRegistration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[CKRegistrationViewController _shouldShowAuthKitSignIn];
  v3 = +[CKRegistrationViewController _inProgressRegisteringNonPhoneAccount];

  BOOL v4 = +[CKRegistrationViewController _refreshAccountKeyCDPSyncingOrWaitingForUser];
  BOOL v5 = v4;
  if (v3) {
    int v6 = 1;
  }
  else {
    int v6 = v2;
  }
  int v7 = v6 & !v4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = @"NO";
      if (v7) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      if (v2) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      int v14 = 138413058;
      v15 = v10;
      if (v3) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      if (v5) {
        v9 = @"YES";
      }
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "shouldShowRegistration: %@, shouldShowAuthKitSignIn: %@, inProgressRegisteringNonPhoneAccount: %@, refreshAccountKeyCDPSyncingOrWaitingForUser: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  return v7;
}

+ (BOOL)_refreshAccountKeyCDPSyncingOrWaitingForUser
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  v3 = [MEMORY[0x1E4F6BDC0] iMessageService];
  BOOL v4 = [v2 bestAccountForService:v3];

  int v5 = [v4 registrationFailureReason];
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = @"NO";
      if (v5 == 29) {
        v8 = @"YES";
      }
      else {
        v8 = @"NO";
      }
      if (v5 == 28) {
        int v7 = @"YES";
      }
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "refresh account key CDPSyncing: %@, CDPWaitingForUser: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return (v5 & 0xFFFFFFFE) == 28;
}

+ (BOOL)_shouldShowAuthKitSignIn
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  v3 = [MEMORY[0x1E4F6BDB8] iMessageService];
  BOOL v4 = [v2 accountsForService:v3];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  char v6 = 0;
  char v7 = 0;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v7 |= objc_msgSend(v11, "accountType", (void)v16) == 2;
        v6 |= [v11 registrationStatus] == 5;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v8);
  }

  if (IMOSLoggingEnabled())
  {
    __int16 v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = @"NO";
      if (v7) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      __int16 v22 = 2112;
      if (v6) {
        v13 = @"YES";
      }
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "hasPhoneNumberAccount: %@, hasRegisteredAccount: %@, all accounts: %@", buf, 0x20u);
    }
  }
  return ((v7 | v6) ^ 1) & 1;
}

+ (id)_inProgressRegisteringNonPhoneAccount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  BOOL v4 = [MEMORY[0x1E4F6BDB8] iMessageService];
  id v5 = [v3 accountsForService:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 accountType];
        uint64_t v12 = [v10 registrationStatus];
        if (v12 != 5 && v11 != 2 && (unint64_t)(v12 - 2) <= 2)
        {
          id v7 = v10;
          goto LABEL_14;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
LABEL_14:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_inProgressRegisteringNonPhoneAccount_onceToken != -1) {
    dispatch_once(&_inProgressRegisteringNonPhoneAccount_onceToken, block);
  }

  return v7;
}

void __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

id __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _inProgressRegisteringNonPhoneAccount];
}

- (CKRegistrationViewController)init
{
  v20.receiver = self;
  v20.super_class = (Class)CKRegistrationViewController;
  dispatch_time_t v2 = [(CKRegistrationViewController *)&v20 init];
  if (v2)
  {
    v3 = [CKRegistrationView alloc];
    BOOL v4 = -[CKRegistrationView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v5 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(CKRegistrationView *)v4 setBackgroundColor:v5];

    [(CKRegistrationView *)v4 setAccessibilityIdentifier:@"MadridRegistrationView"];
    [(CKRegistrationViewController *)v2 setView:v4];
    id v6 = (AKTapToSignInViewController *)objc_alloc_init((Class)MEMORY[0x192FBA860](@"AKTapToSignInViewController", @"AuthKitUI"));
    akSignInVC = v2->_akSignInVC;
    v2->_akSignInVC = v6;

    [(AKTapToSignInViewController *)v2->_akSignInVC setUsesDarkMode:0];
    [(AKTapToSignInViewController *)v2->_akSignInVC setDelegate:v2];
    id v8 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"AKAppleIDAuthenticationInAppContext", @"AuthKitUI"));
    [v8 setServiceType:4];
    [v8 setPresentingViewController:v2];
    id v9 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"ACAccountStore", @"Accounts"));
    int v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    uint64_t v11 = [v10 username];
    if ([v11 length]) {
      [v8 setUsername:v11];
    }
    [(AKTapToSignInViewController *)v2->_akSignInVC setContext:v8];
    uint64_t v12 = [(AKTapToSignInViewController *)v2->_akSignInVC view];
    [(CKRegistrationView *)v4 setAuthKitSignInView:v12];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
    [v13 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
    [v13 addObserver:v2 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
    uint64_t v14 = [MEMORY[0x1E4F83AD0] linkWithBundleIdentifier:@"com.apple.onboarding.messages"];
    privacyLinkController = v2->_privacyLinkController;
    v2->_privacyLinkController = (OBPrivacyLinkController *)v14;

    long long v16 = +[CKUIBehavior sharedBehaviors];
    long long v17 = [v16 signInTintColor];

    if (v17) {
      [(OBPrivacyLinkController *)v2->_privacyLinkController setCustomTintColor:v17];
    }
    [(CKRegistrationViewController *)v2 addChildViewController:v2->_privacyLinkController];
    long long v18 = [(OBPrivacyLinkController *)v2->_privacyLinkController view];
    [(CKRegistrationView *)v4 setPrivacyLinkView:v18];

    [(OBPrivacyLinkController *)v2->_privacyLinkController didMoveToParentViewController:v2];
    [(CKRegistrationViewController *)v2 setModalInPresentation:1];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKRegistrationViewController;
  [(CKRegistrationViewController *)&v4 dealloc];
}

- (id)accountRegistrar
{
  if (accountRegistrar_onceToken != -1) {
    dispatch_once(&accountRegistrar_onceToken, &__block_literal_global_13);
  }
  v3 = (void *)[objc_alloc((Class)accountRegistrar_accountRegistrarClass) initWithServiceType:1 presentationViewController:self];

  return v3;
}

uint64_t __48__CKRegistrationViewController_accountRegistrar__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"CNFAccountRegistrar", @"CommunicationsSetupUI");
  accountRegistrar_accountRegistrarClass = result;
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CKRegistrationViewController;
  [(CKRegistrationViewController *)&v3 viewDidLoad];
  [(CKRegistrationViewController *)self becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[CKRegistrationViewController _inProgressRegisteringNonPhoneAccount];
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__CKRegistrationViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = [(CKRegistrationViewController *)self accountRegistrar];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CKRegistrationViewController_viewWillAppear___block_invoke_2;
    v8[3] = &unk_1E5621BF0;
    v8[4] = self;
    [v6 continueRegistrationForAccount:v5 completionBlock:v8];
  }
  v7.receiver = self;
  v7.super_class = (Class)CKRegistrationViewController;
  [(CKRegistrationViewController *)&v7 viewWillAppear:v3];
}

void __47__CKRegistrationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:1];
}

uint64_t __47__CKRegistrationViewController_viewWillAppear___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleRegistrarCompletion:a2 errorAlertController:a3];
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 rectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CKRegistrationViewController updateInsetsForKeyboardFrame:](self, "updateInsetsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)keyboardDidShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v5 rectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CKRegistrationViewController updateInsetsForKeyboardFrame:](self, "updateInsetsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)updateInsetsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)MEMORY[0x1E4F42D90];
  double v9 = [(CKRegistrationViewController *)self view];
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  long long v18 = [(CKRegistrationViewController *)self view];
  [v18 bounds];
  v29.origin.double x = v19;
  v29.origin.double y = v20;
  v29.size.double width = v21;
  v29.size.double height = v22;
  v27.origin.double x = v11;
  v27.origin.double y = v13;
  v27.size.double width = v15;
  v27.size.double height = v17;
  CGRect v28 = CGRectIntersection(v27, v29);
  double v23 = v28.size.height;

  __int16 v24 = [(CKRegistrationViewController *)self view];
  objc_msgSend(v24, "setContentInset:", 0.0, 0.0, v23, 0.0);

  id v25 = [(CKRegistrationViewController *)self view];
  objc_msgSend(v25, "setScrollIndicatorInsets:", 0.0, 0.0, v23, 0.0);
}

- (void)keyboardWillHide:(id)a3
{
  objc_super v4 = [(CKRegistrationViewController *)self view];
  objc_msgSend(v4, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

  id v5 = [(CKRegistrationViewController *)self view];
  objc_msgSend(v5, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, 0.0);
}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    CGFloat v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "AKTapToSignInViewController callback with error: %@", buf, 0xCu);
    }
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v10;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Could not authenticate: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CGFloat v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "AKTapToSignInViewController obtained results", buf, 2u);
      }
    }
    if (!tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey)
    {
      double v14 = (void **)MEMORY[0x192FBA870]("AKAuthenticationUsernameKey", @"AuthKit");
      if (v14) {
        CGFloat v15 = *v14;
      }
      else {
        CGFloat v15 = 0;
      }
      objc_storeStrong((id *)&tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey, v15);
    }
    if (!tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey)
    {
      double v16 = (void **)MEMORY[0x192FBA870]("AKAuthenticationPasswordKey", @"AuthKit");
      if (v16) {
        CGFloat v17 = *v16;
      }
      else {
        CGFloat v17 = 0;
      }
      objc_storeStrong((id *)&tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey, v17);
    }
    long long v18 = [v9 objectForKey:tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey];
    uint64_t v19 = [v9 objectForKey:tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey];
    CGFloat v20 = (void *)v19;
    if (v18 && v19)
    {
      if (IMOSLoggingEnabled())
      {
        CGFloat v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "AKTapToSignInViewController results had username+password", buf, 2u);
        }
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_96;
      v28[3] = &unk_1E5620C40;
      v28[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v28);
      if (IMOSLoggingEnabled())
      {
        CGFloat v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Registering", buf, 2u);
        }
      }
      double v23 = [(CKRegistrationViewController *)self accountRegistrar];
      __int16 v24 = [MEMORY[0x1E4F6BDC0] iMessageService];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_97;
      v27[3] = &unk_1E5621BF0;
      v27[4] = self;
      [v23 registerAccountWithUsername:v18 password:v20 service:v24 completionBlock:v27];
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_2;
      v26[3] = &unk_1E5620C40;
      v26[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v26);
      if (IMOSLoggingEnabled())
      {
        id v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Authentication handler: Missing either username or password", buf, 2u);
        }
      }
    }
  }
}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:0];
}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_96(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:1];
}

uint64_t __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_97(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleRegistrarCompletion:a2 errorAlertController:a3];
}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:0];
}

- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Handling registration callback", buf, 2u);
    }
  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Success! Calling completion block", buf, 2u);
      }
    }
    id v9 = [(CKRegistrationViewController *)self completionBlock];

    if (v9)
    {
      id v10 = [(CKRegistrationViewController *)self completionBlock];
      v10[2](v10, 1);
    }
  }
  else if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CGFloat v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failure. showing error alert", buf, 2u);
      }
    }
    [(CKRegistrationViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CKRegistrationViewController__handleRegistrarCompletion_errorAlertController___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__CKRegistrationViewController__handleRegistrarCompletion_errorAlertController___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setSigningIn:0];
}

- (void)setErrorPresentationViewController:(id)a3
{
  akSignInVC = self->_akSignInVC;
  id v4 = a3;
  id v5 = [(AKTapToSignInViewController *)akSignInVC context];
  [v5 setPresentingViewController:v4];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (AKTapToSignInViewController)akSignInVC
{
  return self->_akSignInVC;
}

- (void)setAkSignInVC:(id)a3
{
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_akSignInVC, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end