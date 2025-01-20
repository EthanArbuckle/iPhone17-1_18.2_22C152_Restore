@interface DAAccountChangeHandler
+ (BOOL)_handleAccountAddOrModify:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6;
+ (BOOL)_handleCalDAVAccountModifiedByDataAccess:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6;
+ (BOOL)_handleChangeToSubscribedCalendar:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6;
+ (BOOL)_sanityCheckCalDAVAccount:(id)a3 accountChangeInfo:(id)a4;
+ (BOOL)_sanityCheckChildAccountOfType:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5 inStore:(id)a6 updater:(id)a7;
+ (BOOL)_sanityCheckChildDAVAccount:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5;
+ (BOOL)_sanityCheckChildSubCalAccountsWithParent:(id)a3 inStore:(id)a4 accountUpdater:(id)a5;
+ (BOOL)_sanityCheckEnabledDataclassesOnExchangeAccountInfo:(id)a3;
+ (BOOL)_updateCalendarFromAccount:(id)a3;
+ (BOOL)_updateSubscribedCalendarAccountProperties:(id)a3;
+ (BOOL)handleAccountWillChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5 accountUpdater:(id)a6;
+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4;
+ (id)_findSubscribedCalendarForAccount:(id)a3 inEventStore:(id)a4;
+ (id)_pickAccountToKeepWithAccount:(id)a3 andAccount:(id)a4;
+ (id)_supportedChildAccountTypesForParentAccountType:(id)a3;
+ (void)_cleanupStoreForDisabledAccount:(id)a3 inStore:(id)a4;
+ (void)_handleAccountDelete:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5;
+ (void)_performBlockWithGenericClientDBForAccount:(id)a3 block:(id)a4;
+ (void)_setupStoreForNewAccount:(id)a3;
+ (void)handleAccountDidChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5;
@end

@implementation DAAccountChangeHandler

+ (BOOL)handleAccountWillChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5 accountUpdater:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = DALoggingwithCategory();
  os_log_type_t v15 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v14, v15))
  {
    int v20 = 138543362;
    id v21 = v11;
    _os_log_impl(&dword_1BA384000, v14, v15, "Handling account will change %{public}@", (uint8_t *)&v20, 0xCu);
  }

  unint64_t v16 = [v11 changeType];
  if (v16 >= 2)
  {
    if (v16 != 3)
    {
      BOOL v18 = 0;
      goto LABEL_9;
    }
    char v17 = [a1 _handleCalDAVAccountModifiedByDataAccess:v10 withChangeInfo:v11 inStore:v12 accountUpdater:v13];
  }
  else
  {
    char v17 = [a1 _handleAccountAddOrModify:v10 withChangeInfo:v11 inStore:v12 accountUpdater:v13];
  }
  BOOL v18 = v17;
LABEL_9:

  return v18;
}

+ (void)handleAccountDidChange:(id)a3 withChangeInfo:(id)a4 store:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v11, v12))
  {
    int v25 = 138543362;
    id v26 = v9;
    _os_log_impl(&dword_1BA384000, v11, v12, "Handling account did change %{public}@", (uint8_t *)&v25, 0xCu);
  }

  unint64_t v13 = [v9 changeType];
  if (v13 == 2)
  {
    [a1 _handleAccountDelete:v8 withChangeInfo:v9 inStore:v10];
  }
  else if (v13 <= 1)
  {
    v14 = [v9 accountTypeIdentifier];
    if ([v9 changeType] == 1)
    {
      os_log_type_t v15 = [MEMORY[0x1E4F5E990] leafAccountTypes];
      int v16 = [v15 containsObject:v14];

      if (v16)
      {
        char v17 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v8];
        [v17 accountDidChangeWithChangeInfo:v9];
      }
    }
    if ([v9 changeType] == 1)
    {
      BOOL v18 = [v9 modifiedDataClasses];
      uint64_t v19 = *MEMORY[0x1E4F17568];
      int v20 = [v18 containsObject:*MEMORY[0x1E4F17568]];

      if (v20)
      {
        id v21 = [v8 enabledDataclasses];
        char v22 = [v21 containsObject:v19];

        if (v22) {
          [a1 _setupStoreForNewAccount:v8];
        }
        else {
          [a1 _cleanupStoreForDisabledAccount:v8 inStore:v10];
        }
      }
    }
    if (![v9 changeType])
    {
      v23 = [v8 enabledDataclasses];
      int v24 = [v23 containsObject:*MEMORY[0x1E4F17568]];

      if (v24) {
        [a1 _setupStoreForNewAccount:v8];
      }
    }
  }
}

+ (id)_supportedChildAccountTypesForParentAccountType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F177E8]])
  {
    uint64_t v14 = *MEMORY[0x1E4F177F8];
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = &v14;
LABEL_3:
    uint64_t v6 = 1;
LABEL_9:
    id v8 = objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v10, v11, v12, v13, v14, v15);
    goto LABEL_10;
  }
  if (([v3 isEqualToString:*MEMORY[0x1E4F177C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F17878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F17820]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x1E4F17750]])
  {
    uint64_t v7 = *MEMORY[0x1E4F17778];
    uint64_t v11 = *MEMORY[0x1E4F17770];
    uint64_t v12 = v7;
    uint64_t v13 = *MEMORY[0x1E4F177F8];
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = &v11;
    uint64_t v6 = 3;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F17740]])
  {
    uint64_t v10 = *MEMORY[0x1E4F177F8];
    v4 = (void *)MEMORY[0x1E4F1C978];
    v5 = &v10;
    goto LABEL_3;
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)_handleAccountAddOrModify:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 accountTypeIdentifier];
  if (![v14 isEqualToString:*MEMORY[0x1E4F17770]])
  {
    if (([v14 isEqualToString:*MEMORY[0x1E4F17798]] & 1) != 0
      || [v14 isEqualToString:*MEMORY[0x1E4F177D0]])
    {
      int v20 = DALoggingwithCategory();
      os_log_type_t v21 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v14;
        _os_log_impl(&dword_1BA384000, v20, v21, "Found an account of type %{public}@.  Sanity check enabled dataclasses.", buf, 0xCu);
      }

      if ([a1 _sanityCheckEnabledDataclassesOnExchangeAccountInfo:v10]) {
        goto LABEL_11;
      }
    }
    else
    {
      if (![v14 isEqualToString:*MEMORY[0x1E4F17858]])
      {
        id v22 = [a1 _supportedChildAccountTypesForParentAccountType:v14];
        if ([v22 count])
        {
          v28 = DALoggingwithCategory();
          os_log_type_t v29 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
          if (os_log_type_enabled(v28, v29))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v14;
            _os_log_impl(&dword_1BA384000, v28, v29, "Found a parent account of type %{public}@. Sanity checking child accounts for it.", buf, 0xCu);
          }
          v34 = v14;

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v22 = v22;
          uint64_t v30 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            int v17 = 0;
            uint64_t v32 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v38 != v32) {
                  objc_enumerationMutation(v22);
                }
                v17 |= objc_msgSend(a1, "_sanityCheckChildAccountOfType:withParent:accountChangeInfo:inStore:updater:", *(void *)(*((void *)&v37 + 1) + 8 * i), v10, v11, v12, v13, v34);
              }
              uint64_t v31 = [v22 countByEnumeratingWithState:&v37 objects:v41 count:16];
            }
            while (v31);
          }
          else
          {
            LOBYTE(v17) = 0;
          }

          uint64_t v14 = v34;
        }
        else
        {
          LOBYTE(v17) = 0;
        }
        goto LABEL_12;
      }
      v23 = DALoggingwithCategory();
      os_log_type_t v24 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138543362;
        v43 = v14;
        _os_log_impl(&dword_1BA384000, v23, v24, "Found an account of type %{public}@.  Sanity check account properties.", buf, 0xCu);
      }

      char v25 = [a1 _sanityCheckSubscribedCalendarAccountInfo:v10];
      int v26 = [a1 _handleChangeToSubscribedCalendar:v10 withChangeInfo:v11 inStore:v12 accountUpdater:v13];
      if ((v25 & 1) != 0 || v26)
      {
LABEL_11:
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __90__DAAccountChangeHandler__handleAccountAddOrModify_withChangeInfo_inStore_accountUpdater___block_invoke;
        v35[3] = &unk_1E62119A0;
        id v36 = v10;
        [v13 updateAccount:v36 withCompletionHandler:v35];
        LOBYTE(v17) = 1;
        id v22 = v36;
LABEL_12:

        goto LABEL_19;
      }
    }
    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  uint64_t v15 = DALoggingwithCategory();
  os_log_type_t v16 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl(&dword_1BA384000, v15, v16, "Found a parent account of type %{public}@. Sanity checking child accounts for it.", buf, 0xCu);
  }

  LOBYTE(v17) = [a1 _sanityCheckChildSubCalAccountsWithParent:v10 inStore:v12 accountUpdater:v13];
  BOOL v18 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v10];
  char v19 = [a1 _sanityCheckCalDAVAccount:v18 accountChangeInfo:v11];

  if (v19) {
    goto LABEL_11;
  }
LABEL_19:

  return v17 & 1;
}

void __90__DAAccountChangeHandler__handleAccountAddOrModify_withChangeInfo_inStore_accountUpdater___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BA384000, v6, v7, "_handleAccountAddOrModify: Failed to save account with identifier %{public}@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

+ (void)_handleAccountDelete:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 identifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__DAAccountChangeHandler__handleAccountDelete_withChangeInfo_inStore___block_invoke;
  v13[3] = &unk_1E62119C8;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [a1 _performBlockWithGenericClientDBForAccount:v10 block:v13];
}

void __70__DAAccountChangeHandler__handleAccountDelete_withChangeInfo_inStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F57488];
  id v7 = [*(id *)(a1 + 32) accountIdentifier];
  [v6 removeStoreForDeletedAccountWithIdentifier:v7 inDatabase:a3 mainDatabase:a2 accountStore:*(void *)(a1 + 40)];
}

+ (void)_cleanupStoreForDisabledAccount:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__DAAccountChangeHandler__cleanupStoreForDisabledAccount_inStore___block_invoke;
  v11[3] = &unk_1E62119C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [a1 _performBlockWithGenericClientDBForAccount:v8 block:v11];
}

void __66__DAAccountChangeHandler__cleanupStoreForDisabledAccount_inStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x1E4F57488];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 childAccounts];
  [v6 removeStoreForAccount:v7 withChildren:v8 inDatabase:a3 mainDatabase:a2 accountStore:*(void *)(a1 + 40)];
}

+ (void)_setupStoreForNewAccount:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 accountType];
  id v6 = [v5 identifier];
  if ([v6 isEqualToString:*MEMORY[0x1E4F17858]]) {
    goto LABEL_4;
  }
  id v7 = [v4 accountType];
  id v8 = [v7 identifier];
  if ([v8 isEqualToString:*MEMORY[0x1E4F177C8]])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v12 = [v4 accountType];
  id v13 = [v12 identifier];
  char v14 = [v13 isEqualToString:*MEMORY[0x1E4F17838]];

  if (v14)
  {
LABEL_5:
    id v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = [v4 identifier];
      *(_DWORD *)buf = 138543362;
      int v26 = v11;
      _os_log_impl(&dword_1BA384000, v9, v10, "Not creating a store for account %{public}@ because it is not appropriate", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v15 = [v4 parentAccount];
  id v9 = v15;
  if (v15
    && ([v15 accountType],
        os_log_type_t v16 = objc_claimAutoreleasedReturnValue(),
        [v16 identifier],
        int v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 isEqualToString:*MEMORY[0x1E4F17770]],
        v17,
        v16,
        v18))
  {
    char v19 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = [v4 identifier];
      *(_DWORD *)buf = 138543362;
      int v26 = v21;
      _os_log_impl(&dword_1BA384000, v19, v20, "Not creating a store for account %{public}@ because it is the child of a CalDAV account", buf, 0xCu);
    }
  }
  else
  {
    id v22 = [v4 identifier];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__DAAccountChangeHandler__setupStoreForNewAccount___block_invoke;
    v23[3] = &unk_1E62119F0;
    os_log_type_t v24 = v4;
    [a1 _performBlockWithGenericClientDBForAccount:v22 block:v23];

    char v19 = v24;
  }

LABEL_14:
}

void __51__DAAccountChangeHandler__setupStoreForNewAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)MEMORY[0x1E4F57488];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 childAccounts];
  [v4 setUpCalStoreForParentAccount:v5 withChildren:v6 inDatabase:a3];
}

+ (void)_performBlockWithGenericClientDBForAccount:(id)a3 block:(id)a4
{
  id v5 = (void (**)(id, uint64_t, uint64_t))a4;
  id v6 = a3;
  id v7 = +[DALocalDBHelper sharedInstanceForAccountType:@"GenericDataAccessAccount" creatingClass:0];
  [v7 calOpenDatabaseAsGenericClientForAccountID:0];
  [v7 calOpenDatabaseAsGenericClientForAccountID:v6];
  v5[2](v5, [v7 calDatabaseForAccountID:0], objc_msgSend(v7, "calDatabaseForAccountID:", v6));

  [v7 calCloseDatabaseForAccountID:v6 save:0];
  [v7 calCloseDatabaseForAccountID:0 save:0];
}

+ (BOOL)_handleCalDAVAccountModifiedByDataAccess:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  return [a1 _sanityCheckChildSubCalAccountsWithParent:a3 inStore:a5 accountUpdater:a6];
}

+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v11 = 0;
  id v6 = [a4 accountTypeWithAccountTypeIdentifier:v5 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    id v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1BA384000, v8, v9, "Couldn't find an account type with identifier %{public}@, error = %@", buf, 0x16u);
    }
  }
  return v6;
}

+ (BOOL)_sanityCheckChildSubCalAccountsWithParent:(id)a3 inStore:(id)a4 accountUpdater:(id)a5
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v93 = a4;
  id v99 = a5;
  id v8 = [MEMORY[0x1E4F5E990] CalDAVSubscribedCalendarsKey];
  v94 = v7;
  os_log_type_t v9 = [v7 objectForKeyedSubscript:v8];

  v102 = v9;
  os_log_type_t v10 = [v9 allKeys];
  v89 = v10;
  if ([v10 count])
  {
    v111 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v10, v10);
  }
  else
  {
    v111 = 0;
  }
  v104 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v89);
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v11 = [v7 childAccounts];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v140 objects:v149 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v141;
    uint64_t v15 = *MEMORY[0x1E4F17858];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v141 != v14) {
          objc_enumerationMutation(v11);
        }
        int v17 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        int v18 = [v17 accountType];
        char v19 = [v18 identifier];
        int v20 = [v19 isEqualToString:v15];

        if (v20)
        {
          os_log_type_t v21 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v17];
          id v22 = [v21 calDAVURLPath];
          if ([v22 length])
          {
            [v104 setObject:v17 forKeyedSubscript:v22];
          }
          else
          {
            v23 = [v17 identifier];
            [v104 setObject:v17 forKeyedSubscript:v23];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v140 objects:v149 count:16];
    }
    while (v13);
  }

  v92 = [MEMORY[0x1E4F1CA60] dictionary];
  os_log_type_t v24 = [MEMORY[0x1E4F1CA48] array];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v25 = v111;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v136 objects:v148 count:16];
  uint64_t v27 = v99;
  v28 = v104;
  if (v26)
  {
    uint64_t v29 = v26;
    uint64_t v30 = *(void *)v137;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v137 != v30) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = *(void *)(*((void *)&v136 + 1) + 8 * j);
        v33 = [v104 objectForKeyedSubscript:v32];

        if (!v33)
        {
          v34 = [v102 objectForKeyedSubscript:v32];
          [v92 setObject:v34 forKeyedSubscript:v32];
        }
      }
      uint64_t v29 = [v25 countByEnumeratingWithState:&v136 objects:v148 count:16];
    }
    while (v29);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v35 = [v104 allKeys];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v132 objects:v147 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v133;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v133 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v132 + 1) + 8 * k);
        if (([v25 containsObject:v40] & 1) == 0)
        {
          v41 = [v104 objectForKeyedSubscript:v40];
          [v24 addObject:v41];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v132 objects:v147 count:16];
    }
    while (v37);
  }
  id v98 = v25;

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  obuint64_t j = v24;
  uint64_t v42 = [obj countByEnumeratingWithState:&v128 objects:v146 count:16];
  BOOL v95 = v42 != 0;
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v129;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v129 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = *(void *)(*((void *)&v128 + 1) + 8 * m);
        uint64_t v123 = MEMORY[0x1E4F143A8];
        uint64_t v124 = 3221225472;
        v125 = __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke;
        v126 = &unk_1E62119A0;
        uint64_t v127 = v46;
        objc_msgSend(v99, "removeAccount:completion:");
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v128 objects:v146 count:16];
    }
    while (v43);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v96 = [v102 allKeys];
  uint64_t v103 = [v96 countByEnumeratingWithState:&v119 objects:v145 count:16];
  if (v103)
  {
    uint64_t v100 = *(void *)v120;
    uint64_t v91 = *MEMORY[0x1E4F17858];
    unint64_t v47 = 0x1E4F5E000uLL;
    v48 = v98;
    while (1)
    {
      for (uint64_t n = 0; n != v103; ++n)
      {
        if (*(void *)v120 != v100) {
          objc_enumerationMutation(v96);
        }
        v50 = *(void **)(*((void *)&v119 + 1) + 8 * n);
        v51 = [v28 objectForKeyedSubscript:v50];
        v112 = v51;
        if (!v51)
        {
          v52 = [a1 _accountTypeWithIdentifier:v91 inStore:v93];
          v51 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v52];
          [v51 setParentAccount:v94];
          [v51 setAuthenticated:1];
        }
        v53 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v51];
        v54 = v53;
        if (v53)
        {
          v55 = [v53 calDAVURLPath];
          uint64_t v110 = n;
          v108 = v55;
          if (v55 == v50 || ([v55 isEqualToString:v50] & 1) != 0)
          {
            char v56 = 0;
          }
          else
          {
            [v54 setCalDAVURLPath:v50];
            char v56 = 1;
          }
          v57 = [v102 objectForKeyedSubscript:v50];
          int v58 = [v54 shouldRemoveAlarms];
          v59 = [*(id *)(v47 + 2448) SubCalFilterAlarmsKey];
          v60 = [v57 objectForKeyedSubscript:v59];
          int v61 = [v60 BOOLValue];

          if (v58 != v61)
          {
            v62 = [*(id *)(v47 + 2448) SubCalFilterAlarmsKey];
            v63 = [v57 objectForKeyedSubscript:v62];
            objc_msgSend(v54, "setShouldRemoveAlarms:", objc_msgSend(v63, "BOOLValue"));

            char v56 = 1;
          }
          v64 = [v54 subscriptionURL];
          v65 = [v64 absoluteString];

          v66 = [*(id *)(v47 + 2448) SubCalSubscriptionURLKey];
          v67 = [v57 objectForKeyedSubscript:v66];

          if ([v67 hasPrefix:@"webcal://"])
          {
            v68 = [v67 substringFromIndex:6];
            uint64_t v69 = [@"http" stringByAppendingString:v68];

            v67 = (void *)v69;
          }
          if (v67 && v65 != v67 && ([v65 isEqualToString:v67] & 1) == 0)
          {
            [v54 setHost:v67];
            char v56 = 1;
          }
          v109 = v51;
          v70 = [*(id *)(v47 + 2448) SubCalTitleKey];
          v71 = [v57 objectForKeyedSubscript:v70];

          uint64_t v72 = [v54 accountDescription];
          if ((void *)v72 == v71)
          {
          }
          else
          {
            v73 = (void *)v72;
            v74 = [v54 accountDescription];
            char v75 = [v74 isEqualToString:v71];

            if ((v75 & 1) == 0)
            {
              [v54 setAccountDescription:v71];
              char v56 = 1;
            }
          }
          v105 = v71;
          v106 = v67;
          v107 = v65;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v76 = v57;
          uint64_t v77 = [v76 countByEnumeratingWithState:&v115 objects:v144 count:16];
          if (v77)
          {
            uint64_t v78 = v77;
            uint64_t v79 = *(void *)v116;
            do
            {
              for (iuint64_t i = 0; ii != v78; ++ii)
              {
                if (*(void *)v116 != v79) {
                  objc_enumerationMutation(v76);
                }
                uint64_t v81 = *(void *)(*((void *)&v115 + 1) + 8 * ii);
                v82 = [v76 objectForKeyedSubscript:v81];
                v83 = [v54 objectForKeyedSubscript:v81];
                char v84 = [v83 isEqual:v82];

                if ((v84 & 1) == 0)
                {
                  [v54 setObject:v82 forKeyedSubscript:v81];
                  char v56 = 1;
                }
              }
              uint64_t v78 = [v76 countByEnumeratingWithState:&v115 objects:v144 count:16];
            }
            while (v78);
          }

          v51 = v109;
          char v85 = [a1 _updateSubscribedCalendarAccountProperties:v109];
          if (v112)
          {
            char v86 = v85 | v56;
            v48 = v98;
            uint64_t v27 = v99;
            unint64_t v47 = 0x1E4F5E000;
            v28 = v104;
            uint64_t n = v110;
            if ((v86 & 1) == 0)
            {
LABEL_82:

              goto LABEL_83;
            }
          }
          else
          {
            [v54 setVersionForNewAccount];
            v48 = v98;
            uint64_t v27 = v99;
            unint64_t v47 = 0x1E4F5E000;
            v28 = v104;
            uint64_t n = v110;
          }
          v113[0] = MEMORY[0x1E4F143A8];
          v113[1] = 3221225472;
          v113[2] = __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke_72;
          v113[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
          BOOL v114 = v112 == 0;
          v87 = (void *)MEMORY[0x1BA9EA500](v113);
          if (v112) {
            [v27 updateAccount:v109 withCompletionHandler:v87];
          }
          else {
            [v27 addAccount:v109 withCompletionHandler:v87];
          }

          BOOL v95 = 1;
          goto LABEL_82;
        }
LABEL_83:
      }
      uint64_t v103 = [v96 countByEnumeratingWithState:&v119 objects:v145 count:16];
      if (!v103) {
        goto LABEL_87;
      }
    }
  }
  v48 = v98;
LABEL_87:

  return v95;
}

void __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138543618;
      os_log_type_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BA384000, v6, v7, "Failed to remove orphaned subscribed calendar account %{public}@: error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __91__DAAccountChangeHandler__sanityCheckChildSubCalAccountsWithParent_inStore_accountUpdater___block_invoke_72(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = @"added";
      if (!*(unsigned char *)(a1 + 32)) {
        id v8 = @"modified";
      }
      int v9 = 138543618;
      os_log_type_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BA384000, v6, v7, "Failed to save %{public}@ subscribed calendar child account: error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

+ (BOOL)_handleChangeToSubscribedCalendar:(id)a3 withChangeInfo:(id)a4 inStore:(id)a5 accountUpdater:(id)a6
{
  os_log_type_t v7 = +[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", a3, a4, a5, a6);
  if ([v7 conformsToProtocol:&unk_1F13F4918]) {
    char v8 = [a1 _updateCalendarFromAccount:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_updateCalendarFromAccount:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:128];
  id v6 = [a1 _findSubscribedCalendarForAccount:v4 inEventStore:v5];
  if (v6)
  {
    os_log_type_t v7 = [v4 subscriptionURL];
    char v8 = [v7 absoluteString];

    if (v8
      && ([v6 subcalURL],
          int v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isEqualToString:v8],
          v9,
          (v10 & 1) == 0))
    {
      [v6 setSubcalURL:v8];
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
    }
    int v14 = [v4 shouldRemoveAlarms];
    if (v14 != [v6 stripAlarms])
    {
      objc_msgSend(v6, "setStripAlarms:", objc_msgSend(v4, "shouldRemoveAlarms"));
      int v11 = 1;
    }
    int v15 = [v4 shouldRemoveAttachments];
    if (v15 != [v6 stripAttachments])
    {
      objc_msgSend(v6, "setStripAttachments:", objc_msgSend(v4, "shouldRemoveAttachments"));
      int v11 = 1;
    }
    [v4 refreshInterval];
    if ([v6 refreshInterval] != (int)v16)
    {
      [v4 refreshInterval];
      [v6 setRefreshInterval:(int)v17];
      int v11 = 1;
    }
    int v18 = [v4 calendarExternalId];
    char v19 = [v6 externalID];
    char v20 = [v19 isEqualToString:v18];

    if (v20)
    {
      if (!v11)
      {
        os_log_type_t v21 = DALoggingwithCategory();
        os_log_type_t v22 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
        if (os_log_type_enabled(v21, v22))
        {
          v23 = [v4 accountID];
          os_log_type_t v24 = [v4 accountDescription];
          *(_DWORD *)buf = 138543618;
          v33 = v23;
          __int16 v34 = 2112;
          v35 = v24;
          _os_log_impl(&dword_1BA384000, v21, v22, "No calendar updates needed for changes to account %{public}@ (%@)", buf, 0x16u);
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      [v6 setExternalID:v18];
    }
    id v31 = 0;
    char v25 = [v5 saveCalendar:v6 commit:1 error:&v31];
    os_log_type_t v21 = v31;
    if ((v25 & 1) == 0)
    {
      uint64_t v26 = DALoggingwithCategory();
      os_log_type_t v27 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
      if (os_log_type_enabled(v26, v27))
      {
        v28 = [v4 accountID];
        uint64_t v29 = [v4 accountDescription];
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        __int16 v34 = 2112;
        v35 = v29;
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1BA384000, v26, v27, "Couldn't save calendar with updated properties for change to account %{public}@ (%@): %@", buf, 0x20u);
      }
    }
    goto LABEL_23;
  }
  char v8 = DALoggingwithCategory();
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v8, v12))
  {
    uint64_t v13 = [v4 accountID];
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl(&dword_1BA384000, v8, v12, "No calendar for account %{public}@, so we can't update it.", buf, 0xCu);
  }
LABEL_24:

  return 0;
}

+ (id)_findSubscribedCalendarForAccount:(id)a3 inEventStore:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 calendarsForEntityType:0];
  os_log_type_t v7 = [v5 accountID];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        os_log_type_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "subcalAccountID", (void)v16);
        char v14 = [v13 isEqualToString:v7];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (BOOL)_updateSubscribedCalendarAccountProperties:(id)a3
{
  return 0;
}

+ (BOOL)_sanityCheckCalDAVAccount:(id)a3 accountChangeInfo:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = DALoggingwithCategory();
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = [v7 accountDescription];
    int v11 = [v7 publicDescription];
    if ([v7 shouldUseCalendarHomeSyncReport]) {
      os_log_type_t v12 = &stru_1F13DB4B0;
    }
    else {
      os_log_type_t v12 = @" NOT";
    }
    uint64_t v13 = [v6 modifiedDataClasses];
    int v24 = 138413058;
    char v25 = v10;
    __int16 v26 = 2114;
    os_log_type_t v27 = v11;
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_1BA384000, v8, v9, "Sanity checking CalDAV account \"%@\" (%{public}@). This account does %@ use the calendar home sync report. Modified dataclasses are %@.", (uint8_t *)&v24, 0x2Au);
  }
  char v14 = [v6 modifiedDataClasses];
  int v15 = [v14 containsObject:*MEMORY[0x1E4F17568]];

  if (v15) {
    [v7 calendarsDataclassModified];
  }
  long long v16 = [v7 backingAccountInfo];
  if ([v6 changeType]) {
    goto LABEL_13;
  }
  long long v17 = [v16 parentAccount];
  if (v17
    || ![v16 supportsAuthentication]
    || [v16 isAuthenticated])
  {

LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  char v20 = [v16 credential];

  if (!v20) {
    goto LABEL_13;
  }
  uint64_t v21 = DALoggingwithCategory();
  if (os_log_type_enabled(v21, v9))
  {
    os_log_type_t v22 = [v7 accountDescription];
    v23 = [v7 publicDescription];
    int v24 = 138412546;
    char v25 = v22;
    __int16 v26 = 2114;
    os_log_type_t v27 = v23;
    _os_log_impl(&dword_1BA384000, v21, v9, "Account \"%@\" (%{public}@) is being added with credentials but is not set as authenticated. Marking it to ignore the authenticated property on next sync.", (uint8_t *)&v24, 0x16u);
  }
  [v16 setAccountProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F578F0]];
  BOOL v18 = 1;
LABEL_14:

  return v18;
}

+ (BOOL)_sanityCheckChildDAVAccount:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 accountType];
  os_log_type_t v12 = [v11 identifier];
  uint64_t v13 = *MEMORY[0x1E4F177C0];
  if ([v12 isEqualToString:*MEMORY[0x1E4F177C0]]) {
    goto LABEL_6;
  }
  id v72 = a1;
  id v73 = v10;
  char v14 = [v9 accountType];
  int v15 = [v14 identifier];
  if ([v15 isEqualToString:*MEMORY[0x1E4F17878]])
  {
LABEL_5:

    a1 = v72;
    id v10 = v73;
LABEL_6:

    goto LABEL_7;
  }
  v71 = v8;
  long long v16 = [v9 accountType];
  long long v17 = [v16 identifier];
  if ([v17 isEqualToString:*MEMORY[0x1E4F17740]])
  {

    id v8 = v71;
    goto LABEL_5;
  }
  uint64_t v29 = [v9 accountType];
  __int16 v30 = [v29 identifier];
  char v70 = [v30 isEqualToString:*MEMORY[0x1E4F17820]];

  id v8 = v71;
  a1 = v72;
  id v10 = v73;
  if ((v70 & 1) == 0)
  {
    id v31 = [v9 accountType];
    uint64_t v32 = [v31 identifier];
    int v33 = [v32 isEqualToString:*MEMORY[0x1E4F17750]];

    if (!v33)
    {
      int v39 = 0;
      goto LABEL_29;
    }
    if ([v71 isCalDAVAccount])
    {
      __int16 v34 = (id *)MEMORY[0x1E4F17568];
    }
    else
    {
      if (![v71 isCardDAVAccount]) {
        goto LABEL_39;
      }
      __int16 v34 = (id *)MEMORY[0x1E4F17578];
    }
    id v46 = *v34;
    if (v46)
    {
      unint64_t v47 = v46;
      v48 = [v9 propertiesForDataclass:v46];
      v49 = [v48 objectForKeyedSubscript:@"url"];
      if ([v49 length])
      {
        v50 = [MEMORY[0x1E4F1CB10] URLWithString:v49];
        if (v50)
        {
          v51 = [v71 principalURL];
          v52 = [v51 host];
          v53 = [v50 host];
          char v54 = [v52 isEqualToString:v53];

          if (v54)
          {
            v55 = v71;
            int v56 = 0;
          }
          else
          {
            int v58 = [v50 host];
            [v71 setHost:v58];

            v55 = v71;
            int v56 = 1;
          }
          uint64_t v59 = [v55 port];
          v60 = [v50 port];
          uint64_t v61 = [v60 integerValue];

          if (v59 != v61)
          {
            v62 = [v50 port];
            objc_msgSend(v71, "setPort:", objc_msgSend(v62, "integerValue"));

            int v56 = 1;
          }
          v63 = [v50 scheme];
          if ([v63 length])
          {
            v64 = [v50 scheme];
            uint64_t v65 = [v64 isEqualToString:@"https"];
          }
          else
          {
            uint64_t v65 = 1;
          }

          if (v65 == [v71 useSSL])
          {
            if (!v56)
            {
              int v57 = 0;
              id v8 = v71;
LABEL_54:
              a1 = v72;
              goto LABEL_55;
            }
          }
          else
          {
            [v71 setUseSSL:v65];
          }
          v66 = DALoggingwithCategory();
          os_log_type_t v67 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
          id v8 = v71;
          if (os_log_type_enabled(v66, v67))
          {
            v68 = [v71 principalURL];
            uint64_t v69 = [v68 absoluteString];
            *(_DWORD *)buf = 138412546;
            char v75 = v69;
            __int16 v76 = 2112;
            uint64_t v77 = v49;
            _os_log_impl(&dword_1BA384000, v66, v67, "BagURL has changed from %@ to %@, updated account", buf, 0x16u);
          }
          int v57 = 1;
          goto LABEL_54;
        }
      }
      else
      {
        v50 = 0;
      }
      int v57 = 0;
LABEL_55:

      id v10 = v73;
      goto LABEL_56;
    }
LABEL_39:
    int v57 = 0;
LABEL_56:
    int v39 = v57 != 0;
    goto LABEL_29;
  }
LABEL_7:
  BOOL v18 = [v9 accountType];
  long long v19 = [v18 identifier];
  char v20 = [v19 isEqualToString:v13];

  if ((v20 & 1) == 0)
  {
    v23 = [v9 accountType];
    int v24 = [v23 identifier];
    char v25 = [v24 isEqualToString:*MEMORY[0x1E4F17878]];

    if (v25)
    {
      uint64_t v21 = 1;
      os_log_type_t v22 = @"yahoo.com";
      goto LABEL_26;
    }
    __int16 v26 = [v9 accountType];
    os_log_type_t v27 = [v26 identifier];
    char v28 = [v27 isEqualToString:*MEMORY[0x1E4F17740]];

    if (v28)
    {
      uint64_t v21 = 1;
      os_log_type_t v22 = @"aol.com";
      goto LABEL_26;
    }
    v35 = [v9 accountType];
    __int16 v36 = [v35 identifier];
    int v37 = [v36 isEqualToString:*MEMORY[0x1E4F17820]];

    if (v37)
    {
      if ([v8 isCalDAVAccount])
      {
        uint64_t v38 = (id *)MEMORY[0x1E4F17568];
      }
      else
      {
        if (![v8 isCardDAVAccount]) {
          goto LABEL_25;
        }
        uint64_t v38 = (id *)MEMORY[0x1E4F17578];
      }
      id v40 = *v38;
      if (v40)
      {
        v41 = v40;
        uint64_t v42 = [v9 propertiesForDataclass:v40];
        os_log_type_t v22 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F176A8]];
        uint64_t v43 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F17718]];
        uint64_t v21 = [v43 BOOLValue];

        goto LABEL_26;
      }
    }
LABEL_25:
    os_log_type_t v22 = 0;
    uint64_t v21 = 1;
    goto LABEL_26;
  }
  uint64_t v21 = 1;
  os_log_type_t v22 = @"google.com";
LABEL_26:
  uint64_t v44 = [v8 host];
  int v39 = v44 == 0;

  if (!v44)
  {
    [v8 setHost:v22];
    [v8 setUseSSL:v21];
  }

LABEL_29:
  if ([v8 isCalDAVAccount]) {
    v39 |= [a1 _sanityCheckCalDAVAccount:v8 accountChangeInfo:v10];
  }

  return v39;
}

+ (BOOL)_sanityCheckChildAccountOfType:(id)a3 withParent:(id)a4 accountChangeInfo:(id)a5 inStore:(id)a6 updater:(id)a7
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v174 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v172 = a7;
  id v171 = v12;
  id v169 = v11;
  id v170 = v13;
  if (![v12 changeType]
    || ([v12 oldAccountProperties],
        char v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    int v168 = 1;
    goto LABEL_69;
  }
  v167 = [v11 username];
  uint64_t v166 = [v167 length];
  if (v166
    || ([v12 username], v155 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v155, "length")))
  {
    int v15 = [v11 username];
    v153 = [v12 username];
    v154 = v15;
    int v16 = 1;
    if (!objc_msgSend(v15, "isEqualToString:"))
    {
      int v165 = 1;
      int v17 = 0;
      BOOL v164 = 0;
      uint64_t v163 = 0;
      uint64_t v156 = 0;
      uint64_t v157 = 0;
      uint64_t v162 = 0;
      uint64_t v161 = 0;
      int v18 = 0;
      uint64_t v160 = 0;
      int v19 = 0;
      uint64_t v158 = 0;
      uint64_t v159 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
LABEL_14:
      int v168 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    int v16 = 0;
  }
  __int16 v26 = [v11 objectForKeyedSubscript:@"DAAccountHost"];
  uint64_t v27 = [v26 length];
  BOOL v164 = v27 == 0;
  int v165 = v16;
  v152 = v26;
  if (v27
    || ([v12 oldAccountProperties],
        v144 = objc_claimAutoreleasedReturnValue(),
        [v144 objectForKeyedSubscript:@"DAAccountHost"],
        long long v143 = objc_claimAutoreleasedReturnValue(),
        [v143 length]))
  {
    char v28 = [v11 objectForKeyedSubscript:@"DAAccountHost"];
    uint64_t v150 = [v12 oldAccountProperties];
    [v150 objectForKeyedSubscript:@"DAAccountHost"];
    v149 = v151 = v28;
    int v29 = objc_msgSend(v28, "isEqualToString:");
    int v17 = 1;
    if (!v29)
    {
      uint64_t v156 = 0;
      uint64_t v157 = 0;
      uint64_t v163 = 0x100000000;
      uint64_t v162 = 0;
      uint64_t v161 = 0;
      int v18 = 0;
      uint64_t v160 = 0;
      int v19 = 0;
      uint64_t v158 = 0;
      uint64_t v159 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
      goto LABEL_14;
    }
    HIDWORD(v163) = 1;
  }
  else
  {
    HIDWORD(v163) = 0;
  }
  uint64_t v60 = [v11 objectForKeyedSubscript:@"DAAccountPort"];
  LODWORD(v163) = v60 == 0;
  v148 = (void *)v60;
  if (!v60)
  {
    long long v138 = [v12 oldAccountProperties];
    uint64_t v61 = [v138 objectForKeyedSubscript:@"DAAccountPort"];
    if (!v61)
    {
      long long v137 = 0;
      LODWORD(v162) = 0;
      goto LABEL_129;
    }
    long long v137 = (void *)v61;
  }
  v62 = [v11 objectForKeyedSubscript:@"DAAccountPort"];
  v146 = [v12 oldAccountProperties];
  [v146 objectForKeyedSubscript:@"DAAccountPort"];
  v145 = v147 = v62;
  int v63 = objc_msgSend(v62, "isEqual:");
  int v17 = 1;
  if (!v63)
  {
    uint64_t v156 = 0;
    uint64_t v161 = 0;
    int v18 = 0;
    uint64_t v160 = 0;
    int v19 = 0;
    uint64_t v158 = 0;
    uint64_t v159 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    BOOL v25 = 0;
    uint64_t v157 = 1;
    uint64_t v162 = 1;
    goto LABEL_14;
  }
  LODWORD(v162) = 1;
LABEL_129:
  uint64_t v64 = [v11 objectForKeyedSubscript:@"DAAccountUseSSL"];
  HIDWORD(v162) = v64 == 0;
  long long v142 = (void *)v64;
  if (!v64)
  {
    long long v129 = [v12 oldAccountProperties];
    uint64_t v65 = [v129 objectForKeyedSubscript:@"DAAccountUseSSL"];
    if (!v65)
    {
      long long v128 = 0;
      int v68 = 0;
      goto LABEL_136;
    }
    long long v128 = (void *)v65;
  }
  v66 = [v11 objectForKeyedSubscript:@"DAAccountUseSSL"];
  long long v140 = [v12 oldAccountProperties];
  [v140 objectForKeyedSubscript:@"DAAccountUseSSL"];
  long long v139 = v141 = v66;
  int v67 = objc_msgSend(v66, "isEqual:");
  int v17 = 1;
  if (!v67)
  {
    int v18 = 0;
    uint64_t v161 = 0x100000000;
    uint64_t v160 = 0;
    int v19 = 0;
    uint64_t v158 = 0;
    uint64_t v159 = 0;
    int v20 = 0;
    int v21 = 0;
    uint64_t v156 = 0x100000000;
    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    BOOL v25 = 0;
    uint64_t v157 = 1;
    goto LABEL_14;
  }
  int v68 = 1;
LABEL_136:
  long long v136 = [MEMORY[0x1E4F5E990] DAAccountPrincipalPath];
  long long v135 = objc_msgSend(v11, "objectForKeyedSubscript:");
  uint64_t v69 = [v135 length];
  LODWORD(v161) = v69 == 0;
  HIDWORD(v161) = v68;
  if (v69
    || ([v12 oldAccountProperties],
        char v70 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4F5E990] DAAccountPrincipalPath],
        long long v122 = objc_claimAutoreleasedReturnValue(),
        uint64_t v123 = v70,
        objc_msgSend(v70, "objectForKeyedSubscript:"),
        long long v121 = objc_claimAutoreleasedReturnValue(),
        [v121 length]))
  {
    long long v134 = [MEMORY[0x1E4F5E990] DAAccountPrincipalPath];
    v71 = objc_msgSend(v11, "objectForKeyedSubscript:");
    id v72 = [v12 oldAccountProperties];
    long long v131 = [MEMORY[0x1E4F5E990] DAAccountPrincipalPath];
    long long v132 = v72;
    objc_msgSend(v72, "objectForKeyedSubscript:");
    long long v130 = v133 = v71;
    int v73 = objc_msgSend(v71, "isEqualToString:");
    int v17 = 1;
    if (!v73)
    {
      int v19 = 0;
      uint64_t v158 = 0;
      uint64_t v159 = 0;
      int v20 = 0;
      int v21 = 0;
      uint64_t v156 = 0x100000000;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
      uint64_t v157 = 1;
      int v18 = 1;
      uint64_t v160 = 1;
      goto LABEL_14;
    }
    LODWORD(v160) = 1;
  }
  else
  {
    LODWORD(v160) = 0;
  }
  uint64_t v127 = [v11 objectForKeyedSubscript:@"DAAccountEmailAddress"];
  uint64_t v74 = [v127 length];
  HIDWORD(v160) = v74 == 0;
  if (v74
    || ([v12 oldAccountProperties],
        long long v116 = objc_claimAutoreleasedReturnValue(),
        [v116 objectForKeyedSubscript:@"DAAccountEmailAddress"],
        long long v115 = objc_claimAutoreleasedReturnValue(),
        [v115 length]))
  {
    char v75 = [v11 objectForKeyedSubscript:@"DAAccountEmailAddress"];
    v125 = [v12 oldAccountProperties];
    [v125 objectForKeyedSubscript:@"DAAccountEmailAddress"];
    uint64_t v124 = v126 = v75;
    int v76 = objc_msgSend(v75, "isEqualToString:");
    int v17 = 1;
    if (!v76)
    {
      int v20 = 0;
      uint64_t v159 = 0x100000000;
      uint64_t v158 = 0;
      int v21 = 0;
      uint64_t v156 = 0x100000000;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
      uint64_t v157 = 1;
      int v18 = 1;
      int v19 = 1;
      goto LABEL_14;
    }
    HIDWORD(v159) = 1;
  }
  else
  {
    HIDWORD(v159) = 0;
  }
  long long v120 = [v11 objectForKeyedSubscript:@"Username"];
  uint64_t v77 = [v120 length];
  LODWORD(v159) = v77 == 0;
  if (v77
    || ([v12 oldAccountProperties],
        v109 = objc_claimAutoreleasedReturnValue(),
        [v109 objectForKeyedSubscript:@"Username"],
        v108 = objc_claimAutoreleasedReturnValue(),
        [v108 length]))
  {
    uint64_t v78 = [v11 objectForKeyedSubscript:@"Username"];
    long long v118 = [v12 oldAccountProperties];
    [v118 objectForKeyedSubscript:@"Username"];
    long long v117 = v119 = v78;
    int v79 = objc_msgSend(v78, "isEqualToString:");
    int v17 = 1;
    if (!v79)
    {
      int v21 = 0;
      uint64_t v156 = 0x100000000;
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
      uint64_t v157 = 1;
      int v18 = 1;
      int v19 = 1;
      int v20 = 1;
      uint64_t v158 = 1;
      goto LABEL_14;
    }
    LODWORD(v158) = 1;
  }
  else
  {
    LODWORD(v158) = 0;
  }
  BOOL v114 = [v11 objectForKeyedSubscript:@"Hostname"];
  uint64_t v80 = [v114 length];
  HIDWORD(v158) = v80 == 0;
  if (v80
    || ([v12 oldAccountProperties],
        uint64_t v103 = objc_claimAutoreleasedReturnValue(),
        [v103 objectForKeyedSubscript:@"Hostname"],
        v102 = objc_claimAutoreleasedReturnValue(),
        [v102 length]))
  {
    uint64_t v81 = [v11 objectForKeyedSubscript:@"Hostname"];
    v112 = [v12 oldAccountProperties];
    [v112 objectForKeyedSubscript:@"Hostname"];
    v111 = v113 = v81;
    int v82 = objc_msgSend(v81, "isEqualToString:");
    int v17 = 1;
    if (!v82)
    {
      int v22 = 0;
      int v23 = 0;
      int v24 = 0;
      BOOL v25 = 0;
      uint64_t v157 = 1;
      int v18 = 1;
      int v19 = 1;
      int v20 = 1;
      int v21 = 1;
      uint64_t v156 = 0x100000001;
      goto LABEL_14;
    }
    LODWORD(v156) = 1;
  }
  else
  {
    LODWORD(v156) = 0;
  }
  uint64_t v83 = [v11 objectForKeyedSubscript:@"PortNumber"];
  HIDWORD(v157) = v83 == 0;
  v107 = (void *)v83;
  if (!v83)
  {
    char v84 = [v12 oldAccountProperties];
    uint64_t v85 = [v84 objectForKeyedSubscript:@"PortNumber"];
    if (!v85)
    {
      id v98 = 0;
      int v23 = 0;
      goto LABEL_167;
    }
    id v98 = (void *)v85;
    uint64_t v110 = v84;
  }
  char v86 = [v11 objectForKeyedSubscript:@"PortNumber"];
  v105 = [v12 oldAccountProperties];
  [v105 objectForKeyedSubscript:@"PortNumber"];
  v104 = v106 = v86;
  int v87 = objc_msgSend(v86, "isEqual:");
  int v17 = 1;
  if (!v87)
  {
    int v24 = 0;
    BOOL v25 = 0;
    LODWORD(v157) = 1;
    HIDWORD(v156) = 1;
    int v18 = 1;
    int v19 = 1;
    int v20 = 1;
    int v21 = 1;
    int v22 = 1;
    int v23 = 1;
    goto LABEL_14;
  }
  int v23 = 1;
  char v84 = v110;
LABEL_167:
  uint64_t v88 = [v11 objectForKeyedSubscript:@"SSLEnabled"];
  BOOL v95 = v88 == 0;
  v101 = (void *)v88;
  uint64_t v110 = v84;
  if (v88)
  {
LABEL_170:
    uint64_t v91 = [v11 objectForKeyedSubscript:@"SSLEnabled"];
    id v99 = [v12 oldAccountProperties];
    uint64_t v92 = [v99 objectForKeyedSubscript:@"SSLEnabled"];
    uint64_t v100 = v91;
    int v93 = [v91 isEqual:v92];
    v90 = (void *)v92;
    int v94 = 1;
    goto LABEL_171;
  }
  v97 = [v12 oldAccountProperties];
  uint64_t v89 = [v97 objectForKeyedSubscript:@"SSLEnabled"];
  if (v89)
  {
    id v96 = (void *)v89;
    goto LABEL_170;
  }
  id v96 = 0;
  int v94 = 0;
  int v93 = 1;
LABEL_171:
  int v168 = v93 ^ 1;
  int v17 = 1;
  LODWORD(v157) = 1;
  HIDWORD(v156) = 1;
  int v18 = 1;
  int v19 = 1;
  int v20 = 1;
  int v21 = 1;
  int v22 = 1;
  int v24 = 1;
  BOOL v25 = v95;
  if (v94)
  {
  }
LABEL_16:
  if (v25)
  {

    if (!v24)
    {
LABEL_18:
      if (!v23) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if (!v24)
  {
    goto LABEL_18;
  }

  if (v23)
  {
LABEL_19:
  }
LABEL_20:
  if (HIDWORD(v157))
  {
  }
  if (v22) {

  }
  if (v156)
  {
  }
  id v11 = v169;
  if (HIDWORD(v158))
  {
  }
  if (v21) {

  }
  if (v158)
  {
  }
  if (v159)
  {
  }
  if (v20) {

  }
  if (HIDWORD(v159))
  {
  }
  if (HIDWORD(v160))
  {
  }
  if (v19) {

  }
  if (v160)
  {
  }
  if (v161)
  {
  }
  if (v18)
  {
  }
  if (HIDWORD(v161))
  {
  }
  if (HIDWORD(v162))
  {
  }
  if (HIDWORD(v156)) {

  }
  if (v162)
  {
  }
  if (v163)
  {
  }
  if (v157) {

  }
  if (HIDWORD(v163))
  {
  }
  if (!v164)
  {
    if (!v17) {
      goto LABEL_64;
    }
LABEL_118:

    if (!v165) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }

  if (v17) {
    goto LABEL_118;
  }
LABEL_64:
  if (v165)
  {
LABEL_65:
  }
LABEL_66:
  if (!v166) {

  }
LABEL_69:
  __int16 v30 = objc_opt_new();
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v31 = [v11 childAccounts];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v179 objects:v192 count:16];
  if (!v32)
  {

    uint64_t v43 = v172;
LABEL_96:
    v45 = v170;
    id v49 = [a1 _accountTypeWithIdentifier:v174 inStore:v170];
    id v34 = (id)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v49];
    [v34 setParentAccount:v11];
    [v34 setAuthenticationType:*MEMORY[0x1E4F17A58]];
    char v54 = 1;
    uint64_t v44 = v171;
    goto LABEL_97;
  }
  uint64_t v33 = v32;
  id v34 = 0;
  uint64_t v35 = *(void *)v180;
  do
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v180 != v35) {
        objc_enumerationMutation(v31);
      }
      int v37 = *(void **)(*((void *)&v179 + 1) + 8 * i);
      uint64_t v38 = [v37 accountType];
      int v39 = [v38 identifier];
      int v40 = [v39 isEqualToString:v174];

      if (v40)
      {
        if (v34)
        {
          id v41 = [a1 _pickAccountToKeepWithAccount:v34 andAccount:v37];
          if (v41 == v34)
          {
            [v30 addObject:v37];
          }
          else
          {
            [v30 addObject:v34];
            id v42 = v41;

            id v34 = v42;
          }
        }
        else
        {
          id v34 = v37;
        }
      }
    }
    uint64_t v33 = [v31 countByEnumeratingWithState:&v179 objects:v192 count:16];
  }
  while (v33);

  id v11 = v169;
  uint64_t v43 = v172;
  if (!v34) {
    goto LABEL_96;
  }
  uint64_t v44 = v171;
  v45 = v170;
  if (![v30 count])
  {
    char v54 = 0;
    goto LABEL_98;
  }
  id v46 = DALoggingwithCategory();
  os_log_type_t v47 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v46, v47))
  {
    v48 = [v34 identifier];
    *(_DWORD *)buf = 138413058;
    id v185 = v174;
    __int16 v186 = 2112;
    id v187 = v169;
    __int16 v188 = 2112;
    v189 = v48;
    __int16 v190 = 2112;
    v191 = v30;
    _os_log_impl(&dword_1BA384000, v46, v47, "Found > 1 child accounts of type %@ under account %@.  Keeping %@ and removing %@", buf, 0x2Au);
  }
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  id v49 = v30;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v175 objects:v183 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v176;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v176 != v52) {
          objc_enumerationMutation(v49);
        }
        objc_msgSend(v172, "removeAccount:completion:");
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v175 objects:v183 count:16];
    }
    while (v51);
  }
  char v54 = 0;
  uint64_t v44 = v171;
  v45 = v170;
  id v11 = v169;
  uint64_t v43 = v172;
LABEL_97:

LABEL_98:
  v55 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v34];
  if (([v55 isCalDAVAccount] & 1) != 0 || objc_msgSend(v55, "isCardDAVAccount")) {
    int v56 = [a1 _sanityCheckChildDAVAccount:v55 withParent:v11 accountChangeInfo:v44];
  }
  else {
    int v56 = 0;
  }
  if (v168 && ![v55 shouldDoInitialAutodiscovery])
  {
    [v55 setShouldDoInitialAutodiscovery:1];
    if ((v54 & 1) == 0) {
      goto LABEL_109;
    }
LABEL_108:
    [v43 addAccount:v34 withCompletionHandler:&__block_literal_global_2];
    [v30 count];
    BOOL v58 = 1;
    goto LABEL_113;
  }
  if (v54) {
    goto LABEL_108;
  }
  if (!v56)
  {
    char v57 = 0;
    goto LABEL_110;
  }
LABEL_109:
  [v43 updateAccount:v34 withCompletionHandler:&__block_literal_global_144];
  char v57 = 1;
LABEL_110:
  if ([v30 count]) {
    BOOL v58 = 1;
  }
  else {
    BOOL v58 = v57;
  }
LABEL_113:

  return v58;
}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = DALoggingwithCategory();
    os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BA384000, v6, v7, "Failed to remove duplicate child account %{public}@: error = %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke_141(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1BA384000, v5, v6, "Failed to add child account: error = %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __102__DAAccountChangeHandler__sanityCheckChildAccountOfType_withParent_accountChangeInfo_inStore_updater___block_invoke_142(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = DALoggingwithCategory();
    os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1BA384000, v5, v6, "Failed to save child account: error = %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (id)_pickAccountToKeepWithAccount:(id)a3 andAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 creationDate];
  id v8 = [v6 creationDate];
  uint64_t v9 = [v7 compare:v8];

  id v10 = v6;
  if (v9 != -1)
  {
    id v10 = v5;
    if (v9 != 1)
    {
      __int16 v11 = [v5 identifier];
      id v12 = [v6 identifier];
      uint64_t v13 = [v11 compare:v12];

      if (v13 == -1) {
        id v10 = v5;
      }
      else {
        id v10 = v6;
      }
    }
  }
  id v14 = v10;

  return v14;
}

+ (BOOL)_sanityCheckEnabledDataclassesOnExchangeAccountInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 enabledDataclasses];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v16;
  uint64_t v10 = *MEMORY[0x1E4F17580];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v4);
      }
      char v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) isEqualToString:v10];
      v7 |= v12;
      v8 |= v12 ^ 1;
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);
  if ((v7 & 1) == (v8 & 1))
  {
LABEL_10:
    BOOL v13 = 0;
  }
  else
  {
    objc_msgSend(v3, "setEnabled:forDataclass:");
    BOOL v13 = 1;
  }

  return v13;
}

@end