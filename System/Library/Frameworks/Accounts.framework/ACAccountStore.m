@interface ACAccountStore
+ (ACAccountStore)defaultStore;
+ (BOOL)canSaveAccountsOfAccountTypeIdentifier:(id)a3;
+ (id)_obsoleteAccountTypeIDsToRemove;
+ (int)accountsWithAccountTypeIdentifierExist:(id)a3;
+ (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3;
+ (void)_setConnectionTimeout:(unint64_t)a3;
+ (void)_setDefaultStore:(id)a3;
- (ACAccount)accountWithIdentifier:(NSString *)identifier;
- (ACAccountStore)init;
- (ACAccountStore)initWithEffectiveBundleID:(id)a3;
- (ACAccountStore)initWithRemoteEndpoint:(id)a3;
- (ACAccountStore)initWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4;
- (ACAccountStoreCache)_testCache;
- (ACAccountType)accountTypeWithAccountTypeIdentifier:(NSString *)typeIdentifier;
- (ACNotifyAccountCache)_primaryAppleAccountCache;
- (ACRemoteAccountStoreSession)longLivedRemoteAccountStoreSession;
- (ACRemoteAccountStoreSession)remoteAccountStoreSession;
- (BOOL)addClientToken:(id)a3 forAccount:(id)a4;
- (BOOL)hasAccountWithDescription:(id)a3;
- (BOOL)isPerformingDataclassActionsForAccount:(id)a3;
- (BOOL)isPerformingDataclassActionsForAccount:(id)a3 error:(id *)a4;
- (BOOL)isPushSupportedForAccount:(id)a3;
- (BOOL)isTetheredSyncingEnabledForDataclass:(id)a3;
- (BOOL)permissionForAccountType:(id)a3;
- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4;
- (BOOL)triggerKeychainMigrationIfNecessary:(id *)a3;
- (NSArray)accounts;
- (NSArray)accountsWithAccountType:(ACAccountType *)accountType;
- (NSString)effectiveBundleID;
- (OS_dispatch_queue)replyQueue;
- (id)_cache;
- (id)_connectionFailureError;
- (id)_createSMTPAccountForServerAccount:(id)a3;
- (id)_removeObsoleteOSXServerAccountForMacOS:(id)a3;
- (id)_sanitizeOptionsDictionary:(id)a3;
- (id)_unsanitizeError:(id)a3;
- (id)accessKeysForAccountType:(id)a3;
- (id)accountIdentifiersEnabledForDataclass:(id)a3;
- (id)accountIdentifiersEnabledToSyncDataclass:(id)a3;
- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)accountWithIdentifier:(id)a3 error:(id *)a4;
- (id)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 error:(id *)a7;
- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)accountsWithAccountTypeIdentifiers:(id)a3 error:(id *)a4;
- (id)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 error:(id *)a5;
- (id)allAccountTypes;
- (id)allCredentialItems;
- (id)allDataclasses;
- (id)appPermissionsForAccountType:(id)a3;
- (id)childAccountsForAccount:(id)a3;
- (id)childAccountsForAccount:(id)a3 error:(id *)a4;
- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4;
- (id)clientTokenForAccount:(id)a3;
- (id)credentialForAccount:(id)a3;
- (id)credentialForAccount:(id)a3 error:(id *)a4;
- (id)credentialForAccount:(id)a3 serviceID:(id)a4;
- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5;
- (id)credentialItemForAccount:(id)a3 serviceName:(id)a4;
- (id)dataclassActionsForAccountDeletion:(id)a3;
- (id)dataclassActionsForAccountDeletion:(id)a3 error:(id *)a4;
- (id)dataclassActionsForAccountSave:(id)a3;
- (id)dataclassActionsForAccountSave:(id)a3 error:(id *)a4;
- (id)displayTypeForAccountWithIdentifier:(id)a3;
- (id)enabledDataclassesForAccount:(id)a3;
- (id)enabledDataclassesForAccount:(id)a3 error:(id *)a4;
- (id)grantedPermissionsForAccountType:(id)a3;
- (id)parentAccountForAccount:(id)a3;
- (id)parentAccountForAccount:(id)a3 error:(id *)a4;
- (id)provisionedDataclassesForAccount:(id)a3;
- (id)provisionedDataclassesForAccount:(id)a3 error:(id *)a4;
- (id)supportedDataclassesForAccountType:(id)a3;
- (id)syncableDataclassesForAccountType:(id)a3;
- (id)tetheredSyncSourceTypeForDataclass:(id)a3;
- (int)updateExistenceCacheOfAccountWithTypeIdentifier:(id)a3;
- (unint64_t)generationForCacheSuffix:(id)a3;
- (unsigned)_uidOfAccountsd;
- (void)_checkSaveRateLimitForAccountType:(id)a3;
- (void)_clearAccountCaches;
- (void)_removeObsoleteAccountsInternal:(id)a3 completion:(id)a4;
- (void)_removeObsoleteOSXServerAccountForiOS:(id)a3;
- (void)_saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6;
- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5;
- (void)accountTypeWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accounts;
- (void)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7;
- (void)accountsOnPairedDeviceWithAccountType:(id)a3 completion:(id)a4;
- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)accountsWithAccountType:(id)a3 completion:(id)a4;
- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)accountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4;
- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5;
- (void)allAccountTypes;
- (void)allCredentialItems;
- (void)allDataclasses;
- (void)cachedAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)canSaveAccount:(id)a3 withCompletionHandler:(id)a4;
- (void)clearAllPermissionsGrantedForAccountType:(id)a3;
- (void)clearGrantedPermissionsForAccountType:(id)a3;
- (void)dealloc;
- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)handleURL:(id)a3;
- (void)insertAccountType:(id)a3 withCompletionHandler:(id)a4;
- (void)insertCredentialItem:(id)a3 withCompletionHandler:(id)a4;
- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4;
- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4;
- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3;
- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4;
- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3;
- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4;
- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6;
- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7;
- (void)preloadDataclassOwnersWithCompletion:(id)a3;
- (void)removeAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreRemoveCompletionHandler)completionHandler;
- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5;
- (void)removeAccount:(id)a3 withDeleteSync:(BOOL)a4 completion:(id)a5;
- (void)removeAccountFromPairedDevice:(id)a3 withCompletion:(id)a4;
- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)removeAccountType:(id)a3 withCompletionHandler:(id)a4;
- (void)removeAccountsFromPairedDeviceWithCompletion:(id)a3;
- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4;
- (void)removeCredentialItem:(id)a3 withCompletionHandler:(id)a4;
- (void)removeObsoleteAccounts:(id)a3;
- (void)renewCredentialsForAccount:(ACAccount *)account completion:(ACAccountStoreCredentialRenewalHandler)completionHandler;
- (void)renewCredentialsForAccount:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6;
- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)renewCredentialsForAccount:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)renewCredentialsForAccount:(id)a3 services:(id)a4 completion:(id)a5;
- (void)reportTelemetryForLandmarkEvent:(id)a3;
- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType options:(NSDictionary *)options completion:(ACAccountStoreRequestAccessCompletionHandler)completion;
- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType withCompletionHandler:(ACAccountStoreRequestAccessCompletionHandler)handler;
- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4;
- (void)runAccountMigrationPlugins:(id)a3;
- (void)saveAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreSaveCompletionHandler)completionHandler;
- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5;
- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5;
- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 doVerify:(BOOL)a5 completion:(id)a6;
- (void)saveCredentialItem:(id)a3 withCompletionHandler:(id)a4;
- (void)saveVerifiedAccount:(id)a3 withCompletionHandler:(id)a4;
- (void)scheduleBackupIfNonexistent:(id)a3;
- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 error:(id *)a6;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setPermissionGranted:(BOOL)a3 forBundleID:(id)a4 onAccountType:(id)a5;
- (void)set_primaryAppleAccountCache:(id)a3;
- (void)set_testCache:(id)a3;
- (void)shutdownAccountsD:(id)a3;
- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)verifyCredentialsForAccount:(id)a3 saveWhenAuthorized:(BOOL)a4 withHandler:(id)a5;
- (void)verifyCredentialsForAccount:(id)a3 withHandler:(id)a4;
- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation ACAccountStore

uint64_t __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a2;
    v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    [a2 setAccountStore:*(void *)(a1 + 32)];
    v7 = [*(id *)(a1 + 32) _cache];
    [v7 cacheAccountType:*(void *)(a1 + 40)];
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)accountTypeWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A57C5000, "accounts/account-type-with-identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke;
    v20[3] = &unk_1E5BCD428;
    v20[4] = self;
    id v21 = v7;
    v9 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v20);
    v10 = [(ACAccountStore *)self _cache];
    v11 = [v10 cachedAccountTypeWithIdentifier:v6];

    if (v11)
    {
      [v11 setAccountStore:self];
      ((void (**)(void, void *, void))v9)[2](v9, v11, 0);
    }
    else
    {
      v12 = [(ACAccountStore *)self remoteAccountStoreSession];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_3;
      v15[3] = &unk_1E5BCD478;
      id v16 = v6;
      v17 = self;
      id v18 = 0;
      v19 = v9;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_77;
      v13[3] = &unk_1E5BCCC68;
      v13[4] = self;
      v14 = v19;
      ac_dispatch_remote(v12, v15, v13);
    }
  }
  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (v5 | v6) {
    id v8 = (void *)v5;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
  if (*(void *)(a1 + 32))
  {
    id v9 = [*(id *)(a1 + 40) _cache];
    [v9 cacheAccounts:v5 forSuffix:*(void *)(a1 + 32)];
  }
}

- (id)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  *(double *)&id v8 = COERCE_DOUBLE(a3);
  *(double *)&v39 = COERCE_DOUBLE(a4);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v38 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-types-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v38, &state);
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  v62 = __Block_byref_object_dispose__0;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = (__CFString **)&v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  if ([(__CFString *)v8 count] == 1 && ![(__CFString *)v39 count])
  {
    v31 = [(__CFString *)v8 firstObject];
    id v9 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v31 fetchOptions:1];

    v32 = [(ACAccountStore *)self _cache];
    uint64_t v33 = [v32 cachedAccountsForSuffix:v9];
    v34 = (void *)v59[5];
    v59[5] = v33;
  }
  else
  {
    id v9 = 0;
  }
  if (v59[5])
  {
    id v10 = _ACLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(__CFString *)v8 firstObject];
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:]();
    }
  }
  else
  {
    v11 = _ACSignpostLogSystem();
    os_signpost_id_t v12 = _ACSignpostCreate(v11);
    uint64_t v14 = v13;

    v15 = _ACSignpostLogSystem();
    id v16 = v15;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v67 = (os_signpost_id_t)v8;
      __int16 v68 = 2112;
      double v69 = *(double *)&v39;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AccountsWithTypesWithPropertiesSync", "%@: %@", buf, 0x16u);
    }

    v17 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      os_signpost_id_t v67 = v12;
      __int16 v68 = 2112;
      double v69 = *(double *)&v8;
      __int16 v70 = 2112;
      v71 = v39;
      _os_log_debug_impl(&dword_1A57C5000, v17, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypesWithPropertiesSync %@: %@", buf, 0x20u);
    }

    id v18 = [(ACAccountStore *)self remoteAccountStoreSession];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke;
    v45[3] = &unk_1E5BCD678;
    v46 = v8;
    v47 = v39;
    v50 = &v52;
    v51 = &v58;
    id v48 = v9;
    v49 = self;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_96;
    v44[3] = &unk_1E5BCD6A0;
    v44[5] = &v58;
    v44[6] = &v52;
    v44[4] = self;
    ac_dispatch_remote_sync(v18, v45, v44);

    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v12, v14);
    v20 = _ACSignpostLogSystem();
    id v21 = v20;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      os_signpost_id_t v22 = v59[5];
      v23 = v53[5];
      if (*(double *)&v23 == 0.0) {
        *(double *)&v23 = COERCE_DOUBLE(&stru_1EFA0AB58);
      }
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v67 = v22;
      __int16 v68 = 2112;
      double v69 = *(double *)&v23;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v21, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithTypesWithProperties", "%@%@", buf, 0x16u);
    }

    v24 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v35 = (__CFString *)v59[5];
      v36 = v53[5];
      *(_DWORD *)buf = 134218754;
      os_signpost_id_t v67 = v12;
      __int16 v68 = 2048;
      double v69 = (double)Nanoseconds / 1000000000.0;
      __int16 v70 = 2112;
      v71 = v35;
      if (v36) {
        v37 = v36;
      }
      else {
        v37 = &stru_1EFA0AB58;
      }
      __int16 v72 = 2112;
      v73 = v37;
      _os_log_debug_impl(&dword_1A57C5000, v24, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", buf, 0x2Au);
    }

    id v10 = v46;
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = (id)v59[5];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "_setAccountStore:", self, v38);
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v65 count:16];
    }
    while (v26);
  }

  if (a5) {
    *a5 = v53[5];
  }
  id v29 = (id)v59[5];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  os_activity_scope_leave(&state);

  return v29;
}

- (ACRemoteAccountStoreSession)remoteAccountStoreSession
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ACAccountStore_remoteAccountStoreSession__block_invoke;
  v4[3] = &unk_1E5BCD270;
  v4[4] = self;
  v2 = ac_unfair_lock_perform_with_result(&self->_remoteAccountStoreSessionLock, v4);

  return (ACRemoteAccountStoreSession *)v2;
}

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type-with-options", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (v9)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke;
    v38[3] = &unk_1E5BCCC18;
    v38[4] = self;
    id v39 = v9;
    v11 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v38);
    os_signpost_id_t v12 = [v8 identifier];
    uint64_t v13 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v12 fetchOptions:a4];

    uint64_t v14 = [(ACAccountStore *)self _cache];
    v15 = [v14 cachedAccountsForSuffix:v13];

    if (v15)
    {
      id v16 = _ACLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        [v8 identifier];
        objc_claimAutoreleasedReturnValue();
        -[ACAccountStore accountsWithAccountType:completion:]();
      }

      ((void (**)(void, void *, void))v11)[2](v11, v15, 0);
    }
    else
    {
      v17 = _ACSignpostLogSystem();
      os_signpost_id_t v18 = _ACSignpostCreate(v17);
      uint64_t v25 = v19;
      os_signpost_id_t v20 = v18;

      id v21 = _ACSignpostLogSystem();
      os_signpost_id_t v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412546;
        os_signpost_id_t v42 = (os_signpost_id_t)v8;
        __int16 v43 = 2048;
        unint64_t v44 = a4;
        _os_signpost_emit_with_name_impl(&dword_1A57C5000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "AccountsWithType", "%@: %lu", buf, 0x16u);
      }

      v23 = _ACSignpostLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        os_signpost_id_t v42 = v20;
        __int16 v43 = 2112;
        unint64_t v44 = (unint64_t)v8;
        __int16 v45 = 2048;
        unint64_t v46 = a4;
        _os_log_debug_impl(&dword_1A57C5000, v23, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithType %@: %lu", buf, 0x20u);
      }

      v24 = [(ACAccountStore *)self remoteAccountStoreSession];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_90;
      v30[3] = &unk_1E5BCD628;
      unint64_t v35 = a4;
      id v31 = v8;
      v32 = self;
      id v33 = v13;
      os_signpost_id_t v36 = v20;
      uint64_t v37 = v25;
      v34 = v11;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_92;
      v26[3] = &unk_1E5BCD600;
      os_signpost_id_t v28 = v20;
      uint64_t v29 = v25;
      v26[4] = self;
      uint64_t v27 = v34;
      ac_dispatch_remote(v24, v30, v26);
    }
  }
  os_activity_scope_leave(&state);
}

- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type-with-options-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = [v8 identifier];
  v11 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v10 fetchOptions:a4];

  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__0;
  v59 = __Block_byref_object_dispose__0;
  os_signpost_id_t v12 = [(ACAccountStore *)self _cache];
  id v60 = [v12 cachedAccountsForSuffix:v11];

  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  if (v56[5])
  {
    uint64_t v13 = _ACLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      [v8 identifier];
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:]();
    }
  }
  else
  {
    uint64_t v14 = _ACSignpostLogSystem();
    os_signpost_id_t v15 = _ACSignpostCreate(v14);
    uint64_t v17 = v16;

    os_signpost_id_t v18 = _ACSignpostLogSystem();
    uint64_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v64 = (os_signpost_id_t)v8;
      __int16 v65 = 2048;
      unint64_t v66 = a4;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "AccountsWithTypeSync", "%@: %lu", buf, 0x16u);
    }

    os_signpost_id_t v20 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      os_signpost_id_t v64 = v15;
      __int16 v65 = 2112;
      unint64_t v66 = (unint64_t)v8;
      __int16 v67 = 2048;
      unint64_t v68 = a4;
      _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypeSync %@: %lu", buf, 0x20u);
    }

    id v21 = [(ACAccountStore *)self remoteAccountStoreSession];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke;
    v42[3] = &unk_1E5BCD588;
    unint64_t v48 = a4;
    unint64_t v46 = &v49;
    uint64_t v47 = &v55;
    __int16 v43 = v8;
    unint64_t v44 = self;
    id v45 = v11;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_86;
    v41[3] = &unk_1E5BCD2E8;
    v41[4] = self;
    v41[5] = &v49;
    ac_dispatch_remote_sync(v21, v42, v41);

    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v15, v17);
    v23 = _ACSignpostLogSystem();
    v24 = v23;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      os_signpost_id_t v25 = v56[5];
      uint64_t v26 = (__CFString *)v50[5];
      if (!v26) {
        uint64_t v26 = &stru_1EFA0AB58;
      }
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v64 = v25;
      __int16 v65 = 2112;
      unint64_t v66 = (unint64_t)v26;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v24, OS_SIGNPOST_INTERVAL_END, v15, "AccountsWithTypeSync", "%@%@", buf, 0x16u);
    }

    uint64_t v27 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v34 = v56[5];
      unint64_t v35 = (__CFString *)v50[5];
      *(_DWORD *)buf = 134218754;
      os_signpost_id_t v64 = v15;
      __int16 v65 = 2048;
      *(double *)&unint64_t v66 = (double)Nanoseconds / 1000000000.0;
      __int16 v67 = 2112;
      unint64_t v68 = v34;
      if (v35) {
        os_signpost_id_t v36 = v35;
      }
      else {
        os_signpost_id_t v36 = &stru_1EFA0AB58;
      }
      __int16 v69 = 2112;
      __int16 v70 = v36;
      _os_log_debug_impl(&dword_1A57C5000, v27, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeSync %@%@", buf, 0x2Au);
    }

    uint64_t v13 = v43;
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v28 = (id)v56[5];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "_setAccountStore:", self, (void)v37);
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v62 count:16];
    }
    while (v29);
  }

  if (a5) {
    *a5 = (id) v50[5];
  }
  id v32 = (id)v56[5];
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  os_activity_scope_leave(&state);

  return v32;
}

- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/account-type-with-identifier-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__0;
  uint64_t v29 = __Block_byref_object_dispose__0;
  id v8 = [(ACAccountStore *)self _cache];
  id v30 = [v8 cachedAccountTypeWithIdentifier:v6];

  uint64_t v19 = 0;
  os_signpost_id_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  os_signpost_id_t v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  id v9 = (void *)v26[5];
  if (!v9)
  {
    id v10 = [(ACAccountStore *)self remoteAccountStoreSession];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke;
    v14[3] = &unk_1E5BCD400;
    id v15 = v6;
    uint64_t v16 = self;
    uint64_t v17 = &v25;
    os_signpost_id_t v18 = &v19;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_76;
    v13[3] = &unk_1E5BCD2E8;
    v13[4] = self;
    void v13[5] = &v19;
    ac_dispatch_remote_sync(v10, v14, v13);

    id v9 = (void *)v26[5];
  }
  [v9 setAccountStore:self];
  if (a4) {
    *a4 = (id) v20[5];
  }
  id v11 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);

  return v11;
}

- (id)_cache
{
  v3 = [(ACAccountStore *)self _testCache];

  if (v3) {
    [(ACAccountStore *)self _testCache];
  }
  else {
  v4 = +[ACAccountStoreCache sharedCache];
  }

  return v4;
}

- (ACAccountStoreCache)_testCache
{
  return (ACAccountStoreCache *)objc_getProperty(self, a2, 96, 1);
}

id __43__ACAccountStore_remoteAccountStoreSession__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[4])
  {
    v3 = [[ACRemoteAccountStoreSession alloc] initWithListenerEndpoint:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)v6[4];
    id v8 = [v6 effectiveBundleID];
    [v7 setEffectiveBundleID:v8];

    v2 = *(void **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  id v9 = *(void **)(*(void *)(a1 + 32) + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__ACAccountStore_remoteAccountStoreSession__block_invoke_2;
  v12[3] = &unk_1E5BCD248;
  objc_copyWeak(&v13, &location);
  [v9 scheduleExpiration:v12];
  id v10 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) _setAccountStore:*(void *)(a1 + 32)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  id v11 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v12;
  id v16 = v5;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v11, block);
}

void __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_2;
  v8[3] = &unk_1E5BCD560;
  long long v11 = *(_OWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v9 = v6;
  uint64_t v10 = v7;
  [a2 accountsWithAccountTypeIdentifiers:v4 preloadedProperties:v5 completion:v8];
}

- (NSString)effectiveBundleID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

+ (ACAccountStore)defaultStore
{
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedAccountStore;

  return (ACAccountStore *)v2;
}

- (id)accountWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1A57C5000, "accounts/account-with-identifier-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _ACSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AccountWithIdentifierSync", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore accountWithIdentifier:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  uint64_t v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  unint64_t v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  os_signpost_id_t v36 = __Block_byref_object_copy__0;
  long long v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  id v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  p_long long buf = &buf;
  id v32 = &v33;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke_66;
  v28[3] = &unk_1E5BCD2E8;
  v28[4] = self;
  v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  [*(id *)(*((void *)&buf + 1) + 40) _setAccountStore:self];
  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  id v18 = _ACSignpostLogSystem();
  long long v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    long long v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&long long v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)long long v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "AccountWithIdentifierSync", "%@%@", v40, 0x16u);
  }

  long long v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = v34[5];
    *(_DWORD *)long long v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    uint64_t v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWithIdentifierSync %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

- (ACAccount)accountWithIdentifier:(NSString *)identifier
{
  return (ACAccount *)[(ACAccountStore *)self accountWithIdentifier:identifier error:0];
}

- (ACAccountType)accountTypeWithAccountTypeIdentifier:(NSString *)typeIdentifier
{
  return (ACAccountType *)[(ACAccountStore *)self accountTypeWithAccountTypeIdentifier:typeIdentifier error:0];
}

uint64_t __43__ACAccountStore_accessKeysForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__ACAccountStore_accessKeysForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD920;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 accessKeysForAccountType:v2 handler:v4];
}

- (id)accountsWithAccountTypeIdentifiers:(id)a3 error:(id *)a4
{
  return [(ACAccountStore *)self accountsWithAccountTypeIdentifiers:a3 preloadedProperties:0 error:a4];
}

void __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    os_signpost_id_t v9 = [*(id *)(a1 + 32) _cache];
    [v9 cacheAccountType:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);
  objc_storeStrong((id *)&self->__testCache, 0);
  objc_storeStrong((id *)&self->__primaryAppleAccountCache, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_longLivedRemoteAccountStoreSessionExpirer, 0);
  objc_storeStrong((id *)&self->_longLivedRemoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_remoteAccountStoreSessionExpirer, 0);
  objc_storeStrong((id *)&self->_remoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_accountCache, 0);

  objc_storeStrong(&self->_daemonAccountStoreDidChangeObserver, 0);
}

void __30__ACAccountStore_defaultStore__block_invoke()
{
  if (!sharedAccountStore)
  {
    sharedAccountStore = objc_alloc_init(ACAccountStore);
    MEMORY[0x1F41817F8]();
  }
}

- (ACAccountStore)init
{
  return [(ACAccountStore *)self initWithRemoteEndpoint:0 effectiveBundleID:0];
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_daemonAccountStoreDidChangeObserver];

  v4.receiver = self;
  v4.super_class = (Class)ACAccountStore;
  [(ACAccountStore *)&v4 dealloc];
}

- (ACAccountStore)initWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ACAccountStore;
  os_signpost_id_t v9 = [(ACAccountStore *)&v27 init];
  if (v9)
  {
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("ACAccountStoreReply", v10);
    replyQueue = v9->_replyQueue;
    v9->_replyQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_effectiveBundleID, a4);
    objc_storeStrong((id *)&v9->_endpoint, a3);
    v9->_remoteAccountStoreSessionLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = +[ACTimedExpirer expirerWithTimeout:ACRemoteConnectionTimeout];
    remoteAccountStoreSessionExpirer = v9->_remoteAccountStoreSessionExpirer;
    v9->_remoteAccountStoreSessionExpirer = (ACTimedExpirer *)v13;

    v9->_longLivedRemoteAccountStoreSessionLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = +[ACTimedExpirer expirerWithTimeout:ACRemoteConnectionTimeout];
    longLivedRemoteAccountStoreSessionExpirer = v9->_longLivedRemoteAccountStoreSessionExpirer;
    v9->_longLivedRemoteAccountStoreSessionExpirer = (ACTimedExpirer *)v15;

    uint64_t v17 = objc_opt_new();
    accountCache = v9->_accountCache;
    v9->_accountCache = (NSMutableDictionary *)v17;

    objc_initWeak(&location, v9);
    long long v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    os_signpost_id_t v20 = +[ACNotificationRebroadcaster sharedRebroadcaster];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke;
    v24[3] = &unk_1E5BCCD08;
    objc_copyWeak(&v25, &location);
    uint64_t v21 = [v19 addObserverForName:@"ACDAccountStoreDidChangeNotification" object:v20 queue:0 usingBlock:v24];
    id daemonAccountStoreDidChangeObserver = v9->_daemonAccountStoreDidChangeObserver;
    v9->_id daemonAccountStoreDidChangeObserver = (id)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v9;
}

+ (id)_obsoleteAccountTypeIDsToRemove
{
  if (_obsoleteAccountTypeIDsToRemove_onceToken != -1) {
    dispatch_once(&_obsoleteAccountTypeIDsToRemove_onceToken, &__block_literal_global_233);
  }
  uint64_t v2 = (void *)_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs;

  return v2;
}

uint64_t __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2_154(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    objc_super v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [a2 BOOLValue];
    objc_super v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = v3;
    a3 = 0;
  }

  return v4(v5, v6, a3);
}

void __43__ACAccountStore_accessKeysForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __46__ACAccountStore_accountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2;
  v4[3] = &unk_1E5BCD298;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 accountWithIdentifier:v2 handler:v4];
}

void __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke_2(uint64_t a1, void *a2)
{
}

void __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    id v9 = [*(id *)(a1 + 32) _cache];
    [v9 cacheAccounts:v6 forSuffix:*(void *)(a1 + 40)];
  }
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-types", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v10)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v38[3] = &unk_1E5BCCC18;
    v38[4] = self;
    id v39 = v10;
    id v25 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v38);
    if ([v8 count] == 1 && !objc_msgSend(v9, "count"))
    {
      long long v22 = [v8 firstObject];
      id v12 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v22 fetchOptions:1];

      id v23 = [(ACAccountStore *)self _cache];
      uint64_t v21 = [v23 cachedAccountsForSuffix:v12];

      if (v21)
      {
        uint64_t v24 = _ACLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          [v8 firstObject];
          objc_claimAutoreleasedReturnValue();
          -[ACAccountStore accountsWithAccountType:completion:]();
        }

        ((void (**)(void, void *, void))v25)[2](v25, v21, 0);
        goto LABEL_11;
      }
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = _ACSignpostLogSystem();
    os_signpost_id_t v14 = _ACSignpostCreate(v13);
    uint64_t v16 = v15;

    uint64_t v17 = _ACSignpostLogSystem();
    id v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v42 = (os_signpost_id_t)v8;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AccountsWithTypesWithProperties", "%@: %@", buf, 0x16u);
    }

    long long v19 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218498;
      os_signpost_id_t v42 = v14;
      __int16 v43 = 2112;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v9;
      _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsWithTypesWithProperties %@: %@", buf, 0x20u);
    }

    os_signpost_id_t v20 = [(ACAccountStore *)self remoteAccountStoreSession];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_93;
    v30[3] = &unk_1E5BCD650;
    id v31 = v8;
    id v32 = v9;
    id v12 = v12;
    id v33 = v12;
    unint64_t v34 = self;
    os_signpost_id_t v36 = v14;
    uint64_t v37 = v16;
    uint64_t v35 = v25;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_95;
    v26[3] = &unk_1E5BCD600;
    os_signpost_id_t v28 = v14;
    uint64_t v29 = v16;
    v26[4] = self;
    objc_super v27 = v35;
    ac_dispatch_remote(v20, v30, v26);

    uint64_t v21 = 0;
LABEL_11:
  }
  os_activity_scope_leave(&state);
}

uint64_t __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_2;
  v4[3] = &unk_1E5BCD3D8;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  return [a2 accountTypeWithIdentifier:v2 handler:v4];
}

- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType options:(NSDictionary *)options completion:(ACAccountStoreRequestAccessCompletionHandler)completion
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = accountType;
  id v9 = options;
  ACAccountStoreRequestAccessCompletionHandler v10 = completion;
  long long v11 = _os_activity_create(&dword_1A57C5000, "accounts/request-access", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = [(ACAccountType *)v8 accessKeys];
  uint64_t v13 = [v12 count];

  if (v9) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v15 = @"Access options are not permitted for this account type. The options argument must be nil.";
LABEL_9:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v15];
    goto LABEL_10;
  }
  if (!v9 && v13)
  {
    uint64_t v15 = @"Access options are required for this account type.";
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v16 = _ACSignpostLogSystem();
  os_signpost_id_t v17 = _ACSignpostCreate(v16);
  uint64_t v19 = v18;

  os_signpost_id_t v20 = _ACSignpostLogSystem();
  uint64_t v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v41 = (os_signpost_id_t)v8;
    __int16 v42 = 2112;
    __int16 v43 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RequestAccessToAccountType", "%@ : %@", buf, 0x16u);
  }

  long long v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v41 = v17;
    __int16 v42 = 2112;
    __int16 v43 = v8;
    __int16 v44 = 2112;
    __int16 v45 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RequestAccessToAccountType %@ : %@", buf, 0x20u);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke;
  v35[3] = &unk_1E5BCD7E0;
  v35[4] = self;
  os_signpost_id_t v37 = v17;
  uint64_t v38 = v19;
  id v23 = v10;
  id v36 = v23;
  uint64_t v24 = (void *)MEMORY[0x1A626DA80](v35);
  id v25 = [(ACAccountStore *)self remoteAccountStoreSession];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_153;
  v31[3] = &unk_1E5BCD388;
  uint64_t v26 = v8;
  id v32 = v26;
  objc_super v27 = v9;
  id v33 = v27;
  id v34 = v24;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_3;
  v29[3] = &unk_1E5BCCC68;
  id v28 = v34;
  void v29[4] = self;
  id v30 = v28;
  ac_dispatch_remote(v25, v31, v29);

  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_4;
  v6[3] = &unk_1E5BCD450;
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  [a2 accountTypeWithIdentifier:v4 handler:v6];
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_153(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  long long v5 = [v3 identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2_154;
  v7[3] = &unk_1E5BCD830;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v4 requestAccessForAccountTypeWithIdentifier:v5 options:v6 withHandler:v7];
}

- (id)accessKeysForAccountType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = _os_activity_create(&dword_1A57C5000, "accounts/request-access", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  ACAccountStoreRequestAccessCompletionHandler v10 = _ACSignpostLogSystem();
  long long v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccessKeysForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore accessKeysForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  os_signpost_id_t v37 = __Block_byref_object_copy__0;
  uint64_t v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__ACAccountStore_accessKeysForAccountType___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  uint64_t v16 = _ACSignpostLogSystem();
  os_signpost_id_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)objc_super v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccessKeysForAccountType", "%@%@", v27, 0x16u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)objc_super v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccessKeysForAccountType %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2_91;
  v7[3] = &unk_1E5BCD5B0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  long long v10 = *(_OWORD *)(a1 + 72);
  id v9 = *(id *)(a1 + 56);
  [a2 accountsWithAccountType:v5 options:v4 completion:v7];
}

void __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_2;
  v8[3] = &unk_1E5BCD560;
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 64);
  void v8[4] = v4;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v6 = (id)v7;
  long long v9 = v7;
  [a2 accountsWithAccountType:v5 options:v3 completion:v8];
}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2_94;
  v9[3] = &unk_1E5BCD5B0;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v10 = v6;
  uint64_t v11 = v7;
  long long v13 = *(_OWORD *)(a1 + 72);
  id v12 = v8;
  [a2 accountsWithAccountTypeIdentifiers:v4 preloadedProperties:v5 completion:v9];
}

uint64_t __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    uint64_t v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      uint64_t v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RequestAccessToAccountType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    uint64_t v11 = @"YES";
    id v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    long long v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      long long v13 = v12;
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RequestAccessToAccountType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke_2;
  v4[3] = &unk_1E5BCD4A0;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 accountIdentifiersEnabledForDataclass:v2 handler:v4];
}

uint64_t __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke_2;
  v4[3] = &unk_1E5BCDE98;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 tetheredSyncSourceTypeForDataclass:v2 completion:v4];
}

- (NSArray)accountsWithAccountType:(ACAccountType *)accountType
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = accountType;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = [(ACAccountType *)v4 identifier];
  uint64_t v7 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v6 fetchOptions:1];

  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy__0;
  __int16 v43 = __Block_byref_object_dispose__0;
  uint64_t v8 = [(ACAccountStore *)self _cache];
  id v44 = [v8 cachedAccountsForSuffix:v7];

  if (v40[5])
  {
    p_super = _ACLogSystem();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      [(ACAccountType *)v4 identifier];
      objc_claimAutoreleasedReturnValue();
      -[ACAccountStore accountsWithAccountType:]();
    }
  }
  else
  {
    id v10 = _ACSignpostLogSystem();
    os_signpost_id_t v11 = _ACSignpostCreate(v10);
    uint64_t v13 = v12;

    int v14 = _ACSignpostLogSystem();
    uint64_t v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)long long buf = 138412290;
      os_signpost_id_t v48 = (os_signpost_id_t)v4;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AccountsWithTypeSync", "%@", buf, 0xCu);
    }

    __int16 v16 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore accountsWithAccountType:]();
    }

    double v17 = [(ACAccountStore *)self remoteAccountStoreSession];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __42__ACAccountStore_accountsWithAccountType___block_invoke;
    v34[3] = &unk_1E5BCD538;
    uint64_t v38 = &v39;
    uint64_t v35 = v4;
    uint64_t v36 = self;
    id v37 = v7;
    ac_dispatch_remote_sync(v17, v34, &__block_literal_global_85);

    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v11, v13);
    uint64_t v19 = _ACSignpostLogSystem();
    __int16 v20 = v19;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      os_signpost_id_t v21 = v40[5];
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v48 = v21;
      __int16 v49 = 2112;
      double v50 = COERCE_DOUBLE(&stru_1EFA0AB58);
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v20, OS_SIGNPOST_INTERVAL_END, v11, "AccountsWithTypeSync", "%@%@", buf, 0x16u);
    }

    uint64_t v22 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218754;
      uint64_t v29 = v40[5];
      os_signpost_id_t v48 = v11;
      __int16 v49 = 2048;
      double v50 = (double)Nanoseconds / 1000000000.0;
      __int16 v51 = 2112;
      uint64_t v52 = v29;
      __int16 v53 = 2112;
      id v54 = &stru_1EFA0AB58;
      _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeSync %@%@", buf, 0x2Au);
    }

    p_super = &v35->super;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v23 = (id)v40[5];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_setAccountStore:", self, (void)v30);
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v24);
  }

  id v27 = (id)v40[5];
  _Block_object_dispose(&v39, 8);

  os_activity_scope_leave(&state);

  return (NSArray *)v27;
}

void __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_2;
  v6[3] = &unk_1E5BCDD58;
  long long v7 = *(_OWORD *)(a1 + 40);
  [v4 enabledDataclassesForAccountWithIdentifier:v5 handler:v6];
}

void __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

uint64_t __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__ACAccountStore_accountsWithAccountType___block_invoke_2;
  v6[3] = &unk_1E5BCD510;
  uint64_t v3 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 accountsWithAccountType:v3 handler:v6];
}

- (id)enabledDataclassesForAccount:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = _os_activity_create(&dword_1A57C5000, "accounts/enabled-dataclasses-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _ACSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnabledDataclassesForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  int v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore enabledDataclassesForAccount:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  double v50 = __Block_byref_object_copy__0;
  __int16 v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  id v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  id v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  uint64_t v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  p_long long buf = &buf;
  long long v32 = &v33;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_189;
  v28[3] = &unk_1E5BCD2E8;
  v28[4] = self;
  v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  __int16 v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&os_signpost_id_t v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)uint64_t v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "EnabledDataclassesForAccount", "%@%@", v40, 0x16u);
  }

  uint64_t v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = v34[5];
    *(_DWORD *)uint64_t v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      id v27 = v26;
    }
    else {
      id v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    uint64_t v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: EnabledDataclassesForAccount %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke_2;
  v4[3] = &unk_1E5BCD4A0;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 accountIdentifiersEnabledToSyncDataclass:v2 handler:v4];
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    os_signpost_id_t v9 = [*(id *)(a1 + 32) _cache];
    [v9 cacheAccounts:v6 forSuffix:*(void *)(a1 + 40)];
  }
}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_2_91(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) _cache];
  [v8 cacheAccounts:v5 forSuffix:*(void *)(a1 + 40)];

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = &stru_1EFA0AB58;
    if (v6) {
      uint64_t v13 = v6;
    }
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    double v20 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  int v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void **)(a1 + 56);
    int v17 = 134218754;
    id v18 = v15;
    id v16 = &stru_1EFA0AB58;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    __int16 v21 = 2112;
    id v22 = v5;
    if (v6) {
      id v16 = v6;
    }
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)tetheredSyncSourceTypeForDataclass:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/is-tethered-syncing-enabled-for-dataclass", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ThetheredSyncSourceTypeForDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore tetheredSyncSourceTypeForDataclass:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__ACAccountStore_tetheredSyncSourceTypeForDataclass___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  int v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "ThetheredSyncSourceTypeForDataclass", "%@%@", v27, 0x16u);
  }

  __int16 v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ThetheredSyncSourceTypeForDataclass %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

- (id)accountIdentifiersEnabledForDataclass:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/account-identifiers-enabled-for-dataclass", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsEnabledForDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore accountIdentifiersEnabledForDataclass:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__ACAccountStore_accountIdentifiersEnabledForDataclass___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  int v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccountsEnabledForDataclass", "%@%@", v27, 0x16u);
  }

  __int16 v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledForDataclass %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    os_signpost_id_t v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v8 = [*(id *)(a1 + 40) _cache];
    [v8 cacheAccounts:v5 forSuffix:*(void *)(a1 + 32)];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = &stru_1EFA0AB58;
    if (v6) {
      uint64_t v13 = (__CFString *)v6;
    }
    int v18 = 138412546;
    unint64_t v19 = v5;
    __int16 v20 = 2112;
    double v21 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithTypesWithProperties", "%@%@", (uint8_t *)&v18, 0x16u);
  }

  id v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v16 = *(void *)(a1 + 56);
    int v18 = 134218754;
    unint64_t v19 = v16;
    int v17 = &stru_1EFA0AB58;
    __int16 v20 = 2048;
    double v21 = (double)Nanoseconds / 1000000000.0;
    __int16 v22 = 2112;
    unint64_t v23 = v5;
    if (v6) {
      int v17 = (__CFString *)v6;
    }
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    _os_log_debug_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", (uint8_t *)&v18, 0x2Au);
  }

  if (v5 | (unint64_t)v6) {
    unint64_t v15 = v5;
  }
  else {
    unint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  (*(void (**)(void, unint64_t, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v15, v6);
}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) _setAccountStore:*(void *)(a1 + 32)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v12;
  id v16 = v5;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v11, block);
}

- (id)accountIdentifiersEnabledToSyncDataclass:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/account-identifiers-enabled-sync-dataclass", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsEnabledToSyncDataclass", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore accountIdentifiersEnabledToSyncDataclass:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  id v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__ACAccountStore_accountIdentifiersEnabledToSyncDataclass___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  id v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AccountsEnabledToSyncDataclass", "%@%@", v27, 0x16u);
  }

  long long v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledToSyncDataclass %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

+ (void)_setDefaultStore:(id)a3
{
}

+ (void)_setConnectionTimeout:(unint64_t)a3
{
  ACRemoteConnectionTimeout = a3;
}

- (ACAccountStore)initWithRemoteEndpoint:(id)a3
{
  return [(ACAccountStore *)self initWithRemoteEndpoint:a3 effectiveBundleID:0];
}

- (ACAccountStore)initWithEffectiveBundleID:(id)a3
{
  return [(ACAccountStore *)self initWithRemoteEndpoint:0 effectiveBundleID:a3];
}

void __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _clearAccountCaches];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke_2;
    v6[3] = &unk_1E5BCCD58;
    id v7 = v5;
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __59__ACAccountStore_initWithRemoteEndpoint_effectiveBundleID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A626D840]();
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) userInfo];
  [v3 postNotificationName:@"ACAccountStoreDidChangeNotification" object:v4 userInfo:v5];
}

- (void)_clearAccountCaches
{
  obj = self->_accountCache;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_accountCache removeAllObjects];
  objc_sync_exit(obj);
}

void __43__ACAccountStore_remoteAccountStoreSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    id v5 = __43__ACAccountStore_remoteAccountStoreSession__block_invoke_3;
    id v6 = &unk_1E5BCD220;
    id v7 = WeakRetained;
    id v3 = v4;
    os_unfair_lock_lock(v2 + 10);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(v2 + 10);
  }
}

void __43__ACAccountStore_remoteAccountStoreSession__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (ACRemoteAccountStoreSession)longLivedRemoteAccountStoreSession
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke;
  v4[3] = &unk_1E5BCD270;
  void v4[4] = self;
  uint64_t v2 = ac_unfair_lock_perform_with_result(&self->_longLivedRemoteAccountStoreSessionLock, v4);

  return (ACRemoteAccountStoreSession *)v2;
}

id __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    id v3 = [[ACRemoteAccountStoreSession alloc] initWithListenerEndpoint:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v6 = *(void **)(a1 + 32);
    id v7 = (void *)v6[7];
    id v8 = [v6 effectiveBundleID];
    [v7 setEffectiveBundleID:v8];

    uint64_t v2 = *(void **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 72);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_2;
  v12[3] = &unk_1E5BCD248;
  objc_copyWeak(&v13, &location);
  [v9 scheduleExpiration:v12];
  id v10 = *(id *)(*(void *)(a1 + 32) + 56);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    id v5 = __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_3;
    id v6 = &unk_1E5BCD220;
    id v7 = WeakRetained;
    id v3 = v4;
    os_unfair_lock_lock(v2 + 16);
    v5((uint64_t)v3);
    os_unfair_lock_unlock(v2 + 16);
  }
}

void __52__ACAccountStore_longLivedRemoteAccountStoreSession__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;
}

- (id)_connectionFailureError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.accounts" code:10002 userInfo:0];
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ACAccountStore *)self remoteAccountStoreSession];
  [v5 setNotificationsEnabled:v3];

  id v6 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  [v6 setNotificationsEnabled:v3];
}

uint64_t __46__ACAccountStore_accountWithIdentifier_error___block_invoke_66(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/account-with-identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    uint64_t v9 = _ACSignpostLogSystem();
    os_signpost_id_t v10 = _ACSignpostCreate(v9);
    uint64_t v12 = v11;

    id v13 = _ACSignpostLogSystem();
    id v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AccountWithIdentifier", "%@", buf, 0xCu);
    }

    unint64_t v15 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore accountWithIdentifier:completion:]();
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke;
    v25[3] = &unk_1E5BCD338;
    v25[4] = self;
    os_signpost_id_t v27 = v10;
    uint64_t v28 = v12;
    id v26 = v7;
    id v16 = (void *)MEMORY[0x1A626DA80](v25);
    id v17 = [(ACAccountStore *)self remoteAccountStoreSession];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_71;
    v21[3] = &unk_1E5BCD388;
    id v22 = v6;
    unint64_t v23 = self;
    id v24 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_73;
    v19[3] = &unk_1E5BCCC68;
    id v18 = v24;
    v19[4] = self;
    id v20 = v18;
    ac_dispatch_remote(v17, v21, v19);
  }
  os_activity_scope_leave(&state);
}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5BCD310;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  BOOL v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    id v7 = (__CFString *)a1[5];
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountWithIdentifier", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[4];
    id v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    long long v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWithIdentifier %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_71(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2_72;
  v5[3] = &unk_1E5BCD360;
  uint64_t v3 = a1[4];
  uint64_t v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 accountWithIdentifier:v3 handler:v5];
}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_2_72(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a2;
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    [a2 _setAccountStore:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__ACAccountStore_accountWithIdentifier_completion___block_invoke_73(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)cachedAccountWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/cached-account-with-identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v29 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CachedAccountWithIdentifier", "%@", buf, 0xCu);
  }

  uint64_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore cachedAccountWithIdentifier:completion:]();
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke;
  v23[3] = &unk_1E5BCD338;
  void v23[4] = self;
  os_signpost_id_t v25 = v10;
  uint64_t v26 = v12;
  id v16 = v7;
  id v24 = v16;
  double v17 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v23);
  __int16 v18 = self->_accountCache;
  objc_sync_enter(v18);
  uint64_t v19 = [(NSMutableDictionary *)self->_accountCache objectForKeyedSubscript:v6];
  objc_sync_exit(v18);

  if (v19)
  {
    ((void (**)(void, void *, void))v17)[2](v17, v19, 0);
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_74;
    v20[3] = &unk_1E5BCD3B0;
    v20[4] = self;
    id v21 = v6;
    uint64_t v22 = v17;
    [(ACAccountStore *)self accountWithIdentifier:v21 completion:v20];
  }
  os_activity_scope_leave(&state);
}

void __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E5BCD310;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    id v7 = (__CFString *)a1[5];
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "CachedAccountWithIdentifier", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[4];
    id v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CachedAccountWithIdentifier %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __57__ACAccountStore_cachedAccountWithIdentifier_completion___block_invoke_74(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && !v5)
  {
    id v6 = *(id *)(a1[4] + 16);
    objc_sync_enter(v6);
    [*(id *)(a1[4] + 16) setObject:v7 forKeyedSubscript:a1[5]];
    objc_sync_exit(v6);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __61__ACAccountStore_accountTypeWithAccountTypeIdentifier_error___block_invoke_76(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

void __55__ACAccountStore_accountTypeWithIdentifier_completion___block_invoke_77(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (NSArray)accounts
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _os_activity_create(&dword_1A57C5000, "accounts/all-accounts-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = _ACSignpostLogSystem();
  os_signpost_id_t v5 = _ACSignpostCreate(v4);
  uint64_t v7 = v6;

  id v8 = _ACSignpostLogSystem();
  id v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllAccountsSync", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  uint64_t v10 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore accounts]();
  }

  *(void *)long long buf = 0;
  uint64_t v30 = buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__0;
  __int16 v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v11 = [(ACAccountStore *)self remoteAccountStoreSession];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __26__ACAccountStore_accounts__block_invoke;
  v28[3] = &unk_1E5BCD4C8;
  v28[4] = buf;
  ac_dispatch_remote_sync(v11, v28, &__block_literal_global_81);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = *((id *)v30 + 5);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "_setAccountStore:", self, (void)v24);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v44 count:16];
    }
    while (v13);
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  double v17 = _ACSignpostLogSystem();
  __int16 v18 = v17;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    os_signpost_id_t v19 = *((void *)v30 + 5);
    *(_DWORD *)uint64_t v36 = 138412546;
    os_signpost_id_t v37 = v19;
    __int16 v38 = 2112;
    double v39 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_END, v5, "AllAccountsSync", "%@%@", v36, 0x16u);
  }

  __int16 v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v36 = 134218754;
    uint64_t v23 = *((void *)v30 + 5);
    os_signpost_id_t v37 = v5;
    __int16 v38 = 2048;
    double v39 = (double)Nanoseconds / 1000000000.0;
    __int16 v40 = 2112;
    uint64_t v41 = v23;
    __int16 v42 = 2112;
    double v43 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllAccountsSync %@%@", v36, 0x2Au);
  }

  id v21 = *((id *)v30 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);

  return (NSArray *)v21;
}

uint64_t __26__ACAccountStore_accounts__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__ACAccountStore_accounts__block_invoke_2;
  v3[3] = &unk_1E5BCD4A0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 accountsWithHandler:v3];
}

void __26__ACAccountStore_accounts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __26__ACAccountStore_accounts__block_invoke_79()
{
  v0 = _ACLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__ACAccountStore_accounts__block_invoke_79_cold_1();
  }
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_83()
{
  v0 = _ACLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__ACAccountStore_accounts__block_invoke_79_cold_1();
  }
}

uint64_t __56__ACAccountStore_accountsWithAccountType_options_error___block_invoke_86(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (void)accountsWithAccountType:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke;
    v34[3] = &unk_1E5BCCC18;
    void v34[4] = self;
    id v35 = v7;
    id v9 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v34);
    uint64_t v10 = [v6 identifier];
    uint64_t v11 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v10 fetchOptions:1];

    id v12 = [(ACAccountStore *)self _cache];
    uint64_t v13 = [v12 cachedAccountsForSuffix:v11];

    if (v13)
    {
      uint64_t v14 = _ACLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        [v6 identifier];
        objc_claimAutoreleasedReturnValue();
        -[ACAccountStore accountsWithAccountType:completion:]();
      }

      ((void (**)(void, void *, void))v9)[2](v9, v13, 0);
    }
    else
    {
      uint64_t v15 = _ACSignpostLogSystem();
      os_signpost_id_t v16 = _ACSignpostCreate(v15);
      uint64_t v18 = v17;

      os_signpost_id_t v19 = _ACSignpostLogSystem();
      __int16 v20 = v19;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)long long buf = 138412290;
        id v38 = v6;
        _os_signpost_emit_with_name_impl(&dword_1A57C5000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AccountsWithType", "%@", buf, 0xCu);
      }

      id v21 = _ACSignpostLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACAccountStore accountsWithAccountType:completion:]();
      }

      uint64_t v22 = [(ACAccountStore *)self remoteAccountStoreSession];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_87;
      v27[3] = &unk_1E5BCD5D8;
      id v28 = v6;
      id v29 = self;
      id v30 = v11;
      os_signpost_id_t v32 = v16;
      uint64_t v33 = v18;
      uint64_t v31 = v9;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_89;
      v23[3] = &unk_1E5BCD600;
      os_signpost_id_t v25 = v16;
      uint64_t v26 = v18;
      void v23[4] = self;
      long long v24 = v31;
      ac_dispatch_remote(v22, v27, v23);
    }
  }
  os_activity_scope_leave(&state);
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) _setAccountStore:*(void *)(a1 + 32)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v12;
  id v16 = v5;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v11, block);
}

uint64_t __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_87(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2_88;
  v6[3] = &unk_1E5BCD5B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  long long v9 = *(_OWORD *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  [a2 accountsWithAccountType:v4 handler:v6];
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_2_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  id v8 = [*(id *)(a1 + 32) _cache];
  [v8 cacheAccounts:v5 forSuffix:*(void *)(a1 + 40)];

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 56);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v13 = &stru_1EFA0AB58;
    if (v6) {
      id v13 = v6;
    }
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    double v20 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_END, v12, "AccountsWithType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  id v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void **)(a1 + 56);
    int v17 = 134218754;
    id v18 = v15;
    id v16 = &stru_1EFA0AB58;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    __int16 v21 = 2112;
    id v22 = v5;
    if (v6) {
      id v16 = v6;
    }
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_debug_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __53__ACAccountStore_accountsWithAccountType_completion___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v5 = _ACSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v8 = &stru_1EFA0AB58;
    if (v3) {
      id v8 = v3;
    }
    int v14 = 138412546;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    double v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  long long v9 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    int v14 = 134218754;
    uint64_t v15 = v12;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    if (v3) {
      id v13 = v3;
    }
    __int16 v20 = 2112;
    __int16 v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
}

void __61__ACAccountStore_accountsWithAccountType_options_completion___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v5 = _ACSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v8 = &stru_1EFA0AB58;
    if (v3) {
      id v8 = v3;
    }
    int v14 = 138412546;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    double v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  long long v9 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    int v14 = 134218754;
    uint64_t v15 = v12;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    if (v3) {
      id v13 = v3;
    }
    __int16 v20 = 2112;
    __int16 v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
}

void __84__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_95(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v5 = _ACSignpostLogSystem();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v8 = &stru_1EFA0AB58;
    if (v3) {
      id v8 = v3;
    }
    int v14 = 138412546;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    double v17 = *(double *)&v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v6, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithTypesWithProperties", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  long long v9 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    int v14 = 134218754;
    uint64_t v15 = v12;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    if (v3) {
      id v13 = v3;
    }
    __int16 v20 = 2112;
    __int16 v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v9, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypesWithProperties %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
}

uint64_t __79__ACAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_error___block_invoke_96(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (void)accountsOnPairedDeviceWithAccountType:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v9 = [a3 identifier];
  id v8 = [v6 setWithObject:v9];
  [(ACAccountStore *)self accountsOnPairedDeviceWithAccountTypes:v8 withOptions:0 completion:v7];
}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-on-paired-device-with-types", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (v10)
  {
    uint64_t v12 = _ACSignpostLogSystem();
    os_signpost_id_t v13 = _ACSignpostCreate(v12);
    uint64_t v15 = v14;

    __int16 v16 = _ACSignpostLogSystem();
    double v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v35 = (os_signpost_id_t)v8;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AccountsOnPairedDeviceWithTypes", "%@ (options: %@)", buf, 0x16u);
    }

    __int16 v18 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218498;
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2112;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v9;
      _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsOnPairedDeviceWithTypes %@ (options: %@)", buf, 0x20u);
    }

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke;
    v29[3] = &unk_1E5BCD6C8;
    void v29[4] = self;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v15;
    id v30 = v10;
    uint64_t v19 = (void *)MEMORY[0x1A626DA80](v29);
    __int16 v20 = [(ACAccountStore *)self remoteAccountStoreSession];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_98;
    v24[3] = &unk_1E5BCD478;
    id v25 = v8;
    id v26 = v9;
    long long v27 = self;
    id v28 = v19;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_100;
    v22[3] = &unk_1E5BCCC68;
    id v21 = v28;
    v22[4] = self;
    id v23 = v21;
    ac_dispatch_remote(v20, v24, v22);
  }
  os_activity_scope_leave(&state);
}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E5BCD310;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    id v7 = (__CFString *)a1[5];
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountsOnPairedDeviceWithTypes", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[4];
    id v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsOnPairedDeviceWithTypes %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_98(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2_99;
  v6[3] = &unk_1E5BCCC18;
  os_signpost_id_t v5 = (void *)a1[7];
  void v6[4] = a1[6];
  id v7 = v5;
  [a2 accountsOnPairedDeviceWithAccountTypes:v3 withOptions:v4 handler:v6];
}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_2_99(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) _setAccountStore:*(void *)(a1 + 32)];
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__ACAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_completion___block_invoke_100(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)allDataclasses
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _os_activity_create(&dword_1A57C5000, "accounts/all-dataclasses", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = _ACSignpostLogSystem();
  os_signpost_id_t v5 = _ACSignpostCreate(v4);
  uint64_t v7 = v6;

  uint64_t v8 = _ACSignpostLogSystem();
  uint64_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllDataclasses", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  uint64_t v10 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore allDataclasses]();
  }

  *(void *)long long buf = 0;
  uint64_t v22 = buf;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v11 = [(ACAccountStore *)self remoteAccountStoreSession];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __32__ACAccountStore_allDataclasses__block_invoke;
  v20[3] = &unk_1E5BCD4C8;
  v20[4] = buf;
  ac_dispatch_remote_sync(v11, v20, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  long long v13 = _ACSignpostLogSystem();
  long long v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    os_signpost_id_t v15 = *((void *)v22 + 5);
    *(_DWORD *)id v28 = 138412546;
    os_signpost_id_t v29 = v15;
    __int16 v30 = 2112;
    double v31 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_END, v5, "AllDataclasses", "%@%@", v28, 0x16u);
  }

  __int16 v16 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v28 = 134218754;
    uint64_t v19 = *((void *)v22 + 5);
    os_signpost_id_t v29 = v5;
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    os_signpost_id_t v35 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v16, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllDataclasses %@%@", v28, 0x2Au);
  }

  id v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);

  return v17;
}

uint64_t __32__ACAccountStore_allDataclasses__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__ACAccountStore_allDataclasses__block_invoke_2;
  v3[3] = &unk_1E5BCD4A0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 dataclassesWithHandler:v3];
}

void __32__ACAccountStore_allDataclasses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)allAccountTypes
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _os_activity_create(&dword_1A57C5000, "accounts/all-account-types", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x3032000000;
  __int16 v34 = __Block_byref_object_copy__0;
  os_signpost_id_t v35 = __Block_byref_object_dispose__0;
  uint64_t v4 = [(ACAccountStore *)self _cache];
  id v36 = [v4 cachedAllAccountTypes];

  os_signpost_id_t v5 = (void *)v32[5];
  if (!v5)
  {
    id v6 = _ACSignpostLogSystem();
    os_signpost_id_t v7 = _ACSignpostCreate(v6);
    uint64_t v9 = v8;

    uint64_t v10 = _ACSignpostLogSystem();
    uint64_t v11 = v10;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AllAccountTypes", (const char *)&unk_1A582B2CF, buf, 2u);
    }

    long long v12 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore allAccountTypes]();
    }

    long long v13 = [(ACAccountStore *)self remoteAccountStoreSession];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __33__ACAccountStore_allAccountTypes__block_invoke;
    v30[3] = &unk_1E5BCD718;
    void v30[4] = self;
    v30[5] = &v31;
    ac_dispatch_remote_sync(v13, v30, 0);

    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
    os_signpost_id_t v15 = _ACSignpostLogSystem();
    __int16 v16 = v15;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      os_signpost_id_t v17 = v32[5];
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v40 = v17;
      __int16 v41 = 2112;
      double v42 = COERCE_DOUBLE(&stru_1EFA0AB58);
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v16, OS_SIGNPOST_INTERVAL_END, v7, "AllAccountTypes", "%@%@", buf, 0x16u);
    }

    __int16 v18 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218754;
      uint64_t v25 = v32[5];
      os_signpost_id_t v40 = v7;
      __int16 v41 = 2048;
      double v42 = (double)Nanoseconds / 1000000000.0;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      __int16 v45 = 2112;
      __int16 v46 = &stru_1EFA0AB58;
      _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllAccountTypes %@%@", buf, 0x2Au);
    }

    os_signpost_id_t v5 = (void *)v32[5];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "setAccountStore:", self, (void)v26);
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  id v23 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __33__ACAccountStore_allAccountTypes__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__ACAccountStore_allAccountTypes__block_invoke_2;
  v3[3] = &unk_1E5BCD6F0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 accountTypesWithHandler:v3];
}

void __33__ACAccountStore_allAccountTypes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    uint64_t v7 = [a2 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [*(id *)(a1 + 32) _cache];
    [v10 cacheAllAccountTypes:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/all-account-types", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    uint64_t v20 = @"accountTypeIDs must be non-nil";
    goto LABEL_13;
  }
  if (![v6 count])
  {
    uint64_t v20 = @"accountTypeIDs must not be empty";
LABEL_13:
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  if (v7)
  {
    uint64_t v9 = _ACSignpostLogSystem();
    os_signpost_id_t v10 = _ACSignpostCreate(v9);
    uint64_t v12 = v11;

    long long v13 = _ACSignpostLogSystem();
    long long v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)long long buf = 138412290;
      id v35 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VisibleAccountsWithTypes", "%@", buf, 0xCu);
    }

    os_signpost_id_t v15 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:]();
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke;
    v28[3] = &unk_1E5BCD5B0;
    uint8_t v28[4] = self;
    os_signpost_id_t v31 = v10;
    uint64_t v32 = v12;
    id v16 = v6;
    id v29 = v16;
    id v30 = v7;
    os_signpost_id_t v17 = (void *)MEMORY[0x1A626DA80](v28);
    __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_108;
    v24[3] = &unk_1E5BCD388;
    id v25 = v16;
    long long v26 = self;
    id v27 = v17;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_110;
    v22[3] = &unk_1E5BCCC68;
    id v19 = v27;
    v22[4] = self;
    id v23 = v19;
    ac_dispatch_remote(v18, v24, v22);
  }
  os_activity_scope_leave(&state);
}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2;
  v11[3] = &unk_1E5BCD740;
  long long v16 = *(_OWORD *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v8 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

uint64_t __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[8], a1[9]);
  uint64_t v3 = _ACSignpostLogSystem();
  long long v4 = v3;
  os_signpost_id_t v5 = a1[8];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    id v7 = (__CFString *)a1[5];
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VisibleAccountsWithTypes", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[8];
    uint64_t v11 = a1[4];
    id v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: VisibleAccountsWithTypes %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_108(void *a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2_109;
  v5[3] = &unk_1E5BCCC18;
  uint64_t v3 = a1[4];
  long long v4 = (void *)a1[6];
  v5[4] = a1[5];
  id v6 = v4;
  [a2 visibleTopLevelAccountsWithAccountTypeIdentifiers:v3 completion:v5];
}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_2_109(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) _setAccountStore:*(void *)(a1 + 32)];
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__ACAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke_110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)hasAccountWithDescription:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/has-account-with-description", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HasAccountWithDescription", "%@", (uint8_t *)&buf, 0xCu);
  }

  long long v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore hasAccountWithDescription:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  long long v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44__ACAccountStore_hasAccountWithDescription___block_invoke;
  v24[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v25 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v16 = _ACSignpostLogSystem();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      __int16 v18 = @"YES";
    }
    else {
      __int16 v18 = @"NO";
    }
    *(_DWORD *)long long v28 = 138543362;
    os_signpost_id_t v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "HasAccountWithDescription", "%{public}@", v28, 0xCu);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)long long v28 = 134218498;
    os_signpost_id_t v29 = v7;
    if (v22) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2114;
    uint64_t v33 = v23;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: HasAccountWithDescription %{public}@", v28, 0x20u);
  }

  BOOL v20 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __44__ACAccountStore_hasAccountWithDescription___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __44__ACAccountStore_hasAccountWithDescription___block_invoke_2;
  v4[3] = &unk_1E5BCD768;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 accountExistsWithDescription:v2 completion:v4];
}

uint64_t __44__ACAccountStore_hasAccountWithDescription___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/kerberos-accounts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (v7)
  {
    uint64_t v9 = _ACSignpostLogSystem();
    os_signpost_id_t v10 = _ACSignpostCreate(v9);
    uint64_t v12 = v11;

    long long v13 = _ACSignpostLogSystem();
    id v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v6;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "KerberosAccounts", "%@", buf, 0xCu);
    }

    long long v15 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore kerberosAccountsForDomainFromURL:completion:]();
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke;
    v24[3] = &unk_1E5BCD6C8;
    void v24[4] = self;
    os_signpost_id_t v26 = v10;
    uint64_t v27 = v12;
    id v25 = v7;
    __int16 v16 = (void *)MEMORY[0x1A626DA80](v24);
    uint64_t v17 = [(ACAccountStore *)self remoteAccountStoreSession];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_119;
    v21[3] = &unk_1E5BCCC40;
    id v22 = v6;
    id v23 = v16;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_2;
    v19[3] = &unk_1E5BCCC68;
    id v18 = v23;
    v19[4] = self;
    id v20 = v18;
    ac_dispatch_remote(v17, v21, v19);
  }
  os_activity_scope_leave(&state);
}

void __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) _setAccountStore:*(void *)(a1 + 32)];
        }
        uint64_t v9 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_118;
  block[3] = &unk_1E5BCD310;
  long long v19 = *(_OWORD *)(a1 + 48);
  id v16 = v5;
  id v17 = v6;
  id v18 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v12, block);
}

uint64_t __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_118(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    id v7 = (__CFString *)a1[5];
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "KerberosAccounts", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[4];
    uint64_t v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    long long v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: KerberosAccounts %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_119(uint64_t a1, void *a2)
{
  return [a2 kerberosAccountsForDomainFromURL:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __62__ACAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/push-supported", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PushSupported", "%@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore isPushSupportedForAccount:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  id v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __44__ACAccountStore_isPushSupportedForAccount___block_invoke;
  v24[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v25 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v16 = _ACSignpostLogSystem();
  double v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      __int16 v18 = @"YES";
    }
    else {
      __int16 v18 = @"NO";
    }
    *(_DWORD *)long long v28 = 138543362;
    os_signpost_id_t v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "PushSupported", "%{public}@", v28, 0xCu);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)long long v28 = 134218498;
    os_signpost_id_t v29 = v7;
    if (v22) {
      long long v23 = @"YES";
    }
    else {
      long long v23 = @"NO";
    }
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2114;
    uint64_t v33 = v23;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PushSupported %{public}@", v28, 0x20u);
  }

  BOOL v20 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __44__ACAccountStore_isPushSupportedForAccount___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __44__ACAccountStore_isPushSupportedForAccount___block_invoke_2;
  v4[3] = &unk_1E5BCD768;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 isPushSupportedForAccount:v2 completion:v4];
}

uint64_t __44__ACAccountStore_isPushSupportedForAccount___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (int)accountsWithAccountTypeIdentifierExist:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type-exist", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v5, &v21);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v23 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AccountsWithTypeExist", "%@", buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[ACAccountStore accountsWithAccountTypeIdentifierExist:]();
  }

  if ([a1 countOfAccountsWithAccountTypeIdentifier:v4] > 0) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  uint64_t v15 = _ACSignpostLogSystem();
  __int16 v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    double v17 = [NSNumber numberWithUnsignedInt:v13];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v23 = (os_signpost_id_t)v17;
    __int16 v24 = 2112;
    double v25 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v16, OS_SIGNPOST_INTERVAL_END, v7, "AccountsWithTypeExist", "%@%@", buf, 0x16u);
  }
  __int16 v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    BOOL v20 = [NSNumber numberWithUnsignedInt:v13];
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v23 = v7;
    __int16 v24 = 2048;
    double v25 = (double)Nanoseconds / 1000000000.0;
    __int16 v26 = 2112;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    os_signpost_id_t v29 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeExist %@%@", buf, 0x2Au);
  }
  os_activity_scope_leave(&v21);

  return v13;
}

+ (int64_t)countOfAccountsWithAccountTypeIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-type-count", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v4, &v23);
  os_signpost_id_t v5 = _ACSignpostLogSystem();
  os_signpost_id_t v6 = _ACSignpostCreate(v5);
  uint64_t v8 = v7;

  uint64_t v9 = _ACSignpostLogSystem();
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v25 = (os_signpost_id_t)v3;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AccountsWithTypeCount", "%@", buf, 0xCu);
  }

  uint64_t v11 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ACAccountStore countOfAccountsWithAccountTypeIdentifier:]();
  }

  uint64_t v12 = objc_alloc_init(ACAccountStore);
  uint64_t v13 = [(ACAccountStore *)v12 accountTypeWithAccountTypeIdentifier:v3];
  id v14 = [(ACAccountStore *)v12 accountsWithAccountType:v13];
  int64_t v15 = [v14 count];

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v6, v8);
  double v17 = _ACSignpostLogSystem();
  __int16 v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    uint64_t v19 = [NSNumber numberWithInteger:v15];
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v25 = (os_signpost_id_t)v19;
    __int16 v26 = 2112;
    double v27 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_END, v6, "AccountsWithTypeCount", "%@%@", buf, 0x16u);
  }
  BOOL v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v22 = [NSNumber numberWithInteger:v15];
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v25 = v6;
    __int16 v26 = 2048;
    double v27 = (double)Nanoseconds / 1000000000.0;
    __int16 v28 = 2112;
    os_signpost_id_t v29 = v22;
    __int16 v30 = 2112;
    double v31 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsWithTypeCount %@%@", buf, 0x2Au);
  }
  os_activity_scope_leave(&v23);

  return v15;
}

- (void)insertAccountType:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/insert-account-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account type must be non-nil" userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  id v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v33 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "InsertAccountType", "%@", buf, 0xCu);
  }

  int64_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore insertAccountType:withCompletionHandler:]();
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5BCD7E0;
  void v27[4] = self;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v16 = v7;
  id v28 = v16;
  double v17 = (void *)MEMORY[0x1A626DA80](v27);
  __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_124;
  v24[3] = &unk_1E5BCCC40;
  id v19 = v6;
  id v25 = v19;
  id v26 = v17;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E5BCCC68;
  id v20 = v26;
  v22[4] = self;
  id v23 = v20;
  ac_dispatch_remote(v18, v24, v22);

  os_activity_scope_leave(&state);
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    int64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "InsertAccountType", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    int64_t v15 = v10;
    uint64_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      uint64_t v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: InsertAccountType %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_124(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2_125;
  v5[3] = &unk_1E5BCD808;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [a2 insertAccountType:v4 withHandler:v5];
}

uint64_t __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_2_125(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    os_signpost_id_t v5 = *(void **)(a1 + 32);
    id v6 = [a2 objectID];
    [v5 setObjectID:v6];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void __58__ACAccountStore_insertAccountType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)removeAccountType:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/remove-account-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account type must be non-nil" userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v33 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveAccountType", "%@", buf, 0xCu);
  }

  int64_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore removeAccountType:withCompletionHandler:]();
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5BCD7E0;
  void v27[4] = self;
  os_signpost_id_t v29 = v10;
  uint64_t v30 = v12;
  id v16 = v7;
  id v28 = v16;
  double v17 = (void *)MEMORY[0x1A626DA80](v27);
  __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_126;
  v24[3] = &unk_1E5BCCC40;
  id v19 = v6;
  id v25 = v19;
  id v26 = v17;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E5BCCC68;
  id v20 = v26;
  v22[4] = self;
  id v23 = v20;
  ac_dispatch_remote(v18, v24, v22);

  os_activity_scope_leave(&state);
}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = a3;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v7 = _ACSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    os_signpost_id_t v10 = @"NO";
    if (a2) {
      os_signpost_id_t v10 = @"YES";
    }
    uint64_t v11 = &stru_1EFA0AB58;
    if (v5) {
      uint64_t v11 = v5;
    }
    int v17 = 138412546;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    double v20 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveAccountType", "%@%@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = (__CFString *)a1[6];
    int64_t v15 = @"NO";
    if (a2) {
      int64_t v15 = @"YES";
    }
    int v17 = 134218754;
    __int16 v18 = v14;
    id v16 = &stru_1EFA0AB58;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    if (v5) {
      id v16 = v5;
    }
    __int16 v23 = 2112;
    __int16 v24 = v16;
    _os_log_debug_impl(&dword_1A57C5000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountType %@%@", (uint8_t *)&v17, 0x2Au);
  }

  uint64_t v13 = a1[5];
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_126(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5BCD830;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 removeAccountType:v3 withHandler:v4];
}

uint64_t __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__ACAccountStore_removeAccountType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)removeAccount:(id)a3 withDeleteSync:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v11 = a3;
  os_signpost_id_t v10 = [v8 numberWithBool:v5];
  [v11 setAccountProperty:v10 forKey:@"AccountSyncDelete"];

  [(ACAccountStore *)self removeAccount:v11 withDataclassActions:0 completion:v9];
}

- (void)removeAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreRemoveCompletionHandler)completionHandler
{
}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A57C5000, "accounts/remove-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  id v16 = _ACSignpostLogSystem();
  int v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    __int16 v18 = [v8 accountType];
    __int16 v19 = [v18 identifier];
    *(_DWORD *)long long buf = 138543362;
    os_signpost_id_t v43 = (os_signpost_id_t)v19;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ ", buf, 0xCu);
  }
  double v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v28 = [v8 accountType];
    os_signpost_id_t v29 = [v28 identifier];
    *(_DWORD *)long long buf = 134218242;
    os_signpost_id_t v43 = v13;
    __int16 v44 = 2114;
    __int16 v45 = v29;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RemoveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ ", buf, 0x16u);
  }
  __int16 v21 = _ACLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v43 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A57C5000, v21, OS_LOG_TYPE_DEFAULT, "\"Starting removal of account %@.\"", buf, 0xCu);
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke;
  v37[3] = &unk_1E5BCD7E0;
  v37[4] = self;
  os_signpost_id_t v39 = v13;
  uint64_t v40 = v15;
  id v22 = v10;
  id v38 = v22;
  __int16 v23 = (void *)MEMORY[0x1A626DA80](v37);
  __int16 v24 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_135;
  v33[3] = &unk_1E5BCD388;
  id v25 = v8;
  id v34 = v25;
  id v26 = v9;
  id v35 = v26;
  id v36 = v23;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2;
  v31[3] = &unk_1E5BCCC68;
  id v27 = v36;
  void v31[4] = self;
  id v32 = v27;
  ac_dispatch_remote(v24, v33, v31);

  os_activity_scope_leave(&state);
}

void __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    int v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account removal: %@ - %@.\"", buf, 0x16u);
  }

  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_134;
  block[3] = &unk_1E5BCD858;
  long long v14 = *(_OWORD *)(a1 + 48);
  char v15 = a2;
  id v9 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_134(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    int v12 = 138543362;
    id v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(__CFString **)(a1 + 48);
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v12 = 134218498;
    id v13 = v9;
    if (v10) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    int v17 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_135(void *a1, void *a2)
{
  return [a2 removeAccount:a1[4] withDataclassActions:a1[5] completion:a1[6]];
}

void __64__ACAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)canSaveAccount:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/can-save-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v20);
  }
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _ACSignpostLogSystem();
  __int16 v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CanSaveAccount", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  double v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore canSaveAccount:withCompletionHandler:]();
  }

  __int16 v16 = _ACLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_1A57C5000, v16, OS_LOG_TYPE_DEFAULT, "\"Checking save eligibility of account %@.\"", buf, 0xCu);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke;
  v26[3] = &unk_1E5BCD7E0;
  v26[4] = self;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v17 = v7;
  id v27 = v17;
  uint64_t v18 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v26);
  if ([v6 isDirty])
  {
    id v19 = [(ACAccountStore *)self remoteAccountStoreSession];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_137;
    v23[3] = &unk_1E5BCCC40;
    id v24 = v6;
    id v25 = v18;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E5BCCC68;
    void v21[4] = self;
    id v22 = v25;
    ac_dispatch_remote(v19, v23, v21);
  }
  else
  {
    v18[2](v18, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed checking save eligibility: %@ - %@.\"", buf, 0x16u);
  }

  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_136;
  block[3] = &unk_1E5BCD858;
  long long v14 = *(_OWORD *)(a1 + 48);
  char v15 = a2;
  id v9 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_136(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    int v12 = 138543362;
    id v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "CanSaveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(__CFString **)(a1 + 48);
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v12 = 134218498;
    id v13 = v9;
    if (v10) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_137(uint64_t a1, void *a2)
{
  return [a2 canSaveAccount:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __55__ACAccountStore_canSaveAccount_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

+ (BOOL)canSaveAccountsOfAccountTypeIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = _os_activity_create(&dword_1A57C5000, "accounts/can-save-accounts-with-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v4, &v23);
  os_signpost_id_t v5 = _ACSignpostLogSystem();
  os_signpost_id_t v6 = _ACSignpostCreate(v5);
  uint64_t v8 = v7;

  id v9 = _ACSignpostLogSystem();
  int v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v25 = (os_signpost_id_t)v3;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CanSaveAccountsWithType", "%@", buf, 0xCu);
  }

  uint64_t v11 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ACAccountStore canSaveAccountsOfAccountTypeIdentifier:]();
  }

  int v12 = objc_alloc_init(ACAccountStore);
  id v13 = [(ACAccountStore *)v12 accountTypeWithAccountTypeIdentifier:v3];
  if ([v13 supportsMultipleAccounts])
  {
    BOOL v14 = 1;
  }
  else
  {
    double v15 = [v13 identifier];
    BOOL v14 = +[ACAccountStore countOfAccountsWithAccountTypeIdentifier:v15] < 1;
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v6, v8);
  id v17 = _ACSignpostLogSystem();
  uint64_t v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    id v19 = @"NO";
    if (v14) {
      id v19 = @"YES";
    }
    *(_DWORD *)long long buf = 138543362;
    os_signpost_id_t v25 = (os_signpost_id_t)v19;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_END, v6, "CanSaveAccountsWithType", "%{public}@", buf, 0xCu);
  }

  uint64_t v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v22 = @"NO";
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v25 = v6;
    if (v14) {
      id v22 = @"YES";
    }
    __int16 v26 = 2048;
    double v27 = (double)Nanoseconds / 1000000000.0;
    __int16 v28 = 2114;
    uint64_t v29 = v22;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccountsWithType %{public}@", buf, 0x20u);
  }

  os_activity_scope_leave(&v23);
  return v14;
}

- (void)saveAccount:(ACAccount *)account withCompletionHandler:(ACAccountStoreSaveCompletionHandler)completionHandler
{
}

- (void)_saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v36 = a5;
  id v10 = a6;
  uint64_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/save-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v9)
  {
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v34);
  }
  int v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  __int16 v16 = _ACSignpostLogSystem();
  id v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    uint64_t v18 = [v9 accountType];
    id v19 = [v18 identifier];
    *(_DWORD *)long long buf = 138543618;
    os_signpost_id_t v53 = (os_signpost_id_t)v19;
    __int16 v54 = 2112;
    id v55 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SaveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x16u);
  }
  uint64_t v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v32 = [v9 accountType];
    uint64_t v33 = [v32 identifier];
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v53 = v13;
    __int16 v54 = 2114;
    id v55 = v33;
    __int16 v56 = 2112;
    id v57 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x20u);
  }
  __int16 v21 = _ACLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v53 = (os_signpost_id_t)v9;
    _os_log_impl(&dword_1A57C5000, v21, OS_LOG_TYPE_DEFAULT, "\"Starting save for account %@.\"", buf, 0xCu);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke;
  v47[3] = &unk_1E5BCD7E0;
  v47[4] = self;
  os_signpost_id_t v49 = v13;
  uint64_t v50 = v15;
  id v22 = v10;
  id v48 = v22;
  os_activity_scope_state_s v23 = (void *)MEMORY[0x1A626DA80](v47);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_139;
  v44[3] = &unk_1E5BCD880;
  id v24 = v23;
  id v46 = v24;
  v44[4] = self;
  id v25 = v9;
  id v45 = v25;
  __int16 v26 = (void *)MEMORY[0x1A626DA80](v44);
  if ([v25 isDirty])
  {
    double v27 = _ACLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore _saveAccount:verify:dataclassActions:completion:]();
    }

    __int16 v28 = [v25 accountType];
    uint64_t v29 = [v28 identifier];
    [(ACAccountStore *)self _checkSaveRateLimitForAccountType:v29];

    uint64_t v30 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_141;
    v39[3] = &unk_1E5BCD8A8;
    id v40 = v25;
    BOOL v43 = a4;
    id v41 = v36;
    id v42 = v26;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_2;
    v37[3] = &unk_1E5BCCC68;
    v37[4] = self;
    id v38 = v24;
    ac_dispatch_remote(v30, v39, v37);
  }
  else
  {
    double v31 = _ACLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore _saveAccount:verify:dataclassActions:completion:]();
    }

    (*((void (**)(id, uint64_t, void))v24 + 2))(v24, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account save: %@ - %@.\"", buf, 0x16u);
  }

  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_138;
  block[3] = &unk_1E5BCD858;
  long long v14 = *(_OWORD *)(a1 + 48);
  char v15 = a2;
  id v9 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_138(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      os_signpost_id_t v6 = @"YES";
    }
    else {
      os_signpost_id_t v6 = @"NO";
    }
    int v12 = 138543362;
    id v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "SaveAccount", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = *(__CFString **)(a1 + 48);
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v12 = 134218498;
    id v13 = v9;
    if (v10) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccount %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    os_signpost_id_t v5 = *(void **)(a1 + 32);
    id v6 = a3;
    [v5 _clearAccountCaches];
    [*(id *)(a1 + 40) _setObjectID:v12];
    [*(id *)(a1 + 40) _clearCachedChildAccounts];
    [*(id *)(a1 + 40) _setAccountStore:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _clearDirtyProperties];
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 32) _unsanitizeError:v6];

    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = *(void **)(a1 + 32);
    id v11 = a3;
    uint64_t v8 = [v10 _unsanitizeError:v11];

    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v8);
  }
}

uint64_t __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_141(uint64_t a1, void *a2)
{
  return [a2 saveAccount:*(void *)(a1 + 32) verify:*(unsigned __int8 *)(a1 + 56) dataclassActions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __66__ACAccountStore__saveAccount_verify_dataclassActions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
}

- (void)saveAccount:(id)a3 withDataclassActions:(id)a4 doVerify:(BOOL)a5 completion:(id)a6
{
}

- (void)saveVerifiedAccount:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1A57C5000, "accounts/save-verified-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (!v6)
  {
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _ACSignpostLogSystem();
  id v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    __int16 v14 = [v6 accountType];
    double v15 = [v14 identifier];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SaveAccount", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x16u);
  }
  __int16 v16 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v29 = [v6 accountType];
    uint64_t v30 = [v29 identifier];
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v30;
    *(_WORD *)&buf[22] = 2112;
    __int16 v54 = (uint64_t (*)(uint64_t, uint64_t))v6;
    _os_log_debug_impl(&dword_1A57C5000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccount  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@ (account: %@)", buf, 0x20u);
  }
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v54 = __Block_byref_object_copy__0;
  id v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  if ([v6 isDirty])
  {
    id v17 = [v6 accountType];
    uint64_t v18 = [v17 identifier];
    [(ACAccountStore *)self _checkSaveRateLimitForAccountType:v18];

    id v19 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke;
    v35[3] = &unk_1E5BCD8F8;
    id v38 = &v40;
    os_signpost_id_t v39 = buf;
    id v36 = v6;
    uint64_t v37 = self;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_3;
    v34[3] = &unk_1E5BCD6A0;
    void v34[5] = &v40;
    v34[6] = buf;
    void v34[4] = self;
    ac_dispatch_remote_sync(v19, v35, v34);

    uint64_t v20 = v36;
  }
  else
  {
    uint64_t v20 = _ACLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore saveVerifiedAccount:error:]();
    }
  }

  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  id v22 = _ACSignpostLogSystem();
  os_activity_scope_state_s v23 = v22;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    if (*((unsigned char *)v41 + 24)) {
      id v24 = @"YES";
    }
    else {
      id v24 = @"NO";
    }
    id v25 = *(__CFString **)(*(void *)&buf[8] + 40);
    if (*(double *)&v25 == 0.0) {
      *(double *)&id v25 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)id v45 = 138412546;
    os_signpost_id_t v46 = (os_signpost_id_t)v24;
    __int16 v47 = 2112;
    double v48 = *(double *)&v25;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v23, OS_SIGNPOST_INTERVAL_END, v9, "SaveAccount", "%@%@", v45, 0x16u);
  }

  __int16 v26 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    double v31 = @"YES";
    id v32 = *(__CFString **)(*(void *)&buf[8] + 40);
    if (!*((unsigned char *)v41 + 24)) {
      double v31 = @"NO";
    }
    *(_DWORD *)id v45 = 134218754;
    os_signpost_id_t v46 = v9;
    __int16 v47 = 2048;
    double v48 = (double)Nanoseconds / 1000000000.0;
    __int16 v49 = 2112;
    uint64_t v50 = v31;
    if (!v32) {
      id v32 = &stru_1EFA0AB58;
    }
    __int16 v51 = 2112;
    id v52 = v32;
    _os_log_debug_impl(&dword_1A57C5000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccount %@%@", v45, 0x2Au);
  }

  BOOL v27 = *((unsigned char *)v41 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v40, 8);
  os_activity_scope_leave(&state);

  return v27;
}

void __44__ACAccountStore_saveVerifiedAccount_error___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  int8x16_t v2 = *(int8x16_t *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  v3[2] = __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_2;
  v3[3] = &unk_1E5BCD8D0;
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  [a2 saveAccount:(id)v2.i64[0] verify:0 dataclassActions:0 completion:v3];
}

void __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    long long v5 = *(void **)(a1 + 32);
    id v6 = a3;
    [v5 _clearAccountCaches];
    [*(id *)(a1 + 40) _setObjectID:v12];
    [*(id *)(a1 + 40) _clearCachedChildAccounts];
    [*(id *)(a1 + 40) _setAccountStore:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _clearDirtyProperties];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v7 = *(void **)(a1 + 32);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v8 = *(void **)(a1 + 32);
    id v6 = a3;
    uint64_t v7 = v8;
  }
  uint64_t v9 = [v7 _unsanitizeError:v6];

  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __44__ACAccountStore_saveVerifiedAccount_error___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (int)updateExistenceCacheOfAccountWithTypeIdentifier:(id)a3
{
  return +[ACAccountStore accountsWithAccountTypeIdentifierExist:a3];
}

- (void)_checkSaveRateLimitForAccountType:(id)a3
{
  id v3 = a3;
  if (_checkSaveRateLimitForAccountType__onceToken != -1) {
    dispatch_once(&_checkSaveRateLimitForAccountType__onceToken, &__block_literal_global_143);
  }
  if (_checkSaveRateLimitForAccountType__saveRateLimiter
    && ([(id)_checkSaveRateLimitForAccountType__saveRateLimiter reservePerformActionForKey:v3] & 1) == 0)
  {
    int8x16_t v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[ACAccountStore _checkSaveRateLimitForAccountType:]((uint64_t)v3, v4);
    }
  }
}

uint64_t __52__ACAccountStore__checkSaveRateLimitForAccountType___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    _checkSaveRateLimitForAccountType__saveRateLimiter = [[ACRateLimiter alloc] initWithMaximum:60 inTimeInterval:60.0];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)requestAccessToAccountsWithType:(ACAccountType *)accountType withCompletionHandler:(ACAccountStoreRequestAccessCompletionHandler)handler
{
}

void __69__ACAccountStore_requestAccessToAccountsWithType_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)appPermissionsForAccountType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = _os_activity_create(&dword_1A57C5000, "accounts/app-permissions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "AppPermissionsForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore appPermissionsForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  id v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__ACAccountStore_appPermissionsForAccountType___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v16 = _ACSignpostLogSystem();
  id v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)BOOL v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "AppPermissionsForAccountType", "%@%@", v27, 0x16u);
  }

  id v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)BOOL v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AppPermissionsForAccountType %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __47__ACAccountStore_appPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __47__ACAccountStore_appPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD948;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 appPermissionsForAccountType:v2 withHandler:v4];
}

void __47__ACAccountStore_appPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)setPermissionGranted:(BOOL)a3 forBundleID:(id)a4 onAccountType:(id)a5
{
  BOOL v6 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a4;
  uint64_t v9 = (__CFString *)a5;
  uint64_t v10 = _os_activity_create(&dword_1A57C5000, "accounts/set-permission-granted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = _ACSignpostLogSystem();
  os_signpost_id_t v12 = _ACSignpostCreate(v11);
  uint64_t v14 = v13;

  double v15 = _ACSignpostLogSystem();
  __int16 v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    id v17 = @"NO";
    *(_DWORD *)long long buf = 138412802;
    if (v6) {
      id v17 = @"YES";
    }
    os_signpost_id_t v37 = (os_signpost_id_t)v17;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PermitBundleWithAccountType", "%@: %@ -> %@", buf, 0x20u);
  }

  os_signpost_id_t v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    BOOL v27 = @"NO";
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v37 = v12;
    if (v6) {
      BOOL v27 = @"YES";
    }
    __int16 v38 = 2112;
    id v39 = v27;
    __int16 v40 = 2112;
    id v41 = v8;
    __int16 v42 = 2112;
    char v43 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: PermitBundleWithAccountType %@: %@ -> %@", buf, 0x2Au);
  }

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  id v20 = [(ACAccountStore *)self remoteAccountStoreSession];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke;
  v30[3] = &unk_1E5BCD998;
  BOOL v34 = v6;
  __int16 v21 = v8;
  __int16 v31 = v21;
  uint64_t v22 = v9;
  uint64_t v32 = v22;
  __int16 v33 = v19;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_158;
  v28[3] = &unk_1E5BCD9C0;
  os_activity_scope_state_s v23 = v33;
  __int16 v29 = v23;
  ac_dispatch_remote(v20, v30, v28);

  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v12, v14);
  id v24 = _ACSignpostLogSystem();
  id v25 = v24;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v25, OS_SIGNPOST_INTERVAL_END, v12, "PermitBundleWithAccountType", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  __int16 v26 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore setPermissionGranted:forBundleID:onAccountType:](v12);
  }

  os_activity_scope_leave(&state);
}

void __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  id v5 = a2;
  BOOL v6 = [v3 numberWithBool:v4];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_2;
  v9[3] = &unk_1E5BCD970;
  id v10 = *(id *)(a1 + 48);
  [v5 setPermissionGranted:v6 forBundleID:v7 onAccountType:v8 withHandler:v9];
}

void __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __65__ACAccountStore_setPermissionGranted_forBundleID_onAccountType___block_invoke_158(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/clear-permission-granted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  BOOL v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearPermissionsForAccountType", "%@", buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore clearAllPermissionsGrantedForAccountType:]();
  }

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = [(ACAccountStore *)self remoteAccountStoreSession];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke;
  v22[3] = &unk_1E5BCD9E8;
  id v15 = v4;
  id v23 = v15;
  id v24 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_159;
  v20[3] = &unk_1E5BCD9C0;
  __int16 v16 = v24;
  __int16 v21 = v16;
  ac_dispatch_remote(v14, v22, v20);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v7, v9);
  id v17 = _ACSignpostLogSystem();
  os_signpost_id_t v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_END, v7, "ClearPermissionsForAccountType", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  dispatch_semaphore_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore clearAllPermissionsGrantedForAccountType:](v7);
  }

  os_activity_scope_leave(&state);
}

void __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD970;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 clearAllPermissionsGrantedForAccountType:v3 withHandler:v4];
}

void __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __59__ACAccountStore_clearAllPermissionsGrantedForAccountType___block_invoke_159(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)permissionForAccountType:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/permission-for-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  BOOL v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PermissionForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore permissionForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  dispatch_semaphore_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __43__ACAccountStore_permissionForAccountType___block_invoke;
  v24[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v25 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v24, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v16 = _ACSignpostLogSystem();
  id v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      os_signpost_id_t v18 = @"YES";
    }
    else {
      os_signpost_id_t v18 = @"NO";
    }
    *(_DWORD *)uint64_t v28 = 138543362;
    os_signpost_id_t v29 = (os_signpost_id_t)v18;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "ClearPermissionsForAccountType", "%{public}@", v28, 0xCu);
  }

  dispatch_semaphore_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)uint64_t v28 = 134218498;
    os_signpost_id_t v29 = v7;
    if (v22) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2114;
    __int16 v33 = v23;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ClearPermissionsForAccountType %{public}@", v28, 0x20u);
  }

  BOOL v20 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __43__ACAccountStore_permissionForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __43__ACAccountStore_permissionForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCDA10;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 permissionForAccountType:v2 withHandler:v4];
}

void __43__ACAccountStore_permissionForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  }
}

- (id)grantedPermissionsForAccountType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/granted-permissions-for-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  BOOL v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GrantedPermissionsForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore grantedPermissionsForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__0;
  __int16 v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  dispatch_semaphore_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v16 = _ACSignpostLogSystem();
  id v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "GrantedPermissionsForAccountType", "%@%@", v27, 0x16u);
  }

  dispatch_semaphore_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    BOOL v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: GrantedPermissionsForAccountType %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD920;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 grantedPermissionsForAccountType:v2 withHandler:v4];
}

void __51__ACAccountStore_grantedPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)clearGrantedPermissionsForAccountType:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/clear-granted-permissions-for-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)long long buf = 138412290;
    id v27 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClearGrantedPermissionsForAccountType", "%@", buf, 0xCu);
  }

  os_signpost_id_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore clearGrantedPermissionsForAccountType:]();
  }

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  id v14 = [(ACAccountStore *)self remoteAccountStoreSession];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke;
  v22[3] = &unk_1E5BCD9E8;
  id v15 = v4;
  id v23 = v15;
  id v24 = v13;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_160;
  v20[3] = &unk_1E5BCD9C0;
  __int16 v16 = v24;
  __int16 v21 = v16;
  ac_dispatch_remote(v14, v22, v20);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  _ACSignpostGetNanoseconds(v7, v9);
  id v17 = _ACSignpostLogSystem();
  os_signpost_id_t v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_END, v7, "ClearGrantedPermissionsForAccountType", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  dispatch_semaphore_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore clearGrantedPermissionsForAccountType:](v7);
  }

  os_activity_scope_leave(&state);
}

void __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD9C0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 clearGrantedPermissionsForAccountType:v3 withHandler:v4];
}

void __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _ACLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __56__ACAccountStore_clearGrantedPermissionsForAccountType___block_invoke_160(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)verifyCredentialsForAccount:(id)a3 withHandler:(id)a4
{
}

- (void)verifyCredentialsForAccount:(id)a3 saveWhenAuthorized:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v13 = @"ACShouldSave";
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 numberWithBool:v5];
  v14[0] = v11;
  os_signpost_id_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [(ACAccountStore *)self verifyCredentialsForAccount:v10 options:v12 completion:v9];
}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/verify-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v35);
  }
  uint64_t v36 = v10;
  [v8 _setAccountStore:self];
  os_signpost_id_t v12 = [(ACAccountStore *)self _sanitizeOptionsDictionary:v9];

  dispatch_semaphore_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = _ACSignpostCreate(v13);
  uint64_t v16 = v15;

  id v17 = _ACSignpostLogSystem();
  os_signpost_id_t v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    dispatch_semaphore_t v19 = [v8 accountType];
    id v20 = [v19 identifier];
    __int16 v21 = [v12 objectForKeyedSubscript:@"ACShouldSave"];
    int v22 = [v21 BOOLValue];
    *(_DWORD *)long long buf = 138543874;
    os_signpost_id_t v50 = (os_signpost_id_t)v20;
    __int16 v51 = 1026;
    *(_DWORD *)id v52 = v22;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VerifyCredentials", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldSave=%{public,signpost.telemetry:number1,name=ShouldSave}d  enableTelemetry=YES (account: %@)", buf, 0x1Cu);
  }
  id v23 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    __int16 v31 = [v8 accountType];
    uint64_t v32 = [v31 identifier];
    __int16 v33 = [v12 objectForKeyedSubscript:@"ACShouldSave"];
    int v34 = [v33 BOOLValue];
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v50 = v14;
    __int16 v51 = 2114;
    *(void *)id v52 = v32;
    *(_WORD *)&v52[8] = 1026;
    *(_DWORD *)&v52[10] = v34;
    __int16 v53 = 2112;
    id v54 = v8;
    _os_log_debug_impl(&dword_1A57C5000, v23, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: VerifyCredentials  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldSave=%{public,signpost.telemetry:number1,name=ShouldSave}d  enableTelemetry=YES (account: %@)", buf, 0x26u);
  }
  id v24 = _ACLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v50 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A57C5000, v24, OS_LOG_TYPE_DEFAULT, "\"Starting credential verification for account %@.\"", buf, 0xCu);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke;
  v44[3] = &unk_1E5BCD338;
  v44[4] = self;
  os_signpost_id_t v46 = v14;
  uint64_t v47 = v16;
  id v25 = v36;
  id v45 = v25;
  __int16 v26 = (void *)MEMORY[0x1A626DA80](v44);
  id v27 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_163;
  v39[3] = &unk_1E5BCD478;
  id v28 = v8;
  id v40 = v28;
  id v29 = v12;
  id v41 = v29;
  __int16 v42 = self;
  id v43 = v26;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_3;
  v37[3] = &unk_1E5BCCC68;
  id v30 = v43;
  v37[4] = self;
  id v38 = v30;
  ac_dispatch_remote(v27, v39, v37);

  os_activity_scope_leave(&state);
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Completed account credential verification: %@ - %@.\"", buf, 0x16u);
  }

  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_162;
  block[3] = &unk_1E5BCDA38;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v13 = v6;
  id v9 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_162(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (a1[4]) {
      id v6 = @"NO";
    }
    else {
      id v6 = @"YES";
    }
    int v12 = 138543362;
    id v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VerifyCredentials", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  os_signpost_id_t v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (__CFString *)a1[7];
    uint64_t v10 = a1[4];
    int v12 = 134218498;
    id v13 = v9;
    if (v10) {
      id v11 = @"NO";
    }
    else {
      id v11 = @"YES";
    }
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: VerifyCredentials %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[5], a1[4]);
  }
  return result;
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_163(void *a1, void *a2)
{
  uint64_t v5 = a1[4];
  id v4 = (void *)a1[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_2;
  v9[3] = &unk_1E5BCD3B0;
  id v6 = v4;
  uint64_t v7 = a1[6];
  id v8 = (void *)a1[7];
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v8;
  [a2 verifyCredentialsForAccount:v5 options:v6 completion:v9];
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"ACShouldSave"];
  int v8 = [v7 BOOLValue];

  if (!v6 && v8) {
    [v11 _clearCachedCredentials];
  }
  [v11 _setAccountStore:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 40) _unsanitizeError:v6];

  (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v11, v10);
}

void __65__ACAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v43 = _os_activity_create(&dword_1A57C5000, "accounts/renew-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v43, &state);
  if (!v8)
  {
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v42);
  }
  id v10 = [v8 accountStore];
  if (v10)
  {
    id v11 = [v8 accountStore];
    char v12 = [v11 isEqual:self];

    if ((v12 & 1) == 0)
    {
      id v13 = _ACLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v41 = [v8 accountStore];
        *(_DWORD *)long long buf = 138412802;
        os_signpost_id_t v59 = (os_signpost_id_t)v8;
        __int16 v60 = 2112;
        *(void *)v61 = v41;
        *(_WORD *)&v61[8] = 2112;
        *(void *)v62 = self;
        _os_log_error_impl(&dword_1A57C5000, v13, OS_LOG_TYPE_ERROR, "\"Account %@ associated with store %@, renewing credentials on store %@\"", buf, 0x20u);
      }
    }
  }
  [v8 _setAccountStore:self];
  __int16 v14 = [(ACAccountStore *)self _sanitizeOptionsDictionary:v9];

  double v15 = _ACSignpostLogSystem();
  os_signpost_id_t v16 = _ACSignpostCreate(v15);
  uint64_t v44 = v17;
  os_signpost_id_t v18 = v16;

  __int16 v19 = _ACSignpostLogSystem();
  id v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    uint64_t v21 = [v8 accountType];
    int v22 = [v21 identifier];
    id v23 = [v14 objectForKeyedSubscript:@"ShouldForce"];
    int v24 = [v23 BOOLValue];
    id v25 = [v14 objectForKeyedSubscript:@"ShouldAvoidUI"];
    int v26 = [v25 BOOLValue];
    *(_DWORD *)long long buf = 138544130;
    os_signpost_id_t v59 = (os_signpost_id_t)v22;
    __int16 v60 = 1026;
    *(_DWORD *)v61 = v24;
    *(_WORD *)&v61[4] = 1026;
    *(_DWORD *)&v61[6] = v26;
    *(_WORD *)v62 = 2112;
    *(void *)&v62[2] = v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RenewCredentials", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldForce=%{public,signpost.telemetry:number1,name=ShouldForce}d  ShouldAvoidUI=%{public,signpost.telemetry:number2,name=ShouldAvoidUI}d  enableTelemetry=YES (account: %@)", buf, 0x22u);
  }
  id v27 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v35 = [v8 accountType];
    uint64_t v36 = [v35 identifier];
    uint64_t v37 = [v14 objectForKeyedSubscript:@"ShouldForce"];
    int v38 = [v37 BOOLValue];
    id v39 = [v14 objectForKeyedSubscript:@"ShouldAvoidUI"];
    int v40 = [v39 BOOLValue];
    *(_DWORD *)long long buf = 134219010;
    os_signpost_id_t v59 = v18;
    __int16 v60 = 2114;
    *(void *)v61 = v36;
    *(_WORD *)&v61[8] = 1026;
    *(_DWORD *)v62 = v38;
    *(_WORD *)&v62[4] = 1026;
    *(_DWORD *)&v62[6] = v40;
    __int16 v63 = 2112;
    id v64 = v8;
    _os_log_debug_impl(&dword_1A57C5000, v27, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RenewCredentials  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  ShouldForce=%{public,signpost.telemetry:number1,name=ShouldForce}d  ShouldAvoidUI=%{public,signpost.telemetry:number2,name=ShouldAvoidUI}d  enableTelemetry=YES (account: %@)", buf, 0x2Cu);
  }
  id v28 = _ACLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v59 = (os_signpost_id_t)v8;
    _os_log_impl(&dword_1A57C5000, v28, OS_LOG_TYPE_DEFAULT, "\"Starting credential renewal for account %@.\"", buf, 0xCu);
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke;
  v53[3] = &unk_1E5BCDA88;
  v53[4] = self;
  os_signpost_id_t v55 = v18;
  uint64_t v56 = v44;
  id v29 = v45;
  id v54 = v29;
  id v30 = (void *)MEMORY[0x1A626DA80](v53);
  __int16 v31 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_166;
  v48[3] = &unk_1E5BCDAD8;
  id v32 = v8;
  id v49 = v32;
  id v33 = v14;
  id v50 = v33;
  __int16 v51 = self;
  id v52 = v30;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_3;
  v46[3] = &unk_1E5BCCC68;
  id v34 = v52;
  v46[4] = self;
  id v47 = v34;
  ac_dispatch_remote(v31, v48, v46);

  os_activity_scope_leave(&state);
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v16 = a2;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account credential renewal: %ld - %@.\"", buf, 0x16u);
  }

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_164;
  block[3] = &unk_1E5BCDA60;
  long long v13 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = a2;
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_164(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (a1[8]) {
      id v6 = @"NO";
    }
    else {
      id v6 = @"YES";
    }
    int v12 = 138543362;
    long long v13 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RenewCredentials", "%{public}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v9 = (__CFString *)a1[6];
    uint64_t v10 = a1[8];
    int v12 = 134218498;
    long long v13 = v9;
    if (v10) {
      id v11 = @"NO";
    }
    else {
      id v11 = @"YES";
    }
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RenewCredentials %{public}@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[8], a1[4]);
  }
  return result;
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_166(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2;
  v7[3] = &unk_1E5BCDAB0;
  id v8 = v4;
  id v6 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = v6;
  [a2 renewCredentialsForAccount:v8 options:v5 completion:v7];
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 _clearCachedCredentials];
  uint64_t v8 = *(void *)(a1 + 48);
  int v9 = [v7 intValue];

  id v10 = [*(id *)(a1 + 40) _unsanitizeError:v6];

  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, v9, v10);
}

void __64__ACAccountStore_renewCredentialsForAccount_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 2, v2);
}

- (void)renewCredentialsForAccount:(id)a3 force:(BOOL)a4 reason:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = objc_opt_new();
  long long v13 = [NSNumber numberWithBool:v8];
  [v12 setObject:v13 forKey:@"ShouldForce"];

  if (v10) {
    [v12 setObject:v10 forKey:@"ReasonString"];
  }
  [(ACAccountStore *)self renewCredentialsForAccount:v14 options:v12 completion:v11];
}

- (void)renewCredentialsForAccount:(id)a3 reason:(id)a4 completion:(id)a5
{
}

- (void)renewCredentialsForAccount:(ACAccount *)account completion:(ACAccountStoreCredentialRenewalHandler)completionHandler
{
}

- (void)renewCredentialsForAccount:(id)a3 services:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setObject:v9 forKey:@"Services"];

  [(ACAccountStore *)self renewCredentialsForAccount:v10 options:v11 completion:v8];
}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/migrate-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v20);
  }
  id v9 = [v6 accountStore];
  if (v9)
  {
    id v10 = [v6 accountStore];
    char v11 = [v10 isEqual:self];

    if ((v11 & 1) == 0)
    {
      int v12 = _ACLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [v6 accountStore];
        *(_DWORD *)long long buf = 138412802;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v19;
        __int16 v34 = 2112;
        id v35 = self;
        _os_log_error_impl(&dword_1A57C5000, v12, OS_LOG_TYPE_ERROR, "\"Account %@ associated with store %@, renewing credentials on store %@\"", buf, 0x20u);
      }
    }
  }
  [v6 _setAccountStore:self];
  long long v13 = _ACLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v6;
    _os_log_impl(&dword_1A57C5000, v13, OS_LOG_TYPE_DEFAULT, "\"Starting credential migration for account %@.\"", buf, 0xCu);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke;
  v27[3] = &unk_1E5BCDB28;
  uint8_t v27[4] = self;
  id v14 = v7;
  id v28 = v14;
  double v15 = (void *)MEMORY[0x1A626DA80](v27);
  __int16 v16 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_2;
  v23[3] = &unk_1E5BCDB78;
  id v17 = v6;
  id v24 = v17;
  id v25 = self;
  id v26 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_4;
  v21[3] = &unk_1E5BCCC68;
  id v18 = v26;
  void v21[4] = self;
  id v22 = v18;
  ac_dispatch_remote(v16, v23, v21);

  os_activity_scope_leave(&state);
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    double v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account credential migration: %@ - %@.\"", buf, 0x16u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_167;
    block[3] = &unk_1E5BCDB00;
    id v12 = v8;
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_167(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_3;
  v6[3] = &unk_1E5BCDB50;
  id v7 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = v5;
  [a2 migrateCredentialForAccount:v7 completion:v6];
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _clearCachedCredentials];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 40) _unsanitizeError:v6];

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
}

void __57__ACAccountStore_migrateCredentialForAccount_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)runAccountMigrationPlugins:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/migrate-accounts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Starting account migration plugins\"", buf, 2u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke;
  v15[3] = &unk_1E5BCDB28;
  void v15[4] = self;
  id v7 = v4;
  id v16 = v7;
  id v8 = (void *)MEMORY[0x1A626DA80](v15);
  id v9 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_2;
  v13[3] = &unk_1E5BCDBC8;
  id v14 = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_4;
  v11[3] = &unk_1E5BCCC68;
  id v10 = v14;
  void v11[4] = self;
  id v12 = v10;
  ac_dispatch_remote(v9, v13, v11);

  os_activity_scope_leave(&state);
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    double v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Completed account migration: %@ - %@.\"", buf, 0x16u);
  }

  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_168;
    block[3] = &unk_1E5BCDB00;
    id v12 = v8;
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

uint64_t __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_168(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_3;
  v3[3] = &unk_1E5BCDBA0;
  id v4 = *(id *)(a1 + 32);
  [a2 runAccountMigrationPlugins:v3];
}

uint64_t __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__ACAccountStore_runAccountMigrationPlugins___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)credentialForAccount:(id)a3
{
  return [(ACAccountStore *)self credentialForAccount:a3 error:0];
}

- (id)credentialForAccount:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/credential-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  id v12 = _ACSignpostLogSystem();
  char v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CredentialForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore credentialForAccount:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__0;
  __int16 v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  __int16 v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  double v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  id v31 = &v33;
  p_long long buf = &buf;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke_170;
  v28[3] = &unk_1E5BCD2E8;
  uint8_t v28[4] = self;
  void v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  [*(id *)(*((void *)&buf + 1) + 40) _setOwningAccount:v16];
  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  uint64_t v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&uint64_t v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)int v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "CredentialForAccount", "%@%@", v40, 0x16u);
  }

  id v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    id v26 = v34[5];
    *(_DWORD *)int v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      id v27 = v26;
    }
    else {
      id v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    id v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialForAccount %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

void __45__ACAccountStore_credentialForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ACAccountStore_credentialForAccount_error___block_invoke_2;
  v6[3] = &unk_1E5BCDBF0;
  long long v7 = *(_OWORD *)(a1 + 40);
  [v4 credentialForAccountWithIdentifier:v5 handler:v6];
}

void __45__ACAccountStore_credentialForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }

    os_signpost_id_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = a3;
  }
  else
  {
    os_signpost_id_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

uint64_t __45__ACAccountStore_credentialForAccount_error___block_invoke_170(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4
{
  return [(ACAccountStore *)self credentialForAccount:a3 serviceID:a4 error:0];
}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_signpost_id_t v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v31 = _os_activity_create(&dword_1A57C5000, "accounts/credential-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v31, &state);
  uint64_t v10 = _ACSignpostLogSystem();
  os_signpost_id_t v11 = _ACSignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _ACSignpostLogSystem();
  double v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CredentialForAccountWithServiceID", "%@ : %@", buf, 0x16u);
  }

  id v16 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v54 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CredentialForAccountWithServiceID %@ : %@", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v54 = __Block_byref_object_copy__0;
  os_signpost_id_t v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  uint64_t v38 = 0;
  id v39 = (__CFString **)&v38;
  uint64_t v40 = 0x3032000000;
  os_signpost_id_t v41 = __Block_byref_object_copy__0;
  __int16 v42 = __Block_byref_object_dispose__0;
  id v43 = 0;
  id v17 = [(ACAccountStore *)self remoteAccountStoreSession];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke;
  v33[3] = &unk_1E5BCDC18;
  id v18 = v8;
  id v34 = v18;
  uint64_t v19 = v9;
  uint64_t v35 = v19;
  uint64_t v36 = &v38;
  uint64_t v37 = buf;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_171;
  v32[3] = &unk_1E5BCD2E8;
  v32[4] = self;
  v32[5] = &v38;
  ac_dispatch_remote_sync(v17, v33, v32);

  [*(id *)(*(void *)&buf[8] + 40) _setOwningAccount:v18];
  if (a5) {
    *a5 = v39[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v11, v13);
  uint64_t v21 = _ACSignpostLogSystem();
  id v22 = v21;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    os_signpost_id_t v23 = *(void *)(*(void *)&buf[8] + 40);
    id v24 = v39[5];
    if (*(double *)&v24 == 0.0) {
      *(double *)&id v24 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)uint64_t v45 = 138412546;
    os_signpost_id_t v46 = v23;
    __int16 v47 = 2112;
    double v48 = *(double *)&v24;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v22, OS_SIGNPOST_INTERVAL_END, v11, "CredentialForAccountWithServiceID", "%@%@", v45, 0x16u);
  }

  uint64_t v25 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = *(void *)(*(void *)&buf[8] + 40);
    id v29 = v39[5];
    *(_DWORD *)uint64_t v45 = 134218754;
    os_signpost_id_t v46 = v11;
    __int16 v47 = 2048;
    double v48 = (double)Nanoseconds / 1000000000.0;
    __int16 v49 = 2112;
    uint64_t v50 = v28;
    if (v29) {
      id v30 = v29;
    }
    else {
      id v30 = &stru_1EFA0AB58;
    }
    __int16 v51 = 2112;
    id v52 = v30;
    _os_log_debug_impl(&dword_1A57C5000, v25, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialForAccountWithServiceID %@%@", v45, 0x2Au);
  }

  id v26 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v26;
}

uint64_t __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_2;
  v5[3] = &unk_1E5BCDBF0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [a2 credentialForAccount:v2 serviceID:v3 handler:v5];
}

void __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }

    os_signpost_id_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = a3;
  }
  else
  {
    os_signpost_id_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

uint64_t __55__ACAccountStore_credentialForAccount_serviceID_error___block_invoke_171(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  os_signpost_id_t v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v30 = _os_activity_create(&dword_1A57C5000, "accounts/set-credential-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v30, &state);
  uint64_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = _ACSignpostCreate(v13);
  uint64_t v16 = v15;

  id v17 = _ACSignpostLogSystem();
  id v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    __int16 v47 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SetCredentialForAccountWithServiceID", "%@ -> %@ : %@", buf, 0x20u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218754;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    __int16 v47 = v11;
    LOWORD(v48) = 2112;
    *(void *)((char *)&v48 + 2) = v12;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SetCredentialForAccountWithServiceID %@ -> %@ : %@", buf, 0x2Au);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v47 = __Block_byref_object_copy__0;
  *(void *)&long long v48 = __Block_byref_object_dispose__0;
  *((void *)&v48 + 1) = 0;
  os_signpost_id_t v20 = [(ACAccountStore *)self remoteAccountStoreSession];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke;
  v32[3] = &unk_1E5BCDC40;
  id v21 = v10;
  id v33 = v21;
  id v22 = v11;
  id v34 = v22;
  os_signpost_id_t v23 = v12;
  uint64_t v35 = v23;
  uint64_t v36 = buf;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_172;
  v31[3] = &unk_1E5BCD2E8;
  void v31[4] = self;
  void v31[5] = buf;
  ac_dispatch_remote_sync(v20, v32, v31);

  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40);
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v14, v16);
  uint64_t v25 = _ACSignpostLogSystem();
  id v26 = v25;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    id v27 = *(__CFString **)(*(void *)&buf[8] + 40);
    if (*(double *)&v27 == 0.0) {
      *(double *)&id v27 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)uint64_t v38 = 138412546;
    id v39 = @"COMPLETE";
    __int16 v40 = 2112;
    double v41 = *(double *)&v27;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v26, OS_SIGNPOST_INTERVAL_END, v14, "SetCredentialForAccountWithServiceID", "%@%@", v38, 0x16u);
  }

  uint64_t v28 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v29 = *(__CFString **)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v38 = 134218754;
    id v39 = (__CFString *)v14;
    __int16 v40 = 2048;
    double v41 = (double)Nanoseconds / 1000000000.0;
    id v43 = @"COMPLETE";
    __int16 v42 = 2112;
    if (!v29) {
      id v29 = &stru_1EFA0AB58;
    }
    __int16 v44 = 2112;
    uint64_t v45 = v29;
    _os_log_debug_impl(&dword_1A57C5000, v28, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SetCredentialForAccountWithServiceID %@%@", v38, 0x2Au);
  }

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

uint64_t __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_2;
  v6[3] = &unk_1E5BCD768;
  uint64_t v4 = a1[6];
  void v6[4] = a1[7];
  return [a2 setCredential:v2 forAccount:v3 serviceID:v4 completion:v6];
}

void __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
}

uint64_t __59__ACAccountStore_setCredential_forAccount_serviceID_error___block_invoke_172(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)allCredentialItems
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _os_activity_create(&dword_1A57C5000, "accounts/all-credential-items", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = _ACSignpostLogSystem();
  os_signpost_id_t v5 = _ACSignpostCreate(v4);
  uint64_t v7 = v6;

  id v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AllCredentialItems", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  id v10 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore allCredentialItems]();
  }

  *(void *)long long buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  os_signpost_id_t v11 = [(ACAccountStore *)self remoteAccountStoreSession];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__ACAccountStore_allCredentialItems__block_invoke;
  v20[3] = &unk_1E5BCD4C8;
  void v20[4] = buf;
  ac_dispatch_remote_sync(v11, v20, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v5, v7);
  uint64_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    os_signpost_id_t v15 = *((void *)v22 + 5);
    *(_DWORD *)uint64_t v28 = 138412546;
    os_signpost_id_t v29 = v15;
    __int16 v30 = 2112;
    double v31 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_END, v5, "AllCredentialItems", "%@%@", v28, 0x16u);
  }

  uint64_t v16 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v28 = 134218754;
    uint64_t v19 = *((void *)v22 + 5);
    os_signpost_id_t v29 = v5;
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    uint64_t v35 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v16, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AllCredentialItems %@%@", v28, 0x2Au);
  }

  id v17 = *((id *)v22 + 5);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);

  return v17;
}

uint64_t __36__ACAccountStore_allCredentialItems__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__ACAccountStore_allCredentialItems__block_invoke_2;
  v3[3] = &unk_1E5BCD4A0;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 credentialItemsWithCompletion:v3];
}

void __36__ACAccountStore_allCredentialItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)credentialItemForAccount:(id)a3 serviceName:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/credential-item-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CredentialItemsForAccountWithServiceName", "%@ : %@", buf, 0x16u);
  }

  os_signpost_id_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    __int16 v42 = v7;
    _os_log_debug_impl(&dword_1A57C5000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CredentialItemsForAccountWithServiceName %@ : %@", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy__0;
  id v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  uint64_t v16 = [(ACAccountStore *)self remoteAccountStoreSession];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke;
  v27[3] = &unk_1E5BCDC90;
  id v17 = v6;
  id v28 = v17;
  id v18 = v7;
  __int16 v30 = self;
  double v31 = buf;
  os_signpost_id_t v29 = v18;
  ac_dispatch_remote_sync(v16, v27, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
  os_signpost_id_t v20 = _ACSignpostLogSystem();
  id v21 = v20;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    os_signpost_id_t v22 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)uint64_t v33 = 138412546;
    os_signpost_id_t v34 = v22;
    __int16 v35 = 2112;
    double v36 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v21, OS_SIGNPOST_INTERVAL_END, v10, "CredentialItemsForAccountWithServiceName", "%@%@", v33, 0x16u);
  }

  uint64_t v23 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v33 = 134218754;
    uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
    os_signpost_id_t v34 = v10;
    __int16 v35 = 2048;
    double v36 = (double)Nanoseconds / 1000000000.0;
    __int16 v37 = 2112;
    uint64_t v38 = v26;
    __int16 v39 = 2112;
    __int16 v40 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v23, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CredentialItemsForAccountWithServiceName %@%@", v33, 0x2Au);
  }

  id v24 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);

  return v24;
}

uint64_t __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke_2;
  v5[3] = &unk_1E5BCDC68;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [a2 credentialItemForAccount:v2 serviceName:v3 completion:v5];
}

void __55__ACAccountStore_credentialItemForAccount_serviceName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAccountStore:*(void *)(a1 + 32)];
  }
}

- (void)insertCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/insert-credential-item", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v38 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "InsertCredentialItem", "%@", buf, 0xCu);
  }

  os_signpost_id_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore insertCredentialItem:withCompletionHandler:]();
  }

  if (!v6)
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Credential item must be non-nil" userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v16 = [v6 accountStore];
  if (v16)
  {
    id v17 = [v6 accountStore];
    char v18 = [v17 isEqual:self];

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = _ACLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [v6 accountStore];
        *(_DWORD *)long long buf = 138412802;
        id v38 = v6;
        __int16 v39 = 2112;
        __int16 v40 = v25;
        __int16 v41 = 2112;
        __int16 v42 = self;
        _os_log_error_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_ERROR, "\"Credential item %@ associated with store %@, inserting credential item on store %@\"", buf, 0x20u);
      }
    }
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke;
  v32[3] = &unk_1E5BCD7E0;
  void v32[4] = self;
  os_signpost_id_t v34 = v10;
  uint64_t v35 = v12;
  id v20 = v7;
  id v33 = v20;
  id v21 = (void *)MEMORY[0x1A626DA80](v32);
  [v6 setAccountStore:self];
  os_signpost_id_t v22 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_180;
  v29[3] = &unk_1E5BCCC40;
  id v23 = v6;
  id v30 = v23;
  id v31 = v21;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_3;
  v27[3] = &unk_1E5BCCC68;
  id v24 = v31;
  void v27[4] = self;
  id v28 = v24;
  ac_dispatch_remote(v22, v29, v27);

  os_activity_scope_leave(&state);
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    os_signpost_id_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "InsertCredentialItem", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    os_signpost_id_t v15 = v10;
    uint64_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      uint64_t v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: InsertCredentialItem %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_180(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2_181;
  v4[3] = &unk_1E5BCDCB8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 insertCredentialItem:v3 completion:v4];
}

uint64_t __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_2_181(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__ACAccountStore_insertCredentialItem_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)saveCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/save-credential-item", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Credential item must be non-nil" userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SaveCredentialItem", "%@", buf, 0xCu);
  }

  os_signpost_id_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore saveCredentialItem:withCompletionHandler:]();
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5BCDCE0;
  void v27[4] = self;
  os_signpost_id_t v30 = v10;
  uint64_t v31 = v12;
  id v16 = v7;
  id v29 = v16;
  id v17 = v6;
  id v28 = v17;
  __int16 v18 = (void *)MEMORY[0x1A626DA80](v27);
  if ([v17 isDirty])
  {
    uint64_t v19 = _ACLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore saveCredentialItem:withCompletionHandler:]();
    }

    __int16 v20 = [(ACAccountStore *)self remoteAccountStoreSession];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_182;
    v24[3] = &unk_1E5BCCC40;
    id v25 = v17;
    id v26 = v18;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E5BCCC68;
    void v22[4] = self;
    id v23 = v16;
    ac_dispatch_remote(v20, v24, v22);
  }
  else if (v16)
  {
    (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
  }

  os_activity_scope_leave(&state);
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
    int v14 = _ACSignpostLogSystem();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 56);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v17 = &stru_1EFA0AB58;
      if (v7) {
        id v17 = v7;
      }
      int v23 = 138412546;
      id v24 = @"NO";
      __int16 v25 = 2112;
      double v26 = *(double *)&v17;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SaveCredentialItem", "%@%@", (uint8_t *)&v23, 0x16u);
    }

    __int16 v18 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v21 = *(__CFString **)(a1 + 56);
      int v23 = 134218754;
      id v24 = v21;
      uint64_t v22 = &stru_1EFA0AB58;
      __int16 v25 = 2048;
      double v26 = (double)Nanoseconds / 1000000000.0;
      __int16 v27 = 2112;
      id v28 = @"NO";
      if (v7) {
        uint64_t v22 = v7;
      }
      __int16 v29 = 2112;
      os_signpost_id_t v30 = v22;
      _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveCredentialItem %@%@", (uint8_t *)&v23, 0x2Au);
    }

    uint64_t v19 = *(void *)(a1 + 48);
    if (v19)
    {
      __int16 v20 = [*(id *)(a1 + 32) _unsanitizeError:v7];
      (*(void (**)(uint64_t, void, void *))(v19 + 16))(v19, 0, v20);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setAccountStore:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) setObjectID:v5];
    [*(id *)(a1 + 40) clearDirtyProperties];
    _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
    id v8 = _ACSignpostLogSystem();
    id v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v23 = 138543362;
      id v24 = @"YES";
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SaveCredentialItem", "%{public}@", (uint8_t *)&v23, 0xCu);
    }

    uint64_t v11 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_cold_1();
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, 1, 0);
    }
  }
}

uint64_t __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_182(uint64_t a1, void *a2)
{
  return [a2 saveCredentialItem:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _connectionFailureError];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)removeCredentialItem:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/remove-credential-item", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v6)
  {
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Credential item must be non-nil" userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  uint64_t v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveCredentialItem", "%@", buf, 0xCu);
  }

  os_signpost_id_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore removeCredentialItem:withCompletionHandler:]();
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke;
  v28[3] = &unk_1E5BCD7E0;
  uint8_t v28[4] = self;
  id v16 = v7;
  id v29 = v16;
  os_signpost_id_t v30 = v10;
  uint64_t v31 = v12;
  id v17 = (void *)MEMORY[0x1A626DA80](v28);
  __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_183;
  v25[3] = &unk_1E5BCCC40;
  id v19 = v6;
  id v26 = v19;
  id v20 = v17;
  id v27 = v20;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_2;
  v23[3] = &unk_1E5BCCC68;
  id v21 = v16;
  void v23[4] = self;
  id v24 = v21;
  ac_dispatch_remote(v18, v25, v23);

  os_activity_scope_leave(&state);
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (a1[5])
  {
    id v5 = (__CFString **)(a1 + 6);
    double v6 = (double)_ACSignpostGetNanoseconds(a1[6], a1[7]) / 1000000000.0;
    id v7 = _ACSignpostLogSystem();
    id v8 = v7;
    os_signpost_id_t v9 = a1[6];
    unint64_t v10 = v9 - 1;
    if (v4)
    {
      if (((void **)((char *)&(*v5)->isa + 2) == 0 || v10 < 0xFFFFFFFFFFFFFFFDLL) && os_signpost_enabled(v7))
      {
        int v15 = 138412546;
        id v16 = @"NO";
        __int16 v17 = 2112;
        double v18 = *(double *)&v4;
        _os_signpost_emit_with_name_impl(&dword_1A57C5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCredentialItem", "%@%@", (uint8_t *)&v15, 0x16u);
      }

      uint64_t v11 = _ACSignpostLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v14 = *v5;
        int v15 = 134218754;
        id v16 = v14;
        __int16 v17 = 2048;
        double v18 = v6;
        __int16 v19 = 2112;
        id v20 = @"NO";
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_debug_impl(&dword_1A57C5000, v11, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveCredentialItem %@%@", (uint8_t *)&v15, 0x2Au);
      }

      uint64_t v12 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      if (((void **)((char *)&(*v5)->isa + 2) == 0 || v10 < 0xFFFFFFFFFFFFFFFDLL) && os_signpost_enabled(v7))
      {
        int v15 = 138543362;
        id v16 = @"YES";
        _os_signpost_emit_with_name_impl(&dword_1A57C5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "RemoveCredentialItem", "%{public}@", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v13 = _ACSignpostLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_cold_1();
      }

      uint64_t v12 = *(void (**)(void))(a1[5] + 16);
    }
    v12();
  }
}

uint64_t __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_183(uint64_t a1, void *a2)
{
  return [a2 removeCredentialItem:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) _connectionFailureError];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (id)parentAccountForAccount:(id)a3
{
  return [(ACAccountStore *)self parentAccountForAccount:a3 error:0];
}

- (id)parentAccountForAccount:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/parent-account-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__0;
  id v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = (__CFString **)&v34;
  uint64_t v36 = 0x3032000000;
  __int16 v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  id v8 = [v6 identifier];
  if (v8)
  {
    os_signpost_id_t v9 = _ACSignpostLogSystem();
    os_signpost_id_t v10 = _ACSignpostCreate(v9);
    uint64_t v12 = v11;

    uint64_t v13 = _ACSignpostLogSystem();
    int v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_DWORD *)long long buf = 138412290;
      os_signpost_id_t v48 = (os_signpost_id_t)v6;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ParentAccountForAccount", "%@", buf, 0xCu);
    }

    int v15 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore parentAccountForAccount:error:]();
    }

    id v16 = [(ACAccountStore *)self remoteAccountStoreSession];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke;
    v30[3] = &unk_1E5BCD2C0;
    id v31 = v8;
    __int16 v32 = &v40;
    id v33 = &v34;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke_184;
    v29[3] = &unk_1E5BCD2E8;
    void v29[4] = self;
    void v29[5] = &v34;
    ac_dispatch_remote_sync(v16, v30, v29);

    [(id)v41[5] _setAccountStore:self];
    if (a4) {
      *a4 = v35[5];
    }
    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
    double v18 = _ACSignpostLogSystem();
    __int16 v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      os_signpost_id_t v20 = v41[5];
      __int16 v21 = v35[5];
      if (*(double *)&v21 == 0.0) {
        *(double *)&__int16 v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
      }
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v48 = v20;
      __int16 v49 = 2112;
      double v50 = *(double *)&v21;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v10, "ParentAccountForAccount", "%@%@", buf, 0x16u);
    }

    id v22 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = v41[5];
      id v27 = v35[5];
      *(_DWORD *)long long buf = 134218754;
      os_signpost_id_t v48 = v10;
      __int16 v49 = 2048;
      double v50 = (double)Nanoseconds / 1000000000.0;
      __int16 v51 = 2112;
      uint64_t v52 = v26;
      if (v27) {
        id v28 = v27;
      }
      else {
        id v28 = &stru_1EFA0AB58;
      }
      __int16 v53 = 2112;
      id v54 = v28;
      _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ParentAccountForAccount %@%@", buf, 0x2Au);
    }

    id v23 = (id)v41[5];
  }
  else
  {
    id v24 = _ACLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore parentAccountForAccount:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.accounts" code:6 userInfo:0];
      id v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = 0;
    }
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __48__ACAccountStore_parentAccountForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __48__ACAccountStore_parentAccountForAccount_error___block_invoke_2;
  v4[3] = &unk_1E5BCD298;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 parentAccountForAccountWithIdentifier:v2 handler:v4];
}

void __48__ACAccountStore_parentAccountForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __48__ACAccountStore_parentAccountForAccount_error___block_invoke_184(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)childAccountsForAccount:(id)a3
{
  return [(ACAccountStore *)self childAccountsForAccount:a3 error:0];
}

- (id)childAccountsForAccount:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/child-accounts-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__0;
  uint64_t v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  uint64_t v45 = 0;
  os_signpost_id_t v46 = (__CFString **)&v45;
  uint64_t v47 = 0x3032000000;
  os_signpost_id_t v48 = __Block_byref_object_copy__0;
  __int16 v49 = __Block_byref_object_dispose__0;
  id v50 = 0;
  uint64_t v8 = [v6 identifier];
  if (v8)
  {
    os_signpost_id_t v9 = _ACSignpostLogSystem();
    os_signpost_id_t spid = _ACSignpostCreate(v9);
    uint64_t v11 = v10;

    uint64_t v12 = _ACSignpostLogSystem();
    uint64_t v13 = v12;
    unint64_t v34 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)long long buf = 138412290;
      os_signpost_id_t v59 = (os_signpost_id_t)v6;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ChildAccountForAccounts", "%@", buf, 0xCu);
    }

    int v14 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore childAccountsForAccount:error:]();
    }

    int v15 = [(ACAccountStore *)self remoteAccountStoreSession];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke;
    v41[3] = &unk_1E5BCD2C0;
    id v42 = v8;
    uint64_t v43 = &v51;
    id v44 = &v45;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke_185;
    v40[3] = &unk_1E5BCD2E8;
    uint8_t v40[4] = self;
    v40[5] = &v45;
    ac_dispatch_remote_sync(v15, v41, v40);

    id v16 = v6;
    __int16 v17 = v7;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = (id)v52[5];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v66 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "_setAccountStore:", self, v34);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v66 count:16];
      }
      while (v19);
    }

    id v7 = v17;
    id v6 = v16;
    if (a4) {
      *a4 = v46[5];
    }
    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(spid, v11);
    id v23 = _ACSignpostLogSystem();
    id v24 = v23;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      os_signpost_id_t v25 = v52[5];
      uint64_t v26 = v46[5];
      if (*(double *)&v26 == 0.0) {
        *(double *)&uint64_t v26 = COERCE_DOUBLE(&stru_1EFA0AB58);
      }
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v59 = v25;
      __int16 v60 = 2112;
      double v61 = *(double *)&v26;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v24, OS_SIGNPOST_INTERVAL_END, spid, "ChildAccountForAccounts", "%@%@", buf, 0x16u);
    }

    id v27 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = v52[5];
      __int16 v32 = v46[5];
      *(_DWORD *)long long buf = 134218754;
      os_signpost_id_t v59 = spid;
      __int16 v60 = 2048;
      double v61 = (double)Nanoseconds / 1000000000.0;
      __int16 v62 = 2112;
      uint64_t v63 = v31;
      if (v32) {
        id v33 = v32;
      }
      else {
        id v33 = &stru_1EFA0AB58;
      }
      __int16 v64 = 2112;
      uint64_t v65 = v33;
      _os_log_debug_impl(&dword_1A57C5000, v27, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ChildAccountForAccounts %@%@", buf, 0x2Au);
    }

    id v28 = (id)v52[5];
  }
  else
  {
    id v29 = _ACLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ACAccountStore parentAccountForAccount:error:]();
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.accounts" code:6 userInfo:0];
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  os_activity_scope_leave(&state);

  return v28;
}

uint64_t __48__ACAccountStore_childAccountsForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __48__ACAccountStore_childAccountsForAccount_error___block_invoke_2;
  v4[3] = &unk_1E5BCDD08;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 childAccountsForAccountWithIdentifier:v2 handler:v4];
}

void __48__ACAccountStore_childAccountsForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __48__ACAccountStore_childAccountsForAccount_error___block_invoke_185(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  os_signpost_id_t v9 = [(ACAccountStore *)self accountsWithAccountTypeIdentifiers:v8 error:0];

  id v10 = (void *)MEMORY[0x1E4F28F60];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__ACAccountStore_childAccountsForAccount_withTypeIdentifier___block_invoke;
  v24[3] = &unk_1E5BCDD30;
  id v11 = v6;
  id v25 = v11;
  uint64_t v12 = [v10 predicateWithBlock:v24];
  uint64_t v13 = [v9 filteredArrayUsingPredicate:v12];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "_setAccountStore:", self, (void)v20);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v16);
  }

  return v14;
}

uint64_t __61__ACAccountStore_childAccountsForAccount_withTypeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parentAccountIdentifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)enabledDataclassesForAccount:(id)a3
{
  return [(ACAccountStore *)self enabledDataclassesForAccount:a3 error:0];
}

uint64_t __53__ACAccountStore_enabledDataclassesForAccount_error___block_invoke_189(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)provisionedDataclassesForAccount:(id)a3
{
  return [(ACAccountStore *)self provisionedDataclassesForAccount:a3 error:0];
}

- (id)provisionedDataclassesForAccount:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/provisioned-dataclasses-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  uint64_t v12 = _ACSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ProvisionedDataclassesForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore provisionedDataclassesForAccount:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__0;
  uint64_t v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  unint64_t v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__0;
  long long v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  uint64_t v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  p_long long buf = &buf;
  __int16 v32 = &v33;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_190;
  v28[3] = &unk_1E5BCD2E8;
  uint8_t v28[4] = self;
  void v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  id v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    long long v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&long long v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)uint64_t v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "ProvisionedDataclassesForAccount", "%@%@", v40, 0x16u);
  }

  long long v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = v34[5];
    *(_DWORD *)uint64_t v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      id v27 = v26;
    }
    else {
      id v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    uint64_t v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ProvisionedDataclassesForAccount %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

void __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_2;
  v6[3] = &unk_1E5BCDD58;
  long long v7 = *(_OWORD *)(a1 + 40);
  [v4 provisionedDataclassesForAccountWithIdentifier:v5 handler:v6];
}

void __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __57__ACAccountStore_provisionedDataclassesForAccount_error___block_invoke_190(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)supportedDataclassesForAccountType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/supported-dataclasses-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SupportedDataclassesForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore supportedDataclassesForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "SupportedDataclassesForAccountType", "%@%@", v27, 0x16u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    unint64_t v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SupportedDataclassesForAccountType %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD920;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 supportedDataclassesForAccountType:v2 handler:v4];
}

void __53__ACAccountStore_supportedDataclassesForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)syncableDataclassesForAccountType:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/syncable-dataclasses-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SyncableDataclassesForAccountType", "%@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore syncableDataclassesForAccountType:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke;
  v23[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v24 = v14;
  p_long long buf = &buf;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v27 = 138412546;
    os_signpost_id_t v28 = v18;
    __int16 v29 = 2112;
    double v30 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "SyncableDataclassesForAccountType", "%@%@", v27, 0x16u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v27 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v28 = v7;
    __int16 v29 = 2048;
    double v30 = (double)Nanoseconds / 1000000000.0;
    __int16 v31 = 2112;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    unint64_t v34 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SyncableDataclassesForAccountType %@%@", v27, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke_2;
  v4[3] = &unk_1E5BCD920;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 syncableDataclassesForAccountType:v2 handler:v4];
}

void __52__ACAccountStore_syncableDataclassesForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)displayTypeForAccountWithIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/display-type-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DisplayTypeForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore displayTypeForAccountWithIdentifier:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke;
  v23[3] = &unk_1E5BCDDA8;
  id v14 = v4;
  uint64_t v25 = self;
  p_long long buf = &buf;
  id v24 = v14;
  ac_dispatch_remote_sync(v13, v23, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    os_signpost_id_t v18 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)os_signpost_id_t v28 = 138412546;
    os_signpost_id_t v29 = v18;
    __int16 v30 = 2112;
    double v31 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "DisplayTypeForAccount", "%@%@", v28, 0x16u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)os_signpost_id_t v28 = 134218754;
    uint64_t v22 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v29 = v7;
    __int16 v30 = 2048;
    double v31 = (double)Nanoseconds / 1000000000.0;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    uint64_t v35 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DisplayTypeForAccount %@%@", v28, 0x2Au);
  }

  id v20 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E5BCDD80;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 displayAccountTypeForAccountWithIdentifier:v2 handler:v4];
}

void __54__ACAccountStore_displayTypeForAccountWithIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = _ACLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAccountStore:*(void *)(a1 + 32)];
  }
}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  id v4 = a3;
  long long v5 = _os_activity_create(&dword_1A57C5000, "accounts/preload-dataclass-owners", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PreloadDataclassOwners", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore preloadDataclassOwnersWithCompletion:]();
  }

  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke;
  v19[3] = &unk_1E5BCDE20;
  v19[4] = self;
  os_signpost_id_t v21 = v7;
  uint64_t v22 = v9;
  id v20 = v4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_191;
  v15[3] = &unk_1E5BCDDF8;
  void v15[4] = self;
  os_signpost_id_t v17 = v7;
  uint64_t v18 = v9;
  id v14 = v20;
  id v16 = v14;
  ac_dispatch_remote(v13, v19, v15);

  os_activity_scope_leave(&state);
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BCDDF8;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = v3;
  [a2 preloadDataclassOwnersWithCompletion:v4];
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_3;
  v6[3] = &unk_1E5BCDDD0;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_3(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    long long v6 = (__CFString *)a1[4];
    if (!v6) {
      long long v6 = &stru_1EFA0AB58;
    }
    int v12 = 138412546;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    double v15 = *(double *)&v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PreloadDataclassOwners", "%@%@", (uint8_t *)&v12, 0x16u);
  }

  id v7 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = a1[6];
    id v10 = (__CFString *)a1[4];
    int v12 = 134218754;
    uint64_t v13 = v9;
    uint64_t v11 = &stru_1EFA0AB58;
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    if (v10) {
      uint64_t v11 = v10;
    }
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PreloadDataclassOwners %@%@", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a1[4]);
  }
  return result;
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_191(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 80);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2_192;
  v3[3] = &unk_1E5BCDDD0;
  void v3[4] = v1;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, v3);
}

void __55__ACAccountStore_preloadDataclassOwnersWithCompletion___block_invoke_2_192(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _connectionFailureError];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v4 = _ACSignpostLogSystem();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    id v7 = &stru_1EFA0AB58;
    if (v2) {
      id v7 = v2;
    }
    int v12 = 138412546;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    double v15 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PreloadDataclassOwners", "%@%@", (uint8_t *)&v12, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v12 = 134218754;
    uint64_t v13 = v10;
    uint64_t v11 = &stru_1EFA0AB58;
    __int16 v14 = 2048;
    double v15 = (double)Nanoseconds / 1000000000.0;
    __int16 v16 = 2112;
    uint64_t v17 = 0;
    if (v2) {
      uint64_t v11 = v2;
    }
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: PreloadDataclassOwners %@%@", (uint8_t *)&v12, 0x2Au);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, __CFString *))(v9 + 16))(v9, v2);
  }
}

- (id)dataclassActionsForAccountSave:(id)a3
{
  return [(ACAccountStore *)self dataclassActionsForAccountSave:a3 error:0];
}

- (id)dataclassActionsForAccountSave:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/dataclass-actions-for-account-save", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  int v12 = _ACSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DataclassActionsForAccountSave", "%@", (uint8_t *)&buf, 0xCu);
  }

  __int16 v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore dataclassActionsForAccountSave:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__0;
  uint64_t v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  __int16 v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  double v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  p_long long buf = &buf;
  __int16 v32 = &v33;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_193;
  v28[3] = &unk_1E5BCD2E8;
  uint8_t v28[4] = self;
  void v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  __int16 v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&os_signpost_id_t v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)id v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "DataclassActionsForAccountSave", "%@%@", v40, 0x16u);
  }

  uint64_t v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = v34[5];
    *(_DWORD *)id v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      id v27 = v26;
    }
    else {
      id v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    uint64_t v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DataclassActionsForAccountSave %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2;
  v4[3] = &unk_1E5BCDE48;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 dataclassActionsForAccountSave:v2 completion:v4];
}

void __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_193(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (id)dataclassActionsForAccountDeletion:(id)a3
{
  return [(ACAccountStore *)self dataclassActionsForAccountDeletion:a3 error:0];
}

- (id)dataclassActionsForAccountDeletion:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/dataclass-actions-for-account-deletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  int v12 = _ACSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DataclassActionsForAccountDeletion", "%@", (uint8_t *)&buf, 0xCu);
  }

  __int16 v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore dataclassActionsForAccountDeletion:error:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  id v50 = __Block_byref_object_copy__0;
  uint64_t v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v33 = 0;
  __int16 v34 = (__CFString **)&v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  double v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke;
  v29[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v30 = v16;
  p_long long buf = &buf;
  __int16 v32 = &v33;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_194;
  v28[3] = &unk_1E5BCD2E8;
  uint8_t v28[4] = self;
  void v28[5] = &v33;
  ac_dispatch_remote_sync(v15, v29, v28);

  if (a4) {
    *a4 = v34[5];
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  __int16 v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v21 = v34[5];
    if (*(double *)&v21 == 0.0) {
      *(double *)&os_signpost_id_t v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)id v40 = 138412546;
    os_signpost_id_t v41 = v20;
    __int16 v42 = 2112;
    double v43 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "DataclassActionsForAccountDeletion", "%@%@", v40, 0x16u);
  }

  uint64_t v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
    uint64_t v26 = v34[5];
    *(_DWORD *)id v40 = 134218754;
    os_signpost_id_t v41 = v9;
    __int16 v42 = 2048;
    double v43 = (double)Nanoseconds / 1000000000.0;
    __int16 v44 = 2112;
    uint64_t v45 = v25;
    if (v26) {
      id v27 = v26;
    }
    else {
      id v27 = &stru_1EFA0AB58;
    }
    __int16 v46 = 2112;
    uint64_t v47 = v27;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DataclassActionsForAccountDeletion %@%@", v40, 0x2Au);
  }

  id v23 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_2;
  v4[3] = &unk_1E5BCDE48;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 dataclassActionsForAccountDeletion:v2 completion:v4];
}

void __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __59__ACAccountStore_dataclassActionsForAccountDeletion_error___block_invoke_194(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3
{
  return [(ACAccountStore *)self isPerformingDataclassActionsForAccount:a3 error:0];
}

- (BOOL)isPerformingDataclassActionsForAccount:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A57C5000, "accounts/is-performingdataclass-actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = _ACSignpostLogSystem();
  os_signpost_id_t v9 = _ACSignpostCreate(v8);
  uint64_t v11 = v10;

  int v12 = _ACSignpostLogSystem();
  uint64_t v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "IsPerformingDataclassActions", "%@", (uint8_t *)&buf, 0xCu);
  }

  __int16 v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore isPerformingDataclassActionsForAccount:error:]();
  }

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__0;
  os_signpost_id_t v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  double v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke;
  v28[3] = &unk_1E5BCD2C0;
  id v16 = v6;
  id v29 = v16;
  id v30 = &v32;
  p_long long buf = &buf;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_195;
  v27[3] = &unk_1E5BCD2E8;
  uint8_t v27[4] = self;
  void v27[5] = &buf;
  ac_dispatch_remote_sync(v15, v28, v27);

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v9, v11);
  __int16 v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    if (*((unsigned char *)v33 + 24)) {
      os_signpost_id_t v20 = @"YES";
    }
    else {
      os_signpost_id_t v20 = @"NO";
    }
    os_signpost_id_t v21 = *(__CFString **)(*((void *)&buf + 1) + 40);
    if (*(double *)&v21 == 0.0) {
      *(double *)&os_signpost_id_t v21 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)uint64_t v37 = 138412546;
    os_signpost_id_t v38 = (os_signpost_id_t)v20;
    __int16 v39 = 2112;
    double v40 = *(double *)&v21;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v9, "IsPerformingDataclassActions", "%@%@", v37, 0x16u);
  }

  uint64_t v22 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = @"YES";
    uint64_t v26 = *(__CFString **)(*((void *)&buf + 1) + 40);
    if (!*((unsigned char *)v33 + 24)) {
      uint64_t v25 = @"NO";
    }
    *(_DWORD *)uint64_t v37 = 134218754;
    os_signpost_id_t v38 = v9;
    __int16 v39 = 2048;
    double v40 = (double)Nanoseconds / 1000000000.0;
    __int16 v41 = 2112;
    __int16 v42 = v25;
    if (!v26) {
      uint64_t v26 = &stru_1EFA0AB58;
    }
    __int16 v43 = 2112;
    __int16 v44 = v26;
    _os_log_debug_impl(&dword_1A57C5000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: IsPerformingDataclassActions %@%@", v37, 0x2Au);
  }

  BOOL v23 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v32, 8);
  os_activity_scope_leave(&state);

  return v23;
}

uint64_t __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2;
  v4[3] = &unk_1E5BCDE70;
  long long v5 = *(_OWORD *)(a1 + 40);
  return [a2 isPerformingDataclassActionsForAccount:v2 completion:v4];
}

void __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

uint64_t __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_195(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isTetheredSyncingEnabledForDataclass:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/is-tethered-syncing-enabled-for-dataclasse", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v33 = (os_signpost_id_t)v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "IsThetheredSyncingEnabledForDataclass", "%@", buf, 0xCu);
  }

  int v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore isTetheredSyncingEnabledForDataclass:]();
  }

  uint64_t v27 = 0;
  os_signpost_id_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke;
  v24[3] = &unk_1E5BCD790;
  id v14 = v4;
  id v25 = v14;
  uint64_t v26 = &v27;
  ac_dispatch_remote_sync(v13, v24, 0);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  id v16 = _ACSignpostLogSystem();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (*((unsigned char *)v28 + 24)) {
      __int16 v18 = @"YES";
    }
    else {
      __int16 v18 = @"NO";
    }
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v33 = (os_signpost_id_t)v18;
    __int16 v34 = 2112;
    double v35 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_END, v7, "IsThetheredSyncingEnabledForDataclass", "%@%@", buf, 0x16u);
  }

  uint64_t v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)long long buf = 134218754;
    os_signpost_id_t v33 = v7;
    if (v22) {
      BOOL v23 = @"YES";
    }
    else {
      BOOL v23 = @"NO";
    }
    __int16 v34 = 2048;
    double v35 = (double)Nanoseconds / 1000000000.0;
    __int16 v36 = 2112;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    __int16 v39 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: IsThetheredSyncingEnabledForDataclass %@%@", buf, 0x2Au);
  }

  BOOL v20 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke_2;
  v4[3] = &unk_1E5BCD768;
  uint64_t v2 = *(void *)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [a2 isTetheredSyncingEnabledForDataclass:v2 completion:v4];
}

uint64_t __55__ACAccountStore_isTetheredSyncingEnabledForDataclass___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-enabled-for-dataclasses-of-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The dataclasses argument cannot be nil"];
  }
  if (!v9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accountTypes argument cannot be nil"];
  }
  if (v10)
  {
    int v12 = _ACSignpostLogSystem();
    os_signpost_id_t v13 = _ACSignpostCreate(v12);
    uint64_t v15 = v14;

    id v16 = _ACSignpostLogSystem();
    uint64_t v17 = v16;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v34 = (os_signpost_id_t)v8;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AccountsEnabledForDataclasses", "%@ : %@", buf, 0x16u);
    }

    __int16 v18 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218498;
      os_signpost_id_t v34 = v13;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountsEnabledForDataclasses %@ : %@", buf, 0x20u);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke;
    v28[3] = &unk_1E5BCD6C8;
    void v28[4] = self;
    os_signpost_id_t v30 = v13;
    uint64_t v31 = v15;
    id v29 = v10;
    uint64_t v19 = (void *)MEMORY[0x1A626DA80](v28);
    BOOL v20 = [(ACAccountStore *)self remoteAccountStoreSession];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_203;
    v24[3] = &unk_1E5BCD388;
    id v25 = v8;
    id v26 = v9;
    id v27 = v19;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2_204;
    v22[3] = &unk_1E5BCCC68;
    id v21 = v27;
    void v22[4] = self;
    id v23 = v21;
    ac_dispatch_remote(v20, v24, v22);
  }
  os_activity_scope_leave(&state);
}

void __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2;
  block[3] = &unk_1E5BCD310;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

uint64_t __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[7], a1[8]);
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[7];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = a1[4];
    os_signpost_id_t v7 = (__CFString *)a1[5];
    if (!v7) {
      os_signpost_id_t v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "AccountsEnabledForDataclasses", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = a1[4];
    id v12 = (__CFString *)a1[5];
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsEnabledForDataclasses %@%@", (uint8_t *)&v14, 0x2Au);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_203(void *a1, void *a2)
{
  return [a2 accountIdentifiersEnabledForDataclasses:a1[4] withAccountTypeIdentifiers:a1[5] completion:a1[6]];
}

void __96__ACAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke_2_204(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)clientTokenForAccount:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/client-token-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ClientTokenForAccount", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore clientTokenForAccount:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy__0;
  __int16 v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  int v14 = [(ACAccountStore *)self remoteAccountStoreSession];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke;
  v27[3] = &unk_1E5BCDDA8;
  id v15 = v4;
  id v28 = v15;
  p_long long buf = &buf;
  id v29 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke_3;
  v25[3] = &unk_1E5BCD9C0;
  __int16 v16 = v29;
  id v26 = v16;
  ac_dispatch_remote(v14, v27, v25);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  __int16 v18 = _ACSignpostLogSystem();
  uint64_t v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    os_signpost_id_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v32 = 138412546;
    os_signpost_id_t v33 = v20;
    __int16 v34 = 2112;
    double v35 = COERCE_DOUBLE(&stru_1EFA0AB58);
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_END, v7, "ClientTokenForAccount", "%@%@", v32, 0x16u);
  }

  id v21 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v32 = 134218754;
    uint64_t v24 = *(void *)(*((void *)&buf + 1) + 40);
    os_signpost_id_t v33 = v7;
    __int16 v34 = 2048;
    double v35 = (double)Nanoseconds / 1000000000.0;
    __int16 v36 = 2112;
    uint64_t v37 = v24;
    __int16 v38 = 2112;
    uint64_t v39 = &stru_1EFA0AB58;
    _os_log_debug_impl(&dword_1A57C5000, v21, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ClientTokenForAccount %@%@", v32, 0x2Au);
  }

  id v22 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);

  return v22;
}

void __40__ACAccountStore_clientTokenForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  os_signpost_id_t v5 = [v3 identifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__ACAccountStore_clientTokenForAccount___block_invoke_2;
  v8[3] = &unk_1E5BCDEC0;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v7;
  long long v9 = v7;
  [v4 clientTokenForAccountIdentifier:v5 completion:v8];
}

void __40__ACAccountStore_clientTokenForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __40__ACAccountStore_clientTokenForAccount___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)addClientToken:(id)a3 forAccount:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/add-client-token", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  long long v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  dispatch_semaphore_t v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AddClientTokenForAccount", "%@ -> %@", buf, 0x16u);
  }

  id v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v45 = v7;
    _os_log_debug_impl(&dword_1A57C5000, v15, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AddClientTokenForAccount %@ -> %@", buf, 0x20u);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v45) = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  double v17 = [(ACAccountStore *)self remoteAccountStoreSession];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke;
  v32[3] = &unk_1E5BCDC90;
  id v18 = v6;
  id v33 = v18;
  id v19 = v7;
  id v34 = v19;
  __int16 v36 = buf;
  double v35 = v16;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke_3;
  v30[3] = &unk_1E5BCD9C0;
  os_signpost_id_t v20 = v35;
  uint64_t v31 = v20;
  ac_dispatch_remote(v17, v32, v30);

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v10, v12);
  id v22 = _ACSignpostLogSystem();
  id v23 = v22;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      uint64_t v24 = @"YES";
    }
    else {
      uint64_t v24 = @"NO";
    }
    *(_DWORD *)__int16 v38 = 138543362;
    os_signpost_id_t v39 = (os_signpost_id_t)v24;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v23, OS_SIGNPOST_INTERVAL_END, v10, "AddClientTokenForAccount", "%{public}@", v38, 0xCu);
  }

  id v25 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v28 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    *(_DWORD *)__int16 v38 = 134218498;
    os_signpost_id_t v39 = v10;
    if (v28) {
      id v29 = @"YES";
    }
    else {
      id v29 = @"NO";
    }
    __int16 v40 = 2048;
    double v41 = (double)Nanoseconds / 1000000000.0;
    __int16 v42 = 2114;
    __int16 v43 = v29;
    _os_log_debug_impl(&dword_1A57C5000, v25, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AddClientTokenForAccount %{public}@", v38, 0x20u);
  }

  BOOL v26 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v26;
}

void __44__ACAccountStore_addClientToken_forAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 identifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ACAccountStore_addClientToken_forAccount___block_invoke_2;
  v9[3] = &unk_1E5BCDEE8;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v8;
  long long v10 = v8;
  [v5 addClientToken:v3 forAccountIdentifier:v6 completion:v9];
}

intptr_t __44__ACAccountStore_addClientToken_forAccount___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __44__ACAccountStore_addClientToken_forAccount___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/discover-properties-for-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v12 = [(ACAccountStore *)self _sanitizeOptionsDictionary:v9];

  dispatch_semaphore_t v13 = _ACSignpostLogSystem();
  os_signpost_id_t v14 = _ACSignpostCreate(v13);
  uint64_t v16 = v15;

  double v17 = _ACSignpostLogSystem();
  id v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    id v19 = [v8 accountType];
    os_signpost_id_t v20 = [v19 identifier];
    *(_DWORD *)long long buf = 138543618;
    os_signpost_id_t v44 = (os_signpost_id_t)v20;
    __int16 v45 = 2112;
    id v46 = v8;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "DiscoverProperties", " AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  enableTelemetry=YES (account: %@)", buf, 0x16u);
  }
  id v21 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v28 = [v8 accountType];
    id v29 = [v28 identifier];
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v44 = v14;
    __int16 v45 = 2114;
    id v46 = v29;
    __int16 v47 = 2112;
    id v48 = v8;
    _os_log_debug_impl(&dword_1A57C5000, v21, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: DiscoverProperties  AccountType=%{public,signpost.telemetry:string1,name=AccountType}@  enableTelemetry=YES (account: %@)", buf, 0x20u);
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke;
  v38[3] = &unk_1E5BCDF10;
  os_signpost_id_t v40 = v14;
  uint64_t v41 = v16;
  id v22 = v10;
  uint8_t v38[4] = self;
  id v39 = v22;
  id v23 = (void *)MEMORY[0x1A626DA80](v38);
  uint64_t v24 = [(ACAccountStore *)self longLivedRemoteAccountStoreSession];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_2;
  v33[3] = &unk_1E5BCDAD8;
  id v25 = v8;
  id v34 = v25;
  id v26 = v12;
  id v35 = v26;
  __int16 v36 = self;
  id v37 = v23;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_4;
  v31[3] = &unk_1E5BCCC68;
  id v27 = v37;
  void v31[4] = self;
  id v32 = v27;
  ac_dispatch_remote(v24, v33, v31);

  os_activity_scope_leave(&state);
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v8 = _ACSignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = a1[6];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    uint64_t v11 = @"NO";
    if (!v6) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138543362;
    id v22 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "DiscoverProperties", "%{public}@", buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (__CFString *)a1[6];
    *(_DWORD *)long long buf = 134218498;
    id v22 = v15;
    if (v6) {
      uint64_t v16 = @"NO";
    }
    else {
      uint64_t v16 = @"YES";
    }
    __int16 v23 = 2048;
    double v24 = (double)Nanoseconds / 1000000000.0;
    __int16 v25 = 2114;
    id v26 = v16;
    _os_log_debug_impl(&dword_1A57C5000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: DiscoverProperties %{public}@", buf, 0x20u);
  }

  dispatch_semaphore_t v13 = (void *)a1[5];
  if (v13)
  {
    os_signpost_id_t v14 = *(NSObject **)(a1[4] + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_205;
    block[3] = &unk_1E5BCCBF0;
    id v20 = v13;
    id v18 = v5;
    id v19 = v6;
    dispatch_async(v14, block);
  }
}

uint64_t __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_205(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_3;
  v7[3] = &unk_1E5BCDF38;
  id v6 = *(id *)(a1 + 56);
  void v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  [a2 discoverPropertiesForAccount:v4 options:v5 completion:v7];
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 _unsanitizeError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __66__ACAccountStore_discoverPropertiesForAccount_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_semaphore_t v13 = _os_activity_create(&dword_1A57C5000, "accounts/open-authentication-url", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if (!v11)
  {
    uint64_t v27 = @"Account must be non-nil";
    goto LABEL_11;
  }
  if (!v10)
  {
    uint64_t v27 = @"URL must be non-nil";
LABEL_11:
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v28);
  }
  os_signpost_id_t v14 = _ACSignpostLogSystem();
  os_signpost_id_t v15 = _ACSignpostCreate(v14);
  uint64_t v17 = v16;

  id v18 = _ACSignpostLogSystem();
  id v19 = v18;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v42 = (os_signpost_id_t)v10;
    __int16 v43 = 2112;
    id v44 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "OpenAuthURLForAccount", "%@ -> %@", buf, 0x16u);
  }

  id v20 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v42 = v15;
    __int16 v43 = 2112;
    id v44 = v10;
    __int16 v45 = 2112;
    id v46 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v20, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: OpenAuthURLForAccount %@ -> %@", buf, 0x20u);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke;
  v36[3] = &unk_1E5BCD7E0;
  uint8_t v36[4] = self;
  os_signpost_id_t v38 = v15;
  uint64_t v39 = v17;
  id v21 = v12;
  id v37 = v21;
  id v22 = (void *)MEMORY[0x1A626DA80](v36);
  __int16 v23 = [(ACAccountStore *)self remoteAccountStoreSession];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_209;
  v31[3] = &unk_1E5BCD8A8;
  id v24 = v10;
  id v32 = v24;
  id v25 = v11;
  id v33 = v25;
  BOOL v35 = a5;
  id v34 = v22;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2_210;
  v29[3] = &unk_1E5BCCC68;
  id v26 = v34;
  void v29[4] = self;
  id v30 = v26;
  ac_dispatch_remote(v23, v31, v29);

  os_activity_scope_leave(&state);
}

void __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    os_signpost_id_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "OpenAuthURLForAccount", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    os_signpost_id_t v15 = v10;
    dispatch_semaphore_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      dispatch_semaphore_t v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: OpenAuthURLForAccount %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_209(uint64_t a1, void *a2)
{
  return [a2 openAuthenticationURL:*(void *)(a1 + 32) forAccount:*(void *)(a1 + 40) shouldConfirm:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

void __76__ACAccountStore_openAuthenticationURL_forAccount_shouldConfirm_completion___block_invoke_2_210(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  BOOL v34 = a6;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v11 = (__CFString *)a3;
  char v12 = (__CFString *)a4;
  dispatch_semaphore_t v13 = (__CFString *)a5;
  id v14 = a7;
  os_signpost_id_t v15 = _os_activity_create(&dword_1A57C5000, "accounts/open-authentication-url-with-info", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  if (!v11)
  {
    id v32 = @"Account must be non-nil";
    goto LABEL_17;
  }
  if (!v12)
  {
    id v32 = @"Auth delegate class name must be non-nil";
    goto LABEL_17;
  }
  if (!v13)
  {
    id v32 = @"Bundle path must be non-nil";
LABEL_17:
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
    objc_exception_throw(v33);
  }
  __int16 v16 = _ACSignpostLogSystem();
  os_signpost_id_t v17 = _ACSignpostCreate(v16);
  uint64_t v19 = v18;

  __int16 v20 = _ACSignpostLogSystem();
  id v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    uint64_t v22 = @"NO";
    *(_DWORD *)long long buf = 138413058;
    os_signpost_id_t v49 = (os_signpost_id_t)v12;
    if (v34) {
      uint64_t v22 = @"YES";
    }
    __int16 v50 = 2112;
    uint64_t v51 = v13;
    __int16 v52 = 2112;
    uint64_t v53 = v22;
    __int16 v54 = 2112;
    uint64_t v55 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "OpenAuthURLForAccount", "%@,%@,%@ -> %@", buf, 0x2Au);
  }

  __int16 v23 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = @"NO";
    *(_DWORD *)long long buf = 134219010;
    os_signpost_id_t v49 = v17;
    if (v34) {
      uint64_t v31 = @"YES";
    }
    __int16 v50 = 2112;
    uint64_t v51 = v12;
    __int16 v52 = 2112;
    uint64_t v53 = v13;
    __int16 v54 = 2112;
    uint64_t v55 = v31;
    __int16 v56 = 2112;
    uint64_t v57 = v11;
    _os_log_debug_impl(&dword_1A57C5000, v23, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: OpenAuthURLForAccount %@,%@,%@ -> %@", buf, 0x34u);
  }

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke;
  v43[3] = &unk_1E5BCDF88;
  v43[4] = self;
  os_signpost_id_t v45 = v17;
  uint64_t v46 = v19;
  id v24 = v14;
  id v44 = v24;
  id v25 = (void *)MEMORY[0x1A626DA80](v43);
  id v26 = [(ACAccountStore *)self remoteAccountStoreSession];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_218;
  v37[3] = &unk_1E5BCDFB0;
  uint64_t v27 = v11;
  os_signpost_id_t v38 = v27;
  id v28 = v12;
  uint64_t v39 = v28;
  id v29 = v13;
  os_signpost_id_t v40 = v29;
  BOOL v42 = v34;
  id v41 = v25;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2_219;
  v35[3] = &unk_1E5BCCC68;
  id v30 = v41;
  void v35[4] = self;
  id v36 = v30;
  ac_dispatch_remote(v26, v37, v35);

  os_activity_scope_leave(&state);
}

void __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2;
  v13[3] = &unk_1E5BCDF60;
  long long v17 = *(_OWORD *)(a1 + 48);
  char v18 = a2;
  id v14 = v8;
  id v10 = *(id *)(a1 + 40);
  id v15 = v7;
  id v16 = v10;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v9, v13);
}

uint64_t __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 72)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "OpenAuthURLForAccount", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 56);
    id v11 = @"YES";
    id v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 72)) {
      id v11 = @"NO";
    }
    int v14 = 134218754;
    id v15 = v10;
    dispatch_semaphore_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      dispatch_semaphore_t v13 = v12;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: OpenAuthURLForAccount %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_218(uint64_t a1, void *a2)
{
  return [a2 openAuthenticationURLForAccount:*(void *)(a1 + 32) withDelegateClassName:*(void *)(a1 + 40) fromBundleAtPath:*(void *)(a1 + 48) shouldConfirm:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

void __114__ACAccountStore_openAuthenticationURLForAccount_withDelegateClassName_fromBundleAtPath_shouldConfirm_completion___block_invoke_2_219(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3
{
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4
{
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A57C5000, "accounts/paired-update-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  __int16 v16 = _ACSignpostLogSystem();
  double v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v33 = (os_signpost_id_t)v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NotifyRemoteOfModifiedAccount", "%@ (%@)", buf, 0x16u);
  }

  __int16 v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v33 = v13;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: NotifyRemoteOfModifiedAccount %@ (%@)", buf, 0x20u);
  }

  uint64_t v19 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke;
  v24[3] = &unk_1E5BCD5D8;
  id v20 = v8;
  id v25 = v20;
  id v21 = v9;
  id v26 = v21;
  uint64_t v27 = self;
  os_signpost_id_t v29 = v13;
  uint64_t v30 = v15;
  id v22 = v10;
  id v28 = v22;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_220;
  v23[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  void v23[4] = v13;
  void v23[5] = v15;
  ac_dispatch_remote(v19, v24, v23);

  os_activity_scope_leave(&state);
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_2;
  v6[3] = &unk_1E5BCD7E0;
  os_signpost_id_t v5 = *(void **)(a1 + 56);
  void v6[4] = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = v5;
  [a2 notifyRemoteDevicesOfModifiedAccount:v3 withChangeType:@"changed" options:v4 completion:v6];
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = a3;
  id v6 = _ACLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Notified successfully!\"", (uint8_t *)&v19, 2u);
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v9 = _ACSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v12 = @"NO";
    if (a2) {
      id v12 = @"YES";
    }
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    if (v5) {
      os_signpost_id_t v13 = v5;
    }
    int v19 = 138412546;
    id v20 = v12;
    __int16 v21 = 2112;
    double v22 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NotifyRemoteOfModifiedAccount", "%@%@", (uint8_t *)&v19, 0x16u);
  }

  uint64_t v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = (__CFString *)a1[6];
    double v17 = @"NO";
    if (a2) {
      double v17 = @"YES";
    }
    int v19 = 134218754;
    id v20 = v16;
    __int16 v18 = &stru_1EFA0AB58;
    __int16 v21 = 2048;
    double v22 = (double)Nanoseconds / 1000000000.0;
    __int16 v23 = 2112;
    id v24 = v17;
    if (v5) {
      __int16 v18 = v5;
    }
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_debug_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfModifiedAccount %@%@", (uint8_t *)&v19, 0x2Au);
  }

  uint64_t v15 = a1[5];
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);
  }
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_220(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_220_cold_1();
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 32), *(void *)(a1 + 40));
  id v6 = _ACSignpostLogSystem();
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    id v9 = &stru_1EFA0AB58;
    if (v3) {
      id v9 = v3;
    }
    int v13 = 138412546;
    uint64_t v14 = @"NO";
    __int16 v15 = 2112;
    double v16 = *(double *)&v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v7, OS_SIGNPOST_INTERVAL_END, v8, "NotifyRemoteOfModifiedAccount", "%@%@", (uint8_t *)&v13, 0x16u);
  }

  id v10 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_signpost_id_t v11 = *(__CFString **)(a1 + 32);
    int v13 = 134218754;
    uint64_t v14 = v11;
    id v12 = &stru_1EFA0AB58;
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    __int16 v17 = 2112;
    __int16 v18 = @"NO";
    if (v3) {
      id v12 = v3;
    }
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_debug_impl(&dword_1A57C5000, v10, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfModifiedAccount %@%@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3
{
}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4
{
}

- (void)notifyRemoteDevicesOfUpdatedCredentials:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/notify-remote-updated-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  double v16 = _ACSignpostLogSystem();
  __int16 v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v33 = (os_signpost_id_t)v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "NotifyRemoteOfUpdatedCredentials", "%@ (%@)", buf, 0x16u);
  }

  __int16 v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v33 = v13;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: NotifyRemoteOfUpdatedCredentials %@ (%@)", buf, 0x20u);
  }

  __int16 v19 = [(ACAccountStore *)self remoteAccountStoreSession];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke;
  v24[3] = &unk_1E5BCD5D8;
  id v20 = v8;
  id v25 = v20;
  id v21 = v9;
  id v26 = v21;
  uint64_t v27 = self;
  os_signpost_id_t v29 = v13;
  uint64_t v30 = v15;
  id v22 = v10;
  id v28 = v22;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_221;
  v23[3] = &__block_descriptor_48_e17_v16__0__NSError_8l;
  void v23[4] = v13;
  void v23[5] = v15;
  ac_dispatch_remote(v19, v24, v23);

  os_activity_scope_leave(&state);
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_2;
  v6[3] = &unk_1E5BCD7E0;
  os_signpost_id_t v5 = *(void **)(a1 + 56);
  void v6[4] = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 64);
  id v7 = v5;
  [a2 notifyRemoteDevicesOfModifiedAccount:v3 withChangeType:@"auth" options:v4 completion:v6];
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = a3;
  id v6 = _ACLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Notified of credential update successfully!\"", (uint8_t *)&v19, 2u);
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(a1[6], a1[7]);
  id v9 = _ACSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v12 = @"NO";
    if (a2) {
      id v12 = @"YES";
    }
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    if (v5) {
      os_signpost_id_t v13 = v5;
    }
    int v19 = 138412546;
    id v20 = v12;
    __int16 v21 = 2112;
    double v22 = *(double *)&v13;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_END, v11, "NotifyRemoteOfUpdatedCredentials", "%@%@", (uint8_t *)&v19, 0x16u);
  }

  uint64_t v14 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    double v16 = (__CFString *)a1[6];
    __int16 v17 = @"NO";
    if (a2) {
      __int16 v17 = @"YES";
    }
    int v19 = 134218754;
    id v20 = v16;
    __int16 v18 = &stru_1EFA0AB58;
    __int16 v21 = 2048;
    double v22 = (double)Nanoseconds / 1000000000.0;
    __int16 v23 = 2112;
    id v24 = v17;
    if (v5) {
      __int16 v18 = v5;
    }
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_debug_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfUpdatedCredentials %@%@", (uint8_t *)&v19, 0x2Au);
  }

  uint64_t v15 = a1[5];
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v15 + 16))(v15, a2, v5);
  }
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = _ACLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_221_cold_1();
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 32), *(void *)(a1 + 40));
  id v6 = _ACSignpostLogSystem();
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 32);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    id v9 = &stru_1EFA0AB58;
    if (v3) {
      id v9 = v3;
    }
    int v13 = 138412546;
    uint64_t v14 = @"NO";
    __int16 v15 = 2112;
    double v16 = *(double *)&v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v7, OS_SIGNPOST_INTERVAL_END, v8, "NotifyRemoteOfUpdatedCredentials", "%@%@", (uint8_t *)&v13, 0x16u);
  }

  id v10 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_signpost_id_t v11 = *(__CFString **)(a1 + 32);
    int v13 = 134218754;
    uint64_t v14 = v11;
    id v12 = &stru_1EFA0AB58;
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    __int16 v17 = 2112;
    __int16 v18 = @"NO";
    if (v3) {
      id v12 = v3;
    }
    __int16 v19 = 2112;
    id v20 = v12;
    _os_log_debug_impl(&dword_1A57C5000, v10, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: NotifyRemoteOfUpdatedCredentials %@%@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = _os_activity_create(&dword_1A57C5000, "accounts/paired-save-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (!v8)
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Account must be non-nil" userInfo:0];
    objc_exception_throw(v25);
  }
  id v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  double v16 = _ACSignpostLogSystem();
  __int16 v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v38 = (os_signpost_id_t)v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SaveAccountToPairedDevice", "%@ (%@)", buf, 0x16u);
  }

  __int16 v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v38 = v13;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 2112;
    id v42 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: SaveAccountToPairedDevice %@ (%@)", buf, 0x20u);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke;
  v32[3] = &unk_1E5BCD7E0;
  void v32[4] = self;
  os_signpost_id_t v34 = v13;
  uint64_t v35 = v15;
  id v19 = v10;
  id v33 = v19;
  id v20 = (void *)MEMORY[0x1A626DA80](v32);
  uint64_t v21 = [(ACAccountStore *)self remoteAccountStoreSession];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_222;
  v28[3] = &unk_1E5BCD388;
  id v22 = v8;
  id v29 = v22;
  id v23 = v9;
  id v30 = v23;
  id v31 = v20;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_224;
  v26[3] = &unk_1E5BCCC68;
  id v24 = v31;
  v26[4] = self;
  id v27 = v24;
  ac_dispatch_remote(v21, v28, v26);

  os_activity_scope_leave(&state);
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "SaveAccountToPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      os_signpost_id_t v13 = v12;
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveAccountToPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_222(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2_223;
  v5[3] = &unk_1E5BCDBA0;
  id v6 = *(id *)(a1 + 48);
  [a2 saveAccount:v3 toPairedDeviceWithOptions:v4 completion:v5];
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_2_223(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_signpost_id_t v5 = _ACLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Notified successfully!\"", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__ACAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke_224(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)removeAccountsFromPairedDeviceWithCompletion:(id)a3
{
}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A57C5000, "accounts/paired-remove-accounts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  os_signpost_id_t v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RemoveAccountsFromPairedDevice", "(%@)", buf, 0xCu);
  }

  uint64_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore removeAccountsFromPairedDeviceWithOptions:completion:]();
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke;
  v26[3] = &unk_1E5BCD7E0;
  v26[4] = self;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  double v17 = (void *)MEMORY[0x1A626DA80](v26);
  __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_225;
  v23[3] = &unk_1E5BCCC40;
  id v19 = v6;
  id v24 = v19;
  id v25 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_227;
  v21[3] = &unk_1E5BCCC68;
  id v20 = v25;
  void v21[4] = self;
  id v22 = v20;
  ac_dispatch_remote(v18, v23, v21);

  os_activity_scope_leave(&state);
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccountsFromPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      os_signpost_id_t v13 = v12;
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountsFromPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_225(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2_226;
  v4[3] = &unk_1E5BCDBA0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 removeAccountsFromPairedDeviceWithOptions:v3 completion:v4];
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_2_226(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _ACLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Removed successfully!\"", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__ACAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke_227(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)removeAccountFromPairedDevice:(id)a3 withCompletion:(id)a4
{
}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = _os_activity_create(&dword_1A57C5000, "accounts/paired-remove-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  char v12 = _ACSignpostLogSystem();
  os_signpost_id_t v13 = _ACSignpostCreate(v12);
  uint64_t v15 = v14;

  __int16 v16 = _ACSignpostLogSystem();
  double v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v37 = (os_signpost_id_t)v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoveAccountFromPairedDevice", "%@ (%@)", buf, 0x16u);
  }

  __int16 v18 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    os_signpost_id_t v37 = v13;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    _os_log_debug_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: RemoveAccountFromPairedDevice %@ (%@)", buf, 0x20u);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke;
  v31[3] = &unk_1E5BCD7E0;
  void v31[4] = self;
  os_signpost_id_t v33 = v13;
  uint64_t v34 = v15;
  id v19 = v10;
  id v32 = v19;
  __int16 v20 = (void *)MEMORY[0x1A626DA80](v31);
  uint64_t v21 = [(ACAccountStore *)self remoteAccountStoreSession];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_228;
  v27[3] = &unk_1E5BCD388;
  id v22 = v8;
  id v28 = v22;
  id v23 = v9;
  id v29 = v23;
  id v30 = v20;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_230;
  v25[3] = &unk_1E5BCCC68;
  id v24 = v30;
  void v25[4] = self;
  id v26 = v24;
  ac_dispatch_remote(v21, v27, v25);

  os_activity_scope_leave(&state);
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveAccountFromPairedDevice", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  id v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      os_signpost_id_t v13 = v12;
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveAccountFromPairedDevice %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2_229;
  v5[3] = &unk_1E5BCDBA0;
  id v6 = *(id *)(a1 + 48);
  [a2 removeAccountFromPairedDevice:v3 withOptions:v4 completion:v5];
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_2_229(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_signpost_id_t v5 = _ACLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Removed successfully!\"", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__ACAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke_230(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)triggerKeychainMigrationIfNecessary:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/trigger-keychain-migration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  long long v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TriggerMigration", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  char v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore triggerKeychainMigrationIfNecessary:]();
  }

  uint64_t v32 = 0;
  os_signpost_id_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)long long buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__0;
  id v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  os_signpost_id_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke;
  v25[3] = &unk_1E5BCDFF8;
  void v25[4] = &v32;
  void v25[5] = buf;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_231;
  v24[3] = &unk_1E5BCD6A0;
  void v24[5] = &v32;
  v24[6] = buf;
  void v24[4] = self;
  ac_dispatch_remote_sync(v13, v25, v24);

  if (a3) {
    *a3 = *((id *)v27 + 5);
  }
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v7, v9);
  uint64_t v15 = _ACSignpostLogSystem();
  __int16 v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    if (*((unsigned char *)v33 + 24)) {
      double v17 = @"YES";
    }
    else {
      double v17 = @"NO";
    }
    __int16 v18 = *((__CFString **)v27 + 5);
    if (*(double *)&v18 == 0.0) {
      *(double *)&__int16 v18 = COERCE_DOUBLE(&stru_1EFA0AB58);
    }
    *(_DWORD *)os_signpost_id_t v37 = 138412546;
    os_signpost_id_t v38 = (os_signpost_id_t)v17;
    __int16 v39 = 2112;
    double v40 = *(double *)&v18;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v16, OS_SIGNPOST_INTERVAL_END, v7, "TriggerMigration", "%@%@", v37, 0x16u);
  }

  id v19 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = @"YES";
    id v23 = (__CFString *)*((void *)v27 + 5);
    if (!*((unsigned char *)v33 + 24)) {
      uint64_t v22 = @"NO";
    }
    *(_DWORD *)os_signpost_id_t v37 = 134218754;
    os_signpost_id_t v38 = v7;
    __int16 v39 = 2048;
    double v40 = (double)Nanoseconds / 1000000000.0;
    __int16 v41 = 2112;
    uint64_t v42 = v22;
    if (!v23) {
      id v23 = &stru_1EFA0AB58;
    }
    __int16 v43 = 2112;
    id v44 = v23;
    _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: TriggerMigration %@%@", v37, 0x2Au);
  }

  BOOL v20 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v32, 8);
  os_activity_scope_leave(&state);

  return v20;
}

uint64_t __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_2;
  v3[3] = &unk_1E5BCDE70;
  long long v4 = *(_OWORD *)(a1 + 32);
  return [a2 triggerKeychainMigrationIfNecessary:v3];
}

void __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _ACLogSystem();
  os_signpost_id_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Keychain migrated successfully!\"", v10, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

uint64_t __54__ACAccountStore_triggerKeychainMigrationIfNecessary___block_invoke_231(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

void __49__ACAccountStore__obsoleteAccountTypeIDsToRemove__block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  if (!_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs)
  {
    v2[0] = @"com.apple.twitter";
    v2[1] = @"com.apple.facebook";
    v2[2] = @"com.apple.sinaweibo";
    v2[3] = @"com.apple.account.tencentweibo";
    v2[4] = @"com.apple.flickr";
    v2[5] = @"com.apple.vimeo";
    v2[6] = @"com.apple.linkedin";
    v2[7] = @"com.apple.account.osxserver";
    uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
    uint64_t v1 = (void *)_obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs;
    _obsoleteAccountTypeIDsToRemove__obsolteAccountTypeIDs = v0;
  }
}

- (void)removeObsoleteAccounts:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/remove-obsolete-accounts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  long long v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RemoveObsoleteAccounts", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  char v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore removeObsoleteAccounts:]();
  }

  os_signpost_id_t v13 = +[ACAccountStore _obsoleteAccountTypeIDsToRemove];
  int v14 = _ACLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1A57C5000, v14, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete accounts with type identifiers %@\"", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke;
  v16[3] = &unk_1E5BCD6C8;
  v16[4] = self;
  os_signpost_id_t v18 = v7;
  uint64_t v19 = v9;
  id v15 = v4;
  id v17 = v15;
  [(ACAccountStore *)self accountsWithAccountTypeIdentifiers:v13 completion:v16];

  os_activity_scope_leave(&state);
}

void __41__ACAccountStore_removeObsoleteAccounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[a2 mutableCopy];
  os_signpost_id_t v7 = _ACLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    os_signpost_id_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Fetched obsolete accounts %@ error %@\"", buf, 0x16u);
  }

  uint64_t v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke_234;
  v9[3] = &unk_1E5BCD7E0;
  void v9[4] = v8;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v8 _removeObsoleteAccountsInternal:v6 completion:v9];
}

void __41__ACAccountStore_removeObsoleteAccounts___block_invoke_234(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ACAccountStore_removeObsoleteAccounts___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __41__ACAccountStore_removeObsoleteAccounts___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RemoveObsoleteAccounts", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    id v15 = v10;
    os_signpost_id_t v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      os_signpost_id_t v13 = v12;
    }
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveObsoleteAccounts %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_removeObsoleteAccountsInternal:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 firstObject];
  if (v8)
  {
    id v29 = 0;
    id v9 = [(ACAccountStore *)self dataclassActionsForAccountDeletion:v8 error:&v29];
    id v10 = v29;
    long long v11 = _ACLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_1A57C5000, v11, OS_LOG_TYPE_DEFAULT, "\"Gathered account %@ potential dataclass actions for deletion %@ error %@\"", buf, 0x20u);
    }
    uint64_t v19 = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke;
    v26[3] = &unk_1E5BCE020;
    id v13 = v12;
    id v27 = v13;
    id v14 = v8;
    id v28 = v14;
    [v9 enumerateKeysAndObjectsUsingBlock:v26];
    id v15 = [v14 accountType];
    __int16 v16 = [v15 identifier];
    int v17 = [v16 isEqualToString:@"com.apple.account.osxserver"];

    if (v17) {
      [(ACAccountStore *)self _removeObsoleteOSXServerAccountForiOS:v14];
    }
    __int16 v18 = _ACLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_1A57C5000, v18, OS_LOG_TYPE_DEFAULT, "\"Will remove obsolete account %@ with dataclass actions %@\"", buf, 0x16u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_236;
    v20[3] = &unk_1E5BCE048;
    id v21 = v14;
    id v22 = 0;
    uint64_t v23 = self;
    id v24 = v6;
    id v25 = v7;
    [(ACAccountStore *)self removeAccount:v21 withDataclassActions:v13 completion:v20];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if (objc_msgSend(v11, "type", (void)v13) == 3) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (!v12) {
      goto LABEL_12;
    }
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v5];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v12 = _ACLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_cold_1();
    }
  }
}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_236(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _ACLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [NSNumber numberWithBool:a2];
    *(_DWORD *)long long buf = 138412802;
    id v30 = v7;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Did remove obsolete account %@ with success %@ error %@\"", buf, 0x20u);
  }
  if (a2)
  {
    id v22 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          long long v15 = *(void **)(a1 + 48);
          id v23 = 0;
          int v16 = [v15 saveVerifiedAccount:v14 error:&v23];
          id v17 = v23;
          uint64_t v18 = _ACLogSystem();
          uint64_t v19 = v18;
          if (v16)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v20 = [v14 accountType];
              id v21 = [v20 identifier];
              *(_DWORD *)long long buf = 138412290;
              id v30 = v21;
              _os_log_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEFAULT, "\"Successfully saved macOSServer child account: %@\"", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v30 = v17;
            _os_log_error_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_ERROR, "\"Failed to save macOSServer child account. Error: %@\"", buf, 0xCu);
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v5 = v22;
  }
  [*(id *)(a1 + 56) removeObjectAtIndex:0];
  [*(id *)(a1 + 48) _removeObsoleteAccountsInternal:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (id)_removeObsoleteOSXServerAccountForMacOS:(id)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v84 = (id)objc_opt_new();
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = [v3 childAccounts];
  uint64_t v88 = [obj countByEnumeratingWithState:&v114 objects:v129 count:16];
  if (v88)
  {
    uint64_t v86 = *(void *)v115;
    v90 = v3;
    do
    {
      for (uint64_t i = 0; i != v88; uint64_t i = v60 + 1)
      {
        if (*(void *)v115 != v86) {
          objc_enumerationMutation(obj);
        }
        v93 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        id v5 = [v93 objectForKeyedSubscript:@"Hostname"];
        id v6 = v5;
        uint64_t v89 = i;
        if (v5)
        {
          id v7 = v5;
        }
        else
        {
          id v7 = [v3 objectForKeyedSubscript:@"Hostname"];
        }
        uint64_t v8 = v7;

        id v9 = [v93 accountType];
        uint64_t v10 = [(ACAccountStore *)self accountsWithAccountType:v9];

        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v110 objects:v128 count:16];
        v91 = v8;
        id v92 = v11;
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v111;
          while (2)
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v111 != v14) {
                objc_enumerationMutation(v11);
              }
              int v16 = *(void **)(*((void *)&v110 + 1) + 8 * v15);
              id v17 = [v16 parentAccount];
              if (v17
                || ([v16 objectForKeyedSubscript:@"Hostname"],
                    id v17 = objc_claimAutoreleasedReturnValue(),
                    [v17 compare:v8 options:1]))
              {
              }
              else
              {
                uint64_t v18 = [v16 username];
                uint64_t v19 = [v93 username];
                if (![v18 compare:v19 options:1])
                {

                  uint64_t v8 = v91;
                  id v11 = v92;
LABEL_41:
                  __int16 v52 = _ACLogSystem();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                  {
                    os_signpost_id_t v59 = [v16 identifier];
                    *(_DWORD *)long long buf = 138412290;
                    v127 = v59;
                    _os_log_impl(&dword_1A57C5000, v52, OS_LOG_TYPE_DEFAULT, "\"Found a matching existing account %@\"", buf, 0xCu);
                  }
                  long long v24 = v11;
                  id v3 = v90;
                  uint64_t v60 = v89;
                  goto LABEL_71;
                }
                __int16 v20 = [v16 username];
                id v21 = [v90 qualifiedUsername];
                uint64_t v22 = [v20 compare:v21 options:1];

                uint64_t v8 = v91;
                id v11 = v92;
                if (!v22) {
                  goto LABEL_41;
                }
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v23 = [v11 countByEnumeratingWithState:&v110 objects:v128 count:16];
            uint64_t v13 = v23;
            if (v23) {
              continue;
            }
            break;
          }
        }

        long long v24 = [v93 portableCopy];
        [v24 setAuthenticationType:0];
        [v24 setParentAccount:0];
        long long v25 = [MEMORY[0x1E4F29128] UUID];
        long long v26 = [v25 UUIDString];
        [v24 setIdentifier:v26];

        id v3 = v90;
        long long v27 = [v90 internalCredential];
        id v28 = (void *)[v27 copy];
        [v24 setCredential:v28];

        id v29 = [v90 internalCredential];
        id v30 = [v29 credentialType];
        __int16 v31 = (void *)[v30 copy];
        [v24 setCredentialType:v31];

        __int16 v32 = [v90 authenticationType];
        __int16 v33 = (void *)[v32 copy];
        [v24 setAuthenticationType:v33];

        objc_msgSend(v24, "setSupportsAuthentication:", objc_msgSend(v90, "supportsAuthentication"));
        objc_msgSend(v24, "setAuthenticated:", objc_msgSend(v90, "isAuthenticated"));
        id v34 = [v90 username];
        uint64_t v35 = (void *)[v34 copy];
        [v24 setUsername:v35];

        uint64_t v36 = [v90 accountDescription];
        os_signpost_id_t v37 = (void *)[v36 copy];
        [v24 setAccountDescription:v37];

        os_signpost_id_t v38 = NSString;
        __int16 v39 = [v90 owningBundleID];
        double v40 = [v38 stringWithFormat:@"%@.migrator", v39];
        [v24 setOwningBundleID:v40];

        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        __int16 v41 = [v93 enabledDataclasses];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v106 objects:v125 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v107;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v107 != v44) {
                objc_enumerationMutation(v41);
              }
              [v24 setEnabled:1 forDataclass:*(void *)(*((void *)&v106 + 1) + 8 * j)];
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v106 objects:v125 count:16];
          }
          while (v43);
        }

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        uint64_t v46 = [v93 provisionedDataclasses];
        uint64_t v47 = [v46 countByEnumeratingWithState:&v102 objects:v124 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v103;
          do
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v103 != v49) {
                objc_enumerationMutation(v46);
              }
              [v24 setProvisioned:1 forDataclass:*(void *)(*((void *)&v102 + 1) + 8 * k)];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v102 objects:v124 count:16];
          }
          while (v48);
        }

        uint64_t v51 = [v93 accountType];
        __int16 v52 = [v51 identifier];

        if ([v52 isEqualToString:@"com.apple.account.IMAP"])
        {
          v122[0] = @"ACPropertyFullName";
          v122[1] = @"EmailAliases";
          v123[0] = @"ACPropertyFullName";
          v123[1] = @"EmailAliases";
          v122[2] = @"imapHostname";
          v122[3] = @"EmailAddress";
          v123[2] = @"Hostname";
          v123[3] = @"IdentityEmailAddress";
          uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:4];
          __int16 v54 = [v90 dataclassProperties];
          uint64_t v55 = [v54 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
          if (v55)
          {
            __int16 v56 = [v90 dataclassProperties];
            uint64_t v57 = [v56 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
            uint64_t v58 = (void *)[v57 mutableCopy];
          }
          else
          {
            uint64_t v58 = objc_opt_new();
          }

          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v66 = v53;
          uint64_t v67 = [v66 countByEnumeratingWithState:&v98 objects:v121 count:16];
          if (v67)
          {
            uint64_t v68 = v67;
            uint64_t v69 = *(void *)v99;
            do
            {
              for (uint64_t m = 0; m != v68; ++m)
              {
                if (*(void *)v99 != v69) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v71 = *(void *)(*((void *)&v98 + 1) + 8 * m);
                __int16 v72 = [v58 objectForKeyedSubscript:v71];

                if (v72)
                {
                  v73 = [v58 objectForKeyedSubscript:v71];
                  uint64_t v74 = [v66 objectForKeyedSubscript:v71];
                  [v24 setAccountProperty:v73 forKey:v74];
                }
              }
              uint64_t v68 = [v66 countByEnumeratingWithState:&v98 objects:v121 count:16];
            }
            while (v68);
            goto LABEL_68;
          }
          goto LABEL_69;
        }
        uint64_t v60 = v89;
        id v11 = v92;
        if ([v52 isEqualToString:@"com.apple.account.SMTP"])
        {
          v119[0] = @"EmailAddress";
          v119[1] = @"smtpHostname";
          v120[0] = @"IdentityEmailAddress";
          v120[1] = @"Hostname";
          v119[2] = @"smtpRequiresSSL";
          v120[2] = @"SSLEnabled";
          double v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:3];
          __int16 v62 = [v90 dataclassProperties];
          uint64_t v63 = [v62 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
          if (v63)
          {
            __int16 v64 = [v90 dataclassProperties];
            uint64_t v65 = [v64 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
            uint64_t v58 = (void *)[v65 mutableCopy];
          }
          else
          {
            uint64_t v58 = objc_opt_new();
          }

          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v66 = v61;
          uint64_t v75 = [v66 countByEnumeratingWithState:&v94 objects:v118 count:16];
          if (v75)
          {
            uint64_t v76 = v75;
            uint64_t v77 = *(void *)v95;
            do
            {
              for (uint64_t n = 0; n != v76; ++n)
              {
                if (*(void *)v95 != v77) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v79 = *(void *)(*((void *)&v94 + 1) + 8 * n);
                v80 = [v58 objectForKeyedSubscript:v79];

                if (v80)
                {
                  v81 = [v58 objectForKeyedSubscript:v79];
                  v82 = [v66 objectForKeyedSubscript:v79];
                  [v24 setAccountProperty:v81 forKey:v82];
                }
              }
              uint64_t v76 = [v66 countByEnumeratingWithState:&v94 objects:v118 count:16];
            }
            while (v76);
LABEL_68:
            id v3 = v90;
          }
LABEL_69:

          uint64_t v60 = v89;
          uint64_t v8 = v91;
          id v11 = v92;
        }
        [v84 addObject:v24];
LABEL_71:
      }
      uint64_t v88 = [obj countByEnumeratingWithState:&v114 objects:v129 count:16];
    }
    while (v88);
  }

  return v84;
}

- (void)_removeObsoleteOSXServerAccountForiOS:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 accountPropertyForKey:@"MCAccountIsManaged"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    uint64_t v71 = objc_opt_new();
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = [v3 childAccounts];
    id v66 = v3;
    uint64_t v70 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v70)
    {
      uint64_t v69 = *(void *)v95;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v95 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v72 = v6;
          id v7 = *(void **)(*((void *)&v94 + 1) + 8 * v6);
          uint64_t v8 = [v7 enabledDataclasses];
          id v9 = (void *)[v8 copy];

          uint64_t v10 = [v7 provisionedDataclasses];
          id v11 = (void *)[v10 copy];

          [v7 setAuthenticationType:0];
          [v7 setParentAccount:0];
          uint64_t v12 = [v3 internalCredential];
          uint64_t v13 = (void *)[v12 copy];
          [v7 setCredential:v13];

          uint64_t v14 = [v3 internalCredential];
          uint64_t v15 = [v14 credentialType];
          int v16 = (void *)[v15 copy];
          [v7 setCredentialType:v16];

          id v17 = [v3 authenticationType];
          uint64_t v18 = (void *)[v17 copy];
          [v7 setAuthenticationType:v18];

          objc_msgSend(v7, "setSupportsAuthentication:", objc_msgSend(v3, "supportsAuthentication"));
          objc_msgSend(v7, "setAuthenticated:", objc_msgSend(v3, "isAuthenticated"));
          uint64_t v19 = [v3 username];
          __int16 v20 = (void *)[v19 copy];
          [v7 setUsername:v20];

          id v21 = [v3 accountDescription];
          uint64_t v22 = (void *)[v21 copy];
          [v7 setAccountDescription:v22];

          uint64_t v23 = NSString;
          long long v24 = [v3 owningBundleID];
          long long v25 = [v23 stringWithFormat:@"%@.migrator", v24];
          [v7 setOwningBundleID:v25];

          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v26 = v9;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v90 objects:v103 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v91;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v91 != v29) {
                  objc_enumerationMutation(v26);
                }
                [v7 setEnabled:1 forDataclass:*(void *)(*((void *)&v90 + 1) + 8 * i)];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v90 objects:v103 count:16];
            }
            while (v28);
          }

          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v31 = v11;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v86 objects:v102 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v87;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v87 != v34) {
                  objc_enumerationMutation(v31);
                }
                [v7 setProvisioned:1 forDataclass:*(void *)(*((void *)&v86 + 1) + 8 * j)];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v86 objects:v102 count:16];
            }
            while (v33);
          }

          uint64_t v36 = [v7 accountType];
          os_signpost_id_t v37 = [v36 identifier];

          if ([v37 isEqualToString:@"com.apple.account.IMAPMail"])
          {
            os_signpost_id_t v38 = [(ACAccountStore *)self accountTypeWithAccountTypeIdentifier:@"com.apple.account.IMAP"];
            [v7 setAccountType:v38];

            __int16 v39 = [v7 objectForKeyedSubscript:@"Hostname"];
            double v40 = v39;
            if (v39)
            {
              id v41 = v39;
            }
            else
            {
              id v41 = [v3 objectForKeyedSubscript:@"Hostname"];
            }
            uint64_t v42 = v41;

            uint64_t v43 = NSString;
            uint64_t v44 = [v3 username];
            uint64_t v45 = [v43 stringWithFormat:@"%@:%@", v42, v44];

            [v7 setAccountProperty:v45 forKey:@"SMTPIdentifier"];
            [v7 setAccountProperty:@"IMAPAccount" forKey:@"Class"];
            [v7 setAccountProperty:@"IMAP" forKey:@"Protocol"];
            [v7 setAccountProperty:&unk_1EFA156B8 forKey:@"SSLEnabled"];
            if ([v3 isEnabledForDataclass:@"com.apple.Dataclass.Notes"]) {
              [v7 setEnabled:1 forDataclass:@"com.apple.Dataclass.Notes"];
            }
            if ([v3 isProvisionedForDataclass:@"com.apple.Dataclass.Notes"]) {
              [v7 setProvisioned:1 forDataclass:@"com.apple.Dataclass.Notes"];
            }
            uint64_t v46 = [(ACAccountStore *)self _createSMTPAccountForServerAccount:v3];
            [v71 addObject:v46];
          }
          if ([v37 isEqualToString:@"com.apple.account.IMAPNotes"])
          {
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v74 = [v3 childAccounts];
            uint64_t v76 = [v74 countByEnumeratingWithState:&v82 objects:v101 count:16];
            if (v76)
            {
              uint64_t v75 = *(void *)v83;
              uint64_t v68 = v37;
              while (2)
              {
                for (uint64_t k = 0; k != v76; ++k)
                {
                  if (*(void *)v83 != v75) {
                    objc_enumerationMutation(v74);
                  }
                  uint64_t v48 = *(void **)(*((void *)&v82 + 1) + 8 * k);
                  uint64_t v49 = [v48 accountType];
                  __int16 v50 = [v49 identifier];
                  if ([v50 isEqualToString:@"com.apple.account.IMAPMail"])
                  {

LABEL_42:
                    [v7 setParentAccount:v48];
                    [v7 setAuthenticationType:@"parent"];
                    id v3 = v66;
                    os_signpost_id_t v37 = v68;
                    if ([v66 isProvisionedForDataclass:@"com.apple.Dataclass.Notes"])objc_msgSend(v7, "setProvisioned:forDataclass:", 1, @"com.apple.Dataclass.Notes"); {
                    goto LABEL_44;
                    }
                  }
                  uint64_t v51 = [v48 accountType];
                  __int16 v52 = [v51 identifier];
                  int v53 = [v52 isEqualToString:@"com.apple.account.IMAP"];

                  if (v53) {
                    goto LABEL_42;
                  }
                }
                id v3 = v66;
                os_signpost_id_t v37 = v68;
                uint64_t v76 = [v74 countByEnumeratingWithState:&v82 objects:v101 count:16];
                if (v76) {
                  continue;
                }
                break;
              }
            }
LABEL_44:
          }
          [v71 addObject:v7];

          uint64_t v6 = v72 + 1;
        }
        while (v72 + 1 != v70);
        uint64_t v70 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
      }
      while (v70);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v54 = v71;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v78 objects:v100 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v79;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v79 != v57) {
            objc_enumerationMutation(v54);
          }
          os_signpost_id_t v59 = *(void **)(*((void *)&v78 + 1) + 8 * m);
          id v77 = 0;
          BOOL v60 = [(ACAccountStore *)self saveVerifiedAccount:v59 error:&v77];
          id v61 = v77;
          __int16 v62 = _ACLogSystem();
          uint64_t v63 = v62;
          if (v60)
          {
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v64 = [v59 accountType];
              uint64_t v65 = [v64 identifier];
              *(_DWORD *)long long buf = 138412290;
              id v99 = v65;
              _os_log_impl(&dword_1A57C5000, v63, OS_LOG_TYPE_DEFAULT, "\"Successfully saved macOSServer child account: %@\"", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v99 = v61;
            _os_log_error_impl(&dword_1A57C5000, v63, OS_LOG_TYPE_ERROR, "\"Failed to save macOSServer child account. Error: %@\"", buf, 0xCu);
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v78 objects:v100 count:16];
      }
      while (v56);
    }

    id v3 = v66;
  }
}

- (id)_createSMTPAccountForServerAccount:(id)a3
{
  id v4 = a3;
  char v5 = [ACAccount alloc];
  uint64_t v6 = [(ACAccountStore *)self accountTypeWithAccountTypeIdentifier:@"com.apple.account.SMTP"];
  id v7 = [(ACAccount *)v5 initWithAccountType:v6];

  uint64_t v8 = [v4 internalCredential];
  id v9 = (void *)[v8 copy];
  [(ACAccount *)v7 setCredential:v9];

  uint64_t v10 = [v4 credentialType];
  [(ACAccount *)v7 setCredentialType:v10];

  id v11 = [v4 username];
  [(ACAccount *)v7 setUsername:v11];

  [(ACAccount *)v7 setAuthenticated:1];
  [(ACAccount *)v7 setSupportsAuthentication:1];
  uint64_t v12 = [v4 accountDescription];
  [(ACAccount *)v7 setAccountDescription:v12];

  [(ACAccount *)v7 setActive:1];
  [(ACAccount *)v7 setEnabled:1 forDataclass:@"com.apple.Dataclass.Mail"];
  [(ACAccount *)v7 setProvisioned:1 forDataclass:@"com.apple.Dataclass.Mail"];
  uint64_t v13 = [v4 dataclassProperties];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
  if (v14)
  {
    uint64_t v15 = [v4 dataclassProperties];
    int v16 = [v15 objectForKeyedSubscript:@"com.apple.Dataclass.Mail"];
    id v17 = (void *)[v16 mutableCopy];
  }
  else
  {
    id v17 = objc_opt_new();
  }

  uint64_t v18 = [v17 objectForKeyedSubscript:@"OutgoingMailServerAuthentication"];
  [(ACAccount *)v7 setAccountProperty:v18 forKey:@"AuthenticationScheme"];

  uint64_t v19 = [v17 objectForKeyedSubscript:@"smtpHostname"];
  [(ACAccount *)v7 setAccountProperty:v19 forKey:@"Hostname"];

  __int16 v20 = [v17 objectForKeyedSubscript:@"smtpPort"];
  [(ACAccount *)v7 setAccountProperty:v20 forKey:@"PortNumber"];

  id v21 = [v17 objectForKeyedSubscript:@"smtpRequiresSSL"];
  [(ACAccount *)v7 setAccountProperty:v21 forKey:@"SSLEnabled"];

  [(ACAccount *)v7 setAccountProperty:@"SMTPAccount" forKey:@"Class"];
  [(ACAccount *)v7 setAccountProperty:@"SMTP" forKey:@"Protocol"];
  [(ACAccount *)v7 setAccountProperty:&unk_1EFA156B8 forKey:@"ShouldUseAuthentication"];

  return v7;
}

- (void)handleURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _os_activity_create(&dword_1A57C5000, "accounts/handle-url", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  id v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)long long buf = 138412290;
    id v25 = v4;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HandleURL", "%@", buf, 0xCu);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore handleURL:]();
  }

  uint64_t v13 = [(ACAccountStore *)self remoteAccountStoreSession];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __28__ACAccountStore_handleURL___block_invoke;
  v19[3] = &unk_1E5BCE070;
  id v20 = v4;
  os_signpost_id_t v21 = v7;
  uint64_t v22 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __28__ACAccountStore_handleURL___block_invoke_251;
  v15[3] = &unk_1E5BCE098;
  id v14 = v20;
  id v16 = v14;
  os_signpost_id_t v17 = v7;
  uint64_t v18 = v9;
  ac_dispatch_remote(v13, v19, v15);

  os_activity_scope_leave(&state);
}

void __28__ACAccountStore_handleURL___block_invoke(void *a1, void *a2)
{
  [a2 handleURL:a1[4]];
  _ACSignpostGetNanoseconds(a1[5], a1[6]);
  id v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = a1[5];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)os_signpost_id_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "HandleURL", (const char *)&unk_1A582B2CF, v7, 2u);
  }

  uint64_t v6 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __28__ACAccountStore_handleURL___block_invoke_cold_1();
  }
}

void __28__ACAccountStore_handleURL___block_invoke_251(uint64_t a1)
{
  id v2 = _ACLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __28__ACAccountStore_handleURL___block_invoke_251_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  _ACSignpostGetNanoseconds(*(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v9 = _ACSignpostLogSystem();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_END, v11, "HandleURL", (const char *)&unk_1A582B2CF, v13, 2u);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __28__ACAccountStore_handleURL___block_invoke_cold_1();
  }
}

- (void)reportTelemetryForLandmarkEvent:(id)a3
{
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ACAccountStore reportTelemetryForLandmarkEvent:]();
  }

  uint64_t v6 = [(ACAccountStore *)self _connectionFailureError];
  v4[2](v4, 0, v6);
}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/schedule-backup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  uint64_t v10 = _ACSignpostLogSystem();
  os_signpost_id_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ScheduleBackup", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  uint64_t v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore scheduleBackupIfNonexistent:]();
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke;
  v21[3] = &unk_1E5BCD7E0;
  void v21[4] = self;
  os_signpost_id_t v23 = v7;
  uint64_t v24 = v9;
  id v13 = v4;
  id v22 = v13;
  id v14 = (void *)MEMORY[0x1A626DA80](v21);
  uint64_t v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_252;
  v19[3] = &unk_1E5BCDBC8;
  id v20 = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_254;
  v17[3] = &unk_1E5BCCC68;
  id v16 = v20;
  v17[4] = self;
  id v18 = v16;
  ac_dispatch_remote(v15, v19, v17);

  os_activity_scope_leave(&state);
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ScheduleBackup", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    os_signpost_id_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ScheduleBackup %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_252(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2_253;
  v3[3] = &unk_1E5BCDBA0;
  id v4 = *(id *)(a1 + 32);
  [a2 scheduleBackupIfNonexistent:v3];
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_2_253(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_signpost_id_t v5 = _ACLogSystem();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Backup scheduled (if nonexistent) successfully!\"", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__ACAccountStore_scheduleBackupIfNonexistent___block_invoke_254(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_1A57C5000, "accounts/reset-database-to-version", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = _ACSignpostLogSystem();
  os_signpost_id_t v10 = _ACSignpostCreate(v9);
  uint64_t v12 = v11;

  id v13 = _ACSignpostLogSystem();
  int v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ResetDatabaseToVersion", "%@", buf, 0xCu);
  }

  uint64_t v15 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore resetDatabaseToVersion:withCompletion:]();
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke;
  v26[3] = &unk_1E5BCD7E0;
  void v26[4] = self;
  os_signpost_id_t v28 = v10;
  uint64_t v29 = v12;
  id v16 = v7;
  id v27 = v16;
  double v17 = (void *)MEMORY[0x1A626DA80](v26);
  __int16 v18 = [(ACAccountStore *)self remoteAccountStoreSession];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_255;
  v23[3] = &unk_1E5BCCC40;
  id v19 = v6;
  id v24 = v19;
  id v25 = v17;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2_256;
  v21[3] = &unk_1E5BCCC68;
  id v20 = v25;
  void v21[4] = self;
  id v22 = v20;
  ac_dispatch_remote_sync(v18, v23, v21);

  os_activity_scope_leave(&state);
}

void __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ResetDatabaseToVersion", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    os_signpost_id_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ResetDatabaseToVersion %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_255(uint64_t a1, void *a2)
{
  return [a2 resetDatabaseToVersion:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

void __56__ACAccountStore_resetDatabaseToVersion_withCompletion___block_invoke_2_256(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)shutdownAccountsD:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = _os_activity_create(&dword_1A57C5000, "accounts/shutdown-accountsd", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  long long v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ShutdownAccountsd", (const char *)&unk_1A582B2CF, buf, 2u);
  }

  char v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ACAccountStore shutdownAccountsD:]();
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke;
  v21[3] = &unk_1E5BCD7E0;
  void v21[4] = self;
  os_signpost_id_t v23 = v7;
  uint64_t v24 = v9;
  id v13 = v4;
  id v22 = v13;
  int v14 = (void *)MEMORY[0x1A626DA80](v21);
  uint64_t v15 = [(ACAccountStore *)self remoteAccountStoreSession];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_257;
  v19[3] = &unk_1E5BCDBC8;
  id v20 = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_2_258;
  v17[3] = &unk_1E5BCCC68;
  id v16 = v20;
  v17[4] = self;
  id v18 = v16;
  ac_dispatch_remote_sync(v15, v19, v17);

  os_activity_scope_leave(&state);
}

void __36__ACAccountStore_shutdownAccountsD___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__ACAccountStore_shutdownAccountsD___block_invoke_2;
  block[3] = &unk_1E5BCD7B8;
  long long v11 = *(_OWORD *)(a1 + 48);
  char v12 = a2;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __36__ACAccountStore_shutdownAccountsD___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = _ACSignpostLogSystem();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    id v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      id v7 = &stru_1EFA0AB58;
    }
    int v14 = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    double v17 = *(double *)&v7;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v4, OS_SIGNPOST_INTERVAL_END, v5, "ShutdownAccountsd", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v8 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = *(__CFString **)(a1 + 48);
    long long v11 = @"YES";
    char v12 = *(__CFString **)(a1 + 32);
    if (!*(unsigned char *)(a1 + 64)) {
      long long v11 = @"NO";
    }
    int v14 = 134218754;
    uint64_t v15 = v10;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    id v19 = v11;
    if (v12) {
      id v13 = v12;
    }
    __int16 v20 = 2112;
    os_signpost_id_t v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: ShutdownAccountsd %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __36__ACAccountStore_shutdownAccountsD___block_invoke_257(uint64_t a1, void *a2)
{
  return [a2 shutdownAccountsD:*(void *)(a1 + 32)];
}

void __36__ACAccountStore_shutdownAccountsD___block_invoke_2_258(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (unint64_t)generationForCacheSuffix:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(ACAccountStore *)self _cache];
  unint64_t v6 = [v5 generationForCacheSuffix:v4];

  return v6;
}

- (id)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 error:(id *)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v42 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-property-value-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  uint64_t v61 = 0;
  __int16 v62 = &v61;
  uint64_t v63 = 0x3032000000;
  __int16 v64 = __Block_byref_object_copy__0;
  uint64_t v65 = __Block_byref_object_dispose__0;
  uint64_t v15 = [(ACAccountStore *)self _cache];
  id v66 = [v15 cachedAccountsForSuffix:v13];

  uint64_t v55 = 0;
  uint64_t v56 = (__CFString **)&v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__0;
  os_signpost_id_t v59 = __Block_byref_object_dispose__0;
  id v60 = 0;
  if (v62[5])
  {
    __int16 v16 = _ACLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:error:]();
    }
  }
  else
  {
    double v17 = _ACSignpostLogSystem();
    os_signpost_id_t v18 = _ACSignpostCreate(v17);
    uint64_t v20 = v19;

    os_signpost_id_t v21 = _ACSignpostLogSystem();
    uint64_t v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountsForPropertyValue", (const char *)&unk_1A582B2CF, buf, 2u);
    }

    os_signpost_id_t v23 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:error:]();
    }

    uint64_t v24 = [(ACAccountStore *)self remoteAccountStoreSession];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke;
    v48[3] = &unk_1E5BCE0C0;
    uint64_t v49 = v11;
    id v50 = v42;
    id v51 = v12;
    id v25 = v13;
    id v52 = v25;
    int v53 = &v61;
    id v54 = &v55;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_259;
    v47[3] = &unk_1E5BCD2E8;
    v47[4] = self;
    void v47[5] = &v55;
    ac_dispatch_remote_sync(v24, v48, v47);

    if (v62[5])
    {
      uint64_t v26 = [(ACAccountStore *)self _cache];
      [v26 cacheAccounts:v62[5] forSuffix:v25];
    }
    unint64_t Nanoseconds = _ACSignpostGetNanoseconds(v18, v20);
    os_signpost_id_t v28 = _ACSignpostLogSystem();
    uint64_t v29 = v28;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      os_signpost_id_t v30 = v62[5];
      id v31 = v56[5];
      if (*(double *)&v31 == 0.0) {
        *(double *)&id v31 = COERCE_DOUBLE(&stru_1EFA0AB58);
      }
      *(_DWORD *)long long buf = 138412546;
      os_signpost_id_t v70 = v30;
      __int16 v71 = 2112;
      double v72 = *(double *)&v31;
      _os_signpost_emit_with_name_impl(&dword_1A57C5000, v29, OS_SIGNPOST_INTERVAL_END, v18, "AccountsForPropertyValue", "%@%@", buf, 0x16u);
    }

    id v32 = _ACSignpostLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = v62[5];
      double v40 = v56[5];
      *(_DWORD *)long long buf = 134218754;
      os_signpost_id_t v70 = v18;
      __int16 v71 = 2048;
      double v72 = (double)Nanoseconds / 1000000000.0;
      __int16 v73 = 2112;
      uint64_t v74 = v39;
      if (v40) {
        id v41 = v40;
      }
      else {
        id v41 = &stru_1EFA0AB58;
      }
      __int16 v75 = 2112;
      uint64_t v76 = v41;
      _os_log_debug_impl(&dword_1A57C5000, v32, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValue %@%@", buf, 0x2Au);
    }

    __int16 v16 = v49;
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v33 = (id)v62[5];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v68 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) _setAccountStore:self];
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v68 count:16];
    }
    while (v34);
  }

  id v37 = (id)v62[5];
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  os_activity_scope_leave(&state);

  return v37;
}

uint64_t __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_2;
  v7[3] = &unk_1E5BCDD08;
  long long v8 = *(_OWORD *)(a1 + 64);
  return [a2 accountsWithTypeIdentifier:v2 propertyKey:v3 value:v4 cacheSuffix:v5 completion:v7];
}

void __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t __74__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_error___block_invoke_259(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _connectionFailureError];

  return MEMORY[0x1F41817F8]();
}

- (void)accountsOfTypeID:(id)a3 customProperty:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = _os_activity_create(&dword_1A57C5000, "accounts/accounts-with-property-value", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  if (v16)
  {
    id v32 = v12;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke;
    v47[3] = &unk_1E5BCCC18;
    v47[4] = self;
    id v48 = v16;
    os_signpost_id_t v18 = (void (**)(void, void, void))MEMORY[0x1A626DA80](v47);
    uint64_t v19 = [(ACAccountStore *)self _cache];
    uint64_t v20 = [v19 cachedAccountsForSuffix:v15];

    if (v20)
    {
      os_signpost_id_t v21 = _ACLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:completion:]();
      }

      ((void (**)(void, void *, void))v18)[2](v18, v20, 0);
    }
    else
    {
      uint64_t v22 = _ACSignpostLogSystem();
      os_signpost_id_t v23 = _ACSignpostCreate(v22);
      uint64_t v30 = v24;
      os_signpost_id_t v25 = v23;

      uint64_t v26 = _ACSignpostLogSystem();
      id v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A57C5000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "AccountsForPropertyValueSync", (const char *)&unk_1A582B2CF, buf, 2u);
      }

      os_signpost_id_t v28 = _ACSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[ACAccountStore accountsOfTypeID:customProperty:value:cacheSuffix:completion:]();
      }
      id v31 = v18;

      uint64_t v29 = [(ACAccountStore *)self remoteAccountStoreSession];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_260;
      v37[3] = &unk_1E5BCE0E8;
      id v38 = v32;
      id v39 = v13;
      id v40 = v14;
      id v41 = v15;
      id v42 = self;
      os_signpost_id_t v44 = v25;
      uint64_t v45 = v30;
      id v43 = v31;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_262;
      v33[3] = &unk_1E5BCD600;
      void v33[4] = self;
      id v34 = v43;
      os_signpost_id_t v35 = v25;
      uint64_t v36 = v30;
      ac_dispatch_remote(v29, v37, v33);

      os_signpost_id_t v18 = (void (**)(void, void, void))v31;
    }

    id v12 = v32;
  }
  os_activity_scope_leave(&state);
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) _setAccountStore:*(void *)(a1 + 32)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v12;
  id v16 = v5;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v11, block);
}

uint64_t __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_260(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2_261;
  v9[3] = &unk_1E5BCD5B0;
  int8x16_t v8 = *(int8x16_t *)(a1 + 56);
  id v7 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  long long v12 = *(_OWORD *)(a1 + 80);
  id v11 = *(id *)(a1 + 72);
  [a2 accountsWithTypeIdentifier:v4 propertyKey:v5 value:v6 cacheSuffix:v7 completion:v9];
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_2_261(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (v6)
  {
    id v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1();
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _cache];
    [v7 cacheAccounts:v5 forSuffix:*(void *)(a1 + 40)];
  }

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  uint64_t v9 = _ACSignpostLogSystem();
  int8x16_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    long long v12 = &stru_1EFA0AB58;
    if (v6) {
      long long v12 = v6;
    }
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    double v19 = *(double *)&v12;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AccountsForPropertyValueSync", "%@%@", (uint8_t *)&v16, 0x16u);
  }

  id v13 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = *(void **)(a1 + 56);
    int v16 = 134218754;
    id v17 = v14;
    id v15 = &stru_1EFA0AB58;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    __int16 v20 = 2112;
    id v21 = v5;
    if (v6) {
      id v15 = v6;
    }
    __int16 v22 = 2112;
    os_signpost_id_t v23 = v15;
    _os_log_debug_impl(&dword_1A57C5000, v13, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValueSync %@%@", (uint8_t *)&v16, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79__ACAccountStore_accountsOfTypeID_customProperty_value_cacheSuffix_completion___block_invoke_262(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v7 = _ACSignpostLogSystem();
  int8x16_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int8x16_t v10 = &stru_1EFA0AB58;
    if (v3) {
      int8x16_t v10 = v3;
    }
    int v14 = 138412546;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    double v17 = *(double *)&v10;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AccountsForPropertyValueSync", "%@%@", (uint8_t *)&v14, 0x16u);
  }

  os_signpost_id_t v11 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    int v14 = 134218754;
    uint64_t v15 = v12;
    id v13 = &stru_1EFA0AB58;
    __int16 v16 = 2048;
    double v17 = (double)Nanoseconds / 1000000000.0;
    __int16 v18 = 2112;
    uint64_t v19 = 0;
    if (v3) {
      id v13 = v3;
    }
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_debug_impl(&dword_1A57C5000, v11, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountsForPropertyValueSync %@%@", (uint8_t *)&v14, 0x2Au);
  }
}

- (unsigned)_uidOfAccountsd
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  uint64_t v2 = [(ACAccountStore *)self remoteAccountStoreSession];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __33__ACAccountStore__uidOfAccountsd__block_invoke;
  v4[3] = &unk_1E5BCD4C8;
  void v4[4] = &v5;
  ac_dispatch_remote_sync(v2, v4, &__block_literal_global_265);

  LODWORD(v2) = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__ACAccountStore__uidOfAccountsd__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__ACAccountStore__uidOfAccountsd__block_invoke_2;
  v3[3] = &unk_1E5BCE110;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 uidOfAccountsd:v3];
}

uint64_t __33__ACAccountStore__uidOfAccountsd__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_sanitizeOptionsDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"AllowedSSLCertificates"];
  if (v4)
  {
    id v5 = (id)[v3 mutableCopy];
    uint64_t v6 = serializeSecCertificates(v4);
    [v5 setObject:v6 forKeyedSubscript:@"AllowedSSLCertificates"];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (id)_unsanitizeError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"];

  uint64_t v6 = [v3 domain];
  uint64_t v7 = *MEMORY[0x1E4F289A0];
  int v8 = [v6 isEqualToString:*MEMORY[0x1E4F289A0]];

  if (v8) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = v3;
  }
  else
  {
    os_signpost_id_t v11 = [v3 userInfo];
    uint64_t v12 = (void *)[v11 mutableCopy];

    [v12 setObject:0 forKeyedSubscript:@"NSURLErrorFailingURLPeerTrustErrorKey_AC_SANITIZED"];
    id v13 = (void *)SecTrustDeserialize();
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F289B8]];

    int v14 = [v12 objectForKeyedSubscript:@"NSErrorPeerCertificateChainKey"];
    uint64_t v15 = v14;
    if (v14)
    {
      __int16 v16 = unserializeSecCertificates(v14);
      double v17 = [v16 objectForKeyedSubscript:@"c"];
      [v12 setObject:v17 forKeyedSubscript:@"NSErrorPeerCertificateChainKey"];
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v7, objc_msgSend(v3, "code"), v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (ACNotifyAccountCache)_primaryAppleAccountCache
{
  return (ACNotifyAccountCache *)objc_getProperty(self, a2, 88, 1);
}

- (void)set_primaryAppleAccountCache:(id)a3
{
}

- (void)set_testCache:(id)a3
{
}

- (void)accountWithIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountWithIdentifierSync %@");
}

void __46__ACAccountStore_accountWithIdentifier_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Error returned from daemon: %@\"", v2, v3, v4, v5, v6);
}

- (void)accountWithIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountWithIdentifier %@");
}

- (void)cachedAccountWithIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: CachedAccountWithIdentifier %@");
}

- (void)accounts
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AllAccountsSync ", v2, v3, v4, v5, v6);
}

void __26__ACAccountStore_accounts__block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"Error connecting to remote account store!\"", v2, v3, v4, v5, v6);
}

- (void)accountsWithAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsWithTypeSync %@");
}

- (void)accountsWithAccountType:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v6, v4, "@\"Returning cached accounts of type %@: %@\"", v5);
}

void __42__ACAccountStore_accountsWithAccountType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Error returned from daemon: %{public}@\"", v2, v3, v4, v5, v6);
}

- (void)accountsWithAccountType:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsWithType %@");
}

- (void)accountsWithAccountType:completion:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v6, v4, "@\"Returning cached accounts of type %@: %@\"", v5);
}

- (void)allDataclasses
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AllDataclasses ", v2, v3, v4, v5, v6);
}

- (void)allAccountTypes
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AllAccountTypes ", v2, v3, v4, v5, v6);
}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: VisibleAccountsWithTypes %@");
}

- (void)hasAccountWithDescription:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: HasAccountWithDescription %@");
}

- (void)kerberosAccountsForDomainFromURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: KerberosAccounts %@");
}

- (void)isPushSupportedForAccount:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: PushSupported %@");
}

+ (void)accountsWithAccountTypeIdentifierExist:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsWithTypeExist %@");
}

+ (void)countOfAccountsWithAccountTypeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsWithTypeCount %@");
}

- (void)insertAccountType:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: InsertAccountType %@");
}

- (void)removeAccountType:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RemoveAccountType %@");
}

- (void)canSaveAccount:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: CanSaveAccount ", v2, v3, v4, v5, v6);
}

+ (void)canSaveAccountsOfAccountTypeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: CanSaveAccountsWithType %@");
}

- (void)_saveAccount:verify:dataclassActions:completion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"Calling daemon to save\"", v2, v3, v4, v5, v6);
}

- (void)_saveAccount:verify:dataclassActions:completion:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"Account not dirty. Continue\"", v2, v3, v4, v5, v6);
}

- (void)saveVerifiedAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"Account not dirty, nothin' a do...\"", v2, v3, v4, v5, v6);
}

- (void)_checkSaveRateLimitForAccountType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)_checkSaveRateLimitForAccountType__saveRateLimiter, "maximum"));
  uint64_t v5 = NSNumber;
  [(id)_checkSaveRateLimitForAccountType__saveRateLimiter timeInterval];
  uint64_t v7 = [v5 numberWithDouble:v6 / 60.0];
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  os_signpost_id_t v11 = v4;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_fault_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_FAULT, " %{public}@: Exceeded %{public}@ saves per %{public}@ minute(s)", (uint8_t *)&v8, 0x20u);
}

- (void)accessKeysForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccessKeysForAccountType %@");
}

- (void)appPermissionsForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AppPermissionsForAccountType %@");
}

- (void)setPermissionGranted:(uint64_t)a1 forBundleID:onAccountType:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v1, v2, "END [%lld] %fs: PermitBundleWithAccountType ", (uint8_t *)&v3);
}

- (void)clearAllPermissionsGrantedForAccountType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v1, v2, "END [%lld] %fs: ClearPermissionsForAccountType ", (uint8_t *)&v3);
}

- (void)clearAllPermissionsGrantedForAccountType:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ClearPermissionsForAccountType %@");
}

- (void)permissionForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: PermissionForAccountType %@");
}

- (void)grantedPermissionsForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: GrantedPermissionsForAccountType %@");
}

- (void)clearGrantedPermissionsForAccountType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v1, v2, "END [%lld] %fs: ClearGrantedPermissionsForAccountType ", (uint8_t *)&v3);
}

- (void)clearGrantedPermissionsForAccountType:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ClearGrantedPermissionsForAccountType %@");
}

- (void)credentialForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: CredentialForAccount %@");
}

- (void)allCredentialItems
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AllCredentialItems ", v2, v3, v4, v5, v6);
}

- (void)insertCredentialItem:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: InsertCredentialItem %@");
}

- (void)saveCredentialItem:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1A57C5000, v0, v1, "\"Calling daemon to save a credential item\"", v2, v3, v4, v5, v6);
}

- (void)saveCredentialItem:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: SaveCredentialItem %@");
}

void __59__ACAccountStore_saveCredentialItem_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12();
  uint64_t v2 = @"YES";
  _os_log_debug_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: SaveCredentialItem %{public}@", v1, 0x20u);
}

- (void)removeCredentialItem:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RemoveCredentialItem %@");
}

void __61__ACAccountStore_removeCredentialItem_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_12();
  uint64_t v2 = @"YES";
  _os_log_debug_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RemoveCredentialItem %{public}@", v1, 0x20u);
}

- (void)parentAccountForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"Account without identifier provided, bailing!\"", v2, v3, v4, v5, v6);
}

- (void)parentAccountForAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ParentAccountForAccount %@");
}

- (void)childAccountsForAccount:error:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ChildAccountForAccounts %@");
}

- (void)enabledDataclassesForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: EnabledDataclassesForAccount %@");
}

- (void)provisionedDataclassesForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ProvisionedDataclassesForAccount %@");
}

- (void)supportedDataclassesForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: SupportedDataclassesForAccountType %@");
}

- (void)syncableDataclassesForAccountType:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: SyncableDataclassesForAccountType %@");
}

- (void)displayTypeForAccountWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: DisplayTypeForAccount %@");
}

- (void)accountIdentifiersEnabledForDataclass:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsEnabledForDataclass %@");
}

- (void)accountIdentifiersEnabledToSyncDataclass:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsEnabledToSyncDataclass %@");
}

- (void)preloadDataclassOwnersWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: PreloadDataclassOwners ", v2, v3, v4, v5, v6);
}

- (void)dataclassActionsForAccountSave:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: DataclassActionsForAccountSave %@");
}

void __55__ACAccountStore_dataclassActionsForAccountSave_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Could not get dataclass actions: %@\"", v2, v3, v4, v5, v6);
}

- (void)dataclassActionsForAccountDeletion:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: DataclassActionsForAccountDeletion %@");
}

- (void)isPerformingDataclassActionsForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: IsPerformingDataclassActions %@");
}

void __63__ACAccountStore_isPerformingDataclassActionsForAccount_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A57C5000, v0, v1, "\"Could not get dataclass performing status: %@\"", v2, v3, v4, v5, v6);
}

- (void)isTetheredSyncingEnabledForDataclass:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: IsThetheredSyncingEnabledForDataclass %@");
}

- (void)tetheredSyncSourceTypeForDataclass:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ThetheredSyncSourceTypeForDataclass %@");
}

- (void)clientTokenForAccount:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ClientTokenForAccount %@");
}

void __78__ACAccountStore_notifyRemoteDevicesOfModifiedAccount_withOptions_completion___block_invoke_220_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"Failed to notify remote of modified account!\"", v2, v3, v4, v5, v6);
}

void __81__ACAccountStore_notifyRemoteDevicesOfUpdatedCredentials_withOptions_completion___block_invoke_221_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"Failed to notify remote of updated credentials!\"", v2, v3, v4, v5, v6);
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RemoveAccountsFromPairedDevice (%@)");
}

- (void)triggerKeychainMigrationIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: TriggerMigration ", v2, v3, v4, v5, v6);
}

- (void)removeObsoleteAccounts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RemoveObsoleteAccounts ", v2, v3, v4, v5, v6);
}

void __61__ACAccountStore__removeObsoleteAccountsInternal_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_15();
  _os_log_error_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_ERROR, "\"Could not find acceptable action for dataclass %@ for removal of account %@. Probably orphaning data.\"", v1, 0x16u);
}

- (void)handleURL:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: HandleURL %@");
}

void __28__ACAccountStore_handleURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  int v3 = 134218240;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1A57C5000, v1, v2, "END [%lld] %fs: HandleURL ", (uint8_t *)&v3);
}

void __28__ACAccountStore_handleURL___block_invoke_251_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reportTelemetryForLandmarkEvent:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1A57C5000, v0, v1, "\"reportTelemetryForLandmarkEvent no longer suppored\"", v2, v3, v4, v5, v6);
}

- (void)scheduleBackupIfNonexistent:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ScheduleBackup ", v2, v3, v4, v5, v6);
}

- (void)resetDatabaseToVersion:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ResetDatabaseToVersion %@");
}

- (void)shutdownAccountsD:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: ShutdownAccountsd ", v2, v3, v4, v5, v6);
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsForPropertyValue ", v2, v3, v4, v5, v6);
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:error:.cold.2()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "@\"Returning cached accounts of type %@: %@\"");
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: AccountsForPropertyValueSync ", v2, v3, v4, v5, v6);
}

- (void)accountsOfTypeID:customProperty:value:cacheSuffix:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "@\"Returning cached accounts of type %@: %@\"");
}

@end