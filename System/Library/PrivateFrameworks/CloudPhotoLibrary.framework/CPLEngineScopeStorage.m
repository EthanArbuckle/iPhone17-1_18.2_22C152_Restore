@interface CPLEngineScopeStorage
- (BOOL)_activateSharedScopeIfPresentWithError:(id *)a3;
- (BOOL)_doesScopeContributeToAssetCounts:(id)a3;
- (BOOL)_dropSharingScopeIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_forceClientToPullScopeIfNecessary:(id)a3 error:(id *)a4;
- (BOOL)_handledDisabledFeaturesForScopeIfNecessary:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)_isValidSharingScope:(id)a3 forScopeIdentifier:(id)a4;
- (BOOL)_isValidSharingScopeIdentifier:(id)a3 scopeType:(int64_t)a4 forScopeIdentifier:(id)a5;
- (BOOL)_resetCompleteSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)_resetLocalSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)_setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)_setSharingScopeIdentifier:(id)a3 error:(id *)a4;
- (BOOL)activateScope:(id)a3 error:(id *)a4;
- (BOOL)addCleanupTasksForScope:(id)a3 error:(id *)a4;
- (BOOL)addRewindSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)clearAllQuotaFlagsForMainScopeWithReason:(id)a3 error:(id *)a4;
- (BOOL)clearTransportGroupsForScope:(id)a3 error:(id *)a4;
- (BOOL)clientAcknowledgedScopeChanges:(id)a3 error:(id *)a4;
- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)deactivateScope:(id)a3 error:(id *)a4;
- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)didDropSomeRecordsForScope:(id)a3;
- (BOOL)disableInitialQueriesForScope:(id)a3 error:(id *)a4;
- (BOOL)disablePrimaryScopeWithError:(id *)a3;
- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)doScopesNeedMetadataSync:(id)a3;
- (BOOL)doesScopeAllowCourtesyMingling:(id)a3;
- (BOOL)doesScopeNeedToBePulledByClient:(id)a3;
- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3;
- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3;
- (BOOL)doesScopeNeedToUpdateTransport:(id)a3;
- (BOOL)doesScopeNeedToUploadComputeState:(id)a3;
- (BOOL)doesScopeSupportToBePulledByClient:(id)a3;
- (BOOL)enablePrimaryScopeWithError:(id *)a3;
- (BOOL)hasFinishedAFullSyncForScope:(id)a3;
- (BOOL)hasFinishedInitialDownloadForScope:(id)a3;
- (BOOL)hasFinishedInitialSyncForScope:(id)a3;
- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3;
- (BOOL)hasScopeFlagsObservers;
- (BOOL)hasScopesNeedingToPullChangesFromTransport;
- (BOOL)hasScopesNeedingToPushChangesToTransport;
- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport;
- (BOOL)hasScopesNeedingToUpdateTransport;
- (BOOL)hasScopesNeedingToUploadComputeState;
- (BOOL)hasStagedSyncAnchorForScope:(id)a3;
- (BOOL)hasStagedSyncAnchors;
- (BOOL)markInitialQueryIsDoneForRecordsOfClass:(Class)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)noteDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)resetCloudRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetCompleteSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)resetCompleteSyncStateIncludingIDMappingForScope:(id)a3 error:(id *)a4;
- (BOOL)resetDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4;
- (BOOL)resetInitialSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)resetLocalRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetLocalSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)resetStableRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3;
- (BOOL)setCloudScopeIndexOnChange:(id)a3;
- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4;
- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setHasFinishedInitialDownloadForScope:(id)a3 error:(id *)a4;
- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setLocalScopeIndexOnChange:(id)a3;
- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedInitialMinglingWithError:(id *)a4;
- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 changeTypes:(unint64_t)a4 error:(id *)a5;
- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setValue:(BOOL)a3 forFlag:(int64_t)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)setupAnchorResetTransportGroupForScope:(id)a3 error:(id *)a4;
- (BOOL)setupInitialSyncTransportGroupsForScope:(id)a3 error:(id *)a4;
- (BOOL)setupResetSyncTransportGroupForScope:(id)a3 error:(id *)a4;
- (BOOL)shouldAutoactivateScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4;
- (BOOL)shouldCheckAssetsWithServerWhenOverQuotaForScope:(id)a3;
- (BOOL)shouldDropAllUploadsForScope:(id)a3 dropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5;
- (BOOL)shouldTrackAdditionalInitialSyncDatesForScope:(id)a3;
- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4;
- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)supportedFeatureVersionIsMostRecentForScope:(id)a3;
- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)updateInitialSyncTransportGroupEstimatedSize:(unint64_t)a3 assetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)updateScopeWithChange:(id)a3 error:(id *)a4;
- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)valueForFlag:(int64_t)a3 forScope:(id)a4;
- (CPLEngineScopeStorage)initWithEngineStore:(id)a3 name:(id)a4;
- (Class)classOfRecordsForInitialQueryForScope:(id)a3;
- (id)_createScopeFromScopeChange:(id)a3 error:(id *)a4;
- (id)_realScopeIdentifiersFromScopeIdentifiers:(id)a3;
- (id)_scopeChangeToBePulledByClientForScope:(id)a3;
- (id)_scopeWithIdentifier:(id)a3;
- (id)activationDateForScope:(id)a3;
- (id)allScopeIdentifiersIncludeInactive:(BOOL)a3;
- (id)createScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 flags:(int64_t)a5 transportScope:(id)a6 error:(id *)a7;
- (id)deleteDateForScope:(id)a3;
- (id)disabledDateForScope:(id)a3;
- (id)downloadTransportGroupForScope:(id)a3;
- (id)enumeratorForDeletedStagedScopes;
- (id)enumeratorForScopesIncludeInactive:(BOOL)a3;
- (id)enumeratorForScopesNeedingToPullChangesFromTransport;
- (id)enumeratorForScopesNeedingToPushChangesToTransport;
- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport;
- (id)enumeratorForScopesNeedingToUpdateTransport;
- (id)enumeratorForScopesNeedingToUploadComputeState;
- (id)enumeratorForScopesNeedingUpdateFromTransport;
- (id)enumeratorForScopesWithMingling;
- (id)filterForExcludedScopeIdentifiers:(id)a3;
- (id)filterForIncludedScopeIdentifiers:(id)a3;
- (id)flagsForScope:(id)a3;
- (id)initialMetadataDownloadDateForScope:(id)a3;
- (id)initialMetadataQueriesDateForScope:(id)a3;
- (id)initialMingleDateForScope:(id)a3;
- (id)initialSyncAnchorForScope:(id)a3;
- (id)lastDateOfClearedPushRepositoryForScope:(id)a3;
- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3;
- (id)mostCurrentChangesSyncAnchorForScope:(id)a3;
- (id)primaryScope;
- (id)remainingClassesForInitialQueryForScope:(id)a3;
- (id)rewindSyncAnchorsForScope:(id)a3;
- (id)scopeChangeForScope:(id)a3;
- (id)scopeChangesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3;
- (id)scopeForSharingScope:(id)a3;
- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3;
- (id)scopeIdentifierForLocalScopeIndex:(int64_t)a3;
- (id)scopeListSyncAnchor;
- (id)scopeWithCloudScopeIndex:(int64_t)a3;
- (id)scopeWithLocalScopeIndex:(int64_t)a3;
- (id)scopeWithStableIndex:(int64_t)a3;
- (id)scopedIdentifierForCloudScopedIdentifier:(id)a3;
- (id)scopedIdentifierForLocalScopedIdentifier:(id)a3;
- (id)sharingScopeForScope:(id)a3;
- (id)stagingScopeForScope:(id)a3;
- (id)status;
- (id)statusDictionaryForScope:(id)a3;
- (id)supervisorInfoForScope:(id)a3;
- (id)syncAnchorForScope:(id)a3;
- (id)transientSyncAnchorForScope:(id)a3;
- (id)transportScopeForScope:(id)a3;
- (id)updatedScopeFilter:(id)a3;
- (id)uploadTransportGroupForScope:(id)a3;
- (id)validCloudScopeIndexes;
- (id)validLocalScopeIndexes;
- (int64_t)busyStateForScope:(id)a3;
- (int64_t)indexForCloudScopeIdentifier:(id)a3;
- (int64_t)indexForLocalScopeIdentifier:(id)a3;
- (int64_t)pullFromTransportTaskForScope:(id)a3;
- (int64_t)pushToTransportTaskForScope:(id)a3;
- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3;
- (int64_t)transportUpdateTaskForScope:(id)a3;
- (int64_t)uploadComputeStateTaskForScope:(id)a3;
- (unint64_t)_indexOfCurrentClassForInitialQueriesForScope:(id)a3;
- (unint64_t)estimatedAssetCountForScope:(id)a3;
- (unint64_t)estimatedSizeForScope:(id)a3;
- (unint64_t)scopeType;
- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3;
- (void)_cacheScope:(id)a3;
- (void)_checkSyncManagerPriorityBoost;
- (void)_clearScopeCache;
- (void)_forceSyncManagerPriorityBoost;
- (void)_notifyScopeObserversForScope:(id)a3 flagsUpdate:(id)a4;
- (void)_removeBrokenScope:(id)a3;
- (void)_resetGlobalsForMainScope;
- (void)_updateAssetCountsWithScopeChange:(id)a3 forScope:(id)a4;
- (void)addScopeFlagsObserver:(id)a3 withIdentifier:(id)a4;
- (void)beginCreatingScopeWithIdentifier:(id)a3;
- (void)endCreatingScopeWithIdentifier:(id)a3;
- (void)removeScopeFlagsObserverWithIdentifier:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineScopeStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeObservers, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiersBeingCreated, 0);
  objc_storeStrong((id *)&self->_assetCountsToUpdate, 0);
  objc_storeStrong((id *)&self->_scopesToRemoveFromBrokenScopes, 0);
  objc_storeStrong((id *)&self->_scopeCache, 0);
}

- (BOOL)shouldDropAllUploadsForScope:(id)a3 dropReason:(id *)a4 shouldQuarantineRecords:(BOOL *)a5
{
  id v8 = a3;
  if (CPLIsInTestReadonlyMode())
  {
    BOOL v9 = 0;
    v10 = @"test read-only mode";
  }
  else
  {
    v11 = [(CPLEngineStorage *)self engineStore];
    v12 = [v11 engineLibrary];
    char v13 = [v12 iCloudLibraryClientVersionTooOld];

    if (v13)
    {
      BOOL v9 = 0;
      v10 = @"client version is too old";
    }
    else
    {
      v14 = [(CPLEngineScopeStorage *)self flagsForScope:v8];
      char v15 = [v14 flags];

      if ((v15 & 4) != 0)
      {
        BOOL v9 = 0;
        v10 = @"scope has been deleted";
      }
      else if ((v15 & 0x10) != 0)
      {
        BOOL v9 = 0;
        v10 = @"scope has been de-activated";
      }
      else if (v15)
      {
        BOOL v9 = 1;
        v10 = @"scope is read-only";
      }
      else
      {
        if ((v15 & 8) == 0)
        {
          BOOL v16 = 0;
          goto LABEL_17;
        }
        BOOL v9 = 1;
        v10 = @"scope has been disabled";
      }
    }
  }
  if (a5) {
    *a5 = v9;
  }
  *a4 = v10;
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

- (id)initialMingleDateForScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  v6 = [v5 initialMingleDateForScope:v4];

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedInitialMinglingWithError:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a4) = [v7 storeInitialMingleDate:v8 forScope:v6 error:a4];

  return (char)a4;
}

- (id)initialMetadataDownloadDateForScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 initialMetadataDownloadDateForScope:v4];

  return v6;
}

- (id)initialMetadataQueriesDateForScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 initialMetadataQueriesDateForScope:v4];

  return v6;
}

- (id)activationDateForScope:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 activationDateForScope:v4];

  return v6;
}

- (BOOL)shouldTrackAdditionalInitialSyncDatesForScope:(id)a3
{
  v3 = [(CPLEngineScopeStorage *)self activationDateForScope:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasScopeFlagsObservers
{
  return [(NSMutableDictionary *)self->_scopeObservers count] != 0;
}

- (void)removeScopeFlagsObserverWithIdentifier:(id)a3
{
}

- (void)addScopeFlagsObserver:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_scopeObservers)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scopeObservers = self->_scopeObservers;
    self->_scopeObservers = v7;
  }
  BOOL v9 = (void *)[v11 copy];
  v10 = (void *)MEMORY[0x1BA994060]();
  [(NSMutableDictionary *)self->_scopeObservers setObject:v10 forKeyedSubscript:v6];
}

- (BOOL)resetDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4
{
  BOOL v4 = [a3 scopeIdentifier];
  int v5 = [v4 isEqualToString:@"PrimarySync"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:@"_CPLLastAssetCheckOverQuotaDateForPrimarySync"];
  }
  return 1;
}

- (BOOL)noteDidCheckAssetWithServerWhenOverQuotaForScope:(id)a3 error:(id *)a4
{
  BOOL v4 = [a3 scopeIdentifier];
  int v5 = [v4 isEqualToString:@"PrimarySync"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v7 forKey:@"_CPLLastAssetCheckOverQuotaDateForPrimarySync"];
  }
  return 1;
}

- (BOOL)shouldCheckAssetsWithServerWhenOverQuotaForScope:(id)a3
{
  BOOL v4 = [a3 scopeIdentifier];
  int v5 = [v4 isEqualToString:@"PrimarySync"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:@"_CPLLastAssetCheckOverQuotaDateForPrimarySync"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v7)
      {
        id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        BOOL v9 = [v8 objectForKey:@"CPLMinimumIntervalBetweenOverQuotaRechecks"];

        if (v9)
        {
          [v9 doubleValue];
          double v11 = v10;
        }
        else
        {
          char v13 = [(CPLEngineStorage *)self engineStore];
          v14 = [v13 engineLibrary];
          char v15 = [v14 configuration];
          BOOL v16 = [v15 objectForKeyedSubscript:@"over_quota.minimum_interval_between_rechecks.seconds"];

          if (v16)
          {
            [v16 doubleValue];
            double v11 = v17;
          }
          else
          {
            double v11 = 604800.0;
          }
        }
        [v7 timeIntervalSinceNow];
        double v19 = -v18;

        if (v11 > v19)
        {
          BOOL v12 = 0;
          goto LABEL_14;
        }
      }
    }
    else
    {

      v7 = 0;
    }
    BOOL v12 = 1;
LABEL_14:

    return v12;
  }
  return 1;
}

- (void)endCreatingScopeWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((-[NSCountedSet containsObject:](self->_scopeIdentifiersBeingCreated, "containsObject:") & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      int v5 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        BOOL v12 = v6;
        __int16 v13 = 2112;
        id v14 = v10;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "Trying to call %@ for %@ too many times", buf, 0x16u);
      }
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
    BOOL v9 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, v8, 2759, @"Trying to call %@ for %@ too many times", v9, v10 object file lineNumber description];

    abort();
  }
  [(NSCountedSet *)self->_scopeIdentifiersBeingCreated removeObject:v10];
}

- (void)beginCreatingScopeWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v12 = v5;
  if (!self->_scopeIdentifiersBeingCreated)
  {
    id v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
    self->_scopeIdentifiersBeingCreated = v6;

    id v5 = v12;
  }
  id v8 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:v5];

  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v9 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v12;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Begin creation of %@ but it is already present", buf, 0xCu);
      }
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
    [v10 handleFailureInMethod:a2, self, v11, 2753, @"Begin creation of %@ but it is already present", v12 object file lineNumber description];

    abort();
  }
  [(NSCountedSet *)self->_scopeIdentifiersBeingCreated addObject:v12];
}

- (id)mostCurrentChangesSyncAnchorForScope:(id)a3
{
  id v4 = a3;
  if ([(CPLEngineScopeStorage *)self classOfRecordsForInitialQueryForScope:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(CPLEngineStorage *)self platformObject];
    id v5 = [v6 transientSyncAnchorForScope:v4];

    if (!v5)
    {
      char v9 = 0;
      v7 = [(CPLEngineStorage *)self platformObject];
      id v5 = [v7 syncAnchorForScope:v4 isCommitted:&v9];
    }
  }

  return v5;
}

- (id)supervisorInfoForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 supervisorInfoForScope:v4];

  return v6;
}

- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 storeSupervisorInfo:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (int64_t)busyStateForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 busyStateForScope:v4];

  return v6;
}

- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(CPLEngineStorage *)self platformObject];
  int v10 = [v9 storeBusyState:a3 forScope:v8 error:a5];

  if (v10)
  {
    double v11 = [v8 scopeIdentifier];
    id v12 = [(CPLEngineStorage *)self mainScopeIdentifier];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = [(CPLEngineStorage *)self engineStore];
      uint64_t v15 = [v14 engineLibrary];
      [v15 setBusyState:a3];
    }
  }

  return v10;
}

- (BOOL)addRewindSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(CPLEngineStorage *)self platformObject];
  double v11 = [v10 rewindSyncAnchorsForScope:v9];

  id v12 = v11;
  int v13 = v12;
  if (v12)
  {
    if ([v12 containsObject:v8])
    {
LABEL_8:
      BOOL v17 = 1;
      id v14 = v13;
      goto LABEL_10;
    }
    id v14 = (void *)[v13 mutableCopy];
    [v14 addObject:v8];
  }
  else
  {
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
  }
  if (v14 == v13) {
    goto LABEL_8;
  }
  uint64_t v15 = [(CPLEngineStorage *)self platformObject];
  int v16 = [v15 storeRewindSyncAnchors:v14 forScope:v9 error:a5];

  if (v16) {
    BOOL v17 = [(CPLEngineScopeStorage *)self setScopeHasChangesToPullFromTransport:v9 error:a5];
  }
  else {
    BOOL v17 = 0;
  }
LABEL_10:

  return v17;
}

- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 storeRewindSyncAnchors:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (id)rewindSyncAnchorsForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 rewindSyncAnchorsForScope:v4];

  return v6;
}

- (id)stagingScopeForScope:(id)a3
{
  id v4 = a3;
  if ([(CPLEngineScopeStorage *)self valueForFlag:64 forScope:v4])
  {
    id v5 = [(CPLEngineStorage *)self platformObject];
    int64_t v6 = [v5 stagingScopeForScope:v4];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)scopeForSharingScope:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([v4 scopeType] - 6) >= 0xFFFFFFFFFFFFFFFELL)
  {
    int64_t v6 = [(CPLEngineStorage *)self engineStore];
    v7 = [v6 sharingScopeIdentifier];

    if (v7
      && ([v4 scopeIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:v7],
          v8,
          v9))
    {
      int v10 = [(CPLEngineScopeStorage *)self primaryScope];
      if ([(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v10]
        || [(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v4])
      {
        id v5 = 0;
      }
      else
      {
        id v5 = v10;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)sharingScopeForScope:(id)a3
{
  id v4 = a3;
  if ([v4 scopeType] == 1)
  {
    id v5 = [(CPLEngineStorage *)self engineStore];
    int64_t v6 = [v5 sharingScopeIdentifier];

    if (v6
      && ([v4 scopeIdentifier],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(CPLEngineStorage *)self mainScopeIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqualToString:v8],
          v8,
          v7,
          v9))
    {
      int v10 = [(CPLEngineScopeStorage *)self primaryScope];
      double v11 = [(CPLEngineScopeStorage *)self scopeWithIdentifier:v6];
      if (v11)
      {
        id v12 = [(CPLEngineScopeStorage *)self flagsForScope:v10];
        if ([v12 valueForFlag:16])
        {
          id v13 = 0;
        }
        else if (![v12 valueForFlag:4] {
               || ([(CPLEngineScopeStorage *)self stagingScopeForScope:v11],
        }
                   id v13 = (id)objc_claimAutoreleasedReturnValue(),
                   v13,
                   v13))
        {
          id v13 = v11;
        }
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)doesScopeAllowCourtesyMingling:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self engineStore];
  int64_t v6 = [v5 sharingScopeIdentifier];

  if (v6)
  {
    v7 = [v4 scopeIdentifier];
    char v8 = [v7 isEqualToString:v6];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)updatedScopeFilter:(id)a3
{
  id v5 = a3;
  int64_t v6 = [v5 includedScopeIdentifiers];
  if ([v6 count])
  {
    v7 = [(CPLEngineScopeStorage *)self _realScopeIdentifiersFromScopeIdentifiers:v6];
    if (v6 != v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          double v11 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Unexpected new scope identifiers list", v14, 2u);
          }
        }
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
        [v12 handleFailureInMethod:a2 object:self file:v13 lineNumber:2595 description:@"Unexpected new scope identifiers list"];

        abort();
      }
      if (([v6 isEqualToSet:v7] & 1) == 0)
      {
        char v8 = [(CPLEngineStorage *)self platformObject];
        uint64_t v9 = [v8 filterForIncludedScopeIdentifiers:v7];

        id v5 = (id)v9;
      }
    }
  }
  return v5;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 filterForExcludedScopeIdentifiers:v4];

  return v6;
}

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [(CPLEngineScopeStorage *)self _realScopeIdentifiersFromScopeIdentifiers:v4];

  v7 = [v5 filterForIncludedScopeIdentifiers:v6];

  return v7;
}

- (id)_realScopeIdentifiersFromScopeIdentifiers:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self engineStore];
  int64_t v6 = [v5 sharingScopeIdentifier];

  if (v6)
  {
    v7 = [(CPLEngineScopeStorage *)self primaryScope];
    if (!v7)
    {
LABEL_16:

      goto LABEL_17;
    }
    char v8 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v7];
    if (!v8) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [(CPLEngineStorage *)self mainScopeIdentifier];
      if ([v4 containsObject:v9])
      {
        int v10 = [v8 scopeIdentifier];
        char v11 = [v4 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          id v12 = [v8 scopeIdentifier];
          uint64_t v13 = [v4 arrayByAddingObject:v12];
LABEL_12:
          id v16 = (id)v13;

LABEL_15:
          id v4 = v16;
          goto LABEL_16;
        }
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = v7;
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id obj = v4;
        uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          char v20 = 0;
          uint64_t v21 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v32 != v21) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              objc_msgSend(v16, "addObject:", v23, v29);
              v24 = [(CPLEngineStorage *)self mainScopeIdentifier];
              int v25 = [v23 isEqualToString:v24];

              if (v25)
              {
                if ((v20 & 1) == 0)
                {
                  v26 = [v8 scopeIdentifier];
                  [v16 addObject:v26];
                }
                char v20 = 1;
              }
              else
              {
                v27 = [v8 scopeIdentifier];
                char v28 = [v23 isEqualToString:v27];

                v20 |= v28;
              }
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v19);
        }

        v7 = v29;
        goto LABEL_15;
      }
      uint64_t v9 = [(CPLEngineStorage *)self mainScopeIdentifier];
      if ([v4 containsObject:v9])
      {
        id v14 = [v8 scopeIdentifier];
        char v15 = [v4 containsObject:v14];

        if ((v15 & 1) == 0)
        {
          id v12 = [v8 scopeIdentifier];
          uint64_t v13 = [v4 setByAddingObject:v12];
          goto LABEL_12;
        }
LABEL_14:
        id v16 = v4;
        goto LABEL_15;
      }
    }

    goto LABEL_14;
  }
LABEL_17:
  return v4;
}

- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 storeScopeListSyncAnchor:v6 error:a4];

  if (!v6 && v8)
  {
    self->_someScopeMightHaveToBePulledByClient = 1;
    self->_clearSomeScopeMightHaveToBePulledByClient = 0;
    self->_schedulePullFromClient = 1;
  }
  return v8;
}

- (id)scopeListSyncAnchor
{
  v2 = [(CPLEngineStorage *)self platformObject];
  v3 = [v2 scopeListSyncAnchor];

  return v3;
}

- (BOOL)shouldAutoactivateScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!+[CPLScopeChange shouldAutoActivateScopeWithType:a4])
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1) {
    dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_2_23628);
  }
  BOOL v7 = 1;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4 && !CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope)
  {
    int v8 = [(CPLEngineStorage *)self mainScopeIdentifier];
    BOOL v9 = [(CPLEngineScopeStorage *)self _isValidSharingScopeIdentifier:v6 scopeType:a4 forScopeIdentifier:v8];

    if (v9)
    {
      int v10 = [(CPLEngineStorage *)self engineStore];
      char v11 = [v10 sharingScopeIdentifier];

      if (v11 && ([v11 isEqualToString:v6] & 1) == 0)
      {
        if (_CPLSilentLogging)
        {
          BOOL v7 = 0;
          goto LABEL_22;
        }
        id v12 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138543618;
          id v16 = v6;
          __int16 v17 = 2114;
          uint64_t v18 = v11;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Won't auto-activate %{public}@ as %{public}@ is already in use", (uint8_t *)&v15, 0x16u);
        }
      }
      else
      {
        id v12 = [(CPLEngineScopeStorage *)self primaryScope];
        if (v12 && ![(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v12]) {
          goto LABEL_21;
        }
        if (!_CPLSilentLogging)
        {
          uint64_t v13 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 138543362;
            id v16 = v6;
            _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Won't auto-activate %{public}@ as iCPL is off", (uint8_t *)&v15, 0xCu);
          }
        }
      }
      BOOL v7 = 0;
LABEL_21:

LABEL_22:
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

- (BOOL)deactivateScope:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CPLEngineScopeStorage *)self flagsForScope:v6];
  if ([v7 valueForFlag:16])
  {
    BOOL v8 = 1;
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v9 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Deactivating %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [v7 setValue:1 forFlag:16];
    if ([(CPLEngineScopeStorage *)self updateFlags:v7 forScope:v6 error:a4]) {
      BOOL v8 = [(CPLEngineScopeStorage *)self _forceClientToPullScopeIfNecessary:v6 error:a4];
    }
    else {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)activateScope:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CPLEngineScopeStorage *)self flagsForScope:v6];
  if ([v7 valueForFlag:16])
  {
    if (!_CPLSilentLogging)
    {
      BOOL v8 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEFAULT, "Activating %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [v7 setValue:0 forFlag:16];
    BOOL v9 = 0;
    if ([(CPLEngineScopeStorage *)self updateFlags:v7 forScope:v6 error:a4])
    {
      if ([(CPLEngineScopeStorage *)self setTransportScope:0 forScope:v6 error:a4])
      {
        BOOL v9 = [(CPLEngineScopeStorage *)self _forceClientToPullScopeIfNecessary:v6 error:a4];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_forceClientToPullScopeIfNecessary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineStorage *)self engineStore];
  __int16 v8 = [v7 libraryOptions];

  BOOL v9 = (v8 & 0x400) == 0
    || [(CPLEngineScopeStorage *)self setScopeNeedsToBePulledByClient:v6 error:a4];

  return v9;
}

- (BOOL)disablePrimaryScopeWithError:(id *)a3
{
  id v5 = [(CPLEngineStorage *)self engineStore];
  char v6 = [v5 libraryOptions];

  if (v6)
  {
    BOOL v9 = [(CPLEngineStorage *)self platformObject];
    int v10 = [v9 primaryScope];

    if (v10) {
      BOOL v8 = [(CPLEngineScopeStorage *)self deactivateScope:v10 error:a3];
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      BOOL v7 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Client tried to disable main scope manually while the option is not set", v12, 2u);
      }
    }
    if (a3)
    {
      +[CPLErrors incorrectParametersErrorForParameter:@"libraryOptions"];
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (BOOL)enablePrimaryScopeWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(CPLEngineStorage *)self engineStore];
  char v6 = [v5 libraryOptions];

  if (v6)
  {
    BOOL v9 = [(CPLEngineStorage *)self platformObject];
    int v10 = [v9 primaryScope];

    if (v10)
    {
      if (![(CPLEngineScopeStorage *)self activateScope:v10 error:a3])
      {
LABEL_10:
        BOOL v8 = 0;
LABEL_18:

        return v8;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        int v11 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [(CPLEngineStorage *)self mainScopeIdentifier];
          int v16 = 138412290;
          __int16 v17 = v12;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v16, 0xCu);
        }
      }
      uint64_t v13 = [(CPLEngineStorage *)self mainScopeIdentifier];
      id v14 = [(CPLEngineScopeStorage *)self createScopeWithIdentifier:v13 scopeType:1 flags:0 transportScope:0 error:a3];

      if (!v14) {
        goto LABEL_10;
      }
    }
    BOOL v8 = [(CPLEngineScopeStorage *)self _activateSharedScopeIfPresentWithError:a3];
    goto LABEL_18;
  }
  if (!_CPLSilentLogging)
  {
    BOOL v7 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Client tried to enable main scope manually while the option is not set", (uint8_t *)&v16, 2u);
    }
  }
  if (!a3) {
    return 0;
  }
  +[CPLErrors incorrectParametersErrorForParameter:@"libraryOptions"];
  BOOL v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (BOOL)_activateSharedScopeIfPresentWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(CPLEngineStorage *)self engineStore];
  char v6 = [v5 sharingScopeIdentifier];

  if (v6) {
    return 1;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v7 = 1;
  BOOL v8 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", 1, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v13 scopeType] & 0xFFFFFFFFFFFFFFFELL) == 4)
        {
          id v14 = [v13 scopeIdentifier];
          BOOL v15 = -[CPLEngineScopeStorage shouldAutoactivateScopeWithIdentifier:scopeType:](self, "shouldAutoactivateScopeWithIdentifier:scopeType:", v14, [v13 scopeType]);

          if (v15)
          {
            if (!_CPLSilentLogging)
            {
              int v16 = __CPLStorageOSLogDomain_8027();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v23 = v13;
                _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Auto-activating %@ after iCPL has been turned on", buf, 0xCu);
              }
            }
            BOOL v7 = [(CPLEngineScopeStorage *)self activateScope:v13 error:a3];
            goto LABEL_18;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v7 = 1;
  }
LABEL_18:

  return v7;
}

- (id)primaryScope
{
  v2 = [(CPLEngineStorage *)self platformObject];
  v3 = [v2 primaryScope];

  return v3;
}

- (id)statusDictionaryForScope:(id)a3
{
  v75[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v6 = +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", [v4 scopeType]);
  [v5 setObject:v6 forKeyedSubscript:@"scope type"];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "localIndex"));
  v75[0] = v7;
  BOOL v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "cloudIndex"));
  v75[1] = v8;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "stableIndex"));
  v75[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  [v5 setObject:v10 forKeyedSubscript:@"indexes"];

  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __50__CPLEngineScopeStorage_statusDictionaryForScope___block_invoke;
  v73[3] = &unk_1E60A7CF0;
  id v71 = v5;
  id v74 = v71;
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x1BA994060](v73);
  id v12 = [(CPLEngineStorage *)self platformObject];
  uint64_t v13 = [(CPLEngineStorage *)self engineStore];
  id v14 = [v13 engineLibrary];
  BOOL v15 = [v14 transport];

  int v16 = [v4 creationDate];
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"creation date", v16);

  __int16 v17 = [v12 flagsForScope:v4];
  long long v18 = [v17 arrayDescription];

  if ([v18 count]) {
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"flags", v18);
  }
  uint64_t v19 = [v12 busyStateForScope:v4];
  if (v19)
  {
    long long v20 = [NSNumber numberWithInteger:v19];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"busyState", v20);
  }
  uint64_t v21 = [v12 transportScopeForScope:v4];
  v69 = (void *)v21;
  if (v21)
  {
    v22 = [v15 scopeNameForTransportScope:v21];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"zone", v22);
  }
  else
  {
    ((void (**)(void, __CFString *, __CFString *))v11)[2](v11, @"zone", @"not fetched yet");
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v12 doesScopeNeedToPushChangesToTransport:v4]) {
    [v23 addObject:@"push-to-transport"];
  }
  if ([v12 doesScopeNeedToPullChangesFromTransport:v4]) {
    [v23 addObject:@"pull-from-transport"];
  }
  if ([v12 doesScopeNeedToBePulledByClient:v4]) {
    [v23 addObject:@"client-must-pull"];
  }
  if ([v12 doesScopeNeedToUpdateTransport:v4]) {
    [v23 addObject:@"must-update-transport"];
  }
  if ([v12 doesScopeNeedToUploadComputeState:v4]) {
    [v23 addObject:@"upload-compute-states"];
  }
  if ([v23 count]) {
    ((void (**)(void, __CFString *, id))v11)[2](v11, @"todo", v23);
  }
  v68 = v23;
  v70 = v18;
  v24 = [v12 disabledDateForScope:v4];
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"disabled date", v24);

  uint64_t v25 = [v12 deleteDateForScope:v4];
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"delete date", v25);

  uint64_t v26 = [v12 initialSyncDateForScope:v4];
  v67 = (void *)v26;
  if (v26)
  {
    ((void (**)(void, __CFString *, uint64_t))v11)[2](v11, @"initial sync", v26);
  }
  else
  {
    unint64_t v27 = [(CPLEngineScopeStorage *)self estimatedSizeForScope:v4];
    unint64_t v28 = [(CPLEngineScopeStorage *)self estimatedAssetCountForScope:v4];
    if (v27 | v28)
    {
      unint64_t v29 = v28;
      v30 = self;
      id v31 = [NSString alloc];
      long long v32 = [MEMORY[0x1E4F28B68] stringFromByteCount:v27 countStyle:1];
      long long v33 = v31;
      self = v30;
      long long v34 = (void *)[v33 initWithFormat:@"%@ for %lu assets", v32, v29];
      ((void (**)(void, __CFString *, void *))v11)[2](v11, @"init. est. size", v34);
    }
  }
  v66 = [v12 initialDownloadDateForScope:v4];
  ((void (*)(void (**)(void, void, void), __CFString *))v11[2])(v11, @"initial client download");
  v65 = [v12 activationDateForScope:v4];
  ((void (*)(void (**)(void, void, void), __CFString *))v11[2])(v11, @"activation");
  v64 = [v12 initialMetadataQueriesDateForScope:v4];
  ((void (*)(void (**)(void, void, void), __CFString *))v11[2])(v11, @"initial metadata queries");
  v63 = [v12 initialMetadataDownloadDateForScope:v4];
  ((void (*)(void (**)(void, void, void), __CFString *))v11[2])(v11, @"initial metadata download");
  uint64_t v35 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v4];
  if (v35)
  {
    uint64_t v36 = [v12 initialMetadataDownloadDateForScope:v35];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"initial shared metadata download", v36);
  }
  v61 = [v12 initialMingleDateForScope:v4];
  ((void (*)(void (**)(void, void, void), __CFString *))v11[2])(v11, @"initial mingle");
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPLEngineScopeStorage supportedFeatureVersionInLastSyncForScope:](self, "supportedFeatureVersionInLastSyncForScope:", v4));
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"last supported feature version", v37);

  uint64_t v38 = [v12 lastScopeChangeUpdateDateForScope:v4];
  v60 = (void *)v38;
  if (v38)
  {
    ((void (**)(void, __CFString *, uint64_t))v11)[2](v11, @"scope info", v38);
  }
  else
  {
    v39 = [v12 scopeChangeForScope:v4];
    v40 = [v39 libraryInfo];

    if (v40) {
      v41 = @"needs update";
    }
    else {
      v41 = @"none";
    }
    ((void (**)(void, __CFString *, __CFString *))v11)[2](v11, @"scope info", v41);
  }
  v62 = (void *)v35;
  char v72 = 0;
  v42 = [v12 syncAnchorForScope:v4 isCommitted:&v72];
  if (v42)
  {
    v43 = v15;
    v44 = [v15 simpleDescriptionForSyncAnchor:v42];
    id v45 = [NSString alloc];
    if (v72) {
      v46 = "";
    }
    else {
      v46 = " uncommitted";
    }
    v47 = (void *)[v45 initWithFormat:@" %@%s", v44, v46];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"anch", v47);
  }
  else
  {
    v43 = v15;
    ((void (**)(void, __CFString *, __CFString *))v11)[2](v11, @"anch", @"none");
  }
  v48 = [(CPLEngineScopeStorage *)self remainingClassesForInitialQueryForScope:v4];
  if ([v48 count])
  {
    v49 = [v48 valueForKey:@"description"];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"queries", v49);
  }
  v50 = [v12 transientSyncAnchorForScope:v4];
  if (v50)
  {
    v51 = [v43 simpleDescriptionForSyncAnchor:v50];
    ((void (**)(void, __CFString *, void *))v11)[2](v11, @"transient", v51);
  }
  v52 = [(CPLEngineScopeStorage *)self uploadTransportGroupForScope:v4];
  [v52 cplDebugDescription];
  v59 = v43;
  v54 = v53 = self;
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"upload group", v54);

  v55 = [(CPLEngineScopeStorage *)v53 downloadTransportGroupForScope:v4];

  v56 = [v55 cplDebugDescription];
  ((void (**)(void, __CFString *, void *))v11)[2](v11, @"download group", v56);

  id v57 = v71;
  return v57;
}

uint64_t __50__CPLEngineScopeStorage_statusDictionaryForScope___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setObject:a3 forKeyedSubscript:a2];
  }
  return result;
}

- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  if (!a3) {
    return 1;
  }
  self->_someScopeMightHaveToBePulledByClient = 1;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  self->_schedulePullFromClient = 1;
  char v6 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v6 upgradeScopesWithNewLibraryOptions:a3 error:a4];

  return (char)a4;
}

- (unint64_t)estimatedAssetCountForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 estimatedAssetCountForScope:v4];

  return v6;
}

- (unint64_t)estimatedSizeForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 estimatedSizeForScope:v4];

  return v6;
}

- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v10 scopeIdentifier];
      uint64_t v13 = [MEMORY[0x1E4F28B68] stringFromByteCount:a3 countStyle:1];
      int v18 = 138412802;
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEFAULT, "Updating estimated size for %@ to %@ / %lu assets", (uint8_t *)&v18, 0x20u);
    }
  }
  id v14 = [(CPLEngineStorage *)self platformObject];
  int v15 = [v14 storeEstimatedSize:a3 estimatedAssetCount:a4 forScope:v10 error:a6];

  if (v15) {
    BOOL v16 = [(CPLEngineScopeStorage *)self updateInitialSyncTransportGroupEstimatedSize:a3 assetCount:a4 forScope:v10 error:a6];
  }
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)supportedFeatureVersionIsMostRecentForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 supportedFeatureVersionInLastSyncForScope:v4];

  return v6 > 0x13;
}

- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    uint64_t v9 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Set last supported feature version for %@ to %lu", (uint8_t *)&v13, 0x16u);
    }
  }
  id v10 = [(CPLEngineStorage *)self platformObject];
  char v11 = [v10 storeSupportedFeatureVersionInLastSync:a3 forScope:v8 error:a5];

  return v11;
}

- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 supportedFeatureVersionInLastSyncForScope:v4];

  return v6;
}

- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 lastDateOfCompletedPullFromTransportForScope:v4];

  return v6;
}

- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 storeLastDateOfClearedPushRepository:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (id)lastDateOfClearedPushRepositoryForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  unint64_t v6 = [v5 lastDateOfClearedPushRepositoryForScope:v4];

  return v6;
}

- (BOOL)hasFinishedAFullSyncForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasFinishedAFullSyncForScope:v4];

  return v6;
}

- (BOOL)setHasFinishedInitialDownloadForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineStorage *)self platformObject];
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(a4) = [v7 setInitialDownloadDate:v8 forScope:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasFinishedInitialDownloadForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 initialSyncDateForScope:v4];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(CPLEngineStorage *)self platformObject];
    id v9 = [v8 initialDownloadDateForScope:v4];
    BOOL v7 = v9 != 0;
  }
  return v7;
}

- (BOOL)hasFinishedInitialSyncForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 initialSyncDateForScope:v4];

  return v6 != 0;
}

- (id)remainingClassesForInitialQueryForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineScopeStorage *)self _indexOfCurrentClassForInitialQueriesForScope:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    unint64_t v7 = v5;
    id v8 = _ClassesForInitialQueries([v4 scopeType]);
    id v6 = objc_msgSend(v8, "subarrayWithRange:", v7, objc_msgSend(v8, "count") - v7);
  }
  return v6;
}

- (BOOL)resetInitialSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 setInitialSyncAnchor:0 forScope:v6 error:a4];

  if (v8
    && ([(CPLEngineStorage *)self platformObject],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 setClassNameOfRecordsForInitialQuery:0 forScope:v6 error:a4],
        v9,
        v10))
  {
    char v11 = [(CPLEngineStorage *)self platformObject];
    char v12 = [v11 setHasFetchedInitialSyncAnchor:0 forScope:v6 error:a4];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)initialSyncAnchorForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 initialSyncAnchorForScope:v4];

  return v6;
}

- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 setInitialSyncAnchor:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 setHasFetchedInitialSyncAnchor:v6 forScope:v8 error:a5];

  return (char)a5;
}

- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasScopeFetchedInitialSyncAnchor:v4];

  return v6;
}

- (BOOL)markInitialQueryIsDoneForRecordsOfClass:(Class)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = _ClassesForInitialQueries([v8 scopeType]);
  if (![v9 count])
  {
    char v21 = 1;
    goto LABEL_21;
  }
  unint64_t v10 = [(CPLEngineScopeStorage *)self _indexOfCurrentClassForInitialQueriesForScope:v8];
  uint64_t v11 = [v9 indexOfObject:a3];
  if (v11 != v10)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v22 = v11;
      unint64_t v23 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        Class v32 = a3;
        __int16 v33 = 2048;
        uint64_t v34 = v22;
        __int16 v35 = 2048;
        unint64_t v36 = v10;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Incorrect class passed for initial queries %@ (class index %lu instead of %lu)", buf, 0x20u);
      }
    }
    uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"Incorrect class %@ passed for initial queries", a3];
    if (a5)
    {
      *a5 = +[CPLErrors invalidCloudCacheErrorWithReason:v24];
    }

    goto LABEL_20;
  }
  if (v10 + 1 != [v9 count])
  {
    uint64_t v26 = (objc_class *)[v9 objectAtIndex:v10 + 1];
    unint64_t v27 = [(CPLEngineStorage *)self platformObject];
    unint64_t v28 = NSStringFromClass(v26);
    int v29 = [v27 setClassNameOfRecordsForInitialQuery:v28 forScope:v8 error:a5];

    if (v29)
    {
      v30 = [(CPLEngineStorage *)self platformObject];
      char v21 = [v30 storeTransientSyncAnchor:0 forScope:v8 error:a5];

      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!_CPLSilentLogging)
  {
    char v12 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v8 scopeIdentifier];
      *(_DWORD *)buf = 138412290;
      Class v32 = v13;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "All classes have been retrieved as part of the initial queries for %@. Moving to regular changes fetch", buf, 0xCu);
    }
  }
  id v14 = [(CPLEngineStorage *)self platformObject];
  int v15 = [v14 setClassNameOfRecordsForInitialQuery:&stru_1F0D5F858 forScope:v8 error:a5];

  if (!v15
    || -[CPLEngineScopeStorage shouldTrackAdditionalInitialSyncDatesForScope:](self, "shouldTrackAdditionalInitialSyncDatesForScope:", v8)&& (-[CPLEngineStorage platformObject](self, "platformObject"), unint64_t v16 = objc_claimAutoreleasedReturnValue(), [MEMORY[0x1E4F1C9C8] date], v17 = objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "storeInitialMetadataQueriesDate:forScope:error:", v17, v8, a5), v17, v16, !v18))
  {
LABEL_20:
    char v21 = 0;
    goto LABEL_21;
  }
  uint64_t v19 = [(CPLEngineScopeStorage *)self initialSyncAnchorForScope:v8];
  __int16 v20 = [(CPLEngineStorage *)self platformObject];
  char v21 = [v20 storeTransientSyncAnchor:v19 forScope:v8 error:a5];

LABEL_21:
  return v21;
}

- (Class)classOfRecordsForInitialQueryForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineScopeStorage *)self _indexOfCurrentClassForInitialQueriesForScope:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = 0;
  }
  else
  {
    unint64_t v7 = v5;
    id v8 = _ClassesForInitialQueries([v4 scopeType]);
    char v6 = [v8 objectAtIndex:v7];
  }
  return (Class)v6;
}

- (unint64_t)_indexOfCurrentClassForInitialQueriesForScope:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = _ClassesForInitialQueries([v4 scopeType]);
  if ([v5 count])
  {
    char v6 = [(CPLEngineStorage *)self platformObject];
    unint64_t v7 = [v6 classNameOfRecordsForInitialQueryForScope:v4];

    if (v7)
    {
      if (![v7 length])
      {
LABEL_17:
        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_18;
      }
      Class v8 = NSClassFromString((NSString *)v7);
      if (!v8)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v11 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)unint64_t v16 = 138412290;
            *(void *)&v16[4] = v7;
            char v12 = "Unable to find a class named '%@' for initial queries. Marking store as corrupted";
            goto LABEL_14;
          }
LABEL_15:
        }
LABEL_16:
        int v13 = [(CPLEngineStorage *)self engineStore];
        id v14 = [v13 engineLibrary];
        [v14 reportLibraryCorrupted];

        goto LABEL_17;
      }
      Class v9 = v8;
      unint64_t v10 = [v5 indexOfObject:v8];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v11 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)unint64_t v16 = 138412290;
            *(void *)&v16[4] = v9;
            char v12 = "Incorrect class %@ for initial queries. Marking store as corupted";
LABEL_14:
            _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, v12, v16, 0xCu);
            goto LABEL_15;
          }
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    else
    {
      unint64_t v10 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:

  return v10;
}

- (BOOL)disableInitialQueriesForScope:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    unint64_t v7 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      Class v8 = [v6 scopeIdentifier];
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Disabling initial queries for %@. Moving to regular changes fetch", (uint8_t *)&v16, 0xCu);
    }
  }
  Class v9 = [(CPLEngineStorage *)self platformObject];
  int v10 = [v9 setClassNameOfRecordsForInitialQuery:&stru_1F0D5F858 forScope:v6 error:a4];

  if (v10
    && ([(CPLEngineStorage *)self platformObject],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 storeTransientSyncAnchor:0 forScope:v6 error:a4],
        v11,
        v12))
  {
    int v13 = [(CPLEngineStorage *)self platformObject];
    char v14 = [v13 setHasFetchedInitialSyncAnchor:1 forScope:v6 error:a4];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 storeTransientSyncAnchor:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (id)transientSyncAnchorForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 transientSyncAnchorForScope:v4];

  return v6;
}

- (BOOL)hasStagedSyncAnchors
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasStagedSyncAnchors];

  return v3;
}

- (BOOL)hasStagedSyncAnchorForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasStagedSyncAnchorForScope:v4];

  return v6;
}

- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 discardStagedSyncAnchorWithScopeFilter:v6 error:a4];

  return (char)a4;
}

- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 discardStagedSyncAnchorForScope:v6 error:a4];

  return (char)a4;
}

- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 commitSyncAnchorForScope:v6 error:a4];

  return (char)a4;
}

- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 setSyncAnchor:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (id)syncAnchorForScope:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 syncAnchorForScope:v4 isCommitted:&v8];

  return v6;
}

- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 setDidDropSomeRecordsForScope:v6 error:a4];

  return (char)a4;
}

- (BOOL)didDropSomeRecordsForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 didDropSomeRecordsForScope:v4];

  return v6;
}

- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(CPLEngineScopeStorage *)self _doesScopeContributeToAssetCounts:v9]) {
    [(CPLEngineScopeStorage *)self _updateAssetCountsWithScopeChange:v8 forScope:v9];
  }
  int v10 = [v9 scopeIdentifier];
  uint64_t v11 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    int v13 = [(CPLEngineStorage *)self engineStore];
    char v14 = [v13 engineLibrary];

    int v15 = [v8 libraryInfo];
    int v16 = [v15 accountFlagsData];
    if (v16) {
      [v14 updateAccountFlagsData:v16];
    }
    [v14 setICloudLibraryClientVersionTooOld:0];
    objc_msgSend(v14, "setIsStuckInExitForSharedLibrary:", objc_msgSend(v8, "hasProblematicFormerSharedScope"));
  }
  char v31 = 0;
  uint64_t v17 = [v8 scopeType];
  if (v17 != [v9 scopeType]
    && !-[CPLEngineScopeStorage _setScopeType:forScope:error:](self, "_setScopeType:forScope:error:", [v8 scopeType], v9, a5))
  {
    goto LABEL_21;
  }
  uint64_t v18 = [(CPLEngineStorage *)self platformObject];
  LODWORD(v19) = [v18 storeScopeChange:v8 forScope:v9 scopeChangeHasBeenUpdated:&v31 error:a5];

  if (v19 && v31)
  {
    __int16 v20 = [(CPLEngineStorage *)self platformObject];
    char v21 = [v20 flagsForScope:v9];
    int v22 = [v21 valueForFlag:0x10000];

    if (!v22) {
      goto LABEL_25;
    }
    if (!_CPLSilentLogging)
    {
      unint64_t v23 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v33 = v10;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_DEFAULT, "Scope change for %@ has been updated, notifying client: %@", buf, 0x16u);
      }
    }
    if ([(CPLEngineScopeStorage *)self setScopeNeedsToBePulledByClient:v9 error:a5])
    {
LABEL_25:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_20;
      }
      if (![v8 isCurrentUserExiting]) {
        goto LABEL_20;
      }
      uint64_t v24 = NSString;
      uint64_t v25 = [v8 scopeIdentifier];
      uint64_t v26 = [v24 stringWithFormat:@"scope change with current user exiting, scopeIdentifier: %@", v25];
      BOOL v27 = [(CPLEngineScopeStorage *)self clearAllQuotaFlagsForMainScopeWithReason:v26 error:a5];

      if (v27)
      {
LABEL_20:
        unint64_t v28 = [(CPLEngineStorage *)self engineStore];
        uint64_t v19 = [v28 engineLibrary];
        int v29 = [v19 supervisor];
        [v29 scopeStorage:self didUpdateScopeChange:v8 forScope:v9];

        LOBYTE(v19) = 1;
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v19) = 0;
  }
LABEL_22:

  return (char)v19;
}

- (void)_updateAssetCountsWithScopeChange:(id)a3 forScope:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v27 = v6;
  id v8 = [v6 libraryInfo];
  id v9 = [v8 assetCounts];
  int v10 = (NSDictionary *)[v9 mutableCopy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 enumeratorForScopesIncludeInactive:0];

  id obj = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v18 = [v17 scopeIdentifier];
        uint64_t v19 = [v7 scopeIdentifier];
        if (([v18 isEqualToString:v19] & 1) == 0)
        {
          BOOL v20 = [(CPLEngineScopeStorage *)self _doesScopeContributeToAssetCounts:v17];

          if (!v20) {
            continue;
          }
          char v21 = [(CPLEngineStorage *)self platformObject];
          uint64_t v18 = [v21 scopeChangeForScope:v17];

          uint64_t v19 = [v18 libraryInfo];
          int v22 = [v19 assetCounts];
          unint64_t v23 = v22;
          if (v10)
          {

            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __68__CPLEngineScopeStorage__updateAssetCountsWithScopeChange_forScope___block_invoke;
            v29[3] = &unk_1E60AAEF8;
            int v10 = v10;
            v30 = v10;
            [(NSDictionary *)v23 enumerateKeysAndObjectsUsingBlock:v29];
            uint64_t v24 = v30;
            uint64_t v19 = v23;
          }
          else
          {
            int v10 = (NSDictionary *)[(NSDictionary *)v22 mutableCopy];
            uint64_t v24 = v23;
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  assetCountsToUpdate = self->_assetCountsToUpdate;
  self->_assetCountsToUpdate = v10;
  uint64_t v26 = v10;

  self->_shouldUpdateAssetCountsAtEndOfTransaction = 1;
}

void __68__CPLEngineScopeStorage__updateAssetCountsWithScopeChange_forScope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id v12 = [v6 objectForKeyedSubscript:v8];
  uint64_t v9 = [v12 integerValue];
  uint64_t v10 = [v7 integerValue];

  uint64_t v11 = [v5 numberWithInteger:v10 + v9];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v8];
}

- (BOOL)_doesScopeContributeToAssetCounts:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 scopeIdentifier];
  id v6 = [(CPLEngineStorage *)self mainScopeIdentifier];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else if (([v4 scopeType] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v9 = [(CPLEngineStorage *)self mainScopeIdentifier];
    BOOL v8 = [(CPLEngineScopeStorage *)self _isValidSharingScope:v4 forScopeIdentifier:v9];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)scopeChangeForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 scopeChangeForScope:v4];

  return v6;
}

- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 scopeIdentifier];
  uint64_t v11 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v13 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v9 scopeIdentifier];
        int v29 = 138412290;
        v30 = v14;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "%@ transport scope exists", (uint8_t *)&v29, 0xCu);
      }
    }
    uint64_t v15 = [(CPLEngineStorage *)self engineStore];
    int v16 = [v15 engineLibrary];
    [v16 setICloudLibraryExists:v8 != 0];
  }
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v17 = [(CPLEngineStorage *)self platformObject];
  uint64_t v18 = [v17 transportScopeForScope:v9];

  if (!v18)
  {
LABEL_11:

LABEL_12:
    int v22 = [(CPLEngineStorage *)self platformObject];
    int v23 = [v22 setTransportScope:v8 forScope:v9 error:a5];

    if (v8 || !v23)
    {
      char v24 = v23 ^ 1;
      if (!v8) {
        char v24 = 1;
      }
      if ((v24 & 1) == 0)
      {
        LOBYTE(v23) = 1;
        if ([(CPLEngineScopeStorage *)self doesScopeNeedToUpdateTransport:v9]) {
          self->_scheduleATransportUpdate = 1;
        }
      }
    }
    else
    {
      self->_scheduleAScopeUpdate = 1;
    }
    goto LABEL_25;
  }
  uint64_t v19 = [(CPLEngineStorage *)self engineStore];
  BOOL v20 = [v19 engineLibrary];
  char v21 = [v20 transport];

  if ([v21 isNewTransportScope:v8 compatibleWithOldTransportScope:v18])
  {

    goto LABEL_11;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v25 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v21 descriptionForTransportScope:v18];
      BOOL v27 = [v21 descriptionForTransportScope:v8];
      int v29 = 138412546;
      v30 = v26;
      __int16 v31 = 2112;
      long long v32 = v27;
      _os_log_impl(&dword_1B4CAC000, v25, OS_LOG_TYPE_ERROR, "Trying to change a transport scope %@ to an incompatible one (%@) - ignoring", (uint8_t *)&v29, 0x16u);
    }
  }

  LOBYTE(v23) = 1;
LABEL_25:

  return v23;
}

- (id)transportScopeForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 transportScopeForScope:v4];

  return v6;
}

- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4
{
  self->_scheduleAScopeUpdate = 1;
  id v6 = a3;
  char v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 setScopeNeedsUpdateFromTransport:v6 error:a4];

  return (char)a4;
}

- (BOOL)clearTransportGroupsForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 storeUploadTransportGroup:0 forScope:v6 error:a4];

  if (v8)
  {
    id v9 = [(CPLEngineStorage *)self platformObject];
    char v10 = [v9 storeDownloadTransportGroup:0 forScope:v6 error:a4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)setupAnchorResetTransportGroupForScope:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CPLEngineScopeStorage *)self hasFinishedInitialSyncForScope:v6])
  {
    uint64_t v7 = [(CPLEngineScopeStorage *)self downloadTransportGroupForScope:v6];
    if (v7)
    {
      int v8 = (void *)v7;
      char v9 = 1;
    }
    else
    {
      char v10 = [(CPLEngineStorage *)self engineStore];
      uint64_t v11 = [v10 engineLibrary];
      int v12 = [v11 transport];
      int v8 = [v12 createGroupForInitialDownload];

      if (!_CPLSilentLogging)
      {
        uint64_t v13 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v6 scopeIdentifier];
          uint64_t v15 = [v8 cplDebugDescription];
          int v18 = 138412546;
          uint64_t v19 = v14;
          __int16 v20 = 2112;
          char v21 = v15;
          _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Set up anchor reset download transport group for %@ to %@", (uint8_t *)&v18, 0x16u);
        }
      }
      int v16 = [(CPLEngineStorage *)self platformObject];
      char v9 = [v16 storeDownloadTransportGroup:v8 forScope:v6 error:a4];
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)setupResetSyncTransportGroupForScope:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CPLEngineScopeStorage *)self hasFinishedInitialSyncForScope:v6])
  {
    uint64_t v7 = [(CPLEngineScopeStorage *)self uploadTransportGroupForScope:v6];
    if (v7)
    {
      int v8 = (void *)v7;
      char v9 = 1;
    }
    else
    {
      char v10 = [(CPLEngineStorage *)self engineStore];
      uint64_t v11 = [v10 engineLibrary];
      int v12 = [v11 transport];

      uint64_t v13 = [v12 createGroupForResetSync];
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v6 scopeIdentifier];
          int v16 = [v13 cplDebugDescription];
          int v24 = 138412546;
          uint64_t v25 = v15;
          __int16 v26 = 2112;
          BOOL v27 = v16;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Set up reset sync upload transport group for %@ to %@", (uint8_t *)&v24, 0x16u);
        }
      }
      uint64_t v17 = [(CPLEngineStorage *)self platformObject];
      int v18 = [v17 storeUploadTransportGroup:v13 forScope:v6 error:a4];

      if (v18)
      {
        int v8 = [v12 createGroupForInitialDownload];

        if (!_CPLSilentLogging)
        {
          uint64_t v19 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v20 = [v6 scopeIdentifier];
            char v21 = [v8 cplDebugDescription];
            int v24 = 138412546;
            uint64_t v25 = v20;
            __int16 v26 = 2112;
            BOOL v27 = v21;
            _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_DEFAULT, "Set up reset sync download transport group for %@ to %@", (uint8_t *)&v24, 0x16u);
          }
        }
        uint64_t v22 = [(CPLEngineStorage *)self platformObject];
        char v9 = [v22 storeDownloadTransportGroup:v8 forScope:v6 error:a4];
      }
      else
      {
        char v9 = 0;
        int v8 = v13;
      }
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)updateInitialSyncTransportGroupEstimatedSize:(unint64_t)a3 assetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [(CPLEngineScopeStorage *)self uploadTransportGroupForScope:v10];
  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      int v12 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v10 scopeIdentifier];
        int v17 = 138412290;
        int v18 = v13;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEFAULT, "Updating upload transfer group estimated upload sizes for %@", (uint8_t *)&v17, 0xCu);
      }
    }
    [v11 setRoughCPLRecordCount:a4];
    [v11 setRoughCPLUploadEstimatedSize:a3];
    uint64_t v14 = [(CPLEngineStorage *)self platformObject];
    char v15 = [v14 storeUploadTransportGroup:v11 forScope:v10 error:a6];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (BOOL)setupInitialSyncTransportGroupsForScope:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CPLEngineScopeStorage *)self uploadTransportGroupForScope:v6];
  if (v7)
  {
    int v8 = (void *)v7;
    if (_CPLSilentLogging)
    {
      char v10 = 1;
      goto LABEL_22;
    }
    char v9 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Initial upload group has already been set", (uint8_t *)&v26, 2u);
    }
    char v10 = 1;
  }
  else
  {
    uint64_t v11 = [(CPLEngineStorage *)self engineStore];
    int v12 = [v11 engineLibrary];
    char v9 = [v12 transport];

    uint64_t v13 = [v9 createGroupForInitialUpload];
    unint64_t v14 = [(CPLEngineScopeStorage *)self estimatedSizeForScope:v6];
    unint64_t v15 = [(CPLEngineScopeStorage *)self estimatedAssetCountForScope:v6];
    if (v14) {
      [v13 setRoughCPLUploadEstimatedSize:v14];
    }
    if (v15) {
      [v13 setRoughCPLRecordCount:v15];
    }
    if (!_CPLSilentLogging)
    {
      int v16 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [v6 scopeIdentifier];
        int v18 = [v13 cplDebugDescription];
        int v26 = 138412546;
        BOOL v27 = v17;
        __int16 v28 = 2112;
        int v29 = v18;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Set up initial upload transport group for %@ to %@", (uint8_t *)&v26, 0x16u);
      }
    }
    uint64_t v19 = [(CPLEngineStorage *)self platformObject];
    int v20 = [v19 storeUploadTransportGroup:v13 forScope:v6 error:a4];

    if (v20)
    {
      int v8 = [v9 createGroupForInitialDownload];

      if (!_CPLSilentLogging)
      {
        char v21 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v6 scopeIdentifier];
          int v23 = [v8 cplDebugDescription];
          int v26 = 138412546;
          BOOL v27 = v22;
          __int16 v28 = 2112;
          int v29 = v23;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_DEFAULT, "Set up initial download transport group for %@ to %@", (uint8_t *)&v26, 0x16u);
        }
      }
      int v24 = [(CPLEngineStorage *)self platformObject];
      char v10 = [v24 storeDownloadTransportGroup:v8 forScope:v6 error:a4];
    }
    else
    {
      char v10 = 0;
      int v8 = v13;
    }
  }

LABEL_22:
  return v10;
}

- (id)downloadTransportGroupForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 downloadTransportGroupForScope:v4];

  return v6;
}

- (id)uploadTransportGroupForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 uploadTransportGroupForScope:v4];

  return v6;
}

- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStorage *)self platformObject];
  int v8 = [v7 resetSyncStateForScope:v6 error:a4];

  if (!v8) {
    goto LABEL_8;
  }
  if (!_CPLSilentLogging)
  {
    char v9 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = [v6 scopeIdentifier];
      int v16 = 138412290;
      int v17 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Disabling initial queries for %@ after a reset of sync anchor", (uint8_t *)&v16, 0xCu);
    }
  }
  uint64_t v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 setClassNameOfRecordsForInitialQuery:&stru_1F0D5F858 forScope:v6 error:a4];

  if (v12)
  {
    uint64_t v13 = [(CPLEngineStorage *)self platformObject];
    char v14 = [v13 setHasFetchedInitialSyncAnchor:1 forScope:v6 error:a4];
  }
  else
  {
LABEL_8:
    char v14 = 0;
  }

  return v14;
}

- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [v9 scopeIdentifier];
  uint64_t v11 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = [(CPLEngineStorage *)self engineStore];
    char v14 = [v13 engineLibrary];
    [v14 setExitDeleteTime:v8];
  }
  unint64_t v15 = [(CPLEngineStorage *)self platformObject];
  char v16 = [v15 setDeleteDate:v8 forScope:v9 error:a5];

  return v16;
}

- (id)deleteDateForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 deleteDateForScope:v4];

  return v6;
}

- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  char v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 setDisabledDate:v9 forScope:v8 error:a5];

  return (char)a5;
}

- (id)disabledDateForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 disabledDateForScope:v4];

  return v6;
}

- (BOOL)clearAllQuotaFlagsForMainScopeWithReason:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Clearing all over-quota flags for main scope optimistically, reason: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  id v8 = [(CPLEngineScopeStorage *)self primaryScope];
  if (!v8)
  {
LABEL_11:
    int v17 = [(CPLEngineStorage *)self engineStore];
    id v9 = [v17 engineLibrary];

    [v9 setIsExceedingQuota:0];
    [v9 setIsExceedingSharedLibraryQuota:0];
    goto LABEL_12;
  }
  id v9 = [(CPLEngineScopeStorage *)self flagsForScope:v8];
  [v9 setValue:0 forFlag:2];
  char v10 = [(CPLEngineStorage *)self platformObject];
  int v11 = [v10 updateFlags:v9 forScope:v8 error:a4];

  [(CPLEngineScopeStorage *)self _notifyScopeObserversForScope:v8 flagsUpdate:v9];
  if (v11)
  {
    uint64_t v12 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v8];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      char v14 = [(CPLEngineScopeStorage *)self flagsForScope:v12];

      [v14 setValue:0 forFlag:2];
      unint64_t v15 = [(CPLEngineStorage *)self platformObject];
      int v16 = [v15 updateFlags:v14 forScope:v13 error:a4];

      [(CPLEngineScopeStorage *)self _notifyScopeObserversForScope:v13 flagsUpdate:v14];
      if (!v16) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return 1;
}

- (BOOL)valueForFlag:(int64_t)a3 forScope:(id)a4
{
  unint64_t v5 = [(CPLEngineScopeStorage *)self flagsForScope:a4];
  LOBYTE(a3) = [v5 valueForFlag:a3];

  return a3;
}

- (BOOL)setValue:(BOOL)a3 forFlag:(int64_t)a4 forScope:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  int v11 = [(CPLEngineScopeStorage *)self flagsForScope:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 valueForFlag:a4] == v8)
    {
      LOBYTE(a6) = 1;
    }
    else
    {
      [v12 setValue:v8 forFlag:a4];
      LOBYTE(a6) = [(CPLEngineScopeStorage *)self updateFlags:v12 forScope:v10 error:a6];
    }
  }
  else if (a6)
  {
    uint64_t v13 = [v10 scopeIdentifier];
    *a6 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v13];

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 updatedFlagsMask];
  uint64_t v11 = [(CPLEngineScopeStorage *)self flagsForScope:v9];
  uint64_t v12 = (void *)v11;
  v78 = a5;
  if ((v10 & 0x10) != 0)
  {
    if ([v8 valueForFlag:16])
    {
      int v13 = 0;
    }
    else
    {
      if (![(CPLEngineScopeStorage *)self resetDidCheckAssetWithServerWhenOverQuotaForScope:v9 error:a5])goto LABEL_117; {
      unint64_t v15 = [(CPLEngineStorage *)self platformObject];
      }
      int v16 = [MEMORY[0x1E4F1C9C8] date];
      int v17 = [v15 storeActivationDate:v16 forScope:v9 error:a5];

      if (!v17) {
        goto LABEL_117;
      }
      uint64_t v18 = [v9 scopeIdentifier];
      int v19 = [(CPLEngineStorage *)self mainScopeIdentifier];
      int v13 = [v18 isEqualToString:v19];
    }
    BOOL v14 = (v10 & 4) == 0;
    id v20 = v8;
  }
  else
  {
    int v13 = 0;
    if ((v10 & 4) == 0)
    {
      int v77 = 0;
      BOOL v14 = 1;
      goto LABEL_26;
    }
    id v20 = (void *)v11;
    BOOL v14 = 0;
  }
  uint64_t v21 = [(CPLEngineStorage *)self engineStore];
  __int16 v22 = [v21 libraryOptions];

  unsigned __int8 v23 = [v8 valueForFlag:0x10000];
  int v24 = [v20 valueForFlag:16];
  if (v14) {
    uint64_t v25 = v12;
  }
  else {
    uint64_t v25 = v8;
  }
  int v26 = [v25 valueForFlag:4];
  if (v24 && v26)
  {
    if ((v23 & ((v22 & 0x400) != 0)) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v48 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = [v9 scopeIdentifier];
          *(_DWORD *)buf = 138412290;
          id v80 = v49;
          _os_log_impl(&dword_1B4CAC000, v48, OS_LOG_TYPE_DEFAULT, "Deleting inactive scope %@", buf, 0xCu);
        }
      }
      v50 = [v9 scopeIdentifier];
      LOBYTE(v51) = [(CPLEngineScopeStorage *)self deleteScopeWithIdentifier:v50 error:v78];
      goto LABEL_122;
    }
    int v77 = v13;
    BOOL v27 = [v9 scopeIdentifier];
    int v28 = [(CPLEngineScopeStorage *)self resetCloudRecordsForScopeWithIdentifier:v27 error:v78];
    goto LABEL_25;
  }
  int v77 = v13;
  if (v24)
  {
    int v29 = [(CPLEngineStorage *)self platformObject];
    uint64_t v30 = [v29 activationDateForScope:v9];

    if (v30)
    {
      if (!_CPLSilentLogging)
      {
        __int16 v31 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v80 = v9;
          _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_DEFAULT, "Clearing activation date for %@", buf, 0xCu);
        }
      }
      BOOL v27 = [(CPLEngineStorage *)self platformObject];
      int v28 = [v27 storeActivationDate:0 forScope:v9 error:v78];
LABEL_25:
      BOOL v32 = v28;

      goto LABEL_27;
    }
  }
LABEL_26:
  BOOL v32 = 1;
LABEL_27:
  uint64_t v33 = [v9 scopeIdentifier];
  long long v34 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v35 = [v33 isEqualToString:v34];

  if (v35)
  {
    uint64_t v36 = [(CPLEngineStorage *)self engineStore];
    uint64_t v37 = [v36 engineLibrary];

    if (!v14) {
      objc_msgSend(v37, "setICloudLibraryHasBeenWiped:", objc_msgSend(v8, "valueForFlag:", 4));
    }
    uint64_t v38 = v78;
    if ((v10 & 2) != 0) {
      objc_msgSend(v37, "setIsExceedingQuota:", objc_msgSend(v8, "valueForFlag:", 2));
    }
  }
  else
  {
    v39 = [(CPLEngineStorage *)self mainScopeIdentifier];
    BOOL v40 = [(CPLEngineScopeStorage *)self _isValidSharingScope:v9 forScopeIdentifier:v39];

    uint64_t v38 = v78;
    if (!v40) {
      goto LABEL_36;
    }
    v41 = [(CPLEngineStorage *)self engineStore];
    uint64_t v37 = [v41 engineLibrary];

    if ((v10 & 2) != 0) {
      objc_msgSend(v37, "setIsExceedingSharedLibraryQuota:", objc_msgSend(v8, "valueForFlag:", 2));
    }
  }

LABEL_36:
  if (!v32 || (v10 & 0x40) == 0) {
    goto LABEL_39;
  }
  if ([v12 valueForFlag:64])
  {
    BOOL v32 = 1;
LABEL_39:
    if (!v32) {
      goto LABEL_51;
    }
    goto LABEL_46;
  }
  if (!_CPLSilentLogging)
  {
    v42 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v80 = v9;
      _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_DEFAULT, "%@ has been staged - reset sync anchor", buf, 0xCu);
    }
  }
  BOOL v32 = [(CPLEngineScopeStorage *)self resetSyncAnchorForScope:v9 error:v38];
  if (!v32)
  {
LABEL_51:
    if ((v10 & 0x10) == 0) {
      goto LABEL_75;
    }
LABEL_52:
    if (!v32) {
      goto LABEL_75;
    }
    int v43 = [v8 valueForFlag:16];
    int v44 = [v12 valueForFlag:16];
    if (!v43 || (v44 & 1) != 0)
    {
      if ((v43 | v44 ^ 1))
      {
LABEL_60:
        BOOL v32 = 1;
LABEL_72:
        v54 = [v9 scopeIdentifier];
        v55 = [(CPLEngineStorage *)self mainScopeIdentifier];
        int v56 = [v54 isEqualToString:v55];

        if (v56) {
          self->_shouldResetGlobalsForMainScope = 1;
        }
        [(CPLEngineScopeStorage *)self _clearScopeCache];
        uint64_t v38 = v78;
        goto LABEL_75;
      }
      if ([(CPLEngineScopeStorage *)self _setSharingScopeIdentifier:v9 error:v38]&& [(CPLEngineScopeStorage *)self setScopeHasChangesToPullFromTransport:v9 error:v38]&& [(CPLEngineScopeStorage *)self setScopeNeedsToBePulledByClient:v9 error:v38])
      {
        if ([(CPLEngineScopeStorage *)self _doesScopeContributeToAssetCounts:v9])
        {
          v52 = [(CPLEngineStorage *)self platformObject];
          v53 = [v52 scopeChangeForScope:v9];

          [(CPLEngineScopeStorage *)self _updateAssetCountsWithScopeChange:v53 forScope:v9];
        }
        goto LABEL_60;
      }
    }
    else if ([(CPLEngineScopeStorage *)self resetCompleteSyncStateIncludingIDMappingForScope:v9 error:v38])
    {
      uint64_t v45 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v9];
      if (!v45)
      {
        v76 = [v9 scopeIdentifier];
        BOOL v32 = [(CPLEngineScopeStorage *)self _dropSharingScopeIdentifier:v76 error:v38];

        if (!v32) {
          goto LABEL_72;
        }
        goto LABEL_125;
      }
      v46 = (void *)v45;
      BOOL v47 = [(CPLEngineScopeStorage *)self setValue:1 forFlag:16 forScope:v45 error:v38];

      if (v47)
      {
LABEL_125:
        if ([(CPLEngineScopeStorage *)self _doesScopeContributeToAssetCounts:v9]) {
          [(CPLEngineScopeStorage *)self _updateAssetCountsWithScopeChange:0 forScope:v9];
        }
        goto LABEL_60;
      }
    }
    BOOL v32 = 0;
    goto LABEL_72;
  }
LABEL_46:
  if ((v10 & 8) == 0) {
    goto LABEL_51;
  }
  if (([v8 valueForFlag:8] & 1) != 0
    || ![v12 valueForFlag:8]
    || ([v12 valueForFlag:16] & 1) != 0)
  {
    BOOL v32 = 1;
    goto LABEL_51;
  }
  if (!_CPLSilentLogging)
  {
    v70 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      id v71 = [v9 scopeIdentifier];
      *(_DWORD *)buf = 138412290;
      id v80 = v71;
      _os_log_impl(&dword_1B4CAC000, v70, OS_LOG_TYPE_ERROR, "%@ has been re-enabled - triggering a reset sync", buf, 0xCu);
    }
  }
  char v72 = [(CPLEngineStorage *)self engineStore];
  int v73 = [v72 resetLocalSyncStateWithCause:@"scope has been re-enabled" error:v38];

  if (!v73) {
    goto LABEL_117;
  }
  BOOL v32 = 1;
  self->_schedulePullFromClient = 1;
  if ((v10 & 0x10) != 0) {
    goto LABEL_52;
  }
LABEL_75:
  if (v32 && (v10 & 0x44) != 0)
  {
    if ([v12 valueForFlag:4]) {
      int v57 = [v12 valueForFlag:64] ^ 1;
    }
    else {
      int v57 = 0;
    }
    BOOL v32 = ![v8 valueForFlag:4]
       || ((v57 | [v8 valueForFlag:64]) & 1) != 0
       || [(CPLEngineScopeStorage *)self addCleanupTasksForScope:v9 error:v38];
  }
  if (!v14 && v32 && [v8 valueForFlag:4])
  {
    BOOL v32 = [(CPLEngineScopeStorage *)self setScopeNeedsToBePulledByClient:v9 error:v38];
    if (v32) {
      [(CPLEngineScopeStorage *)self _removeBrokenScope:v9];
    }
    v58 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v9];
    if (v58) {
      BOOL v32 = [(CPLEngineScopeStorage *)self setValue:1 forFlag:16 forScope:v58 error:v38];
    }
  }
  if (v32 && (v10 & 0x20) != 0)
  {
    if ([v8 valueForFlag:32])
    {
      if (![(CPLEngineScopeStorage *)self setScopeNeedsToUpdateTransport:v9 error:v38])goto LABEL_117; {
      [(CPLEngineScopeStorage *)self _removeBrokenScope:v9];
      }
    }
    BOOL v32 = 1;
  }
  if (v32 && (v10 & 0x20000) != 0)
  {
    if ([v8 valueForFlag:0x20000])
    {
      v59 = [(CPLEngineStorage *)self engineStore];
      v60 = [v59 pushRepository];
      v61 = [v9 scopeIdentifier];
      int v62 = [v60 hasChangesInScopeWithIdentifier:v61];

      uint64_t v38 = v78;
      if (v62)
      {
        self->_schedulePushHighPriorityToTransportChangeTypes = 122;
        goto LABEL_103;
      }
    }
  }
  if (!v32)
  {
LABEL_117:
    LOBYTE(v51) = 0;
    goto LABEL_123;
  }
LABEL_103:
  v63 = [(CPLEngineStorage *)self platformObject];
  int v64 = [v63 updateFlags:v8 forScope:v9 error:v38];

  [(CPLEngineScopeStorage *)self _notifyScopeObserversForScope:v9 flagsUpdate:v8];
  if (!v64) {
    goto LABEL_117;
  }
  [(CPLEngineScopeStorage *)self _checkSyncManagerPriorityBoost];
  v65 = [v9 scopeIdentifier];
  v66 = [(CPLEngineStorage *)self mainScopeIdentifier];
  if ([v65 isEqualToString:v66])
  {

    int v67 = v77;
    if ((v10 & 0x7C) != 0) {
      goto LABEL_106;
    }
LABEL_109:
    BOOL v51 = 1;
    goto LABEL_120;
  }
  v69 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v67 = v77;
  if (![(CPLEngineScopeStorage *)self _isValidSharingScope:v9 forScopeIdentifier:v69])
  {

    BOOL v51 = 1;
    goto LABEL_119;
  }

  uint64_t v38 = v78;
  if ((v10 & 0x7C) == 0) {
    goto LABEL_109;
  }
LABEL_106:
  v68 = NSString;
  v65 = [v9 scopeIdentifier];
  v66 = [v68 stringWithFormat:@"updated scope flags: %@, scopeIdentifier: %@", v8, v65];
  BOOL v51 = [(CPLEngineScopeStorage *)self clearAllQuotaFlagsForMainScopeWithReason:v66 error:v38];
LABEL_119:

LABEL_120:
  if ((v51 & v67) == 1)
  {
    v50 = [(CPLEngineStorage *)self engineStore];
    id v74 = [v50 engineLibrary];
    [v74 noteMainScopeHasBeenActivated];

    LOBYTE(v51) = 1;
LABEL_122:
  }
LABEL_123:

  return v51;
}

- (void)_notifyScopeObserversForScope:(id)a3 flagsUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  scopeObservers = self->_scopeObservers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__CPLEngineScopeStorage__notifyScopeObserversForScope_flagsUpdate___block_invoke;
  v11[3] = &unk_1E60A7CB8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableDictionary *)scopeObservers enumerateKeysAndObjectsUsingBlock:v11];
}

uint64_t __67__CPLEngineScopeStorage__notifyScopeObserversForScope_flagsUpdate___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, void, void))(a3 + 16))(a3, a1[4], a1[5], a1[6]);
}

- (BOOL)_isValidSharingScope:(id)a3 forScopeIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 scopeIdentifier];
  uint64_t v9 = [v7 scopeType];

  LOBYTE(v7) = [(CPLEngineScopeStorage *)self _isValidSharingScopeIdentifier:v8 scopeType:v9 forScopeIdentifier:v6];
  return (char)v7;
}

- (BOOL)_isValidSharingScopeIdentifier:(id)a3 scopeType:(int64_t)a4 forScopeIdentifier:(id)a5
{
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 4) {
    return 0;
  }
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self engineStore];
  char v10 = [v9 supportsSharingScopeWithIdentifier:v8 forScopeWithIdentifier:v7];

  return v10;
}

- (id)flagsForScope:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 flagsForScope:v4];

  return v6;
}

- (void)writeTransactionDidFail
{
  v6.receiver = self;
  v6.super_class = (Class)CPLEngineScopeStorage;
  [(CPLEngineStorage *)&v6 writeTransactionDidFail];
  self->_shouldResetGlobalsForMainScope = 0;
  self->_scheduleATransportUpdate = 0;
  self->_scheduleAScopeUpdate = 0;
  self->_schedulePushHighPriorityToTransportChangeTypes = 0;
  self->_schedulePushToTransportChangeTypes = 0;
  self->_schedulePullFromTransport = 0;
  self->_schedulePullFromClient = 0;
  self->_shouldChangeSyncManagerPriorityBoost = 0;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  self->_scopesToRemoveFromBrokenScopes = 0;

  self->_shouldUpdateAssetCountsAtEndOfTransaction = 0;
  assetCountsToUpdate = self->_assetCountsToUpdate;
  self->_assetCountsToUpdate = 0;

  scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
  self->_scopeIdentifiersBeingCreated = 0;

  [(CPLEngineScopeStorage *)self _clearScopeCache];
}

- (void)writeTransactionDidSucceed
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)CPLEngineScopeStorage;
  [(CPLEngineStorage *)&v49 writeTransactionDidSucceed];
  if (self->_shouldResetGlobalsForMainScope)
  {
    [(CPLEngineScopeStorage *)self _resetGlobalsForMainScope];
    self->_shouldResetGlobalsForMainScope = 0;
  }
  if (self->_scheduleATransportUpdate)
  {
    char v3 = [(CPLEngineStorage *)self engineStore];
    id v4 = [v3 engineLibrary];
    unint64_t v5 = [v4 scheduler];
    [v5 noteTransportNeedsUpdate];

    self->_scheduleATransportUpdate = 0;
  }
  if (self->_scheduleAScopeUpdate)
  {
    objc_super v6 = [(CPLEngineStorage *)self engineStore];
    id v7 = [v6 engineLibrary];
    id v8 = [v7 scheduler];
    [v8 noteScopeNeedsUpdate];

    self->_scheduleAScopeUpdate = 0;
  }
  if (self->_schedulePushHighPriorityToTransportChangeTypes)
  {
    uint64_t v9 = [(CPLEngineStorage *)self engineStore];
    char v10 = [v9 engineLibrary];
    uint64_t v11 = [v10 scheduler];
    [v11 noteScopeNeedsToPushHighPriorityToTransport];

    self->_schedulePushHighPriorityToTransportChangeTypes = 0;
  }
  if (self->_schedulePushToTransportChangeTypes)
  {
    id v12 = [(CPLEngineStorage *)self engineStore];
    id v13 = [v12 engineLibrary];
    BOOL v14 = [v13 scheduler];
    [v14 noteScopeNeedsToPushToTransportWithChangeTypes:self->_schedulePushToTransportChangeTypes];

    self->_schedulePushToTransportChangeTypes = 0;
  }
  if (self->_schedulePullFromTransport)
  {
    unint64_t v15 = [(CPLEngineStorage *)self engineStore];
    int v16 = [v15 engineLibrary];
    int v17 = [v16 scheduler];
    [v17 noteScopeNeedsToPullFromTransport];

    self->_schedulePullFromTransport = 0;
  }
  if (self->_schedulePullFromClient)
  {
    uint64_t v18 = [(CPLEngineStorage *)self engineStore];
    int v19 = [v18 engineLibrary];
    [v19 notifyAttachedObjectsPullQueueIsFull];

    self->_schedulePullFromClient = 0;
  }
  if (self->_shouldChangeSyncManagerPriorityBoost)
  {
    id v20 = [(CPLEngineStorage *)self engineStore];
    uint64_t v21 = [v20 engineLibrary];
    __int16 v22 = [v21 syncManager];
    [v22 setBoostPriority:self->_syncManagerPriorityBoost];

    self->_shouldChangeSyncManagerPriorityBoost = 0;
  }
  if (self->_clearSomeScopeMightHaveToBePulledByClient)
  {
    self->_someScopeMightHaveToBePulledByClient = 0;
    self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  }
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  if (scopesToRemoveFromBrokenScopes)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    int v24 = scopesToRemoveFromBrokenScopes;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v30 = [(CPLEngineStorage *)self engineStore];
          __int16 v31 = [v30 engineLibrary];
          BOOL v32 = [v31 syncManager];
          [v32 removeBrokenScope:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v45 objects:v52 count:16];
      }
      while (v26);
    }

    uint64_t v33 = self->_scopesToRemoveFromBrokenScopes;
    self->_scopesToRemoveFromBrokenScopes = 0;
  }
  if (self->_shouldUpdateAssetCountsAtEndOfTransaction)
  {
    self->_shouldUpdateAssetCountsAtEndOfTransaction = 0;
    long long v34 = [(CPLEngineStorage *)self engineStore];
    int v35 = [v34 engineLibrary];
    [v35 updateAssetCountsFromServer:self->_assetCountsToUpdate];

    assetCountsToUpdate = self->_assetCountsToUpdate;
    self->_assetCountsToUpdate = 0;
  }
  if ([(NSCountedSet *)self->_scopeIdentifiersBeingCreated count])
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v37 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = [(NSCountedSet *)self->_scopeIdentifiersBeingCreated allObjects];
        v39 = [v38 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        BOOL v51 = v39;
        _os_log_impl(&dword_1B4CAC000, v37, OS_LOG_TYPE_ERROR, "Missing calls to -endCreatingScopeWithIdentifier: for %@", buf, 0xCu);
      }
    }
    BOOL v40 = [MEMORY[0x1E4F28B00] currentHandler];
    v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
    v42 = [(NSCountedSet *)self->_scopeIdentifiersBeingCreated allObjects];
    int v43 = [v42 componentsJoinedByString:@", "];
    [v40 handleFailureInMethod:a2, self, v41, 1372, @"Missing calls to -endCreatingScopeWithIdentifier: for %@", v43 object file lineNumber description];

    abort();
  }
}

- (id)status
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)CPLEngineScopeStorage;
  char v3 = [(CPLEngineStorage *)&v52 status];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(CPLEngineStorage *)self engineStore];
  int v6 = [v5 shouldSyncScopeList];

  if (v6)
  {
    id v7 = [(CPLEngineScopeStorage *)self scopeListSyncAnchor];
    if (v7)
    {
      id v8 = [(CPLEngineStorage *)self engineStore];
      uint64_t v9 = [v8 engineLibrary];
      char v10 = [v9 transport];
      uint64_t v11 = [v10 simpleDescriptionForScopeListSyncAnchor:v7];
      [v4 appendFormat:@" - global sync anchor: %@", v11];
    }
  }
  if (self->_someScopeMightHaveToBePulledByClient) {
    [v4 appendString:@" [client needs to pull some scopes]"];
  }
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  if (status_onceToken != -1) {
    dispatch_once(&status_onceToken, &__block_literal_global_8145);
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  int v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __31__CPLEngineScopeStorage_status__block_invoke_2;
  v35[3] = &unk_1E60A7C90;
  id v30 = v13;
  id v36 = v30;
  uint64_t v37 = self;
  BOOL v40 = &v47;
  v41 = &v43;
  v42 = v51;
  id v27 = v12;
  id v38 = v27;
  id v28 = v4;
  id v39 = v28;
  BOOL v14 = (void (**)(void, void, void))MEMORY[0x1BA994060](v35);
  uint64_t v29 = [(CPLEngineScopeStorage *)self primaryScope];
  if (v29)
  {
    ((void (**)(void, void *, void))v14)[2](v14, v29, 0);
    unint64_t v15 = [(CPLEngineScopeStorage *)self sharingScopeForScope:v29];
    if (v15) {
      ((void (**)(void, void *, void))v14)[2](v14, v15, 0);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v16 = [(CPLEngineScopeStorage *)self enumeratorForScopesIncludeInactive:1];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v21 = (void *)MEMORY[0x1BA993DF0]();
        __int16 v22 = [v20 scopeIdentifier];
        char v23 = [v30 containsObject:v22];

        if ((v23 & 1) == 0) {
          ((void (**)(void, void *, uint64_t))v14)[2](v14, v20, 1);
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v53 count:16];
    }
    while (v17);
  }

  if (v44[3])
  {
    uint64_t v24 = v48[3];
    if (v24) {
      objc_msgSend(v28, "appendFormat:", @"\nand %lu more scopes - %lu inactive (use cplctl scope for more info)", v44[3], v24, v27);
    }
    else {
      objc_msgSend(v28, "appendFormat:", @"\nand %lu more scopes (use cplctl scope for more info)", v44[3]);
    }
  }
  id v25 = v28;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);

  return v25;
}

void __31__CPLEngineScopeStorage_status__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v6 = *(void **)(a1 + 32);
  id v7 = [v5 scopeIdentifier];
  [v6 addObject:v7];

  id v8 = [*(id *)(a1 + 40) flagsForScope:v5];
  int v9 = [v8 valueForFlag:16];

  if (!a3) {
    goto LABEL_10;
  }
  if (!v9)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >= 3uLL) {
      goto LABEL_5;
    }
    char v10 = [*(id *)(a1 + 40) platformObject];
    uint64_t v11 = [v10 lastScopeChangeUpdateDateForScope:v5];

    if (v11)
    {
      [*(id *)(a1 + 48) timeIntervalSinceDate:v11];
      if (v12 > 600.0)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
LABEL_11:

        goto LABEL_12;
      }
    }

LABEL_10:
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v11 = [*(id *)(a1 + 40) statusDictionaryForScope:v5];
    [*(id *)(a1 + 56) appendString:@"\n\t"];
    unint64_t v13 = [v5 scopeType];
    unsigned int v14 = (v13 < 6) & (0x32u >> v13);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __31__CPLEngineScopeStorage_status__block_invoke_3;
    v28[3] = &unk_1E60A7BF0;
    id v29 = *(id *)(a1 + 48);
    unint64_t v15 = (void *)MEMORY[0x1BA994060](v28);
    int v16 = [v5 scopeIdentifier];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __31__CPLEngineScopeStorage_status__block_invoke_4;
    v26[3] = &unk_1E60A7C18;
    id v27 = *(id *)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __31__CPLEngineScopeStorage_status__block_invoke_5;
    v23[3] = &unk_1E60A7C40;
    id v24 = *(id *)(a1 + 56);
    id v25 = v15;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31__CPLEngineScopeStorage_status__block_invoke_6;
    v18[3] = &unk_1E60A7C68;
    char v21 = v14;
    char v22 = v9;
    id v19 = *(id *)(a1 + 56);
    id v20 = v25;
    id v17 = v25;
    +[CPLEngineScope formatStatusDictionary:v11 forScopeWithIdentifier:v16 appendString:v26 appendTopLevelStatus:v23 appendLineStatus:v18];

    goto LABEL_11;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
LABEL_5:
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
LABEL_12:
}

id __31__CPLEngineScopeStorage_status__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_3:
    id v8 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = +[CPLEngineScope separatorForStatusKey:v5];
    id v8 = [v6 componentsJoinedByString:v9];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [v6 description];
      goto LABEL_3;
    }
    if (![v5 isEqualToString:@"scope info"])
    {
      id v7 = +[CPLDateFormatter stringFromDateAgo:v6 now:*(void *)(a1 + 32)];
      goto LABEL_3;
    }
    id v10 = [NSString alloc];
    uint64_t v11 = +[CPLDateFormatter stringFromDateAgo:v6 now:*(void *)(a1 + 32)];
    id v8 = (void *)[v10 initWithFormat:@"updated %@", v11];
  }
LABEL_9:

  return v8;
}

uint64_t __31__CPLEngineScopeStorage_status__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void __31__CPLEngineScopeStorage_status__block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2];
}

void __31__CPLEngineScopeStorage_status__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  unint64_t v13 = a2;
  id v5 = a3;
  if ((*(unsigned char *)(a1 + 48) || ([(id)status_avoidKeyIfNotLibrary containsObject:v13] & 1) == 0)
    && (!*(unsigned char *)(a1 + 49) || ([(id)status_avoidKeysIfInactive containsObject:v13] & 1) == 0))
  {
    if ([(__CFString *)v13 isEqualToString:@"scope info"])
    {
      if (*(unsigned char *)(a1 + 48)) {
        id v6 = @"library info";
      }
      else {
        id v6 = v13;
      }
      id v8 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = *(void (**)(uint64_t, __CFString *, id))(v7 + 16);
      id v10 = v6;
      uint64_t v11 = v9(v7, v13, v5);
      [v8 appendFormat:@"\n\t\t%@: %@", v10, v11];
    }
    else
    {
      double v12 = *(void **)(a1 + 32);
      uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      [v12 appendFormat:@"\n\t\t%@: %@", v13, v11];
    }
  }
}

uint64_t __31__CPLEngineScopeStorage_status__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"init. est. size", @"last supported feature version", @"anch", @"queries", @"transient", @"upload group", @"download group", @"initial sync", 0);
  v1 = (void *)status_avoidKeysIfInactive;
  status_avoidKeysIfInactive = v0;

  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"init. est. size", @"last supported feature version", 0);
  uint64_t v3 = status_avoidKeyIfNotLibrary;
  status_avoidKeyIfNotLibrary = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (BOOL)resetStableRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLEngineScopeStorage *)self stableScopeIndexForScopeIdentifier:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    [(CPLEngineScopeStorage *)self _clearScopeCache];
    id v10 = [(CPLEngineStorage *)self platformObject];
    int v11 = [v10 bumpStableIndexForScopeWithIdentifier:v6 error:a4];

    if (v11)
    {
      double v12 = [(CPLEngineStorage *)self engineStore];
      unint64_t v13 = [v12 cleanupTasks];
      char v8 = [v13 addCleanupTaskForScopeWithIndex:v9 scopeIdentifier:v6 scopeType:3 error:a4];

      goto LABEL_7;
    }
LABEL_6:
    char v8 = 0;
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_6;
  }
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
  char v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (BOOL)resetCloudRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLEngineScopeStorage *)self indexForCloudScopeIdentifier:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    [(CPLEngineScopeStorage *)self _clearScopeCache];
    id v10 = [(CPLEngineStorage *)self platformObject];
    int v11 = [v10 bumpCloudIndexForScopeWithIdentifier:v6 error:a4];

    if (v11)
    {
      double v12 = [(CPLEngineStorage *)self engineStore];
      unint64_t v13 = [v12 cleanupTasks];
      char v8 = [v13 addCleanupTaskForScopeWithIndex:v9 scopeIdentifier:v6 scopeType:2 error:a4];

      goto LABEL_7;
    }
LABEL_6:
    char v8 = 0;
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_6;
  }
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
  char v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (BOOL)resetLocalRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLEngineScopeStorage *)self indexForLocalScopeIdentifier:v6];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    [(CPLEngineScopeStorage *)self _clearScopeCache];
    id v10 = [(CPLEngineStorage *)self platformObject];
    int v11 = [v10 bumpLocalIndexForScopeWithIdentifier:v6 error:a4];

    if (v11)
    {
      double v12 = [(CPLEngineStorage *)self engineStore];
      unint64_t v13 = [v12 cleanupTasks];
      int v14 = [v13 addCleanupTaskForScopeWithIndex:v9 scopeIdentifier:v6 scopeType:1 error:a4];

      if (v14)
      {
        [(CPLEngineScopeStorage *)self _checkSyncManagerPriorityBoost];
        BOOL v8 = 1;
        goto LABEL_8;
      }
    }
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  if (!a4) {
    goto LABEL_7;
  }
  +[CPLErrors invalidScopeErrorWithScopeIdentifier:v6];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v8;
}

- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CPLEngineScopeStorage *)self doesScopeNeedToPushChangesToTransport:v6];
  id v23 = 0;
  BOOL v8 = [(CPLEngineScopeStorage *)self resetSyncStateForScope:v6 error:&v23];
  id v9 = v23;
  id v10 = v9;
  if (v8 && v7)
  {
    id v22 = v9;
    BOOL v11 = [(CPLEngineScopeStorage *)self setScopeHasChangesToPushToTransport:v6 changeTypes:122 error:&v22];
    id v12 = v22;

    id v10 = v12;
    if (!v11) {
      goto LABEL_10;
    }
  }
  else if (!v8)
  {
    goto LABEL_10;
  }
  id v21 = v10;
  BOOL v13 = [(CPLEngineScopeStorage *)self setupAnchorResetTransportGroupForScope:v6 error:&v21];
  id v14 = v21;

  if (v13)
  {
    id v20 = v14;
    BOOL v15 = [(CPLEngineScopeStorage *)self setScopeHasChangesToPullFromTransport:v6 error:&v20];
    id v10 = v20;

    if (v15)
    {
      BOOL v16 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    id v10 = v14;
  }
LABEL_10:
  if (!_CPLSilentLogging)
  {
    id v17 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v6 scopeIdentifier];
      *(_DWORD *)buf = 138412546;
      id v25 = v18;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Unable to reset sync anchor for %@: %@", buf, 0x16u);
    }
  }
  if (a4)
  {
    id v10 = v10;
    BOOL v16 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_17:

  return v16;
}

- (BOOL)resetCompleteSyncStateIncludingIDMappingForScope:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  scopeIdentifiersBeingCreated = self->_scopeIdentifiersBeingCreated;
  BOOL v8 = [v6 scopeIdentifier];
  LOBYTE(scopeIdentifiersBeingCreated) = [(NSCountedSet *)scopeIdentifiersBeingCreated containsObject:v8];

  if (scopeIdentifiersBeingCreated)
  {
    BOOL v9 = 1;
  }
  else
  {
    id v17 = 0;
    BOOL v10 = [(CPLEngineScopeStorage *)self _resetCompleteSyncStateForScope:v6 error:&v17];
    id v11 = v17;
    if (v10
      && ([v6 scopeIdentifier],
          id v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = [(CPLEngineScopeStorage *)self resetStableRecordsForScopeWithIdentifier:v12 error:a4], v12, v13))
    {
      BOOL v9 = 1;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v14 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          BOOL v15 = [v6 scopeIdentifier];
          *(_DWORD *)buf = 138412546;
          id v19 = v15;
          __int16 v20 = 2112;
          id v21 = v11;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Unable to reset complete sync state, including ID mapping, for %@: %@", buf, 0x16u);
        }
      }
      BOOL v9 = 0;
      if (a4) {
        *a4 = v11;
      }
    }
  }
  return v9;
}

- (BOOL)resetCompleteSyncStateForScope:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  BOOL v7 = [(CPLEngineScopeStorage *)self _resetCompleteSyncStateForScope:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v9 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = [v6 scopeIdentifier];
        *(_DWORD *)buf = 138412546;
        id v14 = v10;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Unable to reset complete sync state for %@: %@", buf, 0x16u);
      }
    }
    if (a4) {
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)_resetCompleteSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineScopeStorage *)self _resetLocalSyncStateForScope:v6 error:a4];
  id v8 = [(CPLEngineStorage *)self engineStore];
  BOOL v9 = [v6 scopeIdentifier];

  if (v7
    && [(CPLEngineScopeStorage *)self resetCloudRecordsForScopeWithIdentifier:v9 error:a4])
  {
    BOOL v10 = [v8 idMapping];
    char v11 = [v10 resetAllFinalCloudIdentifiersForScopeWithIdentifier:v9 error:a4];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)resetLocalSyncStateForScope:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v15 = 0;
  BOOL v7 = [(CPLEngineScopeStorage *)self _resetLocalSyncStateForScope:v6 error:&v15];
  id v8 = v15;
  if (v7)
  {
    BOOL v9 = [(CPLEngineStorage *)self engineStore];
    BOOL v10 = [v9 quarantinedRecords];
    char v11 = [v10 resetRejectedRecordsWithError:a4];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = [v6 scopeIdentifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Unable to reset local sync state for %@: %@", buf, 0x16u);
      }
    }
    char v11 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

- (BOOL)_resetLocalSyncStateForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 scopeIdentifier];
  id v8 = [(CPLEngineStorage *)self engineStore];
  if (![v8 forceApplyPendingChangeSessionUpdateWithError:a4]) {
    goto LABEL_8;
  }
  BOOL v9 = [v8 derivativesCache];
  [v9 discardCache];

  BOOL v10 = [v8 cloudCache];
  int v11 = [v10 discardStagedChangesForScopeWithIdentifier:v7 error:a4];

  if (!v11) {
    goto LABEL_8;
  }
  if ([(CPLEngineScopeStorage *)self resetSyncStateForScope:v6 error:a4]
    && [(CPLEngineScopeStorage *)self storeSupportedFeatureVersionInLastSync:20 forScope:v6 error:a4]&& [(CPLEngineScopeStorage *)self setupResetSyncTransportGroupForScope:v6 error:a4]&& [(CPLEngineScopeStorage *)self resetLocalRecordsForScopeWithIdentifier:v7 error:a4])
  {
    id v12 = [(CPLEngineStorage *)self engineStore];
    BOOL v13 = [v12 statusCenter];
    [v13 resetTransientStatusesWithScopeIdentifier:v7];

    BOOL v14 = 1;
  }
  else
  {
LABEL_8:
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3
{
  uint64_t v3 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 stableIndex];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)validCloudScopeIndexes
{
  uint64_t v3 = [(_CPLEngineScopeCache *)self->_scopeCache validCloudIndexes];
  if (!v3)
  {
    id v4 = [(CPLEngineStorage *)self platformObject];
    uint64_t v3 = [v4 validCloudIndexes];

    [(_CPLEngineScopeCache *)self->_scopeCache cacheValidCloudIndexes:v3];
  }
  return v3;
}

- (id)validLocalScopeIndexes
{
  uint64_t v3 = [(_CPLEngineScopeCache *)self->_scopeCache validLocalIndexes];
  if (!v3)
  {
    id v4 = [(CPLEngineStorage *)self platformObject];
    uint64_t v3 = [v4 validLocalIndexes];

    [(_CPLEngineScopeCache *)self->_scopeCache cacheValidLocalIndexes:v3];
  }
  return v3;
}

- (BOOL)setCloudScopeIndexOnChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 scopedIdentifier];
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "invalid record", buf, 2u);
      }
    }
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
    [v16 handleFailureInMethod:a2 object:self file:v17 lineNumber:960 description:@"invalid record"];

    abort();
  }
  BOOL v7 = (void *)v6;
  id v8 = [(CPLEngineScopeStorage *)self scopedIdentifierForCloudScopedIdentifier:v6];

  if (v8
    && [v5 supportsResources]
    && [v5 hasChangeType:8])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v9 = objc_msgSend(v5, "resources", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) setItemScopedIdentifier:v8];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v8 != 0;
}

- (BOOL)setLocalScopeIndexOnChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 scopedIdentifier];
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      id v15 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v15, OS_LOG_TYPE_ERROR, "invalid record", buf, 2u);
      }
    }
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
    [v16 handleFailureInMethod:a2 object:self file:v17 lineNumber:943 description:@"invalid record"];

    abort();
  }
  BOOL v7 = (void *)v6;
  id v8 = [(CPLEngineScopeStorage *)self scopedIdentifierForLocalScopedIdentifier:v6];

  if (v8
    && [v5 supportsResources]
    && [v5 hasChangeType:8])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v9 = objc_msgSend(v5, "resources", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) setItemScopedIdentifier:v8];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v8 != 0;
}

- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3
{
  uint64_t v3 = [(CPLEngineScopeStorage *)self scopeWithCloudScopeIndex:a3];
  id v4 = [v3 scopeIdentifier];

  return v4;
}

- (id)scopeIdentifierForLocalScopeIndex:(int64_t)a3
{
  uint64_t v3 = [(CPLEngineScopeStorage *)self scopeWithLocalScopeIndex:a3];
  id v4 = [v3 scopeIdentifier];

  return v4;
}

- (int64_t)indexForCloudScopeIdentifier:(id)a3
{
  uint64_t v3 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 cloudIndex];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (int64_t)indexForLocalScopeIdentifier:(id)a3
{
  uint64_t v3 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 localIndex];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)scopedIdentifierForCloudScopedIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 scopeIndex];
  BOOL v7 = [v5 scopeIdentifier];
  int64_t v8 = [(CPLEngineScopeStorage *)self indexForCloudScopeIdentifier:v7];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
      goto LABEL_12;
    }
    [v5 setScopeIndex:v8];
  }
  else
  {

    if (v6 != v8)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v5;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Incorrect index for cloud scoped identifier %@", buf, 0xCu);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
      [v11 handleFailureInMethod:a2, self, v12, 903, @"Incorrect index for cloud scoped identifier %@", v5 object file lineNumber description];

      abort();
    }
  }
  id v9 = v5;
LABEL_12:

  return v9;
}

- (id)scopedIdentifierForLocalScopedIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 scopeIndex];
  BOOL v7 = [v5 scopeIdentifier];
  int64_t v8 = [(CPLEngineScopeStorage *)self indexForLocalScopeIdentifier:v7];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
      goto LABEL_12;
    }
    [v5 setScopeIndex:v8];
  }
  else
  {

    if (v6 != v8)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v5;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Incorrect index for local scoped identifier %@", buf, 0xCu);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
      [v11 handleFailureInMethod:a2, self, v12, 884, @"Incorrect index for local scoped identifier %@", v5 object file lineNumber description];

      abort();
    }
  }
  id v9 = v5;
LABEL_12:

  return v9;
}

- (BOOL)_setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [v8 scopeType];
  if (v9 == a3)
  {
    LOBYTE(a5) = 1;
  }
  else
  {
    uint64_t v10 = v9;
    if (v9)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v11 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = +[CPLScopeChange descriptionForScopeType:v10];
          BOOL v13 = +[CPLScopeChange descriptionForScopeType:a3];
          BOOL v14 = [v8 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          id v25 = v12;
          __int16 v26 = 2112;
          id v27 = v13;
          __int16 v28 = 2112;
          id v29 = v14;
          _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Trying to change scope type from %@ to %@ for %@", buf, 0x20u);
        }
      }
      if (a5)
      {
        id v15 = +[CPLScopeChange descriptionForScopeType:v10];
        uint64_t v16 = +[CPLScopeChange descriptionForScopeType:a3];
        uint64_t v17 = [v8 scopeIdentifier];
        *a5 = +[CPLErrors cplErrorWithCode:50, @"Trying to change scope type from %@ to %@ for %@", v15, v16, v17 description];

        LOBYTE(a5) = 0;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        long long v18 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [v8 scopeIdentifier];
          long long v20 = +[CPLScopeChange descriptionForScopeType:a3];
          *(_DWORD *)buf = 138412546;
          id v25 = v19;
          __int16 v26 = 2112;
          id v27 = v20;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Upgrading scope type of %@ to %@", buf, 0x16u);
        }
      }
      long long v21 = [(CPLEngineStorage *)self platformObject];
      int v22 = [v21 setScopeType:a3 forScope:v8 error:a5];

      LOBYTE(a5) = v22
                && [(CPLEngineScopeStorage *)self _handledDisabledFeaturesForScopeIfNecessary:v8 type:a3 error:a5]&& [(CPLEngineScopeStorage *)self setScopeNeedsToBePulledByClient:v8 error:a5];
      [(CPLEngineScopeStorage *)self _clearScopeCache];
    }
  }

  return (char)a5;
}

- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:v6];
  if (!v7)
  {
    int v11 = 1;
    goto LABEL_14;
  }
  id v8 = [(CPLEngineStorage *)self mainScopeIdentifier];
  if (([v6 isEqualToString:v8] & 1) != 0 || objc_msgSend(v7, "scopeType") == 4)
  {

    goto LABEL_5;
  }
  uint64_t v12 = [v7 scopeType];

  if (v12 == 5)
  {
LABEL_5:
    uint64_t v9 = [NSString stringWithFormat:@"scope deleted, scopeIdentifier: %@", v6];
    BOOL v10 = [(CPLEngineScopeStorage *)self clearAllQuotaFlagsForMainScopeWithReason:v9 error:a4];

    if (!v10)
    {
      int v11 = 0;
      goto LABEL_14;
    }
  }
  if ([(CPLEngineScopeStorage *)self addCleanupTasksForScope:v7 error:a4]
    && ([(CPLEngineStorage *)self platformObject],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 deleteScopeWithIdentifier:v6 error:a4],
        v13,
        v14))
  {
    [(CPLEngineScopeStorage *)self _removeBrokenScope:v7];
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  [(CPLEngineScopeStorage *)self _clearScopeCache];
LABEL_14:
  id v15 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v16 = [v6 isEqualToString:v15];

  if (v16) {
    self->_shouldResetGlobalsForMainScope = 1;
  }
  [(CPLEngineScopeStorage *)self _checkSyncManagerPriorityBoost];
  char v17 = v11 ^ 1;
  if (!v7) {
    char v17 = 1;
  }
  if (v17)
  {
    if (!v11) {
      goto LABEL_20;
    }
LABEL_22:
    long long v19 = [(CPLEngineStorage *)self engineStore];
    long long v20 = [v19 quarantinedRecords];
    char v18 = [v20 resetRejectedRecordsWithError:a4];

    goto LABEL_23;
  }
  if ([(CPLEngineScopeStorage *)self _dropSharingScopeIdentifier:v6 error:a4]) {
    goto LABEL_22;
  }
LABEL_20:
  char v18 = 0;
LABEL_23:

  return v18;
}

- (BOOL)addCleanupTasksForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 scopeType])
  {
    BOOL v7 = [v6 scopeIdentifier];
    id v8 = [(CPLEngineStorage *)self engineStore];
    uint64_t v9 = [v8 cleanupTasks];

    if (objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "localIndex"), v7, 1, a4)&& objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "cloudIndex"), v7, 2, a4))
    {
      char v10 = objc_msgSend(v9, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", objc_msgSend(v6, "stableIndex"), v7, 3, a4);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)_setSharingScopeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CPLEngineStorage *)self mainScopeIdentifier];
  BOOL v8 = [(CPLEngineScopeStorage *)self _isValidSharingScope:v6 forScopeIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [(CPLEngineStorage *)self engineStore];
    char v10 = [v6 scopeIdentifier];
    int v11 = [v9 sharingScopeIdentifier];
    uint64_t v12 = v11;
    if (v11 && ([v11 isEqualToString:v10] & 1) == 0)
    {
      if (_CPLSilentLogging)
      {
        BOOL v15 = 1;
        goto LABEL_20;
      }
      BOOL v13 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v23 = v12;
        __int16 v24 = 2114;
        id v25 = v10;
        _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ is already registered as sharing scope. Ignoring %{public}@", buf, 0x16u);
      }
    }
    else
    {
      BOOL v13 = [(CPLEngineScopeStorage *)self primaryScope];
      if (!v13 || [(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v13])
      {
        if (a4)
        {
          int v14 = [v6 scopeIdentifier];
          *a4 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Can't use %@ as sharing scope when iCPL is off", v14];
        }
        BOOL v15 = 0;
        goto LABEL_19;
      }
      if (!_CPLSilentLogging)
      {
        int v16 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v6;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_DEFAULT, "Activating %@ as sharing scope. Informing store", buf, 0xCu);
        }
      }
      char v17 = [(CPLEngineStorage *)self engineStore];
      [v17 storeSharingScopeIdentifier:v10];

      char v18 = [(CPLEngineStorage *)self engineStore];
      long long v19 = [v18 engineLibrary];
      long long v20 = [v19 supervisor];
      [v20 scopeStorage:self didStoreSharingScopeIdentifier:v10];
    }
    BOOL v15 = 1;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  BOOL v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)_dropSharingScopeIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CPLEngineStorage *)self engineStore];
  unint64_t v8 = (unint64_t)v6;
  id v36 = v7;
  uint64_t v9 = [v7 sharingScopeIdentifier];
  unint64_t v10 = (unint64_t)v9;
  if (v8 && v9)
  {
    char v11 = [(id)v8 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_4:
      id v12 = 0;
      BOOL v13 = 1;
      goto LABEL_39;
    }
  }
  else
  {

    if (v8 | v10) {
      goto LABEL_4;
    }
  }
  if (!_CPLSilentLogging)
  {
    int v14 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v44 = v8;
      _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEFAULT, "Dropping %{public}@ as sharing scope", buf, 0xCu);
    }
  }
  BOOL v15 = [(CPLEngineStorage *)self engineStore];
  [v15 dropSharingScopeIdentifier:v8];

  int v16 = [(CPLEngineStorage *)self engineStore];
  char v17 = [v16 engineLibrary];
  char v18 = [v17 supervisor];
  unint64_t v35 = v8;
  [v18 scopeStorage:self didDropSharingScopeIdentifier:v8];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v19 = [(CPLEngineScopeStorage *)self enumeratorForScopesIncludeInactive:1];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    long long v34 = a4;
    uint64_t v37 = 0;
    uint64_t v22 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        __int16 v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v25 = (void *)MEMORY[0x1BA993DF0]();
        uint64_t v26 = [(CPLEngineStorage *)self platformObject];
        id v27 = [v26 flagsForScope:v24];

        if ([v27 valueForFlag:16]
          && ([v27 valueForFlag:36] & 1) == 0
          && ([v24 scopeType] & 0xFFFFFFFFFFFFFFFELL) == 4
          && ([v24 scopeIdentifier],
              __int16 v28 = objc_claimAutoreleasedReturnValue(),
              BOOL v29 = -[CPLEngineScopeStorage shouldAutoactivateScopeWithIdentifier:scopeType:](self, "shouldAutoactivateScopeWithIdentifier:scopeType:", v28, [v24 scopeType]), v28, v29))
        {
          id v30 = v24;

          if (v30)
          {

            long long v31 = [(CPLEngineScopeStorage *)self primaryScope];
            if (v31)
            {
              unint64_t v8 = v35;
              BOOL v7 = v36;
              if ([(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v31])
              {
                id v12 = 0;
                BOOL v13 = 1;
              }
              else
              {
                if (!_CPLSilentLogging)
                {
                  long long v32 = __CPLStorageOSLogDomain_8027();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    unint64_t v44 = (unint64_t)v30;
                    __int16 v45 = 2114;
                    unint64_t v46 = v35;
                    _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_DEFAULT, "Activating %@ as a new Shared library since %{public}@ has been dropped", buf, 0x16u);
                  }
                }
                [v27 setValue:0 forFlag:16];
                id v38 = 0;
                BOOL v13 = [(CPLEngineScopeStorage *)self updateFlags:v27 forScope:v30 error:&v38];
                id v12 = v38;
              }
            }
            else
            {
              id v12 = 0;
              BOOL v13 = 1;
              unint64_t v8 = v35;
              BOOL v7 = v36;
            }

            if (v34 && !v13)
            {
              id v12 = v12;
              BOOL v13 = 0;
              *long long v34 = v12;
            }
            goto LABEL_39;
          }
          uint64_t v37 = v27;
        }
        else
        {
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }

  id v12 = 0;
  BOOL v13 = 1;
  unint64_t v8 = v35;
  BOOL v7 = v36;
LABEL_39:

  return v13;
}

- (id)createScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 flags:(int64_t)a5 transportScope:(id)a6 error:(id *)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  uint64_t v15 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:v13];
  int v16 = (void *)v15;
  if (a4 != 2)
  {
    if (!v15) {
      goto LABEL_15;
    }
    if (!a4)
    {
LABEL_9:
      long long v19 = [(CPLEngineStorage *)self platformObject];
      uint64_t v20 = [v19 flagsForScope:v16];

      [v20 setValue:1 forFlag:a5];
      if ((a5 & 0x10) == 0) {
        [v20 setValue:0 forFlag:16];
      }
      BOOL v21 = [(CPLEngineScopeStorage *)self updateFlags:v20 forScope:v16 error:a7];

      if (v14 && v21)
      {
        if ([(CPLEngineScopeStorage *)self setTransportScope:v14 forScope:v16 error:a7])
        {
          goto LABEL_23;
        }
      }
      else if (v21)
      {
        goto LABEL_23;
      }
LABEL_22:

      int v16 = 0;
      goto LABEL_23;
    }
LABEL_8:
    if (![(CPLEngineScopeStorage *)self _setScopeType:a4 forScope:v16 error:a7]) {
      goto LABEL_22;
    }
    goto LABEL_9;
  }
  char v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v18 = [v17 BOOLForKey:@"CPLOwnedMomentSharesAreHighPriority"];

  if (v18) {
    a5 |= 0x20000uLL;
  }
  if (v16) {
    goto LABEL_8;
  }
LABEL_15:
  uint64_t v22 = [(CPLEngineStorage *)self platformObject];
  int v16 = [v22 addScopeWithIdentifier:v13 scopeType:a4 error:a7];

  if (!v16) {
    goto LABEL_23;
  }
  if (![(CPLEngineScopeStorage *)self _handledDisabledFeaturesForScopeIfNecessary:v16 type:a4 error:a7])goto LABEL_22; {
  [(CPLEngineScopeStorage *)self _clearScopeCache];
  }
  BOOL v23 = [(CPLEngineScopeStorage *)self setTransportScope:v14 forScope:v16 error:a7];
  if (a5 && v23)
  {
    __int16 v24 = [[CPLEngineScopeFlagsUpdate alloc] initWithFlags:0];
    [(CPLEngineScopeFlagsUpdate *)v24 setValue:1 forFlag:a5];
    id v25 = [(CPLEngineStorage *)self platformObject];
    int v26 = [v25 updateFlags:v24 forScope:v16 error:a7];

    [(CPLEngineScopeStorage *)self _notifyScopeObserversForScope:v16 flagsUpdate:v24];
    if (!v26) {
      goto LABEL_38;
    }
  }
  else
  {
    if (!v23)
    {
LABEL_38:
      char v34 = 0;
      goto LABEL_47;
    }
    if ([(NSMutableDictionary *)self->_scopeObservers count])
    {
      __int16 v28 = [[CPLEngineScopeFlagsUpdate alloc] initWithFlags:0];
      [(CPLEngineScopeStorage *)self _notifyScopeObserversForScope:v16 flagsUpdate:v28];
    }
  }
  if (overridesFeatureFlag != 1 || isFeatureEnabled)
  {
    int64_t v30 = a5 & 0x10;
  }
  else
  {
    uint64_t v29 = [v16 scopeType];
    int64_t v30 = a5 & 0x10;
    if ((a5 & 0x10) == 0 && (v29 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      if (!_CPLSilentLogging)
      {
        long long v31 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v44 = v16;
          _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_ERROR, "Trying to create an active shared library scope but the feature is disabled %@", buf, 0xCu);
        }
      }
      long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
      [v32 handleFailureInMethod:a2, self, v33, 685, @"Trying to create an active shared library scope but the feature is disabled %@", v16 object file lineNumber description];

      abort();
    }
  }
  if (v30)
  {
    char v34 = 1;
  }
  else
  {
    if ([(CPLEngineScopeStorage *)self _setSharingScopeIdentifier:v16 error:a7])
    {
      unint64_t v35 = [(CPLEngineStorage *)self platformObject];
      id v36 = [MEMORY[0x1E4F1C9C8] date];
      char v34 = [v35 storeActivationDate:v36 forScope:v16 error:a7];
    }
    else
    {
      char v34 = 0;
    }
    uint64_t v37 = [(CPLEngineStorage *)self mainScopeIdentifier];
    int v38 = [v13 isEqualToString:v37];

    if (v38)
    {
      long long v39 = [(CPLEngineStorage *)self engineStore];
      long long v40 = [v39 engineLibrary];
      [v40 noteMainScopeHasBeenActivated];
    }
  }
LABEL_47:
  long long v41 = [(CPLEngineStorage *)self mainScopeIdentifier];
  int v42 = [v13 isEqualToString:v41];

  if (v42) {
    self->_shouldResetGlobalsForMainScope = 1;
  }
  self->_scheduleAScopeUpdate = 1;
  if ((v34 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:

  return v16;
}

- (BOOL)_handledDisabledFeaturesForScopeIfNecessary:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  BOOL v7 = [(CPLEngineStorage *)self engineStore];
  unint64_t v8 = [v7 disabledFeatures];

  if ([v8 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = +[CPLFeature featureWithName:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v14)
          {
            uint64_t v15 = [(CPLEngineStorage *)self engineStore];
            int v16 = [v14 handleScopeWhenFeatureIsDisabled:v20 scopeType:a4 store:v15 error:a5];

            if (!v16)
            {

              BOOL v17 = 0;
              goto LABEL_15;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = 1;
    }
LABEL_15:
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)_resetGlobalsForMainScope
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    uint64_t v3 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CPLEngineStorage *)self mainScopeIdentifier];
      int v7 = 138412290;
      unint64_t v8 = v4;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "Resetting global status for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id v5 = [(CPLEngineStorage *)self engineStore];
  id v6 = [v5 engineLibrary];

  [v6 setICloudLibraryHasBeenWiped:0];
  [v6 setIsExceedingQuota:0];
  [v6 setIsExceedingSharedLibraryQuota:0];
  [v6 setExitDeleteTime:0];
  [v6 updateInitialSyncDate:0];
  [v6 updateAccountFlagsData:0];
  [v6 setBusyState:0];
}

- (id)allScopeIdentifiersIncludeInactive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = -[CPLEngineScopeStorage enumeratorForScopesIncludeInactive:](self, "enumeratorForScopesIncludeInactive:", v3, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [(CPLEngineScopeStorage *)self _cacheScope:v11];
        uint64_t v12 = [v11 scopeIdentifier];
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)doesScopeNeedToUploadComputeState:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeNeedToUploadComputeState:v4];

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 setScope:v8 hasCompletedUploadComputeStateTask:a4 error:a5];

  return (char)a5;
}

- (int64_t)uploadComputeStateTaskForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 uploadComputeStateTaskForScope:v4];

  return v6;
}

- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 setScopeNeedsToUploadComputeState:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasScopesNeedingToUploadComputeState
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasScopesNeedingToUploadComputeState];

  return v3;
}

- (id)enumeratorForScopesNeedingToUploadComputeState
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingToUploadComputeState];

  return v3;
}

- (BOOL)doesScopeNeedToUpdateTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeNeedToUpdateTransport:v4];

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 setScope:v8 hasCompletedTransportUpdate:a4 error:a5];

  return (char)a5;
}

- (int64_t)transportUpdateTaskForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 transportUpdateTaskForScope:v4];

  return v6;
}

- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4
{
  self->_scheduleATransportUpdate = 1;
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 setScopeNeedsToUpdateTransport:v6 error:a4];

  return (char)a4;
}

- (BOOL)hasScopesNeedingToUpdateTransport
{
  return 0;
}

- (BOOL)updateScopeWithChange:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 scopeIdentifier];
  id v8 = [(CPLEngineScopeStorage *)self _scopeWithIdentifier:v7];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke;
  v36[3] = &unk_1E60AA830;
  int v38 = v39;
  v36[4] = self;
  id v9 = v7;
  id v37 = v9;
  uint64_t v10 = (void (**)(void))MEMORY[0x1BA994060](v36);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke_2;
  v33[3] = &unk_1E60AA830;
  unint64_t v35 = v39;
  v33[4] = self;
  id v11 = v9;
  id v34 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x1BA994060](v33);
  if ([v6 isDelete])
  {
    if (!v8 || (uint64_t v13 = [v8 scopeType]) == 0) {
      uint64_t v13 = [v6 scopeType];
    }
    if (!v13)
    {
      if (!_CPLSilentLogging)
      {
        long long v22 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int buf = 138412290;
          uint64_t v42 = (uint64_t)v11;
          _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_ERROR, "Client tried to delete an unknown scope %@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (a4) {
        goto LABEL_45;
      }
      goto LABEL_58;
    }
    if (v13 == 1)
    {
      if (!_CPLSilentLogging)
      {
        long long v14 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int buf = 138412290;
          uint64_t v42 = (uint64_t)v11;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Client tried to delete library %@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (a4)
      {
LABEL_45:
        +[CPLErrors invalidScopeErrorWithScopeIdentifier:v11];
        BOOL v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_67;
      }
LABEL_58:
      BOOL v21 = 0;
      goto LABEL_67;
    }
  }
  BOOL v15 = v8 != 0;
  if (!v8)
  {
    v10[2](v10);
    id v8 = [(CPLEngineScopeStorage *)self _createScopeFromScopeChange:v6 error:a4];
    if (!v8) {
      goto LABEL_58;
    }
    if (!_CPLSilentLogging)
    {
      long long v17 = __CPLStorageOSLogDomain_8027();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int buf = 138412290;
        uint64_t v42 = (uint64_t)v8;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Client re-created scope %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (![(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v8])
  {
LABEL_26:
    BOOL v15 = 0;
    goto LABEL_27;
  }
  if (![(CPLEngineScopeStorage *)self deleteScopeWithIdentifier:v11 error:a4]) {
    goto LABEL_58;
  }
  v10[2](v10);
  uint64_t v16 = [(CPLEngineScopeStorage *)self _createScopeFromScopeChange:v6 error:a4];

  if (!v16)
  {
    id v8 = 0;
    goto LABEL_58;
  }
  if (!_CPLSilentLogging)
  {
    long long v17 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138412290;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEFAULT, "Client activated scope %@", (uint8_t *)&buf, 0xCu);
    }
    id v8 = (void *)v16;
LABEL_25:

    goto LABEL_27;
  }
  BOOL v15 = 1;
  id v8 = (void *)v16;
LABEL_27:
  if (![v6 isDelete])
  {
    if (v15)
    {
      if (!_CPLSilentLogging)
      {
        id v20 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int buf = 138412290;
          uint64_t v42 = (uint64_t)v8;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEFAULT, "Client just created %@ - we will try to update it in the cloud", (uint8_t *)&buf, 0xCu);
        }
      }
      BOOL v19 = [(CPLEngineScopeStorage *)self setScopeNeedsToUpdateTransport:v8 error:a4];
      goto LABEL_39;
    }
    long long v23 = [(CPLEngineStorage *)self platformObject];
    long long v24 = [v23 flagsForScope:v8];

    if ([v24 valueForFlag:16])
    {
      BOOL v21 = 1;
LABEL_66:

      goto LABEL_67;
    }
    id v25 = [(CPLEngineStorage *)self platformObject];
    long long v31 = [v25 scopeChangeForScope:v8];

    char v32 = 0;
    [v31 updateScopeFromScopeChange:v6 direction:1 didHaveChanges:&v32];
    if (v32)
    {
      char v32 = 0;
      uint64_t v26 = [(CPLEngineStorage *)self platformObject];
      int v27 = [v26 storeScopeChange:v31 forScope:v8 scopeChangeHasBeenUpdated:&v32 error:a4];

      if (!v27) {
        goto LABEL_59;
      }
      if (v32)
      {
        if (!_CPLSilentLogging)
        {
          __int16 v28 = __CPLStorageOSLogDomain_8027();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            int buf = 138412290;
            uint64_t v42 = (uint64_t)v8;
            _os_log_impl(&dword_1B4CAC000, v28, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change for %@ - we may have to update the cloud", (uint8_t *)&buf, 0xCu);
          }
        }
        if (-[CPLEngineScopeStorage setScopeNeedsToUpdateTransport:error:](self, "setScopeNeedsToUpdateTransport:error:", v8, a4, v31))
        {
          BOOL v21 = [(CPLEngineScopeStorage *)self setScopeNeedsUpdateFromTransport:v8 error:a4];
LABEL_65:

          goto LABEL_66;
        }
LABEL_59:
        BOOL v21 = 0;
        goto LABEL_65;
      }
      if (!_CPLSilentLogging)
      {
        uint64_t v29 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int buf = 138412290;
          uint64_t v42 = (uint64_t)v8;
          _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_DEFAULT, "Client pushed a scope change for %@ which did not result in an actual change", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    BOOL v21 = 1;
    goto LABEL_65;
  }
  if (!_CPLSilentLogging)
  {
    int v18 = __CPLStorageOSLogDomain_8027();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138412290;
      uint64_t v42 = (uint64_t)v8;
      _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, "Client pushed a scope delete for %@ - we will try to delete it in the cloud", (uint8_t *)&buf, 0xCu);
    }
  }
  BOOL v19 = [(CPLEngineScopeStorage *)self setValue:1 forFlag:48 forScope:v8 error:a4];
LABEL_39:
  BOOL v21 = v19;
LABEL_67:
  v12[2](v12);

  _Block_object_dispose(v39, 8);
  return v21;
}

uint64_t __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(result + 32) beginCreatingScopeWithIdentifier:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __53__CPLEngineScopeStorage_updateScopeWithChange_error___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 32) endCreatingScopeWithIdentifier:*(void *)(result + 40)];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (id)_createScopeFromScopeChange:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 scopeIdentifier];
  id v8 = -[CPLEngineScopeStorage createScopeWithIdentifier:scopeType:flags:transportScope:error:](self, "createScopeWithIdentifier:scopeType:flags:transportScope:error:", v7, [v6 scopeType], objc_msgSend(v6, "defaultFlags"), 0, a4);

  if (v8)
  {
    char v12 = 0;
    id v9 = [(CPLEngineStorage *)self platformObject];
    char v10 = [v9 storeScopeChange:v6 forScope:v8 scopeChangeHasBeenUpdated:&v12 error:a4];

    if ((v10 & 1) == 0)
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (id)enumeratorForScopesNeedingToUpdateTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingToUpdateTransport];

  return v3;
}

- (BOOL)doesScopeSupportToBePulledByClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeSupportToBePulledByClient:v4];

  return v6;
}

- (BOOL)doesScopeNeedToBePulledByClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeNeedToBePulledByClient:v4];

  return v6;
}

- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4
{
  self->_someScopeMightHaveToBePulledByClient = 1;
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  self->_schedulePullFromClient = 1;
  id v6 = a3;
  uint64_t v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 setScopeNeedsToBePulledByClient:v6 error:a4];

  return (char)a4;
}

- (BOOL)clientAcknowledgedScopeChanges:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        int v13 = [v12 isScopeChange];
        int v14 = v13;
        if (a4 && (v13 & 1) == 0)
        {
          *a4 = +[CPLErrors cplErrorWithCode:50, @"incorrect change of class %@ in a batch of scope changes", objc_opt_class() description];
        }
        uint64_t v15 = [v12 scope];
        if (v15) {
          int v16 = 0;
        }
        else {
          int v16 = v14;
        }
        if (v16 == 1)
        {
          if (a4)
          {
            long long v17 = [v12 scopeIdentifier];
            *a4 = +[CPLErrors cplErrorWithCode:50, @"missing inner scope in scope change for %@", v17 description];
LABEL_30:
          }
LABEL_31:
          BOOL v26 = 0;
          goto LABEL_32;
        }
        long long v17 = (void *)v15;
        if (!v14) {
          goto LABEL_30;
        }
        int v18 = [(CPLEngineStorage *)self platformObject];
        int v19 = objc_msgSend(v18, "setScope:hasCompletedClientNeedsToPullTask:error:", v17, objc_msgSend(v12, "pullTaskItem"), a4);

        if (!v19) {
          goto LABEL_30;
        }
        if ([v12 isDelete])
        {
          id v20 = [(CPLEngineStorage *)self engineStore];
          __int16 v21 = [v20 libraryOptions];

          if ((v21 & 0x400) != 0
            || [(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v17])
          {
            long long v22 = [v12 scopeIdentifier];
            BOOL v23 = [(CPLEngineScopeStorage *)self deleteScopeWithIdentifier:v22 error:a4];

            if (!v23) {
              goto LABEL_31;
            }
          }
          else
          {
            BOOL v24 = [(CPLEngineScopeStorage *)self setValue:1 forFlag:16 forScope:v17 error:a4];

            if (!v24) {
              goto LABEL_31;
            }
          }
        }
        else
        {
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v25 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v9 = v25;
      BOOL v26 = 1;
    }
    while (v25);
  }
  else
  {
    BOOL v26 = 1;
  }
LABEL_32:

  return v26;
}

- (id)scopeChangesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  self->_clearSomeScopeMightHaveToBePulledByClient = 0;
  if (self->_someScopeMightHaveToBePulledByClient)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(CPLEngineStorage *)self platformObject];
    id v7 = [v6 enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:a3];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v7);
          }
          int v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = [(CPLEngineScopeStorage *)self _scopeChangeToBePulledByClientForScope:v13];
          if (!v14)
          {
            if (!_CPLSilentLogging)
            {
              long long v17 = __CPLStorageOSLogDomain_8027();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                int v18 = [v13 scopeIdentifier];
                *(_DWORD *)int buf = 138412290;
                int v27 = v18;
                _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "failed to create a scope change for %@", buf, 0xCu);
              }
            }
            int v19 = [MEMORY[0x1E4F28B00] currentHandler];
            id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineScopeStorage.m"];
            __int16 v21 = [v13 scopeIdentifier];
            [v19 handleFailureInMethod:a2, self, v20, 343, @"failed to create a scope change for %@", v21 object file lineNumber description];

            abort();
          }
          uint64_t v15 = (void *)v14;
          if (!v10) {
            uint64_t v10 = objc_alloc_init(CPLChangeBatch);
          }
          [(CPLChangeBatch *)v10 addRecord:v15];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }
    else
    {

      uint64_t v10 = 0;
      self->_clearSomeScopeMightHaveToBePulledByClient = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)_scopeChangeToBePulledByClientForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 flagsForScope:v4];

  id v7 = +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", [v4 scopeType]);
  if ([v6 valueForFlag:4] && (objc_msgSend(v6, "valueForFlag:", 64) & 1) == 0)
  {
    uint64_t v8 = [v4 scopeIdentifier];
    uint64_t v9 = -[objc_class newDeleteScopeChangeWithScopeIdentifier:type:](v7, "newDeleteScopeChangeWithScopeIdentifier:type:", v8, [v4 scopeType]);
  }
  else
  {
    uint64_t v8 = [(CPLEngineStorage *)self platformObject];
    uint64_t v9 = [v8 scopeChangeForScope:v4];
  }
  uint64_t v10 = (void *)v9;

  if (v10)
  {
    uint64_t v11 = [(CPLEngineStorage *)self platformObject];
    uint64_t v12 = [v11 clientNeedsToPullTaskForScope:v4];

    [v10 setPullTaskItem:v12];
    [v10 setScope:v4];
  }

  return v10;
}

- (BOOL)doScopesNeedMetadataSync:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  if ([v5 doScopesNeedMetadataSync:v4])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [(CPLEngineStorage *)self engineStore];
    uint64_t v8 = [v7 transientPullRepository];
    char v6 = [v8 hasUnmingledOrStashedRecordsWithScopeFilter:v4];
  }
  return v6;
}

- (id)enumeratorForScopesWithMingling
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesWithMingling];

  return v3;
}

- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v9 setPullFromTransportExpirationInterval:v8 scope:a5 error:a3];

  return (char)a5;
}

- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeNeedToPullChangesFromTransport:v4];

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  LODWORD(a4) = [v9 setScope:v8 hasCompletedPullFromTransportTask:a4 error:a5];

  if (a4)
  {
    if ([(CPLEngineScopeStorage *)self shouldTrackAdditionalInitialSyncDatesForScope:v8]&& ([(CPLEngineScopeStorage *)self initialMetadataDownloadDateForScope:v8], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
    {
      if (!_CPLSilentLogging)
      {
        int v13 = __CPLStorageOSLogDomain_8027();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v8;
          _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEFAULT, "Setting initial metadata download date for %@", (uint8_t *)&v16, 0xCu);
        }
      }
      uint64_t v14 = [(CPLEngineStorage *)self platformObject];
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      char v11 = [v14 storeInitialMetadataDownloadDate:v15 forScope:v8 error:a5];
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (int64_t)pullFromTransportTaskForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 pullFromTransportTaskForScope:v4];

  return v6;
}

- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3
{
  self->_schedulePullFromTransport = 1;
  id v4 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a3) = [v4 setAllScopesHasChangesToPullFromTransportWithError:a3];

  return (char)a3;
}

- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CPLEngineScopeStorage *)self valueForFlag:16 forScope:v6])
  {
    char v7 = [(CPLEngineScopeStorage *)self setScopeNeedsUpdateFromTransport:v6 error:a4];
  }
  else
  {
    self->_schedulePullFromTransport = 1;
    id v8 = [(CPLEngineScopeStorage *)self scopeChangeForScope:v6];
    if ([v8 shouldAlwaysUpdateScopeInfoWhenPossible]
      && ![(CPLEngineScopeStorage *)self setScopeNeedsUpdateFromTransport:v6 error:a4])
    {
      char v7 = 0;
    }
    else
    {
      uint64_t v9 = [(CPLEngineStorage *)self platformObject];
      char v7 = [v9 setScopeHasChangesToPullFromTransport:v6 error:a4];
    }
  }

  return v7;
}

- (BOOL)hasScopesNeedingToPullChangesFromTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasScopesNeedingToPullChangesFromTransport];

  return v3;
}

- (id)enumeratorForScopesNeedingToPullChangesFromTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingToPullChangesFromTransport];

  return v3;
}

- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 doesScopeNeedToPushChangesToTransport:v4];

  return v6;
}

- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(CPLEngineStorage *)self platformObject];
  int v10 = [v9 setScope:v8 hasCompletedPushToTransportTask:a4 error:a5];

  if (v10) {
    [(CPLEngineScopeStorage *)self _checkSyncManagerPriorityBoost];
  }
  return v10;
}

- (int64_t)pushToTransportTaskForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLEngineStorage *)self platformObject];
  int64_t v6 = [v5 pushToTransportTaskForScope:v4];

  return v6;
}

- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 changeTypes:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFEFFLL) != 0) {
    unint64_t v9 = a4 & 0xFFFFFFFFFFFFFEFFLL;
  }
  else {
    unint64_t v9 = 122;
  }
  int v10 = [(CPLEngineStorage *)self platformObject];
  char v11 = [v10 flagsForScope:v8];

  if ([v11 valueForFlag:0x20000])
  {
    self->_schedulePushHighPriorityToTransportChangeTypes |= v9;
    [(CPLEngineScopeStorage *)self _forceSyncManagerPriorityBoost];
  }
  else
  {
    self->_schedulePushToTransportChangeTypes |= v9;
  }
  uint64_t v12 = [(CPLEngineStorage *)self platformObject];
  char v13 = [v12 setScopeHasChangesToPushToTransport:v8 error:a5];

  return v13;
}

- (BOOL)hasScopesNeedingToPushChangesToTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasScopesNeedingToPushChangesToTransport];

  return v3;
}

- (id)enumeratorForScopesNeedingToPushChangesToTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingToPushChangesToTransport];

  return v3;
}

- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 hasScopesNeedingToPushHighPriorityChangesToTransport];

  return v3;
}

- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingToPushHighPriorityChangesToTransport];

  return v3;
}

- (id)enumeratorForScopesNeedingUpdateFromTransport
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForScopesNeedingUpdateFromTransport];

  return v3;
}

- (id)enumeratorForDeletedStagedScopes
{
  uint64_t v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 enumeratorForDeletedStagedScopes];

  return v3;
}

- (id)enumeratorForScopesIncludeInactive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CPLEngineStorage *)self platformObject];
  id v5 = [v4 enumeratorForScopesIncludeInactive:v3];

  return v5;
}

- (void)_checkSyncManagerPriorityBoost
{
  self->_shouldChangeSyncManagerPriorityBoost = 1;
  id v3 = [(CPLEngineStorage *)self platformObject];
  self->_syncManagerPriorityBoost = [v3 hasScopesNeedingToPushHighPriorityChangesToTransport];
}

- (void)_forceSyncManagerPriorityBoost
{
  self->_shouldChangeSyncManagerPriorityBoost = 1;
  self->_syncManagerPriorityBoost = 1;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  id v5 = -[_CPLEngineScopeCache scopeWithStableIndex:](self->_scopeCache, "scopeWithStableIndex:");
  if (!v5)
  {
    int64_t v6 = [(CPLEngineStorage *)self platformObject];
    id v5 = [v6 scopeWithStableIndex:a3];

    [(CPLEngineScopeStorage *)self _cacheScope:v5];
  }
  return v5;
}

- (id)scopeWithCloudScopeIndex:(int64_t)a3
{
  id v5 = -[_CPLEngineScopeCache scopeWithCloudIndex:](self->_scopeCache, "scopeWithCloudIndex:");
  if (!v5)
  {
    int64_t v6 = [(CPLEngineStorage *)self platformObject];
    id v5 = [v6 scopeWithCloudIndex:a3];

    [(CPLEngineScopeStorage *)self _cacheScope:v5];
  }
  return v5;
}

- (id)scopeWithLocalScopeIndex:(int64_t)a3
{
  id v5 = -[_CPLEngineScopeCache scopeWithLocalIndex:](self->_scopeCache, "scopeWithLocalIndex:");
  if (!v5)
  {
    int64_t v6 = [(CPLEngineStorage *)self platformObject];
    id v5 = [v6 scopeWithLocalIndex:a3];

    [(CPLEngineScopeStorage *)self _cacheScope:v5];
  }
  return v5;
}

- (id)_scopeWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_CPLEngineScopeCache *)self->_scopeCache scopeWithIdentifier:v4];
  if (!v5)
  {
    int64_t v6 = [(CPLEngineStorage *)self platformObject];
    id v5 = [v6 scopeWithIdentifier:v4];

    [(CPLEngineScopeStorage *)self _cacheScope:v5];
  }

  return v5;
}

- (void)_removeBrokenScope:(id)a3
{
  id v4 = a3;
  scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  id v8 = v4;
  if (!scopesToRemoveFromBrokenScopes)
  {
    int64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = self->_scopesToRemoveFromBrokenScopes;
    self->_scopesToRemoveFromBrokenScopes = v6;

    id v4 = v8;
    scopesToRemoveFromBrokenScopes = self->_scopesToRemoveFromBrokenScopes;
  }
  [(NSMutableArray *)scopesToRemoveFromBrokenScopes addObject:v4];
}

- (void)_cacheScope:(id)a3
{
}

- (void)_clearScopeCache
{
  id v3 = objc_alloc_init(_CPLEngineScopeCache);
  scopeCache = self->_scopeCache;
  self->_scopeCache = v3;
  MEMORY[0x1F41817F8](v3, scopeCache);
}

- (unint64_t)scopeType
{
  return 0;
}

- (BOOL)openWithError:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPLEngineScopeStorage;
  BOOL v4 = [(CPLEngineStorage *)&v7 openWithError:a3];
  if (v4)
  {
    id v5 = [(CPLEngineStorage *)self engineStore];
    self->_someScopeMightHaveToBePulledByClient = [v5 shouldSyncScopeList];
  }
  return v4;
}

- (CPLEngineScopeStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CPLEngineScopeStorage;
  BOOL v4 = [(CPLEngineStorage *)&v8 initWithEngineStore:a3 name:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(_CPLEngineScopeCache);
    scopeCache = v4->_scopeCache;
    v4->_scopeCache = v5;
  }
  return v4;
}

@end