@interface CKVSnapshotManager
+ (id)sharedInstance;
+ (id)writeProfileToFile:(id)a3 withFilename:(id)a4 inDirectory:(id)a5 error:(id *)a6;
- (BOOL)_purgeProfileSnapshots;
- (CKVSnapshotManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4;
- (id)_buildProfile:(id)a3 error:(id *)a4;
- (id)_getFilesSortedByCreationDateForDirectoryPath:(id)a3;
- (id)captureInMemory:(id *)a3;
- (id)captureToFileInDirectory:(id)a3 error:(id *)a4;
- (void)cleanup;
@end

@implementation CKVSnapshotManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

- (BOOL)_purgeProfileSnapshots
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(NSURL *)self->_rootDirectoryURL path];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [(CKVSnapshotManager *)self _getFilesSortedByCreationDateForDirectoryPath:v3];
  v6 = v5;
  if (!v5)
  {
    id v17 = 0;
    BOOL v18 = 0;
    goto LABEL_20;
  }
  if (![v5 count] || (uint64_t v7 = objc_msgSend(v6, "count")) == 0)
  {
    id v17 = 0;
    BOOL v18 = 1;
    goto LABEL_20;
  }
  v21 = v3;
  v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = v7 - 1;
  while (1)
  {
    v11 = objc_msgSend(v6, "objectAtIndex:", v10, v21);
    v12 = [v11 firstObject];
    v13 = [v11 lastObject];
    [v13 timeIntervalSinceNow];
    if (fabs(v14) >= 43200.0 || (unint64_t)(v9 + 1) >= 0xB) {
      break;
    }
    ++v9;
LABEL_12:

    if (--v10 == -1)
    {
      BOOL v18 = 1;
      id v17 = v8;
      goto LABEL_19;
    }
  }
  id v22 = v8;
  char v16 = [v4 removeItemAtURL:v12 error:&v22];
  id v17 = v22;

  if (v16)
  {
    v8 = v17;
    goto LABEL_12;
  }
  v19 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[CKVSnapshotManager _purgeProfileSnapshots]";
    __int16 v25 = 2112;
    v26 = v12;
    __int16 v27 = 2112;
    id v28 = v17;
    _os_log_error_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to remove snapshot %@ error: %@", buf, 0x20u);
  }

  BOOL v18 = 0;
LABEL_19:
  v3 = v21;
LABEL_20:

  return v18;
}

- (void)cleanup
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(CKVSnapshotManager *)self _purgeProfileSnapshots])
  {
    v3 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CKVSnapshotManager cleanup]";
      _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Removing snapshot directory following purge failure", buf, 0xCu);
    }
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    rootDirectoryURL = self->_rootDirectoryURL;
    id v9 = 0;
    char v6 = [v4 removeItemAtURL:rootDirectoryURL error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CKVSnapshotManager cleanup]";
        __int16 v12 = 2112;
        id v13 = v7;
        _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to remove snapshot directory: %@", buf, 0x16u);
      }
    }
  }
}

- (id)_getFilesSortedByCreationDateForDirectoryPath:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v33 = 0;
    v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v33];
    id v6 = v33;
    if (v5)
    {
      v24 = v4;
      v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v23 = v5;
      id obj = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v30;
        uint64_t v10 = *MEMORY[0x1E4F1C540];
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v30 != v9) {
              objc_enumerationMutation(obj);
            }
            id v12 = v3;
            id v13 = objc_msgSend(v3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v29 + 1) + 8 * i), v23);
            uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
            id v27 = 0;
            id v28 = 0;
            [v14 getResourceValue:&v28 forKey:v10 error:&v27];
            id v15 = v28;
            id v16 = v27;

            if (v16 || !v15)
            {
              v19 = CKLogContextVocabulary;
              if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v37 = "-[CKVSnapshotManager _getFilesSortedByCreationDateForDirectoryPath:]";
                __int16 v38 = 2112;
                id v39 = v13;
                __int16 v40 = 2112;
                id v41 = v16;
                _os_log_error_impl(&dword_1A77B3000, v19, OS_LOG_TYPE_ERROR, "%s Failed to get file creation date for file %@ error: %@", buf, 0x20u);
              }

              BOOL v18 = 0;
              id v3 = v12;
              v5 = v23;
              v4 = v24;
              v20 = v26;
              goto LABEL_22;
            }
            v34[0] = v14;
            v34[1] = v15;
            id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
            [v26 addObject:v17];

            id v6 = 0;
            id v3 = v12;
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          id v6 = 0;
          id v16 = 0;
          if (v8) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v16 = v6;
      }

      v20 = v26;
      BOOL v18 = [v26 sortedArrayUsingComparator:&__block_literal_global_1113];
      v5 = v23;
      v4 = v24;
LABEL_22:

      id v6 = v16;
    }
    else
    {
      v21 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CKVSnapshotManager _getFilesSortedByCreationDateForDirectoryPath:]";
        __int16 v38 = 2112;
        id v39 = v3;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_error_impl(&dword_1A77B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to scan files at path: %@ error: %@", buf, 0x20u);
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

uint64_t __68__CKVSnapshotManager__getFilesSortedByCreationDateForDirectoryPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 objectAtIndex:1];
  id v6 = [v4 objectAtIndex:1];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)captureInMemory:(id *)a3
{
  id v4 = [(CKVSnapshotManager *)self _buildProfile:0 error:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 buildWithError:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)captureToFileInDirectory:(id)a3 error:(id *)a4
{
  id v6 = (NSURL *)a3;
  if (!v6) {
    id v6 = self->_rootDirectoryURL;
  }
  uint64_t v7 = KVGetOrCreateDirectoryURL();

  if (v7)
  {
    uint64_t v8 = [(CKVSnapshotManager *)self _buildProfile:v6 error:a4];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 finishWritingWithError:a4];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_buildProfile:(id)a3 error:(id *)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  __int16 v38 = a4;
  __int16 v40 = [(CCSetEnumerator *)self->_setEnumerator allSets:a4];
  id v6 = v40;
  if (v40)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = v40;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v64 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          [v11 itemType];
          KVItemTypeFromCascadeItemType();
          if (KVItemTypeIsValid())
          {
            [v47 addObject:v11];
          }
          else
          {
            id v12 = CKLogContextVocabulary;
            if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[CKVSnapshotManager _buildProfile:error:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v11;
              _os_log_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_INFO, "%s Skipping set: %@ not supported by Koa", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v47 count];
    uint64_t v14 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      id v15 = @"to file";
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CKVSnapshotManager _buildProfile:error:]";
      if (!v41) {
        id v15 = @"in memory";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v73) = v13;
      _os_log_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_INFO, "%s Capturing vocabulary snapshot %@ for %u sets.", buf, 0x1Cu);
    }
    id v39 = [MEMORY[0x1E4F72018] capturedWithDatasetCount:v13 error:v38];
    if (v39)
    {
      if (v41) {
        [MEMORY[0x1E4F72010] fileWriterWithProfileInfo:v39 targetDirectory:v41 format:2 error:v38];
      }
      else {
      v43 = [MEMORY[0x1E4F72010] builderWithProfileInfo:v39 format:2 error:v38];
      }
      if (v43)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v73 = __Block_byref_object_copy__1121;
        v74 = __Block_byref_object_dispose__1122;
        id v75 = 0;
        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x2020000000;
        char v62 = 1;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v47;
        uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v17)
        {
          uint64_t v44 = *MEMORY[0x1E4F57F68];
          uint64_t v45 = *(void *)v56;
LABEL_26:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v56 != v45) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v55 + 1) + 8 * v18);
            context = (void *)MEMORY[0x1AD0D0860]();
            v20 = [v19 changePublisher];
            int v21 = [v20 localItemInstanceCount];
            id v22 = [MEMORY[0x1E4F1C9C8] now];
            id v23 = objc_alloc(MEMORY[0x1E4F71FC8]);
            [v19 itemType];
            uint64_t v24 = KVItemTypeFromCascadeItemType();
            __int16 v25 = [v19 descriptorWithKey:v44];
            v26 = [v25 value];
            id v27 = (id *)(*(void *)&buf[8] + 40);
            id v54 = *(id *)(*(void *)&buf[8] + 40);
            LODWORD(v37) = v21;
            id v28 = (void *)[v23 initWithItemType:v24 originAppId:v26 deviceId:0 userId:0 lastModifiedTime:0 capturedTime:v22 itemCount:v37 error:&v54];
            objc_storeStrong(v27, v54);
            long long v29 = v20;

            if (!v28) {
              goto LABEL_35;
            }
            long long v30 = (id *)(*(void *)&buf[8] + 40);
            id v53 = *(id *)(*(void *)&buf[8] + 40);
            long long v31 = [v43 addDataset:v28 error:&v53];
            objc_storeStrong(v30, v53);
            if (v31)
            {
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __42__CKVSnapshotManager__buildProfile_error___block_invoke;
              v52[3] = &unk_1E5CF99B8;
              v52[4] = buf;
              v52[5] = &v59;
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = __42__CKVSnapshotManager__buildProfile_error___block_invoke_2;
              v48[3] = &unk_1E5CF99E0;
              v50 = buf;
              id v32 = v31;
              id v49 = v32;
              v51 = &v59;
              id v33 = (id)[v20 sinkWithCompletion:v52 shouldContinue:v48];
              if (*((unsigned char *)v60 + 24))
              {
                v34 = CKLogContextVocabulary;
                if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v67 = 136315394;
                  v68 = "-[CKVSnapshotManager _buildProfile:error:]";
                  __int16 v69 = 2112;
                  v70 = v28;
                  _os_log_impl(&dword_1A77B3000, v34, OS_LOG_TYPE_INFO, "%s Captured dataset %@", v67, 0x16u);
                }
                int v35 = 0;
              }
              else
              {
                int v35 = 8;
              }
            }
            else
            {
LABEL_35:
              *((unsigned char *)v60 + 24) = 0;
              int v35 = 8;
            }

            if (v35) {
              break;
            }
            if (v17 == ++v18)
            {
              uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
              if (v17) {
                goto LABEL_26;
              }
              break;
            }
          }
        }

        if (!*((unsigned char *)v60 + 24) || *(void *)(*(void *)&buf[8] + 40))
        {
          KVSetError();
          id v16 = 0;
        }
        else
        {
          id v16 = v43;
        }
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }

    id v6 = v40;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __42__CKVSnapshotManager__buildProfile_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state])
  {
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __42__CKVSnapshotManager__buildProfile_error___block_invoke_2(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [a2 addedLocalInstances];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1[5] + 8);
        id obj = *(id *)(v9 + 40);
        uint64_t v10 = [MEMORY[0x1E4F71FF0] itemFromCascadeItem:v8 error:&obj];
        objc_storeStrong((id *)(v9 + 40), obj);
        if (!v10
          || (v11 = (void *)a1[4],
              uint64_t v12 = *(void *)(a1[5] + 8),
              id v16 = *(id *)(v12 + 40),
              [v11 addItem:v10 error:&v16],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              objc_storeStrong((id *)(v12 + 40), v16),
              v13,
              !v13))
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;

          uint64_t v14 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v14 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_13:

  return v14;
}

- (CKVSnapshotManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVSnapshotManager;
  uint64_t v9 = [(CKVSnapshotManager *)&v17 init];
  uint64_t v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_rootDirectoryURL, a3),
        p_setEnumerator = &v10->_setEnumerator,
        objc_storeStrong((id *)&v10->_setEnumerator, a4),
        (rootDirectoryURL = v10->_rootDirectoryURL) != 0)
    && *p_setEnumerator)
  {
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v14 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      id v16 = *p_setEnumerator;
      *(_DWORD *)buf = 136315650;
      long long v19 = "-[CKVSnapshotManager initWithRootDirectoryURL:setEnumerator:]";
      __int16 v20 = 2112;
      long long v21 = rootDirectoryURL;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_error_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_ERROR, "%s Invalid {rootDirectoryURL: %@, setEnumerator: %@}", buf, 0x20u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)writeProfileToFile:(id)a3 withFilename:(id)a4 inDirectory:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F72010];
  id v12 = a4;
  uint64_t v13 = [v9 profileInfo];
  uint64_t v14 = [v11 fileWriterWithProfileInfo:v13 targetDirectory:v10 filename:v12 format:2 error:a6];

  if (!v14) {
    goto LABEL_6;
  }
  id v15 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    objc_super v17 = [v10 path];
    *(_DWORD *)buf = 136315650;
    long long v29 = "+[CKVSnapshotManager writeProfileToFile:withFilename:inDirectory:error:]";
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v17;
    _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s Writing profile: %@ to file in targetDirectory: %@", buf, 0x20u);
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke;
  __int16 v25 = &unk_1E5CF9A50;
  id v18 = v14;
  id v26 = v18;
  id v27 = a6;
  int v19 = [v9 enumerateDatasetsWithError:a6 usingBlock:&v22];

  if (v19)
  {
    __int16 v20 = objc_msgSend(v18, "finishWritingWithError:", a6, v22, v23, v24, v25);
  }
  else
  {
LABEL_6:
    __int16 v20 = 0;
  }

  return v20;
}

uint64_t __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 datasetInfo];
  uint64_t v6 = [v4 addDataset:v5 error:*(void *)(a1 + 40)];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke_2;
    v12[3] = &unk_1E5CF9A28;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 40);
    id v13 = v8;
    uint64_t v14 = v9;
    uint64_t v10 = [v3 enumerateItemsWithError:v7 usingBlock:v12];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

BOOL __72__CKVSnapshotManager_writeProfileToFile_withFilename_inDirectory_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) addItem:a2 error:*(void *)(a1 + 40)];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CKVSnapshotManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1142 != -1) {
    dispatch_once(&sharedInstance_onceToken_1142, block);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

void __36__CKVSnapshotManager_sharedInstance__block_invoke()
{
  id v0 = objc_alloc((Class)objc_opt_class());
  KVSnapshotRootDirectoryURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [MEMORY[0x1E4F57FB8] setEnumerator];
  uint64_t v2 = [v0 initWithRootDirectoryURL:v4 setEnumerator:v1];
  BOOL v3 = (void *)sharedInstance_shared;
  sharedInstance_shared = v2;
}

@end