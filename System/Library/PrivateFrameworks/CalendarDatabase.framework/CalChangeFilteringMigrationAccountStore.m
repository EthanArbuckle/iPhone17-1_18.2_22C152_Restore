@interface CalChangeFilteringMigrationAccountStore
+ (id)storeFilteringAllChangesInBackingAccountStore:(id)a3;
- (BOOL)removeAccount:(id)a3 error:(id *)a4;
- (BOOL)saveAccount:(id)a3 withError:(id *)a4;
- (CalChangeFilteringMigrationAccountStore)initWithBackingAccountStore:(id)a3 delegate:(id)a4;
- (CalChangeFilteringMigrationAccountStoreDelegate)delegate;
- (CalMigrationAccountStore)backingAccountStore;
- (NSMutableDictionary)addedWrappedAccounts;
- (NSMutableDictionary)addedWrappedChildAccounts;
- (NSMutableDictionary)loadedAccounts;
- (NSMutableSet)removedWrappedAccountIdentifiers;
- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4;
- (id)_backingAccountForAccount:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4;
- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5;
- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
@end

@implementation CalChangeFilteringMigrationAccountStore

- (CalChangeFilteringMigrationAccountStore)initWithBackingAccountStore:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CalChangeFilteringMigrationAccountStore;
  v9 = [(CalChangeFilteringMigrationAccountStore *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingAccountStore, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = objc_opt_new();
    addedWrappedAccounts = v10->_addedWrappedAccounts;
    v10->_addedWrappedAccounts = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    addedWrappedChildAccounts = v10->_addedWrappedChildAccounts;
    v10->_addedWrappedChildAccounts = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    loadedAccounts = v10->_loadedAccounts;
    v10->_loadedAccounts = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    removedWrappedAccountIdentifiers = v10->_removedWrappedAccountIdentifiers;
    v10->_removedWrappedAccountIdentifiers = (NSMutableSet *)v17;
  }
  return v10;
}

+ (id)storeFilteringAllChangesInBackingAccountStore:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)[objc_alloc((Class)a1) initWithBackingAccountStore:v4 delegate:v5];

  return v6;
}

- (id)accountWithIdentifier:(id)a3
{
  return [(CalChangeFilteringMigrationAccountStore *)self _accountWithIdentifier:a3 preloadedBackingAccount:0];
}

- (id)_accountWithIdentifier:(id)a3 preloadedBackingAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CalChangeFilteringMigrationAccountStore *)self removedWrappedAccountIdentifiers];
  char v9 = [v8 containsObject:v6];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v11 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
    v12 = [v11 objectForKeyedSubscript:v6];

    if (v12)
    {
      uint64_t v13 = v12;
      v10 = v13;
    }
    else
    {
      v14 = [(CalChangeFilteringMigrationAccountStore *)self loadedAccounts];
      uint64_t v15 = [v14 objectForKeyedSubscript:v6];

      if (v15)
      {
        v10 = v15;
        uint64_t v13 = 0;
      }
      else if (v7 {
             || ([(CalChangeFilteringMigrationAccountStore *)self backingAccountStore],
      }
                 v16 = objc_claimAutoreleasedReturnValue(),
                 [v16 accountWithIdentifier:v6],
                 id v7 = (id)objc_claimAutoreleasedReturnValue(),
                 v16,
                 v7))
      {
        uint64_t v17 = [v7 parentAccountIdentifier];

        if (v17
          || ([(CalChangeFilteringMigrationAccountStore *)self delegate],
              v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 allowChangesToExistingTopLevelAccount:v7],
              v18,
              !v19))
        {
          v22 = [[CalChangeFilteringMigrationAccount alloc] initWithBackingAccount:v7];
          v23 = [(CalChangeFilteringMigrationAccountStore *)self loadedAccounts];
          v24 = [v7 identifier];
          [v23 setObject:v22 forKeyedSubscript:v24];

          v21 = v22;
          uint64_t v13 = v21;
        }
        else
        {
          objc_super v20 = [(CalChangeFilteringMigrationAccountStore *)self loadedAccounts];
          [v20 setObject:v7 forKeyedSubscript:v6];

          v21 = (CalChangeFilteringMigrationAccount *)v7;
          id v7 = v21;
          uint64_t v13 = 0;
        }
        v10 = v21;
      }
      else
      {
        uint64_t v13 = 0;
        v10 = 0;
      }
    }
  }

  return v10;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CalChangeFilteringMigrationAccountStore *)self backingAccountStore];
  id v8 = [v7 topLevelAccountsWithAccountTypeIdentifier:v6 error:a4];

  if (v8)
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
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
          uint64_t v17 = [(CalChangeFilteringMigrationAccountStore *)self _accountWithIdentifier:v16 preloadedBackingAccount:v15];

          if (v17) {
            [v9 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v18 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
    int v19 = [v18 allValues];

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
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CalChangeFilteringMigrationAccountStore *)self removedWrappedAccountIdentifiers];
  char v9 = [v6 identifier];
  char v10 = [v8 containsObject:v9];

  if (v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
    v14 = [v6 identifier];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    id v39 = v6;
    if (!v15)
    {
      v16 = [(CalChangeFilteringMigrationAccountStore *)self _backingAccountForAccount:v6];
      uint64_t v17 = [(CalChangeFilteringMigrationAccountStore *)self backingAccountStore];
      v18 = [v17 childAccountsForAccount:v16 withTypeIdentifier:v7];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v45 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            v25 = [v24 identifier];
            v26 = [(CalChangeFilteringMigrationAccountStore *)self _accountWithIdentifier:v25 preloadedBackingAccount:v24];

            if (v26) {
              [v12 addObject:v26];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v21);
      }

      id v6 = v39;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    int v27 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedChildAccounts];
    v28 = [v6 identifier];
    long long v29 = [v27 objectForKeyedSubscript:v28];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = [(CalChangeFilteringMigrationAccountStore *)self _accountWithIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * j) preloadedBackingAccount:0];
          long long v35 = v34;
          if (v34)
          {
            long long v36 = [v34 accountTypeIdentifier];
            int v37 = [v36 isEqualToString:v7];

            if (v37) {
              [v12 addObject:v35];
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v31);
    }

    uint64_t v11 = (void *)[v12 copy];
    id v6 = v39;
  }

  return v11;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CalChangeFilteringMigrationAccountStore *)self delegate];
  int v8 = [v7 allowCreationOfTopLevelAccountWithTypeIdentifier:v6];

  if (v8)
  {
    char v9 = [(CalChangeFilteringMigrationAccountStore *)self backingAccountStore];
    char v10 = [v9 createAccountWithAccountTypeIdentifier:v6 error:a4];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    char v9 = [v11 UUIDString];

    char v10 = [[CalChangeFilteringMigrationAccount alloc] initWithAccountIdentifier:v9 accountTypeIdentifier:v6];
    uint64_t v12 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
    [v12 setObject:v10 forKeyedSubscript:v9];
  }
  return v10;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a4;
  char v10 = [v8 UUID];
  uint64_t v11 = [v10 UUIDString];

  uint64_t v12 = [[CalChangeFilteringMigrationAccount alloc] initWithAccountIdentifier:v11 accountTypeIdentifier:v9];
  uint64_t v13 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
  [v13 setObject:v12 forKeyedSubscript:v11];

  v14 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedChildAccounts];
  uint64_t v15 = [v7 identifier];
  v16 = [v14 objectForKeyedSubscript:v15];

  if (!v16)
  {
    v16 = objc_opt_new();
    uint64_t v17 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedChildAccounts];
    v18 = [v7 identifier];
    [v17 setObject:v16 forKeyedSubscript:v18];
  }
  [v16 addObject:v11];
  id v19 = [v7 identifier];
  [(CalChangeFilteringMigrationAccount *)v12 setParentAccountIdentifier:v19];

  return v12;
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 identifier];
  int v8 = [(CalChangeFilteringMigrationAccountStore *)self removedWrappedAccountIdentifiers];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
    uint64_t v12 = [v11 objectForKeyedSubscript:v7];

    if (v12)
    {
      uint64_t v13 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedAccounts];
      [v13 removeObjectForKey:v7];

      v14 = [(CalChangeFilteringMigrationAccountStore *)self addedWrappedChildAccounts];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__CalChangeFilteringMigrationAccountStore_removeAccount_error___block_invoke;
      v18[3] = &unk_1E5D61150;
      id v19 = v7;
      [v14 enumerateKeysAndObjectsUsingBlock:v18];
    }
    else
    {
      uint64_t v15 = [(CalChangeFilteringMigrationAccountStore *)self loadedAccounts];
      [v15 removeObjectForKey:v7];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [(CalChangeFilteringMigrationAccountStore *)self removedWrappedAccountIdentifiers];
      [v16 addObject:v7];
      char v10 = 1;
    }
    else
    {
      v16 = [(CalChangeFilteringMigrationAccountStore *)self backingAccountStore];
      char v10 = [v16 removeAccount:v6 error:a4];
    }
  }
  return v10;
}

uint64_t __63__CalChangeFilteringMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = 1;
  }
  else
  {
    int v8 = [(CalChangeFilteringMigrationAccountStore *)self backingAccountStore];
    char v7 = [v8 saveAccount:v6 withError:a4];
  }
  return v7;
}

- (id)_backingAccountForAccount:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 backingAccount];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (CalMigrationAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (CalChangeFilteringMigrationAccountStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CalChangeFilteringMigrationAccountStoreDelegate *)WeakRetained;
}

- (NSMutableDictionary)addedWrappedAccounts
{
  return self->_addedWrappedAccounts;
}

- (NSMutableDictionary)addedWrappedChildAccounts
{
  return self->_addedWrappedChildAccounts;
}

- (NSMutableDictionary)loadedAccounts
{
  return self->_loadedAccounts;
}

- (NSMutableSet)removedWrappedAccountIdentifiers
{
  return self->_removedWrappedAccountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedWrappedAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedAccounts, 0);
  objc_storeStrong((id *)&self->_addedWrappedChildAccounts, 0);
  objc_storeStrong((id *)&self->_addedWrappedAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
}

@end