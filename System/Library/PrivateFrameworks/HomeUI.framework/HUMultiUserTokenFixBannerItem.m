@interface HUMultiUserTokenFixBannerItem
- (ACAccount)homeMediaAccount;
- (BOOL)forceHidden;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setHomeMediaAccount:(id)a3;
@end

@implementation HUMultiUserTokenFixBannerItem

- (void)setHomeMediaAccount:(id)a3
{
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F68720]];
  char v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_10;
  }
  v6 = [(HUMultiUserTokenFixBannerItem *)self homeMediaAccount];
  v7 = [(HUBannerItem *)self home];
  v8 = [v7 currentUser];
  int v9 = [v8 needsiTunesMultiUserRepair];

  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v6;
    __int16 v37 = 1024;
    int v38 = v9;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "mediaAccount = [%@]. needsiTunesMultiUserRepair = [%d]", buf, 0x12u);
  }

  char v11 = 0;
  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0 && v6 && ((v9 ^ 1) & 1) == 0) {
    char v11 = ![(HUMultiUserTokenFixBannerItem *)self forceHidden];
  }
  BOOL v12 = [(HUBannerItem *)self forceShowBanner];

  if (v12 || (v11 & 1) != 0)
  {
    v15 = objc_opt_new();
    v18 = _HULocalizedStringWithDefaultValue(@"HUSetupCellMultiUserTokenFix_Title", @"HUSetupCellMultiUserTokenFix_Title", 1);
    [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v15 setObject:@"Home.Banners.MultiUserTokenFix.SignIntoAppleMusic" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v15 setObject:@"HUSetupCellMultiUserTokenFix_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    v19 = _HULocalizedStringWithDefaultValue(@"HUSetupCellMultiUserTokenFix_Details", @"HUSetupCellMultiUserTokenFix_Details", 1);
    [v15 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v20 = _HULocalizedStringWithDefaultValue(@"HUSetupCellSignIn", @"HUSetupCellSignIn", 1);
    [v15 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    id v21 = objc_alloc(MEMORY[0x1E4F692D0]);
    uint64_t v22 = *MEMORY[0x1E4F68670];
    v31[0] = *MEMORY[0x1E4F68678];
    v31[1] = v22;
    uint64_t v23 = *MEMORY[0x1E4F685D8];
    v32[0] = *MEMORY[0x1E4F685E0];
    v32[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v25 = (void *)[v21 initWithImageIdentifiersKeyedBySize:v24];
    [v15 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    v27 = [(HUBannerItem *)self home];
    v28 = [v27 currentUser];
    v29 = objc_msgSend(v26, "na_setWithSafeObject:", v28);
    [v15 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F68908]];

    [v15 setObject:&unk_1F19B4868 forKeyedSubscript:@"bannerItemCategory"];
    v17 = [MEMORY[0x1E4F7A0D8] futureWithResult:v15];
  }
  else
  {
LABEL_10:
    v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v14 = objc_alloc(MEMORY[0x1E4F69228]);
    uint64_t v33 = *MEMORY[0x1E4F68B10];
    uint64_t v34 = MEMORY[0x1E4F1CC38];
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v16 = (void *)[v14 initWithResults:v15];
    v17 = [v13 futureWithResult:v16];
  }

  return v17;
}

- (ACAccount)homeMediaAccount
{
  return self->_homeMediaAccount;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_forceHidden = a3;
}

- (void).cxx_destruct
{
}

@end