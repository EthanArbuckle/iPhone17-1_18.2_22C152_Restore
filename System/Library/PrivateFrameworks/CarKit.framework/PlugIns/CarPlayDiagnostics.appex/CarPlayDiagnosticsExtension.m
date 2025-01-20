@interface CarPlayDiagnosticsExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)carPlayAttachmentsForFolder:(id)a3;
- (id)carPlayLogFolderAttachmentForFolderName:(id)a3;
- (id)contentOfCarPlayLogsDirectory;
@end

@implementation CarPlayDiagnosticsExtension

- (id)attachmentList
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "diagnostic extension: entering attachmentList", buf, 2u);
  }
  v3 = +[NSArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CarPlayDiagnosticsExtension *)self contentOfCarPlayLogsDirectory];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [(CarPlayDiagnosticsExtension *)self carPlayLogFolderAttachmentForFolderName:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9)
        {
          uint64_t v10 = [v3 arrayByAddingObject:v9];

          v3 = (void *)v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "diagnostic extension: attachmentList returning %@", buf, 0xCu);
  }
  return v3;
}

- (id)contentOfCarPlayLogsDirectory
{
  char v10 = 0;
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/Logs/com.apple.CarPlay" isDirectory:&v10];

  if (v3) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = +[NSFileManager defaultManager];
    id v9 = 0;
    id v6 = [v5 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/com.apple.CarPlay" error:&v9];
    id v7 = v9;

    if (!v7) {
      goto LABEL_8;
    }
  }
  id v6 = 0;
LABEL_8:
  return v6;
}

- (id)carPlayLogFolderAttachmentForFolderName:(id)a3
{
  id v3 = a3;
  char v11 = 0;
  BOOL v4 = [@"/var/mobile/Library/Logs/com.apple.CarPlay" stringByAppendingPathComponent:v3];
  id v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v11];

  if (v6) {
    BOOL v7 = v11 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    v8 = +[NSURL fileURLWithPath:v4];
    id v9 = +[DEAttachmentItem attachmentWithPathURL:v8];

    [v9 setDisplayName:v3];
    [v9 setShouldCompress:&__kCFBooleanTrue];
  }

  return v9;
}

- (id)carPlayAttachmentsForFolder:(id)a3
{
  char v22 = 0;
  id v3 = [@"/var/mobile/Library/Logs/com.apple.CarPlay" stringByAppendingPathComponent:a3];
  BOOL v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v22];

  if (v5) {
    BOOL v6 = v22 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    BOOL v7 = +[NSFileManager defaultManager];
    v8 = [v7 contentsOfDirectoryAtPath:v3 error:0];

    id v9 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          v16 = +[DEAttachmentItem attachmentWithPath:v15];
          [v9 addObject:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "diagnostic extension: entering attachmentsForParameters", buf, 2u);
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  BOOL v6 = +[NSDate distantPast];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(CarPlayDiagnosticsExtension *)self contentOfCarPlayLogsDirectory];
  id v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (!v7)
  {
    char v22 = 0;
    v23 = obj;
    goto LABEL_20;
  }
  id v8 = v7;
  v26 = self;
  v27 = v5;
  id v28 = v4;
  v30 = 0;
  uint64_t v9 = *(void *)v32;
  id v10 = obj;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v10);
      }
      id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(@"/var/mobile/Library/Logs/com.apple.CarPlay", "stringByAppendingPathComponent:", v12, v26);
      buf[0] = 0;
      long long v14 = +[NSFileManager defaultManager];
      unsigned int v15 = [v14 fileExistsAtPath:v13 isDirectory:buf];

      if (v15) {
        BOOL v16 = buf[0] == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        v17 = +[NSFileManager defaultManager];
        long long v18 = [v17 attributesOfItemAtPath:v13 error:0];

        long long v19 = [v18 objectForKeyedSubscript:NSFileCreationDate];
        if ([v19 compare:v6] == (id)1)
        {
          id v20 = v19;

          id v21 = v12;
          v30 = v21;
          BOOL v6 = v20;
          id v10 = obj;
        }
      }
    }
    id v8 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
  }
  while (v8);

  char v22 = v30;
  if (v30)
  {
    v23 = [(CarPlayDiagnosticsExtension *)v26 carPlayAttachmentsForFolder:v30];
    id v5 = v27;
    [v27 addObjectsFromArray:v23];
    id v4 = v28;
LABEL_20:

    goto LABEL_22;
  }
  id v5 = v27;
  id v4 = v28;
LABEL_22:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "diagnostic extension: attachmentsForParameters returning %@", buf, 0xCu);
  }
  id v24 = [v5 copy];

  return v24;
}

@end