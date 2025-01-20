@interface AAUISignInController
- (AAUICDPSignInDelegate)cdpDelegate;
- (AAUIServiceSignInController)serviceController;
- (AAUISignInController)initWithCoder:(id)a3;
- (AAUISignInController)initWithNibName:(id)a3 bundle:(id)a4;
- (AIDAServiceOwnerProtocol)_serviceOwnersManager;
- (AKURLBag)akURLBag;
- (BOOL)_shouldForceOperation;
- (BOOL)allowSkip;
- (BOOL)canEditUsername;
- (BOOL)offerSplitAccountSignIn;
- (BOOL)shouldDisableAccountCreation;
- (BOOL)shouldShowSystemBackButton;
- (BOOL)showsChildSignIn;
- (NSArray)privacyLinkIdentifiers;
- (NSArray)serviceTypes;
- (NSDictionary)_authenticationResults;
- (NSString)serviceType;
- (NSString)username;
- (unint64_t)ampServiceType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_commonInit;
- (void)_configureSignInProperties;
- (void)_delegate_signInControllerDidSelectChildSignIn:(id)a3;
- (void)_delegate_signInControllerDidSkip:(id)a3;
- (void)_setAuthenticationResults:(id)a3;
- (void)_setServiceOwnersManager:(id)a3;
- (void)_setShouldForceOperation:(BOOL)a3;
- (void)prepareInViewController:(id)a3 completion:(id)a4;
- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)serviceSignInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4;
- (void)serviceSignInControllerDidCancel:(id)a3;
- (void)setAKURLBag:(id)a3;
- (void)setAllowSkip:(BOOL)a3;
- (void)setAmpServiceType:(unint64_t)a3;
- (void)setCanEditUsername:(BOOL)a3;
- (void)setCdpDelegate:(id)a3;
- (void)setOfferSplitAccountSignIn:(BOOL)a3;
- (void)setPrivacyLinkIdentifiers:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setShouldDisableAccountCreation:(BOOL)a3;
- (void)setShouldShowSystemBackButton:(BOOL)a3;
- (void)setShowsChildSignIn:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)viewDidLoad;
@end

@implementation AAUISignInController

- (AAUISignInController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISignInController;
  v4 = [(AAUISignInController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(AAUISignInController *)v4 _commonInit];
  }
  return v5;
}

- (AAUISignInController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUISignInController;
  v3 = [(AAUISignInController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AAUISignInController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(AAUISignInController *)self setCanEditUsername:1];
  self->_aidaOperationUIPermissions = 1;
  v3 = [MEMORY[0x263F29270] sharedBag];
  akURLBag = self->_akURLBag;
  self->_akURLBag = v3;

  privacyLinkIdentifiers = self->_privacyLinkIdentifiers;
  self->_privacyLinkIdentifiers = (NSArray *)&unk_26BD70C70;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AAUISignInController;
  [(AAUISignInController *)&v4 viewDidLoad];
  v3 = [(AAUISignInController *)self presentationController];
  [v3 setDelegate:self];

  [(AAUISignInController *)self setModalInPresentation:1];
  [(AAUISignInController *)self _configureSignInProperties];
  [(AAUIServiceSignInController *)self->_serviceController loadViewControllerForPresentation];
}

- (void)_configureSignInProperties
{
  v21[1] = *MEMORY[0x263EF8340];
  if (!self->_signInConfiguration)
  {
    v3 = objc_alloc_init(AAUIServiceSignInConfiguration);
    signInConfiguration = self->_signInConfiguration;
    self->_signInConfiguration = v3;

    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setAuthenticationResults:self->_authenticationResults];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setAidaOperationUIPermissions:self->_aidaOperationUIPermissions];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setNavigationController:self];
    v5 = [(AAUISignInController *)self username];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setUsername:v5];

    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setCanEditUsername:[(AAUISignInController *)self canEditUsername]];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setAllowSkip:[(AAUISignInController *)self allowSkip]];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setShouldShowSystemBackButton:[(AAUISignInController *)self shouldShowSystemBackButton]];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setShouldForceOperation:[(AAUISignInController *)self _shouldForceOperation]];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setOfferiCloudAMSSplitSignIn:[(AAUISignInController *)self offerSplitAccountSignIn]];
    objc_super v6 = [(AAUISignInController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(AAUISignInController *)self delegate];
      v9 = [v8 serviceContext];
      v10 = (void *)[v9 copy];
      [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setServiceContext:v10];
    }
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setServiceDelegate:self];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setShouldDisableAccountCreation:[(AAUISignInController *)self shouldDisableAccountCreation]];
    v11 = [(AAUISignInController *)self serviceType];

    if (v11)
    {
      v12 = [(AAUISignInController *)self serviceType];
      v21[0] = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
      [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setServiceTypes:v13];
    }
    else
    {
      v12 = [(AAUISignInController *)self serviceTypes];
      [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setServiceTypes:v12];
    }

    v14 = [(AAUISignInController *)self privacyLinkIdentifiers];
    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setPrivacyLinkIdentifiers:v14];

    [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setShowsChildSignIn:[(AAUISignInController *)self showsChildSignIn]];
    v15 = [(AAUISignInController *)self cdpDelegate];
    if (objc_opt_respondsToSelector()) {
      -[AAUIServiceSignInConfiguration setIsAttemptingBackupRestore:](self->_signInConfiguration, "setIsAttemptingBackupRestore:", [v15 isAttemptingBackupRestore]);
    }
    if (objc_opt_respondsToSelector())
    {
      v16 = [v15 cdpLocalSecret];
      if (v16) {
        [(AAUIServiceSignInConfiguration *)self->_signInConfiguration setLocalSecret:v16];
      }
    }
  }
  serviceController = self->_serviceController;
  if (serviceController)
  {
    [(AAUIServiceSignInController *)serviceController setSignInConfig:self->_signInConfiguration];
  }
  else
  {
    v18 = [[AAUIServiceSignInController alloc] initWithSignInConfiguration:self->_signInConfiguration];
    v19 = self->_serviceController;
    self->_serviceController = v18;
  }
  [(AAUIServiceSignInController *)self->_serviceController setServiceOwnersManager:self->_serviceOwnersManager];
  v20 = [(AAUISignInController *)self akURLBag];
  [(AAUIServiceSignInController *)self->_serviceController setAkURLBag:v20];
}

- (void)serviceSignInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  char v7 = [(AAUISignInController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 signInController:self didCompleteWithSuccess:v5 error:v8];
  }
}

- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  id v6 = a4;
  BOOL v5 = [(AAUISignInController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 signInController:self didCompleteWithOperationsResults:v6];
  }
}

- (void)serviceSignInControllerDidCancel:(id)a3
{
  id v4 = [(AAUISignInController *)self delegate];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (objc_opt_respondsToSelector()) {
    [v4 signInControllerDidCancel:self];
  }
}

- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (a4 == 1)
  {
    [(AAUISignInController *)self _delegate_signInControllerDidSelectChildSignIn:self];
  }
  else if (a4)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AAUISignInController serviceSignInController:didSkipWithReason:](a4, v6);
    }
  }
  else
  {
    [(AAUISignInController *)self _delegate_signInControllerDidSkip:self];
  }
}

- (void)_delegate_signInControllerDidSkip:(id)a3
{
  id v4 = [(AAUISignInController *)self delegate];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (objc_opt_respondsToSelector()) {
    [v4 signInControllerDidSkip:self];
  }
}

- (void)_delegate_signInControllerDidSelectChildSignIn:(id)a3
{
  id v4 = [(AAUISignInController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 signInControllerDidSelectChildSignIn:self];
  }
}

- (void)_setAuthenticationResults:(id)a3
{
}

- (void)_setServiceOwnersManager:(id)a3
{
}

- (void)setAKURLBag:(id)a3
{
}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AAUISignInController *)self _configureSignInProperties];
  [(AAUIServiceSignInController *)self->_serviceController prepareInViewController:v7 completion:v6];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (NSDictionary)_authenticationResults
{
  return self->_authenticationResults;
}

- (AIDAServiceOwnerProtocol)_serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)canEditUsername
{
  return self->_canEditUsername;
}

- (void)setCanEditUsername:(BOOL)a3
{
  self->_canEditUsername = a3;
}

- (BOOL)allowSkip
{
  return self->_allowSkip;
}

- (void)setAllowSkip:(BOOL)a3
{
  self->_allowSkip = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  return self->_shouldShowSystemBackButton;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  self->_shouldShowSystemBackButton = a3;
}

- (AAUICDPSignInDelegate)cdpDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cdpDelegate);
  return (AAUICDPSignInDelegate *)WeakRetained;
}

- (void)setCdpDelegate:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
}

- (BOOL)showsChildSignIn
{
  return self->_showsChildSignIn;
}

- (void)setShowsChildSignIn:(BOOL)a3
{
  self->_showsChildSignIn = a3;
}

- (BOOL)offerSplitAccountSignIn
{
  return self->_offerSplitAccountSignIn;
}

- (void)setOfferSplitAccountSignIn:(BOOL)a3
{
  self->_offerSplitAccountSignIn = a3;
}

- (AKURLBag)akURLBag
{
  return self->_akURLBag;
}

- (AAUIServiceSignInController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (BOOL)_shouldForceOperation
{
  return self->__shouldForceOperation;
}

- (void)_setShouldForceOperation:(BOOL)a3
{
  self->__shouldForceOperation = a3;
}

- (unint64_t)ampServiceType
{
  return self->_ampServiceType;
}

- (void)setAmpServiceType:(unint64_t)a3
{
  self->_ampServiceType = a3;
}

- (BOOL)shouldDisableAccountCreation
{
  return self->_shouldDisableAccountCreation;
}

- (void)setShouldDisableAccountCreation:(BOOL)a3
{
  self->_shouldDisableAccountCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_akURLBag, 0);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_cdpDelegate);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_signInConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
}

- (void)serviceSignInController:(uint64_t)a1 didSkipWithReason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_fault_impl(&dword_209754000, a2, OS_LOG_TYPE_FAULT, "Unhandled skip reason %@", (uint8_t *)&v4, 0xCu);
}

@end