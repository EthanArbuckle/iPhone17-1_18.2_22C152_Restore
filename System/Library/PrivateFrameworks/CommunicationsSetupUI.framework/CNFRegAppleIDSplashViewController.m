@interface CNFRegAppleIDSplashViewController
+ (BOOL)shouldShowSplashViewForService:(id)a3 inProgressRegisteringNonPhoneAccount:(id *)a4;
+ (id)_inProgressRegisteringNonPhoneAccountForService:(id)a3;
- (BOOL)showBusyUIOnAppearance;
- (CNFRegController)regController;
- (id)_iCloudUserName;
- (id)_imService;
- (id)navigationItem;
- (id)serviceDescription;
- (id)serviceFooter;
- (id)serviceIcon;
- (id)serviceName;
- (int64_t)serviceType;
- (void)_cnfSignInWithUsername:(id)a3 password:(id)a4;
- (void)_completeIfAccountIsAlreadyRegistered;
- (void)_handleRegistarResults:(BOOL)a3 alertController:(id)a4;
- (void)_showSettingsController;
- (void)continueRegisteringAccount:(id)a3;
- (void)dealloc;
- (void)handleAuthCompletionWithResults:(id)a3;
- (void)setRegController:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setShowBusyUIOnAppearance:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginAuthWithContext:(id)a3;
@end

@implementation CNFRegAppleIDSplashViewController

+ (BOOL)shouldShowSplashViewForService:(id)a3 inProgressRegisteringNonPhoneAccount:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F4A1F0] sharedInstance];
  v7 = [v6 currentSIMsWithError:0];
  if ([v7 count])
  {
    v8 = [MEMORY[0x263F4A1F0] sharedInstance];
    int v9 = [v8 supportsIdentification] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  v10 = [MEMORY[0x263F3BB18] sharedInstance];
  char v11 = [v10 supportsSMS];

  v12 = [MEMORY[0x263F4A520] sharedInstance];
  v13 = [v12 accountsForService:v5];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v31 = v11;
    char v32 = v9;
    v33 = a4;
    id v34 = v5;
    int v17 = 0;
    unsigned __int8 v18 = 0;
    char v19 = 0;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        BOOL v23 = [v22 accountType] == 2;
        uint64_t v24 = [v22 registrationStatus];
        BOOL v25 = v24 == 5;
        if (v24 == 1) {
          v17 |= [v22 CNFRegIsSignedOut] ^ 1;
        }
        v19 |= v23;
        v18 |= v25;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v16);
    char v26 = v19 | v17;
    a4 = v33;
    id v5 = v34;
    char v11 = v31;
    LOBYTE(v9) = v32;
  }
  else
  {
    unsigned __int8 v18 = 0;
    char v26 = 0;
  }

  v27 = +[CNFRegAppleIDSplashViewController _inProgressRegisteringNonPhoneAccountForService:v5];
  v28 = v27;
  if (a4) {
    *a4 = v27;
  }
  if (v26 & 1 | v18 & (v28 == 0)) {
    char v29 = 0;
  }
  else {
    char v29 = v9 | v11 ^ 1;
  }

  return v29;
}

+ (id)_inProgressRegisteringNonPhoneAccountForService:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F4A520] sharedInstance];
  id v5 = [v4 accountsForService:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "accountType", (void)v15);
        uint64_t v12 = [v10 registrationStatus];
        if (v12 != 5 && v11 != 2 && (unint64_t)(v12 - 2) <= 2)
        {
          id v7 = v10;
          goto LABEL_14;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
LABEL_14:

  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAppleIDSplashViewController;
  [(PSAppleIDSplashViewController *)&v4 dealloc];
}

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNFRegAppleIDSplashViewController;
  id v4 = a3;
  [(CNFRegAppleIDSplashViewController *)&v7 setSpecifier:v4];
  id v5 = objc_msgSend(v4, "propertyForKey:", @"ft-serviceType", v7.receiver, v7.super_class);

  -[CNFRegAppleIDSplashViewController setServiceType:](self, "setServiceType:", [v5 integerValue]);
  CNFRegSetStringTableForServiceType([(CNFRegAppleIDSplashViewController *)self serviceType]);
  id v6 = +[CNFRegController controllerForServiceType:[(CNFRegAppleIDSplashViewController *)self serviceType]];
  [(CNFRegAppleIDSplashViewController *)self setRegController:v6];
}

- (id)serviceName
{
  int64_t v2 = [(CNFRegAppleIDSplashViewController *)self serviceType];
  switch(v2)
  {
    case 2:
      goto LABEL_4;
    case 1:
      id v3 = CommunicationsSetupUIBundle();
      id v4 = CNFRegStringTableName();
      id v5 = @"MESSAGES";
      goto LABEL_6;
    case 0:
LABEL_4:
      id v3 = CommunicationsSetupUIBundle();
      id v4 = CNFRegStringTableName();
      id v5 = @"FACETIME";
LABEL_6:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_26D05D4F8 table:v4];

      goto LABEL_8;
  }
  id v6 = &stru_26D05D4F8;
LABEL_8:
  return v6;
}

- (id)serviceDescription
{
  int v2 = _os_feature_enabled_impl();
  id v3 = CommunicationsSetupUIBundle();
  id v4 = CNFRegStringTableName();
  if (v2) {
    id v5 = @"FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT";
  }
  else {
    id v5 = @"FACETIME_SIGNIN_SETTINGS_BLURB";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26D05D4F8 table:v4];

  return v6;
}

- (id)serviceFooter
{
  int v2 = CommunicationsSetupUIBundle();
  id v3 = CNFRegStringTableName();
  id v4 = [v2 localizedStringForKey:@"FACETIME_SWITCH_STATUS_DEFAULT" value:&stru_26D05D4F8 table:v3];

  return v4;
}

- (id)serviceIcon
{
  unint64_t v2 = [(CNFRegAppleIDSplashViewController *)self serviceType];
  if (v2 > 2)
  {
    id v6 = 0;
  }
  else
  {
    id v3 = off_2644F1358[v2];
    id v4 = (void *)MEMORY[0x263F827E8];
    id v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 scale];
    id v6 = objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);
  }
  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegAppleIDSplashViewController;
  [(PSAppleIDSplashViewController *)&v4 viewDidLoad];
  id v3 = [(CNFRegAppleIDSplashViewController *)self serviceName];
  [(CNFRegAppleIDSplashViewController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegAppleIDSplashViewController;
  [(PSAppleIDSplashViewController *)&v8 viewWillAppear:a3];
  if ([(CNFRegAppleIDSplashViewController *)self showBusyUIOnAppearance]) {
    [(PSAppleIDSplashViewController *)self showBusyUI];
  }
  [(CNFRegAppleIDSplashViewController *)self setShowBusyUIOnAppearance:0];
  objc_super v4 = [(CNFRegAppleIDSplashViewController *)self _iCloudUserName];
  if ([v4 length]) {
    [(PSAppleIDSplashViewController *)self setUsername:v4];
  }
  id v5 = objc_opt_class();
  id v6 = [(CNFRegAppleIDSplashViewController *)self _imService];
  objc_super v7 = [v5 _inProgressRegisteringNonPhoneAccountForService:v6];

  if (v7) {
    [(CNFRegAppleIDSplashViewController *)self continueRegisteringAccount:v7];
  }
}

- (id)navigationItem
{
  uint64_t v3 = [(CNFRegAppleIDSplashViewController *)self parentViewController];
  if (v3
    && (objc_super v4 = (void *)v3,
        [(CNFRegAppleIDSplashViewController *)self parentViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    objc_super v7 = [(CNFRegAppleIDSplashViewController *)self parentViewController];
    objc_super v8 = [v7 navigationItem];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNFRegAppleIDSplashViewController;
    objc_super v8 = [(CNFRegAppleIDSplashViewController *)&v10 navigationItem];
  }
  return v8;
}

- (void)willBeginAuthWithContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "willBeginAuthWithContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v11 = v4;
    IMLogString();
  }
  id v6 = [(CNFRegAppleIDSplashViewController *)self regController];
  BOOL v7 = [v6 serviceType] == 0;

  if (v7)
  {
    uint64_t v10 = 5;
    goto LABEL_10;
  }
  objc_super v8 = [(CNFRegAppleIDSplashViewController *)self regController];
  BOOL v9 = [v8 serviceType] == 1;

  if (v9)
  {
    uint64_t v10 = 4;
LABEL_10:
    [v4 setServiceType:v10];
  }
  v12.receiver = self;
  v12.super_class = (Class)CNFRegAppleIDSplashViewController;
  [(PSAppleIDSplashViewController *)&v12 willBeginAuthWithContext:v4];
}

- (void)continueRegisteringAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSAppleIDSplashViewController *)self showBusyUI];
  [(CNFRegAppleIDSplashViewController *)self setShowBusyUIOnAppearance:1];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  id v14 = [[CNFAccountRegistrar alloc] initWithServiceType:[(CNFRegAppleIDSplashViewController *)self serviceType] presentationViewController:self];
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Continuing registration of account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v7 = v4;
    IMLogString();
  }
  id v6 = (void *)v10[5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CNFRegAppleIDSplashViewController_continueRegisteringAccount___block_invoke;
  v8[3] = &unk_2644F1338;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v6, "continueRegistrationForAccount:completionBlock:", v4, v8, v7);
  _Block_object_dispose(&v9, 8);
}

uint64_t __64__CNFRegAppleIDSplashViewController_continueRegisteringAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _handleRegistarResults:a2 alertController:a3];
  id v4 = *(void **)(a1 + 32);
  return [v4 setShowBusyUIOnAppearance:0];
}

- (id)_imService
{
  int64_t v2 = [(CNFRegAppleIDSplashViewController *)self serviceType];
  switch(v2)
  {
    case 2:
      goto LABEL_4;
    case 1:
      uint64_t v3 = [MEMORY[0x263F4A610] iMessageService];
      break;
    case 0:
LABEL_4:
      uint64_t v3 = [MEMORY[0x263F4A610] facetimeService];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (void)_showSettingsController
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"CNFSettingsViewControllerNeedsContainerUpdate" object:0];
}

- (void)_completeIfAccountIsAlreadyRegistered
{
  uint64_t v3 = [(CNFRegAppleIDSplashViewController *)self _imService];
  BOOL v4 = +[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:v3 inProgressRegisteringNonPhoneAccount:0];

  if (!v4)
  {
    [(CNFRegAppleIDSplashViewController *)self _showSettingsController];
  }
}

- (void)handleAuthCompletionWithResults:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegAppleIDSplashViewController;
  [(PSAppleIDSplashViewController *)&v11 handleAuthCompletionWithResults:v4];
  id v5 = [v4 objectForKey:*MEMORY[0x263F29010]];
  uint64_t v6 = [v4 objectForKey:*MEMORY[0x263F28FF0]];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "AuthKit callback complete. Signing in.", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    [(PSAppleIDSplashViewController *)self showBusyUI];
    [(CNFRegAppleIDSplashViewController *)self _cnfSignInWithUsername:v5 password:v7];
  }
}

- (void)_handleRegistarResults:(BOOL)a3 alertController:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  [(PSAppleIDSplashViewController *)self hideBusyUI];
  if (v4)
  {
    [(CNFRegAppleIDSplashViewController *)self _showSettingsController];
  }
  else
  {
    uint64_t v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    [(CNFRegAppleIDSplashViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  uint64_t v6 = v7;
LABEL_6:
}

- (void)_cnfSignInWithUsername:(id)a3 password:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNFRegAppleIDSplashViewController *)self _imService];
  if (v8)
  {
    *(void *)uint64_t v15 = 0;
    id v16 = v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__5;
    char v19 = __Block_byref_object_dispose__5;
    uint64_t v20 = [[CNFAccountRegistrar alloc] initWithServiceType:[(CNFRegAppleIDSplashViewController *)self serviceType] presentationViewController:self];
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Registering account: %@ (service: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v12 = v6;
      v13 = v8;
      IMLogString();
    }
    uint64_t v10 = (void *)*((void *)v16 + 5);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__CNFRegAppleIDSplashViewController__cnfSignInWithUsername_password___block_invoke;
    v14[3] = &unk_2644F1338;
    v14[4] = self;
    v14[5] = v15;
    objc_msgSend(v10, "registerAccountWithUsername:password:service:completionBlock:", v6, v7, v8, v14, v12, v13);
    _Block_object_dispose(v15, 8);
  }
  else
  {
    objc_super v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't generate a service to register with!", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

uint64_t __69__CNFRegAppleIDSplashViewController__cnfSignInWithUsername_password___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleRegistarResults:a2 alertController:a3];
}

- (id)_iCloudUserName
{
  id v2 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  BOOL v4 = [v3 username];

  return v4;
}

- (CNFRegController)regController
{
  return (CNFRegController *)objc_getProperty(self, a2, 1552, 1);
}

- (void)setRegController:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)showBusyUIOnAppearance
{
  return self->_showBusyUIOnAppearance;
}

- (void)setShowBusyUIOnAppearance:(BOOL)a3
{
  self->_showBusyUIOnAppearance = a3;
}

- (void).cxx_destruct
{
}

@end