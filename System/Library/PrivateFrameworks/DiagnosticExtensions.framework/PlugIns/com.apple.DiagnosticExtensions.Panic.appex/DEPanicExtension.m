@interface DEPanicExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getAllCoreFiles;
- (id)getAllPanicLogs;
@end

@implementation DEPanicExtension

- (id)attachmentList
{
  v3 = +[NSMutableArray array];
  v4 = [(DEPanicExtension *)self getAllPanicLogs];
  [v3 addObjectsFromArray:v4];

  v5 = [(DEPanicExtension *)self getAllCoreFiles];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  v4 = [(DEPanicExtension *)self getAllPanicLogs];
  v5 = [(DEPanicExtension *)self getAllCoreFiles];
  id v41 = +[NSMutableArray array];
  if ([v5 count])
  {
    v6 = [v5 lastObject];
    v7 = [v6 path];
    v8 = [v7 lastPathComponent];
    v9 = +[NSMutableString stringWithString:v8];

    v10 = (char *)[v9 rangeOfString:@".core."];
    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_44;
    }
    v11 = v10 - 1;
    do
    {
      unsigned int v12 = [v9 characterAtIndex:v11];
      BOOL v14 = v11-- != 0;
    }
    while (v12 != 46 && v14);
    if (v11 == (char *)-1 || v11 == (char *)0x7FFFFFFFFFFFFFFELL)
    {
LABEL_44:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to find date in most recent filename (%@), including this coredump and associated log", buf, 0xCu);
      }
      v15 = [v5 lastObject];
      v16 = [v15 path];
      v17 = [v16 URLByDeletingPathExtension];
      id v18 = [v17 URLByAppendingPathExtension:@"log"];

      [v41 addObject:v15];
      v19 = +[DEAttachmentItem attachmentWithPathURL:v18];
      [v41 addObject:v19];
    }
    else
    {
      v40 = v4;
      v15 = [v9 substringToIndex:v11 + 1];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v53 = [v5 count];
        __int16 v54 = 2112;
        v55 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found %lu coredumps, including all panic related files from : %@", buf, 0x16u);
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v39 = v5;
      id v22 = v5;
      id v23 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v28 = [v27 path];
            v29 = [v28 lastPathComponent];
            id v30 = [v29 rangeOfString:v15];

            if (v30 != (id)0x7FFFFFFFFFFFFFFFLL) {
              [v41 addObject:v27];
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v24);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v4 = v40;
      id v18 = v40;
      id v31 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v43;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v43 != v33) {
              objc_enumerationMutation(v18);
            }
            v35 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
            v36 = [v35 path];
            v37 = [v36 lastPathComponent];
            id v38 = [v37 rangeOfString:v15];

            if (v38 != (id)0x7FFFFFFFFFFFFFFFLL) {
              [v41 addObject:v35];
            }
          }
          id v32 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v32);
        v4 = v40;
      }
      v5 = v39;
    }
  }
  else if ([v4 count])
  {
    v20 = [v4 lastObject];
    [v41 addObject:v20];
  }
  return v41;
}

- (id)getAllCoreFiles
{
  v3 = [@"/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:@"Panics"];
  v4 = +[NSURL fileURLWithPath:v3];
  v5 = [(DEPanicExtension *)self filesInDir:v4 matchingPattern:0 excludingPattern:0];
  id v6 = [v5 mutableCopy];

  v7 = +[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:1];
  v10 = v7;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [v6 sortUsingDescriptors:v8];

  return v6;
}

- (id)getAllPanicLogs
{
  v3 = +[NSRegularExpression regularExpressionWithPattern:@".*panic.*\\.ips.*" options:1 error:0];
  v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v5 = [(DEPanicExtension *)self filesInDir:v4 matchingPattern:v3 excludingPattern:0];
  id v6 = [v5 mutableCopy];

  v7 = +[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:1];
  v10 = v7;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [v6 sortUsingDescriptors:v8];

  return v6;
}

@end