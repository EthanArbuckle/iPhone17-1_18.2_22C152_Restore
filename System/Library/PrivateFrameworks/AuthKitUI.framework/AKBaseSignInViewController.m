@interface AKBaseSignInViewController
- (AKAppleIDAuthenticationController)authenticationController;
- (AKAppleIDAuthenticationInAppContext)context;
- (AKSignInViewControllerDelegate)delegate;
- (BOOL)_canBeginAuthenticationWithOption:(unint64_t)a3;
- (BOOL)_isAccountModificationRestricted;
- (BOOL)_isSignInAllowed;
- (BOOL)isAuthInProgress;
- (BOOL)usesDarkMode;
- (id)_initWithAuthController:(id)a3;
- (id)_initWithNibName:(id)a3 bundle:(id)a4;
- (id)_serverFriendlyUsername:(id)a3;
- (void)_authenticateWithContext:(id)a3;
- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3 withUsername:(id)a4 password:(id)a5;
- (void)_beginProximityAdvertisement;
- (void)_endProximityAdvertisement;
- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4;
- (void)_setPasswordFieldHiddenIfNeeded;
- (void)dealloc;
- (void)setAuthInProgress:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUsesDarkMode:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AKBaseSignInViewController

- (id)_initWithAuthController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKBaseSignInViewController;
  v6 = [(AKBaseSignInViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authenticationController, a3);
  }

  return v7;
}

- (id)_initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AKBaseSignInViewController;
  return [(AKBaseSignInViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "AKBaseSignInViewController deallocated", v1, 2u);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKBaseSignInViewController;
  [(AKBaseSignInViewController *)&v4 viewDidAppear:a3];
  [(AKBaseSignInViewController *)self _setPasswordFieldHiddenIfNeeded];
  [(AKBaseSignInViewController *)self _beginProximityAdvertisement];
}

- (void)_beginProximityAdvertisement
{
  if ([MEMORY[0x1E4F4F020] isProxForAuthkitEnabled])
  {
    v3 = objc_alloc_init(AKAppleIDProximityAuthenticationContext);
    proximityContext = self->_proximityContext;
    self->_proximityContext = v3;

    [(AKAppleIDAuthenticationInAppContext *)self->_proximityContext setPresentingViewController:self];
    [(AKAppleIDProximityAuthenticationContext *)self->_proximityContext setAuthenticationType:2];
    objc_super v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to begin proximity authentication", buf, 2u);
    }

    v6 = [(AKBaseSignInViewController *)self authenticationController];
    v7 = self->_proximityContext;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke;
    v8[3] = &unk_1E648F398;
    v8[4] = self;
    [v6 authenticateWithContext:v7 completion:v8];
  }
}

void __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6 && ([v6 code] == -13002 || objc_msgSend(v7, "code") == -13003))
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _provideDelegateWithAuthResults:v5 error:v7];
  }
}

- (void)_endProximityAdvertisement
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to end proximity authentication", buf, 2u);
  }

  if (self->_proximityContext)
  {
    if ([MEMORY[0x1E4F4F020] isProxForAuthkitEnabled])
    {
      objc_super v4 = [(AKBaseSignInViewController *)self authenticationController];
      proximityContext = self->_proximityContext;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __56__AKBaseSignInViewController__endProximityAdvertisement__block_invoke;
      v6[3] = &unk_1E648F398;
      v6[4] = self;
      [v4 endProximityAuthenticationForContext:proximityContext completion:v6];
    }
  }
}

void __56__AKBaseSignInViewController__endProximityAdvertisement__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 984);
  *(void *)(v1 + 984) = 0;
}

- (void)_setPasswordFieldHiddenIfNeeded
{
  id v4 = [(AKBaseSignInViewController *)self context];
  if ([v4 _requiresPasswordInput])
  {
    v3 = [(AKBaseSignInViewController *)self presentedViewController];

    if (!v3)
    {
      [(AKBaseSignInViewController *)self _setPasswordFieldHidden:0 animated:0];
    }
  }
  else
  {
  }
}

- (AKAppleIDAuthenticationController)authenticationController
{
  authenticationController = self->_authenticationController;
  if (!authenticationController)
  {
    id v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E4F4EF68]);
    id v5 = self->_authenticationController;
    self->_authenticationController = v4;

    authenticationController = self->_authenticationController;
  }

  return authenticationController;
}

- (BOOL)_isSignInAllowed
{
  v3 = [(AKBaseSignInViewController *)self context];
  if ([v3 isEphemeral]) {
    LOBYTE(v4) = 1;
  }
  else {
    BOOL v4 = ![(AKBaseSignInViewController *)self _isAccountModificationRestricted];
  }

  return v4;
}

- (BOOL)_isAccountModificationRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]];

  return v3 == 2;
}

- (BOOL)_canBeginAuthenticationWithOption:(unint64_t)a3
{
  if ([(AKBaseSignInViewController *)self isAuthInProgress])
  {
    id v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AKBaseSignInViewController _canBeginAuthenticationWithOption:](v5);
    }

    return 0;
  }
  if (a3 - 2 < 2) {
    return ![(AKBaseSignInViewController *)self _isAccountModificationRestricted];
  }
  if (a3 != 1) {
    return 0;
  }

  return [(AKBaseSignInViewController *)self _isSignInAllowed];
}

- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3 withUsername:(id)a4 password:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(AKBaseSignInViewController *)self _canBeginAuthenticationWithOption:a3])
  {
    [(AKBaseSignInViewController *)self setAuthInProgress:1];
    v10 = [(AKBaseSignInViewController *)self delegate];
    if (!v10) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"you must set a delegate before the button is pressed"];
    }
    [(AKBaseSignInViewController *)self startAnimating];
    v11 = [(AKBaseSignInViewController *)self context];
    v12 = [(AKBaseSignInViewController *)self _serverFriendlyUsername:v8];
    [v11 setUsername:v12];
    if (v9) {
      [v11 _setPassword:v9];
    }
    [v11 setNeedsCredentialRecovery:a3 == 2];
    [v11 setNeedsNewAppleID:a3 == 3];
    [v11 setAuthenticationType:2];
    if (objc_opt_respondsToSelector())
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __93__AKBaseSignInViewController__beginAuthenticationIfPossibleWithOption_withUsername_password___block_invoke;
      v13[3] = &unk_1E648F2C8;
      v13[4] = self;
      id v14 = v11;
      [v10 signInViewController:self willPerformAuthenticationWithContext:v14 completionHandler:v13];
    }
    else
    {
      [(AKBaseSignInViewController *)self _authenticateWithContext:v11];
    }
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:](v10);
    }
  }
}

uint64_t __93__AKBaseSignInViewController__beginAuthenticationIfPossibleWithOption_withUsername_password___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticateWithContext:*(void *)(a1 + 40)];
}

- (void)_authenticateWithContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(AKBaseSignInViewController *)self _endProximityAdvertisement];
  id v5 = [(AKBaseSignInViewController *)self authenticationController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AKBaseSignInViewController__authenticateWithContext___block_invoke;
  v6[3] = &unk_1E648F560;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 authenticateWithContext:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__AKBaseSignInViewController__authenticateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _provideDelegateWithAuthResults:v7 error:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__AKBaseSignInViewController__authenticateWithContext___block_invoke_2;
  v9[3] = &unk_1E648F2C8;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __55__AKBaseSignInViewController__authenticateWithContext___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthInProgress:0];
  v2 = *(void **)(a1 + 40);

  return [v2 stopAnimating];
}

- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(AKBaseSignInViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)[v9 mutableCopy];
    [v7 signInViewController:self didAuthenticateWithResults:v8 error:v6];
  }
}

- (id)_serverFriendlyUsername:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"@"])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = objc_opt_new();
    id v4 = [v5 normalizedFormatFor:v3];
  }

  return v4;
}

- (BOOL)usesDarkMode
{
  return self->_usesDarkMode;
}

- (void)setUsesDarkMode:(BOOL)a3
{
  self->_usesDarkMode = a3;
}

- (AKAppleIDAuthenticationInAppContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AKSignInViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKSignInViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAuthInProgress
{
  return self->_authInProgress;
}

- (void)setAuthInProgress:(BOOL)a3
{
  self->_authInProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_proximityContext, 0);

  objc_storeStrong((id *)&self->_authenticationController, 0);
}

void __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "AKInlineSignInViewController - attempt to broadcast for proximity failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_canBeginAuthenticationWithOption:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Authentication is already in progress.", v1, 2u);
}

- (void)_beginAuthenticationIfPossibleWithOption:(os_log_t)log withUsername:password:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Authentication not possible due to a restriction MCFeatureAccountModificationAllowed.", v1, 2u);
}

@end