@interface AAAccountManager
+ (AAAccountManager)sharedManager;
- (id)_accountStore;
- (id)accountWithIdentifier:(id)a3;
- (id)accountWithPersonID:(id)a3;
- (id)accountWithUsername:(id)a3;
- (id)accounts;
- (id)accountsEnabledForDataclass:(id)a3;
- (id)primaryAccount;
- (void)_beginObservingAccountStoreDidChangeNotification;
- (void)_stopObservingAccountStoreDidChangeNotification;
- (void)addAccount:(id)a3;
- (void)dealloc;
- (void)reloadAccounts;
- (void)removeAccount:(id)a3;
- (void)saveAllAccounts;
- (void)updateAccount:(id)a3;
@end

@implementation AAAccountManager

+ (AAAccountManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_27);
  }
  v2 = (void *)sharedManager_sharedManager_0;

  return (AAAccountManager *)v2;
}

uint64_t __33__AAAccountManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(AAAccountManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;

  v2 = (void *)sharedManager_sharedManager_0;

  return [v2 reloadAccounts];
}

- (void)dealloc
{
  if (self->_accountStore) {
    [(AAAccountManager *)self _stopObservingAccountStoreDidChangeNotification];
  }
  v3.receiver = self;
  v3.super_class = (Class)AAAccountManager;
  [(AAAccountManager *)&v3 dealloc];
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = [MEMORY[0x1E4F179C8] defaultStore];
    v5 = self->_accountStore;
    self->_accountStore = v4;

    [(AAAccountManager *)self _beginObservingAccountStoreDidChangeNotification];
    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)_beginObservingAccountStoreDidChangeNotification
{
  if (!self->_accountStoreDidChangeObserver)
  {
    objc_initWeak(&location, self);
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F17728];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__AAAccountManager__beginObservingAccountStoreDidChangeNotification__block_invoke;
    v7[3] = &unk_1E5A4ADE0;
    objc_copyWeak(&v8, &location);
    v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
    id accountStoreDidChangeObserver = self->_accountStoreDidChangeObserver;
    self->_id accountStoreDidChangeObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __68__AAAccountManager__beginObservingAccountStoreDidChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAccounts];
}

- (void)_stopObservingAccountStoreDidChangeNotification
{
  if (self->_accountStoreDidChangeObserver)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_accountStoreDidChangeObserver];

    id accountStoreDidChangeObserver = self->_accountStoreDidChangeObserver;
    self->_id accountStoreDidChangeObserver = 0;
  }
}

- (id)accounts
{
  return self->_accounts;
}

- (void)reloadAccounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(AAAccountManager *)v2 _accountStore];
  uint64_t v4 = objc_msgSend(v3, "aa_appleAccounts");

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        v11 = [AAAccount alloc];
        v12 = -[AAAccount initWithAccount:](v11, "initWithAccount:", v10, (void)v15);
        [v5 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_storeStrong((id *)&v2->_accounts, v5);
  uint64_t v13 = [(NSMutableArray *)v2->_accounts copy];
  originalAccounts = v2->_originalAccounts;
  v2->_originalAccounts = (NSMutableArray *)v13;

  objc_sync_exit(v2);
}

- (id)primaryAccount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = v2->_accounts;
  uint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "primaryAccount", (void)v11))
        {
          id v9 = v8;

          uint64_t v4 = v9;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);

  return v4;
}

- (id)accountsEnabledForDataclass:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = v5->_accounts;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabledForDataclass:", v4, (void)v13)) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);

  return v6;
}

- (id)accountWithUsername:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = v5;
  uint64_t v6 = v5->_accounts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      long long v11 = [v10 username];
      int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        id v13 = v10;
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v14 = [v10 appleIDAliases];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isEqualToString:v4])
              {
                id v13 = v10;
                goto LABEL_18;
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        id v13 = 0;
LABEL_18:
      }
      if (v13) {
        break;
      }
      if (++v9 == v7)
      {
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    id v13 = 0;
  }

  objc_sync_exit(obj);

  return v13;
}

- (id)accountWithPersonID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = v5->_accounts;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "personID", (void)v14);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (id)accountWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = v5->_accounts;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "identifier", (void)v14);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);

  return v7;
}

- (void)addAccount:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 username];
    uint64_t v8 = [v4 identifier];
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Adding account: %@:%@", (uint8_t *)&v10, 0x16u);
  }
  accounts = v5->_accounts;
  if (accounts) {
    [(NSMutableArray *)accounts addObject:v4];
  }
  objc_sync_exit(v5);
}

- (void)updateAccount:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)[(NSMutableArray *)v5->_accounts copy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 138412546;
    long long v19 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v12), "identifier", v19, (void)v20);
        uint64_t v14 = [v4 identifier];
        int v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          [(NSMutableArray *)v5->_accounts replaceObjectAtIndex:v10 + v12 withObject:v4];
          long long v16 = _AALogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v4 username];
            uint64_t v18 = [v4 identifier];
            *(_DWORD *)buf = v19;
            id v25 = v17;
            __int16 v26 = 2112;
            long long v27 = v18;
            _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Updating account: %@:%@", buf, 0x16u);
          }
        }
        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      v10 += v12;
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)removeAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 username];
  id v7 = _AALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NSMutableArray *)v5->_accounts count];
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Removing account %@. Count: %lu", buf, 0x16u);
  }

  long long v9 = [(AAAccountManager *)v5 _accountStore];
  uint64_t v10 = [v4 account];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__AAAccountManager_removeAccount___block_invoke;
  v13[3] = &unk_1E5A4AE08;
  v13[4] = v5;
  id v11 = v4;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  [v9 removeAccount:v10 withCompletionHandler:v13];

  objc_sync_exit(v5);
}

void __34__AAAccountManager_removeAccount___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1[4] + 16) count];
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Removed account. Count: %lu", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1[4] + 16) removeObject:a1[5]];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = a1[6];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Failed to remove account %@. Error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)saveAllAccounts
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSMutableArray *)v2->_accounts count];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Saving Accounts. Count: %lu", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = v2->_accounts;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        int v10 = [(AAAccountManager *)v3 _accountStore];
        uint64_t v11 = [v9 account];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __35__AAAccountManager_saveAllAccounts__block_invoke;
        v17[3] = &unk_1E5A49ED0;
        v17[4] = v9;
        [v10 saveAccount:v11 withCompletionHandler:v17];

        v2 = v3;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [(NSMutableArray *)v2->_accounts copy];
  originalAccounts = v2->_originalAccounts;
  v2->_originalAccounts = (NSMutableArray *)v12;

  objc_sync_exit(v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, @"AAAccountConfigChangedNotification", v2, 0, 1uLL);
  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"AAAccountConfigChangedNotification" object:0];
}

void __35__AAAccountManager_saveAllAccounts__block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    objc_super v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) username];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to save account %@.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accountStoreDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_originalAccounts, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end