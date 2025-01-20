@interface VSAccountStore
+ (Class)accountClass;
+ (id)sharedAccountStore;
- (BOOL)_insertAccount:(id)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)_updateCachedFirstAccount;
- (BOOL)isFirstAccountLoaded;
- (BOOL)needsUpdateCachedFirstAccount;
- (NSArray)accounts;
- (NSOperationQueue)keychainQueue;
- (NSUndoManager)undoManager;
- (VSAccount)cachedFirstAccount;
- (VSAccountStore)init;
- (VSKeychainEditingContext)keychainEditingContext;
- (VSPreferences)preferences;
- (VSRemoteNotifier)remoteNotifier;
- (id)_accountForKeychainItem:(id)a3;
- (id)_keychainItemsWithLimit:(unint64_t)a3;
- (id)_uniqueIdentifierForKeychainItem:(id)a3;
- (id)changeObserver;
- (id)firstAccount;
- (id)firstAccountIfLoaded;
- (void)_fetchAccountsSimulatingExpiredToken:(BOOL)a3 forProviderIDs:(id)a4 completion:(id)a5;
- (void)_insertLegacyKeychainItemForAccount:(id)a3 context:(id)a4;
- (void)_insertModernKeychainItemForAccount:(id)a3 context:(id)a4;
- (void)_sendLocalNotification;
- (void)_sendRemoteNotification;
- (void)dealloc;
- (void)fetchAccountsWithCompletionHandler:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)removeAccounts:(id)a3 withCompletionHandler:(id)a4;
- (void)saveAccounts:(id)a3 withCompletionHandler:(id)a4;
- (void)setCachedFirstAccount:(id)a3;
- (void)setChangeObserver:(id)a3;
- (void)setKeychainEditingContext:(id)a3;
- (void)setKeychainQueue:(id)a3;
- (void)setNeedsUpdateCachedFirstAccount:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation VSAccountStore

+ (id)sharedAccountStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VSAccountStore_sharedAccountStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedAccountStore___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedAccountStore___vs_lazy_init_predicate, block);
  }
  v2 = (void *)sharedAccountStore___vs_lazy_init_variable;

  return v2;
}

uint64_t __36__VSAccountStore_sharedAccountStore__block_invoke()
{
  sharedAccountStore___vs_lazy_init_variable = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (VSAccountStore)init
{
  v19.receiver = self;
  v19.super_class = (Class)VSAccountStore;
  v2 = [(VSAccountStore *)&v19 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSKeychainEditingContext);
    keychainEditingContext = v2->_keychainEditingContext;
    v2->_keychainEditingContext = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = v5;

    [(NSOperationQueue *)v2->_keychainQueue setName:@"VSAccountStore"];
    [(NSOperationQueue *)v2->_keychainQueue setMaxConcurrentOperationCount:1];
    v7 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSAccountStoreDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v7;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
    v9 = objc_alloc_init(VSPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v2);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __22__VSAccountStore_init__block_invoke;
    v16[3] = &unk_1E6BD29D0;
    objc_copyWeak(&v17, &location);
    v12 = [v11 addObserverForName:@"VSAccountStoreDidChangeNotification" object:0 queue:0 usingBlock:v16];
    objc_storeWeak(&v2->_changeObserver, v12);

    v2->_needsUpdateCachedFirstAccount = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __22__VSAccountStore_init__block_invoke_47;
    v14[3] = &unk_1E6BD29A8;
    v15 = v2;
    VSPerformBlockOnMainThread(v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__VSAccountStore_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 object];

    if (v5 != WeakRetained)
    {
      v6 = VSDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Received local account store notification from another instance.", buf, 2u);
      }

      [WeakRetained setNeedsUpdateCachedFirstAccount:1];
      if (([WeakRetained isFirstAccountLoaded] & 1) == 0)
      {
        v7 = [WeakRetained keychainQueue];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __22__VSAccountStore_init__block_invoke_45;
        v8[3] = &unk_1E6BD29A8;
        id v9 = WeakRetained;
        [v7 addOperationWithBlock:v8];
      }
    }
  }
}

void __22__VSAccountStore_init__block_invoke_45(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Will update cached first account.", buf, 2u);
  }

  if ([*(id *)(a1 + 32) _updateCachedFirstAccount])
  {
    id v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Cached first account actually changed.", v4, 2u);
    }
  }
}

void __22__VSAccountStore_init__block_invoke_47(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFirstAccountLoaded] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) keychainQueue];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __22__VSAccountStore_init__block_invoke_2;
    v3[3] = &unk_1E6BD29A8;
    id v4 = *(id *)(a1 + 32);
    [v2 addOperationWithBlock:v3];
  }
}

void __22__VSAccountStore_init__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _updateCachedFirstAccount])
  {
    v1 = VSDefaultLogObject();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1DA674000, v1, OS_LOG_TYPE_DEFAULT, "After initialization, update revealed existing account.", v2, 2u);
    }
  }
}

+ (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained(&self->_changeObserver);
  if (WeakRetained) {
    [v3 removeObserver:WeakRetained];
  }

  v5.receiver = self;
  v5.super_class = (Class)VSAccountStore;
  [(VSAccountStore *)&v5 dealloc];
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  objc_super v5 = [(VSAccountStore *)self keychainQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__VSAccountStore_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke;
  v6[3] = &unk_1E6BD29A8;
  v6[4] = self;
  [v5 addOperationWithBlock:v6];
}

uint64_t __74__VSAccountStore_remoteNotifier_didReceiveRemoteNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedFirstAccount];
}

- (void)_sendLocalNotification
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will send local account store change notificaiton.", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"VSAccountStoreDidChangeNotification" object:self];
  objc_super v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Did send local account store change notificaiton.", v6, 2u);
  }
}

- (void)_sendRemoteNotification
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Will send remote account store change notificaiton.", buf, 2u);
  }

  id v4 = [(VSAccountStore *)self remoteNotifier];
  [v4 postNotification];

  objc_super v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Did send remote account store change notificaiton.", v6, 2u);
  }
}

- (id)_uniqueIdentifierForKeychainItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(VSAccountStore *)self _accountForKeychainItem:v4];
  v6 = [v5 identityProviderID];
  v7 = [v6 forceUnwrapObject];
  uint64_t v8 = [v7 hash];
  id v9 = [v4 creationDate];

  uint64_t v10 = [v9 hash] ^ v8;
  v11 = [NSNumber numberWithUnsignedInteger:v10];

  return v11;
}

- (id)_accountForKeychainItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  v6 = VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  id v7 = objc_alloc_init((Class)[(id)objc_opt_class() accountClass]);
  [v7 setAccountStore:self];
  uint64_t v8 = [v4 creatorCode];
  int v9 = [v8 isEqual:v5];

  if (v9)
  {
    uint64_t v10 = [v4 generic];
    v11 = (void *)[v10 copy];

    [v7 setLegacyKeychainItem:v4];
    v12 = [v4 account];
    [v7 setUsername:v12];

    v13 = [v4 comment];
    [v7 setPreferredAppID:v13];

    v14 = [v4 service];
    v15 = (void *)[v14 copy];
    v16 = +[VSOptional optionalWithObject:v15];
    [v7 setOptionalIdentityProviderDisplayName:v16];

    id v17 = +[VSOptional optionalWithObject:v11];
    [v7 setIdentityProviderID:v17];

    objc_msgSend(v7, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
    v18 = [v4 typeCode];
    objc_super v19 = VSNumberForFourCharCode(0x6174684Eu);
    LODWORD(v15) = [v18 isEqual:v19];

    if (v15
      || (VSNumberForFourCharCode(0x746F6B4Eu),
          v40 = objc_claimAutoreleasedReturnValue(),
          int v41 = [v18 isEqual:v40],
          v40,
          v41))
    {
      v42 = (objc_class *)objc_opt_class();
    }
    else
    {
      v44 = VSErrorLogObject();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[VSAccountStore _accountForKeychainItem:]();
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected token type code when deserializing account from keychain."];
      v42 = 0;
    }
    v45 = [v4 data];
    if (v45)
    {
      v46 = [[v42 alloc] initWithSerializedData:v45];
      v47 = +[VSOptional optionalWithObject:v46];
      [v7 setAuthenticationToken:v47];
    }
    else
    {
      v46 = VSErrorLogObject();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
        -[VSAccountStore _accountForKeychainItem:]();
      }
    }

LABEL_39:
    goto LABEL_40;
  }
  v20 = [v4 creatorCode];
  int v21 = [v20 isEqual:v6];

  if (v21)
  {
    v22 = [v4 data];

    if (!v22) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [keychainItem data] parameter must not be nil."];
    }
    v11 = [v4 data];
    id v58 = 0;
    v23 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v58];
    id v24 = v58;
    if (v23)
    {
      v57 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v26 = *MEMORY[0x1E4F1C3C8];
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        [v25 raise:v26, @"Unexpectedly, result was %@, instead of NSDictionary.", v28 format];
      }
      id v29 = v23;
      [v7 setKeychainItem:v4];
      v30 = [v29 objectForKey:@"u"];
      [v7 setUsername:v30];

      v31 = [v29 objectForKey:@"paid"];
      [v7 setPreferredAppID:v31];

      v32 = [v29 objectForKey:@"dn"];
      v33 = +[VSOptional optionalWithObject:v32];
      [v7 setOptionalIdentityProviderDisplayName:v33];

      v34 = [v29 objectForKey:@"pid"];
      v35 = +[VSOptional optionalWithObject:v34];
      [v7 setIdentityProviderID:v35];

      v36 = [v29 objectForKey:@"lhash"];
      [v7 setLegacyItemHash:v36];

      objc_msgSend(v7, "setSynchronizable:", objc_msgSend(v4, "isSynchronizable"));
      v37 = [v29 objectForKey:@"channels"];
      [v7 setChannelsData:v37];

      v38 = [v29 objectForKey:@"proto"];

      if (!v38) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [accountData objectForKey:VSAccountKeychainKeyScheme] parameter must not be nil."];
      }
      v39 = [v29 objectForKey:@"proto"];
      id v56 = v24;
      if ([v39 isEqual:@"api"]
        || [v39 isEqual:@"saml"])
      {
        v49 = (objc_class *)objc_opt_class();
      }
      else
      {
        v50 = VSErrorLogObject();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[VSAccountStore _accountForKeychainItem:].cold.4();
        }

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected scheme when decoding account from 2.0 keychain item."];
        v49 = 0;
      }
      v51 = [v29 objectForKey:@"data"];

      if (!v51) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [accountData objectForKey:VSAccountKeychainKeyTokenData] parameter must not be nil."];
      }
      v52 = [v29 objectForKey:@"data"];
      v53 = (void *)[[v49 alloc] initWithSerializedData:v52];
      v54 = +[VSOptional optionalWithObject:v53];
      [v7 setAuthenticationToken:v54];

      id v24 = v56;
      v11 = v57;
    }
    else
    {
      v48 = VSErrorLogObject();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[VSAccountStore _accountForKeychainItem:]();
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to deserialize account data from keychain item data."];
    }

    goto LABEL_39;
  }
  v43 = VSErrorLogObject();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    -[VSAccountStore _accountForKeychainItem:].cold.5(v4, v43);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected creator code when deserialziing account from keychain item."];
LABEL_40:

  return v7;
}

- (void)_fetchAccountsSimulatingExpiredToken:(BOOL)a3 forProviderIDs:(id)a4 completion:(id)a5
{
  BOOL v80 = a3;
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v81 = a4;
  id v82 = a5;
  v6 = [MEMORY[0x1E4F28F08] currentQueue];
  id v7 = [(VSAccountStore *)self keychainQueue];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected operation queue for account fetch."];
  }
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x3032000000;
  v139 = __Block_byref_object_copy_;
  v140 = __Block_byref_object_dispose_;
  id v141 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x3032000000;
  v133 = __Block_byref_object_copy_;
  v134 = __Block_byref_object_dispose_;
  id v135 = 0;
  int v9 = [(VSAccountStore *)self _keychainItemsWithLimit:0];
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke;
  v129[3] = &unk_1E6BD29F8;
  v129[4] = &v136;
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2;
  v128[3] = &unk_1E6BD2A20;
  v128[4] = &v130;
  [v9 unwrapObject:v129 error:v128];

  if (v131[5])
  {
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_3;
    v125[3] = &unk_1E6BD2A48;
    id v126 = v82;
    v127 = &v130;
    VSPerformCompletionHandler(v125);
    uint64_t v10 = v126;
  }
  else
  {
    v11 = VSDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v137[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v146 = v12;
      _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Fetched keychain items: %@", buf, 0xCu);
    }

    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v84 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v14 = (id)v137[5];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v150 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v122;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v122 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v121 + 1) + 8 * i);
          objc_super v19 = [v18 data];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            int v21 = VSErrorLogObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v146 = (uint64_t)v18;
              _os_log_fault_impl(&dword_1DA674000, v21, OS_LOG_TYPE_FAULT, "Invalid keychain item found: %@", buf, 0xCu);
            }

            [v13 addObject:v18];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v150 count:16];
      }
      while (v15);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v22 = (id)v137[5];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v117 objects:v149 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v118;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v118 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void **)(*((void *)&v117 + 1) + 8 * j);
          if (([v13 containsObject:v26] & 1) == 0)
          {
            v27 = [(VSAccountStore *)self _uniqueIdentifierForKeychainItem:v26];
            v28 = [v26 creatorCode];
            id v29 = VSNumberForFourCharCode(VSKeychainItemCreatorCode);
            char v30 = [v28 isEqual:v29];

            v31 = v85;
            if (v30) {
              goto LABEL_26;
            }
            v32 = [v26 creatorCode];
            v33 = VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
            int v34 = [v32 isEqual:v33];

            v31 = v84;
            if (v34)
            {
LABEL_26:
              [v31 setObject:v26 forKey:v27];
            }
            else
            {
              v35 = VSErrorLogObject();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v146 = (uint64_t)v26;
                _os_log_error_impl(&dword_1DA674000, v35, OS_LOG_TYPE_ERROR, "Fetched keychain item with unexpected type code: %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v117 objects:v149 count:16];
      }
      while (v23);
    }

    v36 = VSDefaultLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [v84 count];
      uint64_t v38 = [v85 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v146 = v37;
      __int16 v147 = 2048;
      uint64_t v148 = v38;
      _os_log_impl(&dword_1DA674000, v36, OS_LOG_TYPE_DEFAULT, "Fetched %lu modern items and %lu legacy items", buf, 0x16u);
    }

    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((unint64_t)[v85 count] >= 2)
    {
      int v41 = VSDefaultLogObject();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA674000, v41, OS_LOG_TYPE_DEFAULT, "deduplicating legacy items.", buf, 2u);
      }

      v42 = [v85 allValues];
      v43 = (void *)[v42 mutableCopy];

      [v43 sortUsingComparator:&__block_literal_global_3];
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_98;
      v115[3] = &unk_1E6BD2A90;
      id v116 = v13;
      [v43 enumerateObjectsUsingBlock:v115];
    }
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_100;
    v109[3] = &unk_1E6BD2AB8;
    v109[4] = self;
    id v44 = v78;
    id v110 = v44;
    id v77 = v85;
    id v111 = v77;
    id v86 = v13;
    id v112 = v86;
    id v45 = v40;
    id v113 = v45;
    id v46 = v39;
    id v114 = v46;
    [v84 enumerateKeysAndObjectsUsingBlock:v109];
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_111;
    v105[3] = &unk_1E6BD2AE0;
    v105[4] = self;
    id v76 = v44;
    id v106 = v76;
    id v83 = v45;
    id v107 = v83;
    id v79 = v46;
    id v108 = v79;
    [v77 enumerateKeysAndObjectsUsingBlock:v105];
    [v83 sortUsingComparator:&__block_literal_global_115];
    if ([v86 count] || objc_msgSend(v79, "count", v76))
    {
      v47 = VSDefaultLogObject();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = [v86 count];
        uint64_t v49 = [v79 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v146 = v48;
        __int16 v147 = 2048;
        uint64_t v148 = v49;
        _os_log_impl(&dword_1DA674000, v47, OS_LOG_TYPE_DEFAULT, "finished processing keychain items (delete=%lu modernize=%lu)", buf, 0x16u);
      }

      v50 = [(VSAccountStore *)self keychainEditingContext];
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v51 = v86;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v101 objects:v144 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v102;
        do
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (*(void *)v102 != v53) {
              objc_enumerationMutation(v51);
            }
            objc_msgSend(v50, "deleteItem:", *(void *)(*((void *)&v101 + 1) + 8 * k), v76);
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v101 objects:v144 count:16];
        }
        while (v52);
      }

      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v55 = v79;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v97 objects:v143 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v98;
        do
        {
          for (uint64_t m = 0; m != v56; ++m)
          {
            if (*(void *)v98 != v57) {
              objc_enumerationMutation(v55);
            }
            -[VSAccountStore _insertModernKeychainItemForAccount:context:](self, "_insertModernKeychainItemForAccount:context:", *(void *)(*((void *)&v97 + 1) + 8 * m), v50, v76);
          }
          uint64_t v56 = [v55 countByEnumeratingWithState:&v97 objects:v143 count:16];
        }
        while (v56);
      }

      v59 = (id *)(v131 + 5);
      obuint64_t j = (id)v131[5];
      [v50 save:&obj];
      objc_storeStrong(v59, obj);
    }
    if (v80 && [v81 count])
    {
      if (!v81) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The providerIDsOrNil parameter must not be nil."];
      }
      id v60 = v81;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v61 = v83;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v92 objects:v142 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v93;
        do
        {
          for (uint64_t n = 0; n != v62; ++n)
          {
            if (*(void *)v93 != v63) {
              objc_enumerationMutation(v61);
            }
            v65 = *(void **)(*((void *)&v92 + 1) + 8 * n);
            v66 = objc_msgSend(v65, "identityProviderID", v76);
            v67 = [v66 forceUnwrapObject];
            int v68 = [v60 containsObject:v67];

            if (v68)
            {
              v69 = VSDefaultLogObject();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v146 = (uint64_t)v65;
                _os_log_impl(&dword_1DA674000, v69, OS_LOG_TYPE_DEFAULT, "simulate expired token enabled, mutating token expiration for account: %@", buf, 0xCu);
              }

              v70 = [v65 authenticationToken];
              v71 = [v70 forceUnwrapObject];

              v72 = [MEMORY[0x1E4F1C9C8] distantPast];
              [v71 setExpirationDate:v72];
            }
          }
          uint64_t v62 = [v61 countByEnumeratingWithState:&v92 objects:v142 count:16];
        }
        while (v62);
      }
    }
    v73 = VSDefaultLogObject();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = v131[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v146 = (uint64_t)v83;
      __int16 v147 = 2112;
      uint64_t v148 = v74;
      _os_log_impl(&dword_1DA674000, v73, OS_LOG_TYPE_DEFAULT, "fetched accounts: %@ with error: %@", buf, 0x16u);
    }

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_120;
    v88[3] = &unk_1E6BD2B28;
    id v90 = v82;
    id v75 = v83;
    id v89 = v75;
    v91 = &v130;
    VSPerformCompletionHandler(v88);

    uint64_t v10 = v77;
  }

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v136, 8);
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke(uint64_t a1, void *a2)
{
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 modificationDate];
  id v7 = [v5 modificationDate];
  if (v7)
  {
    if (v6)
    {
LABEL_3:
      uint64_t v8 = [v7 compare:v6];
      goto LABEL_10;
    }
  }
  else
  {
    int v9 = VSErrorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_93_cold_1();
    }

    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = VSErrorLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_93_cold_1();
  }

  uint64_t v8 = 1;
LABEL_10:

  return v8;
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_98(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will mark duplicate legacy keychain item for deletion: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_100(id *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1[4] _accountForKeychainItem:v4];
  v6 = [v5 legacyItemHash];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [account legacyItemHash] parameter must not be nil."];
  }
  int v7 = [v5 legacyItemHash];
  [a1[5] addObject:v7];
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "modern keychain item has legacy equivalent with hash %@", (uint8_t *)&v26, 0xCu);
  }

  uint64_t v9 = [a1[6] objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
    if ([a1[7] containsObject:v11])
    {
      uint64_t v12 = VSDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1DA674000, v12, OS_LOG_TYPE_DEFAULT, "Modern item has legacy item marked for deletion, deleting modern item.", (uint8_t *)&v26, 2u);
      }

      [a1[7] addObject:v4];
    }
    else
    {
      [v5 setLegacyKeychainItem:v11];
      [a1[8] addObject:v5];
      id v14 = [a1[4] _accountForKeychainItem:v11];
      uint64_t v15 = [v14 contentsHash];
      if (v15 != [v5 contentsHash])
      {
        uint64_t v16 = VSDefaultLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Legacy keychain item and modern keychain item contents do not match.", (uint8_t *)&v26, 2u);
        }

        id v17 = [v4 modificationDate];
        v18 = [v11 modificationDate];

        if (!v18) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [legacyItem modificationDate] parameter must not be nil."];
        }
        objc_super v19 = [v11 modificationDate];
        int v20 = objc_msgSend(v17, "vs_isBefore:", v19);

        int v21 = VSDefaultLogObject();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v20)
        {
          if (v22)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1DA674000, v21, OS_LOG_TYPE_DEFAULT, "Legacy keychain item has the most recent values, preferring them over the modern item values.", (uint8_t *)&v26, 2u);
          }

          uint64_t v23 = [v14 authenticationToken];
          [v5 setAuthenticationToken:v23];

          uint64_t v24 = [v14 preferredAppID];
          [v5 setPreferredAppID:v24];

          v25 = [v14 username];
          [v5 setUsername:v25];

          [a1[9] addObject:v5];
        }
        else
        {
          if (v22)
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1DA674000, v21, OS_LOG_TYPE_DEFAULT, "Modern keychain item has the most recent values, keeping them.", (uint8_t *)&v26, 2u);
          }
        }
      }
    }
  }
  else
  {
    id v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Modern item without legacy item found, assuming sign out from legacy device.", (uint8_t *)&v26, 2u);
    }

    [a1[7] addObject:v4];
  }
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_111(id *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1[4] _uniqueIdentifierForKeychainItem:v4];
  v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v4 creationDate];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "legacy keychain item has hash %@ (cdat=%@)", (uint8_t *)&v10, 0x16u);
  }
  if (([a1[5] containsObject:v5] & 1) == 0)
  {
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Legacy keychain item found without matching modern item.", (uint8_t *)&v10, 2u);
    }

    uint64_t v9 = [a1[4] _accountForKeychainItem:v4];
    [a1[6] addObject:v9];
    [a1[7] addObject:v9];
  }
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 effectiveModificationDate];
  v6 = [v4 effectiveModificationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_120(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_insertModernKeychainItemForAccount:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 keychainItem];
  if (!v8)
  {
    uint64_t v9 = [VSKeychainGenericPassword alloc];
    int v10 = VSKeychainItemKindGenericPassword();
    id v8 = [(VSKeychainItem *)v9 initWithItemKind:v10 insertIntoEditingContext:v7];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keychainItemOrNil parameter must not be nil."];
    }
  }
  id v11 = v8;
  [v6 setKeychainItem:v11];
  [(VSKeychainGenericPassword *)v11 setAccessGroup:@"com.apple.VideoSubscriberAccount"];
  __int16 v12 = VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  [(VSKeychainGenericPassword *)v11 setCreatorCode:v12];

  id v13 = [v6 username];
  [(VSKeychainGenericPassword *)v11 setAccount:v13];

  -[VSKeychainGenericPassword setSynchronizable:](v11, "setSynchronizable:", [v6 isSynchronizable]);
  [(VSKeychainGenericPassword *)v11 setViewHint:*MEMORY[0x1E4F3B8E8]];
  uint64_t v14 = VSNumberForFourCharCode(0x746F6B32u);
  [(VSKeychainGenericPassword *)v11 setTypeCode:v14];

  uint64_t v15 = NSString;
  uint64_t v16 = [v6 optionalIdentityProviderDisplayName];
  id v17 = [v16 forceUnwrapObject];
  v18 = [v15 stringWithFormat:@"TV Provider: %@", v17];

  [(VSKeychainGenericPassword *)v11 setService:v18];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v20 = [v6 username];
  [v19 setObject:v20 forKeyedSubscript:@"u"];

  int v21 = [v6 identityProviderID];
  BOOL v22 = [v21 forceUnwrapObject];
  [v19 setObject:v22 forKeyedSubscript:@"pid"];

  uint64_t v23 = [v6 identityProviderDisplayName];
  [v19 setObject:v23 forKeyedSubscript:@"dn"];

  uint64_t v24 = [v6 preferredAppID];
  [v19 setObject:v24 forKeyedSubscript:@"paid"];

  v25 = [v6 authenticationToken];
  int v26 = [v25 forceUnwrapObject];
  v27 = [v26 serializedData];
  [v19 setObject:v27 forKeyedSubscript:@"data"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isSynchronizable"));
  [v19 setObject:v28 forKeyedSubscript:@"sync"];

  id v29 = [v6 channelsData];
  [v19 setObject:v29 forKeyedSubscript:@"channels"];

  char v30 = [v6 legacyKeychainItem];
  v31 = [(VSAccountStore *)self _uniqueIdentifierForKeychainItem:v30];

  [v6 setLegacyItemHash:v31];
  [v19 setObject:v31 forKeyedSubscript:@"lhash"];
  v32 = [v6 authenticationToken];
  v33 = [v32 forceUnwrapObject];
  LODWORD(v27) = [v33 isOpaque];

  if (v27) {
    int v34 = @"api";
  }
  else {
    int v34 = @"saml";
  }
  [v19 setObject:v34 forKeyedSubscript:@"proto"];
  v35 = [v6 authenticationToken];
  v36 = [v35 forceUnwrapObject];
  uint64_t v37 = [v36 serializedData];
  [v19 setObject:v37 forKeyedSubscript:@"data"];

  id v41 = 0;
  uint64_t v38 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v19 format:200 options:0 error:&v41];
  id v39 = v41;
  if (!v38)
  {
    id v40 = VSErrorLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[VSAccountStore _insertModernKeychainItemForAccount:context:]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error serializing account to property list."];
  }
  [(VSKeychainItem *)v11 setData:v38];
}

- (void)_insertLegacyKeychainItemForAccount:(id)a3 context:(id)a4
{
  id v23 = a3;
  id v5 = a4;
  id v6 = [v23 legacyKeychainItem];
  if (!v6)
  {
    id v7 = [VSKeychainGenericPassword alloc];
    id v8 = VSKeychainItemKindGenericPassword();
    id v6 = [(VSKeychainItem *)v7 initWithItemKind:v8 insertIntoEditingContext:v5];

    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keychainItemOrNil parameter must not be nil."];
    }
  }
  uint64_t v9 = v6;
  [v23 setLegacyKeychainItem:v9];
  [(VSKeychainGenericPassword *)v9 setAccessGroup:@"com.apple.VideoSubscriberAccount"];
  int v10 = VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  [(VSKeychainGenericPassword *)v9 setCreatorCode:v10];

  id v11 = [v23 accountDescription];
  [(VSKeychainGenericPassword *)v9 setLabel:v11];

  __int16 v12 = [v23 username];
  if ([v12 length]) {
    [(VSKeychainGenericPassword *)v9 setAccount:v12];
  }
  id v13 = [v23 preferredAppID];
  [(VSKeychainGenericPassword *)v9 setComment:v13];

  uint64_t v14 = [v23 optionalIdentityProviderDisplayName];
  uint64_t v15 = [v14 forceUnwrapObject];
  [(VSKeychainGenericPassword *)v9 setService:v15];

  uint64_t v16 = [v23 identityProviderID];
  id v17 = [v16 forceUnwrapObject];
  [(VSKeychainGenericPassword *)v9 setGeneric:v17];

  v18 = [v23 authenticationToken];
  id v19 = [v18 forceUnwrapObject];

  if ([v19 isOpaque]) {
    unsigned int v20 = 1953459022;
  }
  else {
    unsigned int v20 = 1635018830;
  }
  int v21 = VSNumberForFourCharCode(v20);
  [(VSKeychainGenericPassword *)v9 setTypeCode:v21];

  BOOL v22 = [v19 serializedData];
  if ([v22 length]) {
    [(VSKeychainItem *)v9 setData:v22];
  }
  -[VSKeychainGenericPassword setSynchronizable:](v9, "setSynchronizable:", [v23 isSynchronizable]);
  [(VSKeychainGenericPassword *)v9 setViewHint:*MEMORY[0x1E4F3B8E8]];
}

- (id)_keychainItemsWithLimit:(unint64_t)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(VSKeychainFetchRequest);
  id v5 = VSKeychainItemKindGenericPassword();
  id v6 = +[VSOptional optionalWithObject:v5];
  [(VSKeychainFetchRequest *)v4 setItemKind:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = VSNumberForFourCharCode(VSKeychainItemCreatorCode);
  char v30 = VSNumberForFourCharCode(VSKeychainItemV2CreatorCode);
  v31 = (void *)v8;
  v35[0] = v8;
  v35[1] = v30;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"creatorCode", v29];
  [v7 addObject:v9];

  uint64_t v10 = VSNumberForFourCharCode(0x6174684Eu);
  id v11 = VSNumberForFourCharCode(0x746F6B4Eu);
  __int16 v12 = VSNumberForFourCharCode(0x746F6B32u);
  uint64_t v28 = (void *)v10;
  v34[0] = v10;
  v34[1] = v11;
  v34[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"typeCode", v13];
  [v7 addObject:v14];

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"accessGroup", @"com.apple.VideoSubscriberAccount"];
  [v7 addObject:v15];

  uint64_t v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
  [(VSKeychainFetchRequest *)v4 setPredicate:v16];

  [(VSKeychainFetchRequest *)v4 setFetchLimit:a3];
  [(VSKeychainFetchRequest *)v4 setIncludesDataValues:1];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationDate" ascending:0];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"label" ascending:1];
  v33[0] = v17;
  v33[1] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [(VSKeychainFetchRequest *)v4 setSortDescriptors:v19];

  unsigned int v20 = [(VSAccountStore *)self keychainEditingContext];
  id v32 = 0;
  int v21 = [v20 executeFetchRequest:v4 error:&v32];
  id v22 = v32;

  if (v21)
  {
    uint64_t v23 = +[VSFailable failableWithObject:v21];
  }
  else
  {
    uint64_t v24 = VSErrorLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[VSAccountStore _keychainItemsWithLimit:]();
    }

    if (!v22) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
    }
    uint64_t v23 = +[VSFailable failableWithError:v22];
  }
  v25 = (void *)v23;
  if (!v23) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  }

  return v25;
}

- (NSUndoManager)undoManager
{
  v2 = [(VSAccountStore *)self keychainEditingContext];
  id v3 = [v2 undoManager];

  return (NSUndoManager *)v3;
}

- (void)setUndoManager:(id)a3
{
  id v4 = a3;
  id v5 = [(VSAccountStore *)self keychainEditingContext];
  [v5 setUndoManager:v4];
}

- (BOOL)isFirstAccountLoaded
{
  return ![(VSAccountStore *)self needsUpdateCachedFirstAccount];
}

- (id)firstAccountIfLoaded
{
  if ([(VSAccountStore *)self needsUpdateCachedFirstAccount]
    || ([(VSAccountStore *)self cachedFirstAccount],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(VSAccountStore *)self firstAccount];
  }

  return v4;
}

- (BOOL)_updateCachedFirstAccount
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F28F08] currentQueue];
  id v5 = [(VSAccountStore *)self keychainQueue];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected operation queue for updating cached account."];
  }
  id v7 = objc_alloc_init(VSSemaphore);
  uint64_t v8 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke;
  v33[3] = &unk_1E6BD29A8;
  uint64_t v9 = v7;
  int v34 = v9;
  [(VSDeveloperSettingsFetchOperation *)v8 setCompletionBlock:v33];
  [(VSAsyncOperation *)v8 start];
  [(VSSemaphore *)v9 wait];
  uint64_t v10 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  objc_initWeak(&location, v10);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2;
  v28[3] = &unk_1E6BD2BA0;
  objc_copyWeak(&v31, &location);
  id v11 = v3;
  id v29 = v11;
  __int16 v12 = v9;
  char v30 = v12;
  [(VSDeveloperIdentityProviderFetchAllOperation *)v10 setCompletionBlock:v28];
  [(VSAsyncOperation *)v10 start];
  [(VSSemaphore *)v12 wait];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v13 = [(VSDeveloperSettingsFetchOperation *)v8 result];
  uint64_t v14 = [v13 forceUnwrapObject];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_175;
  v23[3] = &unk_1E6BD2BC8;
  v23[4] = &v24;
  [v14 unwrapObject:v23 error:&__block_literal_global_179];
  uint64_t v15 = *((unsigned __int8 *)v25 + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_180;
  v20[3] = &unk_1E6BD2C10;
  v20[4] = self;
  id v22 = &v35;
  uint64_t v16 = v12;
  int v21 = v16;
  [(VSAccountStore *)self _fetchAccountsSimulatingExpiredToken:v15 forProviderIDs:v11 completion:v20];
  [(VSSemaphore *)v16 wait];
  if (*((unsigned char *)v36 + 24))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_182;
    v19[3] = &unk_1E6BD29A8;
    v19[4] = self;
    VSPerformBlockOnMainThread(v19);
    BOOL v17 = *((unsigned char *)v36 + 24) != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v24, 8);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v35, 8);
  return v17;
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained result];
  id v4 = [v3 forceUnwrapObject];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_3;
  v7[3] = &unk_1E6BD2B78;
  id v8 = a1[4];
  id v9 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5;
  v5[3] = &unk_1E6BD28B0;
  id v6 = a1[5];
  [v4 unwrapObject:v7 error:v5];
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) providerID];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __43__VSAccountStore__updateCachedFirstAccount__block_invoke_4;
        v9[3] = &unk_1E6BD2B50;
        id v10 = *(id *)(a1 + 32);
        [v8 conditionallyUnwrapObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 40) signal];
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1();
  }

  [*(id *)(a1 + 32) signal];
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_175(uint64_t a1, void *a2)
{
  uint64_t result = [a2 simulateExpiredToken];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_177()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_177_cold_1(v0);
  }
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [a2 firstObject];
    id v8 = [*(id *)(a1 + 32) cachedFirstAccount];
    id v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      if (v9 && v8)
      {
        char v11 = [v8 isEqual:v9];

        if (v11) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [*(id *)(a1 + 32) setCachedFirstAccount:v10];
    }
LABEL_13:
    [*(id *)(a1 + 32) setNeedsUpdateCachedFirstAccount:0];

    goto LABEL_14;
  }
  uint64_t v6 = VSErrorLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_180_cold_1();
  }

  [*(id *)(a1 + 32) setNeedsUpdateCachedFirstAccount:1];
LABEL_14:
  [*(id *)(a1 + 40) signal];
}

uint64_t __43__VSAccountStore__updateCachedFirstAccount__block_invoke_182(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendLocalNotification];
}

- (id)firstAccount
{
  if ([(VSAccountStore *)self needsUpdateCachedFirstAccount]
    || ([(VSAccountStore *)self cachedFirstAccount],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v4 = objc_alloc_init(VSSemaphore);
    id v5 = [(VSAccountStore *)self keychainQueue];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    char v11 = __30__VSAccountStore_firstAccount__block_invoke;
    long long v12 = &unk_1E6BD2C38;
    long long v13 = self;
    long long v14 = v4;
    uint64_t v6 = v4;
    [v5 addOperationWithBlock:&v9];

    [(VSSemaphore *)v6 wait];
  }
  uint64_t v7 = [(VSAccountStore *)self cachedFirstAccount];

  return v7;
}

uint64_t __30__VSAccountStore_firstAccount__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCachedFirstAccount];
  v2 = *(void **)(a1 + 40);

  return [v2 signal];
}

- (NSArray)accounts
{
  id v3 = objc_alloc_init(VSSemaphore);
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  BOOL v17 = __Block_byref_object_dispose_;
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __26__VSAccountStore_accounts__block_invoke;
  uint64_t v10 = &unk_1E6BD2C60;
  long long v12 = &v13;
  uint64_t v4 = v3;
  char v11 = v4;
  [(VSAccountStore *)self fetchAccountsWithCompletionHandler:&v7];
  [(VSSemaphore *)v4 wait];
  id v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return (NSArray *)v5;
}

uint64_t __26__VSAccountStore_accounts__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__VSAccountStore_accounts__block_invoke_2;
  v4[3] = &unk_1E6BD29F8;
  v4[4] = *(void *)(a1 + 40);
  [a2 unwrapObject:v4 error:&__block_literal_global_184];
  return [*(id *)(a1 + 32) signal];
}

void __26__VSAccountStore_accounts__block_invoke_2(uint64_t a1, void *a2)
{
}

void __26__VSAccountStore_accounts__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __26__VSAccountStore_accounts__block_invoke_3_cold_1();
  }
}

- (void)fetchAccountsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(VSAccountStore *)self keychainQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6BD2CD8;
  id v10 = v5;
  char v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 addOperationWithBlock:v9];
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(VSDeveloperSettingsFetchOperation);
  id v3 = objc_alloc_init(VSSemaphore);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2;
  v20[3] = &unk_1E6BD29A8;
  id v4 = v3;
  int v21 = v4;
  [(VSDeveloperSettingsFetchOperation *)v2 setCompletionBlock:v20];
  [(VSAsyncOperation *)v2 start];
  [(VSSemaphore *)v4 wait];
  id v5 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  objc_initWeak(&location, v5);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E6BD2BA0;
  objc_copyWeak(&v18, &location);
  id v16 = *(id *)(a1 + 32);
  uint64_t v6 = v4;
  BOOL v17 = v6;
  [(VSDeveloperIdentityProviderFetchAllOperation *)v5 setCompletionBlock:v15];
  [(VSAsyncOperation *)v5 start];
  [(VSSemaphore *)v6 wait];
  id v7 = [(VSDeveloperSettingsFetchOperation *)v2 result];
  id v8 = [v7 forceUnwrapObject];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_189;
  v14[3] = &unk_1E6BD2BC8;
  void v14[4] = &v22;
  [v8 unwrapObject:v14 error:&__block_literal_global_192];
  uint64_t v9 = *((unsigned __int8 *)v23 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_193;
  v12[3] = &unk_1E6BD2CB0;
  id v13 = *(id *)(a1 + 48);
  [v10 _fetchAccountsSimulatingExpiredToken:v9 forProviderIDs:v11 completion:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v22, 8);
}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained result];
  id v4 = [v3 forceUnwrapObject];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E6BD2B78;
  id v8 = a1[4];
  id v9 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_6;
  v5[3] = &unk_1E6BD28B0;
  id v6 = a1[5];
  [v4 unwrapObject:v7 error:v5];
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) providerID];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_5;
        v9[3] = &unk_1E6BD2B50;
        id v10 = *(id *)(a1 + 32);
        [v8 conditionallyUnwrapObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 40) signal];
}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1();
  }

  [*(id *)(a1 + 32) signal];
}

uint64_t __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t result = [a2 simulateExpiredToken];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_190(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_190_cold_1();
  }
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v9 = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3_198;
    id v10 = v6;
  }
  else
  {
    id v8 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v9 = __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_194;
    id v10 = v5;
  }
  v8[2] = v9;
  v8[3] = &unk_1E6BD2C88;
  v8[5] = *(id *)(a1 + 32);
  void v8[4] = v10;
  VSPerformCompletionHandler(v8);
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_194(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v1)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accounts parameter must not be nil."];
    v1 = *(void **)(a1 + 32);
  }
  id v4 = v1;
  id v5 = +[VSFailable failableWithObject:v4];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_3_198(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v1)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
    v1 = *(void **)(a1 + 32);
  }
  id v4 = v1;
  id v5 = +[VSFailable failableWithError:v4];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

- (BOOL)_insertAccount:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v8;
    _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "VSAccountStore _insertAccount: %@", buf, 0xCu);
  }

  [(VSAccountStore *)self _insertLegacyKeychainItemForAccount:v8 context:v9];
  id v30 = 0;
  int v11 = [v9 save:&v30];
  id v12 = v30;
  if (v11)
  {
    long long v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v8 legacyKeychainItem];
      uint64_t v15 = [(VSAccountStore *)self _uniqueIdentifierForKeychainItem:v14];
      uint64_t v16 = [v8 legacyKeychainItem];
      BOOL v17 = [v16 creationDate];
      *(_DWORD *)buf = 138412546;
      id v32 = v15;
      __int16 v33 = 2112;
      int v34 = v17;
      _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Successfully committed legacy item with hash %@ (cdat=%@)", buf, 0x16u);
    }
    [(VSAccountStore *)self _insertModernKeychainItemForAccount:v8 context:v9];
    id v29 = v12;
    char v18 = [v9 save:&v29];
    id v19 = v29;

    if (v18)
    {
      BOOL v20 = 1;
    }
    else
    {
      uint64_t v22 = VSErrorLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[VSAccountStore _insertAccount:inContext:error:]();
      }

      id v23 = v19;
      *a5 = v23;

      uint64_t v24 = [v8 legacyKeychainItem];

      if (!v24) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [account legacyKeychainItem] parameter must not be nil."];
      }
      uint64_t v25 = [v8 legacyKeychainItem];
      [v9 deleteItem:v25];

      id v28 = 0;
      LOBYTE(v25) = [v9 save:&v28];
      id v19 = v28;
      if ((v25 & 1) == 0)
      {
        uint64_t v26 = VSErrorLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[VSAccountStore _insertAccount:inContext:error:]();
        }
      }
      BOOL v20 = 0;
    }
  }
  else
  {
    int v21 = VSErrorLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[VSAccountStore _insertAccount:inContext:error:]();
    }

    id v19 = v12;
    BOOL v20 = 0;
    *a5 = v19;
  }

  return v20;
}

- (void)saveAccounts:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accounts parameter must not be nil."];
  }
  if (![v6 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must supply at least one account to save."];
  }
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[VSAccountStore saveAccounts:withCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v9 = [(VSAccountStore *)self keychainQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6BD2CD8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 addOperationWithBlock:v12];
}

void __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) keychainEditingContext];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        id v11 = *(void **)(a1 + 32);
        id v21 = v9;
        int v12 = [v11 _insertAccount:v10 inContext:v2 error:&v21];
        id v6 = v21;

        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
    int v12 = 1;
  }

  [*(id *)(a1 + 32) _updateCachedFirstAccount];
  id v13 = VSDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)char v27 = v12;
    *(_WORD *)&v27[4] = 2112;
    *(void *)&v27[6] = v6;
    _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Finished saving accounts with status %i with error %@", buf, 0x12u);
  }

  id v14 = *(void **)(a1 + 48);
  if (v14)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_205;
    v17[3] = &unk_1E6BD2D00;
    id v19 = v14;
    char v20 = v12;
    id v18 = v6;
    VSPerformCompletionHandler(v17);

    uint64_t v15 = v19;
  }
  else
  {
    uint64_t v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)char v27 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", buf, 0xCu);
    }
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_208;
  v16[3] = &unk_1E6BD29A8;
  void v16[4] = *(void *)(a1 + 32);
  VSPerformBlockOnMainThread(v16);
}

void __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_205(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_206;
  v4[3] = &unk_1E6BD2D00;
  id v6 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_206((uint64_t)v4);
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[VSAccountStore saveAccounts:withCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }
}

uint64_t __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __53__VSAccountStore_saveAccounts_withCompletionHandler___block_invoke_208(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRemoteNotification];
}

- (void)removeAccounts:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accounts parameter must not be nil."];
  }
  if (![v6 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must supply at least one account to remove."];
  }
  uint64_t v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[VSAccountStore removeAccounts:withCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v9 = [(VSAccountStore *)self keychainQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E6BD2CD8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 addOperationWithBlock:v12];
}

void __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) keychainEditingContext];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = a1;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "legacyKeychainItem", v19);

        if (!v10) {
          [MEMORY[0x1E4F1CA00] raise:v7 format:@"The [account legacyKeychainItem] parameter must not be nil."];
        }
        id v11 = [v9 legacyKeychainItem];
        [v2 deleteItem:v11];

        int v12 = [v9 keychainItem];

        if (!v12) {
          [MEMORY[0x1E4F1CA00] raise:v7 format:@"The [account keychainItem] parameter must not be nil."];
        }
        id v13 = [v9 keychainItem];
        [v2 deleteItem:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  id v25 = 0;
  char v14 = [v2 save:&v25];
  id v15 = v25;
  [*(id *)(v19 + 32) _updateCachedFirstAccount];
  uint64_t v16 = VSDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v16, OS_LOG_TYPE_DEFAULT, "Finished removing accounts.  Will invoke completion handler and post notification.", buf, 2u);
  }

  uint64_t v17 = *(void **)(v19 + 48);
  if (v17)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_215;
    v21[3] = &unk_1E6BD2D00;
    long long v23 = v17;
    char v24 = v14;
    id v22 = v15;
    VSPerformCompletionHandler(v21);

    id v18 = v23;
  }
  else
  {
    id v18 = VSDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v31 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1DA674000, v18, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", buf, 0xCu);
    }
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_218;
  v20[3] = &unk_1E6BD29A8;
  void v20[4] = *(void *)(v19 + 32);
  VSPerformBlockOnMainThread(v20);
}

void __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_215(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_216;
  v4[3] = &unk_1E6BD2D00;
  id v6 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_216((uint64_t)v4);
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[VSAccountStore removeAccounts:withCompletionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }
}

uint64_t __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_216(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __55__VSAccountStore_removeAccounts_withCompletionHandler___block_invoke_218(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRemoteNotification];
}

- (VSAccount)cachedFirstAccount
{
  return (VSAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedFirstAccount:(id)a3
{
}

- (BOOL)needsUpdateCachedFirstAccount
{
  return self->_needsUpdateCachedFirstAccount;
}

- (void)setNeedsUpdateCachedFirstAccount:(BOOL)a3
{
  self->_needsUpdateCachedFirstAccount = a3;
}

- (VSKeychainEditingContext)keychainEditingContext
{
  return self->_keychainEditingContext;
}

- (void)setKeychainEditingContext:(id)a3
{
}

- (NSOperationQueue)keychainQueue
{
  return self->_keychainQueue;
}

- (void)setKeychainQueue:(id)a3
{
}

- (id)changeObserver
{
  id WeakRetained = objc_loadWeakRetained(&self->_changeObserver);

  return WeakRetained;
}

- (void)setChangeObserver:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_destroyWeak(&self->_changeObserver);
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_keychainEditingContext, 0);

  objc_storeStrong((id *)&self->_cachedFirstAccount, 0);
}

- (void)_accountForKeychainItem:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1DA674000, v0, v1, "Got keychain item with no data: %@", v2, v3, v4, v5, v6);
}

- (void)_accountForKeychainItem:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unexpected token type code when deserializing account from keychain: %@", v2, v3, v4, v5, v6);
}

- (void)_accountForKeychainItem:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error deserializing keychain item body: %@", v2, v3, v4, v5, v6);
}

- (void)_accountForKeychainItem:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unexpected scheme when decoding account from 2.0 keychain item: %@", v2, v3, v4, v5, v6);
}

- (void)_accountForKeychainItem:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 creatorCode];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Unexpected creator code when deserialziing account from keychain item: %@", v4, 0xCu);
}

void __81__VSAccountStore__fetchAccountsSimulatingExpiredToken_forProviderIDs_completion___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1DA674000, v0, v1, "VSKeychainGenericPassword with no modificationDate: %@", v2, v3, v4, v5, v6);
}

- (void)_insertModernKeychainItemForAccount:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error serializing account to property list: %@", v2, v3, v4, v5, v6);
}

- (void)_keychainItemsWithLimit:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching keychain items: %@", v2, v3, v4, v5, v6);
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetch existing providers: %@", v2, v3, v4, v5, v6);
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_2_177_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Error fetching developer settings, assuming no token expiration simulation.", v1, 2u);
}

void __43__VSAccountStore__updateCachedFirstAccount__block_invoke_180_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Failed to update cached account: %@", v2, v3, v4, v5, v6);
}

void __26__VSAccountStore_accounts__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Unable to fetch accounts: %@", v2, v3, v4, v5, v6);
}

void __53__VSAccountStore_fetchAccountsWithCompletionHandler___block_invoke_2_190_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching developer settings to check for expired token simulation: %@", v2, v3, v4, v5, v6);
}

- (void)_insertAccount:inContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error saving keychain after removing item for error cleanup: %@", v2, v3, v4, v5, v6);
}

- (void)_insertAccount:inContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error saving modern keychain item: %@", v2, v3, v4, v5, v6);
}

- (void)_insertAccount:inContext:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error saving legacy keychain item: %@", v2, v3, v4, v5, v6);
}

@end