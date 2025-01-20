@interface VCPRestoreDatabaseTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (int)mainInternal;
- (int)restoreDatabaseToFilepath:(id)a3 fromBackupFilepath:(id)a4;
@end

@implementation VCPRestoreDatabaseTask

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

- (int)restoreDatabaseToFilepath:(id)a3 fromBackupFilepath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v67 = v5;
  v68 = v6;
  v8 = +[NSInputStream inputStreamWithFileAtPath:v6];
  [v8 open];
  v9 = +[VCPBackupFileHeader headerForTask:1];
  v10 = +[VCPBackupFileHeader headerFromStream:v8];
  v11 = v10;
  v66 = v7;
  if (v10)
  {
    unsigned int v12 = [v10 identifier];
    if (v12 == [v9 identifier])
    {
      unsigned int v13 = [v11 version];
      if (v13 == [v9 version])
      {
        v62 = +[VCPDatabaseWriter databaseWithFilepath:v5];
        v61 = +[VCPDataDecompressor decompressor];
        v56 = 0;
        uint64_t v65 = 0;
        uint64_t v14 = 0;
        os_log_type_t type = VCPLogToOSLogType[3];
        os_log_type_t v57 = VCPLogToOSLogType[5];
        while (1)
        {
          if (![v8 hasBytesAvailable])
          {
LABEL_126:
            [v8 close];
            if ([v62 flushWAL] && (int)MediaAnalysisLogLevel() >= 3)
            {
              v49 = VCPLogInstance();
              if (os_log_type_enabled(v49, type))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v49, type, "  Failed to flush database WAL; restore may be incomplete",
                  buf,
                  2u);
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v50 = VCPLogInstance();
              if (os_log_type_enabled(v50, v57))
              {
                *(_DWORD *)buf = 134218240;
                v71 = v56;
                __int16 v72 = 2048;
                *(void *)v73 = v65;
                _os_log_impl((void *)&_mh_execute_header, v50, v57, "  Restored %zu/%zu full analysis records", buf, 0x16u);
              }
            }
LABEL_135:

            v43 = v62;
LABEL_136:

            goto LABEL_137;
          }
          v16 = +[VCPBackupEntryHeader header];
          uint64_t v17 = (uint64_t)[v16 readFromStream:v8];
          if (!v17) {
            break;
          }
          if ([v8 streamStatus] == (id)5)
          {
            int v18 = 16;
            goto LABEL_94;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, type))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, type, "  Failed to read backup entry header", buf, 2u);
            }
            goto LABEL_24;
          }
          int v18 = 6;
LABEL_93:
          uint64_t v14 = v17;
LABEL_94:

          if (v18 && v18 != 15)
          {
            if (v18 != 16) {
              goto LABEL_135;
            }
            goto LABEL_126;
          }
        }
        if ([v16 dataLength] > 0x200000)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            uint64_t v14 = 4294967246;
            int v18 = 6;
            goto LABEL_94;
          }
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, type))
          {
            unsigned int v20 = [v16 dataLength];
            *(_DWORD *)buf = 67109120;
            LODWORD(v71) = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, type, "  Backup entry contains invalid length (%u)", buf, 8u);
          }
          uint64_t v17 = 4294967246;
LABEL_24:
          int v18 = 6;
LABEL_92:

          goto LABEL_93;
        }
        if ((++v65 & 0x7F) == 0)
        {
          v21 = +[VCPWatchdog sharedWatchdog];
          [v21 pet];
        }
        +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", [v16 dataLength]);
        v19 = objc_claimAutoreleasedReturnValue();
        uint64_t v17 = (uint64_t)objc_msgSend(v8, "vcp_readBuffer:ofLength:", -[NSObject mutableBytes](v19, "mutableBytes"), objc_msgSend(v16, "dataLength"));
        if (v17)
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_24;
          }
          v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, type))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, type, "  Failed to read asset analysis data", buf, 2u);
          }
          int v18 = 6;
          goto LABEL_91;
        }
        if ([v16 isCompressed])
        {
          uint64_t v23 = [v61 decompressData:v19];
          if (!v23)
          {
            if ((int)MediaAnalysisLogLevel() < 3)
            {
              int v18 = 15;
              uint64_t v17 = v14;
              goto LABEL_92;
            }
            v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, type))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, type, "  Failed to decompress asset analysis; skipping entry",
                buf,
                2u);
            }
            goto LABEL_60;
          }
          v24 = v23;
        }
        else
        {
          v24 = v19;
        }
        v25 = [objc_alloc((Class)VCPProtoAssetAnalysis) initWithData:v24];
        v22 = v25;
        if (v25)
        {
          v59 = v24;
          v60 = [v25 assetCloudIdentifier];
          if (v60)
          {
            v26 = [(VCPTask *)self photoLibrary];
            id v69 = 0;
            v58 = objc_msgSend(v26, "mad_localIdentifierForCloudIdentifier:error:", v60, &v69);
            v55 = v69;

            if (v58)
            {
              v54 = [v22 exportToLegacyDictionary];
              if (v54)
              {
                v53 = +[NSMutableDictionary dictionary];
                v74 = v58;
                v27 = +[NSArray arrayWithObjects:&v74 count:1];
                BOOL v28 = [v62 queryHeadersForAssets:v27 analyses:v53] == 0;

                if (!v28) {
                  goto LABEL_39;
                }
                v29 = [v53 objectForKeyedSubscript:v58];
                v30 = v29;
                if (!v29
                  || (int v31 = objc_msgSend(v29, "vcp_version"), v31 < (int)objc_msgSend(v54, "vcp_version")))
                {

LABEL_39:
                  id v32 = [v62 restoreAnalysis:v54 forLocalIdentifier:v58];
                  if (v32)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      v33 = VCPLogInstance();
                      if (os_log_type_enabled(v33, type))
                      {
                        *(_DWORD *)buf = 138412290;
                        v71 = v58;
                        _os_log_impl((void *)&_mh_execute_header, v33, type, "  [%@] Failed to restore analysis to database", buf, 0xCu);
                      }
                    }
                    int v18 = 6;
                    if (v32 == -108 || v32 == -36)
                    {
                      uint64_t v34 = (uint64_t)v32;
LABEL_71:
                      if (v32 == -108 || v32 == -36 || v32 == -23)
                      {
                        uint64_t v14 = v34;
LABEL_85:

                        goto LABEL_86;
                      }
                      if (v32 || (++v56, (v56 & 0x7F) != 0))
                      {
                        uint64_t v14 = v34;
LABEL_78:
                        int v18 = 0;
                        goto LABEL_85;
                      }
                      id v41 = [v62 commit];
                      if (!v41) {
                        goto LABEL_105;
                      }
                      if ((int)MediaAnalysisLogLevel() >= 3)
                      {
                        v42 = VCPLogInstance();
                        if (os_log_type_enabled(v42, type))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v42, type, "  Failed to commit restores to database", buf, 2u);
                        }
                      }
                      int v18 = 6;
                      if (v41 == -108 || v41 == -36)
                      {
                        uint64_t v14 = (uint64_t)v41;
                        goto LABEL_107;
                      }
                      uint64_t v14 = (uint64_t)v41;
                      if (v41 != -23)
                      {
LABEL_105:
                        int v18 = 0;
                        uint64_t v14 = v34;
                      }
LABEL_107:
                      if (v41 == -108 || v41 == -36 || v41 == -23) {
                        goto LABEL_85;
                      }
                      goto LABEL_78;
                    }
                    uint64_t v34 = (uint64_t)v32;
                    if (v32 == -23) {
                      goto LABEL_71;
                    }
                  }
                  int v18 = 0;
                  uint64_t v34 = v14;
                  goto LABEL_71;
                }
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  v39 = VCPLogInstance();
                  if (os_log_type_enabled(v39, v57))
                  {
                    unsigned int v52 = objc_msgSend(v30, "vcp_version");
                    unsigned int v40 = objc_msgSend(v54, "vcp_version");
                    *(_DWORD *)buf = 138412802;
                    v71 = v58;
                    __int16 v72 = 1024;
                    *(_DWORD *)v73 = v52;
                    *(_WORD *)&v73[4] = 1024;
                    *(_DWORD *)&v73[6] = v40;
                    _os_log_impl((void *)&_mh_execute_header, v39, v57, "  [%@] Existing version (%d) >= Backup'd analysis version (%d); skipping entry",
                      buf,
                      0x18u);
                  }
                }
LABEL_84:
                int v18 = 15;
                goto LABEL_85;
              }
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v38 = VCPLogInstance();
                v53 = v38;
                if (os_log_type_enabled(v38, type))
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = v58;
                  _os_log_impl((void *)&_mh_execute_header, v38, type, "  [%@] Failed to convert asset analysis; skipping entry",
                    buf,
                    0xCu);
                }
                goto LABEL_84;
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 3)
              {
                int v18 = 15;
LABEL_87:

                v36 = v55;
LABEL_88:

                goto LABEL_89;
              }
              v37 = VCPLogInstance();
              v54 = v37;
              if (os_log_type_enabled(v37, type))
              {
                *(_DWORD *)buf = 138412546;
                v71 = v60;
                __int16 v72 = 2112;
                *(void *)v73 = v55;
                _os_log_impl((void *)&_mh_execute_header, v37, type, "  Failed to convert cloud identifier %@ to local identifier (%@); skipping entry",
                  buf,
                  0x16u);
              }
            }
            int v18 = 15;
LABEL_86:

            goto LABEL_87;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v36 = VCPLogInstance();
            if (os_log_type_enabled(v36, type))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, type, "  Asset analysis is missing cloud identifier; skipping entry",
                buf,
                2u);
            }
            int v18 = 15;
            goto LABEL_88;
          }
LABEL_55:
          int v18 = 15;
LABEL_89:

          v19 = v59;
          goto LABEL_90;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v59 = v24;
          v35 = VCPLogInstance();
          v60 = v35;
          if (os_log_type_enabled(v35, type))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, type, "  Failed to deserialize asset analysis; skipping entry",
              buf,
              2u);
          }
          goto LABEL_55;
        }
        v19 = v24;
LABEL_60:
        int v18 = 15;
LABEL_90:
        uint64_t v17 = v14;
LABEL_91:

        goto LABEL_92;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v48 = VCPLogInstance();
        os_log_type_t v46 = VCPLogToOSLogType[3];
        v43 = v48;
        if (os_log_type_enabled(v48, v46))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v71) = [v11 version];
          v47 = "  Backup contains invalid version (%u)";
          goto LABEL_122;
        }
        goto LABEL_123;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[3];
      v43 = v45;
      if (os_log_type_enabled(v45, v46))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v71) = [v11 identifier];
        v47 = "  Backup contains invalid file identifier (%u)";
LABEL_122:
        _os_log_impl((void *)&_mh_execute_header, v43, v46, v47, buf, 8u);
      }
LABEL_123:
      LODWORD(v14) = -50;
      goto LABEL_136;
    }
    LODWORD(v14) = -50;
    goto LABEL_137;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v43 = VCPLogInstance();
    os_log_type_t v44 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v43, v44))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "  Failed to read backup file header", buf, 2u);
    }
    LODWORD(v14) = -36;
    goto LABEL_136;
  }
  LODWORD(v14) = -36;
LABEL_137:

  return v14;
}

- (int)mainInternal
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking full analysis restore...", buf, 2u);
    }
  }
  id v5 = VCPTaskIDDescription(1);
  id v6 = [(VCPTask *)self photoLibrary];
  unsigned __int8 v7 = objc_msgSend(v6, "mad_isBackupRestoreEligibleForTask:", 1);

  if (v7)
  {
    v8 = [(VCPTask *)self photoLibrary];
    v9 = objc_msgSend(v8, "vcp_mediaAnalysisIntermediateRestoreDirectory");

    if (!v9)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_62:

        goto LABEL_63;
      }
      v10 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v10, v26))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v26, "  Unknown intermediate restore directory; skipping restore",
          buf,
          2u);
      }
LABEL_61:

      goto LABEL_62;
    }
    v10 = +[NSFileManager defaultManager];
    if (([v10 fileExistsAtPath:v9] & 1) == 0)
    {
      NSFileAttributeKey v60 = NSFilePosixPermissions;
      v61 = &off_10022F8E0;
      v11 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      id v59 = 0;
      unsigned __int8 v12 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v11 error:&v59];
      unsigned int v13 = v59;

      if ((v12 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_60:

          goto LABEL_61;
        }
        v16 = VCPLogInstance();
        os_log_type_t v28 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v16, v28))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, v28, "  Failed to create intermediate restore directory (%@); restore failed",
            buf,
            0xCu);
        }
LABEL_59:

        goto LABEL_60;
      }
    }
    uint64_t v14 = [(VCPTask *)self photoLibrary];
    unsigned int v13 = objc_msgSend(v14, "vcp_mediaAnalysisBackupFilepath");

    uint64_t v15 = [(VCPTask *)self photoLibrary];
    v16 = objc_msgSend((id)v15, "mad_intermediateEncryptedRestoreFilepathForTask:", 1);

    id v58 = 0;
    LOBYTE(v15) = [v10 copyItemAtPath:v13 toPath:v16 error:&v58];
    uint64_t v17 = v58;
    if ((v15 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_58:

        goto LABEL_59;
      }
      v22 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v27))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, v27, "  Failed to copy backup file to intermediate location (%@)", buf, 0xCu);
      }
LABEL_57:

      goto LABEL_58;
    }
    id v18 = objc_alloc((Class)PFClientSideEncryptionManager);
    id v19 = [v18 initWithProfile:PFClientSideEncryptionManagerProfileMediaAnalysis];
    v54 = v19;
    if (v19)
    {
      [v19 start];
      unsigned int v20 = +[NSURL fileURLWithPath:v16];
      id v57 = 0;
      [v54 unarchiveDirectoryAtURL:v20 error:&v57];
      v21 = v57;

      [v54 shutdownWithCompletionHandler:0];
      v22 = v21;
    }
    else
    {
      v22 = 0;
    }
    id v56 = 0;
    unsigned __int8 v29 = [v10 removeItemAtPath:v16 error:&v56];
    v30 = v56;
    if ((v29 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v49 = v17;
      int v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "  Failed to remove intermediate encrypted restore file (%@)", buf, 0xCu);
      }

      uint64_t v17 = v49;
    }
    if (!v54)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v33 = VCPLogInstance();
        os_log_type_t v39 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v33, v39))
        {
          *(_WORD *)buf = 0;
          v35 = "  Failed to create PFClientSideEncryptionManager; restore failed";
          v36 = v33;
          os_log_type_t v37 = v39;
          uint32_t v38 = 2;
          goto LABEL_39;
        }
LABEL_55:
      }
LABEL_56:

      goto LABEL_57;
    }
    if (v22)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v33 = VCPLogInstance();
        os_log_type_t v34 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v22;
          v35 = "  Failed to decrypt backup file (%@); restore failed";
          v36 = v33;
          os_log_type_t v37 = v34;
          uint32_t v38 = 12;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v36, v37, v35, buf, v38);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    unsigned int v40 = [(VCPTask *)self photoLibrary];
    uint64_t v53 = objc_msgSend(v40, "mad_intermediateUnencryptedRestoreFilepathForTask:", 1);

    uint64_t v41 = [(VCPTask *)self photoLibrary];
    v51 = objc_msgSend((id)v41, "vcp_mediaAnalysisDatabaseFilepath");

    unsigned int v42 = [(VCPRestoreDatabaseTask *)self restoreDatabaseToFilepath:v51 fromBackupFilepath:v53];
    v55 = v30;
    LOBYTE(v41) = [v10 removeItemAtPath:v53 error:&v55];
    unsigned int v52 = v55;

    if ((v41 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v50 = v17;
      v43 = VCPLogInstance();
      os_log_type_t v44 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v43, v44))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v52;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "  Failed to remove intermediate decrypted restore file (%@)", buf, 0xCu);
      }

      uint64_t v17 = v50;
    }
    if (v42)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v45 = VCPLogInstance();
        os_log_type_t v46 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v45, v46))
        {
          *(_WORD *)buf = 0;
          v47 = "  Failed to restore analysis database; restore failed";
LABEL_52:
          _os_log_impl((void *)&_mh_execute_header, v45, v46, v47, buf, 2u);
          goto LABEL_53;
        }
        goto LABEL_53;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v45 = VCPLogInstance();
      os_log_type_t v46 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v45, v46))
      {
        *(_WORD *)buf = 0;
        v47 = "  Successfully restored full analysis database";
        goto LABEL_52;
      }
LABEL_53:
    }
    v30 = v52;
    v33 = v53;
    goto LABEL_55;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v9 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v9, v23))
    {
      v24 = [(VCPTask *)self photoLibrary];
      v25 = [v24 photoLibraryURL];
      *(_DWORD *)buf = 138412546;
      v63 = v25;
      __int16 v64 = 2112;
      uint64_t v65 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, v23, "  Photo library (%@) not eligible for restoring %@; skipping",
        buf,
        0x16u);
    }
    goto LABEL_62;
  }
LABEL_63:

  return 0;
}

@end