@interface ISMutableIconCache
- (ISMutableIconCache)initWithURL:(id)a3;
- (ISStoreMapTable)unitSourceRegistry;
- (id)mutableStoreIndex;
- (void)clear;
- (void)collectGarbage;
- (void)registerRecordIdentifiers:(id)a3 asSourceForUnit:(id)a4;
@end

@implementation ISMutableIconCache

- (ISMutableIconCache)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v61 = [v4 URLByAppendingPathComponent:@"__cache_info__" isDirectory:0];
    v6 = +[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:");
    v7 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    v8 = [v7 objectForKey:@"ProductBuildVersion"];
    v9 = [v6 objectForKey:@"ProductBuildVersion"];
    v10 = +[NSFileManager defaultManager];
    v11 = [v5 path];
    v12 = [v10 attributesOfItemAtPath:v11 error:0];

    v63 = +[NSLocale _deviceLanguage];
    if (v6 && v9 && v8 && [v9 isEqualToString:v8])
    {
      v13 = [v12 fileOwnerAccountName];
      if ([v13 isEqualToString:@"_iconservices"])
      {
        int v14 = sub_100004674(v5);

        if (!v14)
        {
          v15 = v61;
LABEL_51:

          goto LABEL_52;
        }
      }
      else
      {
      }
    }
    v56 = v12;
    v57 = v9;
    v62 = v8;
    v58 = v7;
    v59 = self;
    v60 = v5;
    uint64_t v16 = objc_msgSend(v5, "URLByDeletingLastPathComponent", v6);
    v17 = _ISDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Resetting icon cache ...", buf, 2u);
    }

    v18 = +[NSFileManager defaultManager];
    v55 = (void *)v16;
    v19 = [v18 enumeratorAtURL:v16 includingPropertiesForKeys:0 options:1 errorHandler:0];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v74 objects:buf count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v75;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v75 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v74 + 1) + 8 * i);
          v26 = +[NSFileManager defaultManager];
          NSFileAttributeKey v71 = 0;
          unsigned __int8 v27 = [v26 removeItemAtURL:v25 error:&v71];
          v28 = v71;

          if ((v27 & 1) == 0)
          {
            v29 = _ISDefaultLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v68 = 138412546;
              *(void *)&v68[4] = v25;
              __int16 v69 = 2112;
              v70 = v28;
              _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Failed to remove item at URL: %@ with error: %@", v68, 0x16u);
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v74 objects:buf count:16];
      }
      while (v22);
    }

    v30 = _ISDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "... Done", v68, 2u);
    }

    NSFileAttributeKey v71 = NSFilePosixPermissions;
    *(void *)v68 = &off_100008640;
    v31 = +[NSDictionary dictionaryWithObjects:v68 forKeys:&v71 count:1];
    v32 = +[NSFileManager defaultManager];
    v5 = v60;
    v33 = [v60 path];
    id v67 = 0;
    unsigned __int8 v34 = [v32 createDirectoryAtPath:v33 withIntermediateDirectories:1 attributes:v31 error:&v67];
    id v35 = v67;

    self = v59;
    if ((v34 & 1) == 0)
    {
      v41 = _ISDefaultLog();
      v15 = v61;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        sub_100004AE0();
      }
      uint64_t v42 = (uint64_t)v54;
      goto LABEL_50;
    }
    id v36 = v60;
    v15 = v61;
    if (!sub_100004674(v36))
    {
LABEL_41:

      *(void *)&long long v74 = @"language";
      *((void *)&v74 + 1) = @"ProductBuildVersion";
      *(void *)buf = v63;
      v73 = v62;
      uint64_t v42 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v74 count:2];

      id v66 = 0;
      v41 = +[NSPropertyListSerialization dataWithPropertyList:v42 format:200 options:0 error:&v66];
      id v43 = v66;

      if (v41)
      {
        id v65 = v43;
        unsigned __int8 v44 = [v41 writeToURL:v61 options:268435457 error:&v65];
        id v35 = v65;

        if (v44)
        {
LABEL_49:
          v9 = v57;
LABEL_50:

          v6 = (void *)v42;
          v7 = v58;
          v8 = v62;
          v12 = v56;
          goto LABEL_51;
        }
        v45 = _ISDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
          sub_10000495C(v61, v35, v45);
        }
        id v43 = v35;
      }
      else
      {
        v45 = _ISDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_1000048A4(v43, v45);
        }
      }

      id v35 = v43;
      goto LABEL_49;
    }
    id v37 = objc_alloc_init((Class)NSFileSecurity);
    if (CFFileSecuritySetAccessControlList((CFFileSecurityRef)v37, (acl_t)1))
    {
      *(void *)buf = 0;
      unsigned __int8 v38 = [v36 setResourceValue:v37 forKey:NSURLFileSecurityKey error:buf];
      id v39 = *(id *)buf;
      if (v38)
      {
LABEL_40:

        goto LABEL_41;
      }
      v40 = _ISDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_100004A78();
      }
    }
    else
    {
      v40 = _ISDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        sub_100004A34(v40);
      }
      id v39 = 0;
    }

    goto LABEL_40;
  }
  v15 = _ISDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100004860(v15);
  }
LABEL_52:

  v46 = [v5 URLByAppendingPathComponent:@"store.index" isDirectory:0];
  v47 = _ISDefaultLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    sub_1000047F8();
  }

  id v48 = [objc_alloc((Class)ISMutableStoreIndex) initWithStoreFileURL:v46 capacity:4000];
  v49 = [v5 URLByAppendingPathComponent:@"store-source-registry.map" isDirectory:0];
  v50 = (ISStoreMapTable *)[objc_alloc((Class)ISStoreMapTable) initWithURL:v49 capacity:4000];
  unitSourceRegistry = self->_unitSourceRegistry;
  self->_unitSourceRegistry = v50;

  v64.receiver = self;
  v64.super_class = (Class)ISMutableIconCache;
  v52 = [(ISMutableIconCache *)&v64 initWithURL:v5 storeIndex:v48 sandboxExtensionToken:0];

  return v52;
}

- (id)mutableStoreIndex
{
  v4.receiver = self;
  v4.super_class = (Class)ISMutableIconCache;
  v2 = [(ISMutableIconCache *)&v4 storeIndex];

  return v2;
}

- (void)registerRecordIdentifiers:(id)a3 asSourceForUnit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        v13 = [(ISMutableIconCache *)self unitSourceRegistry];
        int v14 = [v7 UUID];
        [v13 addData:v12 forUUID:v14];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)clear
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create((void *)&_mh_execute_header, "CLEAR CACHE", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  CFAbsoluteTimeGetCurrent();
  objc_super v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing all icon cache entries...", buf, 2u);
  }

  v5 = +[NSFileManager defaultManager];
  id v6 = [(ISMutableIconCache *)self cacheURL];
  id v7 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:7 errorHandler:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
        int v14 = +[NSFileManager defaultManager];
        [v14 removeItemAtURL:v13 error:0];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  long long v15 = [(ISMutableIconCache *)self unitSourceRegistry];
  [v15 removeAll];

  long long v16 = [(ISMutableIconCache *)self mutableStoreIndex];
  [v16 removeAll];

  long long v17 = _ISDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "... Done", buf, 2u);
  }

  long long v18 = _ISTraceLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100004B64();
  }

  os_activity_scope_leave(&state);
}

- (void)collectGarbage
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create((void *)&_mh_execute_header, "CLEAR STALE CACHE ENTRIES", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  CFAbsoluteTimeGetCurrent();
  objc_super v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing stale icon cache entries...", buf, 2u);
  }

  v5 = [(ISMutableIconCache *)self unitSourceRegistry];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002FF8;
  v8[3] = &unk_100008358;
  v8[4] = self;
  [v5 enumerateWithBlock:v8];

  id v6 = _ISDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "... Done", buf, 2u);
  }

  id v7 = _ISTraceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100004BF8();
  }

  os_activity_scope_leave(&state);
}

- (ISStoreMapTable)unitSourceRegistry
{
  return (ISStoreMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end