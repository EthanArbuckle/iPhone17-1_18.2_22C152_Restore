@interface SFDefaultBrowserInstaller
+ (BOOL)isRestrictedToInstallBrowser:(id)a3 withAgeRating:(id)a4;
- (BOOL)browserIsAlreadyInstalled:(id)a3;
- (BOOL)installBrowserFromLockup:(id)a3 shouldObserveProgress:(BOOL)a4 ageRating:(id)a5;
- (SFDefaultBrowserInstaller)initWithPresentingViewController:(id)a3;
- (SFDefaultBrowserInstallerDelegate)delegate;
- (UIViewController)presentingViewController;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
- (void)enableDaemonNotification;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)installAppStore;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)stopQuerying;
@end

@implementation SFDefaultBrowserInstaller

- (SFDefaultBrowserInstaller)initWithPresentingViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFDefaultBrowserInstaller;
  v6 = [(SFDefaultBrowserInstaller *)&v12 init];
  if (v6)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v7 = (void *)getASDNotificationCenterClass_softClass;
    uint64_t v17 = getASDNotificationCenterClass_softClass;
    if (!getASDNotificationCenterClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getASDNotificationCenterClass_block_invoke;
      v13[3] = &unk_1E5C723B0;
      v13[4] = &v14;
      __getASDNotificationCenterClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v9 = [v8 defaultCenter];
    [v9 setDialogObserver:v6];

    objc_storeStrong((id *)&v6->_amsRequestPresentingViewController, a3);
    [getASDInstallAppsClass() setShouldPostNotificationOnDefaultBrowserInstallation:0];
    v6->_lock._os_unfair_lock_opaque = 0;
    v10 = v6;
  }

  return v6;
}

- (void)enableDaemonNotification
{
  id ASDInstallAppsClass = getASDInstallAppsClass();

  [ASDInstallAppsClass setShouldPostNotificationOnDefaultBrowserInstallation:1];
}

- (void)installAppStore
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getASDSystemAppMetadataClass_softClass;
  uint64_t v12 = getASDSystemAppMetadataClass_softClass;
  if (!getASDSystemAppMetadataClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getASDSystemAppMetadataClass_block_invoke;
    v8[3] = &unk_1E5C723B0;
    v8[4] = &v9;
    __getASDSystemAppMetadataClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = (void *)[[v4 alloc] initWithBundleID:@"com.apple.AppStore"];
  [v5 setUserInitiated:1];
  id ASDInstallAppsClass = getASDInstallAppsClass();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SFDefaultBrowserInstaller_installAppStore__block_invoke;
  v7[3] = &unk_1E5C77970;
  v7[4] = self;
  [ASDInstallAppsClass installApp:v5 withCompletionHandler:v7];
}

void __44__SFDefaultBrowserInstaller_installAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  v6 = WeakRetained;
  if (v4)
  {
    v7 = _WBSLocalizedString();
    [v6 browserInstallerDidFailWithError:v4 appName:v7 shouldDismissSheet:0];
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_2;
    v15 = &unk_1E5C72238;
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = WeakRetained;
    id v8 = (void *)MEMORY[0x1AD0C36A0](&v12);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "invalidate", v12, v13, v14, v15, v16);
    uint64_t v9 = [MEMORY[0x1E4F98AC0] scheduledTimerWithInterval:1 repeats:v8 handler:5.0];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = v9;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
  }
}

void __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 64);
  if (v3 < 8)
  {
    *(void *)(v2 + 64) = v3 + 1;
    id ASDAppQueryClass = getASDAppQueryClass();
    v14[0] = @"com.apple.AppStore";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v6 = [ASDAppQueryClass queryForBundleIDs:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_4;
    v10[3] = &unk_1E5C77948;
    uint64_t v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v6 executeQueryWithResultHandler:v10];
  }
  else
  {
    *(void *)(v2 + 64) = 0;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
    [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_3;
    block[3] = &unk_1E5C724D8;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    v6 = v13;
  }
}

void __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  unint64_t v3 = NSString;
  uint64_t v4 = _WBSLocalizedString();
  id v5 = objc_msgSend(v3, "stringWithFormat:", v4, 0x4046800000000000, v10);
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v7 = [v2 errorWithDomain:@"SFDefaultBrowserInstallerErrorDomain" code:0 userInfo:v6];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = _WBSLocalizedString();
  [v8 browserInstallerDidFailWithError:v7 appName:v9 shouldDismissSheet:0];
}

void __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_4_cold_1(v6, v5);
    }
  }
  else
  {
    v7 = [a2 firstObject];
    int v8 = [v7 isInstalled];

    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
      [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_14;
      block[3] = &unk_1E5C724D8;
      id v12 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) browserInstallerDidCompleteAppStoreInstallation];
}

+ (BOOL)isRestrictedToInstallBrowser:(id)a3 withAgeRating:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 bundleID];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F997F8]];

  if (v8)
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v10 = (void *)getAMSDeviceClass_softClass;
    uint64_t v28 = getAMSDeviceClass_softClass;
    if (!getAMSDeviceClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __getAMSDeviceClass_block_invoke;
      v23 = &unk_1E5C723B0;
      v24 = &v25;
      __getAMSDeviceClass_block_invoke((uint64_t)&v20);
      uint64_t v10 = (void *)v26[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v25, 8);
    if ([v11 isRunningInStoreDemoMode])
    {
      char v9 = 1;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F74230] sharedConnection];
      id v13 = [v12 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];
      unint64_t v14 = [v6 unsignedIntegerValue];
      if (v14 <= [v13 unsignedIntegerValue])
      {
        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x2050000000;
        v15 = (void *)getACAccountStoreClass_softClass;
        uint64_t v28 = getACAccountStoreClass_softClass;
        if (!getACAccountStoreClass_softClass)
        {
          uint64_t v20 = MEMORY[0x1E4F143A8];
          uint64_t v21 = 3221225472;
          v22 = __getACAccountStoreClass_block_invoke;
          v23 = &unk_1E5C723B0;
          v24 = &v25;
          __getACAccountStoreClass_block_invoke((uint64_t)&v20);
          v15 = (void *)v26[3];
        }
        id v16 = v15;
        _Block_object_dispose(&v25, 8);
        id v17 = objc_msgSend(v16, "ams_sharedAccountStore");
        v18 = objc_msgSend(v17, "ams_activeiTunesAccount");
        char v9 = objc_msgSend(v18, "ams_isManagedAppleID");
      }
      else
      {
        char v9 = 1;
      }
    }
  }

  return v9;
}

- (BOOL)browserIsAlreadyInstalled:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleID];

  v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  LOBYTE(v5) = v7 != 0;

  return (char)v5;
}

- (BOOL)installBrowserFromLockup:(id)a3 shouldObserveProgress:(BOOL)a4 ageRating:(id)a5
{
  id v8 = a3;
  if (+[SFDefaultBrowserInstaller isRestrictedToInstallBrowser:v8 withAgeRating:a5]|| [(SFDefaultBrowserInstaller *)self browserIsAlreadyInstalled:v8])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke;
    v11[3] = &unk_1E5C779C0;
    v11[4] = self;
    id v12 = v8;
    BOOL v13 = a4;
    [v12 _buyParamsWithCompletionBlock:v11];

    BOOL v9 = 1;
  }

  return v9;
}

void __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  id v8 = *(void **)(a1 + 40);
  if (v6)
  {
    BOOL v9 = [v8 title];
    [WeakRetained browserInstallerDidFailWithError:v6 appName:v9 shouldDismissSheet:0];
  }
  else
  {
    uint64_t v10 = [v8 id];
    id v11 = [v10 numberValue];

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    id v12 = (void *)getASDPurchaseClass_softClass;
    uint64_t v34 = getASDPurchaseClass_softClass;
    if (!getASDPurchaseClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      uint64_t v28 = __getASDPurchaseClass_block_invoke;
      v29 = &unk_1E5C723B0;
      v30 = &v31;
      __getASDPurchaseClass_block_invoke((uint64_t)&v26);
      id v12 = (void *)v32[3];
    }
    BOOL v13 = v12;
    _Block_object_dispose(&v31, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setItemID:v11];
    [v14 setIsDefaultBrowser:1];
    [v14 setBuyParameters:v5];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v15 = (void *)getASDPurchaseManagerClass_softClass;
    uint64_t v34 = getASDPurchaseManagerClass_softClass;
    if (!getASDPurchaseManagerClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      uint64_t v28 = __getASDPurchaseManagerClass_block_invoke;
      v29 = &unk_1E5C723B0;
      v30 = &v31;
      __getASDPurchaseManagerClass_block_invoke((uint64_t)&v26);
      v15 = (void *)v32[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v31, 8);
    id v17 = [v16 sharedManager];
    v35[0] = v14;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_2;
    v21[3] = &unk_1E5C77998;
    v21[4] = *(void *)(a1 + 32);
    id v22 = WeakRetained;
    id v19 = *(id *)(a1 + 40);
    char v25 = *(unsigned char *)(a1 + 48);
    id v23 = v19;
    id v24 = v11;
    id v20 = v11;
    [v17 processPurchases:v18 withResponseHandler:v21];
  }
}

void __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_3;
  block[3] = &unk_1E5C72C38;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_3(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 48) title];
      [v4 browserInstallerDidFailWithError:v3 appName:v5 shouldDismissSheet:0];
    }
    else if (*(unsigned char *)(a1 + 72))
    {
      id ASDAppQueryClass = getASDAppQueryClass();
      v14[0] = *(void *)(a1 + 56);
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v8 = [ASDAppQueryClass queryForStoreItemIDs:v7];
      id v9 = WeakRetained[1];
      WeakRetained[1] = (id)v8;

      [WeakRetained[1] setObserver:WeakRetained];
      id v10 = WeakRetained[1];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_4;
      v11[3] = &unk_1E5C77948;
      id v12 = *(id *)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      [v10 executeQueryWithResultHandler:v11];
    }
  }
}

void __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_5;
    block[3] = &unk_1E5C72350;
    id v6 = *(id *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __86__SFDefaultBrowserInstaller_installBrowserFromLockup_shouldObserveProgress_ageRating___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) title];
  [v1 browserInstallerDidFailWithError:v2 appName:v3 shouldDismissSheet:1];
}

- (void)stopQuerying
{
  [(ASDAppQuery *)self->_query setObserver:0];
  query = self->_query;
  self->_query = 0;
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v8 = (void *)getAMSUIAuthenticateTaskClass_softClass;
  uint64_t v18 = getAMSUIAuthenticateTaskClass_softClass;
  if (!getAMSUIAuthenticateTaskClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __getAMSUIAuthenticateTaskClass_block_invoke;
    v14[3] = &unk_1E5C723B0;
    v14[4] = &v15;
    __getAMSUIAuthenticateTaskClass_block_invoke((uint64_t)v14);
    id v8 = (void *)v16[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);
  id v10 = (AMSUIAuthenticateTask *)[[v9 alloc] initWithRequest:v6 presentingViewController:self->_amsRequestPresentingViewController];
  authenticateTask = self->_authenticateTask;
  self->_authenticateTask = v10;

  id v12 = [(AMSUIAuthenticateTask *)self->_authenticateTask performAuthentication];
  pendingResult = self->_pendingResult;
  self->_pendingResult = v12;

  [(AMSPromise *)self->_pendingResult addFinishBlock:v7];
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v8 = (void *)getAMSSystemAlertDialogTaskClass_softClass;
  uint64_t v17 = getAMSSystemAlertDialogTaskClass_softClass;
  if (!getAMSSystemAlertDialogTaskClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getAMSSystemAlertDialogTaskClass_block_invoke;
    v13[3] = &unk_1E5C723B0;
    v13[4] = &v14;
    __getAMSSystemAlertDialogTaskClass_block_invoke((uint64_t)v13);
    id v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  id v10 = (AMSSystemAlertDialogTask *)[[v9 alloc] initWithRequest:v6];
  dialogTask = self->_dialogTask;
  self->_dialogTask = v10;

  id v12 = [(AMSSystemAlertDialogTask *)self->_dialogTask present];
  [v12 addFinishBlock:v7];
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)getAMSUIEngagementTaskClass());
  id v9 = [getAMSUIEngagementTaskClass() createBagForSubProfile];
  id v10 = (AMSUIEngagementTask *)[v8 initWithRequest:v7 bag:v9 presentingViewController:self->_amsRequestPresentingViewController];

  engagementTask = self->_engagementTask;
  self->_engagementTask = v10;

  id v12 = [(AMSUIEngagementTask *)self->_engagementTask presentEngagement];
  [v12 addFinishBlock:v6];
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  id v5 = objc_msgSend(a4, "firstObject", a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SFDefaultBrowserInstaller_appQuery_resultsDidChange___block_invoke;
  v7[3] = &unk_1E5C72238;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __55__SFDefaultBrowserInstaller_appQuery_resultsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  uint64_t v2 = [*(id *)(a1 + 40) installError];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = [v3 installError];
    id v5 = [*(id *)(a1 + 40) localizedName];
    [WeakRetained browserInstallerDidFailWithError:v4 appName:v5 shouldDismissSheet:0];
  }
  else
  {
    id v6 = [v3 progress];

    id v7 = *(void **)(a1 + 40);
    if (v6)
    {
      id v8 = [v7 progress];
      [WeakRetained browserInstallerDownloadWithProgress:v8];
    }
    else
    {
      int v9 = [v7 isInstalled];
      id v10 = WeakRetained;
      if (!v9) {
        goto LABEL_8;
      }
      [WeakRetained browserInstallerDidCompleteInstallation];
    }
  }
  id v10 = WeakRetained;
LABEL_8:
}

- (SFDefaultBrowserInstallerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDefaultBrowserInstallerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appStoreInstallCheckTimer, 0);
  objc_storeStrong((id *)&self->_engagementTask, 0);
  objc_storeStrong((id *)&self->_dialogTask, 0);
  objc_storeStrong((id *)&self->_pendingResult, 0);
  objc_storeStrong((id *)&self->_authenticateTask, 0);
  objc_storeStrong((id *)&self->_amsRequestPresentingViewController, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

void __44__SFDefaultBrowserInstaller_installAppStore__block_invoke_4_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to execute query for App Store intallation with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end