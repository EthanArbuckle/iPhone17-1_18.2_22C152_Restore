@interface CPLPullFromTransportScopeTask
- (BOOL)_dequeueFromPendingRecordChecksIfNecessary:(id)a3 error:(id *)a4;
- (BOOL)_fetchRewindSyncAnchorsInScopes:(id)a3 startSyncAnchor:(id)a4 error:(id *)a5;
- (BOOL)_storeRewindSyncAnchors:(id)a3 inScopes:(id)a4 error:(id *)a5;
- (BOOL)checkScopeIsValidInTransaction:(id)a3;
- (CPLPullFromTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7;
- (id)_cloudCacheInStore:(id)a3;
- (id)_transientPullRepositoryInStore:(id)a3;
- (id)scopesForTask;
- (id)taskIdentifier;
- (id)transportScope;
- (unint64_t)_totalAssetCountForScope;
- (void)_addPartnerScope:(id)a3 scopes:(id)a4;
- (void)_cancelAllTasks;
- (void)_checkExtraRecords;
- (void)_checkExtraRecordsWithScopedIdentifiers:(id)a3;
- (void)_checkServerFeatureVersionWithCompletionHandler:(id)a3;
- (void)_extractAndMingleAssetsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4;
- (void)_extractAndMinglePersonsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4;
- (void)_fetchInitialSyncAnchor;
- (void)_handleNewBatchFromChanges:(id)a3 newSyncAnchor:(id)a4 inTransaction:(id)a5;
- (void)_handleNewBatchFromChanges:(id)a3 updatedFlags:(id)a4 newSyncAnchor:(id)a5 partnerScopesNeedingToPullChanges:(id)a6;
- (void)_handleNewBatchFromQuery:(id)a3 newCursor:(id)a4 inTransaction:(id)a5;
- (void)_handleNewBatchFromQuery:(id)a3 queryClass:(Class)a4 newCursor:(id)a5;
- (void)_launch;
- (void)_launchFetchChangesFromSyncAnchor:(id)a3;
- (void)_launchNextQueryTask;
- (void)_launchPullTasksAndDisableQueries:(BOOL)a3;
- (void)_launchQueryForClass:(Class)a3 cursor:(id)a4;
- (void)_notePartnerScopesNeedingToPullChanges:(id)a3 scopes:(id)a4 inTransaction:(id)a5;
- (void)_notifySchedulerPullQueueIsFull;
- (void)_notifySchedulerPullQueueIsFullNowIfNecessary;
- (void)_reallyNotifySchedulerPullQueueIsFull;
- (void)_relaunchFetchChangesFromOtherRewindSyncAnchors;
- (void)_storeInitialSyncAnchorIfNecessaryInTransaction:(id)a3;
- (void)_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:(id)a3;
- (void)cancel;
- (void)launch;
- (void)taskDidFinishWithError:(id)a3;
@end

@implementation CPLPullFromTransportScopeTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_allowsMinglingChangeWithScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_checkRecordsTask, 0);
  objc_storeStrong((id *)&self->_stagingTransportScope, 0);
  objc_storeStrong((id *)&self->_stagingScope, 0);
  objc_storeStrong((id *)&self->_updateTransportScope, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_fetchInitialSyncAnchorTask, 0);
  objc_storeStrong((id *)&self->_initialScopeChange, 0);
  objc_storeStrong((id *)&self->_initialSyncAnchor, 0);
  objc_storeStrong((id *)&self->_otherRewindSyncAnchors, 0);
  objc_storeStrong((id *)&self->_transportGroup, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_rewindSyncAnchor, 0);
  objc_storeStrong((id *)&self->_currentScopeChange, 0);
  objc_storeStrong((id *)&self->_queryTask, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_transientPullRepository, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_finalListOfPartnerScopesNeedingToPullChanges, 0);
  objc_storeStrong((id *)&self->_allPartnerScopeIdentifiersNeedingToPullChanges, 0);
  objc_storeStrong((id *)&self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges, 0);
  objc_storeStrong((id *)&self->_partnerScopes, 0);
  objc_storeStrong((id *)&self->_primaryScope, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_transportScopeMapping, 0);
  objc_storeStrong((id *)&self->_endTaskError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)taskIdentifier
{
  return @"engine.sync.pullfromtransport";
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPullFromTransportScopeTask;
  [(CPLEngineSyncTask *)&v3 cancel];
  [(CPLPullFromTransportScopeTask *)self _cancelAllTasks];
}

- (void)taskDidFinishWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (NSError *)a3;
  [(CPLPullFromTransportScopeTask *)self hash];
  kdebug_trace();
  [(CPLPullFromTransportScopeTask *)self _notifySchedulerPullQueueIsFullNowIfNecessary];
  endTaskError = self->_endTaskError;
  if (endTaskError)
  {
    v6 = endTaskError;

    v4 = v6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  if (![(NSError *)v4 isCPLErrorWithCode:33])
  {
    if ([(NSError *)v4 isCPLErrorWithCode:23])
    {
      v12 = [(CPLEngineSyncTask *)self engineLibrary];
      v13 = [(CPLEngineScopedTask *)self scope];
      v14 = [v13 scopeIdentifier];
      v15 = [v12 mainScopeIdentifier];
      int v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        if (!_CPLSilentLogging)
        {
          v17 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [v12 mainScopeIdentifier];
            v19 = [v12 libraryIdentifier];
            *(_DWORD *)buf = 138543618;
            v27 = v18;
            __int16 v28 = 2114;
            v29 = v19;
            _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Main scope (%{public}@) for %{public}@ seems to have been wiped - notifying engine status immediately", buf, 0x16u);
          }
        }
        v20 = [(CPLEngineSyncTask *)self engineLibrary];
        [v20 setICloudLibraryHasBeenWiped:1];
      }
    }
    goto LABEL_18;
  }
  v7 = [(CPLEngineSyncTask *)self session];
  v8 = [(CPLEngineScopedTask *)self scope];
  v9 = [v8 scopeIdentifier];
  [v7 excludeScopeIdentifierFromMingling:v9];

LABEL_6:
  if ([(CPLEngineSyncTask *)self isCancelled] || self->_taskItem == -1)
  {
    v4 = 0;
LABEL_18:
    v21.receiver = self;
    v21.super_class = (Class)CPLPullFromTransportScopeTask;
    [(CPLEngineSyncTask *)&v21 taskDidFinishWithError:v4];
    goto LABEL_19;
  }
  v10 = [(CPLEngineScopedTask *)self store];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke;
  v23[3] = &unk_1E60AB550;
  id v24 = v10;
  v25 = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_140;
  v22[3] = &unk_1E60AB578;
  v22[4] = self;
  v4 = v10;
  id v11 = (id)[(NSError *)v4 performWriteTransactionWithBlock:v23 completionHandler:v22];

LABEL_19:
}

void __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) scopes];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_2;
  v21[3] = &unk_1E60AB750;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  id v22 = v5;
  uint64_t v23 = v6;
  [v3 do:v21];
  if ([*(id *)(*(void *)(a1 + 40) + 168) count]) {
    [*(id *)(a1 + 40) _notePartnerScopesNeedingToPullChanges:*(void *)(*(void *)(a1 + 40) + 168) scopes:v5 inTransaction:v3];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 152) count])
  {
    id v15 = v5;
    id v16 = v3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 40) + 152);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          if (!_CPLSilentLogging)
          {
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            v13 = __CPLTaskOSLogDomain_22279();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = [*(id *)(a1 + 40) scope];
              *(_DWORD *)buf = 138412546;
              uint64_t v25 = v12;
              __int16 v26 = 2112;
              v27 = v14;
              _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) does not need to pull changes according to sync obligations", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v28 count:16];
      }
      while (v9);
    }

    id v5 = v15;
    id v3 = v16;
  }
}

void __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 error];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v3 error];
    v17.receiver = v5;
    v17.super_class = (Class)CPLPullFromTransportScopeTask;
    objc_msgSendSuper2(&v17, sel_taskDidFinishWithError_, v6);
  }
  else
  {
    id v7 = (void *)v5[20];
    if (v7)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v8 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 160) componentsJoinedByString:@", "];
          uint64_t v10 = [*(id *)(a1 + 32) scope];
          *(_DWORD *)buf = 138543618;
          long long v19 = v9;
          __int16 v20 = 2112;
          objc_super v21 = v10;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Will retry sync session to pull changes from %{public}@ (partner of %@)", buf, 0x16u);
        }
        id v5 = *(void **)(a1 + 32);
        id v7 = (void *)v5[20];
      }
      id v11 = [v7 componentsJoinedByString:@", "];
      uint64_t v12 = [*(id *)(a1 + 32) scope];
      v13 = [v12 scopeIdentifier];
      v14 = +[CPLErrors cplErrorWithCode:10000, @"Fulfilling sync obligation for %@ (partner with %@)", v11, v13 description];
      v16.receiver = v5;
      v16.super_class = (Class)CPLPullFromTransportScopeTask;
      objc_msgSendSuper2(&v16, sel_taskDidFinishWithError_, v14);
    }
    else
    {
      v15.receiver = *(id *)(a1 + 32);
      v15.super_class = (Class)CPLPullFromTransportScopeTask;
      objc_msgSendSuper2(&v15, sel_taskDidFinishWithError_, 0);
    }
  }
}

uint64_t __56__CPLPullFromTransportScopeTask_taskDidFinishWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) scope];
  uint64_t v6 = [v4 setScope:v5 hasCompletedPullFromTransportTask:*(void *)(*(void *)(a1 + 40) + 296) error:a2];

  return v6;
}

- (void)launch
{
  [(CPLPullFromTransportScopeTask *)self hash];
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CPLPullFromTransportScopeTask;
  [(CPLEngineSyncTask *)&v3 launch];
  [(CPLPullFromTransportScopeTask *)self _launch];
}

- (void)_launch
{
  objc_super v3 = [(CPLEngineSyncTask *)self engineLibrary];
  v4 = [v3 syncManager];
  self->_useCourtesyMingling = [v4 shouldTryToMingleImmediately];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__CPLPullFromTransportScopeTask__launch__block_invoke;
  v5[3] = &unk_1E60AB8A0;
  v5[4] = self;
  [(CPLPullFromTransportScopeTask *)self _checkServerFeatureVersionWithCompletionHandler:v5];
}

void __40__CPLPullFromTransportScopeTask__launch__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 taskDidFinishWithError:a2];
  }
  else
  {
    int v4 = [v3 isCancelled];
    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      id v10 = +[CPLErrors operationCancelledError];
      [v5 taskDidFinishWithError:v10];
    }
    else
    {
      uint64_t v6 = (void *)v5[13];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __40__CPLPullFromTransportScopeTask__launch__block_invoke_2;
      v11[3] = &unk_1E60A5DD8;
      v11[4] = v5;
      id v7 = v11;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_22296;
      block[3] = &unk_1E60A6978;
      id v13 = v7;
      uint64_t v8 = v6;
      dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v8, v9);
    }
  }
}

void __40__CPLPullFromTransportScopeTask__launch__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  objc_super v3 = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    id v4 = +[CPLErrors operationCancelledError];
    [v3 taskDidFinishWithError:v4];
  }
  else if (v3[304])
  {
    [v3 _launchPullTasksAndDisableQueries:0];
  }
  else
  {
    [v3 _fetchInitialSyncAnchor];
  }
}

- (void)_checkServerFeatureVersionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(CPLEngineSyncTask *)self setPhaseDescription:@"checking feature version"];
  id v5 = [(CPLEngineScopedTask *)self store];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E60AB550;
  id v12 = v5;
  id v13 = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_134;
  v9[3] = &unk_1E60AB2A0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = (id)[v7 performWriteTransactionWithBlock:v11 completionHandler:v9];
}

void __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v110[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) scopes];
  id v5 = [*(id *)(a1 + 40) scope];
  uint64_t v6 = [v4 stagingScopeForScope:v5];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 360);
  *(void *)(v7 + 360) = v6;

  dispatch_block_t v9 = *(void **)(*(void *)(a1 + 40) + 360);
  id v10 = &unk_1E9D43000;
  if (v9) {
    BOOL v11 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v12 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = *(void *)(*(void *)(a1 + 40) + 360);
      *(_DWORD *)buf = 138412546;
      unint64_t v101 = v13;
      __int16 v102 = 2112;
      uint64_t v103 = (uint64_t)v5;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Will pull changes from %@ on behalf of %@", buf, 0x16u);
    }

    dispatch_block_t v9 = *(void **)(*(void *)(a1 + 40) + 360);
  }
  if (v9) {
    v14 = v9;
  }
  else {
    v14 = v5;
  }
  if ([v4 valueForFlag:36 forScope:v14])
  {
    if (!_CPLSilentLogging)
    {
      objc_super v15 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v101 = (unint64_t)v5;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "%@ is meant to be deleted - ignoring", buf, 0xCu);
      }
    }
    objc_super v16 = [v5 scopeIdentifier];
    v94 = v16;
    objc_super v17 = @"%@ is deleted";
    uint64_t v18 = 33;
    goto LABEL_18;
  }
  if (![*(id *)(a1 + 40) checkScopeIsValidInTransaction:v3]) {
    goto LABEL_28;
  }
  if (*(void *)(*(void *)(a1 + 40) + 360))
  {
    uint64_t v20 = objc_msgSend(v4, "transportScopeForScope:");
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void **)(v21 + 368);
    *(void *)(v21 + 368) = v20;

    if (!*(void *)(*(void *)(a1 + 40) + 368))
    {
      if (!_CPLSilentLogging)
      {
        v41 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          unint64_t v42 = *(void *)(*(void *)(a1 + 40) + 360);
          *(_DWORD *)buf = 138412546;
          unint64_t v101 = v42;
          __int16 v102 = 2112;
          uint64_t v103 = (uint64_t)v5;
          _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_ERROR, "%@ (staging %@) has no transport scope and will need to be updated first", buf, 0x16u);
        }
      }
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_122;
      v97[3] = &unk_1E60AB750;
      id v43 = v4;
      uint64_t v44 = *(void *)(a1 + 40);
      id v98 = v43;
      uint64_t v99 = v44;
      [v3 do:v97];
      objc_super v16 = v98;
      goto LABEL_19;
    }
  }
  uint64_t v23 = [CPLTransportScopeMapping alloc];
  id v24 = [*(id *)(a1 + 40) engineLibrary];
  uint64_t v25 = [v24 transport];
  uint64_t v26 = [(CPLTransportScopeMapping *)v23 initWithTranslator:v25];
  uint64_t v27 = *(void *)(a1 + 40);
  __int16 v28 = *(void **)(v27 + 120);
  *(void *)(v27 + 120) = v26;

  uint64_t v29 = *(void **)(a1 + 40);
  uint64_t v30 = (void *)v29[15];
  v31 = [v29 transportScope];
  v32 = [v5 scopeIdentifier];
  [v30 addTransportScope:v31 forScopeWithIdentifier:v32];

  uint64_t v33 = [v4 sharingScopeForScope:v5];
  uint64_t v34 = *(void *)(a1 + 40);
  v35 = *(void **)(v34 + 128);
  *(void *)(v34 + 128) = v33;

  if (!*(void *)(*(void *)(a1 + 40) + 128))
  {
LABEL_46:
    v50 = [*(id *)(a1 + 32) pendingRecordChecks];
    v51 = [v5 scopeIdentifier];
    *(unsigned char *)(*(void *)(a1 + 40) + 376) = [v50 hasRecordsToCheckWithScopeIdentifier:v51];

    if (*(unsigned char *)(*(void *)(a1 + 40) + 376) && !v10[2752])
    {
      v52 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v52, OS_LOG_TYPE_DEFAULT, "Will need to check some extra records at the end", buf, 2u);
      }
    }
    if (([v5 scopeType] & 0xFFFFFFFFFFFFFFFELL) != 4) {
      goto LABEL_65;
    }
    uint64_t v53 = [v4 primaryScope];
    uint64_t v54 = *(void *)(a1 + 40);
    v55 = *(void **)(v54 + 136);
    *(void *)(v54 + 136) = v53;

    if (!*(void *)(*(void *)(a1 + 40) + 136)) {
      goto LABEL_65;
    }
    objc_super v16 = objc_msgSend(v4, "sharingScopeForScope:");
    uint64_t v56 = [v16 scopeIdentifier];
    v57 = [v5 scopeIdentifier];
    unint64_t v58 = (unint64_t)v57;
    if (v56 && v57)
    {
      char v59 = [(id)v56 isEqual:v57];

      if ((v59 & 1) == 0) {
        goto LABEL_63;
      }
    }
    else
    {

      if (v56 | v58)
      {
LABEL_63:
        uint64_t v62 = *(void *)(a1 + 40);
        v63 = *(void **)(v62 + 136);
        *(void *)(v62 + 136) = 0;
LABEL_64:

LABEL_65:
        *(unsigned char *)(*(void *)(a1 + 40) + 304) = [v4 hasScopeFetchedInitialSyncAnchor:v5];
        if (!(*(unsigned __int8 *)(*(void *)(a1 + 40) + 304) | _CPLSilentLogging))
        {
          v64 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = [v5 scopeIdentifier];
            *(_DWORD *)buf = 138412290;
            unint64_t v101 = (unint64_t)v65;
            _os_log_impl(&dword_1B4CAC000, v64, OS_LOG_TYPE_DEFAULT, "Will need to fetch initial sync anchor before queries for %@", buf, 0xCu);
          }
        }
        uint64_t v66 = [v4 scopeChangeForScope:v5];
        uint64_t v67 = *(void *)(a1 + 40);
        v68 = *(void **)(v67 + 216);
        *(void *)(v67 + 216) = v66;

        v69 = [*(id *)(*(void *)(a1 + 40) + 216) libraryInfo];
        objc_super v16 = v69;
        if (v69)
        {
          v70 = [v69 featureVersionHistory];
          unint64_t v71 = [v4 supportedFeatureVersionInLastSyncForScope:v5];
          uint64_t v72 = [v70 currentFeatureVersion];
          if (v71 <= 0x13)
          {
            unint64_t v73 = v72;
            v74 = [v5 scopeIdentifier];
            if (v73 <= v71)
            {
              id v96 = 0;
              char v82 = [v4 storeSupportedFeatureVersionInLastSync:20 forScope:v5 error:&v96];
              id v77 = v96;
              if ((v82 & 1) == 0)
              {
                if (!_CPLSilentLogging)
                {
                  v83 = __CPLTaskOSLogDomain_22279();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    unint64_t v101 = (unint64_t)v74;
                    __int16 v102 = 2112;
                    uint64_t v103 = (uint64_t)v77;
                    _os_log_impl(&dword_1B4CAC000, v83, OS_LOG_TYPE_ERROR, "Unable to store supported feature version for %@: %@", buf, 0x16u);
                  }
                }
                [v3 setError:v77];
              }
            }
            else
            {
              unint64_t v75 = v71 + 1;
              uint64_t v76 = [v70 syncAnchorForFeatureVersion:v71 + 1];
              id obj = (id)v76;
              if (v76)
              {
                id v77 = (id)v76;
                if (!_CPLSilentLogging)
                {
                  v78 = __CPLTaskOSLogDomain_22279();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218754;
                    unint64_t v101 = v75;
                    __int16 v102 = 2048;
                    uint64_t v103 = 20;
                    __int16 v104 = 2112;
                    v105 = v70;
                    __int16 v106 = 2112;
                    v107 = v74;
                    _os_log_impl(&dword_1B4CAC000, v78, OS_LOG_TYPE_DEFAULT, "Will need to rewind sync anchor and fetch changes to catch up with changes from %lu to %lu using version history %@ in %@", buf, 0x2Au);
                  }
                }
                *(void *)(*(void *)(a1 + 40) + 240) = v75;
                objc_storeStrong((id *)(*(void *)(a1 + 40) + 248), obj);
                uint64_t v79 = *(void *)(a1 + 40);
                id v80 = v70;
                v81 = *(void **)(v79 + 256);
                *(void *)(v79 + 256) = v80;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  v88 = __CPLTaskOSLogDomain_22279();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218498;
                    unint64_t v101 = v71 + 1;
                    __int16 v102 = 2048;
                    uint64_t v103 = 20;
                    __int16 v104 = 2112;
                    v105 = v74;
                    _os_log_impl(&dword_1B4CAC000, v88, OS_LOG_TYPE_DEFAULT, "Needs to re-fetch everything to catch up with changes from %lu to %lu in %@", buf, 0x20u);
                  }
                }
                v81 = objc_msgSend([NSString alloc], "initWithFormat:", @"Last supported feature version was %lu - server version is: %lu", v71, v73);
                v109[1] = @"CPLErrorScopeIdentifiers";
                v110[0] = v81;
                v109[0] = @"CPLErrorResetReason";
                v108 = v74;
                v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
                v110[1] = v89;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];
                v91 = v90 = v74;
                v92 = +[CPLErrors cplErrorWithCode:24 underlyingError:0 userInfo:v91 description:@"Sync state needs a refresh"];
                [v3 setError:v92];

                v74 = v90;
                id v77 = 0;
              }
            }
          }
        }
        goto LABEL_19;
      }
    }
    if ([v4 valueForFlag:36 forScope:*(void *)(*(void *)(a1 + 40) + 136)])
    {
      if (!_CPLSilentLogging)
      {
        v60 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v61 = *(void *)(*(void *)(a1 + 40) + 136);
          *(_DWORD *)buf = 138412290;
          unint64_t v101 = v61;
          _os_log_impl(&dword_1B4CAC000, v60, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
        }
      }
      goto LABEL_63;
    }
    uint64_t v84 = [v4 transportScopeForScope:*(void *)(*(void *)(a1 + 40) + 136)];
    if (v84)
    {
      v63 = (void *)v84;
      uint64_t v85 = *(void *)(a1 + 40);
      v86 = *(void **)(v85 + 120);
      v87 = [*(id *)(v85 + 136) scopeIdentifier];
      [v86 addTransportScope:v63 forScopeWithIdentifier:v87];

      [*(id *)(a1 + 40) _addPartnerScope:*(void *)(*(void *)(a1 + 40) + 136) scopes:v4];
      goto LABEL_64;
    }
    if (!_CPLSilentLogging)
    {
      v45 = __CPLTaskOSLogDomain_22279();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      unint64_t v93 = *(void *)(*(void *)(a1 + 40) + 136);
      *(_DWORD *)buf = 138412290;
      unint64_t v101 = v93;
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  objc_super v16 = objc_msgSend(v4, "flagsForScope:");
  if ([v16 valueForFlag:36] && (objc_msgSend(v16, "valueForFlag:", 64) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v47 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v48 = *(void *)(*(void *)(a1 + 40) + 128);
        *(_DWORD *)buf = 138412290;
        unint64_t v101 = v48;
        _os_log_impl(&dword_1B4CAC000, v47, OS_LOG_TYPE_DEFAULT, "%@ is deleted - ignoring it", buf, 0xCu);
      }
    }
    uint64_t v49 = *(void *)(a1 + 40);
    v37 = *(void **)(v49 + 128);
    *(void *)(v49 + 128) = 0;
    goto LABEL_45;
  }
  uint64_t v36 = [v4 transportScopeForScope:*(void *)(*(void *)(a1 + 40) + 128)];
  if (v36)
  {
    v37 = (void *)v36;
    uint64_t v38 = *(void *)(a1 + 40);
    v39 = *(void **)(v38 + 120);
    v40 = [*(id *)(v38 + 128) scopeIdentifier];
    [v39 addTransportScope:v37 forScopeWithIdentifier:v40];

    id v10 = (unsigned char *)&unk_1E9D43000;
    [*(id *)(a1 + 40) _addPartnerScope:*(void *)(*(void *)(a1 + 40) + 128) scopes:v4];
LABEL_45:

    goto LABEL_46;
  }
  if (!_CPLSilentLogging)
  {
    v45 = __CPLTaskOSLogDomain_22279();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_38:

      goto LABEL_39;
    }
    unint64_t v46 = *(void *)(*(void *)(a1 + 40) + 128);
    *(_DWORD *)buf = 138412290;
    unint64_t v101 = v46;
LABEL_37:
    _os_log_impl(&dword_1B4CAC000, v45, OS_LOG_TYPE_ERROR, "Missing transport scope for %@", buf, 0xCu);
    goto LABEL_38;
  }
LABEL_39:
  objc_super v17 = @"missing shared transport scope";
  uint64_t v18 = 32;
LABEL_18:
  long long v19 = +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", v18, v17, v94);
  [v3 setError:v19];

LABEL_19:
LABEL_28:
}

void __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_134(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [v9 error];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = +[CPLErrors operationCancelledError];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) session];
    int v7 = [v6 shouldDefer];

    if (v7)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = +[CPLErrors sessionHasBeenDeferredError];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 40);
      if (*(void *)(*(void *)(a1 + 32) + 120)) {
        [v9 error];
      }
      else {
      uint64_t v5 = +[CPLErrors cplErrorWithCode:10000 description:@"Some transport scopes are missing"];
      }
    }
  }
  id v8 = (void *)v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
}

uint64_t __81__CPLPullFromTransportScopeTask__checkServerFeatureVersionWithCompletionHandler___block_invoke_122(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setScopeNeedsUpdateFromTransport:*(void *)(*(void *)(a1 + 40) + 360) error:a2];
}

- (void)_addPartnerScope:(id)a3 scopes:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 mostCurrentChangesSyncAnchorForScope:v6];
  if (v8)
  {
    if ([v7 doesScopeNeedToPullChangesFromTransport:v6])
    {
      if (!_CPLSilentLogging)
      {
        id v9 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [(CPLEngineScopedTask *)self scope];
          int v20 = 138412546;
          id v21 = v6;
          __int16 v22 = 2112;
          uint64_t v23 = v10;
          BOOL v11 = "%@ (partner with %@) is already scheduled to pull changes. Not using sync obligations";
LABEL_9:
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, 0x16u);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v13 = [(CPLEngineScopedTask *)self scope];
          v14 = [v8 cplSyncAnchorDescription];
          int v20 = 138412802;
          id v21 = v6;
          __int16 v22 = 2112;
          uint64_t v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v14;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) might need to pull changes from %@. Using sync obligations to determine that", (uint8_t *)&v20, 0x20u);
        }
      }
      partnerScopes = self->_partnerScopes;
      if (!partnerScopes)
      {
        objc_super v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_super v17 = self->_partnerScopes;
        self->_partnerScopes = v16;

        uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
        self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = v18;

        partnerScopes = self->_partnerScopes;
      }
      [(NSMutableArray *)partnerScopes addObject:v6];
      [(NSMutableDictionary *)self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges setObject:v8 forKeyedSubscript:v6];
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v9 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(CPLEngineScopedTask *)self scope];
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      BOOL v11 = "%@ (partner with %@) has not pulled changes yet. Not using sync obligations";
      goto LABEL_9;
    }
LABEL_10:
  }
}

- (void)_fetchInitialSyncAnchor
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(CPLEngineSyncTask *)self setPhaseDescription:@"fetching initial sync anchor"];
  id v3 = [(CPLEngineSyncTask *)self engineLibrary];
  uint64_t v4 = [v3 transport];

  uint64_t v5 = [(CPLPullFromTransportScopeTask *)self transportScope];
  id v6 = [(CPLEngineScopedTask *)self scope];
  currentScopeChange = self->_currentScopeChange;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke;
  v16[3] = &unk_1E60AB270;
  v16[4] = self;
  id v8 = [v4 getCurrentSyncAnchorWithTransportScope:v5 scope:v6 previousScopeChange:currentScopeChange completionHandler:v16];
  fetchInitialSyncAnchorTask = self->_fetchInitialSyncAnchorTask;
  self->_fetchInitialSyncAnchorTask = v8;

  if (!_CPLSilentLogging)
  {
    id v10 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = self->_fetchInitialSyncAnchorTask;
      int v12 = [(CPLEngineTransportGetCurrentSyncAnchorTask *)v11 foreground];
      unint64_t v13 = " with background priority";
      if (v12) {
        unint64_t v13 = " with foreground priority";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      int v20 = v13;
      _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
    }
  }
  v14 = self->_fetchInitialSyncAnchorTask;
  objc_super v15 = [v4 createGroupForLibraryStateCheck];
  [(CPLEngineSyncTask *)self launchTransportTask:v14 withTransportGroup:v15];
}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 104);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2;
  v22[3] = &unk_1E60A66D8;
  id v23 = v12;
  uint64_t v24 = v13;
  id v25 = v9;
  id v26 = v10;
  id v27 = v11;
  objc_super v15 = v22;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v29 = v15;
  objc_super v16 = v14;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  id v20 = v12;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v21);
}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "taskDidFinishWithError:");
  }
  else
  {
    int v4 = [v2 isCancelled];
    uint64_t v5 = *(unsigned char **)(a1 + 40);
    if (v4)
    {
      id v6 = +[CPLErrors operationCancelledError];
      [v5 taskDidFinishWithError:v6];
    }
    else
    {
      v5[305] = 1;
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 312), *(id *)(a1 + 48));
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 320), *(id *)(a1 + 56));
      if (CPLEnableWorkaroundFor101242629())
      {
        if (*(void *)(*(void *)(a1 + 40) + 128))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = *(id *)(a1 + 56);
            id v8 = [v7 rewindAnchorsPerSharingScopes];
            id v9 = [*(id *)(*(void *)(a1 + 40) + 128) scopeIdentifier];
            id v10 = [v8 objectForKeyedSubscript:v9];

            if (v10)
            {
              if (!_CPLSilentLogging)
              {
                id v11 = __CPLTaskOSLogDomain_22279();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
                {
                  id v12 = [*(id *)(*(void *)(a1 + 40) + 128) scopeIdentifier];
                  uint64_t v13 = [v7 scopeIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v52 = v12;
                  __int16 v53 = 2114;
                  uint64_t v54 = v13;
                  _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Will use rewind sync anchor for %{public}@ after initial queries for %{public}@", buf, 0x16u);
                }
              }
              uint64_t v14 = *(void *)(a1 + 40);
              id v15 = v10;
              objc_super v16 = *(void **)(v14 + 312);
              *(void *)(v14 + 312) = v15;
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                id v17 = __CPLTaskOSLogDomain_22279();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  id v18 = [*(id *)(*(void *)(a1 + 40) + 128) scopeIdentifier];
                  id v19 = [v7 scopeIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v52 = v18;
                  __int16 v53 = 2114;
                  uint64_t v54 = v19;
                  _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Rewind sync anchor for %{public}@ is missing in %{public}@: will need to fetch full journal after initial queries", buf, 0x16u);
                }
              }
              uint64_t v20 = *(void *)(a1 + 40);
              objc_super v16 = *(void **)(v20 + 312);
              *(void *)(v20 + 312) = 0;
            }
          }
        }
      }
      dispatch_block_t v21 = *(void **)(a1 + 64);
      if (v21)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 40) + 352), v21);
        __int16 v22 = *(void **)(a1 + 40);
        id v23 = (void *)v22[15];
        uint64_t v24 = *(void *)(a1 + 64);
        id v25 = [v22 scope];
        id v26 = [v25 scopeIdentifier];
        [v23 addTransportScope:v24 forScopeWithIdentifier:v26];

        id v27 = [*(id *)(a1 + 40) engineLibrary];
        __int16 v28 = [v27 store];

        id v29 = [v28 scopes];
        uint64_t v44 = MEMORY[0x1E4F143A8];
        uint64_t v45 = 3221225472;
        unint64_t v46 = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_112;
        v47 = &unk_1E60AB068;
        id v48 = v29;
        id v30 = *(id *)(a1 + 64);
        uint64_t v31 = *(void *)(a1 + 40);
        id v49 = v30;
        uint64_t v50 = v31;
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_3;
        unint64_t v42 = &unk_1E60AB578;
        uint64_t v43 = v31;
        id v32 = v29;
        id v33 = (id)[v28 performWriteTransactionWithBlock:&v44 completionHandler:&v39];
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v34 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [*(id *)(a1 + 40) scope];
          uint64_t v36 = [*(id *)(*(void *)(a1 + 40) + 312) cplSyncAnchorDescription];
          *(_DWORD *)buf = 138412546;
          v52 = v35;
          __int16 v53 = 2112;
          uint64_t v54 = v36;
          _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Fetched initial sync anchor for %@: %@", buf, 0x16u);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "_launchPullTasksAndDisableQueries:", 0, v39, v40, v41, v42, v43, v44, v45, v46, v47);
    }
  }
  uint64_t v37 = *(void *)(a1 + 40);
  uint64_t v38 = *(void **)(v37 + 328);
  *(void *)(v37 + 328) = 0;
}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_112(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2_113;
  v6[3] = &unk_1E60AAF20;
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 do:v6];
}

void __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 error];

  if (v4 && !_CPLSilentLogging)
  {
    uint64_t v5 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) scope];
      id v7 = [v3 error];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Failed to update transport scope for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __56__CPLPullFromTransportScopeTask__fetchInitialSyncAnchor__block_invoke_2_113(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 48) scope];
  uint64_t v6 = [v3 setTransportScope:v4 forScope:v5 error:a2];

  return v6;
}

- (void)_launchPullTasksAndDisableQueries:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_launchPullTasksAndDisableQueries__onceToken != -1) {
    dispatch_once(&_launchPullTasksAndDisableQueries__onceToken, &__block_literal_global_22347);
  }
  if (_launchPullTasksAndDisableQueries__alwaysDisableQueries) {
    int v5 = 1;
  }
  else {
    int v5 = v3;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = &stru_1F0D5F858;
      if (v5) {
        id v7 = @" without queries";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Launching pull task%@", (uint8_t *)&buf, 0xCu);
    }
  }
  int v8 = [(CPLEngineScopedTask *)self store];
  uint64_t v9 = [v8 scopes];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  dispatch_block_t v21 = __Block_byref_object_copy__22351;
  __int16 v22 = __Block_byref_object_dispose__22352;
  id v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2050000000;
  v18[3] = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_105;
  v13[3] = &unk_1E60AB248;
  v13[4] = self;
  id v10 = v9;
  id v14 = v10;
  p_long long buf = &buf;
  char v17 = v5;
  objc_super v16 = v18;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_2;
  v12[3] = &unk_1E60AB7F0;
  v12[4] = self;
  v12[5] = v18;
  v12[6] = &buf;
  id v11 = (id)[v8 performWriteTransactionWithBlock:v13 completionHandler:v12];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&buf, 8);
}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Preparing to receive batches from transport", buf, 2u);
      }
    }
    if ([*(id *)(a1 + 32) isCancelled])
    {
      int v5 = +[CPLErrors operationCancelledError];
      [v3 setError:v5];
    }
    else
    {
      id v7 = *(unsigned char **)(a1 + 32);
      if (v7[233])
      {
        int v8 = *(void **)(a1 + 40);
        uint64_t v9 = [v7 scope];
        LOBYTE(v8) = [v8 doesScopeAllowCourtesyMingling:v9];

        id v7 = *(unsigned char **)(a1 + 32);
        if ((v8 & 1) == 0)
        {
          v7[233] = 0;
          id v7 = *(unsigned char **)(a1 + 32);
        }
      }
      id v10 = *(void **)(a1 + 40);
      id v11 = [v7 scope];
      uint64_t v12 = [v10 transientSyncAnchorForScope:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if (*(unsigned char *)(a1 + 64))
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_106;
        v47[3] = &unk_1E60AB750;
        id v15 = *(id *)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 32);
        id v48 = v15;
        uint64_t v49 = v16;
        [v3 do:v47];
        char v17 = v48;
      }
      else
      {
        id v18 = *(void **)(a1 + 40);
        char v17 = [*(id *)(a1 + 32) scope];
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v18 classOfRecordsForInitialQueryForScope:v17];
      }

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          uint64_t v36 = *(void **)(a1 + 40);
          uint64_t v37 = [*(id *)(a1 + 32) scope];
          uint64_t v38 = [v36 syncAnchorForScope:v37];
          uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v40 = *(void **)(v39 + 40);
          *(void *)(v39 + 40) = v38;
        }
        [*(id *)(a1 + 32) _storeInitialSyncAnchorIfNecessaryInTransaction:v3];
        if (!_CPLSilentLogging)
        {
          v41 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cplSyncAnchorDescription];
            uint64_t v43 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)long long buf = 138412546;
            v51 = v42;
            __int16 v52 = 2112;
            __int16 v53 = v43;
            _os_log_impl(&dword_1B4CAC000, v41, OS_LOG_TYPE_DEBUG, "Will fetch changes since sync anchor %@ for %@", buf, 0x16u);
          }
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 233) = 0;
        goto LABEL_23;
      }
      if (_CPLSilentLogging)
      {
LABEL_23:
        __int16 v22 = *(void **)(a1 + 32);
        if (!v22[33])
        {
          id v23 = [v3 error];

          __int16 v22 = *(void **)(a1 + 32);
          if (!v23)
          {
            uint64_t v24 = *(void **)(a1 + 40);
            id v25 = [v22 scope];
            uint64_t v26 = [v24 downloadTransportGroupForScope:v25];
            uint64_t v27 = *(void *)(a1 + 32);
            __int16 v28 = *(void **)(v27 + 264);
            *(void *)(v27 + 264) = v26;

            __int16 v22 = *(void **)(a1 + 32);
            if (!v22[33])
            {
              id v29 = [v22 engineLibrary];
              id v30 = [v29 transport];
              uint64_t v31 = [v30 createGroupForChangeDownload];
              uint64_t v32 = *(void *)(a1 + 32);
              id v33 = *(void **)(v32 + 264);
              *(void *)(v32 + 264) = v31;

              __int16 v22 = *(void **)(a1 + 32);
            }
          }
        }
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_107;
        v44[3] = &unk_1E60AB850;
        v44[4] = v22;
        id v34 = *(id *)(a1 + 40);
        uint64_t v35 = *(void *)(a1 + 48);
        id v45 = v34;
        uint64_t v46 = v35;
        [v3 do:v44];

        goto LABEL_28;
      }
      int v5 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cplQueryCursorDescription];
        dispatch_block_t v21 = [*(id *)(a1 + 32) scope];
        *(_DWORD *)long long buf = 138412802;
        v51 = v19;
        __int16 v52 = 2112;
        __int16 v53 = v20;
        __int16 v54 = 2112;
        uint64_t v55 = v21;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Will query records of class %@ since cursor %@ for %@", buf, 0x20u);
      }
    }

    goto LABEL_23;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v6 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Client cache has been reset. Stopping for now", buf, 2u);
    }
  }
LABEL_28:
}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }
  }
  int v5 = [v3 error];

  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = [v3 error];
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) isCancelled];
    uint64_t v6 = *(void **)(a1 + 32);
    if (!v8)
    {
      id v10 = (void *)v6[13];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_108;
      v13[3] = &unk_1E60AB220;
      v13[4] = v6;
      long long v14 = *(_OWORD *)(a1 + 40);
      id v11 = v13;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      char v17 = __cpl_dispatch_async_block_invoke_22296;
      id v18 = &unk_1E60A6978;
      id v19 = v11;
      uint64_t v9 = v10;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v9, v12);

      goto LABEL_11;
    }
    uint64_t v7 = +[CPLErrors operationCancelledError];
  }
  uint64_t v9 = v7;
  [v6 taskDidFinishWithError:v7];
LABEL_11:
}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_108(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  int v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v4) {
    return [v2 _launchQueryForClass:v4 cursor:*(void *)(v5 + 40)];
  }
  else {
    return [v2 _launchFetchChangesFromSyncAnchor:*(void *)(v5 + 40)];
  }
}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_106(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) scope];
  uint64_t v5 = [v3 disableInitialQueriesForScope:v4 error:a2];

  return v5;
}

uint64_t __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke_107(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchRewindSyncAnchorsInScopes:*(void *)(a1 + 40) startSyncAnchor:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:a2];
}

void __67__CPLPullFromTransportScopeTask__launchPullTasksAndDisableQueries___block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _launchPullTasksAndDisableQueries__alwaysDisableQueries = [v0 BOOLForKey:@"CPLDisableQueries"];

  if (_launchPullTasksAndDisableQueries__alwaysDisableQueries) {
    BOOL v1 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    int v2 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Queries are disabled for this user", v3, 2u);
    }
  }
}

- (void)_launchNextQueryTask
{
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Launch pull task", buf, 2u);
    }
  }
  uint64_t v4 = [(CPLEngineScopedTask *)self store];
  *(void *)long long buf = 0;
  long long v14 = buf;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__22351;
  char v17 = __Block_byref_object_dispose__22352;
  id v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2050000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke;
  v8[3] = &unk_1E60AB1F8;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = v12;
  id v11 = buf;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_93;
  v7[3] = &unk_1E60AB7F0;
  v7[4] = self;
  v7[5] = v12;
  v7[6] = buf;
  id v6 = (id)[v5 performWriteTransactionWithBlock:v8 completionHandler:v7];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(buf, 8);
}

void __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Looking for next class to query", buf, 2u);
      }
    }
    if (![*(id *)(a1 + 32) isCancelled])
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      __int16 v22 = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_92;
      id v23 = &unk_1E60AB750;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 32);
      id v24 = v6;
      uint64_t v25 = v7;
      [v3 do:&v20];
      objc_msgSend(*(id *)(a1 + 32), "_storeInitialSyncAnchorIfNecessaryInTransaction:", v3, v20, v21, v22, v23);
      int v8 = [*(id *)(a1 + 40) scopes];
      id v9 = [*(id *)(a1 + 32) scope];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 classOfRecordsForInitialQueryForScope:v9];

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (!_CPLSilentLogging)
        {
          id v10 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            dispatch_block_t v12 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v27 = v11;
            __int16 v28 = 2112;
            id v29 = v12;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Will query records of class %@ for %@", buf, 0x16u);
          }
LABEL_15:
        }
      }
      else
      {
        uint64_t v13 = [*(id *)(a1 + 40) scopes];
        long long v14 = [*(id *)(a1 + 32) scope];
        uint64_t v15 = [v13 transientSyncAnchorForScope:v14];
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
        char v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        if (!_CPLSilentLogging)
        {
          id v10 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            id v18 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cplSyncAnchorDescription];
            id v19 = [*(id *)(a1 + 32) scope];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v27 = v18;
            __int16 v28 = 2112;
            id v29 = v19;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Will fetch changes since sync anchor %@ for %@", buf, 0x16u);
          }
          goto LABEL_15;
        }
      }

      goto LABEL_17;
    }
  }
  id v5 = +[CPLErrors operationCancelledError];
  [v3 setError:v5];

LABEL_17:
}

void __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Committed", buf, 2u);
    }
  }
  id v5 = [v3 error];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = [v3 error];
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) isCancelled];
    id v6 = *(void **)(a1 + 32);
    if (!v8)
    {
      id v10 = (void *)v6[13];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_94;
      v13[3] = &unk_1E60AB220;
      v13[4] = v6;
      long long v14 = *(_OWORD *)(a1 + 40);
      id v11 = v13;
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      char v17 = __cpl_dispatch_async_block_invoke_22296;
      id v18 = &unk_1E60A6978;
      id v19 = v11;
      id v9 = v10;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v9, v12);

      goto LABEL_11;
    }
    uint64_t v7 = +[CPLErrors operationCancelledError];
  }
  id v9 = v7;
  [v6 taskDidFinishWithError:v7];
LABEL_11:
}

uint64_t __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_94(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  int v2 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v4) {
    return [v2 _launchQueryForClass:v4 cursor:*(void *)(v5 + 40)];
  }
  else {
    return [v2 _launchFetchChangesFromSyncAnchor:*(void *)(v5 + 40)];
  }
}

uint64_t __53__CPLPullFromTransportScopeTask__launchNextQueryTask__block_invoke_92(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) scopes];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = v5[28];
  uint64_t v7 = [v5 scope];
  uint64_t v8 = [v4 markInitialQueryIsDoneForRecordsOfClass:v6 forScope:v7 error:a2];

  return v8;
}

- (void)_launchQueryForClass:(Class)a3 cursor:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"running query for %@", a3];
  [(CPLEngineSyncTask *)self setPhaseDescription:v8];

  if (!_CPLSilentLogging)
  {
    id v9 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "Launching transport download task", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  uint64_t v31 = buf;
  uint64_t v32 = 0x2020000000;
  CFAbsoluteTime Current = 0.0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  self->_didNotifySchedulerPullQueueIsFullOnce = 0;
  transport = self->_transport;
  id v11 = [(CPLEngineScopedTask *)self scope];
  transportScopeMapping = self->_transportScopeMapping;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke;
  v26[3] = &unk_1E60AB180;
  v26[4] = self;
  __int16 v28 = buf;
  id v13 = v7;
  id v27 = v13;
  Class v29 = a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_84;
  v25[3] = &unk_1E60AB1D0;
  v25[4] = self;
  v25[5] = a3;
  long long v14 = [(CPLEngineTransport *)transport queryTaskForCursor:v13 class:a3 scope:v11 transportScopeMapping:transportScopeMapping progressHandler:v26 completionHandler:v25];
  queryTask = self->_queryTask;
  self->_queryTask = v14;

  if (!self->_queryTask)
  {
    if (!_CPLSilentLogging)
    {
      __int16 v22 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v34 = 0;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "We should have a query task at this point", v34, 2u);
      }
    }
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m"];
    [v23 handleFailureInMethod:a2 object:self file:v24 lineNumber:1083 description:@"We should have a query task at this point"];

    abort();
  }
  self->_currentQueryClass = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v16 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      char v17 = [(CPLEngineScopedTask *)self scope];
      *(_DWORD *)id v34 = 138412546;
      Class v35 = a3;
      __int16 v36 = 2112;
      uint64_t v37 = v17;
      _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Launching query for %@ in %@", v34, 0x16u);
    }
    if (!_CPLSilentLogging)
    {
      id v18 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = self->_queryTask;
        int v20 = [(CPLEngineTransportQueryTask *)v19 foreground];
        uint64_t v21 = " with background priority";
        if (v20) {
          uint64_t v21 = " with foreground priority";
        }
        *(_DWORD *)id v34 = 138412546;
        Class v35 = v19;
        __int16 v36 = 2080;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEBUG, "Launching %@%s", v34, 0x16u);
      }
    }
  }
  [(CPLEngineSyncTask *)self launchTransportTask:self->_queryTask withTransportGroup:self->_transportGroup];

  _Block_object_dispose(buf, 8);
}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 104);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2;
  v16[3] = &unk_1E60AB158;
  v16[4] = v7;
  id v17 = v5;
  id v18 = v6;
  long long v15 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v15;
  long long v19 = v15;
  uint64_t v20 = *(void *)(a1 + 56);
  id v10 = v16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v22 = v10;
  id v11 = v8;
  id v12 = v6;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 104);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2_85;
  v9[3] = &unk_1E60AB1A8;
  id v10 = v3;
  long long v11 = *(_OWORD *)(a1 + 32);
  id v5 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v13 = v5;
  id v6 = v4;
  id v7 = v3;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v8);
}

uint64_t __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2_85(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    int v2 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = *(void **)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Query task did finish with error %@", (uint8_t *)&v15, 0xCu);
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(void **)(a1 + 48);
        id v6 = [*(id *)(a1 + 40) scope];
        uint64_t v7 = *(void *)(a1 + 32);
        int v15 = 138412802;
        uint64_t v16 = v5;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = v7;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Query task for %@ in %@ did finish with error %@", (uint8_t *)&v15, 0x20u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 208);
  *(void *)(v8 + 208) = 0;

  id v10 = *(void **)(a1 + 32);
  if (!v10) {
    return [*(id *)(a1 + 40) _launchNextQueryTask];
  }
  if (![v10 isCPLErrorWithCode:255]) {
    return [*(id *)(a1 + 40) taskDidFinishWithError:*(void *)(a1 + 32)];
  }
  if (!_CPLSilentLogging)
  {
    long long v11 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 40) scope];
      id v13 = *(void **)(a1 + 48);
      int v15 = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v13;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Transport for %@ does not support queries for %@. Moving to regular initial changes fetch", (uint8_t *)&v15, 0x16u);
    }
  }
  return [*(id *)(a1 + 40) _launchPullTasksAndDisableQueries:1];
}

void __61__CPLPullFromTransportScopeTask__launchQueryForClass_cursor___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 232))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "Query task did get a batch", (uint8_t *)&v20, 2u);
      }

      if (!_CPLSilentLogging)
      {
        uint64_t v8 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = [*(id *)(a1 + 32) scope];
          CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          uint64_t v11 = *(void *)(a1 + 40);
          int v20 = 138412802;
          uint64_t v21 = v9;
          __int16 v22 = 2048;
          CFAbsoluteTime v23 = v10;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ (query) in %.2fs %@", (uint8_t *)&v20, 0x20u);
        }
      }
    }
    *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CFAbsoluteTimeGetCurrent();
    if (![*(id *)(a1 + 40) count]) {
      goto LABEL_29;
    }
    if (*(void *)(a1 + 48))
    {
      id v12 = *(id *)(a1 + 56);
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 48);
      if (v12 && v14)
      {
        int v15 = [v12 isEqual:*(void *)(a1 + 48)];

        if (!v15) {
          goto LABEL_28;
        }
      }
      else
      {

        if (v13 || v14) {
          goto LABEL_28;
        }
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v16 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = [*(id *)(a1 + 48) cplQueryCursorDescription];
          int v20 = 138412290;
          uint64_t v21 = v17;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Got some changes starting from cursor %@ and the new cursor is identical", (uint8_t *)&v20, 0xCu);
        }
      }
    }
LABEL_28:
    id v18 = [*(id *)(a1 + 32) engineLibrary];
    __int16 v19 = [v18 scheduler];
    [v19 resetBackoffInterval];

LABEL_29:
    [*(id *)(a1 + 32) _handleNewBatchFromQuery:*(void *)(a1 + 40) queryClass:*(void *)(a1 + 72) newCursor:*(void *)(a1 + 48)];
    return;
  }
  if (!_CPLSilentLogging)
  {
    int v2 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [*(id *)(a1 + 40) summaryDescription];
      int v20 = 138412290;
      uint64_t v21 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Dropping incoming %@ because we are stopping", (uint8_t *)&v20, 0xCu);
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v4 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [*(id *)(a1 + 32) scope];
        double v6 = *(double *)(a1 + 40);
        int v20 = 138412546;
        uint64_t v21 = v5;
        __int16 v22 = 2112;
        CFAbsoluteTime v23 = v6;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Dropping incoming batch for %@ (query) because we are stopping %@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
}

- (void)_handleNewBatchFromQuery:(id)a3 queryClass:(Class)a4 newCursor:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(CPLEngineScopedTask *)self store];
  dispatch_suspend((dispatch_object_t)self->_queue);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke;
  v16[3] = &unk_1E60AB068;
  v16[4] = self;
  id v17 = v7;
  id v18 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke_2;
  v13[3] = &unk_1E60AB550;
  id v14 = v17;
  int v15 = self;
  id v10 = v17;
  id v11 = v8;
  id v12 = (id)[v9 performWriteTransactionWithBlock:v16 completionHandler:v13];
}

void __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:");
  uint64_t v4 = *(unsigned char **)(a1 + 32);
  if (v3)
  {
    [v4 _storeInitialSyncAnchorIfNecessaryInTransaction:v6];
    id v5 = [v6 error];

    if (!v5) {
      [*(id *)(a1 + 32) _handleNewBatchFromQuery:*(void *)(a1 + 40) newCursor:*(void *)(a1 + 48) inTransaction:v6];
    }
  }
  else
  {
    v4[232] = 1;
  }
}

void __79__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_queryClass_newCursor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = [*(id *)(a1 + 32) count];
        id v7 = [v3 error];
        int v8 = 134218242;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        id v11 = v7;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Can't store batch with %lu changes: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
LABEL_7:
    *(unsigned char *)(*(void *)(a1 + 40) + 232) = 1;
    [*(id *)(a1 + 40) _cancelAllTasks];
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 104));
}

- (void)_storeInitialSyncAnchorIfNecessaryInTransaction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__CPLPullFromTransportScopeTask__storeInitialSyncAnchorIfNecessaryInTransaction___block_invoke;
  v3[3] = &unk_1E60AB410;
  v3[4] = self;
  [a3 do:v3];
}

uint64_t __81__CPLPullFromTransportScopeTask__storeInitialSyncAnchorIfNecessaryInTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) store];
  id v5 = [v4 scopes];

  uint64_t v6 = [*(id *)(a1 + 32) scope];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 304)) {
    goto LABEL_2;
  }
  if (![v5 setHasFetchedInitialSyncAnchor:1 forScope:v6 error:a2])
  {
    uint64_t v7 = 0;
    goto LABEL_27;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 304) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 305))
  {
    *(unsigned char *)(v8 + 305) = 0;
    if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = [v6 scopeIdentifier];
        int v19 = 138412290;
        int v20 = v10;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Storing initial sync anchor for %@", (uint8_t *)&v19, 0xCu);
      }
    }
    int v11 = [v5 setInitialSyncAnchor:*(void *)(*(void *)(a1 + 32) + 312) forScope:v6 error:a2];
    uint64_t v12 = *(void *)(a1 + 32);
    if (v11)
    {
      id v13 = *(void **)(v12 + 320);
      if (v13)
      {
        objc_storeStrong((id *)(v12 + 216), v13);
        uint64_t v7 = [v5 storeScopeChange:*(void *)(*(void *)(a1 + 32) + 320) forScope:v6 error:a2];
        uint64_t v12 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v7 = 1;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v16 = [*(id *)(v12 + 320) libraryState];
    id v14 = v16;
    if (!v7 || !v16) {
      goto LABEL_26;
    }
    if ([v16 isDisabled])
    {
      uint64_t v7 = [v5 setValue:1 forFlag:8 forScope:v6 error:a2];
      id v17 = [v14 disabledDate];
      if (!v7)
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v7 = [v5 setDisabledDate:v17 forScope:v6 error:a2];

      if (!v7)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    id v17 = [v14 deleteDate];
    uint64_t v7 = [v5 setDeleteDate:v17 forScope:v6 error:a2];
    goto LABEL_25;
  }
  if (!_CPLSilentLogging)
  {
    id v14 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [v6 scopeIdentifier];
      int v19 = 138412290;
      int v20 = v15;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Not storing any initial sync anchor for %@ but marking it has being alredy fetched", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v7 = 1;
    goto LABEL_26;
  }
LABEL_2:
  uint64_t v7 = 1;
LABEL_27:

  return v7;
}

- (void)_handleNewBatchFromQuery:(id)a3 newCursor:(id)a4 inTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke;
  v29[3] = &unk_1E60AB750;
  v29[4] = self;
  id v11 = v8;
  id v30 = v11;
  [v10 do:v29];
  uint64_t v12 = [v10 error];

  if (!v12)
  {
    id v13 = [(CPLEngineScopedTask *)self store];
    id v14 = [(CPLPullFromTransportScopeTask *)self _transientPullRepositoryInStore:v13];
    Class currentQueryClass = self->_currentQueryClass;
    if (currentQueryClass == (Class)objc_opt_class())
    {
      [(CPLPullFromTransportScopeTask *)self _extractAndMinglePersonsIfPossibleFromBatch:v11 inTransaction:v10];
    }
    else
    {
      Class v16 = self->_currentQueryClass;
      if (v16 == (Class)objc_opt_class()) {
        [(CPLPullFromTransportScopeTask *)self _extractAndMingleAssetsIfPossibleFromBatch:v11 inTransaction:v10];
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_2;
    v25[3] = &unk_1E60AAF20;
    id v17 = v11;
    id v26 = v17;
    id v27 = v14;
    __int16 v28 = self;
    id v18 = v14;
    [v10 do:v25];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_77;
    v20[3] = &unk_1E60AB778;
    id v21 = v9;
    id v22 = v13;
    CFAbsoluteTime v23 = self;
    id v24 = v17;
    id v19 = v13;
    [v10 do:v20];
  }
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _dequeueFromPendingRecordChecksIfNecessary:*(void *)(a1 + 40) error:a2];
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      *(_DWORD *)uint64_t v7 = 134217984;
      *(void *)&v7[4] = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Storing %lu changes in transient repository", v7, 0xCu);
    }
  }
  *(void *)uint64_t v7 = 0;
  uint64_t result = [*(id *)(a1 + 40) appendBatch:*(void *)(a1 + 32) alreadyMingled:0 countOfAssetChanges:v7 error:a2];
  if (result) {
    *(void *)(*(void *)(a1 + 48) + 392) += *(void *)v7;
  }
  return result;
}

uint64_t __82__CPLPullFromTransportScopeTask__handleNewBatchFromQuery_newCursor_inTransaction___block_invoke_77(id *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [a1[4] cplQueryCursorDescription];
      *(_DWORD *)long long buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Storing transient cursor %@", buf, 0xCu);
    }
  }
  uint64_t v6 = [a1[5] scopes];
  id v7 = a1[4];
  uint64_t v8 = [a1[6] scope];
  uint64_t v9 = [v6 storeTransientSyncAnchor:v7 forScope:v8 error:a2];

  if (v9 && [a1[7] count])
  {
    id v10 = a1[6];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10[49], @"CPLSyncProgressCountOfPulledAssetsKey");
    Class v16 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    LODWORD(v13) = 0.5;
    [v10 taskDidProgress:v12 userInfo:v13];
  }
  return v9;
}

- (void)_launchFetchChangesFromSyncAnchor:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(CPLEngineSyncTask *)self setPhaseDescription:@"fetching changes"];
  if (!self->_rewindSyncAnchor) {
    goto LABEL_4;
  }
  if (v5)
  {
    if ([(CPLFeatureVersionHistory *)self->_versionHistory featureVersionForSyncAnchor:v5] > self->_rewindFeatureVersion)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        uint64_t v6 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Launching transport download task", (uint8_t *)&buf, 2u);
        }
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x2020000000;
      CFAbsoluteTime Current = 0.0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      transport = self->_transport;
      uint64_t v8 = [(CPLEngineScopedTask *)self scope];
      transportScopeMapping = self->_transportScopeMapping;
      currentScopeChange = self->_currentScopeChange;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke;
      v27[3] = &unk_1E60AB0B8;
      v27[4] = self;
      p_long long buf = &buf;
      id v28 = v5;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_67;
      v26[3] = &unk_1E60AB108;
      v26[4] = self;
      id v11 = [(CPLEngineTransport *)transport downloadBatchTaskForSyncAnchor:v28 scope:v8 transportScopeMapping:transportScopeMapping currentScopeChange:currentScopeChange progressHandler:v27 completionHandler:v26];
      downloadTask = self->_downloadTask;
      self->_downloadTask = v11;

      if (!self->_downloadTask)
      {
        if (!_CPLSilentLogging)
        {
          id v22 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v30 = 0;
            _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "We should have a download task at this point", v30, 2u);
          }
        }
        CFAbsoluteTime v23 = [MEMORY[0x1E4F28B00] currentHandler];
        id v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m"];
        [v23 handleFailureInMethod:a2 object:self file:v24 lineNumber:878 description:@"We should have a download task at this point"];

        abort();
      }
      syncAnchorsOfPartnerScopesThatMightNeedToPullChanges = self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_73;
      v25[3] = &unk_1E60AB130;
      void v25[4] = self;
      [(NSMutableDictionary *)syncAnchorsOfPartnerScopesThatMightNeedToPullChanges enumerateKeysAndObjectsUsingBlock:v25];
      if (!_CPLSilentLogging)
      {
        id v14 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v15 = self->_downloadTask;
          int v16 = [(CPLEngineTransportDownloadBatchTask *)v15 foreground];
          id v17 = " with background priority";
          if (v16) {
            id v17 = " with foreground priority";
          }
          *(_DWORD *)id v30 = 138412546;
          uint64_t v31 = v15;
          __int16 v32 = 2080;
          id v33 = v17;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "Launching %@%s", v30, 0x16u);
        }
      }
      [(CPLEngineSyncTask *)self launchTransportTask:self->_downloadTask withTransportGroup:self->_transportGroup];

      _Block_object_dispose(&buf, 8);
      goto LABEL_26;
    }
    if (!_CPLSilentLogging)
    {
      int v20 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(CPLEngineScopedTask *)self scope];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we just caught up with the sync anchor we need", (uint8_t *)&buf, 0xCu);
      }
    }
    [(CPLPullFromTransportScopeTask *)self _updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:v5];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v18 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(CPLEngineScopedTask *)self scope];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we are fetching everything from the beginning", (uint8_t *)&buf, 0xCu);
      }
    }
    [(CPLPullFromTransportScopeTask *)self _updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:0];
  }
LABEL_26:
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = a1[4];
  id v14 = *(void **)(v13 + 104);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2;
  v23[3] = &unk_1E60AB090;
  void v23[4] = v13;
  id v24 = v9;
  uint64_t v15 = (void *)a1[5];
  uint64_t v29 = a1[6];
  id v25 = v11;
  id v26 = v15;
  id v27 = v10;
  id v28 = v12;
  int v16 = v23;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v31 = v16;
  id v17 = v14;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  id v21 = v9;
  dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_67(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 104);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2_68;
  v20[3] = &unk_1E60AB0E0;
  id v21 = v9;
  id v22 = v11;
  uint64_t v23 = v12;
  id v24 = v10;
  char v25 = a4;
  id v14 = v20;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v27 = v14;
  uint64_t v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v9;
  dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v19);
}

uint64_t __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_73(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) addPartnerScope:a2 mostCurrentSyncAnchor:a3];
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2_68(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      int v27 = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEBUG, "Fetch changes task did finish with error %@", (uint8_t *)&v27, 0xCu);
    }
  }
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 isCPLErrorWithCode:22] && _CPLSilentLogging == 0)
    {
      uint64_t v8 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Sync anchor is too old. Will need to download everything from the beginning", (uint8_t *)&v27, 2u);
      }
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(void **)(v9 + 200);
  *(void *)(v9 + 200) = 0;

  if ([*(id *)(a1 + 56) count])
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    uint64_t v13 = *(void **)(v12 + 168);
    if (v13)
    {
      uint64_t v14 = [v13 arrayByAddingObjectsFromArray:v11];
      uint64_t v15 = *(void *)(a1 + 48);
      id v16 = *(void **)(v15 + 168);
      *(void *)(v15 + 168) = v14;
    }
    else
    {
      id v17 = v11;
      id v16 = *(void **)(v12 + 168);
      *(void *)(v12 + 168) = v17;
    }
  }
  if (v6
    || ((id v18 = *(unsigned char **)(a1 + 48), v18[232]) || [v18 isCancelled])
    && (+[CPLErrors operationCancelledError],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [*(id *)(a1 + 48) taskDidFinishWithError:v6];
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 64))
    {
      [(id)v19 _launchFetchChangesFromSyncAnchor:v2];
    }
    else if (*(void *)(v19 + 248))
    {
      if (!_CPLSilentLogging)
      {
        id v20 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [*(id *)(a1 + 48) scope];
          uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 240);
          int v27 = 138412802;
          id v28 = v21;
          __int16 v29 = 2048;
          uint64_t v30 = v22;
          __int16 v31 = 2048;
          uint64_t v32 = 20;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Rewinding in %@ now to catch up with changes from %lu to %lu", (uint8_t *)&v27, 0x20u);
        }
        uint64_t v19 = *(void *)(a1 + 48);
      }
      uint64_t v23 = [(id)v19 engineLibrary];
      id v24 = [v23 feedback];
      [v24 reportFetchChangesRewindToFeatureVersion:*(void *)(*(void *)(a1 + 48) + 240)];

      [*(id *)(a1 + 48) _updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:*(void *)(*(void *)(a1 + 48) + 248)];
    }
    else
    {
      uint64_t v25 = [*(id *)(v19 + 272) count];
      id v26 = *(unsigned char **)(a1 + 48);
      if (v25)
      {
        [v26 _relaunchFetchChangesFromOtherRewindSyncAnchors];
      }
      else if (v26[376])
      {
        [v26 _checkExtraRecords];
      }
      else
      {
        [v26 taskDidFinishWithError:0];
      }
    }
  }
}

void __67__CPLPullFromTransportScopeTask__launchFetchChangesFromSyncAnchor___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 232))
  {
    if (!_CPLSilentLogging)
    {
      id v2 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        id v3 = [*(id *)(a1 + 40) summaryDescription];
        int v18 = 138412290;
        uint64_t v19 = v3;
        _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "Dropping incoming %@ because we are stopping", (uint8_t *)&v18, 0xCu);
      }
    }
    return;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Fetch changes task did get a batch", (uint8_t *)&v18, 2u);
    }

    if (!_CPLSilentLogging)
    {
      id v5 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(a1 + 32) scope];
        CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        uint64_t v8 = *(void *)(a1 + 40);
        int v18 = 138412802;
        uint64_t v19 = v6;
        __int16 v20 = 2048;
        CFAbsoluteTime v21 = v7;
        __int16 v22 = 2112;
        uint64_t v23 = v8;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ in %.2fs %@", (uint8_t *)&v18, 0x20u);
      }
    }
  }
  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = CFAbsoluteTimeGetCurrent();
  if (*(void *)(a1 + 48))
  {
    if (![*(id *)(a1 + 40) count])
    {
LABEL_30:
      [*(id *)(a1 + 32) _handleNewBatchFromChanges:*(void *)(a1 + 40) updatedFlags:*(void *)(a1 + 64) newSyncAnchor:*(void *)(a1 + 48) partnerScopesNeedingToPullChanges:*(void *)(a1 + 72)];
      return;
    }
    id v9 = *(id *)(a1 + 56);
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 48);
    if (v9 && v11)
    {
      int v12 = [v9 isEqual:*(void *)(a1 + 48)];

      if (!v12)
      {
LABEL_29:
        id v16 = [*(id *)(a1 + 32) engineLibrary];
        id v17 = [v16 scheduler];
        [v17 resetBackoffInterval];

        goto LABEL_30;
      }
    }
    else
    {

      if (v10 || v11) {
        goto LABEL_29;
      }
    }
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [*(id *)(a1 + 56) cplSyncAnchorDescription];
        int v18 = 138412290;
        uint64_t v19 = v15;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Got some changes starting from sync anchor %@ and the new sync anchor is identical", (uint8_t *)&v18, 0xCu);
      }
    }
    goto LABEL_29;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v13 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_ERROR, "Transport returned an empty sync anchor", (uint8_t *)&v18, 2u);
    }
  }
}

- (void)_relaunchFetchChangesFromOtherRewindSyncAnchors
{
  if (![(NSMutableSet *)self->_otherRewindSyncAnchors count])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "We should have rewind sync anchors here", buf, 2u);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    int v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPullFromTransportTask.m"];
    [v11 handleFailureInMethod:a2 object:self file:v12 lineNumber:763 description:@"We should have rewind sync anchors here"];

    abort();
  }
  uint64_t v4 = [(CPLEngineScopedTask *)self store];
  id v5 = [v4 scopes];
  uint64_t v6 = [(NSMutableSet *)self->_otherRewindSyncAnchors anyObject];
  [(NSMutableSet *)self->_otherRewindSyncAnchors removeObject:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke;
  v15[3] = &unk_1E60AB068;
  v15[4] = self;
  id v16 = v5;
  id v17 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_62;
  v13[3] = &unk_1E60AB550;
  void v13[4] = self;
  id v14 = v17;
  id v7 = v17;
  id v8 = v5;
  id v9 = (id)[v4 performWriteTransactionWithBlock:v15 completionHandler:v13];
}

void __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_2;
  v5[3] = &unk_1E60AAF20;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [a2 do:v5];
}

void __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_62(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 error];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v8 error];
LABEL_5:
    id v7 = (void *)v5;
    [v4 taskDidFinishWithError:v5];

    goto LABEL_7;
  }
  int v6 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v5 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) _launchFetchChangesFromSyncAnchor:*(void *)(a1 + 40)];
LABEL_7:
}

uint64_t __80__CPLPullFromTransportScopeTask__relaunchFetchChangesFromOtherRewindSyncAnchors__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) scope];
  if (!_CPLSilentLogging)
  {
    uint64_t v5 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) scope];
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Rewinding now for %@ to catch up with missed features", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([*(id *)(a1 + 40) storeTransientSyncAnchor:*(void *)(a1 + 48) forScope:v4 error:a2])uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_storeRewindSyncAnchors:inScopes:error:", *(void *)(*(void *)(a1 + 32) + 272), *(void *)(a1 + 40), a2); {
  else
  }
    uint64_t v7 = 0;

  return v7;
}

- (void)_updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLEngineScopedTask *)self store];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke;
  v11[3] = &unk_1E60AB068;
  id v12 = v5;
  uint64_t v13 = self;
  id v14 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_55;
  v9[3] = &unk_1E60AB550;
  void v9[4] = self;
  id v10 = v14;
  id v6 = v14;
  id v7 = v5;
  id v8 = (id)[v7 performWriteTransactionWithBlock:v11 completionHandler:v9];
}

void __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_2;
  v7[3] = &unk_1E60AAF20;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  [a2 do:v7];
}

void __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_55(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v11 error];
LABEL_5:
    id v7 = (void *)v5;
    [v4 taskDidFinishWithError:v5];

    goto LABEL_7;
  }
  int v6 = [*(id *)(a1 + 32) isCancelled];
  id v4 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v5 = +[CPLErrors operationCancelledError];
    goto LABEL_5;
  }
  id v8 = (void *)v4[31];
  v4[31] = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 256);
  *(void *)(v9 + 256) = 0;

  [*(id *)(a1 + 32) _launchFetchChangesFromSyncAnchor:*(void *)(a1 + 40)];
LABEL_7:
}

uint64_t __96__CPLPullFromTransportScopeTask__updateLastFeatureVersionAndRelaunchFetchChangesFromSyncAnchor___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) scopes];
  uint64_t v5 = [*(id *)(a1 + 40) scope];
  char v6 = [v4 storeSupportedFeatureVersionInLastSync:20 forScope:v5 error:a2];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) scopes];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 40) scope];
    uint64_t v10 = [v7 storeTransientSyncAnchor:v8 forScope:v9 error:a2];

    return v10;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *a2;
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Unable to store supported feature version: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    return 0;
  }
}

- (void)_handleNewBatchFromChanges:(id)a3 updatedFlags:(id)a4 newSyncAnchor:(id)a5 partnerScopesNeedingToPullChanges:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(CPLEngineScopedTask *)self store];
  dispatch_suspend((dispatch_object_t)self->_queue);
  if (self->_rewindSyncAnchor
    && [(CPLFeatureVersionHistory *)self->_versionHistory featureVersionForSyncAnchor:v12] <= self->_rewindFeatureVersion)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [(CPLEngineScopedTask *)self scope];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "No need to rewind in %@ as we just caught up with the sync anchor we need to match current feature version", (uint8_t *)&buf, 0xCu);
      }
    }
    char v15 = 1;
  }
  else
  {
    char v15 = 0;
  }
  int v18 = [v10 filterScopeChangeFromBatch];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke;
  v30[3] = &unk_1E60AB018;
  uint8_t v30[4] = self;
  id v19 = v12;
  id v31 = v19;
  id v20 = v18;
  id v32 = v20;
  p_long long buf = &buf;
  id v21 = v11;
  id v33 = v21;
  id v34 = v10;
  char v38 = v15;
  id v22 = v14;
  id v35 = v22;
  id v23 = v13;
  id v36 = v23;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_54;
  v26[3] = &unk_1E60AB040;
  id v24 = v34;
  id v27 = v24;
  id v28 = self;
  __int16 v29 = &buf;
  id v25 = (id)[v22 performWriteTransactionWithBlock:v30 completionHandler:v26];

  _Block_object_dispose(&buf, 8);
}

void __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3];
  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if ((v4 & 1) == 0)
  {
    v5[232] = 1;
    goto LABEL_24;
  }
  char v6 = [v5 engineLibrary];
  id v7 = [v6 store];
  uint64_t v8 = [v7 scopes];

  if ([*(id *)(*(void *)(a1 + 32) + 272) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 272) removeObject:*(void *)(a1 + 40)];
    if ([*(id *)(*(void *)(a1 + 32) + 272) count])
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v9 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [*(id *)(a1 + 32) scope];
          *(_DWORD *)long long buf = 138412290;
          id v33 = v10;
          id v11 = "Caught up with some rewind sync anchor in %@ but we might still have to rewind for additional features";
LABEL_11:
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v9 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [*(id *)(a1 + 32) scope];
        *(_DWORD *)long long buf = 138412290;
        id v33 = v10;
        id v11 = "No need to rewind in %@ as we we just caught up with the sync anchor we need for additional features";
        goto LABEL_11;
      }
LABEL_12:
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_46;
    v30[3] = &unk_1E60AB750;
    uint8_t v30[4] = *(void *)(a1 + 32);
    id v31 = v8;
    [v3 do:v30];
  }
  id v12 = *(void **)(a1 + 48);
  if (v12)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_2;
    v26[3] = &unk_1E60AB638;
    void v26[4] = *(void *)(a1 + 32);
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 88);
    id v27 = v13;
    uint64_t v29 = v14;
    id v28 = v8;
    [v3 do:v26];
  }
  char v15 = *(void **)(a1 + 56);
  if (v15 && [v15 hasFlagUpdates])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_48;
    v23[3] = &unk_1E60AAF20;
    void v23[4] = *(void *)(a1 + 32);
    id v24 = *(id *)(a1 + 56);
    id v25 = v8;
    [v3 do:v23];
  }
  [*(id *)(a1 + 32) _handleNewBatchFromChanges:*(void *)(a1 + 64) newSyncAnchor:*(void *)(a1 + 40) inTransaction:v3];
  if (*(unsigned char *)(a1 + 96))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_49;
    v21[3] = &unk_1E60AB750;
    void v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 72);
    [v3 do:v21];
  }
  uint64_t v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_50;
    v17[3] = &unk_1E60AB778;
    v17[4] = *(void *)(a1 + 32);
    id v18 = v16;
    id v19 = v8;
    id v20 = v3;
    [v20 do:v17];
  }
  [*(id *)(a1 + 32) _notePartnerScopesNeedingToPullChanges:*(void *)(a1 + 80) scopes:v8 inTransaction:v3];

LABEL_24:
}

void __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 error];

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = [*(id *)(a1 + 32) count];
        id v7 = [v3 error];
        int v18 = 134218242;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Can't store batch with %lu changes: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    uint64_t v8 = (id *)(*(void *)(a1 + 40) + 112);
    id v9 = *v8;
    if (*v8)
    {
LABEL_7:
      objc_storeStrong(v8, v9);
      goto LABEL_13;
    }
    uint64_t v12 = [v3 error];
    goto LABEL_11;
  }
  id v10 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v11 = [v10 session];
    [v11 requestSyncStateAtEndOfSyncSession:4 reschedule:1];

    uint64_t v12 = +[CPLErrors operationCancelledError];
    uint64_t v13 = *(void *)(a1 + 40);
LABEL_12:
    uint64_t v14 = *(void **)(v13 + 112);
    *(void *)(v13 + 112) = v12;

    goto LABEL_13;
  }
  if ([v10 isCancelled])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v16 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "%@ has been cancelled while handling batches", (uint8_t *)&v18, 0xCu);
      }
    }
    uint64_t v8 = (id *)(*(void *)(a1 + 40) + 112);
    id v9 = *v8;
    if (*v8) {
      goto LABEL_7;
    }
    uint64_t v12 = +[CPLErrors operationCancelledError];
LABEL_11:
    uint64_t v13 = *(void *)(a1 + 40);
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v15 = *(void *)(a1 + 40);
  if (*(void *)(v15 + 112))
  {
    *(unsigned char *)(v15 + 232) = 1;
    [*(id *)(a1 + 40) _cancelAllTasks];
    uint64_t v15 = *(void *)(a1 + 40);
  }
  dispatch_resume(*(dispatch_object_t *)(v15 + 104));
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_46(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _storeRewindSyncAnchors:*(void *)(*(void *)(a1 + 32) + 272) inScopes:*(void *)(a1 + 40) error:a2];
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    char v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) scope];
      int v21 = 138412290;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updating scope info for %@", (uint8_t *)&v21, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 128) && [*(id *)(v6 + 216) scopeType] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = *(id *)(a1 + 40);
        uint64_t v8 = [v7 rewindAnchorsPerSharingScopesData];

        if (!v8)
        {
LABEL_21:

          goto LABEL_22;
        }
        id v9 = *(id *)(*(void *)(a1 + 32) + 216);
        uint64_t v10 = [v7 rewindAnchorsPerSharingScopesData];
        id v11 = [v9 rewindAnchorsPerSharingScopesData];
        unint64_t v12 = (unint64_t)v11;
        if (v10 && v11)
        {
          char v13 = [(id)v10 isEqual:v11];

          if (v13) {
            goto LABEL_20;
          }
        }
        else
        {

          if (!(v10 | v12))
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v14 = __CPLTaskOSLogDomain_22279();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = [*(id *)(a1 + 32) scope];
            int v21 = 138412290;
            uint64_t v22 = v15;
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "%@ has an updated list of rewind anchors without a known shared scope - will need to check this", (uint8_t *)&v21, 0xCu);
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_22:
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(a1 + 40));
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v16 = *(void **)(a1 + 48);
  int v18 = [*(id *)(a1 + 32) scope];
  uint64_t v19 = [v16 storeScopeChange:v17 forScope:v18 error:a2];

  return v19;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_48(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    char v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) scope];
      uint64_t v6 = *(void *)(a1 + 40);
      int v12 = 138412546;
      char v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "Updating scope flags for %@: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) scope];
  uint64_t v10 = [v7 updateFlags:v8 forScope:v9 error:a2];

  return v10;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_49(uint64_t a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = 0;

  uint64_t v8 = [*(id *)(a1 + 40) scopes];
  id v9 = [*(id *)(a1 + 32) scope];
  uint64_t v10 = [v8 storeSupportedFeatureVersionInLastSync:20 forScope:v9 error:a2];

  if ((v10 & 1) == 0 && !_CPLSilentLogging)
  {
    id v11 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *a2;
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Unable to store supported feature version: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  return v10;
}

uint64_t __121__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_updatedFlags_newSyncAnchor_partnerScopesNeedingToPullChanges___block_invoke_50(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 32) scope];
      *(_DWORD *)long long buf = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Updating library state for %@", buf, 0xCu);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 40) disabledDate];
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 32) scope];
  LODWORD(v7) = [v7 setDisabledDate:v6 forScope:v8 error:a2];

  if (!v7) {
    goto LABEL_15;
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 32) scope];
  LODWORD(v9) = [v9 setValue:v6 != 0 forFlag:8 forScope:v10 error:a2];

  if (!v9) {
    goto LABEL_15;
  }
  id v11 = *(void **)(a1 + 48);
  uint64_t v12 = [*(id *)(a1 + 40) deleteDate];
  char v13 = [*(id *)(a1 + 32) scope];
  int v14 = [v11 setDeleteDate:v12 forScope:v13 error:a2];

  if (v14)
  {
    if (([*(id *)(a1 + 32) isScopeValidInTransaction:*(void *)(a1 + 56)] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v15 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [*(id *)(a1 + 32) scope];
          *(_DWORD *)long long buf = 138412290;
          id v25 = v16;
          _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_DEFAULT, "%@ is not valid anymore, finishing sync session immediately", buf, 0xCu);
        }
      }
      uint64_t v17 = [*(id *)(a1 + 32) scope];
      int v18 = [v17 scopeIdentifier];
      uint64_t v19 = +[CPLErrors cplErrorWithCode:40, @"%@ has been reset", v18 description];
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = *(void **)(v20 + 112);
      *(void *)(v20 + 112) = v19;
    }
    uint64_t v22 = 1;
  }
  else
  {
LABEL_15:
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)_notePartnerScopesNeedingToPullChanges:(id)a3 scopes:(id)a4 inTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count]
    && [(NSMutableDictionary *)self->_syncAnchorsOfPartnerScopesThatMightNeedToPullChanges count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__CPLPullFromTransportScopeTask__notePartnerScopesNeedingToPullChanges_scopes_inTransaction___block_invoke;
    v11[3] = &unk_1E60AAF20;
    id v12 = v8;
    char v13 = self;
    id v14 = v9;
    [v10 do:v11];
  }
}

uint64_t __93__CPLPullFromTransportScopeTask__notePartnerScopesNeedingToPullChanges_scopes_inTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v24 = a2;
    id v7 = 0;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [*(id *)(*(void *)(a1 + 40) + 152) objectForKeyedSubscript:v10];

        if (v11)
        {
          if (!_CPLSilentLogging)
          {
            id v12 = __CPLTaskOSLogDomain_22279();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              char v13 = [*(id *)(a1 + 40) scope];
              *(_DWORD *)long long buf = 138412546;
              id v31 = v10;
              __int16 v32 = 2112;
              id v33 = v13;
              _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "%@ (partner with %@) will need to pull changes according to sync obligations", buf, 0x16u);
            }
          }
          id v14 = *(void **)(a1 + 48);
          id v25 = v7;
          int v15 = [v14 setScopeHasChangesToPullFromTransport:v10 error:&v25];
          id v16 = v25;

          [*(id *)(*(void *)(a1 + 40) + 152) removeObjectForKey:v10];
          uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 160);
          if (!v17)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v19 = *(void *)(a1 + 40);
            uint64_t v20 = *(void **)(v19 + 160);
            *(void *)(v19 + 160) = v18;

            uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 160);
          }
          int v21 = [v10 scopeIdentifier];
          [v17 addObject:v21];

          if (!v15)
          {

            if (v24)
            {
              id v16 = v16;
              uint64_t v22 = 0;
              *id v24 = v16;
            }
            else
            {
              uint64_t v22 = 0;
            }
            goto LABEL_23;
          }
          id v7 = v16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v22 = 1;
  id v16 = v7;
LABEL_23:

  return v22;
}

- (void)_checkExtraRecords
{
  if (!self->_hasExtraRecordsToCheck) {
    __assert_rtn("-[CPLPullFromTransportScopeTask _checkExtraRecords]", "CPLPullFromTransportTask.m", 565, "_hasExtraRecordsToCheck");
  }
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Checking extra records", buf, 2u);
    }
  }
  id v4 = [(CPLEngineScopedTask *)self store];
  *(void *)long long buf = 0;
  id v11 = buf;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__22351;
  id v14 = __Block_byref_object_dispose__22352;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CPLPullFromTransportScopeTask__checkExtraRecords__block_invoke;
  v7[3] = &unk_1E60AB040;
  void v7[4] = self;
  id v9 = buf;
  id v5 = v4;
  id v8 = v5;
  id v6 = (id)[v5 performReadTransactionWithBlock:v7];

  _Block_object_dispose(buf, 8);
}

void __51__CPLPullFromTransportScopeTask__checkExtraRecords__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkScopeIsValidInTransaction:")
    && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 40) pendingRecordChecks];
    id v9 = [*(id *)(a1 + 32) scope];
    id v10 = [v9 scopeIdentifier];
    uint64_t v11 = [v8 nextBatchOfRecordsToCheckWithScopeIdentifier:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    char v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    id v15 = *(void **)(a1 + 32);
    if (v14) {
      [v15 _checkExtraRecordsWithScopedIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    else {
      [v15 taskDidFinishWithError:0];
    }
  }
  else
  {
    id v3 = [v16 error];

    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = [v16 error];
      [v4 taskDidFinishWithError:v5];
    }
    else if ([*(id *)(a1 + 32) isCancelled])
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = +[CPLErrors operationCancelledError];
      [v6 taskDidFinishWithError:v7];
    }
  }
}

- (void)_checkExtraRecordsWithScopedIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "Will check records directly on Server: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke;
  v11[3] = &unk_1E60A6728;
  void v11[4] = self;
  id v12 = v4;
  id v7 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v14 = __cpl_dispatch_async_block_invoke_22296;
  id v15 = &unk_1E60A6978;
  id v16 = v7;
  id v8 = queue;
  id v9 = v4;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v8, v10);
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCancelled];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id obj = +[CPLErrors operationCancelledError];
    objc_msgSend(v3, "taskDidFinishWithError:");
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) engineLibrary];
    long long v27 = [v4 transport];

    id v5 = objc_alloc_init(CPLRecordTargetMapping);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obja = *(id *)(a1 + 40);
    uint64_t v6 = [obja countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(obja);
          }
          dispatch_block_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (*(void *)(*(void *)(a1 + 32) + 128))
          {
            uint64_t v11 = [CPLScopedIdentifier alloc];
            id v12 = [*(id *)(*(void *)(a1 + 32) + 128) scopeIdentifier];
            char v13 = [v10 identifier];
            uint64_t v14 = [(CPLScopedIdentifier *)v11 initWithScopeIdentifier:v12 identifier:v13];

            id v15 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v10 otherScopedIdentifier:v14 targetState:0];
          }
          else
          {
            id v15 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v10];
          }
          [(CPLRecordTargetMapping *)v5 setTarget:v15 forRecordWithScopedIdentifier:v10];
        }
        uint64_t v7 = [obja countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v7);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(v18 + 120);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2;
    v30[3] = &unk_1E60AB5E8;
    uint8_t v30[4] = v18;
    id v31 = v17;
    CFAbsoluteTime v32 = Current;
    uint64_t v20 = [v27 fetchRecordsTaskForRecordsWithScopedIdentifiers:v31 targetMapping:v5 transportScopeMapping:v19 completionHandler:v30];
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = *(void **)(v21 + 384);
    *(void *)(v21 + 384) = v20;

    if (!_CPLSilentLogging)
    {
      uint64_t v23 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v24 = *(void **)(*(void *)(a1 + 32) + 384);
        int v25 = [v24 foreground];
        long long v26 = " with background priority";
        if (v25) {
          long long v26 = " with foreground priority";
        }
        *(_DWORD *)long long buf = 138412546;
        char v38 = v24;
        __int16 v39 = 2080;
        uint64_t v40 = v26;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEBUG, "Launching %@%s", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) launchTransportTask:*(void *)(*(void *)(a1 + 32) + 384) withTransportGroup:*(void *)(*(void *)(a1 + 32) + 264)];
  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 104);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3;
  v14[3] = &unk_1E60A6700;
  v14[4] = v7;
  id v15 = v6;
  id v16 = *(id *)(a1 + 40);
  id v17 = v5;
  uint64_t v18 = *(void *)(a1 + 48);
  id v9 = v14;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v20 = v9;
  dispatch_block_t v10 = v8;
  id v11 = v5;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 384);
  *(void *)(v2 + 384) = 0;

  id v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "taskDidFinishWithError:");
  }
  else if ([v4 isCancelled])
  {
    id v5 = *(void **)(a1 + 32);
    id v23 = +[CPLErrors operationCancelledError];
    [v5 taskDidFinishWithError:v23];
  }
  else
  {
    id v6 = objc_alloc_init(CPLChangeBatch);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 48)];
    uint64_t v8 = *(void **)(a1 + 56);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_4;
    v34[3] = &unk_1E60AAFA0;
    id v9 = v7;
    id v35 = v9;
    dispatch_block_t v10 = v6;
    long long v36 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v34];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [(CPLChangeBatch *)v10 addRecord:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v12);
    }

    if (!_CPLSilentLogging)
    {
      id v16 = __CPLTaskOSLogDomain_22279();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [*(id *)(a1 + 32) scope];
        CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(CFAbsoluteTime *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        char v38 = (uint64_t (*)(uint64_t, uint64_t))v10;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Transport successfully downloaded for %@ (extra check) in %.2fs %@", buf, 0x20u);
      }
    }
    uint64_t v19 = [*(id *)(a1 + 32) store];
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    char v38 = __Block_byref_object_copy__22351;
    __int16 v39 = __Block_byref_object_dispose__22352;
    id v40 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_37;
    v25[3] = &unk_1E60AAFF0;
    void v25[4] = *(void *)(a1 + 32);
    id v20 = v19;
    id v26 = v20;
    uint64_t v21 = v10;
    long long v27 = v21;
    id v28 = *(id *)(a1 + 48);
    long long v29 = buf;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3_40;
    v24[3] = &unk_1E60AB878;
    v24[4] = *(void *)(a1 + 32);
    v24[5] = buf;
    id v22 = (id)[v20 performWriteTransactionWithBlock:v25 completionHandler:v24];

    _Block_object_dispose(buf, 8);
  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) removeObject:v5];
  uint64_t v7 = [v6 scopedIdentifier];
  char v8 = [v5 isEqual:v7];

  if (v8)
  {
    int v9 = [v6 inExpunged];
    dispatch_block_t v10 = *(void **)(a1 + 40);
    if (v9)
    {
      id v11 = (void *)[(id)objc_opt_class() newDeleteChangeWithScopedIdentifier:v5];
      [v10 addRecord:v11];
    }
    else
    {
      [v10 addRecord:v6];
    }
  }
  else if (!_CPLSilentLogging)
  {
    uint64_t v12 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 scopedIdentifier];
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring check for %@ which is remapped to %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) checkScopeIsValidInTransaction:v3])
  {
    id v4 = [*(id *)(a1 + 32) _transientPullRepositoryInStore:*(void *)(a1 + 40)];
    id v5 = [*(id *)(a1 + 32) store];
    id v6 = [v5 pendingRecordChecks];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2_38;
    v19[3] = &unk_1E60AAFC8;
    id v7 = v4;
    id v20 = v7;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v21 = v8;
    uint64_t v22 = v9;
    id v10 = v6;
    id v23 = v10;
    id v24 = *(id *)(a1 + 56);
    [v3 do:v19];
    id v11 = [v3 error];

    if (!v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) store];
      uint64_t v13 = [v12 pendingRecordChecks];
      int v14 = [*(id *)(a1 + 32) scope];
      id v15 = [v14 scopeIdentifier];
      uint64_t v16 = [v13 nextBatchOfRecordsToCheckWithScopeIdentifier:v15];
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

void __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_3_40(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 error];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v10 error];
    [v4 taskDidFinishWithError:v5];
  }
  else if ([*(id *)(a1 + 32) isCancelled])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[CPLErrors operationCancelledError];
    [v6 taskDidFinishWithError:v7];
  }
  else
  {
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    uint64_t v9 = *(void **)(a1 + 32);
    if (v8) {
      [v9 _checkExtraRecordsWithScopedIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    else {
      [v9 taskDidFinishWithError:0];
    }
  }
}

uint64_t __73__CPLPullFromTransportScopeTask__checkExtraRecordsWithScopedIdentifiers___block_invoke_2_38(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  int v4 = [*(id *)(a1 + 32) appendBatch:*(void *)(a1 + 40) alreadyMingled:0 countOfAssetChanges:&v6 error:a2];
  uint64_t result = 0;
  if (v4)
  {
    *(void *)(*(void *)(a1 + 48) + 392) += v6;
    return [*(id *)(a1 + 56) dequeueCloudScopedIdentifiersToCheck:*(void *)(a1 + 64) error:a2];
  }
  return result;
}

- (BOOL)_dequeueFromPendingRecordChecksIfNecessary:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (self->_hasExtraRecordsToCheck && [v6 count])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v15 = objc_msgSend(v14, "scopedIdentifier", (void)v20);
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      uint64_t v16 = [(CPLEngineScopedTask *)self store];
      uint64_t v17 = [v16 pendingRecordChecks];
      char v18 = [v17 dequeueCloudScopedIdentifiersToCheck:v8 error:a4];
    }
    else
    {
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

- (BOOL)_fetchRewindSyncAnchorsInScopes:(id)a3 startSyncAnchor:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(CPLEngineScopedTask *)self scope];
  uint64_t v10 = [v8 rewindSyncAnchorsForScope:v9];

  if ([v10 count])
  {
    uint64_t v11 = [(CPLEngineScopedTask *)self scope];
    if (a4)
    {
      uint64_t v12 = (NSMutableSet *)[v10 mutableCopy];
      otherRewindSyncAnchors = self->_otherRewindSyncAnchors;
      self->_otherRewindSyncAnchors = v12;

      if (!_CPLSilentLogging)
      {
        int v14 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [(NSMutableSet *)self->_otherRewindSyncAnchors count];
          int v19 = 138412546;
          long long v20 = v11;
          __int16 v21 = 2048;
          uint64_t v22 = v15;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "%@ might need to rewind fetching changes up to %lu times to catch up with missed features", (uint8_t *)&v19, 0x16u);
        }
      }
      BOOL v16 = 1;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v17 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          long long v20 = v11;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "%@ does not need to rewind to catch up with missed features as it will fetch all records since the beginning", (uint8_t *)&v19, 0xCu);
        }
      }
      BOOL v16 = [(CPLPullFromTransportScopeTask *)self _storeRewindSyncAnchors:0 inScopes:v8 error:a5];
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_storeRewindSyncAnchors:(id)a3 inScopes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {

    id v8 = 0;
  }
  uint64_t v10 = [(CPLEngineScopedTask *)self scope];
  char v11 = [v9 storeRewindSyncAnchors:v8 forScope:v10 error:a5];

  return v11;
}

- (BOOL)checkScopeIsValidInTransaction:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)CPLPullFromTransportScopeTask;
  BOOL v4 = [(CPLEngineScopedTask *)&v49 checkScopeIsValidInTransaction:a3];
  if (v4)
  {
    id v5 = [(CPLEngineScopedTask *)self store];
    id v6 = [v5 pushRepository];
    id v7 = [(CPLEngineScopedTask *)self scope];
    id v8 = [v7 scopeIdentifier];
    unint64_t v9 = [v6 minimumPriorityForChangesInScopeWithIdentifier:v8];
    if (v9 < +[CPLRecordPushContext minimumPriorityForLocalConflictResolution])
    {
      uint64_t v10 = [(CPLEngineSyncTask *)self session];
      char v11 = [v10 allowsLocalConflictResolution];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [(CPLEngineSyncTask *)self session];
        int v13 = [v12 allowsLocalConflictResolutionWhenOverQuota];

        if (!v13
          || ([v5 scopes],
              int v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v14 valueForFlag:2 forScope:v7],
              v14,
              (v15 & 1) == 0))
        {
          if (!_CPLSilentLogging)
          {
            char v38 = __CPLTaskOSLogDomain_22279();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              v51 = v8;
              _os_log_impl(&dword_1B4CAC000, v38, OS_LOG_TYPE_DEFAULT, "Push repository contains changes for %@, stopping pull from transport now", buf, 0xCu);
            }
          }
          [(CPLPullFromTransportScopeTask *)self cancel];

          goto LABEL_23;
        }
      }
    }
    BOOL v16 = [v5 cloudCache];
    uint64_t v17 = [v5 transientPullRepository];
    char v18 = v17;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke;
      v46[3] = &unk_1E60AAF50;
      v47 = v16;
      id v48 = v17;
      id v19 = v17;
      id v20 = v16;
      __int16 v21 = (void *)MEMORY[0x1BA994060](v46);
      id allowsMinglingChangeWithScopedIdentifier = self->_allowsMinglingChangeWithScopedIdentifier;
      self->_id allowsMinglingChangeWithScopedIdentifier = v21;

      id v23 = v47;
    }
    else
    {
      id v24 = [v5 idMapping];
      uint64_t v25 = [(CPLEngineScopedTask *)self scope];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke_2;
      v40[3] = &unk_1E60AAF78;
      id v41 = v16;
      id v42 = v18;
      id v43 = v24;
      id v44 = v25;
      id v45 = v6;
      id v26 = v25;
      id v23 = v24;
      id v27 = v18;
      id v28 = v16;
      long long v29 = (void *)MEMORY[0x1BA994060](v40);
      id v30 = self->_allowsMinglingChangeWithScopedIdentifier;
      self->_id allowsMinglingChangeWithScopedIdentifier = v29;
    }
    long long v31 = [(CPLEngineScopedTask *)self store];
    long long v32 = [v31 cleanupTasks];
    int v33 = [v32 hasCleanupTasks];

    if (v33)
    {
      if (!_CPLSilentLogging)
      {
        long long v34 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEFAULT, "Can't download records until cleanup tasks have been done", buf, 2u);
        }
      }
      [(CPLPullFromTransportScopeTask *)self cancel];
LABEL_23:
      LOBYTE(v4) = 0;
      return v4;
    }
    if (self->_taskItem == -1)
    {
      id v35 = [(CPLEngineScopedTask *)self store];
      long long v36 = [v35 scopes];
      uint64_t v37 = [(CPLEngineScopedTask *)self scope];
      self->_taskItem = [v36 pullFromTransportTaskForScope:v37];
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

uint64_t __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) hasRecordWithScopedIdentifier:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) hasRecordWithScopedIdentifier:v3] ^ 1;
  }

  return v4;
}

uint64_t __64__CPLPullFromTransportScopeTask_checkScopeIsValidInTransaction___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if (([a1[4] hasRecordWithScopedIdentifier:v3] & 1) != 0
    || ([a1[5] hasRecordWithScopedIdentifier:v3] & 1) != 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    char v11 = 0;
    id v5 = [a1[6] localScopedIdentifierForCloudScopedIdentifier:v3 isFinal:&v11];
    if (v5)
    {
      id v6 = v5;
      -[CPLScopedIdentifier setScopeIndex:](v5, "setScopeIndex:", [a1[7] localIndex]);
    }
    else
    {
      id v7 = [CPLScopedIdentifier alloc];
      id v8 = [a1[7] scopeIdentifier];
      unint64_t v9 = [v3 identifier];
      id v6 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:](v7, "initWithScopeIdentifier:identifier:scopeIndex:", v8, v9, [a1[7] localIndex]);
    }
    uint64_t v4 = [a1[8] hasSomeChangeWithScopedIdentifier:v6] ^ 1;
  }
  return v4;
}

- (id)scopesForTask
{
  if ([(NSMutableArray *)self->_partnerScopes count])
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLPullFromTransportScopeTask;
    id v3 = [(CPLEngineScopedTask *)&v7 scopesForTask];
    uint64_t v4 = [v3 arrayByAddingObjectsFromArray:self->_partnerScopes];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CPLPullFromTransportScopeTask;
    uint64_t v4 = [(CPLEngineScopedTask *)&v6 scopesForTask];
  }
  return v4;
}

- (void)_handleNewBatchFromChanges:(id)a3 newSyncAnchor:(id)a4 inTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v10 error];

  if (!v11)
  {
    uint64_t v12 = [(CPLEngineSyncTask *)self engineLibrary];
    int v13 = [v12 store];

    int v14 = [(CPLPullFromTransportScopeTask *)self _transientPullRepositoryInStore:v13];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke;
    v23[3] = &unk_1E60AAF20;
    id v15 = v8;
    id v24 = v15;
    id v25 = v14;
    id v26 = self;
    id v16 = v14;
    [v10 do:v23];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke_22;
    v18[3] = &unk_1E60AB778;
    id v19 = v9;
    id v20 = self;
    id v21 = v13;
    id v22 = v15;
    id v17 = v13;
    [v10 do:v18];
  }
}

uint64_t __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [a1[4] count];
      *(_DWORD *)id v8 = 134217984;
      *(void *)&v8[4] = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Storing %lu changes in transient repository", v8, 0xCu);
    }
  }
  *(void *)id v8 = 0;
  int v6 = [a1[5] appendBatch:a1[4] alreadyMingled:0 countOfAssetChanges:v8 error:a2];
  uint64_t result = 0;
  if (v6)
  {
    *((void *)a1[6] + 49) += *(void *)v8;
    return [a1[6] _dequeueFromPendingRecordChecksIfNecessary:a1[4] error:a2];
  }
  return result;
}

uint64_t __88__CPLPullFromTransportScopeTask__handleNewBatchFromChanges_newSyncAnchor_inTransaction___block_invoke_22(id *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [a1[4] cplSyncAnchorDescription];
      int v6 = [a1[5] scope];
      *(_DWORD *)long long buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "Storing transient sync anchor %@ for %@", buf, 0x16u);
    }
  }
  objc_super v7 = [a1[6] scopes];
  id v8 = a1[4];
  uint64_t v9 = [a1[5] scope];
  uint64_t v10 = [v7 storeTransientSyncAnchor:v8 forScope:v9 error:a2];

  if (v10 && [a1[7] count])
  {
    char v11 = a1[5];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11[49], @"CPLSyncProgressCountOfPulledAssetsKey");
    id v17 = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    LODWORD(v14) = 0.5;
    [v11 taskDidProgress:v13 userInfo:v14];
  }
  return v10;
}

- (unint64_t)_totalAssetCountForScope
{
  if (!self->_hasCachedTotalAssetCountForScope)
  {
    id v3 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v4 = [v3 store];
    uint64_t v5 = [v4 scopes];
    int v6 = [(CPLEngineScopedTask *)self scope];
    objc_super v7 = [v5 scopeChangeForScope:v6];
    id v8 = [v7 libraryInfo];

    uint64_t v9 = [v8 assetCounts];
    self->_totalAssetCountForScope = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__CPLPullFromTransportScopeTask__totalAssetCountForScope__block_invoke;
    v11[3] = &unk_1E60AAEF8;
    void v11[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
    self->_hasCachedTotalAssetCountForScope = 1;
  }
  return self->_totalAssetCountForScope;
}

uint64_t __57__CPLPullFromTransportScopeTask__totalAssetCountForScope__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  *(void *)(*(void *)(a1 + 32) + 280) += result;
  return result;
}

- (void)_extractAndMingleAssetsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_useCourtesyMingling)
  {
    id v7 = a3;
    id v8 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v9 = [v8 store];

    uint64_t v10 = [(CPLPullFromTransportScopeTask *)self _transientPullRepositoryInStore:v9];
    char v11 = [(CPLPullFromTransportScopeTask *)self _cloudCacheInStore:v9];
    id v22 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke;
    v20[3] = &unk_1E60AAED0;
    void v20[4] = self;
    id v12 = v11;
    id v21 = v12;
    [v7 extractInitialDownloadBatch:&v22 shouldConsiderRecordFilter:v20];

    id v13 = v22;
    if ([v13 count])
    {
      if (!_CPLSilentLogging)
      {
        double v14 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v13;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "As a courtesy for a quiet client, mingling immediately new assets we got %@", buf, 0xCu);
        }
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_20;
      v15[3] = &unk_1E60AB778;
      id v16 = v13;
      id v17 = self;
      id v18 = v9;
      id v19 = v10;
      [v6 do:v15];
    }
  }
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 scopedIdentifier];
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 400) + 16))())
  {
    if ([v3 isAssetChange])
    {
      [v3 people];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        id v18 = v4;
        uint64_t v8 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) personIdentifier];
            if (v10)
            {
              char v11 = (void *)v10;
              id v12 = [CPLScopedIdentifier alloc];
              id v13 = [v3 scopedIdentifier];
              id v14 = [(CPLScopedIdentifier *)v12 initRelativeToScopedIdentifier:v13 identifier:v11];

              if (v14 && ([*(id *)(a1 + 40) hasRecordWithScopedIdentifier:v14] & 1) == 0)
              {
                uint64_t v4 = v18;
                if (!_CPLSilentLogging)
                {
                  id v16 = __CPLTaskOSLogDomain_22279();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    id v24 = v3;
                    __int16 v25 = 2112;
                    id v26 = v14;
                    _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Can't mingle %@ prematurely because it refers to an unknown person %@", buf, 0x16u);
                  }
                }
                uint64_t v15 = 0;
                goto LABEL_24;
              }
            }
            else
            {
              id v14 = 0;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v7) {
            continue;
          }
          break;
        }
        uint64_t v15 = 1;
        uint64_t v4 = v18;
      }
      else
      {
        uint64_t v15 = 1;
      }
LABEL_24:
    }
    else
    {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) scope];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_2;
  v10[3] = &unk_1E60AAEA8;
  uint64_t v6 = *(void *)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  BOOL v7 = +[CPLMingleUtility mingleChangeBatch:v4 scope:v5 forStore:v6 onPutBatchInPullQueue:v10 error:a2];

  if (!v7) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t result = [*(id *)(a1 + 56) appendBatch:*(void *)(a1 + 32) alreadyMingled:1 countOfAssetChanges:&v9 error:a2];
  if (result) {
    *(void *)(*(void *)(a1 + 40) + 392) += v9;
  }
  return result;
}

uint64_t __90__CPLPullFromTransportScopeTask__extractAndMingleAssetsIfPossibleFromBatch_inTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 count]) {
    [*(id *)(a1 + 32) _notifySchedulerPullQueueIsFull];
  }
  return 1;
}

- (void)_extractAndMinglePersonsIfPossibleFromBatch:(id)a3 inTransaction:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_useCourtesyMingling)
  {
    long long v31 = v7;
    uint64_t v9 = [v6 count];
    uint64_t v10 = [(CPLEngineSyncTask *)self engineLibrary];
    uint64_t v11 = [v10 store];

    long long v29 = [(CPLPullFromTransportScopeTask *)self _transientPullRepositoryInStore:v11];
    id v30 = (void *)v11;
    id v12 = [(CPLPullFromTransportScopeTask *)self _cloudCacheInStore:v11];
    long long v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v9];
    long long v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    uint64_t v28 = v9;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = v6;
    id obj = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    int v33 = v12;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v43;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(CPLChangeBatch **)(*((void *)&v42 + 1) + 8 * v17);
          long long v19 = [(CPLChangeBatch *)v18 scopedIdentifier];
          int v20 = (*((uint64_t (**)(void))self->_allowsMinglingChangeWithScopedIdentifier + 2))();
          long long v21 = v13;
          if (v20)
          {
            long long v22 = [(CPLChangeBatch *)v18 relatedScopedIdentifier];
            if (!v22
              || ([v36 containsObject:v22] & 1) != 0
              || ([v12 hasRecordWithScopedIdentifier:v22] & 1) != 0)
            {

              [v36 addObject:v19];
              long long v21 = v34;
            }
            else
            {
              if (!_CPLSilentLogging)
              {
                id v23 = __CPLTaskOSLogDomain_22279();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412546;
                  v47 = v18;
                  __int16 v48 = 2112;
                  objc_super v49 = v22;
                  _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Can't mingle %@ prematurely because it targets an unknown person %@", buf, 0x16u);
                }

                id v12 = v33;
              }

              long long v21 = v13;
            }
          }
          [v21 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v24 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        uint64_t v15 = v24;
      }
      while (v24);
    }

    uint64_t v8 = v31;
    id v6 = v32;
    if ([v34 count])
    {
      __int16 v25 = [[CPLChangeBatch alloc] initWithRecords:v34];
      if (!_CPLSilentLogging)
      {
        id v26 = __CPLTaskOSLogDomain_22279();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          v47 = v25;
          _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_DEFAULT, "As a courtesy for a quiet client, mingling immediately new persons we got %@", buf, 0xCu);
        }
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke;
      v37[3] = &unk_1E60AB778;
      char v38 = v25;
      __int16 v39 = self;
      id v40 = v30;
      id v41 = v29;
      id v27 = v25;
      [v31 do:v37];
    }
    if ([v13 count] != v28) {
      [obj _setRecords:v13];
    }
  }
}

uint64_t __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) scope];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke_2;
  v10[3] = &unk_1E60AAEA8;
  uint64_t v6 = *(void *)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  BOOL v7 = +[CPLMingleUtility mingleChangeBatch:v4 scope:v5 forStore:v6 onPutBatchInPullQueue:v10 error:a2];

  if (!v7) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t result = [*(id *)(a1 + 56) appendBatch:*(void *)(a1 + 32) alreadyMingled:1 countOfAssetChanges:&v9 error:a2];
  if (result) {
    *(void *)(*(void *)(a1 + 40) + 392) += v9;
  }
  return result;
}

uint64_t __91__CPLPullFromTransportScopeTask__extractAndMinglePersonsIfPossibleFromBatch_inTransaction___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 count]) {
    [*(id *)(a1 + 32) _notifySchedulerPullQueueIsFull];
  }
  return 1;
}

- (id)_cloudCacheInStore:(id)a3
{
  cloudCache = self->_cloudCache;
  if (!cloudCache)
  {
    id v5 = [a3 cloudCache];
    uint64_t v6 = self->_cloudCache;
    self->_cloudCache = v5;

    cloudCache = self->_cloudCache;
  }
  return cloudCache;
}

- (id)_transientPullRepositoryInStore:(id)a3
{
  transientPullRepository = self->_transientPullRepository;
  if (!transientPullRepository)
  {
    id v5 = [a3 transientPullRepository];
    uint64_t v6 = self->_transientPullRepository;
    self->_transientPullRepository = v5;

    transientPullRepository = self->_transientPullRepository;
  }
  return transientPullRepository;
}

- (void)_cancelAllTasks
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CPLPullFromTransportScopeTask__cancelAllTasks__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

uint64_t __48__CPLPullFromTransportScopeTask__cancelAllTasks__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) cancel];
  [*(id *)(*(void *)(a1 + 32) + 208) cancel];
  [*(id *)(*(void *)(a1 + 32) + 384) cancel];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 328);
  return [v2 cancel];
}

- (void)_notifySchedulerPullQueueIsFullNowIfNecessary
{
  notifyQueue = self->_notifyQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  void v6[4] = self;
  id v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22296;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  uint64_t v4 = notifyQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __78__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFullNowIfNecessary__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 345))
  {
    uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
    *(unsigned char *)(*(void *)(a1 + 32) + 345) = 0;
    [*(id *)(a1 + 32) _reallyNotifySchedulerPullQueueIsFull];
  }
}

- (void)_notifySchedulerPullQueueIsFull
{
  if (self->_didNotifySchedulerPullQueueIsFullOnce)
  {
    notifyQueue = self->_notifyQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke;
    v7[3] = &unk_1E60A5DD8;
    void v7[4] = self;
    uint64_t v4 = v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __cpl_dispatch_async_block_invoke_22296;
    block[3] = &unk_1E60A6978;
    id v9 = v4;
    dispatch_block_t v5 = notifyQueue;
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v5, v6);
  }
  else
  {
    [(CPLPullFromTransportScopeTask *)self _reallyNotifySchedulerPullQueueIsFull];
    self->_didNotifySchedulerPullQueueIsFullOnce = 1;
  }
}

void __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 345))
  {
    *(unsigned char *)(v1 + 345) = 1;
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_block_t v5 = *(NSObject **)(v4 + 336);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke_2;
    block[3] = &unk_1E60A5DD8;
    void block[4] = v4;
    dispatch_after(v3, v5, block);
  }
}

void __64__CPLPullFromTransportScopeTask__notifySchedulerPullQueueIsFull__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 345))
  {
    uint64_t v2 = (void *)MEMORY[0x1BA993DF0]();
    *(unsigned char *)(*(void *)(a1 + 32) + 345) = 0;
    [*(id *)(a1 + 32) _reallyNotifySchedulerPullQueueIsFull];
  }
}

- (void)_reallyNotifySchedulerPullQueueIsFull
{
  if (!_CPLSilentLogging)
  {
    dispatch_time_t v3 = __CPLTaskOSLogDomain_22279();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_block_t v6 = 0;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Notifying scheduler that there is some change in the pull queue", v6, 2u);
    }
  }
  uint64_t v4 = [(CPLEngineSyncTask *)self engineLibrary];
  dispatch_block_t v5 = [v4 scheduler];
  [v5 noteClientNeedsToPull];
}

- (id)transportScope
{
  updateTransportScope = self->_updateTransportScope;
  if (updateTransportScope || (updateTransportScope = self->_stagingTransportScope) != 0)
  {
    dispatch_time_t v3 = updateTransportScope;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLPullFromTransportScopeTask;
    dispatch_time_t v3 = [(CPLEngineScopedTask *)&v5 transportScope];
  }
  return v3;
}

- (CPLPullFromTransportScopeTask)initWithEngineLibrary:(id)a3 session:(id)a4 clientCacheIdentifier:(id)a5 scope:(id)a6 transportScope:(id)a7
{
  id v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CPLPullFromTransportScopeTask;
  id v13 = [(CPLEngineScopedTask *)&v22 initWithEngineLibrary:v12 session:a4 clientCacheIdentifier:a5 scope:a6 transportScope:a7];
  if (v13)
  {
    uint64_t v14 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.cpl.pullfromtransport", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    uint64_t v17 = [v12 transport];
    transport = v13->_transport;
    v13->_transport = (CPLEngineTransport *)v17;

    v13->_taskItem = -1;
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.cpl.pullfromtransport.notify", 0);
    notifyQueue = v13->_notifyQueue;
    v13->_notifyQueue = (OS_dispatch_queue *)v19;
  }
  return v13;
}

@end