@interface CalACMigrationAccountStore
+ (id)sharedInstance;
- (BOOL)removeAccount:(id)a3 error:(id *)a4;
- (BOOL)saveAccount:(id)a3 withError:(id *)a4;
- (id)accountWithIdentifier:(id)a3;
- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4;
- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5;
- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
@end

@implementation CalACMigrationAccountStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __44__CalACMigrationAccountStore_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CalACMigrationAccountStore);
  uint64_t v1 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)accountWithIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F57660];
  id v4 = a3;
  v5 = [v3 defaultProvider];
  v6 = [v5 accountWithIdentifier:v4];

  if (v6) {
    v7 = [[CalACMigrationAccount alloc] initWithACAccount:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F57660] defaultProvider];
  v7 = [v6 accountsWithAccountTypeIdentifier:v5 error:a4];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
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
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "parentAccount", (void)v19);

          if (!v15)
          {
            v16 = [[CalACMigrationAccount alloc] initWithACAccount:v14];
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    v17 = (void *)[v8 copy];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 account];
    v8 = [v7 accountStore];
    id v9 = [v8 childAccountsForAccount:v7 withTypeIdentifier:v6];

    if (v9)
    {
      long long v19 = v7;
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
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
            v16 = [[CalACMigrationAccount alloc] initWithACAccount:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      v17 = (void *)[v10 copy];
      v7 = v19;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)createAccountWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v4 = (void *)MEMORY[0x1E4F57660];
  id v5 = a3;
  id v6 = [v4 defaultProvider];
  v7 = [v6 accountTypeWithIdentifier:v5];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v7];
    [v8 setActive:1];
    id v9 = [[CalACMigrationAccount alloc] initWithACAccount:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)createChildAccountOfParent:(id)a3 withAccountTypeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 account];
    id v11 = [(CalACMigrationAccountStore *)self createAccountWithAccountTypeIdentifier:v9 error:a5];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 account];
      [v13 setParentAccount:v10];

      id v14 = v12;
    }
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.calendar.ACMigrationAccountStoreErrors" code:1 userInfo:0];
    uint64_t v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 account];
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__1;
    uint64_t v25 = __Block_byref_object_dispose__1;
    id v26 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [v7 accountStore];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__CalACMigrationAccountStore_removeAccount_error___block_invoke;
    v13[3] = &unk_1E5D6AB40;
    v15 = &v21;
    v16 = &v17;
    uint64_t v10 = v8;
    id v14 = v10;
    [v9 removeAccount:v7 withDeleteSync:0 completion:v13];

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a4) {
      *a4 = (id) v22[5];
    }
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.calendar.ACMigrationAccountStoreErrors" code:1 userInfo:0];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __50__CalACMigrationAccountStore_removeAccount_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 account];
    v7 = [MEMORY[0x1E4F57660] defaultProvider];
    char v8 = [v7 saveAccount:v6 verify:0 withError:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.calendar.ACMigrationAccountStoreErrors" code:1 userInfo:0];
    char v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end