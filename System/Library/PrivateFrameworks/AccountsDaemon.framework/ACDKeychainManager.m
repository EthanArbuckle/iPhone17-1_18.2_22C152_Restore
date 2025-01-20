@interface ACDKeychainManager
+ (ACDServer)server;
+ (BOOL)_keychainLock_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7;
+ (BOOL)_removeCredentialItemWithKey:(id)a3 forAccountWithID:(id)a4 username:(id)a5 accountTypeID:(id)a6 clientID:(id)a7 options:(id)a8 error:(id *)a9;
+ (BOOL)_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7;
+ (BOOL)_shouldSyncCredentialForAccount:(id)a3;
+ (BOOL)accountSyncMigrated;
+ (BOOL)createAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6;
+ (BOOL)createAccountSyncMigratedItemWithError:(id *)a3;
+ (BOOL)removeAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6;
+ (id)_credentialForAccountWithID:(id)a3 accountTypeID:(id)a4 credentialType:(id)a5 clientID:(id)a6 allowAdditionalAccountTypeSegment:(BOOL)a7 options:(id)a8 error:(id *)a9;
+ (id)_fetchOptionsForAccount:(id)a3;
+ (id)_itemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7;
+ (id)accountSynciOSVersion;
+ (id)credentialForAccount:(id)a3 clientID:(id)a4;
+ (id)credentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (id)credentialForManagedAccountObject:(id)a3;
+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4;
+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (id)keychainAccounts;
+ (id)keychainDeletedAccounts;
+ (id)keychainDeletedContactAccounts;
+ (id)keychainDeletedHostnameAccounts;
+ (id)keychainHostnameAccounts;
+ (id)keychainServiceNameForClientID:(id)a3 accountTypeIdentifier:(id)a4 additionalAccountTypeSegment:(id)a5 key:(id)a6;
+ (id)removeTombstonesForAccount:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (void)_accountTypeIdentifierFromComponents:(id)a3 handler:(id)a4;
+ (void)_createNoSyncOAuthTokens:(id)a3 account:(id)a4 clientID:(id)a5;
+ (void)_fallbackToUnsyncedOAuthTokens:(id)a3;
+ (void)_keychainLock_addItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 error:(id *)a10;
+ (void)_keychainLock_updateItem:(id)a3 existingPassword:(id)a4 forServiceName:(id)a5 username:(id)a6 accessGroup:(id)a7 accessibility:(id)a8 options:(id)a9 error:(id *)a10;
+ (void)_migrateCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5;
+ (void)_removeCredentialsForAccount:(id)a3 clientID:(id)a4 options:(id)a5 error:(id *)a6;
+ (void)_saveCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5 error:(id *)a6;
+ (void)_setCredentialForAccount:(id)a3 clientID:(id)a4 handleCredentialItemRemovals:(BOOL)a5 error:(id *)a6;
+ (void)_setItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 options:(id)a10 error:(id *)a11;
+ (void)_setNonPersistentCredentialTimerForAccount:(id)a3;
+ (void)componentsFromKeychainServiceName:(id)a3 handler:(id)a4;
+ (void)initialize;
+ (void)notifiyCredentialChangedForAccount:(id)a3;
+ (void)removeCredentialForAccount:(id)a3;
+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4;
+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (void)removeCredentialForAccount:(id)a3 error:(id *)a4;
+ (void)removeCredentialForAccount:(id)a3 key:(id)a4 error:(id *)a5;
+ (void)setCredentialForAccount:(id)a3;
+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4;
+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (void)setCredentialForAccount:(id)a3 error:(id *)a4;
+ (void)setCredentialForNewAccount:(id)a3 clientID:(id)a4 error:(id *)a5;
+ (void)setServer:(id)a3;
@end

@implementation ACDKeychainManager

+ (void)initialize
{
  _ac_keychainLock = objc_opt_new();

  MEMORY[0x270F9A758]();
}

+ (ACDServer)server
{
  id WeakRetained = objc_loadWeakRetained(&sServer);

  return (ACDServer *)WeakRetained;
}

+ (void)setServer:(id)a3
{
}

+ (id)_fetchOptionsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([a1 _shouldSyncCredentialForAccount:v4]) {
    [v5 setObject:*MEMORY[0x263F170B8] forKeyedSubscript:*MEMORY[0x263F170B0]];
  }
  v6 = [v4 accountType];
  v7 = [v6 identifier];
  int v8 = [v7 isEqual:*MEMORY[0x263EFAE68]];

  if (v8)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"ICLOUD_STORAGE" value:&stru_26C990120 table:@"Localizable"];
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F17578]];
  }
  if ([v5 count]) {
    v11 = (void *)[v5 copy];
  }
  else {
    v11 = 0;
  }

  return v11;
}

+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4 error:(id *)a5
{
  int v8 = (objc_class *)MEMORY[0x263EFB1F8];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithManagedAccount:v10];

  v12 = [a1 credentialForAccount:v11 clientID:v9 error:a5];

  return v12;
}

+ (id)credentialForManagedAccountObject:(id)a3 clientID:(id)a4
{
  return (id)[a1 credentialForManagedAccountObject:a3 clientID:a4 error:0];
}

+ (id)credentialForManagedAccountObject:(id)a3
{
  return (id)[a1 credentialForManagedAccountObject:a3 clientID:0];
}

+ (id)credentialForAccount:(id)a3 clientID:(id)a4
{
  return (id)[a1 credentialForAccount:a3 clientID:a4 error:0];
}

+ (id)credentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 accountType];
  v11 = [v10 identifier];

  v12 = [v8 accountType];
  v13 = [v12 credentialType];

  v14 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager credentialForAccount:clientID:error:]();
  }

  int v15 = [MEMORY[0x263EFB200] credentialPolicyIsMixedForAccountTypeIdentifier:v11];
  v16 = [v8 accountType];
  v17 = [v16 credentialProtectionPolicy];
  BOOL v18 = +[ACDKeychain canAccessPasswordsWithPolicy:v17];

  if ((v18 | v15))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    id v45 = 0;
    if (a5) {
      *a5 = 0;
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    v19 = (void *)MEMORY[0x263EFB268];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke;
    v27[3] = &unk_264320A20;
    id v28 = v8;
    p_long long buf = &buf;
    v33 = &v35;
    id v34 = a1;
    id v29 = v11;
    id v30 = v13;
    id v31 = v9;
    [v19 performWithinPersonaForAccount:v28 withBlock:v27];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v20 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[ACDKeychainManager credentialForAccount:clientID:error:]();
      }

      if (a5) {
        *a5 = *(id *)(*((void *)&buf + 1) + 40);
      }
    }
    v21 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychainManager credentialForAccount:clientID:error:]();
    }

    a5 = (id *)(id)v36[5];
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v22 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v8 identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_2183AD000, v22, OS_LOG_TYPE_DEFAULT, "Credential for account %@ is not currently available", (uint8_t *)&buf, 0xCu);
    }
    if (a5)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v47[0] = @"Credential data is currently unavailable for Account ";
      v25 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a5 = [v24 errorWithDomain:*MEMORY[0x263EFB070] code:10 userInfo:v25];

      a5 = 0;
    }
  }

  return a5;
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) credentialLocation];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 identifier];

    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) identifier];
      goto LABEL_6;
    }
  }
  else
  {
    v6 = [v3 qualifiedUsername];
    if (v6)
    {

      uint64_t v5 = [*(id *)(a1 + 32) qualifiedUsername];
LABEL_6:
      v7 = (void *)v5;
      id v8 = *(void **)(a1 + 80);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = [v8 _fetchOptionsForAccount:*(void *)(a1 + 32)];
      uint64_t v13 = a1 + 64;
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v14 + 40);
      uint64_t v15 = [v8 _credentialForAccountWithID:v7 accountTypeID:v11 credentialType:v9 clientID:v10 allowAdditionalAccountTypeSegment:1 options:v12 error:&obj];
      objc_storeStrong((id *)(v14 + 40), obj);
      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      BOOL v18 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) keysForCredentialItems];
      if ([v18 count])
      {
        uint64_t v19 = *(void *)(*(void *)(*(void *)v13 + 8) + 40);

        if (!v19)
        {
LABEL_45:
          v69 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) oauthTokenNoSync];

          v70 = *(void **)(a1 + 80);
          uint64_t v71 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          if (v69) {
            [v70 _fallbackToUnsyncedOAuthTokens:v71];
          }
          else {
            [v70 _createNoSyncOAuthTokens:v71 account:*(void *)(a1 + 32) clientID:*(void *)(a1 + 56)];
          }
          goto LABEL_48;
        }
      }
      else
      {
      }
      v24 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_2();
      }

      v25 = *(void **)(a1 + 32);
      if (v2) {
        [v25 qualifiedUsername];
      }
      else {
      v26 = [v25 identifier];
      }
      v27 = v26;
      if (v26 && [v26 length])
      {
        id v28 = *(void **)(a1 + 80);
        v72 = v7;
        uint64_t v29 = *(void *)(a1 + 48);
        uint64_t v30 = *(void *)(a1 + 56);
        uint64_t v31 = *(void *)(a1 + 40);
        v32 = [v28 _fetchOptionsForAccount:*(void *)(a1 + 32)];
        uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
        id v75 = *(id *)(v33 + 40);
        uint64_t v34 = v29;
        v7 = v72;
        uint64_t v35 = [v28 _credentialForAccountWithID:v27 accountTypeID:v31 credentialType:v34 clientID:v30 allowAdditionalAccountTypeSegment:0 options:v32 error:&v75];
        objc_storeStrong((id *)(v33 + 40), v75);
        uint64_t v36 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;
      }
      v38 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) keysForCredentialItems];
      if ([v38 count])
      {
        uint64_t v39 = *(void *)(*(void *)(*(void *)v13 + 8) + 40);

        if (!v39)
        {
          if (v2) {
            goto LABEL_44;
          }
          id v40 = [*(id *)(a1 + 32) qualifiedUsername];

          if (!v40) {
            goto LABEL_44;
          }
          v41 = _ACDKeychainLogSystem();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          uint64_t v42 = *(void **)(a1 + 32);
          uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          v78 = v42;
          __int16 v79 = 2112;
          uint64_t v80 = v43;
          v44 = "Found an identifier-based credential for account %@ which isn't set to use them! Migrating to qualifiedU"
                "sreName-based credential. Error: %@";
          goto LABEL_37;
        }
      }
      else
      {
      }
      id v45 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) keysForCredentialItems];
      if ([v45 count] && !*(void *)(*(void *)(*(void *)v13 + 8) + 40))
      {
      }
      else
      {
        uint64_t v46 = [*(id *)(a1 + 32) username];
        uint64_t v47 = [v46 length];

        if (v47)
        {
          v73 = v7;
          v48 = v27;
          v49 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
            __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_1();
          }

          v50 = *(void **)(a1 + 80);
          v51 = [*(id *)(a1 + 32) username];
          uint64_t v52 = *(void *)(a1 + 48);
          uint64_t v53 = *(void *)(a1 + 56);
          uint64_t v54 = *(void *)(a1 + 40);
          v55 = [*(id *)(a1 + 80) _fetchOptionsForAccount:*(void *)(a1 + 32)];
          uint64_t v56 = *(void *)(*(void *)(a1 + 64) + 8);
          id v74 = *(id *)(v56 + 40);
          uint64_t v57 = [v50 _credentialForAccountWithID:v51 accountTypeID:v54 credentialType:v52 clientID:v53 allowAdditionalAccountTypeSegment:0 options:v55 error:&v74];
          objc_storeStrong((id *)(v56 + 40), v74);
          uint64_t v58 = *(void *)(*(void *)(a1 + 72) + 8);
          v59 = *(void **)(v58 + 40);
          *(void *)(v58 + 40) = v57;

          v60 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) keysForCredentialItems];
          if (![v60 count])
          {

            v27 = v48;
            v7 = v73;
            goto LABEL_44;
          }
          uint64_t v61 = *(void *)(*(void *)(*(void *)v13 + 8) + 40);

          v27 = v48;
          v7 = v73;
          if (v61)
          {
LABEL_44:

            goto LABEL_45;
          }
          v41 = _ACDKeychainLogSystem();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
LABEL_38:

            [*(id *)(a1 + 80) _migrateCredential:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forAccount:*(void *)(a1 + 32) clientID:*(void *)(a1 + 56)];
            goto LABEL_44;
          }
          v62 = *(void **)(a1 + 32);
          uint64_t v63 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)long long buf = 138412546;
          v78 = v62;
          __int16 v79 = 2112;
          uint64_t v80 = v63;
          v44 = "Found a legacy username-based credential for account %@! Migrating to QualifiedUsername-based credential. Error: %@";
LABEL_37:
          _os_log_impl(&dword_2183AD000, v41, OS_LOG_TYPE_DEFAULT, v44, buf, 0x16u);
          goto LABEL_38;
        }
      }
      v64 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)long long buf = 138412290;
        v78 = v65;
        _os_log_impl(&dword_2183AD000, v64, OS_LOG_TYPE_DEFAULT, "No username for account %@. Can't look up credential", buf, 0xCu);
      }
      uint64_t v66 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:11 userInfo:0];
      uint64_t v67 = *(void *)(*(void *)v13 + 8);
      v68 = *(void **)(v67 + 40);
      *(void *)(v67 + 40) = v66;

      goto LABEL_44;
    }
  }
  v20 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)long long buf = 138412290;
    v78 = v21;
    _os_log_impl(&dword_2183AD000, v20, OS_LOG_TYPE_DEFAULT, "Nil qualifiedUsername for account %@. Can't look up credential", buf, 0xCu);
  }
  uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:11 userInfo:0];
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;
LABEL_48:
}

+ (id)_credentialForAccountWithID:(id)a3 accountTypeID:(id)a4 credentialType:(id)a5 clientID:(id)a6 allowAdditionalAccountTypeSegment:(BOOL)a7 options:(id)a8 error:(id *)a9
{
  BOOL v10 = a7;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v14 = a4;
  id v15 = a5;
  id v38 = a6;
  id v37 = a8;
  uint64_t v16 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:]();
  }

  id v36 = objc_alloc_init(MEMORY[0x263EFB200]);
  [v36 setCredentialType:v15];
  v17 = [MEMORY[0x263EFB200] supportedKeysForAccountTypeIdentifier:v14 credentialType:v15];
  if ([v17 count])
  {
    if (v10)
    {
LABEL_5:
      BOOL v18 = [MEMORY[0x263EFB200] additionalServiceSegmentForAccountTypeIdentifier:v14];
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v19 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:]();
    }

    if (v10) {
      goto LABEL_5;
    }
  }
  BOOL v18 = 0;
LABEL_10:
  char v35 = [MEMORY[0x263EFB200] credentialPolicyIsMixedForAccountTypeIdentifier:v14];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = v17;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v34 = v15;
    uint64_t v23 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v26 = v14;
        v27 = +[ACDKeychainManager keychainServiceNameForClientID:v38 accountTypeIdentifier:v14 additionalAccountTypeSegment:v18 key:v25];
        id v40 = 0;
        id v28 = +[ACDKeychainManager _itemForServiceName:v27 username:v39 accessGroup:0 options:v37 error:&v40];
        id v29 = v40;
        uint64_t v30 = v29;
        if (v29)
        {
          char v31 = [v29 code] == 11 ? 1 : v35;
          if ((v31 & 1) == 0)
          {
            if (a9) {
              *a9 = v30;
            }

            id v36 = 0;
            id v14 = v26;
            goto LABEL_28;
          }
        }
        if (v28) {
          [v36 setCredentialItem:v28 forKey:v25];
        }

        id v14 = v26;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v22) {
        continue;
      }
      break;
    }
LABEL_28:
    id v15 = v34;
  }

  v32 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager _credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:]();
  }

  return v36;
}

+ (void)setCredentialForAccount:(id)a3
{
}

+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4
{
}

+ (void)setCredentialForAccount:(id)a3 error:(id *)a4
{
}

+ (void)setCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
}

+ (void)setCredentialForNewAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
}

+ (void)_setCredentialForAccount:(id)a3 clientID:(id)a4 handleCredentialItemRemovals:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v75[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v12 = [v10 internalCredential];
  uint64_t v13 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v42 = [NSNumber numberWithBool:v7];
    *(_DWORD *)uint64_t v71 = 138413058;
    *(void *)&v71[4] = v12;
    *(_WORD *)&v71[12] = 2112;
    *(void *)&v71[14] = v10;
    *(_WORD *)&v71[22] = 2112;
    v72 = v11;
    LOWORD(v73) = 2112;
    *(void *)((char *)&v73 + 2) = v42;
    _os_log_debug_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEBUG, "Setting credential=%@; for account=%@; client=%@; handle credential removals=%@",
      v71,
      0x2Au);
  }
  id v14 = [v10 accountType];
  id v15 = [v14 credentialProtectionPolicy];
  BOOL v16 = +[ACDKeychain canAccessPasswordsWithPolicy:v15];

  if (v16)
  {
    *(void *)uint64_t v71 = 0;
    *(void *)&v71[8] = v71;
    *(void *)&v71[16] = 0x3032000000;
    v72 = __Block_byref_object_copy_;
    *(void *)&long long v73 = __Block_byref_object_dispose_;
    *((void *)&v73 + 1) = 0;
    if (a6) {
      *a6 = 0;
    }
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    id v66 = 0;
    if (v7)
    {
      if (v12 && ![v12 requiresTouchID])
      {
        uint64_t v23 = _ACDKeychainLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_2183AD000, v23, OS_LOG_TYPE_DEFAULT, "Fetching exting credential to handle removed credential items", buf, 2u);
        }

        v24 = (void *)MEMORY[0x263EFB268];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke;
        v56[3] = &unk_264320A48;
        v59 = &v61;
        id v57 = v10;
        uint64_t v58 = v11;
        [v24 performWithinPersonaForAccount:v57 withBlock:v56];

        id v17 = v57;
      }
      else
      {
        id v60 = 0;
        +[ACDKeychainManager removeCredentialForAccount:v10 clientID:v11 error:&v60];
        id v17 = v60;
        if (v17)
        {
          BOOL v18 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            id v68 = v10;
            __int16 v69 = 2112;
            id v70 = v17;
            _os_log_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEFAULT, "Unable to remove existing credential for account %@. Error: %@", buf, 0x16u);
          }
        }
      }
    }
    uint64_t v25 = *(void *)&v71[8];
    id obj = *(id *)(*(void *)&v71[8] + 40);
    [a1 _saveCredential:v12 forAccount:v10 clientID:v11 error:&obj];
    objc_storeStrong((id *)(v25 + 40), obj);
    id v26 = *(void **)(*(void *)&v71[8] + 40);
    if (v26)
    {
      if (a6) {
        *a6 = v26;
      }
    }
    else
    {
      if (v12 && v7)
      {
        v27 = [(id)v62[5] keysForCredentialItems];
        id v28 = (void *)[v27 mutableCopy];

        id v29 = [v10 internalCredential];
        uint64_t v30 = [v29 keysForCredentialItems];
        [v28 removeObjectsInArray:v30];

        char v31 = (void *)MEMORY[0x263EFB268];
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_2;
        v49[3] = &unk_264320A70;
        id v32 = v28;
        id v50 = v32;
        id v51 = v10;
        uint64_t v52 = v11;
        uint64_t v53 = v71;
        id v54 = a1;
        [v31 performWithinPersonaForAccount:v51 withBlock:v49];
      }
      uint64_t v33 = (void *)MEMORY[0x263EFB268];
      uint64_t v43 = MEMORY[0x263EF8330];
      uint64_t v44 = 3221225472;
      id v45 = __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_25;
      uint64_t v46 = &unk_264320A98;
      id v48 = a1;
      id v34 = v10;
      id v47 = v34;
      [v33 performWithinPersonaForAccount:v34 withBlock:&v43];
      char v35 = (void *)MEMORY[0x263EFB200];
      id v36 = objc_msgSend(v34, "accountType", v43, v44, v45, v46);
      id v37 = [v36 identifier];
      id v38 = [v34 accountType];
      id v39 = [v38 credentialType];
      id v40 = [v35 nonPersistentKeysForAccountTypeIdentifier:v37 credentialType:v39];

      if (v40) {
        [a1 _setNonPersistentCredentialTimerForAccount:v34];
      }
      long long v41 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        +[ACDKeychainManager _setCredentialForAccount:clientID:handleCredentialItemRemovals:error:](v41);
      }
    }
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(v71, 8);
  }
  else
  {
    uint64_t v19 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v10 identifier];
      *(_DWORD *)uint64_t v71 = 138412290;
      *(void *)&v71[4] = v20;
      _os_log_impl(&dword_2183AD000, v19, OS_LOG_TYPE_DEFAULT, "Credential for account %@ is not currently available", v71, 0xCu);
    }
    if (a6)
    {
      uint64_t v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v74 = *MEMORY[0x263F08320];
      v75[0] = @"Credential data is currently unavailable.";
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v75 forKeys:&v74 count:1];
      *a6 = [v21 errorWithDomain:*MEMORY[0x263EFB070] code:10 userInfo:v22];
    }
  }
}

uint64_t __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = +[ACDKeychainManager credentialForAccount:a1[4] clientID:a1[5] error:0];

  return MEMORY[0x270F9A758]();
}

void __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v3 = [*(id *)(a1 + 40) identifier];
        id v4 = [*(id *)(a1 + 40) qualifiedUsername];
        uint64_t v5 = [*(id *)(a1 + 40) accountType];
        v6 = [v5 identifier];
        uint64_t v7 = *(void *)(a1 + 48);
        id v8 = [*(id *)(a1 + 64) _fetchOptionsForAccount:*(void *)(a1 + 40)];
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        id v17 = *(id *)(v9 + 40);
        +[ACDKeychainManager _removeCredentialItemWithKey:v16 forAccountWithID:v3 username:v4 accountTypeID:v6 clientID:v7 options:v8 error:&v17];
        objc_storeStrong((id *)(v9 + 40), v17);

        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          id v10 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(a1 + 40);
            uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v23 = v11;
            __int16 v24 = 2112;
            uint64_t v25 = v12;
            _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "Removal from keychain failed for account %@. Error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

void __91__ACDKeychainManager__setCredentialForAccount_clientID_handleCredentialItemRemovals_error___block_invoke_25(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() server];
  [v2 credentialsDidChangeForAccount:*(void *)(a1 + 32)];
}

+ (void)_saveCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5 error:(id *)a6
{
  id v32 = a6;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v39 = a4;
  id v38 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v36 = v8;
  uint64_t v9 = [v8 keysForCredentialItems];
  id v10 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v56 = v38;
    _os_log_debug_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEBUG, "Asked to save credential: %@ for Account - %@ with the clientID - %@", buf, 0x20u);
  }

  char v11 = [a1 _shouldSyncCredentialForAccount:v39];
  uint64_t v12 = (void *)MEMORY[0x263EFB200];
  uint64_t v13 = [v39 accountType];
  uint64_t v14 = [v13 identifier];
  id v34 = [v12 additionalServiceSegmentForAccountTypeIdentifier:v14];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v56 = __Block_byref_object_copy_;
  id v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v9;
  uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v51;
    uint64_t v17 = *MEMORY[0x263EFB0E0];
    uint64_t v33 = v41;
LABEL_5:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v50 + 1) + 8 * v18);
      if (!objc_msgSend(v19, "isEqualToString:", v17, v32, v33) || (v11 & 1) != 0)
      {
        long long v20 = [v39 accountType];
        long long v21 = [v20 identifier];
        uint64_t v22 = +[ACDKeychainManager keychainServiceNameForClientID:v38 accountTypeIdentifier:v21 additionalAccountTypeSegment:v34 key:v19];

        uint64_t v23 = (void *)MEMORY[0x263EFB200];
        __int16 v24 = [v39 accountType];
        uint64_t v25 = [v24 identifier];
        id v26 = [v23 credentialPolicyForAccountTypeIdentifier:v25 key:v19 clientID:v38];

        uint64_t v27 = (void *)MEMORY[0x263EFB268];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v41[0] = __64__ACDKeychainManager__saveCredential_forAccount_clientID_error___block_invoke;
        v41[1] = &unk_264320AC0;
        id v28 = v39;
        id v42 = v28;
        id v43 = v36;
        uint64_t v44 = v19;
        id v29 = v22;
        id v45 = v29;
        id v30 = v26;
        char v49 = v11;
        id v46 = v30;
        id v47 = buf;
        id v48 = a1;
        [v27 performWithinPersonaForAccount:v28 withBlock:v40];
        LOBYTE(v27) = *(void *)(*(void *)&buf[8] + 40) == 0;

        if ((v27 & 1) == 0) {
          break;
        }
      }
      if (v15 == ++v18)
      {
        uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v15) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (v32)
  {
    char v31 = *(void **)(*(void *)&buf[8] + 40);
    if (v31) {
      id *v32 = v31;
    }
  }
  _Block_object_dispose(buf, 8);
}

void __64__ACDKeychainManager__saveCredential_forAccount_clientID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) credentialLocation];
  v3 = [*(id *)(a1 + 40) credentialItemForKey:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void **)(a1 + 32);
  if (v2) {
    [v5 identifier];
  }
  else {
  v6 = [v5 qualifiedUsername];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  BOOL v8 = ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263EFB0E0]] & 1) == 0 && *(unsigned char *)(a1 + 88) != 0;
  char v9 = [*(id *)(a1 + 40) requiresTouchID];
  id v10 = [*(id *)(a1 + 80) _fetchOptionsForAccount:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v11 + 40);
  LOBYTE(v12) = v9;
  +[ACDKeychainManager _setItem:v3 forServiceName:v4 username:v6 accessGroup:0 accessibility:v7 syncable:v8 requiresTouchID:v12 options:v10 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
}

+ (void)_setNonPersistentCredentialTimerForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFB240] sharedInstance];
  uint64_t v5 = [v4 valueForManagedDefault:*MEMORY[0x263EFB0C8]];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = _ACDKeychainLogSystem();
  BOOL v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "NOT setting timer to erase volatile keychain items because of user preference.", v9, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychainManager _setNonPersistentCredentialTimerForAccount:]();
    }

    BOOL v8 = +[ACDKeychainCleanupActivity sharedActivity];
    [v8 queueNonPersistentCredentialRemoval:v3];
  }
}

+ (void)removeCredentialForAccount:(id)a3
{
}

+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4
{
}

+ (void)removeCredentialForAccount:(id)a3 error:(id *)a4
{
  int v6 = (objc_class *)MEMORY[0x263EFB1F8];
  id v7 = a3;
  id v8 = (id)[[v6 alloc] initWithManagedAccount:v7];

  [a1 removeCredentialForAccount:v8 clientID:0 error:a4];
}

+ (void)removeCredentialForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager removeCredentialForAccount:clientID:error:]((uint64_t)v8, (uint64_t)v9, v10);
  }

  uint64_t v11 = [v8 accountType];
  uint64_t v12 = [v11 credentialProtectionPolicy];
  BOOL v13 = +[ACDKeychain canAccessPasswordsWithPolicy:v12];

  if (v13)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy_;
    id v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v14 = (void *)MEMORY[0x263EFB268];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __64__ACDKeychainManager_removeCredentialForAccount_clientID_error___block_invoke;
    v19[3] = &unk_264320AE8;
    id v23 = a1;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = &v24;
    [v14 performWithinPersonaForAccount:v20 withBlock:v19];
    if (a5)
    {
      uint64_t v15 = (void *)v25[5];
      if (v15) {
        *a5 = v15;
      }
    }
    uint64_t v16 = _ACDLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychainManager removeCredentialForAccount:clientID:error:]();
    }

    _Block_object_dispose(&v24, 8);
  }
  else if (a5)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"Credential data is currently unavailable.";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    *a5 = [v17 errorWithDomain:*MEMORY[0x263EFB070] code:10 userInfo:v18];
  }
}

void __64__ACDKeychainManager_removeCredentialForAccount_clientID_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = [v2 _fetchOptionsForAccount:v3];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  [v2 _removeCredentialsForAccount:v3 clientID:v4 options:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

+ (void)_removeCredentialsForAccount:(id)a3 clientID:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v34 = a5;
  uint64_t v11 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager _removeCredentialsForAccount:clientID:options:error:]();
  }
  char v35 = v10;

  uint64_t v12 = (void *)MEMORY[0x263EFB200];
  BOOL v13 = [v9 accountType];
  uint64_t v14 = [v13 identifier];
  uint64_t v15 = [v9 accountType];
  uint64_t v16 = [v15 credentialType];
  uint64_t v17 = [v12 supportedKeysForAccountTypeIdentifier:v14 credentialType:v16];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    id obj = v18;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v24 = [v9 identifier];
        uint64_t v25 = [v9 qualifiedUsername];
        uint64_t v26 = [v9 accountType];
        uint64_t v27 = [v26 identifier];
        [a1 _removeCredentialItemWithKey:v23 forAccountWithID:v24 username:v25 accountTypeID:v27 clientID:v35 options:v34 error:a6];

        if (a6 && *a6)
        {
          id v28 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = [v9 identifier];
            id v30 = *a6;
            *(_DWORD *)long long buf = 138412802;
            uint64_t v41 = v23;
            __int16 v42 = 2112;
            id v43 = v29;
            __int16 v44 = 2112;
            id v45 = v30;
            _os_log_impl(&dword_2183AD000, v28, OS_LOG_TYPE_DEFAULT, "Unable to remove credential %@ from %@. Error: %@", buf, 0x20u);
          }
        }
      }
      id v18 = obj;
      uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v20);
  }

  if (!v35)
  {
    char v31 = [(id)objc_opt_class() server];
    [v31 credentialsDidChangeForAccount:v9];
  }
}

+ (void)removeCredentialForAccount:(id)a3 key:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEFAULT, "Remove credential key: %@ for account: %@", buf, 0x16u);
  }

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v11 = (void *)MEMORY[0x263EFB268];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__ACDKeychainManager_removeCredentialForAccount_key_error___block_invoke;
  v15[3] = &unk_264320B10;
  id v18 = v21;
  id v20 = a1;
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  uint64_t v19 = buf;
  [v11 performWithinPersonaForAccount:v13 withBlock:v15];
  if (a5)
  {
    uint64_t v14 = *(void **)(*(void *)&buf[8] + 40);
    if (v14) {
      *a5 = v14;
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v21, 8);
}

void __59__ACDKeychainManager_removeCredentialForAccount_key_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [*(id *)(a1 + 40) qualifiedUsername];
  uint64_t v6 = [*(id *)(a1 + 40) accountType];
  id v7 = [v6 identifier];
  id v8 = [*(id *)(a1 + 64) _fetchOptionsForAccount:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  LOBYTE(v2) = [v2 _removeCredentialItemWithKey:v3 forAccountWithID:v4 username:v5 accountTypeID:v7 clientID:0 options:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)v2;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v10 = [(id)objc_opt_class() server];
    [v10 credentialsDidChangeForAccount:*(void *)(a1 + 40)];
  }
}

+ (BOOL)_removeCredentialItemWithKey:(id)a3 forAccountWithID:(id)a4 username:(id)a5 accountTypeID:(id)a6 clientID:(id)a7 options:(id)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a8;
  id v16 = (void *)MEMORY[0x263EFB200];
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  uint64_t v21 = [v16 additionalServiceSegmentForAccountTypeIdentifier:v18];
  char v22 = +[ACDKeychainManager keychainServiceNameForClientID:v17 accountTypeIdentifier:v18 additionalAccountTypeSegment:v21 key:v20];

  BOOL v23 = +[ACDKeychainManager _removeItemForService:v22 username:v19 accessGroup:0 options:v15 error:a9];
  if (v14) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v23;
  }
  if (v14 && !v23) {
    BOOL v24 = +[ACDKeychainManager _removeItemForService:v22 username:v14 accessGroup:0 options:v15 error:a9];
  }

  return v24;
}

+ (id)keychainServiceNameForClientID:(id)a3 accountTypeIdentifier:(id)a4 additionalAccountTypeSegment:(id)a5 key:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  id v14 = v13;
  if (v9) {
    [v13 addObject:v9];
  }
  [v14 addObject:v10];
  if (v11) {
    [v14 addObject:v11];
  }
  [v14 addObject:v12];
  id v15 = [v14 componentsJoinedByString:@"."];

  return v15;
}

+ (void)componentsFromKeychainServiceName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 componentsSeparatedByString:@"."];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [v8 lastObject];
  [v8 removeLastObject];
  if ([v9 length]
    && ([MEMORY[0x263EFB200] allSupportedKeys],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 containsObject:v9],
        v10,
        (v11 & 1) != 0))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__ACDKeychainManager_componentsFromKeychainServiceName_handler___block_invoke;
    v12[3] = &unk_264320B38;
    id v14 = v6;
    id v13 = v9;
    [a1 _accountTypeIdentifierFromComponents:v8 handler:v12];
  }
  else
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

void __64__ACDKeychainManager_componentsFromKeychainServiceName_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 length]
    && ([MEMORY[0x263EFB220] allIdentifiers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:v10],
        v6,
        (v7 & 1) != 0))
  {
    if ([v5 count])
    {
      id v8 = [v5 componentsJoinedByString:@"."];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_7;
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
LABEL_7:
}

+ (void)_accountTypeIdentifierFromComponents:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ACDKeychainManager__accountTypeIdentifierFromComponents_handler___block_invoke;
  v12[3] = &unk_264320B60;
  id v8 = v7;
  id v13 = v8;
  id v14 = v20;
  id v15 = &v16;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v12];
  if (*((unsigned char *)v17 + 24))
  {
    id v9 = [v8 componentsJoinedByString:@"."];
    uint64_t v10 = [v8 count];
    if (v10 == [v5 count])
    {
      v6[2](v6, v9, 0);
    }
    else
    {
      char v11 = objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - objc_msgSend(v8, "count"));
      ((void (**)(id, void *, void *))v6)[2](v6, v9, v11);
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __67__ACDKeychainManager__accountTypeIdentifierFromComponents_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:");
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && [v6 isEqualToString:@"com"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 isEqualToString:@"apple"];
}

+ (void)_migrateCredential:(id)a3 forAccount:(id)a4 clientID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  [a1 _saveCredential:v8 forAccount:v9 clientID:v10 error:&v18];
  id v11 = v18;
  if (!v11)
  {
    id v12 = (void *)MEMORY[0x263EFB268];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__ACDKeychainManager__migrateCredential_forAccount_clientID___block_invoke;
    v13[3] = &unk_264320B88;
    id v14 = v8;
    id v15 = v10;
    id v16 = v9;
    id v17 = a1;
    [v12 performWithinPersonaForAccount:v16 withBlock:v13];
  }
}

void __61__ACDKeychainManager__migrateCredential_forAccount_clientID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [*(id *)(a1 + 32) keysForCredentialItems];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8 * v5);
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 48) accountType];
        id v9 = [v8 identifier];
        id v10 = +[ACDKeychainManager keychainServiceNameForClientID:v7 accountTypeIdentifier:v9 additionalAccountTypeSegment:0 key:v6];

        if (![*(id *)(a1 + 48) credentialLocation])
        {
          id v11 = [*(id *)(a1 + 48) identifier];
          id v12 = [*(id *)(a1 + 56) _fetchOptionsForAccount:*(void *)(a1 + 48)];
          +[ACDKeychainManager _removeItemForService:v10 username:v11 accessGroup:0 options:v12 error:0];
        }
        uint64_t v13 = [*(id *)(a1 + 48) username];
        if (v13)
        {
          id v14 = (void *)v13;
          id v15 = [*(id *)(a1 + 48) username];
          id v16 = [*(id *)(a1 + 48) qualifiedUsername];
          char v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0)
          {
            id v18 = [*(id *)(a1 + 48) username];
            char v19 = [*(id *)(a1 + 56) _fetchOptionsForAccount:*(void *)(a1 + 48)];
            +[ACDKeychainManager _removeItemForService:v10 username:v18 accessGroup:0 options:v19 error:0];
          }
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }
}

+ (id)_itemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy_;
  long long v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy_;
  uint64_t v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  id v15 = (void *)_ac_keychainLock;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke;
  v22[3] = &unk_264320BB0;
  uint64_t v27 = &v35;
  id v16 = v11;
  id v23 = v16;
  id v17 = v12;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  id v19 = v14;
  id v26 = v19;
  id v28 = &v29;
  [v15 lockPerformForService:v16 username:v17 block:v22];
  if (a7) {
    *a7 = (id) v30[5];
  }
  id v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 4;
  uint64_t v2 = a1[4];
  uint64_t v5 = a1 + 5;
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  id v25 = 0;
  uint64_t v8 = +[ACDKeychain passwordForServiceName:v2 username:v4 accessGroup:v6 options:v7 error:&v25];
  id v9 = v25;
  uint64_t v10 = *(void *)(a1[8] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (*(void *)(*(void *)(a1[8] + 8) + 40)) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v16 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_1();
    }
  }
  else if (v9)
  {
    uint64_t v13 = [v9 code];
    if (v13 == -25308)
    {
      id v14 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_4();
      }
      uint64_t v15 = 10;
    }
    else if (v13 == -25300)
    {
      id v14 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_3();
      }
      uint64_t v15 = 11;
    }
    else
    {
      id v14 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = *v3;
        uint64_t v24 = *v5;
        *(_DWORD *)long long buf = 138412802;
        id v29 = v9;
        __int16 v30 = 2112;
        uint64_t v31 = v23;
        __int16 v32 = 2112;
        uint64_t v33 = v24;
        _os_log_debug_impl(&dword_2183AD000, v14, OS_LOG_TYPE_DEBUG, "Keychain fetch failed with error: %@ for item: %@.%@", buf, 0x20u);
      }
      uint64_t v15 = 12;
    }

    id v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263EFB070];
    v26[0] = *MEMORY[0x263F08320];
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to fetch credential from keychain (%ld)", objc_msgSend(v9, "code"));
    v26[1] = *MEMORY[0x263F08608];
    v27[0] = v16;
    v27[1] = v9;
    id v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v20 = [v17 errorWithDomain:v18 code:v15 userInfo:v19];
    uint64_t v21 = *(void *)(a1[9] + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  else
  {
    id v16 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_2();
    }
  }
}

+ (BOOL)_shouldSyncCredentialForAccount:(id)a3
{
  v23[25] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263EFAFD8];
  v23[0] = *MEMORY[0x263EFAED8];
  v23[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFAFC0];
  v23[2] = *MEMORY[0x263EFAFF8];
  v23[3] = v5;
  uint64_t v6 = *MEMORY[0x263EFAFD0];
  v23[4] = *MEMORY[0x263EFAEC0];
  v23[5] = v6;
  v23[6] = *MEMORY[0x263EFAFA0];
  v23[7] = @"com.apple.linkedin";
  uint64_t v7 = *MEMORY[0x263EFAFB0];
  v23[8] = *MEMORY[0x263EFAFB8];
  v23[9] = v7;
  uint64_t v8 = *MEMORY[0x263EFAE90];
  v23[10] = *MEMORY[0x263EFAE80];
  v23[11] = v8;
  uint64_t v9 = *MEMORY[0x263EFAF08];
  v23[12] = *MEMORY[0x263EFAE78];
  v23[13] = v9;
  uint64_t v10 = *MEMORY[0x263EFAF98];
  v23[14] = *MEMORY[0x263EFAF78];
  v23[15] = v10;
  uint64_t v11 = *MEMORY[0x263EFAFE0];
  v23[16] = *MEMORY[0x263EFAF40];
  v23[17] = v11;
  uint64_t v12 = *MEMORY[0x263EFAF10];
  v23[18] = *MEMORY[0x263EFAF18];
  v23[19] = v12;
  uint64_t v13 = *MEMORY[0x263EFAE38];
  v23[20] = *MEMORY[0x263EFAE50];
  v23[21] = v13;
  uint64_t v14 = *MEMORY[0x263EFAF88];
  v23[22] = *MEMORY[0x263EFAE40];
  v23[23] = v14;
  v23[24] = *MEMORY[0x263EFAF68];
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:25];
  id v16 = [v3 accountType];
  id v17 = [v16 identifier];
  if ([v15 containsObject:v17])
  {
    uint64_t v18 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFAD68]];
    if (v18)
    {
      LOBYTE(v19) = 0;
    }
    else
    {
      uint64_t v20 = [v3 accountPropertyForKey:@"mcPayloadUUID"];
      if (v20)
      {
        LOBYTE(v19) = 0;
      }
      else
      {
        uint64_t v21 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFAE20]];
        int v19 = [v21 BOOLValue] ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

+ (void)_setItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 options:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  uint64_t v41 = 0;
  __int16 v42 = &v41;
  uint64_t v43 = 0x3032000000;
  __int16 v44 = __Block_byref_object_copy_;
  id v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  long long v22 = (void *)_ac_keychainLock;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __120__ACDKeychainManager__setItem_forServiceName_username_accessGroup_accessibility_syncable_requiresTouchID_options_error___block_invoke;
  v30[3] = &unk_264320BD8;
  id v23 = v17;
  id v31 = v23;
  id v24 = v16;
  id v32 = v24;
  id v25 = v18;
  id v33 = v25;
  id v26 = v19;
  id v34 = v26;
  id v27 = v21;
  id v35 = v27;
  uint64_t v37 = &v41;
  id v38 = a1;
  id v28 = v20;
  id v36 = v28;
  BOOL v39 = a8;
  BOOL v40 = a9;
  [v22 lockPerformForService:v23 username:v25 block:v30];
  if (a11) {
    *a11 = (id) v42[5];
  }

  _Block_object_dispose(&v41, 8);
}

void __120__ACDKeychainManager__setItem_forServiceName_username_accessGroup_accessibility_syncable_requiresTouchID_options_error___block_invoke(uint64_t a1)
{
  v36[2] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) length]
    && [*(id *)(a1 + 40) length]
    && [*(id *)(a1 + 48) length])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v34 = 0;
    uint64_t v6 = +[ACDKeychain passwordForServiceName:v2 username:v3 accessGroup:v4 options:v5 error:&v34];
    id v7 = v34;
    uint64_t v8 = v7;
    if (v7 && [v7 code] != -25300)
    {
      id v18 = NSString;
      id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
      id v20 = [v18 stringWithFormat:@"Unable to fetch existing credential due to error %@", v19];

      id v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263EFB070];
      uint64_t v23 = *MEMORY[0x263F08608];
      v35[0] = *MEMORY[0x263F08320];
      v35[1] = v23;
      v36[0] = v20;
      v36[1] = v8;
      id v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      uint64_t v25 = [v21 errorWithDomain:v22 code:13 userInfo:v24];
      uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
      id v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
    else
    {
      uint64_t v9 = *(void **)(a1 + 88);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 72);
      if (v6)
      {
        uint64_t v15 = *(void *)(a1 + 64);
        uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
        id v33 = *(void **)(v16 + 40);
        objc_msgSend(v9, "_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:", v10, v6, v11, v12, v13, v14, v15, &v33);
        id v17 = v33;
      }
      else
      {
        uint64_t v28 = *(unsigned __int8 *)(a1 + 96);
        char v29 = *(unsigned char *)(a1 + 97);
        uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
        id v32 = *(void **)(v16 + 40);
        LOBYTE(v31) = v29;
        objc_msgSend(v9, "_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:", v10, v11, v12, v13, v14, v28, v31, &v32);
        id v17 = v32;
      }
      id v30 = v17;
      id v20 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v30;
    }
  }
}

+ (void)_keychainLock_updateItem:(id)a3 existingPassword:(id)a4 forServiceName:(id)a5 username:(id)a6 accessGroup:(id)a7 accessibility:(id)a8 options:(id)a9 error:(id *)a10
{
  v37[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (([a4 isEqualToString:v15] & 1) == 0)
  {
    id v21 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    uint64_t v22 = [v15 dataUsingEncoding:4];
    [v21 setObject:v22 forKey:*MEMORY[0x263F175A8]];
    if (v19)
    {
      uint64_t v23 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.4();
      }

      [v21 setObject:v19 forKey:*MEMORY[0x263F16E90]];
    }
    id v35 = 0;
    +[ACDKeychain updateItemForServiceName:v16 username:v17 accessGroup:v18 newValues:v21 options:v20 error:&v35];
    id v24 = v35;
    uint64_t v25 = _ACDKeychainLogSystem();
    uint64_t v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:]();
      }

      if (!a10) {
        goto LABEL_16;
      }
      id v27 = NSString;
      id v34 = v22;
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "code"));
      uint64_t v26 = [v27 stringWithFormat:@"Unable to store credential due to error %@", v28];

      id v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263EFB070];
      uint64_t v29 = *MEMORY[0x263F08608];
      v36[0] = *MEMORY[0x263F08320];
      v36[1] = v29;
      v37[0] = v26;
      v37[1] = v24;
      [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
      v31 = id v30 = v17;
      *a10 = [v33 errorWithDomain:v32 code:13 userInfo:v31];

      id v17 = v30;
      uint64_t v22 = v34;
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:]();
    }

LABEL_16:
    goto LABEL_17;
  }
  id v21 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:]();
  }
LABEL_17:
}

+ (void)_keychainLock_addItem:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6 accessibility:(id)a7 syncable:(BOOL)a8 requiresTouchID:(BOOL)a9 error:(id *)a10
{
  BOOL v10 = a8;
  v48[1] = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  if (v18 && !a9)
  {
    id v20 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[ACDKeychainManager _keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:].cold.4();
    }

    [v19 setObject:v18 forKey:*MEMORY[0x263F16E90]];
  }
  id v21 = (void *)MEMORY[0x263EFFB38];
  if (v10) {
    id v21 = (void *)MEMORY[0x263EFFB40];
  }
  [v19 setObject:*v21 forKey:*MEMORY[0x263F170B0]];
  if (!a9)
  {
LABEL_20:
    id v27 = [v42 dataUsingEncoding:4];
    id v43 = 0;
    +[ACDKeychain addItemWithServiceName:v15 username:v16 accessGroup:v17 passwordData:v27 options:v19 error:&v43];
    id v29 = v43;
    id v30 = _ACDKeychainLogSystem();
    uint64_t v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:]();
      }

      if (!a10) {
        goto LABEL_28;
      }
      id v41 = v15;
      uint64_t v32 = NSString;
      id v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "code"));
      uint64_t v31 = [v32 stringWithFormat:@"Unable to store credential due to error %@", v33];

      id v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263EFB070];
      uint64_t v36 = *MEMORY[0x263F08608];
      v45[0] = *MEMORY[0x263F08320];
      v45[1] = v36;
      v46[0] = v31;
      v46[1] = v29;
      [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
      id v37 = v17;
      BOOL v39 = v38 = v16;
      BOOL v40 = v34;
      id v15 = v41;
      *a10 = [v40 errorWithDomain:v35 code:13 userInfo:v39];

      id v16 = v38;
      id v17 = v37;
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:]();
    }

LABEL_28:
    goto LABEL_29;
  }
  CFErrorRef error = 0;
  SecAccessControlRef v22 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFTypeRef)*MEMORY[0x263F16EC8], 1uLL, &error);
  if (v22) {
    BOOL v23 = error == 0;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23)
  {
    SecAccessControlRef v28 = v22;
    [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x263F16E70]];

    goto LABEL_20;
  }
  id v24 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    +[ACDKeychainManager _keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:]();
  }

  if (error) {
    CFRelease(error);
  }
  if (a10)
  {
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263EFB070];
    uint64_t v47 = *MEMORY[0x263F08320];
    v48[0] = @"Unable to store credential due to error with SecAccessControlRef";
    id v27 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a10 = [v25 errorWithDomain:v26 code:13 userInfo:v27];
LABEL_29:
  }
}

+ (BOOL)_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v38 = 0;
  BOOL v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  id v16 = (void *)_ac_keychainLock;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __79__ACDKeychainManager__removeItemForService_username_accessGroup_options_error___block_invoke;
  v24[3] = &unk_264320C00;
  id v29 = &v38;
  id v31 = a1;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  id v30 = &v32;
  [v16 lockPerformForService:v17 username:v18 block:v24];
  id v21 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[ACDKeychainManager _removeItemForService:username:accessGroup:options:error:](v21);
  }

  if (a7) {
    *a7 = (id) v33[5];
  }
  char v22 = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __79__ACDKeychainManager__removeItemForService_username_accessGroup_options_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = (void *)a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = objc_msgSend(v6, "_keychainLock_removeItemForService:username:accessGroup:options:error:", v2, v3, v4, v5, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v8;
}

+ (BOOL)_keychainLock_removeItemForService:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 length] && objc_msgSend(v12, "length"))
  {
    if (a7) {
      *a7 = 0;
    }
    id v26 = 0;
    +[ACDKeychain removeItemForServiceName:v11 username:v12 accessGroup:v13 options:v14 error:&v26];
    id v15 = v26;
    BOOL v16 = v15 == 0;
    id v17 = _ACDKeychainLogSystem();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v18) {
        +[ACDKeychainManager _keychainLock_removeItemForService:username:accessGroup:options:error:]();
      }

      if (!a7) {
        goto LABEL_14;
      }
      id v19 = NSString;
      id v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "code"));
      id v17 = [v19 stringWithFormat:@"Unable to remove credential due to error %@", v20];

      id v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263EFB070];
      uint64_t v22 = *MEMORY[0x263F08608];
      v27[0] = *MEMORY[0x263F08320];
      v27[1] = v22;
      v28[0] = v17;
      v28[1] = v15;
      BOOL v23 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      *a7 = [v25 errorWithDomain:v21 code:14 userInfo:v23];
    }
    else if (v18)
    {
      *(_DWORD *)long long buf = 138412802;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_debug_impl(&dword_2183AD000, v17, OS_LOG_TYPE_DEBUG, "Keychain item removal succeeded for item service:%@ username:%@ group:%@", buf, 0x20u);
    }

LABEL_14:
    goto LABEL_15;
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

+ (void)_createNoSyncOAuthTokens:(id)a3 account:(id)a4 clientID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 credentialType];
  if ([v11 isEqualToString:*MEMORY[0x263EFB040]])
  {
    id v12 = [v8 oauthToken];

    if (v12)
    {
      id v13 = [v8 oauthToken];
      [v8 setOauthTokenNoSync:v13];
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v13 = [v8 credentialType];
  if ([v13 isEqualToString:*MEMORY[0x263EFB038]])
  {
    uint64_t v14 = [v8 oauthToken];
    if (v14)
    {
      id v15 = (void *)v14;
      BOOL v16 = [v8 oauthTokenSecret];

      if (!v16) {
        goto LABEL_10;
      }
      id v17 = NSString;
      id v13 = [v8 oauthToken];
      uint64_t v18 = *MEMORY[0x263EFB0E8];
      id v19 = [v8 oauthTokenSecret];
      id v20 = [v17 stringWithFormat:@"%@%@%@", v13, v18, v19];
      [v8 setOauthTokenNoSync:v20];
    }
  }
LABEL_9:

LABEL_10:
  uint64_t v21 = [v8 oauthTokenNoSync];

  if (v21)
  {
    uint64_t v22 = 0;
    [a1 _saveCredential:v8 forAccount:v9 clientID:v10 error:&v22];
  }
}

+ (void)_fallbackToUnsyncedOAuthTokens:(id)a3
{
  id v15 = a3;
  uint64_t v5 = [v15 oauthTokenNoSync];
  if (v5)
  {
    uint64_t v6 = [v15 credentialType];
    if ([v6 isEqualToString:*MEMORY[0x263EFB040]])
    {
      uint64_t v7 = [v15 oauthToken];

      if (!v7)
      {
        [v15 setOauthToken:v5];
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v8 = [v15 credentialType];
    if ([v8 isEqualToString:*MEMORY[0x263EFB038]])
    {
      uint64_t v9 = [v15 oauthToken];
      if (v9)
      {
        id v10 = (void *)v9;
        id v11 = [v15 oauthTokenSecret];

        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v8 = [v5 componentsSeparatedByString:*MEMORY[0x263EFB0E8]];
      if ([v8 count] != 2)
      {
        uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
        [v14 handleFailureInMethod:a2 object:a1 file:@"ACDKeychainManager.m" lineNumber:939 description:@"*** _fallbackToUnsyncedOAuthTokens: bad format"];
      }
      id v12 = [v8 objectAtIndexedSubscript:0];
      [v15 setOauthToken:v12];

      id v13 = [v8 objectAtIndexedSubscript:1];
      [v15 setOauthTokenSecret:v13];
    }
  }
LABEL_15:
}

+ (BOOL)createAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6
{
  return 0;
}

+ (BOOL)createAccountSyncMigratedItemWithError:(id *)a3
{
  return 0;
}

+ (BOOL)removeAccountSyncItemForAccount:(id)a3 clientID:(id)a4 properties:(id)a5 error:(id *)a6
{
  return 0;
}

+ (id)removeTombstonesForAccount:(id)a3 clientID:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)accountSyncMigrated
{
  return 1;
}

+ (id)accountSynciOSVersion
{
  return 0;
}

+ (id)keychainAccounts
{
  return 0;
}

+ (id)keychainHostnameAccounts
{
  return 0;
}

+ (id)keychainDeletedContactAccounts
{
  return 0;
}

+ (id)keychainDeletedAccounts
{
  return 0;
}

+ (id)keychainDeletedHostnameAccounts
{
  return 0;
}

+ (void)notifiyCredentialChangedForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() server];
  [v4 credentialsDidChangeForAccount:v3];
}

+ (void)credentialForAccount:clientID:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "credentialForAccount is returning %@", v2, v3, v4, v5, v6);
}

+ (void)credentialForAccount:clientID:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "credentialForAccount encountered an error: %@", v1, 0xCu);
}

+ (void)credentialForAccount:clientID:error:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Client %@ is asking for the credential for account %@");
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Credential fetch failed for UUID. Will try again with username instead of qualifiedUserName or UUID. Error: %@", v2, v3, v4, v5, v6);
}

void __58__ACDKeychainManager_credentialForAccount_clientID_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Credential fetch failed with primary id. Will try again with secondary id. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "ACDKeychainManager credentialForAccountWithID is returning %@", v2, v3, v4, v5, v6);
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2183AD000, v0, v1, "No supported credential item keys for accountType: %@ credentialType: %@");
}

+ (void)_credentialForAccountWithID:accountTypeID:credentialType:clientID:allowAdditionalAccountTypeSegment:options:error:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "ACDKeychainManager is fetching credential for account %@ and client ID %@.");
}

+ (void)_setCredentialForAccount:(os_log_t)log clientID:handleCredentialItemRemovals:error:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "Finished setting account credential", v1, 2u);
}

+ (void)_setNonPersistentCredentialTimerForAccount:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Queuing non-persistent credential removal, account: %@", v2, v3, v4, v5, v6);
}

+ (void)removeCredentialForAccount:clientID:error:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  __int16 v2 = 1026;
  int v3 = 453;
  _os_log_debug_impl(&dword_2183AD000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d is returning", v1, 0x12u);
}

+ (void)removeCredentialForAccount:(uint64_t)a1 clientID:(uint64_t)a2 error:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136381443;
  uint64_t v4 = "+[ACDKeychainManager removeCredentialForAccount:clientID:error:]";
  __int16 v5 = 1026;
  int v6 = 432;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)&v3, 0x26u);
}

+ (void)_removeCredentialsForAccount:clientID:options:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Removing account credential for client: %@", v2, v3, v4, v5, v6);
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Keychain fetch succeeded for item: %@.%@");
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Keychain fetch succeeded with empty results for item: %@.%@");
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Keychain fetch found no match for item: %@.%@");
}

void __77__ACDKeychainManager__itemForServiceName_username_accessGroup_options_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Keychain fetch denied for item: %@.%@");
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Password/Token hasn't changed. Not updating keychain for %@", v2, v3, v4, v5, v6);
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Keychain update succeeded for item %@", v2, v3, v4, v5, v6);
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2183AD000, v0, v1, "Keychain update failed with error: %@ for item: %@");
}

+ (void)_keychainLock_updateItem:existingPassword:forServiceName:username:accessGroup:accessibility:options:error:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Setting item accessibility to: %@ for serviceName: %@");
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "Unable to create SecAccessControlRef on item that requires Touch ID. Error: %@", v1, 0xCu);
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Keychain add succeeded for item %@", v2, v3, v4, v5, v6);
}

+ (void)_keychainLock_addItem:forServiceName:username:accessGroup:accessibility:syncable:requiresTouchID:error:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2183AD000, v0, v1, "Keychain add failed with error: %@ for item: %@");
}

+ (void)_removeItemForService:(os_log_t)log username:accessGroup:options:error:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "_removeItemForService - Exit.", v1, 2u);
}

+ (void)_keychainLock_removeItemForService:username:accessGroup:options:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2183AD000, v0, v1, "Keychain item removal failed for item %@: %@");
}

@end