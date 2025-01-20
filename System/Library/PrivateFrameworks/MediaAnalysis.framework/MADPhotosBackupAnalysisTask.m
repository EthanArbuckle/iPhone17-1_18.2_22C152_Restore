@interface MADPhotosBackupAnalysisTask
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8;
- (BOOL)_shouldPerformBackup;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosBackupAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8;
- (float)resourceRequirement;
- (id)_analysisSpecificFetchPropertySets;
- (id)cancelBlock;
- (int)_performBackup;
- (int)_performBackupAtFilepath:(id)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosBackupAnalysisTask

- (MADPhotosBackupAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  v17 = (Block_layout *)a6;
  v18 = (Block_layout *)a7;
  v19 = (Block_layout *)a8;
  v32.receiver = self;
  v32.super_class = (Class)MADPhotosBackupAnalysisTask;
  v20 = [(MADPhotosBackupAnalysisTask *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_photoLibrary, a3);
    v21->_taskID = a4;
    objc_storeStrong((id *)&v21->_encryptionManager, a5);
    if (v17) {
      v22 = v17;
    }
    else {
      v22 = &stru_10021C990;
    }
    v23 = objc_retainBlock(v22);
    id progressHandler = v21->_progressHandler;
    v21->_id progressHandler = v23;

    if (v18) {
      v25 = v18;
    }
    else {
      v25 = &stru_10021C9B0;
    }
    v26 = objc_retainBlock(v25);
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;

    if (v19) {
      v28 = v19;
    }
    else {
      v28 = &stru_10021C9D0;
    }
    v29 = objc_retainBlock(v28);
    id cancelBlock = v21->_cancelBlock;
    v21->_id cancelBlock = v29;
  }
  return v21;
}

+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 encryptionManager:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7 andCancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [objc_alloc((Class)a1) initWithPhotoLibrary:v14 forTaskID:a4 encryptionManager:v15 progressHandler:v16 completionHandler:v17 andCancelBlock:v18];

  return v19;
}

+ (id)taskName
{
  return @"MADPhotosBackupAnalysisTask";
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

- (id)_analysisSpecificFetchPropertySets
{
  if (self->_taskID == 2)
  {
    v4[0] = PHAssetPropertySetAesthetic;
    v4[1] = PHAssetPropertySetCuration;
    v4[2] = PHAssetPropertySetMediaAnalysis;
    v4[3] = PHAssetPropertySetSceneprint;
    v2 = +[NSArray arrayWithObjects:v4 count:4];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int)_performBackupAtFilepath:(id)a3
{
  id v58 = a3;
  NSFileAttributeKey v64 = NSFileProtectionKey;
  NSFileProtectionType v65 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v54 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v5 = +[NSFileManager defaultManager];
  context = v4;
  LOBYTE(v4) = [v5 createFileAtPath:v58 contents:0 attributes:v54];

  if (v4)
  {
    v52 = +[NSOutputStream outputStreamToFileAtPath:v58 append:0];
    [v52 open];
    v49 = +[VCPBackupFileHeader headerForTask:self->_taskID];
    int v55 = [v49 writeToStream:v52];
    if (v55)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v6 = VCPLogInstance();
        os_log_type_t v7 = VCPLogToOSLogType[3];
        v46 = v6;
        if (os_log_type_enabled(v6, v7))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "  Failed to write backup file header", buf, 2u);
        }
        goto LABEL_73;
      }
      goto LABEL_74;
    }
    v46 = +[VCPDataCompressor compressor];
    v48 = +[PHAsset vcp_fetchOptionsForLibrary:self->_photoLibrary forTaskID:self->_taskID];
    v10 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
    v63 = v10;
    v11 = +[NSArray arrayWithObjects:&v63 count:1];
    [v48 setSortDescriptors:v11];

    v12 = [(MADPhotosBackupAnalysisTask *)self _analysisSpecificFetchPropertySets];
    [v48 addFetchPropertySets:v12];

    v13 = +[PHAsset fetchAssetsWithOptions:v48];
    unint64_t v14 = 0;
    *(_DWORD *)&v45[8] = 0;
    uint64_t v53 = 0;
    int v55 = 0;
    os_log_type_t type = VCPLogToOSLogType[7];
    *(void *)v45 = VCPLogToOSLogType[3];
    os_log_type_t v47 = VCPLogToOSLogType[4];
    while (1)
    {
      if (v14 >= (unint64_t)[v13 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v38 = VCPLogInstance();
          os_log_type_t v39 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v38, v39))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v60 = *(void *)&v45[4];
            __int16 v61 = 2048;
            uint64_t v62 = v53;
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "  Backed up %zu/%zu analysis records", buf, 0x16u);
          }
        }
        [v52 close];
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_75:
        goto LABEL_76;
      }
      id v16 = [v13 objectAtIndexedSubscript:v14];
      if ((((int)v14 + 1) & 0x7FLL) == 0)
      {
        if ([(MADPhotosBackupAnalysisTask *)self isCancelled])
        {
          int v55 = -128;
          int v17 = 6;
          goto LABEL_62;
        }
        id v18 = +[VCPWatchdog sharedWatchdog];
        [v18 pet];
      }
      if (!objc_msgSend(v16, "vcp_needsProcessingForTask:", self->_taskID))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, type))
          {
            v22 = [v16 localIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = (uint64_t)v22;
            _os_log_impl((void *)&_mh_execute_header, v21, type, "  [%@] Performing backup", buf, 0xCu);
          }
        }
        v23 = [MADAssetProtoClassForTask(self->_taskID) protoFromPhotosAsset:v16];
        id v19 = v23;
        ++v53;
        if (v23)
        {
          v24 = [v23 data];
          if (v24)
          {
            v25 = +[VCPBackupEntryHeader header];
            if ((unint64_t)[v24 length] > 0x200000)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v26 = VCPLogInstance();
                if (os_log_type_enabled(v26, v47))
                {
                  v27 = [v16 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v60 = (uint64_t)v27;
                  _os_log_impl((void *)&_mh_execute_header, v26, v47, "  [%@] Serialized analysis exceeds per-entry limit; skipping",
                    buf,
                    0xCu);
                }
              }
              goto LABEL_41;
            }
            [v25 setDataLength:[v24 length]];
            unsigned int v30 = [v25 writeToStream:v52];
            if (v30)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v31 = VCPLogInstance();
                if (os_log_type_enabled(v31, (os_log_type_t)v45[0]))
                {
                  uint64_t v32 = [v16 localIdentifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v60 = v32;
                  v56 = (void *)v32;
                  _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v45[0], "  [%@] Failed to write backup entry header", buf, 0xCu);
                }
              }
              int v17 = 6;
              int v55 = v30;
            }
            else
            {
              v33 = v24;
              unsigned int v34 = objc_msgSend(v52, "vcp_writeBuffer:ofLength:", -[NSObject bytes](v33, "bytes"), -[NSObject length](v33, "length"));
              if (v34)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v35 = VCPLogInstance();
                  if (os_log_type_enabled(v35, (os_log_type_t)v45[0]))
                  {
                    uint64_t v36 = [v16 localIdentifier];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v60 = v36;
                    v57 = (void *)v36;
                    _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v45[0], "  [%@] Failed to write backup entry data", buf, 0xCu);
                  }
                }
                int v17 = 6;
                int v55 = v34;
              }
              else
              {
                int v17 = 0;
              }
              uint64_t v37 = *(void *)&v45[4];
              if (!v34) {
                uint64_t v37 = *(void *)&v45[4] + 1;
              }
              *(void *)&v45[4] = v37;
            }
LABEL_59:

LABEL_60:
            goto LABEL_61;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v25 = VCPLogInstance();
            if (os_log_type_enabled(v25, v47))
            {
              v29 = [v16 localIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v60 = (uint64_t)v29;
              _os_log_impl((void *)&_mh_execute_header, v25, v47, "  [%@] Failed to serialize asset; skipping",
                buf,
                0xCu);
            }
LABEL_41:
            int v17 = 13;
            goto LABEL_59;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_37;
          }
          v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, v47))
          {
            v28 = [v16 localIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = (uint64_t)v28;
            _os_log_impl((void *)&_mh_execute_header, v24, v47, "  [%@] Failed to create asset protobuf; skipping",
              buf,
              0xCu);
          }
        }
        int v17 = 13;
        goto LABEL_60;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, type))
        {
          v20 = [v16 localIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v60 = (uint64_t)v20;
          _os_log_impl((void *)&_mh_execute_header, v19, type, "  [%@] No analysis available; skipping", buf, 0xCu);
        }
LABEL_37:
        int v17 = 13;
LABEL_61:

        goto LABEL_62;
      }
      int v17 = 13;
LABEL_62:

      if (v17 && v17 != 13) {
        goto LABEL_72;
      }
      ++v14;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[3];
    v52 = v8;
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to create backup file", buf, 2u);
    }
    int v55 = -23;
    goto LABEL_75;
  }
  int v55 = -23;
LABEL_76:

  v40 = +[NSFileManager defaultManager];
  v41 = v40;
  if (v55
    && [v40 fileExistsAtPath:v58]
    && ([v41 removeItemAtPath:v58 error:0] & 1) == 0
    && (int)MediaAnalysisLogLevel() >= 4)
  {
    v42 = VCPLogInstance();
    os_log_type_t v43 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v42, v43))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "  Failed to delete intermediate file on aborted backup", buf, 2u);
    }
  }
  return v55;
}

- (BOOL)_shouldPerformBackup
{
  v3 = MADLastAnalysisBackupTimestampKeyForTask(self->_taskID);
  if (v3)
  {
    unsigned __int8 v4 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photoLibrary];
    id v5 = [v4 valueForKey:v3];
    if (!v5)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        BOOL v9 = 1;
LABEL_30:

        goto LABEL_31;
      }
      v6 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v6, v14))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v14, "  No last backup time; performing backup",
          (uint8_t *)&v21,
          2u);
      }
      BOOL v9 = 1;
LABEL_29:

      goto LABEL_30;
    }
    v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v5];
    os_log_type_t v7 = +[NSDate now];
    [v7 timeIntervalSinceDate:v6];
    BOOL v9 = v8 >= 1209600.0;
    if (v8 < 1209600.0)
    {
      [v7 timeIntervalSinceDate:v6];
      if (v15 < 0.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v16 = VCPLogInstance();
          os_log_type_t v17 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v16, v17))
          {
            int v21 = 138412290;
            v22 = v6;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "  Invalid backup date (%@); adjusting date and skipping backup",
              (uint8_t *)&v21,
              0xCu);
          }
        }
        id v18 = +[NSDate now];
        [v18 timeIntervalSinceReferenceDate];
        [v4 setValue:(uint64_t)v19 forKey:v3];

        [v4 commit];
        goto LABEL_28;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v10 = VCPLogInstance();
        os_log_type_t v11 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v10, v11))
        {
          int v21 = 138412290;
          v22 = v6;
          v12 = "  Analysis backup up-to-date (%@)";
          goto LABEL_26;
        }
LABEL_27:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v10, v11))
      {
        int v21 = 138412290;
        v22 = v6;
        v12 = "  Backup outdated (%@); performing backup";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v12, (uint8_t *)&v21, 0xCu);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
LABEL_28:

    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unsigned __int8 v4 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v4, v13))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v13, "  Unknown backup date key; skipping backup",
        (uint8_t *)&v21,
        2u);
    }
    BOOL v9 = 0;
    goto LABEL_30;
  }
  BOOL v9 = 0;
LABEL_31:

  return v9;
}

- (int)_performBackup
{
  if ([(MADPhotosBackupAnalysisTask *)self _shouldPerformBackup])
  {
    v3 = +[NSFileManager defaultManager];
    unsigned __int8 v4 = [(PHPhotoLibrary *)self->_photoLibrary vcp_mediaAnalysisBackupDirectory];
    if ([v3 fileExistsAtPath:v4])
    {
      id v5 = 0;
    }
    else
    {
      NSFileAttributeKey v79 = NSFilePosixPermissions;
      v80 = &off_10022DD08;
      v6 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      id v69 = 0;
      unsigned __int8 v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v69];
      id v8 = v69;

      if ((v7 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_69:

          return 0;
        }
        BOOL v9 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v9, v14))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, v14, "  Failed to create backup directory (%@); backup failed",
            (uint8_t *)&buf,
            0xCu);
        }
LABEL_68:

        goto LABEL_69;
      }
      id v5 = v8;
    }
    BOOL v9 = [(PHPhotoLibrary *)self->_photoLibrary vcp_mediaAnalysisIntermediateBackupDirectory];
    v10 = [(PHPhotoLibrary *)self->_photoLibrary mad_intermediateUnencryptedBackupFilepathForTask:self->_taskID];
    uint64_t v11 = [(PHPhotoLibrary *)self->_photoLibrary mad_intermediateEncryptedBackupFilepathForTask:self->_taskID];
    v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      if ([v3 fileExistsAtPath:v9])
      {
        if ([v3 fileExistsAtPath:v10])
        {
          id v67 = 0;
          unsigned int v13 = [v3 removeItemAtPath:v10 error:&v67];
          id v54 = v67;
          if (!v13) {
            goto LABEL_31;
          }
        }
        else
        {
          id v54 = 0;
        }
        if ([v3 fileExistsAtPath:v12])
        {
          id v66 = v54;
          unsigned __int8 v17 = [v3 removeItemAtPath:v12 error:&v66];
          id v18 = v66;

          id v54 = v18;
          if ((v17 & 1) == 0)
          {
LABEL_31:
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v26 = VCPLogInstance();
              os_log_type_t v27 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v26, v27))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v54;
                _os_log_impl((void *)&_mh_execute_header, v26, v27, "  Failed to remove existing intermediate backup (%@); backup failed",
                  (uint8_t *)&buf,
                  0xCu);
              }
            }
            goto LABEL_65;
          }
        }
      }
      else
      {
        NSFileAttributeKey v77 = NSFilePosixPermissions;
        v78 = &off_10022DD08;
        double v15 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        id v68 = v5;
        unsigned __int8 v16 = [v3 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v15 error:&v68];
        id v8 = v68;

        if ((v16 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v24 = VCPLogInstance();
            os_log_type_t v25 = VCPLogToOSLogType[3];
            id v54 = v24;
            if (os_log_type_enabled(v24, v25))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v8;
              _os_log_impl((void *)&_mh_execute_header, v24, v25, "  Failed to create intermediate backup directory (%@); backup failed",
                (uint8_t *)&buf,
                0xCu);
            }
            goto LABEL_66;
          }
LABEL_67:

          goto LABEL_68;
        }
        id v5 = v8;
      }
      if (self->_encryptionManager)
      {
        id v54 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photoLibrary];
        uint64_t v53 = MADLastAnalysisBackupTimestampKeyForTask(self->_taskID);
        double v19 = +[NSDate now];
        [v19 timeIntervalSinceReferenceDate];
        [v54 setValue:(uint64_t)v20 forKey:v53];

        [v54 commit];
        unsigned int v21 = [(MADPhotosBackupAnalysisTask *)self _performBackupAtFilepath:v10];
        if (v21)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v22 = VCPLogInstance();
            os_log_type_t v23 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v22, v23))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, v23, "  Failed to create backup file; backup failed (%d)",
                (uint8_t *)&buf,
                8u);
            }
          }
          goto LABEL_64;
        }
        uint64_t v62 = 0;
        v63 = &v62;
        uint64_t v64 = 0x2020000000;
        char v65 = 0;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_1000BBEBC;
        v60[3] = &unk_10021C9F8;
        id v49 = v10;
        id v61 = v49;
        v51 = objc_retainBlock(v60);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v73 = 0x3032000000;
        v74 = sub_1000BBF10;
        v75 = sub_1000BBF20;
        dispatch_semaphore_t v76 = dispatch_semaphore_create(0);
        encryptionManager = self->_encryptionManager;
        v31 = +[NSURL fileURLWithPath:v9];
        uint64_t v32 = +[NSURL fileURLWithPath:v12];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_1000BBF28;
        v59[3] = &unk_10021CA20;
        v59[4] = &v62;
        v59[5] = &buf;
        [(PFClientSideEncryptionManager *)encryptionManager archiveDirectoryAtURL:v31 toOutputURL:v32 dataType:1 options:0 entryPredicate:v51 completionHandler:v59];

        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*((void *)&buf + 1) + 40), 0xFFFFFFFFFFFFFFFFLL);
        id v58 = 0;
        LOBYTE(v32) = [v3 removeItemAtPath:v49 error:&v58];
        id v52 = v58;
        if ((v32 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
        {
          v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)v70 = 138412290;
            id v71 = v52;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "  Failed to remove intermediate unencrypted backup (%@)", v70, 0xCu);
          }
        }
        if (!*((unsigned char *)v63 + 24))
        {
LABEL_63:

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v62, 8);
LABEL_64:

LABEL_65:
          id v8 = v5;
LABEL_66:

          goto LABEL_67;
        }
        v48 = [(PHPhotoLibrary *)self->_photoLibrary mad_backupFilepathForTask:self->_taskID];
        if (objc_msgSend(v3, "fileExistsAtPath:"))
        {
          v35 = +[NSURL fileURLWithPath:v48];
          uint64_t v36 = +[NSURL fileURLWithPath:v12];
          id v57 = 0;
          unsigned __int8 v37 = [v3 replaceItemAtURL:v35 withItemAtURL:v36 backupItemName:0 options:0 resultingItemURL:0 error:&v57];
          id v50 = v57;

          if ((v37 & 1) == 0)
          {
LABEL_47:
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v38 = VCPLogInstance();
              os_log_type_t v39 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v38, v39))
              {
                *(_DWORD *)v70 = 138412290;
                id v71 = v50;
                _os_log_impl((void *)&_mh_execute_header, v38, v39, "  Failed to migrate file to backup directory (%@); backup failed",
                  v70,
                  0xCu);
              }
            }
            id v55 = v52;
            unsigned __int8 v40 = [v3 removeItemAtPath:v12 error:&v55];
            id v41 = v55;

            if ((v40 & 1) != 0 || (int)MediaAnalysisLogLevel() < 4)
            {
              id v52 = v41;
              goto LABEL_62;
            }
            v42 = VCPLogInstance();
            os_log_type_t v43 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v42, v43))
            {
              *(_DWORD *)v70 = 138412290;
              id v71 = v41;
              _os_log_impl((void *)&_mh_execute_header, v42, v43, "  Failed to remove intermediate encrypted backup (%@)", v70, 0xCu);
            }
            id v52 = v41;
            goto LABEL_60;
          }
        }
        else
        {
          id v56 = 0;
          unsigned int v44 = [v3 moveItemAtPath:v12 toPath:v48 error:&v56];
          id v50 = v56;
          if (!v44) {
            goto LABEL_47;
          }
        }
        if ((int)MediaAnalysisLogLevel() < 6)
        {
LABEL_62:

          goto LABEL_63;
        }
        v42 = VCPLogInstance();
        os_log_type_t v45 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v42, v45))
        {
          v46 = VCPTaskIDDescription(self->_taskID);
          *(_DWORD *)v70 = 138412290;
          id v71 = v46;
          _os_log_impl((void *)&_mh_execute_header, v42, v45, "  Successfully backed up %@", v70, 0xCu);
        }
LABEL_60:

        goto LABEL_62;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[3];
        id v54 = v28;
        if (os_log_type_enabled(v28, v29))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "  Unable to encrypt intermediate backup file; backup failed",
            (uint8_t *)&buf,
            2u);
        }
        goto LABEL_65;
      }
    }
    id v8 = v5;
    goto LABEL_67;
  }
  return 0;
}

- (int)run
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = [(id)objc_opt_class() taskName];
      v6 = VCPTaskIDDescription(self->_taskID);
      int v8 = 138412546;
      BOOL v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Attempting backup for %@", (uint8_t *)&v8, 0x16u);
    }
  }
  int result = [(PHPhotoLibrary *)self->_photoLibrary mad_isBackupRestoreEligibleForTask:self->_taskID];
  if (result) {
    return [(MADPhotosBackupAnalysisTask *)self _performBackup];
  }
  return result;
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
  objc_storeStrong((id *)&self->_encryptionManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end