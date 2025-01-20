@interface ADOfflineMetricsMap
- (ADOfflineMetricsMap)initWithPath:(id)a3;
- (id)_offlineIdentifiers;
- (void)deleteAllMetrics;
- (void)deleteMetricsWithOfflineIdentifier:(id)a3;
- (void)fetchNextMetricsUsingBlock:(id)a3;
- (void)insertMetrics:(id)a3 withOfflineIdentifier:(id)a4;
@end

@implementation ADOfflineMetricsMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineIdentifiers, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)_offlineIdentifiers
{
  v2 = self;
  offlineIdentifiers = self->_offlineIdentifiers;
  if (!offlineIdentifiers)
  {
    v4 = v2->_path;
    v5 = +[NSFileManager defaultManager];
    char v54 = 0;
    if ([v5 fileExistsAtPath:v4 isDirectory:&v54]) {
      BOOL v6 = v54 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      id v53 = 0;
      v8 = [v5 contentsOfDirectoryAtPath:v4 error:&v53];
      v9 = (NSOrderedSet *)v53;
      if (v9)
      {
        v10 = v9;
        v11 = AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v59 = 136315394;
          v60 = "_ADOfflineMetricsMapGetOfflineIdentifiers";
          __int16 v61 = 2112;
          v62 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s %@", v59, 0x16u);
        }
        v7 = 0;
      }
      else
      {
        v42 = v5;
        v43 = v4;
        id v12 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v39 = v8;
        id obj = v8;
        id v13 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
        v40 = v2;
        if (v13)
        {
          id v14 = v13;
          v10 = 0;
          uint64_t v15 = *(void *)v50;
          do
          {
            v16 = 0;
            v17 = v10;
            do
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(id *)(*((void *)&v49 + 1) + 8 * (void)v16);
              v19 = [v18 pathExtension];
              if ([v19 isEqualToString:@"plist"])
              {
                v20 = [v18 stringByDeletingPathExtension];
              }
              else
              {
                v20 = 0;
              }

              if (v20)
              {
                v21 = [(NSString *)v43 stringByAppendingPathComponent:v18];
                v48 = v17;
                v22 = [v42 attributesOfItemAtPath:v21 error:&v48];
                v10 = v48;

                if (v10)
                {
                  v23 = AFSiriLogContextAnalytics;
                  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v56 = "_ADOfflineMetricsMapGetOfflineIdentifiers";
                    __int16 v57 = 2112;
                    v58 = v10;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
                  }
                }
                else
                {
                  v24 = [v22 objectForKey:NSFileCreationDate];
                  if (v24)
                  {
                    [v12 setObject:v20 forKey:v24];
                  }
                  else
                  {
                    v25 = +[NSDate date];
                    [v12 setObject:v20 forKey:v25];
                  }
                }

                v17 = v10;
              }
              else
              {
                v10 = v17;
              }

              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v14);
        }
        else
        {
          v10 = 0;
        }

        v26 = [v12 allKeys];
        v27 = [v26 sortedArrayUsingSelector:"compare:"];

        id v28 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(obj, "count"));
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v29 = v27;
        id v30 = [v29 countByEnumeratingWithState:&v44 objects:buf count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v45;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v45 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v44 + 1) + 8 * i), v39);
              if (v34) {
                [v28 addObject:v34];
              }
            }
            id v31 = [v29 countByEnumeratingWithState:&v44 objects:buf count:16];
          }
          while (v31);
        }

        v7 = (NSOrderedSet *)[v28 copy];
        v8 = v39;
        v2 = v40;
        v5 = v42;
        v4 = v43;
      }
    }
    v35 = v2->_offlineIdentifiers;
    v2->_offlineIdentifiers = v7;

    v36 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v37 = v2->_offlineIdentifiers;
      *(_DWORD *)v59 = 136315394;
      v60 = "-[ADOfflineMetricsMap _offlineIdentifiers]";
      __int16 v61 = 2112;
      v62 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s offlineIdentifiers = %@", v59, 0x16u);
    }
    offlineIdentifiers = v2->_offlineIdentifiers;
  }
  return offlineIdentifiers;
}

- (void)deleteAllMetrics
{
  v3 = +[NSFileManager defaultManager];
  if (![v3 fileExistsAtPath:self->_path]) {
    goto LABEL_4;
  }
  path = self->_path;
  id v10 = 0;
  unsigned __int8 v5 = [v3 removeItemAtPath:path error:&v10];
  BOOL v6 = (NSOrderedSet *)v10;
  offlineIdentifiers = v6;
  if (v5)
  {

LABEL_4:
    offlineIdentifiers = self->_offlineIdentifiers;
    self->_offlineIdentifiers = 0;
    goto LABEL_7;
  }
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v9 = self->_path;
    *(_DWORD *)buf = 136315650;
    id v12 = "-[ADOfflineMetricsMap deleteAllMetrics]";
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    v16 = offlineIdentifiers;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to remove directory at path %@ due to error %@.", buf, 0x20u);
  }
LABEL_7:
}

- (void)deleteMetricsWithOfflineIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = +[NSFileManager defaultManager];
    path = self->_path;
    v7 = sub_100257488(v4);
    v8 = [(NSString *)path stringByAppendingPathComponent:v7];

    if ([v5 fileExistsAtPath:v8])
    {
      id v18 = 0;
      unsigned __int8 v9 = [v5 removeItemAtPath:v8 error:&v18];
      id v10 = v18;
      id v11 = v10;
      if ((v9 & 1) == 0)
      {
        v16 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v20 = "-[ADOfflineMetricsMap deleteMetricsWithOfflineIdentifier:]";
          __int16 v21 = 2112;
          id v22 = v8;
          __int16 v23 = 2112;
          id v24 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Unable to remove metrics plist file at path %@ due to error %@.", buf, 0x20u);
        }
        offlineIdentifiers = self->_offlineIdentifiers;
        self->_offlineIdentifiers = 0;

        goto LABEL_11;
      }
    }
    id v12 = self->_offlineIdentifiers;
    if (!v12)
    {
LABEL_12:

      goto LABEL_13;
    }
    id v11 = [(NSOrderedSet *)v12 mutableCopy];
    [v11 removeObject:v4];
    __int16 v13 = (NSOrderedSet *)[v11 copy];
    id v14 = self->_offlineIdentifiers;
    self->_offlineIdentifiers = v13;

    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[ADOfflineMetricsMap deleteMetricsWithOfflineIdentifier:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s offlineIdentifiers -= %@", buf, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
}

- (void)insertMetrics:(id)a3 withOfflineIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v7 && (isKindOfClass & 1) != 0)
  {
    unsigned __int8 v9 = +[NSFileManager defaultManager];
    char v52 = 0;
    if ([v9 fileExistsAtPath:self->_path isDirectory:&v52])
    {
      if (v52)
      {
        id v10 = 0;
        goto LABEL_7;
      }
      path = self->_path;
      id v51 = 0;
      unsigned int v29 = [v9 removeItemAtPath:path error:&v51];
      id v30 = (NSString *)v51;
      id v31 = v30;
      if (!v29)
      {
        v42 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          long long v45 = self->_path;
          *(_DWORD *)buf = 136315650;
          char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
          __int16 v55 = 2112;
          v56 = v45;
          __int16 v57 = 2112;
          v58 = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s Unable to remove file at path %@ due to error %@.", buf, 0x20u);
        }
        id v10 = v31;
        goto LABEL_34;
      }
      uint64_t v32 = self->_path;
      long long v50 = v30;
      unsigned __int8 v33 = [v9 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:0 error:&v50];
      id v10 = v50;

      if ((v33 & 1) == 0)
      {
        v26 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v11 = self->_path;
      id v49 = 0;
      unsigned __int8 v12 = [v9 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v49];
      id v10 = (NSString *)v49;
      if ((v12 & 1) == 0)
      {
        v26 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
LABEL_34:

          goto LABEL_35;
        }
LABEL_14:
        v27 = self->_path;
        *(_DWORD *)buf = 136315650;
        char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
        __int16 v55 = 2112;
        v56 = v27;
        __int16 v57 = 2112;
        v58 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Unable to create directory at path %@ due to error %@.", buf, 0x20u);
        goto LABEL_34;
      }
    }
LABEL_7:
    __int16 v13 = self->_path;
    id v14 = sub_100257488(v7);
    __int16 v15 = [(NSString *)v13 stringByAppendingPathComponent:v14];

    if ([v9 fileExistsAtPath:v15])
    {
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
        __int16 v55 = 2112;
        v56 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Offline metrics plist file already exists at path %@.", buf, 0x16u);
      }
      goto LABEL_33;
    }
    v17 = [v6 dictionary];
    id v48 = 0;
    id v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:&v48];
    v19 = (NSString *)v48;

    if (v19)
    {
      v20 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = v20;
        id v22 = [v6 dictionary];
        *(_DWORD *)buf = 136315650;
        char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
        __int16 v55 = 2112;
        v56 = v22;
        __int16 v57 = 2112;
        v58 = v19;
        __int16 v23 = "%s Unable to serialize offline metrics plist %@ due to error %@.";
        id v24 = v21;
        uint32_t v25 = 32;
LABEL_29:
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
      }
    }
    else
    {
      id v47 = 0;
      unsigned __int8 v34 = [v18 writeToFile:v15 options:1 error:&v47];
      v19 = (NSString *)v47;
      if (v34)
      {
        v35 = +[NSURL fileURLWithPath:v15];
        long long v46 = v19;
        unsigned __int8 v36 = [v35 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v46];
        id v10 = v46;

        if (v36)
        {
          offlineIdentifiers = self->_offlineIdentifiers;
          if (!offlineIdentifiers)
          {
LABEL_32:

LABEL_33:
            goto LABEL_34;
          }
          v38 = (NSOrderedSet *)[(NSOrderedSet *)offlineIdentifiers mutableCopy];
          [(NSOrderedSet *)v38 addObject:v7];
          v39 = (NSOrderedSet *)[(NSOrderedSet *)v38 copy];
          v40 = self->_offlineIdentifiers;
          self->_offlineIdentifiers = v39;

          v41 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
            __int16 v55 = 2112;
            v56 = (NSString *)v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s offlineIdentifiers += %@", buf, 0x16u);
          }
        }
        else
        {
          long long v44 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
            __int16 v55 = 2112;
            v56 = v15;
            __int16 v57 = 2112;
            v58 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s Unable to exclude offline metrics plist file at path %@ from backup due to error %@.", buf, 0x20u);
          }
          [v9 removeItemAtPath:v15 error:0];
          v38 = self->_offlineIdentifiers;
          self->_offlineIdentifiers = 0;
        }
        v19 = v10;
LABEL_31:

        id v10 = v19;
        goto LABEL_32;
      }
      v43 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = v43;
        id v22 = [v6 dictionary];
        *(_DWORD *)buf = 136315906;
        char v54 = "-[ADOfflineMetricsMap insertMetrics:withOfflineIdentifier:]";
        __int16 v55 = 2112;
        v56 = v22;
        __int16 v57 = 2112;
        v58 = v15;
        __int16 v59 = 2112;
        v60 = v19;
        __int16 v23 = "%s Unable to write to offline metrics plist %@ to path %@ due to error %@.";
        id v24 = v21;
        uint32_t v25 = 42;
        goto LABEL_29;
      }
    }
    [v9 removeItemAtPath:v15 error:0];
    v38 = self->_offlineIdentifiers;
    self->_offlineIdentifiers = 0;
    goto LABEL_31;
  }
LABEL_35:
}

- (void)fetchNextMetricsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [(ADOfflineMetricsMap *)self _offlineIdentifiers];
    id v6 = [v5 firstObject];

    if (!v6)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_24:

      goto LABEL_25;
    }
    id v7 = +[NSFileManager defaultManager];
    path = self->_path;
    unsigned __int8 v9 = sub_100257488(v6);
    id v10 = [(NSString *)path stringByAppendingPathComponent:v9];

    if (([v7 fileExistsAtPath:v10] & 1) == 0)
    {
      __int16 v15 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v29 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Unable to find offline metrics plist path at path %@.", buf, 0x16u);
      }
      offlineIdentifiers = self->_offlineIdentifiers;
      self->_offlineIdentifiers = 0;

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_23;
    }
    id v11 = [objc_alloc((Class)NSData) initWithContentsOfFile:v10];
    if (!v11)
    {
      v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v29 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to read offline metrics plist file at path %@.", buf, 0x16u);
      }
      [v7 removeItemAtPath:v10 error:0];
      id v18 = self->_offlineIdentifiers;
      self->_offlineIdentifiers = 0;

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_22;
    }
    id v27 = 0;
    unsigned __int8 v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v27];
    id v13 = v27;
    if (v13)
    {
      id v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        unsigned int v29 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        id v33 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to initialize offline metrics plist from file at path %@ due to error %@", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [objc_alloc((Class)SAMetrics) initWithDictionary:v12];
        if (v19)
        {
          (*((void (**)(id, id, void *))v4 + 2))(v4, v19, v6);
        }
        else
        {
          id v22 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            unsigned int v29 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
            __int16 v30 = 2112;
            id v31 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Unable to create SAMetrics object from offline metrics plist %@.", buf, 0x16u);
          }
          [v7 removeItemAtPath:v10 error:0];
          __int16 v23 = self->_offlineIdentifiers;
          self->_offlineIdentifiers = 0;

          (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
        }

        goto LABEL_21;
      }
      v20 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        id v24 = v20;
        uint32_t v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 136315394;
        unsigned int v29 = "-[ADOfflineMetricsMap fetchNextMetricsUsingBlock:]";
        __int16 v30 = 2112;
        id v31 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Unexpected type of initialized offline metrics plist %@.", buf, 0x16u);
      }
    }
    [v7 removeItemAtPath:v10 error:0];
    __int16 v21 = self->_offlineIdentifiers;
    self->_offlineIdentifiers = 0;

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_21:

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

- (ADOfflineMetricsMap)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADOfflineMetricsMap;
  unsigned __int8 v5 = [(ADOfflineMetricsMap *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByStandardizingPath];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }
  return v5;
}

@end