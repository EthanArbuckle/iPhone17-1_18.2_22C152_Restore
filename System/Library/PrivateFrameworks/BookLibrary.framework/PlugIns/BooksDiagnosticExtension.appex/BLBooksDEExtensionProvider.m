@interface BLBooksDEExtensionProvider
- (id)_fileDateSuffix;
- (id)attachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5;
- (id)attachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5 fixPermission:(BOOL)a6;
- (void)addAttachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5 toArray:(id)a6;
- (void)appendDatabaseAttachmentsFromURLs:(id)a3 hasSqliteSuffix:(BOOL)a4 toArray:(id)a5;
@end

@implementation BLBooksDEExtensionProvider

- (void)appendDatabaseAttachmentsFromURLs:(id)a3 hasSqliteSuffix:(BOOL)a4 toArray:(id)a5
{
  id v8 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_100004720;
  v14[4] = sub_100004730;
  v15 = @"*.sqlite";
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004738;
  v10[3] = &unk_1000081F8;
  BOOL v13 = a4;
  v12 = v14;
  v10[4] = self;
  id v9 = a5;
  id v11 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];

  _Block_object_dispose(v14, 8);
}

- (id)attachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5
{
  return [(BLBooksDEExtensionProvider *)self attachmentFromURL:a3 withName:a4 archiveFile:a5 fixPermission:0];
}

- (id)attachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5 fixPermission:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v38 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 stringByDeletingPathExtension];
  v12 = [(BLBooksDEExtensionProvider *)self _fileDateSuffix];
  BOOL v13 = [v11 stringByAppendingString:v12];
  v14 = [v9 pathExtension];
  v15 = [v13 stringByAppendingPathExtension:v14];

  v16 = NSTemporaryDirectory();
  v50[0] = v16;
  v50[1] = v15;
  v17 = +[NSArray arrayWithObjects:v50 count:2];
  v18 = +[NSURL fileURLWithPathComponents:v17];

  v19 = +[NSFileManager defaultManager];
  id v40 = 0;
  unsigned int v20 = [v19 copyItemAtURL:v9 toURL:v18 error:&v40];
  id v21 = v40;

  if (v20)
  {
    if (v6)
    {
      memset(&v49, 0, sizeof(v49));
      id v22 = [v18 path];
      int v23 = stat((const char *)[v22 UTF8String], &v49);

      if (v23)
      {
        v24 = BLBooksDiagnosticExtensionLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = [v18 path];
          v26 = __error();
          v27 = strerror(*v26);
          *(_DWORD *)buf = 138412546;
          id v42 = v25;
          __int16 v43 = 2080;
          *(void *)v44 = v27;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not stat %@: %s", buf, 0x16u);
        }
        id v28 = v21;
      }
      else
      {
        NSFileAttributeKey v47 = NSFilePosixPermissions;
        int v37 = v49.st_mode | 0x1A4;
        v31 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
        v48 = v31;
        v24 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

        v32 = +[NSFileManager defaultManager];
        v33 = [v18 path];
        id v39 = v21;
        [v32 setAttributes:v24 ofItemAtPath:v33 error:&v39];
        id v28 = v39;

        if (v28)
        {
          v34 = BLBooksDiagnosticExtensionLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            id v42 = v10;
            __int16 v43 = 1024;
            *(_DWORD *)v44 = v37;
            *(_WORD *)&v44[4] = 2112;
            *(void *)&v44[6] = v18;
            __int16 v45 = 2112;
            id v46 = v28;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to set permission %@ to (%3o), exportURL: %@ %@", buf, 0x26u);
          }
        }
      }

      id v21 = v28;
    }
    if (v38)
    {
      v35 = +[DEArchiver archiveFile:v18 deleteOriginal:1];
      v30 = +[DEAttachmentItem attachmentWithPathURL:v35];
    }
    else
    {
      v30 = +[DEAttachmentItem attachmentWithPathURL:v18];
    }
  }
  else
  {
    v29 = BLBooksDiagnosticExtensionLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v49.st_dev = 138412802;
      *(void *)&v49.st_mode = v10;
      WORD2(v49.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v49.st_ino + 6) = (__darwin_ino64_t)v9;
      HIWORD(v49.st_gid) = 2112;
      *(void *)&v49.st_rdev = v21;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to copy %@, sourceURL: %@ %@", (uint8_t *)&v49, 0x20u);
    }

    v30 = 0;
  }

  return v30;
}

- (void)addAttachmentFromURL:(id)a3 withName:(id)a4 archiveFile:(BOOL)a5 toArray:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  id v10 = [(BLBooksDEExtensionProvider *)self attachmentFromURL:a3 withName:a4 archiveFile:v6];
  if (v10) {
    [v11 addObject:v10];
  }
}

- (id)_fileDateSuffix
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"-yyyy.MM.dd_HH-mm"];
  v3 = +[NSDate date];
  v4 = [v2 stringFromDate:v3];

  return v4;
}

@end