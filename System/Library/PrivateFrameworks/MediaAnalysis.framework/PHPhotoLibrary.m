@interface PHPhotoLibrary
- (BOOL)mad_isBackupRestoreEligibleForTask:(unint64_t)a3;
- (BOOL)vcp_openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4;
- (id)mad_backupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateEncryptedBackupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateEncryptedRestoreFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateUnencryptedBackupFilepathForTask:(unint64_t)a3;
- (id)mad_intermediateUnencryptedRestoreFilepathForTask:(unint64_t)a3;
- (id)mad_restoreDirectory;
- (id)mad_restoreStatusFilepath;
- (id)vcp_mediaAnalysisBackupDirectory;
- (id)vcp_mediaAnalysisBackupFilepath;
- (id)vcp_mediaAnalysisIntermediateBackupDirectory;
- (id)vcp_mediaAnalysisIntermediateRestoreDirectory;
- (int)_bumpFaceProcessingVersionIfNeededWithError:(id *)a3;
- (int)_migrateVectorDatabaseIfNeededWithError:(id *)a3;
- (int)_resetChangeTokenAndProcessingStatusForFaceProcessing;
- (int)_resetCurrentFaceProgress;
- (int)_resetEmbeddingClusteringProgress;
- (int)_signalPhotosAvailabilityStateChangeWithError:(id *)a3;
- (int)vcp_bumpFaceProcessingToVersion:(int)a3 withError:(id *)a4;
@end

@implementation PHPhotoLibrary

- (id)vcp_mediaAnalysisBackupDirectory
{
  v2 = [(PHPhotoLibrary *)self vcp_mediaAnalysisDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@".backup"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)vcp_mediaAnalysisBackupFilepath
{
  return [(PHPhotoLibrary *)self mad_backupFilepathForTask:1];
}

- (id)mad_backupFilepathForTask:(unint64_t)a3
{
  v4 = [(PHPhotoLibrary *)self vcp_mediaAnalysisBackupDirectory];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v6 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        CFStringRef v6 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        CFStringRef v6 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        CFStringRef v6 = @"ocranalysis.aea";
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v9, v10))
          {
            v11 = VCPTaskIDDescription(a3);
            int v14 = 138412290;
            v15 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ unavailable for backup", (uint8_t *)&v14, 0xCu);
          }
        }
        goto LABEL_14;
    }
    v12 = [v4 stringByAppendingPathComponent:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected nil backup directory", (uint8_t *)&v14, 2u);
      }
    }
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (id)vcp_mediaAnalysisIntermediateBackupDirectory
{
  v2 = [(PHPhotoLibrary *)self vcp_mediaAnalysisDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@".intermediate_backup"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mad_intermediateUnencryptedBackupFilepathForTask:(unint64_t)a3
{
  v4 = [(PHPhotoLibrary *)self vcp_mediaAnalysisIntermediateBackupDirectory];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v6 = @"mediaanalysis_unencrypted.backup";
        break;
      case 2uLL:
        CFStringRef v6 = @"sceneanalysis_unencrypted.backup";
        break;
      case 3uLL:
        CFStringRef v6 = @"faceanalysis_unencrypted.backup";
        break;
      case 0xAuLL:
        CFStringRef v6 = @"ocranalysis_unencrypted.backup";
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v9, v10))
          {
            v11 = VCPTaskIDDescription(a3);
            int v14 = 138412290;
            v15 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ unavailable for backup", (uint8_t *)&v14, 0xCu);
          }
        }
        goto LABEL_14;
    }
    v12 = [v4 stringByAppendingPathComponent:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected nil intermediate backup directory", (uint8_t *)&v14, 2u);
      }
    }
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (id)mad_intermediateEncryptedBackupFilepathForTask:(unint64_t)a3
{
  v4 = [(PHPhotoLibrary *)self vcp_mediaAnalysisIntermediateBackupDirectory];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v6 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        CFStringRef v6 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        CFStringRef v6 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        CFStringRef v6 = @"ocranalysis.aea";
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v9, v10))
          {
            v11 = VCPTaskIDDescription(a3);
            int v14 = 138412290;
            v15 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ unavailable for backup", (uint8_t *)&v14, 0xCu);
          }
        }
        goto LABEL_14;
    }
    v12 = [v4 stringByAppendingPathComponent:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected nil intermediate backup directory", (uint8_t *)&v14, 2u);
      }
    }
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (id)vcp_mediaAnalysisIntermediateRestoreDirectory
{
  v2 = [(PHPhotoLibrary *)self vcp_mediaAnalysisDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@".intermediate_restore"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mad_intermediateEncryptedRestoreFilepathForTask:(unint64_t)a3
{
  v4 = [(PHPhotoLibrary *)self vcp_mediaAnalysisIntermediateRestoreDirectory];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v6 = @"mediaanalysis.aea";
        break;
      case 2uLL:
        CFStringRef v6 = @"sceneanalysis.aea";
        break;
      case 3uLL:
        CFStringRef v6 = @"faceanalysis.aea";
        break;
      case 0xAuLL:
        CFStringRef v6 = @"ocranalysis.aea";
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v9, v10))
          {
            v11 = VCPTaskIDDescription(a3);
            int v14 = 138412290;
            v15 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ unavailable for restore", (uint8_t *)&v14, 0xCu);
          }
        }
        goto LABEL_14;
    }
    v12 = [v4 stringByAppendingPathComponent:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected nil intermediate restore directory", (uint8_t *)&v14, 2u);
      }
    }
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (id)mad_intermediateUnencryptedRestoreFilepathForTask:(unint64_t)a3
{
  v4 = [(PHPhotoLibrary *)self vcp_mediaAnalysisIntermediateRestoreDirectory];
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 1uLL:
        CFStringRef v6 = @"mediaanalysis_unencrypted.backup";
        break;
      case 2uLL:
        CFStringRef v6 = @"sceneanalysis_unencrypted.backup";
        break;
      case 3uLL:
        CFStringRef v6 = @"faceanalysis_unencrypted.backup";
        break;
      case 0xAuLL:
        CFStringRef v6 = @"ocranalysis_unencrypted.backup";
        break;
      default:
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v9 = VCPLogInstance();
          os_log_type_t v10 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v9, v10))
          {
            v11 = VCPTaskIDDescription(a3);
            int v14 = 138412290;
            v15 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ unavailable for restore", (uint8_t *)&v14, 0xCu);
          }
        }
        goto LABEL_14;
    }
    v12 = [v4 stringByAppendingPathComponent:v6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unexpected nil intermediate restore directory", (uint8_t *)&v14, 2u);
      }
    }
LABEL_14:
    v12 = 0;
  }

  return v12;
}

- (id)mad_restoreDirectory
{
  v2 = [(PHPhotoLibrary *)self vcp_mediaAnalysisDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@".restore"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mad_restoreStatusFilepath
{
  v2 = [(PHPhotoLibrary *)self mad_restoreDirectory];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 stringByAppendingPathComponent:@"restore_status.plist"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mad_isBackupRestoreEligibleForTask:(unint64_t)a3
{
  if (a3 - 1 >= 2)
  {
    if (a3 == 3)
    {
      if (_os_feature_enabled_impl())
      {
        if ((int)MediaAnalysisLogLevel() < 6) {
          goto LABEL_22;
        }
        v5 = VCPLogInstance();
        os_log_type_t v11 = VCPLogToOSLogType[6];
        if (!os_log_type_enabled(v5, v11)) {
          goto LABEL_21;
        }
        LOWORD(v14[0]) = 0;
        v7 = "Face analysis backup/restore is disabled, not eligible for backup/restore";
LABEL_19:
        os_log_type_t v8 = v5;
        os_log_type_t v9 = v11;
        uint32_t v10 = 2;
        goto LABEL_20;
      }
    }
    else if (a3 != 10)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v5 = VCPLogInstance();
        os_log_type_t v6 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v5, v6))
        {
          v14[0] = 67109120;
          v14[1] = a3;
          v7 = "TaskID %d is not eligible for backup/restore";
          os_log_type_t v8 = v5;
          os_log_type_t v9 = v6;
          uint32_t v10 = 8;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)v14, v10);
        }
LABEL_21:
      }
LABEL_22:
      LOBYTE(v12) = 0;
      return v12;
    }
  }
  int v12 = MADCheckBackUpVersion(a3);
  if (!v12) {
    return v12;
  }
  if (([(PHPhotoLibrary *)self isSystemPhotoLibrary] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_22;
    }
    v5 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (!os_log_type_enabled(v5, v11)) {
      goto LABEL_21;
    }
    LOWORD(v14[0]) = 0;
    v7 = "Library is not System Photo Library, not eligible for backup/restore";
    goto LABEL_19;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFF7) == 2
    && ([(PHPhotoLibrary *)self isCloudPhotoLibraryEnabled] & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 6) {
      goto LABEL_22;
    }
    v5 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (!os_log_type_enabled(v5, v11)) {
      goto LABEL_21;
    }
    LOWORD(v14[0]) = 0;
    v7 = "iCloud photo library not enabled, not eligible for backup/restore";
    goto LABEL_19;
  }
  LOBYTE(v12) = 1;
  return v12;
}

- (int)_resetChangeTokenAndProcessingStatusForFaceProcessing
{
  unsigned __int8 v3 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:self];
  int v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 5)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        v7 = [(PHPhotoLibrary *)self vcp_description];
        int v20 = 138412290;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceModelBump][%@] Flushing ChangeToken and ProcessingStatus ... ", (uint8_t *)&v20, 0xCu);
      }
    }
    os_log_type_t v8 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self];
    unsigned int v9 = [v8 removeAllProcessingStatusForTaskID:3];
    int v10 = v9;
    if (v9 == -108
      || (v9 != -36 ? (BOOL v11 = v9 == -23) : (BOOL v11 = 1),
          v11
       || (unsigned int v18 = [v8 removeAllChangeTokensForTaskID:3],
           (int v10 = v18, v18 == -108)
        || v18 == -36
        || v18 == -23
        || (v19 = [v8 commit], int v10 = v19, v19 == -108)
        || v19 == -23
        || v19 == -36)))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v12, v13))
        {
          int v14 = [(PHPhotoLibrary *)self vcp_description];
          int v20 = 138412546;
          v21 = v14;
          __int16 v22 = 1024;
          int v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "[FaceModelBump][%@] Failed to flush (%d)", (uint8_t *)&v20, 0x12u);
        }
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (v4 < 5) {
      return 0;
    }
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v15))
    {
      v16 = [(PHPhotoLibrary *)self vcp_description];
      int v20 = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, v15, "[FaceModelBump][%@] Media analysis database does not exist, skipping ChangeToken and ProcessingStatus reset", (uint8_t *)&v20, 0xCu);
    }
  }
  int v10 = 0;
LABEL_20:

  return v10;
}

- (int)_resetCurrentFaceProgress
{
  unsigned __int8 v3 = +[VCPDatabaseManager existsDatabaseForPhotoLibrary:self];
  int v4 = MediaAnalysisLogLevel();
  if (v3)
  {
    if (v4 >= 5)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        v7 = [(PHPhotoLibrary *)self vcp_description];
        int v29 = 138412290;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[FaceModelBump][%@] Reset cached face analysis progress ...", (uint8_t *)&v29, 0xCu);
      }
    }
    os_log_type_t v8 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self];
    unsigned int v9 = [v8 cacheCurrentFaceProgress];
    int v10 = v9;
    if (v9 == -108) {
      goto LABEL_12;
    }
    if (v9 == -36 || v9 == -23) {
      goto LABEL_12;
    }
    unsigned int v18 = [v8 cacheProcessedAssetCountAfterPromoter:0];
    int v10 = v18;
    if (v18 == -108 || v18 == -36 || v18 == -23) {
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      unsigned int v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v19, v20))
      {
        v21 = [(PHPhotoLibrary *)self vcp_description];
        int v29 = 138412290;
        v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[FaceModelBump][%@] Resetting person process change tokens ...", (uint8_t *)&v29, 0xCu);
      }
    }
    unsigned int v22 = [v8 removeAllChangeTokensForTaskID:3];
    int v10 = v22;
    if (v22 == -108 || v22 == -36 || v22 == -23) {
      goto LABEL_12;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v23, v24))
      {
        v25 = [(PHPhotoLibrary *)self vcp_description];
        int v29 = 138412290;
        v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "[FaceModelBump][%@] Resetting person process timestamps ...", (uint8_t *)&v29, 0xCu);
      }
    }
    unsigned int v26 = [v8 removeKey:@"ContactIngestionTimestamp"];
    int v10 = v26;
    if (v26 == -108
      || v26 == -36
      || v26 == -23
      || (unsigned int v27 = [v8 removeKey:@"HomePersonIngestionTimestamp"],
          int v10 = v27,
          v27 == -108)
      || v27 == -36
      || v27 == -23
      || (unsigned int v28 = [v8 removeKey:@"VUDeepSyncTimestamp"],
          int v10 = v28,
          v28 == -108)
      || v28 == -36
      || v28 == -23)
    {
LABEL_12:
      [v8 commit];
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v12, v13))
        {
          int v14 = [(PHPhotoLibrary *)self vcp_description];
          int v29 = 138412546;
          v30 = v14;
          __int16 v31 = 1024;
          int v32 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "[FaceModelBump][%@] Failed to reset (%d)", (uint8_t *)&v29, 0x12u);
        }
      }
      goto LABEL_20;
    }
    [v8 commit];
  }
  else
  {
    if (v4 < 5) {
      return 0;
    }
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v15))
    {
      v16 = [(PHPhotoLibrary *)self vcp_description];
      int v29 = 138412290;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v8, v15, "[FaceModelBump][%@] Media analysis database does not exist, skipping ChangeToken and ProcessingStatus reset", (uint8_t *)&v29, 0xCu);
    }
  }
  int v10 = 0;
LABEL_20:

  return v10;
}

- (int)vcp_bumpFaceProcessingToVersion:(int)a3 withError:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  os_log_type_t v6 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:](VCPFaceProcessingVersionManager, "sharedManagerForPhotoLibrary:", self, a4);
  unsigned int v7 = [v6 currentProcessingVersion];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = [(PHPhotoLibrary *)self vcp_description];
      int v16 = 138412802;
      v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v7;
      __int16 v20 = 1024;
      int v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[FaceModelBump][%@] Migrating version from: %d to %d", (uint8_t *)&v16, 0x18u);
    }
  }
  int v11 = [(PHPhotoLibrary *)self _resetChangeTokenAndProcessingStatusForFaceProcessing];
  if (!v11)
  {
    int v11 = [v6 migrateFaceProcessingToVersion:v4];
    if (!v11)
    {
      int v11 = [(PHPhotoLibrary *)self _resetCurrentFaceProgress];
      if (!v11)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          int v12 = VCPLogInstance();
          os_log_type_t v13 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v12, v13))
          {
            int v14 = [(PHPhotoLibrary *)self vcp_description];
            int v16 = 138412290;
            v17 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "[FaceModelBump][%@] Migration finished", (uint8_t *)&v16, 0xCu);
          }
        }
        int v11 = 0;
      }
    }
  }

  return v11;
}

- (int)_bumpFaceProcessingVersionIfNeededWithError:(id *)a3
{
  v5 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:self];
  unsigned int v6 = [v5 currentProcessingVersion];
  id v7 = [v5 defaultProcessingVersion];
  if (v7 == v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      os_log_type_t v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v8, v9))
      {
        int v10 = [(PHPhotoLibrary *)self vcp_description];
        int v13 = 138412802;
        int v14 = v10;
        __int16 v15 = 1024;
        unsigned int v16 = v6;
        __int16 v17 = 1024;
        unsigned int v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[FaceModelBump][%@] Version %d meets requirement %d", (uint8_t *)&v13, 0x18u);
      }
    }
    int v11 = 0;
  }
  else
  {
    int v11 = [(PHPhotoLibrary *)self vcp_bumpFaceProcessingToVersion:v7 withError:a3];
  }

  return v11;
}

- (int)_resetEmbeddingClusteringProgress
{
  if (+[VCPDatabaseManager existsDatabaseForPhotoLibrary:self])
  {
    unsigned __int8 v3 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self];
    uint64_t v4 = +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:self];
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v5, v6))
      {
        id v7 = [(PHPhotoLibrary *)self vcp_description];
        *(_DWORD *)buf = 138412290;
        int v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "[VSKDBMigration][%@] Reset embedding clustering progress ... ", buf, 0xCu);
      }
    }
    unsigned int v8 = [v3 removeKey:@"MediaAnalysisImagePriority1LastFullModeClusterTimestamp"];
    int v9 = v8;
    id v10 = 0;
    if (v8 == -108) {
      goto LABEL_35;
    }
    if (v8 == -36 || v8 == -23) {
      goto LABEL_35;
    }
    if (v4)
    {
      int v12 = VCPSignPostLog();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      int v14 = VCPSignPostLog();
      __int16 v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VUWGallery_resetForType_Scene", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v30 = 0;
      unsigned __int8 v16 = [v4 resetForType:0 error:&v30];
      id v10 = v30;
      if (v16)
      {
        __int16 v17 = VCPSignPostLog();
        unsigned int v18 = v17;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v13, "VUWGallery_resetForType_Scene", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        [v3 commit];
        int v9 = 0;
LABEL_39:

LABEL_40:
        return v9;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_34;
      }
      int v21 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v24))
      {
        v25 = [(PHPhotoLibrary *)self vcp_description];
        *(_DWORD *)buf = 138412802;
        int v32 = v25;
        __int16 v33 = 1024;
        int v34 = 0;
        __int16 v35 = 2112;
        id v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, v24, "[VSKDBMigration][%@] Failed to reset VUWGallery for type %d: %@", buf, 0x1Cu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        id v10 = 0;
        goto LABEL_34;
      }
      int v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        int v23 = [(PHPhotoLibrary *)self vcp_description];
        *(_DWORD *)buf = 138412290;
        int v32 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[VSKDBMigration][%@] Failed to obtain VUWGallery", buf, 0xCu);
      }
      id v10 = 0;
    }

LABEL_34:
    int v9 = -18;
LABEL_35:
    [v3 commit];
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unsigned int v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v26, v27))
      {
        unsigned int v28 = [(PHPhotoLibrary *)self vcp_description];
        *(_DWORD *)buf = 138412546;
        int v32 = v28;
        __int16 v33 = 1024;
        int v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "[VSKDBMigration][%@] Failed to reset (%d)", buf, 0x12u);
      }
    }
    goto LABEL_39;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    unsigned __int8 v3 = VCPLogInstance();
    os_log_type_t v19 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v19))
    {
      __int16 v20 = [(PHPhotoLibrary *)self vcp_description];
      *(_DWORD *)buf = 138412290;
      int v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v3, v19, "[VSKDBMigration][%@] Media analysis database does not exist, skipping embedding clustering progress reset", buf, 0xCu);
    }
    int v9 = 0;
    goto LABEL_40;
  }
  return 0;
}

- (int)_signalPhotosAvailabilityStateChangeWithError:(id *)a3
{
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = VCPSignPostLog();
  unsigned int v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PhotoLibraryClient_SignalAvailabilityStateChange", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  int v9 = [(PHPhotoLibrary *)self photoLibrary];
  id v10 = [v9 assetsdClient];
  int v11 = [v10 libraryInternalClient];
  id v22 = 0;
  unsigned __int8 v12 = [v11 signalAvailabilityStateDidChangeWithError:&v22];
  id v13 = v22;

  if (v12)
  {
    int v14 = VCPSignPostLog();
    __int16 v15 = v14;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v6, "PhotoLibraryClient_SignalAvailabilityStateChange", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      unsigned __int8 v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v16, v17))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[VSKDBMigration] Signalled Photos availability state change", buf, 2u);
      }
    }
    int v18 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[VSKDBMigration] Failed to signal Photos availability state change: %@", buf, 0xCu);
      }
    }
    *a3 = [v13 copy];
    int v18 = -18;
  }

  return v18;
}

- (int)_migrateVectorDatabaseIfNeededWithError:(id *)a3
{
  v5 = +[MADVectorDatabaseManager sharedDatabaseWithPhotoLibrary:self];
  if ([v5 hasMigration])
  {
    int v6 = [(PHPhotoLibrary *)self _resetEmbeddingClusteringProgress];
    if (!v6) {
      int v6 = [(PHPhotoLibrary *)self _signalPhotosAvailabilityStateChangeWithError:a3];
    }
  }
  else
  {
    int v6 = 0;
  }
  MediaAnalysisDaemonReleaseSharedDataStores(self);

  return v6;
}

- (BOOL)vcp_openAndWaitWithUpgrade:(BOOL)a3 error:(id *)a4
{
  unsigned int v6 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](self, "openAndWaitWithUpgrade:error:", a3);
  if (v6)
  {
    if ([(PHPhotoLibrary *)self _bumpFaceProcessingVersionIfNeededWithError:a4])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      LOBYTE(v6) = [(PHPhotoLibrary *)self _migrateVectorDatabaseIfNeededWithError:a4] == 0;
    }
  }
  return v6;
}

@end