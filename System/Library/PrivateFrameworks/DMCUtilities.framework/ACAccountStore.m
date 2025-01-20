@interface ACAccountStore
@end

@implementation ACAccountStore

uint64_t __77__ACAccountStore_DeviceManagementClient__dmc_visibleRemoteManagementAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_isVisibleRemoteManagementAccount");
}

uint64_t __86__ACAccountStore_DeviceManagementClient__dmc_visibleSecondaryRemoteManagementAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_msgSend(v2, "dmc_altDSID");

  if (v3)
  {
    v4 = [MEMORY[0x1E4F179C8] defaultStore];
    v5 = objc_msgSend(v2, "dmc_altDSID");
    v6 = objc_msgSend(v4, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v5);

    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "dmc_isPrimaryAccount") ^ 1;
    }
    else
    {
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        v10 = objc_msgSend(v2, "dmc_altDSID");
        int v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1A7863000, v9, OS_LOG_TYPE_ERROR, "No iCloud account for altDSID: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __66__ACAccountStore_DeviceManagementClient__dmc_primaryiCloudAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dmc_isPrimaryAccount");
}

BOOL __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 username];
  BOOL v4 = [v3 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

uint64_t __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 username];
  if ([v4 caseInsensitiveCompare:*(void *)(a1 + 32)]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v3 isActive];
  }

  return v5;
}

uint64_t __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "dmc_altDSID");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "dmc_altDSID");
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v5 = [v3 isActive];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL __72__ACAccountStore_DeviceManagementClient__dmc_iCloudAccountWithUsername___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 username];
  BOOL v4 = [v3 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

uint64_t __96__ACAccountStore_DeviceManagementClient__dmc_updateAppleAccountWithPersonaID_error_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "dmc_personaIdentifier");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke_2;
  v6[3] = &unk_1E5CFD4D0;
  long long v8 = *(_OWORD *)(a1 + 48);
  dispatch_semaphore_t v7 = v2;
  uint64_t v5 = v2;
  [v3 saveVerifiedAccount:v4 withCompletionHandler:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __96__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithAltDSID_asynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "dmc_altDSID");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __98__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithPersonaID_asynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "dmc_personaIdentifier");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __73__ACAccountStore_DeviceManagementClient__dmc_accountsWithPredicateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  dispatch_semaphore_t v7 = [a2 accountType];
  long long v8 = [v7 identifier];
  uint64_t v9 = [v5 indexOfObject:v8];
  v10 = *(void **)(a1 + 32);
  v11 = [v6 accountType];

  int v12 = [v11 identifier];
  uint64_t v13 = v9 - [v10 indexOfObject:v12];

  return v13;
}

uint64_t __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  dispatch_semaphore_t v7 = [a2 accountType];
  long long v8 = [v7 identifier];
  uint64_t v9 = [v5 indexOfObject:v8];

  v10 = *(void **)(a1 + 32);
  v11 = [v6 accountType];

  int v12 = [v11 identifier];
  uint64_t v13 = [v10 indexOfObject:v12];

  if (v9 < v13) {
    return -1;
  }
  else {
    return v9 > v13;
  }
}

void __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    id v6 = [v4 identifier];
    dispatch_semaphore_t v7 = [*(id *)(a1 + 32) accountType];
    long long v8 = [v7 description];
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEFAULT, "Will remove account: %{public}@ , type: %{public}@", buf, 0x16u);
  }
  uint64_t v11 = a1 + 32;
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v11 + 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_11;
  v13[3] = &unk_1E5CFD570;
  v13[4] = v9;
  dispatch_semaphore_t v14 = v2;
  int v12 = v2;
  [v10 removeAccount:v9 withCompletionHandler:v13];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_11(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *DMCLogObjects();
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = *(void **)(a1 + 32);
      uint64_t v13 = v6;
      dispatch_semaphore_t v14 = [v12 identifier];
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "Cannot remove account with ID: %@. Error: %{public}@", buf, 0x16u);
    }
    long long v8 = objc_opt_new();
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "identifier", @"Account Identifier");
    uint64_t v9 = (void *)v15;
    if (v15) {
      v16 = (__CFString *)v15;
    }
    else {
      v16 = &stru_1EFD813E0;
    }
    v22[1] = @"Type";
    v23[0] = v16;
    __int16 v17 = [*(id *)(a1 + 32) accountType];
    uint64_t v18 = [v17 identifier];
    uint64_t v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = &stru_1EFD813E0;
    }
    v23[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v8 logErrorEventForTopic:@"Accounts" reason:@"Account Removal Failed" error:v5 details:v21];

    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v7 = *(void **)(a1 + 32);
    long long v8 = v6;
    uint64_t v9 = [v7 identifier];
    v10 = [*(id *)(a1 + 32) accountType];
    uint64_t v11 = [v10 description];
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEFAULT, "Account removed: %{public}@ , type: %{public}@", buf, 0x16u);

LABEL_13:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end