@interface ADBundleService
+ (id)requiredInfoDictionaryKeys;
- (ADBundleService)initWithBundlePath:(id)a3 infoDictionary:(id)a4 instanceContext:(id)a5;
- (BOOL)_isValidRestrictionsDomainInfo:(id)a3;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_connection;
- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)handle;
- (id)lockRestrictedCommands;
- (id)syncKeys;
- (void)_parseInfoDictionary:(id)a3;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
- (void)clearDomainObjects;
- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4;
- (void)getInfoWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
- (void)reload;
- (void)resetExternalResources;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)serviceConnectionTimedoutForSync;
@end

@implementation ADBundleService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lockRestrictedCommands, 0);
  objc_storeStrong((id *)&self->_maintenanceClassName, 0);
  objc_storeStrong((id *)&self->_clearsDomainObjectsClassName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_syncKeys, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

- (void)serviceConnectionTimedoutForSync
{
  id v3 = [(ADService *)self delegate];
  [v3 serviceTimedoutForSync:self];
}

- (void)reload
{
  id v3 = [(ADBundleService *)self _connection];
  [v3 reloadServiceBundleAtPath:self->_path];
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(ADBundleService *)self _connection];
  v5 = v4;
  if (v4)
  {
    [v4 runMaintenanceWorkWithCompletion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)getInfoWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002E07E8;
  v5[3] = &unk_10050D300;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)ADBundleService;
  id v3 = v7;
  [(ADService *)&v4 getInfoWithCompletion:v5];
}

- (void)resetExternalResources
{
  if ((AFIsNano() & 1) == 0)
  {
    objc_initWeak(&location, self);
    group = self->_group;
    objc_super v4 = +[ADCommandCenter sharedQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1002E09C4;
    v5[3] = &unk_10050B790;
    objc_copyWeak(&v6, &location);
    dispatch_group_notify(group, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(ADBundleService *)self _connection];
    [v8 sendFetchSyncSnapshotForInfo:v7 completion:v6];
  }
}

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADBundleService *)self _connection];
  [v8 setDelegate:self];

  v9 = [(ADBundleService *)self _connection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002E0BD8;
  v13[3] = &unk_10050AF68;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002E0BF8;
  v11[3] = &unk_10050D440;
  id v12 = v14;
  id v10 = v14;
  [v9 sendBeginSyncWithInfo:v7 chunkHandler:v13 completion:v11];
}

- (void)clearDomainObjects
{
  if (self->_clearsDomainObjectsClassName)
  {
    if (self->_connection)
    {
      id v5 = [(ADBundleService *)self _connection];
      [v5 sendClearDomainObjects];
    }
    else
    {
      id v3 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315394;
        id v7 = "-[ADBundleService clearDomainObjects]";
        __int16 v8 = 2112;
        v9 = path;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Deferring context clearing until we have a valid connection for %@", buf, 0x16u);
      }
      self->_connectionNeedsContextCleared = 1;
    }
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ADBundleService *)self _connection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = +[ADCommandCenter sharedCommandCenter];
    v16 = [(ADBundleService *)self _informCommandCenter:v15 willPerformLaunchApp:v10];

    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v16 = 0;
  if (v14)
  {
LABEL_5:
    dispatch_group_enter((dispatch_group_t)self->_group);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002E0EEC;
    v17[3] = &unk_10050AF40;
    v17[4] = self;
    id v18 = v13;
    id v19 = v16;
    [v14 sendClientBoundCommand:v10 domain:v11 executionContext:v12 reply:v17];
  }
LABEL_6:
}

- (void)preheatDomain:(id)a3
{
  id v3 = [(ADBundleService *)self _connection];
  [v3 preheatServiceBundle];
}

- (id)syncKeys
{
  return [(NSDictionary *)self->_syncKeys allKeys];
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  domains = self->_domains;
  id v6 = a3;
  id v7 = [(NSDictionary *)domains objectForKey:a4];
  __int16 v8 = [v7 objectForKey:v6];

  return v8 != 0;
}

- (id)commandsForDomain:(id)a3
{
  id v3 = [(NSDictionary *)self->_domains objectForKey:a3];
  objc_super v4 = [v3 allKeys];

  return v4;
}

- (id)domains
{
  return [(NSDictionary *)self->_domains allKeys];
}

- (id)handle
{
  return self->_path;
}

- (ADBundleService)initWithBundlePath:(id)a3 infoDictionary:(id)a4 instanceContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADBundleService;
  id v11 = [(ADBundleService *)&v19 init];
  if (v11)
  {
    id v12 = (NSString *)[v8 copy];
    path = v11->_path;
    v11->_path = v12;

    id v14 = [v9 objectForKey:kCFBundleIdentifierKey];
    v15 = v10;
    if (!v10)
    {
      v15 = +[AFInstanceContext defaultContext];
    }
    objc_storeStrong((id *)&v11->_instanceContext, v15);
    if (!v10) {

    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ADService *)v11 setIdentifier:v14];
    }
    [(ADBundleService *)v11 _parseInfoDictionary:v9];
    dispatch_group_t v16 = dispatch_group_create();
    group = v11->_group;
    v11->_group = (OS_dispatch_group *)v16;
  }
  return v11;
}

- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4
{
  id v5 = a3;
  id v6 = [a4 launchId];
  [v5 willProcessAppLaunchWithBundleIdentifier:v6];
  objc_initWeak(&location, v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002E1318;
  v10[3] = &unk_10050AF18;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_retainBlock(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

- (id)_connection
{
  if (!self->_connection)
  {
    v15 = [ADServiceConnection alloc];
    id v3 = [(ADService *)self identifier];
    path = self->_path;
    domains = self->_domains;
    syncKeys = self->_syncKeys;
    clearsDomainObjectsClassName = self->_clearsDomainObjectsClassName;
    maintenanceClassName = self->_maintenanceClassName;
    instanceContext = self->_instanceContext;
    id v10 = +[ADCommandCenter sharedQueue];
    id v11 = [(ADServiceConnection *)v15 initWithIdentifier:v3 path:path commandMap:domains anchorMap:syncKeys clearingClass:clearsDomainObjectsClassName maintenanceClass:maintenanceClassName instanceContext:instanceContext queue:v10];
    connection = self->_connection;
    self->_connection = v11;

    if (self->_connectionNeedsContextCleared)
    {
      self->_connectionNeedsContextCleared = 0;
      [(ADServiceConnection *)self->_connection sendClearDomainObjects];
    }
  }
  id v13 = self->_connection;
  return v13;
}

- (BOOL)_isValidRestrictionsDomainInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v22;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [v4 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
LABEL_22:

            BOOL v14 = 0;
            goto LABEL_24;
          }
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v9 = v9;
          id v10 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v18;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(void *)v18 != v12) {
                  objc_enumerationMutation(v9);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_22;
                }
              }
              id v11 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v16;
        }
        id v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
        BOOL v14 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
LABEL_24:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_parseInfoDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"AssistantDomains"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = 0;
    if (v5) {
      goto LABEL_26;
    }
LABEL_29:
    if (v16)
    {
      long long v20 = (NSDictionary *)[v16 copy];
      domains = self->_domains;
      self->_domains = v20;
    }
    goto LABEL_31;
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v105 objects:v118 count:16];
  if (!v7)
  {
LABEL_20:

    id v16 = v6;
    if (v5) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  uint64_t v8 = *(void *)v106;
  uint64_t v82 = *(void *)v106;
LABEL_4:
  id v9 = 0;
  id v83 = v7;
  while (1)
  {
    if (*(void *)v106 != v8) {
      objc_enumerationMutation(v6);
    }
    objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v105 + 1) + 8 * (void)v9), v82);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v10 = v10;
    id v11 = [v10 countByEnumeratingWithState:&v101 objects:v117 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v102;
      id v84 = v4;
      v85 = self;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v102 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [v10 objectForKey:*(void *)(*((void *)&v101 + 1) + 8 * i)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            id v4 = v84;
            self = v85;
            goto LABEL_25;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v101 objects:v117 count:16];
        id v4 = v84;
        self = v85;
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v9 = (char *)v9 + 1;
    uint64_t v8 = v82;
    if (v9 == v83)
    {
      id v7 = [v6 countByEnumeratingWithState:&v105 objects:v118 count:16];
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
LABEL_25:

  id v16 = 0;
  if (!v5) {
    goto LABEL_29;
  }
LABEL_26:
  if (v16) {
    goto LABEL_29;
  }
  long long v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    long long v18 = v17;
    long long v19 = [(ADService *)self identifier];
    *(_DWORD *)buf = 136315650;
    v112 = "-[ADBundleService _parseInfoDictionary:]";
    __int16 v113 = 2114;
    CFStringRef v114 = @"AssistantDomains";
    __int16 v115 = 2114;
    v116 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
  }
LABEL_31:

  long long v22 = [v4 objectForKey:@"AssistantFirstUnlockRestrictedDomains"];
  if (v22)
  {
    if ([(ADBundleService *)self _isValidRestrictionsDomainInfo:v22])
    {
      id v23 = v22;
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_1002E2504;
      v99[3] = &unk_10050AEF0;
      id v100 = objc_alloc_init((Class)NSMutableArray);
      id v24 = v100;
      [v23 enumerateKeysAndObjectsUsingBlock:v99];

      [(ADService *)self setFirstUnlockRestrictedCommands:v24];
    }
    else
    {
      v25 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v76 = v25;
        v77 = [(ADService *)self identifier];
        *(_DWORD *)buf = 136315650;
        v112 = "-[ADBundleService _parseInfoDictionary:]";
        __int16 v113 = 2114;
        CFStringRef v114 = @"AssistantFirstUnlockRestrictedDomains";
        __int16 v115 = 2114;
        v116 = v77;
        _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
      }
    }
  }

  v26 = [v4 objectForKey:@"AssistantLockRestrictedDomains"];
  if (v26)
  {
    if ([(ADBundleService *)self _isValidRestrictionsDomainInfo:v26])
    {
      id v27 = v26;
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_1002E2648;
      v97[3] = &unk_10050AEF0;
      id v98 = objc_alloc_init((Class)NSMutableArray);
      id v28 = v98;
      [v27 enumerateKeysAndObjectsUsingBlock:v97];

      v29 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v28];
      lockRestrictedCommands = self->_lockRestrictedCommands;
      self->_lockRestrictedCommands = v29;
    }
    else
    {
      v31 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v78 = v31;
        v79 = [(ADService *)self identifier];
        *(_DWORD *)buf = 136315650;
        v112 = "-[ADBundleService _parseInfoDictionary:]";
        __int16 v113 = 2114;
        CFStringRef v114 = @"AssistantLockRestrictedDomains";
        __int16 v115 = 2114;
        v116 = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
      }
    }
  }

  v32 = [v4 objectForKey:@"AssistantControlCenterLockRestrictedDomains"];
  if (v32)
  {
    if ([(ADBundleService *)self _isValidRestrictionsDomainInfo:v32])
    {
      id v33 = v32;
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_1002E278C;
      v95[3] = &unk_10050AEF0;
      id v96 = objc_alloc_init((Class)NSMutableArray);
      id v34 = v96;
      [v33 enumerateKeysAndObjectsUsingBlock:v95];

      [(ADService *)self setControlCenterLockRestrictedCommands:v34];
    }
    else
    {
      v35 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v80 = v35;
        v81 = [(ADService *)self identifier];
        *(_DWORD *)buf = 136315650;
        v112 = "-[ADBundleService _parseInfoDictionary:]";
        __int16 v113 = 2114;
        CFStringRef v114 = @"AssistantControlCenterLockRestrictedDomains";
        __int16 v115 = 2114;
        v116 = v81;
        _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
      }
    }
  }

  v36 = [v4 objectForKey:@"AssistantManagedStorageDomains"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v37 = v36;
    v38 = (char *)[v37 countByEnumeratingWithState:&v91 objects:v110 count:16];
    if (v38)
    {
      v39 = v38;
      uint64_t v40 = *(void *)v92;
      while (2)
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(void *)v92 != v40) {
            objc_enumerationMutation(v37);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v42 = 0;
            goto LABEL_59;
          }
        }
        v39 = (char *)[v37 countByEnumeratingWithState:&v91 objects:v110 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    id v42 = v37;
LABEL_59:
    if (!v36) {
      goto LABEL_63;
    }
  }
  else
  {
    id v42 = 0;
    if (!v36) {
      goto LABEL_63;
    }
  }
  if (!v42)
  {
    v43 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v44 = v43;
      v45 = [(ADService *)self identifier];
      *(_DWORD *)buf = 136315650;
      v112 = "-[ADBundleService _parseInfoDictionary:]";
      __int16 v113 = 2114;
      CFStringRef v114 = @"AssistantManagedStorageDomains";
      __int16 v115 = 2114;
      v116 = v45;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
    }
    goto LABEL_65;
  }
LABEL_63:
  if (v42)
  {
    id v46 = [objc_alloc((Class)NSSet) initWithArray:v42];
    [(ADService *)self setManagedStorageDomains:v46];
  }
LABEL_65:

  v47 = [v4 objectForKey:@"AssistantSyncAnchorKeys"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = self;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v48 = v47;
    id v49 = [v48 countByEnumeratingWithState:&v87 objects:v109 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v88;
      while (2)
      {
        for (k = 0; k != v50; k = (char *)k + 1)
        {
          if (*(void *)v88 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [v48 objectForKey:*(void *)(*((void *)&v87 + 1) + 8 * (void)k)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            id v54 = 0;
            goto LABEL_79;
          }
        }
        id v50 = [v48 countByEnumeratingWithState:&v87 objects:v109 count:16];
        if (v50) {
          continue;
        }
        break;
      }
    }

    id v54 = v48;
LABEL_79:
    self = v86;
    if (!v47) {
      goto LABEL_83;
    }
  }
  else
  {
    id v54 = 0;
    if (!v47) {
      goto LABEL_83;
    }
  }
  if (!v54)
  {
    v55 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v56 = v55;
      v57 = [(ADService *)self identifier];
      *(_DWORD *)buf = 136315650;
      v112 = "-[ADBundleService _parseInfoDictionary:]";
      __int16 v113 = 2114;
      CFStringRef v114 = @"AssistantSyncAnchorKeys";
      __int16 v115 = 2114;
      v116 = v57;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
    }
    goto LABEL_85;
  }
LABEL_83:
  if (v54)
  {
    v58 = (NSDictionary *)[v54 copy];
    syncKeys = self->_syncKeys;
    self->_syncKeys = v58;
  }
LABEL_85:

  v60 = [v4 objectForKey:@"AssistantClearsDomainObjects"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v60;
    if (!v60)
    {
LABEL_92:
      if (v61)
      {
        v65 = (NSString *)[v61 copy];
        clearsDomainObjectsClassName = self->_clearsDomainObjectsClassName;
        self->_clearsDomainObjectsClassName = v65;
      }
      goto LABEL_94;
    }
  }
  else
  {
    id v61 = 0;
    if (!v60) {
      goto LABEL_92;
    }
  }
  if (v61) {
    goto LABEL_92;
  }
  v62 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v63 = v62;
    v64 = [(ADService *)self identifier];
    *(_DWORD *)buf = 136315650;
    v112 = "-[ADBundleService _parseInfoDictionary:]";
    __int16 v113 = 2114;
    CFStringRef v114 = @"AssistantClearsDomainObjects";
    __int16 v115 = 2114;
    v116 = v64;
    _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
  }
LABEL_94:

  v67 = [v4 objectForKey:@"AssistantMaintenance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v68 = v67;
    if (!v67) {
      goto LABEL_101;
    }
  }
  else
  {
    id v68 = 0;
    if (!v67) {
      goto LABEL_101;
    }
  }
  if (!v68)
  {
    v69 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v74 = v69;
      v75 = [(ADService *)self identifier];
      *(_DWORD *)buf = 136315650;
      v112 = "-[ADBundleService _parseInfoDictionary:]";
      __int16 v113 = 2114;
      CFStringRef v114 = @"AssistantMaintenance";
      __int16 v115 = 2114;
      v116 = v75;
      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%s Malformed info plist value for key %{public}@ in bundle %{public}@", buf, 0x20u);
    }
  }
LABEL_101:
  v70 = (NSString *)[v68 copy];
  maintenanceClassName = self->_maintenanceClassName;
  self->_maintenanceClassName = v70;

  v72 = [v4 objectForKey:@"AssistantRequiresBootMaintenance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v73 = v72;
  }
  else {
    id v73 = 0;
  }
  -[ADService setRequiresBootMaintenance:](self, "setRequiresBootMaintenance:", [v73 BOOLValue]);
}

- (id)lockRestrictedCommands
{
  return self->_lockRestrictedCommands;
}

+ (id)requiredInfoDictionaryKeys
{
  v5[0] = @"AssistantDomains";
  v5[1] = @"AssistantFirstUnlockRestrictedDomains";
  v5[2] = @"AssistantLockRestrictedDomains";
  v5[3] = @"AssistantControlCenterLockRestrictedDomains";
  void v5[4] = @"AssistantManagedStorageDomains";
  v5[5] = @"AssistantSyncAnchorKeys";
  v5[6] = @"AssistantClearsDomainObjects";
  v5[7] = @"AssistantMaintenance";
  v5[8] = @"AssistantRequiresBootMaintenance";
  v5[9] = kCFBundleIdentifierKey;
  v2 = +[NSArray arrayWithObjects:v5 count:10];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

@end