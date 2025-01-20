@interface CALNNotificationIconUpdater
- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider;
- (CALNIconCache)iconCache;
- (CALNIconIdentifierVersionProvider)identifierVersionProvider;
- (CALNNotificationIconUpdater)initWithIconIdentifierVersionProvider:(id)a3 protectedNotificationStorage:(id)a4 iconCache:(id)a5 iconIdentifierProvider:(id)a6 notificationManager:(id)a7;
- (CALNNotificationManager)notificationManager;
- (CALNNotificationStorage)protectedStorage;
- (void)_updateAllIconIdentifiersInStorage:(id)a3;
- (void)updateIconsToNewVersionIfNeeded;
@end

@implementation CALNNotificationIconUpdater

- (CALNNotificationIconUpdater)initWithIconIdentifierVersionProvider:(id)a3 protectedNotificationStorage:(id)a4 iconCache:(id)a5 iconIdentifierProvider:(id)a6 notificationManager:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNNotificationIconUpdater;
  v17 = [(CALNNotificationIconUpdater *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifierVersionProvider, a3);
    objc_storeStrong((id *)&v18->_protectedStorage, a4);
    objc_storeStrong((id *)&v18->_iconCache, a5);
    objc_storeStrong((id *)&v18->_iconIdentifierProvider, a6);
    objc_storeStrong((id *)&v18->_notificationManager, a7);
  }

  return v18;
}

- (void)updateIconsToNewVersionIfNeeded
{
  v3 = [(CALNNotificationIconUpdater *)self identifierVersionProvider];
  uint64_t v4 = [v3 iconIdentifierVersion];
  v5 = [(CALNNotificationIconUpdater *)self identifierVersionProvider];
  uint64_t v6 = [v5 iconVersionToUpgradeTo];

  if (v4 < v6)
  {
    v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v7, OS_LOG_TYPE_DEFAULT, "IconUpdater: IconIdentifierVersion out of date, updating all icon identifiers in storage first.", buf, 2u);
    }

    [(CALNNotificationIconUpdater *)self _updateAllIconIdentifiersInStorage:self->_protectedStorage];
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v8, OS_LOG_TYPE_DEFAULT, "IconUpdater: Wiping icon cache directory to get rid of out dated icon files", buf, 2u);
    }

    v9 = [(CALNNotificationIconUpdater *)self iconCache];
    [v9 forceRemoveAllCachedIconsWithError:0];

    v10 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "IconUpdater: Regenerating icon files that are still in use in protectedStorage", buf, 2u);
    }

    v11 = [MEMORY[0x263EFF9C0] set];
    v12 = [(CALNNotificationIconUpdater *)self protectedStorage];
    id v13 = [v12 notificationRecords];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __62__CALNNotificationIconUpdater_updateIconsToNewVersionIfNeeded__block_invoke;
    v21[3] = &unk_2645C0FF8;
    id v14 = v11;
    id v22 = v14;
    [v13 enumerateObjectsUsingBlock:v21];

    id v15 = [(CALNNotificationIconUpdater *)self iconCache];
    id v16 = [v14 allObjects];
    [v15 addIconsWithIdentifiers:v16 error:0];

    v17 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "IconUpdater: icon update complete, setting icon version to current version", buf, 2u);
    }

    v18 = [(CALNNotificationIconUpdater *)self identifierVersionProvider];
    uint64_t v19 = [v18 iconVersionToUpgradeTo];
    id v20 = [(CALNNotificationIconUpdater *)self identifierVersionProvider];
    [v20 setIconIdentifierVersion:v19];
  }
}

void __62__CALNNotificationIconUpdater_updateIconsToNewVersionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 content];
  uint64_t v4 = [v3 iconIdentifier];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v8 content];
    v7 = [v6 iconIdentifier];
    [v5 addObject:v7];
  }
}

- (void)_updateAllIconIdentifiersInStorage:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 notificationRecords];
  v26 = [MEMORY[0x263EFF8F0] currentCalendar];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v27 = *(void *)v29;
    *(void *)&long long v6 = 138543618;
    long long v24 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "content", v24);
        v11 = (void *)[v10 mutableCopy];

        v12 = [v11 iconIdentifier];

        if (v12)
        {
          id v13 = [(CALNNotificationIconUpdater *)self iconIdentifierProvider];
          id v14 = [v9 content];
          id v15 = [v14 date];
          id v16 = [v13 identifierForIconWithDate:v15 inCalendar:v26];
          [v11 setIconIdentifier:v16];
        }
        v17 = (void *)[v9 mutableCopy];
        [v17 setContent:v11];
        v18 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v9 content];
          id v20 = [v19 iconIdentifier];
          objc_super v21 = [v17 content];
          id v22 = [v21 iconIdentifier];
          *(_DWORD *)buf = v24;
          v33 = v20;
          __int16 v34 = 2114;
          v35 = v22;
          _os_log_impl(&dword_2216BB000, v18, OS_LOG_TYPE_DEFAULT, "IconUpdater: Updating iconIdentifiers in each notification storage entry, oldIdentifier:[%{public}@], newIdentifier:[%{public}@]", buf, 0x16u);
        }
        v23 = [(CALNNotificationIconUpdater *)self notificationManager];
        [v23 updateRecord:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v7);
  }
}

- (CALNIconIdentifierVersionProvider)identifierVersionProvider
{
  return self->_identifierVersionProvider;
}

- (CALNNotificationStorage)protectedStorage
{
  return self->_protectedStorage;
}

- (CALNIconCache)iconCache
{
  return self->_iconCache;
}

- (CALNCalendarIconIdentifierProvider)iconIdentifierProvider
{
  return self->_iconIdentifierProvider;
}

- (CALNNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_iconIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_protectedStorage, 0);
  objc_storeStrong((id *)&self->_identifierVersionProvider, 0);
}

@end