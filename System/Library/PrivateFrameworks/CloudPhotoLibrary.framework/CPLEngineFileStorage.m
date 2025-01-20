@interface CPLEngineFileStorage
+ (id)platformImplementationProtocol;
- (BOOL)_compactStorageIncludeOriginals:(BOOL)a3 desiredFreeSpace:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_fixupIdentity:(id)a3 fileURL:(id)a4 data:(id)a5 error:(id *)a6;
- (BOOL)_recoverFromCrashWithRecoveryHandler:(id)a3 error:(id *)a4;
- (BOOL)addDeleteFlagToFileAtURL:(id)a3 error:(id *)a4;
- (BOOL)checkIsEmpty;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitFileWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)commitFileWithIdentity:(id)a3 error:(id *)a4;
- (BOOL)compactStorage:(id *)a3;
- (BOOL)compactStorageIncludeOriginals:(BOOL)a3 error:(id *)a4;
- (BOOL)deleteFileWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteFileWithIdentity:(id)a3 error:(id *)a4;
- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteImmediately;
- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3;
- (BOOL)discardUncommittedFileWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)discardUncommittedFileWithIdentity:(id)a3 error:(id *)a4;
- (BOOL)doWrite:(id)a3 error:(id *)a4;
- (BOOL)hasCrashMarker;
- (BOOL)hasFileWithIdentifier:(id)a3;
- (BOOL)hasFileWithIdentity:(id)a3;
- (BOOL)keepOriginals;
- (BOOL)openWithFileRecoveryHandler:(id)a3 error:(id *)a4;
- (BOOL)openWithRecoveryHandler:(id)a3 error:(id *)a4;
- (BOOL)releaseFileURL:(id)a3 error:(id *)a4;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)storeData:(id)a3 identifier:(id)a4 needsCommit:(BOOL *)a5 error:(id *)a6;
- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7;
- (BOOL)storeFileAtURL:(id)a3 identifier:(id)a4 moveIfPossible:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7;
- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 error:(id *)a8;
- (BOOL)storeUnretainedData:(id)a3 identifier:(id)a4 error:(id *)a5;
- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)storeUnretainedFileAtURL:(id)a3 identifier:(id)a4 error:(id *)a5;
- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)trackAllStoresAndDeletes;
- (BOOL)trackAllStoresAndDeletesUntilEndOfTransaction;
- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 error:(id *)a5;
- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 includeOriginals:(BOOL)a5 error:(id *)a6;
- (CPLEngineFileStorage)initWithBaseURL:(id)a3;
- (CPLPlatformObject)platformObject;
- (NSURL)baseURL;
- (id)_identityForIdentifier:(id)a3;
- (id)_markerURLForTrackAllStoresAndDeletes;
- (id)fileEnumerator;
- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4;
- (id)retainFileURLForIdentifier:(id)a3 error:(id *)a4;
- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5;
- (unint64_t)countOfUncommittedFiles;
- (void)_addIdentityToUncommittedFiles:(id)a3;
- (void)_removeIdentityFromUncommittedFiles:(id)a3;
- (void)checkFileSizeForIdentity:(id)a3;
- (void)doRead:(id)a3;
- (void)setDeleteImmediately:(BOOL)a3;
- (void)setKeepOriginals:(BOOL)a3;
- (void)setTrackAllStoresAndDeletes:(BOOL)a3;
- (void)setTrackAllStoresAndDeletesUntilEndOfTransaction:(BOOL)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineFileStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_uncommittedFiles, 0);
  objc_storeStrong((id *)&self->_crashMarkerURL, 0);
  objc_storeStrong((id *)&self->_logDomain, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setDeleteImmediately:(BOOL)a3
{
  self->_deleteImmediately = a3;
}

- (BOOL)deleteImmediately
{
  return self->_deleteImmediately;
}

- (void)setKeepOriginals:(BOOL)a3
{
  self->_keepOriginals = a3;
}

- (BOOL)keepOriginals
{
  return self->_keepOriginals;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (id)retainFileURLForIdentifier:(id)a3 error:(id *)a4
{
  v6 = [(CPLEngineFileStorage *)self _identityForIdentifier:a3];
  v7 = [(CPLEngineFileStorage *)self retainFileURLForIdentity:v6 resourceType:0 error:a4];

  return v7;
}

- (BOOL)hasFileWithIdentifier:(id)a3
{
  v3 = self;
  v4 = [(CPLEngineFileStorage *)self _identityForIdentifier:a3];
  LOBYTE(v3) = [(CPLEngineFileStorage *)v3 hasFileWithIdentity:v4];

  return (char)v3;
}

- (BOOL)storeUnretainedData:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CPLEngineFileStorage *)self _identityForIdentifier:a4];
  LOBYTE(a5) = [(CPLEngineFileStorage *)self storeUnretainedData:v8 identity:v9 isOriginal:0 error:a5];

  return (char)a5;
}

- (BOOL)storeUnretainedFileAtURL:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(CPLEngineFileStorage *)self _identityForIdentifier:a4];
  LOBYTE(a5) = [(CPLEngineFileStorage *)self storeUnretainedFileAtURL:v8 identity:v9 isOriginal:0 error:a5];

  return (char)a5;
}

- (BOOL)deleteFileWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = [(CPLEngineFileStorage *)self _identityForIdentifier:a3];
  LOBYTE(a4) = [(CPLEngineFileStorage *)self deleteFileWithIdentity:v6 error:a4];

  return (char)a4;
}

- (BOOL)discardUncommittedFileWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = [(CPLEngineFileStorage *)self _identityForIdentifier:a3];
  LOBYTE(a4) = [(CPLEngineFileStorage *)self discardUncommittedFileWithIdentity:v6 error:a4];

  return (char)a4;
}

- (BOOL)commitFileWithIdentifier:(id)a3 error:(id *)a4
{
  v6 = [(CPLEngineFileStorage *)self _identityForIdentifier:a3];
  LOBYTE(a4) = [(CPLEngineFileStorage *)self commitFileWithIdentity:v6 error:a4];

  return (char)a4;
}

- (BOOL)storeData:(id)a3 identifier:(id)a4 needsCommit:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(CPLEngineFileStorage *)self _identityForIdentifier:a4];
  LOBYTE(a6) = [(CPLEngineFileStorage *)self storeData:v10 identity:v11 isOriginal:0 needsCommit:a5 error:a6];

  return (char)a6;
}

- (BOOL)storeFileAtURL:(id)a3 identifier:(id)a4 moveIfPossible:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v13 = [(CPLEngineFileStorage *)self _identityForIdentifier:a4];
  LOBYTE(a7) = [(CPLEngineFileStorage *)self storeFileAtURL:v12 identity:v13 isOriginal:0 moveIfPossible:v9 needsCommit:a6 error:a7];

  return (char)a7;
}

- (id)_identityForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CPLResourceIdentity);
  [(CPLResourceIdentity *)v4 setFingerPrint:v3];

  [(CPLResourceIdentity *)v4 setFileUTI:@"public.data"];
  return v4;
}

- (BOOL)openWithFileRecoveryHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CPLEngineFileStorage_openWithFileRecoveryHandler_error___block_invoke;
  v9[3] = &unk_1E60A7218;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(a4) = [(CPLEngineFileStorage *)self openWithRecoveryHandler:v9 error:a4];

  return (char)a4;
}

uint64_t __58__CPLEngineFileStorage_openWithFileRecoveryHandler_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 fingerPrint];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

- (BOOL)addDeleteFlagToFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineFileStorage *)self platformObject];
  LOBYTE(a4) = [v7 addDeleteFlagToFileAtURL:v6 error:a4];

  return (char)a4;
}

- (void)writeTransactionDidSucceed
{
  id v2 = [(CPLEngineFileStorage *)self platformObject];
  [v2 writeTransactionDidSucceed];
}

- (void)writeTransactionDidFail
{
  id v2 = [(CPLEngineFileStorage *)self platformObject];
  [v2 writeTransactionDidFail];
}

- (BOOL)checkIsEmpty
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  id v2 = [(CPLEngineFileStorage *)self fileEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:v7 objects:v10 count:16];
  if (v3 && !_CPLSilentLogging)
  {
    uint64_t v4 = **((void **)&v7[0] + 1);
    v5 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Resource cache contains at least one item: %@", buf, 0xCu);
    }
  }
  return v3 == 0;
}

- (id)fileEnumerator
{
  return [(CPLEngineFileStorage *)self fileEnumeratorIncludingPropertiesForKeys:MEMORY[0x1E4F1CBF0] errorHandler:0];
}

- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineFileStorage *)self platformObject];
  uint64_t v9 = [v8 fileEnumeratorIncludingPropertiesForKeys:v7 errorHandler:v6];

  return v9;
}

- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 includeOriginals:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v24 = a3;
  if (!_CPLSilentLogging)
  {
    id v12 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = a3;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Trying to free %llu bytes on disk", buf, 0xCu);
    }
  }
  BOOL v13 = [(CPLEngineFileStorage *)self _compactStorageIncludeOriginals:v7 desiredFreeSpace:&v24 error:a6];
  if (v13)
  {
    if (a3 < v24)
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLStorageOSLogDomain_1988();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "We should not have less space on disk after compaction", buf, 2u);
        }
      }
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m"];
      [v22 handleFailureInMethod:a2 object:self file:v23 lineNumber:563 description:@"We should not have less space on disk after compaction"];

      abort();
    }
    *a4 = a3 - v24;
    if (!_CPLSilentLogging)
    {
      v14 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v15 = *a4;
        *(_DWORD *)buf = 134217984;
        unint64_t v26 = v15;
        v16 = "Actually freed %llu bytes";
        v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
LABEL_13:
        _os_log_impl(&dword_1B4CAC000, v17, v18, v16, buf, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if (!_CPLSilentLogging)
  {
    v14 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v19 = *a6;
      *(_DWORD *)buf = 138412290;
      unint64_t v26 = (unint64_t)v19;
      v16 = "Unable to free space on disk: %@";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
LABEL_14:
  }
  return v13;
}

- (BOOL)compactStorageIncludeOriginals:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    BOOL v7 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Compacting", (uint8_t *)&v12, 2u);
    }
  }
  BOOL v8 = [(CPLEngineFileStorage *)self _compactStorageIncludeOriginals:v5 desiredFreeSpace:0 error:a4];
  if (!v8 && !_CPLSilentLogging)
  {
    uint64_t v9 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *a4;
      int v12 = 138412290;
      id v13 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Error compacting: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8;
}

- (BOOL)_compactStorageIncludeOriginals:(BOOL)a3 desiredFreeSpace:(unint64_t *)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v47[1] = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 1;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2006;
  v40 = __Block_byref_object_dispose__2007;
  id v41 = 0;
  BOOL v7 = [(CPLEngineFileStorage *)self platformObject];
  uint64_t v27 = *MEMORY[0x1E4F1C5F8];
  v47[0] = *MEMORY[0x1E4F1C5F8];
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __79__CPLEngineFileStorage__compactStorageIncludeOriginals_desiredFreeSpace_error___block_invoke;
  v35[3] = &unk_1E60A71F0;
  v35[4] = &v36;
  v35[5] = &v42;
  uint64_t v9 = [v7 fileEnumeratorIncludingPropertiesForKeys:v8 errorHandler:v35];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v46 count:16];
  if (!v11) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if (!v6 && ([*(id *)(*((void *)&v31 + 1) + 8 * i) isOriginal] & 1) != 0) {
        continue;
      }
      if (([v14 isMarkedForDelete] & 1) == 0)
      {
        int v19 = *((unsigned __int8 *)v43 + 24);
LABEL_22:
        if (!v19) {
          goto LABEL_27;
        }
        continue;
      }
      if (a4)
      {
        id v30 = 0;
        int v15 = [v14 getResourceValue:&v30 forKey:v27 error:a5];
        id v16 = v30;
        v17 = v16;
        *((unsigned char *)v43 + 24) = v15;
        if (v15) {
          unint64_t v18 = [v16 unsignedLongLongValue];
        }
        else {
          unint64_t v18 = 0;
        }
      }
      else
      {
        unint64_t v18 = 0;
      }
      if (!*((unsigned char *)v43 + 24)) {
        goto LABEL_27;
      }
      v20 = [(CPLEngineFileStorage *)self platformObject];
      v21 = [v14 identity];
      char v22 = [v20 deleteFileWithIdentity:v21 includingOriginal:v6 error:a5];
      *((unsigned char *)v43 + 24) = v22;

      int v19 = *((unsigned __int8 *)v43 + 24);
      BOOL v23 = a4 == 0;
      if (!*((unsigned char *)v43 + 24)) {
        BOOL v23 = 1;
      }
      if (v23) {
        goto LABEL_22;
      }
      if (*a4 <= v18)
      {
        *a4 = 0;
        goto LABEL_27;
      }
      *a4 -= v18;
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v46 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_27:

  if (*((unsigned char *)v43 + 24))
  {
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = 0;
    if (a5)
    {
      v25 = (void *)v37[5];
      if (v25)
      {
        *a5 = v25;
        BOOL v24 = *((unsigned char *)v43 + 24) != 0;
      }
    }
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  return v24;
}

uint64_t __79__CPLEngineFileStorage__compactStorageIncludeOriginals_desiredFreeSpace_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v7 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412546;
        id v11 = v5;
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Error accessing %@ file: %@", (uint8_t *)&v10, 0x16u);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v8;
}

- (BOOL)tryToFreeDiskSpace:(unint64_t)a3 actuallyFreedSpace:(unint64_t *)a4 error:(id *)a5
{
  return [(CPLEngineFileStorage *)self tryToFreeDiskSpace:a3 actuallyFreedSpace:a4 includeOriginals:!self->_keepOriginals error:a5];
}

- (BOOL)resetWithError:(id *)a3
{
  uint64_t v4 = [(CPLEngineFileStorage *)self platformObject];
  LOBYTE(a3) = [v4 resetWithError:a3];

  return (char)a3;
}

- (BOOL)compactStorage:(id *)a3
{
  return [(CPLEngineFileStorage *)self compactStorageIncludeOriginals:!self->_keepOriginals error:a3];
}

- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Discarding all URLs for upload", (uint8_t *)&v15, 2u);
    }
  }
  id v6 = [(CPLEngineFileStorage *)self platformObject];
  char v7 = [v6 discardAllRetainedFileURLsWithError:a3];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        uint64_t v9 = "All URLs were discarded successfully";
        int v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        uint32_t v12 = 2;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v8 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a3;
      int v15 = 138412290;
      id v16 = v13;
      uint64_t v9 = "Unable to discard all URLs: %@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_12;
    }
LABEL_13:
  }
  return v7;
}

- (BOOL)releaseFileURL:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    char v7 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [v6 path];
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Releasing %@", (uint8_t *)&v18, 0xCu);
    }
  }
  uint64_t v9 = [(CPLEngineFileStorage *)self platformObject];
  char v10 = [v9 releaseFileURL:v6 error:a4];

  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      os_log_type_t v11 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        uint32_t v12 = "URL was released successfully";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        uint32_t v15 = 2;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v13, v14, v12, (uint8_t *)&v18, v15);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    os_log_type_t v11 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v16 = *a4;
      int v18 = 138412290;
      id v19 = v16;
      uint32_t v12 = "Unable to release URL: %@";
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 12;
      goto LABEL_12;
    }
LABEL_13:
  }
  return v10;
}

- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v9 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      char v10 = +[CPLResource shortDescriptionForResourceType:a4];
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Retaining URL for %@ (%@)", (uint8_t *)&v16, 0x16u);
    }
  }
  os_log_type_t v11 = [(CPLEngineFileStorage *)self platformObject];
  uint32_t v12 = [v11 retainFileURLForIdentity:v8 resourceType:a4 error:a5];

  if (v12 && !_CPLSilentLogging)
  {
    id v13 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v14 = [v12 path];
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEBUG, "Retained URL: %@", (uint8_t *)&v16, 0xCu);
    }
  }

  return v12;
}

- (void)checkFileSizeForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineFileStorage *)self platformObject];
  [v5 checkFileSizeForIdentity:v4];
}

- (BOOL)hasFileWithIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineFileStorage *)self platformObject];
  char v6 = [v5 hasFileWithIdentity:v4];

  return v6;
}

- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint32_t v12 = [(CPLEngineFileStorage *)self platformObject];
  LOBYTE(a6) = [v12 storeUnretainedData:v11 identity:v10 isOriginal:v7 error:a6];

  return (char)a6;
}

- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint32_t v12 = [(CPLEngineFileStorage *)self platformObject];
  LOBYTE(a6) = [v12 storeUnretainedFileAtURL:v11 identity:v10 isOriginal:v7 error:a6];

  return (char)a6;
}

- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_deleteImmediately)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Deleting %@", (uint8_t *)&v19, 0xCu);
      }
    }
    id v10 = [(CPLEngineFileStorage *)self platformObject];
    char v11 = [v10 deleteFileWithIdentity:v8 includingOriginal:v6 error:a5];

    if ((v11 & 1) == 0 && !_CPLSilentLogging)
    {
      uint32_t v12 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = *a5;
        int v19 = 138412290;
        id v20 = v13;
        os_log_type_t v14 = "Unable to delete: %@";
LABEL_18:
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint32_t v15 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEBUG, "Marking %@ for deletion", (uint8_t *)&v19, 0xCu);
      }
    }
    int v16 = [(CPLEngineFileStorage *)self platformObject];
    char v11 = [v16 markForDeleteFileWithIdentity:v8 error:a5];

    if ((v11 & 1) == 0 && !_CPLSilentLogging)
    {
      uint32_t v12 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v17 = *a5;
        int v19 = 138412290;
        id v20 = v17;
        os_log_type_t v14 = "Unable to mark for delete: %@";
        goto LABEL_18;
      }
LABEL_19:

      char v11 = 0;
    }
  }

  return v11;
}

- (BOOL)deleteFileWithIdentity:(id)a3 error:(id *)a4
{
  return [(CPLEngineFileStorage *)self deleteFileWithIdentity:a3 includingOriginal:!self->_keepOriginals error:a4];
}

- (BOOL)discardUncommittedFileWithIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineFileStorage *)self deleteFileWithIdentity:v6 error:a4];
  if (v7) {
    [(CPLEngineFileStorage *)self _removeIdentityFromUncommittedFiles:v6];
  }

  return v7;
}

- (BOOL)commitFileWithIdentity:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (!_CPLSilentLogging)
  {
    os_log_type_t v14 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = [v12 length];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Storing %lu bytes with identity %@", buf, 0x16u);
    }
  }
  if (![(CPLEngineFileStorage *)self _fixupIdentity:v13 fileURL:0 data:v12 error:a7])
  {
    LOBYTE(v17) = 0;
LABEL_12:
    if (!_CPLSilentLogging)
    {
      __int16 v18 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = *a7;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Error storing data: %@", buf, 0xCu);
      }
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v25 = 0;
  uint32_t v15 = [(CPLEngineFileStorage *)self platformObject];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__CPLEngineFileStorage_storeData_identity_isOriginal_needsCommit_error___block_invoke;
  v21[3] = &unk_1E60AB850;
  BOOL v23 = buf;
  v21[4] = self;
  id v16 = v13;
  id v22 = v16;
  int v17 = [v15 storeData:v12 identity:v16 isOriginal:v9 needsCommit:a6 onNewFile:v21 error:a7];

  if (v17)
  {
    [v16 setAvailable:1];
    [v16 setFileURL:0];
  }
  else if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(CPLEngineFileStorage *)self _removeIdentityFromUncommittedFiles:v16];
  }

  _Block_object_dispose(buf, 8);
  if ((v17 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_16:

  return v17;
}

uint64_t __72__CPLEngineFileStorage_storeData_identity_isOriginal_needsCommit_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) _addIdentityToUncommittedFiles:*(void *)(a1 + 40)];
  return 1;
}

- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  if (!_CPLSilentLogging)
  {
    id v16 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEBUG, "Storing %@ with identity %@", buf, 0x16u);
    }
  }
  if (![(CPLEngineFileStorage *)self _fixupIdentity:v15 fileURL:v14 data:0 error:a8])
  {
    LOBYTE(v19) = 0;
LABEL_12:
    if (!_CPLSilentLogging)
    {
      id v20 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = *a8;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Error storing file: %@", buf, 0xCu);
      }
    }
    goto LABEL_16;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v27 = 0;
  int v17 = [(CPLEngineFileStorage *)self platformObject];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __92__CPLEngineFileStorage_storeFileAtURL_identity_isOriginal_moveIfPossible_needsCommit_error___block_invoke;
  v23[3] = &unk_1E60AB850;
  char v25 = buf;
  v23[4] = self;
  id v18 = v15;
  id v24 = v18;
  int v19 = [v17 storeFileAtURL:v14 identity:v18 isOriginal:v11 moveIfPossible:v10 needsCommit:a7 onNewFile:v23 error:a8];

  if (v19)
  {
    [v18 setAvailable:1];
    [v18 setFileURL:0];
  }
  else if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(CPLEngineFileStorage *)self _removeIdentityFromUncommittedFiles:v18];
  }

  _Block_object_dispose(buf, 8);
  if ((v19 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_16:

  return v19;
}

uint64_t __92__CPLEngineFileStorage_storeFileAtURL_identity_isOriginal_moveIfPossible_needsCommit_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) _addIdentityToUncommittedFiles:*(void *)(a1 + 40)];
  return 1;
}

- (BOOL)_fixupIdentity:(id)a3 fileURL:(id)a4 data:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [v8 fileUTI];
  if (!v10)
  {
    BOOL v11 = [v9 pathExtension];
    if (![v11 length])
    {
      id v12 = [v8 fileURL];
      uint64_t v13 = [v12 pathExtension];

      BOOL v11 = (void *)v13;
    }
    id v14 = +[CPLResourceIdentity fileUTIForExtension:v11];
    [v8 setFileUTI:v14];
  }
  id v15 = [v8 fingerPrint];
  if (!v15)
  {
    id v16 = +[CPLErrors incorrectParametersErrorForParameter:@"fingerprint"];
    int v17 = v16;
    if (a6) {
      *a6 = v16;
    }
  }
  return v15 != 0;
}

- (void)_removeIdentityFromUncommittedFiles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identityForStorage];
  uint64_t v6 = [(NSMutableArray *)self->_uncommittedFiles indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v4;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "Removing %@ from the list of uncommitted files", buf, 0xCu);
      }
    }
    [(NSMutableArray *)self->_uncommittedFiles removeObjectAtIndex:v7];
    if (![(NSMutableArray *)self->_uncommittedFiles count])
    {
      uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      crashMarkerURL = self->_crashMarkerURL;
      id v16 = 0;
      char v15 = [v13 removeItemAtURL:crashMarkerURL error:&v16];
      id v9 = v16;

      if ((v15 & 1) != 0 || _CPLSilentLogging) {
        goto LABEL_17;
      }
      BOOL v10 = __CPLStorageOSLogDomain_1988();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      BOOL v11 = "Unable to remove crash recovery file: %@";
      id v12 = v10;
LABEL_15:
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
LABEL_16:

      goto LABEL_17;
    }
    if (([(NSMutableArray *)self->_uncommittedFiles writeToURL:self->_crashMarkerURL atomically:1] & 1) == 0&& !_CPLSilentLogging)
    {
      id v9 = __CPLStorageOSLogDomain_1988();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        goto LABEL_18;
      }
      BOOL v10 = [(NSURL *)self->_crashMarkerURL path];
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      BOOL v11 = "Unable to store the crash recovery file to %@";
      id v12 = v9;
      goto LABEL_15;
    }
  }
LABEL_18:
}

- (void)_addIdentityToUncommittedFiles:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identityForStorage];
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Adding %@ to the list of uncommitted files", (uint8_t *)&v9, 0xCu);
    }
  }
  [(NSMutableArray *)self->_uncommittedFiles addObject:v5];
  if (([(NSMutableArray *)self->_uncommittedFiles writeToURL:self->_crashMarkerURL atomically:1] & 1) == 0&& !_CPLSilentLogging)
  {
    uint64_t v7 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(NSURL *)self->_crashMarkerURL path];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Unable to store the crash recovery file to %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)hasCrashMarker
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(NSURL *)self->_crashMarkerURL path];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (unint64_t)countOfUncommittedFiles
{
  return [(NSMutableArray *)self->_uncommittedFiles count];
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    char v5 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Opening", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v6 = [(CPLEngineFileStorage *)self platformObject];
  char v7 = [v6 closeWithError:a3];

  if (v7)
  {
    if ([(NSMutableArray *)self->_uncommittedFiles count] && !_CPLSilentLogging)
    {
      id v8 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [(NSMutableArray *)self->_uncommittedFiles count];
        int v14 = 134217984;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Storage still has %lu uncommitted files", (uint8_t *)&v14, 0xCu);
      }
    }
    [(NSMutableArray *)self->_uncommittedFiles removeAllObjects];
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [(NSURL *)self->_baseURL path];
        int v14 = 138412290;
        uint64_t v15 = (uint64_t)v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Closed storage at %@", (uint8_t *)&v14, 0xCu);
      }
LABEL_17:
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v10 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = *a3;
      int v14 = 138412290;
      uint64_t v15 = (uint64_t)v12;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Error closing: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_17;
  }
  return v7;
}

- (BOOL)openWithRecoveryHandler:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    char v7 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Opening", (uint8_t *)&v23, 2u);
    }
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 createDirectoryAtURL:self->_baseURL withIntermediateDirectories:1 attributes:0 error:a4];

  if ((v9 & 1) == 0 && !_CPLSilentLogging)
  {
    id v10 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      baseURL = self->_baseURL;
      int v23 = 138412290;
      id v24 = baseURL;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Unable to create folder %@", (uint8_t *)&v23, 0xCu);
    }
  }
  if (!v9) {
    goto LABEL_21;
  }
  id v12 = [(CPLEngineFileStorage *)self platformObject];
  char v13 = [v12 openWithError:a4];

  if ((v13 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v15 = __CPLStorageOSLogDomain_1988();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [(CPLEngineFileStorage *)self platformObject];
        id v21 = *a4;
        int v23 = 138412546;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v21;
        int v17 = "%@ failed to open: %@";
        id v18 = v15;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        uint32_t v20 = 22;
        goto LABEL_19;
      }
LABEL_20:

      LOBYTE(v14) = v13;
      goto LABEL_22;
    }
LABEL_21:
    LOBYTE(v14) = 0;
    goto LABEL_22;
  }
  BOOL v14 = [(CPLEngineFileStorage *)self _recoverFromCrashWithRecoveryHandler:v6 error:a4];
  if (v14 && !_CPLSilentLogging)
  {
    uint64_t v15 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [(NSURL *)self->_baseURL path];
      int v23 = 138412290;
      id v24 = v16;
      int v17 = "Opened storage at %@";
      id v18 = v15;
      os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
      uint32_t v20 = 12;
LABEL_19:
      _os_log_impl(&dword_1B4CAC000, v18, v19, v17, (uint8_t *)&v23, v20);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
LABEL_22:

  return v14;
}

- (BOOL)_recoverFromCrashWithRecoveryHandler:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, void *))a3;
  char v7 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfURL:self->_crashMarkerURL];
  if (!v7)
  {
    char v33 = 1;
    goto LABEL_42;
  }
  id v8 = &unk_1E9D43000;
  if (!_CPLSilentLogging)
  {
    int v9 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = [v7 count];
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Found %lu uncommitted files in storage", buf, 0xCu);
    }
  }
  v39 = a4;
  v40 = v7;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    unint64_t v13 = 0x1E60A5000uLL;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = objc_msgSend(*(id *)(v13 + 2128), "identityFromStoredIdentity:", *(void *)(*((void *)&v44 + 1) + 8 * i), v39);
        if (!v6) {
          goto LABEL_21;
        }
        int v16 = v6[2](v6, v15);
        if (v16) {
          BOOL v17 = v8[2752] == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          id v18 = __CPLStorageOSLogDomain_1988();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v49 = (uint64_t)v15;
            _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Will keep %@", buf, 0xCu);
          }
        }
        if (v16)
        {
LABEL_21:
          id v43 = 0;
          BOOL v19 = [(CPLEngineFileStorage *)self deleteFileWithIdentity:v15 error:&v43];
          id v20 = v43;
          if (v19)
          {
            if (!v8[2752])
            {
              id v21 = __CPLStorageOSLogDomain_1988();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = (uint64_t)v15;
                id v22 = v21;
                os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
                id v24 = "Cleaned up %@";
                goto LABEL_28;
              }
              goto LABEL_29;
            }
          }
          else
          {
            uncommittedFiles = self->_uncommittedFiles;
            [v15 identityForStorage];
            id v42 = v20;
            id v26 = v6;
            uint64_t v27 = v11;
            uint64_t v28 = v12;
            v29 = self;
            unint64_t v30 = v13;
            v32 = long long v31 = v8;
            [(NSMutableArray *)uncommittedFiles addObject:v32];

            id v8 = v31;
            unint64_t v13 = v30;
            self = v29;
            uint64_t v12 = v28;
            uint64_t v11 = v27;
            id v6 = v26;
            id v20 = v42;
            if (!v8[2752])
            {
              id v21 = __CPLStorageOSLogDomain_1988();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = (uint64_t)v15;
                id v22 = v21;
                os_log_type_t v23 = OS_LOG_TYPE_ERROR;
                id v24 = "Unable to clean up %@";
LABEL_28:
                _os_log_impl(&dword_1B4CAC000, v22, v23, v24, buf, 0xCu);
              }
LABEL_29:
            }
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v11);
  }

  if ([(NSMutableArray *)self->_uncommittedFiles count])
  {
    char v33 = 1;
    [(NSMutableArray *)self->_uncommittedFiles writeToURL:self->_crashMarkerURL atomically:1];
LABEL_35:
    char v7 = v40;
    goto LABEL_42;
  }
  long long v34 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v33 = [v34 removeItemAtURL:self->_crashMarkerURL error:v39];

  if (v33) {
    goto LABEL_35;
  }
  char v7 = v40;
  if (!v8[2752])
  {
    v35 = __CPLStorageOSLogDomain_1988();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = [(NSURL *)self->_crashMarkerURL path];
      id v37 = *v39;
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = (uint64_t)v36;
      __int16 v50 = 2112;
      id v51 = v37;
      _os_log_impl(&dword_1B4CAC000, v35, OS_LOG_TYPE_ERROR, "Unable to delete crash marker at %@. Can't open the database: %@", buf, 0x16u);
    }
    char v33 = 0;
  }
LABEL_42:

  return v33;
}

- (BOOL)doWrite:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  os_log_type_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__2006;
  id v20 = __Block_byref_object_dispose__2007;
  id v21 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CPLEngineFileStorage_doWrite_error___block_invoke;
  block[3] = &unk_1E60A71C8;
  BOOL v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v16;
  dispatch_barrier_sync(lock, block);
  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __38__CPLEngineFileStorage_doWrite_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = (*(uint64_t (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (void)doRead:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CPLEngineFileStorage_doRead___block_invoke;
  block[3] = &unk_1E60A6978;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, block);
}

void __31__CPLEngineFileStorage_doRead___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CPLEngineFileStorage)initWithBaseURL:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLEngineFileStorage;
  id v6 = [(CPLEngineFileStorage *)&v30 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    baseURL = v6->_baseURL;
    v6->_baseURL = (NSURL *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.filestorage", MEMORY[0x1E4F14430]);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_queue *)v9;

    logDomain = v6->_logDomain;
    v6->_logDomain = (NSString *)@"engine.filestorage";

    *(_WORD *)&v6->_keepOriginals = 256;
    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uncommittedFiles = v6->_uncommittedFiles;
    v6->_uncommittedFiles = v12;

    uint64_t v14 = [(NSURL *)v6->_baseURL URLByAppendingPathComponent:@".fileStorageCrashMarker.plist" isDirectory:0];
    crashMarkerURL = v6->_crashMarkerURL;
    v6->_crashMarkerURL = (NSURL *)v14;

    uint64_t v16 = +[CPLPlatform currentPlatform];
    uint64_t v17 = [v16 newPlatformImplementationForObject:v6];
    platformObject = v6->_platformObject;
    v6->_platformObject = (CPLPlatformObject *)v17;

    if (!v6->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        char v25 = __CPLStorageOSLogDomain_1988();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          long long v32 = v26;
          id v27 = v26;
          _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m"];
      [v28 handleFailureInMethod:a2, v6, v29, 120, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
    BOOL v19 = [(CPLEngineFileStorage *)v6 _markerURLForTrackAllStoresAndDeletes];
    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = [v19 path];
    int v22 = [v20 fileExistsAtPath:v21];

    if (v22)
    {
      os_log_type_t v23 = [(CPLEngineFileStorage *)v6 platformObject];
      [v23 setTrackAllStoresAndDeletes:1];
    }
  }

  return v6;
}

- (BOOL)trackAllStoresAndDeletesUntilEndOfTransaction
{
  return self->_trackAllStoresAndDeletesUntilEndOfTransaction;
}

- (void)setTrackAllStoresAndDeletesUntilEndOfTransaction:(BOOL)a3
{
  if (self->_trackAllStoresAndDeletesUntilEndOfTransaction)
  {
    if (a3) {
      return;
    }
    self->_trackAllStoresAndDeletesUntilEndOfTransaction = 0;
    if (!self->_shouldResetPlatformTrackAllStoresAndDeletes) {
      return;
    }
    self->_shouldResetPlatformTrackAllStoresAndDeletes = 0;
    id v4 = [(CPLEngineFileStorage *)self platformObject];
    id v7 = v4;
    uint64_t v5 = 0;
  }
  else
  {
    if (!a3) {
      return;
    }
    id v6 = [(CPLEngineFileStorage *)self platformObject];
    self->_shouldResetPlatformTrackAllStoresAndDeletes = [v6 trackAllStoresAndDeletes] ^ 1;

    self->_trackAllStoresAndDeletesUntilEndOfTransaction = 1;
    id v4 = [(CPLEngineFileStorage *)self platformObject];
    id v7 = v4;
    uint64_t v5 = 1;
  }
  [v4 setTrackAllStoresAndDeletes:v5];
}

- (BOOL)trackAllStoresAndDeletes
{
  uint64_t v2 = [(CPLEngineFileStorage *)self platformObject];
  char v3 = [v2 trackAllStoresAndDeletes];

  return v3;
}

- (void)setTrackAllStoresAndDeletes:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(CPLEngineFileStorage *)self _markerURLForTrackAllStoresAndDeletes];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = v5;
  if (v3)
  {
    id v7 = [v11 path];
    char v8 = [v6 fileExistsAtPath:v7];

    if (v8) {
      goto LABEL_6;
    }
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    dispatch_queue_t v9 = +[CPLDateFormatter stringFromDate:v6];
    [v9 writeToURL:v11 atomically:1 encoding:4 error:0];
  }
  else
  {
    [v5 removeItemAtURL:v11 error:0];
  }

LABEL_6:
  BOOL v10 = [(CPLEngineFileStorage *)self platformObject];
  [v10 setTrackAllStoresAndDeletes:v3];
}

- (id)_markerURLForTrackAllStoresAndDeletes
{
  return [(NSURL *)self->_baseURL URLByAppendingPathComponent:@"track_storage_marker" isDirectory:0];
}

+ (id)platformImplementationProtocol
{
  uint64_t v2 = [(id)objc_opt_class() description];
  BOOL v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

@end