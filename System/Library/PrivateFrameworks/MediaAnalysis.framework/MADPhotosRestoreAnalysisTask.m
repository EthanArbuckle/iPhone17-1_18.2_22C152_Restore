@interface MADPhotosRestoreAnalysisTask
+ (id)taskName;
+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7;
- (BOOL)autoCancellable;
- (BOOL)isCancelled;
- (MADPhotosRestoreAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7;
- (float)resourceRequirement;
- (id)cancelBlock;
- (int)_performRestore;
- (int)_persistAssetProtoBatch:(id)a3 successCount:(unint64_t *)a4;
- (int)_restoreFromBackupFilepath:(id)a3;
- (int)run;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation MADPhotosRestoreAnalysisTask

- (MADPhotosRestoreAnalysisTask)initWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v13 = a3;
  v14 = (Block_layout *)a5;
  v15 = (Block_layout *)a6;
  v16 = (Block_layout *)a7;
  v29.receiver = self;
  v29.super_class = (Class)MADPhotosRestoreAnalysisTask;
  v17 = [(MADPhotosRestoreAnalysisTask *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    v18->_taskID = a4;
    if (v14) {
      v19 = v14;
    }
    else {
      v19 = &stru_10021E358;
    }
    v20 = objc_retainBlock(v19);
    id progressHandler = v18->_progressHandler;
    v18->_id progressHandler = v20;

    if (v15) {
      v22 = v15;
    }
    else {
      v22 = &stru_10021E378;
    }
    v23 = objc_retainBlock(v22);
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v23;

    if (v16) {
      v25 = v16;
    }
    else {
      v25 = &stru_10021E398;
    }
    v26 = objc_retainBlock(v25);
    id cancelBlock = v18->_cancelBlock;
    v18->_id cancelBlock = v26;
  }
  return v18;
}

+ (id)taskWithPhotoLibrary:(id)a3 forTaskID:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6 andCancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)a1) initWithPhotoLibrary:v12 forTaskID:a4 progressHandler:v13 completionHandler:v14 andCancelBlock:v15];

  return v16;
}

+ (id)taskName
{
  return @"MADPhotosRestoreAnalysisTask";
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

- (int)_persistAssetProtoBatch:(id)a3 successCount:(unint64_t *)a4
{
  id v6 = a3;
  v32 = a4;
  *a4 = 0;
  v7 = +[NSMutableDictionary dictionary];
  unint64_t v8 = 0;
  os_log_type_t v9 = VCPLogToOSLogType[4];
  while (v8 < (unint64_t)[v6 count])
  {
    v10 = [v6 objectAtIndexedSubscript:v8];
    v11 = [v10 assetCloudIdentifier];

    id v12 = [objc_alloc((Class)PHCloudIdentifier) initWithStringValue:v11];
    if (v12)
    {
      id v13 = [v6 objectAtIndexedSubscript:v8];
      [v7 setObject:v13 forKeyedSubscript:v12];
LABEL_5:

      goto LABEL_6;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, v9))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, v9, "  No cloud identifier (%@ stored in proto); skipping entry",
          (uint8_t *)&buf,
          0xCu);
      }
      goto LABEL_5;
    }
LABEL_6:

    ++v8;
  }
  photoLibrary = self->_photoLibrary;
  id v15 = [v7 allKeys];
  v34 = [(PHPhotoLibrary *)photoLibrary localIdentifierMappingsForCloudIdentifiers:v15];

  id v16 = +[NSMutableDictionary dictionary];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100113158;
  v41[3] = &unk_10021E3C0;
  id v33 = v34;
  id v42 = v33;
  id v17 = v16;
  id v43 = v17;
  [v7 enumerateKeysAndObjectsUsingBlock:v41];
  v18 = +[PHAsset vcp_fetchOptionsForLibrary:self->_photoLibrary forTaskID:self->_taskID];
  v19 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  v51 = v19;
  v20 = +[NSArray arrayWithObjects:&v51 count:1];
  [v18 setSortDescriptors:v20];

  v21 = [v17 allKeys];
  v22 = +[PHAsset fetchAssetsWithLocalIdentifiers:v21 options:v18];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  v23 = self->_photoLibrary;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1001132EC;
  v36[3] = &unk_10021E3E8;
  id v24 = v22;
  id v37 = v24;
  v38 = self;
  id v25 = v17;
  id v39 = v25;
  p_long long buf = &buf;
  id v35 = 0;
  [(PHPhotoLibrary *)v23 performChangesAndWait:v36 error:&v35];
  id v26 = v35;
  if (v26)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v27, v28))
      {
        objc_super v29 = [(id)objc_opt_class() taskName];
        *(_DWORD *)v44 = 138412546;
        v45 = v29;
        __int16 v46 = 2112;
        id v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%@] Failed to persist to photo library (%@)", v44, 0x16u);
      }
    }
    int v30 = [v26 code];
  }
  else
  {
    int v30 = 0;
    unint64_t *v32 = *(void *)(*((void *)&buf + 1) + 24);
  }

  _Block_object_dispose(&buf, 8);
  return v30;
}

- (int)_restoreFromBackupFilepath:(id)a3
{
  id v4 = a3;
  v40 = v4;
  v5 = +[NSInputStream inputStreamWithFileAtPath:v4];
  [v5 open];
  v41 = +[VCPBackupFileHeader headerForTask:self->_taskID];
  id v6 = +[VCPBackupFileHeader headerFromStream:v5];
  v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 identifier];
    if (v8 == [v41 identifier])
    {
      unsigned int v9 = [v7 version];
      if (v9 == [v41 version])
      {
        id v35 = +[VCPDataDecompressor decompressor];
        v36 = +[NSMutableArray array];
        uint64_t v38 = 0;
        *(_DWORD *)&v34[8] = 0;
        uint64_t v10 = 0;
        os_log_type_t type = VCPLogToOSLogType[3];
        *(void *)v34 = VCPLogToOSLogType[4];
        while (1)
        {
          if (![v5 hasBytesAvailable])
          {
LABEL_72:
            if ([v36 count])
            {
              *(void *)long long buf = 0;
              unsigned int v29 = [(MADPhotosRestoreAnalysisTask *)self _persistAssetProtoBatch:v36 successCount:buf];
              if (v29)
              {
                LODWORD(v10) = v29;
                goto LABEL_80;
              }
              *(void *)&v34[4] += *(void *)buf;
            }
            [v5 close];
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              int v30 = VCPLogInstance();
              os_log_type_t v31 = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)long long buf = 134218240;
                *(void *)&buf[4] = *(void *)&v34[4];
                __int16 v43 = 2048;
                uint64_t v44 = v38;
                _os_log_impl((void *)&_mh_execute_header, v30, v31, "  Restored %zu/%zu analysis records", buf, 0x16u);
              }
            }
LABEL_80:

            v23 = v35;
LABEL_81:

            goto LABEL_82;
          }
          id v12 = +[VCPBackupEntryHeader header];
          uint64_t v13 = (uint64_t)[v12 readFromStream:v5];
          if (!v13) {
            break;
          }
          if ([v5 streamStatus] == (id)5)
          {
            int v14 = 16;
            goto LABEL_48;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            id v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, type))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, type, "  Failed to read backup entry header", buf, 2u);
            }
            goto LABEL_28;
          }
          int v14 = 6;
LABEL_47:
          uint64_t v10 = v13;
LABEL_48:

          if (v14 && v14 != 15)
          {
            if (v14 != 16) {
              goto LABEL_80;
            }
            goto LABEL_72;
          }
        }
        if ([v12 dataLength] > 0x200000)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            uint64_t v10 = 4294967246;
            goto LABEL_22;
          }
          id v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, type))
          {
            unsigned int v16 = [v12 dataLength];
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&buf[4] = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, type, "  Backup entry contains invalid length (%u)", buf, 8u);
          }
          uint64_t v13 = 4294967246;
LABEL_28:
          int v14 = 6;
LABEL_46:

          goto LABEL_47;
        }
        if ((++v38 & 0x7F) == 0)
        {
          if ([(MADPhotosRestoreAnalysisTask *)self isCancelled])
          {
            uint64_t v10 = 4294967168;
LABEL_22:
            int v14 = 6;
            goto LABEL_48;
          }
          id v17 = +[VCPWatchdog sharedWatchdog];
          [v17 pet];
        }
        +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", [v12 dataLength]);
        id v15 = objc_claimAutoreleasedReturnValue();
        uint64_t v13 = (uint64_t)objc_msgSend(v5, "vcp_readBuffer:ofLength:", -[NSObject mutableBytes](v15, "mutableBytes"), objc_msgSend(v12, "dataLength"));
        if (v13)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_28;
          }
          v18 = VCPLogInstance();
          if (os_log_type_enabled(v18, type))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, type, "  Failed to read asset analysis data", buf, 2u);
          }
          goto LABEL_36;
        }
        if ([v12 isCompressed])
        {
          uint64_t v19 = [v35 decompressData:v15];
          if (!v19)
          {
            if ((int)MediaAnalysisLogLevel() < 4)
            {
              int v14 = 15;
              uint64_t v13 = v10;
              goto LABEL_46;
            }
            v18 = VCPLogInstance();
            if (os_log_type_enabled(v18, (os_log_type_t)v34[0]))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v34[0], "  Failed to decompress asset analysis; skipping entry",
                buf,
                2u);
            }
            int v14 = 15;
            goto LABEL_44;
          }
          v20 = v19;
        }
        else
        {
          v20 = v15;
        }
        v18 = [objc_alloc((Class)MADAssetProtoClassForTask(self->_taskID)) initWithData:v20];
        if (v18)
        {
          [v36 addObject:v18];
          if ((unint64_t)[v36 count] >= 0x80)
          {
            id v15 = v20;
            *(void *)long long buf = 0;
            uint64_t v13 = [(MADPhotosRestoreAnalysisTask *)self _persistAssetProtoBatch:v36 successCount:buf];
            if (v13)
            {
LABEL_36:
              int v14 = 6;
LABEL_45:

              goto LABEL_46;
            }
            uint64_t v22 = *(void *)buf;
            uint64_t v33 = +[NSMutableArray array];

            int v14 = 0;
            *(void *)&v34[4] += v22;
            v36 = (void *)v33;
LABEL_44:
            uint64_t v13 = v10;
            goto LABEL_45;
          }
          int v14 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, (os_log_type_t)v34[0]))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v34[0], "  Failed to deserialize asset; skipping entry",
                buf,
                2u);
            }
          }
          int v14 = 15;
        }
        id v15 = v20;
        goto LABEL_44;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        os_log_type_t v28 = VCPLogInstance();
        os_log_type_t v26 = VCPLogToOSLogType[3];
        v23 = v28;
        if (os_log_type_enabled(v28, v26))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&buf[4] = [v7 version];
          v27 = "  Backup contains invalid version (%u)";
          goto LABEL_68;
        }
        goto LABEL_69;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[3];
      v23 = v25;
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&buf[4] = [v7 identifier];
        v27 = "  Backup contains invalid file identifier (%u)";
LABEL_68:
        _os_log_impl((void *)&_mh_execute_header, v23, v26, v27, buf, 8u);
      }
LABEL_69:
      LODWORD(v10) = -50;
      goto LABEL_81;
    }
    LODWORD(v10) = -50;
    goto LABEL_82;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v23 = VCPLogInstance();
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v23, v24))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "  Failed to read backup file header", buf, 2u);
    }
    LODWORD(v10) = -36;
    goto LABEL_81;
  }
  LODWORD(v10) = -36;
LABEL_82:

  return v10;
}

- (int)_performRestore
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(PHPhotoLibrary *)self->_photoLibrary vcp_mediaAnalysisIntermediateRestoreDirectory];
  if (v4)
  {
    if ([v3 fileExistsAtPath:v4])
    {
      id v5 = 0;
    }
    else
    {
      NSFileAttributeKey v50 = NSFilePosixPermissions;
      v51 = &off_10022F220;
      id v6 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v47 = 0;
      unsigned __int8 v7 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v47];
      id v8 = v47;

      if ((v7 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_46:

          goto LABEL_47;
        }
        uint64_t v19 = VCPLogInstance();
        os_log_type_t v20 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v19, v20))
        {
          *(_DWORD *)long long buf = 138412290;
          id v49 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "  Failed to create intermediate restore directory (%@); restore failed",
            buf,
            0xCu);
        }
LABEL_45:

        goto LABEL_46;
      }
      id v5 = v8;
    }
    uint64_t v42 = [(PHPhotoLibrary *)self->_photoLibrary mad_backupFilepathForTask:self->_taskID];
    unsigned int v9 = [(PHPhotoLibrary *)self->_photoLibrary mad_intermediateEncryptedRestoreFilepathForTask:self->_taskID];
    id v46 = 0;
    unsigned __int8 v10 = [v3 copyItemAtPath:v42 toPath:v9 error:&v46];
    id v11 = v46;
    if ((v10 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_44:

        id v8 = v5;
        uint64_t v19 = v42;
        goto LABEL_45;
      }
      int v14 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v18))
      {
        *(_DWORD *)long long buf = 138412290;
        id v49 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, v18, "  Failed to copy backup file to intermediate location (%@)", buf, 0xCu);
      }
LABEL_43:

      goto LABEL_44;
    }
    id v12 = objc_alloc((Class)PFClientSideEncryptionManager);
    uint64_t v13 = [v12 initWithProfile:PFClientSideEncryptionManagerProfileMediaAnalysis];
    int v14 = v13;
    if (v13)
    {
      [v13 start];
      id v15 = +[NSURL fileURLWithPath:v9];
      id v45 = 0;
      [v14 unarchiveDirectoryAtURL:v15 error:&v45];
      id v16 = v45;

      [v14 shutdownWithCompletionHandler:0];
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }
    v41 = v17;
    id v44 = 0;
    unsigned __int8 v21 = [v3 removeItemAtPath:v9 error:&v44];
    id v22 = v44;
    if ((v21 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)long long buf = 138412290;
        id v49 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "  Failed to remove intermediate encrypted restore file (%@)", buf, 0xCu);
      }
    }
    if (v14)
    {
      if (!v41)
      {
        uint64_t v40 = [(PHPhotoLibrary *)self->_photoLibrary mad_intermediateUnencryptedRestoreFilepathForTask:self->_taskID];
        unsigned int v39 = -[MADPhotosRestoreAnalysisTask _restoreFromBackupFilepath:](self, "_restoreFromBackupFilepath:");
        id v43 = v22;
        unsigned __int8 v32 = [v3 removeItemAtPath:v40 error:&v43];
        id v33 = v43;

        if ((v32 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
        {
          v34 = VCPLogInstance();
          os_log_type_t v35 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v34, v35))
          {
            *(_DWORD *)long long buf = 138412290;
            id v49 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, v35, "  Failed to remove intermediate decrypted restore file (%@)", buf, 0xCu);
          }
        }
        if (v39 && (int)MediaAnalysisLogLevel() >= 3)
        {
          v36 = VCPLogInstance();
          os_log_type_t v37 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v36, v37))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "  Failed to restore analysis; restore failed", buf, 2u);
          }
        }
        id v22 = v33;
        id v25 = v40;
        goto LABEL_41;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v25 = VCPLogInstance();
        os_log_type_t v26 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v25, v26))
        {
          *(_DWORD *)long long buf = 138412290;
          id v49 = v41;
          v27 = "  Failed to decrypt backup file (%@); restore failed";
          os_log_type_t v28 = v25;
          os_log_type_t v29 = v26;
          uint32_t v30 = 12;
LABEL_29:
          _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
          goto LABEL_41;
        }
        goto LABEL_41;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v25 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v31))
      {
        *(_WORD *)long long buf = 0;
        v27 = "  Failed to create PFClientSideEncryptionManager; restore failed";
        os_log_type_t v28 = v25;
        os_log_type_t v29 = v31;
        uint32_t v30 = 2;
        goto LABEL_29;
      }
LABEL_41:
    }
    goto LABEL_43;
  }
LABEL_47:

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
      id v6 = VCPTaskIDDescription(self->_taskID);
      int v12 = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Attempting restore for %@", (uint8_t *)&v12, 0x16u);
    }
  }
  if ([(PHPhotoLibrary *)self->_photoLibrary mad_isBackupRestoreEligibleForTask:self->_taskID])
  {
    return [(MADPhotosRestoreAnalysisTask *)self _performRestore];
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      unsigned __int8 v10 = [(PHPhotoLibrary *)self->_photoLibrary photoLibraryURL];
      id v11 = [(id)objc_opt_class() taskName];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "  Photo library (%@) not eligible for restoring %@; skipping",
        (uint8_t *)&v12,
        0x16u);
    }
  }
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
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end