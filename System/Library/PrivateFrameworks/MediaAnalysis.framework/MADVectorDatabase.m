@interface MADVectorDatabase
+ (id)_vectorDatabaseAttributes;
+ (id)_vectorDatabaseVersion;
+ (id)databaseDirectoryURLForPhotoLibrary:(id)a3;
+ (id)databaseWithPhotoLibrary:(id)a3 readyOnly:(BOOL)a4;
+ (id)historicalFolderNames;
- (BOOL)hasMigration;
- (MADVectorDatabase)initWithPhotoLibrary:(id)a3 readyOnly:(BOOL)a4;
- (id)_vectorDatabaseReadOnlyConfigWithError:(id *)a3;
- (id)_vectorDatabaseReadWriteConfigWithError:(id *)a3;
- (id)databaseDirectoryURL;
- (id)fetchAllAssetsWithLimit:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5;
- (id)fetchAssetsWithLocalIdentifiers:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5;
- (id)fetchAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)searchWithEmbeddings:(id)a3 localIdentifiers:(id)a4 attributeFilters:(id)a5 limit:(int)a6 fullScan:(BOOL)a7 includePayload:(BOOL)a8 numberOfProbes:(id)a9 batchSize:(id)a10 numConcurrentReaders:(id)a11 error:(id *)a12;
- (int)_openVSKClientWithError:(id *)a3;
- (int)insertOrReplaceAssetsEmbeddings:(id)a3 error:(id *)a4;
- (int)rebuildWithForce:(BOOL)a3 cancelBlock:(id)a4 extendTimeoutBlock:(id)a5 error:(id *)a6;
- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5;
- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 error:(id *)a4;
- (unint64_t)assetCountWithError:(id *)a3;
- (unint64_t)embeddingCountWithError:(id *)a3;
- (void)_purgeHistoricalData;
- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3;
@end

@implementation MADVectorDatabase

- (MADVectorDatabase)initWithPhotoLibrary:(id)a3 readyOnly:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MADVectorDatabase;
  v8 = [(MADVectorDatabase *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    uint64_t v10 = [(id)objc_opt_class() databaseDirectoryURLForPhotoLibrary:v9->_photoLibrary];
    directoryURL = v9->_directoryURL;
    v9->_directoryURL = (NSURL *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaanalysis.sql.vector", v12);
    vskClientQueue = v9->_vskClientQueue;
    v9->_vskClientQueue = (OS_dispatch_queue *)v13;

    v9->_readOnly = a4;
    id v21 = 0;
    LODWORD(v12) = [(MADVectorDatabase *)v9 _openVSKClientWithError:&v21];
    id v15 = v21;
    v16 = v9;
    if (v12)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = @"read-only";
          if (!v9->_readOnly) {
            v18 = @"read-write";
          }
          *(_DWORD *)buf = 138412546;
          v24 = v18;
          __int16 v25 = 2112;
          id v26 = v15;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[VSKDB] Failed to initialize %@ database - %@", buf, 0x16u);
        }
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v19 = v16;

  return v19;
}

+ (id)databaseWithPhotoLibrary:(id)a3 readyOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v5 readyOnly:v4];

  return v6;
}

+ (id)databaseDirectoryURLForPhotoLibrary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = objc_msgSend(v3, "vcp_mediaAnalysisDirectory");
  v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v14 = 0;
    v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8 isDirectory:&v14];

    if (v14) {
      char v10 = v9;
    }
    else {
      char v10 = 0;
    }
    if (v10)
    {
      v11 = [v6 URLByAppendingPathComponent:@"vector_database"];
LABEL_15:

      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v6;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[VSKDB] Invalid media analysis directory %@", buf, 0xCu);
      }
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[VSKDB] Failed to retrieve path for Photo Library %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

+ (id)historicalFolderNames
{
  v6[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v6[0] = @"vskdata";
  v6[1] = @"vskdata_MD2";
  v6[2] = @"vskdata_MD3";
  v6[3] = @"vskdataMD2";
  v6[4] = @"vskdataMD3";
  v6[5] = @"vskdataMD4";
  v6[6] = @"vskdataMD3_1";
  v6[7] = @"vskdataMD4_1";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:8];
  BOOL v4 = [v2 arrayWithArray:v3];

  return v4;
}

- (void)_purgeHistoricalData
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [(PHPhotoLibrary *)self->_photoLibrary vcp_mediaAnalysisDirectory];
  BOOL v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(id)objc_opt_class() historicalFolderNames];
  v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1C186D320]();
        v12 = [v4 URLByAppendingPathComponent:v10];
        dispatch_queue_t v13 = [v12 path];
        int v14 = [v5 fileExistsAtPath:v13 isDirectory:0];

        if (v14)
        {
          id v23 = v6;
          char v15 = [v5 removeItemAtURL:v12 error:&v23];
          id v16 = v23;

          if (v15)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v17 = VCPLogInstance();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v12;
                v18 = v17;
                os_log_type_t v19 = OS_LOG_TYPE_INFO;
                v20 = "[VSKDB] Removed %@";
                uint32_t v21 = 12;
                goto LABEL_14;
              }
              goto LABEL_15;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              __int16 v30 = 2112;
              id v31 = v16;
              v18 = v17;
              os_log_type_t v19 = OS_LOG_TYPE_ERROR;
              v20 = "[VSKDB] Failed to remove %@ - %@";
              uint32_t v21 = 22;
LABEL_14:
              _os_log_impl(&dword_1BBEDA000, v18, v19, v20, buf, v21);
            }
LABEL_15:
          }
          v6 = v16;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
}

+ (id)_vectorDatabaseAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4FB3BC8], "mad_embeddingVersionAttribute");
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_vectorDatabaseVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  {
    if (_os_feature_enabled_impl()) {
      int v5 = 5;
    }
    else {
      int v5 = 4;
    }
    +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMajorVersion = v5;
  }
  {
    if (+[MADEmbeddingStore includeAudioFusedVideoEmbeddings])
    {
      int v6 = 3;
    }
    else
    {
      int v6 = 2;
    }
    +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMinorVersion = v6;
  }
  {
    +[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion = objc_msgSend(NSString, "stringWithFormat:", @"%u.%u", +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMajorVersion, +[MADVectorDatabase _vectorDatabaseVersion]::kVectorDatabaseMinorVersion);
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = +[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[VSKDB] Target version: %@", buf, 0xCu);
    }
  }
  id v3 = (void *)+[MADVectorDatabase _vectorDatabaseVersion]::vectorDatabaseVersion;
  return v3;
}

- (id)_vectorDatabaseReadWriteConfigWithError:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v56 = [(id)objc_opt_class() _vectorDatabaseVersion];
  BOOL v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  int v6 = VCPSignPostLog();
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MAD_VSKConfigAbbreviatedInit", "", buf, 2u);
  }

  id v8 = objc_alloc(MEMORY[0x1E4FB3BE0]);
  directoryURL = self->_directoryURL;
  id v60 = 0;
  uint64_t v10 = (void *)[v8 initWithBaseDirectory:directoryURL readOnly:0 perConnectionPeakMemory:0 error:&v60];
  v11 = v60;
  v12 = VCPSignPostLog();
  dispatch_queue_t v13 = v12;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v5, "MAD_VSKConfigAbbreviatedInit", "", buf, 2u);
  }

  int v14 = [v10 clientVersion];
  int v15 = [v14 isEqualToString:v56];

  if (!v15)
  {
    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        os_log_type_t v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = (NSURL *)v11;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[VSKDB] Unable to initialize vector database with abbreviated initializer: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v20 = [v10 clientVersion];
      char v21 = [v20 isEqualToString:v56];

      if ((v21 & 1) != 0 || (int)MediaAnalysisLogLevel() < 5)
      {
LABEL_23:
        self->_hasMigration = 1;
        id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v24 = [(NSURL *)self->_directoryURL path];
        int v25 = [v23 fileExistsAtPath:v24 isDirectory:0];

        if (v25)
        {
          long long v26 = self->_directoryURL;
          id v59 = 0;
          char v27 = [v23 removeItemAtURL:v26 error:&v59];
          v28 = v59;
          v11 = v28;
          if ((v27 & 1) == 0)
          {
            if (a3) {
              *a3 = [v28 copy];
            }
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v43 = VCPLogInstance();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v51 = self->_directoryURL;
                *(_DWORD *)buf = 138412546;
                v64 = v51;
                __int16 v65 = 2112;
                v66 = v11;
                v48 = "[VSKDB] Failed to remove %@ - %@";
                v49 = v43;
                uint32_t v50 = 22;
                goto LABEL_54;
              }
LABEL_55:
              v18 = 0;
LABEL_59:

              goto LABEL_60;
            }
LABEL_56:
            v18 = 0;
LABEL_60:

            goto LABEL_61;
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              __int16 v30 = self->_directoryURL;
              *(_DWORD *)buf = 138412290;
              v64 = v30;
              _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_INFO, "[VSKDB] Removed %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v11 = 0;
        }
        id v31 = [(NSURL *)self->_directoryURL path];
        uint64_t v61 = *MEMORY[0x1E4F28330];
        v32 = [NSNumber numberWithShort:493];
        v62 = v32;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v58 = v11;
        char v34 = [v23 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:v33 error:&v58];
        v35 = v58;

        v11 = v35;
        if (v34)
        {
          v36 = VCPSignPostLog();
          os_signpost_id_t v37 = os_signpost_id_generate(v36);

          v38 = VCPSignPostLog();
          v39 = v38;
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "MAD_VSKConfigFullInit", "", buf, 2u);
          }

          id v40 = objc_alloc(MEMORY[0x1E4FB3BE0]);
          v41 = self->_directoryURL;
          v42 = [(id)objc_opt_class() _vectorDatabaseAttributes];
          v57 = v11;
          LOWORD(v54) = 0;
          LOBYTE(v53) = 1;
          v43 = objc_msgSend(v40, "initWithBaseDirectory:distanceMetric:filterableAttributes:dimension:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:enableFTS:dataType:maxIndexConstructionBatches:readOnly:pretokenizationEnabled:prefixIndices:perConnectionPeakMemory:clientVersion:error:", v41, 1, v42, 512, 0, 0, 0, 0, v53, 0, 0, v54, MEMORY[0x1E4F1CBF0], 0,
                              v56,
                              &v57);
          v44 = v57;

          v45 = VCPSignPostLog();
          v46 = v45;
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_END, v37, "MAD_VSKConfigFullInit", "", buf, 2u);
          }

          if (v44)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v47 = VCPLogInstance();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v64 = (NSURL *)v44;
                _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_ERROR, "[VSKDB] Failed to setup VSKConfig - %@", buf, 0xCu);
              }
            }
            v18 = 0;
            if (a3) {
              *a3 = [v44 copy];
            }
            v11 = v44;
          }
          else
          {
            v43 = v43;
            v11 = 0;
            v18 = v43;
          }
          goto LABEL_59;
        }
        if (a3) {
          *a3 = [v35 copy];
        }
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v43 = VCPLogInstance();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v64 = (NSURL *)v35;
            v48 = "[VSKDB] Failed to create database directory - %@";
            v49 = v43;
            uint32_t v50 = 12;
LABEL_54:
            _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v22 = [v10 clientVersion];
        *(_DWORD *)buf = 138412546;
        v64 = v22;
        __int16 v65 = 2112;
        v66 = v56;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "[VSKDB] Existing version %@, upgrading to %@", buf, 0x16u);
      }
    }

    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v10 clientVersion];
      *(_DWORD *)buf = 138412290;
      v64 = v17;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "[VSKDB] Existing version %@ matches target", buf, 0xCu);
    }
  }
  self->_hasMigration = 0;
  v18 = v10;
LABEL_61:

  return v18;
}

- (id)_vectorDatabaseReadOnlyConfigWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [(NSURL *)self->_directoryURL path];
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

  if (v7)
  {
    id v8 = VCPSignPostLog();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    uint64_t v10 = VCPSignPostLog();
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MAD_VSKConfigReadInitialization_ReadOnly", "", buf, 2u);
    }

    id v12 = objc_alloc(MEMORY[0x1E4FB3BE0]);
    directoryURL = self->_directoryURL;
    id v24 = 0;
    int v14 = (void *)[v12 initWithBaseDirectory:directoryURL readOnly:1 perConnectionPeakMemory:0 error:&v24];
    int v15 = v24;
    id v16 = VCPSignPostLog();
    uint64_t v17 = v16;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v9, "MAD_VSKConfigReadInitialization_ReadOnly", "", buf, 2u);
    }

    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v26 = v15;
          _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[VSKDB] Failed to setup read-only VSKConfig - %@", buf, 0xCu);
        }
      }
      id v19 = 0;
      if (a3) {
        *a3 = [v15 copy];
      }
    }
    else
    {
      id v19 = v14;
    }
  }
  else
  {
    if (a3)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      char v21 = [NSString stringWithFormat:@"[VSKDB] Database directory does not exist"];
      v28[0] = v21;
      objc_super v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a3 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v22];
    }
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v19 = 0;
      goto LABEL_25;
    }
    int v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[VSKDB] Database directory does not exist", buf, 2u);
    }
    id v19 = 0;
  }

LABEL_25:
  return v19;
}

- (int)_openVSKClientWithError:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (self->_readOnly) {
    os_signpost_id_t v5 = @"ReadOnly";
  }
  else {
    os_signpost_id_t v5 = @"ReadWrite";
  }
  int v6 = [NSString stringWithFormat:@"[VSKDB][Initialization|%@]", v5];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    char v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v6;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "%@ Start ...", buf, 0xCu);
    }
  }
  [(MADVectorDatabase *)self _purgeHistoricalData];
  if (self->_readOnly)
  {
    uint64_t v44 = 0;
    id v8 = (id *)&v44;
    uint64_t v9 = [(MADVectorDatabase *)self _vectorDatabaseReadOnlyConfigWithError:&v44];
  }
  else
  {
    uint64_t v43 = 0;
    id v8 = (id *)&v43;
    uint64_t v9 = [(MADVectorDatabase *)self _vectorDatabaseReadWriteConfigWithError:&v43];
  }
  uint64_t v10 = (void *)v9;
  id v11 = *v8;
  id v12 = v11;
  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        directoryURL = self->_directoryURL;
        *(_DWORD *)buf = 138412802;
        id v46 = v6;
        __int16 v47 = 2112;
        id v48 = v10;
        __int16 v49 = 2112;
        uint32_t v50 = directoryURL;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "%@ Loaded configuration %@ at directory %@", buf, 0x20u);
      }
    }
    int v15 = VCPSignPostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    uint64_t v17 = VCPSignPostLog();
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MAD_VSKClientInitialization", "", buf, 2u);
    }

    id v42 = v12;
    id v19 = [[MADVSKClient alloc] initWithConfig:v10 error:&v42];
    id v20 = v42;

    vskClient = self->_vskClient;
    self->_vskClient = v19;

    id v12 = v20;
    if (self->_vskClient)
    {
      objc_super v22 = VCPSignPostLog();
      id v23 = v22;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v16, "MAD_VSKClientInitialization", "", buf, 2u);
      }

      id v24 = VCPSignPostLog();
      os_signpost_id_t v25 = os_signpost_id_generate(v24);

      long long v26 = VCPSignPostLog();
      uint64_t v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "MAD_VSKWarmUp", "", buf, 2u);
      }

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v6;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_INFO, "%@ Warming up", buf, 0xCu);
        }
      }
      [(MADVSKClient *)self->_vskClient warmup];
      v29 = VCPSignPostLog();
      __int16 v30 = v29;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v25, "MAD_VSKWarmUp", "", buf, 2u);
      }

      id v41 = v20;
      id v31 = [(MADVectorDatabase *)self _vectorDatabaseReadOnlyConfigWithError:&v41];
      id v32 = v41;

      if (v31)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __45__MADVectorDatabase__openVSKClientWithError___block_invoke;
        v39[3] = &unk_1E62983E0;
        id v40 = v31;
        uint64_t v33 = +[VCPObjectPool objectPoolWithAllocator:v39];
        searchClientPool = self->_searchClientPool;
        self->_searchClientPool = v33;

        int v35 = 0;
        v36 = v40;
      }
      else
      {
        if (a3) {
          *a3 = (id)[v32 copy];
        }
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v35 = -18;
          goto LABEL_55;
        }
        v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v32;
          _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "[VSKDB][Initialization|Search] Failed to create read-only vskConfig - %@", buf, 0xCu);
        }
        int v35 = -18;
      }

LABEL_55:
      id v12 = v32;
      goto LABEL_56;
    }
    if (a3) {
      *a3 = (id)[v20 copy];
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v6;
        __int16 v47 = 2112;
        id v48 = v20;
        os_signpost_id_t v37 = "%@ Failed to initialize VSKClient - %@";
        goto LABEL_45;
      }
      goto LABEL_46;
    }
  }
  else
  {
    if (a3) {
      *a3 = (id)[v11 copy];
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v6;
        __int16 v47 = 2112;
        id v48 = v12;
        os_signpost_id_t v37 = "%@ Failed to create vskConfig - %@";
LABEL_45:
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, v37, buf, 0x16u);
      }
LABEL_46:
      int v35 = -18;
LABEL_56:

      goto LABEL_57;
    }
  }
  int v35 = -18;
LABEL_57:

  return v35;
}

MADVSKClient *__45__MADVectorDatabase__openVSKClientWithError___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MADVSKClient alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  BOOL v4 = [(MADVSKClient *)v2 initWithConfig:v3 error:&v8];
  id v5 = v8;
  if (!v4 && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[VSKDB][Initialization|Search] Failed to create read-only VSKClient - %@", buf, 0xCu);
    }
  }
  return v4;
}

- (id)databaseDirectoryURL
{
  return self->_directoryURL;
}

- (int)insertOrReplaceAssetsEmbeddings:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = v6;
  if (self->_readOnly)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"[VSKDB][InsertOrReplace]";
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "%@ Operation not permitted for read-only client", (uint8_t *)&buf, 0xCu);
      }
    }
    int v9 = -18;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    vskClientQueue = self->_vskClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MADVectorDatabase_insertOrReplaceAssetsEmbeddings_error___block_invoke;
    block[3] = &unk_1E6298408;
    block[4] = self;
    id v13 = v6;
    int v14 = @"[VSKDB][InsertOrReplace]";
    p_long long buf = &buf;
    os_signpost_id_t v16 = a4;
    dispatch_sync(vskClientQueue, block);
    int v9 = *(_DWORD *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }

  return v9;
}

void __59__MADVectorDatabase_insertOrReplaceAssetsEmbeddings_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  BOOL v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKInsertMultipleAssets", "", buf, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) client];
  uint64_t v7 = *(void *)(a1 + 40);
  id v14 = 0;
  id v8 = (id)[v6 insertAssets:v7 error:&v14];
  id v9 = v14;

  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = (id)[v9 copy];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -18;
  }
  else
  {
    id v12 = VCPSignPostLog();
    id v13 = v12;
    if (v3 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKInsertMultipleAssets", "", buf, 2u);
    }
  }
}

- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_readOnly)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"[VSKDB][Remove]";
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "%@ Operation not permitted for read-only client", (uint8_t *)&buf, 0xCu);
      }
    }
    int v9 = -18;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    vskClientQueue = self->_vskClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_error___block_invoke;
    block[3] = &unk_1E6298408;
    id v13 = v6;
    id v14 = self;
    int v15 = @"[VSKDB][Remove]";
    p_long long buf = &buf;
    __int16 v17 = a4;
    dispatch_sync(vskClientQueue, block);
    int v9 = *(_DWORD *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }

  return v9;
}

void __64__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  BOOL v4 = VCPSignPostLog();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v22 = v6;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKDeleteEmbedding", "%ld", buf, 0xCu);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifiersFromLocalIdentifiers:", *(void *)(a1 + 32));
  id v8 = [*(id *)(*(void *)(a1 + 40) + 24) client];
  id v20 = 0;
  int v9 = [v8 deleteStringIdentifiers:v7 error:&v20];
  id v10 = v20;

  if (v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v13 = [*(id *)(a1 + 32) count];
        *(_DWORD *)long long buf = 138412802;
        uint64_t v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to remove (expected %lu) assets - %@", buf, 0x20u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 code];
    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = (id)[v10 copy];
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = [*(id *)(a1 + 32) count];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v9;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "%@ Removed %@ (expected: %lu) assets", buf, 0x20u);
    }
  }
  __int16 v17 = VCPSignPostLog();
  id v18 = v17;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    uint64_t v19 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v22 = v19;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKDeleteEmbedding", "%ld", buf, 0xCu);
  }
}

- (int)removeEmbeddingsWithLocalIdentifiers:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = v8;
  if (self->_readOnly)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"[VSKDB][Remove]";
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "%@ Operation not permitted for read-only client", (uint8_t *)&buf, 0xCu);
      }
    }
    int v11 = -18;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    vskClientQueue = self->_vskClientQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_embeddingType_error___block_invoke;
    v14[3] = &unk_1E6298430;
    id v15 = v8;
    uint64_t v16 = self;
    __int16 v17 = @"[VSKDB][Remove]";
    p_long long buf = &buf;
    unint64_t v19 = a4;
    id v20 = a5;
    dispatch_sync(vskClientQueue, v14);
    int v11 = *(_DWORD *)(*((void *)&buf + 1) + 24);

    _Block_object_dispose(&buf, 8);
  }

  return v11;
}

void __78__MADVectorDatabase_removeEmbeddingsWithLocalIdentifiers_embeddingType_error___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1C186D320]();
        int v9 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", v7, *(void *)(a1 + 64));
        [v2 addObject:v9];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v4);
  }

  id v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = VCPSignPostLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v14 = [*(id *)(a1 + 32) count];
    uint64_t v15 = *(void *)(a1 + 64);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v37 = v14;
    __int16 v38 = 1024;
    LODWORD(v39) = v15;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "MAD_VSKDeleteEmbeddingWithType", "%ld assets, embeddingType %u", buf, 0x12u);
  }

  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 24) client];
  id v31 = 0;
  __int16 v17 = [v16 deleteStringIdentifiers:v2 error:&v31];
  id v18 = v31;

  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t v21 = [*(id *)(a1 + 32) count];
        uint64_t v22 = *(void *)(a1 + 64);
        *(_DWORD *)long long buf = 138413058;
        uint64_t v37 = v20;
        __int16 v38 = 2048;
        uint64_t v39 = v21;
        __int16 v40 = 1024;
        *(_DWORD *)id v41 = v22;
        *(_WORD *)&v41[4] = 2112;
        *(void *)&v41[6] = v18;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to remove (expected %lu) assets of embedding type %u - %@", buf, 0x26u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v18 code];
    if (*(void *)(a1 + 72)) {
      **(void **)(a1 + 72) = (id)[v18 copy];
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 48);
      uint64_t v25 = [*(id *)(a1 + 32) count];
      uint64_t v26 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v17;
      __int16 v40 = 2048;
      *(void *)id v41 = v25;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = v26;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "%@ Removed %@ (expected: %lu) assets of embedding type %u", buf, 0x26u);
    }
  }
  uint64_t v27 = VCPSignPostLog();
  v28 = v27;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    uint64_t v29 = [*(id *)(a1 + 32) count];
    uint64_t v30 = *(void *)(a1 + 64);
    *(_DWORD *)long long buf = 134218240;
    uint64_t v37 = v29;
    __int16 v38 = 1024;
    LODWORD(v39) = v30;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v11, "MAD_VSKDeleteEmbeddingWithType", "%ld assets, embeddingType %u", buf, 0x12u);
  }
}

- (int)rebuildWithForce:(BOOL)a3 cancelBlock:(id)a4 extendTimeoutBlock:(id)a5 error:(id *)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = (unsigned int (**)(void))a4;
  id v11 = a5;
  if (self->_readOnly)
  {
    if (a6)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      uint64_t v13 = [NSString stringWithFormat:@"%@ Operation not permitted for read-only client", @"[VSKDB][Rebuild]"];
      v36[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      *a6 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
    }
    int v15 = -18;
  }
  else if (v10 && v10[2](v10))
  {
    if (a6)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      __int16 v17 = [NSString stringWithFormat:@"%@ Operation canceled before entering client queue", @"[VSKDB][Rebuild]"];
      long long v34 = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a6 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v18];
    }
    int v15 = -128;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    vskClientQueue = self->_vskClientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MADVectorDatabase_rebuildWithForce_cancelBlock_extendTimeoutBlock_error___block_invoke;
    block[3] = &unk_1E6298458;
    uint64_t v26 = &v29;
    uint64_t v27 = a6;
    uint64_t v24 = v10;
    uint64_t v22 = @"[VSKDB][Rebuild]";
    id v25 = v11;
    int v23 = self;
    BOOL v28 = a3;
    dispatch_sync(vskClientQueue, block);
    int v15 = *((_DWORD *)v30 + 6);

    _Block_object_dispose(&v29, 8);
  }

  return v15;
}

void __75__MADVectorDatabase_rebuildWithForce_cancelBlock_extendTimeoutBlock_error___block_invoke(uint64_t a1)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    if ((*(unsigned int (**)(void))(v2 + 16))())
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -128;
      if (*(void *)(a1 + 72))
      {
        id v3 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v4 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v53 = *MEMORY[0x1E4F28568];
        uint64_t v5 = [NSString stringWithFormat:@"%@ Operation canceled after entering client queue", *(void *)(a1 + 32)];
        v54[0] = v5;
        uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
        **(void **)(a1 + 72) = [v3 errorWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:v6];
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  id v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = VCPSignPostLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MAD_VSKStatistics", "", buf, 2u);
  }

  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 24) client];
  id v45 = 0;
  uint64_t v13 = [v12 statisticsWithError:&v45];
  id v14 = v45;

  if (!v13 || v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v49 = v24;
        __int16 v50 = 2112;
        *(void *)uint64_t v51 = v14;
        int v23 = "%@ Failed to query delta embedding count, skip index rebuild: %@";
        id v25 = v21;
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        uint32_t v27 = 22;
LABEL_33:
        _os_log_impl(&dword_1BBEDA000, v25, v26, v23, buf, v27);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
  }
  else
  {
    int v15 = VCPSignPostLog();
    uint64_t v16 = v15;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v9, "MAD_VSKStatistics", "", buf, 2u);
    }

    unint64_t v17 = [v13 deltaStoreCount];
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = [v13 deltaStoreCount];
        *(_DWORD *)long long buf = 138412802;
        uint64_t v49 = v19;
        __int16 v50 = 1024;
        *(_DWORD *)uint64_t v51 = v17;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v20;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "%@[VSKStatistics] deltaStoreCount: %d, storeCount: %d", buf, 0x18u);
      }
    }
    if (*(unsigned char *)(a1 + 80) && v17 <= 0x3E7)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412802;
          uint64_t v49 = v22;
          __int16 v50 = 2048;
          *(void *)uint64_t v51 = v17;
          *(_WORD *)&v51[8] = 2048;
          uint64_t v52 = 1000;
          int v23 = "%@ delta embedding count %lu less than force limit %lu; skip index rebuild";
LABEL_32:
          id v25 = v21;
          os_log_type_t v26 = OS_LOG_TYPE_INFO;
          uint32_t v27 = 32;
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 80) || v17 >> 3 > 0x270)
      {
        uint64_t v29 = *(void *)(a1 + 48);
        if (v29 && (*(unsigned int (**)(void))(v29 + 16))())
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -128;
          if (!*(void *)(a1 + 72)) {
            goto LABEL_35;
          }
          uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v31 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          uint64_t v46 = *MEMORY[0x1E4F28568];
          uint64_t v21 = [NSString stringWithFormat:@"%@ Operation canceled before rebuilding", *(void *)(a1 + 32)];
          __int16 v47 = v21;
          int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          **(void **)(a1 + 72) = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:v31 userInfo:v32];
        }
        else
        {
          uint64_t v33 = *(void *)(a1 + 56);
          if (v33) {
            (*(void (**)(void))(v33 + 16))();
          }
          long long v34 = VCPSignPostLog();
          os_signpost_id_t v35 = os_signpost_id_generate(v34);

          v36 = VCPSignPostLog();
          uint64_t v37 = v36;
          if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "MAD_VSKRebuild", "", buf, 2u);
          }

          __int16 v38 = [*(id *)(*(void *)(a1 + 40) + 24) client];
          id v44 = 0;
          char v39 = [v38 rebuildWithError:&v44];
          uint64_t v21 = v44;

          if (v39)
          {
            __int16 v40 = VCPSignPostLog();
            id v41 = v40;
            if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
            {
              *(_WORD *)long long buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, v35, "MAD_VSKRebuild", "", buf, 2u);
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              id v42 = VCPLogInstance();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                uint64_t v43 = *(void *)(a1 + 32);
                *(_DWORD *)long long buf = 138412546;
                uint64_t v49 = v43;
                __int16 v50 = 2112;
                *(void *)uint64_t v51 = v21;
                _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
              }
            }
            if (*(void *)(a1 + 72)) {
              **(void **)(a1 + 72) = [v21 copy];
            }
            *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v21 code];
          }
        }
        goto LABEL_34;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412802;
          uint64_t v49 = v28;
          __int16 v50 = 2048;
          *(void *)uint64_t v51 = v17;
          *(_WORD *)&v51[8] = 2048;
          uint64_t v52 = 5000;
          int v23 = "%@ delta embedding count %lu less than limit %lu; skip index rebuild";
          goto LABEL_32;
        }
LABEL_34:
      }
    }
  }
LABEL_35:
}

- (unint64_t)assetCountWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  vskClientQueue = self->_vskClientQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MADVectorDatabase_assetCountWithError___block_invoke;
  v6[3] = &unk_1E6298480;
  v6[4] = self;
  uint64_t v7 = @"[VSKDB][AssetCount]";
  id v8 = &v10;
  os_signpost_id_t v9 = a3;
  dispatch_sync(vskClientQueue, v6);
  unint64_t v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

void __41__MADVectorDatabase_assetCountWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  unint64_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKAssetCount", "", buf, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) client];
  id v15 = 0;
  uint64_t v7 = [v6 countWithError:&v15];
  id v8 = v15;

  if (v7)
  {
    uint64_t v9 = [v7 unsignedIntegerValue];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 56))
    {
      id v12 = (id)[v8 copy];
      uint64_t v9 = 0;
      **(void **)(a1 + 56) = v12;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  uint64_t v13 = VCPSignPostLog();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKAssetCount", "", buf, 2u);
  }
}

- (unint64_t)embeddingCountWithError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  vskClientQueue = self->_vskClientQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MADVectorDatabase_embeddingCountWithError___block_invoke;
  v6[3] = &unk_1E6298480;
  v6[4] = self;
  uint64_t v7 = @"[VSKDB][EmbeddingCount]";
  id v8 = &v10;
  uint64_t v9 = a3;
  dispatch_sync(vskClientQueue, v6);
  unint64_t v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

void __45__MADVectorDatabase_embeddingCountWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  unint64_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKEmbeddingCount", "", buf, 2u);
  }

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) client];
  id v15 = 0;
  uint64_t v7 = [v6 embeddingCountWithError:&v15];
  id v8 = v15;

  if (v7)
  {
    uint64_t v9 = [v7 unsignedIntegerValue];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v17 = v11;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 56))
    {
      id v12 = (id)[v8 copy];
      uint64_t v9 = 0;
      **(void **)(a1 + 56) = v12;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
  uint64_t v13 = VCPSignPostLog();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKEmbeddingCount", "", buf, 2u);
  }
}

- (id)fetchAllAssetsWithLimit:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__10;
  __int16 v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  vskClientQueue = self->_vskClientQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MADVectorDatabase_fetchAllAssetsWithLimit_offset_error___block_invoke;
  v8[3] = &unk_1E62984A8;
  uint64_t v10 = &v14;
  unint64_t v11 = a3;
  v8[4] = self;
  uint64_t v9 = @"[VSKDB][FetchAllAssets]";
  unint64_t v12 = a4;
  uint64_t v13 = a5;
  dispatch_sync(vskClientQueue, v8);
  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __58__MADVectorDatabase_fetchAllAssetsWithLimit_offset_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  unint64_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKFetchAllAssets", "", buf, 2u);
  }

  id v6 = [*(id *)(*(void *)(a1 + 32) + 24) client];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB3BF0]) initWithLimit:*(void *)(a1 + 56) offset:*(void *)(a1 + 64)];
  id v18 = 0;
  uint64_t v8 = [v6 stringIdentifiedAssetsWithIdentifiers:0 attributeFilters:MEMORY[0x1E4F1CBF0] pagination:v7 error:&v18];
  id v9 = v18;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (v9)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v20 = v15;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 72)) {
      **(void **)(a1 + 72) = (id)[v9 copy];
    }
  }
  uint64_t v16 = VCPSignPostLog();
  uint64_t v17 = v16;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKFetchAllAssets", "", buf, 2u);
  }
}

- (id)fetchAssetsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__10;
  __int16 v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  vskClientQueue = self->_vskClientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_error___block_invoke;
  block[3] = &unk_1E62984D0;
  id v12 = v6;
  uint64_t v13 = self;
  uint64_t v14 = @"[VSKDB][FetchAssets]";
  uint64_t v15 = &v17;
  uint64_t v16 = a4;
  id v8 = v6;
  dispatch_sync(vskClientQueue, block);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __59__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  unint64_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v22 = v6;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifiersFromLocalIdentifiers:", *(void *)(a1 + 32));
  id v8 = [*(id *)(*(void *)(a1 + 40) + 24) client];
  id v20 = 0;
  uint64_t v9 = [v8 stringIdentifiedAssetsWithIdentifiers:v7 attributeFilters:MEMORY[0x1E4F1CBF0] pagination:0 error:&v20];
  id v10 = v20;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  if (v10)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = v16;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = (id)[v10 copy];
    }
  }
  uint64_t v17 = VCPSignPostLog();
  id v18 = v17;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    uint64_t v19 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v22 = v19;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }
}

- (id)fetchAssetsWithLocalIdentifiers:(id)a3 embeddingType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__10;
  id v24 = __Block_byref_object_dispose__10;
  id v25 = 0;
  vskClientQueue = self->_vskClientQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_embeddingType_error___block_invoke;
  v13[3] = &unk_1E62984F8;
  id v14 = v8;
  uint64_t v15 = self;
  uint64_t v16 = @"[VSKDB][FetchAssets]";
  uint64_t v17 = &v20;
  unint64_t v18 = a4;
  uint64_t v19 = a5;
  id v10 = v8;
  dispatch_sync(vskClientQueue, v13);
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __73__MADVectorDatabase_fetchAssetsWithLocalIdentifiers_embeddingType_error___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = VCPSignPostLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  unint64_t v4 = VCPSignPostLog();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v31 = v6;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifierFromLocalIdentifier:embeddingType:", *(void *)(*((void *)&v26 + 1) + 8 * i), *(void *)(a1 + 64));
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 24) client];
  id v25 = 0;
  uint64_t v14 = [v13 stringIdentifiedAssetsWithIdentifiers:v7 attributeFilters:MEMORY[0x1E4F1CBF0] pagination:0 error:&v25];
  id v15 = v25;
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v14;

  if (v15)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;

    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v31 = v21;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "%@ Operation failed - %@", buf, 0x16u);
      }
    }
    if (*(void *)(a1 + 72)) {
      **(void **)(a1 + 72) = (id)[v15 copy];
    }
  }
  uint64_t v22 = VCPSignPostLog();
  __int16 v23 = v22;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    uint64_t v24 = [*(id *)(a1 + 32) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v31 = v24;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v3, "MAD_VSKFetchAssets", "%lu assets", buf, 0xCu);
  }
}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3
{
  for (id i = [MEMORY[0x1E4F1CA48] array];
  {
    uint64_t v5 = [(VCPObjectPool *)self->_searchClientPool getObject];
    uint64_t v6 = [v5 object];
    [v6 warmup];

    [i addObject:v5];
  }
}

- (id)searchWithEmbeddings:(id)a3 localIdentifiers:(id)a4 attributeFilters:(id)a5 limit:(int)a6 fullScan:(BOOL)a7 includePayload:(BOOL)a8 numberOfProbes:(id)a9 batchSize:(id)a10 numConcurrentReaders:(id)a11 error:(id *)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  uint64_t v14 = *(void *)&a6;
  id v45 = a3;
  id v46 = a4;
  id v44 = a5;
  id v43 = a9;
  id v42 = a10;
  id v41 = a11;
  uint64_t v18 = VCPSignPostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  uint64_t v20 = VCPSignPostLog();
  uint64_t v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MAD_VSKSearchGetVSKClient", "", buf, 2u);
  }

  uint64_t v22 = [(VCPObjectPool *)self->_searchClientPool getObject];
  __int16 v23 = VCPSignPostLog();
  uint64_t v24 = v23;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_END, v19, "MAD_VSKSearchGetVSKClient", "", buf, 2u);
  }

  id v25 = [v22 object];
  [v25 warmup];

  uint64_t v26 = objc_msgSend(MEMORY[0x1E4FB3BC0], "mad_stringIdentifiersFromLocalIdentifiers:", v46);
  long long v27 = (void *)v26;
  long long v28 = (void *)MEMORY[0x1E4F1CBF0];
  if (v26) {
    long long v28 = (void *)v26;
  }
  id v29 = v28;

  uint64_t v30 = VCPSignPostLog();
  os_signpost_id_t v31 = os_signpost_id_generate(v30);

  __int16 v32 = VCPSignPostLog();
  id v33 = v32;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "MAD_VSKSearchBatchSearch", "", buf, 2u);
  }

  long long v34 = [v22 object];
  uint64_t v35 = [v34 client];
  id v47 = 0;
  v36 = [v35 searchByBatch:v45 stringIdentifiers:v29 attributeFilters:v44 limit:v14 fullScan:v13 includePayload:v12 numberOfProbes:v43 batchSize:v42 numConcurrentReaders:v41 error:&v47];
  id v37 = v47;

  __int16 v38 = VCPSignPostLog();
  char v39 = v38;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v39, OS_SIGNPOST_INTERVAL_END, v31, "MAD_VSKSearchBatchSearch", "", buf, 2u);
  }

  if (a12 && v37) {
    *a12 = (id)[v37 copy];
  }

  return v36;
}

- (BOOL)hasMigration
{
  return self->_hasMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchClientPool, 0);
  objc_storeStrong((id *)&self->_vskClientQueue, 0);
  objc_storeStrong((id *)&self->_vskClient, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end