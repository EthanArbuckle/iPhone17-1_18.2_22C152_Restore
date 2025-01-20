@interface ADServiceManager
+ (BOOL)isReloadServiceNotification:(id)a3;
+ (id)_serviceBundleIDFromServiceReloadNotification:(id)a3;
- (ADServiceManager)init;
- (ADServiceManager)initWithInstanceContext:(id)a3;
- (id)_buildFliteredInfoDictionaryFromBundleURL:(id)a3;
- (id)_bundleServicesCache;
- (id)_bundleServicesCache:(BOOL *)a3;
- (id)_commandMap;
- (id)_generatedBundleServicesCache;
- (id)_pendingServiceReloadNotifications;
- (id)_serviceMap;
- (id)_syncKeyMap;
- (id)allServices;
- (id)allSyncAnchorKeys;
- (id)allVocabSyncInfo;
- (id)controlCenterLockRestrictedCommands;
- (id)firstUnlockRestrictedCommands;
- (id)lockRestrictedCommands;
- (id)serviceForDomain:(id)a3 command:(id)a4;
- (id)serviceForIdentifier:(id)a3;
- (id)serviceForSyncAnchorKey:(id)a3;
- (id)servicesThatRequireBootMaintenance;
- (void)_addService:(id)a3 precedence:(int64_t)a4;
- (void)_addServiceWithRecord:(id)a3;
- (void)_loadServiceFromBundlePath:(id)a3 infoDictionary:(id)a4;
- (void)_loadServicesIfNeeded;
- (void)_reloadServices:(id)a3;
- (void)_removeService:(id)a3;
- (void)_reprioritizeService:(id)a3;
- (void)_writeBundleServicesCache:(id)a3 toPath:(id)a4;
- (void)addService:(id)a3;
- (void)addServiceWithLowPrecedence:(id)a3;
- (void)cancelOperationsForRequest:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)pendServiceReloadNotification:(id)a3;
- (void)preheatBundleServices;
- (void)preheatServicesForDomain:(id)a3;
- (void)reloadServiceForNotification:(id)a3;
- (void)reloadServicesForAllPendingServiceNotifications;
- (void)removeService:(id)a3;
- (void)reprioritizeService:(id)a3;
- (void)setCommandCenterClient:(id)a3;
@end

@implementation ADServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_pendingServiceReloadNotifications, 0);
  objc_storeStrong((id *)&self->_syncKeyMap, 0);
  objc_storeStrong((id *)&self->_commandMap, 0);
  objc_storeStrong((id *)&self->_serviceMap, 0);
}

- (void)_reloadServices:(id)a3
{
  id v4 = a3;
  v5 = AFBundleServicesCachePath();
  char v35 = 0;
  v6 = [(ADServiceManager *)self _bundleServicesCache:&v35];
  id v26 = [v6 mutableCopy];

  if (!v35)
  {
    v24 = v5;
    id v25 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "handle", v24);
          if (v13)
          {
            v14 = +[NSURL fileURLWithPath:v13];
            v15 = [(ADServiceManager *)self _buildFliteredInfoDictionaryFromBundleURL:v14];
            if (v15)
            {
              [v26 setObject:v15 forKey:v13];
              [(ADServiceManager *)self removeService:v12];
              [(ADServiceManager *)self _loadServiceFromBundlePath:v13 infoDictionary:v15];
              char v35 = 1;
            }
            else
            {
              v17 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v37 = "-[ADServiceManager _reloadServices:]";
                __int16 v38 = 2114;
                id v39 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to create bundle dictionary at from bundle path %{public}@", buf, 0x16u);
              }
            }
          }
          else
          {
            v16 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "-[ADServiceManager _reloadServices:]";
              __int16 v38 = 2114;
              id v39 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Unable to reload service (%{public}@), because the service's bundle path wasn't found", buf, 0x16u);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v9);
    }

    v5 = v24;
    id v4 = v25;
    if (v35)
    {
      [(ADServiceManager *)self _writeBundleServicesCache:v26 toPath:v24];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v18 = v7;
      id v19 = [v18 countByEnumeratingWithState:&v27 objects:v42 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)j), "reload", v24);
          }
          id v20 = [v18 countByEnumeratingWithState:&v27 objects:v42 count:16];
        }
        while (v20);
      }

      v23 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[ADServiceManager _reloadServices:]";
        __int16 v38 = 2114;
        id v39 = v18;
        __int16 v40 = 2114;
        v41 = v5;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Done reload the following services: %{public}@\nBundle services cache written to: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)reloadServicesForAllPendingServiceNotifications
{
  v3 = [(ADServiceManager *)self _pendingServiceReloadNotifications];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  v5 = [(ADServiceManager *)self _pendingServiceReloadNotifications];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1000B2C34;
  v11 = &unk_100509A88;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:&v8];

  -[ADServiceManager _reloadServices:](self, "_reloadServices:", v6, v8, v9, v10, v11, v12);
  pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
  self->_pendingServiceReloadNotifications = 0;
}

- (void)reloadServiceForNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[ADServiceManager _serviceBundleIDFromServiceReloadNotification:v4];
    uint64_t v6 = [(NSMutableDictionary *)self->_serviceMap objectForKey:v5];
    id v7 = (void *)v6;
    if (v6)
    {
      uint64_t v14 = v6;
      id v8 = +[NSArray arrayWithObjects:&v14 count:1];
      [(ADServiceManager *)self _reloadServices:v8];
    }
    else
    {
      uint64_t v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        v11 = "-[ADServiceManager reloadServiceForNotification:]";
        __int16 v12 = 2114;
        id v13 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unable to find the service to reload for notification %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)pendServiceReloadNotification:(id)a3
{
  id v4 = a3;
  if (v4
    && +[ADServiceManager isReloadServiceNotification:v4])
  {
    v5 = +[ADServiceManager _serviceBundleIDFromServiceReloadNotification:v4];
    uint64_t v6 = [(ADServiceManager *)self _pendingServiceReloadNotifications];
    unsigned int v7 = [v6 containsObject:v5];

    if (v7)
    {
      id v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315650;
        __int16 v12 = "-[ADServiceManager pendServiceReloadNotification:]";
        __int16 v13 = 2114;
        id v14 = v4;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Service reload notification %{public}@ is already pending for %{public}@, so this one will be ignored", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      int v10 = [(ADServiceManager *)self _pendingServiceReloadNotifications];
      [v10 addObject:v4];
    }
  }
  else
  {
    uint64_t v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315650;
      __int16 v12 = "-[ADServiceManager pendServiceReloadNotification:]";
      __int16 v13 = 2114;
      id v14 = (id)kAFAssistantBundleReloadServiceNotificationSuffix;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Bad notification name for reload service. Expecting format to look like \"<serviceBundleID>%{public}@\". Instead, received \"%{public}@\"", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)cancelOperationsForRequest:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  __int16 v12 = [(NSMutableDictionary *)self->_serviceMap allValues];
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) cancelOperationsForRequestID:v10 forAssistantID:v11 fromRemote:v7 reason:a6];
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)controlCenterLockRestrictedCommands
{
  v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(ADServiceManager *)self allServices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) controlCenterLockRestrictedCommands];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)preheatBundleServices
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSMutableDictionary *)self->_serviceMap allValues];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 preheatDomain:0];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)preheatServicesForDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ADServiceManager *)self _commandMap];
    id v6 = [v5 objectForKeyedSubscript:v4];

    uint64_t v7 = [v6 allValues];
    long long v8 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v13), "object", (void)v16);
          uint64_t v15 = [v14 service];

          if (([v8 containsObject:v15] & 1) == 0)
          {
            [v15 preheatDomain:v4];
            [v8 addObject:v15];
          }

          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)setCommandCenterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(ADServiceManager *)self serviceForIdentifier:@"ADExtensionServiceIdentifier"];
  [v5 setCommandCenterClient:v4];
}

- (id)lockRestrictedCommands
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(ADServiceManager *)self allServices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) lockRestrictedCommands];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)firstUnlockRestrictedCommands
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(ADServiceManager *)self allServices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) firstUnlockRestrictedCommands];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allVocabSyncInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ADServiceManager *)self serviceForIdentifier:@"com.apple.siri.SynapseSyncPlugin"];
  id v5 = [v4 customVocabSyncInfo];
  id v6 = +[ADSyncSnapshot sharedInstance];
  [v6 pruneCacheWithCurrentSynapseInfo:v5];

  [v3 addEntriesFromDictionary:v5];
  return v3;
}

- (id)allSyncAnchorKeys
{
  v2 = [(ADServiceManager *)self _syncKeyMap];
  id v3 = [v2 allKeys];

  return v3;
}

- (void)reprioritizeService:(id)a3
{
}

- (void)removeService:(id)a3
{
}

- (void)addServiceWithLowPrecedence:(id)a3
{
}

- (void)addService:(id)a3
{
}

- (id)serviceForSyncAnchorKey:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(ADServiceManager *)self _syncKeyMap],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6)
    && (![v4 isEqualToString:@"com.apple.siri.vocabularyupdates"]
     || ([(ADServiceManager *)self serviceForIdentifier:@"com.apple.siri.SynapseSyncPlugin"], (id v6 = objc_claimAutoreleasedReturnValue()) == 0)))
  {
    id v9 = 0;
    goto LABEL_19;
  }
  id v7 = v4;
  if (qword_100586220 != -1) {
    dispatch_once(&qword_100586220, &stru_10050B1C8);
  }
  unsigned int v8 = [(id)qword_100586218 containsObject:v7];

  if (v8)
  {
    id v9 = [(ADServiceManager *)self serviceForIdentifier:@"com.apple.siri.sync.DisabledSyncDataToBeDeleted"];

    id v10 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    int v17 = 136315650;
    long long v18 = "-[ADServiceManager serviceForSyncAnchorKey:]";
    __int16 v19 = 2112;
    long long v20 = v9;
    __int16 v21 = 2112;
    id v22 = v7;
    long long v11 = "%s Substituted to service:%@ for anchor:%@";
    goto LABEL_8;
  }
  long long v12 = +[AFPreferences sharedPreferences];
  unsigned __int8 v13 = [v12 assistantIsEnabled];

  if (v13) {
    goto LABEL_18;
  }
  id v14 = v7;
  if (qword_100586230 != -1) {
    dispatch_once(&qword_100586230, &stru_10050B1E8);
  }
  unsigned int v15 = [(id)qword_100586228 containsObject:v14];

  if (!v15)
  {
LABEL_18:
    id v9 = v6;
  }
  else
  {
    id v9 = [(ADServiceManager *)self serviceForIdentifier:@"com.apple.siri.sync.DisabledSyncDataToBeDeleted"];

    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315650;
      long long v18 = "-[ADServiceManager serviceForSyncAnchorKey:]";
      __int16 v19 = 2112;
      long long v20 = v9;
      __int16 v21 = 2112;
      id v22 = v14;
      long long v11 = "%s Substituting %@ service for %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 0x20u);
    }
  }
LABEL_19:

  return v9;
}

- (id)serviceForDomain:(id)a3 command:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(ADServiceManager *)self _commandMap];
  id v9 = [v8 objectForKey:v6];

  id v10 = [v9 objectForKey:v7];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [v9 objectForKey:v6];
  }
  long long v12 = v11;

  unsigned __int8 v13 = [v12 object];
  id v14 = [v13 service];

  return v14;
}

- (id)serviceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ADServiceManager *)self _serviceMap];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)servicesThatRequireBootMaintenance
{
  v2 = [(ADServiceManager *)self _serviceMap];
  id v3 = [v2 allValues];

  id v4 = [v3 indexesOfObjectsPassingTest:&stru_100500BA8];
  id v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

- (id)allServices
{
  v2 = [(ADServiceManager *)self _serviceMap];
  id v3 = [v2 allValues];

  return v3;
}

- (id)_pendingServiceReloadNotifications
{
  pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
  if (!pendingServiceReloadNotifications)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_pendingServiceReloadNotifications;
    self->_pendingServiceReloadNotifications = v4;

    pendingServiceReloadNotifications = self->_pendingServiceReloadNotifications;
  }
  return pendingServiceReloadNotifications;
}

- (id)_syncKeyMap
{
  [(ADServiceManager *)self _loadServicesIfNeeded];
  syncKeyMap = self->_syncKeyMap;
  return syncKeyMap;
}

- (id)_commandMap
{
  [(ADServiceManager *)self _loadServicesIfNeeded];
  commandMap = self->_commandMap;
  return commandMap;
}

- (id)_serviceMap
{
  [(ADServiceManager *)self _loadServicesIfNeeded];
  serviceMap = self->_serviceMap;
  return serviceMap;
}

- (void)_loadServicesIfNeeded
{
  if (!self->_bundleServicesLoaded)
  {
    id v3 = [(ADServiceManager *)self _bundleServicesCache];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B3F4C;
    v4[3] = &unk_100504E58;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];

    self->_bundleServicesLoaded = 1;
  }
}

- (void)_loadServiceFromBundlePath:(id)a3 infoDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (objc_class *)objc_opt_class();
  id v9 = [v6 objectForKey:kCFBundleIdentifierKey];
  if ([v9 isEqual:@"com.apple.siri.SynapseSyncPlugin"]) {
    unsigned int v8 = (objc_class *)objc_opt_class();
  }
  id v10 = [[v8 alloc] initWithBundlePath:v7 infoDictionary:v6 instanceContext:self->_instanceContext];

  [(ADServiceManager *)self _addService:v10 precedence:1];
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    unsigned __int8 v13 = "-[ADServiceManager _loadServiceFromBundlePath:infoDictionary:]";
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Service loaded: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (id)_bundleServicesCache
{
  char v4 = 0;
  v2 = [(ADServiceManager *)self _bundleServicesCache:&v4];
  return v2;
}

- (id)_bundleServicesCache:(BOOL *)a3
{
  id v5 = AFBundleServicesCachePath();
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v5];
  id v7 = AFBuildVersion();
  unsigned int v8 = [v6 objectForKey:@"Build"];
  if ([v7 isEqualToString:v8])
  {
    if (v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      int v12 = "-[ADServiceManager _bundleServicesCache:]";
      __int16 v13 = 2112;
      __int16 v14 = v7;
      __int16 v15 = 2112;
      long long v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s regenerating bundle service cache due to version mismatch %@ %@", (uint8_t *)&v11, 0x20u);
    }
  }
  id v6 = [(ADServiceManager *)self _generatedBundleServicesCache];
  [(ADServiceManager *)self _writeBundleServicesCache:v6 toPath:v5];
  *a3 = 1;
LABEL_8:
  [v6 removeObjectForKey:@"Build"];

  return v6;
}

- (void)_writeBundleServicesCache:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v15 = 0;
  id v7 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v14 = v8;
    unsigned __int8 v10 = [v7 writeToFile:v6 options:1 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      int v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v17 = "-[ADServiceManager _writeBundleServicesCache:toPath:]";
        __int16 v18 = 2114;
        id v19 = v6;
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Can't write to %{public}@: %{public}@", buf, 0x20u);
      }
    }
    id v9 = v11;
  }
  else
  {
    __int16 v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "-[ADServiceManager _writeBundleServicesCache:toPath:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Can't serialize %@: %{public}@", buf, 0x20u);
    }
  }
}

- (id)_generatedBundleServicesCache
{
  id v3 = +[NSFileManager defaultManager];
  char v4 = AFServicePluginsURL();
  id v5 = +[NSArray array];
  id v23 = 0;
  id v6 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v5 options:0 error:&v23];
  id v18 = v23;

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);
  id v8 = AFBuildVersion();
  if (v8) {
    [v7 setObject:v8 forKey:@"Build"];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [(ADServiceManager *)self _buildFliteredInfoDictionaryFromBundleURL:v14];
        if (v15)
        {
          long long v16 = [v14 path];
          [v7 setObject:v15 forKey:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)_buildFliteredInfoDictionaryFromBundleURL:(id)a3
{
  id v3 = a3;
  char v4 = +[ADBundleService requiredInfoDictionaryKeys];
  id v5 = [v4 count];
  id v6 = [v3 pathExtension];
  unsigned int v7 = [v6 isEqualToString:@"assistantBundle"];

  if (v7)
  {
    id v8 = [objc_alloc((Class)NSBundle) initWithURL:v3];
    uint64_t v9 = [v8 bundlePath];
    id v10 = (void *)v9;
    if (v9)
    {
      long long v22 = (void *)v9;
      id v23 = v8;
      id v11 = [v8 infoDictionary];
      id v12 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v5];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v4;
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            long long v19 = [v11 objectForKeyedSubscript:v18];
            [v12 setValue:v19 forKey:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      id v10 = v22;
      id v8 = v23;
    }
    else
    {
      long long v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v30 = "-[ADServiceManager _buildFliteredInfoDictionaryFromBundleURL:]";
        __int16 v31 = 2114;
        id v32 = v3;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Couldn't create bundle at URL %{public}@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_reprioritizeService:(id)a3
{
  id v3 = a3;
  char v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[ADServiceManager _reprioritizeService:]";
    __int16 v43 = 2112;
    id v44 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [v3 domains];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v5;
        uint64_t v6 = *(void *)(*((void *)&v35 + 1) + 8 * v5);
        unsigned int v7 = [v3 commandsForDomain:v6];
        long long v30 = [(NSMutableDictionary *)self->_commandMap objectForKey:v6];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v28 = v7;
        id v8 = [v28 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v29 = *(void *)v32;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v32 != v29) {
                objc_enumerationMutation(v28);
              }
              uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              id v12 = [v30 objectForKey:v11];
              id v13 = v12;
              while (1)
              {
                id v14 = [v13 object];
                id v15 = [v14 precedence];
                uint64_t v16 = [v12 object];
                id v17 = [v16 precedence];

                if (v15 != v17)
                {
                  id v18 = v12;

                  id v13 = v18;
                }
                long long v19 = [v12 object];
                id v20 = [v19 service];

                if (v20 == v3) {
                  break;
                }
                uint64_t v21 = [v12 nextItem];

                id v12 = (id)v21;
                if (!v21) {
                  goto LABEL_23;
                }
              }
              if (v12 == v13)
              {
                id v13 = v12;
              }
              else
              {
                [v12 removeFromList];
                [v12 insertBeforeItem:v13];
                long long v22 = [v12 previousItem];

                if (!v22) {
                  [v30 setObject:v12 forKey:v11];
                }
              }
LABEL_23:
            }
            id v9 = [v28 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v26);
  }
}

- (void)_removeService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[ADServiceManager _removeService:]";
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  serviceMap = self->_serviceMap;
  unsigned int v7 = [v4 identifier];
  [(NSMutableDictionary *)serviceMap removeObjectForKey:v7];

  [v4 domains];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v34 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v46;
    long long v33 = self;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v8;
        uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * v8);
        id v10 = [v4 commandsForDomain:v9];
        uint64_t v35 = v9;
        uint64_t v11 = [(NSMutableDictionary *)self->_commandMap objectForKey:v9];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v42;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              id v18 = [v11 objectForKey:v17];
              while (1)
              {
                long long v19 = [v18 object];
                id v20 = [v19 service];

                if (v20 == v4) {
                  break;
                }
                uint64_t v21 = [v18 nextItem];

                id v18 = (void *)v21;
                if (!v21) {
                  goto LABEL_22;
                }
              }
              long long v22 = [v18 previousItem];
              id v23 = [v18 nextItem];
              [v18 removeFromList];
              if (!v22)
              {
                if (v23) {
                  [v11 setObject:v23 forKey:v17];
                }
                else {
                  [v11 removeObjectForKey:v17];
                }
              }

LABEL_22:
              ;
            }
            id v14 = [v12 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v14);
        }

        self = v33;
        if (![v11 count]) {
          [(NSMutableDictionary *)v33->_commandMap removeObjectForKey:v35];
        }

        uint64_t v8 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v34);
  }
  uint64_t v24 = [v4 syncKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
        id v30 = [(NSMutableDictionary *)self->_syncKeyMap objectForKey:v29];

        if (v30 == v4) {
          [(NSMutableDictionary *)self->_syncKeyMap removeObjectForKey:v29];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v26);
  }
}

- (void)_addService:(id)a3 precedence:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [[ADServiceRecord alloc] initWithService:v6 precedence:a4];

  [(ADServiceManager *)self _addServiceWithRecord:v7];
}

- (void)_addServiceWithRecord:(id)a3
{
  id v5 = a3;
  id v6 = [v5 service];
  unsigned int v7 = [v6 identifier];
  if (v7)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_serviceMap objectForKey:v7];

    if (v8)
    {
      uint64_t v32 = +[NSAssertionHandler currentHandler];
      [v32 handleFailureInMethod:a2, self, @"ADServiceManager.m", 93, @"Shouldn't already have a service with identifier %@", v7 object file lineNumber description];
    }
    long long v33 = v7;
    [(NSMutableDictionary *)self->_serviceMap setObject:v6 forKey:v7];
    [v6 domains];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v38)
    {
      uint64_t v35 = *(void *)v52;
      uint64_t v36 = self;
      long long v37 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v9;
          uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v9);
          uint64_t v11 = [v6 commandsForDomain:v10];
          id v12 = [(NSMutableDictionary *)self->_commandMap objectForKey:v10];
          id v13 = [v12 mutableCopy];

          if (!v13)
          {
            id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v11, "count"));
            [(NSMutableDictionary *)self->_commandMap setObject:v13 forKey:v10];
          }
          uint64_t v39 = v10;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v41 = v11;
          id v14 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v42 = *(void *)v48;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v48 != v42) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                id v18 = [objc_alloc((Class)AFLinkedListItem) initWithObject:v5];
                long long v19 = [v13 objectForKey:v17];
                id v20 = [v19 object];
                unsigned __int8 v21 = [v5 hasEqualOrHigherPrecedenceThanServiceRecord:v20];

                if (v21)
                {
                  id v22 = 0;
                }
                else
                {
                  id v23 = 0;
                  do
                  {
                    id v22 = v19;

                    long long v19 = [v22 nextItem];

                    uint64_t v24 = [v19 object];
                    unsigned __int8 v25 = [v5 hasEqualOrHigherPrecedenceThanServiceRecord:v24];

                    id v23 = v22;
                  }
                  while ((v25 & 1) == 0);
                }
                if (v19) {
                  [v18 insertBeforeItem:v19];
                }
                else {
                  [v18 insertAfterItem:v22];
                }
                id v26 = [v18 previousItem];

                if (!v26) {
                  [v13 setObject:v18 forKey:v17];
                }
              }
              id v15 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v15);
          }

          self = v36;
          [(NSMutableDictionary *)v36->_commandMap setObject:v13 forKey:v39];

          uint64_t v9 = v40 + 1;
          id v6 = v37;
        }
        while ((id)(v40 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v38);
    }
    uint64_t v27 = [v6 syncKeys];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
    unsigned int v7 = v33;
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v44;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v27);
          }
          [(NSMutableDictionary *)self->_syncKeyMap setObject:v6 forKey:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
        }
        id v29 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v29);
    }
  }
}

- (ADServiceManager)init
{
  id v3 = +[AFInstanceContext defaultContext];
  id v4 = [(ADServiceManager *)self initWithInstanceContext:v3];

  return v4;
}

- (ADServiceManager)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADServiceManager;
  id v5 = [(ADServiceManager *)&v15 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    serviceMap = v5->_serviceMap;
    v5->_serviceMap = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandMap = v5->_commandMap;
    v5->_commandMap = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    syncKeyMap = v5->_syncKeyMap;
    v5->_syncKeyMap = v10;

    if (v4)
    {
      id v12 = (AFInstanceContext *)v4;
    }
    else
    {
      id v12 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v12;
  }
  return v5;
}

+ (id)_serviceBundleIDFromServiceReloadNotification:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (+[ADServiceManager isReloadServiceNotification:v3])
  {
    id v5 = [v3 length];
    uint64_t v6 = v5 - (unsigned char *)[kAFAssistantBundleReloadServiceNotificationSuffix length];
    id v4 = v3;
    if (v6 >= 1)
    {
      id v4 = objc_msgSend(v3, "substringToIndex:");
    }
  }

  return v4;
}

+ (BOOL)isReloadServiceNotification:(id)a3
{
  return [a3 hasSuffix:kAFAssistantBundleReloadServiceNotificationSuffix];
}

@end