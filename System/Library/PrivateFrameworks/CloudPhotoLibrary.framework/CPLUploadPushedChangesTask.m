@interface CPLUploadPushedChangesTask
+ (BOOL)disableOverQuotaRule;
+ (void)resetDisabledOverQuotaRule;
+ (void)setDisableOverQuotaRule:(BOOL)a3;
- (BOOL)_canUseOverQuotaRule;
- (BOOL)_copyResourceChangeFromChange:(id)a3 toChange:(id)a4 fingerprintScheme:(id)a5 error:(id *)a6;
- (BOOL)_discardUploadedExtractedBatch:(id)a3 error:(id *)a4;
- (BOOL)_markUploadedTasksDidFinishWithError:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)_reenqueueExtractedBatchWithRejectedRecords:(id)a3 extractedBatch:(id)a4 error:(id *)a5;
- (BOOL)_shouldNotTrustCloudCacheAfterError:(id)a3;
- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5;
- (BOOL)_willNeedToAccessScopeWithIdentifier:(id)a3 primaryScope:(BOOL)a4 error:(id *)a5;
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (BOOL)didUseOverQuotaStrategy;
- (BOOL)highPriority;
- (BOOL)isCloudRecordWithScopedIdentifierShared:(id)a3;
- (BOOL)isResourceDynamic:(id)a3;
- (BOOL)willNeedToAccessRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (CPLEnginePushRepository)pushRepository;
- (CPLEngineScope)sharedScope;
- (CPLEngineTransportGroup)storedTransportGroup;
- (CPLTransportScopeMapping)transportScopeMapping;
- (CPLUploadPushedChangesTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7 storedTransportGroup:(id)a8 sharedScope:(id)a9 transportScopeMapping:(id)a10 ruleGroup:(int64_t)a11 highPriority:(BOOL)a12 maxBatchSize:(unint64_t)a13 pushRepositoryPriority:(unint64_t)a14 pushRepository:(id)a15;
- (id)availableResourceTypesToUploadForChange:(id)a3;
- (id)knownCloudRecordWithScopedIdentifier:(id)a3;
- (id)taskIdentifier;
- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 error:(id *)a5;
- (int64_t)ruleGroup;
- (unint64_t)maxBatchSize;
- (unint64_t)pushRepositoryPriority;
- (void)_checkForRecordExistence;
- (void)_checkPrioritiesWithFetchCache:(id)a3;
- (void)_clearUploadBatch;
- (void)_deleteGeneratedResourcesAfterError:(id)a3;
- (void)_didFinishTaskWithKey:(id)a3 error:(BOOL)a4 cancelled:(BOOL)a5;
- (void)_didStartTaskWithKey:(id)a3 recordCount:(unint64_t)a4;
- (void)_excludeScopeFromMingling;
- (void)_extractAndUploadOneBatch;
- (void)_extractBatchWithTransaction:(id)a3 andStore:(id)a4;
- (void)_generateDerivativesForNextRecord:(id)a3 usingDerivativesCache:(id)a4 fetchCache:(id)a5 fingerprintContext:(id)a6;
- (void)_generateNeededDerivativesWithFetchCache:(id)a3 fingerprintContext:(id)a4;
- (void)_noteSuccessfulUpdateInTransaction:(id)a3;
- (void)_popNextBatchAndContinue;
- (void)_prepareTransportGroupForOneBatch;
- (void)_prepareUploadBatch;
- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3;
- (void)_uploadBatchWithFetchCache:(id)a3;
- (void)_uploadTaskDidFinishWithError:(id)a3;
- (void)cancel;
- (void)cancel:(BOOL)a3;
- (void)launch;
@end

@implementation CPLUploadPushedChangesTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_storedTransportGroup, 0);
  objc_storeStrong((id *)&self->_taskStartDate, 0);
  objc_storeStrong((id *)&self->_currentTaskKey, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_acquireReschedulerTask, 0);
  objc_storeStrong((id *)&self->_fetchRecordsTask, 0);
  objc_storeStrong((id *)&self->_invalidTransportScopes, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_preparedUploadResourceTasks, 0);
  objc_storeStrong((id *)&self->_transactionDuringItemsPreparation, 0);
  objc_storeStrong((id *)&self->_checkItems, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_cloudScopedIdentifiersToUploadResourceTaskErrors, 0);
  objc_storeStrong((id *)&self->_uploadResourceTasks, 0);
  objc_storeStrong((id *)&self->_derivativesFilter, 0);
  objc_storeStrong((id *)&self->_batchToCommit, 0);
  objc_storeStrong((id *)&self->_diffedBatch, 0);
  objc_storeStrong((id *)&self->_currentStrategy, 0);
  objc_storeStrong((id *)&self->_batchStorage, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (unint64_t)pushRepositoryPriority
{
  return self->_pushRepositoryPriority;
}

- (unint64_t)maxBatchSize
{
  return self->_maxBatchSize;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (int64_t)ruleGroup
{
  return self->_ruleGroup;
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLEngineTransportGroup)storedTransportGroup
{
  return self->_storedTransportGroup;
}

- (BOOL)isCloudRecordWithScopedIdentifierShared:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v5];
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      v10 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Trying to know shared state for %@ but it was not requested to access", buf, 0xCu);
      }
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    [v11 handleFailureInMethod:a2, self, v12, 1581, @"Trying to know shared state for %@ but it was not requested to access", v5 object file lineNumber description];

    abort();
  }
  v7 = v6;
  char v8 = [v6 shouldUploadToOtherRecord];

  return v8;
}

- (id)knownCloudRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineScopedTask *)self store];
  v6 = [v5 cloudCache];
  v7 = [v6 recordWithScopedIdentifier:v4 isFinal:0];

  return v7;
}

- (BOOL)isResourceDynamic:(id)a3
{
  return [(CPLEngineTransport *)self->_transport isResourceDynamic:a3];
}

- (id)willUploadCloudResource:(id)a3 localResource:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      v24 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v31 = v25;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);
      }
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    v28 = NSStringFromSelector(a2);
    [v26 handleFailureInMethod:a2, self, v27, 1541, @"%@ should only be called during initial batch preparation", v28 object file lineNumber description];

    abort();
  }
  v11 = v10;
  v12 = [(CPLEngineScopedTask *)self store];
  v13 = [v12 resourceStorage];
  id v14 = [v13 retainFileURLForResource:v11 error:a5];

  if (v14)
  {
    if (!self->_preparedUploadResourceTasks)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      preparedUploadResourceTasks = self->_preparedUploadResourceTasks;
      self->_preparedUploadResourceTasks = v15;

      transactionDuringItemsPreparation = self->_transactionDuringItemsPreparation;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __74__CPLUploadPushedChangesTask_willUploadCloudResource_localResource_error___block_invoke;
      v29[3] = &unk_1E60AB8A0;
      v29[4] = self;
      v18 = transactionDuringItemsPreparation;
      [(CPLEngineStoreTransaction *)v18 addCleanupBlock:v29];
    }
    v19 = [CPLEngineResourceUploadTask alloc];
    v20 = [MEMORY[0x1E4F29128] UUID];
    v21 = [v20 UUIDString];
    v22 = [(CPLResourceTransferTask *)v19 initWithResource:v11 taskIdentifier:v21];

    [(CPLEngineResourceUploadTask *)v22 setCloudResource:v9];
    [(NSMutableArray *)self->_preparedUploadResourceTasks addObject:v22];
  }
  return v14;
}

void __74__CPLUploadPushedChangesTask_willUploadCloudResource_localResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    v3 = [*(id *)(a1 + 32) engineLibrary];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(*(void *)(a1 + 32) + 240));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 192);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "notifyAttachedObjectsUploadTaskDidStart:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 240);
  *(void *)(v9 + 240) = 0;
}

- (id)availableResourceTypesToUploadForChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      long long v11 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);
      }
    }
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    uint64_t v15 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, v14, 1536, @"%@ should only be called during initial batch preparation", v15 object file lineNumber description];

    abort();
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(CPLEngineScopedTask *)self store];
  char v8 = [v7 outgoingResources];
  uint64_t v9 = [v8 resourceTypesToUploadForChange:v6];

  return v9;
}

- (BOOL)willNeedToAccessRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_transactionDuringItemsPreparation)
  {
    if (!_CPLSilentLogging)
    {
      v17 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "%@ should only be called during initial batch preparation", buf, 0xCu);
      }
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    v21 = NSStringFromSelector(a2);
    [v19 handleFailureInMethod:a2, self, v20, 1519, @"%@ should only be called during initial batch preparation", v21 object file lineNumber description];

    abort();
  }
  char v8 = v7;
  uint64_t v9 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v7];

  if (!v9)
  {
    id v10 = [v8 scopeIdentifier];
    BOOL v11 = [(CPLUploadPushedChangesTask *)self _willNeedToAccessScopeWithIdentifier:v10 primaryScope:1 error:a4];

    if (!v11)
    {
      BOOL v15 = 0;
      goto LABEL_6;
    }
    long long v12 = [(CPLEngineScopedTask *)self store];
    long long v13 = [v12 cloudCache];
    long long v14 = [v13 targetForRecordWithCloudScopedIdentifier:v8];

    [(CPLRecordTargetMapping *)self->_targetMapping setTarget:v14 forRecordWithScopedIdentifier:v8];
  }
  BOOL v15 = 1;
LABEL_6:

  return v15;
}

- (BOOL)_willNeedToAccessScopeWithIdentifier:(id)a3 primaryScope:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![(CPLTransportScopeMapping *)self->_transportScopeMapping hasConcreteScopeForScopeWithIdentifier:v9])
  {
    id v11 = [(NSMutableDictionary *)self->_invalidTransportScopes objectForKeyedSubscript:v9];
    if (v11)
    {
      if (a5)
      {
LABEL_5:
        id v12 = v11;
        BOOL v10 = 0;
        *a5 = v12;
LABEL_49:

        goto LABEL_50;
      }
LABEL_42:
      BOOL v10 = 0;
      id v12 = v11;
      goto LABEL_49;
    }
    long long v13 = [(CPLEngineScopeStorage *)self->_scopes scopeWithIdentifier:v9];
    SEL v36 = a2;
    if (!v13)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v18 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v39 = v9;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Additional requested scope %{public}@ is unknown", buf, 0xCu);
        }
      }
      id v11 = +[CPLErrors cplErrorWithCode:2001 description:@"unknown scope"];
      id v12 = 0;
      goto LABEL_38;
    }
    [(CPLEngineScopeStorage *)self->_scopes flagsForScope:v13];
    v15 = long long v14 = v13;
    if ([v15 valueForFlag:262164])
    {
      uint64_t v16 = v14;
      if (!_CPLSilentLogging)
      {
        v17 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v39 = v9;
          __int16 v40 = 2112;
          v41 = v15;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Additional requested scope %{public}@ is invalid scope: flags are %@", buf, 0x16u);
        }
      }
      id v11 = +[CPLErrors cplErrorWithCode:38, @"invalid flags for additional scope: %@", v15 description];

      id v12 = 0;
      long long v13 = v16;
      goto LABEL_38;
    }
    v35 = v14;
    v19 = [(CPLEngineScopeStorage *)self->_scopes transportScopeForScope:v14];
    id v12 = v19;
    if (v19)
    {
      id v20 = v19;
      id v11 = 0;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v39 = v9;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Transport scope for additional requested scope %{public}@ has not yet been determined", buf, 0xCu);
        }
      }
      id v11 = +[CPLErrors cplErrorWithCode:32 description:@"missing transport scope"];
    }

    if (v6)
    {
      long long v13 = v35;
      if (v11 || !v12) {
        goto LABEL_38;
      }
      if (![(CPLTransportScopeMapping *)self->_transportScopeMapping shouldSetSharedScopeIdentifierForScopeWithIdentifier:v9])
      {

        goto LABEL_44;
      }
      v22 = [(CPLEngineScopeStorage *)self->_scopes sharingScopeForScope:v35];
      v23 = v22;
      if (v22)
      {
        uint64_t v24 = [v22 scopeIdentifier];
        id v37 = 0;
        BOOL v25 = [(CPLUploadPushedChangesTask *)self _willNeedToAccessScopeWithIdentifier:v24 primaryScope:0 error:&v37];
        id v11 = v37;
        if (v25)
        {
          [(CPLTransportScopeMapping *)self->_transportScopeMapping setSharedScopeIdentifier:v24 forScopeWithIdentifier:v9];
        }
        else
        {

          id v12 = 0;
        }
      }
      else
      {
        [(CPLTransportScopeMapping *)self->_transportScopeMapping setSharedScopeIdentifier:0 forScopeWithIdentifier:v9];
        id v11 = 0;
      }
    }
    long long v13 = v35;
LABEL_38:
    if (v11)
    {
      invalidTransportScopes = self->_invalidTransportScopes;
      if (!invalidTransportScopes)
      {
        v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v28 = self->_invalidTransportScopes;
        self->_invalidTransportScopes = v27;

        invalidTransportScopes = self->_invalidTransportScopes;
      }
      [(NSMutableDictionary *)invalidTransportScopes setObject:v11 forKeyedSubscript:v9];

      if (a5) {
        goto LABEL_5;
      }
      goto LABEL_42;
    }

    if (!v12)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v32 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v9;
          _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "No error but no transport scope available for %@", buf, 0xCu);
        }
      }
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
      [v33 handleFailureInMethod:v36, self, v34, 1510, @"No error but no transport scope available for %@", v9 object file lineNumber description];

      abort();
    }
LABEL_44:
    [(CPLTransportScopeMapping *)self->_transportScopeMapping setObject:v12 forKeyedSubscript:v9];
    if (!_CPLSilentLogging)
    {
      v29 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(CPLTransportScopeMapping *)self->_transportScopeMapping objectForKeyedSubscript:v9];
        *(_DWORD *)buf = 138543618;
        id v39 = v9;
        __int16 v40 = 2112;
        v41 = v30;
        _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_DEFAULT, "Will access %{public}@ with concrete scope %@", buf, 0x16u);
      }
    }
    BOOL v10 = 1;
    goto LABEL_49;
  }
  BOOL v10 = 1;
LABEL_50:

  return v10;
}

- (id)taskIdentifier
{
  if (self->_highPriority) {
    return @"engine.sync.pushtotransport.upload.highpriority";
  }
  else {
    return @"engine.sync.pushtotransport.upload";
  }
}

- (BOOL)didUseOverQuotaStrategy
{
  return self->_isUsingOverQuotaStrategy;
}

- (void)_uploadTaskDidFinishWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CPLEngineSyncTask *)self setPhaseDescription:@"cleaning"];
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Upload finished (error: %@)", (uint8_t *)&buf, 0xCu);
    }
  }
  BOOL v6 = [(CPLEngineSyncTask *)self engineLibrary];
  id v7 = [v6 store];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__23405;
  BOOL v15 = __Block_byref_object_dispose__23406;
  id v8 = v4;
  id v16 = v8;
  v10[5] = &buf;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke;
  v11[3] = &unk_1E60AB878;
  v11[4] = self;
  v11[5] = &buf;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_143;
  v10[3] = &unk_1E60AB878;
  v10[4] = self;
  id v9 = (id)[v7 performWriteTransactionWithBlock:v11 completionHandler:v10];
  _Block_object_dispose(&buf, 8);
}

void __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_2;
  v16[3] = &unk_1E60AB850;
  uint64_t v4 = *(void *)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  uint64_t v18 = v4;
  id v5 = v3;
  id v17 = v5;
  [v5 do:v16];
  BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 416) storedExtractedBatch];
  id v7 = v6;
  if (v6)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_3;
    id v12 = &unk_1E60AB850;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v13 = v8;
    id v14 = v6;
    [v5 do:&v9];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setExtractionStrategy:", 0, v9, v10, v11, v12, v13);
  [*(id *)(a1 + 32) _deleteGeneratedResourcesAfterError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_143(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || ([v3 error], uint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskDidFinishWithError:");
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    BOOL v6 = [v7 error];
    [v5 taskDidFinishWithError:v6];
  }
  [*(id *)(a1 + 32) _clearUploadBatch];
}

uint64_t __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _markUploadedTasksDidFinishWithError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transaction:*(void *)(a1 + 40) error:a2];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 144))
    {
      id v5 = *(void **)(v4 + 416);
      return objc_msgSend(v5, "checkInBatchStorage:error:");
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t __60__CPLUploadPushedChangesTask__uploadTaskDidFinishWithError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    if ([v4 isCPLErrorWithCode:18])
    {
      id v5 = [*(id *)(v3 + 32) engineLibrary];
      BOOL v6 = [v5 store];
      id v7 = [v6 idMapping];

      uint64_t v8 = [*(id *)(*(void *)(*(void *)(v3 + 48) + 8) + 40) userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"CPLErrorRejectedRecordIdentifiersAndReasons"];
      uint64_t v10 = +[CPLScopedIdentifier scopedIdentifiersFromDictionaryOfUnknownIdentifiers:v9];

      if (v10)
      {
        v34 = v8;
        uint64_t v36 = a2;
        v38 = objc_alloc_init(CPLRejectedRecords);
        id v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v35 = v3;
        id v11 = [*(id *)(v3 + 40) batch];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (!v12) {
          goto LABEL_18;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v45;
        while (1)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v45 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v17 = [v16 scopedIdentifier];
            char v43 = 0;
            uint64_t v18 = [v7 cloudScopedIdentifierForLocalScopedIdentifier:v17 isFinal:&v43];
            if (v18)
            {
              v19 = [v10 objectForKeyedSubscript:v18];
              if (v19)
              {
                [(CPLRejectedRecords *)v38 setObject:v19 forKeyedSubscript:v16];
                [v37 addObject:v17];
              }
            }
            else
            {
              if (_CPLSilentLogging) {
                goto LABEL_16;
              }
              v19 = __CPLTaskOSLogDomain_23358();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                v50 = v17;
                _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Failed to remap local identifier %@ to a cloud identifier after records have been rejected", buf, 0xCu);
              }
            }

LABEL_16:
            [v16 _setShouldNotTrustCloudCache:1];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
          if (!v13)
          {
LABEL_18:

            uint64_t v8 = v34;
            id v20 = (void *)[v34 mutableCopy];
            [v20 removeObjectForKey:@"CPLErrorRejectedRecordIdentifiersAndReasons"];
            [v20 setObject:v37 forKeyedSubscript:@"CPLErrorRejectedRecordIdentifiers"];
            id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v3 = v35;
            v22 = [*(id *)(*(void *)(*(void *)(v35 + 48) + 8) + 40) domain];
            uint64_t v23 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, objc_msgSend(*(id *)(*(void *)(*(void *)(v35 + 48) + 8) + 40), "code"), v20);
            uint64_t v24 = *(void *)(*(void *)(v35 + 48) + 8);
            BOOL v25 = *(void **)(v24 + 40);
            *(void *)(v24 + 40) = v23;

            a2 = v36;
            v26 = v38;
            goto LABEL_32;
          }
        }
      }
      v26 = 0;
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v27 = *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40);
  }
  else
  {
    uint64_t v27 = 0;
  }
  if ([*(id *)(v3 + 32) _shouldNotTrustCloudCacheAfterError:v27])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = [*(id *)(v3 + 40) batch];
    uint64_t v28 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * j) _setShouldNotTrustCloudCache:1];
        }
        uint64_t v29 = [v7 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v29);
    }
    v26 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v26 = 0;
LABEL_34:
  uint64_t v32 = [*(id *)(v3 + 32) _reenqueueExtractedBatchWithRejectedRecords:v26 extractedBatch:*(void *)(v3 + 40) error:a2];

  return v32;
}

- (BOOL)_shouldNotTrustCloudCacheAfterError:(id)a3
{
  id v3 = a3;
  if ([v3 isCPLError])
  {
    uint64_t v4 = [v3 code];
    BOOL v6 = v4 == 25 || v4 == 80;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_excludeScopeFromMingling
{
  id v3 = [(CPLEngineSyncTask *)self session];
  [v3 excludeScopeIdentifierFromMingling:self->_scopeIdentifier];

  if (self->_sharedScope)
  {
    id v5 = [(CPLEngineSyncTask *)self session];
    uint64_t v4 = [(CPLEngineScope *)self->_sharedScope scopeIdentifier];
    [v5 excludeScopeIdentifierFromMingling:v4];
  }
}

- (void)cancel
{
}

- (void)cancel:(BOOL)a3
{
  if (a3)
  {
    lock = self->_lock;
    id v5 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__CPLUploadPushedChangesTask_cancel___block_invoke;
    v11[3] = &unk_1E60A5DD8;
    v11[4] = self;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLUploadPushedChangesTask;
    [(CPLEngineSyncTask *)&v10 cancel];
    lock = self->_lock;
    id v5 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__CPLUploadPushedChangesTask_cancel___block_invoke_136;
    v9[3] = &unk_1E60A5DD8;
    v9[4] = self;
  }
  BOOL v6 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v13 = v6;
  id v7 = lock;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);
}

void *__37__CPLUploadPushedChangesTask_cancel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[34] || v2[35])
  {
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CPLUploadPushedChangesTask;
    objc_msgSendSuper2(&v8, sel_cancel);
    [*(id *)(*(void *)(a1 + 32) + 272) cancel];
    id v3 = *(void **)(*(void *)(a1 + 32) + 280);
    return (void *)[v3 cancel];
  }
  uint64_t result = (void *)v2[36];
  if (result)
  {
    if (![result foreground])
    {
      v6.receiver = *(id *)(a1 + 32);
      v6.super_class = (Class)CPLUploadPushedChangesTask;
      objc_msgSendSuper2(&v6, sel_cancel);
      id v3 = *(void **)(*(void *)(a1 + 32) + 288);
      return (void *)[v3 cancel];
    }
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Deferring cancellation due to upload task currently running foreground", buf, 2u);
      }
    }
    uint64_t result = (void *)[*(id *)(*(void *)(a1 + 32) + 288) cancelIfBlocked];
    *(unsigned char *)(*(void *)(a1 + 32) + 328) = 1;
  }
  return result;
}

uint64_t __37__CPLUploadPushedChangesTask_cancel___block_invoke_136(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 272) cancel];
  [*(id *)(*(void *)(a1 + 32) + 280) cancel];
  v2 = *(void **)(*(void *)(a1 + 32) + 288);
  return [v2 cancel];
}

- (void)launch
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      scopeIdentifier = self->_scopeIdentifier;
      unint64_t pushRepositoryPriority = self->_pushRepositoryPriority;
      *(_DWORD *)long long buf = 138543618;
      id v11 = scopeIdentifier;
      __int16 v12 = 2048;
      unint64_t v13 = pushRepositoryPriority;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Launching changes upload for %{public}@ (priority %lu)", buf, 0x16u);
    }
  }
  objc_super v6 = [(CPLEngineScopedTask *)self store];
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke;
  v9[3] = &unk_1E60AB578;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke_3;
  v8[3] = &unk_1E60AB578;
  id v7 = (id)[v6 performWriteTransactionWithBlock:v9 completionHandler:v8];
}

uint64_t __36__CPLUploadPushedChangesTask_launch__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__CPLUploadPushedChangesTask_launch__block_invoke_2;
  v3[3] = &unk_1E60AB410;
  v3[4] = *(void *)(a1 + 32);
  return [a2 do:v3];
}

void __36__CPLUploadPushedChangesTask_launch__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 error];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v6 error];
    [v4 _uploadTaskDidFinishWithError:v5];
  }
  else
  {
    [v4 _extractAndUploadOneBatch];
  }
}

BOOL __36__CPLUploadPushedChangesTask_launch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) store];
  uint64_t v5 = [v4 derivativesFilter];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v5;

  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 416) checkOutBatchStorageWithPriority:*(void *)(*(void *)(a1 + 32) + 408) error:a2];
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 144);
  *(void *)(v9 + 144) = v8;

  *(unsigned char *)(*(void *)(a1 + 32) + 176) = [*(id *)(*(void *)(a1 + 32) + 416) hasChangesWithPriorityGreaterThanPriority:*(void *)(*(void *)(a1 + 32) + 408) inScopeWithIdentifier:*(void *)(*(void *)(a1 + 32) + 112)];
  return *(void *)(*(void *)(a1 + 32) + 144) != 0;
}

- (void)_extractAndUploadOneBatch
{
  [(CPLEngineSyncTask *)self setPhaseDescription:@"extracting batch"];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Uploading one batch to transport", buf, 2u);
    }
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke;
  v9[3] = &unk_1E60AB818;
  v9[4] = self;
  void v9[5] = v10;
  v9[6] = v12;
  v9[7] = a2;
  uint64_t v6 = v9;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __cpl_dispatch_async_block_invoke_23414;
  id v17 = &unk_1E60A6978;
  id v18 = v6;
  id v7 = lock;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v7, v8);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) engineLibrary];
  id v3 = [v2 store];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_2;
  v8[3] = &unk_1E60AB7A0;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  long long v12 = *(_OWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_124;
  v7[3] = &unk_1E60AB7F0;
  v7[4] = v9;
  v7[5] = v4;
  v7[6] = v12;
  id v5 = v3;
  id v6 = (id)[v5 performWriteTransactionWithBlock:v8 completionHandler:v7];
}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Looking for next batch in push repository", buf, 2u);
    }
  }
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 386))
    {
      [(id)v5 _noteSuccessfulUpdateInTransaction:v3];
      id v6 = [v3 error];

      if (v6) {
        goto LABEL_32;
      }
      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (*(void *)(v5 + 160))
    {
      id v7 = [*(id *)(v5 + 416) storedExtractedBatch];
      dispatch_block_t v8 = [v7 batch];
      *(void *)(*(void *)(a1 + 32) + 304) += [v8 count];

      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 416) countOfChangesInScopeWithIdentifier:*(void *)(*(void *)(a1 + 32) + 112)];
      uint64_t v11 = *(void **)(a1 + 32);
      unint64_t v12 = 100 * v11[38] / (unint64_t)(v11[38] + v9);
      if (v12 != v11[37])
      {
        v11[37] = v12;
        *(float *)&double v10 = (float)v12 / 100.0;
        [*(id *)(a1 + 32) taskDidProgress:0 userInfo:v10];
        uint64_t v11 = *(void **)(a1 + 32);
      }
      if (!v11[21])
      {
        if (!_CPLSilentLogging)
        {
          BOOL v25 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "We should have a batch to commit here", buf, 2u);
          }
        }
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v27 = *(void *)(a1 + 64);
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
        [v26 handleFailureInMethod:v27 object:v28 file:v29 lineNumber:1149 description:@"We should have a batch to commit here"];

        abort();
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_121;
      v31[3] = &unk_1E60AB778;
      v31[4] = v11;
      id v32 = v3;
      id v33 = *(id *)(a1 + 40);
      id v34 = v7;
      id v13 = v7;
      [v32 do:v31];
      [*(id *)(a1 + 32) _clearUploadBatch];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v5 + 328))
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Triggering deferred cancel", buf, 2u);
        }

        uint64_t v5 = *(void *)(a1 + 32);
      }
      [(id)v5 cancel];
      goto LABEL_32;
    }
    if ([(id)v5 diskPressureState])
    {
      uint64_t v15 = [*(id *)(a1 + 32) engineLibrary];
      id v16 = [v15 store];
      id v17 = [v16 derivativesCache];
      [v17 discardCache];

      uint64_t v18 = [*(id *)(a1 + 32) diskPressureState];
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = [*(id *)(a1 + 32) delegate];
    int v20 = [v19 task:*(void *)(a1 + 32) shouldRetryImmediatelyInTransaction:v3];

    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 48);
LABEL_31:
      *(unsigned char *)(*(void *)(v21 + 8) + 24) = 1;
      goto LABEL_32;
    }
    if (v18 == 2)
    {
      if (!_CPLSilentLogging)
      {
        v22 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = v23;
          _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "System has not enough disk space to continue %@", buf, 0xCu);
        }
      }
      uint64_t v21 = *(void *)(a1 + 56);
      goto LABEL_31;
    }
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 312) = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 32) _extractBatchWithTransaction:v3 andStore:*(void *)(a1 + 40)];
    uint64_t v24 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v24 + 352))
    {
      *(unsigned char *)(v24 + 352) = 1;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_123;
      v30[3] = &unk_1E60AB410;
      v30[4] = *(void *)(a1 + 32);
      [v3 do:v30];
    }
  }
LABEL_32:
}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 104);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_125;
  v11[3] = &unk_1E60AB7C8;
  v11[4] = v5;
  id v12 = v3;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v7 = v11;
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __cpl_dispatch_async_block_invoke_23414;
  id v17 = &unk_1E60A6978;
  id v18 = v7;
  dispatch_block_t v8 = v6;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v8, v10);
}

void __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_125(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 136) willRunEngineElement:CPLEngineElementUpload];
  v2 = [*(id *)(a1 + 40) error];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 40) error];
LABEL_5:
    id v6 = (void *)v4;
    id v7 = v3;
LABEL_6:
    id v23 = v6;
    objc_msgSend(v7, "_uploadTaskDidFinishWithError:");

    return;
  }
  int v5 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v4 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  dispatch_block_t v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 shouldDefer];

  if (v9)
  {
    dispatch_block_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = +[CPLErrors sessionHasBeenDeferredError];
LABEL_11:
    id v6 = (void *)v11;
    id v7 = v10;
    goto LABEL_6;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Requesting retry immediately", buf, 2u);
      }
    }
    long long v13 = *(void **)(a1 + 32);
    uint64_t v14 = +[CPLErrors cplErrorWithCode:10000 description:@"Need to restart push-to-transport immediately"];
    uint64_t v15 = v13;
    goto LABEL_18;
  }
  id v16 = *(id **)(a1 + 32);
  if (v16[20])
  {
    uint64_t v17 = [v16[20] count];
    id v18 = *(void **)(a1 + 32);
    if (v17)
    {
      [v18 _prepareUploadBatch];
    }
    else
    {
      [v18 _extractAndUploadOneBatch];
    }
  }
  else
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F281F8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"Not enough disk space";
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v14 = (void *)[v19 initWithDomain:v20 code:640 userInfo:v21];

      uint64_t v15 = *(void **)(a1 + 32);
LABEL_18:
      [v15 _uploadTaskDidFinishWithError:v14];

      return;
    }
    int v22 = [v16 isCancelled];
    dispatch_block_t v10 = *(void **)(a1 + 32);
    if (v22)
    {
      uint64_t v11 = +[CPLErrors operationCancelledError];
      goto LABEL_11;
    }
    [v10 _uploadTaskDidFinishWithError:0];
  }
}

uint64_t __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_121(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _markUploadedTasksDidFinishWithError:0 transaction:*(void *)(a1 + 40) error:a2];
  if (!result) {
    return result;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 168) count])
  {
    int v5 = [*(id *)(a1 + 48) cloudCache];
    int v6 = [v5 applyBatch:*(void *)(*(void *)(a1 + 32) + 168) isFinal:1 direction:2 withError:a2];

    if (!v6) {
      return 0;
    }
  }
  id v7 = [*(id *)(a1 + 48) statusCenter];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  dispatch_block_t v8 = [*(id *)(a1 + 56) batch];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v9)
  {
    char v12 = 1;
    goto LABEL_37;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v23;
  char v12 = 1;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
      if ([v14 supportsResources]
        && [v14 hasChangeType:8])
      {
        if (![v7 notifyStatusForRecordHasChanged:v14 persist:1 error:a2])
        {
          char v12 = 0;
          goto LABEL_37;
        }
        if ([v14 isMasterChange])
        {
          uint64_t v15 = [v14 scopedIdentifier];
          [v21 addObject:v15];

LABEL_25:
          char v12 = 1;
          goto LABEL_26;
        }
        if (![v14 isAssetChange] || !objc_msgSend(v14, "isFullRecord")) {
          goto LABEL_25;
        }
        uint64_t v17 = [v14 masterScopedIdentifier];
        if (v17 && ([v21 containsObject:v17] & 1) == 0)
        {
          id v18 = +[CPLRecordChange newRecordWithScopedIdentifier:v17];
          int v19 = [v7 notifyStatusForRecordHasChanged:v18 persist:1 error:a2];
          char v12 = v19;
          if (v19) {
            [v21 addObject:v17];
          }
        }
        else
        {
          char v12 = 1;
        }

        if ((v12 & 1) == 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if ([v14 supportsSharingScopedIdentifier])
        {
          if ([v14 hasChangeType:64])
          {
            id v16 = [v14 sharingScopeIdentifier];

            if (v16) {
              char v12 = [v7 notifyStatusForRecordHasChanged:v14 persist:1 error:a2];
            }
          }
        }
        if ((v12 & 1) == 0) {
          goto LABEL_37;
        }
      }
LABEL_26:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v20 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v10 = v20;
  }
  while (v20);
LABEL_37:

  if ((v12 & 1) == 0) {
    return 0;
  }
  return [*(id *)(a1 + 32) _discardUploadedExtractedBatch:*(void *)(a1 + 56) error:a2];
}

uint64_t __55__CPLUploadPushedChangesTask__extractAndUploadOneBatch__block_invoke_123(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = (void *)v4[15];
  int v6 = [v4 scope];
  LODWORD(v5) = [v5 setScopeHasChangesToPullFromTransport:v6 error:a2];

  if (!v5) {
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 208)) {
    return 1;
  }
  dispatch_block_t v8 = *(void **)(v7 + 120);
  return objc_msgSend(v8, "setScopeHasChangesToPullFromTransport:error:");
}

- (void)_noteSuccessfulUpdateInTransaction:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(CPLEngineSyncTask *)self delegate];
  [v4 task:self noteSuccessfulUpdateInTransaction:v5];

  [(CPLUploadPushedChangesTask *)self _updateQuotaStrategyAfterSuccessInTransaction:v5];
}

- (void)_prepareUploadBatch
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  [(CPLEngineSyncTask *)self setPhaseDescription:@"preparing batch"];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke;
  v7[3] = &unk_1E60A5DD8;
  v7[4] = self;
  uint64_t v4 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v9 = v4;
  id v5 = lock;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) engineLibrary];
  id v3 = [v2 store];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_2;
  v6[3] = &unk_1E60AB578;
  uint64_t v7 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_4;
  v5[3] = &unk_1E60AB578;
  v5[4] = v7;
  id v4 = (id)[v3 performWriteTransactionWithBlock:v6 completionHandler:v5];
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_3;
    v4[3] = &unk_1E60AB750;
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    [v5 do:v4];
  }
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_5;
  void v10[3] = &unk_1E60A6728;
  id v11 = v3;
  uint64_t v12 = v4;
  dispatch_block_t v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  uint64_t v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) error];
LABEL_5:
    uint64_t v6 = v4;
    id v11 = (id)v4;
    uint64_t v7 = v3;
LABEL_6:
    [v7 _uploadTaskDidFinishWithError:v6];

    return;
  }
  int v5 = [*(id *)(a1 + 40) isCancelled];
  id v3 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v4 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  id v8 = [*(id *)(a1 + 40) session];
  int v9 = [v8 shouldDefer];

  uint64_t v10 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v6 = +[CPLErrors sessionHasBeenDeferredError];
    id v11 = (id)v6;
    uint64_t v7 = v10;
    goto LABEL_6;
  }
  [v10 _checkForRecordExistence];
}

uint64_t __49__CPLUploadPushedChangesTask__prepareUploadBatch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), *(id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 216);
  if (*(unsigned char *)(v4 + 353) && [(id)v4 _canUseOverQuotaRule]) {
    v5 |= 8uLL;
  }
  uint64_t v6 = objc_alloc_init(CPLRecordTargetMapping);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 256);
  *(void *)(v7 + 256) = v6;

  int v9 = -[CPLBeforeUploadCheckItems initWithBatch:targetMapping:ruleGroups:pushRepositoryPriority:provider:]([CPLBeforeUploadCheckItems alloc], "initWithBatch:targetMapping:ruleGroups:pushRepositoryPriority:provider:", *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 256), v5, *(void *)(*(void *)(a1 + 32) + 408));
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 224);
  *(void *)(v10 + 224) = v9;

  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 208) scopeIdentifier];
  [*(id *)(*(void *)(a1 + 32) + 224) setSharingScopeIdentifier:v12];

  uint64_t v13 = *(void *)(a1 + 32);
  if ((v5 & 8) != 0 && !*(void *)(v13 + 408) && *(unsigned char *)(v13 + 387))
  {
    [*(id *)(v13 + 224) setShouldCheckOverQuotaChangesWithServer:1];
    uint64_t v13 = *(void *)(a1 + 32);
  }
  uint64_t v14 = [*(id *)(v13 + 224) prepareBatchBeforeUploadWithError:a2];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 232);
  *(void *)(v15 + 232) = 0;

  if (v14) {
    [*(id *)(a1 + 32) _prepareTransportGroupForOneBatch];
  }
  return v14;
}

- (BOOL)_canUseOverQuotaRule
{
  v2 = [(CPLEngineScopedTask *)self scope];
  BOOL v3 = +[CPLScopeChange scopeWithTypeHasQuota:](CPLScopeChange, "scopeWithTypeHasQuota:", [v2 scopeType]);

  if (v3) {
    return !+[CPLUploadPushedChangesTask disableOverQuotaRule];
  }
  else {
    return 0;
  }
}

- (void)_generateNeededDerivativesWithFetchCache:(id)a3 fingerprintContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLEngineSyncTask *)self setPhaseDescription:@"generating derivatives"];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  id v8 = [(CPLBeforeUploadCheckItems *)self->_checkItems recordsNeedingGeneratedDerivatives];
  if ([v8 count])
  {
    int v9 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v10 = [v9 store];
    int v11 = [v10 shouldGenerateDerivatives];

    if (v11)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke;
      v27[3] = &unk_1E60A6750;
      id v28 = v8;
      uint64_t v29 = self;
      id v30 = v6;
      id v31 = v7;
      uint64_t v12 = (void (**)(void))MEMORY[0x1BA994060](v27);
      uint64_t v13 = [(CPLEngineSyncTask *)self session];
      int v14 = [v13 needsToAcquireRescheduler];

      if (!v14)
      {
        v12[2](v12);
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v15 = [(CPLEngineSyncTask *)self engineLibrary];
      id v16 = [v15 transport];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      long long v23 = __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke_2;
      long long v24 = &unk_1E60A6AB0;
      long long v25 = self;
      uint64_t v17 = v12;
      id v26 = v17;
      id v18 = [v16 acquireReschedulerTaskWithCompletionHandler:&v21];
      acquireReschedulerTask = self->_acquireReschedulerTask;
      self->_acquireReschedulerTask = v18;

      uint64_t v20 = self->_acquireReschedulerTask;
      if (!v20)
      {
        v17[2](v17);
        goto LABEL_13;
      }
      if (!self->_highPriority)
      {
        if ([(CPLBeforeUploadCheckItems *)self->_checkItems willUploadSomeResources])
        {
LABEL_9:
          [(CPLEngineAcquireReschedulerTask *)self->_acquireReschedulerTask setAllowsFetchCache:1];
          [(CPLEngineSyncTask *)self launchTransportTask:self->_acquireReschedulerTask withTransportGroup:self->_transportGroup];
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v20 = self->_acquireReschedulerTask;
      }
      -[CPLEngineAcquireReschedulerTask setHighPriorityBackground:](v20, "setHighPriorityBackground:", 1, v21, v22, v23, v24, v25);
      goto LABEL_9;
    }
  }
  [(CPLUploadPushedChangesTask *)self _uploadBatchWithFetchCache:v6];
LABEL_15:
}

void __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectEnumerator];
  *(CFAbsoluteTime *)(*(void *)(a1 + 40) + 320) = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 40), "_didStartTaskWithKey:recordCount:", @"derivatives", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = *(void **)(a1 + 40);
  BOOL v3 = [v2 engineLibrary];
  uint64_t v4 = [v3 store];
  uint64_t v5 = [v4 derivativesCache];
  [v2 _generateDerivativesForNextRecord:v6 usingDerivativesCache:v5 fetchCache:*(void *)(a1 + 48) fingerprintContext:*(void *)(a1 + 56)];
}

void __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 104);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke_3;
  void v10[3] = &unk_1E60A6868;
  void v10[4] = v4;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v14 = v6;
  id v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

uint64_t __90__CPLUploadPushedChangesTask__generateNeededDerivativesWithFetchCache_fingerprintContext___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 280);
  *(void *)(v2 + 280) = 0;

  if (a1[5])
  {
    uint64_t v4 = (void *)a1[4];
    return objc_msgSend(v4, "_uploadTaskDidFinishWithError:");
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(a1[6] + 16);
    return v6();
  }
}

- (void)_generateDerivativesForNextRecord:(id)a3 usingDerivativesCache:(id)a4 fetchCache:(id)a5 fingerprintContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  id v14 = [(CPLEngineSyncTask *)self session];
  int v15 = [v14 shouldDefer];

  if (v15)
  {
    [(CPLUploadPushedChangesTask *)self _didFinishTaskWithKey:@"derivatives" error:1 cancelled:0];
    uint64_t v16 = +[CPLErrors sessionHasBeenDeferredError];
LABEL_5:
    uint64_t v17 = (void *)v16;
    [(CPLUploadPushedChangesTask *)self _uploadTaskDidFinishWithError:v16];
    goto LABEL_6;
  }
  if ([(CPLEngineSyncTask *)self isCancelled])
  {
    [(CPLUploadPushedChangesTask *)self _didFinishTaskWithKey:@"derivatives" error:0 cancelled:1];
    uint64_t v16 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  uint64_t v17 = [v10 nextObject];
  if (v17)
  {
    id v18 = +[CPLTransaction newTransactionWithIdentifier:@"cpl.generatederivatives" description:@"generating derivatives" keepPower:1];
    int v19 = [v17 fingerprintSchemeWithContext:v13];
    derivativesFilter = self->_derivativesFilter;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke;
    v29[3] = &unk_1E60AB728;
    v29[4] = self;
    id v30 = v17;
    id v31 = v19;
    id v32 = v10;
    id v33 = v11;
    id v34 = v12;
    id v35 = v13;
    id v36 = v18;
    id v21 = v18;
    id v22 = v19;
    [v33 generateDerivativesForChange:v30 derivativesFilter:derivativesFilter fingerprintScheme:v22 completionHandler:v29];
  }
  else
  {
    lock = self->_lock;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke_3;
    v27[3] = &unk_1E60A6728;
    void v27[4] = self;
    id v28 = v12;
    long long v24 = v27;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_23414;
    block[3] = &unk_1E60A6978;
    id v38 = v24;
    long long v25 = lock;
    dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v25, v26);
  }
LABEL_6:
}

void __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 104);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke_2;
  v18[3] = &unk_1E60AB700;
  v18[4] = v10;
  id v19 = v8;
  id v20 = v9;
  id v21 = v7;
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 72);
  id v27 = *(id *)(a1 + 80);
  id v28 = *(id *)(a1 + 88);
  id v12 = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v30 = v12;
  id v13 = v11;
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

uint64_t __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(*(void *)(a1 + 32) + 224) recordsNeedingGeneratedDerivatives];
      uint64_t v4 = [v3 count];
      CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(a1 + 32) + 320);
      int v7 = 134218240;
      uint64_t v8 = v4;
      __int16 v9 = 2048;
      CFAbsoluteTime v10 = v5;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Successfully generated derivatives for %lu records in %.2fs. Starting upload.", (uint8_t *)&v7, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _didFinishTaskWithKey:@"derivatives" error:0 cancelled:0];
  return [*(id *)(a1 + 32) _uploadBatchWithFetchCache:*(void *)(a1 + 40)];
}

uint64_t __116__CPLUploadPushedChangesTask__generateDerivativesForNextRecord_usingDerivativesCache_fetchCache_fingerprintContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 predictor];
  [v3 updatePredictionsWithDerivativesStatistics:*(void *)(a1 + 40)];

  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", @"derivatives", 1, objc_msgSend(v4, "isCPLOperationCancelledError"));
    [*(id *)(a1 + 32) _uploadTaskDidFinishWithError:*(void *)(a1 + 48)];
  }
  else
  {
    CFAbsoluteTime v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    id v13 = 0;
    int v9 = [v5 _copyResourceChangeFromChange:v6 toChange:v7 fingerprintScheme:v8 error:&v13];
    id v10 = v13;
    uint64_t v11 = v10;
    if (v9)
    {
      [*(id *)(a1 + 32) _generateDerivativesForNextRecord:*(void *)(a1 + 80) usingDerivativesCache:*(void *)(a1 + 88) fetchCache:*(void *)(a1 + 96) fingerprintContext:*(void *)(a1 + 104)];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_didFinishTaskWithKey:error:cancelled:", @"derivatives", 1, objc_msgSend(v10, "isCPLOperationCancelledError"));
      [*(id *)(a1 + 32) _uploadTaskDidFinishWithError:v11];
    }
  }
  return [*(id *)(a1 + 112) endTransaction];
}

- (BOOL)_copyResourceChangeFromChange:(id)a3 toChange:(id)a4 fingerprintScheme:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__23405;
  id v31 = __Block_byref_object_dispose__23406;
  id v32 = 0;
  id v13 = [v11 propertiesForChangeType:8];
  if ([v12 isForStableHash])
  {
    [v11 cplCopyProperties:v13 fromObject:v10 withCopyBlock:0];
  }
  else
  {
    id v14 = +[CPLFingerprintScheme fingerprintSchemeForStableHash];
    id v15 = [(CPLEngineSyncTask *)self session];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__CPLUploadPushedChangesTask__copyResourceChangeFromChange_toChange_fingerprintScheme_error___block_invoke;
    v21[3] = &unk_1E60AB6D8;
    id v25 = &v33;
    id v16 = v15;
    id v26 = &v27;
    id v22 = v16;
    id v23 = self;
    id v17 = v14;
    id v24 = v17;
    [v11 cplCopyProperties:v13 fromObject:v10 withCopyBlock:v21];
  }
  int v18 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((unsigned char *)v34 + 24))
  {
    *a6 = (id) v28[5];
    int v18 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v19 = v18 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

uint64_t __93__CPLUploadPushedChangesTask__copyResourceChangeFromChange_toChange_fingerprintScheme_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) shouldDefer])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v10 = +[CPLErrors sessionHasBeenDeferredError];
LABEL_6:
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_7:
    uint64_t v13 = 1;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v10 = +[CPLErrors operationCancelledError];
    goto LABEL_6;
  }
  if ([v9 isEqualToString:@"resources"])
  {
    id v37 = v9;
    id v38 = v8;
    id v15 = [v8 resources];
    id v16 = (void *)[v15 cplDeepCopy];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v40 + 1) + 8 * v21);
          id v23 = [v22 identity];
          id v24 = [v23 stableHash];
          if (v24)
          {
          }
          else
          {
            uint64_t v25 = [v23 fileURL];
            if (v25)
            {
              id v26 = (void *)v25;
              int v27 = objc_msgSend(v7, "requiresStableHashForResourceType:", objc_msgSend(v22, "resourceType"));

              if (v27)
              {
                id v28 = *(void **)(a1 + 48);
                uint64_t v29 = [v23 fileURL];
                uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
                obuint64_t j = *(id *)(v30 + 40);
                id v31 = [v28 fingerPrintForFileAtURL:v29 error:&obj];
                objc_storeStrong((id *)(v30 + 40), obj);
                [v23 setStableHash:v31];

                id v32 = [v23 stableHash];

                if (!v32)
                {
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                  goto LABEL_31;
                }
                if ([*(id *)(a1 + 32) shouldDefer])
                {
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                  uint64_t v34 = +[CPLErrors sessionHasBeenDeferredError];
LABEL_30:
                  uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
                  char v36 = *(void **)(v35 + 40);
                  *(void *)(v35 + 40) = v34;

LABEL_31:
                  goto LABEL_32;
                }
                if ([*(id *)(a1 + 40) isCancelled])
                {
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                  uint64_t v34 = +[CPLErrors operationCancelledError];
                  goto LABEL_30;
                }
              }
            }
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v33 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
        uint64_t v19 = v33;
      }
      while (v33);
    }
LABEL_32:

    [v7 setResources:v17];
    uint64_t v13 = 1;
    id v9 = v37;
    id v8 = v38;
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_8:

  return v13;
}

- (void)_deleteGeneratedResourcesAfterError:(id)a3
{
  id v7 = a3;
  if (!v7 || [(CPLEngineSyncTask *)self diskPressureState])
  {
    uint64_t v4 = [(CPLEngineSyncTask *)self engineLibrary];
    CFAbsoluteTime v5 = [v4 store];
    uint64_t v6 = [v5 derivativesCache];
    [v6 discardCache];
  }
}

- (void)_uploadBatchWithFetchCache:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if ([(CPLEngineSyncTask *)self isCancelled])
  {
    CFAbsoluteTime v5 = +[CPLErrors operationCancelledError];
    [(CPLUploadPushedChangesTask *)self _uploadTaskDidFinishWithError:v5];
  }
  else
  {
    CFAbsoluteTime v5 = [(CPLBeforeUploadCheckItems *)self->_checkItems batchToUpload];
    if ([v5 count])
    {
      [(CPLEngineSyncTask *)self setPhaseDescription:@"uploading batch"];
      if (!_CPLSilentLogging)
      {
        uint64_t v6 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          id v34 = v5;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Launching transport upload task for %@", buf, 0xCu);
        }
      }
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      -[CPLUploadPushedChangesTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", @"upload", [v5 count]);
      [(CPLRecordTargetMapping *)self->_targetMapping startTrackingUpdates];
      transport = self->_transport;
      id v9 = [(CPLEngineScopedTask *)self scope];
      targetMapping = self->_targetMapping;
      transportScopeMapping = self->_transportScopeMapping;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke;
      v32[3] = &unk_1E60AB688;
      v32[4] = self;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      id v26 = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_3;
      int v27 = &unk_1E60AB6B0;
      id v28 = self;
      CFAbsoluteTime v31 = Current;
      id v12 = v4;
      id v29 = v12;
      id v13 = v5;
      id v30 = v13;
      id v14 = [(CPLEngineTransport *)transport uploadBatchTaskForBatch:v13 scope:v9 targetMapping:targetMapping transportScopeMapping:transportScopeMapping progressHandler:v32 completionHandler:&v24];
      uploadTask = self->_uploadTask;
      self->_uploadTask = v14;

      id v16 = self->_uploadTask;
      if (v16)
      {
        [(CPLEngineTransportUploadBatchTask *)v16 setSharedScope:self->_sharedScope];
        [(CPLEngineTransportUploadBatchTask *)self->_uploadTask setAllowsFetchCache:1];
        [(CPLEngineTransportUploadBatchTask *)self->_uploadTask setFetchCache:v12];
        if (self->_highPriority
          || ![(CPLBeforeUploadCheckItems *)self->_checkItems willUploadSomeResources])
        {
          [(CPLEngineTransportUploadBatchTask *)self->_uploadTask setHighPriorityBackground:1];
        }
        if (self->_shouldSetupEstimatedSize)
        {
          unint64_t v17 = [(CPLBeforeUploadCheckItems *)self->_checkItems countOfAssetsWithResourcesToUpload];
          if (v17) {
            [(CPLEngineTransportGroup *)self->_transportGroup setRoughCPLRecordCount:v17];
          }
          unint64_t v18 = [(CPLBeforeUploadCheckItems *)self->_checkItems estimatedUploadResourceSize];
          if (v18) {
            [(CPLEngineTransportGroup *)self->_transportGroup setRoughCPLUploadEstimatedSize:v18];
          }
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v19 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v20 = [(CPLEngineTransportUploadBatchTask *)self->_uploadTask foreground];
            uint64_t v21 = " with background priority";
            if (v20) {
              uint64_t v21 = " with foreground priority";
            }
            *(_DWORD *)long long buf = 138412546;
            id v34 = v13;
            __int16 v35 = 2080;
            char v36 = v21;
            _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEBUG, "Starting to upload %@%s", buf, 0x16u);
          }
        }
        [(CPLEngineTransportUploadBatchTask *)self->_uploadTask foreground];
        [(CPLEngineTransportUploadBatchTask *)self->_uploadTask hash];
        kdebug_trace();
        [(CPLEngineSyncTask *)self launchTransportTask:self->_uploadTask withTransportGroup:self->_transportGroup];
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          id v22 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v34 = v13;
            _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "Can't create a transport upload task for %@", buf, 0xCu);
          }
        }
        id v23 = +[CPLErrors underlyingErrorWithReason:@"Can't create an upload task for %@", v13, v24, v25, v26, v27, v28, v29];
        [(CPLUploadPushedChangesTask *)self _uploadTaskDidFinishWithError:v23];
      }
    }
    else
    {
      [(CPLUploadPushedChangesTask *)self _extractAndUploadOneBatch];
    }
  }
}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_2;
  void v12[3] = &unk_1E60AB660;
  v12[4] = v6;
  id v13 = v5;
  float v14 = a3;
  id v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v16 = v8;
  id v9 = v7;
  id v10 = v5;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 288) foreground];
  [*(id *)(*(void *)(a1 + 32) + 288) hash];
  kdebug_trace();
  id v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 cloudCache];
  [v5 updateStoredTargetsFromTargetMapping:*(void *)(*(void *)(a1 + 32) + 256)];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_4;
  void v12[3] = &unk_1E60A6700;
  v12[4] = v6;
  id v13 = v3;
  uint64_t v16 = *(void *)(a1 + 56);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v8 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v18 = v8;
  id v9 = v7;
  id v10 = v3;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

uint64_t __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_4(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v2 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      double v4 = *(double *)(*(void *)(a1 + 32) + 288);
      int v19 = 138412546;
      double v20 = v4;
      __int16 v21 = 2112;
      uint64_t v22 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@ finished with error %@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v5 = *(void **)(a1 + 40);
  if (!v5
    && ([*(id *)(a1 + 32) _deleteGeneratedResourcesAfterError:0], (id v5 = *(void **)(a1 + 40)) == 0)
    || ([v5 isCPLErrorWithCode:18] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 288) approximativeResourcesUploadRate];
    if (v6 > 0.0) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "updateApproximativeUploadRate:");
    }
  }
  id v7 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v8 = (void *)v7[36];
    v7[36] = 0;

    if ([*(id *)(a1 + 40) isCPLOperationCancelledError])
    {
      uint64_t v9 = 0;
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v9 = 1;
      uint64_t v10 = 0;
    }
    [*(id *)(a1 + 32) _didFinishTaskWithKey:@"upload" error:v9 cancelled:v10];
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
  }
  else
  {
    [v7 _didFinishTaskWithKey:@"upload" error:0 cancelled:0];
    [*(id *)(*(void *)(a1 + 32) + 136) willRunEngineElement:CPLEngineElementSuccessfulUpload];
    [*(id *)(*(void *)(a1 + 32) + 136) resetBackoffInterval];
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v11 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 192) count];
        id v14 = @"none";
        uint64_t v15 = *(void *)(a1 + 56);
        if (*(void *)(a1 + 48)) {
          id v14 = *(__CFString **)(a1 + 48);
        }
        int v19 = 134218754;
        double v20 = v12;
        __int16 v21 = 2048;
        uint64_t v22 = v13;
        __int16 v23 = 2114;
        uint64_t v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Transport successfully uploaded in %.2fs (%lu resources uploaded) - cache: %{public}@: %@", (uint8_t *)&v19, 0x2Au);
      }
    }
    uint64_t v16 = *(void **)(a1 + 32);
    if (v16[36]) {
      return [v16 _popNextBatchAndContinue];
    }
    uint64_t v18 = 0;
  }
  return [v16 _uploadTaskDidFinishWithError:v18];
}

void __57__CPLUploadPushedChangesTask__uploadBatchWithFetchCache___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "resource", (void)v13);
        uint64_t v9 = [v8 itemScopedIdentifier];
        if ([v9 isEqual:*(void *)(a1 + 40)])
        {
          BOOL v10 = +[CPLResource resourceTypeTrackedForUpload:](CPLResource, "resourceTypeTrackedForUpload:", [v8 resourceType]);

          if (v10)
          {
            dispatch_block_t v11 = [*(id *)(a1 + 32) engineLibrary];
            LODWORD(v12) = *(_DWORD *)(a1 + 48);
            [v11 notifyAttachedObjectsUploadTask:v7 didProgress:v12];

            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
LABEL_12:
}

- (void)_extractBatchWithTransaction:(id)a3 andStore:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(CPLEngineSyncTask *)self isCancelled])
  {
    id v8 = v7;
    long long v47 = [v7 cloudCache];
    long long v46 = [v7 idMapping];
    while (1)
    {
      uint64_t v9 = [v6 error];
      BOOL v10 = v9 == 0;

      if (!v10)
      {
LABEL_64:

        id v7 = v8;
        goto LABEL_65;
      }
      dispatch_block_t v11 = (void *)MEMORY[0x1BA993DF0]();
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__23405;
      v67 = __Block_byref_object_dispose__23406;
      id v68 = 0;
      if (!self->_resetStrategy) {
        goto LABEL_7;
      }
      currentStrategy = self->_currentStrategy;
      if (currentStrategy)
      {
        long long v13 = [(CPLBatchExtractionStrategy *)currentStrategy name];
        long long v14 = self->_currentStrategy;
        self->_currentStrategy = 0;

        self->_resetStrategy = 0;
      }
      else
      {
LABEL_7:
        long long v13 = 0;
      }
      if (!self->_currentStrategy) {
        break;
      }
LABEL_35:
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke;
      v62[3] = &unk_1E60AB500;
      v62[4] = self;
      v62[5] = &v63;
      [v6 do:v62];
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v76 = __Block_byref_object_copy__23405;
      v77 = __Block_byref_object_dispose__23406;
      id v78 = [(id)v64[5] batch];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        id v30 = v8;
        char v61 = 0;
        id v60 = 0;
        BOOL v31 = [(CPLUploadPushedChangesTask *)self _shouldUploadBatchesWithDropReason:&v60 shouldQuarantineRecords:&v61 inTransaction:v6];
        id v32 = v60;
        if (v31)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v33 = __CPLTaskOSLogDomain_23358();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              id v34 = *(CPLChangeBatch **)(*(void *)&buf[8] + 40);
              *(_DWORD *)v69 = 138412290;
              v70 = v34;
              _os_log_impl(&dword_1B4CAC000, v33, OS_LOG_TYPE_DEBUG, "Translating local batch to cloud batch: %@", v69, 0xCu);
            }
          }
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_77;
          v50[3] = &unk_1E60AB638;
          v50[4] = self;
          id v51 = v47;
          v53 = buf;
          id v52 = v46;
          [v6 do:v50];
          diffedBatch = self->_diffedBatch;
          if (diffedBatch)
          {
            if ([(CPLChangeBatch *)diffedBatch count]
              || CFAbsoluteTimeGetCurrent() - self->_startOfIteration > 3.0
              || ([(CPLEngineSyncTask *)self session],
                  char v36 = objc_claimAutoreleasedReturnValue(),
                  int v37 = [v36 shouldDefer],
                  v36,
                  v37))
            {
              if (!_CPLSilentLogging)
              {
                id v38 = __CPLTaskOSLogDomain_23358();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  long long v39 = self->_diffedBatch;
                  *(_DWORD *)v69 = 138412290;
                  v70 = v39;
                  _os_log_impl(&dword_1B4CAC000, v38, OS_LOG_TYPE_DEBUG, "Cloud batch is: %@", v69, 0xCu);
                }
              }
              v49[0] = MEMORY[0x1E4F143A8];
              v49[1] = 3221225472;
              v49[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_78;
              v49[3] = &unk_1E60AB500;
              v49[4] = self;
              v49[5] = &v63;
              [v6 do:v49];
LABEL_50:
              int v40 = 0;
              int v41 = 3;
LABEL_60:

              if (v40) {
LABEL_61:
              }
                int v41 = 0;

              goto LABEL_63;
            }
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_2;
            v48[3] = &unk_1E60AB500;
            v48[4] = self;
            v48[5] = &v63;
            [v6 do:v48];
            uint64_t v45 = [v6 error];

            if (v45)
            {
              [(CPLUploadPushedChangesTask *)self _clearUploadBatch];
              goto LABEL_50;
            }
          }
          int v41 = 0;
          int v40 = 1;
          goto LABEL_60;
        }
        if (!_CPLSilentLogging)
        {
          long long v42 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            scopeIdentifier = self->_scopeIdentifier;
            uint64_t v44 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v69 = 138543874;
            v70 = (CPLChangeBatch *)scopeIdentifier;
            __int16 v71 = 2112;
            id v72 = v32;
            __int16 v73 = 2112;
            uint64_t v74 = v44;
            _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_DEFAULT, "Discarding batch to push because %{public}@ is read-only (%@): %@", v69, 0x20u);
          }

          id v30 = v8;
        }
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_76;
        v54[3] = &unk_1E60AB610;
        v57 = buf;
        v54[4] = self;
        char v59 = v61;
        id v55 = v30;
        id v56 = v32;
        v58 = &v63;
        [v6 do:v54];

        goto LABEL_61;
      }
      int v41 = 3;
LABEL_63:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v63, 8);
      if (v41) {
        goto LABEL_64;
      }
    }
    scopes = self->_scopes;
    long long v16 = [(CPLEngineScopedTask *)self scope];
    self->_isUsingOverQuotaStrategy = [(CPLEngineScopeStorage *)scopes valueForFlag:2 forScope:v16];

    if (!self->_isUsingOverQuotaStrategy)
    {
      __int16 v21 = +[CPLBatchExtractionStrategy usualStrategyWithStorage:self->_batchStorage coveringScopeIdentifier:self->_scopeIdentifier];
      goto LABEL_21;
    }
    if (!self->_pushRepositoryPriority)
    {
      unint64_t v17 = self->_scopes;
      uint64_t v18 = [(CPLEngineScopedTask *)self scope];
      self->_shouldCheckAssetsWithServerWhenOverQuota = [(CPLEngineScopeStorage *)v17 shouldCheckAssetsWithServerWhenOverQuotaForScope:v18];

      if (self->_shouldCheckAssetsWithServerWhenOverQuota)
      {
        if (!_CPLSilentLogging)
        {
          int v19 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            double v20 = [(CPLEngineScopedTask *)self scope];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v20;
            _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Will check assets of %@ with server when over-quota", buf, 0xCu);
          }
LABEL_19:
        }
      }
      else if (!_CPLSilentLogging)
      {
        int v19 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [(CPLEngineScopedTask *)self scope];
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Will check assets of %@ only against cloud cache when over-quota", buf, 0xCu);
        }
        goto LABEL_19;
      }
    }
    __int16 v21 = +[CPLBatchExtractionStrategy overQuotaStrategyWithStorage:self->_batchStorage coveringScopeIdentifier:self->_scopeIdentifier];
LABEL_21:
    __int16 v23 = self->_currentStrategy;
    self->_currentStrategy = v21;

    [(CPLBatchExtractionStrategy *)self->_currentStrategy setMaximumRecordCountPerBatch:self->_maxBatchSize];
    if (v13)
    {
      if (_CPLSilentLogging)
      {
LABEL_34:
        [(CPLEnginePushRepository *)self->_pushRepository setExtractionStrategy:self->_currentStrategy];
        goto LABEL_35;
      }
      uint64_t v24 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [(CPLBatchExtractionStrategy *)self->_currentStrategy name];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Changing extraction strategy from %@ to %@", buf, 0x16u);
      }
    }
    else
    {
      int v26 = _CPLSilentLogging;
      if (!self->_isUsingOverQuotaStrategy || _CPLSilentLogging)
      {
LABEL_30:
        if (!v26)
        {
          id v28 = __CPLTaskOSLogDomain_23358();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            id v29 = [(CPLBatchExtractionStrategy *)self->_currentStrategy stepsDescription];
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v29;
            _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEBUG, "Strategy steps: %@", buf, 0xCu);
          }
        }
        goto LABEL_34;
      }
      uint64_t v24 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(CPLBatchExtractionStrategy *)self->_currentStrategy name];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Will use extraction strategy %@", buf, 0xCu);
      }
    }

    int v26 = _CPLSilentLogging;
    goto LABEL_30;
  }
LABEL_65:
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[19];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = 0;
  id v7 = (void *)v4[52];
  id v8 = [v4 session];
  [v8 estimatedRemainingTime];
  LODWORD(v5) = objc_msgSend(v5, "extractBatch:maximumResourceSize:error:", &obj, objc_msgSend(v7, "maximumResourceSizePerBatchForRemainingTime:"), a2);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (!v5) {
    return 0;
  }
  uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 384))
  {
    long long v16 = [v9 batch];
    *(unsigned char *)(*(void *)(a1 + 32) + 384) = [v16 count] != 0;

    return 1;
  }
  BOOL v10 = [v9 batch];
  uint64_t v11 = [v10 count];

  if (v11) {
    return 1;
  }
  double v12 = *(void **)(*(void *)(a1 + 32) + 120);
  long long v13 = [MEMORY[0x1E4F1C9C8] date];
  long long v14 = [*(id *)(a1 + 32) scope];
  uint64_t v15 = [v12 storeLastDateOfClearedPushRepository:v13 forScope:v14 error:a2];

  return v15;
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_76(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
LABEL_14:
    objc_msgSend(*(id *)(a1 + 32), "_clearUploadBatch", (void)v17);
    return [*(id *)(a1 + 32) _discardUploadedExtractedBatch:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error:a2];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[15];
  uint64_t v6 = [v4 scope];
  LODWORD(v5) = [v5 setDidDropSomeRecordsForScope:v6 error:a2];

  if (v5)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id v7 = [*(id *)(a1 + 40) quarantinedRecords];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isDelete", (void)v17) & 1) == 0)
            {
              long long v14 = [v13 scopedIdentifier];
              char v15 = [v7 addQuarantinedRecordWithScopedIdentifier:v14 recordClass:objc_opt_class() reason:*(void *)(a1 + 48) error:a2];

              if ((v15 & 1) == 0)
              {

                return 0;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    goto LABEL_14;
  }
  return 0;
}

BOOL __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_77(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) cloudChangeBatchFromBatch:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) usingMapping:*(void *)(a1 + 48) isFinal:1 withError:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v3;

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 160) copy];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 168);
  *(void *)(v7 + 168) = v6;

  return *(void *)(*(void *)(a1 + 32) + 160) != 0;
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_78(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) storeExtractedBatch:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

uint64_t __68__CPLUploadPushedChangesTask__extractBatchWithTransaction_andStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _clearUploadBatch];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v4 _discardUploadedExtractedBatch:v5 error:a2];
}

- (BOOL)_shouldUploadBatchesWithDropReason:(id *)a3 shouldQuarantineRecords:(BOOL *)a4 inTransaction:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(CPLEngineSyncTask *)self delegate];
  LOBYTE(a4) = [v9 task:self shouldUploadBatchesWithDropReason:a3 shouldQuarantineRecords:a4 inTransaction:v8];

  return (char)a4;
}

- (void)_checkForRecordExistence
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lock);
  if (![(CPLEngineSyncTask *)self isCancelled])
  {
    uint64_t v4 = [(CPLBeforeUploadCheckItems *)self->_checkItems recordsToFetch];
    if (![v4 count])
    {
      [(CPLUploadPushedChangesTask *)self _checkPrioritiesWithFetchCache:0];
      goto LABEL_13;
    }
    [(CPLEngineSyncTask *)self setPhaseDescription:@"checking records on server"];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[CPLUploadPushedChangesTask _didStartTaskWithKey:recordCount:](self, "_didStartTaskWithKey:recordCount:", @"existence-check", [v4 count]);
    [(CPLRecordTargetMapping *)self->_targetMapping startTrackingUpdates];
    transport = self->_transport;
    targetMapping = self->_targetMapping;
    transportScopeMapping = self->_transportScopeMapping;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke;
    v17[3] = &unk_1E60AB5E8;
    v17[4] = self;
    id v18 = v4;
    CFAbsoluteTime v19 = Current;
    uint64_t v9 = [(CPLEngineTransport *)transport fetchRecordsTaskForRecordsWithScopedIdentifiers:v18 targetMapping:targetMapping transportScopeMapping:transportScopeMapping completionHandler:v17];
    fetchRecordsTask = self->_fetchRecordsTask;
    self->_fetchRecordsTask = v9;

    uint64_t v11 = self->_fetchRecordsTask;
    if (!v11)
    {
      if (!_CPLSilentLogging)
      {
        double v12 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "We should have a task to check for existing records here", buf, 2u);
        }
      }
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
      [v13 handleFailureInMethod:a2 object:self file:v14 lineNumber:621 description:@"We should have a task to check for existing records here"];

      abort();
    }
    if (!self->_highPriority)
    {
      if ([(CPLBeforeUploadCheckItems *)self->_checkItems willUploadSomeResources])
      {
LABEL_11:
        [(CPLEngineTransportFetchRecordsTask *)self->_fetchRecordsTask setAllowsFetchCache:1];
        [(CPLEngineSyncTask *)self launchTransportTask:self->_fetchRecordsTask withTransportGroup:self->_transportGroup];

LABEL_13:
        return;
      }
      uint64_t v11 = self->_fetchRecordsTask;
    }
    [(CPLEngineTransportFetchRecordsTask *)v11 setHighPriorityBackground:1];
    goto LABEL_11;
  }
  id v15 = +[CPLErrors operationCancelledError];
  [(CPLUploadPushedChangesTask *)self _uploadTaskDidFinishWithError:v15];
}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 272) fetchCache];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 104);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_2;
  v17[3] = &unk_1E60AB5C0;
  v17[4] = v8;
  id v18 = v6;
  id v19 = v5;
  id v10 = *(id *)(a1 + 40);
  uint64_t v22 = *(void *)(a1 + 48);
  id v20 = v10;
  id v21 = v7;
  uint64_t v11 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_23414;
  block[3] = &unk_1E60A6978;
  id v24 = v11;
  double v12 = v9;
  id v13 = v7;
  id v14 = v5;
  id v15 = v6;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v12, v16);
}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 272);
  *(void *)(v2 + 272) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 cloudCache];
  [v5 updateStoredTargetsFromTargetMapping:*(void *)(*(void *)(a1 + 32) + 256)];

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    if ([v6 isCPLOperationCancelledError])
    {
      uint64_t v7 = 0;
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v7 = 1;
      uint64_t v8 = 0;
    }
    [*(id *)(a1 + 32) _didFinishTaskWithKey:@"existence-check" error:v7 cancelled:v8];
    double v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    [v12 _uploadTaskDidFinishWithError:v13];
  }
  else
  {
    int v9 = [*(id *)(a1 + 32) isCancelled];
    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      [v10 _didFinishTaskWithKey:@"existence-check" error:0 cancelled:1];
      uint64_t v11 = *(void **)(a1 + 32);
      id v28 = +[CPLErrors operationCancelledError];
      objc_msgSend(v11, "_uploadTaskDidFinishWithError:");
    }
    else
    {
      [v10 _didFinishTaskWithKey:@"existence-check" error:0 cancelled:0];
      if ([*(id *)(*(void *)(a1 + 32) + 224) shouldCheckOverQuotaChangesWithServer])
      {
        id v14 = [*(id *)(a1 + 32) store];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_3;
        v30[3] = &unk_1E60AB578;
        v30[4] = *(void *)(a1 + 32);
        id v15 = (id)[v14 performWriteTransactionWithBlock:v30 completionHandler:&__block_literal_global_23506];
      }
      if (!_CPLSilentLogging)
      {
        dispatch_block_t v16 = __CPLTaskOSLogDomain_23358();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [*(id *)(a1 + 48) count];
          uint64_t v18 = [*(id *)(a1 + 56) count];
          id v19 = [*(id *)(*(void *)(a1 + 32) + 224) fetchRules];
          id v20 = [v19 componentsJoinedByString:@"/"];
          double v21 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
          uint64_t v22 = *(__CFString **)(a1 + 64);
          if (!v22) {
            uint64_t v22 = @"none";
          }
          *(_DWORD *)long long buf = 134219010;
          uint64_t v32 = v17;
          __int16 v33 = 2048;
          uint64_t v34 = v18;
          __int16 v35 = 2114;
          char v36 = v20;
          __int16 v37 = 2048;
          double v38 = v21;
          __int16 v39 = 2114;
          int v40 = v22;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Found %lu/%lu records on server (rules: %{public}@) in %.2fs - cache: %{public}@", buf, 0x34u);
        }
      }
      __int16 v23 = *(void **)(*(void *)(a1 + 32) + 224);
      uint64_t v24 = *(void *)(a1 + 48);
      id v29 = 0;
      int v25 = [v23 checkBatchWithFoundRecords:v24 error:&v29];
      id v26 = v29;
      uint64_t v27 = *(void **)(a1 + 32);
      if (v25) {
        [v27 _checkPrioritiesWithFetchCache:*(void *)(a1 + 64)];
      }
      else {
        [v27 _uploadTaskDidFinishWithError:v26];
      }
    }
  }
}

uint64_t __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_4;
  v3[3] = &unk_1E60AB410;
  v3[4] = *(void *)(a1 + 32);
  return [a2 do:v3];
}

void __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 error];

  if (v2 && !_CPLSilentLogging)
  {
    uint64_t v3 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Failed to note that engine checked assets on server", v4, 2u);
    }
  }
}

uint64_t __54__CPLUploadPushedChangesTask__checkForRecordExistence__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[15];
  id v5 = [v3 scope];
  uint64_t v6 = [v4 noteDidCheckAssetWithServerWhenOverQuotaForScope:v5 error:a2];

  return v6;
}

- (void)_checkPrioritiesWithFetchCache:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CPLBeforeUploadCheckItems *)self->_checkItems itemsToReinject];
  uint64_t v7 = v6;
  if (self->_mustConsiderOtherPriorities)
  {
    self->_mustConsiderOtherPriorities = 1;
  }
  else
  {
    uint64_t v8 = [v6 count];
    self->_mustConsiderOtherPriorities = v8 != 0;
    if (!v8)
    {
      double v12 = [(CPLEngineSyncTask *)self engineLibrary];
      uint64_t v13 = [v12 transport];
      id v14 = [v13 fingerprintContext];
      [(CPLUploadPushedChangesTask *)self _generateNeededDerivativesWithFetchCache:v5 fingerprintContext:v14];

      goto LABEL_5;
    }
  }
  int v9 = [(CPLEngineScopedTask *)self store];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke;
  v17[3] = &unk_1E60AB528;
  v17[4] = self;
  id v18 = v9;
  id v19 = v7;
  SEL v20 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_52;
  v15[3] = &unk_1E60AB550;
  v15[4] = self;
  id v16 = v5;
  id v10 = v9;
  id v11 = (id)[v10 performWriteTransactionWithBlock:v17 completionHandler:v15];

LABEL_5:
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3]) {
    goto LABEL_110;
  }
  v85 = v3;
  uint64_t v108 = a1;
  v109 = [*(id *)(a1 + 40) idMapping];
  v107 = [*(id *)(a1 + 40) cloudCache];
  uint64_t v159 = 0;
  v160 = &v159;
  uint64_t v161 = 0x3032000000;
  v162 = __Block_byref_object_copy__23405;
  v163 = __Block_byref_object_dispose__23406;
  id v164 = 0;
  uint64_t v4 = +[CPLErrors cplErrorWithCode:11 description:@"Resource will be uploaded in a later batch"];
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_22;
  v156[3] = &unk_1E60AB460;
  uint64_t v5 = *(void *)(a1 + 32);
  v158 = &v159;
  v156[4] = v5;
  id v82 = v4;
  id v157 = v82;
  v84 = (void *)MEMORY[0x1BA994060](v156);
  uint64_t v150 = 0;
  v151 = (id *)&v150;
  uint64_t v152 = 0x3032000000;
  v153 = __Block_byref_object_copy__23405;
  v154 = __Block_byref_object_dispose__23406;
  id v155 = [*(id *)(*(void *)(a1 + 32) + 416) storedExtractedBatch];
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v6 = objc_alloc_init(CPLExtractedBatch);
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2;
    v141[3] = &unk_1E60AB488;
    v147 = &v150;
    id v7 = v109;
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v149 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    id v142 = v7;
    uint64_t v143 = v9;
    id v144 = v8;
    id v146 = v84;
    id v10 = v6;
    v145 = v10;
    v148 = &v159;
    [v85 do:v141];
  }
LABEL_4:
  id v11 = [v85 error];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    v83 = (void *)MEMORY[0x1BA993DF0]();
    char v140 = 0;
    uint64_t v136 = 0;
    v137 = &v136;
    uint64_t v138 = 0x2020000000;
    char v139 = 0;
    v87 = objc_alloc_init(CPLExtractedBatch);
    id v13 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v14 = [v151[5] batch];
    v110 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_30;
    v132[3] = &unk_1E60AB4D8;
    id v133 = v85;
    id v134 = v84;
    v135 = &v136;
    v89 = (void (**)(void, void, void, void, void))MEMORY[0x1BA994060](v132);
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    obuint64_t j = [v151[5] batch];
    uint64_t v92 = [obj countByEnumeratingWithState:&v128 objects:v171 count:16];
    if (!v92)
    {
      v86 = 0;
      v98 = 0;
      goto LABEL_51;
    }
    v98 = 0;
    v90 = *(void **)v129;
    v86 = 0;
    while (1)
    {
      for (id i = 0; i != (id)v92; id i = (char *)i + 1)
      {
        if (*(void **)v129 != v90) {
          objc_enumerationMutation(obj);
        }
        v105 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        context = (void *)MEMORY[0x1BA993DF0]();
        id v99 = [v105 scopedIdentifier];
        uint64_t v15 = objc_msgSend(v109, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:");
        if (!v15)
        {
          if (!_CPLSilentLogging)
          {
            v67 = __CPLTaskOSLogDomain_23358();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              v170 = v105;
              _os_log_impl(&dword_1B4CAC000, v67, OS_LOG_TYPE_ERROR, "Cloud scoped identifier for %@ should be known here", buf, 0xCu);
            }
          }
          id v68 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v15);
          uint64_t v69 = *(void *)(v108 + 56);
          uint64_t v70 = *(void *)(v108 + 32);
          __int16 v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
          [v68 handleFailureInMethod:v69, v70, v71, 402, @"Cloud scoped identifier for %@ should be known here", v105 object file lineNumber description];

          abort();
        }
        v93 = (void *)v15;
        id v16 = objc_msgSend(*(id *)(*(void *)(v108 + 32) + 224), "itemWithScopedIdentifier:");
        unint64_t v17 = *(void *)(*(void *)(v108 + 32) + 408);
        v103 = v16;
        id v18 = [v16 change];
        BOOL v19 = v18 == 0;

        if (v19) {
          goto LABEL_34;
        }
        if (![v105 isMasterChange])
        {
          uint64_t v24 = [v103 change];
          int v25 = [v24 hasChangeType:2];

          if (v25)
          {
            long long v126 = 0u;
            long long v127 = 0u;
            long long v124 = 0u;
            long long v125 = 0u;
            id v26 = [v105 scopedIdentifiersForMapping];
            __int16 v23 = 0;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v124 objects:v168 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v125;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v125 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v124 + 1) + 8 * j);
                  if (([v110 containsObject:v30] & 1) == 0)
                  {
                    BOOL v31 = [v109 cloudScopedIdentifierForLocalScopedIdentifier:v30 isFinal:&v140];
                    if (!v31 || ([v107 hasRecordWithScopedIdentifier:v31] & 1) == 0)
                    {
                      uint64_t v32 = [*(id *)(*(void *)(v108 + 32) + 416) changeWithScopedIdentifier:v30];
                      __int16 v33 = v32;
                      if (v32)
                      {
                        uint64_t v34 = [v32 _pushContext];
                        unint64_t v35 = [v34 priority];

                        if (v35 > v17)
                        {
                          unint64_t v17 = v35;
                          __int16 v23 = @"needs related record with higher priority to be uploaded";
                        }
                      }
                    }
                  }
                }
                uint64_t v27 = [v26 countByEnumeratingWithState:&v124 objects:v168 count:16];
              }
              while (v27);
            }
          }
          else
          {
LABEL_34:
            __int16 v23 = 0;
          }
          id v22 = v98;
          goto LABEL_36;
        }
        SEL v20 = [v103 change];
        int v21 = [v20 hasChangeType:8];

        if (!v21) {
          goto LABEL_34;
        }
        id v22 = v98;
        if (!v98) {
          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        }
        [v22 addObject:v99];
        __int16 v23 = 0;
LABEL_36:
        if (v17 <= *(void *)(*(void *)(v108 + 32) + 408))
        {
          [v110 addObject:v99];
          [(CPLExtractedBatch *)v87 addChange:v105 fromStorage:*(void *)(*(void *)(v108 + 32) + 144)];
          if ([v22 count])
          {
            if ([v105 isAssetChange])
            {
              char v36 = [v103 change];
              if (v36)
              {
                int v37 = [v105 hasChangeType:2];

                if (v37)
                {
                  double v38 = [v105 relatedScopedIdentifier];
                  if (v38)
                  {
                    id v39 = v86;
                    if (!v86) {
                      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                    }
                    v86 = v39;
                    [v39 addObject:v38];
                  }
                }
              }
            }
          }
        }
        else
        {
          ((void (**)(void, void *, void *, unint64_t, __CFString *))v89)[2](v89, v103, v105, v17, v23);
        }
        v98 = v22;
      }
      uint64_t v92 = [obj countByEnumeratingWithState:&v128 objects:v171 count:16];
      if (!v92)
      {
LABEL_51:

        if ([v98 count])
        {
          v91 = (void *)MEMORY[0x1BA993DF0]();
          objc_storeStrong(v151 + 5, v87);
          v100 = objc_alloc_init(CPLExtractedBatch);

          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          int v40 = [v151[5] batch];
          uint64_t v106 = [v40 countByEnumeratingWithState:&v120 objects:v167 count:16];
          if (!v106) {
            goto LABEL_93;
          }
          id v102 = v40;
          uint64_t v104 = *(void *)v121;
          while (1)
          {
            for (uint64_t k = 0; k != v106; ++k)
            {
              if (*(void *)v121 != v104) {
                objc_enumerationMutation(v102);
              }
              long long v42 = *(void **)(*((void *)&v120 + 1) + 8 * k);
              if (![v42 isMasterChange])
              {
                [(CPLExtractedBatch *)v100 addChange:v42 fromStorage:*(void *)(*(void *)(v108 + 32) + 144)];
                continue;
              }
              long long v43 = [v42 scopedIdentifier];
              if ([v98 containsObject:v43]
                && ([v86 containsObject:v43] & 1) == 0)
              {
                uint64_t v44 = [v109 cloudScopedIdentifierForLocalScopedIdentifier:v43 isFinal:&v140];
                if (!v44)
                {
                  if (!_CPLSilentLogging)
                  {
                    id v72 = __CPLTaskOSLogDomain_23358();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      v170 = v42;
                      _os_log_impl(&dword_1B4CAC000, v72, OS_LOG_TYPE_ERROR, "%@ should have a cloud scoped identifier here", buf, 0xCu);
                    }
                  }
                  __int16 v73 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v44);
                  uint64_t v74 = *(void *)(v108 + 56);
                  uint64_t v75 = *(void *)(v108 + 32);
                  v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
                  [v73 handleFailureInMethod:v74, v75, v76, 466, @"%@ should have a cloud scoped identifier here", v42 object file lineNumber description];

                  abort();
                }
                contexta = (void *)v44;
                v95 = objc_msgSend(*(id *)(*(void *)(v108 + 32) + 224), "itemWithScopedIdentifier:");
                uint64_t v45 = *(void *)(v108 + 32);
                if (*(void *)(v45 + 208))
                {
                  long long v46 = [*(id *)(v45 + 256) targetForRecordWithScopedIdentifier:contexta];
                  long long v47 = v46;
                  if (!v46)
                  {
                    if (!_CPLSilentLogging)
                    {
                      v77 = __CPLTaskOSLogDomain_23358();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        v170 = v42;
                        _os_log_impl(&dword_1B4CAC000, v77, OS_LOG_TYPE_ERROR, "%@ should know its target here", buf, 0xCu);
                      }
                    }
                    id v78 = [MEMORY[0x1E4F28B00] currentHandler];
                    uint64_t v79 = *(void *)(v108 + 56);
                    uint64_t v80 = *(void *)(v108 + 32);
                    v81 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
                    [v78 handleFailureInMethod:v79, v80, v81, 479, @"%@ should know its target here", v42 object file lineNumber description];

                    abort();
                  }
                  uint64_t v48 = [v46 targetState];
                  if ((unint64_t)(v48 - 2) < 2)
                  {
                    v94 = v47;
                    unint64_t v49 = 3000;
                    goto LABEL_70;
                  }
                  if (v48 == 1)
                  {
                    unint64_t v50 = 2000;
                  }
                  else
                  {
                    v94 = v47;
                    unint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_70:
                    long long v118 = 0u;
                    long long v119 = 0u;
                    long long v116 = 0u;
                    long long v117 = 0u;
                    id v52 = [*(id *)(*(void *)(v108 + 32) + 416) allChangesWithClass:objc_opt_class() relatedScopedIdentifier:v43];
                    uint64_t v53 = [v52 countByEnumeratingWithState:&v116 objects:v166 count:16];
                    if (v53)
                    {
                      uint64_t v54 = *(void *)v117;
                      while (2)
                      {
                        for (uint64_t m = 0; m != v53; ++m)
                        {
                          if (*(void *)v117 != v54) {
                            objc_enumerationMutation(v52);
                          }
                          id v56 = [*(id *)(*((void *)&v116 + 1) + 8 * m) _pushContext];
                          uint64_t v57 = [v56 priority];

                          if (v57 == 2000)
                          {
                            unint64_t v49 = 2000;
                            goto LABEL_82;
                          }
                          if (v49 > 0x7D0) {
                            unint64_t v49 = v57;
                          }
                        }
                        uint64_t v53 = [v52 countByEnumeratingWithState:&v116 objects:v166 count:16];
                        if (v53) {
                          continue;
                        }
                        break;
                      }
                    }
LABEL_82:

                    if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
                      unint64_t v50 = 2000;
                    }
                    else {
                      unint64_t v50 = v49;
                    }
                    long long v47 = v94;
                  }

                  uint64_t v45 = *(void *)(v108 + 32);
                  id v51 = @"keep master with related asset";
                }
                else
                {
                  unint64_t v50 = 2000;
                  id v51 = @"master has resources to upload";
                }
                if (v50 > *(void *)(v45 + 408)) {
                  ((void (**)(void, void *, void *, unint64_t, __CFString *))v89)[2](v89, v95, v42, v50, v51);
                }
              }
            }
            int v40 = v102;
            uint64_t v106 = [v102 countByEnumeratingWithState:&v120 objects:v167 count:16];
            if (!v106)
            {
LABEL_93:

              goto LABEL_95;
            }
          }
        }
        v100 = v87;
LABEL_95:
        int v58 = *((unsigned __int8 *)v137 + 24);
        if (*((unsigned char *)v137 + 24)) {
          objc_storeStrong(v151 + 5, v100);
        }

        _Block_object_dispose(&v136, 8);
        if (!v58) {
          break;
        }
        goto LABEL_4;
      }
    }
  }
  if ([(id)v160[5] count])
  {
    char v59 = objc_alloc_init(CPLChangeBatch);
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v60 = *(id *)(*(void *)(v108 + 32) + 168);
    uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v165 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v113;
      do
      {
        for (uint64_t n = 0; n != v61; ++n)
        {
          if (*(void *)v113 != v62) {
            objc_enumerationMutation(v60);
          }
          v64 = *(void **)(*((void *)&v112 + 1) + 8 * n);
          uint64_t v65 = (void *)v160[5];
          v66 = [v64 scopedIdentifier];
          LOBYTE(v65) = [v65 containsObject:v66];

          if ((v65 & 1) == 0) {
            [(CPLChangeBatch *)v59 addRecord:v64];
          }
        }
        uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v165 count:16];
      }
      while (v61);
    }

    objc_storeStrong((id *)(*(void *)(v108 + 32) + 168), v59);
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_50;
    v111[3] = &unk_1E60AB500;
    v111[4] = *(void *)(v108 + 32);
    v111[5] = &v150;
    [v85 do:v111];
  }
  _Block_object_dispose(&v150, 8);

  _Block_object_dispose(&v159, 8);
  id v3 = v85;
LABEL_110:
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v3 error];
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) isCancelled];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v6 = +[CPLErrors operationCancelledError];
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) session];
      int v9 = [v8 shouldDefer];

      uint64_t v5 = *(void **)(a1 + 32);
      if (!v9)
      {
        id v11 = (void *)v5[13];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_53;
        v15[3] = &unk_1E60A6728;
        v15[4] = v5;
        id v16 = *(id *)(a1 + 40);
        BOOL v12 = v15;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __cpl_dispatch_async_block_invoke_23414;
        block[3] = &unk_1E60A6978;
        id v18 = v12;
        id v13 = v11;
        dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_async(v13, v14);

        goto LABEL_8;
      }
      uint64_t v6 = +[CPLErrors sessionHasBeenDeferredError];
    }
  }
  id v10 = (void *)v6;
  [v5 _uploadTaskDidFinishWithError:v6];

LABEL_8:
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_53(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [v1 engineLibrary];
  id v3 = [v5 transport];
  uint64_t v4 = [v3 fingerprintContext];
  [v1 _generateNeededDerivativesWithFetchCache:v2 fingerprintContext:v4];
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_22(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v13 = *(void *)(a1[6] + 8);
    dispatch_block_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  if ([v11 containsObject:v10])
  {
    uint64_t v15 = 1;
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
    id v16 = *(void **)(a1[4] + 200);
    if (!v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = a1[4];
      BOOL v19 = *(void **)(v18 + 200);
      *(void *)(v18 + 200) = v17;

      id v16 = *(void **)(a1[4] + 200);
    }
    [v16 setObject:a1[5] forKeyedSubscript:v10];
    uint64_t v15 = [*(id *)(a1[4] + 416) reinjectChange:v9 priority:a4 error:a5];
  }

  return v15;
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) batch];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v25 = a2;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = [v9 scopedIdentifier];
        char v28 = 0;
        uint64_t v11 = [*(id *)(a1 + 32) cloudScopedIdentifierForLocalScopedIdentifier:v10 isFinal:&v28];
        if (!v11)
        {
          if (!_CPLSilentLogging)
          {
            SEL v20 = __CPLTaskOSLogDomain_23358();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v34 = v9;
              _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Cloud scoped identifier for %@ should be known here", buf, 0xCu);
            }
          }
          int v21 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v22 = *(void *)(a1 + 88);
          uint64_t v23 = *(void *)(a1 + 40);
          uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
          [v21 handleFailureInMethod:v22, v23, v24, 364, @"Cloud scoped identifier for %@ should be known here", v9 object file lineNumber description];

          abort();
        }
        id v12 = (void *)v11;
        uint64_t v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
        if (v13)
        {
          dispatch_block_t v14 = v13;
          uint64_t v15 = *(void *)(a1 + 64);
          uint64_t v16 = [v13 pushRepositoryPriority];
          id v27 = v6;
          LODWORD(v15) = (*(uint64_t (**)(uint64_t, void *, void *, uint64_t, id *))(v15 + 16))(v15, v9, v12, v16, &v27);
          id v17 = v27;

          if (!v15)
          {

            if (v25)
            {
              id v17 = v17;
              uint64_t v18 = 0;
              void *v25 = v17;
            }
            else
            {
              uint64_t v18 = 0;
            }
            goto LABEL_21;
          }
          uint64_t v6 = v17;
        }
        else
        {
          [*(id *)(a1 + 56) addChange:v9 fromStorage:*(void *)(*(void *)(a1 + 40) + 144)];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
  }
  uint64_t v18 = 1;
  id v17 = v6;
LABEL_21:

  return v18;
}

void __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_30(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  [v9 dropChangeWithReason:a5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_31;
  v15[3] = &unk_1E60AB4B0;
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v16 = v10;
  id v17 = v9;
  id v18 = v12;
  uint64_t v19 = a4;
  id v13 = v9;
  id v14 = v10;
  [v11 do:v15];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_50(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_23358();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 168);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "After considering priorities, new batch to commit is %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 416) storeExtractedBatch:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

uint64_t __61__CPLUploadPushedChangesTask__checkPrioritiesWithFetchCache___block_invoke_2_31(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 40) scopedIdentifier];
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void *, void, uint64_t))(v5 + 16))(v5, v4, v6, *(void *)(a1 + 56), a2);

  return v7;
}

- (void)_clearUploadBatch
{
  diffedBatch = self->_diffedBatch;
  self->_diffedBatch = 0;

  batchToCommit = self->_batchToCommit;
  self->_batchToCommit = 0;

  checkItems = self->_checkItems;
  self->_checkItems = 0;

  targetMapping = self->_targetMapping;
  self->_targetMapping = 0;
}

- (BOOL)_reenqueueExtractedBatchWithRejectedRecords:(id)a3 extractedBatch:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    pushRepository = self->_pushRepository;
    id v17 = 0;
    int v10 = [(CPLEnginePushRepository *)pushRepository reinjectExtractedBatch:a4 overwrittenRecordIdentifiers:&v17 error:a5];
    id v11 = v17;
    if (v10)
    {
      BOOL v12 = [(CPLEnginePushRepository *)self->_pushRepository storeExtractedBatch:0 error:a5];
      LOBYTE(v10) = v12;
      if (v8)
      {
        if (v12)
        {
          [v8 removeRejectedRecordsWithScopedIdentifiers:v11];
          id v13 = [(CPLEngineSyncTask *)self engineLibrary];
          id v14 = [v13 store];
          uint64_t v15 = [v14 quarantinedRecords];
          LOBYTE(v10) = [v15 bumpRejectedRecords:v8 error:a5];
        }
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)_discardUploadedExtractedBatch:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CPLEngineSyncTask *)self engineLibrary];
  id v8 = [v7 store];
  uint64_t v9 = [v8 outgoingResources];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v10 = objc_msgSend(v6, "uploadIdentifiers", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![v9 deleteResourcesToUploadWithUploadIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * i) error:a4])
        {

          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = [(CPLEnginePushRepository *)self->_pushRepository storeExtractedBatch:0 error:a4];
LABEL_11:

  return v15;
}

- (BOOL)_markUploadedTasksDidFinishWithError:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uploadResourceTasks = self->_uploadResourceTasks;
  if (uploadResourceTasks)
  {
    uint64_t v9 = uploadResourceTasks;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __85__CPLUploadPushedChangesTask__markUploadedTasksDidFinishWithError_transaction_error___block_invoke;
    v45[3] = &unk_1E60AB438;
    int v37 = self;
    v45[4] = self;
    uint64_t v36 = v9;
    long long v46 = v36;
    [a4 addCleanupBlock:v45];
    if (!_CPLSilentLogging)
    {
      int v10 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        NSUInteger v11 = [(NSArray *)self->_uploadResourceTasks count];
        uint64_t v12 = "failed";
        uint64_t v13 = self->_uploadResourceTasks;
        *(_DWORD *)long long buf = 134218498;
        NSUInteger v49 = v11;
        if (!v7) {
          uint64_t v12 = "succeeded";
        }
        __int16 v50 = 2080;
        id v51 = v12;
        __int16 v52 = 2112;
        uint64_t v53 = v13;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Notifying upload tasks for %lu resources as %s: %@", buf, 0x20u);
      }
    }
    id v14 = self;
    BOOL v15 = [(CPLEngineSyncTask *)self engineLibrary];
    id v16 = [v15 store];
    id v39 = [v16 resourceStorage];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = self->_uploadResourceTasks;
    uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v42;
      char v20 = 1;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v23 = [v22 cloudResource];
          uint64_t v24 = v23;
          if (v20)
          {
            int v25 = [v23 identity];
            id v26 = [v25 fileURL];
            char v20 = [v39 releaseFileURL:v26 forResource:v24 error:a5];
          }
          id v27 = [(CPLEngineSyncTask *)v14 engineLibrary];
          char v28 = v27;
          if (v7)
          {
            [v27 notifyAttachedObjectsUploadTask:v22 didFinishWithError:v7];
          }
          else
          {
            cloudScopedIdentifiersToUploadResourceTaskErrors = v14->_cloudScopedIdentifiersToUploadResourceTaskErrors;
            long long v30 = [v24 itemScopedIdentifier];
            long long v31 = [(NSMutableDictionary *)cloudScopedIdentifiersToUploadResourceTaskErrors objectForKeyedSubscript:v30];
            [v28 notifyAttachedObjectsUploadTask:v22 didFinishWithError:v31];

            id v14 = v37;
          }
        }
        uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v18);
    }
    else
    {
      char v20 = 1;
    }

    __int16 v33 = v14->_uploadResourceTasks;
    v14->_uploadResourceTasks = 0;

    BOOL v32 = v20 & 1;
  }
  else
  {
    BOOL v32 = 1;
    id v14 = self;
  }
  uint64_t v34 = v14->_cloudScopedIdentifiersToUploadResourceTaskErrors;
  v14->_cloudScopedIdentifiersToUploadResourceTaskErrors = 0;

  return v32;
}

void __85__CPLUploadPushedChangesTask__markUploadedTasksDidFinishWithError_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), *(id *)(a1 + 40));
  }
}

- (void)_updateQuotaStrategyAfterSuccessInTransaction:(id)a3
{
  id v4 = a3;
  if (self->_isUsingOverQuotaStrategy
    && [(CPLBeforeUploadCheckItems *)self->_checkItems shouldResetExceedingQuotaOnSuccessfulUpload])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Uploaded batch shows user is back under quota", buf, 2u);
      }
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__CPLUploadPushedChangesTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke;
    v6[3] = &unk_1E60AB410;
    void v6[4] = self;
    [v4 do:v6];
    self->_isUsingOverQuotaStrategy = 0;
    self->_resetStrategy = 1;
  }
}

uint64_t __76__CPLUploadPushedChangesTask__updateQuotaStrategyAfterSuccessInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 208);
  if (v5)
  {
    uint64_t result = [*(id *)(v4 + 120) setValue:0 forFlag:2 forScope:v5 error:a2];
    if (!result) {
      return result;
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v7 = *(void **)(v4 + 120);
  id v8 = [(id)v4 scope];
  uint64_t v9 = [v7 setValue:0 forFlag:2 forScope:v8 error:a2];

  return v9;
}

- (void)_popNextBatchAndContinue
{
  uploadTasuint64_t k = self->_uploadTask;
  self->_uploadTasuint64_t k = 0;

  self->_hasUploadedOneBatch = 1;
  [(CPLUploadPushedChangesTask *)self _extractAndUploadOneBatch];
}

- (void)_prepareTransportGroupForOneBatch
{
  storedTransportGroup = self->_storedTransportGroup;
  if (storedTransportGroup)
  {
    uint64_t v4 = storedTransportGroup;
    BOOL v5 = 0;
    transportGroup = self->_transportGroup;
    self->_transportGroup = v4;
  }
  else
  {
    id v7 = [(CPLEngineTransport *)self->_transport createGroupForChangeUpload];
    transportGroup = self->_transportGroup;
    self->_transportGroup = v7;
    BOOL v5 = 1;
  }

  self->_shouldSetupEstimatedSize = v5;
}

- (void)_didFinishTaskWithKey:(id)a3 error:(BOOL)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  currentTaskKey = self->_currentTaskKey;
  if (!currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v15 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v22 = v16;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "%@ called without any started task", buf, 0xCu);
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    uint64_t v19 = NSStringFromSelector(a2);
    [v17 handleFailureInMethod:a2, self, v18, 213, @"%@ called without any started task", v19 object file lineNumber description];

    abort();
  }
  id v20 = v9;
  pushRepository = self->_pushRepository;
  [(NSDate *)self->_taskStartDate timeIntervalSinceNow];
  [(CPLEnginePushRepository *)pushRepository updateTimingStatisticForKey:currentTaskKey duration:self->_recordCount recordCount:v6 error:v5 cancelled:-v12];
  uint64_t v13 = self->_currentTaskKey;
  self->_currentTaskKey = 0;

  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = 0;
}

- (void)_didStartTaskWithKey:(id)a3 recordCount:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = (NSString *)a3;
  if (self->_currentTaskKey)
  {
    if (!_CPLSilentLogging)
    {
      NSUInteger v11 = __CPLTaskOSLogDomain_23358();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        double v12 = NSStringFromSelector(a2);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "%@ called too many times", buf, 0xCu);
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLUploadPushedChangesTask.m"];
    BOOL v15 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, v14, 206, @"%@ called too many times", v15 object file lineNumber description];

    abort();
  }
  self->_currentTaskKey = v7;
  id v8 = v7;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  taskStartDate = self->_taskStartDate;
  self->_taskStartDate = v9;

  self->_recordCount = a4;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineSyncTask *)self delegate];
  LOBYTE(self) = [v5 task:self checkScopeIsValidInTransaction:v4];

  return (char)self;
}

- (CPLUploadPushedChangesTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7 storedTransportGroup:(id)a8 sharedScope:(id)a9 transportScopeMapping:(id)a10 ruleGroup:(int64_t)a11 highPriority:(BOOL)a12 maxBatchSize:(unint64_t)a13 pushRepositoryPriority:(unint64_t)a14 pushRepository:(id)a15
{
  id v21 = a3;
  id v22 = a6;
  id v46 = a8;
  id v45 = a9;
  id v44 = a10;
  id v43 = a15;
  v47.receiver = self;
  v47.super_class = (Class)CPLUploadPushedChangesTask;
  uint64_t v23 = [(CPLEngineScopedTask *)&v47 initWithEngineLibrary:v21 session:a4 clientCacheIdentifier:a5 scope:v22 transportScope:a7];
  if (v23)
  {
    uint64_t v24 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.cpl.pushtotransport", v24);
    locuint64_t k = v23->_lock;
    v23->_locuint64_t k = (OS_dispatch_queue *)v25;

    id v27 = [(CPLEngineSyncTask *)v23 engineLibrary];
    uint64_t v28 = [v27 transport];
    transport = v23->_transport;
    v23->_transport = (CPLEngineTransport *)v28;

    long long v30 = [(CPLEngineSyncTask *)v23 engineLibrary];
    long long v31 = [v30 store];
    uint64_t v32 = [v31 pushRepository];
    pushRepository = v23->_pushRepository;
    v23->_pushRepository = (CPLEnginePushRepository *)v32;

    uint64_t v34 = [(CPLEngineSyncTask *)v23 engineLibrary];
    unint64_t v35 = [v34 store];
    uint64_t v36 = [v35 scopes];
    scopes = v23->_scopes;
    v23->_scopes = (CPLEngineScopeStorage *)v36;

    uint64_t v38 = [v21 scheduler];
    scheduler = v23->_scheduler;
    v23->_scheduler = (CPLEngineScheduler *)v38;

    v23->_taskIteuint64_t m = -1;
    uint64_t v40 = [v22 scopeIdentifier];
    scopeIdentifier = v23->_scopeIdentifier;
    v23->_scopeIdentifier = (NSString *)v40;

    objc_storeStrong((id *)&v23->_storedTransportGroup, a8);
    objc_storeStrong((id *)&v23->_sharedScope, a9);
    objc_storeStrong((id *)&v23->_transportScopeMapping, a10);
    v23->_ruleGroup = a11;
    v23->_highPriority = a12;
    v23->_maxBatchSize = a13;
    v23->_unint64_t pushRepositoryPriority = a14;
    objc_storeStrong((id *)&v23->_pushRepository, a15);
  }

  return v23;
}

+ (void)resetDisabledOverQuotaRule
{
  _overrideDisableOverQuotaRule = 0;
}

+ (void)setDisableOverQuotaRule:(BOOL)a3
{
  _disableOverQuotaRule = a3;
  _overrideDisableOverQuotaRule = 1;
}

+ (BOOL)disableOverQuotaRule
{
  if (_overrideDisableOverQuotaRule == 1) {
    return _disableOverQuotaRule != 0;
  }
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"CPLDisableOverQuotaRule"];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v2 = [v4 BOOLValue];
  }
  else {
    char v2 = 1;
  }

  return v2;
}

@end