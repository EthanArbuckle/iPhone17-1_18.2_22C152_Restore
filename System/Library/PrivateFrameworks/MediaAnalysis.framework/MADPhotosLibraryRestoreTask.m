@interface MADPhotosLibraryRestoreTask
+ (id)allowedRestoreTasks;
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosLibraryRestoreTask)initWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)performRestoreForTask:(unint64_t)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosLibraryRestoreTask

- (MADPhotosLibraryRestoreTask)initWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v11 = a3;
  v12 = (Block_layout *)a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v27.receiver = self;
  v27.super_class = (Class)MADPhotosLibraryRestoreTask;
  v15 = [(MADPhotosLibraryRestoreTask *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibrary, a3);
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &stru_10021B378;
    }
    v18 = objc_retainBlock(v17);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v18;

    if (v13) {
      v20 = v13;
    }
    else {
      v20 = &stru_10021B398;
    }
    v21 = objc_retainBlock(v20);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v21;

    if (v14) {
      v23 = v14;
    }
    else {
      v23 = &stru_10021B3B8;
    }
    v24 = objc_retainBlock(v23);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v24;
  }
  return v16;
}

+ (id)taskWithPhotoLibrary:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5 cancelBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 progressHandler:v11 completionHandler:v12 cancelBlock:v13];

  return v14;
}

+ (id)taskName
{
  return @"MADPhotosLibraryRestoreTask";
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  if ((*((uint64_t (**)(void))self->_cancelBlock + 2))()) {
    return 1;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancel);
  return v4 & 1;
}

+ (id)allowedRestoreTasks
{
  return &off_100230368;
}

- (int)performRestoreForTask:(unint64_t)a3
{
  v5 = VCPTaskIDDescription(a3);
  v6 = +[NSFileManager defaultManager];
  v7 = [(PHPhotoLibrary *)self->_photoLibrary mad_restoreStatusFilepath];
  if (v7)
  {
    v8 = +[NSURL fileURLWithPath:v7 isDirectory:0];
    v9 = MADLastAnalysisRestoreTimestampKeyForTask(a3);
    if (v9)
    {
      id v10 = MADAnalysisRestoreAttemptsKeyForTask(a3);
      if (v10)
      {
        if ([v6 fileExistsAtPath:v7])
        {
          id v53 = 0;
          v49 = +[NSDictionary dictionaryWithContentsOfURL:v8 error:&v53];
          id v11 = v53;
          if (v11)
          {
            id v12 = v11;
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              id v13 = VCPLogInstance();
              os_log_type_t v14 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v13, v14))
              {
                *(_DWORD *)buf = 138412546;
                v55 = v5;
                __int16 v56 = 2112;
                v57 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, v14, "[Restore][%@] Failed to read restore status file (%@); skipping restore",
                  buf,
                  0x16u);
              }
            }
LABEL_10:

LABEL_72:
            int v16 = 0;
            goto LABEL_73;
          }
          id v12 = [v49 objectForKeyedSubscript:v9];
          if (v12)
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v33 = VCPLogInstance();
              os_log_type_t v34 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v33, v34))
              {
                *(_DWORD *)buf = 138412546;
                v55 = v5;
                __int16 v56 = 2112;
                v57 = v12;
                _os_log_impl((void *)&_mh_execute_header, v33, v34, "[Restore][%@] Last restore date is %@; skipping restore",
                  buf,
                  0x16u);
              }
            }
            goto LABEL_10;
          }
          v35 = [v49 objectForKeyedSubscript:v10];
          if ([v35 unsignedIntValue] >= 3)
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v43 = VCPLogInstance();
              os_log_type_t v44 = VCPLogToOSLogType[5];
              if (os_log_type_enabled(v43, v44))
              {
                *(_DWORD *)buf = 138412546;
                v55 = v5;
                __int16 v56 = 2112;
                v57 = v35;
                _os_log_impl((void *)&_mh_execute_header, v43, v44, "[Restore][%@] Restore has been attempted %@ time(s); skipping restore",
                  buf,
                  0x16u);
              }
            }
            goto LABEL_72;
          }
        }
        else
        {
          v49 = 0;
        }
        v48 = +[NSMutableDictionary dictionary];
        if (v49) {
          objc_msgSend(v48, "addEntriesFromDictionary:");
        }
        v47 = [(PHPhotoLibrary *)self->_photoLibrary vcp_mediaAnalysisBackupFilepath];
        if (objc_msgSend(v6, "fileExistsAtPath:"))
        {
          v20 = [v49 objectForKeyedSubscript:v10];
          uint64_t v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 unsignedIntValue] + 1);
          [v48 setObject:v21 forKeyedSubscript:v10];

          id v51 = 0;
          LOBYTE(v21) = [v48 writeToURL:v8 error:&v51];
          id v22 = v51;
          if (v21)
          {
            v23 = VCPSignPostLog();
            os_signpost_id_t spid = os_signpost_id_generate(v23);

            v24 = VCPSignPostLog();
            v25 = v24;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v5;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADPhotosLibraryRestore", "_%@", buf, 0xCu);
            }

            photoLibrary = self->_photoLibrary;
            if (a3 == 1)
            {
              objc_super v27 = +[VCPRestoreDatabaseTask taskWithPhotoLibrary:photoLibrary];
              [v27 start];
            }
            else
            {
              v36 = +[MADPhotosRestoreAnalysisTask taskWithPhotoLibrary:photoLibrary forTaskID:a3 progressHandler:self->_progressHandler completionHandler:self->_completionHandler andCancelBlock:self->_cancelBlock];
              BOOL v37 = [v36 run] == -128;

              if (v37)
              {
                int v16 = -128;
LABEL_65:

LABEL_73:
                goto LABEL_74;
              }
            }
            v38 = VCPSignPostLog();
            v39 = v38;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v5;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, spid, "MADPhotosLibraryRestore", "_%@", buf, 0xCu);
            }

            uint64_t v40 = +[NSDate now];
            [v48 setObject:v40 forKeyedSubscript:v9];

            id v50 = v22;
            LOBYTE(v40) = [v48 writeToURL:v8 error:&v50];
            id v41 = v50;

            if ((v40 & 1) != 0 || (int)MediaAnalysisLogLevel() < 3)
            {
              int v16 = 0;
              id v22 = v41;
              goto LABEL_65;
            }
            v31 = VCPLogInstance();
            os_log_type_t v42 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v31, v42))
            {
              *(_DWORD *)buf = 138412802;
              v55 = v5;
              __int16 v56 = 2112;
              v57 = v48;
              __int16 v58 = 2112;
              id v59 = v41;
              _os_log_impl((void *)&_mh_execute_header, v31, v42, "[Restore][%@] Failed to write restore status %@: %@", buf, 0x20u);
            }
            id v22 = v41;
            goto LABEL_63;
          }
          if ((int)MediaAnalysisLogLevel() < 3)
          {
LABEL_64:
            int v16 = 0;
            goto LABEL_65;
          }
          v31 = VCPLogInstance();
          os_log_type_t v32 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v31, v32))
          {
LABEL_63:

            goto LABEL_64;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            v28 = VCPLogInstance();
            os_log_type_t v29 = VCPLogToOSLogType[5];
            if (os_log_type_enabled(v28, v29))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v5;
              _os_log_impl((void *)&_mh_execute_header, v28, v29, "[Restore][%@] No backup present; skipping restore",
                buf,
                0xCu);
            }
          }
          uint64_t v30 = +[NSDate now];
          [v48 setObject:v30 forKeyedSubscript:v9];

          id v52 = 0;
          LOBYTE(v30) = [v48 writeToURL:v8 error:&v52];
          id v22 = v52;
          if ((v30 & 1) != 0 || (int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_64;
          }
          v31 = VCPLogInstance();
          os_log_type_t v32 = VCPLogToOSLogType[3];
          if (!os_log_type_enabled(v31, v32)) {
            goto LABEL_63;
          }
        }
        *(_DWORD *)buf = 138412802;
        v55 = v5;
        __int16 v56 = 2112;
        v57 = v48;
        __int16 v58 = 2112;
        id v59 = v22;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "[Restore][%@] Failed to write restore status %@: %@", buf, 0x20u);
        goto LABEL_63;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[3];
        v49 = v18;
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v5;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "[Restore][%@] Unknown restore attempts key; skipping restore",
            buf,
            0xCu);
        }
        goto LABEL_72;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v16 = 0;
LABEL_75:

LABEL_76:
        goto LABEL_77;
      }
      id v10 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v10, v17))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, v17, "[Restore][%@] Unknown last restore timestmap key; skipping restore",
          buf,
          0xCu);
      }
    }
    int v16 = 0;
LABEL_74:

    goto LABEL_75;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v8, v15))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, v15, "[Restore][%@] Unknown restore status filepath; skipping restore",
        buf,
        0xCu);
    }
    int v16 = 0;
    goto LABEL_76;
  }
  int v16 = 0;
LABEL_77:

  return v16;
}

- (int)run
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      v5 = [(id)objc_opt_class() taskName];
      v6 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
      *(_DWORD *)buf = 138412546;
      id v30 = v5;
      __int16 v31 = 2112;
      os_log_type_t v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Attempting restore for library %@", buf, 0x16u);
    }
  }
  v7 = +[NSFileManager defaultManager];
  v8 = [(PHPhotoLibrary *)self->_photoLibrary mad_restoreDirectory];
  if (([v7 fileExistsAtPath:v8] & 1) == 0)
  {
    NSFileAttributeKey v27 = NSFilePosixPermissions;
    v28 = &off_10022DA98;
    v9 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v25 = 0;
    unsigned __int8 v10 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v9 error:&v25];
    id v11 = v25;

    if ((v10 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v18 = VCPLogInstance();
        os_log_type_t v19 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v18, v19))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to create restore directory (%@); restore failed",
            buf,
            0xCu);
        }
      }
      goto LABEL_22;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_msgSend((id)objc_opt_class(), "allowedRestoreTasks", 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        os_log_type_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        LODWORD(v15) = -[MADPhotosLibraryRestoreTask performRestoreForTask:](self, "performRestoreForTask:", [v15 unsignedIntegerValue]);
        if (v15 == -128)
        {
          int v17 = -128;
          goto LABEL_23;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_22:
  int v17 = 0;
LABEL_23:

  return v17;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end