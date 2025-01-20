@interface MCUIAppSignerViewController
- (BOOL)_isTrustPreventedByLockdownMode;
- (BOOL)_showVerifyRowIncludeAlmostUntrustedApps:(BOOL)a3;
- (BOOL)_tableView:(id)a3 isIndexPathValid:(id)a4;
- (BOOL)isFreeDeveloper;
- (BOOL)isNetworkReachable;
- (MCUIAppSigner)appSigner;
- (MCUIAppSignerUninstaller)uninstaller;
- (MCUIAppSignerViewController)initWithAppSigner:(id)a3;
- (MCUIAppSignerViewController)initWithAppSigner:(id)a3 uninstaller:(id)a4;
- (MDMProvisioningProfileTrust)profileTrust;
- (OS_dispatch_group)trustActionGroup;
- (id)_appCellInTableView:(id)a3 atIndexPath:(id)a4;
- (id)_trustCellInTableView:(id)a3 atIndexPath:(id)a4 appCount:(int64_t)a5;
- (id)_verifyCellInTableView:(id)a3 atIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_appSignerWasRemoved;
- (void)_appSignersDidChange;
- (void)_appSignersUpdated:(id)a3;
- (void)_presentAlertWithTitle:(id)a3 message:(id)a4;
- (void)_presentAppRemovalAlert;
- (void)_presentNetworkRequiredAlert;
- (void)_presentTrustFailedAlert;
- (void)_presentVerifyAppAlert;
- (void)_removeAppSignerApps;
- (void)_setup;
- (void)_trust;
- (void)_verify;
- (void)dealloc;
- (void)networkReachabilityChanged:(id)a3;
- (void)setAppSigner:(id)a3;
- (void)setIsNetworkReachable:(BOOL)a3;
- (void)setProfileTrust:(id)a3;
- (void)setTrustActionGroup:(id)a3;
- (void)setUninstaller:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MCUIAppSignerViewController

- (MCUIAppSignerViewController)initWithAppSigner:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(MCUIAppSignerViewController *)self initWithAppSigner:v4 uninstaller:v5];

  return v6;
}

- (MCUIAppSignerViewController)initWithAppSigner:(id)a3 uninstaller:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCUIAppSignerViewController;
  v9 = [(MCUITableViewController *)&v18 initWithStyle:2];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appSigner, a3);
    objc_storeStrong((id *)&v10->_uninstaller, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F73180]);
    v12 = dispatch_get_global_queue(33, 0);
    uint64_t v13 = [v11 initWithValidationQueue:v12];
    profileTrust = v10->_profileTrust;
    v10->_profileTrust = (MDMProvisioningProfileTrust *)v13;

    [(MCUIAppSignerViewController *)v10 _setup];
    v15 = [v7 displayName];
    v16 = [(MCUIAppSignerViewController *)v10 navigationItem];
    [v16 setTitle:v15];
  }
  return v10;
}

- (void)_setup
{
  v3 = (OS_dispatch_group *)dispatch_group_create();
  trustActionGroup = self->_trustActionGroup;
  self->_trustActionGroup = v3;

  v24.receiver = self;
  v24.super_class = (Class)MCUIAppSignerViewController;
  [(MCUITableViewController *)&v24 updateExtendedLayoutIncludesOpaqueBars];
  [(MCUIAppSignerViewController *)self setEdgesForExtendedLayout:15];
  v5 = [(MCUIAppSignerViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"MCUIApplicationCellIdentifier"];

  v6 = [(MCUIAppSignerViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"MCUIApplicationTrustCellIdentifier"];

  v23.receiver = self;
  v23.super_class = (Class)MCUIAppSignerViewController;
  [(MCUITableViewController *)&v23 reloadTableOnContentSizeCategoryChange];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [(MCUIAppSignerViewController *)self appSigner];
  [v7 addObserver:self selector:sel__appSignersUpdated_ name:@"kMCUIAppSignersUpdatedNotification" object:v8];

  v9 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v9 addNetworkReachableObserver:self selector:sel_networkReachabilityChanged_];

  v10 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  self->_isNetworkReachable = [v10 isNetworkReachable];

  objc_initWeak(&location, self);
  id v11 = (const char *)[(id)*MEMORY[0x1E4F5E730] UTF8String];
  v12 = MEMORY[0x1E4F14428];
  id v13 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__MCUIAppSignerViewController__setup__block_invoke;
  handler[3] = &unk_1E6EAD7C0;
  objc_copyWeak(&v21, &location);
  notify_register_dispatch(v11, &_setup_settingsChangedToken, v12, handler);

  v14 = (const char *)[(id)*MEMORY[0x1E4F5E738] UTF8String];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__MCUIAppSignerViewController__setup__block_invoke_2;
  v18[3] = &unk_1E6EAD7C0;
  objc_copyWeak(&v19, &location);
  notify_register_dispatch(v14, &_setup_trustFailedToken, MEMORY[0x1E4F14428], v18);

  v15 = (const char *)[(id)*MEMORY[0x1E4F5E740] UTF8String];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__MCUIAppSignerViewController__setup__block_invoke_3;
  v16[3] = &unk_1E6EAD7C0;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch(v15, (int *)&_setup_verificationOfflineToken, MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __37__MCUIAppSignerViewController__setup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _appSignersDidChange];
    id WeakRetained = v2;
  }
}

void __37__MCUIAppSignerViewController__setup__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentTrustFailedAlert];
    id WeakRetained = v2;
  }
}

void __37__MCUIAppSignerViewController__setup__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentNetworkRequiredAlert];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
  [v3 removeNetworkReachableObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MCUIAppSignerViewController;
  [(MCUITableViewController *)&v5 dealloc];
}

- (void)_appSignersUpdated:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MCUIAppSignerViewController__appSignersUpdated___block_invoke;
  v3[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__MCUIAppSignerViewController__appSignersUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (void)_appSignersDidChange
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MCUIAppSignerViewController *)self appSigner];
  [v3 refreshApplications];

  id v4 = [(MCUIAppSignerViewController *)self appSigner];
  objc_super v5 = [v4 displayName];
  v6 = [(MCUIAppSignerViewController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = [(MCUIAppSignerViewController *)self tableView];
  [v7 reloadData];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10 = @"kMCUIAppSignersUpdatedNotification";
  v11[0] = MEMORY[0x1E4F1CC38];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v8 postNotificationName:@"kMCUIUpdatedNotification" object:self userInfo:v9];
}

- (void)_appSignerWasRemoved
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = @"kMCUIAppSignersUpdatedNotification";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 postNotificationName:@"kMCUIUpdatedNotification" object:self userInfo:v4];

  objc_super v5 = [(MCUIAppSignerViewController *)self navigationController];
  id v6 = (id)[v5 popViewControllerAnimated:1];
}

- (void)networkReachabilityChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F4BDA8]];

  -[MCUIAppSignerViewController setIsNetworkReachable:](self, "setIsNetworkReachable:", [v5 BOOLValue]);
}

- (BOOL)isFreeDeveloper
{
  id v3 = [(MCUIAppSignerViewController *)self appSigner];
  if ([v3 hasUniversalPP])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [(MCUIAppSignerViewController *)self appSigner];
    char v4 = [v5 hasFreePP];
  }
  return v4;
}

- (void)setAppSigner:(id)a3
{
  id v8 = (MCUIAppSigner *)a3;
  if (self->_appSigner != v8)
  {
    objc_storeStrong((id *)&self->_appSigner, a3);
    id v5 = [(MCUIAppSigner *)v8 displayName];
    id v6 = [(MCUIAppSignerViewController *)self navigationItem];
    [v6 setTitle:v5];

    id v7 = [(MCUIAppSignerViewController *)self tableView];
    [v7 reloadData];
  }
}

- (void)_trust
{
  [(UIViewController *)self MCUIShowProgressInNavBar];
  id v3 = MCUILocalizedString(@"TRUSTING_APP_SIGNER_STATUS");
  char v4 = [(MCUIAppSignerViewController *)self navigationItem];
  [v4 setTitle:v3];

  objc_initWeak(&location, self);
  id v5 = [(MCUIAppSignerViewController *)self trustActionGroup];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MCUIAppSignerViewController__trust__block_invoke;
  v6[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v7, &location);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __37__MCUIAppSignerViewController__trust__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained profileTrust];
    id v5 = [v3 appSigner];
    id v6 = [v5 provisioningProfiles];
    id v7 = [v3 appSigner];
    id v8 = [v7 displayName];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MCUIAppSignerViewController__trust__block_invoke_2;
    v9[3] = &unk_1E6EAD810;
    objc_copyWeak(&v10, v1);
    [v4 uiTrustAndVerifyProvisioningProfiles:v6 developer:v8 completion:v9];

    objc_destroyWeak(&v10);
  }
}

void __37__MCUIAppSignerViewController__trust__block_invoke_2(uint64_t a1, void *a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__MCUIAppSignerViewController__trust__block_invoke_3;
  v2[3] = &unk_1E6EAD7E8;
  v3[1] = a2;
  objc_copyWeak(v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(v3);
}

void __37__MCUIAppSignerViewController__trust__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F62AF0]) initWithReason:@"MCUI provisioning profile trust"];
    [v2 setRebootType:1];
    id v3 = [MEMORY[0x1E4F62AF8] sharedService];
    [v3 shutdownWithOptions:v2];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained MCUIHideProgressInNavBarShowBackButton:1];
    [v5 _appSignersDidChange];
    id WeakRetained = v5;
  }
}

- (void)_verify
{
  [(UIViewController *)self MCUIShowProgressInNavBar];
  id v3 = MCUILocalizedString(@"VERIFYING_APPS_STATUS");
  char v4 = [(MCUIAppSignerViewController *)self navigationItem];
  [v4 setTitle:v3];

  objc_initWeak(&location, self);
  id v5 = [(MCUIAppSignerViewController *)self trustActionGroup];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MCUIAppSignerViewController__verify__block_invoke;
  v6[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v7, &location);
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__MCUIAppSignerViewController__verify__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v4 = [WeakRetained appSigner];
    id obj = [v4 provisioningProfiles];

    uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
          v9 = objc_msgSend(v3, "profileTrust", obj);
          id v10 = [v8 uuid];
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __38__MCUIAppSignerViewController__verify__block_invoke_2;
          v12[3] = &unk_1E6EAD810;
          objc_copyWeak(&v13, v1);
          [v9 uiVerifyProvisioningProfileUUID:v10 completion:v12];

          objc_destroyWeak(&v13);
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
}

void __38__MCUIAppSignerViewController__verify__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MCUIAppSignerViewController__verify__block_invoke_3;
  block[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __38__MCUIAppSignerViewController__verify__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained MCUIHideProgressInNavBarShowBackButton:1];
    [v2 _appSignersDidChange];
    id WeakRetained = v2;
  }
}

- (void)_removeAppSignerApps
{
  [(UIViewController *)self MCUIShowProgressInNavBar];
  id v3 = MCUILocalizedString(@"REMOVING_APP_SIGNER_STATUS");
  char v4 = [(MCUIAppSignerViewController *)self navigationItem];
  [v4 setTitle:v3];

  objc_initWeak(&location, self);
  uint64_t v5 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v6 = [(MCUIAppSignerViewController *)self uninstaller];
  uint64_t v7 = [(MCUIAppSignerViewController *)self trustActionGroup];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __51__MCUIAppSignerViewController__removeAppSignerApps__block_invoke;
  v8[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v9, &location);
  +[MCUIAppSignerUninstallerUtilities uninstallAppSigner:v5 withUninstaller:v6 dispatchGroup:v7 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MCUIAppSignerViewController__removeAppSignerApps__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _appSignerWasRemoved];
    id WeakRetained = v2;
  }
}

- (BOOL)_showVerifyRowIncludeAlmostUntrustedApps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v6 = [v5 applications];
  uint64_t v7 = [v6 count];

  id v8 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v9 = [v8 untrustedAppCount];
  BOOL v10 = v9 > 0;
  if (v9 <= 0 && v3)
  {
    id v11 = [(MCUIAppSignerViewController *)self appSigner];
    BOOL v10 = [v11 almostUntrustedAppCount] > 0;
  }
  v12 = [(MCUIAppSignerViewController *)self appSigner];
  int v13 = [v12 isTrusted];
  BOOL v14 = v7 > 0 && v10;
  if (v13) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_isTrustPreventedByLockdownMode
{
  if ([(MCUIAppSignerViewController *)self isFreeDeveloper]) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
  char v4 = [v3 isLockdownModeEnabled];

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char v4 = [(MCUIAppSignerViewController *)self appSigner];
  int v5 = [v4 isTrustable];

  BOOL v6 = [(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1];
  uint64_t v7 = [(MCUIAppSignerViewController *)self appSigner];
  id v8 = [v7 applications];
  uint64_t v9 = [v8 count];

  if (v5) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  int64_t v11 = v10 + v6;
  if (v9 <= 0) {
    return v11;
  }
  else {
    return v11 + 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(MCUIAppSignerViewController *)self appSigner];
  int v7 = [v6 isTrustable];

  BOOL v8 = [(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1];
  uint64_t v9 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v10 = [v9 applications];
  int64_t v11 = [v10 count];

  if ((v7 & v8) != 0) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = v11;
  }
  if (v7 | v8) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v11;
  }
  if (a4 != 1) {
    uint64_t v13 = 0;
  }
  if (a4 != 2) {
    int64_t v12 = v13;
  }
  if (a4 == 3) {
    return v11;
  }
  else {
    return v12;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  BOOL v6 = [(MCUIAppSignerViewController *)self appSigner];
  int v7 = [v6 isTrustable];

  BOOL v8 = [(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1];
  uint64_t v9 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v10 = [v9 applications];
  uint64_t v11 = [v10 count];

  if (v11 < 1) {
    goto LABEL_10;
  }
  BOOL v12 = a4 != 1 || v8;
  if ((v7 | v12) != 1) {
    goto LABEL_11;
  }
  int v13 = !v8;
  if (a4 != 2) {
    int v13 = 0;
  }
  if (a4 == 3 || v13)
  {
LABEL_11:
    BOOL v15 = NSString;
    long long v16 = MCUILocalizedString(@"APPLICATIONS_FROM_APP_SIGNER_%@");
    long long v17 = [(MCUIAppSignerViewController *)self appSigner];
    objc_super v18 = [v17 identity];
    BOOL v14 = objc_msgSend(v15, "stringWithFormat:", v16, v18);
  }
  else
  {
LABEL_10:
    BOOL v14 = 0;
  }
  return v14;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(MCUIAppSignerViewController *)self appSigner];
  int v7 = [v6 isTrusted];

  if (v7)
  {
    BOOL v8 = NSString;
    uint64_t v9 = @"APP_SIGNER_TRUSTED_DESCRIPTION_%@";
  }
  else
  {
    BOOL v10 = [(MCUIAppSignerViewController *)self _isTrustPreventedByLockdownMode];
    BOOL v8 = NSString;
    if (v10) {
      uint64_t v9 = @"APP_SIGNER_LOCKDOWN_MODE_DESCRIPTION_%@";
    }
    else {
      uint64_t v9 = @"APP_SIGNER_NOT_TRUSTED_DESCRIPTION_%@";
    }
  }
  uint64_t v11 = MCUILocalizedStringByDevice(v9);
  BOOL v12 = [(MCUIAppSignerViewController *)self appSigner];
  int v13 = [v12 identity];
  BOOL v14 = objc_msgSend(v8, "stringWithFormat:", v11, v13);

  BOOL v15 = [(MCUIAppSignerViewController *)self appSigner];
  int v16 = [v15 isTrustable];

  if (!a4 && v16)
  {
    id v17 = v14;
    goto LABEL_33;
  }
  if (!a4)
  {
    v22 = [(MCUIAppSignerViewController *)self appSigner];
    uint64_t v23 = [v22 isTrusted];

    objc_super v24 = [MEMORY[0x1E4F74230] sharedConnection];
    if (v23)
    {
      uint64_t v35 = *MEMORY[0x1E4F73F08];
      v25 = &v35;
    }
    else
    {
      v36[0] = *MEMORY[0x1E4F73FD8];
      v25 = v36;
    }
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v27 = [v24 localizedRestrictionSourceDescriptionForFeatures:v26];

    if (v14 && v27)
    {
      id v28 = [NSString stringWithFormat:@"%@\n\n%@", v14, v27];
    }
    else if (v14)
    {
      id v28 = v14;
    }
    else
    {
      if (!v27)
      {
        id v17 = 0;
        goto LABEL_30;
      }
      id v28 = v27;
    }
    id v17 = v28;
LABEL_30:

    goto LABEL_33;
  }
  if (a4 != 1) {
    goto LABEL_25;
  }
  if (![(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:0])
  {
    if ([(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1])
    {
      v29 = [(MCUIAppSignerViewController *)self appSigner];
      uint64_t v30 = [v29 almostUntrustedAppCount];

      v20 = NSString;
      if (v30 < 2) {
        id v21 = @"APP_SIGNER_SINGULAR_APPS_EXPIRING_VERIFICATION_DESCRIPTION_%@";
      }
      else {
        id v21 = @"APP_SIGNER_PLURAL_APPS_EXPIRING_VERIFICATION_DESCRIPTION_%@";
      }
      goto LABEL_32;
    }
LABEL_25:
    id v17 = 0;
    goto LABEL_33;
  }
  objc_super v18 = [(MCUIAppSignerViewController *)self appSigner];
  uint64_t v19 = [v18 untrustedAppCount];

  v20 = NSString;
  if (v19 < 2) {
    id v21 = @"APP_SIGNER_SINGULAR_APPS_NOT_VERIFIED_DESCRIPTION_%@";
  }
  else {
    id v21 = @"APP_SIGNER_PLURAL_APPS_NOT_VERIFIED_DESCRIPTION_%@";
  }
LABEL_32:
  v31 = MCUILocalizedStringByDevice(v21);
  v32 = [(MCUIAppSignerViewController *)self appSigner];
  v33 = [v32 identity];
  objc_msgSend(v20, "stringWithFormat:", v31, v33);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v17;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MCUIAppSignerViewController *)self appSigner];
  unsigned int v9 = [v8 isTrustable];

  BOOL v10 = [(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1];
  uint64_t v11 = [(MCUIAppSignerViewController *)self appSigner];
  BOOL v12 = [v11 applications];
  uint64_t v13 = [v12 count];

  if (v9)
  {
    if ([v7 section] == 1)
    {
      uint64_t v14 = [(MCUIAppSignerViewController *)self _trustCellInTableView:v6 atIndexPath:v7 appCount:v13];
      goto LABEL_18;
    }
    if (v10 && [v7 section] == 2) {
      goto LABEL_9;
    }
  }
  else if (v10 && [v7 section] == 1)
  {
LABEL_9:
    uint64_t v14 = [(MCUIAppSignerViewController *)self _verifyCellInTableView:v6 atIndexPath:v7];
    goto LABEL_18;
  }
  if (v13 >= 1
    && (((v9 | v10) & 1) == 0 && [v7 section] == 1
     || (v10 & v9 & 1) == 0 && [v7 section] == 2
     || [v7 section] == 3))
  {
    uint64_t v14 = [(MCUIAppSignerViewController *)self _appCellInTableView:v6 atIndexPath:v7];
  }
  else
  {
    NSLog(&cfstr_Mcuiappsignerv.isa, v7, v9, v10, v13);
    uint64_t v14 = objc_opt_new();
  }
LABEL_18:
  BOOL v15 = (void *)v14;

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(MCUIAppSignerViewController *)self appSigner];
  int v8 = [v7 isTrustable];

  BOOL v9 = [(MCUIAppSignerViewController *)self _showVerifyRowIncludeAlmostUntrustedApps:1];
  if ([v6 section] == 1 && v8)
  {
    BOOL v10 = [(MCUIAppSignerViewController *)self appSigner];
    int v11 = [v10 isTrusted];

    if (v11)
    {
      [(MCUIAppSignerViewController *)self _presentAppRemovalAlert];
    }
    else
    {
      uint64_t v14 = [(MCUIAppSignerViewController *)self appSigner];
      BOOL v15 = [v14 applications];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        [(MCUIAppSignerViewController *)self _trust];
      }
      else
      {
        id v17 = [(MCUIAppSignerViewController *)self appSigner];
        objc_super v18 = [v17 displayName];
        NSLog(&cfstr_Mcuiappsignerv_0.isa, v18);
      }
    }
  }
  else if (v9)
  {
    int v12 = [v6 section] == 1 ? v8 : 1;
    if (v12 != 1 || ([v6 section] == 2 ? (int v13 = v8) : (int v13 = 0), v13 == 1)) {
      [(MCUIAppSignerViewController *)self _presentVerifyAppAlert];
    }
  }
  [v19 deselectRowAtIndexPath:v6 animated:1];
}

- (BOOL)_tableView:(id)a3 isIndexPathValid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  if (v7 >= [v5 numberOfSections])
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v8 = [v6 row];
    BOOL v9 = v8 < objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v6, "section"));
  }

  return v9;
}

- (id)_trustCellInTableView:(id)a3 atIndexPath:(id)a4 appCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(MCUIAppSignerViewController *)self _tableView:v8 isIndexPathValid:v9])
  {
    BOOL v10 = [v8 dequeueReusableCellWithIdentifier:@"MCUIApplicationTrustCellIdentifier" forIndexPath:v9];

    int v11 = [(MCUIAppSignerViewController *)self appSigner];
    int v12 = [v11 isTrusted];

    if (v12)
    {
      if (a5 >= 2) {
        int v13 = @"DELETE_APP_PLURAL";
      }
      else {
        int v13 = @"DELETE_APP_SINGULAR";
      }
      uint64_t v14 = MCUILocalizedString(v13);
      BOOL v15 = [MEMORY[0x1E4F428B8] DMCProfileRedColor];
      uint64_t v16 = v10;
      id v17 = v14;
      objc_super v18 = v15;
      uint64_t v19 = 1;
    }
    else
    {
      v20 = NSString;
      id v21 = MCUILocalizedString(@"TRUST_APP_DEVELOPER_NAME_%@");
      v22 = [(MCUIAppSignerViewController *)self appSigner];
      uint64_t v23 = [v22 displayName];
      uint64_t v14 = objc_msgSend(v20, "stringWithFormat:", v21, v23);

      BOOL v15 = [MEMORY[0x1E4F428B8] systemBlueColor];
      uint64_t v19 = [(MCUIAppSignerViewController *)self _isTrustPreventedByLockdownMode] ^ 1;
      uint64_t v16 = v10;
      id v17 = v14;
      objc_super v18 = v15;
    }
    [v16 setText:v17 color:v18 enabled:v19];
  }
  else
  {
    NSLog(&cfstr_Mcuiappsignerv_1.isa, v9);

    BOOL v10 = objc_opt_new();
  }

  return v10;
}

- (id)_verifyCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MCUIAppSignerViewController *)self _tableView:v6 isIndexPathValid:v7])
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"MCUIApplicationTrustCellIdentifier" forIndexPath:v7];

    id v9 = [(MCUIAppSignerViewController *)self appSigner];
    if ([v9 untrustedAppCount] >= 2) {
      BOOL v10 = @"VERIFY_APP_PLURAL";
    }
    else {
      BOOL v10 = @"VERIFY_APP_SINGULAR";
    }
    int v11 = MCUILocalizedString(v10);
    int v12 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v8 setText:v11 color:v12 enabled:1];
  }
  else
  {
    NSLog(&cfstr_Mcuiappsignerv_2.isa, v7);

    id v8 = objc_opt_new();
  }

  return v8;
}

- (id)_appCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MCUIAppSignerViewController *)self _tableView:v6 isIndexPathValid:v7])
  {
    id v8 = [(MCUIAppSignerViewController *)self appSigner];
    id v9 = [v8 applications];
    BOOL v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

    int v11 = [v6 dequeueReusableCellWithIdentifier:@"MCUIApplicationCellIdentifier" forIndexPath:v7];
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F5E640]) initWithBundleID:v10 dataSource:0];
    [v11 setApplication:v12];
  }
  else
  {
    NSLog(&cfstr_Mcuiappsignerv_3.isa, v7);
    int v11 = objc_opt_new();
  }

  return v11;
}

- (void)_presentVerifyAppAlert
{
  if ([(MCUIAppSignerViewController *)self isNetworkReachable])
  {
    BOOL v3 = [(MCUIAppSignerViewController *)self appSigner];
    char v4 = [v3 applications];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      id v7 = NSString;
      id v8 = MCUILocalizedString(@"APP_SIGNER_VERIFY_APP_SINGULAR_ALERT_TITLE_%@");
      id v9 = [(MCUIAppSignerViewController *)self appSigner];
      BOOL v10 = [v9 identity];
      int v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);
      int v12 = @"APP_SIGNER_VERIFY_APP_SINGULAR_ALERT";
    }
    else
    {
      if (!v5)
      {
        id v18 = [(MCUIAppSignerViewController *)self appSigner];
        id v6 = [v18 displayName];
        NSLog(&cfstr_AppSignerDoesN.isa, v6);

        return;
      }
      int v13 = NSString;
      id v8 = MCUILocalizedString(@"APP_SIGNER_VERIFY_APP_PLURAL_ALERT_TITLE_%@");
      id v9 = [(MCUIAppSignerViewController *)self appSigner];
      BOOL v10 = [v9 identity];
      int v11 = objc_msgSend(v13, "stringWithFormat:", v8, v10);
      int v12 = @"APP_SIGNER_VERIFY_APP_PLURAL_ALERT";
    }

    uint64_t v14 = MCUILocalizedStringByDevice(v12);
    BOOL v15 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v11 message:v14 preferredStyle:1];
    uint64_t v16 = MCUILocalizedString(@"CANCEL");
    [v15 MCUIAddCancelActionWithTitle:v16];

    objc_initWeak(&location, self);
    id v17 = MCUILocalizedString(@"VERIFY");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__MCUIAppSignerViewController__presentVerifyAppAlert__block_invoke;
    v19[3] = &unk_1E6EAD1F8;
    objc_copyWeak(&v20, &location);
    [v15 MCUIAddActionWithTitle:v17 style:0 completion:v19];

    [v15 MCUIShowFromController:self];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    return;
  }
  [(MCUIAppSignerViewController *)self _presentNetworkRequiredAlert];
}

void __53__MCUIAppSignerViewController__presentVerifyAppAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _verify];
    id WeakRetained = v2;
  }
}

- (void)_presentTrustFailedAlert
{
  BOOL v3 = NSString;
  char v4 = MCUILocalizedString(@"APP_SIGNER_TRUST_FAILED_TITLE_%@");
  uint64_t v5 = [(MCUIAppSignerViewController *)self appSigner];
  id v6 = [v5 identity];
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = NSString;
  id v8 = MCUILocalizedString(@"APP_SIGNER_TRUST_FAILED_MESSAGE_%@");
  id v9 = [(MCUIAppSignerViewController *)self appSigner];
  BOOL v10 = [v9 identity];
  int v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);

  [(MCUIAppSignerViewController *)self _presentAlertWithTitle:v12 message:v11];
}

- (void)_presentNetworkRequiredAlert
{
  BOOL v3 = NSString;
  char v4 = MCUILocalizedString(@"APP_SIGNER_REQUIRES_NETWORK_TITLE_%@");
  uint64_t v5 = [(MCUIAppSignerViewController *)self appSigner];
  id v6 = [v5 identity];
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = NSString;
  id v8 = MCUILocalizedStringByDevice(@"APP_SIGNER_REQUIRES_NETWORK_ALERT_%@");
  id v9 = [(MCUIAppSignerViewController *)self appSigner];
  BOOL v10 = [v9 identity];
  int v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);

  [(MCUIAppSignerViewController *)self _presentAlertWithTitle:v12 message:v11];
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MCUIAppSignerViewController *)self presentedViewController];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v10 message:v6 preferredStyle:1];
    id v9 = MCUILocalizedString(@"DISMISS_ALERT");
    [v8 MCUIAddCancelActionWithTitle:v9];

    [v8 MCUIShowFromController:self];
  }
}

- (void)_presentAppRemovalAlert
{
  BOOL v3 = [(MCUIAppSignerViewController *)self appSigner];
  char v4 = [v3 applications];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5E640]) initWithBundleID:v5 dataSource:0];
    id v7 = [v6 name];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(MCUIAppSignerViewController *)self appSigner];
  id v9 = [v8 applications];
  uint64_t v10 = [v9 count];

  int v11 = NSString;
  if (v10 == 1)
  {
    id v12 = MCUILocalizedString(@"DELETE_APP_WARNING_ONE_%@");
    int v13 = objc_msgSend(v11, "stringWithFormat:", v12, v7);

LABEL_8:
    BOOL v15 = @"DELETE_APP_SINGULAR";
    goto LABEL_9;
  }
  uint64_t v14 = MCUILocalizedString(@"DELETE_APP_WARNING_MULTIPLE_%d_%@");
  int v13 = objc_msgSend(v11, "localizedStringWithFormat:", v14, (v10 - 1), v7);

  if (!v10) {
    goto LABEL_8;
  }
  BOOL v15 = @"DELETE_APP_PLURAL";
LABEL_9:
  uint64_t v16 = MCUILocalizedString(v15);
  id v17 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:v13 preferredStyle:MCUIPreferAlert()];
  id v18 = MCUILocalizedString(@"CANCEL");
  [v17 MCUIAddCancelActionWithTitle:v18];

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__MCUIAppSignerViewController__presentAppRemovalAlert__block_invoke;
  v19[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v20, &location);
  [v17 MCUIAddActionWithTitle:v16 style:2 completion:v19];
  [v17 MCUIShowFromController:self];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __54__MCUIAppSignerViewController__presentAppRemovalAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _removeAppSignerApps];
    id WeakRetained = v2;
  }
}

- (MCUIAppSigner)appSigner
{
  return self->_appSigner;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (OS_dispatch_group)trustActionGroup
{
  return self->_trustActionGroup;
}

- (void)setTrustActionGroup:(id)a3
{
}

- (MCUIAppSignerUninstaller)uninstaller
{
  return self->_uninstaller;
}

- (void)setUninstaller:(id)a3
{
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileTrust, 0);
  objc_storeStrong((id *)&self->_uninstaller, 0);
  objc_storeStrong((id *)&self->_trustActionGroup, 0);
  objc_storeStrong((id *)&self->_appSigner, 0);
}

@end