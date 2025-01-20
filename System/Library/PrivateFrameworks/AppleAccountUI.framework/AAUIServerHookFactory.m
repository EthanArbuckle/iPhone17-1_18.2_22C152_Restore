@interface AAUIServerHookFactory
- (id)_defaultHooks:(id)a3;
- (id)_iCloudDataRecoveryServiceHooksFor:(id)a3 accountManager:(id)a4 cdpContext:(id)a5;
- (id)_passwordAndSecurityHooksForAccount:(id)a3 accountManager:(id)a4;
- (id)_personalInformationHooksForAccount:(id)a3 accountManager:(id)a4;
- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4;
- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4 cdpContext:(id)a5;
@end

@implementation AAUIServerHookFactory

- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4
{
  id v6 = a4;
  v7 = [v6 accounts];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (a3 == 3)
  {
    uint64_t v9 = [(AAUIServerHookFactory *)self _personalInformationHooksForAccount:v8 accountManager:v6];
  }
  else if (a3 == 2)
  {
    uint64_t v9 = [(AAUIServerHookFactory *)self _iCloudDataRecoveryServiceHooksFor:v8 accountManager:v6 cdpContext:0];
  }
  else
  {
    if (a3 == 1) {
      [(AAUIServerHookFactory *)self _passwordAndSecurityHooksForAccount:v8 accountManager:v6];
    }
    else {
    uint64_t v9 = [(AAUIServerHookFactory *)self _defaultHooks:v8];
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4 cdpContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 accounts];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  if (a3 == 2)
  {
    uint64_t v12 = [(AAUIServerHookFactory *)self _iCloudDataRecoveryServiceHooksFor:v11 accountManager:v8 cdpContext:v9];
  }
  else
  {
    if (a3 == 1) {
      [(AAUIServerHookFactory *)self _passwordAndSecurityHooksForAccount:v11 accountManager:v8];
    }
    else {
    uint64_t v12 = [(AAUIServerHookFactory *)self _defaultHooks:v11];
    }
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_defaultHooks:(id)a3
{
  v26[15] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v25 = objc_opt_new();
  v26[0] = v25;
  v4 = [AAUIAuthKitAuthenticatonHook alloc];
  v24 = [v3 username];
  v23 = objc_msgSend(v3, "aa_altDSID");
  v22 = [(AAUIAuthKitAuthenticatonHook *)v4 initWithUsername:v24 altDSID:v23];
  v26[1] = v22;
  v21 = objc_opt_new();
  v26[2] = v21;
  v20 = objc_opt_new();
  v26[3] = v20;
  v19 = objc_opt_new();
  v26[4] = v19;
  v18 = objc_opt_new();
  v26[5] = v18;
  v17 = objc_opt_new();
  v26[6] = v17;
  v5 = objc_opt_new();
  v26[7] = v5;
  id v6 = objc_opt_new();
  v26[8] = v6;
  v7 = objc_opt_new();
  v26[9] = v7;
  id v8 = objc_opt_new();
  v26[10] = v8;
  id v9 = objc_opt_new();
  v26[11] = v9;
  v10 = objc_opt_new();
  v26[12] = v10;
  id v11 = objc_alloc(MEMORY[0x263F292A0]);
  uint64_t v12 = objc_msgSend(v3, "aa_altDSID");
  v13 = (void *)[v11 initWithAltDSID:v12];
  v26[13] = v13;
  v14 = (void *)[objc_alloc(MEMORY[0x263F292F0]) initWithAccount:v3];

  v26[14] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:15];

  return v15;
}

- (id)_passwordAndSecurityHooksForAccount:(id)a3 accountManager:(id)a4
{
  v26[6] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = [(AAUIServerHookFactory *)self _defaultHooks:v8];
  id v11 = (void *)[v9 initWithArray:v10];

  v25 = +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:v7];
  uint64_t v12 = +[AAUILegacyContactsViewFactory createViewModelWithAccountManager:v7];
  v13 = objc_opt_new();
  v26[0] = v13;
  v14 = [[AAUIAccountBeneficiaryManagementHook alloc] initWithAccountManager:v7 legacyContactsViewModel:v12];
  v26[1] = v14;
  v15 = [[AAUIAccountRecoveryManagementHook alloc] initWithAccountManager:v7 recoveryContactsViewModel:v25];

  v26[2] = v15;
  v16 = objc_opt_new();
  v26[3] = v16;
  v17 = objc_opt_new();
  v26[4] = v17;
  v18 = [AAUIAuthKitPasswordChangeHook alloc];
  v19 = objc_msgSend(v8, "aa_altDSID");

  v20 = [(AAUIAuthKitPasswordChangeHook *)v18 initWithAltDSID:v19];
  v26[5] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:6];
  [v11 addObjectsFromArray:v21];

  v22 = objc_alloc_init(AAUIEDPTokenSpyglassHook);
  [v11 addObject:v22];

  v23 = (void *)[v11 copy];
  return v23;
}

- (id)_iCloudDataRecoveryServiceHooksFor:(id)a3 accountManager:(id)a4 cdpContext:(id)a5
{
  v26[5] = *MEMORY[0x263EF8340];
  id v8 = (objc_class *)MEMORY[0x263EFF980];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [(AAUIServerHookFactory *)self _defaultHooks:v11];
  v14 = (void *)[v12 initWithArray:v13];

  v15 = +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:v10];
  v16 = [[AAUICDPWalrusStatusUpdateHook alloc] initWithAppleAccount:v11];

  v17 = -[AAUICustodianVerificationHook initWithAccountManager:]([AAUICustodianVerificationHook alloc], "initWithAccountManager:", v10, v16);
  v26[1] = v17;
  v18 = [AAUICDPCustodianHook alloc];
  v19 = objc_opt_new();
  v20 = [(AAUICDPCustodianHook *)v18 initWithAccountManager:v10 contactsProvider:v19 cdpContext:v9];

  v26[2] = v20;
  v21 = [[AAUIAccountRecoveryManagementHook alloc] initWithAccountManager:v10 recoveryContactsViewModel:v15];

  v26[3] = v21;
  v22 = objc_opt_new();
  v26[4] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];
  [v14 addObjectsFromArray:v23];

  v24 = (void *)[v14 copy];
  return v24;
}

- (id)_personalInformationHooksForAccount:(id)a3 accountManager:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [(AAUIServerHookFactory *)self _defaultHooks:v6];
  id v9 = (void *)[v7 initWithArray:v8];

  id v10 = [AAUIAuthKitUpdateReachableEmailsHook alloc];
  id v11 = objc_msgSend(v6, "aa_altDSID");

  id v12 = [(AAUIAuthKitUpdateReachableEmailsHook *)v10 initWithAltDSID:v11];
  [v9 addObject:v12];

  v13 = (void *)[v9 copy];
  return v13;
}

@end