@interface CalAccountsProvider
+ (BOOL)accountIsDuplicate:(id)a3 inStore:(id)a4;
+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4;
+ (id)_accountsWithAccountType:(id)a3 inStore:(id)a4 error:(id *)a5;
+ (id)_existingAccountForAccount:(id)a3 inStore:(id)a4;
+ (id)_uniqueStringsForUsername:(id)a3;
+ (id)defaultProvider;
+ (id)uniqueStringsForHostname:(id)a3;
+ (id)uniqueStringsForPrincipalPath:(id)a3;
+ (id)verboseDescriptionForAccount:(id)a3;
- (ACAccountStore)accountStore;
- (BOOL)_bundleIDSupportsDataclassCalendars:(id)a3;
- (BOOL)_bundleIDSupportsDataclassReminders:(id)a3;
- (BOOL)account:(id)a3 hasServerURL:(id)a4;
- (BOOL)accountIsDuplicate:(id)a3;
- (BOOL)removeAccount:(id)a3 withError:(id *)a4;
- (BOOL)renewCredentialsForAccount:(id)a3;
- (BOOL)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4;
- (BOOL)runningUnitTests;
- (BOOL)saveAccount:(id)a3 verify:(BOOL)a4 withError:(id *)a5;
- (BOOL)saveAccount:(id)a3 withError:(id *)a4;
- (CalAccountsProvider)init;
- (NSArray)accountsEnabledForCalendar;
- (NSArray)accountsEnabledForReminders;
- (NSArray)allAccounts;
- (NSArray)enabledAccounts;
- (NSMutableArray)accountsWhenRunningUnitTests;
- (id)_accountsEnabledForDataClass:(id)a3;
- (id)_accountsEnabledForDataClasses:(id)a3;
- (id)_mainBundleID;
- (id)_providerForCalDAVAccount:(id)a3;
- (id)_supportedDataclassesForBundleID:(id)a3;
- (id)_supportedDataclassesForMainBundleID;
- (id)accountTypeWithIdentifier:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)accountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)accountsWithServerURL:(id)a3;
- (id)accountsWithServerURL:(id)a3 username:(id)a4 returnCachedVersions:(BOOL)a5;
- (id)accountsWithUsername:(id)a3;
- (id)allAccountsWithError:(id *)a3;
- (id)clientTokenForAccountWithIdentifier:(id)a3;
- (id)delegatePrincipalUIDsForAccount:(id)a3;
- (id)existingAccountForAccount:(id)a3;
- (id)oauthTokenForAccount:(id)a3 tokenType:(id)a4;
- (id)primaryAppleAccount;
- (void)removeAccount:(id)a3 withCompletionHandler:(id)a4;
- (void)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)saveAccount:(id)a3 verify:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)saveAccount:(id)a3 withCompletionHandler:(id)a4;
- (void)setAccountStore:(id)a3;
- (void)setAccountsWhenRunningUnitTests:(id)a3;
- (void)setRunningUnitTests:(BOOL)a3;
@end

@implementation CalAccountsProvider

+ (id)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CalAccountsProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_onceToken_1 != -1) {
    dispatch_once(&defaultProvider_onceToken_1, block);
  }
  v2 = (void *)defaultProvider_defaultProvider;

  return v2;
}

uint64_t __38__CalAccountsProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_defaultProvider = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CalAccountsProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)CalAccountsProvider;
  v2 = [(CalAccountsProvider *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 bundleIdentifier];

    if ([v4 isEqualToString:@"com.apple.CalendarAgent"]) {
      v5 = (ACAccountStore *)[objc_alloc(MEMORY[0x1E4F179C8]) initWithEffectiveBundleID:@"com.apple.iCal"];
    }
    else {
      v5 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    }
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    accountsWhenRunningUnitTests = v2->_accountsWhenRunningUnitTests;
    v2->_accountsWhenRunningUnitTests = (NSMutableArray *)v7;
  }
  return v2;
}

- (BOOL)runningUnitTests
{
  return self->_runningUnitTests;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSArray)enabledAccounts
{
  v3 = [(CalAccountsProvider *)self _supportedDataclassesForMainBundleID];
  v4 = [(CalAccountsProvider *)self _accountsEnabledForDataClasses:v3];

  return (NSArray *)v4;
}

- (id)_supportedDataclassesForMainBundleID
{
  v3 = [(CalAccountsProvider *)self _mainBundleID];
  v4 = [(CalAccountsProvider *)self _supportedDataclassesForBundleID:v3];

  return v4;
}

- (id)_supportedDataclassesForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  if ([(CalAccountsProvider *)self _bundleIDSupportsDataclassCalendars:v4]) {
    [v5 addObject:*MEMORY[0x1E4F17A80]];
  }
  if (!CalIsReminderBridgeEnabled()
    && [(CalAccountsProvider *)self _bundleIDSupportsDataclassReminders:v4])
  {
    [v5 addObject:*MEMORY[0x1E4F17B08]];
  }

  return v5;
}

- (NSArray)allAccounts
{
  return (NSArray *)[(CalAccountsProvider *)self allAccountsWithError:0];
}

- (id)allAccountsWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(CalAccountsProvider *)self runningUnitTests])
  {
    v5 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
    v6 = [v5 filteredArrayUsingTest:&__block_literal_global_38];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = *MEMORY[0x1E4F17798];
    v25[0] = *MEMORY[0x1E4F17770];
    v25[1] = v7;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = [(CalAccountsProvider *)self accountTypeWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          v13 = objc_opt_class();
          v14 = [(CalAccountsProvider *)self accountStore];
          id v20 = 0;
          v15 = [v13 _accountsWithAccountType:v12 inStore:v14 error:&v20];
          id v16 = v20;

          [v6 addObjectsFromArray:v15];
          if (a3 && v16)
          {
            id v17 = v16;
            *a3 = v17;

            v6 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }

  return v6;
}

- (id)accountTypeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(CalAccountsProvider *)self accountStore];
  uint64_t v7 = [v5 _accountTypeWithIdentifier:v4 inStore:v6];

  return v7;
}

+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__9;
  long long v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __58__CalAccountsProvider__accountTypeWithIdentifier_inStore___block_invoke;
  id v16 = &unk_1E56CED08;
  v18 = &v19;
  uint64_t v8 = v7;
  id v17 = v8;
  [v6 accountTypeWithIdentifier:v5 completion:&v13];
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9) >= 1)
  {
    uint64_t v10 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CalAccountsProvider _accountTypeWithIdentifier:inStore:]();
    }
  }
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v11;
}

void __58__CalAccountsProvider__accountTypeWithIdentifier_inStore___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)_accountsWithAccountType:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__9;
  long long v23 = __Block_byref_object_dispose__9;
  id v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__CalAccountsProvider__accountsWithAccountType_inStore_error___block_invoke;
  v15[3] = &unk_1E56CECE0;
  id v17 = &v25;
  v18 = &v19;
  uint64_t v10 = v9;
  id v16 = v10;
  [v8 accountsWithAccountType:v7 completion:v15];
  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v10, v11) >= 1)
  {
    v12 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CalAccountsProvider _accountsWithAccountType:inStore:error:]();
    }
  }
  if (a5) {
    *a5 = (id) v20[5];
  }
  id v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __62__CalAccountsProvider__accountsWithAccountType_inStore_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)delegatePrincipalUIDsForAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "calPrincipals", 0);
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v3 calMainPrincipalUID];
        char v13 = [v12 isEqualToString:v11];

        if ((v13 & 1) == 0) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v4;
}

- (NSArray)accountsEnabledForCalendar
{
  id v3 = [(CalAccountsProvider *)self _mainBundleID];
  BOOL v4 = [(CalAccountsProvider *)self _bundleIDSupportsDataclassCalendars:v3];

  if (v4)
  {
    id v5 = [(CalAccountsProvider *)self _accountsEnabledForDataClass:*MEMORY[0x1E4F17A80]];
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)accountsEnabledForReminders
{
  if (CalIsReminderBridgeEnabled()
    || ([(CalAccountsProvider *)self _mainBundleID],
        id v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = [(CalAccountsProvider *)self _bundleIDSupportsDataclassReminders:v3], v3, !v4))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(CalAccountsProvider *)self _accountsEnabledForDataClass:*MEMORY[0x1E4F17B08]];
  }

  return (NSArray *)v5;
}

- (BOOL)account:(id)a3 hasServerURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v5 host];

  uint64_t v9 = [v7 uniqueStringsForHostname:v8];

  uint64_t v10 = [v6 calHostname];

  LOBYTE(v6) = [v9 containsObject:v10];
  return (char)v6;
}

- (BOOL)accountIsDuplicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(CalAccountsProvider *)self accountStore];
  LOBYTE(v5) = [v5 accountIsDuplicate:v4 inStore:v6];

  return (char)v5;
}

- (id)accountsWithServerURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_opt_class();
  uint64_t v7 = [v4 host];
  uint64_t v8 = [v6 uniqueStringsForHostname:v7];

  if ([v8 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(CalAccountsProvider *)self allAccounts];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          long long v15 = [v14 calHostname];
          int v16 = [v8 containsObject:v15];

          if (v16) {
            [v5 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }

  return v5;
}

- (id)accountsWithUsername:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 length])
  {
    id v6 = [(id)objc_opt_class() _uniqueStringsForUsername:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(CalAccountsProvider *)self allAccounts];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          char v13 = [v12 username];
          int v14 = [v6 containsObject:v13];

          if (v14) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }

  return v5;
}

- (id)accountsWithServerURL:(id)a3 username:(id)a4 returnCachedVersions:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v10 = [(CalAccountsProvider *)self accountsWithServerURL:a3];
  uint64_t v11 = [v10 valueForKey:@"identifier"];
  uint64_t v12 = [v9 setWithArray:v11];

  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  int v14 = [(CalAccountsProvider *)self accountsWithUsername:v8];
  long long v15 = [v14 valueForKey:@"identifier"];
  long long v16 = [v13 setWithArray:v15];

  [v12 intersectSet:v16];
  long long v17 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = -[CalAccountsProvider accountWithIdentifier:returnCachedVersion:](self, "accountWithIdentifier:returnCachedVersion:", *(void *)(*((void *)&v25 + 1) + 8 * i), v5, (void)v25);
        if (v23) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v17;
}

- (id)accountWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CalAccountsProvider *)self runningUnitTests])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v5 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
    id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v12 = v9;
            goto LABEL_13;
          }
        }
        id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    BOOL v5 = [(CalAccountsProvider *)self accountStore];
    id v12 = [v5 accountWithIdentifier:v4];
LABEL_13:
    id v6 = v12;
  }

  return v6;
}

- (id)primaryAppleAccount
{
  v2 = [(CalAccountsProvider *)self accountStore];
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

uint64_t __44__CalAccountsProvider_allAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 calIsCalDAVAccount]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 calIsExchangeAccount];
  }

  return v3;
}

- (id)accountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CalAccountsProvider *)self accountStore];
  id v8 = [v7 accountTypeWithAccountTypeIdentifier:v6];

  uint64_t v9 = [(CalAccountsProvider *)self accountStore];
  uint64_t v10 = [v9 accountsWithAccountType:v8 options:0 error:a4];

  return v10;
}

- (id)clientTokenForAccountWithIdentifier:(id)a3
{
  uint64_t v3 = [(CalAccountsProvider *)self accountWithIdentifier:a3 returnCachedVersion:1];
  id v4 = [v3 clientToken];

  return v4;
}

- (id)existingAccountForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  id v6 = [(CalAccountsProvider *)self accountStore];
  uint64_t v7 = [v5 _existingAccountForAccount:v4 inStore:v6];

  return v7;
}

- (id)oauthTokenForAccount:(id)a3 tokenType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 credential];
  id v8 = [v7 oauthToken];

  if (!v8)
  {
    uint64_t v9 = [v5 parentAccount];

    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v10 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsProvider oauthTokenForAccount:tokenType:](v5);
    }

    int v11 = [v5 parentAccount];

    id v12 = [v11 credential];
    id v8 = [v12 oauthToken];

    id v5 = v11;
    if (!v8)
    {
LABEL_6:
      char v13 = +[CalFoundationLogSubsystem accounts];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CalAccountsProvider oauthTokenForAccount:tokenType:]();
      }

      id v8 = 0;
    }
  }
  long long v14 = [v5 credential];
  long long v15 = [v14 credentialType];
  char v16 = [v15 isEqualToString:v6];

  if ((v16 & 1) == 0)
  {
    long long v17 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsProvider oauthTokenForAccount:tokenType:](v5, (uint64_t)v6, v17);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)removeAccount:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(CalAccountsProvider *)self runningUnitTests])
  {
    long long v17 = [(CalAccountsProvider *)self accountStore];
    [v17 removeAccount:v6 withCompletionHandler:v7];
LABEL_14:

    goto LABEL_15;
  }
  id v21 = v7;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v9)
  {
LABEL_10:

LABEL_13:
    long long v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:6 userInfo:0];
    id v7 = v21;
    (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v17);
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v23;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v23 != v11) {
      objc_enumerationMutation(v8);
    }
    char v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
    long long v14 = [v13 identifier];
    long long v15 = [v6 identifier];
    char v16 = [v14 isEqualToString:v15];

    if (v16) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v18 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
  uint64_t v19 = [v18 indexOfObject:v13];

  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_13;
  }
  uint64_t v20 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
  [v20 removeObjectAtIndex:v19];

  id v7 = v21;
  (*((void (**)(id, uint64_t, void))v21 + 2))(v21, 1, 0);
LABEL_15:
}

- (BOOL)removeAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__9;
  uint64_t v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CalAccountsProvider_removeAccount_withError___block_invoke;
  v11[3] = &unk_1E56CEC90;
  char v13 = &v21;
  long long v14 = &v15;
  id v8 = v7;
  uint64_t v12 = v8;
  [(CalAccountsProvider *)self removeAccount:v6 withCompletionHandler:v11];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__CalAccountsProvider_removeAccount_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)renewCredentialsForAccount:(id)a3
{
  return [(CalAccountsProvider *)self renewCredentialsForAccount:a3 forceRenewal:0];
}

- (BOOL)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __63__CalAccountsProvider_renewCredentialsForAccount_forceRenewal___block_invoke;
  char v16 = &unk_1E56CECB8;
  id v18 = &v19;
  id v8 = v7;
  uint64_t v17 = v8;
  [(CalAccountsProvider *)self renewCredentialsForAccount:v6 forceRenewal:v4 withCompletionHandler:&v13];
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9) >= 1)
  {
    uint64_t v10 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CalAccountsProvider renewCredentialsForAccount:forceRenewal:]();
    }
  }
  char v11 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v11;
}

intptr_t __63__CalAccountsProvider_renewCredentialsForAccount_forceRenewal___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  if (v9 && (([v9 isAuthenticated] & 1) != 0 || v6))
  {
    uint64_t v13 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      char v22 = v14;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 1024;
      int v26 = [v9 isAuthenticated];
      __int16 v27 = 1024;
      BOOL v28 = v6;
      _os_log_impl(&dword_190D88000, v13, OS_LOG_TYPE_DEFAULT, "Telling store to renew credentials in %@. %@ is authenticated: %d and forceRenewal: %d", buf, 0x22u);
    }
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", v6, *MEMORY[0x1E4F17A40]);
    v20[0] = v15;
    v19[1] = *MEMORY[0x1E4F17A30];
    char v16 = [NSNumber numberWithInt:v6 ^ 1];
    v20[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

    id v18 = [(CalAccountsProvider *)self accountStore];
    [v18 renewCredentialsForAccount:v9 options:v17 completion:v10];
  }
  else
  {
    char v11 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      char v22 = v12;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_190D88000, v11, OS_LOG_TYPE_DEFAULT, "We're ignoring a call to %@. %@ is unauthenticated and forceRenewal equals NO.", buf, 0x16u);
    }
    if (v10) {
      v10[2](v10, 2, 0);
    }
  }
}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  if ([(CalAccountsProvider *)self runningUnitTests])
  {
    id v24 = v9;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
        char v16 = [v15 identifier];
        uint64_t v17 = [v8 identifier];
        char v18 = [v16 isEqualToString:v17];

        if (v18) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v21 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
      uint64_t v22 = [v21 indexOfObject:v15];

      if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_17;
      }
      __int16 v23 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
      [v23 setObject:v8 atIndexedSubscript:v22];
    }
    else
    {
LABEL_10:

LABEL_17:
      __int16 v23 = [(CalAccountsProvider *)self accountsWhenRunningUnitTests];
      [v23 addObject:v8];
    }
    id v9 = v24;

    v9[2](v9, 1, 0);
  }
  else
  {
    if (([v8 calIsDirty] & 1) == 0)
    {
      uint64_t v19 = +[CalFoundationLogSubsystem accounts];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CalAccountsProvider saveAccount:verify:withCompletionHandler:]();
      }
    }
    id v20 = [(CalAccountsProvider *)self accountStore];
    [v20 saveAccount:v8 withDataclassActions:0 doVerify:v6 completion:v9];
  }
}

- (void)saveAccount:(id)a3 withCompletionHandler:(id)a4
{
}

- (BOOL)saveAccount:(id)a3 verify:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__9;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__CalAccountsProvider_saveAccount_verify_withError___block_invoke;
  v13[3] = &unk_1E56CEC90;
  uint64_t v15 = &v23;
  char v16 = &v17;
  uint64_t v10 = v9;
  uint64_t v14 = v10;
  [(CalAccountsProvider *)self saveAccount:v8 verify:v6 withCompletionHandler:v13];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v18[5];
  }
  char v11 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __52__CalAccountsProvider_saveAccount_verify_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  return [(CalAccountsProvider *)self saveAccount:a3 verify:1 withError:a4];
}

+ (BOOL)accountIsDuplicate:(id)a3 inStore:(id)a4
{
  BOOL v4 = [a1 _existingAccountForAccount:a3 inStore:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)uniqueStringsForHostname:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = [MEMORY[0x1E4F1CA80] set];
    BOOL v5 = [v3 CDVStringByAppendingSlashIfNeeded];
    [v4 addObject:v5];

    BOOL v6 = [v3 CDVStringByRemovingTerminatingSlashIfNeeded];
    [v4 addObject:v6];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)uniqueStringsForPrincipalPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 length])
  {
    [v4 addObject:v3];
    BOOL v5 = [v3 CDVStringByRemovingPercentEscapesForHREF];
    [v4 addObject:v5];
    BOOL v6 = [v5 CDVStringByAppendingSlashIfNeeded];
    [v4 addObject:v6];
    dispatch_semaphore_t v7 = [v5 CDVStringByRemovingTerminatingSlashIfNeeded];
    [v4 addObject:v7];
    id v8 = [v3 CDVStringByAddingPercentEscapesForHREF];
    [v4 addObject:v8];
    dispatch_semaphore_t v9 = [v8 CDVStringByAppendingSlashIfNeeded];
    [v4 addObject:v9];
    uint64_t v10 = [v8 CDVStringByRemovingTerminatingSlashIfNeeded];
    [v4 addObject:v10];
  }

  return v4;
}

+ (id)verboseDescriptionForAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 accountDescription];
  if (![(__CFString *)v4 length])
  {
    BOOL v5 = +[CalAccountsProvider defaultProvider];
    BOOL v6 = [v3 parentAccountIdentifier];
    dispatch_semaphore_t v7 = [v5 accountWithIdentifier:v6 returnCachedVersion:1];

    uint64_t v8 = [v7 accountDescription];

    BOOL v4 = (__CFString *)v8;
  }
  if (![(__CFString *)v4 length])
  {

    BOOL v4 = @"UNAVAILABLE";
  }
  dispatch_semaphore_t v9 = NSString;
  uint64_t v10 = [v3 identifier];
  char v11 = [v3 accountType];
  uint64_t v12 = [v11 identifier];
  uint64_t v13 = [v3 parentAccountIdentifier];
  uint64_t v14 = [v13 length];
  uint64_t v15 = @"YES";
  if (!v14) {
    uint64_t v15 = @"NO";
  }
  char v16 = [v9 stringWithFormat:@"%@ (identifier=%@ type=%@; childAccount=%@)", v4, v10, v12, v15];;

  return v16;
}

- (id)_accountsEnabledForDataClass:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v6 = [(CalAccountsProvider *)self allAccounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 enabledDataclasses];
        int v13 = [v12 containsObject:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_accountsEnabledForDataClasses:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v6 = [(CalAccountsProvider *)self allAccounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 enabledDataclasses];
        int v13 = [v4 intersectsSet:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_existingAccountForAccount:(id)a3 inStore:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 calIsCalDAVAccount])
  {
    uint64_t v8 = [v6 calMainPrincipalUID];
    uint64_t v9 = [v6 valueForKey:@"PrincipalPath" forPrincipalWithUID:v8];

    uint64_t v10 = [v6 calHostname];
    v49 = [a1 uniqueStringsForHostname:v10];

    v48 = [a1 uniqueStringsForPrincipalPath:v9];
    char v11 = [v6 username];
    v50 = [a1 _uniqueStringsForUsername:v11];

    uint64_t v12 = +[CalAccountsProvider defaultProvider];
    int v13 = [v12 runningUnitTests];

    if (v13)
    {
      uint64_t v14 = +[CalAccountsProvider defaultProvider];
      [v14 allAccounts];
    }
    else
    {
      uint64_t v14 = [a1 _accountTypeWithIdentifier:*MEMORY[0x1E4F17770] inStore:v7];
      [a1 _accountsWithAccountType:v14 inStore:v7 error:0];
    long long v16 = };

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      v46 = v9;
      id v47 = v7;
      uint64_t v20 = *(void *)v53;
      *(void *)&long long v18 = 138413058;
      long long v45 = v18;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend(v6, "identifier", v45);
          id v24 = [v22 identifier];
          char v25 = [v23 isEqualToString:v24];

          if ((v25 & 1) == 0)
          {
            char v26 = [v6 parentAccount];
            uint64_t v27 = [v26 accountType];
            long long v28 = [v22 parentAccount];
            uint64_t v29 = [v28 accountType];
            int v30 = [(id)v27 isEqual:v29];

            v31 = [v22 username];
            LODWORD(v27) = [v50 containsObject:v31];

            int v32 = v30 & v27;
            if (v32 == 1)
            {
              v33 = +[CalFoundationLogSubsystem accounts];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v39 = [v6 parentAccount];
                v40 = [v6 parentAccount];
                v41 = [v40 accountType];
                *(_DWORD *)buf = v45;
                id v57 = v6;
                __int16 v58 = 2112;
                v59 = v50;
                __int16 v60 = 2112;
                v61 = v39;
                __int16 v62 = 2112;
                v63 = v41;
                _os_log_error_impl(&dword_190D88000, v33, OS_LOG_TYPE_ERROR, "Account [%@] has the same user name as an existing account. uniqueUsernames:[%@] parentAccount:[%@] parentAccountType:[%@]", buf, 0x2Au);
              }
            }
            v34 = [v22 calHostname];
            int v35 = [v49 containsObject:v34];

            v36 = [v22 calMainPrincipalUID];
            v37 = [v22 valueForKey:@"PrincipalPath" forPrincipalWithUID:v36];
            int v38 = [v48 containsObject:v37];

            if (((v32 | v35 ^ 1) & 1) == 0 && v38)
            {
              v42 = +[CalFoundationLogSubsystem accounts];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                +[CalAccountsProvider _existingAccountForAccount:inStore:]();
              }

LABEL_28:
              v43 = +[CalFoundationLogSubsystem accounts];
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                +[CalAccountsProvider _existingAccountForAccount:inStore:]();
              }

              id v15 = v22;
              goto LABEL_31;
            }
            if (v32) {
              goto LABEL_28;
            }
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      id v15 = 0;
LABEL_31:
      uint64_t v9 = v46;
      id v7 = v47;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    uint64_t v9 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v6;
      _os_log_impl(&dword_190D88000, v9, OS_LOG_TYPE_DEFAULT, "Account [%@] is not a CalDAV account. Allow the save to proceed.", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

- (id)_providerForCalDAVAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parentAccount];

  if (v4)
  {
    BOOL v5 = [v3 parentAccount];

    id v6 = [v5 accountType];
    id v7 = [v6 identifier];

    if ([v7 isEqualToString:*MEMORY[0x1E4F17750]])
    {
      uint64_t v8 = @"icloud";
    }
    else
    {
      char v11 = [v7 componentsSeparatedByString:@"."];
      uint64_t v8 = [v11 lastObject];
    }
  }
  else
  {
    uint64_t v9 = [v3 calHostname];

    int v10 = [v9 hasSuffix:@"apple.com"];
    if (v10) {
      uint64_t v8 = @"apple";
    }
    else {
      uint64_t v8 = 0;
    }
  }
  uint64_t v12 = [(__CFString *)v8 lowercaseString];

  return v12;
}

- (BOOL)_bundleIDSupportsDataclassCalendars:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.iCal"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.CalendarAgent"];
  }

  return v4;
}

- (BOOL)_bundleIDSupportsDataclassReminders:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.reminders"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.CalendarAgent"];
  }

  return v4;
}

- (id)_mainBundleID
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (![(__CFString *)v3 length])
  {
    char v4 = +[CalFoundationLogSubsystem accounts];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_190D88000, v4, OS_LOG_TYPE_DEFAULT, "Since an empty bundle was passed in, we're going to pretend that we're dealing with CalendarAgent.", v6, 2u);
    }

    id v3 = @"com.apple.CalendarAgent";
  }

  return v3;
}

+ (id)_uniqueStringsForUsername:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA80] set];
  if ([v3 length])
  {
    [v4 addObject:v3];
    BOOL v5 = [v3 CDVStringByRemovingPercentEscapesForHREF];
    [v4 addObject:v5];

    id v6 = [v3 CDVStringByAddingPercentEscapesForHREF];
    [v4 addObject:v6];
  }

  return v4;
}

- (NSMutableArray)accountsWhenRunningUnitTests
{
  return self->_accountsWhenRunningUnitTests;
}

- (void)setAccountsWhenRunningUnitTests:(id)a3
{
}

- (void)setRunningUnitTests:(BOOL)a3
{
  self->_runningUnitTests = a3;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_accountsWhenRunningUnitTests, 0);
}

- (void)oauthTokenForAccount:(NSObject *)a3 tokenType:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 credential];
  id v7 = [v6 credentialType];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  int v13 = v7;
  _os_log_error_impl(&dword_190D88000, a3, OS_LOG_TYPE_ERROR, "The token for %@ is not of type %@. It's %@", (uint8_t *)&v8, 0x20u);
}

- (void)oauthTokenForAccount:tokenType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "An OAuth token doesn't exist for %@.", v2, v3, v4, v5, v6);
}

- (void)oauthTokenForAccount:(void *)a1 tokenType:.cold.3(void *a1)
{
  uint64_t v1 = [a1 parentAccount];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_190D88000, v2, v3, "No oauth token on child account %@.  Trying parent %@.", v4, v5, v6, v7, v8);
}

- (void)renewCredentialsForAccount:forceRenewal:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "We timed out attempting to renew credentials for %@.", v2, v3, v4, v5, v6);
}

- (void)saveAccount:verify:withCompletionHandler:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_190D88000, v1, v2, "Someone is attempting to save a non-dirty account %@. %@", v3, v4, v5, v6, v7);
}

+ (void)_accountsWithAccountType:inStore:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Timed out trying to accounts with type %@ from the account store.", v2, v3, v4, v5, v6);
}

+ (void)_accountTypeWithIdentifier:inStore:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Timed out trying to fetch an account type with identifier %@ from the account store.", v2, v3, v4, v5, v6);
}

+ (void)_existingAccountForAccount:inStore:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_190D88000, v1, OS_LOG_TYPE_ERROR, "Account [%@] is the duplicate of account [%@].", v2, 0x16u);
}

+ (void)_existingAccountForAccount:inStore:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_190D88000, v0, v1, "Account [%@] has the same server url and principal account.", v2, v3, v4, v5, v6);
}

@end