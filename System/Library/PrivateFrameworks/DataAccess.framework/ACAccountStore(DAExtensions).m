@interface ACAccountStore(DAExtensions)
- (id)da_accounts;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:;
- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions outError:;
- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:withCompletion:;
- (uint64_t)da_loadDAAccountsWithAccountTypeIdentifiers:()DAExtensions withCompletion:;
- (void)_daAccountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:filterOnDataclasses:withCompletion:;
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
        dispatch_once(&_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__onceToken, &__block_literal_global_28);
      }
      v10 = objc_msgSend(MEMORY[0x1E4F5E950], "sharedConnection", v23);
      [v10 registerForInterrogationWithBlock:&__block_literal_global_33];
    }
  }
  if (a5)
  {
    v11 = acDataclassesForDADataclasses(a4);
    v12 = [v11 allObjects];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4;
    v40[3] = &unk_1E6211B88;
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
    v38[3] = __Block_byref_object_copy__3;
    v38[4] = __Block_byref_object_dispose__3;
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
          v30[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_41;
          v30[3] = &unk_1E6211BD8;
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
    block[3] = &unk_1E6211B60;
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
  v4 = (void *)MEMORY[0x1E4F5E990];
  id v5 = a3;
  id v7 = [v4 leafAccountTypes];
  v6 = [v7 allObjects];
  [a1 _daAccountsWithAccountTypeIdentifiers:v6 enabledForDADataclasses:0 filterOnDataclasses:0 withCompletion:v5];
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
  v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ACAccountStore_DAExtensions__da_accounts__block_invoke;
  v6[3] = &unk_1E6211C00;
  v8 = &v9;
  v3 = v2;
  id v7 = v3;
  objc_msgSend(a1, "da_loadDAAccountsWithCompletion:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers___block_invoke;
  v9[3] = &unk_1E6211C00;
  uint64_t v11 = &v12;
  v6 = v5;
  v10 = v6;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:withCompletion:", v4, v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions outError:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    uint64_t v10 = *MEMORY[0x1E4F17798];
    uint64_t v11 = *MEMORY[0x1E4F177D0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v13 isEqualToString:v10] & 1) == 0
          && ([v13 isEqualToString:v11] & 1) == 0)
        {
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2 object:a1 file:@"DAUtils.m" lineNumber:329 description:@"Only supports Exchange account types"];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v8);
  }

  id v27 = [a1 accountsWithAccountTypeIdentifiers:v7 error:a4];
  if (v27)
  {
    id v28 = (id)objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v15 = v27;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      os_log_type_t v18 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          if (!ExchangeSyncLibraryCore_0()) {
            goto LABEL_22;
          }
          uint64_t v37 = 0;
          v38 = &v37;
          uint64_t v39 = 0x2050000000;
          id v21 = (void *)getESAccountClass_softClass_0;
          uint64_t v40 = getESAccountClass_softClass_0;
          if (!getESAccountClass_softClass_0)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v44 = __getESAccountClass_block_invoke_0;
            v45 = &unk_1E6211758;
            v46 = &v37;
            __getESAccountClass_block_invoke_0((uint64_t)&buf);
            id v21 = (void *)v38[3];
          }
          id v22 = v21;
          _Block_object_dispose(&v37, 8);
          id v23 = [v22 esAccountSubclassWithBackingAccountInfo:v20];
          if (v23)
          {
            [v28 addObject:v23];
          }
          else
          {
LABEL_22:
            id v23 = DALoggingwithCategory();
            if (os_log_type_enabled(v23, v18))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_1BA384000, v23, v18, "Could not convert ACAccount (%@) to DAAccount", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v16);
    }
  }
  else
  {
    v15 = DALoggingwithCategory();
    os_log_type_t v24 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v15, v24))
    {
      uint64_t v25 = *a4;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1BA384000, v15, v24, "Could not load ACAccounts due to Account Error %@", (uint8_t *)&buf, 0xCu);
    }
    id v28 = 0;
  }

  return v28;
}

- (id)da_accountsWithAccountTypeIdentifiers:()DAExtensions enabledForDADataclasses:
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  os_log_type_t v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers_enabledForDADataclasses___block_invoke;
  v11[3] = &unk_1E6211C00;
  id v13 = &v14;
  uint64_t v8 = v7;
  uint64_t v12 = v8;
  objc_msgSend(a1, "da_loadDAAccountsWithAccountTypeIdentifiers:enabledForDADataclasses:withCompletion:", v6, a4, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

@end