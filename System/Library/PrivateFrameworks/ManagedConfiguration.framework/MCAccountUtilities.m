@interface MCAccountUtilities
+ (BOOL)hasManagedAccountOfDataclasses:(id)a3;
+ (id)accountDataclassesForBundleID:(id)a3;
+ (id)appStoreAccountIdentifierForPersona:(id)a3;
+ (void)checkAccountConsistencyAndReleaseOrphanedAccounts;
- (MCAccountUtilities)init;
- (OS_dispatch_queue)signInQueue;
- (void)setSignInQueue:(id)a3;
@end

@implementation MCAccountUtilities

- (MCAccountUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCAccountUtilities;
  v2 = [(MCAccountUtilities *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCAccountUtilities queue", 0);
    signInQueue = v2->_signInQueue;
    v2->_signInQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (void)checkAccountConsistencyAndReleaseOrphanedAccounts
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v2 = +[MCManifest sharedManifest];
  dispatch_queue_t v3 = [v2 allInstalledProfileIdentifiers];
  [MEMORY[0x1E4F179C8] defaultStore];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v47 = long long v56 = 0u;
  id obj = [v47 accounts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v54;
    uint64_t v46 = *MEMORY[0x1E4F176E8];
    *(void *)&long long v5 = 138543874;
    long long v43 = v5;
    v44 = v2;
    v45 = v3;
    uint64_t v48 = *(void *)v54;
    do
    {
      uint64_t v8 = 0;
      uint64_t v49 = v6;
      do
      {
        if (*(void *)v54 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v53 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "mcConfigurationProfileIdentifier", v43);
        v11 = MCMailAccountManagedTag();
        uint64_t v12 = [v9 accountPropertyForKey:v11];

        if (v10 | v12)
        {
          v13 = [v9 mcProfileUUID];
          v14 = [v9 mcPayloadUUID];
          if (v10)
          {
            if ([v3 containsObject:v10])
            {
              v15 = [v2 installedProfileWithIdentifier:v10];
              v16 = [v15 UUID];
              int v17 = [v16 isEqualToString:v13];

              if (v17)
              {
                v18 = [v15 payloadWithUUID:v14];
                if (v18)
                {

                  dispatch_queue_t v3 = v45;
LABEL_33:

                  uint64_t v7 = v48;
                  uint64_t v6 = v49;
                  goto LABEL_34;
                }
                v32 = (void *)_MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
                {
                  v29 = v32;
                  v30 = [v9 identifier];
                  *(_DWORD *)buf = v43;
                  v58 = v30;
                  __int16 v59 = 2114;
                  uint64_t v60 = v10;
                  __int16 v61 = 2114;
                  v62 = v14;
                  _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "Found account (%{public}@) with installed profile identifier (%{public}@) whose payload UUID (%{public}@) does not match any payload in that profile", buf, 0x20u);
LABEL_23:
                }
              }
              else
              {
                v28 = (void *)_MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
                {
                  v29 = v28;
                  v30 = [v9 identifier];
                  v31 = [v15 UUID];
                  *(_DWORD *)buf = 138544130;
                  v58 = v30;
                  __int16 v59 = 2114;
                  uint64_t v60 = v10;
                  __int16 v61 = 2114;
                  v62 = v13;
                  __int16 v63 = 2114;
                  v64 = v31;
                  _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "Found account (%{public}@) with installed profile identifier (%{public}@) whose UUID (%{public}@) does not match that of the profile (%{public}@)", buf, 0x2Au);

                  v2 = v44;
                  goto LABEL_23;
                }
              }

              dispatch_queue_t v3 = v45;
LABEL_25:
              v33 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
              {
                v34 = v33;
                v35 = [v9 identifier];
                *(_DWORD *)buf = 138543362;
                v58 = v35;
                _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_DEFAULT, "Removing profile information from account %{public}@", buf, 0xCu);
              }
              [v9 setMcProfileUUID:0];
              [v9 setMcPayloadUUID:0];
              [v9 setMcConfigurationProfileIdentifier:0];
              [v9 setManagingSourceName:0];
              [v9 setManagingOwnerIdentifier:0];
              [v9 setAccountProperty:0 forKey:v46];
              v36 = MCMailAccountManagedTag();
              [v9 setAccountProperty:0 forKey:v36];

              v37 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                v39 = [v9 identifier];
                *(_DWORD *)buf = 138543362;
                v58 = v39;
                _os_log_impl(&dword_1A13F0000, v38, OS_LOG_TYPE_DEFAULT, "Saving account %{public}@...", buf, 0xCu);
              }
              dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
              v51[0] = MEMORY[0x1E4F143A8];
              v51[1] = 3221225472;
              v51[2] = __71__MCAccountUtilities_checkAccountConsistencyAndReleaseOrphanedAccounts__block_invoke;
              v51[3] = &unk_1E5A68730;
              v51[4] = v9;
              v15 = v40;
              v52 = v15;
              [v47 saveVerifiedAccount:v9 withCompletionHandler:v51];
              dispatch_time_t v41 = dispatch_time(0, 120000000000);
              if (dispatch_semaphore_wait(v15, v41))
              {
                v42 = _MCLogObjects;
                if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A13F0000, v42, OS_LOG_TYPE_DEFAULT, "Timed out waiting for account to save; moving on...",
                    buf,
                    2u);
                }
              }

              goto LABEL_33;
            }
            v27 = (void *)_MCLogObjects;
            if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
              goto LABEL_25;
            }
            v23 = v27;
            v24 = [v9 identifier];
            *(_DWORD *)buf = 138543618;
            v58 = v24;
            __int16 v59 = 2114;
            uint64_t v60 = v10;
            v25 = v23;
            v26 = "Found account (%{public}@) with uninstalled profile identifier (%{public}@)";
          }
          else
          {
            v22 = (void *)_MCLogObjects;
            if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
              goto LABEL_25;
            }
            v23 = v22;
            v24 = [v9 identifier];
            *(_DWORD *)buf = 138543618;
            v58 = v24;
            __int16 v59 = 2114;
            uint64_t v60 = v12;
            v25 = v23;
            v26 = "Found account (%{public}@) with just a managed tag  (%{public}@)";
          }
          _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);

          goto LABEL_25;
        }
        v19 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          v21 = [v9 identifier];
          *(_DWORD *)buf = 138543362;
          v58 = v21;
          _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_DEBUG, "Skipping unmanaged account with identifier: %{public}@", buf, 0xCu);
        }
LABEL_34:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v6);
  }
}

void __71__MCAccountUtilities_checkAccountConsistencyAndReleaseOrphanedAccounts__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v5 = a3;
  uint64_t v6 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = v6;
    uint64_t v9 = [v7 identifier];
    uint64_t v10 = (void *)v9;
    v11 = @"OK";
    if (!a2) {
      v11 = v5;
    }
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_DEFAULT, "Save account %{public}@ completed: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)accountDataclassesForBundleID:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.MailCompositionService"])
  {
    v14[0] = *MEMORY[0x1E4F17AD8];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    long long v5 = v14;
LABEL_4:
    uint64_t v6 = 1;
LABEL_5:
    uint64_t v7 = [v4 arrayWithObjects:v5 count:v6];
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"com.apple.mobilecal"])
  {
    uint64_t v13 = *MEMORY[0x1E4F17A80];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    long long v5 = &v13;
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v12 = *MEMORY[0x1E4F17B00];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    long long v5 = &v12;
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"com.apple.reminders"])
  {
    uint64_t v11 = *MEMORY[0x1E4F17B08];
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    long long v5 = &v11;
    goto LABEL_4;
  }
  if (([v3 isEqualToString:@"com.apple.MobileAddressBook"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.mobilephone"])
  {
    uint64_t v9 = *MEMORY[0x1E4F17A98];
    v10[0] = *MEMORY[0x1E4F17A90];
    v10[1] = v9;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    long long v5 = v10;
    uint64_t v6 = 2;
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

+ (id)appStoreAccountIdentifierForPersona:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F179C8] defaultStore];
    v30[0] = *MEMORY[0x1E4F17890];
    long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v24 = 0;
    uint64_t v6 = [v4 accountsWithAccountTypeIdentifiers:v5 preloadedProperties:0 error:&v24];
    id v19 = v24;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      uint64_t v11 = *MEMORY[0x1E4F176E8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          __int16 v14 = [v13 objectForKeyedSubscript:v11];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 isEqualToString:v3])
          {
            uint64_t v16 = objc_msgSend(v13, "ams_DSID");
            int v17 = _MCLogObjects;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v26 = v3;
              __int16 v27 = 2114;
              v28 = v16;
              _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona FOUND persona:%{public}@ -> accountIdentifier:%{public}@", buf, 0x16u);
            }

            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v15 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v3;
      _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEFAULT, "appStoreAccountIdentifierForPersona NOT FOUND persona:%{public}@", buf, 0xCu);
    }
    uint64_t v16 = 0;
LABEL_18:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)hasManagedAccountOfDataclasses:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v3;
      _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEBUG, "Checking for managed accounts that have one of these dataclasses: %{public}@", buf, 0xCu);
    }
    id v22 = v3;
    long long v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
    long long v21 = [MEMORY[0x1E4F179C8] defaultStore];
    [v21 accounts];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v12 = [v11 enabledDataclasses];
          if ([v12 intersectsSet:v5])
          {
            uint64_t v13 = [v11 accountPropertyForKey:@"MCAccountIsManaged"];
            int v14 = [v13 BOOLValue];

            if (v14)
            {
              int v17 = (void *)_MCLogObjects;
              if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
              {
                v18 = v17;
                id v19 = [v11 identifier];
                *(_DWORD *)buf = 138543362;
                id v29 = v19;
                _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_DEBUG, "Account %{public}@ found.", buf, 0xCu);
              }
              BOOL v16 = 1;
              goto LABEL_20;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    v15 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_DEBUG, "No account found.", buf, 2u);
    }
    BOOL v16 = 0;
LABEL_20:
    id v3 = v22;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (OS_dispatch_queue)signInQueue
{
  return self->_signInQueue;
}

- (void)setSignInQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end