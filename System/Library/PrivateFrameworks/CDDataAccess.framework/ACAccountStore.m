@interface ACAccountStore
@end

@implementation ACAccountStore

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.dataaccess.statusreport", v2);
  v1 = (void *)_daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__statusReportQueue;
  _daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__statusReportQueue = (uint64_t)v0;
}

id __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_2()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F1CA48] array];
  v1 = _daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion__statusReportQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3;
  block[3] = &unk_1E6570FC0;
  id v2 = v0;
  id v5 = v2;
  dispatch_sync(v1, block);

  return v2;
}

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = +[DAAccountMonitor sharedMonitor];
  v3 = [v2 monitoredAccounts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v9 = [v8 statusReport];
        if (v9) {
          [*(id *)(a1 + 32) addObject:v9];
        }
        [v8 resetStatusReport];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  id v6 = a3;
  id v31 = v6;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        dispatch_group_enter(v8);
        long long v13 = *(void **)(a1 + 32);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_34;
        v22[3] = &unk_1E65712A0;
        v22[4] = v13;
        v25 = v30;
        id v23 = v7;
        v24 = v8;
        [v13 accountWithIdentifier:v12 completion:v22];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v9);
  }

  v14 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_2_37;
  block[3] = &unk_1E65712C8;
  id v15 = *(id *)(a1 + 40);
  id v19 = v7;
  id v20 = v15;
  v21 = v30;
  id v16 = v7;
  dispatch_group_notify(v8, v14, block);

  _Block_object_dispose(v30, 8);
}

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9) {
    objc_storeStrong(v8, a3);
  }
  if (v11)
  {
    uint64_t v10 = +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:");
    if (v10) {
      [*(id *)(a1 + 40) addObject:v10];
    }
  }
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_2_37(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_3_39(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a3);
  }
  objc_sync_exit(v7);

  if (v5)
  {
    id v11 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4_40;
    v13[3] = &unk_1E6571318;
    uint64_t v12 = *(void *)(a1 + 56);
    v13[4] = v11;
    uint64_t v16 = v12;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    [v11 accountsWithAccountType:v5 completion:v13];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_4_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a3);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", *(void *)(*((void *)&v16 + 1) + 8 * v14), (void)v16);
        if (v15) {
          [*(id *)(a1 + 40) addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __129__ACAccountStore_DAExtensions___daAccountsWithAccountTypeIdentifiers_enabledForDADataclasses_filterOnDataclasses_withCompletion___block_invoke_5(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

void __43__ACAccountStore_DAExtensions__da_accounts__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__ACAccountStore_DAExtensions__da_accountsEnabledForDADataclasses___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __94__ACAccountStore_DAExtensions__da_accountsWithAccountTypeIdentifiers_enabledForDADataclasses___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end