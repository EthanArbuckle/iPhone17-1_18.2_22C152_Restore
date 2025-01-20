@interface DSVServiceProviderApps
- (BOOL)canHandleSyncChunk:(id)a3;
- (DSVServiceProviderApps)init;
- (id)currentVerificationKey;
- (void)handleSyncChunk:(id)a3;
- (void)verifySyncDataWithCompletion:(id)a3;
@end

@implementation DSVServiceProviderApps

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_resultEntries, 0);
  objc_storeStrong((id *)&self->_appsByBundleID, 0);
}

- (void)verifySyncDataWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v70 = 0;
    v71 = (id *)&v70;
    uint64_t v72 = 0x3032000000;
    v73 = sub_100005414;
    v74 = sub_100005424;
    id v75 = 0;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10000542C;
    v67[3] = &unk_10000C2F8;
    v67[4] = self;
    v69 = &v70;
    id v37 = v4;
    id v68 = v4;
    v38 = objc_retainBlock(v67);
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSMutableDictionary count](self->_appsByBundleID, "count"));
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_appsByBundleID, "count"));
    v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    v62 = sub_100005544;
    v63 = &unk_10000C320;
    id v47 = v6;
    id v64 = v47;
    v65 = self;
    id v39 = v5;
    id v66 = v39;
    AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
    id v7 = objc_alloc((Class)NSMutableSet);
    v8 = [(NSMutableDictionary *)self->_appsByBundleID allKeys];
    id v40 = [v7 initWithArray:v8];

    id v9 = objc_alloc((Class)NSMutableSet);
    v10 = [v47 allKeys];
    id v41 = [v9 initWithArray:v10];

    id v11 = [v40 count];
    if (v11 != [v41 count])
    {
      objc_storeStrong(v71 + 5, SASyncDeepVerificationResultTypeCOUNT_MISMATCHValue);
      v12 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", @"Count mismatch: client has %tu, server has %tu", @"%tu%tu", 0, [v41 count], objc_msgSend(v40, "count"));
      v13 = AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v80 = "-[DSVServiceProviderApps verifySyncDataWithCompletion:]";
        __int16 v81 = 2112;
        v82 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
      }
      [(NSMutableArray *)self->_resultEntries addObject:v12];
    }
    [v40 minusSet:v39];
    [v41 minusSet:v39];
    if ([v41 count])
    {
      if (!v71[5]) {
        objc_storeStrong(v71 + 5, SASyncDeepVerificationResultTypeSET_MISMATCHValue);
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = v41;
      id v14 = [obj countByEnumeratingWithState:&v56 objects:v78 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v57;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v57 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = [v47 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * i)];
            v18 = +[NSString stringWithValidatedFormat:@"Server is missing: %@", @"%@", 0, v17 validFormatSpecifiers error];
            [(NSMutableArray *)self->_resultEntries addObject:v18];
            v19 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[DSVServiceProviderApps verifySyncDataWithCompletion:]";
              __int16 v81 = 2112;
              v82 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
            }
          }
          id v14 = [obj countByEnumeratingWithState:&v56 objects:v78 count:16];
        }
        while (v14);
      }
    }
    if ([v40 count])
    {
      if (!v71[5]) {
        objc_storeStrong(v71 + 5, SASyncDeepVerificationResultTypeSET_MISMATCHValue);
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obja = v40;
      id v20 = [obja countByEnumeratingWithState:&v52 objects:v77 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v53;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v53 != v21) {
              objc_enumerationMutation(obja);
            }
            v23 = [(NSMutableDictionary *)self->_appsByBundleID objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * (void)j)];
            v24 = objc_msgSend(v23, "dsv_description");
            v25 = +[NSString stringWithValidatedFormat:@"Server has extra: %@", @"%@", 0, v24 validFormatSpecifiers error];

            [(NSMutableArray *)self->_resultEntries addObject:v25];
            v26 = AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v80 = "-[DSVServiceProviderApps verifySyncDataWithCompletion:]";
              __int16 v81 = 2112;
              v82 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
            }
          }
          id v20 = [obja countByEnumeratingWithState:&v52 objects:v77 count:16];
        }
        while (v20);
      }
    }
    if (!v71[5])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v42 = v39;
      id v27 = [v42 countByEnumeratingWithState:&v48 objects:v76 count:16];
      if (v27)
      {
        id objb = *(id *)v49;
        v43 = (void *)SASyncDeepVerificationResultTypeFIELD_MISMATCHValue;
        do
        {
          for (k = 0; k != v27; k = (char *)k + 1)
          {
            if (*(id *)v49 != objb) {
              objc_enumerationMutation(v42);
            }
            uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * (void)k);
            v31 = [v47 objectForKey:v29];
            v32 = [(NSMutableDictionary *)self->_appsByBundleID objectForKey:v29];
            v33 = objc_msgSend(v32, "dsv_diffAgainstApplicationProxy:", v31);
            if ([v33 count])
            {
              v34 = [v33 componentsJoinedByString:@"\n"];
              v35 = +[NSString stringWithValidatedFormat:@"Field level mismatch for %@: %@", @"%@%@", 0, v29, v34 validFormatSpecifiers error];

              [(NSMutableArray *)self->_resultEntries addObject:v35];
              objc_storeStrong(v71 + 5, v43);
              v36 = AFSiriLogContextSync;
              if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v80 = "-[DSVServiceProviderApps verifySyncDataWithCompletion:]";
                __int16 v81 = 2112;
                v82 = v35;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
              }
            }
          }
          id v27 = [v42 countByEnumeratingWithState:&v48 objects:v76 count:16];
        }
        while (v27);
      }
    }
    ((void (*)(void))v38[2])();

    _Block_object_dispose(&v70, 8);
    id v4 = v37;
  }
}

- (void)handleSyncChunk:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_key)
  {
    id v6 = [v4 key];
    key = self->_key;
    self->_key = v6;
  }
  v8 = [v5 toAdd];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        appsByBundleID = self->_appsByBundleID;
        uint64_t v15 = [v13 appIdentifyingInfo];
        v16 = [v15 bundleId];
        [(NSMutableDictionary *)appsByBundleID setObject:v13 forKey:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (BOOL)canHandleSyncChunk:(id)a3
{
  id v3 = a3;
  id v4 = [v3 toAdd];
  id v5 = [v4 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v3 toRemove];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)currentVerificationKey
{
  return self->_key;
}

- (DSVServiceProviderApps)init
{
  v9.receiver = self;
  v9.super_class = (Class)DSVServiceProviderApps;
  v2 = [(DSVServiceProviderApps *)&v9 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    appsByBundleID = v2->_appsByBundleID;
    v2->_appsByBundleID = v3;

    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    resultEntries = v2->_resultEntries;
    v2->_resultEntries = v5;

    key = v2->_key;
    v2->_key = (NSString *)@"com.apple.siri.applications";
  }
  return v2;
}

@end