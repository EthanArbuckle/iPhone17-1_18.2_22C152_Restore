@interface BLBaseBookInstallOperation
- (BLBaseBookInstallOperation)initWithInfo:(id)a3;
- (BLBookInstallInfo)installInfo;
- (BOOL)_moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6;
- (BOOL)_moveFile:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)success;
- (NSError)error;
- (NSNumber)playlistIdentifier;
- (NSNumber)storeIdentifier;
- (NSString)artworkPath;
- (NSString)destinationFilename;
- (NSString)downloadID;
- (NSString)downloadedAssetPath;
- (NSString)installedAssetPath;
- (NSString)plistPath;
- (id)description;
- (void)setError:(id)a3;
- (void)setInstallInfo:(id)a3;
- (void)setInstalledAssetPath:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation BLBaseBookInstallOperation

- (BLBaseBookInstallOperation)initWithInfo:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BLBaseBookInstallOperation;
  v6 = [(BLBaseBookInstallOperation *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_installInfo, a3);
    v8 = [v5 downloadID];
    if ([v8 length])
    {
      v9 = [v5 plistPath];
      id v10 = [v9 length];

      if (v10)
      {
        v11 = [v5 itunesMetadata];
        id v12 = [v11 count];

        if (v12)
        {
          v13 = [v5 assetPath];
          id v14 = [v13 length];

          if (v14)
          {
LABEL_18:

            goto LABEL_19;
          }
          v15 = @"Required asset path missing.";
        }
        else
        {
          v15 = @"Required metadata plist was empty or failed to parse.";
        }
      }
      else
      {
        v15 = @"Required plist location missing.";
      }
    }
    else
    {
      v15 = @"Required downloadID missing.";
    }
    v16 = sub_10004B6AC(0, 0, v15);
    if (v16)
    {
      v17 = v16;
      v7->_success = 0;
      objc_storeStrong((id *)&v7->_error, v16);
      v18 = BLBookInstallLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v8 length];
        if (v19)
        {
          v20 = [v5 downloadID];
        }
        else
        {
          v20 = @"<unknown>";
        }
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Missing info needed for Install Operation: %@", buf, 0x16u);
        if (v19) {
      }
        }
    }
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (NSString)downloadID
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 downloadID];

  return (NSString *)v3;
}

- (NSString)plistPath
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 plistPath];

  return (NSString *)v3;
}

- (NSString)downloadedAssetPath
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 assetPath];

  return (NSString *)v3;
}

- (NSString)artworkPath
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 artworkPath];

  return (NSString *)v3;
}

- (NSString)destinationFilename
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 destinationFilename];

  return (NSString *)v3;
}

- (NSNumber)playlistIdentifier
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 storePlaylistIdentifier];

  return (NSNumber *)v3;
}

- (NSNumber)storeIdentifier
{
  v2 = [(BLBaseBookInstallOperation *)self installInfo];
  v3 = [v2 storeIdentifier];

  return (NSNumber *)v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(BLBaseBookInstallOperation *)self installInfo];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@(%p)>\n_installInfo = %@;",
    v4,
    self,
  v6 = v5);

  return v6;
}

- (BOOL)_moveFile:(id)a3 toPath:(id *)a4 installBehavior:(int64_t)a5 error:(id *)a6
{
  v9 = a3;
  uint64_t v10 = [(BLBaseBookInstallOperation *)self downloadID];
  v11 = BLBookInstallLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      CFStringRef v12 = (const __CFString *)*a4;
    }
    else {
      CFStringRef v12 = &stru_1001ABB60;
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v51 = v10;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2114;
    CFStringRef v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [Install-Op]: Moving file %{public}@ to %{public}@.", buf, 0x20u);
  }

  uint64_t v13 = [*a4 stringByDeletingLastPathComponent];
  id v14 = [*a4 lastPathComponent];
  v45 = [v14 stringByDeletingPathExtension];
  v15 = [v14 pathExtension];
  id v16 = objc_alloc_init((Class)NSFileManager);
  id v49 = 0;
  v46 = (void *)v13;
  LOBYTE(v13) = [v16 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v17 = v49;
  id v18 = v17;
  if ((v13 & 1) == 0 && (objc_msgSend(v17, "bu_isFileExistsError") & 1) == 0)
  {
    id v19 = BLBookInstallLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v10;
      __int16 v52 = 2112;
      v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: DownloadInstaller: Error creating directory:  %@", buf, 0x16u);
    }
  }
  v40 = v18;
  v41 = v14;
  v42 = (void *)v10;
  v43 = v9;
  v44 = 0;
  uint64_t v20 = 1;
  while ([v16 fileExistsAtPath:*a4])
  {
    if (a5 == 1)
    {
      v21 = +[NSString stringWithFormat:@"%@-%ld", v45, v20];
      if ([v15 length])
      {
        uint64_t v22 = [v21 stringByAppendingPathExtension:v15];

        v21 = (void *)v22;
      }
      *a4 = [v46 stringByAppendingPathComponent:v21];

      if (v20++ >= 10000)
      {
        v34 = BLBookInstallLog();
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
        v31 = v41;
        v27 = (void *)v10;
        if (v35)
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v51 = v10;
          __int16 v52 = 2114;
          v53 = v41;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: DownloadInstaller: File rename failed after too many tries: %{public}@", buf, 0x16u);
        }

        __int16 v25 = sub_10004B6AC(30, 0, 0);
        v29 = v43;
        v26 = v44;
        v36 = a6;
        v33 = v40;
        goto LABEL_29;
      }
    }
    else
    {
      id v24 = *a4;
      v48 = v44;
      unsigned __int8 v38 = [v16 removeItemAtPath:v24 error:&v48];
      __int16 v25 = v48;

      v44 = v25;
      if ((v38 & 1) == 0)
      {
        v26 = BLBookInstallLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v27 = (void *)v10;
          uint64_t v51 = v10;
          __int16 v52 = 2112;
          v53 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: DownloadInstaller: File delete failed: %@", buf, 0x16u);
        }
        else
        {
          v27 = (void *)v10;
        }
        v29 = v43;
        v36 = a6;
        v33 = v18;
        v31 = v41;
        goto LABEL_29;
      }
    }
  }
  id v28 = *a4;
  v29 = v43;
  v47 = v44;
  unsigned __int8 v30 = [v16 moveItemAtPath:v43 toPath:v28 error:&v47];
  __int16 v25 = v47;

  v31 = v41;
  v27 = v42;
  if (v30)
  {
    BOOL v32 = 1;
    v33 = v40;
    goto LABEL_32;
  }
  v26 = BLBookInstallLog();
  v33 = v40;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v51 = (uint64_t)v42;
    __int16 v52 = 2112;
    v53 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: DownloadInstaller: File move failed:  %@", buf, 0x16u);
  }
  v36 = a6;
LABEL_29:

  if (v36)
  {
    __int16 v25 = v25;
    BOOL v32 = 0;
    id *v36 = v25;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_32:

  return v32;
}

- (BOOL)_moveFile:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v11 = a4;
  id v8 = a4;
  LOBYTE(a5) = [(BLBaseBookInstallOperation *)self _moveFile:a3 toPath:&v11 installBehavior:0 error:a5];
  id v9 = v11;

  return (char)a5;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)installedAssetPath
{
  return self->_installedAssetPath;
}

- (void)setInstalledAssetPath:(id)a3
{
}

- (BLBookInstallInfo)installInfo
{
  return self->_installInfo;
}

- (void)setInstallInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installInfo, 0);
  objc_storeStrong((id *)&self->_installedAssetPath, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end