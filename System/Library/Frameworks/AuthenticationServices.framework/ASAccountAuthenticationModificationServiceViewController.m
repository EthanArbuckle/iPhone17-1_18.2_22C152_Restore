@interface ASAccountAuthenticationModificationServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_ensureHostHasAccountModificationEntitlement;
- (BOOL)_isKeychainSyncEnabled;
- (void)_deleteExistingKeychainCredentialIfPossible;
- (void)_ensureHostHasAccountModificationEntitlement;
- (void)_findExtensionSupportingUpgrade:(id)a3 withCompletionHandler:(id)a4;
- (void)_updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6;
- (void)_updateKeychainWithNewCredential:(id)a3;
- (void)_upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6;
- (void)accountModificationHostViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)accountModificationHostViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5;
- (void)accountModificationHostViewControllerDidCompleteUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)dismissUIForAccountModificationHostViewController:(id)a3;
- (void)presentUIForAccountModificationHostViewController:(id)a3;
- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6;
- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6;
@end

@implementation ASAccountAuthenticationModificationServiceViewController

- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  self->_isPerformingAppInitiatedUpgrade = v14 == 0;
  objc_storeStrong((id *)&self->_existingCredential, a3);
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, a4);
  if (v14)
  {
    if ([(ASAccountAuthenticationModificationServiceViewController *)self _ensureHostHasAccountModificationEntitlement])
    {
      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x263F08800];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke;
      v21[3] = &unk_2643962B8;
      v21[4] = self;
      objc_copyWeak(&v25, &location);
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      [v15 extensionWithUUID:v14 completion:v21];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x263F665D0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_4;
    v17[3] = &unk_2643962E0;
    v17[4] = self;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    [(ASAccountAuthenticationModificationServiceViewController *)self _findExtensionSupportingUpgrade:v16 withCompletionHandler:v17];
  }
}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke(id *a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 extensionPointIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:*MEMORY[0x263F665C0]],
        v7,
        (v8 & 1) != 0))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3;
    v14[3] = &unk_264396290;
    objc_copyWeak(&v19, a1 + 8);
    id v15 = a1[5];
    id v16 = a1[6];
    id v17 = a1[7];
    id v18 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v14);

    objc_destroyWeak(&v19);
  }
  else
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F07FB8];
      uint64_t v20 = *MEMORY[0x263F08338];
      v21[0] = @"Did not find a valid extension for request.";
      id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v9 = [v10 errorWithDomain:v11 code:0x7FFFFFFFFFFFFFFFLL userInfo:v12];
    }
    id v13 = [a1[4] _remoteViewControllerProxy];
    [v13 requestDidFailWithError:v9 completion:&__block_literal_global_13];
  }
}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _upgradeCredentialToSignInWithApple:*(void *)(a1 + 32) forServiceIdentifier:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) extension:*(void *)(a1 + 56)];
}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_4(void *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (void *)a1[4];
  if (a2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    [v3 _upgradeCredentialToSignInWithApple:v4 forServiceIdentifier:v5 userInfo:v6 extension:a2];
  }
  else
  {
    v7 = [v3 _remoteViewControllerProxy];
    char v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"Did not find Account Authentication Modification extension.";
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v10 = [v8 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v9];
    [v7 requestDidFailWithError:v10 completion:&__block_literal_global_12_0];
  }
}

- (void)_upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v15 = a3;
  id v13 = [[_ASAccountAuthenticationModificationHostViewController alloc] initWithExtension:v10 serviceIdentifier:v12];

  accountModificationHostViewController = self->_accountModificationHostViewController;
  self->_accountModificationHostViewController = v13;

  [(_ASAccountAuthenticationModificationHostViewController *)self->_accountModificationHostViewController setDelegate:self];
  [(_ASAccountAuthenticationModificationHostViewController *)self->_accountModificationHostViewController upgradeCredentialToSignInWithApple:v15 userInfo:v11];
}

- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6
{
  v32[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  self->_isPerformingAppInitiatedUpgrade = v14 == 0;
  objc_storeStrong((id *)&self->_existingCredential, a3);
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, a4);
  if (v14)
  {
    if ([(ASAccountAuthenticationModificationServiceViewController *)self _ensureHostHasAccountModificationEntitlement])
    {
      objc_initWeak(&location, self);
      id v15 = (void *)MEMORY[0x263F08800];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke;
      v25[3] = &unk_2643962B8;
      v25[4] = self;
      objc_copyWeak(&v29, &location);
      id v26 = v11;
      id v27 = v12;
      id v28 = v13;
      [v15 extensionWithUUID:v14 completion:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (![(ASAccountAuthenticationModificationServiceViewController *)self _isKeychainSyncEnabled])
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      v31 = @"ASExtensionLocalizedFailureReasonErrorKey";
      v32[0] = @"iCloud Keychain must be enabled to perform strong password upgrades.";
      id v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      id v18 = [v16 errorWithDomain:*MEMORY[0x263F07FB8] code:0 userInfo:v17];

      id v19 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
      [v19 requestDidFailWithError:v18 completion:&__block_literal_global_21];
    }
    uint64_t v20 = *MEMORY[0x263F665C8];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_5;
    v21[3] = &unk_2643962E0;
    v21[4] = self;
    id v22 = v11;
    id v23 = v12;
    id v24 = v13;
    [(ASAccountAuthenticationModificationServiceViewController *)self _findExtensionSupportingUpgrade:v20 withCompletionHandler:v21];
  }
}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke(id *a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 extensionPointIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:*MEMORY[0x263F665C0]],
        v7,
        (v8 & 1) != 0))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3;
    v14[3] = &unk_264396290;
    objc_copyWeak(&v19, a1 + 8);
    id v15 = a1[5];
    id v16 = a1[6];
    id v17 = a1[7];
    id v18 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v14);

    objc_destroyWeak(&v19);
  }
  else
  {
    if (v6)
    {
      id v9 = v6;
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F07FB8];
      uint64_t v20 = *MEMORY[0x263F08338];
      v21[0] = @"Did not find a valid extension for request.";
      id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v9 = [v10 errorWithDomain:v11 code:0x7FFFFFFFFFFFFFFFLL userInfo:v12];
    }
    id v13 = [a1[4] _remoteViewControllerProxy];
    [v13 requestDidFailWithError:v9 completion:&__block_literal_global_16_0];
  }
}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _updateCredential:*(void *)(a1 + 32) forServiceIdentifier:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48) extension:*(void *)(a1 + 56)];
}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_5(void *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (void *)a1[4];
  if (a2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    [v3 _updateCredential:v4 forServiceIdentifier:v5 userInfo:v6 extension:a2];
  }
  else
  {
    v7 = [v3 _remoteViewControllerProxy];
    char v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"Did not find Account Authentication Modification extension.";
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v8 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v9];
    [v7 requestDidFailWithError:v10 completion:&__block_literal_global_23];
  }
}

- (void)_updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 attributes];
  objc_msgSend(v14, "safari_stringForKey:", *MEMORY[0x263F665D8]);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    id v15 = [MEMORY[0x263F66310] parsePasswordRules:v21 error:0];
    id v16 = [MEMORY[0x263F662F0] requirementsForPasswordRuleSet:v15 respectingMinLength:0 maxLength:0];
  }
  else
  {
    id v16 = 0;
  }
  id v17 = (void *)[objc_alloc(MEMORY[0x263F662F0]) initWithPasswordRequirementsByDomain:0];
  id v18 = [v17 generatedPasswordMatchingRequirements:v16];
  id v19 = [[_ASAccountAuthenticationModificationHostViewController alloc] initWithExtension:v10 serviceIdentifier:v12];

  accountModificationHostViewController = self->_accountModificationHostViewController;
  self->_accountModificationHostViewController = v19;

  [(_ASAccountAuthenticationModificationHostViewController *)self->_accountModificationHostViewController setDelegate:self];
  [(_ASAccountAuthenticationModificationHostViewController *)self->_accountModificationHostViewController updateCredential:v13 withNewPassword:v18 userInfo:v11];
}

- (void)_findExtensionSupportingUpgrade:(id)a3 withCompletionHandler:(id)a4
{
  v43[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  char v8 = (void *)MEMORY[0x263F01890];
  [(ASAccountAuthenticationModificationServiceViewController *)self _hostAuditToken];
  id v36 = 0;
  id v9 = [v8 bundleRecordForAuditToken:v37 error:&v36];
  id v10 = v36;
  id v11 = [v9 URL];
  id v12 = [v11 path];

  if (v10)
  {
    id v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ASAccountAuthenticationModificationServiceViewController _findExtensionSupportingUpgrade:withCompletionHandler:](v13, v10);
    }
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F665C0];
    uint64_t v15 = *MEMORY[0x263F07FB0];
    v42[0] = *MEMORY[0x263F07FF8];
    v42[1] = v15;
    v43[0] = v14;
    v43[1] = v12;
    id v16 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    id v35 = 0;
    id v17 = [MEMORY[0x263F08800] extensionsWithMatchingAttributes:v16 error:&v35];
    id v18 = v35;
    id v19 = [v17 firstObject];

    if (v19)
    {
      uint64_t v20 = [v19 attributes];
      char v21 = objc_msgSend(v20, "safari_BOOLForKey:", v6);

      id v22 = (void (*)(id, void *))v7[2];
      if (v21)
      {
        v22(v7, v19);
      }
      else
      {
        v22(v7, 0);
        id v26 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
        v31 = (void *)MEMORY[0x263F087E8];
        id v34 = v18;
        uint64_t v38 = *MEMORY[0x263F08338];
        id v27 = NSString;
        v32 = [v19 identifier];
        id v28 = [v27 stringWithFormat:@"Discovered extension %@ does not support strong password upgrades.", v32];
        v39 = v28;
        id v29 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v30 = [v31 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v29];
        [v26 requestDidFailWithError:v30 completion:&__block_literal_global_34];

        id v18 = v34;
      }
    }
    else
    {
      v7[2](v7, 0);
      v33 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
      id v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v40 = *MEMORY[0x263F08338];
      v41 = @"Did not find Account Authentication Modification extension.";
      id v24 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v25 = [v23 errorWithDomain:@"ASExtensionErrorDomain" code:0 userInfo:v24];
      [v33 requestDidFailWithError:v25 completion:&__block_literal_global_28];
    }
  }
}

- (BOOL)_ensureHostHasAccountModificationEntitlement
{
  v12[1] = *MEMORY[0x263EF8340];
  [(ASAccountAuthenticationModificationServiceViewController *)self _hostAuditToken];
  char HasEntitlement = WBSAuditTokenHasEntitlement();
  if ((HasEntitlement & 1) == 0)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ASAccountAuthenticationModificationServiceViewController _ensureHostHasAccountModificationEntitlement](v4);
    }
    uint64_t v5 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F07F70];
    uint64_t v11 = *MEMORY[0x263F08338];
    v12[0] = @"Calling process is not entitled";
    char v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = [v6 errorWithDomain:v7 code:4099 userInfo:v8];
    [v5 requestDidFailWithError:v9 completion:&__block_literal_global_39];
  }
  return HasEntitlement;
}

- (void)_deleteExistingKeychainCredentialIfPossible
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Deleted credential from Keychain after upgrading to Sign in with Apple.", v1, 2u);
}

- (void)_updateKeychainWithNewCredential:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v30 = a3;
  uint64_t v4 = [(ASCredentialServiceIdentifier *)self->_serviceIdentifierForUpgrade identifier];
  v32 = objc_msgSend(v4, "safari_highLevelDomainFromHost");

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [MEMORY[0x263F663B0] sharedStore];
  id v6 = [v5 savedAccountsWithPasswords];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    unint64_t v10 = 0x267C0E000uLL;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v13 = [*(id *)((char *)&self->super.super.super.isa + *(int *)(v10 + 4028)) user];
        uint64_t v14 = [v12 user];
        if ([v13 isEqualToString:v14])
        {
          v31 = v12;
          [v12 highLevelDomain];
          uint64_t v15 = v8;
          uint64_t v16 = v9;
          id v17 = self;
          unint64_t v18 = v10;
          v20 = id v19 = v6;
          int v21 = [v32 isEqualToString:v20];

          id v6 = v19;
          unint64_t v10 = v18;
          self = v17;
          uint64_t v9 = v16;
          uint64_t v8 = v15;

          if (v21)
          {
            id v25 = [MEMORY[0x263F663B0] sharedStore];
            id v26 = v30;
            id v27 = [v30 user];
            id v28 = [v30 password];
            [v25 changeSavedAccount:v31 toUser:v27 password:v28];
            id v29 = v32;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }

  id v22 = objc_alloc(MEMORY[0x263F08BC0]);
  id v23 = [(ASCredentialServiceIdentifier *)self->_serviceIdentifierForUpgrade identifier];
  id v6 = (void *)[v22 initWithHost:v23 port:0 protocol:&stru_26CA92B70 realm:0 authenticationMethod:*MEMORY[0x263F08538]];

  id v25 = [MEMORY[0x263F663B0] sharedStore];
  id v26 = v30;
  id v27 = [v30 user];
  id v28 = [v30 password];
  id v29 = v32;
  id v24 = (id)[v25 saveUser:v27 password:v28 forProtectionSpace:v6 highLevelDomain:v32 groupID:&stru_26CA92B70];
LABEL_13:
}

- (BOOL)_isKeychainSyncEnabled
{
  v2 = [MEMORY[0x263F662C8] sharedMonitor];
  char v3 = [v2 isKeychainSyncEnabled];

  return v3;
}

- (void)accountModificationHostViewControllerDidCompleteUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (self->_isPerformingAppInitiatedUpgrade) {
    [(ASAccountAuthenticationModificationServiceViewController *)self _deleteExistingKeychainCredentialIfPossible];
  }
  uint64_t v8 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
  [v8 requestToUpgradeToSignInWithAppleDidFinishWithUserInfo:v9 completion:v7];
}

- (void)accountModificationHostViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  [(ASAccountAuthenticationModificationServiceViewController *)self _updateKeychainWithNewCredential:v11];
  id v12 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
  [v12 requestDidFinishWithCredential:v11 userInfo:v10 completion:v9];
}

- (void)presentUIForAccountModificationHostViewController:(id)a3
{
  id v7 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:self->_accountModificationHostViewController];
  [(ASAccountAuthenticationModificationServiceViewController *)self addChildViewController:v7];
  uint64_t v4 = [(ASAccountAuthenticationModificationServiceViewController *)self view];
  uint64_t v5 = [v7 view];
  [v4 addSubview:v5];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];
  [v7 didMoveToParentViewController:self];
  id v6 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
  [v6 presentAccountModificationRemoteViewController];
}

- (void)dismissUIForAccountModificationHostViewController:(id)a3
{
  id v3 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
  [v3 dismissAccountModificationRemoteViewController];
}

- (void)accountModificationHostViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(ASAccountAuthenticationModificationServiceViewController *)self _remoteViewControllerProxy];
  [v9 requestDidFailWithError:v8 completion:v7];
}

+ (id)_exportedInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CABD220];
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:0 ofReply:0];

  uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:1 ofReply:0];

  uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v5 forSelector:sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:3 ofReply:0];

  id v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v6 forSelector:sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:0 ofReply:0];

  id v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v7 forSelector:sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:1 ofReply:0];

  id v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v8 forSelector:sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_ argumentIndex:3 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[_ASAccountAuthenticationModificationRemoteViewController exportedInterface];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, 0);
  objc_storeStrong((id *)&self->_existingCredential, 0);

  objc_storeStrong((id *)&self->_accountModificationHostViewController, 0);
}

- (void)_findExtensionSupportingUpgrade:(void *)a1 withCompletionHandler:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21918F000, v3, OS_LOG_TYPE_ERROR, "Failed to get bundle record for host application due to error: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_ensureHostHasAccountModificationEntitlement
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "The caller is not entitled to coordinate account authentication modification extension requests", v1, 2u);
}

@end