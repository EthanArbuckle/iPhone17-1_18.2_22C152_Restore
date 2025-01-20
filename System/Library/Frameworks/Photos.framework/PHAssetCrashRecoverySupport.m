@interface PHAssetCrashRecoverySupport
+ (BOOL)shouldAttemptCrashRecoveryForLibraryWithPathManager:(id)a3;
- (BOOL)_isCrashRecoveryFilename:(id)a3;
- (BOOL)_isSafeToRecoverAfterCrashForCrashRecoveryFileURL:(id)a3;
- (PHAssetCrashRecoverySupport)initWithLibraryServicesManager:(id)a3;
- (id)libraryServicesManager;
- (id)persistentStoreCoordinator;
- (void)_commitRequest:(id)a3 reply:(id)a4;
- (void)_recoverFromCrashIfNeeded;
- (void)recoverFromCrashIfNeeded;
@end

@implementation PHAssetCrashRecoverySupport

- (void).cxx_destruct
{
}

- (id)persistentStoreCoordinator
{
  return (id)[(PLLibraryServicesManager *)self->_libraryServicesManager persistentStoreCoordinator];
}

- (id)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (void)_commitRequest:(id)a3 reply:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F8AC38];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v8 executeWithLibraryServicesManager:self->_libraryServicesManager libraryName:"-[PHAssetCrashRecoverySupport _commitRequest:reply:]" executionContext:v9 reply:v7];
}

- (void)recoverFromCrashIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PHAssetCrashRecoverySupport *)self libraryServicesManager];
  v4 = [v3 pathManager];

  v5 = objc_opt_class();
  v6 = [(PHAssetCrashRecoverySupport *)self libraryServicesManager];
  id v7 = [v6 pathManager];
  int v8 = [v5 shouldAttemptCrashRecoveryForLibraryWithPathManager:v7];

  id v9 = PLBackendGetLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F8B8F0];
      v12 = [v4 libraryURL];
      v13 = [v11 descriptionWithFileURL:v12];
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Attempting crash recovery with library %@", (uint8_t *)&v17, 0xCu);
    }
    [(PHAssetCrashRecoverySupport *)self _recoverFromCrashIfNeeded];
  }
  else
  {
    if (v10)
    {
      v14 = (void *)MEMORY[0x1E4F8B8F0];
      v15 = [v4 libraryURL];
      v16 = [v14 descriptionWithFileURL:v15];
      int v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Skipping crash recovery with library %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_recoverFromCrashIfNeeded
{
  v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v3 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  v4 = [v3 pathsForExternalWriters];

  v47 = [MEMORY[0x1E4F8B908] fileManager];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v4;
  uint64_t v48 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v72;
    uint64_t v53 = *MEMORY[0x1E4F284E8];
    unint64_t v5 = 0x1E4F1C000uLL;
    v51 = v2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v72 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v6;
        uint64_t v7 = *(void *)(*((void *)&v71 + 1) + 8 * v6);
        int v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __56__PHAssetCrashRecoverySupport__recoverFromCrashIfNeeded__block_invoke;
        v70[3] = &unk_1E58469E8;
        v70[4] = v7;
        id v9 = [v47 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:0 errorHandler:v70];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v10 = v9;
        uint64_t v59 = [v10 countByEnumeratingWithState:&v66 objects:v81 count:16];
        if (v59)
        {
          uint64_t v11 = *(void *)v67;
          id v54 = v10;
          uint64_t v58 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v67 != v11) {
                objc_enumerationMutation(v10);
              }
              v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v14 = (void *)MEMORY[0x19F389B10]();
              v15 = [v13 lastPathComponent];
              BOOL v16 = [(PHAssetCrashRecoverySupport *)v2 _isCrashRecoveryFilename:v15];

              if (v16)
              {
                if ([(PHAssetCrashRecoverySupport *)v2 _isSafeToRecoverAfterCrashForCrashRecoveryFileURL:v13])
                {
                  int v17 = *(void **)(v5 + 2488);
                  id v65 = 0;
                  v18 = [v17 dataWithContentsOfURL:v13 options:1 error:&v65];
                  uint64_t v19 = v65;
                  if (!v18)
                  {
                    v22 = PLBackendGetLog();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                    {
                      [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                      v31 = v30 = v22;
                      *(_DWORD *)buf = 138412546;
                      v76 = v31;
                      __int16 v77 = 2112;
                      uint64_t v78 = (uint64_t)v19;
                      _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to read data from contents of XPC dictionary with path %@: %@", buf, 0x16u);

                      v22 = v30;
                    }
                    goto LABEL_42;
                  }
                  v20 = [PHAssetCrashRecoveryUnarchiver alloc];
                  id v64 = 0;
                  v21 = (void *)[(PHAssetCrashRecoveryUnarchiver *)v20 initForReadingFromData:v18 error:&v64];
                  v22 = v64;
                  [v21 setUserInfo:v2];
                  v56 = v21;
                  v23 = [v21 decodeObjectOfClass:objc_opt_class() forKey:v53];
                  v24 = v23;
                  if (!v23)
                  {
                    v32 = PLBackendGetLog();
                    v57 = v32;
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to create PHAssetCreationRequest from XPC dictionary, skipping", buf, 2u);
                    }
                    goto LABEL_41;
                  }
                  int v25 = [v23 retryCount];
                  v55 = v22;
                  if (v25 < 1)
                  {
                    uint64_t v33 = 1;
                  }
                  else
                  {
                    v26 = v25;
                    v27 = PLBackendGetLog();
                    if (v26 >= 7)
                    {
                      v28 = v27;
                      v57 = v27;
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        v29 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                        *(_DWORD *)buf = 138412290;
                        v76 = v29;
                        _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Skipping recovery attempt of creation request with path %@, exceeded retry count", buf, 0xCu);

                        unint64_t v5 = 0x1E4F1C000;
                      }
                      v22 = v55;
                      goto LABEL_41;
                    }
                    v34 = v27;
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      v35 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                      *(_DWORD *)buf = 134218498;
                      v76 = v26;
                      __int16 v77 = 2048;
                      uint64_t v78 = 6;
                      __int16 v79 = 2112;
                      v80 = v35;
                      _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] (%lu/%lu) Retrying recovery of creation request with path %@", buf, 0x20u);
                    }
                    uint64_t v33 = [v24 retryCount] + 1;
                  }
                  [v24 setRetryCount:v33];
                  id v63 = 0;
                  v36 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v63];
                  v57 = v63;
                  v52 = v36;
                  if (v36)
                  {
                    id v62 = 0;
                    char v37 = [v36 writeToURL:v13 options:1 error:&v62];
                    v38 = v62;
                    if ((v37 & 1) == 0)
                    {
                      v39 = PLBackendGetLog();
                      v22 = v55;
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        v50 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                        *(_DWORD *)buf = 138412546;
                        v76 = v50;
                        __int16 v77 = 2112;
                        uint64_t v78 = (uint64_t)v38;
                        _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to write retry creation request data to path %@: %@", buf, 0x16u);
                      }
LABEL_38:

                      v40 = objc_alloc_init(PHPerformChangesRequest);
                      [(PHPerformChangesRequest *)v40 recordInsertRequest:v24];
                      v41 = PLBackendGetLog();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        v42 = [v24 placeholderForCreatedAsset];
                        v43 = [v42 localIdentifier];
                        v44 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                        *(_DWORD *)buf = 138543618;
                        v76 = v43;
                        __int16 v77 = 2112;
                        uint64_t v78 = (uint64_t)v44;
                        _os_log_impl(&dword_19B043000, v41, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Attempting asset creation recovery of asset %{public}@ with path %@", buf, 0x16u);

                        v2 = v51;
                        v22 = v55;
                      }
                      v60[0] = MEMORY[0x1E4F143A8];
                      v60[1] = 3221225472;
                      v60[2] = __56__PHAssetCrashRecoverySupport__recoverFromCrashIfNeeded__block_invoke_54;
                      v60[3] = &unk_1E5846A10;
                      id v61 = v24;
                      [(PHAssetCrashRecoverySupport *)v2 _commitRequest:v40 reply:v60];

                      unint64_t v5 = 0x1E4F1C000;
LABEL_41:

                      id v10 = v54;
LABEL_42:

LABEL_43:
                      goto LABEL_44;
                    }
                  }
                  else
                  {
                    v38 = PLBackendGetLog();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v57;
                      _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to archive retry creation request data: %@", buf, 0xCu);
                    }
                  }
                  v22 = v55;
                  goto LABEL_38;
                }
                uint64_t v19 = PLBackendGetLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:v13];
                  *(_DWORD *)buf = 138412290;
                  v76 = v18;
                  _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Someone else is accessing this file, skipping asset creation recovery for path: %@", buf, 0xCu);
                  goto LABEL_43;
                }
LABEL_44:

                uint64_t v11 = v58;
              }
            }
            uint64_t v59 = [v10 countByEnumeratingWithState:&v66 objects:v81 count:16];
          }
          while (v59);
        }

        uint64_t v6 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v48);
  }
}

uint64_t __56__PHAssetCrashRecoverySupport__recoverFromCrashIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [MEMORY[0x1E4F8B8F0] descriptionWithPath:*(void *)(a1 + 32)];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to create enumerator at path %@: %@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

void __56__PHAssetCrashRecoverySupport__recoverFromCrashIfNeeded__block_invoke_54(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLBackendGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(a1 + 32) placeholderForCreatedAsset];
      id v9 = [v8 localIdentifier];
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "[AssetCreationRecovery] Successfully recovered creation of asset %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[AssetCreationRecovery] Unable to perform asset creation request with error: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)_isSafeToRecoverAfterCrashForCrashRecoveryFileURL:(id)a3
{
  v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 URLByAppendingPathComponent:*MEMORY[0x1E4F8ACF0]];
  id v5 = [v4 path];

  id v6 = v5;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 36);
  int v8 = v7;
  if (v7 < 0)
  {
    if (v7 == -1)
    {
      BOOL v9 = *__error() != 35;
      goto LABEL_5;
    }
  }
  else
  {
    flock(v7, 8);
    close(v8);
  }
  BOOL v9 = 1;
LABEL_5:

  return v9;
}

- (BOOL)_isCrashRecoveryFilename:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lowercaseString];
  id v5 = [@"XPCDict" lowercaseString];
  if ([v4 hasPrefix:v5])
  {
    id v6 = [v3 pathExtension];
    BOOL v7 = [v6 caseInsensitiveCompare:@"plist"] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PHAssetCrashRecoverySupport)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAssetCrashRecoverySupport;
  id v6 = [(PHAssetCrashRecoverySupport *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
  }

  return v7;
}

+ (BOOL)shouldAttemptCrashRecoveryForLibraryWithPathManager:(id)a3
{
  id v3 = a3;
  if ([v3 isSystemPhotoLibraryPathManager])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F8AA98];
    id v6 = [v3 libraryURL];
    BOOL v7 = [v5 photoLibraryIdentifierWithPhotoLibraryURL:v6 createIfMissing:0 error:0];

    if (v7) {
      BOOL v4 = [v7 domain] == 3;
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

@end