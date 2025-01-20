@interface MCUIListController
- (BOOL)needsToReloadManageAccountSpecifiers;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (DMCEnrollmentInterface)dmcEnrollmentInterface;
- (MCUIBridgeSpecifierProvider)bridgeSpecifierProvider;
- (MCUIListController)initWithNibName:(id)a3 bundle:(id)a4;
- (MCUIMCSpecifierProvider)mcSpecifierProvider;
- (NSArray)managedAccountSpecifiers;
- (NSArray)vpnBundleControllers;
- (NSArray)vpnSpecifiers;
- (id)_specifiersForPhone;
- (id)specifiers;
- (int)provisioningProfileInstalledToken;
- (int)provisioningProfileRemovedToken;
- (void)_cleanCacheAndReloadSpecifiers;
- (void)_handleDeferredPush;
- (void)_loadManagedAccountSpecifiersWithCompletionHandler:(id)a3;
- (void)_loadVPNSpecifiersWithCompletionHandler:(id)a3;
- (void)_mainQueue_setManagedSignInButtonEnabled:(BOOL)a3;
- (void)_mcuiUpdated;
- (void)_setupDeviceExpert;
- (void)_showAccountDetailsPaneWithUsername:(id)a3 completion:(id)a4;
- (void)_uprootDistributedNotificationReceived:(id)a3;
- (void)_uprootNotificationReceived:(id)a3;
- (void)_watchFetchFailed:(id)a3;
- (void)accountCellWasTapped:(id)a3;
- (void)dealloc;
- (void)enrollmentDidBegin;
- (void)enrollmentDidFailWithError:(id)a3;
- (void)enrollmentDidSucceed;
- (void)enrollmentWasCanceled;
- (void)handleURL:(id)a3;
- (void)setBridgeSpecifierProvider:(id)a3;
- (void)setDmcEnrollmentInterface:(id)a3;
- (void)setManagedAccountSpecifiers:(id)a3;
- (void)setMcSpecifierProvider:(id)a3;
- (void)setNeedsToReloadManageAccountSpecifiers:(BOOL)a3;
- (void)setProvisioningProfileInstalledToken:(int)a3;
- (void)setProvisioningProfileRemovedToken:(int)a3;
- (void)setVpnBundleControllers:(id)a3;
- (void)setVpnSpecifiers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MCUIListController

- (MCUIListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MCUIListController;
  v8 = [(MCUIListController *)&v30 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = +[MCUIWatchManager shared];

    if (v9)
    {
      v10 = [(MCUISpecifierProvider *)[MCUIBridgeSpecifierProvider alloc] initWithDelegate:v8];
      bridgeSpecifierProvider = v8->_bridgeSpecifierProvider;
      v8->_bridgeSpecifierProvider = v10;

      v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:v8 selector:sel__watchFetchFailed_ name:@"kMCUIWatchFetchFailedNotification" object:0];
    }
    else
    {
      v8->_needsToReloadManageAccountSpecifiers = 1;
      v13 = [(MCUISpecifierProvider *)[MCUIMCSpecifierProvider alloc] initWithDelegate:v8];
      mcSpecifierProvider = v8->_mcSpecifierProvider;
      v8->_mcSpecifierProvider = v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5E650]) initFromViewController:v8 delegate:v8];
      dmcEnrollmentInterface = v8->_dmcEnrollmentInterface;
      v8->_dmcEnrollmentInterface = (DMCEnrollmentInterface *)v15;

      v12 = [(DMCEnrollmentInterface *)v8->_dmcEnrollmentInterface accountSpecifierProvider];
      [v12 setDelegate:v8];
    }

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v8 selector:sel__mcuiUpdated name:@"kMCUIUpdatedNotification" object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v19 = *MEMORY[0x1E4F73340];
    [v18 addObserver:v8 selector:sel__uprootNotificationReceived_ name:*MEMORY[0x1E4F73340] object:0];

    v20 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v20 addObserver:v8 selector:sel__uprootDistributedNotificationReceived_ name:v19 object:0];

    objc_initWeak(&location, v8);
    v21 = MEMORY[0x1E4F14428];
    id v22 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__MCUIListController_initWithNibName_bundle___block_invoke;
    handler[3] = &unk_1E6EAD7C0;
    objc_copyWeak(&v28, &location);
    LODWORD(v21) = notify_register_dispatch("MISProvisioningProfileInstalled", &v8->_provisioningProfileInstalledToken, v21, handler);

    if (v21) {
      NSLog(&cfstr_FailedToRegist.isa);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __45__MCUIListController_initWithNibName_bundle___block_invoke_2;
    v25[3] = &unk_1E6EAD7C0;
    objc_copyWeak(&v26, &location);
    uint32_t v23 = notify_register_dispatch("MISProvisioningProfileRemoved", &v8->_provisioningProfileInstalledToken, MEMORY[0x1E4F14428], v25);

    if (v23) {
      NSLog(&cfstr_FailedToRegist_0.isa);
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__MCUIListController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanCacheAndReloadSpecifiers];
    id WeakRetained = v2;
  }
}

void __45__MCUIListController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanCacheAndReloadSpecifiers];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  notify_cancel(self->_provisioningProfileInstalledToken);
  notify_cancel(self->_provisioningProfileRemovedToken);
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"kMCUIUpdatedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)MCUIListController;
  [(MCUIListController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MCUIListController;
  [(MCUIListController *)&v3 viewDidLoad];
  id v2 = +[MCUIWatchManager shared];
  [v2 reloadProfiles];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCUIListController;
  [(MCUIListController *)&v4 viewDidAppear:a3];
  [(MCUIListController *)self _setupDeviceExpert];
}

- (void)_setupDeviceExpert
{
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.General/ManagedConfigurationList"];
  id v3 = objc_alloc(MEMORY[0x1E4F292B8]);
  objc_super v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];
  id v7 = (void *)[v3 initWithKey:@"VPN & Device Management" table:0 locale:v4 bundleURL:v6];

  [(MCUIListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.gear" title:v7 localizedNavigationComponents:MEMORY[0x1E4F1CBF0] deepLink:v8];
}

- (void)_mcuiUpdated
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__MCUIListController__mcuiUpdated__block_invoke;
  v2[3] = &unk_1E6EAD1F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __34__MCUIListController__mcuiUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanCacheAndReloadSpecifiers];
    id WeakRetained = v2;
  }
}

- (void)_uprootNotificationReceived:(id)a3
{
  NSLog(&cfstr_Mcuilistcontro.isa, a2, a3);
  [(MCUIListController *)self _mcuiUpdated];
}

- (void)_uprootDistributedNotificationReceived:(id)a3
{
  NSLog(&cfstr_Mcuilistcontro_0.isa, a2, a3);
  [(MCUIListController *)self _mcuiUpdated];
}

- (void)_watchFetchFailed:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"kMCUINotificationErrorKey"];

  if (v6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MCUIListController__watchFetchFailed___block_invoke;
    block[3] = &unk_1E6EAD2A8;
    objc_copyWeak(&v9, &location);
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_Mcuilistcontro_1.isa, v4);
  }
}

void __40__MCUIListController__watchFetchFailed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__MCUIListController__watchFetchFailed___block_invoke_2;
    v4[3] = &unk_1E6EAD1D0;
    v4[4] = WeakRetained;
    [MEMORY[0x1E4F42728] MCUIShowAlertForError:v3 fromViewController:WeakRetained suggestedTitle:0 suggestedMessage:0 completion:v4];
  }
}

void __40__MCUIListController__watchFetchFailed___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mcuiViewController];
  v1 = [v3 navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x1E4F92F08];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  if (!v3)
  {
    v5 = +[MCUIWatchManager shared];

    if (v5)
    {
      id v6 = [(MCUIListController *)self bridgeSpecifierProvider];
      id v7 = [v6 specifiers];
      id v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v7;
    }
    else
    {
      id v9 = [(MCUIListController *)self _specifiersForPhone];
      id v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v9;
    }

    id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  }
  id v10 = v3;
  return v10;
}

- (id)_specifiersForPhone
{
  id v3 = objc_opt_new();
  id v4 = dispatch_group_create();
  v5 = [(MCUIListController *)self vpnSpecifiers];

  if (v5)
  {
    id v6 = [(MCUIListController *)self vpnSpecifiers];
    [v3 addObjectsFromArray:v6];
  }
  else
  {
    dispatch_group_enter(v4);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__MCUIListController__specifiersForPhone__block_invoke;
    v18[3] = &unk_1E6EAD1D0;
    uint64_t v19 = v4;
    [(MCUIListController *)self _loadVPNSpecifiersWithCompletionHandler:v18];
  }
  id v7 = [(MCUIListController *)self managedAccountSpecifiers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [(MCUIListController *)self managedAccountSpecifiers];
    [v3 addObjectsFromArray:v9];
  }
  if ([(MCUIListController *)self needsToReloadManageAccountSpecifiers])
  {
    dispatch_group_enter(v4);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__MCUIListController__specifiersForPhone__block_invoke_2;
    v16[3] = &unk_1E6EAD1D0;
    v17 = v4;
    [(MCUIListController *)self _loadManagedAccountSpecifiersWithCompletionHandler:v16];
  }
  else if (v5)
  {
    goto LABEL_10;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MCUIListController__specifiersForPhone__block_invoke_3;
  block[3] = &unk_1E6EAD1D0;
  void block[4] = self;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], block);
LABEL_10:
  id v10 = [(MCUIListController *)self mcSpecifierProvider];
  v11 = [v10 specifiers];

  if (v11) {
    [v3 addObjectsFromArray:v11];
  }
  if (![v3 count])
  {
    v12 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    v13 = MCUILocalizedString(@"NO_PROFILES_INSTALLED");
    [v12 setProperty:v13 forKey:*MEMORY[0x1E4F93170]];

    [v3 addObject:v12];
  }

  return v3;
}

void __41__MCUIListController__specifiersForPhone__block_invoke(uint64_t a1)
{
}

void __41__MCUIListController__specifiersForPhone__block_invoke_2(uint64_t a1)
{
}

uint64_t __41__MCUIListController__specifiersForPhone__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _handleDeferredPush];
}

- (void)_cleanCacheAndReloadSpecifiers
{
  [(MCUIListController *)self setNeedsToReloadManageAccountSpecifiers:1];
  [(MCUIListController *)self reloadSpecifiers];
}

- (void)_loadVPNSpecifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6EAD3E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = PSBundlePathForPreferenceBundle();
    v5 = (void *)MEMORY[0x1E4F28B50];
    id v6 = SFRuntimeAbsoluteFilePathForPath();
    id v7 = [v5 bundleWithPath:v6];

    id v8 = (objc_class *)[v7 principalClass];
    if (v8)
    {
      id v9 = v8;
      if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()]) {
    }
      }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E6EAD968;
    objc_copyWeak(&v13, v2);
    v11 = @"VPNPreferences";
    id v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
  }
}

void __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *MEMORY[0x1E4F93090];
    v15[0] = *MEMORY[0x1E4F93098];
    v15[1] = v4;
    v16[0] = v3;
    v16[1] = MEMORY[0x1E4F1CC28];
    v15[2] = @"isDeviceManagement";
    v16[2] = MEMORY[0x1E4F1CC38];
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    id v12 = v5;
    id v13 = @"items";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v8 = [WeakRetained bundle];
    id v11 = 0;
    id v9 = SpecifiersFromPlist();
    id v10 = v11;
    objc_msgSend(WeakRetained, "setVpnSpecifiers:", v9, &v11);

    [WeakRetained setVpnBundleControllers:v10];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  if ([a3 isEqualToString:@"VPN"])
  {
    uint64_t v4 = [(MCUIListController *)self specifierForID:@"VPN"];

    if (!v4) {
      return 1;
    }
  }
  return [(MCUIListController *)self needsToReloadManageAccountSpecifiers];
}

- (void)_handleDeferredPush
{
  uint64_t v3 = [(MCUIListController *)self specifierIDPendingPush];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(MCUIListController *)self handlePendingURL];
  }
}

- (void)_loadManagedAccountSpecifiersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6EAD9B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dmcEnrollmentInterface];
  uint64_t v3 = [v2 specifiersForManagedAccounts];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6EAD990;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsToReloadManageAccountSpecifiers:0];
  [*(id *)(a1 + 32) setManagedAccountSpecifiers:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)accountCellWasTapped:(id)a3
{
  id v4 = [MEMORY[0x1E4F5E650] accountControllerFromSpecifier:a3 baseViewController:self preferiCloudAccount:1];
  [(MCUIListController *)self showController:v4 animate:1];
}

- (void)enrollmentDidBegin
{
}

- (void)enrollmentDidSucceed
{
}

- (void)enrollmentDidFailWithError:(id)a3
{
}

- (void)enrollmentWasCanceled
{
}

- (void)_mainQueue_setManagedSignInButtonEnabled:(BOOL)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MCUIListController__mainQueue_setManagedSignInButtonEnabled___block_invoke;
  block[3] = &unk_1E6EAD9E0;
  objc_copyWeak(&v5, &location);
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__MCUIListController__mainQueue_setManagedSignInButtonEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained dmcEnrollmentInterface];
    [v3 setManagedSignInButtonEnabled:*(unsigned __int8 *)(a1 + 40)];

    [v4 _cleanCacheAndReloadSpecifiers];
    id WeakRetained = v4;
  }
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"sender"];
  BOOL v6 = [v4 objectForKey:@"path"];
  [(id)objc_opt_class() setOriginalURLSender:v5];
  if ([v6 isEqualToString:*MEMORY[0x1E4F74288]])
  {
    NSLog(&cfstr_Mcuilistcontro_2.isa, v6, v5);
    id v7 = [v4 objectForKey:@"username"];
    [(MCUIListController *)self _showAccountDetailsPaneWithUsername:v7 completion:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MCUIListController;
    [(MCURLListenerListController *)&v8 handleURL:v4];
  }
}

- (void)_showAccountDetailsPaneWithUsername:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(void))a4;
  id v7 = [MEMORY[0x1E4F5E638] itemSpecifierIDForAccountUsername:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v8 = [(MCUIListController *)self specifiers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v13 identifier];
        int v15 = [v14 isEqualToString:v7];

        if (v15)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __69__MCUIListController__showAccountDetailsPaneWithUsername_completion___block_invoke;
          v16[3] = &unk_1E6EAD458;
          void v16[4] = self;
          v16[5] = v13;
          dispatch_async(MEMORY[0x1E4F14428], v16);
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v6) {
    v6[2](v6);
  }
}

uint64_t __69__MCUIListController__showAccountDetailsPaneWithUsername_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accountCellWasTapped:*(void *)(a1 + 40)];
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MCUIWatchManager shared];
  if (v10
    && (v11 = (void *)v10, int v12 = [v8 isEqualToString:*MEMORY[0x1E4F742A0]], v11, v12))
  {
    BOOL v13 = 1;
    if (a5) {
      *a5 = 1;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MCUIListController;
    BOOL v13 = [(MCUIListController *)&v15 prepareHandlingURLForSpecifierID:v8 resourceDictionary:v9 animatePush:a5];
  }

  return v13;
}

- (int)provisioningProfileInstalledToken
{
  return self->_provisioningProfileInstalledToken;
}

- (void)setProvisioningProfileInstalledToken:(int)a3
{
  self->_provisioningProfileInstalledToken = a3;
}

- (int)provisioningProfileRemovedToken
{
  return self->_provisioningProfileRemovedToken;
}

- (void)setProvisioningProfileRemovedToken:(int)a3
{
  self->_provisioningProfileRemovedToken = a3;
}

- (MCUIMCSpecifierProvider)mcSpecifierProvider
{
  return self->_mcSpecifierProvider;
}

- (void)setMcSpecifierProvider:(id)a3
{
}

- (MCUIBridgeSpecifierProvider)bridgeSpecifierProvider
{
  return self->_bridgeSpecifierProvider;
}

- (void)setBridgeSpecifierProvider:(id)a3
{
}

- (BOOL)needsToReloadManageAccountSpecifiers
{
  return self->_needsToReloadManageAccountSpecifiers;
}

- (void)setNeedsToReloadManageAccountSpecifiers:(BOOL)a3
{
  self->_needsToReloadManageAccountSpecifiers = a3;
}

- (NSArray)managedAccountSpecifiers
{
  return self->_managedAccountSpecifiers;
}

- (void)setManagedAccountSpecifiers:(id)a3
{
}

- (DMCEnrollmentInterface)dmcEnrollmentInterface
{
  return self->_dmcEnrollmentInterface;
}

- (void)setDmcEnrollmentInterface:(id)a3
{
}

- (NSArray)vpnSpecifiers
{
  return self->_vpnSpecifiers;
}

- (void)setVpnSpecifiers:(id)a3
{
}

- (NSArray)vpnBundleControllers
{
  return self->_vpnBundleControllers;
}

- (void)setVpnBundleControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vpnBundleControllers, 0);
  objc_storeStrong((id *)&self->_vpnSpecifiers, 0);
  objc_storeStrong((id *)&self->_dmcEnrollmentInterface, 0);
  objc_storeStrong((id *)&self->_managedAccountSpecifiers, 0);
  objc_storeStrong((id *)&self->_bridgeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mcSpecifierProvider, 0);
}

@end