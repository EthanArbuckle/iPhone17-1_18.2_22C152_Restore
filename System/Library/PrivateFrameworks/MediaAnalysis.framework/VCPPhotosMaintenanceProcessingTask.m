@interface VCPPhotosMaintenanceProcessingTask
+ (id)taskWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6;
+ (void)updateProgressForPhotoLibrary:(id)a3 cancelBlock:(id)a4;
- (BOOL)_shouldPerformBackup:(id)a3;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (VCPPhotosMaintenanceProcessingTask)init;
- (VCPPhotosMaintenanceProcessingTask)initWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6;
- (float)resourceRequirement;
- (id)_computeSyncPayloadForAsset:(id)a3 fromDatabase:(id)a4;
- (id)_legacyBackupFilepathForTask:(unint64_t)a3 withPhotoLibrary:(id)a4;
- (id)cancelBlock;
- (int)_backupFullAnalysisForPhotoLibrary:(id)a3;
- (int)_collectAndReportAnalysisProgress;
- (int)_createBackupAtFilepath:(id)a3 forPhotoLibrary:(id)a4;
- (int)_performComputeSyncBackfillForPhotoLibrary:(id)a3;
- (int)_performVideoEmbeddingVersionBackfillForPhotoLibrary:(id)a3;
- (int)_pruneProcessingStatusForPhotoLibrary:(id)a3;
- (int)performForceClusterIfNeededWithPhotoLibrary:(id)a3;
- (int)run;
- (void)_persistBackfillForAssets:(id)a3 photoLibrary:(id)a4 database:(id)a5;
- (void)_persistVideoEmbeddingBackfillForAssets:(id)a3 photoLibrary:(id)a4;
- (void)_removeLegacyBackupForTask:(unint64_t)a3 withPhotoLibrary:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setCancelBlock:(id)a3;
@end

@implementation VCPPhotosMaintenanceProcessingTask

- (VCPPhotosMaintenanceProcessingTask)init
{
  return 0;
}

- (VCPPhotosMaintenanceProcessingTask)initWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (Block_layout *)a5;
  v14 = (Block_layout *)a6;
  v26.receiver = self;
  v26.super_class = (Class)VCPPhotosMaintenanceProcessingTask;
  v15 = [(VCPPhotosMaintenanceProcessingTask *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photoLibraries, a3);
    id v17 = objc_retainBlock(v12);
    id progressHandler = v16->_progressHandler;
    v16->_id progressHandler = v17;

    if (v13) {
      v19 = v13;
    }
    else {
      v19 = &stru_10021E528;
    }
    v20 = objc_retainBlock(v19);
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v20;

    if (v14) {
      v22 = v14;
    }
    else {
      v22 = &stru_10021E548;
    }
    v23 = objc_retainBlock(v22);
    id cancelBlock = v16->_cancelBlock;
    v16->_id cancelBlock = v23;
  }
  return v16;
}

+ (id)taskWithPhotoLibraries:(id)a3 andProgressHandler:(id)a4 andCompletionHandler:(id)a5 andCancelBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibraries:v9 andProgressHandler:v10 andCompletionHandler:v11 andCancelBlock:v12];

  return v13;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0) {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPPhotosMaintenanceProcessingTask;
  [(VCPPhotosMaintenanceProcessingTask *)&v4 dealloc];
}

- (float)resourceRequirement
{
  return 1.0;
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

- (BOOL)_shouldPerformBackup:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSFileManager defaultManager];
  v5 = objc_msgSend(v3, "vcp_mediaAnalysisDatabaseFilepath");
  if ([v4 fileExistsAtPath:v5])
  {
    v6 = MADLastAnalysisBackupTimestampKeyForTask(1);
    if (v6)
    {
      v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v3];
      id v8 = [v7 valueForKey:v6];
      if (!v8)
      {
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          BOOL v19 = 1;
LABEL_66:

          goto LABEL_67;
        }
        id v9 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v9, v22))
        {
          LOWORD(v42) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, v22, "  No last backup time; performing backup",
            (uint8_t *)&v42,
            2u);
        }
        BOOL v19 = 1;
LABEL_65:

        goto LABEL_66;
      }
      id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v8];
      id v10 = +[NSDate now];
      id v11 = [v7 analysisRecordsModifiedSinceDate:v9];
      id v12 = [v7 valueForKey:@"HasDeletedAssetsSinceLastBackup"];
      [v10 timeIntervalSinceDate:v9];
      if (v13 < 1209600.0)
      {
        [v10 timeIntervalSinceDate:v9];
        if (v14 < 0.0)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v15 = VCPLogInstance();
            os_log_type_t v16 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v15, v16))
            {
              int v42 = 138412290;
              *(void *)v43 = v9;
              _os_log_impl((void *)&_mh_execute_header, v15, v16, "  Invalid backup date (%@); adjusting date and skipping backup",
                (uint8_t *)&v42,
                0xCu);
            }
          }
          id v17 = +[NSDate now];
          [v17 timeIntervalSinceReferenceDate];
          [v7 setValue:(uint64_t)v18 forKey:v6];

          [v7 commit];
          goto LABEL_11;
        }
        [v10 timeIntervalSinceDate:v9];
        if (v26 >= 604800.0)
        {
          if ((unint64_t)v11 >= 0xC8)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v23 = VCPLogInstance();
              os_log_type_t v34 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v23, v34))
              {
                int v42 = 67109378;
                *(_DWORD *)v43 = v11;
                *(_WORD *)&v43[4] = 2112;
                *(void *)&v43[6] = v9;
                v25 = "  Significant changes (%d) since last backup (%@); performing early backup";
                v35 = v23;
                os_log_type_t v36 = v34;
                uint32_t v37 = 18;
LABEL_51:
                _os_log_impl((void *)&_mh_execute_header, v35, v36, v25, (uint8_t *)&v42, v37);
                goto LABEL_52;
              }
              goto LABEL_52;
            }
LABEL_63:
            BOOL v19 = 1;
            goto LABEL_64;
          }
          if (v12)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v23 = VCPLogInstance();
              os_log_type_t v40 = VCPLogToOSLogType[6];
              if (!os_log_type_enabled(v23, v40)) {
                goto LABEL_52;
              }
              LOWORD(v42) = 0;
              v25 = "  Has asset deletion changes since last backup; performing early backup";
              v35 = v23;
              os_log_type_t v36 = v40;
              uint32_t v37 = 2;
              goto LABEL_51;
            }
            goto LABEL_63;
          }
        }
        [v10 timeIntervalSinceDate:v9];
        if (v27 >= 86400.0 && v12 != 0)
        {
          int v38 = MediaAnalysisLogLevel();
          if (v38 >= 6)
          {
            v23 = VCPLogInstance();
            os_log_type_t v24 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v23, v24))
            {
              int v42 = 138412290;
              *(void *)v43 = v9;
              v25 = "  Has asset deletion changes since last backup (%@); performing 1-day early backup";
              goto LABEL_50;
            }
LABEL_52:
            BOOL v19 = 1;
LABEL_53:

            goto LABEL_64;
          }
          goto LABEL_63;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v23 = VCPLogInstance();
          os_log_type_t v29 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v23, v29))
          {
            int v42 = 138412290;
            *(void *)v43 = v9;
            v30 = "  Analysis backup up-to-date (%@)";
            v31 = v23;
            os_log_type_t v32 = v29;
            uint32_t v33 = 12;
LABEL_57:
            _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, (uint8_t *)&v42, v33);
            goto LABEL_58;
          }
          goto LABEL_58;
        }
        goto LABEL_11;
      }
      if (v11)
      {
        if ((int)MediaAnalysisLogLevel() < 6) {
          goto LABEL_63;
        }
        v23 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[6];
        if (!os_log_type_enabled(v23, v24)) {
          goto LABEL_52;
        }
        int v42 = 138412290;
        *(void *)v43 = v9;
        v25 = "  Backup outdated (%@); performing backup";
      }
      else
      {
        if (!v12)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v23 = VCPLogInstance();
            os_log_type_t v39 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v23, v39))
            {
              int v42 = 67109634;
              *(_DWORD *)v43 = 0;
              *(_WORD *)&v43[4] = 1024;
              *(_DWORD *)&v43[6] = 0;
              *(_WORD *)&v43[10] = 2112;
              *(void *)&v43[12] = v9;
              v30 = "  Changes too few (%d, threshold: %d) since last backup (%@); skipping backup";
              v31 = v23;
              os_log_type_t v32 = v39;
              uint32_t v33 = 24;
              goto LABEL_57;
            }
LABEL_58:
            BOOL v19 = 0;
            goto LABEL_53;
          }
LABEL_11:
          BOOL v19 = 0;
LABEL_64:

          goto LABEL_65;
        }
        if ((int)MediaAnalysisLogLevel() < 6) {
          goto LABEL_63;
        }
        v23 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[6];
        if (!os_log_type_enabled(v23, v24)) {
          goto LABEL_52;
        }
        int v42 = 138412290;
        *(void *)v43 = v9;
        v25 = "  Has asset deletion changes since last backup (%@); performing backup";
      }
LABEL_50:
      v35 = v23;
      os_log_type_t v36 = v24;
      uint32_t v37 = 12;
      goto LABEL_51;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v21))
      {
        LOWORD(v42) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v21, "  Unknown backup date key; skipping backup",
          (uint8_t *)&v42,
          2u);
      }
      BOOL v19 = 0;
      goto LABEL_66;
    }
LABEL_20:
    BOOL v19 = 0;
LABEL_67:

    goto LABEL_68;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v6 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v20))
    {
      LOWORD(v42) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v20, "  No analysis database present; skipping backup",
        (uint8_t *)&v42,
        2u);
    }
    goto LABEL_20;
  }
  BOOL v19 = 0;
LABEL_68:

  return v19;
}

- (int)_createBackupAtFilepath:(id)a3 forPhotoLibrary:(id)a4
{
  id v71 = a3;
  id v68 = a4;
  NSFileAttributeKey v79 = NSFileProtectionKey;
  NSFileProtectionType v80 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v69 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v6 = +[NSFileManager defaultManager];
  context = v5;
  LOBYTE(v5) = [v6 createFileAtPath:v71 contents:0 attributes:v69];

  if (v5)
  {
    v65 = +[NSOutputStream outputStreamToFileAtPath:v71 append:0];
    [v65 open];
    v64 = +[VCPBackupFileHeader headerForTask:1];
    int v7 = [v64 writeToStream:v65];
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v8 = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[3];
        v70 = v8;
        if (os_log_type_enabled(v8, v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "  Failed to write backup file header", buf, 2u);
        }
        goto LABEL_99;
      }
      goto LABEL_100;
    }
    v70 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v68];
    v60 = +[PHAsset vcp_fetchOptionsForLibrary:v68 forTaskID:1];
    id v12 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
    v78 = v12;
    double v13 = +[NSArray arrayWithObjects:&v78 count:1];
    [v60 setSortDescriptors:v13];

    double v14 = +[PHAsset fetchAssetsWithOptions:v60];
    unint64_t v15 = 0;
    v56 = 0;
    uint64_t v62 = 0;
    int v7 = 0;
    os_log_type_t type = VCPLogToOSLogType[4];
    os_log_type_t v58 = VCPLogToOSLogType[3];
    os_log_type_t v61 = VCPLogToOSLogType[7];
    while (1)
    {
      if (v15 >= (unint64_t)[v14 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v45 = VCPLogInstance();
          os_log_type_t v46 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v45, v46))
          {
            *(_DWORD *)buf = 134218240;
            v75 = v56;
            __int16 v76 = 2048;
            *(void *)v77 = v62;
            _os_log_impl((void *)&_mh_execute_header, v45, v46, "  Backed up %zu/%zu full analysis records", buf, 0x16u);
          }
        }
        [v65 close];
LABEL_98:

LABEL_99:
LABEL_100:

LABEL_101:
        goto LABEL_102;
      }
      id v17 = [v14 objectAtIndexedSubscript:v15];
      if ((((int)v15 + 1) & 0x7FLL) != 0) {
        goto LABEL_18;
      }
      if (![(VCPPhotosMaintenanceProcessingTask *)self isCancelled]) {
        break;
      }
      int v7 = -128;
      unsigned int v18 = 6;
LABEL_88:

      if (v18 && v18 != 13) {
        goto LABEL_98;
      }
      ++v15;
    }
    BOOL v19 = +[VCPWatchdog sharedWatchdog];
    [v19 pet];

LABEL_18:
    os_log_type_t v20 = [v17 localIdentifier];
    id v73 = 0;
    unsigned int v21 = [v70 analysisForAsset:v20 analysis:&v73];
    id v22 = v73;
    v23 = v22;
    if (v21)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        os_log_type_t v24 = VCPLogInstance();
        if (!os_log_type_enabled(v24, type))
        {
LABEL_24:
          unsigned int v18 = 13;
LABEL_86:

          goto LABEL_87;
        }
        *(_DWORD *)buf = 138412290;
        v75 = v20;
        v25 = v24;
        os_log_type_t v26 = type;
        double v27 = "  [%@] Failed to query analysis";
        goto LABEL_22;
      }
      goto LABEL_33;
    }
    if (!v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v24 = VCPLogInstance();
        if (!os_log_type_enabled(v24, v61)) {
          goto LABEL_24;
        }
        *(_DWORD *)buf = 138412290;
        v75 = v20;
        v25 = v24;
        os_log_type_t v26 = v61;
        double v27 = "  [%@] No analysis available; skipping";
LABEL_22:
        uint32_t v28 = 12;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v27, buf, v28);
        goto LABEL_24;
      }
LABEL_33:
      unsigned int v18 = 13;
LABEL_87:

      goto LABEL_88;
    }
    if ((int)objc_msgSend(v22, "vcp_version") < 7)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v24 = VCPLogInstance();
        if (!os_log_type_enabled(v24, v61)) {
          goto LABEL_24;
        }
        unsigned int v29 = objc_msgSend(v23, "vcp_version");
        *(_DWORD *)buf = 138412546;
        v75 = v20;
        __int16 v76 = 1024;
        *(_DWORD *)v77 = v29;
        v25 = v24;
        os_log_type_t v26 = v61;
        double v27 = "  [%@] Deprecated analysis version (%d); skipping";
        uint32_t v28 = 18;
        goto LABEL_23;
      }
      goto LABEL_33;
    }
    id v72 = 0;
    uint64_t v30 = objc_msgSend(v68, "mad_cloudIdentifierForLocalIdentifier:error:", v20, &v72);
    os_log_type_t v24 = v72;
    v59 = (void *)v30;
    if (v30)
    {
      if (([v17 isPhoto] & 1) != 0
        || [v17 isVideo] && objc_msgSend(v23, "vcp_degraded"))
      {
        v31 = +[VCPProtoAssetAnalysis imageAnalysisFromLegacyDictionary:v23 assetCloudIdentifier:v30];
      }
      else
      {
        if (![v17 isVideo])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            os_log_type_t v32 = VCPLogInstance();
            if (os_log_type_enabled(v32, v58))
            {
              unsigned int v38 = [v17 mediaType];
              unsigned int v39 = [v17 mediaSubtypes];
              *(_DWORD *)buf = 138412802;
              v75 = v20;
              __int16 v76 = 1024;
              *(_DWORD *)v77 = v38;
              *(_WORD *)&v77[4] = 1024;
              *(_DWORD *)&v77[6] = v39;
              uint32_t v33 = v32;
              os_log_type_t v34 = v58;
              v35 = "  [%@] Invalid asset (media type %d, subtype %d) for backup; skipping";
              uint32_t v36 = 24;
              goto LABEL_61;
            }
            goto LABEL_62;
          }
          goto LABEL_63;
        }
        v31 = +[VCPProtoAssetAnalysis movieAnalysisFromLegacyDictionary:v23 assetCloudIdentifier:v30];
      }
      os_log_type_t v32 = v31;
      if (v31)
      {
        [v31 setAssetIdentifier:v20];
        id v57 = [v32 data];
        if (v57)
        {
          os_log_t log = +[VCPBackupEntryHeader header];
          if ((unint64_t)[v57 length] <= 0x200000)
          {
            -[NSObject setDataLength:](log, "setDataLength:", [v57 length]);
            unsigned int v52 = [log writeToStream:v65];
            if (v52)
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                os_log_type_t v40 = VCPLogInstance();
                if (os_log_type_enabled(v40, v58))
                {
                  *(_DWORD *)buf = 138412290;
                  v75 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v40, v58, " [%@] Failed to write backup entry header", buf, 0xCu);
                }
              }
              unsigned int v18 = 6;
              int v7 = v52;
            }
            else
            {
              id v53 = v57;
              unsigned int v18 = objc_msgSend(v65, "vcp_writeBuffer:ofLength:", objc_msgSend(v53, "bytes"), objc_msgSend(v53, "length"));
              if (v18)
              {
                if ((int)MediaAnalysisLogLevel() < 3)
                {
                  unsigned int v42 = v18;
                  unsigned int v18 = 6;
                }
                else
                {
                  v41 = VCPLogInstance();
                  unsigned int v54 = v18;
                  if (os_log_type_enabled(v41, v58))
                  {
                    *(_DWORD *)buf = 138412290;
                    v75 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v41, v58, " [%@] Failed to write backup entry data", buf, 0xCu);
                  }

                  unsigned int v18 = 6;
                  unsigned int v42 = v54;
                }
                int v7 = v42;
              }
              else
              {
                unsigned int v42 = 0;
              }
              BOOL v43 = v42 == 0;
              v44 = v56;
              if (v43) {
                v44 = v56 + 1;
              }
              v56 = v44;
            }
            goto LABEL_82;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            uint32_t v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, type))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v20;
              _os_log_impl((void *)&_mh_execute_header, v37, type, "  [%@] Serialized analysis exceeds per-entry limit; skipping",
                buf,
                0xCu);
            }
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            unsigned int v18 = 13;
LABEL_83:

            goto LABEL_84;
          }
          VCPLogInstance();
          os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, v58))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v20;
            _os_log_impl((void *)&_mh_execute_header, log, v58, "  [%@] Failed to serialize asset analysis; skipping",
              buf,
              0xCu);
          }
        }
        unsigned int v18 = 13;
LABEL_82:

        goto LABEL_83;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, v58))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v20;
          uint32_t v33 = v32;
          os_log_type_t v34 = v58;
          v35 = "  [%@] Failed to convert asset analysis; skipping";
          uint32_t v36 = 12;
          goto LABEL_61;
        }
        goto LABEL_62;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, v58))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v20;
        __int16 v76 = 2112;
        *(void *)v77 = v24;
        uint32_t v33 = v32;
        os_log_type_t v34 = v58;
        v35 = "  [%@] Failed to fetch asset's cloud identifier: %@; skipping";
        uint32_t v36 = 22;
LABEL_61:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v35, buf, v36);
      }
LABEL_62:
      unsigned int v18 = 13;
LABEL_84:

      goto LABEL_85;
    }
LABEL_63:
    unsigned int v18 = 13;
LABEL_85:

    ++v62;
    goto LABEL_86;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[3];
    v65 = v10;
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "  Failed to create backup file", buf, 2u);
    }
    int v7 = -23;
    goto LABEL_101;
  }
  int v7 = -23;
LABEL_102:

  v47 = +[NSFileManager defaultManager];
  v48 = v47;
  if (v7
    && [v47 fileExistsAtPath:v71]
    && ([v48 removeItemAtPath:v71 error:0] & 1) == 0
    && (int)MediaAnalysisLogLevel() >= 4)
  {
    v49 = VCPLogInstance();
    os_log_type_t v50 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "  Failed to delete intermediate file on aborted backup", buf, 2u);
    }
  }
  return v7;
}

- (int)_backupFullAnalysisForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = [v4 photoLibraryURL];
      id v8 = [v7 absoluteString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Checking full analysis backup for PHPhotoLibrary (%@) ... ", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([(VCPPhotosMaintenanceProcessingTask *)self _shouldPerformBackup:v4])
  {
    os_log_type_t v9 = +[NSFileManager defaultManager];
    id v10 = objc_msgSend(v4, "vcp_mediaAnalysisBackupDirectory");
    if ([v9 fileExistsAtPath:v10])
    {
      os_log_type_t v11 = 0;
    }
    else
    {
      NSFileAttributeKey v85 = NSFilePosixPermissions;
      v86 = &off_10022F328;
      id v12 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      id v75 = 0;
      unsigned __int8 v13 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:v12 error:&v75];
      id v14 = v75;

      if ((v13 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_70:

          goto LABEL_71;
        }
        unint64_t v15 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v15, v21))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, v21, "  Failed to create backup directory (%@); backup failed",
            (uint8_t *)&buf,
            0xCu);
        }
LABEL_69:

        goto LABEL_70;
      }
      os_log_type_t v11 = v14;
    }
    unint64_t v15 = objc_msgSend(v4, "vcp_mediaAnalysisIntermediateBackupDirectory");
    os_log_type_t v16 = objc_msgSend(v4, "mad_intermediateUnencryptedBackupFilepathForTask:", 1);
    uint64_t v17 = objc_msgSend(v4, "mad_intermediateEncryptedBackupFilepathForTask:", 1);
    unsigned int v18 = (void *)v17;
    if (v15 && v16 && v17)
    {
      v60 = (void *)v17;
      if ([v9 fileExistsAtPath:v15])
      {
        if ([v9 fileExistsAtPath:v16])
        {
          id v73 = 0;
          unsigned int v19 = [v9 removeItemAtPath:v16 error:&v73];
          os_log_type_t v20 = v73;
          if (!v19)
          {
LABEL_35:
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              os_log_type_t v32 = VCPLogInstance();
              os_log_type_t v33 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v32, v33))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v20;
                _os_log_impl((void *)&_mh_execute_header, v32, v33, "  Failed to remove existing intermediate backup (%@); backup failed",
                  (uint8_t *)&buf,
                  0xCu);
              }
            }
            id v14 = v11;
            goto LABEL_67;
          }
        }
        else
        {
          os_log_type_t v20 = 0;
        }
        if ([v9 fileExistsAtPath:v60])
        {
          id v72 = v20;
          unsigned __int8 v24 = [v9 removeItemAtPath:v60 error:&v72];
          v25 = v72;

          os_log_type_t v20 = v25;
          if ((v24 & 1) == 0) {
            goto LABEL_35;
          }
        }

LABEL_27:
        v59 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
        os_log_type_t v58 = MADLastAnalysisBackupTimestampKeyForTask(1);
        os_log_type_t v26 = +[NSDate now];
        [v26 timeIntervalSinceReferenceDate];
        [v59 setValue:(uint64_t)v27 forKey:v58];

        [v59 commit];
        unsigned int v28 = [(VCPPhotosMaintenanceProcessingTask *)self _createBackupAtFilepath:v16 forPhotoLibrary:v4];
        if (v28)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            unsigned int v29 = VCPLogInstance();
            os_log_type_t v30 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v29, v30))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v28;
              _os_log_impl((void *)&_mh_execute_header, v29, v30, "  Failed to create backup file; backup failed (%d)",
                (uint8_t *)&buf,
                8u);
            }
          }
          goto LABEL_66;
        }
        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        char v71 = 0;
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1001307F4;
        v66[3] = &unk_10021C9F8;
        id v55 = v16;
        id v67 = v55;
        id v57 = objc_retainBlock(v66);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v79 = 0x3032000000;
        NSFileProtectionType v80 = sub_100130848;
        v81 = sub_100130858;
        dispatch_semaphore_t v82 = dispatch_semaphore_create(0);
        encryptionManager = self->_encryptionManager;
        v35 = +[NSURL fileURLWithPath:v15];
        uint32_t v36 = +[NSURL fileURLWithPath:v60];
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_100130860;
        v65[3] = &unk_10021CA20;
        v65[4] = &v68;
        v65[5] = &buf;
        [(PFClientSideEncryptionManager *)encryptionManager archiveDirectoryAtURL:v35 toOutputURL:v36 dataType:1 options:0 entryPredicate:v57 completionHandler:v65];

        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*((void *)&buf + 1) + 40), 0xFFFFFFFFFFFFFFFFLL);
        id v64 = 0;
        unsigned __int8 v37 = [v9 removeItemAtPath:v55 error:&v64];
        id v38 = v64;
        if ((v37 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
        {
          unsigned int v39 = VCPLogInstance();
          os_log_type_t v40 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)__int16 v76 = 138412290;
            id v77 = v38;
            _os_log_impl((void *)&_mh_execute_header, v39, v40, "  Failed to remove intermediate unencrypted backup (%@)", v76, 0xCu);
          }
        }
        if (!*((unsigned char *)v69 + 24))
        {
LABEL_65:

          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v68, 8);
LABEL_66:

          id v14 = v11;
          os_log_type_t v20 = v59;
LABEL_67:

          unsigned int v18 = v60;
          goto LABEL_68;
        }
        unsigned int v54 = objc_msgSend(v4, "vcp_mediaAnalysisBackupFilepath");
        if (objc_msgSend(v9, "fileExistsAtPath:"))
        {
          v41 = +[NSURL fileURLWithPath:v54];
          unsigned int v42 = +[NSURL fileURLWithPath:v60];
          id v63 = 0;
          unsigned __int8 v43 = [v9 replaceItemAtURL:v41 withItemAtURL:v42 backupItemName:0 options:0 resultingItemURL:0 error:&v63];
          id v56 = v63;

          if ((v43 & 1) == 0)
          {
LABEL_48:
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v44 = VCPLogInstance();
              os_log_type_t v45 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v44, v45))
              {
                *(_DWORD *)__int16 v76 = 138412290;
                id v77 = v56;
                _os_log_impl((void *)&_mh_execute_header, v44, v45, "  Failed to migrate file to backup directory (%@); backup failed",
                  v76,
                  0xCu);
              }
            }
            id v61 = v38;
            unsigned __int8 v46 = [v9 removeItemAtPath:v60 error:&v61];
            id v47 = v61;

            if ((v46 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
            {
              v48 = VCPLogInstance();
              os_log_type_t v49 = VCPLogToOSLogType[4];
              if (os_log_type_enabled(v48, v49))
              {
                *(_DWORD *)__int16 v76 = 138412290;
                id v77 = v47;
                _os_log_impl((void *)&_mh_execute_header, v48, v49, "  Failed to remove intermediate encrypted backup (%@)", v76, 0xCu);
              }
            }
            id v38 = v47;
LABEL_64:

            goto LABEL_65;
          }
        }
        else
        {
          id v62 = 0;
          unsigned int v50 = [v9 moveItemAtPath:v60 toPath:v54 error:&v62];
          id v56 = v62;
          if (!v50) {
            goto LABEL_48;
          }
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v51 = VCPLogInstance();
          os_log_type_t v52 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v51, v52))
          {
            *(_WORD *)__int16 v76 = 0;
            _os_log_impl((void *)&_mh_execute_header, v51, v52, "  Successfully backed up analysis database", v76, 2u);
          }
        }
        [v59 removeKey:@"HasDeletedAssetsSinceLastBackup"];
        [v59 commit];
        goto LABEL_64;
      }
      NSFileAttributeKey v83 = NSFilePosixPermissions;
      v84 = &off_10022F328;
      id v22 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      id v74 = v11;
      unsigned __int8 v23 = [v9 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v22 error:&v74];
      id v14 = v74;

      if (v23)
      {
        os_log_type_t v11 = v14;
        goto LABEL_27;
      }
      unsigned int v18 = v60;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v20 = VCPLogInstance();
        os_log_type_t v31 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v31))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl((void *)&_mh_execute_header, v20, v31, "  Failed to create intermediate backup directory (%@); backup failed",
            (uint8_t *)&buf,
            0xCu);
        }
        goto LABEL_67;
      }
    }
    else
    {
      id v14 = v11;
    }
LABEL_68:

    goto LABEL_69;
  }
LABEL_71:

  return 0;
}

+ (void)updateProgressForPhotoLibrary:(id)a3 cancelBlock:(id)a4
{
  id v5 = a3;
  os_log_type_t v6 = (unsigned int (**)(void))a4;
  int v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v5];
  if ([v5 isSystemPhotoLibrary])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = [&off_1002305D8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (!v8) {
      goto LABEL_20;
    }
    uint64_t v9 = *(void *)v22;
    os_log_type_t type = VCPLogToOSLogType[5];
    while (1)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(&off_1002305D8);
        }
        os_log_type_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        if (!v6 || !v6[2](v6))
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100130CC0;
          v18[3] = &unk_10021BF40;
          unsigned int v19 = v6;
          unint64_t v15 = objc_retainBlock(v18);
          +[MADProgressManager updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:](MADProgressManager, "updateProgressForTask:photoLibrary:reuseCachedValue:cancelOrExtendTimeoutBlock:", (int)[v11 intValue], v5, 1, v15);

          int v14 = 1;
          unsigned __int8 v13 = v19;
LABEL_14:

          goto LABEL_15;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          unsigned __int8 v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, type))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, type, "Progress update canceled", buf, 2u);
          }
          int v14 = 0;
          goto LABEL_14;
        }
        int v14 = 0;
LABEL_15:
        if (!v14) {
          goto LABEL_20;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v16 = [&off_1002305D8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v8 = v16;
      if (!v16)
      {
LABEL_20:
        [v7 removeProgressEntriesBeyondLimits];
        [v7 commit];
        break;
      }
    }
  }
}

- (int)_collectAndReportAnalysisProgress
{
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obj = self->_photoLibraries;
  int v3 = 0;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v4)
  {
    uint64_t v52 = *(void *)v58;
    os_log_type_t type = VCPLogToOSLogType[6];
    os_log_type_t v49 = VCPLogToOSLogType[4];
    os_log_type_t v45 = VCPLogToOSLogType[5];
    os_log_type_t v46 = VCPLogToOSLogType[3];
    os_log_type_t v42 = VCPLogToOSLogType[7];
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v58 != v52) {
          objc_enumerationMutation(obj);
        }
        os_log_type_t v6 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
        {
          int v8 = 1;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            uint64_t v9 = VCPLogInstance();
            if (os_log_type_enabled(v9, type))
            {
              id v10 = [v6 photoLibraryURL];
              os_log_type_t v11 = [v10 path];
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v11;
              _os_log_impl((void *)&_mh_execute_header, v9, type, "Reporting analysis progress for PHPhotoLibrary (%@) ... ", buf, 0xCu);
            }
          }
          if (+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v6])
          {
            id v12 = objc_opt_class();
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_100131804;
            v56[3] = &unk_100219D98;
            v56[4] = self;
            [v12 updateProgressForPhotoLibrary:v6 cancelBlock:v56];
            if ([v6 isSystemPhotoLibrary])
            {
              v55[0] = _NSConcreteStackBlock;
              v55[1] = 3221225472;
              v55[2] = sub_100131860;
              v55[3] = &unk_100219D98;
              v55[4] = self;
              int v3 = VCPCoreAnalyticsReportEventBackgroundDailyReport(v55, v6);
              if (v3)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  unsigned __int8 v13 = VCPLogInstance();
                  if (os_log_type_enabled(v13, v46))
                  {
                    int v14 = [v6 photoLibraryURL];
                    unint64_t v15 = [v14 path];
                    *(_DWORD *)long long buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v3;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v15;
                    _os_log_impl((void *)&_mh_execute_header, v13, v46, "Error(%d) during daily reporting for lib %@", buf, 0x12u);
                  }
                }
              }
            }
            id v16 = +[VCPDataCollectionTask taskWithPhotoLibrary:v6];
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_1001318BC;
            v54[3] = &unk_100219D98;
            v54[4] = self;
            [v16 setCancel:v54];
            [v16 start];
            if ([v16 error] == -128)
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                uint64_t v17 = VCPLogInstance();
                if (os_log_type_enabled(v17, type))
                {
                  unsigned int v18 = [v6 photoLibraryURL];
                  unsigned int v19 = [v18 path];
                  *(_DWORD *)long long buf = 138412290;
                  *(void *)&uint8_t buf[4] = v19;
                  _os_log_impl((void *)&_mh_execute_header, v17, type, "Cancelled progress report for %@", buf, 0xCu);
                }
              }
              int v3 = -128;
              int v8 = 2;
            }
            else
            {
              if ([v16 error])
              {
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  long long v21 = VCPLogInstance();
                  if (os_log_type_enabled(v21, v45))
                  {
                    unsigned int v22 = [v16 error];
                    long long v23 = [v6 photoLibraryURL];
                    long long v24 = [v23 path];
                    *(_DWORD *)long long buf = 67109378;
                    *(_DWORD *)&uint8_t buf[4] = v22;
                    *(_WORD *)&buf[8] = 2112;
                    *(void *)&buf[10] = v24;
                    _os_log_impl((void *)&_mh_execute_header, v21, v45, "Error(%d) during progress report for %@", buf, 0x12u);
                  }
                }
                int v3 = -18;
              }
              if (objc_msgSend(v6, "mad_useVUGallery")
                && (objc_msgSend(v6, "vcp_isSyndicationLibrary") & 1) == 0)
              {
                id v47 = objc_msgSend(v6, "vcp_visionCacheStorageDirectoryURL");
                uint64_t v61 = 0;
                id v62 = &v61;
                uint64_t v63 = 0x2050000000;
                v25 = (void *)qword_100252788;
                uint64_t v64 = qword_100252788;
                if (!qword_100252788)
                {
                  *(void *)long long buf = _NSConcreteStackBlock;
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = sub_10013530C;
                  id v67 = &unk_100219E10;
                  uint64_t v68 = &v61;
                  sub_10013530C((uint64_t)buf);
                  v25 = (void *)v62[3];
                }
                os_log_type_t v26 = v25;
                _Block_object_dispose(&v61, 8);
                id v27 = [v26 alloc];
                uint64_t v61 = 0;
                id v62 = &v61;
                uint64_t v63 = 0x2050000000;
                unsigned int v28 = (void *)qword_100252798;
                uint64_t v64 = qword_100252798;
                if (!qword_100252798)
                {
                  *(void *)long long buf = _NSConcreteStackBlock;
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = sub_1001354D4;
                  id v67 = &unk_100219E10;
                  uint64_t v68 = &v61;
                  sub_1001354D4((uint64_t)buf);
                  unsigned int v28 = (void *)v62[3];
                }
                id v29 = v28;
                _Block_object_dispose(&v61, 8);
                os_log_type_t v30 = [v29 photos];
                id v53 = 0;
                id v48 = [v27 initWithClient:v30 version:1 url:v47 error:&v53];
                id v44 = v53;

                if (v48)
                {
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    os_log_type_t v31 = VCPLogInstance();
                    if (os_log_type_enabled(v31, v42))
                    {
                      os_log_type_t v32 = [v6 photoLibraryURL];
                      *(_DWORD *)long long buf = 138412290;
                      *(void *)&uint8_t buf[4] = v32;
                      _os_log_impl((void *)&_mh_execute_header, v31, v42, "  Reporting VUGallery metrics for library %@", buf, 0xCu);
                    }
                  }
                  uint64_t v43 = mach_absolute_time();
                  os_log_type_t v33 = VCPSignPostLog();
                  os_signpost_id_t v34 = os_signpost_id_generate(v33);

                  v35 = VCPSignPostLog();
                  uint32_t v36 = v35;
                  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MADReportVUGalleryMetric", (const char *)&unk_1001F3BD3, buf, 2u);
                  }

                  unsigned __int8 v37 = [v48 gallery];
                  [v37 reportMetrics];

                  id v38 = VCPSignPostLog();
                  unsigned int v39 = v38;
                  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v34, "MADReportVUGalleryMetric", (const char *)&unk_1001F3BD3, buf, 2u);
                  }

                  if (v43)
                  {
                    mach_absolute_time();
                    VCPPerformance_LogMeasurement();
                  }
                }
                else if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  os_log_type_t v40 = VCPLogInstance();
                  if (os_log_type_enabled(v40, v46))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)&uint8_t buf[4] = v44;
                    _os_log_impl((void *)&_mh_execute_header, v40, v46, "Failed to create MADGDVisualUnderstandingService instance - %@", buf, 0xCu);
                  }
                }
              }
              MediaAnalysisDaemonReleaseSharedDataStores(v6);
              int v8 = 0;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              os_log_type_t v20 = VCPLogInstance();
              if (os_log_type_enabled(v20, v49))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, v49, "MAD database does not exist, skip progress reporting and data collection", buf, 2u);
              }
            }
            int v8 = 3;
          }
        }
        if (v8 != 3 && v8)
        {

          if (v8 != 2) {
            return -128;
          }
          return v3;
        }
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  return v3;
}

- (id)_legacyBackupFilepathForTask:(unint64_t)a3 withPhotoLibrary:(id)a4
{
  id v5 = objc_msgSend(a4, "vcp_mediaAnalysisBackupDirectory");
  os_log_type_t v6 = v5;
  if (v5)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v7 = @"mediaanalysis.backup";
        goto LABEL_8;
      case 0xAuLL:
        CFStringRef v7 = @"ocranalysis.backup";
        goto LABEL_8;
      case 2uLL:
        CFStringRef v7 = @"sceneanalysis.backup";
LABEL_8:
        int v8 = [v5 stringByAppendingPathComponent:v7];
        goto LABEL_14;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v9, v10))
      {
        v12[0] = 67109120;
        v12[1] = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unexpected taskID %d", (uint8_t *)v12, 8u);
      }
    }
  }
  int v8 = 0;
LABEL_14:

  return v8;
}

- (void)_removeLegacyBackupForTask:(unint64_t)a3 withPhotoLibrary:(id)a4
{
  id v5 = [(VCPPhotosMaintenanceProcessingTask *)self _legacyBackupFilepathForTask:a3 withPhotoLibrary:a4];
  if (v5)
  {
    os_log_type_t v6 = +[NSFileManager defaultManager];
    if ([v6 fileExistsAtPath:v5])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        CFStringRef v7 = VCPLogInstance();
        os_log_type_t v8 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = VCPTaskIDDescription(a3);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Removing existing legacy backup for %@", buf, 0xCu);
        }
      }
      id v15 = 0;
      unsigned __int8 v10 = [v6 removeItemAtPath:v5 error:&v15];
      id v11 = v15;
      if ((v10 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
      {
        id v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v12, v13))
        {
          int v14 = VCPTaskIDDescription(a3);
          *(_DWORD *)long long buf = 138412546;
          uint64_t v17 = v14;
          __int16 v18 = 2112;
          id v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to remove legacy backup for %@ (%@)", buf, 0x16u);
        }
      }
    }
    else
    {
      id v11 = 0;
    }
  }
}

- (id)_computeSyncPayloadForAsset:(id)a3 fromDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "vcp_needsFullAnalysisProcessing:", 0))
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      id v15 = 0;
      goto LABEL_38;
    }
    CFStringRef v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = [v5 localIdentifier];
      *(_DWORD *)long long buf = 138412290;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[ComputeSync|Backfill][%@] Unprocessed for full analysis, unable to generate payload", buf, 0xCu);
    }
    goto LABEL_21;
  }
  unsigned __int8 v10 = [v5 localIdentifier];
  id v33 = 0;
  unsigned int v11 = [v6 analysisForAsset:v10 analysis:&v33];
  CFStringRef v7 = v33;

  if (!v11)
  {
    if (!v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v12 = VCPLogInstance();
        os_log_type_t v23 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v12, v23))
        {
          long long v24 = [v5 localIdentifier];
          *(_DWORD *)long long buf = 138412290;
          v35 = v24;
          _os_log_impl((void *)&_mh_execute_header, v12, v23, "[ComputeSync|Backfill][%@] No full analysis results available, unable to generate payload", buf, 0xCu);
        }
        goto LABEL_35;
      }
      goto LABEL_21;
    }
    if ([v5 isVideo])
    {
      id v16 = VCPSignPostLog();
      os_signpost_id_t v17 = os_signpost_id_generate(v16);

      __int16 v18 = VCPSignPostLog();
      id v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADMaintenanceBackfill_Movie_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v12 = +[VCPProtoAssetAnalysis movieAnalysisComputeSyncPayloadFromLegacyDictionary:v7];
      os_log_type_t v20 = VCPSignPostLog();
      long long v21 = v20;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v20)) {
        goto LABEL_29;
      }
      *(_WORD *)long long buf = 0;
      unsigned int v22 = "MADMaintenanceBackfill_Movie_PackComputeSyncPayload";
    }
    else
    {
      v25 = VCPSignPostLog();
      os_signpost_id_t v17 = os_signpost_id_generate(v25);

      os_log_type_t v26 = VCPSignPostLog();
      id v27 = v26;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MADMaintenanceBackfill_Image_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v12 = +[VCPProtoAssetAnalysis imageAnalysisComputeSyncPayloadFromLegacyDictionary:v7];
      unsigned int v28 = VCPSignPostLog();
      long long v21 = v28;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
        goto LABEL_29;
      }
      *(_WORD *)long long buf = 0;
      unsigned int v22 = "MADMaintenanceBackfill_Image_PackComputeSyncPayload";
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v17, v22, (const char *)&unk_1001F3BD3, buf, 2u);
LABEL_29:

    if (v12)
    {
      id v15 = [v12 data];
LABEL_36:

      goto LABEL_37;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        os_log_type_t v31 = [v5 localIdentifier];
        *(_DWORD *)long long buf = 138412290;
        v35 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[ComputeSync|Backfill][%@] Failed to serialize full analysis results as payload", buf, 0xCu);
      }
    }
LABEL_35:
    id v15 = 0;
    goto LABEL_36;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v12, v13))
    {
      int v14 = [v5 localIdentifier];
      *(_DWORD *)long long buf = 138412290;
      v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[ComputeSync|Backfill][%@] Failed to query full analysis results, unable to generate payload", buf, 0xCu);
    }
    goto LABEL_35;
  }
LABEL_21:
  id v15 = 0;
LABEL_37:

LABEL_38:
  return v15;
}

- (void)_persistBackfillForAssets:(id)a3 photoLibrary:(id)a4 database:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unsigned int v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)long long buf = 134217984;
      id v25 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[ComputeSync|Backfill] Persisting %lu assets", buf, 0xCu);
    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100132484;
  v20[3] = &unk_10021BF68;
  id v13 = v8;
  id v21 = v13;
  unsigned int v22 = self;
  id v14 = v10;
  id v23 = v14;
  id v19 = 0;
  [v9 performChangesAndWait:v20 error:&v19];
  id v15 = v19;
  if (v15 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = [v13 count];
      *(_DWORD *)long long buf = 134218242;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[ComputeSync|Backfill] Failed to persist stages/payload for %lu results to Photos (%@)", buf, 0x16u);
    }
  }
}

- (int)_performComputeSyncBackfillForPhotoLibrary:(id)a3
{
  id v45 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      int v9 = 0;
      goto LABEL_49;
    }
    id v4 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v10))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v10, "[ComputeSync|Backfill] Feature flag Photos/CloudComputeStateSync not enabled; skipping",
        buf,
        2u);
    }
LABEL_10:
    int v9 = 0;
    goto LABEL_48;
  }
  id v4 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v45];
  id v5 = [v4 valueForKey:@"LastComputeSyncBackfillTimestamp"];
  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v44 = v4;
      id v6 = VCPLogInstance();
      os_log_type_t v7 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v6, v7))
      {
        id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v5];
        *(_DWORD *)long long buf = 138412290;
        id v47 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "[ComputeSync|Backfill] Last backfilled on %@; skipping",
          buf,
          0xCu);
      }
      int v9 = 0;
      goto LABEL_47;
    }
    goto LABEL_10;
  }
  id v44 = v4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unsigned int v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = [v45 photoLibraryURL];
      id v14 = [v13 path];
      *(_DWORD *)long long buf = 138412290;
      id v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[ComputeSync|Backfill] Attempting backfill for Photo Library %@", buf, 0xCu);
    }
  }
  os_log_type_t v42 = +[PHAsset vcp_fetchOptionsForLibrary:v45 forTaskID:1];
  id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  unsigned int v50 = v15;
  id v16 = +[NSArray arrayWithObjects:&v50 count:1];
  [v42 setSortDescriptors:v16];

  os_log_type_t v17 = +[PHAsset fetchAssetsWithOptions:v42];
  id v18 = +[NSMutableDictionary dictionary];
  uint64_t v43 = 0;
  unint64_t v19 = 0;
  os_log_type_t v20 = VCPLogToOSLogType[7];
  *(void *)&long long v21 = 138412290;
  long long v41 = v21;
  while (v19 < (unint64_t)objc_msgSend(v17, "count", v41))
  {
    if (![(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
    {
      long long v24 = +[VCPWatchdog sharedWatchdog];
      [v24 pet];

      id v25 = [v17 objectAtIndexedSubscript:v19];
      __int16 v26 = [v25 mediaAnalysisProperties];
      BOOL v27 = [v26 localAnalysisStage] == 0;

      if (!v27)
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          unsigned int v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, v20))
          {
            id v29 = [v25 localIdentifier];
            os_log_type_t v30 = [v25 mediaAnalysisProperties];
            unsigned int v31 = [v30 localAnalysisStage];
            *(_DWORD *)long long buf = 138412546;
            id v47 = v29;
            __int16 v48 = 1024;
            unsigned int v49 = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, v20, "[ComputeSync|Backfill][%@] Compute sync stage already set as %d; skipping backfill",
              buf,
              0x12u);
          }
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      id v32 = objc_msgSend(v25, "mad_analysisStageAfterCompletingAnalysis:", 0);
      if (v32)
      {
        id v33 = +[NSNumber numberWithShort:v32];
        [v18 setObject:v33 forKeyedSubscript:v25];

        if ((unint64_t)[v18 count] < 0x64)
        {
          int v23 = 0;
        }
        else
        {
          [(VCPPhotosMaintenanceProcessingTask *)self _persistBackfillForAssets:v18 photoLibrary:v45 database:v44];
          id v34 = [v18 count];
          [v18 removeAllObjects];
          int v23 = 0;
          uint64_t v43 = &v43[(void)v34];
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          unsigned int v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, v20))
          {
            v35 = [v25 localIdentifier];
            *(_DWORD *)long long buf = v41;
            id v47 = v35;
            _os_log_impl((void *)&_mh_execute_header, v28, v20, "[ComputeSync|Backfill][%@] Compute sync stage should be None; skipping backfill",
              buf,
              0xCu);
          }
LABEL_24:
        }
LABEL_25:
        int v23 = 10;
      }

      goto LABEL_27;
    }
    int v23 = 1;
LABEL_27:
    if (v23 != 10 && v23)
    {
      int v9 = -128;
      goto LABEL_46;
    }
    ++v19;
  }
  if ([v18 count])
  {
    [(VCPPhotosMaintenanceProcessingTask *)self _persistBackfillForAssets:v18 photoLibrary:v45 database:v44];
    uint64_t v43 = &v43[(void)[v18 count]];
  }
  uint32_t v36 = +[NSDate now];
  [v36 timeIntervalSinceReferenceDate];
  [v44 setValue:(uint64_t)v37 forKey:@"LastComputeSyncBackfillTimestamp"];

  [v44 commit];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v38 = VCPLogInstance();
    os_log_type_t v39 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v38, v39))
    {
      *(_DWORD *)long long buf = 134217984;
      id v47 = v43;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "[ComputeSync|Backfill] Completed backfill for total %lu assets", buf, 0xCu);
    }
  }
  int v9 = 0;
LABEL_46:

  id v6 = v42;
LABEL_47:

  id v4 = v44;
LABEL_48:

LABEL_49:
  return v9;
}

- (void)_persistVideoEmbeddingBackfillForAssets:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)id v18 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[VideoEmbedding|Backfill] Persisting %lu assets", buf, 0xCu);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001330D8;
  v15[3] = &unk_100219FC8;
  id v9 = v5;
  id v16 = v9;
  id v14 = 0;
  [v6 performChangesAndWait:v15 error:&v14];
  id v10 = v14;
  if (v10 && (int)MediaAnalysisLogLevel() >= 3)
  {
    unsigned int v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = [v9 count];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)id v18 = 70;
      *(_WORD *)&void v18[4] = 2048;
      *(void *)&v18[6] = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[VideoEmbedding|Backfill] Failed to persist video embedding version (v%d) for %lu results to Photos (%@)", buf, 0x1Cu);
    }
  }
}

- (int)_performVideoEmbeddingVersionBackfillForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    id v5 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
    id v6 = [v5 valueForKey:@"LastVideoEmbeddingVersionBackfillTimestamp"];
    if (v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v34 = v5;
        os_log_type_t v7 = VCPLogInstance();
        os_log_type_t v8 = VCPLogToOSLogType[5];
        os_log_t log = v7;
        if (os_log_type_enabled(v7, v8))
        {
          id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v6];
          *(_DWORD *)long long buf = 138412290;
          double v37 = v9;
          _os_log_impl((void *)&_mh_execute_header, log, v8, "[VideoEmbedding|Backfill] Last backfilled on %@; skipping",
            buf,
            0xCu);
        }
        int v10 = 0;
        goto LABEL_45;
      }
LABEL_10:
      int v10 = 0;
LABEL_46:

      goto LABEL_47;
    }
    id v34 = v5;
    LOWORD(v30) = 0;
    os_log_t log = objc_msgSend(objc_alloc((Class)PHMediaProcessingAlgorithmVersionProvider), "initWithSceneAnalysisVersion:faceAnalysisVersion:characterRecognitionAlgorithmVersion:visualSearchAlgorithmVersion:stickerConfidenceAlgorithmVersion:vaAnalysisVersion:vaLocationAnalysisVersion:mediaAnalysisVersion:mediaAnalysisImageVersion:captionGenerationVersion:imageEmbeddingVersion:videoEmbeddingVersion:", 0, 0, 0, 0, 0, 0, v30, 0, 0x46000000000000);
    +[PHAsset mad_sceneConfidenceThresholdForTask:1];
    id v35 = 0;
    os_log_type_t v12 = objc_msgSend(v4, "fetchAssetsForMediaProcessingTaskID:priority:algorithmVersion:sceneConfidenceThreshold:error:", 1, 0, log, &v35);
    *(void *)&type[4] = v35;
    if (*(void *)&type[4])
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v10 = -18;
LABEL_44:

LABEL_45:
        id v5 = v34;
        goto LABEL_46;
      }
      id v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)long long buf = 138412290;
        double v37 = *(char **)&type[4];
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[VideoEmbedding|Backfill] Failed to fetch assets: %@", buf, 0xCu);
      }
      int v10 = -18;
    }
    else
    {
      id v13 = +[NSMutableArray array];
      id v32 = 0;
      unint64_t v15 = 0;
      *(void *)os_log_type_t type = VCPLogToOSLogType[7];
      while (v15 < (unint64_t)[v12 count])
      {
        if ([(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
        {
          int v17 = 1;
        }
        else
        {
          id v18 = +[VCPWatchdog sharedWatchdog];
          [v18 pet];

          __int16 v19 = [v12 objectAtIndexedSubscript:v15];
          id v20 = [v19 mediaAnalysisProperties];
          BOOL v21 = (unint64_t)[v20 mediaAnalysisVersion] < 0x46;

          if (v21)
          {
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              unsigned int v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, (os_log_type_t)type[0]))
              {
                int v23 = [v19 localIdentifier];
                *(_DWORD *)long long buf = 138412290;
                double v37 = v23;
                _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)type[0], "[VideoEmbedding|Backfill][%@] Asset has not been processed yet; skipping backfill",
                  buf,
                  0xCu);
              }
            }
            int v17 = 10;
          }
          else
          {
            [v13 addObject:v19];
            if ((unint64_t)[v13 count] < 0x64)
            {
              int v17 = 0;
            }
            else
            {
              [(VCPPhotosMaintenanceProcessingTask *)self _persistVideoEmbeddingBackfillForAssets:v13 photoLibrary:v4];
              id v24 = [v13 count];
              [v13 removeAllObjects];
              int v17 = 0;
              id v32 = &v32[(void)v24];
            }
          }
        }
        if (v17 != 10 && v17)
        {
          int v10 = -128;
          goto LABEL_43;
        }
        ++v15;
      }
      if ([v13 count])
      {
        [(VCPPhotosMaintenanceProcessingTask *)self _persistVideoEmbeddingBackfillForAssets:v13 photoLibrary:v4];
        id v32 = &v32[(void)[v13 count]];
      }
      id v25 = +[NSDate now];
      [v25 timeIntervalSinceReferenceDate];
      [v5 setValue:(uint64_t)v26 forKey:@"LastVideoEmbeddingVersionBackfillTimestamp"];

      [v5 commit];
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        BOOL v27 = VCPLogInstance();
        os_log_type_t v28 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)long long buf = 134217984;
          double v37 = v32;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "[VideoEmbedding|Backfill] Completed backfill for total %lu assets", buf, 0xCu);
        }
      }
      int v10 = 0;
    }
LABEL_43:

    goto LABEL_44;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v5, v11))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v11, "[VideoEmbedding|Backfill] Embedding generation disabled; skipping",
        buf,
        2u);
    }
    goto LABEL_10;
  }
  int v10 = 0;
LABEL_47:

  return v10;
}

- (int)performForceClusterIfNeededWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (![(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
  {
    id v6 = +[MADPhotosFullClusterProcessingTask taskWithPhotoLibrary:v4];
    [v6 setRequiresProgressQuery:1];
    [v6 setFullModeClusterOnly:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_100133AC4;
    v12[3] = &unk_100219D98;
    v12[4] = self;
    [v6 setCancelBlock:v12];
    if (v6)
    {
      [v6 process];
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v7 = VCPLogInstance();
        os_log_type_t v8 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v7, v8))
        {
          *(_WORD *)os_log_type_t v11 = 0;
          id v9 = "[FullCluster] Full-mode clustering with progress query completed";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v7, v8, v9, v11, 2u);
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)os_log_type_t v11 = 0;
        id v9 = "[FullCluster] Failed to create MADPhotosFullClusterProcessingTask";
        goto LABEL_10;
      }
LABEL_11:
    }
    int v5 = 0;
    goto LABEL_13;
  }
  int v5 = -128;
LABEL_13:

  return v5;
}

- (int)_pruneProcessingStatusForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (![(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
  {
    if (+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v4])
    {
      id v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v4];
      unsigned int v7 = [v6 removeProcessingStatusForTaskID:1 mediaType:0 mediaSubtypes:0];
      int v5 = v7;
      if (v7 == -108 || v7 == -36 || v7 == -23) {
        goto LABEL_21;
      }
      unsigned int v8 = [v6 commit];
      if (v8 == -108 || v8 == -36)
      {
        int v9 = v8;
      }
      else
      {
        int v9 = v8;
        if (v8 != -23) {
          int v9 = v5;
        }
      }
      if (v8 == -108 || v8 == -36 || v8 == -23)
      {
        int v5 = v9;
        goto LABEL_21;
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v12, v13))
        {
          *(_WORD *)os_log_type_t v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "[ProcessingStatusPruning] Completed pruning", v14, 2u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v5 = 0;
        goto LABEL_22;
      }
      id v6 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v6, v10))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, v10, "[ProcessingStatusPruning] MAD database does not exist; skipping",
          buf,
          2u);
      }
    }
    int v5 = 0;
LABEL_21:

    goto LABEL_22;
  }
  int v5 = -128;
LABEL_22:

  return v5;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  obj = self->_photoLibraries;
  id v2 = [(NSArray *)obj countByEnumeratingWithState:&v164 objects:v177 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v165;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v165 != v3) {
          objc_enumerationMutation(obj);
        }
        int v5 = *(void **)(*((void *)&v164 + 1) + 8 * i);
        int v7 = [(VCPPhotosMaintenanceProcessingTask *)self _pruneProcessingStatusForPhotoLibrary:v5];
        if (!v7) {
          MediaAnalysisDaemonReleaseSharedDataStores(v5);
        }
        if (v7)
        {

          goto LABEL_194;
        }
      }
      id v2 = [(NSArray *)obj countByEnumeratingWithState:&v164 objects:v177 count:16];
    }
    while (v2);
  }

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  obja = self->_photoLibraries;
  int v7 = 0;
  id v8 = [(NSArray *)obja countByEnumeratingWithState:&v160 objects:v176 count:16];
  if (!v8) {
    goto LABEL_34;
  }
  uint64_t v9 = *(void *)v161;
  os_log_type_t v10 = VCPLogToOSLogType[5];
  os_log_type_t type = VCPLogToOSLogType[4];
  do
  {
    os_log_type_t v11 = 0;
    do
    {
      if (*(void *)v161 != v9) {
        objc_enumerationMutation(obja);
      }
      os_log_type_t v12 = *(void **)(*((void *)&v160 + 1) + 8 * (void)v11);
      unsigned __int8 v14 = [(VCPPhotosMaintenanceProcessingTask *)self isCancelled];
      if (v14)
      {
        int v7 = -128;
        int v15 = 6;
        goto LABEL_27;
      }
      if ([v12 isCloudPhotoLibraryEnabled]
        && ([v12 isSystemPhotoLibrary] & 1) != 0)
      {
        if (+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v12])
        {
          [(VCPPhotosMaintenanceProcessingTask *)self _performComputeSyncBackfillForPhotoLibrary:v12];
          MediaAnalysisDaemonReleaseSharedDataStores(v12);
          int v15 = 0;
          goto LABEL_27;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, type))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, type, "MAD database does not exist; skipping backfill",
              buf,
              2u);
          }
LABEL_25:
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 5)
      {
        id v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, v10))
        {
          int v17 = [v12 photoLibraryURL];
          id v18 = [v17 path];
          *(_DWORD *)long long buf = 138412290;
          v175 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, v10, "Compute sync not supported for Photo Library (%@); skipping backfill",
            buf,
            0xCu);
        }
        goto LABEL_25;
      }
      int v15 = 8;
LABEL_27:
      if ((v15 | 8) != 8)
      {

        goto LABEL_193;
      }
      os_log_type_t v11 = (char *)v11 + 1;
    }
    while (v8 != v11);
    id v19 = [(NSArray *)obja countByEnumeratingWithState:&v160 objects:v176 count:16];
    id v8 = v19;
  }
  while (v19);
LABEL_34:

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  objb = self->_photoLibraries;
  id v20 = [(NSArray *)objb countByEnumeratingWithState:&v156 objects:v173 count:16];
  if (!v20) {
    goto LABEL_63;
  }
  uint64_t v124 = *(void *)v157;
  os_log_type_t typea = VCPLogToOSLogType[5];
  os_log_type_t v116 = VCPLogToOSLogType[4];
  while (2)
  {
    uint64_t v21 = 0;
    while (2)
    {
      if (*(void *)v157 != v124) {
        objc_enumerationMutation(objb);
      }
      unsigned int v22 = *(void **)(*((void *)&v156 + 1) + 8 * v21);
      unsigned __int8 v14 = [(VCPPhotosMaintenanceProcessingTask *)self isCancelled];
      if (v14)
      {
        int v7 = -128;
        int v24 = 6;
        goto LABEL_60;
      }
      if (([v22 isReadyForAnalysis] & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          id v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, typea))
          {
            id v33 = [v22 photoLibraryURL];
            id v34 = [v33 path];
            *(_DWORD *)long long buf = 138412290;
            v175 = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, typea, "Photo Library is not ready for analysis (%@); skipping vectorEmbeddingVersion backfill",
              buf,
              0xCu);
          }
          goto LABEL_58;
        }
LABEL_59:
        int v24 = 16;
        goto LABEL_60;
      }
      if (!+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v22])
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, v116))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, v116, "MAD database does not exist; skipping backfill",
              buf,
              2u);
          }
LABEL_58:

          goto LABEL_59;
        }
        goto LABEL_59;
      }
      uint64_t v25 = mach_absolute_time();
      double v26 = VCPSignPostLog();
      os_signpost_id_t v27 = os_signpost_id_generate(v26);

      os_log_type_t v28 = VCPSignPostLog();
      id v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MADMaintenance_VideoEmbeddingVersionBackfill", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(VCPPhotosMaintenanceProcessingTask *)self _performVideoEmbeddingVersionBackfillForPhotoLibrary:v22];
      uint64_t v30 = VCPSignPostLog();
      unsigned int v31 = v30;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v27, "MADMaintenance_VideoEmbeddingVersionBackfill", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v25)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      MediaAnalysisDaemonReleaseSharedDataStores(v22);
      int v24 = 0;
LABEL_60:
      if ((v24 | 0x10) != 0x10)
      {

LABEL_193:
        if ((v14 & 1) == 0) {
          return v7;
        }
        goto LABEL_194;
      }
      if (v20 != (id)++v21) {
        continue;
      }
      break;
    }
    id v20 = [(NSArray *)objb countByEnumeratingWithState:&v156 objects:v173 count:16];
    if (v20) {
      continue;
    }
    break;
  }
LABEL_63:

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  objc = self->_photoLibraries;
  id v35 = [(NSArray *)objc countByEnumeratingWithState:&v152 objects:v172 count:16];
  if (v35)
  {
    os_log_type_t v117 = VCPLogToOSLogType[5];
    uint64_t v125 = *(void *)v153;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v153 != v125) {
          objc_enumerationMutation(objc);
        }
        double v37 = *(void **)(*((void *)&v152 + 1) + 8 * (void)j);
        unsigned __int8 v39 = [(VCPPhotosMaintenanceProcessingTask *)self isCancelled];
        if (v39)
        {
          int v7 = -128;
          int v40 = 6;
        }
        else if ([v37 isReadyForAnalysis])
        {
          uint64_t v41 = mach_absolute_time();
          os_log_type_t v42 = VCPSignPostLog();
          os_signpost_id_t v43 = os_signpost_id_generate(v42);

          id v44 = VCPSignPostLog();
          id v45 = v44;
          if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "MADVectorDatabaseUtilities_Sync", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          v151[0] = _NSConcreteStackBlock;
          v151[1] = 3221225472;
          v151[2] = sub_100135284;
          v151[3] = &unk_100219D98;
          v151[4] = self;
          +[MADVectorDatabaseUtilities syncWithPhotoLibrary:v37 ignoreExpiration:0 threshold:v151 cancelBlock:0 error:0.1];
          os_log_type_t v46 = VCPSignPostLog();
          id v47 = v46;
          if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v43, "MADVectorDatabaseUtilities_Sync", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          if (v41)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          MediaAnalysisDaemonReleaseSharedDataStores(v37);
          int v40 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            __int16 v48 = VCPLogInstance();
            if (os_log_type_enabled(v48, v117))
            {
              unsigned int v49 = [v37 photoLibraryURL];
              unsigned int v50 = [v49 path];
              *(_DWORD *)long long buf = 138412290;
              v175 = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, v117, "Photo Library is not ready for analysis (%@); skipping vectorDB sync",
                buf,
                0xCu);
            }
          }
          int v40 = 26;
        }
        if (v40 != 26 && v40)
        {

          goto LABEL_207;
        }
      }
      id v35 = [(NSArray *)objc countByEnumeratingWithState:&v152 objects:v172 count:16];
    }
    while (v35);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  objd = self->_photoLibraries;
  id v51 = [(NSArray *)objd countByEnumeratingWithState:&v147 objects:v171 count:16];
  if (!v51)
  {
LABEL_120:

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    obje = self->_photoLibraries;
    id v67 = [(NSArray *)obje countByEnumeratingWithState:&v143 objects:v170 count:16];
    if (!v67)
    {
LABEL_188:

      unsigned int v101 = [(VCPPhotosMaintenanceProcessingTask *)self _collectAndReportAnalysisProgress];
      if (v101) {
        int v7 = v101;
      }
      goto LABEL_194;
    }
    uint64_t v112 = *(void *)v144;
    os_log_type_t v110 = VCPLogToOSLogType[5];
    os_log_type_t v111 = VCPLogToOSLogType[6];
    os_log_type_t v109 = VCPLogToOSLogType[4];
    uint64_t v108 = PFClientSideEncryptionManagerProfileMediaAnalysis;
    os_log_type_t v107 = VCPLogToOSLogType[3];
LABEL_122:
    uint64_t v127 = 0;
    int v115 = v7;
    id v113 = v67;
    while (1)
    {
      if (*(void *)v144 != v112) {
        objc_enumerationMutation(obje);
      }
      uint64_t v68 = *(void **)(*((void *)&v143 + 1) + 8 * v127);
      if ([(VCPPhotosMaintenanceProcessingTask *)self isCancelled])
      {
        int v7 = -128;
LABEL_127:
        int v69 = 6;
        goto LABEL_178;
      }
      if (([v68 isSystemPhotoLibrary] & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 6) {
          goto LABEL_176;
        }
        v96 = VCPLogInstance();
        if (os_log_type_enabled(v96, v111))
        {
          v97 = [v68 photoLibraryURL];
          v98 = [v97 path];
          *(_DWORD *)long long buf = 138412290;
          v175 = v98;
          _os_log_impl((void *)&_mh_execute_header, v96, v111, "Backup only supported for system Photo Library; skipping library (%@)",
            buf,
            0xCu);
        }
        goto LABEL_174;
      }
      if (([v68 isReadyForAnalysis] & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 5) {
          goto LABEL_176;
        }
        v96 = VCPLogInstance();
        if (os_log_type_enabled(v96, v110))
        {
          v99 = [v68 photoLibraryURL];
          v100 = [v99 path];
          *(_DWORD *)long long buf = 138412290;
          v175 = v100;
          _os_log_impl((void *)&_mh_execute_header, v96, v110, "Photo Library is not ready for analysis (%@); skipping backup",
            buf,
            0xCu);
        }
        goto LABEL_174;
      }
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      id v70 = [&off_1002305F0 countByEnumeratingWithState:&v139 objects:v169 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v140;
        do
        {
          for (k = 0; k != v70; k = (char *)k + 1)
          {
            if (*(void *)v140 != v71) {
              objc_enumerationMutation(&off_1002305F0);
            }
            id v73 = *(void **)(*((void *)&v139 + 1) + 8 * (void)k);
            -[VCPPhotosMaintenanceProcessingTask _removeLegacyBackupForTask:withPhotoLibrary:](self, "_removeLegacyBackupForTask:withPhotoLibrary:", [v73 unsignedIntegerValue], v68);
          }
          id v70 = [&off_1002305F0 countByEnumeratingWithState:&v139 objects:v169 count:16];
        }
        while (v70);
      }
      if (!+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v68])break; {
      encryptionManager = self->_encryptionManager;
      }
      if (!encryptionManager)
      {
        __int16 v76 = (PFClientSideEncryptionManager *)[objc_alloc((Class)PFClientSideEncryptionManager) initWithProfile:v108];
        id v77 = self->_encryptionManager;
        self->_encryptionManager = v76;

        encryptionManager = self->_encryptionManager;
        if (!encryptionManager)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            int v7 = -18;
            goto LABEL_127;
          }
          v96 = VCPLogInstance();
          if (os_log_type_enabled(v96, v107))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v96, v107, "Failed to create PFClientSideEncryptionManager; backup failed",
              buf,
              2u);
          }
          int v115 = -18;
          int v69 = 6;
          goto LABEL_175;
        }
      }
      [(PFClientSideEncryptionManager *)encryptionManager start];
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      id v78 = [&off_100230608 countByEnumeratingWithState:&v135 objects:v168 count:16];
      if (v78)
      {
        uint64_t v114 = *(void *)v136;
LABEL_142:
        uint64_t v79 = 0;
        while (1)
        {
          if (*(void *)v136 != v114) {
            objc_enumerationMutation(&off_100230608);
          }
          NSFileProtectionType v80 = *(void **)(*((void *)&v135 + 1) + 8 * v79);
          id v81 = [v80 unsignedIntegerValue];
          dispatch_semaphore_t v82 = VCPTaskIDDescription((uint64_t)v81);
          NSFileAttributeKey v83 = VCPSignPostLog();
          os_signpost_id_t v84 = os_signpost_id_generate(v83);

          NSFileAttributeKey v85 = VCPSignPostLog();
          v86 = v85;
          if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
          {
            *(_DWORD *)long long buf = 138412290;
            v175 = v82;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v86, OS_SIGNPOST_INTERVAL_BEGIN, v84, "VCPMADLibraryBackup", "_%@", buf, 0xCu);
          }

          v87 = +[MADPhotosBackupAnalysisTask taskWithPhotoLibrary:v68 forTaskID:v81 encryptionManager:self->_encryptionManager progressHandler:self->_progressHandler completionHandler:self->_completionHandler andCancelBlock:self->_cancelBlock];
          int v7 = [v87 run];
          if (v7)
          {
            int v69 = 6;
          }
          else
          {
            v88 = VCPSignPostLog();
            v89 = v88;
            if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
            {
              *(_DWORD *)long long buf = 138412290;
              v175 = v82;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v89, OS_SIGNPOST_INTERVAL_END, v84, "VCPMADLibraryBackup", "_%@", buf, 0xCu);
            }

            int v69 = 0;
          }

          if (v7) {
            goto LABEL_178;
          }
          if (v78 == (id)++v79)
          {
            id v78 = [&off_100230608 countByEnumeratingWithState:&v135 objects:v168 count:16];
            if (v78) {
              goto LABEL_142;
            }
            break;
          }
        }
      }
      v90 = VCPSignPostLog();
      os_signpost_id_t v91 = os_signpost_id_generate(v90);

      v92 = VCPSignPostLog();
      v93 = v92;
      if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v92))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v93, OS_SIGNPOST_INTERVAL_BEGIN, v91, "VCPMADLibraryBackup_FullAnalysis", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      int v7 = [(VCPPhotosMaintenanceProcessingTask *)self _backupFullAnalysisForPhotoLibrary:v68];
      if (v7) {
        goto LABEL_127;
      }
      v94 = VCPSignPostLog();
      v95 = v94;
      if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_END, v91, "VCPMADLibraryBackup_FullAnalysis", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      [(PFClientSideEncryptionManager *)self->_encryptionManager shutdownWithCompletionHandler:0];
      MediaAnalysisDaemonReleaseSharedDataStores(v68);
      int v69 = 0;
LABEL_177:
      int v7 = v115;
LABEL_178:
      if (v69 != 44 && v69)
      {

        goto LABEL_194;
      }
      int v115 = v7;
      if ((id)++v127 == v113)
      {
        id v67 = [(NSArray *)obje countByEnumeratingWithState:&v143 objects:v170 count:16];
        if (!v67) {
          goto LABEL_188;
        }
        goto LABEL_122;
      }
    }
    if ((int)MediaAnalysisLogLevel() < 4)
    {
LABEL_176:
      int v69 = 44;
      goto LABEL_177;
    }
    v96 = VCPLogInstance();
    if (os_log_type_enabled(v96, v109))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, v109, "MAD database does not exist; skipping backup", buf, 2u);
    }
LABEL_174:
    int v69 = 44;
LABEL_175:

    goto LABEL_177;
  }
  uint64_t v126 = *(void *)v148;
  os_log_type_t v118 = VCPLogToOSLogType[4];
  os_log_type_t typeb = VCPLogToOSLogType[7];
  while (2)
  {
    uint64_t v52 = 0;
LABEL_92:
    if (*(void *)v148 != v126) {
      objc_enumerationMutation(objd);
    }
    id v53 = *(void **)(*((void *)&v147 + 1) + 8 * v52);
    unsigned __int8 v39 = [(VCPPhotosMaintenanceProcessingTask *)self isCancelled];
    if (v39)
    {
      int v7 = -128;
      int v55 = 6;
      goto LABEL_116;
    }
    if (objc_msgSend(v53, "vcp_isSyndicationLibrary"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, typeb))
        {
          *(_WORD *)long long buf = 0;
          long long v57 = v56;
          os_log_type_t v58 = typeb;
          long long v59 = "Skip full clustering for syndication library";
          goto LABEL_113;
        }
        goto LABEL_114;
      }
      goto LABEL_115;
    }
    if (!+[VCPDatabaseManager existsDatabaseForPhotoLibrary:v53])
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, v118))
        {
          *(_WORD *)long long buf = 0;
          long long v57 = v56;
          os_log_type_t v58 = v118;
          long long v59 = "MAD database does not exist, skip progress query";
LABEL_113:
          _os_log_impl((void *)&_mh_execute_header, v57, v58, v59, buf, 2u);
        }
LABEL_114:
      }
LABEL_115:
      int v55 = 34;
      goto LABEL_116;
    }
    uint64_t v60 = mach_absolute_time();
    uint64_t v61 = VCPSignPostLog();
    os_signpost_id_t v62 = os_signpost_id_generate(v61);

    uint64_t v63 = VCPSignPostLog();
    uint64_t v64 = v63;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "MADMaintenance_FullCluster", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    [(VCPPhotosMaintenanceProcessingTask *)self performForceClusterIfNeededWithPhotoLibrary:v53];
    v65 = VCPSignPostLog();
    v66 = v65;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, v62, "MADMaintenance_FullCluster", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v60)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    MediaAnalysisDaemonReleaseSharedDataStores(v53);
    int v55 = 0;
LABEL_116:
    if (v55 == 34 || !v55)
    {
      if (v51 == (id)++v52)
      {
        id v51 = [(NSArray *)objd countByEnumeratingWithState:&v147 objects:v171 count:16];
        if (!v51) {
          goto LABEL_120;
        }
        continue;
      }
      goto LABEL_92;
    }
    break;
  }

LABEL_207:
  if (v39)
  {
LABEL_194:
    if (v7 != -128 && v7 != 0)
    {
      int v104 = MediaAnalysisLogLevel();
      if (v104 >= 3)
      {
        v105 = VCPLogInstance();
        os_log_type_t v106 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v105, v106))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v175) = v7;
          _os_log_impl((void *)&_mh_execute_header, v105, v106, "Error maintaining library (%d); skip processing",
            buf,
            8u);
        }
      }
    }
    VCPPerformance_ReportSummary();
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  return v7;
}

- (BOOL)autoCancellable
{
  return 0;
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
  objc_storeStrong((id *)&self->_photoLibraries, 0);
}

@end