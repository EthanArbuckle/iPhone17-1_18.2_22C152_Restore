@interface CPLEngineResourceStorage
- (BOOL)_clearAndCreateTempFolderIfNecessaryWithError:(id *)a3;
- (BOOL)checkIsEmpty;
- (BOOL)compactWithError:(id *)a3;
- (BOOL)dropResourceForUpload:(id)a3 error:(id *)a4;
- (BOOL)hasResource:(id)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performMaintenanceWithError:(id *)a3;
- (BOOL)releaseFileURL:(id)a3 forResource:(id)a4 error:(id *)a5;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)shouldCheckFilesForUpload;
- (BOOL)storeDownloadedResource:(id)a3 atURL:(id)a4 error:(id *)a5;
- (BOOL)storeResourceCopyForUpload:(id)a3 error:(id *)a4;
- (BOOL)storeResourceForUpload:(id)a3 shouldCheckResource:(BOOL)a4 error:(id *)a5;
- (CPLEngineFileStorage)fileStorage;
- (CPLEngineResourceStorage)initWithEngineStore:(id)a3 name:(id)a4;
- (NSURL)tempFolderURL;
- (id)createTempDestinationURLForResource:(id)a3 error:(id *)a4;
- (id)retainFileURLForResource:(id)a3 error:(id *)a4;
- (id)status;
- (id)statusDictionary;
- (unint64_t)scopeType;
- (unint64_t)sizeOfOriginalResourcesToUpload;
- (unint64_t)sizeOfResourcesToUpload;
- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5;
- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5 prunedSize:(unint64_t)a6;
- (void)setShouldCheckFilesForUpload:(BOOL)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineResourceStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileStorage, 0);
  objc_storeStrong((id *)&self->_purgeabilityCheckRequests, 0);
  objc_storeStrong((id *)&self->_pruneRequests, 0);
  objc_storeStrong((id *)&self->_pruneStatsQueue, 0);
  objc_storeStrong((id *)&self->_tempFolderURL, 0);
  objc_storeStrong((id *)&self->_identitiesToDelete, 0);
  objc_storeStrong((id *)&self->_identitiesToCommit, 0);
}

- (NSURL)tempFolderURL
{
  return self->_tempFolderURL;
}

- (void)setShouldCheckFilesForUpload:(BOOL)a3
{
  self->_shouldCheckFilesForUpload = a3;
}

- (BOOL)shouldCheckFilesForUpload
{
  return self->_shouldCheckFilesForUpload;
}

- (CPLEngineFileStorage)fileStorage
{
  return self->_fileStorage;
}

- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v11 = v8;
  if (v5)
  {
    v9 = [v8 identity];
    -[CPLEngineResourceStorage notePruningRequestForResource:realPrune:successful:prunedSize:](self, "notePruningRequestForResource:realPrune:successful:prunedSize:", v11, v6, 1, [v9 fileSize]);

    v10 = v9;
  }
  else
  {
    [(CPLEngineResourceStorage *)self notePruningRequestForResource:v8 realPrune:v6 successful:0 prunedSize:0];
    v10 = v11;
  }
}

- (void)notePruningRequestForResource:(id)a3 realPrune:(BOOL)a4 successful:(BOOL)a5 prunedSize:(unint64_t)a6
{
  id v10 = a3;
  pruneStatsQueue = self->_pruneStatsQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__CPLEngineResourceStorage_notePruningRequestForResource_realPrune_successful_prunedSize___block_invoke;
  v16[3] = &unk_1E60A6CB0;
  BOOL v19 = a4;
  v16[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  unint64_t v18 = a6;
  v12 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_3;
  block[3] = &unk_1E60A6978;
  id v22 = v12;
  v13 = pruneStatsQueue;
  id v14 = v10;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v15);
}

uint64_t __90__CPLEngineResourceStorage_notePruningRequestForResource_realPrune_successful_prunedSize___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    v1 = &OBJC_IVAR___CPLEngineResourceStorage__pruneRequests;
  }
  else {
    v1 = &OBJC_IVAR___CPLEngineResourceStorage__purgeabilityCheckRequests;
  }
  return [*(id *)(*(void *)(a1 + 32) + *v1) noteRequestForResource:*(void *)(a1 + 40) successful:*(unsigned __int8 *)(a1 + 57) prunedSize:*(void *)(a1 + 48)];
}

- (id)statusDictionary
{
  v18.receiver = self;
  v18.super_class = (Class)CPLEngineResourceStorage;
  v3 = [(CPLEngineStorage *)&v18 statusDictionary];
  v4 = (void *)[v3 mutableCopy];

  pruneStatsQueue = self->_pruneStatsQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __44__CPLEngineResourceStorage_statusDictionary__block_invoke;
  dispatch_block_t v15 = &unk_1E60A6728;
  id v6 = v4;
  id v16 = v6;
  id v17 = self;
  dispatch_sync(pruneStatsQueue, &v12);
  v7 = [(CPLEngineStorage *)self engineStore];
  id v8 = [v7 derivativesFilter];

  v9 = [v8 plistDescription];
  [v6 setObject:v9 forKeyedSubscript:@"derivativesFilter"];

  id v10 = v6;
  return v10;
}

void __44__CPLEngineResourceStorage_statusDictionary__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CPLEngineResourceStorage_statusDictionary__block_invoke_2;
  v3[3] = &unk_1E60A6C88;
  id v4 = *(id *)(a1 + 32);
  v2 = (void (**)(void, void))MEMORY[0x1BA994060](v3);
  v2[2](v2, *(void *)(*(void *)(a1 + 40) + 72));
  v2[2](v2, *(void *)(*(void *)(a1 + 40) + 80));
}

void __44__CPLEngineResourceStorage_statusDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 statusDictionary];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    BOOL v5 = [v6 statusKey];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

- (id)status
{
  v17.receiver = self;
  v17.super_class = (Class)CPLEngineResourceStorage;
  v3 = [(CPLEngineStorage *)&v17 status];
  id v4 = (void *)[v3 mutableCopy];

  pruneStatsQueue = self->_pruneStatsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CPLEngineResourceStorage_status__block_invoke;
  block[3] = &unk_1E60A6728;
  id v6 = v4;
  id v15 = v6;
  id v16 = self;
  dispatch_sync(pruneStatsQueue, block);
  v7 = [(CPLEngineStorage *)self engineStore];
  id v8 = [v7 derivativesFilter];

  if (v8 && ([v8 isEmpty] & 1) == 0)
  {
    v9 = [v8 description];
    id v10 = [v9 componentsSeparatedByString:@"\n"];
    id v11 = [v10 componentsJoinedByString:@"\n\t"];
    [v6 appendFormat:@"\nDerivatives filter: %@", v11];
  }
  else
  {
    [v6 appendString:@"\nDerivatives filter: none"];
  }
  id v12 = v6;

  return v12;
}

void __34__CPLEngineResourceStorage_status__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CPLEngineResourceStorage_status__block_invoke_2;
  v3[3] = &unk_1E60A6C88;
  id v4 = *(id *)(a1 + 32);
  v2 = (void (**)(void, void))MEMORY[0x1BA994060](v3);
  v2[2](v2, *(void *)(*(void *)(a1 + 40) + 72));
  v2[2](v2, *(void *)(*(void *)(a1 + 40) + 80));
}

void __34__CPLEngineResourceStorage_status__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 status];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    BOOL v5 = [v6 title];
    [v4 appendFormat:@"\n%@: %@", v5, v3];
  }
}

- (void)writeTransactionDidSucceed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CPLEngineFileStorage *)self->_fileStorage writeTransactionDidSucceed];
  if ([(NSMutableDictionary *)self->_identitiesToDelete count]
    || [(NSMutableDictionary *)self->_identitiesToCommit count])
  {
    fileStorage = self->_fileStorage;
    id v10 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke;
    v11[3] = &unk_1E60AB410;
    v11[4] = self;
    BOOL v4 = [(CPLEngineFileStorage *)fileStorage doWrite:v11 error:&v10];
    id v5 = v10;
    if (!v4 && !_CPLSilentLogging)
    {
      id v6 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identitiesToCommit = self->_identitiesToCommit;
        identitiesToDelete = self->_identitiesToDelete;
        *(_DWORD *)buf = 138412802;
        uint64_t v13 = identitiesToCommit;
        __int16 v14 = 2112;
        id v15 = identitiesToDelete;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Unable to commit %@ or delete %@ to file storage: %@", buf, 0x20u);
      }
    }
    [(NSMutableDictionary *)self->_identitiesToCommit removeAllObjects];
    [(NSMutableDictionary *)self->_identitiesToDelete removeAllObjects];
  }
  [(CPLEngineFileStorage *)self->_fileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:0];
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineResourceStorage;
  [(CPLEngineStorage *)&v9 writeTransactionDidSucceed];
}

BOOL __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_2;
  v12[3] = &unk_1E60A6C60;
  v12[4] = v4;
  v12[5] = &v19;
  v12[6] = &v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_3;
  v11[3] = &unk_1E60A6C60;
  v11[4] = v6;
  void v11[5] = &v19;
  v11[6] = &v13;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a2 && !*((unsigned char *)v20 + 24))
  {
    *a2 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1[4] + 96);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  int v6 = [v4 commitFileWithIdentity:a3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[5] + 8);
  if (v6) {
    BOOL v8 = *(unsigned char *)(v7 + 24) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
}

void __54__CPLEngineResourceStorage_writeTransactionDidSucceed__block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1[4] + 96);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  int v6 = [v4 deleteFileWithIdentity:a3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[5] + 8);
  if (v6) {
    BOOL v8 = *(unsigned char *)(v7 + 24) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
}

- (void)writeTransactionDidFail
{
  [(CPLEngineFileStorage *)self->_fileStorage writeTransactionDidFail];
  if ([(NSMutableDictionary *)self->_identitiesToCommit count])
  {
    fileStorage = self->_fileStorage;
    id v6 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke;
    v7[3] = &unk_1E60AB410;
    v7[4] = self;
    [(CPLEngineFileStorage *)fileStorage doWrite:v7 error:&v6];
    id v4 = v6;
    [(NSMutableDictionary *)self->_identitiesToCommit removeAllObjects];
  }
  [(CPLEngineFileStorage *)self->_fileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:0];
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineResourceStorage;
  [(CPLEngineStorage *)&v5 writeTransactionDidFail];
}

BOOL __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke_2;
  v8[3] = &unk_1E60A6C60;
  v8[4] = v3;
  v8[5] = &v9;
  v8[6] = &v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  int v5 = *((unsigned __int8 *)v10 + 24);
  if (a2 && !*((unsigned char *)v10 + 24))
  {
    *a2 = (id) v14[5];
    int v5 = *((unsigned __int8 *)v10 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __51__CPLEngineResourceStorage_writeTransactionDidFail__block_invoke_2(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *(void **)(a1[4] + 96);
  uint64_t v8 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v7 discardUncommittedFileWithIdentity:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Unable to discard %@ from file storage", buf, 0xCu);
      }
    }
    *a4 = 1;
  }
}

- (BOOL)checkIsEmpty
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  fileStorage = self->_fileStorage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__CPLEngineResourceStorage_checkIsEmpty__block_invoke;
  v5[3] = &unk_1E60A5CE8;
  v5[4] = self;
  v5[5] = &v6;
  [(CPLEngineFileStorage *)fileStorage doRead:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__CPLEngineResourceStorage_checkIsEmpty__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) checkIsEmpty];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)resetWithError:(id *)a3
{
  int v5 = [(CPLEngineStorage *)self platformObject];
  int v6 = [v5 resetWithError:a3];

  if (!v6) {
    return 0;
  }
  fileStorage = self->_fileStorage;
  return [(CPLEngineFileStorage *)fileStorage resetWithError:a3];
}

- (BOOL)compactWithError:(id *)a3
{
  fileStorage = self->_fileStorage;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CPLEngineResourceStorage_compactWithError___block_invoke;
  v5[3] = &unk_1E60AB410;
  v5[4] = self;
  return [(CPLEngineFileStorage *)fileStorage doWrite:v5 error:a3];
}

uint64_t __45__CPLEngineResourceStorage_compactWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) compactStorage:a2];
}

- (BOOL)storeDownloadedResource:(id)a3 atURL:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 identity];
  uint64_t v12 = [v11 fileURL];
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      char v22 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "We should not try to store a resource that is not on disk", buf, 2u);
      }
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceStorage.m"];
    [v23 handleFailureInMethod:a2 object:self file:v24 lineNumber:357 description:@"We should not try to store a resource that is not on disk"];

    abort();
  }
  id v13 = (void *)v12;
  BOOL v14 = [v9 resourceType] == 1;
  fileStorage = self->_fileStorage;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__CPLEngineResourceStorage_storeDownloadedResource_atURL_error___block_invoke;
  v26[3] = &unk_1E60A6C38;
  v26[4] = self;
  id v16 = v13;
  id v27 = v16;
  id v17 = v11;
  id v28 = v17;
  BOOL v29 = v14;
  id v25 = 0;
  BOOL v18 = [(CPLEngineFileStorage *)fileStorage doWrite:v26 error:&v25];
  id v19 = v25;
  BOOL v20 = v19;
  if (a5 && !v18) {
    *a5 = v19;
  }

  return v18;
}

uint64_t __64__CPLEngineResourceStorage_storeDownloadedResource_atURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) storeUnretainedFileAtURL:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) isOriginal:*(unsigned __int8 *)(a1 + 56) error:a2];
}

- (id)createTempDestinationURLForResource:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_shouldCreateTempFolder
    || [(CPLEngineResourceStorage *)self _clearAndCreateTempFolderIfNecessaryWithError:a4])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Creating a temporary URL for %@", buf, 0xCu);
      }
    }
    uint64_t v8 = [v6 bestFileNameForResource];
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 stringByDeletingPathExtension];
      uint64_t v11 = [v9 pathExtension];
      uint64_t v12 = NSString;
      id v13 = [MEMORY[0x1E4F29128] UUID];
      BOOL v14 = [v13 UUIDString];
      uint64_t v15 = [v12 stringWithFormat:@"%@-%@", v10, v14];
      id v16 = [v15 stringByAppendingPathExtension:v11];

      id v17 = [(NSURL *)self->_tempFolderURL URLByAppendingPathComponent:v16 isDirectory:0];

      if (v17 && !_CPLSilentLogging)
      {
        BOOL v18 = __CPLStorageOSLogDomain_202();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v6;
          __int16 v24 = 2112;
          id v25 = v17;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Temporary destination URL for %@ is %@", buf, 0x16u);
        }
      }
      goto LABEL_24;
    }
    if (!_CPLSilentLogging)
    {
      BOOL v20 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Can't find a good filename for %@", buf, 0xCu);
      }
    }
    if (a4)
    {
      +[CPLErrors unknownError];
      id v16 = 0;
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    id v16 = 0;
LABEL_23:
    id v17 = 0;
    goto LABEL_24;
  }
  if (!_CPLSilentLogging)
  {
    id v16 = __CPLStorageOSLogDomain_202();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(NSURL *)self->_tempFolderURL path];
      *(_DWORD *)buf = 138412290;
      id v23 = v19;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Failed to create temp folder at %@", buf, 0xCu);
    }
    goto LABEL_23;
  }
  id v17 = 0;
LABEL_25:

  return v17;
}

- (BOOL)hasResource:(id)a3
{
  fileStorage = self->_fileStorage;
  id v4 = [a3 identity];
  LOBYTE(fileStorage) = [(CPLEngineFileStorage *)fileStorage hasFileWithIdentity:v4];

  return (char)fileStorage;
}

- (BOOL)releaseFileURL:(id)a3 forResource:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CPLEngineStorage *)self platformObject];
  uint64_t v11 = [v9 identity];
  uint64_t v12 = [v10 retainCountForIdentity:v11];

  if (!v12)
  {
    id v13 = [v9 identity];
    identitiesToDelete = self->_identitiesToDelete;
    uint64_t v15 = [v13 identityForStorage];
    [(NSMutableDictionary *)identitiesToDelete setObject:v13 forKeyedSubscript:v15];
  }
  fileStorage = self->_fileStorage;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__CPLEngineResourceStorage_releaseFileURL_forResource_error___block_invoke;
  v24[3] = &unk_1E60AB750;
  v24[4] = self;
  id v17 = v8;
  id v25 = v17;
  id v23 = 0;
  BOOL v18 = [(CPLEngineFileStorage *)fileStorage doWrite:v24 error:&v23];
  id v19 = v23;
  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v20 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v17 path];
        *(_DWORD *)buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        BOOL v29 = v21;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Unable to release %@ / %@: %@", buf, 0x20u);
      }
    }
    if (a5) {
      *a5 = v19;
    }
  }

  return v18;
}

uint64_t __61__CPLEngineResourceStorage_releaseFileURL_forResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) releaseFileURL:*(void *)(a1 + 40) error:a2];
}

- (id)retainFileURLForResource:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  __int16 v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  fileStorage = self->_fileStorage;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__CPLEngineResourceStorage_retainFileURLForResource_error___block_invoke;
  v17[3] = &unk_1E60AB850;
  id v19 = &v20;
  v17[4] = self;
  id v8 = v6;
  id v18 = v8;
  id v16 = 0;
  BOOL v9 = [(CPLEngineFileStorage *)fileStorage doWrite:v17 error:&v16];
  id v10 = v16;
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [(id)v21[5] path];
        *(_DWORD *)buf = 138412546;
        id v27 = v8;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "Retained file path for %@ is: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v8;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEBUG, "Unable to retain URL for %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v10;
    }
  }
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

BOOL __59__CPLEngineResourceStorage_retainFileURLForResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 96);
  int v5 = [*(id *)(a1 + 40) identity];
  uint64_t v6 = objc_msgSend(v4, "retainFileURLForIdentity:resourceType:error:", v5, objc_msgSend(*(id *)(a1 + 40), "resourceType"), a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (unint64_t)sizeOfOriginalResourcesToUpload
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 totalOriginalResourceSize];

  return v3;
}

- (unint64_t)sizeOfResourcesToUpload
{
  v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 totalResourceSize];

  return v3;
}

- (BOOL)dropResourceForUpload:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v21 = 0;
  uint64_t v7 = [v6 identity];
  if (![v7 fileSize])
  {
    fileStorage = self->_fileStorage;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__CPLEngineResourceStorage_dropResourceForUpload_error___block_invoke;
    v18[3] = &unk_1E60A6660;
    v18[4] = self;
    id v19 = v7;
    id v20 = v6;
    [(CPLEngineFileStorage *)fileStorage doRead:v18];
  }
  BOOL v9 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", [v6 resourceType]);
  id v10 = [(CPLEngineStorage *)self platformObject];
  id v17 = 0;
  char v11 = [v10 releaseIdentity:v7 lastReference:&v21 isTrackedOriginal:v9 error:&v17];
  id v12 = v17;

  if (v21)
  {
    identitiesToDelete = self->_identitiesToDelete;
    id v14 = [v7 identityForStorage];
    [(NSMutableDictionary *)identitiesToDelete setObject:v7 forKeyedSubscript:v14];
  }
  if ((v11 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v15 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v6;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Unable to drop resource to upload %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v12;
    }
  }

  return v11;
}

void __56__CPLEngineResourceStorage_dropResourceForUpload_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 96) checkFileSizeForIdentity:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) fileSize]) {
    BOOL v2 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    unint64_t v3 = __CPLStorageOSLogDomain_202();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Incorrect file size for %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)storeResourceCopyForUpload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [v6 identity];
  uint64_t v9 = [v7 retainCountForIdentity:v8];

  if (v9)
  {
    BOOL v10 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", [v6 resourceType]);
    char v11 = [(CPLEngineStorage *)self platformObject];
    id v12 = [v6 identity];
    char v13 = [v11 retainIdentity:v12 isTrackedOriginal:v10 error:a4];
  }
  else if (a4)
  {
    +[CPLErrors cplErrorWithCode:27 description:@"resource is not available locally"];
    char v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)storeResourceForUpload:(id)a3 shouldCheckResource:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  BOOL v9 = v5 && self->_shouldCheckFilesForUpload;
  BOOL v10 = [v7 identity];
  char v11 = [v10 fileURL];
  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v78 = 0x2020000000;
    char v79 = 0;
    BOOL v12 = [v8 resourceType] == 1;
    char v13 = [v10 fingerPrint];
    if (!v13)
    {
      id v15 = +[CPLErrors cplErrorWithCode:50 description:@"fingerPrint is nil"];
      id v18 = 0;
      int v19 = 1;
      v54 = v15;
      goto LABEL_14;
    }
    v54 = [v10 identityForStorage];
    id v14 = [(NSMutableDictionary *)self->_identitiesToDelete objectForKeyedSubscript:v54];

    if (v14)
    {
      [(NSMutableDictionary *)self->_identitiesToDelete removeObjectForKey:v54];
      [v10 setFileURL:0];
      id v15 = 0;
LABEL_38:
      BOOL v34 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", [v8 resourceType]);
      v35 = [v10 fileURL];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        if (!_CPLSilentLogging)
        {
          v45 = __CPLStorageOSLogDomain_202();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v71 = 138412290;
            v72 = v10;
            _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "%@ should not have an URL anymore", v71, 0xCu);
          }
        }
        v46 = [MEMORY[0x1E4F28B00] currentHandler];
        v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceStorage.m"];
        [v46 handleFailureInMethod:a2, self, v47, 209, @"%@ should not have an URL anymore", v10 object file lineNumber description];

        abort();
      }
      v37 = [(CPLEngineStorage *)self platformObject];
      id v55 = v15;
      int v38 = [v37 retainIdentity:v10 isTrackedOriginal:v34 error:&v55];
      id v18 = v55;

      if (v38)
      {
        if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
          [(NSMutableDictionary *)self->_identitiesToCommit setObject:v10 forKeyedSubscript:v54];
        }
        int v19 = 1;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v39 = __CPLStorageOSLogDomain_202();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = [v11 path];
            *(_DWORD *)v71 = 138412802;
            v72 = v8;
            __int16 v73 = 2112;
            v74 = v40;
            __int16 v75 = 2112;
            id v76 = v18;
            _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_ERROR, "Unable to retain %@ (%@): %@", v71, 0x20u);
          }
        }
        if (a5) {
          *a5 = v18;
        }
        if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
          [(CPLEngineFileStorage *)self->_fileStorage discardUncommittedFileWithIdentity:v10 error:0];
        }
        int v19 = 0;
      }
LABEL_52:
      BOOL v41 = v13 == 0;

      _Block_object_dispose(&buf, 8);
      BOOL v17 = v19 != 0;
      if (v41) {
        BOOL v17 = 0;
      }
      goto LABEL_54;
    }
    if (v9)
    {
      id v20 = [(CPLEngineStorage *)self engineStore];
      char v21 = [v20 engineLibrary];
      uint64_t v22 = [v21 transport];
      id v23 = [v22 fingerprintContext];
      v51 = [v23 fingerprintSchemeForFingerprint:v13];

      if ([v51 canMatchSignatureToFingerprint])
      {
        id v70 = 0;
        __int16 v24 = [(CPLEngineResourceStorage *)self createTempDestinationURLForResource:v8 error:&v70];
        id v15 = v70;
        if (v24)
        {
          v50 = v24;
          id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v69 = v15;
          int v26 = [v25 cplCopyItemAtURL:v11 toURL:v24 error:&v69];
          v49 = v25;
          id v27 = v69;

          if (v26)
          {
            id v68 = v27;
            v48 = [v51 fingerPrintForFileAtURL:v50 error:&v68];
            id v28 = v68;

            if (v48)
            {
              if ([v48 isEqualToString:v13])
              {
                fileStorage = self->_fileStorage;
                v63[0] = MEMORY[0x1E4F143A8];
                v63[1] = 3221225472;
                v63[2] = __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke;
                v63[3] = &unk_1E60AA328;
                v63[4] = self;
                id v64 = v50;
                BOOL v67 = v12;
                id v65 = v10;
                p_long long buf = &buf;
                id v62 = v28;
                int v30 = [(CPLEngineFileStorage *)fileStorage doWrite:v63 error:&v62];
                id v31 = v62;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  v33 = __CPLStorageOSLogDomain_202();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v71 = 138412546;
                    v72 = v8;
                    __int16 v73 = 2112;
                    v74 = v48;
                    _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_ERROR, "Client trying to store %@ but actual finger print is %@", v71, 0x16u);
                  }
                }
                id v31 = +[CPLErrors incorrectParametersErrorForParameter:@"identity.fingerPrint"];

                int v30 = 0;
              }
              id v28 = v31;
            }
            else
            {
              int v30 = 0;
            }

            id v27 = v28;
          }
          else
          {
            int v30 = 0;
          }
          [v49 removeItemAtURL:v50 error:0];

          id v15 = v27;
          __int16 v24 = v50;
        }
        else
        {
          int v30 = 1;
        }

        goto LABEL_37;
      }
    }
    else
    {
      v51 = 0;
    }
    uint64_t v32 = self->_fileStorage;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke_2;
    v57[3] = &unk_1E60AA328;
    v57[4] = self;
    id v58 = v11;
    BOOL v61 = v12;
    id v59 = v10;
    v60 = &buf;
    id v56 = 0;
    int v30 = [(CPLEngineFileStorage *)v32 doWrite:v57 error:&v56];
    id v15 = v56;

LABEL_37:
    if (v30) {
      goto LABEL_38;
    }
    if (!_CPLSilentLogging)
    {
      v43 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = [v11 path];
        *(_DWORD *)v71 = 138412802;
        v72 = v8;
        __int16 v73 = 2112;
        v74 = v44;
        __int16 v75 = 2112;
        id v76 = v15;
        _os_log_impl(&dword_1B4CAC000, v43, OS_LOG_TYPE_ERROR, "Unable to store %@ (%@): %@", v71, 0x20u);
      }
    }
    int v19 = 0;
    id v18 = v15;
LABEL_14:
    if (a5) {
      *a5 = v15;
    }
    goto LABEL_52;
  }
  if (!_CPLSilentLogging)
  {
    id v16 = __CPLStorageOSLogDomain_202();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEBUG, "%@ has no attached resource file. Hopefully we won't need to upload it", (uint8_t *)&buf, 0xCu);
    }
  }
  BOOL v17 = 1;
LABEL_54:

  return v17;
}

uint64_t __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) storeFileAtURL:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) isOriginal:*(unsigned __int8 *)(a1 + 64) moveIfPossible:1 needsCommit:*(void *)(*(void *)(a1 + 56) + 8) + 24 error:a2];
}

uint64_t __77__CPLEngineResourceStorage_storeResourceForUpload_shouldCheckResource_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) storeFileAtURL:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) isOriginal:*(unsigned __int8 *)(a1 + 64) moveIfPossible:0 needsCommit:*(void *)(*(void *)(a1 + 56) + 8) + 24 error:a2];
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  if (![(CPLEngineStorage *)self isEmpty]) {
    return 1;
  }
  BOOL v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 downloadQueue];
  int v7 = [v6 isEmpty];

  if (!v7) {
    return 1;
  }
  return [(CPLEngineResourceStorage *)self resetWithError:a3];
}

- (unint64_t)scopeType
{
  return 0;
}

- (BOOL)openWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineResourceStorage;
  unsigned int v5 = -[CPLEngineStorage openWithError:](&v9, sel_openWithError_);
  if (v5)
  {
    fileStorage = self->_fileStorage;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__CPLEngineResourceStorage_openWithError___block_invoke;
    v8[3] = &unk_1E60AB410;
    v8[4] = self;
    unsigned int v5 = [(CPLEngineFileStorage *)fileStorage doWrite:v8 error:a3];
    if (v5) {
      LOBYTE(v5) = [(CPLEngineResourceStorage *)self _clearAndCreateTempFolderIfNecessaryWithError:a3];
    }
  }
  return v5;
}

uint64_t __42__CPLEngineResourceStorage_openWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 96);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CPLEngineResourceStorage_openWithError___block_invoke_2;
  v5[3] = &unk_1E60A6C10;
  v5[4] = v2;
  return [v3 openWithRecoveryHandler:v5 error:a2];
}

BOOL __42__CPLEngineResourceStorage_openWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 platformObject];
  uint64_t v5 = [v4 retainCountForIdentity:v3];

  return v5 == 0;
}

- (BOOL)_clearAndCreateTempFolderIfNecessaryWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_shouldCreateTempFolder)
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 cplFileExistsAtURL:self->_tempFolderURL])
    {
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLStorageOSLogDomain_202();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v7 = [(NSURL *)self->_tempFolderURL path];
          int v13 = 138412290;
          id v14 = v7;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Cleaning temporary folder at %@", (uint8_t *)&v13, 0xCu);
        }
      }
      [v5 removeItemAtURL:self->_tempFolderURL error:0];
    }
    else if (!_CPLSilentLogging)
    {
      objc_super v9 = __CPLStorageOSLogDomain_202();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        BOOL v10 = [(NSURL *)self->_tempFolderURL path];
        int v13 = 138412290;
        id v14 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Creating temporary folder at %@", (uint8_t *)&v13, 0xCu);
      }
    }
    char v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v11 createDirectoryAtURL:self->_tempFolderURL withIntermediateDirectories:1 attributes:0 error:a3];

    if (v8) {
      self->_shouldCreateTempFolder = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (CPLEngineResourceStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CPLEngineResourceStorage;
  int v7 = [(CPLEngineStorage *)&v29 initWithEngineStore:v6 name:a4];
  if (v7)
  {
    int v8 = [v6 engineLibrary];
    objc_super v9 = [v8 cloudLibraryResourceStorageURL];
    uint64_t v10 = [v9 URLByAppendingPathComponent:@"tmp" isDirectory:1];
    tempFolderURL = v7->_tempFolderURL;
    v7->_tempFolderURL = (NSURL *)v10;

    v7->_shouldCreateTempFolder = 1;
    BOOL v12 = [CPLEngineFileStorage alloc];
    int v13 = [v8 cloudLibraryResourceStorageURL];
    uint64_t v14 = [(CPLEngineFileStorage *)v12 initWithBaseURL:v13];
    fileStorage = v7->_fileStorage;
    v7->_fileStorage = (CPLEngineFileStorage *)v14;

    id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identitiesToCommit = v7->_identitiesToCommit;
    v7->_identitiesToCommit = v16;

    id v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identitiesToDelete = v7->_identitiesToDelete;
    v7->_identitiesToDelete = v18;

    id v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7->_shouldCheckFilesForUpload = [v20 BOOLForKey:@"CPLDontCheckFilesFingerprintForUpload"] ^ 1;

    char v21 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.cpl.prune.stats", v21);
    pruneStatsQueue = v7->_pruneStatsQueue;
    v7->_pruneStatsQueue = (OS_dispatch_queue *)v22;

    __int16 v24 = [[_CPLPruneRequestCounter alloc] initWithTitle:@"Recent prune requests" statusKey:@"pruneRequests"];
    pruneRequests = v7->_pruneRequests;
    v7->_pruneRequests = v24;

    int v26 = [[_CPLPruneRequestCounter alloc] initWithTitle:@"Recent purgeability checks" statusKey:@"purgeabilityChecks"];
    purgeabilityCheckRequests = v7->_purgeabilityCheckRequests;
    v7->_purgeabilityCheckRequests = v26;
  }
  return v7;
}

@end