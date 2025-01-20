@interface HDSDiagnosticExtension
+ (id)appGroupIdentifier;
+ (id)cacheDirectory;
+ (id)productionCacheDirectory;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)cleanupDiagnostics;
- (void)teardownWithParameters:(id)a3;
@end

@implementation HDSDiagnosticExtension

+ (id)cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndex:0];

  return v3;
}

+ (id)productionCacheDirectory
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[HDSDiagnosticExtension appGroupIdentifier];
  v4 = [v2 containerURLForSecurityApplicationGroupIdentifier:v3];
  v5 = [v4 path];

  v6 = +[NSString stringWithFormat:@"%@%@", v5, @"/Library/Caches"];

  return v6;
}

+ (id)appGroupIdentifier
{
  return @"group.homedevicesetup.diagnostics";
}

- (id)attachmentList
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[HDSDiagnosticExtension productionCacheDirectory];
  v4 = +[NSURL fileURLWithPath:v3 isDirectory:1 relativeToURL:0];

  v5 = sub_100002EE4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to find directory: %@.", buf, 0xCu);
    }
    id v7 = 0;
    goto LABEL_26;
  }
  if (v6)
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " Looking for contents in %@.", buf, 0xCu);
  }

  id v41 = 0;
  v5 = [v2 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v41];
  id v7 = v41;
  if (!v5)
  {
    v8 = sub_100002EE4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unable to find contents in directory: %@.", buf, 0xCu);
    }
    id v25 = &__NSArray0__struct;
    goto LABEL_34;
  }
  if (![v5 count])
  {
LABEL_26:
    id v25 = &__NSArray0__struct;
    goto LABEL_35;
  }
  v8 = [objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:0.0];
  v9 = +[NSMutableArray arrayWithCapacity:[v5 count]];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obj = v5;
  id v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    v27 = v9;
    id v28 = v7;
    v29 = v5;
    v30 = v4;
    v31 = v2;
    v33 = 0;
    uint64_t v12 = *(void *)v38;
    v13 = obj;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v13);
        }
        v15 = [*(id *)(*((void *)&v37 + 1) + 8 * i) path];
        if ([v15 containsString:@"HomePod"]
          && [v15 containsString:@"sysdiagnose"]
          && [v15 containsString:@".tar.gz"])
        {
          v16 = [v15 stringByReplacingOccurrencesOfString:@".tar.gz" withString:&stru_100004228];
          v17 = [v16 componentsSeparatedByString:@"_"];
          if ((unint64_t)[v17 count] >= 3)
          {
            uint64_t v18 = [v17 objectAtIndexedSubscript:1];
            v35 = [v17 objectAtIndexedSubscript:2];
            v36 = (void *)v18;
            v19 = +[NSString stringWithFormat:@"%@_%@", v18, v35];
            id v20 = objc_alloc_init((Class)NSDateFormatter);
            [v20 setDateFormat:@"yyyy.MM.dd_HH-mm-ss-SSSS"];
            v21 = [v20 dateFromString:v19];
            if ([v21 compare:v8] == (id)1)
            {
              v32 = v21;

              id v22 = v15;
              v33 = v22;
              v8 = v32;
            }

            v13 = obj;
          }
        }
      }
      id v11 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);

    v23 = v33;
    if (!v33)
    {
      v4 = v30;
      v2 = v31;
      id v7 = v28;
      v5 = v29;
      v9 = v27;
      goto LABEL_33;
    }
    v24 = +[DEAttachmentItem attachmentWithPath:v33];
    v9 = v27;
    [v27 addObject:v24];
    v4 = v30;
    v2 = v31;
    id v7 = v28;
    v5 = v29;
  }
  else
  {
    v23 = 0;
    v24 = obj;
  }

LABEL_33:
  id v25 = [v9 copy];

LABEL_34:
LABEL_35:

  return v25;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = sub_100002EE4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[HDSDiagnosticExtension attachmentsForParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v5 = [(HDSDiagnosticExtension *)self attachmentList];
  BOOL v6 = sub_100002EE4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attachment List  %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (void)teardownWithParameters:(id)a3
{
  v4 = sub_100002EE4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[HDSDiagnosticExtension teardownWithParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(HDSDiagnosticExtension *)self cleanupDiagnostics];
}

- (void)cleanupDiagnostics
{
  uint64_t v18 = +[NSFileManager defaultManager];
  v2 = +[HDSDiagnosticExtension productionCacheDirectory];
  v3 = +[NSURL fileURLWithPath:v2 isDirectory:1 relativeToURL:0];

  v4 = sub_100002EE4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Looking for contents in %@.", buf, 0xCu);
    }

    id v24 = 0;
    v4 = [v18 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v24];
    id v6 = v24;
    if (v4)
    {
      if ([v4 count])
      {
        id v16 = v6;
        v17 = v3;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v4 = v4;
        id v7 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v4);
              }
              id v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) path:v16, v17];
              if ([v11 containsString:@"HomePod"]
                && [v11 containsString:@"sysdiagnose"]
                && [v11 containsString:@".tar.gz"])
              {
                uint64_t v12 = sub_100002EE4();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v27 = v11;
                  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
                }

                id v19 = 0;
                [v18 removeItemAtPath:v11 error:&v19];
                id v13 = v19;
                if (v13)
                {
                  v14 = sub_100002EE4();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v27 = v13;
                    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remove failed %@", buf, 0xCu);
                  }
                }
              }
            }
            id v8 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v8);
        }

        id v6 = v16;
        v3 = v17;
      }
    }
    else
    {
      v15 = sub_100002EE4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to find contents in directory: %@.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to find directory: %@.", buf, 0xCu);
    }
    id v6 = 0;
  }
}

@end