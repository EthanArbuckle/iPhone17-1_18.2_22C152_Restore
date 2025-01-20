@interface PLPartialVideoCacheCleanUpMaintenanceTask
+ (BOOL)_shouldRemovePartialVideoAtURL:(id)a3;
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLPartialVideoCacheCleanUpMaintenanceTask

+ (BOOL)_shouldRemovePartialVideoAtURL:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  id v13 = 0;
  unsigned int v4 = [v3 getResourceValue:&v14 forKey:NSURLContentAccessDateKey error:&v13];
  id v5 = v14;
  id v6 = v13;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v3;
      __int16 v17 = 1024;
      unsigned int v18 = v4;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot get the last access date on partial video file %@, success: %d, error: %@", buf, 0x1Cu);
    }
    BOOL v11 = 1;
  }
  else
  {
    v8 = [objc_alloc((Class)NSDate) initWithTimeInterval:v5 sinceDate:604800.0];
    v9 = +[NSDate now];
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 < 0.0;
  }
  return v11;
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v3 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned int v4 = [v3 isSystemPhotoLibrary];

  if (!v4) {
    return 1;
  }
  v35 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
  id v5 = [v35 photoDirectoryWithType:19];
  uint64_t v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];

  BOOL v7 = +[NSFileManager defaultManager];
  v55[0] = NSURLContentAccessDateKey;
  v55[1] = NSURLIsDirectoryKey;
  v8 = +[NSArray arrayWithObjects:v55 count:2];
  v34 = (void *)v6;
  v9 = [v7 enumeratorAtURL:v6 includingPropertiesForKeys:v8 options:14 errorHandler:&stru_10002CDD0];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v11)
  {
    char v36 = 1;
    int v39 = 0;
    goto LABEL_40;
  }
  id v12 = v11;
  int v39 = 0;
  uint64_t v13 = *(void *)v45;
  char v36 = 1;
  id v38 = v10;
  uint64_t v37 = *(void *)v45;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v45 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      id v42 = 0;
      id v43 = 0;
      unsigned int v16 = [v15 getResourceValue:&v43 forKey:NSURLIsDirectoryKey error:&v42];
      id v17 = v43;
      id v18 = v42;
      if (!v16)
      {
        v21 = PLBackendGetLog();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 138412546;
        id v49 = v15;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v18;
        v22 = v21;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
        v24 = "Failed to check NSURLIsDirectoryKey on URL: %@, with error: %@";
        uint32_t v25 = 22;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v22, v23, v24, buf, v25);
        goto LABEL_34;
      }
      if (!v17) {
        goto LABEL_35;
      }
      if (([v17 BOOLValue] & 1) == 0
        && [(id)objc_opt_class() _shouldRemovePartialVideoAtURL:v15])
      {
        __int16 v19 = [v15 pathComponents];
        id v20 = [v19 lastObject];
        if ((unint64_t)[v19 count] < 2)
        {
          uint64_t v40 = 0;
        }
        else
        {
          uint64_t v40 = objc_msgSend(v19, "objectAtIndex:", (char *)objc_msgSend(v19, "count") - 2);
        }
        v28 = +[NSFileManager defaultManager];
        id v41 = 0;
        unsigned int v29 = [v28 removeItemAtURL:v15 error:&v41];
        v21 = v41;

        if (v29)
        {
          ++v39;
          v30 = PLBackendGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v49 = v20;
            __int16 v50 = 2114;
            v31 = (void *)v40;
            uint64_t v51 = v40;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Removed partial video %{public}@ of asset %{public}@", buf, 0x16u);
            goto LABEL_33;
          }
LABEL_32:
          v31 = (void *)v40;
        }
        else
        {
          v30 = PLBackendGetLog();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            char v36 = 0;
            goto LABEL_32;
          }
          *(_DWORD *)buf = 138543874;
          id v49 = v20;
          __int16 v50 = 2114;
          v31 = (void *)v40;
          uint64_t v51 = v40;
          __int16 v52 = 2112;
          v53 = v21;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot remove partial video: %{public}@ of asset %{public}@, with error: %@", buf, 0x20u);
          char v36 = 0;
        }
LABEL_33:

        uint64_t v13 = v37;
        id v10 = v38;
LABEL_34:

        goto LABEL_35;
      }
      if ([v17 BOOLValue]
        && [v10 isEnumeratingDirectoryPostOrder])
      {
        id v26 = v15;
        if (!rmdir((const char *)[v26 fileSystemRepresentation]))
        {
          v21 = PLBackendGetLog();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_34;
          }
          *(_DWORD *)buf = 138412290;
          id v49 = v26;
          v22 = v21;
          os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
          v24 = "Removed empty direcotry under partial video root directory %@";
          uint32_t v25 = 12;
          goto LABEL_15;
        }
        if (*__error() && *__error() != 66)
        {
          v21 = PLBackendGetLog();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_34;
          }
          int v27 = *__error();
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = v27;
          v22 = v21;
          os_log_type_t v23 = OS_LOG_TYPE_ERROR;
          v24 = "an error occured while removing an empty directoy under partial video root directory: %d";
          uint32_t v25 = 8;
          goto LABEL_15;
        }
      }
LABEL_35:
    }
    id v12 = [v10 countByEnumeratingWithState:&v44 objects:v54 count:16];
  }
  while (v12);
LABEL_40:

  v33 = PLBackendGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = v39;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Total removed partial videos: %d", buf, 8u);
  }

  return v36 & 1;
}

@end