@interface HULockAccessUpdateViewController
- (HMHome)home;
- (HULockAccessUpdateViewController)initWithHome:(id)a3;
- (NAFuture)preloadFuture;
@end

@implementation HULockAccessUpdateViewController

- (HULockAccessUpdateViewController)initWithHome:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HULockAccessUpdateViewController;
  v6 = [(HULockAccessUpdateViewController *)&v16 initWithTitle:&stru_1F18F92B8 detailText:0 icon:0 contentLayout:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_initWeak(&location, v7);
    v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__HULockAccessUpdateViewController_initWithHome___block_invoke;
    v12[3] = &unk_1E638FF80;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    uint64_t v9 = [v8 flatMap:v12];
    preloadFuture = v7->_preloadFuture;
    v7->_preloadFuture = (NAFuture *)v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __49__HULockAccessUpdateViewController_initWithHome___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v40 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  int v2 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator");
  if (([*(id *)(a1 + 32) hasOnboardedForWalletKey] & 1) != 0 || !objc_msgSend(v40, "count"))
  {
    int v39 = 0;
  }
  else if (v2 && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey") & 1) != 0)
  {
    int v39 = 1;
  }
  else
  {
    int v39 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
  }
  if ([*(id *)(a1 + 32) hasOnboardedForAccessCode])
  {
    int v3 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    if ([v4 count])
    {
      if (v2 && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes") & 1) != 0) {
        int v3 = 1;
      }
      else {
        int v3 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
      }
    }
    else
    {
      int v3 = 0;
    }
  }
  id v5 = [MEMORY[0x1E4F42A98] configurationWithPointSize:36.0];
  if ((v39 & v3) == 1)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_All_Title", @"HULockAccessUpdate_Feature_All_Title", 1);
    v7 = [*(id *)(a1 + 32) name];
    id v14 = HULocalizedStringWithFormat(@"HULockAccessUpdate_Feature_All_Description", @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);

LABEL_21:
    uint64_t v15 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"apple.homekey.fill" withConfiguration:v5];
    goto LABEL_22;
  }
  if (v39)
  {
    v6 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_WalletKey_TapToUnlock_Title", @"HULockAccessUpdate_Feature_WalletKey_TapToUnlock_Title", 1);
    id v14 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_WalletKey_Description", @"HULockAccessUpdate_Feature_WalletKey_Description", 1);
    goto LABEL_21;
  }
  if (!v3)
  {
    v6 = 0;
    id v14 = 0;
    objc_super v16 = 0;
    int v18 = 0;
    goto LABEL_36;
  }
  v6 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_AccessCode_Title", @"HULockAccessUpdate_Feature_AccessCode_Title", 1);
  id v14 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_AccessCode_Description", @"HULockAccessUpdate_Feature_AccessCode_Description", 1);
  uint64_t v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"circle.grid.3x3.circle.fill" withConfiguration:v5];
LABEL_22:
  objc_super v16 = (void *)v15;
  if (v6) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (!v17 && v15) {
    [WeakRetained addBulletedListItemWithTitle:v6 description:v14 image:v15];
  }
  if (v3)
  {
    v19 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.2.fill" withConfiguration:v5];
    v20 = _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_GuestAccess_Title", @"HULockAccessUpdate_Feature_GuestAccess_Title", 1);
    _HULocalizedStringWithDefaultValue(@"HULockAccessUpdate_Feature_GuestAccess_Description", @"HULockAccessUpdate_Feature_GuestAccess_Description", 1);
    v21 = v16;
    v23 = v22 = v14;
    [WeakRetained addBulletedListItemWithTitle:v20 description:v23 image:v19];

    id v14 = v22;
    objc_super v16 = v21;
  }
LABEL_36:
  v24 = HFLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v18) {
      v25 = &stru_1F18F92B8;
    }
    else {
      v25 = @"Conditions not met for showing WalletKey OR PIN Code screen.";
    }
    int v37 = [*(id *)(a1 + 32) hasOnboardedForWalletKey];
    int v36 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingWalletKey");
    v26 = v14;
    v27 = v5;
    int v28 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
    v38 = v6;
    int v29 = v3;
    v30 = v16;
    int v31 = [*(id *)(a1 + 32) hasOnboardedForAccessCode];
    v32 = objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    int v33 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomeHubSupportingAccessCodes");
    *(_DWORD *)buf = 138415106;
    __int16 v44 = 2080;
    id v43 = WeakRetained;
    v45 = "-[HULockAccessUpdateViewController initWithHome:]_block_invoke";
    __int16 v46 = 2112;
    v47 = v25;
    __int16 v48 = 1024;
    int v49 = v37;
    __int16 v50 = 2112;
    v51 = v40;
    __int16 v52 = 1024;
    int v53 = v36;
    __int16 v54 = 1024;
    int v55 = v28;
    id v5 = v27;
    id v14 = v26;
    __int16 v56 = 1024;
    int v57 = v31;
    objc_super v16 = v30;
    __int16 v58 = 2112;
    v59 = v32;
    __int16 v60 = 1024;
    int v61 = v33;
    __int16 v62 = 1024;
    int v63 = v39;
    __int16 v64 = 1024;
    int v65 = v29;
    v6 = v38;
    _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ hasOnboardedForWalletKey: %{BOOL}d. walletKeyAccessories: %@, hasHomeHubSupportingWalletKey: %{BOOL}d, currentUserIsOwner: %{BOOL}d, hasOnboardedForAccessCode: %{BOOL}d, accessoriesSupportingAccessCodes: %@, hasHomeHubSupportingAccessCodes: %{BOOL}d, showWalletKeyTapToUnlockFeature: %{BOOL}d, showAccessCodeFeature: %{BOOL}d", buf, 0x5Eu);
  }
  v34 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v34;
}

- (HMHome)home
{
  return self->_home;
}

- (NAFuture)preloadFuture
{
  return self->_preloadFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end