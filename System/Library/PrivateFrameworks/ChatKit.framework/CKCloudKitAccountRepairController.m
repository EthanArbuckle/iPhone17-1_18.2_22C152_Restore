@interface CKCloudKitAccountRepairController
- (CDPUIDeviceToDeviceEncryptionHelper)encryptionHelper;
- (Class)authenticationContextClass;
- (id)AKSecurityUpgradeContextMessages;
- (id)CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:(id)a3;
- (id)accountStore;
- (id)authenticationContext;
- (id)primaryAppleAccount;
- (void)beginRepairWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)deviceToDeviceEncryptionHelper:(id)a3 shouldContinueUpgradingUserToHSA2WithCompletion:(id)a4;
- (void)setEncryptionHelper:(id)a3;
@end

@implementation CKCloudKitAccountRepairController

- (id)CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:(id)a3
{
  id v3 = a3;
  if (CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__onceToken != -1) {
    dispatch_once(&CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__onceToken, &__block_literal_global_279);
  }
  if (CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass)
  {
    v4 = (void *)[objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass) initWithPresentingViewController:v3];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Loading weak linked class CDPUIDeviceToDeviceEncryptionHelper from CoreCDPUI failed", v7, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

uint64_t __101__CKCloudKitAccountRepairController_CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController___block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"CDPUIDeviceToDeviceEncryptionHelper", @"CoreCDPUI");
  CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass = result;
  return result;
}

- (id)accountStore
{
  if (accountStore_onceToken != -1) {
    dispatch_once(&accountStore_onceToken, &__block_literal_global_25);
  }
  if (accountStore_sClass)
  {
    id v2 = objc_alloc_init((Class)accountStore_sClass);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Loading weak linked class ACAccountStore from Accounts failed", v5, 2u);
      }
    }
    id v2 = 0;
  }

  return v2;
}

uint64_t __49__CKCloudKitAccountRepairController_accountStore__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"ACAccountStore", @"Accounts");
  accountStore_sClass = result;
  return result;
}

- (id)AKSecurityUpgradeContextMessages
{
  if (AKSecurityUpgradeContextMessages_onceToken != -1) {
    dispatch_once(&AKSecurityUpgradeContextMessages_onceToken, &__block_literal_global_33);
  }
  id v2 = (void *)AKSecurityUpgradeContextMessages_sSecurityUpgradeContext;
  if (AKSecurityUpgradeContextMessages_sSecurityUpgradeContext)
  {
    id v3 = (id)AKSecurityUpgradeContextMessages_sSecurityUpgradeContext;
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Loading weak linked sSecurityUpgradeContext from AuthKit failed", v6, 2u);
    }
  }

  return v2;
}

void __69__CKCloudKitAccountRepairController_AKSecurityUpgradeContextMessages__block_invoke()
{
  v0 = *(void **)MEMORY[0x192FBA870]("AKSecurityUpgradeContextMessages", @"AuthKit");

  objc_storeStrong((id *)&AKSecurityUpgradeContextMessages_sSecurityUpgradeContext, v0);
}

- (id)primaryAppleAccount
{
  id v2 = [(CKCloudKitAccountRepairController *)self accountStore];
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Loading weak primary apple account failed", v8, 2u);
    }
  }

  return v4;
}

- (Class)authenticationContextClass
{
  if (authenticationContextClass_onceToken != -1) {
    dispatch_once(&authenticationContextClass_onceToken, &__block_literal_global_39_1);
  }
  id v2 = (void *)authenticationContextClass_sClass;
  if (authenticationContextClass_sClass)
  {
    id v3 = (id)authenticationContextClass_sClass;
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Loading weak linked AKAppleIDAuthenticationContext from AuthKit failed", v6, 2u);
    }
  }

  return (Class)v2;
}

uint64_t __63__CKCloudKitAccountRepairController_authenticationContextClass__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"AKAppleIDAuthenticationContext", @"AuthKit");
  authenticationContextClass_sClass = result;
  return result;
}

- (id)authenticationContext
{
  id v3 = [(CKCloudKitAccountRepairController *)self primaryAppleAccount];
  if (!v3
    || (v4 = [(CKCloudKitAccountRepairController *)self authenticationContextClass]) == 0)
  {
    id v10 = 0;
    goto LABEL_17;
  }
  id v5 = objc_alloc_init(v4);
  v6 = objc_msgSend(v3, "aa_altDSID");
  [v5 setAltDSID:v6];

  v7 = [v5 altDSID];

  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        v12 = "Loading weak linked altDSID failed";
        v13 = (uint8_t *)&v16;
LABEL_13:
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
      }
LABEL_14:
    }
LABEL_15:
    id v10 = 0;
    goto LABEL_16;
  }
  v8 = [(CKCloudKitAccountRepairController *)self AKSecurityUpgradeContextMessages];
  [v5 setSecurityUpgradeContext:v8];

  v9 = [v5 securityUpgradeContext];

  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        v12 = "Loading weak linked securityUpgradeContext";
        v13 = (uint8_t *)&v15;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v10 = v5;
LABEL_16:

LABEL_17:

  return v10;
}

- (void)beginRepairWithPresentingViewController:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKCloudKitAccountRepairController *)self encryptionHelper];
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "calling beginRepairWithPresentingViewController when repair already in flight", buf, 2u);
      }
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {
    id v10 = [(CKCloudKitAccountRepairController *)self authenticationContext];
    v11 = [(CKCloudKitAccountRepairController *)self CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:v6];
    [(CKCloudKitAccountRepairController *)self setEncryptionHelper:v11];

    v12 = [(CKCloudKitAccountRepairController *)self encryptionHelper];

    int v13 = IMOSLoggingEnabled();
    if (v12 && v10)
    {
      if (v13)
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v15 = (objc_class *)objc_opt_class();
          __int16 v16 = NSStringFromClass(v15);
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "actually beginning repair with presented view controller: %@", buf, 0xCu);
        }
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__CKCloudKitAccountRepairController_beginRepairWithPresentingViewController_completion___block_invoke;
      aBlock[3] = &unk_1E56231E8;
      aBlock[4] = self;
      id v23 = v6;
      id v24 = v7;
      v17 = _Block_copy(aBlock);
      v18 = [(CKCloudKitAccountRepairController *)self encryptionHelper];
      [v18 setDelegate:self];

      v19 = [(CKCloudKitAccountRepairController *)self encryptionHelper];
      [v19 performDeviceToDeviceEncryptionStateRepairForContext:v10 withCompletion:v17];
    }
    else
    {
      if (v13)
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "starting cloud kit account repair failed", buf, 2u);
        }
      }
      v21 = [(CKCloudKitAccountRepairController *)self encryptionHelper];
      [v21 setDelegate:0];

      [(CKCloudKitAccountRepairController *)self setEncryptionHelper:0];
      if (v7) {
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
    }
  }
}

void __88__CKCloudKitAccountRepairController_beginRepairWithPresentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) encryptionHelper];
  [v6 setDelegate:0];

  [*(id *)(a1 + 32) setEncryptionHelper:0];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      id v10 = @"NO";
      int v12 = 138412802;
      int v13 = v9;
      __int16 v14 = 2112;
      if (a2) {
        id v10 = @"YES";
      }
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "actually completed repair with presented view controller: %@, with success: %@, error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (void)deviceToDeviceEncryptionHelper:(id)a3 shouldContinueUpgradingUserToHSA2WithCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (CDPUIDeviceToDeviceEncryptionHelper)encryptionHelper
{
  return self->_encryptionHelper;
}

- (void)setEncryptionHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end