@interface ACAccountStore(ESExtensions)
- (id)es_accountsWithAccountTypeIdentifiers:()ESExtensions outError:;
- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:withCompletion:;
- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions withCompletion:;
- (void)_esAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:;
- (void)es_loadESAccountsEnabledForDADataclasses:()ESExtensions withCompletion:;
- (void)es_loadESAccountsWithCompletion:()ESExtensions;
@end

@implementation ACAccountStore(ESExtensions)

- (void)_esAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v22 = a6;
  if ((_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation & 1) == 0)
  {
    _esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation = 1;
    if ((_sESIsRunningInExchangeSyncD & 1) == 0)
    {
      if (_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken != -1) {
        dispatch_once(&_esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken, &__block_literal_global_0);
      }
      v9 = objc_msgSend(MEMORY[0x263F3B9B0], "sharedConnection", v22);
      [v9 registerForInterrogationWithBlock:&__block_literal_global_4];
    }
  }
  if (a5)
  {
    v10 = acDataclassesForDADataclasses();
    v11 = [v10 allObjects];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4;
    v39[3] = &unk_264DA1BA8;
    v39[4] = a1;
    id v40 = v22;
    id v12 = v22;
    [a1 accountIdentifiersEnabledForDataclasses:v11 withAccountTypeIdentifiers:v23 completion:v39];
  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__0;
    v37[4] = __Block_byref_object_dispose__0;
    id v38 = 0;
    v13 = [MEMORY[0x263EFF980] array];
    v14 = dispatch_group_create();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v23;
    uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          dispatch_group_enter(v14);
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_12;
          v29[3] = &unk_264DA1BF8;
          v29[4] = a1;
          v32 = v37;
          id v30 = v13;
          v31 = v14;
          [a1 accountTypeWithIdentifier:v18 completion:v29];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v15);
    }

    v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __129__ACAccountStore_ESExtensions___esAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_5;
    block[3] = &unk_264DA1B80;
    id v26 = v13;
    id v27 = v22;
    v28 = v37;
    id v20 = v13;
    id v21 = v22;
    dispatch_group_notify(v14, v19, block);

    _Block_object_dispose(v37, 8);
  }
}

- (void)es_loadESAccountsWithCompletion:()ESExtensions
{
  v4 = (void *)MEMORY[0x263F38D48];
  id v5 = a3;
  id v7 = [v4 _leafAccountTypes];
  v6 = [v7 allObjects];
  [a1 _esAccountsWithAccountTypeIdentifiers:v6 enabledForDADataclasses:0 filterOnDataclasses:0 withCompletion:v5];
}

- (void)es_loadESAccountsEnabledForDADataclasses:()ESExtensions withCompletion:
{
  v6 = (void *)MEMORY[0x263F38D48];
  id v7 = a4;
  id v9 = [v6 _leafAccountTypes];
  v8 = [v9 allObjects];
  [a1 _esAccountsWithAccountTypeIdentifiers:v8 enabledForDADataclasses:a3 filterOnDataclasses:1 withCompletion:v7];
}

- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions withCompletion:
{
  return [a1 _esAccountsWithAccountTypeIdentifiers:a3 enabledForDADataclasses:0 filterOnDataclasses:0 withCompletion:a4];
}

- (uint64_t)es_loadESAccountsWithAccountTypeIdentifiers:()ESExtensions enabledForDADataclasses:withCompletion:
{
  return [a1 _esAccountsWithAccountTypeIdentifiers:a3 enabledForDADataclasses:a4 filterOnDataclasses:1 withCompletion:a5];
}

- (id)es_accountsWithAccountTypeIdentifiers:()ESExtensions outError:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
  if (v5)
  {
    v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v19 = v5;
      uint64_t v10 = *(void *)v21;
      os_log_type_t v11 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v14 = +[ESAccount esAccountSubclassWithBackingAccountInfo:v13];
          if (v14)
          {
            [v6 addObject:v14];
          }
          else
          {
            uint64_t v15 = DALoggingwithCategory();
            if (os_log_type_enabled(v15, v11))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v25 = v13;
              _os_log_impl(&dword_239784000, v15, v11, "Could not convert ACAccount (%@) to DAAccount", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
      id v5 = v19;
    }
  }
  else
  {
    id v7 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v7, v16))
    {
      uint64_t v17 = *a4;
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v17;
      _os_log_impl(&dword_239784000, v7, v16, "Could not load ACAccounts due to Account Error %@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

@end