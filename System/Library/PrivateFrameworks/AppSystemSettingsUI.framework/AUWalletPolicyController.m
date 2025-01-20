@interface AUWalletPolicyController
- (AUWalletPolicyController)initWithBundleIdentifier:(id)a3;
- (id)specifier;
- (id)walletAuthorizationType;
@end

@implementation AUWalletPolicyController

- (AUWalletPolicyController)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AUWalletPolicyController;
  v6 = [(AUWalletPolicyController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F06028]) initWithBundleIdentifier:v7->_bundleIdentifier];
    privacyController = v7->_privacyController;
    v7->_privacyController = v8;
  }
  return v7;
}

- (id)walletAuthorizationType
{
  v2 = NSNumber;
  uint64_t v3 = [self->_privacyController authorizationType];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (id)specifier
{
  v21[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
  if (([v3 containsObject:self->_bundleIdentifier] & 1) != 0
    || [v4 containsObject:self->_bundleIdentifier])
  {
    id v5 = PSBundlePathForPreferenceBundle();
    v6 = SFRuntimeAbsoluteFilePathForPath();

    v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x263F5FC40];
      v20 = v4;
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"Wallet" value:&stru_26FC1C568 table:0];
      objc_super v11 = objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel_walletAuthorizationType, objc_msgSend(v7, "classNamed:", @"WalletPrivacySettings.FinanceDataAuthorizationLevelController"), 2, 0);

      [v11 setProperty:self->_bundleIdentifier forKey:@"bundleID"];
      [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      v12 = [MEMORY[0x263F82670] currentDevice];
      if ([v12 userInterfaceIdiom]) {
        v13 = @"com.apple.PassbookStub";
      }
      else {
        v13 = @"com.apple.Passbook";
      }
      [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F60188]];

      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"Selected Accounts" value:&stru_26FC1C568 table:0];
      v21[0] = v15;
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"None" value:&stru_26FC1C568 table:0];
      v21[1] = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      [v11 setValues:&unk_26FC1ED88 titles:v18];

      v4 = v20;
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
}

@end