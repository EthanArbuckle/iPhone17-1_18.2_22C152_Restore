@interface ACAccountStore(DAExtensions)
- (id)da_accounts;
- (id)da_accountsEnabledForDADataclasses:()DAExtensions;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions outError:;
- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:withCompletion:;
- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions withCompletion:;
- (void)_daAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:;
- (void)da_loadDAAccountsEnabledForDADataclasses:()DAExtensions withCompletion:;
- (void)da_loadDAAccountsWithCompletion:()DAExtensions;
@end

@implementation ACAccountStore(DAExtensions)

- (void)_daAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a6;
  if ((_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation & 1) == 0)
  {
    _daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___haveRegisteredForInterrogation = 1;
    if ((_sDAIsRunningInDataAccessD & 1) == 0)
    {
      if (_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken != -1) {
        dispatch_once(&_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken, &__block_literal_global_2);
      }
      v10 = objc_msgSend(MEMORY[0x1E4F50E30], "sharedConnection", v23);
      [v10 registerForInterrogationWithBlock:&__block_literal_global_31];
    }
  }
  if (a5)
  {
    v11 = acDataclassesForDADataclasses(a4);
    v12 = [v11 allObjects];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4;
    v40[3] = &unk_1E65712F0;
    v40[4] = a1;
    id v41 = v23;
    id v13 = v23;
    [a1 accountIdentifiersEnabledForDataclasses:v12 withAccountTypeIdentifiers:v24 completion:v40];
  }
  else
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__1;
    v38[4] = __Block_byref_object_dispose__1;
    id v39 = 0;
    v14 = [MEMORY[0x1E4F1CA48] array];
    v15 = dispatch_group_create();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v24;
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          dispatch_group_enter(v15);
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_39;
          v30[3] = &unk_1E6571340;
          v30[4] = a1;
          v33 = v38;
          id v31 = v14;
          v32 = v15;
          [a1 accountTypeWithIdentifier:v19 completion:v30];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v16);
    }

    v20 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_5;
    block[3] = &unk_1E65712C8;
    id v27 = v14;
    id v28 = v23;
    v29 = v38;
    id v21 = v14;
    id v22 = v23;
    dispatch_group_notify(v15, v20, block);

    _Block_object_dispose(v38, 8);
  }
}

- (void)da_loadDAAccountsWithCompletion:()DAExtensions
{
  id v4 = a3;
  id v6 = +[DAAccount _leafAccountTypes];
  v5 = [v6 allObjects];
  [a1 _daAccountsWithAccountTypeIdentifiers:v5 enabledForDADataclasses:0 filterOnDataclasses:0 withCompletion:v4];
}

- (void)da_loadDAAccountsEnabledForDADataclasses:()DAExtensions withCompletion:
{
  id v6 = a4;
  id v8 = +[DAAccount _leafAccountTypes];
  v7 = [v8 allObjects];
  [a1 _daAccountsWithAccountTypeIdentifiers:v7 enabledForDADataclasses:a3 filterOnDataclasses:1 withCompletion:v6];
}

- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions withCompletion:
{
  return [a1 _daAccountsWithAccountTypeIdentifiers:a3 enabledForDADataclasses:0 filterOnDataclasses:0 withCompletion:a4];
}

- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:withCompletion:
{
  return [a1 _daAccountsWithAccountTypeIdentifiers:a3 enabledForDADataclasses:a4 filterOnDataclasses:1 withCompletion:a5];
}

- (id)da_accounts
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  id v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ACAccountStore_DAExtensions__da_accounts__block_invoke;
  v6[3] = &unk_1E6571368;
  id v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(a1, "da_loadDAAccountsWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)da_accountsEnabledForDADataclasses:()DAExtensions
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ACAccountStore_DAExtensions__da_accountsEnabledForDADataclasses___block_invoke;
  v9[3] = &unk_1E6571368;
  uint64_t v11 = &v12;
  id v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "da_loadDAAccountsEnabledForDADataclasses:withCompletion:", a3, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers___block_invoke;
  v9[3] = &unk_1E6571368;
  uint64_t v11 = &v12;
  id v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:withCompletion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions outError:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v5 = objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
  if (v5)
  {
    id v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v19 = v5;
      uint64_t v10 = *(void *)v21;
      os_log_type_t v11 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v13];
          if (v14)
          {
            [v6 addObject:v14];
          }
          else
          {
            v15 = DALoggingwithCategory();
            if (os_log_type_enabled(v15, v11))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v25 = v13;
              _os_log_impl(&dword_1C86FF000, v15, v11, "Could not convert ACAccount (%@) to DAAccount", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
      dispatch_semaphore_t v5 = v19;
    }
  }
  else
  {
    id v7 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
    if (os_log_type_enabled(v7, v16))
    {
      uint64_t v17 = *a4;
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1C86FF000, v7, v16, "Could not load ACAccounts due to Account Error %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers_enabledForDADataclasses___block_invoke;
  v11[3] = &unk_1E6571368;
  uint64_t v13 = &v14;
  uint64_t v8 = v7;
  uint64_t v12 = v8;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:withCompletion:", v6, a4, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

@end