@interface CPLEngineRecordComputeStatePushQueue
- (BOOL)addComputeState:(id)a3 error:(id *)a4;
- (BOOL)createIncomingDownloadFolderIfNecessaryWithError:(id *)a3;
- (BOOL)deleteIncomingDownloadFolderWithError:(id *)a3;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)deleteTempUploadFolderWithError:(id *)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performMaintenanceWithError:(id *)a3;
- (BOOL)releaseFileURL:(id)a3 forComputeState:(id)a4 error:(id *)a5;
- (BOOL)removeComputeState:(id)a3 error:(id *)a4;
- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 error:(id *)a6;
- (BOOL)updateFileURLForComputeState:(id)a3 error:(id *)a4;
- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5;
- (CPLEngineFileStorage)fileStorage;
- (CPLEngineRecordComputeStatePushQueue)initWithEngineStore:(id)a3 name:(id)a4;
- (NSDate)throttlingDate;
- (NSURL)incomingDownloadFolderURL;
- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5;
- (id)createNewTempDownloadFolderWithError:(id *)a3;
- (id)createTempUploadFolderWithError:(id *)a3;
- (id)retainFileURLForComputeState:(id)a3 error:(id *)a4;
- (id)status;
- (id)statusDictionary;
- (unint64_t)countOfComputeStates;
- (unint64_t)fileSizeForComputeStatePayloadFileURL:(id)a3 error:(id *)a4;
- (unint64_t)scopeType;
- (void)noteComputeStateDownloadRequest;
- (void)setThrottlingDate:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineRecordComputeStatePushQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlingDate, 0);
  objc_storeStrong((id *)&self->_fileStorage, 0);
  objc_storeStrong((id *)&self->_incomingDownloadFolderURL, 0);
  objc_storeStrong((id *)&self->_lastComputeStateDownloadRequestDate, 0);
  objc_storeStrong((id *)&self->_outgoingUploadFolderURL, 0);
  objc_storeStrong((id *)&self->_incomingDownloadFolderCreationDate, 0);
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_filesToCommit, 0);
}

- (void)setThrottlingDate:(id)a3
{
}

- (NSDate)throttlingDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (CPLEngineFileStorage)fileStorage
{
  return self->_fileStorage;
}

- (id)statusDictionary
{
  v13.receiver = self;
  v13.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  v3 = [(CPLEngineStorage *)&v13 statusDictionary];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v7 = v6;

  v8 = [(CPLEngineRecordComputeStatePushQueue *)self throttlingDate];
  v9 = v8;
  if (v8)
  {
    v10 = NSNumber;
    [v8 timeIntervalSinceReferenceDate];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v7 setObject:v11 forKeyedSubscript:@"throttlingDate"];
  }
  return v7;
}

- (id)status
{
  v27.receiver = self;
  v27.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  v3 = [(CPLEngineStorage *)&v27 status];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(CPLEngineRecordComputeStatePushQueue *)self throttlingDate];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  if (v5)
  {
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;
    uint64_t v9 = +[CPLDateFormatter stringFromDateAgo:v5 now:v6];
    v10 = (void *)v9;
    if (v8 <= 0.0) {
      v11 = @"\nUploads have been throttled until %@ and will resume during the next sync session";
    }
    else {
      v11 = @"\nUploads will resume %@";
    }
    objc_msgSend(v4, "appendFormat:", v11, v9);
  }
  incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
  if (incomingDownloadFolderCreationDate)
  {
    objc_super v13 = +[CPLDateFormatter stringFromDateAgo:incomingDownloadFolderCreationDate now:v6];
    [v4 appendFormat:@"\nIncoming download folder creation: %@", v13];
  }
  p_lastComputeStateDownloadRequestDateLock = &self->_lastComputeStateDownloadRequestDateLock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v22 = __46__CPLEngineRecordComputeStatePushQueue_status__block_invoke;
  v23 = &unk_1E60A6660;
  v24 = self;
  id v15 = v4;
  id v25 = v15;
  id v16 = v6;
  id v26 = v16;
  v17 = v21;
  os_unfair_lock_lock(p_lastComputeStateDownloadRequestDateLock);
  v22(v17);
  os_unfair_lock_unlock(p_lastComputeStateDownloadRequestDateLock);

  v18 = v26;
  id v19 = v15;

  return v19;
}

void __46__CPLEngineRecordComputeStatePushQueue_status__block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[4] + 80);
  if (v1)
  {
    v2 = (void *)a1[5];
    id v3 = +[CPLDateFormatter stringFromDateAgo:v1 now:a1[6]];
    [v2 appendFormat:@"\nLast download request: %@", v3];
  }
}

- (unint64_t)fileSizeForComputeStatePayloadFileURL:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v15 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C5F8];
  id v14 = 0;
  int v7 = [v5 getResourceValue:&v15 forKey:v6 error:&v14];
  id v8 = v15;
  id v9 = v14;
  v10 = v9;
  if (v7)
  {
    unint64_t v11 = [v8 unsignedIntegerValue];
  }
  else if (a4)
  {
    unint64_t v11 = 0;
    *a4 = v9;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v12 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Failed to determine filesize for compute state payload file at url: %@. Error: %@", buf, 0x16u);
      }
    }
    unint64_t v11 = 0;
  }

  return v11;
}

- (NSURL)incomingDownloadFolderURL
{
  return self->_incomingDownloadFolderURL;
}

- (void)noteComputeStateDownloadRequest
{
  p_lastComputeStateDownloadRequestDateLock = &self->_lastComputeStateDownloadRequestDateLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v5 = __71__CPLEngineRecordComputeStatePushQueue_noteComputeStateDownloadRequest__block_invoke;
  uint64_t v6 = &unk_1E60A5DD8;
  int v7 = self;
  id v3 = v4;
  os_unfair_lock_lock(p_lastComputeStateDownloadRequestDateLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_lastComputeStateDownloadRequestDateLock);
}

uint64_t __71__CPLEngineRecordComputeStatePushQueue_noteComputeStateDownloadRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)deleteTempUploadFolderWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  outgoingUploadFolderURL = self->_outgoingUploadFolderURL;
  id v12 = 0;
  char v7 = [v5 removeItemAtURL:outgoingUploadFolderURL error:&v12];
  id v8 = v12;

  if (v7)
  {
    char v9 = 1;
  }
  else
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v9 = [v10 cplIsFileDoesNotExistError:v8];

    if (a3 && (v9 & 1) == 0)
    {
      char v9 = 0;
      *a3 = v8;
    }
  }

  return v9;
}

- (id)createTempUploadFolderWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  outgoingUploadFolderURL = self->_outgoingUploadFolderURL;
  id v13 = 0;
  char v7 = [v5 createDirectoryAtURL:outgoingUploadFolderURL withIntermediateDirectories:0 attributes:0 error:&v13];
  id v8 = v13;

  if ((v7 & 1) != 0
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        char v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 cplIsFileExistsError:v8],
        v9,
        v10))
  {
    unint64_t v11 = self->_outgoingUploadFolderURL;
  }
  else
  {
    unint64_t v11 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v11;
}

- (BOOL)createIncomingDownloadFolderIfNecessaryWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLStorageOSLogDomain_19384();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(NSURL *)self->_incomingDownloadFolderURL path];
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Creating incoming download folder at %@", buf, 0xCu);
    }
  }
  char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  incomingDownloadFolderURL = self->_incomingDownloadFolderURL;
  id v17 = 0;
  char v9 = [v7 createDirectoryAtURL:incomingDownloadFolderURL withIntermediateDirectories:0 attributes:0 error:&v17];
  id v10 = v17;
  if ((v9 & 1) != 0 || [v7 cplIsFileExistsError:v10])
  {
    unint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
    self->_incomingDownloadFolderCreationDate = v11;

    BOOL v13 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(NSURL *)self->_incomingDownloadFolderURL path];
        *(_DWORD *)buf = 138412546;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v10;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create incoming download folder at %@: %@", buf, 0x16u);
      }
    }
    BOOL v13 = 0;
    if (a3) {
      *a3 = v10;
    }
  }

  return v13;
}

- (id)createNewTempDownloadFolderWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  BOOL v5 = [(CPLEngineRecordComputeStatePushQueue *)self createIncomingDownloadFolderIfNecessaryWithError:&v18];
  id v6 = v18;
  char v7 = v6;
  if (v5)
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", self->_tempFolderIndex);
    id v9 = [(NSURL *)self->_incomingDownloadFolderURL URLByAppendingPathComponent:v8 isDirectory:1];
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = v7;
    int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:0 error:&v17];
    id v12 = v17;

    ++self->_tempFolderIndex;
    if (v11)
    {
      id v9 = v9;
      BOOL v13 = v9;
      goto LABEL_16;
    }
    if (v9) {
      BOOL v14 = _CPLSilentLogging == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      id v15 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "Failed to create temporary download folder at %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v9 = 0;
    id v12 = v6;
  }
  if (a3)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a3 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_16:

  return v13;
}

- (BOOL)deleteIncomingDownloadFolderWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLStorageOSLogDomain_19384();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      char v7 = [(NSURL *)self->_incomingDownloadFolderURL path];
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Deleting incoming download folder at %@", buf, 0xCu);
    }
  }
  incomingDownloadFolderURL = self->_incomingDownloadFolderURL;
  id v16 = 0;
  char v9 = [v5 removeItemAtURL:incomingDownloadFolderURL error:&v16];
  id v10 = v16;
  if ((v9 & 1) != 0 || [v5 cplIsFileDoesNotExistError:v10])
  {
    incomingDownloadFolderCreationDate = self->_incomingDownloadFolderCreationDate;
    self->_incomingDownloadFolderCreationDate = 0;

    BOOL v12 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v14 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(NSURL *)self->_incomingDownloadFolderURL path];
        *(_DWORD *)buf = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete temporary folder at %@: %@", buf, 0x16u);
      }
    }
    BOOL v12 = 0;
    if (a3) {
      *a3 = v10;
    }
  }

  return v12;
}

- (void)writeTransactionDidSucceed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CPLEngineFileStorage *)self->_fileStorage writeTransactionDidSucceed];
  if ([(NSMutableArray *)self->_filesToDelete count] || [(NSMutableArray *)self->_filesToCommit count])
  {
    fileStorage = self->_fileStorage;
    id v10 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke;
    v11[3] = &unk_1E60AB410;
    v11[4] = self;
    BOOL v4 = [(CPLEngineFileStorage *)fileStorage doWrite:v11 error:&v10];
    id v5 = v10;
    if (!v4 && !_CPLSilentLogging)
    {
      id v6 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        filesToCommit = self->_filesToCommit;
        filesToDelete = self->_filesToDelete;
        *(_DWORD *)buf = 138412802;
        BOOL v13 = filesToCommit;
        __int16 v14 = 2112;
        id v15 = filesToDelete;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Unable to commit %@ or delete %@ to file storage: %@", buf, 0x20u);
      }
    }
    [(NSMutableArray *)self->_filesToCommit removeAllObjects];
    [(NSMutableArray *)self->_filesToDelete removeAllObjects];
  }
  [(CPLEngineFileStorage *)self->_fileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:0];
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  [(CPLEngineStorage *)&v9 writeTransactionDidSucceed];
}

BOOL __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__19405;
  id v17 = __Block_byref_object_dispose__19406;
  id v18 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_2;
  v12[3] = &unk_1E60AA6B0;
  v12[4] = v4;
  v12[5] = &v19;
  v12[6] = &v13;
  [v5 enumerateObjectsUsingBlock:v12];
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(void **)(v6 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_3;
  v11[3] = &unk_1E60AA6B0;
  v11[4] = v6;
  void v11[5] = &v19;
  v11[6] = &v13;
  [v7 enumerateObjectsUsingBlock:v11];
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

void __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1[4] + 104);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  int v5 = [v3 commitFileWithIdentifier:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (v5) {
    BOOL v7 = *(unsigned char *)(v6 + 24) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
}

void __66__CPLEngineRecordComputeStatePushQueue_writeTransactionDidSucceed__block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1[4] + 104);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  int v5 = [v3 deleteFileWithIdentifier:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (v5) {
    BOOL v7 = *(unsigned char *)(v6 + 24) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
}

- (void)writeTransactionDidFail
{
  [(CPLEngineFileStorage *)self->_fileStorage writeTransactionDidFail];
  if ([(NSMutableArray *)self->_filesToCommit count])
  {
    fileStorage = self->_fileStorage;
    id v6 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke;
    v7[3] = &unk_1E60AB410;
    v7[4] = self;
    [(CPLEngineFileStorage *)fileStorage doWrite:v7 error:&v6];
    id v4 = v6;
    [(NSMutableArray *)self->_filesToCommit removeAllObjects];
  }
  [(CPLEngineFileStorage *)self->_fileStorage setTrackAllStoresAndDeletesUntilEndOfTransaction:0];
  [(NSMutableArray *)self->_filesToDelete removeAllObjects];
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  [(CPLEngineStorage *)&v5 writeTransactionDidFail];
}

BOOL __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__19405;
  id v17 = __Block_byref_object_dispose__19406;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke_2;
  v8[3] = &unk_1E60AA6B0;
  v8[4] = v3;
  v8[5] = &v9;
  v8[6] = &v13;
  [v4 enumerateObjectsUsingBlock:v8];
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

void __63__CPLEngineRecordComputeStatePushQueue_writeTransactionDidFail__block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  BOOL v7 = *(void **)(a1[4] + 104);
  uint64_t v8 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v8 + 40);
  char v9 = [v7 discardUncommittedFileWithIdentifier:v6 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLStorageOSLogDomain_19384();
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

- (BOOL)releaseFileURL:(id)a3 forComputeState:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  fileStorage = self->_fileStorage;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__CPLEngineRecordComputeStatePushQueue_releaseFileURL_forComputeState_error___block_invoke;
  v18[3] = &unk_1E60AB750;
  v18[4] = self;
  id v11 = v8;
  id v19 = v11;
  id v17 = 0;
  BOOL v12 = [(CPLEngineFileStorage *)fileStorage doWrite:v18 error:&v17];
  id v13 = v17;
  if (!v12)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLStorageOSLogDomain_19384();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [v11 path];
        *(_DWORD *)buf = 138412802;
        id v21 = v9;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Unable to release %@ / %@: %@", buf, 0x20u);
      }
    }
    if (a5) {
      *a5 = v13;
    }
  }

  return v12;
}

uint64_t __77__CPLEngineRecordComputeStatePushQueue_releaseFileURL_forComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) releaseFileURL:*(void *)(a1 + 40) error:a2];
}

- (id)retainFileURLForComputeState:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 fileStorageIdentifier];

  if (v7)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__19405;
    __int16 v24 = __Block_byref_object_dispose__19406;
    id v25 = 0;
    fileStorage = self->_fileStorage;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__CPLEngineRecordComputeStatePushQueue_retainFileURLForComputeState_error___block_invoke;
    v17[3] = &unk_1E60AB850;
    id v19 = &v20;
    v17[4] = self;
    id v9 = v6;
    id v18 = v9;
    id v16 = 0;
    LOBYTE(fileStorage) = [(CPLEngineFileStorage *)fileStorage doWrite:v17 error:&v16];
    id v10 = v16;
    if (fileStorage)
    {
      if (!_CPLSilentLogging)
      {
        id v11 = __CPLStorageOSLogDomain_19384();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          BOOL v12 = [(id)v21[5] path];
          *(_DWORD *)buf = 138412546;
          id v27 = v9;
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
        uint64_t v14 = __CPLStorageOSLogDomain_19384();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v27 = v9;
          __int16 v28 = 2112;
          id v29 = v10;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Unable to retain URL for %@: %@", buf, 0x16u);
        }
      }
      if (a4) {
        *a4 = v10;
      }
    }
    id v13 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else if (a4)
  {
    +[CPLErrors incorrectParametersErrorForParameter:@"fileStorageIdentifier"];
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

BOOL __75__CPLEngineRecordComputeStatePushQueue_retainFileURLForComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 104);
  int v5 = [*(id *)(a1 + 40) fileStorageIdentifier];
  uint64_t v6 = [v4 retainFileURLForIdentifier:v5 error:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (unint64_t)countOfComputeStates
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  unint64_t v3 = [v2 countOfComputeStates];

  return v3;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = [(CPLEngineStorage *)self platformObject];
  id v15 = 0;
  int v12 = [v11 deleteRecordsForScopeIndex:a3 discardedFileStorageIdentifiers:&v15 maxCount:a4 deletedCount:a5 error:a6];
  id v13 = v15;

  if (v12 && [v13 count]) {
    [(NSMutableArray *)self->_filesToDelete addObjectsFromArray:v13];
  }

  return v12;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasChangesInScopeWithIdentifier:v4];

  return v6;
}

- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(CPLEngineStorage *)self platformObject];
  id v10 = [v9 computeStatesToUploadWithScopeIdentifier:v8 localState:a4 maximumCount:a5];

  return v10;
}

- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CPLEngineStorage *)self platformObject];
  id v17 = 0;
  int v14 = [v13 removeComputeStateWithLocalScopedIdentifier:v12 version:v11 adjustmentFingerprint:v10 discardedFileStorageIdentifier:&v17 error:a6];

  id v15 = v17;
  if (v14 && v15) {
    [(NSMutableArray *)self->_filesToDelete addObject:v15];
  }

  return v14;
}

- (BOOL)removeComputeState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 itemScopedIdentifier];
  id v8 = [v6 version];
  id v9 = [v6 adjustmentFingerprint];

  LOBYTE(a4) = [(CPLEngineRecordComputeStatePushQueue *)self removeComputeStateWithLocalScopedIdentifier:v7 version:v8 adjustmentFingerprint:v9 error:a4];
  return (char)a4;
}

- (BOOL)updateFileURLForComputeState:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 fileURL];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = [v8 UUIDString];

    [v6 setFileStorageIdentifier:v9];
    char v33 = 0;
    id v10 = [(CPLEngineStorage *)self platformObject];
    id v32 = 0;
    int v11 = [v10 updateFileURLForComputeState:v6 discardedFileStorageIdentifier:&v32 hasUpdated:&v33 error:a4];
    id v12 = v32;

    if (v12) {
      int v13 = v11;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1) {
      [(NSMutableArray *)self->_filesToDelete addObject:v12];
    }
    if (v33) {
      int v14 = v11;
    }
    else {
      int v14 = 0;
    }
    if (v14 == 1)
    {
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      fileStorage = self->_fileStorage;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __75__CPLEngineRecordComputeStatePushQueue_updateFileURLForComputeState_error___block_invoke;
      uint64_t v23 = &unk_1E60AB638;
      __int16 v24 = self;
      id v16 = v6;
      id v25 = v16;
      id v17 = v9;
      id v26 = v17;
      id v27 = &v28;
      int v11 = [(CPLEngineFileStorage *)fileStorage doWrite:&v20 error:a4];
      if (v11 && *((unsigned char *)v29 + 24))
      {
        if (!_CPLSilentLogging)
        {
          id v18 = __CPLStorageOSLogDomain_19384();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v16;
            _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Storing updated file URL for %@", buf, 0xCu);
          }
        }
        -[NSMutableArray addObject:](self->_filesToCommit, "addObject:", v17, v20, v21, v22, v23, v24, v25);
      }

      _Block_object_dispose(&v28, 8);
    }
  }
  else if (a4)
  {
    +[CPLErrors incorrectParametersErrorForParameter:@"fileURL"];
    LOBYTE(v11) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

uint64_t __75__CPLEngineRecordComputeStatePushQueue_updateFileURLForComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 104);
  int v5 = [*(id *)(a1 + 40) fileURL];
  uint64_t v6 = [v4 storeFileAtURL:v5 identifier:*(void *)(a1 + 48) moveIfPossible:0 needsCommit:*(void *)(*(void *)(a1 + 56) + 8) + 24 error:a2];

  return v6;
}

- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 updateLocalStateForComputeState:v8 newLocalState:a4 error:a5];

  return (char)a5;
}

- (BOOL)addComputeState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v7 = [v6 fileURL];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = [v8 UUIDString];

    [v6 setFileStorageIdentifier:v9];
    fileStorage = self->_fileStorage;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__CPLEngineRecordComputeStatePushQueue_addComputeState_error___block_invoke;
    v18[3] = &unk_1E60AB638;
    v18[4] = self;
    id v19 = v6;
    id v11 = v9;
    id v20 = v11;
    uint64_t v21 = &v22;
    if (![(CPLEngineFileStorage *)fileStorage doWrite:v18 error:a4])
    {

      id v14 = 0;
      LOBYTE(v13) = 0;
      goto LABEL_12;
    }
    if (*((unsigned char *)v23 + 24)) {
      [(NSMutableArray *)self->_filesToCommit addObject:v11];
    }
  }
  id v12 = [(CPLEngineStorage *)self platformObject];
  id v17 = 0;
  int v13 = [v12 addComputeState:v6 discardedFileStorageIdentifier:&v17 error:a4];
  id v14 = v17;

  if (v14) {
    int v15 = v13;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    [(NSMutableArray *)self->_filesToDelete addObject:v14];
    LOBYTE(v13) = 1;
  }
LABEL_12:

  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __62__CPLEngineRecordComputeStatePushQueue_addComputeState_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 104);
  int v5 = [*(id *)(a1 + 40) fileURL];
  uint64_t v6 = [v4 storeFileAtURL:v5 identifier:*(void *)(a1 + 48) moveIfPossible:0 needsCommit:*(void *)(*(void *)(a1 + 56) + 8) + 24 error:a2];

  return v6;
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  if ([(CPLEngineStorage *)self isEmpty])
  {
    fileStorage = self->_fileStorage;
    id v13 = 0;
    BOOL v6 = [(CPLEngineFileStorage *)fileStorage resetWithError:&v13];
    id v7 = v13;
    id v8 = v7;
    if (!v6)
    {
      if (a3)
      {
        id v8 = v7;
        BOOL v9 = 0;
        *a3 = v8;
      }
      else
      {
        BOOL v9 = 0;
      }
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = 0;
  }
  lastComputeStateDownloadRequestDate = self->_lastComputeStateDownloadRequestDate;
  if (lastComputeStateDownloadRequestDate)
  {
    [(NSDate *)lastComputeStateDownloadRequestDate timeIntervalSinceNow];
    if (v11 < -3600.0) {
      [(CPLEngineRecordComputeStatePushQueue *)self deleteIncomingDownloadFolderWithError:0];
    }
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)openWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  if (-[CPLEngineStorage openWithError:](&v9, sel_openWithError_))
  {
    fileStorage = self->_fileStorage;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke;
    v8[3] = &unk_1E60AB410;
    v8[4] = self;
    BOOL v6 = [(CPLEngineFileStorage *)fileStorage doWrite:v8 error:a3];
    if (v6)
    {
      [(CPLEngineRecordComputeStatePushQueue *)self deleteIncomingDownloadFolderWithError:0];
      [(CPLEngineRecordComputeStatePushQueue *)self deleteTempUploadFolderWithError:0];
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

uint64_t __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 104);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke_2;
  v5[3] = &unk_1E60AA688;
  v5[4] = v2;
  return [v3 openWithFileRecoveryHandler:v5 error:a2];
}

uint64_t __54__CPLEngineRecordComputeStatePushQueue_openWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 platformObject];
  int v5 = [v4 hasSomeComputeStateWithFileStorageIdentifier:v3];

  return v5 ^ 1u;
}

- (CPLEngineRecordComputeStatePushQueue)initWithEngineStore:(id)a3 name:(id)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineRecordComputeStatePushQueue;
  id v7 = [(CPLEngineStorage *)&v23 initWithEngineStore:v6 name:a4];
  if (v7)
  {
    id v8 = [v6 engineLibrary];
    objc_super v9 = [v8 clientLibraryBaseURL];
    id v10 = [v9 URLByAppendingPathComponent:@"outgoingRecordComputeStates" isDirectory:1];

    double v11 = [[CPLEngineFileStorage alloc] initWithBaseURL:v10];
    fileStorage = v7->_fileStorage;
    v7->_fileStorage = v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    filesToCommit = v7->_filesToCommit;
    v7->_filesToCommit = v13;

    int v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    filesToDelete = v7->_filesToDelete;
    v7->_filesToDelete = v15;

    id v17 = [v8 clientLibraryBaseURL];
    uint64_t v18 = [v17 URLByAppendingPathComponent:@"incomingRecordComputeStates" isDirectory:1];
    incomingDownloadFolderURL = v7->_incomingDownloadFolderURL;
    v7->_incomingDownloadFolderURL = (NSURL *)v18;

    uint64_t v20 = [v17 URLByAppendingPathComponent:@"outgoingRecordComputeStatesFromClient" isDirectory:1];
    outgoingUploadFolderURL = v7->_outgoingUploadFolderURL;
    v7->_outgoingUploadFolderURL = (NSURL *)v20;

    v7->_lastComputeStateDownloadRequestDateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

@end