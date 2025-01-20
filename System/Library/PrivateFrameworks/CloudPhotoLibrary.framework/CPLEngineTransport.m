@interface CPLEngineTransport
+ (id)platformImplementationProtocol;
- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7;
- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4;
- (BOOL)isResourceDynamic:(id)a3;
- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineTransport)initWithEngineLibrary:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (CPLPlatformObject)platformObject;
- (CPLSharedRecordPropertyMapping)propertyMapping;
- (Class)transportGroupClass;
- (Class)userIdentifierClass;
- (NSArray)involvedProcesses;
- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4;
- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3;
- (id)bestErrorForUnderlyingError:(id)a3;
- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)componentName;
- (id)concreteScopeFromTransportScope:(id)a3;
- (id)createGroupForAcceptingLibraryShare;
- (id)createGroupForAcceptingMomentShare;
- (id)createGroupForAnalysisDownload;
- (id)createGroupForChangeDownload;
- (id)createGroupForChangeUpload;
- (id)createGroupForCleanupLibrary;
- (id)createGroupForComputeStateDownloadOnDemand;
- (id)createGroupForComputeStateDownloadPrefetch;
- (id)createGroupForComputeStateUpload;
- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4;
- (id)createGroupForExitSharedLibrary;
- (id)createGroupForFeedback;
- (id)createGroupForFetchScopeListChanges;
- (id)createGroupForFetchingExistingSharedScope;
- (id)createGroupForFetchingLibraryShare;
- (id)createGroupForFetchingMomentShare;
- (id)createGroupForFixUpTasks;
- (id)createGroupForInitialDownload;
- (id)createGroupForInitialUpload;
- (id)createGroupForKeepOriginalsPrefetch;
- (id)createGroupForLibraryStateCheck;
- (id)createGroupForMemoriesPrefetch;
- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3;
- (id)createGroupForNonDerivativePrefetch;
- (id)createGroupForPrefetch;
- (id)createGroupForPruningCheck;
- (id)createGroupForPublishingLibraryShare;
- (id)createGroupForPublishingMomentShare;
- (id)createGroupForQueryUserIdentities;
- (id)createGroupForRecoveryDownload;
- (id)createGroupForResetSync;
- (id)createGroupForReshare;
- (id)createGroupForResourcesDownload;
- (id)createGroupForSetup;
- (id)createGroupForSharedLibraryRampCheck;
- (id)createGroupForStagedScopeCleanup;
- (id)createGroupForThumbnailPrefetch;
- (id)createGroupForThumbnailsDownload;
- (id)createGroupForTransportScopeDelete;
- (id)createGroupForTransportScopeRefresh;
- (id)createGroupForTransportScopeUpdate;
- (id)createGroupForWidgetPrefetch;
- (id)createGroupForWidgetResourcesDownload;
- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4;
- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (id)descriptionForTransportScope:(id)a3;
- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3;
- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4;
- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5;
- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5;
- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6;
- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6;
- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10;
- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4;
- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10;
- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3;
- (id)scopeNameForTransportScope:(id)a3;
- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4;
- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4;
- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3;
- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3;
- (id)simpleDescriptionForSyncAnchor:(id)a3;
- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8;
- (id)tentativeConcreteScopeForScope:(id)a3;
- (id)transportScopeForUpgradeFromScopeName:(id)a3;
- (id)transportScopeFromConcreteScope:(id)a3;
- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5;
- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6;
- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)uploadComputeStates:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetMapping:(id)a6 transportScopeMapping:(id)a7 knownRecords:(id)a8 completionHandler:(id)a9;
- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)dropPersistedInitialSyncSession;
- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForeground;
- (void)openWithCompletionHandler:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4;
@end

@implementation CPLEngineTransport

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (id)createGroupForSharedLibraryRampCheck
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForSharedLibraryRampCheck];

  return v3;
}

- (id)createGroupForFetchingExistingSharedScope
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFetchingExistingSharedScope];

  return v3;
}

- (id)createGroupForExitSharedLibrary
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForExitSharedLibrary];

  return v3;
}

- (id)createGroupForCleanupLibrary
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForCleanupLibrary];

  return v3;
}

- (id)createGroupForAcceptingLibraryShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForAcceptingLibraryShare];

  return v3;
}

- (id)createGroupForFetchingLibraryShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFetchingLibraryShare];

  return v3;
}

- (id)createGroupForPublishingLibraryShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForPublishingLibraryShare];

  return v3;
}

- (id)createGroupForQueryUserIdentities
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForQueryUserIdentities];

  return v3;
}

- (id)createGroupForAcceptingMomentShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForAcceptingMomentShare];

  return v3;
}

- (id)createGroupForFetchingMomentShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFetchingMomentShare];

  return v3;
}

- (id)createGroupForPublishingMomentShare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForPublishingMomentShare];

  return v3;
}

- (id)createGroupForPruningCheck
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForPruningCheck];

  return v3;
}

- (id)createGroupForAnalysisDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForAnalysisDownload];

  return v3;
}

- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3
{
  v4 = [(CPLEngineTransport *)self platformObject];
  v5 = [v4 createGroupForMovieStreamingWithIntent:a3];

  return v5;
}

- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  v6 = [(CPLEngineTransport *)self platformObject];
  v7 = [v6 createGroupForDownloadWithIntent:a3 priority:a4];

  return v7;
}

- (id)createGroupForWidgetResourcesDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForWidgetResourcesDownload];

  return v3;
}

- (id)createGroupForResourcesDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForResourcesDownload];

  return v3;
}

- (id)createGroupForThumbnailsDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForThumbnailsDownload];

  return v3;
}

- (id)createGroupForStagedScopeCleanup
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForStagedScopeCleanup];

  return v3;
}

- (id)createGroupForReshare
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForReshare];

  return v3;
}

- (id)createGroupForFixUpTasks
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFixUpTasks];

  return v3;
}

- (id)createGroupForComputeStateDownloadPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForComputeStateDownloadPrefetch];

  return v3;
}

- (id)createGroupForComputeStateDownloadOnDemand
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForComputeStateDownloadOnDemand];

  return v3;
}

- (id)createGroupForComputeStateUpload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForComputeStateUpload];

  return v3;
}

- (id)createGroupForChangeDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForChangeDownload];

  return v3;
}

- (id)createGroupForChangeUpload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForChangeUpload];

  return v3;
}

- (id)createGroupForLibraryStateCheck
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForLibraryStateCheck];

  return v3;
}

- (id)createGroupForFeedback
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFeedback];

  return v3;
}

- (id)createGroupForFetchScopeListChanges
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForFetchScopeListChanges];

  return v3;
}

- (id)createGroupForTransportScopeRefresh
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForTransportScopeRefresh];

  return v3;
}

- (id)createGroupForTransportScopeUpdate
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForTransportScopeUpdate];

  return v3;
}

- (id)createGroupForTransportScopeDelete
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForTransportScopeDelete];

  return v3;
}

- (id)createGroupForSetup
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForSetup];

  return v3;
}

- (id)createGroupForWidgetPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForWidgetPrefetch];

  return v3;
}

- (id)createGroupForRecoveryDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForRecoveryDownload];

  return v3;
}

- (id)createGroupForMemoriesPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForMemoriesPrefetch];

  return v3;
}

- (id)createGroupForKeepOriginalsPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForKeepOriginalsPrefetch];

  return v3;
}

- (id)createGroupForNonDerivativePrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForNonDerivativePrefetch];

  return v3;
}

- (id)createGroupForThumbnailPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForThumbnailPrefetch];

  return v3;
}

- (id)createGroupForPrefetch
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForPrefetch];

  return v3;
}

- (id)createGroupForInitialDownload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForInitialDownload];

  return v3;
}

- (id)createGroupForResetSync
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForResetSync];

  return v3;
}

- (id)createGroupForInitialUpload
{
  v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 createGroupForInitialUpload];

  return v3;
}

- (CPLFingerprintContext)fingerprintContext
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [(CPLEngineTransport *)self platformObject];
  v5 = [v4 fingerprintContext];

  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      v7 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Trying to access %@ while it has not been set yet", buf, 0xCu);
      }
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineTransport.m"];
    v11 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, v10, 516, @"Trying to access %@ while it has not been set yet", v11 object file lineNumber description];

    abort();
  }
  return (CPLFingerprintContext *)v5;
}

- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineTransport *)self platformObject];
  char v6 = [v5 shouldIgnoreScopeWithIdentifier:v4];

  return v6;
}

- (void)dropPersistedInitialSyncSession
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  [v2 dropPersistedInitialSyncSession];
}

- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  [v8 findPersistedInitialSyncSession:v7 completionHandler:v6];
}

- (BOOL)isResourceDynamic:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineTransport *)self platformObject];
  char v6 = [v5 isResourceDynamic:v4];

  return v6;
}

- (void)noteClientIsInBackground
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  [v2 noteClientIsInBackground];
}

- (void)noteClientIsInForeground
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  [v2 noteClientIsInForeground];
}

- (id)concreteScopeFromTransportScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineTransport *)self platformObject];
  char v6 = [v5 concreteScopeFromTransportScope:v4];

  return v6;
}

- (id)transportScopeFromConcreteScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineTransport *)self platformObject];
  char v6 = [v5 transportScopeFromConcreteScope:v4];

  return v6;
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(CPLEngineTransport *)self platformObject];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CPLEngineTransport *)self platformObject];
    [v6 getStatusDictionaryWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(CPLEngineTransport *)self platformObject];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CPLEngineTransport *)self platformObject];
    [v6 getStatusWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (id)componentName
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  v3 = [v2 componentName];

  return v3;
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CPLEngineTransport *)self platformObject];
  [v7 closeAndDeactivate:v4 completionHandler:v6];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransport *)self platformObject];
  [v5 openWithCompletionHandler:v4];
}

- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  char v9 = [v8 isNewTransportScope:v7 compatibleWithOldTransportScope:v6];

  return v9;
}

- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  [v8 upgradeFlags:v7 fromTransportScope:v6];
}

- (id)transportScopeForUpgradeFromScopeName:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 transportScopeForUpgradeFromScopeName:v4];

  return v6;
}

- (id)scopeNameForTransportScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 scopeNameForTransportScope:v4];

  return v6;
}

- (id)descriptionForTransportScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 descriptionForTransportScope:v4];

  return v6;
}

- (id)tentativeConcreteScopeForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 tentativeConcreteScopeForScope:v4];

  return v6;
}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CPLEngineTransport *)self platformObject];
  [v4 cancelBlockedTasksIncludingBackground:v3];
}

- (void)noteClientIsEndingSignificantWork
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector()) {
    [v2 noteClientIsEndingSignificantWork];
  }
}

- (void)noteClientIsBeginningSignificantWork
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector()) {
    [v2 noteClientIsBeginningSignificantWork];
  }
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector()) {
    [v6 setShouldOverride:v5 forSystemBudgets:a4];
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector())
  {
    [v5 getSystemBudgetsWithCompletionHandler:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v7 = [NSString stringWithFormat:@"getSystemBudgetsWithCompletionHandler is not implemented"];
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    char v9 = [v6 errorWithDomain:@"CloudPhotoLibraryErrorDomain" code:255 userInfo:v8];

    v4[2](v4, 0, v9);
  }
}

- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  v15 = [(CPLEngineTransport *)self platformObject];
  LOBYTE(a4) = [v15 getProposedStagingScopeIdentifier:a3 stagingTransportScope:a4 forScope:v14 transportScope:v13 transportUserIdentifier:v12];

  return (char)a4;
}

- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 simpleDescriptionForScopeListSyncAnchor:v4];

  return v6;
}

- (id)simpleDescriptionForSyncAnchor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector()) {
    [v5 simpleDescriptionForSyncAnchor:v4];
  }
  else {
  id v6 = [v4 base64EncodedStringWithOptions:0];
  }

  return v6;
}

- (id)bestErrorForUnderlyingError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 bestErrorForUnderlyingError:v4];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  char v9 = [v8 sendFeedbackTaskForMessages:v7 completionHandler:v6];

  return v9;
}

- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  char v9 = [v8 queryUserDetailsTaskForParticipants:v7 completionHandler:v6];

  return v9;
}

- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(CPLEngineTransport *)self platformObject];
  v21 = [v20 cleanupStagedScope:v19 stagingScope:v18 destinationScope:v17 transportScopeMapping:v16 progressHandler:v15 completionHandler:v14];

  return v21;
}

- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 updateContributorsTaskWithSharedScope:v13 contributorsUpdates:v12 transportScopeMapping:v11 completionHandler:v10];

  return v15;
}

- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 sharedLibraryServerRampTaskWithCompletionHandler:v4];

  return v6;
}

- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLEngineTransport *)self platformObject];
  id v12 = [v11 fixUpSparseRecordsTaskWithTasks:v10 transportScopeMapping:v9 completionHandler:v8];

  return v12;
}

- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(CPLEngineTransport *)self platformObject];
  v24 = [v23 removeParticipantInSharedLibraryTaskFromSharedScope:v22 transportScope:v21 share:v20 retentionPolicy:a6 exitSource:a7 userIdentifiersToRemove:v19 participantIDsToRemove:v18 completionHandler:v17];

  return v24;
}

- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(CPLEngineTransport *)self platformObject];
  id v19 = [v18 startExitTaskFromSharedScope:v17 transportScope:v16 share:v15 retentionPolicy:a6 exitSource:a7 completionHandler:v14];

  return v19;
}

- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 fetchExistingSharedLibraryScopeTaskWithCompletionHandler:v4];

  return v6;
}

- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  id v9 = [v8 acceptTaskForSharedScope:v7 completionHandler:v6];

  return v9;
}

- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  id v9 = [v8 fetchTaskForScopeWithShareURL:v7 completionHandler:v6];

  return v9;
}

- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLEngineTransport *)self platformObject];
  id v12 = [v11 updateShareTaskForScope:v10 transportScope:v9 completionHandler:v8];

  return v12;
}

- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLEngineTransport *)self platformObject];
  id v9 = [v8 createScopeTaskForScope:v7 completionHandler:v6];

  return v9;
}

- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(CPLEngineTransport *)self platformObject];
  id v21 = [v20 inMemoryDownloadTaskForResource:v19 record:v18 target:v17 transportScopeMapping:v16 clientBundleID:v15 completionHandler:v14];

  return v21;
}

- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 resourcesDownloadTaskWithCompletionHandler:v4];

  return v6;
}

- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(CPLEngineTransport *)self platformObject];
  id v10 = [v9 rampingRequestTaskForResourceType:a3 numRequested:a4 completionHandler:v8];

  return v10;
}

- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 resourceCheckTaskForResources:v13 targetMapping:v12 transportScopeMapping:v11 completionHandler:v10];

  return v15;
}

- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a3;
  v23 = [(CPLEngineTransport *)self platformObject];
  long long v24 = *(_OWORD *)&a6->var0.var3;
  v27[0] = *(_OWORD *)&a6->var0.var0;
  v27[1] = v24;
  v27[2] = *(_OWORD *)&a6->var1.var1;
  v25 = [v23 getStreamingURLTaskForResource:v22 intent:a4 hints:v21 timeRange:v27 target:v20 transportScopeMapping:v19 clientBundleID:v18 completionHandler:v17];

  return v25;
}

- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLEngineTransport *)self platformObject];
  id v12 = [v11 fetchTransportScopeForScope:v10 transportScope:v9 completionHandler:v8];

  return v12;
}

- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 getCurrentSyncAnchorWithTransportScope:v13 scope:v12 previousScopeChange:v11 completionHandler:v10];

  return v15;
}

- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 getScopeInfoWithTransportScope:v13 scope:v12 previousScopeChange:v11 completionHandler:v10];

  return v15;
}

- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 updateTransportScope:v13 scope:v12 scopeChange:v11 completionHandler:v10];

  return v15;
}

- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLEngineTransport *)self platformObject];
  id v12 = [v11 deleteTransportScope:v10 scope:v9 completionHandler:v8];

  return v12;
}

- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPLEngineTransport *)self platformObject];
  id v12 = [v11 fetchScopeListChangesForScopeListSyncAnchor:v10 progressHandler:v9 completionHandler:v8];

  return v12;
}

- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(CPLEngineTransport *)self platformObject];
  id v21 = [v20 downloadComputeStatesWithScopedIdentifiers:v19 scope:v18 sharedScope:v17 targetStorageURL:v16 transportScopeMapping:v15 completionHandler:v14];

  return v21;
}

- (id)uploadComputeStates:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetMapping:(id)a6 transportScopeMapping:(id)a7 knownRecords:(id)a8 completionHandler:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(CPLEngineTransport *)self platformObject];
  long long v24 = [v23 uploadComputeStates:v22 scope:v21 sharedScope:v20 targetMapping:v19 transportScopeMapping:v18 knownRecords:v17 completionHandler:v16];

  return v24;
}

- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(CPLEngineTransport *)self platformObject];
  id v21 = [v20 downloadBatchTaskForSyncAnchor:v19 scope:v18 transportScopeMapping:v17 currentScopeChange:v16 progressHandler:v15 completionHandler:v14];

  return v21;
}

- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [(CPLEngineTransport *)self platformObject];
  id v20 = [v19 queryTaskForCursor:v18 class:a4 scope:v17 transportScopeMapping:v16 progressHandler:v15 completionHandler:v14];

  return v20;
}

- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(CPLEngineTransport *)self platformObject];
  id v18 = [v17 reshareRecordsTaskWithRecords:v16 sourceScope:v15 destinationScope:v14 transportScopeMapping:v13 completionHandler:v12];

  return v18;
}

- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(CPLEngineTransport *)self platformObject];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __122__CPLEngineTransport_uploadBatchTaskForBatch_scope_targetMapping_transportScopeMapping_progressHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E60A7420;
  id v25 = v14;
  id v21 = v14;
  id v22 = [v20 uploadBatchTaskForBatch:v19 scope:v18 targetMapping:v17 transportScopeMapping:v16 progressHandler:v24 completionHandler:v15];

  return v22;
}

uint64_t __122__CPLEngineTransport_uploadBatchTaskForBatch_scope_targetMapping_transportScopeMapping_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CPLEngineTransport *)self platformObject];
  id v15 = [v14 fetchRecordsTaskForRecordsWithScopedIdentifiers:v13 targetMapping:v12 transportScopeMapping:v11 completionHandler:v10];

  return v15;
}

- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CPLEngineTransport *)self platformObject];
  id v8 = [v7 setupTaskUpdateDisabledFeatures:v4 completionHandler:v6];

  return v8;
}

- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLEngineTransport *)self platformObject];
  id v6 = [v5 acquireReschedulerTaskWithCompletionHandler:v4];

  return v6;
}

- (CPLSharedRecordPropertyMapping)propertyMapping
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  BOOL v3 = [v2 propertyMapping];

  return (CPLSharedRecordPropertyMapping *)v3;
}

- (Class)userIdentifierClass
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  BOOL v3 = [v2 userIdentifierClass];

  return (Class)v3;
}

- (Class)transportGroupClass
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  BOOL v3 = [v2 transportGroupClass];

  return (Class)v3;
}

- (NSArray)involvedProcesses
{
  id v2 = [(CPLEngineTransport *)self platformObject];
  BOOL v3 = [v2 involvedProcesses];

  return (NSArray *)v3;
}

- (CPLEngineTransport)initWithEngineLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLEngineTransport;
  id v6 = [(CPLEngineTransport *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_engineLibrary, v5);
    id v8 = +[CPLPlatform currentPlatform];
    uint64_t v9 = [v8 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v9;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        id v12 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v19 = v13;
          id v14 = v13;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineTransport.m"];
      [v15 handleFailureInMethod:a2, v7, v16, 25, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
  }

  return v7;
}

+ (id)platformImplementationProtocol
{
  id v2 = [(id)objc_opt_class() description];
  BOOL v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

@end