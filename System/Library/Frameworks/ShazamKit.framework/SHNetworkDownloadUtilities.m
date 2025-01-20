@interface SHNetworkDownloadUtilities
+ (id)cachedFileURLWithFilename:(id)a3 type:(id)a4;
+ (id)downloadDirectory;
+ (id)renameDownloadedFile:(id)a3 withFilename:(id)a4 usingType:(id)a5 error:(id *)a6;
@end

@implementation SHNetworkDownloadUtilities

+ (id)renameDownloadedFile:(id)a3 withFilename:(id)a4 usingType:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = [a1 downloadDirectory];
  v14 = [v13 URLByAppendingPathComponent:v12 conformingToType:v11];

  v15 = +[NSFileManager defaultManager];
  v16 = [v14 path];
  if (([v15 fileExistsAtPath:v16] & 1) == 0)
  {

    goto LABEL_9;
  }
  v17 = +[NSFileManager defaultManager];
  unsigned __int8 v18 = [v17 removeItemAtURL:v14 error:0];

  if (v18)
  {
LABEL_9:
    v24 = v14;
    goto LABEL_10;
  }
  v19 = sh_log_object();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = *a6;
    int v33 = 138412546;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Existing downloaded file at %@ could not be removed for a new download. Error: %@.", (uint8_t *)&v33, 0x16u);
  }

  v21 = +[NSProcessInfo processInfo];
  v22 = [v21 globallyUniqueString];

  v23 = [a1 downloadDirectory];
  v24 = [v23 URLByAppendingPathComponent:v22 conformingToType:v11];

  v25 = sh_log_object();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v33 = 138412290;
    id v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Saving downloaded file to %@ instead", (uint8_t *)&v33, 0xCu);
  }

LABEL_10:
  v26 = +[NSFileManager defaultManager];
  unsigned __int8 v27 = [v26 moveItemAtURL:v10 toURL:v24 error:a6];

  v28 = sh_log_object();
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      int v33 = 138412290;
      id v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Downloaded archive file from server %@", (uint8_t *)&v33, 0xCu);
    }

    id v30 = v24;
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v31 = *a6;
      int v33 = 138412802;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v24;
      __int16 v37 = 2112;
      id v38 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to rename item at %@ to %@ Error: %@", (uint8_t *)&v33, 0x20u);
    }

    id v30 = 0;
  }

  return v30;
}

+ (id)cachedFileURLWithFilename:(id)a3 type:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 downloadDirectory];
  v9 = [v8 URLByAppendingPathComponent:v7 conformingToType:v6];

  id v10 = +[NSFileManager defaultManager];
  id v11 = [v9 path];
  LODWORD(v7) = [v10 fileExistsAtPath:v11];

  if (v7) {
    id v12 = v9;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (id)downloadDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    NSTemporaryDirectory();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  id v7 = +[NSURL fileURLWithPath:v6];
  v8 = [v7 URLByAppendingPathComponent:@"com.apple.shazamd/Downloads"];

  unsigned __int8 v20 = 0;
  v9 = +[NSFileManager defaultManager];
  id v10 = [v8 path];
  unsigned int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v20];
  int v12 = v20;

  if (!v11 || !v12)
  {
    v13 = +[NSFileManager defaultManager];
    id v19 = 0;
    unsigned __int8 v14 = [v13 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v15 = v19;

    if ((v14 & 1) == 0)
    {
      uint64_t v16 = +[NSURL fileURLWithPath:v6];

      v17 = sh_log_object();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to create directory for network downloads. Error: %@", buf, 0xCu);
      }

      v8 = (void *)v16;
    }
  }

  return v8;
}

@end