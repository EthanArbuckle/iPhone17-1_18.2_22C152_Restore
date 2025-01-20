@interface CHProtectedAppProvider
- (CHProcessHandle)currentProcessHandle;
- (CHProtectedAppProvider)init;
- (CHProtectedAppProviderDelegate)delegate;
- (NSSet)allowedProtectedAppBundleIDs;
- (id)firstPartyProviderBundleIDs;
- (id)protectedApplicationBundleIDs;
- (id)systemProviderBundleIDs;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)setAllowedProtectedAppBundleIDs:(id)a3;
- (void)setCurrentProcessHandle:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CHProtectedAppProvider

- (id)protectedApplicationBundleIDs
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v3 = [(CHProtectedAppProvider *)self currentProcessHandle];
  v4 = [v3 bundleIdentifier];

  v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [MEMORY[0x1E4F4B7E0] hiddenApplications];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v45 + 1) + 8 * i) bundleIdentifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v8);
  }
  v12 = [MEMORY[0x1E4F4B7E0] lockedApplications];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v41 + 1) + 8 * j) bundleIdentifier];
        [v5 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v14);
  }
  v18 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v52 = v4;
    __int16 v53 = 2114;
    v54 = v6;
    __int16 v55 = 2114;
    v56 = v12;
    _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, "CH protectedBundleID requestorBundleID %{public}@ hiddenApplications %{public}@ lockedApplications %{public}@", buf, 0x20u);
  }

  if (v4)
  {
    v19 = [(CHProtectedAppProvider *)self systemProviderBundleIDs];
    int v20 = [v19 containsObject:v4];

    if (v20)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v21 = [(CHProtectedAppProvider *)self firstPartyProviderBundleIDs];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            [v5 removeObject:*(void *)(*((void *)&v37 + 1) + 8 * k)];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v23);
      }
    }
    else
    {
      [v5 removeObject:v4];
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = [(CHProtectedAppProvider *)self allowedProtectedAppBundleIDs];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        [v5 removeObject:*(void *)(*((void *)&v33 + 1) + 8 * m)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v28);
  }

  v31 = (void *)[v5 copy];
  return v31;
}

- (id)systemProviderBundleIDs
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  [v2 addObject:@"com.apple.TelephonyUtilities"];
  v3 = (void *)[v2 copy];

  return v3;
}

- (CHProcessHandle)currentProcessHandle
{
  return self->_currentProcessHandle;
}

- (NSSet)allowedProtectedAppBundleIDs
{
  return self->allowedProtectedAppBundleIDs;
}

- (void)setDelegate:(id)a3
{
}

- (CHProtectedAppProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHProtectedAppProvider;
  v2 = [(CHProtectedAppProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[CHProcessHandle processHandle];
    currentProcessHandle = v2->_currentProcessHandle;
    v2->_currentProcessHandle = (CHProcessHandle *)v3;

    v5 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    id v6 = (id)[v5 addMonitor:v2 subjectMask:1];
  }
  return v2;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v4 = [(CHProtectedAppProvider *)self delegate];
  [v4 protectedAppsChanged];
}

- (id)firstPartyProviderBundleIDs
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  [v2 addObject:@"com.apple.mobilephone"];
  [v2 addObject:@"com.apple.facetime"];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (CHProtectedAppProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (CHProtectedAppProviderDelegate *)WeakRetained;
}

- (void)setAllowedProtectedAppBundleIDs:(id)a3
{
}

- (void)setCurrentProcessHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProcessHandle, 0);
  objc_storeStrong((id *)&self->allowedProtectedAppBundleIDs, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end