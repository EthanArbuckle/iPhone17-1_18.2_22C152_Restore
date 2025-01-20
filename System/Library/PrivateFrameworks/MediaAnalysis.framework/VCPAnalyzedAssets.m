@interface VCPAnalyzedAssets
+ (id)assetsFromPhotoLibrary:(id)a3;
+ (id)assetsWithoutFingerprintsFromPhotoLibrary:(id)a3;
- (VCPAnalyzedAssets)initWithPhotoLibrary:(id)a3 andCondition:(id)a4;
- (int)next:(id *)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation VCPAnalyzedAssets

- (VCPAnalyzedAssets)initWithPhotoLibrary:(id)a3 andCondition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)VCPAnalyzedAssets;
  v8 = [(VCPAnalyzedAssets *)&v39 init];
  v9 = v8;
  if (!v8)
  {
    v19 = 0;
    goto LABEL_23;
  }
  v8->_database = 0;
  p_database = &v8->_database;
  v8->_statement = 0;
  v11 = +[NSMutableString stringWithString:@"SELECT count(*) FROM Assets"];
  v12 = +[NSMutableString stringWithString:@"SELECT localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, statsFlags, masterFingerprint, adjustedFingerprint FROM Assets"];
  if (v7)
  {
    [v11 appendFormat:@" WHERE %@", v7];
    [v12 appendFormat:@" WHERE %@", v7];
  }
  pStmt = 0;
  v13 = objc_msgSend(v6, "vcp_mediaAnalysisDatabaseFilepath");
  v14 = +[NSFileManager defaultManager];
  unsigned __int8 v15 = [v14 fileExistsAtPath:v13];

  if ((v15 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v20, v21))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "[VCPAnalyzedAssets] Database file does not exist", buf, 2u);
      }
    }
    int v16 = -23;
    goto LABEL_16;
  }
  int v16 = sqlite3_open((const char *)[v13 UTF8String], &v9->_database);
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "[VCPAnalyzedAssets] Failed to open database: %d", buf, 8u);
      }
    }
    goto LABEL_16;
  }
  int v26 = sqlite3_exec(*p_database, "BEGIN TRANSACTION;", 0, 0, 0);
  if (!v26)
  {
    int v16 = sqlite3_prepare_v2(*p_database, (const char *)[v11 UTF8String], -1, &pStmt, 0);
    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_16;
      }
      v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[VCPAnalyzedAssets] Failed to prepare asset count query statement: %d", buf, 8u);
      }
    }
    else
    {
      int v16 = sqlite3_prepare_v2(*p_database, (const char *)[v12 UTF8String], -1, &v9->_statement, 0);
      if (!v16)
      {
        int v32 = sqlite3_exec(*p_database, "END TRANSACTION;", 0, 0, 0);
        if (!v32)
        {
          int v35 = sqlite3_step(pStmt);
          if (v35 == 100)
          {
            int v16 = 0;
            v9->_count = sqlite3_column_int(pStmt, 0);
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v36 = VCPLogInstance();
              os_log_type_t v37 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v36, v37))
              {
                *(_DWORD *)buf = 67109120;
                int v41 = v35;
                _os_log_impl((void *)&_mh_execute_header, v36, v37, "[VCPAnalyzedAssets] Failed to query asset count: %d", buf, 8u);
              }
            }
            int v16 = -18;
          }
          goto LABEL_16;
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v33 = VCPLogInstance();
          os_log_type_t v34 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v33, v34))
          {
            *(_DWORD *)buf = 67109120;
            int v41 = v32;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "[VCPAnalyzedAssets] Failed to end transaction: %d", buf, 8u);
          }
        }
        goto LABEL_29;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_16;
      }
      v29 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v31))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v29, v31, "[VCPAnalyzedAssets] Failed to prepare asset properties query statement: %d", buf, 8u);
      }
    }

    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v27 = VCPLogInstance();
    os_log_type_t v28 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 67109120;
      int v41 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[VCPAnalyzedAssets] Failed to begin transaction: %d", buf, 8u);
    }
  }
LABEL_29:
  int v16 = -20;
LABEL_16:
  sqlite3_finalize(pStmt);
  v22 = v9;
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v16;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "[VCPAnalyzedAssets] Error occurred when querying database: %d", buf, 8u);
      }
    }
    v22 = 0;
  }
  v19 = v22;

LABEL_23:
  return v19;
}

+ (id)assetsFromPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = [[VCPAnalyzedAssets alloc] initWithPhotoLibrary:v3 andCondition:0];

  return v4;
}

+ (id)assetsWithoutFingerprintsFromPhotoLibrary:(id)a3
{
  id v3 = a3;
  v4 = [[VCPAnalyzedAssets alloc] initWithPhotoLibrary:v3 andCondition:@"masterFingerprint is NULL"];

  return v4;
}

- (void)dealloc
{
  sqlite3_finalize(self->_statement);
  sqlite3_close(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)VCPAnalyzedAssets;
  [(VCPAnalyzedAssets *)&v3 dealloc];
}

- (int)next:(id *)a3
{
  int v5 = sqlite3_step(self->_statement);
  if (v5 == 100)
  {
    statement = self->_statement;
    if (sqlite3_column_type(statement, 0) == 5)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = +[NSString stringWithUTF8String:sqlite3_column_text(statement, 0)];
    }
    v25 = (void *)v7;
    uint64_t v12 = sqlite3_column_int(self->_statement, 1);
    v13 = self->_statement;
    if (sqlite3_column_type(v13, 2) == 5)
    {
      os_log_type_t v24 = 0;
    }
    else
    {
      os_log_type_t v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(v13, 2)];
    }
    v14 = self->_statement;
    if (sqlite3_column_type(v14, 3) == 5)
    {
      uint64_t v15 = v12;
      int v16 = 0;
    }
    else
    {
      int v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:sqlite3_column_double(v14, 3)];
      uint64_t v15 = v12;
    }
    sqlite3_int64 v17 = sqlite3_column_int64(self->_statement, 4);
    int v18 = sqlite3_column_int(self->_statement, 5);
    sqlite3_int64 v19 = sqlite3_column_int64(self->_statement, 6);
    v20 = self->_statement;
    if (sqlite3_column_type(v20, 7) == 5)
    {
      os_log_type_t v21 = 0;
    }
    else
    {
      os_log_type_t v21 = +[NSString stringWithUTF8String:sqlite3_column_text(v20, 7)];
    }
    v22 = self->_statement;
    if (sqlite3_column_type(v22, 8) == 5)
    {
      v23 = 0;
    }
    else
    {
      v23 = +[NSString stringWithUTF8String:sqlite3_column_text(v22, 8)];
    }
    *a3 = +[VCPAnalyzedAsset assetWithLocalIdentifier:v25 version:v15 dateModified:v24 dateAnalyzed:v16 types:v17 flags:v18 statsFlags:v19 masterFingerprint:v21 adjustedFingerprint:v23];

    return 0;
  }
  int v8 = v5;
  *a3 = 0;
  if (v5 == 101) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[VCPAnalyzedAssets] Failed to query next asset: %d", buf, 8u);
    }
  }
  return -19;
}

- (unint64_t)count
{
  return self->_count;
}

@end