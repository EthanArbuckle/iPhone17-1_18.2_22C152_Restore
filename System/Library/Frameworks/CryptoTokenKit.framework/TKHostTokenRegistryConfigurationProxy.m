@interface TKHostTokenRegistryConfigurationProxy
- (BOOL)ensureAccessForClassID:(id)a3;
- (BOOL)haveAccessForClassID:(id)a3 verbose:(BOOL)a4;
- (TKHostTokenRegistry)registry;
- (TKHostTokenRegistryConfigurationProxy)initWithRegistry:(id)a3 callerBundleID:(id)a4 allowedForBundles:(id)a5;
- (id)ensureTokenWithTokenID:(id)a3;
- (void)beginTransactionWithReply:(id)a3;
- (void)createTokenID:(id)a3 persistent:(BOOL)a4 reply:(id)a5;
- (void)endTransactionWithReply:(id)a3;
- (void)getClassIDsWithReply:(id)a3;
- (void)getKeychainItemsForTokenID:(id)a3 reply:(id)a4;
- (void)getTokenIDsForClassID:(id)a3 reply:(id)a4;
- (void)readDataForTokenID:(id)a3 reply:(id)a4;
- (void)removeTokenID:(id)a3 reply:(id)a4;
- (void)updateKeychainItemsForTokenID:(id)a3 items:(id)a4 reply:(id)a5;
- (void)updateTokenID:(id)a3 data:(id)a4 reply:(id)a5;
@end

@implementation TKHostTokenRegistryConfigurationProxy

- (TKHostTokenRegistryConfigurationProxy)initWithRegistry:(id)a3 callerBundleID:(id)a4 allowedForBundles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TKHostTokenRegistryConfigurationProxy;
  v11 = [(TKHostTokenRegistryConfigurationProxy *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_registry, v8);
    objc_storeStrong((id *)&v12->_callerBundleID, a4);
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v12->_allowedForBundles, v13);
  }

  return v12;
}

- (BOOL)haveAccessForClassID:(id)a3 verbose:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v47 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = [WeakRetained beginTransaction:@"haveAccessForClassID"];

  id v9 = [v8 tokenExtensions];
  id v10 = [v9 objectForKeyedSubscript:v6];

  [v8 commit];
  if (v10)
  {
    v11 = [v10 _plugIn];
    v12 = [v11 url];

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (![v12 isFileURL]
        || ([v12 path],
            v20 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v21 = [v20 hasPrefix:@"/System/"],
            v20,
            (v21 & 1) == 0))
      {
        v48 = sub_10000663C();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1000144FC();
        }
        LOBYTE(v19) = 0;
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
    }
    BOOL v46 = v4;
    v13 = [v10 _plugIn];
    v48 = [v13 identifier];

    v14 = [v10 _plugIn];
    objc_super v15 = [v14 containingUrl];
    if (v15)
    {
      v16 = [v10 _plugIn];
      v17 = [v16 containingUrl];
      v18 = +[NSBundle bundleWithURL:v17];
    }
    else
    {
      v18 = 0;
    }

    uint64_t v22 = [v18 bundleIdentifier];
    callerBundleID = v47->_callerBundleID;
    if (v22)
    {
      v24 = (void *)v22;
      v25 = [v18 bundleIdentifier];
      if ([(NSString *)callerBundleID hasPrefix:v25])
      {

LABEL_20:
        BOOL v19 = 1;
LABEL_36:
        if (v46)
        {
          v37 = sub_10000663C();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            if (v19) {
              CFStringRef v39 = @"Allowing";
            }
            else {
              CFStringRef v39 = @"Refusing";
            }
            v45 = v12;
            v40 = v47->_callerBundleID;
            v41 = [v18 bundleIdentifier];
            allowedForBundles = v47->_allowedForBundles;
            *(_DWORD *)buf = 138544642;
            CFStringRef v54 = v39;
            __int16 v55 = 2114;
            v56 = v40;
            v12 = v45;
            __int16 v57 = 2114;
            id v58 = v6;
            __int16 v59 = 2114;
            v60 = v48;
            __int16 v61 = 2114;
            v62 = v41;
            __int16 v63 = 2114;
            v64 = allowedForBundles;
            _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}@ caller %{public}@, to access token classID=%{public}@ identifier=%{public}@ containing=%{public}@ entitled for=%{public}@", buf, 0x3Eu);
          }
        }

        goto LABEL_40;
      }
      unsigned __int8 v26 = [v48 hasPrefix:v47->_callerBundleID];

      if (v26) {
        goto LABEL_20;
      }
    }
    else if ([v48 hasPrefix:v47->_callerBundleID])
    {
      goto LABEL_20;
    }
    id v43 = v6;
    v44 = v12;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v27 = v47->_allowedForBundles;
    id v28 = [(NSArray *)v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v33 = [v18 bundleIdentifier];
          if (v33)
          {
            v34 = (void *)v33;
            v35 = [v18 bundleIdentifier];
            unsigned __int8 v36 = [v32 hasPrefix:v35];

            if (v36) {
              goto LABEL_34;
            }
          }
          else if ([v32 isEqualToString:v48])
          {
LABEL_34:

            BOOL v19 = 1;
            goto LABEL_35;
          }
        }
        id v29 = [(NSArray *)v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }

    BOOL v19 = 0;
LABEL_35:
    id v6 = v43;
    v12 = v44;
    goto LABEL_36;
  }
  if (v4)
  {
    v12 = sub_10000663C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100014470((uint64_t)self, (uint64_t)v6, v12);
    }
    LOBYTE(v19) = 0;
    goto LABEL_41;
  }
  LOBYTE(v19) = 0;
LABEL_42:

  return v19;
}

- (void)getClassIDsWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v6 = [WeakRetained beginTransaction:@"getClassIDsWithReply"];

  id v7 = [&__NSArray0__struct mutableCopy];
  id v8 = objc_loadWeakRetained((id *)&self->_registry);
  objc_sync_enter(v8);
  id v9 = objc_loadWeakRetained((id *)&self->_registry);
  id v10 = [v9 reloadTokenClassesFromStore];

  objc_sync_exit(v8);
  id v11 = objc_loadWeakRetained((id *)&self->_registry);
  [v11 registerClassIDs:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = objc_msgSend(v6, "tokenExtensions", 0);
  v13 = [v12 allKeys];

  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([(TKHostTokenRegistryConfigurationProxy *)self haveAccessForClassID:v17 verbose:0])
        {
          [v7 addObject:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [v6 commit];
  v4[2](v4, v7);
}

- (BOOL)ensureAccessForClassID:(id)a3
{
  return [(TKHostTokenRegistryConfigurationProxy *)self haveAccessForClassID:a3 verbose:1];
}

- (void)beginTransactionWithReply:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  id v8 = [v5 beginTransaction:@"beginTransactionWithReply"];

  id v6 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  id v7 = [v6 externalTransactions];
  [v7 addObject:v8];

  v4[2](v4);
}

- (void)endTransactionWithReply:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  id v6 = [v5 externalTransactions];
  id v9 = [v6 lastObject];

  [v9 commit];
  id v7 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  id v8 = [v7 externalTransactions];
  [v8 removeLastObject];

  v4[2](v4);
}

- (void)getTokenIDsForClassID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [&__NSArray0__struct mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  long long v20 = [WeakRetained beginTransaction:@"getTokenIDsForClassID"];

  if ([(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v6])
  {
    id obj = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(obj);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    id v11 = [v10 tokens];

    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "classID", obj);
          unsigned int v17 = [v16 isEqualToString:v6];

          if (v17) {
            [v8 addObject:v15];
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    objc_sync_exit(obj);
  }
  objc_msgSend(v20, "commit", obj);
  id v18 = [v8 copy];
  v7[2](v7, v18);
}

- (void)createTokenID:(id)a3 persistent:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v8 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v10 = [WeakRetained beginTransaction:@"createTokenID"];

  id v11 = [v18 classID];
  unsigned int v12 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v11];

  if (v12)
  {
    uint64_t v13 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    id v14 = [v13 createTokenWithTokenID:v18 persistent:v6];

    uint64_t v15 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    v16 = [v15 delegate];
    unsigned int v17 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    [v16 hostTokenRegistry:v17 addedToken:v18];
  }
  [v10 commit];
  v8[2](v8);
}

- (id)ensureTokenWithTokenID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  BOOL v6 = [WeakRetained beginTransaction:@"ensureTokenWithTokenID"];

  id v7 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  id v8 = [v7 tokensByTokenID];
  id v9 = [v8 objectForKeyedSubscript:v4];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    unsigned int v12 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    uint64_t v13 = [v12 pendingCreationTokens];
    id v11 = [v13 objectForKey:v4];
  }
  if (!v11)
  {
    id v11 = [[TKHostToken alloc] initWithTokenID:v4 persistent:0];
    id v14 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    [(TKHostToken *)v11 setRegistry:v14];

    uint64_t v15 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    v16 = [v15 pendingCreationTokens];
    [v16 setObject:v11 forKeyedSubscript:v4];

    unsigned int v17 = sub_10000663C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100014530();
    }
  }
  [v6 commit];

  return v11;
}

- (void)getKeychainItemsForTokenID:(id)a3 reply:(id)a4
{
  id v15 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = [WeakRetained beginTransaction:@"getKeychainItemsForTokenID"];

  id v9 = [v15 classID];
  unsigned int v10 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v11);
    unsigned int v12 = [(TKHostTokenRegistryConfigurationProxy *)self ensureTokenWithTokenID:v15];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = [v12 keychainItems];
    }
    else
    {
      id v14 = &__NSArray0__struct;
    }

    objc_sync_exit(v11);
  }
  else
  {
    id v14 = &__NSArray0__struct;
  }
  [v8 commit];
  v6[2](v6, v14);
}

- (void)updateKeychainItemsForTokenID:(id)a3 items:(id)a4 reply:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v11 = [WeakRetained beginTransaction:@"updateKeychainItemsForTokenID"];

  unsigned int v12 = [v23 classID];
  unsigned int v13 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v12];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v14);
    id v15 = [(TKHostTokenRegistryConfigurationProxy *)self ensureTokenWithTokenID:v23];
    v16 = v15;
    if (v15)
    {
      unsigned int v17 = [v15 keychainItems];
      if (v17)
      {
        id v18 = [v16 keychainItems];
        long long v19 = +[NSKeyedArchiver archivedDataWithRootObject:v18 requiringSecureCoding:0 error:0];
      }
      else
      {
        long long v19 = 0;
      }

      if (v8)
      {
        long long v20 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:0 error:0];
      }
      else
      {
        long long v20 = 0;
      }
      if (([v19 isEqualToData:v20] & 1) == 0)
      {
        [v16 setKeychainItems:v8];
        id v21 = [v11 keychainItemsModified:v23];
      }
    }
    objc_sync_exit(v14);
  }
  [v11 commit];
  long long v22 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
  [v22 notifyTokenReinsertion:v23];

  v9[2](v9);
}

- (void)readDataForTokenID:(id)a3 reply:(id)a4
{
  id v15 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = [WeakRetained beginTransaction:@"readDataForTokenID"];

  id v9 = [v15 classID];
  unsigned int v10 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v11);
    unsigned int v12 = [(TKHostTokenRegistryConfigurationProxy *)self ensureTokenWithTokenID:v15];
    unsigned int v13 = v12;
    if (v12)
    {
      id v14 = [v12 configurationData];
    }
    else
    {
      id v14 = 0;
    }

    objc_sync_exit(v11);
  }
  else
  {
    id v14 = 0;
  }
  [v8 commit];
  v6[2](v6, v14);
}

- (void)updateTokenID:(id)a3 data:(id)a4 reply:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v11 = [WeakRetained beginTransaction:@"updateTokenID"];

  unsigned int v12 = [v20 classID];
  unsigned int v13 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v12];

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_registry);
    objc_sync_enter(v14);
    id v15 = [(TKHostTokenRegistryConfigurationProxy *)self ensureTokenWithTokenID:v20];
    v16 = v15;
    if (v15)
    {
      unsigned int v17 = [v15 configurationData];
      unsigned __int8 v18 = [v17 isEqualToData:v8];

      if ((v18 & 1) == 0)
      {
        [v16 setConfigurationData:v8];
        id v19 = [v11 markModified];
      }
    }

    objc_sync_exit(v14);
  }
  [v11 commit];
  v9[2](v9);
}

- (void)removeTokenID:(id)a3 reply:(id)a4
{
  id v12 = a3;
  BOOL v6 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  id v8 = [WeakRetained beginTransaction:@"removeTokenID"];

  id v9 = [v12 classID];
  unsigned int v10 = [(TKHostTokenRegistryConfigurationProxy *)self ensureAccessForClassID:v9];

  if (v10)
  {
    id v11 = [(TKHostTokenRegistryConfigurationProxy *)self registry];
    [v11 removeTokenWithTokenID:v12];
  }
  [v8 commit];
  v6[2](v6);
}

- (TKHostTokenRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  return (TKHostTokenRegistry *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_registry);
  objc_storeStrong((id *)&self->_allowedForBundles, 0);

  objc_storeStrong((id *)&self->_callerBundleID, 0);
}

@end