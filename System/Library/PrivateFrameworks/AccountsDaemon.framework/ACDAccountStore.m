@interface ACDAccountStore
+ (id)accountCache;
- (ACDAccessPluginManager)accessPluginManager;
- (ACDAccountNotifier)accountNotifier;
- (ACDAccountStore)init;
- (ACDAccountStore)initWithClient:(id)a3 databaseConnection:(id)a4;
- (ACDAccountStoreDelegate)delegate;
- (ACDAuthenticationDialogManager)authenticationDialogManager;
- (ACDAuthenticationPluginManager)authenticationPluginManager;
- (ACDClient)client;
- (ACDClientAuthorizationManager)authorizationManager;
- (ACDDatabaseBackupActivity)databaseBackupActivity;
- (ACDDatabaseConnection)databaseConnection;
- (ACDDataclassOwnersManager)dataclassOwnersManager;
- (ACRemoteDeviceProxy)remoteDeviceProxy;
- (BOOL)_canManagedAccountType:(id)a3 syncManagedDataclass:(id)a4;
- (BOOL)_canSaveAccount:(id)a3 error:(id *)a4;
- (BOOL)_handleAccountAdd:(id)a3 withDataclassActions:(id)a4 error:(id *)a5;
- (BOOL)_handleAccountMod:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5;
- (BOOL)_isManagedAccount:(id)a3 enabledForManagedDataclass:(id)a4;
- (BOOL)_performDataclassActions:(id)a3 forAccount:(id)a4 error:(id *)a5;
- (BOOL)_removeAccountNoSave:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5;
- (BOOL)_saveWithError:(id *)a3;
- (BOOL)_updateAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5;
- (BOOL)accountsExistWithAccountTypeIdentifier:(id)a3;
- (BOOL)isMigrationInProgress;
- (BOOL)notificationsEnabled;
- (BOOL)shouldPreventAccountCreationWithObsoleteAccountType;
- (id)_accountTypeWithIdentifier:(id)a3;
- (id)_accountWithIdentifier:(id)a3;
- (id)_accountWithIdentifier:(id)a3 prefetchKeypaths:(id)a4;
- (id)_accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)_accountsWithAcountType:(id)a3 error:(id *)a4;
- (id)_addAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5;
- (id)_allAccounts_sync;
- (id)_childAccountsForAccountWithID:(id)a3;
- (id)_clientTokenForAccountIdentifier:(id)a3 error:(id)a4;
- (id)_clientTokenQueue;
- (id)_commitOrRollbackDataclassActions:(id)a3 forAccount:(id)a4 originalEnabledDataclasses:(id)a5;
- (id)_credentialItemWithAccountIdentifier:(id)a3 serviceName:(id)a4;
- (id)_dataclassWithName:(id)a3 createIfNecessary:(BOOL)a4;
- (id)_displayAccountForAccount:(id)a3;
- (id)_legacyCredentialForAccount:(id)a3 client:(id)a4 error:(id *)a5;
- (id)_lockForAccountType:(id)a3;
- (id)_predicateForFetchingAccountsWithManagedAccountTypeID:(id)a3 options:(unint64_t)a4;
- (id)_sync_accountWithIdentifier:(id)a3;
- (id)accountTypeWithIdentifier:(id)a3;
- (id)accountsWithAccountTypeIdentifier:(id)a3;
- (id)clientTokenForAccount:(id)a3;
- (id)masterCredentialForAccountIdentifier:(id)a3;
- (id)remoteAccountStoreSession;
- (void)_completeSave:(id)a3 dataclassActions:(id)a4 completion:(id)a5;
- (void)_delegate_accountStoreDidSaveAccount:(id)a3 changeType:(int)a4;
- (void)_deleteAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5;
- (void)_pruneDuplicateAccountsForAccountType:(id)a3 withUserName:(id)a4 error:(id *)a5;
- (void)_removeClientTokenForAccountIdentifer:(id)a3;
- (void)_requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 allowUserInteraction:(BOOL)a5 withHandler:(id)a6;
- (void)_setAccountManagedObjectRelationships:(id)a3 withAccount:(id)a4 oldAccount:(id)a5 error:(id *)a6;
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
- (void)addAccountNoSave:(id)a3 error:(id *)a4;
- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4;
- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4;
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
- (void)deleteAccountNoSave:(id)a3 error:(id *)a4;
- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4;
- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4;
- (void)handleURL:(id)a3;
- (void)init;
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
- (void)saveAccount:(id)a3 pid:(id)a4 verify:(BOOL)a5 dataclassActions:(id)a6 completion:(id)a7;
- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5;
- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6;
- (void)saveAccount:(id)a3 withHandler:(id)a4;
- (void)saveCredentialItem:(id)a3 completion:(id)a4;
- (void)scheduleBackupIfNonexistent:(id)a3;
- (void)setAccessPluginManager:(id)a3;
- (void)setAccountNotifier:(id)a3;
- (void)setAuthenticationDialogManager:(id)a3;
- (void)setAuthenticationPluginManager:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientBundleID:(id)a3 withHandler:(id)a4;
- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6;
- (void)setDatabaseBackupActivity:(id)a3;
- (void)setDataclassOwnersManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMigrationInProgress:(BOOL)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6;
- (void)setRemoteDeviceProxy:(id)a3;
- (void)shutdownAccountsD:(id)a3;
- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4;
- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4;
- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4;
- (void)triggerKeychainMigrationIfNecessary:(id)a3;
- (void)uidOfAccountsd:(id)a3;
- (void)updateAccountNoSave:(id)a3 error:(id *)a4;
- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation ACDAccountStore

- (ACDClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (ACDClient *)WeakRetained;
}

- (id)accountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v5 = +[ACDAccountStore accountCache];
  id v18 = [v5 cachedAccountTypeForID:v4];

  v6 = (void *)v14[5];
  if (v6)
  {
    [v6 setAccountStore:self];
  }
  else
  {
    v7 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__ACDAccountStore_accountTypeWithIdentifier___block_invoke;
    v10[3] = &unk_264320CA0;
    v10[4] = self;
    id v11 = v4;
    v12 = &v13;
    [v7 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)accountTypeWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  if (v6)
  {
    id v8 = +[ACDAccountStore accountCache];
    uint64_t v9 = [v8 cachedAccountTypeForID:v6];
    v10 = (void *)v18[5];
    v18[5] = v9;

    id v11 = (void *)v18[5];
    if (v11)
    {
      [v11 setAccountStore:self];
    }
    else
    {
      v12 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke;
      v13[3] = &unk_264320CA0;
      id v14 = v6;
      uint64_t v15 = self;
      v16 = &v17;
      [v12 performBlockAndWait:v13];
    }
  }
  v7[2](v7, v18[5], 0);
  _Block_object_dispose(&v17, 8);
}

void __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = +[ACDAccountStore accountCache];
  v3 = [*(id *)(a1 + 32) firstObject];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2;
  v16[3] = &unk_2643213F0;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v11.i64[0];
  int8x16_t v17 = vextq_s8(v11, v11, 8uLL);
  id v18 = *(id *)(a1 + 48);
  v5 = [v2 cachedAccountsOfType:v3 justActive:0 fetchBlock:v16];

  if (*(void *)(a1 + 56))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "_setAccountStore:", *(void *)(a1 + 40), *(_OWORD *)&v11, (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

+ (id)accountCache
{
  if (accountCache_onceToken != -1) {
    dispatch_once(&accountCache_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)accountCache__cache;

  return v2;
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] == 1 && !objc_msgSend(v9, "count"))
  {
    v16 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v24[3] = &unk_264321080;
    id v25 = v8;
    v26 = self;
    id v27 = v9;
    id v28 = v10;
    id v17 = v10;
    id v18 = v9;
    id v19 = v8;
    [v16 performBlockAndWait:v24];

    long long v15 = v25;
  }
  else
  {
    int8x16_t v11 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_3;
    v20[3] = &unk_264321080;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v12 = v10;
    id v13 = v9;
    id v14 = v8;
    [v11 performBlockAndWait:v20];

    long long v15 = v21;
  }
}

- (void)setRemoteDeviceProxy:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataclassOwnersManager:(id)a3
{
}

- (void)setDatabaseBackupActivity:(id)a3
{
}

- (void)setAuthenticationPluginManager:(id)a3
{
}

- (void)setAuthenticationDialogManager:(id)a3
{
}

- (void)setAccountNotifier:(id)a3
{
}

- (void)setAccessPluginManager:(id)a3
{
}

- (ACDAccountStore)initWithClient:(id)a3 databaseConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ACDAccountStore;
  id v8 = [(ACDAccountStore *)&v15 init];
  if (v8)
  {
    id v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore initWithClient:databaseConnection:]();
    }

    objc_storeWeak((id *)&v8->_client, v6);
    objc_storeStrong((id *)&v8->_databaseConnection, a4);
    v8->_notificationsEnabled = 1;
    v8->_migrationInProgress = 0;
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    accountChanges = v8->_accountChanges;
    v8->_accountChanges = v10;

    id v12 = [[ACDClientAuthorizationManager alloc] initWithDatabaseConnection:v8->_databaseConnection];
    authorizationManager = v8->_authorizationManager;
    v8->_authorizationManager = v12;
  }
  return v8;
}

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  [v8 setAccountStore:self];
  id v14 = 0;
  id v10 = [(ACDAccountStore *)self _accountsWithAccountType:v8 options:a4 error:&v14];
  id v11 = v14;
  id v12 = _ACDLogSystem();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore accountsWithAccountType:options:completion:]();
    }

    v9[2](v9, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore accountsWithAccountType:options:completion:]();
    }

    ((void (**)(id, void *, id))v9)[2](v9, v10, 0);
  }
}

- (id)_accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  id v9 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke;
  v14[3] = &unk_2643211E8;
  id v17 = &v21;
  id v10 = v8;
  BOOL v20 = (a4 & 1) == 0;
  id v15 = v10;
  v16 = self;
  id v18 = &v27;
  unint64_t v19 = a4;
  [v9 performBlockAndWait:v14];

  if (a5)
  {
    id v11 = (void *)v28[5];
    if (v11) {
      *a5 = v11;
    }
  }
  id v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

uint64_t __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_block_accountsWithAccountTypeIdentifiers:preloadedProperties:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (ACDClientAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

void __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _ACDLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke_cold_1(a2);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
}

- (void)accountsWithAccountType:(id)a3 handler:(id)a4
{
}

void __68__ACDAccountStore_accountIdentifiersEnabledToSyncDataclass_handler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _dataclassWithName:*(void *)(a1 + 40) createIfNecessary:0];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
    id v4 = *(void **)(*(void *)(a1 + 32) + 120);
    id v5 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
    id v22 = (void *)v3;
    id v6 = [v4 fetchObjectsForEntityNamed:@"Account" withPredicate:0 sortDescriptor:v3 prefetchKeypaths:v5];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = *(void **)(a1 + 32);
        id v14 = [v12 accountType];
        LODWORD(v13) = [v13 _canManagedAccountType:v14 syncManagedDataclass:v2];

        if (v13)
        {
          id v15 = [v12 parentAccount];
          v16 = *(void **)(a1 + 32);
          if (v15)
          {
            if (([v16 _isManagedAccount:v15 enabledForManagedDataclass:v2] & 1) == 0) {
              goto LABEL_17;
            }
          }
          else if (![v16 _isManagedAccount:v12 enabledForManagedDataclass:v2])
          {
LABEL_17:

            continue;
          }
          id v17 = [v12 identifier];
          if (v17)
          {
            id v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (!v18)
            {
              id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
              uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
              uint64_t v21 = *(void **)(v20 + 40);
              *(void *)(v20 + 40) = v19;

              id v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            }
            [v18 addObject:v17];
          }

          goto LABEL_17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v9)
      {
LABEL_20:

        break;
      }
    }
  }
}

- (BOOL)_canManagedAccountType:(id)a3 syncManagedDataclass:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a3, "syncableDataclasses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) name];
        id v11 = [v5 name];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_dataclassWithName:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Dataclass" withPredicate:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    BOOL v16 = v4;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v12 = [v11 name];
        int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
LABEL_11:
    BOOL v4 = v16;
  }

  if (!v8 && v4)
  {
    long long v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _dataclassWithName:createIfNecessary:]();
    }

    id v8 = [(ACDDatabaseConnection *)self->_databaseConnection insertNewObjectForEntityForName:@"Dataclass"];
    [v8 setName:v6];
  }

  return v8;
}

id __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v9 = 0;
  id v5 = objc_msgSend(v2, "_block_accountsWithAccountType:options:error:", v3, v4, &v9);
  id v6 = v9;
  id v7 = v9;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
  }

  return v5;
}

uint64_t __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_block_accountsWithAccountTypeIdentifiers:preloadedProperties:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __85__ACDAccountStore_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__ACDAccountStore__sync_accountWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_block_accountWithIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = +[ACDAccountStore accountCache];
    [v5 cacheAccount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

- (id)_accountWithIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFB1F8];
  id v5 = a3;
  id v6 = [v4 keypathsRequiredForInitialization];
  id v7 = [(ACDAccountStore *)self _accountWithIdentifier:v5 prefetchKeypaths:v6];

  return v7;
}

void __70__ACDAccountStore_enabledDataclassesForAccountWithIdentifier_handler___block_invoke(void *a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v22[0] = *MEMORY[0x263EFB148];
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v5 = [v2 _accountWithIdentifier:v3 prefetchKeypaths:v4];

  if (v5)
  {
    id v6 = [v5 enabledDataclasses];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v8 = *(void *)(a1[6] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
            BOOL v16 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "name", (void)v17);
            [v15 addObject:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }
}

void __65__ACDAccountStore_accountIdentifiersEnabledForDataclass_handler___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
  uint64_t v3 = *(void **)(a1[4] + 120);
  uint64_t v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  long long v18 = (void *)v2;
  id v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:0 sortDescriptor:v2 prefetchKeypaths:v4];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 enabledDataclasses];
        uint64_t v13 = [v12 valueForKey:@"name"];
        if ([v13 containsObject:a1[5]])
        {
          if (!*(void *)(*(void *)(a1[6] + 8) + 40))
          {
            id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
            uint64_t v15 = *(void *)(a1[6] + 8);
            BOOL v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;
          }
          long long v17 = [v11 identifier];
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v17];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)accountWithIdentifier:(id)a3 handler:(id)a4
{
  id v7 = a4;
  id v8 = [(ACDAccountStore *)self _sync_accountWithIdentifier:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (id)_sync_accountWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  id v5 = +[ACDAccountStore accountCache];
  id v18 = [v5 cachedAccountForIdentifier:v4];

  id v6 = (void *)v14[5];
  if (v6)
  {
    [v6 _setAccountStore:self];
  }
  else
  {
    id v7 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__ACDAccountStore__sync_accountWithIdentifier___block_invoke;
    v10[3] = &unk_264320A48;
    uint64_t v12 = &v13;
    v10[4] = self;
    id v11 = v4;
    [v7 performBlockAndWait:v10];
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[ACDAccountStore accountCache];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke_2;
  v20[3] = &unk_2643211C0;
  int8x16_t v15 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v15.i64[0];
  int8x16_t v21 = vextq_s8(v15, v15, 8uLL);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v22 = *(void *)(a1 + 56);
  uint64_t v23 = v6;
  uint64_t v7 = [v2 cachedAccountsOfType:v3 justActive:v4 fetchBlock:v20];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14++), "_setAccountStore:", *(void *)(a1 + 40), *(_OWORD *)&v15, (void)v16);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 allowUserInteraction:(BOOL)a5 withHandler:(id)a6
{
  BOOL v7 = a5;
  v25[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _ACDLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:]();
  }

  uint64_t v14 = [(ACDAccountStore *)self accountTypeWithIdentifier:v10];
  if (v14)
  {
    accessPluginManager = self->_accessPluginManager;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    void v22[2] = __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke;
    v22[3] = &unk_264321300;
    id v23 = v12;
    [(ACDAccessPluginManager *)accessPluginManager handleAccessRequestToAccountsOfType:v14 forClient:WeakRetained withOptions:v11 store:self allowUserInteraction:v7 completion:v22];

    long long v17 = v23;
  }
  else
  {
    long long v17 = [NSString stringWithFormat:@"The account type specified could not be found."];
    long long v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263EFB070];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = v17;
    long long v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    int8x16_t v21 = [v18 errorWithDomain:v19 code:6 userInfo:v20];

    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v21);
  }
}

- (id)_accountWithIdentifier:(id)a3 prefetchKeypaths:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08A98];
  id v7 = a4;
  uint64_t v8 = [v6 predicateWithFormat:@"identifier == %@", a3];
  uint64_t v9 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Account" withPredicate:v8 sortDescriptor:0 prefetchKeypaths:v7];

  id v10 = [v9 lastObject];

  return v10;
}

void __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke(void *a1)
{
  uint64_t v2 = a1 + 4;
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"identifier == %@", a1[4]];
  uint64_t v4 = [*(id *)(a1[5] + 120) fetchObjectsForEntityNamed:@"AccountType" withPredicate:v3];
  id v5 = [v4 lastObject];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFB220]) initWithManagedAccountType:v5 accountStore:a1[5]];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = +[ACDAccountStore accountCache];
    [v9 cacheAccountType:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  else
  {
    id v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke_cold_1();
    }

    id v11 = [MEMORY[0x263EFB220] allIdentifiers];
    int v12 = [v11 containsObject:*v2];

    if (v12)
    {
      uint64_t v13 = NSString;
      id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 160));
      int8x16_t v15 = [v13 stringWithFormat:@"Client '%@' failed to access internal account type '%@'", WeakRetained, a1[4]];

      long long v16 = +[ACDEventLedger sharedLedger];
      [v16 simulateCrashWithMessage:v15];
    }
  }
}

void __52__ACDAccountStore_accessKeysForAccountType_handler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = [v2 existingObjectWithURI:v3];

  if (!v4)
  {
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263EFB070];
    uint64_t v27 = *MEMORY[0x263F08320];
    long long v18 = NSString;
    id v5 = [*(id *)(a1 + 40) identifier];
    id v9 = [v18 stringWithFormat:@"%@ is not a valid account type.", v5];
    id v28 = v9;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v20 = [v16 errorWithDomain:v17 code:4 userInfo:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

LABEL_12:
    goto LABEL_13;
  }
  id v5 = [v4 accessKeys];
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          int8x16_t v15 = [*(id *)(*((void *)&v23 + 1) + 8 * v13) name];
          [v14 addObject:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }
    id v5 = v9;
    goto LABEL_12;
  }
LABEL_13:
}

- (id)_predicateForFetchingAccountsWithManagedAccountTypeID:(id)a3 options:(unint64_t)a4
{
  if (a4) {
    [MEMORY[0x263F08A98] predicateWithFormat:@"accountType == %@", a3, v6];
  }
  else {
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType == %@ AND active == %@", a3, MEMORY[0x263EFFA88]];
  }

  return v4;
}

- (void)accessKeysForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__3;
  long long v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  int8x16_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  long long v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  [v6 setAccountStore:self];
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ACDAccountStore_accessKeysForAccountType_handler___block_invoke;
  v10[3] = &unk_264321148;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v20;
  uint64_t v13 = &v14;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, 0);
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManager, 0);
  objc_storeStrong((id *)&self->_dataclassOwnersManager, 0);
  objc_storeStrong((id *)&self->_accessPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationPluginManager, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProxy, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fakeRemoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);

  objc_storeStrong((id *)&self->_accountChanges, 0);
}

- (void)registerMonitorForAccountsOfTypes:(id)a3 propertiesToPrefetch:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _ACDLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 138412802;
    id v18 = WeakRetained;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl(&dword_2183AD000, v11, OS_LOG_TYPE_DEBUG, "\"Client %@ registered to monitor for types %@, preloadedProperties %@\"", buf, 0x20u);
  }
  uint64_t v12 = [v8 allObjects];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__ACDAccountStore_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion___block_invoke;
  v15[3] = &unk_264321468;
  id v16 = v10;
  id v13 = v10;
  [(ACDAccountStore *)self accountsWithAccountTypeIdentifiers:v12 preloadedProperties:v9 completion:v15];
}

- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__ACDAccountStore_enabledDataclassesForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  if (syncDataTypeForDataclass(a3))
  {
    tetheredSyncSourceTypeForDataType();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6, 0);
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:0];
    ((void (**)(id, id, id))v5)[2](v5, 0, v6);
  }
}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  p_client = &self->_client;
  id v8 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_client);
  [WeakRetained setBundleID:v6];

  v8[2](v8, 1, 0);
}

- (void)accountIdentifiersEnabledForDataclass:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__ACDAccountStore_accountIdentifiersEnabledForDataclass_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

- (void)accountIdentifiersEnabledToSyncDataclass:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__ACDAccountStore_accountIdentifiersEnabledToSyncDataclass_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __31__ACDAccountStore_accountCache__block_invoke()
{
  if (!accountCache__cache)
  {
    accountCache__cache = [[ACDAccountCache alloc] initWithValidityDuration:30];
    MEMORY[0x270F9A758]();
  }
}

- (ACDAccountStore)init
{
  uint64_t v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStore init]();
  }

  return [(ACDAccountStore *)self initWithClient:0 databaseConnection:0];
}

void __45__ACDAccountStore_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _accountTypeWithIdentifier:*(void *)(a1 + 40)];
  if (v6)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFB220]) initWithManagedAccountType:v6 accountStore:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = +[ACDAccountStore accountCache];
    [v5 cacheAccountType:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

- (id)accountsWithAccountTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__ACDAccountStore_accountsWithAccountTypeIdentifier___block_invoke;
  v9[3] = &unk_264320CA0;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  uint64_t v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __53__ACDAccountStore_accountsWithAccountTypeIdentifier___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier == %@", a1[4]];
  uint64_t v3 = *(void **)(a1[5] + 120);
  id v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  id v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:v2 sortDescriptor:0 prefetchKeypaths:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:*(void *)(*((void *)&v15 + 1) + 8 * v13) accountStore:a1[5]];
        if (v14) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _ACDLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore accountsOnPairedDeviceWithAccountTypes:withOptions:handler:]();
  }

  uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263EFB1B8]];
  uint64_t v13 = [v12 BOOLValue];

  uint64_t v14 = +[ACDPairedDeviceAccountCache sharedInstance];
  remoteDeviceProxy = self->_remoteDeviceProxy;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__ACDAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke;
  v18[3] = &unk_264320F18;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [v14 accountsFromRemoteDeviceProxy:remoteDeviceProxy ignoreCache:v13 options:v10 completion:v18];
}

void __78__ACDAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    long long v18 = 0;
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = *(void **)(a1 + 32);
          long long v15 = objc_msgSend(v13, "accountType", v18);
          id v16 = [v15 identifier];
          LODWORD(v14) = [v14 containsObject:v16];

          if (v14) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v6 = v18;
    id v5 = v19;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v6);
  }
}

- (BOOL)accountsExistWithAccountTypeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__ACDAccountStore_accountsExistWithAccountTypeIdentifier___block_invoke;
  v8[3] = &unk_264320CA0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = self;
  uint64_t v11 = &v12;
  [v5 performBlockAndWait:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

void __58__ACDAccountStore_accountsExistWithAccountTypeIdentifier___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier == %@", a1[4]];
  uint64_t v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)a1[4];
    *(_DWORD *)buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v2;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Determining account existent: %@, %@\"", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1[5] + 120) countOfEntityNamed:@"Account" withPredicate:v2];
  id v6 = _ACDLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithUnsignedInteger:v5];
    *(_DWORD *)buf = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_2183AD000, v6, OS_LOG_TYPE_DEFAULT, "\"Number of account is %@\"", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 != 0;
}

- (BOOL)_removeAccountNoSave:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:]();
  }

  if ([(ACDAccountStore *)self notificationsEnabled])
  {
    uint64_t v11 = [(ACDAccountStore *)self accountNotifier];
    id v75 = 0;
    char v12 = [v11 canRemoveAccount:v8 inStore:self error:&v75];
    id v13 = v75;

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        id v13 = v13;
        BOOL v19 = 0;
        *a5 = v13;
      }
      else
      {
        BOOL v19 = 0;
      }
      goto LABEL_49;
    }
    uint64_t v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      char v15 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      id v80 = v15;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Plugins did not deny account %@ removal\"", buf, 0xCu);
    }
  }
  databaseConnection = self->_databaseConnection;
  uint64_t v17 = [v8 objectID];
  id v13 = [(ACDDatabaseConnection *)databaseConnection existingObjectWithURI:v17];

  long long v18 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v13 accountStore:self];
  [v18 _loadAllCachedProperties];
  BOOL v19 = v13 != 0;
  if (v13)
  {
    id v59 = v9;
    v60 = v18;
    long long v20 = _ACDLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v80 = v8;
      _os_log_impl(&dword_2183AD000, v20, OS_LOG_TYPE_DEFAULT, "\"%@ is being deleted.\"", buf, 0xCu);
    }

    long long v21 = [v8 identifier];
    long long v22 = [(ACDAccountStore *)self _childAccountsForAccountWithID:v21];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v71 objects:v78 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v72 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * i) _loadAllCachedProperties];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v25);
    }

    id v58 = v8;
    if ([(ACDAccountStore *)self notificationsEnabled]
      && ![(ACDAccountStore *)self isMigrationInProgress])
    {
      id v28 = [(ACDAccountStore *)self accountNotifier];
      [v28 postWillChangeNotificationForType:3 inStore:self newAccount:0 oldAccount:v60];

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v29 = v23;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v68 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v67 + 1) + 8 * j);
            v35 = [(ACDAccountStore *)self accountNotifier];
            [v35 postWillChangeNotificationForType:3 inStore:self newAccount:0 oldAccount:v34];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v31);
      }

      id v8 = v58;
    }
    [(ACDAccountStore *)self _performDataclassActions:v59 forAccount:v8 error:a5];
    uint64_t v36 = [v8 objectForKeyedSubscript:@"AccountSyncDelete"];
    if (v36
      && (v37 = (void *)v36,
          [v8 objectForKeyedSubscript:@"AccountSyncDelete"],
          v38 = objc_claimAutoreleasedReturnValue(),
          char v39 = [v38 BOOLValue],
          v38,
          v37,
          (v39 & 1) == 0))
    {
      v42 = _ACDLogSystem();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:]();
      }
    }
    else
    {
      +[ACDKeychainManager removeCredentialForAccount:v60 clientID:0 error:0];
      v40 = [v13 identifier];
      v41 = [(ACDAccountStore *)self _clientTokenQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__ACDAccountStore__removeAccountNoSave_withDataclassActions_withError___block_invoke;
      block[3] = &unk_264320D40;
      block[4] = self;
      id v66 = v40;
      v42 = v40;
      dispatch_async(v41, block);
    }
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v13];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v45 = v23;
    uint64_t v49 = [v45 countByEnumeratingWithState:&v61 objects:v76 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v62 != v51) {
            objc_enumerationMutation(v45);
          }
          accountChanges = self->_accountChanges;
          v54 = +[ACDAccountChange changeWithChangeType:3 account:0 oldAccount:*(void *)(*((void *)&v61 + 1) + 8 * k)];
          [(NSMutableArray *)accountChanges addObject:v54];
        }
        uint64_t v50 = [v45 countByEnumeratingWithState:&v61 objects:v76 count:16];
      }
      while (v50);
    }

    v55 = self->_accountChanges;
    long long v18 = v60;
    v48 = +[ACDAccountChange changeWithChangeType:3 account:0 oldAccount:v60];
    [(NSMutableArray *)v55 addObject:v48];
    id v8 = v58;
    id v9 = v59;
    BOOL v19 = v13 != 0;
    goto LABEL_45;
  }
  if (a5)
  {
    v43 = NSString;
    v44 = [v8 identifier];
    id v45 = [v43 stringWithFormat:@"Failed to remove account with identifier %@ because it does not exist", v44];

    v46 = (void *)MEMORY[0x263F087E8];
    uint64_t v47 = *MEMORY[0x263EFB070];
    v48 = [NSDictionary dictionaryWithObject:v45 forKey:*MEMORY[0x263F08320]];
    *a5 = [v46 errorWithDomain:v47 code:6 userInfo:v48];
LABEL_45:
  }
  v56 = _ACDLogSystem();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:]();
  }

LABEL_49:
  return v19;
}

uint64_t __71__ACDAccountStore__removeAccountNoSave_withDataclassActions_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeClientTokenForAccountIdentifer:*(void *)(a1 + 40)];
}

- (BOOL)_saveWithError:(id *)a3
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _saveWithError:].cold.6();
  }

  id v6 = _ACDSaveLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  v128 = self;
  v112 = a3;
  if (v7)
  {
    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v8 = self->_accountChanges;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v142 objects:v153 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v143;
      uint64_t v117 = *MEMORY[0x263EFB110];
      v115 = &buf[16];
      uint64_t v116 = *MEMORY[0x263EFB138];
      v114 = v147;
      uint64_t v119 = *(void *)v143;
      *(void *)v120 = v8;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v143 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v142 + 1) + 8 * v12);
          uint64_t v14 = objc_msgSend(v13, "account", v112, v114, v115);
          char v15 = v14;
          if (v14)
          {
            id v16 = v14;
          }
          else
          {
            id v16 = [v13 oldAccount];
          }
          uint64_t v17 = v16;

          long long v18 = _ACDSaveLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            BOOL v19 = [(ACDAccountStore *)self client];
            ACDStringFromChangeType([v13 changeType]);
            id v126 = (id)objc_claimAutoreleasedReturnValue();
            id v20 = [v13 account];
            if (v20)
            {
              v118 = v19;
              id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              id v23 = [v20 dirtyProperties];
              uint64_t v24 = (void *)[v23 mutableCopy];

              [v24 removeObject:v117];
              [v24 removeObject:v116];
              if ([v24 count])
              {
                uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v24, "count"));
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = ___ACDChangeDictionaryForAccount_block_invoke;
                v155 = &unk_2643214B8;
                *(void *)&long long v156 = v20;
                *((void *)&v156 + 1) = v25;
                id v26 = v25;
                [v24 enumerateObjectsUsingBlock:buf];
                [v22 setObject:v26 forKeyedSubscript:@"dirtyProperties"];
              }
              obuint64_t j = v22;
              uint64_t v27 = [v20 dirtyAccountProperties];
              id v28 = (void *)[v27 copy];

              if ([v28 count])
              {
                id v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v28, "count"));
                v146[0] = MEMORY[0x263EF8330];
                v146[1] = 3221225472;
                v147[0] = ___ACDChangeDictionaryForAccount_block_invoke_3;
                v147[1] = &unk_2643214B8;
                id v148 = v29;
                id v149 = v20;
                id v30 = v29;
                [v28 enumerateObjectsUsingBlock:v146];
                [obj setObject:v30 forKeyedSubscript:@"dirtyAccountProperties"];
              }
              self = v128;
              BOOL v19 = v118;
              long long v21 = obj;
            }
            else
            {
              long long v21 = 0;
            }

            *(_DWORD *)buf = 138544131;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v126;
            *(_WORD *)&buf[22] = 2113;
            v155 = v17;
            LOWORD(v156) = 2113;
            *(void *)((char *)&v156 + 2) = v21;
            _os_log_debug_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ account: %{private}@, changes: %{private}@", buf, 0x2Au);

            uint64_t v11 = v119;
            id v8 = *(NSMutableArray **)v120;
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v31 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v142 objects:v153 count:16];
        uint64_t v10 = v31;
      }
      while (v31);
    }
  }
  databaseConnection = self->_databaseConnection;
  id v141 = 0;
  BOOL v33 = -[ACDDatabaseConnection saveWithError:](databaseConnection, "saveWithError:", &v141, v112);
  id v127 = v141;
  uint64_t v34 = _ACLogSystem();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _saveWithError:].cold.5();
  }
  BOOL v121 = v33;

  v35 = [(ACDAccountStore *)self databaseConnection];
  uint64_t v36 = [v35 managedObjectContext];
  [v36 refreshAllObjects];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  obja = self->_accountChanges;
  uint64_t v37 = [(NSMutableArray *)obja countByEnumeratingWithState:&v137 objects:v152 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v138 != v39) {
          objc_enumerationMutation(obja);
        }
        v41 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        v42 = [v41 account];

        if (v42)
        {
          v43 = +[ACDAccountStore accountCache];
          v44 = [v41 account];
          [v43 removeAccount:v44 store:self];

          id v45 = [v41 account];
          v46 = [v45 accountType];
          uint64_t v47 = [(ACDAccountStore *)self _block_accountsWithAccountType:v46 options:1 error:0];

          if (v47)
          {
            v48 = +[ACDAccountStore accountCache];
            uint64_t v49 = [v41 account];
            uint64_t v50 = [v49 accountType];
            uint64_t v51 = [v50 identifier];
            [v48 cacheAccounts:v47 forType:v51 justActive:0];

            self = v128;
          }
          v52 = [v41 account];
          v53 = [v52 accountType];
          v54 = [(ACDAccountStore *)self _block_accountsWithAccountType:v53 options:0 error:0];

          if (!v54) {
            goto LABEL_43;
          }
          v55 = +[ACDAccountStore accountCache];
          v56 = [v41 account];
          goto LABEL_42;
        }
        v57 = [v41 oldAccount];

        if (!v57) {
          continue;
        }
        id v58 = +[ACDAccountStore accountCache];
        id v59 = [v41 oldAccount];
        [v58 removeAccount:v59 store:self];

        v60 = [v41 oldAccount];
        long long v61 = [v60 accountType];
        uint64_t v47 = [(ACDAccountStore *)self _block_accountsWithAccountType:v61 options:1 error:0];

        if (v47)
        {
          long long v62 = +[ACDAccountStore accountCache];
          long long v63 = [v41 oldAccount];
          long long v64 = [v63 accountType];
          v65 = [v64 identifier];
          [v62 cacheAccounts:v47 forType:v65 justActive:0];

          self = v128;
        }
        id v66 = [v41 oldAccount];
        long long v67 = [v66 accountType];
        v54 = [(ACDAccountStore *)self _block_accountsWithAccountType:v67 options:0 error:0];

        if (v54)
        {
          v55 = +[ACDAccountStore accountCache];
          v56 = [v41 oldAccount];
LABEL_42:
          long long v68 = v56;
          long long v69 = [v56 accountType];
          long long v70 = [v69 identifier];
          [v55 cacheAccounts:v54 forType:v70 justActive:1];

          self = v128;
        }
LABEL_43:
      }
      uint64_t v38 = [(NSMutableArray *)obja countByEnumeratingWithState:&v137 objects:v152 count:16];
    }
    while (v38);
  }

  long long v71 = _ACLogSystem();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _saveWithError:].cold.4();
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v72 = self->_accountChanges;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v133 objects:v151 count:16];
  BOOL v74 = v121;
  id v75 = v127;
  if (v73)
  {
    uint64_t v76 = v73;
    id v77 = *(id *)v134;
    id objb = *(id *)v134;
    do
    {
      for (uint64_t j = 0; j != v76; ++j)
      {
        if (*(id *)v134 != v77) {
          objc_enumerationMutation(v72);
        }
        v79 = *(void **)(*((void *)&v133 + 1) + 8 * j);
        if (!v75
          && ([*(id *)(*((void *)&v133 + 1) + 8 * j) changeType] == 1
           || [v79 changeType] == 5)
          && ([v79 account],
              id v80 = objc_claimAutoreleasedReturnValue(),
              [v80 objectID],
              uint64_t v81 = objc_claimAutoreleasedReturnValue(),
              v81,
              v80,
              !v81))
        {
          v86 = [v79 account];
          v87 = [v79 account];
          [v87 identifier];
          v89 = v88 = v72;
          v90 = [(ACDAccountStore *)self _accountWithIdentifier:v89 prefetchKeypaths:0];
          v91 = [v90 objectID];
          v92 = [v91 URIRepresentation];
          [v86 _setObjectID:v92];

          BOOL v74 = v121;
          id v75 = v127;

          self = v128;
          long long v72 = v88;
          id v77 = objb;

          if (!v121) {
            continue;
          }
        }
        else if (!v74)
        {
          continue;
        }
        if ([v79 changeType] == 3)
        {
          v82 = [v79 oldAccount];
          -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v82, [v79 changeType]);
        }
        else
        {
          v83 = [v79 account];
          v84 = [v83 identifier];
          v82 = [(ACDAccountStore *)self _block_accountWithIdentifier:v84];

          if (v82)
          {
            v85 = [v79 account];
            [v82 _applyDirtyStateFromAccount:v85];

            -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v82, [v79 changeType]);
          }
          else
          {
            v93 = _ACDLogSystem();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
              [(ACDAccountStore *)buf _saveWithError:v93];
            }

            v94 = [v79 account];
            -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v94, [v79 changeType]);
          }
          id v75 = v127;
        }
      }
      uint64_t v76 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v133 objects:v151 count:16];
    }
    while (v76);
  }

  if (v75)
  {
    v95 = _ACDLogSystem();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _saveWithError:]();
    }

    id v75 = v127;
    if (v113)
    {
      objc_msgSend(v127, "ac_secureCodingError");
      void *v113 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v96 = (void *)[(NSMutableArray *)self->_accountChanges copy];
  [(NSMutableArray *)self->_accountChanges removeAllObjects];
  if ([(ACDAccountStore *)self notificationsEnabled]
    && ![(ACDAccountStore *)self isMigrationInProgress])
  {
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id objc = v96;
    id v97 = v96;
    uint64_t v98 = [v97 countByEnumeratingWithState:&v129 objects:v150 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      uint64_t v100 = *(void *)v130;
      uint64_t v101 = *MEMORY[0x263EFB198];
      do
      {
        for (uint64_t k = 0; k != v99; ++k)
        {
          if (*(void *)v130 != v100) {
            objc_enumerationMutation(v97);
          }
          v103 = *(void **)(*((void *)&v129 + 1) + 8 * k);
          v104 = [(ACDAccountStore *)self accountNotifier];
          if (v127)
          {
            v105 = [v103 account];
            v106 = [v103 oldAccount];
            [v104 postDidChangeNotificationForType:4 inStore:self newAccount:v105 oldAccount:v106];
          }
          else
          {
            uint64_t v107 = [v103 changeType];
            v108 = [v103 account];
            v109 = [v103 oldAccount];
            [v104 postDidChangeNotificationForType:v107 inStore:v128 newAccount:v108 oldAccount:v109];

            self = v128;
            if ([v103 changeType] == 1
              || [v103 changeType] == 3)
            {
              [(ACRemoteDeviceProxy *)v128->_remoteDeviceProxy sendCommand:v101 withAccount:0 completion:0];
            }
          }
          LOBYTE(v74) = v121;
        }
        uint64_t v99 = [v97 countByEnumeratingWithState:&v129 objects:v150 count:16];
      }
      while (v99);
    }

    v96 = objc;
    id v75 = v127;
  }
  v110 = _ACDLogSystem();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _saveWithError:]();
  }

  return v74;
}

- (id)_commitOrRollbackDataclassActions:(id)a3 forAccount:(id)a4 originalEnabledDataclasses:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a3;
  uint64_t v11 = objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__ACDAccountStore__commitOrRollbackDataclassActions_forAccount_originalEnabledDataclasses___block_invoke;
  v17[3] = &unk_264320F40;
  id v18 = v11;
  id v19 = v7;
  id v20 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v17];

  char v15 = (void *)[v14 copy];

  return v15;
}

void __91__ACDAccountStore__commitOrRollbackDataclassActions_forAccount_originalEnabledDataclasses___block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 _isError])
  {
    if ([a1[5] isPropertyDirty:*MEMORY[0x263EFB148]]) {
      objc_msgSend(a1[5], "setEnabled:forDataclass:", objc_msgSend(a1[6], "containsObject:", v6), v6);
    }
  }
  else
  {
    [a1[4] setObject:v5 forKey:v6];
  }
}

- (BOOL)_performDataclassActions:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _performDataclassActions:forAccount:error:]();
    }

    uint64_t v11 = [v9 identifier];
    id v12 = [(ACDAccountStore *)self _childAccountsForAccountWithID:v11];

    id v13 = [(ACDAccountStore *)self accountNotifier];
    id v14 = [v8 allKeys];
    [v13 postWillPerformDataclassActionsOnAccount:v9 forDataclasses:v14];

    char v15 = [(ACDAccountStore *)self dataclassOwnersManager];
    id v23 = 0;
    char v16 = [v15 performDataclassActions:v8 forAccount:v9 withChildren:v12 withError:&v23];
    id v17 = v23;

    id v18 = [(ACDAccountStore *)self accountNotifier];
    id v19 = [v8 allKeys];
    [v18 postDidPerformDataclassActionsOnAccount:v9 forDataclasses:v19];

    if (v17)
    {
      id v20 = _ACDLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStore _performDataclassActions:forAccount:error:]();
      }
    }
    if (a5) {
      *a5 = v17;
    }
    long long v21 = _ACDLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _performDataclassActions:forAccount:error:]();
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (void)addAccountNoSave:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore addAccountNoSave:error:]();
  }

  [v6 _setAccountStore:self];
  id v8 = [(ACDAccountStore *)self _addAccountNoSave:v6 withDataclassActions:0 error:a4];
  id v9 = _ACDLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore addAccountNoSave:error:]();
  }
}

- (id)_addAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.8();
  }

  uint64_t v11 = (void *)MEMORY[0x263F08A98];
  id v12 = [v8 identifier];
  id v13 = [v11 predicateWithFormat:@"identifier == %@", v12];

  databaseConnection = self->_databaseConnection;
  char v15 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  char v16 = [(ACDDatabaseConnection *)databaseConnection fetchObjectsForEntityNamed:@"Account" withPredicate:v13 sortDescriptor:0 prefetchKeypaths:v15];

  if (![v16 count])
  {
    id v20 = [(ACDDatabaseConnection *)self->_databaseConnection insertNewObjectForEntityForName:@"Account"];
    if (([v20 validateRequiredAttributesForObject:v8 error:a5] & 1) == 0)
    {
      [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v20];
      uint64_t v24 = _ACDLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.6();
      }
      long long v21 = 0;
      goto LABEL_42;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__ACDAccountStore__addAccountNoSave_withDataclassActions_error___block_invoke;
    aBlock[3] = &unk_264320F68;
    v44 = v20;
    v48 = v44;
    id v22 = v8;
    id v49 = v22;
    uint64_t v50 = self;
    id v23 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v43 = [(ACDAccountStore *)self _commitOrRollbackDataclassActions:v9 forAccount:v22 originalEnabledDataclasses:0];
    id v45 = v23;
    uint64_t v24 = ((void (*)(void (**)(void)))v23[2])(v23);
    if (v24) {
      goto LABEL_11;
    }
    int v27 = [v22 isWarmingUp];
    accountChanges = self->_accountChanges;
    if (v27) {
      uint64_t v28 = 5;
    }
    else {
      uint64_t v28 = 1;
    }
    id v29 = +[ACDAccountChange changeWithChangeType:v28 account:v22 oldAccount:0];
    [(NSMutableArray *)accountChanges addObject:v29];

    if ([(ACDAccountStore *)self notificationsEnabled]
      && ![(ACDAccountStore *)self isMigrationInProgress])
    {
      int v40 = [v22 isWarmingUp];
      id v30 = _ACDLogSystem();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      if (v40)
      {
        if (v31) {
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.4();
        }

        uint64_t v32 = [(ACDAccountStore *)self accountNotifier];
        char v41 = [v32 postWillChangeNotificationForType:5 inStore:self newAccount:v22 oldAccount:0];

        if ((v41 & 1) == 0) {
          goto LABEL_34;
        }
      }
      else
      {
        if (v31) {
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.5();
        }

        uint64_t v34 = [(ACDAccountStore *)self accountNotifier];
        int v42 = [v34 postWillChangeNotificationForType:1 inStore:self newAccount:v22 oldAccount:0];

        if (!v42) {
          goto LABEL_34;
        }
      }
      uint64_t v24 = v45[2]();
      if (v24)
      {
LABEL_11:
        uint64_t v25 = _ACDLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:]();
        }

        [(ACDDatabaseConnection *)self->_databaseConnection rollback];
        if (a5)
        {
          uint64_t v24 = v24;
          id v26 = 0;
          *a5 = v24;
        }
        else
        {
          id v26 = 0;
        }
        BOOL v33 = (void *)v43;
LABEL_39:
        uint64_t v37 = _ACDLogSystem();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:]();
        }

        id v20 = v26;
        long long v21 = v20;
LABEL_42:

        goto LABEL_43;
      }
    }
LABEL_34:
    id v46 = 0;
    BOOL v33 = (void *)v43;
    [(ACDAccountStore *)self _performDataclassActions:v43 forAccount:v22 error:&v46];
    id v35 = v46;
    if (v35)
    {
      uint64_t v36 = _ACDLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:]();
      }
    }
    uint64_t v24 = 0;
    id v26 = v44;
    goto LABEL_39;
  }
  if (a5)
  {
    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263EFB070];
    uint64_t v51 = *MEMORY[0x263F08320];
    v52[0] = @"An account with that identifier already exists";
    id v19 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    *a5 = [v17 errorWithDomain:v18 code:5 userInfo:v19];
  }
  id v20 = _ACDLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.7();
  }
  long long v21 = 0;
LABEL_43:

  return v21;
}

id __64__ACDAccountStore__addAccountNoSave_withDataclassActions_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setValuesWithObject:*(void *)(a1 + 40)];
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setDate:v2];

  [*(id *)(a1 + 32) setOwningBundleID:@"com.apple.accounts.accountsd"];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  [*(id *)(a1 + 32) setModificationID:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = 0;
  [v5 _setAccountManagedObjectRelationships:v7 withAccount:v6 oldAccount:0 error:&v10];
  id v8 = v10;

  return v8;
}

- (void)updateAccountNoSave:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore updateAccountNoSave:error:]();
  }

  [v6 _setAccountStore:self];
  [(ACDAccountStore *)self _updateAccountNoSave:v6 withDataclassActions:0 error:a4];
  id v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore updateAccountNoSave:error:]();
  }
}

- (BOOL)_updateAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.7();
  }

  if (a5) {
    *a5 = 0;
  }
  uint64_t v11 = [v8 identifier];
  id v12 = [(ACDAccountStore *)self _accountWithIdentifier:v11];

  if (!v12)
  {
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    id v19 = _ACDLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:]();
    }

    if (a5) {
      *a5 = v18;
    }

    char v20 = 0;
    goto LABEL_41;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v12 accountStore:self];
  id v14 = _ACLogSystem();
  id v55 = v9;
  v56 = v8;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    v44 = [WeakRetained bundleID];
    id v45 = [v13 description];
    if ([v13 isWarmingUp]) {
      id v46 = @"YES";
    }
    else {
      id v46 = @"NO";
    }
    uint64_t v47 = [v8 description];
    int v48 = [v56 isWarmingUp];
    *(_DWORD *)buf = 138413314;
    id v49 = @"NO";
    if (v48) {
      id v49 = @"YES";
    }
    v65 = v44;
    __int16 v66 = 2112;
    long long v67 = v45;
    __int16 v68 = 2112;
    long long v69 = v46;
    __int16 v70 = 2112;
    long long v71 = v47;
    __int16 v72 = 2112;
    uint64_t v73 = v49;
    _os_log_debug_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEBUG, "\"_updateAccountNoSave client %@ - existing %@ warming: %@ -- new %@ warming: %@\"", buf, 0x34u);

    id v8 = v56;
    id v9 = v55;
  }
  [v13 _loadAllCachedProperties];
  char v15 = v13;
  if ([v15 isWarmingUp])
  {
    if (v8 && ([v8 isWarmingUp] & 1) == 0)
    {
      long long v21 = _ACLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.6();
      }

      id v17 = 0;
      int v52 = 1;
      unsigned int v53 = 1;
      char v16 = v15;
    }
    else
    {
      char v16 = _ACLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.5();
      }
      int v52 = 0;
      unsigned int v53 = 5;
      id v17 = v15;
    }
  }
  else
  {
    int v52 = 0;
    unsigned int v53 = 2;
    id v17 = v15;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__ACDAccountStore__updateAccountNoSave_withDataclassActions_error___block_invoke;
  aBlock[3] = &unk_264320F90;
  id v22 = v8;
  id v60 = v22;
  id v23 = v12;
  id v61 = v23;
  uint64_t v24 = v15;
  long long v62 = v24;
  long long v63 = self;
  uint64_t v25 = (void (**)(void *, id))_Block_copy(aBlock);
  id v26 = [v24 enabledDataclasses];
  uint64_t v54 = [(ACDAccountStore *)self _commitOrRollbackDataclassActions:v9 forAccount:v22 originalEnabledDataclasses:v26];

  v25[2](v25, v24);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  v57 = v17;
  if (v27) {
    goto LABEL_24;
  }
  BOOL v31 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v23 accountStore:self];
  [v31 _loadAllCachedProperties];
  [v31 _applyDirtyStateFromAccount:v22];
  if (([v24 _isDifferentFrom:v31] & 1) == 0)
  {
    id v35 = _ACDLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.4();
    }

    id v27 = 0;
    char v34 = 0;
    char v20 = 0;
    id v9 = v55;
    id v8 = v56;
    goto LABEL_39;
  }
  uint64_t v51 = (void *)[v31 copy];
  if ([(ACDAccountStore *)self notificationsEnabled]
    && ![(ACDAccountStore *)self isMigrationInProgress]
    && ([(ACDAccountStore *)self accountNotifier],
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        int v50 = [v32 postWillChangeNotificationForType:v53 inStore:self newAccount:v31 oldAccount:v57],
        v32,
        v50))
  {
    [v22 takeValuesFromModifiedAccount:v31];
    uint64_t v33 = v25[2](v25, v51);
    if (v33)
    {
      id v27 = (id)v33;

      id v17 = v57;
LABEL_24:
      uint64_t v28 = _ACDLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:]();
      }

      accountChanges = self->_accountChanges;
      id v30 = +[ACDAccountChange changeWithChangeType:4 account:v17 oldAccount:v17];
      [(NSMutableArray *)accountChanges addObject:v30];

      [(ACDDatabaseConnection *)self->_databaseConnection rollback];
      id v9 = v55;
      if (a5)
      {
        id v27 = v27;
        char v20 = 0;
        *a5 = v27;
      }
      else
      {
        char v20 = 0;
      }
      char v34 = 1;
      id v8 = v56;
LABEL_39:
      uint64_t v36 = v57;
      uint64_t v37 = (void *)v54;
      goto LABEL_40;
    }
    int v40 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v23 accountStore:self];

    [v40 _loadAllCachedProperties];
    id v9 = v55;
    if (v52) {
      [v40 markAllPropertiesDirty];
    }
    else {
      [v40 _applyDirtyStateFromAccount:v22];
    }
  }
  else
  {
    int v40 = v31;
    id v9 = v55;
  }
  char v41 = self->_accountChanges;
  int v42 = +[ACDAccountChange changeWithChangeType:v53 account:v40 oldAccount:v57];
  [(NSMutableArray *)v41 addObject:v42];

  uint64_t v36 = v57;
  uint64_t v43 = self;
  uint64_t v37 = (void *)v54;
  char v20 = [(ACDAccountStore *)v43 _performDataclassActions:v54 forAccount:v22 error:a5];

  id v27 = 0;
  char v34 = 1;
  id v8 = v56;
LABEL_40:

  if ((v34 & 1) == 0)
  {
    char v20 = 1;
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v38 = _ACDLogSystem();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:]();
  }

LABEL_45:
  return v20;
}

id __67__ACDAccountStore__updateAccountNoSave_withDataclassActions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setDirty:0 forProperty:@"owningBundleID"];
  [*(id *)(a1 + 40) setValuesWithObject:*(void *)(a1 + 32)];
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];
  [*(id *)(a1 + 40) setModificationID:v5];

  if ([*(id *)(a1 + 32) isPropertyDirty:@"dataclassProperties"])
  {
    id v6 = [*(id *)(a1 + 48) dataclassProperties];
    uint64_t v7 = (void *)[v6 mutableCopy];
    id v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    id v10 = v9;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = [*(id *)(a1 + 32) dirtyDataclassProperties];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v17 = [*(id *)(a1 + 32) dataclassProperties];
          uint64_t v18 = [v17 objectForKeyedSubscript:v16];
          [v10 setObject:v18 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    [*(id *)(a1 + 40) setValue:v10 forKey:@"dataclassProperties"];
  }
  id v19 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  id v24 = 0;
  [v19 _setAccountManagedObjectRelationships:v20 withAccount:v21 oldAccount:v3 error:&v24];
  id v22 = v24;

  return v22;
}

- (void)deleteAccountNoSave:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 _setAccountStore:self];
  [(ACDAccountStore *)self _deleteAccountNoSave:v6 withDataclassActions:0 error:a4];
}

- (void)_deleteAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:].cold.4();
  }

  uint64_t v11 = [v8 identifier];
  uint64_t v12 = [(ACDAccountStore *)self _accountWithIdentifier:v11];

  if (v12)
  {
    id v13 = (id)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v12 accountStore:self];
    [v13 _loadAllCachedProperties];
    accountChanges = self->_accountChanges;
    char v15 = +[ACDAccountChange changeWithChangeType:3 account:0 oldAccount:v13];
    [(NSMutableArray *)accountChanges addObject:v15];

    uint64_t v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:]();
    }

    if ([(ACDAccountStore *)self notificationsEnabled]
      && ![(ACDAccountStore *)self isMigrationInProgress])
    {
      id v17 = [(ACDAccountStore *)self accountNotifier];
      [v17 postWillChangeNotificationForType:3 inStore:self newAccount:0 oldAccount:v13];
    }
    [(ACDAccountStore *)self _performDataclassActions:v9 forAccount:v8 error:a5];
    +[ACDKeychainManager removeCredentialForAccount:v13 clientID:0 error:0];
    [(ACDDatabaseConnection *)self->_databaseConnection deleteObject:v12];
  }
  else
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    uint64_t v18 = _ACDLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:]();
    }

    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }

  id v19 = _ACDLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:]();
  }
}

- (id)_displayAccountForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentAccount];
  id v6 = v4;
  if (v5)
  {
    id v6 = [(ACDAccountStore *)self _displayAccountForAccount:v5];
  }

  return v6;
}

- (id)_accountTypeWithIdentifier:(id)a3
{
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"identifier == %@", a3];
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"AccountType" withPredicate:v4];
  id v6 = [v5 lastObject];

  return v6;
}

- (BOOL)_canSaveAccount:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__ACDAccountStore__canSaveAccount_error___block_invoke;
  aBlock[3] = &unk_264320FB8;
  void aBlock[4] = self;
  id v7 = v6;
  id v44 = v7;
  id v8 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  id v9 = [v7 accountType];
  int v10 = [v9 supportsMultipleAccounts];

  uint64_t v11 = _ACDLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      char v15 = [v7 accountType];
      *(_DWORD *)buf = 138412290;
      id v46 = v15;
      _os_log_impl(&dword_2183AD000, v11, OS_LOG_TYPE_DEFAULT, "\"Account type %@ does NOT support multiples.\"", buf, 0xCu);
    }
    uint64_t v16 = [v7 accountType];
    id v42 = 0;
    id v17 = [(ACDAccountStore *)self accountsWithAccountType:v16 options:1 error:&v42];
    id v18 = v42;

    if (v17)
    {
      id v35 = a4;
      id v36 = v18;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v37 = v17;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            long long v25 = [v24 identifier];
            long long v26 = [v7 identifier];
            char v27 = [v25 isEqualToString:v26];

            if ((v27 & 1) == 0)
            {
              long long v28 = _ACDLogSystem();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v7 accountType];
                uint64_t v30 = [v29 accountTypeDescription];
                *(_DWORD *)buf = 138412546;
                id v46 = v24;
                __int16 v47 = 2112;
                int v48 = v30;
                _os_log_impl(&dword_2183AD000, v28, OS_LOG_TYPE_DEFAULT, "\"Found active account %@ of type %@ that does NOT support multiples.  Returning NO.\"", buf, 0x16u);
              }
              id v17 = v37;
              if (v35)
              {
                id *v35 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:5 userInfo:0];
              }

              char v14 = 0;
              id v18 = v36;
              goto LABEL_30;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v49 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      id v18 = v36;
      id v17 = v37;
    }
    else if (v18)
    {
      BOOL v31 = _ACDLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStore _canSaveAccount:error:]();
      }

      char v14 = 0;
      if (a4) {
        *a4 = v18;
      }
      goto LABEL_30;
    }
    uint64_t v32 = _ACDLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [v7 accountType];
      *(_DWORD *)buf = 138412290;
      id v46 = v33;
      _os_log_impl(&dword_2183AD000, v32, OS_LOG_TYPE_DEFAULT, "\"Found 0 accounts of type %@, returning YES.\"", buf, 0xCu);
    }
    char v14 = 1;
LABEL_30:

    goto LABEL_31;
  }
  if (v12)
  {
    id v13 = [v7 accountType];
    *(_DWORD *)buf = 138412290;
    id v46 = v13;
    _os_log_impl(&dword_2183AD000, v11, OS_LOG_TYPE_DEFAULT, "\"Account type %@ does support multiples.\"", buf, 0xCu);
  }
  char v14 = v8[2](v8, a4);
LABEL_31:

  return v14;
}

uint64_t __41__ACDAccountStore__canSaveAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) notificationsEnabled]) {
    return 1;
  }
  id v4 = [*(id *)(a1 + 32) accountNotifier];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v7 = [v4 canSaveAccount:v5 inStore:v6 error:&v12];
  id v8 = v12;

  if ((v7 & 1) == 0)
  {
    id v9 = _ACDLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_2183AD000, v9, OS_LOG_TYPE_DEFAULT, "\"Can save account failed, plugin denied save of %@, error: %@\"", buf, 0x16u);
    }

    if (a2) {
      *a2 = v8;
    }
  }

  return v7;
}

- (void)_setAccountManagedObjectRelationships:(id)a3 withAccount:(id)a4 oldAccount:(id)a5 error:(id *)a6
{
  v150[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _ACDLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:].cold.4();
  }

  id v13 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v14 = [v13 persistentStoreCoordinator];
  __int16 v15 = [v10 accountType];
  id v16 = [v15 objectID];
  uint64_t v17 = [v14 managedObjectIDForURIRepresentation:v16];

  id v18 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v117 = (void *)v17;
  uint64_t v19 = [v18 objectWithID:v17];

  if ([v10 isPropertyDirty:@"accountType"]) {
    [v9 setAccountType:v19];
  }
  v118 = (void *)v19;
  if (![v10 isPropertyDirty:@"parent"])
  {
LABEL_9:
    if ([v10 isPropertyDirty:@"accountProperties"])
    {
      id v109 = v11;
      uint64_t v22 = [v10 accountProperties];
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v113 = v10;
      id v23 = [v10 dirtyAccountProperties];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v136 objects:v148 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v137;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v137 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v136 + 1) + 8 * i);
            id v29 = [v22 valueForKey:v28];
            databaseConnection = self->_databaseConnection;
            if (v29) {
              [(ACDDatabaseConnection *)databaseConnection setAccountPropertyWithKey:v28 value:v29 owner:v9];
            }
            else {
              [(ACDDatabaseConnection *)databaseConnection deleteAccountPropertyWithKey:v28 owner:v9];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v136 objects:v148 count:16];
        }
        while (v25);
      }

      id v11 = v109;
      id v10 = v113;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke;
    aBlock[3] = &unk_264320FE0;
    void aBlock[4] = self;
    BOOL v31 = _Block_copy(aBlock);
    if (![v10 isPropertyDirty:*MEMORY[0x263EFB158]])
    {
LABEL_41:
      if (![v10 isPropertyDirty:*MEMORY[0x263EFB148]])
      {
LABEL_58:
        id v60 = (void *)MEMORY[0x263EFB3A8];
        if (v11)
        {
          uint64_t v61 = [v9 username];
          if (v61)
          {
            long long v62 = (void *)v61;
            long long v63 = [v9 authenticationType];
            char v64 = [v63 isEqualToString:*v60];

            if ((v64 & 1) == 0)
            {
              v65 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v9];
              __int16 v66 = [v11 qualifiedUsername];
              long long v67 = [v65 qualifiedUsername];
              char v68 = [v66 isEqualToString:v67];

              if ((v68 & 1) == 0)
              {
                long long v71 = _ACDLogSystem();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v72 = [v11 qualifiedUsername];
                  uint64_t v73 = [v65 qualifiedUsername];
                  *(_DWORD *)buf = 138412802;
                  id v141 = v65;
                  __int16 v142 = 2112;
                  long long v143 = v72;
                  __int16 v144 = 2112;
                  long long v145 = v73;
                  _os_log_impl(&dword_2183AD000, v71, OS_LOG_TYPE_DEFAULT, "\"%@: qualifiedUsername changed from %@ to %@\"", buf, 0x20u);
                }
                if ([v10 isPropertyDirty:@"credential"]) {
                  [v10 internalCredential];
                }
                else {
                v90 = +[ACDKeychainManager credentialForAccount:v11 clientID:0];
                }
                [v65 setCredential:v90];
                +[ACDKeychainManager removeCredentialForAccount:v11 clientID:0 error:0];
                +[ACDKeychainManager setCredentialForAccount:v65 error:a6];

                goto LABEL_100;
              }
            }
          }
        }
        long long v69 = [v10 authenticationType];
        if ([v69 isEqualToString:*v60]) {
          goto LABEL_97;
        }
        int v70 = [v10 isPropertyDirty:@"credential"];

        if (!v70) {
          goto LABEL_98;
        }
        if (v11)
        {
          v65 = +[ACDKeychainManager credentialForAccount:v11 clientID:0];
        }
        else
        {
          v65 = 0;
        }
        uint64_t v74 = [v65 credentialType];
        uint64_t v75 = *MEMORY[0x263EFB040];
        if ([v74 isEqual:*MEMORY[0x263EFB040]])
        {
        }
        else
        {
          uint64_t v76 = [v10 internalCredential];
          id v77 = [v76 credentialType];
          int v78 = [v77 isEqual:v75];

          if (!v78) {
            goto LABEL_76;
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
        char v80 = [WeakRetained hasEntitlement:*MEMORY[0x263EFB2B0]];

        if ((v80 & 1) == 0)
        {
          id v81 = objc_loadWeakRetained((id *)&self->_client);
          v82 = [v81 bundleID];

          if (!v82)
          {
            uint64_t v101 = _ACDLogSystem();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
              -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:]((id *)&self->_client);
            }

            goto LABEL_100;
          }
          id v83 = objc_loadWeakRetained((id *)&self->_client);
          long long v69 = [v83 bundleID];

LABEL_79:
          v84 = [v10 internalCredential];
          char v85 = [v84 isEqual:v65];

          if ((v85 & 1) == 0)
          {
            id v86 = v11;
            id v87 = v10;
            v88 = v86;
            if (v86)
            {
              uint64_t v119 = 0;
              v89 = (id *)&v119;
              +[ACDKeychainManager setCredentialForAccount:v87 clientID:v69 error:&v119];
            }
            else
            {
              uint64_t v120 = 0;
              v89 = (id *)&v120;
              +[ACDKeychainManager setCredentialForNewAccount:v87 clientID:v69 error:&v120];
            }
            v91 = *v89;
            if ([(ACDAccountStore *)self isMigrationInProgress] && v91)
            {
              v92 = _ACDLogSystem();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v141 = v91;
                _os_log_impl(&dword_2183AD000, v92, OS_LOG_TYPE_DEFAULT, "\"Ignoring credential-save error because we're migrating. %@\"", buf, 0xCu);
              }
              id v10 = v87;
              id v11 = v88;
              goto LABEL_95;
            }
            id v10 = v87;
            id v11 = v88;
            if (v91)
            {
              v93 = [v91 userInfo];
              v104 = [v93 mutableCopy];

              uint64_t v112 = *MEMORY[0x263F08320];
              uint64_t v94 = -[NSObject objectForKeyedSubscript:](v104, "objectForKeyedSubscript:");
              if (v94) {
                v95 = (__CFString *)v94;
              }
              else {
                v95 = &stru_26C990120;
              }
              uint64_t v116 = v95;
              v106 = NSString;
              id v103 = objc_loadWeakRetained((id *)&self->_client);
              v96 = [v103 name];
              v102 = v95;
              v92 = v104;
              uint64_t v107 = [v106 stringWithFormat:@"%@ Requested By: %@", v102, v96];

              [v104 setObject:v107 forKeyedSubscript:v112];
              id v97 = (void *)MEMORY[0x263F087E8];
              uint64_t v98 = [v91 domain];
              uint64_t v99 = objc_msgSend(v97, "errorWithDomain:code:userInfo:", v98, -[NSObject code](v91, "code"), v104);

              id v100 = v99;
              *a6 = v100;

LABEL_95:
            }
          }

LABEL_97:
LABEL_98:
          v65 = _ACDLogSystem();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
            -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:]();
          }
LABEL_100:
          uint64_t v43 = v117;

          goto LABEL_101;
        }
LABEL_76:
        long long v69 = 0;
        goto LABEL_79;
      }
      if ([v10 wasEnabledDataclassesReset])
      {
        id v50 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        if (!v11)
        {
LABEL_49:
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          unsigned int v53 = [v10 enabledDataclasses];
          uint64_t v55 = [v53 countByEnumeratingWithState:&v124 objects:v146 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            id v111 = v11;
            id v115 = v10;
            uint64_t v57 = *(void *)v125;
            uint64_t v58 = *MEMORY[0x263EFB010];
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v125 != v57) {
                  objc_enumerationMutation(v53);
                }
                (*((void (**)(void *, id, void, uint64_t))v31 + 2))(v31, v50, *(void *)(*((void *)&v124 + 1) + 8 * j), v58);
              }
              uint64_t v56 = [v53 countByEnumeratingWithState:&v124 objects:v146 count:16];
            }
            while (v56);
            id v11 = v111;
            id v10 = v115;
          }
          goto LABEL_57;
        }
      }
      else
      {
        uint64_t v51 = [v9 enabledDataclasses];
        id v50 = (id)[v51 mutableCopy];

        if (v50)
        {
          if (!v11) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v54 = [MEMORY[0x263F08690] currentHandler];
          [v54 handleFailureInMethod:a2 object:self file:@"ACDAccountStore.m" lineNumber:1039 description:@"Failed to read enabledDataclasses from database"];

          if (!v11) {
            goto LABEL_49;
          }
        }
      }
      int v52 = [v10 trackedEnabledDataclasses];
      v121[0] = MEMORY[0x263EF8330];
      v121[1] = 3221225472;
      v121[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_3;
      v121[3] = &unk_264321008;
      id v123 = v31;
      id v122 = v50;
      [v52 enumerateModificationsUsingBlock:v121];

      unsigned int v53 = v123;
LABEL_57:

      [v9 setEnabledDataclasses:v50];
      goto LABEL_58;
    }
    if ([v10 wasProvisionedDataclassesReset])
    {
      id v32 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      if (!v11)
      {
LABEL_32:
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id v35 = [v10 provisionedDataclasses];
        uint64_t v45 = [v35 countByEnumeratingWithState:&v131 objects:v147 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          id v110 = v11;
          id v114 = v10;
          uint64_t v47 = *(void *)v132;
          uint64_t v48 = *MEMORY[0x263EFB010];
          do
          {
            for (uint64_t k = 0; k != v46; ++k)
            {
              if (*(void *)v132 != v47) {
                objc_enumerationMutation(v35);
              }
              (*((void (**)(void *, id, void, uint64_t))v31 + 2))(v31, v32, *(void *)(*((void *)&v131 + 1) + 8 * k), v48);
            }
            uint64_t v46 = [v35 countByEnumeratingWithState:&v131 objects:v147 count:16];
          }
          while (v46);
          id v11 = v110;
          id v10 = v114;
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v33 = [v9 provisionedDataclasses];
      id v32 = (id)[v33 mutableCopy];

      if (v32)
      {
        if (!v11) {
          goto LABEL_32;
        }
      }
      else
      {
        id v44 = [MEMORY[0x263F08690] currentHandler];
        [v44 handleFailureInMethod:a2 object:self file:@"ACDAccountStore.m" lineNumber:1011 description:@"Failed to read provisionedDataclasses from database"];

        if (!v11) {
          goto LABEL_32;
        }
      }
    }
    char v34 = [v10 trackedProvisionedDataclasses];
    v128[0] = MEMORY[0x263EF8330];
    v128[1] = 3221225472;
    v128[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_2;
    v128[3] = &unk_264321008;
    id v130 = v31;
    id v129 = v32;
    [v34 enumerateModificationsUsingBlock:v128];

    id v35 = v130;
LABEL_40:

    [v9 setProvisionedDataclasses:v32];
    goto LABEL_41;
  }
  uint64_t v20 = [v10 parentAccount];

  if (!v20
    || ([v10 parentAccountIdentifier],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        [(ACDAccountStore *)self _accountWithIdentifier:v21],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20))
  {
    [v9 setParentAccount:v20];

    goto LABEL_9;
  }
  id v36 = _ACDLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:]();
  }

  uint64_t v37 = NSString;
  long long v38 = [v10 parentAccountIdentifier];
  long long v39 = [v37 stringWithFormat:@"The parent account with ID %@ is unknown to our DB, so it cannot have any children added. The parent has probably already been deleted.", v38];

  long long v40 = (void *)MEMORY[0x263F087E8];
  uint64_t v41 = *MEMORY[0x263EFB070];
  uint64_t v149 = *MEMORY[0x263F08320];
  v150[0] = v39;
  id v42 = [NSDictionary dictionaryWithObjects:v150 forKeys:&v149 count:1];
  *a6 = [v40 errorWithDomain:v41 code:15 userInfo:v42];

  uint64_t v43 = (void *)v17;
LABEL_101:
}

void __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:*MEMORY[0x263EFB010]])
  {
    id v9 = [*(id *)(a1 + 32) _dataclassWithName:v7 createIfNecessary:1];
    if (v9) {
      [v10 addObject:v9];
    }
  }
  else
  {
    if (![v8 isEqualToString:*MEMORY[0x263EFB020]]) {
      goto LABEL_8;
    }
    id v9 = [*(id *)(a1 + 32) _dataclassWithName:v7 createIfNecessary:0];
    if (v9) {
      [v10 removeObject:v9];
    }
  }

LABEL_8:
}

uint64_t __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

uint64_t __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (void)_delegate_accountStoreDidSaveAccount:(id)a3 changeType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ACDAccountStore *)self delegate];
  [v7 accountStore:self didSaveAccount:v6 changeType:v4];
}

- (BOOL)_handleAccountMod:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 username];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v11;
    _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"Updating existing account: %@\"", buf, 0xCu);
  }
  id v22 = 0;
  BOOL v12 = [(ACDAccountStore *)self _updateAccountNoSave:v8 withDataclassActions:v9 error:&v22];
  id v13 = v22;
  uint64_t v14 = v13;
  if (!v12 || v13)
  {
    __int16 v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ACDAccountStore _handleAccountMod:withDataclassActions:withError:]();
    }
  }
  id v21 = 0;
  BOOL v16 = [(ACDAccountStore *)self _saveWithError:&v21];
  id v17 = v21;
  id v18 = v17;
  if (a5 && v17) {
    *a5 = v17;
  }
  uint64_t v19 = _ACDLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _handleAccountMod:withDataclassActions:withError:]();
  }

  return v16;
}

- (BOOL)_handleAccountAdd:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 username];
    *(_DWORD *)buf = 138412290;
    char v27 = v11;
    _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "\"Adding new account: %@\"", buf, 0xCu);
  }
  [v8 markAllPropertiesDirty];
  id v25 = 0;
  BOOL v12 = [(ACDAccountStore *)self _addAccountNoSave:v8 withDataclassActions:v9 error:&v25];

  id v13 = v25;
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    __int16 v15 = [WeakRetained bundleID];
    [v12 setOwningBundleID:v15];

    BOOL v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v12 owningBundleID];
      *(_DWORD *)buf = 138412290;
      char v27 = v17;
      _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "\"Owning bundleID: %@\"", buf, 0xCu);
    }
    id v24 = 0;
    LODWORD(self) = [(ACDAccountStore *)self _saveWithError:&v24];
    id v18 = v24;
    if (self)
    {
      uint64_t v19 = [v12 objectID];
      uint64_t v20 = [v19 URIRepresentation];
      [v8 _setObjectID:v20];
    }
    else
    {
      uint64_t v19 = _ACDLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStore _handleAccountAdd:withDataclassActions:error:]();
      }
    }

    if (!a5)
    {
      id v21 = v18;
      goto LABEL_19;
    }
    id v22 = v18;
    if (v18) {
      goto LABEL_17;
    }
  }
  else
  {
    _ACDLogSystem();
    self = (ACDAccountStore *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _handleAccountAdd:withDataclassActions:error:]();
    }

    LOBYTE(self) = 0;
    if (!a5)
    {
      id v21 = 0;
      goto LABEL_19;
    }
  }
  id v22 = 0;
  id v21 = 0;
  id v18 = v13;
  if (v13)
  {
LABEL_17:
    *a5 = v18;
    id v21 = v22;
  }
LABEL_19:

  return (char)self;
}

- (id)_credentialItemWithAccountIdentifier:(id)a3 serviceName:(id)a4
{
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountIdentifier == %@ AND serviceName == %@", a3, a4];
  id v6 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"CredentialItem" withPredicate:v5];
  id v7 = [v6 lastObject];

  return v7;
}

- (id)_allAccounts_sync
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v3 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__ACDAccountStore__allAccounts_sync__block_invoke;
  v6[3] = &unk_264320C50;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__ACDAccountStore__allAccounts_sync__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
  id v3 = *(void **)(*(void *)(a1 + 32) + 120);
  id v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  uint64_t v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:0 sortDescriptor:v2 prefetchKeypaths:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x263EFB1F8]);
        BOOL v16 = objc_msgSend(v15, "initWithManagedAccount:accountStore:", v14, *(void *)(a1 + 32), (void)v18);
        if (v16)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
          id v17 = +[ACDAccountStore accountCache];
          [v17 cacheAccount:v16];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)accountsWithHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(ACDAccountStore *)self _allAccounts_sync];
  v4[2](v4, v5, 0);
}

- (void)accountTypesWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__ACDAccountStore_accountTypesWithHandler___block_invoke;
  v6[3] = &unk_264321030;
  v6[4] = self;
  v6[5] = &v7;
  [v5 performBlockAndWait:v6];

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

void __43__ACDAccountStore_accountTypesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) fetchObjectsForEntityNamed:@"AccountType" withPredicate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFB220]) initWithManagedAccountType:*(void *)(*((void *)&v12 + 1) + 8 * v9) accountStore:*(void *)(a1 + 32)];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        uint64_t v11 = +[ACDAccountStore accountCache];
        [v11 cacheAccountType:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__ACDAccountStore_displayAccountTypeForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  long long v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __70__ACDAccountStore_displayAccountTypeForAccountWithIdentifier_handler___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _accountWithIdentifier:*(void *)(a1 + 40)];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_displayAccountForAccount:");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 accountType];
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFB220]) initWithManagedAccountType:v4 accountStore:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)masterCredentialForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3;
  BOOL v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  uint64_t v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__ACDAccountStore_masterCredentialForAccountIdentifier___block_invoke;
  v9[3] = &unk_264320CA0;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__ACDAccountStore_masterCredentialForAccountIdentifier___block_invoke(void *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v15[0] = *MEMORY[0x263EFB118];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v5 = [v2 _accountWithIdentifier:v3 prefetchKeypaths:v4];

  if (v5)
  {
    id v6 = [v5 accountType];
    id v7 = [v6 credentialType];
    id v8 = _ACDLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 160));
      int v13 = 138412290;
      id v14 = WeakRetained;
      _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"%@ is entitled for all account access - returning OAuth 2 master token.\"", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = +[ACDKeychainManager credentialForManagedAccountObject:v5];
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setCredentialType:v7];
  }
}

- (void)credentialForAccount:(id)a3 serviceID:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke;
  v15[3] = &unk_264321080;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performWithinPersonaForAccount:v14 withBlock:v15];
}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke(uint64_t a1)
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__3;
  void v13[4] = __Block_byref_object_dispose__3;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3;
  v11[4] = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2;
  v5[3] = &unk_264321058;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v13;
  id v10 = v11;
  [v2 performBlockAndWait:v5];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2_cold_1();
  }

  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  v17[0] = *MEMORY[0x263EFB118];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  id v6 = [v3 _accountWithIdentifier:v4 prefetchKeypaths:v5];

  if (v6)
  {
    id v7 = [v6 accountType];
    uint64_t v8 = [v7 credentialType];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    obuint64_t j = *(id *)(v10 + 40);
    uint64_t v11 = +[ACDKeychainManager credentialForManagedAccountObject:v6 clientID:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCredentialType:v8];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x263EFB268];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke;
  v19[3] = &unk_2643210A8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performWithinPersonaForAccount:v17 withBlock:v19];
}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2;
  v5[3] = &unk_2643210A8;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 64);
  [v2 performBlockAndWait:v5];
}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2_cold_1();
  }

  id v3 = *(void **)(a1 + 56);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v3 _accountWithIdentifier:v4 prefetchKeypaths:0];

  if (v5)
  {
    [*(id *)(a1 + 40) setCredential:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = 0;
    +[ACDKeychainManager setCredentialForAccount:v6 clientID:v7 error:&v11];
    id v8 = v11;
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 64);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    uint64_t v9 = *(void (**)(void))(v10 + 16);
  }
  v9();
}

- (void)credentialForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore credentialForAccountWithIdentifier:handler:]((uint64_t)v6, (uint64_t)self);
  }

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  uint64_t v9 = +[ACDAccountStore accountCache];
  id v26 = [v9 cachedAccountForIdentifier:v6];

  uint64_t v10 = (void *)v22[5];
  if (v10)
  {
    [v10 _setAccountStore:self];
  }
  else
  {
    id v11 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke;
    v18[3] = &unk_264320CA0;
    void v18[4] = self;
    id v19 = v6;
    id v20 = &v21;
    [v11 performBlockAndWait:v18];
  }
  uint64_t v12 = v22[5];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x263EFB268];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_147;
    v15[3] = &unk_2643210F8;
    void v15[4] = self;
    id v17 = &v21;
    id v16 = v7;
    [v13 performWithinPersonaForAccount:v12 withBlock:v15];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:6 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
  _Block_object_dispose(&v21, 8);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accountWithIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v2 accountStore:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v6 = objc_alloc(MEMORY[0x263EFB220]);
    id v7 = [v2 accountType];
    id v8 = [v6 initWithManagedAccountType:v7 accountStore:*(void *)(a1 + 32)];

    if (v8)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAccountType:v8];
      uint64_t v9 = +[ACDAccountStore accountCache];
      [v9 cacheAccount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    else
    {
      uint64_t v10 = _ACDLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v8 = _ACDLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_1();
    }
  }
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_147(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 176);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 160));
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2;
  v9[3] = &unk_2643210D0;
  void v9[4] = v6;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v8;
  long long v10 = v8;
  [v3 credentialForAccount:v4 client:WeakRetained store:v6 handler:v9];
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _ACDLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_3();
  }

  if (!v5 && v6)
  {
    if ([v6 code] == -101 || objc_msgSend(v6, "code") == -102)
    {
      long long v8 = _ACDLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v9;
        _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"No plugin provides credentials for account %@. Falling back to legacy behavior.\"", buf, 0xCu);
      }

      long long v10 = (id *)a1[4];
      uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
      id WeakRetained = objc_loadWeakRetained(v10 + 20);
      id v16 = v6;
      id v5 = [v10 _legacyCredentialForAccount:v11 client:WeakRetained error:&v16];
      id v13 = v16;

      id v6 = v13;
      goto LABEL_18;
    }
    id WeakRetained = _ACDLogSystem();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_1();
    }
LABEL_17:
    id v5 = 0;
    goto LABEL_18;
  }
  uint64_t v14 = _ACDLogSystem();
  id WeakRetained = v14;
  if (!v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v15;
      _os_log_impl(&dword_2183AD000, WeakRetained, OS_LOG_TYPE_DEFAULT, "\"The credential for account %@ is missing. It may have been withheld by its auth plugin.\"", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_2();
  }
LABEL_18:

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)_legacyCredentialForAccount:(id)a3 client:(id)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasEntitlement:*MEMORY[0x263EFB2B0]]) {
    goto LABEL_8;
  }
  uint64_t v9 = [v7 accountType];
  long long v10 = [v9 identifier];
  if ([v10 isEqual:*MEMORY[0x263EFAFF0]])
  {
    char v11 = [v8 hasEntitlement:*MEMORY[0x263EFB330]];

    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v12 = [v7 accountType];
  id v13 = [v12 identifier];
  if ([v13 isEqual:*MEMORY[0x263EFAF00]])
  {
    char v14 = [v8 hasEntitlement:*MEMORY[0x263EFB2F0]];

    if (v14)
    {
LABEL_8:
      a5 = +[ACDKeychainManager credentialForAccount:v7 clientID:0 error:a5];
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (a5)
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263EFB070];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Client does not have access to credentials";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a5 = [v16 errorWithDomain:v17 code:9 userInfo:v18];

    a5 = 0;
  }
LABEL_9:

  return a5;
}

- (void)credentialItemsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__3;
  char v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__ACDAccountStore_credentialItemsWithCompletion___block_invoke;
  v6[3] = &unk_264321030;
  v6[4] = self;
  v6[5] = &v7;
  [v5 performBlockAndWait:v6];

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);
}

void __49__ACDAccountStore_credentialItemsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) fetchObjectsForEntityNamed:@"CredentialItem"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = (void *)[objc_alloc(MEMORY[0x263EFB228]) initWithManagedCredentialItem:*(void *)(*((void *)&v11 + 1) + 8 * v9) accountStore:*(void *)(a1 + 32)];
        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)credentialItemForAccount:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke;
  v15[3] = &unk_264321080;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performWithinPersonaForAccount:v14 withBlock:v15];
}

void __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__3;
  id v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke_2;
  v6[3] = &unk_264321120;
  uint64_t v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v9 = &v10;
  [v2 performBlockAndWait:v6];

  (*(void (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v11[5], 0, v4, v5);
  _Block_object_dispose(&v10, 8);
}

void __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v7 = [v2 _credentialItemWithAccountIdentifier:v3 serviceName:*(void *)(a1 + 48)];

  if (v7)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFB228]) initWithManagedCredentialItem:v7 accountStore:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)insertCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke;
  v11[3] = &unk_264321198;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ACDAccountStore *)self accountWithIdentifier:v8 handler:v11];
}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x263EFB268];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_264321170;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v4 performWithinPersonaForAccount:a2 withBlock:v8];
}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  [*(id *)(a1 + 32) setAccountStore:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 120) managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_3;
  v5[3] = &unk_264321148;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = &v15;
  id v8 = &v9;
  [v2 performBlockAndWait:v5];

  if (!v16[5]) {
    [*(id *)(a1 + 32) setObjectID:v10[5]];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) accountIdentifier];
  int8x16_t v4 = [*(id *)(a1 + 40) serviceName];
  id v5 = [v2 _credentialItemWithAccountIdentifier:v3 serviceName:v4];

  if (v5)
  {
    int8x16_t v6 = NSString;
    id v7 = [*(id *)(a1 + 40) accountIdentifier];
    id v8 = [*(id *)(a1 + 40) serviceName];
    uint64_t v9 = [v6 stringWithFormat:@"A credential item with the account identifier: %@ and service name: %@ already exists", v7, v8];

    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263EFB070];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = v9;
    id v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:20 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = 0;
  }
  else
  {
    id v16 = [*(id *)(*(void *)(a1 + 32) + 120) insertNewObjectForEntityForName:@"CredentialItem"];
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v18 + 40);
    [v16 validateRequiredAttributesForObject:v17 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      [*(id *)(*(void *)(a1 + 32) + 120) deleteObject:v16];
    }
    else
    {
      [v16 setValuesWithObject:*(void *)(a1 + 40)];
      uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 120);
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      id v25 = *(id *)(v20 + 40);
      [v19 saveWithError:&v25];
      objc_storeStrong((id *)(v20 + 40), v25);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v21 = [v16 objectID];
    uint64_t v22 = [v21 URIRepresentation];
    uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- (void)saveCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke;
  v11[3] = &unk_264321198;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ACDAccountStore *)self accountWithIdentifier:v8 handler:v11];
}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  int8x16_t v4 = (void *)MEMORY[0x263EFB268];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_264321170;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v4 performWithinPersonaForAccount:a2 withBlock:v8];
}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  id v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  [*(id *)(a1 + 32) setAccountStore:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 120) managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3;
  v7[3] = &unk_264320CA0;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = &v10;
  [v2 performBlockAndWait:v7];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v11[5])
  {
    (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 48), 0);
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectID];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  _Block_object_dispose(&v10, 8);
}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) accountIdentifier];
  id v5 = [*v2 serviceName];
  int8x16_t v6 = [v3 _credentialItemWithAccountIdentifier:v4 serviceName:v5];

  if (v6)
  {
    [v6 setValuesWithObject:*v2];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:22 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3_cold_1();
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void *)(v11 + 40);
  uint64_t v12 = (id *)(v11 + 40);
  id v14 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v13)
  {
    [v14 rollback];
  }
  else
  {
    obuint64_t j = 0;
    [v14 saveWithError:&obj rollbackOnFailure:1];
    objc_storeStrong(v12, obj);
  }
}

- (void)removeCredentialItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 accountIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke;
  v11[3] = &unk_264321198;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ACDAccountStore *)self accountWithIdentifier:v8 handler:v11];
}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x263EFB268];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_264321170;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v4 performWithinPersonaForAccount:a2 withBlock:v8];
}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__3;
  void v8[4] = __Block_byref_object_dispose__3;
  id v9 = 0;
  [*(id *)(a1 + 32) setAccountStore:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 120) managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_3;
  v5[3] = &unk_264320CA0;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = v8;
  [v2 performBlockAndWait:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(v8, 8);
}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) accountIdentifier];
  int8x16_t v4 = [*(id *)(a1 + 40) serviceName];
  id v5 = [v2 _credentialItemWithAccountIdentifier:v3 serviceName:v4];

  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 120) deleteObject:v5];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 120);
      obuint64_t j = 0;
      [v9 saveWithError:&obj];
      objc_storeStrong(v7, obj);
    }
  }
}

- (void)dataclassesWithHandler:(id)a3
{
  int8x16_t v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__3;
  id v12 = __Block_byref_object_dispose__3;
  id v13 = 0;
  id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ACDAccountStore_dataclassesWithHandler___block_invoke;
  v7[3] = &unk_264321030;
  void v7[4] = self;
  v7[5] = &v8;
  [v5 performBlockAndWait:v7];

  if ([(id)v9[5] count]) {
    uint64_t v6 = v9[5];
  }
  else {
    uint64_t v6 = 0;
  }
  v4[2](v4, v6, 0);
  _Block_object_dispose(&v8, 8);
}

void __42__ACDAccountStore_dataclassesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int8x16_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 120) fetchObjectsForEntityNamed:@"Dataclass" withPredicate:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) name];
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_accountsWithAcountType:(id)a3 error:(id *)a4
{
  return [(ACDAccountStore *)self _accountsWithAccountType:a3 options:1 error:a4];
}

- (void)parentAccountForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  uint64_t v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__ACDAccountStore_parentAccountForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  long long v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __65__ACDAccountStore_parentAccountForAccountWithIdentifier_handler___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v10[0] = *MEMORY[0x263EFB150];
  int8x16_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v5 = [v2 _accountWithIdentifier:v3 prefetchKeypaths:v4];

  id v6 = [v5 parentAccount];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v6 accountStore:a1[4]];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)childAccountsForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = [(ACDAccountStore *)self _childAccountsForAccountWithID:a3];
  v6[2](v6, v7, 0);
}

- (void)childAccountsWithAccountTypeIdentifier:(id)a3 parentAccountIdentifier:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  id v11 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__ACDAccountStore_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler___block_invoke;
  v14[3] = &unk_264321120;
  void v14[4] = self;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  uint64_t v17 = &v18;
  [v11 performBlockAndWait:v14];

  v10[2](v10, v19[5], 0);
  _Block_object_dispose(&v18, 8);
}

void __90__ACDAccountStore_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1[4] + 120);
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier = %@ AND parentAccount.identifier = %@", a1[5], a1[6]];
  int8x16_t v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  id v5 = [v2 fetchObjectsForEntityNamed:@"Account" withPredicate:v3 sortDescriptor:0 prefetchKeypaths:v4];

  if ([v5 count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v7 = *(void *)(a1[7] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
          if (v14) {
            [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (id)_childAccountsForAccountWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__3;
    long long v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    id v5 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__ACDAccountStore__childAccountsForAccountWithID___block_invoke;
    v9[3] = &unk_264320CA0;
    id v10 = v4;
    uint64_t v11 = self;
    uint64_t v12 = &v13;
    [v5 performBlockAndWait:v9];

    id v6 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t v7 = _ACDLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _childAccountsForAccountWithID:]();
    }

    id v6 = 0;
  }

  return v6;
}

void __50__ACDAccountStore__childAccountsForAccountWithID___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"parentAccount.identifier = %@", a1[4]];
  uint64_t v3 = *(void **)(a1[5] + 120);
  id v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  id v18 = (void *)v2;
  id v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:v2 sortDescriptor:0 prefetchKeypaths:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v14 accountStore:a1[5]];
        long long v16 = [v14 accountType];
        long long v17 = (void *)[objc_alloc(MEMORY[0x263EFB220]) initWithManagedAccountType:v16 accountStore:a1[5]];
        [v15 setAccountType:v17];
        if (v15) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v15];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (BOOL)_isManagedAccount:(id)a3 enabledForManagedDataclass:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a3, "enabledDataclasses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) name];
        uint64_t v11 = [v5 name];
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__3;
  id v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v11 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__ACDAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke;
  v14[3] = &unk_264321210;
  id v12 = v9;
  id v15 = v12;
  long long v16 = self;
  id v18 = &v19;
  id v13 = v8;
  id v17 = v13;
  [v11 performBlockAndWait:v14];

  v10[2](v10, v20[5], 0);
  _Block_object_dispose(&v19, 8);
}

void __97__ACDAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier IN %@", a1[4]];
  uint64_t v3 = *(void **)(a1[5] + 120);
  id v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  uint64_t v19 = (void *)v2;
  id v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:v2 sortDescriptor:0 prefetchKeypaths:v4];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = [v13 enabledDataclasses];
        id v15 = [v14 valueForKey:@"name"];
        long long v16 = [MEMORY[0x263EFFA08] setWithArray:a1[6]];
        int v17 = [v16 intersectsSet:v15];

        if (v17)
        {
          id v18 = [v13 identifier];
          [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v18];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)provisionedDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__3;
  int v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  id v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __74__ACDAccountStore_provisionedDataclassesForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  id v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __74__ACDAccountStore_provisionedDataclassesForAccountWithIdentifier_handler___block_invoke(void *a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v22[0] = *MEMORY[0x263EFB158];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v5 = [v2 _accountWithIdentifier:v3 prefetchKeypaths:v4];

  if (v5)
  {
    id v6 = [v5 provisionedDataclasses];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v8 = *(void *)(a1[6] + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
            long long v16 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "name", (void)v17);
            [v15 addObject:v16];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  [v6 setAccountStore:self];
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __61__ACDAccountStore_syncableDataclassesForAccountType_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __61__ACDAccountStore_syncableDataclassesForAccountType_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  id v7 = [v2 existingObjectWithURI:v3];

  uint64_t v4 = [v7 syncableDataclassStrings];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__3;
  long long v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  [v6 setAccountStore:self];
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __62__ACDAccountStore_supportedDataclassesForAccountType_handler___block_invoke;
  v10[3] = &unk_264320CA0;
  v10[4] = self;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 performBlockAndWait:v10];

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

void __62__ACDAccountStore_supportedDataclassesForAccountType_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  id v7 = [v2 existingObjectWithURI:v3];

  uint64_t v4 = [v7 supportedDataclassStrings];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)insertAccountType:(id)a3 withHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__3;
  char v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__3;
  uint64_t v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  [v6 setAccountStore:self];
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __49__ACDAccountStore_insertAccountType_withHandler___block_invoke;
  long long v19 = &unk_264321148;
  long long v20 = self;
  id v9 = v6;
  id v21 = v9;
  long long v22 = &v30;
  long long v23 = &v24;
  [v8 performBlockAndWait:&v16];

  if (v31[5])
  {
    id v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "identifier", v16, v17, v18, v19, v20);
      objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore insertAccountType:withHandler:]();
    }

    id v11 = 0;
    uint64_t v12 = v31[5];
  }
  else
  {
    objc_msgSend(v9, "setObjectID:", v25[5], v16, v17, v18, v19, v20);
    uint64_t v13 = _ACDLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v9 identifier];
      uint64_t v15 = v25[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v14;
      __int16 v38 = 2112;
      uint64_t v39 = v15;
      _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Inserted account type '%{public}@' with object ID: %@\"", buf, 0x16u);
    }
    uint64_t v12 = 0;
    id v11 = v9;
  }
  v7[2](v7, v11, v12);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void __49__ACDAccountStore_insertAccountType_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 _accountTypeWithIdentifier:v3];

  if (v4)
  {
    uint64_t v5 = NSString;
    id v6 = [*(id *)(a1 + 40) identifier];
    id v7 = [v5 stringWithFormat:@"An account type with the identifier: %@ already exists", v6];

    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263EFB070];
    id v10 = [NSDictionary dictionaryWithObject:v7 forKey:*MEMORY[0x263F08320]];
    uint64_t v11 = [v8 errorWithDomain:v9 code:4 userInfo:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 120) insertNewObjectForEntityForName:@"AccountType"];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v16 + 40);
    [v14 validateRequiredAttributesForObject:v15 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      [*(id *)(*(void *)(a1 + 32) + 120) deleteObject:v14];
    }
    else
    {
      [v14 setValuesWithObject:*(void *)(a1 + 40)];
      uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 120);
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v23 = *(id *)(v18 + 40);
      [v17 saveWithError:&v23];
      objc_storeStrong((id *)(v18 + 40), v23);
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v19 = [v14 objectID];
    uint64_t v20 = [v19 URIRepresentation];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

- (void)removeAccountType:(id)a3 withHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__3;
  uint64_t v33 = __Block_byref_object_dispose__3;
  id v34 = 0;
  [v6 setAccountStore:self];
  uint64_t v8 = [v6 identifier];
  BOOL v9 = [(ACDAccountStore *)self accountsExistWithAccountTypeIdentifier:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:1000 userInfo:0];
    uint64_t v11 = (void *)v30[5];
    v30[5] = v10;
  }
  else
  {
    uint64_t v12 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __49__ACDAccountStore_removeAccountType_withHandler___block_invoke;
    v26[3] = &unk_264320CA0;
    v26[4] = self;
    id v27 = v6;
    uint64_t v28 = &v29;
    [v12 performBlockAndWait:v26];
  }
  if (v30[5])
  {
    uint64_t v13 = _ACDLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v6 identifier];
      objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore removeAccountType:withHandler:]();
    }

    uint64_t v14 = v30[5];
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  else
  {
    uint64_t v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v6 identifier];
      *(_DWORD *)buf = 138543362;
      id v36 = v17;
      _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "\"Removed account type '%{public}@'\"", buf, 0xCu);
    }
    uint64_t v18 = [MEMORY[0x263EFB220] allIdentifiers];
    long long v19 = [v6 identifier];
    int v20 = [v18 containsObject:v19];

    if (v20)
    {
      uint64_t v21 = NSString;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
      id v23 = [v6 identifier];
      uint64_t v24 = [v21 stringWithFormat:@"Client '%@' removed internal account type '%@'", WeakRetained, v23];

      id v25 = +[ACDEventLedger sharedLedger];
      [v25 simulateCrashWithMessage:v24];
    }
    uint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  v7[2](v7, v15, v14);
  _Block_object_dispose(&v29, 8);
}

void __49__ACDAccountStore_removeAccountType_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = [v2 _accountTypeWithIdentifier:v3];

  if (v4)
  {
    [*(id *)(*(void *)(a1 + 32) + 120) deleteObject:v4];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v5 + 40);
    id v6 = (id *)(v5 + 40);
    if (!v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 120);
      obuint64_t j = 0;
      [v8 saveWithError:&obj];
      objc_storeStrong(v6, obj);
    }
  }
  BOOL v9 = +[ACDAccountStore accountCache];
  [v9 removeAccountType:*(void *)(a1 + 40)];
}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 _setAccountStore:self];
  uint64_t v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke;
  v15[3] = &unk_264321080;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performWithinPersonaForAccount:v14 withBlock:v15];
}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2;
  v12[3] = &unk_264320EA8;
  uint64_t v4 = (id *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v15 = &v23;
  v12[4] = v5;
  id v13 = v3;
  id v14 = *(id *)(a1 + 48);
  id v16 = &v17;
  [v2 performBlockAndWait:v12];

  if ([(id)v18[5] code] == 6)
  {
    uint64_t v6 = 0;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = *((unsigned char *)v24 + 24) != 0;
    uint64_t v6 = v18[5];
  }
  (*(void (**)(void, BOOL, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, v6);
  if (*((unsigned char *)v24 + 24))
  {
    id v8 = [*v4 objectForKeyedSubscript:@"AccountSyncDelete"];

    if (v8)
    {
      id v9 = [*v4 objectForKeyedSubscript:@"AccountSyncDelete"];
      char v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = _ACDLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_cold_1();
        }
      }
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v20 = 0;
  char v5 = [v2 _removeAccountNoSave:v3 withDataclassActions:v4 withError:&v20];
  id v6 = v20;
  uint64_t v7 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = v5;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  id v9 = (void *)a1[4];
  id v19 = 0;
  char v10 = [v9 _saveWithError:&v19];
  id v11 = v19;
  id v12 = v11;
  uint64_t v13 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v13 + 24)) {
    char v14 = v10;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 24) = v14;
  uint64_t v15 = v11;
  if (v11 || (uint64_t v15 = v6) != 0)
  {
    uint64_t v16 = *(void *)(a1[8] + 8);
    id v17 = v15;
    id v18 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
}

- (void)canSaveAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  [v6 _setAccountStore:self];
  if (v7)
  {
    char v8 = [v6 objectID];
    if (v8
      || ([v6 accountType],
          char v8 = objc_claimAutoreleasedReturnValue(),
          ![v8 isObsolete]))
    {
    }
    else
    {
      BOOL v9 = [(ACDAccountStore *)self shouldPreventAccountCreationWithObsoleteAccountType];

      if (v9)
      {
        char v10 = NSString;
        id v11 = [v6 accountType];
        id v12 = [v11 accountTypeDescription];
        id v13 = [v10 stringWithFormat:@"Creating %@ accounts is not supported.", v12];

        char v14 = (void *)MEMORY[0x263F087E8];
        uint64_t v15 = *MEMORY[0x263EFB070];
        uint64_t v16 = [NSDictionary dictionaryWithObject:v13 forKey:*MEMORY[0x263F08320]];
        id v17 = [v14 errorWithDomain:v15 code:7 userInfo:v16];

        v7[2](v7, 0, v17);
LABEL_11:

        goto LABEL_12;
      }
    }
    id v21 = 0;
    BOOL v18 = [(ACDAccountStore *)self _canSaveAccount:v6 error:&v21];
    id v13 = v21;
    if (v18)
    {
      uint64_t v19 = 1;
      id v20 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      id v20 = v13;
    }
    v7[2](v7, v19, v20);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)saveAccount:(id)a3 withHandler:(id)a4
{
}

- (void)saveAccount:(id)a3 pid:(id)a4 verify:(BOOL)a5 dataclassActions:(id)a6 completion:(id)a7
{
}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  void v24[4] = __Block_byref_object_dispose__3;
  id v25 = 0;
  id v13 = (void *)MEMORY[0x263EFB268];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke;
  v17[3] = &unk_264321260;
  id v14 = v10;
  id v18 = v14;
  uint64_t v19 = self;
  BOOL v23 = a4;
  id v15 = v12;
  id v21 = v15;
  id v22 = v24;
  id v16 = v11;
  id v20 = v16;
  [v13 performWithinPersonaForAccount:v14 withBlock:v17];

  _Block_object_dispose(v24, 8);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)os_transaction_create();
  [*(id *)(a1 + 32) _setAccountStore:*(void *)(a1 + 40)];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = *(void **)(a1 + 32);
    id v6 = [v5 username];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 160));
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 160));
    BOOL v9 = [v8 pid];
    id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    *(_DWORD *)buf = 138413314;
    uint64_t v31 = v5;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    __int16 v34 = 2112;
    id v35 = WeakRetained;
    __int16 v36 = 2114;
    uint64_t v37 = v9;
    __int16 v38 = 2114;
    uint64_t v39 = v10;
    _os_log_impl(&dword_2183AD000, v4, OS_LOG_TYPE_DEFAULT, "\"Daemon save called for account %@: username=%@, client=%@ (%{public}@), verify=%{public}@\"", buf, 0x34u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_190;
  aBlock[3] = &unk_264321238;
  CFAbsoluteTime v29 = Current;
  id v28 = *(id *)(a1 + 56);
  id v11 = v2;
  id v27 = v11;
  id v12 = (void (**)(void *, void))_Block_copy(aBlock);
  id v13 = [*(id *)(*(void *)(a1 + 40) + 120) managedObjectContext];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192;
  v23[3] = &unk_264320CA0;
  int8x16_t v19 = *(int8x16_t *)(a1 + 32);
  id v14 = (id)v19.i64[0];
  int8x16_t v24 = vextq_s8(v19, v19, 8uLL);
  uint64_t v25 = *(void *)(a1 + 64);
  [v13 performBlockAndWait:v23];

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v12[2](v12, 0);
  }
  else if (*(unsigned char *)(a1 + 72) {
         && [*(id *)(a1 + 32) isActive]
  }
         && ([*(id *)(a1 + 32) isAuthenticated] & 1) == 0
         && [*(id *)(a1 + 32) supportsAuthentication]
         && ([*(id *)(a1 + 32) authenticationType],
             id v15 = objc_claimAutoreleasedReturnValue(),
             char v16 = [v15 isEqualToString:*MEMORY[0x263EFB3A8]],
             v15,
             (v16 & 1) == 0))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196;
    v20[3] = &unk_264321198;
    void v20[4] = v17;
    id v21 = *(id *)(a1 + 48);
    id v22 = v12;
    [v17 verifyCredentialsForAccount:v18 saveWhenAuthorized:0 withHandler:v20];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_completeSave:dataclassActions:completion:", *(void *)(a1 + 32), *(void *)(a1 + 48), v12, *(_OWORD *)&v19);
  }
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  double Current = CFAbsoluteTimeGetCurrent();
  double v8 = *(double *)(a1 + 48);
  BOOL v9 = _ACDLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [NSNumber numberWithDouble:Current - v8];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl(&dword_2183AD000, v9, OS_LOG_TYPE_DEFAULT, "\"TIMING: Daemon save took %@\"", (uint8_t *)&v11, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  uint64_t v3 = [v2 persistentStoreCoordinator];
  uint64_t v4 = [*(id *)(a1 + 40) accountType];
  id v5 = [v4 objectID];
  id v6 = [v3 managedObjectIDForURIRepresentation:v5];

  if (v6
    && ([*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectWithID:v6],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    BOOL v9 = [*(id *)(a1 + 40) objectID];
    if (v9
      || ([v8 obsolete],
          BOOL v9 = objc_claimAutoreleasedReturnValue(),
          ![v9 BOOLValue]))
    {
    }
    else
    {
      int v10 = [*(id *)(a1 + 32) shouldPreventAccountCreationWithObsoleteAccountType];

      if (v10)
      {
        int v11 = NSString;
        id v12 = [*(id *)(a1 + 40) accountType];
        uint64_t v13 = [v12 accountTypeDescription];
        id v14 = [v11 stringWithFormat:@"Creating %@ accounts is not supported.", v13];

        id v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263EFB070];
        id v17 = [NSDictionary dictionaryWithObject:v14 forKey:*MEMORY[0x263F08320]];
        uint64_t v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];
        uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

LABEL_14:
        goto LABEL_15;
      }
    }
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v31 = a1 + 48;
    uint64_t v33 = *(void **)(v31 - 16);
    uint64_t v34 = *(void *)(v31 - 8);
    uint64_t v35 = *(void *)(v32 + 8);
    obuint64_t j = *(id *)(v35 + 40);
    char v36 = [v33 _canSaveAccount:v34 error:&obj];
    objc_storeStrong((id *)(v35 + 40), obj);
    if ((v36 & 1) == 0)
    {
      id v14 = _ACDLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192_cold_2();
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v21 = [NSString stringWithFormat:@"The account being saved is missing a valid account type"];
    id v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263EFB070];
    int8x16_t v24 = [NSDictionary dictionaryWithObject:v21 forKey:*MEMORY[0x263F08320]];
    uint64_t v25 = [v22 errorWithDomain:v23 code:2 userInfo:v24];
    uint64_t v27 = *(void *)(a1 + 48);
    uint64_t v26 = a1 + 48;
    uint64_t v28 = *(void *)(v27 + 8);
    CFAbsoluteTime v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v25;

    uint64_t v30 = _ACDLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192_cold_1(v26);
    }

    double v8 = 0;
  }
LABEL_15:
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _completeSave:v5 dataclassActions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = _ACDLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v8) {
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196_cold_2(v6);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (v8) {
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196_cold_1();
      }

      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:3 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
}

- (BOOL)shouldPreventAccountCreationWithObsoleteAccountType
{
  return 1;
}

- (id)_lockForAccountType:(id)a3
{
  id v3 = a3;
  if (_lockForAccountType__onceToken != -1) {
    dispatch_once(&_lockForAccountType__onceToken, &__block_literal_global_198);
  }
  uint64_t v4 = [v3 identifier];
  if (v4)
  {
    id v5 = (id)_lockForAccountType__accountTypeLocks;
    objc_sync_enter(v5);
    id v6 = [(id)_lockForAccountType__accountTypeLocks objectForKeyedSubscript:v4];

    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      [(id)_lockForAccountType__accountTypeLocks setObject:v7 forKeyedSubscript:v4];
    }
    BOOL v8 = [(id)_lockForAccountType__accountTypeLocks objectForKeyedSubscript:v4];
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __39__ACDAccountStore__lockForAccountType___block_invoke()
{
  _lockForAccountType__accountTypeLocks = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)_completeSave:(id)a3 dataclassActions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *, void))a5;
  int v11 = _ACDLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _completeSave:dataclassActions:completion:]();
  }

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = 0;
  uint64_t v23 = 0;
  int8x16_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  [v8 _setAccountStore:self];
  id v12 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __61__ACDAccountStore__completeSave_dataclassActions_completion___block_invoke;
  v17[3] = &unk_264321288;
  id v13 = v8;
  id v18 = v13;
  uint64_t v19 = self;
  id v21 = &v27;
  id v22 = &v23;
  id v14 = v9;
  id v20 = v14;
  [v12 performBlockAndWait:v17];

  id v15 = _ACDLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _completeSave:dataclassActions:completion:]();
  }

  if (*((unsigned char *)v24 + 24))
  {
    uint64_t v16 = [v13 objectID];
    v10[2](v10, v16, v28[5]);
  }
  else
  {
    v10[2](v10, 0, v28[5]);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __61__ACDAccountStore__completeSave_dataclassActions_completion___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectID];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = (void *)v3[15];
    id v5 = [*(id *)(a1 + 32) objectID];
    id v6 = [v4 existingObjectWithURI:v5];

    uint64_t v7 = *(void *)(a1 + 32);
    if (v6)
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      obuint64_t j = *(id *)(v10 + 40);
      char v11 = [v8 _handleAccountMod:v7 withDataclassActions:v9 withError:&obj];
      objc_storeStrong((id *)(v10 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
      return;
    }
    uint64_t v23 = NSString;
    int8x16_t v24 = [*(id *)(a1 + 32) objectID];
    id v13 = [v23 stringWithFormat:@"The account with object ID %@ is unknown to our DB, so it cannot be updated. It has probably already been deleted.", v24];

    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263EFB070];
    uint64_t v34 = *MEMORY[0x263F08320];
    v35[0] = v13;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v28 = [v25 errorWithDomain:v26 code:15 userInfo:v27];
    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) accountType];
    id v13 = [v3 _lockForAccountType:v12];

    [v13 lock];
    uint64_t v15 = *(void *)(a1 + 32);
    id v14 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v33 = *(id *)(v16 + 40);
    int v17 = [v14 _canSaveAccount:v15 error:&v33];
    objc_storeStrong((id *)(v16 + 40), v33);
    if (v17)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      id v32 = *(id *)(v21 + 40);
      char v22 = [v18 _handleAccountAdd:v19 withDataclassActions:v20 error:&v32];
      objc_storeStrong((id *)(v21 + 40), v32);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22;
    }
    [v13 unlock];
  }
}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke;
  v15[3] = &unk_264321080;
  id v16 = v8;
  int v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performWithinPersonaForAccount:v14 withBlock:v15];
}

void __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  id v3 = (void **)(a1 + 40);
  [*(id *)(a1 + 32) _setAccountStore:*(void *)(a1 + 40)];
  uint64_t v4 = _ACDLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_cold_1();
  }

  id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x263EFB3A0]];
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = *v2;
  id v11 = 0;
  int v9 = [v7 _canSaveAccount:v8 error:&v11];
  id v10 = v11;
  if (v9)
  {
LABEL_7:
    [*(id *)(*(void *)(a1 + 40) + 176) verifyCredentialsForAccount:*(void *)(a1 + 32) accountStore:*(void *)(a1 + 40) options:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_8:
}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke;
  v15[3] = &unk_2643212D8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [v11 performWithinPersonaForAccount:v14 withBlock:v15];
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 120) managedObjectContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2;
  v13[3] = &unk_264320CA0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = v3;
  uint64_t v15 = v4;
  id v16 = &v17;
  [v2 performBlockAndWait:v13];

  if (v18[5])
  {
    uint64_t v5 = *(void *)(a1 + 56);
    int v6 = [NSNumber numberWithInt:2];
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, v18[5]);
  }
  else
  {
    [*(id *)(a1 + 40) _setAccountStore:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v7 + 176);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_203;
    v11[3] = &unk_2643212B0;
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v9 renewCredentialsForAccount:v8 accountStore:v7 options:v10 completion:v11];
    int v6 = v12;
  }

  _Block_object_dispose(&v17, 8);
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectID];
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 120);
    uint64_t v5 = [*(id *)(a1 + 32) objectID];
    int v6 = [v4 existingObjectWithURI:v5];

    if (!v6)
    {
      uint64_t v7 = _ACDLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2_cold_1();
      }

      uint64_t v8 = NSString;
      id v9 = [*(id *)(a1 + 32) objectID];
      uint64_t v10 = [v8 stringWithFormat:@"The account with object ID %@ is unknown to our DB, so it cannot be updated. It has probably already been deleted.", v9];

      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263EFB070];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18[0] = v10;
      id v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v14 = [v11 errorWithDomain:v12 code:15 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_203(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

- (void)requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 withHandler:(id)a5
{
}

- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, id, void))a4;
  authorizationManager = self->_authorizationManager;
  uint64_t v8 = [a3 identifier];
  id v9 = [(ACDClientAuthorizationManager *)authorizationManager allAuthorizationsForAccountTypeWithIdentifier:v8];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isGranted", (void)v20));
        id v18 = [v16 client];
        uint64_t v19 = [v18 bundleID];

        if (v19) {
          [v10 setValue:v17 forKey:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  v6[2](v6, v10, 0);
}

- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 identifier];
  uint64_t v15 = [(ACDAccountStore *)self accountTypeWithIdentifier:v14];

  id v16 = +[ACDClient clientWithBundleID:v12];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke;
  aBlock[3] = &unk_264321328;
  id v17 = v10;
  id v23 = v17;
  id v18 = v11;
  int8x16_t v24 = self;
  id v25 = v18;
  uint64_t v19 = _Block_copy(aBlock);
  char v20 = [v13 BOOLValue];

  accessPluginManager = self->_accessPluginManager;
  if (v20) {
    [(ACDAccessPluginManager *)accessPluginManager authorizeAccessToAccountsOfType:v15 forClient:v16 store:self completion:v19];
  }
  else {
    [(ACDAccessPluginManager *)accessPluginManager revokeAccessToAccountsOfType:v15 forClient:v16 store:self completion:v19];
  }
}

void __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[ACDAccountStore accountCache];
  [v5 removeAccountType:*(void *)(a1 + 32)];

  if (v4)
  {
    id v6 = _ACDLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) delegate];
    [v8 accountStore:*(void *)(a1 + 40) didSaveAccount:0 changeType:2];

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 identifier];
  id v9 = [(ACDAccountStore *)self accountTypeWithIdentifier:v8];

  accessPluginManager = self->_accessPluginManager;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke;
  v13[3] = &unk_264321328;
  uint64_t v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  [(ACDAccessPluginManager *)accessPluginManager revokeAllAccessToAccountsOfType:v9 store:self withCompletion:v13];
}

void __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[ACDAccountStore accountCache];
  [v5 removeAccountType:*(void *)(a1 + 32)];

  id v6 = _ACDLogSystem();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v8 = [*(id *)(a1 + 40) delegate];
  [v8 accountStore:*(void *)(a1 + 40) didSaveAccount:0 changeType:2];
}

- (void)permissionForAccountType:(id)a3 withHandler:(id)a4
{
  id v15 = a3;
  p_client = &self->_client;
  id v7 = (void (**)(id, void *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  int v9 = [WeakRetained hasEntitlement:*MEMORY[0x263EFB2B0]];

  if (v9)
  {
    id v10 = [NSNumber numberWithBool:1];
  }
  else
  {
    authorizationManager = self->_authorizationManager;
    id v12 = objc_loadWeakRetained((id *)p_client);
    id v13 = [v15 identifier];
    id v14 = [(ACDClientAuthorizationManager *)authorizationManager authorizationForClient:v12 accountTypeWithIdentifier:v13];

    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "isGranted"));
  }
  v7[2](v7, v10, 0);
}

- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  authorizationManager = self->_authorizationManager;
  p_client = &self->_client;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_client);
  id v10 = [v8 identifier];

  id v12 = [(ACDClientAuthorizationManager *)authorizationManager authorizationForClient:WeakRetained accountTypeWithIdentifier:v10];

  id v11 = [v12 grantedPermissions];
  v7[2](v7, v11, 0);
}

- (void)clearGrantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  int v9 = [(ACDAccountStore *)self accountTypeWithIdentifier:v8];

  accessPluginManager = self->_accessPluginManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke;
  v14[3] = &unk_264321350;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [(ACDAccessPluginManager *)accessPluginManager revokeAccessToAccountsOfType:v9 forClient:WeakRetained store:self completion:v14];
}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _ACDLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v7 = [*(id *)(a1 + 32) authorizationManager];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  id v9 = (id)[v7 removeAuthorizationForClient:WeakRetained accountType:*(void *)(a1 + 40)];

  id v10 = [*(id *)(a1 + 32) delegate];
  [v10 accountStore:*(void *)(a1 + 32) didSaveAccount:0 changeType:2];
}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(ACDAccountStore *)self dataclassOwnersManager];
  id v7 = 0;
  [v5 preloadDataclassOwnersWithError:&v7];
  id v6 = v7;

  if (v4) {
    v4[2](v4, v6);
  }
}

- (void)dataclassActionsForAccountSave:(id)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  [v6 _setAccountStore:self];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke;
  aBlock[3] = &unk_264321378;
  void aBlock[4] = self;
  id v8 = v6;
  id v24 = v8;
  id v9 = (void (**)(void *, id, void *, id *))_Block_copy(aBlock);
  id v10 = [v8 trackedEnabledDataclasses];
  id v11 = [v10 allModifications];

  if ([v11 count])
  {
    if ([v11 count] == 1)
    {
      id v12 = [v11 allKeys];
      id v13 = [v12 firstObject];

      id v14 = [v11 objectForKeyedSubscript:v13];
      id v22 = 0;
      id v15 = v9[2](v9, v13, v14, &v22);
      id v16 = v22;
      if (v15)
      {
        id v25 = v13;
        v26[0] = v15;
        id v17 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
        v7[2](v7, v17, v16);
      }
      else
      {
        v7[2](v7, 0, v16);
      }
    }
    else
    {
      id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke_2;
      v19[3] = &unk_264321008;
      id v20 = v18;
      long long v21 = v9;
      id v13 = v18;
      [v11 enumerateKeysAndObjectsUsingBlock:v19];
      v7[2](v7, v13, 0);
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

id __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v8 isEqualToString:*MEMORY[0x263EFB010]])
  {
    id v9 = [*(id *)(a1 + 32) dataclassOwnersManager];
    uint64_t v10 = [v9 actionsForEnablingDataclass:v7 onAccount:*(void *)(a1 + 40) withError:a4];
LABEL_5:
    id v11 = (void *)v10;

    goto LABEL_7;
  }
  if ([v8 isEqualToString:*MEMORY[0x263EFB020]])
  {
    id v9 = [*(id *)(a1 + 32) dataclassOwnersManager];
    uint64_t v10 = [v9 actionsForDisablingDataclass:v7 onAccount:*(void *)(a1 + 40) withError:a4];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

void __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v8 = 0;
  id v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
  else if (v8)
  {
    uint64_t v10 = _ACDLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_error_impl(&dword_2183AD000, v10, OS_LOG_TYPE_ERROR, "\"Failed to get actions for dataclass: %@, changeType: %@, error: %@\"", buf, 0x20u);
    }

    id v11 = [MEMORY[0x263EFB238] _actionForError:v9];
    id v13 = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v5];
  }
}

- (void)dataclassActionsForAccountDeletion:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v19 = (void (**)(id, id, id))a4;
  [v6 _setAccountStore:self];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [v6 enabledDataclasses];
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v12 = v9;
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [(ACDAccountStore *)self dataclassOwnersManager];
        id v22 = v9;
        id v15 = [v14 actionsForDeletingAccount:v6 affectingDataclass:v13 withError:&v22];
        id v9 = v22;

        if ([v15 count])
        {
          [v21 setObject:v15 forKey:v13];
        }
        else if (v9)
        {
          __int16 v16 = _ACDLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v29 = v13;
            __int16 v30 = 2112;
            id v31 = v9;
            _os_log_error_impl(&dword_2183AD000, v16, OS_LOG_TYPE_ERROR, "\"Failed to query actions for dataclass %@, error: %@\"", buf, 0x16u);
          }

          id v17 = [MEMORY[0x263EFB238] _actionForError:v9];
          uint64_t v27 = v17;
          __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
          [v21 setObject:v18 forKey:v13];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  v19[2](v19, v21, v9);
}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v9 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  [v6 _setAccountStore:self];
  uint64_t v7 = [(ACDAccountStore *)self dataclassOwnersManager];
  uint64_t v8 = [v7 isPerformingDataclassActionsForAccount:v6];

  v9[2](v9, v8, 0);
}

- (void)accountExistsWithDescription:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __59__ACDAccountStore_accountExistsWithDescription_completion___block_invoke;
  v10[3] = &unk_264320CA0;
  id v9 = v6;
  id v11 = v9;
  id v12 = self;
  uint64_t v13 = &v14;
  [v8 performBlockAndWait:v10];

  (*((void (**)(id, void, void))v7 + 2))(v7, *((unsigned __int8 *)v15 + 24), 0);
  _Block_object_dispose(&v14, 8);
}

void __59__ACDAccountStore_accountExistsWithDescription_completion___block_invoke(void *a1)
{
  [MEMORY[0x263F08A98] predicateWithFormat:@"accountDescription == %@", a1[4]];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void **)(a1[5] + 120);
  id v3 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  id v4 = [v2 fetchObjectsForEntityNamed:@"Account" withPredicate:v5 sortDescriptor:0 prefetchKeypaths:v3];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 count] != 0;
}

- (void)isTetheredSyncingEnabledForDataclass:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void, void *))a4;
  uint64_t v6 = syncDataTypeForDataclass(a3);
  if (!v6)
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:0];
LABEL_6:
    v5[2](v5, 0, v7);

    goto LABEL_7;
  }
  char v11 = 0;
  if (!GetTetheredSyncingDisabledForDataType(v6, &v11))
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263EFB070];
    uint64_t v12 = *MEMORY[0x263F08320];
    v13[0] = @"GetTetheredSyncingDisabledForDataType failed!";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = [v8 errorWithDomain:v9 code:1 userInfo:v10];

    goto LABEL_6;
  }
  ((void (**)(id, BOOL, void *))v5)[2](v5, v11 == 0, 0);
LABEL_7:
}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__3;
  __int16 v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v8 = _ACDLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore kerberosAccountsForDomainFromURL:completion:]();
  }

  uint64_t v9 = [v6 absoluteString];
  if (v9)
  {
    uint64_t v10 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__ACDAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke;
    v11[3] = &unk_2643213A0;
    void v11[4] = self;
    uint64_t v13 = &v14;
    id v12 = v9;
    [v10 performBlockAndWait:v11];
  }
  v7[2](v7, v15[5], 0);

  _Block_object_dispose(&v14, 8);
}

void __63__ACDAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 120);
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier matches 'com.apple.account.kerberos.sso.*'"];
  id v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  id v5 = [v2 fetchObjectsForEntityNamed:@"Account" withPredicate:v3 sortDescriptor:0 prefetchKeypaths:v4];

  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:*(void *)(*((void *)&v28 + 1) + 8 * v12) accountStore:*(void *)(a1 + 32)];
          uint64_t v14 = [v13 accountProperties];
          id v15 = [v14 objectForKeyedSubscript:@"domains"];

          uint64_t v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v17 = v15;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v25;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v25 != v20) {
                  objc_enumerationMutation(v17);
                }
                GSSRuleAddMatch();
                ++v21;
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v19);
          }

          if (GSSRuleGetMatch()) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v13];
          }

          ++v12;
        }
        while (v12 != v10);
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    id v5 = v22;
  }
}

- (void)isPushSupportedForAccount:(id)a3 completion:(id)a4
{
  authenticationPluginManager = self->_authenticationPluginManager;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v6[2](v6, [(ACDAuthenticationPluginManager *)authenticationPluginManager isPushSupportedForAccount:a3], 0);
}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 _setAccountStore:self];
  [(ACDAuthenticationPluginManager *)self->_authenticationPluginManager discoverPropertiesForAccount:v10 accountStore:self options:v9 completion:v8];
}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  databaseConnection = self->_databaseConnection;
  id v8 = (void (**)(id, uint64_t, void))a4;
  [(ACDDatabaseConnection *)databaseConnection setVersion:v6];
  id v9 = self->_databaseConnection;
  id v14 = 0;
  BOOL v10 = [(ACDDatabaseConnection *)v9 saveWithError:&v14];
  id v11 = v14;
  uint64_t v12 = _ACDLogSystem();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "\"Reset database to version %@, will exit when clean\"", buf, 0xCu);
    }

    v8[2](v8, 1, 0);
    xpc_transaction_exit_clean();
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore resetDatabaseToVersion:withCompletion:]();
    }

    ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v11);
  }
}

- (id)_clientTokenQueue
{
  if (_clientTokenQueue_onceToken != -1) {
    dispatch_once(&_clientTokenQueue_onceToken, &__block_literal_global_225);
  }
  uint64_t v2 = (void *)_clientTokenQueue_clientTokenQueue;

  return v2;
}

void __36__ACDAccountStore__clientTokenQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.accounts.clienttoken", v2);
  v1 = (void *)_clientTokenQueue_clientTokenQueue;
  _clientTokenQueue_clientTokenQueue = (uint64_t)v0;
}

- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke;
  v14[3] = &unk_2643213C8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(ACDAccountStore *)self accountWithIdentifier:v12 handler:v14];
}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x263EFB268];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_2;
  v6[3] = &unk_264321080;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v4 performWithinPersonaForAccount:a2 withBlock:v6];
}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] _clientTokenQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_3;
  v5[3] = &unk_264321080;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  id v9 = a1[7];
  dispatch_async(v2, v5);
}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) _clientTokenForAccountIdentifier:*(void *)(a1 + 48) error:0];

    if (v2)
    {
      id v3 = 0;
    }
    else
    {
      uint64_t v8 = *MEMORY[0x263F16E90];
      v9[0] = *MEMORY[0x263F16EA0];
      id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      id v5 = [*(id *)(a1 + 32) dataUsingEncoding:4];
      uint64_t v6 = *(void *)(a1 + 48);
      id v7 = 0;
      +[ACDKeychain addItemWithServiceName:@"com.apple.account.clientToken" username:v6 accessGroup:0 passwordData:v5 options:v4 error:&v7];
      id v3 = v7;
    }
  }
  else
  {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)clientTokenForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_264321198;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ACDAccountStore *)self accountWithIdentifier:v9 handler:v10];
}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x263EFB268];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_2;
  v6[3] = &unk_264321170;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v4 performWithinPersonaForAccount:a2 withBlock:v6];
}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] _clientTokenQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3;
  block[3] = &unk_264321170;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, block);
}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) _clientTokenForAccountIdentifier:v2 error:0];
  }
  else
  {
    id v4 = _ACDLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3_cold_1();
    }

    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)clientTokenForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = (void *)MEMORY[0x263EFB268];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __41__ACDAccountStore_clientTokenForAccount___block_invoke;
  v9[3] = &unk_2643213A0;
  void v9[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performWithinPersonaForAccount:v6 withBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__ACDAccountStore_clientTokenForAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _clientTokenQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ACDAccountStore_clientTokenForAccount___block_invoke_2;
  block[3] = &unk_264320A48;
  void block[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_sync(v2, block);
}

void __41__ACDAccountStore_clientTokenForAccount___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [v2 _clientTokenForAccountIdentifier:v6 error:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_clientTokenForAccountIdentifier:(id)a3 error:(id)a4
{
  id v10 = a4;
  id v5 = a4;
  id v6 = +[ACDKeychain passwordForServiceName:@"com.apple.account.clientToken" username:a3 accessGroup:0 options:0 error:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = _ACDLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _clientTokenForAccountIdentifier:error:]();
    }
  }

  return v6;
}

- (void)_removeClientTokenForAccountIdentifer:(id)a3
{
  id v5 = 0;
  +[ACDKeychain removeItemForServiceName:@"com.apple.account.clientToken" username:a3 accessGroup:0 options:0 error:&v5];
  id v3 = v5;
  if (v3)
  {
    uint64_t v4 = _ACDLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _removeClientTokenForAccountIdentifer:]();
    }
  }
}

- (void)handleURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Handling URL %@\"", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__3;
  long long v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  id v6 = [v4 host];
  BOOL v7 = [v6 compare:@"client_token" options:1] == 0;

  if (v7)
  {
    id v9 = [v4 path];
    if ((unint64_t)[v9 length] >= 2)
    {
      id v10 = [v9 substringFromIndex:1];

      id v11 = [(ACDAccountStore *)self _allAccounts_sync];
      uint64_t v12 = [(ACDAccountStore *)self _clientTokenQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      void v18[2] = __29__ACDAccountStore_handleURL___block_invoke;
      v18[3] = &unk_264321120;
      id v19 = v11;
      uint64_t v20 = self;
      id v9 = v10;
      id v21 = v9;
      p_long long buf = &buf;
      id v13 = v11;
      dispatch_sync(v12, v18);
    }
  }
  else
  {
    uint64_t v8 = [v4 host];
    id v9 = *(id *)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v8;
  }

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v14 = _ACDLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)long long v23 = 138412290;
      uint64_t v24 = v15;
      _os_log_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEFAULT, "\"Found a matching account with identifier %@\"", v23, 0xCu);
    }

    id v16 = [(ACDAccountStore *)self accountWithIdentifier:*(void *)(*((void *)&buf + 1) + 40)];
    id v17 = v16;
    if (v16)
    {
      [v16 setLastCredentialRenewalRejectionDate:0];
      [v17 setAuthenticated:1];
      [(ACDAccountStore *)self saveVerifiedAccount:v17 error:0];
    }
  }
  else
  {
    id v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore handleURL:]();
    }
  }

  _Block_object_dispose(&buf, 8);
}

void __29__ACDAccountStore_handleURL___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 40);
        id v9 = objc_msgSend(v7, "identifier", (void)v15);
        id v10 = [v8 _clientTokenForAccountIdentifier:v9 error:0];
        int v11 = [v10 isEqualToString:*(void *)(a1 + 48)];

        if (v11)
        {
          uint64_t v12 = [v7 identifier];
          uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)remoteAccountStoreSession
{
  fakeRemoteAccountStoreSession = self->_fakeRemoteAccountStoreSession;
  if (!fakeRemoteAccountStoreSession)
  {
    uint64_t v4 = [[ACDFakeRemoteAccountStoreSession alloc] initWithFakeProxy:self];
    uint64_t v5 = self->_fakeRemoteAccountStoreSession;
    self->_fakeRemoteAccountStoreSession = v4;

    fakeRemoteAccountStoreSession = self->_fakeRemoteAccountStoreSession;
  }

  return fakeRemoteAccountStoreSession;
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v11 _setAccountStore:self];
  id v13 = [(ACDAccountStore *)self authenticationDialogManager];
  [v13 openAuthenticationURL:v12 forAccount:v11 shouldConfirm:v6 completion:v10];
}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  [v15 _setAccountStore:self];
  id v16 = [(ACDAccountStore *)self authenticationDialogManager];
  [v16 openAuthenticationURLForAccount:v15 withDelegateClassName:v14 fromBundleAtPath:v13 shouldConfirm:v7 completion:v12];
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__ACDAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke;
  v11[3] = &unk_264321170;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

void __80__ACDAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"visible == YES && parentAccount == nil && accountType.identifier IN %@", a1[4]];
  uint64_t v3 = *(void **)(a1[5] + 120);
  uint64_t v4 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  uint64_t v5 = [v3 fetchObjectsForEntityNamed:@"Account" withPredicate:v2 sortDescriptor:0 prefetchKeypaths:v4];

  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v13 = a1[6];
  if (v13) {
    (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v6, 0);
  }
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4
{
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  long long v14 = _ACLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:]();
  }

  [v10 _setAccountStore:self];
  remoteDeviceProxy = self->_remoteDeviceProxy;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __90__ACDAccountStore_notifyRemoteDevicesOfModifiedAccount_withChangeType_options_completion___block_invoke;
  v17[3] = &unk_264321418;
  id v18 = v12;
  id v16 = v12;
  [(ACRemoteDeviceProxy *)remoteDeviceProxy sendCommand:v11 withAccount:v10 options:v13 completion:v17];
}

uint64_t __90__ACDAccountStore_notifyRemoteDevicesOfModifiedAccount_withChangeType_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore saveAccount:toPairedDeviceWithOptions:completion:]();
  }

  [v8 _setAccountStore:self];
  remoteDeviceProxy = self->_remoteDeviceProxy;
  uint64_t v13 = *MEMORY[0x263EFB178];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __68__ACDAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke;
  v15[3] = &unk_264321418;
  id v16 = v9;
  id v14 = v9;
  [(ACRemoteDeviceProxy *)remoteDeviceProxy sendCommand:v13 withAccount:v8 options:v10 completion:v15];
}

uint64_t __68__ACDAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore removeAccountsFromPairedDeviceWithOptions:completion:]();
  }

  remoteDeviceProxy = self->_remoteDeviceProxy;
  uint64_t v10 = *MEMORY[0x263EFB188];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__ACDAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke;
  v12[3] = &unk_264321418;
  id v13 = v6;
  id v11 = v6;
  [(ACRemoteDeviceProxy *)remoteDeviceProxy sendCommand:v10 withAccount:0 options:v7 completion:v12];
}

uint64_t __72__ACDAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _ACLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore removeAccountFromPairedDevice:withOptions:completion:]();
  }

  remoteDeviceProxy = self->_remoteDeviceProxy;
  uint64_t v13 = *MEMORY[0x263EFB180];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __72__ACDAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke;
  v15[3] = &unk_264321418;
  id v16 = v8;
  id v14 = v8;
  [(ACRemoteDeviceProxy *)remoteDeviceProxy sendCommand:v13 withAccount:v10 options:v9 completion:v15];
}

uint64_t __72__ACDAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore migrateCredentialForAccount:completion:]();
  }

  id v8 = +[ACDKeychainMigrator sharedInstance];
  v23[0] = v5;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v10 = [v8 keychainItemsForAccounts:v9];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
        long long v17 = +[ACDKeychainMigrator sharedInstance];
        [v17 migrateKeychainItem:v16 toKeybag:1];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  +[ACDKeychainManager notifiyCredentialChangedForAccount:v5];
  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (void)triggerKeychainMigrationIfNecessary:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, BOOL, id))a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore triggerKeychainMigrationIfNecessary:]();
  }

  p_databaseConnection = &self->_databaseConnection;
  id v7 = [(ACDDatabaseConnection *)self->_databaseConnection keychainVersion];
  uint64_t v8 = [v7 integerValue];
  id v9 = _ACLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [NSNumber numberWithInteger:7];
    id v11 = (void *)v10;
    uint64_t v12 = @"NO";
    *(_DWORD *)long long buf = 138412802;
    long long v21 = v7;
    __int16 v22 = 2112;
    if (v8 < 7) {
      uint64_t v12 = @"YES";
    }
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    long long v25 = v12;
    _os_log_impl(&dword_2183AD000, v9, OS_LOG_TYPE_DEFAULT, "\"Database keychain version: %@, expected version: %@, will migrate: %@\"", buf, 0x20u);
  }
  if (v8 >= 7)
  {
    id v17 = 0;
  }
  else
  {
    uint64_t v13 = +[ACDKeychainMigrator sharedInstance];
    [v13 migrateAllKeychainItems];

    uint64_t v14 = *p_databaseConnection;
    uint64_t v15 = [NSNumber numberWithInteger:7];
    [(ACDDatabaseConnection *)v14 setKeychainVersion:v15];

    uint64_t v16 = *p_databaseConnection;
    id v19 = 0;
    [(ACDDatabaseConnection *)v16 saveWithError:&v19];
    id v17 = v19;
    if (v17)
    {
      long long v18 = _ACDLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ACDAccountStore triggerKeychainMigrationIfNecessary:]();
      }
    }
  }
  if (v4) {
    v4[2](v4, v17 == 0, v17);
  }
}

- (void)runAccountMigrationPlugins:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL))a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore runAccountMigrationPlugins:]();
  }

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3;
  uint64_t v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  id v6 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ACDAccountStore_runAccountMigrationPlugins___block_invoke;
  v7[3] = &unk_264320D18;
  void v7[4] = self;
  v7[5] = v8;
  void v7[6] = &v10;
  [v6 performBlockAndWait:v7];

  if (v4) {
    v4[2](v4, v11[5] == 0);
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
}

void __46__ACDAccountStore_runAccountMigrationPlugins___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accountTypeWithIdentifier:*MEMORY[0x263EFB000]];
  uint64_t v3 = [*(id *)(a1 + 32) _accountTypeWithIdentifier:*MEMORY[0x263EFB008]];
  uint64_t v4 = *(void **)(a1 + 32);
  id v15 = 0;
  [v4 _pruneDuplicateAccountsForAccountType:v2 withUserName:@"local" error:&v15];
  id v5 = v15;
  id v6 = *(void **)(a1 + 32);
  id v14 = v5;
  [v6 _pruneDuplicateAccountsForAccountType:v3 withUserName:@"local" error:&v14];
  id v7 = v14;

  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 120);
  id v13 = v7;
  LOBYTE(v5) = [v8 saveWithError:&v13];
  id v9 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
  if (v9)
  {
    uint64_t v10 = objc_msgSend(v9, "ac_secureCodingError");
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (void)_pruneDuplicateAccountsForAccountType:(id)a3 withUserName:(id)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _ACLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:]();
  }

  id v36 = v7;
  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType == %@ && username == %@", v7, v8];
  uint64_t v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
  uint64_t v12 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Account"];
  uint64_t v35 = (void *)v10;
  [v12 setPredicate:v10];
  uint64_t v34 = (void *)v11;
  v45[0] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
  [v12 setSortDescriptors:v13];

  [v12 setFetchLimit:1];
  id v14 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  id v38 = 0;
  id v15 = [v14 executeFetchRequest:v12 error:&v38];
  id v16 = v38;

  if (v16)
  {
    id v17 = _ACDLogSystem();
    long long v18 = v36;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v40 = v36;
      __int16 v41 = 2112;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v16;
      _os_log_error_impl(&dword_2183AD000, v17, OS_LOG_TYPE_ERROR, "@\"Error pruning accounts of type %@ with username %@: %@\"", buf, 0x20u);
    }

    if (a5)
    {
      id v16 = v16;
      *a5 = v16;
    }
  }
  else if ([v15 count])
  {
    if ([v15 count] != 1)
    {
      long long v31 = [MEMORY[0x263F08690] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"ACDAccountStore.m" lineNumber:3200 description:@"Should only be one value returned here!"];
    }
    id v19 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Account"];
    long long v20 = (void *)MEMORY[0x263F08A98];
    long long v21 = [v15 firstObject];
    __int16 v22 = v19;
    uint64_t v23 = [v20 predicateWithFormat:@"accountType == %@ && username == %@ && SELF != %@", v36, v8, v21];
    [v19 setPredicate:v23];

    __int16 v24 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v19];
    [v24 setResultType:2];
    long long v25 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
    id v37 = 0;
    uint64_t v26 = [v25 executeRequest:v24 error:&v37];
    id v16 = v37;

    long long v27 = _ACDLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:](v26);
    }
    long long v28 = v26;

    long long v18 = v36;
    if (v16)
    {
      id v29 = _ACDLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v40 = v36;
        __int16 v41 = 2112;
        id v42 = v8;
        __int16 v43 = 2112;
        id v44 = v16;
        _os_log_error_impl(&dword_2183AD000, v29, OS_LOG_TYPE_ERROR, "@\"Error pruning accounts of type %@ with username %@: %@\"", buf, 0x20u);
      }

      if (a5) {
        *a5 = v16;
      }
    }
  }
  else
  {
    uint64_t v30 = _ACDLogSystem();
    long long v18 = v36;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:]();
    }

    id v16 = 0;
  }
}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = [(ACDAccountStore *)self databaseBackupActivity];
  [v4 scheduleBackupIfNonexistent];

  v5[2](v5, 1, 0);
}

- (void)shutdownAccountsD:(id)a3
{
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);

  xpc_transaction_exit_clean();
}

- (void)accountsWithTypeIdentifier:(id)a3 propertyKey:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, uint64_t, void))a7;
  id v17 = _ACDLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACDAccountStore accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:]();
  }

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  long long v18 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  void v22[2] = __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke;
  v22[3] = &unk_264321440;
  id v19 = v13;
  id v23 = v19;
  id v20 = v14;
  id v24 = v20;
  id v21 = v12;
  id v25 = v21;
  uint64_t v26 = self;
  long long v27 = &v28;
  [v18 performBlockAndWait:v22];

  [(ACDAccountStore *)self cacheGenerationForAccounts:v29[5] cacheSuffix:v15];
  v16[2](v16, v29[5], 0);

  _Block_object_dispose(&v28, 8);
}

void __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke(void *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"key == %@ && value == %@ && owner.accountType.identifier == %@", a1[4], a1[5], a1[6]];
  uint64_t v3 = [*(id *)(a1[7] + 120) fetchObjectsForEntityNamed:@"AccountProperty" withPredicate:v2 sortDescriptor:0 prefetchKeypaths:0];
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = *(void *)(a1[8] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v3;
    uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      long long v18 = v3;
      id v19 = v2;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          id v8 = [*(id *)(*((void *)&v27 + 1) + 8 * i) owner];
          id v9 = [*(id *)(a1[7] + 120) managedObjectContext];
          [v9 refreshObject:v8 mergeChanges:1];

          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v10 = [v8 customProperties];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v24 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * j);
                id v16 = [*(id *)(a1[7] + 120) managedObjectContext];
                [v16 refreshObject:v15 mergeChanges:1];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v12);
          }

          id v17 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v8 accountStore:a1[7]];
          if (v17) {
            [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v17];
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
      uint64_t v3 = v18;
      id v2 = v19;
    }
  }
  else
  {
    obuint64_t j = _ACDLogSystem();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke_cold_1();
    }
  }
}

- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ACDAccountStore accountCache];
  [v7 cacheGenerationForAccounts:v6 cacheSuffix:v5];
}

- (void)uidOfAccountsd:(id)a3
{
  id v5 = a3;
  uint64_t v4 = geteuid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (ACDAccountStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACDAccountStoreDelegate *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (ACRemoteDeviceProxy)remoteDeviceProxy
{
  return self->_remoteDeviceProxy;
}

- (ACDDatabaseConnection)databaseConnection
{
  return self->_databaseConnection;
}

- (ACDAuthenticationPluginManager)authenticationPluginManager
{
  return self->_authenticationPluginManager;
}

- (ACDAccessPluginManager)accessPluginManager
{
  return self->_accessPluginManager;
}

- (ACDDataclassOwnersManager)dataclassOwnersManager
{
  return self->_dataclassOwnersManager;
}

- (ACDAuthenticationDialogManager)authenticationDialogManager
{
  return self->_authenticationDialogManager;
}

- (ACDAccountNotifier)accountNotifier
{
  return self->_accountNotifier;
}

- (ACDDatabaseBackupActivity)databaseBackupActivity
{
  return self->_databaseBackupActivity;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (BOOL)isMigrationInProgress
{
  return self->_migrationInProgress;
}

- (void)setMigrationInProgress:(BOOL)a3
{
  self->_migrationInProgress = a3;
}

- (void)init
{
  id v6 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v0, v1, "\"Deprecated method called: %{private}s %{private}@\"", v2, v3, v4, v5, 3u);
}

- (void)initWithClient:databaseConnection:.cold.1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v1 = [v0 connection];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Initializing new ACDAccountStore: client=%@, connection=%@\"", v4, v5, v6, v7, 2u);
}

- (void)accountsOnPairedDeviceWithAccountTypes:withOptions:handler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account Sync - Account was marked to NOT sync the delete, we will not delete credentials for: %@\"", v2, v3, v4, v5, v6);
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.3()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)_saveWithError:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
}

- (void)_saveWithError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"ACDAccountStore failed to save its MOC. %{public}@\"", v2, v3, v4, v5, v6);
}

- (void)_saveWithError:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"ACDAccountStore couldn't find just updated account\"", buf, 2u);
}

- (void)_saveWithError:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Caches updated. Next notifying clients.\"", v2, v3, v4, v5, v6);
}

- (void)_saveWithError:.cold.5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"saveWithError completed: %@\"", v2, v3, v4, v5, v6);
}

- (void)_saveWithError:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)_performDataclassActions:forAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
}

- (void)_performDataclassActions:forAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Failed to perform dataclass actions, error: %@\"", v2, v3, v4, v5, v6);
}

- (void)_performDataclassActions:forAccount:error:.cold.3()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)addAccountNoSave:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)addAccountNoSave:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, 3u);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_29(&dword_2183AD000, v0, v1, "\"_addAccountNoSave failed with error: %@ for dataclass actions: %@\"");
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12(&dword_2183AD000, v0, (uint64_t)v0, "\"Unable to add account: %@ Error: %@\"", v1);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account is warming up: %@\"", v2, v3, v4, v5, v6);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account is being created: %@\"", v2, v3, v4, v5, v6);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.8()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)updateAccountNoSave:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)updateAccountNoSave:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.2()
{
  OUTLINED_FUNCTION_23();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 localizedDescription];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v4, v5, "\"Could not find existing account with identifier %@: %@\"", v6, v7, v8, v9, 2u);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12(&dword_2183AD000, v0, (uint64_t)v0, "\"Unable to update account: %@ Error: %@\"", v1);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"ACAccount: _updateAccountNoSave called with no-op change\"", v2, v3, v4, v5, v6);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"%@ is still warming up.\"", v2, v3, v4, v5, v6);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"%@ has completed warming up. Mark as added\"", v2, v3, v4, v5, v6);
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.7()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.2()
{
  OUTLINED_FUNCTION_23();
  uint64_t v1 = [v0 identifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Could not find existing account with identifier %@: %@\"", v4, v5, v6, v7, v8);
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account %@ is being deleted\"", v2, v3, v4, v5, v6);
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.4()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)_dataclassWithName:createIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Adding dataclass with name %@\"", v2, v3, v4, v5, v6);
}

- (void)_canSaveAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Failed to fetch similar accounts, error: %@\"", v2, v3, v4, v5, v6);
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
}

- (void)_setAccountManagedObjectRelationships:(id *)a1 withAccount:oldAccount:error:.cold.2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_20(&dword_2183AD000, v2, v3, "\"Non-entitled client with no bundle ID (%@) trying to save an OAuth2 token\"", v4, v5, v6, v7, v8);
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.3()
{
  OUTLINED_FUNCTION_24();
  uint64_t v1 = [v0 parentAccountIdentifier];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Cannot save %@, the caller is trying to set its parent account to %@, which doesn't exist in our database\"", v4, v5, v6, v7, 2u);
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
}

- (void)_handleAccountMod:withDataclassActions:withError:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
}

- (void)_handleAccountMod:withDataclassActions:withError:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_29(&dword_2183AD000, v0, v1, "\"_updateAccountNoSave failed with error: %@ for dataclass actions: %@\"");
}

- (void)_handleAccountAdd:withDataclassActions:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Error inserting new account: %@\"", v2, v3, v4, v5, v6);
}

- (void)_handleAccountAdd:withDataclassActions:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Failed to save account, error: %{public}@\"", v2, v3, v4, v5, v6);
}

void __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "@\"No account type found for identifier '%{public}@'\"", v2, v3, v4, v5, v6);
}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v1 = [*(id *)(v0 + 32) identifier];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"Fetching credential for account with ID: %@ for service %@\"", v4, v5, v6, v7, v8);
}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEBUG, "\"Setting credential: %@ for account: %@ for service: %@\"", v3, 0x20u);
}

- (void)credentialForAccountWithIdentifier:(uint64_t)a1 handler:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 160));
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v3, v4, "\"Credential for account %@ is being requested by %@.\"", v5, v6, v7, v8, 2u);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"No managed object was found for account with identifier %@.\"", v2, v3, v4, v5, v6);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"No ACAccountType found for account with identifier %@.\"", v2, v3, v4, v5, v6);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"An unexpected error occurred: %@\"", v2, v3, v4, v5, v6);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Credential for account %@ was successfully retrieved from its auth plugin.\"", v2, v3, v4, v5, v6);
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_24();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v0 + 32) + 160));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"credentialForAccount called: client=%@, account=%@\"", v4, v5, v6, v7, v8);
}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_24();
  uint64_t v2 = [*v1 accountIdentifier];
  uint64_t v3 = [*v0 serviceName];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v4, v5, "\"Could not find existing credential item with identifier: %@ service name: %@\"", v6, v7, v8, v9, 2u);
}

- (void)accountsWithAccountType:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "\"accountsWithAccountType %@ returned: %@\"");
}

- (void)accountsWithAccountType:options:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12(&dword_2183AD000, v0, (uint64_t)v0, "\"accountsWithAccountType %@ returned an error: %@\"", v1);
}

- (void)_block_accountsWithAccountType:options:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Failed to get an NSManagedObjectID for account type %@\"", v2, v3, v4, v5, v6);
}

- (void)_childAccountsForAccountWithID:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"accountID is nil!\"", v2, v3, v4, v5, v6);
}

- (void)insertAccountType:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25(v1, 5.8382e-34, v2, v3);
  OUTLINED_FUNCTION_12(&dword_2183AD000, v6, v4, "\"Could not insert account type '%{public}@': %@\"", v5);
}

- (void)removeAccountType:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_25(v1, 5.8382e-34, v2, v3);
  OUTLINED_FUNCTION_12(&dword_2183AD000, v6, v4, "\"Could not remove account type '%{public}@': %@\"", v5);
}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Account Sync - Account was marked to NOT sync the delete, we will not create a tombstone for: %@\"", v2, v3, v4, v5, v6);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) localizedDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_20(&dword_2183AD000, v2, v3, "\"Could not save account: %@\"", v4, v5, v6, v7, v8);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_192_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Account save rejected by plugins, error: %@\"", v2, v3, v4, v5, v6);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"Could not verify account, unknown error!\"", v2, v3, v4, v5, v6);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_196_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_20(&dword_2183AD000, v2, v3, "\"Could not verify account: %@\"", v4, v5, v6, v7, v8);
}

- (void)_completeSave:dataclassActions:completion:.cold.1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, 3u);
}

- (void)_completeSave:dataclassActions:completion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

void __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_23();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)v0 + 160));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"%@ is trying to verify account credentials for account: %@\"", v4, v5, v6, v7, v8);
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_23();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)v0 + 160));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"%@ is trying to renew credentials for an account that's already been deleted: %@\"", v4, v5, v6, v7, v8);
}

- (void)_requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_23();
  id WeakRetained = objc_loadWeakRetained((id *)(v0 + 160));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_14(&dword_2183AD000, v2, v3, "\"%@ is trying to request access for accounts of type: %@\"", v4, v5, v6, v7, v8);
}

void __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke_cold_1(char a1)
{
  uint64_t v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "\"Access request result: %@\"", v4, v5, v6, v7, v8);
}

void __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Could not save permissions: %@\"", v2, v3, v4, v5, v6);
}

void __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"All access was successfully revoked.\"", v2, v3, v4, v5, v6);
}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"All access for client was successfully revoked.\"", v2, v3, v4, v5, v6);
}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Could not clear permissions: %@\"", v2, v3, v4, v5, v6);
}

- (void)kerberosAccountsForDomainFromURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"kerberosAccountsForDomainFromURL %@\"", v2, v3, v4, v5, v6);
}

- (void)resetDatabaseToVersion:withCompletion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12(&dword_2183AD000, v0, (uint64_t)v0, "\"Failed to reset database to version %@. Error: %@\"", v1);
}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2183AD000, v0, v1, "\"ERROR: Incoming account identifier is nil.\"", v2, v3, v4, v5, v6);
}

- (void)_clientTokenForAccountIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"Error fetch client token: %@\"", v2, v3, v4, v5, v6);
}

- (void)_removeClientTokenForAccountIdentifer:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"client token removal failed: %@\"", v2, v3, v4, v5, v6);
}

- (void)handleURL:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_2183AD000, v0, v1, "\"Couldn't find an account matching the URL %@\"", v2, v3, v4, v5, v6);
}

- (void)notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:.cold.1()
{
  int v2 = 136381443;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
}

- (void)saveAccount:toPairedDeviceWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_0(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)removeAccountFromPairedDevice:withOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)migrateCredentialForAccount:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)triggerKeychainMigrationIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_23();
  uint64_t v1 = [*v0 keychainVersion];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_2(&dword_2183AD000, v2, v3, "\"Failed to migrate keychain items to version %@. Error: %@\"", v4, v5, v6, v7, v8);
}

- (void)triggerKeychainMigrationIfNecessary:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)runAccountMigrationPlugins:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)_pruneDuplicateAccountsForAccountType:withUserName:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "@\"Not even one account of type %@ with user name %@ found, not pruning\"");
}

- (void)_pruneDuplicateAccountsForAccountType:(void *)a1 withUserName:error:.cold.2(void *a1)
{
  os_log_t v1 = [a1 result];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "@\"Pruned %@ accounts\"", v4, v5, v6, v7, v8);
}

- (void)_pruneDuplicateAccountsForAccountType:withUserName:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

- (void)accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2183AD000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
}

void __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "\"No results found for predicate %@\"", v2, v3, v4, v5, v6);
}

@end