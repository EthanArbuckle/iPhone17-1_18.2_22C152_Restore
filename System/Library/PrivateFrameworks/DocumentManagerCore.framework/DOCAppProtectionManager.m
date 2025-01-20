@interface DOCAppProtectionManager
+ (DOCAppProtectionManager)sharedManager;
- (APSubjectMonitorSubscription)appMonitorSubscription;
- (BOOL)_applicationShouldBeIncludedInList:(id)a3;
- (BOOL)canNodeHostAnAppContainer:(id)a3;
- (BOOL)hasAnyProtectedApps;
- (BOOL)hostAppCanSeeFileProviderDomain:(id)a3;
- (BOOL)isFilesAppLocked;
- (BOOL)itemIsAppContainer:(id)a3;
- (BOOL)itemIsInAppContainer:(id)a3;
- (BOOL)nodeRequiresAuthentication_Sync:(id)a3;
- (DOCAppProtectionManager)init;
- (DOCProtectedAppContainerCache)appContainerCache;
- (NSArray)appToOID;
- (NSArray)applicationsWithContentHiddenFromSearch;
- (NSArray)filteredDocumentApplicationsWithContentHiddenFromSearch;
- (NSArray)hiddenApplicationBundleIDs;
- (NSArray)hiddenApplications;
- (NSArray)hiddenFilteredDocumentApplications;
- (NSArray)lockedApplicationBundleIDs;
- (NSArray)lockedApplications;
- (NSArray)lockedFilteredDocumentApplications;
- (NSArray)protectedApplicationBundleIDs;
- (NSArray)protectedApplications;
- (NSSet)allProtectedApplications;
- (NSString)hostIdentifier;
- (id)_applicationRecordsForAPApplications:(id)a3;
- (id)bundleIDOfAppContainer_Sync:(id)a3;
- (id)filterApplications:(id)a3;
- (id)protectedAppForAppContainerBundleID:(id)a3;
- (id)protectedAppForAppContainerOID:(id)a3;
- (unint64_t)hostAppCanNavigateToAppBundleID:(id)a3;
- (unint64_t)hostAppCanNavigateToFileProviderDomain:(id)a3;
- (unint64_t)hostAppCanNavigateToTargetNode:(id)a3;
- (unint64_t)hostAppPermissionForTargetNode:(id)a3;
- (void)appProtectionCacheDidUpdate:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)authenticateLocationWithNoUI:(id)a3 completion:(id)a4;
- (void)authenticateLocationWithShielding:(id)a3 completion:(id)a4;
- (void)bundleIDOfAppContainer:(id)a3 completion:(id)a4;
- (void)protectedAppForAppContainerBundleID:(id)a3 completion:(id)a4;
- (void)setAllProtectedApplications:(id)a3;
- (void)setAppContainerCache:(id)a3;
- (void)setAppMonitorSubscription:(id)a3;
- (void)setFilteredDocumentApplicationsWithContentHiddenFromSearch:(id)a3;
- (void)setHiddenFilteredDocumentApplications:(id)a3;
- (void)setHostIdentifier:(id)a3;
- (void)setLockedFilteredDocumentApplications:(id)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateCachedFilteredApplications;
- (void)updateCachedFilteredApplicationsIfNeeded;
@end

@implementation DOCAppProtectionManager

- (NSArray)protectedApplications
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = (void *)MEMORY[0x263EFF9C0];
  v5 = [(DOCAppProtectionManager *)self lockedFilteredDocumentApplications];
  v6 = [v4 setWithArray:v5];

  v7 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
  [v6 addObjectsFromArray:v7];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v26;
    *(void *)&long long v9 = 136315394;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "bundleIdentifier", v23);
        v15 = [(DOCAppProtectionManager *)self protectedAppForAppContainerBundleID:v14];

        if (v15)
        {
          [v3 addObject:v15];
        }
        else
        {
          v16 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v16 = docLogHandle;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = "-[DOCAppProtectionManager protectedApplications]";
            __int16 v31 = 2112;
            v32 = v13;
            _os_log_debug_impl(&dword_213670000, v16, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@ in Spotlight cache. This means the ID does not represent an app with an App Container", buf, 0x16u);
          }
          v17 = [MEMORY[0x263EFFA08] set];
          v18 = [DOCProtectedApp alloc];
          v19 = [v13 bundleIdentifier];
          v20 = [(DOCProtectedApp *)v18 initWith:v19 oids:v17];

          [v3 addObject:v20];
          v21 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v21 = docLogHandle;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = "-[DOCAppProtectionManager protectedApplications]";
            __int16 v31 = 2112;
            v32 = v13;
            _os_log_debug_impl(&dword_213670000, v21, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s created protected app for ID: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  return (NSArray *)v3;
}

- (NSArray)applicationsWithContentHiddenFromSearch
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = (void *)MEMORY[0x263EFF9C0];
  v5 = [(DOCAppProtectionManager *)self filteredDocumentApplicationsWithContentHiddenFromSearch];
  v6 = [v4 setWithArray:v5];

  v7 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
  [v6 addObjectsFromArray:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v10 = 136315394;
    long long v19 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "bundleIdentifier", v19, (void)v20);
        v16 = [(DOCAppProtectionManager *)self protectedAppForAppContainerBundleID:v15];

        if (v16)
        {
          [v3 addObject:v16];
        }
        else
        {
          v17 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            v17 = docLogHandle;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v19;
            long long v25 = "-[DOCAppProtectionManager applicationsWithContentHiddenFromSearch]";
            __int16 v26 = 2112;
            long long v27 = v14;
            _os_log_debug_impl(&dword_213670000, v17, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for ID: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }

  return (NSArray *)v3;
}

- (NSArray)filteredDocumentApplicationsWithContentHiddenFromSearch
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)nodeRequiresAuthentication_Sync:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!+[DOCFeature protectedAppsEnabled])
  {
LABEL_16:
    LOBYTE(v22) = 0;
    goto LABEL_55;
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    v14 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v14 = docLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_16;
  }
  v5 = [v4 cachedDomain];
  v6 = v5;
  if (!v5) {
    goto LABEL_24;
  }
  v7 = [v5 topLevelBundleIdentifier];

  if (!v7) {
    goto LABEL_24;
  }
  id v8 = [v6 topLevelBundleIdentifier];
  uint64_t v9 = [(DOCAppProtectionManager *)self hostIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v11 = docLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v41 = v11;
      v42 = [(DOCAppProtectionManager *)self hostIdentifier];
      int v46 = 136315906;
      v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
      __int16 v48 = 2112;
      *(void *)v49 = v6;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = v42;
      *(_WORD *)&v49[18] = 2112;
      *(void *)&v49[20] = v4;
      _os_log_debug_impl(&dword_213670000, v41, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ matches host identifier: %@ for node: %@. Do not require auth.", (uint8_t *)&v46, 0x2Au);
    }
  }
  uint64_t v12 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v8];
  if ([v12 isHidden]) {
    int v13 = 1;
  }
  else {
    int v13 = [v12 isLocked];
  }
  long long v23 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    long long v23 = docLogHandle;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v46 = 136315906;
    v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
    __int16 v48 = 2112;
    *(void *)v49 = v6;
    *(_WORD *)&v49[8] = 1024;
    *(_DWORD *)&v49[10] = v13;
    *(_WORD *)&v49[14] = 2112;
    *(void *)&v49[16] = v4;
    _os_log_debug_impl(&dword_213670000, v23, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ locked or hidden: %d for node: %@", (uint8_t *)&v46, 0x26u);
  }

  if ((v10 | v13))
  {
    LOBYTE(v22) = v10 ^ 1;
  }
  else
  {
LABEL_24:
    if ([(DOCAppProtectionManager *)self canNodeHostAnAppContainer:v4])
    {
      double Current = CFAbsoluteTimeGetCurrent();
      long long v25 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        long long v25 = docLogHandle;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]();
      }
      __int16 v26 = [(DOCAppProtectionManager *)self bundleIDOfAppContainer_Sync:v4];
      if (v26
        && ([(DOCAppProtectionManager *)self hostIdentifier],
            long long v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = [v26 isEqualToString:v27],
            v27,
            (v28 & 1) == 0))
      {
        __int16 v31 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v26];
        v32 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v32 = docLogHandle;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v43 = v32;
          int v44 = [v31 isHidden];
          int v45 = [v31 isLocked];
          int v46 = 136316162;
          v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
          __int16 v48 = 2112;
          *(void *)v49 = v4;
          *(_WORD *)&v49[8] = 2112;
          *(void *)&v49[10] = v26;
          *(_WORD *)&v49[18] = 1024;
          *(_DWORD *)&v49[20] = v44;
          *(_WORD *)&v49[24] = 1024;
          *(_DWORD *)&v49[26] = v45;
          _os_log_debug_impl(&dword_213670000, v43, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : target node: %@ appContainerBundleIdentifier: %@ isHidden: %d isLocked: %d", (uint8_t *)&v46, 0x2Cu);
        }
        if ([v31 isHidden]) {
          int v22 = 1;
        }
        else {
          int v22 = [v31 isLocked];
        }
      }
      else
      {
        uint64_t v29 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          uint64_t v29 = docLogHandle;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v39 = v29;
          v40 = [(DOCAppProtectionManager *)self hostIdentifier];
          int v46 = 136315906;
          v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
          __int16 v48 = 2112;
          *(void *)v49 = v4;
          *(_WORD *)&v49[8] = 2112;
          *(void *)&v49[10] = v26;
          *(_WORD *)&v49[18] = 2112;
          *(void *)&v49[20] = v40;
          _os_log_debug_impl(&dword_213670000, v39, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Proceed without auth. Node: %@ is not in an app container OR app container bundle id: %@ matches host id: %@", (uint8_t *)&v46, 0x2Au);
        }
        int v22 = 0;
      }
      double v33 = CFAbsoluteTimeGetCurrent();
      uint64_t v34 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        uint64_t v34 = docLogHandle;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v36 = NSNumber;
        v37 = v34;
        v38 = [v36 numberWithDouble:v33 - Current];
        int v46 = 136315906;
        v47 = "-[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]";
        __int16 v48 = 1024;
        *(_DWORD *)v49 = v22;
        *(_WORD *)&v49[4] = 2112;
        *(void *)&v49[6] = v38;
        *(_WORD *)&v49[14] = 2112;
        *(void *)&v49[16] = v4;
        _os_log_debug_impl(&dword_213670000, v37, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s requiresAuthentication: %d took: %@ ms for node: %@", (uint8_t *)&v46, 0x26u);
      }
    }
    else
    {
      v30 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v30 = docLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[DOCAppProtectionManager nodeRequiresAuthentication_Sync:]();
      }
      LOBYTE(v22) = 0;
    }
  }

LABEL_55:
  return v22;
}

- (BOOL)hostAppCanSeeFileProviderDomain:(id)a3
{
  id v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled]) {
    goto LABEL_13;
  }
  v6 = [(DOCAppProtectionManager *)self hostIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    int v22 = [MEMORY[0x263F08690] currentHandler];
    long long v23 = [(DOCAppProtectionManager *)self hostIdentifier];
    [v22 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 878, @"Can not determine if host identifier is empty: %@", v23 object file lineNumber description];
  }
  id v8 = [v5 topLevelBundleIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    long long v25 = [v5 topLevelBundleIdentifier];
    [v24 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 879, @"Can not determine if host identifier is empty: %@", v25 object file lineNumber description];
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    int v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      int v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager hostAppCanSeeFileProviderDomain:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_13;
  }
  if (![v5 owningApplicationIsHidden])
  {
LABEL_13:
    char v12 = 1;
    goto LABEL_14;
  }
  int v10 = [v5 topLevelBundleIdentifier];
  uint64_t v11 = [(DOCAppProtectionManager *)self hostIdentifier];
  char v12 = [v10 isEqualToString:v11];

LABEL_14:
  return v12;
}

- (BOOL)hasAnyProtectedApps
{
  if (!+[DOCFeature protectedAppsEnabled]) {
    return 0;
  }
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  v3 = [(DOCAppProtectionManager *)self lockedFilteredDocumentApplications];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)updateCachedFilteredApplicationsIfNeeded
{
}

- (NSArray)hiddenFilteredDocumentApplications
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)lockedFilteredDocumentApplications
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)hostIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)updateCachedFilteredApplications
{
}

- (id)filterApplications:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DOCAppProtectionManager *)self _applicationRecordsForAPApplications:v4];
  id v24 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 136315650;
    long long v23 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        char v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "bundleIdentifier", v23);
        uint64_t v14 = [v5 objectForKey:v13];

        if (v14
          && [(DOCAppProtectionManager *)self _applicationShouldBeIncludedInList:v14])
        {
          [v24 addObject:v12];
        }
        else
        {
          uint64_t v15 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            uint64_t v15 = docLogHandle;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            v30 = "-[DOCAppProtectionManager filterApplications:]";
            __int16 v31 = 2112;
            uint64_t v32 = (uint64_t)v14;
            __int16 v33 = 2112;
            uint64_t v34 = (uint64_t)v12;
            _os_log_debug_impl(&dword_213670000, v15, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s LSApplicationRecord: %@ should NOT be included in the list of protected apps. APApplication: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [v6 count];
  uint64_t v17 = [v24 count];
  uint64_t v18 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v18 = docLogHandle;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v16 - v17;
    uint64_t v21 = v18;
    uint64_t v22 = [v24 count];
    *(_DWORD *)buf = 136315650;
    v30 = "-[DOCAppProtectionManager filterApplications:]";
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    __int16 v33 = 2048;
    uint64_t v34 = v20;
    _os_log_debug_impl(&dword_213670000, v21, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s found relevant: %lu applications and excluded: %lu applications", buf, 0x20u);
  }
  return v24;
}

- (id)_applicationRecordsForAPApplications:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 136315394;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "bundleIdentifier", v20);
        id v22 = 0;
        char v12 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:v11 allowPlaceholder:0 error:&v22];
        id v13 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (id v14 = v12) != 0)
        {
          uint64_t v15 = v14;
          uint64_t v16 = [v14 bundleIdentifier];
          [v21 setObject:v15 forKey:v16];
        }
        else
        {
          uint64_t v17 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            uint64_t v17 = docLogHandle;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            long long v28 = "-[DOCAppProtectionManager _applicationRecordsForAPApplications:]";
            __int16 v29 = 2112;
            v30 = v10;
            _os_log_error_impl(&dword_213670000, v17, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s could not get LSApplicationRecord for APApplication: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v7);
  }

  uint64_t v18 = [NSDictionary dictionaryWithDictionary:v21];

  return v18;
}

- (void)setLockedFilteredDocumentApplications:(id)a3
{
}

- (void)setHiddenFilteredDocumentApplications:(id)a3
{
}

- (void)setFilteredDocumentApplicationsWithContentHiddenFromSearch:(id)a3
{
}

- (void)setAllProtectedApplications:(id)a3
{
}

- (NSSet)allProtectedApplications
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

+ (DOCAppProtectionManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedManager__sharedManager;
  return (DOCAppProtectionManager *)v2;
}

- (void)setHostIdentifier:(id)a3
{
}

uint64_t __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_76(void *a1)
{
  if (a1[4])
  {
    v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"DOCAppProtectionAuthenticationChallengeDidFinishNotification" object:a1[5] userInfo:a1[4]];
  }
  id v3 = *(uint64_t (**)(void))(a1[7] + 16);
  return v3();
}

uint64_t __40__DOCAppProtectionManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedManager__sharedManager;
  sharedManager__sharedManager = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCAppProtectionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCAppProtectionManager;
  v2 = [(DOCAppProtectionManager *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    hostIdentifier = v2->_hostIdentifier;
    v2->_hostIdentifier = (NSString *)&stru_26C404058;

    uint64_t v5 = [[DOCProtectedAppContainerCache alloc] initWithDelegate:v3];
    [(DOCAppProtectionManager *)v3 setAppContainerCache:v5];

    long long v6 = [(DOCAppProtectionManager *)v3 appContainerCache];
    [v6 setAppProtectionContext:v3];

    [(DOCAppProtectionManager *)v3 startObserving];
  }
  return v3;
}

- (void)startObserving
{
}

- (void)setAppMonitorSubscription:(id)a3
{
}

- (void)setAppContainerCache:(id)a3
{
}

- (DOCProtectedAppContainerCache)appContainerCache
{
  return (DOCProtectedAppContainerCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)authenticateLocationWithNoUI:(id)a3 completion:(id)a4
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke;
  v60[3] = &unk_2641B5E18;
  id v8 = v6;
  id v61 = v8;
  v62 = self;
  id v9 = v7;
  id v63 = v9;
  uint64_t v10 = (void (**)(void, void, void, void))MEMORY[0x21668ED30](v60);
  if (+[DOCFeature protectedAppsEnabled])
  {
    if ([(DOCAppProtectionManager *)self hasAnyProtectedApps])
    {
      if (v8)
      {
        uint64_t v11 = [v8 cachedDomain];
        char v12 = [v11 topLevelBundleIdentifier];
        id v13 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          id v13 = docLogHandle;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          log = v13;
          v47 = [(DOCAppProtectionManager *)self hostIdentifier];
          __int16 v48 = [v11 topLevelBundleIdentifier];
          *(_DWORD *)buf = 136316162;
          v65 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]";
          __int16 v66 = 2112;
          v67 = v47;
          __int16 v68 = 2112;
          id v69 = v8;
          __int16 v70 = 2112;
          id v71 = v11;
          __int16 v72 = 2112;
          v73 = v48;
          _os_log_debug_impl(&dword_213670000, log, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s targetNode: %@ cachedDomain: %@, topLevelBundleIdentifier: %@ hostIdentifier: %@, ", buf, 0x34u);
        }
        id v14 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          id v14 = docLogHandle;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.5(v14, self);
          if (!v12) {
            goto LABEL_46;
          }
        }
        else if (!v12)
        {
          goto LABEL_46;
        }
        uint64_t v15 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v12];
        uint64_t v16 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          uint64_t v16 = docLogHandle;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.4((uint64_t)v12, v15, v16);
        }
        uint64_t v17 = [(DOCAppProtectionManager *)self hostIdentifier];
        int v18 = [v12 isEqualToString:v17];

        if (v18)
        {
          uint64_t v19 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            uint64_t v19 = docLogHandle;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v49 = v19;
            uint64_t v50 = [(DOCAppProtectionManager *)self hostIdentifier];
            *(_DWORD *)buf = 136315906;
            v65 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]";
            __int16 v66 = 2112;
            v67 = v11;
            __int16 v68 = 2112;
            id v69 = v50;
            __int16 v70 = 2112;
            id v71 = v8;
            _os_log_debug_impl(&dword_213670000, v49, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s : cached file provider domain %@ matches host identifier: %@ for node: %@. Do not require auth.", buf, 0x2Au);
          }
          [v15 isLocked];
        }
        else if ([v15 isLocked])
        {
          int v44 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            int v44 = docLogHandle;
          }
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]();
          }
          int v45 = [MEMORY[0x263F251F8] sharedGuard];
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79;
          v56[3] = &unk_2641B5E40;
          id v57 = v12;
          id v58 = v8;
          v59 = v10;
          [v45 authenticateForSubject:v15 completion:v56];

          int v46 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            int v46 = docLogHandle;
          }
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]();
          }
          goto LABEL_47;
        }

LABEL_46:
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_80;
        v52[3] = &unk_2641B5E90;
        v52[4] = self;
        id v53 = v11;
        id v54 = v8;
        v55 = v10;
        [(DOCAppProtectionManager *)self bundleIDOfAppContainer:v54 completion:v52];

LABEL_47:
        goto LABEL_35;
      }
      uint64_t v36 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        uint64_t v36 = docLogHandle;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:](v36, v37, v38, v39, v40, v41, v42, v43);
      }
    }
    else
    {
      long long v28 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        long long v28 = docLogHandle;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.6(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
  }
  else
  {
    long long v20 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      long long v20 = docLogHandle;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager authenticateLocationWithNoUI:completion:].cold.7(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  v10[2](v10, 1, 0, 0);
LABEL_35:
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_cold_1((uint64_t)v7, a1, v9);
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_76;
  v14[3] = &unk_2641B5DF0;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 48);
  id v15 = v8;
  uint64_t v16 = v10;
  char v19 = a2;
  id v17 = v7;
  id v18 = v11;
  id v12 = v7;
  id v13 = v8;
  DOCRunInMainThread(v14);
}

- (BOOL)isFilesAppLocked
{
  v2 = [(DOCAppProtectionManager *)self lockedApplicationBundleIDs];
  char v3 = [v2 containsObject:@"com.apple.DocumentsApp"];

  return v3;
}

- (NSArray)lockedApplicationBundleIDs
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  char v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(DOCAppProtectionManager *)self lockedFilteredDocumentApplications];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(DOCAppProtectionManager *)self hostIdentifier];
        char v11 = [v9 isEqual:v10];

        if ((v11 & 1) == 0)
        {
          id v12 = [v9 bundleIdentifier];
          id v13 = (void *)[v12 copy];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  [v3 sortUsingSelector:sel_caseInsensitiveCompare_];

  return (NSArray *)v3;
}

- (NSArray)hiddenApplicationBundleIDs
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  char v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(DOCAppProtectionManager *)self hostIdentifier];
        char v11 = [v9 isEqual:v10];

        if ((v11 & 1) == 0)
        {
          id v12 = [v9 bundleIdentifier];
          id v13 = (void *)[v12 copy];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  [v3 sortUsingSelector:sel_caseInsensitiveCompare_];

  return (NSArray *)v3;
}

- (NSArray)protectedApplicationBundleIDs
{
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  char v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(DOCAppProtectionManager *)self hiddenApplicationBundleIDs];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(DOCAppProtectionManager *)self lockedApplicationBundleIDs];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [v3 allObjects];
  uint64_t v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  return (NSArray *)v7;
}

- (NSArray)hiddenApplications
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  char v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 136315394;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "bundleIdentifier", v15);
        id v12 = [(DOCAppProtectionManager *)self protectedAppForAppContainerBundleID:v11];

        if (v12)
        {
          [v3 addObject:v12];
        }
        else
        {
          id v13 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            id v13 = docLogHandle;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = "-[DOCAppProtectionManager hiddenApplications]";
            __int16 v22 = 2112;
            uint64_t v23 = v10;
            _os_log_debug_impl(&dword_213670000, v13, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app APApplication: %@ in app container cache", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)lockedApplications
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  char v3 = [MEMORY[0x263EFF980] array];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = [(DOCAppProtectionManager *)self lockedFilteredDocumentApplications];
  long long v6 = [v4 setWithArray:v5];

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = [(DOCAppProtectionManager *)self hiddenFilteredDocumentApplications];
  id v9 = [v7 setWithArray:v8];
  [v6 minusSet:v9];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v23;
    *(void *)&long long v12 = 136315394;
    long long v21 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v17 = objc_msgSend(v16, "bundleIdentifier", v21, (void)v22);
        long long v18 = [(DOCAppProtectionManager *)self protectedAppForAppContainerBundleID:v17];

        if (v18)
        {
          [v3 addObject:v18];
        }
        else
        {
          long long v19 = docLogHandle;
          if (!docLogHandle)
          {
            DOCInitLogging();
            long long v19 = docLogHandle;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            uint64_t v27 = "-[DOCAppProtectionManager lockedApplications]";
            __int16 v28 = 2112;
            uint64_t v29 = v16;
            _os_log_debug_impl(&dword_213670000, v19, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s could not find protected app for APApplication: %@ in app container cache", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  return (NSArray *)v3;
}

- (id)protectedAppForAppContainerOID:(id)a3
{
  id v4 = a3;
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  if (+[DOCFeature protectedAppsEnabled])
  {
    uint64_t v5 = [(DOCAppProtectionManager *)self appContainerCache];
    long long v6 = [v5 appForAppContainerOID:v4];
  }
  else
  {
    uint64_t v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager protectedAppForAppContainerOID:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    long long v6 = 0;
  }

  return v6;
}

- (id)protectedAppForAppContainerBundleID:(id)a3
{
  id v4 = a3;
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  if (+[DOCFeature protectedAppsEnabled])
  {
    uint64_t v5 = [(DOCAppProtectionManager *)self appContainerCache];
    long long v6 = [v5 appForAppContainerBundleID:v4];
  }
  else
  {
    uint64_t v7 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v7 = docLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager protectedAppForAppContainerBundleID:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    long long v6 = 0;
  }

  return v6;
}

- (void)protectedAppForAppContainerBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DOCAppProtectionManager *)self updateCachedFilteredApplicationsIfNeeded];
  if (+[DOCFeature protectedAppsEnabled])
  {
    uint64_t v8 = [(DOCAppProtectionManager *)self appContainerCache];
    [v8 appForAppContainerBundleID:v6 completion:v7];
  }
  else
  {
    uint64_t v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager protectedAppForAppContainerBundleID:completion:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (BOOL)_applicationShouldBeIncludedInList:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.DocumentsApp"];

  if (v5 & 1) != 0 || (objc_msgSend(v3, "doc_canHaveAppContainer")) {
    char v6 = 1;
  }
  else {
    char v6 = objc_msgSend(v3, "doc_hasFileProviderExtension");
  }

  return v6;
}

- (void)authenticateLocationWithShielding:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke;
  v42[3] = &unk_2641B5D50;
  id v9 = v8;
  id v43 = v9;
  uint64_t v10 = (void (**)(void, void, void))MEMORY[0x21668ED30](v42);
  if (!+[DOCFeature protectedAppsEnabled])
  {
    uint64_t v14 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v14 = docLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_23;
  }
  if (!v7)
  {
    long long v22 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      long long v22 = docLogHandle;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_23;
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    uint64_t v30 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v30 = docLogHandle;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager authenticateLocationWithShielding:completion:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_23:
    v10[2](v10, 1, 0);
    goto LABEL_24;
  }
  uint64_t v11 = [(DOCAppProtectionManager *)self hostIdentifier];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    uint64_t v38 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v39 = [(DOCAppProtectionManager *)self hostIdentifier];
    [v38 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 527, @"[PROTECTED APPS] Can not determine if host identifier is empty: %@", v39 object file lineNumber description];
  }
  uint64_t v13 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v13 = docLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[DOCAppProtectionManager authenticateLocationWithShielding:completion:]((uint64_t)v7, v13);
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69;
  v40[3] = &unk_2641B5DC8;
  v40[4] = self;
  uint64_t v41 = v10;
  [v7 fetchFPItem:v40];

LABEL_24:
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_2;
  v8[3] = &unk_2641B5D28;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  DOCRunInMainThread(v8);
}

uint64_t __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_5((uint64_t)v5, v7);
  }
  id v8 = v5;
  id v9 = [v8 cachedDomain];
  id v10 = [v9 topLevelBundleIdentifier];
  char v11 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    char v11 = docLogHandle;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_4(a1, v11);
    if (!v10) {
      goto LABEL_23;
    }
  }
  else if (!v10)
  {
LABEL_23:
    uint64_t v17 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72;
    v18[3] = &unk_2641B5DA0;
    v18[4] = v17;
    id v19 = v9;
    id v21 = *(id *)(a1 + 40);
    id v20 = v8;
    [v17 bundleIDOfAppContainer:v20 completion:v18];

    goto LABEL_24;
  }
  uint64_t v12 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v10];
  uint64_t v13 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v13 = docLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_3((uint64_t)v10, v12, v13);
  }
  if (![v12 isLocked])
  {

    goto LABEL_23;
  }
  uint64_t v14 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v14 = docLogHandle;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_2();
  }
  uint64_t v15 = [MEMORY[0x263F251F8] sharedGuard];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_71;
  v22[3] = &unk_2641B5D78;
  id v23 = v10;
  id v24 = *(id *)(a1 + 40);
  [v15 initiateAuthenticationWithShieldingForSubject:v12 completion:v22];

  uint64_t v16 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v16 = docLogHandle;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_1();
  }
LABEL_24:
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_71(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_71_cold_1();
    }
  }
  id v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136315906;
    id v10 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl(&dword_213670000, v7, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Provider domain: %@ authentication completion handler success: %d error: %@", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([*(id *)(a1 + 32) hostIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v5 isEqualToString:v7],
        v7,
        (v8 & 1) == 0))
  {
    id v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = *(void **)(a1 + 32);
      __int16 v15 = v10;
      id v16 = [v14 hostIdentifier];
      uint64_t v17 = *(void **)(a1 + 40);
      uint64_t v18 = [v17 topLevelBundleIdentifier];
      *(_DWORD *)buf = 136316162;
      long long v22 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_debug_impl(&dword_213670000, v15, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Authentication start for hostIdentifier: %@ node domain: %@ topLevelBundleIdentifier: %@ appContainerBundleIdentifier: %@", buf, 0x34u);
    }
    __int16 v11 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v5];
    uint64_t v12 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v12 = docLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72_cold_2(v11, v12);
    }
    __int16 v13 = [MEMORY[0x263F251F8] sharedGuard];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73;
    v19[3] = &unk_2641B5D50;
    id v20 = *(id *)(a1 + 56);
    [v13 initiateAuthenticationWithShieldingForSubject:v11 completion:v19];
  }
  else
  {
    int v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      int v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72_cold_1(a1, (uint64_t)v5, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v5 = docLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73_cold_2();
    }
  }
  id v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79(void *a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79_cold_2();
    }
  }
  id v7 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v7 = docLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = a1[4];
    int v13 = 136315906;
    int v14 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_debug_impl(&dword_213670000, v7, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Provider domain: %@ authentication completion handler success: %d error: %@", (uint8_t *)&v13, 0x26u);
  }
  char v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    char v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79_cold_1();
  }
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = v9;
  uint64_t v11 = a1[5];
  if (v11) {
    [v9 setObject:v11 forKeyedSubscript:@"DOCAppProtectionStatusNotificationUserInfoAuthenticatedNodeKey"];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([*(id *)(a1 + 32) hostIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v5 isEqualToString:v7],
        v7,
        (v8 & 1) == 0))
  {
    id v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = *(void **)(a1 + 32);
      __int16 v15 = v10;
      uint64_t v16 = [v14 hostIdentifier];
      __int16 v17 = *(void **)(a1 + 40);
      int v18 = [v17 topLevelBundleIdentifier];
      *(_DWORD *)buf = 136316162;
      id v24 = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_debug_impl(&dword_213670000, v15, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s Authentication start for hostIdentifier: %@ node domain: %@ topLevelBundleIdentifier: %@ appContainerBundleIdentifier: %@", buf, 0x34u);
    }
    uint64_t v11 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v5];
    uint64_t v12 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_81;
    v19[3] = &unk_2641B5E68;
    id v20 = v11;
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v13 = v11;
    [v12 protectedAppForAppContainerBundleID:v5 completion:v19];
  }
  else
  {
    int v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      int v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72_cold_1(a1, (uint64_t)v5, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v4 = docLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_81_cold_1(a1, v4);
  }
  id v5 = [MEMORY[0x263F251F8] sharedGuard];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_82;
  v8[3] = &unk_2641B5E40;
  id v9 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  [v5 authenticateForSubject:v6 completion:v8];
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_82(void *a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v5 = docLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_82_cold_2();
    }
  }
  uint64_t v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79_cold_1();
  }
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  if (a1[4])
  {
    v10[0] = a1[4];
    char v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v7 setObject:v8 forKeyedSubscript:@"DOCAppProtectionStatusNotificationUserInfoAppsKey"];
  }
  uint64_t v9 = a1[5];
  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:@"DOCAppProtectionStatusNotificationUserInfoAuthenticatedNodeKey"];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)canNodeHostAnAppContainer:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[DOCFeature protectedAppsEnabled])
  {
    if (v4)
    {
      id v5 = [v4 providerID];
      uint64_t v6 = [v4 cachedDomain];
      if ([v6 isiCloudDriveProvider])
      {
        id v7 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          id v7 = docLogHandle;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[DOCAppProtectionManager canNodeHostAnAppContainer:]((uint64_t)v4, v7);
        }
      }
      else
      {
        int v10 = [v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"];
        id v11 = docLogHandle;
        if (!v10)
        {
          if (!docLogHandle)
          {
            DOCInitLogging();
            id v11 = docLogHandle;
          }
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v13 = v11;
            int v14 = [(DOCAppProtectionManager *)self hostIdentifier];
            int v15 = 136315906;
            uint64_t v16 = "-[DOCAppProtectionManager canNodeHostAnAppContainer:]";
            __int16 v17 = 2112;
            id v18 = v4;
            __int16 v19 = 2112;
            id v20 = v6;
            __int16 v21 = 2112;
            id v22 = v14;
            _os_log_debug_impl(&dword_213670000, v13, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s targetNode: %@ returning NO. Cached domain: %@ Host ID: %@", (uint8_t *)&v15, 0x2Au);
          }
          BOOL v9 = 0;
          goto LABEL_24;
        }
        if (!docLogHandle)
        {
          DOCInitLogging();
          id v11 = docLogHandle;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[DOCAppProtectionManager canNodeHostAnAppContainer:]((uint64_t)v4, v11);
        }
      }
      BOOL v9 = 1;
LABEL_24:

      goto LABEL_25;
    }
    char v8 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      char v8 = docLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager canNodeHostAnAppContainer:](v8);
    }
  }
  BOOL v9 = 0;
LABEL_25:

  return v9;
}

- (unint64_t)hostAppCanNavigateToTargetNode:(id)a3
{
  id v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled])
  {
LABEL_11:
    unint64_t v9 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [(DOCAppProtectionManager *)self hostIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    __int16 v19 = [MEMORY[0x263F08690] currentHandler];
    id v20 = [(DOCAppProtectionManager *)self hostIdentifier];
    [v19 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 809, @"Can not determine if host identifier is empty: %@", v20 object file lineNumber description];
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    int v10 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      int v10 = docLogHandle;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager hostAppCanNavigateToTargetNode:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_11;
  }
  char v8 = [v5 cachedDomain];
  if (v8) {
    unint64_t v9 = [(DOCAppProtectionManager *)self hostAppCanNavigateToFileProviderDomain:v8];
  }
  else {
    unint64_t v9 = 0;
  }

LABEL_14:
  return v9;
}

- (unint64_t)hostAppCanNavigateToFileProviderDomain:(id)a3
{
  id v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled])
  {
LABEL_12:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [(DOCAppProtectionManager *)self hostIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    __int16 v21 = [MEMORY[0x263F08690] currentHandler];
    id v22 = [(DOCAppProtectionManager *)self hostIdentifier];
    [v21 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 827, @"Can not determine if host identifier is empty: %@", v22 object file lineNumber description];
  }
  char v8 = [v5 topLevelBundleIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    id v24 = [v5 topLevelBundleIdentifier];
    [v23 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 828, @"Can not determine if host identifier is empty: %@", v24 object file lineNumber description];
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    uint64_t v12 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v12 = docLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager hostAppCanNavigateToFileProviderDomain:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_12;
  }
  int v10 = [v5 topLevelBundleIdentifier];
  unint64_t v11 = [(DOCAppProtectionManager *)self hostAppCanNavigateToAppBundleID:v10];

LABEL_13:
  return v11;
}

- (unint64_t)hostAppCanNavigateToAppBundleID:(id)a3
{
  id v5 = a3;
  if (!+[DOCFeature protectedAppsEnabled])
  {
LABEL_11:
    unint64_t v12 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [(DOCAppProtectionManager *)self hostIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    id v22 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v23 = [(DOCAppProtectionManager *)self hostIdentifier];
    [v22 handleFailureInMethod:a2, self, @"DOCAppProtectionManager.m", 848, @"Can not determine if host identifier is empty: %@", v23 object file lineNumber description];
  }
  if (![(DOCAppProtectionManager *)self hasAnyProtectedApps])
  {
    uint64_t v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager hostAppCanNavigateToAppBundleID:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_11;
  }
  char v8 = [MEMORY[0x263F251D0] applicationWithBundleIdentifier:v5];
  if ([v8 isHidden])
  {
    uint64_t v9 = [v8 bundleIdentifier];
    int v10 = [(DOCAppProtectionManager *)self hostIdentifier];
    int v11 = [v9 isEqualToString:v10];

    unint64_t v12 = v11 ^ 1u;
  }
  else
  {
    unint64_t v12 = 0;
  }

LABEL_14:
  return v12;
}

- (unint64_t)hostAppPermissionForTargetNode:(id)a3
{
  return [(DOCAppProtectionManager *)self hostAppCanNavigateToTargetNode:a3] == 1;
}

- (BOOL)itemIsAppContainer:(id)a3
{
  id v3 = objc_msgSend(a3, "fpfs_fpItem");
  id v4 = objc_msgSend(v3, "fp_appContainerBundleIdentifier");
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)itemIsInAppContainer:(id)a3
{
  return 0;
}

- (void)bundleIDOfAppContainer:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  char v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    char v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DOCAppProtectionManager bundleIDOfAppContainer:completion:].cold.4();
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke;
  v33[3] = &unk_2641B5EB8;
  id v9 = v5;
  id v34 = v9;
  CFAbsoluteTime v35 = Current;
  int v10 = (void (**)(void, void))MEMORY[0x21668ED30](v33);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_90;
  v30[3] = &unk_2641B5EE0;
  id v11 = v9;
  id v31 = v11;
  id v12 = v6;
  id v32 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x21668ED30](v30);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v14 = docLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager bundleIDOfAppContainer:completion:]();
    }
    id v15 = v11;
    uint64_t v16 = [v15 fileURL];

    if (!v16)
    {
      uint64_t v20 = [v15 itemIdentifier];
      uint64_t v21 = *MEMORY[0x263F053F0];
      int v22 = [v20 isEqualToString:*MEMORY[0x263F053F0]];

      if (v22)
      {
        (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
LABEL_29:

        goto LABEL_30;
      }
      id v24 = [v15 parentItemIdentifier];
      int v25 = [v24 isEqualToString:v21];

      if (v25)
      {
        uint64_t v23 = objc_msgSend(v15, "fp_appContainerBundleIdentifier");
        (*((void (**)(id, void *, void))v12 + 2))(v12, v23, 0);
      }
      else
      {
        uint64_t v26 = [MEMORY[0x263F054C0] defaultManager];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_95;
        v27[3] = &unk_2641B5F08;
        uint64_t v28 = v13;
        id v29 = v12;
        [v26 fetchURLForItem:v15 completionHandler:v27];

        uint64_t v23 = v28;
      }
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v17 = [v15 fileURL];
LABEL_27:
    uint64_t v23 = (void *)v17;
    v13[2](v13, v17);
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v18 = docLogHandle;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[DOCAppProtectionManager bundleIDOfAppContainer:completion:]();
    }
    ((void (**)(void, id))v10)[2](v10, v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint64_t v19 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        uint64_t v19 = docLogHandle;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[DOCAppProtectionManager bundleIDOfAppContainer:completion:]();
      }
      (*((void (**)(id, id, void))v12 + 2))(v12, v15, 0);
      goto LABEL_29;
    }
    uint64_t v17 = [v11 nodeURL];
    goto LABEL_27;
  }
  (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
LABEL_30:
}

id __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void **)(a1 + 32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = [MEMORY[0x263F397B0] appLibraryNodeForNode:v3];
    id v5 = [v4 appIdentifier];
    double Current = CFAbsoluteTimeGetCurrent();
    double v7 = *(double *)(a1 + 40);
    char v8 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      char v8 = docLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v11 = *v2;
      id v12 = v8;
      uint64_t v13 = [v11 displayName];
      uint64_t v14 = [NSNumber numberWithDouble:Current - v7];
      int v15 = 136316162;
      uint64_t v16 = "-[DOCAppProtectionManager bundleIDOfAppContainer:completion:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      int v22 = v5;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_debug_impl(&dword_213670000, v12, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s 1. FINode: (%@) %@ appIdentifier: %@ took: %@ ms", (uint8_t *)&v15, 0x34u);
    }
    id v9 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      id v9 = docLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_cold_1((uint64_t)v2, v9);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) cachedDomain];
  int v5 = [v4 isiCloudDriveProvider];

  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    double v7 = objc_msgSend(v3, "br_containerID");
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
LABEL_13:
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v8 = objc_msgSend(MEMORY[0x263F05420], "sharedRegistry", 0);
    double v7 = [v8 listOfMonitoredApps];

    uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v14 = [v13 documentsURL];
          uint64_t v15 = objc_msgSend(v14, "fp_relationshipToItemAtURL:", v3);

          if (v15 != 2)
          {
            uint64_t v16 = *(void *)(a1 + 40);
            __int16 v17 = [v13 bundleID];
            (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_95(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)bundleIDOfAppContainer_Sync:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  int v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    int v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DOCAppProtectionManager bundleIDOfAppContainer_Sync:]();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __55__DOCAppProtectionManager_bundleIDOfAppContainer_Sync___block_invoke;
  long long v19 = &unk_2641B5F30;
  long long v21 = &v22;
  char v8 = v7;
  long long v20 = v8;
  [(DOCAppProtectionManager *)self bundleIDOfAppContainer:v4 completion:&v16];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  double v9 = CFAbsoluteTimeGetCurrent();
  uint64_t v10 = (void *)docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v10 = (void *)docLogHandle;
  }
  uint64_t v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v23[5];
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:", v9 - Current, v16, v17, v18, v19);
    *(_DWORD *)buf = 136315906;
    id v29 = "-[DOCAppProtectionManager bundleIDOfAppContainer_Sync:]";
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    __int16 v34 = 2112;
    CFAbsoluteTime v35 = v15;
    _os_log_debug_impl(&dword_213670000, v11, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s node: %@ appContainerBundleIdentifier: %@ took: %@ ms", buf, 0x2Au);
  }
  id v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __55__DOCAppProtectionManager_bundleIDOfAppContainer_Sync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

- (void)appProtectionCacheDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    int v5 = docLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DOCAppProtectionManager appProtectionCacheDidUpdate:]();
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke;
  v6[3] = &unk_2641B55D8;
  v6[4] = self;
  DOCRunInMainThread(v6);
}

void __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F089F8] notificationWithName:@"DOCAppProtectionStatusDidChangeNotification" object:*(void *)(a1 + 32) userInfo:MEMORY[0x263EFFA78]];
  v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke_cold_1();
  }
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotification:v1];
}

- (void)stopObserving
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() appMonitorSubscription];
  v5[0] = 136315650;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_213670000, v1, v4, "[PROTECTED APPS] %s invalidating subscription: %@ self: %@", (uint8_t *)v5);
}

- (NSArray)appToOID
{
  return self->_appToOID;
}

- (APSubjectMonitorSubscription)appMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_appToOID, 0);
  objc_storeStrong((id *)&self->_filteredDocumentApplicationsWithContentHiddenFromSearch, 0);
  objc_storeStrong((id *)&self->_hiddenFilteredDocumentApplications, 0);
  objc_storeStrong((id *)&self->_lockedFilteredDocumentApplications, 0);
  objc_storeStrong((id *)&self->_allProtectedApplications, 0);
  objc_storeStrong((id *)&self->_appContainerCache, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    char v8 = docLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscription:](v8);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke;
  v10[3] = &unk_2641B5600;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  DOCRunInMainThread(v10);
}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v2 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v2 = docLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_3(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  [*(id *)(a1 + 32) updateCachedFilteredApplications];
  uint64_t v10 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v10 = docLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_2(a1, v10);
  }
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v31;
    *(void *)&long long v14 = 136315394;
    long long v29 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v19 = [v18 bundleIdentifier];
          if (v19)
          {
            long long v20 = [*(id *)(a1 + 32) protectedAppForAppContainerBundleID:v19];
            if (v20)
            {
              [v11 addObject:v20];
            }
            else
            {
              uint64_t v22 = docLogHandle;
              if (!docLogHandle)
              {
                DOCInitLogging();
                uint64_t v22 = docLogHandle;
              }
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v29;
                uint64_t v37 = "-[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscriptio"
                      "n:]_block_invoke";
                __int16 v38 = 2112;
                uint64_t v39 = v19;
                _os_log_error_impl(&dword_213670000, v22, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s could not find cached app for ID: %@ in appContainer having app cache", buf, 0x16u);
              }
            }
          }
          else
          {
            long long v21 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              long long v21 = docLogHandle;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              uint64_t v37 = "-[DOCAppProtectionManager(APSubjectMonitorConformance) appProtectionSubjectsChanged:forSubscription:]_block_invoke";
              __int16 v38 = 2112;
              uint64_t v39 = v18;
              _os_log_error_impl(&dword_213670000, v21, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s could not get app ID from subject: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v15);
  }

  uint64_t v23 = (void *)MEMORY[0x263F089F8];
  uint64_t v24 = *(void *)(a1 + 32);
  __int16 v34 = @"DOCAppProtectionStatusNotificationUserInfoAppsKey";
  CFAbsoluteTime v35 = v11;
  uint64_t v25 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  uint64_t v26 = [v23 notificationWithName:@"DOCAppProtectionStatusDidChangeNotification" object:v24 userInfo:v25];

  id v27 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    id v27 = docLogHandle;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_1((uint64_t)v26, v27);
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v29, (void)v30);
  [v28 postNotification:v26];
}

- (void)protectedAppForAppContainerOID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)protectedAppForAppContainerBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)protectedAppForAppContainerBundleID:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateLocationWithShielding:(uint64_t)a1 completion:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [(id)OUTLINED_FUNCTION_10() displayName];
  objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(id)OUTLINED_FUNCTION_22() nodeURL];
  int v7 = 136315906;
  uint64_t v8 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  id v12 = v3;
  __int16 v13 = 2112;
  long long v14 = v6;
  _os_log_debug_impl(&dword_213670000, v2, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s targetNode: %@ displayName: %@ nodeURL: %@", (uint8_t *)&v7, 0x2Au);
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateLocationWithShielding:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s domain: %@ required auth. Skipping item auth check", v2, v3, v4, v5, 2u);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ is locked starting authentication", v2, v3, v4, v5, 2u);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 isLocked];
  [a2 isHidden];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_19(&dword_213670000, v5, v6, "[PROTECTED APPS] %s Check if provider domain: %@ subject: %@ isHidden: %d isLocked: %d", v7, v8, v9, v10, v11);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [(id)OUTLINED_FUNCTION_14() hostIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_10() topLevelBundleIdentifier];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_213670000, v6, v7, "[PROTECTED APPS] %s hostIdentifier: %@, cachedDomain: %@, topLevelBundleIdentifier: %@", v8, v9, v10, v11, 2u);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_69_cold_5(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [(id)OUTLINED_FUNCTION_10() displayName];
  int v6 = 136315650;
  uint64_t v7 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_213670000, v2, v5, "[PROTECTED APPS] %s fetched FPItem: %@ displayName: %@", (uint8_t *)&v6);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_71_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_213670000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ isinitiateAuthenticationWithShieldingForSubject failed with error: %@", v2);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_14() hostIdentifier];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_213670000, v6, v7, "[PROTECTED APPS] Proceed without auth. Node: %@ is not in an app container OR app container bundle id: %@ matches host id: %@", v8, v9, v10, v11, 2u);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_72_cold_2(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v5 = 136315906;
  uint64_t v6 = "-[DOCAppProtectionManager authenticateLocationWithShielding:completion:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = [(id)OUTLINED_FUNCTION_10() isHidden];
  __int16 v11 = 1024;
  int v12 = [a1 isLocked];
  _os_log_debug_impl(&dword_213670000, v2, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s authentication subject creation: %@ isHidden: %d isLocked: %d", (uint8_t *)&v5, 0x22u);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12(&dword_213670000, v0, v1, "[PROTECTED APPS] %s authentication completion handler success: %d error: %@", v2);
}

void __72__DOCAppProtectionManager_authenticateLocationWithShielding_completion___block_invoke_73_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_213670000, v0, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s initiateAuthenticationWithShieldingForSubject failed with error: %@", (uint8_t *)v1, 0x16u);
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateLocationWithNoUI:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s domain: %@ required auth. Skipping item auth check", v2, v3, v4, v5, 2u);
}

- (void)authenticateLocationWithNoUI:completion:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ is locked starting authentication", v2, v3, v4, v5, 2u);
}

- (void)authenticateLocationWithNoUI:(void *)a3 completion:.cold.4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 isLocked];
  [a2 isHidden];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_19(&dword_213670000, v5, v6, "[PROTECTED APPS] %s Check if provider domain: %@ subject: %@ isHidden: %d isLocked: %d", v7, v8, v9, v10, v11);
}

- (void)authenticateLocationWithNoUI:(void *)a1 completion:(void *)a2 .cold.5(void *a1, void *a2)
{
  id v4 = a1;
  [(id)OUTLINED_FUNCTION_14() hostIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_10() topLevelBundleIdentifier];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_213670000, v6, v7, "[PROTECTED APPS] %s hostIdentifier: %@, cachedDomain: %@, topLevelBundleIdentifier: %@", v8, v9, v10, v11, 2u);
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authenticateLocationWithNoUI:(uint64_t)a3 completion:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[DOCAppProtectionManager authenticateLocationWithNoUI:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_13(&dword_213670000, a2, a3, "[PROTECTED APPS] %s authentication failed with error: %@ for node: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 32));
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12(&dword_213670000, v0, v1, "[PROTECTED APPS] %s authenticateForSubject completion success: %d error: %@", v2);
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_79_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13(&dword_213670000, v0, v1, "[PROTECTED APPS] %s Provider domain: %@ isinitiateAuthenticationWithShieldingForSubject failed with error: %@", v2);
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_81_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  int v5 = [(id)OUTLINED_FUNCTION_14() isHidden];
  [*(id *)(a1 + 32) isLocked];
  v7[0] = 136315906;
  OUTLINED_FUNCTION_20();
  __int16 v8 = 1024;
  int v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_debug_impl(&dword_213670000, v2, OS_LOG_TYPE_DEBUG, "[PROTECTED APPS] %s authentication subject creation: %@ isHidden: %d isLocked: %d", (uint8_t *)v7, 0x22u);
}

void __67__DOCAppProtectionManager_authenticateLocationWithNoUI_completion___block_invoke_82_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_213670000, v0, OS_LOG_TYPE_ERROR, "[PROTECTED APPS] %s authenticateForSubject failed with error: %@", (uint8_t *)v1, 0x16u);
}

- (void)nodeRequiresAuthentication_Sync:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s Checking if location needs auth authentication start node: %@", v2, v3, v4, v5, 2u);
}

- (void)nodeRequiresAuthentication_Sync:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_213670000, v0, (uint64_t)v0, "[PROTECTED APPS] %s : target node: %@ can't host an appContainer, and isn't in a locked file provider domain %@ can't require auth", (uint8_t *)v1);
}

- (void)nodeRequiresAuthentication_Sync:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)canNodeHostAnAppContainer:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_10() hostIdentifier];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_18(&dword_213670000, v4, v5, "[PROTECTED APPS] %s Empty target node. Host ID: %@", v6, v7, v8, v9, 2u);
}

- (void)canNodeHostAnAppContainer:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_22() hostIdentifier];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_4(&dword_213670000, v5, v6, "[PROTECTED APPS] %s targetNode: %@ Is iCloud Drive returning YES. Host ID: %@", v7, v8, v9, v10, 2u);
}

- (void)canNodeHostAnAppContainer:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_22() hostIdentifier];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_4(&dword_213670000, v5, v6, "[PROTECTED APPS] %s targetNode: %@ Is Local Storage returning YES Host ID: %@", v7, v8, v9, v10, 2u);
}

- (void)hostAppCanNavigateToTargetNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_213670000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
}

- (void)hostAppCanNavigateToFileProviderDomain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_213670000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
}

- (void)hostAppCanNavigateToAppBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_213670000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
}

- (void)hostAppCanSeeFileProviderDomain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_213670000, a1, a3, "[PROTECTED APPS] %s there are no protected apps, returning DOCAppProtectionStatusAllowed", a5, a6, a7, a8, 2u);
}

- (void)bundleIDOfAppContainer:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s 2: provided node is a FPItem: %@", v2, v3, v4, v5, 2u);
}

- (void)bundleIDOfAppContainer:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_213670000, v0, (uint64_t)v0, "[PROTECTED APPS] %s 3: returning bundleID: %@ for FINode: %@", (uint8_t *)v1);
}

- (void)bundleIDOfAppContainer:completion:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s 3: provided node is a FINode: %@", v2, v3, v4, v5, 2u);
}

- (void)bundleIDOfAppContainer:completion:.cold.4()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s 1: provided node: %@", v2, v3, v4, v5, 2u);
}

void __61__DOCAppProtectionManager_bundleIDOfAppContainer_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_14() displayName];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_213670000, v5, v6, "[PROTECTED APPS] %s 1. FINode: (%@) %@ appIdentifier was nil. Falling back to FPItem.", v7, v8, v9, v10, 2u);
}

- (void)bundleIDOfAppContainer_Sync:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s starting to check for bundle ID of node: %@ ", v2, v3, v4, v5, 2u);
}

- (void)appProtectionCacheDidUpdate:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s appCache: %@", v2, v3, v4, v5, 2u);
}

void __55__DOCAppProtectionManager_appProtectionCacheDidUpdate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_213670000, v0, v1, "[PROTECTED APPS] %s posting notification: %@ because appCache did update", v2, v3, v4, v5, 2u);
}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  [(id)OUTLINED_FUNCTION_22() count];
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_213670000, v4, v5, "[PROTECTED APPS] %s posting notification: %@ with: %lu changed apps: %@", v6, v7, v8, v9, 2u);
}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [(id)OUTLINED_FUNCTION_10() count];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18(&dword_213670000, v4, v5, "[PROTECTED APPS] %s prepare to notify that: %lu application(s) changed", v6, v7, v8, v9, 2u);
}

void __101__DOCAppProtectionManager_APSubjectMonitorConformance__appProtectionSubjectsChanged_forSubscription___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end