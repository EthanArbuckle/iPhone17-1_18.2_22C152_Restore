@interface ACDAccountStoreFilter
+ (ACDAccountStoreFilter)new;
- (ACDAccountStore)backingAccountStore;
- (ACDAccountStoreFilter)init;
- (ACDAccountStoreFilter)initWithBackingAccountStore:(id)a3;
- (BOOL)_accessGrantedForBundleID:(id)a3 onAccountTypeID:(id)a4;
- (BOOL)_accessGrantedForClient:(id)a3 onAccountTypeID:(id)a4;
- (BOOL)_clientHasPermissionToAddAccount:(id)a3;
- (BOOL)_isClientPermittedToAccessAccount:(id)a3;
- (BOOL)_isClientPermittedToAccessAccountTypeWithIdentifier:(id)a3;
- (BOOL)_isClientPermittedToRemoveAccount:(id)a3;
- (BOOL)_wildCardAuthorizationMatchingForAccountTypeIdentifier:(id)a3;
- (BOOL)isClientEntitledToAccessAccountTypeWithIdentifier:(id)a3;
- (id)_appPermissionsForAccountTypeIdentifier:(id)a3;
- (void)accessKeysForAccountType:(id)a3 handler:(id)a4;
- (void)accountExistsWithDescription:(id)a3 completion:(id)a4;
- (void)accountIdentifiersEnabledForDataclass:(id)a3 handler:(id)a4;
- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5;
- (void)accountIdentifiersEnabledToSyncDataclass:(id)a3 handler:(id)a4;
- (void)accountTypeWithIdentifier:(id)a3 handler:(id)a4;
- (void)accountTypesWithHandler:(id)a3;
- (void)accountWithIdentifier:(id)a3 handler:(id)a4;
- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 handler:(id)a5;
- (void)accountsWithAccountType:(id)a3 handler:(id)a4;
- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5;
- (void)accountsWithHandler:(id)a3;
- (void)accountsWithTypeIdentifier:(id)a3 propertyKey:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7;
- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4;
- (void)canSaveAccount:(id)a3 completion:(id)a4;
- (void)childAccountsForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)childAccountsWithAccountTypeIdentifier:(id)a3 parentAccountIdentifier:(id)a4 handler:(id)a5;
- (void)clearAllPermissionsGrantedForAccountType:(id)a3 withHandler:(id)a4;
- (void)clearGrantedPermissionsForAccountType:(id)a3 withHandler:(id)a4;
- (void)clientTokenForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)credentialForAccount:(id)a3 serviceID:(id)a4 handler:(id)a5;
- (void)credentialForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)credentialItemForAccount:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)credentialItemsWithCompletion:(id)a3;
- (void)dataclassActionsForAccountDeletion:(id)a3 completion:(id)a4;
- (void)dataclassActionsForAccountSave:(id)a3 completion:(id)a4;
- (void)dataclassesWithHandler:(id)a3;
- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4;
- (void)handleURL:(id)a3;
- (void)insertAccountType:(id)a3 withHandler:(id)a4;
- (void)insertCredentialItem:(id)a3 completion:(id)a4;
- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4;
- (void)isPushSupportedForAccount:(id)a3 completion:(id)a4;
- (void)isTetheredSyncingEnabledForDataclass:(id)a3 completion:(id)a4;
- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4;
- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4;
- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4;
- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4 options:(id)a5 completion:(id)a6;
- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6;
- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7;
- (void)parentAccountForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)permissionForAccountType:(id)a3 withHandler:(id)a4;
- (void)preloadDataclassOwnersWithCompletion:(id)a3;
- (void)provisionedDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)registerMonitorForAccountsOfTypes:(id)a3 propertiesToPrefetch:(id)a4 completion:(id)a5;
- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5;
- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)removeAccountType:(id)a3 withHandler:(id)a4;
- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4;
- (void)removeCredentialItem:(id)a3 completion:(id)a4;
- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 withHandler:(id)a5;
- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4;
- (void)runAccountMigrationPlugins:(id)a3;
- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5;
- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6;
- (void)saveAccount:(id)a3 withHandler:(id)a4;
- (void)saveCredentialItem:(id)a3 completion:(id)a4;
- (void)scheduleBackupIfNonexistent:(id)a3;
- (void)setClientBundleID:(id)a3 withHandler:(id)a4;
- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6;
- (void)shutdownAccountsD:(id)a3;
- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4;
- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4;
- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4;
- (void)triggerKeychainMigrationIfNecessary:(id)a3;
- (void)uidOfAccountsd:(id)a3;
- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation ACDAccountStoreFilter

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v9 identifier];
  BOOL v12 = [(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v11];

  if (v12)
  {
    v13 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__ACDAccountStoreFilter_accountsWithAccountType_options_completion___block_invoke;
    v17[3] = &unk_264320F18;
    v17[4] = self;
    id v18 = v10;
    [v13 accountsWithAccountType:v9 options:a4 completion:v17];
  }
  else
  {
    v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter accountsWithAccountType:handler:]();
    }

    v15 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v15);
    }

    v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

- (BOOL)_isClientPermittedToAccessAccount:(id)a3
{
  v4 = [a3 accountType];
  v5 = [v4 identifier];
  LOBYTE(self) = [(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v5];

  return (char)self;
}

- (BOOL)_isClientPermittedToAccessAccountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  if (-[ACDAccountStoreFilter isClientEntitledToAccessAccountTypeWithIdentifier:](self, "isClientEntitledToAccessAccountTypeWithIdentifier:", v4)|| (-[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore"), v5 = objc_claimAutoreleasedReturnValue(), [v5 client], v6 = objc_claimAutoreleasedReturnValue(), BOOL v7 = -[ACDAccountStoreFilter _accessGrantedForClient:onAccountTypeID:](self, "_accessGrantedForClient:onAccountTypeID:", v6, v4), v6, v5, v7))
  {
    BOOL v8 = 1;
  }
  else if ([v4 hasPrefix:*MEMORY[0x263EFAF30]])
  {
    BOOL v8 = [(ACDAccountStoreFilter *)self _wildCardAuthorizationMatchingForAccountTypeIdentifier:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)accountTypeWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 accountTypeWithIdentifier:v7 handler:v6];
}

- (BOOL)isClientEntitledToAccessAccountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v6 = [v5 client];
  char v7 = [v6 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v7) {
    goto LABEL_2;
  }
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  if ([v10 hasEntitlement:*MEMORY[0x263EFB2B8]])
  {
    if (([v4 isEqualToString:*MEMORY[0x263EFAE70]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFAEB8]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFAF60]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFAEE0]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFAE58]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFAEA8]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x263EFB000]] & 1) != 0)
    {
      goto LABEL_25;
    }
    char v11 = [v4 isEqualToString:*MEMORY[0x263EFAED0]];

    if (v11) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  BOOL v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v13 = [v12 client];
  if ([v13 hasEntitlement:*MEMORY[0x263EFB2F0]])
  {
    char v14 = [v4 isEqual:*MEMORY[0x263EFAF00]];

    if (v14) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  if ([v10 hasEntitlement:*MEMORY[0x263EFB338]])
  {
    if ([v4 isEqual:*MEMORY[0x263EFB000]])
    {
LABEL_25:
      char v8 = 1;
      goto LABEL_26;
    }
    char v15 = [v4 isEqual:*MEMORY[0x263EFB008]];

    if (v15) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  if ([v10 hasEntitlement:*MEMORY[0x263EFB2C8]])
  {
    if ([v4 isEqual:*MEMORY[0x263EFB000]]) {
      goto LABEL_25;
    }
    char v29 = [v4 isEqual:*MEMORY[0x263EFB008]];

    if (v29) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  v17 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v18 = [v17 client];
  if (![v18 hasEntitlement:*MEMORY[0x263EFB2C0]])
  {

LABEL_33:
    if ([v4 isEqual:*MEMORY[0x263EFAFF0]])
    {
      v20 = [(ACDAccountStoreFilter *)self backingAccountStore];
      v21 = [v20 client];
      char v22 = [v21 hasEntitlement:*MEMORY[0x263EFB330]];

      if (v22) {
        goto LABEL_2;
      }
    }
    if ([v4 isEqual:*MEMORY[0x263EFAFB8]])
    {
      v23 = [(ACDAccountStoreFilter *)self backingAccountStore];
      v24 = [v23 client];
      char v25 = [v24 hasEntitlement:*MEMORY[0x263EFB328]];

      if (v25) {
        goto LABEL_2;
      }
    }
    if ([v4 isEqual:*MEMORY[0x263EFAF90]])
    {
      v26 = [(ACDAccountStoreFilter *)self backingAccountStore];
      v27 = [v26 client];
      char v28 = [v27 hasEntitlement:*MEMORY[0x263EFB308]];

      if (v28) {
        goto LABEL_2;
      }
    }
    if (![v4 isEqual:*MEMORY[0x263EFAF80]])
    {
      char v8 = 0;
      goto LABEL_27;
    }
    id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
    id v10 = [v9 client];
    char v8 = [v10 hasEntitlement:*MEMORY[0x263EFB300]];
LABEL_26:

    goto LABEL_27;
  }
  char v19 = [v4 isEqualToString:*MEMORY[0x263EFAE68]];

  if ((v19 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_2:
  char v8 = 1;
LABEL_27:

  return v8;
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  char v11 = (void (**)(id, void, void *))a5;
  BOOL v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    char v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 accountsWithAccountTypeIdentifiers:v9 preloadedProperties:v10 completion:v11];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v19[3] = &unk_264321DD8;
    v19[4] = self;
    v16 = objc_msgSend(v9, "ac_filter:", v19);
    if ([v16 count])
    {
      v17 = [(ACDAccountStoreFilter *)self backingAccountStore];
      [v17 accountsWithAccountTypeIdentifiers:v16 preloadedProperties:v10 completion:v11];
    }
    else
    {
      id v18 = _ACDEntitlementLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v18);
      }

      v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
      v11[2](v11, 0, v17);
    }
  }
}

- (ACDAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (ACDAccountStoreFilter)initWithBackingAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDAccountStoreFilter;
  id v6 = [(ACDAccountStoreFilter *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingAccountStore, a3);
  }

  return v7;
}

void __68__ACDAccountStoreFilter_accountsWithAccountType_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

uint64_t __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isClientPermittedToAccessAccountTypeWithIdentifier:v3];
  if ((v4 & 1) == 0)
  {
    id v5 = _ACDLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_cold_1();
    }
  }
  return v4;
}

- (void)accountsWithAccountType:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identifier];
  BOOL v10 = [(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v9];

  if (v10)
  {
    uint64_t v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
    BOOL v12 = [v11 client];
    char v13 = [v12 hasEntitlement:*MEMORY[0x263EFB2F8]];

    long long v14 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__ACDAccountStoreFilter_accountsWithAccountType_handler___block_invoke;
    v18[3] = &unk_264321DB0;
    v18[4] = self;
    char v20 = v13;
    id v19 = v8;
    [v14 accountsWithAccountType:v7 handler:v18];
  }
  else
  {
    long long v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter accountsWithAccountType:handler:]();
    }

    long long v16 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v16);
    }

    long long v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
  }
}

- (void)accountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__ACDAccountStoreFilter_accountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264321D88;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 accountWithIdentifier:v7 handler:v10];
}

void __55__ACDAccountStoreFilter_accountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if ([v5 _isClientPermittedToAccessAccount:v8]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 withHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v11 _requestAccessForAccountTypeWithIdentifier:v10 options:v9 allowUserInteraction:1 withHandler:v8];
}

- (void)accessKeysForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 accessKeysForAccountType:v7 handler:v6];
}

- (void)registerMonitorForAccountsOfTypes:(id)a3 propertiesToPrefetch:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  id v19 = v9;
  uint64_t v13 = *(void *)v21;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      if (![(ACDAccountStoreFilter *)self isClientEntitledToAccessAccountTypeWithIdentifier:v16])
      {
        long long v17 = _ACLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v16;
          _os_log_error_impl(&dword_2183AD000, v17, OS_LOG_TYPE_ERROR, "\"Client is not entitled account type %@\"", buf, 0xCu);
        }

        char v14 = 0;
      }
    }
    uint64_t v12 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v12);
  id v9 = v19;
  if ((v14 & 1) == 0)
  {
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v10[2](v10, 0, v18);
  }
  else
  {
LABEL_13:
    id v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v18 registerMonitorForAccountsOfTypes:v8 propertiesToPrefetch:v9 completion:v10];
  }
}

- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 enabledDataclassesForAccountWithIdentifier:v7 handler:v6];
}

- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 tetheredSyncSourceTypeForDataclass:v7 completion:v8];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2E0]];

  if (v11)
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 setClientBundleID:v7 withHandler:v8];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)accountIdentifiersEnabledForDataclass:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 accountIdentifiersEnabledForDataclass:v7 handler:v8];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

void __57__ACDAccountStoreFilter_accountsWithAccountType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)
          && (*(unsigned char *)(a1 + 48) || [v13 isActive]))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accountIdentifiersEnabledToSyncDataclass:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  uint64_t v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 accountIdentifiersEnabledToSyncDataclass:v7 handler:v8];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

+ (ACDAccountStoreFilter)new
{
  return 0;
}

- (ACDAccountStoreFilter)init
{
  return 0;
}

- (BOOL)_accessGrantedForClient:(id)a3 onAccountTypeID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v9 = [v8 authorizationManager];
  uint64_t v10 = [v9 authorizationForClient:v7 accountTypeWithIdentifier:v6];

  LOBYTE(v7) = [v10 isGranted];
  return (char)v7;
}

- (BOOL)_accessGrantedForBundleID:(id)a3 onAccountTypeID:(id)a4
{
  id v6 = a4;
  id v7 = +[ACDClient clientWithBundleID:a3];
  LOBYTE(self) = [(ACDAccountStoreFilter *)self _accessGrantedForClient:v7 onAccountTypeID:v6];

  return (char)self;
}

- (BOOL)_wildCardAuthorizationMatchingForAccountTypeIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(ACDAccountStoreFilter *)self _appPermissionsForAccountTypeIdentifier:a3];
  [v4 allKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v17 = v4;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"self like %@", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        int v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
        uint64_t v12 = [v11 client];
        uint64_t v13 = [v12 bundleID];
        char v14 = [v10 evaluateWithObject:v13];

        if (v14)
        {
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    BOOL v15 = 0;
LABEL_11:
    uint64_t v4 = v17;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_appPermissionsForAccountTypeIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v6 = [v5 authorizationManager];
  uint64_t v7 = [v6 allAuthorizationsForAccountTypeWithIdentifier:v4];

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "isGranted", (void)v19));
        long long v16 = [v14 client];
        long long v17 = [v16 bundleID];

        if (v17) {
          [v8 setValue:v15 forKey:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_isClientPermittedToRemoveAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v6 = [v4 accountType];
  uint64_t v7 = [v6 identifier];
  id v8 = [v5 accountTypeWithIdentifier:v7];

  id v9 = [v4 owningBundleID];

  uint64_t v10 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v11 = [v10 client];
  LOBYTE(v7) = [v11 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v7) {
    goto LABEL_2;
  }
  uint64_t v13 = [v8 identifier];
  if ([v13 isEqualToString:*MEMORY[0x263EFAFF0]])
  {
    char v14 = [(ACDAccountStoreFilter *)self backingAccountStore];
    BOOL v15 = [v14 client];
    char v16 = [v15 hasEntitlement:*MEMORY[0x263EFB330]];

    if (v16) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  long long v17 = [v8 identifier];
  if (([v17 isEqualToString:*MEMORY[0x263EFAEE0]] & 1) == 0)
  {

LABEL_11:
    long long v21 = [(ACDAccountStoreFilter *)self backingAccountStore];
    long long v22 = [v21 client];
    uint64_t v23 = [v22 bundleID];
    char v12 = [v23 isEqualToString:v9];

    goto LABEL_12;
  }
  long long v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
  long long v19 = [v18 client];
  char v20 = [v19 hasEntitlement:*MEMORY[0x263EFB2B8]];

  if ((v20 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_2:
  char v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)_clientHasPermissionToAddAccount:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v7 = [v6 client];
  char v8 = [v7 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v8) {
    goto LABEL_47;
  }
  id v9 = [v5 accountType];
  uint64_t v10 = [v9 identifier];
  if ([v10 isEqualToString:*MEMORY[0x263EFAE70]])
  {
    uint64_t v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
    char v12 = [v11 client];
    char v13 = [v12 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v13) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  char v14 = [v5 accountType];
  BOOL v15 = [v14 identifier];
  if ([v15 isEqualToString:*MEMORY[0x263EFAEB8]])
  {
    char v16 = [(ACDAccountStoreFilter *)self backingAccountStore];
    long long v17 = [v16 client];
    char v18 = [v17 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v18) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  long long v19 = [v5 accountType];
  char v20 = [v19 identifier];
  if ([v20 isEqualToString:*MEMORY[0x263EFAF60]])
  {
    long long v21 = [(ACDAccountStoreFilter *)self backingAccountStore];
    long long v22 = [v21 client];
    char v23 = [v22 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v23) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v24 = [v5 accountType];
  uint64_t v25 = [v24 identifier];
  if ([v25 isEqualToString:*MEMORY[0x263EFAEE0]])
  {
    v26 = [(ACDAccountStoreFilter *)self backingAccountStore];
    uint64_t v27 = [v26 client];
    char v28 = [v27 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v28) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  char v29 = [v5 accountType];
  v30 = [v29 identifier];
  if ([v30 isEqualToString:*MEMORY[0x263EFAE58]])
  {
    v31 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v32 = [v31 client];
    char v33 = [v32 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v33) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  v34 = [v5 accountType];
  v35 = [v34 identifier];
  v36 = (void *)*MEMORY[0x263EFB000];
  if ([v35 isEqualToString:*MEMORY[0x263EFB000]])
  {
    v37 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v38 = [v37 client];
    uint64_t v3 = [v38 hasEntitlement:*MEMORY[0x263EFB2B8]];

    if (v3) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  v39 = [v5 accountType];
  v40 = [v39 identifier];
  uint64_t v41 = [v40 isEqualToString:v36];
  if ((v41 & 1) == 0)
  {
    v42 = [v5 accountType];
    uint64_t v3 = [v42 identifier];
    if (![(id)v3 isEqualToString:*MEMORY[0x263EFB008]])
    {

      goto LABEL_34;
    }
    v68 = v42;
  }
  v43 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v44 = [v43 client];
  char v45 = [v44 hasEntitlement:*MEMORY[0x263EFB338]];

  if ((v41 & 1) == 0)
  {
  }
  if (v45) {
    goto LABEL_47;
  }
LABEL_34:
  v46 = [v5 accountType];
  v47 = [v46 identifier];
  char v48 = [v47 isEqualToString:v36];
  if ((v48 & 1) != 0
    || ([v5 accountType],
        v36 = objc_claimAutoreleasedReturnValue(),
        [v36 identifier],
        uint64_t v41 = objc_claimAutoreleasedReturnValue(),
        [(id)v41 isEqualToString:*MEMORY[0x263EFB008]]))
  {
    v49 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v50 = [v49 client];
    char v51 = [v50 hasEntitlement:*MEMORY[0x263EFB2C8]];

    if ((v48 & 1) == 0)
    {
    }
    if (v51) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  v52 = [v5 accountType];
  v53 = [v52 identifier];
  if ([v53 isEqualToString:*MEMORY[0x263EFAFF0]])
  {
    v54 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v55 = [v54 client];
    char v56 = [v55 hasEntitlement:*MEMORY[0x263EFB330]];

    if (v56) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  v57 = [v5 accountType];
  v58 = [v57 identifier];
  if ([v58 isEqual:*MEMORY[0x263EFAF00]])
  {
    v59 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v60 = [v59 client];
    char v61 = [v60 hasEntitlement:*MEMORY[0x263EFB2F0]];

    if (v61)
    {
LABEL_47:
      char v62 = 1;
      goto LABEL_48;
    }
  }
  else
  {
  }
  v64 = [v5 accountType];
  v65 = [v64 identifier];
  if ([v65 isEqual:*MEMORY[0x263EFAF90]])
  {
    v66 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v67 = [v66 client];
    char v62 = [v67 hasEntitlement:*MEMORY[0x263EFB308]];
  }
  else
  {
    char v62 = 0;
  }

LABEL_48:
  return v62;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v4 setNotificationsEnabled:v3];
}

- (void)accountsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ACDAccountStoreFilter_accountsWithHandler___block_invoke;
  v7[3] = &unk_264320F18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 accountsWithHandler:v7];
}

void __45__ACDAccountStoreFilter_accountsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accountTypesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v5 accountTypesWithHandler:v4];
}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 handler:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  id v27 = v10;
  id v28 = v9;
  uint64_t v13 = *(void *)v33;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      if (![(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v16])
      {
        long long v17 = _ACDLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          char v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
          uint64_t v19 = [v18 client];
          *(_DWORD *)buf = 138412546;
          v37 = v19;
          __int16 v38 = 2112;
          uint64_t v39 = v16;
          _os_log_error_impl(&dword_2183AD000, v17, OS_LOG_TYPE_ERROR, "\"Client %@ is not allowed to access accounts of type %@.\"", buf, 0x16u);
        }
        char v14 = 0;
      }
    }
    uint64_t v12 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  }
  while (v12);
  id v10 = v27;
  id v9 = v28;
  if ((v14 & 1) == 0)
  {
    uint64_t v24 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v24);
    }

    uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    (*((void (**)(id, void, void *))v27 + 2))(v27, 0, v25);
  }
  else
  {
LABEL_13:
    char v20 = [(ACDAccountStoreFilter *)self backingAccountStore];
    long long v21 = [v20 client];
    char v22 = [v21 hasEntitlement:*MEMORY[0x263EFB2F8]];

    char v23 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __84__ACDAccountStoreFilter_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke;
    v29[3] = &unk_264321DB0;
    v29[4] = self;
    char v31 = v22;
    id v30 = v10;
    [v23 accountsOnPairedDeviceWithAccountTypes:v8 withOptions:v9 handler:v29];
  }
}

void __84__ACDAccountStoreFilter_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)
          && (*(unsigned char *)(a1 + 48) || [v13 isActive]))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)parentAccountForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__ACDAccountStoreFilter_parentAccountForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264321D88;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 parentAccountForAccountWithIdentifier:v7 handler:v10];
}

void __71__ACDAccountStoreFilter_parentAccountForAccountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if ([v5 _isClientPermittedToAccessAccount:v8]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)childAccountsForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__ACDAccountStoreFilter_childAccountsForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264320F18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 childAccountsForAccountWithIdentifier:v7 handler:v10];
}

void __71__ACDAccountStoreFilter_childAccountsForAccountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accountExistsWithDescription:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 accountExistsWithDescription:v7 completion:v6];
}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__ACDAccountStoreFilter_kerberosAccountsForDomainFromURL_completion___block_invoke;
  v10[3] = &unk_264320F18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 kerberosAccountsForDomainFromURL:v7 completion:v10];
}

void __69__ACDAccountStoreFilter_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (void)v14)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)childAccountsWithAccountTypeIdentifier:(id)a3 parentAccountIdentifier:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if ([(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v9])
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 childAccountsWithAccountTypeIdentifier:v9 parentAccountIdentifier:v10 handler:v11];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v12);
  }
}

- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 displayAccountTypeForAccountWithIdentifier:v7 handler:v6];
}

- (void)credentialForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 credentialForAccountWithIdentifier:v7 handler:v6];
}

- (void)credentialForAccount:(id)a3 serviceID:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void, void *))a5;
  if ([(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccount:v9])
  {
    uint64_t v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 credentialForAccount:v9 serviceID:v10 handler:v11];
  }
  else
  {
    uint64_t v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v12);
  }
}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v14 = (void (**)(id, void, void *))a6;
  if ([(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccount:v12])
  {
    long long v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 setCredential:v11 forAccount:v12 serviceID:v13 completion:v14];
  }
  else
  {
    long long v16 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v16);
    }

    long long v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v14[2](v14, 0, v15);
  }
}

- (void)credentialItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v5 credentialItemsWithCompletion:v4];
}

- (void)credentialItemForAccount:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v11 credentialItemForAccount:v10 serviceName:v9 completion:v8];
}

- (void)insertCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 insertCredentialItem:v7 completion:v6];
}

- (void)saveCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 saveCredentialItem:v7 completion:v6];
}

- (void)removeCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 removeCredentialItem:v7 completion:v6];
}

- (void)provisionedDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 provisionedDataclassesForAccountWithIdentifier:v7 handler:v6];
}

- (void)dataclassesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v5 dataclassesWithHandler:v4];
}

- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 supportedDataclassesForAccountType:v7 handler:v6];
}

- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 syncableDataclassesForAccountType:v7 handler:v6];
}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v5 preloadDataclassOwnersWithCompletion:v4];
}

- (void)dataclassActionsForAccountSave:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 dataclassActionsForAccountSave:v7 completion:v6];
}

- (void)dataclassActionsForAccountDeletion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 dataclassActionsForAccountDeletion:v7 completion:v6];
}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 isPerformingDataclassActionsForAccount:v7 completion:v6];
}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v9 _setAccountStore:v12];

  if ([(ACDAccountStoreFilter *)self _isClientPermittedToRemoveAccount:v9])
  {
    id v13 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v13 removeAccount:v9 withDataclassActions:v10 completion:v11];
  }
  else
  {
    long long v14 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v14);
    }

    long long v15 = NSString;
    long long v16 = [v9 accountType];
    long long v17 = [v16 accountTypeDescription];
    id v13 = [v15 stringWithFormat:@"The application is not permitted to delete %@ accounts", v17];

    char v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263EFB070];
    char v20 = [NSDictionary dictionaryWithObject:v13 forKey:*MEMORY[0x263F08320]];
    long long v21 = [v18 errorWithDomain:v19 code:7 userInfo:v20];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v21);
  }
}

- (void)canSaveAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 canSaveAccount:v7 completion:v6];
}

- (void)saveAccount:(id)a3 withHandler:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v7 _setAccountStore:v9];

  id v10 = [v7 accountType];
  id v11 = [v10 identifier];
  BOOL v12 = [(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v11];

  if (v12)
  {
    if ([(ACDAccountStoreFilter *)self _clientHasPermissionToAddAccount:v7])
    {
      id v13 = [(ACDAccountStoreFilter *)self backingAccountStore];
      [v13 saveAccount:v7 withHandler:v8];

      goto LABEL_13;
    }
    char v22 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v22);
    }

    char v23 = NSString;
    uint64_t v24 = [(ACDAccountStoreFilter *)self backingAccountStore];
    uint64_t v25 = [v24 client];
    v26 = [v25 pid];
    char v18 = [v23 stringWithFormat:@"PID %@ does not have permission to add an account", v26];

    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263EFB070];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = v18;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  }
  else
  {
    long long v14 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v14);
    }

    long long v15 = NSString;
    long long v16 = [v7 accountType];
    long long v17 = [v16 accountTypeDescription];
    char v18 = [v15 stringWithFormat:@"The application is not permitted to access %@ accounts", v17];

    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263EFB070];
    uint64_t v21 = [NSDictionary dictionaryWithObject:v18 forKey:*MEMORY[0x263F08320]];
  }
  id v27 = (void *)v21;
  id v28 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

  char v29 = _ACDLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter saveAccount:withHandler:]((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);
  }

  v8[2](v8, 0, v28);
LABEL_13:
}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  v41[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  long long v14 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v11 _setAccountStore:v14];

  long long v15 = [v11 accountType];
  long long v16 = [v15 identifier];
  BOOL v17 = [(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v16];

  if (v17)
  {
    if ([(ACDAccountStoreFilter *)self _clientHasPermissionToAddAccount:v11])
    {
      char v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
      [v18 saveAccount:v11 verify:v8 dataclassActions:v12 completion:v13];

      goto LABEL_13;
    }
    id v27 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v27);
    }

    id v28 = NSString;
    char v29 = [(ACDAccountStoreFilter *)self backingAccountStore];
    uint64_t v30 = [v29 client];
    char v23 = [v28 stringWithFormat:@"%@ does not have permission to add an account", v30];

    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263EFB070];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41[0] = v23;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  }
  else
  {
    uint64_t v19 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v19);
    }

    uint64_t v20 = NSString;
    uint64_t v21 = [v11 accountType];
    char v22 = [v21 accountTypeDescription];
    char v23 = [v20 stringWithFormat:@"The application is not permitted to access %@ accounts", v22];

    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263EFB070];
    uint64_t v26 = [NSDictionary dictionaryWithObject:v23 forKey:*MEMORY[0x263F08320]];
  }
  uint64_t v31 = (void *)v26;
  uint64_t v32 = [v24 errorWithDomain:v25 code:7 userInfo:v26];

  uint64_t v33 = _ACDLogSystem();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter saveAccount:withHandler:]((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);
  }

  v13[2](v13, 0, v32);
LABEL_13:
}

- (void)insertAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 insertAccountType:v7 withHandler:v6];
}

- (void)removeAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 removeAccountType:v7 withHandler:v6];
}

- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 appPermissionsForAccountType:v7 withHandler:v6];
}

- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
  long long v16 = [v15 client];
  int v17 = [v16 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v17)
  {
    char v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v18 setPermissionGranted:v11 forBundleID:v12 onAccountType:v13 withHandler:v14];
  }
  else
  {
    uint64_t v19 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v19);
    }

    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263EFB070];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"You are not allowed to modify the authorization model.";
    char v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    char v23 = [v20 errorWithDomain:v21 code:7 userInfo:v22];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v23);
  }
}

- (void)permissionForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 permissionForAccountType:v7 withHandler:v6];
}

- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 grantedPermissionsForAccountType:v7 withHandler:v6];
}

- (void)clearGrantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v8 clearGrantedPermissionsForAccountType:v7 withHandler:v6];
}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3 withHandler:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 clearAllPermissionsGrantedForAccountType:v7 withHandler:v8];
  }
  else
  {
    id v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263EFB070];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = @"You are not allowed to modify the authorization model.";
    long long v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    int v17 = [v14 errorWithDomain:v15 code:7 userInfo:v16];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v17);
  }
}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v11 verifyCredentialsForAccount:v10 options:v9 completion:v8];
}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v9 _setAccountStore:v12];

  id v13 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v14 = [v13 client];
  if ([v14 hasEntitlement:*MEMORY[0x263EFB2B0]])
  {

    goto LABEL_3;
  }
  uint64_t v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
  long long v16 = [v15 client];
  char v17 = [v16 hasEntitlement:*MEMORY[0x263EFB2B8]];

  if (v17) {
    goto LABEL_5;
  }
  uint64_t v19 = [v9 accountType];
  id v13 = [v19 identifier];

  uint64_t v20 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v21 = [v20 client];
  BOOL v22 = [(ACDAccountStoreFilter *)self _accessGrantedForClient:v21 onAccountTypeID:v13];

  if (v22)
  {
LABEL_3:

LABEL_5:
    uint64_t v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v18 renewCredentialsForAccount:v9 options:v10 completion:v11];
    goto LABEL_6;
  }
  char v23 = [v9 accountType];
  uint64_t v24 = [v23 identifier];
  int v25 = [v24 hasPrefix:*MEMORY[0x263EFAF30]];

  if (v25)
  {
    BOOL v26 = [(ACDAccountStoreFilter *)self _wildCardAuthorizationMatchingForAccountTypeIdentifier:v13];

    if (v26) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v27 = _ACDLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter renewCredentialsForAccount:options:completion:]();
  }

  id v28 = _ACDEntitlementLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v28);
  }

  uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
  v11[2](v11, &unk_26C998A00, v18);
LABEL_6:
}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  [v7 _setAccountStore:v9];

  id v10 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v11 = [v10 client];
  if ([v11 hasEntitlement:*MEMORY[0x263EFB2B0]])
  {

LABEL_4:
    uint64_t v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 migrateCredentialForAccount:v7 completion:v8];
    goto LABEL_10;
  }
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B8]];

  if (v14) {
    goto LABEL_4;
  }
  long long v16 = _ACDLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter migrateCredentialForAccount:completion:]();
  }

  char v17 = _ACDEntitlementLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v17);
  }

  uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
  v8[2](v8, 0, v15);
LABEL_10:
}

- (void)isTetheredSyncingEnabledForDataclass:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 isTetheredSyncingEnabledForDataclass:v7 completion:v8];
  }
  else
  {
    id v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)isPushSupportedForAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 isPushSupportedForAccount:v7 completion:v8];
  }
  else
  {
    id v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    uint64_t v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 accountIdentifiersEnabledForDataclasses:v9 withAccountTypeIdentifiers:v10 completion:v11];
  }
  else
  {
    long long v16 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v16);
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v15);
  }
}

- (void)handleURL:(id)a3
{
  id v8 = a3;
  id v4 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v5 = [v4 client];
  int v6 = [v5 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v6)
  {
    id v7 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v7 handleURL:v8];
  }
}

- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    uint64_t v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 addClientToken:v9 forAccountIdentifier:v10 completion:v11];
  }
  else
  {
    long long v16 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v16);
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v15);
  }
}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    uint64_t v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 discoverPropertiesForAccount:v9 options:v10 completion:v11];
  }
  else
  {
    long long v16 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v16);
    }

    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v15);
  }
}

- (void)clientTokenForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 clientTokenForAccountIdentifier:v7 completion:v8];
  }
  else
  {
    id v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, void, void *))a6;
  int v14 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v15 = [v14 client];
  int v16 = [v15 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v16)
  {
    char v17 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v17 openAuthenticationURL:v11 forAccount:v12 shouldConfirm:v7 completion:v13];
  }
  else
  {
    uint64_t v18 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v18);
    }

    char v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v13[2](v13, 0, v17);
  }
}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  char v17 = [(ACDAccountStoreFilter *)self backingAccountStore];
  uint64_t v18 = [v17 client];
  int v19 = [v18 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v19)
  {
    uint64_t v20 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v20 openAuthenticationURLForAccount:v13 withDelegateClassName:v14 fromBundleAtPath:v15 shouldConfirm:v8 completion:v16];
  }
  else
  {
    uint64_t v21 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v21);
    }

    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    (*((void (**)(id, void, void, void *))v16 + 2))(v16, 0, 0, v20);
  }
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  id v7 = a3;
  BOOL v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 visibleTopLevelAccountsWithAccountTypeIdentifiers:v7 completion:v8];
  }
  else
  {
    id v13 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v13);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 notifyRemoteDevicesOfModifiedAccount:v7 withChangeType:v8];
  }
  else
  {
    id v13 = _ACLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter notifyRemoteDevicesOfModifiedAccount:withChangeType:]();
    }

    id v14 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v14);
    }
  }
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4 options:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a6;
  id v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v16 = [v15 client];
  int v17 = [v16 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v17)
  {
    uint64_t v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v18 notifyRemoteDevicesOfModifiedAccount:v11 withChangeType:v12 options:v13 completion:v14];
  }
  else
  {
    int v19 = _ACLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter notifyRemoteDevicesOfModifiedAccount:withChangeType:]();
    }

    uint64_t v20 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v20);
    }

    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v14[2](v14, 0, v18);
  }
}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    id v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 saveAccount:v9 toPairedDeviceWithOptions:v10 completion:v11];
  }
  else
  {
    id v16 = _ACLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter saveAccount:toPairedDeviceWithOptions:completion:]();
    }

    int v17 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v17);
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v15);
  }
}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 removeAccountsFromPairedDeviceWithOptions:v7 completion:v8];
  }
  else
  {
    id v13 = _ACLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter removeAccountsFromPairedDeviceWithOptions:completion:]();
    }

    int v14 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v14);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v13 = [v12 client];
  int v14 = [v13 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v14)
  {
    id v15 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v15 removeAccountFromPairedDevice:v9 withOptions:v10 completion:v11];
  }
  else
  {
    id v16 = _ACLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter removeAccountFromPairedDevice:withOptions:completion:]((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);
    }

    char v23 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v23);
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v11[2](v11, 0, v15);
  }
}

- (void)triggerKeychainMigrationIfNecessary:(id)a3
{
  id v5 = a3;
  int v6 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v7 = [v6 client];
  int v8 = [v7 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v8)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 triggerKeychainMigrationIfNecessary:v5];
  }
  else
  {
    id v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter triggerKeychainMigrationIfNecessary:]();
    }

    id v10 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v10);
    }

    int v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);
  }
}

- (void)runAccountMigrationPlugins:(id)a3
{
  id v5 = a3;
  int v6 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v7 = [v6 client];
  int v8 = [v7 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v8)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 runAccountMigrationPlugins:v5];
  }
  else
  {
    id v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter runAccountMigrationPlugins:]();
    }

    id v10 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v10);
    }

    int v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);
  }
}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  id v5 = a3;
  int v6 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v7 = [v6 client];
  int v8 = [v7 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v8)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 scheduleBackupIfNonexistent:v5];
  }
  else
  {
    id v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter scheduleBackupIfNonexistent:]();
    }

    id v10 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v10);
    }

    int v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);
  }
}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, void *))a4;
  id v9 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v10 = [v9 client];
  int v11 = [v10 hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v11)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 resetDatabaseToVersion:v7 withCompletion:v8];
  }
  else
  {
    id v13 = _ACLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter resetDatabaseToVersion:withCompletion:]();
    }

    int v14 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v14);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v8[2](v8, 0, v12);
  }
}

- (void)shutdownAccountsD:(id)a3
{
  id v5 = a3;
  int v6 = [(ACDAccountStoreFilter *)self backingAccountStore];
  id v7 = [v6 client];
  int v8 = [v7 hasEntitlement:*MEMORY[0x263EFB320]];

  if (v8)
  {
    id v12 = [(ACDAccountStoreFilter *)self backingAccountStore];
    [v12 shutdownAccountsD:v5];
  }
  else
  {
    id v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter shutdownAccountsD:]();
    }

    id v10 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v10);
    }

    int v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);
  }
}

- (void)accountsWithTypeIdentifier:(id)a3 propertyKey:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([(ACDAccountStoreFilter *)self _isClientPermittedToAccessAccountTypeWithIdentifier:v13])
  {
    uint64_t v18 = [(ACDAccountStoreFilter *)self backingAccountStore];
    uint64_t v19 = [v18 client];
    char v20 = [v19 hasEntitlement:*MEMORY[0x263EFB2F8]];

    uint64_t v21 = [(ACDAccountStoreFilter *)self backingAccountStore];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __93__ACDAccountStoreFilter_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke;
    v24[3] = &unk_264321E00;
    char v26 = v20;
    id v25 = v17;
    [v21 accountsWithTypeIdentifier:v13 propertyKey:v14 value:v15 cacheSuffix:v16 completion:v24];

    uint64_t v22 = v25;
  }
  else
  {
    char v23 = _ACDEntitlementLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStoreFilter setClientBundleID:withHandler:](self, a2, v23);
    }

    uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:9 userInfo:0];
    (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v22);
  }
}

void __93__ACDAccountStoreFilter_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 40)
          || objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isActive", (void)v14))
        {
          objc_msgSend(v7, "addObject:", v13, (void)v14);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uidOfAccountsd:(id)a3
{
  id v5 = a3;
  uint64_t v4 = geteuid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)accountsWithAccountType:handler:.cold.2()
{
  OUTLINED_FUNCTION_23();
  v2 = [v1 backingAccountStore];
  BOOL v3 = [v2 client];
  uint64_t v4 = [v0 identifier];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v5, v6, "\"Client %@ is not allowed to access accounts of type %@.\"", v7, v8, v9, v10, v11);
}

- (void)saveAccount:(uint64_t)a3 withHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renewCredentialsForAccount:options:completion:.cold.2()
{
  OUTLINED_FUNCTION_23();
  id v1 = [v0 backingAccountStore];
  v2 = [v1 client];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v3, v4, "\"Cannot renew credentials because %@ is not entitled or permitted to access to account %@.\"", v5, v6, v7, v8, v9);
}

- (void)migrateCredentialForAccount:completion:.cold.2()
{
  OUTLINED_FUNCTION_23();
  id v1 = [v0 backingAccountStore];
  v2 = [v1 client];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v3, v4, "\"Cannot migrate credentials because %@ is not entitled or permitted to access to account %@.\"", v5, v6, v7, v8, v9);
}

void __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_23();
  id v1 = [*v0 backingAccountStore];
  v2 = [v1 client];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v3, v4, "\"Client (%@) attempted to access restricted account type: %@\"", v5, v6, v7, v8, v9);
}

- (void)notifyRemoteDevicesOfModifiedAccount:withChangeType:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client not entitled to send account via IDS proxy\"", v2, v3, v4, v5, v6);
}

- (void)saveAccount:toPairedDeviceWithOptions:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client not entitled to send accounts to paired devices.\"", v2, v3, v4, v5, v6);
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client not entitled to remove accounts from paired devices.\"", v2, v3, v4, v5, v6);
}

- (void)removeAccountFromPairedDevice:(uint64_t)a3 withOptions:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)triggerKeychainMigrationIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client is not entitled to migrate keychain items.\"", v2, v3, v4, v5, v6);
}

- (void)runAccountMigrationPlugins:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client is not entitled to initiate a migration plugin.\"", v2, v3, v4, v5, v6);
}

- (void)scheduleBackupIfNonexistent:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client is not entitled to schedule backups.\"", v2, v3, v4, v5, v6);
}

- (void)resetDatabaseToVersion:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client is not entitled to reset database version.\"", v2, v3, v4, v5, v6);
}

- (void)shutdownAccountsD:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Client is not entitled to shutdown accountsd\"", v2, v3, v4, v5, v6);
}

@end