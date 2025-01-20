@interface CalPlistSavingMigrationAccountStore
- (BOOL)_trySaveWithError:(id *)a3;
- (BOOL)removeAccount:(id)a3 error:(id *)a4;
- (BOOL)saveAccount:(id)a3 withError:(id *)a4;
- (CalMigrationReadOnlyAccountStore)backingAccountStore;
- (CalPlistSavingMigrationAccountStore)initWithPlistURL:(id)a3 backingAccountStore:(id)a4;
- (NSMutableDictionary)addedAccounts;
- (NSMutableDictionary)addedChildAccounts;
- (NSMutableDictionary)loadedAccounts;
- (NSMutableDictionary)modifiedAccounts;
- (NSMutableSet)deletedAccountIdentifiers;
- (NSURL)plistURL;
- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4;
- (id)accountWithIdentifier:(id)a3;
- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4;
- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5;
- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (void)_registerAddedChildAccountWithIdentifier:(id)a3 parentAccountIdentifier:(id)a4;
@end

@implementation CalPlistSavingMigrationAccountStore

- (CalPlistSavingMigrationAccountStore)initWithPlistURL:(id)a3 backingAccountStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CalPlistSavingMigrationAccountStore;
  v9 = [(CalPlistSavingMigrationAccountStore *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plistURL, a3);
    objc_storeStrong((id *)&v10->_backingAccountStore, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    addedAccounts = v10->_addedAccounts;
    v10->_addedAccounts = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    modifiedAccounts = v10->_modifiedAccounts;
    v10->_modifiedAccounts = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    loadedAccounts = v10->_loadedAccounts;
    v10->_loadedAccounts = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    addedChildAccounts = v10->_addedChildAccounts;
    v10->_addedChildAccounts = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    deletedAccountIdentifiers = v10->_deletedAccountIdentifiers;
    v10->_deletedAccountIdentifiers = (NSMutableSet *)v19;
  }
  return v10;
}

- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
  char v9 = [v8 containsObject:v6];

  if (v9) {
    goto LABEL_2;
  }
  uint64_t v11 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
  v10 = [v11 objectForKeyedSubscript:v6];

  if (!v10)
  {
    v12 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
    v10 = [v12 objectForKeyedSubscript:v6];

    if (!v10)
    {
      uint64_t v13 = [(CalPlistSavingMigrationAccountStore *)self loadedAccounts];
      v10 = [v13 objectForKeyedSubscript:v6];

      if (!v10)
      {
        if (!v7)
        {
          v14 = [(CalPlistSavingMigrationAccountStore *)self backingAccountStore];
          id v7 = [v14 accountWithIdentifier:v6];

          if (!v7)
          {
LABEL_2:
            v10 = 0;
            goto LABEL_9;
          }
        }
        uint64_t v15 = [CalPlistSavingMigrationAccount alloc];
        v16 = [v7 accountTypeIdentifier];
        v10 = [(CalPlistSavingMigrationAccount *)v15 initWithIdentifier:v6 accountTypeIdentifier:v16 backingAccount:v7 initialProperties:0];

        uint64_t v17 = [(CalPlistSavingMigrationAccountStore *)self loadedAccounts];
        [v17 setObject:v10 forKeyedSubscript:v6];
      }
    }
  }
LABEL_9:

  return v10;
}

- (id)accountWithIdentifier:(id)a3
{
  return [(CalPlistSavingMigrationAccountStore *)self _accountWithIdentifier:a3 preloadedBackingAccount:0];
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(CalPlistSavingMigrationAccountStore *)self backingAccountStore];
  id v8 = [v7 topLevelAccountsWithAccountTypeIdentifier:v6 error:a4];

  if (v8)
  {
    char v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v16 = [v15 identifier];
          uint64_t v17 = [(CalPlistSavingMigrationAccountStore *)self _accountWithIdentifier:v16 preloadedBackingAccount:v15];
          [v9 addObject:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v18 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
    uint64_t v19 = [v18 allValues];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v25 = [v24 parentAccountIdentifier];
          if (v25)
          {
          }
          else
          {
            v26 = [v24 accountTypeIdentifier];
            int v27 = [v26 isEqualToString:v6];

            if (v27) {
              [v9 addObject:v24];
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v21);
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:]();
    }
    goto LABEL_26;
  }
  id v8 = v6;
  char v9 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
  id v10 = [v8 identifier];
  char v11 = [v9 containsObject:v10];

  if (v11)
  {
LABEL_26:
    v38 = 0;
    goto LABEL_32;
  }
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
  v14 = [v8 identifier];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];

  id v43 = v7;
  if (v15)
  {
LABEL_15:
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v28 = [(CalPlistSavingMigrationAccountStore *)self addedChildAccounts];
    long long v29 = [v8 identifier];
    long long v30 = [v28 objectForKeyedSubscript:v29];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          uint64_t v36 = [(CalPlistSavingMigrationAccountStore *)self _accountWithIdentifier:v35 preloadedBackingAccount:0];
          if (!v36)
          {
            uint64_t v39 = +[CalMigrationLog defaultCategory];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
              -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:](v35, v8, v39);
            }

            v38 = 0;
            goto LABEL_30;
          }
          v37 = (void *)v36;
          [v12 addObject:v36];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    v38 = (void *)[v12 copy];
LABEL_30:
    id v7 = v43;
    goto LABEL_31;
  }
  uint64_t v16 = [v8 backingAccount];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    v18 = [(CalPlistSavingMigrationAccountStore *)self backingAccountStore];
    v42 = v17;
    uint64_t v19 = [v18 childAccountsForAccount:v17 withTypeIdentifier:v7];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          v26 = [v25 identifier];
          int v27 = [(CalPlistSavingMigrationAccountStore *)self _accountWithIdentifier:v26 preloadedBackingAccount:v25];

          if (v27) {
            [v12 addObject:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v22);
    }

    goto LABEL_15;
  }
  v41 = +[CalMigrationLog defaultCategory];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
    -[CalPlistSavingMigrationAccountStore childAccountsForAccount:withTypeIdentifier:]();
  }

  v38 = 0;
LABEL_31:

LABEL_32:
  return v38;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08C38];
  id v6 = a3;
  id v7 = [v5 UUID];
  id v8 = [v7 UUIDString];

  char v9 = [[CalPlistSavingMigrationAccount alloc] initWithIdentifier:v8 accountTypeIdentifier:v6 backingAccount:0 initialProperties:0];
  id v10 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
  [v10 setObject:v9 forKeyedSubscript:v8];

  return v9;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  char v9 = [(CalPlistSavingMigrationAccountStore *)self createAccountWithAccountTypeIdentifier:a4 error:a5];
  if (v9)
  {
    id v10 = [v8 identifier];
    [v9 setParentAccountIdentifier:v10];

    char v11 = [v9 identifier];
    uint64_t v12 = [v8 identifier];
    [(CalPlistSavingMigrationAccountStore *)self _registerAddedChildAccountWithIdentifier:v11 parentAccountIdentifier:v12];

    id v13 = v9;
  }

  return v9;
}

- (void)_registerAddedChildAccountWithIdentifier:(id)a3 parentAccountIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CalPlistSavingMigrationAccountStore *)self addedChildAccounts];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
    char v9 = [(CalPlistSavingMigrationAccountStore *)self addedChildAccounts];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  [v8 addObject:v10];
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 identifier];
    id v8 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      id v10 = +[CalMigrationLog defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[CalPlistSavingMigrationAccountStore removeAccount:error:]();
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"kCalPlistSavingMigrationAccountStoreErrorDomain" code:0 userInfo:0];
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
      goto LABEL_19;
    }
    uint64_t v12 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
    id v13 = [v12 objectForKeyedSubscript:v7];

    if (v13)
    {
      v14 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
      [v14 removeObjectForKey:v7];

      uint64_t v15 = [(CalPlistSavingMigrationAccountStore *)self addedChildAccounts];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __59__CalPlistSavingMigrationAccountStore_removeAccount_error___block_invoke;
      v24[3] = &unk_2645A4410;
      id v25 = v7;
      [v15 enumerateKeysAndObjectsUsingBlock:v24];

LABEL_18:
      uint64_t v22 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
      [v22 addObject:v7];

      BOOL v11 = [(CalPlistSavingMigrationAccountStore *)self _trySaveWithError:a4];
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v16 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
    uint64_t v17 = [v16 objectForKeyedSubscript:v7];

    if (v17)
    {
      v18 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
    }
    else
    {
      uint64_t v19 = [(CalPlistSavingMigrationAccountStore *)self loadedAccounts];
      id v20 = [v19 objectForKeyedSubscript:v7];

      if (!v20) {
        goto LABEL_18;
      }
      v18 = [(CalPlistSavingMigrationAccountStore *)self loadedAccounts];
    }
    uint64_t v21 = v18;
    [v18 removeObjectForKey:v7];

    goto LABEL_18;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.calendar.MigrationErrors" code:3 userInfo:0];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

uint64_t __59__CalPlistSavingMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 identifier];
    id v8 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
    int v9 = [v8 containsObject:v7];

    if (v9)
    {
      id v10 = +[CalMigrationLog defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[CalPlistSavingMigrationAccountStore saveAccount:withError:]();
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"kCalPlistSavingMigrationAccountStoreErrorDomain" code:0 userInfo:0];
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      uint64_t v12 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
      id v13 = [v12 objectForKeyedSubscript:v7];

      if (v13 || [v6 dirty])
      {
        id v14 = v6;
        if ([v14 dirty])
        {
          [v14 save];
          if (!v13)
          {
            uint64_t v15 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
            uint64_t v16 = [v15 objectForKeyedSubscript:v7];

            if (!v16)
            {
              uint64_t v17 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
              [v17 setObject:v14 forKeyedSubscript:v7];

              v18 = [(CalPlistSavingMigrationAccountStore *)self loadedAccounts];
              [v18 removeObjectForKey:v7];
            }
          }
          BOOL v11 = [(CalPlistSavingMigrationAccountStore *)self _trySaveWithError:a4];
        }
        else
        {
          BOOL v11 = 1;
        }
      }
      else
      {
        BOOL v11 = 1;
      }
    }
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.calendar.MigrationErrors" code:3 userInfo:0];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_trySaveWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v5 = +[CalMigrationLog defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CalPlistSavingMigrationAccountStore *)self plistURL];
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_22133F000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to save account changes to file %@", buf, 0xCu);
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  int v9 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke;
  v38[3] = &unk_2645A4438;
  id v10 = v8;
  id v39 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v38];

  if ([v10 count]) {
    [v7 setObject:v10 forKeyedSubscript:@"AddedAccounts"];
  }
  BOOL v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = [(CalPlistSavingMigrationAccountStore *)self addedAccounts];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_2;
  v36[3] = &unk_2645A4438;
  id v13 = v11;
  id v37 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v36];

  id v14 = [(CalPlistSavingMigrationAccountStore *)self modifiedAccounts];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_3;
  v34[3] = &unk_2645A4438;
  id v15 = v13;
  id v35 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v34];

  if ([v15 count]) {
    [v7 setObject:v15 forKeyedSubscript:@"AccountProperties"];
  }
  uint64_t v16 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];

  if (v16)
  {
    uint64_t v17 = [(CalPlistSavingMigrationAccountStore *)self deletedAccountIdentifiers];
    v18 = [v17 allObjects];
    [v7 setObject:v18 forKeyedSubscript:@"DeletedAccounts"];
  }
  id v33 = 0;
  uint64_t v19 = [MEMORY[0x263F08AC0] dataWithPropertyList:v7 format:100 options:0 error:&v33];
  id v20 = v33;
  uint64_t v21 = v20;
  if (v19)
  {
    id v31 = v20;
    uint64_t v22 = a3;
    uint64_t v23 = [(CalPlistSavingMigrationAccountStore *)self plistURL];
    id v32 = 0;
    char v24 = [v19 writeToURL:v23 options:0 error:&v32];
    id v25 = v32;

    v26 = +[CalMigrationLog defaultCategory];
    int v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(CalPlistSavingMigrationAccountStore *)self plistURL];
        *(_DWORD *)buf = 138412290;
        v41 = v28;
        _os_log_impl(&dword_22133F000, v27, OS_LOG_TYPE_DEFAULT, "Successfully saved account changes to file %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CalPlistSavingMigrationAccountStore _trySaveWithError:]((uint64_t)v25, v27);
      }

      if (v22) {
        *uint64_t v22 = v25;
      }
    }

    uint64_t v21 = v31;
  }
  else
  {
    long long v29 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CalPlistSavingMigrationAccountStore _trySaveWithError:]((uint64_t)v21, v29);
    }

    char v24 = 0;
    if (a3) {
      *a3 = v21;
    }
  }

  return v24;
}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = a2;
  id v10 = [v5 dictionary];
  id v8 = [v6 accountTypeIdentifier];
  [v10 setObject:v8 forKeyedSubscript:@"AccountTypeIdentifier"];

  int v9 = [v6 parentAccountIdentifier];

  [v10 setObject:v9 forKeyedSubscript:@"ParentIdentifier"];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];
}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = [a3 savedProperties];
  id v6 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void __57__CalPlistSavingMigrationAccountStore__trySaveWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = [a3 savedProperties];
  id v6 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (CalMigrationReadOnlyAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (NSMutableDictionary)addedAccounts
{
  return self->_addedAccounts;
}

- (NSMutableDictionary)modifiedAccounts
{
  return self->_modifiedAccounts;
}

- (NSMutableDictionary)loadedAccounts
{
  return self->_loadedAccounts;
}

- (NSMutableDictionary)addedChildAccounts
{
  return self->_addedChildAccounts;
}

- (NSMutableSet)deletedAccountIdentifiers
{
  return self->_deletedAccountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedChildAccounts, 0);
  objc_storeStrong((id *)&self->_loadedAccounts, 0);
  objc_storeStrong((id *)&self->_modifiedAccounts, 0);
  objc_storeStrong((id *)&self->_addedAccounts, 0);
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
}

- (void)childAccountsForAccount:withTypeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22133F000, v2, v3, "CalPlistSavingMigrationAccountStore somehow got an account that wasn't added but has no backing account: %{public}@, %@", v4, v5, v6, v7, v8);
}

- (void)childAccountsForAccount:(NSObject *)a3 withTypeIdentifier:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a2 identifier];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_fault_impl(&dword_22133F000, a3, OS_LOG_TYPE_FAULT, "CalPlistSavingMigrationAccountStore somehow has an added child account identifier (%{public}@) for parent account (%{public}@, %@) with no account details.", (uint8_t *)&v7, 0x20u);
}

- (void)childAccountsForAccount:withTypeIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22133F000, v2, v3, "Wrong account type give to CalPlistSavingMigrationAccountStore method: %{public}@, %@", v4, v5, v6, v7, v8);
}

- (void)removeAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22133F000, v2, v3, "Attempt to remove already deleted account: %{public}@, %@", v4, v5, v6, v7, v8);
}

- (void)saveAccount:withError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = [v0 identifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22133F000, v2, v3, "Attempt to save deleted account: %{public}@, %@", v4, v5, v6, v7, v8);
}

- (void)_trySaveWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22133F000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize account changes: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_trySaveWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22133F000, a2, OS_LOG_TYPE_ERROR, "Failed to write plist data to file: %@", (uint8_t *)&v2, 0xCu);
}

@end