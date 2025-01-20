@interface SMTUtils
+ (id)decompressArchiveWithURL:(id)a3 outError:(id *)a4;
+ (void)cleanupTemporaryDirectory;
+ (void)initialize;
@end

@implementation SMTUtils

+ (id)decompressArchiveWithURL:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = NSTemporaryDirectory();
  v7 = +[NSURL fileURLWithPath:v6 isDirectory:1];
  uint64_t v8 = +[NSUUID UUID];
  v9 = [(id)v8 UUIDString];
  v10 = [v7 URLByAppendingPathComponent:v9];

  v11 = +[NSFileManager defaultManager];
  id v39 = 0;
  LOBYTE(v8) = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v39];
  id v12 = v39;

  if ((v8 & 1) == 0)
  {
    v16 = qword_100044428;
    if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = (uint64_t)v10;
      __int16 v50 = 2112;
      id v51 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not make temporary attachment directory at %@: %@", buf, 0x16u);
      if (!a4) {
        goto LABEL_23;
      }
    }
    else if (!a4)
    {
LABEL_23:
      id v17 = 0;
      goto LABEL_24;
    }
    id v17 = 0;
    *a4 = v12;
    goto LABEL_24;
  }
  archive_read_new();
  if (archive_read_support_filter_all())
  {
    v13 = (void *)qword_100044428;
    if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_ERROR))
    {
      v29 = v13;
      uint64_t v30 = archive_error_string();
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to specify compression algorithm: %s", buf, 0xCu);
    }
    archive_read_free();
    if (!a4) {
      goto LABEL_23;
    }
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    CFStringRef v47 = @"Failed to specify compression algorithm";
    v14 = &v47;
    v15 = &v46;
    goto LABEL_22;
  }
  if (archive_read_support_format_all())
  {
    v18 = (void *)qword_100044428;
    if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_ERROR))
    {
      v35 = v18;
      uint64_t v36 = archive_error_string();
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to specify format: %s", buf, 0xCu);
    }
    archive_read_free();
    if (!a4) {
      goto LABEL_23;
    }
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Failed to specify format";
    v14 = &v45;
    v15 = &v44;
    goto LABEL_22;
  }
  id v19 = [v5 fileSystemRepresentation];
  v20 = qword_100044428;
  if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v49 = (uint64_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Start extracting archive at path: %s", buf, 0xCu);
  }
  if (archive_read_open_filename())
  {
    v21 = (void *)qword_100044428;
    if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_ERROR))
    {
      v37 = v21;
      uint64_t v38 = archive_error_string();
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to open archive for reading: %s", buf, 0xCu);
    }
    archive_read_free();
    if (!a4) {
      goto LABEL_23;
    }
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    CFStringRef v43 = @"Failed to open file for reading";
    v14 = &v43;
    v15 = &v42;
LABEL_22:
    v22 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:5 userInfo:v22];

    goto LABEL_23;
  }
  id v24 = objc_alloc_init((Class)NSMutableArray);
  while (!archive_read_next_header())
  {
    v25 = +[NSString stringWithUTF8String:archive_entry_pathname()];
    v26 = [v10 URLByAppendingPathComponent:v25];

    v27 = qword_100044428;
    if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = (uint64_t)v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Entry extraction path: %@", buf, 0xCu);
    }
    id v28 = v26;
    [v28 fileSystemRepresentation];
    archive_entry_set_pathname();
    if (archive_read_extract())
    {
      v32 = qword_100044428;
      if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = (uint64_t)v28;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unable to extract file to: %@", buf, 0xCu);
      }
      archive_read_free();
      if (a4)
      {
        NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
        v33 = +[NSString stringWithFormat:@"Unable to extract file to: %@", v28];
        v41 = v33;
        v34 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        *a4 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:5 userInfo:v34];
      }
      id v17 = 0;
      goto LABEL_43;
    }
    [v24 addObject:v28];
  }
  archive_read_free();
  v31 = qword_100044428;
  if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Finished extracting archive to: %@", buf, 0xCu);
  }
  id v17 = v24;
LABEL_43:

LABEL_24:
  return v17;
}

+ (void)cleanupTemporaryDirectory
{
  v2 = NSTemporaryDirectory();
  uint64_t v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  v4 = +[NSFileManager defaultManager];
  id v23 = 0;
  id v17 = (void *)v3;
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v23];
  id v6 = v23;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        id v12 = v6;
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = +[NSFileManager defaultManager];
        id v18 = v12;
        [v14 removeItemAtURL:v13 error:&v18];
        id v6 = v18;

        if (v6)
        {
          v15 = qword_100044428;
          if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Failed to clean temporary attachment directory: %@", buf, 0xCu);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v9);
  }

  v16 = qword_100044428;
  if (os_log_type_enabled((os_log_t)qword_100044428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Successfully cleaned temporary attachment directory: %@", buf, 0xCu);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100044428 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SMTUtils");
    _objc_release_x1();
  }
}

@end