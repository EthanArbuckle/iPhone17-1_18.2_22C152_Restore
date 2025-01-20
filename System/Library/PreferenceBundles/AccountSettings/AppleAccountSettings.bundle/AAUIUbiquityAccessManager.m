@interface AAUIUbiquityAccessManager
- (AAUIUbiquityAccessManager)init;
- (BOOL)isAccessGrantedForBundleID:(id)a3;
- (NSArray)allBundleIDs;
- (__CFBundle)_bundleForBundleID:(id)a3;
- (id)_serviceNamesForBundleID:(id)a3;
- (id)_servicesForBundleID:(id)a3;
- (void)_addAccessInfo:(id)a3 forServiceName:(id)a4;
- (void)_updateCacheGranted:(BOOL)a3 forBundleID:(id)a4;
- (void)reloadAccessInfo;
- (void)setAppAccessGranted:(BOOL)a3 forBundleID:(id)a4;
@end

@implementation AAUIUbiquityAccessManager

- (AAUIUbiquityAccessManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIUbiquityAccessManager;
  v2 = [(AAUIUbiquityAccessManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AAUIUbiquityAccessManager *)v2 reloadAccessInfo];
  }
  return v3;
}

- (void)reloadAccessInfo
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  accessInfoCacheByBundleID = self->_accessInfoCacheByBundleID;
  self->_accessInfoCacheByBundleID = v3;

  id v6 = (id)TCCAccessCopyInformation();
  objc_super v5 = (void *)TCCAccessCopyInformation();
  [(AAUIUbiquityAccessManager *)self _addAccessInfo:v6 forServiceName:kTCCServiceUbiquity];
  [(AAUIUbiquityAccessManager *)self _addAccessInfo:v5 forServiceName:kTCCServiceLiverpool];
}

- (void)_addAccessInfo:(id)a3 forServiceName:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = &kTCCInfoBundle;
    v10 = &kTCCInfoGranted;
    uint64_t v28 = *(void *)v30;
    do
    {
      v11 = 0;
      id v26 = v8;
      do
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v11);
        v13 = [v12 objectForKeyedSubscript:*v9];
        v14 = CFBundleGetIdentifier(v13);
        uint64_t v15 = [v12 objectForKeyedSubscript:*v10];
        v16 = (void *)v15;
        if (v14)
        {
          if (!v15)
          {
            v16 = +[NSNumber numberWithBool:0];
          }
          v17 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKey:v14];
          if (v17)
          {
            id v18 = v17;
            id v19 = [v17 objectForKey:@"services"];
            if (v19) {
              goto LABEL_11;
            }
          }
          else
          {
            id v18 = objc_alloc_init((Class)NSMutableDictionary);
            id v19 = objc_alloc_init((Class)NSMutableArray);
            [v18 setObject:v19 forKey:@"services"];
            [v18 setObject:v13 forKey:@"bundle"];
            [(NSMutableDictionary *)self->_accessInfoCacheByBundleID setObject:v18 forKey:v14];
            if (v19)
            {
LABEL_11:
              v20 = v10;
              v21 = self;
              v22 = v9;
              id v23 = objc_alloc_init((Class)NSMutableDictionary);
              [v23 setObject:v16 forKey:@"granted"];
              [v23 setObject:v25 forKey:@"serviceName"];
              [v19 addObject:v23];

              v9 = v22;
              self = v21;
              v10 = v20;
              id v8 = v26;
            }
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v8 = v24;
    }
    while (v24);
  }
}

- (NSArray)allBundleIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_accessInfoCacheByBundleID allKeys];
}

- (__CFBundle)_bundleForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = (__CFBundle *)[v3 objectForKey:@"bundle"];

  return v4;
}

- (id)_servicesForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = [v3 objectForKey:@"services"];

  return v4;
}

- (id)_serviceNamesForBundleID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accessInfoCacheByBundleID objectForKeyedSubscript:a3];
  v4 = [v3 objectForKey:@"services"];
  objc_super v5 = [v4 valueForKey:@"serviceName"];

  return v5;
}

- (BOOL)isAccessGrantedForBundleID:(id)a3
{
  [(AAUIUbiquityAccessManager *)self _servicesForBundleID:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKey:", @"granted", (void)v12);
        unsigned __int8 v9 = [v8 BOOLValue];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)setAppAccessGranted:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![(AAUIUbiquityAccessManager *)self _bundleForBundleID:v6])
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error! No bundle for bundle ID: %@. Maybe iCloud Drive is turned off?", buf, 0xCu);
    }
  }
  id v8 = [(AAUIUbiquityAccessManager *)self _serviceNamesForBundleID:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned __int8 v9 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    BOOL v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        TCCAccessSetForBundle();
      }
      BOOL v10 = (char *)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [(AAUIUbiquityAccessManager *)self _updateCacheGranted:v4 forBundleID:v6];
  long long v13 = [(AAUIUbiquityAccessManager *)self _serviceNamesForBundleID:v6];
  unsigned int v14 = [v13 containsObject:kTCCServiceUbiquity];

  if (v14)
  {
    long long v15 = +[FBSSystemService sharedService];
    [v15 terminateApplication:v6 forReason:3 andReport:0 withDescription:0];
  }
}

- (void)_updateCacheGranted:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v5 = [(AAUIUbiquityAccessManager *)self _servicesForBundleID:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        uint64_t v11 = +[NSNumber numberWithBool:v4];
        [v10 setObject:v11 forKey:@"granted"];

        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end